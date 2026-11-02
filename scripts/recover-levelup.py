#!/usr/bin/env python3
"""Locate historical card-owner leads in the hash-bound 0.100.1 reference.

Unique unchanged 32-byte fragments vote for a PE unwind-function owner. These
are candidate mappings, not semantic equivalence. Ghidra recovery and original
instructions must establish behavior independently in the selected target.
"""
from script_sources import load_script

import bisect
from collections import Counter
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "runtime/levelup-0.100.1"
OLD_SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
SHA = "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"


def main():
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    historical = (ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe").read_bytes()
    current = (ROOT / "AzerothSurvivors/AzerothSurvivors-0.100.1.exe").read_bytes()
    assert hashlib.sha256(historical).hexdigest() == OLD_SHA
    assert hashlib.sha256(current).hexdigest() == SHA
    old, new = inventory.PE(historical), inventory.PE(current)
    functions = list(new.functions())
    starts = [start for start, _, _ in functions]
    manifest = json.loads((ROOT / "docs/analysis/evidence/0.97.2/native-overlays/manifest.json").read_text())
    WORK.mkdir(parents=True, exist_ok=True)
    records = []
    for lead in manifest["functions"]:
        source = lead["source"]
        address = int(source["address"], 16)
        offset = old.rva_offset(address - old.image_base)
        raw = historical[offset:offset + source["byte_count"]]
        assert hashlib.sha256(raw).hexdigest() == source["sha256"]
        votes, samples = Counter(), {}
        for at in range(0, len(raw) - 31, max(16, len(raw) // 16 // 16 * 16)):
            fragment = raw[at:at + 32]
            hit = current.find(fragment)
            if hit < 0 or current.find(fragment, hit + 1) >= 0:
                continue
            va = new.offset_va(hit)
            if va is None:
                continue
            index = bisect.bisect_right(starts, va - new.image_base) - 1
            if index < 0 or not functions[index][0] <= va - new.image_base < functions[index][1]:
                continue
            owner = functions[index][:2]
            votes[owner] += 1
            samples.setdefault(owner, []).append({"old": hex(address + at), "current": hex(va)})
        if not votes:
            records.append({"role": lead["role"], "status": "unmapped", "historical": source})
            continue
        (start, end), count = votes.most_common(1)[0]
        va, end_va = new.image_base + start, new.image_base + end
        offset = new.rva_offset(start)
        payload = current[offset:offset + end - start]
        path = WORK / f"{va:x}.bin"
        path.write_bytes(payload)
        plan = {"target": str(path.relative_to(ROOT)),
                "output": str((WORK / f"rea-{va:x}").relative_to(ROOT)),
                "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(va)},
                "timeout": 240, "open_timeout": 60,
                "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": hex(va)}}]}
        (WORK / f"plan-{lead['role']}.json").write_text(json.dumps(plan, indent=2) + "\n")
        records.append({"role": lead["role"], "status": "candidate", "historical": source,
                        "source": {"address": hex(va), "end_exclusive": hex(end_va),
                                   "file_offset": hex(offset), "byte_count": len(payload),
                                   "sha256": hashlib.sha256(payload).hexdigest()},
                        "unique_fragment_votes": count, "sample_matches": samples[(start, end)][:8],
                        "alternative_candidates": len(votes) - 1})
        print(lead["role"], hex(va), len(payload), count, flush=True)
    result = {"target": "AzerothSurvivors/AzerothSurvivors-0.100.1.exe", "target_sha256": SHA,
              "historical_target_sha256": OLD_SHA, "method": __doc__, "functions": records}
    (WORK / "mapping.json").write_text(json.dumps(result, indent=2) + "\n")


if __name__ == "__main__":
    main()
