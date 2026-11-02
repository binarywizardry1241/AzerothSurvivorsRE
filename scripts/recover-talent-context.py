#!/usr/bin/env python3
"""Verify #98's retained target-bound contracts or prepare durable REA inputs.

Default is read-only. --prepare-rea reproduces exact original-byte slices,
seeds and plans under runtime/, without starting Ghidra or executing a target.
"""
import argparse
import hashlib
import json

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.115.0/talent-context/manifest.json"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def local(path):
    result = (ROOT / path).resolve()
    assert result.is_relative_to(ROOT), path
    return result


def retain(path, raw):
    path = local(path)
    assert path.is_relative_to(ROOT / "runtime"), path
    if path.exists():
        assert path.read_bytes() == raw, f"Changed durable input: {path}"
    else:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(raw)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--prepare-rea", action="store_true")
    args = ap.parse_args()
    proof = json.loads(MANIFEST.read_text())
    target = latest_target(verify=True)
    assert all(target[key] == value for key, value in proof["target"].items())
    image = target_bytes(target)
    pe = load_script("talent_context_recovery_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(start, length):
        offset = pe.rva_offset(start - pe.image_base)
        assert offset is not None and offset + length <= len(image)
        return image[offset:offset + length]

    by_input = {}
    for row in proof["ranges"]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        value = raw(start, end - start)
        assert digest(value) == row["sha256"] == row["raw"]["sha256"], row["role"]
        by_input[row["raw"]["path"]] = value
    for row in proof["dispatch_ranges"]:
        assert digest(raw(int(row["start"], 16), int(row["end_exclusive"], 16) - int(row["start"], 16))) == row["sha256"]
    for row in proof["keys"] + proof["part_names"] + proof["notification_templates"] + proof["data_contracts"]:
        value = raw(int(row["start"], 16), row["byte_count"])
        assert digest(value) == row["sha256"], row["role"]
        if "text" in row:
            assert value.decode() == row["text"]
        if "hex" in row:
            assert value.hex() == row["hex"]
    for row in proof["supporting_evidence"]:
        assert digest(local(row["path"]).read_bytes()) == row["sha256"], row["path"]

    retained_results = 0
    for query in proof["queries"]:
        assert query["input_sha256"] in {digest(value) for value in by_input.values()}
        if "pseudocode" in query:
            row = query["pseudocode"]
            assert digest(local(row["path"]).read_bytes()) == row["sha256"]
        path = local(query["result"]["path"])
        if path.exists():
            assert digest(path.read_bytes()) == query["result"]["sha256"]
            evidence = json.loads(path.read_text())["structuredContent"]
            assert evidence["evidence_id"] == query["evidence_id"]
            assert evidence["subject"]["digest"]["sha256"] == query["input_sha256"]
            assert evidence["analysis_profile"]["digest"] == query["profile_digest"]
            retained_results += 1

    for plan in proof["plans"]:
        value = plan["definition"]
        assert digest(by_input[value["target"]]) in {row["input_sha256"] for row in proof["queries"]}
        plan_raw = (json.dumps(value, indent=2) + "\n").encode()
        seed = plan["seed"]
        assert digest(plan_raw) == plan["sha256"]
        assert digest(seed["text"].encode()) == seed["sha256"]
        if args.prepare_rea:
            retain(value["target"], by_input[value["target"]])
            retain(seed["path"], seed["text"].encode())
            retain(plan["path"], plan_raw)
            print("./scripts/rea query " + plan["path"])
    print(f"Talent context: {len(proof['ranges'])} native ranges and {len(proof['queries'])} query commitments verified; {retained_results} saved results present")
    print("Source-only evidence; compilation, application/network execution and parity remain unverified")


if __name__ == "__main__":
    main()
