#!/usr/bin/env python3
"""Check current guardian reward scheduling and rarity inputs statically.

Runs bounded original instructions with synthetic Game/frame memory. No calls,
external seams, compilation, game process or reconstructed Rust execution.
"""
from portable_paths import portable_json_text, portable_record
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import struct

import capstone
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as x

from coverage_common import ROOT, latest_target, target_bytes, file_sha256, json_text
from native_recovery import f32, bits
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
RUNTIME = ROOT / 'runtime/analysis/history/native-recovery/as-ui-contracts/09a4d154b813'
OUT = ROOT / 'docs/analysis/evidence/as-ui-contracts-guardian.json'
SOURCES = [
    'crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs',
    'crates/azeroth-survivors-re/src/gameplay/mechanics/treasure.rs',
    'crates/azeroth-survivors-re/src/gameplay/mechanics/completion.rs',
    'crates/azeroth-survivors-re/src/gameplay/mod.rs',
    'crates/azeroth-survivors-re/src/gameplay/mechanics/choices.rs',
]
RANGES = [
    (0x145966b45, 0x145966b95),
    (0x145966d56, 0x145966d6f), (0x145966d8c, 0x145966db7),
    (0x1458e1b05, 0x1458e1b28),
    (0x1459651de, 0x145965236),
    (0x14596d4a3, 0x14596d503),
    (0x14596d57b, 0x14596d5fc), (0x14596d634, 0x14596d6b9),
    (0x14590f20d, 0x14590f242),
]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['version'] == '0.113.2' and target['sha256'] == SHA
    data = target_bytes(target)
    pe = load_script('guardian_choice_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        value = data[at:at + count]
        assert len(value) == count
        return value

    def span(first, last):
        return dict(va=hex(first), end_exclusive=hex(last), byte_count=last - first,
                    sha256=hashlib.sha256(raw(first, last - first)).hexdigest())

    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    for first, last in RANGES:
        rows = list(decoder.disasm(raw(first, last - first), first))
        assert sum(row.size for row in rows) == last - first
        assert all(row.mnemonic != 'call' for row in rows)
    xp_call = list(decoder.disasm(raw(0x145966d51, 5), 0x145966d51))
    assert len(xp_call) == 1 and xp_call[0].mnemonic == 'call' and xp_call[0].op_str == '0x14590eb10'
    before_xp = list(decoder.disasm(raw(0x145966b20, 0x145966d51 - 0x145966b20), 0x145966b20))
    assert not any(operand.type == capstone.CS_OP_MEM and operand.mem.disp == 0xc12
                   and operand.access & capstone.CS_AC_WRITE
                   for row in before_xp for operand in row.operands)

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(row['rva'] + max(row['raw_size'], row['virtual_size']) for row in pe.sections)
    machine.mem_map(pe.image_base, (size + 4095) & ~4095)
    for row in pe.sections:
        machine.mem_write(pe.image_base + row['rva'], data[row['raw_offset']:row['raw_offset'] + row['raw_size']])
    game, frame, stack = 0x200000000, 0x200004000, 0x200008000
    machine.mem_map(game, 0x10000)
    stops, visited = set(), set()

    def hook(uc, address, size, unused):
        if address in stops:
            uc.emu_stop()
        elif any(first <= address < last for first, last in RANGES):
            visited.add(address)
        else:
            raise RuntimeError(f'Unreviewed native excursion {address:#x}')

    machine.hook_add(UC_HOOK_CODE, hook)

    def put(address, value, fmt='I'):
        machine.mem_write(address, struct.pack('<' + fmt, value))

    def get(address, fmt='I'):
        return struct.unpack('<' + fmt, machine.mem_read(address, struct.calcsize('<' + fmt)))[0]

    def reg(name, value=None):
        register = getattr(x, 'UC_X86_REG_' + name)
        if value is None:
            return machine.reg_read(register)
        machine.reg_write(register, value)

    def run(first, endings):
        stops.clear()
        stops.update(endings)
        reg('RBP', frame)
        reg('RSP', stack)
        reg('EFLAGS', 2)
        reg('MXCSR', 0x1f80)
        machine.emu_start(first, 0, count=256)
        at = reg('RIP')
        assert at in stops, hex(at)
        return at

    counters, priorities, gates, bonuses, rarities, xp_gates = [], [], [], [], [], []
    values = (0, 1, 2, 0xffffffff)
    for mode in range(3):
        for counts in itertools.product(values, repeat=3):
            machine.mem_write(game, bytes(0x2000))
            for index, value in enumerate(counts):
                put(game + 0xb80 + index * 4, value)
            reg('RCX', game)
            reg('RDX', mode)
            run(0x145966b45, {0x145966b95})
            actual = [get(game + 0xb80 + index * 4) for index in range(3)]
            expected = list(counts)
            expected[mode] = max(0, expected[mode] - 1)
            assert actual == expected
            assert get(game + 0xc0c, 'B') == int(mode == 0)
            counters.append(dict(mode=mode, input=list(counts), output=actual))

    for counts in itertools.product((0, 1, 2), repeat=3):
        for store, spend in itertools.product((0, 1), repeat=2):
            machine.mem_write(game, bytes(0x2000))
            for index, value in enumerate(counts):
                put(game + 0xb80 + index * 4, value)
            put(game + 0xc04, store, 'B')
            put(game + 0xc05, spend, 'B')
            reg('RSI', game)
            at = run(0x145966d56, {0x145966d6f, 0x145966db7})
            actual = reg('RDX') & 255 if at == 0x145966d6f else None
            level, cache, guardian = counts
            expected = 1 if cache else 2 if guardian else 0 if level and (not store or spend) else None
            assert actual == expected
            if expected is None:
                assert get(game + 0xc10, 'B') == 255 and get(game + 0xc05, 'B') == 0
            priorities.append(dict(counts=list(counts), store=store, spend=spend, next_mode=actual))

    for pending, suppression, phase in itertools.product(values, (0, 1), range(6)):
        put(game + 0xb88, pending)
        put(game + 0xc08, suppression, 'B')
        put(game + 0xc12, phase, 'B')
        reg('RSI', game)
        at = run(0x1458e1b05, {0x1458e1b28, 0x1458e1b2d})
        admitted = at == 0x1458e1b28
        assert admitted == bool(pending and not suppression and phase == 1)
        if admitted:
            assert reg('RCX') == game and reg('RDX') & 255 == 2 and reg('R8') & 255 == 1
        gates.append(dict(pending=pending, suppression=suppression, phase=phase, admitted=admitted))

    for pending, phase, suppression, store, spend in itertools.product(values, range(6), (0, 1), (0, 1), (0, 1)):
        machine.mem_write(game, bytes(0x2000))
        put(game + 0xb80, pending)
        put(game + 0xc12, phase, 'B'); put(game + 0xc08, suppression, 'B')
        put(game + 0xc04, store, 'B'); put(game + 0xc05, spend, 'B')
        reg('RSI', game)
        at = run(0x14590f20d, {0x14590f242, 0x14590f247})
        admitted = at == 0x14590f242
        assert admitted == bool(pending and phase == 1 and not suppression and (not store or spend))
        if admitted:
            assert reg('RCX') == game and reg('RDX') == 0 and reg('R8') & 255 == 1
        xp_gates.append(dict(pending=pending, phase=phase, suppression=suppression,
                             store=store, spend=spend, level_offer_admitted=admitted))

    for mode in (1, 2):
        reg('RCX', game)
        reg('RDX', mode)
        reg('R8', 1)
        run(0x1459651de, {0x145965236})
        actual = reg('XMM2') & 0xffffffff
        assert actual == bits(0.0 if mode == 1 else 0.25)
        assert reg('RDX') == game
        bonuses.append(dict(mode=mode, source_bonus_bits=actual))

    for level, luck, bonus, amulet in itertools.product((0, 1, 2, 29, 30, 31, 99, 0xffffffff),
                                                       (-1.0, 0.0, 0.01, 1.0, 5.0),
                                                       (0.0, 0.25), (False, True)):
        put(game + 0x4e0, level)
        put(game + 0x4ac, luck, 'f')
        put(frame + 0x154, bonus, 'f')
        put(frame + 0x168, game, 'Q')
        run(0x14596d4a3, {0x14596d503})
        start, stop = (0x14596d57b, 0x14596d5fc) if amulet else (0x14596d634, 0x14596d6b9)
        run(start, {stop})
        actual = [reg(name) & 0xffffffff for name in ('XMM14', 'XMM9', 'XMM8', 'XMM15', 'XMM6')]
        strength = f32(f32(f32(luck) + 1.0) + min(f32(float(level) * f32(0.01)), f32(0.3)))
        strength = f32(strength + (f32(0.5 + bonus) if amulet else bonus))
        squared = f32(strength * strength)
        expected = [60.0, f32(strength * 25.0), f32(squared * 10.0),
                    f32(f32(strength * squared) * 4.0), f32(squared * squared)]
        assert actual == list(map(bits, expected)), (level, luck, bonus, amulet, actual, list(map(bits, expected)))
        total = expected[0]
        for value in expected[1:]:
            total = f32(total + value)
        assert reg('XMM2') & 0xffffffff == bits(total)
        rarities.append(dict(level=level, luck_bits=bits(luck), bonus_bits=bits(bonus), amulet=amulet, weights=actual))

    source = {name: (ROOT / name).read_text() for name in SOURCES}
    guardian, treasure, completion, ui, choices = [source[name] for name in SOURCES]
    assert '.push(GuardianRewardEvent::JewelryChoice(request));\n            self.generate_guardian_choices();' in guardian
    assert 'self.guardian_state.pending_jewelry.saturating_sub(1)' in guardian
    assert 'self.generate_treasure_choices(true)' in treasure and 'self.generate_treasure_choices(false)' in treasure
    assert 'GUARDIAN_JEWELRY_CHOICE.generation_parameter' in treasure
    assert 'self.finish_guardian_jewelry_choice()' in treasure and 'self.chest_state.system.pending_choices.saturating_sub(1)' in treasure
    body = completion.split('pub(super) fn complete_choice', 1)[1]
    assert body.index('self.pending_cache_choices()') < body.index('self.pending_guardian_jewelry()') < body.index('self.maybe_generate_level_choices()')
    assert body.index('self.choice_state.completing = true') < body.index('self.choices.clear()') < body.index('self.add_experience(grant)')
    assert body.index('self.add_experience(grant)') < body.index('self.choice_state.completing = false') < body.index('self.pending_cache_choices()')
    assert 'pub completing: bool' in choices and '|| self.choice_state.completing' in choices
    assert 'self.pending_guardian_jewelry() != 0' not in choices
    assert 'reason: if game.guardian_choices_active()' in ui
    assert 'native_overlays::Reason::Guardian' in ui
    assert 'game.guardian_choices_active(),\n        game.choices' in ui
    assert all(name in guardian for name in (
        'guardian_equipment_waits_for_its_strength_level_choice_then_reaches_acceptance',
        'stored_strength_levels_keep_two_independent_guardian_choices_and_reject_bad_indices',
        'shared_completion_prioritizes_cache_then_guardian_then_stored_levels',
        'guardian_completion_swept_xp_queues_levels_behind_the_remaining_guardian_offer',
        'queued_guardian_rewards_do_not_block_rerolling_the_open_strength_level_offer'))
    complete = dict(counter=counters, priority=priorities, strength_gate=gates,
                    source_bonus=bonuses, rarity_inputs=rarities, xp_offer_gate=xp_gates)
    cases = RUNTIME / 'guardian-choice-cases.json'
    cases.write_text(portable_json_text(complete))
    ghidra = []
    for role, first, last in [('generate-choices', 0x145965190, 0x14596624e),
                              ('complete-choice', 0x145966b20, 0x145967189),
                              ('reward-choices', 0x14596cbb0, 0x14596e080),
                              ('award-experience', 0x14590eb10, 0x14590f2a9)]:
        evidence = json.loads((RUNTIME / role / 'rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
        owner = span(first, last)
        assert evidence['provider']['id'] == 'ghidra' and evidence['subject']['digest']['sha256'] == owner['sha256']
        ghidra.append(dict(role=role, owner=owner, evidence_id=evidence['evidence_id'],
                           provider=evidence['provider'], analysis_profile=evidence['analysis_profile'],
                           pseudocode_sha256=hashlib.sha256(evidence['normalized_result'].encode()).hexdigest()))
    proof = dict(schema_version=1, target={key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
                 generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(), sha256=file_sha256(Path(__file__))),
                 native_ranges=[span(first, last) for first, last in RANGES],
                 completion_xp_call=dict(**span(0x145966d51, 0x145966d56), callee='0x14590eb10',
                                         no_prior_phase_write=True, subsequent_priority='0x145966d56'),
                 native_cases={key: len(value) for key, value in complete.items()},
                 executed_instruction_boundaries=len(visited),
                 detailed_cases=dict(path=cases.relative_to(ROOT).as_posix(), sha256=file_sha256(cases)),
                 ghidra=ghidra, source=[dict(path=name, sha256=file_sha256(ROOT / name)) for name in SOURCES],
                 limits=['Original counter, priority, strength/XP offer gates, source argument and finite rarity-input prefixes only; no calls or external seams.',
                         'Existing reward generator, inventories, stats and presentation are reused; full native generic/data/alias contracts are not certified by these prefixes.',
                         'Raw Ghidra imports omit external data/calls and may truncate computed dispatch. Exact current PE instructions control the recorded inputs.',
                         'Five authored guardian Rust transaction regressions were not run. No compiler, Rust execution, gameplay, rendering, I/O or original/rebuilt parity.'],
                 gap_ids=[41], compilation_run=False, game_run=False, parity_verified=False)
    if args.write:
        OUT.parent.mkdir(parents=True, exist_ok=True)
        OUT.write_text(portable_json_text(proof))
    else:
        assert portable_record(json.loads(OUT.read_text())) == portable_record(proof), 'Current guardian-choice proof is stale'
    print('Checked original guardian choice cases: ' + ', '.join(f'{key}={len(value)}' for key, value in complete.items()) + '; no compiler/game')


if __name__ == '__main__':
    main()
