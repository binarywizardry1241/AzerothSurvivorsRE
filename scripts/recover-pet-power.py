#!/usr/bin/env python3
"""Exercise the selected EXE's pet stat17 consumers without launching the game.

Unchanged instructions read the actual stat-vector layout, level, damage and
critical fields. Output is staged in ignored runtime/ for review. The supplied
critical draw is an explicit seam; this does not execute the pet AI or RNG.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe'
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
OUT = ROOT / 'runtime/analysis/history/combat/power-scaling/11f43211b8a5/pet-power'
SPANS = [('pet-stat17-entry', 0x145906479, 0x1459064ad),
         ('pet-stat17-and-melee-power', 0x145906960, 0x145906a0d),
         ('pet-ranged-power', 0x1459062ef, 0x14590634b)]


def bits(value):
    return _shared_bits(value)


def f32(value):
    return _shared_f32(value)


def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, 'wrong selected target'
    inventory = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = inventory.PE(data)
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'],
                    data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    mem, stack = 0x200000000, 0x300000000
    u.mem_map(mem, 0x20000)
    u.mem_map(stack, 0x10000)
    game, stats, frame = mem, mem + 0x10000, stack + 0x8000

    def put(address, fmt, *values):
        u.mem_write(address, struct.pack(fmt, *values))

    def xmm(reg, value):
        u.reg_write(reg, bits(value))

    cases = []
    rows_cases = [[], [(16, 2.)], [(17, .2)], [(17, .2), (17, .1)],
                  [(17, .1), (0, 8.), (17, -.05)],
                  [(17, 16777216.), (17, -16777216.), (17, .25)],
                  [(17, -.5)], [(17, -1.)]]
    for rows in rows_cases:
        for level in [1, 2, 30, 71]:
            for base, damage in [(12., 1.), (27.5, 1.8), (0., 2.)]:
                for chance, draw in [(0., .3), (.5, .5), (.5, .25)]:
                    u.mem_write(mem, bytes(0x20000))
                    u.mem_write(stack, bytes(0x10000))
                    put(frame + 0x378, '<Q', game)
                    put(frame + 0x2a0, '<f', draw)
                    put(game + 0x778, '<QQ', stats, len(rows))
                    put(game + 0x4d8, '<I', level)
                    put(game + 0x47c, '<4f', damage, 1., chance, 1.75)
                    for i, (tag, value) in enumerate(rows):
                        put(stats + i * 8, '<B3xf', tag, value)
                    u.reg_write(r.UC_X86_REG_RBP, frame)
                    u.reg_write(r.UC_X86_REG_RSI, game)
                    xmm(r.UC_X86_REG_XMM8, 1.)
                    xmm(r.UC_X86_REG_XMM9, 0.)
                    xmm(r.UC_X86_REG_XMM13, base)
                    u.emu_start(0x145906479, 0x145906a0d, count=10000)
                    assert u.reg_read(r.UC_X86_REG_RIP) == 0x145906a0d
                    actual = u.reg_read(r.UC_X86_REG_XMM13) & 0xffffffff
                    total = -0.
                    for tag, value in rows:
                        if tag == 17:
                            total = f32(total + value)
                    factor = f32(total + 1.)
                    growth = f32(f32(f32(float(level)) - 1.) * f32(.12))
                    growth = f32(growth + 1.)
                    expected = f32(f32(f32(base * growth) * damage) * factor)
                    if chance > draw:
                        expected = f32(expected * 1.75)
                    assert actual == bits(expected), (rows, level, base, actual, bits(expected))
                    # The ranged owner uses the same factors before selecting
                    # normal/critical power for its queued impact.
                    xmm(r.UC_X86_REG_XMM0, total)
                    xmm(r.UC_X86_REG_XMM5, base)
                    xmm(r.UC_X86_REG_XMM8, 1.)
                    u.emu_start(0x1459062ef, 0x14590634b, count=1000)
                    assert u.reg_read(r.UC_X86_REG_RIP) == 0x14590634b
                    ranged = u.reg_read(r.UC_X86_REG_XMM5) & 0xffffffff
                    ranged_critical = u.reg_read(r.UC_X86_REG_XMM14) & 0xffffffff
                    normal = f32(f32(f32(base * growth) * damage) * factor)
                    assert ranged == bits(normal)
                    assert ranged_critical == bits(f32(normal * 1.75))
                    cases.append(dict(rows=[[tag, bits(value)] for tag, value in rows], level=level,
                                      base_bits=bits(base), damage_bits=bits(damage),
                                      chance_bits=bits(chance), draw_bits=bits(draw),
                                      critical_multiplier_bits=bits(1.75), power_bits=actual,
                                      ranged_power_bits=ranged, ranged_critical_bits=ranged_critical))
    OUT.mkdir(parents=True, exist_ok=True)
    owners = []
    for role, start, end in SPANS:
        at = pe.rva_offset(start - pe.image_base)
        raw = data[at:at + end - start]
        assembly = objdump_output(['objdump', '-d', '--no-show-raw-insn',
                     f'--start-address={start:#x}', f'--stop-address={end:#x}', str(TARGET.relative_to(ROOT))],
                     cwd=ROOT, text=True)
        (OUT / (role + '.asm')).write_text(assembly)
        owners.append(dict(role=role, start=hex(start), end_exclusive=hex(end), file_offset=hex(at),
                           sha256=hashlib.sha256(raw).hexdigest(), assembly='../tick.asm'))
    constants = []
    for role, address in [('level-offset', 0x145d73d14), ('level-growth', 0x145db5ef4),
                          ('one', 0x145d6d36c), ('negative-zero', 0x145d70c70)]:
        at = pe.rva_offset(address - pe.image_base)
        raw = data[at:at + 4]
        constants.append(dict(role=role, address=hex(address), file_offset=hex(at),
                              sha256=hashlib.sha256(raw).hexdigest(), bits=struct.unpack('<I', raw)[0]))
    # One canonical extract owns the shared inline tick ranges. Scope fixtures
    # refer to it instead of retaining overlapping copies of these instructions.
    curated = ROOT / 'runtime/analysis/staging/native-evidence/0.105.0/power-scaling'
    curated.mkdir(parents=True, exist_ok=True)
    assembly = []
    for start, end in [(0x145904e91, 0x1459077f2)]:
        assembly.append(objdump_output(['objdump', '-d', '--no-show-raw-insn',
                        f'--start-address={start:#x}', f'--stop-address={end:#x}',
                        str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True))
    (curated / 'tick.asm').write_text('\n'.join(assembly))
    result = dict(target_sha256=SHA, target_process_launched=False,
                  method='Unchanged 0.105.0 x86-64 pet melee and ranged instruction fragments in Unicorn.',
                  owners=owners, constants=constants, cases=cases,
                  seams=['Actual ordered 8-byte stat vector, level, base damage, outgoing multiplier, crit fields.',
                         'Critical random sample is a supplied input; no RNG, pet lifecycle, target query or game process runs.',
                         'Ranged extraction stops before projectile selection and deferred impact.'],
                  limits=['Finite arithmetic vectors do not establish live pet AI, animation, model or gameplay parity.'])
    (OUT / 'native-power.json').write_text(portable_json(result, indent=2) + '\n')
    print(f'{len(cases)} melee and {len(cases)} ranged pet-power cases passed')


if __name__ == '__main__':
    main()
