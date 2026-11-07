#!/usr/bin/env python3
"""Classify complete expanded Q41 code residuals without assigning game semantics.

Read immutable saved Ghidra exports and exact installed bytes. No native query,
compilation or execution. --write publishes the reviewed compact receipt.
"""
from runtime_layout import retained_runtime_path
import argparse
from bisect import bisect_right
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from derived_gzip import derived_gzip_text

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
WORK = ROOT/'runtime/analysis/history/findings/q41-expanded-ownership/6304bee20684'
PROOF = ROOT/'docs/analysis/evidence/0.115.0/expanded-code-ownership.json'


def rows(path):
    with gzip.open(path, 'rt') as stream:
        yield from csv.DictReader(stream, delimiter='\t')


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT/path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def main():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--write', action='store_true')
    args = ap.parse_args()
    generator_sha256 = file_sha256(Path(__file__))
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    identity = {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(target)
    WORK.mkdir(parents=True, exist_ok=True)
    inputs = {}

    def checked(record):
        path = retained_runtime_path(ROOT/record['path'], ROOT)
        assert file_sha256(path) == record['sha256'], str(path)
        inputs[record['path']] = dict(path=record['path'], sha256=record['sha256'])
        return path

    def read(path):
        return json.loads(checked(dict(path=path, sha256=file_sha256(ROOT/path))).read_text())

    dependencies = [dict(path=path,sha256=file_sha256(ROOT/path)) for path in (
        'scripts/coverage_common.py','scripts/derived_gzip.py',
        'scripts/inventory-executable.py','scripts/summarize-native-image.py')]
    for record in dependencies:
        checked(record)

    residual = read('docs/analysis/evidence/0.115.0/execheck-residuals.json')
    census = read('docs/analysis/coverage/full-image-execheck-0.115.0.json')
    canonical = read('docs/analysis/evidence/0.115.0/native-residuals.json')
    data = read('docs/analysis/evidence/0.115.0/data-classification/manifest.json')
    assert all(value['target'] == identity for value in (residual, census, canonical, data))
    assert census['independent_instructions']['exact_source_bytes_verified']
    artifacts = residual['artifacts']
    paths = {name: checked(artifacts[name]) for name in (
        'ownerless-instructions.tsv.gz', 'ownerless-reference-sources.tsv.gz',
        'unowned-executable-destinations.tsv.gz', 'static-reference-roles.tsv.gz',
        'diagnostic-sites.jsonl.gz')}
    body_path = checked(dict(path=census['artifacts']['directory']+'/bodies.tsv.gz',
                            sha256=census['artifacts']['files']['bodies.tsv.gz']['sha256']))
    instruction_path = checked(dict(path=census['artifacts']['directory']+'/instructions.tsv.gz',
                                   sha256=census['artifacts']['files']['instructions.tsv.gz']['sha256']))
    range_path = checked(census['independent_instructions']['executable_sections']['range_inventory'])
    canonical_path = checked(canonical['artifacts']['ownerless-reference-sources.tsv.gz'])
    pe = module('expanded_ownership_pe', 'scripts/inventory-executable.py').PE(image)
    helper = module('expanded_ownership_census', 'scripts/summarize-native-image.py')
    bodies = [(int(r['start'],16), int(r['end'],16), int(r['entry'],16))
              for r in rows(body_path) if r['external'] == 'false']
    owner = helper.owner_lookup(bodies)
    extents = sorted((pe.image_base+a, pe.image_base+b) for a,b,_ in pe.functions())
    starts = [a for a,b in extents]

    def extent(address):
        index = bisect_right(starts, address)-1
        return extents[index] if index >= 0 and address < extents[index][1] else None

    def section(address):
        return next((r['name'] for r in pe.sections if pe.image_base+r['rva'] <= address
                     < pe.image_base+r['rva']+r['virtual_size']), 'PE-headers-or-external')

    def raw(address, size):
        offset = pe.rva_offset(address-pe.image_base)
        result = image[offset:offset+size]
        assert len(result) == size
        return result

    by_body, by_extent, diagnostic_sites = defaultdict(set), defaultdict(set), defaultdict(set)
    with gzip.open(paths['diagnostic-sites.jsonl.gz'], 'rt') as stream:
        for line in stream:
            row = json.loads(line)
            # The older collector's endswith(party.rs) class includes a shared
            # benilla-ui path. Only actual custom game/app paths seed AS context.
            if not row['path'].startswith(('crates/wenilla-rogue/', 'crates/wenilla-rogue-app/')):
                continue
            site = int(row['instruction_address'],16)
            diagnostic_sites[site].add(row['path'])
            actual, declared = owner(site), extent(site)
            if actual is not None:
                by_body[actual].add(row['path'])
            if declared is not None:
                by_extent[declared].add(row['path'])

    instructions = {int(r['address'],16): r for r in rows(paths['ownerless-instructions.tsv.gz'])}
    assert len(instructions) == artifacts['ownerless-instructions.tsv.gz']['rows'] == 73536
    parent = {site: site for site in instructions}

    def find(site):
        while parent[site] != site:
            parent[site] = parent[parent[site]]
            site = parent[site]
        return site

    def union(a,b):
        a,b = find(a),find(b)
        if a != b:
            parent[max(a,b)] = min(a,b)

    # Undirected component membership is topology only; calls remain interfaces.
    fallthrough = {'FALL_THROUGH','CONDITIONAL_JUMP','UNCONDITIONAL_CALL','COMPUTED_CALL'}
    for site,row in instructions.items():
        assert owner(site) is None and raw(site,int(row['length'])).hex() == row['bytes']
        successor = site+int(row['length'])
        if row['flow'] in fallthrough and successor in instructions:
            union(site,successor)

    canonical_pairs = Counter((r['from'],r['to'],r['type']) for r in rows(canonical_path))
    assert sum(canonical_pairs.values()) == 775329 and set(t for _,_,t in canonical_pairs) == {'DATA'}
    expanded_metadata, code_refs, reference_domains = Counter(), [], Counter()
    for row in rows(paths['ownerless-reference-sources.tsv.gz']):
        a = int(row['from'],16)
        assert owner(a) is None
        sec = section(a)
        reference_domains[(sec,row['type'])] += 1
        if sec == '.text':
            assert a in instructions
            code_refs.append(row)
            b = int(row['to'],16)
            if row['type'] in {'CONDITIONAL_JUMP','UNCONDITIONAL_JUMP'} and b in instructions:
                union(a,b)
        else:
            expanded_metadata[(row['from'],row['to'],row['type'])] += 1
    assert expanded_metadata == canonical_pairs
    assert len(code_refs) == 14713
    print('Verified all 790042 ownerless reference sources; metadata rows exactly match the canonical field set.',flush=True)

    # The producer appends declared then outside-declared intervals. Sort their
    # actual VAs before binary-search joins and the streaming predecessor sweep.
    missing = sorted(rows(range_path), key=lambda row:int(row['start'],16))
    missing_starts = [int(row['start'],16) for row in missing]
    assert all(int(a['end_exclusive'],16) <= int(b['start'],16) for a,b in zip(missing,missing[1:]))
    for row in missing:
        a,b = int(row['start'],16),int(row['end_exclusive'],16)
        assert b-a == int(row['byte_count']) and hashlib.sha256(raw(a,b-a)).hexdigest() == row['sha256']

    def missing_index(address):
        index = bisect_right(missing_starts,address)-1
        return index if index >= 0 and address < int(missing[index]['end_exclusive'],16) else None

    incoming = defaultdict(list)
    missed_references = []
    total_references = 0
    for row in rows(paths['static-reference-roles.tsv.gz']):
        total_references += 1
        try:
            a,b = int(row['from'],16),int(row['to'],16)
        except ValueError:
            continue
        if b in instructions:
            incoming[b].append((a,row['type']))
        if missing_index(b) is not None:
            missed_references.append(row)
    destinations = {int(row['destination'],16):int(row['reference_records'])
                    for row in rows(paths['unowned-executable-destinations.tsv.gz'])}
    assert total_references == artifacts['static-reference-roles.tsv.gz']['rows']
    assert set(incoming) == set(destinations) and all(len(incoming[k]) == v for k,v in destinations.items())
    assert not missed_references
    assert all(a in instructions and kind in {'CONDITIONAL_JUMP','UNCONDITIONAL_JUMP'}
               for values in incoming.values() for a,kind in values)

    components = defaultdict(list)
    for site in instructions:
        components[find(site)].append(site)
    component_context = defaultdict(set)
    for site in instructions:
        component_context[find(site)].update(by_extent.get(extent(site),set()))
    outgoing_as = []
    for row in code_refs:
        a,b = int(row['from'],16),int(row['to'],16)
        if owner(b) in by_body:
            component_context[find(a)].update(by_body[owner(b)])
            outgoing_as.append(dict(site=hex(a),destination=hex(b),type=row['type'],
                                    destination_body=hex(owner(b)),paths=sorted(by_body[owner(b)])))

    outputs = {}

    def receipt(name,count):
        path = WORK/name
        outputs[name] = dict(path=path.relative_to(ROOT).as_posix(),sha256=file_sha256(path),rows=count)

    classes, flows = Counter(), Counter()
    with derived_gzip_text(WORK/'ownerless-instruction-roles.tsv.gz',publish=True) as stream:
        stream.write('site\tlength\tflow\tdeclared_start\tdeclared_end_exclusive\tcomponent\tdiagnostic_site\tAS_context_paths\n')
        for site,row in sorted(instructions.items()):
            e = extent(site)
            context = sorted(component_context[find(site)])
            classes[('declared' if e else 'outside-declared')+(':AS-context' if context else ':ownership-unestablished')] += 1
            flows[row['flow']] += 1
            stream.write('\t'.join([hex(site),row['length'],row['flow'],hex(e[0]) if e else '',hex(e[1]) if e else '',
                         hex(find(site)),str(site in diagnostic_sites).lower(),json.dumps(context,separators=(',',':'))])+'\n')
    receipt('ownerless-instruction-roles.tsv.gz',len(instructions))
    records = []
    for key,sites in sorted(components.items()):
        sites.sort()
        records.append(dict(component=hex(key),instruction_records=len(sites),observed_bytes=sum(int(instructions[a]['length']) for a in sites),
            site_set_sha256=hashlib.sha256(''.join(hex(a)+'\n' for a in sites).encode()).hexdigest(),
            declared_extents=sorted({tuple(hex(x) for x in extent(a)) for a in sites if extent(a)}),
            diagnostic_sites=[hex(a) for a in sites if a in diagnostic_sites],AS_context_paths=sorted(component_context[key]),
            classification='AS_context_without_complete_inputs_or_semantics' if component_context[key] else 'ownership_unestablished',
            complete_function_or_reachability=False))
    with derived_gzip_text(WORK/'ownerless-components.jsonl.gz',publish=True) as stream:
        for row in records:
            stream.write(json.dumps(row,separators=(',',':'))+'\n')
    receipt('ownerless-components.jsonl.gz',len(records))

    # Every unobserved interval receives its actual immediately adjacent saved
    # instruction boundaries. A previous terminator is not proof of padding.
    missing_boundaries, cursor, previous = [], 0, None
    total_instructions = 0
    for row in rows(instruction_path):
        total_instructions += 1
        a = int(row['address'],16)
        while cursor < len(missing) and missing_starts[cursor] < a:
            original = missing[cursor]
            b = int(original['end_exclusive'],16)
            assert a >= b
            before = previous if previous and int(previous['address'],16)+int(previous['length']) == missing_starts[cursor] else None
            after = row if a == b else None
            missing_boundaries.append(dict(original,previous_instruction=before,next_instruction=after))
            cursor += 1
        previous = row
    while cursor < len(missing):
        missing_boundaries.append(dict(missing[cursor],previous_instruction=previous if previous and int(previous['address'],16)+int(previous['length']) == missing_starts[cursor] else None,next_instruction=None))
        cursor += 1
    assert total_instructions == census['counts']['instructions'] and len(missing_boundaries) == 463115
    boundary_counts, byte_counts, AS_boundaries = Counter(), Counter(), Counter()
    AS_range_count = AS_range_bytes = 0
    fallthrough_boundaries = []
    decoder = Cs(CS_ARCH_X86,CS_MODE_64)
    with derived_gzip_text(WORK/'missing-range-boundaries.tsv.gz',publish=True) as stream:
        stream.write('start\tend_exclusive\tbyte_count\tlocation\tcategory\tprevious_site\tprevious_flow\tnext_site\tnext_body_owner\tAS_declared_context_paths\n')
        for row in missing_boundaries:
            before,after = row['previous_instruction'],row['next_instruction']
            context = sorted(by_extent.get(extent(int(row['start'],16)),set()))
            key = row['location']+':'+(before['flow'] if before else 'no-adjacent-saved-predecessor')
            boundary_counts[key] += 1
            byte_counts[row['location']+':'+row['category']] += int(row['byte_count'])
            if context:
                AS_range_count += 1
                AS_range_bytes += int(row['byte_count'])
                AS_boundaries[row['category']+':'+(before['flow'] if before else 'no-adjacent-saved-predecessor')] += 1
            if before and before['flow'] == 'FALL_THROUGH':
                site = int(row['start'],16)
                instruction = next(decoder.disasm(raw(site,15),site,count=1))
                fallthrough_boundaries.append(dict(start=hex(site),end_exclusive='0x'+row['end_exclusive'],
                    byte_count=int(row['byte_count']),category=row['category'],AS_context_paths=context,
                    first_instruction=dict(bytes=instruction.bytes.hex(),mnemonic=instruction.mnemonic,operands=instruction.op_str)))
            stream.write('\t'.join([row['start'],row['end_exclusive'],row['byte_count'],row['location'],row['category'],
                before['address'] if before else '',before['flow'] if before else '',after['address'] if after else '',
                hex(owner(int(after['address'],16))) if after and owner(int(after['address'],16)) is not None else '',
                json.dumps(context,separators=(',',':'))])+'\n')
    receipt('missing-range-boundaries.tsv.gz',len(missing_boundaries))
    assert sum(int(r['byte_count']) for r in missing) == 8496512
    assert sum(int(r['byte_count']) for r in missing if r['location']=='declared') == 5232300
    print('Verified all 463115 missing ranges and adjacent saved-instruction boundaries.',flush=True)

    proof = dict(schema_version=1,target=identity,gap_ids=[41],lead_ids=['Q41-U01','Q41-U03','Q41-B01','Q41-M01','Q41-A01'],
        generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(),sha256=generator_sha256),
        dependencies=dependencies,
        inputs=sorted(inputs.values(),key=lambda r:r['path']),outputs=outputs,
        counts=dict(ownerless_instructions=len(instructions),ownerless_instruction_classes=dict(sorted(classes.items())),
            ownerless_flow_kinds=dict(sorted(flows.items())),ownerless_components=len(components),
            components_with_AS_context=sum(bool(component_context[k]) for k in components),
            AS_context_components_without_direct_AS_diagnostic=sum(bool(component_context[k]) and not any(a in diagnostic_sites for a in sites) for k,sites in components.items()),
            ownerless_AS_diagnostic_instruction_sites=sum(a in instructions for a in diagnostic_sites),
            ownerless_reference_records=sum(reference_domains.values()),canonical_metadata_reference_records=sum(expanded_metadata.values()),
            executable_ownerless_reference_records=len(code_refs),ownerless_source_domains=[dict(section=k[0],type=k[1],records=v) for k,v in sorted(reference_domains.items())],
            unowned_executable_destinations=len(destinations),incoming_edges_to_unowned_destinations=sum(len(v)for v in incoming.values()),
            incoming_edge_types=dict(Counter(kind for v in incoming.values()for _,kind in v)),
            owned_source_edges_to_unowned_destinations=0,encoded_edges_into_missing_ranges=0,
            unobserved_ranges=len(missing),unobserved_bytes=8496512,missing_range_previous_flow=dict(sorted(boundary_counts.items())),
            AS_context_missing_ranges=AS_range_count,AS_context_missing_bytes=AS_range_bytes,
            AS_context_missing_candidate_and_predecessor=dict(sorted(AS_boundaries.items())),
            unobserved_bytes_by_location_and_candidate_kind=dict(sorted(byte_counts.items()))),
        ownerless_outgoing_AS_interfaces=outgoing_as,
        fallthrough_boundaries=fallthrough_boundaries,
        canonical_metadata_roles=data['ownerless_reference_sources']['domains'],
        global_aliasing_complete=False,source_semantics_complete=False,unobserved_bytes_classified_as_padding=False,parity_verified=False,
        limits=['Full populations are projected; component membership is undirected fallthrough/branch topology, never a proved function, execution path or source owner.',
            'An exact custom diagnostic or shared declared interval is AS context only. Adjacent path literals retain their established bounded meanings.',
            'Zero encoded incoming edges in the saved export does not exclude computed, erased, unwind, unexported or runtime entries.',
            'Canonical metadata field roles are reused only after complete source/destination/type multiset equality, not from equal totals.',
            'No generic engine recovery, application compilation, native/game execution or original/rebuilt comparison.'])
    for record in inputs.values():
        assert file_sha256(retained_runtime_path(ROOT/record['path'], ROOT)) == record['sha256'], record['path']
    assert file_sha256(Path(__file__)) == generator_sha256, 'Generator changed during derivation'
    text = json.dumps(proof,indent=2)+'\n'
    (WORK/'proof.json').write_text(text)
    if args.write:
        PROOF.write_text(text)
    else:
        assert json.loads(PROOF.read_text()) == proof, 'Curated proof differs; inspect runtime proposal before --write'
    print(json.dumps(proof['counts'],indent=2))


if __name__ == '__main__':
    main()
