#!/usr/bin/env python3
"""Replay current host/code native request and code-normalization contracts.

No compilation, network or game. Allocator/String cloning/queue submission are
explicit seams; the trim seam retains the original bytes because the following
ASCII-alphanumeric filter discards every trimmed character in any position.
This is bounded native evidence, not execution of the reconstructed Rust.
"""
import sys,struct,json,itertools,time
sys.path.insert(0,str(__import__('pathlib').Path(__file__).resolve().parent))
from coverage_common import ROOT,latest_target,target_bytes
from script_sources import load_script
old=load_script('old_coop_ui', ROOT/'scripts/check-coop-ui.py')
x=latest_target(verify=True); d=target_bytes(x);p=load_script('pe',ROOT/'scripts/inventory-executable.py').PE(d)
assert x['sha256'] == '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
import hashlib
manifest_path=ROOT/'docs/analysis/evidence/coop-forms/manifest.json'
manifest=json.loads(manifest_path.read_text())
assert manifest['target']['sha256']==x['sha256']
for row in manifest['functions']:
 start,end=int(row['start'],16),int(row['end_exclusive'],16);offset=p.rva_offset(start-p.image_base)
 assert offset==int(row['file_offset'],16)
 assert hashlib.sha256(d[offset:offset+end-start]).hexdigest()==row['sha256'],row['role']
for name,expected in manifest['extracts'].items():
 assert hashlib.sha256((manifest_path.parent/name).read_bytes()).hexdigest()==expected,name
for row in manifest['data_ranges']:
 offset=p.rva_offset(int(row['start'],16)-p.image_base);b=d[offset:offset+row['byte_count']]
 assert hashlib.sha256(b).hexdigest()==row['sha256'] and b.hex()==row['bytes_hex']

class Probe(old.Native):
 def __init__(self):
  super().__init__(d,p,[(0x14020f670,0x14020f91f),(0x145b79680,0x145b79a92)],[0x140002200,0x1400021c0,0x1400021d0,0x145ce7810,0x145d145fb,0x145e9e020,0x1401edaa0,0x14012c6a0])
  self.events=[]
 def s(self,a): return bytes(self.cpu.mem_read(self.q(a+8),self.q(a+16))).decode()
 def hook(self,cpu,pc,size,u):
  if pc==self.stop or any(a<=pc and pc+size<=b for a,b in self.ranges):return super().hook(cpu,pc,size,u)
  a,b,n=(self.reg(k) for k in ('RCX','RDX','R8'))
  if pc==0x140002200:pass
  elif pc==0x1400021c0:self.reg('RAX',self.alloc(a))
  elif pc==0x1401edaa0:
   # Trim seam: alphabetic filter removes every whitespace codepoint anyway.
   self.reg('RAX',a);self.reg('RDX',b)
  elif pc==0x145e9e020:
   count=self.q(a+16);capacity=max(self.q(a)*2,b+n,8);pointer=self.alloc(capacity)
   if count:self.cpu.mem_write(pointer,bytes(self.cpu.mem_read(self.q(a+8),count)))
   self.put(a,capacity,pointer,count)
  elif pc==0x14012c6a0:
   tag=struct.unpack('<I',self.cpu.mem_read(b,4))[0]
   if tag==12: self.events.append(('profile',self.s(b+8),self.s(b+32),self.q(b+56),bytes(self.cpu.mem_read(b+64,8)).hex()))
   elif tag==21:self.events.append(('host',self.s(b+8),self.s(b+32),self.s(b+56),*self.cpu.mem_read(b+80,2)))
   elif tag==22:self.events.append(('join',self.s(b+8),self.s(b+32)))
   else:raise AssertionError(tag)
  else:return super().hook(cpu,pc,size,u)
  stack=self.reg('RSP');self.reg('RIP',self.q(stack));self.reg('RSP',stack+8)
 def reset(self):
  self.cursor=self.HEAP+0x60000;self.events=[];self.cpu.mem_write(self.HEAP,bytes(0x50000))
  stack=self.HEAP+0x40000;self.stop=self.HEAP+0x4f000;self.put(stack,self.stop);self.reg('RSP',stack)
 def normalize(self,s):
  self.reset();v=self.alloc(len(s.encode()));self.cpu.mem_write(v,s.encode() or b'\0')
  self.reg('RCX',self.HEAP);self.reg('RDX',v);self.reg('R8',len(s.encode()));self.run(0x145b79680)
  return self.s(self.HEAP)
 def helper(self,mode,raw,private,code=' \ta-b çz9\n'):
  self.reset();state=self.HEAP;profile=state+0x2000
  for off,s in [(0,'off'),(0x90,' name é '),(0xa8,' pass\tß '),(0xc0,' desc🌍 '),(0xd8,code),(0xf0,' join🔒 ')]:self.string(state+off,s.encode())
  self.cpu.mem_write(state+0x130,bytes([private,0,0,raw]))
  self.string(profile,b'hero');self.string(profile+24,b'locale?');self.put(profile+48,123)
  self.cpu.mem_write(profile+56,bytes([1,2,3,4,5,6,7,8]))
  for k,v in [('RCX',state),('RDX',state+0x3000),('R8',profile),('R9',mode)]:self.reg(k,v)
  self.run(0x14020f670)
  return self.events,self.s(state)
q=Probe();count=0
samples=['',' ', 'a-b c_09','äＡßıİz','abcd'*30,'🙂Ab\t19','\0AaZz09_']+[chr(i) for i in range(128)]+['a'*n+'b-z 9' for n in [7,8,9,15,16,17,31,32,33,63,64,65]]
for s in samples:
 expected=''.join(c.upper() for c in s if c.isascii() and c.isalnum());actual=q.normalize(s)
 assert actual==expected,(repr(s),actual,expected);count+=1
for mode,raw,private in itertools.product(range(3),range(256),range(2)):
 e,status=q.helper(mode,raw,private)
 if mode==0:assert e==[] and status=='off'
 else:
  assert e[0]==('profile','hero','locale?',123,'0102030405060708')
  if mode==1: assert e[1]==('host',' name é ',' pass\tß ',' desc🌍 ',1-private,5 if raw==0 else min(raw,5)) and status=='off'
  else: assert e[1]==('join','ABZ9',' join🔒 ') and status=='joining'
 count+=1
print('PASS',count,'native helper/normalization cases; source execution/runtime/parity unverified')
