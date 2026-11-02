#!/usr/bin/env python3
"""Extract SHA-bound current save/appearance evidence; never execute or emulate the EXE.

Writes textual evidence and the small build-time save item-bounds catalog. REA plans
are prepared below runtime/menu-save-0.97.2; run selected plans with rea-batch.py.
Existing completed REA/Ghidra dossiers contribute their evidence IDs and C hashes.
"""
from portable_paths import objdump_output, portable_json, portable_record
from script_sources import load_script
import hashlib
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = Path("AzerothSurvivors/AzerothSurvivors-0.97.2.exe")
SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
OUT = ROOT / "docs/analysis/evidence/0.97.2"
RUNTIME = ROOT / "runtime/menu-save-0.97.2"
CLASS_IDS = [1, 2, 3, 4, 5, 7, 8, 9, 11]

# Exclusive bounds come from this target's .pdata; the small PvP lookup has no unwind row.
RANGES = {
    "menu-save": [
        ("startup-pick", 0x14008B690, 0x14008B89F),
        ("name-generator", 0x14008E4E0, 0x14008E67D),
        ("class-selection", 0x14541DAE0, 0x14541DCC3),
        ("load-backup", 0x14541E3C0, 0x14541EBDF),
        ("parse", 0x14541F1C0, 0x145422EE3),
        ("ordinary-write", 0x145423790, 0x1454238D6),
        ("serialize", 0x145424080, 0x14542629B),
        ("import", 0x145427FF0, 0x145428173),
        ("name-validator", 0x145428330, 0x145428744),
        ("outfit-faction-resolution", 0x145459E90, 0x14545A224),
        ("item-decoder", 0x14545A320, 0x14545B365),
        ("pvp-class-lookup", 0x14545B700, 0x14545B719),
        ("armor-display-fallback", 0x145516740, 0x1455167EC),
        ("items-lines", 0x1455131E0, 0x1455135BE),
        ("owned-item-filter", 0x1455252D0, 0x1455255DA),
        ("features-u8-filter", 0x14552E9A0, 0x14552EEDF),
        ("seal-crypt", 0x145501940, 0x145501BBF),
        ("seal-mac", 0x145501BC0, 0x145502281),
        ("seal-open", 0x145502290, 0x14550259A),
    ],
    "appearance": [
        ("input", 0x1403A32D0, 0x1403A3F5F),
        ("feature-cycle", 0x145500C50, 0x145500D24),
        ("clamp", 0x145500D30, 0x145500E7E),
        ("randomize", 0x145501240, 0x1455013F5),
        ("range-lookup", 0x145625C70, 0x145625D74),
    ],
}


def save(path, value):
    path.write_text(portable_json(value, indent=2, ensure_ascii=False) + "\n")


def main():
    binary = (ROOT / TARGET).read_bytes()
    if hashlib.sha256(binary).hexdigest() != SHA:
        raise SystemExit("Selected0.97.2 target SHA-256 mismatch")
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(binary)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, *_ in pe.functions()}

    def read(va, size):
        at = pe.rva_offset(va - pe.image_base)
        return binary[at:at + size]

    def q(va):
        return struct.unpack("<Q", read(va, 8))[0]

    def string(va):
        return read(q(va), q(va + 8)).decode()

    OUT.mkdir(parents=True, exist_ok=True)
    RUNTIME.mkdir(parents=True, exist_ok=True)
    procedures = {}
    for group, ranges in RANGES.items():
        procedures[group] = []
        for label, start, end in ranges:
            if start in bounds and bounds[start] != end:
                raise SystemExit(f"Changed native bound: {start:x}, {bounds[start]:x} != {end:x}")
            code = read(start, end - start)
            slice_path = RUNTIME / f"{start:x}.bin"
            slice_path.write_bytes(code)
            asm_path = OUT / f"{group}-0.97.2-{start:x}.asm"
            assembly = objdump_output([
                "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
                f"--stop-address={end:#x}", str(TARGET),
            ], cwd=ROOT, text=True)
            asm_path.write_text(assembly)
            plan = {
                "target": str(slice_path.relative_to(ROOT)),
                "output": str((RUNTIME / f"rea-{start:x}").relative_to(ROOT)),
                "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(start)},
                "timeout": 180, "open_timeout": 60, "cleanup_timeout": 60,
                "environment": {"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
                "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": hex(start)}, "timeout": 240}],
            }
            save(RUNTIME / f"plan-{start:x}.json", plan)
            record = {
                "label": label, "start_va": hex(start), "stop_va_exclusive": hex(end),
                "file_offset": hex(pe.rva_offset(start - pe.image_base)),
                "native_size": len(code), "native_sha256": hashlib.sha256(code).hexdigest(),
                "assembly": str(asm_path.relative_to(ROOT)),
                "assembly_sha256": hashlib.sha256(assembly.encode()).hexdigest(),
            }
            dossier = RUNTIME / f"rea-{start:x}/003-procedure_pseudo_code.json"
            if dossier.exists():
                completed = json.loads(dossier.read_text())
                result = completed.get("response", {}).get("result", {}).get("structuredContent", {})
                subject_sha = result.get("subject", {}).get("digest", {}).get("sha256")
                if subject_sha != record["native_sha256"]:
                    raise SystemExit(f"REA subject differs from current native slice: {start:x}")
                record["ghidra"] = {
                    "provider": result.get("provider", "ghidra"),
                    "evidence_id": result.get("evidence_id"),
                    "subject_sha256": subject_sha,
                    "c_sha256": hashlib.sha256(result.get("normalized_result", "").encode()).hexdigest(),
                    "error": completed.get("error"),
                }
            procedures[group].append(record)

    eligibility = []
    gear_classes = []
    gear_evidence = []
    preview_items = []
    preview_provenance = []
    def u32(va):
        return struct.unpack("<I", read(va, 4))[0]
    armor_inventory_types = list(struct.unpack("<8I", read(0x146989D64, 32)))
    for class_id in CLASS_IDS:
        index = (class_id - 1) * 8
        race_va, race_count = q(0x146720D78 + index), q(0x146720DD0 + index)
        eligibility.append({"class_id": class_id, "data_va": hex(race_va), "races": list(read(race_va, race_count))})
        row = q(0x14698B3A8 + index)
        pvp = q(0x14698B400 + index)
        counts = {"id": class_id, "weapon_count": q(row + 128), "pvp_weapon_count": q(pvp + 40)}
        gear_classes.append(counts)
        gear_evidence.append({**counts, "class_va": hex(row), "pvp_va": hex(pvp),
                              "pvp_names": [string(pvp + i * 16) for i in range(2)]})
        material = read(row + 296, 1)[0]
        for rarity in range(7):
            for slot in range(8 + counts["weapon_count"]):
                item_id = 100000 + class_id * 1000 + slot * 100 + rarity * 10
                if slot < 8:
                    if rarity < 5:
                        # Native145516740 scans desired/lower tiers, then higher tiers.
                        candidates = [rarity - i if i <= rarity else i for i in range(5)]
                        display_va = next((row + 136 + tier * 32 + slot * 4 for tier in candidates
                                           if u32(row + 136 + tier * 32 + slot * 4)), None)
                        display = u32(display_va) if display_va else 0
                    else:
                        display_va = pvp + 48 + (rarity - 5) * 32 + slot * 4
                        display = u32(display_va)
                        if not display:
                            display_va = row + 232 + slot * 4
                            display = u32(display_va)
                    inventory_type = 20 if slot == 2 and material == 1 else armor_inventory_types[slot]
                    inventory_source = "cloth chest20; otherwise0x146989d64[slot]"
                else:
                    weapon = q(row + 120) + (slot - 8) * 144
                    if rarity < 5:
                        display_va = weapon + 120 + rarity * 4
                    else:
                        if slot - 8 >= counts["pvp_weapon_count"]:
                            continue
                        display_va = q(pvp + 32) + (slot - 8) * 48 + (rarity - 5) * 24
                    display = u32(display_va)
                    inventory_type = u32(weapon + 112)
                    inventory_source = hex(weapon + 112)
                preview_items.append({"id": item_id, "display_id": display, "inventory_type": inventory_type})
                preview_provenance.append({"id": item_id, "display_va": hex(display_va) if display_va else None,
                                           "inventory_type_source": inventory_source})
    save(ROOT / "crates/azeroth-survivors-re/assets/save-gear-0.97.2.json",
         {"version": "0.97.2", "classes": gear_classes, "preview_items": preview_items})
    fragments = {label: [string(va + i * 16) for i in range(count)] for label, va, count in [
        ("prefix", 0x1458FA620, 20), ("middle", 0x1458FA788, 16), ("suffix", 0x1458FA898, 10),
    ]}
    if portable_record(fragments) != portable_record(json.loads((ROOT / "crates/azeroth-survivors-re/assets/hero-name.json").read_text())):
        raise SystemExit("Current native name fragments differ from the source asset")
    current_zones = [string(0x146716440 + i * 240) for i in range(12)]
    legacy_zones = [string(0x1467208C8 + i * 16) for i in range(9)]
    metadata = {"target": str(TARGET), "version": "0.97.2", "sha256": SHA,
                "target_size": len(binary), "image_base": hex(pe.image_base),
                "method": "REA/Ghidra exact native slices plus original Win64 instructions and PE pointer reads",
                "target_executed": False, "emulation_run": False,
                "source_compiled": False, "tests_run": False}
    save(OUT / "menu-save-0.97.2.json", {
        **metadata, "procedures": procedures["menu-save"],
        "class_race_eligibility": eligibility,
        "progress": {"current_zones": current_zones, "legacy_zones": legacy_zones,
                     "legacy_table_va": "0x1467208c8", "migration": "clamp old ordinal1..9; resolve old key in current zone order",
                     "duplicate_classes": "maximum ordinal", "current_record": "open|class|zone_key"},
        "gear": {"class_pointer_table_va": "0x14698b3a8", "pvp_pointer_table_va": "0x14698b400",
                 "classes": gear_evidence, "id_formula": "100000 + class*1000 + slot*100 + rarity_digit*10",
                 "rarity_digits": {"0": "Common", "1": "Uncommon", "2": "Rare", "3": "Epic", "4": "Legendary",
                                   "5": "PvP first faction table", "6": "PvP second faction table"},
                 "legacy_id_renumbering": "none: Legendary digit4 remains4",
                 "items_normalization": "validate synthetic ID; retain class-bound gear; sort and deduplicate",
                 "preview_item_count": len(preview_items), "preview_provenance": preview_provenance,
                 "preview_horde_mapping": "race2/5/6/8 converts digit5 to6 for equip/look presentation only"},
        "name": {"fragment_tables": ["0x1458fa620", "0x1458fa788", "0x1458fa898"], "fragments": fragments,
                 "validation": "Unicode trim;2..12ASCII letters; ASCII title case",
                 "generator": "clock nanoseconds XOR0x9e3779b97f4a7c15; xorshift13,7,17; %20,&15,%10;12characters"},
        "envelope": {"prefix": read(0x1469ADB94, 5).decode(), "nonce_bytes": 16, "tag_bytes": 20,
                     "stream_chunk_bytes": 20, "stream_domain": read(0x1469ADB92, 2).decode(),
                     "tag_domain": read(0x1469ADCDC, 3).decode(),
                     "compiled_ipad_first48": read(0x1469AD1E0, 48).hex(),
                     "compiled_opad_first48": read(0x1469AD210, 48).hex(),
                     "algorithm": "HMAC-SHA1; stream input ks+nonce+u64LEblock; tag input tag+nonce+ciphertext",
                     "ordinary_write": "seal, open and compare; fallback plaintext; ordinary direct writer"},
        "limitations": [
            "Static evidence and authored source fixtures only; no current-target interoperability or rendered parity run.",
            "Unrecovered progression/roster records remain raw in source; the complete native typed Save formatter/order is not reconstructed.",
            "PvP save IDs and ownership bounds are recovered; full PvP catalog/stat/drop/armory rendering remain separate work.",
            "The import caller's full UI selection replacement policy remains incompletely connected in source.",
            "Base-directory/OS file helpers retain0.92 baseline semantics where not separately revalidated in this report.",
        ],
    })
    save(OUT / "appearance-0.97.2.json", {
        **metadata, "procedures": procedures["appearance"], "feature_order": ["skin", "face", "hair_style", "hair_color", "facial_hair"],
        "clamp": "cache absent or pair absent: preserve; otherwise feature[i]=min(feature[i],count[i].saturating_sub(1))",
        "cycle": "clamp all; selected=(selected+i8delta).rem_euclid(max(count,1)); missing count uses1",
        "race_sex_actions": "preserve existing features, set race/sex, clamp, issue full-Pick command11 even on repeated value",
        "random": "fresh clock nanos/fallback7 XORgolden constant, five xorshift13/7/17 steps modulo max(count,1)",
        "class_selection": "saved per-class hero restored; fresh class retains sex, chooses eligible same-faction race, clears all5features",
        "cache_fill_persistence": "no save emission established from cache fill; source installation does not persist",
        "limitations": ["Loaded MPQ/DBC choice-count production is not independently reconstructed in this report.",
                        "Native renderer/face/hair asset parity and live random-clock comparisons are unverified.",
                        "Global cache and post-asset-load system scheduling are source integration, not runtime-validated parity."],
    })
    print("Saved current static menu-save/appearance evidence and save item bounds; no target execution.")


if __name__ == "__main__":
    main()
