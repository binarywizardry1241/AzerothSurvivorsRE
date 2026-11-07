#!/usr/bin/env python3
"""Replay current post-import Pick restore/default/normalization/unlock and name fragment selection."""
from script_sources import load_script
import sys, json, struct, argparse, hashlib, re, itertools
from pathlib import Path
sys.path[:0]=['scripts','runtime/tool-state/python/camera/python-libs','runtime/tool-state/python/armory/python-libs']
from coverage_common import latest_target,target_bytes
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as R
ROOT=Path(__file__).resolve().parents[1];
SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
assert latest_target(verify=False)['sha256']==SHA
m = load_script('pe', 'scripts/inventory-executable.py');data=target_bytes(latest_target(verify=False));p=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
mem=0x200000000;stack=0x300000000;done=0x400000000
for at,n in [(mem,0x100000),(stack,0x10000),(done,4096)]:u.mem_map(at,n)
cursor=mem+0x1000;ctx={};seams=set();extra_stop=0;ranges=[(0x140062330,0x14006253f),(0x1458a7fc0,0x1458a8367),(0x14589c030,0x14589c1c7),(0x1458a92f0,0x1458a93d5),(0x14588d0d0,0x14588d1f9)]
def reg(n,v=None):
 a=getattr(R,'UC_X86_REG_'+n)
 if v is not None:u.reg_write(a,v)
 return u.reg_read(a)
def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def alloc(n):
 global cursor
 a=cursor;cursor+=(n+31)&~15;return a
def string(a,text):
 text=text.encode();pointer=alloc(len(text));u.mem_write(pointer,text);put(a,'3Q',len(text),pointer,len(text))
def stringval(a):return bytes(u.mem_read(q(a+8),q(a+16))).decode()
def pick(a,v):
 name,zone,mods,hero=v;string(a,name);string(a+24,zone);put(a+48,'4H',*mods);put(a+56,'8B',*hero)
def hook(_,a,n,__):
 if a in (done,extra_stop):u.emu_stop();return
 if any(lo<=a<hi for lo,hi in ranges)or 0x140064057<=a<0x14006410e:return
 c,d,r8=[reg(n)for n in ['RCX','RDX','R8']];seams.add(hex(a))
 if a==0x14589d550:
  u.mem_write(c,bytes(0x1d0));put(c+0x150,'q',-1)
  if ctx['pick']is not None:pick(c+0x150,ctx['pick'])
  if ctx['unlocked']is not None:
   at=alloc(16);put(at,'B',ctx['class']);put(at+8,'Q',ctx['unlocked']);put(c+0x20,'QQ',at,1)
 elif a==0x145bcd2f0:string(c,stringval(d));reg('RAX',c)
 elif a==0x1400021c0:reg('RAX',alloc(c))
 elif a in [0x140002200,0x1400021d0,0x140009eb0]:pass
 elif a==0x145bfa0e7:u.mem_write(c,bytes(u.mem_read(d,r8)));reg('RAX',c)
 elif a==0x145bfa0e1:
  left,right=bytes(u.mem_read(c,r8)),bytes(u.mem_read(d,r8));reg('RAX',((left>right)-(left<right))&0xffffffff)
 elif a==0x1458a8710:
  text=bytes(u.mem_read(c,d)).decode();reg('RAX',255 if text and all(x.isalpha()or x==' 'for x in text)else 0)
 elif a==0x1458a8fa0:string(c,bytes(u.mem_read(d,r8)).decode().title());reg('RAX',c)
 elif a==0x140089200:reg('RAX',c);reg('RDX',d)
 elif a==0x1459a2280:reg('RAX',c) # All provided feature words are zero; engine limit lookup is separate.
 elif a==0x140063ff0:string(c,'Generated');ctx['random']+=1;reg('RAX',c)
 else:raise RuntimeError(('unknown',hex(a),hex(q(reg('RSP')))))
 sp=reg('RSP');reg('RIP',q(sp));reg('RSP',sp+8)
u.hook_add(UC_HOOK_CODE,hook)
def run(value,unlocked=None):
 global cursor
 cursor=mem+0x1000;ctx.update(pick=value,unlocked=unlocked,**{'class':value[3][0]if value else 1},random=0);u.mem_write(mem,bytes(0x100000));u.mem_write(stack,bytes(0x10000));sp=stack+0x8008;put(sp,'Q',done);reg('RSP',sp);reg('RCX',mem);reg('MXCSR',0x1f80);reg('EFLAGS',2);u.emu_start(0x140062330,0,count=100000);assert reg('RIP')==done
 return dict(name=stringval(mem),zone=stringval(mem+24),mods=list(struct.unpack('<4H',u.mem_read(mem+48,8))),hero=list(u.mem_read(mem+56,8)),random=ctx['random'])

rows=[]
zone_keys=[row['key']for row in json.loads((ROOT/'crates/azeroth-survivors-re/assets/menu.json').read_text())['zones']]
source=(ROOT/'crates/azeroth-survivors-re/src/save.rs').read_text();races={int(c):[int(v)for v in values.split(',')if v.strip()]for c,values in re.findall(r'(\d+) => &\[([^]]+)\]',source)}
for cls,zone,opened in itertools.product([1,2,3,4,5,7,8,9,11,255],zone_keys,[None,0,1,5,12,99]):
 value=('Arthas',zone,[101,124,109,104],[cls,255,4,0,0,0,0,0]);actual=run(value,opened);valid=cls if cls in races else 1;count=min(max(opened or 1,1),12)if cls==valid else 1;index=zone_keys.index(zone);expected_zone=zone_keys[index if index<count else count-1]
 assert actual==dict(name='Arthas',zone=expected_zone,mods=[100]*4,hero=[valid,races[valid][0],1,0,0,0,0,0],random=0),(value,opened,actual);rows.append(dict(pick=value,opened=opened,result=actual))
for value in [None,('Hero','elwynn',[100]*4,[1,1,0,0,0,0,0,0]),('Arthas','naxx',[500,500,300,150],[1,1,0,0,0,0,0,0])]:
 actual=run(value);assert actual['name']==('Arthas'if value and value[0]=='Arthas'else 'Generated');assert actual['zone']=='elwynn';rows.append(dict(pick=value,opened=None,result=actual))
# The real generator's clock-independent xorshift/select fragment, with exact native tables.
fragments={};tables={'prefix':(0x145dce9f8,20),'middle':(0x145dceb60,16),'suffix':(0x145dcec70,10)}
for key,(a,n)in tables.items():fragments[key]=[bytes(u.mem_read(q(a+i*16),q(a+i*16+8))).decode()for i in range(n)]
assert fragments==json.loads((ROOT/'crates/azeroth-survivors-re/assets/hero-name.json').read_text())
names=[];extra_stop=0x14006410e
for seed in [0,1,2,7,0xffffffffffffffff,0x9e3779b97f4a7c12,0x9e3779b97f4a7c15,0x123456789abcdef0]:
 reg('RAX',seed);u.emu_start(0x140064057,0,count=1000);assert reg('RIP')==extra_stop
 selected=[bytes(u.mem_read(q(reg(r)),q(reg(r)+8))).decode()for r in ['RAX','RDX','R8']]
 state=seed;indices=[]
 for limit in [20,16,10]:
  state^=(state<<13)&0xffffffffffffffff;state^=state>>7;state^=(state<<17)&0xffffffffffffffff;indices.append(state%limit)
 want=[fragments[key][i]for key,i in zip(['prefix','middle','suffix'],indices)];assert selected==want;names.append(dict(seed=seed,name=''.join(selected)[:12]))
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
md=Cs(CS_ARCH_X86,CS_MODE_64);out=ROOT/'docs/analysis/evidence/import-restore';ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
if args.write:out.mkdir(parents=True,exist_ok=True)
records=[]
for role,a,b in [('restore',0x140062330,0x14006253f),('normalize-pick',0x1458a7fc0,0x1458a8367),('clamp-zone',0x14589c030,0x14589c1c7),('default-pick',0x1458a92f0,0x1458a93d5),('random-name',0x140063ff0,0x14006418d)]:
 off=p.rva_offset(a-p.image_base);raw=data[off:off+b-a];ins=list(md.disasm(raw,a));assert sum(i.size for i in ins)==len(raw);assembly=''.join(f'{i.address:#x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins);file=out/(role+'.asm')
 if args.write:file.write_text(assembly)
 else:assert file.read_text()==assembly
 records.append(dict(role=role,start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw).hexdigest(),assembly=file.name))
queries=[]
for a in ['140062330','1458a7fc0','14589c030','140063ff0']:
 file=ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0'/a/'rea-fast/003-procedure_pseudo_code.json'
 if file.exists():
  z=json.loads(file.read_text())['response']['result']['structuredContent'];queries.append(dict(procedure='0x'+a,evidence_id=z['evidence_id'],subject_sha256=z['subject']['digest']['sha256'],analysis_profile_digest=z['analysis_profile']['digest']))
if not queries:queries=json.loads((out/'manifest.json').read_text())['ghidra']
menu=(ROOT/'crates/azeroth-survivors-re/src/menu_state.rs').read_text();assert 'state.restore_pick(&MenuCatalog::embedded())'in menu and 'self.restore_pick(catalog)'in menu;body=menu.split('fn restore_pick',1)[1].split('pub fn class_id',1)[0];assert 'self.save.heroes()'not in body and 'self.selected_character_guid'not in body and 'self.page ='not in body
backend=(ROOT/'crates/azeroth-survivors-re/src/menu_state/backend.rs').read_text();assert 'self.save_path.as_deref().map(Save::load)'in backend;assert 'self.pending_commands.push(backend::Command::Reload)'in menu and 'self.save = imported' in menu
manifest=dict(target_sha256=SHA,ranges=records,ghidra=queries,canonical_import_call='../in-run-bindings/options-events.asm',canonical_backend_reload='../addon-bridge/lifecycle-rea.json#frontend_command',canonical_zone_parser='../stock-lifecycle/zone-parser.asm',canonical_name_contract='../stock-lifecycle/manifest.json',checks=dict(restore=len(rows),name_seeds=len(names),name_fragments=sum(n for a,n in tables.values())),seams=sorted(seams),limits=['The complete restore helper, default constructor, Pick class/race/sex/modifier normalizer and unlock clamp execute against synthetic typed Save state.','Active-save read, allocation/clone/free, name validation/trim/titlecase and random-name result are declared host seams. All feature inputs are zero: identity feature seam is valid for any successful/missing limits result.','The separate random-name fragment replays eight input seeds and verifies all46 fragment strings; full clock, formatter and UTF-8 iterator behavior remain host boundaries.','This does not exercise actual file operations, worker25ms/scheduler order, engine feature-limit lookup, Rust or application/game execution. Separate account-command owners/report covers queued reload and distinct frontend/backend Save source ownership.'])
for name,value in [('manifest.json',manifest),('native-vectors.json',dict(restore=rows,names=names,fragments=fragments))]:
 text=json.dumps(value,separators=(',',':'))+'\n';file=out/name
 if args.write:file.write_text(text)
 else:assert file.read_text()==text,name
print(f'Current import restore: {len(rows)} paths, {len(names)} native name seeds,46 exact fragments; no build/game')
