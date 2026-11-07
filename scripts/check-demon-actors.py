#!/usr/bin/env python3
"""Replay bounded 0.112.0 demon actor/lifecycle instructions without a build or game."""
from script_sources import load_script
import hashlib
import json
import math
import re
from pathlib import Path
import struct
import sys
from coverage_common import ROOT, latest_target, target_bytes
SHA = "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a"
KEPT = ROOT / "docs/analysis/evidence/demon-actors"
t = latest_target()
if t["sha256"] != SHA:
    raise SystemExit("Selected target differs; do not reuse 0.112.0 actor evidence")
d = target_bytes(t)
module = load_script("pe_inventory", ROOT / "scripts/inventory-executable.py")
p = module.PE(d)
sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as r


def talent_effect(key):
    data = json.loads((ROOT / "docs/analysis/evidence/warlock-talents/definitions.json").read_text())
    assert data["target_sha256"] == SHA
    record = next(row for row in data["definitions"] if row["key"] == key)
    effect = record["effects"]
    offset = p.rva_offset(int(effect["address"], 16) - p.image_base)
    raw = d[offset:offset + effect["byte_count"]]
    assert hashlib.sha256(raw).hexdigest() == effect["sha256"]
    assert raw.hex() == "".join(record["native_effects"])
    return raw[:64]


def machine():
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in p.sections)
    u.mem_map(p.image_base, (size + 4095) & ~4095)
    for section in p.sections:
        u.mem_write(p.image_base + section["rva"], d[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    mem, stack = 0x200000000, 0x300000000
    u.mem_map(mem, 0x50000)
    u.mem_map(stack, 0x20000)
    return u, mem, stack


def target_cases():
    u, mem, stack = machine()
    game,pets,actors,ids,statuses,missiles=[mem+x for x in [0,0x2000,0x10000,0x20000,0x24000,0x30000]]
    def put(a,f,*v):u.mem_write(a,struct.pack(f,*v))
    def get(a,f):return struct.unpack(f,u.mem_read(a,struct.calcsize(f)))
    sys.path.insert(0,'runtime/tool-state/python/camera/python-libs')
    sys.path.insert(0,'runtime/tool-state/python/armory/python-libs')
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    import unicorn.x86_const as r
    u=Uc(UC_ARCH_X86,UC_MODE_64);sz=max(s['rva']+max(s['virtual_size'],s['raw_size'])for s in p.sections)
    u.mem_map(p.image_base,(sz+4095)&~4095)
    for s in p.sections:u.mem_write(p.image_base+s['rva'],d[s['raw_offset']:s['raw_offset']+s['raw_size']])
    mem,stack=0x200000000,0x300000000
    u.mem_map(mem,0x50000);u.mem_map(stack,0x20000)
    game,pets,actors,ids,statuses,missiles=[mem+x for x in [0,0x2000,0x10000,0x20000,0x24000,0x30000]]
    def put(a,f,*v):u.mem_write(a,struct.pack(f,*v))
    def get(a,f):return struct.unpack(f,u.mem_read(a,struct.calcsize(f)))
    current={};queries=[]
    def ret():
     sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def hook(_,a,sz,extra):
     if a==0x14592b2f0:
      out=u.reg_read(r.UC_X86_REG_RCX);center=get(u.reg_read(r.UC_X86_REG_R8),'<3f');radius=struct.unpack('<f',struct.pack('<I',u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff))[0]
      ordered=current['ordered']
      if current.get('filter_query'):
       ordered=[id for id in ordered if (lambda row:row['alive'] and sum((row['position'][i]-center[i])**2 for i in [0,1])<=radius**2)(next(t for t in current['targets'] if t['guid']==id))]
      for i,id in enumerate(ordered):put(ids+8*i,'<Q',id)
      put(out,'<3Q',0,ids,len(ordered));queries.append(dict(center=center,radius=radius,ordered=ordered));ret()
     elif a==0x1400021d0:ret()
    u.hook_add(UC_HOOK_CODE,hook)
    fixture=json.loads((KEPT/'native-target-cases.json').read_text())
    ptr={1:0x14723ebc0,2:0x14723ee60,3:0x147221848,4:0x14723edc0,5:0x14723ece8,6:0x14723ed30,7:0x14723ee10,8:0x14723ed78}
    results=[]
    for old in fixture['cases']:
     current=old['input'];kind=current['kind'];queries.clear();u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000))
     put(game+0xd0,'<QQ',pets,1+len(current['allocations']));put(game+0x568,'<QQ',actors,len(current['targets']));put(game+0x5e0,'<QQ',missiles,len(current['missiles']))
     put(game+0x118,'<QQ',mem+0x40000,sum(t.get('seduction_ready_at',0)>0 for t in current['targets']));stunned=[t for t in current['targets'] if t.get('seduction_ready_at',0)>0]
     for i,row in enumerate(stunned):put(mem+0x40000+i*16,'<Qf',row['guid'],row['seduction_ready_at'])
     put(game+0x484,'<f',current['run_damage']);put(game+0x4e0,'<I',current['level']);put(game+0x4d0,'<3f',*current['player']);put(game+0xa4c,'<f',current['now'])
     for i,id in enumerate([current['retained']]+current['allocations']):
      pet=pets+i*0x80;put(pet+0x18,'<Q',ptr[kind]);put(pet+0x28,'<Q',id or 0);put(pet+0x30,'<Q',current['focus'] or 0);put(pet+0x4c,'<3f',*current['position'])
     for i,row in enumerate(current['targets']):
      a=actors+i*0x1d8;status=statuses+i*0x100;put(a+8,'<QQ',status,len(row['spells']));put(a+0x18,'<q',0 if row['boss'] else -1);put(a+0xb0,'<I',0 if row['alive'] else 1);put(a+0xf0,'<Q',row['guid']);put(a+0x158,'<2f',row['health'],row['maximum_health']);put(a+0x180,'<3f',*row['position']);put(a+0x1a8,'<f',row['selectable_at']);put(a+0x1d0,'<B',int(row['elite']))
      for j,spell in enumerate(row['spells']):put(status+j*0x30+0x10,'<I',spell)
     for i,row in enumerate(current['missiles']):
      put(missiles+i*0x80+0x50,'<Q',row['target']);put(missiles+i*0x80+0x74,'<f',row['power']);put(missiles+i*0x80+0x79,'<B',int(row['consumed']))
     sp=stack+0x18008;put(sp,'<Q',p.image_base);u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,game);u.reg_write(r.UC_X86_REG_RDX,0)
     u.emu_start(0x1459586e0,p.image_base,count=100000)
     assert u.reg_read(r.UC_X86_REG_RIP)==p.image_base
     selected=u.reg_read(r.UC_X86_REG_RDX)if u.reg_read(r.UC_X86_REG_RAX)&1 else None
     if selected!=old['selected']:print(kind,current['name'],old['selected'],'->',selected)
     results.append(dict(input=current,selected=selected,queries=list(queries)))
    return dict(target_sha256=SHA,cases=results)


def clock_cases():
    u, mem, stack = machine()
    game,pets,actors,ids,statuses,missiles=[mem+x for x in [0,0x2000,0x10000,0x20000,0x24000,0x30000]]
    def put(a,f,*v):u.mem_write(a,struct.pack(f,*v))
    def get(a,f):return struct.unpack(f,u.mem_read(a,struct.calcsize(f)))
    from math import isnan
    cases=[];context={}
    def ret():
     sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def hook(_,a,sz,extra):
     if a in [0x145897880,0x145896300]:ret()
     elif a==0x145897ab0:
      out=u.reg_read(r.UC_X86_REG_RCX);put(out,'<2f',1.,context['modifier']);ret()
    u.hook_add(UC_HOOK_CODE,hook)
    ptr={0:0x14723ec08,1:0x14723ebc0,2:0x14723ee60,3:0x147221848,4:0x14723edc0,5:0x14723ece8,6:0x14723ed30,7:0x14723ee10,8:0x14723ed78}
    shadow=None
    for i in range(113):
     a=0x146bf5eb0+i*120;off=p.rva_offset(a-p.image_base);txt,n=struct.unpack_from('<QQ',d,off);at=p.rva_offset(txt-p.image_base)
     if d[at:at+n]==b'shadow_bolt':shadow=a;break
    assert shadow
    for kind in range(9):
     for cooldown in [0.,.25,.5,1.,2.,-1.,float('nan')]:
      for learned,modifier in ([(None,1.),(.5,.75),(2.,1.5)]if kind==7 else [(None,1.)]):
       u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));context['modifier']=modifier
       put(game+0xd0,'<QQ',pets,1);put(pets+0x18,'<Q',ptr[kind]);put(game+0x488,'<f',cooldown)
       if learned is not None:put(game+0x330,'<QQ',mem+0x4000,1);put(mem+0x4000,'<Q',shadow);put(mem+0x4014,'<f',learned)
       sp=stack+0x18008;put(sp,'<Q',p.image_base);u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,game);u.reg_write(r.UC_X86_REG_RDX,0)
       u.emu_start(0x1459598b0,p.image_base,count=100000);assert u.reg_read(r.UC_X86_REG_RIP)==p.image_base
       bits=u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff
       cases.append(dict(kind=kind,cooldown_bits=struct.unpack('<I',struct.pack('<f',cooldown))[0],learned=learned,modifier=modifier,interval_bits=bits))
    return dict(target_sha256=SHA,shadow_bolt_base_cooldown=struct.unpack_from('<f',d,p.rva_offset(shadow-p.image_base)+0x48)[0],cases=cases)


def life_cases():
    u, mem, stack = machine()
    game,pets,actors,ids,statuses,missiles=[mem+x for x in [0,0x2000,0x10000,0x20000,0x24000,0x30000]]
    def put(a,f,*v):u.mem_write(a,struct.pack(f,*v))
    def get(a,f):return struct.unpack(f,u.mem_read(a,struct.calcsize(f)))
    context={}
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def ret():
     sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def hook(_,a,sz,extra):
     if a==0x14592fa09:u.emu_stop()
     elif a==0x145959b30:
      sp=u.reg_read(r.UC_X86_REG_RSP);context['summons'].append(dict(descriptor=hex(u.reg_read(r.UC_X86_REG_RDX)),lifetime_bits=u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff,origin=get(sp+0x28,'<Q')[0],power_bits=get(sp+0x30,'<I')[0]));ret()
     elif context.get('expiry')and a in [0x1459d5650,0x1459d5672]:context['expired']=a==0x1459d5672;u.emu_stop()
    u.hook_add(UC_HOOK_CODE,hook)
    row=mem+0x5000;deadline=mem+0x6000;counter=mem+0x7000;frame=stack+0x8000;sp=stack+0x17000
    cases=[]
    raw=talent_effect('pact_of_the_annihilan')
    for activity in [0,1]:
     for present in [0,1,2]:
      for now in [0.,22.99,23.,39.99,40.]:
       for cooldown in [.1,1.]:
        u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));context.clear();context['summons']=[]
        put(game+0x828,'<QQ',row,1);u.mem_write(row,raw);put(game+0x70,'<QQ',deadline,1);put(game+0x88,'<QQ',counter,1);put(deadline,'<f',10.);put(counter,'<I',activity);put(game+0xa4c,'<f',now);put(game+0x488,'<f',cooldown);put(game+0xd0,'<QQ',pets,present)
        for i in range(present):put(pets+i*128,'<Q',1);put(pets+i*128+0x10,'<Q',0)
        u.reg_write(r.UC_X86_REG_RSI,game);u.reg_write(r.UC_X86_REG_R13,0);u.reg_write(r.UC_X86_REG_RBP,frame);u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RDX,0x14723ed78);u.reg_write(r.UC_X86_REG_XMM3,bits(20.));u.reg_write(r.UC_X86_REG_XMM6,bits(now))
        u.emu_start(0x14592fa3e,0,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==0x14592fa09
        due=10.+max(30.*cooldown,13.)if activity else now;admitted=not(now<due)and present<=1
        assert len(context['summons'])==int(admitted),(activity,present,now,cooldown,context)
        assert get(deadline,'<I')[0]==bits(now if admitted else 10.)
        assert get(counter,'<I')[0]==activity+int(admitted)
        cases.append(dict(activity=activity,present=present,now_bits=bits(now),cooldown_bits=bits(cooldown),summons=context['summons'],timestamp_bits=get(deadline,'<I')[0],activity_after=get(counter,'<I')[0]))
    expired=[]
    for now in [9.9998,9.9999,10.,10.0001]:
     u.mem_write(mem,bytes(0x50000));context.clear();context['expiry']=True;put(row+8,'<f',10.);put(game,'<f',now);u.reg_write(r.UC_X86_REG_R15,game);u.reg_write(r.UC_X86_REG_RAX,row);u.reg_write(r.UC_X86_REG_XMM6,bits(.0001));u.emu_start(0x1459d5663,0,count=50);expired.append(dict(now_bits=bits(now),end_bits=bits(10.),expired=context['expired']))
    return dict(target_sha256=SHA,builds=cases,expiry=expired)


def gate_cases():
    u, mem, stack = machine()
    game,pets,actors,ids,statuses,missiles=[mem+x for x in [0,0x2000,0x10000,0x20000,0x24000,0x30000]]
    def put(a,f,*v):u.mem_write(a,struct.pack(f,*v))
    def get(a,f):return struct.unpack(f,u.mem_read(a,struct.calcsize(f)))
    context={};heap=mem+0x40000
    frame=stack+0x8000;sp=stack+0x17000;row=mem+0x5000;deadline=mem+0x6000;counter=mem+0x7000
    base=0x147239798
    ptrs={9512:0x14723ebc0,9518:0x14723ee60,9519:0x147221848,9520:0x14723edc0,9521:0x14723ed30,9522:0x14723ee10}
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def ret():
     ss=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(ss,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,ss+8)
    def alloc(size):
     a=context['heap'];context['heap']+=max(32,(size+15)&~15);return a
    def hook(_,a,size,extra):
     if a==0x14592fa09:u.emu_stop()
     elif a==0x140002200 or a==0x1400021d0:ret()
     elif a==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,alloc(u.reg_read(r.UC_X86_REG_RCX)));ret()
     elif a==0x145c0d930:
      out=u.reg_read(r.UC_X86_REG_RCX);cap,old,n=get(out,'<3Q');new=alloc(max(4,cap*2)*8);u.mem_write(new,bytes(u.mem_read(old,n*8)));put(out,'<3Q',max(4,cap*2),new,n);ret()
     elif a in [0x145897880,0x145896300]:ret()
     elif a==0x14592b2f0:
      out=u.reg_read(r.UC_X86_REG_RCX);put(out,'<3Q',0,ids,int(context['nearby']));put(ids,'<Q',99);ret()
     elif a==0x145959b30:
      ss=u.reg_read(r.UC_X86_REG_RSP);desc=u.reg_read(r.UC_X86_REG_RDX);entry=get(desc+0x20,'<I')[0];life=u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff;origin=get(ss+0x28,'<Q')[0]
      context['summons'].append(dict(entry=entry,lifetime_bits=life,origin=origin,rng_before=list(get(game+0x9b8,'<4Q'))));n=get(game+0xd8,'<Q')[0];at=pets+n*128;put(at,'<Q',1);put(at+0x10,'<Q',origin);put(at+0x18,'<Q',desc);put(game+0xd8,'<Q',n+1)
      # Deliberate nested creation RNG draw: proves the whole group was drawn first.
      words=list(get(game+0x9b8,'<4Q'));v=words[1]<<17;words[2]^=words[0];words[3]^=words[1];words[1]^=words[2];words[0]^=words[3];words[2]^=v;words[3]=((words[3]<<45)|(words[3]>>19))&((1<<64)-1);put(game+0x9b8,'<4Q',*(x&((1<<64)-1)for x in words));ret()
    u.hook_add(UC_HOOK_CODE,hook)
    raw=talent_effect('legion_gate');cases=[]
    for seeds in [[1,2,3,4],[0x123456789abcdef0,0x23456789abcdef01,0x3456789abcdef012,0x456789abcdef0123],[0xf000000000000001,0x8000000000000002,0x7777777777777777,0x123456789abcdef0]]:
     for supremacy in [False,True]:
      for talents in [0,1,2,3]:
       for activity,timestamp,nearby,present in [(0,0.,True,0),(0,4.,True,0),(1,4.,True,0),(2,4.,True,11),(2,4.,False,0),(2,6.,True,0)]:
        u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));context.clear();context.update(heap=heap,summons=[],nearby=nearby)
        put(game+0x828,'<QQ',row,1);u.mem_write(row,raw);put(game+0x70,'<QQ',deadline,1);put(game+0x88,'<QQ',counter,1);put(deadline,'<f',timestamp);put(counter,'<I',activity);put(game+0x488,'<f',1.);put(game+0xa4c,'<f',5.);put(game+0x9b8,'<4Q',*seeds)
        owned=[]
        if talents&1:owned.append(base+4*160)
        if talents&2:owned.append(base+5*160)
        put(game+0x1d0,'<QQ',mem+0x10000,len(owned))
        for i,talent in enumerate(owned):put(mem+0x10000+i*16,'<QB',talent,1)
        entries=[9512]*present+([9521,9522]if supremacy else[]);put(game+0xd0,'<QQ',pets,len(entries))
        for i,entry in enumerate(entries):put(pets+i*128,'<Q',1 if i<present else 0);put(pets+i*128+0x18,'<Q',ptrs[entry])
        put(frame+0x108,'<B',int(supremacy));u.reg_write(r.UC_X86_REG_RDI,frame+0x40);u.reg_write(r.UC_X86_REG_RAX,row);u.reg_write(r.UC_X86_REG_RDX,get(row+16,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSI,game);u.reg_write(r.UC_X86_REG_R13,0);u.reg_write(r.UC_X86_REG_R15,2);u.reg_write(r.UC_X86_REG_RBP,frame);u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_XMM3,bits(4.));u.reg_write(r.UC_X86_REG_XMM6,bits(5.));u.reg_write(r.UC_X86_REG_XMM8,bits(17.));u.reg_write(r.UC_X86_REG_XMM9,0);u.reg_write(r.UC_X86_REG_XMM10,bits(35.))
        u.emu_start(0x14592fbd6,0,count=100000);assert u.reg_read(r.UC_X86_REG_RIP)==0x14592fa09
        cases.append(dict(seeds=seeds,supremacy=supremacy,talents=talents,activity=activity,timestamp_bits=bits(timestamp),nearby=nearby,present=present,summons=context['summons'],deadline_bits=get(deadline,'<I')[0],activity_after=get(counter,'<I')[0],rng_after=list(get(game+0x9b8,'<4Q')),empowered=[get(pets+i*128+0x7c,'<B')[0]for i in range(len(entries))]))
    return dict(target_sha256=SHA,cases=cases)


def retain_cases():
    u, mem, stack = machine()
    game,pets,actors,ids,statuses,missiles=[mem+x for x in [0,0x2000,0x10000,0x20000,0x24000,0x30000]]
    def put(a,f,*v):u.mem_write(a,struct.pack(f,*v))
    def get(a,f):return struct.unpack(f,u.mem_read(a,struct.calcsize(f)))
    cases=[]
    for mask in range(32):
     u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));removed=[100+i for i in range(5)if mask&(1<<i)];put(game,'<3Q',5,pets,5);put(game+0x100,'<3Q',len(removed),ids,len(removed))
     for i in range(5):put(pets+i*128+0x20,'<Q',100+i);put(pets+i*128+0x70,'<Q',200+i)
     for i,id in enumerate(removed):put(ids+i*8,'<Q',id)
     sp=stack+0x18008;put(sp,'<Q',p.image_base);u.reg_write(r.UC_X86_REG_RSP,sp);u.reg_write(r.UC_X86_REG_RCX,game);u.reg_write(r.UC_X86_REG_RDX,game+0x100);u.emu_start(0x1459c4ce0,p.image_base,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==p.image_base
     n=get(game+16,'<Q')[0];kept=[get(pets+i*128+0x20,'<Q')[0]for i in range(n)];payload=[get(pets+i*128+0x70,'<Q')[0]for i in range(n)]
     assert kept==[100+i for i in range(5)if not(mask&(1<<i))];assert payload==[k+100 for k in kept]
     cases.append(dict(removed=removed,retained=kept,payload=payload))
    return dict(target_sha256=SHA,cases=cases)


def landing_cases():
    u,mem,stack=machine()
    game,pets,actors,ids,events= [mem+i for i in [0,0x2000,0x4000,0x6000,0x7000]]
    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def value(reg):return struct.unpack('<f',struct.pack('<I',u.reg_read(reg)&0xffffffff))[0]
    def ret():
     sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    context={}
    def hook(_,va,size,extra):
     if va==0x145c0a53d:
      u.reg_write(r.UC_X86_REG_XMM0,bits(math.log1p(value(r.UC_X86_REG_XMM0))));ret()
     elif va==0x14592cd30:
      out=u.reg_read(r.UC_X86_REG_RCX);put(out,'<I3f',1,12.,2.,3.);context['ground'].append(dict(range_bits=u.reg_read(r.UC_X86_REG_XMM2)&0xffffffff,radius_bits=u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff));ret()
     elif va==0x14592e380:
      origin=u.reg_read(r.UC_X86_REG_R9);context['angle_bits']=u.reg_read(r.UC_X86_REG_XMM2)&0xffffffff;tag=get(origin,'<Q')[0];context['origin']=dict(present=tag,deadline_bits=get(origin+8,'<I')[0]if tag else None,index=get(origin+16,'<Q')[0]if tag else None)
      put(game+0xd0,'<QQ',pets,1);put(pets+0x18,'<Q',u.reg_read(r.UC_X86_REG_RDX));put(pets+0x20,'<Q',444);put(pets+0x4c,'<3f',12.,2.,3.);put(pets+0x5c,'<f',0.);u.reg_write(r.UC_X86_REG_RAX,444);ret()
     elif va==0x1458ce7d0:
      context['spell']=u.reg_read(r.UC_X86_REG_R8D);u.mem_write(u.reg_read(r.UC_X86_REG_RCX),bytes(32));ret()
     elif va==0x14592b2f0:
      out=u.reg_read(r.UC_X86_REG_RCX);context['query_radius_bits']=u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff;put(out,'<3Q',0,ids,3);ret()
     elif va==0x14595c200:
      context['hits'].append(dict(target=u.reg_read(r.UC_X86_REG_R9),base_bits=u.reg_read(r.UC_X86_REG_XMM2)&0xffffffff));u.reg_write(r.UC_X86_REG_XMM0,u.reg_read(r.UC_X86_REG_XMM2));u.reg_write(r.UC_X86_REG_RAX,0);ret()
     elif va==0x14593ec90:ret()
     elif va==0x14592a820:
      effect=u.reg_read(r.UC_X86_REG_R8);context['stuns'].append(dict(target=u.reg_read(r.UC_X86_REG_RDX),tag=get(effect,'<I')[0],duration_bits=get(effect+4,'<I')[0]));ret()
     elif va==0x1400021d0:ret()
    u.hook_add(UC_HOOK_CODE,hook)
    ptr={1:0x14723ebc0,2:0x14723ee60,3:0x147221848,4:0x14723edc0,5:0x14723ece8,6:0x14723ed30,7:0x14723ee10,8:0x14723ed78}
    seeds=[[1,2,3,4],[0xdeadbeef01234567,0xfedcba9876543210,0x123456789abcdef0,0xa5a5a5a5a5a5a5a5],[0xffffffffffffffff,0xfffffffffffffffe,0x4000000000000000,0xcafe1234]]
    inputs=[dict(kind=kind,seed=seed,lifetime=lifetime,area=1.,level=7)for kind in range(1,9)for seed in seeds for lifetime in [None,15.]]
    inputs += [dict(kind=6,seed=seed,lifetime=15.,area=area,level=level)for seed in seeds for area in [.25,8.75,10.,25.]for level in [1,7,30]]
    cases=[]
    for inp in inputs:
     u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));context.clear();context.update(ground=[],hits=[],stuns=[]);put(game+0x9b8,'<4Q',*inp['seed']);put(game+0x4a8,'<f',inp['area']);put(game+0xa4c,'<f',17.25);put(game+0x484,'<f',1.7);put(game+0x4e0,'<I',inp['level']);put(game+0x568,'<QQ',actors,3);put(game+0x620,'<3Q',8,events,0)
     for i in range(3):
      put(ids+i*8,'<Q',10+i);put(actors+i*0x1d8+0xf0,'<Q',10+i);put(actors+i*0x1d8+0x18,'<q',0 if i==2 else -1);put(actors+i*0x1d8+0x1d0,'<B',int(i==1))
     sp0=stack+0x18008;put(sp0,'<Q',p.image_base);put(sp0+0x28,'<Q',5);put(sp0+0x30,'<f',1.4)
     for reg,n in [(r.UC_X86_REG_RSP,sp0),(r.UC_X86_REG_RCX,game),(r.UC_X86_REG_RDX,ptr[inp['kind']]),(r.UC_X86_REG_R8,0 if inp['lifetime']is None else 1),(r.UC_X86_REG_XMM3,bits(inp['lifetime']or 0.))]:u.reg_write(reg,n)
     u.emu_start(0x145959b30,p.image_base,count=100000);assert u.reg_read(r.UC_X86_REG_RIP)==p.image_base
     context['power_bits']=get(pets+0x70,'<I')[0];context['first_pulse_bits']=get(pets+0x78,'<I')[0];context['rng_after']=get(game+0x9b8,'<4Q');cases.append(dict(input=inp,output=dict(context)))
    return dict(target_sha256=SHA,cases=cases)


def update_cases():
    u,mem,stack=machine()

    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def bits(n):return struct.unpack('<I',struct.pack('<f',n))[0]
    cases=[]
    for kind,ptr in [(1,0x14723ebc0),(7,0x14723ee10),(8,0x14723ed78)]:
     for now in [0.,17.25]:
      for attack in [now-.1,now,now+.1,now+.5,float('nan')]:
       u.mem_write(mem,bytes(0x50000));put(mem+0xd0,'<QQ',mem+0x2000,1);put(mem+0xa4c,'<f',now);put(mem+0x2018,'<Q',ptr);put(mem+0x2060,'<2f',attack,now+.25)
       for reg,n in [(r.UC_X86_REG_RSI,mem),(r.UC_X86_REG_RBX,0),(r.UC_X86_REG_RDI,0)]:u.reg_write(reg,n)
       u.emu_start(0x145932811,0x145930449,count=100);assert u.reg_read(r.UC_X86_REG_RIP)==0x145930449
       cases.append(dict(kind=kind,now_bits=bits(now),attack_bits=bits(attack),update_bits=get(mem+0x2064,'<I')[0]))
    return dict(target_sha256=SHA,cases=cases)


def scale_cases():
    u,mem,stack=machine()

    stop={0x14592e65e,0x14592e6e6}
    def hook(_,va,size,extra):
     if va in stop:u.emu_stop()
    u.hook_add(UC_HOOK_CODE,hook)
    manifest=json.loads((KEPT / 'manifest.json').read_text());cases=[]
    for d in manifest['descriptors']:
     u.reg_write(r.UC_X86_REG_RDI,int(d['address'],16));u.emu_start(0x14592e636,0,count=40);assert u.reg_read(r.UC_X86_REG_RIP)in stop
     display=u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff
     u.reg_write(r.UC_X86_REG_XMM9,d['scale_bits']);u.emu_start(0x14592eb73,0x14592eb80,count=20);assert u.reg_read(r.UC_X86_REG_RIP)==0x14592eb80;radius=u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff
     u.reg_write(r.UC_X86_REG_XMM9,d['scale_bits']);u.emu_start(0x14592ec2a,0x14592ec33,count=20);assert u.reg_read(r.UC_X86_REG_RIP)==0x14592ec33;reach=u.reg_read(r.UC_X86_REG_XMM9)&0xffffffff
     cases.append(dict(entry=d['entry'],descriptor=d['address'],special=d['special'],display_bits=display,radius_bits=radius,reach_bits=reach))
    return dict(target_sha256=SHA,cases=cases)


def imp_selection_cases():
    u,mem,stack=machine()
    game,recent,iterator,ids,actors,dots,out=[mem+n for n in [0,0x2000,0x3000,0x4000,0x6000,0x8000,0xa000]]
    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def reset():u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));u.reg_write(r.UC_X86_REG_RSP,stack+0x17000)
    times=[[],[17.25],[16.25],[16.2501],[16.2499],[17.25]*24,[17.25]*25,[16.25,17.25,16.2499,16.2501,18.25],[17.25,16.25,17.25],[16.25]*25]
    retention=[]
    for timestamps in times:
        reset();put(game+0x148,'<2Q',recent,len(timestamps))
        for i,value in enumerate(timestamps):put(recent+i*4,'<f',value)
        u.reg_write(r.UC_X86_REG_RSI,game);u.reg_write(r.UC_X86_REG_XMM10,bits(17.25));u.emu_start(0x145930fbd,0x145931214,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==0x145931214
        n=get(game+0x150,'<Q')[0];retention.append(dict(now_bits=bits(17.25),timestamps_bits=[bits(x)for x in timestamps],retained_bits=[get(recent+i*4,'<I')[0]for i in range(n)],budget=u.reg_read(r.UC_X86_REG_R14)))
    selected=[]
    for mask in range(16):
        for budget in [0,1,2,24]:
            reset();ordered=[13,10,12,11];put(game+0x568,'<2Q',actors,4);put(iterator,'<6Q',ids,ids,4,ids+32,game+0x560,budget)
            for i,guid in enumerate(ordered):put(ids+i*8,'<Q',guid)
            for i in range(4):
                put(actors+i*0x1d8+0xf0,'<Q',10+i);put(actors+i*0x1d8+8,'<2Q',dots+i*48,1);put(dots+i*48+0x10,'<I',348 if mask & (1 << i) else 172)
            put(stack+0x17000,'<Q',p.image_base)
            for reg,value in [(r.UC_X86_REG_RCX,out),(r.UC_X86_REG_RDX,iterator)]:u.reg_write(reg,value)
            u.emu_start(0x1459ebae0,p.image_base,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==p.image_base
            n=get(out+16,'<Q')[0];selected.append(dict(mask=mask,budget=budget,ordered=ordered,selected=[get(ids+i*8,'<Q')[0]for i in range(n)],all_dot_ticks=0))
    return dict(target_sha256=SHA,cases=selected,retention=retention)

def melee_cases():
    u,mem,stack=machine()
    game,row,actors,ids,allocated,out=[mem+n for n in [0,0x2000,0x4000,0x8000,0x10000,0x20000]];frame=stack+0x8000
    case={}
    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def xmm(reg):return struct.unpack('<f',struct.pack('<I',u.reg_read(reg)&0xffffffff))[0]
    def ret():
        sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def label(ptr,length):
        if not ptr:return None
        off=p.rva_offset(ptr-p.image_base);return d[off:off+length].decode()
    def hook(_,va,size,extra):
        if va==0x140002200:ret()
        elif va==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,allocated);ret()
        elif va==0x14599cc90:put(u.reg_read(r.UC_X86_REG_RCX),'<3f',9.,3.,2.);ret()
        elif va==0x14592b2f0:
            sp=u.reg_read(r.UC_X86_REG_RSP);ex,n=get(sp+0x28,'<2Q');case['query']=dict(center=get(u.reg_read(r.UC_X86_REG_R8),'<3f'),radius_bits=u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff,excluded=[get(ex+i*8,'<Q')[0]for i in range(n)])
            for i in range(case['neighbors']):put(ids+i*8,'<Q',11+i)
            put(u.reg_read(r.UC_X86_REG_RCX),'<3Q',0,ids,case['neighbors']);ret()
        elif va==0x1459c5d50:
            dest,iterator=u.reg_read(r.UC_X86_REG_RCX),u.reg_read(r.UC_X86_REG_RDX);ptr=get(iterator+8,'<Q')[0];end=get(iterator+24,'<Q')[0];cap=get(iterator+32,'<Q')[0];n=min((end-ptr)//8,cap);rows=get(dest+8,'<Q')[0];old=get(dest+16,'<Q')[0]
            for i in range(n):put(rows+(old+i)*8,'<Q',get(ptr+i*8,'<Q')[0])
            put(dest+16,'<Q',old+n);case['append_cap']=cap;ret()
        elif va==0x145c0a53d:u.reg_write(r.UC_X86_REG_XMM0,bits(math.log1p(xmm(r.UC_X86_REG_XMM0))));ret()
        elif va==0x1458ce7d0:
            case['visuals'].append(u.reg_read(r.UC_X86_REG_R8D));u.mem_write(u.reg_read(r.UC_X86_REG_RCX),bytes(32));ret()
        elif va==0x145956d00:
            sp=u.reg_read(r.UC_X86_REG_RSP);ptr,n=u.reg_read(r.UC_X86_REG_R8),u.reg_read(r.UC_X86_REG_R9);attack=get(sp+0x28,'<Q')[0];p1,n1,p2,n2=get(attack,'<4Q');case['hit']=dict(targets=[get(ptr+i*8,'<Q')[0]for i in range(n)],multiplier_bits=get(sp+0x30,'<I')[0],echo=get(sp+0x38,'<B')[0],primary=label(p1,n1),secondary=label(p2,n2),bonus_bits=get(attack+32,'<I')[0]);u.emu_stop()
    u.hook_add(UC_HOOK_CODE,hook)
    ptrs={2:0x14723ee60,3:0x147221848,4:0x14723edc0,5:0x14723ece8,6:0x14723ed30};cases=[]
    for kind in ptrs:
        for area in [.25,1.,4.6666667,9.]:
            for neighbors in [0,1,9,14]:
                for swings in [0,1,2,0xffffffff]:
                    u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));case.clear();case.update(neighbors=neighbors,visuals=[])
                    put(game+0xd0,'<2Q',row,1);put(game+0x568,'<2Q',actors,1);put(game+0xa4c,'<f',17.25);put(game+0x4a8,'<f',area);put(game+0x620,'<3Q',8,out,0);put(actors+0xf0,'<Q',10)
                    put(frame+0x108,'<Q',ptrs[kind]);put(row+0x18,'<2Q',ptrs[kind],444);put(row+0x40,'<3f',1.,2.,3.);put(row+0x4c,'<3f',5.,6.,7.);put(row+0x58,'<2f',17.,.5);put(row+0x74,'<I',swings)
                    for reg,value in [(r.UC_X86_REG_RAX,ptrs[kind]),(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_R13,row),(r.UC_X86_REG_R12,10),(r.UC_X86_REG_RBX,0),(r.UC_X86_REG_RDI,0),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack+0x17000),(r.UC_X86_REG_XMM7,0)]:u.reg_write(reg,value)
                    try:u.emu_start(0x145930d0b,0,count=10000)
                    except Exception:
                        print('failure',kind,area,neighbors,swings,hex(u.reg_read(r.UC_X86_REG_RIP)),case);raise
                    assert u.reg_read(r.UC_X86_REG_RIP)==0x145956d00
                    cases.append(dict(kind=kind,area_bits=bits(area),neighbors=neighbors,swings_before=swings,swings_after=get(row+0x74,'<I')[0],query=case.get('query'),append_cap=case.get('append_cap'),visuals=case['visuals'],hit=case['hit']))
    echo=[]
    for mask in range(16):
        u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));ordered=[13,10,12,11,99]
        put(game+0x568,'<2Q',actors,4);put(row,'<5Q',ids,ids,5,ids+40,game+0x560)
        for i,guid in enumerate(ordered):put(ids+i*8,'<Q',guid)
        for i in range(4):put(actors+i*0x1d8+0xf0,'<Q',10+i);put(actors+i*0x1d8+0xb0,'<I',1 if mask & (1<<i) else 0)
        put(stack+0x17000,'<Q',p.image_base)
        for reg,value in [(r.UC_X86_REG_RSP,stack+0x17000),(r.UC_X86_REG_RCX,out),(r.UC_X86_REG_RDX,row)]:u.reg_write(reg,value)
        u.emu_start(0x1459ebf30,p.image_base,count=1000);assert u.reg_read(r.UC_X86_REG_RIP)==p.image_base
        n=get(out+16,'<Q')[0];echo.append(dict(dead_mask=mask,ordered=ordered,selected=[get(ids+i*8,'<Q')[0]for i in range(n)]))
    return dict(target_sha256=SHA,cases=cases,echo=echo)

def source_connections():
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/demons.rs").read_text()
    assert re.search(r"numeric\.area\s*\*\s*15\.0", source)
    assert re.search(r"let cap = if demon\.definition\.special == 5\s*\{\s*9", source)
    assert re.search(r"let center = if demon\.definition\.special == 5\s*\{\s*demon\.tick\.motion\.position_at\(now\)", source)
    assert "credit_demon_soul_shards" not in source
    assert "self.current_cooldown_multiplier()" in source.split("pub fn hud_build_timers", 1)[1].split("pub(super) fn configure_demons", 1)[0]
    config = source.split("pub(super) fn configure_demons", 1)[1].split("pub(super) fn begin_demons", 1)[0]
    assert re.search(r"demon\.config\s*=\s*config", config)
    assert "power_multiplier =" not in config


def main():
    manifest = json.loads((KEPT / "manifest.json").read_text())
    assert manifest["target_sha256"] == SHA
    for owner in manifest["owners"]:
        start, end = int(owner["start"], 16), int(owner["end_exclusive"], 16)
        offset = p.rva_offset(start - p.image_base)
        assert offset == int(owner["file_offset"], 16)
        assert hashlib.sha256(d[offset:offset + end - start]).hexdigest() == owner["sha256"], owner["role"]
        for name, digest in owner.get("text_sha256", {}).items():
            assert hashlib.sha256((KEPT / name).read_bytes()).hexdigest() == digest, name
    shared_dir = ROOT / "docs/analysis/evidence/demon-time-effects"
    shared = json.loads((shared_dir / "manifest.json").read_text())
    assert shared["target_sha256"] == SHA
    for owner in shared["ranges"]:
        start, end = int(owner["start"], 16), int(owner["end_exclusive"], 16)
        offset = p.rva_offset(start - p.image_base)
        assert hashlib.sha256(d[offset:offset + end - start]).hexdigest() == owner["sha256"]
    for name, digest in shared["text_sha256"].items():
        assert hashlib.sha256((shared_dir / name).read_bytes()).hexdigest() == digest
    for table in manifest.get("tables", []):
        offset = p.rva_offset(int(table["address"], 16) - p.image_base)
        assert hashlib.sha256(d[offset:offset + table["byte_count"]]).hexdigest() == table["sha256"]
    for descriptor in manifest["descriptors"]:
        offset = p.rva_offset(int(descriptor["address"], 16) - p.image_base)
        raw = d[offset:offset + 64]
        assert hashlib.sha256(raw).hexdigest() == descriptor["sha256"]
        assert struct.unpack_from("<I", raw, 32)[0] == descriptor["entry"]
    source_connections()
    total = 0
    for phase, producer in [("target", target_cases), ("clock", clock_cases),
                            ("lifecycle", life_cases), ("gate", gate_cases), ("retain", retain_cases), ("landing", landing_cases), ("update", update_cases), ("scale", scale_cases), ("imp-selection", imp_selection_cases), ("melee", melee_cases)]:
        expected = json.loads((KEPT / ("native-" + phase + "-cases.json")).read_text())
        actual = json.loads(json.dumps(producer()))
        for key, value in actual.items():
            assert expected[key] == value, phase + ": " + key
        count = len(expected.get("cases", expected.get("builds", []))) + len(expected.get("expiry", [])) + len(expected.get("retention", [])) + len(expected.get("echo", []))
        total += count
        print(f"{phase}: {count} current native cases")
    print(f"Verified {total} bounded native actor/lifecycle cases and 13 descriptors; no build/game")


if __name__ == "__main__":
    main()
