#!/usr/bin/env python3
"""Replay saved switch evidence while retaining its original source snapshots.

No native provider, compiler, application or server is invoked. Default mode
checks the published derivation; --preview checks the replay before publication.
"""
import argparse
from contextlib import redirect_stdout
from copy import deepcopy
import hashlib
import io
import json
from pathlib import Path
import sys

from coverage_common import ROOT, file_sha256, json_text, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

PLAN = "docs/analysis/evidence/switch-correspondence-replay.json"
SCRIPT = "scripts/replay-switch-correspondence.py"
# Exact first replay publication, before freezing all four query-fixture inputs.
# It may transition once to this derivation; arbitrary current outputs may not.
PRIOR_PUBLICATION = {
    "proposal_review": "8b4f9ba537773c83ec756171d0c80233108f078e24de4db32dd9d7c4e2645c31",
    "frontier": "39659bb046d16dbc6e4b43a7355094cc740c7081d5dfdbfa1953e2a517f7070d",
    "query_review": "2fbeecebe5363e7b153840cc0f96b7217c1b5891810e52a7d00f4a041d707952",
}


def require(condition, message):
    if not condition:
        raise ValueError("Switch correspondence replay: " + message)


def encoded(value):
    return json_text(value).encode()


def receipt(path):
    return dict(path=path, sha256=file_sha256(project_path(path)))


def object_receipt(raw):
    checksum = hashlib.sha256(raw).hexdigest()
    return dict(path=f"runtime/analysis/objects/{checksum[:2]}/{checksum}", sha256=checksum)


def original(binding):
    """Initial snapshots may be read in place only before their CAS publication."""
    path = project_path(binding["path"])
    if not path.exists() and binding.get("initial_path"):
        path = project_path(binding["initial_path"])
    raw = path.read_bytes()
    require(hashlib.sha256(raw).hexdigest() == binding["sha256"], "initial snapshot differs: " + str(path))
    return raw


def without(value, *keys):
    return {key: deepcopy(item) for key, item in value.items() if key not in keys}


def publication_payload(value):
    """Only provenance inputs and evidence references may roll forward."""
    value = without(value, "inputs")
    context = value.get("complete_AS_context_reconciliation")
    if context is not None:
        context["evidence"] = None
    for lead in value.get("leads", {}).values():
        if lead.get("current_candidate_proof"):
            lead["current_candidate_proof"]["evidence"] = None
    return value


def preserve_sources(generated, retained):
    """A metadata replay cannot recapture current source as initial evidence."""
    require(generated["target"] == retained["target"], "source snapshot target differs")
    require(generated["predecessor"] == retained["predecessor"], "source snapshot predecessor differs")
    require(generated["leads"].keys() == retained["leads"].keys(), "source snapshot question set differs")
    for name, lead in generated["leads"].items():
        old = retained["leads"][name]
        require([r["path"] for r in lead["current_source_receipts"]] ==
                [r["path"] for r in old["current_source_receipts"]], "source path set differs: " + name)
        lead["current_source_receipts"] = deepcopy(old["current_source_receipts"])
        require(without(lead, "current_candidate_proof") == without(old, "current_candidate_proof"),
                "native or historical question changed: " + name)
    require(without(generated, "leads", "inputs", "generator", "complete_AS_context_reconciliation") ==
            without(retained, "leads", "inputs", "generator", "complete_AS_context_reconciliation"),
            "correspondence classification changed")


def verify_query_fixture(manifest_path, static_path, target):
    """Check original native/query evidence; source bindings remain historical."""
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    proof = json.loads(project_path(manifest_path).read_text())
    static = json.loads(project_path(static_path).read_text())
    require(proof["target"] == static["target"] == target, "query fixture target differs")
    require(static["manifest_sha256"] == file_sha256(project_path(manifest_path)), "query fixture manifest differs")
    image = target_bytes(target)
    pe = load_script("switch_replay_query_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        address = int(row["virtual_address"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        require(offset == int(row["file_offset"], 16) and raw == bytes.fromhex(row["bytes_hex"])
                and hashlib.sha256(raw).hexdigest() == row["sha256"], "query original range differs")
        if row in proof["native_ranges"]:
            instructions = list(decoder.disasm(raw, address))
            require(sum(i.size for i in instructions) == len(raw) and
                    len(instructions) == row["instruction_count"], "query instruction boundaries differ")
    for binding in proof["inputs"]:
        require(file_sha256(project_path(binding["path"])) == binding["sha256"], "query input differs")
    for query in proof["queries"]:
        require(file_sha256(project_path(query["result"]["path"])) == query["result"]["sha256"], "query result differs")
        raw = json.loads(project_path(query["result"]["path"]).read_text())
        native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
        require(hashlib.sha256(native["normalized_result"].encode()).hexdigest() == query["normalized_text_sha256"],
                "query normalized result differs")
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    return dict(native_ranges=len(proof["native_ranges"]), native_data_ranges=len(proof["native_data"]),
                query_subjects=len(proof["queries"]), source_bindings="original snapshots retained, not recaptured")


def collect():
    plan_binding, generator = receipt(PLAN), receipt(SCRIPT)
    plan = json.loads(project_path(PLAN).read_text())
    target = latest_target(verify=True)
    target = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    require(target == plan["target"], "selected target differs")
    original_bytes = {name: original(binding) for name, binding in plan["originals"].items()}
    old = {name: json.loads(raw) for name, raw in original_bytes.items()}
    for value in old.values():
        require(value["target"] == target, "original proof target differs")
    producer = load_script("switch_replay_producer", project_path(plan["invocation"]["script"]))
    captured = []
    publisher = producer.publish_results
    producer.publish_results = lambda *args: captured.append(args)
    argv = sys.argv
    try:
        sys.argv = [plan["invocation"]["script"], *plan["invocation"]["arguments"]]
        with redirect_stdout(io.StringIO()):
            producer.main()
    finally:
        producer.publish_results = publisher
        sys.argv = argv
    require(len(captured) == 1, "producer did not yield one complete publication")
    _, full, compact, correspondence, commitments, _ = captured[0]
    require(without(full, "inputs", "input_commitments") ==
            without(old["native_witness"], "inputs", "input_commitments"), "complete native witness changed")
    require(without(compact, "inputs", "complete_AS_context_reconciliation") ==
            without(old["proposal_review"], "inputs", "complete_AS_context_reconciliation"), "proposal classification changed")
    preserve_sources(correspondence, old["frontier"])
    generated_inputs = {r["path"]: r["sha256"] for r in commitments}
    initial_inputs = {r["path"]: r["sha256"] for r in old["native_witness"]["inputs"]}
    require(generated_inputs.keys() == initial_inputs.keys(), "native input path set changed")
    changed_inputs = sorted(name for name in generated_inputs if generated_inputs[name] != initial_inputs[name])
    require(changed_inputs == plan["permitted_replayed_tool_inputs"], "unexpected native input drift")
    snapshots = [{key: row[key] for key in ("path", "sha256")} for row in plan["originals"].values()]
    replay_dependencies = [receipt(path) for path in ("scripts/discovery_native_subject.py", "scripts/script_sources.py")]
    structural_query_inputs = {plan["outputs"]["frontier"], plan["originals"]["native_witness"]["path"]}
    query_fixtures = [deepcopy(row) for row in old["query_witness"]["inputs"] if row["path"] not in structural_query_inputs]
    require(len(query_fixtures) == 4, "query fixture population differs")
    for binding in query_fixtures:
        require(file_sha256(project_path(binding["path"])) == binding["sha256"], "original query fixture changed")
    commitments += [plan_binding, generator, *replay_dependencies, *snapshots, *query_fixtures]
    full["input_commitments"] = deepcopy(commitments)
    full["metadata_replay"] = dict(plan=plan_binding, generator=generator, dependencies=replay_dependencies,
        original_native_witness=snapshots[list(plan["originals"]).index("native_witness")],
        initial_source_snapshot=snapshots[list(plan["originals"]).index("frontier")],
        source_receipt_policy="retain exact original current_source_receipts for every stable question",
        changed_tool_inputs=changed_inputs, query_fixture_inputs=query_fixtures, complete_native_payload_equal=True)
    full["inputs"] = deepcopy(commitments)
    full_raw = encoded(full)
    full_reference = object_receipt(full_raw)
    context_proof = dict(counts=full["complete_AS_context_reconciliation"]["counts"],
                         evidence=full_reference, selector=["complete_AS_context_reconciliation"])
    compact["inputs"] = [full_reference, *commitments]
    compact["complete_AS_context_reconciliation"] = deepcopy(context_proof)
    correspondence["inputs"] = deepcopy(commitments)
    correspondence["complete_AS_context_reconciliation"] = deepcopy(context_proof)
    for lead in correspondence["leads"].values():
        if lead["current_native_candidate"] is None:
            continue
        site = lead["current_native_candidate"]["dispatch_site"]
        witness = full["correspondence_candidates"][site]
        require(witness["native_candidate"] == lead["current_native_candidate"] and
                witness["location"] == lead["current_native_location"], "candidate witness differs")
        lead["current_candidate_proof"] = dict(evidence=full_reference,
            selector=["correspondence_candidates", site, "native_candidate"],
            location_selector=["correspondence_candidates", site, "location"])
    frontier_path = plan["outputs"]["frontier"]
    frontier_raw = encoded(correspondence)
    frontier_reference = dict(path=frontier_path, sha256=hashlib.sha256(frontier_raw).hexdigest())
    query = deepcopy(old["query_witness"])
    candidate = query["native_candidate"]
    witness = full["correspondence_candidates"][candidate["dispatch_site"]]
    require(candidate == witness["native_candidate"] and query["native_location"] == witness["location"],
            "changed query candidate/location changed")
    replacements = {plan["outputs"]["frontier"]: frontier_reference,
                    plan["originals"]["native_witness"]["path"]: full_reference}
    query["inputs"] = [deepcopy(replacements.get(row["path"], row)) for row in query["inputs"]]
    query_checks = verify_query_fixture(plan["query_manifest"], plan["query_static_check"], target)
    query["metadata_replay"] = dict(plan=plan_binding, generator=generator, dependencies=replay_dependencies,
        original_witness={key: plan["originals"]["query_witness"][key] for key in ("path", "sha256")},
        native_candidate_and_location_equal=True, native_query_fixture=query_checks)
    query["inputs"] += [plan_binding, generator, *replay_dependencies]
    query_raw = encoded(query)
    query_reference = object_receipt(query_raw)
    replacements[plan["originals"]["query_witness"]["path"]] = query_reference
    supplement = deepcopy(old["query_review"])
    supplement["inputs"] = [deepcopy(replacements.get(row["path"], row)) for row in supplement["inputs"]]
    for lead in supplement["leads"].values():
        require(lead["current_candidate_proof"]["evidence"] ==
                {key: plan["originals"]["query_witness"][key] for key in ("path", "sha256")}, "query lead witness differs")
        lead["current_candidate_proof"]["evidence"] = deepcopy(query_reference)
    documents = {project_path(plan["outputs"]["proposal_review"]): encoded(compact),
                 project_path(frontier_path): frontier_raw,
                 project_path(plan["outputs"]["query_review"]): encoded(supplement)}
    return plan, original_bytes, documents, [(full_raw, full_reference), (query_raw, query_reference)], commitments, producer


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--preview", action="store_true")
    args = parser.parse_args()
    plan, originals, documents, objects, commitments, producer = collect()
    snapshot_bindings = {row["path"]: row for row in plan["originals"].values()}
    def recheck():
        for binding in commitments:
            if binding["path"] in snapshot_bindings:
                original(snapshot_bindings[binding["path"]])
            else:
                require(file_sha256(project_path(binding["path"])) == binding["sha256"], "input changed during replay")
        selected = latest_target(verify=True)
        require(all(selected[key] == value for key, value in plan["target"].items()), "target changed during replay")
    recheck()
    if args.write:
        for role, name in plan["outputs"].items():
            path = project_path(name)
            current = path.read_bytes()
            require(current in (originals[role], documents[path]) or
                    hashlib.sha256(current).hexdigest() == PRIOR_PUBLICATION[role],
                    "unrecognized prior publication: " + name)
            require(publication_payload(json.loads(path.read_text())) == publication_payload(json.loads(originals[role])),
                    "native classification/source snapshot changed before publication: " + name)
        from shared_analysis import SharedAnalysis
        store = SharedAnalysis(ROOT)
        for name, raw in originals.items():
            row = store.put_bytes(raw, kind="switch-correspondence-original", provenance=dict(replay_plan=PLAN, role=name))
            require(row["path"] == plan["originals"][name]["path"] and row["sha256"] == plan["originals"][name]["sha256"], "snapshot CAS identity differs")
        for raw, expected in objects:
            row = store.put_bytes(raw, kind="switch-correspondence-replay", provenance=dict(replay_plan=PLAN))
            require(row["path"] == expected["path"] and row["sha256"] == expected["sha256"], "replay CAS identity differs")
        recheck()
        producer.replace_documents(documents)
    elif not args.preview:
        for path, raw in documents.items():
            require(path.read_bytes() == raw, "published document differs: " + str(path.relative_to(ROOT)))
        for raw, binding in objects:
            require(project_path(binding["path"]).read_bytes() == raw, "published CAS differs")
    for name, raw in originals.items():
        require(original(plan["originals"][name]) == raw, "initial snapshot changed")
    recheck()
    print(json_text(dict(result="preview passed" if args.preview else "verified", native_payload_equal=True,
        retained_source_questions=14, geometry_candidates=6, changed_query_candidates=1,
        objects=objects and [row for _, row in objects],
        outputs=[dict(path=str(path.relative_to(ROOT)), sha256=hashlib.sha256(raw).hexdigest()) for path, raw in documents.items()])))


if __name__ == "__main__":
    main()
