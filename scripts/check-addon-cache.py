#!/usr/bin/env python3
"""Replay bounded current addon cache instructions with explicit host seams; no build/game."""
from pathlib import Path
import sys,struct,json,hashlib,math
ROOT=Path(__file__).resolve().parents[1]
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/armory-recovery/python-libs')]
from coverage_common import latest_target,target_bytes
from script_sources import load_script
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
from unicorn import x86_const as R
T=latest_target(verify=True);assert T['sha256']=='0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
D=target_bytes(T);PE=load_script('cache_fixture_pe',ROOT/'scripts/inventory-executable.py').PE(D)
def raw(a,n):
 o=PE.rva_offset(a-PE.image_base);v=D[o:o+n];assert len(v)==n;return v
class Probe:
 def __init__(self):
  self.u=Uc(UC_ARCH_X86,UC_MODE_64);self.u.mem_map(0x20000000,0x20000);self.u.mem_map(0x30000000,0x10000)
  self.u.mem_write(0x30000000,b'\xa5'*0x2000);self.u.mem_write(0x20000000,b'\xa5'*0x10000)
  self.u.reg_write(R.UC_X86_REG_RSI,0x30000000);self.u.reg_write(R.UC_X86_REG_RBP,0x20001000);self.u.reg_write(R.UC_X86_REG_RSP,0x20018008)
  self.u.mem_write(0x30001740,struct.pack('<d',42.));self.u.hook_add(UC_HOOK_MEM_UNMAPPED,self.missing);self.u.hook_add(UC_HOOK_CODE,self.hook);self.stops=set();self.seams=[]
 def missing(self,u,access,a,n,v,_):
  assert PE.image_base<=a<0x149000000,hex(a)
  page=a&~4095;u.mem_map(page,4096);u.mem_write(page,raw(page,4096));return True
 def q(self,a):return struct.unpack('<Q',self.u.mem_read(a,8))[0]
 def put(self,a,*v):self.u.mem_write(a,struct.pack('<'+'Q'*len(v),*v))
 def ret(self,v=0):
  self.u.reg_write(R.UC_X86_REG_RAX,v);sp=self.u.reg_read(R.UC_X86_REG_RSP);self.u.reg_write(R.UC_X86_REG_RIP,self.q(sp));self.u.reg_write(R.UC_X86_REG_RSP,sp+8)
 def hook(self,u,a,n,_):
  if a in self.stops:u.emu_stop();return
  c,d,r8=[u.reg_read(x)for x in [R.UC_X86_REG_RCX,R.UC_X86_REG_RDX,R.UC_X86_REG_R8]]
  if a==0x1400021d0:self.seams.append('free-storage');self.ret()
  elif a==0x145d145fb:self.seams.append('copy-storage');u.mem_write(c,bytes(u.mem_read(d,r8)));self.ret(c)
 def run(self,a,*stops):
  self.stops=set(stops);self.u.emu_start(a,0,count=20000);pc=self.u.reg_read(R.UC_X86_REG_RIP);assert pc in self.stops,hex(pc);return pc
slots=[0x11d8]+[0x11f0+i*24 for i in range(19)]
cases=[]
p=Probe();p.run(0x145876df5,0x145876f5d);p.run(0x1458770fc,0x1458771d6)
for offset in slots:assert [p.q(0x30000000+offset+i*8)for i in range(3)]==[0,1,0],hex(offset)
assert struct.unpack('<d',p.u.mem_read(0x30001740,8))[0]==0
assert p.q(0x30001748)==0
cases.append(dict(kind='constructor',empty_slots=len(slots),poll_clock=0.,target=0,seams=p.seams))
for kind,a,b in [('successful-new-game-login',0x1458854a8,0x145885893),('successful-new-game-again',0x14588cd83,0x14588d028)]:
 p=Probe();p.run(a,b)
 for offset in slots:
  assert p.q(0x30000000+offset+16)==0,(kind,hex(offset))
  if offset!=0x11d8:assert [p.q(0x30000000+offset+i*8)for i in range(3)]==[0,1,0],(kind,hex(offset))
 assert p.q(0x300011d8)==0xa5a5a5a5a5a5a5a5 and p.q(0x300011e0)==0xa5a5a5a5a5a5a5a5
 assert struct.unpack('<d',p.u.mem_read(0x30001740,8))[0]==42.
 assert p.q(0x30001748)==0
 cases.append(dict(kind=kind,empty_slots=len(slots),poll_clock=42.,target=0,stats_allocation_retained=True,seams=p.seams))
for now in [0.,.199,.2,.25,math.nan]:
 p=Probe();p.put(0x20001e00,0x30000000);p.u.reg_write(R.UC_X86_REG_XMM6,int.from_bytes(struct.pack('<d',now),'little'));p.u.mem_write(0x30001740,struct.pack('<d',0.));p.u.mem_write(0x30000c58,struct.pack('<I',2));p.u.mem_write(0x30000f49,b'\0');p.u.mem_write(0x30000010,struct.pack('<I',2))
 stop=p.run(0x14587d6d9,0x14587de91,0x14587d718);changed=stop==0x14587d718;assert changed==(now>=.2)
 value=struct.unpack('<d',p.u.mem_read(0x30001740,8))[0];assert value==(now if changed else 0.)
 cases.append(dict(kind='poll-gate-before-game-absent-branch',input='nan'if math.isnan(now)else now,poll_advanced=changed,stored_clock=value))
ranges=[(0x145876df5,0x145876f5d),(0x1458770fc,0x1458771d6),(0x1458854a8,0x145885893),(0x14588cd83,0x14588d028),(0x14584d410,0x14584d55a),(0x14587d6d9,0x14587d718)]
record=dict(target_sha256=T['sha256'],ranges=[dict(start=hex(a),end=hex(b),sha256=hashlib.sha256(raw(a,b-a)).hexdigest(),file_offset=hex(PE.rva_offset(a-PE.image_base)))for a,b in ranges],cases=cases,limits=['Isolated original-instruction replay only, no game/build/runtime/parity evidence.','Allocation/free and byte copy have explicit storage seams; current 19-string helper executes original bytes.','Reset slices begin only after admitted successful Game creation; Game creation itself, requests, menu/ReloadUI dispatch and world/client execution are not replayed.'])
destination=ROOT/'docs/analysis/evidence/0.115.0/addon-timers/cache-cases.json'
if '--write' in sys.argv:
 destination.write_text(json.dumps(record,indent=2)+'\n')
else:
 assert json.loads(destination.read_text())==record
print('PASS:3 current20-slot cache lifetime cases and5 original poll-gate cases; original19-string helper, storage-only seams.')
