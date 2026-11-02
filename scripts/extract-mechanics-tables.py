#!/usr/bin/env python3
"""Extract bounded fixed gameplay definition tables from the historical 0.91.4 EXE.

Offsets and layouts come from pointer walks, not recovered original Rust types.
Numeric semantics are candidates unless separately confirmed by native consumers.
"""

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct


ROOT = Path(__file__).resolve().parent.parent


def main():
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=inventory.project_path, default=inventory.HISTORICAL_BINARY,
                        help="historical 0.91.4 EXE; fixed table offsets require its original hash")
    args = parser.parse_args()
    path = args.binary
    data = path.read_bytes()
    if hashlib.sha256(data).hexdigest() != inventory.HISTORICAL_SHA256:
        parser.error("Fixed 0.91.4 table offsets require SHA-256 " + inventory.HISTORICAL_SHA256)
    pe = inventory.PE(data)
    english = json.loads((ROOT / "docs/analysis/evidence/embedded-english.json").read_text())

    def location(offset):
        return dict(file_offset=hex(offset), virtual_address=hex(pe.offset_va(offset)))

    def span(offset, size):
        raw = data[offset:offset + size]
        assert len(raw) == size
        return dict(**location(offset), length_bytes=size, sha256=hashlib.sha256(raw).hexdigest(), raw_hex=raw.hex())

    def f32(offset):
        return struct.unpack_from("<f", data, offset)[0]

    def u32(offset):
        return struct.unpack_from("<I", data, offset)[0]

    def pair(offset):
        address, count = struct.unpack_from("<QQ", data, offset)
        return pe.rva_offset(address - pe.image_base), count

    def string(offset):
        start, length = pair(offset)
        assert 0 < length < 10000
        return dict(**location(start), length_bytes=length, text=data[start:start + length].decode("utf-8"))

    def byte_slice(offset):
        start, length = pair(offset)
        assert 0 < length <= 16
        raw = data[start:start + length]
        return dict(**location(start), length_bytes=length, raw_hex=raw.hex(), byte_values=list(raw))

    def effects(offset):
        start, count = pair(offset)
        assert 1 <= count <= 4
        return dict(**location(start), count=count, entry_stride_bytes=64,
                    entries=[dict(record=span(start + i * 64, 64),
                                  u32_at_0=u32(start + i * 64), f32_at_4=f32(start + i * 64 + 4))
                             for i in range(count)])

    abilities = []
    for i in range(111):
        row = 0x66C9730 + i * 120
        key, name, icon = [string(row + at) for at in (0, 16, 32)]
        assert english[f'ability.{key["text"]}.name'] == name["text"]
        abilities.append(dict(record=span(row, 120), key=key, name=name, icon=icon, opaque_byte_slice_at_48=byte_slice(row + 48),
                              u32_by_record_offset={hex(at): u32(row + at) for at in (64, 84, 104)},
                              f32_by_record_offset={hex(at): f32(row + at) for at in (68, 72, 76, 80, 88, 92, 96, 100, 108, 112)},
                              bytes_at_116=list(data[row + 116:row + 120])))
    assert len({entry["key"]["text"] for entry in abilities}) == 111
    assert {entry["key"]["text"] for entry in abilities} == {key.split(".")[1] for key in english if key.startswith("ability.") and key.endswith(".name")}

    jewelry = []
    for i in range(22):
        row = 0x66CF140 + i * 72
        key, name, icon, description = [string(row + at) for at in (0, 16, 32, 48)]
        assert english[f'jewel.{key["text"]}'] == name["text"]
        assert description["text"] in english
        jewelry.append(dict(record=span(row, 72), key=key, name=name, icon=icon, description=description,
                            f32_at_64=f32(row + 64), bytes_at_68=list(data[row + 68:row + 72])))
    assert [entry["bytes_at_68"][1] for entry in jewelry] == [0] * 9 + [1] * 13

    amulets = []
    for i in range(17):
        row = 0x66D03D8 + i * 80
        key, name, icon = [string(row + at) for at in (0, 16, 32)]
        assert english[f'amulet.{key["text"]}'] == name["text"]
        amulets.append(dict(record=span(row, 80), key=key, name=name, icon=icon, effects=effects(row + 48),
                            u64_at_64=struct.unpack_from("<Q", data, row + 64)[0],
                            u64_at_72=struct.unpack_from("<Q", data, row + 72)[0]))

    talent_classes = []
    for i, class_key in enumerate(("warrior", "paladin", "hunter", "rogue", "priest", "shaman", "mage", "warlock", "druid")):
        row = 0x68A56D8 + i * 200
        trees = []
        for j in range(3):
            tree_row = row + j * 64
            name, background, icon = [string(tree_row + at) for at in (0, 16, 32)]
            start, count = pair(tree_row + 48)
            assert count in (13, 14)
            talents = []
            for k in range(count):
                talent_row = start + k * 104
                key, talent_name, talent_icon, description = [string(talent_row + at) for at in (0, 16, 32, 64)]
                assert talent_name["text"] in english
                assert description["text"] in english
                prerequisite = None
                if struct.unpack_from("<Q", data, talent_row + 80)[0]:
                    prerequisite = string(talent_row + 80)
                packed = list(data[talent_row + 96:talent_row + 104])
                assert packed[0] <= 6 and packed[1] <= 2 and packed[2] in (1, 2, 3, 5)
                assert packed[3:] == [0] * 5
                talents.append(dict(record=span(talent_row, 104), key=key, name=talent_name, icon=talent_icon,
                                    effects=effects(talent_row + 48), description=description,
                                    prerequisite_key_candidate=prerequisite, bytes_at_96=packed))
            tree_keys = {entry["key"]["text"] for entry in talents}
            assert all(entry["prerequisite_key_candidate"] is None or entry["prerequisite_key_candidate"]["text"] in tree_keys for entry in talents)
            trees.append(dict(record=span(tree_row, 64), name=name, background=background, icon=icon,
                              talent_slice=dict(**location(start), count=count, entry_stride_bytes=104), talents=talents))
        class_id = struct.unpack_from("<Q", data, row + 192)[0]
        assert class_id == (1, 2, 3, 4, 5, 7, 8, 9, 11)[i]
        talent_classes.append(dict(record=span(row, 200), class_key=class_key, class_id_at_192=class_id, trees=trees))

    result = dict(
        schema_version=1,
        artifact=dict(path=inventory.CANONICAL_ARTIFACT_PATH, size_bytes=len(data), sha256=hashlib.sha256(data).hexdigest()),
        method="Bounded static fixed-record pointer walks and crosschecks against exact embedded English catalog. No execution, MPQ reads or active REA session use.",
        limitations=["These are reconstructed record boundaries, not recovered Rust type declarations.",
                     "All numeric field roles below are candidates until native consumers establish their meaning and application.",
                     "Base definitions do not include every rank, talent, gear, class, enemy, school, modifier or random effect applied at runtime.",
                     "64-byte effect payloads are retained raw; their tag/payload unions are not fully decoded.",
                     "17 general amulets do not enumerate generated spell-specific legendary amulets."],
        tables=dict(abilities=dict(**location(0x66C9730), count=111, stride_bytes=120),
                    rings_and_trinkets=dict(**location(0x66CF140), count=22, stride_bytes=72),
                    general_amulets=dict(**location(0x66D03D8), count=17, stride_bytes=80),
                    talent_class_index=dict(**location(0x68A56D8), count=9, stride_bytes=200)),
        semantic_candidates=dict(ability_record={"48": "opaque tag slice, possibly permitted upgrade axes; not school text", "64": "spell ID", "68": "base effect magnitude", "72": "cooldown seconds", "76": "target range", "80": "area radius", "84": "target count", "88": "duration seconds"},
                                 jewelry_record={"64": "base effect magnitude", "68": "effect tag", "69": "slot tag,0 ring/1 trinket"},
                                 amulet_record={"64": "rarity tier", "72": "additional effect/proc tag"},
                                 talent_record={"96": "tree row", "97": "column", "98": "maximum rank", "80": "prerequisite key, required rank not decoded"},
                                 effect_record={"0": "effect/variant tag", "4": "first payload float, not universally a magnitude"}),
        abilities=abilities, rings_and_trinkets=jewelry, general_amulets=amulets, talent_classes=talent_classes)
    output = ROOT / "docs/analysis/evidence/mechanics-tables.json"
    output.write_text(json.dumps(result, indent=2, ensure_ascii=False, allow_nan=False) + "\n")
    print(json.dumps(dict(output=str(output.relative_to(ROOT)), abilities=len(abilities), rings_and_trinkets=len(jewelry),
                         general_amulets=len(amulets), talent_trees=sum(len(c["trees"]) for c in talent_classes),
                         talents=sum(len(tree["talents"]) for cls in talent_classes for tree in cls["trees"])), indent=2))


if __name__ == "__main__":
    main()
