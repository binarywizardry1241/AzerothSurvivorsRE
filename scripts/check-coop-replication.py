#!/usr/bin/env python3
"""Check current co-op wire/state source evidence without compiling or execution."""
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
MANIFEST = ROOT / 'docs/analysis/evidence/0.115.0/coop-replication/manifest.json'


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def main():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.115.0'
    retained = json.loads(MANIFEST.read_text())
    assert retained['target']['sha256'] == SHA
    assert retained['target_executed'] is False and retained['compiled'] is False
    data = target_bytes(target)
    pe = load_script('coop_replication_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    owners = {}
    for row in retained['owners']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert digest(data[offset:offset + end - start]) == row['sha256'], row['role']
        assert digest((ROOT / row['extract']).read_bytes()) == row['extract_sha256']
        owners[row['start']] = row
    for row in retained['shared_ranges']:
        shared = json.loads((ROOT / row['owner_manifest']).read_text())
        found = next(owner for owner in shared['functions'] if owner['start'] == row['start'])
        assert found['sha256'] == row['sha256']
        assert found['extract']['path'] == row['extract']
    tables = {}
    for row in retained['tables']:
        address = int(row['address'], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + 4 * len(row['targets'])]
        assert digest(raw) == row['sha256']
        targets = [hex(address + value) for value in struct.unpack('<' + 'i' * len(row['targets']), raw)]
        assert targets == row['targets']
        tables[row['role']] = targets
    assert len(tables['serializer19']) == 19 and len(tables['parser19']) == 19
    assert tables['enginecommandsloginSync'][7] == '0x145883dce'
    assert tables['controlboolnormalization'][7:] == ['0x14581ba07', '0x14581ba37', '0x14581b9d7']
    literals = {}
    for row in retained['literals']:
        raw = bytes.fromhex(row['hex'])
        offset = pe.rva_offset(int(row['address'], 16) - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert data[offset:offset + len(raw)] == raw
        assert digest(raw) == row['sha256']
        literals[row['role']] = raw
    assert literals['synchronizeconstant'] == (0x8000000000000005).to_bytes(8, 'little')
    assert literals['zoneentryevent'] == b'coopstart' and literals['zoneentrykey'] == b'bg'
    assert b';ge=' in literals['AZSRUNfieldformat'] and b';ck=' in literals['AZSRUNfieldformat']
    assert struct.unpack('<f', literals['visualscaleminimum'])[0] == struct.unpack('<f', struct.pack('<f', .1))[0]
    assert struct.unpack('<f', literals['visualscalemaximum'])[0] == 10.0
    for row in retained['ghidra_queries']:
        assert row['subject_sha256'] == owners[row['owner']]['sha256']
        assert row['evidence_id'].startswith('ev_')
        assert len(row['analysis_profile_sha256']) == 64
    assert len(retained['ghidra_queries']) >= 16
    wire = (ROOT / 'crates/azeroth-survivors-re/src/coop/replication.rs').read_text()
    state = (ROOT / 'crates/azeroth-survivors-re/src/coop/client_state.rs').read_text()
    for anchor in ('pub fn encode_message', 'pub fn decode_message', 'pub fn encode_batch',
                   'pub fn decode_frame', 'pub fn initial_world_messages',
                   'benilla_protocol::messages::parse_server', 'benilla_protocol::decode',
                   'DeflateDecoder::new', 'Compression::new(1)',
                   'MAX_INFLATED_BATCH: usize = 0x40_0000', 'reader.count(24)',
                   'reader.count(9)', 'reader.count(11)', 'reader.count(8)',
                   'String::from_utf8_lossy', 'row.key.as_bytes() == key.as_slice()',
                   'HudJson', 'kind_09 < 4', 'NativeMessage::Compressed(_)'):
        assert anchor in wire, anchor
    for anchor in ('pub struct RunProjection', 'pub fn run_modifiers',
                   'pub fn validate_state', 'pub fn sanitize_text',
                   'pub fn sanitize_resources', 'pub fn sanitize_timers',
                   'state.word_6c.min(99)', 'seconds_since_zone_start + 30.0',
                   'clock * 40.0 + 50.0', 'clock * 500.0 + 1000.0',
                   'clock * 0.05 + 1.0', 'clock * 0.1 + 2.0',
                   'density.clamp(1.0, 5.0)', 'reward.clamp(1.0, 2.0)',
                   'rows.truncate(128)', 'text.is_char_boundary(end)',
                   'clamp(0.1, 10.0)', 'pub bare: bool'):
        assert anchor in state, anchor
    assert wire.count('#[test]') == 6 and state.count('#[test]') == 3
    print(f'PASS:{len(owners)} native ranges,5 dispatch tables,{len(literals)} literals,'
          f'{len(retained["ghidra_queries"])} retained Ghidra identities;all19 wire tags '
          'and typed state source anchors;9 Rust regressions authored,unrun;'
          'no compilation,native execution,network or parity claim')


if __name__ == '__main__':
    main()
