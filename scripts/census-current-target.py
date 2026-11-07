#!/usr/bin/env python3
"""Resume a bounded Ghidra instruction/reference census of the latest target.

Default is read-only progress. --prepare-selection writes a bounded plan without
starting Ghidra. --run explicitly performs static REA/Ghidra work;
--limit bounds the number of discovered procedures processed in this pass.
--sample verifies the pipeline on the first supplied .pdata extent as a raw
slice; it never counts as analysis of the entire PE. The full-image queue uses
the complete discovered procedure list for its precisely recorded analysis
profile. Pending/failed functions, undiscovered .pdata candidates and unknown
indirect edges remain explicit, even after all queued operations succeed.
"""

import argparse
from collections import Counter
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import sys

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_path, artifact_path, target_bytes
from runtime_layout import owned_runtime_path

# Matches the project's documented bounded PE analysis profile. All exclusions
# remain part of the recorded profile and limit discovery/reference completeness.
DISABLED = ("Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,"
            "Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls")
OPERATIONS = ("read_function_instructions", "procedure_references", "procedure_info")
PROFILES = ("full-image-bounded-analysis", "sample-first-unwind-extent")
FULL_PROFILES = {
    PROFILES[0]: DISABLED,
    "full-image-no-address-tables": DISABLED + ",Create Address Tables",
    "full-image-entry-decoding": ",".join(name for name in DISABLED.split(",")
                                          if name != "Disassemble Entry Points") + ",Create Address Tables",
}
# Keep the resource-expanded retry separate from the failed 2 GiB/600 s run.
FULL_PROFILES["full-image-entry-decoding-extended"] = FULL_PROFILES["full-image-entry-decoding"]
SELECTED_PROFILE = "full-image-diagnostic-owner-repaired"
# The default calling-convention pass decompiles unrelated PE functions even
# when only selected entries were decoded. This queue observes bodies/refs;
# calling conventions remain explicitly outside its recovery scope.
FULL_PROFILES[SELECTED_PROFILE] = FULL_PROFILES["full-image-no-address-tables"] + ",Call Convention ID"
PROFILES += tuple(profile for profile in FULL_PROFILES if profile not in PROFILES)


def configuration(sample, full_profile, startup_timeout, inherited):
    """Select an isolated store and record the effective child configuration."""
    if full_profile not in FULL_PROFILES:
        raise ValueError("Unknown full-image census profile")
    if sample and full_profile != PROFILES[0]:
        raise ValueError("A full-image profile cannot be combined with --sample")
    environment = dict(inherited)
    environment.pop("REA_GHIDRA_SEED_FILE", None)
    environment.pop("REA_GHIDRA_DISABLED_ANALYZERS", None)
    profile = PROFILES[1] if sample else full_profile
    if not sample:
        environment["REA_GHIDRA_DISABLED_ANALYZERS"] = FULL_PROFILES[profile]
    environment["REA_GHIDRA_STARTUP_TIMEOUT_MS"] = str(int(startup_timeout * 1000))
    environment["GHIDRA_HEADLESS_MAXMEM"] = (environment.get("GHIDRA_HEADLESS_MAXMEM")
                                            or environment.get("GHIDRA_MAXMEM")
                                            or ("6G" if profile == "full-image-entry-decoding-extended" else "2G"))
    return profile, environment


def validate_resume(state, target, profile, unwind_sha, environment):
    """Never resume another target or silently change a stored analyzer profile."""
    if state.get("profile") != profile or any(
        state.get("target", {}).get(key) != target[key]
        for key in ("version", "path", "sha256", "size_bytes")
    ):
        raise ValueError("Census state does not match selected target/profile")
    if state.get("unwind_directory_sha256", unwind_sha) != unwind_sha:
        raise ValueError("Census state does not match selected PE unwind records")
    old_environment = state.get("analysis_environment")
    if old_environment is not None and old_environment.get("REA_GHIDRA_DISABLED_ANALYZERS") != environment.get("REA_GHIDRA_DISABLED_ANALYZERS"):
        raise ValueError("Stored analyzer exclusions differ; use a separate census profile")
    if old_environment is not None and old_environment.get("GHIDRA_HEADLESS_MAXMEM") != environment.get("GHIDRA_HEADLESS_MAXMEM"):
        raise ValueError("Stored heap limit differs; use a separate census profile to preserve resource-attempt evidence")


def progress_report(target, root, sample_only=False):
    """Read the actual per-profile stores without starting a provider.

    A completed raw-slice sample must remain visible without being mistaken for
    a whole-image run. Never consume a saved profile from another target.
    """
    profiles = {}
    for profile in PROFILES:
        if sample_only and profile != PROFILES[1]:
            continue
        path = root / "ghidra" / profile / "progress.json"
        if path.exists():
            state = load_json(path)
            if state.get("profile") != profile or any(
                state.get("target", {}).get(key) != target[key]
                for key in ("version", "path", "sha256", "size_bytes")
            ):
                raise ValueError(f"Saved census identity/profile mismatch: {path}")
            profiles[profile] = state
        else:
            profiles[profile] = {"status": "not_run", "whole_image_input": profile != PROFILES[1]}
    return {"target": {key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
            "profiles": profiles, "all_image_native_semantics_and_edges_complete": False}


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    pending = path.with_suffix(path.suffix + ".pending")
    pending.write_text(json_text(value), encoding="utf-8")
    pending.replace(path)


def batch_module():
    spec = importlib.util.spec_from_file_location("project_rea_batch", ROOT / "scripts/rea-batch.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    if not set(OPERATIONS).issubset(module.STATIC_TOOLS):
        raise ValueError("REA static-operation allowlist lacks census operations")
    return module


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


# Require an explicit review when the number of custom diagnostic paths increases.
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


def selected_owner_addresses(selected):
    return sorted({row["reference"]["runtime_function_start"] for row in selected}, key=lambda address: int(address, 16))


def selected_seeds(addresses):
    return "".join(f"{address}\tfunction\n{address}\tcode\n" for address in addresses)


def bounded_plan(target, selected, output, disabled):
    addresses = selected_owner_addresses(selected)
    seeds = selected_seeds(addresses)
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


def prepare_selection(target, root, requested_output):
    source = root / "diagnostic-ownership.json"
    source_bytes = source.read_bytes()
    source_sha = hashlib.sha256(source_bytes).hexdigest()
    summary_path = ROOT / "docs/analysis/coverage/diagnostic-ownership.json"
    validate_ownership_summary(load_json(summary_path), target, source.relative_to(ROOT).as_posix(), source_sha)
    selected = select_owners(json.loads(source_bytes), target)
    validate_owner_bytes(selected, target_bytes(target))
    output = project_path(requested_output) if requested_output else root / "ghidra/diagnostic-owner-decoding-plan"
    output = owned_runtime_path(output)
    seeds, plan = bounded_plan(target, selected, output, FULL_PROFILES["full-image-no-address-tables"])
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


def selected_diagnostic_queue(target, root, directory, image, environment):
    """Reproduce the complete diagnostic selection and commit the tool repair.

    The selected queue is caller asserted, never a discovery inventory. Decode
    in the original PE so original global/import addresses remain available;
    disabled analyzers and unseeded bodies still limit reference completeness.
    """
    source = root / "diagnostic-ownership.json"
    digest = file_sha256(source)
    validate_ownership_summary(load_json(ROOT / "docs/analysis/coverage/diagnostic-ownership.json"),
                                       target, source.relative_to(ROOT).as_posix(), digest)
    selected = select_owners(load_json(source), target)
    validate_owner_bytes(selected, image)
    addresses = selected_owner_addresses(selected)
    seeds = selected_seeds(addresses)
    path = directory / "seeds.tsv"
    if path.exists() and path.read_text() != seeds:
        raise ValueError("Stored diagnostic seed selection changed; preserve the earlier census")
    repair_spec = importlib.util.spec_from_file_location("census_seed_repair", ROOT / "scripts/repair-rea-seeded-bodies.py")
    repair = importlib.util.module_from_spec(repair_spec)
    repair_spec.loader.exec_module(repair)
    tooling = repair.changes(ROOT / "node_modules/rea-agents")
    if any(changed for _, _, changed in tooling):
        raise ValueError("Apply scripts/repair-rea-seeded-bodies.py --apply before the repaired census")
    path.write_text(seeds, encoding="utf-8")
    environment["REA_GHIDRA_SEED_FILE"] = str(path)
    commitment = dict(seed_sha256=file_sha256(path), format=repair.FORMAT,
                      diagnostic_inventory_sha256=digest,
                      tooling={p.relative_to(ROOT).as_posix(): hashlib.sha256(data).hexdigest() for p, data, _ in tooling},
                      mappings=selected, native_source_semantics_established=False)
    return [dict(address=address, status="pending") for address in addresses], commitment


def evidence(result, expected_sha):
    record = result.get("structuredContent")
    if not isinstance(record, dict):
        raise ValueError("REA did not return structured Evidence")
    if record.get("provider", {}).get("id") != "ghidra":
        raise ValueError("Native census requires the Ghidra provider")
    if record.get("subject", {}).get("digest", {}).get("sha256") != expected_sha:
        raise ValueError("Native Evidence target digest differs from selected input")
    return record


def retained_transport_evidence(result, operation):
    """Recognize only a completed operation rejected by MCP response admission."""
    if not result.get("isError"):
        return None
    for content in result.get("content", []):
        if content.get("type") != "text":
            continue
        try:
            error = json.loads(content["text"]).get("error", {})
        except (ValueError, TypeError, KeyError):
            continue
        details = error.get("details", {})
        limits = details.get("reported_limits", {})
        reference = limits.get("evidence_reference", {})
        evidence_id = limits.get("evidence_id")
        if (error.get("code") == "resource_constraint" and details.get("resource") == "transport"
                and details.get("operation") == operation and limits.get("boundary") == "mcp-response"
                and isinstance(evidence_id, str) and reference == {
                    "kind": "retained-evidence", "evidence_id": evidence_id}):
            return evidence_id
    return None


def exported_evidence(bundle, evidence_id, operation, expected_sha):
    records = [record for record in bundle.get("records", []) if record.get("evidence_id") == evidence_id]
    if len(records) != 1 or records[0].get("operation") != operation:
        raise ValueError("Export lacks the exact retained native operation Evidence")
    return evidence({"structuredContent": records[0]}, expected_sha)


def validate_native_profile(record, state):
    profile = record.get("analysis_profile", {})
    if not isinstance(profile.get("digest"), str) or not profile["digest"]:
        raise ValueError("Native Evidence lacks an analysis profile digest")
    stored = state.get("analysis_profile")
    if stored and profile["digest"] != stored["digest"]:
        raise ValueError("Provider analysis profile changed during resumable census")
    expected = state.get("analysis_environment", {}).get("REA_GHIDRA_DISABLED_ANALYZERS", "")
    actual = profile.get("parameters", {}).get("analysis_options", {}).get("disabled_analyzers", [])
    if set(actual) != set(expected.split(",") if expected else []):
        raise ValueError("Native Evidence analyzer exclusions differ from requested profile")
    selection = state.get("selection")
    if selection is not None:
        seeds = profile.get("parameters", {}).get("analysis_seeds", {})
        owners = len({row["reference"]["runtime_function_start"] for row in selection["mappings"]})
        if (seeds.get("sha256") != selection["seed_sha256"] or seeds.get("format") != selection["format"]
                or seeds.get("entries") != dict(function=owners, code=owners, label=0)):
            raise ValueError("Native Evidence differs from repaired diagnostic seed commitment")


def native_evidence(client, operation, parameters, timeout, expected_sha, state, label=None):
    """Export a complete retained result on the same live connection, without reanalysis."""
    try:
        result = client.call(operation, parameters, timeout, label)
    except RuntimeError:
        # Client persists its exact response before raising. Ordinary provider
        # failures still fail closed; only a retained MCP transport result can
        # use the export path. No row/byte cap or preview replaces that result.
        failed = load_json(client.output / client.calls[-1]["file"])
        evidence_id = retained_transport_evidence(failed.get("response", {}).get("result", {}), operation)
        if evidence_id is None:
            raise
        path = client.output / f"{client.sequence:03d}-retained-evidence.json"
        client.call("export_evidence_bundle", {"path": str(path)}, timeout)
        bundle = load_json(path)
        record = exported_evidence(bundle, evidence_id, operation, expected_sha)
        state.setdefault("transport_exports", []).append({
            "operation": operation, "evidence_id": evidence_id,
            "path": path.relative_to(ROOT).as_posix(), "sha256": file_sha256(path),
            "record_count": len(bundle["records"]), "complete_retained_record": True,
        })
    else:
        record = evidence(result, expected_sha)
    validate_native_profile(record, state)
    if state.get("analysis_profile") is None:
        state["analysis_profile"] = record["analysis_profile"]
    return record


def retained_procedure_inventory(state, expected_sha):
    """Reuse an exact, digest-checked full export after a queue-parser failure."""
    evidence_id = state.get("procedure_inventory_evidence_id")
    matches = [entry for entry in state.get("transport_exports", [])
               if entry["operation"] == "search_procedures" and entry["evidence_id"] == evidence_id]
    if not matches:
        return None
    entry = matches[-1]
    path = project_path(entry["path"])
    if file_sha256(path) != entry["sha256"]:
        raise ValueError("Retained procedure inventory export digest differs")
    record = exported_evidence(load_json(path), evidence_id, "search_procedures", expected_sha)
    validate_native_profile(record, state)
    return record


def classify_procedures(procedures):
    """Keep imported external-space records separate from native body queries."""
    if not isinstance(procedures, list):
        raise ValueError("Native procedure inventory is not an array")
    rows, external = [], []
    for item in procedures:
        address = item.get("address") or item.get("entrypoint") if isinstance(item, dict) else None
        if isinstance(address, str) and address.startswith("EXTERNAL:0x"):
            int(address.removeprefix("EXTERNAL:"), 16)
            external.append(item)
        else:
            rows.append({"address": address_of(item), "name": item.get("value") or item.get("name"), "status": "pending"})
    rows.sort(key=lambda row: int(row["address"], 16))
    if len({row["address"] for row in rows}) != len(rows):
        raise ValueError("Duplicate native procedure entrypoints in provider inventory")
    return rows, external


def normalized(record):
    return record["normalized_result"]


def address_of(item):
    if not isinstance(item, dict):
        raise ValueError("Unsupported procedure inventory row")
    address = item.get("address") or item.get("entrypoint")
    if not isinstance(address, str) or not address.startswith("0x"):
        raise ValueError(f"Unrecognized native procedure address: {address!r}")
    int(address, 16)
    return address


def summarize(state, rows):
    counts = Counter(row["status"] for row in rows)
    instruction_counts = [row.get("instruction_count") for row in rows if row["status"] == "completed"]
    known_instruction_counts = [count for count in instruction_counts if isinstance(count, int) and count >= 0]
    state["queue"] = {"procedures": len(rows), "completed": counts["completed"], "pending": counts["pending"],
                      "failed": counts["failed"], "in_progress": counts["in_progress"]}
    state["observations"] = {
        "procedures_with_decoded_instructions": sum(count > 0 for count in known_instruction_counts),
        "procedures_queried_without_decoded_instructions": known_instruction_counts.count(0),
        "procedures_with_unknown_instruction_counts": len(instruction_counts) - len(known_instruction_counts),
        "instruction_records": sum(known_instruction_counts),
        "outgoing_reference_edges": sum(row.get("outgoing_reference_count", 0) for row in rows if row["status"] == "completed"),
        "incoming_reference_edges": sum(row.get("incoming_reference_count", 0) for row in rows if row["status"] == "completed"),
        "unresolved_call_sites": sum(row.get("unresolved_call_count", 0) for row in rows if row["status"] == "completed"),
        "decoded_instruction_byte_coverage": None,
        # A one-byte RET is a legitimate body. Size alone cannot label a body
        # a placeholder; retain the observation without that semantic claim.
        "procedures_with_one_byte_bodies": sum(row.get("body_bytes") == 1 for row in rows if row["status"] == "completed"),
        "procedures_with_unknown_body_extents": sum(row.get("body_bytes") is None for row in rows if row["status"] == "completed"),
        "global_reader_writer_classification_complete": False,
    }
    complete = bool(rows) and counts["completed"] == len(rows)
    if state.get("queue_basis") == "caller_selected_diagnostic_owners_not_procedure_discovery":
        state["discovered_queue_operations_complete"] = False
        state["selected_queue_operations_complete"] = complete
    else:
        state["discovered_queue_operations_complete"] = complete
    # A completed discovered queue cannot prove exhaustive discovery, ownership,
    # complete dynamic edges, reconstruction, or original/rebuilt parity.
    state["all_image_native_semantics_and_edges_complete"] = False
    return state


def run(args, target, root):
    inventory_path = root / "inventory.json"
    if not inventory_path.exists():
        raise ValueError("Generate current PE inventory first with inventory-current-target.py --write")
    inventory = load_json(inventory_path)
    if inventory["target"]["sha256"] != target["sha256"]:
        raise ValueError("PE inventory belongs to a different target")
    module_spec = importlib.util.spec_from_file_location("current_pe_census", ROOT / "scripts/inventory-current-target.py")
    current = importlib.util.module_from_spec(module_spec)
    module_spec.loader.exec_module(current)
    pe = current.pe_parser(target_bytes(target))
    declared = pe.functions()
    recorded = inventory["pe"]["runtime_function_records"]["records"]
    if len(declared) != len(recorded) or any(actual != tuple(saved) for actual, saved in zip(declared, recorded)):
        raise ValueError("PE unwind inventory does not match the verified selected image")
    unwind_rva, unwind_size = pe.directories[3]
    unwind_offset = pe.rva_offset(unwind_rva)
    unwind_sha = hashlib.sha256(pe.data[unwind_offset:unwind_offset + unwind_size]).hexdigest()
    profile, environment = configuration(args.sample, args.full_profile, args.startup_timeout, os.environ)
    directory = root / "ghidra" / profile
    directory.mkdir(parents=True, exist_ok=True)
    progress_path, queue_path = directory / "progress.json", directory / "queue.json"
    old = load_json(progress_path) if progress_path.exists() else None
    state = old or {"schema_version": 1,
                    "target": {key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
                    "profile": profile, "input_inventory_sha256": file_sha256(inventory_path),
                    "queue_path": queue_path.relative_to(ROOT).as_posix(),
                    "status": "not_started", "analysis_profile": None,
                    "whole_image_input": not args.sample,
                    "unwind_extent_candidates": inventory["counts"]["runtime_function_records"],
                    "discovered_procedure_inventory_observed": False,
                    "limits": ["Static provider observations only; no build, target execution or version diff.",
                               "A sample raw slice lacks the full image, external call/data targets, loaders and incoming references.",
                               "The bounded full-image analyzer profile disables discovery and reference passes; missing relations are unknown.",
                               "The discovered procedure queue is not all functions; .pdata extents are separate candidates, not exact function ownership.",
                               "Instruction strings and provider body extents do not by themselves establish complete instruction byte coverage.",
                               "No completed census queue establishes source reconstruction or gameplay/UI/UX parity."]}
    validate_resume(state, target, profile, unwind_sha, environment)
    # Generator/report changes can alter the inventory JSON digest while the
    # immutable PE and unwind records remain identical; that must not discard a
    # valid resumable native queue.
    state["input_inventory_sha256"] = file_sha256(inventory_path)
    state["unwind_directory_sha256"] = unwind_sha
    rows = load_json(queue_path) if queue_path.exists() else []
    if profile == SELECTED_PROFILE:
        selected_rows, commitment = selected_diagnostic_queue(target, root, directory, pe.data, environment)
        if state.get("selection") is not None and state["selection"] != commitment:
            raise ValueError("Selected seed/tool commitment changed; preserve the earlier census")
        state["selection"] = commitment
        state["queue_basis"] = "caller_selected_diagnostic_owners_not_procedure_discovery"
        if rows and [row["address"] for row in rows] != [row["address"] for row in selected_rows]:
            raise ValueError("Stored diagnostic queue differs from its exact seed selection")
        rows = rows or selected_rows
        if not old:
            state["limits"].append("Selected full-PE queue only; calling-convention recovery is disabled; incoming references from unseeded bodies and global native ownership remain unknown.")
    for row in rows:
        if (row["status"] == "in_progress" or row["status"] == "failed" and
                (args.retry_errors or row.get("retryable", False))):
            row["status"] = "pending"
    input_path, options = artifact_path(target["path"]), {}
    if args.sample:
        first = inventory["pe"]["runtime_function_records"]["records"][0]
        start, end, _ = first
        raw = pe.data[pe.rva_offset(start):pe.rva_offset(end - 1) + 1]
        input_path = directory / "sample.bin"
        input_path.write_bytes(raw)
        options = {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(pe.image_base + start)}
        state["sample_mapping"] = {"original_file_offset": hex(pe.rva_offset(start)), "original_address": options["entry_point"],
                                   "byte_count": len(raw), "sha256": file_sha256(input_path)}
    expected_sha = file_sha256(input_path)
    state["analysis_environment"] = {key: environment[key] for key in ("REA_GHIDRA_STARTUP_TIMEOUT_MS", "REA_GHIDRA_DISABLED_ANALYZERS", "GHIDRA_HEADLESS_MAXMEM", "REA_GHIDRA_SEED_FILE") if key in environment}
    state["census_tool_sha256"] = file_sha256(Path(__file__).resolve())
    if profile in ("full-image-no-address-tables", "full-image-entry-decoding", "full-image-entry-decoding-extended"):
        limit = "Create Address Tables is disabled after an observed whole-image startup bottleneck; automatic pointer-table discovery and related references are unknown."
        if limit not in state["limits"]:
            state["limits"].append(limit)
    sessions = directory / "sessions"
    sessions.mkdir(exist_ok=True)
    number = max([int(path.name) for path in sessions.iterdir() if path.name.isdigit()] or [0]) + 1
    session = sessions / f"{number:04d}"
    session.mkdir()
    state["last_session"] = session.relative_to(ROOT).as_posix()
    state["status"] = "initializing"
    state.pop("last_error", None)
    state.pop("cleanup_error", None)
    save(progress_path, summarize(state, rows))
    batch = batch_module()
    client, ready, failure = batch.Client(session, environment,
        journal_directory=directory / "query-progress"), False, None
    provider_queried = False
    try:
        client.prepare_open({"path": str(input_path), "provider_id": "ghidra", **options})
        client.request("initialize", {"protocolVersion": "2025-06-18", "capabilities": {},
                       "clientInfo": {"name": "AzerothSurvivorsRE-coverage", "version": "1"}}, 60, "initialize")
        client.send({"jsonrpc": "2.0", "method": "notifications/initialized"})
        ready = True
        client.call("open_binary", {"path": str(input_path), "provider_id": "ghidra", **options}, args.timeout)
        if not rows:
            record = retained_procedure_inventory(state, expected_sha)
            if record is None:
                record = native_evidence(client, "search_procedures", {"pattern": ".", "mode": "regex"},
                                         args.startup_timeout + 60, expected_sha, state)
                provider_queried = True
            state["analysis_profile"] = record["analysis_profile"]
            state["procedure_inventory_evidence_id"] = record["evidence_id"]
            procedures = normalized(record)
            rows, external = classify_procedures(procedures)
            external_path = directory / "external-procedures.json"
            save(external_path, {"target_sha256": expected_sha, "evidence_id": record["evidence_id"],
                                 "analysis_profile_digest": record["analysis_profile"]["digest"], "records": external})
            state["procedure_inventory"] = {"total_records": len(procedures), "native_address_space_records": len(rows),
                                            "external_address_space_records": len(external),
                                            "external_records_path": external_path.relative_to(ROOT).as_posix(),
                                            "external_records_sha256": file_sha256(external_path),
                                            "external_implementation_known": False}
            state["discovered_procedure_inventory_observed"] = True
            starts = {int(row["address"], 16) for row in rows}
            image_base = int(inventory["pe"]["image_base"], 16)
            state["unwind_starts_not_in_discovered_queue"] = sum(image_base + row[0] not in starts for row in inventory["pe"]["runtime_function_records"]["records"])
            save(queue_path, rows)
        state["status"] = "running"
        save(progress_path, summarize(state, rows))
        processed = 0
        for row in rows:
            if row["status"] != "pending" or processed >= args.limit:
                continue
            row["status"] = "in_progress"
            save(queue_path, rows)
            save(progress_path, summarize(state, rows))
            try:
                observations = {}
                for operation, parameters, key in (("read_function_instructions", {}, "instructions"),
                        ("procedure_references", {"direction": "outgoing"}, "outgoing"),
                        ("procedure_references", {"direction": "incoming"}, "incoming"),
                        ("procedure_info", {}, "info")):
                    result = native_evidence(client, operation, {"procedure": row["address"], **parameters},
                                             max(args.timeout, args.startup_timeout + 60) if not provider_queried else args.timeout,
                                             expected_sha, state, f"{row['address']}-{key}")
                    provider_queried = True
                    observations[key] = result
                path = directory / "procedures" / f"{row['address']}.json"
                save(path, {"target_sha256": target["sha256"], "input_sha256": expected_sha,
                            "profile": profile, "observations": observations})
                row.update(status="completed", evidence_path=path.relative_to(ROOT).as_posix(), evidence_sha256=file_sha256(path),
                           instruction_count=len(normalized(observations["instructions"])["instructions"]),
                           outgoing_reference_count=len(normalized(observations["outgoing"])["references"]),
                           incoming_reference_count=len(normalized(observations["incoming"])["references"]),
                           unresolved_call_count=len(normalized(observations["outgoing"])["unresolved_calls"]))
                body = normalized(observations["info"]).get("body", {})
                row["body_bytes"] = body.get("total_bytes") if body.get("available") else None
                row["body_ranges"] = body.get("ranges") if body.get("available") else None
                row.pop("error", None)
                row.pop("retryable", None)
            except Exception as error:
                row.update(status="failed", error=f"{type(error).__name__}: {error}",
                           retryable=batch.transient(error))
                failure = row["error"]
                raise
            finally:
                processed += 1
                save(queue_path, rows)
                save(progress_path, summarize(state, rows))
        state["status"] = "bounded_pass_finished"
    except BaseException as error:
        failure = f"{type(error).__name__}: {error}"
        state["status"] = "interrupted" if isinstance(error, KeyboardInterrupt) else "failed"
        state["last_error"] = failure
    finally:
        if ready:
            try:
                client.call("close_binary", {}, 60)
            except BaseException as error:
                failure = failure or f"Cleanup failed: {error}"
                state["cleanup_error"] = str(error)
        client.stop()
        save(queue_path, rows)
        save(progress_path, summarize(state, rows))
        save(root / "ghidra/progress.json", state)
    print(json_text({key: state[key] for key in ("profile", "status", "queue", "observations", "all_image_native_semantics_and_edges_complete")}).rstrip())
    return int(bool(failure))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--run", action="store_true")
    mode.add_argument("--prepare-selection", action="store_true", help="Write a bounded diagnostic-owner plan without starting Ghidra")
    parser.add_argument("--output", help="New runtime directory for --prepare-selection")
    parser.add_argument("--sample", action="store_true")
    parser.add_argument("--full-profile", choices=tuple(FULL_PROFILES), default=PROFILES[0],
                        help="Isolated full-image analyzer profile for --run; progress always reports every profile")
    parser.add_argument("--limit", type=int, default=10)
    parser.add_argument("--retry-errors", action="store_true")
    parser.add_argument("--timeout", type=int, default=180)
    parser.add_argument("--startup-timeout", type=int, default=600)
    args = parser.parse_args()
    if args.output and not args.prepare_selection:
        parser.error("--output requires --prepare-selection")
    try:
        if min(args.limit, args.timeout, args.startup_timeout) < 1:
            raise ValueError("Limits and deadlines must be positive")
        if args.sample and args.full_profile != PROFILES[0]:
            raise ValueError("A full-image profile cannot be combined with --sample")
        target = latest_target(verify=True) if args.prepare_selection else latest_target()
        root = ROOT / "runtime/coverage" / target["sha256"]
        if args.prepare_selection:
            prepare_selection(target, root, args.output)
            return 0
        if args.run:
            return run(args, target, root)
        print(json_text(progress_report(target, root, args.sample)).rstrip())
        return 0
    except (ValueError, OSError, KeyError) as error:
        print(f"Native census error: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
