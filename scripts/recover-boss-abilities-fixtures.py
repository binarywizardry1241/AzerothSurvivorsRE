#!/usr/bin/env python3
"""Bounded unchanged boss-ability x86-64 instructions; no compilation/OS launch."""
from pathlib import Path
import hashlib, importlib.util, json, struct, sys
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *
SHA='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe').read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
spec=importlib.util.spec_from_file_location('i',ROOT/'scripts/inventory-executable.py');i=importlib.util.module_from_spec(spec);spec.loader.exec_module(i);pe=i.PE(data)
uc=Uc(UC_ARCH_X86,UC_MODE_64)
size=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in pe.sections)
uc.mem_map(pe.image_base,(size+4095)&~4095)
for s in pe.sections:uc.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
BASE=0x200000000;uc.mem_map(BASE,0x10000);GAME=BASE;STACK=BASE+0x8000
RANGES={'radius':(0x1454f0710,0x1454f0823),'missile-speed':(0x1454f08d0,0x1454f0a1a),
 'charge-duration':(0x1454cd9cc,0x1454cda07),'charge-clip':(0x1454cd81c,0x1454cd862),
 'minion-index':(0x1454ccedf,0x1454ccef4),'area-range':(0x1454ccf2a,0x1454ccf51),
 'missile-first':(0x1454ccf86,0x1454cd045),'missile-next':(0x1454cd4f7,0x1454cd62b)}
active=None;stops=set()
def hook(_,address,size,__):
 if address in stops:uc.emu_stop()
 elif not RANGES[active][0]<=address<RANGES[active][1]:raise RuntimeError(f'Out-of-scope native instruction {address:x}')
uc.hook_add(UC_HOOK_CODE,hook)
def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
def f32(v):return struct.unpack('<f',struct.pack('<f',v))[0]
def asfloat(v):return struct.unpack('<f',struct.pack('<I',v))[0]
def xmm(reg,v):uc.reg_write(reg,bits(v))
def xy(reg,p):uc.reg_write(reg,bits(p[0])|(bits(p[1])<<32))
def putu(address,value):uc.mem_write(address,struct.pack('<I',value))
def putq(address,value):uc.mem_write(address,struct.pack('<Q',value))
def run(kind,endpoints=None):
 global active,stops
 active=kind;stops=set(endpoints or [RANGES[kind][1]])
 uc.reg_write(UC_X86_REG_EFLAGS,2);uc.reg_write(UC_X86_REG_MXCSR,0x1f80)
 uc.emu_start(RANGES[kind][0],0,count=10000)
 end=uc.reg_read(UC_X86_REG_RIP);assert end in stops;return end
manifest=json.loads((ROOT/'docs/analysis/evidence/0.97.2/bosses/abilities-manifest.json').read_text());assert manifest['target_sha256']==SHA
ids={0,1,0xffffffff,10,75,116,120,122,133,403,686,779,1160,1449,1510,1680,1949,1978,2120,2643,2812,3044,3606,5116,5176,5740,6343,6353,6789,6917,7269,8122,10181,11113,11366,13810,15237,16914,19434,20549,24275,26573}
ids.update(a['raw_words'][1] for a in manifest['boss_ability_records'] if a['raw_words'][0] in (0,1,3,4))
lookups=[]
for spell in sorted(ids):
 uc.reg_write(UC_X86_REG_ECX,spell);xmm(UC_X86_REG_XMM0,-999)
 run('radius',[0x1454f07f6,0x1454f0814,0x1454f0822]);radius=(uc.reg_read(UC_X86_REG_XMM0)&0xffffffff) if uc.reg_read(UC_X86_REG_EAX)&1 else None
 uc.reg_write(UC_X86_REG_ECX,spell)
 run('missile-speed',[0x1454f099f,0x1454f09c0,0x1454f09e5,0x1454f09fe,0x1454f0a07,0x1454f0a10,0x1454f0a19])
 lookups.append(dict(spell_id=spell,radius_bits=radius,missile_speed_bits=uc.reg_read(UC_X86_REG_XMM0)&0xffffffff))
durations=[]
for start,end in [((0,0),(0,0)),((0,0),(24,0)),((0,0),(26.4,0)),((0,0),(48,0)),((-13,5),(100,-41)),((4,4),(4,100))]:
 xy(UC_X86_REG_XMM6,start);xmm(UC_X86_REG_XMM9,start[1]);xmm(UC_X86_REG_XMM2,end[0]);xmm(UC_X86_REG_XMM10,end[1])
 run('charge-duration');durations.append(dict(start_bits=[bits(v) for v in start],end_bits=[bits(v) for v in end],duration_bits=uc.reg_read(UC_X86_REG_XMM10)&0xffffffff))
clips=[]
for start,end,fraction in [((0,0),(10,0),0),((0,0),(10,0),.5),((3,5),(13,5),.01),((0,0),(0,0),.5),((2,-3),(-7,9),.999)]:
 xy(UC_X86_REG_XMM6,start);xy(UC_X86_REG_XMM14,end);xmm(UC_X86_REG_XMM0,fraction)
 run('charge-clip');value=uc.reg_read(UC_X86_REG_XMM1)
 clips.append(dict(start_bits=[bits(v) for v in start],end_bits=[bits(v) for v in end],fraction_bits=bits(fraction),clipped_bits=[value&0xffffffff,(value>>32)&0xffffffff]))
indices=[]
for index in range(60):
 uc.reg_write(UC_X86_REG_EBX,index);run('minion-index');actual=uc.reg_read(UC_X86_REG_EDX);assert actual==int(index%3==2)
 indices.append(dict(index=index,enemy_index=actual))
range_checks=[]
for radius in [0.0,4.5,8.0,9.0,10.0,11.5,13.0,18.0]:
 for delta in [-.001,0,.001]:
  player=[radius+delta,0];xy(UC_X86_REG_XMM6,[0,0]);xy(UC_X86_REG_XMM1,player);uc.reg_write(UC_X86_REG_R14,bits(radius))
  end=run('area-range',[0x1454ccf51,0x1454cd09d]);range_checks.append(dict(radius_bits=bits(radius),player_bits=[bits(v) for v in player],hit=end==0x1454cd09d))
missiles=[]
for state in [[1,2,3,4],[0xffffffffffffffff]*4,[0x123456789abcdef,0xfedcba9876543210,0xabcd,0x6d23]]:
 for index,count in [(0,1),(0,7),(1,7),(6,7)]:
  for j,value in enumerate(state):putq(GAME+0x880+8*j,value)
  uc.reg_write(UC_X86_REG_RSI,GAME);uc.reg_write(UC_X86_REG_RBP,STACK);putq(STACK+0x2a0,GAME);putu(STACK+0x168,bits(count))
  xmm(UC_X86_REG_XMM12,1);xmm(UC_X86_REG_XMM15,-1);xmm(UC_X86_REG_XMM13,6);xmm(UC_X86_REG_XMM7,100);uc.reg_write(UC_X86_REG_R14,count);uc.reg_write(UC_X86_REG_RBX,index)
  if index==0:
   run('missile-first');radius=bits(0);angle=uc.reg_read(UC_X86_REG_XMM10)&0xffffffff
  else:
   uc.reg_write(UC_X86_REG_R9,GAME);run('missile-next');radius=uc.reg_read(UC_X86_REG_XMM11)&0xffffffff;angle=uc.reg_read(UC_X86_REG_XMM9)&0xffffffff
  missiles.append(dict(state=state,index=index,count=count,angle_bits=angle,radius_bits=radius,state_after=list(struct.unpack('<QQQQ',uc.mem_read(GAME+0x880,32)))))
result=dict(version='0.97.2',target_sha256=SHA,method='Unmodified bounded x86-64 instruction intervals with synthetic state; no external instructions/calls permitted; no original/rebuilt OS process or compilation.',ranges={k:[hex(a),hex(b)] for k,(a,b) in RANGES.items()},lookups=lookups,charge_duration=durations,charge_clip=clips,minion_indices=indices,area_range=range_checks,missile_draws=missiles)
path=ROOT/'docs/analysis/evidence/0.97.2/bosses/abilities-fixtures.json';path.write_text(json.dumps(result,indent=2)+'\n')
print(f'{len(lookups)} lookup, {len(durations)} duration, {len(clips)} clip, {len(indices)} minion, {len(range_checks)} range, {len(missiles)} missile native fixtures; SHA256 {hashlib.sha256(path.read_bytes()).hexdigest()}')
