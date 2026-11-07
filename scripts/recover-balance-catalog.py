#!/usr/bin/env python3
"""Revalidate live class/ability/talent definitions against the selected PE.

Static data reads and source comparisons only; no compilation or application
execution. Default output is staged below runtime/. --apply-menu repairs the
class/ability portions of menu.json; --check verifies the retained compact proof.
Historical runtime enum values are explicitly normalized, never relabelled.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import bits as _shared_bits
from script_sources import load_script
import argparse
import copy
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/combat/balance-catalog/a8787b6f4df0"
RETAINED = ROOT / "docs/analysis/evidence/balance-catalog/manifest.json"
ASSETS = ROOT / "crates/azeroth-survivors-re/assets"
SOURCE = ROOT / "crates/azeroth-survivors-re/src"
CLASSES, ABILITIES, TREES = 0x146BAB7A8, 0x146BACAD8, 0x146E74860
CLASS_IDS = [1, 2, 3, 4, 5, 7, 8, 9, 11]
NATIVE = [("picker-tooltip", 0x14007E870, 0x14007ED3D),
          ("picker-tooltip-call", 0x1401ED765, 0x1401ED7AE),
          ("ability-name", 0x1458744E0, 0x145874574),
          ("school-name", 0x14596E450, 0x14596E4EF)]


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, ensure_ascii=False,
                                     separators=(",", ":")).encode()).hexdigest()


def bits(value):
    return _shared_bits(value)


def source_number(expression):
    value = re.fullmatch(r"f32::from_bits\(0x([0-9a-fA-F_]+)\)", expression)
    return int(value[1].replace("_", ""), 16) if value else bits(float(expression))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--check", action="store_true")
    mode.add_argument("--apply-menu", action="store_true")
    mode.add_argument("--prepare-native", action="store_true")
    mode.add_argument("--collect-native", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "selected EXE hash mismatch"
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        assert at is not None and 0 <= at <= len(data) - size
        return data[at:at + size]

    def span(address, size):
        return dict(address=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=size, sha256=hashlib.sha256(raw(address, size)).hexdigest())

    def pair(address):
        return struct.unpack("<QQ", raw(address, 16))

    def text(address):
        pointer, length = pair(address)
        if not pointer or not length:
            assert not length
            return None
        assert length < 10000
        return raw(pointer, length).decode()

    def scalar(address):
        return struct.unpack("<I", raw(address, 4))[0]

    if args.prepare_native:
        WORK.mkdir(parents=True, exist_ok=True)
        _, start, end = NATIVE[0]
        (WORK / "picker-tooltip.bin").write_bytes(raw(start, end - start))
        plan = dict(target=str((WORK / "picker-tooltip.bin").relative_to(ROOT)),
            output=str((WORK / "rea-picker-tooltip").relative_to(ROOT)),
            open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
            init_timeout=120, timeout=180,
            environment={"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
            operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)))])
        (WORK / "plan-tooltip.json").write_text(portable_json(plan, indent=2) + "\n")
        print("Prepared selected base-tooltip REA/Ghidra plan under runtime/")
        return
    if args.collect_native:
        output = WORK / "native"
        output.mkdir(parents=True, exist_ok=True)
        response = json.loads((WORK / "rea-picker-tooltip/003-procedure_pseudo_code.json").read_text())
        evidence = response["response"]["result"]["structuredContent"]
        assert evidence["provider"]["id"] == "ghidra"
        assert evidence["subject"]["digest"]["sha256"] == span(NATIVE[0][1], NATIVE[0][2] - NATIVE[0][1])["sha256"]
        code = "\n".join(line.rstrip() for line in evidence["normalized_result"].splitlines()).strip() + "\n"
        assert "/Users/" not in code
        (output / "picker-tooltip.ghidra.c").write_text(code)
        for role, start, end in NATIVE:
            assembly = objdump_output(["objdump", "-d", "--no-show-raw-insn",
                f"--start-address={start:#x}", f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
            (output / f"{role}.asm").write_text(assembly)
        print("Staged four current instruction extracts and one normalized Ghidra result under runtime/")
        return

    def effect_sidecars(payload):
        strings, lists = [], []
        for at in range(8, 49, 8):
            pointer, length = struct.unpack_from("<QQ", payload, at)
            if not pointer or not 0 < length < 256:
                continue
            try:
                value = raw(pointer, length).decode()
                if value and all(char.isprintable() for char in value):
                    strings.append(dict(offset=at, value=value))
            except (AssertionError, UnicodeError, TypeError, ValueError):
                pass
            if length < 32:
                try:
                    values = [text(pointer + index * 16) for index in range(length)]
                    if all(value and all(char.isprintable() for char in value) for value in values):
                        lists.append(dict(offset=at, values=values))
                except (AssertionError, UnicodeError, TypeError, ValueError, struct.error):
                    pass
        return dict(strings=[entry for entry in strings if not any(
            row["offset"] == entry["offset"] for row in lists)], lists=lists)

    def normalized_effect(row, native):
        payload = bytearray.fromhex(row["payload"])
        if native:
            payload[0] = {35: 30, 36: 31}.get(payload[0], payload[0])
        payload[1:4] = bytes(3)  # enum padding is not a semantic field
        for reference in row["strings"] + row.get("lists", []):
            payload[reference["offset"]:reference["offset"] + 8] = bytes(8)
        if payload[0] == 29:
            payload[8:16] = bytes(8)  # separately checked live follower IDs below
        return dict(payload=payload.hex(), strings=row["strings"], lists=row.get("lists", []))

    old_menu = json.loads((ASSETS / "menu.json").read_text())
    menu = copy.deepcopy(old_menu)
    english = json.loads((ASSETS / "locales/en.json").read_text())
    talents = json.loads((ASSETS / "talents.json").read_text())
    entry = json.loads((ASSETS / "run-entry-0.100.1.json").read_text())
    ability_source = (SOURCE / "player_abilities/catalog.rs").read_text()
    ability_chunks = re.findall(r"AbilityDefinition \{(.*?)\n    \},", ability_source.split(
        "pub static ABILITIES:", 1)[1].split("pub static CLASSES:", 1)[0], re.S)
    assert len(ability_chunks) == 113
    ability_semantics, native_status_translation = [], []
    for index, chunk in enumerate(ability_chunks):
        address = ABILITIES + index * 120
        names = {field: text(address + at) for field, at in [("key", 0), ("name", 16), ("icon", 32)]}
        for field, value in names.items():
            assert re.search(r"\b" + field + r":\s*" + re.escape(json.dumps(value)), chunk), names["key"]
        upgrade_pointer, count = pair(address + 48)
        upgrades = list(raw(upgrade_pointer, count))
        source_upgrades = [int(value) for value in re.search(r"upgrade_types:\s*&\[([^]]*)", chunk)[1].split(",") if value.strip()]
        assert source_upgrades == upgrades, names["key"]
        integers = {64: "spell_id", 84: "targets", 92: "ticks", 100: "pulse_spell_id"}
        floats = {68: "base_power", 72: "base_cooldown", 76: "range", 80: "radius", 88: "duration", 96: "projectile_speed"}
        values = {}
        for at, field in {**integers, **floats}.items():
            expression = re.search(r"\b" + field + r":\s*([^,]+)", chunk)[1]
            observed = source_number(expression) if at in floats else int(expression)
            assert observed == scalar(address + at), (names["key"], field)
            values[field] = observed
        for at, field in [(116, "school"), (117, "kind")]:
            observed = int(re.search(r"\b" + field + r":\s*(\d+)", chunk)[1])
            assert observed == raw(address + at, 1)[0], (names["key"], field)
            values[field] = observed
        native_tag, value, duration = struct.unpack("<III", raw(address + 104, 12))
        internal_tag = {11: 10, 12: 11, 13: 12}.get(native_tag, native_tag)
        status = re.search(r"effect:\s*StatusEffect\s*\{\s*tag:\s*(\d+),\s*value:\s*([^,]+),\s*duration:\s*([^}]+)", chunk)
        assert (int(status[1]), source_number(status[2].strip()), source_number(status[3].strip())) == (
            internal_tag, value, duration), names["key"]
        if native_tag != internal_tag:
            native_status_translation.append(dict(key=names["key"], native_tag=native_tag, internal_tag=internal_tag))
        ability_semantics.append(dict(**names, **values, upgrades=upgrades,
                                      native_status=[native_tag, value, duration]))
    current_keys = [row["key"] for row in ability_semantics]
    assert len(set(current_keys)) == 113
    # Exact base picker inputs are established by current14007e870, not by a
    # character's equipped gameplay state. Existing current description math
    # owns the dual-magnitude Empowerment template and native number rounding.
    empowerment = next(row for row in ability_semantics if row["key"] == "demonic_empowerment")
    template = raw(0x1471B3C73, 134).decode()
    assert template in (SOURCE / "run_effects/demon_talents.rs").read_text()
    assert raw(0x1471B2D53, 6) == b"Shadow"
    assert 0x1471B3FC0 + struct.unpack("<i", raw(0x1471B3FC0 + 4 * 4, 4))[0] == 0x14596E479
    assert empowerment["school"] == 5
    cooldown = struct.unpack("<f", struct.pack("<I", empowerment["base_cooldown"]))[0]
    duration = struct.unpack("<f", struct.pack("<I", empowerment["duration"]))[0]
    assert raw(0x145D73D40, 4) == struct.pack("<f", 1.4)
    tooltip = dict(subtitle=dict(concat=[dict(template="Shadow", values={}),
        dict(literal=" · "), dict(template="common.cooldown_sec", values={
            "s": dict(literal=f"{cooldown * 1.4:.0f}")})]),
        body=dict(template=template, values={"d": dict(literal="30"),
            "h": dict(literal="15"), "dur": dict(literal=f"{duration * 1.4:.0f}")}))
    tooltips = json.loads((ASSETS / "ability-tooltips.json").read_text())
    if args.apply_menu:
        tooltips["demonic_empowerment"] = tooltip
    else:
        assert tooltips["demonic_empowerment"] == tooltip, "current picker tooltip drift"
    localization_source = (SOURCE / "localization.rs").read_text()
    assert '.lookup(&format!("ability.{}.name", ability.key))' in localization_source
    assert ".unwrap_or(&ability.name)" in localization_source
    assert "let text = entries().get(key)?;" in (SOURCE / "ability_tooltip.rs").read_text()
    # Menus read their own embedded catalog; the runtime Rust catalog alone does
    # not put a new spell into the picker or Codex class list.
    menu["abilities"] = [dict(key=row["key"], name=row["name"], icon=row["icon"],
                              description=english.get(f"ability.{row['key']}.desc", ""))
                         for row in ability_semantics]
    class_semantics = []
    for index, class_id in enumerate(CLASS_IDS):
        address = CLASSES + index * 144
        key = text(address + 16)
        pointer, count = pair(address + 48)
        pool = [text(pointer + number * 16) for number in range(count)]
        starter = text(address + 64)
        assert all(value in current_keys for value in pool) and starter in pool
        cls = next(row for row in menu["classes"] if row["key"] == key)
        assert cls["base_health"] == struct.unpack("<f", raw(address + 128, 4))[0]
        assert cls["starting_spell_key"] == starter
        for at, field in [(32, "name"), (96, "icon"), (112, "blurb")]:
            assert cls[field] == text(address + at), (key, field)
        cls["spell_keys"] = pool
        cls["spell_names"] = [next(row["name"] for row in ability_semantics if row["key"] == value)
                              for value in pool]
        expected_pool = "pool: &[" + ", ".join(json.dumps(value) for value in pool) + "]"
        assert expected_pool in ability_source, key
        old_class = next(row for row in talents["classes"] if row["id"] == class_id)
        assert old_class["leech_bits"] == scalar(address + 136), key
        baseline = next(row for row in entry["classes"] if row["id"] == class_id)
        assert bits(baseline["base_health"]) == scalar(address + 128)
        assert bits(baseline["armor_fraction"]) == scalar(address + 132)
        assert bits(entry["player"]["armor_by_class"][key]) == scalar(address + 132)
        class_semantics.append(dict(id=class_id, key=key, starter=starter, pool=pool,
                                    baseline_bits=[scalar(address + at) for at in [128, 132, 136]]))

    # Current native effect variants35/36 are stored in the historical source as
    # internal30/31. Special Demonology variants30..34 are separately owned by
    # selected-data.json and the current overlays; never alias those variants.
    current_demonology = json.loads((ASSETS / "demonology-0.105.0.json").read_text())
    selected = json.loads((ROOT / "docs/analysis/evidence/game-mode-audit/selected-data.json").read_text())
    assert current_demonology["target_sha256"] == selected["target_sha256"] == SHA
    selected_rows = {row["key"]: row for row in selected["selected_talents"]}
    overlays = {row["key"]: row for row in current_demonology["talents"]}
    overlays["aftermath"] = current_demonology["scorched_earth"]
    fields = ["key", "name", "icon", "description", "row", "column", "max_rank", "prerequisite"]
    tree_ranges, talent_semantics, ordinary_count, payload_count = [], [], 0, 0
    follower_grants = []
    pets_source = (SOURCE / "run_effects/pets.rs").read_text()
    for class_index, class_id in enumerate(CLASS_IDS):
        old_class = next(row for row in talents["classes"] if row["id"] == class_id)
        for tree_index in range(3):
            descriptor = TREES + class_index * 200 + tree_index * 64
            pointer, count = pair(descriptor + 48)
            tree = old_class["trees"][tree_index]
            assert [tree[field] for field in ["name", "background", "icon"]] == [text(descriptor + at) for at in [0, 16, 32]]
            tree_ranges.append(dict(class_id=class_id, tree=tree_index, count=count,
                                    **span(pointer, count * 120)))
            for index in range(count):
                address = pointer + index * 120
                key = text(address + 32)
                row = dict(key=key, name=text(address + 48), icon=text(address + 64),
                           description=text(address + 96), prerequisite=text(address),
                           row=raw(address + 112, 1)[0], column=raw(address + 113, 1)[0],
                           max_rank=raw(address + 114, 1)[0])
                effect_pointer, effect_count = pair(address + 80)
                effects = []
                for effect_index in range(effect_count):
                    payload = raw(effect_pointer + effect_index * 64, 64)
                    effects.append(dict(payload=payload.hex(), **effect_sidecars(payload)))
                if key in overlays:
                    assert {field: overlays[key][field] for field in fields} == row, key
                    retained = selected_rows[key]
                    assert [effect["payload"] for effect in effects] == [effect["payload"] for effect in retained["effects"]], key
                    assert retained["effects_range"] == {
                        "virtual_address": hex(effect_pointer),
                        "file_offset": hex(pe.rva_offset(effect_pointer - pe.image_base)),
                        "byte_count": effect_count * 64,
                        "sha256": hashlib.sha256(raw(effect_pointer, effect_count * 64)).hexdigest()}
                else:
                    old = next(item for item in tree["talents"] if item["key"] == key)
                    assert {field: old[field] for field in fields} == row, key
                    assert [normalized_effect(item, False) for item in old["effects"]] == [
                        normalized_effect(item, True) for item in effects], key
                    ordinary_count += 1
                    payload_count += effect_count
                grants = []
                if key not in overlays:
                    for effect in effects:
                        payload = bytes.fromhex(effect["payload"])
                        if payload[0] == 29:
                            pet_pointer = struct.unpack_from("<Q", payload, 8)[0]
                            grants.append(scalar(pet_pointer + 32))
                    if grants:
                        expected = f'"{key}" => &[{", ".join(map(str, grants))}]'
                        assert expected in pets_source, key
                        follower_grants.append(dict(key=key, entries=grants))
                talent_semantics.append(dict(**row, effects=[normalized_effect(item, True) for item in effects]))
    assert len(talent_semantics) == 355 and ordinary_count == 340
    # These are current ordinary upgrade arrays referenced by the already
    # canonical current magnitude extract; do not duplicate its native code.
    upgrade_source = (SOURCE / "player_abilities/upgrades.rs").read_text()
    upgrade_tables = []
    for name, address, fmt in [("POWER", 0x1471B4290, "f"), ("COOLDOWN", 0x1471B42C0, "f"),
                               ("TARGETS", 0x1471B42F0, "I"), ("AREA", 0x1471B4320, "f"),
                               ("DURATION", 0x1471B4350, "f")]:
        values = struct.unpack("<" + fmt * 5, raw(address, 20))
        source_values = [float(value) for value in re.search(r"const " + name + r":\s*\[[^]]+\]\s*=\s*\[([^]]+)\]", upgrade_source)[1].split(",")]
        assert [bits(value) for value in source_values] == [bits(value) for value in values], name
        upgrade_tables.append(dict(name=name, values=list(values), **span(address, 20)))
    manifest = dict(target_sha256=SHA, target_process_launched=False,
        method="Complete selected-PE class/ability/talent table traversal and exact live source comparison; standard-library Python only.",
        tables=dict(classes=span(CLASSES, 9 * 144), abilities=span(ABILITIES, 113 * 120),
                    talent_index=span(TREES, 9 * 200), talent_trees=tree_ranges),
        checks=dict(classes=9, abilities=113, talent_definitions=355,
                    ordinary_talents=ordinary_count, ordinary_effect_payloads=payload_count,
                    current_overlay_talents=15, ordinary_upgrade_tables=5),
        semantic_sha256=dict(classes=digest(class_semantics), abilities=digest(ability_semantics),
                             talents=digest(talent_semantics)),
        status_translation=native_status_translation, follower_grants=follower_grants,
        ordinary_upgrade_tables=upgrade_tables,
        picker_tooltip=dict(key="demonic_empowerment", school="Shadow", cooldown="35",
            damage_percent="30", haste_percent="15", duration="11",
            native_baseline="Rank1, neutral modifiers, zero-level class stats; no equipped bonuses.",
            expression_sha256=digest(tooltip),
            current_description_owner="docs/analysis/evidence/0.105.0/demon-offers/manifest.json"),
        native_owners=[dict(role=role, **span(start, end - start), assembly=f"{role}.asm",
            assembly_sha256=hashlib.sha256((RETAINED.parent / f"{role}.asm").read_bytes()).hexdigest())
            for role, start, end in NATIVE],
        picker_ghidra=dict(evidence_id="ev_e9c7077b7f489248135624b4093659ccd00bfa0875de086bf40221cb9aa77fb6",
            input_sha256="ac6fb1fbb0a6cf8efee5e469b506d87fea7effe177c209ee00ccf3c8f60ae6f1",
            analysis_profile_digest="7eeaa039c9fc88851fb199ee8110f8ba7e36ad162807477fe5c60cb38ae9dc4e",
            pseudocode="picker-tooltip.ghidra.c",
            pseudocode_sha256=hashlib.sha256((RETAINED.parent / "picker-tooltip.ghidra.c").read_bytes()).hexdigest(),
            limitations="Raw Ghidra import omits external code/data and uses generic GCC ABI; original Win64 instructions bind arguments."),
        existing_native_owners=["docs/analysis/evidence/0.105.0/demon-offers/manifest.json",
                                "docs/analysis/evidence/0.105.0/power-scaling/ranks/manifest.json",
                                "docs/analysis/evidence/0.105.0/pet-creation/manifest.json"],
        corrected_menu_keys=["demonic_empowerment"],
        limits=["Definition data and source connections only; historical consumers are not fully revalidated by matching tables.",
                "Internal runtime tags remain historical; native status11/12/13 translate to10/11/12, native stat35/spell36 to30/31.",
                "Special Demonology behavior/migration is separately owned; full native presentation, compilation and gameplay parity remain unverified."])
    encoded = json.dumps(manifest, indent=2, ensure_ascii=False) + "\n"
    if args.apply_menu:
        (ASSETS / "menu.json").write_text(portable_json(menu, indent=2, ensure_ascii=False) + "\n")
        (ASSETS / "ability-tooltips.json").write_text(portable_json(tooltips, indent=2, ensure_ascii=False) + "\n")
    else:
        assert menu["classes"] == old_menu["classes"] and menu["abilities"] == old_menu["abilities"], "menu class/ability definitions drift; use --apply-menu"
    if args.check:
        assert RETAINED.read_text() == encoded, "retained selected-target proof drift"
    else:
        WORK.mkdir(parents=True, exist_ok=True)
        (WORK / "manifest.json").write_text(encoded)
    print("Verified 9 class baselines/pools, 113 live abilities, 355 talent definitions (340 ordinary talents/409 payloads, 15 current overlays), 5 upgrade tables and the connected Empowerment picker tooltip; static only")


if __name__ == "__main__":
    main()
