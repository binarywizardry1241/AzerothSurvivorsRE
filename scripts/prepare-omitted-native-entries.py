#!/usr/bin/env python3
"""Prepare a bounded REA/Ghidra replay of unwind entries absent from discovery.

Read the exact retained full-image Evidence, not an inferred function count or
mutable queue status. Extract one hash-bound contiguous range from the selected
EXE. Preparation never starts a provider; the resulting raw-slice plan is not
whole-image reference or semantic recovery.
"""

import argparse
import hashlib
import importlib.util
from pathlib import Path
import sys

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_path, target_bytes


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    loaded = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(loaded)
    return loaded


def omitted_entries(records, discovered, image_base, maximum_entries=128, maximum_span=65536):
    missing = [(start, end, unwind) for start, end, unwind in records if image_base + start not in discovered]
    if not missing or len(missing) > maximum_entries:
        raise ValueError("Omitted-entry selection must have 1..128 entries; review a changed scope")
    start, end = min(row[0] for row in missing), max(row[1] for row in missing)
    if end <= start or end - start > maximum_span or any(a >= b for a, b, _ in missing):
        raise ValueError("Omitted-entry selection exceeds the bounded contiguous range or has invalid extents")
    return missing, start, end


def prepare(target, output):
    root = ROOT / "runtime/coverage" / target["sha256"]
    state = load_json(root / "ghidra/full-image-no-address-tables/progress.json")
    census = module("omitted_census", "scripts/census-current-target.py")
    profile, environment = census.configuration(False, "full-image-no-address-tables", 600, {})
    census.validate_resume(state, target, profile, state["unwind_directory_sha256"],
                           {**environment, "GHIDRA_HEADLESS_MAXMEM": state["analysis_environment"]["GHIDRA_HEADLESS_MAXMEM"]})
    retained = census.retained_procedure_inventory(state, target["sha256"])
    if retained is None:
        raise ValueError("Exact retained full-image procedure inventory is required")
    rows, _ = census.classify_procedures(retained["normalized_result"])
    image = target_bytes(target)
    pe = module("omitted_pe", "scripts/inventory-current-target.py").pe_parser(image)
    missing, start, end = omitted_entries(pe.functions(), {int(row["address"], 16) for row in rows}, pe.image_base)
    offset = pe.rva_offset(start)
    if pe.rva_offset(end - 1) != offset + end - start - 1:
        raise ValueError("Selected range has a non-contiguous file mapping")
    raw = image[offset:offset + end - start]
    if len(raw) != end - start:
        raise ValueError("Selected range is truncated")
    selected = [dict(address=hex(pe.image_base + a), byte_count=b - a, unwind_rva=hex(unwind),
                     sha256=hashlib.sha256(image[pe.rva_offset(a):pe.rva_offset(a) + b - a]).hexdigest())
                for a, b, unwind in missing]
    seeds = "".join(f"{row['address']}\tfunction\n{row['address']}\tcode\n" for row in selected)
    operations = []
    for row in selected:
        for name, extra, label in (("read_function_instructions", {}, "instructions"),
                                   ("procedure_info", {}, "info"),
                                   ("procedure_references", dict(direction="outgoing"), "outgoing")):
            operations.append(dict(name=name, arguments=dict(procedure=row["address"], **extra),
                                   label=row["address"] + "-" + label, timeout=240 if not operations else 60))
    plan = dict(target=(output / "range.bin").relative_to(ROOT).as_posix(),
                output=(output / "session").relative_to(ROOT).as_posix(),
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(pe.image_base + start)),
                init_timeout=60, open_timeout=120, cleanup_timeout=60,
                environment=dict(REA_GHIDRA_STARTUP_TIMEOUT_MS="180000",
                    REA_GHIDRA_SEED_FILE=(output / "seeds.tsv").relative_to(ROOT).as_posix(),
                    REA_GHIDRA_DISABLED_ANALYZERS="Function ID,Function Start Search,Create Address Tables"),
                operations=operations)
    selection = dict(target={key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
        rule="All declared AMD64 unwind starts absent from the exact retained full-image Ghidra procedure inventory.",
        source_evidence_id=retained["evidence_id"], source_analysis_profile_digest=retained["analysis_profile"]["digest"],
        range=dict(address=hex(pe.image_base + start), file_offset=hex(offset), byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest()),
        selected=selected, seed_sha256=hashlib.sha256(seeds.encode()).hexdigest(),
        generator=dict(path="scripts/prepare-omitted-native-entries.py", sha256=file_sha256(Path(__file__))),
        whole_image_input=False, native_semantics_complete=False)
    output.mkdir(parents=True, exist_ok=False)
    (output / "range.bin").write_bytes(raw)
    (output / "seeds.tsv").write_text(seeds)
    (output / "plan.json").write_text(json_text(plan))
    (output / "selection.json").write_text(json_text(selection))
    return selection, plan


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", help="New project-local output directory; existing evidence is never overwritten")
    args = parser.parse_args()
    try:
        target = latest_target(verify=True)
        output = project_path(args.output) if args.output else ROOT / "runtime/coverage" / target["sha256"] / "ghidra/omitted-unwind-entries-replay"
        selection, _ = prepare(target, output)
        print(json_text(dict(plan=(output / "plan.json").relative_to(ROOT).as_posix(),
                             entries=len(selection["selected"]), bytes=selection["range"]["byte_count"], analysis_started=False)))
        return 0
    except (OSError, ValueError, KeyError) as error:
        print(f"Omitted native entry preparation: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
