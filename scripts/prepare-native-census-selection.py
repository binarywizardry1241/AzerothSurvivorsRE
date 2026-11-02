#!/usr/bin/env python3
"""Prepare a bounded full-PE diagnostic-owner REA plan; never start analysis."""

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_path, target_bytes


def validate_ownership_summary(summary, target, source_path, source_sha):
    if any(summary.get("target", {}).get(key) != target[key]
           for key in ("version", "path", "sha256", "size_bytes")):
        raise ValueError("Canonical diagnostic summary belongs to another selected target")
    inventory = summary.get("inventory", {})
    if inventory.get("path") != source_path or inventory.get("sha256") != source_sha:
        raise ValueError("Diagnostic bulk inventory differs from the canonical path/digest")


def validate_owner_bytes(selected, image):
    for row in selected:
        reference = row["reference"]
        offset, count = int(reference["owner_file_offset"], 16), reference["owner_byte_count"]
        if (offset < 0 or count < 1 or offset + count > len(image)
                or hashlib.sha256(image[offset:offset + count]).hexdigest() != reference["owner_sha256"]):
            raise ValueError(f"Selected native owner bytes differ for {row['path']}")


# 0.115.0 adds banners.rs to the reviewed custom scope: 60 current paths.
# Keep the ceiling explicit: another new path requires a scope review.
def select_owners(ownership, target, limit=60):
    if any(ownership.get("target", {}).get(key) != target[key]
           for key in ("version", "path", "sha256", "size_bytes")):
        raise ValueError("Diagnostic ownership belongs to another selected target")
    selected = []
    for path in sorted((row for row in ownership["diagnostics"] if row["custom_game_crate"]), key=lambda row: row["path"]):
        references = [row for row in path["verified_references"] if row.get("owner_sha256")]
        if not references:
            raise ValueError(f"No instruction-verified owner for {path['path']}")
        reference = min(references, key=lambda row: (row["owner_byte_count"], int(row["runtime_function_start"], 16),
                                                      int(row["instruction_address"], 16)))
        selected.append({"path": path["path"], "reference": reference})
    if not selected or len(selected) > limit:
        raise ValueError(f"Selected diagnostic paths must number 1..{limit}; review a changed scope explicitly")
    return selected


def bounded_plan(target, selected, output, disabled):
    addresses = sorted({row["reference"]["runtime_function_start"] for row in selected}, key=lambda address: int(address, 16))
    seeds = "".join(f"{address}\tfunction\n{address}\tcode\n" for address in addresses)
    operations = []
    for address in addresses:
        for name, parameters, label in (("read_function_instructions", {}, "instructions"),
                ("procedure_references", {"direction": "outgoing"}, "outgoing"),
                ("procedure_references", {"direction": "incoming"}, "incoming"), ("procedure_info", {}, "info")):
            operations.append({"name": name, "arguments": {"procedure": address, **parameters},
                               "label": f"{address}-{label}", "timeout": 360 if not operations else 60})
    plan = {"target": target["path"], "output": (output / "session").relative_to(ROOT).as_posix(),
            "init_timeout": 60, "open_timeout": 180, "cleanup_timeout": 60, "timeout": 60, "stop_on_error": True,
            "environment": {"REA_GHIDRA_STARTUP_TIMEOUT_MS": "300000",
                            "REA_GHIDRA_SEED_FILE": (output / "seeds.tsv").relative_to(ROOT).as_posix(),
                            "REA_GHIDRA_DISABLED_ANALYZERS": disabled}, "operations": operations}
    return seeds, plan


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", help="New project-local output folder; existing evidence is never overwritten")
    args = parser.parse_args()
    try:
        target = latest_target(verify=True)
        root = ROOT / "runtime/coverage" / target["sha256"]
        source = root / "diagnostic-ownership.json"
        source_bytes = source.read_bytes()
        source_sha = hashlib.sha256(source_bytes).hexdigest()
        summary_path = ROOT / "docs/analysis/coverage/diagnostic-ownership.json"
        validate_ownership_summary(load_json(summary_path), target, source.relative_to(ROOT).as_posix(), source_sha)
        selected = select_owners(json.loads(source_bytes), target)
        validate_owner_bytes(selected, target_bytes(target))
        output = project_path(args.output) if args.output else root / "ghidra/full-image-diagnostic-owner-decoding-replay"
        spec = importlib.util.spec_from_file_location("native_census", ROOT / "scripts/census-current-target.py")
        census = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(census)
        seeds, plan = bounded_plan(target, selected, output, census.FULL_PROFILES["full-image-no-address-tables"])
        output.mkdir(parents=True, exist_ok=False)
        (output / "seeds.tsv").write_text(seeds, encoding="utf-8")
        (output / "plan.json").write_text(json_text(plan), encoding="utf-8")
        (output / "selection.json").write_text(json_text({"target": target, "source": source.relative_to(ROOT).as_posix(),
            "source_sha256": source_sha, "canonical_summary": summary_path.relative_to(ROOT).as_posix(),
            "selected_owner_bytes_verified": True, "rule": "Minimum owner_byte_count per custom path; ties by owner then instruction address; unique owner queue in numeric order.",
            "mappings": selected, "seed_sha256": file_sha256(output / "seeds.tsv"),
            "generator_sha256": file_sha256(Path(__file__).resolve()), "global_native_completeness": False}), encoding="utf-8")
        print(json_text({"plan": (output / "plan.json").relative_to(ROOT).as_posix(),
                         "paths": len(selected), "unique_owners": len(plan["operations"]) // 4,
                         "analysis_started": False}).rstrip())
        return 0
    except (OSError, ValueError, KeyError) as error:
        print(f"Native owner selection error: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
