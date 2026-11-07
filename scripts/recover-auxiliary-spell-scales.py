#!/usr/bin/env python3
"""Check current timed26 visual records and scale publication without compilation.

The original selected PE runs only bounded instructions in Unicorn. Vector
allocation and host log1p are explicit seams. No application is launched.
"""
from portable_paths import objdump_output
from native_recovery import f32 as _shared_f32, bits as _shared_bits
import argparse,hashlib,importlib.util,json,math,struct,subprocess,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'scripts'))
from coverage_common import latest_target
SHA='8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK=ROOT/'runtime/analysis/history/findings/fixgap32-33/9040a2da4887'
OUT=ROOT/'docs/analysis/evidence/auxiliary-spell-scales'
SPANS={'timed26-collector':(0x14599e640,0x14599e793),
 'refresh-neutral-instance':(0x14592853b,0x1459285c1),
 'refresh-publish-instance':(0x145928460,0x1459284cf),
 'refresh-auxiliary-modifiers':(0x1459286e8,0x145928751),
 'timed-instance-consumer':(0x145903bc6,0x145903e65)}
def dump(value):return json.dumps(value,indent=2,allow_nan=False)+'\n'
def f32(value):
    return _shared_f32(value)
def bits(value):
    return _shared_bits(value)
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--check',action='store_true');args=ap.parse_args()
 target=latest_target(verify=True);assert target['sha256']==SHA
 data=(ROOT/target['path']).read_bytes()
 s=importlib.util.spec_from_file_location('pe',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m);pe=m.PE(data)
 def raw(a,n):off=pe.rva_offset(a-pe.image_base);return data[off:off+n]
 WORK.mkdir(parents=True,exist_ok=True);OUT.mkdir(parents=True,exist_ok=True)
 def emit(name,value):
  (WORK/name).write_text(value)
  if args.check:assert (OUT/name).read_text()==value,name
  else:(OUT/name).write_text(value)
 spans=[]
 for role,(a,b) in SPANS.items():
  asm=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',target['path']],cwd=ROOT,text=True)
  emit(role+'.asm',asm);spans.append(dict(role=role,start=hex(a),end_exclusive=hex(b),sha256=hashlib.sha256(raw(a,b-a)).hexdigest(),assembly=role+'.asm',assembly_sha256=hashlib.sha256(asm.encode()).hexdigest()))
 if args.check:ghidra=json.loads((OUT/'manifest.json').read_text())['refresh_analysis']
 else:
  ev=json.loads((WORK/'rea-aux-refresh/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent'];text='\n'.join(line.rstrip() for line in ev['normalized_result'].splitlines()).strip()+'\n';emit('refresh.ghidra.c',text)
  ghidra=dict(start='0x145927dc0',end_exclusive='0x145928908',sha256=hashlib.sha256(raw(0x145927dc0,0xb48)).hexdigest(),pseudocode='refresh.ghidra.c',pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest(),evidence_id=ev['evidence_id'])
 assert hashlib.sha256((OUT/ghidra['pseudocode']).read_bytes()).hexdigest()==ghidra['pseudocode_sha256']
 assert hashlib.sha256(raw(int(ghidra['start'],16),int(ghidra['end_exclusive'],16)-int(ghidra['start'],16))).hexdigest()==ghidra['sha256']
 sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
 from unicorn import x86_const as x
 u=Uc(UC_ARCH_X86,UC_MODE_64);extent=max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in pe.sections);u.mem_map(pe.image_base,(extent+4095)&~4095)
 for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
 BASE,STACK=0x200000000,0x300000000;u.mem_map(BASE,0x30000);u.mem_map(STACK,0x20000)
 GAME,DEFS,LEARNED,RACIAL,AUX,ALLOC,OUTPUT=BASE,BASE+0x2000,BASE+0x5000,BASE+0x7000,BASE+0x9000,BASE+0x10000,BASE+0x18000
 SENTINEL=STACK+0x1f000
 def put(a,fmt,*v):u.mem_write(a,struct.pack(fmt,*v))
 def q(a):return struct.unpack('<Q',u.mem_read(a,8))[0]
 def ret():sp=u.reg_read(x.UC_X86_REG_RSP);u.reg_write(x.UC_X86_REG_RIP,q(sp));u.reg_write(x.UC_X86_REG_RSP,sp+8)
 spans_allowed=[(0x145924e50,0x145925103),(0x1459614e0,0x1459615f3)]
 def hook(_,a,n,unused):
  if a==SENTINEL:u.emu_stop()
  elif any(lo<=a<hi for lo,hi in spans_allowed):return
  elif a==0x145bfafd0:put(u.reg_read(x.UC_X86_REG_RCX),'<QQ',256,ALLOC);ret()
  elif a==0x145bc98dd:
   arg=u.reg_read(x.UC_X86_REG_XMM0)&0xffffffff;v=struct.unpack('<f',struct.pack('<I',arg))[0];u.reg_write(x.UC_X86_REG_XMM0,bits(math.log1p(v)));ret()
  else:raise AssertionError('Unreviewed native instruction '+hex(a))
 u.hook_add(UC_HOOK_CODE,hook)
 # [spell,kind,range,radius,instance-area,talent-area].
 row=lambda spell,kind=3,area=1.,talent=1.,radius=8.,reach=10.:[spell,kind,reach,radius,area,talent]
 profiles=[([],None,[row(10,area=2.,talent=3.)]),
  ([row(10,area=2.)],None,[row(10,area=7.)]),
  ([],row(10,area=3.),[row(10,area=7.)]),
  ([],None,[row(0),row(10),row(10,area=7.)]),
  ([],None,[row(120,kind=8,area=2.,talent=3.),row(779,radius=5.)]),
  ([],None,[row(10,area=20.)])]
 vectors=[];bases={10:8.,120:10.,779:5.}
 for learned,racial,aux in profiles:
  for global_area in [.5,1.,2.]:
   u.mem_write(BASE,bytes(0x30000));put(GAME+0x4a0,'<f',global_area)
   put(GAME+0x318,'<QQ',LEARNED,len(learned));put(GAME+0xb8,'<QQ',AUX,len(aux))
   put(GAME+0x3f8,'<Q',DEFS+0x1800)
   counter=0
   for rows,destination,stride in [(learned,LEARNED,104),([racial]if racial else [],GAME+0x3f8,104),(aux,AUX,112)]:
    for index,r in enumerate(rows):
     spell,kind,reach,radius,area,talent=r;definition=DEFS+counter*120;counter+=1;record=destination+index*stride
     put(definition+0x40,'<I',spell);put(definition+0x4c,'<ff',reach,radius);put(definition+0x75,'<B',kind)
     put(record,'<Q',definition);put(record+0x34,'<f',area);put(record+0x50,'<f',talent)
   u.reg_write(x.UC_X86_REG_RCX,OUTPUT);u.reg_write(x.UC_X86_REG_RDX,GAME);u.reg_write(x.UC_X86_REG_RSP,STACK+0x10000);put(STACK+0x10000,'<Q',SENTINEL)
   u.emu_start(0x145924e50,0,count=10000);assert u.reg_read(x.UC_X86_REG_RIP)==SENTINEL
   ptr=q(OUTPUT+8);actual=[list(struct.unpack('<IIB',u.mem_read(ptr+i*12,9)))for i in range(q(OUTPUT+16))]
   expected=[]
   for spell,kind,reach,radius,area,talent in learned+([racial]if racial else [])+aux:
    if spell not in bases or any(v[0]==spell for v in expected):continue
    value=f32(f32(f32(area*talent)*(reach if kind==8 else radius))*global_area)
    if value>70.:value=f32(f32(f32(math.log1p(f32(f32(value-70.)/10.)))*10.)+70.)
    expected.append([spell,bits(f32(value/bases[spell])),int(kind==8)])
   assert actual==expected,(actual,expected)
   vectors.append(dict(learned=learned,racial=racial,auxiliary=aux,global_area=global_area,output=actual))
 for name,tokens in {'crates/azeroth-survivors-re/src/gameplay/mechanics.rs':['self.effect_state.timed.iter()','RuntimeInstance::learned(definition)','self.effect_state.equipped.spell_modifiers(definition).apply(&mut instance)','self.abilities.iter().chain(self.racial.iter()).chain(auxiliary.iter())']}.items():
  source=''.join((ROOT/name).read_text().split())
  for token in tokens:assert ''.join(token.split())in source,(name,token)
 emit('native.json',dump(dict(target_sha256=SHA,cases=vectors,seams=['Successful vector allocation','Host log1p after native f32 argument; no Windows CRT equivalence'])))
 emit('manifest.json',dump(dict(target_sha256=SHA,target_process_launched=False,spans=spans,refresh_analysis=ghidra,canonical_table_manifest='docs/analysis/evidence/0.105.0/spell-presentation/manifest.json',limits=['Bounded table replay covers auxiliary order/stride/area and first recognized ID wins, not complete Game refresh execution.','Attached-kit membership/mode are owned by the separate attached-spell-scales manifest; builds and rendered parity remain open.'])))
 print(f'PASS: {len(vectors)} selected-target auxiliary table cases; native producer/modifier/source traces; no compilation or game execution.')
if __name__=='__main__':main()
