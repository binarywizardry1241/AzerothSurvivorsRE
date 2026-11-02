#!/usr/bin/env python3
"""Bounded current8 shared RNG,11 timestamp admission/explosion power. No calls.

Condition/selector and victim-snapshot ownership are retained as original ASM;
these vectors execute unchanged scalar/state fragments, rejecting other code.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import bits as _shared_bits
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
SPANS=[(0x1454cc5b0,0x1454cc630),(0x1454cc8de,0x1454cc992),(0x1454ccce5,0x1454ccd8a),(0x1454ce981,0x1454ce9a7),(0x1454ceb91,0x1454ceba8)]
STOPS=[0x1454ce02d,0x1454cc630,0x1454ce9a7,0x1454cbc6b,0x1454ceba8]
def hook(_,a,n,x):
 if a in STOPS:u.emu_stop()
 elif not any(lo<=a<hi for lo,hi in SPANS):raise RuntimeError('Unreviewed instruction '+hex(a))
u.hook_add(UC_HOOK_CODE,hook)
def bits(v):
    return _shared_bits(v)
def reset():
 u.mem_write(MEM,bytes(0x10000));u.mem_write(STACK,bytes(0x10000))
 for reg,v in [(UC_X86_REG_R12,MEM),(UC_X86_REG_RBP,STACK),(UC_X86_REG_RSP,STACK+0x8000),(UC_X86_REG_MXCSR,0x1f80)]:u.reg_write(reg,v)
status=[]
seeds=[[0,0,0,0],[1,2,3,4],[0x123456789abcdef,0x3141592653589793,0xabcdef0123456789,0x7fffffffffffffff],[0xffffffffffffffff]*4]
for seed in seeds:
 for chance in [0.,.1,.25,.5,1.,1.2]:
  reset();u.mem_write(MEM+0x8a0,struct.pack('<4Q',*seed));u.reg_write(UC_X86_REG_RBX,bits(chance));u.reg_write(UC_X86_REG_XMM14,bits(2**-24));u.emu_start(0x1454cc5b0,0,count=1000);pc=u.reg_read(UC_X86_REG_RIP);assert pc in STOPS
  status.append(dict(seed=seed,chance=chance,accepted=pc==0x1454ce02d,next_seed=list(struct.unpack('<4Q',u.mem_read(MEM+0x8a0,32)))))
rates=[]
for initial in [[],[9.],[9.0001],[9.5],[10.],[11.],[8.,9.,9.5,10.],[10.,9.,8.,9.5]]:
 for maximum in [0,1,2,3]:
  reset();u.mem_write(MEM+0xa0,struct.pack('<QQ',MEM+0x1000,1));u.mem_write(MEM+0x1000,struct.pack('<QQQ',64,MEM+0x2000,len(initial)));u.mem_write(MEM+0x2000,struct.pack('<'+'f'*len(initial),*initial));u.mem_write(STACK+0xc8,struct.pack('<Q',maximum));u.mem_write(STACK+0x1d8,struct.pack('<Q',MEM));u.mem_write(STACK+0x208,struct.pack('<Q',0));u.mem_write(STACK+0x1f0,struct.pack('<Q',0));u.reg_write(UC_X86_REG_XMM11,bits(10.));u.reg_write(UC_X86_REG_XMM15,bits(1.))
  u.emu_start(0x1454cc8de,0,count=10000);pc=u.reg_read(UC_X86_REG_RIP);assert pc in STOPS;count=struct.unpack('<Q',u.mem_read(MEM+0x1010,8))[0]
  rates.append(dict(initial=initial,maximum=maximum,now=10.,accepted=pc==0x1454ce9a7,expected=list(struct.unpack('<'+'f'*count,u.mem_read(MEM+0x2000,4*count)))))
powers=[]
for amount in [0.,1.,100.,123.5]:
 for fraction in [.15,.2,.3,.5]:
  reset();u.mem_write(STACK+0x10,struct.pack('<f',fraction));u.mem_write(STACK+0xf0,struct.pack('<Q',MEM+0x3000));u.mem_write(MEM+0x3018,struct.pack('<f',amount));u.emu_start(0x1454ceb91,0,count=1000);assert u.reg_read(UC_X86_REG_RIP)==0x1454ceba8
  powers.append(dict(maximum_health=amount,fraction=fraction,power_bits=u.reg_read(UC_X86_REG_XMM9)&0xffffffff))
OUT=ROOT/'docs/analysis/evidence/0.100.1/treasure-interface';owners=[]
for role,lo,hi in [('status-proc',0x1454cc572,0x1454cc630),('status-actions',0x1454ce02d,0x1454ce0b4),('death-explosion-admission',0x1454cbe8f,0x1454cc992),('death-explosion-actions',0x1454ce981,0x1454cea84),('death-explosion-power',0x1454ceaf7,0x1454cec28)]:
 off=p.rva_offset(lo-p.image_base);owners.append(dict(role=role,start=hex(lo),end_exclusive=hex(hi),sha256=hashlib.sha256(data[off:off+hi-lo]).hexdigest()));(OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe')],text=True))
(OUT/'status-explosion-native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,status=status,rates=rates,death_powers=powers),indent=2)+'\n');print('Recovered',len(status),'status RNG,',len(rates),'timestamp,',len(powers),'death-power native vectors')
