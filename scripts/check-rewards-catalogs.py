#!/usr/bin/env python3
"""Check current achievement menu definitions via original constructor and gear iterator.

Explicit boundaries are allocator/Vec growth, locale miss, compact format and
placeholder substitution. Unknown calls fail closed. No OS/game/save is run.
"""
from script_sources import load_script
from pathlib import Path
import sys, struct, json, hashlib
R=Path(__file__).resolve().parents[1];sys.path.insert(0,str(R/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
m = load_script('iv', R/'scripts/inventory-executable.py')
from coverage_common import latest_target,target_bytes
target=latest_target(verify=True);assert target['sha256']=='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a';d=target_bytes(target);p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000
u.mem_map(HEAP,0x1000000);u.mem_map(STACK,0x200000);u.mem_map(STOP,4096);next_heap=HEAP+0x1000
calls={};formats=[];replacements=[];gear_ids={};ADMITTED=[(0x1459adf40,0x1459b307f),(0x1459d3570,0x1459d3a3b)]
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
def text(a,n):return bytes(u.mem_read(a,n)).decode()
def pair(a):return text(q(a),q(a+8))
def alloc(n):
 global next_heap
 a=next_heap;next_heap+=(n+15)&~15;u.mem_write(a,bytes(n));return a
def outstr(dest,v):
 raw=v.encode();a=alloc(len(raw)+1);u.mem_write(a,raw);u.mem_write(dest,struct.pack('<QQQ',len(raw),a,len(raw)))
def fmarg(a):
 at,fun=q(a),q(a+8)
 if fun>=0x145da0000:fun=q(fun+24)
 if fun==0x1400020c0:return pair(at)
 if fun==0x1400020e0:return pair(at+8)
 if fun==0x145beebe0:return str(struct.unpack('<I',u.mem_read(at,4))[0])
 if fun==0x145befad0:return str(q(at))
 raise RuntimeError('unreviewed formatter '+hex(fun))
def hook(_,a,n,unused):
 if a==0x1459d3a3a:
  dest=u.reg_read(UC_X86_REG_RAX);values=list(struct.unpack('<'+'I'*q(dest+16),u.mem_read(q(dest+8),q(dest+16)*4)));gear_ids[values[0]//1000%100 if values else 0]=values
 if any(start<=a<end for start,end in ADMITTED):return
 if a==STOP:u.emu_stop();return
 calls[a]=calls.get(a,0)+1
 rcx=u.reg_read(UC_X86_REG_RCX);rdx=u.reg_read(UC_X86_REG_RDX);r8=u.reg_read(UC_X86_REG_R8);r9=u.reg_read(UC_X86_REG_R9);sp=u.reg_read(UC_X86_REG_RSP)
 if a==0x145c10140:
  if q(rcx)==0:wq(rcx+8,alloc(256*112))
  assert q(rcx+16)<256;wq(rcx,256)
 elif a==0x145c0d470:
  size=q(sp+0x28);new=max(256,q(rcx)*2,rdx+r8);at=alloc(new*size)
  if q(rcx):u.mem_write(at,bytes(u.mem_read(q(rcx+8),q(rcx)*size)))
  wq(rcx,new);wq(rcx+8,at)
 elif a==0x14598ddd0:u.reg_write(UC_X86_REG_RAX,0)
 elif a in [0x140002200,0x1400021d0]:pass
 elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(rcx))
 elif a==0x145c0a3db:u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(UC_X86_REG_RAX,rcx)
 elif a==0x145bdd130:
  ptr=rdx;argi=0;value=''
  while True:
   op=u.mem_read(ptr,1)[0];ptr+=1
   if op==0:break
   if op<0x80:value+=text(ptr,op);ptr+=op;continue
   assert op==0xc0,hex(op)
   value+=fmarg(r8+argi*16);argi+=1
  formats.append(dict(site=hex(q(sp)-5),value=value));outstr(rcx,value)
 elif a==0x14598e180:
  value=text(rdx,r8);original=value;tokens={}
  for i in range(q(sp+0x28)):
   key=pair(r9+i*32);arg=fmarg(r9+i*32+16);tokens[key]=arg;value=value.replace('{'+key+'}',arg)
  replacements.append(dict(original=original,tokens=tokens,value=value));outstr(rcx,value)
 else:raise RuntimeError('Unreviewed native call '+hex(a)+' from'+hex(q(sp)-5))
 u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,q(sp))
hook_id=u.hook_add(UC_HOOK_CODE,hook)
out=HEAP;ptr=HEAP+0x100;ptr2=HEAP+0x108;wq(ptr,ptr2);wq(ptr2,out)
sp=STACK+0x1f0008;wq(sp,STOP);u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,out)
try:u.emu_start(0x1459adf40,STOP,count=3000000)
except Exception as e:raise RuntimeError('PC'+hex(u.reg_read(UC_X86_REG_RIP))+': '+str(e))from e
assert u.reg_read(UC_X86_REG_RIP)==STOP
catalog_base=q(out+8)
rows=[]
for i in range(q(out+16)):
 at=q(out+8)+i*112;raw=bytes(u.mem_read(at,112))
 row=dict(key=pair(at+8),name=pair(at+32),description=pair(at+56),kind=raw[72],payload=raw[73:88].hex(),icon=pair(at+88),points=struct.unpack_from('<I',raw,104)[0],category=raw[108])
 rows.append(row)



# The same original iterator produces each ordered unlock row. Its prerequisite
# lookup remains a named seam; all iteration/matching/suppression instructions run.
ADMITTED.append((0x1459db860,0x1459dbc88))
perks=0x145e09670;tabards=0x145e0b298;cosmetics=0x145e07600;companions=0x145e07d80
base_hook=hook
def unlock_hook(_,a,n,unused):
 if a==0x145c0a3e7:
  rcx=u.reg_read(UC_X86_REG_RCX);rdx=u.reg_read(UC_X86_REG_RDX);size=u.reg_read(UC_X86_REG_R8)
  u.reg_write(UC_X86_REG_RAX,0 if bytes(u.mem_read(rcx,size))==bytes(u.mem_read(rdx,size)) else 1)
 elif a==0x1459b75f0:
  key=text(u.reg_read(UC_X86_REG_RCX),u.reg_read(UC_X86_REG_RDX));found=0
  for i in range(13):
   if pair(perks+i*120)==key:found=perks+i*120;break
  u.reg_write(UC_X86_REG_RAX,found)
 else:return base_hook(_,a,n,unused)
 calls[a]=calls.get(a,0)+1;sp=u.reg_read(UC_X86_REG_RSP);u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,q(sp))
u.hook_del(hook_id);hook_id=u.hook_add(UC_HOOK_CODE,unlock_hook)
unlocks={}
for row in rows:
 key=row['key'];keybytes=key.encode();keyptr=alloc(len(keybytes));u.mem_write(keyptr,keybytes);keypair=alloc(16);u.mem_write(keypair,struct.pack('<QQ',keyptr,len(keybytes)))
 state=alloc(120);u.mem_write(state,struct.pack('<15Q',1,tabards,tabards+20*64,keyptr,len(keybytes),perks,perks+13*120,keypair,cosmetics,cosmetics+7*64,keypair,companions,companions+22*96,keyptr,len(keybytes)))
 output=alloc(48);values=[]
 for i in range(64):
  u.mem_write(output,bytes(48));sp=STACK+0x1f0008;wq(sp,STOP);u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,output);u.reg_write(UC_X86_REG_RDX,state)
  u.emu_start(0x1459db860,STOP,count=30000);assert u.reg_read(UC_X86_REG_RIP)==STOP
  if not q(output):break
  values.append(dict(prefix=pair(output),name=pair(output+16),icon=pair(output+32)))
 else:raise AssertionError('nonterminating unlock vector')
 unlocks[key]=values

def raw(a,n):
 at=p.rva_offset(a-p.image_base);return d[at:at+n]
def string(a):
 ptr,n=struct.unpack('<QQ',raw(a,16))
 if not ptr:assert n==0;return None
 assert n<10000;return raw(ptr,n).decode()
def table(kind,a,count,stride):
 values=[]
 for i in range(count):
  at=a+i*stride
  if kind=='perks':
   costs,n,descs,nn=struct.unpack('<4Q',raw(at+48,32));assert n==nn and 1<=n<=3
   value=dict(key=string(at),name=string(at+16),icon=string(at+32),costs=list(struct.unpack('<'+'I'*n,raw(costs,n*4))),descriptions=[string(descs+j*16)for j in range(n)],achievement=string(at+80),prerequisite=string(at+96),category=raw(at+112,1)[0])
  elif kind=='companions':
   display,scale,creature=struct.unpack('<IfI',raw(at+80,12));value=dict(key=string(at),name=string(at+16),model=string(at+32),icon=string(at+48),achievement=string(at+64),display_id=display,scale=scale,creature_id=creature)
  else:
   item,display,cost=struct.unpack('<III',raw(at+48,12));value=dict(id=item,name=string(at),icon=string(at+16),zone=string(at+32),display_id=display,cost=cost)
  values.append(value)
 return values

def span(a,b):return dict(va=hex(a),end_exclusive=hex(b),byte_count=b-a,sha256=hashlib.sha256(raw(a,b-a)).hexdigest())
def digest(value):return hashlib.sha256(json.dumps(value,ensure_ascii=False,sort_keys=True,separators=(',',':')).encode()).hexdigest()
layouts=[('perks',[0x145e09670,0x1472404c8],13,120),('tabards',[0x145e0b298,0x14721c358,0x147241f10],20,64),('companions',[0x145e07d80,0x147242828,0x147243d48,0x147245168],22,96)]
metadata={};tables=[]
for kind,addresses,count,stride in layouts:
 values=table(kind,addresses[0],count,stride)
 for a in addresses:
  assert values==table(kind,a,count,stride),(kind,hex(a))
  tables.append(dict(kind=kind,count=count,stride=stride,**span(a,a+count*stride)))
 metadata[kind]=values
labels=json.loads((R/'crates/azeroth-survivors-re/assets/locales/en.json').read_text())
asset_path=R/'crates/azeroth-survivors-re/assets/rewards-catalogs-0.112.0.json'
import argparse
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');parser.add_argument('--write',action='store_true',help='Initialize the current source catalog from recovered native values');args=parser.parse_args()
if args.write:
 # Reuse a historical token template only after its current output matches.
 # Newly recovered English labels are keys in all14 current locale payloads.
 old=json.loads((R/'crates/azeroth-survivors-re/assets/progression.json').read_text());old_by_key={entry['key']:entry for entry in old['achievements']}
 achievements=[]
 for row in rows:
  prior=old_by_key.get(row['key']);entry={k:row[k]for k in ['key','name','description','icon','points','category']};entry['tokens']={}
  if prior:
   def resolve(value):
    value=labels.get(value,value)
    for token,arg in prior['tokens'].items():value=value.replace('{'+token+'}',labels.get(arg,arg))
    return value
   assert all(resolve(prior[k])==row[k]for k in ['name','description']),row['key']
   entry.update({k:prior[k]for k in ['name','description','tokens']})
  entry['unlocks']=unlocks[row['key']];achievements.append(entry)
 asset=dict(target_sha256=target['sha256'],achievements=achievements,**metadata)
 asset_path.write_text(json.dumps(asset,indent=2,ensure_ascii=False)+'\n')
asset=json.loads(asset_path.read_text());assert asset['target_sha256']==target['sha256']
assert len(rows)==len(asset['achievements'])==84 and sum(row['points']for row in rows)==1775
checked=[]
for native,source in zip(rows,asset['achievements']):
 assert native['key']==source['key']
 result={'key':source['key']}
 for field in ['name','description','icon','points','category']:
  value=source[field]
  if isinstance(value,str):
   value=labels.get(value,value)
   for token,arg in source['tokens'].items():value=value.replace('{'+token+'}',labels.get(arg,arg))
  assert value==native[field],(source['key'],field,value,native[field]);result[field]=value
 assert source['unlocks']==unlocks[source['key']],source['key'];checked.append(result)
for kind,values in metadata.items():assert asset[kind]==values,kind
source=(R/'crates/azeroth-survivors-re/src/progression.rs').read_text();actors=(R/'crates/azeroth-survivors-re/src/run_effects/loot_companions.rs').read_text()
assert 'include_str!("../assets/rewards-catalogs-0.112.0.json")' in source
assert 'include_str!("../../assets/rewards-catalogs-0.112.0.json")' in actors
record=dict(target_sha256=target['sha256'],application_executed=False,rebuilt_code_executed=False,native_instructions_executed=True,entries=len(rows),points=sum(row['points']for row in rows),compared_fields=len(rows)*5,fields_digest=digest(checked),unlock_rows=sum(map(len,unlocks.values())),unlock_digest=digest(unlocks),metadata_digest={kind:digest(values)for kind,values in metadata.items()},tables=tables,native_constructor=span(0x1459adf40,0x1459b307f),native_gear_iterator=span(0x1459d3570,0x1459d3a3b),native_unlock_iterator=span(0x1459db860,0x1459dbc88),per_class_gear_counts={str(key):len(value)for key,value in gear_ids.items()},calls={hex(k):v for k,v in sorted(calls.items())},limits=['Original constructor, gear iterator and ordered unlock iterator instructions execute under Unicorn; no application, OS/file operation or rebuilt Rust executes.','Allocator, Vec growth, memcpy/memcmp, locale miss, compact formatting, named-token substitution and prerequisite lookup are explicit host seams.','This checks presentation data, account reward descriptors and lookup inputs. Achievement awarding predicates and companion actor behavior remain separate recovery owners.'])
path=R/('runtime/analysis/staging/native-evidence/rewards-catalogs'if args.stage else'docs/analysis/evidence/rewards-catalogs')/'catalogs.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print(f"Passed 420 native display fields, 84 entries/1775 points, {record['unlock_rows']} unlock rows, 13 perks/20 tabards/22 companions and 9 table copies")
