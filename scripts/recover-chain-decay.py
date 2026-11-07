#!/usr/bin/env python3
"""Bounded current Chain Lightning variant23 presence scan, no calls/stubs."""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess, sys
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b';data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
m = load_script('inventory', ROOT/'scripts/inventory-executable.py');p=m.PE(data);u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
MEM=0x200000000;u.mem_map(MEM,0x10000);LO,HI=0x1454fb4a9,0x1454fb4f4
def hook(_,a,n,x):
 if a==HI:u.emu_stop()
 elif not LO<=a<HI:raise RuntimeError('Unreviewed instruction '+hex(a))
u.hook_add(UC_HOOK_CODE,hook)
cases=[]
for tags in [[],[23],[0],[31],[0,31],[0,23,31],[31,23,0],[23,23],list(range(23)),list(range(32))]:
 u.mem_write(MEM,bytes(0x10000));u.mem_write(MEM+0x710,struct.pack('<QQ',MEM+0x1000,len(tags)))
 for i,tag in enumerate(tags):u.mem_write(MEM+0x1000+i*64,bytes([tag]))
 u.reg_write(UC_X86_REG_RDI,MEM);u.reg_write(UC_X86_REG_RBP,MEM+0x8000);u.emu_start(LO,0,count=1000);assert u.reg_read(UC_X86_REG_RIP)==HI
 cases.append(dict(tags=tags,decay_bits=struct.unpack('<I',u.mem_read(MEM+0x803c,4))[0]))
OUT=ROOT/'docs/analysis/evidence/treasure-interface';owners=[]
for role,lo,hi in [('chain-decay-presence',LO,HI),('chain-decay-power',0x1454fbe1c,0x1454fbe82)]:
 off=p.rva_offset(lo-p.image_base);owners.append(dict(role=role,start=hex(lo),end_exclusive=hex(hi),sha256=hashlib.sha256(data[off:off+hi-lo]).hexdigest()));(OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe')],text=True))
(OUT/'chain-decay-native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,cases=cases),indent=2)+'\n');print('Recovered',len(cases),'native chain attenuation scans')
