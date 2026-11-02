#!/usr/bin/env python3
"""Reconcile the complete current AS-context F/A/M reference projections.

This consumes retained native observations; it does not run a native provider,
compile code, infer function semantics from a diagnostic, or close an AS gap.
"""
import argparse
from bisect import bisect_right
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import io
import json
from pathlib import Path

from coverage_common import ROOT, file_sha256, latest_target, project_path

TARGET_SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
OUTPUT = "docs/analysis/evidence/0.121.0/as-reference-frontier.json"
SITE_ARTIFACT = "runtime/fixgap41-dispatch/contextual-reference-sites.jsonl.gz"


def load(path):
    return json.loads(project_path(path).read_text())


def receipt(path):
    return {"path": str(path), "sha256": file_sha256(project_path(path))}


def checked(record):
    path = project_path(record["path"])
    if file_sha256(path) != record["sha256"]:
        raise ValueError(f"Retained input changed: {record['path']}")
    return path


def json_rows(record):
    with gzip.open(checked(record), "rt") as stream:
        for line in stream:
            yield json.loads(line)


def tsv_rows(record):
    with gzip.open(checked(record), "rt") as stream:
        yield from csv.DictReader(stream, delimiter="\t")


def collect():
    generator = receipt("scripts/classify-q41-as-references.py")
    dependencies = [receipt("scripts/coverage_common.py")]
    target = latest_target(verify=True)
    if target["sha256"] != TARGET_SHA:
        raise ValueError("This assessment requires the registered 0.121.0 target")
    names = {
        "census": "docs/analysis/coverage/full-image-execheck-0.121.0.json",
        "residuals": "docs/analysis/evidence/0.121.0/native-residuals.json",
        "indirect": "docs/analysis/coverage/native-ownership-classification.json",
        "operands": "docs/analysis/evidence/0.121.0/native-operands.json",
        "table_review": "docs/analysis/evidence/0.121.0/switch-context-source-review.json",
        "retained": "docs/analysis/evidence/0.121.0/computed-correspondence-frontier.json",
    }
    input_receipts = [receipt(path) for path in names.values()]
    documents = {key: load(path) for key, path in names.items()}
    for value in documents.values():
        if value["target"]["sha256"] != TARGET_SHA:
            raise ValueError("Mixed native targets")
    residuals = documents["residuals"]["artifacts"]
    actual, declared = defaultdict(set), defaultdict(set)
    actual_locations, declared_locations = defaultdict(set), defaultdict(set)
    for row in json_rows(residuals["diagnostic-sites.jsonl.gz"]):
        if not row["path"].startswith(("crates/wenilla-rogue/", "crates/wenilla-rogue-app/")):
            continue
        declared[row["runtime_function_start"]].add(row["path"])
        if row["actual_body_owner"]:
            actual[row["actual_body_owner"]].add(row["path"])
        if row["kind"] == "rust_location":
            declared_locations[row["runtime_function_start"]].add(row["path"])
            if row["actual_body_owner"]:
                actual_locations[row["actual_body_owner"]].add(row["path"])
    actual_owners = frozenset(actual)
    declared_owners = frozenset(declared)
    location_owners = frozenset(actual_locations)
    declared_location_owners = frozenset(declared_locations)
    census = documents["census"]
    directory = Path(census["artifacts"]["directory"])
    export_records = {
        name: {"path": str(directory / name), "sha256": meta["sha256"]}
        for name, meta in census["artifacts"]["files"].items()
        if name in ("bodies.tsv.gz", "references.tsv.gz")
    }
    ranges = []
    for row in tsv_rows(export_records["bodies.tsv.gz"]):
        if row["external"] == "true":
            continue
        ranges.append((int(row["start"], 16), int(row["end"], 16) + 1, "0x" + row["entry"]))
    ranges.sort()
    if any(left[1] > right[0] for left, right in zip(ranges, ranges[1:])):
        raise ValueError("Ambiguous overlapping native bodies")
    starts = [row[0] for row in ranges]

    def owner(address):
        index = bisect_right(starts, address) - 1
        return ranges[index][2] if index >= 0 and address < ranges[index][1] else None

    unowned = {int(row["destination"], 16) for row in
               tsv_rows(residuals["unowned-executable-destinations.tsv.gz"])}
    all_refs = 0
    contextual_refs = Counter()
    contextual_unowned = []
    for ordinal, row in enumerate(tsv_rows(export_records["references.tsv.gz"])):
        all_refs += 1
        source = int(row["from"], 16)
        destination = int(row["to"], 16) if ":" not in row["to"] else None
        source_owner = owner(source)
        if source_owner in actual_owners:
            contextual_refs[row["type"]] += 1
            if destination in unowned:
                contextual_unowned.append({"ordinal": ordinal, **row,
                                           "actual_body_owner": source_owner,
                                           "diagnostic_contexts": sorted(actual[source_owner])})
    table_reviews = {row["location"]["site"]: row for row in documents["table_review"]["records"]}
    sites = []
    for row in json_rows(documents["indirect"]["artifact"]):
        native_owner = row["native_owner"]
        if native_owner not in actual_owners and native_owner not in declared_owners:
            continue
        value = {**row, "actual_body_AS_contexts": sorted(actual.get(native_owner, ())),
                 "declared_extent_AS_contexts": sorted(declared.get(native_owner, ())),
                 "actual_body_AS_rust_location_contexts": sorted(actual_locations.get(native_owner, ())),
                 "declared_extent_AS_rust_location_contexts": sorted(declared_locations.get(native_owner, ())),
                 "semantic_AS_ownership_established_by_this_join": False}
        if not value["actual_body_AS_contexts"]:
            value["assessment"] = "declared_extent_context_only_not_actual_AS_body"
        elif row.get("initial_target", {}).get("kind") == "declared-import-slot":
            value["assessment"] = "known_platform_import_interface"
        elif row["site"] in table_reviews:
            review = table_reviews[row["site"]]
            value["assessment"] = "retained_table_review_no_new_semantics_from_site"
            value["retained_review"] = {"selector": review["selector"],
                                         "classification": review["classification"],
                                         "finding_ids": review.get("related_finding_ids", [])}
        else:
            value["assessment"] = "specific_pointer_or_guard_contract_unresolved"
            value["remaining_question"] = (
                "Recover the value supplied to this exact indirect operand, its writers, "
                "admissible targets and AS state/output consumer; a diagnostic context or "
                "an unresolved register is not a missing-source defect.")
        sites.append(value)
    raw_indirect_populations = {}
    raw_context_sites = {}
    for lead, name in [("Q41-F01", "declared-indirect-sites.tsv.gz"),
                       ("Q41-F02", "complement-indirect-sites.tsv.gz")]:
        count = selected = 0
        for row in tsv_rows(residuals[name]):
            count += 1
            if row["source_owner"] in actual_owners:
                selected += 1
                site = hex(int(row["site"], 16))
                if site in raw_context_sites:
                    raise ValueError("Duplicate F01/F02 contextual site")
                raw_context_sites[site] = (row["kind"].split("_")[0], row["source_owner"])
        if count != residuals[name]["rows"]:
            raise ValueError("Incomplete retained F01/F02 population")
        raw_indirect_populations[lead] = {"complete_records": count,
                                          "actual_AS_context_records": selected}
    opcode_context_sites = {row["site"]: (row["kind"], row["native_owner"])
                            for row in sites if row["actual_body_AS_contexts"]}
    if raw_context_sites != opcode_context_sites:
        raise ValueError("Independent F01/F02 and actual-opcode contextual sites differ")
    operands = []
    operand_counts = Counter()
    for row in json_rows(documents["operands"]["inventory"]):
        native_owner = row["source_native_owner"]
        if native_owner not in actual_owners:
            continue
        operand_counts[row["kind"] + ":" + row["target_region"]] += 1
        address = int(row["target"], 16)
        if address in unowned:
            operands.append({**row, "diagnostic_contexts": sorted(actual[native_owner])})
    retained = []
    for key, row in documents["retained"]["leads"].items():
        state = row["historical_classification"]["state"]
        if state != "classified_within_bounded_contract" or row.get("semantic_recovery_reset"):
            raise ValueError(f"Retained question needs renewed semantic review: {key}")
        retained.append({"id": key, "historical_classification": state,
                         "current_applicability": row["applicability"],
                         "fixgap_eligibility": "excluded_proof_only_current_applicability",
                         "source_or_semantics_reset": False})
    artifact_receipts = [residuals["diagnostic-sites.jsonl.gz"],
                         residuals["unowned-executable-destinations.tsv.gz"],
                         residuals["declared-indirect-sites.tsv.gz"],
                         residuals["complement-indirect-sites.tsv.gz"],
                         documents["indirect"]["artifact"], documents["operands"]["inventory"],
                         *export_records.values()]
    # Recheck every owning document and consumed artifact after the complete join.
    # Concurrent alias/summary publication must fail, not bind newly read hashes
    # to observations from an earlier input generation.
    for record in [generator, *dependencies, *input_receipts, *artifact_receipts]:
        checked(record)
    for contexts, frozen in [(actual, actual_owners), (declared, declared_owners),
                             (actual_locations, location_owners),
                             (declared_locations, declared_location_owners)]:
        if frozenset(contexts) != frozen or any(not value for value in contexts.values()):
            raise ValueError("Projection mutated diagnostic owner membership or created an empty ghost context")
    return {
        "schema_version": 1,
        "target": {key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
        "gap_ids": [41], "lead_ids": ["Q41-F01", "Q41-F02", "Q41-A01", "Q41-A02", "Q41-M01"],
        "generator": generator,
        "dependencies": dependencies,
        "inputs": input_receipts,
        "native_exports": list(export_records.values()),
        "full_indirect_populations": raw_indirect_populations,
        "independent_F01_F02_and_actual_opcode_context_sets_equal": True,
        "method": "Complete saved diagnostic association (both path_literal and rust_location) actual-body and declared-extent joins, with narrower rust_location counts and per-site contexts separately retained; exact Ghidra inclusive body ends are converted to half-open intervals. All static references and explicit operands are considered; no sampling or native mutation.",
        "counts": {"actual_AS_context_body_owners": len(actual),
                   "declared_AS_context_extent_owners": len(declared),
                   "actual_AS_rust_location_body_owners": len(actual_locations),
                   "declared_AS_rust_location_extent_owners": len(declared_locations),
                   "complete_static_reference_records": all_refs,
                   "AS_context_static_references_by_type": dict(sorted(contextual_refs.items())),
                   "all_unowned_executable_destinations": len(unowned),
                   "AS_context_static_references_to_unowned_executable_destinations": len(contextual_unowned),
                   "AS_context_explicit_operands_by_kind_region": dict(sorted(operand_counts.items())),
                   "AS_context_operands_to_unowned_executable_destinations": len(operands),
                   "indirect_site_assessments": dict(sorted(Counter(row["assessment"] for row in sites).items())),
                   "actual_AS_context_indirect_kinds": dict(sorted(Counter(row["kind"] for row in sites if row["actual_body_AS_contexts"]).items()))},
        "indirect_sites": sites,
        "AS_context_static_references_to_unowned_executable_destinations": contextual_unowned,
        "AS_context_operands_to_unowned_executable_destinations": operands,
        "retained_questions": retained,
        "limits": ["Diagnostic association is navigation, not semantic AS ownership or complete call reachability.",
                   "Zero contextual edges in these complete saved populations cannot rule out indirect, incoming, address-taken or dynamically constructed references.",
                   "Existing finite metadata recovery and source are retained; newer-target applicability alone is excluded from fixgap repair choices.",
                   "Unresolved call/jump values remain exact recovery questions, not a count of missing implementations. No source execution, compilation, game/server operation or parity validation."]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    value = collect()
    rows = value.pop("indirect_sites")
    encoded = ("\n".join(json.dumps(row, sort_keys=True, separators=(",", ":"))
                         for row in rows) + "\n").encode()
    compressed = io.BytesIO()
    with gzip.GzipFile(filename="", fileobj=compressed, mode="wb", mtime=0) as stream:
        stream.write(encoded)
    payload = compressed.getvalue()
    artifact = project_path(SITE_ARTIFACT)
    value["indirect_site_artifact"] = {"path": SITE_ARTIFACT,
                                       "sha256": hashlib.sha256(payload).hexdigest(),
                                       "rows": len(rows)}
    if args.write:
        artifact.parent.mkdir(parents=True, exist_ok=True)
        if not artifact.exists() or artifact.read_bytes() != payload:
            pending_artifact = artifact.with_suffix(".gz.pending")
            pending_artifact.write_bytes(payload)
            pending_artifact.replace(artifact)
        path = project_path(OUTPUT)
        pending = path.with_suffix(".json.pending")
        pending.write_text(json.dumps(value, indent=2) + "\n")
        pending.replace(path)
    else:
        if artifact.read_bytes() != payload:
            raise ValueError("Complete retained per-site projection differs")
        if load(OUTPUT) != value:
            raise ValueError("Saved AS reference assessment differs; review changes before --write")
    print(json.dumps(value["counts"], indent=2))


if __name__ == "__main__":
    main()
