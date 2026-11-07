#!/usr/bin/env python3
"""Retain the complete current AS-body F/A projection without guessed targets.

This checks immutable saved Ghidra reference/body observations and original
instruction prefixes. A Rust Location in a body supplies context, not semantic
ownership, callback identity, a valid enum domain or a missing source feature.
"""
from runtime_layout import retained_runtime_path
from portable_paths import portable_json, portable_record
import argparse
import bisect
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import json
from pathlib import Path

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script


SHA = '6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f'
PROOF = ROOT / 'docs/analysis/evidence/computed-source-frontier.json'
OUTPUT = ROOT / 'runtime/analysis/history/findings/q41-computed-context/0331bdd120bb/contextual-sites.jsonl.gz'
PREFIXES = ('crates/wenilla-rogue/', 'crates/wenilla-rogue-app/')


def digest(data):
    return hashlib.sha256(data).hexdigest()


def run(write):
    import capstone
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.119.0'
    image = target_bytes(target)
    proof_path = ROOT / 'docs/analysis/evidence/native-residuals-comparison-2.json'
    proof = json.loads(proof_path.read_text())
    assert proof['target']['sha256'] == SHA
    inputs = [dict(path=proof_path.relative_to(ROOT).as_posix(), sha256=file_sha256(proof_path))]

    def consume(name):
        row = proof['artifacts'][name]
        path = retained_runtime_path(ROOT / row['path'], ROOT)
        assert file_sha256(path) == row['sha256'], name
        inputs.append(dict(path=row['path'], sha256=row['sha256'], rows=row['rows']))
        return path

    owners = defaultdict(set)
    count = 0
    with gzip.open(consume('diagnostic-sites.jsonl.gz'), 'rt') as stream:
        for line in stream:
            row = json.loads(line)
            count += 1
            if row['actual_body_owner'] and row['path'].startswith(PREFIXES):
                owners[row['actual_body_owner']].add(row['path'])
    assert count == proof['artifacts']['diagnostic-sites.jsonl.gz']['rows']
    selected = []
    full_populations = {}
    for name, lead in [('declared-indirect-sites.tsv.gz', 'Q41-F01'),
                       ('complement-indirect-sites.tsv.gz', 'Q41-F02')]:
        count = 0
        with gzip.open(consume(name), 'rt') as stream:
            for row in csv.DictReader(stream, delimiter='\t'):
                count += 1
                if row['source_owner'] in owners:
                    selected.append(dict(row, lead_id=lead))
        assert count == proof['artifacts'][name]['rows']
        full_populations[lead] = count

    unowned = set()
    with gzip.open(consume('unowned-executable-destinations.tsv.gz'), 'rt') as stream:
        for row in csv.DictReader(stream, delimiter='\t'):
            unowned.add(row['destination'])
    assert len(unowned) == proof['artifacts']['unowned-executable-destinations.tsv.gz']['rows']
    reference_count, contextual_references, incoming = 0, 0, []
    with gzip.open(consume('static-reference-roles.tsv.gz'), 'rt') as stream:
        for row in csv.DictReader(stream, delimiter='\t'):
            reference_count += 1
            if row['source_owner'] in owners:
                contextual_references += 1
                if row['to'] in unowned:
                    incoming.append(row)
    assert reference_count == proof['artifacts']['static-reference-roles.tsv.gz']['rows']

    pe_module = load_script('computed_frontier_pe', ROOT / 'scripts/inventory-executable.py')
    register_module = load_script('computed_frontier_registers', ROOT / 'scripts/classify-native-ownership.py')
    expressions = load_script('computed_frontier_expression', ROOT / 'scripts/classify-as-indirect-contracts.py')
    pe = pe_module.PE(image)
    extents = pe.functions()
    starts = [pe.image_base + row[0] for row in extents]
    imports = {int(row['iat_start_address'], 16) + index * 8: (row['library'], symbol)
               for row in pe.imports() for index, symbol in enumerate(row['functions'])}
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    decoded = {}
    results = []
    for row in sorted(selected, key=lambda row: int(row['site'], 16)):
        site = int(row['site'], 16)
        ordinal = bisect.bisect_right(starts, site) - 1
        first, last, _ = extents[ordinal]
        assert pe.image_base + first <= site < pe.image_base + last
        if ordinal not in decoded:
            offset = pe.rva_offset(first)
            decoded[ordinal] = list(decoder.disasm(image[offset:offset + last - first], pe.image_base + first))
        instructions = decoded[ordinal]
        index = next(i for i, instruction in enumerate(instructions) if instruction.address == site)
        transfer = instructions[index]
        assert (row['kind'] == 'call_indirect' and transfer.group(capstone.CS_GRP_CALL)
                or row['kind'] == 'jump_indirect' and transfer.group(capstone.CS_GRP_JUMP))
        shape = expressions.shape(instructions[:index], transfer, capstone, register_module.canonical_register)
        operand = transfer.operands[0]
        slot = None
        if operand.type == capstone.x86_const.X86_OP_MEM and operand.mem.base == capstone.x86_const.X86_REG_RIP:
            slot = transfer.address + transfer.size + operand.mem.disp
        if slot in imports:
            disposition = 'declared-loader-interface-context'
            question = 'Declared imported interface is supporting engine/OS context; recover a concrete AS caller/behavior discrepancy before expanding it.'
        elif shape:
            disposition = 'relative-table-expression-incoming-domain-unproved'
            question = 'Trace the exact native input discriminant and writers/aliases before admitting a table domain or a source behavior obligation.'
        else:
            disposition = 'receiver-or-register-writer-identity-unproved'
            question = 'Trace incoming receiver/register construction, vtable/slot writes and lifetime; an encoded call alone supplies no concrete dynamic callee.'
        prefix = instructions[max(0, index - 16):index + 1]
        raw = b''.join(bytes(item.bytes) for item in prefix)
        result = dict(lead_id=row['lead_id'], site=hex(site), kind=row['kind'],
                      context_body=row['source_owner'], diagnostic_context=sorted(owners[row['source_owner']]),
                      instruction_bytes=transfer.bytes.hex(), mnemonic=transfer.mnemonic, operand=transfer.op_str,
                      prefix_start=hex(prefix[0].address), prefix_end_exclusive=hex(site + transfer.size),
                      prefix_sha256=digest(raw), disposition=disposition, expression=shape,
                      next_static_question=question, as_semantic_ownership_established=False,
                      source_defect_established=False)
        if slot in imports:
            result['declared_import'] = dict(slot=hex(slot), library=imports[slot][0], symbol=imports[slot][1])
        results.append(result)

    query_root = ROOT / 'runtime/analysis/history/findings/q41-computed-context/0331bdd120bb/party-control-query'
    result_path, = (query_root / 'results').glob('*.json')
    raw = json.loads(result_path.read_text())['structuredContent']
    assert raw['provider']['id'] == 'ghidra'
    assert raw['analysis_profile']['parameters']['entry_point'] == '0x145b74070'
    journal_path = query_root / 'journal.json'
    journal = json.loads(journal_path.read_text())
    assert journal['status'] == 'completed'
    operation, = journal['operations'].values()
    assert operation['arguments'] == {'procedure': '0x145b74070'}
    assert operation['status'] == 'completed'
    assert operation['result']['sha256'] == file_sha256(result_path)
    query_target = ROOT / 'runtime/analysis/history/findings/q41-computed-context/0331bdd120bb/party-control.bin'
    query_offset = pe.rva_offset(0x145b74070 - pe.image_base)
    assert query_target.read_bytes() == image[query_offset:query_offset + 0x493]
    assert raw['subject']['digest']['sha256'] == file_sha256(query_target)
    query = dict(plan=dict(path='runtime/analysis/history/findings/q41-computed-context/0331bdd120bb/party-control-plan.json',
                          sha256=file_sha256(ROOT / 'runtime/analysis/history/findings/q41-computed-context/0331bdd120bb/party-control-plan.json')),
                 journal=dict(path=journal_path.relative_to(ROOT).as_posix(), sha256=file_sha256(journal_path)),
                 result=dict(path=result_path.relative_to(ROOT).as_posix(), sha256=file_sha256(result_path)),
                 evidence_id=raw['evidence_id'], analysis_profile_digest=raw['analysis_profile']['digest'],
                 input_sha256=raw['subject']['digest']['sha256'],
                 normalized_sha256=digest(raw['normalized_result'].encode()))
    # Conditional current cells only: the selected native reader accepts a byte,
    # with no local range check. Do not infer a ten-cell native type from source.
    table = 0x1475e67bc
    table_at = pe.rva_offset(table - pe.image_base)
    table_bytes = image[table_at:table_at + 40]
    cells = [table + int.from_bytes(table_bytes[i:i + 4], 'little', signed=True) for i in range(0, 40, 4)]
    assert cells == [0x145b740cf, 0x145b743d8, 0x145b743e5, 0x145b74378, 0x145b744bb,
                     0x145b743fd, 0x145b7445c, 0x145b743f2, 0x145b74489, 0x145b743cd]
    party = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs').read_text()
    method = party[party.index('    pub fn party_control('):party.index('    pub fn update_party_world_flags(')]
    assert all(f'{i} =>' in method for i in range(10))
    assert 'self.with_party_hero(slot,' in method
    payload = ''.join(json.dumps(row, sort_keys=True, separators=(',', ':')) + '\n' for row in results).encode()
    if write:
        OUTPUT.parent.mkdir(parents=True, exist_ok=True)
        with OUTPUT.open('wb') as file:
            with gzip.GzipFile(filename='', mode='wb', fileobj=file, mtime=0) as stream:
                stream.write(payload)
    else:
        with gzip.open(OUTPUT, 'rb') as stream:
            assert stream.read() == payload
    receipt = dict(schema_version=1, target={key: target[key] for key in ('version', 'sha256', 'size_bytes')},
                   generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(), sha256=file_sha256(Path(__file__))),
                   dependencies=[dict(path=name, sha256=file_sha256(ROOT / name)) for name in
                                 ('scripts/coverage_common.py', 'scripts/script_sources.py', 'scripts/inventory-executable.py',
                                  'scripts/classify-native-ownership.py', 'scripts/classify-as-indirect-contracts.py')],
                   inputs=inputs, as_diagnostic_context_bodies=len(owners), full_indirect_populations=full_populations,
                   counts=dict(context_sites=len(results), dispositions=dict(Counter(row['disposition'] for row in results)),
                               all_static_references=reference_count, contextual_static_references=contextual_references,
                               unowned_executable_targets=len(unowned), contextual_incoming_unowned_edges=len(incoming)),
                   incoming_unowned_edges=incoming,
                   artifact=dict(path=OUTPUT.relative_to(ROOT).as_posix(), sha256=file_sha256(OUTPUT), rows=len(results)),
                   party_control_classification=dict(site='0x145b740cd', body_start='0x145b74070', body_end_exclusive='0x145b74503',
                                                     original_query=query, query_input_sha256=file_sha256(query_target),
                                                     bounded_cells=[hex(cell) for cell in cells], table_start=hex(table),
                                                     table_prefix_sha256=digest(table_bytes),
                                                     source_candidate='crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs::party_control',
                                                     source_method_sha256=digest(method.encode()),
                                                     classification='AS party-control dispatch and remote-context wrapper; existing source handles ten selected actions.',
                                                     unresolved='No local native index bound; complete native wire/local control producer and arbitrary input aliases are not proved by this raw-range query. No new source defect identified.'),
                   gap_ids=[41], lead_ids=['Q41-F01', 'Q41-F02', 'Q41-A01', 'Q41-A02', 'Q41-M01'],
                   source_defect_established=False, source_repair='Separate current native guest Engine predicate/wire consumer repaired under #180.',
                   generic_engine_reconstruction_authorized=False, native_semantic_frontier_complete=False,
                   parity_verified=False,
                   limits=['Only exact saved-Program AS Rust-Location body contexts are selected; erased, inline or ownerless AS code is not excluded from the wider queue.',
                           'A zero contextual incoming-unowned projection does not establish all AS direct/address dependency closure.',
                           'Every contextual computed site retains exact bytes/prefix and an incoming-state question; expression shape does not prove table bounds, callbacks, source semantics or missing implementation.',
                           'Declared loader interfaces remain supporting context and do not authorize generic engine recovery.',
                           'The party-control query classifies this branch and existing source correspondence; it does not admit arbitrary byte selectors or prove native full type/alias closure.',
                           'No compilation, game/client/network/server execution or original/rebuilt parity comparison.'])
    for row in inputs:
        assert file_sha256(retained_runtime_path(ROOT / row['path'], ROOT)) == row['sha256']
    if write:
        PROOF.write_text(portable_json(receipt, indent=2) + '\n')
    else:
        assert portable_record(receipt) == portable_record(json.loads(PROOF.read_text()))
    return receipt['counts']


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-proof', action='store_true')
    print(json.dumps(run(parser.parse_args().write_proof), sort_keys=True))
