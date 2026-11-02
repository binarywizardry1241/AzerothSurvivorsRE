#!/usr/bin/env python3
"""Recover/check bounded current visual scale and effect-setting contracts.

No application, compiler or game process is started. Original PE instructions
run only in Unicorn with synthetic state and explicit allocation/libm seams.
REA/Ghidra plans operate on project-local immutable slices.
"""
from portable_paths import objdump_output
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
from coverage_common import latest_target
SHA='8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK=ROOT/'runtime/visual-contracts-0.105.0'
OUT=ROOT/'docs/analysis/evidence/0.105.0/spell-presentation'
OWNERS={
    'radius':(0x1459614e0,0x1459615f3),
    'spell-scales':(0x145924e50,0x145925103),
    'ground-create':(0x145926650,0x145926e3b),
    'ground-init':(0x140599e80,0x14059ad8a),
    'scale-lookup':(0x1407e00a0,0x1407e025c),
    'kit-scale':(0x1408d8e10,0x1408d9856),
    'effect-setting':(0x14003de60,0x14003df24),
    'toggle-setter':(0x1407e0430,0x1407e0437),
    'ground-gate':(0x14059a644,0x14059a68f),
    'burst-gate':(0x14059b119,0x14059b137),
    'missile-gate':(0x14059cfcc,0x14059cfde),
    'kit-gate':(0x1405a0b58,0x1405a0b63),
    'request-gate':(0x14076935d,0x140769389),
}
PSEUDO_SOURCES={
    'spell-scales':'rea-spell-scales', 'ground-init':'rea-owner-140599e80',
    'effect-setting':'rea-owner-14003de60','kit-scale':'rea-kit-scale',
}


def dump(v): return json.dumps(v,indent=2,allow_nan=False)+'\n'
def bits(v):
    return _shared_bits(v)
def f32(v):
    return _shared_f32(v)


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--check',action='store_true')
    ap.add_argument('--prepare-rea',action='store_true')
    args=ap.parse_args()
    target=latest_target(verify=True);assert target['sha256']==SHA
    data=(ROOT/target['path']).read_bytes()
    mod = load_script('pe', ROOT/'scripts/inventory-executable.py');pe=mod.PE(data)
    WORK.mkdir(parents=True,exist_ok=True)
    def raw(a,n):
        off=pe.rva_offset(a-pe.image_base);return data[off:off+n]
    def span(a,b):
        return dict(start=hex(a),end_exclusive=hex(b),file_offset=hex(pe.rva_offset(a-pe.image_base)),sha256=hashlib.sha256(raw(a,b-a)).hexdigest())
    owners=[]
    for name,(a,b) in OWNERS.items():
        row=dict(role=name,**span(a,b),assembly=name+'.asm')
        assembly=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',target['path']],cwd=ROOT,text=True)
        (WORK/row['assembly']).write_text(assembly)
        row['assembly_sha256']=hashlib.sha256(assembly.encode()).hexdigest()
        response=WORK/PSEUDO_SOURCES.get(name,'missing')/'003-procedure_pseudo_code.json'
        retained=OUT/(name+'.ghidra.c')
        if response.exists():
            ev=json.loads(response.read_text())['response']['result']['structuredContent']
            assert ev['provider']['id']=='ghidra'
            assert ev['subject']['digest']['sha256']==row['sha256']
            text='\n'.join(line.rstrip() for line in ev['normalized_result'].splitlines()).strip()+'\n'
            (WORK/(name+'.ghidra.c')).write_text(text)
            row.update(pseudocode=name+'.ghidra.c',pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest(),evidence_id=ev['evidence_id'])
        elif args.check and retained.exists():
            # Disposable raw responses are not a prerequisite for reproducing checks.
            old=json.loads((OUT/'manifest.json').read_text())
            prior=next(r for r in old['owners'] if r['role']==name)
            assert hashlib.sha256(retained.read_bytes()).hexdigest()==prior['pseudocode_sha256']
            row.update({k:prior[k] for k in ('pseudocode','pseudocode_sha256','evidence_id')})
        owners.append(row)
        if args.prepare_rea:
            (WORK/(name+'.bin')).write_bytes(raw(a,b-a))
            plan=dict(target=str((WORK/(name+'.bin')).relative_to(ROOT)),output=str((WORK/('rea-'+name)).relative_to(ROOT)),init_timeout=60,timeout=240,open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(a)))])
            (WORK/(name+'-plan.json')).write_text(dump(plan))
    if args.prepare_rea:
        print('Prepared selected-target REA/Ghidra plans; no target execution');return
    sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    from unicorn import x86_const as x
    uc=Uc(UC_ARCH_X86,UC_MODE_64)
    end=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections)
    uc.mem_map(pe.image_base,(end+4095)&~4095)
    for s in pe.sections:uc.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
    BASE,STACK=0x200000000,0x300000000
    uc.mem_map(BASE,0x20000);uc.mem_map(STACK,0x20000)
    GAME,DEFS,LEARNED,AUX,ALLOC,OUTPUT=BASE,BASE+0x2000,BASE+0x4000,BASE+0x8000,BASE+0xc000,BASE+0x10000
    SENTINEL=STACK+0x1f000
    active=[];stops=set();logs=[]
    def put(a,fmt,*v):uc.mem_write(a,struct.pack(fmt,*v))
    def u32(a):return struct.unpack('<I',uc.mem_read(a,4))[0]
    def u64(a):return struct.unpack('<Q',uc.mem_read(a,8))[0]
    def ret():
        sp=uc.reg_read(x.UC_X86_REG_RSP);uc.reg_write(x.UC_X86_REG_RIP,u64(sp));uc.reg_write(x.UC_X86_REG_RSP,sp+8)
    def hook(_,a,n,unused):
        if a in stops:uc.emu_stop()
        elif any(lo<=a<hi for lo,hi in active):return
        elif a==0x145bfafd0:
            vec=uc.reg_read(x.UC_X86_REG_RCX);put(vec,'<QQ',256,ALLOC);ret()
        elif a==0x145bc98dd:
            argument=uc.reg_read(x.UC_X86_REG_XMM0)&0xffffffff
            result=bits(math.log1p(struct.unpack('<f',struct.pack('<I',argument))[0]))
            logs.append([argument,result]);uc.reg_write(x.UC_X86_REG_XMM0,result);ret()
        else:raise AssertionError('Unreviewed instruction '+hex(a))
    uc.hook_add(UC_HOOK_CODE,hook)
    def run(lo,hi,extra=()):
        nonlocal active,stops
        active=[(lo,hi),*extra];stops={SENTINEL,hi}
        uc.reg_write(x.UC_X86_REG_MXCSR,0x1f80)
        uc.emu_start(lo,0,count=10000)
        assert uc.reg_read(x.UC_X86_REG_RIP)in stops
    def call(lo,hi,extra=()):
        uc.reg_write(x.UC_X86_REG_RSP,STACK+0x10000);put(STACK+0x10000,'<Q',SENTINEL);run(lo,hi,extra)
    lookup=[]
    radius_ids={10,1510,1680,5740,6343,8122,16914,20549,26573,120,122,1160,1449,1949,11113,13810,15237,779,2120}
    for spell in sorted(radius_ids|{0,1,133,0xffffffff}):
        uc.reg_write(x.UC_X86_REG_ECX,spell);call(*OWNERS['radius'])
        result=uc.reg_read(x.UC_X86_REG_XMM0)&0xffffffff if uc.reg_read(x.UC_X86_REG_EAX)&1 else None
        expected=8. if spell in {10,1510,1680,5740,6343,8122,16914,20549,26573} else 10. if spell in {120,122,1160,1449,1949,11113,13810,15237} else 5. if spell in {779,2120} else None
        assert result==(bits(expected)if expected is not None else None)
        lookup.append([spell,result])
    # Each input is [spell, kind, range, radius, instance_area, talent_area].
    profiles=[[[10,3,0.,8.,1.,1.]],[[120,8,10.,99.,1.5,2.]],[[133,1,0.,8.,1.,1.]],[[10,3,0.,0.,1.,1.]],[[10,3,0.,80.,1.,1.]],[[10,3,0.,8.,2.,1.],[10,3,0.,8.,3.,1.]],[[779,8,5.,9.,1.,1.]]]
    scales=[]
    for rows in profiles:
      for area in [.5,1.,2.]:
        uc.mem_write(BASE,bytes(0x20000));put(GAME+0x4a0,'<f',area)
        for i,row in enumerate(rows):
            spell,kind,reach,radius,instance,talent=row
            definition=DEFS+i*120;record=LEARNED+i*104
            put(definition+0x40,'<I',spell);put(definition+0x4c,'<ff',reach,radius);put(definition+0x75,'<B',kind)
            put(record,'<Q',definition);put(record+0x34,'<f',instance);put(record+0x50,'<f',talent)
        put(GAME+0x318,'<QQ',LEARNED,len(rows));put(GAME+0xb8,'<QQ',AUX,0)
        put(GAME+0x3f8,'<Q',DEFS+0x1000)
        uc.reg_write(x.UC_X86_REG_RCX,OUTPUT);uc.reg_write(x.UC_X86_REG_RDX,GAME)
        logs=[];call(*OWNERS['spell-scales'],extra=(OWNERS['radius'],))
        count=u64(OUTPUT+16);pointer=u64(OUTPUT+8)
        result=[[u32(pointer+i*12),u32(pointer+i*12+4),uc.mem_read(pointer+i*12+8,1)[0]]for i in range(count)]
        expected=[]
        for spell,kind,reach,radius,instance,talent in rows:
            base=next((r[1]for r in lookup if r[0]==spell),None)
            if base is None or any(r[0]==spell for r in expected):continue
            value=f32(f32(f32(instance*talent)*(reach if kind==8 else radius))*area)
            if value>70.:value=f32(f32(f32(math.log1p(f32(f32(value-70.)/10.)))*10.)+70.)
            expected.append([spell,bits(f32(value/struct.unpack('<f',struct.pack('<I',base))[0])),int(kind==8)])
        assert result==expected,(rows,area,result,expected)
        scales.append(dict(instances=rows,global_area=area,output=result,log1p_calls=logs))
    # Exact cursor-skipping gates; callers' unrelated queries are outside the oracle.
    density=[]
    for scale in [.25,.5,1.,1.5,2.,4.,8.]:
      for level in [.33,.66,1.]:
        rate=3.7
        for register,value in [(x.UC_X86_REG_XMM13,scale),(x.UC_X86_REG_XMM12,4.),
                               (x.UC_X86_REG_XMM6,rate),(x.UC_X86_REG_XMM9,level)]:
            uc.reg_write(register,bits(value))
        run(0x14059aa60,0x14059aa74)
        result=uc.reg_read(x.UC_X86_REG_XMM13)&0xffffffff
        expected=bits(f32(min(f32(scale*scale),4.)*f32(f32(rate)*f32(level))))
        assert result==expected
        density.append([bits(scale),bits(rate),bits(level),result])
    gates=[]
    for hidden in [False,True]:
        put(0x148004b98,'<B',hidden)
        for role,lo,hi in [('burst',0x14059b119,0x14059b137),('missile',0x14059cfcc,0x14059cfde)]:
            put(BASE,'<Q',7);put(BASE+0x1040,'<Q',11)
            if role=='burst':
                uc.reg_write(x.UC_X86_REG_RAX,BASE+0x1000);uc.reg_write(x.UC_X86_REG_R14,BASE)
            else:
                uc.reg_write(x.UC_X86_REG_RAX,BASE+0x1000);uc.reg_write(x.UC_X86_REG_R11,BASE)
            run(lo,hi);value=u64(BASE);assert value==(11 if hidden else 7)
            gates.append(dict(role=role,hidden=hidden,cursor=value))
    constants=[dict(va=hex(a),hex=raw(a,4).hex(),sha256=hashlib.sha256(raw(a,4)).hexdigest())
               for a in [0x145d9aecc,0x145d6d36c,0x145db7fc0,0x145e4cde8,0x145e4cdec,
                          0x146066890,0x146e78468,0x145d6d650]]
    assert struct.unpack('<f',raw(0x145d9aecc,4))[0]==4.
    manifest=dict(target_sha256=SHA,target_process_launched=False,owners=owners,constants=constants,
                  limitations=['Raw Ghidra slices omit external callees/data; original PE instructions and explicit Win64 seams govern interpretation.',
                  '21 scale-table cases cover learned records; native auxiliary record production and attached-kit query admission remain incompletely mapped.',
                  'No compilation, device/game execution, rendered/audio comparison or Windows CRT/log1pf parity.'])
    vectors=dict(target_sha256=SHA,radius_lookup=lookup,scale_publication=scales,cursor_gates=gates,shard_rate=density,
                 seams=['Successful vector allocation','Host log1p injected after captured native f32 argument; caller math remains original'])
    outputs={'manifest.json':dump(manifest),'native.json':dump(vectors)}
    for name,text in outputs.items():(WORK/name).write_text(text)
    for row in owners:
        for field in ['assembly','pseudocode']:
            if field in row:
                source=WORK/row[field]
                if args.check:
                    assert hashlib.sha256((OUT/row[field]).read_bytes()).hexdigest()==row[field+'_sha256']
                elif source.exists():
                    OUT.mkdir(parents=True,exist_ok=True);(OUT/row[field]).write_bytes(source.read_bytes())
    for name,text in outputs.items():
        if args.check:assert (OUT/name).read_text()==text,name
        else:OUT.mkdir(parents=True,exist_ok=True);(OUT/name).write_text(text)
    contracts={
        'crates/azeroth-survivors-re/src/player_abilities/visual_scale.rs':
            ['definition.kind == 8','instance.area_multiplier * instance.talent_area_multiplier * radius',
             'rows.iter().any(|row| row.spell_id == definition.spell_id)'],
        'crates/azeroth-survivors-re/src/gameplay/mechanics.rs':
            ['self.abilities.iter().chain(self.racial.iter())','self.effect_state.numeric.area'],
        'crates/azeroth-survivors-re/src/gameplay/client/spell_scales.rs':
            ['game.visual_spell_scales()','scales.0 = rows'],
        'crates/benilla-app/src/entities/dest_fx.rs':
            ['ground_scale(store.0.object_scale_x())','shard_density(scale)',
             '* (proc.params[1] * level_scale)','scales.get(burst.spell_id, true)',
             '!hidden && stages.area_gate','!hidden && p.ty == PROC_TYPE_SHARD_EMITTER'],
        'crates/benilla-app/src/entities/missile.rs':
            ['spell_settings::hidden(cvars.as_deref())','key,','spawn: spawn.clone()'],
        'crates/benilla-app/src/entities/spell_fx/mod.rs':
            ['matches!(ev, SpellKitFx::Begin { .. })','spell_settings::hidden(cvars.as_deref())'],
        'crates/benilla-app/src/entities/chain_beam.rs':['spell_settings::hidden(cvars.as_deref())'],
        'crates/benilla-app/src/local_client/spell_settings.rs':['value.trim() == "1"'],
    }
    for name,tokens in contracts.items():
        text=(ROOT/name).read_text()
        for token in tokens:assert "".join(token.split()) in "".join(text.split()),(name,token)
    print(f'{len(lookup)} radius lookups / {len(scales)} native scale-table cases / {len(density)} shard-rate cases / {len(gates)} cursor gates; source routes traced; no build/game')

if __name__=='__main__':main()
