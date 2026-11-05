#!/usr/bin/env python3
"""Check current co-op wire/state source evidence without compiling or execution."""
import argparse
import hashlib
from itertools import product
import json
import math
import struct

from coverage_common import ROOT, installed_identity, latest_target, target_bytes
from native_terminal import NativeReplay
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
MANIFEST = ROOT / 'docs/analysis/evidence/0.115.0/coop-replication/manifest.json'
GUEST_SPELL_ROWS = ROOT / 'docs/analysis/evidence/0.141.0/coop-guest-spell-rows.json'
PROTOCOL_13 = ROOT / 'docs/analysis/evidence/0.141.0/coop-replication.json'
SETTLEMENT = ROOT / 'docs/analysis/evidence/0.141.0/party-achievement-settlement.json'


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def installed_ranges(path):
    proof = json.loads(path.read_text())
    target = installed_identity()
    assert target == proof['target']
    data = target_bytes(target)
    pe = load_script('coop_replication_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    ranges = {}
    for row in proof['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert digest(data[offset:offset + end - start]) == row['sha256'], row['role']
        ranges[row['role']] = (start, end)
    return proof, data, pe, ranges


def check_guest_spell_rows():
    proof, data, pe, ranges = installed_ranges(GUEST_SPELL_ROWS)
    replay = NativeReplay(data, pe)
    reg = replay.registers
    cpu = replay.machine
    limit = proof['row_limit']
    vector = replay.app + 0x100
    rows = replay.app + 0x4000
    drop_row = int(proof['drop_resource_row'], 16)
    resource_stop = int(proof['resource_loop'], 16)

    def drop_resource(address):
        if address != drop_row:
            return False
        dropped.append(cpu.reg_read(reg.UC_X86_REG_RCX))
        replay.return_seam()
        return True

    replay.seam = drop_resource
    counts = [0, 127, 128, 129, limit - 1, limit, limit + 1, limit + 20]
    for count in counts:
        dropped = []
        replay.reset('resources', [ranges['resource_cap']], [resource_stop])
        replay.put(vector, '<QQQ', count, rows, count)
        cpu.reg_write(reg.UC_X86_REG_RCX, replay.app)
        cpu.reg_write(reg.UC_X86_REG_RDX, vector)
        replay.run(ranges['resource_cap'][0])
        kept = min(count, limit)
        assert replay.get(vector + 16, '<Q') == (kept,)
        assert cpu.reg_read(reg.UC_X86_REG_RAX) == kept
        assert dropped == [rows + i * 0xb0 for i in range(kept, count)]

    replay.seam = None
    vectors = [
        [], [-1.0, float('nan'), 25.0, 0.5], [float('inf'), float('-inf')],
        [1.0] * 128 + [2.0], [1.0] * (limit - 1) + [float('inf'), 3.0],
        [1.0] * (limit - 3) + [float('nan'), -2.0, 25.0, 4.0],
    ]
    timer_stop = int(proof['timer_publish'], 16)
    timer_ranges = [ranges['timer_filter_clamp'], ranges['timer_compaction']]
    for values in vectors:
        replay.reset('timers', timer_ranges, [timer_stop])
        replay.put(replay.bp + 0x8d0, '<Q', vector)
        replay.put(vector + 8, '<QQQ', len(values), rows, len(values))
        cpu.reg_write(reg.UC_X86_REG_R12, replay.app)
        for index, value in enumerate(values):
            replay.put(rows + index * 12, '<IfB', index, value, index % 2)
        replay.run(timer_ranges[0][0])
        expected = [(i, min(max(value, 0.1), 10.0), i % 2)
                    for i, value in enumerate(values[:limit]) if math.isfinite(value)]
        assert cpu.reg_read(reg.UC_X86_REG_RDX) == rows
        assert cpu.reg_read(reg.UC_X86_REG_R8) == len(expected)
        assert [replay.get(rows + index * 12, '<IIB') for index in range(len(expected))] == [
            (i, struct.unpack('<I', struct.pack('<f', value))[0], flag)
            for i, value, flag in expected
        ]

    base = ROOT / 'crates/azeroth-survivors-re/src'
    state = (base / 'coop/client_state.rs').read_text()
    assert f'const MAX_GUEST_SPELL_ROWS: usize = {limit};' in state
    resources = state.split('pub fn sanitize_resources', 1)[1].split('/// Tag 12', 1)[0]
    timers = state.split('pub fn sanitize_timers', 1)[1].split('#[cfg(test)]', 1)[0]
    assert 'rows.truncate(MAX_GUEST_SPELL_ROWS);' in resources
    assert timers.index('rows.truncate(MAX_GUEST_SPELL_ROWS);') < timers.index('rows.retain(')
    assert 'f32::from_bits(row.value_bits).is_finite()' in timers
    assert '.clamp(0.1, 10.0)' in timers
    game = (base / 'gameplay/coop.rs').read_text()
    assert 'sanitize_timers(&mut rows); state.timers = rows;' in ' '.join(game.split())
    print(f'PASS: {len(counts)} resource cases and {len(vectors)} timer cases, '
          f'{replay.instructions} native steps and source publication guards')


def replay_state_cadence(replay, proof, ranges):
    first, send = ranges['state_cadence']
    skip = int(proof['cadence_skip'], 16)
    reg = replay.registers
    cpu = replay.machine
    phase = replay.app + 0x1000
    peer = replay.app + 0x3000
    game = replay.app + 0x5000
    period = struct.unpack('<d', replay.raw(ranges['state_period_literal'][0], 8))[0]
    assert period == 1.0

    def float_bits(value):
        return struct.unpack('<Q', struct.pack('<d', value))[0]

    cases = 0
    times = ((0., 0.), (4., 4.99), (4., 5.), (4., 5.01), (4., 7.), (4., 3.), (4., math.nan))
    for start in (first, int(proof['cadence_second_path'], 16)):
        for last, now in times:
            for mode, value in product((0, 1), range(256)):
                replay.reset('state cadence', [ranges['state_cadence']], [send, skip])
                replay.put(peer + 0x368, '<d', last)
                replay.put(replay.bp + 0x1290, '<Q', phase)
                replay.put(phase + 0x10f3, '<B', mode)
                replay.put(phase + 0x10f9 + mode, '<B', value)
                replay.put(phase + 0x10f9 + (1 - mode), '<B', 1 if value & 6 == 4 else 4)
                cpu.reg_write(reg.UC_X86_REG_RAX, peer)
                cpu.reg_write(reg.UC_X86_REG_RCX, peer)
                cpu.reg_write(reg.UC_X86_REG_R12, game)
                cpu.reg_write(reg.UC_X86_REG_XMM6, float_bits(now))
                cpu.reg_write(reg.UC_X86_REG_XMM9, float_bits(period))
                stop = replay.run(start)
                periodic = now - last >= period
                assert (stop == send) == (periodic or value & 6 == 4)
                assert replay.get(peer + 0x368, '<d') == (now if periodic else last,)
                cases += 1
    return cases


def replay_controls(replay, proof, ranges):
    reg = replay.registers
    cpu = replay.machine
    packet = replay.app + 0x1000
    reader = replay.bp + 0x618
    decoded = int(proof['control_reader_done'], 16)
    reject = int(proof['control_reader_reject'], 16)
    encoded = int(proof['control_writer_done'], 16)
    readers = [ranges[role] for role in ('control_read_dispatch', 'control_read_bool',
               'control_read_fields', 'control_read_u8', 'control_read_u32')]
    writers = [ranges[role] for role in ('control_write_dispatch', 'control_write_cases')]
    widths = {ranges['control_write_u8'][0]: 1, ranges['control_write_u32'][0]: 4}
    output = bytearray()

    def write_primitive(address):
        width = widths.get(address)
        if width is None:
            return False
        value = cpu.reg_read(reg.UC_X86_REG_RDX) & ((1 << (8 * width)) - 1)
        output.extend(value.to_bytes(width, 'little'))
        cpu.reg_write(reg.UC_X86_REG_RAX, cpu.reg_read(reg.UC_X86_REG_RCX))
        replay.return_seam()
        return True

    cases = 0
    offer = 0x11223344
    for kind in range(11):
        tail = struct.pack('<I', offer) if kind in (0, 3) else b''
        for argument in range(256):
            output.clear()
            replay.seam = write_primitive
            replay.reset('control encode', writers, [encoded])
            replay.put(packet + 8, '<BBHI', kind, argument, 0, offer)
            cpu.reg_write(reg.UC_X86_REG_RDI, packet)
            replay.run(writers[0][0])
            raw = argument if kind in (0, 2) else (argument & 1 if 7 <= kind <= 9 else 0)
            assert output == bytes((8, kind, raw)) + tail

            replay.seam = None
            replay.reset('control decode', readers, [decoded, reject])
            body = bytes((kind, argument)) + tail
            cpu.mem_write(packet, body + b'\xcc')
            replay.put(reader, '<QQQB', packet, len(body) + 1, 0, 1)
            cpu.reg_write(reg.UC_X86_REG_RSI, reader)
            assert replay.run(readers[0][0]) == decoded
            value = argument if kind in (0, 2) else int(7 <= kind <= 9 and argument != 0)
            assert cpu.reg_read(reg.UC_X86_REG_RAX) == (int.from_bytes(tail, 'little') << 24) | value
            assert replay.get(reader + 16, '<Q') == (len(body),)
            cases += 2

    for kind in range(11, 256):
        replay.reset('control reject', readers, [decoded, reject])
        cpu.mem_write(packet, bytes((kind, 0xff)))
        replay.put(reader, '<QQQB', packet, 2, 0, 1)
        cpu.reg_write(reg.UC_X86_REG_RSI, reader)
        assert replay.run(readers[0][0]) == reject
        cases += 1
    return cases


def replay_state_party_context(replay, target):
    proof = json.loads(SETTLEMENT.read_text())
    assert proof['target'] == target
    span = next(row for row in proof['native_spans'] if row['role'] == 'local-party-context')
    start, end = int(span['start'], 16), int(span['end_exclusive'], 16)
    assert replay.pe.rva_offset(start - replay.pe.image_base) == int(span['file_offset'], 16)
    assert digest(replay.raw(start, end - start)) == span['sha256']
    reg, cpu = replay.registers, replay.machine
    game, result = replay.app, replay.app + 0x2000

    def clone_empty_event_vector(address):
        if address != 0x146040e60:
            return False
        assert cpu.reg_read(reg.UC_X86_REG_RDX) == game + 0xe60
        replay.put(cpu.reg_read(reg.UC_X86_REG_RCX), '<QQQ', 0, 8, 0)
        replay.return_seam()
        return True

    replay.seam = clone_empty_event_vector
    cases = 0
    for mode, remote_count in product((0, 1, 2, 255), (0, 1, 4)):
        replay.reset('party-context', [(start, end)], [replay.done])
        replay.put(game + 0x10e3, '<B', mode)
        replay.put(game + 0xcf0, '<Q', remote_count)
        replay.put(game + 0xff8, '<Q', 3)
        replay.put(game + 0x47f, '<B', 5)
        replay.put(game + 0x10c8, '<I', 7)
        replay.put(game + 0xf68, '<If', 1, 123.0)
        cpu.reg_write(reg.UC_X86_REG_RCX, result)
        cpu.reg_write(reg.UC_X86_REG_RDX, game)
        replay.run(start)
        if mode:
            assert replay.get(result, '<QQQ') == (0, 4, 0)
            assert replay.get(result + 0x30, '<IfIBB') == (1, 123.0, 7, 3, 5)
        else:
            assert replay.get(result, '<q') == (-1,)
        cases += 1
    replay.seam = None
    return cases


def replay_hud_bound(replay, ranges):
    cpu, reg = replay.machine, replay.registers
    receive = ranges['guest_hud_admission']
    submit = ranges['host_hud_submission']
    cell = ranges['guest_hud_dispatch_cell'][0]
    assert 0x147aedcfc + struct.unpack('<i', replay.raw(cell, 4))[0] == receive[0]
    publish, reject, serialize = 0x145eccd34, 0x145ece288, 0x14604fa80
    record, core = replay.app, replay.app + 0x2000
    pointer = replay.app + 0x4000
    lengths = (0, 1, 65_535, 65_536, 65_537, 0x100000, 0xffffffff, 0xffffffffffffffff)
    for length in lengths:
        replay.reset('guest HUD admission', [receive], [publish, reject])
        replay.put(replay.bp + 0x8d0, '<Q', record)
        replay.put(record + 0x10, '<QQ', pointer, length)
        replay.put(core + 0x1fa8, '<QQ', pointer, pointer)
        cpu.reg_write(reg.UC_X86_REG_R12, core)
        stop = replay.run(receive[0])
        assert stop == (publish if length <= 65_536 else reject)
        if stop == publish:
            assert cpu.reg_read(reg.UC_X86_REG_RDX) == pointer
            assert cpu.reg_read(reg.UC_X86_REG_R8) == length

        replay.reset('host HUD submission', [submit], [serialize])
        replay.put(replay.bp + 0x1290, '<Q', core)
        replay.put(core + 0x1100, '<I', 3)
        replay.put(core + 0x1140, '<Q', 1)
        replay.put(replay.bp + 0xf40, '<Q', pointer)
        cpu.reg_write(reg.UC_X86_REG_RSI, length)
        cpu.reg_write(reg.UC_X86_REG_RDI, replay.bp + 0x320)
        replay.run(submit[0])
        packet = cpu.reg_read(reg.UC_X86_REG_RDX)
        kind, _, text, size = replay.get(packet, '<QQQQ')
        assert (kind, text, size) == (0x8000000000000009, pointer, length)
    return 2 * len(lengths)


def replay_hud_cadence(replay, ranges):
    cpu, reg = replay.machine, replay.registers
    load = ranges['host_hud_period_load']
    period = ranges['host_hud_period'][0]
    clock = ranges['host_hud_clock']
    due = ranges['host_hud_due']
    assert load[1] + struct.unpack('<i', replay.raw(load[1] - 4, 4))[0] == period
    assert struct.unpack('<d', replay.raw(period, 8))[0] == 0.2
    assert due[1] + struct.unpack('<i', replay.raw(due[1] - 4, 4))[0] == ranges['host_hud_builder'][0]
    peer_rows = replay.app + 0x1000
    skip_clock = 0x145ea91f0
    build = ranges['host_hud_builder'][0]
    times = (0.0, math.nextafter(0.2, 0.0), 0.2, math.nextafter(0.2, 1.0), 0.5, math.inf, math.nan)
    cases = 0
    for peer, now, last in product(range(2), times, (0.0, 0.1, math.inf, math.nan)):
        replay.reset('host HUD peer cadence', [load, clock, due],
                     [load[1], clock[1], skip_clock, due[1], build])
        replay.put(peer_rows + 0x360, '<d', last if peer == 0 else 19.0)
        replay.put(peer_rows + 0x8a0 + 0x360, '<d', last if peer == 1 else 19.0)
        row_offset = peer * 0x8a0
        cpu.reg_write(reg.UC_X86_REG_RAX, peer_rows + row_offset)
        cpu.reg_write(reg.UC_X86_REG_RBX, row_offset)
        cpu.reg_write(reg.UC_X86_REG_RCX, peer_rows)
        cpu.reg_write(reg.UC_X86_REG_XMM6, struct.unpack('<Q', struct.pack('<d', now))[0])
        expected = now - last >= 0.2
        assert replay.run(load[0]) == load[1]
        assert replay.run(clock[0]) == (clock[1] if expected else skip_clock)
        assert replay.run(due[0]) == (build if expected else due[1])
        assert cpu.mem_read(peer_rows + row_offset + 0x360, 8) == struct.pack('<d', now if expected else last)
        assert replay.get(peer_rows + (1 - peer) * 0x8a0 + 0x360, '<d') == (19.0,)
        cases += 1
    return cases


def replay_replication_recipients(replay, ranges):
    cpu, reg = replay.machine, replay.registers
    iterator = ranges['host_replication_recipient_iterator']
    caller = ranges['host_replication_recipient_iterator_call']
    assert caller[1] + struct.unpack('<i', replay.raw(caller[1] - 4, 4))[0] == iterator[0]
    result, cursor = replay.app, replay.app + 0x40
    rows, allocated = replay.app + 0x1000, replay.app + 0x4000

    def seam(address):
        if address == 0x1400021c0:
            assert cpu.reg_read(reg.UC_X86_REG_RCX) == 64
            assert cpu.reg_read(reg.UC_X86_REG_RDX) == 8
            cpu.reg_write(reg.UC_X86_REG_RAX, allocated)
        elif address != 0x140002200:
            return False
        replay.return_seam()
        return True

    replay.seam = seam
    cases = 0
    statuses = tuple(product((0, 1), (0, 1, 2)))
    for states in product(statuses, repeat=3):
        replay.reset('host State15/HUD10 recipients', [iterator], [replay.done])
        replay.put(cursor, '<QQQ', rows, rows + len(states) * 0x8a0, 0)
        for index, (assigned, synchronized) in enumerate(states):
            row = rows + index * 0x8a0
            replay.put(row, '<B', assigned)
            replay.put(row + 8, '<Q', 100 + index)
            replay.put(row + 0x89d, '<B', synchronized)
        cpu.reg_write(reg.UC_X86_REG_RCX, result)
        cpu.reg_write(reg.UC_X86_REG_RDX, cursor)
        replay.run(iterator[0])
        _, pointer, count = replay.get(result, '<QQQ')
        expected = [(index, 100 + index) for index, status in enumerate(states) if status == (1, 1)]
        assert count == len(expected)
        if count:
            assert pointer == allocated
            assert [replay.get(pointer + index * 16, '<QQ') for index in range(count)] == expected
        cases += 1
    replay.seam = None
    return cases


def replay_player_login_sync(replay, ranges):
    cpu, reg = replay.machine, replay.registers
    opcode = ranges['guest_player_login_opcode_gate']
    cell = ranges['guest_player_login_opcode_cell'][0]
    handler = ranges['guest_player_login_sync']
    variant = ranges['guest_player_login_sync_variant'][0]
    assert 0x147aeda5c + struct.unpack('<i', replay.raw(cell, 4))[0] == handler[0]
    assert struct.unpack('<Q', replay.raw(variant, 8))[0] == (1 << 63) + 5
    app, flushed, serialized, denied = replay.app, 0x145e66130, 0x14604fa80, 0x145eb5fb4
    after_serializer = 0x145eb5f08
    cases = 0
    for role, zone, requested in product((0, 1, 2, 0xffffffff), (False, True), (0, 1)):
        replay.reset('guest PlayerLogin to Sync6', [opcode, handler], [after_serializer, denied])
        replay.put(app + 0x1578, '<Q', app + 0x3000 if zone else 0)
        replay.put(app + 0x15a5, '<B', requested)
        cpu.reg_write(reg.UC_X86_REG_RAX, role)
        cpu.reg_write(reg.UC_X86_REG_RDX, 0x3d)
        cpu.reg_write(reg.UC_X86_REG_RSI, app)
        observed = []

        def seam(address):
            if address not in (flushed, serialized):
                return False
            observed.append(address)
            assert replay.get(app + 0x15a5, '<B') == (1,)
            if address == serialized:
                assert cpu.reg_read(reg.UC_X86_REG_RDX) == variant
            replay.return_seam()
            return True

        replay.seam = seam
        allowed = role <= 1 and zone
        assert replay.run(opcode[0]) == (after_serializer if allowed else denied)
        assert observed == ([flushed, serialized] if allowed else [])
        assert replay.get(app + 0x15a5, '<B') == (1 if allowed else requested,)
        cases += 1
    replay.seam = None
    return cases


def replay_host_sync_queue_tail(replay, ranges):
    cpu, reg = replay.machine, replay.registers
    start, end = ranges['host_sync_initial_queue_tail']
    app, peer, queue = replay.app, replay.app + 0x2000, replay.app + 0x4000
    tail = (0x101, 0x202, 0x303)
    cases = 0
    for queued in (0, 1, 3):
        replay.reset('host last initial Engine7 before Sync latch', [(start, end)], [end])
        replay.put(app + 0x1100, '<I', 3)
        replay.put(app + 0x1138, '<QQ', peer, 1)
        replay.put(replay.bp + 0x230, '<QQQ', *tail)
        replay.put(replay.bp + 0x2d8, '<Q', app)
        replay.put(replay.bp + 0x2f8, '<Q', 1)
        for register, value in [(reg.UC_X86_REG_RAX, queue), (reg.UC_X86_REG_RCX, queued * 3),
                                (reg.UC_X86_REG_RDI, peer), (reg.UC_X86_REG_R12, queued),
                                (reg.UC_X86_REG_R15, 1)]:
            cpu.reg_write(register, value)
        observed = []

        def seam(address):
            if address not in (0x145e99f20, 0x145ec8500):
                return False
            observed.append(address)
            assert replay.get(peer + 0x3a0, '<Q') == (queued + 1,)
            assert replay.get(queue + queued * 24, '<QQQ') == tail
            assert replay.get(peer + 0x89d, '<B') == (int(address == 0x145ec8500),)
            replay.return_seam()
            return True

        replay.seam = seam
        replay.run(start)
        assert observed == [0x145e99f20, 0x145ec8500]
        cases += 1
    replay.seam = None
    return cases


def replay_guest_end_run(replay, ranges):
    cpu, reg = replay.machine, replay.registers
    body = ranges['guest_end_run_settlement_and_logout']
    app, stop = replay.app, 0x145ecd299
    settle, recap, logout, drop = 0x145ebb750, 0x145ec30b0, 0x145eca550, 0x145e24fb0
    absent = (1 << 64) - 1
    cases = 0
    for guest, zone, state, sync in product((False, True), repeat=4):
        replay.reset('guest End18', [body], [stop])
        replay.put(app + 0x1100, '<Q', 0 if guest else 3)
        replay.put(app + 0x1578, '<Q', 9 if zone else 0)
        replay.put(app + 0x1460, '<Q', 1 if state else absent)
        replay.put(app + 0x15a5, '<B', int(sync))
        cpu.reg_write(reg.UC_X86_REG_R12, app)
        observed = []

        def seam(address):
            if address not in (settle, recap, logout, drop):
                return False
            observed.append(address)
            replay.return_seam()
            return True

        replay.seam = seam
        replay.run(body[0])
        expected = []
        if guest:
            if zone and state:
                expected.extend((settle, recap))
            if sync:
                expected.append(logout)
            if state:
                expected.append(drop)
        assert observed == expected
        assert replay.get(app + 0x1578, '<Q') == (9 if zone and not guest else 0,)
        assert replay.get(app + 0x1460, '<Q') == (1 if state and not guest else absent,)
        cases += 1
    replay.seam = None
    return cases


def replay_guest_hero_refresh(replay, ranges):
    cpu, reg = replay.machine, replay.registers
    body = ranges['guest_lobby_hero_refresh']
    app = replay.app
    cases = 0
    for role, accepted, zone in product((0, 1, 2), (0, 1), (0, 1)):
        replay.reset('guest lobby Hero4 refresh', [body], [0x145eca064, 0x145eca176])
        replay.put(app + 0x1100, '<I', role)
        replay.put(app + 0x15a4, '<B', accepted)
        replay.put(app + 0x1578, '<Q', zone)
        cpu.reg_write(reg.UC_X86_REG_RSI, app)
        allowed = role <= 1 and accepted and not zone
        assert replay.run(0x145eca03c) == (0x145eca064 if allowed else 0x145eca176)
        cases += 1
    return cases


def check_initial_world_splice(replay, ranges):
    _, login_call_end = ranges['host_initial_login_builder_call']
    login_opcode, login_opcode_end = ranges['host_initial_login_opcode']
    login_entry, login_entry_end = ranges['host_initial_login_first_entry']
    self_call, self_call_end = ranges['host_initial_self_create_call']
    speed_scale = ranges['host_initial_self_speed_scale'][0]
    assert login_call_end + struct.unpack('<i', replay.raw(login_call_end - 4, 4))[0] == 0x145fe4700
    assert replay.raw(login_opcode, login_opcode_end - login_opcode) == bytes.fromhex('66c745c03602')
    assert replay.raw(login_entry_end - 3, 3) == bytes.fromhex('0f1101')
    assert login_entry < self_call and replay.raw(self_call_end - 8, 3) == bytes.fromhex('41b001')
    assert self_call_end + struct.unpack('<i', replay.raw(self_call_end - 4, 4))[0] == 0x145f71dc0
    assert 0x145f71e3a + struct.unpack('<i', replay.raw(0x145f71e36, 4))[0] == speed_scale
    assert struct.unpack('<f', replay.raw(speed_scale, 4))[0] == 7.0


def check_protocol_13():
    proof, data, pe, ranges = installed_ranges(PROTOCOL_13)
    replay = NativeReplay(data, pe)
    cadence = replay_state_cadence(replay, proof, ranges)
    controls = replay_controls(replay, proof, ranges)
    party_context = replay_state_party_context(replay, proof['target'])
    hud = replay_hud_bound(replay, ranges)
    hud_cadence = replay_hud_cadence(replay, ranges)
    recipients = replay_replication_recipients(replay, ranges)
    guest_login = replay_player_login_sync(replay, ranges)
    host_sync = replay_host_sync_queue_tail(replay, ranges)
    guest_end = replay_guest_end_run(replay, ranges)
    hero_refresh = replay_guest_hero_refresh(replay, ranges)
    check_initial_world_splice(replay, ranges)

    base = ROOT / 'crates/azeroth-survivors-re/src'
    publish = ' '.join((base / 'gameplay/coop_publish.rs').read_text().split())
    cadence_source = publish.split('fn recipient_state_due(', 1)[1].split('fn publish(', 1)[0]
    assert 'let periodic = now - state.state_sent_at.get(&client).copied().unwrap_or(0.) >= 1.0;' in cadence_source
    assert 'if periodic { state.state_sent_at.insert(client, now); } periodic || terminal' in cadence_source
    assert publish.count('state.state_sent_at.insert(client, now);') == 1
    assert 'let state_due = synced && client.is_some_and(|client|' in publish
    assert 'recipient_state_due(&mut state, client, game.native_state_terminal(), now)' in publish
    publisher = publish.split('fn publish(', 1)[1].split('fn retire_inventory(', 1)[0]
    assert 'if !world.ready' not in publisher
    assert '.filter(|_| world.ready && synced)' in publisher
    assert 'let Some(display) = display else {' in publish
    no_display = publish.split('let Some(display) = display else {', 1)[1].split('let addon_due', 1)[0]
    assert 'client.filter(|_| state_due)' in no_display
    assert '.with_party_hero(slot, |game| game.native_state())' in no_display
    assert 'runtime.send(Some(client), NativeMessage::State(native));' in no_display
    assert 'state_due.then(|| game.native_state())' in publish
    assert 'if let Some(native) = native { runtime.send(Some(client), NativeMessage::State(native)); }' in publish

    mechanics = (base / 'gameplay/mechanics/coop.rs').read_text()
    context = mechanics.split('pub fn cooperative_feat_context(', 1)[1].split('pub fn set_equipment_ids(', 1)[0]
    assert 'return self.coop.replica_feats.clone();' in context
    assert 'if !self.has_party()' in context
    assert 'remotes' not in context and 'active_slot' not in context
    assert 'flag_8c: self.native_state_terminal(),' in mechanics

    wire = (base / 'coop/replication.rs').read_text()
    writer = wire.split('fn encode_control_argument(', 1)[1].split('pub fn encode_message(', 1)[0]
    assert '7..=9 => argument & 1,' in writer
    assert 'encode_control_argument(*kind, *argument)' in wire
    reader = wire.split('        8 => {', 1)[1].split('        10 =>', 1)[0]
    assert '7..=9 => u8::from(argument != 0),' in reader
    assert '0 | 2 => argument,' in reader
    assert 'if matches!(kind, 0 | 3) { reader.word()? } else { 0 }' in reader
    assert '10 => NativeMessage::HudJson(reader.text()?),' in wire
    guest = (base / 'gameplay/coop.rs').read_text()
    engine_arm = guest.split('} else if guest {\n                    let Some(packet) = state.guest_engine_packet(', 1)[1]
    engine_arm = engine_arm.split('NativeMessage::Time(milliseconds)', 1)[0]
    assert engine_arm.index('packet.decode_server()') < engine_arm.index('observe(') < engine_arm.index('SMSG_LOGIN_VERIFY_WORLD')
    assert '&mut state.pending_guest_wire' in engine_arm
    entry = guest.split('if !state.guest_login_started {', 1)[1].split('let identity = run.identity;', 1)[0]
    assert entry.index('local.begin(') < entry.index('world.request = Some(') < entry.index('LifecyclePacket::Synchronize')
    assert entry.index('state.guest_entry_run_speed') < entry.index('spawn.request = Some(') \
        < entry.index('wire.0.append(&mut state.pending_guest_wire)') < entry.index('let Some(snapshot) = state.state.as_ref()')
    end = guest.split('NativeMessage::End if guest => {', 1)[1].split('\n            _ => {}', 1)[0]
    assert end.index('state.zone.is_some() && state.state.is_some()') < end.index('state.settle(') \
        < end.index('state.sync_sent && local.active') < end.index('state.leave()')
    assert end.index('driver.accepted().is_some()') < end.index('LifecyclePacket::Hero(')
    hud_arm = guest.split('NativeMessage::HudJson(text) if guest && text.len() <= 65_536 => {', 1)[1]
    hud_arm = hud_arm.split('NativeMessage::Resources(', 1)[0]
    assert 'serde_json::from_str(&text)' in hud_arm and 'state.pick.receive_hud(&text,' in hud_arm
    overlay = (base / 'gameplay/coop_overlay.rs').read_text()
    hud_producer = overlay.split('synchronized.then(|| {', 1)[1].split('if let Some(resources)', 1)[0]
    assert 'now - cache.hud_sent_at.get(&client).copied().unwrap_or(0.0) >= 0.2' in hud_producer
    assert hud_producer.index('cache.hud_sent_at.insert(client, now)') < hud_producer.index('game.coop_hud(')
    hud_send = hud_producer.split('if let Some(hud) = hud {', 1)[1]
    assert 'runtime.send(Some(client), NativeMessage::HudJson(hud.to_string()));' in hud_send
    assert 'cache.hud.get(' not in overlay
    print(f'PASS: {cadence} State15 cadence cases, {party_context} party context cases, {controls} Control8 cases, {hud} HUD cases, '
          f'{hud_cadence} HUD cadence cases, {recipients} host recipient cases, {guest_login} guest login cases, '
          f'{host_sync} host Sync queue cases, {guest_end} guest End cases, {hero_refresh} Hero refresh cases, '
          f'{replay.instructions} native steps and source route checks')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--guest-spell-rows', action='store_true',
                        help='check current guest tag 11 and tag 12 admission')
    parser.add_argument('--protocol-13', action='store_true',
                        help='check 0.141.0 State15 cadence and Control8 wire')
    args = parser.parse_args()
    if args.protocol_13:
        check_protocol_13()
        return
    if args.guest_spell_rows:
        check_guest_spell_rows()
        return
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
                   'text.is_char_boundary(end)',
                   'clamp(0.1, 10.0)', 'pub bare: bool'):
        assert anchor in state, anchor
    assert wire.count('#[test]') == 6 and state.count('#[test]') == 3
    print(f'PASS:{len(owners)} native ranges,5 dispatch tables,{len(literals)} literals,'
          f'{len(retained["ghidra_queries"])} retained Ghidra identities;all19 wire tags '
          'and typed state source anchors;9 Rust regressions authored,unrun;'
          'no compilation,native execution,network or parity claim')


if __name__ == '__main__':
    main()
