#!/usr/bin/env python3
"""Current AS death-reward pickup providers; synthetic CPU checks, no compiler/game."""
from portable_paths import portable_json
from script_sources import load_script
import argparse, hashlib, json, math, re, struct, sys
from pathlib import Path
from artifact_history import read_artifact
from coverage_common import ROOT,target_bytes
def load(name,path):
    m = load_script(name, ROOT/path);return m
base=load('reward_boss_cpu','scripts/check-raid-boss-lifecycle.py')
r=base.r;f=base.f;bits=base.bits;fb=base.fb
base.RANGES=dict(base.RANGES,**{'reward-pickup':(0x145944310,0x14594544f),'reward-object':(0x14594f020,0x14594fb4d),'guardian-magnet':(0x14593d3f0,0x14593d4f6)})
STAGE=ROOT/'runtime/analysis/staging/native-evidence/raid-reward-pickups'
KEPT=ROOT/'docs/analysis/evidence/0.112.0/raid-reward-pickups'

class Machine(base.Machine):
    def reset_reward(self,zone=0,seed=(1,2,3,4),counter=0,primary=5.,secondary=None,fallback=9.):
        self.reset();self.maps=[];self.packets=[];self.height_calls=[]
        self.world=self.record+0x1000;self.rows=self.base+0x100000;self.packet_rows=self.base+0x110000
        self.put(self.game+0x9b0,'Q',self.world);self.put(self.world+0x68,'q',-1 if secondary is None else 0);self.put(self.world+0xb8,'f',fallback)
        self.put(self.game+0x608,'3Q',128,self.rows,0);self.put(self.game+0x620,'3Q',128,self.packet_rows,0);self.put(self.game+0x9b8,'4Q',*seed);self.put(self.game+0xa78,'I',counter);self.put(self.game+0xa4c,'f',10.)
        def height():
            self.height_calls.append(['primary',bits(self.xf(r.UC_X86_REG_XMM1)),bits(self.xf(r.UC_X86_REG_XMM2))]);self.u.reg_write(r.UC_X86_REG_RAX,int(primary is not None));self.sx(r.UC_X86_REG_XMM0,0. if primary is None else primary)
        def alt():
            self.height_calls.append(['secondary',bits(self.xf(r.UC_X86_REG_XMM2)),bits(self.xf(r.UC_X86_REG_XMM3))]);at=self.u.reg_read(r.UC_X86_REG_RCX);self.put(at,'I',int(secondary is not None));self.put(at+12,'f',0. if secondary is None else secondary)
        def fields():
            destination=self.u.reg_read(r.UC_X86_REG_RCX);self.u.mem_write(destination,bytes(24));self.maps.append(dict(guid=self.u.reg_read(r.UC_X86_REG_R8),fields={}))
        def insert():
            at=self.u.reg_read(r.UC_X86_REG_RDX);key=self.get(at+32,'Q')[0];value=self.u.reg_read(r.UC_X86_REG_R8D);self.maps[-1]['fields'][key]=value;self.u.reg_write(r.UC_X86_REG_RAX,0)
        def packet(kind):
            sp=self.u.reg_read(r.UC_X86_REG_RSP);at=self.u.reg_read(r.UC_X86_REG_R9)if kind==5 else self.get(sp+0x28,'Q')[0]
            self.packets.append(dict(guid=self.u.reg_read(r.UC_X86_REG_RDX),kind=kind,position=list(self.get(at,'3I')),orientation=self.get(sp+0x28,'I')[0]if kind==5 else 0,fields=self.maps[-1]['fields'].copy()))
            self.u.mem_write(self.u.reg_read(r.UC_X86_REG_RCX),bytes(32))
        def wrap():self.u.mem_write(self.u.reg_read(r.UC_X86_REG_RCX),bytes(32))
        def grow(stride):
            at=self.u.reg_read(r.UC_X86_REG_RCX);cap,pointer,n=self.get(at,'3Q');capacity=max(4,cap*2,n+1);new=self.allocate(capacity*stride)
            if n:self.u.mem_write(new,bytes(self.u.mem_read(pointer,n*stride)))
            self.put(at,'2Q',capacity,new)
        self.seams.update({0x145898dc0:lambda:self.u.reg_write(r.UC_X86_REG_RAX,zone),0x1458a0b40:height,0x1458a4d60:alt,
            0x1458c19b0:fields,0x1458de1f0:insert,0x1458c09b0:lambda:packet(3),0x1458c0f20:lambda:packet(5),0x1458c1180:wrap,0x1459c3ba0:lambda:None,
            0x145c0d930:lambda:grow(8),0x145c0d9a0:lambda:grow(24),0x145c0da10:lambda:grow(72),0x145c0dbd0:lambda:grow(32)})
    def create(self,kind,amount,position):
        self.u.reg_write(r.UC_X86_REG_RSP,self.stack);self.put(self.stack,'Q',self.stop);self.put(self.record,'3f',*position);self.u.reg_write(r.UC_X86_REG_RCX,self.game);self.u.reg_write(r.UC_X86_REG_EDX,kind);self.u.reg_write(r.UC_X86_REG_R8D,amount);self.u.reg_write(r.UC_X86_REG_R9,self.record);self.run(0x145944310)
    def logical(self):
        n=self.get(self.game+0x618,'Q')[0];rows=[]
        for i in range(n):
            at=self.rows+72*i;auxcap,auxptr,auxn=self.get(at,'3Q')
            rows.append(dict(flight=self.get(at+0x18,'I')[0],kind=self.get(at+0x20,'I')[0],amount=self.get(at+0x24,'I')[0],guid=self.get(at+0x28,'Q')[0],entry=self.get(at+0x30,'I')[0],position=list(self.get(at+0x34,'3I')),created_at=self.get(at+0x40,'I')[0],auxiliary=list(self.get(auxptr,str(auxn)+'Q'))if auxn else[]))
        return rows

def first_profiles(machine,raw):
    machine.family='reward-profiles';cases=[]
    center=struct.unpack('<3f',raw(0x146bf2630+0xc8,12))
    for kind in [0,1,3,4,5,6]:
        for amount,seed,counter in[(a,s,c)for a in[0,1,3,4,19,20,80,0xffffffff]for s in[[1,2,3,4],[0x123456789abcdef0,0x5555555555555555,0xaaaaaaaaaaaaaaaa,0xfedcba9876543210]]for c in[0,0xffffffff]]:
            machine.reset_reward(seed=seed,counter=counter);machine.create(kind,amount,center);rows=machine.logical();assert len(rows)==1
            assert rows[0]['position']==[bits(center[0]),bits(center[1]),bits(5.)]and rows[0]['amount']==amount and rows[0]['kind']==kind and rows[0]['flight']==0 and rows[0]['created_at']==bits(10.)
            state=list(seed);serial=counter;expected=[]
            descriptors=[(9001,1825 if amount<20 else 16587,bits(.22 if amount<4 else .35 if amount<20 else .9),3,0)]if kind==0 else[(9004,2614,bits(.6),5,0)]if kind==1 else[(9009,342,0x3fa66666,5,0),(9010,3271,bits(1.),5,16),(9011,2232,0x3fcccccd,5,16)]if kind==6 else[{3:(9006,5931,bits(1.),5,0),4:(9007,5995,bits(1.),5,0),5:(9008,5991,bits(1.),5,0)}[kind]]
            for entry,display,scale,object_type,flags in descriptors:
                serial=(serial+1)&0xffffffff;guid=(0xf130000000000000 if object_type==3 else 0xf110000000000000)|(entry<<24)|(serial&0xffffff)
                if object_type==3:
                    fields={2:9,3:entry,4:scale,22:1,28:1,34:1,35:35,46:0x02000002,129:bits(.1),130:bits(.1),131:display,132:display};angle=0.
                else:
                    angle,state=orientation(state);half=f(angle*.5);fields={2:33,3:entry,4:scale,8:display,9:flags,12:bits(f(math.sin(half))),13:bits(f(math.cos(half))),14:1,15:bits(center[0]),16:bits(center[1]),17:bits(5.),18:bits(angle),20:35,21:5}
                expected.append(dict(guid=guid,fields=fields))
            assert machine.maps==expected,(kind,amount,machine.maps,expected);assert rows[0]['guid']==expected[0]['guid']and rows[0]['entry']==descriptors[0][0]
            assert rows[0]['auxiliary']==[row['guid']for row in expected[1:]]
            assert list(machine.get(machine.game+0x9b8,'4Q'))==state and machine.get(machine.game+0xa78,'I')[0]==serial
            assert len(machine.packets)==len(expected)
            cases.append(dict(kind=kind,amount=amount,seed=seed,initial_counter=counter,rows=rows,maps=machine.maps,packets=machine.packets,heights=machine.height_calls,rng=list(machine.get(machine.game+0x9b8,'4Q')),counter=machine.get(machine.game+0xa78,'I')[0]))
    return cases

def orientation(state):
    while True:
        value,state=base.rng_step(state);angle=f(f(fb((value>>41)|0x3f800000)-1.)*fb(0x40c90fdb))
        if fb(0x40c90fdb)>angle:return f(angle+0.),state

def normalized_position(raw,zone,point):
    center=struct.unpack('<3f',raw(0x146bf2630+240*zone+0xc8,12));radius=struct.unpack('<f',raw(0x146bf2630+240*zone+0xd8,4))[0];limit=max(f(radius-2.),1.)
    dx,dy=f(point[0]-center[0]),f(point[1]-center[1]);distance=f(math.hypot(dx,dy));clamp=not limit>=distance
    if clamp:return [f(center[0]+f(f(dx/distance)*limit)),f(center[1]+f(f(dy/distance)*limit))],True
    return list(point[:2]),False

def position_profiles(machine,raw):
    machine.family='reward-position';cases=[]
    for zone in range(12):
        center=struct.unpack('<3f',raw(0x146bf2630+240*zone+0xc8,12));radius=struct.unpack('<f',raw(0x146bf2630+240*zone+0xd8,4))[0]
        for dx,dy in [(0.,0.),(3.,4.),(radius,0.),(radius*2,radius*3),(math.nan,4.)]:
            point=[f(center[0]+dx),f(center[1]+dy),999.];xy,clamp=normalized_position(raw,zone,point)
            for primary,secondary,fallback in[(5.,None,9.),(None,7.,9.),(None,None,9.),(math.nan,None,9.)]:
                for kind in[0,1,3,4,5,6]:
                    machine.reset_reward(zone=zone,primary=primary,secondary=secondary,fallback=fallback);machine.create(kind,80,point);row=machine.logical()[0];expected=[bits(v)for v in xy]+[bits(primary if primary is not None else secondary if secondary is not None else fallback)]
                    assert row['position']==expected,(zone,dx,dy,kind,row['position'],expected)
                    assert len([q for q in machine.height_calls if q[0]=='primary'])==1+int(clamp)
                    assert len([q for q in machine.height_calls if q[0]=='secondary'])==(1+int(clamp)if primary is None and secondary is not None else 0)
                    assert all(packet['position']==expected for packet in machine.packets)
                    cases.append([zone,bits(dx),bits(dy),primary is not None,secondary is not None,kind,expected])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def cap_profiles(machine,raw):
    machine.family='xp-cap';cases=[];center=struct.unpack('<3f',raw(0x146bf2630+0xc8,12))
    for n in [0,1,44,45,46,64]:
        for flights in [False,True]:
            machine.reset_reward();machine.put(machine.game+0x618,'Q',n)
            for i in range(n):
                at=machine.rows+72*i;machine.put(at+0x18,'2I',int(flights and i%2==0),0);machine.put(at+0x24,'I',10);machine.put(at+0x34,'3f',center[0]+float(i-n+1),center[1],0.)
            machine.create(0,7,center);count=machine.get(machine.game+0x618,'Q')[0];changed=[i for i in range(n)if machine.get(machine.rows+72*i+0x24,'I')[0]!=10]
            stationary=[i for i in range(n)if not(flights and i%2==0)]
            merge=len(stationary)>=45;assert count==n+int(not merge);assert changed==([stationary[-1]]if merge else[]),(n,flights,changed)
            assert machine.get(machine.game+0xa78,'I')[0]==int(not merge);assert len(machine.maps)==int(not merge);assert len(machine.height_calls)==int(not merge)
            cases.append([n,flights,count,changed])
    return cases

def cap_order(machine,raw):
    machine.family='xp-merge-order';cases=[];center=struct.unpack('<3f',raw(0x146bf2630+0xc8,12))
    def key(value):
        word=bits(value);return(word^((-(word>>31))&0x7fffffff))-(1<<32 if word>>31 else 0)
    for pair in[[(1.,0.),(1.,0.)],[(math.nan,0.),(1.,0.)],[(1.,0.),(math.nan,0.)],[(math.inf,0.),(math.nan,0.)],[(3.,4.),(0.,4.)],[(0.,0.),(-0.,0.)]]:
        for clamp in[False,True]:
            machine.reset_reward();n=45;machine.put(machine.game+0x618,'Q',n);point=list(center)
            if clamp:point[0]=f(point[0]+10000.)
            xy,_=normalized_position(raw,0,point);squares=[]
            for i in range(n):
                dx,dy=pair[i]if i<2 else(1000.,1000.);p=[f(xy[0]+dx),f(xy[1]+dy),0.];at=machine.rows+72*i;machine.put(at+0x24,'I',0xfffffff0);machine.put(at+0x34,'3f',*p);sx,sy=f(p[0]-xy[0]),f(p[1]-xy[1]);squares.append(f(f(sx*sx)+f(sy*sy)))
            selected=0
            for i in range(1,n):
                if key(squares[selected])>key(squares[i]):selected=i
            machine.create(0,32,point);changed=[i for i in range(n)if machine.get(machine.rows+72*i+0x24,'I')[0]!=0xfffffff0]
            assert changed==[selected]and machine.get(machine.rows+72*selected+0x24,'I')[0]==16,(pair,clamp,changed,selected)
            assert len(machine.height_calls)==int(clamp)and not machine.packets and machine.get(machine.game+0xa78,'I')[0]==0;cases.append([[[bits(v)for v in p]for p in pair],clamp,selected])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def primary_composition(machine,raw):
    machine.family='primary-reward-composition';cases=[]
    source=(ROOT/'crates/azeroth-survivors-re/src/mob_loot_catalog.rs').read_text();tiers=[int(v)for v in re.findall(r'tier: (\d+)',source)];chances=[int(v,16)for v in re.findall(r'base_drop_chance: f32::from_bits\(0x([0-9a-f]+)\)',source)]
    flags=[raw(struct.unpack('<Q',raw(0x146bf2630+z*240+0x88,8))[0]+104*b+0x64,1)[0]for z in range(12)for b in range(5)]
    for zi in range(12):
        pointer=struct.unpack('<Q',raw(0x146bf2630+zi*240+0x88,8))[0];center=struct.unpack('<3f',raw(0x146bf2630+zi*240+0xc8,12))
        for bi in range(5):
            for merge,due in[(False,False),(False,True),(True,False),(True,True)]:
                machine.reset_reward(zone=zi);game,frame,actor=machine.game,machine.frame,machine.actor;definition=pointer+104*bi;gear=machine.base+0x120000;magnet=machine.base+0x121000
                if merge:
                    machine.put(game+0x618,'Q',45)
                    for i in range(45):
                        at=machine.rows+72*i;machine.put(at+0x24,'I',10);machine.put(at+0x28,'Q',0xf130002329000100+i);machine.put(at+0x34,'3f',*center)
                machine.put(game+0x568,'QQ',actor,1);machine.put(actor+0x18,'q',-1);machine.put(game+0x784,'I',0);machine.put(game+0x798,'I',0);machine.put(game+0x988,'If',0,0.);machine.put(game+0x680,'3Q',128,gear,0);machine.put(game+0x7a8,'3Q',1,magnet,1);machine.put(magnet,'f',9. if due else 11.)
                machine.put(game+0x2c8,'4H',100,100,100,100);machine.put(game+0x31c,'B',1);machine.put(game+0x2a0,'f',0.);machine.put(game+0x4d0,'3f',*center);machine.put(frame+0x150,'Q',777);machine.put(frame+0x140,'3f',*center)
                machine.u.reg_write(r.UC_X86_REG_RDI,game);machine.u.reg_write(r.UC_X86_REG_R12,definition);machine.u.reg_write(r.UC_X86_REG_RSI,777);nameptr,namelen=struct.unpack('<QQ',raw(definition,16))
                def name():machine.u.reg_write(r.UC_X86_REG_RAX,nameptr);machine.u.reg_write(r.UC_X86_REG_RDX,namelen)
                def empty():machine.u.mem_write(machine.u.reg_read(r.UC_X86_REG_RCX),bytes(80))
                def remove():machine.put(game+0x7b8,'Q',0)
                machine.seams.update({0x145897de0:name,0x14598ddd0:lambda:machine.u.reg_write(r.UC_X86_REG_RAX,0),0x1458c4010:empty,0x14598c950:empty,0x145912fa0:lambda:None,0x1459c73f0:remove,0x1458c3bf0:empty})
                machine.run(0x14593fec0,[0x14593fec9]);machine.run(0x14594040e,[0x145940de1]);state=[1,2,3,4]
                for _ in range(1+3*int(due)):_,state=orientation(state)
                final=flags[zi*5+bi]
                if final:indices=[8]
                else:
                    pool=[(z,b)for z in range(12)if tiers[z]==tiers[zi]for b in range(5)if not flags[z*5+b]];ordinal=pool.index((zi,bi));indices=[i for i in range(8)if i%len(pool)==ordinal]
                expected=[]
                for index in indices:
                    value,state=base.rng_step(state)
                    if fb(chances[zi])>f((value>>40)*fb(0x33800000)):expected.append(101000+min(tiers[zi],5)*10+100*index)
                n=machine.get(game+0x690,'Q')[0];actual=list(machine.get(gear,str(n)+'I'))if n else[];assert actual==expected,(zi,bi,merge,due,actual,expected)
                assert list(machine.get(game+0x9b8,'4Q'))==state,(zi,bi,merge,due)
                assert machine.get(game+0xa78,'I')[0]==(0 if merge else 1)+1+3*int(due)
                count=machine.get(game+0x618,'Q')[0];assert count==(45 if merge else 1)+1+int(due)
                cases.append([zi,bi,merge,due,actual,state])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def guardian_composition(machine,raw):
    machine.family='guardian-reward-composition';cases=[]
    for zone in range(12):
        center=struct.unpack('<3f',raw(0x146bf2630+zone*240+0xc8,12))
        for seed in[[1,2,3,4],[0x123456789abcdef0,0x5555555555555555,0xaaaaaaaaaaaaaaaa,0xfedcba9876543210]]:
            for heads in[[],[9.],[10.],[11.],[math.nan],[11.,9.]]:
                machine.reset_reward(zone=zone,seed=seed);head=machine.base+0x130000;machine.put(machine.game+0x7a8,'3Q',2,head,len(heads))
                for i,deadline in enumerate(heads):machine.put(head+8*i,'2f',deadline,1000.)
                machine.create(1,25,center);_,state=orientation(list(seed));due=bool(heads)and not heads[0]>10.;accepted=False
                if due:
                    value,state=base.rng_step(state);accepted=f((value>>40)*fb(0x33800000))<.5
                    if accepted:
                        for _ in range(3):_,state=orientation(state)
                def move():
                    dest=machine.u.reg_read(r.UC_X86_REG_RCX);src=machine.u.reg_read(r.UC_X86_REG_RDX);n=machine.u.reg_read(r.UC_X86_REG_R8);machine.u.mem_write(dest,bytes(machine.u.mem_read(src,n)));machine.u.reg_write(r.UC_X86_REG_RAX,dest)
                machine.seams[0x145c0a3ed]=move;machine.u.reg_write(r.UC_X86_REG_RSP,machine.stack);machine.put(machine.stack,'Q',machine.stop);machine.put(machine.record,'3f',*center);machine.u.reg_write(r.UC_X86_REG_RCX,machine.game);machine.u.reg_write(r.UC_X86_REG_RDX,machine.record);machine.run(0x14593d3f0)
                assert list(machine.get(machine.game+0x9b8,'4Q'))==state;assert machine.get(machine.game+0x7b8,'Q')[0]==len(heads)-int(accepted);assert machine.get(machine.game+0x618,'Q')[0]==1+int(accepted);assert machine.get(machine.game+0xa78,'I')[0]==1+3*int(accepted)
                cases.append([zone,seed,[bits(v)for v in heads],accepted,state])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def radial_boundaries(machine,raw):
    machine.family='reward-radius-boundaries';cases=[]
    for zone in range(12):
        radius=struct.unpack('<f',raw(0x146bf2630+zone*240+0xd8,4))[0];limit=max(f(radius-2.),1.)
        for distance in[fb(bits(limit)-1),limit,fb(bits(limit)+1),math.nan]:
            machine.reset_reward(zone=zone);machine.u.reg_write(r.UC_X86_REG_RSI,zone*240);machine.u.reg_write(r.UC_X86_REG_RBX,0x146bf2630);machine.sx(r.UC_X86_REG_XMM0,distance);end=machine.run(0x1459443a6,[0x1459443c4,0x145944415]);assert(end==0x145944415)==(limit>=distance);cases.append([zone,bits(distance),end])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def source_connections():
    folder=ROOT/'crates/azeroth-survivors-re/src';compact=lambda s:re.sub(r'\s+','',s)
    checks={
        'gameplay/mechanics/pickups.rs':['let distance = dx.hypot(dy)','let radius = (zone.radius - 2.0).max(1.0)','if !(radius >= distance)','let _ = reward_height(position, world)','position.z = reward_height(position, world)','if row.flight.is_some() || !matches!(row.drop, PickupDrop::Experience { .. })','stationary >= 45','old.total_cmp(&squared).is_gt()','*existing = existing.wrapping_add(amount)','native_counter::creature_guid(9001, counter)','if amount < 20 { 1825 } else { 16587 }','if amount < 4 { 0.22 } else if amount < 20 { 0.35 } else { 0.9 }','object_type: 3','(46, 0x0200_0002)','(129, 0.1_f32.to_bits()), (130, 0.1_f32.to_bits())','entry: 9004, display: 2614','scale: 0.6, native_kind: 5, native_flags: 0','events.push(RunEvent::PickupObject(object))','pub(super) fn create_reward(','auxiliary: [None; 2]'],
        'gameplay/mechanics.rs':['pickup_effects::create_reward(drop, self.pickups, &mut self.counter, rng, self.world, self.zone, self.now, self.events)'],
        'gameplay/mechanics/bosses.rs':['pickup_effects::create_reward(drop, self.pickups, &mut self.counter, rng, self.world, self.zone, self.now, self.events)','pickup_effects::create(PickupDrop::Magnet'],
        'gameplay/mechanics/guardians.rs':['pickup_effects::create_reward(drop, self.pickups, &mut self.counter, self.rng, self.world, self.zone, self.now, self.events)','pickup_effects::create(PickupDrop::Magnet'],
        'gameplay/client/events.rs':['RunEvent::PickupObject(row)','match row.object_type { 3=>EntityKind::Unit,5=>EntityKind::GameObject','ObjectFields::from_pairs(rows).into_created(object_type)','SessionEvent::ObjectCreate { guid,kind,display_id,position:position(point),orientation','let scale=raw(4).map_or(1.,f32::from_bits)'],
        'gameplay/visuals.rs':['game.pickups.iter().filter(|pickup| matches!(pickup.drop, azeroth_survivors_re::mob_loot::PickupDrop::Cache { .. }))'],
        'player_abilities/behavior/passive_tick.rs':['let serial=counter.next()','0xf110_0000_0000_0000','rng.next_u64() >> 41','(4, request.scale.to_bits())','(8, request.display), (9, request.native_flags)','(12, sin(orientation * 0.5).to_bits()), (13, cos(orientation * 0.5).to_bits())','(21, request.native_kind)'],
        'run_pickups.rs':['(9009, 342, f32::from_bits(0x3fa6_6666))','(9010, 3271, 1.0)','(9011, 2232, f32::from_bits(0x3fcc_cccd))','Self::Speed => (9006, 5931, 1.0)','Self::Berserking => (9007, 5995, 1.0)','Self::Restoration => (9008, 5991, 1.0)'],
    }
    for file,tokens in checks.items():
        text=compact((folder/file).read_text())
        for token in tokens:assert compact(token)in text,(file,token)
    source=(folder/'gameplay/mechanics/pickups.rs').read_text();reward=source.split('pub(super) fn create_reward(',1)[1].split('pub(super) fn attract_experience',1)[0]
    assert reward.index('if stationary >= 45')<reward.index('position.z = reward_height')<reward.index('events.push(RunEvent::PickupObject')<reward.index('pickups.push(RunPickup')
    assert 'fn pickup_facing('not in(folder/'gameplay/mechanics.rs').read_text()
    return dict(files=len(checks),token_guards=sum(map(len,checks.values())),structural_checks=['merge before final height/counter/publication; publication before logical append','old independent gold-facing adapter removed'],engine_interface='existing ObjectCreate/ObjectValues/ObjectDestroyed and movement events; no engine implementation changed')

def provenance(out,mod,target,raw,span,stage):
    if stage:
        operations=[]
        for role in['pickup','object']:
            response=ROOT/('runtime/analysis/history/raid/raid-reward-pickups/6fbd4421bdf7/rea-'+role+'/003-analyze_function.json');result=json.loads(response.read_text())['response']['result']['structuredContent'];a,b=base.RANGES['reward-'+role];pseudo=result['normalized_result']['pseudocode'];text='\n'.join(line.rstrip()for line in pseudo.strip().splitlines())+'\n';name=role+'.pseudo.c';(out/name).write_text(text);assert result['subject']['digest']['sha256']==span(a,b-a)['sha256']
            operations.append(dict(role=role,operation=result['operation'],provider=result['provider'],va=hex(a),byte_count=b-a,input_sha256=span(a,b-a)['sha256'],evidence_id=result['evidence_id'],analysis_profile_sha256=result['analysis_profile']['digest'],pseudocode=name,pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest(),raw_pseudocode_sha256=hashlib.sha256(pseudo.encode()).hexdigest(),pseudocode_normalization='outer blank lines and trailing whitespace removed; original response retained under ignored runtime'))
        record=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,operations=operations,limits=['Headerless raw imports map file offset0 to current independently checked PE entries; external data/callers/engine implementations and concrete Win64 types remain unresolved.','Ghidra does not recover the pickup computed switch from this bounded raw import. Exact installed switch slots and executed cases own the AS branch contracts; no function census completeness is claimed.'])
        (out/'rea-provenance.json').write_text(portable_json(record,indent=2)+'\n')
    mod.verify_rea_operations(raw,out,target['sha256'])

def retain(out,machine,raw,span,stage):
    files=['raid-boss-lifecycle/selected-native.asm','raid-guardian-lifecycle/selected-native.asm','raid-lifecycles/selected-native.asm','raid-hazards/transform-unit.asm','raid-wards/unit-presentation.asm'];canonical=ROOT/'docs/analysis/evidence/0.112.0';candidates={}
    for name in files:
        rows={}
        for line in read_artifact(canonical/name).decode().splitlines():
            match=re.match(r'^([0-9a-f]+): ([0-9a-f]+) ',line)
            if match:
                a=int(match[1],16);value=bytes.fromhex(match[2]);assert raw(a,len(value))==value and a not in rows,(name,hex(a));rows[a]=value
        assert rows;candidates['../'+name]=rows
    recorded={}
    if not stage:
        prior=json.loads(read_artifact(out/'manifest.json'))
        for intervals in prior['visited_instruction_ranges'].values():
            for interval in intervals:
                a=int(interval['va'],16);b=a+interval['byte_count'];instructions=list(machine.md.disasm(raw(a,b-a),a));assert sum(i.size for i in instructions)==b-a
                for i in instructions:
                    if i.address in recorded:assert recorded[i.address]==interval['assembly']
                    recorded[i.address]=interval['assembly']
    owners={};new={}
    for addresses in machine.visited.values():
        for a,value in addresses.items():
            if a in owners:continue
            owner=next((name for name,rows in candidates.items()if rows.get(a)==value),'selected-native.asm')if stage else recorded[a]
            if owner!='selected-native.asm':assert candidates[owner].get(a)==value
            else:new[a]=value
            owners[a]=owner
    assembly=''
    for a,value in sorted(new.items()):
        instructions=list(machine.md.disasm(value,a));assert sum(i.size for i in instructions)==len(value);assembly+=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in instructions)
    if stage:(out/'selected-native.asm').write_text(assembly)
    else:assert read_artifact(out/'selected-native.asm').decode()==assembly
    traces={}
    for family,addresses in machine.visited.items():
        intervals=[]
        for a,value in sorted(addresses.items()):
            owner=owners[a]
            if intervals and intervals[-1][1]==a and intervals[-1][2]==owner:intervals[-1][1]+=len(value)
            else:intervals.append([a,a+len(value),owner])
        traces[family]=[dict(**span(a,b-a),assembly=owner)for a,b,owner in intervals]
    return dict(visited_instruction_ranges=traces,retained_new_instruction_rows=len(new),reused_instruction_rows=len(owners)-len(new),canonical_assembly_dependencies=sorted({v for v in owners.values()if v!='selected-native.asm'}))

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--stage',action='store_true');p.add_argument('--verify-stage',action='store_true');args=p.parse_args();assert not(args.stage and args.verify_stage);mod=load('reward_target','scripts/check-raid-target.py');target,raw,span,graph,headers=mod.recover()
    machine=Machine(raw);profiles=first_profiles(machine,raw);cap=cap_profiles(machine,raw)
    cases=dict(descriptors=dict(cases=len(profiles),snapshots_sha256=hashlib.sha256(json.dumps(profiles,separators=(',',':')).encode()).hexdigest()),population=dict(cases=len(cap),snapshots_sha256=hashlib.sha256(json.dumps(cap,separators=(',',':')).encode()).hexdigest()),positions=position_profiles(machine,raw),merge_order=cap_order(machine,raw),primary_composition=primary_composition(machine,raw),guardian_composition=guardian_composition(machine,raw),radial_boundaries=radial_boundaries(machine,raw));source=source_connections()
    out=STAGE if args.stage or args.verify_stage else KEPT
    if args.stage:out.mkdir(parents=True,exist_ok=True)
    provenance(out,mod,target,raw,span,args.stage);evidence=retain(out,machine,raw,span,args.stage)
    pe=load('reward_current_pe','scripts/inventory-executable.py').PE(target_bytes(target));functions={(pe.image_base+a,pe.image_base+b)for a,b,_ in pe.functions()};owners={role:span(a,b-a)for role,(a,b)in base.RANGES.items()if role in['reward-pickup','reward-object','guardian-magnet']};assert all((int(v['va'],16),int(v['va'],16)+v['byte_count'])in functions for v in owners.values())
    switch=0x146c0c650;successors=[switch+v for v in struct.unpack('<7i',raw(switch,28))];assert successors==[0x14594442e,0x145945160,0x14594445c,0x14594514a,0x145945176,0x145945134,0x14594518c]
    calls={family:dict(intercepted_seams=[hex(a)for a in sorted(machine.seam_calls.get(family,set()))],observed_calls=[dict(instruction=span(a,5),target=hex(b),role='intercepted seam'if b in machine.seam_calls.get(family,set())else'byte-executed AS helper')for a,b in sorted(edges)])for family,edges in machine.call_edges.items()}
    dependencies=[]
    for family in['raid-boss-lifecycle','raid-guardian-lifecycle']:
        mod.verify_rea_operations(raw,ROOT/'docs/analysis/evidence/0.112.0'/family,target['sha256']);dependencies.append('../'+family+'/rea-provenance.json')
    manifest=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,cases=cases,source_checks=source,current_PE_exception_owners=owners,selector=dict(table=span(switch,28),slots=[hex(a)for a in successors],context='AS enum kinds0..6; selected creation kinds0/1/3/4/5/6; kind2 remains existing cache owner. No arbitrary-input selector guard is inferred.'),call_boundaries=calls,rea_dependencies=dependencies,**evidence,
        limits=['Original instructions execute in synthetic CPU fixtures only; no Rust compilation, compiling tests or game process.','AS creator/object descriptors, counters, RNG, normalization and XP merge consumers execute; field-map storage, packet serialization, localization, allocation/copy and terrain answers remain explicit existing engine ports.','CRT hypot/sin/cos outputs use controlled host responses; native CRT implementation and MPQ terrain parity are unverified.','The primary composition executes actual pickup/object providers, gear provider/rolls and XP attraction; notice/name publishing and magnet-vector removal remain named seams. Guardian composition starts with actual gold creation then executes its existing current magnet helper.','Existing cache kind2, collection rewards/XP/stat providers and complete game presentation are not certified by this bounded death-output proof. Source/behavior correspondence is statically traced and awaits permitted Rust/runtime comparison.'])
    text=json.dumps(manifest,indent=2)+'\n'
    if args.stage:(out/'manifest.json').write_text(text)
    else:assert read_artifact(out/'manifest.json').decode()==text
    print('Current AS reward pickups:',{k:v['cases']for k,v in cases.items()},'; source:',source['token_guards'],'token guards; no compilation/game')
if __name__=='__main__':main()
