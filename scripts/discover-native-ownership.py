#!/usr/bin/env python3
"""Discover instruction-verified diagnostic ownership leads for the newest EXE.

Rust Location records and RIP-relative LEA patterns are candidates until decoded
from their enclosing PE unwind extent. This pass checks those candidates with
Capstone, retaining operand/site/range identities. Neither a diagnostic reference
nor a decoded instruction certifies native/source semantic correspondence.
Bulk findings stay below runtime/; --write also emits a compact durable summary.
No compiler, application, network access or Ghidra process is invoked here.

--rebind-source-map joins reviewed current IDs into the compact summary only.
Fresh --write/--check still decode all candidates. Exact native-fact equality
preserves a frozen inventory and its original producer, while a separate current
verification witness records the fresh decoder/tool identity.
"""

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess

from coverage_common import ROOT, file_sha256, json_text, latest_target, project_path, target_bytes


SUMMARY = ROOT / "docs/analysis/coverage/diagnostic-ownership.json"
SOURCE_MAPPING = ROOT / "docs/analysis/coverage/systems.json"


def native_facts(payload):
    """Remove only producer identity and contextual source-map labels."""
    result = json.loads(json.dumps(payload))
    result.pop("generator", None)
    for row in result["diagnostics"]:
        row.pop("system_id", None)
    return result


def execution_sources(generator, root=ROOT):
    """Find exact committed bytes for the original native producer, not this join."""
    result = []
    for name, expected in ((generator["path"], generator["sha256"]),
                           (generator["candidate_parser_path"], generator["candidate_parser_sha256"])):
        if not name.startswith("scripts/") or ".." in Path(name).parts:
            raise ValueError("Invalid original diagnostic producer path")
        history = subprocess.run(["git", "log", "--format=%H", "HEAD", "--", name],
                                 cwd=root, capture_output=True, text=True, check=True)
        for commit in history.stdout.splitlines():
            raw = subprocess.run(["git", "cat-file", "blob", commit + ":" + name],
                                 cwd=root, capture_output=True, check=True).stdout
            if hashlib.sha256(raw).hexdigest() == expected:
                result.append(dict(path=name, sha256=expected, git_commit=commit))
                break
        else:
            raise ValueError("Exact committed diagnostic producer is unavailable: " + name)
    return result


def validate_execution_sources(generator, sources, root=ROOT):
    expected = {(generator["path"], generator["sha256"]),
                (generator["candidate_parser_path"], generator["candidate_parser_sha256"])}
    if (not isinstance(sources, list) or len(sources) != len(expected)
            or {(row.get("path"), row.get("sha256")) for row in sources} != expected):
        raise ValueError("Diagnostic native producer commitments differ")
    for row in sources:
        name, commit = row["path"], row.get("git_commit", "")
        if (not name.startswith("scripts/") or ".." in Path(name).parts
                or re.fullmatch(r"[0-9a-f]{40}", commit) is None):
            raise ValueError("Invalid diagnostic native producer commitment")
        raw = subprocess.run(["git", "cat-file", "blob", commit + ":" + name],
                             cwd=root, capture_output=True, check=True).stdout
        if hashlib.sha256(raw).hexdigest() != row["sha256"]:
            raise ValueError("Committed diagnostic native producer bytes differ: " + name)


def project_source_mapping(payload, inventory, systems, mapping_path, sources, *, root=ROOT,
                           fresh_verification=None):
    """Join current source IDs without rewriting frozen native facts or provenance."""
    if payload["target"] != systems["target"]:
        raise ValueError("Diagnostic source mapping belongs to another target")
    validate_execution_sources(payload["generator"], sources, root)
    mapping_path = Path(mapping_path).resolve()
    if not mapping_path.is_relative_to(root.resolve()):
        raise ValueError("Diagnostic source mapping escapes project")
    if json.loads(mapping_path.read_text()) != systems:
        raise ValueError("Diagnostic source mapping bytes differ from the reviewed input")
    custom = [row for row in payload["diagnostics"] if row["custom_game_crate"]]
    entries = [row for row in systems["systems"] if row.get("original_path") is not None]
    owners = {row["original_path"]: row["id"] for row in entries}
    if (len(owners) != len(entries) or len(set(owners.values())) != len(owners)
            or any(not isinstance(value, str) or not value for value in owners.values())
            or set(owners) != {row["path"] for row in custom}
            or len(custom) != len(owners)):
        raise ValueError("Diagnostic source mapping must own every custom path exactly once")
    compact = [{"path": row["path"], "system_id": owners[row["path"]],
                "verified_instruction_references": len(row["verified_references"]),
                "candidate_native_owner_count": len(row["candidate_native_owners"]),
                "unverified_byte_candidates": len(row["unverified_candidates"])} for row in custom]
    if (payload["counts"]["custom_diagnostic_paths"] != len(custom)
            or payload["native_source_ownership_complete"] is not False
            or payload["parity_verified"] is not False):
        raise ValueError("Invalid diagnostic native population or completion claim")
    tool = "scripts/discover-native-ownership.py"
    projection = {"format": "diagnostic-source-map-projection-v1",
                  "generator": {"path": tool, "sha256": hashlib.sha256((root / tool).read_bytes()).hexdigest()},
                  "source_mapping": {"path": mapping_path.relative_to(root.resolve()).as_posix(),
                                     "sha256": hashlib.sha256(mapping_path.read_bytes()).hexdigest()},
                  "native_execution_sources": sources,
                  "native_fact_sha256": hashlib.sha256(json_text(native_facts(payload)).encode()).hexdigest(),
                  "scope": "Current system IDs/custom membership only; frozen native payload and original producer remain unchanged. No source or semantic proof is promoted."}
    summary = {"schema_version": payload["schema_version"], "target": payload["target"],
               "generator": payload["generator"], "inventory": inventory,
               "counts": payload["counts"], "custom_diagnostics": compact,
               "engine_paths_with_verified_references": sum(not row["custom_game_crate"] and bool(row["verified_references"])
                                                             for row in payload["diagnostics"]),
               "limits": payload["limits"], "native_source_ownership_complete": False,
               "parity_verified": False, "source_mapping_projection": projection}
    if fresh_verification is not None:
        witness = fresh_verification.get("generator", {})
        if (set(fresh_verification) != {"generator", "native_fact_sha256", "method"}
                or set(witness) != set(payload["generator"])
                or {key: witness.get(key) for key in ("path", "sha256")} != projection["generator"]
                or witness.get("candidate_parser_path") != "scripts/inventory-executable.py"
                or witness.get("candidate_parser_sha256") != hashlib.sha256((root / "scripts/inventory-executable.py").read_bytes()).hexdigest()
                or not witness.get("decoder") or not witness.get("decoder_version")
                or fresh_verification["native_fact_sha256"] != projection["native_fact_sha256"]
                or fresh_verification["method"] != "fresh_decode_exact_native_fact_comparison"):
            raise ValueError("Invalid current diagnostic verification witness")
        summary["fresh_native_verification"] = fresh_verification
    return summary


def validate_source_mapping_projection(summary, payload, systems, root=ROOT):
    projection = summary.get("source_mapping_projection", {})
    if projection.get("format") != "diagnostic-source-map-projection-v1":
        raise ValueError("Invalid diagnostic source-map projection")
    mapping = projection.get("source_mapping", {})
    path = (root / mapping.get("path", "")).resolve()
    if not path.is_relative_to(root.resolve()) or not path.is_file():
        raise ValueError("Diagnostic source-map input is absent or outside project")
    if hashlib.sha256(path.read_bytes()).hexdigest() != mapping.get("sha256"):
        raise ValueError("Diagnostic source-map input changed")
    expected = project_source_mapping(payload, summary["inventory"], systems, path,
                                      projection.get("native_execution_sources"), root=root,
                                      fresh_verification=summary.get("fresh_native_verification"))
    if summary != expected:
        raise ValueError("Diagnostic source-map projection changed native facts or join metadata")


def parser_module():
    spec = importlib.util.spec_from_file_location("native_ownership_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def decode_candidates(pe, rows, locations, decoder):
    """Decode each enclosing unwind extent once, keeping failed sites explicit."""
    requests = {}
    results = {}
    for path in sorted(rows):
        candidates = [("path_literal", row, None) for row in rows[path]]
        for location in locations[path]:
            candidates.extend(("rust_location", row, location)
                              for row in location["rip_relative_lea_candidates"])
        results[path] = {"verified_references": [], "unverified_candidates": []}
        for kind, row, location in candidates:
            item = {"kind": kind, **row}
            if location is not None:
                item.update(source_line=location["source_line"], source_column=location["source_column"],
                            path_address=location["path_address"])
            key = (row.get("runtime_function_start"), row.get("runtime_function_end"))
            if key[0] is None:
                item["reason"] = "outside_declared_unwind_extent"
                results[path]["unverified_candidates"].append(item)
            else:
                requests.setdefault(key, []).append((path, item))
    byte_count, instruction_count = 0, 0
    for (start, end), items in sorted(requests.items()):
        start, end = int(start, 16), int(end, 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = pe.data[offset:offset + end - start]
        if len(raw) != end - start:
            raise ValueError("Truncated native owner extent")
        instructions = list(decoder.disasm(raw, start))
        by_site = {ins.address: ins for ins in instructions}
        instruction_count += len(instructions)
        byte_count += sum(ins.size for ins in instructions)
        body_sha = hashlib.sha256(raw).hexdigest()
        for path, item in items:
            ins = by_site.get(int(item["instruction_address"], 16))
            expected = int(item["target_address"], 16)
            # Capstone x86 constants are stable operand tags; checking the exact
            # operand prevents accepting a LEA-shaped byte sequence inside an
            # immediate, jump table, or another instruction.
            valid = (ins is not None and ins.mnemonic == "lea" and len(ins.operands) == 2
                     and ins.operands[1].type == 3
                     and ins.reg_name(ins.operands[1].mem.base) == "rip"
                     and ins.address + ins.size + ins.operands[1].mem.disp == expected)
            if not valid:
                item["reason"] = "not_matching_decoded_rip_lea_from_unwind_start"
                results[path]["unverified_candidates"].append(item)
                continue
            item.update(instruction_bytes=ins.bytes.hex(), instruction=f"{ins.mnemonic} {ins.op_str}",
                        owner_file_offset=hex(offset), owner_byte_count=len(raw), owner_sha256=body_sha)
            results[path]["verified_references"].append(item)
    return results, {"candidate_unwind_extents_decoded": len(requests),
                     "instructions_in_candidate_extents": instruction_count,
                     "decoded_bytes_summed_across_candidate_extents": byte_count}


def discover(capstone, source_mapping=SOURCE_MAPPING):
    target = latest_target(verify=True)
    module = parser_module()
    pe = module.PE(target_bytes(target))
    # Reuse the PE/candidate format implementation, not historical target data.
    spec = importlib.util.spec_from_file_location("native_ownership_inventory", ROOT / "scripts/inventory-current-target.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    paths = inventory.diagnostic_paths(pe)
    by_path = {row["path"]: [int(v["file_offset"], 16) for v in row["occurrences"]] for row in paths}
    refs, locations = module.source_references(pe, by_path)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    discovered, counts = decode_candidates(pe, refs, locations, decoder)
    systems = json.loads(source_mapping.read_text())
    owners = {row["original_path"]: row["id"] for row in systems["systems"] if row.get("original_path")}
    compact = []
    for row in paths:
        name = row["path"]
        found = discovered[name]
        bodies = sorted({item["runtime_function_start"] for item in found["verified_references"]})
        entry = {"path": name, "custom_game_crate": row["custom_game_crate"],
                 "system_id": owners.get(name, "engine-selected-target-deltas"),
                 "diagnostic_occurrences": row["occurrences"],
                 "location_records": [{k: v for k, v in loc.items() if k != "rip_relative_lea_candidates"}
                                      for loc in locations[name]],
                 **found, "candidate_native_owners": bodies,
                 "native_source_semantics_established": False}
        discovered[name] = entry
        compact.append({"path": name, "system_id": entry["system_id"],
                        "verified_instruction_references": len(found["verified_references"]),
                        "candidate_native_owner_count": len(bodies),
                        "unverified_byte_candidates": len(found["unverified_candidates"])})
    counts.update(diagnostic_paths=len(paths), custom_diagnostic_paths=sum(row["custom_game_crate"] for row in paths),
                  verified_instruction_references=sum(len(row["verified_references"]) for row in discovered.values()),
                  paths_with_verified_references=sum(bool(row["verified_references"]) for row in discovered.values()),
                  custom_paths_with_verified_references=sum(row["custom_game_crate"] and bool(row["verified_references"])
                                                           for row in discovered.values()),
                  unverified_candidates=sum(len(row["unverified_candidates"]) for row in discovered.values()))
    selected = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    generator = {"path": "scripts/discover-native-ownership.py", "sha256": file_sha256("scripts/discover-native-ownership.py"),
                 "candidate_parser_path": "scripts/inventory-executable.py",
                 "candidate_parser_sha256": file_sha256("scripts/inventory-executable.py"),
                 "decoder": "Capstone", "decoder_version": capstone.__version__}
    limits = ["LEA candidates are decoded from declared unwind starts; undiscovered leaf, inline and dynamically generated code remain unknown.",
              "A decoded linear instruction is not proof its block executes. Extent byte totals may overlap and are not whole-image instruction coverage.",
              "Diagnostic references associate a body with a diagnostic path, not its complete source owner, behavior, call graph or reconstruction status.",
              "Only selected RIP-relative LEA forms and native Rust Location records are searched; immediate, indirect, global and other instruction/data-reference forms remain open.",
              "Current systems provide source ownership questions; no whole-system, individual changelog claim, runtime or parity status is promoted by this pass."]
    payload = {"schema_version": 1, "target": selected, "generator": generator, "counts": counts,
               "diagnostics": list(discovered.values()), "limits": limits,
               "native_source_ownership_complete": False, "parity_verified": False}
    output = ROOT / "runtime/coverage" / target["sha256"] / "diagnostic-ownership.json"
    serialized = json_text(payload)
    summary = {"schema_version": 1, "target": selected, "generator": generator,
               "inventory": {"path": output.relative_to(ROOT).as_posix(),
                             "sha256": hashlib.sha256(serialized.encode()).hexdigest(),
                             "regenerate": "python3 -B scripts/discover-native-ownership.py --write"},
               "counts": counts, "custom_diagnostics": [row for row in compact if owners.get(row["path"])],
               "engine_paths_with_verified_references": sum(not row["custom_game_crate"] and bool(row["verified_references"])
                                                             for row in discovered.values()),
               "limits": limits, "native_source_ownership_complete": False, "parity_verified": False}
    return output, serialized, summary


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    mode.add_argument("--rebind-source-map", action="store_true",
                      help="Publish only current source-ID metadata against the frozen native inventory")
    parser.add_argument("--source-mapping", type=project_path, default=SOURCE_MAPPING)
    args = parser.parse_args()
    try:
        previous = json.loads(SUMMARY.read_text()) if SUMMARY.is_file() else None
        if args.rebind_source_map:
            if previous is None:
                raise ValueError("Source rebinding requires an existing native inventory")
            target = latest_target(verify=True)
            if previous["target"] != {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}:
                raise ValueError("Source rebinding requires the exact installed target")
            output = project_path(previous["inventory"]["path"])
            if file_sha256(output) != previous["inventory"]["sha256"]:
                raise ValueError("Frozen diagnostic inventory bytes changed")
            payload = json.loads(output.read_text())
            sources = previous.get("source_mapping_projection", {}).get("native_execution_sources") or execution_sources(payload["generator"])
            summary = project_source_mapping(payload, previous["inventory"], json.loads(args.source_mapping.read_text()),
                                             args.source_mapping, sources)
            SUMMARY.write_text(json_text(summary))
        else:
            import capstone
            output, serialized, summary = discover(capstone, args.source_mapping)
            if output.is_file() and previous is not None:
                if file_sha256(output) != previous["inventory"]["sha256"]:
                    raise ValueError("Frozen diagnostic inventory bytes changed")
                retained = json.loads(output.read_text())
                fresh = json.loads(serialized)
                if native_facts(retained) != native_facts(fresh):
                    raise ValueError("Diagnostic native facts changed; preserve the frozen census input and review a new native profile")
                if output.read_text() != serialized or previous.get("source_mapping_projection"):
                    sources = previous.get("source_mapping_projection", {}).get("native_execution_sources") or execution_sources(retained["generator"])
                    witness = {"generator": fresh["generator"],
                               "native_fact_sha256": hashlib.sha256(json_text(native_facts(fresh)).encode()).hexdigest(),
                               "method": "fresh_decode_exact_native_fact_comparison"}
                    if args.check and previous.get("fresh_native_verification") and previous["fresh_native_verification"] != witness:
                        raise ValueError("Diagnostic fresh verification toolchain changed; review and republish the metadata projection")
                    summary = project_source_mapping(retained, previous["inventory"], json.loads(args.source_mapping.read_text()),
                                                     args.source_mapping, sources,
                                                     fresh_verification=witness if args.write else previous.get("fresh_native_verification"))
                    serialized = output.read_text()
        if args.write:
            output.parent.mkdir(parents=True, exist_ok=True)
            if not output.is_file() or output.read_text() != serialized:
                output.write_text(serialized)
            SUMMARY.write_text(json_text(summary))
        if args.check:
            if not output.exists() or output.read_text() != serialized or not SUMMARY.exists() or SUMMARY.read_text() != json_text(summary):
                raise ValueError("Missing/stale diagnostic ownership; regenerate with --write using the recorded Capstone version")
        print(json_text({"target": summary["target"], "counts": summary["counts"],
                         "native_source_ownership_complete": False}), end="")
    except ImportError:
        parser.exit(1, "Install Capstone 5.0.9 for this optional static analysis, or expose an existing installation through PYTHONPATH.\n")
    except (OSError, ValueError, KeyError, TypeError, subprocess.CalledProcessError) as error:
        parser.exit(1, str(error) + "\n")


if __name__ == "__main__":
    main()
