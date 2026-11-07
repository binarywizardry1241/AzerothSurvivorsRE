#!/usr/bin/env python3
"""Current Rewards input/confirmation replay; no save, build or game."""
from script_sources import load_script
import argparse,ast,hashlib,importlib.util,json,struct,sys
from pathlib import Path
from coverage_common import ROOT,latest_target,target_bytes
sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as r
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
t=latest_target(verify=True);assert t['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0';d=target_bytes(t)
m = load_script('pe', ROOT/'scripts/inventory-executable.py');p=m.PE(d)
retained=ROOT/'docs/analysis/evidence/0.109.0/rewards-menu'
for row in json.loads((retained/'manifest.json').read_text())['functions']:
 off=p.rva_offset(int(row['address'],16)-p.image_base)
 assert hashlib.sha256(d[off:off+row['byte_count']]).hexdigest()==row['sha256'],row['name']
 for kind in('assembly','pseudocode'):
  if kind in row:assert hashlib.sha256((ROOT/row[kind]).read_bytes()).hexdigest()==row[kind+'_sha256']
mapping=json.loads((retained/'address-map.json').read_text());am={int(a,16):int(b,16)for a,b in mapping['addresses'].items()};records={}
# The existing bounded algorithm is rebound only through independently verified
# full current owners; unmapped historical addresses fail closed.
fixture=ROOT/'scripts/recover-rewards-menu.py';tree=ast.parse(fixture.read_text());tree.body=[v for v in tree.body if isinstance(v,(ast.Import,ast.ImportFrom))or isinstance(v,ast.FunctionDef)and v.name=='fixtures']
class Rebind(ast.NodeTransformer):
 def visit_Constant(self,n):
  if isinstance(n.value,int)and 0x140000000<=n.value<0x149000000:assert n.value in am,hex(n.value);n.value=am[n.value]
  return n
ns=dict(ROOT=ROOT,SHA=t['sha256'],WORK=Path('.'),write=lambda path,value:records.update(value))
exec(compile(ast.fix_missing_locations(Rebind().visit(tree)),str(fixture),'exec'),ns);ns['fixtures'](d,p)
u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in p.sections);u.mem_map(p.image_base,(extent+4095)&~4095)
for s in p.sections:u.mem_write(p.image_base+s['rva'],d[s['raw_offset']:s['raw_offset']+s['raw_size']])
H,S,STOP=0x200000000,0x300000000,0x400000000;u.mem_map(H,0x100000);u.mem_map(S,0x10000);u.mem_map(STOP,4096)
def get(n):return u.reg_read(getattr(r,'UC_X86_REG_'+n))
def setr(n,v):u.reg_write(getattr(r,'UC_X86_REG_'+n),v)
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
def ret():sp=get('RSP');setr('RIP',q(sp));setr('RSP',sp+8)
confirmation=[]
for present in(False,True):
 for accepted in(False,True):
  u.mem_write(H,bytes(0x10000));sp=S+0x8008;put(sp,'Q',STOP);put(H+0x118,'Q',0 if present else 0xffffffffffffffff);calls=[]
  def confirm(_,a,n,__):
   if a==STOP:u.emu_stop();return
   if 0x140105ab0<=a<0x140105cea:return
   if a==0x1400af1a0:put(get('RCX'),'QQQ',0,8,0)
   elif a==0x1458d8080:calls.append('apply');setr('RAX',int(accepted))
   elif a==0x1401838a0:assert struct.unpack('<I',u.mem_read(get('RDX'),4))[0]==17;calls.append('enqueue17')
   elif a in(0x140002200,0x1400021d0):pass
   else:raise AssertionError(hex(a))
   ret()
  hook=u.hook_add(UC_HOOK_CODE,confirm)
  for n,v in [('RSP',sp),('RCX',H+0x100),('RDX',H+0x200),('R8',H+0x300)]:setr(n,v)
  u.emu_start(0x140105ab0,STOP,count=600);u.hook_del(hook);assert get('RIP')==STOP and q(H+0x118)==0xffffffffffffffff
  assert calls==(['apply']+(['enqueue17']if accepted else[])if present else[])
  confirmation.append(dict(present=present,accepted=accepted,plan_consumed=True,calls=calls))
navigation=[]
for destination in(0,3,254,255):
 u.mem_write(H,bytes(0x10000));sp=S+0x8008;bp=H+0x1000;state=H+0x3000;put(bp+0x238,'Q',H+0x200);put(bp+0x1a8,'Q',H+0x208);put(bp+0x248,'Q',state);put(bp+0x218,'Q',H+0x400);put(bp+0x1b0,'Q',H+0x500);put(state+0x72,'B',1);put(state+0x76,'BB',6,destination);calls=[]
 def continuation(_,a,n,__):
  if a in(0x140116213,0x140116f48):u.emu_stop();return
  if 0x14011689a<=a<0x140116983:return
  if a==0x140105ab0:calls.append('confirm');ret()
  else:raise AssertionError(hex(a))
 hook=u.hook_add(UC_HOOK_CODE,continuation);setr('RSP',sp);setr('RBP',bp);setr('R14',state);u.emu_start(0x14011689a,0,count=200);u.hook_del(hook)
 assert calls==['confirm']and u.mem_read(state+0x77,1)[0]==254
 assert get('RIP')==(0x140116f48 if destination==255 else 0x140116213)
 if destination not in(254,255):assert u.mem_read(state+0x76,1)[0]==destination
 navigation.append(dict(destination=destination,continued=True,close_branch=destination==255))
source=(ROOT/'crates/azeroth-survivors-re/src/progression.rs').read_text();confirm_source=source.split('Action::Confirm => {',1)[1].split('Action::Undo =>',1)[0];assert 'view.plan.take()'in confirm_source
leave=source.split('Action::ConfirmLeave | Action::DiscardLeave => {',1)[1].split('Action::KeepEditing',1)[0];assert 'view.plan.take()'in leave and 'let accepted'not in leave and 'menu.page = destination;'in leave
prerequisites=[]
for row_rank in(0,1):
 for required in(False,True):
  for prerequisite_rank in(0,1):
   u.mem_write(H,bytes(0x10000));sp=S+0x8008;bp=H+0x1000;descriptor=H+0x2000;rows=H+0x3000
   u.mem_write(H+0x4000,b'parent');put(descriptor+0x60,'QQ',H+0x4000 if required else 0,6);put(rows,'QQQB',6,H+0x4000,6,prerequisite_rank);put(bp+0x60,'Q',32);put(bp+0x80,'Q',rows);put(rows+0x38,'B',row_rank)
   def prerequisite(_,a,n,__):
    if a in(0x1458d78e0,0x1458d7b0e):u.emu_stop();return
    if 0x1458d7a5c<=a<0x1458d7abd:return
    if a==0x145bfa0e1:
     left=bytes(u.mem_read(get('RCX'),get('R8')));right=bytes(u.mem_read(get('RDX'),get('R8')));setr('RAX',0 if left==right else 1);ret();return
    raise AssertionError(hex(a))
   hook=u.hook_add(UC_HOOK_CODE,prerequisite)
   for n,v in [('RSP',sp),('RBP',bp),('RAX',descriptor),('R13',rows)]:setr(n,v)
   u.emu_start(0x1458d7a5c,0,count=200);u.hook_del(hook)
   accepted=get('RIP')==0x1458d78e0;assert accepted==(not required or prerequisite_rank>0)
   prerequisites.append(dict(explicit_row_rank=row_rank,required=required,prerequisite_rank=prerequisite_rank,accepted=accepted))
records.update(confirmation=confirmation,confirm_continuations=navigation,prerequisites=prerequisites)
records['limitations']+=['Eight current prerequisite-block cases use explicit descriptor/row inputs and memcmp; they do not execute the complete plan validator.','Four complete current confirmation-helper cases use explicit clone/apply/enqueue/disposal seams; validation and real persistence are not executed.','Four current Confirm-leave continuations call a fixture helper and stop before the native outer loop/close branch. Destination tag2 additional gear-selection path is separately owned by Armory input recovery.']
path=ROOT/('runtime/analysis/staging/native-evidence/0.109.0/rewards-menu'if args.stage else'docs/analysis/evidence/0.109.0/rewards-menu')/'input.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(records,indent=2)+'\n')
else:assert json.loads(path.read_text())==json.loads(json.dumps(records))
print('Passed26 current Rewards input/confirmation/prerequisite cases; no persistence/build/game')
