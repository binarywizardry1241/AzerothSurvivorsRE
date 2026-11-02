#!/usr/bin/env python3
"""Prepare exact 0.97.2 home-screen slices for REA/Ghidra; collect curated provenance.

Never launches the game. --prepare writes disposable input/plans under runtime;
--collect records original PE ranges, instruction text and available REA identities.
The reconstructed application never reads this EXE or these analysis artifacts.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script

import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
WORK = ROOT / "runtime/menu-0972"
OUT = ROOT / "docs/analysis/evidence/0.97.2"
FUNCTIONS = {
    "picker-root": 0x140097180,
    "picker-hover": 0x140098E10,
    "decorative-sweep": 0x140099940,
    "shared-scroll-wheel": 0x140072320,
    "scrollbar-metrics": 0x140071480,
    "class-pane-wrapper": 0x14008E260,
    "class-tile": 0x14008E6B0,
    "zone-pane-wrapper": 0x140090690,
    "class-pane": 0x140241ED0,
    "top-controls": 0x140245750,
    "footer": 0x140249100,
    "title-and-tabs": 0x14024A960,
    "zone-list": 0x14024B870,
    "picker-shell": 0x14024D6D0,
    "zone-details": 0x140255100,
    "scrollbar-constructor": 0x14004C680,
}


def write(path, value):
    path.write_text(portable_json(value, indent=2, ensure_ascii=False) + "\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare", action="store_true")
    parser.add_argument("--collect", action="store_true")
    args = parser.parse_args()
    if not (args.prepare or args.collect):
        parser.error("select --prepare and/or --collect")
    data = TARGET.read_bytes()
    if hashlib.sha256(data).hexdigest() != SHA:
        raise SystemExit("0.97.2 target SHA-256 mismatch")
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)
    functions = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    WORK.mkdir(parents=True, exist_ok=True)
    OUT.mkdir(parents=True, exist_ok=True)
    records = []
    for name, start in FUNCTIONS.items():
        end = functions[start]
        offset = pe.rva_offset(start - pe.image_base)
        payload = data[offset:offset + end - start]
        stem = f"home-{start:x}"
        if args.prepare:
            (WORK / f"{stem}.bin").write_bytes(payload)
            write(WORK / f"{stem}-plan.json", {
                "target": str((WORK / f"{stem}.bin").relative_to(ROOT)),
                "output": str((WORK / f"rea-{start:x}").relative_to(ROOT)),
                "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(start)},
                "timeout": 120,
                "environment": {"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
                "operations": [{"name": "analyze_function", "arguments": {"procedure": hex(start)}, "timeout": 240}],
            })
        assembly = objdump_output([
            "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
            f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
        (WORK / f"{stem}.asm").write_text(assembly)
        literals = []
        # Original disassembly resolves RIP operands against the complete PE.
        # Retain bytes, not a guessed type for every referenced address.
        addresses = sorted(set(int(x, 16) for x in re.findall(r"# (0x[0-9a-f]+)", assembly)))
        for address in addresses:
            try:
                at = pe.rva_offset(address - pe.image_base)
            except ValueError:
                continue
            raw = data[at:at + 16]
            if len(raw) != 16:
                continue
            literals.append({"va": hex(address), "file_offset": hex(at), "bytes_hex": raw.hex()})
        record = {"role": name, "start": hex(start), "end_exclusive": hex(end),
                  "file_offset": hex(offset), "byte_count": len(payload),
                  "slice_sha256": hashlib.sha256(payload).hexdigest(),
                  "boundary": "original PE RUNTIME_FUNCTION start/end", "literal_regions": literals}
        bundle_path = WORK / f"rea-{start:x}/evidence-bundle.json"
        if bundle_path.exists():
            bundle = json.loads(bundle_path.read_text())
            dossier = next((r for r in bundle["records"] if r["operation"] == "analyze_function"), None)
            if dossier:
                record["rea"] = {key: dossier[key] for key in ("evidence_id", "authority", "confidence", "provider", "analysis_profile", "limitations")}
                record["rea"]["body"] = dossier["normalized_result"]["procedure"]["body"]
        records.append(record)
    if args.collect:
        write(OUT / "home-native.json", {
            "date": "2026-10-18", "target": str(TARGET.relative_to(ROOT)), "target_sha256": SHA,
            "target_executed": False, "functions": records,
            "method": "REA/Ghidra on unchanged PE function slices at original VAs; original full-PE disassembly and constant bytes cross-check Windows x64 call/store interpretation.",
            "limitations": [
                "Recovered pseudocode is not original Rust source.",
                "Raw imports omit callees and constants; their generic GCC ABI cannot establish Windows x64 signatures.",
                "A slice may have gaps in its analyzed body. Whole unwind span hashes include every original byte; analyzed coverage is recorded separately.",
                "Pointer/string matches establish recovery leads; manual instruction and data binding is required for UI semantics.",
                "Static evidence and a successful build do not establish rendered or functional parity.",
            ],
        })
    print(f"{'Prepared' if args.prepare else 'Collected'} {len(records)} target-bound home function ranges.")


if __name__ == "__main__":
    main()
