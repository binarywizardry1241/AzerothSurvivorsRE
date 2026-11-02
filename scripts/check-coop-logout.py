#!/usr/bin/env python3
"""Hash-bound native logout/terminal dispatch check; no compilation or target execution."""
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'


def main():
    target = latest_target(verify=True)
    assert target['version'] == '0.115.0' and target['sha256'] == SHA
    manifest = json.loads((ROOT / 'docs/analysis/evidence/0.115.0/coop-logout/manifest.json').read_text())
    assert manifest['target']['sha256'] == SHA and not manifest['compiled'] and not manifest['target_executed']
    data = target_bytes(target)
    pe = load_script('coop_logout_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    assembly = {}
    for row in manifest['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == row['sha256']
        raw = (ROOT / row['extract']).read_bytes()
        assert hashlib.sha256(raw).hexdigest() == row['extract_sha256']
        assembly[row['role']] = raw.decode()
    for row in manifest['functions']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == row['sha256']
        assert row['evidence_id'].startswith('ev_') and row['provider'] == 'ghidra'
        assert len(row['analysis_profile_sha256']) == 64
    tables = {}
    for row in manifest['tables']:
        address = int(row['address'], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + 4 * len(row['targets'])]
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
        decoded = [hex(address + n) for n in struct.unpack('<' + 'i' * len(row['targets']), raw)]
        assert decoded == row['targets']
        tables[row['role']] = decoded
    assert tables['engine4bto60'][0] == '0x145873bba'
    assert tables['guest-front'][4] == tables['guest-front'][7] == '0x145893a98'
    assert tables['guest-front'][6] == '0x145893ca4'
    assert tables['gossip9to22'][11:] == ['0x1459789f8', '0x145978a4f', '0x145978a56']
    assert tables['remote-control'][4] == '0x145818e78'
    assert tables['remote-control'][6] == '0x145818e6b'
    assert tables['host-front'][6] == '0x14588c246'
    literal = {}
    for row in manifest['literals']:
        raw = bytes.fromhex(row['hex'])
        offset = pe.rva_offset(int(row['address'], 16) - pe.image_base)
        assert data[offset:offset + len(raw)] == raw
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
        literal[row['role']] = raw
    assert int.from_bytes(literal['disconnect16-constant'], 'little') == 0x800000000000000f
    assert int.from_bytes(literal['end18-constant'], 'little') == 0x8000000000000011
    assert literal['leave-reason'] == b'you left the run'
    for token in ('cmp bx, 0x4b', 'cmp eax, 0x1ce', 'cmp eax, 0x1dc', 'call 0x145873b00'):
        assert token in assembly['guest-forwarding-exemptions']
    for token in ('mov dword ptr [rax], 0', 'mov byte ptr [rax + 4], 1', '0x4c', 'call 0x145893a20'):
        assert token in assembly['logout-response-and-guest-leave']
    for token in ('call 0x145824200', 'call 0x14581c690', 'call 0x1458948f0'):
        assert token in assembly['guest-frontend-actions']
    assert 'call 0x14588dbf0' in assembly['local-run-logout']
    assert 'mov byte ptr [r13 + 0x471], 0' in assembly['host-end18-and-peer-reset']
    assert 'call 0x1458feff0' in assembly['host-endless-callee']
    terminal = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/terminal.rs').read_text()
    gameplay = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
    assert 'TerminalAction::Again|TerminalAction::Menu' in terminal
    assert 'NativeMessage::Control{kind:4,argument:0}' in terminal
    assert 'LifecyclePacket::Disconnect' in gameplay
    print('PASS:12 bounded native ranges,8 durable Ghidra owners,5 dispatch tables;'
          'guest Again/Menu leave,guest Endless kind4,host continuation and End18 reset;'
          'source routing anchors; no compilation or runtime/parity claim')


if __name__ == '__main__':
    main()
