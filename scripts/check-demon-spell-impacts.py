#!/usr/bin/env python3
"""Replay bounded current pending Doomguard effects; no compilation or game launch."""
from script_sources import load_script
from pathlib import Path
import hashlib
import json
import math
import struct
from coverage_common import ROOT

a = load_script("demon_actors", ROOT / "scripts/check-demon-actors.py")
KEPT = ROOT / "docs/analysis/evidence/0.112.0/demon-spell-impacts"


def replay():
    u,mem,stack=a.machine();r=a.r
    game,actors,dots,effects,specs,defs,keys,ids,descriptor=[mem+n for n in [0,0x2000,0x4000,0x6000,0x8000,0xa000,0xc000,0xe000,0xf000]];frame=stack+0x8000
    context={}
    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def value(reg):return struct.unpack('<f',struct.pack('<I',u.reg_read(reg)&0xffffffff))[0]
    def ret():
     sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def hook(_,va,size,extra):
     if va==0x14593ec90:
      context['hits'].append(dict(target=u.reg_read(r.UC_X86_REG_RDX),power_bits=u.reg_read(r.UC_X86_REG_XMM2)&0xffffffff,spell=u.reg_read(r.UC_X86_REG_R9D),critical=get(u.reg_read(r.UC_X86_REG_RSP)+0x30,'<B')[0],suppress_log=get(u.reg_read(r.UC_X86_REG_RSP)+0x38,'<B')[0]))
      if u.reg_read(r.UC_X86_REG_RDX)==10 and u.reg_read(r.UC_X86_REG_R9D)==686 and context['lethal']:put(actors+0xb0,'<I',1)
      ret()
     elif va==0x145897880:
      out=u.reg_read(r.UC_X86_REG_RCX);u.mem_write(out,bytes(0x60));put(out+0x30,'<3Q',0,effects,2);ret()
     elif va in [0x14592a820,0x14594dd20,0x1400021d0]:ret()
     elif va==0x145c0a41d:u.reg_write(r.UC_X86_REG_XMM0,bits(math.floor(value(r.UC_X86_REG_XMM0)+.5)));ret()
     elif va==0x14599cec0:
      sp=u.reg_read(r.UC_X86_REG_RSP);context['dots'].append(dict(target_actor=u.reg_read(r.UC_X86_REG_RCX)-actors,spell=u.reg_read(r.UC_X86_REG_EDX),school=u.reg_read(r.UC_X86_REG_R8)&255,power_bits=u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff,duration_bits=get(sp+0x28,'<I')[0],ticks=get(sp+0x30,'<Q')[0],owner_kind=get(sp+0x40,'<Q')[0],owner=get(sp+0x48,'<Q')[0]));ret()
     elif va==0x14599cc90:put(u.reg_read(r.UC_X86_REG_RCX),'<3f',1.,2.,3.);ret()
     elif va==0x14592b2f0:
      sp=u.reg_read(r.UC_X86_REG_RSP);ex_ptr,ex_len=get(sp+0x28,'<2Q');context['excluded']=[get(ex_ptr+i*8,'<Q')[0]for i in range(ex_len)];context['radius_bits']=u.reg_read(r.UC_X86_REG_XMM3)&0xffffffff;put(ids,'<2Q',11,12);put(u.reg_read(r.UC_X86_REG_RCX),'<3Q',0,ids,2);ret()
    u.hook_add(a.UC_HOOK_CODE,hook)
    raw_night=a.talent_effect('nightfall');raw_conflag=a.talent_effect('conflagrate')
    cases=[]
    inputs=[(style,first,second,immolate,lethal,night,conflag,retained,False,bits(80.),1)
     for style,first,second in [('bolt',1,1),('cleave',0,1),('echo',0,0)]
     for immolate in [False,True]for lethal in [False,True]
     for night,conflag in [(False,False),(True,False),(False,True),(True,True)]
     for retained in [False,True]]
    inputs +=[(style,first,second,True,False,True,True,True,predead,bits(power),1)
     for style,first,second in [('bolt',1,1),('cleave',0,1),('echo',0,0)]
     for predead in [False,True]for power in [80.,0.,-4.,float('nan')]]
    inputs += [('bolt',1,1,True,False,True,True,True,False,bits(80.),kind) for kind in [0,2,3]]
    for style,first,second,immolate,lethal,night,conflag,retained,predead,power_bits,retained_kind in inputs:
     u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));context.clear();context.update(hits=[],dots=[],lethal=lethal)
     put(game+0x568,'<QQ',actors,3);put(game+0x1d0,'<QQ',specs,2);put(game+0x828,'<QQ',effects,2);u.mem_write(effects,raw_night+raw_conflag);put(game+0xa4c,'<f',17.25);put(game+0x1ad,'<B',2);put(descriptor+0x38,'<B',5)
     for i,(key,enabled)in enumerate([('nightfall',night),('conflagrate',conflag)]):
      definition=defs+i*128;keyptr=keys+i*32;u.mem_write(keyptr,key.encode());put(definition+0x30,'<QQ',keyptr,len(key));put(specs+i*16,'<QB',definition,int(enabled))
     for i in range(3):put(actors+i*0x1d8+0xf0,'<Q',10+i)
     put(actors+0xb0,'<I',int(predead))
     dot_rows=[]
     if immolate:dot_rows.append((0,0,348,0.,1))
     if retained:dot_rows.extend([(retained_kind,0,172,2.,3),(1,99,172,8.,4)])
     put(actors+8,'<QQ',dots,len(dot_rows))
     for i,(owner_kind,owner,spell,power,ticks)in enumerate(dot_rows):
      dot=dots+i*48;put(dot,'<BQ',owner_kind,owner);put(dot+8,'<Q',owner);put(dot+0x10,'<I',spell);put(dot+0x14,'<f',power);put(dot+0x20,'<I',ticks)
     put(frame+0x438,'<Q',game);put(frame+0x408,'<Q',game+0x158);put(frame+0x3e8,'<Q',game+0x1c8);put(frame+0x2f0,'<Q',game+0x480);put(frame+0x2f8,'<Q',descriptor);put(frame+0x90,'<Q',1)
     put(frame+0x278,'<Q',0);put(frame+0x300,'<I',0);put(frame+0x330,'<Q',0)
     for reg,n in [(r.UC_X86_REG_R15,game),(r.UC_X86_REG_RBP,frame),(r.UC_X86_REG_RSP,stack+0x17000),(r.UC_X86_REG_RDI,10),(r.UC_X86_REG_R9,second),(r.UC_X86_REG_R10,first),(r.UC_X86_REG_R8,444),(r.UC_X86_REG_RBX,686),(r.UC_X86_REG_RAX,0),(r.UC_X86_REG_RCX,0),(r.UC_X86_REG_RDX,0),(r.UC_X86_REG_R11,0),(r.UC_X86_REG_XMM7,power_bits),(r.UC_X86_REG_XMM10,bits(0.)),(r.UC_X86_REG_XMM11,bits(-0.)),(r.UC_X86_REG_XMM13,bits(.25))]:u.reg_write(reg,n)
     u.emu_start(0x145900a09,0x1459013e6,count=100000);assert u.reg_read(r.UC_X86_REG_RIP)==0x1459013e6
     cases.append(dict(style=style,immolate=immolate,lethal=lethal,nightfall=night,conflagrate=conflag,retained=retained,retained_kind=retained_kind,predead=predead,power_bits=power_bits,result={k:v for k,v in context.items()if k!='lethal'}))
    return dict(target_sha256=a.SHA,cases=cases)


def main():
    manifest = json.loads((KEPT / "manifest.json").read_text())
    assert manifest["target_sha256"] == a.SHA
    for owner in manifest["owners"]:
        start, end = int(owner["start"], 16), int(owner["end_exclusive"], 16)
        offset = a.p.rva_offset(start - a.p.image_base)
        assert offset == int(owner["file_offset"], 16)
        assert hashlib.sha256(a.d[offset:offset + end - start]).hexdigest() == owner["sha256"]
    for name, digest in manifest["text_sha256"].items():
        assert hashlib.sha256((KEPT / name).read_bytes()).hexdigest() == digest
    actual = replay()
    assert actual == json.loads((KEPT / "native-cases.json").read_text())
    assert len(actual["cases"]) == 123
    print("Verified 123 bounded native pending demon impact cases; no build/game")


if __name__ == "__main__":
    main()
