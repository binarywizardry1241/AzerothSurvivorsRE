#!/usr/bin/env python3
"""Replay selected 0.105.0 Rewards constructor instructions to typed UI boundaries.

Uses the existing local Unicorn dependency, never launches the application and
never compiles. UI spawn/command submission, allocators, localization, formatting,
and explicit account inputs are seams. No layout engine or text shaping is run.
Unknown external calls fail closed. The source byte hash is checked on every run.
"""
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, sys
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

ROOT=Path(__file__).resolve().parents[1]
module = load_script('pe', ROOT/'scripts/inventory-executable.py')
data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.105.0.exe').read_bytes()
assert hashlib.sha256(data).hexdigest()=='8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
pe=module.PE(data)
bounds={pe.image_base+a:pe.image_base+b for a,b,*_ in pe.functions()}
layout=json.loads((ROOT/'docs/analysis/evidence/picker-node-layout.json').read_text())['node_layout']
layout['OFFSET_flex_grow']=348

class Probe:
 def __init__(self,start,halt=None):
  self.start=start;self.halt=halt;self.records=[];self.calls=[];self.heap=0x200010000
  self.u=Uc(UC_ARCH_X86,UC_MODE_64);self.u.mem_map(pe.image_base,(max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in pe.sections)+4095)&~4095)
  for s in pe.sections:self.u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
  self.u.mem_map(0x200000000,0x1000000);self.u.mem_map(0x300000000,0x200000);self.u.mem_map(0x400000000,4096)
  self.sp=0x3001f0008;self.wq(self.sp,0x400000000);self.u.reg_write(UC_X86_REG_RSP,self.sp)
  self.u.hook_add(UC_HOOK_CODE,self.hook)
 def alloc(self,n):
  a=self.heap;self.heap+=(n+15)&~15;return a
 def read(self,a,n):return bytes(self.u.mem_read(a,n))
 def q(self,a):return struct.unpack('<Q',self.read(a,8))[0]
 def wq(self,a,v):self.u.mem_write(a,struct.pack('<Q',v))
 def reg(self,r):return self.u.reg_read(r)
 def result(self,a,b=None):
  self.u.reg_write(UC_X86_REG_RAX,a)
  if b is not None:self.u.reg_write(UC_X86_REG_RDX,b)
 def string(self,value):
  raw=value.encode();a=self.alloc(len(raw)+1);self.u.mem_write(a,raw);return a,len(raw)
 def outstr(self,dest,value):
  a,n=self.string(value);self.u.mem_write(dest,struct.pack('<QQQ',n,a,n))
 def node(self,a):
  b=self.read(a,384);out={}
  for key,offset in layout.items():
   if key=='NODE_SIZE':continue
   key=key.removeprefix('OFFSET_')
   if key in ['left','right','top','bottom','width','height','min_width','min_height','max_width','max_height','flex_basis','row_gap','column_gap']:
    tag,value=struct.unpack_from('<If',b,offset);out[key]=[tag,value]
   elif key in ['margin','padding','border','border_radius']:
    out[key]=[list(struct.unpack_from('<If',b,offset+i*8))for i in range(4)]
   elif key in ['flex_grow','flex_shrink','scrollbar_width']:out[key]=struct.unpack_from('<f',b,offset)[0]
   elif offset>=370:out[key]=b[offset]
  return out
 def hook(self,_,a,n,unused):
  if a==self.halt:self.u.emu_stop();return
  if self.start<=a<bounds[self.start]:return
  if a==0x400000000:self.u.emu_stop();return
  c=self.reg(UC_X86_REG_RCX);d=self.reg(UC_X86_REG_RDX);r8=self.reg(UC_X86_REG_R8);r9=self.reg(UC_X86_REG_R9);sp=self.reg(UC_X86_REG_RSP);site=self.q(sp)-5
  self.calls.append(hex(a))
  if a in [0x140189f40,0x14018a750,0x14019d5c0,0x14018b7d0]:
   self.records.append(dict(site=hex(site),kind='node',node=self.node(r8+8),bytes=self.read(r8+8,384).hex()))
   self.u.mem_write(c,self.read(d,40));self.result(c)
  elif a in [0x14018ef20,0x1401a4e60,0x1401a48e0,0x14018e670]:
   offset=392 if a==0x14018e670 else (8 if a==0x14018ef20 else 0)
   if a==0x14018e670:self.records.append(dict(site=hex(site),kind='node',node=self.node(r8+8)))
   if not offset:r8=d
   self.records.append(dict(site=hex(site),kind='text',text=self.read(self.q(r8+offset+8),self.q(r8+offset+16)).decode(),size=struct.unpack('<f',self.read(r8+offset+72,4))[0]))
   if offset:self.u.mem_write(c,self.read(d,40))
   self.result(c)
  elif a==0x1458da4e0:self.result(c,d)
  elif a==0x1400021c0:self.result(self.alloc(c))
  elif a in [0x140002200,0x1400021d0]:pass
  elif a==0x145bc977b:self.u.mem_write(c,self.read(d,r8));self.result(c)
  elif a==0x145ba33b0:self.result(*self.string(str(c)))
  elif a==0x1458da940:self.outstr(c,self.read(d,r8).decode())
  elif a==0x1458c8160:self.result(0)
  elif a==0x1458c8350:self.result(1)
  elif a in [0x1401d6140,0x140126a20,0x1401240c0,0x140128060,0x140126020,0x14020fd30,0x1402101b0,0x1402119f0,0x14020d7d0,0x14020f550]:
   self.records.append(dict(site=hex(site),kind='helper',target=hex(a),rcx=hex(c),rdx=hex(d),r8=hex(r8),r9=hex(r9)))
  elif a==0x1458caba0:self.result(*self.string('Companions' if c==1 else 'Perks'))
  elif a==0x14270a850:
   self.u.mem_write(c,bytes(48));self.wq(c+8,1);self.wq(c+16,1);self.result(c)
  elif a==0x1458c7f00:self.result(2)
  elif a==0x1458d5b90:
   out=self.alloc(16);ptr,size=self.string('Squirrel');self.wq(out,ptr);self.wq(out+8,size);self.result(out)
  elif a==0x1458d6210:self.result(1)
  elif a==0x1458d55f0:self.result(1)
  elif a==0x145bc9787:self.result(0 if self.read(c,r8)==self.read(d,r8)else 1)
  elif a==0x1458c7fd0:self.u.mem_write(c,bytes(48));self.result(c)
  elif a==0x1458d2f00:self.result(1000)
  elif a==0x140127c10:pass
  elif a==0x1458c3e90:self.result(*self.string('Name'))
  elif a==0x140012c60:self.u.mem_write(c,self.read(d,384)+bytes(128));self.result(c)
  else:raise RuntimeError(f'Unreviewed call {a:#x} at {site:#x}')
  self.u.reg_write(UC_X86_REG_RIP,self.q(sp));self.u.reg_write(UC_X86_REG_RSP,sp+8)
 def run(self,args):
  for reg,value in zip([UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9],args):self.u.reg_write(reg,value)
  self.u.emu_start(self.start,0x400000000,count=200000)
  assert self.reg(UC_X86_REG_RIP) in [0x400000000,self.halt]
  return self.records

def sample(start,halt):
 p=Probe(start,halt);spawner=p.alloc(64);art=p.alloc(512);capture=p.alloc(256);state=p.alloc(512)
 for i in range(0,512,24):p.u.mem_write(art+i,b'\x01')
 refs=[art]+[p.alloc(512)for _ in range(7)]
 for i,v in enumerate(refs):p.wq(capture+i*8,v)
 p.wq(refs[1],1000);p.wq(refs[2],1000)
 if start==0x14020f550:
  p.wq(capture,state);p.wq(capture+8,art);p.u.mem_write(state+0x74,b'\x01')
 elif start==0x140126020:
  args=[spawner,art,state,state];p.wq(p.sp+0x28,state);p.wq(p.sp+0x30,state)
 elif start==0x140123aa0:
  at,n=p.string('First companion: Squirrel');args=[spawner,art,at,n];p.wq(p.sp+0x28,1);p.wq(p.sp+0x30,state)
 elif start==0x1401240c0:args=[spawner,art,0,1]
 elif start==0x140126a20:
  ptr,n=p.string('Confirm');args=[spawner,art,ptr,n];p.wq(p.sp+0x28,1);p.wq(p.sp+0x30,state)
 elif start==0x140122ed0:
  args=[spawner,art,state,state];p.wq(p.sp+0x28,state);p.wq(p.sp+0x30,1000);p.wq(p.sp+0x38,0);p.wq(p.sp+0x40,0);p.wq(p.sp+0x48,0x145dbc598)
 elif start==0x1402101b0:
  p.wq(capture,state);name=p.alloc(16);ptr,n=p.string('squirrel');p.wq(name,ptr);p.wq(name+8,n);p.wq(capture+8,name);p.wq(capture+16,state);p.wq(capture+24,state);p.wq(capture+32,art)
 elif start==0x140124bf0:
  args=[spawner,art,state,state];p.wq(state+0x18,0xffffffffffffffff);p.wq(p.sp+0x28,state);p.wq(p.sp+0x30,state);p.wq(p.sp+0x38,state)
 else:args=[spawner,capture]
 records=p.run(args if start in [0x140126020,0x140123aa0,0x1401240c0,0x140124bf0,0x140126a20,0x140122ed0] else [spawner,capture])
 kept=[{k:v for k,v in row.items() if k!='bytes'}for row in records if row['kind']in ['node','text']]
 off=pe.rva_offset(start-pe.image_base)
 return dict(constructor=hex(start),end_exclusive=hex(bounds[start]),file_offset=hex(off),
             sha256=hashlib.sha256(data[off:off+bounds[start]-start]).hexdigest(),
             stopped_before=hex(halt)if halt else 'return',snapshots=kept)

def main():
 scopes=[('sidebar',0x14020d7d0,0x14020ede1),('right-pane',0x14020f550,None),
         ('looks',0x140126020,None),('navigation-button',0x1401240c0,None),
         ('slot-button',0x140123aa0,None),('modal',0x14020ccc0,None),
         ('panels',0x140124bf0,None),('companion-card',0x1402101b0,0x1402108c6),
         ('tabard-card',0x140122ed0,0x1401237d9),('command-button',0x140126a20,0x140126c3a)]
 results={role:sample(start,halt)for role,start,halt in scopes}
 report=dict(target_sha256=hashlib.sha256(data).hexdigest(),constructors=results,
             method='Unmodified original-PE instructions to selected typed UI submission boundaries; Windows x64 register/stack inputs corroborated with REA/Ghidra.',
             node_layout=layout,
             limitations=['The Node384-byte field map is reused from matching Bevy0.18.1 and checked at actual typed bundle sites in this target.',
                          'UI spawn/submission, byte copies, allocators and English identity localization/formatting are fixture seams; no Bevy world, shaping or GPU execution.',
                          'Account/selection inputs are supplied fixtures. Emitted nodes/text values are not rendered layout or interaction parity.',
                          'Card/command samples stop immediately after the first outer Node submission; their child typography/hover comes from separately retained instructions.',
                          'Panel input Node is captured before the common panel style is applied. Generic raw-slice Ghidra signatures are provisional; source assembly binds Windows arguments.'])
 (ROOT/'runtime/analysis/history/interface/rewards-menu/aae945e150f0/layout-vectors.json').write_text(json.dumps(report,indent=2)+'\n')
 print('Recovered',sum(len(v['snapshots'])for v in results.values()),'typed constructor snapshots across',len(results),'scopes')

if __name__=='__main__':main()
