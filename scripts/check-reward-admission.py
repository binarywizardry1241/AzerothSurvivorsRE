#!/usr/bin/env python3
"""Replay current Rewards plan admission/application and pet normalization, without IO."""
from script_sources import load_script
import argparse, hashlib, itertools, json, struct
from coverage_common import ROOT,latest_target,target_bytes
from equipment_native import EquipmentProbe
SHA='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a';t=latest_target(verify=True);assert t['sha256']==SHA;data=target_bytes(t)
m = load_script('i', ROOT/'scripts/inventory-executable.py');pe=m.PE(data);ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
asset=json.loads((ROOT/'crates/azeroth-survivors-re/assets/rewards-catalogs-0.112.0.json').read_text());perks={r['key']:r for r in asset['perks']};pets={r['key']:r for r in asset['companions']};tabs={r['id']:r for r in asset['tabards']}
OWNERS=dict(validator=0x1459aadc0,apply=0x1459ab6c0,spent=0x1459aabd0,perks_clone=0x1459dc1e0,instincts=0x1459ca500,pets_collect=0x1459d7ac0,pets_map=0x1459ef480,pets_get=0x1459b74d0)
class Probe(EquipmentProbe):
 def hook(self,uc,pc,size,unused):
  if pc==self.stop or any(a<=pc and pc+size<=b for a,b in self.ranges):return super().hook(uc,pc,size,unused)
  rcx,rdx,r8=(self.reg(x)for x in ['RCX','RDX','R8']);handled=True
  if pc==0x145c0a3e7:
   a,b=bytes(self.native.mem_read(rcx,r8)),bytes(self.native.mem_read(rdx,r8));self.reg('RAX',((a>b)-(a<b))&((1<<64)-1))
  elif pc==0x145c0d470:
   stride=self.q(self.reg('RSP')+40);cap=max(4,self.q(rcx)*2,self.q(rcx+16)+r8);at=self.alloc(cap*stride)
   if self.q(rcx+16):self.native.mem_write(at,bytes(self.native.mem_read(self.q(rcx+8),self.q(rcx+16)*stride)))
   self.put(rcx,cap,at)
  elif pc==0x1459b75f0:
   key=self.text(rcx,rdx);self.reg('RAX',next((0x145e09670+i*120 for i,row in enumerate(asset['perks'])if row['key']==key),0))
  elif pc==0x1459c3170:
   key=self.text(rcx,rdx);self.reg('RAX',next((0x147245168+i*96 for i,row in enumerate(asset['companions'])if row['key']==key),0))
  else:handled=False
  if not handled:return super().hook(uc,pc,size,unused)
  self.calls[hex(pc)]=self.calls.get(hex(pc),0)+1;sp=self.reg('RSP');self.reg('RSP',sp+8);self.reg('RIP',self.q(sp))
c=Probe(data,pe,[(a,ends[a])for a in OWNERS.values()])
# Typed registry seam: complete84 current achievement keys/points are separately
# checked by the native constructor, not inferred from historical award rules.
registry=c.alloc(84*112)
for i,row in enumerate(asset['achievements']):c.output(registry+i*112,row['key']);c.native.mem_write(registry+i*112+104,struct.pack('<I',row['points']))
c.put(0x14809a690+13*32,0,registry,84,0);c.put(0x14809d0d8,14)
def strings(values):
 ptr=c.alloc(max(len(values)*24,1))
 for i,key in enumerate(values):c.output(ptr+i*24,key)
 return ptr
def plan(perks,tabards):
 out=c.alloc(48);at=c.alloc(max(32*len(perks),1))
 for i,(key,rank)in enumerate(sorted(perks.items())):c.output(at+i*32,key);c.native.mem_write(at+i*32+24,bytes([rank]))
 ts=c.alloc(max(4*len(tabards),1))
 if tabards:c.native.mem_write(ts,struct.pack('<'+'I'*len(tabards),*tabards))
 c.put(out,len(perks),at,len(perks),len(tabards),ts,len(tabards));return out
def save(owned,earned,tabards):
 out=c.alloc(0x1d0);ptr=plan(owned,tabards);c.native.mem_write(out+0xf0,bytes(c.native.mem_read(ptr,48)));keys=sorted(set(earned));c.put(out+0xa8,len(keys),strings(keys),len(keys));return out
def expected(owned,earned,oldtabs,request,tabards):
 if any(request.get(k,0)<v for k,v in owned.items())or not set(oldtabs)<=set(tabards):return False
 for k,v in request.items():
  if k not in perks or v>len(perks[k]['costs']):return False
  row=perks[k]
  if v>owned.get(k,0)and row['achievement']not in earned:return False
  if row['prerequisite']and not request.get(row['prerequisite'],0):return False
 slots=int(request.get('companion',0)>0)+int(request.get('second',0)>0)
 if sum(request.get(k,0)>0 for k in ['instinct_gold','instinct_wisps','instinct_runes'])>slots:return False
 if any(k not in tabs or tabs[k]['zone']is not None for k in tabards):return False
 cost=sum(sum(perks[k]['costs'][:v])for k,v in request.items())+sum(tabs[k]['cost']for k in tabards)
 return cost<=sum(row['points']for row in asset['achievements']if row['key']in earned)
requests=[({},[]),({'unknown':0},[]),({'unknown':1},[])]
for row in asset['perks']:
 for rank in [0,1,len(row['costs']),len(row['costs'])+1]:requests.append(({row['key']:rank},[]))
requests += [({},[row['id']])for row in asset['tabards']]
requests += [({'companion':1,'second':1,'instinct_gold':1,'instinct_wisps':1},[]),({'companion':1,'instinct_gold':1,'instinct_wisps':1},[]),({'second':0,'companion':0},[])]
allach=[r['key']for r in asset['achievements']];reward_cases=[]
for owned,earned,oldtabs in [({},[],[]),({},allach,[]),({'rerolls':1},allach,[]),({},allach,[90011])]:
 for request,tabards in requests:
  value=save(owned,earned,oldtabs);candidate=plan(request,tabards);c.invoke(OWNERS['apply'],candidate,value);accepted=bool(c.reg('RAX')&255);want=expected(owned,set(earned),oldtabs,request,tabards);assert accepted==want,(owned,len(earned),oldtabs,request,tabards,accepted,want)
  got={c.pair(c.q(value+0xf8)+i*32+8):c.native.mem_read(c.q(value+0xf8)+i*32+24,1)[0]for i in range(c.q(value+0x100))};assert got==(request if want else owned)
  reward_cases.append(dict(owned=owned,earned='all'if earned else'none',owned_tabards=oldtabs,request=request,tabards=tabards,accepted=accepted))
pet_cases=[]
inputs=[[],['unknown'],['rabbit','owl','squirrel'],['owl','rabbit'],['rabbit','rabbit']]+[[r['key']]for r in asset['companions']]
for earned in [[],['zone:duskwood'],allach]:
 for keys in inputs:
  value=save({},earned,[]);at=strings(keys);iterator=c.alloc(32);c.put(iterator,at,at+len(keys)*24,2,value);output=c.alloc(24);c.invoke(OWNERS['pets_collect'],output,iterator);got=[c.pair(c.q(output+8)+i*24+8)for i in range(c.q(output+16))];want=[key if key in pets and (pets[key]['achievement']is None or pets[key]['achievement']in earned) else'squirrel'for key in keys[:2]];assert got==want,(keys,earned,got,want)
  # The actual actor-side getter independently applies the same admission and
  # returns squirrel when the requested slot is absent or invalid.
  c.put(value+0x120,len(keys),at,len(keys))
  for index in range(3):
   c.invoke(OWNERS['pets_get'],value,index);descriptor=c.reg('RAX');key=c.pair(descriptor);keywant=want[index]if index<len(want)else'squirrel';assert key==keywant
  pet_cases.append(dict(earned='all'if earned==allach else earned,input=keys,output=got))
def span(a):
 b=ends[a];at=pe.rva_offset(a-pe.image_base);return dict(va=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(data[at:at+b-a]).hexdigest())
record=dict(target_sha256=SHA,application_executed=False,rebuilt_code_executed=False,native_instructions_executed=True,owners={k:span(a)for k,a in OWNERS.items()},rewards=reward_cases,pets=pet_cases,limits=['Current complete validator/application, spending, clone, instinct collector and pet collector/map/getter instructions execute.','Allocator, Vec growth, bytes, String cloning, current perk/companion lookup and complete84-entry key/point registry are explicit typed seams.','No native file parser, serializer, OS operation, ECS scheduler, game process or rebuilt Rust executes. Historical save and UI lifecycle evidence retains its own provenance.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args();path=ROOT/('runtime/analysis/staging/native-evidence/0.112.0/reward-admission'if args.stage else'docs/analysis/evidence/0.112.0/reward-admission')/'cases.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print(f'Passed {len(reward_cases)} current Rewards admission/application and {len(pet_cases)} pet normalization cases with 243 actor getter projections')
