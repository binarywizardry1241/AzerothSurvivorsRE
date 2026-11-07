#!/usr/bin/env python3
"""Replay current source-preserving reward controls without compilation/game."""
from portable_paths import portable_json_text, portable_record
import argparse
import hashlib
import itertools
import json
import math
from pathlib import Path
import struct

from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as x

from coverage_common import ROOT, latest_target, target_bytes, file_sha256, json_text
from native_recovery import bits, f32
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
RUNTIME = ROOT / 'runtime/analysis/history/native-recovery/as-ui-contracts/09a4d154b813'
OUT = ROOT / 'docs/analysis/evidence/as-ui-contracts-reward-controls.json'
SOURCES = ['crates/azeroth-survivors-re/src/gameplay/mechanics/' + name + '.rs'
           for name in ('choice_controls', 'treasure', 'guardians')]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['version'] == '0.113.2' and target['sha256'] == SHA
    data = target_bytes(target)
    pe = load_script('reward_controls_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        value = data[at:at + count]
        assert len(value) == count
        return value

    def span(first, last):
        return dict(va=hex(first), end_exclusive=hex(last), byte_count=last - first,
                    sha256=hashlib.sha256(raw(first, last - first)).hexdigest())

    vm = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(row['rva'] + max(row['raw_size'], row['virtual_size']) for row in pe.sections)
    vm.mem_map(pe.image_base, (size + 4095) & ~4095)
    for row in pe.sections:
        vm.mem_write(pe.image_base + row['rva'], data[row['raw_offset']:row['raw_offset'] + row['raw_size']])
    game, display, stack, output, heap = (0x200000000 + index * 0x10000 for index in range(5))
    vm.mem_map(game, 0x200000)
    stops, visits, seams = set(), set(), set()
    ranges = [(0x14596ee30, 0x14596efb8), (0x1459729a0, 0x145972adf),
              (0x14596efc0, 0x14596f0c6), (0x145964f70, 0x145965182),
              (0x145968a3b, 0x145968a51), (0x1400b3e0d, 0x1400b3e13)]
    allocation = heap

    def put(at, value, fmt='Q'):
        vm.mem_write(at, struct.pack('<' + fmt, value))

    def get(at, fmt='Q'):
        return struct.unpack('<' + fmt, vm.mem_read(at, struct.calcsize('<' + fmt)))[0]

    def reg(name, value=None):
        at = getattr(x, 'UC_X86_REG_' + name)
        if value is None:
            return vm.reg_read(at)
        vm.reg_write(at, value)

    def alloc(count):
        nonlocal allocation
        at = allocation
        allocation += (max(1, count) + 15) & ~15
        assert allocation < game + 0x200000
        vm.mem_write(at, bytes(max(1, count)))
        return at

    def returns(value=None):
        sp = reg('RSP')
        if value is not None:
            reg('RAX', value)
        reg('RIP', get(sp))
        reg('RSP', sp + 8)

    def hook(uc, address, size, unused):
        if address in stops:
            uc.emu_stop()
        elif address in (0x140002200, 0x1400021c0, 0x145cf998b, 0x145cf9991, 0x145cccba0):
            seams.add(address)
            c, d, count = reg('RCX'), reg('RDX'), reg('R8')
            if address == 0x140002200:
                returns()
            elif address == 0x1400021c0:
                returns(alloc(c))
            elif address == 0x145cf998b:
                vm.mem_write(c, bytes(vm.mem_read(d, count)))
                returns(c)
            elif address == 0x145cf9991:
                left, right = bytes(vm.mem_read(c, count)), bytes(vm.mem_read(d, count))
                returns(((left > right) - (left < right)) & 0xffffffffffffffff)
            else:
                length = get(d + 16)
                text = bytes(vm.mem_read(get(d + 8), length))
                at = alloc(length)
                vm.mem_write(at, text)
                vm.mem_write(c, struct.pack('<QQQ', length, at, length))
                returns(c)
        elif any(first <= address < last for first, last in ranges):
            visits.add(address)
        else:
            raise RuntimeError(f'Unreviewed native excursion {address:#x}')

    vm.hook_add(UC_HOOK_CODE, hook)

    def run(first, endings, reset_stack=True):
        stops.clear()
        stops.update(endings)
        if reset_stack:
            reg('RSP', stack + 0x8008)
            put(stack + 0x8008, output + 0x8000)
        reg('EFLAGS', 2)
        reg('MXCSR', 0x1f80)
        vm.emu_start(first, 0, count=1000)
        at = reg('RIP')
        assert at in stops, hex(at)
        return at

    skip_gates, skips, rerolls, banish_gates, banish_commits, banish_keys = [], [], [], [], [], []
    for phase, mode, perk in itertools.product(range(6), (0, 1, 2, 255), (0, 1)):
        vm.mem_write(game, bytes(0x2000))
        put(game + 0xc12, phase, 'B'); put(game + 0xc10, mode, 'B'); put(game + 0x2a6, perk, 'B')
        put(game + 0x4b0, 1.0, 'f')
        reg('RCX', game)
        admitted = run(0x14596ee30, {0x14596ef4f, 0x14596eefb}) == 0x14596ef4f
        assert admitted == bool(phase == 2 and mode != 255 and perk)
        skip_gates.append(dict(phase=phase, mode=mode, perk=perk, admitted=admitted))
    for mode, price, factor, purse in itertools.product((0, 1, 2),
            (0, 39, 40, 43, 44, 100, 399, 400, 0xffffffff),
            (-1.0, 0.0, 0.5, 1.0, 1.1, 1.5, 2.0), (0, 100, 0xfffffff9)):
        vm.mem_write(game, bytes(0x2000))
        put(game + 0xc12, 2, 'B'); put(game + 0xc10, mode, 'B'); put(game + 0x2a6, 1, 'B')
        put(game + 0xbc4, price, 'I'); put(game + 0x4b0, factor, 'f')
        put(game + 0x4f0, purse, 'I'); put(game + 0x79c, purse, 'I')
        reg('RCX', game)
        run(0x14596ee30, {0x14596ef4f})
        amount = max(price >> 2, 10)
        scalar = f32(amount * f32(factor))
        assert reg('RSI') == game and reg('RBX') & 255 == mode and reg('XMM0') & 0xffffffff == bits(scalar)
        rounded = f32(math.copysign(math.floor(abs(scalar) + 0.5), scalar))
        reg('XMM0', bits(rounded))
        run(0x14596ef54, {0x14596ef99}, reset_stack=False)
        credited = min(0xffffffff, max(0, int(rounded)))
        expected = (purse + credited) & 0xffffffff
        assert get(game + 0x4f0, 'I') == expected and get(game + 0x79c, 'I') == expected
        reg('R12', game)
        run(0x145968a3b, {0x145968a51})
        assert reg('RCX') == amount
        skips.append(dict(mode=mode, cache_price=price, multiplier_bits=bits(factor), purse=purse,
                          displayed=amount, credited=credited, final_gold=expected))
    for phase, mode, free, paid, gold in itertools.product((1, 2, 4), (0, 1, 2, 255),
            (0, 1), (0, 1, 2, 5, 19, 20, 21, 22, 0xffffffff), (0, 99, 100, 300, 0xffffffff)):
        vm.mem_write(game, bytes(0x2000))
        put(game + 0xc12, phase, 'B'); put(game + 0xc10, mode, 'B')
        put(game + 0x548, free, 'I'); put(game + 0x54c, paid, 'I'); put(game + 0x4f0, gold, 'I')
        reg('RCX', game)
        at = run(0x1459729a0, {0x145972acf, 0x145972ac7, 0x145972a87})
        cost = 0 if free else min(0xffffffff, 100 * 3 ** paid) if paid < 21 else 0xffffffff
        admitted = phase == 2 and mode != 255 and (free or gold >= cost)
        assert (at != 0x145972a87) == bool(admitted)
        assert get(game + 0x548, 'I') == free - int(bool(admitted and free))
        assert get(game + 0x4f0, 'I') == gold - (cost if admitted and not free else 0)
        assert get(game + 0x54c, 'I') == ((paid + 1) & 0xffffffff if admitted and not free else paid)
        if admitted:
            run(0x145972acf, {0x145972ad4}, reset_stack=False)
            assert reg('RDX') == mode
        rerolls.append(dict(phase=phase, mode=mode, free=free, paid=paid, gold=gold, cost=cost, admitted=bool(admitted)))
    for phase, mode, charges, length, index in itertools.product((1, 2, 4), (0, 1, 2, 255),
            (0, 1), (0, 1, 2), (0, 1, 2, 0xffffffffffffffff)):
        vm.mem_write(game, bytes(0x2000))
        put(game + 0xc12, phase, 'B'); put(game + 0xc10, mode, 'B'); put(game + 0xbe8, charges, 'I')
        put(game + 0x658, display); put(game + 0x660, length)
        reg('RCX', game); reg('RDX', index)
        actual = run(0x14596efc0, {0x14596f033, 0x14596f0bb}) == 0x14596f033
        assert actual == bool(phase == 2 and mode != 255 and charges and index < length)
        banish_gates.append(dict(phase=phase, mode=mode, charges=charges, length=length, index=index, admitted=actual))
    for mode, charges, key_present in itertools.product((0, 1, 2), (1, 0xffffffff), (False, True)):
        vm.mem_write(game, bytes(0x2000))
        frame, vector, text = stack + 0x6000, output + 0x1000, output + 0x2000
        vm.mem_write(text, b'accuria')
        put(frame - 0x30, 7 if key_present else 0xffffffffffffffff)
        put(frame - 0x28, text); put(frame - 0x20, 7)
        put(game + 0xbe8, charges, 'I')
        put(game + 0x938, 2); put(game + 0x940, vector); put(game + 0x948, 0)
        reg('RSI', game); reg('RBX', mode); reg('EDI', charges); reg('RBP', frame)
        at = run(0x14596f038, {0x14596f0bb, 0x145965190})
        assert (at == 0x145965190) == key_present
        assert get(game + 0xbe8, 'I') == charges - int(key_present)
        assert get(game + 0x948) == int(key_present)
        if key_present:
            assert reg('RCX') == game and reg('RDX') == mode and reg('R8') == 0
            assert bytes(vm.mem_read(vector, 24)) == struct.pack('<QQQ', 7, text, 7)
        banish_commits.append(dict(mode=mode, charges=charges, key_present=key_present,
                                  appended=key_present, regeneration_source=mode if key_present else None))
    for selector, owned in itertools.product((0, 2, 3, 4), (False, True)):
        vm.mem_write(game, bytes(0x2000)); vm.mem_write(display, bytes(160))
        key = b'accuria' if selector == 2 else b'mark_of_fordring'
        text = heap - 0x8000; record = text + 0x1000; worn = record + 0x1000
        vm.mem_write(text, key)
        put(display + 0x78, (1 << 63) | selector)
        if selector == 0:
            put(display + 0x80, text); put(display + 0x88, len(key))
        elif selector == 2:
            put(record, text); put(record + 8, len(key)); put(display + 0x80, record)
            put(game + 0x348, worn); put(game + 0x350, int(owned)); put(worn, record)
        elif selector == 3:
            vm.mem_write(record, struct.pack('<QQQ', len(key), text, len(key)))
            put(display + 0x80, record)
            put(game + 0x3a0, len(key) if owned else 0xffffffffffffffff)
            put(game + 0x3a8, text); put(game + 0x3b0, len(key))
        reg('RCX', output); reg('RDX', game); reg('R8', display)
        run(0x145964f70, {output + 0x8000})
        actual = None if get(output) == 0xffffffffffffffff else bytes(vm.mem_read(get(output + 8), get(output + 16))).decode()
        expected = None if selector == 4 or (owned and selector in (2, 3)) else key.decode()
        assert actual == expected, (selector, owned, actual, expected)
        banish_keys.append(dict(selector=selector, already_owned=owned, key=actual))
    source = [(ROOT / name).read_text() for name in SOURCES]
    controls, treasure, guardian = source
    assert 'fn choice_offer_active' in controls and 'level_offer_active' not in controls
    assert controls.count('self.regenerate_active_choices()') == 2
    assert 'self.cache_price() >> 2' in controls and 'self.level >> 2' not in controls
    assert 'self.complete_treasure_choice()' in controls
    assert 'self.jewelry().iter().any' in controls and 'self.worn_amulet().is_some_and' in controls
    assert 'self.generate_treasure_choices(guardian)' in treasure and 'self.generate_level_choices()' in treasure
    assert 'cache_reroll_banish_and_skip_keep_their_source_and_use_the_current_cache_price' in treasure
    assert 'equipment_banish_refuses_owned_upgrades_but_admits_new_equipment' in treasure
    complete = dict(skip_gates=skip_gates, skip_currency=skips, reroll=rerolls,
                    banish_gates=banish_gates, banish_commits=banish_commits, banish_keys=banish_keys)
    cases = RUNTIME / 'reward-controls-cases.json'; cases.write_text(portable_json_text(complete))
    ghidra = []
    for role, first, last in [('skip-transaction', 0x14596ee30, 0x14596efb8),
                              ('reroll-transaction', 0x1459729a0, 0x145972adf),
                              ('banish-key', 0x145964f70, 0x145965182)]:
        evidence = json.loads((RUNTIME / role / 'rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
        owner = span(first, last)
        assert evidence['provider']['id'] == 'ghidra' and evidence['subject']['digest']['sha256'] == owner['sha256']
        ghidra.append(dict(role=role, owner=owner, evidence_id=evidence['evidence_id'], provider=evidence['provider'],
                           analysis_profile=evidence['analysis_profile'], pseudocode_sha256=hashlib.sha256(evidence['normalized_result'].encode()).hexdigest()))
    proof = dict(schema_version=1, target={key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
                 generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(), sha256=file_sha256(Path(__file__))),
                 native_ranges=[span(first, last) for first, last in ranges], ghidra=ghidra,
                 cases={key: len(value) for key, value in complete.items()},
                 detailed_cases=dict(path=cases.relative_to(ROOT).as_posix(), sha256=file_sha256(cases)),
                 executed_instruction_boundaries=len(visits), external_seams=[hex(value) for value in sorted(seams)],
                 source=[dict(path=name, sha256=file_sha256(ROOT / name)) for name in SOURCES],
                 limits=['Single-player source modes0/1/2 only. Co-op scaling/queues are never entered.',
                         'Skip stops before CRT roundf, then separately resumes its conversion/currency prefix with finite half-away rounding; packet publication is a stop boundary.',
                         'Reroll reaches regeneration or the field-publication CALL; Banish admission, spare-capacity commit and eight ordinary/equipment/gold key cases run separately.',
                         'Key fixtures supply allocator, byte-copy/comparison and String-clone seams. Upgrade rank formatting and arbitrary factory/Vec alias ancestry remain separate contracts.',
                         'No compiler, Rust execution, game process, real UI/input/persistence or original/rebuilt parity.'],
                 gap_ids=[41], compilation_run=False, game_run=False, parity_verified=False)
    if args.write:
        OUT.parent.mkdir(parents=True, exist_ok=True); OUT.write_text(portable_json_text(proof))
    else:
        assert portable_record(json.loads(OUT.read_text())) == portable_record(proof), 'Current reward-control proof is stale'
    print('Checked current reward controls: ' + ', '.join(f'{key}={len(value)}' for key, value in complete.items()) + '; no compiler/game')


if __name__ == '__main__':
    main()
