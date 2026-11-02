"""Bounded current zone-key, local-key and guardian-damage instruction probe.

Original AS code only; synthetic host/Game state and intercepted bounds/powf.
No application, co-op branch, filesystem, network or reconstructed Rust runs.
"""
import sys,struct,math,json
from pathlib import Path

from creature_query_native import PE,D,ROOT,EquipmentProbe
PARSER,END=0x145808880,0x1458089a9
TABLE=0x146fdcd48
KEYS=['elwynn','duskwood','wsg','ungoro','ab','feralas','arena','sm','av','brm','aq','naxx']
class ModeProbe(EquipmentProbe):
 def __init__(self):
  super().__init__(D,PE,[(PARSER,END),(0x1458089b0,0x1458089cf),(0x145881860,0x1458818f4),(0x145974490,0x14597461f)])
  self.pow_result=1.;self.pow_calls=[];self.failed=False
 def hook(self,uc,pc,size,unused):
  if pc==0x145cf9a15:
   self.pow_calls.append([self.reg('XMM0')&0xffffffff,self.reg('XMM1')&0xffffffff]);self.reg('XMM0',bits(self.pow_result));sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp));return
  if pc==0x145e9c123:self.failed=True;self.native.emu_stop();return
  return super().hook(uc,pc,size,unused)
 def key(self,value,definition=False,null=False):
  self.cursor=self.HEAP+0x1000;ptr=self.alloc(len(value));self.native.mem_write(ptr,value)
  self.invoke(0x1458089b0 if definition else PARSER,0 if null else ptr,len(value))
  return self.reg('RAX')
 def local_key(self,value):
  self.cursor=self.HEAP+0x1000;data=self.alloc(len(value));self.native.mem_write(data,value);host=self.alloc(0x1800);rows=self.alloc(176)
  self.put(host+0xf28,rows,1);self.put(rows+0x98,data,len(value));self.invoke(0x145881860,host,0)
  assert (self.reg('RAX'),self.reg('RDX'))==(data,len(value))
 def damage(self,key,index,clock,difficulty,kills,percent,phase,endless,start,pow_result):
  self.cursor=self.HEAP+0x1000;ptr=self.alloc(len(key));self.native.mem_write(ptr,key);game=self.alloc(0x1000)
  self.put(game+0x2a8,ptr,len(key))
  for off,fmt,value in [(0xb6c,'f',clock),(0xbe4,'f',difficulty),(0x794,'I',kills),(0x2cc,'H',percent),(0xa90,'I',phase),(0xc00,'B',endless),(0xa94,'f',start)]:self.native.mem_write(game+off,struct.pack('<'+fmt,value))
  self.pow_result=pow_result;self.pow_calls=[];self.failed=False
  sp=self.STACK+0x1f0008;self.put(sp,self.DONE)
  for n,v in [('RCX',game),('RDX',index),('RSP',sp),('MXCSR',0x1f80)]:self.reg(n,v)
  self.native.emu_start(0x145974490,self.DONE,count=10000)
  if self.failed:return None
  assert self.reg('RIP')==self.DONE
  return self.reg('XMM0')&0xffffffff

def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
def value(v):return struct.unpack('<f',struct.pack('<I',v))[0]
def f(v):
 try:return value(bits(v))
 except OverflowError:return math.copysign(math.inf,v)
def raw(a,n):
 o=PE.rva_offset(a-PE.image_base);return D[o:o+n]
def model(clock,difficulty,kills,percent,phase,endless,start,pow_result,zone,base):
 minutes=f(clock/60.);linear=f(f(f(.08)*minutes)+1.);quad=f(f(f(.004)*minutes)*minutes);poly=f(quad+linear);product=f(zone*difficulty)
 difficulty=f(math.sqrt(product))if product>=0 else math.nan
 damage=f(base*f(difficulty*poly));damage=f(damage*f(1.4));damage=f(damage*(pow_result if phase==1 and endless else 1.));killmult=f(f(f(kills)*f(.05))+1.);damage=f(killmult*damage)
 return bits(f(f(f(percent)/100.)*damage))
