#!/usr/bin/env python3
"""Replay current Achievements constructors to typed Node boundaries, without builds.

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

def sample(role):
 u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
 for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
 u.mem_map(0x200000000,0x1000000);u.mem_map(0x300000000,0x200000);u.mem_map(0x400000000,4096);heap=0x200010000;STOP=0x400000000
 layout=json.loads((R/'docs/analysis/evidence/picker-node-layout.json').read_text())['node_layout'];layout['OFFSET_flex_grow']=348
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
  return out
 start,finish={'body':(0x1401fb7e0,0x1401fc3da),'medallion':(0x140202970,0x1402036b8),'sidebar':(0x1401ff210,0x1402008fd),'medallion-wrapper':(0x140018220,0x1400184c1),'panels':(0x140013680,0x1400144f8),'category-control':(0x1400124b0,0x140012a2f)}[role]

 def hook(_,a,size,_2):
  if start<=a<finish:return
  if a==STOP:u.emu_stop();return
  c,d,r8,r9=[u.reg_read(r)for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]];sp=u.reg_read(UC_X86_REG_RSP);site=q(sp)-5
  if a==0x1401de510:
   records.append(dict(site=hex(site),node=node(r8+8)));u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x1400af980,0x1400af4c0,0x1400af1a0,0x1400ad9d0,0x1400af330]:u.mem_write(c,struct.pack('<QQQ',0,8,0));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1458e28e0:u.reg_write(UC_X86_REG_RAX,0)
  elif a in [0x1458e2730,0x1458dc460]:u.reg_write(UC_X86_REG_RAX,1520)
  elif a in [0x140009eb0,0x1400174d0,0x140015ac0]:pass
  elif a==0x140101170:
   records.append(dict(site=hex(site),node=node(d)));u.mem_write(c,bytes(u.mem_read(d,384))+bytes(128));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x140125ff0,0x1401008c0,0x1426eca60]:u.mem_write(c,bytes(128));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x144985170]:pass
  elif a in [0x1401e23a0,0x1401e0050,0x1401e0300]:
   captures=[]
   for off in range(0,800):
    candidate=node(r8+off)
    if candidate['width'] in ([1,30.0],[1,84.0],[1,128.0]) and candidate['height']==candidate['width']:captures.append(dict(offset=off,node=candidate))
   records.extend(dict(site=hex(site),node=x['node'])for x in captures)
   u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x144c7dcf0:
   u.mem_write(c,bytes(24)+struct.pack('<Q',alloc(512)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1401e3a50:
   records.append(dict(site=hex(site),node=node(r8+8)));u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1400ae050:u.mem_write(c,bytes(512));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x142649b80:u.mem_write(c,struct.pack('<QQQ',0,8,0)+bytes(24));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145bd3d10:
   b=str(c).encode();ptr=alloc(len(b)+1);u.mem_write(ptr,b);u.reg_write(UC_X86_REG_RAX,ptr);u.reg_write(UC_X86_REG_RDX,len(b))
  elif a==0x1458d1350:
   v=['Zones','Classes','Collection','Feats','Lifetime'][c].encode();at=alloc(len(v)+1);u.mem_write(at,v);u.reg_write(UC_X86_REG_RAX,at);u.reg_write(UC_X86_REG_RDX,len(v))
  elif a==0x1458ec450:u.reg_write(UC_X86_REG_RAX,c);u.reg_write(UC_X86_REG_RDX,d)
  elif a==0x1458ec8b0:outstr(c,bytes(u.mem_read(d,r8)).decode());u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x14022a710,0x140018220,0x140011d30,0x1400124b0,0x140202970,0x1401ff210,0x1401fb7e0]:pass
  elif a==0x1401f2bf0:
   if role=='body':texts.append(dict(site=hex(site),size=struct.unpack('<f',u.mem_read(r8+80,4))[0]))
   u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1458dc5a0:u.reg_write(UC_X86_REG_RAX,8);u.reg_write(UC_X86_REG_RDX,0)
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
 if role=='body':
  selected=alloc(8);u.mem_write(selected,b'\x01');wq(context,selected);wq(context+16,alloc(8));cat=q(context+16);u.mem_write(cat,b'\xff');u.mem_write(q(context+24),b'\x01');wq(context+40,0)
 if role=='medallion':
  art2=alloc(512);u.mem_write(art2,b"\x01");u.mem_write(art2+24,b"\x01");wq(context,art2);wq(context+8,art2);v=alloc(16);wq(context+16,v);wq(context+24,v);u.mem_write(v,struct.pack('<I',1520))
 if role=='medallion-wrapper':
  u.reg_write(UC_X86_REG_R8,art);u.reg_write(UC_X86_REG_R9,0);wq(sp+0x28,1520)
 if role=='panels':
  save=alloc(1024);wq(save+0x150,0xffffffffffffffff);wq(sp+0x28,save);u.reg_write(UC_X86_REG_R8,art);u.reg_write(UC_X86_REG_R9,context)
 if role=='category-control':
  u.reg_write(UC_X86_REG_R8,art);u.reg_write(UC_X86_REG_R9,255);wq(sp+0x28,1);wq(sp+0x30,context)
 try:u.emu_start(start,STOP,count=100000)
 except Exception as e:raise RuntimeError(hex(u.reg_read(UC_X86_REG_RIP))+': '+str(e)) from e
 assert u.reg_read(UC_X86_REG_RIP)==STOP
 return dict(nodes=records,texts=texts)

parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
roles=['panels','sidebar','medallion-wrapper','medallion','category-control','body']
results={role:sample(role) for role in roles}
assert [row['node']['width'] for row in results['panels']['nodes']]==[[1,300.0],[0,0.0]]
assert results['panels']['nodes'][0]['node']['row_gap']==[1,8.0]
assert results['panels']['nodes'][1]['node']['flex_grow']==1.0
assert results['medallion-wrapper']['nodes'][0]['node']['height']==[1,150.0]
assert [x['node']['width']for x in results['medallion']['nodes']]==[[1,84.0],[1,84.0],[1,128.0]]
assert results['category-control']['nodes'][0]['node']['padding']==[[1,8.0],[1,8.0],[1,6.0],[1,6.0]]
assert [x['size']for x in results['body']['texts']]==[15.0,12.0]
assert results['body']['nodes'][0]['node']['width']==[1,30.0]
assert results['body']['nodes'][1]['node']['row_gap']==[1,4.0]
source=(R/'crates/azeroth-survivors-re/src/progression/achievements_sidebar.rs').read_text()
for text in ['height: Val::Px(150.)','width: Val::Px(128.)','left: if flip_x','Val::Px(18.)',
             'top: Val::Px(30.)','width: Val::Px(84.)','padding: UiRect::axes(Val::Px(8.), Val::Px(6.))',
             'margin: UiRect::top(Val::Auto)','width: Val::Px(30.)','bar_flow(body, images, 4.']:
 assert text in source,text
spans=[]
for a,b in [(0x140013680,0x1400144f8),(0x140018220,0x1400184c1),(0x1400124b0,0x140012a2f),
            (0x1401ff210,0x1402008fd),(0x140202970,0x1402036b8),(0x1401fb7e0,0x1401fc3da)]:
 at=p.rva_offset(a-p.image_base);spans.append(dict(va=hex(a),end_exclusive=hex(b),byte_count=b-a,sha256=hashlib.sha256(d[at:at+b-a]).hexdigest()))
record=dict(target_sha256=target['sha256'],target_executed=False,results=results,ranges=spans,
            limits=['Only current constructor instructions run; account getters, UI/asset/font submission, allocation, color conversion and text/number/localization are explicit seams.',
                    'Matching384-byte Bevy Node field layout is checked at typed current submission sites. Snapshots establish emitted fields, not computed layout, shaping, input or GPU parity.',
                    'The body sample supplies one selected title and a zero-count category. Two text sizes and outer image/column/row Nodes are captured; fixture text contents are not native formatting proof.'])
path=R/('runtime/analysis/staging/native-evidence/achievements-menu' if args.stage else 'docs/analysis/evidence/achievements-menu')/'layout.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print('Passed',sum(len(v['nodes'])for v in results.values()),'current typed Node snapshots, two body font sizes and source layout guards')
