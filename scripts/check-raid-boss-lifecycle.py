#!/usr/bin/env python3
"""Current primary-boss arrival and reward instruction contracts; no compilation.

--stage writes reviewed candidate evidence under ignored runtime. Synthetic
Win64 CPU fixtures execute current instructions with explicit external seams.
"""
from portable_paths import portable_json
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse, hashlib, json, math, re, struct, sys
from pathlib import Path
from coverage_common import ROOT, target_bytes

sys.path[:0] = [str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),
               str(ROOT/'runtime/armory-recovery/python-libs')]
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
from unicorn import x86_const as r

STAGE = ROOT/'runtime/native-evidence/0.112.0/raid-boss-lifecycle'
KEPT = ROOT/'docs/analysis/evidence/0.112.0/raid-boss-lifecycle'
RANGES = {
    'minutes': (0x14590412c, 0x145904141),
    'schedule': (0x145904d79, 0x145904ddd),
    'endless': (0x14590649b, 0x145906574),
    'constructor': (0x14593b0f0, 0x14593be1c),
    'point-filter': (0x1459cbf00, 0x1459cc08e),
    'form': (0x145915340, 0x14591599b),
    'placement': (0x14593d500, 0x14593dd85),
    'fallback-placement': (0x14593e800, 0x14593ec84),
    'range-rng': (0x1459c2d90, 0x1459c2f0a),
    'death': (0x14594040e, 0x145940de1),
    'equipment-provider': (0x145994a20, 0x145994dce),
    'equipment-pool': (0x1459cf4a0, 0x1459cf8d8),
    'equipment-iterator': (0x1459ca770, 0x1459ca9d6),
    'equipment-multiplier': (0x14599d7a0, 0x14599d808),
    'arrival-notice': (0x14598bf40, 0x14598c176),
    'death-notice': (0x14598c950, 0x14598ca92),
    'attraction': (0x14594eb50, 0x14594ee2e),
    'death-clock': (0x14593fec0, 0x14593fec9),
    'startup-gate': (0x14590d825, 0x14590d83b),
    'startup-bosses': (0x14590dac7, 0x14590db39),
    'unit-scale': (0x14593c726, 0x14593c7da),
}

def f(value):
    return _shared_f32(value)
def bits(value):
    return _shared_bits(value)
def fb(value): return struct.unpack('<f', struct.pack('<I', value))[0]
def load(name, path):
    module = load_script(name, ROOT/path);return module

class Machine:
    def __init__(self, raw):
        self.raw=raw;self.u=Uc(UC_ARCH_X86,UC_MODE_64)
        self.md=Cs(CS_ARCH_X86,CS_MODE_64);self.md.detail=True
        self.base=0x70000000;self.u.mem_map(self.base,0x400000);self.mapped=set()
        self.game=self.base;self.actor=self.base+0x10000;self.frame=self.base+0x20000
        self.record=self.base+0x30000;self.heap=self.base+0x40000
        self.stack=self.base+0x3e0008;self.stop=self.base+0x3ff000
        self.visited={};self.seam_calls={};self.call_edges={};self.family='';self.seams={};self.ends=set();self.observers={}
        def demand(uc,access,address,size,value,user):
            page=address&~4095;assert 0x140000000<=page<0x149000000,hex(address)
            if page not in self.mapped:
                self.u.mem_map(page,4096);self.u.mem_write(page,raw(page,4096));self.mapped.add(page)
            return True
        self.u.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
        def hook(uc,address,size,user):
            if address in self.ends:uc.emu_stop();return
            if address in self.seams:self.seam_calls.setdefault(self.family,set()).add(address);self.seams[address]();self.ret();return
            if address in self.observers:self.observers[address]()
            assert any(first<=address<last for first,last in RANGES.values()),('unexpected instruction',hex(address))
            instruction=next(self.md.disasm(bytes(uc.mem_read(address,size)),address))
            if instruction.mnemonic=='call':
                assert instruction.op_str.startswith('0x') and (int(instruction.op_str,16) in self.seams or int(instruction.op_str,16) in {a for a,b in RANGES.values()}),('unlisted call',hex(address),instruction.op_str)
                self.call_edges.setdefault(self.family,set()).add((address,int(instruction.op_str,16)))
            self.visited.setdefault(self.family,{})[address]=raw(address,size)
        self.u.hook_add(UC_HOOK_CODE,hook)
    def put(self,address,fmt,*values):self.u.mem_write(address,struct.pack('<'+fmt,*values))
    def get(self,address,fmt):return struct.unpack('<'+fmt,self.u.mem_read(address,struct.calcsize('<'+fmt)))
    def sx(self,reg,value):self.u.reg_write(reg,bits(value))
    def xf(self,reg):return fb(self.u.reg_read(reg)&0xffffffff)
    def ret(self):
        sp=self.u.reg_read(r.UC_X86_REG_RSP);self.u.reg_write(r.UC_X86_REG_RIP,self.get(sp,'Q')[0]);self.u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def allocate(self,size):
        address=self.cursor;self.cursor+=(size+63)&~63;assert self.cursor<self.base+0x3c0000;return address
    def grow(self):
        vector=self.u.reg_read(r.UC_X86_REG_RCX);cap,pointer,_=self.get(vector,'3Q');n=self.u.reg_read(r.UC_X86_REG_RDX);stride=self.get(self.u.reg_read(r.UC_X86_REG_RSP)+0x28,'Q')[0];assert stride in[8,16,24]
        capacity=max(4,cap*2,n+1);new=self.allocate(capacity*stride)
        if n:self.u.mem_write(new,bytes(self.u.mem_read(pointer,n*stride)))
        self.put(vector,'2Q',capacity,new)
    def reset(self):
        self.u.mem_write(self.base,bytes(0x400000));self.cursor=self.heap;self.observers={}
        for reg in [r.UC_X86_REG_RAX,r.UC_X86_REG_RBX,r.UC_X86_REG_RCX,r.UC_X86_REG_RDX,r.UC_X86_REG_RSI,r.UC_X86_REG_RDI,r.UC_X86_REG_R8,r.UC_X86_REG_R9,r.UC_X86_REG_R10,r.UC_X86_REG_R11,r.UC_X86_REG_R12,r.UC_X86_REG_R13,r.UC_X86_REG_R14,r.UC_X86_REG_R15]:self.u.reg_write(reg,0)
        for reg in range(r.UC_X86_REG_XMM0,r.UC_X86_REG_XMM15+1):self.u.reg_write(reg,0)
        self.u.reg_write(r.UC_X86_REG_RBP,self.frame);self.u.reg_write(r.UC_X86_REG_RSP,self.stack);self.put(self.stack,'Q',self.stop)
        def copy():
            dest=self.u.reg_read(r.UC_X86_REG_RCX);src=self.u.reg_read(r.UC_X86_REG_RDX);size=self.u.reg_read(r.UC_X86_REG_R8);assert size<0x10000
            self.u.mem_write(dest,self.raw(src,size)if 0x140000000<=src<0x149000000 else bytes(self.u.mem_read(src,size)))
        self.seams={0x140002200:lambda:None,0x1400021c0:lambda:self.u.reg_write(r.UC_X86_REG_RAX,self.allocate(self.u.reg_read(r.UC_X86_REG_RCX))),0x1400021d0:lambda:None,0x145c0a3db:copy,0x145c0d470:self.grow,
                    0x145c0a42f:lambda:self.sx(r.UC_X86_REG_XMM0,math.hypot(self.xf(r.UC_X86_REG_XMM0),self.xf(r.UC_X86_REG_XMM1))),
                    0x145c0a417:lambda:self.sx(r.UC_X86_REG_XMM0,math.cos(self.xf(r.UC_X86_REG_XMM0))),
                    0x145c0a411:lambda:self.sx(r.UC_X86_REG_XMM0,math.sin(self.xf(r.UC_X86_REG_XMM0))),
                    0x145c0a447:lambda:self.sx(r.UC_X86_REG_XMM0,math.atan2(self.xf(r.UC_X86_REG_XMM0),self.xf(r.UC_X86_REG_XMM1)))}
    def run(self,start,ends=None):
        self.ends=set(ends or[self.stop]);self.u.reg_write(r.UC_X86_REG_EFLAGS,2);self.u.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        self.u.emu_start(start,0,count=1000000);end=self.u.reg_read(r.UC_X86_REG_RIP);assert end in self.ends,hex(end);return end

def rng_step(state):
    mask=(1<<64)-1;a,b,c,d=state;z=(a+d)&mask;z=((z<<23)|(z>>41))&mask;value=(z+a)&mask;t=(b<<17)&mask;c^=a;d^=b;b^=c;a^=d;c^=t;d=((d<<45)|(d>>19))&mask
    return value,[a,b,c,d]

def schedule(machine,raw,headers):
    machine.family='arrival-schedule';cases=0
    for zone in range(12):
        zone_address=0x146bf2630+zone*240;pointer=struct.unpack('<Q',raw(zone_address+0x88,8))[0]
        for index in range(5):
            minute=struct.unpack('<f',raw(pointer+index*104+0x50,4))[0]
            for clock in [fb(bits(minute*60)-1),minute*60,fb(bits(minute*60)+1),math.nan,math.inf]:
                machine.reset();game,frame=machine.game,machine.frame;created=[]
                machine.put(game+0x9e8,'Q',index);machine.put(game+0xa4c,'f',clock);machine.put(frame+0x2f0,'Q',game+0xa4c);machine.put(frame+0x438,'Q',game);machine.put(frame+0x3f8,'Q',zone_address);machine.u.reg_write(r.UC_X86_REG_RDI,game)
                machine.run(0x14590412c,[0x145904141]);assert machine.get(frame+0x68,'I')[0]==bits(f(clock/60))
                machine.seams[0x14593b0f0]=lambda:created.append((machine.u.reg_read(r.UC_X86_REG_RDX),machine.get(game+0x9e8,'Q')[0]))
                machine.run(0x145904d79,[0x145906574]);admitted=f(clock/60)>=minute
                assert created==([(pointer+104*index,index+1)]if admitted else[]);assert machine.get(game+0x9e8,'Q')[0]==index+int(admitted);cases+=1
        for index in [5,9]:
            for enabled in [0,1,2]:
                for clock,deadline in [(1200.,1201.),(1200.,1200.),(1200.,1199.),(math.nan,0.),(1200.,math.nan)]:
                    for seed in [[1,2,3,4],[0x123456789abcdef0,0x5555555555555555,0xaaaaaaaaaaaaaaaa,0xfedcba9876543210]]:
                        machine.reset();game,frame=machine.game,machine.frame;created=[];machine.put(frame+0x438,'Q',game);machine.put(frame+0x3f8,'Q',zone_address);machine.put(game+0x9e8,'Q',index);machine.put(game+0xad0,'B',enabled);machine.put(game+0xa4c,'f',clock);machine.put(game+0xaa8,'f',deadline);machine.put(game+0x9b8,'4Q',*seed);machine.u.reg_write(r.UC_X86_REG_RDI,zone_address);machine.u.reg_write(r.UC_X86_REG_RCX,game);machine.sx(r.UC_X86_REG_XMM0,clock)
                        machine.seams[0x14593b0f0]=lambda:created.append(machine.u.reg_read(r.UC_X86_REG_RDX))
                        machine.run(0x14590649b,[0x145906574]);admitted=bool(enabled)and clock>=deadline;state=list(seed)
                        if admitted:
                            while True:
                                value,state=rng_step(state);product=value*5
                                if (product&((1<<64)-1))>>61<=4:break
                            assert created==[pointer+(product>>64)*104];assert machine.get(game+0xaa8,'I')[0]==bits(f(clock+300.))
                        else:assert not created and machine.get(game+0xaa8,'I')[0]==bits(deadline)
                        assert machine.get(game+0x9b8,'4Q')==tuple(state);assert machine.get(game+0x9e8,'Q')[0]==index;cases+=1
    return cases

def point_placement(machine,raw):
    machine.family='fixed-points';cases=0;zones=[]
    for zi in range(12):
        pointer,count=struct.unpack('<QQ',raw(0x146bf2630+zi*240+0x68,16))
        points=[struct.unpack('<2I',raw(pointer+i*8,8))for i in range(count)]
        assert count==({7:4,11:6}.get(zi,0));zones.append(dict(zone_index=zi,pointer=hex(pointer),points=points))
    source=(ROOT/'crates/azeroth-survivors-re/src/bosses/catalog.rs').read_text()
    for zone,key in [(zones[7],'sm'),(zones[11],'naxx')]:
        block=source.split('"'+key+'" => {')[1].split('POINTS\n')[0]
        assert [int(v,16)for v in re.findall(r'f32::from_bits\(0x([0-9a-f]+)\)',block)]==[v for row in zone['points']for v in row]
    # Complete current filter, including candidate-vector growth, preserves
    # equality and refuses NaN. CRT hypot is an explicit controlled seam.
    for distances in [[0.,fb(bits(20.)-1),20.,fb(bits(20.)+1),100.,math.nan],[],[20.]*9,[math.nan]*6]:
        machine.reset();out,iterator,points,player=machine.record,machine.record+0x100,machine.record+0x200,machine.record+0x1000
        for index,distance in enumerate(distances):machine.put(points+index*8,'2f',distance,0.)
        machine.put(iterator,'3Q',points,points+8*len(distances),player);machine.put(player,'Q',player+8);machine.put(player+8,'2f',0.,0.)
        machine.u.reg_write(r.UC_X86_REG_RCX,out);machine.u.reg_write(r.UC_X86_REG_RDX,iterator)
        def grow():
            vector=machine.u.reg_read(r.UC_X86_REG_RCX);cap,pointer,n=machine.get(vector,'3Q');new=machine.allocate(max(8,cap*2)*8)
            machine.u.mem_write(new,bytes(machine.u.mem_read(pointer,n*8)));machine.put(vector,'2Q',max(8,cap*2),new)
        machine.seams[0x145c0d470]=grow;machine.run(0x1459cbf00)
        cap,pointer,n=machine.get(out,'3Q');actual=list(machine.get(pointer,str(n)+'Q'))if n else[]
        assert actual==[points+8*i for i,v in enumerate(distances)if v>=20.];cases+=1
    machine.family='point-rng'
    for count in range(1,11):
        for seed in [[1,2,3,4],[0x123456789abcdef0,0x5555555555555555,0xaaaaaaaaaaaaaaaa,0xfedcba9876543210]]:
            machine.reset();game,frame=machine.game,machine.frame;candidates=machine.record;machine.put(game+0x9b8,'4Q',*seed)
            for i in range(count):machine.put(candidates+i*8,'Q',machine.record+0x1000+i*8)
            machine.put(frame+0x1e8,'Q',candidates);machine.u.reg_write(r.UC_X86_REG_RSI,game);machine.u.reg_write(r.UC_X86_REG_R9,count)
            machine.run(0x14593b1d0,[0x14593b25d]);state=list(seed);zone=((count<<(64-count.bit_length()))&((1<<64)-1))-1
            while True:
                value,state=rng_step(state);product=value*count
                if product&((1<<64)-1)<=zone:break
            assert machine.u.reg_read(r.UC_X86_REG_R15)==machine.record+0x1000+(product>>64)*8;assert machine.get(game+0x9b8,'4Q')==tuple(state);cases+=1
    machine.family='farthest-point'
    for current,candidate in [(10.,15.),(15.,10.),(15.,15.),(0.,-0.),(math.nan,10.),(10.,math.nan),(-math.inf,math.inf)]:
        machine.reset();points,player=machine.record,machine.record+0x100;machine.put(points,'4f',current,0.,candidate,0.);machine.put(player,'2f',0.,0.);machine.put(machine.frame+0x1c8,'Q',player)
        # Inject exact hypot outputs to isolate total-order selection from CRT.
        outputs=iter([current,candidate]);machine.seams[0x145c0a42f]=lambda:machine.sx(r.UC_X86_REG_XMM0,next(outputs))
        machine.u.reg_write(r.UC_X86_REG_R15,points);machine.u.reg_write(r.UC_X86_REG_RDI,2);machine.run(0x14593b48d,[0x14593b25d])
        def key(v):
            value=bits(v);return (value^((-(value>>31))&0x7fffffff))-(1<<32 if value>>31 else 0)
        assert machine.u.reg_read(r.UC_X86_REG_R15)==points+(8 if key(current)<=key(candidate)else 0);cases+=1
    return dict(cases=cases,zones=zones)

def initial_forms(machine,raw,graph):
    machine.family='initial-form-gates';cases=0;descriptors={}
    for boss in graph['bosses']:
        # Header id is separately checked against the current canonical graph.
        boss_id=boss['boss_id']
        machine.reset();calls=[];machine.u.reg_write(r.UC_X86_REG_R14D,boss_id);machine.u.reg_write(r.UC_X86_REG_RSI,machine.game);machine.u.reg_write(r.UC_X86_REG_RBX,777)
        machine.seams[0x145915340]=lambda:calls.append(machine.u.reg_read(r.UC_X86_REG_R8));machine.run(0x14593b8f5,[0x14593b928])
        assert calls==([0x146be6890]if boss_id==693 else[0x146be68b0]if boss_id==1091 else[])
        if calls:descriptors[boss_id]=list(struct.unpack('<7I',raw(calls[0],28)))
        cases+=1
    machine.family='initial-form-fields';fields=[]
    for boss_id,words in descriptors.items():
        for display,scale in [(123,1.35),(321,2.5)]:
            machine.reset();game,actor,definition,descriptor=machine.game,machine.actor,machine.record,machine.record+0x1000;captures=[]
            machine.put(game+0x568,'QQ',actor,1);machine.put(actor+0x18,'Q',0);machine.put(actor+0x30,'Q',definition);machine.put(actor+0xf0,'Q',777);machine.put(definition+0x44,'If',display,scale);machine.put(descriptor,'7I',*words)
            def field():
                frame=machine.u.reg_read(r.UC_X86_REG_RDX);captures.append((machine.get(frame+32,'Q')[0],machine.u.reg_read(r.UC_X86_REG_R8D)));machine.u.reg_write(r.UC_X86_REG_RAX,0)
            machine.seams[0x1458de1f0]=field;machine.u.reg_write(r.UC_X86_REG_RCX,game);machine.u.reg_write(r.UC_X86_REG_RDX,777);machine.u.reg_write(r.UC_X86_REG_R8,descriptor);machine.run(0x145915340,[0x14591599b])
            expected={131:words[0]or display,4:words[1]if fb(words[1])>0 else bits(scale),133:words[2],164:int(words[3]!=0 or words[5]!=0)}
            for slot in range(2):
                packed=words[3+slot*2]|words[4+slot*2]<<32;variant=(packed>>40)&255
                if variant==2:continue
                item=packed&0xffffffff;info=0 if not item else((packed>>24)&0xff00)|(0x11010002 if variant&1 else 0x0d010002);flags=0 if not item else 1 if variant&1 else 3
                expected.update({37+slot:item,40+slot*2:info,41+slot*2:flags})
            assert dict(captures)==expected;fields.append(dict(boss_id=boss_id,base_display=display,base_scale_bits=bits(scale),fields=sorted(captures)));cases+=1
    return dict(cases=cases,descriptors=descriptors,fields=fields)

def shared_placement(machine,raw):
    machine.family='shared-placement';cases=[]
    center_x,center_y,center_z=struct.unpack('<3f',raw(0x146bf2630+0xc8,12));radius=struct.unpack('<f',raw(0x146bf2630+0xd8,4))[0]
    for moving in [False,True]:
        for grid_kind in ['absent','open','blocked','path-open','path-unreachable']:
            for height in [0.,25.,fb(bits(25.)+1),math.nan]:
                machine.reset();game,world,path,cells,distances=machine.game,machine.record,machine.record+0x1000,machine.heap,machine.heap+0x50000
                machine.put(game+0x4d0,'3f',center_x,center_y,center_z);machine.put(game+0x9b0,'Q',world);machine.put(game+0x9e0,'2f',3. if moving else 0.,0.);machine.put(game+0x9b8,'4Q',1,2,3,4)
                machine.put(world+0x40,'q',-1 if grid_kind=='absent'else 0);machine.put(world+0x48,'3Q',cells,512*512,512);machine.put(world+0x60,'2f',f(center_x-256),f(center_y-256));machine.put(world+0xb8,'f',center_z)
                if grid_kind=='blocked':machine.u.mem_write(cells,bytes([1])*(512*512))
                if grid_kind.startswith('path-'):
                    machine.put(game+0x9d8,'Q',path);machine.put(path+0x18,'2Q',distances,512*512);machine.put(path+0x30,'Q',401)
                    if grid_kind=='path-unreachable':machine.u.mem_write(distances,b'\xff\xff'*(512*512))
                machine.put(machine.stack+0x20,'f',0.);machine.u.reg_write(r.UC_X86_REG_RCX,machine.actor);machine.u.reg_write(r.UC_X86_REG_RDX,game);machine.sx(r.UC_X86_REG_XMM2,24.);machine.sx(r.UC_X86_REG_XMM3,28.)
                samples=[]
                def primary():
                    samples.append((bits(machine.xf(r.UC_X86_REG_XMM1)),bits(machine.xf(r.UC_X86_REG_XMM2))))
                    machine.u.reg_write(r.UC_X86_REG_RAX,1);machine.sx(r.UC_X86_REG_XMM0,f(center_z+height))
                machine.seams.update({0x145898dc0:lambda:machine.u.reg_write(r.UC_X86_REG_RAX,0),0x1458a0b40:primary})
                machine.run(0x14593d500);position=machine.get(machine.actor,'3I');state=machine.get(game+0x9b8,'4Q')
                assert position[2]==bits(f(center_z+height));assert len(samples)>0
                expected_state=[1,2,3,4];expected_calls=0
                def draw(low,high):
                    nonlocal expected_state
                    while True:
                        value,expected_state=rng_step(expected_state);unit=fb((value>>41)|0x3f800000)-1.
                        result=f(f(unit*f(high-low))+low)
                        if result<high:return result
                def point(angle,distance):return[f(f(distance*f(math.cos(angle)))+center_x),f(f(distance*f(math.sin(angle)))+center_y)]
                output=None;actual_height=f(center_z+height);delta=abs(f(actual_height-center_z))
                for _ in range(16):
                    if moving:_,expected_state=rng_step(expected_state)
                    angle=draw(0.,f(math.tau));distance=draw(24.,28.)
                    while distance>=12.:
                        xy=point(angle,distance);distance_center=f(math.hypot(f(xy[0]-center_x),f(xy[1]-center_y)))
                        if not(distance_center>f(radius+18.)):
                            expected_calls+=1;max_delta=8. if distance_center>radius else 25.
                            if not(delta>max_delta)and grid_kind not in['blocked','path-unreachable']:
                                output=xy;break
                        distance=f(distance-2.)
                    if output is not None:break
                if output is None:
                    for _ in range(12):
                        xy=point(draw(0.,f(math.tau)),draw(24.,28.))
                        dx,dy=f(xy[0]-center_x),f(xy[1]-center_y);norm=f(math.sqrt(f(f(dx*dx)+f(dy*dy))))
                        if norm>radius:xy=[f(center_x+f(radius*f(dx/norm))),f(center_y+f(radius*f(dy/norm)))]
                        if grid_kind=='blocked':continue
                        expected_calls+=1
                        if delta<25.:output=xy;break
                    if output is None:
                        output=point(draw(0.,f(math.tau)),draw(24.,28.));expected_calls+=1
                assert position==tuple(bits(v)for v in[*output,actual_height]),(moving,grid_kind,height,position,output)
                assert state==tuple(expected_state),(moving,grid_kind,height,state,expected_state)
                assert len(samples)==expected_calls,(moving,grid_kind,height,len(samples),expected_calls)
                # Open finite worlds accept the first sample; native unordered
                # height comparison also reaches it, unlike a positive <= gate.
                first=grid_kind in['absent','open','path-open']and not(delta>25.)
                if first:assert len(samples)==1,(moving,grid_kind,height,len(samples))
                cases.append(dict(moving=moving,grid=grid_kind,height_delta_bits=bits(height),height_calls=len(samples),position_bits=position,rng_after=state))
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def equipment_provider(machine,raw):
    machine.family='equipment-provider';cases=[]
    source=(ROOT/'crates/azeroth-survivors-re/src/mob_loot_catalog.rs').read_text()
    tiers=[int(v)for v in re.findall(r'tier: (\d+)',source)];chances=[int(v,16)for v in re.findall(r'base_drop_chance: f32::from_bits\(0x([0-9a-f]+)\)',source)]
    flags=[int(v)for v in re.findall(r'final_flag: (\d+)',source)];assert len(tiers)==len(chances)==12 and len(flags)==60
    for zi in range(12):
        pointer=struct.unpack('<Q',raw(0x146bf2630+zi*240+0x88,8))[0]
        assert [raw(pointer+104*bi+0x64,1)[0]for bi in range(5)]==flags[zi*5:zi*5+5]
        for bi in range(5):
            for class_id in [1,2,3,4,5,7,8,9,11]:
                machine.reset();machine.u.reg_write(r.UC_X86_REG_RCX,machine.actor);machine.u.reg_write(r.UC_X86_REG_EDX,class_id);machine.u.reg_write(r.UC_X86_REG_R8,zi);machine.u.reg_write(r.UC_X86_REG_R9,bi);machine.run(0x145994a20)
                cap,pointer,n=machine.get(machine.actor,'3Q');actual=[machine.get(pointer+i*8,'2I')for i in range(n)]
                if flags[zi*5+bi]:indices=list(range(8,10 if class_id in[4,7]else 9))
                else:
                    pool=[(z,b)for z in range(12)if tiers[z]==tiers[zi]for b in range(5)if not flags[z*5+b]];ordinal=pool.index((zi,bi));indices=[i for i in range(8)if i%len(pool)==ordinal]
                base=100000+class_id*1000+min(tiers[zi],5)*10;expected=[(base+i*100,chances[zi])for i in indices]
                assert actual==expected,(zi,bi,class_id,actual,expected);cases.append([zi,bi,class_id,actual])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest(),tiers=tiers,chances_bits=chances)

def primary_death(machine,raw,provider):
    machine.family='primary-death';snapshots=[]
    for zi in range(12):
        pointer=struct.unpack('<Q',raw(0x146bf2630+zi*240+0x88,8))[0]
        for bi in range(5):
            for remaining,marker,kills,phase,showcase,deadline in [(False,0,0,0,False,10.),(True,0,4,0,False,11.),(False,2,0xffffffff,1,True,math.nan),(False,4,9,256,False,9.)]:
                machine.reset();game,frame,actor,definition=machine.game,machine.frame,machine.actor,pointer+104*bi;calls=[];pickups=[];packet_buffer=machine.record;gear_buffer=machine.record+0x10000;magnet=machine.record+0x12000
                machine.put(game+0x568,'QQ',actor,3);machine.put(actor+0x18,'q',-1);machine.put(actor+0xb0,'B',0)
                machine.put(actor+0x1d8+0x18,'q',0);machine.put(actor+0x1d8+0xb0,'B',1)
                machine.put(actor+2*0x1d8+0x18,'q',0 if remaining else -1);machine.put(actor+2*0x1d8+0xb0,'B',0)
                machine.put(game+0x784,'If',marker,123.);machine.put(game+0x798,'I',kills);machine.put(game+0xa4c,'f',10.);machine.put(game+0xad8,'B',showcase);machine.put(game+0x988,'If',phase,987.)
                machine.put(game+0x620,'3Q',128,packet_buffer,0);machine.put(game+0x680,'3Q',128,gear_buffer,0);machine.put(game+0x7a8,'3Q',1,magnet,1);machine.put(magnet,'f',deadline)
                machine.put(game+0x2c8,'4H',100,100,100,100);machine.put(game+0x31c,'B',1);machine.put(game+0x9b8,'4Q',1,2,3,4);machine.put(game+0x2a0,'f',0.)
                machine.put(frame+0x150,'Q',777);machine.put(frame+0x140,'3f',3.,4.,5.);machine.u.reg_write(r.UC_X86_REG_RDI,game);machine.u.reg_write(r.UC_X86_REG_R12,definition);machine.u.reg_write(r.UC_X86_REG_RSI,777)
                name_pointer,name_length=struct.unpack('<QQ',raw(definition,16))
                def name():machine.u.reg_write(r.UC_X86_REG_RAX,name_pointer);machine.u.reg_write(r.UC_X86_REG_RDX,name_length)
                def packet(label):
                    calls.append(label);machine.u.mem_write(machine.u.reg_read(r.UC_X86_REG_RCX),bytes(80))
                def localize():machine.u.reg_write(r.UC_X86_REG_RAX,0);machine.u.reg_write(r.UC_X86_REG_RDX,0)
                def pickup():
                    kind=machine.u.reg_read(r.UC_X86_REG_EDX);amount=machine.u.reg_read(r.UC_X86_REG_R8D)if kind!=6 else None;at=machine.get(machine.u.reg_read(r.UC_X86_REG_R9),'3I');pickups.append([kind,amount,at]);calls.append('pickup'+str(kind))
                def remove_magnet():
                    assert machine.u.reg_read(r.UC_X86_REG_RCX)==game+0x7a8 and machine.u.reg_read(r.UC_X86_REG_RDX)==0;machine.put(game+0x7b8,'Q',0);calls.append('consume-magnet')
                machine.seams.update({0x145897de0:name,0x14598ddd0:localize,0x1458c4010:lambda:packet('yell'),0x14598c950:lambda:packet('account'),0x145912fa0:lambda:calls.append('publish-account'),0x145944310:pickup,0x1459c73f0:remove_magnet,0x145898dc0:lambda:machine.u.reg_write(r.UC_X86_REG_RAX,zi),0x14594eb50:lambda:calls.append('attract')})
                machine.run(0x14593fec0,[0x14593fec9]);machine.run(0x14594040e,[0x145940de1])
                new_kills=(kills+1)&0xffffffff;due=not(deadline>10.);expected_calls=['yell','account','publish-account','pickup0','pickup1']+(['consume-magnet','pickup6']if due else[])+['attract'];assert calls==expected_calls,(zi,bi,calls)
                assert machine.get(game+0x798,'I')[0]==new_kills
                assert pickups[:2]==[[0,(20*new_kills+60)&0xffffffff,(bits(3.),bits(4.),bits(5.))],[1,(20*new_kills+40)&0xffffffff,(bits(5.),bits(4.),bits(5.))]],pickups
                if due:assert pickups[2]==[6,None,(bits(1.),bits(5.5),bits(5.))]
                expected_marker=1 if not remaining and marker&1==0 and marker!=2 else marker;assert machine.get(game+0x784,'I')[0]==expected_marker
                assert machine.get(game+0x788,'I')[0]==bits(10. if expected_marker!=marker else 123.)
                final=raw(definition+0x64,1)[0];transition=final==1 and phase&255==0;assert machine.get(game+0x988,'I')[0]==(1 if transition else phase);assert machine.get(game+0x98c,'I')[0]==bits(10. if transition else 987.)
                count=machine.get(game+0x690,'Q')[0];gear=list(machine.get(gear_buffer,str(count)+'I'))if count else[];state=[1,2,3,4];expected_gear=[]
                if not showcase:
                    # The complete current candidate provider is executed by
                    # this path; independently derived source candidates own
                    # the expected RNG admission and resulting queued IDs.
                    flags=[raw(struct.unpack('<Q',raw(0x146bf2630+z*240+0x88,8))[0]+104*b+0x64,1)[0]for z in range(12)for b in range(5)]
                    if final:indices=[8]
                    else:
                        pool=[(z,b)for z in range(12)if provider['tiers'][z]==provider['tiers'][zi]for b in range(5)if not flags[z*5+b]];ordinal=pool.index((zi,bi));indices=[i for i in range(8)if i%len(pool)==ordinal]
                    for index in indices:
                        value,state=rng_step(state)
                        if fb(provider['chances_bits'][zi])>f((value>>40)*fb(0x33800000)):expected_gear.append(101000+min(provider['tiers'][zi],5)*10+100*index)
                assert gear==expected_gear,(zi,bi,gear,expected_gear);assert machine.get(game+0x9b8,'4Q')==tuple(state)
                snapshots.append([zi,bi,remaining,marker,kills,phase,showcase,bits(deadline),gear,pickups,calls])
    return dict(cases=len(snapshots),snapshots_sha256=hashlib.sha256(json.dumps(snapshots,separators=(',',':')).encode()).hexdigest())

def startup(machine,raw):
    machine.family='startup';cases=0
    for zone in range(12):
        pointer=struct.unpack('<Q',raw(0x146bf2630+zone*240+0x88,8))[0]
        for flag in [0,1,2,255]:
            machine.reset();game=machine.game;created=[];machine.put(game+0xad8,'B',flag);machine.put(game+0x9e8,'Q',3);machine.u.reg_write(r.UC_X86_REG_R12,game)
            machine.seams[0x145898dc0]=lambda:machine.u.reg_write(r.UC_X86_REG_RAX,zone)
            machine.seams[0x14593b0f0]=lambda:created.append(machine.u.reg_read(r.UC_X86_REG_RDX))
            end=machine.run(0x14590d825,[0x14590d83b,0x14590db39]);assert(end==0x14590d83b)==bool(flag)
            if flag:machine.run(0x14590dac7,[0x14590db39])
            assert created==([pointer+104*i for i in range(5)]if flag else[]);assert machine.get(game+0x9e8,'Q')[0]==3;cases+=1
    return cases

def attraction(machine):
    machine.family='experience-attraction';cases=[]
    for serial in [0,0xfffffffe,0xffffffff]:
        for distance in [0.,6.,fb(bits(6.)+1),40.,100.,math.nan]:
            machine.reset();game,pickups=machine.game,machine.actor;packet_buffer=machine.record;captures=[]
            machine.put(game+0x610,'QQ',pickups,14);machine.put(game+0x620,'3Q',32,packet_buffer,0);machine.put(game+0xa7c,'I',serial);machine.put(game+0xa4c,'f',10.);machine.put(game+0x4d0,'3f',3.,4.,5.)
            for kind in range(7):
                for flight in range(2):
                    row=pickups+(kind*2+flight)*72;machine.put(row+0x18,'IfI',flight,999.,kind);machine.put(row+0x28,'Q',777+kind*2+flight);machine.put(row+0x34,'3f',f(3.+distance),4.,8.)
            def grow():
                vector=machine.u.reg_read(r.UC_X86_REG_RCX);cap,pointer,n=machine.get(vector,'3Q');new=machine.allocate(max(4,cap*2)*24)
                if n:machine.u.mem_write(new,bytes(machine.u.mem_read(pointer,n*24)))
                machine.put(vector,'2Q',max(4,cap*2),new)
            def packet():
                sp=machine.u.reg_read(r.UC_X86_REG_RSP);captures.append(dict(guid=machine.u.reg_read(r.UC_X86_REG_RDX),serial=machine.get(sp+0x28,'I')[0],milliseconds=machine.get(sp+0x30,'I')[0],start=machine.get(machine.u.reg_read(r.UC_X86_REG_R8),'3I'),destination=machine.get(machine.u.reg_read(r.UC_X86_REG_R9),'3I')));machine.u.mem_write(machine.u.reg_read(r.UC_X86_REG_RCX),bytes(32))
            machine.seams.update({0x145c0d9a0:grow,0x1458c3bf0:packet});machine.u.reg_write(r.UC_X86_REG_RCX,game);machine.run(0x14594eb50)
            dx=f(f(3.+distance)-3.);norm=f(math.sqrt(f(f(dx*dx)+0.)));duration=f(norm/40.)
            if not duration>fb(0x3e19999a):duration=fb(0x3e19999a)
            assert machine.get(pickups+0x18,'If')==(1,f(10.+duration));assert machine.get(game+0xa7c,'I')[0]==(serial+1)&0xffffffff
            assert captures==[dict(guid=777,serial=(serial+1)&0xffffffff,milliseconds=int(f(duration*1000.)),start=(bits(f(3.+distance)),bits(4.),bits(8.)),destination=(bits(3.),bits(4.),bits(5.)))],captures
            for i in range(1,14):assert machine.get(pickups+i*72+0x18,'If')==((i%2),999.)
            cases.append([serial,bits(distance),bits(duration),captures])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def arrival_publication(machine,raw):
    machine.family='arrival-publication';cases=[]
    for zi in range(12):
        pointer=struct.unpack('<Q',raw(0x146bf2630+zi*240+0x88,8))[0]
        for bi in range(5):
            definition=pointer+bi*104;boss_id=struct.unpack('<I',raw(definition+64,4))[0];voice=struct.unpack('<I',raw(definition+96,4))[0];final=raw(definition+100,1)[0]
            name_pointer,name_length,yell_pointer,yell_length=(*struct.unpack('<QQ',raw(definition,16)),*struct.unpack('<QQ',raw(definition+32,16)))
            for translated in [False,True]:
                machine.reset();game,frame,actors,packets=machine.game,machine.frame,machine.actor,machine.record;calls=[];lookups=[]
                machine.put(game+0x560,'3Q',4,actors,0);machine.put(game+0x620,'3Q',16,packets,0);machine.put(frame-0x40+0x18,'q',0);machine.put(frame-0x40+0x30,'Q',definition);machine.put(frame-0x40+0xf0,'Q',777)
                for reg,value in [(r.UC_X86_REG_R13,definition),(r.UC_X86_REG_R14D,boss_id),(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RDI,0),(r.UC_X86_REG_RBX,777)]:machine.u.reg_write(reg,value)
                def read(address,size):return raw(address,size)if 0x140000000<=address<0x149000000 else bytes(machine.u.mem_read(address,size))
                def format_key():
                    dest=machine.u.reg_read(r.UC_X86_REG_RCX);template=raw(machine.u.reg_read(r.UC_X86_REG_RDX),14);arguments=machine.u.reg_read(r.UC_X86_REG_R8);assert machine.get(machine.get(arguments,'Q')[0],'I')[0]==boss_id
                    assert template in[b'\x05boss.\xc0\x05.name\x00',b'\x05boss.\xc0\x05.yell\x00'];suffix='name'if template.endswith(b'name\x00')else'yell';key=f'boss.{boss_id}.{suffix}'.encode();address=machine.allocate(len(key));machine.u.mem_write(address,key);machine.put(dest,'3Q',0,address,len(key))
                def localize():
                    key=read(machine.u.reg_read(r.UC_X86_REG_RCX),machine.u.reg_read(r.UC_X86_REG_RDX));lookups.append(key.decode());text=b'LOCAL NAME'if key.endswith(b'.name')else b'LOCAL YELL'if key.endswith(b'.yell')else b'LOCAL %s enters'
                    if translated:
                        address=machine.allocate(len(text));machine.u.mem_write(address,text);machine.u.reg_write(r.UC_X86_REG_RAX,address);machine.u.reg_write(r.UC_X86_REG_RDX,len(text))
                    else:machine.u.reg_write(r.UC_X86_REG_RAX,0);machine.u.reg_write(r.UC_X86_REG_RDX,0)
                def form():
                    assert machine.get(game+0x570,'Q')[0]==1 and machine.get(actors+0x30,'Q')[0]==definition
                    assert machine.u.reg_read(r.UC_X86_REG_RDX)==777;assert machine.u.reg_read(r.UC_X86_REG_R8)==(0x146be6890 if boss_id==693 else 0x146be68b0);calls.append('initial-form')
                name=b'LOCAL NAME'if translated else raw(name_pointer,name_length);yell=b'LOCAL YELL'if translated else raw(yell_pointer,yell_length)
                def packet(kind):
                    if kind=='yell':
                        assert machine.u.reg_read(r.UC_X86_REG_RDX)==777;assert read(machine.u.reg_read(r.UC_X86_REG_R8),machine.u.reg_read(r.UC_X86_REG_R9))==name
                        sp=machine.u.reg_read(r.UC_X86_REG_RSP);assert read(machine.get(sp+0x28,'Q')[0],machine.get(sp+0x30,'Q')[0])==yell
                    else:
                        assert read(machine.u.reg_read(r.UC_X86_REG_RDX),machine.u.reg_read(r.UC_X86_REG_R8))==name
                        assert read(machine.u.reg_read(r.UC_X86_REG_R9),machine.get(machine.u.reg_read(r.UC_X86_REG_RSP)+0x28,'Q')[0])==(b'LOCAL %s enters'if translated else b'%s enters the battlefield!')
                    calls.append(kind);machine.u.mem_write(machine.u.reg_read(r.UC_X86_REG_RCX),bytes(32))
                def notice():
                    assert read(machine.u.reg_read(r.UC_X86_REG_RDX),machine.u.reg_read(r.UC_X86_REG_R8))==name;assert machine.u.reg_read(r.UC_X86_REG_R9D)==final;calls.append('notice');machine.u.mem_write(machine.u.reg_read(r.UC_X86_REG_RCX),bytes(80))
                machine.seams.update({0x145bdd130:format_key,0x14598ddd0:localize,0x145915340:form,0x1458c4010:lambda:packet('yell'),0x1458c22c0:lambda:packet('emote'),0x14598bf40:notice,0x145912fa0:lambda:calls.append('publish-notice')})
                machine.observers[0x14593bc2e]=lambda:calls.append('sound8174')
                if voice:machine.observers[0x14593bcb1]=lambda:calls.append('voice')
                machine.run(0x14593b8ca,[0x14593bd48]);expected=(['initial-form']if boss_id in[693,1091]else[])+['yell','emote','sound8174']+(['voice']if voice else[])+['notice','publish-notice'];assert calls==expected,(boss_id,calls)
                count=machine.get(game+0x630,'Q')[0];sounds=[]
                for i in range(count):
                    row=packets+i*32
                    if machine.get(row,'Q')[0]==0x20:
                        assert machine.get(row+0x18,'H')[0]==0x2d2 and machine.get(row+0x10,'Q')[0]==4;sounds.append(machine.get(machine.get(row+8,'Q')[0],'I')[0])
                assert sounds==[8174]+([voice]if voice else[]);assert lookups==[f'boss.{boss_id}.name',f'boss.{boss_id}.yell',f'boss.{boss_id}.name','%s enters the battlefield!',f'boss.{boss_id}.name'],lookups;cases.append([boss_id,translated,sounds,calls])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def initial_timers(machine,raw):
    machine.family='initial-timers';cases=[]
    for zi in range(12):
        pointer=struct.unpack('<Q',raw(0x146bf2630+zi*240+0x88,8))[0]
        for bi in range(5):
            machine.reset();definition=pointer+104*bi;start,count=struct.unpack('<QQ',raw(definition+16,16));machine.u.reg_write(r.UC_X86_REG_R13,definition);machine.u.reg_write(r.UC_X86_REG_RBX,777)
            machine.run(0x14593b3f0,[0x14593b6dd]);result=machine.u.reg_read(r.UC_X86_REG_RAX)
            actual=list(machine.get(result,str(count)+'I'))if count else[];expected=[bits(f(struct.unpack('<f',raw(start+i*56+48,4))[0]*fb(0x3f19999a)))for i in range(count)]
            assert actual==expected,(zi,bi,actual,expected);cases.append([zi,bi,actual])
    for count in [0,1,7,8,9,12,16,17]:
        machine.reset();definition,records=machine.record,machine.record+0x1000;machine.put(definition+16,'QQ',records,count)
        for i in range(count):machine.put(records+i*56+48,'f',i+1.)
        machine.u.reg_write(r.UC_X86_REG_R13,definition);machine.u.reg_write(r.UC_X86_REG_RBX,777);machine.run(0x14593b3f0,[0x14593b6dd]);result=machine.u.reg_read(r.UC_X86_REG_RAX);actual=list(machine.get(result,str(count)+'I'))if count else[]
        assert actual==[bits(f((i+1.)*fb(0x3f19999a)))for i in range(count)];cases.append([count,actual])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def multiplier(machine):
    machine.family='equipment-multiplier';cases=[]
    profiles=[[100]*4,[0]*4,[65535]*4,[90,80,70,60]]
    profiles.extend([[value if i==j else 100 for i in range(4)]for j in range(4)for value in[1,99,101,140,65535]])
    for profile in profiles:
        machine.reset();machine.put(machine.record,'4H',*profile);machine.u.reg_write(r.UC_X86_REG_RCX,machine.record);machine.run(0x14599d7a0)
        values=[f(f(value-100.)/100.)for value in profile];weighted=[f(v*fb(c))for v,c in zip(values,[0x3d4ccccd,0x3ecccccd,0x3f19999a,0x40000000])];expected=min(2.,f(f(weighted[3]+f(f(weighted[1]+weighted[0])+weighted[2]))+1.))
        actual=machine.u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff;assert actual==bits(expected),(profile,actual,bits(expected));cases.append([profile,actual])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def notices(machine):
    machine.family='notice-constructors';cases=[]
    def read(pointer,size):return machine.raw(pointer,size)if 0x140000000<=pointer<0x149000000 else bytes(machine.u.mem_read(pointer,size))
    for entry in [0x14598bf40,0x14598c950]:
        for flag in [0,1,2,255]:
            for translated in [False,True]:
                machine.reset();out,name_pointer=machine.actor,machine.record;name='Boss,🙂'.encode();machine.u.mem_write(name_pointer,name);templates=[]
                def lookup():
                    pointer=machine.u.reg_read(r.UC_X86_REG_RCX);size=machine.u.reg_read(r.UC_X86_REG_RDX);template=read(pointer,size);templates.append(template)
                    if translated:
                        value=b'TRANSLATED {name} done';pointer=machine.allocate(len(value));machine.u.mem_write(pointer,value);machine.u.reg_write(r.UC_X86_REG_RAX,pointer);machine.u.reg_write(r.UC_X86_REG_RDX,len(value))
                    else:machine.u.reg_write(r.UC_X86_REG_RAX,0);machine.u.reg_write(r.UC_X86_REG_RDX,0)
                def replace():
                    destination=machine.u.reg_read(r.UC_X86_REG_RCX);pointer=machine.u.reg_read(r.UC_X86_REG_RDX);size=machine.u.reg_read(r.UC_X86_REG_R8);template=read(pointer,size);arguments=machine.u.reg_read(r.UC_X86_REG_R9)
                    needle,length,pair=machine.get(arguments,'3Q');assert read(needle,length)==b'name';replacement,n=machine.get(pair,'2Q');assert bytes(machine.u.mem_read(replacement,n))==name
                    value=template.replace(b'{name}',name);pointer=machine.allocate(len(value));machine.u.mem_write(pointer,value);machine.put(destination,'3Q',0,pointer,len(value))
                machine.seams.update({0x14598ddd0:lookup,0x14598e180:replace});machine.u.reg_write(r.UC_X86_REG_RCX,out);machine.u.reg_write(r.UC_X86_REG_RDX,name_pointer);machine.u.reg_write(r.UC_X86_REG_R8,len(name));machine.u.reg_write(r.UC_X86_REG_R9D,flag);machine.run(entry)
                key=b'bossdown'if entry==0x14598c950 else b'finalboss'if flag else b'boss';template=b'{name} is defeated!'if entry==0x14598c950 else b'{name} has come!'if flag else b'{name} approaches!'
                assert templates==[template];cap,pointer,n=machine.get(out,'3Q');text=read(pointer,n);assert text==(b'TRANSLATED {name} done'if translated else template).replace(b'{name}',name)
                _,pointer,n=machine.get(out+0x18,'3Q');assert read(pointer,n)==name;pointer,n=machine.get(out+0x30,'2Q');assert read(pointer,n)==key;assert machine.get(out+0x40,'B')[0]==1
                cases.append([hex(entry),flag,translated,text.decode(),key.decode()])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def placement_boundaries(machine):
    machine.family='placement-boundaries';cases=0
    radius=100.;limit=f(radius+18.)
    for distance in [fb(bits(limit)-1),limit,fb(bits(limit)+1),math.nan]:
        machine.reset();machine.sx(r.UC_X86_REG_XMM13,distance);machine.sx(r.UC_X86_REG_XMM14,radius);end=machine.run(0x14593d86e,[0x14593d800,0x14593d880]);assert(end==0x14593d880)==(not distance>limit);cases+=1
    for distance in [99.,101.,math.nan]:
        limit=8. if distance>radius else 25.
        for height in [fb(bits(limit)-1),limit,fb(bits(limit)+1),math.nan]:
            machine.reset();machine.put(machine.stack+0x2c,'f',0.);machine.sx(r.UC_X86_REG_XMM13,distance);machine.sx(r.UC_X86_REG_XMM14,radius);machine.sx(r.UC_X86_REG_XMM0,height)
            end=machine.run(0x14593d899,[0x14593d800,0x14593d8c3]);assert(end==0x14593d8c3)==(not abs(height)>limit);cases+=1
    return cases

def unit_scale(machine,raw):
    machine.family='unit-scale';cases=[]
    for zi in range(12):
        pointer=struct.unpack('<Q',raw(0x146bf2630+zi*240+0x88,8))[0]
        for bi in range(5):
            definition=pointer+104*bi;boss_id,display,scale=struct.unpack('<3I',raw(definition+64,12))
            for counter in [0,0xffffffff]:
                machine.reset();game,frame=machine.game,machine.frame;captured=[]
                machine.put(game+0xa78,'I',counter);machine.u.reg_write(r.UC_X86_REG_R13,definition);machine.u.reg_write(r.UC_X86_REG_RSI,game);machine.sx(r.UC_X86_REG_XMM7,100.)
                def create():
                    sp=machine.u.reg_read(r.UC_X86_REG_RSP)
                    captured.append([machine.u.reg_read(r.UC_X86_REG_RDX),machine.u.reg_read(r.UC_X86_REG_R8D),machine.u.reg_read(r.UC_X86_REG_R9D),machine.get(sp+0x28,'I')[0]])
                machine.seams[0x14593c570]=create;machine.run(0x14593b386,[0x14593b3f0]);serial=(counter+1)&0xffffffff;guid=0xf130000000000000|((boss_id&0xffffff)<<24)|(serial&0xffffff)
                assert captured==[[guid,boss_id,display,scale]];assert machine.get(game+0xa78,'I')[0]==serial
                machine.put(frame+0xe0,'I',scale);machine.put(frame+0x18,'Q',0);fields=[]
                def field():
                    at=machine.u.reg_read(r.UC_X86_REG_RDX);fields.append([machine.get(at+32,'Q')[0],machine.u.reg_read(r.UC_X86_REG_R8D)])
                machine.seams[0x1458de1f0]=field;machine.run(0x14593c726,[0x14593c7da]);assert fields==[[4,scale]]
                cases.append([boss_id,counter,guid,scale])
    return dict(cases=len(cases),snapshots_sha256=hashlib.sha256(json.dumps(cases,separators=(',',':')).encode()).hexdigest())

def inspected_context(machine,raw,span,pe):
    decoder=Cs(CS_ARCH_X86,CS_MODE_64);decoder.detail=True
    # Independently bind the actual zero producers, every intervening write,
    # and the aggregate-offset mapping. No guessed injected zero is evidence.
    ranges={'cursor-zero-producer':(0x1458fa123,0x1458fa127),'cursor-store':(0x1458fa7ef,0x1458fa7f7),
            'deadline-constant':(0x1458fa35c,0x1458fa364),'deadline-store':(0x1458fa7f7,0x1458fa7ff),
            'aggregate-copy':(0x1458fb08f,0x1458fb0a8),'form-context':(0x14593b8ca,0x14593b8f5)}
    for first,last,register in[(0x1458fa127,0x1458fa7ef,'xmm8'),(0x1458fa364,0x1458fa7f7,'xmm0')]:
        instructions=list(decoder.disasm(raw(first,last-first),first));assert sum(i.size for i in instructions)==last-first
        calls=[i for i in instructions if i.mnemonic=='call']
        # The single copy seam follows Win64's nonvolatile XMM8 contract.
        # XMM0 is volatile, so its producer-to-store chain permits no call.
        assert [(i.address,i.op_str)for i in calls]==([(0x1458fa146,'0x145c0a3db')]if register=='xmm8'else[])
        assert not any(register in{i.reg_name(reg)for reg in i.regs_access()[1]}for i in instructions)
    assert raw(0x1458fa123,4)==bytes.fromhex('450f57c0');assert struct.unpack('<2I',raw(0x145f27d00,8))==(0,0xbf800000)
    for name,(first,last)in ranges.items():
        machine.visited.setdefault('inspected-context',{}).update({i.address:raw(i.address,i.size)for i in decoder.disasm(raw(first,last-first),first)})
    forms=[]
    for boss_id,address in[(693,0x146be688c),(1091,0x146be68ac)]:
        section=next(s for s in pe.sections if pe.image_base+s['rva']<=address<pe.image_base+s['rva']+s['raw_size']);assert not int(section['characteristics'],16)&0x80000000
        assert struct.unpack('<I',raw(address,4))[0]==boss_id and raw(address+0x1d,1)==b'\0'
        forms.append(dict(boss_id=boss_id,record=span(address,32),section_characteristics=section['characteristics'],immutable_option_offset='0x1d',option_value=0))
    return dict(defaults=dict(next_primary=0,endless_deadline_bits=0,aggregate_offset='0x28',cursor_stack_offset='0xa10',deadline_stack_offset='0xad0'),
                default_producer_to_store=[span(0x1458fa123,0x1458fa7f7-0x1458fa123),span(0x1458fa35c,0x1458fa7ff-0x1458fa35c)],
                deadline_constant=span(0x145f27d00,8),initial_forms=forms,inspected_ranges={name:span(a,b-a)for name,(a,b)in ranges.items()})

def source_connections():
    base=ROOT/'crates/azeroth-survivors-re/src';compact=lambda text:re.sub(r'\s+','',text)
    checks={
        'bosses/spawning.rs':['clock_seconds / 60.0 >= zone.bosses[index].time_minutes','self.next_primary += 1','endless && clock_seconds >= self.endless_deadline','self.endless_deadline = clock_seconds + ENDLESS_INTERVAL_SECONDS','(product as u64) >> 61 <= 4','ENDLESS_INTERVAL_SECONDS: f32 = 300.0'],
        'bosses/placement.rs':['distance >= POINT_MINIMUM_DISTANCE','POINT_MINIMUM_DISTANCE: f32 = 20.0','current.total_cmp(&candidate) != std::cmp::Ordering::Greater','Some(admitted[uniform_point(admitted.len(), rng)])','0.0, 24.0, 28.0, rng, terrain, math'],
        'bosses/raid_transforms.rs':['form_fields(&action.words[5..12], base_display, base_scale)','693 => [0, 0, 0, 1390, 0, 0, 0]','1091 => [0, 1.0_f32.to_bits(), 9806, 0, 0, 0, 0]','Some(form_fields(&descriptor, base_display, base_scale))'],
        'enemies/spawning.rs':['if !(from_center > radius + 18.0)','if !((height - player.z).abs() > max_height_delta)','for _ in 0..ANGLE_ATTEMPTS','distance -= 2.0','if (height - player.z).abs() < 25.0','populated_cells >= 401'],
        'bosses/death.rs':['state.boss_kills.wrapping_add(1)','kills_after_increment.wrapping_mul(20).wrapping_add(60)','kills_after_increment.wrapping_mul(20).wrapping_add(40)','definition.flag_54 == 1 && completion.phase as u8 == 0','std::ptr::eq(row, definition)','!(deadline > input.now)'],
        'mob_loot.rs':['(candidate.base_chance + roll.additive_chance) * multiplier > unit24(rng)','(d + ((b + a) + c) + 1.0).min(2.0)','(8..8 + count).collect()','index % pool.len() == ordinal'],
        'gameplay/mechanics.rs':['self.boss_state.forms.get(&guid).map(|form| form.fields.as_slice())','pub fn actor_form_fields(&self, guid: u64) -> Option<&[(u16, u32)]>'],
        'gameplay/mechanics/bosses.rs':['forms: &mut self.boss_state.forms','native::raid_transforms::initial_boss_fields(','self.forms.insert(guid, fields)','arrival_sounds(definition).map(RunEvent::PlaySound)','native::death::on_boss_death(','pickup_effects::attract_experience('],
        'gameplay/mechanics/pickups.rs':['if pickup.flight.is_some() || !matches!(pickup.drop, PickupDrop::Experience { .. })','run_pickups::flight_duration(','*serial = serial.wrapping_add(1)'],
        'gameplay/mechanics/showcase.rs':['if !self.showcase.enabled || self.showcase.started','self.spawn_showcase_bosses(player, velocity, world)'],
        'gameplay/visuals.rs':['form_fields: [Option<u32>; FORM_FIELD_KEYS.len()]','const FORM_FIELD_KEYS: [u16; 8] = [37, 38, 40, 41, 42, 43, 133, 164]','unit_snapshot(actor, actor.scale, game.actor_form_fields(actor.guid))','fields.extend(FORM_FIELD_KEYS.into_iter().zip(unit.form_fields)','fields: ObjectFields::from_pairs(&fields)'],
        'gameplay/client/events.rs':['RunEvent::ActorFields {target,fields}=>','SessionEvent::ObjectValues {guid:target,fields:ObjectFields::from_pairs(&fields)}','RunEvent::PlaySound(sound_id)=>','RunEvent::BossBanner {id,name,final_boss}=>'],
    }
    for path,tokens in checks.items():
        text=compact((base/path).read_text())
        for token in tokens:assert compact(token)in text,(path,token)
    text=(base/'gameplay/mechanics/bosses.rs').read_text().split('fn spawn_boss(',1)[1].split('struct BossCombat',1)[0]
    order=['self.rows.push(RunBoss','initial_boss_fields(','self.forms.insert(','let name = AnnouncementLabel::boss','RunAnnouncement::Yell','RunAnnouncement::emote','arrival_sounds(','RunEvent::BossBanner'];assert[text.index(t)for t in order]==sorted(text.index(t)for t in order)
    helper=(base/'bosses/raid_transforms.rs').read_text().split('pub fn initial_boss_fields(',1)[1].split('fn form_fields(',1)[0];assert all(t not in helper for t in['raid_cast','raid_hold','replace_moves'])
    visuals=(base/'gameplay/visuals.rs').read_text();first=visuals.split('if let Some(unit) = unit_snapshot(actor, actor.scale,',1)[1].split('// Pickups keep',1)[0];assert 'continue;'in first and '.spawn(('in first and 'unit_visual(unit, None, None)'in first
    assert 'form_fields: FORM_FIELD_KEYS.map('in visuals and 'if visual.unit != Some(unit)'in first
    boss_view=compact(visuals.split('.chain(game.bosses.iter().map(|row| {',1)[1].split('}}))',1)[0])
    for token in ['gameobject:false','actor:Some(row.actor)','name:Some(row.definition.name)','health:Some(row.health)','maximum_health:Some(row.maximum_health)','entry:Some(row.definition.id)','native_level:Some(row.native_level)']:assert token in boss_view
    assert 'native_counter::creature_guid_with_order(definition.id,self.counter)'in compact(text)
    assert '(4,unit.scale_bits)'in compact(visuals)
    client=(ROOT/'crates/benilla-app/src/local_client/actors.rs').read_text();assert 'ObjectStore(local.fields.clone().into_created(object_type))'in client and 'old.get(*field) != Some(*value)'in client and '.merge_diff(fields,'in client
    attach=(ROOT/'crates/benilla-app/src/entities/attach/mod.rs').read_text();assert 't.scale = Vec3::splat(net.scale);'in attach
    live=(ROOT/'crates/benilla-app/src/entities/live_display.rs').read_text();assert 'store.0.object_scale_x()'in live and 'to: live,'in live
    fields=(ROOT/'crates/benilla-protocol/src/messages/update_object/fields/mod.rs').read_text()
    for name,value in[('FIELD_UNIT_VIRTUAL_ITEM_SLOT_DISPLAY',37),('FIELD_UNIT_VIRTUAL_ITEM_INFO',40),('FIELD_UNIT_MOUNTDISPLAYID',133),('FIELD_UNIT_BYTES_2',164)]:assert re.search(r'\b'+name+r':\s*u16\s*=\s*'+str(value)+r'\s*;',fields)
    return dict(files=len(checks)+4,guards=sum(map(len,checks.values()))+23,arrival_order=order,first_and_later_unit_fields=[37,38,40,41,42,43,133,164],unit_scale='native constructor/transform field4; live unit snapshot forwards actor scale; client render consumes net.scale alone')

def current_owners(pe,raw,span):
    functions=[(pe.image_base+a,pe.image_base+b)for a,b,_ in pe.functions()];owners={}
    for role,(a,b)in RANGES.items():
        matches=[(first,last)for first,last in functions if first<=a<last]
        assert len(matches)<=1,(role,matches)
        if matches:
            first,last=matches[0];assert b<=last,(role,hex(b),hex(last))
            owners[role]=dict(selected_range=span(a,b-a),PE_exception_owner=span(first,last-first))
        else:
            assert role=='equipment-multiplier'
            owners[role]=dict(selected_range=span(a,b-a),PE_exception_owner=None,classification='directly called leaf code; no PE exception owner inferred')
    edges=[]
    for address,target in[(0x14593b3eb,0x14593c570),(0x14593b923,0x145915340),(0x1459409cb,0x14599d7a0)]:
        assert raw(address,1)==b'\xe8'and address+5+struct.unpack('<i',raw(address+1,4))[0]==target,(hex(address),hex(target))
        edges.append(dict(call=span(address,5),target=hex(target)))
    return dict(ranges=owners,direct_calls=edges)

def rea_provenance(out,raw,span,target,stage):
    if stage:
        operations=[]
        for role in ['placement','fallback','equipment']:
            response=ROOT/('runtime/raid-boss-lifecycle-0.112.0/rea-'+role+'/003-analyze_function.json')
            result=json.loads(response.read_text())['response']['result']['structuredContent'];profile=result['analysis_profile'];parameters=profile['parameters']
            start,end=RANGES[{'placement':'placement','fallback':'fallback-placement','equipment':'equipment-provider'}[role]]
            raw_pseudo=result['normalized_result']['pseudocode'];assert isinstance(raw_pseudo,str)and raw_pseudo
            text='\n'.join(line.rstrip()for line in raw_pseudo.strip().splitlines())+'\n';name=role+'.pseudo.c';(out/name).write_text(text)
            assert result['subject']['digest']['sha256']==span(start,end-start)['sha256']
            operations.append(dict(role=role,operation=result['operation'],provider=result['provider'],va=hex(start),byte_count=end-start,input_sha256=span(start,end-start)['sha256'],
                evidence_id=result['evidence_id'],analysis_profile_sha256=profile['digest'],language_id=parameters['language_id'],compiler_spec_id=parameters['compiler_spec_id'],analyzer_preset=parameters['analyzer_preset'],
                pseudocode=name,pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest(),raw_pseudocode_sha256=hashlib.sha256(raw_pseudo.encode()).hexdigest(),pseudocode_normalization='outer blank lines and trailing whitespace removed; original response retained under ignored runtime'))
        record=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,operations=operations,
            limits=['Headerless raw-function imports map file offset0 at independently verified current PE entries; external data, calls, broader callers/types and target compiler ABI are unresolved.',
                    'The placement raw import ends in a tail jump outside its input; Ghidra bad-data warning does not certify that tail. Current-byte fixtures execute the separately mapped fallback body.',
                    'Assembly and byte-executed fixtures own exact instructions and source formulas; raw-import inferred names, signatures and body partitions are not function census claims.'])
        (out/'rea-provenance.json').write_text(portable_json(record,indent=2)+'\n')

def retain_evidence(out,machine,raw,span,stage):
    canonical=ROOT/'docs/analysis/evidence/0.112.0'
    # Explicit delivered dependencies only: no ambient tree or runtime scan can
    # assign an instruction to another task's pending or future artifact.
    files=['raid-hazards/transform-unit.asm','raid-lifecycles/selected-native.asm',
           'raid-guardian-lifecycle/selected-native.asm','raid-wards/unit-presentation.asm']
    candidates={}
    for file in files:
        rows={}
        for line in(canonical/file).read_text().splitlines():
            match=re.match(r'^([0-9a-f]+): ([0-9a-f]+) ',line)
            if match:
                address=int(match[1],16);value=bytes.fromhex(match[2]);assert address not in rows and raw(address,len(value))==value,(file,hex(address));rows[address]=value
        assert rows,file;candidates['../'+file]=rows
    prior=None if stage else json.loads((out/'manifest.json').read_text())
    recorded={}
    if prior:
        for intervals in prior['visited_instruction_ranges'].values():
            for interval in intervals:
                a=int(interval['va'],16);b=a+interval['byte_count'];instructions=list(machine.md.disasm(raw(a,b-a),a));assert sum(i.size for i in instructions)==b-a
                for i in instructions:
                    if i.address in recorded:assert recorded[i.address]==interval['assembly']
                    recorded[i.address]=interval['assembly']
    owners={};new={}
    for addresses in machine.visited.values():
        for address,value in addresses.items():
            if address in owners:continue
            if stage:owner=next((name for name,rows in candidates.items()if rows.get(address)==value),'selected-native.asm')
            else:
                owner=recorded[address]
                if owner!='selected-native.asm':assert candidates[owner].get(address)==value,(owner,hex(address))
            owners[address]=owner
            if owner=='selected-native.asm':new[address]=value
    assembly=''
    for address,value in sorted(new.items()):
        instructions=list(machine.md.disasm(value,address));assert sum(i.size for i in instructions)==len(value)
        assembly+=''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n'for i in instructions)
    if stage:(out/'selected-native.asm').write_text(assembly)
    else:assert(out/'selected-native.asm').read_text()==assembly
    traces={}
    for family,addresses in machine.visited.items():
        intervals=[]
        for address,value in sorted(addresses.items()):
            owner=owners[address]
            if intervals and intervals[-1][1]==address and intervals[-1][2]==owner:intervals[-1][1]+=len(value)
            else:intervals.append([address,address+len(value),owner])
        traces[family]=[dict(**span(a,b-a),assembly=owner)for a,b,owner in intervals]
    used=sorted({owner for owner in owners.values()if owner!='selected-native.asm'})
    return dict(visited_instruction_ranges=traces,canonical_assembly_dependencies=used,
        retained_new_instruction_rows=len(new),reused_instruction_rows=len(owners)-len(new))

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');parser.add_argument('--verify-stage',action='store_true');args=parser.parse_args();assert not(args.stage and args.verify_stage)
    mod=load('current_primary_raid','scripts/check-raid-target.py');target,raw,span,graph,headers=mod.recover();mod.check_graph(graph,headers)
    pe=load('boss_current_mapping','scripts/inventory-executable.py').PE(target_bytes(target))
    machine=Machine(raw);counts={'schedule':schedule(machine,raw,headers),'points':point_placement(machine,raw),'initial_forms':initial_forms(machine,raw,graph),'shared_placement':shared_placement(machine,raw),'equipment_provider':equipment_provider(machine,raw)}
    counts['primary_death']=primary_death(machine,raw,counts['equipment_provider'])
    counts['startup']=startup(machine,raw);counts['attraction']=attraction(machine)
    counts['arrival_publication']=arrival_publication(machine,raw)
    counts['initial_timers']=initial_timers(machine,raw);counts['equipment_multiplier']=multiplier(machine)
    counts['notices']=notices(machine)
    counts['placement_boundaries']=placement_boundaries(machine)
    counts['unit_scale']=unit_scale(machine,raw)
    context=inspected_context(machine,raw,span,pe);source=source_connections();owners=current_owners(pe,raw,span)
    out=STAGE if args.stage or args.verify_stage else KEPT
    if args.stage:out.mkdir(parents=True,exist_ok=True)
    rea_provenance(out,raw,span,target,args.stage);mod.verify_rea_operations(raw,out,target['sha256'])
    canonical=ROOT/'docs/analysis/evidence/0.112.0';dependencies=[]
    for family in ['raid-hazards','raid-inputs','raid-guardian-lifecycle']:
        mod.verify_rea_operations(raw,canonical/family,target['sha256']);dependencies.append(dict(path='../'+family+'/rea-provenance.json',target_sha256=target['sha256']))
    hit=json.loads((canonical/'warrior-talents/manifest.json').read_text());assert hit['target']['sha256']==target['sha256'];victim=next(row for row in hit['ghidra']if row['role']=='victim-hit');assert victim['input_sha256']==span(0x14593ec90,0x145942543-0x14593ec90)['sha256']
    dependencies.append(dict(path='../warrior-talents/manifest.json',role='victim-hit',evidence_id=victim['evidence_id'],input_range=span(0x14593ec90,0x145942543-0x14593ec90)))
    retained=retain_evidence(out,machine,raw,span,args.stage)
    calls={family:dict(intercepted_seams=[hex(a)for a in sorted(machine.seam_calls.get(family,set()))],observed_calls=[dict(instruction=span(a,5),target=hex(b),role='intercepted seam'if b in machine.seam_calls.get(family,set())else'byte-executed same-scope helper')for a,b in sorted(edges)])for family,edges in machine.call_edges.items()}
    result=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,cases=counts,source_checks=source,
        inspected_context=context,current_owner_provenance=owners,call_boundaries=calls,rea_dependencies=dependencies,**retained,
        limits=['Synthetic Win64 CPU fixtures execute original instructions only; no Rust/compiler, reference game or rebuilt game runs.',
                'Inspected-context rows and producer-to-store no-clobber commitments are static checks, separate from case execution. The constructor copy seam retains the Win64 nonvolatile XMM8 contract.',
                'CRT trigonometry/hypot, allocation/vector growth/copy, localization and packet/notice serialization are controlled seams. The actual PE helper call targets and fixture seam entries are explicit.',
                'Terrain height uses controlled providers; MPQ terrain, navigation construction and CRT implementation equivalence remain unverified. Shared placement executes actual current navigation/cell consumer checks.',
                'Whole shared actor construction is not executed. Current boss caller arguments/GUID/scale and the constructor field4 write are checked; effective first/later UNIT descriptors are source traced through the existing client.',
                'XP/gold/magnet pickup creation and account/presentation publishing are intercepted at actual calls; their callers, counts, positions, RNG admissions and ordering are checked. Guardian completion/provider and shared hit/buff proofs remain separate dependencies.',
                'Whole shared-frame callbacks, client packet/wire parity, presentation/audio timing and gameplay parity remain open. Global #41 can reveal undiscovered producers beyond the selected reachable raid graph.'])
    text=json.dumps(result,indent=2)+'\n'
    if args.stage:(out/'manifest.json').write_text(text)
    else:assert(out/'manifest.json').read_text()==text
    print('Current primary-boss lifecycle cases:',{k:v if isinstance(v,int)else v['cases']for k,v in counts.items()},'; source guards:',source['guards'],'; no compilation/game')

if __name__=='__main__':main()
