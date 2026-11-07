#!/usr/bin/env python3
"""Curate typed config evidence from existing exact REA scopes; no target execution."""
from portable_paths import portable_json

import hashlib
import importlib.util
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent
SHA = "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"


def main():
    data = (ROOT / "AzerothSurvivors/AzerothSurvivors.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)

    def read(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + length]

    assert read(0x145A4A878, 11) == b"LocalConfig"
    field, length = struct.unpack("<QQ", read(0x145A4A888, 16))
    assert (field, length) == (0x145A4A883, 5)
    assert read(field, length) == b"cvars"
    records = []
    visitor = None
    for address in (0x140EAF640, 0x1408D0C20, 0x140C937D0, 0x140C8F030, 0x140C90460):
        bundle = ROOT / f"runtime/analysis/history/interface/menu-recovery/0558cac00653/rea-{address:x}/evidence-bundle.json"
        record = next(r for r in json.loads(bundle.read_text())["records"]
                      if r["operation"] == "analyze_function")
        value = record["raw_result"]["value"]
        records.append({"function": hex(address), "evidence_id": record["evidence_id"],
                        "provider": record["provider"], "limitations": record["limitations"]})
        if address == 0x140C8F030:
            visitor = value
    assembly = "\n".join(visitor["assembly"]) + "\n"
    assert "0x145a4a883" in assembly and "0x140c90460" in assembly
    directory = ROOT / "docs/analysis/evidence/0.92"
    (directory / "options-config-struct-visitor.asm").write_text(assembly)
    dependency = b"toml-0.8.23"
    offset = data.index(dependency)
    result = {
        "date": "2026-10-16", "target_sha256": SHA,
        "method": "Exact static REA/Ghidra scopes plus original PE strings and Win64 instructions.",
        "rea_dossiers": records,
        "deserialize_entry": {
            "reader": "140eaf640 calls1408d0c20 at140eaf748 with LocalConfig ptr145a4a878,len11 and field array145a4a888,count1.",
            "field": {"name": "cvars", "address": hex(field), "length": length},
            "typed_parse": "1408d0c20 parses TOML through14097e710, then passes the typed struct descriptor to140c937d0 at1408d0ee2. Only success tag2 returns the24-byte CVar map; every other result takes the whole-document error path.",
            "reader_result": "140eaf74e tests typed success; success maps to StoredConfig::Table tag1. Parse/type errors become Bad tag2 with the malformed/defaults message. Missing/config-path-absent is tag0.",
        },
        "struct_visitor": {
            "owner": "140c8f030..140c8f810",
            "field_match": "140c8f176..140c8f19e compares exact5-byte key cvars; field names are case sensitive.",
            "unknown": "140c8f224..140c8f249 calls140c8fd20 to skip unknown root fields.",
            "value": "140c8f32d calls the typed map decoder140c90460; non-success at140c8f333 propagates the error instead of returning a partial LocalConfig.",
            "absent": "140c8f503..140c8f542 returns the default empty map when no cvars field was consumed.",
            "duplicates": "The already-consumed-field branch140c8f254..140c8f25b reaches140c8f774's duplicate-field error.",
        },
        "parser_dependency": {"literal": dependency.decode(), "file_offset": hex(offset),
                              "source_lock": "Cargo.lock also resolves toml0.8.23; source uses typed serde Config, not an untyped partial fold."},
        "string_map_evidence": "options-config-string-map-native.json independently closes per-entry String-only typing, whole-map failure and the whole-field DateTime adapter.",
        "implementation": {
            "module": "crates/azeroth-survivors-re/src/options_config.rs",
            "owner": "crates/azeroth-survivors-re/src/options.rs",
            "scope": "Whole typed parse; warning/default fallback without boot write or permanent hold; recognized menu CVar numeric validation with original raw map retained.",
            "validation": "Build25 PASS14.34s locked/offline; six config fixtures PASS within105 overlapping focused menu harness cases. No app launch or installed-file access.",
            "limits": ["The complete native registry, session environment ownership and callbacks are not integrated.",
                       "No original or rebuilt UI was launched for malformed-config comparison."]
        },
        "limitations": ["Generic raw-image Ghidra signatures are not Win64 parameter proof; original instructions supply register mapping.",
                        "Generic TOML dispatchers reference external jump tables omitted from slices. Type-specific visitor and original PE instructions are read separately.",
                        "The separate startup-load dossier binds warning, raw-map preservation and numeric parsing; this script does not execute target instructions."]
    }
    (directory / "options-config-typed-native.json").write_text(portable_json(result, indent=2) + "\n")
    print(f"PASS: {len(records)} typed-config REA scopes and exact struct/field/parser literals")


if __name__ == "__main__":
    main()
