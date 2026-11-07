#!/usr/bin/env python3
"""Recover bounded current-target spell-description expressions; no OS/game launch.

The five scenarios emulate only admitted instructions in Unicorn. Allocation,
String/locale formatting and import-name-verified math are reviewed boundaries;
unknown code fails closed. --collect retains source/evidence; --check recomputes
all scenarios and verifies retained output. No OS calls or game process run.
"""
from portable_paths import objdump_output, portable_json

if __name__ == '__main__':
    from script_sources import run_contract
    run_contract(__file__)

from native_recovery import expression
from pathlib import Path
import sys,struct,json,importlib.util,hashlib,math,re,subprocess
R=Path(__file__).resolve().parents[1];sys.path.insert(0,str(R/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
s=importlib.util.spec_from_file_location('inv',R/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m)
from coverage_common import latest_target, target_bytes, artifact_path
target=latest_target(); assert target['sha256']=='0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
d=target_bytes(target); target_path=artifact_path(target['path']);p=m.PE(d)
imports={int(row['iat_start_address'],16)+8*i:name for row in p.imports()for i,name in enumerate(row['functions'])}
for address,name in [(0x145d1463d,'roundf'),(0x145d1465b,'ceilf'),(0x145d1475d,'log1pf'),(0x145d145fb,'memcpy')]:
 at=p.rva_offset(address-p.image_base);assert d[at:at+2]==b'\xff\x25'
 slot=address+6+struct.unpack_from('<i',d,at+2)[0];assert imports[slot]==name,(hex(address),name)

def verify_expressions(baseline, modified):
 # Re-evaluate original baseline instruction expressions with the independent
 # modified execution's inputs, comparing the shared native formatter callsites.
 f=lambda value:struct.unpack('<f',struct.pack('<f',value))[0]
 fields={off:1. for off in [16,20,28,32,56,60,68,72,80]};fields[76]=0.
 fields.update({off:f(value)for off,value in {16:1.46,20:.9,28:1.35,32:1.3,56:1.1,60:1.05,68:1.1,72:1.15,76:.01,80:1.2}.items()})
 stats={off:f(value)for off,value in {0:185.,4:1.25,8:.8,40:1.15,64:.2,72:.1}.items()}
 def ev(expr):
  if isinstance(expr,(int,float)):return expr
  if isinstance(expr,dict):
   if 'instance'in expr:return fields[expr['instance']]
   if 'instance_integer'in expr:return 1
   if 'stats_integer'in expr:return 1
   return stats.get(expr['stats'],0.)
  op=expr[0];a=ev(expr[1]);b=ev(expr[2])if len(expr)>2 else 0
  if op=='mul':return f(a*b)
  if op=='add':return f(a+b)
  if op=='sub':return f(a-b)
  if op=='div':return f(a/b)
  if op=='trunc':return math.trunc(a)
  if op=='round':return f(math.copysign(math.floor(abs(a)+.5),a))
  if op=='ceil':return f(math.ceil(a))
  if op=='ln_1p':return f(math.log1p(a))
  if op=='sqrt':return f(math.sqrt(a))
  if op=='max':return a if a>b else b
  if op=='min':return a if a<b else b
  if op=='abs':return abs(a)
  if op=='float':return f(a)
  if op=='iadd':return (int(a)+int(b))&0xffffffff
  if op=='isub':return (int(a)-int(b))&0xffffffff
  if op=='imul':return (int(a)*int(b))&0xffffffff
  raise ValueError(op)
 compared=0
 for row in baseline:
  actuals={number[0]:number for number in modified[row['key']]['numbers']}
  assert len(actuals)==len(modified[row['key']]['numbers']), 'Repeated formatter callsite requires ordered matching'
  for call,_,expr,_ in row['numbers']:
   if call not in actuals:continue
   expected=actuals[call][1];actual=ev(expr);compared+=1
   assert f(actual)==f(expected),(row['key'],call,expected,actual,expr)
 return {'shared_numeric_outputs':compared,'mismatches':0,'comparison':'f32 equality of baseline expressions evaluated with modified inputs against independently emulated native modified callsite outputs'}

SCENARIOS=('baseline','modified','large_area','singular_overlap','plural_no_overlap')
WORK=R/'runtime/analysis/history/findings/gap102/6d5d1bb31515'
ASSET=R/'crates/azeroth-survivors-re/assets/native-spell-descriptions-0.115.0.json'
EVIDENCE=R/'docs/analysis/evidence/spell-descriptions'
SOFT_RADIUS={'0x14585cb7b','0x14596c2d2','0x14585d8f0'}
def profiles():
 baseline=dict(instance_f32={off:1. for off in [16,20,28,32,56,60,68,72,80]},instance_u32={8:1,24:0,64:0},stats_f32={0:120.,4:1.,8:1.,40:1.,64:0.,72:0.},stats_u32={52:0},upgrade_counts=[0]*5)
 baseline['instance_f32'][76]=0.
 result={'baseline':baseline,'modified':json.loads(json.dumps(baseline))}
 result['modified']['instance_f32'].update({16:1.46,20:.9,28:1.35,32:1.3,56:1.1,60:1.05,68:1.1,72:1.15,76:.01,80:1.2})
 result['modified']['instance_u32'].update({24:1,64:1})
 result['modified']['stats_f32'].update({0:185.,4:1.25,8:.8,40:1.15,64:.2,72:.1})
 result['modified']['stats_u32'][52]=1
 # Normalize integer/string dictionary keys after constructing derived profiles.
 result=json.loads(json.dumps(result))
 result['large_area']=json.loads(json.dumps(result['modified']));result['large_area']['stats_f32']['40']=20.
 result['singular_overlap']=json.loads(json.dumps(result['baseline']));result['singular_overlap']['instance_f32']['32']=3.
 result['plural_no_overlap']=json.loads(json.dumps(result['baseline']));result['plural_no_overlap']['instance_u32']['64']=1
 return result

def evaluate(expr, inputs):
 f=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
 if isinstance(expr,(int,float)):return f(expr)
 if isinstance(expr,dict):
  kind,off=next(iter(expr.items()))
  return f(inputs[{'instance':'instance_f32','instance_integer':'instance_u32','stats':'stats_f32','stats_integer':'stats_u32'}[kind]].get(str(off),0))
 op=expr[0];a=evaluate(expr[1],inputs);b=evaluate(expr[2],inputs)if len(expr)>2 else 0
 if op=='mul':return f(a*b)
 if op=='add':return f(a+b)
 if op=='sub':return f(a-b)
 if op=='div':return f(a/b)
 if op=='trunc':return f(math.trunc(a))
 if op=='round':return f(math.copysign(math.floor(abs(a)+.5),a))
 if op=='ceil':return f(math.ceil(a))
 if op=='ln_1p':return f(math.log1p(a))
 if op=='sqrt':return f(math.sqrt(a))
 if op=='max':return a if a>b else b
 if op=='min':return a if a<b else b
 if op=='abs':return abs(a)
 if op=='float':return f(a)
 if op=='iadd':return f((int(a)+int(b))&0xffffffff)
 if op=='isub':return f((int(a)-int(b))&0xffffffff)
 if op=='imul':return f((int(a)*int(b))&0xffffffff)
 raise ValueError(op)

def numeric(item,inputs):
 value=evaluate(item['expression'],inputs)
 if item['call']in SOFT_RADIUS and value>70:
  # Native f32 arithmetic surrounds the named log1pf boundary.
  f=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
  value=f(f(f(math.log1p(f(f(value-70.)/10.)))*10.)+70.)
 return value

def collect(check=False):
 for scenario in SCENARIOS:
  with (WORK/f'base-{scenario}.log').open('w')as log:
   subprocess.run([sys.executable,'-B',str(Path(__file__).resolve()),scenario],cwd=R,stdout=log,stderr=subprocess.STDOUT,check=True)
 runs={name:json.loads((WORK/f'base-description-{name}.json').read_text())for name in SCENARIOS}
 independent=verify_expressions(runs['baseline'],{x['key']:x for x in runs['modified']})
 def row(x):return dict(expression=x['expression'],numbers=[dict(call=call,expression=expr,precision=precision)for call,_,expr,precision in x['numbers']])
 entries={x['key']:row(x)for x in runs['baseline']};modified={x['key']:x for x in runs['modified']}
 for x in runs['baseline']:
  if x['expression']!=modified[x['key']]['expression']:entries[x['key']]['plural']=row(modified[x['key']])
 for scenario in ('singular_overlap','plural_no_overlap'):entries['lightwell'][scenario]=row(runs[scenario][0])
 definitions=json.loads((WORK/'base-current-definitions.json').read_text());definitions={x['key']:x for x in definitions}
 def selected(key,inputs):
  original=entries[key];base=struct.unpack_from('<I',bytes.fromhex(definitions[key]['raw_hex']),84)[0]
  count=max(1,(base+inputs['instance_u32']['24']+inputs['instance_u32']['64']+inputs['stats_u32']['52'])&0xffffffff)if base else 1
  plural=count>1;value=original.get('plural',original)if plural else original
  if key=='lightwell':
   overlap=numeric(next(x for x in original['plural']['numbers']if x['call']=='0x14596d275'),inputs)>1
   if not plural and overlap:value=original['singular_overlap']
   if plural and not overlap:value=original['plural_no_overlap']
  return value
 comparisons=0
 for scenario,rows in runs.items():
  for actual in rows:
   recovered=selected(actual['key'],profiles()[scenario])
   assert recovered['expression']==actual['expression'],(scenario,actual['key'],'grammar')
   assert len(recovered['numbers'])==len(actual['numbers']),(scenario,actual['key'],'number-count')
   for item,(call,expected,_,precision)in zip(recovered['numbers'],actual['numbers']):
    assert item['call']==call and item['precision']==precision,(scenario,actual['key'],call)
    value=numeric(item,profiles()[scenario]);comparisons+=1
    assert struct.pack('<f',value)==struct.pack('<f',expected),(scenario,actual['key'],call,value,expected,item['expression'])
 template_keys=set()
 def templates(value):
  if isinstance(value,dict):
   if'template'in value:template_keys.add(value['template'])
   for child in value.values():templates(child)
  elif isinstance(value,list):
   for child in value:templates(child)
 templates(entries)
 locales=[]
 for path in sorted((R/'crates/azeroth-survivors-re/assets/locales').glob('*.json')):
  raw=path.read_bytes();assert template_keys<=json.loads(raw).keys(),(path,template_keys-json.loads(raw).keys())
  locales.append(dict(path=str(path.relative_to(R)),sha256=hashlib.sha256(raw).hexdigest()))
 asset=dict(target_sha256=target['sha256'],owner='0x14585c8e0',passive_owner='0x14596c1c0',entries=entries)
 output=json.dumps(asset,separators=(',',':'),ensure_ascii=False)+'\n'
 historical=json.loads((R/'crates/azeroth-survivors-re/assets/native-spell-descriptions-0.100.1.json').read_text())['entries']
 # Ignore ASLR/code address identity when comparing expressions to historical prose.
 changed=[key for key,value in entries.items()if key not in historical or value['expression']!=historical[key]['expression']]
 numeric_changed=[key for key,value in entries.items()if key not in historical or [x['expression']for x in value['numbers']]!=[x['expression']for x in historical[key]['numbers']]]
 proof=dict(target_sha256=target['sha256'],compiled=False,target_executed=False,method='Bounded unchanged Win64 instruction emulation with reviewed allocation/String/locale boundaries and import-name-verified roundf, ceilf and log1pf. Expressions trace original f32 instructions; unsupported calls fail closed.',inputs=profiles(),checks=dict(definitions=len(entries),description_scenarios=sum(map(len,runs.values())),numeric_comparisons=comparisons,independent_modified_numeric_comparisons=independent['shared_numeric_outputs'],template_keys=len(template_keys),locale_catalogs=locales),historical_expression_changes=changed,historical_numeric_expression_changes=numeric_changed,scenarios={name:dict(rows=len(rows),sha256=hashlib.sha256((WORK/f'base-description-{name}.json').read_bytes()).hexdigest())for name,rows in runs.items()},asset_sha256=hashlib.sha256(output.encode()).hexdigest(),limits=['Static derived instruction evidence, not native process observations or original/rebuilt parity.','Synthetic finite inputs and named host math boundaries do not establish extreme-count/non-finite parity.','Append text, card auxiliary rows and panel integration have separate owning evidence.'])
 samples={'cleave','consecration','bloodrage','lightwell','demonic_empowerment','searing_pain','shockwave'}
 fixture=dict(target_sha256=target['sha256'],inputs=profiles(),cases={name:[dict(key=x['key'],text=x['text'],numbers=[dict(call=a,value=v,precision=pr)for a,v,_,pr in x['numbers']])for x in rows if x['key']in samples]for name,rows in runs.items()})
 # Keep a single canonical original-instruction extract per admitted owner.
 ends={p.image_base+a:p.image_base+b for a,b,_ in p.functions()}
 spans=[]
 for role,lo,hi in [('primary',0x14585c8e0,ends[0x14585c8e0]),('passive',0x14596c1c0,ends[0x14596c1c0]),('school',0x14585c840,ends[0x14585c840]),('damage-fragment',0x14586a870,ends[0x14586a870])]:
  off=p.rva_offset(lo-p.image_base);raw=d[off:off+hi-lo]
  asm=objdump_output(['objdump','-d','-M','intel','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(target_path)],text=True)
  asm='\n'.join(line.rstrip()for line in asm.splitlines()if re.match(r'^[0-9a-f]+:',line))+'\n'
  destination=EVIDENCE/f'{role}.asm';spans.append(dict(role=role,start=hex(lo),size=hi-lo,sha256=hashlib.sha256(raw).hexdigest(),extract=str(destination.relative_to(R)),extract_sha256=hashlib.sha256(asm.encode()).hexdigest()))
  if check:assert destination.read_text()==asm,destination
  else:EVIDENCE.mkdir(parents=True,exist_ok=True);destination.write_text(asm)
 proof['ranges']=spans
 proof['canonical_references']=['docs/analysis/evidence/coop-overlay/manifest.json','docs/analysis/evidence/coop-spell-text/manifest.json']
 proof['definition_table']=dict(start='0x146cc4580',count=113,stride=120,sha256=hashlib.sha256(b''.join(bytes.fromhex(x['raw_hex'])for x in definitions.values())).hexdigest())
 for role,query in [('primary','query-14585c8e0'),('passive','base-passive-query')]:
  if check and not (WORK/query/'journal.json').exists():
   retained=json.loads((EVIDENCE/'manifest.json').read_text());assert retained['target_sha256']==target['sha256']
   proof[role+'_ghidra']=retained[role+'_ghidra'];continue
  journal=json.loads((WORK/query/'journal.json').read_text());assert journal['status']=='completed'
  result=next(iter(journal['operations'].values()))['result'];raw=(R/result['path']).read_bytes();assert hashlib.sha256(raw).hexdigest()==result['sha256'];record=json.loads(raw);e=record.get('structuredContent')or json.loads(record['content'][0]['text'])
  assert e['subject']['digest']['sha256']==next(x['sha256']for x in spans if x['role']==role)
  proof[role+'_ghidra']=dict(evidence_id=e['evidence_id'],analysis_profile=e['analysis_profile'],limitation='Raw slice analysis does not resolve data-dependent computed switches; original PE branch-table bytes and admitted instructions supply those branches.')
 for path,value in [(ASSET,output),(EVIDENCE/'manifest.json',json.dumps(proof,indent=2,ensure_ascii=False)+'\n'),(EVIDENCE/'cases.json',json.dumps(fixture,separators=(',',':'),ensure_ascii=False)+'\n')]:
  if check:assert path.read_text()==value,f'{path} differs from current instruction recovery'
  else:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value)
 source=(R/'crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs').read_text()
 assert 'assets/native-spell-descriptions-0.115.0.json' in source
 for call in SOFT_RADIUS:assert call in source,call
 assert '0x14596d275'in source
 print(f'Verified {len(entries)} current descriptions / {sum(map(len,runs.values()))} scenarios / {comparisons} numeric outputs; {len(changed)} historical prose changes; static only')

if len(sys.argv)>1 and sys.argv[1]in ('--collect','--check'):
 collect(sys.argv[1]=='--check');raise SystemExit(0)

u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(s['rva']+max(s.get('virtual_size',0),s['raw_size'])for s in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for sec in p.sections:u.mem_write(p.image_base+sec['rva'],d[sec['raw_offset']:sec['raw_offset']+sec['raw_size']])
HEAP=0x200000000;STACK=0x300000000;STOP=0x400000000
u.mem_map(HEAP,0x1000000);u.mem_map(STACK,0x200000);u.mem_map(STOP,4096);next_heap=HEAP+0x1000
ends={p.image_base+a:p.image_base+b for a,b,_ in p.functions()}
allowed=[(a,ends[a])for a in [0x14585c8e0,0x14585c840,0x14586a870,0x14596c1c0,0x14580a670]]+[(0x14580a550,0x14580a664)]
# Float expression tracing follows only original admitted native instructions.
asm={}
for lo,hi in allowed:
 for line in objdump_output(['objdump','-d','-M','intel','--no-show-raw-insn',f'--start-address={lo:#x}',f'--stop-address={hi:#x}',str(target_path)],text=True).splitlines():
  x=re.match(r'([0-9a-f]+):\s+(\S+)\s*(.*)',line)
  if not x:continue
  pc,mn,ops=x.groups();z=re.search(r'# (0x[0-9a-f]+)',ops)
  if z:ops=re.sub(r'\[rip[^\]]+\]',f'[{z[1]}]',ops.split('#')[0].strip())
  asm[int(pc,16)]=(mn,[x.strip()for x in ops.split(',')])
float_mem={};xmm={};gp={};integer_mem={}
def concrete_register(name):
 aliases={'eax':'rax','ebx':'rbx','ecx':'rcx','edx':'rdx','esi':'rsi','edi':'rdi','ebp':'rbp','esp':'rsp'}
 name=aliases.get(name,name)
 if name.endswith('d')and name.startswith('r'):name=name[:-1]
 return u.reg_read(globals()['UC_X86_REG_'+name.upper()])
def address(op):
 match=re.search(r'\[([^\]]+)\]',op)
 if not match:return None
 total=0
 for sign,term in re.findall(r'([+-]?)([^+-]+)',match[1].replace(' ','')):
  factor=1
  if '*'in term:
   a,b=term.split('*');term,factor=(a,int(b,0))if a.startswith(('r','e'))else(b,int(a,0))
  value=concrete_register(term)if term.startswith(('r','e'))else int(term,0)
  total+=(-1 if sign=='-'else 1)*value*factor
 return total
def ff(at):
 value=integer_mem.get(at)
 if isinstance(value,dict) and any(key in value for key in ['instance_integer','stats_integer']):return value
 return float_mem.get(at,struct.unpack('<f',u.mem_read(at,4))[0])
def load_x(op,n=4):
 if re.fullmatch(r'xmm[0-9]+',op):return xmm.get(op,[0.,0.,0.,0.])[:n]
 at=address(op)
 return [ff(at+i*4)for i in range(n)]if at is not None else[0.]*n
def gkey(name):
 return {'eax':'rax','ebx':'rbx','ecx':'rcx','edx':'rdx','esi':'rsi','edi':'rdi','ebp':'rbp','esp':'rsp'}.get(name,name[:-1]if name.startswith('r')and name.endswith('d')else name)
def trace_math(pc):
 # Native minimum-one target sum is an adc-based max after wrapping u32 additions.
 if pc==0x14585caee:gp['rax']=['max',1,['iadd',gp['rax'],gp['rcx']]]
 if pc in [0x14596c6b0,0x14596caa0,0x14596ccc5,0x14596cde6]:gp['rcx']=['min',3,gp['rax']]
 if pc==0x14596d1d4:gp['rcx']=['max',1,['min',3,['max',xmm['xmm0'][0],0]]]
 if pc not in asm:return
 mn,ops=asm[pc]
 if len(ops)<1:return
 dst=ops[0]
 if mn in ['movss','movsd','movaps','movups','movdqu','movdqa','movq']and len(ops)==2 and ('xmm'in dst or'xmm'in ops[1]):
  n=1 if mn=='movss'else 2 if mn in ['movsd','movq']else 4;v=load_x(ops[1],n)
  if '['in dst:
   at=address(dst)
   for j,z in enumerate(v):
    float_mem[at+j*4]=z
    if isinstance(z,dict) and any(key in z for key in ['instance_integer','stats_integer']):integer_mem[at+j*4]=z
  else:
   old=xmm.get(dst,[0.]*4).copy();old[:n]=v;xmm[dst]=old
 elif mn in ['addss','subss','mulss','divss','minss','maxss','sqrtss']:
  left=xmm.get(dst,[0.]*4).copy();right=load_x(ops[1],1)[0]
  left[0]=[mn[:-2],right]if mn=='sqrtss'else[mn[:-2],left[0],right];xmm[dst]=left
 elif mn in ['xorps','pxor']and len(ops)==2 and dst==ops[1]:xmm[dst]=[0.]*4
 elif mn=='cvtsi2ss':
  op=ops[1];at=address(op);v=integer_mem.get(at,int.from_bytes(u.mem_read(at,4),'little'))if at is not None else gp.get(gkey(op),concrete_register(op));old=xmm.get(dst,[0.]*4).copy();old[0]=['float',v];xmm[dst]=old
 elif mn=='cvttss2si':gp[gkey(dst)]=['trunc',load_x(ops[1],1)[0]]
 elif mn=='andps':
  old=xmm.get(dst,[0.]*4).copy();op=ops[1];right=load_x(op);dr=concrete_register(dst);sr=concrete_register(op)if re.fullmatch(r'xmm[0-9]+',op)else int.from_bytes(u.mem_read(address(op),16),'little')
  for j in range(4):
   lm=(dr>>(j*32))&0xffffffff;rm=(sr>>(j*32))&0xffffffff
   if lm==0xffffffff:old[j]=right[j]
   elif rm==0xffffffff:pass
   elif lm==0 or rm==0:old[j]=0.
   elif rm==0x7fffffff:old[j]=['abs',old[j]]
   else:old[j]=struct.unpack('<f',struct.pack('<I',lm&rm))[0]
  xmm[dst]=old
 elif mn in ['cmpltss','cmpnless','cmpless']:
  old=xmm.get(dst,[0.]*4).copy();old[0]=0.;xmm[dst]=old
 elif mn.startswith('cmov'):
  flags=reg(UC_X86_REG_EFLAGS);cf=bool(flags&1);zf=bool(flags&64);sf=bool(flags&128);of=bool(flags&2048)
  choose={'b':cf,'be':cf or zf,'a':not(cf or zf),'ae':not cf,'e':zf,'ne':not zf,'s':sf,'ns':not sf,'g':not zf and sf==of,'ge':sf==of,'l':sf!=of,'le':zf or sf!=of}.get(mn[4:],False)
  if choose:gp[gkey(dst)]=gp.get(gkey(ops[1]),concrete_register(ops[1]))
 elif mn=='xor'and len(ops)==2 and dst==ops[1]:gp[gkey(dst)]=0
 elif mn.startswith('mov')and len(ops)==2 and'xmm'not in dst and'xmm'not in ops[1]:
  src=ops[1];at=address(src)
  if '['in dst:
   a=address(dst)
   if gkey(src)in gp:integer_mem[a]=gp[gkey(src)]
   else:integer_mem.pop(a,None)
  else:
   key=gkey(dst)
   if at is not None:gp[key]=integer_mem.get(at,int.from_bytes(u.mem_read(at,4 if 'dword'in src or dst.startswith('e')else 8),'little'))
   elif gkey(src)in gp:gp[key]=gp[gkey(src)]
   else:gp.pop(key,None)
 elif mn=='lea' and len(ops)==2 and (dst.startswith('e') or dst.endswith('d')):
  match=re.search(r'\[([^\]]+)\]',ops[1]);expr=None
  if match:
   for sign,term in re.findall(r'([+-]?)([^+-]+)',match[1].replace(' ','')):
    factor=1
    if '*'in term:
     a,b=term.split('*');term,factor=(a,int(b,0))if a.startswith(('r','e'))else(b,int(a,0))
    value=gp.get(gkey(term),concrete_register(term))if term.startswith(('r','e'))else int(term,0)
    if factor!=1:value=['imul',value,factor]
    if expr is None:expr=value if sign!='-'else ['isub',0,value]
    else:expr=['isub' if sign=='-'else'iadd',expr,value]
   gp[gkey(dst)]=expr
 elif mn in ['add','sub','inc','dec']and'['not in dst and gkey(dst)in gp:
  key=gkey(dst);v=1 if len(ops)==1 else integer_mem.get(address(ops[1]),int.from_bytes(u.mem_read(address(ops[1]),4),'little'))if '['in ops[1]else gp.get(gkey(ops[1]),concrete_register(ops[1])if ops[1].startswith(('r','e'))else int(ops[1],0));gp[key]=['iadd'if mn in ['add','inc']else'isub',gp[key],v]
trace=[];numbers=[];pieces=[]
def reg(r):return u.reg_read(r)
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
def st(a,n):return bytes(u.mem_read(a,n)).decode()
def pair(a):return st(q(a),q(a+8))
def alloc(n):
 global next_heap
 a=next_heap;next_heap+=(n+15)&~15;u.mem_write(a,bytes(n));return a
# retain the original Rust String capacity/pointer/length ABI.
def outstr(dest,s):
 b=s.encode();a=alloc(len(b)+1);u.mem_write(a,b);u.mem_write(dest,struct.pack('<QQQ',len(b),a,len(b)))
def ret():sp=reg(UC_X86_REG_RSP);a=q(sp);u.reg_write(UC_X86_REG_RSP,sp+8);u.reg_write(UC_X86_REG_RIP,a)
def hook(uc,a,size,_):

 if any(lo<=a<hi for lo,hi in allowed):trace_math(a);return
 rcx,rdx,r8,r9=[reg(x)for x in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]]
 trace.append(hex(a))
 if a in [0x140002200,0x1400021d0]:pass
 elif a==0x14001c2a0:
  unit=q(reg(UC_X86_REG_RSP)+40);ptr=alloc(rdx*unit);wq(rcx,0);wq(rcx+8,rdx);wq(rcx+16,ptr)
 elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(rcx))
 elif a==0x1458dff90:
  value=st(rcx,rdx);pieces.append((value,{'template':value,'values':{}}));u.reg_write(UC_X86_REG_RAX,0);u.reg_write(UC_X86_REG_RDX,0)
 elif a==0x1458627d0:
  v=struct.unpack('<f',reg(UC_X86_REG_XMM1).to_bytes(16,'little')[:4])[0];numbers.append((hex(q(reg(UC_X86_REG_RSP))),v,xmm.get('xmm1',[v])[0],None));outstr(rcx,'{number'+str(len(numbers)-1)+'}')
 elif a in [0x145d1463d,0x145d1475d,0x145d1465b]:
  v=struct.unpack('<f',reg(UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0];v=math.log1p(v)if a==0x145d1475d else math.ceil(v)if a==0x145d1465b else math.copysign(math.floor(abs(v)+0.5),v);xmm['xmm0']=[['ln_1p'if a==0x145d1475d else'ceil'if a==0x145d1465b else'round',xmm.get('xmm0',[v])[0]],0.,0.,0.];u.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',v)+bytes(12),'little'))
 elif a==0x145d14a10:
  cap=q(rcx);old=q(rcx+8);newcap=max(cap*2,rdx+r8,256);unit=q(reg(UC_X86_REG_RSP)+40);new=alloc(newcap*unit)
  if cap:u.mem_write(new,bytes(u.mem_read(old,cap*unit)))
  wq(rcx,newcap);wq(rcx+8,new)
 elif a==0x145d145fb:u.mem_write(rcx,bytes(u.mem_read(rdx,r8)));u.reg_write(UC_X86_REG_RAX,rcx)
 elif a==0x145ce7810:outstr(rcx,pair(rdx+8))
 elif a==0x145ce7350:
  ptr=rdx;argi=0;s=''
  while True:
   op=u.mem_read(ptr,1)[0];ptr+=1
   if op==0:break
   if op<0x80:s+=st(ptr,op);ptr+=op;continue
   precision=None
   if op in [0xc1,0xc5]:
    flags=bytes(u.mem_read(ptr,4));ptr+=4;precision=0
    if op==0xc5:precision=struct.unpack('<H',u.mem_read(ptr,2))[0];ptr+=2
   elif op!=0xc0:raise RuntimeError('format op '+hex(op))
   at,fmt=q(r8+argi*16),q(r8+argi*16+8);argi+=1
   if fmt==0x145cf8100:
    v=struct.unpack('<f',u.mem_read(at,4))[0];expr=ff(at);numbers.append((hex(q(reg(UC_X86_REG_RSP))),v,expr,precision));value='{number'+str(len(numbers)-1)+'}'
   elif fmt==0x1400020c0:value=pair(at)
   else:raise RuntimeError('unknown fmt '+hex(fmt))
   s+=value
  outstr(rcx,s)
 elif a==0x1458e0370:
  s=st(rdx,r8);template=s;values={};n=q(reg(UC_X86_REG_RSP)+40)
  for j in range(n):
   at=r9+j*32;key=pair(at);v=q(at+16);method=q(q(at+24)+24)
   if method==0x1400020c0:value=pair(v)
   elif method==0x1400020e0:value=pair(v+8)
   elif method in [0x145cf8e00,0x145cf9cf0]:
    val=int.from_bytes(u.mem_read(v,4 if method==0x145cf8e00 else 8),'little');expr=integer_mem.get(v,val)
    if isinstance(expr,(dict,list)):
     numbers.append((hex(q(reg(UC_X86_REG_RSP))),val,expr,'integer'));value='{number'+str(len(numbers)-1)+'}'
    else:value=str(val)
   else:raise RuntimeError('unknown namedmethod '+hex(method)+' at '+hex(at))
   s=s.replace('{'+key+'}',value);values[key]=value

  pieces.append((s,{'template':template,'values':values}));outstr(rcx,s)
 else:raise RuntimeError('unsupported '+hex(a)+' from '+hex(q(reg(UC_X86_REG_RSP))))
 ret()
u.hook_add(UC_HOOK_CODE,hook)

# The current source keys select records; every descriptor is reread at its
# current target address, so a historical catalog cannot supply native constants.
source=(R/'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text()
keys=re.findall(r'key: "([^"]+)"',source.split('pub static ABILITIES:',1)[1].split('pub static CLASSES:',1)[0])
assert len(keys)==113
rows=[]
for idx,key in enumerate(keys):
 va=0x146cc4580+idx*120;at=p.rva_offset(va-p.image_base);raw=d[at:at+120];pointer,length=struct.unpack_from('<QQ',raw);off=p.rva_offset(pointer-p.image_base)
 assert d[off:off+length].decode()==key,(idx,key)
 rows.append({'key':key,'source':{'virtual_address':hex(va)},'raw_hex':raw.hex(),'sha256':hashlib.sha256(raw).hexdigest()})
 # Match every current descriptor's native numeric inputs to the live catalog.
 chunk=re.findall(r'AbilityDefinition \{(.*?)\n    \},',source.split('pub static ABILITIES:',1)[1].split('pub static CLASSES:',1)[0],re.S)[idx]
 for offset,field in {64:'spell_id',84:'targets',92:'ticks',100:'pulse_spell_id'}.items():
  assert int(re.search(r'\b'+field+r':\s*(\d+)',chunk)[1])==struct.unpack_from('<I',raw,offset)[0],(key,field)
 for offset,field in {68:'base_power',72:'base_cooldown',76:'range',80:'radius',88:'duration',96:'projectile_speed'}.items():
  text=re.search(r'\b'+field+r':\s*([^,]+)',chunk)[1].strip();match=re.fullmatch(r'f32::from_bits\(0x([0-9a-fA-F_]+)\)',text)
  value=int(match[1].replace('_',''),16)if match else struct.unpack('<I',struct.pack('<f',float(text)))[0]
  assert value==struct.unpack_from('<I',raw,offset)[0],(key,field)
 for offset,field in [(116,'school'),(117,'kind')]:assert int(re.search(r'\b'+field+r':\s*(\d+)',chunk)[1])==raw[offset],(key,field)
 status=re.search(r'effect:\s*StatusEffect\s*\{\s*tag:\s*(\d+),\s*value:\s*([^,]+),\s*duration:\s*([^}]+)',chunk)
 native_tag=struct.unpack_from('<I',raw,104)[0];assert int(status[1])=={11:10,12:11,13:12}.get(native_tag,native_tag),(key,'effect tag')
 for offset,text in [(108,status[2]),(112,status[3])]:
  text=text.strip();match=re.fullmatch(r'f32::from_bits\(0x([0-9a-fA-F_]+)\)',text)
  value=int(match[1].replace('_',''),16)if match else struct.unpack('<I',struct.pack('<f',float(text)))[0]
  assert value==struct.unpack_from('<I',raw,offset)[0],(key,'effect',offset)

WORK=R/'runtime/analysis/history/findings/gap102/6d5d1bb31515';WORK.mkdir(parents=True,exist_ok=True)
(WORK/'base-current-definitions.json').write_text(portable_json(rows,indent=2)+'\n')
scenario=sys.argv[1]if len(sys.argv)>1 else'baseline'
outputs=[]
for idx,row in enumerate(rows):
 if scenario in ['singular_overlap','plural_no_overlap'] and row['key']!='lightwell':continue
 next_heap=HEAP+0x1000;trace=[];numbers=[];pieces=[];float_mem={};xmm={};gp={};integer_mem={};instance=alloc(88);stats=alloc(84);out=alloc(24)
 ability_address=int(row['source']['virtual_address'],16)
 wq(instance,ability_address);u.mem_write(instance+8,struct.pack('<If',1,.5))
 for off in [16,20,28,32,56,60,68,72,80]:u.mem_write(instance+off,struct.pack('<f',1.))
 for off in [16,20,28,32,56,60,68,72,76,80]:float_mem[instance+off]={'instance':off}
 integer_mem[instance+24]={'instance_integer':24};integer_mem[instance+64]={'instance_integer':64}
 for off in range(0,84,4):float_mem[stats+off]={'stats':off}
 integer_mem[stats+52]={'stats_integer':52}
 u.mem_write(stats,struct.pack('<3f',120.,1.,1.));u.mem_write(stats+40,struct.pack('<f',1.))
 if scenario in ['modified','large_area']:
  for off,value in {16:1.46,20:.9,28:1.35,32:1.3,56:1.1,60:1.05,68:1.1,72:1.15,76:.01,80:1.2}.items():u.mem_write(instance+off,struct.pack('<f',value))
  u.mem_write(instance+24,struct.pack('<I',1));u.mem_write(instance+64,struct.pack('<I',1))
  for off,value in {0:185.,4:1.25,8:.8,40:1.15,64:.2,72:.1}.items():u.mem_write(stats+off,struct.pack('<f',value))
 if scenario=='singular_overlap':u.mem_write(instance+32,struct.pack('<f',3.))
 if scenario=='plural_no_overlap':u.mem_write(instance+64,struct.pack('<I',1))
 if scenario in ['modified','large_area']:u.mem_write(stats+52,struct.pack('<I',1))
 if scenario=='large_area':u.mem_write(stats+40,struct.pack('<f',20.))
 sp=STACK+0x1f0008;wq(sp,STOP)
 for r,v in [(UC_X86_REG_RSP,sp),(UC_X86_REG_RCX,out),(UC_X86_REG_RDX,instance),(UC_X86_REG_R8,stats)]:u.reg_write(r,v)
 try:u.emu_start(0x14585c8e0,STOP,count=400000)
 except Exception as e:raise RuntimeError(f"{row['key']} at{reg(UC_X86_REG_RIP):x}: {e}")from e
 assert reg(UC_X86_REG_RIP)==STOP
 print(row['key'],repr(pair(out+8)),numbers,flush=True)
 outputs.append(dict(key=row['key'],text=pair(out+8),expression=expression(pair(out+8),pieces),numbers=numbers))
(WORK/f'base-description-{scenario}.json').write_text(portable_json(outputs,indent=2)+'\n')
