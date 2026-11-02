#!/usr/bin/env python3
"""Replay current follower movement and MonsterMove framing without compilation."""
from script_sources import load_script
from pathlib import Path
import hashlib
import json
import struct
from coverage_common import ROOT
a = load_script("actors", ROOT / "scripts/check-demon-actors.py")
KEPT = ROOT / "docs/analysis/evidence/0.112.0/demon-movement"

def replay_move():
    u,mem,stack=a.machine();r=a.r
    game,row,world,events=[mem+n for n in [0,0x2000,0x4000,0x8000]];case={}
    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def bits(f):return struct.unpack('<I',struct.pack('<f',f))[0]
    def ret():
        sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def hook(_,va,size,extra):
        if va==0x1458a0b40:
            number=len(case['primary']);case['primary'].append([u.reg_read(r.UC_X86_REG_XMM1)&0xffffffff,u.reg_read(r.UC_X86_REG_XMM2)&0xffffffff]);height=case['start_height'] if number==0 else case['destination_height'];u.reg_write(r.UC_X86_REG_RAX,int(height is not None));u.reg_write(r.UC_X86_REG_XMM0,bits(height or 0.));ret()
        elif va==0x1458a4d60:
            case['secondary_calls']+=1;out=u.reg_read(r.UC_X86_REG_RCX);height=case['secondary'];put(out,'<I',int(height is not None));put(out+12,'<f',height or 0.);ret()
        elif va==0x1458c3bf0:
            sp=u.reg_read(r.UC_X86_REG_RSP);case['packet']=dict(guid=u.reg_read(r.UC_X86_REG_RDX),start_bits=get(u.reg_read(r.UC_X86_REG_R8),'<3I'),to_bits=get(u.reg_read(r.UC_X86_REG_R9),'<3I'),serial=get(sp+0x28,'<I')[0],raw_duration_ms=get(sp+0x30,'<I')[0]);u.mem_write(u.reg_read(r.UC_X86_REG_RCX),bytes(32));ret()
    u.hook_add(a.UC_HOOK_CODE,hook);cases=[]
    for moving in [False,True]:
        for distance in [0.,.2999,.3,.3001,5.]:
            for start_height in [None,12.]:
                for destination_height,secondary,available in [(20.,None,False),(None,30.,True),(None,None,True),(None,None,False)]:
                    for speed in [1.,7.,1000.]:
                        for serial in [0,0xffffffff]:
                            u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));case.clear();case.update(primary=[],secondary_calls=0,start_height=start_height,destination_height=destination_height,secondary=secondary)
                            put(game+0xd0,'<2Q',row,1);put(game+0x9b0,'<Q',world);put(game+0xa4c,'<f',17.25);put(game+0xa7c,'<I',serial);put(game+0x620,'<3Q',8,events,0);put(world+0x68,'<q',0 if available else -1);put(world+0xb8,'<f',40.)
                            put(row+0x20,'<Q',444);put(row+0x40,'<3f',-1.,-2.,-3.);put(row+0x4c,'<3f',3.,6.,9.);put(row+0x58,'<2f',17.,1. if moving else 0.)
                            current=[0.,0.,0.] if moving else [3.,6.,9.];dest=[current[0]+distance,current[1]];sp0=stack+0x18008;put(sp0,'<Q',a.p.image_base);put(sp0+0x28,'<f',speed)
                            for reg,value in [(r.UC_X86_REG_RSP,sp0),(r.UC_X86_REG_RCX,game),(r.UC_X86_REG_RDX,0),(r.UC_X86_REG_XMM2,bits(dest[0])),(r.UC_X86_REG_XMM3,bits(dest[1]))]:u.reg_write(reg,value)
                            u.emu_start(0x145939bf0,a.p.image_base,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==a.p.image_base
                            cases.append(dict(moving=moving,distance_bits=bits(distance),speed_bits=bits(speed),serial_before=serial,start_height_bits=None if start_height is None else bits(start_height),destination_height_bits=None if destination_height is None else bits(destination_height),secondary_bits=None if secondary is None else bits(secondary),secondary_available=available,primary_queries=case['primary'],secondary_calls=case['secondary_calls'],serial_after=get(game+0xa7c,'<I')[0],events=get(game+0x630,'<Q')[0],state_bits=get(row+0x40,'<8I'),packet=case.get('packet')))
    return dict(target_sha256=a.SHA,cases=cases)

def replay_packet():
    u,mem,stack=a.machine();r=a.r
    out,start,to,heap=[mem+n for n in [0,0x1000,0x2000,0x10000]]
    def put(at,fmt,*v):u.mem_write(at,struct.pack(fmt,*v))
    def get(at,fmt):return struct.unpack(fmt,u.mem_read(at,struct.calcsize(fmt)))
    def ret():
        sp=u.reg_read(r.UC_X86_REG_RSP);u.reg_write(r.UC_X86_REG_RIP,get(sp,'<Q')[0]);u.reg_write(r.UC_X86_REG_RSP,sp+8)
    def hook(_,va,size,extra):
        if va==0x140002200:ret()
        elif va==0x1400021c0:u.reg_write(r.UC_X86_REG_RAX,heap);ret()
        elif va==0x145c0d470:put(u.reg_read(r.UC_X86_REG_RCX),'<Q',128);ret()
        elif va==0x1458d0340:
            guid=u.reg_read(r.UC_X86_REG_RCX);vec=u.reg_read(r.UC_X86_REG_RDX);packed=bytes([(sum(1<<i for i in range(8)if guid>>(i*8)&255))])+bytes(guid>>(i*8)&255 for i in range(8)if guid>>(i*8)&255);ptr,n=get(vec+8,'<2Q');u.mem_write(ptr+n,packed);put(vec+16,'<Q',n+len(packed));ret()
        elif va==0x1458ae4b0:
            dest,vec,position=u.reg_read(r.UC_X86_REG_RCX),u.reg_read(r.UC_X86_REG_RDX),u.reg_read(r.UC_X86_REG_R8);u.mem_write(dest,bytes(u.mem_read(vec,32)));ptr,n=get(dest+8,'<2Q');u.mem_write(ptr+n,bytes(u.mem_read(position,12)));put(dest+16,'<Q',n+12);ret()
    u.hook_add(a.UC_HOOK_CODE,hook);cases=[]
    for guid in [444,0xf130000000abcdef]:
        for serial in [0,0xffffffff]:
            for duration in [0,1,2,0xffffff00,0xffffffff]:
                u.mem_write(mem,bytes(0x50000));u.mem_write(stack,bytes(0x20000));put(start,'<3f',1.,2.,3.);put(to,'<3f',-4.,5.,6.);sp0=stack+0x18008;put(sp0,'<Q',a.p.image_base);put(sp0+0x28,'<I',serial);put(sp0+0x30,'<I',duration)
                for reg,value in [(r.UC_X86_REG_RSP,sp0),(r.UC_X86_REG_RCX,out),(r.UC_X86_REG_RDX,guid),(r.UC_X86_REG_R8,start),(r.UC_X86_REG_R9,to)]:u.reg_write(reg,value)
                u.emu_start(0x1458c3bf0,a.p.image_base,count=10000);assert u.reg_read(r.UC_X86_REG_RIP)==a.p.image_base
                ptr,n=get(out+8,'<2Q');raw=bytes(u.mem_read(ptr,n));mask=raw[0];pos=1+mask.bit_count();point=struct.unpack_from('<3f',raw,pos);pos+=12;actual_serial=struct.unpack_from('<I',raw,pos)[0];pos+=4;facing=raw[pos];pos+=1;flags,actual_duration,points=struct.unpack_from('<3I',raw,pos);pos+=12;dest=struct.unpack_from('<3f',raw,pos)
                cases.append(dict(guid=guid,serial=serial,duration=duration,opcode=get(out+24,'<H')[0],raw=raw.hex(),start=point,to=dest,decoded_serial=actual_serial,facing=facing,flags=flags,decoded_duration=actual_duration,points=points))
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
    result = json.loads(json.dumps(dict(move=replay_move(), packet=replay_packet())))
    assert result == json.loads((KEPT / "native-cases.json").read_text())
    for row in result["packet"]["cases"]:
        assert row["opcode"] == 0xdd and row["flags"] == 0x100
        assert row["facing"] == 0 and row["points"] == 1
        assert row["decoded_duration"] == max(row["duration"], 1)
        assert row["serial"] == row["decoded_serial"]
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/client/events.rs").read_text()
    assert "((duration*1000.) as u32).max(1)" in source
    assert "packets.0.push(pet_move(guid,start,to,duration,serial))" in source
    print("Verified 480 current follower movement cases and20 packet cases; no build/game")


if __name__ == "__main__":
    main()
