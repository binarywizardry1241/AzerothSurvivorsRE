#!/usr/bin/env python3
"""Check 0.115.0 co-op transport evidence and source anchors without execution.

This verifies the selected native ranges, literals, dispatch tables and owning
source paths. It neither compiles Rust nor opens sockets nor executes/emulates
native instructions; the authored Rust regression tests remain separate.
"""
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

MANIFEST = ROOT / 'docs/analysis/evidence/0.115.0/coop-transport/manifest.json'
SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.115.0'
    retained = json.loads(MANIFEST.read_text())
    assert retained['target']['sha256'] == SHA
    assert retained['target_executed'] is False
    data = target_bytes(target)
    pe = load_script('coop_transport_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    owners = {}
    for row in retained['owners']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert digest(data[offset:offset + end - start]) == row['sha256'], row['role']
        assert digest((ROOT / row['extract']).read_bytes()) == row['extract_sha256']
        owners[row['start']] = row
    literals = {}
    for row in retained['literals']:
        raw = bytes.fromhex(row['hex'])
        offset = pe.rva_offset(int(row['address'], 16) - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert data[offset:offset + len(raw)] == raw, row['role']
        assert digest(raw) == row['sha256']
        literals[row['role']] = raw
    for row in retained['tables']:
        address = int(row['address'], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + 4 * len(row['targets'])]
        assert digest(raw) == row['sha256']
        targets = [hex(address + value) for value in struct.unpack('<' + 'i' * len(row['targets']), raw)]
        assert targets == row['targets']
    for query in retained['ghidra_queries']:
        assert query['operation'] == 'procedure_pseudo_code'
        assert query['subject_sha256'] == owners[query['owner']]['sha256']
        assert query['evidence_id'].startswith('ev_')
        assert len(query['analysis_profile_sha256']) == 64
    assert len(retained['ghidra_queries']) == 8
    assert literals['route-prefix'] == b'{"type":"'
    assert literals['hzt-meter-search'] == b'"m":'
    assert literals['hzt-input-search'] == b',"in":'
    assert literals['hzt-keep-format'] == b'\xc0\r,"keep":true}'
    assert literals['banner-kind-format'] == b'\x08"kind":"\xc0\x01"'
    assert literals['listen-address'] == b'0.0.0.0'
    expected_url = literals['ordinary-service-base'].replace(
        literals['url-search'], literals['url-replacement']) + literals['url-append-format'][2:]
    assert expected_url == b'wss://wow.aethus.pl/coop/lobby/'
    route = (ROOT / 'crates/azeroth-survivors-re/src/coop/route.rs').read_text()
    tcp = (ROOT / 'crates/azeroth-survivors-re/src/coop/tcp.rs').read_text()
    for anchor in ('pub fn forward_to_peers', 'packet.strip_prefix(TYPE_PREFIX)',
                   '"hz" | "hzend"', 'packet.contains(METER_FIELD)',
                   'packet.find(INPUT_FIELD)', 'packet.len() - 1',
                   '["boss", "finalboss", "bossdown", "guardian"]'):
        assert anchor in route, anchor
    for anchor in ('MAX_RECEIVED_PACKET: usize = 0x10_0000',
                   'READ_CHUNK: usize = 0x4000', 'Duration::from_secs(5)',
                   'TcpStream::connect_timeout', 'stream.set_nodelay(true)?',
                   'stream.set_nonblocking(true)?', 'ErrorKind::NotFound',
                   'ErrorKind::WouldBlock', 'ErrorKind::Interrupted',
                   'payload.len() as u32).to_le_bytes()', 'u32::from_le_bytes',
                   'length > MAX_RECEIVED_PACKET', 'received.drain(..end)',
                   'self.pending.drain(..count)', 'Shutdown::Both',
                   'Ipv4Addr::UNSPECIFIED', 'value.parse::<u16>()',
                   expected_url.decode()):
        assert anchor in tcp, anchor
    for role in ('password-env', 'host-env', 'join-env', 'url-env'):
        assert literals[role].decode() in tcp
    assert route.count('#[test]') == 3 and tcp.count('#[test]') == 4
    print('PASS:13 native owner hashes,18 literals,5 dispatch tables,8 retained Ghidra identities and route/TCP source anchors;7 Rust regressions authored,unrun;no compilation,network or native execution')


if __name__ == '__main__':
    main()
