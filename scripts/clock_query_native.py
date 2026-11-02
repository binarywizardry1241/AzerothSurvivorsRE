"""Current local clock instructions with an intercepted OS-time boundary.

The Windows API, reconstructed Rust, network and game are never executed.
"""
import sys,struct
sys.path.insert(0,'scripts')
from creature_query_native import Probe,PE,D,ENDS
H=0x1458646d0;NOW=0x145ca7360;DIFF=0x145ca7310
class ClockProbe(Probe):
 def __init__(self):
  super().__init__();self.ranges=[(H,ENDS[H]),(DIFF,NOW)]
 def hook(self,uc,pc,size,unused):
  if pc==NOW:
   self.reg('RAX',self.ticks&0xffffffff);self.reg('RDX',self.ticks>>32)
   sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp));return
  return super().hook(uc,pc,size,unused)
 def query(self,ticks,game=True,payload=b''):
  self.ticks=ticks;self.cursor=self.HEAP+0x1000;self.packet=None
  host=self.alloc(0x2000);self.native.mem_write(host+0x10,struct.pack('<I',0 if game else 2))
  inp=self.alloc(len(payload));self.native.mem_write(inp,payload);sp=self.STACK+0x1f0008;self.put(sp,self.DONE);self.put(sp+40,inp,len(payload))
  for k,v in [('RSP',sp),('RCX',host),('RDX',0),('R8',0),('R9',0x1ce),('MXCSR',0x1f80)]:self.reg(k,v)
  self.native.emu_start(H,self.DONE,count=10000);assert self.reg('RIP')==self.DONE
  return self.packet
