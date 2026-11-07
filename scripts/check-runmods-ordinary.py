#!/usr/bin/env python3
"""Replay current ordinary modifier/stat consumers in bounded Unicorn memory.

No game/application process is launched. External zone resolver, powf and entity
creation are explicit seams. Position is supplied to bypass terrain placement;
allocation is pre-sized. Native constructor, both HP polynomials, RNG draws,
population gate, GUID, field writes and argument order execute unchanged.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
from pathlib import Path
import argparse,re,math
import hashlib
import json
import struct
import sys

ROOT = Path.cwd()

sys.path[:0]=[str(ROOT / "runtime/tool-state/python/armory/python-libs"),str(ROOT / "runtime/tool-state/python/camera/python-libs")]
sys.path.insert(0,str(ROOT/"scripts"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

from coverage_common import latest_target,target_bytes
EXPECTED = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
target=latest_target(verify=False);assert target['sha256']==EXPECTED
data=target_bytes(target)
inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
pe = inventory.PE(data)
uc = Uc(UC_ARCH_X86, UC_MODE_64)
image_size = max(s["rva"] + max(s["virtual_size"],s["raw_size"]) for s in pe.sections)
uc.mem_map(pe.image_base,(image_size+4095)&~4095)
for section in pe.sections:
    uc.mem_write(pe.image_base+section["rva"],data[section["raw_offset"]:section["raw_offset"]+section["raw_size"]])
GAME, POSITION, ACTORS = 0x200000000, 0x200002000, 0x200004000
STACK, STOP = 0x300000000, 0x400000000
uc.mem_map(GAME,0x20000)
uc.mem_map(STACK,0x20000)
uc.mem_map(STOP,4096)
RANGES = [(0x145970560,0x145970f13),(0x14599e9c0,0x14599ea05),(0x14599ea10,0x14599ea55)]
extra_stop=0
zone_index, pow_result, events, create = 0, 0, [], []


def bits(value):
    return _shared_bits(value)
def putu(address,value): uc.mem_write(address,struct.pack('<I',value))
def putq(address,value): uc.mem_write(address,struct.pack('<Q',value))
def readu(address): return struct.unpack('<I',uc.mem_read(address,4))[0]
def readq(address): return struct.unpack('<Q',uc.mem_read(address,8))[0]
def ret():
    sp=uc.reg_read(UC_X86_REG_RSP)
    uc.reg_write(UC_X86_REG_RSP,sp+8)
    uc.reg_write(UC_X86_REG_RIP,readq(sp))


def hook(_,address,size,__):
    if address in (STOP,extra_stop): uc.emu_stop()
    elif any(a<=address<b for a,b in RANGES): return
    elif address==0x14588d0d0:
        uc.reg_write(UC_X86_REG_RAX,zone_index)
        ret()
    elif address==0x145bfa165:
        events.append({"base_bits":uc.reg_read(UC_X86_REG_XMM0)&0xffffffff,
                       "exponent_bits":uc.reg_read(UC_X86_REG_XMM1)&0xffffffff,
                       "result_bits":pow_result})
        uc.reg_write(UC_X86_REG_XMM0,pow_result)
        ret()
    elif address==0x14596ed40:
        sp=uc.reg_read(UC_X86_REG_RSP)
        position=readq(sp+0x40)
        create.append({"guid":uc.reg_read(UC_X86_REG_RDX),
                       "entry":uc.reg_read(UC_X86_REG_R8)&0xffffffff,
                       "model_id":uc.reg_read(UC_X86_REG_R9)&0xffffffff,
                       "scale_bits":readu(sp+0x28),"health_bits":readu(sp+0x30),
                       "flag_4c":uc.mem_read(sp+0x38,1)[0],
                       "position_bits":[readu(position+i*4) for i in range(3)]})
        ret()
    else: raise RuntimeError(f"Unscoped instruction {address:x}")


uc.hook_add(UC_HOOK_CODE,hook)
REGISTERS=[UC_X86_REG_RAX,UC_X86_REG_RBX,UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_RSI,
           UC_X86_REG_RDI,UC_X86_REG_RBP,UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_R10,
           UC_X86_REG_R11,UC_X86_REG_R12,UC_X86_REG_R13,UC_X86_REG_R14,UC_X86_REG_R15]


def run(enemy_index,clock,difficulty,hp_pct,dmg_pct,speed_pct,phase,endless,start,power,
        density=100,statuses=(),counter=0,seed=(0x123456789abcdef0,0xfedcba9876543210,0xa5a5a5a5a5a5a5a5,0x55aa55aa55aa55aa)):
    global events,create,pow_result
    events,create,pow_result=[],[],bits(power)
    uc.mem_write(GAME,bytes(0x20000))
    uc.mem_write(STACK,bytes(0x20000))
    for reg in REGISTERS: uc.reg_write(reg,0)
    for reg in range(UC_X86_REG_XMM0,UC_X86_REG_XMM15+1): uc.reg_write(reg,0)
    uc.reg_write(UC_X86_REG_EFLAGS,2)
    uc.reg_write(UC_X86_REG_MXCSR,0x1f80)
    putq(GAME+0x558,256)
    putq(GAME+0x560,ACTORS)
    putq(GAME+0x568,len(statuses))
    for index,status in enumerate(statuses): putu(ACTORS+index*0x1d8+0xb0,status)
    for offset,value in [(0xa34,bits(clock)),(0xaa8,bits(difficulty)),(0x970,phase),
                         (0x974,bits(start)),(0xa60,counter)]: putu(GAME+offset,value)
    uc.mem_write(GAME+0x2b0,struct.pack('<HHHH',density,hp_pct,dmg_pct,speed_pct))
    uc.mem_write(GAME+0xab8,bytes([endless]))
    for offset,value in zip((0x9a0,0x9a8,0x9b0,0x9b8),seed): putq(GAME+offset,value)
    uc.mem_write(POSITION,struct.pack('<Ifff',1,123.,456.,17.))
    sp=STACK+0x1f008
    putq(sp,STOP)
    uc.reg_write(UC_X86_REG_RSP,sp)
    uc.reg_write(UC_X86_REG_RCX,GAME)
    uc.reg_write(UC_X86_REG_RDX,enemy_index)
    uc.reg_write(UC_X86_REG_R8,POSITION)
    uc.emu_start(RANGES[0][0],0,count=100000)
    assert uc.reg_read(UC_X86_REG_RIP)==STOP
    success=bool(uc.reg_read(UC_X86_REG_RAX)&1)
    row={"success":success,"counter_after":readu(GAME+0xa60),
         "rng_after":[readq(GAME+i) for i in (0x9a0,0x9a8,0x9b0,0x9b8)],"pow_calls":events,
         "created":create,"actor_count_after":readq(GAME+0x568)}
    if success:
        actor=ACTORS+len(statuses)*0x1d8
        row.update({"guid":readq(actor+0xf0),"definition_va":hex(readq(actor+0xf8)),
                    "health_bits":readu(actor+0x158),"max_health_bits":readu(actor+0x15c),
                    "damage_bits":readu(actor+0x160),"movement_speed_bits":readu(actor+0x164),
                    "attack_interval_bits":readu(actor+0x168),"melee_reach_bits":readu(actor+0x16c),
                    "scale_bits":readu(actor+0x170),"spawn_clock_bits":readu(actor+0x18c),
                    "next_movement_at_bits":readu(actor+0x194),"initial_attack_delay_bits":readu(actor+0x198),
                    "facing_bits":readu(actor+0x1bc),"flag_4c":uc.mem_read(actor+0x1d4,1)[0]})
    return row


inputs=[("start",0.,1.,100,100,100,0,False,0.,1.),
        ("mid_run",337.5,1.5,175,80,140,1,False,0.,1.),
        ("late",1800.,2.25,300,250,75,1,False,0.,1.),
        ("zero_modifiers",600.,1.,0,0,0,1,False,0.,1.),
        ("max_modifiers",720.,.75,65535,65535,65535,1,False,0.,1.),
        ("endless_future_clamp",600.,1.,100,100,100,1,True,720.,1.),
        ("endless_fractional",817.5,1.,100,100,100,1,True,720.,1.375),
        ("endless_wrong_phase",817.5,1.,100,100,100,0,True,720.,1.)]
cases=[]
for zone_index in range(12):
    zone=0x146bde390+zone_index*0xf0
    enemies,count=readq(zone+0x78),readq(zone+0x80)
    for enemy_index in range(count):
        for label,clock,diff,hp,dmg,speed,phase,endless,start,power in inputs:
            result=run(enemy_index,clock,diff,hp,dmg,speed,phase,endless,start,power)
            cases.append({"label":label,"zone_index":zone_index,"enemy_index":enemy_index,
                "clock_bits":bits(clock),"difficulty_bits":bits(diff),"zone_scale_bits":readu(zone+0xe0),
                "hp_percent":hp,"damage_percent":dmg,"speed_percent":speed,"phase":phase,"endless":endless,
                "endless_start_bits":bits(start),"pow_result_bits":bits(power),"seed":[0x123456789abcdef0,0xfedcba9876543210,0xa5a5a5a5a5a5a5a5,0x55aa55aa55aa55aa],
                "counter_before":0,**result})
# Endpoints, density rounding, active/dead statuses and caller index saturation.
gate_cases=[]
zone_index=0
for density in [0,1,99,100,101,199,200,239,240,65535]:
    for alive in [49,50,99,100,119,120]:
        statuses=[0]*alive+[1]*3
        result=run(0,0.,1.,100,100,100,0,False,0.,1.,density,statuses)
        gate_cases.append({"density_percent":density,"statuses":statuses,**result})
clamp_cases=[]
for index,counter in [(0,0xfffffffe),(11,0xffffffff),(12,0),(0xffffffffffffffff,0x00ffffff)]:
    clamp_cases.append({"requested_enemy_index":index,"counter_before":counter,
                       **run(index,0.,1.,100,100,100,0,False,0.,1.,counter=counter)})
result={"version":"0.109.0","target_sha256":EXPECTED,"target_executed":False,
        "instruction_emulation":True,"ranges":[[hex(a),hex(b)] for a,b in RANGES],
        "seams":["zone resolver returns chosen catalog index","Windows CRT powf has explicit injected results and captured arguments",
                 "entity creation captures arguments; position supplied; actor vector preallocated"],
        "scaling_cases":cases,"population_cases":gate_cases,"clamp_guid_cases":clamp_cases}

# Five branch probes distinguish the current nonzero test from historical bit zero.
flag_cases=[]
extra_stop=0x145970946
for flag in [0,1,2,3,255]:
 frame=STACK+0x10000;uc.mem_write(frame,bytes(0x1000));uc.mem_write(frame+0x1d7,bytes([flag]));uc.reg_write(UC_X86_REG_RBP,frame);uc.reg_write(UC_X86_REG_EFLAGS,2)
 try:uc.emu_start(0x145970903,0x145970946,count=100)
 except Exception as e:raise RuntimeError((hex(uc.reg_read(UC_X86_REG_RIP)),flag,str(e)))from e
 actual=[uc.reg_read(reg)&0xffffffff for reg in [UC_X86_REG_XMM15,UC_X86_REG_XMM7]];want=[bits(4.8 if flag else 4.95),bits(1.0 if flag else 1.25)];assert actual==want;flag_cases.append(dict(flag=flag,factor_bits=actual))

def f(v):
    return _shared_f32(v)
def fb(v):return struct.unpack('<f',struct.pack('<I',v))[0]
for c in cases:
 zone=0x146bde390+c['zone_index']*240;ptr=readq(zone+0x78);words=list(struct.unpack('<20I',uc.mem_read(ptr+c['enemy_index']*80,80)));x=lambda i:fb(words[i]);flag=words[19]&255
 t=f(fb(c['clock_bits'])/60);zd=f(fb(c['zone_scale_bits'])*fb(c['difficulty_bits']));power=fb(c['pow_result_bits'])
 linear=f(f(f(.1)*t)+1);quadratic=f(f(fb(0x3d1374bc)*t)*t);partial=f(quadratic+linear);coef=fb(0x3bc2a455 if flag else 0x3be6afcd);cubic=f(f(coef*t)*t);cubic=f(t*cubic);hpoly=f(f(cubic+partial)*zd)
 linear=f(f(f(.07)*t)+1);quadratic=f(f(f(.015)*t)*t);partial=f(quadratic+linear);cubic=f(f(f(f(.0002)*t)*t)*t);dpoly=f(f(math.sqrt(zd))*f(cubic+partial))
 bonus=fb(readu(zone+0xe4));fraction=max(0.,min(1.,f(t/20)));mult=f(f(f(bonus*fraction)*fraction)+1)
 health=f(hpoly*f(x(12)*f(4.8 if flag else 4.95)));health=f(health*mult);health=f(power*health);health=f(f(c['hp_percent']/100)*health)
 damage=f(dpoly*f(x(13)*f(1. if flag else 1.25)));damage=f(power*damage);damage=f(f(c['damage_percent']/100)*damage)
 speed=f(f(f(c['speed_percent']/100)*f(1.05))*x(15))
 assert [c['health_bits'],c['damage_bits'],c['movement_speed_bits']]==[bits(health),bits(damage),bits(speed)],(c['zone_index'],c['enemy_index'],c['label'])
 assert c['health_bits']==c['max_health_bits']
 assert c['attack_interval_bits']==words[14]
 assert c['initial_attack_delay_bits']==bits(f(.5*x(14)))
 assert c['melee_reach_bits']==bits(f(f(f(1.2)*x(10))+f(2.2)))
 assert len(c['pow_calls'])==2
for c in gate_cases:
 cap=max(50,min(120,int(f(f(c['density_percent']/100)*50))));alive=c['statuses'].count(0);assert c['success']==(alive<cap)
# Check the actual source records consumed by ordinary and guardian adapters.
source_stat_fields=0
for catalog in ['enemies/catalog.rs','guardians/catalog.rs']:
 body=(ROOT/'crates/azeroth-survivors-re/src'/catalog).read_text();blocks=re.findall(r'^    EnemyDefinition \{(.*?)^    \},',body,re.M|re.S);assert len(blocks)==148;cursor=0
 for zi in range(12):
  zone=0x146bde390+zi*240;pointer,n=readq(zone+0x78),readq(zone+0x80)
  for index in range(n):
   words=struct.unpack('<20I',uc.mem_read(pointer+80*index,80));block=blocks[cursor];cursor+=1
   for field,wi in [('scale',10),('base_hp',12),('base_damage',13),('raw_38',14),('raw_3c',15)]:
    actual=int(re.search(r'\b'+field+r': f32::from_bits\(0x([0-9a-f]+)',block)[1],16);assert actual==words[wi],(catalog,zi,index,field);source_stat_fields+=1
   assert int(re.search(r'flag_4c: (\d+)',block)[1])==(words[19]&255);source_stat_fields+=1
source=(ROOT/'crates/azeroth-survivors-re/src/enemies/scaling.rs').read_text();assert 'if definition.flag_4c != 0'in source
# Compact complete stat outputs, keeping the repeatable original calls in this script.
fields=['zone_index','enemy_index','label','difficulty_bits','hp_percent','damage_percent','speed_percent','health_bits','damage_bits','movement_speed_bits']
vectors=dict(stats=[{k:c[k]for k in fields}for c in cases],population=[{k:c[k]for k in ['density_percent','statuses','success']}for c in gate_cases],flags=flag_cases)
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
md=Cs(CS_ARCH_X86,CS_MODE_64);out=ROOT/'docs/analysis/evidence/0.109.0/runmods-scaling';ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
if args.write:out.mkdir(parents=True,exist_ok=True)
ranges=[]
for name,a,b in [('flagged-health',0x14599e9c0,0x14599ea05),('ordinary-health',0x14599ea10,0x14599ea55)]:
 off=pe.rva_offset(a-pe.image_base);raw=data[off:off+b-a];ins=list(md.disasm(raw,a));assert sum(i.size for i in ins)==len(raw);assembly=''.join(f'{i.address:#x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins);p=out/(name+'.asm')
 if args.write:p.write_text(assembly)
 else:assert p.read_text()==assembly
 ranges.append(dict(role=name,start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw).hexdigest(),assembly=p.name))
queries=[]
for a in ['14599e9c0','14599ea10']:
 path=ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0'/a/'rea-fast/003-procedure_pseudo_code.json'
 if path.exists():
  z=json.loads(path.read_text())['response']['result']['structuredContent'];queries.append(dict(procedure='0x'+a,evidence_id=z['evidence_id'],subject_sha256=z['subject']['digest']['sha256'],analysis_profile_digest=z['analysis_profile']['digest']))
if not queries:queries=json.loads((out/'ordinary-manifest.json').read_text())['ghidra']
manifest=dict(target_sha256=EXPECTED,ranges=ranges,ghidra=queries,canonical_constructor='../raid-wards/hatch-creation.asm',canonical_constructor_manifest='../raid-wards/manifest.json#hatch-creation',checks=dict(stats=len(cases),population=len(gate_cases),guid=len(clamp_cases),flags=len(flag_cases),source_stat_fields=source_stat_fields),limits=['Original complete ordinary constructor and both polynomial leaves execute with preallocated actors and supplied position.','Zone resolution, CRT powf result and entity-publication calls are explicit seams. Native powf arguments/order and shared RNG/stores execute unchanged.','Independent scalar-f32 transcription of source math matches all1184 HP/damage/speed results. This does not compile or execute Rust.','Native input catalogs are read directly. Whole catalog localization, terrain/geometry, entity internals and gameplay/rendered parity are outside this scope.','No compiler, application or game runs.'])
for name,value in [('ordinary-manifest.json',manifest),('ordinary-vectors.json',vectors)]:
 text=json.dumps(value,separators=(',',':'))+'\n';p=out/name
 if args.write:p.write_text(text)
 else:assert p.read_text()==text,name
print(f'Current ordinary modifiers: {len(cases)} stats, {len(gate_cases)} population, {len(clamp_cases)} GUID, {len(flag_cases)} flag cases; no build/game')
