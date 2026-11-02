#!/usr/bin/env python3
"""Check and summarize the selected full-PE body/reference census, without REA.

Requires the existing Python Capstone dependency for independent instruction
boundaries. Bulk observations remain ignored; only a compact target-bound
summary is promoted. No compiler, application or provider is started.
"""

import argparse
from collections import Counter
import hashlib
import importlib.util
import re
import sys

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_path, target_bytes

SUMMARY = ROOT / "docs/analysis/coverage/seeded-census.json"
GENERATOR = "scripts/summarize-seeded-census.py"


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def instruction_addresses(lines):
    addresses = []
    for line in lines:
        match = re.match(r"^(0x[0-9a-fA-F]+): .+", line)
        if not match:
            raise ValueError("Unexpected Ghidra instruction representation")
        addresses.append(int(match[1], 16))
    if addresses != sorted(set(addresses)):
        raise ValueError("Ghidra instruction addresses are duplicated or unordered")
    return addresses


def body_observation(body, lines, pe, decoder):
    """Check exact selected-image bytes/boundaries, allowing noncode body gaps."""
    if not body.get("available") or not body.get("contains_entry"):
        raise ValueError("Missing selected Ghidra body")
    addresses = instruction_addresses(lines)
    decoded, ranges, previous = set(), [], -1
    for row in body["ranges"]:
        start, end = int(row["start"], 16), int(row["end"], 16) + 1
        if start < previous or end <= start:
            raise ValueError("Invalid/overlapping Ghidra body ranges")
        previous = end
        offset = pe.rva_offset(start - pe.image_base)
        if pe.rva_offset(end - 1 - pe.image_base) != offset + end - start - 1:
            raise ValueError("Noncontiguous file mapping for selected body")
        raw = pe.data[offset:offset + end - start]
        instructions = list(decoder.disasm_lite(raw, start))
        # A body can contain inline data/undefined regions. Do not call those
        # bytes decoded or force the declared unwind range onto Ghidra's body.
        end_decoded = start
        for at, length, _, _ in instructions:
            if at != end_decoded:
                raise ValueError("Noncontiguous independent instruction decode")
            decoded.add(at)
            end_decoded = at + length
        ranges.append(dict(start=hex(start), end=hex(end - 1), file_offset=hex(offset),
                           byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest(),
                           independently_decoded_bytes=end_decoded - start))
    if sum(row["byte_count"] for row in ranges) != body["total_bytes"]:
        raise ValueError("Ghidra body byte count differs from its ranges")
    # Observed code after a gap is checked separately at each reported address.
    # Exact equality is recorded, not assumed, for the linear range decoder.
    for at in addresses:
        if not any(int(r["start"], 16) <= at <= int(r["end"], 16) for r in ranges):
            raise ValueError("Ghidra instruction lies outside its reported body")
        offset = pe.rva_offset(at - pe.image_base)
        instruction = next(decoder.disasm_lite(pe.data[offset:offset + 15], at, count=1), None)
        if not instruction:
            raise ValueError("Ghidra instruction cannot be independently decoded")
        if not any(int(r["start"], 16) <= at and at + instruction[1] - 1 <= int(r["end"], 16) for r in ranges):
            raise ValueError("Ghidra body clips an observed instruction")
    return dict(ranges=ranges, body_bytes=body["total_bytes"], instruction_records=len(addresses),
                independent_linear_boundaries_match=decoded == set(addresses)), set(addresses)


def summarize(target, root, capstone):
    census = module("seeded_census", "scripts/census-current-target.py")
    directory = root / "ghidra" / census.SELECTED_PROFILE
    state, queue = load_json(directory / "progress.json"), load_json(directory / "queue.json")
    for key in ("version", "path", "sha256", "size_bytes"):
        if state["target"][key] != target[key]:
            raise ValueError("Selected census belongs to another target")
    if (state.get("profile") != census.SELECTED_PROFILE or not state.get("whole_image_input")
            or state.get("queue_basis") != "caller_selected_diagnostic_owners_not_procedure_discovery"):
        raise ValueError("Expected the separate selected full-PE census profile")
    if not queue or any(row["status"] != "completed" for row in queue):
        raise ValueError("Selected full-PE queue has unfinished queries")
    selection = state["selection"]
    if file_sha256(directory / "seeds.tsv") != selection["seed_sha256"]:
        raise ValueError("Selected census seed bytes changed")
    ownership = load_json(ROOT / "docs/analysis/coverage/diagnostic-ownership.json")
    if ownership["inventory"]["sha256"] != selection["diagnostic_inventory_sha256"]:
        raise ValueError("Selected census diagnostic inventory changed")
    selection_tool = module("selected_census_preparer", "scripts/prepare-native-census-selection.py")
    bulk = load_json(root / "diagnostic-ownership.json")
    selection_tool.validate_ownership_summary(ownership, target, (root / "diagnostic-ownership.json").relative_to(ROOT).as_posix(), file_sha256(root / "diagnostic-ownership.json"))
    if selection_tool.select_owners(bulk, target) != selection["mappings"]:
        raise ValueError("Selected census no longer reproduces all diagnostic owners")
    pe = module("selected_census_pe", "scripts/inventory-current-target.py").pe_parser(target_bytes(target))
    selection_tool.validate_owner_bytes(selection["mappings"], pe.data)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    by_address, reference_kinds = {}, dict(outgoing=Counter(), incoming=Counter())
    unresolved_reasons = Counter()
    for row in queue:
        path = project_path(row["evidence_path"])
        if file_sha256(path) != row["evidence_sha256"]:
            raise ValueError("Selected procedure evidence bytes changed")
        saved = load_json(path)
        if (saved.get("target_sha256") != target["sha256"] or saved.get("input_sha256") != target["sha256"]
                or saved.get("profile") != census.SELECTED_PROFILE):
            raise ValueError("Selected procedure evidence target/profile changed")
        observations = saved["observations"]
        expected = dict(instructions="read_function_instructions", outgoing="procedure_references",
                        incoming="procedure_references", info="procedure_info")
        for facet, operation in expected.items():
            record = observations[facet]
            census.evidence(dict(structuredContent=record), target["sha256"])
            census.validate_native_profile(record, state)
            if record["operation"] != operation:
                raise ValueError("Selected procedure operation differs")
        normalized = {key: record["normalized_result"] for key, record in observations.items()}
        body = normalized["info"]["body"]
        if normalized["info"]["entrypoint"] != row["address"]:
            raise ValueError("Selected procedure entry differs")
        for facet in ("instructions", "outgoing", "incoming"):
            if normalized[facet]["procedure"]["address"] != row["address"] or normalized[facet]["procedure"]["body"] != body:
                raise ValueError("Selected body/entry differs between query facets")
        result, addresses = body_observation(body, normalized["instructions"]["instructions"], pe, decoder)
        for direction in ("outgoing", "incoming"):
            if normalized[direction]["direction"] != direction:
                raise ValueError("Selected reference direction differs")
            refs = normalized[direction]["references"]
            reference_kinds[direction].update(ref["kind"]["type"] for ref in refs)
            result[direction + "_references"] = len(refs)
        result["reported_unresolved_calls"] = len(normalized["outgoing"]["unresolved_calls"])
        unresolved_reasons.update(row["reason"] for row in normalized["outgoing"]["unresolved_calls"])
        result["evidence_ids"] = {key: value["evidence_id"] for key, value in observations.items()}
        result["retained_observations"] = dict(path=row["evidence_path"], sha256=row["evidence_sha256"])
        by_address[row["address"]] = (result, addresses)
    mappings = []
    for mapping in selection["mappings"]:
        reference = mapping["reference"]
        address = reference["runtime_function_start"]
        result, addresses = by_address[address]
        declared = dict(start=address, end=hex(int(reference["runtime_function_end"], 16) - 1))
        actual = [dict(start=r["start"], end=r["end"]) for r in result["ranges"]]
        mappings.append(dict(path=mapping["path"], address=address,
            declared_extent=dict(**declared, file_offset=reference["owner_file_offset"],
                                 byte_count=reference["owner_byte_count"], sha256=reference["owner_sha256"]),
            body_relation="matches-declared-extent" if actual == [declared] else "differs-from-declared-extent",
            diagnostic_instruction=reference["instruction_address"],
            diagnostic_instruction_observed=int(reference["instruction_address"], 16) in addresses,
            **result))
    unique = [row[0] for row in by_address.values()]
    counts = dict(selected_paths=len(mappings), unique_owners=len(unique), completed_query_sets=len(queue),
                  owners_with_instructions=sum(row["instruction_records"] > 0 for row in unique),
                  instruction_records=sum(row["instruction_records"] for row in unique),
                  body_bytes_summed=sum(row["body_bytes"] for row in unique),
                  matching_declared_bodies=sum(row["body_relation"] == "matches-declared-extent" for row in mappings),
                  diagnostic_instructions_observed=sum(row["diagnostic_instruction_observed"] for row in mappings),
                  independent_linear_boundary_matches=sum(row["independent_linear_boundaries_match"] for row in unique),
                  outgoing_references=sum(row["outgoing_references"] for row in unique),
                  incoming_references=sum(row["incoming_references"] for row in unique),
                  reported_unresolved_calls=sum(row["reported_unresolved_calls"] for row in unique))
    profile = state["analysis_profile"]
    return dict(schema_version=1, target={k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
                profile=dict(name=census.SELECTED_PROFILE, digest=profile["digest"], provider=profile["provider"],
                    disabled_analyzers=profile["parameters"]["analysis_options"]["disabled_analyzers"],
                    seed_format=selection["format"], seed_sha256=selection["seed_sha256"], tooling=selection["tooling"]),
                generator={path:file_sha256(ROOT / path) for path in (GENERATOR, "scripts/census-current-target.py", "scripts/repair-rea-seeded-bodies.py", "scripts/prepare-native-census-selection.py")},
                independent_decoder=dict(name="Capstone", version=capstone.__version__),
                counts=counts, reference_kinds={k:dict(sorted(v.items())) for k,v in reference_kinds.items()},
                unresolved_call_reasons=dict(sorted(unresolved_reasons.items())), mappings=mappings,
                whole_image_input=True, global_native_semantics_complete=False, global_references_complete=False,
                native_source_ownership_complete=False, parity_verified=False, gap_ids=[41],
                limits=["All custom diagnostic paths select one minimum declared owner each; all other functions, engine/platform ownership and semantic contracts remain open.",
                        "Ghidra bodies follow decoded control flow; differences from unwind extents and missing diagnostic instructions are explicit, never forced to match.",
                        "Unseeded callers, indirect targets, address tables, calling conventions and disabled reference analyzers limit relationships. A zero unresolved-call observation does not prove completeness.",
                        "Independent boundaries and exact body/declared-range hashes check selected bytes, not reachability, gameplay/source behavior or original/rebuilt parity.",
                        "No application compilation, game execution, rendering or runtime validation."])


def validate_summary(record, target, systems, data, findings):
    """Standard-library accounting checks; no decoder/provider/runtime required."""
    require = lambda condition, detail: findings.require(condition, "seeded_census", detail)
    require(all(record.get("target", {}).get(key) == target[key] for key in ("version", "path", "sha256", "size_bytes")),
            "Seeded census belongs to another selected target")
    expected_paths = {row["original_path"] for row in systems["systems"] if row.get("original_path")}
    mappings = record.get("mappings", [])
    paths = [row["path"] for row in mappings]
    require(len(paths) == len(set(paths)) and set(paths) == expected_paths,
            "Seeded census must retain every current diagnostic path exactly once")
    require(record.get("whole_image_input") is True and all(record.get(key) is False for key in (
        "global_native_semantics_complete", "global_references_complete", "native_source_ownership_complete", "parity_verified"))
        and 41 in record.get("gap_ids", []), "Selected body queries cannot certify global recovery or parity")
    for path, digest in record.get("generator", {}).items():
        require(file_sha256(project_path(path)) == digest, f"Seeded census generator changed: {path}")
    repair = module("summary_seed_repair", "scripts/repair-rea-seeded-bodies.py")
    require(record.get("profile", {}).get("seed_format") == repair.FORMAT, "Missing repaired seed-format profile commitment")
    pe = module("summary_seeded_pe", "scripts/inventory-current-target.py").pe_parser(data)
    unique = {}
    for row in mappings:
        previous = unique.setdefault(row["address"], row)
        require(previous["ranges"] == row["ranges"], "Shared selected owner has contradictory body ranges")
        for part in [row["declared_extent"], *row["ranges"]]:
            start, end = int(part["start"], 16), int(part["end"], 16)
            offset, count = int(part["file_offset"], 16), part["byte_count"]
            require(count > 0 and end - start + 1 == count and pe.rva_offset(start - pe.image_base) == offset
                    and pe.rva_offset(end - pe.image_base) == offset + count - 1
                    and hashlib.sha256(data[offset:offset + count]).hexdigest() == part["sha256"],
                    f"Selected body/declared byte range differs: {row['path']}")
        path = project_path(row["retained_observations"]["path"])
        if path.exists():
            require(file_sha256(path) == row["retained_observations"]["sha256"], "Selected procedure observations changed")
        else:
            findings.warn("disposable_inventory_absent", f"Selected procedure observations absent: {row['address']}")
    counts = record["counts"]
    require(counts["selected_paths"] == len(mappings) and counts["unique_owners"] == len(unique)
            and counts["completed_query_sets"] == len(unique), "Selected queue/path counts differ")
    for count, field in (("instruction_records", "instruction_records"), ("body_bytes_summed", "body_bytes"),
                         ("outgoing_references", "outgoing_references"), ("incoming_references", "incoming_references"),
                         ("reported_unresolved_calls", "reported_unresolved_calls")):
        require(counts[count] == sum(row[field] for row in unique.values()), f"Selected {count} total differs")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    try:
        import capstone
        target = latest_target(verify=True)
        report = summarize(target, ROOT / "runtime/coverage" / target["sha256"], capstone)
        text = json_text(report)
        if args.write:
            SUMMARY.write_text(text, encoding="utf-8")
        elif not SUMMARY.exists() or SUMMARY.read_text() != text:
            raise ValueError("Selected census summary is missing or stale")
        print(json_text(report["counts"]).rstrip())
        return 0
    except (ImportError, OSError, KeyError, ValueError, TypeError) as error:
        print(f"Seeded census summary: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main())
