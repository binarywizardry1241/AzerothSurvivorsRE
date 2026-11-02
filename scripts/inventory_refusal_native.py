"""AS0.113.2 inventory refusal: original instructions, synthetic local state.

Only the five selected request branches execute; sender/allocator are seams.
"""
import sys,struct,json
from pathlib import Path
from creature_query_native import EquipmentProbe,PE,D,ENDS,ROOT
H,S,SEND=0x1458646d0,0x1458d5730,0x145885a50
class RefusalProbe(EquipmentProbe):
 def __init__(self):
  super().__init__(D,PE,[(H,ENDS[H]),(S,ENDS[S])]);self.prefix=True;self.result=None;self.packet=None
 def hook(self,uc,pc,size,unused):
  if pc==S:
   self.result=[self.reg('RDX')&255,self.reg('R8')]
   if self.prefix:self.native.emu_stop();return
  if pc==SEND:
   row=self.reg('R9');self.packet=[self.q(row+24)&65535,bytes(self.native.mem_read(self.q(row+8),self.q(row+16))).hex()];self.native.emu_stop();return
  return super().hook(uc,pc,size,unused)
 def request(self,opcode,payload,full=False):
  assert opcode in [0x10a,0x10b,0x10c,0x10d,0x111]
  self.cursor=self.HEAP+0x1000;self.result=None;self.packet=None;self.prefix=not full
  data=self.alloc(len(payload));self.native.mem_write(data,payload);host=self.alloc(0x2000);self.native.mem_write(host+0x10,struct.pack('<I',2))
  sp=self.STACK+0x1f0008;self.put(sp,self.DONE);self.put(sp+40,data,len(payload))
  for k,v in [('RCX',host),('RDX',0),('R8',0),('R9',opcode),('RSP',sp),('MXCSR',0x1f80)]:self.reg(k,v)
  self.native.emu_start(H,self.DONE,count=10000)
  assert self.result is not None and (not full or self.packet is not None)
  return self.packet if full else self.result
