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

from coverage_common import ROOT, file_sha256, latest_target, project_path, target_bytes
from script_sources import load_script

TARGET_SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
OUTPUT = "docs/analysis/evidence/0.121.0/as-reference-frontier.json"
SITE_ARTIFACT = "runtime/analysis/history/findings/fixgap41-dispatch/a2c8543de22f/contextual-reference-sites.jsonl.gz"
REFERENCE_KINDS = frozenset(("address", "call_direct", "jump_direct", "memory"))
FLOW_TYPES = frozenset(("CONDITIONAL_JUMP", "UNCONDITIONAL_JUMP", "UNCONDITIONAL_CALL"))


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


def collect_encoded_frontier(target):
    """Project all saved references without modifying the selected Program."""
    identity = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    base = f"docs/analysis/evidence/{target['version']}"
    paths = [f"{base}/native-residuals.json", f"{base}/unknown-recovery.json",
             "docs/analysis/coverage/instruction-summary.json",
             "docs/analysis/coverage/unwind-complement-summary.json"]
    inputs = [receipt(path) for path in paths]
    residual, queue, declared, complement = (load(path) for path in paths)
    if any(doc["target"] != identity for doc in (residual, queue, declared, complement)):
        raise ValueError("Mixed reference inventory targets")
    artifacts = residual["artifacts"]
    used = set()

    def rows(name, read=tsv_rows):
        used.add(name)
        record = artifacts[name]
        count = 0
        for row in read(record):
            count += 1
            yield row
        if count != record["rows"]:
            raise ValueError("Incomplete reference frontier input: " + name)

    body_paths, extent_paths, diagnostic_bodies = defaultdict(set), defaultdict(set), defaultdict(set)
    for row in rows("diagnostic-sites.jsonl.gz", json_rows):
        if row["context"] != "AS-custom-path":
            continue
        if row["actual_body_owner"]:
            diagnostic_bodies[row["actual_body_owner"]].add(row["path"])
        if row["kind"] != "rust_location":
            continue
        if row["actual_body_owner"]:
            body_paths[row["actual_body_owner"]].add(row["path"])
        extent_paths[int(row["runtime_function_start"], 16)].add(row["path"])
    extents = [(int(row["start"], 16), int(row["end_exclusive"], 16))
               for row in rows("declared-extent-roles.tsv.gz")]
    starts = [a for a, _ in extents]
    if any(b > c for (_, b), (c, _) in zip(extents, extents[1:])):
        raise ValueError("Overlapping declared extents")

    def extent(site):
        i = bisect_right(starts, site) - 1
        return starts[i] if i >= 0 and site < extents[i][1] else None

    ownerless_instructions = {int(row["address"], 16)
                              for row in rows("ownerless-instructions.tsv.gz")}
    unowned_destinations = Counter({int(row["destination"], 16): int(row["reference_records"])
                                    for row in rows("unowned-executable-destinations.tsv.gz")})
    pe_source = "scripts/inventory-executable.py"
    pe = load_script("q41_frontier_pe", ROOT / pe_source).PE(target_bytes(target))
    sections = [(pe.image_base + s["rva"], pe.image_base + s["rva"] + s["virtual_size"],
                 s["name"]) for s in pe.sections]
    iat = {int(dll["iat_start_address"], 16) + 8 * index: (dll["library"], name)
           for dll in pe.imports() for index, name in enumerate(dll["functions"])}
    header_end = pe.image_base + pe.u32(pe.optional + 60)

    def section(site):
        if pe.image_base <= site < header_end:
            return "PE-headers"
        return next((name for a, b, name in sections if a <= site < b), "unmapped")

    def context(row, site):
        if row["source_owner"] in body_paths:
            return "AS-Location-body"
        if extent(site) in extent_paths:
            return "AS-Location-extent-only"
        return "no-AS-Location"

    def contextual_candidate(row, site, dest):
        source_extent = extent(site)
        dest_extent = extent(dest)
        return {**row, "source_context": context(row, site),
                "source_extent": hex(source_extent) if source_extent is not None else None,
                "destination_extent": hex(dest_extent) if dest_extent is not None else None,
                "destination_is_observed_ownerless_instruction": dest in ownerless_instructions}

    def projection(items, key):
        raw = json.dumps(items, sort_keys=True, separators=(",", ":")).encode()
        return {"rows": len(items), "by_role": dict(Counter(key(row) for row in items)),
                "ordered_records_sha256": hashlib.sha256(raw).hexdigest()}

    queue_counts = {row["lead_id"]: row["records"] for row in queue["sqlite_selectors"]}
    encoded = {}
    for lead, label, summary in (("Q41-A01", "declared", declared),
                                 ("Q41-A02", "complement", complement)):
        kinds, roles, contextual, unowned_roles, unobserved_roles = (Counter() for _ in range(5))
        candidates, import_roles, import_slots, import_transfers = [], Counter(), set(), {}
        complement_diagnostic_context, complement_executable_addresses = [], []
        indirect_sites = ({int(row["site"], 16) for row in rows("complement-indirect-sites.tsv.gz")}
                          if label == "complement" else set())
        for row in rows(f"{label}-reference-roles.tsv.gz"):
            kind = row["kind"]
            kinds[kind] += 1
            site = int(row["site"], 16)
            domain = row["destination_domain"]
            dest = int(row["target"], 16) if row["target"] and domain != "external-or-unencoded" else None
            if dest in iat:
                dll, name = iat[dest]
                if kind in REFERENCE_KINDS:
                    import_roles[f"{dll}:{kind}:{row['access']}"] += 1
                    import_slots.add(dest)
                if kind == "memory" and site in indirect_sites:
                    at = pe.rva_offset(site - pe.image_base)
                    raw = pe.data[at:at + 7]
                    prefix = 1 if raw[0] == 0x48 else 0
                    end = prefix + 6
                    if (raw[prefix:prefix + 2] != b"\xff\x25"
                            or site + end + int.from_bytes(raw[end - 4:end], "little", signed=True) != dest
                            or site in import_transfers):
                        raise ValueError(f"Unexpected complement IAT transfer at {site:#x}")
                    import_transfers[site] = (dest, dll, name)
            if kind not in REFERENCE_KINDS:
                continue
            membership = "owned" if row["destination_owner"] else "unowned"
            roles[f"{kind}:{domain}:{membership}"] += 1
            source_context = context(row, site)
            contextual[f"{source_context}:{kind}"] += 1
            if label == "complement":
                source_paths = diagnostic_bodies.get(row["source_owner"], ())
                destination_paths = diagnostic_bodies.get(row["destination_owner"], ())
                if source_paths or destination_paths:
                    complement_diagnostic_context.append({
                        **row, "source_diagnostic_paths": sorted(source_paths),
                        "destination_diagnostic_paths": sorted(destination_paths)})
                if kind == "address" and domain == "executable":
                    complement_executable_addresses.append(contextual_candidate(row, site, dest))
            if domain == "executable" and membership == "unowned":
                geometry = ("same-declared-extent" if extent(site) is not None
                            and extent(site) == extent(dest) else "other-or-no-declared-extent")
                unowned_roles[f"{kind}:{geometry}"] += 1
                if dest not in ownerless_instructions:
                    unobserved_roles[f"{kind}:{geometry}"] += 1
                if source_context != "no-AS-Location" or extent(dest) in extent_paths:
                    candidates.append(contextual_candidate(row, site, dest))
        if dict(kinds) != summary["counts"]["reference_kinds"] or sum(roles.values()) != queue_counts[lead]:
            raise ValueError("Encoded reference population differs: " + lead)
        transfer_slots = {item[0] for item in import_transfers.values()}
        if label == "complement" and (
                len(import_transfers) != summary["counts"]["imported_pointer_transfer_sites"]
                or len(transfer_slots) != summary["counts"]["imported_pointer_slots"]):
            raise ValueError("Complement IAT transfer projection differs")
        encoded[lead] = {
            "population": sum(roles.values()), "kind_destination_and_membership": dict(roles),
            "source_location_context_by_kind": dict(contextual),
            "unowned_executable_references_by_kind_and_geometry": dict(unowned_roles),
            "unowned_executable_destinations_without_observed_start_by_kind_and_geometry": dict(unobserved_roles),
            "AS_location_context_unowned_executable_projection": projection(
                candidates, lambda row: f"{row['source_context']}:{row['kind']}:"
                                        f"{row['destination_is_observed_ownerless_instruction']}"),
            "AS_location_context_unowned_executable_nonlocal_sites": [
                row for row in candidates if row["kind"] != "jump_direct"
                or row["source_extent"] != row["destination_extent"]],
            "exact_IAT_operands_by_library_kind_access": dict(import_roles),
            "exact_IAT_operand_slots": len(import_slots),
        }
        if label == "complement":
            encoded[lead]["AS_diagnostic_body_context_sites"] = complement_diagnostic_context
            encoded[lead]["executable_address_sites"] = complement_executable_addresses
            payload = "".join(f"{site:#x}\t{dest:#x}\t{dll}\t{name}\n"
                              for site, (dest, dll, name) in sorted(import_transfers.items()))
            encoded[lead]["complement_indirect_IAT_transfers"] = {
                "sites": len(import_transfers), "slots": len(transfer_slots),
                "sha256": hashlib.sha256(payload.encode()).hexdigest(),
                "canonical_rows": "ascending numeric site; hex(site), hex(slot), PE library and symbol separated by tabs; LF",
            }

    static_unowned, source_roles, incoming, outgoing = Counter(), Counter(), [], []
    for row in rows("static-reference-roles.tsv.gz"):
        site = int(row["from"], 16)
        dest = int(row["to"], 16) if row["destination_domain"] != "external-or-unencoded" else None
        if row["destination_domain"] == "executable" and not row["destination_owner"]:
            static_unowned[dest] += 1
            if context(row, site) != "no-AS-Location" or extent(dest) in extent_paths:
                outgoing.append(contextual_candidate(row, site, dest))
        if not row["source_owner"]:
            source_role = ("observed-ownerless-instruction" if site in ownerless_instructions
                           else section(site))
            source_roles[f"{source_role}:{row['type']}"] += 1
            if row["destination_owner"] in body_paths and row["type"] in FLOW_TYPES:
                incoming.append({**row, "source_role": source_role,
                                 "destination_location_paths": sorted(body_paths[row["destination_owner"]])})
    if (static_unowned != unowned_destinations or sum(source_roles.values()) !=
            artifacts["ownerless-reference-sources.tsv.gz"]["rows"]):
        raise ValueError("Saved Ghidra reference residual projection differs")
    native = [artifacts[name] for name in sorted(used)]
    producers = [receipt(path) for path in ("scripts/classify-q41-as-references.py",
                                           "scripts/coverage_common.py", pe_source, "scripts/script_sources.py")]
    for record in [*inputs, *native, *producers]:
        checked(record)
    return {
        "schema_version": 1, "target": identity, "gap_ids": [41],
        "lead_ids": ["Q41-A01", "Q41-A02", "Q41-G01"], "producers": producers,
        "inputs": inputs, "native_inputs": native, "encoded_references": encoded,
        "saved_Ghidra_references": {
            "population": artifacts["static-reference-roles.tsv.gz"]["rows"],
            "unowned_executable_destinations": len(static_unowned),
            "unowned_executable_destination_reference_records": sum(static_unowned.values()),
            "source_outside_bodies_by_kind_and_role": dict(source_roles),
            "AS_location_context_unowned_executable_projection": projection(
                outgoing, lambda row: f"{row['source_context']}:{row['type']}"),
            "ownerless_direct_flow_into_AS_location_bodies": projection(
                incoming, lambda row: f"{row['source_role']}:{row['type']}"),
        },
        "limits": [
            "The independent encoded and saved Ghidra reference populations overlap. Do not add their totals.",
            "A destination with no observed start is not necessarily an unobserved byte or a callable entry.",
            "A genuine AS Rust Location is contextual evidence, not ownership of every instruction in that body or extent.",
            "An IAT address and its initial bytes establish the loader declaration, not a runtime target or a completed call.",
            "Source semantics, computed aliases, execution and original/rebuilt parity remain open.",
        ],
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--encoded-frontier", action="store_true",
                        help="project current encoded reference and ownerless Ghidra flow populations")
    args = parser.parse_args()
    if args.encoded_frontier:
        target = latest_target(verify=True)
        value = collect_encoded_frontier(target)
        path = project_path(f"docs/analysis/evidence/{target['version']}/encoded-reference-frontier.json")
        if args.write:
            pending = path.with_suffix(".json.pending")
            pending.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
            pending.replace(path)
        elif load(path) != value:
            raise ValueError("Saved encoded reference frontier differs")
        print("Verified exact encoded reference, IAT, and ownerless Ghidra flow populations.")
        return
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
