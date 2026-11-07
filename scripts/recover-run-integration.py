#!/usr/bin/env python3
"""Hash-bound relocation leads and REA/Ghidra collection for live run consumers.

Fragments locate candidates only. The selected target's complete unwind body is
then inspected; matching historical bytes alone never establishes parity.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import bisect
from collections import Counter
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "runtime/analysis/history/native-recovery/run-integration/f5d0ab575d26"
OUT = ROOT / "docs/analysis/evidence/run-integration"
OLD = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.100.1.exe"
OLD_SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
SHA = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"
OWNERS = {
    "run-factory": 0x14543e970,
    "game-begin": 0x1454b07c0,
    "experience-and-levels": 0x1454b4920,
    "reward-stat-refresh": 0x1454b7b80,
}

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["prepare", "collect"])
    args = parser.parse_args()
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    images = []
    for path, digest in [(OLD, OLD_SHA), (TARGET, SHA)]:
        data = path.read_bytes()
        assert hashlib.sha256(data).hexdigest() == digest
        images.append(module.PE(data))
    old, new = images
    old_bounds = {old.image_base + a: old.image_base + b for a, b, _ in old.functions()}
    functions = sorted(new.functions())
    starts = [a for a, _, _ in functions]
    low = new.rva_offset(0x5400000)
    high = new.rva_offset(0x56a0000)
    search = new.data[low:high]
    WORK.mkdir(parents=True, exist_ok=True)
    records = []
    for role, old_va in OWNERS.items():
        offset = old.rva_offset(old_va - old.image_base)
        raw = old.data[offset:offset + old_bounds[old_va] - old_va]
        votes = Counter()
        for at in range(0, len(raw) - 23, max(8, len(raw) // 256 // 8 * 8)):
            fragment = raw[at:at + 24]
            found = search.find(fragment)
            if found < 0 or search.find(fragment, found + 1) >= 0:
                continue
            va = new.offset_va(found + low)
            if va is None:
                continue
            i = bisect.bisect_right(starts, va - new.image_base) - 1
            if i >= 0 and functions[i][0] <= va - new.image_base < functions[i][1]:
                votes[new.image_base + functions[i][0]] += 1
        assert votes, (role, "No unique fragment lead; recover independently")
        va = votes.most_common(1)[0][0]
        index = bisect.bisect_left(starts, va - new.image_base)
        end = functions[index][1] + new.image_base
        start = new.rva_offset(va - new.image_base)
        body = new.data[start:start + end - va]
        record = {"role": role, "historical_lead": hex(old_va), "address": hex(va),
                  "end_exclusive": hex(end), "file_offset": hex(start),
                  "byte_count": len(body), "sha256": hashlib.sha256(body).hexdigest(),
                  "candidate_votes": [[hex(address), count] for address, count in votes.most_common(3)]}
        if args.action == "prepare":
            (WORK / f"{role}.bin").write_bytes(body)
            plan = {"target": str((WORK / f"{role}.bin").relative_to(ROOT)),
                    "output": str((WORK / f"rea-{role}").relative_to(ROOT)),
                    "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(va)},
                    "timeout": 180, "open_timeout": 60,
                    "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": hex(va)}}]}
            (WORK / f"{role}.json").write_text(portable_json(plan, indent=2) + "\n")
        else:
            OUT.mkdir(parents=True, exist_ok=True)
            response = json.loads((WORK / f"rea-{role}/003-procedure_pseudo_code.json").read_text())
            evidence = response["response"]["result"]["structuredContent"]
            assert evidence["subject"]["digest"]["sha256"] == record["sha256"]
            (OUT / f"{role}.ghidra.c").write_text(evidence["normalized_result"])
            asm = objdump_output(["objdump", "-d", "--no-show-raw-insn",
                f"--start-address={va:#x}", f"--stop-address={end:#x}", str(TARGET)], cwd=ROOT, text=True)
            (OUT / f"{role}.asm").write_text(asm)
            record["rea_evidence"] = evidence
        records.append(record)
        print(role, hex(va), hex(end), "candidate votes", votes.most_common(1)[0][1], flush=True)
    result = {"target": str(TARGET.relative_to(ROOT)), "target_sha256": SHA,
              "historical_target_sha256": OLD_SHA, "target_executed": False,
              "method": "Unique historical 24-byte fragments within RVA5400000..56a0000 locate current .pdata candidates; unchanged complete current native bodies analyzed with REA/Ghidra.",
              "functions": records,
              "limitations": ["Static recovery does not observe original application execution.",
                  "Raw function imports leave outside calls and data unresolved; original full-PE disassembly governs their addresses.",
                  "Fragment votes establish locations only, not unchanged behavior."]}
    destination = WORK / "map.json" if args.action == "prepare" else OUT / "manifest.json"
    destination.write_text(portable_json(result, indent=2) + "\n")

if __name__ == "__main__":
    main()
