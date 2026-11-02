#!/usr/bin/env python3
"""Recover hash-bound 0.97.2 mob loot data and bounded native test fixtures.

The EXE/process is never launched. Unicorn executes only the specified original
native instruction spans. Allocation, Vec growth, floorf, terrain and pickup
delivery are explicit harness ports; all other code addresses are denied.
Ordinary source builds/tests use the emitted text and do not need the EXE.
"""
from script_sources import load_script
from pathlib import Path
import hashlib
import json
import math
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
OWNERS = [(0x1454589F0, 0x145458D9E), (0x14552CB40, 0x14552CF78),
          (0x1455287E0, 0x145528A46), (0x145451160, 0x1454511C8),
          (0x1454F9A40, 0x1454F9ADA), (0x1454C47CB, 0x1454C4D46)]


def main():
    data = TARGET.read_bytes()
    if hashlib.sha256(data).hexdigest() != SHA:
        raise SystemExit("Wrong 0.97.2 target hash")
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)

    def read(va, size):
        offset = pe.rva_offset(va - pe.image_base)
        raw = data[offset:offset + size]
        assert len(raw) == size
        return raw

    def span(va, size):
        raw = read(va, size)
        return dict(va=hex(va), file_offset=hex(pe.rva_offset(va-pe.image_base)),
                    size=size, sha256=hashlib.sha256(raw).hexdigest(), hex=raw.hex())

    def qword(va):
        return struct.unpack("<Q", read(va, 8))[0]

    def string(va):
        ptr, size = struct.unpack("<QQ", read(va, 16))
        assert 0 < size < 1000
        return read(ptr, size).decode()

    def bits(va):
        return struct.unpack("<I", read(va, 4))[0]

    tiers = struct.unpack("<12Q", read(0x146985910, 96))
    probabilities = struct.unpack("<6f", read(0x146986238, 24))
    zones = []
    for i in range(12):
        va = 0x146716438+i*240
        ptr, count = struct.unpack("<QQ", read(va+0x88,16))
        assert count == 5
        bosses = [dict(name=string(ptr+j*88), final_flag=read(ptr+j*88+0x54,1)[0],
                       native=span(ptr+j*88,88)) for j in range(count)]
        assert [boss["final_flag"] for boss in bosses] == [0,0,0,0,1]
        zones.append(dict(key=string(va+8), tier=tiers[i],
                          base_chance=probabilities[tiers[i]], bosses=bosses))
    classes = []
    for i in range(11):
        if 0x5df >> i & 1:
            ptr = qword(0x14698B3A8+i*8)
            classes.append(dict(class_id=i+1, weapon_count=qword(ptr+0x80),
                                count_span=span(ptr+0x80,8)))
    generated = ["//! Generated from hash-verified 0.97.2; see recover-mob-loot.py.",
                 "use super::{BossDefinition, BossZone};", "pub const BOSS_ZONES: [BossZone; 12] = ["]
    for zone in zones:
        probability_bits = struct.unpack("<I",struct.pack("<f",zone["base_chance"]))[0]
        generated += ["    BossZone {", "        key: %s," % json.dumps(zone["key"]),
                      "        tier: %d," % zone["tier"],
                      "        base_drop_chance: f32::from_bits(%s)," % hex(probability_bits),
                      "        bosses: ["]
        for boss in zone["bosses"]:
            generated.append("            BossDefinition { name: %s, final_flag: %d }," %
                             (json.dumps(boss["name"]), boss["final_flag"]))
        generated += ["        ],", "    },"]
    generated += ["];"]
    (ROOT/"crates/azeroth-survivors-re/src/mob_loot_catalog.rs").write_text("\n".join(generated)+"\n")

    sys.path.insert(0,str(ROOT/"runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RAX,UC_X86_REG_RCX,UC_X86_REG_RDX,
        UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_RSI,UC_X86_REG_RSP,UC_X86_REG_RBP,
        UC_X86_REG_RIP,UC_X86_REG_XMM0,UC_X86_REG_MXCSR)
    uc=Uc(UC_ARCH_X86,UC_MODE_64)
    image_size=max(s["rva"]+max(s["virtual_size"],s["raw_size"]) for s in pe.sections)
    uc.mem_map(pe.image_base,(image_size+4095)&~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base+section["rva"],data[section["raw_offset"]:section["raw_offset"]+section["raw_size"]])
    MEM,STACK,STOP=0x200000000,0x300000000,0x400000000
    uc.mem_map(MEM,0x100000)
    uc.mem_map(STACK,0x10000)
    uc.mem_map(STOP,4096)
    heap=MEM+0x10000
    pickups=[]
    selected_zone=0
    equipment_mode=False

    def reg(register):
        return uc.reg_read(register)

    def loadq(va):
        return struct.unpack("<Q",uc.mem_read(va,8))[0]

    def ret():
        rsp=reg(UC_X86_REG_RSP)
        uc.reg_write(UC_X86_REG_RIP,loadq(rsp))
        uc.reg_write(UC_X86_REG_RSP,rsp+8)

    def allocate(size):
        nonlocal heap
        result=heap
        heap+=(size+15)&~15
        assert heap < MEM+0x100000
        return result

    def hook(_,address,size,__):
        if address in (STOP,0x1454C4D46) or (equipment_mode and address==0x1454C4AC3):
            uc.emu_stop()
        elif address in (0x140002200,0x1400021D0):
            ret() # allocator initialization/deallocation ports, no OS access
        elif address==0x1400021C0:
            uc.reg_write(UC_X86_REG_RAX,allocate(reg(UC_X86_REG_RCX)))
            ret()
        elif address==0x145757D40:
            vector=reg(UC_X86_REG_RCX)
            capacity,old_ptr,length=struct.unpack("<3Q",uc.mem_read(vector,24))
            requested=reg(UC_X86_REG_RDX)+reg(UC_X86_REG_R8)
            stride=loadq(reg(UC_X86_REG_RSP)+0x28)
            new_capacity=max(capacity*2,requested,4)
            new_ptr=allocate(new_capacity*stride)
            uc.mem_write(new_ptr,bytes(uc.mem_read(old_ptr,length*stride)))
            uc.mem_write(vector,struct.pack("<2Q",new_capacity,new_ptr))
            ret()
        elif address==0x145756E25:
            raw=reg(UC_X86_REG_XMM0)&0xffffffff
            value=struct.unpack("<f",struct.pack("<I",raw))[0]
            result=float(math.floor(value)) if math.isfinite(value) else value
            uc.reg_write(UC_X86_REG_XMM0,struct.unpack("<I",struct.pack("<f",result))[0])
            ret()
        elif address==0x1454C8110:
            kind=reg(UC_X86_REG_RDX)&0xffffffff
            xyz=struct.unpack("<3I",uc.mem_read(reg(UC_X86_REG_R9),12))
            amount=reg(UC_X86_REG_R8)&0xffffffff if kind!=2 else None
            pickups.append(dict(kind=kind,amount=amount,position_bits=list(xyz)))
            ret()
        elif address==0x1454606B0:
            uc.reg_write(UC_X86_REG_XMM0,struct.unpack("<I",struct.pack("<f",7.25))[0])
            ret()
        elif address==0x14540E820:
            uc.reg_write(UC_X86_REG_RAX,selected_zone) # the supplied native zone key's index
            ret()
        elif address==0x1454D2380:
            ret() # post-roll UI/state owner; outside the equipment queue operation
        elif not any(start<=address<end for start,end in OWNERS):
            raise RuntimeError("Denied out-of-scope instruction "+hex(address))
    uc.hook_add(UC_HOOK_CODE,hook)

    def reset():
        nonlocal heap
        heap=MEM+0x10000
        uc.mem_write(MEM,b"\0"*0x10000)
        uc.mem_write(STACK,b"\0"*0x10000)
        uc.reg_write(UC_X86_REG_RSP,STACK+0xF008)
        uc.mem_write(STACK+0xF008,struct.pack("<Q",STOP))
        uc.reg_write(UC_X86_REG_MXCSR,0x1f80)

    boss_cases=[]
    for class_id in [1,2,3,4,5,6,7,8,9,10,11,0,255]:
        for zone in range(12):
            for boss in range(5):
                reset()
                uc.reg_write(UC_X86_REG_RCX,MEM)
                uc.reg_write(UC_X86_REG_RDX,class_id)
                uc.reg_write(UC_X86_REG_R8,zone)
                uc.reg_write(UC_X86_REG_R9,boss)
                uc.emu_start(0x1454589F0,0,count=100000)
                assert reg(UC_X86_REG_RIP)==STOP
                capacity,ptr,count=struct.unpack("<3Q",uc.mem_read(MEM,24))
                candidates=[dict(item_id=struct.unpack("<I",uc.mem_read(ptr+i*8,4))[0],
                                 chance_bits=struct.unpack("<I",uc.mem_read(ptr+i*8+4,4))[0]) for i in range(count)]
                boss_cases.append(dict(class_id=class_id,zone=zone,boss=boss,candidates=candidates))
    multipliers=[]
    for options in ([100,100,100,100],[75,100,100,100],[165,125,150,125],
                    [0,0,0,0],[65535,65535,65535,65535],[100,100,100,90],
                    [123,234,345,113],[100,100,100,150]):
        reset()
        uc.mem_write(MEM,struct.pack("<4H",*options))
        uc.reg_write(UC_X86_REG_RCX,MEM)
        uc.emu_start(0x145451160,0,count=1000)
        assert reg(UC_X86_REG_RIP)==STOP
        multipliers.append(dict(options=options,result_bits=reg(UC_X86_REG_XMM0)&0xffffffff))

    death_cases=[]
    for flag in [0,1,2]:
        for density in [0,75,100,125,165,250,65535]:
            for experience in [0,1,3,28]:
                for seed in ([1,2,3,4],[0,0,0,0],
                             [0x8123456789abcdef,0xdeadbeef11223344,0x1029384756abcdef,0x98abcdef01234567]):
                    reset()
                    pickups.clear()
                    game,definition=MEM,MEM+0x2000
                    rbp=STACK+0x8000
                    uc.reg_write(UC_X86_REG_RBP,rbp)
                    uc.reg_write(UC_X86_REG_RSI,game)
                    uc.mem_write(rbp+0xb0,struct.pack("<Q",definition))
                    uc.mem_write(rbp+0x158,struct.pack("<3f",10,20,3))
                    uc.mem_write(game+0x230,struct.pack("<H",density))
                    uc.mem_write(game+0x880,struct.pack("<4Q",*seed))
                    uc.mem_write(game+0x910,struct.pack("<f",2.5))
                    uc.mem_write(definition+0x40,struct.pack("<If4xB",experience,1.5,flag))
                    uc.emu_start(0x1454C487E,0,count=10000)
                    assert reg(UC_X86_REG_RIP)==0x1454C4D46
                    death_cases.append(dict(flag=flag,density=density,experience=experience,
                        seed=[str(v) for v in seed],rng_after=[str(v) for v in struct.unpack("<4Q",uc.mem_read(game+0x880,32))],
                        accumulator_bits=struct.unpack("<I",uc.mem_read(game+0x910,4))[0],pickups=list(pickups)))
    equipment_mode=True
    equipment_cases=[]
    for selected_zone in range(12):
        native_bosses=qword(0x146716438+selected_zone*240+0x88)
        for boss in range(5):
            for class_id in [1,4,7]:
                for seed in ([1,2,3,4],[0,0,0,0],
                             [0x8123456789abcdef,0xdeadbeef11223344,0x1029384756abcdef,0x98abcdef01234567]):
                    for extra,additive,options in [(False,0.,[100]*4),(False,0.1,[165,125,150,125]),
                                                   (False,0.,[0]*4),(True,1.,[100]*4)]:
                        reset()
                        game=MEM
                        rbp=STACK+0x8000
                        uc.reg_write(UC_X86_REG_RBP,rbp)
                        uc.reg_write(UC_X86_REG_RSI,game)
                        uc.mem_write(rbp+0x150,struct.pack("<Q",native_bosses+boss*88))
                        uc.mem_write(game+0x208,struct.pack("<f",additive))
                        uc.mem_write(game+0x230,struct.pack("<4H",*options))
                        uc.mem_write(game+0x284,bytes([class_id]))
                        uc.mem_write(game+0x598,struct.pack("<3Q",64,MEM+0x3000,0))
                        uc.mem_write(game+0x880,struct.pack("<4Q",*seed))
                        uc.mem_write(game+0x958,bytes([int(extra)]))
                        uc.emu_start(0x1454C47CB,0,count=100000)
                        assert reg(UC_X86_REG_RIP)==0x1454C4AC3
                        count=loadq(game+0x5a8)
                        queued=list(struct.unpack("<"+"I"*count,uc.mem_read(MEM+0x3000,count*4)))
                        equipment_cases.append(dict(class_id=class_id,zone=selected_zone,boss=boss,
                            seed=[str(v) for v in seed],extra=extra,additive_bits=struct.unpack("<I",struct.pack("<f",additive))[0],
                            options=options,queued=queued,
                            rng_after=[str(v) for v in struct.unpack("<4Q",uc.mem_read(game+0x880,32))]))
    fixture=dict(version="0.97.2",sha256=SHA,
        method="Bounded unchanged native instructions in Unicorn; no game process or OS calls.",
        harness_ports=["heap allocation/deallocation", "Vec capacity growth", "floorf import",
                       "shared pickup creation recorded", "resolved terrain height fixed at 7.25",
                       "zone key index supplied", "post-equipment-roll UI owner omitted"],
        instruction_spans=[span(start,end-start) for start,end in OWNERS],
        boss_cases=boss_cases,multiplier_cases=multipliers,death_cases=death_cases,equipment_cases=equipment_cases)
    fixture_path=ROOT/"crates/azeroth-survivors-re/tests/fixtures/mob-loot-0.97.2-native.json"
    fixture_path.parent.mkdir(parents=True,exist_ok=True)
    fixture_path.write_text(json.dumps(fixture,indent=2)+"\n")
    evidence=dict(version="0.97.2",target_sha256=SHA,target_executed=False,
        method="Exact target PE records plus bounded native instruction fixtures; see script and fixture ports.",
        zone_tiers=span(0x146985910,96),tier_chances=span(0x146986238,24),
        constants=[span(va,size) for va,size in [(0x1458EB52C,4),(0x1469AA5A0,4),
            (0x1458F6620,4),(0x1459EB3C0,4),(0x1459C8510,8),(0x1469AA5B0,8),
            (0x146720F90,16),(0x146627EE0,16),(0x146720FA0,16),(0x146720FB0,16)]],
        classes=classes,zones=zones,
        native_fixture=str(fixture_path.relative_to(ROOT)),
        native_fixture_sha256=hashlib.sha256(fixture_path.read_bytes()).hexdigest(),
        counts=dict(boss_candidates=len(boss_cases),multipliers=len(multipliers),ordinary_deaths=len(death_cases),
                    equipment_rolls=len(equipment_cases)),
        limitations=["Pickup entity creation/merging/rendering and delivery are ports, not validated here.",
            "These fixtures are instruction-component comparisons, not original/rebuilt game parity.",
            "Death accumulator +0x910 downstream meaning remains unresolved.",
            "Boss loot rolls enqueue permanent equipment; they do not directly equip, save, or upgrade run abilities."])
    path=ROOT/"docs/analysis/evidence/0.97.2/mob-loot.json"
    path.parent.mkdir(parents=True,exist_ok=True)
    path.write_text(json.dumps(evidence,indent=2)+"\n")
    print("Recovered 12 zones/60 primary bosses; native fixtures: %d boss candidates, %d multipliers, %d deaths, %d equipment rolls." %
          (len(boss_cases),len(multipliers),len(death_cases),len(equipment_cases)))


if __name__=="__main__":
    main()
