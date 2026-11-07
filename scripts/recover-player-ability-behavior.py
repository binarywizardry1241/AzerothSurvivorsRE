#!/usr/bin/env python3
"""SHA-bound 0.97.2 behavior code slices/plans; static recovery only."""
from portable_paths import objdump_output, portable_json
from pathlib import Path
import argparse,hashlib,importlib.util,json,struct,subprocess
R=Path(__file__).resolve().parent.parent
SHA='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
TARGET=R/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
FUNCTIONS=[0x14549d550,0x1454e7a20,0x1454ee0d0,0x1454ee2a0,0x1454ed630,0x1454ef3b0,
           0x14552b8f0,0x14552bae0,0x1454f4d00,0x141929100,0x1455149f0,
           0x145530e40,0x14552c020,0x14552d410,0x145532630,0x145537560,
           0x145512e00,0x14540cb60,0x1454f1030,0x145546730,0x141928eb0,0x1454f4dd0,0x1421b8170,0x14540d430]
CASES=[0x1454e7cf6,0x1454e7ea6,0x1454e82bb,0x1454e86dd,0x1454e8880,
       0x1454e8a6b,0x1454e8bac,0x1454e9105,0x1454e9201]

def check_contract(evidence):
 """Current shield lifetime/admission arithmetic in unchanged scratch-only code."""
 import sys,itertools
 sys.path.insert(0,str(R/'runtime/tool-state/python/armory/python-libs'))
 from native_terminal import verified_input,NativeReplay
 from native_recovery import f32,bits
 manifest,target,data,pe=verified_input(evidence);vm=NativeReplay(data,pe);r=vm.registers
 for query in manifest.get('rea_queries',[]):
  for name in ['raw_input','plan','journal','result']:
   path=(R/query[name]['path']).resolve();assert path.is_relative_to(R)
   assert hashlib.sha256(path.read_bytes()).hexdigest()==query[name]['sha256'],name
  native=json.loads((R/query['result']['path']).read_text())['structuredContent']
  assert native['provider']['id']=='ghidra'and native['evidence_id']==query['evidence_id']
  assert native['subject']['digest']['sha256']==query['raw_input']['sha256']
  start=int(query['slice_virtual_address'],16);offset=pe.rva_offset(start-pe.image_base)
  raw=(R/query['raw_input']['path']).read_bytes();assert data[offset:offset+len(raw)]==raw
  excerpt=query['curated_excerpt'];assert hashlib.sha256((evidence/excerpt['path']).read_bytes()).hexdigest()==excerpt['sha256']
 selected={row['role']:(int(row['start'],16),int(row['end_exclusive'],16))for row in manifest['ranges']}
 def reg(name,value):vm.machine.reg_write(getattr(r,'UC_X86_REG_'+name),value)
 def scalar(name,value):vm.scalar(getattr(r,'UC_X86_REG_'+name),value)
 def number(name):return vm.machine.reg_read(getattr(r,'UC_X86_REG_'+name))&0xffffffff
 def minimum(a,b):return a if a<b else b
 def maximum(a,b):return a if a>b else b
 def setup(role):
  start,end=selected[role];vm.reset(role,[(start,end)],[end])
  definition=vm.mem+0x4000;instance=vm.mem+0x5000
  vm.put(definition,'<QQ',0x14707f0e0,13)
  vm.put(definition+0x58,'<f',4.)
  vm.put(definition+0x48,'<f',32.)
  vm.put(definition+0x68,'<I',12)
  return definition,instance,start,end
 # The actual constructor copies this packed constant into Game+53c/+540.
 definition,instance,start,end=setup('constructor-timestamp')
 vm.run(start);assert vm.get(vm.bp+0x550,'<I')[0]==0xff800000
 digest=hashlib.sha256();cases=0;steps=vm.instructions
 for duration,talent_duration,cooldown,global_cooldown in itertools.product(
     [0.,.01,1.,2.,100.,float('nan')],[1.,2.],[0.,.1,1.],[0.,.01,1.]):
  raw_duration=f32(f32(f32(4.*f32(1.4))*f32(duration))*f32(talent_duration))
  capped=minimum(raw_duration,6.)
  raw_interval=f32(f32(f32(f32(32.*f32(1.4))*f32(cooldown))*1.)*f32(global_cooldown))
  interval=maximum(raw_interval,f32(10.-capped))
  expected_total=f32(interval+maximum(capped,f32(.1)))
  for role in ['duration','cooldown','tooltip-duration','tooltip-total']:
   definition,instance,start,end=setup(role)
   vm.put(instance+0x20,'<f',duration);vm.put(instance+0x48,'<f',talent_duration)
   vm.put(instance+0x14,'<f',cooldown);vm.put(instance+0x3c,'<f',1.)
   vm.put(vm.app+0x4d0,'<f',global_cooldown)
   if role=='duration':reg('RSI',definition);reg('R12',instance);output='XMM6';expected=maximum(capped,f32(.1))
   elif role=='tooltip-duration':reg('R13',definition);reg('RDI',instance);output='XMM1';expected=capped
   elif role=='cooldown':
    reg('RAX',definition);reg('RCX',instance);reg('RDX',13);reg('RSI',vm.app)
    scalar('XMM9',1.4);scalar('XMM10',.1);output='XMM0';expected=expected_total
   else:
    context=vm.mem+0x6000;vm.put(context+8,'<f',global_cooldown)
    for offset,value in [(0x2f8,definition),(0x300,instance),(0x310,context)]:vm.put(vm.bp+offset,'<Q',value)
    output='XMM1';expected=f32(interval+capped)
   before=vm.instructions;vm.run(start);steps+=vm.instructions-before
   observed=number(output);assert observed==bits(expected),(role,duration,talent_duration,cooldown,global_cooldown,hex(observed),hex(bits(expected)))
   digest.update(struct.pack('<I',observed));cases+=1
 # Exact equality at last+10 admits. Rejected health or retrigger attempts do
 # not consume the timestamp; a different immunity keeps its independent gate.
 admissions=0
 for last,now,health,shield in itertools.product([float('-inf'),0.,3.],[0.,3.,9.999,10.,13.],[0.,35.,35.000004,80.,float('nan')],[True,False]):
  definition,instance,start,end=setup('admission')
  if not shield:vm.put(definition+8,'<Q',10)
  vm.put(vm.app+0x538,'<f',health);vm.put(vm.app+0x540,'<f',last)
  reg('RDI',vm.app);reg('RSI',definition);reg('RAX',13 if shield else 10)
  scalar('XMM8',100.);scalar('XMM10',now)
  vm.context['stops']={end,0x145c62237,0x145c63b48}
  before=vm.instructions;pc=vm.run(start);steps+=vm.instructions-before
  rejected=f32(health)>f32(f32(100.)*f32(.35))or(shield and f32(last+10.)>f32(now))
  expected=0x145c62237 if rejected else end if shield else 0x145c63b48
  assert pc==expected,(last,now,health,shield,hex(pc),hex(expected))
  assert vm.get(vm.app+0x540,'<I')[0]==bits(last if rejected or not shield else now)
  digest.update(struct.pack('<QI',pc,vm.get(vm.app+0x540,'<I')[0]));admissions+=1
 sources={name:(R/'crates/azeroth-survivors-re/src'/name).read_text()for name in
          ['player_abilities/damage.rs','player_abilities/behavior/dispatch.rs','gameplay/mechanics.rs',
           'gameplay/coop_spell_text.rs','gameplay/coop_overlay.rs','gameplay/native_overlay_payload.rs',
           'gameplay/mechanics/milestones.rs','player_abilities/behavior/buffs.rs']}
 assert 'if vitals.health > vitals.maximum_health * 0.35 {'in sources['player_abilities/behavior/buffs.rs']
 assert 'if !(vitals.health <= vitals.maximum_health * 0.35)'not in sources['player_abilities/behavior/buffs.rs']
 math=sources['player_abilities/damage.rs']
 assert '"divine_shield" => 10.0 - scaled_duration(instance)'in math
 assert 'super::native_min(duration, 6.0)'in math and '"hellfire" => 0.5'in math
 dispatch=sources['player_abilities/behavior/dispatch.rs']
 branch=dispatch.split('        9 => {',1)[1]
 assert branch.index('state.divine_shield_last_cast_at + 10.0 > context.now')<branch.index('buffs::apply_self_buff_with_party(')<branch.index('state.divine_shield_last_cast_at = context.now')<branch.index('visual(instance, context, CastTarget::None')
 assert 'divine_shield_last_cast_at: f32::NEG_INFINITY'in sources['gameplay/mechanics.rs']
 assert 'dispatch::cast(&instance, context,'in sources['gameplay/mechanics/milestones.rs']
 assert 'damage::base_interval(instance, game.current_cooldown_multiplier())'in sources['gameplay/coop_overlay.rs']
 assert 'damage::scaled_duration(instance)'in sources['gameplay/coop_spell_text.rs']
 assert 'current_duration.unwrap_or_else'in sources['gameplay/native_overlay_payload.rs']
 for name in ['divine_shield_echoes_and_forced_retries_share_one_ten_second_admission','divine_intervention_free_shield_respects_the_existing_run_timestamp','divine_shield_unordered_health_admits_without_bypassing_retrigger_gate']:
  assert 'fn '+name+'()'in sources['gameplay/mechanics.rs']
 return dict(target_sha256=target['sha256'],rea_queries_verified=len(manifest.get('rea_queries',[])),native_scalar_cases=cases,native_admission_cases=admissions,
             constructor_timestamp_bits='0xff800000',original_instruction_steps=steps,
             output_sha256=digest.hexdigest(),connected_source_paths=len(sources),compiled=False,
             target_executed=False,parity=False)

def check_defensive_admission():
 """Replay current immunity exclusion and the Divine Shield expiry gap."""
 import itertools
 from coverage_common import latest_target, target_bytes
 from native_recovery import bits, f32
 from native_terminal import NativeReplay
 from script_sources import load_script
 target = latest_target(verify=True)
 assert (target['version'], target['sha256']) == ('0.140.0',
  '27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9')
 data = target_bytes(target)
 pe = load_script('shield_current_pe', R / 'scripts/inventory-executable.py').PE(data)
 vm = NativeReplay(data, pe)
 def reg(name, value):
  vm.machine.reg_write(getattr(vm.registers, 'UC_X86_REG_' + name), value)
 def scalar(name, value):
  vm.scalar(getattr(vm.registers, 'UC_X86_REG_' + name), value)
 active_cases = 0
 active_range = (0x145f7ea1f, 0x145f7ea7f)
 health_rejected, aura_rejected, next_gate = 0x145f7df41, 0x145f7ff42, 0x145f8056d
 for health, now, rows in itertools.product(
     (0., 35., 35.01, float('nan')), (0., 3., 5.),
     ([], [(12, 3.)], [(11, 5.)], [(12, float('nan'))], [(11, 9.), (12, 5.)])):
  vm.reset('active protection', [active_range], [health_rejected, aura_rejected, next_gate])
  auras = vm.mem + 0x5000
  vm.put(vm.app + 0x4d0, '<QQ', auras, len(rows))
  vm.put(vm.app + 0x5e0, '<f', health)
  for index, (tag, deadline) in enumerate(rows):
   vm.put(auras + index * 32 + 8, '<I', tag)
   vm.put(auras + index * 32 + 24, '<f', deadline)
  reg('RDI', vm.app)
  scalar('XMM7', 100.)
  scalar('XMM10', now)
  expected = health_rejected if health > 35. else aura_rejected if any(
      tag == 12 and deadline > now for tag, deadline in rows) else next_gate
  assert vm.run(active_range[0]) == expected, (health, now, rows)
  active_cases += 1
 gap_cases = 0
 gap_range = (0x145dd4290, 0x145dd4333)
 admission = (0x145f80596, 0x145f805c3)
 for upgrade, item, expires, now in itertools.product(
     (0., .5, 2., float('nan')), (1., 2., 2.5), (float('-inf'), 6., 12.),
     (0., 10., 15.99, 16., 18.)):
  vm.reset('expiry gap', [gap_range, admission], [health_rejected, admission[1]])
  key, definition, instance = (vm.mem + offset for offset in (0x3000, 0x4000, 0x5000))
  vm.put(key, '<13s', b'divine_shield')
  vm.put(definition, '<QQ', key, 13)
  vm.put(definition + 0x58, '<f', 4.)
  vm.put(instance, '<Q', definition)
  vm.put(instance + 0x18, '<f', item)
  vm.put(instance + 0x48, '<f', upgrade)
  vm.put(vm.app + 0x5ec, '<f', expires)
  ordinary = f32(f32(f32(4. * f32(1.4)) * upgrade) * item)
  duration = f32(6. * item) if item > 1. else ordinary if ordinary < 6. else 6.
  rejected = f32(max(f32(10. - duration), 4.)) > f32(f32(now) - expires)
  reg('RDI', vm.app)
  reg('R12', instance)
  scalar('XMM6', max(duration, f32(.1)))
  scalar('XMM10', now)
  assert vm.run(admission[0]) == (health_rejected if rejected else admission[1]), (upgrade, item, expires, now)
  assert vm.get(vm.app + 0x5ec, '<I')[0] == bits(expires if rejected else now + max(duration, f32(.1)))
  gap_cases += 1
 source = R / 'crates/azeroth-survivors-re/src/player_abilities'
 assert 'aura.effect.tag == 11 && aura.expires_at > now' in (source / 'behavior/buffs.rs').read_text()
 assert 'context.now - state.divine_shield_expires_at' in (source / 'behavior/dispatch.rs').read_text()
 assert 'native_max(10.0 - scaled_duration(instance), 4.0)' in (source / 'damage.rs').read_text()
 return dict(target_sha256=target['sha256'], active_immunity_cases=active_cases,
             expiry_gap_cases=gap_cases, original_instruction_steps=vm.instructions,
             compiled=False, target_executed=False, parity=False)


def main():
 parser=argparse.ArgumentParser(description=__doc__)
 parser.add_argument('--collect',action='store_true',help='retain completed Ghidra/native text and exact PE tables')
 parser.add_argument('--check-contract',type=Path,help='Selected shield lifetime evidence manifest')
 parser.add_argument('--write',action='store_true')
 parser.add_argument('--check-defensive-admission',action='store_true')
 args=parser.parse_args()
 if args.check_defensive_admission:
  print(json.dumps(check_defensive_admission(),indent=2))
  return
 if args.check_contract:
  evidence=(R/args.check_contract).resolve();assert evidence.is_relative_to(R)
  proof=check_contract(evidence.parent);text=json.dumps(proof,indent=2)+'\n'
  if args.write:(evidence.parent/'validation.json').write_text(text)
  else:assert(evidence.parent/'validation.json').read_text()==text,'Selected shield proof missing/stale'
  print(text);return
 d=TARGET.read_bytes();assert hashlib.sha256(d).hexdigest()==SHA
 s=importlib.util.spec_from_file_location('inventory',R/'scripts/inventory-executable.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m);p=m.PE(d)
 f={p.image_base+a:p.image_base+b for a,b,_ in p.functions()};folder=R/'runtime/analysis/history/native-recovery/player-abilities/f36879d4a545';folder.mkdir(parents=True,exist_ok=True);rows=[]
 for a in FUNCTIONS:
  end=f[a];at=p.rva_offset(a-p.image_base);raw=d[at:at+end-a];path=folder/f'{a:x}.bin';path.write_bytes(raw)
  rows.append(dict(address=hex(a),end_exclusive=hex(end),file_offset=hex(at),byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest(),path=str(path.relative_to(R)),boundary='Original PE RUNTIME_FUNCTION'))
  plan=dict(target=str(path.relative_to(R)),output=f'runtime/analysis/history/native-recovery/player-abilities/f36879d4a545/rea-{a:x}',open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),timeout=180,open_timeout=90,cleanup_timeout=60,environment={'REA_GHIDRA_STARTUP_TIMEOUT_MS':'180000'},operations=[dict(name='analyze_function',arguments=dict(procedure=hex(a)),timeout=300)])
  (folder/f'plan-{a:x}.json').write_text(portable_json(plan,indent=2)+'\n')
 for a in CASES:
  end=f[0x1454e7a20];at=p.rva_offset(a-p.image_base);path=folder/f'case-{a:x}.bin';path.write_bytes(d[at:at+end-a])
  plan=dict(target=str(path.relative_to(R)),output=f'runtime/analysis/history/native-recovery/player-abilities/f36879d4a545/rea-case-{a:x}',open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),timeout=180,open_timeout=90,cleanup_timeout=60,environment={'REA_GHIDRA_STARTUP_TIMEOUT_MS':'180000'},operations=[dict(name='analyze_function',arguments=dict(procedure=hex(a)),timeout=300)])
  (folder/f'plan-case-{a:x}.json').write_text(portable_json(plan,indent=2)+'\n')
 out=R/'docs/analysis/evidence/player-abilities';out.mkdir(parents=True,exist_ok=True)
 limitations=['Static code recovery only. Raw Ghidra slices omit data and callees; original PE instructions control Win64 argument mapping.',
              'Bounded case imports begin inside the original cast function, not at original function entries. Live count/modifier registers must be bound using its original assembly.',
              'Current host float/CRT and equal-key sorting have not been compared against Windows execution.',
              'No builds, compiler checks, tests, emulation or application launches.']
 (out/'behavior-slices.json').write_text(portable_json(dict(version='0.97.2',artifact_sha256=SHA,target=str(TARGET.relative_to(R)),target_executed=False,functions=rows,limitations=limitations),indent=2)+'\n')
 if args.collect:
  def span(a,n):
   at=p.rva_offset(a-p.image_base);b=d[at:at+n];assert len(b)==n
   return dict(address=hex(a),file_offset=hex(at),size=n,sha256=hashlib.sha256(b).hexdigest(),raw_hex=b.hex())
  analyses=[]
  for a in FUNCTIONS+CASES:
   case=a in CASES;stem=f'case-{a:x}' if case else f'{a:x}';directory=folder/f'rea-{stem}'
   bundle=json.loads((directory/'evidence-bundle.json').read_text())
   record=next(v for v in bundle['records'] if v.get('operation')=='analyze_function')
   code=record['normalized_result']['pseudocode'];assert code
   end=0x1454eb952 if case else f[a]
   original=span(a,end-a);original.pop('raw_hex')
   assert record['subject']['digest']['sha256']==original['sha256']
   assert record['provider']['id']=='ghidra'
   original['end_exclusive']=hex(end)
   original['boundary']='Interior cast basic-block entry through original PE RUNTIME_FUNCTION end' if case else 'Original PE RUNTIME_FUNCTION'
   if not case:
    assembly=objdump_output(['objdump','-d',f'--start-address={a}',f'--stop-address={end}',str(TARGET)],cwd=R,text=True)
    (out/f'behavior-{stem}.asm').write_text(assembly)
   (out/f'behavior-{stem}.ghidra.c').write_text(code)
   analyses.append(dict(name=stem,original=original,rea_evidence_id=record['evidence_id'],provider=record.get('provider'),pseudocode=f'behavior-{stem}.ghidra.c',assembly='behavior-1454e7a20.asm' if case else f'behavior-{stem}.asm'))
  ranges=[]
  for a,end,name in [(0x1454c9b10,0x1454c9c90,'actor-periodic-timing'),(0x1454c9fe0,0x1454ca024,'control-expiry'),(0x1455267d0,f[0x1455267d0],'ground-density-positions')]:
   assembly=objdump_output(['objdump','-d',f'--start-address={a}',f'--stop-address={end}',str(TARGET)],cwd=R,text=True)
   (out/f'behavior-{name}.asm').write_text(assembly);original=span(a,end-a);original.pop('raw_hex');ranges.append(dict(name=name,original=original,owner=hex(a) if a==0x1455267d0 else '0x1454c9510',assembly=f'behavior-{name}.asm'))
  jumps={}
  for a,count in [(0x1469acef4,12),(0x1469ad064,13),(0x1469ad014,10),(0x1469acf4c,10),(0x1469acf9c,10),(0x1469acf74,10),(0x1469acfc4,10),(0x1469acfec,10),(0x1469acf24,10),(0x1469ad03c,10)]:
   native=span(a,count*4);at=p.rva_offset(a-p.image_base);jumps[hex(a)]=dict(original=native,targets=[hex(a+v) for v in struct.unpack_from('<'+'i'*count,d,at)])
  scalars={}
  for a in [0x1458eb480,0x1458eb488,0x1458eb508,0x1458eb514,0x1458ed010,0x1458f6620,0x1458f6624,0x1458f662c,0x1458f6630,0x1458f8d40,0x1458f8de0,0x1458fcdf0,0x14590ae44,0x14590aec8,0x145930f04,0x14593e890,0x14593e894,0x14594f310,0x1459c799c,0x1459c7f74,0x1459eb3c0,0x145a116e4,0x145bfc414,0x14698ebd0]:
   at=p.rva_offset(a-p.image_base);scalars[hex(a)]=dict(original=span(a,4),value=struct.unpack_from('<f',d,at)[0])
  imports=[]
  for a in [0x145756e1f,0x145756e2b,0x145756e31,0x145756e73,0x145756f57]:
   at=p.rva_offset(a-p.image_base);assert d[at:at+2]==b'\xff\x25';iat=a+6+struct.unpack_from('<i',d,at+2)[0]
   for library in p.imports():
    start=int(library['iat_start_address'],16)
    if start<=iat<start+len(library['functions'])*8:imports.append(dict(stub=span(a,6),iat=hex(iat),library=library['library'],name=library['functions'][(iat-start)//8]))
  manifest=dict(version='0.97.2',target=dict(path=str(TARGET.relative_to(R)),sha256=SHA),method='Unchanged current PE slices at original VAs analyzed by REA/Ghidra; original disassembly, embedded tables and imported CRT identities bind reconstruction.',analyses=analyses,additional_ranges=ranges,jump_tables=jumps,scalars=scalars,imports=imports,totem_factions=dict(original=span(0x1469acab8,28),values=list(struct.unpack_from('<7I',d,p.rva_offset(0x1469acab8-p.image_base)))),limitations=limitations)
  (out/'behavior-native.json').write_text(portable_json(manifest,indent=2)+'\n')
  print('Collected',len(analyses),'Ghidra analyses and exact current PE data.')
 print('Extracted',len(rows),'current native functions.')
if __name__=='__main__':main()
