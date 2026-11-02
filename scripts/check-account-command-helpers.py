#!/usr/bin/env python3
"""Original account Rewards/Pets helper execution with explicit native metadata/heap seams."""
import sys,json,struct,itertools,hashlib,argparse
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]));from native_save_fixture import CPU,SHA
from unicorn.x86_const import *
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'));asset=json.loads((ROOT/'crates/azeroth-survivors-re/assets/progression.json').read_text());c=CPU();added=[0x1458d7780,0x1458d8080,0x1458d7590,0x1459cbdd0,0x1459bae00,0x1459c7c20,0x1459cdc50,0x145bcd2f0,0x1458bb9f0,0x1458e5690,0x140261c80]
for a in added:c.allow_owner(a)
c.admit={a for a in c.admit if not 0x1458e54e0<=a<0x1458e5689};c.allow_range(0x1458e54e0,0x1458e5689)

def text(a,value):
 raw=value.encode();p=c.alloc(max(len(raw),1));c.u.mem_write(p,raw or b'\0');c.put(a,len(raw),p,len(raw))
def sval(a):return bytes(c.u.mem_read(c.q(a+8),c.q(a+16))).decode()
def parsed(plain):
 achievements=next((line[4:].split(",") for line in plain.splitlines() if line.startswith("ach|")),[])
 c.parse("\n".join(line for line in plain.splitlines() if not line.startswith("ach|")))
 if achievements:
  achievements=sorted(set(achievements));ptr=c.alloc(len(achievements)*24)
  for i,key in enumerate(achievements):text(ptr+i*24,key)
  c.put(c.H+0xa8,len(achievements),ptr,len(achievements))
 # Registry row13 holds achievement definitions, independently checked by the
 # full current catalog constructor. Only key/points are read by this helper.
 rows=asset['achievements'];at=c.alloc(len(rows)*112);c.u.mem_write(at,bytes(len(rows)*112))
 for i,row in enumerate(rows):
  text(at+i*112,row['key']);c.u.mem_write(at+i*112+104,struct.pack('<I',row['points']))
 c.put(0x14808a3e8+13*32,0,at,len(rows));c.u.mem_write(0x14808a3e8+13*32+24,bytes(8));c.put(0x14808d0d0,14)
 return c.H

def plan(perks,tabards):
 out=c.alloc(48);rows=c.alloc(max(32*len(perks),8));c.u.mem_write(rows,bytes(max(32*len(perks),8)))
 for i,(key,rank)in enumerate(sorted(perks.items())):text(rows+32*i,key);c.u.mem_write(rows+32*i+24,bytes([rank]))
 ptr=c.alloc(max(4*len(tabards),4))
 if tabards:c.u.mem_write(ptr,struct.pack('<'+'I'*len(tabards),*tabards))
 c.put(out,len(perks),rows,len(perks),len(tabards),ptr,len(tabards));return out

def read_perks(save):
 return {sval(c.q(save+0xf8)+i*32):c.u.mem_read(c.q(save+0xf8)+i*32+24,1)[0]for i in range(c.q(save+0x100))}
def read_tabards(save):return [c.ui(c.q(save+0x110)+i*4)for i in range(c.q(save+0x118))]
def expected(owned,earned,oldtabs,perks,tabards):
 meta={row['key']:row for row in asset['perks']}
 if any(perks.get(key,0)<rank for key,rank in owned.items()):return False
 if not set(oldtabs)<=set(tabards):return False
 for key,rank in perks.items():
  if key not in meta or rank>len(meta[key]['costs']):return False
  row=meta[key]
  if rank>owned.get(key,0)and row['achievement']not in earned:return False
  if row.get('prerequisite')and not perks.get(row['prerequisite'],0):return False
 slots=int(perks.get('companion',0)>0)+int(perks.get('second',0)>0)
 if sum(perks.get(key,0)>0 for key in ['instinct_gold','instinct_wisps','instinct_runes'])>slots:return False
 tabs={row['id']:row for row in asset['tabards']}
 if any(t not in tabs or tabs[t].get('zone')is not None for t in tabards):return False
 cost=sum(sum(meta[k]['costs'][:v])for k,v in perks.items())+sum(tabs[t]['cost']for t in set(tabards))
 return cost<=sum(row['points']for row in asset['achievements']if row['key']in earned)

allach=[row['key']for row in asset['achievements']];rewardcases=[]
requests=[({},[]),({'unknown':0},[]),({'unknown':1},[])]
for row in asset['perks']:
 for rank in [0,1,len(row['costs']),len(row['costs'])+1]:requests.append(({row['key']:rank},[]))
for row in asset['tabards']:requests.append(({},[row['id'],row['id']]))
requests.extend([({'companion':1,'second':1,'instinct_gold':1,'instinct_wisps':1},[]),({'companion':1,'instinct_gold':1,'instinct_wisps':1},[]),({'second':0,'companion':0},[])])
for owned,ach,oldtabs in [({},[],[]),({},allach,[]),({'rerolls':1},allach,[]),({},allach,[90011])]:
 plain=('ach|'+','.join(ach)+'\n'if ach else'')+('perk|'+','.join(f'{k}:{v}'for k,v in owned.items())+'\n'if owned else'')+('tabard|'+','.join(map(str,oldtabs))+'\n'if oldtabs else'')+'pets|rabbit,owl\nresets|2\nstat|kills=77\n'
 for perks,tabards in requests:
  parsed(plain);ptr=plan(perks,tabards);want=expected(owned,set(ach),oldtabs,perks,tabards);got=c.call(0x1458d8080,ptr,c.H)&255
  assert got==want,(owned,len(ach),oldtabs,perks,tabards,got,want)
  assert read_perks(c.H)==(perks if want else owned),(perks,got,read_perks(c.H))
  assert read_tabards(c.H)==(sorted(set(tabards))if want else oldtabs)
  assert c.q(c.H+0xc50-0xb20)==2 # pets count remains2
  assert c.ui(c.H+0x1c8)==2
  serialized_perks=next((line for line in c.serialize(c.H).splitlines()if line.startswith('perk|')),'')
  assert serialized_perks==('perk|'+','.join(f'{key}:{rank}'for key,rank in sorted((perks if want else owned).items()))if(perks if want else owned)else'')
  rewardcases.append(dict(owned=owned,earned='all'if ach else'none',owned_tabards=oldtabs,request=perks,tabards=tabards,accepted=want,serialized_perks=serialized_perks))

# Replay Reset through the full dispatcher after the actual accepted plan,
# separately with and without the real file parser between those two commands.
# This owns no duplicate native extract: reuse the canonical dispatcher range.
dispatcher=json.loads((ROOT/'docs/analysis/evidence/0.109.0/terminal-flow/manifest.json').read_text())
dispatch_owner=next(row for row in dispatcher['ranges']if row['role']=='dispatcher')
assert hashlib.sha256(c.raw(0x1458bb9f0,0x1458bd2a8)).hexdigest()==dispatch_owner['sha256']
def reset_after_plan(resets):
 server=c.H+0x8000;save=server+0xb20;command=c.H+0xb000
 c.u.mem_write(save,bytes(c.u.mem_read(c.H,0x1d0)))
 c.u.mem_write(save+0x1c8,struct.pack('<I',resets));c.u.mem_write(command,struct.pack('<I',18)+bytes(252));writes=[]
 def hook(cpu,a):
  if a==0x145bf95a0:pass # stack probe: fixture stack is already mapped
  elif a==0x1458a33c0:
   assert c.reg(UC_X86_REG_RCX)==save;writes.append(True)
  else:return False
  c._return();return True
 c.extensions.insert(0,hook)
 try:c.call(0x1458bb9f0,server,command)
 finally:c.extensions.remove(hook)
 return dict(writes=len(writes),resets=c.ui(save+0x1c8),perks=read_perks(save),serialized_perks=next((line for line in c.serialize(save).splitlines()if line.startswith('perk|')),''))
# Sidebar admission block reads the already computed saturating remaining
# reset count, edited flag and owned vector. Execute its current instructions;
# this does not pretend to run the renderer/query or alter input-time admission.
rewards_manifest=json.loads((ROOT/'docs/analysis/evidence/0.109.0/rewards-menu/manifest.json').read_text())
for role in ['reset','sidebar']:
 owner=next(row for row in rewards_manifest['functions']if row['name']==role)
 assert hashlib.sha256(c.raw(int(owner['address'],16),int(owner['end_exclusive'],16))).hexdigest()==owner['sha256']
def sidebar_reset(resets,edited):
 bp=c.H+0xe000;c.u.reg_write(UC_X86_REG_RBP,bp)
 c.put(bp+0x190,c.H);c.stops.add(0x140262b9e)
 try:c.call(0x140262a7a)
 finally:c.stops.remove(0x140262b9e)
 assert c.ui(bp+0x340)==max(0,2-resets)
 c.u.mem_write(bp+0x18c,struct.pack('<I',int(edited)));c.put(bp-0x20,c.H+0xf0);c.stops.add(0x1402630f9)
 try:c.call(0x1402630d5)
 finally:c.stops.remove(0x1402630f9)
 return bool(c.reg(UC_X86_REG_RDX)&255)
lifecyclecases=[]
zero_keys=sorted({next(iter(row['request']))for row in rewardcases if row['accepted']and row['earned']=='none'and not row['owned']and len(row['request'])==1 and next(iter(row['request'].values()))==0})
assert zero_keys
for key in zero_keys:
 for resets,reload in itertools.product([0,1,2,0xffffffff],[False,True]):
  parsed('pets|rabbit\nstat|kills=77\n');assert c.call(0x1458d8080,plan({key:0},[]),c.H)&255
  before=c.serialize(c.H);assert 'perk|'+key+':0\n'in before
  if reload:parsed(before)
  want_perks={}if reload else{key:0};assert read_perks(c.H)==want_perks
  c.u.mem_write(c.H+0x1c8,struct.pack('<I',resets))
  ui_enabled=[sidebar_reset(resets,edited)for edited in [False,True]]
  accepted=not reload and resets<2
  assert ui_enabled==[accepted,False]
  original=bytes(c.u.mem_read(c.H,0x1d0));ui_accepted=bool(c.call(0x1458e5690,c.H)&255)
  assert ui_accepted==accepted
  assert c.ui(c.H+0x1c8)==resets+int(accepted)
  assert read_perks(c.H)==({}if accepted else want_perks)
  assert c.q(c.H+0x130)==1 # frontend Reset preserves the single Pets slot
  c.u.mem_write(c.H,original)
  result=reset_after_plan(resets)
  assert result['writes']==int(accepted)
  assert result['resets']==resets+int(accepted)
  assert result['perks']==({}if accepted else want_perks)
  assert next(line for line in c.serialize(c.H+0x8000+0xb20).splitlines()if line.startswith('pets|'))=='pets|rabbit'
  lifecyclecases.append(dict(key=key,reload=reload,resets_before=resets,serialized_before='perk|'+key+':0',sidebar_enabled=ui_enabled,frontend_reset_accepted=ui_accepted,**result))

petcases=[]
inputs=[[],['squirrel'],['rabbit'],['unknown'],['rabbit','owl'],['owl','rabbit'],['rabbit','rabbit'],['unknown','owl','squirrel']]+[[row['key']]for row in asset['companions']]
for earned in [[],['zone:duskwood'],allach]:
 for values in inputs:
  parsed('ach|'+','.join(earned)+'\nstat|kills=77\nresets|4294967295\n');it=c.alloc(32);rows=c.alloc(max(24*len(values),8))
  for i,key in enumerate(values):text(rows+i*24,key)
  c.put(it,rows,rows+len(values)*24,2,c.H);out=c.H+0x8000;c.call(0x1459c7c20,out,it)
  got=[sval(c.q(out+8)+i*24)for i in range(c.q(out+16))]
  meta={row['key']:row for row in asset['companions']};want=[key if key in meta and(meta[key].get('achievement')is None or meta[key]['achievement']in earned)else'squirrel'for key in values[:2]]
  assert got==want,(values,earned,got,want)
  petcases.append(dict(earned=earned,input=values,output=got))
print(len(rewardcases),'Rewards plans,',len(petcases),'Pets payloads and',len(lifecyclecases),'zero-rank serialize/reload/Reset sequences passed')
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args()
out=ROOT/'docs/analysis/evidence/0.109.0/account-command-helpers'
if args.write:out.mkdir(parents=True,exist_ok=True)
# Reuse current helper owners rather than copying their existing extracts.
canonical={}
for path in ['rewards-menu/manifest.json','save-schema/manifest.json','achievements-menu/catalog.json','terminal-flow/manifest.json']:
 file=out.parent/path;canonical[path]=hashlib.sha256(file.read_bytes()).hexdigest()
new=[]
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
md=Cs(CS_ARCH_X86,CS_MODE_64)
for role,a in [('owned-perks-clone',0x1459cbdd0),('instinct-count',0x1459bae00),('pets-collect',0x1459c7c20),('pets-map',0x1459cdc50)]:
 b=c.ends[a];raw=c.raw(a,b);ins=list(md.disasm(raw,a));assert sum(i.size for i in ins)==len(raw)
 assembly=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins)
 file=out/(role+'.asm')
 if args.write:file.write_text(assembly)
 else:assert file.read_text()==assembly
 new.append(dict(role=role,start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw).hexdigest(),assembly=file.name))
rea=[]
for i,a in enumerate([0x1459bae00,0x1459cbdd0,0x1459c7c20,0x1459cdc50],3):
 file=ROOT/f'runtime/fixgap11-17/backend-helpers/rea/{i:03d}-procedure_pseudo_code.json'
 if file.exists():
  item=json.loads(file.read_text())['response']['result']['structuredContent'];rea.append(dict(procedure=hex(a),evidence_id=item['evidence_id'],subject_sha256=item['subject']['digest']['sha256'],analysis_profile_digest=item['analysis_profile']['digest']))
if not rea:rea=json.loads((out/'manifest.json').read_text())['ghidra']
manifest=dict(target_sha256=SHA,source_catalog_sha256=hashlib.sha256((ROOT/'crates/azeroth-survivors-re/assets/progression.json').read_bytes()).hexdigest(),new_ranges=new,ghidra=rea,canonical_owners=canonical,checks=dict(rewards=len(rewardcases),pets=len(petcases),zero_rank_lifecycle=len(lifecyclecases)),limits=['Actual full current plan validator/application, costs/prerequisite/monotone ownership, serializer, parser and Pets collector/map instructions execute. Full dispatcher Reset follows accepted zero-rank plans with/without a real parse reload; the current frontend Reset helper and selected sidebar admission blocks also execute. Single-slot Pets state remains unchanged. Stack-probe and ordinary-write capture are declared seams.','Achievement registry key/point metadata is a typed fixture, independently bound by the complete current73-entry constructor report. Its native lazy initialization and generic engine registry are not executed.','Typed Save achievement strings are supplied as sorted fixtures; other Save fields use the existing native parser. Allocation/free/growth/memcpy/memcmp and shared source item metadata have declared fixture seams.','No Rust/compiler, real file or device access, native process, scheduler, game or rendering executes.'])
for name,value in [('manifest.json',manifest),('native-vectors.json',dict(rewards=rewardcases,pets=petcases,zero_rank_lifecycle=lifecyclecases))]:
 text=json.dumps(value,separators=(',',':'))+'\n';file=out/name
 if args.write:file.write_text(text)
 else:assert file.read_text()==text,name
