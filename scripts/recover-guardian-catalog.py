#!/usr/bin/env python3
"""Recover the selected 0.97.2 guardian inputs from exact PE bytes.

This reads the current target only. It never executes the reference application.
Guardian slots select underlying enemy definitions at runtime; the table at
zone+0x78 is therefore recorded as enemies, not renamed to a guardian table.
The boss schedule supplies the time/health interpolation knots used by guardian
scaling. Original names and most Rust field names are not present in the EXE.
"""
from portable_paths import objdump_output, portable_json

import argparse
import hashlib
import importlib.util
import json
import math
from pathlib import Path
import struct
import subprocess


ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
EXPECTED_SHA256 = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
OUTPUT = ROOT / "docs/analysis/evidence/guardians"
SOURCE = ROOT / "crates/azeroth-survivors-re/src/guardians/catalog.rs"
ZONE_TABLE = 0x146716438
ZONE_STRIDE = 0xF0
ZONE_KEYS = ("elwynn", "duskwood", "wsg", "ungoro", "ab", "feralas",
             "arena", "sm", "av", "brm", "aq", "naxx")
CODE_RANGES = (
    ("zone-lookup", 0x14540E820, 0x14540E96F),
    ("guardian-health-knots", 0x14552B760, 0x14552B88D),
    ("guardian-label-enemy-lookup", 0x1454A9F24, 0x1454AA00C),
    ("enemy-spawn-definition", 0x1454C2219, 0x1454C2252),
    ("enemy-spawn-fields", 0x1454C24F8, 0x1454C2594),
    ("guardian-health-definition", 0x1454EFA30, 0x1454EFA97),
    ("guardian-health-base", 0x1454EFB77, 0x1454EFB8A),
    ("guardian-damage-base", 0x1454EFE18, 0x1454EFE71),
)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-source-catalog", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if digest != EXPECTED_SHA256:
        raise SystemExit(f"Wrong selected reference SHA-256: {digest}")
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)

    def read(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        result = data[offset:offset + length]
        assert len(result) == length
        return result

    def span(address, length):
        raw = read(address, length)
        return dict(va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=length, sha256=hashlib.sha256(raw).hexdigest(), hex=raw.hex())

    def string(address):
        pointer, length = struct.unpack("<QQ", read(address, 16))
        assert length < 4096
        return dict(pointer=hex(pointer), length=length, text=read(pointer, length).decode("utf-8"),
                    bytes=span(pointer, length))

    def u32(address):
        return struct.unpack("<I", read(address, 4))[0]

    def f32(address):
        return struct.unpack("<f", read(address, 4))[0]

    zones = []
    for index, expected_key in enumerate(ZONE_KEYS):
        address = ZONE_TABLE + ZONE_STRIDE * index
        key, name = string(address + 8), string(address + 24)
        assert key["text"] == expected_key
        enemy_pointer, enemy_count = struct.unpack("<QQ", read(address + 0x78, 16))
        boss_pointer, boss_count = struct.unpack("<QQ", read(address + 0x88, 16))
        point_pointer, point_count = struct.unpack("<QQ", read(address + 0x38, 16))
        index_pointer, index_count = struct.unpack("<QQ", read(address + 0x48, 16))
        assert enemy_count == (16 if expected_key == "naxx" else 12)
        assert boss_count == 5
        assert point_count <= 4 and index_count <= 4
        guardian_points = [dict(index=struct.unpack("<Q", read(point_pointer + j * 16, 8))[0],
                                xy=list(struct.unpack("<2f", read(point_pointer + j * 16 + 8, 8))),
                                record=span(point_pointer + j * 16, 16)) for j in range(point_count)]
        guardian_enemy_indices = [struct.unpack("<Q", read(index_pointer + j * 8, 8))[0]
                                  for j in range(index_count)]
        enemies = []
        for enemy_index in range(enemy_count):
            at = enemy_pointer + 80 * enemy_index
            enemies.append(dict(
                index=enemy_index, record=span(at, 80), name=string(at + 16),
                id=u32(at + 0x20), model_id=u32(at + 0x24), scale=f32(at + 0x28),
                raw_cast_words=list(struct.unpack("<4I", read(at, 16))),
                raw_2c=u32(at + 0x2C), base_hp=f32(at + 0x30), base_damage=f32(at + 0x34),
                raw_38=f32(at + 0x38), raw_3c=f32(at + 0x3C), raw_40=u32(at + 0x40),
                raw_44=f32(at + 0x44), raw_48=f32(at + 0x48), flag_4c=read(at + 0x4C, 1)[0],
                trailing_bytes=read(at + 0x4D, 3).hex()))
        bosses, knots = [], []
        for boss_index in range(boss_count):
            at = boss_pointer + 88 * boss_index
            ability_pointer, ability_count = struct.unpack("<QQ", read(at + 16, 16))
            assert ability_count <= 32
            abilities = [dict(index=j, record=span(ability_pointer + 28 * j, 28),
                              raw_words=list(struct.unpack("<7I", read(ability_pointer + 28 * j, 28))))
                         for j in range(ability_count)]
            boss = dict(index=boss_index, record=span(at, 88), name=string(at), yell=string(at + 32),
                        id=u32(at + 0x30), model_id=u32(at + 0x34), scale=f32(at + 0x38),
                        raw_3c=u32(at + 0x3C), time_minutes=f32(at + 0x40), base_hp=f32(at + 0x44),
                        base_damage=f32(at + 0x48), raw_4c=f32(at + 0x4C), raw_50=u32(at + 0x50),
                        flag_54=read(at + 0x54, 1)[0], trailing_bytes=read(at + 0x55, 3).hex(),
                        ability_pointer=hex(ability_pointer), abilities=abilities)
            bosses.append(boss)
            if boss["flag_54"] != 1:
                knots.append(dict(time_minutes=boss["time_minutes"], base_hp=boss["base_hp"],
                                  boss_index=boss_index, record_va=hex(at + 0x40)))
        assert len(knots) == 4
        zones.append(dict(index=index, record=span(address, ZONE_STRIDE), key=key, name=name,
                          center_xyz=list(struct.unpack("<3f", read(address + 0xC8, 12))),
                          radius=f32(address + 0xD8), scalar_e0=f32(address + 0xE0),
                          guardian_radius=f32(address + 4) if u32(address) else None,
                          placement_angle=f32(address + 0xD4), guardian_points=guardian_points,
                          guardian_enemy_indices=guardian_enemy_indices,
                          enemies=enemies, bosses=bosses, hp_knots=knots))

    OUTPUT.mkdir(parents=True, exist_ok=True)
    assembly = []
    for label, start, end in CODE_RANGES:
        output = objdump_output([
            "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
            f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
        path = OUTPUT / f"{label}.asm"
        path.write_text(output)
        assembly.append(dict(label=label, **span(start, end - start), end_exclusive=hex(end),
                             assembly=path.name, assembly_sha256=hashlib.sha256(output.encode()).hexdigest()))
    report = dict(
        date="2026-10-18", target=str(TARGET.relative_to(ROOT)), target_version="0.97.2",
        target_sha256=digest, target_size=len(data), target_executed=False,
        method="Exact SHA-256 checked original PE table reads plus bounded original objdump instructions; no game execution.",
        zone_count=len(zones), enemy_count=sum(len(z["enemies"]) for z in zones),
        boss_count=sum(len(z["bosses"]) for z in zones),
        health_knot_count=sum(len(z["hp_knots"]) for z in zones),
        zone_table=span(ZONE_TABLE, len(zones) * ZONE_STRIDE),
        native_zone_lookup=dict(function="0x14540e820", unknown_key_index=0,
                                address_function="0x14540e950", stride=ZONE_STRIDE),
        field_evidence={
            "enemy_name_id": "Guardian label 1454a9f58..1454a9fb2 reads record+20 id and record+10/+18 name.",
            "enemy_model_scale": "Entity creation caller1454c24f8..1454c252a passes record+24 model and record+28 scale.",
            "guardian_base_hp": "1454efb77..1454efb83 reads selected enemy record+30.",
            "guardian_base_damage": "1454efe4d..1454efe59 reads selected enemy record+34.",
            "boss_hp_knots": "1454efa7f..1454efa92 passes boss-table start and start+1b8. 14552b760 skips record byte+54==1 and copies +40/+44 time/HP pairs.",
            "enemy_cast": "Raw first16 bytes retained; variant and semantic interpretation belong to guardian actor reconstruction.",
            "raw_fields": "Offsets named raw retain their exact source values without assigning unrecovered original field names.",
            "guardian_placement": "Run initializer1454b07c0 reads zone+38/+40 as keyed16-byte XY points, +48/+50 as naxx enemy indexes, +0/+4 as radius override, and +d4 as placement angle. Its REA dossier and interpretation are owned by guardian AI recovery.",
        },
        assembly=assembly, zones=zones,
        limitations=[
            "These are current target data and instruction consumers, not an independent runtime parity check.",
            "Underlying enemies and boss schedules are different source records; guardian slots select enemy indexes at runtime.",
            "Keyed guardian XY points are provided only where present in the selected table. Missing slots use the separately recovered terrain-aware placement algorithm.",
            "Raw field names intentionally do not assert semantic meanings or native Rust type names.",
            "The normal source build uses generated constants and never requires the reference EXE.",
        ])
    def json_floats(value):
        if isinstance(value, float) and not math.isfinite(value):
            return {"nonfinite_f32_bits": f"0x{struct.unpack('<I', struct.pack('<f', value))[0]:08x}"}
        if isinstance(value, dict):
            return {key: json_floats(item) for key, item in value.items()}
        if isinstance(value, list):
            return [json_floats(item) for item in value]
        return value

    (OUTPUT / "guardian-catalog.json").write_text(portable_json(json_floats(report), indent=2, allow_nan=False) + "\n")
    if args.write_source_catalog:
        write_source(zones)
    print(json.dumps({k: report[k] for k in ("target_version", "zone_count", "enemy_count", "boss_count", "health_knot_count")}))


def write_source(zones):
    def rs(value):
        return json.dumps(value, ensure_ascii=False)

    def fp(value):
        return f"f32::from_bits(0x{struct.unpack('<I', struct.pack('<f', value))[0]:08x})"

    lines = [
        "//! Generated guardian inputs from the selected 0.97.2 executable.",
        "//! SHA-256 a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589.",
        "//! Evidence: docs/analysis/evidence/guardians/guardian-catalog.json.",
        "//! Regenerate: python3 scripts/recover-guardian-catalog.py --write-source-catalog.",
        "//! Raw offset names intentionally retain unresolved semantics. These are",
        "//! semantic source records, not declarations of the native in-memory ABI.",
        "", "#[derive(Clone, Copy, Debug)]", "pub struct EnemyDefinition {",
        "    pub id: u32,", "    pub name: &'static str,", "    pub model_id: u32,", "    pub scale: f32,",
        "    pub raw_cast: [u32; 4],", "    pub raw_2c: u32,", "    pub base_hp: f32,", "    pub base_damage: f32,",
        "    pub raw_38: f32,", "    pub raw_3c: f32,", "    pub raw_40: u32,", "    pub raw_44: f32,",
        "    pub raw_48: f32,", "    pub flag_4c: u8,", "}", "",
        "/// Original boss ability record: seven exact 32-bit words, stride 28.",
        "#[derive(Clone, Copy, Debug)]", "pub struct RawBossAbility { pub words: [u32; 7] }", "",
        "#[derive(Clone, Copy, Debug)]", "pub struct BossDefinition {",
        "    pub id: u32,", "    pub name: &'static str,", "    pub yell: &'static str,", "    pub model_id: u32,",
        "    pub scale: f32,", "    pub raw_3c: u32,", "    pub time_minutes: f32,", "    pub base_hp: f32,",
        "    pub base_damage: f32,", "    pub raw_4c: f32,", "    pub raw_50: u32,", "    pub flag_54: u8,",
        "    pub abilities: &'static [RawBossAbility],", "}", "",
        "/// Time/HP pairs copied by native14552b760; final-flag1 rows are skipped.",
        "#[derive(Clone, Copy, Debug, PartialEq)]", "pub struct HealthKnot { pub time_minutes: f32, pub base_hp: f32 }", "",
        "#[derive(Clone, Copy, Debug, PartialEq)]", "pub struct GuardianPoint { pub index: usize, pub xy: [f32; 2] }", "",
        "#[derive(Clone, Copy, Debug)]", "pub struct ZoneDefinition {",
        "    pub key: &'static str,", "    pub name: &'static str,", "    pub center: [f32; 3],", "    pub radius: f32,",
        "    pub scalar_e0: f32,", "    pub enemies: &'static [EnemyDefinition],",
        "    pub bosses: &'static [BossDefinition],", "    pub hp_knots: &'static [HealthKnot],",
        "    pub guardian_radius: Option<f32>,", "    pub placement_angle: f32,",
        "    pub guardian_points: &'static [GuardianPoint],", "    pub guardian_enemy_indices: &'static [usize],", "}", "",
        "impl ZoneDefinition {",
        "    pub fn by_key(key: &str) -> Option<&'static Self> { ZONES.iter().find(|zone| zone.key == key) }",
        "}", "",
    ]
    for zone in zones:
        key = zone["key"]["text"].upper()
        lines.append(f"static {key}_ENEMIES: &[EnemyDefinition] = &[")
        for enemy in zone["enemies"]:
            fields = [f"id: {enemy['id']}", f"name: {rs(enemy['name']['text'])}", f"model_id: {enemy['model_id']}",
                      f"scale: {fp(enemy['scale'])}", "raw_cast: [" + ", ".join(f"0x{x:08x}" for x in enemy["raw_cast_words"]) + "]",
                      f"raw_2c: {enemy['raw_2c']}"]
            fields.extend(f"{field}: {fp(enemy[field])}" for field in ("base_hp", "base_damage", "raw_38", "raw_3c"))
            fields.append(f"raw_40: {enemy['raw_40']}")
            fields.extend(f"{field}: {fp(enemy[field])}" for field in ("raw_44", "raw_48"))
            fields.append(f"flag_4c: {enemy['flag_4c']}")
            lines.append("    EnemyDefinition { " + ", ".join(fields) + " },")
        lines.extend(["];", "", f"static {key}_BOSSES: &[BossDefinition] = &["])
        for boss in zone["bosses"]:
            fields = [f"id: {boss['id']}", f"name: {rs(boss['name']['text'])}", f"yell: {rs(boss['yell']['text'])}",
                      f"model_id: {boss['model_id']}", f"scale: {fp(boss['scale'])}", f"raw_3c: {boss['raw_3c']}"]
            fields.extend(f"{field}: {fp(boss[field])}" for field in ("time_minutes", "base_hp", "base_damage", "raw_4c"))
            fields.extend([f"raw_50: {boss['raw_50']}", f"flag_54: {boss['flag_54']}"])
            abilities = ["RawBossAbility { words: [" + ", ".join(f"0x{x:08x}" for x in ability["raw_words"]) + "] }"
                         for ability in boss["abilities"]]
            fields.append("abilities: &[" + ", ".join(abilities) + "]")
            lines.append("    BossDefinition { " + ", ".join(fields) + " },")
        lines.extend(["];", "", f"static {key}_HP_KNOTS: &[HealthKnot] = &["])
        lines.extend(f"    HealthKnot {{ time_minutes: {fp(k['time_minutes'])}, base_hp: {fp(k['base_hp'])} }},"
                     for k in zone["hp_knots"])
        lines.extend(["];", ""])
    lines.append("pub static ZONES: &[ZoneDefinition] = &[")
    for zone in zones:
        key = zone["key"]["text"].upper()
        fields = [f"key: {rs(zone['key']['text'])}", f"name: {rs(zone['name']['text'])}",
                  "center: [" + ", ".join(fp(x) for x in zone["center_xyz"]) + "]",
                  f"radius: {fp(zone['radius'])}", f"scalar_e0: {fp(zone['scalar_e0'])}",
                  f"enemies: {key}_ENEMIES", f"bosses: {key}_BOSSES", f"hp_knots: {key}_HP_KNOTS",
                  "guardian_radius: " + (f"Some({fp(zone['guardian_radius'])})" if zone["guardian_radius"] is not None else "None"),
                  f"placement_angle: {fp(zone['placement_angle'])}",
                  "guardian_points: &[" + ", ".join("GuardianPoint { index: " + str(p["index"]) + ", xy: [" + ", ".join(fp(x) for x in p["xy"]) + "] }" for p in zone["guardian_points"]) + "]",
                  "guardian_enemy_indices: &[" + ", ".join(str(i) for i in zone["guardian_enemy_indices"]) + "]"]
        lines.append("    ZoneDefinition { " + ", ".join(fields) + " },")
    lines.append("];")
    SOURCE.parent.mkdir(parents=True, exist_ok=True)
    SOURCE.write_text("\n".join(lines) + "\n")


if __name__ == "__main__":
    main()
