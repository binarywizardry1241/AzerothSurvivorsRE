#!/usr/bin/env python3
"""Partition every selected EXE file byte and retain separate Data unknowns.

PE structure is observed evidence, not semantic recovery. Uniform bytes and raw
alignment tails remain unknown. Default/--check reproduce the durable summary
and ignored exact ledger; --write explicitly publishes them. No native analysis,
application compilation, extraction or execution occurs here.
"""

import argparse
from collections import Counter
import hashlib
import importlib.util
import struct
import sys

from coverage_common import (ROOT, artifact_path, artifact_reference, file_sha256,
                             json_text, latest_target, load_json, target_bytes)

GENERATOR = "scripts/inventory-target-ranges.py"
SUMMARY = ROOT / "docs/analysis/coverage/file-range-summary.json"
PARSER = "scripts/inventory-executable.py"


def digest(data):
    return hashlib.sha256(data).hexdigest()


def checked_range(start, end, size, label):
    if not 0 <= start < end <= size:
        raise ValueError(f"Invalid/truncated {label} range [{start}, {end})")
    return start, end


def partition(pe):
    """Return a disjoint structural partition, rejecting ambiguous raw ownership."""
    size = len(pe.data)
    header_end = pe.u32(pe.optional + 60)
    table_start = pe.optional + pe.optional_size
    table_end = table_start + 40 * len(pe.sections)
    if pe.optional_size < 112 or not 64 <= pe.pe < pe.optional <= table_start <= table_end <= header_end <= size:
        raise ValueError("Invalid PE header/table boundaries")
    containers = [(0, header_end, "headers", None)]
    cuts = {0, 64, pe.pe, pe.pe + 4, pe.optional, table_start, table_end, header_end, size}
    for index, section in enumerate(pe.sections):
        start, count = section["raw_offset"], section["raw_size"]
        if not count:
            continue  # Virtual-only bytes do not belong to the file ledger.
        end = start + count
        checked_range(start, end, size, "section")
        containers.append((start, end, "section", index))
        cuts.update((start, end, start + min(count, section["virtual_size"])))
    containers.sort()
    if any(a[1] > b[0] for a, b in zip(containers, containers[1:])):
        raise ValueError("Overlapping raw sections/headers")

    directories = []
    for index, (rva, count) in enumerate(pe.directories):
        if not count:
            continue
        if not rva:
            raise ValueError("Nonempty PE directory has no address")
        # IMAGE_DIRECTORY_ENTRY_SECURITY uses a file offset, never an RVA.
        start = rva if index == 4 else pe.rva_offset(rva)
        end = start + count
        checked_range(start, end, size, "directory")
        if index != 4 and pe.rva_offset(rva + count - 1) != end - 1:
            raise ValueError("Directory crosses a noncontiguous raw mapping")
        directories.append((start, end, index))
        cuts.update((start, end))

    rows = []
    for start, end in zip(sorted(cuts), sorted(cuts)[1:]):
        if start == end:
            continue
        owner = next((row for row in containers if row[0] <= start and end <= row[1]), None)
        section = pe.sections[owner[3]] if owner and owner[2] == "section" else None
        if owner and owner[2] == "headers":
            if end <= 64:
                kind = "dos_header"
            elif start < pe.pe:
                kind = "dos_stub_unknown"
            elif start < pe.pe + 4:
                kind = "pe_signature"
            elif start < pe.optional:
                kind = "coff_header"
            elif start < table_start:
                kind = "optional_header"
            elif start < table_end:
                kind = "section_table"
            else:
                kind = "header_slack_unknown"
            lead = "Q41-B05"
        elif section:
            flags = int(section["characteristics"], 16)
            if start >= section["raw_offset"] + section["virtual_size"]:
                kind, lead = "raw_alignment_tail_unknown", "Q41-B03"
            elif flags & 0x20000000:
                kind, lead = "executable_section_semantics_unknown", "Q41-B01"
            else:
                kind, lead = "nonexecutable_section_semantics_unknown", "Q41-B02"
        else:
            last_section = max(row[1] for row in containers)
            kind = "overlay_or_trailer_unknown" if start >= last_section else "unmapped_file_gap_unknown"
            lead = "Q41-B04"
        raw = pe.data[start:end]
        row = {"selector": f"{lead}-{start:x}-{end:x}", "file_start": start,
               "file_end_exclusive": end, "byte_count": end - start,
               "sha256": digest(raw), "structural_class": kind,
               "semantic_status": "unknown", "lead_id": lead,
               "section": section["name"] if section else None,
               "directory_indices": [i for a, b, i in directories if a <= start and end <= b]}
        if section:
            row["rva_start"] = section["rva"] + start - section["raw_offset"]
        row["uniform_byte_observation"] = raw[0] if raw.count(raw[:1]) == len(raw) else None
        rows.append(row)
    if not rows or rows[0]["file_start"] != 0 or rows[-1]["file_end_exclusive"] != size:
        raise ValueError("File partition does not span the input")
    if any(a["file_end_exclusive"] != b["file_start"] for a, b in zip(rows, rows[1:])):
        raise ValueError("File partition has a gap or overlap")
    if sum(row["byte_count"] for row in rows) != size:
        raise ValueError("File partition total differs")
    return rows


def data_resources(target):
    """Hash every configured Data file; archive member semantics stay unknown."""
    registered = {row["path"]: row for row in target["runtime_data"]["archives"]}
    root = artifact_path(target["runtime_data"]["directory"])
    rows = []
    for path in sorted(root.rglob("*")):
        if path.is_symlink():
            raise ValueError("Data symlink requires explicit input-boundary review")
        if not path.is_file():
            continue
        reference = artifact_reference(path)
        record = {"path": reference, "size_bytes": path.stat().st_size, "sha256": file_sha256(reference)}
        expected = registered.get(reference)
        if expected and record != expected:
            raise ValueError("Registered Data resource changed")
        rows.append({**record, "selector": "Q41-R01:" + reference,
                     "registered_archive": expected is not None,
                     "content_inventory_status": "not_produced_by_this_inventory",
                     "semantic_status": "unknown"})
    if not set(registered).issubset(row["path"] for row in rows):
        raise ValueError("Registered Data resource is missing")
    return rows


def inventory():
    target = latest_target()
    selected = {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    spec = importlib.util.spec_from_file_location("range_pe", ROOT / PARSER)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    rows = partition(module.PE(target_bytes(target)))
    resources = data_resources(target)
    generators = [{"path": path, "sha256": file_sha256(path)} for path in (GENERATOR, PARSER, "scripts/coverage_common.py")]
    ledger = {"schema_version": 1, "target": selected, "generator": generators,
              "range_convention": "file offsets; half-open [start,end); no virtual-only bytes",
              "ranges": rows, "data_resources": resources,
              "limits": ["Structural PE classes do not establish semantic/source recovery.",
                         "Uniform bytes and raw alignment tails remain unknown; no padding is proved.",
                         "Data file identity is complete; archive members, overrides and their consumers are not inventoried by this tool.",
                         "Decoded/native residual populations overlap this ledger; never add their totals.",
                         "No native decoding, application compilation, game execution or parity comparison."]}
    output = ROOT / "runtime/coverage" / target["sha256"] / "file-ranges.json"
    payload = json_text(ledger)
    totals = Counter()
    for row in rows:
        totals[row["structural_class"]] += row["byte_count"]
    summary = {"schema_version": 1, "target": selected, "generator": generators,
               "ledger": {"path": output.relative_to(ROOT).as_posix(), "sha256": digest(payload.encode())},
               "counts": {"ranges": len(rows), "partition_bytes": sum(totals.values()),
                          "overlap_bytes": 0, "omitted_bytes": 0, "bytes_by_structural_class": dict(sorted(totals.items())),
                          "semantic_recovery_status": "unknown_not_measured_by_structural_partition",
                          "data_files": len(resources), "registered_archives": sum(row["registered_archive"] for row in resources),
                          "unregistered_data_files": sum(not row["registered_archive"] for row in resources)},
               "selectors": {"exe": "ranges[selector]; exact file_start/file_end_exclusive and sha256",
                             "data": "data_resources[selector]; exact portable path and complete sha256"},
               "unknown_queue": f"docs/analysis/unknown-recovery-{target['version']}.md#whole-file-and-data-range-leads",
               "limits": ledger["limits"], "reconstruction_complete": False, "parity_verified": False}
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
            output.write_text(payload)
            SUMMARY.write_text(json_text(summary))
        elif not output.exists() or output.read_text() != payload or load_json(SUMMARY) != summary:
            raise ValueError("Missing/stale file-range ledger; run --write")
        print(json_text({"target": summary["target"], "counts": summary["counts"], "written": args.write}).rstrip())
    except (ValueError, OSError, KeyError, struct.error) as error:
        print(f"File-range accounting error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
