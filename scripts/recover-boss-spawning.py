#!/usr/bin/env python3
"""Retain selected 0.97.2 boss schedule/placement and bounded native fixtures.

No build, compiler test or game process is run. Existing matching REA dossiers
are reused; the point-filter helper has its own focused Ghidra plan.
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

ROOT=Path(__file__).resolve().parents[1]
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUT=ROOT/'docs/analysis/evidence/0.97.2/bosses'
RUNTIME=ROOT/'runtime/analysis/history/raid/boss-spawning/dbb1dbd025ec'
FUNCTION=0x145529b50


def save(path,value):
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(portable_json(value,indent=2,allow_nan=False)+'\n')


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    mode=parser.add_mutually_exclusive_group()
    mode.add_argument('--prepare-native',action='store_true')
    mode.add_argument('--collect-native',action='store_true')
    args=parser.parse_args()
    data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
    spec=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py')
    m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);pe=m.PE(data)
    extents={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    def span(a,b):
        offset=pe.rva_offset(a-pe.image_base);raw=data[offset:offset+b-a]
        return dict(va=hex(a),end_exclusive=hex(b),file_offset=hex(offset),byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest())
    end=extents[FUNCTION];fn=span(FUNCTION,end)
    if args.prepare_native:
        RUNTIME.mkdir(parents=True,exist_ok=True)
        offset=int(fn['file_offset'],16);path=RUNTIME/f'{FUNCTION:x}.bin'
        path.write_bytes(data[offset:offset+end-FUNCTION])
        save(RUNTIME/f'plan-{FUNCTION:x}.json',dict(target=str(path.relative_to(ROOT)),
            output=f'runtime/analysis/history/raid/boss-spawning/dbb1dbd025ec/rea-{FUNCTION:x}',
            open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(FUNCTION)),
            timeout=180,open_timeout=60,operations=[dict(name='analyze_function',arguments=dict(procedure=hex(FUNCTION)))]))
        print('Prepared selected boss-point filter REA plan');return
    if args.collect_native:
        e=json.loads((RUNTIME/f'rea-{FUNCTION:x}/003-analyze_function.json').read_text())['response']['result']['structuredContent']
        assert e['subject']['digest']['sha256']==fn['sha256'] and e['provider']['id']=='ghidra'
        save(OUT/'spawning-point-filter-native.json',dict(target_version='0.97.2',target_sha256=SHA,target_executed=False,original_function=fn,rea_evidence=e))
        pseudocode='\n'.join(line.rstrip() for line in e['normalized_result']['pseudocode'].splitlines()).rstrip()+'\n'
        (OUT/'spawning-point-filter.ghidra.c').write_text(pseudocode)
        print('Retained SHA-bound boss point-filter Ghidra evidence');return
    scopes=[]
    for name,a,b in [('primary-schedule',0x1454a92bd,0x1454a93d6),('schedule-outer-suppression',0x1454a701a,0x1454a703e),
                     ('startup-gate',0x1454b07c0,0x1454b0850),('startup-all-bosses',0x1454b0ae7,0x1454b0b59),
                     ('constructor-index-zero',0x14549c565,0x14549c56d),('constructor-endless-deadline',0x14549c5d0,0x14549c5de),
                     ('fixed-point-admission',FUNCTION,end),('fixed-point-uniform',0x1454bf1e0,0x1454bf259),
                     ('fixed-point-farthest',0x1454bf491,0x1454bf538),('boss-ring-fallback',0x1454bfdff,0x1454bfe48)]:
        asm=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True)
        path=OUT/f'spawning-{name}.asm';path.parent.mkdir(parents=True,exist_ok=True);path.write_text(asm)
        scopes.append(dict(label=name,**span(a,b),assembly=path.name,assembly_sha256=hashlib.sha256(asm.encode()).hexdigest()))
    reused=[]
    for start,path in [(0x14549d550,'runtime/analysis/history/raid/guardians/b4a536d2fa6d/rea-14549d550/evidence-bundle.json'),
                       (0x1454b07c0,'runtime/analysis/history/raid/guardians/b4a536d2fa6d/rea-1454b07c0/evidence-bundle.json'),
                       (0x14549bb90,'runtime/analysis/history/native-recovery/enemies/b24ae4fa5276/scaling/rea-14549bb90/evidence-bundle.json')]:
        records=json.loads((ROOT/path).read_text())['records']
        e=next(e for e in records if e['operation']=='analyze_function' and e['parameters']['procedure']==hex(start))
        original=span(start,extents[start]);assert e['subject']['digest']['sha256']==original['sha256']
        text=e['normalized_result']['pseudocode']
        if start==0x14549d550:
            begin=text.index('    uVar29 = *(ulong *)(in_RCX + 0x22c);');finish=text.index('    if ((float)in_RCX[0x24a]',begin)
            excerpt=text[begin:finish]
        elif start==0x1454b07c0:
            excerpt='\n'.join(text.splitlines()[190:315])
        else:excerpt=None
        reused.append(dict(original_function=original,rea={k:e.get(k) for k in ['evidence_id','subject','provider','operation','parameters','analysis_profile','limitations']},
                           pseudocode_excerpt=excerpt,pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest()))
    constants=[]
    for address,size in [(0x1458f8fa0,4),(0x14593e294,4),(0x145933c50,4),(0x1459c7a84,4),(0x1469aa320,16)]:
        offset=pe.rva_offset(address-pe.image_base);raw=data[offset:offset+size]
        constants.append(dict(**span(address,address+size),hex=raw.hex(),f32_values=list(struct.unpack('<'+'f'*(size//4),raw))))
    save(OUT/'spawning-manifest.json',dict(target_version='0.97.2',target_sha256=SHA,target_executed=False,
        scopes=scopes,reused_rea=reused,constructor_mapping='Game field = stack RBP field minus0x28; aggregate copied from RBP+0x28.',
        defaults=dict(next_primary=0,endless_deadline_bits=0,raw_958=0),constants=constants,
        limitations=['Native snippets and synthetic-state instruction fixtures do not establish game/runtime parity.',
                     'Boss creation and death are separately recovered owners; main schedule advances before creation.']))
    fixtures(data,pe)


def fixtures(data,pe):
    sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    import unicorn.x86_const as r
    uc=Uc(UC_ARCH_X86,UC_MODE_64)
    size=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in pe.sections)
    uc.mem_map(pe.image_base,(size+4095)&~4095)
    for s in pe.sections:uc.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    BASE=0x200000000;GAME=BASE;FRAME=BASE+0x10000;STACK=BASE+0x20000
    uc.mem_map(BASE,0x30000);scope=(0,0);stops=set();created=[];boss_pointer=0
    def u(a,v):uc.mem_write(a,struct.pack('<I',v))
    def q(a,v):uc.mem_write(a,struct.pack('<Q',v))
    def gu(a):return struct.unpack('<I',uc.mem_read(a,4))[0]
    def gq(a):return struct.unpack('<Q',uc.mem_read(a,8))[0]
    def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
    def f32(v):return struct.unpack('<f',struct.pack('<f',v))[0]
    def xmm(n,v):uc.reg_write(getattr(r,f'UC_X86_REG_XMM{n}'),bits(v))
    def hook(_,a,size,__):
        if a in stops:uc.emu_stop()
        elif a==0x1454bf100:
            ptr=uc.reg_read(r.UC_X86_REG_RDX)
            created.append(dict(index=(ptr-boss_pointer)//88,index_before_call=gq(GAME+0x8b0)))
            sp=uc.reg_read(r.UC_X86_REG_RSP);uc.reg_write(r.UC_X86_REG_RIP,gq(sp));uc.reg_write(r.UC_X86_REG_RSP,sp+8)
        elif not scope[0]<=a<scope[1]:raise RuntimeError(f'Unexpected native instruction {a:x}')
    uc.hook_add(UC_HOOK_CODE,hook)
    def reset(seed):
        created.clear();uc.mem_write(BASE,bytes(0x30000));uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        uc.reg_write(r.UC_X86_REG_R13,GAME);uc.reg_write(r.UC_X86_REG_RSI,GAME);uc.reg_write(r.UC_X86_REG_RBP,FRAME);uc.reg_write(r.UC_X86_REG_RSP,STACK+0x8000)
        for n,v in enumerate(seed):q(GAME+0x880+n*8,v)
    def run(a,b,endpoints=None):
        nonlocal scope,stops
        scope=(a,b);stops=set(endpoints or [b]);uc.emu_start(a,0,count=10000)
        assert uc.reg_read(r.UC_X86_REG_RIP) in stops
    catalog=json.loads((OUT/'catalog.json').read_text());schedule=[]
    for zone in catalog['zones']:
        zva=int(zone['record']['va'],16);boss_pointer=int(zone['boss_slice']['va'],16)
        for boss in zone['bosses']:
            minute=struct.unpack('<f',struct.pack('<I',boss['words'][16]))[0]
            for clock in [minute*60-1,minute*60,minute*60+1]:
                seed=[1,2,3,4];reset(seed);q(GAME+0x8b0,boss['index']);u(GAME+0x8e4,bits(clock));u(FRAME+0x68,bits(f32(clock/60)));q(FRAME+0x338,zva);xmm(0,clock)
                run(0x1454a92bd,0x1454a93d6)
                expected=clock>=minute*60
                assert len(created)==int(expected)
                assert gq(GAME+0x8b0)==boss['index']+int(expected)
                schedule.append(dict(zone_index=zone['index'],next_primary=boss['index'],clock_bits=bits(clock),endless=False,deadline_bits=0,seed=seed,
                                     calls=list(created),next_after=gq(GAME+0x8b0),deadline_after=gu(GAME+0x934),rng_after=[gq(GAME+0x880+n*8) for n in range(4)]))
        for endless,clock,deadline,next_,seed in [(False,1200,0,5,[1,2,3,4]),(True,1200,1201,5,[1,2,3,4]),
            (True,1200,1200,5,[1,2,3,4]),(True,1200,0,9,[0x123456789abcdef0,0x5555555555555555,0xaaaaaaaaaaaaaaaa,0xfedcba9876543210])]:
            reset(seed);q(GAME+0x8b0,next_);u(GAME+0x8e4,bits(clock));u(GAME+0x934,bits(deadline));uc.mem_write(GAME+0x952,bytes([int(endless)]));q(FRAME+0x338,zva);xmm(0,clock)
            run(0x1454a92bd,0x1454a93d6)
            assert len(created)==int(endless and clock>=deadline)
            schedule.append(dict(zone_index=zone['index'],next_primary=next_,clock_bits=bits(clock),endless=endless,deadline_bits=bits(deadline),seed=seed,
                                 calls=list(created),next_after=gq(GAME+0x8b0),deadline_after=gu(GAME+0x934),rng_after=[gq(GAME+0x880+n*8) for n in range(4)]))
    filters=[]
    for distance in [0,19.999,20,20.001,100,float('nan')]:
        reset([1,2,3,4]);xmm(0,distance);xmm(6,20)
        run(0x145529bb7,0x145529bbc,[0x145529be0,0x145529bbc])
        filters.append(dict(distance_bits=bits(distance),admitted=uc.reg_read(r.UC_X86_REG_RIP)==0x145529be0))
    comparisons=[]
    for current,candidate in [(10,15),(15,10),(15,15),(0,0),(float('nan'),10),(10,float('nan'))]:
        reset([1,2,3,4]);xmm(6,current);xmm(0,candidate);uc.reg_write(r.UC_X86_REG_R14,11);uc.reg_write(r.UC_X86_REG_RBX,22)
        run(0x1454bf50e,0x1454bf538,[0x1454bf4c0])
        comparisons.append(dict(current_bits=bits(current),candidate_bits=bits(candidate),choose_candidate=uc.reg_read(r.UC_X86_REG_R14)==22))
    point_draws=[]
    for count in range(1,7):
        for seed in [[1,2,3,4],[0x123456789abcdef0,0x5555555555555555,0xaaaaaaaaaaaaaaaa,0xfedcba9876543210]]:
            reset(seed);uc.reg_write(r.UC_X86_REG_R9,count)
            run(0x1454bf1e0,0x1454bf259)
            point_draws.append(dict(count=count,seed=seed,index=uc.reg_read(r.UC_X86_REG_RDX),rng_after=[gq(GAME+0x880+n*8) for n in range(4)]))
    result=dict(target_version='0.97.2',target_sha256=SHA,
        method='Unchanged original x64 scheduling, point admission/order and RNG instruction scopes under bounded Unicorn; boss creation explicitly stubbed without RNG consumption; no game/source launch or compilation.',
        schedule=schedule,point_filters=filters,farthest_comparisons=comparisons,point_draws=point_draws)
    save(ROOT/'crates/azeroth-survivors-re/tests/fixtures/boss-spawning-native.json',result)
    print(f'{len(schedule)} schedule, {len(filters)} point-filter, {len(comparisons)} farthest-order and {len(point_draws)} point-RNG native fixtures retained')


if __name__=='__main__':main()
