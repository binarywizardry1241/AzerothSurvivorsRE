#!/usr/bin/env python3
"""Execute unchanged 0.97.2 constructor instructions in bounded Unicorn memory.

No game/application process is launched. External zone resolver, powf and entity
creation are explicit seams. Position is supplied to bypass terrain placement;
allocation is pre-sized. Native constructor, both HP polynomials, RNG draws,
population gate, GUID, field writes and argument order execute unchanged.
"""
from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

EXPECTED = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
data = TARGET.read_bytes()
assert hashlib.sha256(data).hexdigest() == EXPECTED
spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
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
RANGES = [(0x1454c2040,0x1454c293c),(0x1454f0830,0x1454f0875),(0x1454f0880,0x1454f08c5)]
zone_index, pow_result, events, create = 0, 0, [], []


def bits(value): return struct.unpack('<I',struct.pack('<f',value))[0]
def putu(address,value): uc.mem_write(address,struct.pack('<I',value))
def putq(address,value): uc.mem_write(address,struct.pack('<Q',value))
def readu(address): return struct.unpack('<I',uc.mem_read(address,4))[0]
def readq(address): return struct.unpack('<Q',uc.mem_read(address,8))[0]
def ret():
    sp=uc.reg_read(UC_X86_REG_RSP)
    uc.reg_write(UC_X86_REG_RSP,sp+8)
    uc.reg_write(UC_X86_REG_RIP,readq(sp))


def hook(_,address,size,__):
    if address==STOP: uc.emu_stop()
    elif any(a<=address<b for a,b in RANGES): return
    elif address==0x14540e820:
        uc.reg_write(UC_X86_REG_RAX,zone_index)
        ret()
    elif address==0x145756e73:
        events.append({"base_bits":uc.reg_read(UC_X86_REG_XMM0)&0xffffffff,
                       "exponent_bits":uc.reg_read(UC_X86_REG_XMM1)&0xffffffff,
                       "result_bits":pow_result})
        uc.reg_write(UC_X86_REG_XMM0,pow_result)
        ret()
    elif address==0x1454c0820:
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
    putq(GAME+0x4c0,256)
    putq(GAME+0x4c8,ACTORS)
    putq(GAME+0x4d0,len(statuses))
    for index,status in enumerate(statuses): putu(ACTORS+index*0x160+0x68,status)
    for offset,value in [(0x8e4,bits(clock)),(0x944,bits(difficulty)),(0x858,phase),
                         (0x85c,bits(start)),(0x904,counter)]: putu(GAME+offset,value)
    uc.mem_write(GAME+0x230,struct.pack('<HHHH',density,hp_pct,dmg_pct,speed_pct))
    uc.mem_write(GAME+0x952,bytes([endless]))
    for offset,value in zip((0x880,0x888,0x890,0x898),seed): putq(GAME+offset,value)
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
    row={"success":success,"counter_after":readu(GAME+0x904),
         "rng_after":[readq(GAME+i) for i in (0x880,0x888,0x890,0x898)],"pow_calls":events,
         "created":create,"actor_count_after":readq(GAME+0x4d0)}
    if success:
        actor=ACTORS+len(statuses)*0x160
        row.update({"guid":readq(actor+0x88),"definition_va":hex(readq(actor+0x90)),
                    "health_bits":readu(actor+0xf0),"max_health_bits":readu(actor+0xf4),
                    "damage_bits":readu(actor+0xf8),"movement_speed_bits":readu(actor+0xfc),
                    "attack_interval_bits":readu(actor+0x100),"melee_reach_bits":readu(actor+0x104),
                    "scale_bits":readu(actor+0x108),"spawn_clock_bits":readu(actor+0x124),
                    "next_movement_at_bits":readu(actor+0x12c),"initial_attack_delay_bits":readu(actor+0x130),
                    "facing_bits":readu(actor+0x154),"flag_4c":uc.mem_read(actor+0x158,1)[0]})
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
    zone=0x146716438+zone_index*0xf0
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
result={"version":"0.97.2","target_sha256":EXPECTED,"target_executed":False,
        "instruction_emulation":True,"ranges":[[hex(a),hex(b)] for a,b in RANGES],
        "seams":["zone resolver returns chosen catalog index","Windows CRT powf has explicit injected results and captured arguments",
                 "entity creation captures arguments; position supplied; actor vector preallocated"],
        "scaling_cases":cases,"population_cases":gate_cases,"clamp_guid_cases":clamp_cases}
out=ROOT/'crates/azeroth-survivors-re/tests/fixtures/enemy-scaling-native.json'
out.write_text(json.dumps(result,indent=2)+'\n')
print(f"Retained {len(cases)} constructor cases, {len(gate_cases)} population cases, {len(clamp_cases)} clamp/GUID cases")
