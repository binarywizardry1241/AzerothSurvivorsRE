#!/usr/bin/env python3
"""Recover 0.105.0 Rewards records/labels after checking the selected EXE hash.

Output stays in runtime/rewards-menu-0.105.0; --write-assets applies only the
selected Rewards records/labels. No compilation or application is run.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "runtime/rewards-menu-0.105.0"
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
PERKS, COMPANIONS, TABARDS = 0x145DBA1B8, 0x145DBBE98, 0x145DBC598


def write(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n")


def load():
    data = TARGET.read_bytes()
    if hashlib.sha256(data).hexdigest() != SHA:
        raise SystemExit("Selected EXE SHA-256 mismatch")
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    return data, module.PE(data)


def recover_data(data, pe, update):
    def offset(a):
        return pe.rva_offset(a - pe.image_base)

    def string(a):
        ptr, size = struct.unpack_from("<QQ", data, offset(a))
        if not ptr:
            assert size == 0
            return None
        assert size < 10000
        return data[offset(ptr):offset(ptr) + size].decode()

    def span(a, size):
        raw = data[offset(a):offset(a) + size]
        return dict(virtual_address=hex(a), file_offset=hex(offset(a)), byte_count=size,
                    sha256=hashlib.sha256(raw).hexdigest())

    perks, companions, tabards = [], [], []
    for i in range(13):
        a = PERKS + i * 120
        costs, count = struct.unpack_from("<QQ", data, offset(a + 48))
        descriptions, count2 = struct.unpack_from("<QQ", data, offset(a + 64))
        assert count == count2 and 1 <= count <= 3
        perks.append(dict(key=string(a), name=string(a + 16), icon=string(a + 32),
                          costs=list(struct.unpack_from("<" + "I" * count, data, offset(costs))),
                          descriptions=[string(descriptions + j * 16) for j in range(count)],
                          achievement=string(a + 80), prerequisite=string(a + 96),
                          category=data[offset(a + 112)]))
    for i in range(13):
        a = COMPANIONS + i * 96
        display, scale, creature = struct.unpack_from("<IfI", data, offset(a + 80))
        companions.append(dict(key=string(a), name=string(a + 16), model=string(a + 32),
                               icon=string(a + 48), achievement=string(a + 64),
                               display_id=display, scale=scale, creature_id=creature))
    name_address = 0x146BC16B8
    assert data[offset(name_address):offset(name_address) + 4] == b"no u"
    assert companions[-1]["key"] == "sapphiron" and companions[-1]["achievement"] == "feat:nou"
    companions[-1]["achievement_name"] = "no u"
    for i in range(20):
        a = TABARDS + i * 64
        item, display, cost = struct.unpack_from("<III", data, offset(a + 48))
        tabards.append(dict(id=item, name=string(a), icon=string(a + 16), zone=string(a + 32),
                            display_id=display, cost=cost))
    keys = ["Unsaved changes", "You have changed your perks or tabards without confirming. Confirm the changes before you go?",
            "Discard", "Keep editing", "Sapphiron", "no u"]
    keys += [text for perk in perks for text in perk["descriptions"]]
    locales = []
    for match in re.finditer(rb'\{\r?\n  "game\.title":', data):
        at = match.start()
        va = pe.offset_va(at)
        needle = struct.pack("<Q", va)
        descriptor = data.find(needle)
        assert descriptor >= 32 and data.find(needle, descriptor + 1) == -1
        size = struct.unpack_from("<Q", data, descriptor + 8)[0]
        assert 10000 < size < 1000000
        payload = data[at:at + size]
        catalog = json.loads(payload)
        code = string(pe.offset_va(descriptor - 32))
        assert len(code) == 2 and all(k in catalog for k in keys)
        selected = {key: catalog[key] for key in keys}
        locales.append(dict(code=code, descriptor_virtual_address=hex(pe.offset_va(descriptor - 32)),
                            catalog=span(va, size), labels=selected))
        if update:
            path = ROOT / "crates/azeroth-survivors-re/assets/locales" / f"{code}.json"
            previous = json.loads(path.read_text())
            previous.update(selected)
            write(path, previous)
    assert len(locales) == 14
    report = dict(target_sha256=SHA, perks=perks, companions=companions, tabards=tabards,
                  tables=[span(PERKS, 13 * 120), span(COMPANIONS, 13 * 96), span(TABARDS, 20 * 64)],
                  unlock_name=span(name_address, 4), locales=locales,
                  limitations=["Rewards records/labels only; achievement grants and companion gameplay are outside this extraction."])
    write(WORK / "data-evidence.json", report)
    if update:
        path = ROOT / "crates/azeroth-survivors-re/assets/progression.json"
        previous = json.loads(path.read_text())
        previous.update(perks=perks, companions=companions, tabards=tabards)
        write(path, previous)
    print("Verified13 perks,13 looks,20 tabards and selected labels in14 native catalogs")



def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-assets", action="store_true")
    args = parser.parse_args()
    WORK.mkdir(parents=True, exist_ok=True)
    data, pe = load()
    recover_data(data, pe, args.write_assets)


if __name__ == "__main__":
    main()
