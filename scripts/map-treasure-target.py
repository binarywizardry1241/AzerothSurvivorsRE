#!/usr/bin/env python3
"""Locate 0.97.2 native research seeds with 0.92 byte-subsequence votes.

This script never executes either EXE. A match locates a candidate for REA;
it does not establish that its behavior survived a version change. All output
is disposable project-local research material under runtime/analysis/history/native-recovery/treasure/8e7a02353994.
"""
from portable_paths import objdump_output

import argparse
import bisect
from collections import Counter
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
BASELINE = ROOT / "AzerothSurvivors/AzerothSurvivors.exe"
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
HASHES = (
    "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2",
    "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589",
)
SEEDS = {
    "constructor": 0x145472810,
    "tick": 0x145474190,
    "run-init": 0x1454872D0,
    "placement": 0x145497D00,
    "enemy-death": 0x145498160,
    "shared-creation": 0x14549D330,
    "purchase": 0x1454A81A0,
    "click-purchase": 0x145495820,
    "removal": 0x1454A5D50,
    "reward-completion": 0x1454B0880,
    "addon-export": 0x145461740,
    "addon-chest-iterator": 0x1454DC230,
    "rng-range": 0x1454D71C0,
    "terrain-height": 0x1453F66F0,
    "boss-drops": 0x1453DE990,
    "item-id": 0x1453E0030,
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--assembly", action="store_true", help="also save bounded objdump output")
    args = parser.parse_args()
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    images = []
    for path, expected in zip((BASELINE, TARGET), HASHES):
        data = path.read_bytes()
        if hashlib.sha256(data).hexdigest() != expected:
            raise SystemExit(f"Wrong target identity: {path.relative_to(ROOT)}")
        images.append(inventory.PE(data))
    old, new = images
    old_functions = {old.image_base + a: old.image_base + b for a, b, _ in old.functions()}
    functions = sorted(new.functions())
    starts = [a for a, _, _ in functions]
    # The known native gameplay region bounds the location search, not the
    # target evidence. Missing matches remain missing rather than being guessed.
    low = new.rva_offset(0x5300000)
    high = new.rva_offset(0x5650000)
    search = new.data[low:high]
    output = ROOT / "runtime/analysis/history/native-recovery/treasure/8e7a02353994"
    output.mkdir(parents=True, exist_ok=True)
    records = []
    for role, address in SEEDS.items():
        offset = old.rva_offset(address - old.image_base)
        payload = old.data[offset:offset + old_functions[address] - address]
        votes = Counter()
        proof = {}
        # At most 512 samples avoids a large old tick dominating runtime.
        step = max(32, ((len(payload) // 512 + 15) // 16) * 16)
        for at in range(0, len(payload) - 31, step):
            fragment = payload[at:at + 32]
            found = search.find(fragment)
            if found < 0 or search.find(fragment, found + 1) >= 0:
                continue
            va = new.offset_va(found + low)
            if va is None:
                continue
            rva = va - new.image_base
            index = bisect.bisect_right(starts, rva) - 1
            if index < 0 or not functions[index][0] <= rva < functions[index][1]:
                continue
            owner = new.image_base + functions[index][0]
            votes[owner] += 1
            proof.setdefault(owner, []).append({
                "baseline_va": hex(address + at), "target_va": hex(va),
                "length": 32, "hex": fragment.hex(),
            })
        candidates = []
        for candidate, count in votes.most_common(3):
            index = bisect.bisect_left(starts, candidate - new.image_base)
            end = functions[index][1] + new.image_base
            new_offset = new.rva_offset(candidate - new.image_base)
            body = new.data[new_offset:new_offset + end - candidate]
            row = dict(va=hex(candidate), end_exclusive=hex(end),
                       rva=hex(candidate - new.image_base), file_offset=hex(new_offset),
                       byte_count=len(body), sha256=hashlib.sha256(body).hexdigest(),
                       votes=count, matched_fragments=proof[candidate][:8],
                       boundary_source="target PE exception-directory RUNTIME_FUNCTION")
            candidates.append(row)
        record = dict(role=role, baseline_va=hex(address),
                      baseline_sha256=hashlib.sha256(payload).hexdigest(),
                      sample_stride=step, candidates=candidates,
                      interpretation="Location candidate only; inspect target native code with REA.")
        records.append(record)
        if candidates:
            best = candidates[0]
            if args.assembly:
                text = objdump_output([
                    "objdump", "-d", "--no-show-raw-insn", f'--start-address={best["va"]}',
                    f'--stop-address={best["end_exclusive"]}', str(TARGET.relative_to(ROOT)),
                ], cwd=ROOT, text=True)
                (output / f"{role}.asm").write_text(text)
            print(role, best["va"], best["end_exclusive"], best["votes"], flush=True)
    result = dict(
        target=str(TARGET.relative_to(ROOT)), target_sha256=HASHES[1], version="0.97.2",
        baseline=str(BASELINE.relative_to(ROOT)), baseline_sha256=HASHES[0],
        method="Unique exact 32-byte subsequence votes within PE unwind-function ranges.",
        search_rva_start="0x5300000", search_rva_end_exclusive="0x5650000",
        target_executed=False, candidates=records,
        limitations=["Names are research labels, not recovered original symbols.",
                     "Matching fragments do not prove unchanged behavior or complete function identity.",
                     "Search-region bounds may exclude a moved or inlined function."],
    )
    (output / "function-map.json").write_text(json.dumps(result, indent=2) + "\n")
    (output / "native-seeds.tsv").write_text("\n".join(
        f'{record["candidates"][0]["va"]}\t{kind}'
        for record in records if record["candidates"]
        for kind in ("function", "code")
    ) + "\n")


if __name__ == "__main__":
    main()
