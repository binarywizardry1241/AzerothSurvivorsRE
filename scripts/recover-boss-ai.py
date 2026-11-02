#!/usr/bin/env python3
"""Recover boss actor gates/timers from unchanged selected 0.97.2 instructions.

REA Evidence is reused only after checking its exact function slice digest.
Bounded Unicorn ranges reject unexpected instructions/external calls. No game
process, compiler or Rust test is run.
"""
from portable_paths import objdump_output, portable_json
from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import subprocess
import sys
from enemy_evidence import curated_native

ROOT=Path(__file__).resolve().parents[1]
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUT=ROOT/'docs/analysis/evidence/0.97.2/bosses'
RUNTIME=ROOT/'runtime/boss-ai-0.97.2'


def save(path,value):
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(portable_json(value,indent=2,allow_nan=False)+'\n')


def main():
    data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
    spec=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py')
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    pe=module.PE(data)
    def span(a,b):
        off=pe.rva_offset(a-pe.image_base);raw=data[off:off+b-a]
        return dict(va=hex(a),end_exclusive=hex(b),file_offset=hex(off),byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest())
    end=dict((pe.image_base+a,pe.image_base+b) for a,b,_ in pe.functions())[0x1454c9510]
    owner=span(0x1454c9510,end)
    bundle=ROOT/'runtime/guardians-0.97.2/rea-1454c9510/evidence-bundle.json'
    if not bundle.exists():
        # The enemy recovery has the same original owner and prepares/runs a
        # replacement project-local REA session if the retained one is absent.
        subprocess.run(['python3','scripts/recover-enemy-ai.py'],cwd=ROOT,check=True)
        bundle=ROOT/'runtime/enemies-ai-0.97.2/rea-actor/evidence-bundle.json'
    record=next(e for e in json.loads(bundle.read_text())['records']
        if e['operation']=='analyze_function' and e['parameters']['procedure']=='0x1454c9510')
    assert record['subject']['digest']['sha256']==owner['sha256']
    scopes=[]
    for name,a,b in [('boss-ai-timers',0x1454cae7d,0x1454cb009),
        ('boss-dispatch-lookup-and-damage',0x1454ccbb0,0x1454ccd0a),
        ('boss-common-movement-modifier',0x1454cbc77,0x1454cbcc2)]:
        text=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True)
        path=OUT/f'{name}.asm';path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text)
        scopes.append(dict(label=name,**span(a,b),assembly=path.name))
    constants=[]
    for a in [0x14590ae44,0x14590af0c,0x1458f8d40,0x1459f74d4]:
        off=pe.rva_offset(a-pe.image_base)
        constants.append(dict(**span(a,a+4),bits=struct.unpack_from('<I',data,off)[0],value=struct.unpack_from('<f',data,off)[0]))
    # Retain the relevant native pseudocode excerpt alongside complete original
    # instruction scopes; the full actor dossier already belongs to enemies.
    evidence=curated_native(record)
    evidence['normalized_result']={key:value for key,value in evidence['normalized_result'].items() if key not in ['assembly','pseudocode']}
    evidence['pseudocode_excerpt']='\n'.join(record['normalized_result']['pseudocode'].splitlines()[1899:1990])
    evidence['excerpt_note']='Boss branch only; full actor pseudocode retained in enemies/actor-update.ghidra.c.'
    save(OUT/'ai-native.json',dict(target_version='0.97.2',target_sha256=SHA,target_executed_as_application=False,
        owner=owner,rea=evidence,scopes=scopes,constants=constants,
        limitations=['Raw native import infers generic ABI; original Win64 instructions govern.',
            'Native source enqueue uses actor-vector indices; later dispatch checks current index bounds/dead status.',
            'Common actor status/aura/packet stages require actual owning engine; static evidence is not runtime parity.']))

    sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    import unicorn.x86_const as r
    uc=Uc(UC_ARCH_X86,UC_MODE_64)
    size=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in pe.sections)
    uc.mem_map(pe.image_base,(size+4095)&~4095)
    for s in pe.sections:uc.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    ACTOR,TIMER=0x200000000,0x200001000
    uc.mem_map(ACTOR,0x3000)
    def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
    def putf(a,v):uc.mem_write(a,struct.pack('<f',v))
    def putq(a,v):uc.mem_write(a,struct.pack('<Q',v))
    def u32(a):return struct.unpack('<I',uc.mem_read(a,4))[0]
    def xmm(index,value):uc.reg_write(getattr(r,f'UC_X86_REG_XMM{index}'),bits(value))
    active=(0,0);stops=set()
    def hook(_,a,size,__):
        if a in stops:uc.emu_stop()
        elif not active[0]<=a<active[1]:raise RuntimeError(f'Unexpected native instruction {a:x}')
    uc.hook_add(UC_HOOK_CODE,hook)
    def execute(a,b,endpoints):
        nonlocal active,stops
        active=(a,b);stops=set(endpoints)
        uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        uc.emu_start(a,0,count=1000)
        rip=uc.reg_read(r.UC_X86_REG_RIP);assert rip in stops
        return rip
    def reset():
        uc.mem_write(ACTOR,bytes(0x3000))
        uc.reg_write(r.UC_X86_REG_RDI,ACTOR)
        xmm(8,0);xmm(11,1);xmm(12,1)
    enrage=[]
    for latched in [False,True]:
      for health in [100,30,29.999,0,float('nan')]:
        reset();uc.mem_write(ACTOR+0x38,bytes([latched]));putf(ACTOR+0xf0,health);putf(ACTOR+0xf4,100)
        execute(0x1454cae88,0x1454caeab,[0x1454caeab])
        enrage.append(dict(latched=latched,health_bits=bits(health),max_health_bits=bits(100),enraged_after=bool(uc.mem_read(ACTOR+0x38,1)[0])))
    catalog=json.loads((ROOT/'docs/analysis/evidence/0.97.2/guardians/guardian-catalog.json').read_text())
    assert catalog['target_sha256']==SHA
    timers=[]
    for zone in catalog['zones']:
      for boss in zone['bosses']:
       boss_va=int(boss['record']['va'],16)
       for index,ability in enumerate(boss['abilities']):
        for latched in [False,True]:
         for timer,elapsed in [(0,0),(1,1),(1,0.999),(1,20),(float('nan'),1)]:
          reset();putq(ACTOR+0x30,boss_va);uc.mem_write(ACTOR+0x38,bytes([latched]));putf(TIMER,timer)
          uc.reg_write(r.UC_X86_REG_RAX,TIMER);uc.reg_write(r.UC_X86_REG_RCX,index);xmm(7,elapsed)
          rip=execute(0x1454caf28,0x1454caf77,[0x1454caf12,0x1454caf77])
          timers.append(dict(zone=zone['key']['text'],boss_index=boss['index'],ability_index=index,
            enraged=latched,timer_bits=bits(timer),elapsed_bits=bits(elapsed),due=rip==0x1454caf77,after_bits=u32(TIMER)))
    damage=[];speed=[]
    for latched in [False,True]:
      for now,until,fraction in [(10,10,0.5),(10,10.001,0.5),(10,20,1),(10,20,-0.5)]:
        reset();uc.mem_write(ACTOR+0x38,bytes([latched]));putq(ACTOR+0x18,0)
        putf(ACTOR+0xf8,20);putf(ACTOR+0xa0,fraction);putf(ACTOR+0xa4,until)
        uc.reg_write(r.UC_X86_REG_RCX,ACTOR);xmm(3,now)
        execute(0x1454ccc82,0x1454ccccd,[0x1454ccccd])
        damage.append(dict(enraged=latched,now_bits=bits(now),until_bits=bits(until),fraction_bits=bits(fraction),base_bits=bits(20),after_bits=uc.reg_read(r.UC_X86_REG_XMM7)&0xffffffff))
        putf(ACTOR+0xfc,5);putf(ACTOR+0x98,fraction);putf(ACTOR+0x9c,until);xmm(6,now)
        execute(0x1454cbc77,0x1454cbcc2,[0x1454cbcc2])
        speed.append(dict(enraged=latched,now_bits=bits(now),until_bits=bits(until),fraction_bits=bits(fraction),base_bits=bits(5),after_bits=uc.reg_read(r.UC_X86_REG_XMM0)&0xffffffff))
    save(ROOT/'crates/azeroth-survivors-re/tests/fixtures/boss-ai-native.json',dict(target_sha256=SHA,
        method='Unchanged bounded x86-64 instructions, synthetic state, no external calls or game process.',
        enrage_cases=enrage,timer_cases=timers,damage_cases=damage,speed_cases=speed))
    print(f'Retained {len(enrage)} enrage, {len(timers)} timer, {len(damage)} damage and {len(speed)} speed native cases; actor REA identity verified.')


if __name__=='__main__':main()
