#!/usr/bin/env python3
"""Replay current modifier readers in spawn budgets, top-up, formations and guardian speed."""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse, hashlib, itertools, json, math, struct, sys
from coverage_common import ROOT,latest_target,target_bytes
sys.path[:0]=[str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
from unicorn import x86_const as R
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
target=latest_target(verify=False);assert target['sha256']==SHA;data=target_bytes(target)
m = load_script('density_pe', ROOT/'scripts/inventory-executable.py');p=m.PE(data)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],data[x['raw_offset']:x['raw_offset']+x['raw_size']])
mem=0x200000000;u.mem_map(mem,0x100000);game,actors,definitions,frame=mem,mem+0x2000,mem+0x5000,mem+0x9000
RANGES={'budget':(0x14593b1bb,0x14593b2fa),'top-up':(0x14593b52a,0x14593b74b),'formation-density':(0x14593bd17,0x14593bd2c),'swarm-count':(0x14593bdde,0x14593be3b),'stampede-count':(0x14593c026,0x14593c088),'wall-count':(0x14593be4e,0x14593bea6),'pack-count':(0x14593bf0d,0x14593bf6e),'stampede-speed':(0x14593cce2,0x14593cd12),'guardian-speed-read':(0x14593e09b,0x14593e0a3)}
stop=0;seams=set()
def reg(n,v=None):
 a=getattr(R,'UC_X86_REG_'+n)
 if v is not None:u.reg_write(a,v)
 return u.reg_read(a)
def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def f(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def xf(n):return struct.unpack('<f',struct.pack('<I',reg(n)&0xffffffff))[0]
def hook(_,a,n,__):
 if a==stop:u.emu_stop();return
 if any(x<=a<y for x,y in RANGES.values())or 0x14593e180<=a<0x14593e191 or 0x14593e428<=a<0x14593e42c:return
 if a==0x145bfa141:
  seams.add(hex(a));reg('XMM0',bits(math.ceil(xf('XMM0'))));sp=reg('RSP');reg('RIP',q(sp));reg('RSP',sp+8);return
 raise RuntimeError(('unscoped',hex(a)))
u.hook_add(UC_HOOK_CODE,hook)
def run(a,b):
 global stop
 stop=b;u.emu_start(a,0,count=10000);assert reg('RIP')==b

def setup(clock,density,rows,endless,phase,start):
 u.mem_write(mem,bytes(0x10000));reg('RBP',frame);reg('RSP',frame-0x1000);reg('R13',game);reg('MXCSR',0x1f80);reg('EFLAGS',2);put(game+0xa34,'f',clock);put(game+0x2b0,'H',density);put(game+0xab8,'B',int(endless));put(game+0x970,'If',phase,start);put(game+0x560,'QQ',actors,len(rows));put(frame+0x3e8,'Q',game);put(frame+0x18,'f',f(clock/60))
 for i,(kind,dead,flag)in enumerate(rows):
  a=actors+i*0x1d8;definition=definitions+i*128;put(a+0xb0,'I',int(dead));put(a+0x18,'q',0 if kind=='boss'else-1)
  if kind=='boss':put(a+0x30,'Q',definition);put(definition+0x64,'B',flag)
  else:put(a+0xf8,'Q',definition);put(definition+0x4c,'B',flag)

budgets=[];topups=[]
profiles=[[],[('boss',False,0)],[('boss',False,1)],[('boss',False,0),('boss',False,1)],[('boss',True,1),('ordinary',False,0),('guardian',False,1),('ordinary',True,0)]]
for clock,density,rows,state in itertools.product([0.,60.,600.,1800.],[0,1,99,100,101,125,200,500,65535],profiles,[(False,0,0.),(True,1,720.),(True,0,720.)]):
 endless,phase,start=state;setup(clock,density,rows,endless,phase,start);run(*RANGES['budget']);actual=bits(xf('XMM8'))
 factor=min([f(.3 if flag else .45)for kind,dead,flag in rows if kind=='boss'and not dead]or[1.]);minutes=f(clock/60);linear=f(f(minutes*f(.32))+f(.9));quad=f(f(f(.025)*minutes)*minutes);poly=f(f(quad+linear)*f(.6));rate=f(f(f(density/100)*poly)*factor);elapsed=max(f(f(clock-start)/60),0.)if phase==1 else 0.;mult=f(f(elapsed*f(.1))+f(1.5))if endless else 1.;want=bits(f(rate*mult));assert actual==want,(clock,density,rows,state,actual,want);budgets.append([clock,density,rows,list(state),f'{actual:08x}'])
 # Original top-up caller retains XMM7=1 when the actor vector is empty.
 setup(clock,density,rows,endless,phase,start);reg('XMM7',bits(1.));run(*RANGES['top-up']);actual=reg('R15');d=f(density/100);target=int(min(f(f(f(minutes*f(1.6))+4)*d*factor),f(36*d)));living=sum(kind!='boss'and not dead and flag==0 for kind,dead,flag in rows);want=min(max(0,target-living),3*math.ceil(d));assert actual==want,(clock,density,rows,actual,want);topups.append([clock,density,rows,actual])
formations=[]
for minutes,density,kind in itertools.product([0.,5.625,20.,30.],[0,1,99,100,125,500,65535],range(4)):
 reg('R15',density);reg('XMM6',bits(minutes));run(*RANGES['formation-density']);at,end=RANGES[['swarm-count','stampede-count','wall-count','pack-count'][kind]]
 if kind==1:reg('RBX',definitions);put(definitions,'Q',0)
 run(at,end);actual=reg(['RDX','RCX','RSI','RDI'][kind]);scale=f(f(density/100)*f(.6));base=f(f(minutes*f([2.5,2.,2.,.8][kind]))+[12.,10.,10.,5.][kind]);want=max(int(f(base*scale)),2 if kind==3 else 1);assert actual==want,(minutes,density,kind,actual,want);formations.append([minutes,density,kind,actual])
speeds=[]
for percent,base in itertools.product([0,99,100,105,150,65535],[0.,1.,2.75]):
 put(game+0x2b6,'H',percent);reg('R13',game);run(*RANGES['guardian-speed-read']);run(0x14593e180,0x14593e191);reg('XMM7',bits(base));run(0x14593e428,0x14593e42c);actual=bits(xf('XMM7'));assert actual==bits(f(base*f(percent/100)));speeds.append([percent,base,f'{actual:08x}'])
 # Stampede actor read supplies movement_speed*1.4 from the same percentage.
 reg('RSI',game);reg('RAX',0);reg('RCX',definitions);put(definitions+0x3c,'f',base);run(*RANGES['stampede-speed']);actual=bits(xf('XMM0'));want=bits(f(f(f(percent/100)*f(base*f(1.05)))*f(1.4)));assert actual==want;speeds.append([percent,base,'stampede',f'{actual:08x}'])
out=ROOT/'docs/analysis/evidence/runmods-scaling';ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args();md=Cs(CS_ARCH_X86,CS_MODE_64);ranges=[]
if args.write:out.mkdir(parents=True,exist_ok=True)
for role,(a,b)in RANGES.items():
 off=p.rva_offset(a-p.image_base);raw=data[off:off+b-a];ins=list(md.disasm(raw,a));assert sum(i.size for i in ins)==len(raw);assembly=''.join(f'{i.address:#x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins);file=out/(role+'.asm')
 if args.write:file.write_text(assembly)
 else:assert file.read_text()==assembly
 ranges.append(dict(role=role,start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw).hexdigest(),assembly=file.name))
query=ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0/14592f370/rea-fast/003-procedure_pseudo_code.json'
if query.exists():
 z=json.loads(query.read_text())['response']['result']['structuredContent'];ghidra=dict(procedure='0x14592f370',evidence_id=z['evidence_id'],subject_sha256=z['subject']['digest']['sha256'],analysis_profile_digest=z['analysis_profile']['digest'],normalized_result_sha256=hashlib.sha256(z['normalized_result'].encode()).hexdigest())
else:ghidra=json.loads((out/'density-manifest.json').read_text())['ghidra']
manifest=dict(target_sha256=SHA,ghidra=ghidra,ranges=ranges,canonical_guardian_speed_apply='../guardian-signatures/selection-constructor.asm',checks=dict(budget=len(budgets),topup=len(topups),formations=len(formations),speed=len(speeds)),seams=sorted(seams),limits=['Only the retained spawn/modifier arithmetic intervals execute with synthetic actor headers and caller registers.','ceilf is the explicit host seam for density top-up cap. Complete spawning/random selection, terrain, schedules and application execution are outside these probes.','Guardian conversion/final multiply reuse the canonical signature-constructor intervals; no duplicate extraction is retained.'])
for name,value in [('density-manifest.json',manifest),('density-vectors.json',dict(budgets=budgets,topups=topups,formations=formations,speeds=speeds))]:
 text=json.dumps(value,separators=(',',':'))+'\n';file=out/name
 if args.write:file.write_text(text)
 else:assert file.read_text()==text,name
print('Current density/speed readers: '+', '.join(f'{v} {k}'for k,v in manifest['checks'].items())+'; no build/game')
