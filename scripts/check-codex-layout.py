#!/usr/bin/env python3
"""Replay current Codex grid/default Details/progress constructors, without builds.

UI submission, asset/font handles, account getters, disposal, allocation, color
conversion and formatting/localization are explicit fixture seams. None renders
or executes the original or reconstructed application.
"""
from script_sources import load_script
import argparse, hashlib, json, struct, sys
from coverage_common import ROOT,latest_target,target_bytes
from pathlib import Path
R=ROOT
sys.path[:0]=[str(R/'runtime/tool-state/python/camera/python-libs'),str(R/'runtime/tool-state/python/armory/python-libs')]
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
target=latest_target(verify=True)
assert target['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
d=target_bytes(target)
m = load_script('pe', R/'scripts/inventory-executable.py');p=m.PE(d)

def sample(role, selected=False, known=False, kind=1):
 u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
 for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
 u.mem_map(0x200000000,0x1000000);u.mem_map(0x300000000,0x200000);u.mem_map(0x400000000,4096);heap=0x200010000;STOP=0x400000000
 layout=json.loads((R/'docs/analysis/evidence/0.92/picker-node-layout.json').read_text())['node_layout'];layout['OFFSET_flex_grow']=348
 records=[];texts=[]
 def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
 def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
 def alloc(n):
  nonlocal heap
  a=heap;heap+=(n+15)&~15;return a
 def outstr(a,v):
  b=v.encode();at=alloc(len(b)+1);u.mem_write(at,b);u.mem_write(a,struct.pack('<QQQ',len(b),at,len(b)))
 def node(a):
  b=bytes(u.mem_read(a,384));out={}
  for key,off in layout.items():
   if key=='NODE_SIZE':continue
   key=key.removeprefix('OFFSET_')
   if key in ['left','right','top','bottom','width','height','min_width','min_height','max_width','max_height','flex_basis','row_gap','column_gap']:out[key]=list(struct.unpack_from('<If',b,off))
   elif key in ['margin','padding','border','border_radius']:out[key]=[list(struct.unpack_from('<If',b,off+i*8))for i in range(4)]
   elif key in ['flex_grow','flex_shrink','scrollbar_width']:out[key]=struct.unpack_from('<f',b,off)[0]
   elif off>=370:out[key]=b[off]
  out['overflow']=list(b[356:358])
  return out
 start,finish={'codex-detail':(0x14021eaf0,0x140221f13),'codex-page':(0x14021bc60,0x14021e00d)}[role]

 def hook(_,a,size,_2):
  if start<=a<finish:return
  if a==STOP:u.emu_stop();return
  c,d,r8,r9=[u.reg_read(r)for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]];sp=u.reg_read(UC_X86_REG_RSP);site=q(sp)-5
  if a==0x1401f8a70:
   records.append(dict(site=hex(site),node=node(d)));u.reg_write(UC_X86_REG_RAX,c)
  elif 0x1403650a0<=a<0x140365792 or 0x1459a3680<=a<0x1459a374e:return
  elif a==0x140366fc0:
   u.mem_write(c,bytes(120));wq(c+16,0xffffffffffffffff);wq(c+56,0xffffffffffffffff);wq(c+96,0xffffffffffffffff);u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x144e1e910:u.reg_write(UC_X86_REG_RAX,1)
  elif a==0x1400a88e0:u.mem_write(c,struct.pack('<QQQ',0,8,0));u.reg_write(UC_X86_REG_RAX,c)
  elif 0x14588d790<=a<0x14588d7af:return
  elif a==0x14588c140:u.reg_write(UC_X86_REG_RAX,q(c));u.reg_write(UC_X86_REG_RDX,q(c+8))
  elif a==0x140364530:u.mem_write(c,struct.pack('<QQQ',0,8,0));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x14589df20:u.reg_write(UC_X86_REG_RAX,int(known));u.reg_write(UC_X86_REG_RDX,4)
  elif a==0x140364670:u.reg_write(UC_X86_REG_RAX,4)
  elif a in [0x145894960,0x145892450,0x140367400]:u.reg_write(UC_X86_REG_RAX,alloc(4));u.reg_write(UC_X86_REG_RDX,0)
  elif a==0x145bcb870:outstr(c,bytes(u.mem_read(d,r8)).decode().upper())
  elif a==0x145891780:u.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack('<f',.1),'little'))
  elif a==0x145891df0:outstr(c,'fixture effect')
  elif a==0x145892c50:u.mem_write(c,bytes(128))
  elif a==0x145892f90:
   at=alloc(24);txt=alloc(16);u.mem_write(txt,b'fixture effect');u.mem_write(at,struct.pack('<QQQ',14,txt,14));u.mem_write(c,struct.pack('<QQQ',1,at,1))
  elif a in [0x1401794d0,0x140223740,0x140365a00]:pass
  elif a in [0x1401de510,0x1401e1e40,0x1401defd0,0x1401e2c10]:
   records.append(dict(site=hex(site),node=node(r8+8)));u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x140125ff0,0x1401008c0,0x140100b90,0x1426eca60]:u.mem_write(c,bytes(128));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x144c7dcf0:u.mem_write(c,bytes(24)+struct.pack('<Q',alloc(512)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x142649b80:u.mem_write(c,struct.pack('<QQQ',0,8,0)+bytes(24));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x1458ec450,0x1458ec500]:u.reg_write(UC_X86_REG_RAX,c);u.reg_write(UC_X86_REG_RDX,d)
  elif a==0x1458ec8b0:outstr(c,bytes(u.mem_read(d,r8)).decode());u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x14022a710:pass
  elif a==0x1401f2bf0:
   texts.append(dict(site=hex(site),size=struct.unpack('<f',u.mem_read(r8+80,4))[0]))
   u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145bfa0e7:u.mem_write(c,bytes(u.mem_read(d,r8)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145bcce30:outstr(c,'0%')
  elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(c))
  elif a in [0x140002200,0x1400021d0]:pass
  else:raise RuntimeError(f'Unknown {a:#x} at {site:#x}')
  u.reg_write(UC_X86_REG_RIP,q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
 u.hook_add(UC_HOOK_CODE,hook)
 parent=alloc(64);context=alloc(128);art=alloc(512)
 u.mem_write(parent,bytes(64));wq(context,art)
 for i in range(8):
  at=alloc(1024);wq(context+i*8,at)
  for off in range(0,512,24):u.mem_write(at+off,b'\x01')
  if i in (1,2,3):u.mem_write(at,struct.pack('<I',1520 if i==1 else 0))
  if i==4:u.mem_write(at,b'\xff')
 sp=0x3001f0008;wq(sp,STOP);u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,parent);u.reg_write(UC_X86_REG_RDX,context)
 if role=='codex-page':
  wq(context+64,alloc(8));wq(q(context+64),0);wq(q(context+8),alloc(1024));u.mem_write(q(q(context+8)),b'\x01\x01');u.mem_write(q(context),b'\x01')
 if role=='codex-detail':
  wq(q(context+8),kind if selected else 0xffffffffffffffff);wq(q(context+8)+8,0);wq(0x14808a3d8,alloc(16));wq(q(0x14808a3d8),0x146be91b8);wq(q(0x14808a3d8)+8,22);wq(0x14808a3e0,alloc(16));wq(q(0x14808a3e0),0x146bea470);wq(q(0x14808a3e0)+8,17);font=alloc(32);u.mem_write(font,b'\x01');u.mem_write(q(context),b'\x01')
 try:u.emu_start(start,STOP,count=100000)
 except Exception as e:
  raise RuntimeError(hex(u.reg_read(UC_X86_REG_RIP))+': '+str(e)) from e
 assert u.reg_read(UC_X86_REG_RIP)==STOP
 return dict(nodes=records,texts=texts)

results={role:sample(role)for role in ['codex-page','codex-detail']}
results.update({name:sample('codex-detail',True,known,kind)for name,known,kind in [('shared-unseen',False,1),('shared-seen',True,1),('jewelry-unseen',False,0),('jewelry-seen',True,0)]})
page=results['codex-page'];nodes=page['nodes'];footer=next(row['node']for row in nodes if row['site']=='0x14021d998')
assert footer['margin'][2]==[0,0.] and footer['row_gap']==[1,6.]
assert nodes[1]['node']['display']==1 and nodes[1]['node']['row_gap']==[1,6.] and nodes[1]['node']['column_gap']==[1,6.]
assert [row['size']for row in page['texts']]==[11.,11.,12.,13.]
assert [row['size']for row in results['codex-detail']['texts']]==[14.,14.]
assert [row['size']for row in results['shared-unseen']['texts']]==[16.,12.,13.]
assert [row['size']for row in results['shared-seen']['texts']]==[16.,12.,13.,12.]
assert [row['size']for row in results['jewelry-seen']['texts']]==[16.,12.,12.,11.,12.]
for role in ['shared-unseen','shared-seen','jewelry-unseen','jewelry-seen']:
 header=next(x['node']for x in results[role]['nodes']if x['site']=='0x14021f824')
 assert header['column_gap']==[1,12.] and header['align_items']==5
jewelry=results['jewelry-seen']['nodes']
assert len([x for x in jewelry if x['site']=='0x140221220'])==5
for row in jewelry:
 if row['site']=='0x140220e70':assert row['node']['width']==[0,0.] and row['node']['column_gap']==[1,8.]
 if row['site']=='0x140221220':assert row['node']['width']==[1,84.] and row['node']['flex_shrink']==0.

bar=next(row['node']for row in nodes if row['site']=='0x140365430')
assert bar['height']==[1,8.] and bar['width']==[2,100.] and bar['overflow']==[1,1]
assert bar['border_radius']==[[1,4.]]*4 and bar['border']==[[1,1.]]*4
source=(R/'crates/azeroth-survivors-re/src/codex.rs').read_text()
for text in ['margin: UiRect::top(Val::Auto)','panel_node(Val::Px(330.), 0.)','GridTrack::px(120.)','RepeatedGridTrack::px(max_columns as u16, 42.)','node.row_gap = Val::Px(6.);','node.column_gap = Val::Px(6.);','progress.overflow = Overflow::clip();']:
 assert text in source,text
ranges=[]
for a,b in [(0x14021bc60,0x14021e00d),(0x14021eaf0,0x140221f13),(0x1403650a0,0x140365792),(0x14588d790,0x14588d7af)]:
 at=p.rva_offset(a-p.image_base);ranges.append(dict(address=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(d[at:at+b-a]).hexdigest()))
record=dict(target_sha256=target['sha256'],ranges=ranges,typed_submission=results,limits=[
 'Original current constructors execute to typed Node/text boundaries. ECS/font/asset/UI submission, key/name/seen getters, generic color/gradient allocation and number/localization formatting are explicit fixture seams.',
 'The grid sample walks all nine actual class records with all items unseen; padding columns are disabled and the shared-group builder supplies an empty sentinel. It establishes class-grid/section/footer/progress fields, not shared-group contents, tile styles or shaping.',
 'Details samples execute no selection plus seen/unseen jewelry and shared amulet branches to Node/text submission. Name/tag/effect-text/rarity-increment results and UI/font/asset/formatting are explicit fixtures; selected catalog descriptions and growth arithmetic are independently replayed by recover-codex.py. Rarity rows execute allfive iterations with native84px label width/default auto row width; the extra fixed48px source icon wrapper and11px seen heading were corrected.',
 'No compiler, application, computed layout, input, GPU or original/rebuilt comparison ran.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args();path=R/'docs/analysis/evidence/0.109.0/codex/layout.json'
if args.write:path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print(f'Passed {sum(len(x["nodes"])for x in results.values())} current typed Nodes and {sum(len(x["texts"])for x in results.values())} text submissions across grid/default/seen/unseen Details.')
