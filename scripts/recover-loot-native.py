#!/usr/bin/env python3
"""Retain reproducible 0.97.2 loot disassembly and curated REA/Ghidra evidence.

Never executes the EXE. REA itself is invoked separately through scripts/rea-batch.py.
Binary slices and protocol logs remain ignored under runtime/; only textual evidence
is retained under docs. No reference artifact is needed to compile the Rust source.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script

import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA256 = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
SCOPES = {
    "upgrade-choice": 0x1454DA5F0,
    "reward-completion": 0x1454DBBC0,
    "upgrade-card": 0x1454DED40,
    "cache-choice": 0x1454E1D00,
    "apply-choice": 0x1454E40A0,
    "jewelry-increment": 0x145412BB0,
    "amulet-multiplier": 0x1454139E0,
    "enemy-death": 0x1454C2EB0,
    "boss-drops": 0x1454589F0,
    "boss-slot-distribution": 0x1455287E0,
    "boss-tier-iterator": 0x14552CB40,
    "integer-range": 0x1454F9A40,
    "run-reward-multiplier": 0x145451160,
    "pending-items-owner": 0x1454D2380,
}
# Leaf routines have no RUNTIME_FUNCTION entry. Bounds are explicit observed
# disassembly spans; the manifest does not pretend they came from unwind data.
LEAF_ENDS = {0x145412BB0: 0x145413212, 0x1454139E0: 0x145413A59,
             0x145451160: 0x1454511C8}


def local_path(value):
    path = (ROOT / value).resolve()
    if not path.is_relative_to(ROOT):
        raise ValueError(f"Path escapes project: {value}")
    return path


def save(path, value):
    path.write_text(portable_json(value, indent=2, ensure_ascii=False) + "\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--import-rea", help="Project-local parent of completed REA batch directories")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    actual = hashlib.sha256(data).hexdigest()
    if actual != SHA256:
        raise SystemExit(f"Wrong reference EXE: {actual}")
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)
    ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    output = ROOT / "docs/analysis/evidence/loot"
    output.mkdir(parents=True, exist_ok=True)
    runtime = ROOT / "runtime/analysis/history/native-recovery/treasure/8e7a02353994"
    (runtime / "slices").mkdir(parents=True, exist_ok=True)
    records = []
    for name, start in SCOPES.items():
        end = ends.get(start, LEAF_ENDS.get(start))
        if end is None:
            raise ValueError(f"No established bound for {name}: {start:#x}")
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + end - start]
        derived = runtime / "slices" / f"{name}.bin"
        derived.write_bytes(raw)
        asm = objdump_output([
            "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
            f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
        (output / f"{name}.asm").write_text(asm)
        records.append(dict(name=name, va=hex(start), end_exclusive=hex(end),
                            file_offset=hex(offset), byte_count=len(raw),
                            sha256=hashlib.sha256(raw).hexdigest(),
                            boundary_source="PE RUNTIME_FUNCTION" if start in ends else "explicit disassembly span",
                            assembly=f"{name}.asm"))
    constants = []
    for name, address, fmt in [
        ("density_xp_numerator", 0x1469AA5A0, "f"),
        ("normal_gold_factor", 0x1458F6620, "f"),
        ("unit24_factor", 0x1459EB3C0, "f"),
        ("coin_offset", 0x1459C8510, "2f"),
        ("boss_coin_offset", 0x1469AA590, "2f"),
        ("magnet_offset", 0x1469AA560, "2f"),
        ("zone_quality_tiers", 0x146985910, "12Q"),
        ("boss_base_chances", 0x146986238, "6f"),
    ]:
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + struct.calcsize("<" + fmt)]
        constants.append(dict(name=name, va=hex(address), file_offset=hex(offset),
                              hex=raw.hex(), sha256=hashlib.sha256(raw).hexdigest(),
                              values=list(struct.unpack("<" + fmt, raw))))
    save(output / "manifest.json", dict(date="2026-10-18", target=str(TARGET.relative_to(ROOT)),
         target_sha256=actual, image_base=hex(pe.image_base), functions=records, constants=constants,
         limitations=["Static evidence only; no original or rebuilt application execution.",
                      "Function labels are analyst roles, not recovered original source identifiers.",
                      "Raw-function REA imports omit external constants/callees and use GCC ABI inference; original Windows instructions decide arguments.",
                      "PE and instruction evidence must corroborate incomplete decompiler control flow."]))
    if args.import_rea:
        imported = []
        for bundle in sorted(local_path(args.import_rea).glob("rea-*/evidence-bundle.json")):
            for evidence in json.loads(bundle.read_text()).get("records", []):
                normalized = evidence.get("normalized_result")
                pseudo = normalized.get("pseudocode") if isinstance(normalized, dict) else normalized if isinstance(normalized, str) else None
                if pseudo is None:
                    continue
                name = bundle.parent.name.removeprefix("rea-")
                # Full-PE batches contain several procedure records.
                selector = evidence.get("parameters", {}).get("procedure")
                if name == "full" and selector:
                    name += "-" + selector.removeprefix("0x")
                filename = f"{name}.ghidra.c"
                # Curated text removes only trailing whitespace/blank EOFs;
                # the retained Evidence ID still identifies the complete result.
                cleaned = "\n".join(line.rstrip() for line in pseudo.splitlines()).rstrip() + "\n"
                (output / filename).write_text(cleaned)
                source_span = None
                subject = evidence.get("subject", {})
                if subject.get("format") == "raw-binary":
                    derived = local_path(subject["local_path"])
                    payload = derived.read_bytes()
                    entry = int(evidence["analysis_profile"]["parameters"]["entry_point"], 0)
                    offset = pe.rva_offset(entry - pe.image_base)
                    digest = hashlib.sha256(payload).hexdigest()
                    if (data[offset:offset + len(payload)] != payload or
                            digest != subject["digest"]["sha256"]):
                        raise ValueError(f"REA subject does not match selected EXE: {derived}")
                    source_span = dict(va=hex(entry), file_offset=hex(offset),
                                       byte_count=len(payload), sha256=digest,
                                       equality="all derived bytes equal the original PE span")
                imported.append({k: evidence.get(k) for k in [
                    "evidence_id", "subject", "provider", "analysis_profile", "operation",
                    "parameters", "confidence", "authority", "limitations", "relationship_coverage", "locations"]}
                    | {"pseudocode": filename, "pseudocode_projection": "trailing whitespace and blank EOFs normalized",
                       "original_exe_span": source_span})
        save(output / "rea-provenance.json", dict(target_sha256=actual, records=imported,
             limitations=["Retained pseudocode is decompiler output, not original source.",
                          "Derived subject hashes are bound to full-EXE slices by manifest.json.",
                          "Partial/unknown call coverage and raw-image ABI limitations are preserved per record."]))
        print(f"Retained {len(imported)} REA records")
    print(f"Recovered {len(records)} native spans and {len(constants)} constant groups: {output.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
