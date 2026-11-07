#!/usr/bin/env python3
"""Current #57 health-event consumer contract; source/static recovery only.

Runs only the exact queued UNIT-notice caller, field-watch and token wrappers,
UnitGuids predicates/builder, and health-event fan-out. Model borrowing, heap,
vector growth and final Lua event dispatch are explicit synthetic seams. No
Rust, addon or game is compiled or launched. --collect stages compact evidence
in ignored runtime; default verifies the canonical reviewed evidence.
"""
import argparse,hashlib,json,sys,importlib.util,struct
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
from coverage_common import latest_target,target_bytes
parser=argparse.ArgumentParser(description="Check gap57 current unit health event mapping/token interface without compilation or game execution")
parser.add_argument("--collect",action="store_true");args=parser.parse_args()
STAGE=ROOT/"runtime/analysis/staging/native-evidence/0.113.2/guardian-target-health"
KEPT=ROOT/"docs/analysis/evidence/0.113.2/guardian-target-health"
SHA="58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as r
s=importlib.util.spec_from_file_location('iv',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m);target=latest_target(verify=True);assert target['sha256']==SHA,'Recover the changed current target first';d=target_bytes(target);p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);length=(max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in p.sections)+4095)&~4095;u.mem_map(p.image_base,length)
for sec in p.sections:u.mem_write(p.image_base+sec['rva'],d[sec['raw_offset']:sec['raw_offset']+sec['raw_size']])
state,heap=0x71000000,0x72000000;u.mem_map(state,0x30000);u.mem_map(heap,0x10000);script=state;model=state+0x10000;units=model+0x44b0;frame=state+0x22000;stack=state+0x28000
start,stop=0x1406411c7,0x140640fd6
ranges=[(start,0x1406411fb),(0x1405e3020,0x1405e3456),(0x144fadb70,0x144fadc2e),(0x144fae0e0,0x144fae199),(0x1450aa210,0x1450aa72c),(0x1450a9e10,0x1450aa092)]
events=[];cursor=heap;visited={};cases=[]
put=lambda a,fmt,*v:u.mem_write(a,struct.pack('<'+fmt,*v))
get=lambda a,fmt:struct.unpack('<'+fmt,u.mem_read(a,struct.calcsize('<'+fmt)))
def alloc(n):
 global cursor
 a=cursor;cursor+=(n+15)&~15;assert cursor<heap+0x10000;return a
def ret():
 sp=u.reg_read(r.UC_X86_REG_RSP);target=get(sp,'Q')[0];u.reg_write(r.UC_X86_REG_RSP,sp+8);u.reg_write(r.UC_X86_REG_RIP,target)
def hook(_,a,size,user):
 if a==stop:u.emu_stop();return
 if any(lo<=a<hi for lo,hi in ranges):
  visited[a]=bytes(u.mem_read(a,size));return
 if a==0x1452bf030:
  put(model,'Q',2);u.reg_write(r.UC_X86_REG_RAX,model)
 elif a==0x140002200:pass
 elif a==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,alloc(u.reg_read(r.UC_X86_REG_RCX)))
 elif a==0x1400021d0:pass
 elif a==0x145cf9e40:
  v=u.reg_read(r.UC_X86_REG_RCX);cap,old,n=get(v,'QQQ');new=alloc(4*24)
  if n:u.mem_write(new,bytes(u.mem_read(old,n*24)))
  put(v,'QQQ',4,new,n)
 elif a==0x144f9b360:
  name=bytes(u.mem_read(u.reg_read(r.UC_X86_REG_RDX),u.reg_read(r.UC_X86_REG_R8))).decode();n,rows,count=get(u.reg_read(r.UC_X86_REG_R9),'QQQ');cap,token,length=get(rows,'QQQ');events.append((name,bytes(u.mem_read(token,length)).decode()))
 else:raise AssertionError(hex(a))
 ret()
u.hook_add(UC_HOOK_CODE,hook)
ME=0x77;GUID=0xf130000258000001
for eid in [16,22]:
 for player,target,mouseover,wanted in [(ME,GUID,0,['target']),(ME,1,0,[]),(0,GUID,0,[]),(ME,1,GUID,[]),(ME,GUID,GUID,['target','mouseover'])]:
  u.mem_write(state,bytes(0x30000));put(script,'Q',model);put(model,'Q',2);put(units+0x60,'QQQQ',player,0,target,mouseover);put(frame+0x3a0,'Q',script);events.clear();cursor=heap
  u.reg_write(r.UC_X86_REG_RSP,stack);u.reg_write(r.UC_X86_REG_RBP,frame);u.reg_write(r.UC_X86_REG_R9,eid);u.reg_write(r.UC_X86_REG_R15,GUID);u.reg_write(r.UC_X86_REG_EFLAGS,2)
  u.emu_start(start,0,count=20000);assert u.reg_read(r.UC_X86_REG_RIP)==stop;assert events==[('UNIT_HEALTH'if eid==16 else'UNIT_MAXHEALTH',t)for t in wanted];cases.append(dict(id=eid,player_present=bool(player),selected=target==GUID,mouseover=mouseover==GUID,events=[list(e)for e in events]))

def raw(address,size):
 offset=p.rva_offset(address-p.image_base);value=d[offset:offset+size];assert len(value)==size;return value
def span(address,size):
 return dict(va=hex(address),file_offset=hex(p.rva_offset(address-p.image_base)),byte_count=size,sha256=hashlib.sha256(raw(address,size)).hexdigest())
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/camera/python-libs'))
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
md=Cs(CS_ARCH_X86,CS_MODE_64)
assembly='';intervals=[]
for address,value in sorted(visited.items()):
 assert raw(address,len(value))==value
 decoded=list(md.disasm(value,address));assert sum(i.size for i in decoded)==len(value)
 assembly+=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in decoded)
 if intervals and intervals[-1][1]==address:intervals[-1][1]+=len(value)
 else:intervals.append([address,address+len(value)])

owners=[('signal',0x1405e3020,0x1405e3456),('tokens',0x1450aa210,0x1450aa72c),('watchers',0x1450a9e10,0x1450aa092)]
ghidra=[]
if args.collect:
 for role,a,b in owners:
  result=json.loads((STAGE/('rea-'+role)/('003-'+role+'.json')).read_text())['response']['result']['structuredContent']
  assert result['subject']['digest']['sha256']==span(a,b-a)['sha256']
  ghidra.append(dict(role=role,**span(a,b-a),provider=result['provider'],evidence_id=result['evidence_id'],analysis_profile_sha256=result['analysis_profile']['digest'],pseudocode_sha256=hashlib.sha256(result['normalized_result'].encode()).hexdigest()))
else:
 ghidra=json.loads((KEPT/'interface-manifest.json').read_text())['ghidra']
 for row,(role,a,b)in zip(ghidra,owners):
  assert row['role']==role and all(row[key]==value for key,value in span(a,b-a).items())

literals=[]
for eid,address,name in [(16,0x145f64c10,b'UNIT_HEALTH'),(22,0x145f64c42,b'UNIT_MAXHEALTH')]:
 assert raw(address,len(name))==name
 table=0x145f78458;entry=table+eid*4;branch=table+struct.unpack('<i',raw(entry,4))[0]
 assert branch in visited
 literals.append(dict(id=eid,event=name.decode(),string=span(address,len(name)),jump_entry=span(entry,4),branch=hex(branch)))

manifest=dict(target_version='0.113.2',target_sha256=SHA,target_executed=False,native_cases=cases,
 executed_ranges=[span(a,b-a)for a,b in intervals],ghidra=ghidra,event_mapping=literals,
 wrappers=[span(a,b-a)for a,b in [(0x144fadb70,0x144fadc2e),(0x144fae0e0,0x144fae199)]],
 seam_functions={'0x1452bf030':'return synthetic live UI model with correct borrowed UnitGuids offset','0x140002200':'allocation marker','0x1400021c0':'fixture bump allocator','0x1400021d0':'fixture free','0x145cf9e40':'String vector capacity growth','0x144f9b360':'capture native event name and generated Lua token argument'},
 limits=['This runs the selected queued notice consumer and current token/watch contracts, not the full object-packet producer or all engine events.',
         'The signal raw import omits its external jump table, which limits Ghidra decompilation. The original-instruction fixture separately maps and executes both current native health table entries.',
         'Selection and model lifetime are fixture inputs. These cases do not establish runtime event cadence, source Rust execution, actual Lua dispatch or rendered parity.'])
out=STAGE if args.collect else KEPT
for name,value in [('interface.asm',assembly),('interface-manifest.json',json.dumps(manifest,indent=2)+'\n')]:
 if args.collect:(out/name).write_text(value)
 else:assert(out/name).read_text()==value,name
print(f'Guardian current unit-event interface: {len(cases)} native cases pass; no compilation/game')
