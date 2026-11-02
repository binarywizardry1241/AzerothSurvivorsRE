#!/usr/bin/env python3
"""Replay current complete Codex tile construction to its typed bundle boundary.

Asset handles, key/seen/quality getters, shadow allocation, copying and generic
color conversion are explicit fixtures; no UI, game, compiler or GPU runs.
"""
from script_sources import load_script
import argparse, hashlib, json, struct, sys
from coverage_common import ROOT,latest_target,target_bytes
sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn.x86_const import *
t=latest_target(verify=True);assert t['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0';data=target_bytes(t)
m = load_script('pe', ROOT/'scripts/inventory-executable.py');p=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(x['rva']+max(x['raw_size'],x['virtual_size'])for x in p.sections);u.mem_map(p.image_base,(extent+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
H,S,D=0x200000000,0x300000000,0x400000000;u.mem_map(H,0x20000);u.mem_map(S,0x20000);u.mem_map(D,4096)
q=lambda a:struct.unpack('<Q',u.mem_read(a,8))[0];wq=lambda a,v:u.mem_write(a,struct.pack('<Q',v));reg=lambda r:u.reg_read(r)
layout=json.loads((ROOT/'docs/analysis/evidence/0.92/picker-node-layout.json').read_text())['node_layout']
def node(a):
 b=bytes(u.mem_read(a,384));out={}
 for k,off in layout.items():
  if k=='NODE_SIZE':continue
  k=k.removeprefix('OFFSET_')
  if k in ['width','height','min_width','max_width','min_height','max_height']:out[k]=list(struct.unpack_from('<If',b,off))
  elif k in ['border','border_radius']:out[k]=[list(struct.unpack_from('<If',b,off+i*8))for i in range(4)]
  elif off>=370:out[k]=b[off]
 return out
def color(a):return list(struct.unpack('<I4f',u.mem_read(a,20)))
known,quality,shadow,bundle=False,0,None,None

def hook(_,pc,size,unused):
 global shadow,bundle
 if 0x140365a00<=pc<0x1403663d8:return
 sp=reg(UC_X86_REG_RSP);c,d,r8=[reg(r)for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8]]
 if pc==0x140364530:u.mem_write(c,struct.pack('<QQQ',0,8,0));u.reg_write(UC_X86_REG_RAX,c)
 elif pc==0x14589df20:u.reg_write(UC_X86_REG_RAX,int(known));u.reg_write(UC_X86_REG_RDX,quality)
 elif pc==0x140364670:u.reg_write(UC_X86_REG_RAX,quality)
 elif pc==0x1401008c0:u.mem_write(c,bytes(128));u.mem_write(c,b'\x01');u.reg_write(UC_X86_REG_RAX,c)
 elif pc==0x144c7dcf0:
  shadow=dict(color=color(d));u.mem_write(c,bytes(u.mem_read(d+4,16)));u.reg_write(UC_X86_REG_RAX,c)
 elif pc==0x142649b80:
  shadow.update(spread=struct.unpack('<f',u.mem_read(sp+64,4))[0],blur=struct.unpack('<f',u.mem_read(sp+80,4))[0]);u.mem_write(c,bytes(24));u.reg_write(UC_X86_REG_RAX,c)
 elif pc==0x145bfa0e7:u.mem_write(c,bytes(u.mem_read(d,r8)));u.reg_write(UC_X86_REG_RAX,c)
 elif pc==0x1400021d0:pass
 elif pc==0x1401e74f0:
  bundle=dict(node=node(r8+32),border=color(r8+576),hover_rest=color(r8+656),hover_active=color(r8+676),lift=struct.unpack('<f',u.mem_read(r8+696,4))[0],background=color(r8+700),image_tint=color(r8+440+56),interaction=u.mem_read(r8+720,1)[0]);u.emu_stop();return
 else:raise RuntimeError(f'Unreviewed callee {pc:#x} caller {q(sp):#x}')
 u.reg_write(UC_X86_REG_RIP,q(sp));u.reg_write(UC_X86_REG_RSP,sp+8)
u.hook_add(UC_HOOK_CODE,hook)
# Both jewelry/shared native tables are real current read-only records; replace
# only their initialized Vec handles. Quality behavior has independent114 cases.
for a,ptr,n in [(0x14808a3d8,0x146be91b8,22),(0x14808a3e0,0x146bea470,17)]:wq(a,H+0x1000+(a&8)*16);wq(q(a),ptr);wq(q(a)+8,n)
rows=[]
for size in [42.,48.]:
 for kind in [0,1]:
  for known in [False,True]:
   for selected in [False,True]:
    for quality in range(6):
     u.mem_write(S,bytes(0x18000));u.mem_write(H,bytes(0x1000));sp=S+0x18008;wq(sp,D);wq(sp+40,H+0x500);wq(sp+48,H+0x600);u.mem_write(sp+56,struct.pack('<f',size));u.mem_write(H+0x600,struct.pack('<QQQ',kind,0,0));u.mem_write(H+0x300,struct.pack('<QQQ',kind if selected else 0xffffffffffffffff,0,0));wq(H,99)
     for r,v in [(UC_X86_REG_RSP,sp),(UC_X86_REG_RCX,H),(UC_X86_REG_RDX,H+0x100),(UC_X86_REG_R8,H+0x200),(UC_X86_REG_R9,H+0x300)]:u.reg_write(r,v)
     bundle=None;shadow=None;u.emu_start(0x140365a00,D,count=10000);assert bundle and shadow
     assert bundle['node']['width']==bundle['node']['height']==[1,size]
     assert bundle['node']['border']==[[1,2.]]*4 and bundle['node']['border_radius']==[[1,6.]]*4
     assert bundle['lift']==2. and(shadow['spread'],shadow['blur'])==((2.,14.)if selected else(0.,6.)),(known,selected,bundle,shadow)
     rows.append(dict(size=size,kind=kind,known=known,selected=selected,quality=quality,bundle=bundle,shadow=shadow))
a,b=0x140365a00,0x1403663d8;o=p.rva_offset(a-p.image_base)
proof=dict(target_sha256=t['sha256'],address=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(data[o:o+b-a]).hexdigest(),typed_bundle_offsets={'Node':32,'BoxShadow':416,'ImageNode':440,'BorderColor':576,'Hover':656,'BackgroundColor':700,'Interaction':720,'UiTransform':724},cases=rows,limits=[
 'Full original tile constructor executes for jewelry/shared enum rows to its typed bundle submission boundary; enum selection comparison executes, and current tables provide icon strings. Quality/key/seen and image handles are fixtures; current quality behavior is independently replayed for all native shared records.',
 'Shadow helper input color/spread/blur and bundle fields are captured. Generic color conversion is a declared copy fixture, shadow allocation and ECS submission are bypassed. Current32-byte child/entry prefix plus384-byte Node and component field stores establish offsets.',
 'Legendary effect metadata is independently covered by the full current Codex constructor pass. Unknown question text and legendary spell badge child construction are outside this bounded tile sample.',
 'No build, application, GPU, computed layout or original/rebuilt comparison ran.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args();path=ROOT/'docs/analysis/evidence/0.109.0/codex/tile.json'
if args.write:path.write_text(json.dumps(proof,indent=2)+'\n')
else:assert json.loads(path.read_text())==proof
print(f'Passed {len(rows)} complete current Codex tile submissions at grid/Details sizes, including every rarity/known/selected combination; no compiler/game.')
