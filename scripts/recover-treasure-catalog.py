#!/usr/bin/env python3
"""Extract 0.100.1 zone/enemy chest records from the hash-verified target.

This saves textual original-byte provenance and optionally regenerates the Rust
catalog. The source build never reads the original EXE. REA/native consumer
interpretation belongs to the owning treasure-system research report.
"""
from script_sources import load_script

import argparse
import hashlib
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.100.1.exe"
SHA256 = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"
OUTPUT = ROOT / "docs/analysis/evidence/treasure-chests-comparison/catalog.json"
ZONE_BASE = 0x146733518
ZONE_STRIDE = 240
ZONE_COUNT = 12
ENEMY_STRIDE = 80


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-source-catalog", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    if hashlib.sha256(data).hexdigest() != SHA256:
        raise SystemExit("Wrong 0.100.1 analysis target hash")
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)

    def read(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + length]
        if len(raw) != length:
            raise ValueError("Truncated target span")
        return raw

    def span(address, length):
        raw = read(address, length)
        return dict(va=hex(address), rva=hex(address - pe.image_base),
                    file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=length, sha256=hashlib.sha256(raw).hexdigest(), hex=raw.hex())

    def string(address):
        pointer, length = struct.unpack("<QQ", read(address, 16))
        if not 0 < length < 1000:
            raise ValueError("Invalid target string length")
        return read(pointer, length).decode()

    zones = []
    for index in range(ZONE_COUNT):
        address = ZONE_BASE + index * ZONE_STRIDE
        enemy_pointer, enemy_count = struct.unpack("<QQ", read(address + 0x78, 16))
        if not 1 <= enemy_count <= 64:
            raise ValueError("Invalid target enemy count")
        enemies = []
        for j in range(enemy_count):
            enemy = enemy_pointer + j * ENEMY_STRIDE
            enemies.append(dict(index=j, id=struct.unpack("<I", read(enemy + 0x20, 4))[0],
                                name=string(enemy + 16), chest_flag=read(enemy + 0x4C, 1)[0],
                                base_experience=struct.unpack("<I", read(enemy + 0x40, 4))[0],
                                death_accumulator=struct.unpack("<f", read(enemy + 0x44, 4))[0],
                                record=span(enemy, ENEMY_STRIDE)))
        zones.append(dict(index=index, key=string(address + 8), name=string(address + 24),
                          record=span(address, ZONE_STRIDE),
                          center_xyz=list(struct.unpack("<3f", read(address + 0xC8, 12))),
                          radius=struct.unpack("<f", read(address + 0xD8, 4))[0],
                          enemy_table_va=hex(enemy_pointer), enemy_count=enemy_count,
                          enemy_definitions=enemies))
    enemy_total = sum(zone["enemy_count"] for zone in zones)
    flagged_total = sum(enemy["chest_flag"] != 0 for zone in zones for enemy in zone["enemy_definitions"])
    if enemy_total != 148 or flagged_total != 40:
        raise ValueError("Selected target catalog invariant changed")
    result = dict(
        version="0.100.1", target=str(TARGET.relative_to(ROOT)), target_sha256=SHA256,
        target_size=len(data), target_executed=False,
        method="Exact PE string/pointer/record reads; layouts confirmed by target native consumers.",
        zone_table_base=hex(ZONE_BASE), zone_stride=ZONE_STRIDE, enemy_stride=ENEMY_STRIDE,
        consumers={"placement": "0x1454d4b60", "shared_creation": "0x1454da2c0",
                   "enemy_death_flag_consumer": "0x1454d6d1c..0x1454d6e26"},
        zone_count=len(zones), enemy_count=enemy_total, chest_flagged_enemy_count=flagged_total,
        zones=zones,
        limitations=["Static records do not establish original/rebuilt runtime parity.",
                     "chest_flag is an interpreted field name; the authority is native byte +0x4c and its consumer.",
                     "Naxxramas has sixteen definitions, including four extra flag-one Horsemen; the other zones have twelve."],
    )
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT.write_text(json.dumps(result, indent=2, ensure_ascii=False) + "\n")
    if args.write_source_catalog:
        lines = ["//! Generated 0.100.1 zone geometry and enemy chest flags.",
                 "//! Owning byte spans: docs/analysis/evidence/treasure-chests-comparison/catalog.json.",
                 "//! Regenerate: python3 scripts/recover-treasure-catalog.py --write-source-catalog",
                 "//! The build uses these constants and never reads the reference executable.", "",
                 "use super::{EnemyDefinition, Position, ZoneDefinition};", "",
                 f"pub const ZONES: [ZoneDefinition; {len(zones)}] = ["]
        for zone in zones:
            coords = ", ".join(repr(float(value)) for value in zone["center_xyz"])
            lines.extend(["    ZoneDefinition {", f'        key: "{zone["key"]}",',
                          f"        center: Position::new({coords}),", f'        radius: {zone["radius"]!r},',
                          "        enemies: &["])
            for enemy in zone["enemy_definitions"]:
                lines.extend(["            EnemyDefinition {", f'                id: {enemy["id"]},',
                              f'                base_experience: {enemy["base_experience"]},',
                              f'                death_accumulator: {enemy["death_accumulator"]!r},',
                              f'                chest_flag: {enemy["chest_flag"]},',
                              f'            }}, // {enemy["name"]}'])
            lines.extend(["        ],", "    },"])
        lines.extend(["];", ""])
        (ROOT / "crates/azeroth-survivors-re/src/treasure_chests/catalog.rs").write_text("\n".join(lines))
    print(f"Verified {SHA256}; recovered {len(zones)} zones, {enemy_total} enemies, {flagged_total} chest flags.")


if __name__ == "__main__":
    main()
