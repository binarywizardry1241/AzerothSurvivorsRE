#!/usr/bin/env python3
"""Replay current secondary menu viewport and cosmetic card Node construction."""
import sys,importlib.util,json,struct
from pathlib import Path
from coverage_common import ROOT
sys.path.insert(0,str(ROOT/'scripts'));sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
from coverage_common import latest_target,target_bytes
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as r
s=importlib.util.spec_from_file_location('i',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m);selected=latest_target(verify=True);assert selected['sha256']=='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a';d=target_bytes(selected);p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in p.sections);u.mem_map(p.image_base,(extent+4095)&~4095)
for sec in p.sections:u.mem_write(p.image_base+sec['rva'],d[sec['raw_offset']:sec['raw_offset']+sec['raw_size']])
H,S,END=0x200000000,0x300000000,0x400000000
for a,size in ((H,0x10000),(S,0x10000),(END,4096)):u.mem_map(a,size)
def get(n):return u.reg_read(getattr(r,'UC_X86_REG_'+n))
def setr(n,v):u.reg_write(getattr(r,'UC_X86_REG_'+n),v)
def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
def ret():sp=get('RSP');setr('RIP',struct.unpack('<Q',u.mem_read(sp,8))[0]);setr('RSP',sp+8)
layout=json.loads((ROOT/'docs/analysis/evidence/0.92/picker-node-layout.json').read_text())['node_layout'];layout['OFFSET_flex_grow']=348
card_cases=[]
for available,shown in [(False,False),(False,True),(True,False),(True,True)]:
 u.mem_write(H,bytes(0x10000));put(S+0x8008,'Q',END);put(S+0x8030,'Q',available);put(S+0x8038,'Q',shown);put(H+0x1000,'B',1);put(H+0x2000,'B',1);rows=[]
 def hook(_,a,n,__):
  if 0x140161580<=a<0x140161c09:return
  if a==0x1459adea0:setr('RAX',H+0x3000);setr('RDX',1)
  elif a==0x14598dd20:setr('RAX',get('RCX'));setr('RDX',get('RDX'))
  elif a==0x14022f6a0:
   b=bytes(u.mem_read(get('R8')+8,384));out={}
   for key,at in layout.items():
    if key=='NODE_SIZE':continue
    key=key.removeprefix('OFFSET_')
    if key in ['width','height','min_width','min_height','max_width','max_height','flex_basis','row_gap','column_gap']:out[key]=list(struct.unpack_from('<If',b,at))
    elif key in ['padding','border','border_radius','margin']:out[key]=[list(struct.unpack_from('<If',b,at+i*8))for i in range(4)]
    elif key in ['flex_grow','flex_shrink','scrollbar_width']:out[key]=struct.unpack_from('<f',b,at)[0]
    elif at>=370:out[key]=b[at]
   rows.append(out);u.emu_stop();return
  else:raise RuntimeError(hex(a))
  ret()
 token=u.hook_add(UC_HOOK_CODE,hook)
 for n,v in [('RCX',H),('RDX',H+0x1000),('R8',H+0x2000),('R9',0x145e07600),('RSP',S+0x8008)]:setr(n,v)
 u.emu_start(0x140161580,END,count=2000);u.hook_del(token);assert len(rows)==1
 card_cases.append(dict(available=available,shown=shown,node=rows[0]))

import argparse,hashlib
from equipment_native import EquipmentProbe
sys.path.insert(0,str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'))
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
from capstone.x86 import X86_OP_REG,X86_OP_MEM,X86_REG_RIP
ends={p.image_base+a:p.image_base+b for a,b,_ in p.functions()}
def raw(a,n):offset=p.rva_offset(a-p.image_base);return d[offset:offset+n]
def span(a,b):return dict(va=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw(a,b-a)).hexdigest())
def fields(b):
 result={}
 for key,at in layout.items():
  if key=='NODE_SIZE':continue
  key=key.removeprefix('OFFSET_')
  if key in ['width','height','min_width','min_height','max_width','max_height','flex_basis','row_gap','column_gap']:result[key]=list(struct.unpack_from('<If',b,at))
  elif key in ['padding','border','border_radius','margin']:result[key]=[list(struct.unpack_from('<If',b,at+i*8))for i in range(4)]
  elif key in ['flex_grow','flex_shrink','scrollbar_width']:result[key]=struct.unpack_from('<f',b,at)[0]
  elif at>=370:result[key]=b[at]
 result['overflow']=list(b[356:358]);return result
for case in card_cases:
 node=case['node'];assert node['padding']==[[1,8.],[1,8.],[1,6.],[1,6.]]
 assert node['border']==[[1,1.]]*4 and node['border_radius']==[[1,5.]]*4 and node['column_gap']==[1,10.]

viewport_cases=[]
class ViewportProbe(EquipmentProbe):
 def hook(self,uc,pc,size,unused):
  if pc==self.capture:
   at=self.reg('R8');self.node=bytes(self.native.mem_read(at+8,384));self.key=self.pair(at+392)if self.capture==0x140242d60 else'appearance-grid';self.native.emu_stop();return
  return super().hook(uc,pc,size,unused)
for owner in [0x1402b29e0,0x1402b7500]:
 probe=ViewportProbe(d,p,[(owner,ends[owner])]);probe.capture=0x140242d60;h=probe.alloc(0x4000)
 for offset in range(0,0x4000,8):probe.put(h+offset,h+0x1000)
 sp=probe.STACK+0x1f0008;probe.put(sp,probe.DONE);probe.reg('RSP',sp);probe.reg('RCX',h);probe.reg('RDX',h+0x2000);probe.native.emu_start(owner,0,count=10000)
 assert probe.reg('RIP')==probe.capture
 viewport_cases.append(dict(key=probe.key,owner=span(owner,ends[owner]),mode='entry-to-viewport',node=fields(probe.node)))

# Late initializers follow already-published fixed headers. Seed only vector
# constants whose actual current loads/zeroing/moves are traced in the prefix;
# run every instruction of each initializer, including native memcpy.
md=Cs(CS_ARCH_X86,CS_MODE_64);md.detail=True
late=[(0x1402bedd0,0x1402c0738,0x1402c09a2),(0x14028dc50,0x14028fea0,0x1402900a8),(0x1402b29e0,0x1402b2f57,0x1402b30d8)]
for owner,start,stop in late:
 values={};loads={}
 for instruction in md.disasm(raw(owner,start-owner),owner):
  for register in instruction.regs_access()[1]:
   name=instruction.reg_name(register)
   if not name.startswith('xmm'):continue
   value=None;origin=None
   if instruction.mnemonic=='xorps'and instruction.operands[0].reg==instruction.operands[1].reg:value=bytes(16);origin=dict(site=hex(instruction.address),kind='zero')
   elif instruction.mnemonic in ['movaps','movups','movss','movsd']:
    src=instruction.operands[1]
    if src.type==X86_OP_REG:value=values.get(instruction.reg_name(src.reg));origin=loads.get(instruction.reg_name(src.reg))
    elif src.type==X86_OP_MEM and src.mem.base==X86_REG_RIP:
     at=instruction.address+instruction.size+src.mem.disp;size=4 if instruction.mnemonic=='movss'else 8 if instruction.mnemonic=='movsd'else 16;value=raw(at,size)+bytes(16-size);origin=dict(site=hex(instruction.address),address=hex(at),bytes=value.hex())
   values[name]=value;loads[name]=origin
 class LateProbe(ViewportProbe):
  def hook(self,uc,pc,size,unused):
   if pc==stop:
    at=self.reg('R8');self.node=bytes(self.native.mem_read(at+8,384));self.key=self.pair(at+392)if stop!=0x1402b30d8 else'appearance-grid';self.native.emu_stop();return
   return super().hook(uc,pc,size,unused)
 probe=LateProbe(d,p,[(start,stop)]);probe.capture=-1;sp=probe.STACK+0x100000;bp=sp+0x2000;probe.reg('RSP',sp);probe.reg('RBP',bp)
 for name,value in values.items():
  if value is not None:probe.reg(name.upper(),int.from_bytes(value,'little'))
 for name in ['RSI','R12','R14','R15']:probe.reg(name,probe.HEAP+0x1000)
 probe.native.emu_start(start,0,count=1000);assert probe.reg('RIP')==stop
 viewport_cases.append(dict(key=probe.key,owner=span(owner,ends[owner]),initializer=span(start,stop),mode='late-initializer-with-traced-constants',constant_seeds={name:origin for name,origin in loads.items()if origin},node=fields(probe.node)))
expected={'armory-equipment':8.,'talent-details':9.,'rewards-appearances':8.,'rewards-companion-looks':0.}
for case in viewport_cases:
 node=case['node']
 if case['key']=='appearance-grid':assert node['row_gap']==[1,6.]and node['column_gap']==[1,8.];continue
 assert node['min_height']==[1,0.]and node['min_width']==[0,0.]and node['flex_basis']==[0,0.]and node['flex_grow']==1. and node['overflow']==[0,3]and node['row_gap']==[1,expected[case['key']]],(case['key'],node)
source={key:(ROOT/path).read_text()for key,path in [('armory','crates/azeroth-survivors-re/src/armory.rs'),('talents','crates/azeroth-survivors-re/src/talents.rs'),('rewards','crates/azeroth-survivors-re/src/progression/rewards.rs')]}
for key,gap in expected.items():assert any(f'"{key}", {int(gap)}.'in value for value in source.values()),key
record=dict(target_sha256=selected['sha256'],application_executed=False,rebuilt_code_executed=False,native_instructions_executed=True,card_cases=card_cases,viewports=viewport_cases,card_owner=span(0x140161580,0x140161c09),grid_track_producer=span(0x1402b2f27,0x1402b2f57),limits=['Four native cosmetic card parent Nodes and all four named viewport Nodes are captured before UI publication. The appearance grid initializer is captured separately.','Named viewport entry captures use opaque UI/capture pointers. Late initializer captures seed vector constants traced to actual current loads/zeroing; fixed header rendering and ECS publication are not executed.','Allocation/byte copy, locale/achievement lookup and UI publication are explicit fixture seams. Shared wheel/drag scheduling, actual geometry, fonts and GPU rendering are not executed.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args();path=ROOT/('runtime/native-evidence/0.112.0/secondary-menu-layout'if args.stage else'docs/analysis/evidence/0.112.0/secondary-menu-layout')/'nodes.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print('Passed 4 cosmetic card states, 4 named retained viewport Nodes and current appearance grid geometry')
