#!/usr/bin/env python3
"""Check current boss caller arithmetic with native instructions, no build/game.

The two powf import calls are explicit injected-result seams; this does not
assert the host libm is bit-identical to the Windows CRT.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
from coverage_common import latest_target
OUT = ROOT / 'docs/analysis/evidence/0.105.0/boss-math'
WORK = ROOT / 'runtime/analysis/history/raid/boss-math/5dbad0250cf7'
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'


def bits(v):
    return _shared_bits(v)


def f32(v):
    return _shared_f32(v)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = (ROOT / target['path']).read_bytes()
    module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    uc.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        uc.mem_write(pe.image_base+s['rva'], data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    base, stack = 0x200000000, 0x300000000
    uc.mem_map(base, 0x10000)
    uc.mem_map(stack, 0x10000)
    game, frame = base, stack + 0x8000
    ranges = ((0x145930179, 0x145930209), (0x14593054f, 0x1459306ae))
    calls, injected = [], []

    def put(a, fmt, *values):
        uc.mem_write(a, struct.pack(fmt, *values))

    def word(a):
        return struct.unpack('<I', uc.mem_read(a, 4))[0]

    def hook(_, address, size, unused):
        if address == 0x145bc9805:
            result = injected[len(calls)]
            calls.append([uc.reg_read(x.UC_X86_REG_XMM0) & 0xffffffff,
                          uc.reg_read(x.UC_X86_REG_XMM1) & 0xffffffff, bits(result)])
            uc.reg_write(x.UC_X86_REG_XMM0, bits(result))
            sp = uc.reg_read(x.UC_X86_REG_RSP)
            ret = struct.unpack('<Q', uc.mem_read(sp, 8))[0]
            uc.reg_write(x.UC_X86_REG_RSP, sp+8)
            uc.reg_write(x.UC_X86_REG_RIP, ret)
        else:
            assert any(a <= address < b for a, b in ranges), hex(address)
    uc.hook_add(UC_HOOK_CODE, hook)
    profiles = [
        [0., 1., 100, 100, 100, 0, False, 0., 1., 1.],
        [600., 1.5, 175, 80, 140, 0, False, 0., 1., 1.],
        [600., 1., 0, 0, 0, 0, False, 0., 1., 1.],
        [1200., .75, 65535, 65535, 65535, 0, False, 0., 1., 1.],
        [817.5, 2.25, 140, 120, 75, 1, True, 720., 2., 1.375],
        [600., 1., 100, 100, 100, 1, True, 720., 1., 1.],
        [817.5, 1., 100, 100, 100, 0, True, 720., 1., 1.],
        [720., 1., 100, 100, 100, 1, True, 720., 1., 1.],
    ]
    catalog = json.loads((ROOT/'docs/analysis/evidence/0.105.0/boss-catalog/catalog.json').read_text())
    cases = []
    for zi, zone in enumerate(catalog['zones']):
        zva = int(zone['record']['va'], 16)
        scale = struct.unpack('<f', data[pe.rva_offset(zva-pe.image_base)+224:pe.rva_offset(zva-pe.image_base)+228])[0]
        for bi, boss in enumerate(zone['bosses']):
            definition = int(boss['record']['va'], 16)
            hp_base, damage_base = [struct.unpack('<f', struct.pack('<I', boss['words'][i]))[0] for i in (17,18)]
            for pi, profile in enumerate(profiles):
                clock, difficulty, hp, damage, speed, phase, endless, start, p1, p2 = profile
                uc.mem_write(base, bytes(0x10000))
                uc.mem_write(stack, bytes(0x10000))
                uc.reg_write(x.UC_X86_REG_RSI, game)
                uc.reg_write(x.UC_X86_REG_RDI, zva)
                uc.reg_write(x.UC_X86_REG_R13, definition)
                uc.reg_write(x.UC_X86_REG_RBP, frame)
                uc.reg_write(x.UC_X86_REG_RSP, frame-0x100)
                uc.reg_write(x.UC_X86_REG_MXCSR, 0x1f80)
                put(game+0x928, '<If', phase, start)
                put(game+0x9ec, '<f', clock)
                put(game+0xa54, '<f', difficulty)
                put(game+0xa64, '<B', endless)
                put(game+0x2b2, '<HHH', hp, damage, speed)
                calls, injected = [], [p1,p2]
                uc.emu_start(*ranges[0], count=1000)
                uc.reg_write(x.UC_X86_REG_XMM9, boss['words'][14])
                uc.emu_start(*ranges[1], count=1000)
                output = [word(frame+off) for off in (0xb8,0xbc,0xc0,0xc4,0xcc,0xf4,0x10c,0x110)]
                exponent = max(f32(f32(clock-start)/60.), 0.) if phase==1 and endless else 0.
                assert calls == [[bits(1.22),bits(exponent),bits(p1)], [bits(1.096),bits(exponent),bits(p2)]]
                health = f32(f32(f32(f32(hp_base*5.75)*scale)*difficulty)*p1)
                health = f32(f32(hp/100.)*health)
                dmg = f32(f32(math.sqrt(f32(scale*difficulty)))*damage_base)
                dmg = f32(f32(dmg*p2)*f32(damage/100.))
                movement = f32(f32(speed/100.)*struct.unpack('<f',struct.pack('<I',boss['words'][19]))[0])
                assert output[:4] == [bits(health),bits(health),bits(dmg),bits(movement)], (zi,bi,pi,output[:4])
                cases.append([zi,bi,pi,calls,output])
    result = dict(target_sha256=SHA, target_process_launched=False,
                  canonical_constructor='../boss-catalog/manifest.json',
                  ranges=[dict(start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(data[pe.rva_offset(a-pe.image_base):pe.rva_offset(b-pe.image_base)]).hexdigest()) for a,b in ranges],
                  profiles=profiles,
                  profile_columns=['clock','difficulty','hp_percent','damage_percent','speed_percent','phase','endless','endless_start','pow_health','pow_damage'],
                  case_columns=['zone','boss','profile','pow_calls_base_exponent_result_bits','output_bits'],
                  output_columns=['health','max_health','damage','movement_speed','melee_reach','next_movement_at','stun_until','raw_148_clock'],
                  cases=cases,
                  limitations=['Unchanged current constructor arithmetic; synthetic inputs and injected powf results.',
                               'Position/allocation/entity publication and later AI are outside these ranges.',
                               'Host powf/Windows CRT equivalence, compiled Rust and runtime/parity remain unverified.'])
    # Keep the dense vectors compact; this is a reproducible oracle, not a bulk disassembly copy.
    text = json.dumps({k:v for k,v in result.items() if k!='cases'}, indent=2)[:-2]+',\n  "cases": [\n'+',\n'.join('    '+json.dumps(row,separators=(',',':')) for row in cases)+'\n  ]\n}\n'
    WORK.mkdir(parents=True,exist_ok=True)
    (WORK/'native.json').write_text(text)
    if args.check:
        assert (OUT/'native.json').read_text()==text
    else:
        OUT.mkdir(parents=True,exist_ok=True)
        (OUT/'native.json').write_text(text)
    print(f'{len(cases)} current boss arithmetic cases; powf arguments/results isolated; no compilation/game')

if __name__ == '__main__':
    main()
