#!/usr/bin/env python3
"""Verify gap16's selected rows and bounded original instructions; no compilation/game.

The starter scan, condition/school selector and maximum-health conversion run in
Unicorn. The replay stops before native hit dispatch; no callee is replaced.
"""
from script_sources import load_script
from pathlib import Path
import hashlib
import json
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/class-rules"


def main():
    data = (ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected EXE mismatch"
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        return data[at:at + size]

    def text(address):
        pointer, length = struct.unpack("<QQ", raw(address, 16))
        return None if pointer == 0 else raw(pointer, length).decode()

    manifest = json.loads((RETAINED / "manifest.json").read_text())
    assert manifest["target_sha256"] == SHA
    for scope in manifest["scopes"]:
        assert hashlib.sha256(raw(int(scope["address"], 16), scope["byte_count"])).hexdigest() == scope["sha256"]
        for field in ("assembly", "pseudocode"):
            if field in scope:
                assert hashlib.sha256((ROOT / scope[field]).read_bytes()).hexdigest() == scope[field + "_sha256"]

    selected = json.loads((ROOT / "docs/analysis/evidence/0.105.0/game-mode-audit/selected-data.json").read_text())
    assert selected["target_sha256"] == SHA
    source = json.loads((ROOT / "crates/azeroth-survivors-re/assets/talents.json").read_text())
    talents = {row["key"]: row for cls in source["classes"] for tree in cls["trees"] for row in tree["talents"]}
    payloads = {}
    for key in ("shadow_dance", "shadow_weaving"):
        native = next(row for row in selected["selected_talents"] if row["key"] == key)
        current = talents[key]
        for field in ("record_prefix", "effects_range"):
            scope = native[field]
            assert hashlib.sha256(raw(int(scope["virtual_address"], 16), scope["byte_count"])).hexdigest() == scope["sha256"]
        key_address = int(native["record_prefix"]["virtual_address"], 16)
        assert current["prerequisite"] == text(key_address - 32)
        assert text(key_address - 16) is None
        for field in ("key", "name", "icon", "description", "row", "column", "max_rank"):
            assert current[field] == native[field], (key, field)
        assert len(current["effects"]) == len(native["effects"])
        payloads[key] = []
        for actual, expected in zip(current["effects"], native["effects"]):
            assert actual["payload"] == expected["payload"]
            payload = bytes.fromhex(actual["payload"])
            assert payload[0] == actual["tag"] == expected["discriminant"]
            payloads[key].append(payload)
            for item in actual["strings"]:
                pointer, length = struct.unpack_from("<QQ", payload, item["offset"])
                assert raw(pointer, length).decode() == item["value"]
            for item in actual["lists"]:
                pointer, length = struct.unpack_from("<QQ", payload, item["offset"])
                assert [text(pointer + i * 16) for i in range(length)] == item["values"]
    assert talents["shadow_dance"]["numeric_values"] == ["20"]
    assert talents["shadow_weaving"]["numeric_values"] == ["0.5"]

    # Existing installed analysis dependency; this does not install or build it.
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as R
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    end = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    uc.mem_map(pe.image_base, (end + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    memory, stack, done = 0x200000000, 0x300000000, 0x400000000
    uc.mem_map(memory, 0x10000)
    uc.mem_map(stack, 0x10000)
    uc.mem_map(done, 0x1000)
    active, stops = [], set()

    def hook(_, address, size, unused):
        if address in stops:
            uc.emu_stop()
        elif not any(lo <= address < hi for lo, hi in active):
            raise RuntimeError("Unreviewed instruction " + hex(address))
    uc.hook_add(UC_HOOK_CODE, hook)

    def reg(name, value=None):
        register = getattr(R, "UC_X86_REG_" + name)
        if value is not None:
            uc.reg_write(register, value)
        return uc.reg_read(register)

    def put(address, fmt, value):
        uc.mem_write(address, struct.pack(fmt, value))

    def reset(ranges, ends):
        nonlocal active, stops
        active, stops = ranges, set(ends)
        uc.mem_write(memory, bytes(0x10000))
        uc.mem_write(stack, bytes(0x10000))
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            reg(name, 0)
        reg("RSP", stack + 0x8000)
        reg("RBP", stack)
        reg("MXCSR", 0x1f80)
        put(stack + 0x8000, "<Q", done)

    def run(start):
        uc.emu_start(start, 0, count=10000)
        assert reg("RIP") in stops
        return reg("RIP")

    # Native constructor's initial single key; tag27 never replaces the default.
    replacement = payloads["shadow_dance"][0]
    grant = bytearray(replacement)
    grant[0] = 27
    fallback = (0x1234, 15)
    starters = [([], fallback), ([bytes(grant)], fallback),
                ([replacement], struct.unpack_from("<QQ", replacement, 8)),
                ([payloads["shadow_dance"][1], replacement], struct.unpack_from("<QQ", replacement, 8))]
    for rows, expected in starters:
        reset([(0x1459010c2, 0x14590113e), (0x14590162f, 0x145901647)], [0x14590113e])
        reg("RAX", memory + 0x1000)
        reg("RBX", memory + 0x2000)
        put(stack + 0x7d8, "<Q", memory + 0x3000)
        put(stack + 0x7e0, "<Q", len(rows))
        put(memory + 0x2040, "<Q", fallback[0])
        put(memory + 0x2048, "<Q", fallback[1])
        for index, payload in enumerate(rows):
            uc.mem_write(memory + 0x3000 + index * 64, bytes(payload))
        run(0x1459010c2)
        assert struct.unpack("<QQ", uc.mem_read(memory + 0x1000, 16)) == expected
        assert struct.unpack("<Q", uc.mem_read(stack + 0xd08, 8))[0] == 1

    # Run condition0 and its school5 selector together through their real call.
    conditions = 0
    for kind in range(3):
        for first_periodic in (False, True):
            for school in (0, 2, 5):
                for source_kind in (0, 1, 2, 3):
                    reset([(0x145929aa0, 0x145929ba6), (0x14592e820, 0x14592e986)], [done])
                    row = memory + 0x1000
                    event = memory + 0x2000
                    uc.mem_write(row, payloads["shadow_weaving"][0])
                    put(event + 8, "<I", 589)
                    put(event + 0x1c, "<B", school)
                    put(event + 0x1d, "<B", kind)
                    put(event + 0x1e, "<B", source_kind)
                    put(event + 0x22, "<B", first_periodic)
                    reg("RCX", memory)
                    reg("RDX", row + 8)
                    reg("R8", event)
                    run(0x145929aa0)
                    assert bool(reg("RAX") & 255) == ((kind == 0 or first_periodic) and school == 5 and source_kind != 2)
                    conditions += 1

    # Start immediately after the condition call; retain the real live-victim
    # search, coefficient multiply, metadata publication and source3 assignment.
    conversions = 0
    for maximum in (0.0, 1.0, 100.0, 10000.0, 12345.67):
        for admitted, target, dead in ((True, 42, False), (False, 42, False), (True, 9, False), (True, 42, True)):
            reset([(0x14592b620, 0x14592b6dc)], [0x14592b6c4, 0x145929e10])
            reg("RAX", int(admitted))
            put(stack + 0x218, "<Q", memory)
            put(stack + 0x214, "<I", 589)
            put(stack + 0x1d8, "<Q", target)
            put(stack + 0x1f0, "<I", struct.unpack_from("<I", payloads["shadow_weaving"][0], 4)[0])
            put(stack + 0x227, "<B", 5)
            put(memory + 0x560, "<Q", memory + 0x3000)
            put(memory + 0x568, "<Q", 1)
            put(memory + 0x3088, "<Q", 42)
            put(memory + 0x3068, "<I", int(dead))
            put(memory + 0x30f4, "<f", maximum)
            dispatched = run(0x14592b620) == 0x14592b6c4
            assert dispatched == (admitted and target == 42 and not dead)
            if dispatched:
                fraction = struct.unpack_from("<f", payloads["shadow_weaving"][0], 4)[0]
                native_maximum = struct.unpack("<f", struct.pack("<f", maximum))[0]
                expected = struct.unpack("<I", struct.pack("<f", fraction * native_maximum))[0]
                assert reg("XMM2") & 0xffffffff == expected
                assert bytes(uc.mem_read(memory + 0x195, 1)) == b"\x03"
                assert reg("RDX") == 42 and reg("R9") == 589
                assert bytes(uc.mem_read(stack + 0x8020, 1)) == b"\x05"
            conversions += 1
    print(f"Checked 2 current talent records, {len(starters)} starter scans, {conditions} native condition/selector cases and {conversions} conversion/victim cases; static only")


if __name__ == "__main__":
    main()
