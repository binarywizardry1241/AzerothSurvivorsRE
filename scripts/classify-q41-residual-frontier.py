#!/usr/bin/env python3
"""Reconcile complete residual/stop and incoming AS-flow observations.

Reads the existing exact census; no native producer, compilation or application
is launched. Diagnostic context and encoded flow do not establish semantics.
"""
import argparse
from bisect import bisect_right
from collections import Counter, defaultdict
import csv
import gzip
import hashlib
import json

from coverage_common import ROOT, file_sha256, latest_target, project_path, target_bytes
from script_sources import load_script

TARGET_SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
OUTPUT = "docs/analysis/evidence/0.121.0/residual-frontier.json"
DETAIL = f"runtime/coverage/{TARGET_SHA}/residual-frontier/incoming-flow.json"
PREFIXES = ("crates/wenilla-rogue/", "crates/wenilla-rogue-app/")


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


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


def encode(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def derive():
    target = latest_target(verify=True)
    if target["sha256"] != TARGET_SHA:
        raise ValueError("This proof requires the registered 0.121.0 bytes")
    identity = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    generator = receipt("scripts/classify-q41-residual-frontier.py")
    dependencies = [receipt(name) for name in (
        "scripts/coverage_common.py", "scripts/inventory-executable.py", "scripts/script_sources.py")]
    inputs = [receipt(name) for name in (
        "docs/analysis/coverage/full-image-execheck-0.121.0.json",
        "docs/analysis/evidence/0.121.0/native-residuals.json",
        "docs/analysis/evidence/0.121.0/as-residual-ranges.json",
        "docs/analysis/evidence/0.121.0/as-ownerless-sites.json",
    )]
    census, residual, prior, prior_ownerless = [json.loads(checked(row).read_text()) for row in inputs]
    if any(value["target"] != identity for value in (census, residual, prior, prior_ownerless)):
        raise ValueError("Mixed native targets")
    artifacts = residual["artifacts"]
    directory = census["artifacts"]["directory"]
    exports = {name: {"path": f"{directory}/{name}", "sha256": meta["sha256"]}
               for name, meta in census["artifacts"]["files"].items()
               if name in ("bodies.tsv.gz", "references.tsv.gz")}
    used = [*exports.values(), *(artifacts[name] for name in (
        "declared-extent-roles.tsv.gz", "diagnostic-sites.jsonl.gz",
        "complement-region-roles.tsv.gz", "complement-stops.jsonl.gz",
        "ownerless-instructions.tsv.gz"))]
    extents = list(tsv_rows(artifacts["declared-extent-roles.tsv.gz"]))
    extent_starts = [int(row["start"], 16) for row in extents]
    assert len(extents) == 358683 and extent_starts == sorted(set(extent_starts))

    def extent_at(site):
        i = bisect_right(extent_starts, site) - 1
        return i if i >= 0 and site < int(extents[i]["end_exclusive"], 16) else None

    contexts, extent_contexts = defaultdict(set), defaultdict(set)
    genuine_as_extents = set()
    for row in json_rows(artifacts["diagnostic-sites.jsonl.gz"]):
        if row["actual_body_owner"]:
            contexts[row["actual_body_owner"]].add(row["path"])
        index = extent_at(int(row["instruction_address"], 16))
        if index is not None:
            extent_contexts[index].add(row["path"])
            if row["kind"] == "rust_location" and row["path"].startswith(PREFIXES):
                genuine_as_extents.add(index)
    as_owners = frozenset(key for key, paths in contexts.items()
                          if any(path.startswith(PREFIXES) for path in paths))
    bodies = []
    for row in tsv_rows(exports["bodies.tsv.gz"]):
        if row["external"] != "true":
            bodies.append((int(row["start"], 16), int(row["end"], 16) + 1, "0x" + row["entry"]))
    bodies.sort()
    assert all(a[1] <= b[0] for a, b in zip(bodies, bodies[1:]))
    starts = [row[0] for row in bodies]

    def owner(site):
        i = bisect_right(starts, site) - 1
        return bodies[i][2] if i >= 0 and site < bodies[i][1] else None

    mixed_ranges = [(int(row[1], 16), int(row[2], 16), row[0])
                    for entry in prior["extents"] for row in entry["ranges"]]
    mixed_ranges.sort()
    mixed_starts = [row[0] for row in mixed_ranges]

    def prior_mixed(site):
        i = bisect_right(mixed_starts, site) - 1
        return mixed_ranges[i][2] if i >= 0 and site < mixed_ranges[i][1] else None

    retained_runs = prior_ownerless["as_location_extent_frontier"]["runs"]
    retained_token_calls = {int(row["first_call"]["site"], 16): row
                            for row in prior_ownerless["sites"]
                            if row["role"] == "adjacent-token-not-filename-use"}
    retained_run_starts = [int(row["start"], 16) for row in retained_runs]
    assert retained_run_starts == sorted(set(retained_run_starts))

    def retained_run(site):
        i = bisect_right(retained_run_starts, site) - 1
        return i if i >= 0 and site < int(retained_runs[i]["end_exclusive"], 16) else None

    ownerless_counts, retained_run_counts = Counter(), Counter()
    ownerless_total, ownerless_sites = 0, set()
    for row in tsv_rows(artifacts["ownerless-instructions.tsv.gz"]):
        site = int(row["address"], 16)
        assert owner(site) is None
        ownerless_total += 1
        ownerless_sites.add(site)
        index = extent_at(site)
        role = ("genuine_AS_Location_extent" if index in genuine_as_extents else
                "other_diagnostic_context_extent" if index in extent_contexts else
                "no_diagnostic_context_extent" if index is not None else "outside_declared_extents")
        ownerless_counts[role] += 1
        if index in genuine_as_extents:
            prior_index = retained_run(site)
            assert prior_index is not None
            retained_run_counts[prior_index] += 1
    assert ownerless_total == artifacts["ownerless-instructions.tsv.gz"]["rows"]
    assert len(retained_run_counts) == len(retained_runs) == 49
    assert all(retained_run_counts[i] == row["instructions"] for i, row in enumerate(retained_runs))

    regions = list(tsv_rows(artifacts["complement-region-roles.tsv.gz"]))
    region_end = {int(row["end_exclusive"], 16): row for row in regions}
    assert len(regions) == artifacts["complement-region-roles.tsv.gz"]["rows"]
    image = target_bytes(target)
    pe = load_script("residual_frontier_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    stops = list(json_rows(artifacts["complement-stops.jsonl.gz"]))
    boundary_rows = []
    for row in stops:
        if row["reason"] != "outside_file_backed_complement":
            continue
        site = int(row["site"], 16)
        index = extent_at(site)
        assert index is not None and extent_starts[index] == site
        region = region_end[site]
        first = int(region["start"], 16)
        offset = pe.rva_offset(first - pe.image_base)
        raw = image[offset:offset + site - first]
        assert pe.rva_offset(site - 1 - pe.image_base) == offset + len(raw) - 1
        boundary_rows.append({"site": row["site"], "complement_start": hex(first),
                              "prefix_bytes": len(raw), "prefix_sha256": digest(raw),
                              "declared_extent_end_exclusive": "0x" + extents[index]["end_exclusive"],
                              "observed_body_owner": row["observed_body_owner"],
                              "assessment": "complement_end_equals_declared_extent_entry",
                              "semantic_AS_ownership_established": False})
    assert len(stops) == artifacts["complement-stops.jsonl.gz"]["rows"]
    assert len(boundary_rows) == 39

    flow_types = {"UNCONDITIONAL_CALL", "UNCONDITIONAL_JUMP", "CONDITIONAL_JUMP"}
    reference_counts, incoming_counts = Counter(), Counter()
    ownerless_incoming, other_incoming = [], []
    reference_total = 0
    for ordinal, row in enumerate(tsv_rows(exports["references.tsv.gz"])):
        reference_total += 1
        if ":" in row["to"]:
            continue
        destination_owner = owner(int(row["to"], 16))
        if destination_owner not in as_owners:
            continue
        source = int(row["from"], 16)
        source_owner = owner(source)
        role = ("AS_context" if source_owner in as_owners else
                "other_diagnostic_context" if source_owner in contexts else
                "no_diagnostic_context" if source_owner else "ownerless")
        reference_counts[f"{row['type']}:{role}"] += 1
        if row["type"] not in flow_types or source_owner in as_owners:
            continue
        incoming_counts[role] += 1
        index = extent_at(source)
        record = {"reference_ordinal": ordinal, **row,
                  "source_actual_body_owner": source_owner,
                  "destination_actual_body_owner": destination_owner,
                  "source_declared_extent": "0x" + extents[index]["start"] if index is not None else None,
                  "source_diagnostic_contexts": sorted(contexts.get(source_owner, ())),
                  "source_extent_contexts": sorted(extent_contexts.get(index, ())),
                  "source_extent_has_genuine_AS_Location": index in genuine_as_extents,
                  "destination_diagnostic_contexts": sorted(contexts[destination_owner]),
                  "prior_mixed_range_ordinal": prior_mixed(source),
                  "semantic_AS_ownership_established_by_this_join": False}
        if source_owner is None:
            prior_index = retained_run(source)
            record["source_is_observed_ownerless_instruction"] = source in ownerless_sites
            if prior_index is not None:
                record["retained_ownerless_run_start"] = retained_runs[prior_index]["start"]
                record["retained_ownerless_context_role"] = retained_runs[prior_index]["context_role"]
            else:
                token = retained_token_calls[source]
                assert int(token["first_call"]["target"], 16) == int(row["to"], 16)
                assert token["declared_extent"] == record["source_declared_extent"]
                record["retained_token_diagnostic_site"] = token["site"]
                record["retained_token"] = token["token"]["text"]
                record["retained_ownerless_context_role"] = token["role"]
        (ownerless_incoming if source_owner is None else other_incoming).append(record)
    assert reference_total == residual["counts"]["static_reference_records"]
    detail = {"target": identity, "other_body_direct_incoming": other_incoming}
    caller_owners = {row["source_actual_body_owner"] for row in other_incoming}
    query_receipts, query_results = [], {}
    for plan_name, directory in (
        ("seeded-plan.json", "seeded-query"), ("all-plan.json", "all-query")
    ):
        base = "runtime/fixgap41-callers/"
        plan_receipt = receipt(base + plan_name)
        journal_receipt = receipt(base + directory + "/journal.json")
        plan = json.loads(checked(plan_receipt).read_text())
        journal = json.loads(checked(journal_receipt).read_text())
        if (journal["status"] != "completed"
                or journal["identity"]["target"]["sha256"] != TARGET_SHA
                or journal["identity"]["plan"]["plan_sha256"] != plan_receipt["sha256"]):
            raise ValueError("Incomplete or changed caller query plan")
        planned = {op["arguments"]["procedure"] for op in plan["operations"]}
        completed = set()
        for op in journal["operations"].values():
            procedure = op["arguments"]["procedure"]
            if (op["status"] != "completed" or op["name"] != "procedure_pseudo_code"
                    or procedure in query_results):
                raise ValueError("Incomplete or duplicate caller subject")
            native = json.loads(checked(op["result"]).read_text())["structuredContent"]
            if (native["subject"]["digest"]["sha256"] != TARGET_SHA
                    or native["provider"]["id"] != "ghidra"
                    or native["parameters"] != {"procedure": procedure}
                    or not isinstance(native["normalized_result"], str)
                    or not native["normalized_result"].strip()):
                raise ValueError("Unbound or empty caller result")
            query_results[procedure] = op["result"]
            completed.add(procedure)
        if completed != planned:
            raise ValueError("Caller plan/result subject set differs")
        query_receipts.append({"plan": plan_receipt, "journal": journal_receipt,
                               "seeds": receipt(plan["environment"]["REA_GHIDRA_SEED_FILE"]),
                               "completed_subjects": len(completed)})
    if set(query_results) != caller_owners:
        raise ValueError("Caller native queries do not cover the exact frontier")
    for record in [generator, *dependencies, *inputs, *used]:
        checked(record)
    result = {
        "schema_version": 1, "target": identity, "gap_ids": [41],
        "lead_ids": ["Q41-U01", "Q41-U03", "Q41-U04", "Q41-G01", "Q41-B01"],
        "generator": generator, "dependencies": dependencies, "inputs": inputs, "native_artifacts": used,
        "counts": {
            "declared_extents": len(extents),
            "declared_extents_with_undecoded_suffix": sum(int(x["decoded_end"], 16) < int(x["end_exclusive"], 16) for x in extents),
            "genuine_AS_Location_extents": len(genuine_as_extents),
            "complete_ownerless_instructions": ownerless_total,
            "ownerless_instructions_by_extent_context": dict(sorted(ownerless_counts.items())),
            "genuine_AS_ownerless_instructions_equal_retained_frontier": sum(retained_run_counts.values()),
            "retained_frontier_runs_exactly_reconciled": len(retained_run_counts),
            "complete_complement_regions": len(regions),
            "complete_complement_stops": len(stops),
            "complement_stop_reasons": dict(sorted(Counter(x["reason"] for x in stops).items())),
            "outside_complement_stops_equal_declared_entries": len(boundary_rows),
            "complete_static_references": reference_total,
            "AS_destination_reference_counts": dict(sorted(reference_counts.items())),
            "non_AS_context_direct_incoming_counts": dict(sorted(incoming_counts.items())),
            "ownerless_direct_incoming_prior_mixed_ranges": sum(x["prior_mixed_range_ordinal"] is not None for x in ownerless_incoming),
            "ownerless_direct_incoming_prior_classified_runs": sum("retained_ownerless_run_start" in x for x in ownerless_incoming),
            "ownerless_direct_incoming_prior_classified_token_calls": sum("retained_token_diagnostic_site" in x for x in ownerless_incoming),
            "ownerless_direct_incoming_without_observed_source_instruction": sum(not x["source_is_observed_ownerless_instruction"] for x in ownerless_incoming),
            "other_incoming_source_body_owners": len({x["source_actual_body_owner"] for x in other_incoming}),
        },
        "complement_boundary_stops": boundary_rows,
        "ownerless_direct_incoming": ownerless_incoming,
        "other_body_incoming_artifact": {"path": DETAIL, "sha256": digest(encode(detail)), "rows": len(other_incoming)},
        "caller_native_query_checkpoint": {
            "batches": query_receipts, "completed_subjects": len(query_results),
            "ordered_result_receipts_sha256": digest(encode(dict(sorted(query_results.items())))),
            "source_and_semantic_review_complete": False,
            "limit": "Completed decompilation and exact input bindings are reusable recovery inputs; caller roles, source correspondence and behavioral closure remain incomplete.",
        },
        "limits": [
            "The entire retained populations are consumed; context joins and nominal instruction flow do not prove runtime reachability, source absence, AS ownership or padding.",
            "All 39 outside-complement stops coincide with the next declared extent entry. This resolves their pass-boundary meaning, not the enclosing function semantics.",
            "All 790 ownerless instructions in genuine AS-Location extents exactly reconcile with 49 retained classified runs; incoming reference sources outside that instruction population remain separately identified.",
            "All 28 ownerless incoming-AS flow sites reconcile with retained classifications: 25 exact run members and three exact token-consumer calls. Token adjacency is not a filename-based AS semantic owner.",
            "Non-AS-context callers into AS-context bodies require retained contract/source correspondence before any new semantic recovery; missing diagnostic association alone is not an unexplained AS mechanic.",
            "Ownerless instructions retain original census ownership; this proof neither creates functions nor changes native decoding coverage.",
            "No compilation, application/client/game/network/server execution or original/rebuilt parity validation.",
        ],
    }
    return result, detail


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    result, detail = derive()
    for name, value in ((DETAIL, detail), (OUTPUT, result)):
        path = project_path(name)
        payload = encode(value)
        if args.write:
            path.parent.mkdir(parents=True, exist_ok=True)
            if not path.exists() or path.read_bytes() != payload:
                path.write_bytes(payload)
        elif not path.exists() or path.read_bytes() != payload:
            raise ValueError(f"Derived proof differs: {name}")
    print(json.dumps(result["counts"], sort_keys=True))


if __name__ == "__main__":
    main()
