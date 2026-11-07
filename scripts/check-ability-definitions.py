#!/usr/bin/env python3
"""Compare all fields of the 113 selected 0.109.0 ordinary ability records.

Static PE data/source comparison only. Status-tag translations retain the
source's intentional historical representation. Gameplay consumers are separate.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, file_sha256, json_text, latest_target, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
TABLE = 0x146BE1C18
SOURCE = "crates/azeroth-survivors-re/src/player_abilities/catalog.rs"
OUTPUT = ROOT / "docs/analysis/evidence/ability-definitions.json"


def number(value):
    match = re.fullmatch(r"f32::from_bits\((0x[0-9a-fA-F_]+)\)", value.strip())
    return int(match[1].replace("_", ""), 16) if match else struct.unpack("<I", struct.pack("<f", float(value)))[0]


def check():
    target = latest_target()
    if target["sha256"] != SHA:
        raise ValueError("This table's address/layout is specific to the registered 0.109.0 hash")
    data = target_bytes(target)
    module = load_script("ability_pe", ROOT / "scripts/inventory-current-target.py")
    pe = module.pe_parser(data)
    spans = {}

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        if size and pe.rva_offset(address - pe.image_base + size - 1) != at + size - 1:
            raise ValueError("Non-contiguous ability data mapping")
        value = data[at:at + size]
        if len(value) != size:
            raise ValueError("Truncated ability data")
        if size:
            spans[(address, size)] = {"va": hex(address), "file_offset": hex(at), "byte_count": size,
                                      "sha256": hashlib.sha256(value).hexdigest()}
        return value

    def pair(address):
        pointer, size = struct.unpack("<QQ", raw(address, 16))
        if size > 10000:
            raise ValueError("Unreviewed string/list size")
        return pointer, size

    def text(address):
        return raw(*pair(address)).decode()

    source = (ROOT / SOURCE).read_text()
    chunks = re.findall(r"AbilityDefinition \{(.*?)\n    \},", source.split(
        "pub static ABILITIES:", 1)[1].split("pub static CLASSES:", 1)[0], re.S)
    if len(chunks) != 113:
        raise ValueError("Reviewed ability record count changed")
    mismatches, translations = [], []
    # The table/identity lead is independently used by the current addon API
    # metadata checker; this audit extends it to every gameplay definition field.
    table_bytes = raw(TABLE, 113 * 120)
    fields = {64: "spell_id", 68: "base_power", 72: "base_cooldown", 76: "range",
              80: "radius", 84: "targets", 88: "duration", 92: "ticks",
              96: "projectile_speed", 100: "pulse_spell_id"}
    for index, chunk in enumerate(chunks):
        address = TABLE + index * 120
        key = text(address)

        def compare(field, expected, actual):
            if expected != actual:
                mismatches.append({"key": key, "field": field, "source": expected, "native": actual})

        for offset, field in ((0, "key"), (16, "name"), (32, "icon")):
            compare(field, json.loads(re.search(r"\b" + field + r':\s*("[^"]+")', chunk)[1]), text(address + offset))
        for offset, field in fields.items():
            value = re.search(r"\b" + field + r":\s*([^,]+)", chunk)[1]
            compare(field, int(value) if offset in (64, 84, 92, 100) else number(value),
                    struct.unpack("<I", raw(address + offset, 4))[0])
        for offset, field in ((116, "school"), (117, "kind")):
            compare(field, int(re.search(r"\b" + field + r":\s*(\d+)", chunk)[1]), raw(address + offset, 1)[0])
        source_upgrades = [int(v) for v in re.search(r"upgrade_types:\s*&\[([^]]*)", chunk)[1].split(",") if v.strip()]
        compare("upgrade_types", source_upgrades, list(raw(*pair(address + 48))))
        native = list(struct.unpack("<III", raw(address + 104, 12)))
        translated = {11: 10, 12: 11, 13: 12}.get(native[0], native[0])
        if translated != native[0]:
            translations.append({"key": key, "native_tag": native[0], "source_tag": translated})
        native[0] = translated
        status = re.search(r"effect:\s*StatusEffect\s*\{\s*tag:\s*(\d+),\s*value:\s*([^,]+),\s*duration:\s*([^}]+)", chunk)
        compare("effect", [int(status[1]), number(status[2]), number(status[3])], native)
    if mismatches:
        raise ValueError(json.dumps(mismatches, indent=2))
    # Keep maximal ranges so the whole table replaces its nested field spans.
    ordered = sorted(spans)
    maximal = [spans[(a, n)] for a, n in ordered if not any(
        b <= a and a + n <= b + m and (b, m) != (a, n) for b, m in ordered)]
    return {"target": {k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
            "generator": {"path": "scripts/check-ability-definitions.py", "sha256": file_sha256(ROOT / "scripts/check-ability-definitions.py")},
            "generator_dependencies": [{"path": name, "sha256": file_sha256(ROOT / name)} for name in
                ("scripts/coverage_common.py", "scripts/inventory-current-target.py", "scripts/inventory-executable.py")],
            "source": {"path": SOURCE, "sha256": file_sha256(ROOT / SOURCE)},
            "table": {"va": hex(TABLE), "byte_count": len(table_bytes), "stride": 120, "records": 113},
            "ranges": maximal, "status_tag_translations": translations,
            "mismatches": 0, "gameplay_consumers_verified": False, "parity_verified": False,
            "limits": ["Names, icons, ordered upgrade types, all numeric/status fields, school and cast kind are compared as exact values/bits.",
                       "The recovered 113-record table is the scope; arbitrary other records and producer/consumer behavior are not certified.",
                       "No compilation, source execution, game launch, live memory or original/rebuilt comparison occurred."]}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    result = check()
    if args.write:
        OUTPUT.write_text(json_text(result))
    elif not OUTPUT.exists() or json.loads(OUTPUT.read_text()) != result:
        raise SystemExit("Ability definition proof is absent/stale; review it, then use --write")
    print("PASS: 113 selected 0.109.0 ability definitions, all fields; gameplay consumers and parity remain unverified")
