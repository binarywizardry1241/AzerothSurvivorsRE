#!/usr/bin/env python3
"""Bounded current variant15 temporary-stat update, no calls or substitutes."""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess, sys
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b';data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
m = load_script('inventory', ROOT/'scripts/inventory-executable.py');p=m.PE(data);u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
MEM=0x200000000;STACK=0x300000000;u.mem_map(MEM,0x10000);u.mem_map(STACK,0x10000)
SPANS=[(0x1454cddcf,0x1454cde24),(0x1454cde9f,0x1454cdee7),(0x1454ce754,0x1454ce788)];STOPS=[0x1454cdee7,0x1454ce788,0x1454cd9c7]
SPANS.append((0x1454cd9b3,0x1454cd9c7))
def hook(_,a,n,x):
 if a in STOPS:u.emu_stop()
 elif not any(lo<=a<hi for lo,hi in SPANS):raise RuntimeError('Unreviewed instruction '+hex(a))
u.hook_add(UC_HOOK_CODE,hook)
cases=[]
for initial_kind in ['none','other','same']:
 for stacks in [0,1,2,0xffffffff]:
  for old_expiry in [9.,10.,11.]:
   for duration in [0.,10.,12.]:
    for cap in [0,1,3]:
     u.mem_write(MEM,bytes(0x10000));u.mem_write(STACK,bytes(0x10000));initial=[]if initial_kind=='none'else[dict(effect_index=4 if initial_kind=='same'else 2,stacks=stacks,expires=old_expiry)]
     u.mem_write(MEM+0x50,struct.pack('<QQQ',8,MEM+0x1000,len(initial)))
     for i,entry in enumerate(initial):u.mem_write(MEM+0x1000+i*16,struct.pack('<QIf',entry['effect_index'],entry['stacks'],entry['expires']))
     u.mem_write(STACK+0x208,struct.pack('<Q',4));u.mem_write(STACK+0x200,struct.pack('<Q',cap));u.mem_write(STACK+0x40,struct.pack('<Q',MEM+0x50))
     for reg,val in [(UC_X86_REG_R12,MEM),(UC_X86_REG_RBP,STACK),(UC_X86_REG_R13,struct.unpack('<I',struct.pack('<f',duration))[0]),(UC_X86_REG_RSP,STACK+0x8000),(UC_X86_REG_XMM11,struct.unpack('<I',struct.pack('<f',10.))[0])]:u.reg_write(reg,val)
     u.emu_start(SPANS[0][0],0,count=1000);assert u.reg_read(UC_X86_REG_RIP)in STOPS
     count=struct.unpack('<Q',u.mem_read(MEM+0x60,8))[0];out=[]
     for i in range(count):
      index,n,expires=struct.unpack('<QIf',u.mem_read(MEM+0x1000+i*16,16));out.append(dict(effect_index=index,stacks=n,expires=expires))
     cases.append(dict(initial=initial,effect_index=4,now=10.,duration=duration,maximum_stacks=cap,expected=out))
bursts=[]
for event_amount in [0.,1.,100.,123.5]:
 for fraction in [.05,.5,1.2]:
  for damage in [.5,1.,1.7]:
   bits=lambda v:struct.unpack('<I',struct.pack('<f',v))[0]
   u.mem_write(MEM+0x474,struct.pack('<f',damage));u.reg_write(UC_X86_REG_R12,MEM);u.reg_write(UC_X86_REG_RBX,bits(event_amount));u.reg_write(UC_X86_REG_XMM6,bits(fraction));u.emu_start(0x1454cd9b3,0,count=1000);assert u.reg_read(UC_X86_REG_RIP)==0x1454cd9c7
   bursts.append(dict(event_amount=event_amount,fraction=fraction,damage_multiplier=damage,power_bits=u.reg_read(UC_X86_REG_XMM9)&0xffffffff))
OUT=ROOT/'docs/analysis/evidence/0.100.1/treasure-interface';owners=[]
for role,lo,hi in [('temporary-stat-update',0x1454cddcf,0x1454cde24),('temporary-stat-create',0x1454cde9f,0x1454cdee7),('temporary-stat-refresh',0x1454ce754,0x1454ce788),('temporary-stat-consumer',0x1454a6bbe,0x1454a6c63),('shield-burst',0x1454cd8a7,0x1454cda42)]:
 off=p.rva_offset(lo-p.image_base);owners.append(dict(role=role,start=hex(lo),end_exclusive=hex(hi),sha256=hashlib.sha256(data[off:off+hi-lo]).hexdigest()));(OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe')],text=True))
(OUT/'temporary-stat-native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,cases=cases,shield_burst=bursts),separators=(',',':'))+'\n');print('Recovered',len(cases),'native temporary-stat updates')
