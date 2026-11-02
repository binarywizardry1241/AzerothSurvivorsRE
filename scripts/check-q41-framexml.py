#!/usr/bin/env python3
"""Check the complete selected-target core Lua contract without compilation.

Reuses the canonical HUD Lua and current raid-popup/native-bootstrap evidence;
does not duplicate native extracts, launch REA or execute a game application.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
KEEP = ROOT / "docs/analysis/evidence/0.115.0/q41-framexml.json"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    return {"path": path.relative_to(ROOT).as_posix(), "sha256": digest(path.read_bytes())}


def derive():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA and target["version"] == "0.115.0"
    image = target_bytes(target)
    pe = load_script("q41_framexml_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(start, length):
        at = pe.rva_offset(start - pe.image_base)
        return image[at:at + length]

    owner_path = ROOT / "docs/analysis/evidence/0.115.0/raid-targets/manifest.json"
    owner = json.loads(owner_path.read_text())
    assert owner["target"]["sha256"] == SHA
    bootstrap = next(row for row in owner["functions"] if row["role"] == "core-patch-bootstrap")
    assert digest(raw(int(bootstrap["start"], 16), int(bootstrap["end_exclusive"], 16)
                      - int(bootstrap["start"], 16))) == bootstrap["sha256"]
    assembly_path = owner_path.parent / owner["assembly"]["path"]
    assert digest(assembly_path.read_bytes()) == owner["assembly"]["sha256"]
    descriptor = owner["core_patch_descriptor"]
    encoded = raw(int(descriptor["address"], 16), 16)
    assert encoded.hex() == descriptor["bytes"]
    pointer, length = struct.unpack("<QQ", encoded)
    assert (pointer, length) == (int(descriptor["pointer"], 16), descriptor["length"])
    patch = raw(pointer, length)
    source_path = ROOT / "docs/analysis/evidence/0.108.0/hud-framexml/world-state-patch.lua"
    popup_path = owner_path.parent / owner["popup"]["path"]
    source, popup = source_path.read_bytes(), popup_path.read_bytes()
    assert digest(popup) == owner["popup"]["sha256"]
    assert patch.count(popup) == 1
    popup_at = patch.index(popup)
    assert patch[:popup_at] + patch[popup_at + len(popup):] == source
    assert pe.rva_offset(pointer + popup_at - pe.image_base) == int(owner["popup"]["file_offset"], 16)
    old_start = source.index(b"function UpdateTalentButton()")
    old_end = source.index(b"-- Azeroth Survivors: a spell's tooltip beside its action button")
    restored = len(source) - (old_end - old_start)
    assert restored == 2013

    source_files = [
        ROOT / "crates/azeroth-survivors-re/src/gameplay/client/framexml_hud.rs",
        ROOT / "crates/azeroth-survivors-re/src/gameplay/client.rs",
        ROOT / "crates/azeroth-survivors-re/src/gameplay/client/raid_targets.rs",
        ROOT / "crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs",
        ROOT / "crates/benilla-app/src/ui_script/addons.rs",
        ROOT / "crates/benilla-app/src/ui_script/manifest.rs",
    ]
    hud, bridge, raid, addon, loader, manifest = [path.read_text() for path in source_files]
    checks = {
        "whole immutable Lua source appended without substring filtering":
            "SOURCE.into()" in hud and ".split_once(" not in hud
            and "world-state-patch.lua" in hud,
        "HUD append precedes generated API and separate popup appends":
            "extension.framexml_appends.splice(0..0, framexml_hud::appends())" in bridge
            and "extension.framexml_appends.extend(raid_targets::appends())" in bridge
            and "framexml_appends: vec![(" in addon,
        "popup still has one dedicated source owner":
            'raid-targets/popup.lua' in raid and "POPUP.into()" in raid
            and "raid-targets/popup.lua" not in hud,
        "direct and nested core reads append all matching fragments":
            "for (target, source) in appends" in loader
            and "bytes.extend_from_slice(source.as_bytes())" in loader
            and "&provider" in loader
            and "core.load_files_into_with_appends(" in manifest,
        "locale changes update stats postlude rather than replaying core wrappers":
            "extension.script_postlude = run_stats::source(Some(&locale))" in bridge
            and bridge.count("framexml_hud::appends()") == 1,
    }
    assert all(checks.values()), [name for name, value in checks.items() if not value]
    lua = subprocess.run(["lua", "scripts/check-framexml-hud.lua"], cwd=ROOT,
                         check=True, capture_output=True, text=True)
    assert "Passed 242 exact native FrameXML Lua checks" in lua.stdout, lua.stdout
    return {
        "schema_version": 1,
        "target": {"version": "0.115.0", "sha256": SHA},
        "gap_ids": [41, 105],
        "lead_ids": ["Q41-B02", "Q41-I01"],
        "generator": receipt(Path(__file__).resolve()),
        "canonical_evidence": [receipt(owner_path), receipt(assembly_path),
                               receipt(source_path), receipt(popup_path)],
        "native_patch": {"descriptor": descriptor, "bytes": length,
                         "sha256": digest(patch), "canonical_without_popup_bytes": len(source),
                         "restored_prefix_bytes": old_start,
                         "restored_suffix_bytes": len(source) - old_end,
                         "separate_popup_offset": popup_at},
        "bootstrap": bootstrap,
        "source_files": [receipt(path) for path in source_files],
        "source_inspection": checks,
        "interpreted_lua": {"harness": receipt(ROOT / "scripts/check-framexml-hud.lua"),
                            "cases": 242, "vm_generations": 2},
        "limits": [
            "Native bootstrap/code and descriptor reuse current hash-bound Ghidra evidence; no new native query is required for these exact bytes.",
            "Lua executes with explicit widgets, stock-function, event and tooltip seams; source inspection does not execute Rust or the real core loader.",
            "No compilation, application launch, real input/rendering, game/network execution or original/rebuilt parity comparison.",
        ],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    options = parser.parse_args()
    proof = derive()
    encoded = json.dumps(proof, indent=2) + "\n"
    if options.write:
        KEEP.write_text(encoded)
    else:
        assert json.loads(KEEP.read_text()) == proof, "Curated core Lua proof differs"
    print("PASS: full 11,034-byte native patch, 2,013 restored Lua bytes, five live source guards and 242 interpreted Lua cases; compilation/runtime/parity unverified")


if __name__ == "__main__":
    main()
