#!/usr/bin/env python3
"""Hash-bound bounded native Effect64 scaling vectors, without game execution.

Admits the original iterator14554e050 and scalar leaf1454848a0 only. The single
CRT floorf boundary is reviewed; every other external instruction fails closed.
Native padding is deliberately not used as semantic evidence.
"""
from script_sources import load_script
from pathlib import Path
import hashlib, json, math, struct, sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

SHA = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"
target = ROOT / "AzerothSurvivors/AzerothSurvivors-0.100.1.exe"
data = target.read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
pe = inventory.PE(data)
u = Uc(UC_ARCH_X86, UC_MODE_64)
end = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
u.mem_map(pe.image_base, (end + 4095) & ~4095)
for section in pe.sections:
    u.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
MEM, STACK, STOP = 0x200000000, 0x300000000, 0x400000000
u.mem_map(MEM, 4096)
u.mem_map(STACK, 4096)
u.mem_map(STOP, 4096)
spans = [(0x14554e050, 0x14554e219), (0x1454848a0, 0x145484c07)]

def hook(_, address, size, unused):
    if address == STOP:
        u.emu_stop()
    elif any(start <= address < end for start, end in spans):
        pass
    elif address == 0x145773265:
        value = struct.unpack("<f", u.reg_read(UC_X86_REG_XMM0).to_bytes(16, "little")[:4])[0]
        u.reg_write(UC_X86_REG_XMM0, struct.unpack("<I", struct.pack("<f", math.floor(value)))[0])
        sp = u.reg_read(UC_X86_REG_RSP)
        ret = struct.unpack("<Q", u.mem_read(sp, 8))[0]
        u.reg_write(UC_X86_REG_RSP, sp + 8)
        u.reg_write(UC_X86_REG_RIP, ret)
    else:
        raise RuntimeError("Unreviewed instruction " + hex(address))

u.hook_add(UC_HOOK_CODE, hook)
records = []
for tag in range(32):
    raw = bytearray(struct.pack("<16f", *[0.75 + n / 4 for n in range(16)]))
    raw[0] = tag
    records.append(("tag-" + str(tag), bytes(raw)))
raw = bytearray(records[8][1])
struct.pack_into("<I", raw, 8, 0xffffffff)
records.append(("tag-8-status", bytes(raw)))
for modifier in range(7):
    for amount in (0.24999999, 0.49999997, 0.75, 1.99999, 4.0):
        raw = bytearray(64)
        raw[0] = 31
        raw[36] = modifier
        struct.pack_into("<f", raw, 32, amount)
        records.append((f"spell-{modifier}-{amount}", bytes(raw)))
cases = []
for name, raw in records:
    for factor in (1.0, 1.2, 2.7):
        u.mem_write(MEM, raw)
        u.mem_write(MEM + 0x100, struct.pack("<f", factor))
        u.mem_write(MEM + 0x200, struct.pack("<QQQ", MEM, MEM + 64, MEM + 0x100))
        u.mem_write(MEM + 0x300, struct.pack("<QQQ", MEM + 0x380, 0, MEM + 0x400))
        u.mem_write(MEM + 0x380, bytes(8))
        u.mem_write(MEM + 0x400, raw)
        u.mem_write(STACK + 2048, struct.pack("<Q", STOP))
        for register, value in [(UC_X86_REG_RSP, STACK + 2048), (UC_X86_REG_RCX, MEM + 0x200),
                (UC_X86_REG_RDX, MEM + 0x300), (UC_X86_REG_MXCSR, 0x1f80)]:
            u.reg_write(register, value)
        u.emu_start(spans[0][0], 0, count=10000)
        assert u.reg_read(UC_X86_REG_RIP) == STOP
        output = bytes(u.mem_read(MEM + 0x400, 64))
        tag = raw[0]
        offset = (32 if tag == 31 else 4 if tag in [0,2,3,4,5,7,11,13,15,16,17,18,22,30]
            else 8 if tag in [6,9,12] else (12 if raw[8:12] == b"\xff"*4 else 4) if tag == 8 else None)
        cases.append(dict(name=name, raw_hex=raw.hex(), factor_bits=struct.unpack("<I", struct.pack("<f", factor))[0],
            scaled_offset=offset, scaled_bits=None if offset is None else struct.unpack_from("<I", output, offset)[0]))

owners = []
for start, end in spans:
    offset = pe.rva_offset(start - pe.image_base)
    owners.append(dict(start=hex(start), end_exclusive=hex(end), file_offset=hex(offset),
        sha256=hashlib.sha256(data[offset:offset + end - start]).hexdigest()))
fixture = dict(target_sha256=SHA, method=__doc__, native_owners=owners, cases=cases)
path = ROOT / "crates/azeroth-survivors-re/tests/fixtures/effect-scaling-0.100.1-native.json"
path.write_text(json.dumps(fixture, indent=2) + "\n")
print("Recovered", len(cases), "native scaling vectors; no original application executed")
