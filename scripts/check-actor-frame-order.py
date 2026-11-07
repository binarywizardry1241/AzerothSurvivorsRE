#!/usr/bin/env python3
"""Check native actor walk, publication stages and deferred engagement; no build/game."""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
import re
import struct
import sys
from coverage_common import ROOT

SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
KEPT=ROOT/'docs/analysis/evidence/0.109.0/actor-frame-order'
STAGE=ROOT/'runtime/analysis/staging/native-evidence/0.109.0/actor-frame-order'
RANGES={
 'actor-vector':(0x14597830a,0x14597832a),
 'actor-iterator':(0x1459783dc,0x14597841a),
 'movement-queue':(0x14597b2e1,0x14597b325),
 'melee-queue':(0x14597b423,0x14597b44d),
 'corpse-consume':(0x14597b4e5,0x14597b4fc),
 'movement-serial':(0x14597b602,0x14597b643),
 'movement-travel-publish':(0x14597b6d9,0x14597b6f3),
 'movement-facing-publish':(0x14597b730,0x14597b751),
 'melee-consume':(0x14597b7ed,0x14597b8c3),
 'cast-start':(0x14597b97b,0x14597ba20),
 'cast-millis-bound':(0x14597b59c,0x14597b5a5),
 'cast-millis-multiplier':(0x14597b920,0x14597b929),
 'cast-start-flags':(0x1458c22cf,0x1458c231d),
 'cast-start-target':(0x1458c234a,0x1458c2381),
 'cast-source-admission':(0x14597ba20,0x14597ba5c),
 'cast-completion':(0x14597babf,0x14597bc35),
 'aura-remove-consume':(0x14597c250,0x14597c275),
 'aura-applications-consume':(0x14597c2c0,0x14597c2e2),
 'primary-phase-queue':(0x14597a801,0x14597a82e),
 'primary-phase-consume':(0x14597c373,0x14597c3ba),
 'guardian-phase-queue':(0x14597a1fe,0x14597a229),
 'guardian-engage-queue':(0x145979b04,0x145979b20),
 'guardian-engage-admission':(0x14597c822,0x14597c973),
 'guardian-engage-scalars':(0x14597c973,0x14597c9da),
 'guardian-engage-fields-max':(0x14597ca1b,0x14597ca69),
 'guardian-engage-health-index':(0x14597ca98,0x14597caa3),
 'guardian-engage-fields-health':(0x14597cb4f,0x14597cc95),
 'guardian-engage-yell':(0x14597cc95,0x14597cce9),
 'generic-hold-admission':(0x14595734d,0x14595735a),
 'generic-hold-state':(0x145957427,0x1459574a9),
 'common-hold-gate':(0x145978e94,0x145978ea6),
 'duration-block-type-gates':(0x145957c72,0x145957cd8),
 'yell-kind':(0x1458c2ff2,0x1458c3000),
}
# Canonical ranges already retained by their original owners are referenced,
# never copied into this evidence family.
SHARED_ASSEMBLY={
 'generic-hold-admission':'../raid-waves/hold.asm',
 'generic-hold-state':'../raid-waves/hold.asm',
 'duration-block-type-gates':'../raid-waves/action-block.asm',
}
EXISTING={
 'periodic':'raid-sequences/actor-periodic-consume.asm',
 'guardian-phase-consume':'guardian-signatures/phase-emote-producer.asm',
 'raid':'raid-sequences/actor-raid-consume.asm',
 'wards':'raid-wards/tick-actions.asm',
 'actor-removal':'raid-wards/remove.asm',
 'raid-source-admission':'raid-wards/producer-admission.asm',
 'replacement-type-gates':'raid-native/transform32.asm',
 'appearance-type-gates':'raid-native/transform-unit.asm',
 'ordinary-defense-type-gates':'raid-shields/damage-factor.asm',
 'actor-name':'raid-warnings/actor-name.asm',
 'minion-yell':'raid-sequences/minions.asm',
}

def dump(v):return json.dumps(v,indent=2,ensure_ascii=False)+'\n'
def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
 mod = load_script('actor_inputs', ROOT/'scripts/recover-raid-actions.py')
 target,raw,span,_,_=mod.recover();assert target['sha256']==SHA
 sys.path[:0]=[str(ROOT/'runtime/tool-state/python/armory/python-libs'),str(ROOT/'runtime/tool-state/python/camera/python-libs')]
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
 from unicorn import x86_const as r
 md=Cs(CS_ARCH_X86,CS_MODE_64);ranges=[];assemblies={}
 for role,(a,b) in RANGES.items():
  payload=raw(a,b-a);ins=list(md.disasm(payload,a));assert ins and ins[-1].address+ins[-1].size==b,role
  text=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}\n' for i in ins)
  assemblies[role+'.asm']=text
  assembly=SHARED_ASSEMBLY.get(role,role+'.asm')
  canonical=(KEPT/assembly).read_bytes()if role in SHARED_ASSEMBLY else text.encode()
  if role in SHARED_ASSEMBLY:
   lines=[]
   for line in canonical.decode().splitlines():
    address=int(line.split(':',1)[0],16)
    if a<=address<b:lines.append(line)
   assert '\n'.join(lines)+'\n'==text,role
  ranges.append(dict(role=role,**span(a,b-a),assembly=assembly,assembly_sha256=hashlib.sha256(canonical).hexdigest()))
 # Original queue writes/reads establish insertion order independently of the
 # library and adapter source. No packet serializers occur in the actor walk.
 assert raw(0x14597830a,11)==bytes.fromhex('49698768050000d8010000')
 assert raw(0x145978315,7)==bytes.fromhex('498b8f60050000')
 assert raw(0x1459783fa,7)==bytes.fromhex('498d88d8010000')
 assert 'inc ebx' in assemblies['movement-serial.asm']
 assert 'call 0x1459208d0' in assemblies['melee-consume.asm']
 assert 'call 0x1458c3b90' in assemblies['melee-consume.asm']
 assert assemblies['melee-consume.asm'].index('call 0x1459208d0') < assemblies['melee-consume.asm'].index('call 0x1458c3b90')
 # The damage call sits in the loop's tail; the log is generated before that
 # tail. Its return continues to the next request, never a player-death gate.
 assert 'jmp 0x14597b839' in assemblies['melee-consume.asm']
 assert 'call 0x1458c2220' in assemblies['cast-start.asm']
 assert 'call 0x1458cd770' in assemblies['cast-completion.asm']
 assert '0xb0' not in assemblies['cast-source-admission.asm']
 assert 'call 0x145980540'in assemblies['aura-remove-consume.asm']
 assert 'xor r9d, r9d'in assemblies['aura-remove-consume.asm']
 assert 'call 0x145981020'in assemblies['aura-applications-consume.asm']
 assert 'call 0x1458c2fb0' in assemblies['primary-phase-consume.asm']
 assert 'mov byte ptr [rax], 0xc' in assemblies['yell-kind.asm']
 assert 'mov qword ptr [rax + 5], r14' in assemblies['yell-kind.asm']
 assert '0xb0'not in assemblies['generic-hold-admission.asm']
 assert '0x1c4' in assemblies['generic-hold-state.asm']and'0x198' in assemblies['generic-hold-state.asm']
 assert 'ja 0x1459783dc' in assemblies['common-hold-gate.asm']
 assert 'cmp qword ptr [rcx + rbx + 0x18], -1'in assemblies['duration-block-type-gates.asm']
 assert 'cmp qword ptr [rax + 0x58], -1'in assemblies['duration-block-type-gates.asm']
 assert 'mov word ptr [rax + rdx], 2' in assemblies['cast-start-flags.asm']
 assert 'mov dword ptr [rax + rdx], edi' in assemblies['cast-start-target.asm']
 assert 'call 0x1458cd300' in assemblies['cast-start-target.asm']
 assert raw(0x145dd2e40,4)==struct.pack('<I',0x4f7fffff)
 assert raw(0x145ed0db0,4)==struct.pack('<f',-1000.)
 assert 'call 0x14599c1f0' in assemblies['guardian-engage-admission.asm']
 assert 'call 0x14599c5f0' in assemblies['guardian-engage-admission.asm']
 assert '0xb0' not in assemblies['guardian-engage-admission.asm']
 assert '0x1c' in assemblies['guardian-engage-fields-max.asm']
 assert '0x16' in assemblies['guardian-engage-health-index.asm']
 assert 'call 0x1458bf760' in assemblies['guardian-engage-fields-health.asm']
 for name,relative in EXISTING.items():
  path=ROOT/'docs/analysis/evidence/0.109.0'/relative
  owner=json.loads((path.parent/'manifest.json').read_text());assert owner['target_sha256']==SHA
  row=next(x for x in owner['ranges']if x['assembly']==path.name)
  assert hashlib.sha256(raw(int(row['va'],16),row['byte_count'])).hexdigest()==row['sha256']
  for line in path.read_text().splitlines():
   address,code,*_=line.split();assert raw(int(address[:-1],16),len(code)//2).hex()==code
 # Isolated original machine instructions, with no native callees or process.
 uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set();allowed=(0,0);stops=set();stubs=set()
 def demand(machine,access,address,size,value,user):
  page=address&~4095
  if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
  return True
 def guard(machine,address,size,user):
  if address in stops:uc.emu_stop();return
  if address in stubs:
   if address==0x145bfa0e7:
    dest=uc.reg_read(r.UC_X86_REG_RCX);source=uc.reg_read(r.UC_X86_REG_RDX);n=uc.reg_read(r.UC_X86_REG_R8)
    uc.mem_write(dest,bytes(uc.mem_read(source,n)));uc.reg_write(r.UC_X86_REG_RAX,dest)
   sp=uc.reg_read(r.UC_X86_REG_RSP);dest=struct.unpack('<Q',uc.mem_read(sp,8))[0]
   uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,dest);return
  assert allowed[0]<=address<allowed[1],hex(address)
  instruction=next(md.disasm(bytes(uc.mem_read(address,size)),address))
  assert instruction.mnemonic!='call' or int(instruction.op_str,16)in stubs
 uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand);uc.hook_add(UC_HOOK_CODE,guard)
 frame,game,actors=0x72000000,0x72010000,0x72020000
 for address in [frame,game,actors,0x72030000,0x72040000]:uc.mem_map(address,0x10000)
 def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
 def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
 def sx(reg,v):uc.reg_write(reg,bits(v))
 cases=0
 allowed=RANGES['actor-iterator'];stops={0x14597841a,0x14597b452}
 for count in [0,1,2,3,8,17]:
  put(frame+0x1d0,'Q',actors);put(frame+0x50,'Q',actors+count*0x1d8);put(frame+0x1d8,'Q',0)
  seen=[]
  while True:
   uc.reg_write(r.UC_X86_REG_RBP,frame);uc.emu_start(allowed[0],0,count=100)
   if uc.reg_read(r.UC_X86_REG_RIP)==0x14597b452:break
   seen.append((uc.reg_read(r.UC_X86_REG_R8),get(frame+0x220,'Q')[0]))
  assert seen==[(actors+i*0x1d8,i)for i in range(count)]
  cases+=1
 allowed=(0x14597b62e,0x14597b643);stops={allowed[1]}
 for initial in [0,1,0xfffffffe,0xffffffff]:
  put(frame+0x318,'Q',game);put(game+0xa64,'I',initial)
  for index in range(7):
   uc.reg_write(r.UC_X86_REG_RBP,frame);uc.emu_start(allowed[0],0,count=100)
   assert get(game+0xa64,'I')[0]==(initial+index+1)&0xffffffff
   cases+=1
 # Execute the full native stable-removal helper. Its destructor, memcpy
 # and deallocation seams are explicit; no queue/index repair is supplied.
 allowed=(0x1459b5300,0x1459b5435);stops={0x72040000}
 stubs={0x1459167c0,0x145bfa0e7,0x1400021d0}
 for count in [1,2,5,9]:
  original=[100+i for i in range(count)]
  for removed in [100,100+count//2,99+count,999]:
   uc.mem_write(actors,b'\0'*(count*0x1d8));put(game+0x558,'QQQ',count,actors,count)
   for index,guid in enumerate(original):
    put(actors+index*0x1d8+0xf0,'Q',guid)
    put(actors+index*0x1d8+0x18,'Q',0xffffffffffffffff)
    put(actors+index*0x1d8+0x58,'Q',0xffffffffffffffff)
   put(frame+0x400,'Q',removed);put(0x72038000,'Q',0x72040000)
   uc.reg_write(r.UC_X86_REG_RSP,0x72038000);uc.reg_write(r.UC_X86_REG_RCX,game+0x558);uc.reg_write(r.UC_X86_REG_RDX,frame+0x400)
   uc.emu_start(allowed[0],0,count=10000)
   expected=[guid for guid in original if guid!=removed]
   assert get(game+0x568,'Q')[0]==len(expected)
   assert [get(actors+i*0x1d8+0xf0,'Q')[0]for i in range(len(expected))]==expected
   cases+=1
 stubs=set()
 # Native dispatcher bounds/dead check consumes the CURRENT index after
 # compaction, and after actors appended by earlier requests in this queue.
 allowed=(0x145957954,0x145957978);stops={0x145957978,0x1459579da}
 for count in [0,1,3,7]:
  put(game+0x560,'QQ',actors,count)
  for index in range(count+2):
   for dead in [0,1]:
    put(actors+index*0x1d8+0xb0,'B',dead)
    uc.reg_write(r.UC_X86_REG_RCX,game);uc.reg_write(r.UC_X86_REG_RDX,index)
    uc.emu_start(allowed[0],0,count=100)
    assert (uc.reg_read(r.UC_X86_REG_RIP)==0x1459579da)==(index<count and not dead)
    if index<count:assert uc.reg_read(r.UC_X86_REG_RBX)==index*0x1d8
    cases+=1
 # Original CVTTSS2SI64 plus lower/upper ordered clamps. The upper
 # constant is the largest f32 below2^32, so the actual result equals Rust's
 # saturating float-to-u32, including the otherwise dangerous equality edge.
 allowed=(0x14597b996,0x14597b9ba);stops={allowed[1]}
 for seconds in [0.,-0.,0.0001,0.001,1.,1.999,4.,16.,1000.,4294967.,4294967.5,
                 4294968.,1e10,float('inf'),float('nan'),-1.]:
  value=f32(seconds);sx(r.UC_X86_REG_XMM11,-value);sx(r.UC_X86_REG_XMM10,-1000.)
  sx(r.UC_X86_REG_XMM7,0.);sx(r.UC_X86_REG_XMM9,f32(4294967040.))
  uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80);uc.emu_start(allowed[0],0,count=100)
  ms=f32(value*1000.);expected=0 if not(ms>=0.)else min(int(ms),0xffffffff)if ms!=float('inf')else 0xffffffff
  assert uc.reg_read(r.UC_X86_REG_R9D)==expected,(seconds,uc.reg_read(r.UC_X86_REG_R9D),expected)
  cases+=1
 # Automatic duration blocks write ONLY existing optional boss/guardian
 # lanes. Ordinary/ward sentinels do not acquire a synthetic schedule.
 allowed=RANGES['duration-block-type-gates'];stops={allowed[1],0x145957bb0}
 for boss_lane in [False,True]:
  for guardian_lane in [False,True]:
   for requested in [-2.,8.,float('nan')]:
    put(actors+0x18,'Q',0 if boss_lane else 0xffffffffffffffff)
    put(actors+0x58,'Q',0 if guardian_lane else 0xffffffffffffffff)
    put(actors+0x48,'f',5.);put(actors+0xa0,'f',6.)
    uc.reg_write(r.UC_X86_REG_RCX,actors);uc.reg_write(r.UC_X86_REG_RAX,actors);uc.reg_write(r.UC_X86_REG_RBX,0)
    sx(r.UC_X86_REG_XMM0,requested);uc.emu_start(allowed[0],0,count=100)
    assert get(actors+0x48,'f')[0]==(max(5.,requested)if boss_lane else 5.)
    assert get(actors+0xa0,'f')[0]==(max(6.,requested)if guardian_lane else 6.)
    cases+=1
 # Appearance fallback's own optional-definition gate is independent of the
 # actor's saved action payload. Ward's null ordinary definition returns.
 allowed=(0x14594d500,0x14594d539);stops={allowed[1],0x14594dbda}
 for boss_lane in [False,True]:
  for ordinary_definition in [False,True]:
   put(actors+0x18,'Q',0 if boss_lane else 0xffffffffffffffff)
   put(actors+0x30,'Q',frame+0x800);put(actors+0xf8,'Q',frame+0x900 if ordinary_definition else 0)
   uc.reg_write(r.UC_X86_REG_RAX,actors);uc.reg_write(r.UC_X86_REG_R10,0x1d8)
   uc.emu_start(allowed[0],0,count=100)
   assert(uc.reg_read(r.UC_X86_REG_RIP)==allowed[1])==(boss_lane or ordinary_definition)
   if boss_lane:assert uc.reg_read(r.UC_X86_REG_R9)==frame+0x844 and uc.reg_read(r.UC_X86_REG_RAX)==frame+0x848
   elif ordinary_definition:assert uc.reg_read(r.UC_X86_REG_R9)==frame+0x924 and uc.reg_read(r.UC_X86_REG_RAX)==actors+0x170
   cases+=1
 allowed=RANGES['guardian-engage-scalars'];stops={allowed[1]}
 for oldmax in [10.,100.]:
  for health in [0.,2.,oldmax,oldmax*2.]:
   for newmax in [0.,10.,100.,1000.,float('nan')]:
    for newdamage in [0.,3.,30.,float('nan')]:
     put(actors+0x158,'fff',health,oldmax,10.)
     sx(r.UC_X86_REG_XMM6,newmax);sx(r.UC_X86_REG_XMM0,newdamage);sx(r.UC_X86_REG_XMM8,1.)
     uc.reg_write(r.UC_X86_REG_RDI,actors);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
     uc.emu_start(allowed[0],0,count=100)
     expectedmax=newmax if newmax>oldmax else oldmax
     expectedhp=f32(newmax*max(0.,min(1.,f32(health/oldmax))))if newmax>oldmax else health
     expecteddamage=newdamage if newdamage>=10. else 10.
     assert get(actors+0x158,'III')==(bits(expectedhp),bits(expectedmax),bits(expecteddamage))
     cases+=1
 # Every selected current node, including replacement/sequence children,
 # bypasses historical immediate AreaStrike/Charge/GroundArea dispatch.
 # Root adapter incoming/bomb/post/knockback outputs are therefore empty for
 # this hash. A changed registry must re-establish this contract explicitly.
 registry=(ROOT/'crates/azeroth-survivors-re/src/bosses/raid_native_catalog.rs').read_text()
 semantic=[int(x,16)for x in re.findall(r'ability: RawBossAbility \{ words: \[(0x[0-9a-f]+)',registry)]
 assert len(semantic)==493 and set(semantic)=={1,2,5,6,8,9,10,11,12,13,14,15,16,17,18}
 for name,stop in [('raid_extra.rs','impl Area {'),('raid_areas.rs','    pub fn tick('),
                  ('raid_actions.rs',None),('raid_wards.rs',None),('raid_sequences.rs',None),
                  ('raid_sequence_areas.rs',None),('raid_shapes.rs',None),('raid_bombs.rs',None)]:
  text=(ROOT/'crates/azeroth-survivors-re/src/bosses'/name).read_text()
  if stop:text=text.split(stop)[0]
  for call in ['port.damage_player(', 'port.raid_expose(', 'port.raid_heal_source(',
               'port.raid_spawn_at(', 'port.raid_bomb_damage(', 'port.raid_knockback(']:
   assert call not in text,(name,call)
 # Structural source guards follow the real frame and packet consumers; these
 # are not execution/typechecking of Rust. The fixture above executes only EXE.
 base=ROOT/'crates/azeroth-survivors-re/src'
 compact=lambda p:''.join((base/p).read_text().split())
 source=compact('gameplay/mechanics/actor_frame.rs')
 mechanics=compact('gameplay/mechanics.rs')
 assert 'updates.sort_by_key(|update|matches!(update,callbacks::ActorAuraUpdate::Applications{..}))'in mechanics
 for token in ['Lane::Actor(index)','Lane::Boss(index)','Lane::Ward(index)',
  'order.sort_by_key','current.wrapping_sub(*allocated)','self.tick_guardian(','self.tick_boss(',
  'ifnow-row.actor.died_at>1.2','self.boss_state.wards.collect_due(now)',
  'self.casts.push((source_guid,spell_id,-duration))','ifdamage<0.',
  'self.boss_state.player_override.unwrap_or((player,facing))']:
  assert token in source,token
 stages=['forguidin&frame.removals','for(guid,movement)inframe.movements',
  'for(amount,melee,source_guid)inframe.melee','for(source_guid,spell_id,damage)inframe.casts',
  'self.resolve_actor_periodic(','self.publish_actor_aura_updates(',
  'self.events.extend(frame.yells','self.events.extend(frame.emotes',
  'self.dispatch_pending_raid_requests(','self.resolve_ward_actions(',
  'self.resolve_guardian_engagements(frame.engaged)']
 positions=[source.index(x)for x in stages];assert positions==sorted(positions)
 assert 'self.retire_actor_metadata(*guid)'in source
 assert 'self.guardian_state.retire_actor(guid)'in source
 assert 'ifself.dead' not in source and 'publish_actor_movement'not in source[:positions[1]]
 casts=source[positions[3]:positions[4]];assert '!row.actor.dead'not in casts
 guardian=compact('gameplay/mechanics/guardians.rs')
 decision=guardian[guardian.index('pub(super)fntick_guardian('):guardian.index('pub(super)fnresolve_guardian_engagements(')]
 assert 'frame.engaged.push(row.guid)'in decision and 'vitals.rescale('not in decision
 assert 'publish_actor_movement'not in decision and 'self.events.push'not in decision
 engagement=guardian[guardian.index('pub(super)fnresolve_guardian_engagements('):guardian.index('pub(super)fndrain_guardian_strength')]
 assert '!row.actor.dead'not in engagement
 assert engagement.index('vitals.rescale(')<engagement.index('RunEvent::ActorFields')<engagement.index('RunAnnouncement::Yell')
 assert '(22,row.health.ceil()asu32)'in engagement and '(28,row.maximum_health.ceil()asu32)'in engagement
 boss=compact('gameplay/mechanics/bosses.rs');assert 'frame.yells.extend(result.phase_yells'in boss
 event=compact('gameplay/client/events.rs');a=event.index('RunEvent::ActorCast');b=event.index('RunEvent::RaidCast',a)
 assert 'SessionEvent::SpellStart'in event[a:b]and'target:Some(1)'in event[a:b]
 assert 'cast_time_ms:(seconds*1000.)asu32'in event[a:b]
 protocol=(ROOT/'crates/benilla-protocol/src/messages/chat.rs').read_text()
 consumer=(ROOT/'crates/benilla-app/src/ui_chat/event.rs').read_text()
 assert 'CHAT_MSG_MONSTER_YELL: u8 = 0x0C'in protocol and 'm::CHAT_MSG_MONSTER_YELL => K::MonsterYell'in consumer
 manifest=dict(target_version=target['version'],target_sha256=SHA,native_cases=cases,
  ranges=ranges,canonical_references=EXISTING,stage_order=stages,
  current_semantic_tags=sorted(set(semantic)),current_recursive_actions=len(semantic),
  limits=['Original byte snippets and synthetic state only; no native callees/game/process.',
   'Rust integration is inspected statically, not compiled or executed.',
   'Guardian stat-function inputs retain their separately stated recovery provenance.',
   'Full packet display, interaction and original/rebuilt gameplay parity remain unverified.'])
 output=STAGE if args.write else KEPT
 if args.write:
  output.mkdir(parents=True,exist_ok=True)
  (output/'manifest.json').write_text(dump(manifest))
  for name,text in assemblies.items():
   if name[:-4]not in SHARED_ASSEMBLY:(output/name).write_text(text)
 else:
  assert json.loads((output/'manifest.json').read_text())==manifest
  for name,text in assemblies.items():
   if name[:-4]not in SHARED_ASSEMBLY:assert(output/name).read_text()==text,name
 print(f'PASS actor frame: {cases} native iterator/serial/rescale cases; {len(ranges)} byte ranges; live queue/packet source guards; no build/game')
if __name__=='__main__':main()
