#!/usr/bin/env python3
"""Verify current Seen admission keys against native comparison bytes; no compilation."""
import hashlib
import json
import re

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'


def main():
    target = latest_target(verify=True)
    assert target['version'] == '0.115.0' and target['sha256'] == SHA
    retained = json.loads((ROOT / 'docs/analysis/evidence/0.115.0/coop-seen/manifest.json').read_text())
    assert retained['target']['sha256'] == SHA
    assert not retained['compiled'] and not retained['target_executed']
    data = target_bytes(target)
    pe = load_script('coop_seen_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    owner = retained['owner']
    start, end = int(owner['start'], 16), int(owner['end_exclusive'], 16)
    offset = pe.rva_offset(start - pe.image_base)
    assert offset == int(owner['file_offset'], 16)
    assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == owner['sha256']
    extract = (ROOT / owner['extract']).read_bytes()
    assert hashlib.sha256(extract).hexdigest() == owner['extract_sha256']
    assert retained['ghidra']['subject_sha256'] == owner['sha256']
    assert retained['ghidra']['evidence_id'].startswith('ev_')
    assert len(retained['ghidra']['analysis_profile_sha256']) == 64
    assembly = extract.decode()
    assert 'cmp r14b, 4' in assembly and 'ja 0x1458e5b70' in assembly
    assert 'movabs r10, 0x7261646e6567656c' in assembly and 'xor r10, 0x3a79' in assembly
    keys = []
    for row in retained['keys']:
        combined = {}
        for piece in row['pieces']:
            raw = bytes.fromhex(piece['hex'])
            at = pe.rva_offset(int(piece['address'], 16) - pe.image_base)
            assert at == int(piece['file_offset'], 16)
            assert data[at:at + len(raw)] == raw, row['key']
            assert f"{piece['load']}: " in assembly
            compare = next(line for line in assembly.splitlines()
                           if line.startswith(piece['compare'] + ': '))
            assert row['base'] in compare, (row['key'], compare)
            for n, byte in enumerate(raw, piece['offset']):
                assert combined.get(n, byte) == byte
                combined[n] = byte
        literal = bytes(combined[n] for n in range(len(combined))).decode('ascii')
        key = ('legendary:' if row['base'] == 'r9' else '') + literal
        assert key == row['key']
        keys.append(key)
    assert len(keys) == len(set(keys)) == 142
    assert sum(key.startswith('legendary:') for key in keys) == 103
    assert 'legendary:hammer_of_justice' in keys and 'legendary:demonic_empowerment' in keys
    source = (ROOT / 'crates/azeroth-survivors-re/src/coop/client_state.rs').read_text()
    implementation = source.split('pub fn recognized_seen_key(key: &str) -> bool {', 1)[1]
    source_keys = re.findall(r'^\s*"([a-z_:]+)",$', implementation, flags=re.M)
    assert source_keys == sorted(keys)
    assert 'KEYS.binary_search(&key).is_ok()' in implementation
    assert 'starts_with' not in implementation and 'strip_prefix' not in implementation
    assert '*quality <= 4 && recognized_key(key)' in source and '400' in source
    print('PASS: current6148-byte Seen filter,142 exact literal keys (39 jewelry/103 legendary),'
          'source membership and separate quality/quota gates; no compilation or runtime claim')


if __name__ == '__main__':
    main()
