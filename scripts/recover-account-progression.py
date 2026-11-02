#!/usr/bin/env python3
"""Recover current achievement definitions via original constructor and gear iterator.

Explicit boundaries are allocator/Vec growth, locale miss, compact format and
placeholder substitution. Unknown calls fail closed. No OS/game/save is run.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import sys, struct, json, hashlib
R=Path(__file__).resolve().parents[1];sys.path.insert(0,str(R/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
m = load_script('iv', R/'scripts/inventory-executable.py')
d=(R/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes();assert hashlib.sha256(d).hexdigest()=='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b';p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000
u.mem_map(HEAP,0x1000000);u.mem_map(STACK,0x200000);u.mem_map(STOP,4096);next_heap=HEAP+0x1000
calls={};formats=[];replacements=[];gear_ids={};ADMITTED=[(0x14551e7f0,0x145522c86),(0x14553eda0,0x14553f26b)]
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
 if 0x145900000<=fun<0x147a00000:fun=q(fun+24)
 if fun==0x1400020c0:return pair(at)
 if fun==0x1400020e0:return pair(at+8)
 if fun==0x14573a450:return str(struct.unpack('<I',u.mem_read(at,4))[0])
 if fun==0x14573b340:return str(q(at))
 if fun==0x14573b410:return str(struct.unpack('<q',u.mem_read(at,8))[0])
 raise RuntimeError('unreviewed formatter '+hex(fun))
def hook(_,a,n,unused):
 if a==0x14553f26a:
  dest=u.reg_read(UC_X86_REG_RAX);values=list(struct.unpack('<'+'I'*q(dest+16),u.mem_read(q(dest+8),q(dest+16)*4)));gear_ids[values[0]//1000%100 if values else 0]=values
 if any(start<=a<end for start,end in ADMITTED):return
 if a==STOP:u.emu_stop();return
 calls[a]=calls.get(a,0)+1
 rcx=u.reg_read(UC_X86_REG_RCX);rdx=u.reg_read(UC_X86_REG_RDX);r8=u.reg_read(UC_X86_REG_R8);r9=u.reg_read(UC_X86_REG_R9);sp=u.reg_read(UC_X86_REG_RSP)
 if a==0x145778530:
  if q(rcx)==0:wq(rcx+8,alloc(256*112))
  assert q(rcx+16)<256;wq(rcx,256)
 elif a==0x1457744b0:
  size=q(sp+0x28);new=max(256,q(rcx)*2,rdx+r8);at=alloc(new*size)
  if q(rcx):u.mem_write(at,bytes(u.mem_read(q(rcx+8),q(rcx)*size)))
  wq(rcx,new);wq(rcx+8,at)
 elif a==0x145457cb0:u.reg_write(UC_X86_REG_RAX,0)
 elif a in [0x140002200,0x1400021d0]:pass
 elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(rcx))
 elif a==0x1457731ed:u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(UC_X86_REG_RAX,rcx)
 elif a==0x145728390:
  ptr=rdx;argi=0;value=''
  while True:
   op=u.mem_read(ptr,1)[0];ptr+=1
   if op==0:break
   if op<0x80:value+=text(ptr,op);ptr+=op;continue
   assert op==0xc0,hex(op)
   value+=fmarg(r8+argi*16);argi+=1
  formats.append(dict(site=hex(q(sp)-5),value=value));outstr(rcx,value)
 elif a==0x145458060:
  value=text(rdx,r8);original=value;tokens={}
  for i in range(q(sp+0x28)):
   key=pair(r9+i*32);arg=fmarg(r9+i*32+16);tokens[key]=arg;value=value.replace('{'+key+'}',arg)
  replacements.append(dict(original=original,tokens=tokens,value=value));outstr(rcx,value)
 else:raise RuntimeError('Unreviewed native call '+hex(a)+' from'+hex(q(sp)-5))
 u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,q(sp))
hook_id=u.hook_add(UC_HOOK_CODE,hook)
out=HEAP;ptr=HEAP+0x100;ptr2=HEAP+0x108;wq(ptr,ptr2);wq(ptr2,out)
sp=STACK+0x1f0008;wq(sp,STOP);u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,ptr)
try:u.emu_start(0x14551e7f0,STOP,count=3000000)
except Exception as e:raise RuntimeError('PC'+hex(u.reg_read(UC_X86_REG_RIP))+': '+str(e))from e
assert u.reg_read(UC_X86_REG_RIP)==STOP
catalog_base=q(out+8)
rows=[]
for i in range(q(out+16)):
 at=q(out+8)+i*112;raw=bytes(u.mem_read(at,112))
 row=dict(key=pair(at+8),name=pair(at+32),description=pair(at+56),kind=raw[72],payload=raw[73:88].hex(),icon=pair(at+88),points=struct.unpack_from('<I',raw,104)[0],category=raw[108])
 rows.append(row)
(R/'runtime/target-menu-consolidation/achievement-catalog-decoded.json').write_text(portable_json(dict(rows=rows,gear_ids=gear_ids,formats=formats,replacements=replacements,calls={hex(k):v for k,v in calls.items()}),indent=2)+'\n')
print(len(rows),'achievements',sum(x['points'] for x in rows),'points')


# Native static rewards records and their current lookup consumers.
def pe_bytes(a,n):return d[p.rva_offset(a-p.image_base):][:n]
def pe_pair(a):return struct.unpack('<QQ',pe_bytes(a,16))
def pe_string(a):
 ptr,n=pe_pair(a)
 assert n<1000
 return pe_bytes(ptr,n).decode() if ptr else None
perks=[]
for i in range(13):
 a=0x1469d8c20+i*120;costs,n=pe_pair(a+48);descriptions,m=pe_pair(a+64);assert n==m and 1<=n<=3
 perks.append(dict(key=pe_string(a),name=pe_string(a+16),icon=pe_string(a+32),costs=list(struct.unpack('<'+'I'*n,pe_bytes(costs,n*4))),descriptions=[pe_string(descriptions+j*16)for j in range(n)],achievement=pe_string(a+80),prerequisite=pe_string(a+96),category=pe_bytes(a+112,1)[0]))
tabards=[]
for i in range(20):
 a=0x1469d94b8+i*64;item,display,cost=struct.unpack('<III',pe_bytes(a+48,12))
 tabards.append(dict(id=item,name=pe_string(a),icon=pe_string(a+16),zone=pe_string(a+32),display_id=display,cost=cost))
companions=[]
for i in range(12):
 a=0x1469d9c68+i*96;display,scale,creature=struct.unpack('<IfI',pe_bytes(a+80,12))
 companions.append(dict(key=pe_string(a),name=pe_string(a+16),model=pe_string(a+32),icon=pe_string(a+48),achievement=pe_string(a+64),display_id=display,scale=scale,creature_id=creature))
replaced={row['value']:row for row in replacements}
achievements=[]
for source_row in rows:
 row=dict(source_row)
 payload=bytes.fromhex(row['payload']);kind=row['kind'];selector=0;target=1;zone=None;feat_kind=None;tokens={}
 if kind in [0,1]:selector=struct.unpack_from('<Q',payload,7)[0];target=9 if kind==1 else 1
 elif kind in [2,3]:selector=payload[0];zone=struct.unpack_from('<Q',payload,7)[0] if kind==3 else None
 elif kind in [4,5]:target=struct.unpack_from('<Q',payload,7)[0]
 elif kind==7:selector=struct.unpack_from('<I',payload,3)[0];target=(141*selector+99)//100
 elif kind==8:selector=payload[0];target=struct.unpack_from('<Q',payload,7)[0]
 elif kind==9:feat_kind=struct.unpack_from('<I',payload,3)[0];target=struct.unpack_from('<Q',payload,7)[0]
 elif kind!=6:raise ValueError(kind)
 for field in ['name','description']:
  if row[field] in replaced:
   replacement=replaced[row[field]];row[field]=replacement['original'];tokens.update(replacement['tokens'])
 out={k:row[k]for k in ['key','name','description','icon','points','category']}
 out.update(kind=kind,target=target,selector=selector,zone=zone,feat_kind=feat_kind,tokens=tokens,unlocks=[])
 for perk in perks:
  parent=next((p for p in perks if p['key']==perk['prerequisite']),None)
  if perk['achievement']==row['key'] and (parent is None or parent['achievement']!=row['key']):out['unlocks'].append(dict(prefix='Unlocks',name=perk['name'],icon=perk['icon']))
 for tabard in tabards:
  if tabard['zone']==row['key']:out['unlocks'].append(dict(prefix='Reward',name=tabard['name'],icon=tabard['icon']))
 for companion in companions:
  if companion['achievement']==row['key']:out['unlocks'].append(dict(prefix='Companion',name=companion['name'],icon=companion['icon']))
 achievements.append(out)
assert len(achievements)==72 and sum(a['points']for a in achievements)==1495
assert sum(map(len,gear_ids.values()))==498
asset=R/'crates/azeroth-survivors-re/assets/progression.json'
asset.write_text(portable_json(dict(version='0.100.1',target_sha256=hashlib.sha256(d).hexdigest(),perks=perks,tabards=tabards,companions=companions,achievements=achievements,legendary_sets={k:[id for id in ids if id//10%10==4]for k,ids in gear_ids.items()}),indent=2,ensure_ascii=False)+'\n')
# Curate text owners with exact full-owner hashes, keeping generic raw-ABI Ghidra limitations explicit.
import subprocess
O=R/'docs/analysis/evidence/0.100.1/account-progression';O.mkdir(parents=True,exist_ok=True)
ends={p.image_base+a:p.image_base+z for a,z,_ in p.functions()}
def span(a,n):return dict(address=hex(a),file_offset=hex(p.rva_offset(a-p.image_base)),byte_count=n,sha256=hashlib.sha256(pe_bytes(a,n)).hexdigest())
procedures=[]
for role,a in [('achievement-catalog',0x14551e7f0),('run-snapshot',0x1454502d0),('feat-grant',0x14552f770),('account-grant',0x14552fae0),('achievement-evaluate',0x14552e100),('achievement-save-grant',0x14542e180),('earned-set-insert',0x145435f00),('gear-id-iterator',0x14553eda0),('gear-legendary-filter',0x1455590f0),('best-legendary-class',0x14554dcd0),('date-format',0x14552d690),('perk-lookup',0x14547e770),('tabard-lookup',0x1454304f0),('unlock-list',0x14547f730),('companion-lookup',0x14547fd70),('lazy-catalog-wrapper',0x145524640),('system-time',0x145703e20),('achievement-notification',0x14544f390),('achievement-system-line',0x14552f600),('achievement-banner-line',0x14552dd50),('system-message-packet',0x14545dc90)]:
 z=ends[a];row=dict(role=role,end_exclusive=hex(z),**span(a,z-a));(O/f'{role}.asm').write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={z:#x}',str(R/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe')],cwd=R,text=True).replace(str(R)+'/', ''))
 evpath=R/f'runtime/target-menu-consolidation/rea-{role}/003-procedure_pseudo_code.json'
 if evpath.exists():
  result=json.loads(evpath.read_text())['response']['result'];ev=result.get('structuredContent') or json.loads(result['content'][0]['text']);assert ev['provider']['id']=='ghidra'and ev['subject']['digest']['sha256']==row['sha256'];row.update(evidence_id=ev['evidence_id'],provider=ev['provider']);(O/f'{role}.ghidra.c').write_text(ev['normalized_result'].rstrip()+'\n')
 procedures.append(row)
(O/'manifest.json').write_text(portable_json(dict(target_sha256=hashlib.sha256(d).hexdigest(),target_executed=False,source_asset=str(asset.relative_to(R)),source_sha256=hashlib.sha256(asset.read_bytes()).hexdigest(),procedures=procedures,static_tables=[dict(role=role,**span(a,n))for role,a,n in [('perks',0x1469d8c20,13*120),('tabards',0x1469d94b8,20*64),('companions',0x1469d9c68,12*96),('class-list',0x146735848,9*144),('zone-list',0x146733518,12*240),('progress-jumps',0x146d35dcc,40),('feat-jumps',0x146d35df4,24),('lazy-catalog-vtable',0x146d349e8,40),('filetime-duration',0x145703dd0,80)]],counts=dict(achievements=72,points=1495,gear=498,perks=13,tabards=20,companions=12),constructor_calls={hex(k):v for k,v in calls.items()},limits=['Constructor and gear enumeration run as original instructions. Allocation/Vec storage, locale miss, compact string format and placeholder substitution are explicit host seams.','Raw Ghidra uses generic ABI; original Windows register arguments and complete assembly determine recovered behavior.','No original/rebuilt graphical or gameplay parity check.']),indent=2)+'\n')
(O/'catalog-native.json').write_text(portable_json(dict(target_sha256=hashlib.sha256(d).hexdigest(),records=rows,gear_ids=gear_ids),indent=2,ensure_ascii=False)+'\n')
print('Wrote shared current catalog and',len(procedures),'full native owners.')

# Replay the native evaluator/grant path with explicit account-memory inputs.
ADMITTED.extend([(0x14552e100,0x14552f5f5),(0x14554dcd0,0x14554e04d),(0x1455590f0,0x1455591df),(0x1454502d0,0x1454504fd),(0x14552f770,0x14552fa7d),(0x14552fae0,0x14553008c),(0x14542e180,0x14542e392),(0x145435f00,ends[0x145435f00]),(0x145703dd0,0x145703e20)])
old_hook=hook;u.hook_del(hook_id)
def fixture_hook(uc,a,n,user):
 if any(start<=a<end for start,end in ADMITTED):return old_hook(uc,a,n,user)
 rcx=u.reg_read(UC_X86_REG_RCX);rdx=u.reg_read(UC_X86_REG_RDX);r8=u.reg_read(UC_X86_REG_R8);sp=u.reg_read(UC_X86_REG_RSP)
 if a in [0x145774550,0x1457745c0,0x145774710,0x145774860]:
  size={0x145774550:8,0x1457745c0:24,0x145774710:32,0x145774860:16}[a]
  cap=q(rcx);new=max(256,cap*2);ptr=alloc(new*size)
  if cap:u.mem_write(ptr,bytes(u.mem_read(q(rcx+8),cap*size)))
  wq(rcx,new);wq(rcx+8,ptr)
 elif a==0x1457731e1:u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(UC_X86_REG_RAX,rcx)
 elif a==0x1457731e7:
  left=bytes(u.mem_read(rcx,r8));right=bytes(u.mem_read(rdx,r8));u.reg_write(UC_X86_REG_RAX,((left>right)-(left<right))&0xffffffffffffffff)
 elif a==0x14546f110:
  # The consumer reads only native item rarity. IDs are produced by the actual
  # current iterator; this seam does not claim to run effect/name construction.
  assert rdx in {id for values in gear_ids.values()for id in values}
  u.mem_write(rcx,bytes(96));wq(rcx+48,rdx//10%10)
 elif a==0x145703e20:
  clock=116444736000000000+1700000000*10000000
  u.reg_write(UC_X86_REG_RAX,clock&0xffffffff);u.reg_write(UC_X86_REG_RDX,clock>>32)
 else:return old_hook(uc,a,n,user)
 u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,q(sp))
u.hook_add(UC_HOOK_CODE,fixture_hook)
def invoke(entry,rcx,rdx=0,r8=0,r9=0):
 sp=STACK+0x1f0008;wq(sp,STOP)
 for reg,value in [(UC_X86_REG_RSP,sp),(UC_X86_REG_RCX,rcx),(UC_X86_REG_RDX,rdx),(UC_X86_REG_R8,r8),(UC_X86_REG_R9,r9)]:u.reg_write(reg,value)
 try:u.emu_start(entry,STOP,count=3000000)
 except Exception as e:raise RuntimeError('fixture '+hex(entry)+' PC'+hex(u.reg_read(UC_X86_REG_RIP))+': '+str(e))from e
 assert u.reg_read(UC_X86_REG_RIP)==STOP

def account_memory(state):
 a=alloc(512)
 def vector(at,records,size):
  records=list(records);ptr=alloc(max(1,len(records))*size)
  if records:u.mem_write(ptr,b''.join(records))
  u.mem_write(at,struct.pack('<QQQ',len(records),ptr,len(records)))
 vector(a+0x30,[struct.pack('<I',id)for id in sorted(state.get('gear',[]))],4)
 vector(a+0x60,[struct.pack('<IB27x',xp,int(cls))for cls,xp in state.get('talent_xp',{}).items()],32)
 vector(a+0xd8,[struct.pack('<B7xQ',cls,zone)for cls,zone in sorted(state.get('beaten',[]))],16)
 vector(a+0x18,[struct.pack('<B7xQ',cls,zone)for cls,zone in sorted(state.get('open',[]))],16)
 vector(a+0xa8,[struct.pack('<QQQ',len(key),ptr,len(key))for key in sorted(state.get('earned',[]))for ptr in [alloc(len(key)+1)] if not u.mem_write(ptr,key.encode())],24)
 # The date vector begins empty; the grants themselves fill its original representation.
 vector(a+0xc0,[],32)
 vector(a, [bytes(40)+struct.pack('<II8x',runs,wins)for runs,wins in state.get('characters',[])],56)
 wq(a+0xa0,state.get('seen',0))
 for i,v in enumerate(state.get('statistics',[0]*7)):wq(a+0x190+i*8,v)
 return a

classes=[1,2,3,4,5,7,8,9,11]
allgear=sorted({id for ids in gear_ids.values()for id in ids})
fixture_states=[dict(name='empty'),dict(name='AQ-warrior',beaten=[[1,10]]),dict(name='Naxx-warrior',beaten=[[1,11]]),dict(name='allzones-allclasses',beaten=[[c,z]for c in classes for z in range(12)]),dict(name='talents-below',talent_xp={'1':23204}),dict(name='one-fulltalent',talent_xp={'1':23205}),dict(name='nine-fulltalent',talent_xp={str(c):23205 for c in classes}),dict(name='gear497',gear=allgear[:-1]),dict(name='gear498',gear=allgear),dict(name='legendary-one-class',gear=[id for id in gear_ids[1]if id//10%10==4]),dict(name='codex70',seen=70),dict(name='codex71',seen=71),dict(name='codex140',seen=140),dict(name='codex141',seen=141),dict(name='lifetimes-boundary',statistics=[10000,5000,100,100,10,50,100]),dict(name='legacy-open-derived',open=[[1,12]],characters=[[10,6],[20,4]])]
fixture_rows=[]
record_base=catalog_base
for slot in range(14):
 u.mem_write(0x147a37aa0+slot*32,struct.pack('<QQQ',256,catalog_base,len(rows))+bytes(8))
for state in fixture_states:
 save=account_memory(state);results=[]
 for i,definition in enumerate(rows):
  result=alloc(24);invoke(0x14552e100,result,save,record_base+i*112)
  raw=struct.unpack('<QQQ',u.mem_read(result,24));results.append(dict(key=definition['key'],progress=list(raw[1:])if raw[0]==1 else None))
 grants=alloc(24);invoke(0x14552fae0,grants,save,1,1700000000)
 granted=[pair(q(save+0xb0)+i*24+8)for i in range(q(save+0xb8))]
 dates={pair(q(save+0xc8)+i*32+8):q(q(save+0xc8)+i*32+24)for i in range(q(save+0xd0))}
 fixture_rows.append(dict(input=state,progress=results,granted=granted,dates=dates,new_in_catalog_order=[pair(q(q(grants+8)+i*8)+8)for i in range(q(grants+16))]))
(O/'native-account-fixtures.json').write_text(portable_json(dict(target_sha256=hashlib.sha256(d).hexdigest(),entry='0x14552e100',grant='0x14552fae0',states=fixture_rows,limits=['Complete original evaluator/account grant/set/date insertion and legendary class selector execute. Allocator/Vec/memcmp/memcpy/memmove and current item rarity projection are explicit seams.','Rarity projection accepts only actual current iterator IDs and returns the numeric rarity; item effect/name construction is not executed.','Account memory, Unix-second argument and Windows stack are explicit harness inputs.']),indent=2)+'\n')
print('Replayed',len(fixture_states),'native account states across72definitions.')

# Native snapshot math and complete feat-grant execution, including UTC stamping.
run_cases=[]
for kills in [2499,2500,5999,6000]:run_cases.append(dict(name=f'kills{kills}',kills=kills))
run_cases.extend([dict(name='density-normalized',kills=5000,mods=[200,100,100,100]),dict(name='zero-density-saturation',kills=1,mods=[0,100,100,100])])
for elapsed in [479.9999694824219,480.,480.0000305175781]:run_cases.append(dict(name=f'lair{elapsed}',elapsed=elapsed,guardians=4))
for elapsed in [1499.9998779296875,1500.,1800.,2400.]:
 for won in [False,True]:run_cases.append(dict(name=f'time{elapsed}-{won}',elapsed=elapsed,won=won,gear=[101000]+[0]*18))
run_cases.extend([dict(name='bare-win',won=True),dict(name='geared-win',won=True,gear=[101000]+[0]*18),dict(name='cache-win',won=True,caches=1),dict(name='full-reward-win',won=True,mods=[100,100,100,150])])
for field,value in [('game_state',2),('guid',0xffffff),('excluded',1),('phase',0)]:run_cases.append(dict(name=f'gate-{field}',**{field:value}))
run_rows=[]
for case in run_cases:
 case={**dict(elapsed=0.,kills=0,guardians=0,caches=0,won=False,gear=[0]*19,mods=[100]*4,game_state=0,guid=0xfffffe,excluded=0,phase=1),**case}
 game=alloc(0x1100);u.mem_write(game+0x10,struct.pack('<I',case['game_state']));wq(game+0xf80,case['guid']);u.mem_write(game+0x9c2,bytes([case['excluded']]));u.mem_write(game+0x9c9,bytes([case['phase']]));u.mem_write(game+0x944,struct.pack('<f',case['elapsed']));u.mem_write(game+0x684,struct.pack('<I',case['kills']));u.mem_write(game+0x68c,struct.pack('<I',case['guardians']));u.mem_write(game+0x698,struct.pack('<I',case['caches']));u.mem_write(game+0x880,bytes([case['won']]));u.mem_write(game+0x258,struct.pack('<4H',*case['mods']));u.mem_write(game+0x260,struct.pack('<19I',*case['gear']))
 snapshot=alloc(24);invoke(0x1454502d0,snapshot,game)
 if u.mem_read(snapshot+18,1)[0]==2:
  run_rows.append(dict(input=case,snapshot=None,new_in_catalog_order=[],dates={}));continue
 elapsed,kills,guardians,caches=struct.unpack('<fIII',u.mem_read(snapshot,16));won,bare,full=bytes(u.mem_read(snapshot+16,3))
 save=account_memory({});result=alloc(24);invoke(0x14552f770,result,save,snapshot)
 run_rows.append(dict(input=case,snapshot=dict(elapsed=elapsed,normalized_kills=kills,guardians=guardians,caches=caches,won=bool(won),bare=bool(bare),full_reward=bool(full)),new_in_catalog_order=[pair(q(q(result+8)+i*8)+8)for i in range(q(result+16))],dates={pair(q(save+0xc8)+i*32+8):q(q(save+0xc8)+i*32+24)for i in range(q(save+0xd0))}))
(O/'native-run-fixtures.json').write_text(portable_json(dict(target_sha256=hashlib.sha256(d).hexdigest(),snapshot_entry='0x1454502d0',feat_entry='0x14552f770',cases=run_rows,limits=['Complete native snapshot/feat/set/date insertion execute; SystemTime is supplied as Windows FILETIME for Unix1700000000.','The original FILETIME-duration leaf runs; allocator/Vec/String memory operations remain explicit seams.','Wrapper state/selected GUID/equipment/options and simulation counts are declared inputs, not an actual application session.']),indent=2)+'\n')
print('Replayed',len(run_rows),'native snapshot/feat/UTC-date cases.')
ADMITTED.append((0x14552d690,0x14552dcb0))
date_rows=[]
for seconds in [0,86399,86400,951782400,1700000000]:
 result=alloc(24);invoke(0x14552d690,result,seconds);date_rows.append(dict(seconds=seconds,formatted=pair(result+8)))
(O/'native-date-fixtures.json').write_text(portable_json(dict(target_sha256=hashlib.sha256(d).hexdigest(),entry='0x14552d690',cases=date_rows,limits=['Original UTC whole-day calendar arithmetic runs; locale misses and dynamic substitution/string rendering are explicit seams.']),indent=2)+'\n')

ADMITTED.append((0x14552f600,0x14552f729))
lines=[]
for i,row in enumerate(rows):
 result=alloc(24);invoke(0x14552f600,result,catalog_base+i*112);lines.append(dict(key=row['key'],system_line=pair(result+8)))
(O/'native-notification-fixtures.json').write_text(portable_json(dict(target_sha256=hashlib.sha256(d).hexdigest(),entry='0x14552f600',events=lines,limits=['Original system-line producer with constructor-derived definitions; explicit locale-miss/compact-format/substitution seams.']),indent=2)+'\n')

# Current ordinary-game defaults and the structured event's actual UI consumer.
import shutil
extra_owners=[]
for role,a in [('achievement-ui-dispatch',0x140062b50),('game-constructor',0x1454ad570),('run-factory',0x14544f710)]:
 z=ends[a];extra_owners.append(dict(role=role,end_exclusive=hex(z),**span(a,z-a)))
 (O/f'{role}.asm').write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={z:#x}',str(R/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe')],cwd=R,text=True).replace(str(R)+'/', ''))
fragments=[]
for role,a,z in [('constructor-ready-phase',0x1454adae3,0x1454adaea),('constructor-game-present',0x1454add5c,0x1454add67),('constructor-excluded-default',0x1454adff1,0x1454adffb),('showcase-env-read',0x14544fd20,0x14544fd71),('showcase-env-store',0x14544ff90,0x14544ff98),('game-wrapper-copy',0x14544ff3f,0x14544ff51),('achievement-type-dispatch',0x1400636d6,0x14006373f),('achievement-banner-format',0x140064209,0x140064328),('achievement-banner-append',0x140064341,0x140064374),('achievement-banner-kind0',0x1400646f3,0x1400646f8),('banner-clock',0x140064919,0x14006492f)]:
 fragments.append(dict(role=role,end_exclusive=hex(z),**span(a,z-a)))
 strings=[dict(role=role,text=pe_bytes(a,n).decode(),**span(a,n))for role,a,n in [('showcase-variable',0x14673e590,18),('achievement-banner-template',0x145913d3a,33),('achievement-name-key',0x145913d5b,4),('achievement-points-key',0x145913d5f,6)]]
(O/'delivery-guards.json').write_text(portable_json(dict(target_sha256=hashlib.sha256(d).hexdigest(),owners=extra_owners,fragments=fragments,strings=strings,excluded_flag=dict(wrapper_offset='0x9c2',core_offset='0x9b2',constructor_temp_base='RBP+0x28',constructor_zero_dword='RBP+0x9d8',factory_temp_base='RBP-0x40',factory_flag='RBP+0x972',environment_exact_value='1'),ui_consumer=dict(json_type='achievement',used_fields=['name','points'],unused_presentation_fields=['key','text','icon'],banner_kind=0,shared_banner_report='docs/analysis/notifications-0.100.1.md'),limits=['Static current full owners and field/copy edges; no GUI session or environment-driven original run.','Existing banner geometry/style/lifetime comes from the separately recovered shared kind0 consumer.']),indent=2)+'\n')
