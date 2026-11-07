#!/usr/bin/env python3
"""Verify the selected 0.119 Druid native/source receipts without compiling or running a game."""
from runtime_layout import retained_runtime_path
import argparse
import hashlib
import importlib.util
import json
from coverage_common import ROOT, latest_target, target_bytes


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--require-retained-queries', action='store_true')
    args = parser.parse_args()
    path = ROOT / 'docs/analysis/evidence/0.119.0/druid-release/manifest.json'
    proof = json.loads(path.read_text())
    target = latest_target(verify=True)
    assert all(target[k] == proof['target'][k] for k in ('version','sha256','size_bytes')), 'Selected target differs'
    image = target_bytes(target)
    spec = importlib.util.spec_from_file_location('inventory_pe', ROOT/'scripts/inventory-current-target.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.pe_parser(image)
    for row in proof['native_spans'] + proof['constants']:
        at = int(row['file_offset'],16)
        assert pe.rva_offset(int(row['start'],16)-pe.image_base) == at, row['role']
        assert digest(image[at:at+row['byte_count']]) == row['sha256'], row['role']
    for row in [proof['assembly'],proof['decompiler']] + proof['source_receipts']:
        assert digest((retained_runtime_path(ROOT / row['path'], ROOT)).read_bytes()) == row['sha256'], row['path']
    # Check exact concatenated instruction bytes and boundaries, independent of Ghidra.
    import capstone
    cs = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
    for row in proof['native_spans']:
        at = int(row['file_offset'],16)
        instructions = list(cs.disasm(image[at:at+row['byte_count']],int(row['start'],16)))
        assert sum(i.size for i in instructions) == row['byte_count'],row['role']
        assert len(instructions) == row['instruction_count'],row['role']
    assembly = (ROOT/proof['assembly']['path']).read_text().splitlines()
    encoded = b''.join(bytes.fromhex(line.split(':',1)[1].strip().split()[0])
                       for line in assembly if line and not line.startswith(';'))
    assert encoded == b''.join(image[int(row['file_offset'],16):int(row['file_offset'],16)+row['byte_count']]
                              for row in proof['native_spans']), 'Assembly differs'
    checked = 0
    for row in proof['queries']:
        result = ROOT / row['result']
        if not result.exists():
            assert not args.require_retained_queries,'Missing retained query: '+str(result)
            continue
        for name in ('result','plan','journal'):
            assert digest((ROOT / row[name]).read_bytes()) == row[name+'_sha256'],row[name]
        evidence = json.loads(result.read_text())['structuredContent']
        assert evidence['evidence_id'] == row['evidence_id']
        assert evidence['analysis_profile']['digest'] == row['profile_digest']
        assert evidence['subject']['digest']['sha256'] == target['sha256']
        assert digest(evidence['normalized_result'].encode()) == row['normalized_sha256']
        for name,expected in {**row['seed_inputs'],**row['original_tooling']}.items():
            assert digest((ROOT/name).read_bytes()) == expected,name
        checked += 1
    print(json.dumps({'target':target['version'],'native_ranges':len(proof['native_spans']),
        'native_bytes':sum(x['byte_count'] for x in proof['native_spans']),
        'independently_decoded_instructions':sum(x['instruction_count'] for x in proof['native_spans']),
        'source_receipts':len(proof['source_receipts']),'retained_queries_checked':checked,
        'query_results_unavailable':len(proof['queries'])-checked,'target_executed':False,
        'implementation_or_parity_certified':False},indent=2))


if __name__ == '__main__':
    main()
