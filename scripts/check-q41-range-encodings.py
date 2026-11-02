#!/usr/bin/env python3
"""Classify exact Q41 residual encodings; never infer padding or reachability.

Default operation is read-only. --stage writes only ignored candidate evidence.
U01/U02 and U04 are independent overlapping inventories, never additive totals.
"""
import argparse
import collections
import csv
import gzip
import hashlib
import json
import sqlite3
import sys

from coverage_common import ROOT, latest_target, target_bytes, file_sha256
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
    instructions = list(decoder.disasm(raw, address))
    if instructions and sum(i.size for i in instructions) == len(raw) and all(
            i.mnemonic in ['nop', 'int3'] for i in instructions):
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


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    args = ap.parse_args()
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
