#!/usr/bin/env python3
"""Check current-target coverage accounting without compiling or running a game.

Success means the records are consistent. It does not mean all native behavior
is recovered or that the reconstruction matches it. Unresolved work is reported
separately and must retain a permanent owner across the source and verification
registers. Reading those registers does not require a native target.
"""

import argparse
from collections import Counter
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess

from coverage_common import (ROOT, file_sha256, finding_reference, finding_register,
                             latest_target, load_json, project_path, target_bytes)
from script_sources import current_path

COVERAGE = Path("docs/analysis/coverage")
DIMENSIONS = ("recovery", "implementation", "static_validation", "runtime_validation", "parity")
PATH_PATTERN = rb"crates[\\/](?:wenilla-rogue|wenilla-rogue-app)[\\/]src[\\/][A-Za-z0-9_\\/\-]+\.rs"
UNVERIFIED = {"unknown", "unverified", "partial", "missing", "not_run", "bounded", "pending"}


class Findings:
    def __init__(self):
        self.errors = []
        self.warnings = []
        self.counts = Counter()

    def require(self, condition, category, detail):
        self.counts[category] += 1
        if not condition:
            self.errors.append({"category": category, "detail": detail})

    def warn(self, category, detail):
        self.warnings.append({"category": category, "detail": detail})


def reference_path(value, root=ROOT):
    """Resolve tracked plain/line/Markdown references, rejecting outside paths."""
    finding = re.fullmatch(r'docs/(CURRENT-STATE|verification-needed)\.md#gap-(\d+)', value)
    if finding and (root / 'docs/verification-needed.md').is_file():
        value = finding_reference(int(finding[2]), root,
                                  verification=finding[1] == 'verification-needed')
    value = value.split("#", 1)[0]
    value = re.sub(r":\d+(?::\d+)?$", "", value)
    path = (root / value).resolve()
    if not path.is_relative_to(root.resolve()):
        raise ValueError(f"Reference escapes project: {value}")
    return current_path(path, root)


def same_target(record, target, label, findings):
    actual = record.get("target", {})
    for key in ("version", "path", "sha256"):
        findings.require(actual.get(key) == target.get(key), "target_identity", f"{label}: stale or absent {key}")


def validate_systems(ledger, target, data, gap_ids, findings, root=ROOT):
    same_target(ledger, target, "systems", findings)
    paths = {match[0].decode("ascii").replace("\\", "/") for match in re.finditer(PATH_PATTERN, data)}
    systems = ledger.get("systems", [])
    findings.require(bool(systems), "systems", "No systems registered")
    seen_ids, seen_paths = set(), set()
    statuses = Counter()
    for system in systems:
        sid = system.get("id", "")
        findings.require(bool(sid) and sid not in seen_ids, "system_id", f"Duplicate/empty system ID: {sid}")
        seen_ids.add(sid)
        original = system.get("original_path")
        if original is not None:
            findings.require(original not in seen_paths, "path_accounting", f"Duplicate original path: {original}")
            seen_paths.add(original)
            evidence = system.get("native_path_evidence", [])
            findings.require(bool(evidence), "native_path", f"{sid}: no diagnostic byte evidence")
            for entry in evidence:
                try:
                    at = int(str(entry["file_offset"]), 0)
                    length = entry["byte_count"]
                    raw = data[at:at + length]
                    valid = at >= 0 and length > 0 and len(raw) == length and hashlib.sha256(raw).hexdigest() == entry["sha256"]
                    valid = valid and raw.decode("ascii").replace("\\", "/") == original
                except (KeyError, ValueError, TypeError, UnicodeError):
                    valid = False
                findings.require(valid, "native_path", f"{sid}: diagnostic range/hash mismatch")
        for group in ("source_refs", "evidence_refs"):
            refs = system.get(group, [])
            candidates = system.get("candidate_source_refs", [])
            pending_source_assignment = False
            if (group == "source_refs"
                    and system.get("source_correspondence_status") == "pending_native_source_assignment"
                    and isinstance(candidates, list) and candidates
                    and system.get("remaining_source_work")):
                try:
                    pending_source_assignment = all(
                        reference_path(ref, root).is_file() for ref in candidates)
                except (ValueError, TypeError, AttributeError):
                    pass
            explicitly_missing = (group == "source_refs" and
                                  system.get("implementation", {}).get("status") == "missing" and
                                  bool(system.get("remaining_source_work")))
            findings.require(bool(refs) or explicitly_missing or pending_source_assignment,
                             "references", f"{sid}: empty {group} without an explicit missing implementation or pending source assignment with valid candidates")
            for ref in refs:
                try:
                    valid = reference_path(ref, root).is_file()
                except (ValueError, TypeError, AttributeError):
                    valid = False
                findings.require(valid, "references", f"{sid}: missing/invalid {group}: {ref}")
        gaps = system.get("gap_ids", [])
        findings.require(bool(gaps) and all(isinstance(n, int) and n in gap_ids for n in gaps), "gap_ownership", f"{sid}: missing/unregistered gap IDs {gaps}")
        for dimension in DIMENSIONS:
            state = system.get(dimension, {})
            status = state.get("status") if isinstance(state, dict) else None
            findings.require(bool(status) and bool(state.get("summary")), "status", f"{sid}: missing {dimension} status/scope")
            statuses[f"{dimension}:{status}"] += 1
            if status and status not in UNVERIFIED:
                # A word such as complete/verified needs its own native contract
                # and a separate parity record, never a filename-presence claim.
                certificates = system.get("certificates", {}).get(dimension, [])
                findings.require(bool(certificates), "completion_claim", f"{sid}: {dimension}={status} has no certificate")
                for certificate in certificates:
                    findings.require(certificate.get("target_sha256") == target["sha256"] and bool(certificate.get("evidence_refs")), "completion_claim", f"{sid}: invalid {dimension} certificate")
        work = system.get("remaining_source_work", [])
        findings.require(isinstance(work, list), "remaining_work", f"{sid}: remaining_source_work must be a list")
        if work:
            findings.warn("open_source_recovery", f"{sid}: {len(work)} remaining task(s), gaps {gaps}")
    findings.require(seen_paths == paths, "path_accounting", f"Unaccounted paths: {sorted(paths - seen_paths)}; stale paths: {sorted(seen_paths - paths)}")
    for ref, expected in ledger.get("reviewed_source_hashes", {}).items():
        try:
            path = reference_path(ref, root)
            if not path.is_file() or file_sha256(path) != expected:
                findings.warn("stale_source_review", f"Source changed since review: {ref}")
        except ValueError:
            findings.require(False, "references", f"Invalid source hash reference: {ref}")
    return {"diagnostic_paths": len(paths), "registered_systems": len(systems), "dimension_counts": dict(sorted(statuses.items()))}


def validate_changelog(ledger, target, systems, gap_ids, findings, root=ROOT):
    same_target(ledger, target, "changelog", findings)
    ids = set()
    system_ids = {entry["id"] for entry in systems.get("systems", [])}
    entries = ledger.get("entries", [])
    findings.require(bool(entries), "changelog", "No changelog claims recorded")
    for claim in entries:
        cid = claim.get("id", "")
        findings.require(bool(cid) and cid not in ids, "claim_id", f"Duplicate/empty claim ID: {cid}")
        ids.add(cid)
        findings.require(bool(claim.get("text")) and bool(claim.get("release")), "claim_content", f"{cid}: no supplied text/release")
        for sid in claim.get("systems", []):
            findings.require(sid in system_ids, "claim_system", f"{cid}: unknown system {sid}")
        for number in claim.get("gap_ids", []):
            findings.require(number in gap_ids, "gap_ownership", f"{cid}: unknown gap {number}")
        for group in ("source_refs", "evidence_refs"):
            for ref in claim.get(group, []):
                try:
                    valid = reference_path(ref, root).is_file()
                except (ValueError, TypeError, AttributeError):
                    valid = False
                findings.require(valid, "references", f"{cid}: missing {ref}")
        if claim.get("status") == "pending_claim_recovery":
            findings.counts["pending_claim_recovery"] += 1
        elif claim.get("status") in {"verified", "matched", "complete"}:
            findings.require(claim.get("target_sha256") == target["sha256"] and claim.get("mapping_basis") != "release_context_only" and bool(claim.get("evidence_refs")), "completion_claim", f"{cid}: release context cannot certify a claim")
    return {"claims": len(entries), "releases": len({entry.get("release") for entry in entries})}


def validate_summary(summary, systems, actual_paths, findings):
    findings.require(summary.get("counts", {}).get("custom_game_diagnostic_paths") == actual_paths,
                     "summary_count", "Native diagnostic count differs from actual selected EXE paths")
    for field, dimension in (("ownership_complete", "recovery"),
                             ("reconstruction_complete", "implementation"),
                             ("parity_verified", "parity")):
        if summary.get(field):
            complete = bool(systems.get("systems")) and all(
                row.get(dimension, {}).get("status") not in UNVERIFIED and
                bool(row.get("certificates", {}).get(dimension))
                for row in systems["systems"])
            findings.require(complete, "completion_claim", f"Native summary {field} contradicts system evidence")


def validate_diagnostic_ownership(summary, target, systems, data, findings, root=ROOT):
    """Validate compact decoded leads without promoting their semantic status."""
    same_target(summary, target, "diagnostic-ownership", findings)
    expected = {row["original_path"]: row["id"] for row in systems.get("systems", [])
                if row.get("original_path") is not None}
    rows = summary.get("custom_diagnostics", [])
    paths = [row.get("path") for row in rows]
    findings.require(len(paths) == len(set(paths)) and set(paths) == set(expected),
                     "diagnostic_ownership", "Decoded diagnostic leads omit, duplicate or invent a custom path")
    for row in rows:
        findings.require(expected.get(row.get("path")) == row.get("system_id"),
                         "diagnostic_ownership", f"Decoded diagnostic lead has wrong system: {row.get('path')}")
    counts = summary.get("counts", {})
    findings.require(counts.get("custom_diagnostic_paths") == len(expected),
                     "diagnostic_ownership", "Decoded diagnostic count differs from selected system membership")
    verified = sum(row.get("verified_instruction_references", 0) > 0 for row in rows)
    findings.require(counts.get("custom_paths_with_verified_references") == verified,
                     "diagnostic_ownership", "Decoded custom-path count differs from per-path evidence")
    findings.require(summary.get("native_source_ownership_complete") is False and summary.get("parity_verified") is False,
                     "completion_claim", "Diagnostic instruction references cannot certify semantic ownership or parity")
    generator = summary.get("generator", {})
    projected = summary.get("source_mapping_projection") is not None
    if not projected:
        for name, digest in ((generator.get("path"), generator.get("sha256")),
                             (generator.get("candidate_parser_path"), generator.get("candidate_parser_sha256"))):
            path = reference_path(name or "", root)
            findings.require(path.is_file() and hashlib.sha256(path.read_bytes()).hexdigest() == digest,
                             "diagnostic_ownership", f"Stale diagnostic discovery tool: {name}")
    inventory = summary.get("inventory", {})
    path = reference_path(inventory.get("path", ""), root)
    if not path.is_file():
        findings.require(not projected, "diagnostic_ownership",
                         "A source-map projection requires its frozen native inventory for validation")
        findings.warn("disposable_inventory_absent", "Recreate diagnostic ownership inventory before examining decoded leads")
        return
    findings.require(hashlib.sha256(path.read_bytes()).hexdigest() == inventory.get("sha256"),
                     "inventory_integrity", "Decoded diagnostic inventory differs from retained digest")
    bulk = json.loads(path.read_text())
    same_target(bulk, target, "diagnostic-ownership inventory", findings)
    findings.require(bulk.get("counts") == counts and bulk.get("generator") == generator,
                     "diagnostic_ownership", "Decoded diagnostic inventory disagrees with its summary")
    if projected:
        try:
            from script_sources import load_script
            projection = load_script("diagnostic_projection_validation", "scripts/discover-native-ownership.py", root)
            projection.validate_source_mapping_projection(summary, bulk, systems, root)
        except (OSError, ValueError, KeyError, TypeError, subprocess.CalledProcessError) as error:
            findings.require(False, "diagnostic_ownership", "Invalid diagnostic source-map projection: " + str(error))
    checked = set()
    for row in bulk.get("diagnostics", []):
        for ref in row.get("verified_references", []):
            at = int(ref["owner_file_offset"], 16)
            length = ref["owner_byte_count"]
            key = (at, length, ref["owner_sha256"])
            if key not in checked:
                raw = data[at:at + length]
                findings.require(at >= 0 and length > 0 and len(raw) == length and hashlib.sha256(raw).hexdigest() == key[2],
                                 "native_range", "Decoded diagnostic owner bytes differ from selected target")
                checked.add(key)


def validate_instruction_summary(record, target, pe_counts, findings, root=ROOT):
    """Validate linear decode accounting without equating it to native recovery."""
    same_target(record, target, "instruction-summary", findings)
    counts = record.get("counts", {})
    numeric = ("unwind_extents", "processed_extents", "pending_extents", "completely_decoded_extents",
               "extents_with_undecoded_suffix", "linear_instruction_records", "decoded_bytes_summed",
               "decoded_bytes_union", "undecoded_suffix_bytes_summed", "executable_bytes_outside_unwind_extents")
    findings.require(all(type(counts.get(key)) is int and counts[key] >= 0 for key in numeric),
                     "instruction_coverage", "Instruction counts must be nonnegative integers")
    complete = record.get("declared_extent_pass_complete") is True
    findings.require(complete and counts.get("unwind_extents") == pe_counts.get("runtime_function_records")
                     and counts.get("processed_extents") == counts.get("unwind_extents")
                     and counts.get("pending_extents") == 0,
                     "instruction_coverage", "Instruction summary is not a complete selected-target declared-extent pass")
    findings.require(counts.get("completely_decoded_extents", -1) + counts.get("extents_with_undecoded_suffix", -1)
                     == counts.get("processed_extents"), "instruction_coverage", "Decoded/undecoded extent counts differ")
    findings.require(0 <= counts.get("decoded_bytes_union", -1) <= counts.get("decoded_bytes_summed", -1),
                     "instruction_coverage", "Invalid linear decoded byte accounting")
    findings.require(counts.get("executable_bytes_outside_unwind_extents") == pe_counts.get("executable_bytes_outside_runtime_function_extents"),
                     "instruction_coverage", "Instruction summary omits executable bytes outside unwind records")
    findings.require(record.get("native_semantics_complete") is False and record.get("parity_verified") is False
                     and 41 in record.get("gap_ids", []) and bool(record.get("limits")),
                     "completion_claim", "Linear decode cannot certify native completeness or parity; retain #41")
    generator = record.get("generator", {})
    for path, expected in ((generator.get("path"), generator.get("sha256")),
                           ("scripts/inventory-executable.py", generator.get("parser_sha256"))):
        try:
            from script_sources import historical_matches
            valid = path is not None and (file_sha256(reference_path(path, root)) == expected
                                          or historical_matches(path, expected, root))
        except (ValueError, OSError, TypeError):
            valid = False
        findings.require(valid, "instruction_generator", "Instruction census tool/parser hash differs")
    try:
        inventory = record["inventory"]
        path = reference_path(inventory["path"], root)
        findings.require(path.is_relative_to(root / "runtime"), "instruction_inventory", "Instruction database must stay under runtime")
        if path.exists():
            findings.require(file_sha256(path) == inventory["sha256"], "instruction_inventory", "Instruction database digest differs")
        else:
            findings.warn("disposable_inventory_absent", "Recreate native instruction database before querying reference leads")
    except (KeyError, ValueError, TypeError):
        findings.require(False, "instruction_inventory", "Missing/invalid project-local native instruction inventory")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="read-only check (the default)")
    parser.add_argument("--json", action="store_true", help="print the complete report as JSON")
    parser.add_argument("--delivery", action="store_true", help="also require durable source/evidence references in Git's index")
    parser.add_argument("--output", type=project_path, help="optionally save report under ignored runtime/")
    args = parser.parse_args()
    if args.output and not args.output.is_relative_to(ROOT / "runtime"):
        parser.error("Saved checker output must be inside runtime/")
    findings = Findings()
    result = {"schema_version": 1, "meaning": "Accounting consistency only; source completeness and parity are not certified."}
    try:
        register = finding_register(ROOT)
        gap_ids = set(register)
        result['finding_registers'] = {
            'source': sum('source' in owners for owners in register.values()),
            'verification': sum('verification' in owners for owners in register.values()),
            'permanent_ids': len(register), 'next_id': max(register, default=0) + 1,
        }
        target = latest_target(verify=True)
        result["target"] = target
        footer_check = subprocess.run(
            ["python3", "-B", str(ROOT / "scripts/recover-menu-identity.py"), "--check"],
            cwd=ROOT, text=True, capture_output=True,
        )
        findings.require(footer_check.returncode == 0, "picker_footer_identity",
                         (footer_check.stderr or footer_check.stdout).strip())
        systems = load_json(ROOT / COVERAGE / "systems.json")
        summary = load_json(ROOT / COVERAGE / "native-summary.json")
        changelog = load_json(ROOT / COVERAGE / "changelog.json")
        same_target(summary, target, "native-summary", findings)
        # Structural byte accounting is independent of instruction/native-body
        # coverage. Reproduce all file ranges and Data identities when selected;
        # no section/whole-file hash stands in for the disjoint ledger.
        range_path = ROOT / COVERAGE / "file-range-summary.json"
        findings.require(range_path.is_file(), "file_range_reproduction", "Missing current-target file-range summary")
        if range_path.exists():
            range_summary = load_json(range_path)
            same_target(range_summary, target, "file-range-summary", findings)
            range_check = subprocess.run(["python3", "-B", str(ROOT / "scripts/inventory-target-ranges.py"), "--check"],
                                         cwd=ROOT, text=True, capture_output=True)
            findings.require(range_check.returncode == 0, "file_range_reproduction",
                             (range_check.stderr or range_check.stdout).strip()[-1800:])
            result["file_ranges"] = range_summary.get("counts", {})
        data = target_bytes(target)
        result["systems"] = validate_systems(systems, target, data, gap_ids, findings)
        result["changelog"] = validate_changelog(changelog, target, systems, gap_ids, findings)
        validate_summary(summary, systems, result["systems"]["diagnostic_paths"], findings)
        instructions_path = ROOT / COVERAGE / "instruction-summary.json"
        if instructions_path.exists():
            instructions = load_json(instructions_path)
            validate_instruction_summary(instructions, target, summary.get("counts", {}), findings)
            result["native_instructions"] = instructions
        complement_path = ROOT / COVERAGE / "unwind-complement-summary.json"
        if complement_path.exists():
            findings.require(instructions_path.exists(), "complement_input", "Complement lacks its declared-extent parent summary")
            if instructions_path.exists():
                spec = importlib.util.spec_from_file_location("coverage_complement_check", ROOT / "scripts/check-unwind-complement.py")
                complement_check = importlib.util.module_from_spec(spec)
                spec.loader.exec_module(complement_check)
                complement = load_json(complement_path)
                complement_check.validate(complement, target, instructions, data, findings)
                result["unwind_complement"] = complement.get("counts", {})
        ownership_path = ROOT / COVERAGE / "diagnostic-ownership.json"
        if ownership_path.exists():
            ownership = load_json(ownership_path)
            validate_diagnostic_ownership(ownership, target, systems, data, findings)
            result["diagnostic_ownership"] = ownership.get("counts", {})
        seeded_path = ROOT / COVERAGE / "seeded-census.json"
        if seeded_path.exists():
            spec = importlib.util.spec_from_file_location("coverage_seeded_check", ROOT / "scripts/summarize-seeded-census.py")
            seeded_check = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(seeded_check)
            seeded = load_json(seeded_path)
            seeded_check.validate_summary(seeded, target, systems, data, findings)
            result["selected_ghidra_bodies"] = seeded.get("counts", {})
        spec=importlib.util.spec_from_file_location('coverage_full_native_check',ROOT/'scripts/check-full-image-native.py')
        full_native=importlib.util.module_from_spec(spec);spec.loader.exec_module(full_native)
        native_selection=systems.get('native_census',{})
        result['full_image_native']=full_native.validate(target,findings,required=bool(native_selection.get('streaming_census_record') or native_selection.get('selector_ref')),image=data)
        if args.delivery:
            tracked = set(subprocess.check_output(["git", "ls-files", "-z"], cwd=ROOT).decode().split("\0"))
            refs = {ref for row in systems["systems"] for group in ("source_refs", "evidence_refs") for ref in row.get(group, [])}
            refs.update(ref for claim in changelog["entries"] for group in ("source_refs", "evidence_refs") for ref in claim.get(group, []))
            if seeded_path.exists():
                refs.add(seeded_path.relative_to(ROOT).as_posix())
                refs.update(seeded["generator"])
            for ref in sorted(refs):
                path = reference_path(ref).relative_to(ROOT).as_posix()
                findings.require(path in tracked, "source_delivery", f"Referenced file is absent from Git index: {path}")
        # Reparse the supplied text rather than trusting the recorded claim count.
        check = subprocess.run(["python3", "-B", str(ROOT / "scripts/index-current-changelog.py"), "--check"], cwd=ROOT, text=True, capture_output=True)
        findings.require(check.returncode == 0, "changelog_reproduction", (check.stderr or check.stdout).strip()[-1800:])
        # Raw inventories are disposable. If present, require the retained digest;
        # their absence does not erase the compact current-target coverage record.
        inventory = summary.get("inventory", {})
        inventory_path = inventory.get("path") or summary.get("inventory_path")
        inventory_sha = inventory.get("sha256") or summary.get("inventory_sha256")
        if inventory_path:
            path = reference_path(inventory_path)
            if path.exists():
                findings.require(bool(inventory_sha) and file_sha256(path) == inventory_sha, "inventory_integrity", "Runtime native inventory differs from retained digest")
            else:
                findings.warn("disposable_inventory_absent", "Recreate runtime native inventory before deeper native coverage queries")
        result["native_coverage"] = {"counts": summary.get("counts", {}),
                                     "native_analysis": summary.get("native_analysis", {}),
                                     "residual_unknowns": summary.get("residual_unknowns", []),
                                     "ownership_complete": summary.get("ownership_complete", False),
                                     "parity_verified": summary.get("parity_verified", False)}
    except (ValueError, OSError, KeyError, TypeError, json.JSONDecodeError) as error:
        findings.require(False, "input", str(error))
    result.update(status="failed" if findings.errors else "consistent_with_open_work", checks=dict(sorted(findings.counts.items())), errors=findings.errors, warnings=findings.warnings)
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(result, indent=2) + "\n")
    if args.json:
        print(json.dumps(result, indent=2))
    else:
        target = result.get("target", {})
        print(f"Coverage accounting: {result['status']} ({target.get('version', 'unresolved target')})")
        print(json.dumps({"systems": result.get("systems"), "changelog": result.get("changelog"), "errors": len(findings.errors), "open_work_warnings": len(findings.warnings)}))
        for error in findings.errors:
            print(f"ERROR {error['category']}: {error['detail']}")
        stale = [item for item in findings.warnings if item["category"] == "stale_source_review"]
        for item in stale:
            print(f"REVIEW {item['detail']}")
        print("Unrecovered native behavior and runtime/UI parity remain open; inspect --json for details.")
    return 1 if findings.errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
