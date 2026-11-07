#!/usr/bin/env python3
"""Recover current floor/Enter evidence and bounded native movement fixtures.

No original process is launched. Native instructions run in Unicorn only when
--fixtures is requested; terrain/math/packet boundaries are explicit seams.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import argparse, hashlib, json, math, struct, subprocess, sys
ROOT = Path(__file__).resolve().parents[1]
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
TARGET = ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
OUT = ROOT/'docs/analysis/evidence/floor-recovery'
WORK = ROOT/'runtime/analysis/history/native-recovery/target-menu-consolidation/1af1b394d2c0'
OWNERS = {'movement':0x1454a5cb0, 'minimum-floor':0x14552b4e0,
 'nearest-floor':0x14552d220, 'blocked-footprint':0x1455257a0,
 'nearest-open':0x145525bb0, 'nearest-outdoor':0x14551dc20,
 'nearest-boundary':0x1454205d0, 'primary-height':0x14552a140,
 'nearby-height':0x1455266f0, 'terrain-constructor':0x145526fa0,
 'indoor-cache-build':0x14552b670, 'floor-triangle-rasterize':0x145530800,
 'floor-candidate-height':0x1455244e0, 'occupancy-rasterize':0x145524fa0,
 'map-archive-open':0x145687e90, 'adt-ground-query':0x14568f2e0,
 'placement-transform':0x145530130, 'terrain-base-query':0x1455264f0,
 'geometry-seen':0x14546cf80, 'wmo-collision-decode':0x145682320,
 'group-mesh-decode':0x145683190, 'adt-column':0x145689130,
 'placement-vertices':0x145542830, 'map-region-read':0x14568ed20,
 'm2-collision-decode':0x145682080, 'occupancy-finalize':0x145524ac0,
 'occupancy-flood':0x145534b20, 'correction-packet':0x145467450,
 'chase-path':0x14552b0e0,'distance-field-build':0x14552aaf0,
 'path-descend':0x14552a810,'grid-segment':0x1455246f0}
REA = {'movement':'rea-floor-recovery','nearest-open':'rea-floor-nearest-open',
 'terrain-constructor':'rea-terrain-constructor','indoor-cache-build':'rea-indoor-cache-build',
 'floor-triangle-rasterize':'rea-floor-triangle-rasterize',
 'occupancy-rasterize':'rea-occupancy-rasterize',
 'placement-transform':'rea-placement-transform','chase-path':'rea-chase-path'}
CONSTANTS = [0x14593f7c0,0x14593fc20,0x145907500,0x145915930,0x145907490,
 0x14594b3d8,0x14593f8d0,0x1469f5c48,0x14593f7e0,0x1459132fc,
 0x14594e610,0x145907508,0x145907498,0x145915800,0x1459e4790,
 0x1459e4a00,0x1459e5010,0x1459158d8,0x1459158d4,0x14673ded0,
 0x145947ed4,0x145913354,0x1459e501c,0x145cdfe60,
 0x14593fc74,0x145907518,0x145947ef0,
 0x1459e4774,0x145a083e8,0x146d347e4,0x1459f4040,0x1459e4f70,
 0x1459132f0,0x145913350,0x1459f42b8,0x14594b520,0x146d347e0,
 0x145bffb50,0x145a47800,0x145a2eac0,0x14593fa10,0x1459095e4,
 0x14590751c,0x145913358,0x1459158d0]

def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--fixtures',action='store_true');args=parser.parse_args()
 data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
 iv = load_script('iv', ROOT/'scripts/inventory-executable.py');pe=iv.PE(data)
 bounds={pe.image_base+a:pe.image_base+z for a,z,_ in pe.functions()}
 def raw(a,n):
  off=pe.rva_offset(a-pe.image_base);return data[off:off+n]
 def span(a,n):
  b=raw(a,n);return dict(address=hex(a),file_offset=hex(pe.rva_offset(a-pe.image_base)),size=n,sha256=hashlib.sha256(b).hexdigest())
 OUT.mkdir(parents=True,exist_ok=True);owners=[]
 for name,a in OWNERS.items():
  n=bounds[a]-a;row=dict(role=name,**span(a,n));row['end_exclusive']=hex(bounds[a])
  (OUT/(name+'.asm')).write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={bounds[a]:#x}',str(TARGET)],cwd=ROOT,text=True))
  if name in REA:
   j=json.loads((WORK/REA[name]/'003-procedure_pseudo_code.json').read_text())['response']['result'];record=j.get('structuredContent')or json.loads(j['content'][0]['text']);assert record['subject']['digest']['sha256']==row['sha256'];assert record['provider']['id']=='ghidra'
   row['rea_evidence_id']=record['evidence_id'];row['rea_input_sha256']=record['subject']['digest']['sha256'];(OUT/(name+'.ghidra.c')).write_text('\n'.join(line.rstrip()for line in record['normalized_result'].splitlines()).rstrip()+'\n')
  owners.append(row)
 zones=[];zoneproof=[]
 for i in range(12):
  a=0x146733518+i*240;b=raw(a,240);p,n=struct.unpack_from('<QQ',b,8);key=raw(p,n).decode();poly=[]
  row=dict(index=i,key=key,**span(a,240))
  if i in (2,7):
   p,n=struct.unpack_from('<QQ',b,88);poly=[list(struct.unpack_from('<ff',raw(p,n*8),j*8))for j in range(n)];row['polygon']=span(p,n*8)
  zones.append(dict(key=key,center=list(struct.unpack_from('<ff',b,200)),radius=struct.unpack_from('<f',b,216)[0],indoor=bool(b[236]),polygon=poly));zoneproof.append(row)
 (ROOT/'crates/azeroth-survivors-re/assets/native-floor-zones-0.100.1.json').write_text(portable_json(zones,indent=2)+'\n')
 constants=[dict(**span(a,4),bits=struct.unpack('<I',raw(a,4))[0],value=struct.unpack('<f',raw(a,4))[0])for a in CONSTANTS]
 vectors=[dict(**span(a,n),values=list(struct.unpack(fmt,raw(a,n))))for a,n,fmt in [(0x146d347f0,16,'<4I'),(0x146d34800,16,'<4I'),(0x146d34dd8,128,'<16q')]]
 navstart,navend=0x1454db89e,0x1454dbad6
 (OUT/'actor-navigation-refresh.asm').write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={navstart:#x}',f'--stop-address={navend:#x}',str(TARGET)],cwd=ROOT,text=True))
 manifest=dict(target=str(TARGET.relative_to(ROOT)),target_sha256=SHA,target_executed=False,owners=owners,zones=zoneproof,constants=constants,vectors=vectors,navigation_refresh=span(navstart,navend-navstart),limits=['Static source-bound evidence and generic x86-64 Ghidra output; Windows arguments/constants corroborated from original-PE ASM.','Host libm _hypotf/cosf/sinf bit parity is not established.','Engine port integration and original/rebuilt indoor comparison are separate validation.'])
 (OUT/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
 if args.fixtures:native_fixtures(pe,data,zones,bounds)
 print('Retained',len(owners),'floor/Enter owners; fixtures',args.fixtures)

def native_fixtures(pe,data,zones,bounds):
 sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
 from unicorn.x86_const import UC_X86_REG_RAX,UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_RSP,UC_X86_REG_RIP,UC_X86_REG_XMM0,UC_X86_REG_XMM1,UC_X86_REG_XMM2,UC_X86_REG_XMM3
 u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in pe.sections);u.mem_map(pe.image_base,(end+4095)&~4095)
 for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
 MEM,STACK,STOP=0x200000000,0x300000000,0x400000000
 u.mem_map(MEM,0x20000);u.mem_map(STACK,0x10000);u.mem_map(STOP,4096)
 reg=u.reg_read;wr=u.reg_write
 def f(v):return struct.unpack('<f',struct.pack('<f',v))[0]
 def xmm(r):return struct.unpack('<f',reg(r).to_bytes(16,'little')[:4])[0]
 def setx(r,v):wr(r,struct.unpack('<I',struct.pack('<f',v))[0])
 def put(a,fmt,*v):u.mem_write(a,struct.pack(fmt,*v))
 def get(a,fmt):return struct.unpack(fmt,u.mem_read(a,struct.calcsize(fmt)))
 context={};packets=[];calls=[]
 def ret():
  sp=reg(UC_X86_REG_RSP);wr(UC_X86_REG_RIP,get(sp,'<Q')[0]);wr(UC_X86_REG_RSP,sp+8)
 def hook(_,a,size,unused):
  if a==STOP:u.emu_stop();return
  if context.get('navigation_mode'):
   if any(start<=a<bounds[start]for start in [0x14552aaf0,0x14552a810,0x1455246f0,0x14552b0e0]):return
   if a in [0x140002200,0x1400021d0]:ret();return
   if a==0x1400021c0:wr(UC_X86_REG_RAX,MEM+0x15000);ret();return
   if a==0x14047b780:
    address=reg(UC_X86_REG_RCX);assert get(address+24,'<Q')[0]==0
    put(address,'<QQQQ',512,MEM+0x17000,0,0);ret();return
   if a==0x1457731db:
    u.mem_write(reg(UC_X86_REG_RCX),bytes([reg(UC_X86_REG_RDX)&255])*reg(UC_X86_REG_R8));ret();return
  if context.get('placement_mode'):
   if a==0x145542830:
    args=reg(UC_X86_REG_RDX);context['matrix']=list(get(get(args+16,'<Q')[0],'<9f'))
   if any(start<=a<bounds[start]for start in [0x145530130,0x145542830]):return
   if a==0x140002200:ret();return
   if a==0x1400021c0:wr(UC_X86_REG_RAX,MEM+0x14000);ret();return
  if context.get('grid_mode') and any(start<=a<bounds[start]for start in [0x14552b4e0,0x14552d220,0x1455257a0,0x145525bb0,0x145530800,0x145524fa0]):return
  if 0x1454a5cb0<=a<bounds[0x1454a5cb0]:return
  calls.append(hex(a))
  if a in (0x145773265,0x14577327d):setx(UC_X86_REG_XMM0,math.floor(xmm(UC_X86_REG_XMM0)) if a==0x145773265 else math.ceil(xmm(UC_X86_REG_XMM0)))
  elif a in (0x145773235,0x145773247):
   import ctypes
   function=getattr(ctypes.CDLL(None),'sinf'if a==0x145773235 else'cosf');function.argtypes=[ctypes.c_float];function.restype=ctypes.c_float;setx(UC_X86_REG_XMM0,function(xmm(UC_X86_REG_XMM0)))
  elif a==0x145530130:
   put(reg(UC_X86_REG_RCX),'<QQQ',0,MEM+0x11000,3)
  elif a==0x145420480:wr(UC_X86_REG_RAX,context['zone'])
  elif a==0x14552a140:
   wr(UC_X86_REG_RAX,1 if context.get('primary',True)else 0);setx(UC_X86_REG_XMM0,context.get('height',10.0))
  elif a==0x14552d220:
   out=reg(UC_X86_REG_RCX);put(out,'<Ifff',1 if context.get('secondary',True)else 0,xmm(UC_X86_REG_XMM2),xmm(UC_X86_REG_XMM3),context.get('height',10.0))
  elif a==0x14552b4e0:wr(UC_X86_REG_RAX,1 if context.get('secondary',True)else 0);setx(UC_X86_REG_XMM0,context.get('height',10.0))
  elif a==0x1455257a0:wr(UC_X86_REG_RAX,int(context.get('blocked',False)))
  elif a==0x145525bb0:
   out=reg(UC_X86_REG_RCX);put(out,'<Iff',1,xmm(UC_X86_REG_XMM2)+6.0,xmm(UC_X86_REG_XMM3))
  elif a==0x1455266f0:wr(UC_X86_REG_RAX,0)
  elif a==0x14551dc20:put(reg(UC_X86_REG_RCX),'<I',0)
  elif a==0x145773277:setx(UC_X86_REG_XMM0,math.hypot(xmm(UC_X86_REG_XMM0),xmm(UC_X86_REG_XMM1)))
  elif a==0x145467450:
   packets.append(list(get(reg(UC_X86_REG_R9),'<fff')));u.mem_write(reg(UC_X86_REG_RCX),bytes(32))
  else:raise RuntimeError('Unreviewed movement boundary '+hex(a))
  ret()
 u.hook_add(UC_HOOK_CODE,hook)
 cases=[]
 def reset(**kwargs):
  context.clear();context.update(zone=11,height=10.0,**kwargs);u.mem_write(MEM,bytes(0x20000));put(MEM+0x898,'<Q',MEM+0x2000);put(MEM+0x2000+0xb8,'<f',10.0);put(MEM+0x550,'<QQQ',32,MEM+0x8000,0);put(MEM+0x9b9,'<B',1);put(MEM+0x990,'<I',1);put(MEM+0x400,'<fff',zones[context['zone']]['center'][0]+20,zones[context['zone']]['center'][1],10.0)
 def report(label,now,z,xy=None,flags=1,phase=1):
  xy=xy or[zones[context['zone']]['center'][0]+20.0,zones[context['zone']]['center'][1]]
  put(MEM+0x934,'<f',now);put(MEM+0x990,'<I',flags);put(MEM+0x9b9,'<B',phase);put(MEM+0x3000,'<fff',*xy,z);put(STACK+0x8008,'<Q',STOP);wr(UC_X86_REG_RSP,STACK+0x8008);wr(UC_X86_REG_RCX,MEM);wr(UC_X86_REG_RDX,MEM+0x3000);setx(UC_X86_REG_XMM2,0.0);packets.clear();calls.clear();u.emu_start(0x1454a5cb0,STOP,count=100000)
  cases.append(dict(label=label,report=dict(now=now,position=[*xy,z],flags=flags,phase=phase),corrected=packets[:],position=list(get(MEM+0x400,'<fff')),pending=get(MEM+0x8f8,'<I')[0],reports_left=get(MEM+0x908,'<B')[0],calls=sorted(set(calls))))
 reset();report('shallow-start',0,9.0);report('shallow-before',f(.75-2**-24),9.0);report('shallow-inclusive',.75,9.0);report('same-spot-first-return',1,9.0);report('same-spot-repeated',1.75,9.0)
 reset();report('stationary-start',0,10.0);report('stationary-before',f(1.5-2**-23),10.0);report('stationary-inclusive',1.5,10.0)
 reset(blocked=True);report('blocked-start',0,10.0,flags=0);report('blocked-inclusive',1,10.0,flags=0)
 reset();report('flying-flag-stationary-start',0,10.0,flags=0x1001);report('flying-flag-stationary-late',2,10.0,flags=0x1001)
 reset();report('ready-stationary-start',0,10.0,phase=0);report('ready-stationary-late',2,10.0,phase=0)
 reset();report('deep-boundary-equal',0,5.0,flags=0);report('deep-below',0,4.9999,flags=0)
 for i in range(12):report('stale-'+str(i),1,10.0,xy=[zones[11]['center'][0]+24,zones[11]['center'][1]],flags=0)
 report('stale-budget-exhausted',1,10.0,xy=[zones[11]['center'][0]+24,zones[11]['center'][1]],flags=0)
 # Outcomes are instruction results, not values copied from the Rust implementation.
 assert not cases[1]['corrected'] and cases[2]['corrected'] and cases[4]['corrected']
 assert not cases[6]['corrected'] and cases[7]['corrected']
 assert cases[9]['corrected'] and all(not row['corrected']for row in cases[10:14])
 (OUT/'native-fixtures.json').write_text(portable_json(dict(target_sha256=SHA,owner='0x1454a5cb0',method='Original selected-PE instruction execution; explicit terrain-cache/math/packet seams. No game process, file/network/UI operation.',cases=cases,limits=['Terrain helper results are controlled ports; separate grid/helper instruction tests are required for geometry fidelity.','The host math boundary does not prove Windows CRT libm bit parity.']),indent=2)+'\n')
 print('Native movement cases',len(cases))
 placement_fixtures(u,context,bounds,MEM,STACK,STOP,reg,wr,put,get)
 navigation_fixtures(u,context,bounds,MEM,STACK,STOP,reg,wr,put,get,setx)
 grid_fixtures(u,context,pe,bounds,MEM,STACK,STOP,reg,wr,put,get,setx)
def placement_fixtures(u,context,bounds,MEM,STACK,STOP,reg,wr,put,get):
 from unicorn.x86_const import UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_RSP
 cases=[]
 for rotation in [[0.,0.,0.],[0.,90.,0.],[10.,34.,-20.],[-90.,270.,90.],[3.5,67.75,1.25]]:
  context.clear();context['placement_mode']=True
  vertices=[[1.,0.,0.],[0.,1.,0.],[0.,0.,1.]];position=[3.,-2.,5.];scale=1.5
  put(MEM+0x11000,'<9f',*(v for p in vertices for v in p));put(MEM+0x12000,'<3f',*position);put(MEM+0x12100,'<3f',*rotation)
  put(STACK+0x8008,'<Q',STOP);put(STACK+0x8030,'<Q',MEM+0x12100);put(STACK+0x8038,'<f',scale)
  wr(UC_X86_REG_RSP,STACK+0x8008);wr(UC_X86_REG_RCX,MEM+0x13000);wr(UC_X86_REG_RDX,MEM+0x11000);wr(UC_X86_REG_R8,3);wr(UC_X86_REG_R9,MEM+0x12000)
  u.emu_start(0x145530130,STOP,count=100000)
  pointer=get(MEM+0x13008,'<Q')[0];result=[list(get(pointer+i*12,'<3f'))for i in range(3)]
  cases.append(dict(rotation=rotation,matrix=context['matrix'],vertices=vertices,position=position,scale=scale,result=result))
 (OUT/'placement-fixtures.json').write_text(portable_json(dict(target_sha256=SHA,owners=['0x145530130','0x145542830'],method='Original selected-PE rotation and vertex multiplication instructions, host sinf/cosf and allocation seams.',cases=cases),indent=2)+'\n')
 print('Native placement cases',len(cases))
def navigation_fixtures(u,context,bounds,MEM,STACK,STOP,reg,wr,put,get,setx):
 from unicorn.x86_const import UC_X86_REG_RAX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_RCX,UC_X86_REG_RSP,UC_X86_REG_XMM0,UC_X86_REG_XMM2,UC_X86_REG_XMM3
 context.clear();context['navigation_mode']=True;cases=[];side=8;origin=[0.,0.]
 patterns=[[0]*64,[int(i%8==4 and i//8!=2)for i in range(64)],[int(i%8==4)for i in range(64)],
  [int(i in [19,26,28,35])for i in range(64)]]
 def stack():put(STACK+0x8008,'<Q',STOP);wr(UC_X86_REG_RSP,STACK+0x8008)
 def packed(xy):return struct.unpack('<Q',struct.pack('<ff',*xy))[0]
 for cells in patterns:
  grid=MEM+0x4000;output=MEM+0x6000;field=MEM+0x7000
  put(grid,'<QQQQff',64,MEM+0x5000,64,side,*origin);u.mem_write(MEM+0x5000,bytes(cells));xy=[1.5,2.5]
  stack();wr(UC_X86_REG_RCX,output);wr(UC_X86_REG_RDX,grid);setx(UC_X86_REG_XMM2,xy[0]);setx(UC_X86_REG_XMM3,xy[1]);u.emu_start(0x14552aaf0,STOP,count=1000000)
  values=get(get(output+8,'<Q')[0],'<64H');start,populated=get(output+24,'<QQ');put(field,'<QQQQQ',64,MEM+0x15000,64,start,populated)
  row=dict(origin=origin,side=side,cells=cells,player=xy,distances=list(values),start=start,populated=populated,queries=[])
  for point in [[6.5,2.5],[6.5,6.5],[3.5,3.5],[4.5,2.5]]:
   stack();wr(UC_X86_REG_RCX,grid);wr(UC_X86_REG_RDX,packed(point));wr(UC_X86_REG_R8,packed(xy));u.emu_start(0x1455246f0,STOP,count=1000000);fraction=struct.unpack('<f',reg(UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
   put(MEM+0x8000,'<ff',*point);put(MEM+0x8100,'<ff',*xy);stack();put(STACK+0x8030,'<Q',MEM+0x8100);put(STACK+0x8038,'<f',14.)
   wr(UC_X86_REG_RCX,MEM+0x8200);wr(UC_X86_REG_RDX,field);wr(UC_X86_REG_R8,grid);wr(UC_X86_REG_R9,MEM+0x8000);u.emu_start(0x14552b0e0,STOP,count=1000000)
   result=list(get(MEM+0x8204,'<ff'))if get(MEM+0x8200,'<I')[0]else None
   row['queries'].append(dict(point=point,to=xy,segment_fraction=fraction,chase=result))
  cases.append(row)
 (OUT/'navigation-fixtures.json').write_text(portable_json(dict(target_sha256=SHA,method='Original distance-field, segment and chase PE instructions; allocation, memset and ceilf seams only.',cases=cases),indent=2)+'\n')
 print('Native navigation cases',len(cases))
def grid_fixtures(u,context,pe,bounds,MEM,STACK,STOP,reg,wr,put,get,setx):
 from unicorn.x86_const import UC_X86_REG_RAX,UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_RSP,UC_X86_REG_XMM0,UC_X86_REG_XMM1,UC_X86_REG_XMM2,UC_X86_REG_XMM3
 import random
 random_source=random.Random(1001);cases=[]
 context.clear();context['grid_mode']=True
 def run(operation,cells,xy,side=9,radius=4.0):
  grid=MEM+0x4000;data=MEM+0x5000;output=MEM+0x7000;origin=[-3.0,-4.0]
  is_height=operation in ('minimum','nearest')
  u.mem_write(data,struct.pack('<'+('f'if is_height else'B')*len(cells),*cells));put(grid,'<QQQQff',len(cells),data,len(cells),side,*origin);u.mem_write(output,bytes(16));put(STACK+0x8008,'<Q',STOP);put(STACK+0x8030,'<f',radius);wr(UC_X86_REG_RSP,STACK+0x8008);wr(UC_X86_REG_RAX,0)
  entry={'minimum':0x14552b4e0,'nearest':0x14552d220,'blocked':0x1455257a0,'open':0x145525bb0}[operation]
  if operation in ('minimum','blocked'):
   wr(UC_X86_REG_RCX,grid);setx(UC_X86_REG_XMM1,xy[0]);setx(UC_X86_REG_XMM2,xy[1])
  else:
   wr(UC_X86_REG_RCX,output);wr(UC_X86_REG_RDX,grid);setx(UC_X86_REG_XMM2,xy[0]);setx(UC_X86_REG_XMM3,xy[1])
  u.emu_start(entry,STOP,count=1000000)
  if operation=='minimum':
   found=reg(UC_X86_REG_RAX)&1;result=struct.unpack('<f',reg(UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]if found else None
  elif operation=='blocked':result=bool(reg(UC_X86_REG_RAX)&1)
  elif get(output,'<I')[0]:result=list(get(output+4,'<fff'if operation=='nearest'else'<ff'))
  else:result=None
  cases.append(dict(operation=operation,side=side,origin=origin,cells=[None if is_height and math.isnan(v)else v for v in cells],xy=xy,radius=radius,result=result))
 for i in range(12):
  cells=[float(j%7)-3 if random_source.random()>.45 else float('nan')for j in range(81)]
  xy=[-3+random_source.choice([.125,.25,.75,1.25,3.75]),-4+random_source.choice([.125,.25,.75,2.25,3.75])]
  run('minimum',cells,xy);run('nearest',cells,xy)
 for cells in [[1]*81,[0]*81,[1 if i!=40 else 0 for i in range(81)],[0 if 20<=i<=60 else 1 for i in range(81)]]:
  for xy in [[1.5,.5],[1.,0.],[-2.5,-3.5]]:run('blocked',cells,xy);run('open',cells,xy)
 (OUT/'grid-fixtures.json').write_text(portable_json(dict(target_sha256=SHA,method='Unchanged selected-PE minimum/nearest/blocked/open helper instructions; floorf and ceilf are the only external math seams.',cases=cases),indent=2)+'\n')
 print('Native grid cases',len(cases))
 triangle_fixtures(u,context,bounds,MEM,STACK,STOP,reg,wr,put,get)
def triangle_fixtures(u,context,bounds,MEM,STACK,STOP,reg,wr,put,get):
 from unicorn.x86_const import UC_X86_REG_RAX,UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_RSP
 cases=[];side=8;origin=[0.0,0.0];maximum=8.0
 triangles=[[[0,0,0],[4,0,0],[0,4,0]],[[0,0,0],[0,4,0],[4,0,0]],
 [[0,0,9],[4,0,9],[0,4,9]],[[0,0,0],[0,0,4],[0,4,0]],
 [[0,0,0],[4,0,4],[0,4,0]],[[0,0,0],[4,0,8],[0,4,0]],
 [[1,1,1],[3,1,2],[1,3,1]],[[0,0,0],[4,4,1],[4,0,2]],
 [[-1,-1,0],[1,-1,0],[-1,1,0]],[[10,10,0],[12,10,0],[10,12,0]],
 [[0,0,8],[4,0,8],[0,4,8]],[[0,0,7.5],[4,0,8.5],[0,4,7.5]]]
 for triangle in triangles:
  output=MEM+0x9000;values=MEM+0xa000;layout=MEM+0x3000;vertices=MEM+0x3100
  put(output,'<QQQ',4096,values,0);put(layout,'<ffQ',*origin,side)
  for i,vertex in enumerate(triangle):put(vertices+i*16,'<fff',*vertex)
  put(STACK+0x8008,'<Q',STOP);put(STACK+0x8030,'<Q',vertices+32);put(STACK+0x8038,'<f',maximum);wr(UC_X86_REG_RSP,STACK+0x8008);wr(UC_X86_REG_RCX,output);wr(UC_X86_REG_RDX,layout);wr(UC_X86_REG_R8,vertices);wr(UC_X86_REG_R9,vertices+16)
  u.emu_start(0x145530800,STOP,count=1000000);count=get(output+16,'<Q')[0]
  result=[dict(cell=get(values+i*8,'<I')[0],height=get(values+i*8+4,'<f')[0])for i in range(count)]
  cases.append(dict(triangle=triangle,origin=origin,side=side,maximum=maximum,result=result))
 (OUT/'triangle-fixtures.json').write_text(portable_json(dict(target_sha256=SHA,owner='0x145530800',method='Unchanged selected-PE floor triangle rasterizer; only floorf/ceilf seams, preallocated output.',cases=cases),indent=2)+'\n')
 print('Native triangle cases',len(cases))
 occupancy_fixtures(u,context,MEM,STACK,STOP,reg,wr,put,get)
def occupancy_fixtures(u,context,MEM,STACK,STOP,reg,wr,put,get):
 from unicorn.x86_const import UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_RSP
 cases=[];side=8;origin=[0.0,0.0]
 triangles=[[[1,1,0],[1,6,0],[1,1,3]],[[1,1,0],[6,1,0],[1,1,3]],
 [[1,1,0],[6,1,0],[1,6,0]],[[1,1,.35],[1,6,.35],[1,1,.35001]],
 [[1,1,2.4],[1,6,2.4],[1,1,3]],[[1,1,2.399],[1,6,2.399],[1,1,3]],
 [[1,1,-2],[1,6,-2],[1,1,0]],[[1,1,0],[1,6,0],[1,1,.36]],
 [[-1,1,0],[-1,6,0],[-1,1,3]],[[7.8,1,0],[7.8,6,0],[7.8,1,3]]]
 for triangle in triangles:
  grid=MEM+0x10000;vertices=MEM+0x11000;indices=MEM+0x12000;mesh=MEM+0x13000;cells=MEM+0x14000;floors=MEM+0x15000
  put(grid,'<QQQQff',side*side,cells,side*side,side,*origin);u.mem_write(cells,bytes(side*side));put(floors,'<'+'f'*(side*side),*([0.0]*(side*side)))
  for i,vertex in enumerate(triangle):put(vertices+i*12,'<fff',*vertex)
  put(indices,'<III',0,1,2);put(mesh,'<QQQQQQ',0,vertices,3,0,indices,3);put(STACK+0x8008,'<Q',STOP);put(STACK+0x8030,'<f',1.0);put(STACK+0x8038,'<Q',floors);put(STACK+0x8040,'<Q',side*side);wr(UC_X86_REG_RSP,STACK+0x8008);wr(UC_X86_REG_RCX,grid);wr(UC_X86_REG_RDX,mesh);wr(UC_X86_REG_R8,0);wr(UC_X86_REG_R9,0)
  u.emu_start(0x145524fa0,STOP,count=1000000)
  cases.append(dict(triangle=triangle,origin=origin,side=side,floor_heights=[0.0]*(side*side),cells=list(u.mem_read(cells,side*side))))
 (OUT/'occupancy-fixtures.json').write_text(portable_json(dict(target_sha256=SHA,owner='0x145524fa0',method='Unchanged selected-PE occupancy sampling after an explicit pretransformed-vertex seam; ceilf math, no heap allocation.',cases=cases),indent=2)+'\n')
 print('Native occupancy cases',len(cases))
if __name__=='__main__':main()
