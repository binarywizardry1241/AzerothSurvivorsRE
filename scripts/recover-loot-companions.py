#!/usr/bin/env python3
"""Check/replay selected companion contracts; no compilation or game execution."""
from portable_paths import objdump_output, portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT=Path(__file__).resolve().parents[1]
TARGET=ROOT/"AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA="8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK=ROOT/"runtime/analysis/history/findings/fixgap20-26-27/f1152a393fb1/companions-curated"
RETAINED=ROOT/"docs/analysis/evidence/0.105.0/companions"
RANGES={"select":(0x14592F7A0,0x14592FD7C),"movement":(0x14592F1A0,0x14592F49A),
        "sweep-filter":(0x1459A3E50,0x1459A40AE),
        "sweep":(0x14592F560,0x14592F73B),"startup":(0x145918950,0x14591983C),
        "collection-tick":(0x14590CBBE,0x14590D698)}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check",action="store_true")
    args=parser.parse_args()
    sys.path.insert(0,str(ROOT/"runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    from unicorn import x86_const as x
    data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
    module = load_script("pe", ROOT/"scripts/inventory-executable.py");pe=module.PE(data)
    def raw(a,n):
        at=pe.rva_offset(a-pe.image_base);assert at is not None
        return data[at:at+n]
    def string(a):
        pointer,size=struct.unpack("<QQ",raw(a,16));return raw(pointer,size).decode() if pointer else None
    looks=[]
    asset=json.loads((ROOT/"crates/azeroth-survivors-re/assets/progression.json").read_text())
    for i in range(13):
        at=0x1471B49F8+i*96
        model,scale,entry=struct.unpack("<IfI",raw(at+80,12))
        row=dict(key=string(at),name=string(at+16),achievement=string(at+64),display_id=model,scale=scale,creature_id=entry)
        actual=next(r for r in asset["companions"] if r["key"]==row["key"])
        assert all(actual[k]==v for k,v in row.items()),row
        looks.append(row)
    assert looks[-1]["key"]=="sapphiron" and looks[-1]["creature_id"]==9613
    instincts=[(string(0x146BC0D58+i*24),raw(0x146BC0D58+i*24+16,1)[0]) for i in range(3)]
    assert instincts==[("instinct_gold",1),("instinct_wisps",2),("instinct_runes",3)]
    constants={hex(a):list(struct.unpack("<"+"f"*(n//4),raw(a,n))) for a,n in [
        (0x145D6D320,4),(0x145D6D510,4),(0x145D73D44,4),(0x145D9AECC,4),
        (0x145DBF580,4),(0x14609DD44,4),(0x146E78490,8),(0x146E78480,16),
        (0x145D9DE68,4),(0x145D6D878,4),(0x146E78464,4),(0x145D9AF14,4),(0x145DB8620,4)]}
    u=Uc(UC_ARCH_X86,UC_MODE_64)
    end=max(s["rva"]+max(s["raw_size"],s["virtual_size"])for s in pe.sections)
    u.mem_map(pe.image_base,(end+4095)&~4095)
    for s in pe.sections:u.mem_write(pe.image_base+s["rva"],data[s["raw_offset"]:s["raw_offset"]+s["raw_size"]])
    BASE=0x20000000;STOP=BASE+0x1F000;GAME=BASE+0x1000;ACTOR=BASE+0x3000;PICKUPS=BASE+0x5000;RESERVED=BASE+0x8000;SP=BASE+0x1E008
    u.mem_map(BASE,0x20000)
    reserved=[];active=RANGES["select"]
    def q(a):return struct.unpack("<Q",u.mem_read(a,8))[0]
    def put(a,fmt,*v):u.mem_write(a,struct.pack(fmt,*v))
    def reg(name,value):u.reg_write(getattr(x,"UC_X86_REG_"+name),value)
    def hook(_,a,n,unused):
        if a==STOP:u.emu_stop();return
        if active[0]<=a and a+n<=active[1]:
            assert bytes(u.mem_read(a,n))==raw(a,n),hex(a)
            return
        if a==0x1459A3C60:
            # Declared seam: ordered active reservations, not a claim to have
            # replayed this allocator-backed collector or its source adapter.
            out=u.reg_read(x.UC_X86_REG_RCX)
            put(out,"<QQQ",len(reserved),RESERVED,len(reserved))
            for i,guid in enumerate(reserved):put(RESERVED+i*8,"<Q",guid)
        elif a==0x1400021D0:
            assert u.reg_read(x.UC_X86_REG_RCX)==RESERVED
        elif a==0x140002200 and active==RANGES["sweep-filter"]:pass
        elif a==0x1400021C0 and active==RANGES["sweep-filter"]:
            assert u.reg_read(x.UC_X86_REG_RCX)==32 and u.reg_read(x.UC_X86_REG_RDX)==8
            reg("RAX",BASE+0x18000)
        else:raise RuntimeError("Unexpected native call "+hex(a))
        sp=u.reg_read(x.UC_X86_REG_RSP);reg("RIP",q(sp));reg("RSP",sp+8)
    u.hook_add(UC_HOOK_CODE,hook)
    def pickup(guid,kind,px,py=0.,idle=True):return dict(guid=guid,kind=kind,position=[px,py,0.],idle=idle)
    scenarios=[
        ("empty",[],0,[],[0.,0.,0.],9.,0,None),
        ("inside_hero_radius",[pickup(1,0,9.)],0,[],[0.,0.,0.],9.,0,None),
        ("outer_edge",[pickup(1,0,34.)],0,[],[0.,0.,0.],9.,0,1),
        ("outside_edge",[pickup(1,0,34.1)],0,[],[0.,0.,0.],9.,0,None),
        ("leash",[pickup(1,0,64.)],0,[],[0.,0.,0.],9.,3,1),
        ("reserved",[pickup(1,0,15.),pickup(2,1,17.)],0,[1],[0.,0.,0.],9.,0,2),
        ("in_flight",[pickup(1,0,15.,idle=False),pickup(2,1,17.)],0,[],[0.,0.,0.],9.,0,2),
        ("current_position",[pickup(1,0,10.),pickup(2,0,30.)],0,[],[28.,0.,0.],9.,0,2),
        ("equal_distance_first",[pickup(1,0,20.,1.),pickup(2,0,20.,-1.)],0,[],[0.,0.,0.],9.,0,1),
    ]
    for instinct in range(4):
        scenarios.append((f"priority_{instinct}",[pickup(1,0,11.),pickup(2,1,18.),pickup(3,3,20.),pickup(4,2,10.),pickup(5,6,10.)],instinct,[],[0.,0.,0.],9.,0,{0:1,1:2,2:1,3:3}[instinct]))
    for kind in range(7):scenarios.append((f"runehound_kind_{kind}",[pickup(1,kind,12.)],3,[],[0.,0.,0.],9.,0,1 if kind in [0,1,3,4,5]else None))
    cases=[]
    for name,rows,instinct,reserved,position,radius,leash,expected in scenarios:
        u.mem_write(BASE,bytes(0x20000));put(GAME+0x8F8,"<QQ",ACTOR,1);put(GAME+0x5C0,"<QQ",PICKUPS,len(rows))
        put(GAME+0x4C8,"<ff",0.,0.);put(GAME+0x490,"<f",radius);put(GAME+0x28C,"<B",leash)
        put(ACTOR+0x4C,"<fff",*position);put(ACTOR+0x30,"<B",instinct)
        for i,row in enumerate(rows):
            a=PICKUPS+i*0x48;put(a+0x18,"<I",0 if row["idle"]else 1);put(a+0x20,"<I",row["kind"]);put(a+0x28,"<Q",row["guid"]);put(a+0x34,"<fff",*row["position"])
        put(SP,"<Q",STOP);reg("RSP",SP);reg("RCX",GAME);reg("RDX",0)
        u.emu_start(active[0],STOP,count=100000)
        actual=u.reg_read(x.UC_X86_REG_RDX) if u.reg_read(x.UC_X86_REG_RAX)==1 else None
        assert actual==expected,(name,actual,expected)
        cases.append(dict(name=name,pickups=rows,instinct=instinct,reserved=reserved,from_position=position,radius=radius,leash=leash,selected=actual))
    speed_cases=[]
    for paws in range(4):
        for hero in [0.75,1.,1.1,1.23,1.7,2.2]:
            u.mem_write(BASE,bytes(0x20000));put(GAME+0x28D,"<B",paws);put(GAME+0x48C,"<f",hero);reg("RCX",GAME)
            active=(0x14590CBBE,0x14590CBF8);u.emu_start(*active,count=1000)
            bits=u.reg_read(x.UC_X86_REG_XMM1)&0xffffffff
            speed_cases.append(dict(paws=paws,hero=hero,speed_bits=bits))
    angle_cases=[]
    for slot in range(2):
        u.mem_write(BASE,bytes(0x20000));reg("RDI",slot);reg("RDX",ACTOR);reg("RBP",GAME)
        reg("XMM10",int.from_bytes(raw(0x146E78464,4),"little"));reg("XMM11",int.from_bytes(raw(0x145D9AF14,4),"little"))
        active=(0x145918950,0x1459189A6);u.emu_start(*active,count=1000)
        angle_cases.append(dict(slot=slot,angle_bits=u.reg_read(x.UC_X86_REG_XMM15)&0xffffffff))
    sweep_cases=[]
    OUT,CAP=BASE+0x9000,BASE+0xA000
    for instinct in range(4):
        for kind in range(7):
            for distance in [4.,4.1,8.]:
                u.mem_write(BASE,bytes(0x20000));put(PICKUPS+0x20,"<I",kind);put(PICKUPS+0x28,"<Q",7)
                put(PICKUPS+0x34,"<fff",distance,0.,0.);put(CAP+0x100,"<B",instinct);put(CAP+0x104,"<f",4.)
                put(CAP,"<QQQQQQ",PICKUPS,PICKUPS+0x48,CAP+0x100,CAP+0x100,CAP+0x110,CAP+0x104)
                put(SP,"<Q",STOP);reg("RSP",SP);reg("RCX",OUT);reg("RDX",CAP)
                active=RANGES["sweep-filter"];u.emu_start(active[0],STOP,count=10000)
                count=q(OUT+16);assert count in [0,1]
                accepted=count==1
                expected=(kind in [0,1] or (instinct==3 and kind in [3,4,5])) and distance<=(8. if kind==0 and instinct==2 else 4.)
                assert accepted==expected,(instinct,kind,distance)
                if accepted:assert q(q(OUT+8))==7
                sweep_cases.append(dict(instinct=instinct,kind=kind,distance=distance,accepted=accepted))
    result=dict(target_sha256=SHA,looks=looks,instincts=instincts,constants=constants,selection_cases=cases,
                speed_cases=speed_cases,angle_cases=angle_cases,
                sweep_cases=sweep_cases,
                ranges=[dict(role=role,address=hex(a),end_exclusive=hex(b),file_offset=hex(pe.rva_offset(a-pe.image_base)),sha256=hashlib.sha256(raw(a,b-a)).hexdigest())for role,(a,b)in RANGES.items()],
                limits=["Unmodified native selector/filter with synthetic pickup/companion memory. Active reservation collection, deallocation and a bounded32-byte filter-output allocation are explicit external seams. Startup, movement and collection state paths are statically recovered, not original-game runtime observations."])
    output=RETAINED if args.check else WORK;output.mkdir(parents=True,exist_ok=True)
    if args.check:assert portable_record(json.loads((output/"native-vectors.json").read_text()))==portable_record(json.loads(json.dumps(result)))
    else:
        (output/"native-vectors.json").write_text(portable_json(result,indent=2)+"\n")
    for role,(a,b) in RANGES.items():
        text=objdump_output(["objdump","-d","--no-show-raw-insn",f"--start-address={a:#x}",f"--stop-address={b:#x}",str(TARGET)],text=True).replace(str(TARGET),TARGET.name)
        path=output/(role+".asm")
        if args.check:assert path.read_text()==text,role
        else:path.write_text(text)
    print(f"Passed {len(cases)} native selection, {len(sweep_cases)} sweep, {len(speed_cases)} speed and {len(angle_cases)} angle cases; verified13 live look descriptors, instinct ordering and constants")


if __name__=="__main__":main()
