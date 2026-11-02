#!/usr/bin/env python3
"""Bounded emulation of unchanged selected 0.97.2 spawn instruction ranges.

No original/rebuilt OS process is launched and no source is compiled. Inputs
are synthetic state; imported ceilf is explicitly supplied between two ranges.
"""
from pathlib import Path
import hashlib
import importlib.util
import json
import math
import struct
import sys
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
spec=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py')
i=importlib.util.module_from_spec(spec);spec.loader.exec_module(i);pe=i.PE(data)
uc=Uc(UC_ARCH_X86,UC_MODE_64)
size=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in pe.sections)
uc.mem_map(pe.image_base,(size+4095)&~4095)
for section in pe.sections:uc.mem_write(pe.image_base+section['rva'],data[section['raw_offset']:section['raw_offset']+section['raw_size']])
BASE=0x200000000;uc.mem_map(BASE,0x10000)
GAME=BASE;VALUES=BASE+0x2000;INDICES=BASE+0x3000;OUTPUT=BASE+0x4000;ENTITY=BASE+0x5000;BOSS=BASE+0x6000;STACK=BASE+0x8000
ranges={'weight':(0x145536b20,0x145536b62),'admission':(0x14552ef90,0x14552efac),
        'budget':(0x1454a73dd,0x1454a7574),'population':(0x1454a780d,0x1454a789b),
        'population-cap':(0x1454a78a0,0x1454a78d8),
        'uniform':(0x1454a7ec0,0x1454a7eed),
        'count-swarm':(0x1454a7f41,0x1454a7f9e),
        'count-wall':(0x1454a7fb1,0x1454a8009),
        'count-pack':(0x1454a8070,0x1454a80d1),
        'elite-interval':(0x1454a7bc3,0x1454a7be4),
        'pattern-interval':(0x1454a9298,0x1454a92b4)}
active=None;stops=set()
def hook(_,a,size,__):
 if a in stops:uc.emu_stop()
 elif not ranges[active][0]<=a<ranges[active][1]:raise RuntimeError(f'Out-of-scope native instruction {a:x}')
uc.hook_add(UC_HOOK_CODE,hook)
def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
def f32(v):return struct.unpack('<f',struct.pack('<f',v))[0]
def putu(a,v):uc.mem_write(a,struct.pack('<I',v))
def putq(a,v):uc.mem_write(a,struct.pack('<Q',v))
def getu(a):return struct.unpack('<I',uc.mem_read(a,4))[0]
def xmm(reg,v):uc.reg_write(reg,bits(v))
def run(kind,endpoints=None):
 global active,stops
 active=kind;stops=set(endpoints or [ranges[kind][1]])
 uc.reg_write(UC_X86_REG_EFLAGS,2);uc.reg_write(UC_X86_REG_MXCSR,0x1f80)
 uc.emu_start(ranges[kind][0],0,count=10000)
 end=uc.reg_read(UC_X86_REG_RIP);assert end in stops;return end
catalog=json.loads((ROOT/'docs/analysis/evidence/0.97.2/enemies/catalog.json').read_text())
assert catalog['target_sha256']==SHA
weights=[];admissions=[]
for zone in catalog['zones']:
 defs=int(zone['enemy_slice']['va'],16)
 for enemy in zone['enemies']:
  index=enemy['index'];gate=struct.unpack('<f',struct.pack('<I',enemy['words'][18]))[0]
  times=[0.0,0.5,6.0,20.0]
  if math.isfinite(gate):times+= [gate,gate+2.0,gate+8.0]
  for time in sorted(set(times)):
   putu(VALUES,bits(time));putq(INDICES,index)
   uc.reg_write(UC_X86_REG_R15,defs+index*80+80);uc.reg_write(UC_X86_REG_R12,VALUES)
   uc.reg_write(UC_X86_REG_RDI,index);uc.reg_write(UC_X86_REG_RDX,OUTPUT)
   admitted=run('admission',[0x14552ef70,0x14552ef78,0x14552efac])==0x14552efac
   expected=enemy['flag_4c']==0 and time>=gate
   assert admitted==expected
   admissions.append(dict(zone=zone['key']['text'],enemy_index=index,minutes_bits=bits(time),admitted=admitted))
   if not admitted:continue
   uc.reg_write(UC_X86_REG_R15,INDICES);uc.reg_write(UC_X86_REG_R9,0);uc.reg_write(UC_X86_REG_R14,1)
   uc.reg_write(UC_X86_REG_R10,defs);uc.reg_write(UC_X86_REG_RDX,len(zone['enemies']))
   uc.reg_write(UC_X86_REG_R8,VALUES);uc.reg_write(UC_X86_REG_RAX,OUTPUT)
   for reg,val in [(UC_X86_REG_XMM0,0),(UC_X86_REG_XMM1,.5),(UC_X86_REG_XMM2,1),(UC_X86_REG_XMM3,4)]:xmm(reg,val)
   run('weight');weight=getu(OUTPUT)
   cost=struct.unpack('<f',struct.pack('<I',enemy['words'][17]))[0]
   assert weight==bits(f32(min(f32(f32(max(f32(time-gate),0.0)*.5)+1),4)/cost))
   weights.append(dict(zone=zone['key']['text'],enemy_index=index,minutes_bits=bits(time),weight_bits=weight))
budget=[]
for clock,density,boss,endless,phase,start,credit,dt,initial in [
 (0,100,None,False,False,0,0,1,0),(120,100,None,False,False,0,0,.016,1),
 (600,200,None,False,False,0,100,1,2),(1200,50,False,False,False,0,0,1,0),
 (600,100,True,True,False,0,0,1,0),(900,150,None,True,True,600,0,1,0),
 (900,150,None,True,True,1200,10,.1,2),(0,0,None,False,False,0,1,1,0)]:
 uc.mem_write(GAME,bytes(0x1000));uc.mem_write(ENTITY,bytes(0x200));uc.mem_write(BOSS,bytes(0x100))
 putu(GAME+0x90c,bits(initial));putu(GAME+0x858,1 if phase else 0);putu(GAME+0x85c,bits(start));uc.mem_write(GAME+0x952,bytes([int(endless)]))
 factor=1.0 if boss is None else (.3 if boss else .45)
 if boss is not None:putq(ENTITY+0x18,0);putq(ENTITY+0x30,BOSS);uc.mem_write(BOSS+0x54,bytes([int(boss)]))
 uc.reg_write(UC_X86_REG_R13,GAME);uc.reg_write(UC_X86_REG_R8,density)
 uc.reg_write(UC_X86_REG_RDX,0 if boss is None else 1);uc.reg_write(UC_X86_REG_RAX,ENTITY);uc.reg_write(UC_X86_REG_RCX,ENTITY+(0 if boss is None else 0x160))
 for reg,val in [(UC_X86_REG_XMM0,credit),(UC_X86_REG_XMM1,clock),(UC_X86_REG_XMM6,dt),(UC_X86_REG_XMM9,3),(UC_X86_REG_XMM10,factor)]:xmm(reg,val)
 run('budget')
 budget.append(dict(clock_bits=bits(clock),density=density,boss=boss,endless=endless,phase_one=phase,start_bits=bits(start),credit_bits=bits(credit),delta_bits=bits(dt),initial_bits=bits(initial),budget_bits=getu(GAME+0x90c)))
population=[]
for minutes,density,bossfactor,live in [(0,100,1,0),(20,100,1,0),(100,100,1,36),(3,200,.45,0),(6,150,.3,3),(2,0,1,0),(5,400,1,99)]:
 xmm(UC_X86_REG_XMM0,f32(density/100));xmm(UC_X86_REG_XMM1,minutes);xmm(UC_X86_REG_XMM8,bossfactor);uc.reg_write(UC_X86_REG_RAX,live)
 run('population');missing=uc.reg_read(UC_X86_REG_R13)
 xmm(UC_X86_REG_XMM0,math.ceil(f32(density/100)))
 run('population-cap');cap=uc.reg_read(UC_X86_REG_RAX);planned=uc.reg_read(UC_X86_REG_R13)
 population.append(dict(minutes_bits=bits(minutes),density=density,boss_factor_bits=bits(bossfactor),live=live,missing=missing,cap=cap,planned=planned))
uniform=[]
for count in [1,2,3,4,5,11,148]:
 for state in [[1,2,3,4],[0x123456789abcdef,0xfedcba9876543210,0xabcd,0x6d23],[0xffffffffffffffff]*4]:
  for reg,value in zip([UC_X86_REG_RBX,UC_X86_REG_R15,UC_X86_REG_R13,UC_X86_REG_RDI],state):uc.reg_write(reg,value)
  uc.reg_write(UC_X86_REG_R9,count);uc.reg_write(UC_X86_REG_R8,((count<<(64-count.bit_length()))-1)&0xffffffffffffffff)
  run('uniform')
  uniform.append(dict(count=count,state=state,state_after=[uc.reg_read(reg) for reg in [UC_X86_REG_RBX,UC_X86_REG_R15,UC_X86_REG_R13,UC_X86_REG_RDI]],index=uc.reg_read(UC_X86_REG_RDX)))
formations=[]
for kind in ['count-swarm','count-wall','count-pack']:
 for minutes,density in [(0,100),(1,100),(10,50),(20,200),(5,0),(60,400)]:
  xmm(UC_X86_REG_XMM6,minutes);xmm(UC_X86_REG_XMM7,f32(f32(density/100)*f32(.6)))
  run(kind)
  count=uc.reg_read({'count-swarm':UC_X86_REG_RDX,'count-wall':UC_X86_REG_RSI,'count-pack':UC_X86_REG_RDI}[kind])
  formations.append(dict(kind=kind,minutes_bits=bits(minutes),density=density,count=count))
intervals=[]
for minutes in [0,1,4,12,20,60]:
 now=f32(minutes*60);uc.reg_write(UC_X86_REG_RBP,STACK);putu(STACK+0x68,bits(minutes));xmm(UC_X86_REG_XMM0,now)
 run('elite-interval');elite=uc.reg_read(UC_X86_REG_XMM1)&0xffffffff
 xmm(UC_X86_REG_XMM0,now);xmm(UC_X86_REG_XMM6,minutes);run('pattern-interval');pattern=uc.reg_read(UC_X86_REG_XMM6)&0xffffffff
 intervals.append(dict(minutes_bits=bits(minutes),elite_at_bits=elite,pattern_at_bits=pattern))
result=dict(version='0.97.2',target_sha256=SHA,method='Unmodified x86-64 instruction scopes in bounded Unicorn, synthetic state; ceilf import supplied explicitly between separate scopes; target/game/source never launched or compiled.',ranges={k:[hex(a),hex(b)] for k,(a,b) in ranges.items()},admission=admissions,weights=weights,budget=budget,population=population,uniform=uniform,formations=formations,intervals=intervals)
out=ROOT/'docs/analysis/evidence/0.97.2/enemies/spawning-fixtures.json';out.write_text(json.dumps(result,indent=2)+'\n')
print(f'{len(admissions)} admission, {len(weights)} weight, {len(budget)} budget, {len(population)} population, {len(uniform)} uniform, {len(formations)} formation, {len(intervals)} interval native fixtures; SHA256 {hashlib.sha256(out.read_bytes()).hexdigest()}')
