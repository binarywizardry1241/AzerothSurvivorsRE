#!/usr/bin/env python3
"""Retain current cache coinage, sound and feedback channels.

The gold multiply, sound packet stores and empty notification serializer run
as bounded unchanged PE instructions. No external call is admitted. Existing
notification dispatch evidence binds JSON toast to the gold kind0 banner.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess, sys
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
exe=ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe';data=exe.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
m = load_script('pe', ROOT/'scripts/inventory-executable.py');p=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for s in p.sections:u.mem_write(p.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
MEM,STACK=0x200000000,0x300000000;u.mem_map(MEM,0x10000);u.mem_map(STACK,0x10000)
SPANS=[(0x1454e56e1,0x1454e56e8),(0x1454d2831,0x1454d2888),(0x14545bf21,0x14545bf9e)]
STOPS=[hi for _,hi in SPANS]
def hook(_,pc,size,unused):
 if pc in STOPS:u.emu_stop()
 elif not any(lo<=pc<hi for lo,hi in SPANS):raise RuntimeError('Unreviewed instruction '+hex(pc))
u.hook_add(UC_HOOK_CODE,hook)
def reset():
 u.mem_write(MEM,bytes(0x10000));u.mem_write(STACK,bytes(0x10000));u.reg_write(UC_X86_REG_RBP,STACK+0x7000);u.reg_write(UC_X86_REG_RSP,STACK+0x8000)
def run(lo,hi):
 u.emu_start(lo,0,count=10000);assert u.reg_read(UC_X86_REG_RIP)==hi
coinage=[]
for value in [0,1,20,31,100,429496,429497,0xfffffffe,0xffffffff]:
 reset();u.reg_write(UC_X86_REG_RAX,value);run(*SPANS[0]);coinage.append(dict(gold=value,copper=u.reg_read(UC_X86_REG_R8)&0xffffffff))
reset();game=MEM;queue=MEM+0x2000;body=MEM+0x3000;u.mem_write(game+0x550,struct.pack('<QQQ',1,queue,0));u.mem_write(STACK+0x7000-0x10,struct.pack('<Q',body));u.reg_write(UC_X86_REG_RDI,game);u.reg_write(UC_X86_REG_RAX,body);run(*SPANS[1]);sound=dict(opcode=struct.unpack('<H',u.mem_read(queue+24,2))[0],length=struct.unpack('<Q',u.mem_read(queue+16,8))[0],sound_id=struct.unpack('<I',u.mem_read(body,4))[0]);assert sound==dict(opcode=0x2d2,length=4,sound_id=1204)
reset();u.reg_write(UC_X86_REG_RAX,MEM+0x2000);u.reg_write(UC_X86_REG_RSI,MEM+0x1000);u.reg_write(UC_X86_REG_RDI,0);run(*SPANS[2]);notification=dict(opcode=struct.unpack('<H',u.mem_read(MEM+0x1018,2))[0],length=struct.unpack('<Q',u.mem_read(MEM+0x1010,8))[0],body=bytes(u.mem_read(MEM+0x2000,1)).hex());assert notification==dict(opcode=0x1cb,length=1,body='00')
OUT=ROOT/'docs/analysis/evidence/0.100.1/cache-feedback';OUT.mkdir(parents=True,exist_ok=True);ends={p.image_base+a:p.image_base+b for a,b,_ in p.functions()};owners=[]
roles=[('purchase',0x1454e5660,0x1454e59ff),('click',0x1454d2760,0x1454d28d7),('walk-hint',0x1454b77b0,0x1454b782e),('toast-producer',0x1454e4340,ends[0x1454e4340]),('notification-packet',0x14545bee0,ends[0x14545bee0])]
for role,lo,hi in roles:
 at=p.rva_offset(lo-p.image_base);raw=data[at:at+hi-lo];owner=dict(role=role,start=hex(lo),end_exclusive=hex(hi),sha256=hashlib.sha256(raw).hexdigest());(OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(exe)],text=True))
 path=ROOT/'runtime/analysis/history/native-recovery/cache-feedback/f0b4c387be8d'/('rea-'+role)/'003-procedure_pseudo_code.json'
 if path.exists():
  ev=json.loads(path.read_text())['response']['result']['structuredContent'];assert ev['subject']['digest']['sha256']==owner['sha256'];owner['rea']=ev;(OUT/(role+'.ghidra.c')).write_text('\n'.join(s.rstrip() for s in ev['normalized_result'].splitlines()).strip()+'\n')
 owners.append(owner)
(OUT/'native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,coinage=coinage,sound=sound,empty_notification=notification),indent=2)+'\n')
print('Recovered9 coinage vectors, native purchase sound and empty notification packet')
