#!/usr/bin/env python3
"""Reproduce the compact discovery registry from its immutable graph and query receipts.

This is read-only unless --write is selected. It starts no native tool, compiler,
client or service and never promotes ownership or source/parity status.
"""
import argparse
import json
from pathlib import Path
from collections import Counter
from coverage_common import ROOT, file_sha256, latest_target, project_path
from discovery_native_subject import verify_native_query_subject
from portable_paths import portable_json

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument(
    "--profile", help="Immutable profile directory returned by compose-as-discovery"
)
mode = parser.add_mutually_exclusive_group()
mode.add_argument("--write", action="store_true")
mode.add_argument("--check", action="store_true")
args = parser.parse_args()
reg = ROOT / "docs/analysis/coverage/as-discovery.json"
r = json.loads(reg.read_text())
selected = latest_target(verify=True)
assert all(
    r["target"][key] == selected[key] for key in ("version", "sha256", "size_bytes")
)
folder = (
    (ROOT / args.profile).resolve()
    if args.profile
    else (ROOT / r["artifacts"]["profile.json"]["path"]).parent
)
assert folder.is_relative_to(ROOT / "runtime/coverage")
docs = {
    name: json.loads((folder / name).read_text())
    for name in ("profile.json", "graph.json", "queue.json", "journal.json")
}
profile, graph, queue = docs["profile.json"], docs["graph.json"], docs["queue.json"]
assert all(doc["target"]["sha256"] == selected["sha256"] for doc in docs.values())
assert (
    queue["semantic_frontier_closed"] is False
    and queue["global_native_semantics_complete"] is False
)
assert queue["parity_verified"] is False and all(
    state == "partial" for state in queue["stages"].values()
)
reviews = [
    node["review"]
    for node in graph["nodes"]
    if node["kind"] == "explicit_bounded_review"
]
# The current registry supplies the target-specific review path; new profiles
# retain that same input while source/query commitments change.
review_path = ROOT / r["review_input"]["path"]
review_input = json.loads(review_path.read_text())
resolved = review_input.get("resolved_correspondence_questions", [])


def sha(p):
    return file_sha256(project_path(p))


def ref(p):
    path = (ROOT / p).resolve()
    assert path.is_relative_to(ROOT)
    return {"path": path.relative_to(ROOT).as_posix(), "sha256": sha(path)}


assert sha(folder / "profile.json") == graph["profile_id"] == folder.name
assert queue["profile_id"] == docs["journal.json"]["profile_id"] == graph["profile_id"]


qs = {}
operations = {}
for v in reviews:
    q = v["query_metadata"]
    identity = q.get("evidence_id", q.get("ghidra_evidence_id"))
    p = q.get("result", q.get("retained_result"))
    if p is None:
        p = next(x for x in v["result_receipts"] if x["kind"] == "raw_query_result")
    path = p["path"] if isinstance(p, dict) else p
    raw = json.loads(project_path(path).read_text())
    native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
    verify_native_query_subject(ROOT, native, q, r["target"])
    operations[identity] = native["operation"]
    qs.setdefault(identity, q)
counts = {
    "nodes": len(graph["nodes"]),
    "edges": len(graph["edges"]),
    "node_kinds": dict(Counter(n["kind"] for n in graph["nodes"])),
    "node_ownership_states": dict(Counter(n["ownership"] for n in graph["nodes"])),
    "queue_states": dict(Counter(n["state"] for n in queue["entries"])),
    "input_commitments": len(profile["inputs"]),
    "finding_bindings": sum(
        n["kind"] == "explicit_finding_binding" for n in graph["nodes"]
    ),
    "bounded_semantic_reviews": len(reviews),
    "review_states": dict(Counter(v["state"] for v in reviews)),
    "reviewed_ownership_states": dict(Counter(v["ownership"] for v in reviews)),
    "selected_review_query_records": len(reviews),
    "distinct_selected_review_queries": len(qs),
    "distinct_selected_decompiler_queries": sum(
        v == "procedure_pseudo_code" for v in operations.values()
    ),
    "source_connection_review_states": dict(
        Counter(v.get("source_connection_state", "unspecified") for v in reviews)
    ),
    "source_connected_review_scopes": sum(
        v.get("source_connection_state") == "connected" for v in reviews
    ),
    "partial_source_interface_review_scopes": sum(
        v.get("source_connection_state") == "partial_interface_connected"
        for v in reviews
    ),
    "pending_frontier_entries": sum(v["state"] == "pending" for v in queue["entries"]),
    "pending_native_leads": sum(
        v["kind"] == "explicit_pending_native_lead" for v in graph["nodes"]
    ),
    "pending_correspondence_leads": sum(
        v["kind"] == "explicit_pending_correspondence" for v in graph["nodes"]
    ),
    "resolved_original_table_questions": len(resolved),
}
assert counts["nodes"] == len({node["id"] for node in graph["nodes"]})
assert counts["edges"] == len({edge["id"] for edge in graph["edges"]})
r["profile_id"] = graph["profile_id"]
r["generator"] = profile["generator"]
r["artifacts"] = {n: ref(folder / n) for n in docs}
r["review_input"] = ref(review_path)
r["data_classification_input"] = next(
    row
    for row in profile["inputs"]
    if row["path"].endswith("/data-classification/source-connected-manifest.json")
    or row["path"] == r["data_classification_input"]["path"]
)
r["connection_ledger_input"] = ref("docs/analysis/coverage/exe-connections.json")
# These roles keep stable paths while their exact selected commitments change.
# Take the receipts from the admitted profile rather than retain old registry
# hashes or recapture unselected current bytes.
for role in ("unknown_selector_input", "current_native_body_census"):
    selected_inputs = [row for row in profile["inputs"] if row["path"] == r[role]["path"]]
    assert len(selected_inputs) == 1, "Profile must admit exactly one " + role
    r[role] = selected_inputs[0]
r["counts"] = counts
module_nodes = [n for n in graph["nodes"] if n["kind"] == "registered_module_context"]
ledger = json.loads((ROOT / r["connection_ledger_input"]["path"]).read_text())
module_counts = ledger["counts"]
registered_contracts = sum(n["registered_contract"] for n in module_nodes)
assert len(module_nodes) == module_counts["custom_system_rows"]
assert registered_contracts == module_counts["with_registered_current_bounded_contract"]
r["current_module_dimensions"].update(
    custom_system_rows=len(module_nodes),
    with_partial_reconstructed_source=len(module_nodes) - module_counts["without_source_correspondence"],
    with_registered_current_bounded_contract=registered_contracts,
)
r["reviews"] = [
    {
        k: v[k]
        for k in [
            "id",
            "selector",
            "finding_ids",
            "state",
            "ownership",
            "semantic_status",
            "source_connection_state",
        ]
    }
    for v in reviews
]
r["query_records"] = [qs[k] for k in sorted(qs)]
r["resolved_correspondence_questions"] = resolved
r["reproduce"] = {
    mode: "python3 -B scripts/compose-as-discovery.py --classification "
    + r["data_classification_input"]["path"]
    + " --unknown "
    + r["unknown_selector_input"]["path"]
    + " --connections "
    + r["connection_ledger_input"]["path"]
    + " --census "
    + r["current_native_body_census"]["path"]
    + " --reviews "
    + r["review_input"]["path"]
    + " --"
    + mode
    + (" --retain-stale-source-reviews"
       if profile.get("review_source_policy") == "retain_stale_as_pending" else "")
    for mode in ["write", "check"]
}
r["summary_generator"] = {
    "path": "scripts/summarize-as-discovery.py",
    "sha256": sha(Path(__file__)),
    "scope": "Deterministic graph/review/query counts and current compact registry; no inferred native ownership or closure.",
    "dependencies": [ref("scripts/discovery_native_subject.py"),
                     ref("scripts/inventory-executable.py"), ref("scripts/coverage_common.py")],
}
for name, record in r["artifacts"].items():
    assert sha(record["path"]) == record["sha256"]
for entry in profile["inputs"]:
    if entry.get("exists") is False:
        assert not (ROOT / entry["path"]).exists()
    else:
        assert sha(entry["path"]) == entry["sha256"], entry["path"]
# Preserve the producer commands separately from this derived summary.
summary_profile = folder.relative_to(ROOT).as_posix()
r["reproduce"] = {
    name: [
        command,
        "python3 -B scripts/summarize-as-discovery.py --profile "
        + summary_profile
        + " --"
        + name,
    ]
    for name, command in r["reproduce"].items()
}
encoded = portable_json(r, indent=2) + "\n"
if args.write:
    reg.write_text(encoded)
else:
    assert (
        reg.read_text() == encoded
    ), "Discovery registry is stale; compose/review inputs, then use --write"
print(
    json.dumps(
        {
            "nodes": counts["nodes"],
            "edges": counts["edges"],
            "bounded_review_scopes": len(reviews),
            "distinct_native_queries": len(qs),
            "pending": counts["pending_frontier_entries"],
            "written": args.write,
            "parity_verified": False,
        },
        indent=2,
    )
)
