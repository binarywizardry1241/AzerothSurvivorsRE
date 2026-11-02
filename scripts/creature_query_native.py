"""Bounded AS0.113.2 query/serializer instruction probe.

Executes original PE instructions in Unicorn, never the application. The sender
is intercepted. Allocation, buffer growth, memcpy/memcmp, formatting and locale
lookup are explicit Python seams; any unreviewed call fails. The admitted leaf
at145847c70 is outside the PE unwind inventory and was independently decoded
with REA/Ghidra. This does not alter full-image census ownership.
"""
import sys,json,struct
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/armory-recovery/python-libs')]
from coverage_common import latest_target,target_bytes
from script_sources import load_script
from equipment_native import EquipmentProbe
T=latest_target(verify=True);assert T['sha256']=='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb';D=target_bytes(T);PE=load_script('cq_pe',ROOT/'scripts/inventory-executable.py').PE(D)
ENDS={PE.image_base+a:PE.image_base+b for a,b,_ in PE.functions()}
ENDS[0x145847c70]=0x145847c8c
FS=[0x1457fd770,0x145847c70,0x1458646d0,0x1458d4d00,0x1458d08e0,0x1458006a0,0x145800820,0x145800a10]
class Probe(EquipmentProbe):
 def __init__(self):
  super().__init__(D,PE,[(a,ENDS[a]) for a in FS]);self.locale=json.loads((ROOT/'crates/azeroth-survivors-re/assets/locales/en.json').read_text());self.packet=None;self.trace=set()
 def hook(self,uc,pc,size,unused):
  if any(a<=pc and pc+size<=b for a,b in self.ranges):self.trace.add(pc);return
  if pc==self.stop:return super().hook(uc,pc,size,unused)
  rcx,rdx,r8,r9=(self.reg(x) for x in ['RCX','RDX','R8','R9'])
  if pc==0x145cf998b:self.native.mem_write(rcx,bytes(self.native.mem_read(rdx,r8)));self.reg('RAX',rcx)
  elif pc==0x145cf9991:
   a,b=bytes(self.native.mem_read(rcx,r8)),bytes(self.native.mem_read(rdx,r8));self.reg('RAX',((a>b)-(a<b))&((1<<64)-1))
  elif pc==0x145ccc6e0:
   out='';arg=0;at=rdx
   while True:
    op=self.native.mem_read(at,1)[0];at+=1
    if op==0:break
    if op<128:out+=self.text(at,op);at+=op
    else:
     assert op==0xc0
     ptr,fmt=self.q(r8+arg*16),self.q(r8+arg*16+8);arg+=1
     if fmt==0x145cde190:out+=str(struct.unpack('<I',self.native.mem_read(ptr,4))[0])
     elif fmt==0x1400020c0:out+=self.pair(ptr)
     else:raise RuntimeError('format '+hex(fmt))
   self.output(rcx,out)
  elif pc==0x145895720:
   key=self.text(rcx,rdx);self.keys.add(key);value=self.locale.get(key)
   if value is None:self.reg('RAX',0);self.reg('RDX',0)
   else:
    value=value.encode();ptr=self.alloc(len(value)+1);self.native.mem_write(ptr,value);self.reg('RAX',ptr);self.reg('RDX',len(value))
  elif pc in [0x145e9bc80,0x145cf9da0]:
   count=self.q(rcx+16);old=self.q(rcx+8);capacity=max(1024,count+r8);ptr=self.alloc(capacity)
   if count:self.native.mem_write(ptr,bytes(self.native.mem_read(old,count)))
   self.put(rcx,capacity,ptr)
  elif pc==0x145885a50:
   self.packet=(self.q(r9+24)&0xffff,bytes(self.native.mem_read(self.q(r9+8),self.q(r9+16))))
  else:return super().hook(uc,pc,size,unused)
  sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp))
 def query(self,entry,payload=None):
  self.cursor=self.HEAP+0x1000;self.packet=None;self.keys=set();payload=struct.pack('<IQ',entry,0) if payload is None else payload
  inp=self.alloc(len(payload));self.native.mem_write(inp,payload);game=self.alloc(0x1000)
  sp=self.STACK+0x1f0008;self.put(sp,self.DONE);self.put(sp+40,inp,len(payload))
  for k,v in [('RSP',sp),('RCX',game),('RDX',0),('R8',0),('R9',0x60),('MXCSR',0x1f80)]:self.reg(k,v)
  self.native.emu_start(0x1458646d0,self.DONE,count=100000)
  assert self.reg('RIP')==self.DONE
  assert self.packet is not None
  opcode,buf=self.packet;assert opcode==0x61
  v=struct.unpack_from('<I',buf)[0]
  if v&0x80000000:return {'entry':entry,'found':False,'response_entry':v&0x7fffffff}
  off=4;strings=[]
  for _ in range(5):
   end=buf.index(0,off);strings.append(buf[off:end].decode());off=end+1
  fields=list(struct.unpack_from('<7I2B',buf,off));assert off+30==len(buf)
  return {'entry':entry,'found':True,'name':strings[0],'other_names':strings[1:4],'subname':strings[4],'fields':fields,'keys':sorted(self.keys)}
