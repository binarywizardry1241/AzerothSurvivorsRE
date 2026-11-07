#!/usr/bin/env python3
"""Recover current talent definitions and native analysis slices without execution.

Run from this checkout. The supplied EXE is needed only for recovery, never to
build the rebuilt application. Consumer interpretation is in talents-0.97.2.md.
"""
from native_recovery import f32 as _shared_f32
from script_sources import load_script
import hashlib
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA256 = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
INDEX = 0x1469A60F8
CLASSES = list(zip(
    ["warrior", "paladin", "hunter", "rogue", "priest", "shaman", "mage", "warlock", "druid"],
    [1, 2, 3, 4, 5, 7, 8, 9, 11],
))
FUNCTIONS = [
    0x14541DF40, 0x1454725F0, 0x145472BE0, 0x1454733C0,
    0x145473600, 0x145473A80, 0x145473C50, 0x145473EA0,
    0x145474780, 0x1454F4FC0, 0x14552C950, 0x1400CE700, 0x1400CF1B0,
    0x14026B780, 0x14026F710, 0x1400D20D0, 0x14264CF40, 0x140241ED0,
]
LEAF_ENDS = {0x14541DF40: 0x14541DFC1, 0x145472BE0: 0x145472C1A,
             0x145474780: 0x145474AE7}


def f32(value):
    return _shared_f32(value)


def numeric_value(effects, rank):
    """Current 0x1454725f0 + 0x145474780; discriminant is ONE byte."""
    raw_units = {6, 15, 25, 26}
    scaled_at_four = {0, 2, 3, 4, 5, 7, 8, 11, 13, 15, 16, 17, 18, 22}
    scaled_at_eight = {6, 9, 12}
    for effect in effects:
        payload = bytes.fromhex(effect["payload"])
        variant = payload[0]
        value = lambda at: struct.unpack_from("<f", payload, at)[0]
        if variant == 30:
            result = f32(value(4) * rank)
            percent = payload[8] not in raw_units
        elif variant == 31:
            result = f32(value(32) * rank)
            percent = payload[36] != 2
        elif variant <= 22 and variant not in {10, 14, 19, 20}:
            if variant == 1:
                result = f32(struct.unpack_from("<I", payload, 4)[0])
                percent = False
            else:
                at = 8 if variant in {6, 9, 12} else 4
                if variant == 8 and struct.unpack_from("<I", payload, 8)[0] == 0xffffffff:
                    at = 12
                result = value(at)
                if ((at == 4 and variant in scaled_at_four)
                        or (at == 8 and variant in scaled_at_eight)
                        or (variant == 8 and at == 12)):
                    result = f32(result * max(rank, 1))
                percent = variant != 16 and not (variant == 15 and payload[1] in raw_units)
        else:
            continue
        if percent:
            result = f32(result * 100)
        formatted = f"{result:.1f}"
        return formatted[:-2] if formatted.endswith(".0") else formatted
    return None


def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA256, "Target SHA-256 mismatch"
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)
    english = json.loads((ROOT / "crates/azeroth-survivors-re/assets/locales/en.json").read_text())

    def offset(address):
        return pe.rva_offset(address - pe.image_base)

    def provenance(address, size):
        start = offset(address)
        raw = data[start:start + size]
        assert len(raw) == size
        return dict(virtual_address=hex(address), file_offset=hex(start),
                    byte_count=size, sha256=hashlib.sha256(raw).hexdigest())

    def pair(address):
        return struct.unpack_from("<QQ", data, offset(address))

    def string(address):
        pointer, length = pair(address)
        assert length < 10000
        return data[offset(pointer):offset(pointer) + length].decode()

    classes, records, descriptors = [], [], []
    for index, (key, expected_id) in enumerate(CLASSES):
        address = INDEX + index * 200
        class_id = struct.unpack_from("<Q", data, offset(address + 192))[0]
        assert class_id == expected_id
        trees = []
        for tree_index in range(3):
            tree_address = address + tree_index * 64
            name, background, icon = [string(tree_address + at) for at in (0, 16, 32)]
            start, count = pair(tree_address + 48)
            assert count in (13, 14)
            descriptors.append(dict(class_key=key, tree_index=tree_index,
                                    name=name, talents_virtual_address=hex(start), count=count,
                                    **provenance(tree_address, 64)))
            talents = []
            for talent_index in range(count):
                row = start + talent_index * 104
                talent_key, title, talent_icon, description = [string(row + at) for at in (0, 16, 32, 64)]
                assert title in english and description in english
                packed = list(data[offset(row + 96):offset(row + 104)])
                assert packed[0] <= 6 and packed[1] <= 2
                assert packed[2] in (1, 2, 3, 5) and packed[3:] == [0] * 5
                prerequisite = string(row + 80) if pair(row + 80)[0] else None
                effects_address, effect_count = pair(row + 48)
                assert 1 <= effect_count <= 6
                effects = []
                for effect_index in range(effect_count):
                    at = offset(effects_address + effect_index * 64)
                    payload = data[at:at + 64]
                    effects.append(dict(tag=struct.unpack_from("<I", payload)[0],
                                        payload=payload.hex()))
                milestone = (packed[0] != 0 and packed[0] % 2 == 0 and packed[2] == 1
                             and any(bytes.fromhex(e["payload"])[0] <= 29 for e in effects))
                talents.append(dict(key=talent_key, name=title, icon=talent_icon,
                                    description=description, row=packed[0], column=packed[1],
                                    max_rank=packed[2], prerequisite=prerequisite, effects=effects,
                                    numeric_values=[numeric_value(effects, rank) for rank in range(1, packed[2] + 1)],
                                    milestone=milestone))
                records.append(dict(class_key=key, tree_index=tree_index, key=talent_key,
                                    **provenance(row, 104),
                                    effects=dict(count=effect_count, stride=64,
                                                 **provenance(effects_address, effect_count * 64))))
            keys = {talent["key"] for talent in talents}
            assert all(t["prerequisite"] is None or t["prerequisite"] in keys for t in talents)
            assert len({(t["row"], t["column"]) for t in talents}) == count
            trees.append(dict(name=name, background=background, icon=icon, talents=talents))
        classes.append(dict(key=key, id=class_id, trees=trees))
    assert len(records) == 354
    output = ROOT / "crates/azeroth-survivors-re/assets/talents.json"
    output.write_text(json.dumps(dict(version="0.97.2", classes=classes), indent=2, ensure_ascii=False) + "\n")

    formatter_jumps = [0x14b, 0x1ad, 0x14b, 0x157, 0x157, 0x157, 0x153, 0x14b,
                       0x19f, 0x153, 0x166, 0x157, 0x153, 0x157, 0x166, 0x182,
                       0x1bb, 0x157, 0x157, 0x166, 0x166, 0x157, 0x157]
    scaling_jumps = [0x20, 0x1aa, 0xfc, 0x1c9, 0x171, 0xa7, 0x137, 0x203, 0x231,
                     0x2fc, 0x1aa, 0x2c2, 0x7e, 0x15b, 0x1aa, 0xc5, 0x53,
                     0x26c, 0x297, 0x1aa, 0x1aa, 0x1aa, 0x32d]
    tables = []
    for name, address, base, expected in [
        ("formatter", 0x1469A9FBC, 0x1454725F0, formatter_jumps),
        ("rank_scaling", 0x1469AA074, 0x145474780, scaling_jumps),
    ]:
        relative = struct.unpack_from("<23i", data, offset(address))
        destinations = [address + value for value in relative]
        assert [destination - base for destination in destinations] == expected
        tables.append(dict(name=name, **provenance(address, 23 * 4),
                           relative_entries=list(relative), destinations=[hex(x) for x in destinations]))

    directory = ROOT / "runtime/analysis/history/progression/talents/8dad8e2dd72d"
    directory.mkdir(parents=True, exist_ok=True)
    functions = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    slices = []
    for address in FUNCTIONS:
        end = LEAF_ENDS.get(address, functions.get(address))
        assert end is not None
        path = directory / f"{address:x}.bin"
        payload = data[offset(address):offset(address) + end - address]
        path.write_bytes(payload)
        slices.append(dict(**provenance(address, end - address), end_exclusive=hex(end),
                           boundary=("Leaf start through final RET, verified in original PE disassembly"
                                     if address in LEAF_ENDS else "Original PE exception-directory RUNTIME_FUNCTION"),
                           path=str(path.relative_to(ROOT))))
        plan = dict(target=str(path.relative_to(ROOT)),
                    output=f"runtime/analysis/history/progression/talents/8dad8e2dd72d/rea-{address:x}",
                    open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(address)),
                    timeout=120, open_timeout=60, cleanup_timeout=60,
                    environment={"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
                    operations=[dict(name="analyze_function", arguments=dict(procedure=hex(address)), timeout=240)])
        (directory / f"plan-{address:x}.json").write_text(json.dumps(plan, indent=2) + "\n")
    evidence = dict(date="2026-10-18", version="0.97.2", target=str(TARGET.relative_to(ROOT)),
                    artifact_sha256=SHA256, target_executed=False,
                    index=dict(count=9, stride=200, **provenance(INDEX, 9 * 200)),
                    tree_stride=64, talent_stride=104, effect_stride=64,
                    effect_discriminant_bytes=1, trees=descriptors, records=records,
                    formatter_tables=tables, native_slices=slices,
                    output=str(output.relative_to(ROOT)), output_sha256=hashlib.sha256(output.read_bytes()).hexdigest(),
                    limitations=["Static table recovery and native code inspection only; no application or gameplay executed.",
                                 "Effect payloads are retained verbatim; gameplay effect application is outside menu scope.",
                                 "Raw Ghidra function slices omit data/callees and use generic x64 signatures; verify Win64 argument registers in original PE instructions.",
                                 "Current talent screen pixel/layout parity remains unverified."])
    (ROOT / "docs/analysis/evidence/talents.json").write_text(json.dumps(evidence, indent=2) + "\n")
    print(f"Recovered {len(records)} current talents in {len(descriptors)} trees from SHA-256 {SHA256}.")


if __name__ == "__main__":
    main()
