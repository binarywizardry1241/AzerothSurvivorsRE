#!/usr/bin/env python3
"""Verify current hzt keep evidence/source ordering without compiling or executing."""
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    target = latest_target(verify=True)
    expected = json.loads((ROOT / 'docs/analysis/evidence/0.115.0/coop-markers/manifest.json').read_text())
    assert target['sha256'] == expected['target']['sha256'] == '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
    assert target['version'] == expected['target']['version'] == '0.115.0'
    assert expected['target_executed'] is False
    data = target_bytes(target)
    pe = load_script('coop_markers_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def read(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + length]

    owner = expected['owner']
    start, end = int(owner['start'], 16), int(owner['end_exclusive'], 16)
    assert pe.rva_offset(start - pe.image_base) == int(owner['file_offset'], 16)
    assert digest(read(start, end - start)) == owner['sha256']
    for row in expected['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        assert digest(read(start, end - start)) == row['sha256']
        assert digest((ROOT / row['extract']).read_bytes()) == row['extract_sha256']
    literals = {}
    for row in expected['literals']:
        raw = bytes.fromhex(row['hex'])
        assert read(int(row['address'], 16), len(raw)) == raw
        assert digest(raw) == row['sha256']
        literals[row['role']] = raw
    assert literals == {'type': b'type', 'clock': b't', 'moves': b'm', 'keep': b'keep', 'occupancy': b'in'}
    for row in expected['instructions']:
        raw = bytes.fromhex(row['hex'])
        assert read(int(row['address'], 16), len(raw)) == raw
    # Bind both non-true branches to the actual in handler, and the true path
    # to the next-message loop; this checks branch bytes without executing them.
    for address in (0x140111b84, 0x140111b8e):
        assert address + 6 + struct.unpack('<i', read(address + 2, 4))[0] == 0x140111c70
    assert 0x140111b9e + 5 + struct.unpack('<i', read(0x140111b9f, 4))[0] == 0x1401117e0
    assert 0x140111b65 + 7 + struct.unpack('<i', read(0x140111b68, 4))[0] == 0x145ef1f47
    query = expected['query']
    assert query['subject_sha256'] == owner['sha256']
    assert query['operation'] == 'procedure_pseudo_code'
    assert query['evidence_id'].startswith('ev_')
    source = (ROOT / 'crates/azeroth-survivors-re/src/raid_markers.rs').read_text()
    tick = source.split('Some("hzt") => {', 1)[1].split('Some("hzend") => {', 1)[0]
    positions = [tick.index(anchor) for anchor in (
        'self.clock =', 'self.received_at =', 'value["m"].as_array()',
        'if value["keep"].as_bool() != Some(true)', 'if row.fade_end.is_none()', 'value["in"]')]
    assert positions == sorted(positions)
    for anchor in ('fn forwarded_hazard_tick_keeps_local_occupancy_but_moves_and_advances_clock',
                   'crate::coop::route::forward_to_peers(original)',
                   'fn occupancy_keep_requires_json_true_and_retains_fading_row_exclusion'):
        assert anchor in source
    print('PASS:current receiver hash,3 focused extracts,5 keys,15 instruction sites,exact keep branches and source ordering;2 Rust regressions authored/unrun;no compilation or native execution')


if __name__ == '__main__':
    main()
