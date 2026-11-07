#!/usr/bin/env python3
"""Check current class/race/level scalar composition without compilation/game.

The complete original numeric-refresh prefix executes with empty synthetic Game
collections, and stops before packet/platform publication. Source math is modeled
with explicit f32 rounding; reconstructed Rust is not executed.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
import argparse,hashlib,json,struct
import native_talent_fixture as n

OUT=n.ROOT/'docs/analysis/evidence/balance/player-baselines.json'
def f(value):
    return _shared_f32(value)
def bits(value):
    return _shared_bits(value)

def verify_manifest():
 manifest=json.loads((OUT.parent/'player-baseline-manifest.json').read_text());assert manifest['target_sha256']==n.target['sha256']
 def raw(row):
  start,end=int(row['address'],16),int(row['end_exclusive'],16);offset=n.pe.rva_offset(start-n.pe.image_base);data=n.data[offset:offset+end-start]
  assert len(data)==end-start and hashlib.sha256(data).hexdigest()==row['sha256'],row
  return data
 for row in manifest['ranges']:
  raw(row);assert hashlib.sha256((OUT.parent/row['assembly']).read_bytes()).hexdigest()==row['assembly_sha256'],row
 raw(manifest['whole_owner'])
 for dependency in manifest['canonical_dependencies']:
  record=json.loads((n.ROOT/dependency['path']).read_text());assert record.get('target_sha256',record.get('target',{}).get('sha256'))==n.target['sha256']
  for role in dependency['roles']:
   row=next(row for row in record['ranges']if row['role']==role);raw(row)
 return manifest

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--write',action='store_true');p.add_argument('--prepare-rea',action='store_true');args=p.parse_args();manifest=verify_manifest()
 if args.prepare_rea:
  work=n.ROOT/'runtime/analysis/history/combat/balance/b7a3722a6153/player-refresh';work.mkdir(parents=True,exist_ok=True);row=manifest['whole_owner'];start,end=int(row['address'],16),int(row['end_exclusive'],16);offset=n.pe.rva_offset(start-n.pe.image_base)
  (work/'code.bin').write_bytes(n.data[offset:offset+end-start]);(work/'seeds.tsv').write_text(f'{start:#x}\tcode\n{start:#x}\tfunction\n')
  plan=dict(target=str((work/'code.bin').relative_to(n.ROOT)),output=str((work/'rea').relative_to(n.ROOT)),open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(start)),init_timeout=60,timeout=240,environment={'REA_GHIDRA_SEED_FILE':str((work/'seeds.tsv').relative_to(n.ROOT))},operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(start)))])
  (work/'plan.json').write_text(json.dumps(plan,indent=2)+'\n');print('Prepared current player baseline REA/Ghidra plan under project runtime/');return
 entry=json.loads((n.ROOT/'crates/azeroth-survivors-re/assets/run-entry-0.100.1.json').read_text());vm=n.Machine();cases=0;digest=hashlib.sha256();prior=[]
 for cls in entry['classes']:
  for race in entry['races']:
   for level in list(range(1,101))+[0,0xffffff,0x1000000,0x1000001,0x1000002,0x7fffffff,0x80000000,0xffffffff]:
    game=vm.alloc(0xc00);vm.u.mem_write(game+0x31c,bytes([cls['id'],race['native_id']]));vm.u.mem_write(game+0x4e0,struct.pack('<I',level))
    stack=vm.S+0x100008;vm.put(stack,vm.D);vm.u.reg_write(n.UC_X86_REG_RSP,stack);vm.u.reg_write(n.UC_X86_REG_RCX,game);vm.u.reg_write(n.UC_X86_REG_MXCSR,0x1f80)
    vm.u.emu_start(0x1458f28e0,0x1458f3455,count=100000);assert vm.u.reg_read(n.UC_X86_REG_RIP)==0x1458f3455
    levels=f(f(level)+f(-1.));old_levels=f(max(level-1,0));damage_step=f(f(.03)*levels);regen_step=f(f(.08)*levels)
    damage=f(f(entry['player']['damage_multiplier']+damage_step)+race['damage_bonus'])
    regen=f(f(f(.8)+regen_step)+race['regeneration_bonus'])
    # Existing player_stats/current_damage_multiplier adapters subtract/add the
    # same growth lane. Verify this live projection preserves the selected bits.
    projection_step=f(f(.03)*old_levels);source_damage=f(f(damage-projection_step)+projection_step);assert source_damage==damage
    base_cd=f(entry['player']['cooldown_multiplier']/race['cooldown_divisor']);recovery=f(f(1./base_cd)-1.)
    model={0x480:f(f(cls['base_health']+f(9.*levels))*race['health_multiplier']),0x484:source_damage,0x488:f(1./f(recovery+1.)),0x48c:f(entry['player']['critical_chance']+race['crit_bonus']),0x490:entry['player']['critical_multiplier'],0x494:f(1.+race['move_bonus']),0x498:f(entry['player']['pickup_radius']*race['pickup_multiplier']),0x49c:race['experience_multiplier'],0x4a0:min(f(cls['armor_fraction']+race['armor_bonus']),f(.6)),0x4a4:regen,0x4b0:race['gold_multiplier']}
    previous={0x480:f(f(cls['base_health']+f(9.*old_levels))*race['health_multiplier']),0x484:f(f(entry['player']['damage_multiplier']+race['damage_bonus'])+f(f(.03)*old_levels)),0x4a4:f(f(f(.8)+race['regeneration_bonus'])+f(f(.08)*old_levels))}
    for offset,wanted in model.items():
     actual=struct.unpack('<I',vm.u.mem_read(game+offset,4))[0];assert actual==bits(wanted),(cls['key'],race['key'],level,hex(offset),hex(actual),hex(bits(wanted)));digest.update(struct.pack('<I',actual))
     if offset in previous and bits(previous[offset])!=actual:prior.append(dict(class_id=cls['id'],race_id=race['native_id'],level=level,field={0x480:'health',0x484:'damage',0x4a4:'regeneration'}[offset],before_bits=bits(previous[offset]),native_bits=actual))
    cases+=1
 entry_source=' '.join((n.ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text().split());effects=(n.ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs').read_text();core=(n.ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics.rs').read_text()
 for token in ['(self.damage_base + 0.03 * levels) + self.damage_bonus','(self.regeneration_base + 0.08 * levels) + self.regeneration_bonus','seed.damage(levels)','seed.regeneration(levels)','self.effect_state.racial_progression','let levels = level as f32 + -1.0;']:
  assert token in effects,token
 assert entry_source.index('game.set_racial_progression_components(')<entry_source.index('game.configure_effects(')
 for token in ['defaults.damage_multiplier, race.damage_bonus','regeneration_base, race.regeneration_bonus','let regeneration_base = 0.8;']:assert token in entry_source,token
 assert 'self.stats.damage_multiplier + 0.03 * self.level.saturating_sub(1) as f32' in core
 assert 'delta * self.stats.regeneration' in core
 proof=dict(target_sha256=n.target['sha256'],native_owner='0x1458f28e0',stop_before_packet_work='0x1458f3455',classes=9,races=8,levels=[1,100],additional_level_boundaries=[0,0xffffff,0x1000000,0x1000001,0x1000002,0x7fffffff,0x80000000,0xffffffff],native_cases=cases,scalar_comparisons=cases*11,output_sha256=digest.hexdigest(),prior_source_disagreements=len(prior),prior_source_disagreements_levels_1_to_100=sum(1 for row in prior if 1<=row['level']<=100),prior_source_disagreement_sha256=hashlib.sha256(json.dumps(prior,sort_keys=True).encode()).hexdigest(),examples=prior[:12],seams=[hex(a)for a in sorted(vm.seams)],limits=['Original full numeric-refresh prefix uses actual PE class/race tables and empty synthetic equipment,stat,jewelry,aura,temporary and actor collections. Stop precedes movement/health packet construction.','Source scalar arithmetic and damage projection are translated f32 models with live entry/refresh/tick source guards; no reconstructed Rust executes.','Levels1..100 and eight explicit integer/float boundaries are bounded numeric profiles, not a claimed exhaustive input domain or observed playthrough. Modified/nonempty Survivors proc/actor state retains separate gap ownership.','No compilation,game,device,filesystem operation or original/rebuilt parity.'])
 text=json.dumps(proof,indent=2)+'\n'
 if args.write:OUT.write_text(text)
 else:assert OUT.read_text()==text,'Current player baseline proof missing/stale'
 print(f'{cases}current native class/race/level baselines ({cases*11}scalar comparisons) pass; prior source differs in{len(prior)}fields; no compiler/game')
if __name__=='__main__':main()
