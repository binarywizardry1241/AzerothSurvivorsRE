#!/usr/bin/env python3
"""Reproduce current whole-file changes and bounded embedded API evidence.

Byte/string equality never promotes historical native contracts or source parity.
All artifacts remain in the checkout; the configured installed EXE is read only.
"""
import argparse
import hashlib
import importlib.util
import json
import struct
from pathlib import Path

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_path, target_bytes


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
    checker = version + b"\x1eupdate: up to date"
    if data.count(checker) != 1:
        raise ValueError("Updater identity is not unique")
    platform = version + b"\0"
    descriptors = []
    cursor = 0
    while (at := data.find(platform, cursor)) >= 0:
        cursor = at + len(platform)
        # Rust may align the adjacent slice descriptors after the NUL-terminated
        # version. Admit only bounded zero padding and both exact self-pointers;
        # a nearby version/platform literal is not enough.
        for padding in range(8):
            raw = (platform + bytes(padding)
                   + struct.pack("<QQ", pe.offset_va(at), len(version))
                   + b"windows\0")
            raw += struct.pack("<QQ", pe.offset_va(at + len(raw) - 8), 7)
            if data[at:at + len(raw)] == raw:
                descriptors.append({**span(at, len(raw)), "zero_padding_bytes": padding})
    if len(descriptors) != 1:
        # Current builds store the version's display slice away from the
        # independent Windows platform descriptor. Require its exact self
        # pointer/length and compiled display format instead of proximity.
        descriptors = []
        cursor = 0
        while (at := data.find(platform, cursor)) >= 0:
            cursor = at + len(platform)
            raw = (platform + struct.pack("<QQ", pe.offset_va(at), len(version))
                   + b"\x01v\xc0\x02 (\xc0\x01)\0")
            if data[at:at + len(raw)] == raw:
                descriptors.append({**span(at, len(raw)), "zero_padding_bytes": 0,
                                    "kind": "mapped_version_display_slice"})
        if len(descriptors) != 1:
            raise ValueError("Expected one mapped version/platform or version/display descriptor")

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
        version_evidence={"updater": span(data.index(checker), len(checker)),
                          "platform_descriptors": descriptors},
        custom_paths_added=sorted(diagnostics(after) - diagnostics(before)),
        custom_paths_removed=sorted(diagnostics(before) - diagnostics(after)),
        candidate_changes=changes, import_library_function_sets_equal=imports(before) == imports(after),
        embedded_api={**span(start, len(api)), "canonical_extract": directory + "/embedded-api.lua",
                      "boundary": "Exact start comment through final event-handler registration; adjacent packed constants excluded.",
                      "native_dependencies_revalidated": False},
        limits="Full-file byte observations and bounded script extract only; source behavior, native dependencies and parity are not certified.")
    return report, api


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--previous-summary", required=True)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    report, api = review(project_path(args.previous_summary))
    directory = ROOT / f"docs/analysis/evidence/{report['target']['version']}"
    output, extract = directory / "discovery-delta.json", directory / "embedded-api.lua"
    if args.write:
        directory.mkdir(parents=True, exist_ok=True)
        output.write_text(json_text(report))
        extract.write_bytes(api)
    elif load_json(output) != report or extract.read_bytes() != api:
        raise ValueError("Current discovery review changed; inspect before --write")
    print(json_text({"target": report["target"], "new_custom_paths": report["custom_paths_added"],
                     "embedded_api": report["embedded_api"], "written": args.write}).rstrip())


if __name__ == "__main__":
    main()
