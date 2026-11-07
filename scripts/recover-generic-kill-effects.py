#!/usr/bin/env python3
"""Hash-bound current kill-effect query/filter and periodic-field evidence.

Prepares project-local REA/Ghidra plans for the two complete helper owners and
collects completed evidence. Original assembly binds their external callees.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.100.1.exe"
SHA = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"
WORK = ROOT / "runtime/analysis/history/native-recovery/generic-kill-effects/a31511a59095"
OUT = ROOT / "docs/analysis/evidence/0.100.1/run-callbacks"


def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)
    bounds = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
    WORK.mkdir(parents=True, exist_ok=True)
    OUT.mkdir(parents=True, exist_ok=True)
    records = []
    for role, start, stop, session in [
        ("radius-query", 0x145500300, None, "recovery-radius"),
        ("spread-filter", 0x145558cc0, None, "recovery-filter"),
        ("radius-next", 0x1455491C0, None, None),
        ("radius-small-sort", 0x14193ACA0, None, None),
        ("actor-periodic-fields", 0x1454DBCD1, 0x1454DBE54, None),
        ("actor-aura-cleanup", 0x1454DBE54, 0x1454DC314, None),
        ("actor-periodic-compaction", 0x1454DD962, 0x1454DD9C3, None),
        ("exhausted-periodic-spells", 0x14553E800, None, None),
        ("actor-update-call-order", 0x1454B709F, 0x1454B70E6, None),
        ("actor-aura-removal-publish", 0x1454DEC1A, 0x1454DEC75, None),
    ]:
        end = stop or bounds[start]
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + end - start]
        record = {"role": role, "address": hex(start), "end_exclusive": hex(end),
                  "file_offset": hex(offset), "sha256": hashlib.sha256(raw).hexdigest(),
                  "boundary": "selected interior instruction span" if stop else "PE unwind owner"}
        assembly = objdump_output([
            "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
            f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT)),
        ], cwd=ROOT, text=True)
        (OUT / f"kill-{role}.asm").write_text(assembly)
        if session:
            binary = WORK / f"{role}.bin"
            binary.write_bytes(raw)
            plan = {"target": str(binary.relative_to(ROOT)),
                    "output": str((WORK / session).relative_to(ROOT)),
                    "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(start)},
                    "timeout": 120, "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": hex(start)}}]}
            (WORK / f"plan-{role}.json").write_text(portable_json(plan, indent=2) + "\n")
            response_path = WORK / session / "003-procedure_pseudo_code.json"
            if response_path.exists():
                response = json.loads(response_path.read_text())
                evidence = response["response"]["result"]["structuredContent"]
                assert evidence["provider"]["id"] == "ghidra"
                assert evidence["subject"]["digest"]["sha256"] == record["sha256"]
                (OUT / f"kill-{role}.ghidra.c").write_text(evidence["normalized_result"])
                record.update(evidence_id=evidence["evidence_id"], analysis_profile=evidence["analysis_profile"])
        records.append(record)
    manifest = {"target_sha256": SHA, "target_executed": False, "functions": records,
                "findings": [
                    "Radius queries compare interpolated XY squared distance inclusively and exclude supplied GUIDs/dead actors; output sorts by f32 total distance.",
                    "Spread filter skips active matching spell/owner rows before consuming the requested target count.",
                    "Current actor-update decrements periodic+20 and compares +24 for the first-tick flag. Spread1454cd796 reads initial+24, restoring original rather than remaining tick count.",
                    "Effect12 publishes a ground-target spell visual before selecting radius targets; recursive damage source-kind is3.",
                    "Current game-tick1454b70d2 calls actor-update only after player casts, class-specials, pending impacts, ground and totems.",
                    "Actor-update collects exhausted spellIDs, compacts ticks_remaining0 records, queues applications-only updates if the spell survives, otherwise removals; publication follows periodic damage.",
                    "Reduction actor+134 is removed at now>=reduction deadline. Expired control scans16 slots and excludes that current reduction ID and any remaining stored periodic spellID before removal.",
                ],
                "limitations": ["Complete switch actions remain bound to talent-events.asm and its separate current REA evidence.",
                                "Raw helper imports omit external allocation/sort/callee bodies; original PE instructions control their field interpretation.",
                                "No original application session or full parity is implied."]}
    (OUT / "generic-kill-manifest.json").write_text(portable_json(manifest, indent=2) + "\n")
    print("Collected current kill effects helpers and initial/remaining periodic field proof")


if __name__ == "__main__":
    main()
