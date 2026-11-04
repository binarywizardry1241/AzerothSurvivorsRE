#!/usr/bin/env python3
"""Verify bounded reconnect/departure contracts without compiling or networking."""
import hashlib
import itertools
import json
import platform
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / 'docs/analysis/evidence/0.123.0/coop-reconnect'


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def verified(row):
    path = ROOT / row['path']
    assert digest(path.read_bytes()) == row['sha256'], row['path']
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
    assert all(target[k] == proof['target'][k] for k in proof['target'])
    image = target_bytes(target)
    pe = load_script('reconnect_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    assembly = []
    ranges = []
    for row in proof['native_ranges']:
        start = int(row['start'], 0)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 0)
        raw = image[offset:offset + row['byte_count']]
        assert digest(raw) == row['sha256']
        instructions = list(decoder.disasm(raw, start))
        assert sum(i.size for i in instructions) == len(raw), row['role']
        assembly.append('// ' + row['role'] + '\n')
        assembly.extend(f'{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}'.rstrip() + '\n'
                        for i in instructions)
        ranges.append((start, raw))
    assert verified(proof['assembly']).read_text() == ''.join(assembly)
    for row in proof['native_data'] + proof['native_tables']:
        start = int(row['start'], 0)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 0)
        raw = image[offset:offset + row['byte_count']]
        assert digest(raw) == row['sha256']
        if 'value' in row:
            assert struct.unpack('<' + row['format'], raw)[0] == row['value']
        elif row['role'] == 'service-dispatch':
            entries = struct.unpack('<12i', raw)
            assert start + entries[4] == 0x145bd88d8  # decoded variant5, Wire25
        elif row['role'] == 'service-wire-parser-table':
            entries = struct.unpack('<13i', raw)
            assert start + entries[25 - 20] == 0x145e655e0
        elif row['role'] == 'host-transport-vtable':
            entries = struct.unpack('<9Q', raw)
            assert entries[0] == 0x145bd4870
            assert entries[3] == 0x145be3e90
            assert entries[6] == 0x145be4100
        ranges.append((start, raw))
    for query in proof['queries']:
        native = json.loads(verified(query['result']).read_text())['structuredContent']
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
        expected = query.get('normalized_sha256', query.get('normalized_text_sha256'))
        assert digest(native['normalized_result'].encode()) == expected
    assert proof['target_executed'] is False
    return ranges


def replay(ranges):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    pages, stops, reached = set(), set(), []

    def put(address, raw):
        for page in range(address & ~4095, (address + len(raw) + 4095) & ~4095, 4096):
            if page not in pages:
                uc.mem_map(page, 4096)
                pages.add(page)
        uc.mem_write(address, raw)

    for address, raw in ranges:
        put(address, raw)
    memory, stack = 0x22000000, 0x23000000
    put(memory, bytes(0x10000))
    put(stack, bytes(0x10000))

    def hook(_uc, address, _size, _context):
        if address in stops:
            reached.append(address)
            uc.emu_stop()

    uc.hook_add(UC_HOOK_CODE, hook)

    def write(name, value):
        uc.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)

    def word(address, value, fmt='Q'):
        uc.mem_write(address, struct.pack('<' + fmt, value))

    def read(address, fmt='Q'):
        return struct.unpack('<' + fmt, uc.mem_read(address, struct.calcsize(fmt)))[0]

    def bits(value, fmt='f'):
        return int.from_bytes(struct.pack('<' + fmt, value), 'little')

    def f32(value):
        return struct.unpack('<f', struct.pack('<f', value))[0]

    def run(start, destinations):
        stops.clear()
        stops.update(destinations)
        reached.clear()
        for address in stops:
            if address & ~4095 not in pages:
                put(address, b'\xcc')
        write('RSP', stack + 0x8000)
        uc.emu_start(start, max(stops) + 1, count=1000)
        assert len(reached) == 1, (hex(start), reached, hex(uc.reg_read(reg.UC_X86_REG_RIP)))
        return reached[0]

    counts = dict(deadline=0, spacing=0, receive_cap=0, departure=0,
                  endpoint=0, inner_remove=0, shared_drop=0, send_admission=0)
    write('R12', memory)
    write('RBP', stack + 0x4000)
    for seconds, nanos in itertools.product((0, 1, 2, 44, 45, 46, 60), (0, 1, 1000, 999999999)):
        elapsed = f32(f32(seconds) + f32(f32(nanos) / f32(1_000_000_000)))
        write('XMM0', bits(seconds))
        write('EDX', nanos)
        word(memory + 0x141, 0, 'B')
        stop = run(0x145bd9c92, (0x145bd9cda, 0x145bd9cb7))
        assert (stop == 0x145bd9cb7) == (elapsed > 45)
        assert read(memory + 0x141, 'B') == int(elapsed > 45)
        counts['deadline'] += 1
        write('XMM0', bits(seconds))
        write('EDX', nanos)
        stop = run(0x145bd9e4a, (0x145bda697, 0x145bd9e6e))
        assert (stop == 0x145bd9e6e) == (elapsed >= 2)
        counts['spacing'] += 1
    for received in (0, 1, 198, 199, 200, 201, 1000):
        write('RBX', received)
        stop = run(0x145c0e4f4, (0x145c0e658, 0x145c0e501))
        assert (stop == 0x145c0e501) == (received < 200)
        counts['receive_cap'] += 1
    for closing, alive, elapsed in itertools.product((0, 1), (0, 1), (0., 9.999, 10., 10.001, 60.)):
        write('R12', closing)
        write('RAX', alive)
        write('XMM6', bits(elapsed, 'd'))
        write('XMM9', bits(0., 'd'))
        write('XMM8', bits(10., 'd'))
        stop = run(0x145c0e5d7, (0x145c0e658, 0x145c0e4b4, 0x145c0e600))
        expected = 0x145c0e600 if closing and elapsed > 10 else (
            0x145c0e658 if alive else 0x145c0e4b4)
        assert stop == expected, (closing, alive, elapsed, hex(stop))
        counts['departure'] += 1
    for alive, retry in itertools.product((0, 1), (0, 1)):
        endpoint = memory + 0x1000
        original = bytes((alive, retry, 2, 3, 4, 5, 6, 7))
        uc.mem_write(endpoint - 8, original)
        write('RCX', endpoint - 0x30)
        write('R10', 0x30)
        run(0x145bd8bdd, (0x145bd8be4,))
        assert bytes(uc.mem_read(endpoint - 8, 8)) == bytes((0,)) + original[1:]
        counts['endpoint'] += 1
    for marker, count in itertools.product((0x80, 0xff), (1, 2, 100)):
        table, service = memory + 0x3000, memory + 0x5000
        write('RCX', table)
        write('RAX', 7)
        write('R9', 11)
        write('R8', 0)
        write('RDX', marker)
        write('RBP', stack + 0x4000)
        word(stack + 0x4300, service)
        word(service + 0x1e0, count)
        run(0x145bd8cfe, (0x145bd8d17,))
        assert read(service + 0x1e0) == count - 1
        assert read(table + 7, 'B') == marker
        assert read(table + 27, 'B') == marker
        counts['inner_remove'] += 1
    for references in (1, 2, 3, 100):
        word(memory, memory + 0x100)
        word(memory + 0x100, references)
        write('RCX', memory)
        stop = run(0x145bd4870, (0x145bd487e, 0x145bf40a0))
        assert read(memory + 0x100) == references - 1
        assert (stop == 0x145bf40a0) == (references == 1)
        counts['shared_drop'] += 1
    for alive in (0, 1, 2, 255):
        endpoint = memory + 0x1000
        word(endpoint - 8, alive, 'B')
        write('RCX', endpoint - 0x30)
        write('R10', 0x30)
        stop = run(0x145be3f9f, (0x145be3fa8, 0x145be401c))
        assert (stop == 0x145be3fa8) == (alive == 1)
        counts['send_admission'] += 1
    return counts


def source_checks():
    session = (ROOT / 'crates/azeroth-survivors-re/src/coop/session.rs').read_text()
    helper = session.split('pub fn service_peer_departed(', 1)[1].split('\n}', 1)[0]
    assert 'service_peer_closed(hosts, id);' in helper
    assert 'protocol.lock().unwrap().remove(id);' in helper
    directory = (ROOT / 'crates/azeroth-survivors-re/src/coop_directory.rs').read_text()
    dispatch = directory.split('DirectoryResponse::Number { tag: 25, value } => {', 1)[1].split('\n                    }', 1)[0]
    assert 'service_peer_departed(' in dispatch and '&service.relay_protocol' in dispatch
    assert dispatch.index('drain_service_relay(') < dispatch.index('service_peer_departed(')
    receive_dispatch = directory.split('DirectoryResponse::Bytes { value, bytes } => {', 1)[1].split(
        'DirectoryResponse::Structured29 {', 1)[0]
    assert (receive_dispatch.index('service_guest_receive(')
            < receive_dispatch.index('service_host_receive(')
            < receive_dispatch.index('drain_service_relay('))
    assert receive_dispatch.rstrip().endswith('drain_service_relay(&mut service);\n                    }')
    assert (directory.index('DirectoryResponse::Bytes { value, bytes } => {')
            < directory.index('poll_secondary(&mut service'))
    send = session.split('fn send(&mut self, payload: &[u8])', 1)[1].split('fn receive(', 1)[0]
    assert 'let can_send = if *guest' in send and 'peer.alive' in send
    assert send.index('if !can_send') < send.index('protocol.lock().unwrap().queue')
    assert 'Self::Relay { .. } => {}' not in send
    lifetime = (ROOT / 'crates/azeroth-survivors-re/src/coop/relay_lifetime.rs').read_text()
    assert 'elapsed(now, started) > 45.0' in lifetime
    assert 'elapsed(now, self.started) < 2.0' in lifetime
    assert 'self.retry_started = None;' in lifetime
    pump = session.split('pub fn next_host_event(', 1)[1].split('pub fn tick(', 1)[0]
    assert 'if tick.frames < MAX_MESSAGES_PER_CLIENT_TICK' in pump
    assert 'tick.frames += 1;' in pump and 'tick.pending.extend(messages)' in pump
    receive = pump.index('self.peers[tick.index].connection.receive()')
    drained = pump.index('self.peers[tick.index].drained = true;')
    retire = pump.index('if expired || !peer.connection.is_alive()')
    assert receive < drained < retire
    assert pump.index('self.retire_client(client);', retire) < pump.index('self.peers.remove(tick.index);')
    assert pump.index('self.peers.remove(tick.index);') < pump.index('tick.index += 1;')
    removal = session.split('fn retire_client(', 1)[1].split('\n    pub fn ', 1)[0]
    assert removal.index('self.server.disconnect(client);') < removal.index('self.collect_membership();')
    assert removal.index('self.collect_membership();') < removal.index('PartyEvent::Removed')
    gameplay = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/coop.rs').read_text()
    membership = gameplay.split('let mut events = std::collections::VecDeque::from', 1)[1].split('match incoming.message', 1)[0]
    assert 'MembershipEvent::Left' in membership and 'game.leave_party_hero(slot)' in membership
    assert membership.index('game.leave_party_hero(slot)') < membership.index('PartyEvent::Removed')
    assert 'driver.next_host_event()' in membership
    rustfmt = ROOT / '.tools/rust' / ('1.98.1-' + ('aarch64' if platform.machine() == 'arm64' else 'x86_64') + '-apple-darwin/bin/rustfmt')
    for path in ('crates/azeroth-survivors-re/src/coop/session.rs', 'crates/azeroth-survivors-re/src/coop_directory.rs'):
        parsed = subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'],
                                input=(ROOT / path).read_text(), text=True, capture_output=True)
        assert parsed.returncode == 0, parsed.stderr


def main():
    proof = json.loads((BASE / 'manifest.json').read_text())
    ranges = verify(proof)
    counts = replay(ranges)
    source_checks()
    print(json.dumps({'status': 'pass', 'native_cases': counts, 'total_cases': sum(counts.values()),
                      'query_receipts': len(proof['queries']),
                      'native_instruction_count': sum(row['instruction_count'] for row in proof['native_ranges']),
                      'target': proof['target'], 'rust_syntax_paths': 2,
                      'compiled_or_networked': False}, indent=2))


if __name__ == '__main__':
    main()
