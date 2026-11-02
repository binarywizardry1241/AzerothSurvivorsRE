"""Current AS local dispatcher prefixes and desktop Gossip capability guards.

Original instructions with synthetic input; a prefix stops before entering an
external callee. Excluded nonlocal helper bodies are never executed.
"""
import hashlib
import struct
from creature_query_native import EquipmentProbe,PE,D,ENDS,ROOT
from unicorn import UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
H=0x1458646d0
VT=0x145ec6020
LEAF=0x14005fb70
class DispatchProbe(EquipmentProbe):
 def __init__(self):
  super().__init__(D,PE,[(H,ENDS[H])]);self.mode='prefix';self.endpoint=None;self.trace=[];self.host_access=False
  self.native.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,self.memory)
 def memory(self,uc,access,address,size,value,unused):
  if self.HEAP<=address<self.HEAP+0x2000000:self.host_access=True
 def hook(self,uc,pc,size,unused):
  if self.mode=='prefix':
   if pc==self.DONE:self.endpoint='return';self.native.emu_stop();return
   if not H<=pc<ENDS[H]:self.endpoint=hex(pc);self.native.emu_stop();return
   self.trace.append(pc);return
  if pc==self.stop:self.native.emu_stop();return
  if not any(a<=pc and pc+size<=b for a,b in self.ranges):raise AssertionError(('unreviewed capability/guard',hex(pc)))
 def route(self,opcode,profile):
  self.mode='prefix';self.cursor=self.HEAP+0x1000;host=self.alloc(0x2000);payload=self.alloc(32)
  present,flag,name=profile;self.native.mem_write(host+0x10,struct.pack('<I',0 if present else 2));self.native.mem_write(host+0xc1d,bytes([flag]));self.put(host+0x1390,0 if name else (1<<64)-1)
  sp=self.STACK+0x1f0008;self.put(sp,self.DONE);self.put(sp+40,payload,32)
  for k,v in [('RCX',host),('RDX',0),('R8',0),('R9',opcode),('RSP',sp),('MXCSR',0x1f80)]:self.reg(k,v)
  self.trace=[];self.endpoint=None;self.host_access=False;self.native.emu_start(H,self.DONE,count=10000)
  if self.endpoint is None and self.reg('RIP')==self.DONE:self.endpoint='return'
  assert self.endpoint is not None,(opcode,profile,hex(self.reg('RIP')))
  return [self.endpoint,hashlib.sha256(struct.pack('<'+'Q'*len(self.trace),*self.trace)).hexdigest(),len(self.trace),self.host_access]
 def capability(self,previous):
  self.mode='guard';self.ranges=[(0x145880d6b,0x145880d83),(LEAF,LEAF+3)];self.stop=0x145880d83
  self.cursor=self.HEAP+0x1000;host=self.alloc(0x1800);frame=self.alloc(0x1000);self.put(host+0x1668,1,VT)
  for k,v in [('R13',host),('RBP',frame),('RSP',self.STACK+0x1f0008),('RAX',previous)]:self.reg(k,v)
  self.native.emu_start(0x145880d6b,self.stop,count=100)
  assert self.reg('RIP')==self.stop
  return self.native.mem_read(frame+0xbb6,1)[0]
 def guard(self,entry,end,admit,capability,choice):
  self.mode='guard';self.ranges=[(entry,end)];self.stop=admit;self.cursor=self.HEAP+0x1000;game=self.alloc(0x1000)
  self.native.mem_write(game+0xbfe,bytes([capability]));self.native.mem_write(game+0xc10,bytes([choice]));self.native.mem_write(game+0xc12,b'\x05')
  sp=self.STACK+0x1f0008;self.put(sp,self.DONE);self.reg('RCX',game);self.reg('RSP',sp)
  self.native.emu_start(entry,self.DONE,count=1000);pc=self.reg('RIP');assert pc in [self.DONE,admit],hex(pc)
  return pc==admit
