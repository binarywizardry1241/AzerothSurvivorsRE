#!/usr/bin/env python3
"""Check current stateful raid consumers with isolated original instructions.

No compiler, Rust execution or game. --stage writes reviewed-candidate evidence
under runtime. Every call is forbidden unless explicitly intercepted below.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse, hashlib, json, math, re, struct, sys
from pathlib import Path
from coverage_common import ROOT,target_bytes
sys.path[:0]=[str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
from unicorn import x86_const as r
STAGE=ROOT/'runtime/native-evidence/0.112.0/raid-stateful'
KEPT=ROOT/'docs/analysis/evidence/0.112.0/raid-stateful'
TAGS=(11,14,15,24,25,26,31,33)
def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
def floats(v):return struct.unpack('<f',struct.pack('<I',v))[0]

class Fixture:
 def __init__(self,raw):
  self.raw=raw;self.u=Uc(UC_ARCH_X86,UC_MODE_64);self.md=Cs(CS_ARCH_X86,CS_MODE_64)
  self.base=0x70000000;self.u.mem_map(self.base,0x100000);self.mapped=set()
  self.game=self.base;self.row=self.base+0x10000;self.frame=self.base+0x20000
  self.queue=self.base+0x30000;self.actors=self.base+0x40000;self.terrain=self.base+0x50000
  self.stack=self.base+0x80000;self.stops=set();self.seams={};self.visited={};self.family=''
  def demand(uc,access,a,n,value,user):
   page=a&~4095
   assert 0x140000000<=page<0x149000000,hex(a)
   if page not in self.mapped:self.u.mem_map(page,4096);self.u.mem_write(page,raw(page,4096));self.mapped.add(page)
   return True
  self.u.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
  def hook(uc,a,n,user):
   if a in self.stops:self.u.emu_stop();return
   if a in self.seams:self.seams[a]();self.ret();return
   assert 0x1459172a0<=a<0x14591b409,hex(a)
   i=next(self.md.disasm(bytes(uc.mem_read(a,n)),a))
   if i.mnemonic=='call':
    assert i.op_str.startswith('0x') and int(i.op_str,16) in self.seams,('unlisted call',hex(a),i.op_str)
   self.visited.setdefault(self.family,{})[a]=raw(a,n)
  self.u.hook_add(UC_HOOK_CODE,hook)
 def put(self,a,fmt,*v):self.u.mem_write(a,struct.pack('<'+fmt,*v))
 def get(self,a,fmt):return struct.unpack('<'+fmt,self.u.mem_read(a,struct.calcsize('<'+fmt)))
 def sx(self,reg,value):self.u.reg_write(reg,bits(value))
 def xf(self,reg):return floats(self.u.reg_read(reg)&0xffffffff)
 def ret(self):
  sp=self.u.reg_read(r.UC_X86_REG_RSP);end=self.get(sp,'Q')[0];self.u.reg_write(r.UC_X86_REG_RSP,sp+8);self.u.reg_write(r.UC_X86_REG_RIP,end)
 def reset(self,now=10.,player=(3.,4.,5.)):
  self.u.mem_write(self.base,bytes(0x90000));self.seams={}
  for reg in [r.UC_X86_REG_RAX,r.UC_X86_REG_RBX,r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_RSI,r.UC_X86_REG_RDI,r.UC_X86_REG_R8,r.UC_X86_REG_R9,r.UC_X86_REG_R10,r.UC_X86_REG_R11,r.UC_X86_REG_R12,r.UC_X86_REG_R14,r.UC_X86_REG_R15]:self.u.reg_write(reg,0)
  self.u.reg_write(r.UC_X86_REG_R13,self.row);self.u.reg_write(r.UC_X86_REG_RBP,self.frame);self.u.reg_write(r.UC_X86_REG_RSP,self.stack)
  for reg in range(r.UC_X86_REG_XMM0,r.UC_X86_REG_XMM15+1):self.u.reg_write(reg,0)
  self.u.reg_write(r.UC_X86_REG_XMM9,bits(player[0])|(bits(player[1])<<32));self.sx(r.UC_X86_REG_XMM10,player[1]);self.sx(r.UC_X86_REG_XMM7,.5)
  self.u.reg_write(r.UC_X86_REG_XMM11,sum(0x7fffffff<<(32*i)for i in range(4)))
  self.sx(r.UC_X86_REG_XMM12,math.tau)
  self.put(self.frame+0x234,'ff',now,0.);self.put(self.frame+0x228,'f',player[2]);self.put(self.frame+0x248,'Q',self.game)
  for slot,i in [(0x50,0),(0x68,1),(0x98,2),(0x128,3),(0x168,4),(0x1b0,5)]:self.put(self.frame+slot,'QQQ',128,self.queue+i*0x1000,0)
  self.put(self.row+0x20,'Q',777);self.put(self.row+0x40,'3f',0.,0.,2.)
  self.seams[0x145c0a42f]=lambda:self.sx(r.UC_X86_REG_XMM0,math.hypot(self.xf(r.UC_X86_REG_XMM0),self.xf(r.UC_X86_REG_XMM1)))
  self.seams[0x145c0a447]=lambda:self.sx(r.UC_X86_REG_XMM0,math.atan2(self.xf(r.UC_X86_REG_XMM0),self.xf(r.UC_X86_REG_XMM1)))
  self.seams[0x145c0a417]=lambda:self.sx(r.UC_X86_REG_XMM0,math.cos(self.xf(r.UC_X86_REG_XMM0)))
  self.seams[0x145c0a411]=lambda:self.sx(r.UC_X86_REG_XMM0,math.sin(self.xf(r.UC_X86_REG_XMM0)))
 def run(self,a,stops):
  self.stops=set(stops);self.u.reg_write(r.UC_X86_REG_EFLAGS,2);self.u.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
  self.u.emu_start(a,0,count=20000);end=self.u.reg_read(r.UC_X86_REG_RIP)
  assert end in self.stops,('unterminated',hex(a),hex(end))
  return end

 def movement(self):
  self.family='movement';cases=0
  for active in [0,1]:
   for speed in [-1.,0.,2.,math.nan]:
    for delta in [0.,.5,3.]:
     for player in [(0.,0.,9.),(.018,.024,9.),(.03,.04,9.),(.036,.048,9.),(.06,.08,9.),(3.,4.,9.),(floats(bits(.05)-1),0.,9.),(floats(bits(.05)),0.,9.),(floats(bits(.05)+1),0.,9.),(math.nan,0.,9.)]:
      for height in ['primary','fallback','secondary']:
       self.reset(player=player);self.put(self.row+0x70,'f',speed);self.put(self.row+0x7d,'B',active)
       self.put(self.frame+0x1d8,'f',delta);self.put(self.game+0x9b0,'Q',self.terrain);self.put(self.terrain+0x68,'q',-1 if height=='fallback'else 0)
       self.put(self.terrain+0xb8,'f',8.)
       def primary():self.u.reg_write(r.UC_X86_REG_RAX,int(height=='primary'));self.sx(r.UC_X86_REG_XMM0,6.)
       def secondary():self.put(self.u.reg_read(r.UC_X86_REG_RCX),'I',1);self.put(self.u.reg_read(r.UC_X86_REG_RCX)+12,'f',7.)
       self.seams[0x1458a0b40]=primary;self.seams[0x1458a4d60]=secondary
       self.run(0x145917615,[0x145917800]);d=f32(math.hypot(f32(player[0]),f32(player[1])));moves=active and speed>0 and d>f32(.05)
       if moves:
        step=min(f32(speed*delta),d);expected=(f32(f32(f32(f32(player[0])/d)*step)+0.),f32(f32(f32(f32(player[1])/d)*step)+0.),6. if height=='primary'else 8. if height=='fallback'else 7.)
       else:expected=(0.,0.,2.)
       assert self.get(self.row+0x40,'3f')==expected,(active,speed,delta,player,height,self.get(self.row+0x40,'3f'),expected)
       cases+=1
  for active in [0,1]:
   for angular in [-2.,0.,3.,math.nan]:
    for delta in [0.,.5,2.]:
     self.reset();self.put(self.row+0x10,'I',3);self.put(self.row+0x1c,'f',angular);self.put(self.row+0x4c,'f',1.);self.put(self.row+0x7d,'B',active);self.put(self.frame+0x1d8,'f',delta)
     self.u.reg_write(r.UC_X86_REG_EAX,3);self.run(0x145917c5a,[0x145917c86]);actual=self.get(self.row+0x4c,'f')[0];expected=f32(1.+f32(angular*delta))if active else 1.
     assert actual==expected or math.isnan(actual)and math.isnan(expected);cases+=1
  return cases

 def periodic(self,graph):
  self.family='periodic';cases=0
  for action in graph['actions']:
   if action['native_tag']not in [14,15,24]:continue
   w=action['words'];tag=action['native_tag'];interval=.25 if tag==15 else .5
   for now in [8.,10.,12.]:
    for expires in [10.,12.]:
     for deadline in [9.,10.,11.]:
      self.reset(now);self.put(self.row+0x14,'ff',expires,interval);self.put(self.row+0x68,'f',deadline)
      end=self.run(0x1459192e8,[0x1459194a9,0x1459172b5,0x145919316])
      expected=0x1459194a9 if now>=expires else 0x1459172b5 if now<deadline else 0x145919316
      assert end==expected
      assert self.get(self.row+0x68,'f')[0]==(f32(deadline+interval)if end==0x145919316 else deadline)
      cases+=1
  for action in graph['actions']:
   tag=action['native_tag'];w=action['words']
   if tag not in [14,15,24]:continue
   radius=floats(w[2]if tag==24 else w[1]);width=floats(w[2])if tag==15 else 0.
   damage=f32(17.*floats(w[3]if tag==14 else w[5]))
   samples=[(0.,0.),(radius,0.),(radius+1.,0.)]if tag!=15 else[(0.,0.),(radius,0.),(radius+1.,0.),(radius*.5,width*.5),(radius*.5,width*.5+.01),(-1.,0.)]
   for x,y in samples:
    self.reset(player=(x,y,5.));self.put(self.row+0x10,'I',3);self.put(self.row+0x14,'ff',20.,.25 if tag==15 else .5);self.put(self.row+0x30,'Iff',2 if tag==15 else 0,radius,width);self.put(self.row+0x60,'f',damage);self.put(self.row+0x68,'f',9.)
    self.run(0x1459192e8,[0x1459172b5,0x1459194a9]);inside=(0<=x<=radius and abs(y)<=width*.5)if tag==15 else math.hypot(x,y)<=radius
    assert self.get(self.frame+0x238,'f')[0]==(damage if inside else 0.),(tag,x,y,inside,self.get(self.frame+0x238,'f'))
    cases+=1
  return cases

 def aftershock(self,graph):
  self.family='aftershock';cases=0
  for action in graph['actions']:
   if action['native_tag']!=11:continue
   w=action['words']
   if not floats(w[6])>0:continue
   for inside in [False,True]:
    self.reset();self.put(self.row+0x10,'I',2);self.put(self.row+0x1c,'I',w[1]);self.put(self.row+0x58,'f',100.);self.put(self.row+0x60,'f',17.);self.put(self.row+0x5c,'I',w[0]);self.u.reg_write(r.UC_X86_REG_RSI,self.row+0x40);self.u.reg_write(r.UC_X86_REG_RAX,int(inside))
    self.run(0x1459185b0,[0x145919232]);assert self.get(self.frame+0x238,'f')[0]==(17. if inside else 0.)
    assert self.get(self.row+0x7d,'B')[0]==1 and self.get(self.row+0x68,'f')[0]==11. and self.get(self.row+0x58,'f')[0]==0.
    assert self.get(self.row+0x28,'q')[0]==(-1 if w[1]else 0)
    assert self.get(self.frame+0x178,'Q')[0]==1 and self.get(self.frame+0x138,'Q')[0]==1;cases+=1
   for now in [10.,11.,12.,30.]:
    for expires in [11.,20.]:
     for deadline in [10.,11.,12.]:
      self.reset(now);self.put(self.row+0x14,'f',expires);self.put(self.row+0x68,'f',deadline);self.put(self.row+0x18,'f',floats(w[7])*17.)
      end=self.run(0x14591925c,[0x1459195e3,0x1459172b5,0x14591929a])
      expected=0x1459195e3 if now>=expires else 0x1459172b5 if now<deadline else 0x14591929a
      assert end==expected and self.get(self.row+0x68,'f')[0]==(deadline+1 if end==0x14591929a else deadline);cases+=1
  for action in graph['actions']:
   if action['native_tag']!=11 or not floats(action['words'][6])>0:continue
   w=action['words'];radius=floats(w[2]);damage=f32(17.*floats(w[7]))
   for distance in [0.,radius,radius+.01]:
    self.reset(player=(distance,0.,5.));self.put(self.row+0x10,'I',2);self.put(self.row+0x14,'ff',20.,damage);self.put(self.row+0x30,'If',0,radius);self.put(self.row+0x68,'f',9.)
    self.run(0x14591925c,[0x1459172b5,0x1459195e3]);assert self.get(self.frame+0x238,'f')[0]==(damage if distance<=radius else 0.);cases+=1
  return cases

 def object_admission(self,graph):
  self.family='object-admission';cases=0
  for action in graph['actions']:
   if action['native_tag']!=11 or not floats(action['words'][6])>0:continue
   w=action['words'];radius=floats(w[2])
   for kind in [0,2,3]:
    for shape in [0,2]:
     for existing in [-1,0,12345]:
      for visual in [0,w[1]]:
       self.reset();captures=[];self.put(self.game+0x598,'QQ',self.row,1);self.put(self.row+0x10,'I',kind);self.put(self.row+0x1c,'I',visual);self.put(self.row+0x28,'q',existing);self.put(self.row+0x30,'If',shape,radius);self.u.reg_write(r.UC_X86_REG_R12,self.game)
       def object_create():
        captures.append((self.u.reg_read(r.UC_X86_REG_RDX),self.xf(r.UC_X86_REG_XMM3),self.get(self.u.reg_read(r.UC_X86_REG_R8),'3f')))
        self.u.reg_write(r.UC_X86_REG_RAX,0xf100000000000099)
       self.seams[0x14592bcd0]=object_create;self.run(0x145919cc1,[0x145919df3])
       allowed=existing==-1 and kind==2 and shape==0 and visual!=0
       expected=0xf100000000000099 if allowed else 0 if existing==-1 else existing
       assert self.get(self.row+0x28,'Q')[0]==expected
       assert captures==([(visual,radius,(0.,0.,2.))]if allowed else[]);cases+=1
  return cases

 def tether(self,graph):
  self.family='tether';cases=0
  for action in graph['actions']:
   if action['native_tag']!=25:continue
   w=action['words'];br=floats(w[1]);heal=floats(w[5]);damage=f32(floats(w[4])*17.)
   for now in [9.,10.,11.,20.]:
    for expires in [10.,20.]:
     for deadline in [9.,10.,11.]:
      for distance in [0.,br,br+f32(.01)]:
       self.reset(now,player=(distance,0.,3.));self.put(self.row+0x14,'fff',br,expires,heal);self.put(self.row+0x68,'f',deadline);self.put(self.row+0x60,'f',damage);self.put(self.row+0x5c,'I',w[0])
       end=self.run(0x145919364,[0x145919546,0x1459172b5]);tick=distance<=br and now<expires and now>=deadline
       assert (end==0x145919546)==(distance>br or now>=expires)
       assert self.get(self.row+0x68,'f')[0]==(deadline+.5 if tick else deadline)
       assert self.get(self.frame+0x238,'f')[0]==(damage if tick else 0.)
       assert self.get(self.frame+0x60,'Q')[0]==int(tick)
       if tick:assert self.get(self.queue,'QfI')==(777,heal,w[0])
       cases+=1
  for published in [0,1]:
   for previous in [1.,5.,100.]:
    for player in [(0.,0.,3.),(3.,4.,3.),(-3.,-4.,3.)]:
     self.reset(player=player);self.put(self.row+0x10,'I',6);self.put(self.row+0x30,'If',2,1.);self.put(self.row+0x38,'f',1.6);self.put(self.row+0x78,'f',previous);self.put(self.row+0x7e,'B',published)
     self.run(0x145917800,[0x145917950]);length=max(f32(math.hypot(*player[:2])),1.)
     assert self.get(self.row+0x34,'ff')==(length,f32(1.6)) and self.get(self.row+0x4c,'f')[0]==f32(math.atan2(player[1],player[0]))
     changed=published and abs(length-previous)>1.
     assert self.get(self.frame+0x138,'Q')[0]==int(changed);cases+=1
  return cases

 def gaze(self,graph):
  self.family='gaze';cases=0
  # Current circle branch doesn't depend on an unproven R12 jump table: enter
  # its exact circle comparison after the separately checked dispatch/gates.
  for action in graph['actions']:
   if action['native_tag']!=26:continue
   damage=f32(floats(action['words'][2])*17.)
   for now in [9.,10.,10.8,11.,20.]:
    for expires in [10.,12.]:
     self.reset(now);self.put(self.row+0x10,'I',4);self.put(self.row+0x14,'f',f32(10.8));self.put(self.row+0x54,'f',expires)
     end=self.run(0x145917950,[0x14591797f,0x145917f06])
     assert (end==0x14591797f)==(f32(now)>=f32(10.8) and expires>f32(now));cases+=1
   for distance in [0.,2.49,2.5,2.51,10.]:
    self.reset(player=(distance,0.,5.));self.put(self.row+0x34,'f',2.5);self.put(self.row+0x60,'f',damage);self.put(self.row+0x5c,'I',action['words'][0]);self.sx(r.UC_X86_REG_XMM8,2.5);self.sx(r.UC_X86_REG_XMM0,distance)
    end=self.run(0x1459179b8,[0x145917c56,0x1459172a0]);hit=distance>2.5
    assert (end==0x1459172a0)==hit and self.get(self.frame+0x238,'f')[0]==(damage if hit else 0.)
    if hit:assert self.get(self.queue+4*0x1000,'QI3f')==(777,action['words'][0],f32(distance),0.,5.)
    cases+=1
  for now in [9.,10.,11.,12.]:
   self.reset(now,player=(3.,4.,7.));self.put(self.row+0x58,'f',11.)
   self.run(0x1459175f3,[0x145917615]);assert self.get(self.row+0x40,'3f')==((3.,4.,7.)if now<11 else(0.,0.,2.));cases+=1
  return cases

 def spawn_and_exposure(self,graph):
  self.family='spawn-exposure';cases=0
  for action in graph['actions']:
   if action['native_tag']!=31:continue
   for enabled in [0,1]:
    self.reset();w=action['words'];index=w[0]|w[1]<<32;self.put(self.row,'B',enabled);self.put(self.row+8,'Q',index);self.u.reg_write(r.UC_X86_REG_RSI,self.row+0x40)
    self.run(0x145918cad,[0x145918f41]);assert self.get(self.frame+0xa8,'Q')[0]==enabled
    if enabled:assert self.get(self.queue+2*0x1000,'Q3f')==(index,0.,0.,2.)
    cases+=1
  # Ordered consumers retain the full64-bit native index and exact optional
  # position representation to the current common enemy constructor seam.
  for count in [0,1,3]:
   self.reset();captures=[];self.put(self.frame+0x98,'QQQ',128,self.queue,count);self.u.reg_write(r.UC_X86_REG_R15,self.game)
   values=[(0,(1.,2.,3.)),(0x100000002,(-1.,0.,5.)),(0xffffffffffffffff,(4.,6.,8.))]
   for i,(index,point)in enumerate(values[:count]):self.put(self.queue+24*i,'Q3f',index,*point)
   def constructor():
    descriptor=self.u.reg_read(r.UC_X86_REG_R8);assert self.get(descriptor,'I')[0]==1
    captures.append((self.u.reg_read(r.UC_X86_REG_RDX),self.get(descriptor+4,'3f')))
   self.seams[0x14593dd90]=constructor;self.run(0x14591afd0,[0x14591b050]);assert captures==values[:count];cases+=1
  for action in graph['actions']:
   if action['native_tag']!=33:continue
   exposure=floats(action['words'][5])
   for now in [0.,10.,100.]:
    for dead in [False,True]:
     for matching in [False,True]:
      self.reset(now);self.put(self.game+0x568,'QQ',self.actors,1);self.put(self.actors+0xf0,'Q',777 if matching else 778);self.put(self.actors+0xb0,'I',int(dead));self.put(self.actors+0x1c8,'ff',20.,30.)
      self.put(self.queue,'Qf',777,exposure);self.u.reg_write(r.UC_X86_REG_RCX,self.queue)
      self.run(0x14591b296,[0x14591b286,0x14591b30c]);valid=matching and not dead
      assert self.get(self.actors+0x1c8,'ff')==((0.,f32(now+exposure))if valid else(20.,30.));cases+=1
  for count in [0,1,3]:
   self.reset();captures=[];self.put(self.frame+0x50,'QQQ',128,self.queue,count)
   values=[(77,.1,101),(88,.2,202),(99,.3,303)]
   for i,value in enumerate(values[:count]):self.put(self.queue+16*i,'QfI',*value)
   def heal():captures.append((self.u.reg_read(r.UC_X86_REG_RDX),self.xf(r.UC_X86_REG_XMM2),self.u.reg_read(r.UC_X86_REG_R9D)))
   self.seams[0x145915be0]=heal;self.run(0x14591b397,[0x14591b3e7]);assert captures==[(a,f32(b),c)for a,b,c in values[:count]];cases+=1
  return cases

def source_checks():
 base=ROOT/'crates/azeroth-survivors-re/src'
 checks={
  'bosses/raid_extra.rs':['self.push_periodic(row, expires, 0.5, 0., 0.)','0.25, direction / f(4)','if *active {','*a += *angular_speed * elapsed','if d > 0.05','(*drift_speed * elapsed).min(d)','*next_tick = now + 1.','*next_tick += 1.','*next_tick += 0.5','heal = Some(*interval)','distance > *break_range || now >= *expires','now >= *arms && !self.contains(player)','spawn = Some((*kind, *index, self.center))','expose = Some(now + *exposure)','port.remove_ground_object(id)'],
  'bosses/raid_areas.rs':['row.advance_extra(now, elapsed, player, port)','port.raid_spawn_at(kind,index,point)','port.raid_heal_source(source,fraction,spell)','port.raid_expose(source,until)','Some(extra::Extra::Aftershock { active:true, visual, object:None','port.raid_dynamic_object(spell,radius,point)','occupied.push(json!(row.id))'],
  'gameplay/mechanics/bosses.rs':['self.post_actions.push(RaidPostAction::Heal','self.post_actions.push(RaidPostAction::Expose','self.post_actions.push(RaidPostAction::Spawn','u64::from(kind) | (u64::from(index)<<32)','native_index.min((self.zone.enemies.len()-1) as u64)','scaling::population_limit(self.rules.density_percent)','port.create(selected,Some(position),&mut self.rng)','defense.exposed_until = until; defense.shield_until = 0.0','if alive {','wards::heal_source('],
 }
 compact=lambda v:re.sub(r'\s+','',v)
 for path,tokens in checks.items():
  text=compact((base/path).read_text())
  for token in tokens:assert compact(token)in text,(path,token)
 area=(base/'bosses/raid_areas.rs').read_text()
 ordering=['port.raid_dynamic_object(','port.raid_marker(row.message(now))','port.damage_player(total','for (kind,index,point) in spawns','for (source,until) in exposures','for (source,fraction,spell) in heals']
 assert [area.index(token)for token in ordering]==sorted(area.index(token)for token in ordering)
 return dict(files=len(checks),guards=sum(map(len,checks.values()))+1)

def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--stage',action='store_true');args=ap.parse_args()
 mod = load_script('raid_target', ROOT/'scripts/check-raid-target.py')
 target,raw,span,graph,headers=mod.recover();mod.check_graph(graph,headers)
 assert raw(0x145db1398,4)==struct.pack('<f',.05)
 pe=mod.load('stateful_pe','scripts/inventory-executable.py').PE(target_bytes(target));imports=[]
 for address,expected in [(0x145c0a42f,'_hypotf'),(0x145c0a447,'atan2f'),(0x145c0a417,'cosf'),(0x145c0a411,'sinf')]:
  assert raw(address,2)==b'\xff\x25';iat=address+6+struct.unpack('<i',raw(address+2,4))[0]
  found=[(row['library'],row['functions'][(iat-int(row['iat_start_address'],16))//8])for row in pe.imports()if 0<=iat-int(row['iat_start_address'],16)<8*len(row['functions'])]
  assert len(found)==1 and found[0][1]==expected,(hex(address),found)
  imports.append(dict(**span(address,6),iat=hex(iat),library=found[0][0],function=expected))
 fixture=Fixture(raw);counts={}
 for name in ['movement','periodic','aftershock','object_admission','tether','gaze','spawn_and_exposure']:
  counts[name]=getattr(fixture,name)(*([graph]if name!='movement'else[]));print(name,counts[name],flush=True)
 out=STAGE if args.stage else KEPT
 if args.stage:out.mkdir(parents=True,exist_ok=True)
 if (out/'rea-provenance.json').exists() or not args.stage:mod.verify_rea_operations(raw,out,target['sha256'])
 # These visited intervals have no earlier canonical assembly owner. Keep the
 # dependency list explicit so later evidence additions cannot change ownership.
 candidates=[]
 owners={};new={}
 for visited in fixture.visited.values():
  for address,value in visited.items():
   if address in owners:continue
   owner=next((name for name,rows in candidates if rows.get(address)==value),None)
   if owner is None:owner='selected-native.asm';new[address]=value
   owners[address]=owner
 assembly=''
 for address,value in sorted(new.items()):
  instructions=list(fixture.md.disasm(value,address));assert sum(i.size for i in instructions)==len(value)
  assembly+=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in instructions)
 if args.stage:(out/'selected-native.asm').write_text(assembly)
 else:assert(out/'selected-native.asm').read_text()==assembly
 traces={}
 for family,addresses in fixture.visited.items():
  intervals=[]
  for a,value in sorted(addresses.items()):
   owner=owners[a]
   if intervals and intervals[-1][1]==a and intervals[-1][2]==owner:intervals[-1][1]+=len(value)
   else:intervals.append([a,a+len(value),owner])
  traces[family]=[dict(**span(a,b-a),assembly=owner)for a,b,owner in intervals]
 manifest=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,
  cases=counts,source_checks=source_checks(),CRT_imports=imports,drift_threshold=dict(**span(0x145db1398,4),value_bits=bits(.05)),action_indices={str(tag):[x['index']for x in graph['actions']if x['native_tag']==tag]for tag in TAGS},
  canonical_input_graph='../raid/catalog.json',visited_instruction_ranges=traces,
  seams={'CRT':['0x145c0a42f hypot','0x145c0a447 atan2','0x145c0a417 cos','0x145c0a411 sin'],'terrain':['0x1458a0b40 primary-height','0x1458a4d60 secondary-height'],
   'ordered_callback_capture':['0x14593dd90 common enemy constructor','0x145915be0 common source healing','0x14592bcd0 canonical dynamic-object constructor']},
  limits=['Synthetic current original-byte fragments do not execute Rust or launch either game.',
   'Current graph/producers and marker/object construction retain their canonical raid/hazard owners; this evidence certifies only selected stateful consumers.',
   'Compiler/application, real terrain and collision, CRT equivalence, allocator/packet/renderer and original/rebuilt gameplay parity are unverified.',
   'Enemy constructor and healing capture seams verify ordered arguments; current shared enemy construction/population and ward healing retain their own reports.',
   'Gaze fixtures separately check arm/expiry gates and circle admission; they do not claim all shape-dispatch alternatives for unreachable noncircle gaze records.'])
 text=json.dumps(manifest,indent=2)+'\n'
 if args.stage:(out/'manifest.json').write_text(text)
 else:assert(out/'manifest.json').read_text()==text
 print('Stateful raid:',sum(counts.values()),'native cases; no compilation/game')
if __name__=='__main__':main()
