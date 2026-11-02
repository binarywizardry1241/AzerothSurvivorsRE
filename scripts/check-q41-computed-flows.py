#!/usr/bin/env python3
"""Classify complete Q41-F01/F02 instruction populations without target execution.

Ghidra computed-flow labels include traps. Decode the exact image bytes before
calling a record an indirect branch; retain both original selector populations.
The straight-line classifier supplies candidates, never runtime callee identity.
"""
import argparse
from collections import Counter
import csv
import gzip
import hashlib
import json
from pathlib import Path
import sqlite3
import sys

from coverage_common import ROOT, latest_target, target_bytes, file_sha256, json_text
from script_sources import load_script

sys.path.insert(0, str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'))
from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_GRP_CALL, CS_GRP_JUMP
from capstone.x86_const import X86_OP_IMM
import capstone
from shared_native_inventory import open_readonly_uri as open_native_inventory

PROOF = ROOT / 'docs/analysis/evidence/0.113.2/unknown-recovery.json'
OUT = ROOT / 'docs/analysis/evidence/0.113.2/computed-flows.json'
CLASSIFIER = ROOT / 'docs/analysis/evidence/0.113.2/native-call-candidates.json'
WORK = ROOT / 'runtime/q41-computed-flows-0.113.2'
SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'


def commitment(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def line(row):
    return (json.dumps(row, ensure_ascii=False, separators=(',', ':')) + '\n').encode()


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    args = ap.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    image = target_bytes(target)
    pe = load_script('computed_flow_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    queue = json.loads(PROOF.read_text())
    assert queue['target']['sha256'] == SHA
    source = ROOT / queue['inputs']['full-image-census']['path']
    census = json.loads(source.read_text())
    assert census['target']['sha256'] == SHA
    assert census['independent_instructions']['exact_source_bytes_verified']
    directory = ROOT / census['artifacts']['directory']
    for name in ('instructions.tsv.gz', 'bodies.tsv.gz'):
        assert file_sha256(directory / name) == census['artifacts']['files'][name]['sha256']
    helpers = load_script('computed_flow_census', ROOT / 'scripts/summarize-native-image.py')
    owner = helpers.owner_lookup([(int(r['start'], 16), int(r['end'], 16), int(r['entry'], 16))
                                 for r in helpers.rows(directory / 'bodies.tsv.gz')
                                 if r['external'] == 'false'])
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True

    def decode(site, raw):
        offset = pe.rva_offset(site - pe.image_base)
        assert image[offset:offset + len(raw)] == raw
        decoded = list(decoder.disasm(raw, site, count=1))
        assert len(decoded) == 1 and decoded[0].size == len(raw)
        instruction = decoded[0]
        if instruction.mnemonic in ('int', 'int3', 'ud2'):
            return 'trap:' + instruction.mnemonic
        kind = 'call' if instruction.group(CS_GRP_CALL) else 'jump' if instruction.group(CS_GRP_JUMP) else None
        assert kind and instruction.operands and instruction.operands[0].type != X86_OP_IMM
        return kind

    sites, counts, hashes, records = {}, Counter(), {}, Counter()
    selectors = ('Q41-F01-call', 'Q41-F01-jump')
    for key in selectors:
        hashes[key] = hashlib.sha256()
    with gzip.open(directory / 'instructions.tsv.gz', 'rt') as stream:
        for row in csv.DictReader(stream, delimiter='\t'):
            flow = row['flow']
            if flow not in ('COMPUTED_CALL', 'COMPUTED_CALL_TERMINATOR', 'COMPUTED_JUMP'):
                continue
            key = 'Q41-F01-jump' if flow == 'COMPUTED_JUMP' else 'Q41-F01-call'
            site = int(row['address'], 16)
            native_owner = owner(site)
            projected = [row['address'], row['length'], row['bytes'], flow,
                         hex(native_owner) if native_owner is not None else None]
            hashes[key].update(line(projected))
            records[key] += 1
            role = decode(site, bytes.fromhex(row['bytes']))
            counts[key + ':' + role] += 1
            assert site not in sites
            sites[site] = role
    for key in selectors:
        expected = queue['selectors'][key]
        assert records[key] == expected['records']
        assert hashes[key].hexdigest() == expected['output_sha256']

    # Independent inventories remain overlapping views. Compare actual starts,
    # never add them to the Ghidra population or infer reachability from a decode.
    views = {}
    for key, input_key in [('Q41-F02-call', 'native-instructions.sqlite'),
                           ('Q41-F02-jump', 'native-instructions.sqlite'),
                           ('Q41-F02-complement', 'unwind-complement.sqlite')]:
        descriptor = queue['inputs'][input_key]
        path = ROOT / descriptor['path']
        assert file_sha256(path) == descriptor['sha256']
        digest, total, partition = hashlib.sha256(), 0, Counter()
        with open_native_inventory(f'file:{path}?mode=ro', uri=True) as db:
            for row in db.execute(queue['selectors'][key]['selector']):
                digest.update(line(row))
                total += 1
                if key == 'Q41-F02-complement':
                    site = row[0]
                    raw = bytes.fromhex(db.execute('SELECT bytes FROM instructions WHERE site=?', (site,)).fetchone()[0])
                else:
                    site, raw = row[1], bytes.fromhex(row[2])
                role = decode(site, raw)
                assert role == ('call' if key.endswith('-call') else 'jump')
                counterpart = sites.get(site)
                assert counterpart is None or counterpart == role
                partition['same-Ghidra-indirect-start' if counterpart else 'not-a-Ghidra-indirect-start'] += 1
        expected = queue['selectors'][key]
        assert total == expected['records'] and digest.hexdigest() == expected['output_sha256']
        views[key] = dict(records=total, output_sha256=digest.hexdigest(), comparison=dict(partition))

    classifier = json.loads(CLASSIFIER.read_text())
    assert classifier['target'] == census['target']
    assert classifier['census_summary_sha256'] == file_sha256(source)
    assert file_sha256(ROOT / classifier['generator']['path']) == classifier['generator']['sha256']
    artifact = classifier['artifact']
    assert file_sha256(ROOT / artifact['path']) == artifact['sha256']
    candidate_counts, unresolved = Counter(), Counter()
    seen = set()
    with gzip.open(ROOT / artifact['path'], 'rt') as stream:
        for text in stream:
            row = json.loads(text)
            site = int(row['site'], 16)
            assert sites[site] == row['kind'] and site not in seen
            seen.add(site)
            if row['resolution_basis']:
                candidate_counts[row['initial_target']['kind'] + ':' + row['kind']] += 1
            else:
                unresolved[row['kind'] + ':' + row['unknown_reason']] += 1
    assert seen == {site for site, role in sites.items() if role in ('call', 'jump')}
    assert dict(sorted(unresolved.items())) == classifier['unknown_indirect_reasons']
    proof = dict(schema_version=1, target=target, gap_ids=[41],
                 lead_ids=['Q41-F01', 'Q41-F02', 'Q41-M03'],
                 input_proof=commitment(PROOF), census=commitment(source),
                 generator=commitment(Path(__file__).resolve()), capstone_version=capstone.__version__,
                 original_selector_counts=dict(records), instruction_roles=dict(sorted(counts.items())),
                 independent_views=views, classifier=commitment(CLASSIFIER),
                 candidate_targets=dict(sorted(candidate_counts.items())),
                 unresolved_candidates=dict(sorted(unresolved.items())),
                 actual_indirect_sites=len(seen), trap_sites=len(sites)-len(seen),
                 complete_runtime_aliases_or_source_semantics=False,
                 limits=['Every selected original instruction is checked against current image bytes. Original populations and their overlap are retained.',
                         'Trap encodings are neither indirect calls/jumps nor proof of unreachable/padding bytes.',
                         'Encoded imports/native targets are static candidates; mutable tables, incoming register state, full AS ownership and callee behavior remain unproved.',
                         'The current candidate classifier is not the missing complete semantic/source/alias inventory. No compilation, application, network or gameplay execution.'])
    if args.stage:
        WORK.mkdir(exist_ok=True)
        (WORK / 'computed-flows.json').write_text(json_text(proof))
    else:
        assert proof == json.loads(OUT.read_text()), 'Computed-flow proof differs; review a staged result'
    print(json_text(dict(instruction_roles=proof['instruction_roles'], independent_views=views,
                         actual_indirect_sites=len(seen), trap_sites=proof['trap_sites'],
                         candidate_targets=proof['candidate_targets'], unresolved_candidates=proof['unresolved_candidates'])))


if __name__ == '__main__':
    main()
