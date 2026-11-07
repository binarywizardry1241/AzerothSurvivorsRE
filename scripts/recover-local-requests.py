#!/usr/bin/env python3
"""Retain current action publication, cache GO identity and resolved-request owners.

Unicorn runs bounded unchanged instructions; no EXE process or external call
stub executes. Ghidra raw slices retain the whole action and GO constructors.
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
m = load_script('inventory', ROOT/'scripts/inventory-executable.py');p=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
MEM=0x200000000;STACK=0x300000000;u.mem_map(MEM,0x10000);u.mem_map(STACK,0x10000)
SPANS=[(0x1454f5f4f,0x1454f5ff2),(0x1454f5ff8,0x1454f601b),
       (0x14545c463,0x14545c4e0),(0x1454da40c,0x1454da42d),(0x1454e4ad2,0x1454e4af5)]
STOPS=[0x1454f5ff2,0x1454f601b,0x14545c4e0,0x1454da42d,0x1454e4af5]
def hook(_,address,size,unused):
 if address in STOPS:u.emu_stop()
 elif not any(lo<=address<hi for lo,hi in SPANS):raise RuntimeError('Unreviewed instruction '+hex(address))
u.hook_add(UC_HOOK_CODE,hook)
def reset():
 u.mem_write(MEM,bytes(0x10000));u.mem_write(STACK,bytes(0x10000));u.reg_write(UC_X86_REG_RBP,STACK+0x7000);u.reg_write(UC_X86_REG_RSP,STACK+0x8000)
def run(start,stop):
 u.emu_start(start,0,count=100000);assert u.reg_read(UC_X86_REG_RIP)==stop
def reg(r,v):u.reg_write(r,v)
publications=[]
for count in range(13):
 reset();game=MEM;rows=MEM+0x1000;defs=MEM+0x4000;out=MEM+0x6000;racial=MEM+0x8000
 ids=[116+i*37 for i in range(count)]
 for i,spell in enumerate(ids):
  u.mem_write(rows+i*88,struct.pack('<Q',defs+i*80));u.mem_write(defs+i*80+64,struct.pack('<I',spell))
 u.mem_write(game+0x390,struct.pack('<Q',racial));u.mem_write(racial+64,struct.pack('<I',20594))
 for r,v in [(UC_X86_REG_RAX,out),(UC_X86_REG_RDI,count),(UC_X86_REG_RBX,count*16),(UC_X86_REG_R14,rows),(UC_X86_REG_RSI,game)]:reg(r,v)
 run(0x1454f5fd7 if count==0 else 0x1454f5f4f,0x1454f5ff2)
 # The vector reserve lies outside the selected instruction ranges; the
 # existing capacity/output pointer is already sufficient for one racial row.
 run(0x1454f5ff8,0x1454f601b)
 pairs=[list(struct.unpack('<QI',u.mem_read(out+i*16,12)))for i in range(count+1)]
 publications.append(dict(learned=ids,racial=20594,pairs=pairs))
tables=[]
for pairs in [[],[(0,116)],[(11,20594)],[(119,42),(120,99),(0xffffffffffffffff,77)],[(0,116),(0,133),(11,20594)]]+[list(map(tuple,row['pairs']))for row in publications]:
 reset();ptr=MEM+0x1000;bp=STACK+0x7000
 for i,(slot,spell) in enumerate(pairs):u.mem_write(ptr+i*16,struct.pack('<QII',slot,spell,0))
 for r,v in [(UC_X86_REG_RBX,len(pairs)),(UC_X86_REG_RDI,ptr),(UC_X86_REG_RBP,bp)]:reg(r,v)
 run(0x14545c463,0x14545c4e0)
 tables.append(dict(pairs=pairs,expected=list(struct.unpack('<120I',u.mem_read(bp+0x198,480)))))
reset();reg(UC_X86_REG_RDI,MEM);reg(UC_X86_REG_R15,2);run(0x1454da40c,0x1454da42d)
cache=dict(entry=struct.unpack('<I',u.mem_read(STACK+0x7000+0x5c,4))[0],model=u.reg_read(UC_X86_REG_R15)&0xffffffff,
           scale_bits=u.reg_read(UC_X86_REG_R15)>>32,object_type=u.reg_read(UC_X86_REG_R14))
guids=[]
for entry in [9005,0,0xffffffff]:
 for counter in [0,1,0xffffff,0x1000000,0xffffffff]:
  reset();reg(UC_X86_REG_RAX,counter);reg(UC_X86_REG_RBX,entry);run(0x1454e4ad2,0x1454e4af5)
  guids.append(dict(entry=entry,counter=counter,expected=u.reg_read(UC_X86_REG_R14)))
OUT=ROOT/'docs/analysis/evidence/0.100.1/local-requests';OUT.mkdir(parents=True,exist_ok=True);owners=[]
ends={p.image_base+a:p.image_base+b for a,b,_ in p.functions()}
for role,start in [('action-publication',0x1454f5f00),('action-packet',0x14545c420),('gameobject-create',0x1454e4a00),('pickup-create',0x1454da2c0)]:
 end=ends[start];at=p.rva_offset(start-p.image_base);raw=data[at:at+end-start]
 owner=dict(role=role,start=hex(start),end_exclusive=hex(end),file_offset=hex(at),sha256=hashlib.sha256(raw).hexdigest())
 (OUT/(role+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={start:#x}',f'--stop-address={end:#x}',str(exe)],text=True))
 path=ROOT/'runtime/analysis/history/native-recovery/local-requests/1a72011562a1'/('rea-'+role)/'003-procedure_pseudo_code.json'
 if path.exists():
  ev=json.loads(path.read_text())['response']['result']['structuredContent'];assert ev['subject']['digest']['sha256']==owner['sha256'];owner['rea_evidence']=ev;(OUT/(role+'.ghidra.c')).write_text(ev['normalized_result'])
 owners.append(owner)
(OUT/'native.json').write_text(portable_json(dict(target_sha256=SHA,method=__doc__,owners=owners,publications=publications,tables=tables,cache=cache,guids=guids),indent=2)+'\n')
print('Recovered',len(publications),'action publications,',len(tables),'120-slot tables, cache constants and',len(guids),'GUID vectors')
