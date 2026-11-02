#!/usr/bin/env python3
"""Replay current Infernal/focus/Pit arithmetic without compiling or launching a game."""
from script_sources import load_script
from pathlib import Path
import hashlib
import json
import math
import struct
from coverage_common import ROOT

a = load_script("demon_actors", ROOT / "scripts/check-demon-actors.py")
KEPT = ROOT / "docs/analysis/evidence/0.112.0/demon-spell-math"


def replay():
    u,mem,stack=a.machine();r=a.r
    u.mem_write(mem,bytes(0x50000))
    game,row,effect,vector,ids,out,it,alloc=[mem+n for n in [0,0x2000,0x3000,0x4000,0x5000,0x6000,0x7000,0x10000]]
    def put(at,fmt,*values):u.mem_write(at,struct.pack(fmt,*values))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def f32(f):return struct.unpack('<f',struct.pack('<f',f))[0]
    def write_xmm(reg,f):u.reg_write(reg,bits(f))
    def reset():
     u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));u.reg_write(r.UC_X86_REG_RSP,stack+0x18008)
    def ability(key):
     for i in range(113):
      va=0x146bf5eb0+i*120;offset=a.p.rva_offset(va-a.p.image_base);ptr,n=struct.unpack_from('<QQ',a.d,offset);at=a.p.rva_offset(ptr-a.p.image_base)
      if a.d[at:at+n]==key.encode():return va
     raise AssertionError(key)
    hellfire=ability('hellfire');base=get(hellfire+0x48,'<f')[0]
    assert base==1.5
    interval=[]
    for now in [0.,17.25,1048576.]:
     for learned in [.125,.5,1.,1.75]:
      for modifier in [.2,.75,1.]:
       for global_cd in [0.,.25,.5,1.,2.,-1.,float('nan')]:
        reset();put(game+0xd0,'<Q',row);put(game+0x488,'<f',global_cd)
        for reg,value in [(r.UC_X86_REG_R15,hellfire),(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_R12,0)]:u.reg_write(reg,value)
        for reg,value in [(r.UC_X86_REG_XMM7,learned),(r.UC_X86_REG_XMM15,modifier),(r.UC_X86_REG_XMM11,1.4),(r.UC_X86_REG_XMM0,.5),(r.UC_X86_REG_XMM10,.5),(r.UC_X86_REG_XMM6,now)]:write_xmm(reg,value)
        u.emu_start(0x145930180,0x1459301cf,count=100);assert u.reg_read(r.UC_X86_REG_RIP)==0x1459301cf
        interval.append(dict(now_bits=bits(now),cooldown_bits=bits(learned),modifier_bits=bits(modifier),global_bits=bits(global_cd),deadline_bits=get(row+0x78,'<I')[0]))
    focus=[]
    for rank in [None,0,1,2,3,4,5]:
     for count in [0,1,2,3,4,5,6,12,0xfffffffe,0xffffffff]:
      for previous in [7,9]:
       for eligible in [False,True]:
        reset();put(row+0x30,'<QI',previous,count);put(game+0x828,'<QQ',effect,0 if rank is None else 1)
        if rank is not None:put(effect,'<BB',33,rank);put(effect+0x10,'<Q',0x14723ee10)
        for reg,value in [(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RAX,row),(r.UC_X86_REG_R12,7)]:u.reg_write(reg,value)
        u.emu_start(0x1459318c8 if eligible else 0x145931979,0x14593198a,count=150);assert u.reg_read(r.UC_X86_REG_RIP)==0x14593198a
        focus.append(dict(rank=rank,previous=previous,count=count,target=7,eligible=eligible,bonus_bits=u.reg_read(r.UC_X86_REG_XMM15)&0xffffffff,next_previous=u.reg_read(r.UC_X86_REG_R8),next_count=u.reg_read(r.UC_X86_REG_EDX)))
    def ret():
     sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def hook(_,va,size,extra):
     if va==0x140002200:ret()
     elif va==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,alloc);ret()
    u.hook_add(a.UC_HOOK_CODE,hook)
    pit=[]
    for length in range(1,9):
     for count in range(13):
      reset();candidates=[100+i for i in range(length)];put(vector,'<3Q',length,ids,length)
      for i,guid in enumerate(candidates):put(ids+i*8,'<Q',guid)
      put(it,'<3Q',vector,0,count);put(stack+0x18008,'<Q',a.p.image_base)
      u.reg_write(r.UC_X86_REG_RCX,out);u.reg_write(r.UC_X86_REG_RDX,it);u.emu_start(0x1459da6c0,a.p.image_base,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==a.p.image_base
      rows=get(out+16,'<Q')[0];pointer=get(out+8,'<Q')[0]
      hits=[dict(target=get(pointer+i*16,'<Q')[0],multiplier_bits=get(pointer+i*16+8,'<I')[0])for i in range(rows)]
      assert rows==count
      assert [x['target']for x in hits]==[candidates[i%length]for i in range(count)]
      assert [x['multiplier_bits']for x in hits]==[bits(1.25 if i==0 else 1.)for i in range(count)]
      pit.append(dict(candidates=candidates,count=count,hits=hits))
    result=dict(target_sha256=a.SHA,hellfire=dict(address=hex(hellfire),base_cooldown_bits=bits(base)),interval=interval,focus=focus,pit=pit)
    return result


def replay_bounce():
    u,mem,stack=a.machine();r=a.r

    game,rows,ids,alloc=[mem+n for n in [0,0x2000,0x6000,0x10000]];frame=stack+0x8000
    context={}
    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def ret():
     sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def hook(_,va,size,extra):
     if va==0x140002200:ret()
     elif va==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,alloc);ret()
     elif va==0x14592b2f0:
      sp=u.reg_read(r.UC_X86_REG_RSP);ex_ptr,ex_len=get(sp+0x28,'<2Q');context['excluded']=[get(ex_ptr+i*8,'<Q')[0]for i in range(ex_len)];context['radius_bits']=u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff;context['center']=get(u.reg_read(r.UC_X86_REG_R8),'<3f');admitted=[guid for guid in context['ordered']if guid not in context['excluded']]
      for i,guid in enumerate(admitted):put(ids+i*8,'<Q',guid)
      put(u.reg_read(r.UC_X86_REG_RCX),'<3Q',0,ids,len(admitted));ret()
    u.hook_add(a.UC_HOOK_CODE,hook)
    cases=[]
    for count in [0,1,2,4,0xffffffff]:
     for ordered in [[],[10,11,12],[12,11,14,10,13]]:
      for factor in [0.,.5,1.3]:
       for primary_power in [37.,88.8]:
        u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));context.clear();context['ordered']=ordered
        put(frame+0xc0,'<3Q',64,rows,2);put(frame+0xa8,'<3f',2.,3.,4.);put(frame+0x20,'<I',count)
        for i,guid in enumerate([10,11]):
         put(rows+i*64,'<Qf',guid,primary_power if i==0 else primary_power/1.4);put(rows+i*64+0x20,'<Q',mem+0x15000);put(rows+i*64+0x38,'<2B',1,1)
        for reg,n in [(r.UC_X86_REG_RSI,game),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack+0x17000),(r.UC_X86_REG_XMM10,bits(factor)),(r.UC_X86_REG_XMM12,bits(primary_power))]:u.reg_write(reg,n)
        u.emu_start(0x145931e14,0x145931f37,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==0x145931f37
        length=get(frame+0xd0,'<Q')[0];added=[]
        for i in range(2,length):
         entry=rows+i*64;label,n=get(entry+16,'<2Q');off=a.p.rva_offset(label-a.p.image_base);added.append(dict(target=get(entry,'<Q')[0],power_bits=get(entry+8,'<I')[0],label=a.d[off:off+n].decode(),flags=get(entry+0x38,'<2B')))
        iterator=mem+0x16000;out=mem+0x16100;sp0=stack+0x18008;put(iterator,'<4Q',rows,rows,64,rows+length*64);put(sp0,'<Q',a.p.image_base)
        for reg,n in [(r.UC_X86_REG_RSP,sp0),(r.UC_X86_REG_RCX,out),(r.UC_X86_REG_RDX,iterator)]:u.reg_write(reg,n)
        u.emu_start(0x1459eb780,a.p.image_base,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==a.p.image_base
        echoes=[]
        for i in range(get(out+16,'<Q')[0]):
         entry=rows+i*64;label,n=get(entry+16,'<2Q');off=a.p.rva_offset(label-a.p.image_base);echoes.append(dict(target=get(entry,'<Q')[0],power_bits=get(entry+8,'<I')[0],label=a.d[off:off+n].decode(),secondary=get(entry+0x20,'<Q')[0],flags=get(entry+0x38,'<2B')))
        cases.append(dict(count=count,ordered=ordered,factor_bits=bits(factor),primary_power_bits=bits(primary_power),excluded=context['excluded'],radius_bits=context['radius_bits'],center=context['center'],added=added,echoes=echoes))
    return dict(target_sha256=a.SHA,cases=cases)


def replay_additional():
    u,mem,stack=a.machine();r=a.r
    game,mods,stats,definition,followers,learned,out=[mem+n for n in [0,0x2000,0x4000,0x6000,0x7000,0x8000,0xa000]];frame=stack+0x8000
    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def reset():
        u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));u.reg_write(r.UC_X86_REG_RSP,stack+0x17000)
    imp=[]
    imp_damage=struct.unpack_from('<f',a.d,a.p.rva_offset(0x14723ebc0-a.p.image_base)+0x2c)[0]
    assert imp_damage ==22.
    modsets=[[],[(3,2,0,.25)],[(3,2,1,5.)],[(3,5,0,5.)],[(0,2,0,5.)],[(1,2,0,5.)],[(3,2,0,.1),(3,2,0,.2),(3,2,0,.3)],[(3,2,0,.5),(3,2,1,99.),(3,2,0,-.25)],[(3,2,0,-2.)],[(3,2,0,1.e20),(3,2,0,-1.e20),(3,2,0,.125)]]
    statsets=[[],[(30,.3)],[(0,99.),(30,.1),(30,.2)],[(30,-.5),(29,7.),(30,.375)]]
    for level in [0,1,17,255]:
        for global_damage in [.25,1.,2.3]:
            for modifiers in modsets:
                for statrows in statsets:
                    reset();put(game+0x810,'<2Q',mods,len(modifiers));put(game+0x7f8,'<2Q',stats,len(statrows));put(game+0x4e0,'<I',level);put(game+0x484,'<f',global_damage);put(definition+0x2c,'<f',imp_damage)
                    for i,(kind,school,lane,amount)in enumerate(modifiers):put(mods+i*32,'<2B',kind,school);put(mods+i*32+24,'<B',lane);put(mods+i*32+28,'<f',amount)
                    for i,(tag,amount)in enumerate(statrows):put(stats+i*8,'<B',tag);put(stats+i*8+4,'<f',amount)
                    u.reg_write(r.UC_X86_REG_R14,game);u.reg_write(r.UC_X86_REG_R15,definition);u.emu_start(0x14595c078,0x14595c186,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==0x14595c186
                    imp.append(dict(level=level,global_damage_bits=bits(global_damage),descriptor_damage_bits=bits(imp_damage),modifiers=[dict(kind=k,school=s,lane=l,amount_bits=bits(v))for k,s,l,v in modifiers],stats=[dict(tag=t,amount_bits=bits(v))for t,v in statrows],power_bits=u.reg_read(r.UC_X86_REG_XMM6)&0xffffffff))
    def ret():
        sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    case={}
    def hook(_,va,size,extra):
        if va in [0x145897880,0x145896300]:ret()
        elif va==0x145897ab0:put(u.reg_read(r.UC_X86_REG_RCX),'<2fI4f',1.,1.,0,case['modifier'],1.,0.,1.);ret()
        elif va==0x145c0a53d:
            value=struct.unpack('<f',struct.pack('<I',u.reg_read(r.UC_X86_REG_XMM0)&0xffffffff))[0];u.reg_write(r.UC_X86_REG_XMM0,bits(math.log1p(value)));ret()
    u.hook_add(a.UC_HOOK_CODE,hook)
    visual=[];hellfire=0x146bf8610
    for special in [None,1,5,6,7]:
        for area in [None,.5,1.,2.3]:
            for modifier in [.4,1.,1.7]:
                for global_area in [.25,1.,17.]:
                    reset();case['modifier']=modifier;put(game+0xd0,'<2Q',followers,0 if special is None else 1);put(followers+0x18,'<Q',definition);put(definition+0x39,'<B',0 if special is None else special)
                    put(learned,'<Q',hellfire);put(learned+0x1c,'<f',1. if area is None else area);put(frame+0x40,'<Q',game);put(frame+0x48,'<2Q',learned,0 if area is None else 0x58);put(frame+0x60,'<Q',0 if area is None else 1);put(frame+0x80,'<3Q',8,out,0)
                    for reg,val in [(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_XMM6,bits(global_area)),(r.UC_X86_REG_XMM10,bits(70.)),(r.UC_X86_REG_XMM9,bits(10.))]:u.reg_write(reg,val)
                    u.emu_start(0x14592a4e8,0x14592a678,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==0x14592a678
                    n=get(frame+0x90,'<Q')[0];rows=[dict(spell=get(out+i*12,'<I')[0],scale_bits=get(out+i*12+4,'<I')[0],attached=get(out+i*12+8,'<B')[0])for i in range(n)]
                    visual.append(dict(special=special,learned_area_bits=None if area is None else bits(area),modifier_area_bits=bits(modifier),global_area_bits=bits(global_area),rows=rows))
    return dict(target_sha256=a.SHA,imp=imp,visual=visual)


def main():
    manifest = json.loads((KEPT / "manifest.json").read_text())
    assert manifest["target_sha256"] == a.SHA
    for owner in manifest["owners"]:
        start, end = int(owner["start"], 16), int(owner["end_exclusive"], 16)
        offset = a.p.rva_offset(start - a.p.image_base)
        assert offset == int(owner["file_offset"], 16)
        assert hashlib.sha256(a.d[offset:offset + end - start]).hexdigest() == owner["sha256"]
        for name, digest in owner.get("text_sha256", {}).items():
            assert hashlib.sha256((KEPT / name).read_bytes()).hexdigest() == digest
    visual = manifest["visual_ghidra"]
    start, end = int(visual["start"], 16), int(visual["end_exclusive"], 16)
    offset = a.p.rva_offset(start - a.p.image_base)
    assert hashlib.sha256(a.d[offset:offset + end - start]).hexdigest() == visual["import_sha256"]
    assert hashlib.sha256((KEPT / visual["pseudocode"]).read_bytes()).hexdigest() == visual["text_sha256"]
    descriptor = manifest["imp_descriptor"]
    offset = a.p.rva_offset(int(descriptor["address"], 16) - a.p.image_base)
    assert hashlib.sha256(a.d[offset:offset + descriptor["byte_count"]]).hexdigest() == descriptor["sha256"]
    descriptor = manifest["hellfire"]
    offset = a.p.rva_offset(int(descriptor["address"], 16) - a.p.image_base)
    assert hashlib.sha256(a.d[offset:offset + descriptor["byte_count"]]).hexdigest() == descriptor["sha256"]
    expected = json.loads((KEPT / "native-vectors.json").read_text())
    actual = replay()
    for key, value in actual.items():
        assert expected[key] == value, key
    for key in ["interval", "focus", "pit"]:
        print(f"{key}: {len(actual[key])} current native cases")
    expected_bounce = json.loads((KEPT / "native-bounce-cases.json").read_text())
    actual_bounce = json.loads(json.dumps(replay_bounce()))
    for key, value in actual_bounce.items():
        assert expected_bounce[key] == value, "bounce: " + key
    print("bounce/echo: 90 current native cases")
    additional = replay_additional()
    assert additional == json.loads((KEPT / "native-additional-cases.json").read_text())
    assert len(additional["imp"]) == 480 and len(additional["visual"]) == 180
    print("Imp: 480 Fire modifier cases; Infernal visual: 180 radius cases")
    print("Verified 1386 bounded native demon spell math cases; no build/game")


if __name__ == "__main__":
    main()
