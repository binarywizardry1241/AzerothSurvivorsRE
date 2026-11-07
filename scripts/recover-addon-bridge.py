#!/usr/bin/env python3
"""Stage selected 0.105.0 addon list producers for static REA/Ghidra recovery.

All fresh extracts stay in ignored runtime/. No compilation or game execution.
The selected EXE is optional analysis input, never a source-build dependency.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import struct

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/addon/addon-bridge/c88825b8ee6e/lists"
OWNERS = {
    "buffs": 0x1458EC060,
    "lairs": 0x1458EC180,
    "units": 0x1458EC620,
    "chests": 0x1458EC850,
    "spells": 0x1458EC990,
    "debuffs": 0x1458ECF10,
    "bosses": 0x1458EDCF0,
}
STAGES = {
    "lists": OWNERS,
    "list-leaves": {
        "buff_rows": 0x14599A240, "unit_filter": 0x14599CF60,
        "unit_rows": 0x1459A7230, "chest_rows": 0x14599A570,
        "spell_rows": 0x1459A73B0, "debuff_filter": 0x14599D110,
        "boss_rows": 0x1459B14E0, "debuff_timing": 0x1458DF590,
        "application_count": 0x1458DF730, "map_bounds": 0x1458EDED0,
    },
    "list-formats": {
        "units_format": 0x1459AFF60, "spells_format": 0x1458B93A0,
        "unit_sort": 0x14597D600,
    },
}


def metadata(pe, data):
    def read(address, size):
        at = pe.rva_offset(address - pe.image_base)
        return data[at:at + size]

    def string(address):
        pointer, size = struct.unpack("<QQ", read(address, 16))
        assert size < 2000
        return read(pointer, size).decode()

    zones = []
    for index in range(12):
        address = 0x146BA9450 + index * 240
        bosses = struct.unpack("<Q", read(address + 0x88, 8))[0]
        row = dict(key=string(address + 8), name=string(address + 24),
                   subtitle=string(address + 40),
                   map_id=struct.unpack("<I", read(address + 0xC0, 4))[0],
                   area_id=struct.unpack("<I", read(address + 0xC4, 4))[0],
                   center=list(struct.unpack("<2f", read(address + 0xC8, 8))),
                   difficulty_f32=struct.unpack("<f", read(address + 0xE0, 4))[0], bosses=[])
        for slot in range(5):
            boss = bosses + slot * 88
            row["bosses"].append(dict(id=struct.unpack("<I", read(boss + 48, 4))[0],
                name=string(boss), at_minutes_f32=struct.unpack("<f", read(boss + 64, 4))[0],
                final=bool(read(boss + 84, 1)[0])))
        zones.append(row)
    spells = []
    #1458ecf10's unrolled lookup checks18 complete six-record groups then
    #five final records. This is API metadata, not a replacement combat table.
    for index in range(113):
        address = 0x146BACAD8 + index * 120
        spells.append(dict(key=string(address), name=string(address + 16),
                           icon=string(address + 32),
                           spell=struct.unpack("<I", read(address + 64, 4))[0]))
    return {"addon-zones-0.105.0.json": zones, "addon-spell-metadata-0.105.0.json": spells}


def check(pe, data):
    for name, expected in metadata(pe, data).items():
        actual = json.loads((ROOT / "crates/azeroth-survivors-re/assets" / name).read_text())
        assert actual == expected, name
    retained = ROOT / "docs/analysis/evidence/addon-bridge/lists"
    manifest = json.loads((retained / "manifest.json").read_text())
    assert manifest["target_sha256"] == SHA
    for row in manifest["native_ranges"]:
        at, size = int(row["file_offset"], 16), row["byte_count"]
        assert pe.offset_va(at) == int(row["virtual_address"], 16), row["role"]
        assert hashlib.sha256(data[at:at + size]).hexdigest() == row["sha256"], row["role"]
        for key in ("assembly", "pseudocode"):
            if key in row:
                path = (retained / row[key]).resolve()
                assert path.is_relative_to(ROOT)
                assert hashlib.sha256(path.read_bytes()).hexdigest() == row[key + "_sha256"]
    print("Verified selected EXE,12zone/60boss/113spell API records and retained addon list evidence; no game execution")


def write(path, value):
    path.write_text(portable_json(value, indent=2) + "\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rea", action="store_true", help="run static Ghidra queries")
    parser.add_argument("--check", action="store_true", help="verify retained evidence and application metadata")
    parser.add_argument("--stage", choices=STAGES, default="lists")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected target SHA-256 mismatch"
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    if args.check:
        check(pe, data)
        return
    owners = STAGES[args.stage]
    work = WORK.parent / args.stage
    extents = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    extents[0x1458DF590] = 0x1458DF730
    work.mkdir(parents=True, exist_ok=True)
    records = []
    for name, address in owners.items():
        end = extents[address]
        at = pe.rva_offset(address - pe.image_base)
        raw = data[at:at + end - address]
        records.append(dict(role=name, virtual_address=hex(address), end_exclusive=hex(end),
                            file_offset=hex(at), byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest(),
                            extent_source="selected leaf span before next PE exception function" if name == "debuff_timing" else "PE exception extent"))
        (work / (name + ".asm")).write_text(objdump_output([
            "objdump", "-d", "--no-show-raw-insn", f"--start-address={address:#x}",
            f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True))
    for name, value in metadata(pe, data).items():
        write(work / name, value)
    start, end = min(owners.values()), max(extents[a] for a in owners.values())
    at = pe.rva_offset(start - pe.image_base)
    target = work / "list-producers.bin"
    # Sparse carrier preserves original addresses without including unrelated
    #functions between selected leaves. Gaps are zero, never claimed as target bytes.
    carrier = bytearray(end - start)
    for address in owners.values():
        at = pe.rva_offset(address - pe.image_base)
        carrier[address-start:extents[address]-start] = data[at:at+extents[address]-address]
    target.write_bytes(carrier)
    seeds = work / "list-producers-seeds.tsv"
    seeds.write_text("".join(f"{address:#x}\tfunction\n{address:#x}\tcode\n" for address in owners.values()))
    manifest = dict(target_sha256=SHA, native_ranges=records,
                    limits=["Static original-byte slices; not original or rebuilt game execution.",
                            "Raw Ghidra import omits external data/callees and uses generic ABI inference."])
    manifest["sparse_carrier_sha256"] = hashlib.sha256(carrier).hexdigest()
    manifest["limits"].append("Sparse carrier gaps are zero; they are not target bytes.")
    write(work / "manifest.json", manifest)
    plan = dict(target=str(target.relative_to(ROOT)), output=str((work / "rea-lists").relative_to(ROOT)),
                init_timeout=60, timeout=240,
                environment={"REA_GHIDRA_SEED_FILE": str(seeds.relative_to(ROOT))},
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(address)), label=name)
                            for name, address in owners.items()])
    write(work / "plan.json", plan)
    if args.rea:
        subprocess.run([sys.executable, str(ROOT / "scripts/rea-batch.py"), str(work / "plan.json")],
                       cwd=ROOT, check=True)
    print(f"Verified {SHA}; staged {len(records)} addon list owners; game not executed")


if __name__ == "__main__":
    main()
