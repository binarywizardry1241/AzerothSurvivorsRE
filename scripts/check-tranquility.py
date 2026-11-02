#!/usr/bin/env python3
"""Replay bounded Tranquility critical instructions and inspect the live source wiring.

No application compilation or game/server execution. Actor hits are hooked seams;
this checks pulse preparation/order, not canonical hit internals or gameplay parity.
"""
import hashlib
import importlib.util
import json
import math
import struct

from coverage_common import ROOT, latest_target, target_bytes
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as R

SHA = '6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f'
MASK = (1 << 64) - 1
START, END, HIT = 0x145bc593b, 0x145bc5a2e, 0x145bd6420


def bits(value):
    return struct.unpack('<I', struct.pack('<f', value))[0]


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def next_word(words):
    # Independent scalar model of xoshiro256++ and its high-24-bit draw.
    a, b, c, d = words
    total = (a + d) & MASK
    result = (((total << 23) | (total >> 41)) + a) & MASK
    c ^= a
    d ^= b
    return result, [a ^ d, b ^ c, c ^ ((b << 17) & MASK),
                    ((d << 45) | (d >> 19)) & MASK]


def source_checks():
    source = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/callbacks.rs').read_text()
    pulse = source.split('pub(super) fn pulse_healing_pool(', 1)[1].split('pub(super) fn apply_effect_status(', 1)[0]
    loop = pulse.split('for guid in selected {', 1)[1]
    assert loop.count('behavior::unit24(rng)') == 1
    assert loop.index('behavior::unit24(rng)') < loop.index('CastPort::critical(self.core)') < loop.index('self.effect_hit_with_suppression(')
    assert 'let critical = draw < stats.chance;' in loop
    assert 'pulse.power * stats.multiplier' in loop
    assert 'pulse.effect_index,\n                guid,\n                740,\n                3,\n                damage,\n                critical,\n                false,' in loop
    wrapper = source.split('    fn effect_hit(', 1)[1].split('    fn effect_hit_with_suppression(', 1)[0]
    assert 'damage, false, false, execution, rng, counter' in wrapper
    hit = source.split('    fn effect_hit_with_suppression(', 1)[1].split('    /// Current raw35', 1)[0]
    for statement in ('let original = self.core.attribution;', 'self.core.attribution.source_kind = 3;',
                      'source_words: [1, 0, index as u32, (index as u64 >> 32) as u32]',
                      'source_guid: self.context.player_guid', 'critical,', 'suppress_damage_log,',
                      'self.core.attribution = original;'):
        assert statement in hit, statement
    effects = (ROOT / 'crates/azeroth-survivors-re/src/run_effects.rs').read_text()
    gate = effects.split('pub fn hit_event(', 1)[1].split('#[derive(Debug)]', 1)[0]
    assert gate.index('event.source_kind == 3') < gate.index('fn consume(')


def replay(image, pe, seed, chance, multiplier, count, interleaved=False):
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    for address in (START, HIT, 0x1462469e0):
        page = address & ~4095
        u.mem_map(page, 4096)
        at = pe.rva_offset(page - pe.image_base)
        u.mem_write(page, image[at:at + 4096])
    game, frame, stack, targets = 0x20000000, 0x20002000, 0x20004000, 0x20008000
    u.mem_map(game, 0x10000)

    def put(address, fmt, *values):
        u.mem_write(address, struct.pack(fmt, *values))

    def get(address, fmt):
        return struct.unpack(fmt, u.mem_read(address, struct.calcsize(fmt)))

    put(game + 0xb28, '<4Q', *seed)
    put(game + 0x4ac, '<2f', chance, multiplier)
    put(game + 0x1ad, '<B', 2)
    put(frame + 0xb8, '<Q', targets)
    for i in range(count):
        put(targets + i * 8, '<Q', 700 + i)
    for register, value in ((R.UC_X86_REG_RSI, game), (R.UC_X86_REG_RBP, frame),
                            (R.UC_X86_REG_RSP, stack), (R.UC_X86_REG_RBX, count),
                            (R.UC_X86_REG_XMM6, bits(12.5)), (R.UC_X86_REG_XMM8, bits(4.0))):
        u.reg_write(register, value)
    expected_rng = list(seed)
    hits = []
    expected_chance, expected_multiplier = chance, multiplier

    def hook(_, address, size, data):
        nonlocal expected_rng, expected_chance, expected_multiplier
        if address != HIT:
            return
        word, expected_rng = next_word(expected_rng)
        draw = (word >> 40) * 2 ** -24
        critical = draw < expected_chance
        power = f32(50.0 * expected_multiplier) if critical else 50.0
        sp = u.reg_read(R.UC_X86_REG_RSP)
        assert u.reg_read(R.UC_X86_REG_RDX) == 700 + len(hits)
        assert u.reg_read(R.UC_X86_REG_R9D) == 740
        assert get(sp + 0x28, '<B')[0] == 3  # school
        assert get(sp + 0x30, '<B')[0] == critical
        assert get(sp + 0x38, '<B')[0] == 0  # ordinary damage log
        assert get(game + 0x1ad, '<B')[0] == 3
        actual = u.reg_read(R.UC_X86_REG_XMM2) & 0xffffffff
        assert actual == bits(power) or (math.isnan(power) and (actual & 0x7fffffff) > 0x7f800000)
        assert list(get(game + 0xb28, '<4Q')) == expected_rng
        hits.append(critical)
        # Model a synchronous canonical-hit consumer that advances RNG/changes
        # stats. The next victim must use this updated state, not a pre-rolled list.
        if interleaved:
            _, expected_rng = next_word(expected_rng)
            put(game + 0xb28, '<4Q', *expected_rng)
            expected_chance = f32(1.0 if len(hits) % 2 else 0.0)
            expected_multiplier = f32(2.0 + len(hits))
            put(game + 0x4ac, '<2f', expected_chance, expected_multiplier)
        u.reg_write(R.UC_X86_REG_RIP, get(sp, '<Q')[0])
        u.reg_write(R.UC_X86_REG_RSP, sp + 8)

    u.hook_add(UC_HOOK_CODE, hook)
    u.emu_start(START, END, count=10000)
    assert u.reg_read(R.UC_X86_REG_RIP) == END
    assert len(hits) == count
    assert list(get(game + 0xb28, '<4Q')) == expected_rng
    assert get(game + 0x1ad, '<B')[0] == 2


def main():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.119.0'
    image = target_bytes(target)
    spec = importlib.util.spec_from_file_location('inventory_pe', ROOT / 'scripts/inventory-current-target.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.pe_parser(image)
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.119.0/druid-release/manifest.json').read_text())
    for row in [r for r in proof['native_spans'] if 176 in r['gap_ids']] + [proof['constants'][1]]:
        at = pe.rva_offset(int(row['start'], 16) - pe.image_base)
        assert at == int(row['file_offset'], 16)
        assert hashlib.sha256(image[at:at + row['byte_count']]).hexdigest() == row['sha256']
    seeds = [[0, 0, 0, 0], [1, 2, 3, 4], [MASK, MASK - 1, 7, 99],
             [0xdeadbeef12345678, 0x123456789abcdef, 0xfedcba9876543210, 91]]
    cases = 0
    for seed in seeds:
        word, _ = next_word(seed)
        equality = f32((word >> 40) * 2 ** -24)
        below = struct.unpack('<f', struct.pack('<I', max(0, bits(equality) - 1)))[0]
        above = struct.unpack('<f', struct.pack('<I', bits(equality) + 1))[0]
        for chance in (0.0, 1.0, -0.5, 1.5, math.nan, equality, below, above):
            for multiplier in (1.5, 2.75, 0.0, math.nan):
                for count in (0, 1, 4):
                    replay(image, pe, seed, chance, multiplier, count)
                    cases += 1
        replay(image, pe, seed, 0.5, 1.5, 4, interleaved=True)
        cases += 1
    source_checks()
    print(f'PASS: {cases} bounded original-instruction pulse cases; live critical/attribution/suppression wiring checked; no build/game/parity validation')


if __name__ == '__main__':
    main()
