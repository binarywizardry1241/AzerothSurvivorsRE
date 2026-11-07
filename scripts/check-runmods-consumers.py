#!/usr/bin/env python3
"""Replay current modifier copy, independent difficulty initialization, stat refresh and loot factor."""
from script_sources import load_script
import sys, struct, math, argparse, hashlib, json
from pathlib import Path
ROOT=Path.cwd();sys.path[:0]=['scripts','runtime/tool-state/python/camera/python-libs','runtime/tool-state/python/armory/python-libs']
from coverage_common import latest_target,target_bytes
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
target=latest_target(verify=False);assert target['sha256']==SHA
OUT=ROOT/'docs/analysis/evidence/runmods-consumers'
RANGES={'entry-modifier-copy':(0x14592dc47,0x14592dc59),'independent-difficulty':(0x14592e5d2,0x14592e6a3),'stat-refresh':(0x145926c90,0x145927d2b),'gear-factor-call':(0x145973090,0x1459730a7)}
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_WRITE
from unicorn import x86_const as R
m = load_script('pe', ROOT/'scripts/inventory-executable.py');d=target_bytes(latest_target(verify=False));p=m.PE(d)
u=Uc(UC_ARCH_X86,UC_MODE_64);end=max(x['rva']+max(x['virtual_size'],x['raw_size'])for x in p.sections);u.mem_map(p.image_base,(end+4095)&~4095)
for x in p.sections:u.mem_write(p.image_base+x['rva'],d[x['raw_offset']:x['raw_offset']+x['raw_size']])
heap=0x200000000;stack=0x300000000
u.mem_map(heap,0x100000);u.mem_map(stack,0x200000)
frame=stack+0x100000;game=frame+0x30;entry=heap;out=heap+0x1000;stop=0;calls=set();writes=[]
def reg(n,v=None):
 a=getattr(R,'UC_X86_REG_'+n)
 if v is not None:u.reg_write(a,v)
 return u.reg_read(a)
def put(a,f,*v):u.mem_write(a,struct.pack('<'+f,*v))
def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
def hook(_,a,n,__):
 if a==stop:u.emu_stop();return
 if 0x14592d7e0<=a<0x14592ed19 or 0x145926c90<=a<0x145927d2b or 0x145973090<=a<0x1459730a7 or 0x14590e4a0<=a<0x14590e508:return
 calls.add(hex(a));cx,dx,r8=[reg(x)for x in ['RCX','RDX','R8']]
 if a==0x145bfa0e7:u.mem_write(cx,bytes(u.mem_read(dx,r8)));reg('RAX',cx)
 elif a==0x145bfa141:
  val=struct.unpack('<f',struct.pack('<I',reg('XMM0')&0xffffffff))[0];reg('XMM0',int.from_bytes(struct.pack('<f',math.ceil(val)),'little'))
 elif a==0x1458c54c0:u.mem_write(cx,bytes(32));reg('RAX',cx)
 elif a==0x1458d9620:u.mem_write(cx,bytes(32));reg('RAX',cx)
 elif a==0x1400021d0:pass
 else:raise RuntimeError(('unknown',hex(a),hex(q(reg('RSP')))))
 sp=reg('RSP');reg('RIP',q(sp));reg('RSP',sp+8)
def write(_,access,a,n,v,__):
 if game+0xaa8<a+n and a<game+0xaac:writes.append([hex(reg('RIP')),hex(a-game),n,hex(v)])
u.hook_add(UC_HOOK_CODE,hook);u.hook_add(UC_HOOK_MEM_WRITE,write)
def run(a,b):
 global stop
 stop=b;u.emu_start(a,0,count=100000);assert reg('RIP')==b,hex(reg('RIP'))
rows=[]
for clas in range(2,12):
 for race in range(2,9):
  for mods in [[100]*4,[500,100,100,100],[100,500,100,100],[100,100,300,100],[100,100,100,150],[500,500,300,150]]:
   u.mem_write(heap,bytes(0x20000));u.mem_write(frame-0x8000,bytes(0x10000));writes.clear()
   put(entry+0x118,'4H',*mods);put(entry+0x16c,'BB',clas,race)
   reg('RBP',frame);reg('RSP',frame-0x1000);reg('RDX',entry);reg('XMM8',0);reg('MXCSR',0x1f80);reg('EFLAGS',2)
   run(0x14592dc47,0x14592dc59)
   assert list(struct.unpack('<4H',u.mem_read(game+0x2b0,8)))==mods
   run(0x14592e5d2,0x14592e6a3)
   put(frame+0xc38,'Q',out);put(game+0x618,'3Q',64,heap+0x10000,0)
   reg('RSP',frame-0x1000);run(0x14592eb51,0x14592eb84)
   assert bytes(u.mem_read(out+0xaa8,4))==struct.pack('<f',1.)
   assert list(struct.unpack('<4H',u.mem_read(out+0x2b0,8)))==mods
   assert writes==[['0x14592e624','0xaa8',4,'0x3f800000']],writes
   rows.append(dict(class_byte=clas,race_byte=race,modifiers=mods,difficulty_bits='3f800000',difficulty_stores=writes.copy()))

gear=[]
for row in json.loads((ROOT/'docs/analysis/evidence/runmods/native-vectors.json').read_text())['formulas']:
 put(game+0x2b0,'4H',*row['values']);reg('RDI',game);reg('RBP',frame);reg('RSP',frame-0x1000);run(0x145973090,0x1459730a7)
 actual=f'{reg('XMM7')&0xffffffff:08x}';assert actual==row['reward_bits'];gear.append(dict(modifiers=row['values'],reward_bits=actual))
records=[];md=Cs(CS_ARCH_X86,CS_MODE_64)
ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
if args.write:OUT.mkdir(parents=True,exist_ok=True)
for role,(a,b)in RANGES.items():
 off=p.rva_offset(a-p.image_base);raw=d[off:off+b-a];instructions=list(md.disasm(raw,a));assert sum(i.size for i in instructions)==len(raw)
 assembly=''.join(f'{i.address:#x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in instructions)
 file=OUT/(role+'.asm')
 if args.write:file.write_text(assembly)
 else:assert file.read_text()==assembly
 records.append(dict(role=role,start=hex(a),end_exclusive=hex(b),byte_count=b-a,sha256=hashlib.sha256(raw).hexdigest(),assembly=file.name,assembly_sha256=hashlib.sha256(assembly.encode()).hexdigest()))
queries=[]
for address in ['14592d7e0','145926c90']:
 file=ROOT/'runtime/analysis/history/interface/menu-lifecycle/969b671942c0'/address/'rea-fast/003-procedure_pseudo_code.json'
 if file.exists():
  z=json.loads(file.read_text())['response']['result']['structuredContent'];queries.append(dict(procedure='0x'+address,evidence_id=z['evidence_id'],subject_sha256=z['subject']['digest']['sha256'],analysis_profile_digest=z['analysis_profile']['digest'],normalized_result_sha256=hashlib.sha256(z['normalized_result'].encode()).hexdigest()))
if not queries:queries=json.loads((OUT/'manifest.json').read_text())['ghidra']
source=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text();rule=source.split('let rules = RunRules {',1)[1].split('};',1)[0];assert 'difficulty: 1.0' in rule and 'run_mods::difficulty'not in rule
for index,field in enumerate(['density_percent','hp_percent','damage_percent','speed_percent']):assert f'{field}: mods[{index}]'in rule
manifest=dict(target=dict(version='0.109.0',sha256=SHA),ranges=records,ghidra=queries,canonical_factory='../run-seed/manifest.json#run-factory',canonical_constructor='../run-seed/manifest.json#game-constructor',canonical_final_copy='../run-seed/game-constructor.asm',canonical_reward='../runmods/reward.asm',canonical_xp='../run-account/manifest.json',seams=sorted(calls),checks=dict(constructor_paths=len(rows),gear_factors=len(gear)),limits=['Constructor entry-header copy and independent-field initialization execute as three original instruction intervals around declared scratch state. The entire actual stat-refresh body executes between initialization and final Game copy. This does not execute the complete new-game factory/constructor.','Property-tree insertion and event formatting use explicit output-only seams; native ceilf uses host math.ceil and memory copy uses scratch buffers. No substituted helper receives Game+aa8.','420 paths watch writes to the independent difficulty field and retain all four modifier words; this does not certify every stat-refresh output.','625 gear-factor calls execute the real current caller plus unchanged capped reward helper; generic loot candidate/RNG/admission is outside these calls.','No compiler, Rust execution, original or reconstructed game, live filesystem, packets, graphics or gameplay parity.'])
vectors=dict(constructor_paths=rows,gear_factors=gear)
for filename,value in [('manifest.json',manifest),('native-vectors.json',vectors)]:
 text=json.dumps(value,indent=2)+'\n';file=OUT/filename
 if args.write:file.write_text(text)
 else:assert file.read_text()==text,filename
print(f'Current modifier consumers: {len(rows)} constructor paths; {len(gear)} gear factor calls; no build/game')
