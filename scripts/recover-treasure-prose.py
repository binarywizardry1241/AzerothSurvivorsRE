#!/usr/bin/env python3
"""Bounded original treasure prose recovery; reviewed text/allocation/math imports.

This does not launch the reference application or allow operating-system calls.
Unknown calls fail closed. Extracted numeric-template fixtures are textual data.
"""
from pathlib import Path
import hashlib,importlib.util,json,math,struct,sys
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
s=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m)
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b';data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes();assert hashlib.sha256(data).hexdigest()==SHA;pe=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections);u.mem_map(pe.image_base,(end+4095)&~4095)
for sec in pe.sections:u.mem_write(pe.image_base+sec['rva'],data[sec['raw_offset']:sec['raw_offset']+sec['raw_size']])
HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000;u.mem_map(HEAP,0x2000000);u.mem_map(STACK,0x200000);u.mem_map(STOP,4096);next_heap=HEAP+0x1000
ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
# Scalar leaf has no unwind/.pdata row; the final ret is followed by INT3
# padding and the independent next owner at145484c10.
ends[0x1454848a0]=0x145484c07
ADMITTED=[0x145424a90,0x145425910,0x145544de0,0x14554e050,0x1455526c0,0x14542af40,0x14542be00,0x14542bff0,0x14542ab60,0x14542a4a0,0x1454848a0]
allowed=[(a,ends[a])for a in ADMITTED];calls={};pieces=[];numbers=[]
def reg(r):return u.reg_read(r)
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
def st(a,n):return bytes(u.mem_read(a,n)).decode()
def pair(a):return st(q(a),q(a+8))
def alloc(n):
 global next_heap
 n=max(n,1);at=next_heap;next_heap+=(n+15)&~15;u.mem_write(at,bytes(n));return at

def outstr(dest,s):
 raw=s.encode();at=alloc(len(raw)+1);u.mem_write(at,raw);u.mem_write(dest,struct.pack('<QQQ',len(raw),at,len(raw)))
def named(rcx,rdx,r8,r9):
 template=st(rdx,r8);values={};n=q(reg(UC_X86_REG_RSP)+40)
 for j in range(n):
  at=r9+j*32;key=pair(at);value=q(at+16);method=q(q(at+24)+24)
  if method==0x1400020c0:value=pair(value)
  elif method==0x1400020e0:value=pair(value+8)
  elif method in [0x14573a450,0x14573b340]:value=str(int.from_bytes(u.mem_read(value,4 if method==0x14573a450 else 8),'little'))
  else:raise RuntimeError('unknown named format method '+hex(method))
  values[key]=value
 value=template
 for key,item in values.items():value=value.replace('{'+key+'}',item)
 pieces.append({'text':value,'template':template,'values':values});outstr(rcx,value)
def hook(_,a,size,unused):
 if any(lo<=a<hi for lo,hi in allowed):return
 calls[a]=calls.get(a,0)+1;rcx,rdx,r8,r9=[reg(r)for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]]
 if a in [0x140002200,0x1400021d0]:pass
 elif a==0x1457744b0:
  size=q(reg(UC_X86_REG_RSP)+40);assert size>0
  capacity=max(q(rcx)*2,rdx+r8,8 if size==1 else 4 if size<1025 else 1)
  ptr=alloc(capacity*size)
  if rdx:u.mem_write(ptr,bytes(u.mem_read(q(rcx+8),rdx*size)))
  wq(rcx,capacity);wq(rcx+8,ptr)
 elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(rcx))
 elif a==0x145457cb0:
  value=st(rcx,rdx);pieces.append({'text':value,'template':value,'values':{}});u.reg_write(UC_X86_REG_RAX,0);u.reg_write(UC_X86_REG_RDX,0)
 elif a in [0x1457731ed,0x1457731e1]:u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(UC_X86_REG_RAX,rcx)
 elif a==0x1457731e7:u.reg_write(UC_X86_REG_RAX,int(u.mem_read(rcx,r8)!=u.mem_read(rdx,r8)))
 elif a==0x145773283:
  # CRT powf: Win64 xmm0 base and xmm1 exponent.
  values=[struct.unpack('<f',reg(r).to_bytes(16,'little')[:4])[0]for r in [UC_X86_REG_XMM0,UC_X86_REG_XMM1]];v=math.pow(*values);u.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',v)+bytes(12),'little'))
 elif a==0x145773265:
  v=math.floor(struct.unpack('<f',reg(UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]);u.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',v)+bytes(12),'little'))
 elif a==0x145728850:outstr(rcx,pair(rdx+8))
 elif a==0x14542a910:
  value=pair(rdx+8);assert not value or ord(value[0])<128
  # Reviewed uppercase-first helper; English locale-miss fixtures use ASCII.
  outstr(rcx,value[:1].upper()+value[1:])
 elif a==0x145728390:
  ptr=rdx;argi=0;value=''
  while 1:
   op=u.mem_read(ptr,1)[0];ptr+=1
   if op==0:break
   if op<0x80:value+=st(ptr,op);ptr+=op;continue
   precision=None
   if op in [0xc1,0xc5]:
    ptr+=4;precision=0
    if op==0xc5:precision=u.mem_read(ptr,1)[0];ptr+=1
   elif op!=0xc0:raise RuntimeError('unknown String format op '+hex(op))
   at,fmt=q(r8+argi*16),q(r8+argi*16+8);argi+=1
   if fmt==0x1400020c0:part=pair(at)
   elif fmt==0x1400020e0:part=pair(at+8)
   elif fmt==0x1457396f0:
    v=struct.unpack('<f',u.mem_read(at,4))[0];part=format(v,'.'+str(precision)+'f')if precision is not None else str(v);numbers.append({'call':hex(q(reg(UC_X86_REG_RSP))),'value_bits':struct.unpack('<I',u.mem_read(at,4))[0],'precision':precision})
   else:raise RuntimeError('unknown String formatter '+hex(fmt))
   value+=part
  outstr(rcx,value)
 elif a in [0x145458060]:named(rcx,rdx,r8,r9)
 elif a==0x1454210d0:
  source=st(rdx,r8);key=st(r9,q(reg(UC_X86_REG_RSP)+40));value=st(q(reg(UC_X86_REG_RSP)+48),q(reg(UC_X86_REG_RSP)+56));outstr(rcx,source.replace(key,value));pieces.append({'text':source.replace(key,value),'template':source,'values':{key:value}})
 else:raise RuntimeError('Unreviewed native call '+hex(a)+' from '+hex(q(reg(UC_X86_REG_RSP))))
 sp=reg(UC_X86_REG_RSP);u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,q(sp))
u.hook_add(UC_HOOK_CODE,hook)
catalog=json.loads((ROOT/'crates/azeroth-survivors-re/assets/native-amulets-0.100.1.json').read_text());rows=[]
for definition in catalog['shared']+catalog['generated']:
 for picks in [1,2,5]:
  next_heap=HEAP+0x1000;pieces=[];numbers=[];out=alloc(24);amulet=alloc(112);records=[]
  for effect in definition['effects']:
   raw=bytearray.fromhex(effect['raw_hex'])
   for string in effect['strings']:
    b=string['value'].encode();at=alloc(len(b)+1);u.mem_write(at,b);struct.pack_into('<QQ',raw,string['offset'],at,len(b))
   records.append(raw)
  at=alloc(len(records)*64);u.mem_write(at,b''.join(records));u.mem_write(amulet+48,struct.pack('<QQQ',len(records),at,len(records)));u.mem_write(amulet+96,struct.pack('<QI',definition['rarity'],picks));sp=STACK+0x1f0008;wq(sp,STOP)
  for r,v in [(UC_X86_REG_RSP,sp),(UC_X86_REG_RCX,out),(UC_X86_REG_RDX,amulet)]:u.reg_write(r,v)
  try:u.emu_start(0x145425910,STOP,count=1000000)
  except Exception as error:raise RuntimeError(definition['key']+' pc'+hex(reg(UC_X86_REG_RIP))+': '+str(error))from error
  assert reg(UC_X86_REG_RIP)==STOP
  text=[pair(q(out+8)+i*24+8)for i in range(q(out+16))];rows.append({'key':definition['key'],'picks':picks,'lines':text,'numbers':numbers,'pieces':pieces});print(definition['key'],picks,text,flush=True)
jewelry=[]
for index in range(22):
 definition=0x14673b428+index*72;base=struct.unpack('<f',u.mem_read(definition+64,4))[0]
 for value in [0.,base*1.5,base*3.,base*3.-0.0000005,base*10.]:
  next_heap=HEAP+0x1000;pieces=[];numbers=[];out=alloc(24);sp=STACK+0x1f0008;wq(sp,STOP)
  value_bits=struct.unpack('<I',struct.pack('<f',value))[0]
  for r,v in [(UC_X86_REG_RSP,sp),(UC_X86_REG_RCX,out),(UC_X86_REG_RDX,definition),(UC_X86_REG_XMM2,value_bits)]:u.reg_write(r,v)
  u.emu_start(0x145424a90,STOP,count=1000000);assert reg(UC_X86_REG_RIP)==STOP
  jewelry.append({'key':pair(definition),'amount_bits':value_bits,'text':pair(out+8),'pieces':pieces,'numbers':numbers})
work=ROOT/'runtime/treasure-interface-0.100.1';work.mkdir(parents=True,exist_ok=True);(work/'amulet-prose-fixtures.json').write_text(json.dumps({'target_sha256':SHA,'admitted_owners':[hex(a)for a in ADMITTED],'calls':{hex(a):n for a,n in calls.items()},'rows':rows,'jewelry':jewelry},indent=2)+'\n')
fixture={'target_sha256':SHA,'method':__doc__,'admitted_owners':[hex(a)for a in ADMITTED],'cases':[{k:r[k]for k in ['key','picks','lines']}for r in rows],'jewelry_cases':[{k:r[k]for k in ['key','amount_bits','text']}for r in jewelry]}
(ROOT/'crates/azeroth-survivors-re/tests/fixtures/amulet-prose-0.100.1-native.json').write_text(json.dumps(fixture,indent=2)+'\n')
