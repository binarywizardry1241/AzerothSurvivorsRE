#!/usr/bin/env python3
"""Retain bounded 0.97.2 custom HUD/card native evidence; never run the game."""
from portable_paths import objdump_output, portable_json
from script_sources import load_script

import argparse
import hashlib
import json
import struct
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
WORK = ROOT / "runtime/native-overlays-0.97.2"
OUT = ROOT / "runtime/native-evidence/0.97.2/native-overlays"
FUNCTIONS = {
    "effect-aggregate": 0x145415A50,
    "spell-modifiers": 0x145415F40,
    "reward-stat-refresh": 0x1454B7B80,
    "legendary-amulet": 0x145414300,
    "amulet-rarity-pool": 0x1455294B0,
    "amulet-exclusion": 0x145523330,
    "player-fields": 0x145491140,
    "player-create-packet": 0x145490FF0,
    "game-begin": 0x1454B07C0,
    "actor-create": 0x1454C0820,
    "run-constructor": 0x14549BB90,
    "cards-ray-image": 0x1400DA210,
    "cards-animate": 0x1400D8F40,
    "cards-hover": 0x1400D8640,
    "banish-key": 0x1454DA3D0,
    "choice-banish": 0x1454E3F50,
    "action-slots": 0x1454E3D30,
    "action-packet": 0x145441C20,
    "choice-dispatch": 0x1454DE2B0,
    "choice-complete": 0x1454DBBC0,
    "choice-hud-payload": 0x1454DC9C0,
    "choice-reroll": 0x1454E7820,
    "passive-description": 0x1454D7BE0,
    "upgrade-power-line": 0x14540EE70,
    "upgrade-cooldown-line": 0x14541B390,
    "upgrade-line-writer": 0x1455187C0,
    "number-format": 0x14547CCF0,
    "choice-upgrade-description": 0x1455347D0,
    "choice-description": 0x145476FE0,
    "choice-payload": 0x1454DED40,
    "cards-root": 0x1400D6FC0,
    "numeric-emphasis": 0x1400C7270,
    "card-tile": 0x1400C1D40,
    "card-banish": 0x1400C1500,
    "card-footer-button": 0x1400C7A20,
    "localized-fragment": 0x1400C6CF0,
    "card-content": 0x140214080,
    "card-tooltip": 0x1400C0790,
    "card-separator": 0x1400C7F20,
    "card-icon-loader": 0x1400C7C50,
    "cards-layout": 0x140217370,
    "hud-root": 0x14018F140,
    "hud-state": 0x1401962B0,
    "hudparts": 0x14017CB40,
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare", action="store_true")
    parser.add_argument("--collect", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    ends = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
    WORK.mkdir(parents=True, exist_ok=True)
    records = []
    for name, start in FUNCTIONS.items():
        end = ends[start]
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + end - start]
        source = {"address": hex(start), "end_exclusive": hex(end),
                  "file_offset": hex(offset), "byte_count": len(raw),
                  "sha256": hashlib.sha256(raw).hexdigest()}
        if args.prepare:
            path = WORK / f"{start:x}.bin"
            path.write_bytes(raw)
            plan = {"target": str(path.relative_to(ROOT)),
                    "output": str((WORK / f"rea-{start:x}").relative_to(ROOT)),
                    "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(start)},
                    "timeout": 180, "open_timeout": 60,
                    "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": hex(start)}}]}
            (WORK / f"plan-{start:x}.json").write_text(portable_json(plan, indent=2) + "\n")
        if args.collect:
            response_path = WORK / f"rea-{start:x}/003-procedure_pseudo_code.json"
            if not response_path.exists():
                continue
            response = json.loads(response_path.read_text())
            evidence = response["response"]["result"]["structuredContent"]
            assert evidence["subject"]["digest"]["sha256"] == source["sha256"]
            OUT.mkdir(parents=True, exist_ok=True)
            (OUT / f"{name}.ghidra.c").write_text(evidence["normalized_result"])
            disassembly = objdump_output(["objdump", "-d", "--no-show-raw-insn",
                f"--start-address={start:#x}", f"--stop-address={end:#x}",
                str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
            (OUT / f"{name}.asm").write_text(disassembly)
            records.append({"role": name, "source": source, "rea_evidence": evidence})
    if args.collect:
        # Curated original data spans used by the source renderer. Store bytes and
        # hashes as well as f32 values; color variants retain their native tags.
        spans = [("rarity-colors",0x1458FC8A0,0x148),
                 ("card-styles",0x1458FC9F0,0x158),
                 ("root-colors",0x1458FCD80,0x70),
                 ("card-labels",0x1458FE034,0x330),
                 ("footer-colors",0x14593EDF0,0x90),
                 ("badge-colors",0x14593E370,0x40),
                 ("card-animations",0x1458FCDE4,0x6c),
                 ("legendary-rim",0x1458FCA50,0x40),
                 ("gold-card-payload",0x1469AC5F2,0x29),
                 ("player-race-factions",0x1469ACAB8,0x1c)]
        raw_spans=[]
        for role,address,length in spans:
            offset=pe.rva_offset(address-pe.image_base); raw=data[offset:offset+length]
            raw_spans.append({"role":role,"address":hex(address),"file_offset":hex(offset),
                              "byte_count":length,"sha256":hashlib.sha256(raw).hexdigest(),"hex":raw.hex()})
        (OUT / "data-spans.json").write_text(portable_json({"target_sha256":SHA,"spans":raw_spans},indent=2)+"\n")
        (OUT / "manifest.json").write_text(portable_json({
            "date": "2026-10-18", "target": str(TARGET.relative_to(ROOT)),
            "target_sha256": SHA, "target_executed": False,
            "method": "Unchanged PE runtime-function slices analyzed through project-local REA/Ghidra; original Win64 instructions govern ABI.",
            "functions": records,
            "limitations": ["Static recovery is not runtime or visual parity.",
                "Raw-import pseudocode has unresolved external calls/constants; source-path descriptors and original instructions establish ownership."]}, indent=2) + "\n")
        # Exact client-facing fields and the separate racial scheduler are
        # retained as bounded original spans, without assigning generic WoW
        # defaults to fields absent from the current player/actor constructor.
        field_ranges = [("normal-rest-state", 0x145492353, 0x14549240a),
                        ("player-faction", 0x145491906, 0x1454919c3),
                        ("ordinary-actor-level", 0x1454c0820, 0x1454c086f),
                        ("ordinary-actor-faction-flags", 0x1454c0ce0, 0x1454c0eed),
                        ("racial-initial-instance", 0x14549c169, 0x14549c1b2),
                        ("ordinary-cooldown-publication", 0x14549ec0f, 0x14549ed8b),
                        ("racial-scheduler", 0x14549ed8b, 0x14549efd3),
                        ("racial-retry", 0x14549f4e1, 0x14549f4ec)]
        field_spans = []
        for role, start, end in field_ranges:
            offset = pe.rva_offset(start - pe.image_base)
            raw = data[offset:offset + end - start]
            (OUT / f"{role}.asm").write_text(objdump_output([
                "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
                f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True))
            field_spans.append({"role":role,"address":hex(start),"end_exclusive":hex(end),
                "file_offset":hex(offset),"byte_count":len(raw),"sha256":hashlib.sha256(raw).hexdigest()})
        entry = json.loads((ROOT / "crates/azeroth-survivors-re/assets/run-entry-0.97.2.json").read_text())
        assert entry["target_sha256"] == SHA
        abilities = json.loads((ROOT / "docs/analysis/evidence/0.97.2/player-abilities/catalog.json").read_text())
        definitions = {row["key"]:row for row in abilities["definitions"]}
        racial = []
        for race in entry["races"]:
            definition = definitions[race["racial_ability_key"]]
            address = int(definition["record"]["virtual_address"],16)
            offset = pe.rva_offset(address - pe.image_base)
            spell, _, cooldown = struct.unpack_from("<Iff", data, offset+64)
            racial.append({"race_id":race["native_id"],"key":definition["key"],"spell_id":spell,
                "base_cooldown":cooldown,"icon":definition["icon"],
                "faction_template":race["faction_template"],"definition_address":hex(address)})
        (OUT / "client-descriptors.json").write_text(portable_json({
            "target_sha256":SHA,"target_executed":False,"ranges":field_spans,
            "player":{"rest_state":{"field":194,"byte":3,"value":2,"low_byte":"actual facial hair"},
                "faction":{"field":35,"race_table":"0x1469acab8","human_fallback":1},
                "experience_fields":{"current":716,"next_level":717},
                "rest_experience_pool":{"field":1175,"status":"No explicit write in145491140; zero omission is not an independently recovered write."}},
            "ordinary_creature":{"owner":"0x1454c0820","fields":{"object_type":[2,9],
                "faction":[35,14],"bytes0":[36,256],"unit_flags":[46,0],
                "base_attack_time":[126,2000],"offhand_attack_time":[127,2000]},
                "level":{"field":34,"formula":"min(wrapping_u32(run_level + 3*definition_flag4c),63)",
                    "callsite":"1454c24f8..1454c252a passes definition+4c unchanged"},
                "scope_limit":"Boss/guardian values require their actual callsites; this is the ordinary actor creator."},
            "ordinary_cooldown":{"owner":"14549ec0f..14549ed8b",
                "publication":"success only; final min-preserving-NaN scheduled remaining, truncated saturated u32 milliseconds",
                "failure_retry":0.2,"initial_timer":0.5,"retry_and_initial_timer_published":False},
            "racial":{"action_slot_zero_based":11,"initial_instance":"RuntimeInstance::learned: rank1, remaining.5, neutral multipliers/upgrades",
                "scheduler":{"order":"after ordinary auto-casts, before passive/pending/ground/totem owners",
                    "ready":"remaining-=delta; cast when zero>=remaining",
                    "failure_retry":0.5,"success":"max(.25, (((base_cooldown*1.4)*cooldown_multiplier)*talent_cooldown_multiplier)*global_cooldown)",
                    "ordinary_after_success_proc":False,"kind11_special_case":False},"races":racial},
            "limitations":["Static field bindings are not runtime or targeting parity.",
                "Do not infer unwritten descriptor fields or generalize an ordinary actor constructor to other owners."]},indent=2)+"\n")
    print(f"Verified selected EXE; prepared={args.prepare}, retained={len(records)} functions")


if __name__ == "__main__":
    main()
