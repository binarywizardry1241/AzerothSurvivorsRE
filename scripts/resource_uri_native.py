"""Current AS URI producers with allocation/copy seams; stop before asset loading."""
from creature_query_native import EquipmentProbe,D,PE
LOADER=0x140159a10
SPANS={'bar':(0x14019aad9,0x14019ab55),'dragon':(0x1402894f5,0x140289580),
       'feature':(0x14030554c,0x1403055b8),'rotation':(0x1402ca8d4,0x1402ca95f)}
class UriProbe(EquipmentProbe):
 def __init__(self):super().__init__(D,PE,[(a,b+5)for a,b in SPANS.values()])
 def hook(self,uc,pc,size,unused):
  if pc==LOADER:
   at=self.reg('R8');self.result=self.text(self.q(at+8),self.q(at+16));self.native.emu_stop();return
  if pc==0x145cf998b:
   self.native.mem_write(self.reg('RCX'),bytes(self.native.mem_read(self.reg('RDX'),self.reg('R8'))));self.reg('RAX',self.reg('RCX'));sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp));return
  if pc==0x1402cac54:self.result='bounds';self.native.emu_stop();return
  return super().hook(uc,pc,size,unused)
 def run(self,kind,index=0):
  self.cursor=self.HEAP+0x1000;self.result=None;frame=self.STACK+0x100000
  self.native.mem_write(frame-0x1000,bytes(0x3000))
  for k,v in [('RSP',self.STACK+0x1f0008),('RBP',frame),('RDI',frame+0x3a0),('RSI',frame+0x350),('RBX',index),('R9',index)]:self.reg(k,v)
  self.native.emu_start(SPANS[kind][0],self.DONE,count=1000);assert self.result
  return self.result
