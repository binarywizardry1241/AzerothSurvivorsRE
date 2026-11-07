#!/usr/bin/env python3
"""Check bounded selected-target demon spell math; never compile/launch games."""
from portable_paths import objdump_output, portable_json, portable_record
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe'
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK = ROOT / 'runtime/analysis/history/combat/demon-scaling/b82b4fc2eee1'
OUT = ROOT / 'runtime/analysis/staging/native-evidence/0.105.0/demon-spells'
RETAINED = ROOT / 'docs/analysis/evidence/0.105.0/demon-spells'
RANGES = {
    'infernal-status-capture': (0x14594F752, 0x14594F7C3),
    'infernal-status-apply': (0x14594F9D2, 0x14594FA89),
    'infernal-power': (0x14594F7C3, 0x14594F8C1),
    'doomguard-power': (0x145950159, 0x1459501ED),
    'pit-lord-power': (0x14595164F, 0x1459516A9),
    'infernal-interval': (0x1459049A3, 0x1459049ED),
    'fallback-power': (0x14594F3E2, 0x14594F4A6),
    'doomguard-focus': (0x145950241, 0x1459502DC),
    'doomguard-target-count': (0x1459503AE, 0x1459503CF),
    'pit-lord-target-count': (0x145951622, 0x14595164F),
}

def save(path, value):
    path.write_text(portable_json(value, indent=2) + '\n')

def f(value):
    return _shared_f32(value)

def bits(value):
    return _shared_bits(value)

def vectors(pe):
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, __version__
    import unicorn.x86_const as reg
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'], pe.data[section['raw_offset']:
            section['raw_offset'] + section['raw_size']])
    mem = 0x200000000
    u.mem_map(mem, 0x10000)
    def put(address, fmt, *values): u.mem_write(address, struct.pack('<' + fmt, *values))
    def get(address, fmt): return struct.unpack('<' + fmt, u.mem_read(address, struct.calcsize('<' + fmt)))
    def r(name, value): u.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    def x(index, value): r('XMM' + str(index), bits(value))
    def value(index): return u.reg_read(getattr(reg, 'UC_X86_REG_XMM' + str(index))) & 0xffffffff
    game, definition, descriptor, rows, stack = [mem + x for x in (0, 0x1000, 0x2000, 0x3000, 0x8000)]
    cases = {'power': [], 'interval': [], 'fallback': [], 'focus': [], 'targets': [], 'status': []}
    # Exact arithmetic after current spell-modifier production. That producer,
    # target query, critical draw and impact are explicit boundaries here.
    for spell, base, kind, scalar in [('hellfire', 12., 2, 1.), ('shadow_bolt', 34., 0, 1.2), ('searing_pain', 50., 1, 1.6)]:
        for coefficient, power_modifier, health_modifier, health, damage in [
                (1., 1., 0., 100., 1.), (2., 1.4, .03, 250., 1.7),
                (1.25, .5, 0., 90., 2.1), (3.75, 1.6, .01, 350., .7)]:
            u.mem_write(mem, bytes(0x10000)); r('MXCSR', 0x1f80)
            put(game + 0x478, 'ff', health, damage)
            put(definition + 0x44, 'f', base); put(definition + 0x75, 'B', kind)
            put(descriptor + 0x2c, 'f', scalar); put(rows + 0x18, 'Q', descriptor)
            put(game + 0xd0, 'Q', rows)
            # Pit Lord deliberately omits generic spell modifiers/health power.
            if spell == 'searing_pain':
                r('RBX', game); r('RCX', definition); x(0, 1.); x(1, coefficient)
                u.emu_start(0x14595164F, 0x1459516A9, count=100)
                base_result = value(6)
                expected = f(f(f(f(base * f(1.4)) * f(coefficient)) * 1.) * f(damage))
                assert base_result == bits(expected)
                actual = f(struct.unpack('<f', struct.pack('<I', base_result))[0] * f(scalar))
            elif spell == 'shadow_bolt':
                r('RDI', game); r('R14', definition); r('RAX', rows); r('R13', 0)
                x(8, coefficient); x(9, power_modifier); x(10, health_modifier)
                u.emu_start(0x145950159, 0x1459501ED, count=100)
                actual = struct.unpack('<f', struct.pack('<I', value(6)))[0]
            else:
                r('RBP', stack); x(13, base); x(7, coefficient); x(8, power_modifier)
                x(9, health_modifier); x(11, health); x(12, .5); x(6, damage)
                for lo, hi in [(0x14594F7C3, 0x14594F7D1), (0x14594F7FA, 0x14594F803),
                               (0x14594F81F, 0x14594F82F), (0x14594F84B, 0x14594F854),
                               (0x14594F898, 0x14594F89D), (0x14594F8BC, 0x14594F8C1)]:
                    u.emu_start(lo, hi, count=100)
                actual = struct.unpack('<f', struct.pack('<I', value(6)))[0]
            modifier = 1. if spell == 'searing_pain' else power_modifier
            hp = 0. if spell == 'searing_pain' else f(f(health_modifier) * f(health))
            base_power = f(f(f(base * f(1.4)) * f(coefficient)) * f(modifier))
            expected = f(f(f(f(base_power * (.5 if kind in (2, 3, 8) else 1.)) + hp) * f(damage)) * f(scalar))
            assert bits(actual) == bits(expected), (spell, actual, expected)
            cases['power'].append(dict(key=spell, coefficient_bits=bits(coefficient), modifier_bits=bits(modifier),
                health_modifier_bits=bits(0. if spell == 'searing_pain' else health_modifier), health_bits=bits(health),
                damage_bits=bits(damage), descriptor_bits=bits(scalar), output_bits=bits(actual)))
    for cooldown, modifier, factor, global_cd in [(1.,1.,1.,1.),(.5,.4,.35,.7),(.1,.1,.25,.1),(2.,1.2,.75,1.5)]:
        u.mem_write(mem, bytes(0x10000)); put(definition + 0x48, 'f', 1.5)
        put(game + 0x480, 'f', global_cd); put(game + 0xd0, 'Q', rows)
        r('R14', definition); r('RSI', game); r('R15', 0)
        for index, v in [(7,10.),(8,cooldown),(9,1.4),(10,.25),(11,.01),(13,modifier),(15,factor)]: x(index,v)
        u.emu_start(0x1459049A3, 0x1459049ED, count=100)
        actual = get(rows + 0x74, 'f')[0]
        original = f(1.5 * f(1.4))
        numerator = f(f(f(f(original * f(cooldown)) * f(modifier)) * f(global_cd)) * f(factor))
        expected = f(10. + max(f(max(numerator,.25) / max(original,f(.01))),.25))
        assert bits(actual) == bits(expected)
        cases['interval'].append(dict(cooldown_bits=bits(cooldown),modifier_bits=bits(modifier),factor_bits=bits(factor),
            global_bits=bits(global_cd),now_bits=bits(10.),deadline_bits=bits(actual)))
    for inputs in [[], [.5], [1.2], [1.25, 2.75], [1.1, 1.2, 1.3, 1.4, 1.5, 1.6]]:
        if not inputs: continue  # empty collection's native branch directly uses1
        u.mem_write(mem, bytes(0x10000)); r('RAX', len(inputs)); r('RCX', rows)
        for index, power in enumerate(inputs): put(rows + index * 0x68 + 0x28, 'f', power)
        u.emu_start(0x14594F3E2, 0x14594F4A6, count=1000)
        total = -0.
        for power in inputs: total = f(total + f(power))
        assert value(7) == bits(max(f(total / len(inputs)),1.))
        cases['fallback'].append(dict(input_bits=[bits(p) for p in inputs],output_bits=value(7)))
    for previous, count, target, eligible, echo in [
            (0,0,7,True,False),(7,1,7,True,False),(7,2,7,True,True),
            (7,12,7,True,False),(7,0xffffffff,7,True,False),
            (7,4,8,True,False),(7,4,8,True,True),
            (7,4,8,False,False),(7,4,8,False,True)]:
        u.mem_write(mem, bytes(0x10000));put(rows+0x30,'QI',previous,count)
        r('RAX',rows);r('RBX',target);r('R15',int(echo));r('R11',0);r('RBP',stack);x(7,0.)
        u.emu_start(0x145950241 if eligible else 0x145950293,
            0x1459502A9 if echo else 0x1459502DC,count=100)
        bonus=f(min(count,10)*f(.2)) if eligible and previous==target else 0.
        assert value(7)==bits(bonus)
        next_previous,next_count=get(rows+0x30,'QI')
        if echo: assert (next_previous,next_count)==(previous,count)
        else: assert (next_previous,next_count)==((target,((count+1)&0xffffffff) if previous==target else 1) if eligible else (0,0))
        cases['focus'].append(dict(previous=previous,count=count,target=target,eligible=eligible,echo=echo,
            bonus_bits=value(7),next_previous=next_previous,next_count=next_count))
    for pit in (False,True):
        for base,learned,modifiers,global_count in [(1,0,0,0),(1,2,3,4),(0,10,5,9),
                (1,0xffffffff,0,0),(1,0xffffffff,0xffffffff,3)]:
            u.mem_write(mem,bytes(0x10000));put(definition+0x54,'I',base);r('RBP',stack)
            if pit:
                put(game+0x4ac,'I',global_count);r('RBX',game);r('RCX',definition);r('RDX',learned)
                u.emu_start(0x145951622,0x14595164F,count=100);actual=get(stack+8,'Q')[0]
            else:
                r('R14',definition);r('R12',learned);r('R11',global_count);put(stack+0x60,'I',modifiers)
                u.emu_start(0x1459503AE,0x1459503CF,count=100);actual=u.reg_read(reg.UC_X86_REG_R13)
            total=(base+learned+global_count+(0 if pit else modifiers))&0xffffffff
            expected=((total+int(total==0)+(2 if pit else 0))&0xffffffff) if base else (3 if pit else 1)
            assert actual==expected
            cases['targets'].append(dict(pit_lord=pit,base=base,learned=learned,modifiers=modifiers,global_count=global_count,output=actual))
    for selectors in [[], [(8,0,1,1,True)], [(8,0,1,0xffffffff,True)],
            [(8,1,1,1,True),(8,0,1,1,True)], [(8,0,3,1,True)],
            [(8,0,1,1,False),(8,0,1,1,True),(8,0,1,3,True)]]:
        u.mem_write(mem,bytes(0x10000));r('RBP',stack);r('RCX',rows);r('RAX',len(selectors));r('RDX',0)
        expected=None
        for index,(tag,condition,selector,status,matching) in enumerate(selectors):
            row=rows+index*64;key=mem+0x5000+index*16
            put(row,'B',tag);put(row+4,'f',.05*(index+1));put(row+8,'Iff',status,.4,3.)
            put(row+24,'I',condition);put(row+32,'B',selector);put(row+40,'QQ',key,8)
            u.mem_write(key,b'hellfire' if matching else b'not-fire')
            if expected is None and tag==8 and condition==0 and selector==1 and status!=0xffffffff and matching:expected=index
        u.emu_start(0x14594F752,0x14594F7D8 if expected is None else 0x14594F7C3,count=1000)
        actual=get(stack+0xc0,'I')[0]
        assert actual==(0xffffffff if expected is None else selectors[expected][3])
        record=dict(rows=[list(row) for row in selectors],index=expected,status=actual)
        if expected is not None:
            assert value(10)==bits(.05*(expected+1))
            assert get(stack-8,'ff')==(f(.4),3.)
            record['chance_bits']=value(10)
        cases['status'].append(record)
    return dict(target_sha256=SHA,engine='Unicorn '+__version__,application_executed=False,cases=cases)

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('action',choices=['collect','check']);args=parser.parse_args()
    data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
    module = load_script('pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
    OUT.mkdir(parents=True,exist_ok=True)
    result=vectors(pe)
    definitions=[]
    for index in range(113):
        lo=0x146BACAD8+index*120;at=pe.rva_offset(lo-pe.image_base);record=data[at:at+120]
        pointer,length=struct.unpack_from('<QQ',record);key_at=pe.rva_offset(pointer-pe.image_base);key=data[key_at:key_at+length].decode()
        if key not in ('hellfire','shadow_bolt','searing_pain'):continue
        definitions.append(dict(key=key,address=hex(lo),sha256=hashlib.sha256(record).hexdigest(),raw_hex=record.hex()))
    result['definitions']=definitions
    if args.action=='check':
        assert portable_record(json.loads((RETAINED/'native-vectors.json').read_text()))==portable_record(result)
        manifest=json.loads((RETAINED/'manifest.json').read_text());assert manifest['target_sha256']==SHA
        owner=manifest['rea_infernal_owner'];lo,hi=[int(x,16) for x in owner['pe_range']];at=pe.rva_offset(lo-pe.image_base)
        assert hashlib.sha256(data[at:at+hi-lo]).hexdigest()==owner['input_sha256']
        for row in manifest['ranges']:
            lo,hi=[int(x,16) for x in row['range']];at=pe.rva_offset(lo-pe.image_base)
            assert hashlib.sha256(data[at:at+hi-lo]).hexdigest()==row['sha256']
            assert hashlib.sha256((RETAINED/row['assembly']).read_bytes()).hexdigest()==row['text_sha256']
    else:
        ranges=[]
        for name,(lo,hi) in RANGES.items():
            text=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT)
            (OUT/f'{name}.asm').write_bytes(text);at=pe.rva_offset(lo-pe.image_base)
            ranges.append(dict(role=name,range=[hex(lo),hex(hi)],sha256=hashlib.sha256(data[at:at+hi-lo]).hexdigest(),assembly=f'{name}.asm',text_sha256=hashlib.sha256(text).hexdigest()))
        evidence=json.loads((WORK/'rea-melee/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
        save(OUT/'manifest.json',dict(target_sha256=SHA,ranges=ranges,rea_infernal_owner=dict(evidence_id=evidence['evidence_id'],provider=evidence['provider'],input_sha256=evidence['subject']['digest']['sha256'],pe_range=['0x14594f2b0','0x14594fb4d']),limitations=['Bounded unchanged instructions; spell-modifier production, targeting, criticals and packets are outside these vectors.']))
        save(OUT/'native-vectors.json',result)
    print('Verified',sum(map(len,result['cases'].values())),'unchanged native demon spell cases; no compilation or game launch')

if __name__=='__main__':main()
