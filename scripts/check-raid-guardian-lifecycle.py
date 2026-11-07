#!/usr/bin/env python3
"""Revalidate current guardian lairs, wake/respawn, stats and reward providers.

Original instructions execute only in synthetic CPU fixtures. No Rust/compiler
or game process. --stage writes unique ignored candidate evidence.
"""
from script_sources import load_script
import argparse,hashlib,importlib.util,json,math,re,struct,sys
from pathlib import Path
from coverage_common import ROOT,latest_target,target_bytes
sys.path[:0]=[str(ROOT/'runtime/tool-state/python/camera/python-libs'),str(ROOT/'runtime/tool-state/python/armory/python-libs')]
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
from unicorn import x86_const as r
STAGE=ROOT/'runtime/analysis/staging/native-evidence/0.112.0/raid-guardian-lifecycle'
KEPT=ROOT/'docs/analysis/evidence/0.112.0/raid-guardian-lifecycle'
RANGES={'health':(0x14596a3e0,0x14596a740),'damage':(0x14596a7e0,0x14596a96f),
 'knots':(0x1459cdd20,0x1459cde5e),'candidates':(0x1459d2440,0x1459d25c5),
 'init':(0x14590f612,0x145910b51),'due':(0x145906a63,0x1459073c2),
 'death':(0x14594045e,0x14594062a),'awake':(0x1459b7f00,0x1459b82a6),'home-input':(0x1459470b5,0x1459470f9),'account':(0x14598c610,0x14598c752),'strength':(0x145907959,0x145907a7c),'choice':(0x14595ca60,0x14595cb0b),'magnet':(0x14593d3f0,0x14593d4f6),'selector':(0x145898f10,0x145899272),'zone':(0x145898dc0,0x145898ee9)}
RANGES.update({'tick-entry':(0x1458fb907,0x1458fb946),'world-gate':(0x145904118,0x14590412c),
 'pickup-tail':(0x145906574,0x145906a77),'completion':(0x145907826,0x145907959),
 'unit-level':(0x14593c5a2,0x14593c5bf)})
RANGES.update({'suppression-init':(0x1458fa88c,0x1458fa896),'world-suppression-init':(0x1458fab8e,0x1458fab98),'aggregate-copy':(0x1458fb08f,0x1458fb0a8)})
def f(v):return struct.unpack('<f',struct.pack('<f',v))[0]
def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
def fb(v):return struct.unpack('<f',struct.pack('<I',v))[0]
def load():
 m = load_script('current_raid', ROOT/'scripts/check-raid-target.py');return m


def current_owners(mod,target,raw,span):
 pe=mod.load('guardian_current_pe','scripts/inventory-executable.py').PE(target_bytes(target));functions=[(pe.image_base+a,pe.image_base+b)for a,b,_ in pe.functions()]
 expected=[(0x14590d7a0,0x145910cfa),(0x1458f9cf0,0x1458fb23d),(0x1458fb890,0x145908680),(0x145945710,0x14594ac38),(0x14593ec90,0x145942543)]
 assert all(owner in functions for owner in expected)
 edges=[]
 for call,callee in [(0x1458fb92a,0x14590d7a0),(0x145906bb0,0x14596a3e0),(0x145906bbe,0x14596a7e0),(0x145906c44,0x14593c570),(0x14594718a,0x1459b7f00),(0x14594a108,0x14596a3e0),(0x14594a11b,0x14596a7e0)]:
  assert raw(call,1)==b'\xe8'and call+5+struct.unpack('<i',raw(call+1,4))[0]==callee
  owner=next((a,b)for a,b in functions if a<=call<b);edges.append(dict(call=span(call,5),target=hex(callee),owner=[hex(a)for a in owner]))
 return dict(PE_exception_owners=[span(a,b-a)for a,b in expected],direct_calls=edges)

class Machine:
 def __init__(self,raw,ranges=RANGES):
  self.raw=raw;self.u=Uc(UC_ARCH_X86,UC_MODE_64);self.md=Cs(CS_ARCH_X86,CS_MODE_64);self.base=0x70000000;self.u.mem_map(self.base,0x200000);self.mapped=set()
  self.game=self.base;self.actor=self.base+0x10000;self.frame=self.base+0x20000;self.lairs=self.base+0x30000;self.world=self.base+0x40000;self.heap=self.base+0x80000;self.stack=self.base+0x1e0008;self.stop=self.base+0x1ff000
  self.seams={};self.observers={};self.ends=set();self.family='';self.visited={};self.heap_cursor=self.heap
  def demand(uc,access,a,n,value,user):
   page=a&~4095;assert 0x140000000<=page<0x149000000,hex(a)
   if page not in self.mapped:self.u.mem_map(page,4096);self.u.mem_write(page,raw(page,4096));self.mapped.add(page)
   return True
  self.u.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
  def hook(uc,a,n,user):
   if a in self.ends:self.u.emu_stop();return
   if a in self.seams:self.seams[a]();self.ret();return
   if a in self.observers:self.observers[a]()
   assert any(lo<=a<hi for lo,hi in ranges.values()),('unexpected code',hex(a))
   i=next(self.md.disasm(bytes(uc.mem_read(a,n)),a))
   if i.mnemonic=='call':assert i.op_str.startswith('0x')and(int(i.op_str,16)in self.seams or int(i.op_str,16)in[a for a,b in ranges.values()]),('unlisted call',hex(a),i.op_str)
   self.visited.setdefault(self.family,{})[a]=raw(a,n)
  self.u.hook_add(UC_HOOK_CODE,hook)
 def put(self,a,fmt,*v):self.u.mem_write(a,struct.pack('<'+fmt,*v))
 def get(self,a,fmt):return struct.unpack('<'+fmt,self.u.mem_read(a,struct.calcsize('<'+fmt)))
 def sx(self,reg,value):self.u.reg_write(reg,bits(value))
 def xf(self,reg):return fb(self.u.reg_read(reg)&0xffffffff)
 def ret(self):
  sp=self.u.reg_read(r.UC_X86_REG_RSP);a=self.get(sp,'Q')[0];self.u.reg_write(r.UC_X86_REG_RSP,sp+8);self.u.reg_write(r.UC_X86_REG_RIP,a)
 def allocate(self,size):
  a=self.heap_cursor;self.heap_cursor+=(size+63)&~63;assert self.heap_cursor<self.base+0x1d0000;return a
 def reset(self):
  self.u.mem_write(self.base,bytes(0x200000));self.heap_cursor=self.heap;self.observers={}
  for reg in [r.UC_X86_REG_RAX,r.UC_X86_REG_RBX,r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_RSI,r.UC_X86_REG_RDI,r.UC_X86_REG_R8,r.UC_X86_REG_R9,r.UC_X86_REG_R10,r.UC_X86_REG_R11,r.UC_X86_REG_R12,r.UC_X86_REG_R13,r.UC_X86_REG_R14,r.UC_X86_REG_R15]:self.u.reg_write(reg,0)
  for reg in range(r.UC_X86_REG_XMM0,r.UC_X86_REG_XMM15+1):self.u.reg_write(reg,0)
  self.u.reg_write(r.UC_X86_REG_RBP,self.frame);self.u.reg_write(r.UC_X86_REG_RSP,self.stack);self.put(self.stack,'Q',self.stop)
  def alloc():self.u.reg_write(r.UC_X86_REG_RAX,self.allocate(self.u.reg_read(r.UC_X86_REG_RCX)))
  def copy():
   dest=self.u.reg_read(r.UC_X86_REG_RCX);src=self.u.reg_read(r.UC_X86_REG_RDX);n=self.u.reg_read(r.UC_X86_REG_R8);assert n<0x10000;self.u.mem_write(dest,self.raw(src,n)if 0x140000000<=src<0x149000000 else bytes(self.u.mem_read(src,n)))
  self.seams={0x140002200:lambda:None,0x1400021c0:alloc,0x1400021d0:lambda:None,0x145c0a3db:copy,
   0x145c0a417:lambda:self.sx(r.UC_X86_REG_XMM0,math.cos(self.xf(r.UC_X86_REG_XMM0))),
   0x145c0a411:lambda:self.sx(r.UC_X86_REG_XMM0,math.sin(self.xf(r.UC_X86_REG_XMM0)))}
 def run(self,a,ends=None):
  self.ends=set(ends or[self.stop]);self.u.reg_write(r.UC_X86_REG_EFLAGS,2);self.u.reg_write(r.UC_X86_REG_MXCSR,0x1f80);self.u.emu_start(a,0,count=1000000);end=self.u.reg_read(r.UC_X86_REG_RIP);assert end in self.ends,hex(end);return end


def catalog(raw,span):
 zones=[];source=(ROOT/'crates/azeroth-survivors-re/src/guardians/catalog.rs').read_text();blocks=re.findall(r'static ([A-Z_]+)_ENEMIES:.*?= &\[(.*?)\n\];',source,re.S);assert len(blocks)==12
 live=(ROOT/'crates/azeroth-survivors-re/src/enemies/catalog.rs').read_text();liveblocks=re.findall(r'static ([A-Z_]+)_ENEMIES:.*?= &\[(.*?)\n\];',live,re.S);assert len(liveblocks)==12
 assert[(k,re.sub(r'\s+','',v))for k,v in blocks]==[(k,re.sub(r'\s+','',v))for k,v in liveblocks]
 zoneblocks=re.findall(r'^    ZoneDefinition \{(.*?)^    \},',source.split('pub static ZONES:',1)[1],re.M|re.S);assert len(zoneblocks)==12
 knotblocks=re.findall(r'static [A-Z_]+_HP_KNOTS:.*?= &\[(.*?)\n\];',source,re.S);assert len(knotblocks)==12
 for zi,(_,block)in enumerate(blocks):
  a=0x146bf2630+zi*240;keyptr,keylen=struct.unpack('<QQ',raw(a+8,16));ptr,n=struct.unpack('<QQ',raw(a+0x78,16));ep=[];rows=re.findall(r'EnemyDefinition \{(.*?)\n    \}',block,re.S);assert len(rows)==n
  for ei,rs in enumerate(rows):
   at=ptr+80*ei;words=struct.unpack('<20I',raw(at,80));nameptr,namelen=struct.unpack('<QQ',raw(at+16,16))
   for field,index in [('id',8),('model_id',9),('raw_2c',11),('raw_40',16),('flag_4c',19)]:
    actual=int(re.search(r'\b'+field+r': (\d+)',rs)[1]);assert actual==(words[index]&255 if field=='flag_4c'else words[index]),(zi,ei,field)
   for field,index in [('scale',10),('base_hp',12),('base_damage',13),('raw_38',14),('raw_3c',15),('raw_44',17),('raw_48',18)]:assert int(re.search(r'\b'+field+r': f32::from_bits\(0x([0-9a-f]+)',rs)[1],16)==words[index],(zi,ei,field)
   assert json.loads('"'+re.search(r'name: "([^"\n]*)"',rs)[1]+'"')==raw(nameptr,namelen).decode()
   casts=[int(x,16)for x in re.search(r'raw_cast: \[([^]]+)\]',rs)[1].split(', ')];assert casts==list(words[:4])
   ep.append(dict(index=ei,id=words[8],words=list(words),record=span(at,80)))
  bp,bn=struct.unpack('<QQ',raw(a+0x88,16));assert bn==5;knots=[list(struct.unpack('<II',raw(bp+104*k+80,8)))for k in range(5)if raw(bp+104*k+100,1)!=b'\x01']
  assert[int(x,16)for x in re.findall(r'f32::from_bits\(0x([0-9a-f]+)',knotblocks[zi])]==[v for pair in knots for v in pair]
  ip,ni=struct.unpack('<QQ',raw(a+0x48,16));pp,np=struct.unpack('<QQ',raw(a+0x38,16));indices=list(struct.unpack('<'+str(ni)+'Q',raw(ip,ni*8)))if ni else[]
  selected=indices if zi==11 else[r['index']for r in ep if r['words'][19]&255==1 and math.isfinite(fb(r['words'][18]))]
  points=[list(struct.unpack('<Qff',raw(pp+16*i,16)))for i in range(np)]
  rs=zoneblocks[zi]
  for field,offset in [('radius',216),('placement_angle',212),('scalar_e0',224)]:assert int(re.search(r'\b'+field+r': f32::from_bits\(0x([0-9a-f]+)',rs)[1],16)==struct.unpack('<I',raw(a+offset,4))[0]
  c=[int(x,16)for x in re.findall(r'f32::from_bits\(0x([0-9a-f]+)',re.search(r'center: \[(.*?)\]',rs,re.S)[1])];assert c==list(struct.unpack('<3I',raw(a+200,12)))
  point_source=re.search(r'guardian_points: &\[(.*?)\],\n        guardian_enemy_indices:',rs,re.S)[1]
  actual_points=[(int(index),int(x,16),int(y,16))for index,x,y in re.findall(r'index: (\d+),\s*xy: \[f32::from_bits\(0x([0-9a-f]+)\), f32::from_bits\(0x([0-9a-f]+)\)\]',point_source)]
  assert actual_points==[(int(i),bits(x),bits(y))for i,x,y in points]
  actual_indices=re.search(r'guardian_enemy_indices: &\[([^]]*)\]',rs)[1];assert([int(x.strip())for x in actual_indices.split(',')if x.strip()])==indices
  radius_value=re.search(r'guardian_radius: (.*?),\n',rs)[1];assert(radius_value=='None')==(raw(a,1)==b'\x00')
  if radius_value!='None':assert int(re.search(r'0x([0-9a-f]+)',radius_value)[1],16)==struct.unpack('<I',raw(a+4,4))[0]
  zones.append(dict(index=zi,key=raw(keyptr,keylen).decode(),key_pair=[keyptr,keylen],record=span(a,240),enemies=ep,selected_indices=selected,points=points,knots=knots,zone_scale_bits=struct.unpack('<I',raw(a+224,4))[0]))
 return zones


def arithmetic(machine,zones):
 machine.family='stats';results=[];profiles=[(0.,1.,0,100,100,0,False,0.,1.),(30.,1.,0,100,100,1,False,0.,1.),(180.,1.,0,100,100,1,False,0.,1.),(337.5,1.5,2,175,80,1,False,0.,1.),(1800.,2.25,21,300,250,1,False,0.,1.),(720.,.75,0xffffffff,65535,65535,1,False,0.,1.),(600.,1.,2,0,0,1,False,0.,1.),(720.,1.,2,100,100,1,True,720.,1.),(600.,1.,2,100,100,1,True,720.,1.),(780.,1.,3,100,100,1,True,720.,2.),(817.5,1.,3,100,100,1,True,720.,1.375),(780.,1.,3,100,100,0,True,720.,2.)]
 for zone in zones:
  zi=zone['index']
  for ei in sorted(set(zone['selected_indices'])):
   enemy=zone['enemies'][ei]
   for pi,(clock,difficulty,kills,hp,damage,phase,endless,start,power)in enumerate(profiles):
    machine.reset();game=machine.game;machine.put(game+0xa4c,'f',clock);machine.put(game+0xac0,'f',difficulty);machine.put(game+0x794,'I',kills);machine.put(game+0x988,'If',phase,start);machine.put(game+0x2ca,'HH',hp,damage);machine.put(game+0xad0,'B',endless)
    machine.put(game+0x2a8,'QQ',*zone['key_pair'])
    calls=[]
    def powf():calls.append([machine.u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff,machine.u.reg_read(r.UC_X86_REG_XMM1)&0xffffffff]);machine.sx(r.UC_X86_REG_XMM0,power)
    machine.seams[0x145c0a465]=powf;outputs=[]
    for kind in ['health','damage']:
     machine.put(machine.stack,'Q',machine.stop);machine.u.reg_write(r.UC_X86_REG_RSP,machine.stack);machine.u.reg_write(r.UC_X86_REG_RCX,game);machine.u.reg_write(r.UC_X86_REG_RDX,ei);machine.run(RANGES[kind][0]);outputs.append(machine.u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff)
    t=f(clock/60);zd=f(fb(zone['zone_scale_bits'])*difficulty);knots=[[fb(v)for v in pair]for pair in zone['knots']]
    if not knots:curve=0.
    elif len(knots)==1:curve=knots[0][1]
    elif knots[0][0]>=t:curve=f(f(f(f(f(.4)*t)/max(knots[0][0],f(.001)))+f(.6))*knots[0][1])
    else:
     i=max(1,next((i for i,k in enumerate(knots)if k[0]>=t),len(knots)-1));prev,nxt=knots[i-1],knots[i];curve=f(f(f(f(t-prev[0])*f(nxt[1]-prev[1]))/max(f(nxt[0]-prev[0]),f(.001)))+prev[1])
    p=power if phase==1 and endless else 1.;curve=f(f(curve*f(.6))*zd);linear=f(f(f(.12)*t)+1);quad=f(f(f(.009)*t)*t);poly=f(f(f(f(quad+linear)*zd)*fb(enemy['words'][12]))*f(2.5));selected=f(f(max(curve,poly)*3)*p);health=f(f(f(f(kills)*f(.25))+1)*selected);health=f(health*f(hp/100))
    linear=f(f(f(.08)*t)+1);quad=f(f(f(.004)*t)*t);poly=f(quad+linear);td=f(f(math.sqrt(zd))*poly);dmg=f(f(f(fb(enemy['words'][13])*td)*f(1.4))*p);dmg=f(f(f(f(kills)*f(.05))+1)*dmg);dmg=f(f(damage/100)*dmg)
    assert outputs==[bits(health),bits(dmg)],(zi,ei,pi,outputs,[bits(health),bits(dmg)])
    exponent=f(max(f(f(clock-start)/60),0.));expected_calls=[[bits(1.22),bits(exponent)],[bits(1.096),bits(exponent)]]if phase==1 and endless else[];assert calls==expected_calls
    results.append([zi,ei,pi,*outputs])
 return dict(pairs=len(results),profiles_per_definition=len(profiles),result_sha256=hashlib.sha256(json.dumps(results,separators=(',',':')).encode()).hexdigest())


def awake(machine):
 machine.family='awake';cases=0
 def norm(a,b):
  dx=f(a[0]-b[0]);dy=f(a[1]-b[1]);return f(math.sqrt(f(f(dy*dy)+f(dx*dx))))
 for present in [False,True]:
  for active in [False,True]:
   for current,home,player in [((0.,0.),(0.,0.),(20.,0.)),((0.,0.),(0.,0.),(20.001,0.)),((3.,0.),(0.,0.),(23.,0.)),((3.001,0.),(0.,0.),(3.001,0.)),((0.,0.),(0.,0.),(97.5,0.)),((0.,0.),(0.,0.),(97.501,0.)),((100.,0.),(0.,0.),(0.,0.)),((math.nan,0.),(0.,0.),(0.,0.))]:
    for hp,maximum in [(100.,100.),(99.,100.),(math.nan,100.)]:
     machine.reset();actor=machine.actor;h=machine.actor+0x1000;p=h+0x1000
     machine.put(actor+0x58,'q',0 if present else-1);machine.put(actor+0xa8,'B',active);machine.put(actor+0x158,'ff',hp,maximum);machine.put(actor+0x180,'3f',*current,999.);machine.put(h,'3f',*home,-999.);machine.put(p,'3f',*player,0.)
     machine.u.reg_write(r.UC_X86_REG_RCX,actor);machine.u.reg_write(r.UC_X86_REG_RDX,h);machine.u.reg_write(r.UC_X86_REG_R8,p);machine.sx(r.UC_X86_REG_XMM3,10.);machine.run(RANGES['awake'][0]);result=machine.u.reg_read(r.UC_X86_REG_RAX)&255
     expected=3 if not present else 2 if active and norm(home,player)>97.5 else 3 if active else 1 if hp<maximum or(norm(current,home)<=3. and norm(current,player)<=20.)else 0
     assert result==expected,(present,active,current,home,player,hp,result,expected)
     assert machine.get(actor+0xa8,'B')[0]==(int(active)if not present or expected in[0,3]else int(expected==1));cases+=1
 # Current caller's invalid lair index substitutes its interpolated actor XY/Z.
 machine.family='home-input'
 for index in [0,1,9,0xffffffffffffffff]:
  machine.reset();game,actor,frame=machine.game,machine.actor,machine.frame
  machine.put(game+0x670,'QQ',machine.lairs,1);machine.put(actor+0x58,'q',0);machine.put(actor+0x90,'Q',index);machine.put(machine.lairs+0x18,'3f',7.,8.,9.);machine.put(frame+0x320,'Q',game);machine.put(frame+0x2e8,'f',3.)
  machine.u.reg_write(r.UC_X86_REG_R14,actor);machine.u.reg_write(r.UC_X86_REG_XMM14,bits(1.)|(bits(2.)<<32));machine.run(0x1459470b5,[0x1459470f9]);xy=machine.u.reg_read(r.UC_X86_REG_XMM9)&((1<<64)-1);z=machine.u.reg_read(r.UC_X86_REG_EDI)
  assert[xy,z]==([bits(7.)|(bits(8.)<<32),bits(9.)]if index==0 else[bits(1.)|(bits(2.)<<32),bits(3.)]);cases+=1
 return cases


def due_and_death(machine):
 machine.family='due';cases=0
 for active in [0,1]:
  for clock in [0.,19.999,20.,21.,180.,1000.,math.nan]:
   for deadline in [20.,180.,math.nan]:
    machine.reset();game,frame=machine.game,machine.frame;machine.put(frame+0x438,'Q',game);machine.put(frame+0x2f0,'Q',game+0xa4c);machine.put(game+0xa4c,'f',clock);machine.put(game+0x670,'QQ',machine.lairs,1);machine.put(machine.lairs,'Q',active);machine.put(machine.lairs+0x24,'f',deadline);machine.u.reg_write(r.UC_X86_REG_RBX,0)
    end=machine.run(0x145906b0c,[0x145906b00,0x145906b4a]);assert(end==0x145906b4a)==(not active and f(clock)>=f(deadline));cases+=1
 for suppress in [0,1]:
  machine.reset();machine.put(machine.game+0xad8,'B',suppress);machine.u.reg_write(r.UC_X86_REG_RDI,machine.game);machine.run(0x145906a6a,[0x145907826,0x145906a77]);assert(machine.u.reg_read(r.UC_X86_REG_RIP)==0x145907826)==bool(suppress);cases+=1
 machine.family='death'
 for index in [0,1,9,0xffffffffffffffff]:
  for kills in [0,3,0xffffffff]:
   for clock in [0.,1.25,600.]:
    machine.reset();game,frame=machine.game,machine.frame;machine.put(game+0x670,'QQ',machine.lairs,1);machine.put(game+0x794,'I',kills);machine.put(game+0xa4c,'f',clock);machine.put(machine.lairs,'Q',777);machine.put(machine.lairs+0x24,'f',999.);machine.put(frame+0x78,'Q',index);machine.u.reg_write(r.UC_X86_REG_RDI,game);machine.u.reg_write(r.UC_X86_REG_R14,0)
    machine.run(0x14594045e,[0x1459404ab]);assert machine.get(game+0x794,'I')[0]==(kills+1)&0xffffffff
    assert machine.get(machine.lairs,'Q')[0]==(0 if index==0 else 777);assert machine.get(machine.lairs+0x24,'f')[0]==(clock+180. if index==0 else 999.);cases+=1
 return cases


def placement(machine,zones,raw):
 machine.family='placement';cases=[]
 grid=0x72000000;width=2048;machine.u.mem_map(grid,width*width)
 for zone in zones:
  zi=zone['index'];a=0x146bf2630+zi*240;center=struct.unpack('<ff',raw(a+200,8));angle_base=struct.unpack('<f',raw(a+212,4))[0];radius=struct.unpack('<f',raw(a+4 if raw(a,1)!=b'\x00'else a+216,4))[0]
  for profile in ['first','second','third','fourth','fifth','missing','steep','blocked','secondary','fallback']:
   machine.reset();game,frame=machine.game,machine.frame;machine.put(frame+0x128,'Q',game);machine.put(game+0x9b0,'Q',machine.world);machine.put(game+0x668,'QQQ',32,machine.lairs,0);machine.put(machine.world+0x40,'q',0 if profile=='blocked'else-1);machine.put(machine.world+0x68,'q',0 if profile=='secondary'else-1);machine.put(machine.world+0xb8,'f',4.)
   if profile=='blocked':
    machine.u.mem_write(grid,b'\x01'*(width*width));machine.put(machine.world+0x48,'QQQff',grid,width*width,width,f(center[0]-1024),f(center[1]-1024))
   queries=[];attempts={}
   def primary():
    x,y=machine.xf(r.UC_X86_REG_XMM1),machine.xf(r.UC_X86_REG_XMM2);is_center=(x,y)==center;queries.append([x,y]);valid=profile not in['missing','secondary','fallback'];height=36. if profile=='steep'and not is_center else 6.
    if profile in['second','third','fourth','fifth']and not is_center and not any((x,y)==(p[1],p[2])for p in zone['points']):
     slot=machine.get(frame+0xd0,'Q')[0];attempts[slot]=attempts.get(slot,0)+1;height=6. if attempts[slot]>={'second':2,'third':3,'fourth':4,'fifth':5}[profile]else 36.
    machine.u.reg_write(r.UC_X86_REG_RAX,int(valid));machine.sx(r.UC_X86_REG_XMM0,height)
   def secondary():
    out=machine.u.reg_read(r.UC_X86_REG_RCX);machine.put(out,'I',1);machine.put(out+12,'f',7.)
   machine.put(game+0x2a8,'QQ',*zone['key_pair']);machine.u.reg_write(r.UC_X86_REG_R14,zone['key_pair'][0]);machine.u.reg_write(r.UC_X86_REG_R15,zone['key_pair'][1]);machine.seams[0x1458a0b40]=primary;machine.seams[0x1458a4d60]=secondary;machine.u.reg_write(r.UC_X86_REG_R13,game)
   machine.run(0x14590f612,[0x14590f6ed,0x14590f71d]);assert machine.get(game+0x678,'Q')[0]==4
   rows=[machine.get(machine.lairs+40*i,'QQQ3ff')for i in range(4)]
   for slot,row in enumerate(rows):
    key=next((p for p in zone['points']if p[0]==slot),None)
    if key:point=(key[1],key[2]);height=36. if profile=='steep'and point!=center else 6. if profile not in['missing','secondary','fallback']else 7. if profile=='secondary'else 4.
    else:
     angle=f(f(angle_base+fb(0x3f490fdb))+f(f(slot*fb(0x40c90fdb))*.25));direction=[f(math.cos(angle)),f(math.sin(angle))];distance=f(radius*f({'first':.7,'second':.62,'third':.54,'fourth':.46,'fifth':.38}.get(profile,.5)));point=(f(f(direction[0]*distance)+center[0]),f(f(direction[1]*distance)+center[1]));height=6. if profile in['first','second','third','fourth','fifth','blocked']else 36. if profile=='steep'else 7. if profile=='secondary'else 4.
    assert row[0]==0 and row[2]==zone['selected_indices'][slot%len(zone['selected_indices'])]and row[-1]==20.
    assert tuple(bits(v)for v in row[3:6])==tuple(bits(v)for v in[*point,height]),(zi,profile,slot,row,[*point,height])
   cases.append([zi,profile,len(queries),hashlib.sha256(machine.u.mem_read(machine.lairs,160)).hexdigest()])
 # Initial suppression bypasses selection, terrain and lair construction.
 for suppressed in [1,2,255]:
  machine.reset();machine.put(machine.game+0xad8,'B',suppressed);machine.u.reg_write(r.UC_X86_REG_R13,machine.game);assert machine.run(0x14590f612,[0x14590f71d])==0x14590f71d;assert machine.get(machine.game+0x678,'Q')[0]==0;cases.append(['suppressed',suppressed])
 return dict(cases=len(cases),result_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())


def rewards(machine,raw):
 machine.family='death-rewards';cases=0
 for kills in [0,1,5,0xffffffff,0x3333332e]:
  machine.reset();game,frame=machine.game,machine.frame;name=machine.base+0x60000;machine.u.mem_write(name,b'Guardian');machine.put(game+0x794,'I',kills);machine.put(game+0x620,'QQQ',128,machine.base+0x70000,0);machine.put(frame+0x138,'Q',8);machine.put(frame+0x140,'3f',1.,2.,3.)
  machine.u.reg_write(r.UC_X86_REG_RDI,game);machine.u.reg_write(r.UC_X86_REG_R13,name);events=[]
  def localize():machine.u.reg_write(r.UC_X86_REG_RAX,0)
  def emote():
   message=raw(machine.u.reg_read(r.UC_X86_REG_R9),machine.get(machine.u.reg_read(r.UC_X86_REG_RSP)+0x28,'Q')[0]).decode();events.append(['announce',message]);machine.u.mem_write(machine.u.reg_read(r.UC_X86_REG_RCX),bytes(32))
  def sound():events.append(['sound',machine.u.reg_read(r.UC_X86_REG_EDX)]);machine.u.mem_write(machine.u.reg_read(r.UC_X86_REG_RCX),bytes(32))
  def formatted():
   template=raw(machine.u.reg_read(r.UC_X86_REG_RDX),machine.u.reg_read(r.UC_X86_REG_R8)).decode();assert template=='{name} is slain! Its hoard and a level.'
   text=b'Guardian is slain! Its hoard and a level.';a=machine.allocate(len(text));machine.u.mem_write(a,text);machine.put(machine.u.reg_read(r.UC_X86_REG_RCX),'QQQ',len(text),a,len(text))
  def notice():
   a=machine.u.reg_read(r.UC_X86_REG_RDX);kindptr,n=machine.get(a+0x30,'QQ');length,ptr,n2=machine.get(a+0x18,'QQQ');assert length==n2==8;events.append(['account',raw(kindptr,n).decode(),bytes(machine.u.mem_read(ptr,n2)).decode()])
  def pickup():events.append(['gold',machine.u.reg_read(r.UC_X86_REG_EDX),machine.u.reg_read(r.UC_X86_REG_R8D),*machine.get(machine.u.reg_read(r.UC_X86_REG_R9),'3f')])
  def magnet():events.append(['magnet',*machine.get(machine.u.reg_read(r.UC_X86_REG_RDX),'3f')])
  machine.seams.update({0x14598ddd0:localize,0x1458c22c0:emote,0x1458c3120:sound,0x14598e180:formatted,0x145912fa0:notice,0x145944310:pickup,0x14593d3f0:magnet})
  machine.run(0x1459404ab,[0x14594062a]);assert events==[['announce','%s is slain! Its lair yields treasure and its strength, and the other guardians grow stronger.'],['sound',8174],['account','guardian','Guardian'],['gold',1,(kills*5+25)&0xffffffff,1.,2.,3.],['magnet',1.,2.,3.]],events
  assert machine.get(game+0xa6c,'I')[0]==1;cases+=1
 machine.family='strength'
 for initial in [0,1,3]:
  for state in [1,2]:
   for suppression in [0,1]:
    for alter in [False,True]:
     machine.reset();game=machine.game;machine.put(game+0xa6c,'I',initial);machine.put(game+0xa68,'I',0xffffffff);machine.put(game+0x4e0,'II',1,3);machine.put(game+0xadf,'B',state);machine.put(game+0xad8,'B',suppression);machine.u.reg_write(r.UC_X86_REG_R13,game);machine.u.reg_write(r.UC_X86_REG_EAX,state);awards=[];choices=[]
     def rounded():
      value=machine.xf(r.UC_X86_REG_XMM0);machine.sx(r.UC_X86_REG_XMM0,math.floor(value+.5))
     def xp():
      awards.append(machine.u.reg_read(r.UC_X86_REG_EDX))
      if alter:machine.put(game+0x4e0,'II',machine.get(game+0x4e0,'I')[0]+1,0);machine.put(game+0xadf,'B',2)
     def choice():choices.append([machine.u.reg_read(r.UC_X86_REG_EDX)&255,machine.u.reg_read(r.UC_X86_REG_R8D)&255])
     machine.seams.update({0x145c0a41d:rounded,0x145911e80:xp,0x14595ca60:choice});machine.run(0x145907959,[0x145907a7c]);count=initial if state==1 else 0
     expected=[]
     for i in range(count):
      level=1+i if alter else 1;experience=3 if i==0 or not alter else 0;n=f(max(level-1,0));quadratic=f(f(n*f(.35))*n);linear=f(f(n*4)+5);threshold=int(math.floor(f(quadratic+linear)+.5));expected.append(max(threshold-experience,1))
     assert awards==expected,(initial,state,suppression,alter,awards,expected);assert machine.get(game+0xa6c,'I')[0]==(0 if count else initial);pending=(0xffffffff+count)&0xffffffff
     admitted=bool(count and pending and not suppression and not alter);assert choices==([[2,1]]if admitted else[]);cases+=1
 # Current mode2 forwards0.25 to the shared choice builder. Scope ends before
 # that builder, whose generation/eligibility belongs to its current owner.
 machine.family='choice-input'
 for mode in [1,2]:
  machine.reset();machine.u.reg_write(r.UC_X86_REG_RCX,machine.game);machine.u.reg_write(r.UC_X86_REG_EDX,mode);machine.u.reg_write(r.UC_X86_REG_R8D,1);machine.run(0x14595ca60,[0x14595cb06]);assert machine.xf(r.UC_X86_REG_XMM2)==(0. if mode==1 else .25);cases+=1
 return cases


def magnet(machine):
 machine.family='magnet';cases=0;mask=(1<<64)-1
 def rng(state):
  a,b,c,d=state;v=((a+d)&mask);value=(((v<<23)|(v>>41))+a)&mask;shift=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=shift;d=((d<<45)|(d>>19))&mask;return[a,b,c,d],f((value>>40)*2**-24)
 seeds=[[1,2,3,4],[0,1,2,1<<40],[0,1,2,(1<<40)-(1<<17)],[0,1,2,(1<<40)+(1<<17)],[mask,mask,mask,mask]]
 for state in seeds:
  for deadlines in [[],[9.],[10.],[11.],[9.,1.],[11.,1.]]:
   machine.reset();game=machine.game;array=machine.base+0x60000;point=array+0x1000;machine.put(point,'3f',3.,4.,5.);machine.put(game+0xa4c,'f',10.);machine.put(game+0x7b0,'QQ',array,len(deadlines));machine.put(game+0x9b8,'4Q',*state)
   for i,t in enumerate(deadlines):machine.put(array+i*8,'f',t)
   captures=[]
   def memmove():
    dest=machine.u.reg_read(r.UC_X86_REG_RCX);src=machine.u.reg_read(r.UC_X86_REG_RDX);n=machine.u.reg_read(r.UC_X86_REG_R8);machine.u.mem_write(dest,bytes(machine.u.mem_read(src,n)))
   def pickup():captures.append([machine.u.reg_read(r.UC_X86_REG_EDX),*machine.get(machine.u.reg_read(r.UC_X86_REG_R9),'3f')])
   machine.seams[0x145c0a3ed]=memmove;machine.seams[0x145944310]=pickup;machine.u.reg_write(r.UC_X86_REG_RCX,game);machine.u.reg_write(r.UC_X86_REG_RDX,point);machine.run(0x14593d3f0)
   due=bool(deadlines and deadlines[0]<=10.);nextstate,unit=rng(state);success=due and unit<.5
   assert machine.get(game+0x9b8,'4Q')==tuple(nextstate if due else state);assert machine.get(game+0x7b8,'Q')[0]==len(deadlines)-int(success);assert captures==([[6,1.,5.5,5.]]if success else[]);cases+=1
 return cases


def constructor(machine,zones,raw,graph):
 machine.family='constructor';cases=0
 for zone in zones:
  zi=zone['index']
  for ei in sorted(set(zone['selected_indices'])):
   for seed in [1,0x123456789abcdef,0xfedcba9876543210]:
    machine.reset();game,frame=machine.game,machine.frame;enemy=zone['enemies'][ei];definition=int(enemy['record']['va'],16);scalars={};presentation=[]
    machine.put(game+0x670,'QQ',machine.lairs,1);machine.put(machine.lairs+0x10,'Q3ff',ei,1.,2.,3.,20.);machine.put(game+0x560,'QQQ',128,machine.actor,0);machine.put(game+0xa4c,'f',20.);machine.put(game+0xac0,'f',1.);machine.put(game+0x2ca,'HHH',100,100,100);machine.put(game+0x9b8,'4Q',seed,2,3,4)
    machine.put(frame+0x438,'Q',game);machine.put(frame+0x2f0,'Q',game+0xa4c);machine.u.reg_write(r.UC_X86_REG_RDI,game);machine.u.reg_write(r.UC_X86_REG_R13,0x146bf2630)
    machine.put(game+0x2a8,'QQ',*zone['key_pair'])
    def unit():
     sp=machine.u.reg_read(r.UC_X86_REG_RSP);presentation.append([machine.u.reg_read(r.UC_X86_REG_RDX),machine.u.reg_read(r.UC_X86_REG_R8D),machine.u.reg_read(r.UC_X86_REG_R9D),machine.get(sp+0x28,'f')[0],machine.get(sp+0x30,'f')[0],machine.get(sp+0x38,'B')[0]])
    machine.seams[0x14593c570]=unit
    machine.observers[0x145906bb5]=lambda:scalars.update(health=machine.xf(r.UC_X86_REG_XMM0))
    machine.observers[0x145906bc3]=lambda:scalars.update(damage=machine.xf(r.UC_X86_REG_XMM0))
    machine.run(0x145906a63,[0x145906b00]);actor=machine.actor;guid=0xf130000000000000|((enemy['id']&0xffffff)<<24)|1
    assert machine.get(game+0x570,'Q')[0]==1 and machine.get(machine.lairs,'QQ')==(1,guid)
    assert machine.get(actor+0xf0,'QQ')==(guid,definition);assert machine.get(actor+0x158,'fff')==(scalars['health'],scalars['health'],scalars['damage'])
    assert machine.get(actor+0x174,'3f')==(1.,2.,3.) and machine.get(actor+0x180,'3f')==(1.,2.,3.)
    assert machine.get(actor+0x18c,'fff')==(20.,0.,20.);assert machine.get(actor+0xa8,'B')[0]==0;assert machine.get(actor+0x90,'Q')[0]==0
    assert presentation[0][1:3]==[enemy['id'],enemy['words'][9]] and presentation[0][3]==f(fb(enemy['words'][10])*f(1.35)) and presentation[0][4]==scalars['health'] and presentation[0][5]==1
    # Constructor chooses a real current signature and its selected list before
    # returning the lair spawn. The separate input suite owns exact selectors.
    n=machine.get(actor+0x78,'Q')[0];ptr=machine.get(actor+0x70,'Q')[0];signature=next(g for g in graph['guardians']if g['enemy_id']==enemy['id'])
    candidates=[(int(v[0]['record']['va'],16),len(v))for v in signature['variants']if v]
    assert(ptr,n)in candidates,(zi,ei,ptr,n,candidates)
    state=[seed,2,3,4];mask=(1<<64)-1
    def next_value():
     a,b,c,d=state;v=(a+d)&mask;out=((((v<<23)|(v>>41))+a)&mask);shift=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=shift;d=((d<<45)|(d>>19))&mask;state[:]=[a,b,c,d];return out
    while True:
     value=next_value();facing=f(f(fb(0x3f800000|(value>>41))-1.)*fb(0x40c90fdb))
     if facing<fb(0x40c90fdb):break
    while True:
     random=next_value()
     if not random&(1<<57):break
    variant=(random>>58)%len(signature['variants']);expected=signature['variants'][variant]
    assert(ptr,n)==(int(expected[0]['record']['va'],16),len(expected))
    assert machine.get(game+0x9b8,'4Q')==tuple(state) and machine.get(actor+0x1bc,'f')[0]==facing
    cases+=1
 return cases


def candidate_boundaries(machine):
 machine.family='candidate-boundaries';cases=0
 for flag in [0,1,2,255]:
  for value in [0.,-1.,1.,math.inf,-math.inf,math.nan]:
   machine.reset();out=machine.actor;iterator=out+0x100;record=out+0x1000;machine.put(record+0x48,'fB',value,flag);machine.put(iterator,'QQQ',record,record+80,0);machine.u.reg_write(r.UC_X86_REG_RCX,out);machine.u.reg_write(r.UC_X86_REG_RDX,iterator);machine.run(0x1459d2440);n=machine.get(out+16,'Q')[0];assert n==int(flag==1 and math.isfinite(value));cases+=1
 return cases


def stage_order(machine):
 machine.family='stage-gates';cases=0
 # Entry modes other than active skip the entire world schedule and reach
 # strength with their unchanged mode; strength independently requires mode1.
 for state in range(6):
  machine.reset();machine.put(machine.game+0xadf,'B',state);machine.u.reg_write(r.UC_X86_REG_RCX,machine.game)
  end=machine.run(0x1458fb907,[0x1458fb946,0x145907959]);assert(end==0x1458fb946)==(state==1);cases+=1
 for dead in [0,1,2,255]:
  machine.reset();machine.put(machine.game+0xadb,'B',dead);machine.put(machine.frame+0x438,'Q',machine.game)
  end=machine.run(0x145904118,[0x14590412c,0x145907826]);assert(end==0x145907826)==bool(dead);cases+=1
 # The current producer order consumes rune RNG and sampling/allocation
 # requests before construction. Terrain and shared pickup creation remain
 # explicit seams; timer/count/order instructions all execute from the EXE.
 machine.family='pickup-tail';profiles=0
 for due_rune in [False,True]:
  for due_chest in [False,True]:
   for due_magnet in [False,True]:
    for seed in [1,0x12345678,0x8000000000000001]:
     machine.reset();game,frame=machine.game,machine.frame;calls=[];samples=[]
     machine.put(frame+0x438,'Q',game);machine.put(frame+0x2f0,'Q',game+0xa4c);machine.put(game+0xa4c,'f',60.);machine.put(game+0xa9c,'ff',0. if due_rune else 100.,0. if due_chest else 100.)
     machine.put(game+0x9b8,'4Q',seed,2,3,4);machine.put(game+0x7b0,'QQ',machine.lairs,1);machine.put(machine.lairs,'ff',0.,0. if due_magnet else 100.)
     machine.u.reg_write(r.UC_X86_REG_RAX,game);machine.sx(r.UC_X86_REG_XMM0,60.)
     def sample():
      samples.append([machine.xf(r.UC_X86_REG_XMM2),machine.xf(r.UC_X86_REG_XMM3)]);machine.put(machine.u.reg_read(r.UC_X86_REG_RCX),'3f',1.,2.,3.)
     def pickup():calls.append(machine.u.reg_read(r.UC_X86_REG_RDX))
     machine.seams.update({0x14593e800:sample,0x145944310:pickup,0x14598ddd0:lambda:machine.u.reg_write(r.UC_X86_REG_RAX,0),0x145912fa0:lambda:None,
      0x145c0a3ed:lambda:None})
     machine.run(0x145906574,[0x145906a63]);expected=([None]if due_rune else[])+([2]if due_chest else[])+([6]if due_magnet else[])
     assert len(calls)==len(expected)and all(actual in[3,4,5]if want is None else actual==want for actual,want in zip(calls,expected))
     assert samples==([[15.,40.]]if due_rune else[])+([[18.,50.]]if due_chest else[])+([[25.,50.]]if due_magnet else[])
     assert machine.get(game+0xa9c,'ff')==(105. if due_rune else 100.,130. if due_chest else 100.)
     assert machine.get(game+0x7b8,'Q')[0]==int(not due_magnet);profiles+=1
 # Native completion executes after construction, before strength. A newly
 # completed run changes mode to5; strength therefore keeps pending awards.
 machine.family='completion';completion=0
 for phase in [0,1,2]:
  for state in [1,2,4,5]:
   for endless in [0,1]:
    machine.reset();game=machine.game;calls=[];machine.put(game+0x988,'I',phase);machine.put(game+0xad0,'B',endless);machine.put(game+0xadf,'B',state);machine.put(game+0x620,'QQQ',4,machine.actor,0);machine.put(game+0x638,'QQQ',4,machine.actor+0x1000,0);machine.u.reg_write(r.UC_X86_REG_RDI,game)
    for a in [0x1458f0360,0x1458c2730,0x145913de0]:machine.seams[a]=lambda a=a:calls.append(hex(a))
    machine.run(0x145907826,[0x145907959]);completed=phase!=0 and state==1 and not endless;assert machine.get(game+0xadf,'B')[0]==(5 if completed else state);assert calls==(['0x1458f0360','0x1458c2730','0x145913de0']if completed else[]);completion+=1
 return dict(entry_and_suppression_gates=cases,pickup_order_profiles=profiles,completion_profiles=completion)


def initial_suppression(machine):
 machine.family='suppression-defaults';machine.reset();frame,game=machine.frame,machine.game
 machine.u.mem_write(frame+0x28,bytes([255])*0xae0);machine.put(frame+0xc68,'Q',game)
 machine.run(0x1458fa88c,[0x1458fa896]);machine.run(0x1458fab8e,[0x1458fab98]);machine.run(0x1458fb08f,[0x1458fb0a8])
 assert machine.get(game+0xad8,'B')[0]==0;assert machine.get(game+0xada,'4B')==(0,0,0,255)
 assert machine.get(game+0xad5,'B')[0]==255 and machine.get(game+0xade,'B')[0]==255
 return 1


def presentation_boundaries(machine):
 machine.family='unit-level';cases=0
 for level in [0,1,60,61,62,63,0xfffffffd,0xffffffff]:
  for offset in [0,1,2,255]:
   machine.reset();machine.put(machine.game+0x4e0,'I',level);machine.put(machine.frame+0xf0,'B',offset);machine.u.reg_write(r.UC_X86_REG_RCX,machine.game)
   machine.run(0x14593c5a2,[0x14593c5bf]);assert machine.u.reg_read(r.UC_X86_REG_R15D)==min((level+3*offset)&0xffffffff,63);cases+=1
 machine.family='announcement-gate'
 for clock in [0.,20.,fb(bits(21.)-1),21.,fb(bits(21.)+1),math.nan]:
  machine.reset();machine.sx(r.UC_X86_REG_XMM0,clock);end=machine.run(0x145907253,[0x145906b00,0x145907260]);assert(end==0x145907260)==(clock>21.);cases+=1
 return cases


def source_checks():
 base=ROOT/'crates/azeroth-survivors-re/src';checks={
  'guardians/mod.rs':['RESPAWN_SECONDS: f32 = 180.0','INITIAL_SPAWN_SECONDS: f32 = 20.0','clock_seconds >= self.respawn_at','enemy.flag_4c == 1 && enemy.raw_48.is_finite()','candidates[slot % candidates.len()]','guardian_health_with_powf','guardian_damage_with_powf','definition.scale * 1.35','signatures::choose_variant','input.clock_seconds > 21.0','self.guardian_kills.wrapping_add(1)'],
  'guardians/placement.rs':['for fraction in [0.7_f32, 0.62, 0.54, 0.46, 0.38]','(-2..=2)','(z - center_z).abs() < 30.0','let fallback_radius = 0.5 * radius','point.index == slot'],
  'guardians/ai.rs':['(dy * dy + dx * dx).sqrt()','distance_xy(home, player) > LEASH_RADIUS','distance_xy(current, home) <= 3.0','distance_xy(current, player) <= 20.0','health < max_health'],
  'guardians/rewards.rs':['port.play_sound(GUARDIAN_DEATH_SOUND_ID)','kills_after_increment.wrapping_mul(5).wrapping_add(25)','let count = std::mem::take(pending_strength)','level_and_experience()','generation_parameter: 0.25','mode: 2','pause: true','if deadline > now','if draw_unit_24() >= 0.5','deadlines.remove_first()'],
  'gameplay/mechanics/guardians.rs':['if self.is_showcase()','spawn_due_with_signatures(','self.rng.words = rng.state','native_level: native_actor_level(self.level, 1)','guardian.ai.evaluate(','frame.engaged.push(row.guid)','system.guardian_died(','self.rewards.push(GuardianRewardEvent::Sound(id))','self.events.push(RunEvent::PlaySound(id))','RunEvent::Account','fn queue_strength_award('],
  'gameplay/mechanics.rs':['self.guardian_death(guid, position, rng)','self.spawn_due_guardians(world)','self.drain_guardian_strength()','run_level.wrapping_add(3 * u32::from(elite)).min(63)'],
  'gameplay/client/events.rs':['RunEvent::PlaySound(sound_id)=>{packets.0.push(SessionEvent::PlaySound {sound_id});None}'],
  'gameplay/notifications.rs':['"guardian" => "{name} is slain! Its hoard and a level."'],
 }
 compact=lambda v:re.sub(r'\s+','',v)
 for path,tokens in checks.items():
  text=compact((base/path).read_text())
  for token in tokens:assert compact(token)in text,(path,token)
 text=(base/'guardians/rewards.rs').read_text();order=['port.announce(','port.play_sound(','port.account_event(','port.create_gold_pickup(','port.attempt_scheduled_magnet(','port.queue_strength_award('];assert[text.index(t)for t in order]==sorted(text.index(t)for t in order)
 # Native spawn->completion->strength order affects actual UNIT level and RNG.
 # This guard intentionally rejects a future source reordering.
 text=(base/'gameplay/mechanics.rs').read_text();order=['self.spawn_scheduled_world(delta, player, velocity, world)','self.finish_boss_completion(world)','self.drain_guardian_strength()'];assert[text.index(t)for t in order]==sorted(text.index(t)for t in order),'Current native schedule precedes completion and captured strength awards'
 order=['self.spawn_due_bosses(player, velocity, world)','self.tick_runes(player, world)','self.tick_chests(player, velocity, world)','self.tick_forced_magnet(player, world)','self.spawn_due_guardians(world)'];assert[text.index(t)for t in order]==sorted(text.index(t)for t in order),'Current native guardians follow scheduled pickups'
 assert 'if self.dead || self.completed || self.is_paused_for_choice() || delta <= 0.0' in text
 return dict(files=len(checks),guards=sum(map(len,checks.values()))+4)


def leash_retarget(machine):
    machine.family = 'leash-retarget'
    at = machine.frame + 0x800
    cases = [
        (1, 1, 100.0, [(90.0, 1), (10.0, 2), (80.0, 1)], 2),
        (1, 1, 100.0, [(50.0, 1), (-50.0, 1)], 0),
        (1, 1, 100.0, [(97.5, 1), (98.0, 1)], 0),
        (1, 1, 100.0, [(fb(bits(97.5) + 1), 1), (10.0, 4)], None),
        (1, 1, 100.0, [], None),
        (1, 1, 97.5, [(1.0, 1)], None),
        (0, 1, 100.0, [(1.0, 1)], None),
        (1, 0, 100.0, [(1.0, 1)], None),
    ]
    for mode, awake, player, heroes, selected in cases:
        machine.reset()
        frame, actor = machine.frame, machine.actor
        machine.put(frame + 0x388, 'B', mode)
        machine.put(frame + 0x70, 'ff', player, 0.0)
        machine.put(frame + 0xc8, 'fff', player, 0.0, 3.0)
        machine.put(frame + 0x2f0, 'fff', 0.0, 0.0, 50.0)
        machine.put(frame + 0x100, 'Q', at)
        machine.put(frame + 0x60, 'Q', at + len(heroes) * 16)
        machine.put(actor + 0xc8, 'B', awake)
        machine.put(actor + 0x118, 'Q', 9)
        machine.put(actor + 0x1d4, 'f', 33.0)
        for index, (x, phase) in enumerate(heroes):
            machine.put(at + index * 16, 'fffB', x, 0.0, 200.0 + index, phase)
        machine.u.reg_write(r.UC_X86_REG_R14, actor)
        machine.sx(r.UC_X86_REG_XMM6, 10.0)
        machine.run(0x145f25b94, [0x145f25c35])
        if selected is None:
            assert machine.get(actor + 0x118, 'Q') == (9,)
            assert machine.get(actor + 0x1d4, 'f') == (33.0,)
            assert machine.get(frame + 0xc8, 'fff') == (player, 0.0, 3.0)
        else:
            assert machine.get(actor + 0x118, 'Q') == (selected,)
            assert machine.get(actor + 0x1d4, 'f') == (10.0,)
            assert machine.get(frame + 0xc8, 'fff') == (heroes[selected][0], 0.0, 200.0 + selected)
        assert machine.get(frame + 0x70, 'ff') == (player, 0.0)
    return len(cases)


def leash_decisions(machine):
    machine.family = 'leash-decisions'
    cases = [
        (0, 0.0, 20.0, 100.0, 1),
        (0, 0.0, fb(bits(20.0) + 1), 100.0, 0),
        (0, 3.0, 20.0, 100.0, 1),
        (0, fb(bits(3.0) + 1), 1.0, 100.0, 0),
        (0, 40.0, 200.0, 99.0, 1),
        (1, 0.0, 97.5, 72.0, 3),
        (1, 0.0, fb(bits(97.5) + 1), 72.0, 2),
    ]
    for awake, x, player, health, result in cases:
        machine.reset()
        actor, frame = machine.actor, machine.frame
        rows = machine.allocate(3 * 56)
        for index, timer in enumerate((3.0, 8.0, 11.0)):
            machine.put(rows + index * 56 + 48, 'f', timer)
        machine.put(actor + 0x90, 'QQ', rows, 3)
        machine.put(actor + 0xc8, 'B', awake)
        machine.put(actor + 0x198, 'ff', health, 100.0)
        machine.put(actor + 0x1c0, 'ff', x, 0.0)
        machine.put(frame, 'ff', 0.0, 0.0)
        machine.put(frame + 16, 'ff', player, 0.0)
        machine.u.reg_write(r.UC_X86_REG_RCX, actor)
        machine.u.reg_write(r.UC_X86_REG_RDX, frame)
        machine.u.reg_write(r.UC_X86_REG_R8, frame + 16)
        machine.run(0x145e5ff00)
        assert machine.u.reg_read(r.UC_X86_REG_AL) == result
        assert machine.get(actor + 0xc8, 'B') == (int(result in (1, 3)),)
        assert machine.get(actor + 0x198, 'f') == (100.0 if result == 2 else health,)
        if result == 2:
            capacity, pointer, count = machine.get(actor + 0x78, 'QQQ')
            assert capacity == count == 3
            assert machine.get(pointer, 'fff') == (1.5, 4.0, 5.5)
    return len(cases)


def leash_return_movement(machine):
    machine.family = 'leash-movement'
    cases = [
        (False, 2.0, 0.0, False, False),
        (False, fb(bits(2.0) + 1), 0.0, False, True),
        (False, 4.0, 2.0, False, False),
        (False, 4.0, 1.0, True, True),
        (True, 0.0, 2.0, False, True),
        (True, 2.0, 2.0, False, True),
        (True, 3.0, 2.0, True, True),
    ]
    for reset, distance, old_duration, whirlwind, queued in cases:
        machine.reset()
        actor, frame = machine.actor, machine.frame
        row = machine.allocate(40)
        resets = machine.allocate(8)
        machine.put(frame + 0x3d0, 'Q', actor)
        machine.put(frame + 0x390, 'fff', distance, 0.0, 7.0)
        machine.put(frame + 0x2f0, 'fff', 0.0, 0.0, 3.0)
        machine.put(frame + 0x2d8, 'QQQ', 1, row, 0)
        machine.put(frame + 0x138, 'QQQ', 1, resets, 0)
        machine.put(actor + 0x110, 'Q', 123)
        machine.put(actor + 0xd8, 'I', 1)
        machine.put(actor + 0x1a4, 'f', 2.0)
        machine.put(actor + 0x1cc, 'fff', 9.0, old_duration, 50.0)
        machine.put(actor + 0x214, 'f', 15.0 if whirlwind else 0.0)
        machine.sx(r.UC_X86_REG_XMM6, 10.0)
        machine.sx(r.UC_X86_REG_XMM9, distance)
        end = machine.run(0x145f261da if reset else 0x145f25cd7,
                          [0x145f24de9, 0x145f252cc, 0x145f26406])
        assert (end != 0x145f24de9) == queued
        assert machine.get(frame + 0x2e8, 'Q') == (int(queued),)
        assert machine.get(frame + 0x148, 'Q') == (int(reset),)
        assert machine.get(resets, 'Q') == (123 if reset else 0,)
        if queued:
            speed = f(2.0 * f(1.35)) if whirlwind else 2.0
            duration = f(distance / speed)
            assert machine.get(actor + 0x1cc, 'fff') == (
                10.0, duration, f(10.0 + duration) if reset else 50.0,
            )
            assert machine.get(row, 'Qffffff') == (123, distance, 0.0, 7.0, 0.0, 0.0, 3.0)
            assert machine.get(row + 0x20, 'f') == (duration,)
        assert machine.get(actor + 0xd8, 'I') == (0 if reset else 1,)
    return len(cases)


def leash_reset_publication(machine):
    machine.family = 'leash-reset-publication'
    cases = [
        (123, 72.5, [0, 8647, 8056, 100, 0], [8056, 100], 73),
        (123, 100.0, [8647], [], 100),
        (123, 0.0, list(range(1, 17)), list(range(1, 17)), 0),
        (321, 72.5, [8056], [], None),
    ]
    for guid, maximum, spells, removals, health in cases:
        machine.reset()
        actor, frame, game = machine.actor, machine.frame, machine.game
        resets = machine.allocate(8)
        machine.put(resets, 'Q', guid)
        machine.put(frame + 0x138, 'QQQ', 1, resets, 1)
        machine.put(frame + 0x3e0, 'Q', game)
        machine.put(game + 0x6d8, 'QQ', actor, 1)
        machine.put(actor + 0x110, 'Q', 123)
        machine.put(actor + 0x158, 'I' * len(spells), *spells)
        machine.put(actor + 0x198, 'ff', 12.0, maximum)
        calls = []
        def aura():
            assert machine.u.reg_read(r.UC_X86_REG_RDX) == guid
            assert machine.u.reg_read(r.UC_X86_REG_R9D) == 0
            calls.append(('aura', machine.u.reg_read(r.UC_X86_REG_R8D)))
        def fields():
            assert machine.u.reg_read(r.UC_X86_REG_DX) == 22
            calls.append(('fields', machine.u.reg_read(r.UC_X86_REG_R8D)))
        machine.seams[0x145f35690] = aura
        machine.seams[0x145fd87d0] = fields
        machine.seams[0x1463a558f] = lambda: machine.sx(r.UC_X86_REG_XMM0, math.ceil(machine.xf(r.UC_X86_REG_XMM0)))
        machine.sx(r.UC_X86_REG_XMM11, fb(0x4f7fffff))
        machine.run(0x145f29603, [0x145f29785, 0x145f298cf])
        expected = [('aura', spell) for spell in removals]
        if health is not None:
            expected.append(('fields', health))
        assert calls == expected
    return len(cases)


def check_leash():
    target = latest_target(verify=False)
    assert target['sha256'] == '6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa'
    image = target_bytes(target)
    pe = importlib.import_module('inventory-executable').PE(image)

    def raw(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + length]

    ranges = {
        'retarget': (0x145efd4c0, 0x145efd635),
        'speed': (0x145f06ca0, 0x145f06d1c),
        'awake': (0x145e5ff00, 0x145e602b6),
        'retarget-admission': (0x145f25b94, 0x145f25c35),
        'sleeping-return': (0x145f25cd7, 0x145f25e88),
        'leash-return': (0x145f261da, 0x145f26406),
        'enqueue': (0x145f26541, 0x145f26551),
        'increment': (0x145f252c2, 0x145f252cc),
        'reset-publication': (0x145f29603, 0x145f29785),
    }
    table = 0x147af2f04
    assert [table + cell for cell in struct.unpack('<iiii', raw(table, 16))] == [
        0x145f25cd7, 0x145f25e88, 0x145f261da, 0x145f25f23,
    ]
    machine = Machine(raw, ranges)
    counts = {
        'retarget': leash_retarget(machine),
        'decisions': leash_decisions(machine),
        'movement': leash_return_movement(machine),
        'reset_publication': leash_reset_publication(machine),
    }
    base = ROOT / 'crates/azeroth-survivors-re/src'
    guardian = (base / 'gameplay/mechanics/guardians.rs').read_text()
    reset = guardian[guardian.index('GuardianDecision::Reset { restored_health }'):]
    assert reset.index('row.actor.slow =') < reset.index('return_home(row, home, self.clock, true, frame)')
    assert 'guardian_leash_target([home.x, home.y, home.z])' in guardian
    assert 'gpos(leash_player)' in guardian and 'return_home(row, home, self.clock, false, frame)' in guardian
    assert 'callbacks::DARKMANTLE_AURA' in guardian
    assert 'fields: vec![(22, row.maximum_health.ceil() as u32)]' in guardian
    actor_frame = (base / 'gameplay/mechanics/actor_frame.rs').read_text()
    assert actor_frame.index('in frame.melee') < actor_frame.index('self.coop.targets.extend(frame.guardian_retargets)')
    assert actor_frame.index('self.resolve_guardian_engagements') < actor_frame.index('self.resolve_guardian_resets')
    print(json.dumps({
        'cases': counts,
        'instructions': sum(len(rows) for rows in machine.visited.values()),
        'range_sha256': {key: hashlib.sha256(raw(start, end - start)).hexdigest()
                         for key, (start, end) in ranges.items()},
    }, indent=2))


def main():
 ap=argparse.ArgumentParser(description=__doc__);modes=ap.add_mutually_exclusive_group();modes.add_argument('--stage',action='store_true');modes.add_argument('--leash',action='store_true');args=ap.parse_args()
 if args.leash:
  check_leash()
  return
 mod=load();target,raw,span,graph,headers=mod.recover();mod.check_graph(graph,headers);owners_record=current_owners(mod,target,raw,span)
 zones=catalog(raw,span);assert{zone['enemies'][ei]['id']for zone in zones for ei in zone['selected_indices']}=={row['enemy_id']for row in graph['guardians']}
 machine=Machine(raw);counts={}
 for name,arguments in [('arithmetic',(zones,)),('placement',(zones,raw)),('awake',()),('due_and_death',()),('constructor',(zones,raw,graph)),('rewards',(raw,)),('magnet',()),('candidate_boundaries',()),('stage_order',()),('presentation_boundaries',()),('initial_suppression',())]:
  counts[name]=globals()[name](machine,*arguments);print(name,counts[name],flush=True)
 source=source_checks();out=STAGE if args.stage else KEPT
 if args.stage:out.mkdir(parents=True,exist_ok=True)
 if(out/'rea-provenance.json').exists()or not args.stage:mod.verify_rea_operations(raw,out,target['sha256'])
 # Explicit existing owners only; ambient unrelated extracts never select the
 # byte provenance of this fixture's executed paths.
 owners={};new={};retained={}
 for name in ['guardian-decision-reset','guardian-selection-constructor','guardian-selector']:
  path=ROOT/'docs/analysis/evidence/0.112.0/raid-inputs'/(name+'.asm')
  for line in path.read_text().splitlines():
   hit=re.match(r'^([0-9a-f]+): ([0-9a-f]+) ',line)
   if hit:retained[int(hit[1],16)]=(bytes.fromhex(hit[2]),'../raid-inputs/'+path.name)
 path=ROOT/'docs/analysis/evidence/0.112.0/raid-wards/unit-presentation.asm'
 for line in path.read_text().splitlines():
  hit=re.match(r'^([0-9a-f]+): ([0-9a-f]+) ',line)
  if hit:retained[int(hit[1],16)]=(bytes.fromhex(hit[2]),'../raid-wards/'+path.name)
 path=ROOT/'docs/analysis/evidence/0.112.0/raid-lifecycles/selected-native.asm'
 for line in path.read_text().splitlines():
  hit=re.match(r'^([0-9a-f]+): ([0-9a-f]+) ',line)
  if hit:retained[int(hit[1],16)]=(bytes.fromhex(hit[2]),'../raid-lifecycles/'+path.name)
 for rows in machine.visited.values():
  for a,value in rows.items():
   if a in owners:continue
   previous=retained.get(a)
   if previous and previous[0]==value:owners[a]=previous[1]
   else:owners[a]='selected-native.asm';new[a]=value
 assembly=''
 for a,value in sorted(new.items()):
  ins=list(machine.md.disasm(value,a));assert sum(i.size for i in ins)==len(value);assembly+=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in ins)
 if args.stage:(out/'selected-native.asm').write_text(assembly)
 else:assert(out/'selected-native.asm').read_text()==assembly
 traces={}
 for name,rows in machine.visited.items():
  intervals=[]
  for a,value in sorted(rows.items()):
   owner=owners[a]
   if intervals and intervals[-1][1]==a and intervals[-1][2]==owner:intervals[-1][1]+=len(value)
   else:intervals.append([a,a+len(value),owner])
  traces[name]=[dict(**span(a,b-a),assembly=owner)for a,b,owner in intervals]
 catalog_record=dict(target_version=target['version'],target_sha256=target['sha256'],source_enemy_records_checked=148,live_enemy_catalog_agrees=True,
  zones=[dict(index=z['index'],key=z['key'],record=z['record'],guardian_indices=z['selected_indices'],guardian_ids=[z['enemies'][i]['id']for i in z['selected_indices']],explicit_points=[[i,bits(x),bits(y)]for i,x,y in z['points']],hp_knots_bits=z['knots'],zone_scale_bits=z['zone_scale_bits'],enemies=[dict(index=e['index'],id=e['id'],record=e['record'])for e in z['enemies']])for z in zones])
 doc=json.dumps(catalog_record,indent=2)+'\n'
 if args.stage:(out/'catalog.json').write_text(doc)
 else:assert(out/'catalog.json').read_text()==doc
 manifest=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,cases=counts,source_checks=source,visited_instruction_ranges=traces,current_owner_provenance=owners_record,
  current_entry_contracts={k:dict(**span(a,b-a))for k,(a,b)in RANGES.items()},
  native_order={'entry_mode_gate':'0x1458fb937','scheduling_suppression_gate':'0x145904118','rune_timer':'0x145906574','chest_timer':'0x1459067a5','forced_magnet':'0x1459068e6','guardian_unit_call':'0x145906c44','completion':'0x145907826','strength_entry':'0x145907959','shared_game_level':'0x4e0','current_unit_level_read':'0x14593c5ac'},
  seams={'heap':['0x140002200 marker','0x1400021c0 allocation','0x1400021d0 free'],
   'CRT':['0x145c0a417 cosf','0x145c0a411 sinf','0x145c0a41d roundf','0x145c0a465 powf injected','0x145c0a3db memcpy','0x145c0a3ed memmove'],
   'terrain':['0x1458a0b40 primary height','0x1458a4d60 secondary height'],
   'output_callbacks':['0x14593c570 unit presentation captures inputs; canonical raid-wards owns its body and its level prefix separately executes','0x1458c22c0 announcement packet','0x1458c3120 sound packet','0x14598ddd0 localization','0x14598e180 notice formatting','0x145912fa0 notice publication','0x145944310 pickup creation','0x145911e80 XP provider','0x14595ca60 jewelry request; its prefix separately executes','0x14593e800 nearby pickup sampler captures radius inputs','0x1458f0360 completion finalization','0x1458c2730 completion packet','0x145913de0 completion serialization']},
  limits=['Actual current zone lookup, candidate filter, health-knot collector, guardian scaling and all selected construction/wake/lair/reward instructions execute as original bytes.',
   'Heap, packets, localized formatting and terrain replies are synthetic seams; original and rebuilt games/Rust code never execute.',
   'Power results are injected, isolating native caller arithmetic from Windows CRT powf parity.',
   'Shared choice generation/eligibility, pickup engine, audio playback, rendering and full engine/runtime parity retain independent owners.',
   'Source historical0972 constants/fixtures retain their original provenance; this report does not relabel them.'])
 doc=json.dumps(manifest,indent=2)+'\n'
 if args.stage:(out/'manifest.json').write_text(doc)
 else:assert(out/'manifest.json').read_text()==doc
 print('Current guardian provider checks passed; no compilation/game')
if __name__=='__main__':main()
