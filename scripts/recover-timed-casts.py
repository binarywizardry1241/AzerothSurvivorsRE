#!/usr/bin/env python3
"""Bounded native variant26 timer scalar paths; no calls or target launch.

Executes unchanged1454b0f87..fb1 fallback arithmetic then1454b0ffb..101e
positive-override selection and minimum. Failure timer is a retained literal
store at1454b10f7. Native collector14553a530 admits tag26 key+8/interval+4.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import bits as _shared_bits
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess, sys
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b';data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
m = load_script('inventory', ROOT/'scripts/inventory-executable.py');p=m.PE(data);u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
MEM=0x200000000;STACK=0x300000000;u.mem_map(MEM,0x4000);u.mem_map(STACK,0x4000)
SPANS=[(0x1454b0f87,0x1454b0fb1),(0x1454b0ffb,0x1454b101e)]
def hook(_,a,n,x):
 if a in [b for _,b in SPANS]:u.emu_stop()
 elif not any(lo<=a<hi for lo,hi in SPANS):raise RuntimeError('Unreviewed instruction '+hex(a))
u.hook_add(UC_HOOK_CODE,hook)
def bits(v):
    return _shared_bits(v)
def setx(reg,v):u.reg_write(reg,bits(v))
cases=[]
for base in [0.,1.5,14.3]:
 for ordinary in [.2,1.,1.3]:
  for talent in [.4,1.,1.7]:
   for global_cd in [.1,1.,1.2]:
    for override in [-1.,0.,3.,14.]:
     u.mem_write(MEM+0x48,struct.pack('<f',base));u.mem_write(MEM+0x1000+0x478,struct.pack('<f',global_cd));u.mem_write(STACK+0x254,struct.pack('<f',ordinary))
     for reg,val in [(UC_X86_REG_RAX,MEM),(UC_X86_REG_RSI,MEM+0x1000),(UC_X86_REG_RBP,STACK),(UC_X86_REG_MXCSR,0x1f80)]:u.reg_write(reg,val)
     setx(UC_X86_REG_XMM0,talent);setx(UC_X86_REG_XMM8,1.4);setx(UC_X86_REG_XMM9,.25);setx(UC_X86_REG_XMM10,override)
     for lo,hi in SPANS:u.emu_start(lo,0,count=1000);assert u.reg_read(UC_X86_REG_RIP)==hi
     actual=u.reg_read(UC_X86_REG_XMM10)&0xffffffff
     cases.append(dict(base_cooldown=base,ordinary_cooldown=ordinary,talent_cooldown=talent,global_cooldown=global_cd,interval_override=override,success_interval_bits=actual))
OUT=ROOT/'runtime/analysis/staging/native-evidence/treasure-interface';OUT.mkdir(parents=True,exist_ok=True);owners=[]
for role,lo,hi in [('timed-collector',0x14553a530,0x14553a683),('timed-tick',0x1454b0e66,0x1454b1105),('timed-refresh',0x1454ca1d9,0x1454ca511)]:
 off=p.rva_offset(lo-p.image_base);owners.append(dict(role=role,start=hex(lo),end_exclusive=hex(hi),sha256=hashlib.sha256(data[off:off+hi-lo]).hexdigest()));(OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe')],text=True))
(OUT/'timed-cast-native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,failure_interval_bits=0x3e99999a,cases=cases),separators=(',',':'))+'\n');print('Recovered',len(cases),'native timed-cast intervals')
