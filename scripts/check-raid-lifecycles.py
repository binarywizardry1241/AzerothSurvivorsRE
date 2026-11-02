#!/usr/bin/env python3
"""Revalidate current raid lifecycle/packet consumers without compiling or games.

All fixtures execute current original instructions. Historical inputs retain
provenance; they are not current target evidence. Native calls are rejected or
intercepted at explicit fixture seams. --stage writes unique ignored evidence.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse, hashlib, json, math, re, struct, sys
from pathlib import Path
from coverage_common import ROOT
sys.path[:0]=[str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
STAGE=ROOT/'runtime/native-evidence/0.112.0/raid-lifecycles'
KEPT=ROOT/'docs/analysis/evidence/0.112.0/raid-lifecycles'
def f32(v):
    return _shared_f32(v)
def bits(v):
    return _shared_bits(v)
RANGES={
 'aura-applications':(0x14599c8e0,0x14599cc82),
 'aura-helper':(0x14594dd20,0x14594e43e),
 'cone-producer':(0x145921a74,0x145921b9b),
 'damage-product':(0x14593f235,0x14593f248),
 'drifting-circles':(0x145921b9b,0x145921f32),
 'knockback-packet':(0x1458c2cd0,0x1458c2f95),
 'knockback-producer':(0x14591fde4,0x14591fed5),
 'minions':(0x145920ffb,0x1459211a4),
 'sequence':(0x1459211a4,0x1459212f9),
 'speed-high':(0x145924232,0x145924326),
 'speed-low':(0x145923db3,0x145923df4),
 'speed-prefix':(0x14591fb98,0x14591fbfb),
 'speed-special':(0x1459249a0,0x1459249ad),
 'whirlwind-speed':(0x145946b34,0x145946b58),
 'actor-iterator':(0x145945cdc,0x145945d1a),
 'duration-block-type-gates':(0x14591fb22,0x14591fb88),
 'guardian-engage-scalars':(0x14594a153,0x14594a1ba),
}
def shield_contracts(raw,rows):
    sys.path[:0]=[str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_MEM_UNMAPPED,UC_HOOK_CODE
    from unicorn import x86_const as r
    md=Cs(CS_ARCH_X86,CS_MODE_64);uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def demand(machine,access,a,size,value,user):
        page=a&~4095
        if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    game,actors,record,frame,stack,periodic=(0x71000000,0x71010000,0x71020000,0x71030000,0x71040000,0x71050000)
    for base in [game,actors,record,frame,stack,periodic]:uc.mem_map(base,0x10000)
    def put(a,fmt,*values):uc.mem_write(a,struct.pack('<'+fmt,*values))
    def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v):uc.reg_write(reg,bits(v))
    def xf(reg):return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    stops=set();allowed=(0,0)
    def hook(machine,a,size,user):
        if a in stops:uc.emu_stop();return
        assert allowed[0]<=a<allowed[1],hex(a)
        i=next(md.disasm(bytes(uc.mem_read(a,size)),a));assert i.mnemonic!='call',hex(a)
    uc.hook_add(UC_HOOK_CODE,hook)
    def run(a,b,ends):
        nonlocal allowed,stops
        allowed=(a,b);stops=set(ends);uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        uc.emu_start(a,0,count=10000);assert uc.reg_read(r.UC_X86_REG_RIP) in stops
    cases=0
    for row in rows:
      seconds=struct.unpack('<f',struct.pack('<I',row['duration_bits']))[0]
      for old in [0.,100.,math.nan]:
        put(game+0x568,'QQ',actors,1);put(record,'II',row['spell'],row['duration_bits'])
        put(frame+0xf0,'Q',0);put(actors+0x1c8,'f',old)
        uc.reg_write(r.UC_X86_REG_RSI,game);uc.reg_write(r.UC_X86_REG_RCX,record)
        uc.reg_write(r.UC_X86_REG_RBX,0);uc.reg_write(r.UC_X86_REG_RBP,frame);sx(r.UC_X86_REG_XMM15,10.)
        run(0x145921951,0x14592198a,[0x14592198a]);assert get(actors+0x1c8,'f')[0]==f32(10.+seconds)
        cases+=1
    for primary,guardian in [(False,False),(True,False),(False,True),(True,True)]:
      for shield in [8.,10.,12.,math.nan]:
       for exposed in [8.,10.,12.,math.nan]:
        put(actors+0x18,'q',0 if primary else -1);put(actors+0x58,'q',0 if guardian else -1)
        put(actors+0x1c8,'ff',shield,exposed)
        uc.reg_write(r.UC_X86_REG_R14,actors);uc.reg_write(r.UC_X86_REG_RDX,0x1d8)
        sx(r.UC_X86_REG_XMM0,1.);sx(r.UC_X86_REG_XMM1,10.)
        run(0x14593f1ac,0x14593f1f3,[0x14593f1f3,0x14593f2ed])
        expected=1. if not(primary or guardian) else 1.5 if exposed>10 else .25 if shield>10 else 1.
        assert xf(r.UC_X86_REG_XMM0)==expected,(primary,guardian,shield,exposed)
        cases+=1
    for talent in [0.,1.,1.125,3.]:
     for power in [0.,.01,5.,100.,math.nan]:
      for factor in [1.,.25,1.5]:
        sx(r.UC_X86_REG_XMM8,talent);sx(r.UC_X86_REG_XMM6,power);sx(r.UC_X86_REG_XMM0,factor)
        run(*RANGES['damage-product'],[RANGES['damage-product'][1]])
        product=f32(f32(talent*power)*factor);expected=product if product>=1 else 1.
        assert xf(r.UC_X86_REG_XMM8)==expected
        cases+=1
    # Current aura slot admission/mutation reaches its first field insertion;
    # unchanged requests return without touching the map or publishing fields.
    for index in range(16):
     for add in [False,True]:
        slots=[500+i for i in range(16)];spell=900
        slots[index]=0 if add else spell
        put(game+0x568,'QQ',actors,1);put(actors+0xf0,'Q',77);put(actors+0xb0,'I',0)
        put(actors+0x118,'16I',*slots);sp=stack+0x8000;stop=stack+0xf000;put(sp,'Q',stop)
        uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,game)
        uc.reg_write(r.UC_X86_REG_RDX,77);uc.reg_write(r.UC_X86_REG_R8D,spell);uc.reg_write(r.UC_X86_REG_R9D,int(add))
        run(*RANGES['aura-helper'],[0x14594e114,stop])
        assert uc.reg_read(r.UC_X86_REG_RIP)==0x14594e114
        slots[index]=spell if add else 0
        assert get(actors+0x118,'16I')==tuple(slots)
        bp=uc.reg_read(r.UC_X86_REG_RBP);assert get(bp+0x30,'Q')[0]==79+index
        # Separately execute the native flag-word constructor, not its BTree allocator.
        uc.reg_write(r.UC_X86_REG_RDI,index);uc.reg_write(r.UC_X86_REG_RSI,actors);uc.reg_write(r.UC_X86_REG_R14,0)
        run(0x14594e11a,0x14594e1e1,[0x14594e1e1])
        group=index//8;flags=sum((2 if v else 0)<<(4*i) for i,v in enumerate(slots[group*8:group*8+8]))
        assert uc.reg_read(r.UC_X86_REG_R8D)==flags
        cases+=1
    patterns=[[],[(0,500,1)],[(0,500,1),(0,500,1)],[(1,500,1),(1,500,1)],
        [(0,500,1),(1,500,1),(1,500,1),(0,501,0),(2,503,3)],
        [(0,500,1)]*260+[(2,501,1)]*5]
    for group in range(4):
     for rows in patterns:
        slots=[0]*16;slots[group*4:group*4+4]=[500,501,0,503]
        put(actors+0x118,'16I',*slots);put(actors+8,'QQ',periodic,len(rows))
        uc.mem_write(periodic,bytes(0x8000))
        for i,(owner,spell,ticks) in enumerate(rows):
            put(periodic+48*i,'B',owner);put(periodic+48*i+0x10,'I',spell);put(periodic+48*i+0x20,'I',ticks)
        sp=stack+0x8000;stop=stack+0xf000;put(sp,'Q',stop)
        uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,actors);uc.reg_write(r.UC_X86_REG_RDX,group)
        run(*RANGES['aura-applications'],[stop])
        expected=0
        for byte,spell in enumerate([500,501,0,503]):
            count=sum(owner==0 and s==spell and ticks!=0 for owner,s,ticks in rows)
            if count==0:count=sum(owner!=0 and s==spell and ticks!=0 for owner,s,ticks in rows)
            if spell:expected|=max(min(count,255)-1,0)<<(byte*8)
        assert uc.reg_read(r.UC_X86_REG_EAX)==expected,(group,len(rows),uc.reg_read(r.UC_X86_REG_EAX),expected)
        cases+=1
    for exposed in [0.,20.,math.nan]:
        put(actors+0x1c8,'ff',12.,exposed);uc.reg_write(r.UC_X86_REG_RCX,actors)
        run(0x1459b81cf,0x1459b81d9,[0x1459b81d9])
        assert get(actors+0x1c8,'I')[0]==bits(0.) and get(actors+0x1cc,'I')[0]==bits(exposed)
        cases+=1
    return cases

def sequence_contracts(raw,catalog):
 selected=[(i,row)for i,row in enumerate(catalog['actions'])if row['native_tag']in[18,24]]
 sys.path[:0]=[str(ROOT/'runtime/armory-recovery/python-libs'),str(ROOT/'runtime/camera-recovery-0.105.0/python-libs')]
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_MEM_UNMAPPED,UC_HOOK_CODE
 from unicorn import x86_const as r
 md=Cs(CS_ARCH_X86,CS_MODE_64);uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
 def demand(machine,access,address,size,value,user):
  page=address&~4095
  if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
  return True
 uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
 game,record,frame,stack,queue,hazards=(0x71000000,0x71010000,0x71020000,0x71030000,0x71040000,0x71050000)
 for a in [game,record,frame,stack,queue,hazards]:uc.mem_map(a,0x10000)
 def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
 def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
 def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
 def f32(v):return struct.unpack('<f',struct.pack('<f',v))[0]
 def sx(reg,v):uc.reg_write(reg,bits(v))
 allowed=(0,0);calls=[];stop=0x14591f828
 def hook(machine,a,size,user):
  if a==stop:uc.emu_stop();return
  if a in [0x14591f790,0x14591f6a0,0x14589f770,0x1458a0b40,0x145c0a417,0x145c0a411,0x14593dd90]:
   if a==0x14591f790:calls.append(bytes(uc.mem_read(uc.reg_read(r.UC_X86_REG_R8),48)))
   elif a==0x14593dd90:calls.append((uc.reg_read(r.UC_X86_REG_RDX),get(uc.reg_read(r.UC_X86_REG_R8),'Ifff')))
   elif a in [0x14589f770,0x1458a0b40]:sx(r.UC_X86_REG_XMM0,9.);uc.reg_write(r.UC_X86_REG_RAX,1)
   elif a in [0x145c0a417,0x145c0a411,0x14593dd90]:
    import math
    value=struct.unpack('<f',uc.reg_read(r.UC_X86_REG_XMM0).to_bytes(16,'little')[:4])[0]
    sx(r.UC_X86_REG_XMM0,(math.cos if a==0x145c0a417 else math.sin)(value))
   sp=uc.reg_read(r.UC_X86_REG_RSP);dest=get(sp,'Q')[0];uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,dest);return
  assert allowed[0]<=a<allowed[1],hex(a)
  ins=next(md.disasm(bytes(uc.mem_read(a,size)),a));assert ins.mnemonic!='call' or int(ins.op_str,16) in [0x14591f790,0x14591f6a0,0x14589f770,0x1458a0b40,0x145c0a417,0x145c0a411,0x14593dd90],hex(a)
 uc.hook_add(UC_HOOK_CODE,hook);cases=0
 for index,row in selected:
  words=row['words'];tag=row['native_tag'];payload=struct.pack('<12I',*words)
  for now in [0.,10.,100000.]:
   calls.clear();uc.mem_write(record,payload);put(game+0xa4c,'f',now);put(game+0x5a8,'QQQ',64,queue,0);put(game+0x590,'QQQ',64,hazards,0)
   put(frame+0xf0,'Q',0);put(frame+0x180,'Q',77);put(frame+0x150,'4f',1.,2.,3.,0.);put(frame+0xd0,'4f',5.,2.,7.,0.);put(frame+0x178,'f',0.)
   uc.reg_write(r.UC_X86_REG_RSI,game);uc.reg_write(r.UC_X86_REG_RCX,record);uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000)
   uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80);sx(r.UC_X86_REG_XMM15,now);sx(r.UC_X86_REG_XMM14,10.)
   allowed=RANGES['sequence' if tag==18 else 'drifting-circles'];uc.emu_start(allowed[0],0,count=100000);assert uc.reg_read(r.UC_X86_REG_RIP)==stop
   if tag==18:
    children=row['children'];assert len(calls)==1;first=catalog['actions'][children[0]]
    assert calls[0]==struct.pack('<12I',*first['words']);assert get(game+0x5b8,'Q')[0]==len(children)-1
    spacing=struct.unpack('<f',struct.pack('<I',words[4]))[0]
    for j,child in enumerate(children[1:],1):
     at=queue+(j-1)*64;assert get(at,'Q')[0]==77;assert get(at+8,'f')[0]==f32(f32(j*spacing)+now)
     assert bytes(uc.mem_read(at+16,48))==struct.pack('<12I',*catalog['actions'][child]['words'])
   else:
    import math
    count=max(words[1],1);assert get(game+0x5a0,'Q')[0]==count
    f=lambda i:struct.unpack('<f',struct.pack('<I',words[i]))[0]
    middle=f32(f32(float(words[1])-1.)*.5)
    for j in range(count):
     at=hazards+j*128;angle=f32(f32(float(j)-middle)*f32(1.2))
     assert get(at+0x10,'I')[0]==3 and get(at+0x30,'I')[0]==0
     assert get(at+0x34,'I')[0]==words[2] and get(at+0x70,'I')[0]==words[3]
     assert get(at+0x14,'f')[0]==f32(f32(now+1.)+f(4));assert get(at+0x54,'f')[0]==f32(now+1.)
     assert get(at+0x60,'f')[0]==f32(10.*f(5));assert get(at+0x18,'f')[0]==.5
     assert get(at+0x40,'f')[0]==f32(f32(f32(math.cos(angle))*3.)+1.)
     assert get(at+0x44,'f')[0]==f32(f32(f32(math.sin(angle))*3.)+2.)
   cases+=1
 # Current minion5 retains the historical semantic count/index/placement
 # contract. The actor constructor remains an explicit live adapter seam.
 import math
 for count in sorted({0,1,2,3,*(row['words'][0] for row in catalog['actions'] if row['native_tag']==5)}):
  calls.clear();put(frame+0x150,'4f',1.,2.,3.,0.);put(game+0x9b0,'Q',record)
  uc.reg_write(r.UC_X86_REG_RSI,game);uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000);uc.reg_write(r.UC_X86_REG_R13D,count)
  allowed=RANGES['minions'];uc.emu_start(0x145921086,0,count=100000);assert uc.reg_read(r.UC_X86_REG_RIP)==stop
  assert len(calls)==count
  for index,(enemy,fields) in enumerate(calls):
   assert enemy==int(index%3==2) and fields[0]==1
   angle=f32(f32(index/count)*f32(math.tau))
   assert fields[1:]==(f32(f32(f32(math.cos(angle))*5.)+1.),f32(f32(f32(math.sin(angle))*5.)+2.),9.)
  cases+=1
 # Independent original instructions for the whirlwind multiplier, NaN and strictdeadline.
 for now in [0.,10.,float('nan')]:
  for until in [0.,10.,11.,float('nan')]:
   put(record+0x1c4,'f',until);uc.reg_write(r.UC_X86_REG_R14,record);sx(r.UC_X86_REG_XMM6,now);sx(r.UC_X86_REG_XMM1,2.)
   allowed=RANGES['whirlwind-speed'];end=allowed[1]
   # This fragment has no calls. A separate short engine avoids changing the main hook's stop contract.
   wu=Uc(UC_ARCH_X86,UC_MODE_64);wu.mem_map(0x145946000,4096);wu.mem_write(allowed[0],raw(allowed[0],end-allowed[0]));wu.mem_map(record,4096);wu.mem_write(record+0x1c4,struct.pack('<f',until));wu.mem_map(0x146c08000,4096);wu.mem_write(0x146c08b44,raw(0x146c08b44,4));wu.reg_write(r.UC_X86_REG_R14,record);wu.reg_write(r.UC_X86_REG_XMM6,bits(now));wu.reg_write(r.UC_X86_REG_XMM1,bits(2.));wu.emu_start(allowed[0],end)
   got=struct.unpack('<f',wu.reg_read(r.UC_X86_REG_XMM2).to_bytes(16,'little')[:4])[0];assert got==f32(2.*f32(1.35)) if now<until else got==2.;cases+=1
 return cases

def line_contracts(raw):
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    records=[]
    md=Cs(CS_ARCH_X86,CS_MODE_64)
    uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def demand(machine,access,address,size,value,user):
        a=address&~4095
        if a not in mapped:
            v=raw(a,4096);uc.mem_map(a,4096);uc.mem_write(a,v);mapped.add(a)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    game,record,rows,frame,world,stack,actors,queue,events=[0x70000000+i*0x10000 for i in range(9)]
    for base in [game,record,rows,frame,world,stack,actors,queue,events]:uc.mem_map(base,0x4000)
    def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v):uc.reg_write(reg,bits(v))
    def xf(reg):return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    calls=[];primary_valid=True;primary_height=4.;angle=0.;fraction=1.;stop=None
    seams={0x145c0a417:'cos',0x145c0a411:'sin',0x14591f1d0:'hold',
           0x14591f6a0:'cast',0x1458a0b40:'primary',0x1458a4d60:'secondary',
           0x1459a8990:'ray',0x1458c3bf0:'movement',0x1458ce7d0:'spell-go',
           0x1458ae4b0:'packet-xyz'}
    def hook(machine,a,size,user):
        if a==stop:machine.emu_stop();return
        ins=next(md.disasm(bytes(uc.mem_read(a,size)),a))
        if ins.mnemonic=='call':
            destination=int(ins.op_str,16)
            assert destination in seams or destination in [0x1459a9240,0x14591f490,0x14591f110],hex(destination)
        if a not in seams:return
        name=seams[a]
        if name=='cos':sx(r.UC_X86_REG_XMM0,math.cos(xf(r.UC_X86_REG_XMM0)))
        elif name=='sin':sx(r.UC_X86_REG_XMM0,math.sin(xf(r.UC_X86_REG_XMM0)))
        elif name=='ray':sx(r.UC_X86_REG_XMM0,fraction)
        elif name=='primary':uc.reg_write(r.UC_X86_REG_RAX,int(primary_valid));sx(r.UC_X86_REG_XMM0,primary_height)
        elif name=='secondary':put(uc.reg_read(r.UC_X86_REG_RCX),'I',0)
        elif name=='hold':calls.append((name,xf(r.UC_X86_REG_XMM2),uc.reg_read(r.UC_X86_REG_R9D),get(uc.reg_read(r.UC_X86_REG_RSP)+0x28,'f')[0]))
        elif name=='cast':calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
        elif name=='movement':
            sp=uc.reg_read(r.UC_X86_REG_RSP)
            calls.append((name,get(uc.reg_read(r.UC_X86_REG_R8),'3f'),get(uc.reg_read(r.UC_X86_REG_R9),'3f'),get(sp+0x28,'I')[0],get(sp+0x30,'I')[0]))
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
        elif name=='spell-go':
            calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),get(uc.reg_read(r.UC_X86_REG_RSP)+0x30,'Q')[0]))
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
        elif name=='packet-xyz':
            header=uc.reg_read(r.UC_X86_REG_RDX);capacity,buffer,length=get(header,'QQQ')
            xyz=bytes(uc.mem_read(uc.reg_read(r.UC_X86_REG_R8),12))
            assert capacity>=length+12;uc.mem_write(buffer+length,xyz)
            put(uc.reg_read(r.UC_X86_REG_RCX),'QQQ',capacity,buffer,length+12)
            put(uc.reg_read(r.UC_X86_REG_RCX)+24,'Q',get(header+24,'Q')[0])
        sp=uc.reg_read(r.UC_X86_REG_RSP);ret=get(sp,'Q')[0];uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,ret)
    uc.hook_add(UC_HOOK_CODE,hook)
    def setup():
        for base in [game,record,rows,frame,world,stack,actors,queue,events]:uc.mem_write(base,bytes(0x4000))
        put(game+0x568,'QQ',actors,1);put(game+0x590,'QQQ',64,rows,0)
        put(game+0x5a8,'QQQ',64,queue,0);put(game+0x620,'QQQ',64,events,0)
        put(game+0x9b0,'Q',world);put(game+0xa4c,'f',10.);put(game+0xa50,'I',0xffffffff)
        put(world+0x40,'Q',0);put(world+0x68,'Q',0xffffffffffffffff);put(world+0xb8,'f',9.)
        put(frame+0xf0,'Q',0);put(frame+0x180,'Q',77)
        for reg,v in [(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RCX,record),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack+0x1000),(r.UC_X86_REG_RBX,0)]:uc.reg_write(reg,v)
        uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80);uc.reg_write(r.UC_X86_REG_EFLAGS,2)
        calls.clear()
    producer_cases=0
    for distance in [0.,3.,50.]:
      for scale in [0.,4.,10.,float('nan')]:
       for fraction in [0.,.5,1.]:
        for primary_valid in [False,True]:
            setup();primary_height=4.;angle=0.
            put(record,'I',100);put(frame+0x150,'4f',0.,0.,0.,0.)
            put(frame+0xa8,'3f',0.,0.,2.);put(frame+0xd0,'4f',distance,0.,0.,0.)
            put(frame+0xe0,'f',0.);put(frame+0x178,'f',angle);put(actors+0x170,'f',scale)
            sx(r.UC_X86_REG_XMM10,0.);sx(r.UC_X86_REG_XMM11,3.);sx(r.UC_X86_REG_XMM14,100.);sx(r.UC_X86_REG_XMM15,10.)
            stop=0x14591f828;uc.emu_start(0x145920515,0,count=2000)
            assert uc.reg_read(r.UC_X86_REG_RIP)==stop
            extended=f32(distance+6.);clip=max(0.,f32(fraction-f32(.5/max(extended,.5)))) if fraction<1. else 1.
            dest=f32(extended*clip);length=max(dest,4.)
            expected_width=min(max(f32(scale*f32(1.2)),4.),7.) if not math.isnan(scale) else math.nan
            assert calls[0]==('hold',f32(f32(length/40.)+1.),1,0.)
            assert calls[1]==('cast',100,1.)
            assert get(game+0x5a0,'Q')[0]==1 and get(rows+0x30,'I')[0]==2
            assert get(rows+0x34,'I')[0]==bits(length)
            assert get(rows+0x38,'I')[0]==bits(expected_width)
            assert get(rows+0x3c,'I')[0]==0 and get(rows+0x50,'2f')==(10.,11.)
            assert get(rows+0x60,'f')[0]==200. and get(rows+0x5c,'I')[0]==0
            assert get(game+0x5b8,'Q')[0]==1 and get(queue,'Q')[0]==77
            assert get(queue+8,'f')[0]==11. and get(queue+0x3d,'B')[0]==35
            assert get(queue+0x10,'f')[0]==dest
            expected_z=primary_height if primary_valid else f32(f32(f32(3.-2.)*clip)+2.)
            assert get(queue+0x18,'I')[0]==bits(expected_z)
            producer_cases+=1
    movement_cases=0
    for length in [0.,3.,40.,100.]:
      for prior in [0.,10.,float('nan')]:
       for primary_valid in [False,True]:
            setup();put(actors+0xf0,'Q',77);put(actors+0x180,'3f',0.,0.,2.)
            put(actors+0x198,'f',prior);put(frame+0x248,'Q',game);put(frame+0x270,'f',length)
            put(frame+0x1a8,'2f',0.,5.);put(frame+0x290,'Q',game+0x620)
            for reg,v in [(r.UC_X86_REG_RAX,actors),(r.UC_X86_REG_RBX,0),(r.UC_X86_REG_RDI,0)]:uc.reg_write(reg,v)
            for reg,v in [(r.UC_X86_REG_XMM15,0.),(r.UC_X86_REG_XMM14,40.),(r.UC_X86_REG_XMM13,f32(.15)),(r.UC_X86_REG_XMM11,1000.),(r.UC_X86_REG_XMM10,4294967040.),(r.UC_X86_REG_XMM8,f32(.2))]:sx(reg,v)
            stop=0x145916c64;uc.emu_start(0x14591692b,0,count=2000)
            duration=max(f32(length/40.),f32(.15));from_z=primary_height if primary_valid else 2.
            assert calls[0]==('movement',(0.,0.,from_z),(length,0.,5.),1,int(f32(duration*1000.)))
            assert calls[1][0:2]==('spell-go',100)
            assert get(actors+0x174,'3f')==(0.,0.,from_z)
            assert get(actors+0x180,'3f')==(length,0.,5.)
            assert get(actors+0x18c,'2f')==(10.,duration)
            assert get(actors+0x194,'I')[0]==bits(f32(f32(10.+duration)+f32(.2)))
            assert get(actors+0x198,'I')[0]==bits(max(prior,f32(duration+f32(.4))) if not math.isnan(prior) else f32(duration+f32(.4)))
            movement_cases+=1
    admission_cases=0
    for deadline in [10.,11.,float('nan')]:
      for now in [10.,11.,float('nan')]:
        setup();put(game+0x5b0,'Q',queue);put(queue+8,'f',deadline);put(frame+0x234,'f',now)
        uc.reg_write(r.UC_X86_REG_R13,game);uc.reg_write(r.UC_X86_REG_RCX,0)
        stop=0x145916671 if not deadline>now else 0x145916640
        uc.emu_start(0x145916653,0,count=20);assert uc.reg_read(r.UC_X86_REG_RIP)==stop
        admission_cases+=1
    membership_cases=0
    for along,across in [(a,b) for a in [-.001,0.,10.,10.001] for b in [-2.001,-2.,0.,2.,2.001]]:
        setup();put(rows+0x38,'f',4.)
        uc.reg_write(r.UC_X86_REG_R13,rows);sx(r.UC_X86_REG_XMM6,0.);sx(r.UC_X86_REG_XMM8,10.)
        uc.reg_write(r.UC_X86_REG_XMM14,bits(along)|(bits(across)<<32))
        uc.reg_write(r.UC_X86_REG_XMM11,int.from_bytes(struct.pack('<4I',*[0x7fffffff]*4),'little'))
        sx(r.UC_X86_REG_XMM7,.5);stop=0x14591834b if 0.<=along<=10. else 0x1459183d6
        uc.emu_start(0x1459182e6,0,count=100)
        assert bool(uc.reg_read(r.UC_X86_REG_RAX)&1)==(0.<=along<=10. and abs(across)<=2.)
        membership_cases+=1
    facing_packet_cases=0
    for facing in [0.,1.25,-2.5]:
      for serial in [0,0xffffffff]:
        setup();put(rows,'3f',1.,2.,3.);put(record,'3f',1.,2.,3.)
        packet_frame=frame+0x1000;uc.reg_write(r.UC_X86_REG_RBP,packet_frame)
        put(packet_frame-0x30,'QQQQ',128,rows,12,0xdd);put(packet_frame+0x50,'f',facing)
        for reg,v in [(r.UC_X86_REG_RAX,rows),(r.UC_X86_REG_RDX,12),
                      (r.UC_X86_REG_RBX,serial),(r.UC_X86_REG_RSI,queue),(r.UC_X86_REG_RDI,record)]:uc.reg_write(reg,v)
        stop=0x1458c8186;uc.emu_start(0x1458c8012,0,count=300)
        expected=struct.pack('<3fIBfIII3f',1.,2.,3.,serial,4,facing,0x100,1,1,1.,2.,3.)
        assert bytes(uc.mem_read(rows,len(expected)))==expected
        assert get(queue+16,'Q')[0]==len(expected)
        facing_packet_cases+=1
    duration_cases=0
    for row in records:
        setup();put(record,'I',row['spell']);put(record+45,'B',7)
        put(stack+0x1008,'Q',stack+0x3000);uc.reg_write(r.UC_X86_REG_RSP,stack+0x1008)
        stop=stack+0x3000;uc.emu_start(0x145896950,0,count=100)
        assert bits(xf(r.UC_X86_REG_XMM0))==bits(f32(1.6))
        duration_cases+=1
    charge_packet_cases=0
    for milliseconds in [0,1,650,2000]:
      for serial in [0,0xffffffff]:
        setup();put(rows,'3f',1.,2.,3.);put(record,'3f',10.,20.,30.)
        packet_frame=frame+0x1000;uc.reg_write(r.UC_X86_REG_RBP,packet_frame)
        put(packet_frame-0x30,'QQQQ',128,rows,12,0xdd)
        put(packet_frame+0x50,'II',serial,milliseconds)
        # Win64 places these two 32-bit arguments in separate 8-byte slots.
        put(packet_frame+0x58,'I',milliseconds)
        for reg,v in [(r.UC_X86_REG_RDX,12),(r.UC_X86_REG_RSI,queue),
                      (r.UC_X86_REG_RDI,record)]:uc.reg_write(reg,v)
        stop=0x1458c3dcb;uc.emu_start(0x1458c3c92,0,count=300)
        expected=struct.pack('<3fIBIII3f',1.,2.,3.,serial,0,0x100,max(milliseconds,1),1,10.,20.,30.)
        assert bytes(uc.mem_read(rows,len(expected)))==expected
        assert get(queue+16,'Q')[0]==len(expected)
        charge_packet_cases+=1
    return dict(producer=producer_cases,delayed_movement=movement_cases,deadline=admission_cases,line_membership=membership_cases,facing_packet=facing_packet_cases,charge_packet=charge_packet_cases)

def bomb_contracts(raw,records):
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    md=Cs(CS_ARCH_X86,CS_MODE_64);uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def demand(machine,access,address,size,value,user):
        page=address&~4095
        if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    game,record,rows,frame,world,stack,actors,queue=[0x71000000+i*0x10000 for i in range(8)]
    for base in [game,record,rows,frame,world,stack,actors,queue]:uc.mem_map(base,0x4000)
    def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v):uc.reg_write(reg,bits(v))
    def xf(reg):return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    def literal(a,n):return raw(a,n) if a>=0x140000000 else bytes(uc.mem_read(a,n))
    seams={0x14591f6a0:'cast-start',0x1458a0b40:'primary',0x1458a4d60:'secondary',
        0x1458ce7d0:'spell-go',0x140cc1030:'enqueue-packet',0x14599cd20:'actor-label',
        0x14598ddd0:'localize',0x1458c22c0:'warning',0x145c0a42f:'hypot',0x14593ec90:'damage'}
    stop=set();calls=[];valid_height=True
    def hook(machine,a,size,user):
        if a in stop:machine.emu_stop();return
        ins=next(md.disasm(bytes(uc.mem_read(a,size)),a))
        if ins.mnemonic=='call':assert int(ins.op_str,16) in seams or int(ins.op_str,16)==0x14591f490,hex(a)
        if a not in seams:return
        name=seams[a];sp=uc.reg_read(r.UC_X86_REG_RSP)
        if name=='primary':uc.reg_write(r.UC_X86_REG_RAX,int(valid_height));sx(r.UC_X86_REG_XMM0,4.)
        elif name=='secondary':put(uc.reg_read(r.UC_X86_REG_RCX),'I',0)
        elif name=='cast-start':calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
        elif name=='spell-go':
            target=get(sp+0x30,'Q')[0]
            calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),get(sp+0x28,'Q')[0],get(uc.reg_read(r.UC_X86_REG_R9),'Q')[0],get(target,'I')[0],get(target+8,'Q')[0]))
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
        elif name=='actor-label':uc.reg_write(r.UC_X86_REG_RAX,record+0x100);uc.reg_write(r.UC_X86_REG_RDX,4)
        elif name=='localize':
            calls.append((name,literal(uc.reg_read(r.UC_X86_REG_RCX),uc.reg_read(r.UC_X86_REG_RDX)).decode()))
            uc.reg_write(r.UC_X86_REG_RAX,0)
        elif name=='warning':
            calls.append((name,literal(uc.reg_read(r.UC_X86_REG_R9),get(sp+0x28,'Q')[0]).decode()))
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
        elif name=='hypot':sx(r.UC_X86_REG_XMM0,math.hypot(xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)))
        elif name=='damage':calls.append((name,uc.reg_read(r.UC_X86_REG_RDX),xf(r.UC_X86_REG_XMM2),uc.reg_read(r.UC_X86_REG_R9D),get(sp+0x28,'B')[0],get(sp+0x30,'B')[0],get(sp+0x38,'B')[0]))
        ret=get(sp,'Q')[0];uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,ret)
    uc.hook_add(UC_HOOK_CODE,hook)
    def setup():
        for base in [game,record,rows,frame,world,stack,actors,queue]:uc.mem_write(base,bytes(0x4000))
        put(game+0x468,'Q',1);put(game+0x568,'QQ',actors,1);put(game+0x590,'QQQ',64,rows,0)
        put(game+0x9b0,'Q',world);put(game+0xa4c,'f',10.);put(game+0xa50,'I',99)
        put(world+0x68,'Q',0xffffffffffffffff);put(world+0xb8,'f',9.)
        put(frame+0xf0,'Q',0);put(frame+0x180,'Q',77);put(frame+0xd0,'f',13.);put(frame+0xe0,'f',17.)
        uc.mem_write(record+0x100,b'Boss')
        for reg,value in [(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RCX,record),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack+0x1000),(r.UC_X86_REG_RBX,0)]:uc.reg_write(reg,value)
        sx(r.UC_X86_REG_XMM14,100.);sx(r.UC_X86_REG_XMM15,10.)
        uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80);uc.reg_write(r.UC_X86_REG_EFLAGS,2);calls.clear()
    producer_cases=0;duration_cases=0
    for row in records:
      for windup in [0.,f32(1.6),5.]:
       for valid_height in [False,True]:
        setup();w=row['payload_words'][:];w[2]=bits(windup);put(record,'5I',*w);put(record+45,'B',30)
        stop={0x14591f828};uc.emu_start(0x14591fbfb,0,count=1500)
        assert get(game+0x5a0,'Q')[0]==1 and get(rows+0x30,'I')[0]==0
        assert get(rows+0x40,'3f')==(13.,17.,4. if valid_height else 9.)
        assert get(rows+0x50,'2f')==(10.,f32(10.+windup))
        assert get(rows+0x58,'I')[0]==bits(f32(max(f32(windup+f32(-1.6)),0.)+10.))
        assert get(rows+0x60,'I')[0]==bits(f32(100.*struct.unpack('<f',struct.pack('<I',w[3]))[0]))
        assert get(rows+0x74,'I')[0]==bits(f32(100.*struct.unpack('<f',struct.pack('<I',w[4]))[0]))
        assert calls[0]==('cast-start',w[0],windup)
        assert ('spell-go',w[0],1,1,0,1) in calls
        assert calls[-1]==('warning','You are the bomb! Carry it into the horde!')
        producer_cases+=1
        put(stack+0x1008,'Q',stack+0x3000);uc.reg_write(r.UC_X86_REG_RSP,stack+0x1008);uc.reg_write(r.UC_X86_REG_RCX,record)
        stop={stack+0x3000};uc.emu_start(0x145896950,0,count=100)
        assert bits(xf(r.UC_X86_REG_XMM0))==bits(windup);duration_cases+=1
    height_cases=0
    for valid_height in [False,True]:
        setup();put(game+0x4d0,'3f',13.,17.,3.);uc.reg_write(r.UC_X86_REG_R13,game)
        stop={0x1459170a8};uc.emu_start(0x145917065,0,count=40)
        assert get(frame+0x228,'f')[0]==(4. if valid_height else 3.);height_cases+=1
    follow_cases=0;move_gate_cases=0
    for deadline in [10.,f32(13.4),float('nan')]:
      for now in [10.,f32(13.399),f32(13.4),15.,float('nan')]:
        setup();put(rows+0x40,'3f',1.,2.,3.);put(rows+0x58,'f',deadline);put(frame+0x234,'f',now);put(frame+0x228,'f',30.)
        uc.reg_write(r.UC_X86_REG_R13,rows);uc.reg_write(r.UC_X86_REG_XMM9,bits(10.)|(bits(20.)<<32))
        stop={0x145917615};uc.emu_start(0x1459175f3,0,count=30)
        assert get(rows+0x40,'3f')==((10.,20.,30.) if deadline>now else (1.,2.,3.));follow_cases+=1
        put(rows+0x50,'f',10.);put(rows+0x70,'f',0.);put(rows+0x1c,'f',0.);uc.reg_write(r.UC_X86_REG_RAX,0)
        stop={0x145917c9c,0x145918022};uc.emu_start(0x145917fe4,0,count=30)
        assert (uc.reg_read(r.UC_X86_REG_RIP)==0x145917c9c)==(deadline>10.);move_gate_cases+=1
    burst_queue_cases=0
    for damage in [0.,100.,float('nan')]:
      for shape in [0,1,2]:
        setup();put(rows+0x40,'3f',10.,20.,30.);put(rows+0x74,'f',damage);put(rows+0x30,'I',shape)
        put(rows+0x34,'f',7.);put(rows+0x5c,'I',20475);put(frame+0x80,'QQQ',64,queue,0)
        uc.reg_write(r.UC_X86_REG_R13,rows);uc.reg_write(r.UC_X86_REG_RSI,rows+0x40)
        stop={0x145919055};uc.emu_start(0x145918f41,0,count=100)
        admitted=damage>0. and shape==0;assert get(frame+0x90,'Q')[0]==int(admitted)
        if admitted:assert get(queue,'5fI')==(10.,20.,30.,7.,damage,20475)
        burst_queue_cases+=1
    selection_cases=0
    for dead in [0,1]:
      for boss in [False,True]:
       for guardian in [False,True]:
        for distance in [0.,7.,7.001]:
            setup();put(actors+0xb0,'B',dead);put(actors+0x18,'Q',0 if boss else 0xffffffffffffffff)
            put(actors+0x58,'Q',0 if guardian else 0xffffffffffffffff);put(actors+0x180,'3f',distance,0.,999.)
            put(rows,'2f',0.,0.);put(record,'f',7.)
            for reg,value in [(r.UC_X86_REG_R12,actors+0x1d8),(r.UC_X86_REG_R15,actors+0x1d8),
                              (r.UC_X86_REG_RDI,queue),(r.UC_X86_REG_RBX,rows),(r.UC_X86_REG_R14,record)]:uc.reg_write(reg,value)
            sx(r.UC_X86_REG_XMM7,0.);stop={0x1459d469e,0x1459d4736}
            uc.emu_start(0x1459d46ab,0,count=100)
            assert (uc.reg_read(r.UC_X86_REG_RIP)==0x1459d4736)==(not dead and not boss and not guardian and distance<=7.)
            selection_cases+=1
    setup();put(queue,'Q',123);put(frame+0x270,'Q',queue);put(frame+0x248,'Q',game)
    for reg,value in [(r.UC_X86_REG_R13,8),(r.UC_X86_REG_R14,0),(r.UC_X86_REG_R15D,20475)]:uc.reg_write(reg,value)
    sx(r.UC_X86_REG_XMM6,1500.);stop={0x14591b1b5};uc.emu_start(0x14591b180,0,count=40)
    assert calls==[('damage',123,1500.,20475,2,0,0)]
    removal_cases=0
    for indices in [[1,0],[2,0,1],[0,0],[5,1,3,5,1],[9,0,7,2,4,1]]:
        setup();put(queue,'Q'*len(indices),*indices)
        put(frame+0x1b8,'QQ',queue,len(indices));put(frame+0x248,'Q',game)
        uc.reg_write(r.UC_X86_REG_RCX,queue);uc.reg_write(r.UC_X86_REG_RDX,len(indices))
        stop={0x14591a725};uc.emu_start(0x14591b4bf,0,count=1000)
        ordered=sorted(set(indices));assert get(frame+0x1c0,'Q')[0]==len(ordered)
        assert get(queue,'Q'*len(ordered))==tuple(ordered)
        uc.reg_write(r.UC_X86_REG_R14,queue+len(ordered)*8);uc.reg_write(r.UC_X86_REG_R12,game)
        stop={0x14591a795};uc.emu_start(0x14591a786,0,count=10)
        assert uc.reg_read(r.UC_X86_REG_RBX)==ordered[-1]
        removal_cases+=1
    return dict(producer=producer_cases,duration=duration_cases,follow_height=height_cases,follow=follow_cases,movement_gate=move_gate_cases,burst_queue=burst_queue_cases,enemy_selection=selection_cases,damage_dispatch=1,removal_order=removal_cases)

def wave_contracts(raw,records):
    import capstone,unicorn
    from unicorn import x86_const as r
    uc=unicorn.Uc(unicorn.UC_ARCH_X86,unicorn.UC_MODE_64)
    mapped=set()
    def map_page(a):
        a &= ~4095
        if a not in mapped:
            uc.mem_map(a,4096);mapped.add(a)
            try: uc.mem_write(a,raw(a,4096))
            except (ValueError,IndexError): pass
    game,record,rows,frame,world,stack=(0x70000000,0x70010000,0x70020000,0x70040000,0x70050000,0x70060000)
    for base in [game,record,rows,frame,world,stack]:
        for a in range(base,base+0x4000,4096): uc.mem_map(a,4096)
    def demand(machine,access,address,size,value,user):
        map_page(address);return True
    uc.hook_add(unicorn.UC_HOOK_MEM_UNMAPPED,demand)
    calls=[]
    def put(a,fmt,*v): uc.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt): return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def xf(reg): return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    def sx(reg,v): uc.reg_write(reg,bits(v))
    seams={0x14591f1d0:'hold',0x14591f6a0:'cast',0x14589f770:'height',0x1458a0b40:'primary',0x1458a4d60:'secondary'}
    for a in seams: map_page(a)
    current_height=4.
    height_mode=0
    def hook(machine,a,size,user):
        if a not in seams:
            instruction=next(capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64).disasm(bytes(machine.mem_read(a,size)),a))
            if instruction.mnemonic=='call':assert instruction.op_str.startswith('0x') and (int(instruction.op_str,16) in seams or instruction.op_str=='0x14591f490'),hex(a)
            return
        name=seams[a]
        if name=='hold': calls.append((name,xf(r.UC_X86_REG_XMM2)))
        elif name=='cast': calls.append((name,machine.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
        elif name=='primary':
            machine.reg_write(r.UC_X86_REG_RAX,int(height_mode==0));sx(r.UC_X86_REG_XMM0,current_height)
        elif name=='secondary':
            output=machine.reg_read(r.UC_X86_REG_RCX)
            put(output,'I',int(height_mode==1));put(output+12,'f',current_height)
        else: sx(r.UC_X86_REG_XMM0,current_height)
        sp=machine.reg_read(r.UC_X86_REG_RSP)
        return_address=get(sp,'Q')[0]
        machine.reg_write(r.UC_X86_REG_RSP,sp+8);machine.reg_write(r.UC_X86_REG_RIP,return_address)
    uc.hook_add(unicorn.UC_HOOK_CODE,hook)
    cases=0
    payloads=[tuple(x['payload_words']) for x in records]
    payloads += [(6524,n,bits(5.),bits(1.6),bits(step),bits(1.6)) for n in [0,1,2,7] for step in [.1,.7,1.1]]
    for words in payloads:
        spell,count,width_bits,windup_bits,step_bits,factor_bits=words
        width,windup,step,factor=[struct.unpack('<f',struct.pack('<I',x))[0] for x in words[2:]]
        for height_mode in range(3):
            current_height=[4.,7.,9.][height_mode]
            for now in [0.,10.,12345.125]:
                calls.clear();uc.mem_write(rows,bytes(0x4000))
                put(game+0x590,'QQQ',64,rows,0);put(game+0x9b0,'Q',world);put(game+0xa4c,'f',now);put(game+0xa50,'I',0xfffffffd)
                put(world+0x68,'Q',0 if height_mode!=2 else 0xffffffffffffffff);put(world+0xb8,'f',9.)
                put(record,'6I',*words);put(record+45,'B',27);put(frame+0xf0,'Q',2);put(frame+0x180,'Q',99);put(frame+0x150,'2f',13.,17.);put(frame+0x178,'f',0.)
                for reg,value in [(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RCX,record),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack+0x1000)]:uc.reg_write(reg,value)
                sx(r.UC_X86_REG_XMM10,17.);sx(r.UC_X86_REG_XMM14,100.);sx(r.UC_X86_REG_XMM15,now)
                uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
                uc.emu_start(0x145920cea,0x14591f828,count=10000)
                assert uc.reg_read(r.UC_X86_REG_RIP)==0x14591f828
                assert get(game+0x5a0,'Q')[0]==max(count,1)
                assert calls==[('hold',windup),('cast',spell,windup)]
                for i in range(max(count,1)):
                    row=rows+i*128
                    assert get(row+0x30,'I')[0]==int(i!=0)
                    expected_radii=[bits(width)] if i==0 else [bits(f32(i*width)),bits(f32((i+1)*width))]
                    assert list(get(row+0x34,'I' if i==0 else '2I'))==expected_radii
                    assert get(row+0x3c,'I')[0]==(0xfffffffe+i)&0xffffffff
                    assert get(row+0x40,'3f')==(13.,17.,current_height)
                    assert get(row+0x50,'I')[0]==bits(now)
                    assert get(row+0x54,'I')[0]==bits(f32(f32(f32(i*step)+windup)+now))
                    assert get(row+0x5c,'I')[0]==(spell if i==0 else 0)
                    assert get(row+0x60,'I')[0]==bits(f32(100.*factor))
                    actual_window=get(row+0x64,'f')[0]
                    assert actual_window==(math.inf if i==0 else min(f32(step+step),f32(1.4)))
                    assert get(row+0x7c,'3B')==(0,0,0)
                # Verify the native generic selector's action-block duration as well.
                put(stack+0x1000,'Q',stack+0x3000)
                uc.reg_write(r.UC_X86_REG_RSP,stack+0x1000)
                uc.reg_write(r.UC_X86_REG_RCX,record)
                uc.emu_start(0x145896950,stack+0x3000,count=2048)
                assert bits(xf(r.UC_X86_REG_XMM0))==bits(f32(f32(count*step)+windup))
                cases+=1
    membership_cases=0
    def membership_stop(machine,a,size,user):
        if a in (0x1459183d6,0x145918475): machine.emu_stop()
    stop_hook=uc.hook_add(unicorn.UC_HOOK_CODE,membership_stop)
    for inner,outer,distance in [(5.,10.,d) for d in [4.999,5.,7.5,10.,10.001,math.nan]]+[(math.nan,10.,5.),(5.,math.nan,5.)]:
        uc.reg_write(r.UC_X86_REG_R13,rows);put(rows+0x38,'f',outer)
        sx(r.UC_X86_REG_XMM8,inner);sx(r.UC_X86_REG_XMM0,distance)
        uc.emu_start(0x1459183ca,0x145918475,count=32)
        assert bool(uc.reg_read(r.UC_X86_REG_RAX)&1)==(distance>=inner and outer>=distance)
        membership_cases+=1
    uc.hook_del(stop_hook)
    tell_cases=0
    for end in [11.6,12.4,100.]:
        for lead in [math.inf,f32(1.4),f32(.2)]:
            for now in [10.,11.,12.5,101.]:
                uc.reg_write(r.UC_X86_REG_R12,rows);put(rows+0x50,'f',10.);put(rows+0x64,'f',lead)
                sx(r.UC_X86_REG_XMM0,end);sx(r.UC_X86_REG_XMM6,now)
                uc.emu_start(0x14591a429,0x14591a46a,count=64)
                assert bits(xf(r.UC_X86_REG_XMM2))==bits(min(now,max(10.,f32(f32(end)-lead))))
                tell_cases+=1
    return dict(producer=cases,duration=cases,annulus=membership_cases,tell_start=tell_cases)

def action_contracts(raw, records):
    # Existing optional analysis dependencies; never install anything here.
    sys.path[:0]=[str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_MEM_UNMAPPED,UC_HOOK_CODE
    from unicorn import x86_const as r
    md=Cs(CS_ARCH_X86,CS_MODE_64)
    uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set()
    def demand(machine,access,address,size,value,user):
        page=address&~4095
        if page not in mapped:
            uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    game,record,frame,stack,rows=(0x70000000,0x70010000,0x70020000,0x70030000,0x70040000)
    for a in [game,record,frame,stack,rows]:uc.mem_map(a,0x10000)
    def put(a,f,*v):uc.mem_write(a,struct.pack('<'+f,*v))
    def get(a,f):return struct.unpack('<'+f,uc.mem_read(a,struct.calcsize('<'+f)))
    def sx(reg,v):uc.reg_write(reg,bits(v))
    def xf(reg):return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    def ret():
        sp=uc.reg_read(r.UC_X86_REG_RSP);end=get(sp,'Q')[0]
        uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,end)
    calls=[];stops=set();allowed=[]
    seams={0x14591f1d0:'hold',0x14591f6a0:'cast',0x14591f490:'create',
           0x1459160e0:'visual',0x145c0a417:'cos',0x145c0a411:'sin',0x145c0a447:'atan2',
           0x145c0a44d:'fmod',0x145c0a42f:'hypot',0x140002200:'allocator-init',
           0x1400021c0:'allocate',0x1458d0340:'packed-guid'}
    def hook(machine,a,size,user):
        if a in stops:uc.emu_stop();return
        name=seams.get(a)
        if name:
            sp=uc.reg_read(r.UC_X86_REG_RSP)
            if name=='hold':calls.append((name,xf(r.UC_X86_REG_XMM2),uc.reg_read(r.UC_X86_REG_R9D),get(sp+0x28,'f')[0]))
            elif name=='cast':calls.append((name,uc.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
            elif name=='create':
                shape=get(uc.reg_read(r.UC_X86_REG_R8),'III')
                calls.append((name,shape,xf(r.UC_X86_REG_XMM3),get(sp+0x28,'f')[0],
                    get(sp+0x30,'f')[0],get(sp+0x38,'f')[0],get(sp+0x40,'I')[0],get(sp+0x48,'f')[0]))
                put(game+0x5a0,'Q',1);uc.reg_write(r.UC_X86_REG_RAX,0)
            elif name=='visual':calls.append((name,xf(r.UC_X86_REG_XMM1),uc.reg_read(r.UC_X86_REG_R9D),get(get(sp+0x28,'Q')[0],'fff')))
            elif name=='atan2':sx(r.UC_X86_REG_XMM0,math.atan2(xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)))
            elif name=='fmod':sx(r.UC_X86_REG_XMM0,math.fmod(xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)))
            elif name=='hypot':sx(r.UC_X86_REG_XMM0,math.hypot(xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)))
            elif name=='allocator-init':pass
            elif name=='allocate':uc.reg_write(r.UC_X86_REG_RAX,rows+0x1000)
            elif name=='packed-guid':
                guid=uc.reg_read(r.UC_X86_REG_RCX);output=uc.reg_read(r.UC_X86_REG_RDX)
                packed=guid.to_bytes(8,'little');wire=bytes([sum((v!=0)<<i for i,v in enumerate(packed))])+bytes(v for v in packed if v)
                capacity,buffer,count=get(output,'QQQ');assert count==0 and capacity>=len(wire)
                uc.mem_write(buffer,wire);put(output+16,'Q',len(wire))
            else:sx(r.UC_X86_REG_XMM0,{'cos':math.cos,'sin':math.sin}[name](xf(r.UC_X86_REG_XMM0)))
            ret();return
        assert any(a0<=a<a1 for a0,a1 in allowed),hex(a)
        ins=next(md.disasm(bytes(uc.mem_read(a,size)),a))
        if ins.mnemonic=='call':assert int(ins.op_str,16) in seams,hex(a)
    uc.hook_add(UC_HOOK_CODE,hook)
    def execute(a,b,end):
        nonlocal allowed,stops
        allowed=[(a,b)];stops={end}
        uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        uc.emu_start(a,0,count=10000);assert uc.reg_read(r.UC_X86_REG_RIP)==end
    cases=0
    for row in records:
      for angle in [0.,.75,-2.5]:
        tag=row['native_tag'];w=row['payload_words'];values=[struct.unpack('<f',struct.pack('<I',v))[0] for v in w[1:]]
        uc.mem_write(frame,bytes(0x1000));uc.mem_write(rows,bytes(0x100));put(record,'14I',*(w+[0]*(14-len(w))))
        put(game+0x598,'Q',rows);put(frame+0xf0,'Q',3);put(frame+0x180,'Q',77)
        put(frame+0x150,'ffff',2.,4.,0.,0.);put(frame+0x178,'f',angle)
        uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000)
        uc.reg_write(r.UC_X86_REG_RSI,game);uc.reg_write(r.UC_X86_REG_RCX,record)
        sx(r.UC_X86_REG_XMM14,10.);sx(r.UC_X86_REG_XMM11,8.);sx(r.UC_X86_REG_XMM10,4.)
        calls.clear();a,b=RANGES['cone-producer' if tag==8 else 'knockback-producer'];execute(a,b,0x14591f828)
        if tag==8:
            length,degrees,delay,factor=values;assert calls[0][:3]==('hold',f32(delay+f32(.3)),1)
            assert calls[1]==('cast',w[0],delay)
            shape=calls[2];assert shape[0]=='create' and shape[1]==(3,w[1],bits(f32(degrees*f32(math.pi/180))))
            assert shape[2:]==(2.,4.,angle,delay,0,f32(10.*factor))
            assert calls[3]==('visual',delay,w[0],(f32(f32(length*f32(math.cos(angle)))*.5+2.),f32(f32(length*f32(math.sin(angle)))*.5+4.),8.))
        else:
            radius,factor,speed=values;assert calls[0][:3]==('hold',f32(1.3),0)
            assert calls[1]==('cast',w[0],f32(1.3))
            assert calls[2][0]=='create' and calls[2][1][:2]==(0,w[1])
            assert calls[2][2:]==(2.,4.,0.,f32(1.3),w[0],f32(10.*factor))
            assert get(rows+0x7c,'B')[0]==1 and get(rows+0x6c,'I')[0]==w[3]
        cases+=1
      # The common gate dispatches native duration from the current record,
      # independently of each effect's later movement-hold duration.
      put(record,'14I',*(row['payload_words']+[0]*(14-len(row['payload_words']))))
      put(record+45,'B',row['native_tag']);stop=stack+0xf000;put(stack+0x8000,'Q',stop)
      uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000);uc.reg_write(r.UC_X86_REG_RCX,record)
      execute(0x145896950,0x145896b44,stop)
      assert xf(r.UC_X86_REG_XMM0)==(struct.unpack('<f',struct.pack('<I',row['payload_words'][3]))[0] if row['native_tag']==8 else f32(1.3))
      cases+=1
    # Raw constant contract used by producer, membership and knockback fallback.
    # Actual post-hit native knockback selection: the last qualifying hit wins;
    # positions within the native strict half-yard epsilon retain the stored row angle.
    for dx,dy in [(0.,0.),(.5,0.),(0.,1.),(1.,0.),(-3.,2.)]:
      for fallback in [0.,.75,-2.5]:
        for speed in [0.,12.]:
            put(rows+0x40,'fff',0.,0.,99.);put(rows+0x4c,'f',fallback);put(rows+0x6c,'f',speed)
            put(frame+0xcc,'f',42.);put(frame+0x11c,'f',.125);put(frame-8,'Q',0)
            uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_RSP,stack+0x8000)
            uc.reg_write(r.UC_X86_REG_R13,rows);sx(r.UC_X86_REG_XMM9,dx);sx(r.UC_X86_REG_XMM10,dy)
            sx(r.UC_X86_REG_XMM7,.5);sx(r.UC_X86_REG_XMM1,42.)
            # Nonpositive speed returns through the ordinary no-knockback lane.
            if speed<=0:continue
            execute(0x145918435,0x145918f36,0x145918f36)
            angle=math.atan2(dy,dx) if not f32(math.hypot(dx,dy))<.5 else fallback
            assert get(frame+0xcc,'f')[0]==speed and get(frame+0x11c,'I')[0]==bits(angle)
            assert get(frame-8,'B')[0]==1
            cases+=1
    # Execute the original packet serializer. Allocation, packed-GUID encoding
    # and CRT trigonometry are explicit seams; all scalar writes/order are native.
    for guid in [1,0xff00,0x1234005600000078]:
      for angle in [0.,.75,-2.5]:
        for horizontal in [0.,12.]:
            output=rows+0x2000;sp=stack+0x8000;stop=stack+0xf000
            put(sp,'Q',stop);put(sp+0x28,'f',horizontal);put(sp+0x30,'f',7.)
            uc.reg_write(r.UC_X86_REG_RSP,sp);uc.reg_write(r.UC_X86_REG_RCX,output)
            uc.reg_write(r.UC_X86_REG_RDX,guid);uc.reg_write(r.UC_X86_REG_R8D,0xfffffff0)
            sx(r.UC_X86_REG_XMM3,angle)
            execute(*RANGES['knockback-packet'],stop)
            capacity,buffer,count,opcode=get(output,'QQQH')
            packed=guid.to_bytes(8,'little');wire=bytes([sum((v!=0)<<i for i,v in enumerate(packed))])+bytes(v for v in packed if v)
            wire+=struct.pack('<Iffff',0xfffffff0,f32(math.cos(angle)),f32(math.sin(angle)),horizontal,-7.)
            actual=bytes(uc.mem_read(buffer,count))
            assert opcode==0xef and actual==wire,(guid,angle,horizontal,opcode,actual.hex(),wire.hex())
            cases+=1
    return cases

def volley_contracts(raw):
    import capstone
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    md=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def demand(machine, access, address, size, value, unused):
        page = address & ~4095
        assert 0x140000000 <= page < 0x149000000
        if page not in mapped:
            uc.mem_map(page, 4096)
            uc.mem_write(page, raw(page, 4096))
            mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED, demand)
    mem = 0x70000000
    uc.mem_map(mem, 0x100000)
    game, stack, record, rows = mem+0x1000, mem+0x10000, mem+0x20000, mem+0x30000
    allowed, stops = (), ()

    def hook(machine, address, size, unused):
        if address in stops:
            machine.emu_stop()
        else:
            assert any(a <= address < b for a, b in allowed), hex(address)
            instruction = next(md.disasm(bytes(machine.mem_read(address, size)), address))
            assert instruction.mnemonic != 'call', 'Host calls are outside these checks'
    uc.hook_add(UC_HOOK_CODE, hook)

    def run(start, end, intervals=None):
        nonlocal allowed, stops
        stops = (end,) if isinstance(end, int) else end
        allowed = intervals or ((start, max(stops)),)
        uc.reg_write(r.UC_X86_REG_EFLAGS, 2)
        uc.reg_write(r.UC_X86_REG_MXCSR, 0x1f80)
        uc.emu_start(start, max(stops)+1, count=1000)
        assert uc.reg_read(r.UC_X86_REG_RIP) in stops
        return uc.reg_read(r.UC_X86_REG_RIP)

    def put(a, fmt, *v): uc.mem_write(a, struct.pack('<'+fmt, *v))
    def get(a, fmt): return struct.unpack('<'+fmt, uc.mem_read(a, struct.calcsize('<'+fmt)))
    def xmm(reg, value): uc.reg_write(reg, int.from_bytes(struct.pack('<f', value), 'little'))
    def f32(value): return struct.unpack('<f', struct.pack('<f', value))[0]

    previous = json.loads((ROOT/'docs/analysis/evidence/0.108.0/boss-volleys/native.json').read_text())
    cases = dict(speed=0, flight=0, payload=0, publication=0, membership=0, aggregation=0, damage_scale=0)
    for case in previous['cases']['speed']:
        put(record, 'II', case['spell_id'], 1)
        uc.reg_write(r.UC_X86_REG_RCX, record)
        uc.reg_write(r.UC_X86_REG_RBP, stack)
        run(0x14591fb98, 0x145924326, tuple(RANGES[k] for k in
            ('speed-prefix','speed-low','speed-high','speed-special')))
        assert get(stack+0xe0, 'I')[0] == case['speed_bits']
        cases['speed'] += 1
    for case in previous['cases']['flight']:
        speed = next(c['speed_bits'] for c in previous['cases']['speed'] if c['spell_id'] == case['spell_id'])
        put(stack+0xe0, 'I', speed)
        for a,b,result in ((0x14592447e,0x1459244b9,r.UC_X86_REG_XMM6),
                           (0x1459248cf,0x14592490a,r.UC_X86_REG_XMM7)):
            put(stack+0xf0, 'I', case['source_bits'][1])
            put(stack+0x150, 'I', case['source_bits'][0])
            uc.reg_write(r.UC_X86_REG_XMM10, case['center_bits'][0])
            uc.reg_write(r.UC_X86_REG_XMM11, case['center_bits'][1])
            run(a,b)
            assert uc.reg_read(result) & 0xffffffff == case['delay_bits']
            cases['flight'] += 1
    for lane in ('first','later'):
      for counter in (0,0xffffffff):
       for now in (0.,120.):
        for delay in (0.6,1.2,5.):
         for index in (0,2):
            uc.mem_write(rows, bytes([0xaa])*512)
            put(game+0x598,'QQ',rows,index)
            put(game+0xa4c,'fI',now,counter)
            put(stack+0x180,'Q',99)
            put(stack+0x178,'f',45.)
            for reg,value in ((r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RBP,stack),
                              (r.UC_X86_REG_R15,index),(r.UC_X86_REG_R14,index)):
                uc.reg_write(reg,value)
            xmm(r.UC_X86_REG_XMM10,24.)
            uc.reg_write(r.UC_X86_REG_XMM10, int.from_bytes(struct.pack('<2f',24.,-7.),'little'))
            if lane == 'first':
                run(0x1459244b9,0x1459244cf)
                xmm(r.UC_X86_REG_XMM6,delay);xmm(r.UC_X86_REG_XMM11,4.);xmm(r.UC_X86_REG_XMM14,45.)
                run(0x145924507,0x1459245ae)
            else:
                run(0x14592490a,0x145924921)
                xmm(r.UC_X86_REG_XMM7,delay);xmm(r.UC_X86_REG_XMM12,4.)
                run(0x1459245ed,0x145924697)
            a=rows+index*128
            assert get(game+0xa50,'I')[0] == (counter+1)&0xffffffff
            assert get(game+0x5a0,'Q')[0] == index+1
            assert get(a,'Q')[0] == 0 and get(a+0x10,'I')[0] == 0
            assert get(a+0x20,'QQ') == (99,0)
            assert get(a+0x30,'If') == (0,2.5)
            assert get(a+0x3c,'I')[0] == (counter+1)&0xffffffff
            assert get(a+0x40,'4f') == (24.,-7.,4.,0.)
            assert get(a+0x50,'2f') == (now,f32(now+f32(delay)))
            assert get(a+0x58,'If') == (0,0.)
            assert get(a+0x60,'2f') == (45.,float('inf'))
            assert get(a+0x7c,'3B') == (0,0,0)
            cases['payload'] += 1
    row=rows
    uc.reg_write(r.UC_X86_REG_R13,row)
    for now in (-1.,0.,1.3,float('nan')):
     for end in (0.,1.3,120.):
      for lead in (0.,1.6,float('inf')):
        put(row+0x54,'f',end);put(row+0x64,'f',lead)
        put(stack+0x234,'f',now)
        destination=run(0x145917f13,(0x145917f30,0x145918022),((0x145917f13,0x145917f30),))
        assert (destination==0x145917f30) == (not math.isnan(now) and now>=f32(f32(end)-f32(lead)))
        cases['publication'] += 1
    for radius in (0.,2.5,float('nan')):
     for distance in (0.,2.499,2.5,2.501,float('nan')):
        xmm(r.UC_X86_REG_XMM8,radius);xmm(r.UC_X86_REG_XMM0,distance)
        run(0x1459182cb,0x1459182d2)
        assert bool(uc.reg_read(r.UC_X86_REG_RAX)&255) == (f32(radius)>=f32(distance))
        cases['membership'] += 1
    for initial in (0.,45.,1e8):
     for source in (0,99,0xffffffffffffffff):
        put(stack+0x238,'f',initial);put(row+0x60,'f',45.);put(row+0x20,'Q',source)
        run(0x1459183fa,0x14591841b)
        assert get(stack+0x238,'f')[0] == f32(initial+45.)
        assert get(stack+0x1a8,'Q')[0] == source
        cases['aggregation'] += 1
    for enabled in (False, True):
     for total in (-1.,0.,1.,45.,90.,float('nan')):
        put(stack+0x238,'f',total);put(stack+0xc8,'f',1.)
        put(stack+0x248,'Q',game);put(game+0xad0,'B',int(enabled))
        destination=run(0x14591adc8,(0x14591ae0c,0x14591ae9d),
                        ((0x14591adc8,0x14591ae0c),))
        assert (destination==0x14591ae0c)==(total>0.)
        if total>0.:
            actual=struct.unpack('<f',(uc.reg_read(r.UC_X86_REG_XMM1)&0xffffffff).to_bytes(4,'little'))[0]
            assert actual==f32(total*(1. if enabled else 2.))
        cases['damage_scale'] += 1

    return cases

def pool_contracts(raw,rows):
    sys.path[:0] = [str(ROOT/'runtime/camera-recovery-0.105.0/python-libs'),str(ROOT/'runtime/armory-recovery/python-libs')]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r
    md = Cs(CS_ARCH_X86,CS_MODE_64)
    uc = Uc(UC_ARCH_X86,UC_MODE_64)
    mem=0x70000000; uc.mem_map(mem,0x100000); mapped=set()
    def demand(machine, access, a, size, value, user):
        page=a&~4095
        if page not in mapped:
            uc.mem_map(page,4096); uc.mem_write(page,raw(page,4096)); mapped.add(page)
        return True
    uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand)
    def put(a,fmt,*v): uc.mem_write(a,struct.pack('<'+fmt,*v))
    def get(a,fmt): return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
    def sx(reg,v): uc.reg_write(reg,bits(v))
    def xf(reg): return struct.unpack('<f',uc.reg_read(reg).to_bytes(16,'little')[:4])[0]
    game,record,frame,stack,row=mem,mem+0x10000,mem+0x20000,mem+0x40008,mem+0x60000
    stops=set(); casts=[]
    def hook(machine,a,size,user):
        if a in stops: uc.emu_stop(); return
        instruction=next(md.disasm(bytes(uc.mem_read(a,size)),a))
        if instruction.mnemonic=='call':assert instruction.op_str=='0x14591f6a0',hex(a)
        if a == 0x14591f6a0:
            casts.append((uc.reg_read(r.UC_X86_REG_R8D),xf(r.UC_X86_REG_XMM3)))
            sp=uc.reg_read(r.UC_X86_REG_RSP); ret=get(sp,'Q')[0]
            uc.reg_write(r.UC_X86_REG_RSP,sp+8); uc.reg_write(r.UC_X86_REG_RIP,ret)
    uc.hook_add(UC_HOOK_CODE,hook)
    def run(a,endpoints):
        nonlocal stops
        stops=set(endpoints);uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
        uc.emu_start(a,0,count=10000);assert uc.reg_read(r.UC_X86_REG_RIP) in stops
    cases=0
    for item in rows:
      spell,inner_bits,windup_bits,lifetime_bits,factor_bits=item['words']
      inner,windup,lifetime,factor=[struct.unpack('<f',struct.pack('<I',w))[0] for w in item['words'][1:]]
      for now in [0.,10.,12345.125]:
       for damage in [0.,17.,1000.25]:
        casts.clear();put(record,'5I',*item['words'])
        for reg,value in [(r.UC_X86_REG_RCX,record),(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack)]:uc.reg_write(reg,value)
        put(frame+0x180,'Q',99);sx(r.UC_X86_REG_XMM14,damage);sx(r.UC_X86_REG_XMM15,now)
        run(0x145920bd6,[0x145920c9b])
        assert casts==[(spell,windup)]
        assert get(frame+0x160,'I2f')==(1,inner,f32(inner+40.))
        assert get(frame+0x110,'If2f')==(3,f32(f32(now+windup)+lifetime),.5,0.)
        assert bits(xf(r.UC_X86_REG_XMM14))==bits(f32(damage*factor))
        assert get(stack+0x30,'f')[0]==windup and get(stack+0x38,'I')[0]==spell
        cases+=1
    # Activation initializes the periodic deadline at the actual activation tick.
    for now in [0.,10.,12345.125]:
        put(row+0x70,'f',0.);put(row+0x7c,'3B',0,0,1);put(frame+0x234,'f',now)
        uc.reg_write(r.UC_X86_REG_R13,row);uc.reg_write(r.UC_X86_REG_RBP,frame)
        run(0x1459185de,[0x145918604])
        assert get(row+0x7d,'B')[0]==1 and get(row+0x68,'f')[0]==now
        cases+=1
    periodic_cases=0
    # No catch-up loop: one deadline advance per owner update, even outside shape.
    for expires in [11.,20.]:
     for next_tick in [10.,10.5,15.]:
      for now in [9.999,10.,10.5,11.,15.,20.]:
        now=f32(now);put(row+0x14,'f',expires);put(row+0x18,'f',.5);put(row+0x68,'f',next_tick)
        put(frame+0x234,'f',now);uc.reg_write(r.UC_X86_REG_R13,row);uc.reg_write(r.UC_X86_REG_RBP,frame)
        run(0x1459192e8,[0x1459194a9,0x1459172b5,0x145919316])
        expected=0x1459194a9 if now>=expires else (0x1459172b5 if now<next_tick else 0x145919316)
        assert uc.reg_read(r.UC_X86_REG_RIP)==expected
        assert get(row+0x68,'f')[0]==(f32(next_tick+.5) if expected==0x145919316 else next_tick)
        periodic_cases+=1
    marker_cases=0
    for active in [0,1]:
        put(row+0x7d,'B',active);uc.reg_write(r.UC_X86_REG_R12,row)
        run(0x14591a550,[0x14591a048])
        pointer=uc.reg_read(r.UC_X86_REG_RCX);size=uc.reg_read(r.UC_X86_REG_RAX)
        assert raw(pointer,size).decode()==('pool' if active else 'danger')
        marker_cases+=1
    # Generic native action-block duration is the third payload word (windup).
    for item in rows:
        put(record,'5I',*item['words']);put(record+45,'B',28);put(stack,'Q',mem+0xff000)
        uc.reg_write(r.UC_X86_REG_RCX,record);uc.reg_write(r.UC_X86_REG_RSP,stack)
        run(0x145896950,[mem+0xff000])
        assert bits(xf(r.UC_X86_REG_XMM0))==item['words'][2]
        cases+=1
    return dict(producer_activation_duration=cases,periodic=periodic_cases,marker=marker_cases)

def frame_contracts(raw):
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
 from unicorn import x86_const as r
 md=Cs(CS_ARCH_X86,CS_MODE_64)
 uc=Uc(UC_ARCH_X86,UC_MODE_64);mapped=set();allowed=(0,0);stops=set();stubs=set()
 def demand(machine,access,address,size,value,user):
  page=address&~4095
  if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
  return True
 def guard(machine,address,size,user):
  if address in stops:uc.emu_stop();return
  if address in stubs:
   if address==0x145c0a3db:
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
 allowed=RANGES['actor-iterator'];stops={0x145945d1a,0x145948d52}
 for count in [0,1,2,3,8,17]:
  put(frame+0x220,'Q',actors);put(frame+0x50,'Q',actors+count*0x1d8);put(frame+0x1a8,'Q',0)
  seen=[]
  for attempt in range(30):
   uc.reg_write(r.UC_X86_REG_RBP,frame);uc.emu_start(allowed[0],0,count=100)
   if uc.reg_read(r.UC_X86_REG_RIP)==0x145948d52:break
   seen.append((uc.reg_read(r.UC_X86_REG_R8),get(frame+0x1d8,'Q')[0]))
  assert seen==[(actors+i*0x1d8,i)for i in range(count)]
  cases+=1
 allowed=(0x145948f2e,0x145948f43);stops={allowed[1]}
 for initial in [0,1,0xfffffffe,0xffffffff]:
  put(frame+0x320,'Q',game);put(game+0xa7c,'I',initial)
  for index in range(7):
   uc.reg_write(r.UC_X86_REG_RBP,frame);uc.emu_start(allowed[0],0,count=100)
   assert get(game+0xa7c,'I')[0]==(initial+index+1)&0xffffffff
   cases+=1
 # Execute the full native stable-removal helper. Its destructor, memcpy
 # and deallocation seams are explicit; no queue/index repair is supplied.
 allowed=(0x1459c4900,0x1459c4a35);stops={0x72040000}
 stubs={0x1458e2120,0x145c0a3db,0x1400021d0}
 for count in [1,2,5,9]:
  original=[100+i for i in range(count)]
  for removed in [100,100+count//2,99+count,999]:
   uc.mem_write(actors,b'\0'*(count*0x1d8));put(game+0x560,'QQQ',count,actors,count)
   for index,guid in enumerate(original):
    put(actors+index*0x1d8+0xf0,'Q',guid)
    put(actors+index*0x1d8+0x18,'Q',0xffffffffffffffff)
    put(actors+index*0x1d8+0x58,'Q',0xffffffffffffffff)
   put(frame+0x400,'Q',removed);put(0x72038000,'Q',0x72040000)
   uc.reg_write(r.UC_X86_REG_RSP,0x72038000);uc.reg_write(r.UC_X86_REG_RCX,game+0x560);uc.reg_write(r.UC_X86_REG_RDX,frame+0x400)
   uc.emu_start(allowed[0],0,count=10000)
   expected=[guid for guid in original if guid!=removed]
   assert get(game+0x570,'Q')[0]==len(expected)
   assert [get(actors+i*0x1d8+0xf0,'Q')[0]for i in range(len(expected))]==expected
   cases+=1
 stubs=set()
 # Native dispatcher bounds/dead check consumes the CURRENT index after
 # compaction, and after actors appended by earlier requests in this queue.
 allowed=(0x14591f804,0x14591f828);stops={0x14591f828,0x14591f88a}
 for count in [0,1,3,7]:
  put(game+0x568,'QQ',actors,count)
  for index in range(count+2):
   for dead in [0,1]:
    put(actors+index*0x1d8+0xb0,'B',dead)
    uc.reg_write(r.UC_X86_REG_RCX,game);uc.reg_write(r.UC_X86_REG_RDX,index)
    uc.emu_start(allowed[0],0,count=100)
    assert (uc.reg_read(r.UC_X86_REG_RIP)==0x14591f88a)==(index<count and not dead)
    if index<count:assert uc.reg_read(r.UC_X86_REG_RBX)==index*0x1d8
    cases+=1
 # Original CVTTSS2SI64 plus lower/upper ordered clamps. The upper
 # constant is the largest f32 below2^32, so the actual result equals Rust's
 # saturating float-to-u32, including the otherwise dangerous equality edge.
 allowed=(0x145949296,0x1459492ba);stops={allowed[1]}
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
 allowed=RANGES['duration-block-type-gates'];stops={allowed[1],0x14591fa60}
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
 allowed=(0x1459153b0,0x1459153e9);stops={allowed[1],0x145915a8a}
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
 return cases


def movement_contracts(raw,graph):
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
 from unicorn import x86_const as r
 uc=Uc(UC_ARCH_X86,UC_MODE_64);mem=0x75000000;uc.mem_map(mem,0x100000);mapped=set();md=Cs(CS_ARCH_X86,CS_MODE_64)
 game,actor,record,frame,packets,delayed,geometry=[mem+i*0x10000 for i in range(7)]
 stack=mem+0xe0008;stops=set();mode='';calls=[];norm_calls=[];fraction=None;height=True;zone_index=0
 executed_helpers={0x145916020,0x1459a9240,0x14591f110}
 seams={0x145c0a447,0x145c0a417,0x145c0a411,0x145c0a42f,0x145c0a44d,0x1459a8990,
  0x145898dc0,0x1458a0b40,0x1458ce7d0,0x140cc1030,0x14591f1d0,0x14591f6a0,0x1458ceea0}
 def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
 def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
 def sx(reg,v):uc.reg_write(reg,bits(v))
 def xf(reg):return struct.unpack('<f',struct.pack('<I',uc.reg_read(reg)&0xffffffff))[0]
 def ret():
  sp=uc.reg_read(r.UC_X86_REG_RSP);dest=get(sp,'Q')[0];uc.reg_write(r.UC_X86_REG_RSP,sp+8);uc.reg_write(r.UC_X86_REG_RIP,dest)
 def demand(machine,access,address,size,value,user):
  page=address&~4095
  if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
  return True
 def hook(machine,address,size,user):
  if address in stops:uc.emu_stop();return
  if address in seams:
   if address in {0x145c0a447,0x145c0a417,0x145c0a411,0x145c0a42f,0x145c0a44d}:
    a,b=xf(r.UC_X86_REG_XMM0),xf(r.UC_X86_REG_XMM1)
    v=math.atan2(a,b)if address==0x145c0a447 else math.cos(a)if address==0x145c0a417 else math.sin(a)if address==0x145c0a411 else math.fmod(a,b)if address==0x145c0a44d else math.hypot(a,b)
    sx(r.UC_X86_REG_XMM0,v)
    if address==0x145c0a42f:norm_calls.append([bits(a),bits(b)])
   elif address==0x1459a8990:
    assert fraction is not None;sx(r.UC_X86_REG_XMM0,fraction)
   elif address==0x145898dc0:uc.reg_write(r.UC_X86_REG_RAX,zone_index)
   elif address==0x1458a0b40:uc.reg_write(r.UC_X86_REG_RAX,int(height));sx(r.UC_X86_REG_XMM0,9.)
   elif address==0x14591f1d0:calls.append(['hold',bits(xf(r.UC_X86_REG_XMM2)),uc.reg_read(r.UC_X86_REG_R9),get(uc.reg_read(r.UC_X86_REG_RSP)+0x28,'I')[0]])
   elif address==0x14591f6a0:calls.append(['cast',uc.reg_read(r.UC_X86_REG_R8),bits(xf(r.UC_X86_REG_XMM3))])
   elif address==0x1458ce7d0:
    sp=uc.reg_read(r.UC_X86_REG_RSP);target=get(sp+0x30,'Q')[0];kind=get(target,'I')[0]
    calls.append(['spell',uc.reg_read(r.UC_X86_REG_RDX),uc.reg_read(r.UC_X86_REG_R8),kind,get(target+4,'3I')])
    uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
   elif address==0x1458ceea0:
    calls.append(['player-mover',uc.reg_read(r.UC_X86_REG_RDX),uc.reg_read(r.UC_X86_REG_R8),get(uc.reg_read(r.UC_X86_REG_R9),'3I'),get(uc.reg_read(r.UC_X86_REG_RSP)+0x28,'I')[0]])
    uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX),bytes(32))
   elif address==0x140cc1030: calls.append(['publish'])
   ret();return
  ranges=[(0x1459217be,0x145921951),(0x145922437,0x1459224bb),(0x145923f8c,0x14592416e),
   (0x145916020,0x1459160d3),(0x1459a9240,0x1459a9320),(0x14591f110,0x14591f1cf),
   (0x145916843,0x1459168f3),(0x145916ca2,0x145917031),
   (0x145918287,0x1459183d6),(0x1459d4670,0x1459d469e),
   (0x145918435,0x145918469),(0x145918f0e,0x145918f36)]
  assert any(a<=address<b for a,b in ranges),(mode,hex(address))
  ins=next(md.disasm(bytes(uc.mem_read(address,size)),address))
  if ins.mnemonic=='call':assert ins.op_str.startswith('0x')and int(ins.op_str,16)in seams|executed_helpers,(mode,hex(address))
 uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand);uc.hook_add(UC_HOOK_CODE,hook)
 def run(start,ends,lane):
  nonlocal mode,stops
  mode=lane;stops=set(ends);calls.clear();norm_calls.clear();uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
  uc.emu_start(start,0,count=30000);assert uc.reg_read(r.UC_X86_REG_RIP)in stops,(lane,hex(uc.reg_read(r.UC_X86_REG_RIP)))
 def setup():
  uc.mem_write(mem,bytes(0xd0000));put(game+0x568,'QQ',actor,1);put(game+0x5a8,'QQQ',64,delayed,0);put(game+0x620,'QQQ',64,packets,0)
  put(game+0x9b0,'Q',geometry);put(game+0xa4c,'f',10.);put(game+0x468,'Q',1);put(geometry+0x40,'q',-1 if fraction is None else 0)
  put(frame+0xf0,'Q',0);put(frame+0x180,'Q',777);put(frame+0x248,'Q',game)
  put(actor+0xf0,'Q',777);put(actor+0x16c,'f',3.);put(game+0x550,'I',0xffffffff)
  for reg,value in [(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RCX,record),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack),(r.UC_X86_REG_RBX,0)]:uc.reg_write(reg,value)
  sx(r.UC_X86_REG_XMM15,10.);sx(r.UC_X86_REG_XMM14,0.)
 def clip(point,source,ray):
  if ray is None or ray>=1.:return point
  dx=f32(point[0]-source[0]);dy=f32(point[1]-source[1]);length=f32(math.sqrt(f32(f32(dy*dy)+f32(dx*dx))))
  length=length if length>.5 else .5;t=f32(f32(ray)-f32(.5/length));t=t if t>0. else 0.
  return tuple(f32(f32(f32(p-q)*t)+q)for p,q in zip(point,source))
 def clamp(point,zi):
  center=struct.unpack('<2f',raw(0x146bf2630+240*zi+200,8));radius=struct.unpack('<f',raw(0x146bf2630+240*zi+216,4))[0]
  dx,dy=f32(point[0]-center[0]),f32(point[1]-center[1]);distance=f32(math.hypot(dx,dy));maximum=f32(radius-4.)
  if distance>=f32(.01)and maximum<distance:point=(f32(center[0]+f32(f32(dx/distance)*maximum)),f32(center[1]+f32(f32(dy/distance)*maximum)),point[2])
  return point
 counts=dict(pull_producer=0,pull_geometry=0,pull_admission=0,pull_interpolation=0,teleport=0,circle_norm=0,bomb_norm=0,knockback_norm=0,cone_membership=0)
 pull=next(row for row in graph['actions']if row['native_tag']==20)
 distances=[(0.,0.),(30.,0.),(struct.unpack('<f',struct.pack('<I',bits(30.)-1))[0],0.),(struct.unpack('<f',struct.pack('<I',bits(30.)+1))[0],0.),(struct.unpack('<f',bytes.fromhex('93daef41'))[0],struct.unpack('<f',bytes.fromhex('9703863f'))[0]),(float('nan'),0.)]
 for dx,dy in distances:
  fraction=None;setup();put(record,'12I',*pull['words']);put(frame+0x150,'4f',0.,0.,0.,0.);put(frame+0xd0,'4f',dx,dy,0.,0.);put(frame+0x178,'f',0.)
  run(0x1459218c0,[0x14591f828],'pull-producer')
  distance=f32(math.sqrt(f32(f32(dy*dy)+f32(dx*dx))))
  admitted=not(distance>30.)
  assert get(game+0x5b8,'Q')[0]==int(admitted)
  if admitted:
   assert get(delayed,'Qf')[0:2]==(777,f32(10.+struct.unpack('<f',struct.pack('<I',pull['words'][1]))[0]))
   assert get(delayed+61,'B')[0]==36
   assert calls[:2]==[['hold',bits(f32(struct.unpack('<f',struct.pack('<I',pull['words'][1]))[0]+f32(.4))),1,0],['cast',pull['words'][0],pull['words'][1]]]
  counts['pull_producer']+=1
 for fraction in [None,-1.,0.,.01,.5,1.,2.,float('nan')]:
  for height in [False,True]:
   for player in [(5.,2.,7.),(-10.,13.,4.)]:
    setup();put(actor+0x180,'3f',1.,2.,3.);put(game+0x4d0,'3f',*player);put(game+0xadf,'B',1)
    put(game+0x9b0,'Q',geometry);put(frame+0x238,'Q',0)
    for reg,value in [(r.UC_X86_REG_RAX,actor),(r.UC_X86_REG_RBX,0)]:uc.reg_write(reg,value)
    run(0x145916ca2,[0x145917018],'pull-geometry')
    angle=f32(math.atan2(f32(player[1]-2.),f32(player[0]-1.)));reach=f32(3.+1.5)
    point=(f32(f32(f32(math.cos(angle))*reach)+1.),f32(f32(f32(math.sin(angle))*reach)+2.),3.)
    point=clamp(clip(point,(1.,2.,3.),fraction),zone_index);point=(*point[:2],f32((9. if height else point[2])+.5))
    assert get(game+0x4d0,'3I')==tuple(map(bits,point)),(fraction,height,player,get(game+0x4d0,'3f'),point)
    assert get(game+0x550,'I')[0]==0 and get(game+0xa10,'I')[0]==1 and get(game+0xa20,'B')[0]==12
    assert get(game+0x630,'Q')[0]==2
    assert calls[0]==['player-mover',1,0xffffffff,tuple(map(bits,point)),bits(f32(angle+f32(math.pi)))]
    assert calls[1]==['spell',777,21147,1,tuple(map(bits,point))]
    counts['pull_geometry']+=1
 for state in [0,1,2]:
  for duration in [0.,1.,float('nan')]:
   setup();put(game+0xadf,'B',state);put(actor+0x190,'f',duration)
   uc.reg_write(r.UC_X86_REG_RAX,actor);uc.reg_write(r.UC_X86_REG_RBX,0);sx(r.UC_X86_REG_XMM15,0.)
   run(0x145916843,[0x145916c64,0x145916ca2,0x145916877],'pull-admission')
   assert uc.reg_read(r.UC_X86_REG_RIP)==(0x145916c64 if state!=1 else 0x145916ca2 if duration<=0. else 0x145916877)
   counts['pull_admission']+=1
 for duration in [.5,1.,2.,float('nan')]:
  for now in [9.,10.,10.5,11.,12.,float('nan')]:
   setup();put(actor+0x174,'3f',1.,2.,3.);put(actor+0x180,'3f',5.,10.,15.);put(actor+0x18c,'2f',10.,duration);put(game+0xa4c,'f',now)
   uc.reg_write(r.UC_X86_REG_RAX,actor);uc.reg_write(r.UC_X86_REG_RBX,0);sx(r.UC_X86_REG_XMM0,duration)
   run(0x145916877,[0x145916cc1],'pull-interpolation')
   ratio=f32(f32(f32(now)-10.)/f32(duration));ratio=ratio if math.isnan(ratio)else min(max(ratio,0.),1.)
   expected=tuple(bits(f32(f32(f32(b-a)*ratio)+a))for a,b in zip((1.,2.,3.),(5.,10.,15.)))
   xy=uc.reg_read(r.UC_X86_REG_XMM9);z=uc.reg_read(r.UC_X86_REG_XMM12)&0xffffffff
   assert(xy&0xffffffff,(xy>>32)&0xffffffff,z)==expected,(duration,now,(xy&0xffffffff,(xy>>32)&0xffffffff,z),expected)
   counts['pull_interpolation']+=1
 for row in graph['actions']:
  if row['native_tag']!=21:continue
  for fraction in [None,-1.,0.,.5,1.,float('nan')]:
   for height in [False,True]:
    setup();put(record,'12I',*row['words']);put(frame+0xa8,'3f',1.,2.,3.);put(frame+0xd0,'4f',5.,2.,0.,0.);put(frame+0xe0,'4f',2.,0.,0.,0.)
    put(frame-0x10,'3f',5.,2.,7.);put(frame+0x178,'f',0.);sx(r.UC_X86_REG_XMM11,7.)
    run(0x145922437,[0x14591f828],'teleport')
    distance=struct.unpack('<f',struct.pack('<I',row['words'][1]))[0];point=clamp(clip((f32(5.+distance),2.,7.),(5.,2.,7.),fraction),zone_index)
    point=(*point[:2],9. if height else point[2])
    assert get(actor+0x174,'3I')==get(actor+0x180,'3I')==tuple(map(bits,point)),(row['index'],fraction,height,get(actor+0x174,'3f'),point)
    assert get(actor+0x18c,'II')==(bits(10.),0)
    assert [c[0]for c in calls]==['spell','publish','spell','publish','hold']
    assert calls[0][1:]==[777,row['words'][0],1,tuple(map(bits,(1.,2.,3.)))]
    assert calls[2][1:]==[777,row['words'][0],1,tuple(map(bits,point))]
    facing=f32(math.atan2(f32(2.-point[1]),f32(5.-point[0])))
    assert calls[-1]==['hold',bits(.5),1,bits(facing)],(row['index'],fraction,height,point,calls[-1],bits(facing))
    counts['teleport']+=1
 # Complete norm operands are checked, including diagonal one-ULP
 # boundaries; true CRT hypot remains a seam instead of becoming scalar sqrt.
 points=[(0.,0.),(0.,.49),(0.,.5),(0.,.51),(.3,.4),(.6,.8),(f32(.6)-2**-24,f32(.8)),(f32(.6)+2**-24,f32(.8)),
  (3.,4.),(4.2,5.6),(29.981725692749023,1.0469845533370972),
  (18.,24.),(float('nan'),0.)]
 for radius in [1.,7.,30.,float('nan')]:
  for dx,dy in points:
   setup();put(actor+0x30,'If',0,radius);put(actor+0x40,'3f',0.,0.,99.)
   uc.reg_write(r.UC_X86_REG_R13,actor);uc.reg_write(r.UC_X86_REG_XMM9,bits(dx)|(bits(dy)<<32))
   run(0x145918287,[0x1459182d2],'circle-norm')
   norm=f32(math.hypot(f32(dx),f32(dy)))
   assert norm_calls==[[bits(dx),bits(dy)]]
   assert bool(uc.reg_read(r.UC_X86_REG_RAX)&255)==(radius>=norm)
   counts['circle_norm']+=1
   setup();put(actor+0x180,'3f',dx,dy,99.);put(record,'2f',0.,0.);put(record+0x100,'f',radius)
   for reg,value in [(r.UC_X86_REG_R12,actor+0x1d8),(r.UC_X86_REG_RBX,record),(r.UC_X86_REG_R14,record+0x100)]:uc.reg_write(reg,value)
   run(0x1459d4670,[0x1459d469e,0x1459d4736],'bomb-norm')
   assert norm_calls==[[bits(dx),bits(dy)]]
   assert(uc.reg_read(r.UC_X86_REG_RIP)==0x1459d4736)==(radius>=norm)
   counts['bomb_norm']+=1
 for dx,dy in points:
  setup();put(actor+0x40,'3f',0.,0.,99.);put(actor+0x4c,'f',.75);put(actor+0x6c,'f',12.)
  uc.reg_write(r.UC_X86_REG_R13,actor);sx(r.UC_X86_REG_XMM9,dx);sx(r.UC_X86_REG_XMM10,dy);sx(r.UC_X86_REG_XMM7,.5)
  run(0x145918435,[0x145918f36],'knockback-norm')
  norm=f32(math.hypot(f32(dx),f32(dy)));angle=f32(math.atan2(f32(dy),f32(dx)))if not(norm<.5)else .75
  assert norm_calls==[[bits(dx),bits(dy)]]and get(frame+0x11c,'I')[0]==bits(angle)
  counts['knockback_norm']+=1
 for angle in [0.,.75,-2.5]:
  for radius in [.49,.5,.51,1.,7.,7.001,float('nan')]:
   for offset in [0.,f32(math.pi/4)-2**-23,f32(math.pi/4),f32(math.pi/4)+2**-23,f32(math.pi/2),f32(math.pi)]:
    dx=f32(f32(math.cos(angle+offset))*radius);dy=f32(f32(math.sin(angle+offset))*radius)
    setup();put(actor+0x30,'I2f',3,7.,f32(math.pi/2));put(actor+0x40,'3f',0.,0.,99.);put(actor+0x4c,'f',angle)
    uc.reg_write(r.UC_X86_REG_R13,actor);uc.reg_write(r.UC_X86_REG_XMM9,bits(dx)|(bits(dy)<<32));sx(r.UC_X86_REG_XMM7,.5)
    uc.reg_write(r.UC_X86_REG_XMM11,int.from_bytes(struct.pack('<4I',*[0x7fffffff]*4),'little'));sx(r.UC_X86_REG_XMM12,f32(math.tau))
    run(0x145918287,[0x1459183d6],'cone-membership')
    distance=f32(math.hypot(dx,dy));expected=False
    if distance<=7.:
     if distance<.5:expected=True
     else:
      a=f32(f32(f32(math.atan2(dy,dx))-f32(angle))+f32(math.pi));value=f32(math.fmod(a,f32(math.tau)))
      if value<0.:value=f32(value+f32(math.tau))
      expected=abs(f32(value-f32(math.pi)))<=f32(f32(math.pi/2)*.5)
    assert bool(uc.reg_read(r.UC_X86_REG_RAX)&255)==expected,(angle,radius,offset,dx,dy,expected)
    counts['cone_membership']+=1
 return dict(cases=counts,byte_executed_helpers=[hex(a)for a in sorted(executed_helpers)],
  intercepted_seams=[hex(a)for a in sorted(seams)],pull_boundary_xy_bits=[[bits(a),bits(b)]for a,b in distances],
  limits=['Real collision fractions, height samples, trig/zone selection, packet serializers and publication are controlled seams; current clipping/clamping/queue helpers execute actual bytes.'])


def ward_hit_contracts(raw):
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_UNMAPPED
 from unicorn import x86_const as r
 uc=Uc(UC_ARCH_X86,UC_MODE_64);mem=0x73000000;uc.mem_map(mem,0x100000);mapped=set();stops=set();allowed=(0,0)
 md=Cs(CS_ARCH_X86,CS_MODE_64)
 def demand(machine,access,address,size,value,user):
  page=address&~4095
  if page not in mapped:uc.mem_map(page,4096);uc.mem_write(page,raw(page,4096));mapped.add(page)
  return True
 def guard(machine,address,size,user):
  if address in stops:uc.emu_stop();return
  assert allowed[0]<=address<allowed[1],hex(address)
  instruction=next(md.disasm(bytes(uc.mem_read(address,size)),address));assert instruction.mnemonic!='call',hex(address)
 uc.hook_add(UC_HOOK_MEM_UNMAPPED,demand);uc.hook_add(UC_HOOK_CODE,guard)
 game,actors,frame,periodic=mem,mem+0x10000,mem+0x20000,mem+0x30000
 def put(a,fmt,*v):uc.mem_write(a,struct.pack('<'+fmt,*v))
 def get(a,fmt):return struct.unpack('<'+fmt,uc.mem_read(a,struct.calcsize('<'+fmt)))
 def sx(reg,v):uc.reg_write(reg,bits(v))
 def run(a,b,ends):
  nonlocal stops,allowed
  allowed=(a,b);stops=set(ends);uc.reg_write(r.UC_X86_REG_EFLAGS,2);uc.reg_write(r.UC_X86_REG_MXCSR,0x1f80)
  uc.emu_start(a,0,count=10000);assert uc.reg_read(r.UC_X86_REG_RIP)in stops
 counts=dict(hit_lookup_damage=0,death_state=0,death_metadata=0,ordinary_drop_gate=0,kill_and_heal_gate=0,corpse_gate=0)
 for count in [0,1,3]:
  for present in [False,True]:
   for dead in [False,True]:
    for health in [-2.,0.,.25,1.,27.5,float('nan')]:
     for power in [-3.,0.,.25,1.,17.,float('nan')]:
      for multiplier in [1.,1.25]:
       uc.mem_write(actors,bytes(0x1000))
       for i in range(count):put(actors+i*0x1d8+0xf0,'Q',55+i)
       index=max(count-1,0);actor=actors+index*0x1d8
       put(actor+0xf0,'Q',77 if present else 999);put(actor+0xb0,'I',int(dead));put(actor+0x158,'f',health);put(actor+0x190,'f',0.)
       uc.reg_write(r.UC_X86_REG_R14,actors);uc.reg_write(r.UC_X86_REG_RAX,count*0x1d8);uc.reg_write(r.UC_X86_REG_RCX,count);uc.reg_write(r.UC_X86_REG_RSI,77)
       sx(r.UC_X86_REG_XMM8,multiplier);sx(r.UC_X86_REG_XMM6,power);sx(r.UC_X86_REG_XMM0,1.)
       run(0x14593f1f3,0x14593f275,[0x14593f275,0x1459422f9])
       admitted=count>0 and present and not dead
       assert(uc.reg_read(r.UC_X86_REG_RIP)==0x14593f275)==admitted
       if admitted:
        product=f32(f32(multiplier*power)*1.);amount=product if product>1. else 1.
        assert get(actor+0x158,'I')[0]==bits(f32(health-amount))
        assert uc.reg_read(r.UC_X86_REG_XMM8)&0xffffffff==bits(amount)
        assert uc.reg_read(r.UC_X86_REG_XMM0)&0xffffffff==bits(health if health>0. else 0.)
       else:assert get(actor+0x158,'I')[0]==bits(health)
       counts['hit_lookup_damage']+=1
 for position in [(0.,0.,0.),(3.,-2.,7.5),(-0.,1024.,-7.)]:
  for now in [0.,10.,float('nan')]:
   for length in [0,1,5]:
    uc.mem_write(actors,bytes(0x400));put(actors+8,'QQ',periodic,length);put(frame+0x140,'3f',*position)
    put(periodic,'Q',0x123456789abcdef)
    uc.reg_write(r.UC_X86_REG_RCX,actors);uc.reg_write(r.UC_X86_REG_RBP,frame);sx(r.UC_X86_REG_XMM8,now)
    run(0x14593ffb2,0x145940010,[0x145940010])
    assert get(actors+0x174,'3I')==get(frame+0x140,'3I')==get(actors+0x180,'3I')
    assert get(actors+0x18c,'II')==(bits(now),0)
    assert get(actors+0xb0,'II')==(1,bits(now))
    assert get(actors+8,'QQ')==(periodic,0) and get(periodic,'Q')[0]==0x123456789abcdef
    counts['death_state']+=1
 for primary in [False,True]:
  for guardian in [False,True]:
   for ordinary in [False,True]:
    for elite in [False,True]:
     uc.mem_write(actors,bytes(0x400));put(actors+0x18,'q',0 if primary else -1);put(actors+0x30,'Q',mem+0x50000)
     put(actors+0x58,'q',0 if guardian else -1);put(actors+0x90,'Q',123);put(actors+0xf8,'Q',mem+0x60000 if ordinary else 0);put(actors+0x1d0,'B',int(elite))
     uc.reg_write(r.UC_X86_REG_RCX,actors);uc.reg_write(r.UC_X86_REG_RBP,frame)
     run(0x145940010,0x14594004c,[0x14594004c])
     assert uc.reg_read(r.UC_X86_REG_R12)==(mem+0x50000 if primary else 0)
     assert uc.reg_read(r.UC_X86_REG_R14)==(0 if guardian else 0xffffffffffffffff)
     assert get(frame+0xd8,'Q')[0]==(mem+0x60000 if ordinary else 0)
     assert uc.reg_read(r.UC_X86_REG_R15)&255==int(elite)
     counts['death_metadata']+=1
 for definition in [0,mem+0x60000]:
  for elite in [0,1]:
   put(frame+0xd8,'Q',definition);put(mem+0x60000+0x4c,'B',elite);put(game+0x2c8,'H',100)
   uc.reg_write(r.UC_X86_REG_RBP,frame);uc.reg_write(r.UC_X86_REG_RDI,game)
   run(0x145940900,0x145940943,[0x145940de1,0x145940958,0x145940c3b])
   assert uc.reg_read(r.UC_X86_REG_RIP)==(0x145940de1 if definition==0 else 0x145940c3b if elite else 0x145940958)
   counts['ordinary_drop_gate']+=1
 for kills in [0,0xffffffff]:
  for elite_kills in [0,0xffffffff]:
   for elite in [False,True]:
    for heal in [-1.,0.,1.,float('nan')]:
     put(game+0x78c,'II',kills,elite_kills);put(game+0x4bc,'f',heal)
     uc.reg_write(r.UC_X86_REG_RDI,game);uc.reg_write(r.UC_X86_REG_R15,int(elite))
     run(0x1459402a7,0x1459402cc,[0x1459402cc,0x14594040e])
     assert get(game+0x78c,'II')==((kills+1)&0xffffffff,(elite_kills+int(elite))&0xffffffff)
     assert(uc.reg_read(r.UC_X86_REG_RIP)==0x1459402cc)==(heal>0.)
     counts['kill_and_heal_gate']+=1
 for dead in [False,True]:
  for died in [0.,10.,float('nan')]:
   for now in [0.,1.2,f32(1.2)+.001,10.,11.2,11.201,float('nan')]:
    put(actors+0xb0,'If',int(dead),died);uc.reg_write(r.UC_X86_REG_R8,actors)
    sx(r.UC_X86_REG_XMM6,now);sx(r.UC_X86_REG_XMM8,1.2)
    run(0x145945d1a,0x145945d3a,[0x145945dd0,0x145945cdc,0x145945d3a])
    expected=0x145945dd0 if not dead else 0x145945d3a if f32(f32(now)-f32(died))>f32(1.2) else 0x145945cdc
    assert uc.reg_read(r.UC_X86_REG_RIP)==expected
    counts['corpse_gate']+=1
 return counts


def inspect_frame_order(raw,visited):
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 md=Cs(CS_ARCH_X86,CS_MODE_64)
 ranges={
  'actor-vector':(0x145945c0a,0x145945c2a),
  'movement-queue':(0x145948be1,0x145948c25),
  'melee-queue':(0x145948d23,0x145948d4d),
  'corpse-consume':(0x145948de5,0x145948dfc),
  'movement-serial':(0x145948f02,0x145948f43),
  'movement-travel-publish':(0x145948fd9,0x145948ff3),
  'movement-facing-publish':(0x145949030,0x145949051),
  'melee-consume':(0x1459490ed,0x1459491c3),
  'cast-start':(0x14594927b,0x145949320),
  'cast-source-admission':(0x145949320,0x14594935c),
  'cast-completion':(0x1459493bf,0x145949535),
  'aura-remove-consume':(0x145949a20,0x145949a45),
  'aura-applications-consume':(0x145949a90,0x145949ab2),
  'primary-phase-queue':(0x145948101,0x14594812e),
  'primary-phase-consume':(0x145949b43,0x145949b8a),
  'guardian-phase-queue':(0x145947afe,0x145947b29),
  'guardian-phase-consume':(0x145949c23,0x145949c4a),
  'guardian-engage-queue':(0x145947404,0x145947420),
  'guardian-engage-admission':(0x14594a002,0x14594a153),
  'cast-start-flags':(0x1458c332f,0x1458c337d),
  'cast-start-target':(0x1458c33aa,0x1458c33e1),
  'yell-kind':(0x1458c4052,0x1458c4060),
  'predeath-periodic-snapshot':(0x14593fdc7,0x14593fec0),
  'hazard-half-yard-constants':(0x14591722c,0x14591724c),
  'snapshot-periodic-clone':(0x1459dc0e0,0x1459dc1db),
  'common-hit-death-callback':(0x14594218c,0x1459422f0),
 }
 rows={}
 for role,(a,b)in ranges.items():
  ins=list(md.disasm(raw(a,b-a),a));assert sum(x.size for x in ins)==b-a,role
  rows[role]='\n'.join(f'{x.mnemonic} {x.op_str}' for x in ins)
  for x in ins:visited.setdefault('inspected_frame_order',{})[x.address]=bytes(x.bytes)
 assert rows['melee-consume'].index('call 0x1458ec3f0')<rows['melee-consume'].index('call 0x1458c4bf0')
 assert 'jmp 0x145949139'in rows['melee-consume']
 assert 'call 0x1458c3280'in rows['cast-start']
 assert 'call 0x1458ce7d0'in rows['cast-completion']
 assert '0xb0'not in rows['cast-source-admission']
 assert 'call 0x14594dd20'in rows['aura-remove-consume'] and 'xor r9d, r9d'in rows['aura-remove-consume']
 assert 'call 0x14594e800'in rows['aura-applications-consume']
 assert 'call 0x1458c4010'in rows['primary-phase-consume']
 assert 'call 0x1458c22c0'in rows['guardian-phase-consume']
 assert 'mov byte ptr [rax], 0xc'in rows['yell-kind']
 assert 'mov qword ptr [rax + 5], r14'in rows['yell-kind']
 assert 'mov word ptr [rax + rdx], 2'in rows['cast-start-flags']
 assert 'mov dword ptr [rax + rdx], edi'in rows['cast-start-target']
 assert 'call 0x14596a3e0'in rows['guardian-engage-admission']
 assert 'call 0x14596a7e0'in rows['guardian-engage-admission']
 assert '0xb0'not in rows['guardian-engage-admission']
 assert struct.unpack('<f',raw(0x145dad264,4))[0]==.5
 assert 'movss xmm7, dword ptr [rip + 0x496021]'in rows['hazard-half-yard-constants']
 assert 'call 0x1459dc0e0'in rows['predeath-periodic-snapshot']
 assert 'mov rbx, qword ptr [rdx + 0x10]'in rows['snapshot-periodic-clone']
 assert 'add r14, 0x30'in rows['snapshot-periodic-clone']
 assert rows['common-hit-death-callback'].count('call 0x145934c50')==2
 return dict(ranges={role:[hex(a),hex(b)]for role,(a,b)in ranges.items()},
  limits=['These26 ranges are decoded/inspected, not additional executed cases; snapshot copying and generic callback entry order are included.',
  'The complete frame and its external consumers are not executed together.'])


def inspect_fixture_context(raw,span,visited):
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64,CS_OP_MEM
 md=Cs(CS_ARCH_X86,CS_MODE_64);md.detail=True
 ranges={
  'dispatcher-inputs':(0x14591f88a,0x14591fa2f),
  'delayed-charge-constants':(0x145916609,0x14591663a),
  'hazard-geometry-constants':(0x14591721d,0x14591724c),
  'actor-clock-elapsed-player':(0x145945784,0x1459457a6),
  'actor-corpse-constants':(0x145945c2a,0x145945cb3),
  'cast-conversion-zero-scale':(0x14594921d,0x145949229),
  'cast-conversion-upper':(0x145948e9c,0x145948ea5),
  'shared-health-unit':(0x1459490c8,0x1459490d8),
  'hit-power-clock-unit':(0x14593ed18,0x14593ed48),
  'death-clock':(0x14593fec0,0x14593fec9),
  'ordinary-bomb-zero-unit':(0x1459d4654,0x1459d465f),
 }
 expected={
  0x14591660d:('xmm14',40.),0x145916616:('xmm13',f32(.15)),
  0x14591661f:('xmm11',1000.),0x145916628:('xmm10',4294967040.),0x145916631:('xmm8',f32(.2)),
  0x14591722c:('xmm11',[0x7fffffff]*4),0x14591723b:('xmm7',.5),0x145917243:('xmm12',f32(math.tau)),
  0x145945ca6:('xmm8',f32(1.2)),0x145949220:('xmm10',-1000.),
  0x145948e9c:('xmm9',4294967040.),0x1459490c8:('xmm8',1.),
  0x14593ed40:('xmm0',1.),0x1459d4657:('xmm6',1.),
 }
 constants=[];decoded={}
 for role,(a,b)in ranges.items():
  instructions=list(md.disasm(raw(a,b-a),a));assert sum(x.size for x in instructions)==b-a,role
  decoded[role]='\n'.join(f'{x.mnemonic} {x.op_str}'for x in instructions)
  for instruction in instructions:
   visited.setdefault('inspected_fixture_context',{})[instruction.address]=bytes(instruction.bytes)
   if instruction.address not in expected:continue
   register,value=expected[instruction.address];assert instruction.op_str.startswith(register+',')
   operand=next(o for o in instruction.operands if o.type==CS_OP_MEM)
   assert md.reg_name(operand.mem.base)=='rip'
   address=instruction.address+instruction.size+operand.mem.disp
   words=value if isinstance(value,list)else[bits(value)]
   assert list(struct.unpack('<'+'I'*len(words),raw(address,4*len(words))))==words
   constants.append(dict(load=hex(instruction.address),register=register,data=span(address,4*len(words)),word_bits=words))
 assert len(constants)==len(expected)
 assert 'movss xmm15, dword ptr [rsi + 0xa4c]'in decoded['dispatcher-inputs']
 assert 'movss xmm14, dword ptr [rax + 0x160]'in decoded['dispatcher-inputs']
 assert 'movshdup xmm10, xmm0'in decoded['dispatcher-inputs']
 assert 'movaps xmm7, xmm1'in decoded['actor-clock-elapsed-player']
 assert 'movss xmm6, dword ptr [rcx + 0xa4c]'in decoded['actor-clock-elapsed-player']
 assert 'xorps xmm15, xmm15'in decoded['delayed-charge-constants']
 assert 'xorps xmm7, xmm7'in decoded['cast-conversion-zero-scale']
 assert 'xorps xmm7, xmm7'in decoded['ordinary-bomb-zero-unit']
 assert 'movaps xmm6, xmm2'in decoded['hit-power-clock-unit']
 assert 'movss xmm1, dword ptr [rcx + 0xa4c]'in decoded['hit-power-clock-unit']
 assert 'movss xmm8, dword ptr [rdi + 0xa4c]'in decoded['death-clock']
 return dict(ranges={role:span(a,b-a)for role,(a,b)in ranges.items()},constants=constants,
  fixture_inputs={
   'shields':['clock, duration, optional actor kinds and shield/exposure deadlines are variables','damage inputs are the prefix multiplier, incoming power and defense factor'],
   'sequences':['dispatcher source damage/clock/height/angle roles are variables','whirlwind consumes current actor speed and clock'],
   'lines':['dispatcher source damage/clock/height/angle roles are variables','charge40/.15/1000/u32upper/.2 and membership half/absolute mask are live constants'],
   'bombs':['dispatcher source damage/clock/height are variables','ordinary selector zero/unit initializers are live constants'],
   'waves':['dispatcher source damage/clock/height and row distance/radii are variables'],
   'actions':['dispatcher source damage/clock/height/angle are variables','shared hazard half constant controls both line width and cone/knockback epsilon'],
   'volleys':['current speed/duration helpers execute their own constants','flight center/height/delay/counter and membership radius/distance are variable inputs'],
   'pools':['dispatcher source damage/clock and area deadlines are variable inputs'],
   'actor_frame':['elapsed/clock/player and native helper HP/damage outputs are variables','cast0/-1000/u32upper and guardianHP1 contexts are live constants'],
   'ward_hit_death':['shared hit multiplier/power and HP are variables','ward defense begins at1, death clock comes fromGame+a4c, corpse cutoff1.2 is live'],
   'pull_teleport':['source/player/angle/height/clock, ray result and zone index are variables','current clamp/collision/enqueue helpers execute their own constants'],
  },limits=['Context ranges are decoded/inspected; they do not execute all of their caller bodies together. Variable fixture profiles are deliberate inputs, not claims that those values are hardcoded by the game.'])


def source_checks():
 base=ROOT/'crates/azeroth-survivors-re/src'
 checks={
  'bosses/raid_areas.rs':['self.dispatch_line(record, context, port, math)','self.dispatch_bomb(record, context, port)','self.dispatch_shape(record, context, port)','port.raid_bomb_damage(center,radius,damage,spell)','row.inner_radius.is_none_or(|inner| distance >= inner)','port.damage_player(total * port.raid_damage_multiplier(), last_source)','let distance = dx.hypot(dy)','let angle = if !(distance < 0.5)','if distance < 0.5 { return true; }'],
  'bosses/raid_sequences.rs':['abilities::dispatch_live(&native_action(first)','effects.raid_areas.lines.ability_at','action.duration'],
  'bosses/raid_extra.rs':['let dx = c.source.x - c.player.x','let dy = c.source.y - c.player.y','let distance = (dy * dy + dx * dx).sqrt()','if !(distance > 30.)','port.ray_fraction(c.player, requested).filter(|v| !(*v >= 1.))','let length = (dy * dy + dx * dx).sqrt().max(0.5)','port.raid_hold_facing(c.source_guid, 0.5, facing)'],
  'bosses/raid_lines.rs':['port.begin_raid_charge(','port.raid_aura(source, spell, false)'],
  'gameplay/mechanics/bosses.rs':['fn raid_context(','fn raid_pull(','fn raid_teleport(','fn raid_spawn_at(','fn begin_raid_charge(','RaidWarning::Weakened','pending_actions.extend','endless_enabled: self.boss_state.completion.endless_enabled','if self.endless_enabled { 1.0 } else { 2.0 }','let dx = point.x-from.x; let dy = point.y-from.y','let length = (dy * dy + dx * dx).sqrt().max(0.5)'],
  'gameplay/mechanics/raid_hits.rs':['self.dead || self.completed','passive.hit_with_execution(PendingHit','source_guid: 1','critical: false','damages_player: false, school: 2','radius >= (point.x - center.x).hypot(point.y - center.y)'],
  'gameplay/mechanics/wards.rs':['if row.actor.dead { return None; }','has_periodic: !row.periodic.is_empty()','damage::apply_hit_with_raid_multiplier(','primary_boss: false','guardian: false','native_flag_158: 0','row.actor.dead = true','row.actor.died_at = self.now','*self.kills = self.kills.wrapping_add(1)','if self.stats.heal_on_kill > 0.','RunEvent::EnemyDied { guid: row.guid }','from: position, to: position, started_at: self.now, duration: 0.'],
  'gameplay/mechanics/callbacks.rs':['if let Some(input) = self.resolve_hit(hit, rng)','self.gates().qualifies_death(input.remaining_health)','(event.kind == 2).then(|| self.core.victim_snapshot(victim_guid))','periodic: row.periodic.clone()'],
  'run_effects/presentation.rs':['self.spells.contains(&spell_id)','row.owner_kind==0','count.min(255).saturating_sub(1)'],
 }
 compact=lambda value:re.sub(r'\s+','',value)
 for path,tokens in checks.items():
  value=compact((base/path).read_text())
  for token in tokens:assert compact(token)in value,(path,token)
 area=(base/'bosses/raid_areas.rs').read_text()
 assert area.index('self.lines.tick(now, port)')<area.index('self.tick_areas(now, elapsed, port)')
 frame=re.sub(r'\s+','',(base/'gameplay/mechanics/actor_frame.rs').read_text())
 stage_order=['forguidin&frame.removals','for(guid,movement)inframe.movements',
  'for(amount,melee,source_guid)inframe.melee','for(source_guid,spell_id,damage)inframe.casts',
  'self.resolve_actor_periodic(','self.publish_actor_aura_updates(',
  'self.events.extend(frame.yells','self.events.extend(frame.emotes',
  'self.dispatch_pending_raid_requests(','self.resolve_ward_actions(',
  'self.resolve_guardian_engagements(frame.engaged)']
 ward_lane=frame.split('Lane::Ward(index)=>{')[1].split('letward_actions=')[0]
 assert ward_lane.index('ifrow.actor.dead{')<ward_lane.index('periodic::take_actor_ticks(')
 assert 'ifnow-row.actor.died_at>1.2{'in ward_lane
 ward=(base/'gameplay/mechanics/wards.rs').read_text().split('pub(super) fn hit_ward(')[1]
 assert 'elite_kills'not in ward and 'PendingDrop'not in ward and 'row.periodic.clear()'not in ward
 positions=[frame.index(token)for token in stage_order]
 assert positions==sorted(positions),'Shared actor frame order changed'
 return dict(files=len(checks)+1,guards=sum(map(len,checks.values()))+5,actor_stage_order=stage_order)


def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
 mod = load_script('current_raid', ROOT/'scripts/check-raid-target.py')
 target,raw,span,graph,headers=mod.recover();mod.check_graph(graph,headers)
 import unicorn
 from capstone import Cs,CS_ARCH_X86,CS_MODE_64
 original_uc=unicorn.Uc;visited={};active='';seam_entries=set()
 def traced_uc(*arguments,**kwargs):
  machine=original_uc(*arguments,**kwargs)
  def trace(uc,address,size,user):
   if 0x140000000<=address<0x149000000:
    visited.setdefault(active,{})[address]=raw(address,size)
  machine.hook_add(unicorn.UC_HOOK_CODE,trace)
  return machine
 unicorn.Uc=traced_uc
 counts={}
 try:
  active='shields';counts[active]=shield_contracts(raw,[dict(spell=r['words'][0],duration_bits=r['words'][1])for r in graph['actions']if r['native_tag']==23])
  active='sequences';counts[active]=sequence_contracts(raw,graph)
  active='lines';counts[active]=line_contracts(raw)
  active='bombs';counts[active]=bomb_contracts(raw,[dict(payload_words=r['words'][:5])for r in graph['actions']if r['native_tag']==30])
  active='waves';counts[active]=wave_contracts(raw,[dict(payload_words=r['words'][:6])for r in graph['actions']if r['native_tag']==27])
  active='actions';counts[active]=action_contracts(raw,[dict(native_tag=r['native_tag'],payload_words=r['words'][:5 if r['native_tag']==8 else 4])for r in graph['actions']if r['native_tag']in [8,19]])
  active='volleys';counts[active]=volley_contracts(raw)
  active='pools';counts[active]=pool_contracts(raw,[dict(words=r['words'][:5])for r in graph['actions']if r['native_tag']==28])
  active='actor_frame';counts[active]=frame_contracts(raw)
  active='ward_hit_death';counts[active]=ward_hit_contracts(raw)
  active='pull_teleport';movement=movement_contracts(raw,graph);counts[active]=movement['cases']
 finally:unicorn.Uc=original_uc
 frame_order=inspect_frame_order(raw,visited)
 fixture_context=inspect_fixture_context(raw,span,visited)
 source=source_checks()
 out=STAGE if args.stage else KEPT
 if args.stage:out.mkdir(parents=True,exist_ok=True)
 # A single copy of every current instruction. Existing canonical extracts own
 # their rows; only previously unretained visited instructions are emitted here.
 canonical=ROOT/'docs/analysis/evidence/0.112.0'
 # Fixed delivery dependencies only. No ambient evidence or runtime inventory
 # can silently change instruction ownership when another scope is promoted.
 files=[
  'raid/queue.asm','raid/duration.asm',
  'raid-hazards/dispatcher.asm','raid-hazards/dynamic-object.asm',
  'raid-hazards/native-spell-radius.asm','raid-hazards/marker-motion.asm',
  'raid-hazards/marker-kind.asm','raid-hazards/transform-unit.asm',
  'raid-inputs/guardian-selector.asm','raid-inputs/guardian-selection-constructor.asm',
  'raid-inputs/guardian-decision-reset.asm','raid-inputs/boss-damage-actor-stats.asm',
  'raid-inputs/guardian-scheduler.asm','raid-inputs/boss-recurring.asm',
  'raid-inputs/boss-enrage.asm','raid-inputs/boss-health-endless.asm',
  'raid-inputs/boss-phase-ratio.asm','raid-inputs/guardian-phase-gates.asm',
  'raid-inputs/boss-phase-actions.asm','raid-inputs/boss-phase-yell.asm','raid-inputs/replacement-timers.asm',
  'raid-wards/tick-actions.asm','raid-wards/tick-admission.asm',
  'raid-wards/hatch-creation.asm','raid-wards/ward-shield-query.asm',
  'raid-wards/addon-target.asm','raid-wards/unit-presentation.asm',
  'raid-wards/heal.asm','raid-wards/create.asm',
  'warrior-talents/selected-native.asm','buff-potency/selected-native.asm',
  'raid-stateful/selected-native.asm']
 candidates=[]
 for name in files:
  owned={}
  for line in (canonical/name).read_text().splitlines():
   match=re.match(r'^([0-9a-f]+): ([0-9a-f]+) ',line)
   if match and len(match[2])%2==0:
    address=int(match[1],16);value=bytes.fromhex(match[2])
    assert address not in owned,(name,hex(address))
    assert raw(address,len(value))==value,(name,hex(address),'canonical instruction bytes differ')
    owned[address]=value
  assert owned,name
  candidates.append((str(Path('..')/name),owned))
 # Reuse current Ghidra operation provenance instead of duplicating imports.
 for family in ['raid-hazards','raid-inputs','raid-wards']:
  mod.verify_rea_operations(raw,canonical/family,target['sha256'])
 raid_rea=json.loads((canonical/'raid/rea-provenance.json').read_text())
 assert raid_rea['target_sha256']==target['sha256']
 for query in raid_rea['queries']:
  commitment=query['raw_input']
  assert commitment==span(int(commitment['va'],16),commitment['byte_count'])
  assert query['raw_import_sha256']==commitment['sha256']
  assert hashlib.sha256((canonical/'raid'/query['pseudocode']).read_bytes()).hexdigest()==query['pseudocode_sha256']
 hit_proof=json.loads((canonical/'warrior-talents/manifest.json').read_text())
 assert hit_proof['target']['sha256']==target['sha256']
 hit=next(row for row in hit_proof['ghidra']if row['role']=='victim-hit')
 assert hit['procedure']['procedure']=='0x14593ec90'
 assert hit['input_sha256']==span(0x14593ec90,0x145942543-0x14593ec90)['sha256']
 provenance=[dict(manifest='../'+family+'/rea-provenance.json',target_sha256=target['sha256'])
  for family in ['raid','raid-hazards','raid-inputs','raid-wards']]
 provenance.append(dict(manifest='../warrior-talents/manifest.json',role='victim-hit',
  evidence_id=hit['evidence_id'],input_range=span(0x14593ec90,0x145942543-0x14593ec90)))
 owners={};new={}
 for addresses in visited.values():
  for address,value in addresses.items():
   if address in owners:continue
   owner=next((name for name,owned in candidates if owned.get(address)==value),None)
   if owner is None:owner='selected-native.asm';new[address]=value
   owners[address]=owner
 md=Cs(CS_ARCH_X86,CS_MODE_64)
 assembly=''
 for address,value in sorted(new.items()):
  instruction=list(md.disasm(value,address));assert sum(row.size for row in instruction)==len(value)
  assembly+=''.join(f'{row.address:x}: {row.bytes.hex()} {row.mnemonic} {row.op_str}'.rstrip()+'\n'for row in instruction)
 if args.stage:(out/'selected-native.asm').write_text(assembly)
 else:assert (out/'selected-native.asm').read_text()==assembly
 traces={}
 for family,addresses in visited.items():
  intervals=[]
  for address,value in sorted(addresses.items()):
   owner=owners[address]
   if intervals and intervals[-1][1]==address and intervals[-1][2]==owner:intervals[-1][1]+=len(value)
   else:intervals.append([address,address+len(value),owner])
  traces[family]=[dict(**span(a,b-a),assembly=owner)for a,b,owner in intervals]
 result=dict(target_version=target['version'],target_sha256=target['sha256'],target_executed=False,
  cases=counts,source_checks=source,inspected_frame_order=frame_order,fixture_context=fixture_context,visited_instruction_ranges=traces,
  canonical_assembly_dependencies=files,rea_dependencies=provenance,movement_contract=movement,
  limits=['Synthetic original-byte fixtures do not execute Rust or launch a reference/rebuilt game.',
  'Visited instruction ranges include intercepted seam entrypoints; their bodies are not certified or counted as executed helpers. The inspected_frame_order group is decoded/static review only.',
  'Terrain, CRT, packet/allocation, nested dispatcher, actor constructor and damage-call seams retain the explicit boundaries in each fixture.',
  'Historical volley inputs retain their actual0.108.0 provenance; every current instruction/result is checked afresh.',
  'Complete generic item/talent callback bodies and a whole shared actor frame are not executed together. Terrain, population cap and gameplay/rendering parity remain separate requirements.'])
 text=json.dumps(result,indent=2)+'\n'
 if args.stage:(out/'manifest.json').write_text(text)
 else:assert (out/'manifest.json').read_text()==text
 print('Current raid lifecycle cases:',counts,'; no compilation/game')
if __name__=='__main__':main()
