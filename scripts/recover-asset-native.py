#!/usr/bin/env python3
"""Reproduce hash-bound 0.97.2 asset-loader slices and optional REA/Ghidra evidence.

This is optional analysis tooling. Source builds never read the reference EXE.
All inputs, slices, plans, REA runtime files and reports remain in this checkout.
"""
from portable_paths import portable_json

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parent.parent
EXPECTED = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
FUNCTIONS = {
    "data-directory": (0x1455C9310, 0x1455C9721),
    "font-register": (0x1455084B0, 0x145508708),
    "font-autonyms": (0x1401D8CB0, 0x1401D8E1F),
    "font-cjk": (0x1455049A0, 0x145504B8A),
}


def local(value):
    path = (ROOT / value).resolve()
    if not path.is_relative_to(ROOT):
        raise argparse.ArgumentTypeError("path must remain inside this checkout")
    return path


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(value, indent=2, ensure_ascii=False) + "\n")


def recover(binary, runtime, output, run_rea):
    data = binary.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if digest != EXPECTED:
        raise ValueError("fixed native addresses require SHA-256 " + EXPECTED)
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    rva, length = pe.directories[3]
    start = pe.rva_offset(rva)
    boundaries = {tuple(pe.image_base + n for n in struct.unpack_from("<II", data, at))
                  for at in range(start, start + length, 12)}
    runtime.mkdir(parents=True, exist_ok=True)
    records = []
    for name, (address, end) in FUNCTIONS.items():
        if (address, end) not in boundaries:
            raise ValueError(f"{name}: PE exception-directory boundary mismatch")
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + end - address]
        slice_path = runtime / f"function-{address:x}.bin"
        slice_path.write_bytes(raw)
        slice_sha = hashlib.sha256(raw).hexdigest()
        session = runtime / f"rea-{name}"
        plan_path = runtime / f"rea-{name}-plan.json"
        plan = {
            "target": str(slice_path.relative_to(ROOT)),
            "output": str(session.relative_to(ROOT)),
            "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(address)},
            "timeout": 120, "open_timeout": 90, "cleanup_timeout": 60,
            "environment": {"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
            "operations": [{"name": "analyze_function", "arguments": {"procedure": hex(address)}, "timeout": 240}],
        }
        save(plan_path, plan)
        if run_rea:
            # rea-batch refuses an existing session directory, preserving earlier evidence.
            subprocess.run(["python3", str(ROOT / "scripts/rea-batch.py"), str(plan_path)], cwd=ROOT, check=True)
        record = {
            "name": name, "virtual_address": hex(address), "end_exclusive": hex(end),
            "file_offset": hex(offset), "bytes": len(raw), "sha256": slice_sha,
            "boundary_basis": "Matching selected EXE PE exception-directory entry; exact immutable byte slice.",
            "rea_plan": str(plan_path.relative_to(ROOT)), "rea_status": "not-run",
        }
        dossier = session / "003-analyze_function.json"
        if dossier.exists():
            response = json.loads(dossier.read_text())["response"]["result"]
            evidence = response.get("structuredContent")
            if not evidence:
                evidence = json.loads(next(c["text"] for c in response["content"] if c["type"] == "text"))
            if evidence["subject"]["digest"]["sha256"] != slice_sha:
                raise ValueError(f"{name}: retained REA evidence has a different slice hash")
            if evidence["parameters"]["procedure"] != hex(address):
                raise ValueError(f"{name}: retained REA evidence selects another function")
            value = evidence["raw_result"]["value"]
            record.update(rea_status="analysed", evidence_id=evidence["evidence_id"],
                          provider=evidence["provider"], analysis_profile=evidence["analysis_profile"],
                          procedure=value["procedure"], pseudocode=value["pseudocode"], assembly=value["assembly"])
        records.append(record)
    report = {
        "schema_version": 1, "target_version": "0.97.2", "target": str(binary.relative_to(ROOT)),
        "target_sha256": digest, "target_executed": False, "functions": records,
        "limitations": [
            "REA/Ghidra analysed exact function slices, not a fully linked executable database.",
            "External callees/data are absent from each slice; ABI types and callees remain inferred.",
            "Native addresses and exact byte-slice hashes retain source provenance; pseudocode alone is not parity proof.",
            "Font payloads/path records are independently validated in exe-assets.json; no original/rebuilt launch occurred.",
        ],
    }
    save(output, report)
    print(f"Asset native evidence: {sum(r['rea_status'] == 'analysed' for r in records)}/{len(records)} functions; {output.relative_to(ROOT)}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=local, default=local("AzerothSurvivors/AzerothSurvivors-0.97.2.exe"))
    parser.add_argument("--runtime", type=local, default=local("runtime/asset-recovery-0.97.2"))
    parser.add_argument("--output", type=local, default=local("docs/analysis/evidence/0.97.2/asset-native.json"))
    parser.add_argument("--run-rea", action="store_true", help="run new Ghidra sessions; choose a fresh --runtime directory")
    args = parser.parse_args()
    try:
        recover(args.binary, args.runtime, args.output, args.run_rea)
    except (ValueError, OSError, KeyError, subprocess.CalledProcessError) as error:
        parser.exit(1, f"{error}\n")


if __name__ == "__main__":
    main()
