#!/usr/bin/env python3
"""Replay the bounded lobby refresh gate; queue/ECS seams, no Rust or services."""
import hashlib,itertools,json,math,struct
from coverage_common import ROOT,latest_target,target_bytes
from script_sources import load_script
old=load_script('directory_refresh_ui',ROOT/'scripts/check-coop-ui.py')

def f32(n):return struct.unpack('<f',struct.pack('<f',n))[0]
def bits(n):return struct.pack('<f',n)
def main():
 t=latest_target(verify=True);d=target_bytes(t);pe=load_script('directory_refresh_pe',ROOT/'scripts/inventory-executable.py').PE(d)
 base=ROOT/'docs/analysis/evidence/0.115.0/coop-directory-refresh';m=json.loads((base/'manifest.json').read_text());assert m['target']==t
 h=lambda x:hashlib.sha256(x).hexdigest()
 r=m['function'];a,b=int(r['start'],16),int(r['end_exclusive'],16);o=pe.rva_offset(a-pe.image_base)
 assert o==int(r['file_offset'],16) and h(d[o:o+b-a])==r['sha256']
 assert h((base/r['artifact']).read_bytes())==m['extract_sha256']
 for row in m['literals']:
  o=pe.rva_offset(int(row['address'],16)-pe.image_base);raw=bytes.fromhex(row['bytes_hex']);assert d[o:o+4]==raw and h(raw)==row['sha256']
 result=ROOT/m['ghidra']['result']['path']
 if result.exists():assert h(result.read_bytes())==m['ghidra']['result']['sha256']
 class Probe(old.Native):
  def __init__(self):super().__init__(d,pe,[(a,b)],[0x14012c6a0]);self.count=0
  def hook(self,cpu,pc,size,u):
   if pc!=0x14012c6a0:return super().hook(cpu,pc,size,u)
   assert struct.unpack('<I',cpu.mem_read(self.reg('RDX'),4))[0]==20;self.count+=1
   sp=self.reg('RSP');self.reg('RIP',self.q(sp));self.reg('RSP',sp+8)
  def case(self,opened,tab,role,status,now,last):
   self.cursor=self.HEAP+0x60000;self.cpu.mem_write(self.HEAP,bytes(0x5000));self.count=0
   s=self.HEAP;res=s+0x1000;queue=s+0x2000;tm=s+0x3000;stack=s+0x4000
   self.string(s,status.encode());self.string(s+0x30,role.encode());self.cpu.mem_write(s+0x12c,bytes([opened]));self.cpu.mem_write(s+0x131,bytes([tab]));self.cpu.mem_write(s+0x128,bits(last))
   self.put(res,s,0,res+0x50);self.cpu.mem_write(res+0x1c,struct.pack('<I',17));self.put(queue,queue+0x40);self.put(tm,tm+0x100);self.cpu.mem_write(tm+0x15c,bits(now))
   self.stop=stack+0x100;self.put(stack,self.stop)
   for name,value in [('RCX',0),('RDX',res),('R8',queue),('R9',tm),('RSP',stack)]:self.reg(name,value)
   self.run(a);return bool(self.count),bytes(self.cpu.mem_read(s+0x128,4))
 p=Probe();count=0
 times=[-math.inf,-1.,0.,.001,4.999999,5.,5.000001,10.,math.inf,math.nan]
 lasts=[0.,-0.,.001,1.,5.,math.inf,-math.inf,math.nan]
 for opened,tab,role,status,now,last in itertools.product([0,1],[0,1],['','host'],['off','hosting','joining','joined','left','closed','HOSTING'],times,lasts):
  now,last=f32(now),f32(last)
  expected=bool(opened and not tab and not(role and status in ['hosting','joining','joined','left']) and (last==0. or f32(now-last)>=5.))
  stored=f32(.001 if math.isnan(now) else max(now,f32(.001))) if expected else last
  actual,stamp=p.case(opened,tab,role,status,now,last)
  assert actual==expected and stamp==bits(stored),(opened,tab,role,status,now,last,actual,expected,stamp.hex(),bits(stored).hex());count+=1
 source=(ROOT/'crates/azeroth-survivors-re/src/coop/directory_refresh.rs').read_text()
 for anchor in ['!open','!list_tab','!role.is_empty()','"hosting" | "joining" | "joined" | "left"','*last != 0.0','now - *last >= 5.0','now.max(0.001)']:
  assert anchor in source,anchor
 print(f'PASS:{count} native refresh cases, owner/literal/Ghidra hashes and source guards; no compilation, network, game or parity')
if __name__=='__main__':main()
