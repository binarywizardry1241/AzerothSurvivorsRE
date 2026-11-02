#!/usr/bin/env python3
"""Replay bounded 0.119.0 shared-healing instructions without compiling a game.

This executes selected original instructions in isolated Unicorn scratch memory.
Allocation, visual/packet publication and full hero scheduling are declared seams;
these cases do not execute reconstructed Rust, sockets, a server or a game.
"""
import argparse
from collections import Counter
import hashlib
import importlib.util
import itertools
import json
import math
import re
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_INVALID
from unicorn import x86_const as R

SHA = '6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f'
PROOF = ROOT / 'docs/analysis/evidence/0.119.0/rejuvenation/manifest.json'
GAME, ROWS, EVENTS, DEF, SNAP, RATIOS = [0x20000000 + i * 0x10000 for i in range(6)]
FRAME, STACK, RET = 0x200e0000, 0x200f0000, 0x21000000


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def bits(value):
    return struct.unpack('<I', struct.pack('<f', value))[0]


def same_float(actual, expected):
    return bits(actual) == bits(expected) or (math.isnan(actual) and math.isnan(expected))


class Native:
    def __init__(self, image, pe):
        self.image, self.pe = image, pe
        self.u = Uc(UC_ARCH_X86, UC_MODE_64)
        self.u.mem_map(GAME, 0x100000)
        self.u.mem_map(RET, 0x1000)
        self.mapped = set()
        self.calls = {}
        self.u.hook_add(UC_HOOK_MEM_INVALID, self.missing)
        self.u.hook_add(UC_HOOK_CODE, self.code)
        self.regs(RSP=STACK, RBP=FRAME)
        self.put(STACK, '<Q', RET)

    def missing(self, _u, _access, address, _size, _value, _data):
        page = address & ~4095
        try:
            at = self.pe.rva_offset(page - self.pe.image_base)
        except ValueError:
            return False
        if page in self.mapped:
            return False
        self.u.mem_map(page, 4096)
        self.u.mem_write(page, self.image[at:at + 4096])
        self.mapped.add(page)
        return True

    def code(self, _u, address, _size, _data):
        action = self.calls.get(address)
        if action is not None:
            action(self)

    def put(self, address, fmt, *values):
        self.u.mem_write(address, struct.pack(fmt, *values))

    def get(self, address, fmt):
        return struct.unpack(fmt, self.u.mem_read(address, struct.calcsize(fmt)))

    def regs(self, **values):
        for name, value in values.items():
            self.u.reg_write(getattr(R, 'UC_X86_REG_' + name), value)

    def reg(self, name):
        return self.u.reg_read(getattr(R, 'UC_X86_REG_' + name))

    def xmm(self, name, value):
        self.regs(**{name: bits(value)})

    def returned(self):
        sp = self.reg('RSP')
        self.regs(RIP=self.get(sp, '<Q')[0], RSP=sp + 8)

    def run(self, start, end=RET, limit=30000):
        self.u.emu_start(start, end, count=limit)
        assert self.reg('RIP') == end, hex(self.reg('RIP'))


def aura(source, spell, ordinal=0):
    # Keep every non-key byte distinct so native stable compaction is checked.
    return struct.pack('<QIf fIff', source, 6, 0.25 + ordinal, 17.0 + ordinal,
                       spell, 50.0 + ordinal, 100.0 + ordinal)


def rows_at(n, rows):
    n.put(GAME + 0x3a8, '<3Q', 64, ROWS, len(rows))
    if rows:
        n.u.mem_write(ROWS, b''.join(rows))


def helper_cases(image, pe):
    cases = 0
    below = struct.unpack('<f', struct.pack('<I', bits(0.85) - 1))[0]
    values = [0.0, -0.0, below, f32(0.85), 1.0, math.inf, math.nan]
    positions = [(0.0, 0.0), (30.0, 0.0), (18.0, 24.0),
                 (30.00001, 0.0), (math.nan, 0.0), (math.inf, 0.0)]
    for state, own, share, (x, y) in itertools.product(range(6), [False, True], values, positions):
        n = Native(image, pe)
        # Healing's snapshot has a narrower gate than revive's state1/2 rows.
        eligible = state == 1
        n.put(GAME + 0xa00, '<3Q', 4, SNAP, 1)
        n.put(GAME + 0xa18, '<3Q', 4, RATIOS, 1)
        n.put(SNAP, '<3fB3x', x, y, 999.0, eligible)
        n.put(RATIOS, '<f', share)
        n.put(GAME + 0xb80, '<Q', 0 if own else 3)
        n.put(GAME + 0x4f0, '<3f', 0.0, 0.0, -999.0)
        n.regs(RCX=GAME)
        n.run(0x145b85e70)
        distance = f32(f32(y * y) + f32(x * x))
        expected = not own and eligible and share < f32(0.85) and distance <= 900.0
        assert bool(n.reg('RAX') & 255) == expected, (state, own, share, x, y)
        cases += 1
    # Unequal snapshot-vector lengths use their minimum, and empty is false.
    for positions_len, ratios_len in itertools.product(range(4), repeat=2):
        n = Native(image, pe)
        n.put(GAME + 0xa00, '<3Q', 4, SNAP, positions_len)
        n.put(GAME + 0xa18, '<3Q', 4, RATIOS, ratios_len)
        n.put(GAME + 0xb80, '<Q', 9)
        for i in range(3):
            n.put(SNAP + i * 16, '<3fB3x', 0.0, 0.0, 0.0, 1)
            n.put(RATIOS + i * 4, '<f', 0.0 if i == 2 else 1.0)
        n.regs(RCX=GAME)
        n.run(0x145b85e70)
        assert bool(n.reg('RAX') & 255) == (min(positions_len, ratios_len) > 2)
        cases += 1
    return cases


def snapshot_cases(image, pe):
    cases = 0
    for local, state, maximum, health in itertools.product(
            [False, True], range(6), [-5.0, -0.0, 0.5, 1.0, 10.0, math.inf, math.nan],
            [0.0, 0.25, 10.0, math.nan]):
        n = Native(image, pe)
        n.put(GAME + 0xc8a, '<B', state)
        n.put(GAME + 0x4f0, '<3f', 7.0, 8.0, 9.0)
        n.put(GAME + 0x4a0, '<f', maximum)
        n.put(GAME + 0x508, '<f', health)
        if local:
            n.regs(R14=GAME, RSI=SNAP, RAX=RATIOS)
            n.run(0x145b85a14, 0x145b85a69)
        else:
            n.put(DEF, '<2Q', SNAP + 0x1000, RATIOS + 0x1000)
            n.put(SNAP + 0x1000, '<3Q', 64, SNAP, 0)
            n.put(RATIOS + 0x1000, '<3Q', 64, RATIOS, 0)
            n.regs(RDI=GAME, RSI=DEF, R14=FRAME)
            n.run(0x145b243d3, 0x145b24470)
            assert n.get(SNAP + 0x1010, '<Q')[0] == 1
            assert n.get(RATIOS + 0x1010, '<Q')[0] == 1
        assert n.get(SNAP, '<3fB') == (7.0, 8.0, 9.0, state == 1)
        denominator = maximum if maximum > 1.0 else 1.0
        expected = f32(health / denominator)
        assert same_float(n.get(RATIOS, '<f')[0], expected)
        cases += 1
    return cases


def cast_preparation_cases(image, pe):
    cases = 0
    for duration, ordinary, talent in itertools.product(
            [-math.inf, -1.0, -0.0, 0.0, 0.01, 12.0, math.inf, math.nan],
            [0.5, 1.0, 2.0], [0.5, 1.0, 1.5]):
        n = Native(image, pe)
        n.put(DEF + 0x58, '<f', duration)
        n.put(SNAP + 0x20, '<f', ordinary)
        n.put(SNAP + 0x48, '<f', talent)
        n.put(GAME + 0xbdc, '<f', 17.0)
        n.regs(RSI=DEF, R12=SNAP, RDI=GAME)
        n.run(0x145bb9c80, 0x145bb9cb7)
        scaled = f32(f32(f32(f32(1.4) * duration) * ordinary) * talent)
        scaled = scaled if scaled > f32(0.1) else f32(0.1)
        actual = struct.unpack('<f', struct.pack('<I', n.reg('XMM6') & 0xffffffff))[0]
        assert same_float(actual, scaled)
        assert n.reg('XMM8') & 0xffffffff == bits(duration)
        assert n.reg('XMM10') & 0xffffffff == bits(17.0)
        cases += 1
    # The actual cast passes RAW duration and a normalized coefficient before
    # its visual, self aura insertion or local immediate-heal consumer.
    for health, neighbour, power, talent, duration in itertools.product(
            [80.0, 85.0, 85.01, 100.0], [False, True], [0.5, 1.0, 2.0],
            [1.0, 1.5], [0.0, 12.0]):
        n = Native(image, pe)
        n.put(GAME + 0xc85, '<B', 1)
        n.put(GAME + 0x4a0, '<f', 100.0)
        n.put(GAME + 0x508, '<f', health)
        n.put(GAME + 0xb80, '<Q', 0)
        n.put(GAME + 0x488, '<Q', 0xabc)
        n.put(GAME + 0xa30, '<3Q', 8, EVENTS, 0)
        n.put(GAME + 0xa00, '<3Q', 4, SNAP, 2)
        n.put(GAME + 0xa18, '<3Q', 4, RATIOS, 2)
        n.put(SNAP + 16, '<3fB3x', 0.0, 0.0, 999.0, neighbour)
        n.put(RATIOS + 4, '<f', 0.5)
        n.put(DEF + 0x40, '<I', 774)
        n.put(DEF + 0x6c, '<f', 0.3)
        n.regs(RSI=DEF, RDI=GAME)
        for name, value in [('XMM7', 100.0), ('XMM9', power), ('XMM11', talent),
                            ('XMM8', duration), ('XMM6', 16.8), ('XMM10', 17.0)]:
            n.xmm(name, value)
        n.calls[0x145bba8db] = lambda v: v.u.emu_stop()
        n.u.emu_start(0x145bbc25d, 0x145bbc2be, count=10000)
        accepted = health <= f32(f32(0.85) * 100.0) or neighbour
        assert n.reg('RIP') == (0x145bbc2be if accepted else 0x145bba8db)
        assert n.get(GAME + 0xa40, '<Q')[0] == int(accepted)
        assert n.get(GAME + 0x508, '<f')[0] == f32(health)
        assert n.get(GAME + 0x3b8, '<Q')[0] == 0
        if accepted:
            factor = f32(f32(math.sqrt(f32(power * talent))) * f32(1.4))
            coefficient = f32(factor * f32(0.3))
            total = f32(f32(100.0 * f32(0.3)) * factor)
            assert n.get(EVENTS + 36, '<f')[0] == duration
            assert n.get(EVENTS + 32, '<f')[0] == coefficient
            assert n.reg('XMM7') & 0xffffffff == bits(total)
        cases += 1
    return cases


def prune_cases(image, pe):
    cases = 0
    keys = [(0, 774), (101, 774), (202, 774), (0, 139), (101, 139)]
    sets = [[], keys, list(reversed(keys))]
    sets.extend(list(pattern) for length in range(1, 5)
                for pattern in itertools.product(keys[:3], repeat=length))
    for special, spell, entries in itertools.product([False, True], [774, 139], sets):
        n = Native(image, pe)
        rows = [aura(source, sid, i) for i, (source, sid) in enumerate(entries)]
        rows_at(n, rows)
        n.put(DEF + 0x40, '<I', spell)
        n.put(DEF + 0x100, '<B', special)
        n.regs(RCX=GAME + 0x3a8, RDX=DEF, R8=DEF + 0x100)
        n.run(0x145c20c50)
        expected = [row for row, (source, sid) in zip(rows, entries)
                    if sid != spell or (special and source != 0)]
        count = n.get(GAME + 0x3b8, '<Q')[0]
        assert count == len(expected)
        assert n.u.mem_read(ROWS, count * 32) == b''.join(expected)
        cases += 1
    return cases


def producer_cases(image, pe):
    cases = 0
    for enabled, source, coefficient, duration, grow in itertools.product(
            [0, 1, 2], [0, 4], [0.0, 0.42, math.nan], [0.1, 12.0], [False, True]):
        n = Native(image, pe)
        n.put(GAME + 0xc85, '<B', enabled)
        n.put(GAME + 0xb80, '<Q', source)
        n.put(GAME + 0x488, '<Q', 0xabc000 + source)
        n.put(GAME + 0x4f0, '<3f', 7.0, 8.0, 9.0)
        n.put(GAME + 0xa30, '<3Q', 1 if grow else 8, EVENTS, 1)
        n.u.mem_write(EVENTS, bytes([0x5a]) * (56 * 8))
        growth = []

        def allocate(v):
            assert v.reg('RCX') == GAME + 0xa30
            growth.append(True)
            v.put(GAME + 0xa30, '<Q', 8)
            v.returned()

        n.calls[0x145f948c0] = allocate
        n.regs(RCX=GAME, EDX=774)
        n.xmm('XMM2', coefficient)
        n.xmm('XMM3', duration)
        n.run(0x145b85270)
        assert n.get(GAME + 0xa40, '<Q')[0] == (2 if enabled == 1 else 1)
        assert bool(growth) == (enabled == 1 and grow)
        assert n.u.mem_read(EVENTS, 56) == bytes([0x5a]) * 56
        if enabled == 1:
            raw = bytes(n.u.mem_read(EVENTS + 56, 56))
            assert struct.unpack_from('<2Q3fI', raw) == (source, 0xabc000 + source, 7.0, 8.0, 9.0, 774)
            assert same_float(struct.unpack_from('<f', raw, 32)[0], coefficient)
            assert same_float(struct.unpack_from('<f', raw, 36)[0], duration)
            assert struct.unpack_from('<I', raw, 40)[0] == 14
            assert raw[44:] == bytes([0x5a]) * 12
        cases += 1
    return cases


def fanout_cases(image, pe):
    cases = 0
    entries = [(0, 0.0, 0.0), (1, 30.0, 0.0), (2, 18.0, 24.0),
               (3, 30.00001, 0.0), (4, math.nan, 0.0), (5, math.inf, 0.0)]
    for local, state, slot in itertools.product([False, True], range(7), range(6)):
        n = Native(image, pe)
        n.put(GAME + 0xc8a, '<B', state)
        n.put(GAME + 0xb80, '<Q', slot)
        n.put(GAME + 0x4f0, '<3f', 0.0, 0.0, -777.0)
        for i, (source, x, y) in enumerate(entries):
            n.put(EVENTS + 56 * i, '<2Q3f', source, 100 + source, x, y, 777.0)
        got = []

        def receive(v):
            assert v.reg('RCX') == GAME
            got.append((v.reg('RDX') - EVENTS) // 56)
            v.returned()

        n.calls[0x145b86da0] = receive
        if local:
            n.put(FRAME - 0x58, '<2Q', EVENTS, len(entries))
            n.regs(R12=GAME, RAX=len(entries))
            n.run(0x145b7dbc6, 0x145b7dc36)
        else:
            n.put(SNAP, '<3Q', 16, EVENTS, len(entries))
            n.put(DEF, '<Q', SNAP)
            n.regs(RSI=GAME, R8=DEF)
            n.run(0x145b245d9, 0x145b24643)
        expected = [i for i, (source, x, y) in enumerate(entries)
                    if state == 1 and source != slot
                    and f32(f32(y * y) + f32(x * x)) <= 900.0]
        assert got == expected, (local, state, slot, got, expected)
        cases += 1
    # The producer queue is detached once, with capacity/pointer/length reset.
    for count in range(5):
        n = Native(image, pe)
        n.put(GAME + 0xa30, '<3Q', 8, EVENTS, count)
        n.regs(R12=GAME)
        n.run(0x145b7db71, 0x145b7dbb2)
        assert n.get(FRAME - 0x60, '<3Q') == (8, EVENTS, count)
        assert n.get(GAME + 0xa30, '<3Q') == (0, 8, 0)
        cases += 1
    return cases


def recipient_cases(image, pe):
    cases = 0
    sets = [[], [(0, 774)], [(101, 774)], [(202, 774)],
            [(0, 774), (101, 774), (202, 774), (101, 139), (101, 774)]]
    for entries, spell, source, maximum, coefficient in itertools.product(
            sets, [139, 774, 8936], [0, 101, 202], [100.0, 271.25], [0.0, 0.42, math.nan]):
        n = Native(image, pe)
        rows = [aura(guid, sid, i) for i, (guid, sid) in enumerate(entries)]
        rows_at(n, rows)
        n.put(GAME + 0x4a0, '<f', maximum)
        n.put(GAME + 0x508, '<f', maximum / 2)
        n.put(GAME + 0xbdc, '<f', 7.0)
        n.put(EVENTS, '<2Q3fIffI', 9, source, 0.0, 0.0, 0.0, spell, coefficient, 12.0, 14)
        n.regs(RCX=GAME, RDX=EVENTS)
        # Stop before the existing aura/client publisher; allocation is avoided.
        n.run(0x145b86da0, 0x145b871f7)
        expected = [row for row, (guid, sid) in zip(rows, entries)
                    if sid != spell or (spell == 774 and guid != source)]
        count = n.get(GAME + 0x3b8, '<Q')[0]
        assert count == len(expected) + 1
        assert n.u.mem_read(ROWS, len(expected) * 32) == b''.join(expected)
        row = ROWS + len(expected) * 32
        assert n.get(row, '<Q')[0] == source
        assert n.get(row + 8, '<I')[0] == 6
        assert same_float(n.get(row + 12, '<f')[0], coefficient)
        assert n.get(row + 20, '<Iff')[:2] == (spell, 19.0)
        assert same_float(n.get(row + 28, '<f')[0], f32(maximum * f32(coefficient))), (
            entries, spell, source, maximum, coefficient, n.get(row + 28, '<f')[0])
        assert n.get(GAME + 0x508, '<f')[0] == maximum / 2
        cases += 1
    return cases


def instant_recipient_cases(image, pe):
    cases = 0
    for health, coefficient, duration in itertools.product(
            [0.0, 50.0, 99.0, 99.5, 100.0], [0.0, 0.005, 0.01, 0.015, 0.42, 1.0],
            [-1.0, 0.0, math.nan]):
        n = Native(image, pe)
        n.put(GAME + 0x488, '<Q', 77)
        n.put(GAME + 0x4a0, '<f', 100.0)
        n.put(GAME + 0x508, '<f', health)
        n.put(GAME + 0x640, '<3Q', 8, ROWS, 0)
        n.put(EVENTS, '<2Q3fIffI', 9, 101, 0.0, 0.0, 0.0, 8936, coefficient, duration, 14)
        logs, fields = [], []

        def log_packet(v):
            # Existing private packet constructor is a boundary, not replayed.
            sp = v.reg('RSP')
            logs.append((v.reg('RDX'), v.reg('R8'), v.reg('R9D'),
                         v.get(sp + 0x28, '<I')[0], v.get(sp + 0x30, '<B')[0]))
            v.u.mem_write(v.reg('RCX'), bytes(32))
            v.returned()

        def ceil_wire(v):
            # Existing CRT ceilf call is the isolated scalar rounding seam.
            value = struct.unpack('<f', struct.pack('<I', v.reg('XMM0') & 0xffffffff))[0]
            v.xmm('XMM0', float(math.ceil(value)))
            v.returned()

        def field(v):
            assert v.reg('RCX') == GAME + 0xb60
            fields.append((v.reg('EDX') & 0xffff, v.reg('R8D')))
            v.returned()

        n.calls.update({0x145b63580: log_packet, 0x145f94247: ceil_wire,
                        0x145a74ac0: field})
        n.regs(RCX=GAME, RDX=EVENTS)
        n.run(0x145b86da0)
        updated = min(f32(f32(100.0 * f32(coefficient)) + health), 100.0)
        effective = f32(updated - health)
        emitted = effective >= 1.0
        assert n.get(GAME + 0x508, '<f')[0] == updated
        assert n.get(GAME + 0x650, '<Q')[0] == int(emitted)
        assert logs == ([(77, 101, 8936, int(effective), 0)] if emitted else [])
        assert fields == ([(22, math.ceil(updated)), (28, 100)] if emitted else [])
        assert n.get(GAME + 0x3b8, '<Q')[0] == 0
        cases += 1
    return cases


def verify(image, pe, required):
    proof = json.loads(PROOF.read_text())
    assert proof['target']['sha256'] == SHA
    old = json.loads((ROOT / proof['reused_contracts']['manifest']).read_text())
    roles = set(proof['reused_contracts']['roles'])
    spans = proof['native_spans'] + [r for r in old['native_spans'] if r['role'] in roles]
    for row in spans:
        at = pe.rva_offset(int(row['start'], 16) - pe.image_base)
        assert at == int(row['file_offset'], 16)
        assert digest(image[at:at + row['byte_count']]) == row['sha256'], row['role']
    for row in proof['exports']:
        assert digest((ROOT / row['path']).read_bytes()) == row['sha256'], row['path']
    queries = proof['queries'] + [r for r in old['queries'] if r['role'] in proof['reused_queries']]
    present = 0
    for row in queries:
        path = ROOT / row['result']
        if not path.is_file():
            assert not required, row['result']
            continue
        data = path.read_bytes()
        assert digest(data) == row['result_sha256'], row['result']
        result = json.loads(data)['structuredContent']
        assert result['subject']['digest']['sha256'] == SHA
        assert result['evidence_id'] == row['evidence_id']
        assert result['analysis_profile']['digest'] == row['profile_digest']
        for kind in ('plan', 'journal'):
            assert digest((ROOT / row[kind]).read_bytes()) == row[kind + '_sha256']
        present += 1
    return len(spans), len(queries), present


def verify_definition_inputs(image, pe, proof):
    """Only the four current native inputs to the recovered shared-heal cast."""
    import re
    rows = proof['definition_inputs']['records']
    assert {r['spell_id'] for r in rows} == {139, 331, 774, 8936}
    catalog = (ROOT / 'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text()
    catalog = catalog.split('pub static ABILITIES:', 1)[1].split('pub static CLASSES:', 1)[0]
    chunks = re.findall(r'AbilityDefinition \{(.*?)\n    \},', catalog, re.S)
    source = {json.loads(re.search(r'\bkey:\s*("[^"]+")', c)[1]): c for c in chunks}
    for row in rows:
        at = pe.rva_offset(int(row['start'], 16) - pe.image_base)
        assert at == int(row['file_offset'], 16)
        raw = image[at:at + row['byte_count']]
        assert len(raw) == 120 and digest(raw) == row['sha256']
        chunk = source[row['key']]
        for binding in row['identity_strings']:
            pointer, size = struct.unpack_from('<QQ', raw, int(binding['descriptor_offset'], 16))
            assert pointer == int(binding['start'], 16) and size == binding['byte_count']
            offset = pe.rva_offset(pointer - pe.image_base)
            assert offset == int(binding['file_offset'], 16)
            payload = image[offset:offset + size]
            assert digest(payload) == binding['sha256'] and payload.decode() == binding['text']
            source_text = json.loads(re.search(r'\b' + binding['field'] + r':\s*("[^"]+")', chunk)[1])
            assert source_text == binding['text']
        assert struct.unpack_from('<I', raw, 0x40)[0] == row['spell_id']
        assert int(re.search(r'\bspell_id:\s*(\d+)', chunk)[1]) == row['spell_id']
        for offset, field in [(0x58, 'duration_bits'), (0x6c, 'effect_value_bits'),
                              (0x70, 'effect_duration_bits')]:
            assert struct.unpack_from('<I', raw, offset)[0] == int(row[field], 16)
        raw_duration = int(re.search(r'\bduration:\s*f32::from_bits\((0x[0-9a-f]+)\)', chunk)[1], 16)
        assert raw_duration == int(row['duration_bits'], 16)
        status = re.search(r'effect:\s*StatusEffect\s*\{\s*tag:\s*(\d+),\s*value:\s*f32::from_bits\((0x[0-9a-f]+)\),\s*duration:\s*f32::from_bits\((0x[0-9a-f]+)\)', chunk)
        assert int(status[1]) == row['effect_tag'] == struct.unpack_from('<I', raw, 0x68)[0] == 6
        assert int(status[2], 16) == int(row['effect_value_bits'], 16)
        assert int(status[3], 16) == int(row['effect_duration_bits'], 16)
        assert raw[0x74] == row['school'] == int(re.search(r'\bschool:\s*(\d+)', chunk)[1])
        assert raw[0x75] == row['kind'] == int(re.search(r'\bkind:\s*(\d+)', chunk)[1]) == 9
    return len(rows)


def source_checks():
    proof = json.loads(PROOF.read_text())
    for row in proof['source_receipts']:
        assert digest((ROOT / row['path']).read_bytes()) == row['sha256'], row['path']
    base = ROOT / 'crates/azeroth-survivors-re'
    read = lambda name: (base / 'src' / name).read_text()
    buffs = read('player_abilities/behavior/buffs.rs')
    for operation in ('pub source_guid: u64', 'old.source_guid != aura.source_guid',
                      'aura.spell_id == 774', 'source_guid: 0',
                      'coefficient: factor * definition.effect.value',
                      'let amount = (vitals.maximum_health * definition.effect.value) * factor;',
                      'duration: definition.duration', 'scaled_duration(instance).max(0.1)',
                      'if !(healing.duration > 0.0)', 'if !(definition.duration > 0.0)',
                      'let amount = maximum_health * healing.coefficient;',
                      'expires_at: now + healing.duration'):
        assert operation in buffs, operation
    dispatch = read('player_abilities/behavior/dispatch.rs')
    cast = dispatch.split('        9 => {', 1)[1].split('        10 => {', 1)[0]
    assert cast.index('port.party_needs_healing()') < cast.index('port.share_healing(healing)')
    assert cast.index('port.share_healing(healing)') < cast.index('visual(instance, context,')
    assert 'port.finish_buff_with_execution(definition.spell_id, actions, state)' in cast
    passive = read('gameplay/mechanics/passives.rs')
    assert 'self.core.party_needs_healing()' in passive
    assert 'self.core.share_healing(healing)' in passive
    adapter_files = ['gameplay/mechanics.rs', 'gameplay/mechanics/demons.rs',
                     'gameplay/mechanics/incoming.rs', 'gameplay/mechanics/raid_hits.rs']
    constructors = 0
    for name in adapter_files:
        text = read(name)
        for body in text.split('let mut port = CombatAdapter {')[1:]:
            assert 'party_healing: self.coop.healing_port(),' in body.split('player_guid:', 1)[0]
            constructors += 1
    assert constructors == 6
    coop = read('gameplay/mechanics/coop.rs')
    assert 'heroes: &self.healing_heroes' in coop
    assert 'self.coop.healing_heroes = rows' in coop
    capture = coop.split('fn capture_healing_snapshot(', 1)[1].split('fn distribute_party_healing(', 1)[0]
    assert 'self.capture_party(' not in capture
    assert 'self.active_run_state()' in capture
    assert '!state.dead && !state.completed && state.choices.is_empty()' in capture
    tick = coop.split('pub fn tick_party(', 1)[1].split('fn apply_party_revive(', 1)[0]
    assert tick.index('self.clock += delta') < tick.index('self.capture_healing_snapshot()')
    assert tick.index('self.capture_healing_snapshot()') < tick.index('self.tick_stage(')
    assert tick.rindex('game.tick_stage(') < tick.index('self.distribute_party_healing()')
    assert tick.index('self.distribute_party_healing()') < tick.index('self.resolve_boss_effects(')
    drain = coop.split('fn distribute_party_healing(', 1)[1].split('pub fn ', 1)[0]
    assert 'std::mem::take(&mut self.coop.healing_events)' in drain
    assert 'for (slot, _) in self.party_members()' in drain
    assert 'self.with_party_hero(slot, |game| game.receive_party_healing(&events, input))' in drain
    shared = read('gameplay/mechanics/shared_healing.rs')
    for operation in ('dx * dx + dy * dy <= 900.0', 'hero.eligible',
                      'maximum > 1.0', 'maximum } else { 1.0 }',
                      'health_share: health / denominator',
                      '< 0.85', 'source_slot: self.source_slot',
                      'event.source_slot == self.coop.active_slot',
                      'if !self.active_run_state() { return; }',
                      'buffs::receive_shared_healing(', 'self.publish_player_auras()',
                      'source: event.source_guid, target: self.player_guid',
                      'if result.emit_log', '&mut self.execution.vitals, &[]'):
        assert operation in shared, operation
    assert 'can_revive' not in shared and 'finished' not in shared
    tick_aura = buffs.split('pub fn tick_auras(', 1)[1].split('#[derive', 1)[0]
    assert 'for aura in auras.iter_mut()' in tick_aura
    assert 'result.healing.push((aura.spell_id, amount))' in tick_aura
    assert 'dedup' not in tick_aura
    events = read('gameplay/client/events.rs')
    assert 'SessionEvent::ObjectValues { guid:target,fields:ObjectFields::from_pairs(&fields) }' in events
    # Parsing is deliberately separate from compiling or executing these tests.
    parser = ROOT / '.tools/rust/1.98.1-aarch64-apple-darwin/bin/rustfmt'
    assert parser.is_file(), 'Configured syntax parser unavailable'
    rust = [ROOT / row['path'] for row in proof['source_receipts'] if row['path'].endswith('.rs')]
    for path in rust:
        result = subprocess.run([str(parser), '--edition', '2024', '--emit', 'stdout',
                                 '--config', 'skip_children=true'], input=path.read_text(),
                                text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE,
                                cwd=ROOT, timeout=30)
        assert result.returncode == 0, (str(path), result.stderr)
    regressions = sum(len(re.findall(r'#\[test\]', (base / name).read_text())) for name in (
        'tests/rejuvenation_0_119.rs', 'src/gameplay/mechanics/shared_healing_tests.rs'))
    assert regressions == 16
    return {'source_receipts': len(proof['source_receipts']), 'rust_syntax_files': len(rust),
            'live_cast_adapters': constructors, 'authored_unrun_rust_regressions': regressions}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--require-retained-queries', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['version'] == '0.119.0' and target['sha256'] == SHA
    image = target_bytes(target)
    spec = importlib.util.spec_from_file_location('rejuvenation_pe', ROOT / 'scripts/inventory-current-target.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.pe_parser(image)
    span_count, query_count, present = verify(image, pe, args.require_retained_queries)
    definitions = verify_definition_inputs(image, pe, json.loads(PROOF.read_text()))
    cases = Counter()
    for name, function in [('health_admission', helper_cases), ('fixed_snapshot', snapshot_cases),
                           ('cast_preparation_and_order', cast_preparation_cases), ('local_caster_prune', prune_cases),
                           ('immutable_event', producer_cases), ('recipient_fanout_and_drain', fanout_cases),
                           ('recipient_source_refresh', recipient_cases),
                           ('instant_recipient_publication', instant_recipient_cases)]:
        cases[name] = function(image, pe)
    source = source_checks()
    print(json.dumps({'target': target['version'], 'native_spans': span_count,
                      'retained_queries': present, 'declared_queries': query_count,
                      'cases': cases, 'total_cases': sum(cases.values()),
                      'source': source, 'live_definition_records': definitions,
                      'target_or_reconstructed_game_executed': False,
                      'compilation_runtime_or_parity_certified': False}, indent=2))


if __name__ == '__main__':
    main()
