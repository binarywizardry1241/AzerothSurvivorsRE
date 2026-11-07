#!/usr/bin/env python3
"""Check current boss arrival sound packets using bounded unchanged instructions.

No game, compiler, native allocator or OS call runs. The allocator and vector
growth are explicit synthetic-memory seams; every other escaped call fails.
The canonical complete constructor extract belongs to boss-catalog-0.105.0.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/raid/boss-voices/f6c50f31a263"
OUT = ROOT / "docs/analysis/evidence/boss-voices/native-vectors.json"
BEGIN, END = 0x1459309B6, 0x145930AB9
ZONES = 0x146BA9450


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def read(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + size]
        assert len(value) == size
        return value

    def original(address, fmt):
        return struct.unpack(fmt, read(address, struct.calcsize(fmt)))

    def string(address):
        pointer, length = original(address, "<QQ")
        assert 0 < length < 4096
        return read(pointer, length).decode()

    rows = []
    for zone_index in range(12):
        zone = ZONES + zone_index * 240
        key = string(zone + 8)
        bosses, count = original(zone + 0x88, "<QQ")
        assert count == 5
        for index in range(count):
            address = bosses + index * 88
            rows.append(dict(zone=key, index=index, boss_id=original(address + 48, "<I")[0],
                             name=string(address), voice_id=original(address + 80, "<I")[0]))

    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as registers
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    image_end = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    uc.mem_map(pe.image_base, (image_end + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section["rva"],
                     data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    BASE = 0x20000000
    uc.mem_map(BASE, 0x20000)
    GAME, DEFINITION, VECTOR, GROWN = BASE + 0x1000, BASE + 0x3000, BASE + 0x4000, BASE + 0x6000
    BP, SP, HEAP = BASE + 0xA000, BASE + 0xB008, BASE + 0xD000
    next_heap = HEAP
    calls = []

    def get(address, fmt):
        return struct.unpack(fmt, uc.mem_read(address, struct.calcsize(fmt)))

    def put(address, fmt, *values):
        uc.mem_write(address, struct.pack(fmt, *values))

    def reg(name, value=None):
        register = getattr(registers, "UC_X86_REG_" + name)
        if value is not None:
            uc.reg_write(register, value)
        return uc.reg_read(register)

    def hook(_, address, size, unused):
        nonlocal next_heap
        if BEGIN <= address < END:
            assert address + size <= END
            assert bytes(uc.mem_read(address, size)) == read(address, size)
            return
        calls.append(hex(address))
        if address == 0x140002200:
            pass  # Rust allocator shim; no state needed at this explicit seam.
        elif address == 0x1400021C0:
            assert (reg("RCX"), reg("RDX")) == (32, 1)
            reg("RAX", next_heap)
            next_heap += 32
        elif address == 0x145BCB530:
            assert reg("RCX") == GAME + 0x5D0
            count = get(GAME + 0x5E0, "<Q")[0]
            pointer = get(GAME + 0x5D8, "<Q")[0]
            uc.mem_write(GROWN, bytes(uc.mem_read(pointer, count * 32)))
            put(GAME + 0x5D0, "<QQ", 16, GROWN)
        else:
            raise AssertionError("Unreviewed native call " + hex(address))
        stack = reg("RSP")
        reg("RIP", get(stack, "<Q")[0])
        reg("RSP", stack + 8)

    uc.hook_add(UC_HOOK_CODE, hook)
    cases = []
    probes = rows + [dict(zone="boundary", index=0, boss_id=0, name="nonzero-one", voice_id=1),
                    dict(zone="boundary", index=1, boss_id=0, name="unsigned-max", voice_id=0xFFFFFFFF)]
    for row in probes:
        for capacity, count in [(16, 0), (2, 2)]:
            uc.mem_write(BASE, bytes(0x20000))
            next_heap = HEAP
            calls.clear()
            put(DEFINITION + 0x50, "<I", row["voice_id"])
            put(GAME + 0x5D0, "<QQQ", capacity, VECTOR, count)
            sentinel = bytes([0x5A]) * count * 32
            uc.mem_write(VECTOR, sentinel)
            for name, value in [("RSI", GAME), ("R12", DEFINITION), ("R13", GAME + 0x5D0),
                                ("RBP", BP), ("RSP", SP)]:
                reg(name, value)
            uc.emu_start(BEGIN, END, count=1000)
            assert reg("RIP") == END
            pointer = get(GAME + 0x5D8, "<Q")[0]
            assert bytes(uc.mem_read(pointer, count * 32)) == sentinel
            length = get(GAME + 0x5E0, "<Q")[0]
            packets = []
            for index in range(count, length):
                capacity_word, payload, payload_length, opcode = get(pointer + index * 32, "<QQQH")
                assert capacity_word == 32 and payload_length == 4 and opcode == 0x2D2
                raw = bytes(uc.mem_read(payload, payload_length))
                packets.append(dict(opcode=opcode, body_hex=raw.hex(), sound_id=struct.unpack("<I", raw)[0]))
            expected = [8174] + ([row["voice_id"]] if row["voice_id"] else [])
            assert [packet["sound_id"] for packet in packets] == expected
            assert len(calls) == 2 * len(expected) + int(count == capacity)
            cases.append(dict(**row, vector_initial_capacity=capacity, vector_initial_count=count,
                              preserved_existing_packets=True, packets=packets))

    result = dict(target_version="0.105.0", target_sha256=SHA, target_executed=False,
                  constructor="0x14592ff90", instruction_range=dict(begin=hex(BEGIN), end_exclusive=hex(END),
                  file_offset=hex(pe.rva_offset(BEGIN - pe.image_base)),
                  sha256=hashlib.sha256(read(BEGIN, END - BEGIN)).hexdigest()),
                  canonical_constructor="docs/analysis/evidence/0.105.0/boss-catalog/constructor.asm",
                  voiced_boss_count=sum(bool(row["voice_id"]) for row in rows), native_cases=cases,
                  limits=["Unchanged bounded instructions with synthetic Game/stack/definition memory.",
                          "Allocator shim, allocation and vector growth are explicit memory seams; no native callee executes.",
                          "DBC/MPQ kit resolution, audible playback and original/rebuilt timing remain unverified."])
    assert len(rows) == 60 and result["voiced_boss_count"] == 22
    text = json.dumps(result, indent=2, ensure_ascii=False) + "\n"
    if args.check:
        assert OUT.read_text() == text, "Retained voice vectors differ"
    else:
        WORK.mkdir(parents=True, exist_ok=True)
        (WORK / "native-vectors.json").write_text(text)
    print(f"Passed {len(cases)} unchanged-native packet cases:60 bosses/22 voices, zero/nonzero/u32 boundaries, spare/full vectors")


if __name__ == "__main__":
    main()
