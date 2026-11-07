#!/usr/bin/env python3
"""Recover current condition/selector truth tables from bounded native code.

Executes the unchanged condition leaf1454cb900 and its selector helper1454d02b0
with synthetic in-memory records. Selector0 needs no game/catalog external
calls. Every other external instruction fails closed; no application is run.
"""
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

SHA = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"
data = (ROOT / "AzerothSurvivors/AzerothSurvivors-0.100.1.exe").read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
pe = inventory.PE(data)
u = Uc(UC_ARCH_X86, UC_MODE_64)
end = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
u.mem_map(pe.image_base, (end + 4095) & ~4095)
for section in pe.sections:
    u.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
MEM, STACK, STOP = 0x200000000, 0x300000000, 0x400000000
u.mem_map(MEM, 8192)
u.mem_map(STACK, 4096)
u.mem_map(STOP, 4096)
spans = [(0x1454cb900, 0x1454cba06), (0x1454d02b0, 0x1454d0509)]

def hook(_, address, size, unused):
    if address == STOP:
        u.emu_stop()
    elif not any(start <= address < end for start, end in spans):
        raise RuntimeError("Unreviewed instruction " + hex(address))

u.hook_add(UC_HOOK_CODE, hook)

def condition(kind, event_kind, flags, health=40.0, fraction=0.5):
    game, cond, event = bytearray(0x1000), bytearray(32), bytearray(40)
    struct.pack_into("<f", game, 0x418, health)
    struct.pack_into("<f", game, 0x470, 100.0)
    struct.pack_into("<If", cond, 0, kind, fraction)
    event[0x1d] = event_kind
    for bit, offset in enumerate([0x1f, 0x20, 0x21, 0x22]):
        event[offset] = (flags >> bit) & 1
    u.mem_write(MEM, bytes(game))
    u.mem_write(MEM + 0x1000, bytes(cond))
    u.mem_write(MEM + 0x1100, bytes(event))
    u.mem_write(STACK + 2048, struct.pack("<Q", STOP))
    for register, value in [(UC_X86_REG_RSP, STACK + 2048), (UC_X86_REG_RCX, MEM),
            (UC_X86_REG_RDX, MEM + 0x1000), (UC_X86_REG_R8, MEM + 0x1100),
            (UC_X86_REG_MXCSR, 0x1f80)]:
        u.reg_write(register, value)
    u.emu_start(spans[0][0], 0, count=10000)
    assert u.reg_read(UC_X86_REG_RIP) == STOP
    return bool(u.reg_read(UC_X86_REG_RAX) & 255)

cases = []
for kind in range(12):
    for event_kind in range(8):
        # Bit n of the output marks the native result for the n-th flag pattern.
        mask = sum(condition(kind, event_kind, flags) << flags for flags in range(16))
        cases.append(dict(condition=kind, event_kind=event_kind, true_flag_patterns=mask))
thresholds = [dict(health=health, threshold_fraction=0.5,
    result=condition(9, 5, 0, health)) for health in [49.0, 50.0, 51.0]]
owners = []
for start, end in spans:
    offset = pe.rva_offset(start - pe.image_base)
    owners.append(dict(start=hex(start), end_exclusive=hex(end), file_offset=hex(offset),
        sha256=hashlib.sha256(data[offset:offset + end - start]).hexdigest()))
tables = []
for address, count in [(0x1469f8718, 12), (0x1469f8748, 32),
        (0x1469f87c0, 5), (0x1469f87f8, 7), (0x1469f8814, 7)]:
    offset = pe.rva_offset(address - pe.image_base)
    tables.append(dict(address=hex(address), relative_base=hex(address),
        destinations=[hex(address + struct.unpack_from("<i", data, offset + index * 4)[0])
            for index in range(count)], sha256=hashlib.sha256(data[offset:offset+count*4]).hexdigest()))
evidence = dict(target_sha256=SHA, method=__doc__, native_owners=owners,
    tables=tables, selector=0, maximum_health=100.0, health=40.0,
    threshold_fraction=0.5, flag_bit_offsets=["0x1f", "0x20", "0x21", "0x22"],
    cases=cases, strict_health_thresholds=thresholds,
    instruction_cases=len(cases)*16+len(thresholds))
path = ROOT / "docs/analysis/evidence/0.100.1/treasure-interface/effect-condition-native.json"
path.write_text(json.dumps(evidence, indent=2) + "\n")
print("Recovered", evidence["instruction_cases"], "native conditions; no original application executed")
