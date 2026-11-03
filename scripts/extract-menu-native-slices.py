#!/usr/bin/env python3
"""Derive exact PE function bytes for scoped REA analysis; never execute them."""

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
from datetime import date

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors.exe"
SHA256 = "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"
STARTS = [0x1401231B0, 0x1401280A0, 0x140208AC0, 0x14020AAA0,
          0x140201E50, 0x140200950]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--address", action="append", type=lambda value: int(value, 0),
                        help="Exact function start; repeat for multiple slices")
    parser.add_argument("--range", action="append", default=[], metavar="START:END",
                        help="Explicit VA interval for a leaf without unwind metadata; repeat as needed")
    parser.add_argument("--provenance", help="Explicit project-local provenance output; current-target runs default inside workdir")
    target_mode = parser.add_mutually_exclusive_group()
    target_mode.add_argument("--current-target", action="store_true",
                        help="Resolve and hash-verify the configured installed target")
    target_mode.add_argument("--installed-sha256",
                        help="Verify the installed EXE by exact SHA-256 without requiring a coverage registration")
    parser.add_argument("--workdir", default="runtime/menu-recovery",
                        help="Project-local query workspace")
    args = parser.parse_args()
    workdir = (ROOT / args.workdir).resolve()
    if not workdir.is_relative_to(ROOT / "runtime"):
        parser.error("workdir must stay inside project runtime")
    installed = args.current_target or args.installed_sha256 is not None
    default_provenance = (workdir / "input.json" if installed else
                          ROOT / "docs/analysis/evidence/0.92/menu-slices-provenance.json")
    provenance_path = (ROOT / args.provenance).resolve() if args.provenance else default_provenance
    if not provenance_path.is_relative_to(ROOT):
        parser.error("provenance must stay inside this checkout")
    spec = importlib.util.spec_from_file_location("executable_inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    target, expected = TARGET, SHA256
    if installed:
        from coverage_common import installed_identity, latest_target, target_bytes
        current = latest_target(verify=True) if args.current_target else installed_identity()
        if args.installed_sha256 is not None and current["sha256"] != args.installed_sha256:
            parser.error(f"Installed target SHA-256 mismatch: {current['sha256']}")
        if not args.address and not args.range and args.installed_sha256 is not None:
            parser.error("--installed-sha256 requires an explicit --address or --range")
        target, expected = ROOT / current["path"], current["sha256"]
        data = target_bytes(current)
    else:
        data = target.read_bytes()
    actual = hashlib.sha256(data).hexdigest()
    if actual != expected:
        raise SystemExit(f"Target SHA-256 mismatch: {actual}")
    pe = inventory.PE(data)
    functions = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
    directory = workdir / "slices"
    directory.mkdir(parents=True, exist_ok=True)
    records = []
    intervals = [(start, functions[start], "original PE exception directory RUNTIME_FUNCTION start/end")
                 for start in (args.address or ([] if args.range else STARTS))]
    for interval in args.range:
        start, end = (int(value, 0) for value in interval.split(":"))
        if end <= start or end - start > 0x100000:
            parser.error("invalid explicit interval")
        intervals.append((start, end, "explicit original VA interval; leaf function boundary is not proven by unwind metadata"))
    for start, end, boundary_source in intervals:
        offset = pe.rva_offset(start - pe.image_base)
        payload = data[offset:offset + end - start]
        path = directory / f"picker-{start:x}.bin"
        path.write_bytes(payload)
        record = {
            "path": str(path.relative_to(ROOT)),
            "sha256": hashlib.sha256(payload).hexdigest(),
            "source_file_offset": hex(offset),
            "source_file_end_exclusive": hex(offset + len(payload)),
            "original_virtual_address": hex(start),
            "original_virtual_end_exclusive": hex(end),
            "byte_count": len(payload),
            "boundary_source": boundary_source,
        }
        records.append(record)
        plan = {
            "target": record["path"],
            "output": str((workdir / f"rea-{start:x}").relative_to(ROOT)),
            "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(start)},
            "timeout": 120,
            "open_timeout": 60,
            "cleanup_timeout": 60,
            "environment": {"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
            "operations": [{"name": "analyze_function", "arguments": {"procedure": hex(start)}, "timeout": 240}],
        }
        (directory / f"plan-{start:x}.json").write_text(json.dumps(plan, indent=2) + "\n")
    provenance = {
        "date": date.today().isoformat() if installed else "2026-10-16",
        "original_target": str(target.relative_to(ROOT)),
        "original_sha256": actual,
        "original_byte_count": len(data),
        "derivation": "Exact unmodified contiguous function bytes; raw file offset zero mapped at original virtual address for Ghidra",
        "artifacts": records,
        "limitations": [
            "Derived artifacts omit every byte outside each selected RUNTIME_FUNCTION body, including callee code and referenced constants/strings.",
            "Raw x86_64 REA import uses generic GCC compiler specification; original target is Windows x64, so recovered signatures and call arguments require original instruction verification.",
            "PE unwind records are function-boundary observations, not recovered original source names.",
            "No original or derived binary was executed by this extraction or static analysis workflow.",
        ],
    }
    provenance_path.parent.mkdir(parents=True, exist_ok=True)
    provenance_path.write_text(json.dumps(provenance, indent=2) + "\n")
    print(json.dumps(records, indent=2))


if __name__ == "__main__":
    main()
