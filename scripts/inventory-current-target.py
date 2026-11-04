#!/usr/bin/env python3
"""Deterministic whole-file static PE census of the latest supplied game target.

Default prints a compact report without writing. --write stores the regenerable
inventory under ignored runtime/ and its compact summary under docs/. --check
recomputes both and fails on drift. No decoder, compiler or application runs.
Ghidra decoding/reference discovery is separately resumable with
census-current-target.py; byte-pattern candidates are never decoded facts.
"""

import argparse
from collections import Counter
import hashlib
import importlib.util
import json
import re
import struct
import sys

from coverage_common import ROOT, file_sha256, json_text, latest_target, project_path, target_bytes
from shared_analysis import SharedAnalysis

SUMMARY = ROOT / "docs/analysis/coverage/native-summary.json"
GENERATOR = "scripts/inventory-current-target.py"


def digest(value):
    return hashlib.sha256(value).hexdigest()


def pe_parser(data):
    # Reuse only this historical script's format parser, never its version-bound
    # inventories, RVAs, names or behavioral assumptions.
    spec = importlib.util.spec_from_file_location("historical_pe_format", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module.PE(data)


def exports(pe):
    rva, size = pe.directories[0]
    if not rva:
        return []
    at = pe.rva_offset(rva)
    _, _, _, _, _, base, count, name_count, functions, names, ordinals = struct.unpack_from("<IIHHIIIIIII", pe.data, at)
    if max(count, name_count) > len(pe.data) // 4:
        raise ValueError("Implausible export count")
    labels = {}
    for index in range(name_count):
        name_rva = pe.u32(pe.rva_offset(names) + 4 * index)
        ordinal = pe.u16(pe.rva_offset(ordinals) + 2 * index)
        labels.setdefault(ordinal, []).append(pe.cstr(pe.rva_offset(name_rva)))
    rows = []
    for index in range(count):
        address = pe.u32(pe.rva_offset(functions) + 4 * index)
        if address:
            rows.append({"ordinal": base + index, "names": labels.get(index, []), "rva": hex(address),
                         "forwarder": pe.cstr(pe.rva_offset(address)) if rva <= address < rva + size else None})
    return rows


def relocations(pe):
    """PE-declared address-fixup sites, not all memory accesses or code xrefs."""
    rva, size = pe.directories[5]
    if not rva:
        return [], Counter()
    position, end = pe.rva_offset(rva), pe.rva_offset(rva) + size
    rows, counts = [], Counter()
    while position < end:
        if end - position < 8:
            raise ValueError("Truncated base relocation block")
        page, length = struct.unpack_from("<II", pe.data, position)
        if length < 8 or length % 2 or position + length > end:
            raise ValueError("Malformed base relocation block length")
        for at in range(position + 8, position + length, 2):
            entry = pe.u16(at)
            kind, site = entry >> 12, page + (entry & 0xFFF)
            counts[str(kind)] += 1
            if kind == 0:  # IMAGE_REL_BASED_ABSOLUTE is padding.
                continue
            value = pe.u64(pe.rva_offset(site)) if kind == 10 else None
            rows.append([site, kind, value])
        position += length
    return rows, counts


def location(pe, at, raw):
    address = pe.offset_va(at)
    return {"file_offset": hex(at), "virtual_address": hex(address) if address is not None else None,
            "byte_count": len(raw), "sha256": digest(raw)}


def diagnostic_paths(pe):
    paths = {}
    pattern = rb"crates[\\/][A-Za-z0-9_.-]+[\\/]src[\\/][A-Za-z0-9_.\\/\-]+\.rs"
    for match in re.finditer(pattern, pe.data):
        name = match[0].decode("ascii").replace("\\", "/")
        paths.setdefault(name, []).append(location(pe, match.start(), match[0]))
    return [{"path": name, "custom_game_crate": name.startswith(("crates/wenilla-rogue/", "crates/wenilla-rogue-app/")),
             "classification": "custom_game_diagnostic" if name.startswith(("crates/wenilla-rogue/", "crates/wenilla-rogue-app/"))
             else "engine_or_other_crate_diagnostic_not_ownership_proof", "occurrences": occurrences}
            for name, occurrences in sorted(paths.items())]


def candidates(pe):
    patterns = {
        "module_type_namespace": rb"(?:wenilla|benilla|azeroth)[A-Za-z0-9_]*(?:::[A-Za-z_][A-Za-z0-9_]*)+",
        "game_binding_identifier": rb"\b(?:AZS_|SURVIVORS_)[A-Za-z0-9_]+",
        "lua_ui_registration": rb"\b(?:CreateFrame|RegisterEvent|RegisterForClicks|SetScript|SetAttribute|OnEvent|OnUpdate|OnClick|OnLoad)\b",
        "textual_id_assignment": rb"\b[A-Za-z_][A-Za-z0-9_]*(?:Id|ID|_id)\s*=\s*[0-9]+\b",
        "textual_numeric_id": rb"\b(?:spell|item|display|creature|entry|map|zone)[_ -]?(?:id)?[=: ]+[0-9]+\b",
        # Rust concatenates non-NUL-terminated string literals; word boundaries
        # would hide real packed keys such as characters.txt and talentxp.
        "save_configuration_key_lead": rb"(?:characters\.txt|talentxp|RunMods|GetRunState|GetRunSchedule|config\.(?:json|toml|txt)|settings\.(?:json|toml|txt))",
        "resource_path": rb"[A-Za-z0-9_./\\-]{2,}\.(?:MPQ|mpq|blp|m2|M2|wdt|adt|wmo|dbc|lua|xml)\b",
        "lua_function_declaration": rb"\bfunction[ \t]+[A-Za-z_][A-Za-z0-9_.:]*[ \t]*\(",
    }
    result = {}
    for kind, pattern in patterns.items():
        rows = []
        for match in re.finditer(pattern, pe.data):
            row = location(pe, match.start(), match[0])
            row["literal"] = match[0].decode("ascii")
            rows.append(row)
        result[kind] = rows
    return result


def covered_bytes(records, start, end):
    intervals = sorted((max(a, start), min(b, end)) for a, b, _ in records if a < end and b > start)
    total, cursor = 0, start
    for a, b in intervals:
        if b > max(a, cursor):
            total += b - max(a, cursor)
        cursor = max(cursor, b)
    return total


def inventory():
    target = latest_target()
    selected = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    pe = pe_parser(target_bytes(target))
    sections = []
    for section in pe.sections:
        at, size = section["raw_offset"], section["raw_size"]
        if len(pe.data[at:at + size]) != size:
            raise ValueError("Truncated PE section")
        sections.append({**section, "sha256": digest(pe.data[at:at + size]),
                         "executable": bool(int(section["characteristics"], 16) & 0x20000000)})
    if pe.directories[3][1] % 12:
        raise ValueError("Malformed AMD64 exception-directory length")
    functions = pe.functions()
    for start, end, unwind in functions:
        if end <= start or not unwind:
            raise ValueError("Invalid AMD64 runtime-function extent")
        pe.rva_offset(start)
        pe.rva_offset(end - 1)
    relocation_records, relocation_counts = relocations(pe)
    paths = diagnostic_paths(pe)
    leads = candidates(pe)
    code_bytes = sum(section["virtual_size"] for section in sections if section["executable"])
    extent_bytes = sum(covered_bytes(functions, section["rva"], section["rva"] + section["virtual_size"])
                       for section in sections if section["executable"])
    result = {
        "schema_version": 1, "target": selected,
        "generator": {"path": GENERATOR, "sha256": file_sha256(GENERATOR),
                      "pe_parser_path": "scripts/inventory-executable.py",
                      "pe_parser_sha256": file_sha256("scripts/inventory-executable.py")},
        "pe": {"machine": hex(pe.machine), "image_base": hex(pe.image_base),
               "entry_point_rva": hex(pe.u32(pe.optional + 16)), "sections": sections,
               "directories": [{"index": index, "rva": hex(rva), "byte_count": size}
                               for index, (rva, size) in enumerate(pe.directories)],
               "imports": pe.imports(), "exports": exports(pe), "debug": pe.debug(),
               "runtime_function_records": {"columns": ["start_rva", "end_exclusive_rva", "unwind_info_rva"],
                                            "records": [list(row) for row in functions]},
               "base_relocation_records": {"columns": ["site_rva", "pe_relocation_type", "encoded_u64_for_DIR64_else_null"],
                                           "records": relocation_records}},
        "diagnostic_paths": paths, "embedded_candidates": leads,
        "counts": {"file_bytes": len(pe.data), "sections": len(sections), "runtime_function_records": len(functions),
                   "executable_virtual_bytes": code_bytes, "executable_bytes_inside_runtime_function_extents": extent_bytes,
                   "executable_bytes_outside_runtime_function_extents": code_bytes - extent_bytes,
                   "imports": sum(len(row["functions"]) for row in pe.imports()), "exports": len(exports(pe)),
                   "base_relocation_records_nonpadding": len(relocation_records), "relocation_types_including_padding": dict(sorted(relocation_counts.items())),
                   "diagnostic_paths": len(paths), "custom_game_diagnostic_paths": sum(row["custom_game_crate"] for row in paths),
                   "engine_or_other_crate_diagnostic_paths": sum(not row["custom_game_crate"] for row in paths),
                   "embedded_candidates": {kind: len(rows) for kind, rows in sorted(leads.items())}},
        "limits": [
            "Whole-file census describes supplied bytes and declared PE records, not all runtime memory states or complete systems.",
            "AMD64 .pdata records are unwind extents; leaf routines, inline code, merged/shared bodies and noncode cannot be assigned complete source ownership from them.",
            "PE base relocations identify declared fixup sites; DIR64 values are encoded address candidates, not decoded instructions, global readers/writers or complete xrefs.",
            "Diagnostic paths, namespaces, IDs, script and configuration patterns are nonexhaustive byte leads. Matches can occur in data or instruction bytes and need native/source review.",
            "All numeric values/IDs, globals, indirect dispatch, Lua/configuration formats and function semantics remain unclassified unless linked to reviewed native evidence.",
            "No compilation, target execution, gameplay, visual/UX comparison or old/new executable diff occurs here.",
        ],
    }
    output = ROOT / "runtime/coverage" / selected["sha256"] / "inventory.json"
    payload = json_text(result)
    summary = {"schema_version": 1, "target": selected,
               "inventory": {"path": output.relative_to(ROOT).as_posix(), "sha256": digest(payload.encode()),
                             "regenerate": "python3 scripts/inventory-current-target.py --write"},
               "counts": result["counts"], "methods": ["PE32+ headers/sections/imports/exports/debug/AMD64 unwind and base-relocation directories",
                         "whole-file diagnostic/source, module/type, game-binding, Lua/UI, save/configuration, textual numeric ID and resource-path byte candidates"],
               "native_analysis": {"status": "separate_resumable_census_required", "command": "python3 scripts/census-current-target.py --run --limit 10",
                                   "progress_path": f"runtime/coverage/{selected['sha256']}/ghidra/full-image-bounded-analysis/progress.json",
                                   "pipeline_sample_command": "python3 scripts/census-current-target.py --run --sample --limit 1",
                                   "pipeline_sample_progress_path": f"runtime/coverage/{selected['sha256']}/ghidra/sample-first-unwind-extent/progress.json",
                                   "decoded_instruction_coverage": "unknown_until_provider_records_are_present",
                                   "all_native_semantics_or_reference_edges_recovered": False},
               "residual_unknowns": result["limits"], "ownership_complete": False, "reconstruction_complete": False,
               "parity_verified": False}
    return output, payload, summary


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    args = parser.parse_args()
    try:
        output, payload, summary = inventory()
        if args.write:
            output.parent.mkdir(parents=True, exist_ok=True)
            SharedAnalysis(ROOT).publish_output(output, payload.encode("utf-8"))
            SUMMARY.parent.mkdir(parents=True, exist_ok=True)
            SUMMARY.write_text(json_text(summary), encoding="utf-8")
        elif args.check:
            if not output.exists() or output.read_text(encoding="utf-8") != payload:
                raise ValueError("Missing/stale regenerable current-target inventory; run --write")
            if not SUMMARY.exists() or SUMMARY.read_text(encoding="utf-8") != json_text(summary):
                raise ValueError("Stale tracked native-summary.json; run --write")
        print(json_text({"target": summary["target"], "counts": summary["counts"], "written": args.write,
                         "checked": args.check, "target_executed": False}).rstrip())
    except (ValueError, OSError, struct.error) as error:
        print(f"Current-target inventory error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
