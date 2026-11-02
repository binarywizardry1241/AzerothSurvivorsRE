#!/usr/bin/env python3
"""Check the selected showcase contract without compiling or running the game.

Original leaf instructions run only in Unicorn; environment lookup, allocators,
terrain, spell/stat refresh and all other native callees never execute. Curated
range identity and Ghidra evidence are retained with the owning report.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import latest_target

ROOT = Path(__file__).resolve().parents[1]
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--python-libs", default="runtime/armory-recovery/python-libs")
    parser.add_argument("--output", default="runtime/showcase-0.105.0/checks.json")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Newest supplied target requires fresh showcase recovery"
    output = (ROOT / args.output).resolve()
    assert output.is_relative_to(ROOT / "runtime"), "Generated output belongs in runtime/"
    libs = (ROOT / args.python_libs).resolve()
    assert libs.is_relative_to(ROOT)
    sys.path.insert(0, str(libs))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg

    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    data = (ROOT / target["path"]).read_bytes()
    pe = module.PE(data)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + size]

    manifest = json.loads((ROOT / "docs/analysis/evidence/0.105.0/showcase/manifest.json").read_text())
    for row in manifest["ranges"]:
        start = int(row["start"], 16)
        end = int(row["end_exclusive"], 16)
        assert hashlib.sha256(raw(start, end - start)).hexdigest() == row["sha256"]

    # Revalidate reused class-pool identity, preserving its canonical source.
    catalog = (ROOT / "crates/azeroth-survivors-re/src/player_abilities/catalog.rs").read_text()
    classes = []
    for match in re.finditer(r'ClassAbilities \{ class_id: (\d+), key: "[^"]+", starter: "[^"]+", pool: &\[(.*?)\] \}', catalog):
        class_id = int(match[1])
        address = 0x146BAB7A8 if class_id == 1 else struct.unpack("<Q", raw(0x146E7B190 + (class_id - 2) * 8, 8))[0]
        pointer, count = struct.unpack("<QQ", raw(address + 0x30, 16))
        keys = [raw(*struct.unpack("<QQ", raw(pointer + n * 16, 16))).decode() for n in range(count)]
        assert keys == re.findall(r'"([^"]+)"', match[2]), f"Class{class_id} source pool differs"
        classes.append(dict(class_id=class_id, keys=keys))
    assert len(classes) == 9

    # Current1458e5d80 traverses class/tree/talent/effect order and deduplicates
    # variant26 keys globally. No active class/allocation filter is present.
    extra = []
    for class_index in range(9):
        for tree_offset in (0x30, 0x70, 0xB0):
            talents, count = struct.unpack("<QQ", raw(0x146E74860 + class_index * 0xC8 + tree_offset, 16))
            for talent in range(count):
                effects, effect_count = struct.unpack("<QQ", raw(talents + talent * 0x78 + 0x50, 16))
                for effect in range(effect_count):
                    payload = raw(effects + effect * 0x40, 0x40)
                    if payload[0] == 26:
                        key = raw(*struct.unpack_from("<QQ", payload, 8)).decode()
                        if key not in extra:
                            extra.append(key)
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/showcase.rs").read_text()
    source_extra = re.findall(r'"([^"]+)"', source.split("const EXTRA_ABILITIES:", 1)[1].split("];", 1)[0])
    assert extra == source_extra and len(extra) == 14
    source_offsets = source.split("const PICKUP_OFFSETS:", 1)[1].split("= [", 1)[1].split("];", 1)[0]
    bits = [int(word.replace("_", ""), 16) for word in re.findall(r'from_bits\((0x[0-9a-f_]+)\)', source_offsets)]
    native_offsets = [struct.unpack("<II", raw(0x146E783E0 + n * 16, 8)) for n in range(8)]
    assert bits == [word for pair in native_offsets for word in pair]
    assert raw(0x145E5BCF8, 4) == struct.pack("<f", 25.0)
    assert raw(0x145D6D270, 4) == struct.pack("<f", 12.0)
    assert raw(0x146E783D0, 8) == struct.pack("<2f", 14.0, 14.0)

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + s["raw_size"] for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    scratch, size = 0x200000000, 0x20000
    machine.mem_map(scratch, size)
    game, frame, text_buffer = scratch + 0x1000, scratch + 0x8000, scratch + 0xC000
    execution = {}

    def on_code(_, address, length, unused):
        if address in execution["stops"]:
            machine.emu_stop()
            return
        assert any(start <= address < address + length <= end for start, end in execution["allowed"])
        instruction = bytes(machine.mem_read(address, length))
        assert instruction == raw(address, length)
        assert instruction[0] != 0xE8, "Native callees never execute"

    def on_write(_, access, address, length, value, unused):
        assert scratch <= address < address + length <= scratch + size

    machine.hook_add(UC_HOOK_CODE, on_code)
    machine.hook_add(UC_HOOK_MEM_WRITE, on_write)

    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack(fmt, *values))

    def get(address, fmt):
        return struct.unpack(fmt, machine.mem_read(address, struct.calcsize(fmt)))[0]

    def setreg(name, value):
        machine.reg_write(getattr(reg, "UC_X86_REG_" + name), value)

    def run(start, stops, allowed):
        execution.update(stops=stops, allowed=allowed)
        setreg("EFLAGS", 2)
        machine.emu_start(start, 0, count=100)
        result = machine.reg_read(reg.UC_X86_REG_RIP)
        assert result in stops
        return result

    vectors = []
    for value in (b"", b"1", b"0", b"true", b"01", b"1 ", b" 1", b"\x31\x00", b"\xff"):
        machine.mem_write(scratch, bytes(size))
        machine.mem_write(text_buffer, value or b"\0")
        put(frame + 0xBC0, "<Q", len(value))
        put(frame + 0xBB8, "<Q", text_buffer)
        setreg("RBP", frame)
        run(0x1458A7238, {0x1458A7486}, [(0x1458A7238, 0x1458A7258), (0x1458A747E, 0x1458A7486)])
        actual = get(frame + 0xA24, "<B")
        assert actual == (value == b"1")
        vectors.append(dict(kind="environment-value", value_hex=value.hex(), enabled=bool(actual)))

    for enabled, now, deadline in [(False, 0.0, 0.0), (False, 40.0, 0.0),
                                    (True, 0.0, 0.0), (True, 11.5, 12.0),
                                    (True, 12.0, 12.0), (True, 40.0, 12.0)]:
        machine.mem_write(scratch, bytes(size))
        put(game + 0xA6C, "<B", enabled)
        put(game + 0x478, "<f", 150.0)
        put(game + 0x4E0, "<f", 1.0)
        put(game + 0x9F4, "<I", 7)
        put(game + 0x4DC, "<I", 3)
        put(game + 0xA4C, "<f", deadline)
        setreg("R13", game)
        setreg("XMM7", struct.unpack("<I", struct.pack("<f", now))[0])
        stop = run(0x145901E4C, {0x145901E96, 0x1459021BA}, [(0x145901E4C, 0x145901E96)])
        due = enabled and now >= deadline
        assert stop == (0x145901E96 if due else 0x1459021BA)
        assert get(game + 0x4E0, "<f") == (150.0 if enabled else 1.0)
        assert get(game + 0x9F4, "<I") == (0 if enabled else 7)
        assert get(game + 0x4DC, "<I") == 3
        assert get(game + 0xA4C, "<f") == (now + 12.0 if due else deadline)
        vectors.append(dict(kind="playing-tick-prefix", enabled=enabled, now=now, deadline=deadline,
                            batch_due=due, next_deadline=get(game + 0xA4C, "<f")))

    for phase in (0, 1, 2, 4, 5):
        for enabled in (False, True):
            machine.mem_write(scratch, bytes(size))
            put(game + 0xA73, "<B", phase)
            put(game + 0xA6C, "<B", enabled)
            setreg("RCX", game)
            stop = run(0x1458F338D, {0x1458F33AA, 0x1458F4023}, [(0x1458F338D, 0x1458F33AA)])
            assert (stop == 0x1458F33AA) == (phase == 1 and not enabled)
            vectors.append(dict(kind="incoming-gate", phase=phase, showcase=enabled,
                                damage_admitted=stop == 0x1458F33AA))
    result = dict(target_sha256=SHA, vectors=vectors, class_pools=classes,
                  extra_abilities=extra, pickup_offset_bits=native_offsets,
                  limits=["Only original leaf instructions execute; no native callees, game, or rebuilt Rust executes.",
                          "Host trigonometry, terrain, shared creators and runtime/visual parity remain unverified."])
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2) + "\n")
    print(f"{len(vectors)} bounded showcase vectors, nine native class pools and14 extra spell keys passed")


if __name__ == "__main__":
    main()
