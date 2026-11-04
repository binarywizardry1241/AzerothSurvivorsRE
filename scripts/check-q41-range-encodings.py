#!/usr/bin/env python3
"""Classify exact Q41 residual encodings; never infer padding or reachability.

Default operation is read-only. --stage writes only ignored candidate evidence.
U01/U02 and U04 are independent overlapping inventories, never additive totals.
"""
import argparse
from bisect import bisect_right
import collections
import csv
import gzip
import hashlib
import json
from pathlib import Path
import sys

from coverage_common import ROOT, latest_target, target_bytes, file_sha256, load_json, project_path
from script_sources import load_script

sys.path.insert(0, str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'))
import capstone
from shared_native_inventory import open_readonly_uri as open_native_inventory

PROOF = ROOT / 'docs/analysis/evidence/0.113.2/unknown-recovery.json'
KEEP = ROOT / 'docs/analysis/evidence/0.113.2/residual-encodings.json'
WORK = ROOT / 'runtime/q41-all-0.113.2'


def encoding(raw, address, decoder):
    if raw and raw == b'\xcc' * len(raw):
        return 'uniform-INT3-encoding', len(raw)
    if raw and raw == b'\x90' * len(raw):
        return 'uniform-NOP-encoding', len(raw)
    instructions = list(decoder.disasm_lite(raw, address))
    if instructions and sum(row[1] for row in instructions) == len(raw) and all(
            row[2] in ('nop', 'int3') for row in instructions):
        return 'NOP-INT3-instruction-sequence', len(instructions)
    return 'mixed-unclassified', None


def complement_residuals(db):
    merged = []
    for a, b in db.execute('SELECT site,end FROM instructions ORDER BY site'):
        if merged and a <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(b, merged[-1][1]))
        else:
            merged.append((a, b))
    cursor = 0
    for a, b, category in db.execute('SELECT start,end,category FROM regions ORDER BY start'):
        while cursor < len(merged) and merged[cursor][1] <= a:
            cursor += 1
        j, pos = cursor, a
        while j < len(merged) and merged[j][0] < b:
            x, y = merged[j]
            if x > pos:
                yield pos, min(x, b), category
            pos = max(pos, min(b, y))
            j += 1
            if pos >= b:
                break
        if pos < b:
            yield pos, b, category


def selected_census_frontier(census_path, *, details=False):
    """Join every selected residual to the recorded static target populations."""
    target = latest_target(verify=True)
    identity = {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(target)
    native = load_script('range_encoding_pe', 'scripts/inventory-current-target.py')
    pe = native.pe_parser(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    inputs = {}

    def checked(record):
        path = project_path(record['path'])
        assert file_sha256(path) == record['sha256'], path
        inputs[record['path']] = record['sha256']
        return path

    def summary(path):
        path = project_path(path)
        value = load_json(checked({'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)}))
        assert value['target'] == identity
        return value

    def rows(record):
        with gzip.open(checked(record), 'rt') as stream:
            yield from csv.DictReader(stream, delimiter='\t')

    census = summary(census_path)
    residual = summary(f"docs/analysis/evidence/{identity['version']}/native-residuals.json")
    assert census['independent_instructions']['exact_source_bytes_verified']
    inventory = census['independent_instructions']['executable_sections']
    ranges, counts, sizes = [], collections.Counter(), collections.Counter()
    for row in rows(inventory['range_inventory']):
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert pe.rva_offset(end - 1 - pe.image_base) == offset + end - start - 1
        raw = image[offset:offset + end - start]
        assert len(raw) == int(row['byte_count']) and hashlib.sha256(raw).hexdigest() == row['sha256']
        role, _ = encoding(raw, start, decoder)
        key = f"{row['location']}:{role}"
        counts[key] += 1
        sizes[key] += len(raw)
        ranges.append((start, end, key))
    ranges.sort()
    assert all(a[1] <= b[0] for a, b in zip(ranges, ranges[1:]))
    assert len(ranges) == inventory['unobserved_ranges'] and sum(sizes.values()) == inventory['unobserved_bytes']
    starts = [row[0] for row in ranges]
    hits = collections.defaultdict(list)

    def incoming(domain, kind, source, value):
        index = bisect_right(starts, value) - 1
        if index >= 0 and value < ranges[index][1]:
            hits[index].append((domain, kind, source, hex(value)))

    reference_counts = {}
    for domain, (source, dest, kind) in {
            'static': ('from', 'to', 'type'),
            'declared': ('site', 'target', 'kind'),
            'complement': ('site', 'target', 'kind'),
    }.items():
        record = residual['artifacts'][f'{domain}-reference-roles.tsv.gz']
        count = 0
        for row in rows(record):
            count += 1
            if row['destination_domain'] == 'executable':
                incoming(domain, row[kind], hex(int(row[source], 16)), int(row[dest], 16))
        assert count == record['rows']
        reference_counts[domain] = count

    relocations, _ = native.relocations(pe)
    for site, kind, target_va in relocations:
        if kind == 10 and target_va is not None:
            incoming('PE', 'DIR64', hex(pe.image_base + site), target_va)
    unwind = load_json(checked(census['unwind_handler_input']))
    guarded = load_json(checked(census['guarded_table_input']))
    assert unwind['target'] == guarded['target'] == identity
    for row in unwind['handlers']:
        incoming('PE', 'unwind-handler', row['handler_rva_field_va'], int(row['entry'], 16))
    for row in unwind['directory_entries']:
        incoming('PE', row['role'], row['metadata']['va'], int(row['entry'], 16))
    for table in guarded['tables']:
        for value in table['case_targets']:
            incoming('guarded', 'applied-case', table['site'], int(value, 16))

    addressed_prefixes = []
    for index, references in sorted(hits.items()):
        start, end, key = ranges[index]
        if not key.startswith('outside-declared:'):
            continue
        destinations = sorted({int(value, 16) for _, _, _, value in references})
        for address, bound in zip(destinations, [*destinations[1:], end]):
            offset = pe.rva_offset(address - pe.image_base)
            raw = image[offset:offset + bound - address]
            instructions = []
            for site, size, mnemonic, operands in decoder.disasm_lite(raw, address):
                instructions.append((site, size, mnemonic, operands))
                if mnemonic in ('jmp', 'ret', 'int3', 'ud2'):
                    break
            length = sum(row[1] for row in instructions)
            terminal = instructions[-1][2] if instructions else None
            if terminal not in ('jmp', 'ret', 'int3', 'ud2'):
                terminal = None
            prefix = dict(address=hex(address), bytes=raw[:length].hex(), terminal=terminal,
                          sources=sorted(row[2] for row in references if int(row[3], 16) == address))
            if raw.startswith(b'\x48\x8b\x09\xe9') and length == 8:
                prefix['role'] = 'dereference-rcx-and-tail-jump'
                prefix['tail_target'] = instructions[-1][3]
            addressed_prefixes.append(prefix)

    by_kind = collections.Counter(f'{domain}:{kind}' for values in hits.values() for domain, kind, *_ in values)
    hit_ranges = [dict(start=hex(ranges[index][0]), end_exclusive=hex(ranges[index][1]),
                       encoding=ranges[index][2], references=sorted(hits[index])) for index in sorted(hits)]
    hit_range_digest = hashlib.sha256(json.dumps(hit_ranges, separators=(',', ':')).encode()).hexdigest()
    result = dict(target=identity, gap_ids=[41], lead_ids=['Q41-B01'],
                generator=dict(path='scripts/check-q41-range-encodings.py', sha256=file_sha256(Path(__file__))),
                readers={name: file_sha256(ROOT / name) for name in (
                    'scripts/inventory-current-target.py', 'scripts/inventory-executable.py',
                    'scripts/coverage_common.py')},
                capstone_version=capstone.__version__, inputs=inputs, range_counts=dict(sorted(counts.items())),
                byte_counts=dict(sorted(sizes.items())), reference_counts=reference_counts,
                incoming_counts=dict(sorted(by_kind.items())), hit_range_count=len(hit_ranges),
                hit_ranges_by_encoding=dict(sorted(collections.Counter(row['encoding'] for row in hit_ranges).items())),
                hit_range_sha256=hit_range_digest, addressed_prefixes=addressed_prefixes,
                dynamic_entry_complete=False, padding_proven=False, source_ownership_complete=False)
    if details:
        result['ranges_with_incoming'] = hit_ranges
    return result


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    ap.add_argument('--census-summary', help='Print the selected-target executable residual and incoming-reference join')
    ap.add_argument('--details', action='store_true', help='Include all incoming reference rows with --census-summary')
    args = ap.parse_args()
    if args.census_summary:
        if args.stage:
            ap.error('--stage is only for the historical encoding contract')
        print(json.dumps(selected_census_frontier(args.census_summary, details=args.details), indent=2))
        return
    if args.details:
        ap.error('--details requires --census-summary')
    target = latest_target(verify=True)
    assert target['sha256'] == '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    image = target_bytes(target)
    pe = load_script('residual_pe', 'scripts/inventory-executable.py').PE(image)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    proof = json.loads(PROOF.read_text())
    assert proof['target']['sha256'] == target['sha256']
    names = ['missing-executable-ranges.tsv.gz', 'unwind-complement.sqlite']
    inputs = {name: proof['inputs'][name] for name in names}
    for item in inputs.values():
        assert file_sha256(ROOT / item['path']) == item['sha256']

    # Counterexamples distinguish complete encoding from an arbitrary plausible decode.
    for raw, wanted in [(b'\xcc', 'uniform-INT3-encoding'), (b'\x90', 'uniform-NOP-encoding'),
            (bytes.fromhex('660f1f440000cc90'), 'NOP-INT3-instruction-sequence'),
            (bytes.fromhex('90c3'), 'mixed-unclassified'), (b'\xcc\x48', 'mixed-unclassified')]:
        assert encoding(raw, 0x1000, decoder)[0] == wanted

    def classify(rows, filename):
        counts, digest, original_digest = collections.Counter(), hashlib.sha256(), hashlib.sha256()
        output = (WORK / filename).open('w') if args.stage else None
        try:
            for a, b, location, category, expected_hash, original in rows:
                assert a < b
                offset = pe.rva_offset(a - pe.image_base)
                raw = image[offset:offset+b-a]
                assert len(raw) == b-a
                sha = hashlib.sha256(raw).hexdigest()
                if expected_hash is not None:
                    assert sha == expected_hash
                role, count = encoding(raw, a, decoder)
                encoded = json.dumps([hex(a), hex(b), location, category, sha, role, count], separators=(',', ':')) + '\n'
                digest.update(encoded.encode())
                original_digest.update((json.dumps(original, separators=(',', ':')) + '\n').encode())
                counts[location + ':' + role + ':ranges'] += 1
                counts[location + ':' + role + ':bytes'] += b-a
                if output:
                    output.write(encoded)
        finally:
            if output:
                output.close()
        return dict(result_sha256=digest.hexdigest(), original_selector_sha256=original_digest.hexdigest(),
            counts=dict(sorted(counts.items())), records=sum(v for k, v in counts.items() if k.endswith(':ranges')),
            bytes=sum(v for k, v in counts.items() if k.endswith(':bytes')))

    def ghidra_rows():
        with gzip.open(ROOT / inputs[names[0]]['path'], 'rt') as stream:
            for row in csv.DictReader(stream, delimiter='\t'):
                a, b = int(row['start'], 16), int(row['end_exclusive'], 16)
                yield a, b, row['location'], row['category'], row['sha256'], [row[k] for k in
                    ['start', 'end_exclusive', 'byte_count', 'location', 'category', 'sha256']]

    ghidra = classify(ghidra_rows(), 'ghidra-residual-encodings.jsonl')
    assert (ghidra['records'], ghidra['bytes']) == (462533, 8480008)
    with open_native_inventory(f"file:{ROOT / inputs[names[1]]['path']}?mode=ro", uri=True) as db:
        rows = ((a, b, 'complement', category, None, [a, b, category]) for a, b, category in complement_residuals(db))
        complement = classify(rows, 'complement-residual-encodings.jsonl')
    assert (complement['records'], complement['bytes']) == (332690, 4819742)
    assert complement['original_selector_sha256'] == proof['selectors']['Q41-U04']['output_sha256']
    result = dict(schema_version=1, target={k: target[k] for k in ['version', 'path', 'sha256', 'size_bytes']},
        gap_ids=[41], lead_ids=['Q41-U01', 'Q41-U02', 'Q41-U04'],
        input_proof=dict(path=PROOF.relative_to(ROOT).as_posix(), sha256=file_sha256(PROOF)),
        inputs=inputs, capstone_version=capstone.__version__, ghidra_unobserved=ghidra,
        independent_complement=complement, boundary_counterexamples=5,
        limits=['Complete current residual inventories and PE bytes are read. Encoding is not semantic/source/AS ownership, padding, function entry or dynamic unreachability proof.',
            'NOP preserves fallthrough; INT3 traps if executed. Neither establishes whether a caller exists or whether later mutation occurs. Mixed intervals remain unclassified.',
            'The two inventories overlap and their byte/range totals must never be added. Original census and queue selectors/counts are preserved.',
            'No new engine reconstruction, source compilation, application/game execution or original/rebuilt parity comparison.'])
    encoded = json.dumps(result, indent=2) + '\n'
    if args.stage:
        (WORK / 'residual-encodings.json').write_text(encoded)
    else:
        assert KEEP.read_text() == encoded
    print(json.dumps(dict(ghidra_ranges=ghidra['records'], complement_ranges=complement['records'], parity_verified=False)))


if __name__ == '__main__':
    main()
