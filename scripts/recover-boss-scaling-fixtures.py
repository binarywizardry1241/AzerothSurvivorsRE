#!/usr/bin/env python3
"""Bounded native boss-creation instruction oracle, without a game launch.

Position selection is bypassed, zone lookup/powf/entity creation/allocation and
memcpy are explicit seams. The unchanged constructor computes all stats, creates
the original ability vector and packs/copies its entire actor record.
"""
from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import sys
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
EXPECTED='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe').read_bytes()
assert hashlib.sha256(data).hexdigest()==EXPECTED
spec=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py')
inventory=importlib.util.module_from_spec(spec);spec.loader.exec_module(inventory);pe=inventory.PE(data)
uc=Uc(UC_ARCH_X86,UC_MODE_64)
size=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in pe.sections)
uc.mem_map(pe.image_base,(size+4095)&~4095)
for s in pe.sections:uc.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
GAME,ACTORS,ALLOC,STACK=0x200000000,0x200004000,0x200008000,0x300000000
uc.mem_map(GAME,0x10000);uc.mem_map(STACK,0x20000)
FRAME=STACK+0x10000
ZONE_TABLE=0x146716438
START,STOP=0x1454bf2cc,0x1454bf8b7
zone_index,powers,events,create=0,[],[],[]
def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
def putu(a,v):uc.mem_write(a,struct.pack('<I',v))
def putq(a,v):uc.mem_write(a,struct.pack('<Q',v))
def readu(a):return struct.unpack('<I',uc.mem_read(a,4))[0]
def readq(a):return struct.unpack('<Q',uc.mem_read(a,8))[0]
def ret():
 sp=uc.reg_read(UC_X86_REG_RSP);uc.reg_write(UC_X86_REG_RSP,sp+8);uc.reg_write(UC_X86_REG_RIP,readq(sp))
def hook(_,a,size,__):
 if a==STOP:uc.emu_stop()
 elif START<=a<STOP:return
 elif a==0x14540e820:uc.reg_write(UC_X86_REG_RAX,zone_index);ret()
 elif a==0x145756e73:
  power=powers[len(events)]
  events.append({'base_bits':uc.reg_read(UC_X86_REG_XMM0)&0xffffffff,'exponent_bits':uc.reg_read(UC_X86_REG_XMM1)&0xffffffff,'result_bits':bits(power)})
  uc.reg_write(UC_X86_REG_XMM0,bits(power));ret()
 elif a==0x1454c0820:
  sp=uc.reg_read(UC_X86_REG_RSP);pos=readq(sp+0x40)
  create.append({'guid':uc.reg_read(UC_X86_REG_RDX),'entry':uc.reg_read(UC_X86_REG_R8)&0xffffffff,'model_id':uc.reg_read(UC_X86_REG_R9)&0xffffffff,
   'scale_bits':readu(sp+0x28),'health_bits':readu(sp+0x30),'flag':uc.mem_read(sp+0x38,1)[0],'position_bits':[readu(pos+i*4)for i in range(3)]});ret()
 elif a==0x140002200:ret()
 elif a==0x1400021c0:uc.reg_write(UC_X86_REG_RAX,ALLOC);ret()
 elif a==0x145756ddd:
  dest,src,n=uc.reg_read(UC_X86_REG_RCX),uc.reg_read(UC_X86_REG_RDX),uc.reg_read(UC_X86_REG_R8)
  uc.mem_write(dest,bytes(uc.mem_read(src,n)));uc.reg_write(UC_X86_REG_RAX,dest);ret()
 else:raise RuntimeError(f'Unscoped native instruction {a:x}')
uc.hook_add(UC_HOOK_CODE,hook)
REGS=[UC_X86_REG_RAX,UC_X86_REG_RBX,UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_RSI,UC_X86_REG_RDI,UC_X86_REG_RBP,UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_R10,UC_X86_REG_R11,UC_X86_REG_R12,UC_X86_REG_R13,UC_X86_REG_R14,UC_X86_REG_R15]
INPUTS=[('start',0.,1.,100,100,100,0,False,0.,1.,1.),('scheduled',600.,1.5,175,80,140,0,False,0.,1.,1.),
 ('zero',600.,1.,0,0,0,0,False,0.,1.,1.),('max_percent',1200.,.75,65535,65535,65535,0,False,0.,1.,1.),
 ('endless_fractional',817.5,2.25,140,120,75,1,True,720.,2.,1.375),('future_start',600.,1.,100,100,100,1,True,720.,1.,1.),
 ('wrong_phase',817.5,1.,100,100,100,0,True,720.,1.,1.),('counter_wrap',1000.,1.,100,100,100,1,False,720.,1.,1.)]
cases=[]
for zone_index in range(12):
 zone=ZONE_TABLE+zone_index*0xf0;bosses=readq(zone+0x88)
 for boss_index in range(5):
  definition=bosses+boss_index*0x58
  for label,clock,diff,hp,dmg,speed,phase,endless,start,p1,p2 in INPUTS:
   uc.mem_write(GAME,bytes(0x10000));uc.mem_write(STACK,bytes(0x20000))
   for reg in REGS:uc.reg_write(reg,0)
   for reg in range(UC_X86_REG_XMM0,UC_X86_REG_XMM15+1):uc.reg_write(reg,0)
   uc.reg_write(UC_X86_REG_MXCSR,0x1f80);uc.reg_write(UC_X86_REG_EFLAGS,2)
   counter=0xffffffff if label=='counter_wrap' else 0
   for offset,value in [(0x8e4,bits(clock)),(0x944,bits(diff)),(0x858,phase),(0x85c,bits(start)),(0x904,counter)]:putu(GAME+offset,value)
   uc.mem_write(GAME+0x232,struct.pack('<HHH',hp,dmg,speed));uc.mem_write(GAME+0x952,bytes([endless]))
   putq(GAME+0x4c0,16);putq(GAME+0x4c8,ACTORS);putq(GAME+0x4d0,0)
   uc.mem_write(FRAME+0x150,struct.pack('<fff',123.,456.,17.))
   uc.reg_write(UC_X86_REG_RSI,GAME);uc.reg_write(UC_X86_REG_R13,definition);uc.reg_write(UC_X86_REG_RDI,ZONE_TABLE)
   uc.reg_write(UC_X86_REG_RBP,FRAME);uc.reg_write(UC_X86_REG_RSP,FRAME-0x80)
   powers,events,create=[p1,p2],[],[]
   uc.emu_start(START,0,count=10000);assert uc.reg_read(UC_X86_REG_RIP)==STOP
   timers=readq(ACTORS+0x20);n=readq(ACTORS+0x28)
   cases.append({'label':label,'zone_index':zone_index,'boss_index':boss_index,'clock_bits':bits(clock),'difficulty_bits':bits(diff),
    'zone_scale_bits':readu(zone+0xe0),'hp_percent':hp,'damage_percent':dmg,'speed_percent':speed,'phase':phase,'endless':endless,'endless_start_bits':bits(start),
    'pow_calls':events,'counter_before':counter,'counter_after':readu(GAME+0x904),'guid':readq(ACTORS+0x88),'created':create,
    'health_bits':readu(ACTORS+0xf0),'max_health_bits':readu(ACTORS+0xf4),'damage_bits':readu(ACTORS+0xf8),'movement_speed_bits':readu(ACTORS+0xfc),
    'attack_interval_bits':readu(ACTORS+0x100),'melee_reach_bits':readu(ACTORS+0x104),'scale_bits':readu(ACTORS+0x108),
    'next_movement_at_bits':readu(ACTORS+0x12c),'initial_attack_delay_bits':readu(ACTORS+0x130),'stun_until_bits':readu(ACTORS+0x144),
    'raw_148_clock_bits':readu(ACTORS+0x148),'movement_angle_bits':readu(ACTORS+0x154),'flag_158':uc.mem_read(ACTORS+0x158,1)[0],
    'ability_timers_bits':[readu(timers+i*4)for i in range(n)]})
result={'target_version':'0.97.2','target_sha256':EXPECTED,'target_executed':False,'instruction_emulation':True,
 'native_range':[hex(START),hex(STOP)],'seams':['Provided position bypasses placement','Chosen zone resolver return','Windows CRT powf injected results; captured arguments','Allocation and memcpy stubs; entity call captured; actor vector preallocated'],
 'creation_cases':cases}
out=ROOT/'crates/azeroth-survivors-re/tests/fixtures/boss-scaling-native.json';out.write_text(json.dumps(result,indent=2)+'\n')
print(f'Retained {len(cases)} native boss creation cases')
