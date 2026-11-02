#!/usr/bin/env python3
"""Recover the selected 0.97.2 menu catalog; never execute a reference binary.

Every fixed offset is guarded by the selected target's SHA-256. This helper
walks PE-backed Rust strings/slices and checks their texts against the embedded
English object. Native consumers and remaining semantic limits are documented
in docs/analysis/menu-catalog-0.97.2.md.
"""
from portable_paths import portable_json
from script_sources import load_script

import argparse
import hashlib
import json
from pathlib import Path
import re
import struct


ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA256 = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
CATALOG = ROOT / "crates/azeroth-survivors-re/assets/menu.json"
EVIDENCE = ROOT / "docs/analysis/evidence/0.97.2/catalog.json"
CLASS_TABLE, CLASS_COUNT, CLASS_STRIDE = 0x6717768, 9, 144
ZONE_TABLE, ZONE_COUNT, ZONE_STRIDE = 0x6715440, 12, 240
ABILITY_TABLE, ABILITY_COUNT, ABILITY_STRIDE = 0x6718A68, 112, 120
RACES = [
    ("human", "Alliance"), ("orc", "Horde"), ("dwarf", "Alliance"),
    ("nightelf", "Alliance"), ("scourge", "Horde"), ("tauren", "Horde"),
    ("gnome", "Alliance"), ("troll", "Horde"),
]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    modes = parser.add_mutually_exclusive_group()
    modes.add_argument("--check", action="store_true", help="compare generated files without writing")
    modes.add_argument("--prepare-native", action="store_true", help="write exact native slices and REA plans under runtime")
    modes.add_argument("--collect-native", action="store_true", help="retain completed REA Evidence with original-byte provenance")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    actual = hashlib.sha256(data).hexdigest()
    if actual != SHA256:
        raise SystemExit(f"0.97.2 target SHA-256 mismatch: {actual}")
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)
    assert data[0x58F9A40:0x58F9A48] == b"43fe5ff8"
    assert data[0x58F9A48:0x58F9A4E] == b"0.97.2"

    def location(offset):
        assert 0 <= offset < len(data)
        return {"file_offset": hex(offset), "virtual_address": hex(pe.offset_va(offset))}

    def span(offset, count):
        raw = data[offset:offset + count]
        assert len(raw) == count
        return dict(**location(offset), length_bytes=count,
                    sha256=hashlib.sha256(raw).hexdigest(), raw_hex=raw.hex())

    def pair(offset):
        pointer, count = struct.unpack_from("<QQ", data, offset)
        at = pe.rva_offset(pointer - pe.image_base)
        assert 0 <= at < len(data)
        return at, count

    def text(offset):
        at, count = pair(offset)
        assert 0 < count < 10000 and at + count <= len(data)
        return data[at:at + count].decode("utf-8")

    def text_source(offset):
        at, count = pair(offset)
        return dict(**location(at), length_bytes=count, text=text(offset))

    if args.prepare_native or args.collect_native:
        directory = ROOT / "runtime/catalog-0.97.2"
        directory.mkdir(parents=True, exist_ok=True)
        functions = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
        native = []
        for va in (0x14540EB90, 0x1454193F0, 0x145427B30):
            end = functions[va]
            offset = pe.rva_offset(va - pe.image_base)
            source = span(offset, end - va)
            source["end_virtual_address_exclusive"] = hex(end)
            source["boundary_source"] = "Current target PE exception-directory RUNTIME_FUNCTION"
            path = directory / f"{va:x}.bin"
            if args.prepare_native:
                path.write_bytes(data[offset:offset + end - va])
                plan = dict(target=str(path.relative_to(ROOT)), output=f"runtime/catalog-0.97.2/rea-{va:x}",
                            open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(va)),
                            timeout=180, open_timeout=60, cleanup_timeout=60,
                            environment={"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
                            operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(va)), timeout=240)])
                (directory / f"plan-{va:x}.json").write_text(portable_json(plan, indent=2) + "\n")
            else:
                record = json.loads((directory / f"rea-{va:x}/003-procedure_pseudo_code.json").read_text())
                evidence = record["response"]["result"]["structuredContent"]
                assert evidence["subject"]["digest"]["sha256"] == source["sha256"]
                assert evidence["provider"]["id"] == "ghidra" and evidence["normalized_result"]
                native.append(dict(original_bytes=source, derived_artifact=str(path.relative_to(ROOT)), rea_evidence=evidence))
        if args.collect_native:
            report = dict(artifact=dict(path=str(TARGET.relative_to(ROOT)), sha256=actual, size_bytes=len(data)),
                          method="Exact unchanged current-target function bytes mapped at original VAs through REA/Ghidra; no target execution.",
                          limitations=["Raw x86_64 import uses generic GCC compiler specification; original PE uses Windows x64, so inferred signatures require instruction validation.",
                                       "Each slice omits its callees and referenced data; catalog tables are recovered independently from the complete SHA-bound PE."],
                          analyses=native)
            (EVIDENCE.parent / "catalog-native.json").write_text(portable_json(report, ensure_ascii=False, indent=2) + "\n")
        print("Prepared native REA plans" if args.prepare_native else "Collected three SHA-bound native REA Evidence records")
        return

    starts = [hit.start() for hit in re.finditer(rb'\{\r?\n  "game.title":', data)]
    assert len(starts) == 13
    english_offset = starts[0]
    decoded = data[english_offset:english_offset + 1000000].decode("utf-8", errors="replace")
    english, end = json.JSONDecoder().raw_decode(decoded)
    english_raw = decoded[:end].encode("utf-8")
    assert data[english_offset:english_offset + len(english_raw)] == english_raw
    assert len(english) == 2621

    classes, class_sources = [], []
    for index in range(CLASS_COUNT):
        at = CLASS_TABLE + index * CLASS_STRIDE
        key, name, starter, color, icon, blurb = [text(at + off) for off in (16, 32, 64, 80, 96, 112)]
        spells_at, spell_count = pair(at + 48)
        keys = [text(spells_at + i * 16) for i in range(spell_count)]
        assert english[f"class.{key}.name"] == name
        assert english[f"class.{key}.blurb"] == blurb
        assert starter in keys and len(set(keys)) == len(keys)
        assert re.fullmatch(r"#[0-9A-Fa-f]{6}", color)
        health = struct.unpack_from("<f", data, at + 128)[0]
        classes.append(dict(key=key, name=name, blurb=blurb, icon=icon,
                            base_health=health, starting_spell=english[f"ability.{starter}.name"],
                            spell_names=[english[f"ability.{key}.name"] for key in keys],
                            color=[int(color[i:i + 2], 16) / 255 for i in (1, 3, 5)],
                            spell_keys=keys, starting_spell_key=starter))
        class_sources.append(dict(key=key, record=span(at, CLASS_STRIDE),
                                  strings_by_record_offset={hex(off): text_source(at + off)
                                                            for off in (16, 32, 64, 80, 96, 112)},
                                  spell_slice=dict(**location(spells_at), count=spell_count, stride_bytes=16),
                                  spell_keys=keys, stored_float_at_128=health,
                                  stored_class_byte_at_140=data[at + 140]))

    abilities, ability_sources = [], []
    for index in range(ABILITY_COUNT):
        at = ABILITY_TABLE + index * ABILITY_STRIDE
        key, name, icon = [text(at + off) for off in (0, 16, 32)]
        assert english[f"ability.{key}.name"] == name
        abilities.append(dict(key=key, name=name, icon=icon,
                              description=english.get(f"ability.{key}.desc", "")))
        ability_sources.append(dict(key=key, record=span(at, ABILITY_STRIDE),
                                    strings_by_record_offset={hex(off): text_source(at + off)
                                                              for off in (0, 16, 32)}))
    ability_keys = {ability["key"] for ability in abilities}
    assert len(ability_keys) == ABILITY_COUNT
    assert all(set(cls["spell_keys"]).issubset(ability_keys) for cls in classes)

    zones, zone_sources = [], []
    for index in range(ZONE_COUNT):
        at = ZONE_TABLE + index * ZONE_STRIDE
        key, name, subtitle, icon, blurb = [text(at + off) for off in (0, 16, 32, 144, 160)]
        assert all(english[f"zone.{key}.{label}"] == value for label, value in
                   (("name", name), ("subtitle", subtitle), ("blurb", blurb)))
        enemy_at, enemy_count = pair(at + 112)
        boss_at, boss_count = pair(at + 128)
        assert enemy_count == (16 if key == "naxx" else 12) and boss_count == 5
        enemies, enemy_keys, enemy_sources = [], [], []
        for i in range(enemy_count):
            row = enemy_at + i * 80
            enemy_name = text(row + 16)
            enemy_key = f'enemy.{struct.unpack_from("<I", data, row + 32)[0]}'
            assert english[enemy_key] == enemy_name
            enemies.append(enemy_name)
            enemy_keys.append(enemy_key)
            enemy_sources.append(dict(key=enemy_key, name=text_source(row + 16), record=span(row, 80)))
        bosses, boss_sources = [], []
        for i in range(boss_count):
            row = boss_at + i * 88
            boss_name = text(row)
            boss_key = f'boss.{struct.unpack_from("<I", data, row + 48)[0]}.name'
            assert english[boss_key] == boss_name
            minute = struct.unpack_from("<f", data, row + 64)[0]
            final_flag = struct.unpack_from("<I", data, row + 84)[0]
            assert final_flag == int(i == boss_count - 1)
            bosses.append(dict(key=boss_key, name=boss_name, minute=minute))
            boss_sources.append(dict(key=boss_key, name=text_source(row), record=span(row, 88),
                                     stored_float_at_64=minute, stored_u32_at_84=final_flag))
        final = bosses[-1]
        assert final["minute"].is_integer()
        zones.append(dict(key=key, name=name, subtitle=subtitle, boss=final["name"],
                          minute=int(final["minute"]), icon=icon, blurb=blurb,
                          enemies=enemies, enemy_keys=enemy_keys, bosses=bosses))
        zone_sources.append(dict(key=key, record=span(at, ZONE_STRIDE),
                                 strings_by_record_offset={hex(off): text_source(at + off)
                                                           for off in (0, 16, 32, 144, 160)},
                                 enemy_slice=dict(**location(enemy_at), count=enemy_count, stride_bytes=80),
                                 boss_slice=dict(**location(boss_at), count=boss_count, stride_bytes=88),
                                 enemies=enemy_sources, bosses=boss_sources))

    races = []
    for key, faction in RACES:
        lines = [english[f"race.{key}.line{i}"] for i in range(1, 4) if f"race.{key}.line{i}" in english]
        races.append(dict(key=key, name=english[f"race.{key}.name"], blurb="\n".join(lines), faction=faction))

    catalog = dict(version="0.97.2", build_revision=data[0x58F9A40:0x58F9A48].decode("ascii"),
                   title=english["game.title"], labels=dict(sorted(english.items())),
                   classes=classes, races=races, zones=zones, abilities=abilities)
    evidence = dict(
        schema_version=1, version="0.97.2", target_executed=False,
        artifact=dict(path=str(TARGET.relative_to(ROOT)), size_bytes=len(data), sha256=actual),
        method="SHA-gated PE string/slice walks, with exact embedded-English key/value checks; no game execution or MPQ access.",
        english=dict(**location(english_offset), length_bytes=len(english_raw), entry_count=len(english),
                     sha256=hashlib.sha256(english_raw).hexdigest()),
        version_label=dict(build_revision=span(0x58F9A40, 8), version=span(0x58F9A48, 6)),
        class_table=dict(**location(CLASS_TABLE), count=CLASS_COUNT, stride_bytes=CLASS_STRIDE),
        ability_table=dict(**location(ABILITY_TABLE), count=ABILITY_COUNT, stride_bytes=ABILITY_STRIDE),
        zone_table=dict(**location(ZONE_TABLE), count=ZONE_COUNT, stride_bytes=ZONE_STRIDE),
        classes=class_sources, abilities=ability_sources, zones=zone_sources,
        races=dict(keys=[key for key, _ in RACES], text_source="Exact embedded-English race name/line keys",
                   faction_source="Preserved conventional menu grouping from the baseline; not a newly recovered native constraint."),
        output=str(CATALOG.relative_to(ROOT)),
        limitations=[
            "Catalog/table presence does not establish runtime reachability, visual parity, or implementation of gameplay.",
            "Stored class float+128 and boss float+64/u32+84 retain the baseline UI field interpretations; their 0.97.2 native consumers require separate recovery.",
            "Race Alliance/Horde grouping is explicitly provisional metadata, not proof of native eligibility or ordering.",
            "Existing 0.92 progression, armory, talent, codex, and tooltip catalogs are separate assets and are not revalidated by this extraction.",
        ],
    )
    for path, value in ((CATALOG, catalog), (EVIDENCE, evidence)):
        payload = json.dumps(value, ensure_ascii=False, indent=2) + "\n"
        if args.check:
            if path.read_text() != payload:
                raise SystemExit(f"Generated file differs: {path.relative_to(ROOT)}")
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(payload)
    print(json.dumps(dict(mode="checked" if args.check else "written", target_sha256=actual,
                          classes=len(classes), class_pool_entries=sum(len(c["spell_keys"]) for c in classes),
                          races=len(races), zones=len(zones), abilities=len(abilities),
                          enemies=sum(len(z["enemies"]) for z in zones),
                          bosses=sum(len(z["bosses"]) for z in zones)), indent=2))


if __name__ == "__main__":
    main()
