#!/usr/bin/env python3
"""Review a verified census's proposal frontier; no Program or pipeline writes."""
import argparse
import bisect
from collections import defaultdict
from copy import deepcopy
import importlib.util
import json
import os
from pathlib import Path
import re
import struct
import sys
import tempfile
import uuid

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from coverage_common import file_sha256, json_text, latest_target, project_path, target_bytes
from shared_analysis import SharedAnalysis


def load_helper(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def geometry(row):
    """Whole guarded selector domain and every dispatch-relative successor."""
    site = int(row["site"], 16)
    return {
        "guard_kind": row["guard_kind"],
        "selector_register": row["selector_register"],
        "guard_bound": row["guard_bound"],
        "selector_minimum": row.get("selector_minimum"),
        "selector_maximum": row.get("selector_maximum"),
        "guard_to_dispatch_bytes": site - int(row["guard"], 16),
        "complete_relative_successors": [int(value, 16) - site for value in row["case_targets"]],
    }


def key(row):
    return json.dumps(geometry(row), sort_keys=True, separators=(",", ":"))


def table_candidate(row):
    return {"virtual_address": row["table_address"],
            "end_exclusive": hex(int(row["table_address"], 16) + row["byte_count"]),
            "file_offset": row["file_offset"], "byte_count": row["byte_count"],
            "sha256": row["sha256"], "dispatch_site": row["site"]}


def retained_question_geometry(root, previous_path, previous, question):
    """Find the last exact table without turning an unmapped update into loss.

    Each intermediate question and proposal stays hash-bound to its own target.
    The returned table supplies geometry candidates only, never correspondence
    or a current behavioral conclusion.
    """
    root = root.resolve()
    path, document = previous_path.resolve(), previous
    visited, inputs, chain = set(), [], []
    selector = previous["leads"][question]["selector"]

    def verified(reference):
        candidate = (root / reference["path"]).resolve()
        if not candidate.is_relative_to(root):
            raise ValueError("Retained question input leaves the project")
        if file_sha256(candidate) != reference["sha256"]:
            raise ValueError("Retained question input hash differs: " + reference["path"])
        return candidate, json.loads(candidate.read_text())

    while True:
        if path in visited:
            raise ValueError("Retained question predecessor cycle")
        visited.add(path)
        if not path.is_relative_to(root):
            raise ValueError("Retained question predecessor leaves the project")
        inputs.append(path)
        chain.append({"path": path.relative_to(root).as_posix(), "sha256": file_sha256(path)})
        lead = document.get("leads", {}).get(question)
        if (not isinstance(lead, dict) or lead.get("stable_question_id") != question
                or lead.get("selector") != selector):
            raise ValueError("Retained question identity differs in predecessor")
        candidate = lead.get("current_native_candidate", lead.get("native_candidate"))
        if candidate is not None:
            matches = []
            references = {}
            for reference in document.get("inputs", []):
                if reference.get("path", "").endswith("/guarded-proposals.json"):
                    if reference["path"] in references and references[reference["path"]] != reference:
                        raise ValueError("Conflicting retained proposal input commitments")
                    references[reference["path"]] = reference
            for reference in references.values():
                proposal_path, proposals = verified(reference)
                if proposals.get("target") != document.get("target"):
                    continue
                rows = [row for row in proposals["tables"]
                        if row["site"] == candidate["dispatch_site"]]
                if len(rows) != 1 or table_candidate(rows[0]) != candidate:
                    raise ValueError("Retained candidate differs from its exact proposal")
                matches.append((proposal_path, rows[0]))
            if not matches:
                raise ValueError("Retained question needs an exact target proposal input")
            proposal_path, row = matches[0]
            if any(key(other) != key(row) for _, other in matches[1:]):
                raise ValueError("Retained proposal inputs have conflicting guarded geometry")
            receipts = [{"path": path.relative_to(root).as_posix(), "sha256": file_sha256(path)}
                        for path, _ in matches]
            inputs.extend(path for path, _ in matches if path not in inputs)
            baseline = {
                "target": document["target"], "native_candidate": candidate,
                "question_evidence": chain[-1], "predecessor_chain": chain,
                "proposal_input": receipts[0],
                "scope": "Last retained mapped table supplies geometry only; current dependency/behavioral applicability remains pending.",
            }
            if len(receipts) > 1:
                baseline["equivalent_proposal_inputs"] = receipts
            return row, baseline, inputs
        predecessor = document.get("predecessor")
        if predecessor is None:
            return None, {"native_candidate": None, "predecessor_chain": chain,
                          "scope": "No retained mapped table; preserve the question without inventing a geometry baseline."}, inputs
        path, document = verified(predecessor)


def diagnostic_contexts(tables, diagnostics, owner):
    """Body/declared-extent association only; never semantic AS ownership."""
    by_owner, extents = defaultdict(set), defaultdict(set)
    for row in diagnostics["diagnostics"]:
        if not row["custom_game_crate"]:
            continue
        for ref in row["verified_references"]:
            actual = owner(int(ref["instruction_address"], 16))
            if actual is not None:
                by_owner[actual].add(row["path"])
            if ref.get("runtime_function_start") is not None:
                extents[(int(ref["runtime_function_start"], 16), int(ref["runtime_function_end"], 16))].add(row["path"])
    contexts = {}
    for row in tables:
        site = int(row["site"], 16)
        actual = owner(site)
        extent_paths = {name for (start, end), names in extents.items() if start <= site < end for name in names}
        contexts[row["site"]] = {
            "site": row["site"], "table_address": row["table_address"],
            "native_owner": hex(actual) if actual is not None else None,
            "as_owner_diagnostic_contexts": sorted(by_owner[actual]) if actual is not None else [],
            "as_declared_extent_contexts": sorted(extent_paths),
        }
    return contexts


def as_context(context):
    return bool(context["as_owner_diagnostic_contexts"] or context["as_declared_extent_contexts"])


def reconcile_context_tables(current, current_contexts, applied, previous, previous_contexts, previous_applied):
    """Complete context-table populations, separate from fourteen stable questions."""
    def population(tables, contexts, applied_tables):
        admitted = {row["site"]: row for row in applied_tables}
        return {row["site"]: {
            "native_candidate": table_candidate(row), "location": contexts[row["site"]],
            "table_selector": ["tables", index],
            "geometry_sha256": file_sha256_bytes(key(row).encode()),
            "applied": row["site"] in admitted and admitted[row["site"]]["case_targets"] == row["case_targets"],
        } for index, row in enumerate(tables) if as_context(contexts[row["site"]])}

    current_population = population(current, current_contexts, applied)
    previous_population = population(previous, previous_contexts, previous_applied)
    previous_all_by_geometry, previous_as_by_geometry = defaultdict(list), defaultdict(list)
    for row in previous:
        previous_all_by_geometry[key(row)].append(row["site"])
        if row["site"] in previous_population:
            previous_as_by_geometry[key(row)].append(row["site"])
    matched_previous = set()
    for row in current:
        if row["site"] not in current_population:
            continue
        record = current_population[row["site"]]
        record["predecessor_AS_context_geometry_candidates"] = previous_as_by_geometry[key(row)]
        record["predecessor_all_proposed_geometry_candidates"] = previous_all_by_geometry[key(row)]
        matched_previous.update(record["predecessor_AS_context_geometry_candidates"])
    unmatched_previous = sorted(previous_population.keys() - matched_previous, key=lambda value: int(value, 16))
    counts = {
        "current_AS_context_tables": len(current_population),
        "current_applied_AS_context_tables": sum(row["applied"] for row in current_population.values()),
        "current_proposal_only_AS_context_tables": sum(not row["applied"] for row in current_population.values()),
        "predecessor_AS_context_tables": len(previous_population),
        "predecessor_applied_AS_context_tables": sum(row["applied"] for row in previous_population.values()),
        "current_unique_predecessor_AS_geometry_candidate": sum(len(row["predecessor_AS_context_geometry_candidates"]) == 1 for row in current_population.values()),
        "current_ambiguous_predecessor_AS_geometry_candidates": sum(len(row["predecessor_AS_context_geometry_candidates"]) > 1 for row in current_population.values()),
        "current_without_predecessor_AS_geometry_candidate": sum(not row["predecessor_AS_context_geometry_candidates"] for row in current_population.values()),
        "current_without_any_predecessor_proposed_geometry_candidate": sum(not row["predecessor_all_proposed_geometry_candidates"] for row in current_population.values()),
        "predecessor_AS_tables_without_current_AS_geometry_candidate": len(unmatched_previous),
        "new_semantics_or_behavioral_equivalence_inferred": 0,
    }
    return {"counts": counts, "current_AS_context_tables": current_population,
            "predecessor_AS_context_tables": previous_population,
            "predecessor_AS_tables_without_current_AS_geometry_candidate": unmatched_previous,
            "method": "Compare complete guard kind/register/bound/domain, guard-to-dispatch distance and every dispatch-relative successor for all AS diagnostic body/extent-context tables, including applied tables. Search both predecessor AS-context and entire retained proposed populations.",
            "limits": "Context is not semantic ownership. Equal geometry supplies correspondence candidates only; missing/ambiguous geometry does not prove new behavior, removed implementation or lost recovery. Historical original table bytes retain their prior proof; only current table bytes are re-read from the installed EXE."}


def predecessor_input(root, previous, supplied, role):
    """Bind an explicitly supplied original or relocated predecessor receipt.

    This producer's ordered input contract starts with census, applied summary,
    then proposed summary. Preserve those recorded roles and paths. A relocated
    input must match exactly one recorded commitment, at the requested role;
    matching a different document's bytes or a second copy is not sufficient.
    Never search for aliases or fall back from a changed recorded input path.
    """
    positions = {"census_summary": 0, "applied_summary": 1, "proposed_summary": 2}
    if role not in positions:
        raise ValueError("Unsupported predecessor input role")
    root = root.resolve()
    requested = Path(os.path.abspath(root / supplied))
    path = requested.resolve()
    if not requested.is_relative_to(root) or not path.is_relative_to(root):
        raise ValueError("Predecessor input leaves the project")
    requested_relative = requested.relative_to(root).as_posix()
    raw = path.read_bytes()
    checksum = file_sha256_bytes(raw)
    records = previous.get("inputs", [])
    position = positions[role]
    if not isinstance(records, list) or len(records) <= position:
        raise ValueError("Missing recorded predecessor input role")
    if any(not isinstance(row, dict) or not isinstance(row.get("path"), str)
           or re.fullmatch(r"[0-9a-f]{64}", str(row.get("sha256", ""))) is None for row in records):
        raise ValueError("Invalid recorded predecessor input commitment")
    recorded = records[position]
    # A caller naming the original path must get that exact receipt. Do not
    # reinterpret changed bytes as a relocated copy of another recorded input.
    path_matches = [row for row in records if row.get("path") == requested_relative]
    if path_matches and (len(path_matches) != 1 or path_matches[0]["sha256"] != checksum):
        raise ValueError("Recorded predecessor input bytes differ: " + requested_relative)
    matches = [(index, row) for index, row in enumerate(records) if row.get("sha256") == checksum]
    if len(matches) != 1:
        raise ValueError("Predecessor input needs one unique recorded digest")
    if matches[0][0] != position:
        raise ValueError("Predecessor input digest belongs to a different recorded role")
    document = json.loads(raw)
    if not isinstance(document, dict):
        raise ValueError("Predecessor input payload differs from the recorded role")
    if document.get("target") != previous["target"]:
        raise ValueError("Predecessor input target differs")
    if role == "census_summary":
        valid = all(isinstance(document.get(key), dict)
                    for key in ("artifacts", "guarded_table_input", "independent_instructions"))
    else:
        valid = (isinstance(document.get("inventory"), dict)
                 and re.fullmatch(r"[0-9a-f]{64}", str(document.get("census_summary_sha256", ""))) is not None)
    if not valid:
        raise ValueError("Predecessor input payload differs from the recorded role")
    resolved = {"path": path.relative_to(root).as_posix(), "sha256": checksum}
    witness = {
        "role": role, "recorded_input_index": position,
        # These describe immutable historical provenance, not a live input
        # commitment at a path whose bytes may now differ. The current producer
        # commits resolved_input independently in its ordinary inputs list.
        "recorded_input_path": recorded["path"], "recorded_input_sha256": recorded["sha256"],
        "explicit_supplied_path": requested_relative, "resolved_input": resolved,
        "relocated": requested_relative != recorded["path"] or resolved["path"] != recorded["path"],
        "verification": "Unique exact full-byte digest at the same recorded input role; no implicit alias search or historical commitment rewrite.",
    }
    return path, document, witness


def predecessor_proposal_input(root, previous):
    """Use the producer's proposed-summary role, never its first applied payload."""
    records = previous.get("inputs", [])
    if len(records) < 3:
        raise ValueError("Missing recorded predecessor proposed-summary role")
    summary_path, summary, _ = predecessor_input(root, previous, records[2]["path"], "proposed_summary")
    reference = summary["inventory"]
    matches = [row for row in records if row.get("path") == reference.get("path")]
    if len(matches) != 1 or matches[0] != reference:
        raise ValueError("Predecessor proposed inventory differs from its recorded input")
    path = (root / reference["path"]).resolve()
    if not path.is_relative_to(root.resolve()):
        raise ValueError("Predecessor proposed inventory leaves the project")
    if file_sha256(path) != reference["sha256"]:
        raise ValueError("Predecessor proposed inventory hash differs")
    proposals = json.loads(path.read_text())
    if proposals.get("target") != previous["target"]:
        raise ValueError("Predecessor proposed inventory target differs")
    return path, proposals, summary_path


def verify_applied_input(census, applied_summary):
    """The applied proof must be the census's frozen bytes, not a new proposal."""
    if applied_summary["target"] != census["target"]:
        raise ValueError("Applied summary target differs from the census")
    frozen = census["guarded_table_input"]
    declared = applied_summary["inventory"]
    if declared["sha256"] != frozen["sha256"]:
        raise ValueError("Applied inventory is not the census's frozen guarded-table input")
    applied_path = project_path(declared["path"])
    frozen_path = project_path(frozen["path"])
    if (file_sha256(applied_path) != declared["sha256"]
            or file_sha256(frozen_path) != frozen["sha256"]
            or applied_path.read_bytes() != frozen_path.read_bytes()):
        raise ValueError("Applied inventory bytes differ from the census's frozen guarded-table input")
    return applied_path, frozen_path


def replace_documents(documents):
    """Prepare every document before replacement and roll back ordinary failures."""
    prepared, backups, replaced = {}, {}, []
    preserve_backups = False
    try:
        for path, data in documents.items():
            path.parent.mkdir(parents=True, exist_ok=True)
            descriptor, name = tempfile.mkstemp(prefix="." + path.name + ".frontier-", dir=path.parent)
            temporary = Path(name)
            prepared[path] = temporary
            with os.fdopen(descriptor, "wb") as stream:
                stream.write(data)
                stream.flush()
                os.fsync(stream.fileno())
            if path.exists() or path.is_symlink():
                backup = path.with_name("." + path.name + ".frontier-backup-" + uuid.uuid4().hex)
                if path.is_symlink():
                    backup.symlink_to(os.readlink(path))
                else:
                    os.link(path, backup)
                backups[path] = backup
            else:
                backups[path] = None
        for path, temporary in prepared.items():
            os.replace(temporary, path)
            replaced.append(path)
    except BaseException:
        try:
            for path in reversed(replaced):
                backup = backups[path]
                if backup is None:
                    path.unlink()
                else:
                    os.replace(backup, path)
        except BaseException:
            preserve_backups = True
            raise
        raise
    finally:
        for temporary in prepared.values():
            temporary.unlink(missing_ok=True)
        for backup in backups.values():
            if backup is not None and not preserve_backups:
                backup.unlink(missing_ok=True)


def publish_results(root, full, compact, correspondence, commitments, publish):
    """Keep immutable full proofs and change compact documents only after validation."""
    for binding in commitments:
        assert file_sha256(root / binding["path"]) == binding["sha256"]
    # The graph reader validates this witness's producer inputs independently.
    # Keep the original input_commitments field while exposing the same exact
    # commitments through the reader's ordinary proof-input contract.
    full = dict(full, inputs=deepcopy(commitments))
    full_bytes = json_text(full).encode()
    store = SharedAnalysis(root)
    checksum = file_sha256_bytes(full_bytes)
    full_reference = {"path": store.object_path(checksum).relative_to(root).as_posix(), "sha256": checksum}
    compact = dict(compact, inputs=[full_reference] + commitments)
    correspondence = deepcopy(correspondence)
    if "complete_AS_context_reconciliation" in full:
        context_proof = {"counts": full["complete_AS_context_reconciliation"]["counts"],
                         "evidence": full_reference, "selector": ["complete_AS_context_reconciliation"]}
        compact["complete_AS_context_reconciliation"] = context_proof
        correspondence["complete_AS_context_reconciliation"] = deepcopy(context_proof)
    for lead in correspondence.get("leads", {}).values():
        if not isinstance(lead, dict) or lead.get("current_native_candidate") is None:
            continue
        site = lead["current_native_candidate"]["dispatch_site"]
        witness = full.get("correspondence_candidates", {}).get(site)
        if (not isinstance(witness, dict)
                or witness.get("native_candidate") != lead["current_native_candidate"]
                or witness.get("location") != lead.get("current_native_location")):
            raise ValueError("Correspondence candidate/location differs from the immutable witness")
        lead["current_candidate_proof"] = {
            "evidence": full_reference,
            "selector": ["correspondence_candidates", site, "native_candidate"],
            "location_selector": ["correspondence_candidates", site, "location"],
        }
    directory = root / (f"docs/analysis/evidence/{full['target']['version']}" if publish else
                        f"runtime/coverage/{full['target']['sha256']}/native-final")
    names = ("native-switch-proposal-review.json", "computed-correspondence-frontier.json") if publish else (
        "switch-review-compact.json", "computed-correspondence-frontier.json")
    documents = {directory / names[0]: json_text(compact).encode(),
                 directory / names[1]: json_text(correspondence).encode()}
    for binding in commitments:
        assert file_sha256(root / binding["path"]) == binding["sha256"]
    receipt = store.put_bytes(full_bytes, kind="native-switch-frontier-review", provenance={
        "target_sha256": full["target"]["sha256"], "generator": full["generator"],
        "input_commitments": commitments})
    assert receipt["path"] == full_reference["path"] and receipt["sha256"] == checksum
    replace_documents(documents)
    return compact


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--census-summary", required=True)
    parser.add_argument("--applied-summary", required=True)
    parser.add_argument("--proposed-summary", required=True)
    parser.add_argument("--predecessor", default="docs/analysis/evidence/0.120.4/computed-correspondence-frontier.json")
    parser.add_argument("--predecessor-census-summary", help="verified historical census for complete context-table correspondence")
    parser.add_argument("--predecessor-applied-summary", help="that historical census's frozen guarded-table input summary")
    parser.add_argument("--publish", action="store_true", help="publish only the two reviewed compact evidence files")
    args = parser.parse_args()
    if bool(args.predecessor_census_summary) != bool(args.predecessor_applied_summary):
        parser.error("complete context reconciliation needs both predecessor census and applied summaries")
    census_path, applied_summary_path, proposed_summary_path, previous_path = [
        project_path(value) for value in (args.census_summary, args.applied_summary, args.proposed_summary, args.predecessor)]
    census, applied_summary, proposed_summary, previous = [json.loads(path.read_text()) for path in (
        census_path, applied_summary_path, proposed_summary_path, previous_path)]
    registered = latest_target(verify=True)
    target = {key: registered[key] for key in ("version", "path", "sha256", "size_bytes")}
    assert census["target"] == target and census["independent_instructions"]["exact_source_bytes_verified"]
    applied_path, frozen_applied_path = verify_applied_input(census, applied_summary)
    helper = load_helper("proposal_census", ROOT / "scripts/summarize-native-image.py")
    image = target_bytes(target)
    pe = load_helper("proposal_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    base = ROOT / "runtime/coverage" / target["sha256"]
    directory = project_path(census["artifacts"]["directory"])
    proposed_path = project_path(proposed_summary["inventory"]["path"])
    assert file_sha256(proposed_path) == proposed_summary["inventory"]["sha256"]
    applied, proposed = [json.loads(path.read_text()) for path in (applied_path, proposed_path)]
    assert applied["target"] == proposed["target"] == census["target"]
    assert proposed["census_summary_sha256"] == file_sha256(census_path)
    previous_proposal_path, previous_proposals, previous_proposed_summary_path = predecessor_proposal_input(ROOT, previous)
    inputs = [census_path, applied_summary_path, proposed_summary_path, applied_path, frozen_applied_path, proposed_path,
              directory / "instructions.tsv.gz", directory / "bodies.tsv.gz", base / "diagnostic-ownership.json",
              ROOT / "scripts/summarize-native-image.py", ROOT / "scripts/inventory-executable.py",
              ROOT / "scripts/coverage_common.py", ROOT / "scripts/shared_analysis.py",
              previous_path, previous_proposal_path, previous_proposed_summary_path, Path(__file__)]
    historical_proofs = {}
    for lead in previous["leads"].values():
        ref = lead["historical_classification"]["classification_evidence"]
        historical_proofs[ref["path"]] = ref["sha256"]
    for path, checksum in historical_proofs.items():
        proof = project_path(path)
        assert file_sha256(proof) == checksum
        inputs.append(proof)
    geometry_baselines = {}
    for name in previous["leads"]:
        row, baseline, baseline_inputs = retained_question_geometry(ROOT, previous_path, previous, name)
        geometry_baselines[name] = (row, baseline)
        inputs.extend(path for path in baseline_inputs if path not in inputs)
    previous_contexts, previous_applied = None, None
    predecessor_input_resolutions = []
    if args.predecessor_census_summary:
        # Bind the selected census to the retained predecessor's original input,
        # including explicitly supplied exact relocated receipts. The role,
        # original path and resolved commitment stay separate in current proof.
        previous_census_path, previous_census, census_resolution = predecessor_input(
            ROOT, previous, args.predecessor_census_summary, "census_summary")
        previous_applied_summary_path, previous_applied_summary, applied_resolution = predecessor_input(
            ROOT, previous, args.predecessor_applied_summary, "applied_summary")
        predecessor_input_resolutions = [census_resolution, applied_resolution]
        previous_inputs = {row["path"]: row["sha256"] for row in previous["inputs"]}
        assert previous_census["target"] == previous["target"]
        assert previous_census["independent_instructions"]["exact_source_bytes_verified"]
        previous_applied_path, previous_frozen_path = verify_applied_input(previous_census, previous_applied_summary)
        previous_applied = json.loads(previous_applied_path.read_text())
        previous_directory = project_path(previous_census["artifacts"]["directory"])
        previous_bodies = previous_directory / "bodies.tsv.gz"
        assert file_sha256(previous_bodies) == previous_census["artifacts"]["files"]["bodies.tsv.gz"]["sha256"]
        previous_diagnostics_path = ROOT / "runtime/coverage" / previous["target"]["sha256"] / "diagnostic-ownership.json"
        assert previous_inputs.get(previous_diagnostics_path.relative_to(ROOT).as_posix()) == file_sha256(previous_diagnostics_path)
        previous_diagnostics = json.loads(previous_diagnostics_path.read_text())
        assert previous_diagnostics["target"] == previous["target"]
        previous_owner = helper.owner_lookup([(int(r["start"], 16), int(r["end"], 16), int(r["entry"], 16))
                                             for r in helper.rows(previous_bodies) if r["external"] == "false"])
        previous_contexts = diagnostic_contexts(previous_proposals["tables"], previous_diagnostics, previous_owner)
        inputs.extend((previous_census_path, previous_applied_summary_path, previous_applied_path,
                       previous_frozen_path, previous_bodies, previous_diagnostics_path))
    commitments = [{"path": p.relative_to(ROOT).as_posix(), "sha256": file_sha256(p)} for p in inputs]
    for resolution in predecessor_input_resolutions:
        resolved = resolution["resolved_input"]
        if resolved not in commitments:
            raise ValueError("Resolved predecessor input changed before commitment")
    for name in ("instructions.tsv.gz", "bodies.tsv.gz"):
        assert file_sha256(directory / name) == census["artifacts"]["files"][name]["sha256"]
    print("verified current census, immutable proposal inputs and predecessor", flush=True)
    owner = helper.owner_lookup([(int(r["start"], 16), int(r["end"], 16), int(r["entry"], 16))
                                 for r in helper.rows(directory / "bodies.tsv.gz") if r["external"] == "false"])
    diagnostics = json.loads((base / "diagnostic-ownership.json").read_text())
    assert diagnostics["target"] == target
    a = {r["site"]: r for r in applied["tables"]}
    p = {r["site"]: r for r in proposed["tables"]}
    added = {site for site in p if site not in a}
    changed = {site for site in a.keys() & p.keys() if a[site]["case_targets"] != p[site]["case_targets"]}
    removed = a.keys() - p.keys()
    contexts = diagnostic_contexts(proposed["tables"], diagnostics, owner)
    for row in proposed["tables"]:
        offset = pe.rva_offset(int(row["table_address"], 16) - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16)
        assert file_sha256_bytes(raw) == row["sha256"]
        assert len(raw) == len(row["case_targets"]) * 4
        assert [hex(int(row["relative_base"], 16) + n[0]) for n in struct.iter_unpack("<i", raw)] == row["case_targets"]
    frontier = added | changed
    targets = sorted({int(value, 16) for site in frontier for value in p[site]["case_targets"]})
    sites = {int(site, 16) for site in frontier}
    exact, interior, exact_sites = set(), set(), set()
    for index, row in enumerate(helper.rows(directory / "instructions.tsv.gz"), 1):
        start = int(row["address"], 16)
        end = start + int(row["length"])
        if start in sites:
            exact_sites.add(start)
        cursor = bisect.bisect_left(targets, start)
        while cursor < len(targets) and targets[cursor] < end:
            (exact if targets[cursor] == start else interior).add(targets[cursor])
            cursor += 1
        if index % 5000000 == 0:
            print(f"checked {index:,} exported instruction boundaries", flush=True)
    records = []
    for site in sorted(frontier, key=lambda value: int(value, 16)):
        row = p[site]
        records.append({**contexts[site], "delta_kind": "added" if site in added else "changed_case_vector",
                        "case_targets": row["case_targets"],
                        "site_exact_exported_instruction": int(site, 16) in exact_sites,
                        "all_targets_exact_instructions": all(int(value, 16) in exact for value in row["case_targets"])})
    counts = {"applied_tables": len(a), "proposed_tables": len(p), "added_tables": len(added),
              "changed_case_vectors": len(changed), "removed_proposals": len(removed),
              "distinct_proposed_target_addresses": len(targets), "exact_target_starts": len(exact),
              "targets_in_instruction_interiors": len(interior),
              "undecoded_targets": len(targets) - len(exact) - len(interior),
              "tables_with_as_owner_context": sum(bool(r["as_owner_diagnostic_contexts"]) for r in records),
              "tables_with_as_extent_context": sum(bool(r["as_declared_extent_contexts"]) for r in records),
              "proposal_sites_not_exact_exported_instructions": len(sites - exact_sites)}
    limits = ["Diagnostic/body/extent association is supporting context, not semantic AS ownership.",
              "Proposed edges are not applied census edges; current table geometry/bytes do not transfer semantic, source, runtime or parity proof."]
    full = {"schema_version": 1, "target": target,
            "generator": {"path": Path(__file__).relative_to(ROOT).as_posix(), "sha256": file_sha256(Path(__file__))},
            "input_commitments": commitments, "counts": counts,
            "changed_case_vector_sites": sorted(changed), "removed_proposal_sites": sorted(removed),
            "records": records, "limits": limits}
    if predecessor_input_resolutions:
        full["predecessor_input_resolutions"] = predecessor_input_resolutions
    as_context = [row for row in records if row["as_owner_diagnostic_contexts"] or row["as_declared_extent_contexts"]]
    compact = {"schema_version": 1, "target": target, "gap_ids": [41], "counts": counts,
               "generator": full["generator"],
               "changed_case_vector_sites": sorted(changed), "removed_proposal_sites": sorted(removed),
               "as_context_records": [{k: v for k, v in row.items() if k != "case_targets"} for row in as_context],
               "source_semantics_complete": False, "source_ownership_established": False,
               "parity_verified": False, "limits": limits}
    if predecessor_input_resolutions:
        compact["predecessor_input_resolutions"] = deepcopy(predecessor_input_resolutions)
    candidate_population = {site: row for site, row in p.items() if contexts[site]["as_owner_diagnostic_contexts"]
                            or contexts[site]["as_declared_extent_contexts"]}
    # A retained question can match an already-applied table outside the new
    # proposal frontier. Preserve an exact candidate/location witness for the
    # whole current AS-context population, not just added/changed proposals.
    full["correspondence_candidates"] = {
        site: {"native_candidate": table_candidate(row), "location": contexts[site]}
        for site, row in candidate_population.items()
    }
    if previous_contexts is not None:
        full["complete_AS_context_reconciliation"] = reconcile_context_tables(
            proposed["tables"], contexts, applied["tables"], previous_proposals["tables"],
            previous_contexts, previous_applied["tables"])
    leads, matched = {}, set()
    for name, old in previous["leads"].items():
        old_row, baseline = geometry_baselines[name]
        matches = ([site for site, row in candidate_population.items() if key(row) == key(old_row)]
                   if old_row is not None else [])
        record = {k: deepcopy(old[k]) for k in ("stable_question_id", "selector", "finding_ids", "historical_classification")}
        record.update(predecessor_selector=old["selector"], historical_native_candidate=old["current_native_candidate"],
                      historical_target=previous["target"],
                      retained_geometry_baseline=baseline,
                      candidate_matches_within_complete_current_AS_context_population=len(matches),
                      semantic_recovery_reset=False, source_implementation_reset=False,
                      current_source_receipts=[{"path": r["path"], "sha256": file_sha256(project_path(r["path"]))}
                                               for r in old["current_source_receipts"]],
                      current_native_location=None,
                      applicability="pending_current_producer_dependency_consumer_contract_revalidation",
                      next_static_step=old["next_static_step"])
        if len(matches) == 1:
            site = matches[0]
            row = p[site]
            matched.add(site)
            record.update(current_native_candidate=table_candidate(row), current_native_location=contexts[site],
                current_table_selector=["tables", proposed["tables"].index(row)],
                current_table_applied=site in a and site not in changed,
                guard_kind_register_bound_and_dispatch_relative_case_vector_equal=True,
                normalization=geometry(row), normalization_sha256=file_sha256_bytes(key(row).encode()))
        else:
            record.update(current_native_candidate=None,
                          guard_kind_register_bound_and_dispatch_relative_case_vector_equal=False,
                          applicability="pending_unmapped_or_ambiguous_current_geometry_candidate",
                          next_static_step="Map the retained guard/selector and required producer/consumer range into the current target without resetting recovered semantics or source.")
        leads[name] = record
    mapped = [r["current_native_candidate"]["dispatch_site"] for r in leads.values()
              if r["candidate_matches_within_complete_current_AS_context_population"] == 1]
    assert len(mapped) == len(set(mapped)), "Historical questions collide on one current table; bounded correspondence needs review"
    unpaired = [row for row in as_context if row["site"] not in matched]
    correspondence = {"schema_version": 1, "target": target,
        "predecessor": {"path": previous_path.relative_to(ROOT).as_posix(), "sha256": file_sha256(previous_path)},
        "generator": full["generator"],
        "inputs": commitments,
        "method": "Match every retained question against all current AS-context proposals using complete guard kind/register/bound/domain, guard-to-dispatch distance and full dispatch-relative successor vector; verify every current proposed table against exact PE bytes.",
        "leads": leads, "unpaired_AS_context_frontier_candidates": unpaired,
        "counts": {"retained_questions": len(leads), "unique_current_geometry_candidates": sum(
            r["candidate_matches_within_complete_current_AS_context_population"] == 1 for r in leads.values()),
            "complete_current_AS_context_population": len(candidate_population),
            "unmapped_current_AS_context_proposals": len(unpaired), "new_semantics_inferred_from_geometry": 0},
        "semantic_or_source_implementation_reset": False,
        "current_native_behavioral_equivalence_established": False, "parity_verified": False,
        "limits": limits + ["Retained classifications and source repairs preserve their actual target; current input/state/dependency/consumer applicability remains separate from geometry correspondence."]}
    if predecessor_input_resolutions:
        correspondence["predecessor_input_resolutions"] = deepcopy(predecessor_input_resolutions)
    publish_results(ROOT, full, compact, correspondence, commitments, args.publish)
    print(json_text({"counts": counts, "correspondence_counts": correspondence["counts"],
                     "complete_AS_context_reconciliation_counts": full.get("complete_AS_context_reconciliation", {}).get("counts"),
                     "unpaired_AS_context_frontier_candidates": unpaired}), flush=True)


def file_sha256_bytes(raw):
    import hashlib
    return hashlib.sha256(raw).hexdigest()


if __name__ == "__main__":
    main()
