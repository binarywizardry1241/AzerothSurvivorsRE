#!/usr/bin/env python3
"""Replay bounded current addon localizer instructions with explicit host seams; no build/game."""
from pathlib import Path
import sys,struct,json,hashlib
ROOT=Path(__file__).resolve().parents[1]
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/armory-recovery/python-libs')]
from coverage_common import latest_target,target_bytes
from script_sources import load_script
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
from unicorn import x86_const as R
T=latest_target(verify=True);assert T['sha256']=='0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
D=target_bytes(T);PE=load_script('timer_metadata_pe',ROOT/'scripts/inventory-executable.py').PE(D)
def raw(a,n):
 try:o=PE.rva_offset(a-PE.image_base)
 except ValueError:return bytes(n)
 if o is None:return bytes(n)
 return D[o:o+n].ljust(n,b'\0')
class Probe:
 def __init__(self,english,selected,index=1,override=None):
  self.u=Uc(UC_ARCH_X86,UC_MODE_64);self.u.mem_map(0x20000000,0x100000);self.u.mem_map(0x30000000,0x100000)
  self.u.reg_write(R.UC_X86_REG_GS_BASE,0x30000000);self.put(0x30000058,0x30001000);self.put(0x30001000,0x30002000)
  self.u.hook_add(UC_HOOK_MEM_UNMAPPED,self.missing);self.u.hook_add(UC_HOOK_CODE,self.hook)
  for a in [0x148214778,0x148214780,0x148214788,0x1482172f0,0x148217160]:self.map(a)
  self.put(0x148214778,0x20010000);self.put(0x148214780,14);self.u.mem_write(0x148214788,struct.pack('<I',0));self.u.mem_write(0x1482172f0,struct.pack('<I',0));self.put(0x148217160,index)
  if override is not None:self.u.mem_write(0x30002330,b'\1');self.put(0x30002338,override)
  for i,value in enumerate([english,selected]+[None]*12):
   h=0x20010000+i*48;ctrl=0x20030000+i*0x100
   if value is None:self.put(h,ctrl,0,0,0);continue
   key,text=value;k=0x20050000+i*0x200;v=k+0x100
   self.u.mem_write(k,key.encode()or b'\0');self.u.mem_write(v,text.encode()or b'\0')
   self.put(ctrl-40,0,k,len(key.encode()),v,len(text.encode()));self.u.mem_write(ctrl,b'\0'+b'\xff'*15);self.put(h,ctrl,0,0,1)
  self.u.mem_write(0x20001000,b'Mortal Wounds');self.seams=set()
 def map(self,a):
  page=a&~4095
  try:self.u.mem_read(page,1)
  except Exception:
   self.u.mem_map(page,4096);self.u.mem_write(page,raw(page,4096))
 def missing(self,u,access,a,n,v,_):
  assert PE.image_base<=a<0x149000000,hex(a)
  self.map(a);return True
 def put(self,a,*v):self.u.mem_write(a,struct.pack('<'+'Q'*len(v),*v))
 def q(self,a):return struct.unpack('<Q',self.u.mem_read(a,8))[0]
 def ret(self,v):
  self.u.reg_write(R.UC_X86_REG_RAX,v);sp=self.u.reg_read(R.UC_X86_REG_RSP);self.u.reg_write(R.UC_X86_REG_RIP,self.q(sp));self.u.reg_write(R.UC_X86_REG_RSP,sp+8)
 def hook(self,u,a,n,_):
  if a==0x20000000:u.emu_stop();return
  c,d,r8=[u.reg_read(x)for x in [R.UC_X86_REG_RCX,R.UC_X86_REG_RDX,R.UC_X86_REG_R8]]
  if a==0x140026790:self.seams.add('hash-zero-singleton');self.ret(0)
  elif a==0x145d14601:
   self.seams.add('byte-compare');left,right=bytes(u.mem_read(c,r8)),bytes(u.mem_read(d,r8));self.ret(int(left!=right))
 def run(self):
  sp=0x2000f008;self.put(sp,0x20000000);self.u.reg_write(R.UC_X86_REG_RSP,sp);self.u.reg_write(R.UC_X86_REG_RCX,0x20001000);self.u.reg_write(R.UC_X86_REG_RDX,13)
  self.u.emu_start(0x1458dff90,0x20000000,count=10000);assert self.u.reg_read(R.UC_X86_REG_RIP)==0x20000000
  p,n=self.u.reg_read(R.UC_X86_REG_RAX),self.u.reg_read(R.UC_X86_REG_RDX)
  return None if p==0 else bytes(self.u.mem_read(p,n)).decode()
cases=[]
for english,selected,index,override,expected in [
 (('Mortal Wounds','English'),('Mortal Wounds','Translated'),1,None,'Translated'),
 (('Mortal Wounds','English'),None,1,None,'English'),
 (None,None,1,None,None),
 (('Mortal Wounds','English'),('Mortal Wounds',''),1,None,''),
 (('Mortal Wounds',''),('Other','Irrelevant'),1,None,''),
 (('Mortal Wounds','English'),('Other','Irrelevant'),1,None,'English'),
 (('Mortal Wounds','English'),('Mortal Wounds','Translated'),0,1,'Translated'),
 (('Mortal Wounds','English'),('Mortal Wounds','Translated'),1,0,'English'),
]:
 p=Probe(english,selected,index,override);actual=p.run();assert actual==expected,(english,selected,index,override,expected,actual)
 cases.append(dict(english=english,selected=selected,index=index,override=override,expected=expected,actual=actual,seams=sorted(p.seams)))
result=dict(target_sha256=T['sha256'],native=dict(start='0x1458dff90',end='0x1458e020a',sha256=hashlib.sha256(raw(0x1458dff90,0x27a)).hexdigest()),cases=cases,limits=['Original native lookup instructions run in isolated Unicorn only; not game/runtime/parity evidence.','Synthetic singleton maps and retained original code; hash and byte compare are explicit host seams.','No locale loading/selection/persistence/rebuild scheduling is executed.'])
destination=ROOT/'docs/analysis/evidence/0.115.0/addon-timers/localizer-cases.json'
if '--write' in sys.argv:
 destination.write_text(json.dumps(result,indent=2,ensure_ascii=False)+'\n')
else:
 assert json.loads(destination.read_text())==json.loads(json.dumps(result))
print('8 current native localization lookup cases pass; explicit singleton hash/byte-compare seams.')
