#!/usr/bin/env python3
"""Check current RaceTip native Node/text submission and race records without compiling."""
from script_sources import load_script
import argparse, hashlib, json, struct, sys
from coverage_common import ROOT,latest_target,target_bytes
sys.path[:0]=[str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
target=latest_target(verify=False);assert target['sha256']==SHA
d=target_bytes(target);m = load_script('pe', ROOT/'scripts/inventory-executable.py');p=m.PE(d)
layout=json.loads((ROOT/'docs/analysis/evidence/0.92/picker-node-layout.json').read_text())['node_layout']
def raw(a,n):o=p.rva_offset(a-p.image_base);return d[o:o+n]
def qraw(a):return struct.unpack('<Q',raw(a,8))[0]
def pair(a):return raw(qraw(a),qraw(a+8)).decode()
def sample(role):
 u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
 for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
 u.mem_map(0x200000000,0x1000000);u.mem_map(0x300000000,0x200000);u.mem_map(0x400000000,4096);heap=0x200010000;STOP=0x400000000
 def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
 def wq(a,v):u.mem_write(a,struct.pack('<Q',v))
 def alloc(n):
  nonlocal heap
  a=heap;heap+=(n+15)&~15;return a
 def node(a):
  b=bytes(u.mem_read(a,384));out={}
  for key,off in layout.items():
   if key=='NODE_SIZE':continue
   key=key.removeprefix('OFFSET_')
   if key in ['left','right','top','bottom','width','height','min_width','min_height','max_width','max_height','flex_basis','row_gap','column_gap']:out[key]=list(struct.unpack_from('<If',b,off))
   elif key in ['margin','padding','border','border_radius']:out[key]=[list(struct.unpack_from('<If',b,off+i*8))for i in range(4)]
   elif key in ['flex_shrink','scrollbar_width']:out[key]=struct.unpack_from('<f',b,off)[0]
   elif off>=370:out[key]=b[off]
  return out
 records=[];texts=[];spans=[]
 start,finish={'tip':(0x140238eb0,0x140239acc),'root':(0x140163bb4,0x140163f1d)}[role]
 def hook(_,a,size,_2):
  if start<=a<finish:return
  if a==STOP:u.emu_stop();return
  c,d,r8,r9=[u.reg_read(r)for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]];sp=u.reg_read(UC_X86_REG_RSP);site=q(sp)-5
  if a==0x1401017b0:u.mem_write(c,bytes(24));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1401f6440:
   records.append(dict(site=hex(site),node=node(r8)));u.emu_stop();return
  elif a==0x14588d7b0:pass
  elif a==0x14588c300:
   at=alloc(16);u.mem_write(at,b'Human');u.reg_write(UC_X86_REG_RAX,at);u.reg_write(UC_X86_REG_RDX,5)
  elif a==0x14588c630:
   at=alloc(16);t=alloc(16);u.mem_write(t,b'Racial line');u.mem_write(at,struct.pack('<QQ',t,11));u.mem_write(c,struct.pack('<QQQ',1,at,1))
  elif a==0x1401de510 or a==0x1401e0300:
   records.append(dict(site=hex(site),node=node(r8+8)));u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a in [0x140125ff0,0x1401008c0,0x1426eca60]:u.mem_write(c,bytes(128));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1401f2bf0:
   texts.append(dict(size=struct.unpack('<f',u.mem_read(r8+80,4))[0],value=bytes(u.mem_read(q(r8+16),q(r8+24))).decode()));u.mem_write(c,bytes(u.mem_read(d,40)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1401f8eb0:
   spans.append(bytes(u.mem_read(q(d+8),q(d+16))).decode());u.mem_write(c,bytes(40));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x145bfa0e7:u.mem_write(c,bytes(u.mem_read(d,r8)));u.reg_write(UC_X86_REG_RAX,c)
  elif a==0x1400021c0:u.reg_write(UC_X86_REG_RAX,alloc(c))
  elif a in [0x140002200,0x1400021d0]:pass
  else:raise RuntimeError(f'Unknown {a:#x} at {site:#x}')
  u.reg_write(UC_X86_REG_RIP,q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
 u.hook_add(UC_HOOK_CODE,hook)
 parent=alloc(64);context=alloc(128)
 for i in range(8):wq(context+i*8,alloc(1024))
 font=alloc(32);u.mem_write(font,b'\x01');wq(q(context+16),font);u.mem_write(q(context+24),b'\x01')
 sp=0x3001f0008;wq(sp,STOP);u.reg_write(UC_X86_REG_RSP,sp);u.reg_write(UC_X86_REG_RCX,parent);u.reg_write(UC_X86_REG_RDX,context)
 if role=='root':
  u.reg_write(UC_X86_REG_RBP,0x300100000);u.reg_write(UC_X86_REG_XMM6,int.from_bytes(struct.pack('<f',220.),'little'));u.reg_write(UC_X86_REG_XMM7,int.from_bytes(struct.pack('<f',118.),'little'))
 u.emu_start(start,STOP,count=100000);assert u.reg_read(UC_X86_REG_RIP) in [STOP,0x1401f6440]
 return dict(nodes=records,texts=texts,spans=spans)
results={role:sample(role)for role in ['root','tip']}
assert results['root']['nodes'][0]['node']['width']==[1,430.]
assert results['root']['nodes'][0]['node']['padding']==[[1,12.],[1,12.],[1,10.],[1,10.]]
assert results['tip']['nodes'][0]['node']['width']==[1,40.]
assert results['tip']['nodes'][1]['node']['row_gap']==[1,3.]
assert results['tip']['texts']==[dict(size=18.,value='Human'),dict(size=13.,value='• ')]
assert results['tip']['spans']==['Racial line']
menu=json.loads((ROOT/'crates/azeroth-survivors-re/assets/menu.json').read_text());races=[]
for i,row in enumerate(menu['races'],1):
 a=0x146bdf550 if i==1 else qraw(0x146be7b48+(i-2)*8)
 name,key=pair(a),pair(a+16).lower();lines=[pair(qraw(a+64)+x*16).removeprefix('- ')for x in range(qraw(a+72))]
 assert row['name']==name and row['key']==key and row['blurb'].splitlines()==lines
 for code in ['en','pl','cs','de','pt','es','fr','ro','tr','ru','uk','zh','ja','ko']:
  loc=json.loads((ROOT/f'crates/azeroth-survivors-re/assets/locales/{code}.json').read_text());assert all(f'race.{key}.line{n}'in loc for n in range(1,len(lines)+1))
 races.append(dict(address=hex(a),name=name,key=key,lines=lines,sha256=hashlib.sha256(raw(a,88)).hexdigest()))
source=(ROOT/'crates/azeroth-survivors-re/src/armory/race_tip.rs').read_text()
for text in ['Val::Px(430.)','Val::Px(40.)','Val::Px(12.)','Val::Px(10.)','GlobalZIndex(5500)','cursor.y + 20.','cursor.x + 18.','cursor.x - 12. - 430.','race.blurb.lines()','"armory.not_open_to"','font_size: 13.']:
 assert text in source,text
ranges=[dict(address=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw(a,b-a)).hexdigest())for a,b in [(0x1401630f0,0x140163fac),(0x140238eb0,0x140239acc)]]
proof=dict(target_sha256=SHA,ranges=ranges,typed_submission=results,race_records=races,limits=['UI/font/asset submission, race name/line fixtures, shadow allocation and copying are explicit seams in layout samples. The root slice starts after cursor/ECS selection with fixed computed position; placement arithmetic and restriction branch are additionally inspected in the retained native owners.','The eight actual current race records independently match source English fallback; every line key exists in fourteen source locales. Full localized getter execution is not claimed.','No build, game, computed layout, focus/input or rendered parity check ran.'])
a=argparse.ArgumentParser(description=__doc__);a.add_argument('--write',action='store_true');args=a.parse_args();path=ROOT/'docs/analysis/evidence/0.109.0/armory-pages/race-tip.json'
if args.write:path.write_text(json.dumps(proof,ensure_ascii=False,indent=2)+'\n')
else:assert json.loads(path.read_text())==proof
print('Passed three current typed Node snapshots, title/bullet/span construction, eight native race records/22 lines and fourteen-language key coverage.')
