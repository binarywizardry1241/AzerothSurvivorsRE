#!/usr/bin/env python3
"""Extract hash-bound 0.92 chest research evidence; never execute the game.

Uses only the standard library and installed objdump. REA/Ghidra dossier IDs
and interpretation are recorded separately in the owning research report.
"""
from portable_paths import objdump_output, portable_json

from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors.exe"
EXPECTED = "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"
OUTPUT = ROOT / "docs/analysis/evidence/0.92/treasure-chests"

# End addresses are exclusive. Focused tick extracts avoid retaining unrelated
# combat/ability code. Whole-function hashes below additionally bind the scopes.
RANGES = [
    ("constructor", 0x145472810, 0x145473B3D),
    ("run-init-chests", 0x145488C20, 0x145488C72),
    ("tick-clock-and-conditional-pickups", 0x145474190, 0x145474519),
    ("tick-chest-timer", 0x1454800E3, 0x14548021F),
    ("tick-walk-purchase", 0x14547C301, 0x14547C698),
    ("tick-companion-exclusion", 0x14547D360, 0x14547D63B),
    ("placement", 0x145497D00, 0x145498151),
    ("terrain-height-query", 0x1453F66F0, 0x1453F6902),
    ("random-range", 0x1454D71C0, 0x1454D733A),
    ("enemy-death-chest", 0x145499DF4, 0x145499F8D),
    ("shared-creation", 0x14549D330, 0x14549E3D7),
    ("purchase", 0x1454A81A0, 0x1454A853F),
    ("click-purchase", 0x145495820, 0x145495997),
    ("removal", 0x1454A5D50, 0x1454A5F6D),
    ("reward-completion-exclusion", 0x1454B0880, 0x1454B0E17),
    ("pause", 0x145487100, 0x14548724E),
    ("resume", 0x14548CE70, 0x14548CFBE),
    ("addon-export", 0x145461740, 0x145461842),
    ("addon-chest-iterator", 0x1454DC230, 0x1454DC5F8),
    ("generic-kind6-exclusion", 0x145496850, 0x145496956),
]
FUNCTIONS = [0x145472810, 0x145474190, 0x1454872D0, 0x145497D00,
             0x145498160, 0x14549D330, 0x1454A81A0, 0x145495820,
             0x1454A5D50, 0x1454B0880, 0x145461740, 0x1454DC230,
             0x1454D71C0, 0x1453F66F0, 0x1453E5B70]
CONSTANTS = [
    ("period_seconds", 0x145BB6854, 1),
    ("placement_min", 0x1458AB450, 1),
    ("placement_max", 0x145984440, 1),
    ("radius_adjustment", 0x1458B9C18, 1),
    ("minimum_clamp_radius", 0x1458A8420, 1),
    ("walk_range", 0x1458A85B0, 1),
    ("click_range", 0x1458A85D0, 1),
    ("height_difference_limit", 0x1459D9F98, 1),
    ("angle_upper_bound", 0x1458BF680, 1),
    ("price_multiplier", 0x146AAECB8, 1),
    ("price_addend", 0x1458B9AA0, 1),
    ("failure_message_interval", 0x1458AB3DC, 1),
    ("conditional_pickup_period", 0x1458A8320, 1),
    ("enemy_chest_offset", 0x146AAEC70, 2),
]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-source-catalog", action="store_true",
                        help="also regenerate the source-only Rust zone/enemy constants")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    actual = hashlib.sha256(data).hexdigest()
    if actual != EXPECTED:
        raise SystemExit(f"Wrong analysis target: {actual}")
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)

    def read(address, length):
        start = pe.rva_offset(address - pe.image_base)
        return data[start:start + length]

    def span(address, length, include_hex=True):
        raw = read(address, length)
        assert len(raw) == length
        result = dict(va=hex(address), rva=hex(address - pe.image_base),
                      file_offset=hex(pe.rva_offset(address - pe.image_base)),
                      byte_count=length, sha256=hashlib.sha256(raw).hexdigest())
        if include_hex:
            result["hex"] = raw.hex()
        return result

    def string(address):
        pointer, length = struct.unpack("<QQ", read(address, 16))
        return read(pointer, length).decode()

    OUTPUT.mkdir(parents=True, exist_ok=True)
    extents = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    functions = [{**span(a, extents[a] - a, False), "end_exclusive": hex(extents[a]),
                  "boundary_source": "original PE RUNTIME_FUNCTION entry"} for a in FUNCTIONS]
    assembly = []
    for label, start, end in RANGES:
        text = objdump_output([
            "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
            f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT)),
        ], cwd=ROOT, text=True)
        path = OUTPUT / f"{label}.asm"
        path.write_text(text)
        assembly.append({"label": label, **span(start, end - start, False),
                         "end_exclusive": hex(end), "assembly": path.name,
                         "assembly_sha256": hashlib.sha256(text.encode()).hexdigest()})
    constants = [{"role": role, **span(a, n * 4),
                  "f32": list(struct.unpack("<" + "f" * n, read(a, n * 4)))}
                 for role, a, n in CONSTANTS]
    zones = []
    for i in range(9):
        address = 0x1466D2A10 + i * 184
        enemy_pointer, enemy_count = struct.unpack("<QQ", read(address + 64, 16))
        enemies = []
        definitions = []
        for j in range(enemy_count):
            enemy = enemy_pointer + j * 80
            flag = read(enemy + 0x4C, 1)[0]
            definitions.append(dict(id=struct.unpack("<I", read(enemy + 0x20, 4))[0],
                                    name=string(enemy + 16), chest_flag=flag))
            if flag:
                enemies.append(dict(index=j, name=string(enemy + 16), flag=flag,
                                    record=span(enemy, 80)))
        zones.append(dict(index=i, key=string(address), name=string(address + 16),
                          record=span(address, 184),
                          center_xyz=list(struct.unpack("<3f", read(address + 0x90, 12))),
                          radius=struct.unpack("<f", read(address + 0xA0, 4))[0],
                          enemy_table=span(enemy_pointer, enemy_count * 80, False),
                          enemy_count=enemy_count, enemy_definitions=definitions,
                          chest_flagged_enemies=enemies))
    table = 0x146AB13A4
    dispatch = [{"kind": i, "target_va": hex(table + struct.unpack("<i", read(table + i * 4, 4))[0])}
                for i in range(7)]
    assert dispatch[2]["target_va"] == "0x14549d44f"
    assert sum(len(z["chest_flagged_enemies"]) for z in zones) == 27
    assert all(z["enemy_count"] == 12 for z in zones)
    assert constants[0]["f32"] == [70.0]
    result = dict(
        date="2026-10-18", target=str(TARGET.relative_to(ROOT)), version="0.92.0",
        target_sha256=actual, target_size=len(data), image_base=hex(pe.image_base),
        method="Exact original PE bytes, unwind extents, pointer-table reads and bounded objdump disassembly. Interpretation is tied to REA/Ghidra dossiers in rea-provenance.json and the owning report.",
        target_executed=False, functions=functions, assembly=assembly, constants=constants,
        pickup_switch={**span(table, 28), "entries": dispatch}, zones=zones,
        limits=["Static evidence is not original-runtime or rebuilt parity verification.",
                "Enemy byte +0x4c semantics are established by the native death consumer; source field names are not recovered.",
                "Function byte hashes bind full bodies; focused disassembly intervals do not imply complete call-graph coverage.",
                "The different Windows EXE hash supplied in chat was not inspected by this extractor."])
    (OUTPUT / "manifest.json").write_text(portable_json(result, indent=2) + "\n")
    if args.write_source_catalog:
        lines = ["//! Generated 0.92 zone geometry and enemy chest flags.",
                 "//! Owning byte spans: docs/analysis/evidence/0.92/treasure-chests/manifest.json.",
                 "//! Regenerate: python3 scripts/recover-treasure-chests.py --write-source-catalog",
                 "//! The build uses these constants and never reads the reference executable.",
                 "", "use super::{EnemyDefinition, Position, ZoneDefinition};", "",
                 "pub const ZONES: [ZoneDefinition; 9] = ["]
        for zone in zones:
            coords = ", ".join(repr(float(value)) for value in zone["center_xyz"])
            lines.extend(["    ZoneDefinition {", f'        key: "{zone["key"]}",',
                          f"        center: Position::new({coords}),",
                          f'        radius: {zone["radius"]!r},', "        enemies: &["])
            for enemy in zone["enemy_definitions"]:
                lines.append(f'            EnemyDefinition {{ id: {enemy["id"]}, chest_flag: {enemy["chest_flag"]} }}, // {enemy["name"]}')
            lines.extend(["        ],", "    },"])
        lines.extend(["];", ""])
        source = ROOT / "crates/azeroth-survivors-re/src/treasure_chests/catalog.rs"
        source.write_text("\n".join(lines))
        print("Regenerated source catalog from original PE bytes; format catalog.rs with project rustfmt.")
    print(f"Verified {actual}; saved {len(functions)} function hashes, {len(assembly)} disassemblies, "
          f"{len(constants)} constant spans, 9 zones and 27 chest-dropping definitions.")


if __name__ == "__main__":
    main()
