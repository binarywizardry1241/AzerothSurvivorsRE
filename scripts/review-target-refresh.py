#!/usr/bin/env python3
"""Reproduce current whole-file changes and bounded embedded API evidence.

Byte/string equality never promotes historical native contracts or source parity.
All artifacts remain in the checkout; the configured installed EXE is read only.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

from coverage_common import (ROOT, file_sha256, installed_version, json_text, latest_target,
                             load_json, platform_descriptor_versions, project_path, target_bytes)


def review(previous_path):
    target = latest_target()
    current = load_json("docs/analysis/coverage/native-summary.json")
    if current["target"]["sha256"] != target["sha256"]:
        raise ValueError("Current inventory belongs to another target")
    previous = load_json(previous_path)
    inventories = []
    for summary in (previous, current):
        binding = summary["inventory"]
        if file_sha256(binding["path"]) != binding["sha256"]:
            raise ValueError("Whole-file inventory differs from its commitment")
        inventories.append(load_json(binding["path"]))
    before, after = inventories
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location("refresh_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)

    def span(at, count):
        raw = data[at:at + count]
        if at < 0 or len(raw) != count:
            raise ValueError("Truncated evidence range")
        return dict(file_offset=hex(at), virtual_address=hex(pe.offset_va(at)),
                    byte_count=count, sha256=hashlib.sha256(raw).hexdigest())

    version = target["version"].encode()
    if installed_version(data) != target["version"]:
        raise ValueError("Registered and embedded versions disagree")
    checker = version + b"\x1eupdate: up to date"
    def descriptor_span(row):
        return {**span(row["file_offset"], row["byte_count"]), "kind": row["kind"],
                "descriptor_file_offset": hex(row["descriptor_offset"])}
    if data.count(checker) == 1:
        updater = span(data.index(checker), len(checker))
    else:
        rows = platform_descriptor_versions(data, updater=True, details=True)
        if len(rows) != 1:
            raise ValueError("Updater identity is not unique")
        updater = descriptor_span(rows[0])
    rows = (platform_descriptor_versions(data, details=True)
            or platform_descriptor_versions(data, display=True, details=True))
    if len(rows) != 1:
        raise ValueError("Expected one mapped version/platform or version/display descriptor")
    descriptors = [descriptor_span(row) for row in rows]

    start_marker = b"\n\n-- Azeroth Survivors: the run for addons,"
    end_marker = b'AZSApiFrame:SetScript("OnEvent", AZS_ApiOnEvent);'
    if data.count(start_marker) != 1:
        raise ValueError("Embedded addon API start is ambiguous")
    start = data.index(start_marker)
    end = data.index(end_marker, start) + len(end_marker)
    api = data[start:end]
    api.decode("utf-8")
    # Packed literals follow the script without NUL separation; do not include
    # HUD_CVARS_LUA/AZS_OPENLEVELS in the retained Lua fragment.
    changes = {}
    for kind, rows in after["embedded_candidates"].items():
        old = {row["literal"] for row in before["embedded_candidates"][kind]}
        new = {row["literal"] for row in rows}
        changes[kind] = dict(added=sorted(new - old), removed=sorted(old - new),
                             same_distinct_literals=old == new)
    diagnostics = lambda inventory: {row["path"] for row in inventory["diagnostic_paths"] if row["custom_game_crate"]}
    imports = lambda inventory: {(row["library"].lower(), name)
        for row in inventory["pe"]["imports"] for name in row["functions"]}
    directory = f"docs/analysis/evidence/{target['version']}"
    report = dict(target=current["target"], previous_target=previous["target"],
        generator={"path": "scripts/review-target-refresh.py", "sha256": file_sha256(__file__)},
        inventories={"current": current["inventory"], "historical": previous["inventory"]},
        version_evidence={"updater": updater,
                          "platform_descriptors": descriptors},
        custom_paths_added=sorted(diagnostics(after) - diagnostics(before)),
        custom_paths_removed=sorted(diagnostics(before) - diagnostics(after)),
        candidate_changes=changes, import_library_function_sets_equal=imports(before) == imports(after),
        embedded_api={**span(start, len(api)), "canonical_extract": directory + "/embedded-api.lua",
                      "boundary": "Exact start comment through final event-handler registration; adjacent packed constants excluded.",
                      "native_dependencies_revalidated": False},
        limits="Full-file byte observations and bounded script extract only; source behavior, native dependencies and parity are not certified.")
    return report, api


def supplemental_scripts(path):
    """Read only explicitly selected, hash-bound Lua fragments from the EXE.

    The selection record is both the portable input plan and the retained
    receipt. This mode does not regenerate the whole-file discovery review.
    Markers delimit literal bytes, not native producer/loader behavior.
    """
    selected = load_json(path)
    target = latest_target()
    identity = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    if selected.get("target") != identity:
        raise ValueError("Supplemental selections belong to another target")
    selections = selected.get("selections")
    if not isinstance(selections, list) or not selections:
        raise ValueError("At least one supplemental script selection is required")
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location("refresh_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)
    scripts, extracts, names, ranges = [], {}, set(), []
    for row in selections:
        name = row["id"]
        if not isinstance(name, str) or not name or name in names:
            raise ValueError("Supplemental script IDs must be nonempty and unique")
        names.add(name)
        first, last = row["start_marker"].encode("utf-8"), row["end_marker"].encode("utf-8")
        if not first or not last or data.count(first) != 1:
            raise ValueError(f"Supplemental start marker is empty or ambiguous: {name}")
        start = data.index(first)
        finish = data.find(last, start + len(first))
        if finish < 0:
            raise ValueError(f"Supplemental end marker is absent: {name}")
        end = finish + len(last)
        if data.count(last, start, end) != 1:
            raise ValueError(f"Supplemental end marker is ambiguous: {name}")
        raw = data[start:end]
        raw.decode("utf-8")
        if b"\0" in raw:
            raise ValueError(f"Supplemental script contains binary/NUL bytes: {name}")
        expected = row["expected_range"]
        span = dict(file_offset=hex(start), virtual_address=hex(pe.offset_va(start)),
                    byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest())
        if any(span[key] != expected[key] for key in ("file_offset", "byte_count", "sha256")):
            raise ValueError(f"Supplemental selected bytes changed: {name}")
        if any(start < old_end and old_start < end for old_start, old_end in ranges):
            raise ValueError("Supplemental script ranges overlap; retain one canonical extract")
        ranges.append((start, end))
        extract = project_path(row["canonical_extract"])
        if extract.suffix != ".lua" or extract == path or extract in extracts:
            raise ValueError("Supplemental extracts need distinct project-local .lua paths")
        receipt = dict(id=name, **span, canonical_extract=extract.relative_to(ROOT).as_posix(),
                       boundary=row["boundary"], native_dependencies_revalidated=False)
        if "descriptor_file_offset" in row:
            offset = int(row["descriptor_file_offset"], 0)
            encoded = struct.pack("<QQ", pe.offset_va(start), len(raw))
            if data[offset:offset + len(encoded)] != encoded:
                raise ValueError(f"Supplemental pointer/length descriptor differs: {name}")
            receipt["descriptor"] = dict(file_offset=hex(offset), byte_count=len(encoded),
                sha256=hashlib.sha256(encoded).hexdigest(),
                meaning="Static preferred-VA pointer and exact byte length; load/dispatch unproved.")
        scripts.append(receipt)
        extracts[extract] = raw
    report = dict(schema_version=1, target=identity,
        generator={"path": "scripts/review-target-refresh.py", "sha256": file_sha256(__file__)},
        selections=selections, scripts=scripts,
        limits="Exact bounded embedded Lua bytes only. Native producers, loaders, dependencies, execution, source equivalence and parity are not certified.")
    return report, extracts


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    modes = parser.add_mutually_exclusive_group(required=True)
    modes.add_argument("--previous-summary")
    modes.add_argument("--supplemental-scripts", help="Project-local target-bound script selections/receipt")
    parser.add_argument("--canonical-api", help="Reuse an existing project-local Lua extract with identical bytes")
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    if args.supplemental_scripts:
        if args.canonical_api:
            parser.error("--canonical-api requires --previous-summary")
        output = project_path(args.supplemental_scripts)
        report, extracts = supplemental_scripts(output)
        if args.write:
            for extract, raw in extracts.items():
                extract.parent.mkdir(parents=True, exist_ok=True)
                extract.write_bytes(raw)
            output.write_text(json_text(report))
        elif load_json(output) != report or any(extract.read_bytes() != raw for extract, raw in extracts.items()):
            raise ValueError("Supplemental scripts changed; inspect before --write")
        print(json_text({"target": report["target"], "scripts": report["scripts"], "written": args.write}).rstrip())
        return
    report, api = review(project_path(args.previous_summary))
    directory = ROOT / f"docs/analysis/evidence/{report['target']['version']}"
    output, extract = directory / "discovery-delta.json", directory / "embedded-api.lua"
    if args.canonical_api:
        extract = project_path(args.canonical_api)
        if extract.suffix != ".lua" or extract.read_bytes() != api:
            raise ValueError("Canonical Lua extract differs from the selected EXE range")
        report["embedded_api"]["canonical_extract"] = extract.relative_to(ROOT).as_posix()
    if args.write:
        directory.mkdir(parents=True, exist_ok=True)
        output.write_text(json_text(report))
        if not args.canonical_api:
            extract.write_bytes(api)
    elif load_json(output) != report or extract.read_bytes() != api:
        raise ValueError("Current discovery review changed; inspect before --write")
    print(json_text({"target": report["target"], "new_custom_paths": report["custom_paths_added"],
                     "embedded_api": report["embedded_api"], "written": args.write}).rstrip())


if __name__ == "__main__":
    main()
