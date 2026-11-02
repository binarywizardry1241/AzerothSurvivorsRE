#!/usr/bin/env python3
"""Recover current native Amulet records with bounded constructor execution.

Only 0x145425af0..0x145427043 runs as original code. Vec reserve, locale
miss, Rust string formatting and allocation/deallocation are reviewed
boundaries; unknown calls fail closed. No process, OS or network calls run.
"""
from script_sources import load_script
from native_recovery import effects as decode_effects
from pathlib import Path
import sys, struct, json, hashlib, math
R=Path(__file__).resolve().parents[1];sys.path.insert(0,str(R/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
m = load_script('inventory', R/'scripts/inventory-executable.py')
d=(R/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes();SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b';assert hashlib.sha256(d).hexdigest()==SHA;p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000
u.mem_map(HEAP,0x1000000);u.mem_map(STACK,0x200000);u.mem_map(STOP,4096);next_heap=HEAP+0x1000
calls={}
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def wq(a,value):u.mem_write(a,struct.pack('<Q',value))
def text(a,n):return bytes(u.mem_read(a,n)).decode()
def pair(a):return text(q(a),q(a+8))
def alloc(n):
 global next_heap
 at=next_heap;next_heap+=(n+15)&~15;u.mem_write(at,bytes(n));return at
def outstr(dest,value):
 raw=value.encode();at=alloc(len(raw)+1);u.mem_write(at,raw);u.mem_write(dest,struct.pack('<QQQ',len(raw),at,len(raw)))
def hook(_,a,size,unused):
 if 0x145425af0<=a<0x145427043:return
 calls[a]=calls.get(a,0)+1;rcx=u.reg_read(UC_X86_REG_RCX);rdx=u.reg_read(UC_X86_REG_RDX);r8=u.reg_read(UC_X86_REG_R8)
 if a==0x145780420:
  if q(rcx)==0:wq(rcx+8,alloc(256*64))
  wq(rcx,256)
 elif a==0x145457cb0:u.reg_write(UC_X86_REG_RAX,0)
 elif a in [0x140002200,0x1400021d0]:pass
 elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(rcx))
 elif a==0x1457731e7:u.reg_write(UC_X86_REG_RAX,int(u.mem_read(rcx,r8)!=u.mem_read(rdx,r8)))
 elif a==0x145728390:
  ptr=rdx;argi=0;value=''
  while True:
   op=u.mem_read(ptr,1)[0];ptr+=1
   if op==0:break
   if op<0x80:value+=text(ptr,op);ptr+=op;continue
   assert op==0xc0,hex(op)
   at,formatter=q(r8+argi*16),q(r8+argi*16+8);argi+=1
   assert formatter==0x1400020c0,hex(formatter)
   value+=pair(at)
  outstr(rcx,value)
 else:raise RuntimeError('Unreviewed native call '+hex(a))
 sp=u.reg_read(UC_X86_REG_RSP);u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,q(sp))
u.hook_add(UC_HOOK_CODE,hook)
def effects(ptr, count):
    return decode_effects(ptr, count, u.mem_read, text, p.image_base, end)
# Current target's table layout is confirmed by constructor+0x75, key fields,
# the 112 records and the same unique key/spell/kind descriptors used as leads.
source=[]
for index in range(112):
 address=0x146736b48+index*120
 source.append({'key':pair(address),'record':{'virtual_address':hex(address)}})
generated=[]
for definition in source:
 next_heap=HEAP+0x1000;out=HEAP;u.mem_write(out,bytes(112));address=int(definition['record']['virtual_address'],16)
 sp=STACK+0x1f0008;wq(sp,STOP)
 for r,v in [(UC_X86_REG_RSP,sp),(UC_X86_REG_RCX,out),(UC_X86_REG_RDX,address)]:u.reg_write(r,v)
 try:u.emu_start(0x145425af0,STOP,count=100000)
 except Exception as error:raise RuntimeError(definition['key']+' pc'+hex(u.reg_read(UC_X86_REG_RIP))+': '+str(error))from error
 assert u.reg_read(UC_X86_REG_RIP)==STOP
 generated.append({'ability_key':definition['key'],'key':pair(out+8),'name':pair(out+32),'icon':pair(out+72),'rarity':q(out+96),'effects':effects(q(out+56),q(out+64))})
shared=[]
for i in range(17):
 at=0x14673c6e0+i*80
 shared.append({'key':pair(at),'name':pair(at+16),'icon':pair(at+32),'rarity':q(at+64),'effects':effects(q(at+48),q(at+56)),'record_address':hex(at)})
assert len(generated)==112 and len(shared)==17
payload={'target_sha256':SHA,'legendary_owner':'0x145425af0','shared_table':'0x14673c6e0','shared_stride':80,'generated':generated,'shared':shared,'limitations':['Emulated constructors are not original application runtime observations.','Effect tags/raw payloads are retained; complete effect semantics belong to their owning consumers.','Raw pointer words are forensic data only; decoded strings are retained as owned source data.']}
asset=R/'crates/azeroth-survivors-re/assets/native-amulets-0.100.1.json';asset.write_text(json.dumps(payload,indent=2,ensure_ascii=False)+'\n')
evidence=R/'docs/analysis/evidence/0.100.1/treasure-0.100.1-generation';evidence.mkdir(parents=True,exist_ok=True)
def span(address,size):
 offset=p.rva_offset(address-p.image_base);raw=d[offset:offset+size]
 return {'va':hex(address),'file_offset':hex(offset),'byte_count':size,'sha256':hashlib.sha256(raw).hexdigest()}
(evidence/'amulet-construction.json').write_text(json.dumps({'constructor_span':span(0x145425af0,0x145427043-0x145425af0),'ability_table':span(0x146736b48,112*120),'shared_table':span(0x14673c6e0,17*80),'target_sha256':SHA,'source_asset':str(asset.relative_to(R)),'source_sha256':hashlib.sha256(asset.read_bytes()).hexdigest(),'method':__doc__,'generated_count':len(generated),'shared_count':len(shared),'calls':{hex(k):v for k,v in calls.items()}},indent=2)+'\n')
print('Recovered',len(generated),'generated native amulets and',len(shared),'shared definitions; no runtime effect parity claimed')
