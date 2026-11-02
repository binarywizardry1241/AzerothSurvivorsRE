#!/usr/bin/env python3
"""Verify native DEATH popup suppression and its actual core-file source route.

No compilation, game launch or native instruction execution. --prepare-rea
recreates the exact raw Ghidra query inputs; the journaled REA runner owns queries.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
WORK = ROOT / "runtime/q41-data-contracts-0.115.0/static-popup"
KEEP = ROOT / "docs/analysis/evidence/0.115.0/q41-death-popup.json"
START, END = 0x145995680, 0x1459958a1


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    return {"path": path.relative_to(ROOT).as_posix(), "sha256": digest(path.read_bytes())}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare-rea", action="store_true")
    parser.add_argument("--write", action="store_true")
    options = parser.parse_args()
    target = latest_target(verify=True)
    assert target["version"] == "0.115.0" and target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("q41_death_popup_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(start, length):
        at = pe.rva_offset(start - pe.image_base)
        return image[at:at + length]

    owner = raw(START, END - START)
    if options.prepare_rea:
        WORK.mkdir(parents=True, exist_ok=True)
        relative = WORK.relative_to(ROOT)
        plan = {
            "target": str(relative / "owner.bin"), "output": str(relative / "rea"),
            "init_timeout": 60, "timeout": 180,
            "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(START)},
            "environment": {"REA_GHIDRA_SEED_FILE": str(relative / "seeds.tsv")},
            "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": hex(START)},
                            "label": "AS-StaticPopup-DEATH-patch-bootstrap"}],
        }
        files = {"owner.bin": owner, "seeds.tsv": f"{START:#x}\tfunction\n{START:#x}\tcode\n".encode(),
                 "plan.json": (json.dumps(plan, indent=2) + "\n").encode()}
        for name, contents in files.items():
            path = WORK / name
            if path.exists():
                assert path.read_bytes() == contents, f"Changed native query input: {path}"
            else:
                path.write_bytes(contents)
        print(f"./scripts/rea query {relative / 'plan.json'}")
        return

    assembly_path = ROOT / "docs/analysis/evidence/0.115.0/death-popup-bootstrap.asm"
    instructions = []
    cursor = START
    for line in assembly_path.read_text().splitlines():
        address, encoded, decoded = line.split(" ", 2)
        assert int(address, 16) == cursor
        value = bytes.fromhex(encoded)
        assert raw(cursor, len(value)) == value
        instructions.append({"site": hex(cursor), "bytes": encoded, "decoded": decoded})
        cursor += len(value)
    assert cursor == END
    lua_path = ROOT / "docs/analysis/evidence/0.115.0/death-popup.lua"
    lua = lua_path.read_bytes()
    assert lua == raw(0x1473339ac, 271)
    assert raw(0x1473339a8, 4).hex() == "c0800f01"
    path_bytes = b"Interface\\FrameXML\\StaticPopup.lua"
    assert raw(0x147333abc, 34) == path_bytes
    # Retain exact native arguments/calls at the necessary shared interface.
    sites = {int(row["site"], 16): row for row in instructions}
    exact = {
        0x1459956ea: "4c8d05cbe39901",  # original core file path in r8
        0x1459956f9: "41b922000000",    # exact 34-byte path length
        0x1459956ff: "e80ccc2300",      # current shared file read interface
        0x145995741: "488d45d0",        # previously read core string argument
        0x145995754: "488d154de29901",  # compact old-string + Lua format template
        0x145995763: "e8e81b3500",      # formatter
        0x145995791: "488d0d24e39901",  # same core path on replacement
        0x14599579c: "ba22000000",      # same exact path length
        0x1459957a1: "e8caf82300",      # current shared core content publication
    }
    assert all(sites[site]["bytes"] == encoded for site, encoded in exact.items())
    journal_path = WORK / "rea/journal.json"
    journal = json.loads(journal_path.read_text())
    assert journal["status"] == "completed"
    assert journal["identity"]["target"]["sha256"] == digest(owner)
    operation = next(row for row in journal["operations"].values()
                     if row["arguments"] == {"procedure": hex(START)})
    assert operation["status"] == "completed"
    result_path = ROOT / operation["result"]["path"]
    assert digest(result_path.read_bytes()) == operation["result"]["sha256"]
    evidence = json.loads(result_path.read_text())["structuredContent"]
    assert evidence["subject"]["digest"]["sha256"] == digest(owner)

    source_path = ROOT / "crates/azeroth-survivors-re/src/gameplay/client/framexml_hud.rs"
    source = source_path.read_text()
    assert "death-popup.lua" in source and r"Interface\FrameXML\StaticPopup.lua" in source
    assert "DEATH_POPUP.into()" in source
    harness_path = ROOT / "scripts/check-q41-death-popup.lua"
    execution = subprocess.run(["lua", str(harness_path)], cwd=ROOT,
                               check=True, capture_output=True, text=True)
    assert "Passed 52 native death-popup Lua checks" in execution.stdout
    proof = {
        "schema_version": 1, "target": {"version": "0.115.0", "sha256": SHA},
        "gap_ids": [41, 106],
        "lead_ids": ["Q41-I01:game_binding_identifier:195", "Q41-I01:game_binding_identifier:196",
                     "Q41-I01:lua_function_declaration:157", "Q41-I01:resource_path:211"],
        "generator": receipt(Path(__file__).resolve()),
        "native_owner": {"start": hex(START), "end_exclusive": hex(END), "sha256": digest(owner),
                         "assembly": receipt(assembly_path), "instructions": len(instructions)},
        "lua": {**receipt(lua_path), "start": "0x1473339ac", "bytes": len(lua)},
        "compact_format_prefix": {"start": "0x1473339a8", "bytes": "c0800f01"},
        "path": {"start": "0x147333abc", "bytes": 34, "value": path_bytes.decode()},
        "interface_sites": [sites[site] for site in exact],
        "ghidra": {"evidence_id": evidence["evidence_id"],
                   "profile": evidence["analysis_profile"]["digest"],
                   "result": receipt(result_path), "journal": receipt(journal_path),
                   "plan": receipt(WORK / "plan.json"), "seed": receipt(WORK / "seeds.tsv")},
        "source": receipt(source_path),
        "interpreted_lua": {"harness": receipt(harness_path), "cases": 52, "vm_generations": 2},
        "limits": [
            "Bounded raw-function Ghidra recovery omits shared filesystem, formatting and core-publication callee bodies; their current interfaces are reused from existing core-patch recovery.",
            "Only the exact recovered Lua executes with a stock-popup seam. The original application, Rust source, core loader, actual death/revive lifecycle and game inputs do not execute.",
            "No compilation, application/game/network execution, rendered verification or original/rebuilt parity comparison.",
        ],
    }
    if options.write:
        KEEP.write_text(portable_json(proof, indent=2) + "\n")
    else:
        assert portable_record(json.loads(KEEP.read_text())) == portable_record(proof), "Curated DEATH popup proof differs"
    print("PASS: 545 native bootstrap bytes, 271 exact Lua bytes, nine interface guards and 52 interpreted Lua cases; compilation/runtime/parity unverified")


if __name__ == "__main__":
    main()
