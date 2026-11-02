#!/usr/bin/env python3
"""Recover selected-target PvP gear; source builds never require the EXE.

Stage data/evidence under runtime/pvp-gear-0.105.0. --write-assets updates only
the supplemental PvP/drop catalog. --fixtures replays the three native scaling
consumers with explicit allocation-free buffers and a roundf import seam.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import f32 as _shared_f32
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import re
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "runtime/pvp-gear-0.105.0"
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
ASSET = ROOT / "crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json"
CLASS_TABLE, PVP_TABLE = 0x146BBF2A8, 0x146BBF300
BASE, EXTRA, SCALE = 0x1471B5DFC, 0x1471B5E68, 0x145D9AF18
SCALERS = (0x1459B3920, 0x1459B3B60, 0x1459B3DA0)


def write(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(value, indent=2, ensure_ascii=False) + "\n")


def f32(value):
    return _shared_f32(value)


def load():
    data = TARGET.read_bytes()
    if hashlib.sha256(data).hexdigest() != SHA:
        raise SystemExit("Selected EXE SHA-256 mismatch")
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    return data, module.PE(data)


def recover(data, pe):
    def read(a, size):
        offset = pe.rva_offset(a - pe.image_base)
        result = data[offset:offset + size]
        assert len(result) == size
        return result

    def unpack(a, fmt):
        return struct.unpack(fmt, read(a, struct.calcsize(fmt)))

    def q(a):
        return unpack(a, "<Q")[0]

    def string(a):
        ptr, size = unpack(a, "<QQ")
        assert 0 < size < 4096
        return read(ptr, size).decode()

    spans = []

    def retain(role, a, size):
        spans.append(dict(role=role, virtual_address=hex(a),
                          file_offset=hex(pe.rva_offset(a - pe.image_base)), byte_count=size,
                          sha256=hashlib.sha256(read(a, size)).hexdigest()))

    def effects(a, count):
        return [unpack(a + i * 8, "<If") for i in range(count)]

    def scaled(rows, rarity, extra=False):
        factor = f32(scale * (extra_scale if extra else base_scale)[rarity])
        return [(tag, float(math.floor(f32(value * factor) + 0.5)) if tag == 2
                 else f32(value * factor)) for tag, value in rows]

    labels = None
    for match in re.finditer(rb'\{\r?\n  "game\.title":', data):
        candidate, _ = json.JSONDecoder().raw_decode(
            data[match.start():match.start() + 400000].decode(errors="replace"))
        if candidate.get("common.male") == "Male" and candidate.get("noun.plate.0") == "Helm":
            assert labels is None
            labels = candidate
    assert labels and labels["rarity.5"] == "PvP"
    base_scale, extra_scale = unpack(BASE, "<6f"), unpack(EXTRA, "<6f")
    scale = unpack(SCALE, "<f")[0]
    armor = [effects(a, n) for a, n in [(0x146BBDC8C, 2), (0x146BBDC9C, 2),
        (0x146BBDCAC, 2), (0x146BBDCBC, 2), (0x146BBDCCC, 2), (0x146BBDCDC, 1),
        (0x146BBDCE4, 1), (0x146BBDCEC, 3)]]
    extras = [effects(0x146BBDD04 + i * 16, 2) for i in range(8)]
    inventory = unpack(0x146BBDC64, "<8I")
    slots = list(read(0x146BBDC84, 8))
    ordinary = json.loads((ROOT / "crates/azeroth-survivors-re/assets/armory.json").read_text())
    classes, scaler_cases, unchanged = [], [], 0
    preview = {p["id"]: p for p in json.loads((ROOT / "crates/azeroth-survivors-re/assets/save-gear-0.97.2.json").read_text())["preview_items"]}
    for hero in ordinary["classes"]:
        cid = hero["id"]
        record, pvp = q(CLASS_TABLE + (cid - 1) * 8), q(PVP_TABLE + (cid - 1) * 8)
        material, stored = unpack(record + 296, "<BB")
        assert stored == cid
        weapon_count, pvp_count = q(record + 128), q(pvp + 40)
        assert weapon_count == pvp_count and weapon_count in (1, 2)
        retain(f"class-{cid}", record, 304)
        retain(f"pvp-{cid}", pvp, 120)
        retain(f"pvp-weapons-{cid}", q(pvp + 32), pvp_count * 48)
        items = []
        for slot in range(8 + pvp_count):
            if slot < 8:
                raw = armor[slot]
                names = [labels["item.name_prefix"].replace("{noun}", labels[f"noun.{hero['material'].lower()}.{slot}"]).replace("{set}", string(pvp + side * 16)) for side in range(2)]
                displays = [unpack(pvp + 48 + side * 32 + slot * 4, "<I")[0] or unpack(record + 232 + slot * 4, "<I")[0] for side in range(2)]
                metadata = dict(item_class=4, item_subclass=material,
                    inventory_type=20 if slot == 2 and material == 1 else inventory[slot], sheath=0,
                    slot_id=slots[slot], material=hero["material"])
            else:
                weapon = q(record + 120) + (slot - 8) * 144
                variant = q(pvp + 32) + (slot - 8) * 48
                retain(f"weapon-{cid}-{slot}", weapon, 144)
                raw = effects(q(weapon + 88), q(weapon + 96))
                names = [string(variant + side * 24 + 8) for side in range(2)]
                displays = [unpack(variant + side * 24, "<I")[0] for side in range(2)]
                ic, isc, it, sheath = unpack(weapon + 104, "<4I")
                metadata = dict(item_class=ic, item_subclass=isc, inventory_type=it,
                                sheath=sheath, slot_id=read(weapon + 140, 1)[0], material="")
            extra = extras[(cid * 3 + slot) % 8]
            merged = {}
            for tag, value in scaled(raw, 5) + scaled(extra, 5, True):
                merged[tag] = f32(merged.get(tag, 0.) + value)
            item_id = 100000 + cid * 1000 + slot * 100 + 50
            flavor_index = (cid * 3 + slot) % 8
            flavor_ptr = q(0x146BBE560 + flavor_index * 176 + (cid - 1) * 8)
            flavor_size = q(0x146BBE5B8 + flavor_index * 176 + (cid - 1) * 8)
            flavor = read(flavor_ptr, flavor_size).decode()
            retain(f"flavor-{cid}-{slot}", flavor_ptr, flavor_size)
            item = dict(id=item_id, slot=slot, rarity=5, name=names[0], display_id=displays[0],
                        **metadata, effects=[dict(tag=t, value=v) for t, v in merged.items()],
                        flavor=flavor, horde=dict(name=names[1], display_id=displays[1]))
            # Both faction IDs have the same numeric tier. Neither receives legendary extras.
            for side in range(2):
                old = preview[item_id + side * 10]
                assert (old["display_id"], old["inventory_type"]) == (displays[side], metadata["inventory_type"])
            items.append(item)
            scaler_cases += [dict(owner=hex(SCALERS[int(slot >= 8)]), rarity=5, rows=raw,
                                  expected=scaled(raw, 5)),
                             dict(owner=hex(SCALERS[2]), rarity=5, rows=extra,
                                  expected=scaled(extra, 5, True))]
        classes.append(dict(id=cid, items=items))
        for piece in hero["items"]:
            slot, rarity = piece["slot"], piece["rarity"]
            if slot < 8:
                raw = armor[slot]
            else:
                weapon = q(record + 120) + (slot - 8) * 144
                raw = effects(q(weapon + 88), q(weapon + 96))
            rows = scaled(raw, rarity)
            if rarity:
                rows += scaled(extras[(cid * 3 + slot) % 8], rarity, True)
                if rarity == 4:
                    rows.append((11, 1.) if slot >= 8 else (12, struct.unpack("<f", bytes.fromhex("31082c3d"))[0]))
            merged = {}
            for tag, value in rows:
                merged[tag] = f32(merged.get(tag, 0.) + value)
            assert piece["effects"] == [dict(tag=t, value=v) for t, v in merged.items()], piece["id"]
            unchanged += 1
    menu = json.loads((ROOT / "crates/azeroth-survivors-re/assets/menu.json").read_text())
    tiers, rates = unpack(0x146BB9780, "<12Q"), unpack(0x146BBA13C, "<6f")
    zones = []
    for i, zone in enumerate(menu["zones"]):
        at = 0x146BA9450 + i * 240
        assert string(at + 8) == zone["key"] and string(at + 24) == zone["name"]
        ptr, count = q(at + 136), q(at + 144)
        assert count == 5
        peers = [n for n, tier in enumerate(tiers) if tier == tiers[i]]
        ordinal = peers.index(i)
        bosses = []
        for b in range(5):
            assert string(ptr + b * 88) == zone["bosses"][b]["name"]
            final = read(ptr + b * 88 + 84, 1)[0]
            assert bool(final) == (b == 4)
            minute = unpack(ptr + b * 88 + 64, "<f")[0]
            assert minute == zone["bosses"][b]["minute"]
            bosses.append(dict(name=zone["bosses"][b]["name"], minute=minute,
                slots=[8, 9] if final else [slot for slot in range(8) if slot % (4 * len(peers)) == ordinal * 4 + b],
                final_boss=bool(final)))
        zones.append(dict(key=zone["key"], name=zone["name"], tier=tiers[i],
                          drop_percent=round(rates[tiers[i]] * 100), bosses=bosses))
        retain(f"zone-{zone['key']}", at, 240)
        retain(f"bosses-{zone['key']}", ptr, 5 * 88)
    for role, a, size in [("base-scale", BASE, 24), ("extra-scale", EXTRA, 24),
        ("global-scale", SCALE, 4), ("armor-effects", 0x146BBDC8C, 120),
        ("extra-effects", 0x146BBDD04, 128), ("zone-tiers", 0x146BB9780, 96),
        ("drop-rates", 0x146BBA13C, 24), ("collection-order", 0x145DB9360, 48)]:
        retain(role, a, size)
    order = list(unpack(0x145DB9360, "<6Q"))
    assert order == [0, 1, 2, 3, 5, 4]
    result = dict(version="0.105.0", target_sha256=SHA, classes=classes, zones=zones)
    evidence = dict(target=str(TARGET.relative_to(ROOT)), target_sha256=SHA, native_spans=spans,
        base_scale=base_scale, extra_scale=extra_scale, global_scale=scale, collection_order=order,
        pvp_piece_count=sum(len(c["items"]) for c in classes),
        ordinary_effects_unchanged=unchanged, faction_preview_records_unchanged=166,
        limits=["PvP names, appearance, numeric effects and twelve-zone drop mapping only.",
                "Ordinary item prose and starter outfits keep their historical provenance.",
                "Controlled original/rebuilt UI and gameplay comparisons are separate evidence."])
    return result, evidence, scaler_cases


def prepare(data, pe):
    """Prepare bounded native inputs/plans for the project's REA/Ghidra runner."""
    ends = {pe.image_base + a: pe.image_base + e for a, e, *_ in pe.functions()}
    groups = [
        ("gear", 0x1458BBDC0, 0x1458BEB00, [(0x1458BD6F0, "item-reader"),
         (0x1458BC2E0, "display-iterator"), (0x1458BBDC0, "drop-owner"),
         (0x1458BD600, "slot-exists")]),
        ("scaling", SCALERS[0], ends[SCALERS[-1]],
         list(zip(SCALERS, ["armor-scaling", "weapon-scaling", "extra-scaling"]))),
        ("collection", 0x1401DF3E0, ends[0x1401DF3E0], [(0x1401DF3E0, "collection")]),
        ("equipment-effects", 0x1458BEB10, ends[0x1458BEB10],
         [(0x1458BEB10, "equipment-effects")]),
    ]
    for name, start, end, operations in groups:
        offset = pe.rva_offset(start - pe.image_base)
        (WORK / f"{name}.bin").write_bytes(data[offset:offset + end - start])
        seeds = [a for a in ends if start <= a < end]
        if name == "gear":
            seeds.append(0x1458BEAD0)  # leaf PvP pointer lookup lacks an unwind row
        (WORK / f"{name}-seeds.tsv").write_text(
            "".join(f"{a:#x}\tfunction\n{a:#x}\tcode\n" for a in sorted(seeds)))
        write(WORK / f"{name}-plan.json", dict(target=f"runtime/pvp-gear-0.105.0/{name}.bin",
            output=f"runtime/pvp-gear-0.105.0/rea-{name}", init_timeout=60, timeout=240,
            environment={"REA_GHIDRA_SEED_FILE": f"runtime/pvp-gear-0.105.0/{name}-seeds.tsv"},
            open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
            operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(a)), label=role)
                        for a, role in operations]))
    owners = [(0x1458BD6F0, "item-reader"), (0x1458BBDC0, "drop-owner"),
              (0x1458BD260, "outfit-faction"), (0x1458BB9E0, "flavor"),
              (0x1458BEB10, "equipment-effects"),
              (0x1401DF3E0, "collection"), *zip(SCALERS, ["armor-scaling", "weapon-scaling", "extra-scaling"])]
    procedures = []
    for start, role in owners:
        end = ends[start]
        raw = data[pe.rva_offset(start - pe.image_base):pe.rva_offset(start - pe.image_base) + end - start]
        asm = objdump_output(["objdump", "-d", "--no-show-raw-insn",
            f"--start-address={start:#x}", f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
        (WORK / f"{role}.asm").write_text(asm)
        procedures.append(dict(role=role, start=hex(start), end_exclusive=hex(end),
            file_offset=hex(pe.rva_offset(start - pe.image_base)), byte_count=len(raw),
            sha256=hashlib.sha256(raw).hexdigest(), assembly=f"{role}.asm"))
    write(WORK / "procedures.json", dict(target_sha256=SHA, procedures=procedures,
        limitations=["Analyst-selected native raw slices keep original addresses.",
                     "Ghidra raw-slice imports, external data and indirect relation discovery are incomplete.",
                     "Scaling validation separately executes the original PE code and real jump/data tables."]))


def replay(data, pe, cases):
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_XMM0
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    for section in pe.sections:
        if section["name"] not in (".text", ".rdata"):
            continue
        size = (max(section["raw_size"], section["virtual_size"]) + 4095) & ~4095
        u.mem_map(pe.image_base + section["rva"], size)
        u.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(heap, 0x10000)
    u.mem_map(stack, 0x10000)
    u.mem_map(stop, 0x1000)
    ranges = [(pe.image_base + a, pe.image_base + e) for a, e, *_ in pe.functions() if pe.image_base + a in SCALERS]
    def hook(u, a, size, unused):
        if a == stop:
            u.emu_stop()
        elif a == 0x145BC97B1:
            bits = u.reg_read(UC_X86_REG_XMM0) & 0xFFFFFFFF
            value = struct.unpack("<f", struct.pack("<I", bits))[0]
            assert value >= 0 and math.isfinite(value)
            u.reg_write(UC_X86_REG_XMM0, struct.unpack("<I", struct.pack("<f", math.floor(value + 0.5)))[0])
            rsp = u.reg_read(UC_X86_REG_RSP)
            u.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", u.mem_read(rsp, 8))[0])
            u.reg_write(UC_X86_REG_RSP, rsp + 8)
        elif not any(start <= a < end for start, end in ranges):
            raise RuntimeError(f"Unreviewed instruction/call {a:#x}")
    u.hook_add(UC_HOOK_CODE, hook)
    for case in cases:
        source, out, target, rarity, raw = heap, heap + 0x100, heap + 0x200, heap + 0x300, heap + 0x400
        rows = case["rows"]
        u.mem_write(raw, b"".join(struct.pack("<If", *row) for row in rows))
        u.mem_write(source, struct.pack("<QQQ", raw, raw + len(rows) * 8, rarity))
        u.mem_write(out, struct.pack("<QQQ", target, 0, heap + 0x1000))
        u.mem_write(rarity, struct.pack("<Q", case["rarity"]))
        rsp = stack + 0x8008
        u.mem_write(rsp, struct.pack("<Q", stop))
        u.reg_write(UC_X86_REG_RSP, rsp)
        u.reg_write(UC_X86_REG_RCX, source)
        u.reg_write(UC_X86_REG_RDX, out)
        u.emu_start(int(case["owner"], 16), 0, count=10000)
        assert struct.unpack("<Q", u.mem_read(target, 8))[0] == len(rows)
        actual = [struct.unpack("<If", u.mem_read(heap + 0x1000 + i * 8, 8)) for i in range(len(rows))]
        assert actual == case["expected"], (case, actual)
    write(WORK / "native-scaling-validation.json", dict(target_sha256=SHA, passed=len(cases),
        method="Unchanged native scaling instruction replay with real tables and jump tables.",
        seams=["Preallocated sufficient vector capacity; no allocator or OS calls.",
               "roundf import supplied for finite nonnegative health; no device or game launched."]))
    print(f"Passed {len(cases)} native PvP scaling cases")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-assets", action="store_true")
    parser.add_argument("--fixtures", action="store_true")
    parser.add_argument("--prepare", action="store_true")
    args = parser.parse_args()
    data, pe = load()
    result, evidence, cases = recover(data, pe)
    write(WORK / "catalog.json", result)
    write(WORK / "data-evidence.json", evidence)
    if args.prepare:
        prepare(data, pe)
    if args.fixtures:
        replay(data, pe, cases)
    if args.write_assets:
        write(ASSET, result)
    print(f"Recovered {evidence['pvp_piece_count']} PvP pieces and 12 zone drop rows; "
          f"{evidence['ordinary_effects_unchanged']} ordinary effects and 166 previews unchanged")


if __name__ == "__main__":
    main()
