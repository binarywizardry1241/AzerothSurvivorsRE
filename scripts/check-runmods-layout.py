#!/usr/bin/env python3
"""Replay current Run Options typed canvas/page/row/summary submissions.

UI submission, asset/font handles, disposal, allocation, color
conversion and formatting/localization are explicit fixture seams. None renders
or executes the original or reconstructed application.
"""
from script_sources import load_script
import argparse, hashlib, json, struct, sys
from coverage_common import ROOT,latest_target,target_bytes
from pathlib import Path
R=ROOT
sys.path[:0]=[str(R/'runtime/camera-recovery-0.105.0/python-libs'),str(R/'runtime/armory-recovery/python-libs')]
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
target=latest_target(verify=False)
assert target['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
d=target_bytes(target)
m = load_script('pe', R/'scripts/inventory-executable.py');p=m.PE(d)

def sample(role):
 u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
 for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
 u.mem_map(0x200000000,0x1000000);u.mem_map(0x300000000,0x200000);u.mem_map(0x400000000,4096);heap=0x200010000;STOP=0x400000000
 layout=json.loads((R/'docs/analysis/evidence/0.92/picker-node-layout.json').read_text())['node_layout'];layout['OFFSET_flex_grow']=348
 records=[];texts=[];seams=set()
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
 start,finish={'mods-page':(0x140268070,0x140269117),'mods-frame':(0x140267da0,0x140268065)}[role]

 def hook(_,a,size,_2):
  if start<=a<finish or 0x1401c0e30<=a<0x1401c10a4 or 0x140269200<=a<0x140269d6e or 0x14590e3c0<=a<0x14590e508 or 0x140101170<=a<0x1401016bc or 0x1401bfcc0<=a<0x1401bff1e or 0x1402678f0<=a<0x140267d31:return
  if a==STOP:u.emu_stop();return
  seams.add(hex(a))
  c,d,r8,r9=[u.reg_read(r)for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]];sp=u.reg_read(UC_X86_REG_RSP);site=q(sp)-5
  if a==0x1401f8a70:
   records.append(dict(site=hex(site),node=node(d)));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x1401de510,0x1401e1e40,0x1401f2e80,0x1401f1bb0]:
   records.append(dict(site=hex(site),node=node(r8+8)))
   if a==0x1401f1bb0:records[-1]['canvas']=list(struct.unpack('<3f',u.mem_read(r8+392,12)))
   u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x140100b90:u.mem_write(c,bytes(128));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x144c7dcf0:u.mem_write(c,bytes(24)+struct.pack('<Q',alloc(512)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x142649b80:u.mem_write(c,struct.pack('<QQQ',0,8,0)+bytes(24));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x1458ec450,0x1458ec500]:u.reg_write(UC_X86_REG_RAX,c);u.reg_write(UC_X86_REG_RDX,d)
  elif a==0x1458ec8b0:outstr(c,bytes(u.mem_read(d,r8)).decode());u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1401f2bf0:
   texts.append(dict(site=hex(site),size=struct.unpack('<f',u.mem_read(r8+80,4))[0]))
   u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145bfa0e7:u.mem_write(c,bytes(u.mem_read(d,r8)));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x1401c0870,0x1401f9650]:

   if a==0x1401f9650:texts.append(dict(site=hex(site),size=struct.unpack("<f",u.mem_read(d+72,4))[0]))
   u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1401bfcc0:pass
  elif a==0x14590d390:outstr(c,'Enemy density');u.reg_write(UC_X86_REG_RAX,q(c+8));u.reg_write(UC_X86_REG_RDX,q(c+16))
  elif a==0x1458d32c0:u.reg_write(UC_X86_REG_RAX,1);u.reg_write(UC_X86_REG_RDX,0)
  elif a==0x145bcce30:outstr(c,'0%')
  elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(c))
  elif a in [0x140002200,0x1400021d0]:pass
  else:raise RuntimeError(f'Unknown {a:#x} at {site:#x}')
  u.reg_write(UC_X86_REG_RIP,q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
 u.hook_add(UC_HOOK_CODE,hook)
 parent=alloc(512);context=alloc(512);art=alloc(4096);third=alloc(512);mods=alloc(8)
 u.mem_write(mods,struct.pack('<4H',100,100,100,100))
 for at in [parent,third]:
  for i in range(16):wq(at+i*8,mods)
 wq(context,art)
 for off in range(0,2048,24):u.mem_write(art+off,b'\x01');wq(art+off+8,alloc(16))
 sp=0x3001f0008;wq(sp,STOP);u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,parent);u.reg_write(UC_X86_REG_RDX,context);u.reg_write(UC_X86_REG_R8,third)
 try:u.emu_start(start,STOP,count=100000)
 except Exception as e:
  raise RuntimeError(hex(u.reg_read(UC_X86_REG_RIP))+': '+str(e)) from e
 assert u.reg_read(UC_X86_REG_RIP)==STOP
 return dict(nodes=records,texts=texts,seams=sorted(seams))


results={role:sample(role)for role in ['mods-frame','mods-page']}
frame=results['mods-frame']['nodes'][0]
assert frame['canvas']==[760.,560.,struct.unpack('<f',bytes.fromhex('3333b33f'))[0]]
page=results['mods-page'];root=page['nodes'][0]['node']
assert root['padding']==[[1,36.],[1,36.],[1,24.],[1,24.]] and root['row_gap']==[1,14.]
assert root['width']==[2,100.] and root['height']==[2,100.] and root['border_radius']==[[1,10.]]*4
assert [x['size']for x in page['texts']]==[34.,14.]+[18.,12.,24.]*4+[16.,26.]
assert len(page['nodes'])==19
for row in page['nodes']:
 n=row['node']
 if row['site']=='0x1401c1041':assert n['width']==[0,0.] and n['column_gap']==[1,12.] and n['align_items']==5
 if row['site']=='0x1402694a8':assert n['min_width']==[0,0.] and n['flex_grow']==1.
 if row['site']=='0x140269b49':assert n['width']==[1,84.]
 if row['site']=='0x1401bfed1':assert n['width']==[0,0.] and n['justify_content']==7 and n['align_items']==5
 if row['site']=='0x140268e4c':assert n['min_height']==[0,0.] and n['flex_grow']==1.
source=(R/'crates/azeroth-survivors-re/src/run_options.rs').read_text()
assert '!catalog.is_changed()'in source and 'catalog.label("{what} · {min}% to {max}%")'in source
assert 'Node {width:Val::Percent(100.),column_gap:Val::Px(12.)'not in source
record=dict(target_sha256=target['sha256'],typed_submission=results,
 shared_node_painter='docs/analysis/evidence/0.109.0/overlay-style/manifest.json',
 limits=['Current original canvas/page/row/reward constructors execute to typed submission boundaries; child callback invocation is supplied separately by the actual page body.','UI submission, asset/font handles, localization and argument formatting, damage/gradient allocation and generic button internals use explicit seams. The current shared panel painter140101170 executes and is retained once under overlay-style.','No compiler, computed layout, input device, GPU, game or original/rebuilt comparison ran.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args();path=R/'docs/analysis/evidence/0.109.0/runmods/layout.json'
if args.write:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print('Verified current Run Options canvas,19 Nodes and16 text submissions; no build/game')
