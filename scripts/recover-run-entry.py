#!/usr/bin/env python3
"""Recover run-entry scalar/table inputs from the hash-bound current PE.

The owning current constructor/stat/XP assembly is retained alongside these
records. This performs static reads, without launching the target executable.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import f32 as _shared_f32
from script_sources import load_script
import hashlib
import json
import math
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.100.1.exe"
SHA = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"
OUT = ROOT / "docs/analysis/evidence/0.100.1/run-effects"
ASSET = ROOT / "crates/azeroth-survivors-re/assets/run-entry-0.100.1.json"
module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
data = TARGET.read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
pe = module.PE(data)
records = []

def read(va, size):
    at = pe.rva_offset(va - pe.image_base)
    result = data[at:at + size]
    assert len(result) == size
    return result

def span(va, size, role):
    raw = read(va, size)
    records.append({"role": role, "address": hex(va), "byte_count": size,
                    "file_offset": hex(pe.rva_offset(va - pe.image_base)),
                    "sha256": hashlib.sha256(raw).hexdigest()})
    return raw

def string(va):
    pointer, length = struct.unpack("<QQ", read(va, 16))
    assert 0 < length < 1000
    return read(pointer, length).decode()

def floats(va, count=1):
    return list(struct.unpack("<" + "f" * count, read(va, count * 4)))

def f32(value):
    return _shared_f32(value)

zones = []
for index in range(12):
    va = 0x146733518 + index * 240
    span(va, 240, f"zone{index}")
    zones.append({"key": string(va + 8), "map_id": struct.unpack("<I", read(va + 0xC0, 4))[0],
                  "spawn": floats(va + 0xC8, 3), "facing": floats(va + 0xD4)[0],
                  "radius": floats(va + 0xD8)[0]})
classes = []
for class_id in [1, 2, 3, 4, 5, 7, 8, 9, 11]:
    va = 0x146735848 if class_id == 1 else struct.unpack("<Q", read(0x1469f84c0 + (class_id - 2) * 8, 8))[0]
    span(va, 144, f"class{class_id}")
    classes.append({"id": class_id, "key": string(va + 16), "base_health": floats(va + 128)[0],
                    "armor_fraction": floats(va + 132)[0], "leech": floats(va + 136)[0]})
races = []
fields = {0: "health_multiplier", 1: "damage_bonus", 2: "cooldown_divisor", 3: "move_bonus",
          4: "crit_bonus", 5: "armor_bonus", 6: "regeneration_bonus", 7: "pickup_multiplier",
          8: "experience_multiplier", 9: "gold_multiplier", 10: "luck_bonus", 11: "heal_on_kill"}
for native_id, key in enumerate(["human", "orc", "dwarf", "nightelf", "scourge", "tauren", "gnome", "troll"], 1):
    va = 0x1467346d8 if native_id == 1 else struct.unpack("<Q", read(0x1469f8488 + (native_id - 2) * 8, 8))[0]
    span(va, 88, f"race{native_id}")
    values = {"native_id": native_id, "key": key, "racial_ability_key": string(va + 48),
              "faction_template": 1 if native_id == 1 else struct.unpack("<I", read(0x1469f8550 + (native_id - 2) * 4, 4))[0]}
    values.update({field: 1.0 if field in ["health_multiplier", "cooldown_divisor", "pickup_multiplier", "experience_multiplier", "gold_multiplier"] else 0.0 for field in fields.values()})
    pointer, count = struct.unpack("<QQ", read(va + 32, 16))
    for index in range(count):
        tag, amount = struct.unpack("<If", read(pointer + index * 8, 8))
        values[fields[tag]] = f32(values[fields[tag]] + amount)
    span(pointer, count * 8, f"race{native_id}-effects")
    races.append(values)
zoom = floats(0x145a14d10)[0]
yaw, pitch = floats(0x145a14c80, 2)
asset = {"target_sha256": SHA, "provenance": "docs/analysis/run-effects-progression-0.100.1.md",
         "zones": zones, "classes": classes, "races": races,
         "player": {"move_speed": floats(0x145915874)[0], "critical_chance": floats(0x1459158a0)[0],
                    "critical_multiplier": floats(0x1459132f4)[0], "damage_multiplier": 1.0,
                    "cooldown_multiplier": 1.0, "pickup_radius": floats(0x14593f7c0)[0],
                    "pickup_other_radius": floats(0x1459132fc)[0],
                    "armor_by_class": {row["key"]: row["armor_fraction"] for row in classes},
                    "camera_offset": [-zoom * math.cos(pitch) * math.cos(yaw), -zoom * math.cos(pitch) * math.sin(yaw), -zoom * math.sin(pitch)],
                    "camera_target_height": 0.0},
         "xp": {"quadratic": floats(0x145907518)[0], "linear": floats(0x145907508)[0],
                "base": floats(0x145918840)[0], "maximum_level": 99, "rounding": "roundf"},
         "camera_semantics": "Current default zoom15/yaw0/pitch-.5 only; full native controller, pivot, input and collision require separate runtime verification."}
OUT.mkdir(parents=True, exist_ok=True)
ASSET.write_text(portable_json(asset, indent=2) + "\n")
for role, start, end in [("xp-threshold", 0x1454c6a59, 0x1454c6b38),
                         ("collected-xp", 0x1454b7716, 0x1454b7761),
                         ("collected-gold", 0x1454b7a03, 0x1454b7a52),
                         ("faction-table-consumer", 0x1454a2e06, 0x1454a2e2d),
                         ("camera-defaults", 0x14084b718, 0x14084b950)]:
    span(start, end - start, role)
    (OUT / f"{role}.asm").write_text(objdump_output(["objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}", f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True))
imports = []
for group in pe.imports():
    for index, name in enumerate(group["functions"]):
        at = int(group["iat_start_address"], 16) + index * 8
        if at in [0x145904408, 0x145904428, 0x145904448]:
            imports.append({"address": hex(at), "name": name, "module": group["library"]})
constants = []
for va, count in [(0x145915874, 1), (0x1459158a0, 1), (0x1459132f4, 1),
                  (0x14593f7c0, 1), (0x1459132fc, 1), (0x145907518, 1),
                  (0x145907508, 1), (0x145918840, 1), (0x145a14d10, 4),
                  (0x145a14c80, 2), (0x14590751c, 1)]:
    raw = span(va, count * 4, "scalar-or-camera-constant")
    constants.append({"address": hex(va), "bits": list(struct.unpack("<" + "I" * count, raw)),
                      "values": list(struct.unpack("<" + "f" * count, raw))})
report = {"target_sha256": SHA, "target_executed": False,
          "method": "Current PE tables, constructor1454ad570/stat-refresh1454a6a40 and exact original assembly/import bindings; no historical addresses reused.",
          "asset": str(ASSET.relative_to(ROOT)), "records": records, "imports": imports, "constants": constants,
          "limitations": ["Static recovery, not a runtime parity claim.", "The camera vector is only the default boom; source controller behavior remains separately tested."]}
(OUT / "entry-inputs.json").write_text(portable_json(report, indent=2) + "\n")
print("Recovered12 zones,9 class baselines,8 races and current scalar/default/XP inputs")
