#!/usr/bin/env python3
"""Recover/check native attached-kit scale admission without compilation."""
from portable_paths import objdump_output
from native_recovery import f32 as _shared_f32, bits as _shared_bits, digest as _shared_digest
import argparse,hashlib,importlib.util,json,math,struct,subprocess,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];sys.path.insert(0,str(ROOT/'scripts'))
from coverage_common import latest_target
SHA='8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK=ROOT/'runtime/analysis/history/findings/fixgap32-33/9040a2da4887';OUT=ROOT/'docs/analysis/evidence/attached-spell-scales'
SPANS={
 'self-player-type-id':(0x140515ffa,0x14051601b),
 'self-player-type-name':(0x140516108,0x140516121),
 'filter-type-id':(0x140c8f30f,0x140c8f323),
 'query-init':(0x1414165b0,0x1414167f5),
 'positive-component-match':(0x141415dd0,0x141415df9),
 'system-query-construct':(0x1405bef4c,0x1405bef5b),
 'system-query-copy':(0x1405befc6,0x1405befdf),
 'system-query-publish':(0x1405bf079,0x1405bf08e),
 'system-query-argument':(0x1405bf807,0x1405bf816),
 'system-query-call':(0x1405bfb95,0x1405bfc19),
 'level-up-effect-key':(0x140e0f3fa,0x140e0f40d),
 'level-up-hold-class':(0x140e0f5a9,0x140e0f621),
 'meeting-stone-hold-class':(0x140df10d8,0x140df10ec),
 'class-message-read':(0x1405a0d51,0x1405a0d68),
 'class-instance-write':(0x1405a0c72,0x1405a0c8f),
 'scale-command-queue':(0x1407e0cc0,0x1407e0d46),
 'scale-command-multiply':(0x140b5b0dc,0x140b5b0f6),
}
def sha(v):
    return _shared_digest(v)
def dump(v):return json.dumps(v,indent=2,allow_nan=False)+'\n'
def bits(v):
    return _shared_bits(v)
def f32(v):
    return _shared_f32(v)
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--check',action='store_true');args=ap.parse_args()
 target=latest_target(verify=True);assert target['sha256']==SHA;data=(ROOT/target['path']).read_bytes()
 s=importlib.util.spec_from_file_location('pe',ROOT/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m);pe=m.PE(data)
 def raw(a,n):off=pe.rva_offset(a-pe.image_base);return data[off:off+n]
 OUT.mkdir(parents=True,exist_ok=True)
 def emit(name,text):
  (WORK/name).write_text(text)
  if args.check:assert(OUT/name).read_text()==text,name
  else:(OUT/name).write_text(text)
 records=[];old=json.loads((OUT/'manifest.json').read_text())if args.check else None
 for role,(a,b)in SPANS.items():
  asm=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',target['path']],cwd=ROOT,text=True);emit(role+'.asm',asm)
  row=dict(role=role,start=hex(a),end_exclusive=hex(b),sha256=sha(raw(a,b-a)),assembly=role+'.asm',assembly_sha256=sha(asm.encode()))
  if role=='query-init':
   if args.check:
    prior=next(r for r in old['spans']if r['role']==role);assert sha((OUT/prior['pseudocode']).read_bytes())==prior['pseudocode_sha256'];row.update({k:prior[k]for k in ['pseudocode','pseudocode_sha256','evidence_id']})
   else:
    ev=json.loads((WORK/'rea-scale-query/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent'];assert ev['subject']['digest']['sha256']==row['sha256'];text='\n'.join(l.rstrip()for l in ev['normalized_result'].splitlines()).strip()+'\n';emit(role+'.ghidra.c',text);row.update(pseudocode=role+'.ghidra.c',pseudocode_sha256=sha(text.encode()),evidence_id=ev['evidence_id'])
  records.append(row)
 # This unique context owner binds the final system argument to kit context[11].
 context_a,context_b=0x14059fa40,0x1405a03a4
 if args.check:context=old['context'];assert sha((OUT/context['pseudocode']).read_bytes())==context['pseudocode_sha256']
 else:
  ev=json.loads((WORK/'rea-kit-context/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent'];assert ev['subject']['digest']['sha256']==sha(raw(context_a,context_b-context_a));text='\n'.join(l.rstrip()for l in ev['normalized_result'].splitlines()).strip()+'\n';emit('kit-context.ghidra.c',text);context=dict(pseudocode='kit-context.ghidra.c',pseudocode_sha256=sha(text.encode()),evidence_id=ev['evidence_id'])
 context.update(start=hex(context_a),end_exclusive=hex(context_b),sha256=sha(raw(context_a,context_b-context_a)))
 assert raw(0x145e4eba8,28)==b'benilla_app::net::SelfPlayer'
 assert raw(0x145f853dc,23)==b'HARDCODED Unit Level Up'
 canonical=ROOT/'docs/analysis/evidence/spell-presentation/manifest.json';cm=json.loads(canonical.read_text());assert cm['target_sha256']==SHA
 for role in ['kit-scale','scale-lookup']:
  r=next(r for r in cm['owners']if r['role']==role);assert sha(raw(int(r['start'],16),int(r['end_exclusive'],16)-int(r['start'],16)))==r['sha256']
 sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
 from unicorn import x86_const as x
 u=Uc(UC_ARCH_X86,UC_MODE_64);u.mem_map(pe.image_base,(max(s['rva']+max(s['raw_size'],s['virtual_size'])for s in pe.sections)+4095)&~4095)
 for s in pe.sections:u.mem_write(pe.image_base+s['rva'],data[s['raw_offset']:s['raw_offset']+s['raw_size']])
 BASE,STACK=0x200000000,0x300000000;u.mem_map(BASE,0x20000);u.mem_map(STACK,0x20000);BP=STACK+0x10000;SENT=STACK+0x1f000;active=[];stops=set()
 def put(a,fmt,*v):u.mem_write(a,struct.pack(fmt,*v))
 def hook(_,a,n,z):
  if a in stops:u.emu_stop()
  elif not any(lo<=a<hi for lo,hi in active):raise AssertionError('Unreviewed native instruction '+hex(a))
 u.hook_add(UC_HOOK_CODE,hook)
 def run(a,b,extra_stops=()):
  nonlocal active,stops
  active=[(a,b)];stops={b,*extra_stops};u.reg_write(x.UC_X86_REG_MXCSR,0x1f80);u.emu_start(a,0,count=2000);pc=u.reg_read(x.UC_X86_REG_RIP);assert pc in stops;return pc
 query,arch,components,inst,ctx,wrapper,metadata,entities,mask,owner,node,poison,transform=[BASE+i*0x1000 for i in range(13)]
 membership=[]
 for present in [False,True]:
  put(query+0x110,'<Q',1);put(arch+0x80,'<QQ',components,2);put(components,'<QQ',0,int(present));u.reg_write(x.UC_X86_REG_RCX,query);u.reg_write(x.UC_X86_REG_RDX,arch)
  pc=run(0x141415dd0,0x141415df9,[0x1414160d9]);assert(pc==0x141415df9)==present;membership.append(dict(component_present=present,admitted=pc==0x141415df9))
 gates=[]
 for cls in [0,1]:
  for live in [False,True]:
   for generation in [6,7]:
    for member in [False,True]:
     for mode in [False,True]:
      put(inst+0x28,'<I',10);put(inst+0x33,'<B',cls);put(ctx+0x58,'<Q',wrapper);put(wrapper,'<QQ',query,metadata);put(metadata+8,'<QQ',entities,1);put(entities,'<IQ',int(live),1<<32);put(entities+0x10,'<I',generation);put(query+0x28,'<Q',mask);put(query+0x38,'<Q',2);put(mask,'<Q',2 if member else 0);put(owner,'<Q',(7<<32)|0xffffffff);put(BP+0xa0,'<B',int(mode))
      for reg,value in [(x.UC_X86_REG_RSI,inst),(x.UC_X86_REG_RDI,ctx),(x.UC_X86_REG_R13,owner),(x.UC_X86_REG_RBP,BP)]:u.reg_write(reg,value)
      pc=run(0x1408d9563,0x1408d95d9,[0x1408d95fa]);admitted=cls==0 and live and generation==7 and member
      assert(pc==0x1408d95d9)==admitted
      if admitted:assert u.reg_read(x.UC_X86_REG_RCX)==10 and u.reg_read(x.UC_X86_REG_RDX)==int(mode)
      gates.append(dict(effect_class=cls,live=live,generation=generation,member=member,mode=mode,lookup_called=admitted))
 lookups=[]
 for attached in [False,True]:
  for mode in [False,True]:
   for scale in [0.,-1.,float('nan'),.5,2.]:
    for spell in [10,11]:
     put(0x147fbccb8,'<I',0);put(0x147fbcc68,'<B',0);put(0x1480049e0,'<Q',poison);put(poison,'<Q',0);put(0x147fbcca0,'<QQ',node,0);put(node+0x60,'<I',10);put(node+0x8e,'<H',1);put(node+8,'<fB',scale,int(attached));put(BP,'<Q',SENT)
     for reg,value in [(x.UC_X86_REG_RCX,spell),(x.UC_X86_REG_RDX,int(mode)),(x.UC_X86_REG_RSP,BP)]:u.reg_write(reg,value)
     run(0x1407e00a0,0x1407e025c,[SENT]);admitted=spell==10 and(mode or attached)and scale>0.
     assert bool(u.reg_read(x.UC_X86_REG_RAX)&1)==admitted
     if admitted:assert u.reg_read(x.UC_X86_REG_XMM0)&0xffffffff==bits(scale)
     lookups.append(dict(attached=attached,mode=mode,spell=spell,scale_bits=bits(scale),admitted=admitted))
 multiplication=[]
 for scale in [.5,1.,2.,3.]:
  before=bytes(range(28))+struct.pack('<3f',2.,3.,4.);u.mem_write(transform,before);u.reg_write(x.UC_X86_REG_RBX,transform);u.reg_write(x.UC_X86_REG_XMM6,bits(scale));run(0x140b5b0dc,0x140b5b0f6);after=bytes(u.mem_read(transform,40));assert after[:28]==before[:28];actual=list(struct.unpack('<3f',after[28:]));assert actual==[f32(v*scale)for v in [2.,3.,4.]];multiplication.append(dict(scale=scale,result=actual))
 source=(ROOT/'crates/benilla-app/src/entities/spell_fx/mod.rs').read_text();compact=''.join(source.split())
 for token in ['Has<crate::net::SelfPlayer>','scales: Option<Res<crate::local_client::LocalSpellScales>>','if self_player && inst.class == FxClass::Hold','rows.get(inst.spell_id, ground_anchor)','root_transform.scale *= scale','commands.entity(root).insert(root_transform)']:
  assert ''.join(token.split())in compact,token
 emit('native.json',dump(dict(target_sha256=SHA,positive_membership=membership,kit_admission=gates,lookup=lookups,root_scale=multiplication)))
 emit('manifest.json',dump(dict(target_sha256=SHA,target_process_launched=False,spans=records,context=context,canonical_kit_lookup='docs/analysis/evidence/0.105.0/spell-presentation/manifest.json',constants=[dict(role='self-player-type-id',address='0x145e4bed0',bytes=raw(0x145e4bed0,16).hex()),dict(role='self-player-name',address='0x145e4eba8',bytes=raw(0x145e4eba8,28).hex()),dict(role='level-up-effect-key',address='0x145f853dc',bytes=raw(0x145f853dc,23).hex())],limits=['Kit gate runs through original lookup call boundary with synthetic generation/archetype membership. Full query scheduling/attachment resolution is statically traced, not emulated.','Lookup uses a synthetic one-key native BTree node; lock-poison state is clear and no concurrent synchronization is exercised.','Transform multiplication is original native arithmetic. Model loading, Bevy execution, compilation and rendered parity remain unverified.'])))
 print(f'PASS:{len(membership)} positive membership,{len(gates)} kit gate,{len(lookups)} lookup,{len(multiplication)} root multiplication cases; current class/query/source traces; no compilation.')
if __name__=='__main__':main()
