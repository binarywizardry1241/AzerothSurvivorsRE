#!/usr/bin/env python3
"""Project every verified diagnostic site onto an explicit verified native census.

Run with --census-summary <verified-summary> --output-directory runtime/<scope>.
Outputs retain original references and exact body/instruction observations only;
they do not infer function entries, source semantics, reachability or parity.
"""
import argparse
from collections import Counter
import json
from pathlib import Path
import subprocess

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_path, target_bytes
from script_sources import load_script

DIAGNOSTICS = "docs/analysis/coverage/diagnostic-ownership.json"
BODY_FIELDS = ("path", "custom_game_crate", "verified_sites", "sites_inside_actual_ghidra_bodies",
               "actual_native_body_owners", "sites_without_actual_ghidra_owner")


def audit(census_name, output_name):
    output = project_path(output_name)
    if not output.is_relative_to(ROOT / "runtime") or output == ROOT / "runtime":
        raise ValueError("Output directory must be beneath project-local runtime/")
    if subprocess.run(["git", "check-ignore", "--quiet", str(output)], cwd=ROOT).returncode:
        raise ValueError("Output directory must be ignored by Git")
    commitments = {}

    def checked(name, expected=None, size=None):
        path = project_path(name)
        digest = file_sha256(path)
        if expected is not None and digest != expected:
            raise ValueError("Input commitment differs: " + str(name))
        if size is not None and path.stat().st_size != size:
            raise ValueError("Input size differs: " + str(name))
        if path in commitments and commitments[path] != digest:
            raise ValueError("Input changed during analysis: " + str(name))
        commitments[path] = digest
        return {"path": path.relative_to(ROOT).as_posix(), "sha256": digest}

    def same_target(record):
        if any(record.get("target", {}).get(k) != target[k]
               for k in ("version", "path", "sha256", "size_bytes")):
            raise ValueError("Input does not describe the selected installed EXE")

    dependencies = [checked("scripts/" + name) for name in (
        "coverage_common.py", "script_sources.py", "summarize-native-image.py",
        "inventory-current-target.py", "inventory-executable.py", "derived_gzip.py")]
    generator = checked("scripts/audit-native-diagnostic-sites.py")
    native = load_script("diagnostic_site_native", ROOT / "scripts/summarize-native-image.py")
    pe_module = load_script("diagnostic_site_pe", ROOT / "scripts/inventory-current-target.py")
    target = latest_target()
    image = target_bytes(target)
    pe = pe_module.pe_parser(image)

    def raw_at(site, length):
        if length <= 0:
            raise ValueError("Empty diagnostic/exported instruction")
        offset = pe.rva_offset(site - pe.image_base)
        last = pe.rva_offset(site - pe.image_base + length - 1)
        raw = image[offset:offset + length]
        if last != offset + length - 1 or len(raw) != length:
            raise ValueError("Instruction is not fully file-backed")
        return raw

    census_ref = checked(census_name)
    census = load_json(project_path(census_name))
    same_target(census)
    independent = census.get("independent_instructions", {})
    if not independent.get("performed") or not independent.get("exact_source_bytes_verified"):
        raise ValueError("Census must have independent source-byte/boundary verification")
    if independent.get("instruction_records") != census["counts"]["instructions"]:
        raise ValueError("Census independent/exported instruction counts differ")
    directory = project_path(census["artifacts"]["directory"])
    exports = {name: checked(directory / name, entry["sha256"], entry["bytes"])
               for name, entry in census["artifacts"]["files"].items()}
    if not {"instructions.tsv.gz", "bodies.tsv.gz"} <= exports.keys():
        raise ValueError("Census must commit its instruction and body exports")
    for filename, field in (("plan.json", "plan_sha256"), ("progress.json", "progress_sha256"),
                            ("session-result.json", "session_result_sha256")):
        checked(directory / filename, census["artifacts"][field])
    retained = census["diagnostic_binding_audit"]
    checked(retained["path"], retained["sha256"])
    if census.get("full_summary_snapshot"):
        snapshot = census["full_summary_snapshot"]
        checked(snapshot["path"], snapshot["sha256"])
    expected = load_json(project_path(retained["path"]))
    same_target(expected)
    expected_bindings = expected["diagnostic_bindings"]
    source_ref = checked(DIAGNOSTICS)
    source = load_json(project_path(DIAGNOSTICS))
    same_target(source)
    inventory_ref = checked(source["inventory"]["path"], source["inventory"]["sha256"])
    inventory = load_json(project_path(inventory_ref["path"]))
    same_target(inventory)
    if inventory["counts"] != source["counts"]:
        raise ValueError("Diagnostic inventory/summary counts differ")

    ranges = []
    for row in native.rows(directory / "bodies.tsv.gz"):
        if row["external"] == "true":
            continue
        entry, start, end = (int(row[key], 16) for key in ("entry", "start", "end"))
        if end < start:
            raise ValueError("Invalid actual body range")
        ranges.append((start, end, entry))
    if len(ranges) != census["counts"]["body_ranges"]:
        raise ValueError("Actual body range count differs")
    owner = native.owner_lookup(ranges)
    diagnostics = inventory["diagnostics"]
    if len({row["path"] for row in diagnostics}) != len(diagnostics):
        raise ValueError("Duplicate diagnostic paths")
    wanted = {int(ref["instruction_address"], 16)
              for row in diagnostics for ref in row["verified_references"]}
    observed = {}
    instruction_count = 0
    for row in native.rows(directory / "instructions.tsv.gz"):
        instruction_count += 1
        site = int(row["address"], 16)
        if site not in wanted:
            continue
        raw = bytes.fromhex(row["bytes"])
        if len(raw) != int(row["length"]) or raw_at(site, len(raw)) != raw or site in observed:
            raise ValueError(f"Invalid/duplicate exported instruction at {site:#x}")
        observed[site] = raw
    if instruction_count != census["counts"]["instructions"]:
        raise ValueError("Exported instruction row count differs")

    records, bindings = [], []
    for path_ordinal, diagnostic in enumerate(diagnostics):
        if not isinstance(diagnostic["custom_game_crate"], bool):
            raise ValueError("Diagnostic custom flag must be boolean")
        owners = Counter()
        for ordinal, ref in enumerate(diagnostic["verified_references"]):
            site, raw = int(ref["instruction_address"], 16), bytes.fromhex(ref["instruction_bytes"])
            if raw_at(site, len(raw)) != raw:
                raise ValueError(f"Diagnostic instruction bytes differ at {site:#x}")
            actual = owner(site)
            owners[actual] += 1
            exported = observed.get(site)
            records.append({"record_ordinal": len(records), "diagnostic_path_ordinal": path_ordinal,
                "reference_ordinal": ordinal, "path": diagnostic["path"],
                "custom_game_crate": diagnostic["custom_game_crate"], "system_id": diagnostic["system_id"],
                "reference_kind": ref["kind"], "site": hex(site), "instruction_bytes": raw.hex(),
                "actual_native_owner": hex(actual) if actual is not None else None,
                "exact_exported_instruction_observed": exported == raw,
                "exported_instruction_bytes_at_site": exported.hex() if exported is not None else None,
                "original_reference": ref})
        bindings.append(dict(zip(BODY_FIELDS, (diagnostic["path"], diagnostic["custom_game_crate"],
            sum(owners.values()), sum(v for k, v in owners.items() if k is not None),
            len(owners) - int(None in owners), owners[None]))))
    projected = [{key: row[key] for key in BODY_FIELDS} for row in expected_bindings]
    if sorted(bindings, key=lambda r: r["path"]) != sorted(projected, key=lambda r: r["path"]):
        raise ValueError("Per-path diagnostic bindings differ from the explicit census")
    counts = {"paths": len(bindings), "custom_paths": sum(r["custom_game_crate"] for r in bindings),
        "paths_with_verified_diagnostic_sites": sum(bool(r["verified_sites"]) for r in bindings),
        "paths_with_actual_native_owners": sum(bool(r["actual_native_body_owners"]) for r in bindings),
        "verified_sites": len(records),
        "sites_without_actual_native_owner": sum(r["actual_native_owner"] is None for r in records)}
    if counts != census["diagnostic_binding_counts"]:
        raise ValueError("All-path/custom diagnostic counts differ from the census")
    if (counts["paths"] != source["counts"]["diagnostic_paths"] or
            counts["custom_paths"] != source["counts"]["custom_diagnostic_paths"] or
            counts["verified_sites"] != source["counts"]["verified_instruction_references"]):
        raise ValueError("Projected diagnostic counts differ from source inventory")
    counts.update(custom_verified_sites=sum(r["verified_sites"] for r in bindings if r["custom_game_crate"]),
        custom_sites_without_actual_native_owner=sum(r["sites_without_actual_ghidra_owner"]
                                                     for r in bindings if r["custom_game_crate"]),
        exact_exported_instruction_sites=sum(r["exact_exported_instruction_observed"] for r in records))
    counts["without_exact_exported_instruction_sites"] = len(records) - counts["exact_exported_instruction_sites"]
    limits = ["Actual body ownership and exact exported starts/bytes describe only the explicit saved census.",
        "The projection reuses independently verified census boundaries; it neither decodes nor adds instructions.",
        "Declared extent candidates are preserved in original_reference; they do not replace actual flow bodies.",
        "A body owner or exact instruction does not prove a callable entry, reachable behavior, source semantics or parity.",
        "No native analysis mutation, compilation, source/game execution or original/rebuilt comparison occurs."]
    output.mkdir(parents=True, exist_ok=True)
    full = output / "diagnostic-sites.json"
    lines = output / "diagnostic-sites.jsonl"
    pending_full, pending_lines = full.with_suffix(".json.pending"), lines.with_suffix(".jsonl.pending")
    pending_lines.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in records))
    pending_full.write_text(json_text({"target": census["target"], "census_summary": census_ref,
        "source_inventory": inventory_ref, "path_bindings": bindings, "reference_records": records, "limits": limits}))
    # Reject mutations during the potentially long streamed instruction scan.
    for path, digest in commitments.items():
        if file_sha256(path) != digest:
            raise ValueError("Input drift before publication: " + str(path.relative_to(ROOT)))
    target_bytes(target)
    pending_full.replace(full)
    pending_lines.replace(lines)
    summary = {"schema_version": 1, "target": census["target"], "generator": generator,
        "invocation": ["python3", "-B", generator["path"], "--census-summary", census_ref["path"],
                       "--output-directory", output.relative_to(ROOT).as_posix()],
        "generator_dependencies": dependencies, "census_summary": census_ref,
        "census_profile_digest": census.get("profile_digest"), "source_summary": source_ref,
        "source_inventory": inventory_ref, "census_exports": exports, "counts": counts,
        "reference_kinds": dict(sorted(Counter(r["reference_kind"] for r in records).items())),
        "artifacts": {"json": {"path": full.relative_to(ROOT).as_posix(), "sha256": file_sha256(full)},
                      "jsonl": {"path": lines.relative_to(ROOT).as_posix(), "sha256": file_sha256(lines)}},
        "selectors": {"all": "reference_records[*]", "ownerless": "reference_records[actual_native_owner == null]",
            "custom_ownerless": "reference_records[custom_game_crate == true and actual_native_owner == null]",
            "without_exact_exported_instruction": "reference_records[exact_exported_instruction_observed == false]"},
        "native_source_semantics_established": False, "parity_verified": False, "gap_ids": [41], "limits": limits}
    summary_path = output / "diagnostic-site-summary.json"
    summary_path.with_suffix(".json.pending").write_text(json_text(summary))
    summary_path.with_suffix(".json.pending").replace(summary_path)
    return {"summary": summary_path.relative_to(ROOT).as_posix(), "counts": counts, "parity_verified": False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--census-summary", required=True)
    parser.add_argument("--output-directory", required=True)
    args = parser.parse_args()
    try:
        print(json_text(audit(args.census_summary, args.output_directory)), end="")
    except (OSError, ValueError, KeyError) as error:
        parser.exit(1, str(error) + "\n")


if __name__ == "__main__":
    main()
