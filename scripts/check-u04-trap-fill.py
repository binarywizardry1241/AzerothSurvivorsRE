#!/usr/bin/env python3
"""Replay Q41-U04 trap-fill or complement stop evidence without running the target."""
from runtime_layout import retained_runtime_path
from portable_paths import portable_json
import argparse
from bisect import bisect_right
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import json
import sqlite3
from pathlib import Path

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
import capstone
from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script, recorded_input_matches
from shared_native_inventory import open_readonly_uri as open_native_inventory

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
START, END = 0x145807d86, 0x145807d90
OUT = ROOT / 'docs/analysis/evidence/0.113.2/u04-trap-fill.json'
PROBE = ROOT / 'runtime/analysis/history/findings/fixgap-u04/0947d2a831c0/rea-bounded'


def load(path):
    return json.loads(path.read_text())


def commitment(path):
    return {'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)}


def committed(record):
    path = retained_runtime_path(ROOT / record['path'], ROOT)
    assert path.resolve().is_relative_to(ROOT), 'Input escapes checkout'
    assert file_sha256(path) == record['sha256'], f'Input drift: {path}'
    return path


def tsv(path):
    with gzip.open(path, 'rt') as stream:
        yield from csv.DictReader(stream, delimiter='\t')


def derive(generator):
    target = latest_target(verify=True)
    assert target['version'] == '0.113.2' and target['sha256'] == SHA
    queue_path = ROOT / 'docs/analysis/evidence/0.113.2/unknown-recovery.json'
    queue = load(queue_path)
    assert queue['target']['sha256'] == SHA
    census_path = committed(queue['inputs']['full-image-census'])
    census = load(census_path)
    assert census['target']['sha256'] == SHA
    inventory_path = committed(queue['inputs']['inventory.json'])
    inventory = load(inventory_path)
    image = target_bytes(target)
    section = next(row for row in inventory['pe']['sections'] if row['name'] == '.text')
    offset = START - int(inventory['pe']['image_base'], 16) - section['rva'] + section['raw_offset']
    raw = image[offset:offset + END - START]
    assert raw == b'\xcc' * 10
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    assert [(ins.address, ins.mnemonic) for ins in decoder.disasm(raw, START)] == [
        (site, 'int3') for site in range(START, END)]
    assert image[offset - 1:offset] == b'\xc3'
    thunk = image[offset + len(raw):offset + len(raw) + 5]
    decoded_thunk = list(decoder.disasm(thunk, END))
    assert len(decoded_thunk) == 1 and decoded_thunk[0].mnemonic == 'jmp'
    assert decoded_thunk[0].op_str == '0x145bb9b80'

    complement_path = committed(queue['inputs']['unwind-complement.sqlite'])
    with open_native_inventory(f'file:{complement_path}?mode=ro', uri=True) as db:
        regions = list(db.execute('SELECT start,end,category FROM regions WHERE start<=? AND end>=?', (START, END)))
        assert regions == [(START, 0x145807da0, 'mixed_or_other')]
        parent_start, parent_end, category = regions[0]
        decoded = list(db.execute('SELECT site,end FROM instructions WHERE end>? AND site<? ORDER BY site',
                                  (parent_start, parent_end)))
        assert decoded == [(END, END + 5)]
        # Exact subtraction in Q41-U04 retains [parent_start, first instruction).
        assert (parent_start, decoded[0][0], category) == (START, END, 'mixed_or_other')
        assert not list(db.execute('SELECT target FROM seeds WHERE target>=? AND target<?', (START, END)))
    encoded_targets = tuple(hex(site) for site in range(START, END))
    placeholders = ','.join('?' for _ in encoded_targets)
    for name in ['unwind-complement.sqlite', 'native-instructions.sqlite']:
        path = committed(queue['inputs'][name])
        with open_native_inventory(f'file:{path}?mode=ro', uri=True) as db:
            assert not list(db.execute(f'SELECT site,kind,target FROM refs WHERE target IN ({placeholders})', encoded_targets))

    directory = ROOT / census['artifacts']['directory']
    bodies_path = committed({'path': (directory / 'bodies.tsv.gz').relative_to(ROOT).as_posix(),
                             'sha256': census['artifacts']['files']['bodies.tsv.gz']['sha256']})
    nearby_bodies = []
    for row in tsv(bodies_path):
        if row['external'] != 'false':
            continue
        a, b = int(row['start'], 16), int(row['end'], 16) + 1
        assert not (a < END and b > START), 'A current body overlaps the selected fill'
        if int(row['entry'], 16) in [0x145807d40, END]:
            nearby_bodies.append([row['entry'], row['start'], row['end']])
    assert nearby_bodies == [['145807d40', '145807d40', '145807d85'], ['145807d90', '145807d90', '145807d94']]
    references_path = committed({'path': (directory / 'references.tsv.gz').relative_to(ROOT).as_posix(),
                                 'sha256': census['artifacts']['files']['references.tsv.gz']['sha256']})
    references_examined = 0
    for row in tsv(references_path):
        references_examined += 1
        if ':' not in row['to']:
            assert not START <= int(row['to'], 16) < END, 'Observed reference enters selected fill'
    assert references_examined == census['counts']['references']

    observations = []
    profile = None
    for path in sorted(PROBE.glob('0*.json')):
        envelope = load(path)
        evidence = envelope.get('response', {}).get('result', {}).get('structuredContent', {})
        if 'evidence_id' not in evidence:
            continue
        assert evidence['subject']['digest']['sha256'] == SHA
        if profile is None:
            profile = evidence['analysis_profile']
        assert evidence['analysis_profile'] == profile
        result = evidence['normalized_result']
        observations.append({'artifact': commitment(path), 'evidence_id': evidence['evidence_id'],
                             'operation': evidence['operation'], 'parameters': evidence['parameters'],
                             'result': result})
    assert len(observations) == 17, 'Incomplete bounded REA probe'
    expected_queries = [
        ('read_bytes', {'address': '0x145807d84', 'length': 44}),
        ('procedure_info', {'procedure': '0x145807d40'}),
        ('procedure_info', {'procedure': hex(END)}),
        ('resolve_containing_procedure', {'address': hex(START)}),
        ('resolve_containing_procedure', {'address': hex(END - 1)}),
        ('inspect_native_instruction', {'address': hex(START - 1)}),
        ('inspect_native_instruction', {'address': hex(END)}),
    ] + [('xrefs', {'address': site}) for site in encoded_targets]
    assert [(row['operation'], row['parameters']) for row in observations] == expected_queries
    assert observations[0]['result']['bytes_hex'] == image[offset - 2:offset - 2 + 44].hex()
    assert observations[1]['result']['body']['ranges'] == [{'start': '0x145807d40', 'end': '0x145807d85'}]
    assert observations[2]['result']['body']['ranges'] == [{'start': hex(END), 'end': hex(END + 4)}]
    assert all(row['result']['found'] is False for row in observations[3:5])
    assert observations[5]['result']['flow']['kind'] == 'return'
    assert observations[6]['result']['flow']['direct_destinations'] == ['0x145bb9b80']
    assert [row['parameters']['address'] for row in observations[7:]] == list(encoded_targets)
    assert all(row['result'] == [] for row in observations[7:])
    # Keep one exact copy of selected native bytes; other observations retain
    # only the facts used here, with original Evidence/envelope commitments.
    for row in observations[5:7]:
        row['result'] = {key: row['result'][key] for key in ['address', 'status', 'procedure', 'mnemonic', 'flow']}
    observations[0]['result'] = {'complete': True, 'matched_installed_file_context': True}
    seed_path = ROOT / 'runtime/analysis/history/findings/fixgap-u04/0947d2a831c0/seeds.tsv'
    assert file_sha256(seed_path) == profile['parameters']['analysis_seeds']['sha256']
    assert load(PROBE / 'run.json')['failure'] is None
    return {'schema_version': 1, 'target': {key: target[key] for key in ['version', 'path', 'sha256', 'size_bytes']},
            'lead_id': 'Q41-U04', 'classification_id': 'Q41-U04-trap-fill-145807d86', 'gap_ids': [41],
            'queue_input': commitment(queue_path), 'selector': queue['selectors']['Q41-U04'],
            'interval': {'section': '.text', 'start_preferred_va': hex(START), 'end_exclusive_preferred_va': hex(END),
                         'rva_start': hex(START - int(inventory['pe']['image_base'], 16)), 'file_offset': hex(offset),
                         'bytes_hex': raw.hex(), 'sha256': hashlib.sha256(raw).hexdigest(), 'original_parent_category': category},
            'classification': 'supporting_inter_function_trap_fill_pattern', 'classification_confidence': 'inferred',
            'AS_contract_established': False, 'dynamic_unreachability_proven': False, 'census_bytes_removed': 0,
            'inputs': [commitment(path) for path in [census_path, inventory_path, complement_path, bodies_path, references_path]],
            'static_reference_records_examined': references_examined, 'observed_references_into_interval': 0,
            'neighbor_body_ranges_inclusive': nearby_bodies,
            'rea': {'provider': profile['provider'], 'original_profile_digest': profile['digest'],
                    'disabled_analyzers': profile['parameters']['analysis_options']['disabled_analyzers'],
                    'seed_input': commitment(seed_path), 'seed_rows': seed_path.read_text().splitlines(),
                    'plan': commitment(PROBE / 'plan.json'), 'observations': observations},
            'limits': ['INT3 is executable; absent observed references do not rule out dynamic/computed entry.',
                       'Fresh xrefs cover the three-entry seeded Program with reference analyzers disabled; the separately hash-verified full census supplies the broader observed-reference inventory.',
                       'The adjacent fonts.rs correspondence does not establish ownership or a live AS font contract for these bytes.',
                       'Only this exact interval is classified. The parent selector, candidate categories and all residual counts remain unchanged.',
                       'No reconstructed source change, compilation, game execution or original/rebuilt parity claim.'],
            'generator': generator}


def interval_lookup(rows):
    starts = [row[0] for row in rows]
    assert all(a[1] <= b[0] for a, b in zip(rows, rows[1:]))

    def locate(site):
        index = bisect_right(starts, site) - 1
        return rows[index] if index >= 0 and site < rows[index][1] else None

    return locate


def complement_stops():
    target = latest_target(verify=True)
    identity = {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    analysis = ROOT / 'docs/analysis'
    version = identity['version']
    evidence = analysis / 'evidence' / version
    inputs = [commitment(path) for path in (
        evidence / 'unknown-recovery.json', evidence / 'native-residuals.json',
        analysis / 'coverage/unwind-complement-summary.json',
        analysis / f'coverage/full-image-selected-{version}.json',
    )]
    queue, residual, summary, census = (load(committed(record)) for record in inputs)
    assert all(record['target'] == identity for record in (queue, residual, summary, census))
    selector = next(row for row in queue['sqlite_selectors'] if row['lead_id'] == 'Q41-U04')
    assert selector['selector'] == 'SELECT * FROM stops ORDER BY site,reason'

    def residual_artifact(name):
        return committed(residual['artifacts'][name])

    def census_artifact(name):
        return committed({'path': f"{census['artifacts']['directory']}/{name}",
                          'sha256': census['artifacts']['files'][name]['sha256']})

    def json_rows(path):
        with gzip.open(path, 'rt') as stream:
            yield from map(json.loads, stream)

    def spans(name):
        return [(int(row['start'], 16), int(row['end_exclusive'], 16))
                for row in tsv(residual_artifact(name))]

    extent = interval_lookup(spans('declared-extent-roles.tsv.gz'))
    region = interval_lookup(spans('complement-region-roles.tsv.gz'))
    body = interval_lookup(sorted(
        (int(row['start'], 16), int(row['end'], 16) + 1, int(row['entry'], 16))
        for row in tsv(census_artifact('bodies.tsv.gz')) if row['external'] == 'false'))
    context = defaultdict(set)
    for row in json_rows(residual_artifact('diagnostic-sites.jsonl.gz')):
        if row['actual_body_owner'] and row['path'].startswith(('crates/wenilla-rogue/', 'crates/wenilla-rogue-app/')):
            context[int(row['actual_body_owner'], 16)].add(row['path'])

    pe = load_script('u04_pe', 'scripts/inventory-executable.py').PE(target_bytes(target))
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    native = load_script('u04_native', 'scripts/inventory-native-instructions.py')
    slots = {int(dll['iat_start_address'], 16) + 8 * index
             for dll in pe.imports() for index in range(len(dll['functions']))}
    stops = list(json_rows(residual_artifact('complement-stops.jsonl.gz')))
    inventory = committed(summary['inventory'])
    with open_native_inventory(inventory.as_uri() + '?mode=ro', uri=True) as db:
        assert [(int(row['site'], 16), row['reason']) for row in stops] == list(db.execute(selector['selector']))
        preceding = {end: (site, raw, mnemonic, operands) for site, end, raw, mnemonic, operands
                     in db.execute('SELECT site,end,bytes,mnemonic,operands FROM instructions ORDER BY site')}
    assert len(stops) == selector['records']
    reasons = Counter(row['reason'] for row in stops)
    assert reasons == summary['counts']['stop_reasons']
    assert set(reasons) <= {'outside_file_backed_complement', 'jump_no_fallthrough',
                            'return', 'trap_or_privileged_exit'}

    jumps = Counter()
    starts, destinations = {}, set()
    boundary, traps, as_context = [], {}, []
    for row in stops:
        site = int(row['site'], 16)
        reason = row['reason']
        owner = body(site)
        assert owner and owner[2] == int(row['observed_body_owner'], 16)
        if owner[2] in context:
            as_context.append({'stop': hex(site), 'owner': hex(owner[2]), 'reason': reason,
                               'diagnostic_paths': sorted(context[owner[2]])})
        if reason == 'outside_file_backed_complement':
            declared, complement = extent(site), region(site - 1)
            assert declared and complement and declared[0] == complement[1] == site
            assert row['bytes'] is None and not row['references'] and site in preceding
            previous, previous_bytes, mnemonic, operands = preceding[site]
            boundary.append({'site': hex(site), 'complement_start': hex(complement[0]),
                             'declared_end_exclusive': hex(declared[1]),
                             'predecessor': hex(previous), 'predecessor_bytes': previous_bytes,
                             'predecessor_instruction': f'{mnemonic} {operands}'.rstrip()})
            starts[site] = None
            continue

        raw = bytes.fromhex(row['bytes'])
        offset = pe.rva_offset(site - pe.image_base)
        assert pe.data[offset:offset + len(raw)] == raw
        instruction = next(decoder.disasm(raw, site, count=1))
        assert instruction.size == len(raw) == int(row['instruction_end'], 16) - site
        assert (instruction.mnemonic, instruction.op_str) == (row['mnemonic'], row['operands'])
        starts[site] = row['bytes']
        refs = native.instruction_references(instruction, capstone)
        assert Counter((kind, hex(address) if address is not None else None)
                       for kind, address, _, _ in refs) == Counter(
                           (r['kind'], r['target']) for r in row['references'])
        if reason == 'jump_no_fallthrough':
            assert instruction.id in (capstone.x86_const.X86_INS_JMP, capstone.x86_const.X86_INS_LJMP)
            transfer = next((kind, address) for kind, address, _, _ in refs if kind.startswith('jump_'))
            kind, destination = transfer
            if kind == 'jump_direct':
                destinations.add(destination)
                target_body = body(destination)
                assert target_body
                declared = extent(destination)
                if declared:
                    jumps['direct_declared_entry' if destination == declared[0] else 'direct_declared_interior'] += 1
                else:
                    assert region(destination)
                    jumps['direct_complement'] += 1
                if target_body[2] in context:
                    as_context.append({'stop': hex(site), 'destination': hex(destination),
                                       'destination_owner': hex(target_body[2]),
                                       'diagnostic_paths': sorted(context[target_body[2]])})
            else:
                slot = next((address for kind, address, _, _ in refs if kind == 'memory'), None)
                jumps['indirect_dynamic_operand' if slot is None else
                      'indirect_import_slot' if slot in slots else 'indirect_other_fixed_slot'] += 1
        elif reason == 'return':
            assert instruction.group(capstone.CS_GRP_RET) or instruction.group(capstone.CS_GRP_IRET)
        else:
            assert instruction.group(capstone.CS_GRP_INT) or instruction.mnemonic in (
                'int1', 'ud0', 'ud1', 'ud2', 'hlt', 'sysret', 'sysretq', 'sysexit')
            previous = preceding.get(site)
            traps[site] = {'site': hex(site), 'owner': hex(owner[2]), 'bytes': row['bytes'],
                           'instruction': f'{row["mnemonic"]} {row["operands"]}'.rstrip(),
                           'predecessor': [hex(previous[0]), *previous[1:]] if previous else None,
                           'incoming_references': []}

    pending = starts.keys() | destinations
    instruction_export = census_artifact('instructions.tsv.gz')
    with gzip.open(instruction_export, 'rt') as stream:
        assert next(stream).rstrip() == 'address\tlength\tbytes\tflow'
        for line in stream:
            address, rest = line.split('\t', 1)
            site = int(address, 16)
            if site in pending:
                if starts.get(site) is not None:
                    assert rest.split('\t', 2)[1] == starts[site]
                pending.remove(site)
                if not pending:
                    break
    assert not pending, 'Stop or direct destination missing from the selected Ghidra instructions'
    reference_total = 0
    for row in tsv(census_artifact('references.tsv.gz')):
        reference_total += 1
        if ':' not in row['to'] and (site := int(row['to'], 16)) in traps:
            traps[site]['incoming_references'].append({'source': '0x' + row['from'], 'kind': row['type']})
    assert reference_total == census['counts']['references']
    return {'schema_version': 1, 'target': identity, 'lead_id': 'Q41-U04', 'gap_ids': [41],
            'generator': commitment(Path(__file__).resolve()), 'inputs': inputs,
            'decoder': {'name': 'Capstone', 'version': capstone.__version__}, 'selector': selector,
            'stop_reasons': reasons, 'owned_observed_stop_starts': len(starts),
            'encoded_jumps': jumps, 'distinct_observed_direct_destinations': len(destinations),
            'boundary_stops': boundary, 'trap_stops': list(traps.values()),
            'static_reference_records_examined': reference_total, 'AS_diagnostic_context': as_context,
            'limits': ['The stops, boundaries and destinations are observations of the independent complement pass and selected saved Ghidra census.',
                       'An import slot is an encoded operand. A fixed or computed destination does not establish runtime execution, reachability or gameplay behavior.',
                       'Diagnostic context does not establish AS semantics. No coverage totals or source/runtime/parity statuses change.']}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true', help='Publish the reviewed compact classification proof')
    parser.add_argument('--complement-stops', action='store_true',
                        help='Print the current retained complement stop classification')
    args = parser.parse_args()
    if args.complement_stops:
        if args.write:
            parser.error('--complement-stops emits a reviewable proof on stdout')
        print(portable_json(complement_stops(), indent=2))
        return
    if args.write:
        proof = derive(commitment(Path(__file__).resolve()))
        OUT.write_text(portable_json(proof, indent=2) + '\n')
    else:
        retained = load(OUT)
        generator = retained['generator']
        assert recorded_input_matches(generator['path'], generator['sha256']), 'Missing retained producer'
        proof = derive(generator)
        assert proof == retained, 'Classification proof drift; review inputs before publication'
    print(json.dumps({'result': 'passed', 'lead': proof['classification_id'], 'selected_bytes': END - START,
                      'references_examined': proof['static_reference_records_examined'], 'REA_started': False,
                      'compilation_run': False, 'game_run': False}))


if __name__ == '__main__':
    main()
