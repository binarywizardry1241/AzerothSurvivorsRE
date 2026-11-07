#!/usr/bin/env python3
"""Recover selected-target in-run talent-view layout without builds or execution.

--prepare extracts exact owner slices/assembly and a bounded REA/Ghidra plan.
--verify replays unmodified original instructions to typed UI seams using the
existing local Unicorn dependency. Unknown calls fail closed; no game, UI engine,
font shaper, renderer, dependency install or compiler runs.
--collect promotes the reviewed vectors and compact native evidence locally.
The shared Node/PE/Unicorn harness is recover-rewards-layout.py; its hash
check also guards this script. See layout-manifest.json for seams and limits.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse, hashlib, subprocess
import json, struct
from pathlib import Path
R=Path(__file__).resolve().parents[1]
m = load_script('reward', R/'scripts/recover-rewards-layout.py')
class Probe(m.Probe):
 def hook(self,u,a,n,v):
  if self.start<=a<m.bounds[self.start] or a==self.halt or a==0x400000000:return super().hook(u,a,n,v)
  c=self.reg(m.UC_X86_REG_RCX);d=self.reg(m.UC_X86_REG_RDX);r8=self.reg(m.UC_X86_REG_R8);r9=self.reg(m.UC_X86_REG_R9);sp=self.reg(m.UC_X86_REG_RSP);site=self.q(sp)-5
  if a==0x1458e6170:self.result(self.q(0x146e77f68))
  elif a==0x145886b00:self.u.mem_write(c,struct.pack('<QQQ',0,8,0));self.result(c)
  elif a in [0x145885bb0,0x1458e2230,0x1458e29a0]:self.result(0)
  elif a in [0x14021aed0,0x140217570]:self.records.append(dict(site=hex(site),kind='helper',target=hex(a)));self.result(c)
  elif a in [0x1458e22d0,0x1458e1f90,0x14012b1a0]:self.result(0)
  elif a==0x145890a60:
   ptr,n=self.string('Warrior');ret=self.alloc(16);self.wq(ret,ptr);self.wq(ret+8,n);self.result(ret)
  elif a==0x140012680:self.u.mem_write(c,self.read(d,384)+bytes(128));self.result(c)
  elif a in [0x14018d5c0]:
   self.records.append(dict(site=hex(site),kind='node',target=hex(a),node=self.node(r8+8)));self.u.mem_write(c,self.read(d,40));self.result(c)
  elif a==0x1458df560:self.result(self.q(c),self.q(c+8))
  elif a==0x1400123b0:self.u.mem_write(c,bytes(24));self.result(c)
  elif a==0x1426d6630:self.result(c)
  elif a in [0x14018ba80,0x14018e390]:
   self.records.append(dict(site=hex(site),kind='node',target=hex(a),node=self.node(r8+8)));self.u.mem_write(c,self.read(d,40));self.result(c)
  elif a in [0x140128540,0x14012cde0,0x140129140,0x140128e80]:
   self.records.append(dict(site=hex(site),kind='helper',target=hex(a)));self.result(c)
  elif a in [0x14018f1b0,0x14018f460]:
   self.records.append(dict(site=hex(site),kind='node',target=hex(a),node=self.node(r8+8),tail=self.read(r8+392,128).hex()));self.u.mem_write(c,self.read(d,40));self.result(c)
  elif a==0x145875700:self.result(*self.string('Warrior'))
  elif a==0x145873d60:self.result(*self.string('Warrior'))
  elif a==0x14010f790:self.u.mem_write(c,struct.pack('<Iffff',1,1.,1.,1.,1.));self.result(c)
  elif a==0x140012180:self.u.mem_write(c,self.read(d,384)+bytes(128));self.result(c)
  elif a==0x14012bb00:
   self.records.append(dict(site=hex(site),kind='helper',target=hex(a),rdx=hex(d),r8=hex(r8),r9=hex(r9),stack=[hex(self.q(sp+i))for i in [0x28,0x30,0x38]]));self.result(c)
  else:return super().hook(u,a,n,v)
  self.u.reg_write(m.UC_X86_REG_RIP,self.q(sp));self.u.reg_write(m.UC_X86_REG_RSP,sp+8)
m.bounds[0x140130c73]=0x140130ed9
m.bounds[0x140130c52]=0x140130ed9
m.bounds[0x140130956]=0x14013098c
m.bounds[0x145875700]=0x14587571f

WORK = R/'runtime/analysis/history/progression/talent-view-layout/71a8d9f8baaa'
OUT = R/'docs/analysis/evidence/0.105.0/talent-view'
OWNERS = {
 'layout-root':0x140130c52, 'lifecycle':0x140130956,
 'class-lookup':0x145875700, 'class-display':0x145873d60,
 'canvas':0x1401a5a10, 'content':0x1401a5ce0,
 'trees-layout':0x14012bb00, 'tree-content':0x14021aed0,
 'tree-art':0x140128540, 'prerequisite-links':0x14012cde0,
 'cell':0x140129140, 'milestones':0x140128e80,
 'detail-content':0x140217570, 'selected-detail':0x140129c00,
}
def write_json(path, value):
 path.parent.mkdir(parents=True,exist_ok=True)
 path.write_text(portable_json(value,indent=2)+'\n')
def prepare():
 WORK.mkdir(parents=True,exist_ok=True)
 for name,start in OWNERS.items():
  end=m.bounds[start];off=m.pe.rva_offset(start-m.pe.image_base)
  (WORK/(name+'.bin')).write_bytes(m.data[off:off+end-start])
  with (WORK/(name+'.asm')).open('w') as stream:
   stream.write(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={start:#x}',f'--stop-address={end:#x}',str(R/'AzerothSurvivors/AzerothSurvivors-0.105.0.exe')],cwd=R,text=True))
  write_json(WORK/(name+'-plan.json'),dict(target=str(WORK/(name+'.bin')),output=str(WORK/('rea-'+name)),init_timeout=60,timeout=240,open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(start)),operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(start)))]))
def class_headers():
 def read(address,count):
  offset=m.pe.rva_offset(address-m.pe.image_base)
  return m.data[offset:offset+count]
 rows=[]
 for class_id in [1,2,3,4,5,7,8,9,11]:
  address=0x146bab7a8 if class_id==1 else struct.unpack('<Q',read(0x146bb2f30+(class_id-2)*8,8))[0]
  fields={}
  for label,offset in [('key',0x10),('display_name',0x20),('color',0x50)]:
   pointer,count=struct.unpack('<QQ',read(address+offset,16))
   raw=read(pointer,count)
   fields[label]=dict(address=hex(pointer),length=count,value=raw.decode(),sha256=hashlib.sha256(raw).hexdigest())
  rows.append(dict(class_id=class_id,descriptor=hex(address),fields=fields))
 return rows

def verify():
 WORK.mkdir(parents=True,exist_ok=True)
 vectors={}
 for addr in [0x140130c73,0x1401a5a10,0x1401a5ce0,0x14012bb00,0x14021aed0,0x140217570]:
  p=Probe(addr,0x140130ed9 if addr==0x140130c73 else None);spawner=p.alloc(64);capture=p.alloc(256)
  for i in range(9):
   ref=p.alloc(512);inner=p.alloc(2048);p.wq(ref,inner);p.wq(inner+0x20,p.alloc(32));p.wq(inner+8,p.alloc(32));p.wq(capture+i*8,ref)

  if addr==0x14021aed0:
   tree=p.q(0x146e77f68);p.wq(capture+8,tree);font=p.alloc(512);p.wq(font+8,p.alloc(32));p.wq(font+0x20,p.alloc(32));p.wq(capture+16,font)
  if addr==0x140217570:
   flag=p.alloc(64);p.u.mem_write(flag,b'\x01');p.wq(capture,flag);font=p.alloc(512);p.wq(font+8,p.alloc(32));p.wq(font+0x20,p.alloc(32));p.wq(capture+8,font)
  if addr==0x14012bb00:
   character=p.alloc(512);p.u.mem_write(character+0x38,b'\x01');p.wq(p.sp+0x28,character);p.wq(p.sp+0x30,p.alloc(512));p.wq(p.sp+0x38,1)
  args=[spawner,capture]
  if addr==0x14012bb00:args += [p.alloc(512),p.alloc(512)]
  p.run(args)

  if addr==0x140130c73:
   at=p.reg(m.UC_X86_REG_R8);p.records.append(dict(kind='root',node=p.node(at),tail=p.read(at+384,32).hex()))
  out=[{k:v for k,v in row.items() if k!='bytes'} for row in p.records]
  vectors[hex(addr)] = out

 class CellProbe(Probe):
  def hook(self,u,a,n,v):
   if a in [0x1458e1f90,0x1458e27c0,0x1458e13b0]:
    sp=self.reg(m.UC_X86_REG_RSP)
    self.result(self.rank if a==0x1458e1f90 else self.gate if a==0x1458e27c0 else self.milestone)
    self.u.reg_write(m.UC_X86_REG_RIP,self.q(sp));self.u.reg_write(m.UC_X86_REG_RSP,sp+8);return
   return super().hook(u,a,n,v)
 cells=[]
 for rank,gate,milestone,selected in [(0,False,False,False),(0,True,False,False),(1,True,False,False),(3,True,False,False),(0,False,True,False),(0,True,False,True)]:
  p=CellProbe(0x140129140,0x1401295a8);p.rank=rank;p.gate=gate;p.milestone=milestone
  spawner=p.alloc(64);art=p.alloc(512);font=p.alloc(512);state=p.alloc(512);talent=p.alloc(120);allocation=p.alloc(512)
  key,n=p.string('fixture-talent');p.wq(talent+0x20,key);p.wq(talent+0x28,n);p.u.mem_write(talent+0x72,b'\x03');p.wq(art+8,p.alloc(32));p.wq(art+0x20,p.alloc(32));p.wq(font+8,p.alloc(32));p.wq(font+0x20,p.alloc(32))
  if selected:p.wq(state+0x58,key);p.wq(state+0x60,n)
  for off,value in [(0x28,1),(0x30,talent),(0x38,allocation),(0x40,0),(0x48,1)]:p.wq(p.sp+off,value)
  p.run([spawner,art,font,state]);bp=p.reg(m.UC_X86_REG_RBP)
  border=struct.unpack('<4f',p.read(bp+0x7b0,16))+ (struct.unpack('<f',p.reg(m.UC_X86_REG_XMM6).to_bytes(16,'little')[:4])[0],)
  brightness=struct.unpack('<f',p.reg(m.UC_X86_REG_XMM7).to_bytes(16,'little')[:4])[0]
  cells.append(dict(rank=rank,max_rank=3,otherwise_learnable=gate,milestone=milestone,selected=selected,readonly=True,brightness=brightness,color_variant=border[0],border_rgba=border[1:]))
 assert len(vectors['0x1401a5ce0'])==10
 assert [x['text'] for x in vectors['0x1401a5ce0'] if x['kind']=='text']==['Talents','Warrior','  ·  what this run plays with','Close']
 assert len([x for x in vectors['0x14012bb00'] if x['kind']=='node'])==4
 assert [round(x['brightness'],2) for x in cells]==[.22,.55,1,1,.22,.55]
 assert round(cells[4]['border_rgba'][3],2)==.6
 # Retain the selected constructor values, omitting default Node payloads and
 # repeated per-cell helper call samples. Complete native code remains in asm.
 compact={}
 for address,records in vectors.items():
  seen=set();kept=[]
  for row in records:
   if row['kind']=='helper':
    identity=(row['site'],row['target'])
    if identity in seen:continue
    seen.add(identity)
    row={key:row[key] for key in ('kind','site','target')}
    if row['site']=='0x1401a70ad':row['readonly']=True
   elif row['kind'] in ('node','root'):
    row=dict(row)
    row['node']={key:value for key,value in row['node'].items()
                 if value not in (0,0.,[0,0.],[1,0.],[[1,0.]]*4)}
   kept.append(row)
  compact[address]=kept
 result=dict(snapshot_format='Node snapshots omit zero/Auto fields and Px0 gaps/rects; helper call sites deduplicated. Typed original instructions are retained in assembly.',class_headers=class_headers(),header_colors=dict(title=[.973,.824,.416,1],trailing_subtitle=[.725,.663,.510,1],close=[1,.914,.659,1]),target_sha256=hashlib.sha256(m.data).hexdigest(),constructors=compact,readonly_cell_cases=cells)
 write_json(WORK/'layout-vectors.json',result)
 print('Verified 49 constructor/UI seam records and six readonly appearance cases; no game or compiler executed.')
 return result

def collect():
 OUT.mkdir(parents=True,exist_ok=True)
 vectors=json.loads((WORK/'layout-vectors.json').read_text())
 assert vectors['target_sha256']==hashlib.sha256(m.data).hexdigest()
 write_json(OUT/'layout-vectors.json',vectors)
 extracts=[]
 for name,start in OWNERS.items():
  end=m.bounds[start];offset=m.pe.rva_offset(start-m.pe.image_base)
  asm=(WORK/(name+'.asm')).read_text().replace(str(R)+'/', '')
  (OUT/(name+'.asm')).write_text(asm)
  row=dict(role=name,start=hex(start),end_exclusive=hex(end),file_offset=hex(offset),sha256=hashlib.sha256(m.data[offset:offset+end-start]).hexdigest(),assembly=name+'.asm')
  rea=WORK/('rea-'+name)/'003-procedure_pseudo_code.json'
  if rea.exists():
   record=json.loads(rea.read_text())['response']['result']['structuredContent']
   if record.get('evidence_id'):
    row['rea_evidence_id']=record['evidence_id']
    row['rea_provider']=record['provider']
  extracts.append(row)
 write_json(OUT/'layout-manifest.json',dict(target_path='AzerothSurvivors/AzerothSurvivors-0.105.0.exe',target_sha256=hashlib.sha256(m.data).hexdigest(),extracts=extracts,shared_panel_style='docs/analysis/evidence/0.105.0/run-hud/controls-panel-style.asm',root_build_fragment=dict(start='0x140130c52',end_exclusive='0x140130ed9',owner='0x1401308b0',assembly='layout-root.asm',replay_start='0x140130c73'),method='Hash-bound PE instructions replayed at typed UI seams; source Windows x64 register/stack trace corroborates shared tree/read-only arguments.',seams=['UI typed bundle submissions return fixture command spawners; no Bevy world or rendering.', 'Allocator/refcount/copy helpers model only storage mechanics.', 'English identity localization and format templates; dynamic interpolated values are not text-layout results.', 'Warrior display name fixture; font handles and asset handles are synthetic. Native tree descriptors come from the target table at0x146e77f68.', 'Readonly appearance vectors stub rank, unlimited gate and milestone predicates as declared per-case inputs. Original branches/stores execute unchanged.', 'Common panel style helper is a copy seam in vectors; its canonical assembly separately establishes border1/radius10 and styling.'],limitations=['No compilation, game process, rendering, input interaction, original/rebuilt comparison or visual parity validation.', 'Raw-slice Ghidra lacks original external data/callee bodies; generic signatures are provisional.', 'Node384 map reused from Bevy0.18.1; actual typed bundle Node stores and sizes checked against this target.', 'Source talent catalog current0.100.1 provenance is not fully revalidated0.105.0; current Demonology remains a separate gap.', 'Root typed tail contains Color black alpha.72, GlobalZIndex5300, Interaction None2; absence of Escape handling in these constructors is not proof of absence globally.']))
 print('Collected talent-view layout evidence under',OUT.relative_to(R))

if __name__=='__main__':
 parser=argparse.ArgumentParser(description=__doc__)
 parser.add_argument('--prepare',action='store_true');parser.add_argument('--verify',action='store_true');parser.add_argument('--collect',action='store_true')
 args=parser.parse_args()
 if not any(vars(args).values()):parser.error('select --prepare, --verify or --collect')
 if args.prepare:prepare()
 if args.verify:verify()
 if args.collect:collect()
