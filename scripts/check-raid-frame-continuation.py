#!/usr/bin/env python3
"""Current admitted-frame continuation and actual choice-mode boundaries.

Synthetic original-instruction fixtures only; no compiler or game process.
"""
from script_sources import load_script
import argparse,hashlib,importlib.util,json,math,re,struct,sys
from coverage_common import ROOT

def load():
 module = load_script('guardian_providers', ROOT/'scripts/check-raid-guardian-lifecycle.py');return module

g=load();r=g.r
STAGE=ROOT/'runtime/analysis/staging/native-evidence/0.112.0/raid-frame-continuation'
KEPT=ROOT/'docs/analysis/evidence/0.112.0/raid-frame-continuation'
RANGES={'after-hostile':(0x145900736,0x1459028d6),'after-actor':(0x1459028d6,0x14590412c),
 'xp-choice':(0x1459128da,0x145912914),'choice-publish':(0x14595d970,0x14595d995),
 'lethal-gate':(0x1458ed493,0x1458ed4a2),'lethal-state':(0x1458ed6fc,0x1458ed723),
 'incoming-gate':(0x1458ec44d,0x1458ec46a),'delayed-pull':(0x1459165e4,0x145916858),
 'launch-gate':(0x14591ae9d,0x14591aeb8),'actors':(0x145945710,0x14594ac38)}
for key in ['zone','awake','health','damage','knots','candidates','selector','due']:
 RANGES[key]=g.RANGES[key]
g.RANGES.clear();g.RANGES.update(RANGES)

def reserve(machine):
 address=machine.u.reg_read(r.UC_X86_REG_RCX);cap,ptr,n=machine.get(address,'3Q');new=max(4,cap*2);dest=machine.allocate(new*8)
 if n:machine.u.mem_write(dest,bytes(machine.u.mem_read(ptr,n*8)))
 machine.put(address,'3Q',new,dest,n)

def xp_choice(machine):
 machine.family='xp-choice';cases=0
 for pending in [0,1,0xffffffff]:
  for state in [1,2,4,5]:
   for suppress in [0,1]:
    for store in [0,1,2,255]:
     for spend in [0,1]:
      machine.reset();game=machine.game;machine.put(game+0xa60,'I',pending);machine.put(game+0xadf,'B',state);machine.put(game+0xad8,'B',suppress);machine.put(game+0xad4,'BB',store,spend);machine.u.reg_write(r.UC_X86_REG_RSI,game);calls=[]
      def choice():
       calls.append([machine.u.reg_read(r.UC_X86_REG_EDX)&255,machine.u.reg_read(r.UC_X86_REG_R8D)&255]);machine.put(game+0xadf,'B',2)
      machine.seams[0x14595ca60]=choice;machine.run(0x1459128da,[0x145912914]);admitted=bool(pending and state==1 and not suppress and(store!=1 or spend));assert calls==([[0,1]]if admitted else[]);assert machine.get(game+0xadf,'B')[0]==(2 if admitted else state);cases+=1
 machine.family='choice-publish';publication=0
 for state in [1,2,4,5]:
  for pause in [0,1]:
   machine.reset();machine.put(machine.game+0xadf,'B',state);machine.put(machine.frame+0x126,'BB',pause,0);machine.u.reg_write(r.UC_X86_REG_RDI,machine.game);calls=[];machine.seams[0x1458eb600]=lambda:calls.append('pause');machine.run(0x14595d970,[0x14595d995]);assert machine.get(machine.game+0xadf,'B')[0]==(2 if pause else state);assert calls==(['pause']if pause else[]);publication+=1
 return dict(automatic_gates=cases,mode_publications=publication)

def local_gates(machine):
 machine.family='incoming';cases=0
 for state in [0,1,2,3,4,5]:
  for suppress in [0,1]:
   machine.reset();machine.put(machine.game+0xadf,'B',state);machine.put(machine.game+0xad8,'B',suppress);machine.u.reg_write(r.UC_X86_REG_RCX,machine.game);end=machine.run(0x1458ec44d,[0x1458ed218,0x1458ec46a]);assert(end==0x1458ec46a)==(state==1 and not suppress);cases+=1
 machine.family='lethal-state';lethal=0
 for lives in [0,1]:
  for health in [0.,100.]:
   machine.reset();machine.put(machine.game+0x544,'I',lives);machine.put(machine.game+0x4e8,'f',health);machine.put(machine.game+0xadf,'B',1);machine.u.reg_write(r.UC_X86_REG_R13,machine.game);machine.sx(r.UC_X86_REG_XMM6,10.);end=machine.run(0x1458ed493,[0x1458ed4a2,0x1458ed723]);assert(end==0x1458ed723)==(lives==0)
   if not lives:assert machine.get(machine.game+0x4e8,'f')[0]==0. and machine.get(machine.game+0xadf,'B')[0]==4 and machine.get(machine.game+0x990,'If')==(1,10.)
   lethal+=1
 machine.family='launch-gate';launch=0
 for state in [1,2,4,5]:
  for queued in [0,1]:
   machine.reset();machine.put(machine.game+0xadf,'B',state);machine.put(machine.frame+0x248,'Q',machine.game);machine.put(machine.frame-8,'B',queued);end=machine.run(0x14591ae9d,[0x14591afd0,0x14591aeb8]);assert(end==0x14591aeb8)==bool(state==1 and queued);launch+=1
 return dict(incoming=cases,lethal=lethal,launch=launch)

def delayed_pull(machine):
 machine.family='delayed-pull';cases=0
 for state in [1,2,4,5]:
  for source in ['alive','dead','absent']:
   machine.reset();game=machine.game;array=machine.base+0x60000;machine.put(game+0xadf,'B',state);machine.put(game+0x5b0,'QQ',array,1);machine.put(array,'Qf',1,10.);machine.put(array+0x3d,'B',36);machine.put(game+0x568,'QQ',machine.actor,int(source!='absent'));machine.put(machine.actor+0xf0,'Q',1);machine.put(machine.actor+0xb0,'I',int(source=='dead'));machine.put(machine.frame+0x234,'f',10.);machine.u.reg_write(r.UC_X86_REG_R13,game)
   def move():
    dest=machine.u.reg_read(r.UC_X86_REG_RCX);src=machine.u.reg_read(r.UC_X86_REG_RDX);size=machine.u.reg_read(r.UC_X86_REG_R8)
    if size:machine.u.mem_write(dest,bytes(machine.u.mem_read(src,size)))
   machine.seams[0x145c0a3ed]=move;end=machine.run(0x1459165e4,[0x145916858,0x145916c64,0x145917040]);assert machine.get(game+0x5b8,'Q')[0]==0;assert(end==0x145916858)==(state==1 and source=='alive');assert(end==0x145917040)==(source!='alive');cases+=1
 return cases

def continuation(machine):
 machine.family='continuation';cases=0
 for state in [1,2,4,5]:
  for during_actor in [None,2,4]:
   for suppress in [0,1]:
    machine.reset();game,frame=machine.game,machine.frame;machine.put(frame+0x438,'Q',game);machine.put(frame+0x2f0,'Q',game+0xa4c);machine.put(game+0xadf,'B',state);machine.put(game+0xadb,'B',suppress);machine.u.reg_write(r.UC_X86_REG_R13,game);calls=[]
    machine.seams[0x1459164c0]=lambda:calls.append('raid')
    def actor():
     calls.append('actor')
     if during_actor is not None:machine.put(game+0xadf,'B',during_actor)
    def empty():machine.put(machine.u.reg_read(r.UC_X86_REG_RCX),'3Q',0,8,0)
    machine.seams[0x145945710]=actor;machine.seams[0x1459d4d20]=empty;end=machine.run(0x145900736,[0x14590412c,0x145907826]);assert calls==['raid','actor'];assert(end==0x14590412c)==(not suppress);cases+=1
 return cases

def pickup_continuation(machine):
 machine.family='pickup-continuation';cases=0
 for state in [1,4]:
  for kind in [0,1]:
   for opens_choice in [False,True]:
    machine.reset();game=machine.game;machine.put(machine.frame+0x438,'Q',game);machine.put(game+0x610,'QQ',machine.lairs,1);machine.put(machine.lairs+0x18,'IfIIQ',1,0.,kind,10,42);machine.put(machine.lairs+0x34,'3f',100.,0.,0.);machine.put(game+0xa4c,'f',10.);machine.put(game+0x49c,'f',1.);machine.put(game+0x4b0,'f',1.);machine.put(game+0x4f0,'I',100);machine.put(game+0xadf,'B',state);machine.put(game+0x620,'3Q',128,machine.base+0x60000,0);machine.u.reg_write(r.UC_X86_REG_R13,game);calls=[]
    machine.seams[0x145945710]=lambda:None
    machine.seams[0x1459d4d20]=lambda:machine.put(machine.u.reg_read(r.UC_X86_REG_RCX),'3Q',0,8,0)
    machine.seams[0x145c0d930]=lambda:reserve(machine)
    machine.seams[0x145c0a41d]=lambda:machine.sx(r.UC_X86_REG_XMM0,math.floor(machine.xf(r.UC_X86_REG_XMM0)+.5))
    machine.seams[0x1458de1f0]=lambda:None
    def remove():
     assert machine.u.reg_read(r.UC_X86_REG_RCX)==game and machine.u.reg_read(r.UC_X86_REG_RDX)==0
     calls.append('remove');machine.put(game+0x618,'Q',0)
    def xp():
     calls.append(machine.u.reg_read(r.UC_X86_REG_EDX))
     if opens_choice and state==1:machine.put(game+0xadf,'B',2)
    machine.seams[0x14594d9e0]=remove;machine.seams[0x145911e80]=xp;machine.run(0x1459028d6,[0x14590412c]);assert calls==(['remove',10]if kind==0 else['remove']);assert machine.get(game+0x4f0,'I')[0]==100+(10 if kind==1 else 0);assert machine.get(game+0xadf,'B')[0]==(2 if kind==0 and opens_choice and state==1 else state);cases+=1
 return cases

def actor_continuation(raw,span,graph,zones):
 # Use one actual current constructor, with its native defaults, rather than
 # assuming that a zero-filled actor is a valid initialized record.
 machine=g.Machine(raw);g.constructor(machine,zones,raw,graph);machine.visited={};cases=0
 snapshot=bytes(machine.u.mem_read(machine.base,0x200000))
 results=[]
 for state in [1,2,4,5]:
  machine.u.mem_write(machine.base,snapshot);machine.family='actor-continuation';game=machine.game;machine.put(game+0x4d0,'3f',200.,0.,0.);machine.put(game+0xadf,'B',state);machine.put(game+0x9b0,'Q',machine.world);machine.put(machine.world,'Q',1);machine.put(machine.world+0x40,'q',-1);machine.put(game+0x620,'3Q',128,machine.base+0x60000,0);machine.put(machine.stack,'Q',machine.stop);machine.u.reg_write(r.UC_X86_REG_RSP,machine.stack);machine.u.reg_write(r.UC_X86_REG_RCX,game);machine.sx(r.UC_X86_REG_XMM1,.1)
  def empty():machine.put(machine.u.reg_read(r.UC_X86_REG_RCX),'3Q',0,8,0)
  machine.seams[0x1459d2fd0]=empty;machine.run(0x145945710);assert machine.get(game+0x570,'Q')[0]==1 and machine.get(machine.actor+0xa8,'B')[0]==0;results.append(bytes(machine.u.mem_read(machine.actor,0x1d8)));cases+=1
 assert len(set(results))==1
 rows=list(machine.md.disasm(raw(0x145945710,0x14594ac38-0x145945710),0x145945710));assert not any('0xadf]'in i.op_str for i in rows)
 return cases,machine.visited

def native_checks(raw,span,graph):
 machine=g.Machine(raw);zones=g.catalog(raw,span);counts={}
 for name in ['xp_choice','local_gates','delayed_pull','continuation','pickup_continuation']:counts[name]=globals()[name](machine)
 count,visited=actor_continuation(raw,span,graph,zones);counts['actor_continuation']=count;machine.visited.update(visited)
 return counts,machine

def source_checks():
 base=ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics';text=base.with_suffix('.rs').read_text();compact=lambda value:re.sub(r'\s+','',value)
 predicate=re.search(r'fn active_run_state\(&self\) -> bool \{(.*?)\n    \}',text,re.S)[1]
 assert compact(predicate)=='!self.dead&&!self.completed&&!self.is_paused_for_choice()'
 body=text[text.index('for hit in due_hostile'):text.index('fn spawn_scheduled_world')]
 assert 'if self.dead'not in body
 assert re.search(r'if self.active_run_state\(\) \{\s*self.tick_loot_companions\(player, facing, world\);\s*\}',body)
 assert re.search(r'\}\s*self.spawn_scheduled_world\(delta, player, velocity, world\);\s*if self.active_run_state\(\) \{\s*self.finish_boss_completion\(world\);\s*\}\s*self.drain_guardian_strength\(\)',body)
 guardians=(base/'guardians.rs').read_text();strength=guardians[guardians.index('impl StrengthPort'):guardians.index('fn return_home')]
 assert 'self.active_run_state()'in strength and 'pending_levels'not in strength
 incoming=(base/'incoming.rs').read_text();assert 'if !self.active_run_state() || self.is_showcase()'in incoming
 bosses=(base/'bosses.rs').read_text();assert bosses.count('player_active: self.active_run_state()')==2
 assert re.search(r'fn raid_pull\([^}]+if !self.player_active \{ return; \}',bosses)
 assert re.search(r'if self.active_run_state\(\) \{\s*if let Some\(\(angle, speed\)\) = knockback',bosses)
 treasure=(base/'treasure.rs').read_text();assert re.search(r'self.choices = offers\..*?self.treasure_state.offers = offers;',treasure,re.S)
 completion=(base/'completion.rs').read_text();assert 'if !self.choice_state.store_levels || self.choice_state.spend_levels' in completion
 return dict(files=6,stored_level_count_does_not_select_pause=True,cache_offers_share_pause_vector=True)

def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
 mod=g.load();target,raw,span,graph,headers=mod.recover();mod.check_graph(graph,headers);counts,machine=native_checks(raw,span,graph);source=source_checks();out=STAGE if args.stage else KEPT
 pe=mod.load('frame_current_pe','scripts/inventory-executable.py').PE(g.target_bytes(target));exception_owners={(pe.image_base+a,pe.image_base+b)for a,b,_ in pe.functions()}
 current_owners=[(0x1458ec3f0,0x1458edb1c),(0x1458fb890,0x145908680),(0x145911e80,0x145912976),(0x145945710,0x14594ac38),(0x1459164c0,0x14591bb02),(0x14594fc80,0x14594ff24)]
 assert all(pair in exception_owners for pair in current_owners);direct_modes={}
 for name,a,b in [('actors',0x145945710,0x14594ac38),('raid',0x1459164c0,0x14591bb02),('cache-purchase',0x14594fc80,0x14594ff24)]:
  rows=list(machine.md.disasm(raw(a,b-a),a));assert sum(i.size for i in rows)==b-a;direct_modes[name]=[hex(i.address)for i in rows if '0xadf]'in i.op_str]
 assert direct_modes=={'actors':[],'raid':['0x14591684a','0x14591aea4'],'cache-purchase':[]}
 if args.stage:out.mkdir(parents=True,exist_ok=True)
 mod.verify_rea_operations(raw,out,target['sha256'])
 canonical={};paths=[
  'raid-inputs/guardian-decision-reset.asm','raid-inputs/guardian-selector.asm','raid-inputs/guardian-selection-constructor.asm',
  'raid-inputs/guardian-scheduler.asm','raid-inputs/guardian-phase-gates.asm','raid-inputs/boss-recurring.asm',
  'raid-inputs/boss-phase-ratio.asm','raid-inputs/boss-phase-actions.asm','raid-inputs/boss-phase-yell.asm',
  'raid-inputs/boss-enrage.asm','raid-inputs/boss-health-endless.asm','raid-inputs/boss-damage-actor-stats.asm',
  'raid-inputs/replacement-timers.asm','raid-lifecycles/selected-native.asm','raid-wards/tick-admission.asm',
  'raid-wards/tick-actions.asm','raid-wards/heal.asm','raid-wards/create.asm','raid-wards/hatch-creation.asm',
  'raid-wards/unit-presentation.asm','raid-wards/addon-target.asm','raid-guardian-lifecycle/selected-native.asm',
  'raid-stateful/selected-native.asm','raid-hazards/dispatcher.asm','raid/queue.asm']
 for name in paths:
  for line in(ROOT/'docs/analysis/evidence/0.112.0'/name).read_text().splitlines():
   hit=re.match(r'^([0-9a-f]+): ([0-9a-f]+) ',line)
   if hit:canonical.setdefault(int(hit[1],16),(bytes.fromhex(hit[2]),'../'+name))
 owners={};new={}
 for rows in machine.visited.values():
  for a,value in rows.items():
   prior=canonical.get(a)
   if prior and prior[0]==value:owners[a]=prior[1]
   else:owners[a]='selected-native.asm';new[a]=value
 assembly=''
 for a,value in sorted(new.items()):
  ins=list(machine.md.disasm(value,a));assert sum(i.size for i in ins)==len(value);assembly+=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins)
 traces={}
 for name,rows in machine.visited.items():
  intervals=[]
  for a,value in sorted(rows.items()):
   owner=owners[a]
   if intervals and intervals[-1][1]==a and intervals[-1][2]==owner:intervals[-1][1]+=len(value)
   else:intervals.append([a,a+len(value),owner])
  traces[name]=[dict(**span(a,b-a),assembly=owner)for a,b,owner in intervals]
 registry=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_native_catalog.rs').read_text();semantic_tags=[int(tag,16)for tag in re.findall(r'ability: RawBossAbility \{ words: \[0x([0-9a-f]+)',registry)];assert len(semantic_tags)==493;semantic_set=sorted(set(semantic_tags));assert semantic_set==[1,2,5,6,*range(8,19)]
 abilities=(ROOT/'crates/azeroth-survivors-re/src/bosses/abilities.rs').read_text();body=abilities[abilities.index('pub fn resolve_due_with_rng'):abilities.index('pub fn resolve_due(',abilities.index('pub fn resolve_due_with_rng'))];order=['self.raid_areas.lines.take_due','self.raid_areas.tick_elapsed','self.resolve_impacts'];assert[body.index(token)for token in order]==sorted(body.index(token)for token in order)
 proof=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,cases=counts,source_checks=source,visited_instruction_ranges=traces,
  reachable_semantic_tags=semantic_set,snapshot_admission_bound='493 current graph nodes have no legacy immediate GroundImpact0/AreaStrike3/Charge4; current delayed line actions precede aggregate hazard damage. This does not assert a general arbitrary deferred callback guarantee.',
  PE_owners=[span(a,b-a)for a,b in current_owners],
  direct_mode_read_addresses=direct_modes,fixture_setup='Actor profiles reuse the current constructor fixture; only the subsequent actor walk is newly recorded. Four profiles use one complete native initialized guardian with no invented zero-default actor.',
  seams={'heap':['allocation/free','0x145c0d930 usize-vector reserve'],'frame_callbacks':['0x1459164c0 raid stage','0x145945710 actor stage; full native actor profiles separately execute','0x1459d4d20 pickup-list collector returns empty reservations','0x1459d2fd0 actor aura collector returns empty rows'],
   'shared_callbacks':['0x14595ca60 choice request capturesmode0/pause1 and injectsmode2; actualmodepublication separately executes','0x1458eb600 pause callback','0x14594d9e0 pickupremove capturesindex and removes syntheticrow','0x145911e80 XP inputcapture may openmode2; actualautomaticgate separately executes','0x1458de1f0 unitfieldpublication'],
   'CRT':['currentmemcpy/memmove','sinf/cosf on construction setup','roundf on pickup amount']},
  limits=['This is admitted-frame and callback admission recovery, not whole-frame equivalence. Complex ordinary/boss/ward AI, healing, movement and pending-action arithmetic retain their current owning proofs.',
   'The nonempty actor profile executes a sleeping guardian, not every attack/cast state. Full current actor owner is independently decoded for direct mode reads; nested player damage and delayed movement gates execute separately.',
   'The native mode0 argument is a choice request kind. Actual mode changes to2 only when its synchronous builder publishes with pause1; stored pending levels do not alone change mode.',
   'No Rust/compiler, original/rebuilt game, actual terrain/audio/renderer/UI, runtime interaction or parity comparison.'])
 artifacts={'selected-native.asm':assembly,'manifest.json':json.dumps(proof,indent=2)+'\n'}
 for name,value in artifacts.items():
  if args.stage:(out/name).write_text(value)
  else:assert(out/name).read_text()==value,name
 print(json.dumps(counts,indent=2));print('Current frame continuation checks passed; no compilation/game')

if __name__=='__main__':main()
