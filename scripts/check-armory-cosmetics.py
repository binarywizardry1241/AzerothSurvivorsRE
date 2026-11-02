#!/usr/bin/env python3
"""Check current cosmetic descriptors, native grants, slot projection and card geometry.

Original instructions run with declared allocation/byte/format, ordinary-item
rejection, baseline-outfit and UI-publication seams. No application or IO runs.
"""
from script_sources import load_script
import argparse, hashlib, json, struct, sys
from coverage_common import ROOT,latest_target,target_bytes
from equipment_native import EquipmentProbe
SHA='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
target=latest_target(verify=True);assert target['sha256']==SHA;data=target_bytes(target)
module = load_script('pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
def raw(a,n):offset=pe.rva_offset(a-pe.image_base);return data[offset:offset+n]
def string(a):p,n=struct.unpack('<QQ',raw(a,16));return raw(p,n).decode()
def span(a,b):return dict(va=hex(a),end_exclusive=hex(b),byte_count=b-a,sha256=hashlib.sha256(raw(a,b-a)).hexdigest())
rows=[]
for i in range(7):
 a=0x145e07600+i*64;item,display,inventory=struct.unpack('<III',raw(a+48,12));rows.append(dict(id=item,name=string(a),icon=string(a+16),achievement=string(a+32),display_id=display,inventory_type=inventory,slot=raw(a+60,1)[0]))
assert rows==json.loads((ROOT/'crates/azeroth-survivors-re/assets/armory-cosmetics-0.112.0.json').read_text())['cosmetics']
# The game-side metadata constructor uses an independently embedded copy.
for i,row in enumerate(rows):
 a=0x14721c988+i*64;item,display,inventory=struct.unpack('<III',raw(a+48,12));assert row==dict(id=item,name=string(a),icon=string(a+16),achievement=string(a+32),display_id=display,inventory_type=inventory,slot=raw(a+60,1)[0])
GRANT,PROJECT,METADATA,GETTER,SETTER=0x1459d2a10,0x1458d1d40,0x1459963c0,0x1458da080,0x1458d26d0
class Probe(EquipmentProbe):
 def hook(self,uc,pc,size,unused):
  if any(a<=pc and pc+size<=b for a,b in self.ranges) or pc==self.stop:return super().hook(uc,pc,size,unused)
  rcx,rdx,r8=(self.reg(x)for x in ['RCX','RDX','R8']);handled=True
  if pc==0x145c0a3e7:
   left,right=bytes(self.native.mem_read(rcx,r8)),bytes(self.native.mem_read(rdx,r8));self.reg('RAX',((left>right)-(left<right))&((1<<64)-1))
  elif pc==0x145c0d470:
   stride=self.q(self.reg('RSP')+40);capacity=max(4,self.q(rcx)*2,self.q(rcx+16)+r8);at=self.alloc(capacity*stride)
   if self.q(rcx+16):self.native.mem_write(at,bytes(self.native.mem_read(self.q(rcx+8),self.q(rcx+16)*stride)))
   self.put(rcx,capacity,at)
  elif pc==0x1458d4270:
   values=self.inventory;at=self.alloc(max(len(values)*4,1))
   if values:self.native.mem_write(at,struct.pack('<'+'I'*len(values),*values))
   self.put(rcx,len(values),at,len(values));self.reg('RAX',rcx)
  elif pc==0x145d8d080:
   count=self.q(rcx+16);capacity=max(4,self.q(rcx)*2,count+1);at=self.alloc(capacity*232)
   if count:self.native.mem_write(at,bytes(self.native.mem_read(self.q(rcx+8),count*232)))
   self.put(rcx,capacity,at)
  elif pc==0x1458d1ba0:self.reg('RAX',0) # Ordinary gear rejects every synthetic cosmetic ID.
  elif pc==0x1459956a0:self.native.mem_write(rcx,bytes(19*4));self.reg('RAX',rcx) # No starter outfit contains90101..90107.
  else:handled=False
  if not handled:return super().hook(uc,pc,size,unused)
  self.calls[hex(pc)]=self.calls.get(hex(pc),0)+1;sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp))
probe=Probe(data,pe,[(a,ends[a])for a in [GRANT,PROJECT,METADATA,GETTER,SETTER]])
grant_cases=[]
for mask in range(128):
 keys=sorted(row['achievement']for i,row in enumerate(rows)if mask>>i&1);save=probe.alloc(0x1d0);strings=probe.alloc(max(24*len(keys),1))
 for i,key in enumerate(keys):probe.output(strings+i*24,key)
 probe.put(save+0xa8,len(keys),strings,len(keys));state=probe.alloc(24);probe.put(state,0x145e07600,0x145e07600+7*64,save);out=probe.alloc(24);probe.invoke(GRANT,out,state)
 count=probe.q(out+16);got=list(struct.unpack('<'+'I'*count,probe.native.mem_read(probe.q(out+8),count*4)));want=[row['id']for i,row in enumerate(rows)if mask>>i&1];assert got==want,(mask,got,want);grant_cases.append(dict(mask=mask,ids=got))
projection_cases=[]
for row in rows:
 for slot in range(19):
  for position in [-1,0,15,16]:
   inventory=[1]*max(17,position+1)
   if position>=0:inventory[position]=row['id']
   array=probe.alloc(len(inventory)*4);probe.native.mem_write(array,struct.pack('<'+'I'*len(inventory),*inventory));record=probe.alloc(232);out=probe.alloc(232);probe.native.mem_write(record,bytes(232));probe.native.mem_write(record+slot*8,struct.pack('<II',1,row['id']));probe.native.mem_write(record+0xe4,b'\x01')
   sp=probe.STACK+0x1f0008;probe.put(sp+40,1);probe.reg('R9',len(inventory));probe.invoke(PROJECT,out,record,array)
   kept=probe.q(out+slot*8)&0xffffffff==1;want=slot==row['slot']and position>=0;assert kept==want,(row['id'],slot,position,kept,want)
   projection_cases.append(dict(id=row['id'],slot=slot,owned_position=position,kept=kept))
getter_cases=[]
for row in rows:
 for exists,earned in [(False,False),(True,False),(True,True)]:
  save=probe.alloc(0x1d0);record=probe.alloc(232);out=probe.alloc(232);probe.native.mem_write(record+row['slot']*8,struct.pack('<II',1,row['id']));probe.native.mem_write(record+0xe4,b'\x01')
  if exists:probe.put(save+0x48,1,record,1)
  probe.inventory=[row['id']]if earned else[];probe.reg('R9',1);probe.invoke(GETTER,out,save,1)
  kept=probe.q(out+row['slot']*8)&0xffffffff==1;assert kept==(exists and earned)
  # The getter projects a clone. Only the explicit setter publishes its row.
  assert probe.q(save+0x58)==int(exists)
  probe.invoke(SETTER,save,out);assert probe.q(save+0x58)==1
  stored=probe.q(save+0x50);assert bytes(probe.native.mem_read(stored,232))==bytes(probe.native.mem_read(out,232))
  getter_cases.append(dict(id=row['id'],existing_class=exists,earned=earned,kept=kept))
metadata=[]
for row in rows:
 out=probe.alloc(112);probe.invoke(METADATA,out,row['id']);name=probe.pair(out+8);quality=probe.q(out+32);display=struct.unpack('<I',probe.native.mem_read(out+84,4))[0];inventory=struct.unpack('<I',probe.native.mem_read(out+96,4))[0];slot=probe.native.mem_read(out+104,1)[0]
 assert (name,quality,display,inventory,slot)==(row['name'],4,row['display_id'],row['inventory_type'],row['slot']),(row['id'],name,quality,display,inventory,slot)
 metadata.append(dict(id=row['id'],quality=quality,display_id=display,inventory_type=inventory,slot=slot))
record=dict(target_sha256=SHA,application_executed=False,rebuilt_code_executed=False,native_instructions_executed=True,tables=[span(0x145e07600,0x145e077c0),span(0x14721c988,0x14721cb48)],owners={name:span(a,ends[a])for name,a in [('grants',GRANT),('projector',PROJECT),('metadata',METADATA),('getter',GETTER),('setter',SETTER)]},grant_masks=len(grant_cases),grant_digest=hashlib.sha256(json.dumps(grant_cases,separators=(',',':')).encode()).hexdigest(),projection_cases=len(projection_cases),projection_digest=hashlib.sha256(json.dumps(projection_cases,separators=(',',':')).encode()).hexdigest(),metadata=metadata,getter_setter=getter_cases,calls=probe.calls,limits=['All128 achievement masks execute the current grant iterator.','Each of7cosmetics is projected through all19slots with absent, first, SIMD-lane and scalar-tail inventory positions.','Allocator, Vec growth, byte comparison/copy, format/locale lookup, ordinary-item rejection and baseline outfit are explicit seams.','Combined inventory is an explicit typed seam for getter/setter cases; cosmetic grants are independently executed for all128 masks. Synthetic cosmetics never pass ordinary item/equipment admission. No filesystem, rebuilt save pipeline or application is executed.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args();path=ROOT/('runtime/native-evidence/0.112.0/armory-cosmetics'if args.stage else'docs/analysis/evidence/0.112.0/armory-cosmetics')/'cases.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print('Passed 7 exact cosmetics/2 table copies, 128 native grant masks, 532 slot projections, 21 getter/setter sequences and 7 item metadata cases')
