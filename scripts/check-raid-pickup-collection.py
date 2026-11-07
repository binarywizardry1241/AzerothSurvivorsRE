#!/usr/bin/env python3
"""Current AS death-reward pickup collection and choice XP-sweep consumers.

Synthetic installed-instruction fixtures; no compiler, Rust or game process.
"""
from script_sources import load_script
import argparse, hashlib, json, re, sys, struct, math
from coverage_common import ROOT
STAGE=ROOT/'runtime/analysis/staging/native-evidence/0.112.0/raid-pickup-collection'
KEPT=ROOT/'docs/analysis/evidence/0.112.0/raid-pickup-collection'
g = load_script('g', ROOT/'scripts/check-raid-guardian-lifecycle.py');r=g.r
g.RANGES.clear();g.RANGES.update({'loop':(0x1459028e1,0x1459035f4),'reserved':(0x1459d4d20,0x1459d4edc),'remove':(0x14594d9e0,0x14594dbfd),'attract':(0x14594eb50,0x14594ee2e)})
g.RANGES['sweep']=(0x14595e4a4,0x14595e577)
g.RANGES['pull-publication']=(0x145916f23,0x145916f54)
class Machine(g.Machine):
 def setup(self,rows,radius=9.,now=10.,reserved=(),mode=1,multiplier=1.,gold=0,serial=0,opens=False):
  self.reset();self.family='collection';game,frame=self.game,self.frame;self.rows=self.lairs;self.packets=self.base+0x60000;self.outputs=[];self.moves=[];self.fields=[];self.notices=[]
  self.put(game+0x608,'3Q',64,self.rows,len(rows));self.put(game+0x620,'3Q',128,self.packets,0);self.put(game+0x498,'ff',radius,multiplier);self.put(game+0x4b0,'f',multiplier);self.put(game+0x4f0,'I',gold);self.put(game+0xadf,'B',mode);self.put(game+0xa7c,'I',serial);self.put(game+0xa4c,'f',now);self.put(game+0x4d0,'3f',0.,0.,7.);self.put(frame+0x438,'Q',game);self.put(frame+0x3e8,'Q',game+0x9f0)
  for i,row in enumerate(rows):
   at=self.rows+72*i;self.put(at,'3Q',0,8,0);self.put(at+0x18,'IfIIQ',row.get('flight',0),row.get('deadline',999.),row['kind'],row.get('amount',10),row.get('guid',i+1));self.put(at+0x34,'3f',row.get('x',100.),row.get('y',0.),0.);self.put(at+0x40,'f',row.get('created',0.))
   aux=row.get('aux',[])
   if aux:
    pointer=self.base+0x70000+32*i;self.put(pointer,str(len(aux))+'Q',*aux);self.put(at,'3Q',len(aux),pointer,len(aux))
  self.put(game+0x958,'QQ',self.actor,len(reserved))
  for i,guid in enumerate(reserved):self.put(self.actor+i*112+0x18,'I',1)
  # Collector's target GUID is +20, with padding after its +18 u32 phase.
  for i,guid in enumerate(reserved):self.put(self.actor+i*112+0x20,'Q',guid)
  def grow(stride):
   at=self.u.reg_read(r.UC_X86_REG_RCX);cap,pointer,n=self.get(at,'3Q');capacity=max(4,2*cap,n+1);new=self.allocate(capacity*stride)
   if n:self.u.mem_write(new,bytes(self.u.mem_read(pointer,n*stride)))
   self.put(at,'3Q',capacity,new,n)
  def reserve():
   at=self.u.reg_read(r.UC_X86_REG_RCX);used=self.u.reg_read(r.UC_X86_REG_RDX);extra=self.u.reg_read(r.UC_X86_REG_R8);cap,pointer,n=self.get(at,'3Q');capacity=max(4,2*cap,used+extra);new=self.allocate(capacity*8)
   if n:self.u.mem_write(new,bytes(self.u.mem_read(pointer,n*8)))
   self.put(at,'3Q',capacity,new,n)
  def move():
   sp=self.u.reg_read(r.UC_X86_REG_RSP);event=dict(guid=self.u.reg_read(r.UC_X86_REG_RDX),serial=self.get(sp+0x28,'I')[0],ms=self.get(sp+0x30,'I')[0],start=self.get(self.u.reg_read(r.UC_X86_REG_R8),'3f'),dest=self.get(self.u.reg_read(r.UC_X86_REG_R9),'3f'));self.moves.append(event);self.u.mem_write(self.u.reg_read(r.UC_X86_REG_RCX),bytes(32))
  def xp():
   self.outputs.append(['xp',self.u.reg_read(r.UC_X86_REG_EDX)])
   if opens:self.put(game+0xadf,'B',2)
  def fields():
   at=self.u.reg_read(r.UC_X86_REG_RDX);self.fields.append([self.get(at+32,'Q')[0],self.u.reg_read(r.UC_X86_REG_R8D)])
  def notice():
   at=self.u.reg_read(r.UC_X86_REG_RDX);_,pointer,n=self.get(at,'3Q');key,size=self.get(at+0x30,'QQ');self.notices.append([self.raw(key,size).decode(),bytes(self.u.mem_read(pointer,n)).decode()])
  def memmove():
   dest=self.u.reg_read(r.UC_X86_REG_RCX);source=self.u.reg_read(r.UC_X86_REG_RDX);n=self.u.reg_read(r.UC_X86_REG_R8)
   if n:self.u.mem_write(dest,bytes(self.u.mem_read(source,n)))
  def rounding():
   v=self.xf(r.UC_X86_REG_XMM0);v=v if not math.isfinite(v)else math.floor(v+.5)if v>=0 else math.ceil(v-.5);self.sx(r.UC_X86_REG_XMM0,v)
  self.seams.update({0x145c0d930:lambda:grow(8),0x145c0d9a0:lambda:grow(24),0x145c0dbd0:lambda:grow(32),0x145c0d470:reserve,0x145c0a3ed:memmove,0x1458c3bf0:move,0x145911e80:xp,0x1458de1f0:fields,0x145c0a41d:rounding,0x14598ddd0:lambda:(self.u.reg_write(r.UC_X86_REG_RAX,0),self.u.reg_write(r.UC_X86_REG_RDX,0)),0x145912fa0:notice})
  self.u.reg_write(r.UC_X86_REG_R13,game)
 def tick(self):self.run(0x1459028e1,[0x1459035f4])
 def logical(self):
  n=self.get(self.game+0x618,'Q')[0];return[self.get(self.rows+72*i+0x18,'IfIIQ')for i in range(n)]
 def packet_records(self):
  result=[];n=self.get(self.game+0x630,'Q')[0]
  for i in range(n):
   at=self.packets+32*i;opcode=self.get(at+24,'H')[0];ptr,size=self.get(at+8,'QQ');result.append((opcode,bytes(self.u.mem_read(ptr,size))if size else b''))
  return result

def norm(x,y=0.):
 if math.isinf(x)or math.isinf(y):return math.inf
 return g.f(math.sqrt(g.f(g.f(x*x)+g.f(y*y))))
def u32(v):
 if math.isnan(v)or v<=0:return 0
 if v>=0xffffffff:return 0xffffffff
 return int(v)
def rounded(v):return v if not math.isfinite(v)else math.floor(v+.5)if v>=0 else math.ceil(v-.5)
def native_checks(raw):
 machine=Machine(raw);gold_cases=0
 for radius in [0.,3.,5.,9.,20.,math.nan,math.inf]:
  for distance in [0.,3.,5.,9.,12.,g.fb(g.bits(9.)+1),math.nan]:
   for flight in [0,1]:
    for deadline in [10.,11.]:
     for mode in [1,4]:
      machine.setup([dict(kind=1,x=distance,flight=flight,deadline=deadline)],radius=radius,mode=mode);machine.tick();expected=distance<=radius or(flight and 10.>=deadline);assert len(machine.logical())==int(not expected),(radius,distance,flight,deadline);assert machine.get(machine.game+0x4f0,'I')[0]==10*int(expected);assert machine.get(machine.game+0x79c,'I')[0]==10*int(expected);gold_cases+=1
 xp_cases=0
 for radius in [0.,5.,9.,math.nan]:
  for age in [g.fb(g.bits(6.)-1),6.,g.fb(g.bits(6.)+1),math.nan]:
   for reserved in [False,True]:
    for distance in [0.,5.,9.,10.,100.,math.nan,math.inf]:
     machine.setup([dict(kind=0,x=distance,created=g.f(10.-age))],radius=radius,reserved=[1]if reserved else[]);machine.tick();forced=not reserved and g.f(10.-g.f(10.-age))>6.;expected=forced or distance<=radius;logical=machine.logical();assert len(logical)==1;assert logical[0][0]==int(expected),(radius,age,reserved,distance,logical)
     if expected:
      value=norm(distance)/(32. if forced else 24.);duration=g.f(max(value,g.f(.12)))if not math.isnan(value)else g.f(.12);assert logical[0][1]==g.f(10.+duration);assert len(machine.moves)==1;move=machine.moves[0];assert all(g.bits(a)==g.bits(b)for a,b in zip(move.pop('start'),(g.f(distance),0.,0.)));assert move==dict(guid=1,serial=1,ms=u32(g.f(duration*1000.)),dest=(0.,0.,7.))
     else:assert not machine.moves
     xp_cases+=1
 reward_cases=0
 for kind in [0,1]:
  for amount in [0,1,3,0xffffffff]:
   for mult in [0.,.01,.5,1.,1.5,math.nan,math.inf,-1.]:
    for gold in [0,0xffffffff]:
     row=dict(kind=kind,x=100. if kind==0 else 0.,amount=amount,flight=int(kind==0),deadline=10.);machine.setup([row],multiplier=mult,gold=gold);machine.tick();product=g.f(g.f(float(amount))*g.f(mult));value=u32(rounded(product));value=max(value,1)if kind==0 else value
     if kind==0:assert machine.outputs==[['xp',value]],(kind,amount,mult,machine.outputs,value)
     else:assert machine.get(machine.game+0x4f0,'I')[0]==(gold+value)&0xffffffff and machine.get(machine.game+0x79c,'I')[0]==value and machine.fields==[[1176,((gold+value)*10000)&0xffffffff]]
     assert not machine.logical();assert machine.packet_records()[0]==(0xaa,(1).to_bytes(8,'little'));reward_cases+=1
 mixed_cases=0
 for serial in [0,0xfffffffe,0xffffffff]:
  for mode in [1,2,4]:
   for opens in [False,True]:
    rows=[dict(kind=0,guid=101,x=96.,created=9.,aux=[1001,1002]),dict(kind=0,guid=102,x=100.,flight=1,deadline=10.,amount=3,aux=[1003]),dict(kind=1,guid=103,x=80.),dict(kind=1,guid=104,x=0.,amount=7,aux=[1004,1005]),dict(kind=0,guid=105,x=200.,flight=1,deadline=99.),dict(kind=6,guid=106,x=3.,aux=[1006,1007])]
    machine.setup(rows,serial=serial,mode=mode,opens=opens);machine.tick();assert [x[4]for x in machine.logical()]==[101,103,105];assert [x[0]for x in machine.logical()]==[1,1,1];assert [x[1]for x in machine.logical()]==[g.f(12.4),12.,99.];assert machine.outputs==[['xp',3]];assert machine.get(machine.game+0x7a4,'I')[0]==1;assert machine.get(machine.game+0x4f0,'I')[0]==7
    assert [int.from_bytes(payload,'little')for opcode,payload in machine.packet_records()if opcode==0xaa]==[106,1006,1007,104,1004,1005,102,1003]
    assert [int.from_bytes(payload,'little')for opcode,payload in machine.packet_records()if opcode==0x2d2]==[120]
    assert machine.notices==[['magnet','Magnet! Everything on the field comes to you.']];assert [x['guid']for x in machine.moves]==[101];assert machine.moves[0]['serial']==(serial+1)&0xffffffff;assert machine.get(machine.game+0xadf,'B')[0]==(2 if opens else mode);mixed_cases+=1
 # Activation packets are forward, while the frozen mature set is consumed backwards.
 for serial in [0,0xfffffffe,0xffffffff]:
  machine.setup([dict(kind=0,guid=i+1,x=0.,created=9.)for i in range(4)],serial=serial);machine.tick();assert [m['guid']for m in machine.moves]==[1,2,3,4];assert [m['serial']for m in machine.moves]==[(serial+i+1)&0xffffffff for i in range(4)];mixed_cases+=1
 sweep_cases=0
 for radius in [0.,5.,9.,math.nan]:
  for distance in [0.,5.,g.fb(g.bits(5.)+1),100.,math.nan]:
   for flight in [0,1]:
    for amounts in [[0],[1],[3],[0xffffffff,1],[0xffffffff,2]]:
     for mult in [0.,.01,.5,1.,1.5,math.nan,math.inf,-1.]:
      rows=[dict(kind=1,guid=90,x=0.)]+[dict(kind=0,guid=91+i,x=distance,flight=flight,amount=amount,aux=[190+i,290+i])for i,amount in enumerate(amounts)]+[dict(kind=6,guid=99,x=0.)]
      machine.setup(rows,radius=radius,multiplier=mult);machine.family='sweep';machine.u.reg_write(r.UC_X86_REG_RSI,machine.game);machine.run(0x14595e4a4,[0x14595e577]);admit=flight or distance<=radius;expected=sum(amounts)&0xffffffff if admit else 0
      assert [x[4]for x in machine.logical()]==([90,99]if admit else[90,*range(91,91+len(amounts)),99]);assert machine.outputs==([['xp',max(1,u32(rounded(g.f(g.f(float(expected))*g.f(mult)))))]]if expected else[]),(radius,distance,flight,amounts,mult,machine.outputs)
      assert [int.from_bytes(payload,'little')for opcode,payload in machine.packet_records()if opcode==0xaa]==([v for i in range(len(amounts))for v in [91+i,190+i,290+i]]if admit else[]);sweep_cases+=1
 boundary_cases=0
 for count in [0,1,7,8,9,12]:
  for phase in [0,1,2]:
   rows=[dict(kind=0,guid=i+1,x=100.,created=0.)for i in range(12)];machine.setup(rows,radius=0.,reserved=list(range(1,count+1)))
   for i in range(count):machine.put(machine.actor+112*i+0x18,'I',phase)
   machine.tick();expected=[i+1 for i in range(12)if phase!=1 or i>=count];assert [m['guid']for m in machine.moves]==expected;assert [x[0]for x in machine.logical()]==[int(i+1 in expected)for i in range(12)];boundary_cases+=1
 for x,y in [(3.,4.),(g.fb(g.bits(3.)-1),4.),(g.fb(g.bits(3.)+1),4.),(4.,3.),(0.,5.),(0.,g.fb(g.bits(5.)+1)),(math.nan,4.)]:
  for radius in [g.fb(g.bits(5.)-1),5.,g.fb(g.bits(5.)+1)]:
   machine.setup([dict(kind=1,x=x,y=y)],radius=radius);machine.tick();assert bool(machine.fields)==(norm(x,y)<=radius);boundary_cases+=1
 # Compose delivered Pull publication with collection and the choice sweep;
 # consumers must read the new authoritative Game XYZ instead of stale reports.
 for sweep in [False,True]:
  machine.setup([dict(kind=0 if sweep else 1,x=105.,amount=3)],radius=5.);machine.family='pull-collection-input';machine.u.reg_write(r.UC_X86_REG_RDI,machine.game);machine.u.reg_write(r.UC_X86_REG_XMM6,g.bits(100.));machine.sx(r.UC_X86_REG_XMM9,7.);machine.run(0x145916f23,[0x145916f54]);machine.u.reg_write(r.UC_X86_REG_R13,machine.game)
  if sweep:machine.u.reg_write(r.UC_X86_REG_RSI,machine.game);machine.run(0x14595e4a4,[0x14595e577]);assert machine.outputs==[['xp',3]]
  else:machine.tick();assert machine.get(machine.game+0x4f0,'I')[0]==3
  assert not machine.logical();boundary_cases+=1
 return dict(gold_admission=gold_cases,xp_activation=xp_cases,reward_arithmetic=reward_cases,mixed_order_and_magnet=mixed_cases,choice_sweep=sweep_cases,reservation_norm_and_authoritative_position=boundary_cases),machine

def source_checks():
 base=ROOT/'crates/azeroth-survivors-re/src/gameplay'
 pickup=(base/'mechanics/pickups.rs').read_text();completion=(base/'mechanics/completion.rs').read_text();mechanics=(base/'mechanics.rs').read_text();live=(base/'mod.rs').read_text()
 assert '#[path = "mechanics/pickups.rs"]\nmod pickup_effects;'in mechanics and 'pub(super) fn planar('in pickup
 remove=pickup[pickup.index('pub(super) fn remove_pickup_at'):pickup.index('pub fn collect_pickup')]
 assert all(token in remove for token in ['self.pickups.remove(index)','RunEvent::RemoveObject(pickup.id)','pickup.auxiliary.into_iter().flatten().map(RunEvent::RemoveObject)'])
 collect=pickup[pickup.index('pub fn collect_pickup'):pickup.index('fn attract_nearby_experience')]
 assert collect.index('self.remove_pickup_at(index)')<collect.index('match pickup.drop')
 assert '((amount as f32 * self.stats.experience_multiplier).round() as u32).max(1)'in collect
 assert '(amount as f32 * self.stats.gold_multiplier).round() as u32'in collect
 assert all(token in collect for token in ['self.gold.wrapping_add(amount)','self.gold_earned.wrapping_add(amount)','self.gold.wrapping_mul(10_000)','self.pickup_state.collected_magnets.wrapping_add(1)','RunEvent::PlaySound(120)'])
 attraction=pickup[pickup.index('fn attract_nearby_experience'):pickup.index('fn pickup_collectible')]
 assert all(token in attraction for token in ['self.clock - pickup.created_at > 6.0 && !reserved','pickup.flight.is_none()','old_unreserved || distance <= self.stats.pickup_radius','if old_unreserved { 32.0 } else { 24.0 }','max(0.12)','self.movement_counter.wrapping_add(1)'])
 admission=pickup[pickup.index('fn pickup_collectible'):pickup.index('pub(super) fn tick_pickup_collection')]
 assert re.search(r'PickupDrop::Gold \{ \.\. \} => \{\s*planar\(pickup.position\(\), player\) <= self.stats.pickup_radius',admission)
 assert 'distance <= 9.0'not in admission
 stage=pickup[pickup.index('pub(super) fn tick_pickup_collection'):pickup.index('pub fn try_collect_pickup')]
 ordered=['self.pickup_state.player = player','self.companion_reserved(pickup.id)','self.attract_nearby_experience(index, player, reserved)','self.pickup_collectible(pickup, player)','collect.into_iter().rev()','self.collect_pickup(id)']
 assert [stage.index(t)for t in ordered]==sorted(stage.index(t)for t in ordered)
 assert all(t not in stage for t in ['active_run_state','self.dead','is_paused_for_choice'])
 tick=mechanics[mechanics.index('pub fn tick('):mechanics.index('fn spawn_scheduled_world(')]
 assert tick.rindex('player_override.take()')<tick.index('self.tick_pickup_collection(player)')<tick.index('self.tick_loot_companions')<tick.index('self.spawn_scheduled_world')
 assert 'let arrivals:'not in tick
 sweep=completion[completion.index('pub(super) fn complete_choice'):completion.index('if self.pending_cache_choices()')]
 assert all(t in sweep for t in ['while index < self.pickups.len()','super::pickup_effects::planar(pickup.position(), player) <= radius','raw_xp.wrapping_add(amount)','self.remove_pickup_at(index)','continue;','index += 1;','if raw_xp != 0','((raw_xp as f32 * self.stats.experience_multiplier).round() as u32).max(1)'])
 assert re.search(r'pickup.flight.is_some\(\)\s*\|\| super::pickup_effects::planar',sweep)
 assert 'self.pickups.retain'not in sweep and sweep.index('self.remove_pickup_at(index)')<sweep.index('self.add_experience(grant)')
 assert re.search(r'let choice_position = session.accepted_position.unwrap_or\(world.position_wow\);\s*if let Some\(game\) = session.mechanics.as_mut\(\) \{\s*game.set_choice_player_position\(Position::from\(choice_position\)\);',live)
 assert 'game.try_collect_pickup('not in live and 'let previous_clock = game.clock;'not in live
 companions=(base/'mechanics/loot_companions.rs').read_text();reserved=companions[companions.index('pub fn companion_reserved'):companions.index('pub fn loot_companion_names')];assert 'actor.phase == native::Phase::Fetching(guid)'in reserved
 return dict(files=5,admitted_collection_after_forced_position=True,forward_activation_reverse_frozen_collection=True,forward_choice_sweep_publishes_removal=True,choice_uses_accepted_position=True)

def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
 mod=g.load();target,raw,span,graph,headers=mod.recover();mod.check_graph(graph,headers)
 counts,machine=native_checks(raw);source=source_checks();out=STAGE if args.stage else KEPT
 if args.stage:out.mkdir(parents=True,exist_ok=True)
 mod.verify_rea_operations(raw,out,target['sha256'])
 pe=mod.load('pickup_collection_pe','scripts/inventory-executable.py').PE(g.target_bytes(target));owners={(pe.image_base+a,pe.image_base+b)for a,b,_ in pe.functions()}
 expected=[(0x1458fb890,0x145908680),(0x1459d4d20,0x1459d4edc),(0x14594d9e0,0x14594dbfd),(0x14594eb50,0x14594ee2e),(0x14595e3f0,0x14595e9a7),(0x145911e80,0x145912976)]
 assert all(pair in owners for pair in expected)
 constants=[]
 for a,v in [(0x145dbad34,6.),(0x145eab1d0,32.),(0x145e06064,24.),(0x145db6b48,.12),(0x145dad480,3.),(0x145dad4e4,40.),(0x145dad260,1.)]:
  assert raw(a,4)==struct.pack('<f',v);constants.append(dict(**span(a,4),f32=v))
 imports=[]
 for address,name in [(0x145c0a41d,'roundf'),(0x145c0a3db,'memcpy'),(0x145c0a3ed,'memmove')]:
  assert raw(address,2)==b'\xff\x25';iat=address+6+struct.unpack('<i',raw(address+2,4))[0];found=[(row['library'],row['functions'][(iat-int(row['iat_start_address'],16))//8])for row in pe.imports()if 0<=iat-int(row['iat_start_address'],16)<8*len(row['functions'])];assert len(found)==1 and found[0][1]==name
  imports.append(dict(**span(address,6),iat=hex(iat),library=found[0][0],function=name))
 dispatch=[]
 for tag,callee in [(0,0x145903213),(1,0x145903263),(6,0x145903153)]:
  a=0x146c0c1e4+tag*4;assert 0x146c0c1e4+struct.unpack('<i',raw(a,4))[0]==callee;dispatch.append(dict(tag=tag,entry=span(a,4),target=hex(callee)))
 # Fixed canonical dependencies only. Ownership cannot drift with ambient files.
 paths=['raid-frame-continuation/selected-native.asm','raid-boss-lifecycle/selected-native.asm','raid-reward-pickups/selected-native.asm','raid-lifecycles/selected-native.asm','raid-guardian-lifecycle/selected-native.asm','raid-forced-position/selected-native.asm','raid/queue.asm','raid-hazards/dispatcher.asm']
 canonical={}
 for path in paths:
  for line in (ROOT/'docs/analysis/evidence/0.112.0'/path).read_text().splitlines():
   hit=re.match(r'^([0-9a-f]+): ([0-9a-f]+) ',line)
   if hit:canonical.setdefault(int(hit[1],16),(bytes.fromhex(hit[2]),'../'+path))
 new={};traces={};calls={}
 for family,rows in machine.visited.items():
  intervals=[];edges=[]
  for a,value in sorted(rows.items()):
   prior=canonical.get(a);owner=prior[1]if prior and prior[0]==value else'selected-native.asm'
   if owner=='selected-native.asm':new[a]=value
   if intervals and intervals[-1][1]==a and intervals[-1][2]==owner:intervals[-1][1]+=len(value)
   else:intervals.append([a,a+len(value),owner])
   instruction=next(machine.md.disasm(value,a))
   if instruction.mnemonic=='call':edges.append(dict(call=span(a,len(value)),target=instruction.op_str))
  traces[family]=[dict(**span(a,b-a),assembly=owner)for a,b,owner in intervals];calls[family]=edges
 assembly=''
 for a,value in sorted(new.items()):
  ins=list(machine.md.disasm(value,a));assert sum(i.size for i in ins)==len(value);assembly+=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins)
 proof=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,cases=counts,source_checks=source,PE_owners=[span(a,b-a)for a,b in expected],constants=constants,CRT_imports=imports,selected_dispatch=dispatch,visited_instruction_ranges=traces,direct_calls=calls,
  native_order=['authoritative player XYZ/radius/clock load','current Fetching GUID reservation collector','forward idle XP activation and move publication','forward admission snapshot','reverse stable removal before reward callback','companion stage resumes at1459035f4'],choice_sweep='Forward stable removal of flying or in-radius XP; wrapping raw sum; zero skips callback, otherwise one multiplied/rounded/saturating grant with minimum1.',
  seams={'heap':['0x140002200 allocator entry','0x1400021c0 allocation','0x1400021d0 free','0x145c0d930 u64 vector grow','0x145c0d9a0 24-byte move-vector grow','0x145c0dbd0 packet-vector grow','0x145c0d470 u64 reserve'],
   'CRT':['0x145c0a3db memcpy','0x145c0a3ed memmove','0x145c0a41d roundf (half away from zero; NaN/Inf preserved)'],
   'AS_output_ports':['0x1458c3bf0 captures XP movement GUID/serial/ms/start/destination and returns a zero packet descriptor','0x145911e80 captures XP grant; a profile changes actual mode to2 to verify collection continuation','0x1458de1f0 captures player field1176 value','0x14598ddd0 returns missing locale key, selecting installed fallback','0x145912fa0 captures magnet account notice kind/text']},
  limits=['Current native reservation, removal and idle XP attraction helpers execute; removal/sound packet bytes are inspected. Allocation success and explicit ports are synthetic, with all unlisted calls rejected.',
   'Only death-produced XP0, Gold1 and Magnet6 dispatch is claimed. Existing Rune/cache purchase/choice-builder behavior, XP progression internals and companion AI retain their own owners/ports.',
   'Profiles compose the delivered Pull XYZ producer with actual collection/sweep reads; source guards bind accepted position to choice input. No whole-frame or asynchronous input equivalence claim.',
   'No Rust execution/compiler, game process, actual client/audio/UI interaction, terrain integration, or original/rebuilt parity comparison.'])
 for name,value in {'selected-native.asm':assembly,'manifest.json':json.dumps(proof,indent=2)+'\n'}.items():
  if args.stage:(out/name).write_text(value)
  else:assert(out/name).read_text()==value,name
 print(json.dumps(counts,indent=2));print('Current pickup collection checks passed; no compilation/game')

if __name__=='__main__':main()
