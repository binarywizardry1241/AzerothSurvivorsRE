"""Bounded 0.113.2 font registration/control probe, never a font renderer.

The augmentation result, virtual cache, font database, allocation and copies are
explicit service seams. Original glyph augmentation/shaping does not execute.
Autonym replay stops after the three font database insertions, before its tail.
"""
import struct,hashlib
from creature_query_native import EquipmentProbe,PE,D,ENDS
CJK=0x145803f90;BASE=0x145807ae0;AUTO=0x14004fd00
class FontProbe(EquipmentProbe):
 def __init__(self):
  super().__init__(D,PE,[(a,ENDS[a])for a in [CJK,BASE,AUTO]])
 def alloc(self,count):
  assert 0<=count<0x400000
  at=self.cursor;self.cursor+=(max(count,1)+15)&~15;assert self.cursor<self.HEAP+0x2000000
  self.native.mem_write(at,bytes(count));return at
 def hook(self,uc,pc,size,unused):
  if pc==self.exit_at:self.native.emu_stop();return
  if any(a<=pc and pc+size<=b for a,b in self.ranges):return
  x,y,z=(self.reg(k)for k in ['RCX','RDX','R8'])
  if pc==0x145cf998b:self.native.mem_write(x,bytes(self.native.mem_read(y,z)));self.reg('RAX',x)
  elif pc==0x145bb9b80:
   self.reads.append(self.text(y,z));self.put(x,0 if self.cached else (1<<64)-1,1,0)
  elif pc==0x145bba390:
   raw=bytes(self.native.mem_read(self.q(z+8),self.q(z+16)));self.stored.append([self.text(x,y),len(raw),hashlib.sha256(raw).hexdigest()])
  elif pc==0x145804200:
   raw=bytes(self.native.mem_read(y,z));self.transforms.append(hashlib.sha256(raw).hexdigest());error=self.failures[len(self.transforms)-1]
   value=b'test-error' if error else b'patched'+raw;ptr=self.alloc(len(value));self.native.mem_write(ptr,value);self.native.mem_write(x,bytes(32));self.native.mem_write(x,bytes([int(error)]));self.put(x+8,len(value),ptr,len(value))
  elif pc==0x145cb5ba0:self.logs+=1
  elif pc==0x143384ab0:self.reg('RAX',self.HEAP+0x800)
  elif pc==0x1434fa860:
   raw=bytes(self.native.mem_read(self.q(y+8),self.q(y+16)));self.fontdb.append([len(raw),hashlib.sha256(raw).hexdigest()])
  else:return super().hook(uc,pc,size,unused)
  sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp))
 def reset(self):
  self.cursor=self.HEAP+0x1000;self.reads=[];self.stored=[];self.transforms=[];self.logs=0;self.fontdb=[];self.exit_at=self.DONE
 def cjk(self,code,cached):
  self.reset();self.cached=cached;raw=code.encode();ptr=self.alloc(len(raw)+1);self.native.mem_write(ptr,raw);self.invoke(CJK,ptr,len(raw));result=self.text(self.reg('RAX'),self.reg('RDX'))if self.reg('RAX')else None
  return dict(result=result,reads=self.reads,stored=self.stored)
 def base(self,failures):
  self.reset();self.failures=failures;self.invoke(BASE)
  return dict(stored=self.stored,transforms=self.transforms,logs=self.logs)
 def autonyms(self):
  self.reset();meta=self.alloc(32);ptr=self.alloc(8);self.put(meta,1,0,ptr);self.native.mem_write(meta+28,struct.pack('<I',7));sp=self.STACK+0x1f0008;self.put(sp,self.DONE);self.reg('RSP',sp);self.reg('RDX',meta);self.reg('RCX',0);self.exit_at=0x14004fe4b
  self.native.emu_start(AUTO,self.DONE,count=10000);assert self.reg('RIP')==self.exit_at
  return self.fontdb
