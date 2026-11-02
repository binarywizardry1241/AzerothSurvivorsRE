"""Local name-query original instructions with synthetic wrapper and sender.

No nonlocal lookup, reconstructed Rust, OS, network or game executes.
"""
import sys,struct
sys.path.insert(0,'scripts')
from creature_query_native import Probe,PE,D,ENDS
H=0x1458646d0;S=0x1458d4300
class NameProbe(Probe):
 def __init__(self):
  super().__init__();self.ranges=[(H,ENDS[H]),(S,ENDS[S])]
 def name(self,guid,name,race,sex,klass,present=True,game=True,payload=None):
  self.cursor=self.HEAP+0x1000;self.packet=None;self.keys=set();raw=name.encode()
  host=self.alloc(0x2000);ptr=self.alloc(len(raw)+1);self.native.mem_write(ptr,raw)
  self.put(host+0x1390,0 if present else (1<<64)-1,ptr,len(raw))
  self.native.mem_write(host+0x14fc,bytes([klass,race,sex]));self.native.mem_write(host+0x10,struct.pack('<I',0 if game else 2))
  payload=struct.pack('<Q',guid) if payload is None else payload
  inp=self.alloc(len(payload));self.native.mem_write(inp,payload)
  sp=self.STACK+0x1f0008;self.put(sp,self.DONE);self.put(sp+40,inp,len(payload))
  for k,v in [('RSP',sp),('RCX',host),('RDX',0),('R8',0),('R9',0x50),('MXCSR',0x1f80)]:self.reg(k,v)
  self.native.emu_start(H,self.DONE,count=100000);assert self.reg('RIP')==self.DONE
  return self.packet
