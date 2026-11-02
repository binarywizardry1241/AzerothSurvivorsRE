#!/usr/bin/env python3
"""Check current AS delay/smoothing contracts with isolated native instructions.

Synthetic memory and typed hash/container/CRT/packet-writer seams replace the
surrounding application. This compiles no source and opens no socket or game.
"""
import hashlib
import json
import math
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes, project_path
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / 'docs/analysis/evidence/0.123.0/coop-smoothing'


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def bits(value):
    return struct.unpack('<I', struct.pack('<f', value))[0]


def packed(guid):
    lanes = guid.to_bytes(8, 'little')
    return bytes([sum((byte != 0) << lane for lane, byte in enumerate(lanes))]) + bytes(b for b in lanes if b)


def spline(guid, start, end, duration=1000, count=1, move_type=0):
    body = packed(guid) + struct.pack('<3fIB', *start, 77, move_type)
    if move_type == 0:
        body += struct.pack('<III3f', 0x100, duration, count, *end)
    return body


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    selected = latest_target(verify=True)
    assert proof['target'] == {key: selected[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(selected)
    pe = load_script('smooth_check_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    for row in proof['native_ranges'] + proof['native_data']:
        start = int(row['start'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row['byte_count']]
        assert hashlib.sha256(raw).hexdigest() == row['sha256'], row['role']
        if row in proof['native_ranges']:
            instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start))
            assert sum(instruction.size for instruction in instructions) == len(raw), row['role']
    for table, index, branch in [(0x1476acce4, 19, 0x145c305b2),
                                 (0x1476acce4, 5, 0x145c2fc09),
                                 (0x1476b84f4, 20, 0x145ccbbf8)]:
        offset = pe.rva_offset(table - pe.image_base) + index * 4
        assert table + struct.unpack_from('<i', image, offset)[0] == branch
    for query in proof['queries']:
        for name in ('plan', 'journal', 'result', 'raw_input', 'canonical_extract'):
            row = query[name]
            assert hashlib.sha256(project_path(row['path']).read_bytes()).hexdigest() == row['sha256']
        record = json.loads(project_path(query['result']['path']).read_text())
        native = record.get('structuredContent') or json.loads(record['content'][0]['text'])
        verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
        assert native['normalized_result'] == project_path(query['canonical_extract']['path']).read_text()
    source = (ROOT / 'crates/azeroth-survivors-re/src/coop/smooth.rs').read_text()
    for token in ['now - *at > 10.0', '*previous >= offset', 'self.delay_ms < 40.0',
                  'distance(*position, raw) <= 20.0', '!(length <= 1.0)',
                  'body.len() < 41 || word(body, 25) != 1', 'word(body, 21).max(1)',
                  'distance(*position, delayed) <= 20.0', 'distance(start, raw) < 0.25',
                  '(speed * 1.6)', 'self.splines.remove', '0xda | 0xdb | 0xee']:
        assert token in source, token
    game = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/coop.rs').read_text()
    assert 'smooth' not in game.split('pub(crate) fn leave(', 1)[1].split('fn zone_equipment_ids', 1)[0]
    receive = game.split('fn receive(', 1)[1].split('fn bootstrap(', 1)[0]
    assert 'driver.smooth.sample(milliseconds, time.elapsed_secs_f64())' in receive
    assert receive.index('state.guest_engine_packet(') < receive.index('driver.smooth.packet(') < receive.index('packet.decode_server()')
    assert 'inbound.0.push((packet.opcode, packet.payload));' in receive
    assert 'state.leave();' in receive.split('NativeMessage::ZoneKey(zone)', 1)[1]
    assert 'state.leave();' in game.split('fn finish_transport_lost(', 1)[1].split('fn roster_row(', 1)[0]
    wire = (ROOT / 'crates/azeroth-survivors-re/src/coop/replication.rs').read_text()
    assert 'Time(u32)' in wire and '21 => NativeMessage::Time(reader.word()?)' in wire
    assert 'out.push(21);' in wire and 'milliseconds.to_le_bytes()' in wire
    session = (ROOT / 'crates/azeroth-survivors-re/src/coop/session.rs').read_text()
    assert 'pub smooth: super::smooth::Smooth' in session
    assert 'smooth: super::smooth::Smooth::default()' in session.split('fn empty()', 1)[1].split('pub fn open(', 1)[0]
    assert 'self.smooth = super::smooth::Smooth::default();' in session.split('pub fn close(', 1)[1]
    flush = session.split('pub fn flush(', 1)[1].split('pub fn send_message(', 1)[0]
    assert 'now - self.last_host_flush >= 1.0 / 60.0' in flush
    assert 'if !peer.outgoing.is_empty()' in flush
    assert 'peer.outgoing.insert(0, NativeMessage::Time((now * 1000.0) as u64 as u32));' in flush
    assert flush.index('peer.outgoing.insert(') < flush.index('encode_batch(&peer.outgoing)')
    return image, pe


class Native:
    def __init__(self, image, pe, proof):
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
        import unicorn.x86_const as reg
        self.reg = reg
        self.machine = Uc(UC_ARCH_X86, UC_MODE_64)
        self.pages = set()
        for row in proof['native_ranges'] + proof['native_data']:
            start = int(row['start'], 16)
            offset = pe.rva_offset(start - pe.image_base)
            self.map(start, image[offset:offset + row['byte_count']])
        self.memory = 0x22000000
        self.stack = 0x23000000
        self.stop = 0x24000000
        self.machine.mem_map(self.memory, 0x10000)
        self.machine.mem_map(self.stack, 0x10000)
        self.machine.mem_map(self.stop, 0x1000)
        self.state = self.memory
        self.out = self.memory + 0x100
        self.packet = self.memory + 0x200
        self.body = self.memory + 0x1000
        self.table = self.memory + 0x3000
        self.records = {}
        self.steps = 0
        self.writer_calls = 0
        self.encoded = bytearray()
        self.put(self.state + 0x20, self.table, 'Q')
        self.put(self.state + 0x28, 0, 'Q')
        self.machine.mem_write(self.table, b'\xff' * 16)
        self.put(self.state, 64, 'Q')
        self.put(self.state + 8, self.memory + 0x5000, 'Q')
        self.seams = {0x140051b90, 0x145bde900, 0x145c67c50, 0x1400021d0,
                      0x146005081, 0x14600508d, 0x14600509f,
                      0x145e640f0, 0x145e64290}
        for address in self.seams:
            self.map(address, b'\xc3')
        self.machine.hook_add(UC_HOOK_CODE, self.hook)

    def map(self, address, raw):
        for page in range(address & ~4095, (address + len(raw) + 4095) & ~4095, 4096):
            if page not in self.pages:
                self.machine.mem_map(page, 4096)
                self.pages.add(page)
        self.machine.mem_write(address, raw)

    def put(self, address, value, fmt):
        self.machine.mem_write(address, struct.pack('<' + fmt, value))

    def get(self, address, fmt):
        return struct.unpack('<' + fmt, self.machine.mem_read(address, struct.calcsize(fmt)))[0]

    def xmm(self, index):
        value = self.machine.reg_read(getattr(self.reg, f'UC_X86_REG_XMM{index}'))
        return struct.unpack('<f', (value & 0xffffffff).to_bytes(4, 'little'))[0]

    def record(self, guid, start, end, duration, now):
        record = struct.pack('<dd3f3f', duration, now, *start, *end)
        self.records[guid] = record
        self.put(self.table - 0x30, guid, 'Q')
        self.machine.mem_write(self.table - 0x28, record)
        self.machine.mem_write(self.table, b'\0' + b'\xff' * 15)
        self.put(self.state + 0x38, 1, 'Q')

    def hook(self, _machine, address, _size, _context):
        self.steps += 1
        if address not in self.seams:
            return
        m, r = self.machine, self.reg
        if address == 0x140051b90:
            m.reg_write(r.UC_X86_REG_RAX, 0)
        elif address == 0x145bde900:
            guid = m.reg_read(r.UC_X86_REG_R8)
            raw = bytes(m.mem_read(m.reg_read(r.UC_X86_REG_R9), 40))
            duration, now, *coordinates = struct.unpack('<dd3f3f', raw)
            self.record(guid, coordinates[:3], coordinates[3:], duration, now)
        elif address == 0x145c67c50:
            self.writer_calls += 1
            stack = m.reg_read(r.UC_X86_REG_RSP)
            guid = m.reg_read(r.UC_X86_REG_RDX)
            start = struct.unpack('<3f', m.mem_read(m.reg_read(r.UC_X86_REG_R8), 12))
            end = struct.unpack('<3f', m.mem_read(m.reg_read(r.UC_X86_REG_R9), 12))
            duration = self.get(stack + 0x30, 'I')
            body = spline(guid, start, end, max(duration, 1))
            self.write_packet(body)
        elif address in (0x145e640f0, 0x145e64290):
            value = m.reg_read(r.UC_X86_REG_EDX)
            self.encoded.extend(struct.pack('<B' if address == 0x145e640f0 else '<I', value & (255 if address == 0x145e640f0 else 0xffffffff)))
            m.reg_write(r.UC_X86_REG_RAX, m.reg_read(r.UC_X86_REG_RCX))
        elif address in (0x146005081, 0x14600508d, 0x14600509f):
            value = {0x146005081: lambda: math.hypot(self.xmm(0), self.xmm(1)),
                     0x14600508d: lambda: math.sin(self.xmm(0)),
                     0x14600509f: lambda: math.cos(self.xmm(0))}[address]()
            m.reg_write(r.UC_X86_REG_XMM0, bits(value))
        stack = m.reg_read(r.UC_X86_REG_RSP)
        m.reg_write(r.UC_X86_REG_RIP, self.get(stack, 'Q'))
        m.reg_write(r.UC_X86_REG_RSP, stack + 8)

    def write_packet(self, body, opcode=0xdd):
        self.machine.mem_write(self.body + 0x1000, body)
        self.machine.mem_write(self.out, struct.pack('<QQQH6x', len(body), self.body + 0x1000, len(body), opcode))

    def run(self, opcode, body, delay=0, now=10):
        m, r = self.machine, self.reg
        self.put(self.state + 0x50, delay, 'd')
        m.mem_write(self.body, body)
        m.mem_write(self.packet, struct.pack('<QQQH6x', len(body), self.body, len(body), opcode))
        stack = self.stack + 0xf000
        self.put(stack, self.stop, 'Q')
        for register, value in ((r.UC_X86_REG_RSP, stack), (r.UC_X86_REG_RCX, self.out),
                                (r.UC_X86_REG_RDX, self.state), (r.UC_X86_REG_R8, self.packet),
                                (r.UC_X86_REG_XMM3, struct.unpack('<Q', struct.pack('<d', now))[0])):
            m.reg_write(register, value)
        m.emu_start(0x145be0a60, self.stop, count=5000)
        cap, pointer, length, code = struct.unpack('<QQQH6x', m.mem_read(self.out, 32))
        return code, bytes(m.mem_read(pointer, length))

    def sample(self, host_ms, now):
        m, r = self.machine, self.reg
        stack = self.stack + 0xf000
        self.put(stack, self.stop, 'Q')
        m.reg_write(r.UC_X86_REG_RSP, stack)
        m.reg_write(r.UC_X86_REG_RCX, self.state)
        m.reg_write(r.UC_X86_REG_EDX, host_ms)
        m.reg_write(r.UC_X86_REG_XMM2, struct.unpack('<Q', struct.pack('<d', now))[0])
        m.emu_start(0x145be08a0, self.stop, count=5000)
        return self.get(self.state + 0x50, 'd')

    def milliseconds(self, now):
        m, r = self.machine, self.reg
        m.reg_write(r.UC_X86_REG_XMM6, struct.unpack('<Q', struct.pack('<d', now))[0])
        m.emu_start(0x145c13085, 0x145c130d3, count=100)
        return m.reg_read(r.UC_X86_REG_EAX)

    def serialize_clock(self, milliseconds):
        m, r = self.machine, self.reg
        m.reg_write(r.UC_X86_REG_RSP, self.stack + 0xf000)
        m.reg_write(r.UC_X86_REG_RBP, self.stack + 0x8000)
        m.reg_write(r.UC_X86_REG_RDI, self.packet)
        self.put(self.packet + 8, milliseconds, 'I')
        m.emu_start(0x145ccbbf8, 0x145ccbc10, count=100)
        return bytes(self.encoded)


def replay(image, pe, proof):
    cases, steps = 0, 0
    for opcode in range(0xaa, 0xef):
        for flags in range(16):
            native = Native(image, pe, proof)
            body = packed(0x123456) + struct.pack('<II4f', flags, 1234, 2, 3, 4, 0)
            code, output = native.run(opcode, body, delay=1000)
            allowed = (0xb5 <= opcode <= 0xcb and opcode != 0xc7) or opcode in (0xda, 0xdb, 0xee)
            x, y = struct.unpack_from('<2f', output, len(packed(0x123456)) + 8)
            forward, left = bool(flags & 1) - bool(flags & 2), bool(flags & 4) - bool(flags & 8)
            length = math.hypot(forward, left)
            expected = (2 + forward / length * 7, 3 + left / length * 7) if allowed and length else (2, 3)
            assert math.isclose(x, expected[0], abs_tol=1e-6) and math.isclose(y, expected[1], abs_tol=1e-6), (opcode, flags, x, y)
            assert code == opcode
            cases += 1; steps += native.steps
    for delay, expected_x in [(0, 2), (39.999, 2), (40, 2.28), (500, 5.5), (1000, 9), (9000, 9)]:
        native = Native(image, pe, proof)
        body = packed(1) + struct.pack('<II4f', 1, 0, 2, 3, 4, 0)
        _, output = native.run(0xb5, body, delay)
        assert math.isclose(struct.unpack_from('<f', output, 10)[0], expected_x, abs_tol=1e-6)
        cases += 1; steps += native.steps
    for angle in [f32(math.pi / 2), f32(math.pi), f32(-math.pi / 2)]:
        for flags in [1, 2, 4, 8, 5, 10]:
            native = Native(image, pe, proof)
            body = packed(1) + struct.pack('<II4f', flags, 0, 2, 3, 4, angle)
            _, output = native.run(0xb5, body, 500)
            x, y, z = struct.unpack_from('<3f', output, 10)
            forward, left = bool(flags & 1) - bool(flags & 2), bool(flags & 4) - bool(flags & 8)
            scale = 3.5 / math.hypot(forward, left)
            assert math.isclose(x, 2 + (forward * math.cos(angle) - left * math.sin(angle)) * scale, abs_tol=1e-6)
            assert math.isclose(y, 3 + (left * math.cos(angle) + forward * math.sin(angle)) * scale, abs_tol=1e-6)
            assert z == 4
            cases += 1; steps += native.steps
    for prior, delay, count, duration, writes in [
        (None, 0, 1, 1000, 0), (None, 100, 1, 1000, 1),
        (None, 2000, 1, 1000, 1), (None, 0, 2, 1000, 0),
        (None, 100, 1, 0, 1), ((0.249, 0, 8), 0, 1, 1000, 0),
        ((0.25, 0, 8), 0, 1, 1000, 1), ((20, 0, 8), 0, 1, 1000, 1),
        ((20.001, 0, 8), 0, 1, 1000, 0),
    ]:
        native = Native(image, pe, proof)
        if prior is not None: native.record(7, prior, prior, 0, 10)
        original = spline(7, (0, 0, 1), (7, 0, 5), duration, count)
        _, output = native.run(0xdd, original, delay)
        assert native.writer_calls == writes, (prior, delay, count, duration, native.writer_calls)
        if not writes: assert output == original
        else:
            assert output[:2] == packed(7)
            serialized = struct.unpack_from('<I', output, 2 + 21)[0]
            assert serialized >= 1
        cases += 1; steps += native.steps
    for prior, delay, expected_start, expected_duration in [
        (None, 100, f32(0.7), 900), (None, 2000, 7, 1),
        ((-7, 0, 8), 0, -7, 1250),
    ]:
        native = Native(image, pe, proof)
        if prior is not None: native.record(7, prior, prior, 0, 10)
        _, output = native.run(0xdd, spline(7, (0, 0, 1), (7, 0, 5)), delay)
        assert struct.unpack_from('<f', output, 2)[0] == expected_start
        assert struct.unpack_from('<I', output, 23)[0] == expected_duration
        cases += 1; steps += native.steps
    for prior, expected in [(None, 0), ((1, 0, 4), 0), ((1.001, 0, 4), 1),
                            ((20, 0, 4), 1), ((20.001, 0, 4), 0)]:
        native = Native(image, pe, proof)
        if prior is not None: native.record(7, prior, prior, 0, 10)
        body = spline(7, (0, 0, 1), (0, 0, 1), move_type=1)
        native.run(0xdd, body)
        assert native.writer_calls == expected, (prior, native.writer_calls)
        cases += 1; steps += native.steps
    native = Native(image, pe, proof)
    samples = [(0, 1, 0), (10, 1.05, 40), (100, 1.1, 0), (100, 1.2, 100),
               (200, 11.1, 9900), (300, 11.2001, 0.1)]
    for host, now, expected in samples:
        assert math.isclose(native.sample(host, now), expected, abs_tol=1e-8), (host, now, native.get(native.state + 0x50, 'd'))
        cases += 1
    steps += native.steps
    for now, expected in [(0, 0), (-1, 0), (1.9999, 1999),
                          (4294967.295, 0xffffffff), (4294967.296, 0),
                          (4294967.297, 1), (float('nan'), 0),
                          (float('inf'), 0xffffffff)]:
        native = Native(image, pe, proof)
        assert native.milliseconds(now) == expected, (now, native.milliseconds(now))
        cases += 1; steps += native.steps
    for value in [0, 1, 0x12345678, 0xffffffff]:
        native = Native(image, pe, proof)
        assert native.serialize_clock(value) == b'\x15' + struct.pack('<I', value)
        cases += 1; steps += native.steps
    native = Native(image, pe, proof)
    native.record(7, (0, 0, 0), (7, 0, 0), 1000, 10)
    native.run(0xaa, struct.pack('<Q', 7))
    assert native.get(native.state + 0x38, 'Q') == 0
    cases += 1; steps += native.steps
    return {'isolated_native_cases': cases, 'original_instruction_steps': steps}


def main():
    proof = json.loads((BASE / 'manifest.json').read_text())
    image, pe = verify(proof)
    result = replay(image, pe, proof)
    result.update(status='passed', target=proof['target'], compilation=False, application_execution=False,
                  network_execution=False, parity_verified=False,
                  seams='typed hash/container, CRT hypot/sin/cos, deallocation and spline packet writer')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
