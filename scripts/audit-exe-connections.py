#!/usr/bin/env python3
"""Audit current EXE/source/evidence connections without compiling or running a game.

This is an evidence crosswalk, not a semantic completeness test. Native address
and byte inventories remain canonical in their owning records; this audit links
them to every registered custom system and its permanent gameplay gaps.
"""
import argparse
from collections import Counter
import hashlib
import importlib.util
import json
from pathlib import Path
import re

from artifact_history import iter_artifact_paths
from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_path, same_artifact, target_bytes

OUTPUT = "docs/analysis/coverage/exe-connections.json"
LITERAL_INCLUDE = re.compile(r'include_(?:str|bytes)!\s*\(\s*"([^"\n]+)"\s*\)', re.S)
INPUTS = (
    "docs/analysis/coverage/systems.json",
    "docs/analysis/coverage/native-summary.json",
    "docs/analysis/coverage/historical-range-revalidation.json",
    "docs/analysis/evidence/native-custom-coverage.json",
    "docs/analysis/coverage/changelog.json",
)

# These selected-target labels describe reviewed behavior/source contracts.
# Admit them explicitly: bounded diagnostic interfaces and population/byte
# classifiers also use selected_target labels, but do not establish behavior.
SELECTED_TARGET_BOUNDED_CONTRACT_VALIDITIES = frozenset({
    "selected_target_bounded_revive_contracts_not_runtime_or_parity",
    "selected_target_bounded_raid_source_lifetime_not_whole_system_or_parity",
    "selected_target_bounded_solo_raid_targets_not_whole_system_or_parity",
    "selected_target_bounded_contract_with_open_runtime_parity",
    "selected_target_bounded_name_construction_and_consumers",
    "selected_target_bounded_coop_source_contracts_not_full_implementation_runtime_or_parity",
})


def commitment(path):
    path = project_path(path)
    return {"path": path.relative_to(ROOT).as_posix(), "sha256": file_sha256(path)}


def same_target(record, target):
    keys = ("version", "path", "sha256", "size_bytes")
    if any(record.get("target", {}).get(key) != target[key] for key in keys):
        raise ValueError("Audit input does not describe the selected installed EXE")


def bound_inventory(record):
    value = record["inventory"]
    path = project_path(value["path"])
    if file_sha256(path) != value["sha256"]:
        raise ValueError("Inventory commitment differs: " + value["path"])
    return load_json(path)


def census_input(historical, target, requested=None):
    """Use a selected census commitment, never a historical filename default."""
    selected = historical.get("current_native_body_census", {})
    name = requested or selected.get("path")
    if not name:
        raise ValueError("A current --census-summary or historical-audit census commitment is required")
    path = project_path(name)
    digest = file_sha256(path)
    relative = path.relative_to(ROOT).as_posix()
    if selected.get("sha256") != digest or (
        selected.get("path") != relative and not same_artifact(selected.get("path"), path, digest)
    ):
        raise ValueError("Historical range audit must use the selected native census")
    record = load_json(path)
    same_target(record, target)
    if not record.get("independent_instructions", {}).get("exact_source_bytes_verified"):
        raise ValueError("A current independently verified native census is required")
    for filename, value in record["artifacts"]["files"].items():
        artifact = project_path(Path(record["artifacts"]["directory"]) / filename)
        if file_sha256(artifact) != value["sha256"]:
            raise ValueError("Selected native artifact differs: " + filename)
    return relative, record


def contract_owners(binding, registered_ids=None):
    """Use bounded owners within the optional general evidence scope."""
    if not isinstance(binding, dict):
        raise ValueError("Invalid evidence target binding")
    for field in ("system_ids", "bounded_contract_system_ids"):
        if field not in binding:
            continue
        owners = binding[field]
        if not isinstance(owners, list) or any(not isinstance(owner, str) or not owner for owner in owners):
            raise ValueError("Invalid " + field + " ownership list")
        if registered_ids is not None and any(owner not in registered_ids for owner in owners):
            raise ValueError("Evidence binding names an unregistered system: " + field)
    general = binding.get("system_ids")
    bounded = binding.get("bounded_contract_system_ids")
    if general is not None and bounded is not None and not set(bounded).issubset(general):
        raise ValueError("Bounded contract ownership exceeds general system scope")
    return bounded if bounded is not None else general


def reference_partition(refs, bindings, target_sha, system_id=None):
    """A current reference is a bounded evidence link, never a passed system."""
    result = {"current": [], "current_bounded_contracts": [], "historical": [], "other_or_unbound": []}
    for name in sorted(set(refs)):
        binding = bindings.get(name, {})
        owners = contract_owners(binding)
        digest = binding.get("target_sha256")
        group = "current" if digest == target_sha else "historical" if digest else "other_or_unbound"
        result[group].append(name)
        # The existing register explicitly distinguishes bounded behavior from
        # census/path/byte discovery. A shared diagnostic link must not mask a
        # missing current contract review in every otherwise historical row.
        validity = binding.get("validity", "")
        owned_contract = owners is None or system_id in owners
        if group == "current" and owned_contract and (validity.startswith("current_bounded_") or
                                   validity.startswith("bounded_current_") or
                                   (validity.startswith("current_selected_") and "contract" in validity) or
                                   validity in SELECTED_TARGET_BOUNDED_CONTRACT_VALIDITIES):
            result["current_bounded_contracts"].append(name)
    return result


def system_rows(systems, custom, sites, target_sha):
    registered_ids = {row["id"] for row in systems["systems"]}
    for binding in systems.get("evidence_target_bindings", {}).values():
        contract_owners(binding, registered_ids)
    paths = {row["path"]: row for row in custom["paths"]}
    by_path = {}
    for row in sites:
        by_path.setdefault(row["path"], []).append(row)
    result = []
    for system in systems["systems"]:
        name = system.get("original_path")
        if name not in paths:
            continue
        references = by_path.get(name, [])
        locations = [r for r in references if r["reference_kind"] == "rust_location"]
        unowned = [r for r in locations if r["actual_native_owner"] is None]
        partition = reference_partition(system.get("evidence_refs", []),
                                        systems["evidence_target_bindings"], target_sha, system["id"])
        result.append({
            "id": system["id"], "original_path": name,
            "source_refs": system.get("source_refs", []),
            "source_anchors": system.get("source_review_anchors", []),
            "gap_ids": system["gap_ids"],
            "location_reference_count": len(locations),
            "location_body_owners": sorted({r["actual_native_owner"] for r in locations
                                             if r["actual_native_owner"] is not None}, key=lambda a: int(a, 16)),
            "ownerless_location_sites": [r["site"] for r in unowned],
            "evidence_links": partition,
            "current_bounded_contract_scopes": {
                ref: systems["evidence_target_bindings"][ref].get("bounded_contract_owner_scopes", {}).get(system["id"],
                     systems["evidence_target_bindings"][ref].get("validity", ""))
                for ref in partition["current_bounded_contracts"]
            },
            "registered_current_evidence_present": bool(partition["current"]),
            "registered_current_bounded_contract_present": bool(partition["current_bounded_contracts"]),
            "remaining_source_work": system["remaining_source_work"],
            "whole_system_semantics_verified": False,
            "parity_verified": False,
        })
    if len(result) != len(paths) or len({r["original_path"] for r in result}) != len(paths):
        raise ValueError("Every discovered custom path needs one distinct system row")
    return result


def evidence_documents(target):
    """Index all retained JSON evidence, including documents without a target."""
    spec = importlib.util.spec_from_file_location("historical_contracts", ROOT / "scripts/revalidate-historical-native-ranges.py")
    helper = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(helper)
    rows = []
    for path in iter_artifact_paths(ROOT / "docs/analysis/evidence", ".json", recursive=True):
        value = load_json(path)
        if not isinstance(value, dict):
            digest = None
        else:
            digest = helper.target_digest(value)
        rows.append({**commitment(path), "explicit_target_sha256": digest,
                     "identity_role": "current" if digest == target["sha256"] else "historical" if digest else "requires_owning_manifest_or_review"})
    return rows


def embedded_assets(target):
    """Record source inclusion, without treating historical forensic words as live pointers."""
    paths = set()
    for path in (ROOT / "crates/azeroth-survivors-re/src").rglob("*.rs"):
        for match in LITERAL_INCLUDE.finditer(path.read_text()):
            included = project_path(path.parent / match[1])
            if not included.is_file():
                raise ValueError("Missing source include: " + str(included.relative_to(ROOT)))
            paths.add(included)
    rows = []
    for path in sorted(paths):
        digest = None
        if path.suffix == ".json":
            value = load_json(path)
            if isinstance(value, dict):
                candidate = value.get("target_sha256")
                nested = value.get("target", {})
                if isinstance(nested, dict):
                    candidate = candidate or nested.get("sha256")
                if isinstance(candidate, str) and re.fullmatch(r"[0-9a-f]{64}", candidate):
                    digest = candidate
        rows.append({**commitment(path), "declared_target_sha256": digest,
                     "provenance": "current" if digest == target["sha256"] else "historical" if digest else "not_declared_in_asset"})
    return rows


def connection_records(target, census_summary=None, replacements=None):
    """Project connection records from a selected audit and current source inputs."""
    replacements = replacements or {}

    def read(name):
        return json.loads(replacements[name]) if name in replacements else load_json(project_path(name))

    def receipt(name):
        if name in replacements:
            return {"path": name, "sha256": hashlib.sha256(replacements[name]).hexdigest()}
        return commitment(name)

    names = INPUTS
    records = {name: read(name) for name in names}
    for record in records.values():
        same_target(record, target)
    historical = records[names[2]]
    census_name, census = census_input(historical, target, census_summary)
    systems, custom = records[names[0]], records[names[3]]
    if not any(same_artifact(row["path"], census_name, row["sha256"])
               for row in custom["inputs"]):
        raise ValueError("Custom native partition must use the selected native census")
    site_inventory = bound_inventory(custom)
    same_target(site_inventory, target)
    rows = system_rows(systems, custom, site_inventory["reference_records"], target["sha256"])
    bound_inventory(historical)
    documents, assets = evidence_documents(target), embedded_assets(target)
    counts = {
        "custom_system_rows": len(rows),
        "with_registered_current_evidence": sum(r["registered_current_evidence_present"] for r in rows),
        "without_registered_current_evidence": sum(not r["registered_current_evidence_present"] for r in rows),
        "with_registered_current_bounded_contract": sum(r["registered_current_bounded_contract_present"] for r in rows),
        "without_registered_current_bounded_contract": sum(not r["registered_current_bounded_contract_present"] for r in rows),
        "without_source_correspondence": sum(not r["source_refs"] for r in rows),
        "ownerless_native_location_references": sum(len(r["ownerless_location_sites"]) for r in rows),
        "paths_with_ownerless_native_location_references": sum(bool(r["ownerless_location_sites"]) for r in rows),
        "retained_evidence_json_documents": len(documents),
        "evidence_document_identity_roles": dict(sorted(Counter(r["identity_role"] for r in documents).items())),
        "directly_embedded_assets": len(assets),
        "embedded_asset_provenance": dict(sorted(Counter(r["provenance"] for r in assets).items())),
        "historical_range_commitments": historical["unique_range_commitments"],
        "historical_range_results": historical["counts"],
    }
    supporting = []
    classification_path = "docs/analysis/coverage/native-ownership-classification.json"
    if project_path(classification_path).is_file():
        classification = read(classification_path)
        supporting.append({**receipt(classification_path), "target": classification["target"],
                           "role": "current_supporting_ownership" if classification["target"]["sha256"] == target["sha256"]
                           else "historical_supporting_ownership"})
    output = {
        "schema_version": 1,
        "target": {key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
        "generator": commitment("scripts/audit-exe-connections.py"),
        "generator_dependencies": [commitment("scripts/coverage_common.py"), commitment("scripts/revalidate-historical-native-ranges.py")],
        "inputs": [receipt(name) for name in [*names, census_name]],
        "current_native_body_census": commitment(census_name),
        "supporting_inputs": supporting,
        "counts": counts,
        "systems": rows,
        "evidence_documents": documents,
        "embedded_assets": assets,
        "limits": [
            "All registered custom paths are crosswalked; filename-free systems can remain undiscovered.",
            "Current evidence membership does not certify that every contract, address, type, producer, consumer or dependency is recovered.",
            "A missing directly registered current reference is an evidence-review lead, not proof of missing source or changed native behavior.",
            "Ownerless Location sites include failure blocks; they are not automatically callable entries or missing gameplay systems.",
            "Asset provenance does not determine current semantic validity. Current contracts may deliberately translate historical representations.",
            "Document identity is read from explicit metadata; owning-manifest bindings are checked separately in historical range accounting.",
            "Supporting ownership records retain their actual target and do not supply current native body ownership or behavioral proof.",
            "Static addresses describe the preferred PE image. Live memory, ASLR, dynamic aliases and computed targets require separate evidence.",
            "No compilation, reconstructed source execution, game launch or original/rebuilt parity comparison occurs.",
        ],
        "whole_system_semantics_verified": False,
        "parity_verified": False,
    }
    # The complete file/source inventory is disposable; maintain a compact crosswalk.
    inventory_path = f"runtime/coverage/{target['sha256']}/exe-connections.json"
    payload = json_text(output).encode()
    output["inventory"] = {"path": inventory_path, "sha256": hashlib.sha256(payload).hexdigest()}
    del output["evidence_documents"]
    del output["embedded_assets"]
    output["systems"] = [{
        key: row[key] for key in (
            "id", "original_path", "source_refs", "source_anchors", "gap_ids",
            "location_reference_count", "location_body_owners", "ownerless_location_sites",
            "remaining_source_work",
            "registered_current_evidence_present", "registered_current_bounded_contract_present",
            "current_bounded_contract_scopes",
        )
    } | {"current_bounded_contract_refs": row["evidence_links"]["current_bounded_contracts"]}
        for row in rows]
    return output, payload


def audit(census_summary=None):
    target = latest_target()
    target_bytes(target)
    output, inventory = connection_records(target, census_summary)
    from instruction_facts import derived_bytes
    derived_bytes(ROOT / output["inventory"]["path"], inventory, publish=True)
    return output


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="Curate the compact system crosswalk")
    parser.add_argument("--census-summary", help="Current verified census; must match the historical-range and custom-partition parents")
    args = parser.parse_args()
    output = audit(args.census_summary)
    if args.write:
        project_path(OUTPUT).write_text(json_text(output))
    elif not project_path(OUTPUT).exists() or load_json(project_path(OUTPUT)) != output:
        raise SystemExit("EXE connection crosswalk is absent/stale; review changes, then use --write")
    print(json.dumps({"counts": output["counts"], "written": args.write, "parity_verified": False}))


if __name__ == "__main__":
    main()
