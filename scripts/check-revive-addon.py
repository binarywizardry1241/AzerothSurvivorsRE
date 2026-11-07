#!/usr/bin/env python3
"""Check recovered revive bytes, live source wiring and isolated Lua; no compiler/game."""

import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

EVIDENCE = ROOT / "docs/analysis/evidence/revive-addon"
WORK = ROOT / "runtime/analysis/history/co-op/revive-implementation/e5305123b4cc/checks"
CLIENT = ROOT / "crates/azeroth-survivors-re/src/gameplay/client"


def digest(value):
    return hashlib.sha256(value).hexdigest()


def included(source, name):
    match = re.search(r"const " + name + r': &str =\s*include_str!\("([^"]+)"\);', source)
    assert match, name
    path = (CLIENT / match[1]).resolve()
    assert path.is_relative_to(ROOT)
    return path.read_text()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare-rea", action="store_true")
    args = parser.parse_args()
    evidence = json.loads((EVIDENCE / "manifest.json").read_text())
    target = latest_target(verify=True)
    assert target["sha256"] == evidence["target"]["sha256"], "Changed target needs fresh recovery"
    data = target_bytes(target)
    pe = load_script("revive_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def check(row):
        start = int(row["file_offset"], 16)
        size = row.get("size")
        if size is None:
            size = int(row["end_exclusive"], 16) - int(row["start"], 16)
        value = data[start:start + size]
        assert digest(value) == row["sha256"], row
        return value

    for row in evidence["native_owners"] + evidence["instruction_ranges"]:
        check(row)
    assembly = (EVIDENCE / evidence["assembly"]["path"]).read_bytes()
    assert digest(assembly) == evidence["assembly"]["sha256"]
    for line in assembly.decode().splitlines():
        if not line or line.startswith(";"):
            continue
        address, encoded, *_ = line.split()
        offset = pe.rva_offset(int(address, 16) - pe.image_base)
        value = bytes.fromhex(encoded)
        assert data[offset:offset + len(value)] == value
    api = evidence["embedded_api"]
    value = data[int(api["file_offset"], 16):int(api["end_exclusive"], 16)]
    assert digest(value) == api["sha256"]
    assert value == (ROOT / api["path"]).read_bytes()
    for row in evidence["hud_mapping"]:
        offset = pe.rva_offset(int(row["address"], 16) - pe.image_base)
        record = data[offset:offset + 32]
        assert record.hex() == row["bytes"]
        key, size, cvar, length = struct.unpack("<QQQQ", record)
        for address, count, text in [(key, size, row["part"]), (cvar, length, row["cvar"])]:
            at = pe.rva_offset(address - pe.image_base)
            assert data[at:at + count].decode() == text

    bootstrap = (CLIENT / "addon_bootstrap.rs").read_text()
    source = included(bootstrap, "SOURCE")
    assert source.encode() == value, "Bootstrap must install the exact current API"
    for guard in ["AZS_REVIVE = {};", "function AZS_GetRevive()",
                  'elseif ( arg1 == "AZSREVIVE" ) then']:
        assert source.count(guard) == 1
    assert 'source.replace("HUD_CVARS_LUA", &parts)' in bootstrap

    settings = (CLIENT.parent / "run_hud/settings.rs").read_text()
    parts_block = settings.split("const PARTS:", 1)[1].split("\n];", 1)[0]
    parts = re.findall(r'\("([^"]+)", "([^"]+)"\)', parts_block)
    assert parts == [(row["part"], row["cvar"]) for row in evidence["hud_mapping"]]
    for guard in ["visible: [bool; PARTS.len()]", "visible: [true; PARTS.len()]",
                  "Local<[Mirror; PARTS.len() + 1]>", 'cvar.into(), "1".into()',
                  "key.eq_ignore_ascii_case(name)"]:
        assert guard in settings, guard
    bridge = (CLIENT.parent / "client.rs").read_text()
    assert bridge.count('M::new("AZSREVIVE", coop.as_ref().map_or_else(String::new,') == 1
    assert 'state.party.revive_payload(0, state.shared_running)' in bridge
    party = (CLIENT.parent.parent / "coop/game_party.rs").read_text()
    assert 'if !self.active {' in party and 'return String::new();' in party
    assert bridge.index('M::new("AZSBOSSDMG"') < bridge.index('M::new("AZSREVIVE"') < bridge.index('M::new("AZSTAKEN"')
    feed = (CLIENT / "addon_feed.rs").read_text()
    assert 'self.cached.get(message.prefix).map_or("", String::as_str) == message.payload' in feed

    WORK.mkdir(parents=True, exist_ok=True)
    staged = WORK / "addon-api.lua"
    staged.write_text(source)
    interpreter = shutil.which("lua")
    assert interpreter, "Existing Lua interpreter required; no package is installed"
    result = subprocess.run([interpreter, "scripts/check-addon-bootstrap.lua", str(staged)],
                            cwd=ROOT, text=True, capture_output=True, check=True)
    (WORK / "lua-result.txt").write_text(result.stdout)
    print(result.stdout, end="")
    print("PASS: 6 current native owners, 8 instruction excerpts, exact current API, 10 HUD mappings and solo live-feed connection; no compiler/game")

    if args.prepare_rea:
        output = WORK.parent / "reproduce"
        output.mkdir(parents=True, exist_ok=True)
        seeds = output / "seeds.tsv"
        seeds.write_text("".join(f"{row['start']}\tfunction\n{row['start']}\tcode\n"
                                 for row in evidence["native_owners"]))
        plan = dict(target=target["path"], output=str((output / "rea").relative_to(ROOT)),
                    timeout=240, init_timeout=60, open_timeout=120,
                    environment={"REA_GHIDRA_STARTUP_TIMEOUT_MS": "600000",
                                 "REA_GHIDRA_SEED_FILE": str(seeds.relative_to(ROOT)),
                                 "REA_GHIDRA_DISABLED_ANALYZERS": "Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables,Call Convention ID"},
                    operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=row["start"]),
                                     label=row["start"], timeout=660 if index == 0 else 240)
                                for index, row in enumerate(evidence["native_owners"])])
        (output / "plan.json").write_text(json.dumps(plan, indent=2) + "\n")
        print("Prepared durable static REA plan:", (output / "plan.json").relative_to(ROOT))


if __name__ == "__main__":
    main()
