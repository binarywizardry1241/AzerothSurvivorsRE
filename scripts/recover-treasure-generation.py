#!/usr/bin/env python3
"""Recover exact 0.100.1 jewelry data and bounded native increment fixtures.

The reference EXE is never launched. Unicorn executes only the unchanged leaf
increment helper, with no calls or OS access; every other code address is denied.
Ordinary source builds and tests do not require this script or the EXE.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib
import json
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.100.1.exe"
SHA = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"
TABLE = 0x14673b428
START, END = 0x145424420, 0x145424a82


def main():
    data = TARGET.read_bytes()
    if hashlib.sha256(data).hexdigest() != SHA:
        raise SystemExit("Refusing a different reference executable")
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)

    def read(va, n):
        offset = pe.rva_offset(va - pe.image_base)
        result = data[offset:offset+n]
        assert len(result) == n
        return result

    def span(va, n):
        raw = read(va, n)
        return dict(va=hex(va), file_offset=hex(pe.rva_offset(va-pe.image_base)),
                    size=n, sha256=hashlib.sha256(raw).hexdigest(), hex=raw.hex())

    def text(va):
        ptr, n = struct.unpack("<QQ", read(va, 16))
        return read(ptr, n).decode()

    def floats(va, n):
        return list(struct.unpack("<" + "f" * n, read(va, n*4)))

    records = []
    for i in range(22):
        va = TABLE + i*72
        base, tag, slot, pad1, pad2 = struct.unpack("<f4B", read(va+64, 8))
        assert slot in (0, 1) and pad1 == pad2 == 0
        records.append(dict(key=text(va), name=text(va+16), icon=text(va+32),
                            description=text(va+48), base_bits=struct.unpack("<I",read(va+64,4))[0],
                            tag=tag, slot=slot, native=span(va,72)))
    rarity = floats(0x14673a468, 5)
    amulet = floats(0x14673d37c, 5)
    generated = ["//! Generated from the hash-checked 0.100.1 EXE; see recover-treasure-generation.py.",
                 "use super::JewelryDefinition;", "pub const JEWELRY: [JewelryDefinition; 22] = ["]
    for r in records:
        generated.append("    JewelryDefinition { key: %s, name: %s, icon: %s, description: %s, base: f32::from_bits(%s), tag: %s, slot: %s }," % (
            json.dumps(r["key"]), json.dumps(r["name"]), json.dumps(r["icon"]),
            json.dumps(r["description"]), hex(r["base_bits"]), r["tag"], r["slot"]))
    generated += ["];"]
    for name, va, values in [("RARITY_MULTIPLIERS",0x14673a468,rarity),
                             ("AMULET_STEPS",0x14673d37c,amulet)]:
        bits = struct.unpack("<"+"I"*5, read(va,20))
        generated.append("pub const %s: [f32; 5] = [%s];" %
                         (name, ", ".join("f32::from_bits(%s)" % hex(b) for b in bits)))
    output = ROOT / "crates/azeroth-survivors-re/src/loot_rewards/catalog_01001.rs"
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("\n".join(generated)+"\n")

    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8,
        UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_XMM0, UC_X86_REG_MXCSR,
        UC_X86_REG_R14, UC_X86_REG_RBP, UC_X86_REG_XMM2, UC_X86_REG_XMM6,
        UC_X86_REG_XMM7, UC_X86_REG_XMM8, UC_X86_REG_XMM9, UC_X86_REG_XMM10,
        UC_X86_REG_XMM11, UC_X86_REG_XMM12, UC_X86_REG_XMM13, UC_X86_REG_XMM14,
        UC_X86_REG_XMM15)
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s["rva"]+max(s["virtual_size"],s["raw_size"]) for s in pe.sections)
    uc.mem_map(pe.image_base, (size+4095)&~4095)
    for s in pe.sections:
        uc.mem_write(pe.image_base+s["rva"], data[s["raw_offset"]:s["raw_offset"]+s["raw_size"]])
    MEM, STACK, STOP = 0x200000000,0x300000000,0x400000000
    uc.mem_map(MEM, 4096)
    uc.mem_map(STACK, 4096)
    uc.mem_map(STOP,4096)

    allowed = (START, END)
    endpoint = STOP

    def hook(_, address, size, __):
        if address == endpoint:
            uc.emu_stop()
        elif not allowed[0] <= address < allowed[1]:
            raise RuntimeError("Denied out-of-scope instruction " + hex(address))
    uc.hook_add(UC_HOOK_CODE,hook)
    cases=[]
    for i, r in enumerate(records):
        base=struct.unpack("<f",struct.pack("<I",r["base_bits"]))[0]
        for rarity in range(5):
            # Fresh; repeated; near and beyond each finite cap; high upgrade count.
            for existing,current,count in [(False,0.,0),(True,base*1.5,0),
                    (True,base*3.,3),(True,base*4.95,20),(True,base*10.,100),
                    (True,0.5999999642372131,7)]:
                uc.mem_write(MEM,struct.pack("<B3xfI",existing,current,count))
                uc.mem_write(STACK+2048,struct.pack("<Q",STOP))
                uc.reg_write(UC_X86_REG_RSP,STACK+2048)
                uc.reg_write(UC_X86_REG_RCX,TABLE+i*72)
                uc.reg_write(UC_X86_REG_RDX,rarity)
                uc.reg_write(UC_X86_REG_R8,MEM)
                uc.reg_write(UC_X86_REG_MXCSR,0x1f80)
                uc.emu_start(START,0,count=10000)
                assert uc.reg_read(UC_X86_REG_RIP)==STOP
                cases.append(dict(key=r["key"],rarity=rarity,existing=existing,
                    current_bits=struct.unpack("<I",struct.pack("<f",current))[0],
                    upgrades=count,increment_bits=uc.reg_read(UC_X86_REG_XMM0)&0xffffffff))
    rarity_cases=[]
    bits = lambda value: struct.unpack("<I",struct.pack("<f",value))[0]
    for amulet in (False,True):
        allowed = (0x1454f489b,0x1454f4915) if amulet else (0x1454f4954,0x1454f49d2)
        endpoint = allowed[1]
        for level,run_rarity,bonus in [(0,0.,0.),(1,0.,0.),(29,0.15,0.25),
                (30,0.15,0.25),(31,0.15,0.25),(100,1.2,0.5)]:
            uc.mem_write(MEM+0x410,struct.pack("<I",level))
            uc.mem_write(MEM+0x49c,struct.pack("<f",run_rarity))
            uc.reg_write(UC_X86_REG_R14,MEM)
            uc.reg_write(UC_X86_REG_RBP,STACK+1024)
            uc.mem_write(STACK+1024+0x154,struct.pack("<f",bonus))
            uc.reg_write(UC_X86_REG_XMM7,bits(0.5+bonus))
            for register,value in [(UC_X86_REG_XMM10,1.),(UC_X86_REG_XMM11,25.),
                    (UC_X86_REG_XMM12,10.),(UC_X86_REG_XMM13,4.),(UC_X86_REG_XMM14,60.)]:
                uc.reg_write(register,bits(value))
            uc.emu_start(allowed[0],0,count=1000)
            assert uc.reg_read(UC_X86_REG_RIP)==endpoint
            rarity_cases.append(dict(amulet=amulet,level=level,run_rarity_bits=bits(run_rarity),
                source_bonus_bits=bits(bonus),weight_bits=[bits(60.)]+[
                    uc.reg_read(register)&0xffffffff for register in [UC_X86_REG_XMM9,
                    UC_X86_REG_XMM8,UC_X86_REG_XMM15,UC_X86_REG_XMM6]],
                total_bits=uc.reg_read(UC_X86_REG_XMM2)&0xffffffff))
    fixture=dict(version="0.100.1",sha256=SHA,method="Unchanged native leaf/rarity instructions in bounded Unicorn; no game/process/OS execution",
        instruction_span=span(START,END-START),table_span=span(TABLE,22*72),
        rarity_span=span(0x14673a468,20),amulet_step_span=span(0x14673d37c,20),
        records=records,cases=cases,rarity_cases=rarity_cases,
        rarity_instruction_spans=[span(0x1454f489b,0x1454f4915-0x1454f489b),
                                 span(0x1454f4954,0x1454f49d2-0x1454f4954)])
    path=ROOT/"crates/azeroth-survivors-re/tests/fixtures/jewelry-0.100.1-native.json"
    path.write_text(portable_json(fixture,indent=2)+"\n")
    log=ROOT/"runtime/treasure-0.100.1-generation/jewelry-increment.asm"
    log.write_text(objdump_output(["objdump","-d","--no-show-raw-insn",
        "--start-address="+hex(START),"--stop-address="+hex(END),str(TARGET)],cwd=ROOT,text=True))
    print(f"Recovered {len(records)} jewelry definitions, {len(cases)} increment and {len(rarity_cases)} rarity cases")


if __name__ == "__main__":
    main()
