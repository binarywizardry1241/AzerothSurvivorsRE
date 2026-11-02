#!/usr/bin/env python3
"""Prepare/collect selected-target upgrade owners; raw Ghidra is corroborated by PE assembly."""
from portable_paths import objdump_output, portable_json
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "runtime/consolidation-2026-10-19"
OUT = ROOT / "runtime/native-evidence/0.100.1/upgrade-flow"
ROLES = ("choice-complete", "cards-animate", "card-tooltip", "cards-ray-image", "cards-root")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("prepare", "collect"))
    args = parser.parse_args()
    target = json.loads((ROOT / "docs/analysis/target-refresh-0.100.1.json").read_text())["current_target"]
    image = (ROOT / target["path"]).read_bytes()
    assert hashlib.sha256(image).hexdigest() == target["sha256"]
    mapping = json.loads((ROOT / "runtime/levelup-0.100.1/mapping.json").read_text())
    assert mapping["target_sha256"] == target["sha256"]
    records = []
    for role in ROLES:
        entry = next(row for row in mapping["functions"] if row["role"] == role)
        source = entry["source"]
        start, end = int(source["address"], 16), int(source["end_exclusive"], 16)
        offset, count = int(source["file_offset"], 16), source["byte_count"]
        raw = image[offset:offset + count]
        assert hashlib.sha256(raw).hexdigest() == source["sha256"]
        output = WORK / ("rea-" + role)
        if args.action == "prepare":
            body = WORK / (role + ".bin")
            body.write_bytes(raw)
            plan = {
                "target": str(body.relative_to(ROOT)), "output": str(output.relative_to(ROOT)),
                "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(start)},
                "init_timeout": 60, "timeout": 180, "open_timeout": 60,
                "environment": {"REA_GHIDRA_STARTUP_TIMEOUT_MS": "120000", "REA_GHIDRA_DISABLED_ANALYZERS": "Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Non-Returning Functions - Discovered"},
                "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": hex(start)}}],
            }
            (WORK / ("plan-" + role + ".json")).write_text(portable_json(plan, indent=2) + "\n")
        else:
            OUT.mkdir(parents=True, exist_ok=True)
            record = json.loads((output / "003-procedure_pseudo_code.json").read_text())
            evidence = record["response"]["result"]["structuredContent"]
            assert evidence["subject"]["digest"]["sha256"] == source["sha256"]
            (OUT / (role + ".ghidra.c")).write_text("\n".join(line.rstrip() for line in evidence["normalized_result"].splitlines()).rstrip() + "\n")
            assembly = objdump_output(["objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}", f"--stop-address={end:#x}", str(ROOT / target["path"])], cwd=ROOT, text=True)
            (OUT / (role + ".asm")).write_text(assembly)
            records.append({"role": role, "source": source, "evidence_id": evidence["evidence_id"], "analysis_profile": evidence["analysis_profile"], "limitations": ["Raw import excludes external callees, RIP-relative constants and jump tables; PE assembly controls their interpretation.", "The raw import uses GCC ABI; it does not recover the Windows parameter signature.", "Pseudocode warnings and omitted external tail jumps remain explicit; this is static evidence, not runtime parity."]})
        print(role, source["address"], args.action, flush=True)
    if args.action == "collect":
        (OUT / "manifest.json").write_text(portable_json({"target": target["path"], "target_sha256": target["sha256"], "functions": records}, indent=2) + "\n")


if __name__ == "__main__":
    main()
