"""Replay 0.121.0 Difficulty constructors to their typed UI submission boundaries.

This interprets original instructions with synthetic memory. It never executes
an operating-system call, original/rebuilt application, network or server.
Formatting, localization, allocation, UI submission and color conversion are
explicit seams recorded separately from the original constructor behavior.
"""
import sys,struct,json
from pathlib import Path
ROOT=Path(__file__).resolve().parent.parent;sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
from coverage_common import latest_target,target_bytes
from script_sources import load_script
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
b=target_bytes(latest_target(verify=True));p=load_script('diff_pe',ROOT/'scripts/inventory-executable.py').PE(b)
layout=json.loads((ROOT/'docs/analysis/evidence/0.92/picker-node-layout.json').read_text())['node_layout'];layout['OFFSET_flex_grow']=348

def sample(role,selected=0,maximum=5,normal=True,account=5,locked=False,current=None,affix_selector=0):
 u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(s['rva']+max(s['virtual_size'],s['raw_size']) for s in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
 for s in p.sections:u.mem_write(p.image_base+s['rva'],b[s['raw_offset']:s['raw_offset']+s['raw_size']])
 u.mem_map(0x200000000,0x1000000);u.mem_map(0x300000000,0x200000);u.mem_map(0x400000000,4096);heap=0x200010000;STOP=0x400000000;records=[];texts=[];rows=[];seams=set();instructions=0;keys=[]
 def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
 def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
 def alloc(n):
  nonlocal heap
  a=heap;heap+=(n+15)&~15;return a
 def outstr(a,v):
  raw=v.encode();at=alloc(len(raw)+1);u.mem_write(at,raw);u.mem_write(a,struct.pack('<QQQ',len(raw),at,len(raw)))
 def node(a):
  raw=bytes(u.mem_read(a,384));out={}
  for k,o in layout.items():
   if k=='NODE_SIZE':continue
   k=k.removeprefix('OFFSET_')
   if k in ['left','right','top','bottom','width','height','min_width','min_height','max_width','max_height','flex_basis','row_gap','column_gap']:out[k]=list(struct.unpack_from('<If',raw,o))
   elif k in ['margin','padding','border','border_radius']:out[k]=[list(struct.unpack_from('<If',raw,o+i*8)) for i in range(4)]
   elif k in ['flex_grow','flex_shrink','scrollbar_width']:out[k]=struct.unpack_from('<f',raw,o)[0]
   elif o>=370:out[k]=raw[o]
  out['overflow']=list(raw[356:358]);return out
 ranges={'frame':[(0x14014b510,0x14014b7d5)],'page':[(0x14014bce0,0x14014cf0e),(0x140276860,0x140276dac)],'row':[(0x140278430,0x140278b36),(0x14014d0e0,0x14014f24e),(0x14014b7e0,0x14014bcd2)],'affixes':[(0x140276f90,0x1402774dc),(0x14014a3b0,0x14014b24a)],'footer':[(0x140126140,0x14012655e)],'affix-name':[(0x145ababa0,0x145ababe0)],'affix-description':[(0x145ababe0,0x145abac1f)]}[role];start=ranges[0][0]
 def hook(_,a,size,_2):
  nonlocal instructions
  instructions+=1
  if a==0x14014a3b0:
   capture=u.reg_read(UC_X86_REG_RDX);raw=bytes(u.mem_read(q(capture+8),q(capture+16)*2));rows.extend({'affix':raw[i],'from_rank':raw[i+1]} for i in range(0,len(raw),2))
  if any(s<=a<e for s,e in ranges):
   return
  if a==STOP:u.emu_stop();return
  seams.add(hex(a));c,d,r8,r9=[u.reg_read(r) for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]];sp=u.reg_read(UC_X86_REG_RSP);site=q(sp)-5
  if a==0x145febc1b:u.mem_write(c,bytes(u.mem_read(d,r8)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1400bb770:
   records.append(dict(site=hex(site),node=node(r8+8),canvas=list(struct.unpack('<3f',u.mem_read(r8+392,12)))));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x1400a60f0,0x1400bcd10,0x1400bd980,0x1400a8a00,0x1400a94c0,0x1400a6e60,0x1400a8f60,0x1400a6900]:
   records.append(dict(site=hex(site),node=node(r8+8)));u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x140276860:
   records.append(dict(site=hex(site),node=node(d)));u.mem_write(c,bytes(u.mem_read(r8,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x140276280,0x1400aa230]:u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x140278430:rows.append(dict(rank=r8&255,selected=r9&255,lock=q(q(sp+40))));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x140276f90:u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x1400bc7b0,0x1400bd250,0x1400c4130]:
   texts.append(dict(site=hex(site),size=struct.unpack('<f',u.mem_read(d+72 if a==0x1400c4130 else r8+80,4))[0]));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x145aeaeb0,0x145aeaf60]:
   keys.append(bytes(u.mem_read(c,d)).decode());u.reg_write(UC_X86_REG_RAX,c);u.reg_write(UC_X86_REG_RDX,d)
  elif a==0x145a99e50:
   at=alloc(8);u.mem_write(at,b'Zone');u.reg_write(UC_X86_REG_RAX,at);u.reg_write(UC_X86_REG_RDX,4)
  elif a==0x145aeb340:outstr(c,'text');u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145ac00a0:u.reg_write(UC_X86_REG_RAX,min(c&255,5))
  elif a==0x145ac00b0:outstr(c,'Heroic');u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(c))
  elif a in [0x140002200,0x1400021d0]:pass
  elif a in [0x140277e40,0x1400c29c0]:u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x144e4d1a0:u.mem_write(c,bytes(u.mem_read(d+4,16)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x14282caa0:u.mem_write(c,bytes(24));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1400a7c30:
   records.append(dict(site=hex(site),node=node(r8+8)));u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145ac9f90:u.reg_write(UC_X86_REG_RAX,0)
  elif a==0x145ac0090:
   rank=d&255;selector=(r8+7*(r9&0xffffffff))&0xffffffffffffffff;first=selector%3;ids=[] if rank<3 else [first] if rank<5 else [first,(first+((selector//3)&1)+1)%3];at=alloc(16);u.mem_write(at,bytes(ids));u.mem_write(c,struct.pack('<QQQ',len(ids),at,len(ids)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145fec7b0:
   cap,old,length=struct.unpack('<QQQ',u.mem_read(c,24));new=max(4,cap*2);at=alloc(new*2);
   if length:u.mem_write(at,bytes(u.mem_read(old,length*2)))
   u.mem_write(c,struct.pack('<QQQ',new,at,length));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x145ababa0,0x145ababe0]:
   at=alloc(16);u.mem_write(at,b'Affix');u.reg_write(UC_X86_REG_RAX,at);u.reg_write(UC_X86_REG_RDX,5)
  elif a==0x145fbee30:
   outstr(c,'cloned');u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x145ac0270,0x145ac02b0,0x145ac02f0,0x145ac0330]:u.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',1.0),'little'))
  elif a==0x140277c10:outstr(c,'1');u.reg_write(UC_X86_REG_RAX,c)
  else:raise RuntimeError(f'Unknown {a:#x} at {site:#x} args {c:#x} {d:#x} {r8:#x} {r9:#x}')
  u.reg_write(UC_X86_REG_RIP,q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
 u.hook_add(UC_HOOK_CODE,hook)
 parent=alloc(1024);context=alloc(1024);art=alloc(4096);third=alloc(512);vals=alloc(128)
 for at in [parent,third]:
  for i in range(32):wq(at+i*8,vals)
 wq(context,art)
 queue=alloc(64);buffer=alloc(4096);wq(queue,4096);wq(queue+8,buffer);wq(queue+16,0);wq(parent,42);wq(parent+8,queue);wq(parent+16,0);wq(parent+24,queue);wq(parent+32,queue)
 for off in range(0,2048,24):u.mem_write(art+off,b'\x01');wq(art+off+8,alloc(64))
 u.mem_write(vals,bytes([selected,maximum,normal,account])+bytes(60))
 wq(third,context);wq(third+8,vals+32);wq(third+16,vals);wq(third+24,vals+1);wq(third+32,vals+2);wq(third+40,vals+3);wq(third+48,vals)
 sp=0x3001f0008;wq(sp,STOP);wq(sp+40,vals+48);wq(vals+48,0xffffffffffffffff);
 if locked:outstr(vals+48,'locked')
 u.reg_write(UC_X86_REG_RSP,sp)
 for r,v in [(UC_X86_REG_RCX,selected if role.startswith('affix-') else parent),(UC_X86_REG_RDX,third if role=='page' else art if role in ['row','footer','affixes'] else context),(UC_X86_REG_R8,selected if role=='row' else vals if role=='footer' else affix_selector if role=='affixes' else third),(UC_X86_REG_R9,(selected if current is None else current) if role=='row' else parent)]:u.reg_write(r,v)
 try:u.emu_start(start,STOP,count=100000)
 except Exception as e:raise RuntimeError(hex(u.reg_read(UC_X86_REG_RIP))+': '+str(e)) from e
 assert u.reg_read(UC_X86_REG_RIP)==STOP
 return dict(nodes=records,texts=texts,rows=rows,seams=sorted(seams),keys=keys,instructions=instructions)
