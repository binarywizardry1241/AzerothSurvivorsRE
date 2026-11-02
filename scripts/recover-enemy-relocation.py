#!/usr/bin/env python3
"""Recover selected 0.97.2 distant-enemy relocation and native static fixtures.

No game/source is launched or compiled. REA analyzes unchanged PE function
bytes; bounded Unicorn runs synthetic states with explicit allocation stubs.
"""
from portable_paths import objdump_output, portable_json
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import subprocess
import sys
from enemy_evidence import curated_native, pseudocode_text

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUT = ROOT / 'docs/analysis/evidence/0.97.2/enemies'
RUNTIME = ROOT / 'runtime/enemies-relocation-0.97.2'
FUNCTION = 0x145531cb0


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(value, indent=2, allow_nan=False) + '\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--prepare-native', action='store_true')
    mode.add_argument('--collect-native', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)

    def span(start, stop):
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + stop - start]
        return dict(va=hex(start), end_exclusive=hex(stop), file_offset=hex(offset),
                    byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest())

    end = dict((pe.image_base+a, pe.image_base+b) for a, b, _ in pe.functions())[FUNCTION]
    function = span(FUNCTION, end)
    if args.prepare_native:
        RUNTIME.mkdir(parents=True, exist_ok=True)
        path = RUNTIME / f'{FUNCTION:x}.bin'
        offset = int(function['file_offset'], 16)
        path.write_bytes(data[offset:offset + end - FUNCTION])
        save(RUNTIME / f'plan-{FUNCTION:x}.json', dict(
            target=str(path.relative_to(ROOT)), output=f'runtime/enemies-relocation-0.97.2/rea-{FUNCTION:x}',
            open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(FUNCTION)),
            timeout=180, open_timeout=60,
            operations=[dict(name='analyze_function', arguments=dict(procedure=hex(FUNCTION)))]))
        print('Prepared unchanged native relocation predicate and REA plan')
        return
    if args.collect_native:
        record = json.loads((RUNTIME / f'rea-{FUNCTION:x}/003-analyze_function.json').read_text())
        evidence = record['response']['result']['structuredContent']
        assert evidence['subject']['digest']['sha256'] == function['sha256']
        assert evidence['provider']['id'] == 'ghidra'
        save(OUT / 'relocation-native.json', dict(
            target_version='0.97.2', target_sha256=SHA, target_executed=False,
            original_function=function, boundary='selected PE RUNTIME_FUNCTION', rea_evidence=curated_native(evidence),
            limitations=['Static Ghidra analysis is not original source or runtime parity.',
                        'Unchanged raw slice omits callees/data; generic inferred ABI types require Win64 instruction verification.']))
        (OUT / 'relocation-predicate.ghidra.c').write_text(pseudocode_text(evidence['normalized_result']['pseudocode']))
        print('Retained SHA-bound REA/Ghidra relocation predicate')
        return
    scopes = []
    OUT.mkdir(parents=True, exist_ok=True)
    for label, start, stop in [('relocation-predicate', FUNCTION, end),
                               ('relocation-tick', 0x1454a70fd, 0x1454a7339)]:
        asm = objdump_output(['objdump', '-d', '--no-show-raw-insn',
            f'--start-address={start:#x}', f'--stop-address={stop:#x}', str(TARGET.relative_to(ROOT))],
            cwd=ROOT, text=True)
        path = OUT / f'{label}.asm'
        path.write_text(asm)
        scopes.append(dict(label=label, **span(start, stop), assembly=path.name,
                           assembly_sha256=hashlib.sha256(asm.encode()).hexdigest()))
    save(OUT / 'relocation-manifest.json', dict(
        target_version='0.97.2', target_sha256=SHA, target_executed=False,
        scopes=scopes, constants=[dict(**span(0x14670e5a4, 0x14670e5a8), value=3025.0)],
        limitations=['Predicate returns the first four qualifying GUIDs in actor-vector order.',
                     'Actor escape-state+0x78 is retained as a raw byte; only zero qualifies regardless of other encodings.',
                     'Selection and reset are separate native stages; sampling occurs before GUID lookup.']))
    fixtures(data, pe, function)


def fixtures(data, pe, function):
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    uc.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        uc.mem_write(pe.image_base + s['rva'], data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    BASE = 0x200000000
    ACTORS, ITERATOR, VALUES, OUTPUT, HEAP, GAME, FRAME, STACK = [BASE + n * 0x10000 for n in range(8)]
    uc.mem_map(BASE, 0x90000)
    SENTINEL = BASE + 0x80000
    allowed = (0, 0)
    stopping = 0
    allocations = []
    def putu(a, value): uc.mem_write(a, struct.pack('<I', value))
    def putq(a, value): uc.mem_write(a, struct.pack('<Q', value))
    def putf(a, value): uc.mem_write(a, struct.pack('<f', value))
    def getq(a): return struct.unpack('<Q', uc.mem_read(a, 8))[0]
    def getu(a): return struct.unpack('<I', uc.mem_read(a, 4))[0]
    def bits(value): return struct.unpack('<I', struct.pack('<f', value))[0]
    def f32(value): return struct.unpack('<f', struct.pack('<f', value))[0]
    def returns(value=None):
        sp = uc.reg_read(r.UC_X86_REG_RSP)
        if value is not None: uc.reg_write(r.UC_X86_REG_RAX, value)
        uc.reg_write(r.UC_X86_REG_RIP, getq(sp))
        uc.reg_write(r.UC_X86_REG_RSP, sp + 8)
    def hook(_, address, size, __):
        if address == stopping:
            uc.emu_stop()
        elif address == 0x140002200:
            returns()
        elif address == 0x1400021c0:
            assert uc.reg_read(r.UC_X86_REG_RCX) == 32
            assert uc.reg_read(r.UC_X86_REG_RDX) == 8
            assert not allocations
            allocations.append(dict(size=32, alignment=8))
            returns(HEAP)
        elif not allowed[0] <= address < allowed[1]:
            raise RuntimeError(f'Unexpected native instruction {address:x}')
    uc.hook_add(UC_HOOK_CODE, hook)
    def reset():
        allocations.clear()
        uc.mem_write(BASE, bytes(0x80000))
        uc.reg_write(r.UC_X86_REG_EFLAGS, 2)
        uc.reg_write(r.UC_X86_REG_MXCSR, 0x1f80)
        uc.reg_write(r.UC_X86_REG_RSP, STACK + 0x8008)
        putq(STACK + 0x8008, SENTINEL)
    def row(guid, x=60.0, y=0.0, dead=False, definition=True, boss=False, lair=False, raw_78=0,
            from_xy=None, start=0.0, duration=0.0):
        return dict(guid=guid, dead=dead, definition_present=definition, boss_index=(0 if boss else None),
                    lair_index=(0 if lair else None), raw_78=raw_78,
                    from_bits=[bits(v) for v in (from_xy or [x, y])], to_bits=[bits(x), bits(y)],
                    started_at_bits=bits(start), duration_bits=bits(duration))
    nan = float('nan')
    scenarios = [
        ('strict-distance', 10.0, [row(1, 55.0), row(2, f32(55.000004)), row(3, -55.0), row(4, 0, 55.0), row(5, 0, 56.0)], [2, 5]),
        ('eligibility-gates', 10.0, [row(1, dead=True), row(2, definition=False), row(3, boss=True), row(4, lair=True), row(5, raw_78=1), row(6)], [6]),
        ('first-four', 10.0, [row(i) for i in range(1, 10)], [1, 2, 3, 4]),
        ('interpolated-position', 10.0, [row(1, 100, from_xy=[0, 0], start=0, duration=20), row(2, 120, from_xy=[0, 0], start=0, duration=20), row(3, 10, from_xy=[100, 0], start=0, duration=20)], [2]),
        ('clamped-time', 0.0, [row(1, 0, from_xy=[60, 0], start=10, duration=20), row(2, 60, from_xy=[0, 0], start=10, duration=20)], [1]),
        ('nonfinite-and-negative-duration', 10.0, [row(1, nan), row(2, duration=nan), row(3, duration=-1), row(4, duration=-0.0)], [3, 4]),
        ('empty', 10.0, [], []),
    ]
    selections = []
    for name, now, rows, expected in scenarios:
        reset()
        for index, row_ in enumerate(rows):
            at = ACTORS + index * 0x160
            putq(at + 0x18, (1 << 64) - 1 if row_['boss_index'] is None else row_['boss_index'])
            putq(at + 0x40, (1 << 64) - 1 if row_['lair_index'] is None else row_['lair_index'])
            uc.mem_write(at + 0x68, bytes([int(row_['dead'])]))
            uc.mem_write(at + 0x78, bytes([row_['raw_78']]))
            putq(at + 0x88, row_['guid'])
            putq(at + 0x90, VALUES + 0x100 if row_['definition_present'] else 0)
            for n in range(2):
                putu(at + 0x10c + n * 4, row_['from_bits'][n])
                putu(at + 0x118 + n * 4, row_['to_bits'][n])
            putu(at + 0x124, row_['started_at_bits'])
            putu(at + 0x128, row_['duration_bits'])
        putf(VALUES, now)
        putf(VALUES + 16, 0.0)
        putf(VALUES + 20, 0.0)
        for offset, value in [(0, ACTORS), (8, ACTORS + len(rows) * 0x160), (16, VALUES), (24, VALUES + 16), (32, 4)]:
            putq(ITERATOR + offset, value)
        uc.reg_write(r.UC_X86_REG_RCX, OUTPUT)
        uc.reg_write(r.UC_X86_REG_RDX, ITERATOR)
        allowed, stopping = (FUNCTION, int(function['end_exclusive'], 16)), SENTINEL
        uc.emu_start(FUNCTION, 0, count=20000)
        assert uc.reg_read(r.UC_X86_REG_RIP) == stopping
        length, pointer = getq(OUTPUT + 16), getq(OUTPUT + 8)
        guids = [getq(pointer + 8*n) for n in range(length)]
        assert guids == expected, (name, guids, expected)
        selections.append(dict(name=name, now_bits=bits(now), player_bits=[0, 0, 0], actors=rows,
                               selected_guids=guids, allocation_stubs=list(allocations)))
    resets = []
    for now, position, before in [(10.0, [1.0, 2.0, 3.0], 0), (0.0, [-20.0, 30.0, 42.0], 0xffffffff), (1200.25, [0.0, -0.0, 999.0], 41)]:
        reset()
        putu(ACTORS + 0x70, 1)
        putf(ACTORS + 0x74, 999.0)
        putf(ACTORS + 0x130, 2.5)
        putf(FRAME + 0x210, now)
        for n, value in enumerate(position): putf(FRAME + 0x2d8 + n * 4, value)
        putu(GAME + 0x908, before)
        for register, value in [(r.UC_X86_REG_RAX, ACTORS), (r.UC_X86_REG_RCX, 0x160),
            (r.UC_X86_REG_RBP, FRAME), (r.UC_X86_REG_R13, GAME), (r.UC_X86_REG_R14, 42),
            (r.UC_X86_REG_RSI, FRAME + 0x2d8), (r.UC_X86_REG_RBX, OUTPUT)]: uc.reg_write(register, value)
        allowed, stopping = (0x1454a727c, 0x1454a72e8), 0x1454a72e8
        uc.emu_start(allowed[0], 0, count=1000)
        assert uc.reg_read(r.UC_X86_REG_RIP) == stopping
        result = dict(now_bits=bits(now), position_bits=[bits(v) for v in position], counter_before=before,
            from_bits=[getu(ACTORS+0x10c+n*4) for n in range(3)], to_bits=[getu(ACTORS+0x118+n*4) for n in range(3)],
            started_at_bits=getu(ACTORS+0x124), duration_bits=getu(ACTORS+0x128), next_movement_bits=getu(ACTORS+0x12c),
            casting_after=getu(ACTORS+0x70), cast_ends_at_bits=getu(ACTORS+0x74), attack_delay_bits=getu(ACTORS+0x130),
            counter_after=getu(GAME+0x908), packet_guid=uc.reg_read(r.UC_X86_REG_RDX), packet_counter=uc.reg_read(r.UC_X86_REG_R9))
        assert result['from_bits'] == result['to_bits'] == result['position_bits']
        assert result['duration_bits'] == 0 and result['casting_after'] == 0
        assert result['counter_after'] == (before+1)&0xffffffff
        resets.append(result)
    report = dict(target_version='0.97.2', target_sha256=SHA,
        method='Unmodified native instructions under bounded Unicorn with synthetic actor/run state. Only allocation helpers are stubbed; no game/source launch or compilation.',
        predicate_scope=[hex(FUNCTION), function['end_exclusive']], reset_scope=['0x1454a727c', '0x1454a72e8'],
        selection_cases=selections, reset_cases=resets)
    save(ROOT / 'crates/azeroth-survivors-re/tests/fixtures/enemy-relocation-native.json', report)
    print(f'Recovered {len(selections)} full native selection and {len(resets)} native reset fixtures')


if __name__ == '__main__':
    main()
