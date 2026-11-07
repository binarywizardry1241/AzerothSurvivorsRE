#!/usr/bin/env python3
"""Shared exact-target instruction fixture for 0.112.0 talents and saved specs.

Maps original bytes for Unicorn; never compiles or starts the game. Explicit
host seams cover allocator/free/realloc, byte operations, roundf, and the English
localization fallback. See talent-allocations-0.112.0.md for interpretation limits.
"""
from script_sources import load_script
from pathlib import Path
import sys, json, hashlib, struct
ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
from coverage_common import *
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
m = load_script('pe', ROOT / 'scripts/inventory-executable.py')
target=latest_target()
assert target['version'] == '0.112.0' and target['sha256'] == 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a', 'Current native talent fixture requires the exact 0.112.0 target'
data=target_bytes(target);pe=m.PE(data)
CODE_RANGES = [(pe.image_base + row['rva'], pe.image_base + row['rva'] + row['virtual_size']) for row in pe.sections if int(row['characteristics'], 16) & 0x20000000]
import math
class Machine:
 def __init__(self):
  self.u=Uc(UC_ARCH_X86,UC_MODE_64);size=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in pe.sections);self.u.mem_map(pe.image_base,(size+4095)&~4095)
  for s in pe.sections:self.u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
  self.H,self.S,self.D=0x200000000,0x300000000,0x400000000;self.u.mem_map(self.H,0x2000000);self.u.mem_map(self.S,0x200000);self.u.mem_map(self.D,4096);self.u.mem_map(0x500000000,4096);self.u.mem_write(0x500000010,struct.pack("<Q",self.S));self.u.reg_write(UC_X86_REG_GS_BASE,0x500000000);self.heap=self.H+0x10000;self.executed=set();self.seams=set();self.u.hook_add(UC_HOOK_CODE,self.hook)
 def q(self,a):return struct.unpack('<Q',self.u.mem_read(a,8))[0]
 def put(self,a,*values):self.u.mem_write(a,struct.pack('<'+'Q'*len(values),*values))
 def alloc(self,n):
  a=self.heap;self.heap+=(max(n,1)+15)&~15;assert self.heap<self.H+0x2000000;self.u.mem_write(a,bytes(max(n,1)));return a
 def hook(self,u,a,n,unused):
  if a==self.D:u.emu_stop();return
  if a not in {0x14598ddd0,0x140002200,0x1400021d0,0x1400021c0,0x145bb40a0,0x145c0a3e1,0x145c0a3e7,0x145c0a3db,0x145c0a3ed,0x145c0a41d}:
   if any(lo <= a < hi for lo, hi in CODE_RANGES):self.executed.add(a);return
   raise RuntimeError(f'Unreviewed external instruction{a:#x}')
  sp=u.reg_read(UC_X86_REG_RSP);c,d,r8,r9=[u.reg_read(r)for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]]
  if a==0x14598ddd0: # Explicit English fallback: no runtime language resource.
   u.reg_write(UC_X86_REG_RAX,0);u.reg_write(UC_X86_REG_RDX,0)
  elif a in [0x140002200,0x1400021d0]:pass
  elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,self.alloc(c))
  elif a==0x145bb40a0:
   at=self.alloc(r9);u.mem_write(at,bytes(u.mem_read(c,min(d,r9))));u.reg_write(UC_X86_REG_RAX,at)
  elif a==0x145c0a3e1:u.mem_write(c,bytes([d&255])*r8);u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145c0a3e7:
   left,right=bytes(u.mem_read(c,r8)),bytes(u.mem_read(d,r8));u.reg_write(UC_X86_REG_RAX,((left>right)-(left<right))&0xffffffffffffffff)
  elif a in [0x145c0a3db,0x145c0a3ed]:u.mem_write(c,bytes(u.mem_read(d,r8)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145c0a41d:
   value=struct.unpack('<f',u.reg_read(UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
   value=math.copysign(math.floor(abs(value)+.5),value) if math.isfinite(value) else value
   u.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',value),'little'))
  elif any(lo <= a < hi for lo, hi in CODE_RANGES):self.executed.add(a);return
  else:raise RuntimeError(f'Unreviewed external instruction {a:#x}, return{self.q(sp):#x}')
  self.seams.add(a);u.reg_write(UC_X86_REG_RIP,self.q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
 def call(self,a,*values,stack=None):
  sp=self.S+0x100008;self.put(sp,self.D);self.u.reg_write(UC_X86_REG_RSP,sp)
  for r,v in zip([UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9],values):self.u.reg_write(r,v)
  if stack is not None:self.put(sp+40,*stack)
  try:self.u.emu_start(a,self.D,count=3000000)
  except Exception as error:raise RuntimeError(f'pc{self.u.reg_read(UC_X86_REG_RIP):x} ret{self.q(self.u.reg_read(UC_X86_REG_RSP)):x}')from error
  assert self.u.reg_read(UC_X86_REG_RIP)==self.D,hex(self.u.reg_read(UC_X86_REG_RIP));return self.u.reg_read(UC_X86_REG_RAX)
 def vector(self,rows):
  a=self.alloc(24);v=self.alloc(16*len(rows))
  for i,(pointer,rank)in enumerate(rows):self.put(v+i*16,pointer,rank)
  self.put(a,len(rows),v,len(rows));return a
 def values(self,a):
  pointer,count=self.q(a+8),self.q(a+16);out=[]
  for i in range(count):
   t=self.q(pointer+i*16);key=bytes(self.u.mem_read(self.q(t+48),self.q(t+56))).decode();out.append((key,self.u.mem_read(pointer+i*16+8,1)[0]))
  return out
 def parse(self,value):
  self.heap=self.H+0x10000;self.u.mem_write(self.H,bytes(0x10000));raw=value.encode();self.u.mem_write(self.H+0x3000,raw or b'\0');self.call(0x1458d45c0,self.H,self.H+0x3000,len(raw));return self.H
 def serialize(self,a):
  out=self.alloc(24);self.call(0x1458da250,out,a);return bytes(self.u.mem_read(self.q(out+8),self.q(out+16))).decode()
