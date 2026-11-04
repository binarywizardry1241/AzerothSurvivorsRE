#!/usr/bin/env python3
"""Hash-bound native logout/terminal dispatch check; no compilation or target execution."""
import hashlib
import itertools
import json
import struct
import sys

from coverage_common import ROOT, installed_identity, latest_target, target_bytes
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


def guest_end_run():
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.139.2/coop-guest-end-run.json').read_text())
    target = installed_identity()
    assert target == proof['target']
    data = target_bytes(target)
    pe = load_script('coop_logout_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def read(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + size]

    for row in proof['native_ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        assert pe.rva_offset(start - pe.image_base) == int(row['file_offset'], 16)
        assert hashlib.sha256(read(start, end - start)).hexdigest() == row['sha256']

    for table, index, destination in ((0x1476c8114, 7, 0x145e767ae),
                                      (0x14735485c, 16, 0x145dc9290),
                                      (0x1476c81ec, 13, 0x145e78345)):
        assert table + struct.unpack('<i', read(table + index * 4, 4))[0] == destination
    assert read(0x1476c5080, 4) == b'\x09\0\0\0'
    assert read(0x1476c5b00, 8) == struct.pack('<Q', (1 << 63) + 16)
    assert read(0x145dc9294, 2) == b'\xb2\x10'
    assert read(0x1476c5fc8, 16) == b'you left the run'

    harness = load_script('coop_logout_native', ROOT / 'scripts/check-coop-ui.py')
    probe = harness.Native(data, pe, [(0x145edc3d9, 0x145edc3fb), (0x145edc493, 0x145edc4ab)],
                           [0x145edc3fb, 0x145edc792, 0x145edc466, 0x145edc4ab])
    game = probe.HEAP
    probe.reg('R15', game)
    for remote_count, departed in itertools.product(range(5), range(7)):
        probe.put(game + 0xb98, remote_count)
        probe.put(game + 0xe70, departed)
        probe.stop = 0x145edc3fb if remote_count + 1 - departed <= 1 else 0x145edc792
        probe.run(0x145edc3d9)
    for phase, abandoned in itertools.product(range(6), range(2)):
        probe.cpu.mem_write(game + 0xf63, bytes([phase]))
        probe.cpu.mem_write(game + 0xf4f, bytes([abandoned]))
        probe.stop = 0x145edc4ab if 1 <= phase <= 3 and not abandoned else 0x145edc466
        probe.run(0x145edc493)

    source = ROOT / 'crates/azeroth-survivors-re/src'
    pause = (source / 'gameplay/run_hud/pause.rs').read_text()
    assert 'coop_ui.request_leave_run();' in pause and 'kind:5' not in pause
    directory = (source / 'coop_directory.rs').read_text()
    assert 'driver.leave_guest_run(' in directory and '"you left the run"' in directory
    mechanics = (source / 'gameplay/mechanics/coop.rs').read_text()
    departure = mechanics.split('pub fn leave_party_hero(', 1)[1].split('fn refresh_party_live_heroes', 1)[0]
    assert '.all(|hero| hero.departed)' in departure
    assert departure.index('self.abandon(|_| None)') < departure.index('self.rescale_party_actor_health(previous)')
    print('PASS: 47 native singleton/phase cases, hash-bound End Run dispatch and live source routes')


if __name__ == '__main__':
    if sys.argv[1:] == ['--end-run']:
        guest_end_run()
    else:
        main()
