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
    manifest = json.loads((ROOT / 'docs/analysis/evidence/coop-logout/manifest.json').read_text())
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
    assert 'finish_guest_departure(world, driver, now)' in gameplay
    print('PASS:12 bounded native ranges,8 durable Ghidra owners,5 dispatch tables;'
          'guest Again/Menu leave,guest Endless kind4,host continuation and End18 reset;'
          'source routing anchors; no compilation or runtime/parity claim')


def guest_end_run():
    proof = json.loads((ROOT / 'docs/analysis/evidence/coop-guest-end-run.json').read_text())
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
    admission = harness.Native(data, pe, [(0x145e77c65, 0x145e77ca5)],
                               [0x145e78345, 0x145e78794])
    host = admission.HEAP
    peer = host + 0x2000
    admission.put(host + 0xfb0, peer)
    admission.reg('RSI', host)
    admission.reg('RDX', 0)
    for joined in (0, 1, 255):
        admission.reg('RAX', 16)
        admission.cpu.mem_write(peer + 0x86c, bytes([joined]))
        admission.stop = 0x145e78345 if joined else 0x145e78794
        admission.run(0x145e77c65)

    source = ROOT / 'crates/azeroth-survivors-re/src'
    session = (source / 'coop/session.rs').read_text()
    assert 'NativeMessage::Lifecycle(LifecyclePacket::Disconnect) if joined =>' in session
    pause = (source / 'gameplay/run_hud/pause.rs').read_text()
    assert 'coop_ui.request_leave_run();' in pause and 'kind:5' not in pause
    directory = (source / 'coop_directory.rs').read_text()
    leave = directory.split('request @ (FormRequest::Leave | FormRequest::LeaveRun)', 1)[1]
    assert (leave.index('service.leave_guest_run(') < leave.index('guest.settle(')
            < leave.index('publish_local_departure('))
    close = directory.split('fn leave_guest_run(', 1)[1].split('fn heartbeat(', 1)[0]
    assert (close.index('driver.leave_guest_run(') < close.index('driver.take_service_commands(')
            < close.index('send_relay(') < close.index('self.close();'))
    mechanics = (source / 'gameplay/mechanics/coop.rs').read_text()
    departure = mechanics.split('pub fn leave_party_hero(', 1)[1].split('fn refresh_party_live_heroes', 1)[0]
    assert '.all(|hero| hero.departed)' in departure
    assert departure.index('self.abandon(|_| None)') < departure.index('self.rescale_party_actor_health(previous)')
    print('PASS: 50 native singleton, phase and Disconnect admission cases; live source routes')


def current_world_departure():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    target = installed_identity()
    assert target['version'] == '0.141.0'
    assert target['sha256'] == '6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa'
    data = target_bytes(target)
    pe = load_script('coop_logout_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    ranges = [
        (0x145e9e780, 0x145e9e7f0, '5a4cfc3b56836692c86cc822d3f2e8d92eaf09f598005315a428ffa8c02cc75c'),
        (0x145ebb4d0, 0x145ebb5a6, '5f48506eee98b8302b5ee56888a4340ea49c3e1fdb0b2cee8332852c20b7e677'),
        (0x145ebd97e, 0x145ebd9a3, '4a5a00a03521250b47ccf6b38363b0d651a0111bd42f42490844c297945f2a10'),
        (0x145ebdaae, 0x145ebdabc, '0b834dca9633fbd1c95219869423da7bb291e6b2d4ebf79b70ab05ff42b43afe'),
        (0x145ebf960, 0x145ebfeb6, '442e61451a04184c02e0cef6febb65ee92d92f698876e3d962fdb3f28f276a21'),
        (0x145ec85f0, 0x145ec86f3, '9c854c220cda8aec782d9cf7408caea92cf58372200e1f9f7ff20f90708d39a8'),
        (0x145ec9afe, 0x145ec9bd9, 'c403a0d9aabff3dc2438a0ee5795162e4110b5c638ab66a9f0357dd4044e7f48'),
        (0x146050cc8, 0x146050cd9, 'a39b7b5c7b41fec853def103339189adc976590057bac064a71d8f6bac0bfa18'),
    ]
    instructions = {}
    for start, end, expected in ranges:
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + end - start]
        assert hashlib.sha256(raw).hexdigest() == expected
        instructions.update((ins.address, (ins.mnemonic, ins.op_str)) for ins in decoder.disasm(raw, start))
    calls = {
        0x145e9e7c0: '0x145eca7e0', 0x145e9e7e9: '0x145ec9a90',
        0x145ebb531: '0x145ebf960', 0x145ebb5a1: '0x145ea3190',
        0x145ebd998: '0x145ebb4d0', 0x145ebdab1: '0x145ebb4d0',
        0x145ebfa8e: '0x145e66130', 0x145ebfade: 'qword ptr [rdi + 0x18]',
        0x145ec8640: '0x145ebb750', 0x145ec8648: '0x145ec30b0', 0x145ec86a4: '0x145eca550',
        0x145ec9b13: '0x145e66130', 0x145ec9b58: 'qword ptr [rbx + 0x18]',
        0x145ec9bb0: '0x145e8dc70', 0x145ec9bcf: '0x145ec85f0',
        0x146050cce: '0x146203d20',
    }
    for site, operand in calls.items():
        assert instructions[site] == ('call', operand)
    assert instructions[0x145ebfb06] == ('mov', 'byte ptr [r13 + 0x89d], 0')
    assert instructions[0x146050ccc] == ('mov', 'dl, 0x12')
    table = 0x147aeda94
    cells = pe.rva_offset(table + 16 - pe.image_base)
    assert hashlib.sha256(data[cells:cells + 16]).hexdigest() == \
        '996c7bf8e2793d25cfc46ed127334a234c72b16826fb0e73ade730ce69d908e5'
    assert table + struct.unpack_from('<i', data, cells)[0] == 0x145ebd97e
    assert table + struct.unpack_from('<i', data, cells + 12)[0] == 0x145ebdaae

    source = ROOT / 'crates/azeroth-survivors-re/src'
    block_after = load_script('coop_directory_checks', ROOT / 'scripts/check-coop-directory-transport.py').block_after

    def ordered(file, marker, *tokens):
        body = block_after((source / file).read_text(), marker)
        cursor = 0
        for token in tokens:
            cursor = body.index(token, cursor) + len(token)

    ordered('gameplay/terminal.rs', 'TerminalAction::Again|TerminalAction::Menu=>',
            'service.leave_guest_run(', 'guest.settle(', 'publish_local_departure(', 'queue_delivery(')
    ordered('gameplay/terminal.rs', 'fn input(', 'let action = if action == TerminalAction::Again',
            'is_some_and(Mechanics::has_party)', 'TerminalAction::Menu', 'if action == TerminalAction::Menu && !active_client')
    ordered('gameplay/mod.rs', 'fn finish_guest_engine_logout(',
            'SessionEvent::LogoutResponse', 'flush_events(world)', 'finish_guest_departure(',
            'replica.settle(', 'publish_local_departure(', 'publish_client_logout(', 'AppExit::Success')
    ordered('coop/session.rs', 'pub fn finish_host_world(', 'world_hero.is_some()',
            'peer.flush(now)', 'peer.connection.send(&end)', 'world_hero_removed(')
    ordered('coop_runtime.rs', 'fn finish_host_world(', 'flush_engine_events()', 'driver.finish_host_world(')
    ordered('coop_directory.rs', 'pub(crate) fn finish_host_world(', 'runtime.finish_host_world(',
            'take_service_commands()', 'send_relay(')
    ordered('gameplay/mod.rs', 'fn finish_client_delivery(', 'finish_host_world(world)', 'publish_client_logout(world)')
    for file in ['gameplay/coop.rs', 'gameplay/coop_publish.rs']:
        text = (source / file).read_text()
        assert 'runtime.finish_host_world(' in text and 'runtime.send(Some(client), NativeMessage::End)' not in text
    print('PASS: eight current PE spans, 18 instruction anchors, two dispatch cells and guest/host departure source guards')


if __name__ == '__main__':
    if sys.argv[1:] == ['--end-run']:
        guest_end_run()
    elif sys.argv[1:] == ['--current-world-departure']:
        current_world_departure()
    else:
        main()
