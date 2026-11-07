#!/usr/bin/env python3
"""Replay bounded 0.113.2 race atlas selection/tint and verify the installed asset.

Does not compile code, launch the game, run OS/VM paths or evaluate GPU output.
Seams supply the allowed-race scan result, selected sex and64px cell constant;
original native instructions choose the race key, rectangle and RGB tint.
"""
from pathlib import Path
import hashlib,importlib.util,json,struct,sys
ROOT=next(path for path in Path(__file__).resolve().parents if (path/'AGENTS.md').is_file())
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
from coverage_common import latest_target,target_bytes,reference_config
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64
from unicorn.x86_const import *
SHA='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
target=latest_target(verify=True);assert target['sha256']==SHA
d=target_bytes(target)
spec=importlib.util.spec_from_file_location('portrait_pe',ROOT/'scripts/inventory-executable.py');pe_module=importlib.util.module_from_spec(spec);spec.loader.exec_module(pe_module);p=pe_module.PE(d)
def native(a,n):o=p.rva_offset(a-p.image_base);return d[o:o+n]
def setup():
 u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
 for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
 u.mem_map(0x200000000,0x100000);u.mem_map(0x300000000,0x200000);u.mem_map(0x400000000,4096)
 return u
u=setup();STOP=0x400000000;STACK=0x3001f0000;FRAME=0x300100000;SEX=0x200000100
u.mem_write(STACK,struct.pack('<Q',STOP));u.reg_write(UC_X86_REG_RSP,STACK);u.reg_write(UC_X86_REG_RBP,FRAME)
NAMES={1:'Human',2:'Orc',3:'Dwarf',4:'NightElf',5:'Undead',6:'Tauren',7:'Gnome',8:'Troll'}
EXPECTED={1:[0,0,64,64],2:[192,64,256,128],3:[64,0,128,64],4:[192,0,256,64],5:[64,64,128,128],6:[0,64,64,128],7:[128,0,192,64],8:[128,64,192,128]}
rows=[]
for race in range(1,9):
 u.reg_write(UC_X86_REG_RSP,STACK);u.reg_write(UC_X86_REG_RCX,race)
 u.emu_start(0x145808f20,STOP,count=100);assert u.reg_read(UC_X86_REG_RIP)==STOP
 definition=u.reg_read(UC_X86_REG_RAX);ptr,length=struct.unpack('<QQ',u.mem_read(definition+16,16));native_key=bytes(u.mem_read(ptr,length)).decode()
 for sex in (0,1):
  for allowed in (False,True):
   u.mem_write(FRAME+0x408,struct.pack('<Q',SEX));u.mem_write(SEX,bytes([sex]));u.reg_write(UC_X86_REG_R15,definition);u.reg_write(UC_X86_REG_RDI,race);u.reg_write(UC_X86_REG_R14,race if allowed else 255);u.reg_write(UC_X86_REG_XMM6,int.from_bytes(struct.pack('<f',64.)+bytes(12),'little'))
   u.emu_start(0x1402cbf0b,0x1402cc0fb,count=1000);assert u.reg_read(UC_X86_REG_RIP)==0x1402cc0fb
   rect=list(struct.unpack('<4f',u.mem_read(FRAME+0x5d4,16)));tint=list(struct.unpack('<4f',u.mem_read(FRAME+0x59c,16)));expected=EXPECTED[race].copy();expected[1]+=sex*128;expected[3]+=sex*128
   assert rect==expected,(race,sex,rect,expected);assert tint==([1.]*4 if allowed else[.25,.25,.25,1.]),(race,sex,allowed,tint)
   assert struct.unpack('<I',u.mem_read(FRAME+0x598,4))[0]==int(allowed)
   rows.append({'race':race,'name':NAMES[race],'native_key':native_key,'sex':sex,'allowed':allowed,'rect':rect,'tint':tint})
layout=json.loads((ROOT/'docs/analysis/evidence/0.92/picker-node-layout.json').read_text())['node_layout']
import capstone
md=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);md.detail=True
def memvec(ins):
 off=p.rva_offset(ins-p.image_base);i=next(md.disasm(d[off:off+16],ins));op=i.operands[-1];target=i.address+i.size+op.mem.disp;return int.from_bytes(native(target,16),'little')
button_cases=[]
for selected in (False,True):
 u.mem_write(FRAME+0x840,bytes(384));u.reg_write(UC_X86_REG_RBX,FRAME+0x840);u.reg_write(UC_X86_REG_RDI,1);u.reg_write(UC_X86_REG_R13,1 if selected else 2);u.reg_write(UC_X86_REG_XMM14,0)
 for reg,ins in [(UC_X86_REG_XMM7,0x1402cb61d),(UC_X86_REG_XMM13,0x1402cb364),(UC_X86_REG_XMM11,0x1402cb376),(UC_X86_REG_XMM8,0x1402cb624),(UC_X86_REG_XMM9,0x1402cb62c)]:u.reg_write(reg,memvec(ins))
 u.emu_start(0x1402cbc9f,0x1402cbe77,count=1000);b=bytes(u.mem_read(FRAME+0x840,384));out={}
 for k in ('width','height','border','border_radius','padding','margin','left','right','top','bottom','position_type','box_sizing'):
  o=layout['OFFSET_'+k]
  if k in ('border','border_radius','padding','margin'):v=[list(struct.unpack_from('<If',b,o+i*8))for i in range(4)]
  elif k in ('position_type','box_sizing'):v=b[o]
  else:v=list(struct.unpack_from('<If',b,o))
  out[k]=v
 border=list(struct.unpack('<I4f',u.mem_read(FRAME+0x3b0,20)));assert out['width']==[1,37.] and out['height']==[1,37.];assert out['border']==[[1,2.]]*4 and out['border_radius']==[[1,6.]]*4
 assert border==list(struct.unpack('<I4f',struct.pack('<I4f',0,*([.973,.824,.416,1.]if selected else[.169,.129,.071,1.]))))
 button_cases.append({'selected':selected,'node':out,'border':border})

# The source-owned race→racial mapping and menu image catalog must agree with current native data.
def pair(at):
 ptr,length=struct.unpack('<QQ',u.mem_read(at,16));return bytes(u.mem_read(ptr,length)).decode()
abilities={}
for i in range(113):
 at=0x146fe05c8+i*120;abilities[pair(at)]={'record_va':hex(at),'name':pair(at+16),'icon':pair(at+32)}
race_records=[]
for race in range(1,9):
 u.reg_write(UC_X86_REG_RSP,STACK);u.reg_write(UC_X86_REG_RCX,race);u.emu_start(0x145808f20,STOP,count=100);at=u.reg_read(UC_X86_REG_RAX);key=pair(at+48)
 race_records.append({'race':race,'record_va':hex(at),'name':pair(at),'atlas_key':pair(at+16),'racial_key':key,'ability':abilities[key]})
menu=json.loads((ROOT/'crates/azeroth-survivors-re/assets/menu.json').read_text());icons={a['key']:a['icon']for a in menu['abilities']}
for record in race_records:assert icons[record['racial_key']]==record['ability']['icon']
# Revalidate the live class/race eligibility source against its native scan.
import re
save_source=(ROOT/'crates/azeroth-survivors-re/src/save.rs').read_text().split('pub fn allowed_races',1)[1].split('/// Native appearance order',1)[0]
source_allowed={int(c):[int(n)for n in ns.split(',')if n.strip()]for c,ns in re.findall(r'(\d+) => &\[([0-9, ]*)\]',save_source)}
allowed_cases=[];PICK=0x200005000
for cls,expected in source_allowed.items():
 for race in range(1,9):
  u.mem_write(PICK+0x38,bytes([cls]));u.reg_write(UC_X86_REG_RAX,PICK);u.reg_write(UC_X86_REG_RDI,race);u.emu_start(0x1402cbc35,0x1402cbc93,count=1000);allowed=(u.reg_read(UC_X86_REG_R14)&255)==race;assert allowed==(race in expected)
  allowed_cases.append({'class':cls,'race':race,'allowed':allowed})
from unicorn import UC_HOOK_CODE
records=race_records
layout=json.loads((ROOT/'docs/analysis/evidence/0.92/picker-node-layout.json').read_text())['node_layout']
PARENT=0x200001000;CONTEXT=0x200002000;ASSET=0x200003000
u.mem_write(CONTEXT,struct.pack('<QQ',ASSET,0));u.mem_write(ASSET,struct.pack('<Q',0x12345));u.mem_write(PARENT,bytes(64))
seen=[]
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def hook(_u,a,size,_d):
 if 0x1402c75a0<=a<0x1402c7917 or 0x145808f60<=a<0x145808fc7 or 0x142674550<=a<0x14267458f:return
 c,r,r8,r9=[u.reg_read(reg)for reg in(UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9)];sp=u.reg_read(UC_X86_REG_RSP)
 if a==0x145cf9991:
  left,right=bytes(u.mem_read(c,r8)),bytes(u.mem_read(r,r8));u.reg_write(UC_X86_REG_RAX,0 if left==right else 1)
 elif a==0x1400de550:
  seen.append({'icon':bytes(u.mem_read(r8,r9)).decode()});u.mem_write(c,struct.pack('<3Q',1,2,3));u.reg_write(UC_X86_REG_RAX,c)
 elif a==0x145cf998b:u.mem_write(c,bytes(u.mem_read(r,r8)));u.reg_write(UC_X86_REG_RAX,c)
 elif a==0x140264950:
  node=bytes(u.mem_read(r8+8,384));image=bytes(u.mem_read(r8+8+0x200-0x30,136));seen[-1]['node']={k:list(struct.unpack_from('<If',node,layout['OFFSET_'+k]))for k in('width','height')};seen[-1]['image_hex']=image.hex();seen[-1]['image_color']=list(struct.unpack_from('<I4f',image,0x38));seen[-1]['rect_present']=struct.unpack_from('<I',image,0x70)[0];u.emu_stop();return
 else:raise RuntimeError(hex(a))
 u.reg_write(UC_X86_REG_RIP,q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
u.hook_add(UC_HOOK_CODE,hook)
for record in records:
 u.mem_write(CONTEXT+8,struct.pack('<Q',int(record['record_va'],16)));u.mem_write(STACK,struct.pack('<Q',STOP));u.reg_write(UC_X86_REG_RSP,STACK);u.reg_write(UC_X86_REG_RCX,PARENT);u.reg_write(UC_X86_REG_RDX,CONTEXT);u.emu_start(0x1402c75a0,STOP,count=10000);assert seen[-1]['icon']==record['ability']['icon'];assert seen[-1]['node']=={'width':[1,40.],'height':[1,40.]};assert seen[-1]['image_color']==[1,1.,1.,1.,1.] and seen[-1]['rect_present']==0;seen[-1].pop('image_hex');seen[-1]['race']=record['race']


# Reuse the existing bounded MPQ reader; bind the supplied nine-patch chain.
from script_sources import load_script
from coverage_common import artifact_path
mpq = load_script('portrait_mpq', ROOT/'scripts/check-minimap-lifecycle.py')
registered = json.loads((ROOT/'docs/analysis/target-refresh-0.113.2.json').read_text())['registered_identity']['runtime_data']['archives']
ordered = sorted(registered, key=lambda row: (not row['path'].lower().endswith('/patch.mpq'), row['path'].lower()))
assert [row['path'].split('/')[-1] for row in ordered] == ['patch.MPQ', *[f'patch-{i}.MPQ' for i in range(2,10)]]
assert {p.name.lower() for p in reference_config()['data_dir'].iterdir() if p.suffix.lower()=='.mpq'} == {row['path'].split('/')[-1].lower() for row in ordered}
for row in ordered:
 assert artifact_path(row['path']).stat().st_size == row['size_bytes']
archives = [mpq.Archive(row['path']) for row in ordered]
def read_member(name):
 for archive in reversed(archives):
  entry = archive.lookup(name)
  if entry is not None:return archive.path, archive.read(entry)
 raise AssertionError('Missing resource: '+name)

ATLAS='Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Races.blp'
asset_cases=[]
for key,path in [('race.atlas',ATLAS)]+[(record['racial_key'],'Interface\\Icons\\'+record['ability']['icon']+'.blp')for record in race_records]:
 archive,raw=read_member(path)
 assert raw[:4]==b'BLP2';width,height=struct.unpack_from('<II',raw,12)
 mip_offsets=struct.unpack_from('<16I',raw,20);mip_sizes=struct.unpack_from('<16I',raw,84)
 assert mip_offsets[0]>0 and mip_sizes[0]>0
 for offset,size in zip(mip_offsets,mip_sizes):
  assert bool(offset)==bool(size)
  if offset:assert offset+size<=len(raw)
 if key=='race.atlas':assert(width,height)==(256,256) and hashlib.sha256(raw).hexdigest()=='d2d36f83715364b6bee51ec54ff82cf2dec27458902408312a7446382982820d'
 asset_cases.append({'key':key,'archive':archive.name,'member':path,'size_bytes':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),'width':width,'height':height,'blp_header':raw[:20].hex(),'mip_levels':sum(bool(at) for at in mip_offsets)})
spans=[(0x145808f20,0x145808f3f,'race-record-getter'),(0x1402cbc35,0x1402cc269,'appearance-portrait'),(0x1402cc279,0x1402cc33a,'appearance-bundle'),(0x1402c75a0,0x1402c7917,'tooltip-portrait'),(0x142674550,0x14267458f,'image-node-new'),(0x145808f60,0x145808fc7,'ability-lookup')]
data_spans=[(0x145efdd8c,66,'race-atlas-url'),(0x146fddf08,88*8,'race-records'),(0x146fe3610,120*8,'racial-ability-records'),(0x145efd3e0,8,'disabled-allowed-tint'),(0x145efd948,20,'selected-frame-color'),(0x145efdd78,20,'ordinary-frame-color'),(0x145efdcc8,20,'opaque-black-background'),(0x145f03030,16,'race-key-length-jump-table')]
result={'target_sha256':SHA,'code_ranges':[{'start':hex(a),'end_exclusive':hex(b),'role':role,'size_bytes':b-a,'sha256':hashlib.sha256(native(a,b-a)).hexdigest()}for a,b,role in spans],'data_ranges':[{'va':hex(a),'size_bytes':n,'role':role,'sha256':hashlib.sha256(native(a,n)).hexdigest(),'bytes_hex':native(a,n).hex()}for a,n,role in data_spans],'portrait_cases':rows,'class_eligibility_cases':allowed_cases,'button_cases':button_cases,'tooltip_cases':seen,'race_records':race_records,'assets':asset_cases,'shadow_contract':{'selected':{'srgb':[.973,.824,.416,.7],'offset':[0,0],'spread_px':1,'blur_px':12},'ordinary':{'srgb':[0,0,0,.85],'offset':[0,0],'spread_px':0,'blur_px':6},'evidence':'Original selected branch1402cc19a..1402cc268 plus current literal source bytes; native shadow allocation/color conversion are not replayed.'},'ghidra':[{'role':'appearance','evidence_id':'ev_51b08c210dc5a22848f35d5b4a40cfa7ed2663520c31d8fe6be885f1ffd803dd'},{'role':'tooltip','evidence_id':'ev_2a6c11ebde737531199b2e92e2b89b3853ff11acaa45662fb7d09b57456be0d0'}],'seams':['The32 atlas cases supply native allowed-scan results and selected sex;72 separate cases execute the actual current native class eligibility scan and compare existing source.','Node initialization supplies only native preloaded vector constants and current selected/queried race.','Tooltip asset-server read returns a declared24-byte dummy handle; original RaceDef and ability lookup, ImageNode::new, Node and tuple composition execute.','Memcpy/memcmp are bounded byte-copy/compare fixtures; ECS submission is intercepted before execution.','MPQ members are decoded from configured installed archives in memory; no installed input is modified and no asset is shipped.'],'limits':['Raw Ghidra slices omit external globals/callees; current PE data, instruction replay and jump-table reads supply the demonstrated branch behavior.','No Rust compilation, game/application launch, reconstructed UI execution, GPU filtering/layout or original/rebuilt parity comparison.','Registered archive-wide SHA records are separate from this member-level byte/hash check.']}
# Source assertions protect live consumers and state/lifetime wiring, not Rust execution.
source=(ROOT/'crates/azeroth-survivors-re/src/armory/race_portraits.rs').read_text()
for race,(x,y,_,_) in EXPECTED.items():
 assert f'{race} => ({x}., {y}.),' in source
for token in ['f32::from(sex) * 128.', 'Rect::new(x, y, x + 64., y + 64.)', 'Color::srgb(0.25, 0.25, 0.25)', 'ImageNode::new(art.icons.get(crate::assets::RACE_ATLAS)?', 'Action::Race(race)', 'disabled: !allowed', 'NativeStaticFrame', 'Val::Px(37.)', 'UiRect::all(Val::Px(2.))', 'Val::Px(6.)', 'BackgroundColor(Color::BLACK)', 'Color::srgb(0.169, 0.129, 0.071)', 'Color::srgba(0.973, 0.824, 0.416, 0.7)', 'Color::srgba(0., 0., 0., 0.85)', 'Val::Px(if selected { 12. } else { 6. })']:
 assert token in source,token
art=(ROOT/'crates/azeroth-survivors-re/src/assets.rs').read_text()
assert 'RACE_ATLAS,' in art and ATLAS.replace('\\','\\\\') in art
armory=(ROOT/'crates/azeroth-survivors-re/src/armory.rs').read_text()
assert 'race_portraits::spawn(' in armory and 'state.sex,' in armory
assert '&format!("race.{name}")' not in armory
assert 'sources.iter().find_map' in (ROOT/'crates/azeroth-survivors-re/src/armory/race_tip.rs').read_text()
tip=(ROOT/'crates/azeroth-survivors-re/src/armory/race_tip.rs').read_text()
assert 'mechanics::racial_definition(race_id)' in tip and 'art.icons.get(ability.key)' in tip
mechanics=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics.rs').read_text().split('pub fn racial_definition',1)[1].split('///',1)[0]
for row in race_records:assert f"{row['race']} => \"{row['racial_key']}\"" in mechanics
# Compact reproducible outcomes; full regenerable matrices remain in runtime.
digest=lambda value:hashlib.sha256(json.dumps(value,separators=(',',':'),sort_keys=True).encode()).hexdigest()
compact={k:result[k] for k in ['target_sha256','code_ranges','data_ranges','button_cases','tooltip_cases','race_records','assets','shadow_contract','ghidra','seams','limits']}
for row in compact['data_ranges']:
 if row['size_bytes']>80:row.pop('bytes_hex',None)
compact['portrait_cases']={'count':len(rows),'sha256':digest(rows)}
compact['class_eligibility_cases']={'count':len(allowed_cases),'sha256':digest(allowed_cases)}
import argparse
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
directory=ROOT/('runtime/analysis/history/inventory/armory-races/b9e0f34c201a/staged' if args.stage else 'docs/analysis/evidence/0.113.2/race-portraits')
if args.stage:
 directory.mkdir(parents=True,exist_ok=True)
 (directory/'cases.json').write_text(json.dumps(compact,indent=2)+'\n')
else:
 assert json.loads((directory/'cases.json').read_text())==compact
 manifest=json.loads((directory/'manifest.json').read_text())
 assert hashlib.sha256((directory/'cases.json').read_bytes()).hexdigest()==manifest['cases']['sha256']
 assert manifest['target_sha256']==SHA
 for row in manifest['code_ranges']:
  a,b=int(row['start'],16),int(row['end_exclusive'],16)
  assert hashlib.sha256(native(a,b-a)).hexdigest()==row['sha256']
  assert hashlib.sha256((directory/row['assembly']).read_bytes()).hexdigest()==row['assembly_sha256']
print(f"Passed {len(rows)} race/sex/tint cases, {len(allowed_cases)} class eligibility cases, {len(button_cases)} button Nodes, {len(seen)} tooltip constructors and {len(asset_cases)} current MPQ members; source wiring checked.")
