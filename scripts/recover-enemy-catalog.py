#!/usr/bin/env python3
"""Recover the 0.97.2 enemy catalog from the SHA-bound selected PE.

The generated Rust source is portable and never reads the EXE at build/runtime.
This script performs static reads only. Native analysis uses scripts/rea-batch.py
and unchanged, PE-function-bound slices with their original virtual addresses.
"""
from portable_paths import portable_json

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA256 = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
OUTPUT = ROOT / "docs/analysis/evidence/0.97.2/enemies"
SOURCE = ROOT / "crates/azeroth-survivors-re/src/enemies/catalog.rs"
RUNTIME = ROOT / "runtime/analysis/history/native-recovery/enemies-catalog/cb147ed49eac"
ZONE_TABLE, ZONE_STRIDE, ENEMY_STRIDE = 0x146716438, 240, 80
ZONE_KEYS = ("elwynn", "duskwood", "wsg", "ungoro", "ab", "feralas",
             "arena", "sm", "av", "brm", "aq", "naxx")
NATIVE_FUNCTIONS = (0x14540E950,)


def inspect_current_catalog(output, selected_names=()):
    """Locate the existing twelve-zone layout by all keys, then retain its rows.

    This is table/data evidence. Native constructors must separately establish
    the scale/reach consumers before any current gameplay contract is claimed.
    """
    from coverage_common import latest_target, target_bytes
    target = latest_target(verify=True)
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)

    def read(va, count):
        at = pe.rva_offset(va - pe.image_base)
        result = data[at:at + count]
        if len(result) != count:
            raise ValueError("Truncated mapped catalog range")
        return result

    def span(va, count):
        raw = read(va, count)
        return dict(virtual_address=hex(va), file_offset=hex(pe.rva_offset(va - pe.image_base)),
                    byte_count=count, sha256=hashlib.sha256(raw).hexdigest(), hex=raw.hex())

    def text(va):
        pointer, size = struct.unpack("<QQ", read(va, 16))
        if not 0 < size < 4096:
            raise ValueError("Invalid catalog string length")
        return read(pointer, size).decode("utf-8")

    candidates = set()
    cursor = 0
    while (at := data.find(b"elwynn", cursor)) >= 0:
        cursor = at + 1
        va = pe.offset_va(at)
        if va is None:
            continue
        needle = struct.pack("<QQ", va, 6)
        descriptor = 0
        while (found := data.find(needle, descriptor)) >= 0:
            descriptor = found + 1
            base = pe.offset_va(found)
            if base is None:
                continue
            base -= 8
            for stride in (240, 248, 256):
                try:
                    if all(text(base + index * stride + 8) == key for index, key in enumerate(ZONE_KEYS)):
                        candidates.add((base, stride))
                except (ValueError, UnicodeDecodeError, struct.error):
                    pass
    if len(candidates) != 1:
        raise ValueError(f"Expected one twelve-zone table, found {sorted(candidates)}")
    table, stride = candidates.pop()
    zones = []
    for index, key in enumerate(ZONE_KEYS):
        address = table + index * stride
        zone = dict(key=key, record=span(address, stride))
        for kind, offset, row_stride, name_offset, id_offset, scale_offset in (
                ("enemies", 0x78, 80, 16, 32, 40),
                ("bosses", 0x88, 104, 0, 64, 72)):
            pointer, count = struct.unpack("<QQ", read(address + offset, 16))
            if not 0 < count <= 32:
                raise ValueError(f"Invalid {kind} slice count: {key}/{count}")
            rows = []
            for n in range(count):
                row = pointer + n * row_stride
                try:
                    name = text(row + name_offset)
                except (ValueError, UnicodeDecodeError, struct.error) as error:
                    raise ValueError(f"{key}/{kind}/{n} at {row:#x} (table {table:#x}, stride {stride}): {read(row, row_stride).hex()}") from error
                if selected_names and name not in selected_names:
                    continue
                rows.append(dict(name=name, id=struct.unpack("<I", read(row + id_offset, 4))[0],
                                 scale_bits=struct.unpack("<I", read(row + scale_offset, 4))[0],
                                 id_offset=id_offset, scale_offset=scale_offset,
                                 record=span(row, row_stride)))
            zone[kind] = rows
        zones.append(zone)
    result = dict(target=target, target_executed=False, zone_table=span(table, len(ZONE_KEYS) * stride),
                  zone_stride=stride, zones=zones,
                  limits=["Current strings, slices and exact bytes; native constructors separately own field meaning and reach."])
    path = (ROOT / output).resolve()
    if not path.is_relative_to(ROOT / "runtime"):
        raise ValueError("Current catalog staging must stay under project runtime")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(result, indent=2) + "\n")
    print(f"Current catalog at {table:#x}, {stride}-byte zones; staged {path.relative_to(ROOT)}")


def current_size_source(contract_path, apply):
    """Check/apply only explicitly selected, target-bound creature scales."""
    from coverage_common import latest_target, target_bytes
    contract = json.loads((ROOT / contract_path).read_text())
    target = latest_target(verify=True)
    assert target['sha256'] == contract['target']['sha256']
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    assert {row['name'] for row in contract['entries']} == set(contract['selected_names'])
    assert len({(row['kind'], row['id']) for row in contract['entries']}) == len(contract['entries'])
    table = contract['zone_table']
    at = int(table['file_offset'], 0)
    assert hashlib.sha256(data[at:at + table['byte_count']]).hexdigest() == table['sha256']
    for row in contract['entries']:
        native = row['record']
        offset, size = int(native['file_offset'], 0), native['byte_count']
        raw = data[offset:offset + size]
        assert hashlib.sha256(raw).hexdigest() == native['sha256']
        assert bytes.fromhex(native['hex']) == raw
        assert struct.unpack_from('<I', raw, row['scale_offset'])[0] == row['scale_bits']
        assert struct.unpack_from('<I', raw, row['id_offset'])[0] == row['id']
        pointer, length = struct.unpack_from('<QQ', raw, 0 if row['kind'] == 'bosses' else 16)
        at = pe.rva_offset(pointer - pe.image_base)
        assert data[at:at + length].decode('utf-8') == row['name']
    for relative in ('enemies/catalog.rs', 'guardians/catalog.rs'):
        path = ROOT / 'crates/azeroth-survivors-re/src' / relative
        source = path.read_text()
        seen = set()
        for row in contract['entries']:
            if relative == 'enemies/catalog.rs' and row['kind'] != 'enemies':
                continue
            pattern = (r'((?:Enemy|Boss)Definition \{\s+id: ' + str(row['id']) +
                       r',\s+name: ' + re.escape(json.dumps(row['name'])) +
                       r'.*?\bscale: f32::from_bits\()0x([0-9a-f]+)(\))')
            matches = list(re.finditer(pattern, source, re.S))
            assert len(matches) == 1, (relative, row['name'], len(matches))
            match = matches[0]
            if apply:
                source = source[:match.start(2)] + f"{row['scale_bits']:08x}" + source[match.end(2):]
            else:
                assert int(match[2], 16) == row['scale_bits'], (relative, row['name'])
            seen.add(row['id'])
        if apply:
            path.write_text(source)
        print(f'{"Updated" if apply else "Checked"} {len(seen)} selected creature scales in {relative}')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--check", action="store_true", help="compare generated source/data without writes")
    mode.add_argument("--prepare-native", action="store_true", help="prepare a REA plan and native slice")
    mode.add_argument("--collect-native", action="store_true", help="retain completed native REA evidence")
    mode.add_argument("--inspect-current", metavar="OUTPUT", help="Stage current catalog data without changing source")
    mode.add_argument("--size-contract", metavar="INPUT", help="Check selected current size records against source")
    parser.add_argument("--apply-sizes", action="store_true", help="Apply the selected --size-contract scale fields")
    parser.add_argument("--name", action="append", default=[], help="Select a name in --inspect-current; repeat")
    args = parser.parse_args()
    if args.inspect_current:
        inspect_current_catalog(args.inspect_current, args.name)
        return
    if args.size_contract:
        current_size_source(args.size_contract, args.apply_sizes)
        return
    if args.apply_sizes:
        parser.error('--apply-sizes requires --size-contract')
    data = TARGET.read_bytes()
    actual = hashlib.sha256(data).hexdigest()
    if actual != SHA256:
        raise SystemExit(f"0.97.2 target SHA-256 mismatch: {actual}")
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)

    def read(va, count):
        at = pe.rva_offset(va - pe.image_base)
        result = data[at:at + count]
        assert len(result) == count
        return result

    def span(va, count):
        raw = read(va, count)
        return dict(va=hex(va), file_offset=hex(pe.rva_offset(va - pe.image_base)),
                    byte_count=count, sha256=hashlib.sha256(raw).hexdigest(), hex=raw.hex())

    def string(va):
        ptr, length = struct.unpack("<QQ", read(va, 16))
        assert 0 < length < 4096
        return dict(text=read(ptr, length).decode("utf-8"), source=span(ptr, length))

    def word(va):
        return struct.unpack("<I", read(va, 4))[0]

    if args.prepare_native or args.collect_native:
        extents = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
        RUNTIME.mkdir(parents=True, exist_ok=True)
        analyses = []
        for start in NATIVE_FUNCTIONS:
            end = extents[start]
            original = span(start, end - start)
            original.update(end_exclusive=hex(end), boundary_source="selected PE RUNTIME_FUNCTION")
            path = RUNTIME / f"{start:x}.bin"
            if args.prepare_native:
                path.write_bytes(read(start, end - start))
                plan = dict(target=str(path.relative_to(ROOT)),
                            output=f"runtime/analysis/history/native-recovery/enemies-catalog/cb147ed49eac/rea-{start:x}",
                            open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                            timeout=180, open_timeout=60,
                            operations=[dict(name="analyze_function", arguments=dict(procedure=hex(start)))])
                (RUNTIME / f"plan-{start:x}.json").write_text(portable_json(plan, indent=2) + "\n")
            else:
                record = json.loads((RUNTIME / f"rea-{start:x}/003-analyze_function.json").read_text())
                evidence = record["response"]["result"]["structuredContent"]
                assert evidence["subject"]["digest"]["sha256"] == original["sha256"]
                assert evidence["provider"]["id"] == "ghidra"
                analyses.append(dict(original_bytes=original, rea_evidence=evidence))
        if args.collect_native:
            OUTPUT.mkdir(parents=True, exist_ok=True)
            (OUTPUT / "catalog-native.json").write_text(portable_json(dict(
                target=str(TARGET.relative_to(ROOT)), target_sha256=SHA256,
                target_executed=False, analyses=analyses,
                limitations=["Static native analysis is not runtime parity.",
                             "Raw slices omit referenced callees/data and use a generic compiler specification; Windows x64 instructions govern."]
            ), indent=2) + "\n")
        print("Prepared native REA plan" if args.prepare_native else "Collected SHA-bound native REA evidence")
        return

    zones = []
    ids = set()
    for index, key in enumerate(ZONE_KEYS):
        at = ZONE_TABLE + index * ZONE_STRIDE
        key_record = string(at + 8)
        assert key_record["text"] == key
        ptr, count = struct.unpack("<QQ", read(at + 0x78, 16))
        assert count == (16 if key == "naxx" else 12)
        enemies = []
        for enemy_index in range(count):
            row = ptr + enemy_index * ENEMY_STRIDE
            words = struct.unpack("<20I", read(row, ENEMY_STRIDE))
            assert words[8] not in ids
            ids.add(words[8])
            enemies.append(dict(index=enemy_index, record=span(row, ENEMY_STRIDE),
                                name=string(row + 0x10), id=words[8], model_id=words[9],
                                words=list(words), flag_4c=read(row + 0x4c, 1)[0]))
        zones.append(dict(index=index, record=span(at, ZONE_STRIDE), key=key_record,
                          name=string(at + 24), center_bits=[word(at + 0xc8 + i * 4) for i in range(3)],
                          radius_bits=word(at + 0xd8), scalar_e0_bits=word(at + 0xe0),
                          enemy_slice=dict(va=hex(ptr), count=count, stride=ENEMY_STRIDE), enemies=enemies))
    report = dict(schema_version=1, date="2026-10-18", target_version="0.97.2",
                  target=str(TARGET.relative_to(ROOT)), target_sha256=SHA256,
                  target_size=len(data), target_executed=False,
                  method="Exact selected-PE bytes decoded through checked Rust strings and slices; floats retained as unsigned IEEE754 bits.",
                  zone_table=span(ZONE_TABLE, len(zones) * ZONE_STRIDE),
                  zone_count=len(zones), enemy_count=sum(len(z["enemies"]) for z in zones),
                  field_offsets={"raw_cast": "0x00..0x10", "name": "0x10", "id": "0x20", "model_id": "0x24",
                                 "scale": "0x28", "raw_2c": "0x2c", "base_hp": "0x30", "base_damage": "0x34",
                                 "raw_38": "0x38", "raw_3c": "0x3c", "raw_40": "0x40", "raw_44": "0x44",
                                 "raw_48": "0x48", "flag_4c": "0x4c"},
                  zones=zones, limitations=[
                      "148 definitions include finite-time elite entries and four positive-infinity Naxxramas entries; this catalog alone does not schedule any spawn.",
                      "Boss records, guardian placement, terrain, rendering, spell effects and full gameplay integration are separate owners.",
                      "Raw field names preserve unresolved semantics; a source table does not establish in-game parity.",
                      "The generated Rust source requires neither the EXE nor bundled MPQs to build."])
    source = source_text(zones)
    payloads = {SOURCE: source, OUTPUT / "catalog.json": json.dumps(report, indent=2) + "\n"}
    for path, text in payloads.items():
        if args.check:
            if path.read_text() != text:
                raise SystemExit(f"Generated file differs: {path.relative_to(ROOT)}")
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
    print(f"{'Checked' if args.check else 'Recovered'} {len(zones)} zones / {len(ids)} enemy definitions")


def source_text(zones):
    def fp(bits):
        return f"f32::from_bits(0x{bits:08x})"
    lines = [
        "//! Selected 0.97.2 enemy definitions recovered from original PE bytes.",
        f"//! SHA-256 {SHA256}.",
        "//! Evidence: docs/analysis/evidence/0.97.2/enemies/catalog.json.",
        "//! Regenerate: python3 scripts/recover-enemy-catalog.py.",
        "//! These semantic source records do not declare the native memory ABI.",
        "//! Raw field names retain offsets whose full meanings remain unrecovered.",
        "", "#[derive(Clone, Copy, Debug)]", "pub struct EnemyDefinition {",
        "    pub id: u32,", "    pub name: &'static str,", "    pub model_id: u32,", "    pub scale: f32,",
        "    pub raw_cast: [u32; 4],", "    pub raw_2c: u32,", "    pub base_hp: f32,", "    pub base_damage: f32,",
        "    pub raw_38: f32,", "    pub raw_3c: f32,", "    pub raw_40: u32,", "    pub raw_44: f32,",
        "    pub raw_48: f32,", "    pub flag_4c: u8,", "}", "",
        "/// Tag-1 source attack, read by the ordinary actor cast branch.",
        "#[derive(Clone, Copy, Debug, PartialEq)]", "pub struct SpellAttack {",
        "    pub spell_id: u32,", "    pub range: f32,", "    pub cast_seconds: f32,", "}", "",
        "impl EnemyDefinition {",
        "    /// Other tags remain available in raw_cast; this does not invent an attack for them.",
        "    pub fn spell_attack(&self) -> Option<SpellAttack> {",
        "        (self.raw_cast[0] == 1).then(|| SpellAttack {",
        "            spell_id: self.raw_cast[1],", "            range: f32::from_bits(self.raw_cast[2]),",
        "            cast_seconds: f32::from_bits(self.raw_cast[3]),", "        })", "    }",
        "    /// Record+0x38, copied into the actor's attack interval.",
        "    pub fn attack_interval(&self) -> f32 {", "        self.raw_38", "    }",
        "    /// Record+0x3c; creation applies the active speed-percent modifier separately.",
        "    pub fn movement_speed(&self) -> f32 {", "        self.raw_3c", "    }",
        "    /// Record+0x48, compared to elapsed run minutes by the ordinary spawn selector.",
        "    pub fn spawn_minute(&self) -> f32 {", "        self.raw_48", "    }",
        "    /// Record+0x44, the selector's inverse weight and spawn-budget cost.",
        "    pub fn spawn_cost(&self) -> f32 {", "        self.raw_44", "    }", "}", "",
        "#[derive(Clone, Copy, Debug)]", "pub struct ZoneDefinition {",
        "    pub key: &'static str,", "    pub name: &'static str,", "    pub center: [f32; 3],",
        "    pub radius: f32,", "    pub scalar_e0: f32,", "    pub enemies: &'static [EnemyDefinition],", "}", "",
        "impl ZoneDefinition {",
        "    /// Exact catalog lookup; callers choose how to handle an unknown key.",
        "    pub fn by_key(key: &str) -> Option<&'static Self> {", "        ZONES.iter().find(|zone| zone.key == key)", "    }",
        "    pub fn enemy_by_id(&self, id: u32) -> Option<&'static EnemyDefinition> {",
        "        self.enemies.iter().find(|enemy| enemy.id == id)", "    }", "}", "",
    ]
    for zone in zones:
        key = zone["key"]["text"].upper()
        lines.append(f"static {key}_ENEMIES: &[EnemyDefinition] = &[")
        for enemy in zone["enemies"]:
            w = enemy["words"]
            fields = [f"id: {enemy['id']}", f"name: {json.dumps(enemy['name']['text'])}", f"model_id: {enemy['model_id']}",
                      f"scale: {fp(w[10])}", "raw_cast: [" + ", ".join(f"0x{x:08x}" for x in w[:4]) + "]",
                      f"raw_2c: {w[11]}", f"base_hp: {fp(w[12])}", f"base_damage: {fp(w[13])}",
                      f"raw_38: {fp(w[14])}", f"raw_3c: {fp(w[15])}", f"raw_40: {w[16]}",
                      f"raw_44: {fp(w[17])}", f"raw_48: {fp(w[18])}", f"flag_4c: {enemy['flag_4c']}"]
            lines.extend(["    EnemyDefinition {"] + ["        " + field + "," for field in fields] + ["    },"])
        lines.extend(["];", ""])
    lines.append("pub static ZONES: &[ZoneDefinition] = &[")
    for zone in zones:
        fields = [f"key: {json.dumps(zone['key']['text'])}", f"name: {json.dumps(zone['name']['text'])}",
                  "center: [" + ", ".join(fp(x) for x in zone["center_bits"]) + "]",
                  f"radius: {fp(zone['radius_bits'])}", f"scalar_e0: {fp(zone['scalar_e0_bits'])}",
                  f"enemies: {zone['key']['text'].upper()}_ENEMIES"]
        lines.extend(["    ZoneDefinition {"] + ["        " + field + "," for field in fields] + ["    },"])
    lines.extend(["];", ""])
    return "\n".join(lines)


if __name__ == "__main__":
    main()
