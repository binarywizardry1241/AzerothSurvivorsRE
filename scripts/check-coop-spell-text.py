#!/usr/bin/env python3
"""Verify the current spell-tooltip constructor and optional display-field tables."""
import hashlib
import json
import struct
from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'


def main():
    target = latest_target(verify=True)
    assert target['version'] == '0.115.0' and target['sha256'] == SHA
    manifest = json.loads((ROOT / 'docs/analysis/evidence/0.115.0/coop-spell-text/manifest.json').read_text())
    assert manifest['target']['sha256'] == SHA and not manifest['compiled'] and not manifest['target_executed']
    data = target_bytes(target)
    pe = load_script('coop_spell_text_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    owner = manifest['ranges'][0]
    start, end = int(owner['start'], 16), int(owner['end_exclusive'], 16)
    offset = pe.rva_offset(start - pe.image_base)
    assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == owner['sha256']
    assembly = (ROOT / owner['extract']).read_bytes()
    assert hashlib.sha256(assembly).hexdigest() == owner['extract_sha256']
    assert manifest['functions'][0]['sha256'] == owner['sha256']
    assert manifest['functions'][0]['evidence_id'].startswith('ev_')
    tables = {}
    for row in manifest['tables']:
        va = int(row['address'], 16)
        at = pe.rva_offset(va - pe.image_base)
        raw = data[at:at + len(row['targets']) * 4]
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
        assert [hex(va + n) for n in struct.unpack('<' + 'i' * len(row['targets']), raw)] == row['targets']
        tables[row['role']] = row['targets']
    assert tables['rank-label-mode'] == ['0x145864ace', '0x145864c3b', '0x145864b97', '0x145864be9']
    assert tables['range-kind2to11'][6:8] == ['0x145865060', '0x145864f5d']
    literals = {}
    for row in manifest['literals']:
        raw = bytes.fromhex(row['hex'])
        at = pe.rva_offset(int(row['address'], 16) - pe.image_base)
        assert data[at:at + len(raw)] == raw
        literals[row['role']] = raw.decode()
    assert literals['cooldown'] == '{n} sec cooldown'
    assert [literals[k] for k in ('rank', 'not-learned', 'racial', 'talent')] == ['Rank {n}', 'Not learned', 'Racial', 'Talent']
    assert literals['passive'] == 'Passive' and literals['automatic'] == 'Automatic'
    assert b'call 0x14585c8e0' in assembly and b'call 0x14580a670' in assembly
    print('PASS: current spell-tooltip owner,2 optional-field tables,10 exact display literals;'
          'source producer expansion/runtime parity remain separate; no compilation')


if __name__ == '__main__':
    main()
