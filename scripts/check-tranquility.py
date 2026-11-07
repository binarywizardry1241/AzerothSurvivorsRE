#!/usr/bin/env python3
"""Replay bounded Tranquility critical instructions and inspect the live source wiring.

No application compilation or game/server execution. Actor hits are hooked seams;
this checks pulse preparation/order, not canonical hit internals or gameplay parity.
"""
import argparse
import hashlib
import importlib.util
import json
import math
import struct

from coverage_common import ROOT, installed_identity, latest_target, target_bytes
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as R

SHA = '6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f'
MASK = (1 << 64) - 1
START, END, HIT = 0x145bc593b, 0x145bc5a2e, 0x145bd6420
CURRENT_SHA = '27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9'
CURRENT_HIT = 0x145f43210
CURRENT_PULSE = (0x145fb9235, 0x145fb933a)
CURRENT_SEED = (0x145fb98c3, 0x145fb977e)
CREDIT_0141_SHA = '6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa'
CREDIT_0141_DIRECT = (0x145f70068, 0x145f70168)
CREDIT_0141_BATCH = (0x145f61f3c, 0x145f62028)


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
    assert 'self.druid_effect_hit(pulse.effect_index, guid, 740, pulse.power,' in pulse
    assert 'let candidates = self.attack_candidates();' in pulse
    assert 'weapon::ordered_targets(' in pulse
    roll = pulse.split('fn druid_effect_hit(', 1)[1]
    assert roll.count('behavior::unit24(rng)') == 1
    assert roll.index('behavior::unit24(rng)') < roll.index('CastPort::critical(self.core)') < roll.index('self.effect_hit_with_suppression(')
    assert 'let critical = draw < stats.chance;' in roll
    assert 'power * stats.multiplier' in roll
    assert 'index, guid, spell_id, 3, damage, critical, false, true, execution,' in roll
    seed = pulse.split('pub(super) fn resolve_seeds_of_life(', 1)[1].split('fn druid_effect_hit(', 1)[0]
    assert 'self.core.generic.healing.seed_impact, true' in seed
    assert 'self.core.guardian_state.contains(guid)' in seed
    assert seed.count('self.druid_effect_hit(seed.effect_index, guid, SEED_OF_LIFE, seed.power,') == 2
    assert 'if double {' in seed
    hit = source.split('fn effect_hit_with_suppression(', 1)[1].split('    /// Current raw35', 1)[0]
    for statement in ('let original = self.core.attribution;', 'self.core.attribution.source_kind = 3;',
                      'source_words: [1, 0, index as u32, (index as u64 >> 32) as u32]',
                      'source_guid: self.context.player_guid', 'critical,', 'suppress_damage_log,',
                      'effect_critical_procs,', 'self.core.attribution = original;'):
        assert statement in hit, statement
    assert 'event.source_kind == 3 && hit.context.effect_critical_procs && event.critical' in source
    assert 'event.source_kind == 3 && (row.tag() != 9 || row.word(16) != 2)' in source
    effects = (ROOT / 'crates/azeroth-survivors-re/src/run_effects.rs').read_text()
    gate = effects.split('pub fn hit_event(', 1)[1].split('#[derive(Debug)]', 1)[0]
    assert gate.index('event.source_kind == 3') < gate.index('fn consume(')
    healing = (ROOT / 'crates/azeroth-survivors-re/src/run_effects/healing.rs').read_text()
    assert 'credit_healing(vitals, rows, state, effective, total - effective);' in healing
    assert 'credit_healing(vitals, rows, state, native_max(actual, 0.0), overheal);' in healing
    assert 'vitals.absorb = min_preserving_original_nan(before + excess, cap);' in healing
    assert 'let credited = actual + excess;' in healing
    assert 'credited > 0.0 && !state.seed_impact' in healing


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


def replay_current(image, pe, seed, chance, multiplier, count, mode, interleaved=False):
    is_seed = mode == 'seed'
    start, end = CURRENT_SEED if is_seed else CURRENT_PULSE
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    for page in {start & -4096, end & -4096, CURRENT_HIT & -4096, 0x1466531a0 & -4096}:
        u.mem_map(page, 4096)
        at = pe.rva_offset(page - pe.image_base)
        u.mem_write(page, image[at:at + 4096])
    game, frame, stack, targets = 0x20000000, 0x20002000, 0x20004000, 0x20008000
    u.mem_map(game, 0x10000)

    def put(address, fmt, *values):
        u.mem_write(address, struct.pack(fmt, *values))

    def get(address, fmt):
        return struct.unpack(fmt, u.mem_read(address, struct.calcsize(fmt)))

    put(game + 0xf60, '<4Q', *seed)
    put(game + 0x64c, '<2f', chance, multiplier)
    put(game + 0x2a6, '<B', 2)
    put(frame + 0xe8, '<Q', targets)
    for i in range(count):
        put(targets + i * 8, '<Q', 700 + i)
    registers = {
        R.UC_X86_REG_RSI: game,
        R.UC_X86_REG_RBP: frame,
        R.UC_X86_REG_RSP: stack,
        R.UC_X86_REG_R14: count,
        R.UC_X86_REG_R12: 700,
        R.UC_X86_REG_R15: int(count == 2),
        R.UC_X86_REG_XMM7: bits(12.5),
        R.UC_X86_REG_XMM10: bits(4.0),
        R.UC_X86_REG_XMM11: bits(50.0),
        R.UC_X86_REG_XMM8: bits(2 ** -24),
    }
    for register, value in registers.items():
        u.reg_write(register, value)
    expected_rng = list(seed)
    expected_chance, expected_multiplier = chance, multiplier
    hits = []

    def hook(_, address, size, data):
        nonlocal expected_rng, expected_chance, expected_multiplier
        if address != CURRENT_HIT:
            return
        word, expected_rng = next_word(expected_rng)
        critical = (word >> 40) * 2 ** -24 < expected_chance
        power = f32(50.0 * expected_multiplier) if critical else 50.0
        sp = u.reg_read(R.UC_X86_REG_RSP)
        assert u.reg_read(R.UC_X86_REG_RDX) == (700 if is_seed else 700 + len(hits))
        assert u.reg_read(R.UC_X86_REG_R9D) == (21070 if is_seed else 740)
        assert get(sp + 0x28, '<B')[0] == 3
        assert get(sp + 0x30, '<B')[0] == critical
        assert get(sp + 0x38, '<B')[0] == 0
        assert get(game + 0x2a4, '<3B') == (1, 0, 3)
        actual = u.reg_read(R.UC_X86_REG_XMM2) & 0xffffffff
        assert actual == bits(power) or (math.isnan(power) and (actual & 0x7fffffff) > 0x7f800000)
        assert list(get(game + 0xf60, '<4Q')) == expected_rng
        hits.append(critical)
        if interleaved:
            _, expected_rng = next_word(expected_rng)
            expected_chance = 1.0 if expected_chance <= 0.5 else 0.0
            expected_multiplier = f32(expected_multiplier + 0.125)
            put(game + 0xf60, '<4Q', *expected_rng)
            put(game + 0x64c, '<2f', expected_chance, expected_multiplier)
        u.reg_write(R.UC_X86_REG_RSP, sp + 8)
        u.reg_write(R.UC_X86_REG_RIP, get(sp, '<Q')[0])

    u.hook_add(UC_HOOK_CODE, hook)
    u.emu_start(start, end, count=10000)
    assert u.reg_read(R.UC_X86_REG_RIP) == end
    assert len(hits) == count
    assert get(game + 0xf60, '<4Q') == tuple(expected_rng)
    assert get(game + 0x2a4, '<3B') == (0, 0, 2)


def replay_credit(image, pe, *, batch, actual, excess, absorb, cap, convert, pool,
                  seed_impact, restored_overheal=False, spell_id=774):
    if restored_overheal:
        start, end = CREDIT_0141_BATCH if batch else CREDIT_0141_DIRECT
        if not batch and spell_id == 0:
            end = 0x145f701f9
        rows_offset, max_offset, absorb_offset = 0xb70, 0x658, 0x5fc
    else:
        start, end = ((0x145f8d1b5, 0x145f8d2a8) if batch else (0x145f9d163, 0x145f9d258))
        rows_offset, max_offset, absorb_offset = 0xb58, 0x640, 0x5e4
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    for page in range(start & -4096, (end & -4096) + 4096, 4096):
        u.mem_map(page, 4096)
        at = pe.rva_offset(page - pe.image_base)
        u.mem_write(page, image[at:at + 4096])
    game, rows = 0x20000000, 0x20002000
    u.mem_map(game, 0x4000)
    tags = [(32, cap)] if convert else []
    if pool:
        tags.append((33, 1.0))
    for i, (tag, value) in enumerate(tags):
        u.mem_write(rows + i * 64, struct.pack('<If', tag, value))
    u.mem_write(game + rows_offset, struct.pack('<QQ', rows, len(tags)))
    for offset, value in ((max_offset, 100.0), (absorb_offset, absorb), (0x288, 7.0)):
        u.mem_write(game + offset, struct.pack('<f', value))
    u.mem_write(game + 0x2a3, bytes([seed_impact]))
    u.reg_write(R.UC_X86_REG_RSI, game)
    u.reg_write(R.UC_X86_REG_EDI, spell_id)
    u.reg_write(R.UC_X86_REG_XMM6, bits(actual))
    u.reg_write(R.UC_X86_REG_XMM7, bits(actual if batch else actual + excess))
    u.reg_write(R.UC_X86_REG_XMM8, bits(actual + excess))
    u.emu_start(start, end, count=1000)
    assert u.reg_read(R.UC_X86_REG_RIP) == end
    excess = f32(f32(actual + excess) - actual)
    eligible = batch or spell_id != 0
    cap_health = f32(f32(cap) * 100.0)
    credited_absorb = absorb
    if eligible and convert and excess > 0.0 and cap_health > absorb:
        credited_absorb = min(f32(absorb + excess), cap_health)
    credited_excess = excess if restored_overheal else f32(credited_absorb - absorb)
    credit = f32(max(actual, 0.0) + credited_excess)
    expected_pool = f32(7.0 + credit) if eligible and pool and not seed_impact and credit > 0.0 else 7.0
    observed = struct.unpack('<I', u.mem_read(game + absorb_offset, 4))[0]
    assert observed == bits(credited_absorb), (batch, actual, excess, absorb, cap, observed)
    observed = struct.unpack('<I', u.mem_read(game + 0x288, 4))[0]
    assert observed == bits(expected_pool), (batch, actual, excess, absorb, cap, observed)


def load_pe(image):
    spec = importlib.util.spec_from_file_location('inventory_pe', ROOT / 'scripts/inventory-current-target.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module.pe_parser(image)


def check_installed_credit():
    from itertools import product

    target = installed_identity()
    assert (target['version'], target['sha256']) == ('0.141.0', CREDIT_0141_SHA)
    image = target_bytes(target)
    pe = load_pe(image)
    cases = 0
    for batch, (actual, excess), absorb, (convert, cap), pool, seed_impact in product(
        (False, True), ((0.0, 0.0), (5.0, 0.0), (0.0, 20.0), (5.0, 20.0)),
        (0.0, 8.0, 10.0, 20.0), ((False, 0.1), (True, 0.1), (True, math.nan)),
        (False, True), (False, True),
    ):
        for spell_id in ((774,) if batch else (0, 774)):
            replay_credit(image, pe, batch=batch, actual=actual, excess=excess,
                          absorb=absorb, cap=cap, convert=convert, pool=pool,
                          seed_impact=seed_impact, restored_overheal=True, spell_id=spell_id)
            cases += 1
    source_checks()
    print(f'PASS: {cases} 0.141.0 original-instruction healing-credit cases; '
          'source wiring checked; no build/game/parity validation')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--installed-credit', action='store_true',
                        help='Check only the installed 0.141.0 direct and frame HoT credit paths')
    if parser.parse_args().installed_credit:
        check_installed_credit()
        return

    target = latest_target(verify=True)
    assert (target['version'], target['sha256']) in (('0.119.0', SHA), ('0.140.0', CURRENT_SHA))
    image = target_bytes(target)
    pe = load_pe(image)
    current = target['sha256'] == CURRENT_SHA
    if not current:
        proof = json.loads((ROOT / 'docs/analysis/evidence/druid-release/manifest.json').read_text())
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
                if current:
                    for mode, count in (('pulse', 1), ('pulse', 4), ('seed', 1), ('seed', 2)):
                        replay_current(image, pe, seed, chance, multiplier, count, mode)
                        cases += 1
                else:
                    for count in (0, 1, 4):
                        replay(image, pe, seed, chance, multiplier, count)
                        cases += 1
        if current:
            replay_current(image, pe, seed, 0.5, 1.5, 4, 'pulse', interleaved=True)
            replay_current(image, pe, seed, 0.5, 1.5, 2, 'seed', interleaved=True)
            cases += 2
        else:
            replay(image, pe, seed, 0.5, 1.5, 4, interleaved=True)
            cases += 1
    credit_cases = 0
    if current:
        from itertools import product
        for batch, (actual, excess), absorb, (convert, cap), pool, seed_impact in product(
            (False, True), ((0.0, 0.0), (5.0, 0.0), (0.0, 20.0), (5.0, 20.0)),
            (0.0, 8.0, 10.0, 20.0), ((False, 0.1), (True, 0.1), (True, math.nan)),
            (False, True), (False, True),
        ):
            replay_credit(image, pe, batch=batch, actual=actual, excess=excess,
                          absorb=absorb, cap=cap, convert=convert, pool=pool, seed_impact=seed_impact)
            credit_cases += 1
    source_checks()
    print(f'PASS: {cases} original-instruction critical and {credit_cases} healing-credit cases; '
          'source wiring checked; no build/game/parity validation')


if __name__ == '__main__':
    main()
