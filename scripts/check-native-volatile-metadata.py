#!/usr/bin/env python3
"""Read the selected PE's compatible volatile layout without certifying Version.

Offline, noncompiling check. Primary public consumers define the six-u32 layout;
they do not establish Microsoft's acceptance or meaning of the packed Version.
"""
import argparse
import hashlib
import importlib.util
from pathlib import Path
import struct

from coverage_common import ROOT, file_sha256, json_text, latest_target, project_path, target_bytes

LAYOUT_BASIS = [
    "https://github.com/winsiderss/systeminformer/commit/794a212b5cb0aebe48fe2eff98da299a8ad36ff7",
    "https://github.com/FEX-Emu/FEX/blob/ca389e06a6b7c697c8f40f8fde822ae8d8b328cc/Source/Windows/include/winnt.h#L191",
    "https://github.com/FEX-Emu/FEX/blob/ca389e06a6b7c697c8f40f8fde822ae8d8b328cc/Source/Windows/Common/ImageTracker.cpp#L43",
    "https://github.com/FEX-Emu/FEX/blob/ca389e06a6b7c697c8f40f8fde822ae8d8b328cc/FEXCore/Source/Interface/Core/Core.cpp#L582",
]
PE_PARSER = ROOT / "scripts/inventory-executable.py"
spec = importlib.util.spec_from_file_location("volatile_pe", PE_PARSER)
pe_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pe_module)


def mapped_span(pe, rva, count, executable=False):
    """Require one unambiguous, loaded, file-backed span; never read a BSS tail."""
    image_size = pe.u32(pe.optional + 56)
    if count <= 0 or rva < 0 or rva + count > min(image_size, 1 << 32):
        raise ValueError(f"Invalid image span RVA={rva:#x}, bytes={count}")
    matches = []
    for section in pe.sections:
        begin = section["rva"]
        end = begin + min(section["virtual_size"], section["raw_size"])
        if max(rva, begin) < min(rva + count, end):
            if rva < begin or rva + count > end:
                raise ValueError("Span crosses a PE mapping or partial overlap")
            matches.append((section["raw_offset"] + rva - begin, section["name"], int(section["characteristics"], 16)))
    header_end = pe.u32(pe.optional + 60)
    if rva < header_end:
        if rva + count > header_end:
            raise ValueError("Span crosses the PE header mapping")
        matches.append((rva, "PE headers", 0))
    if len(matches) != 1:
        raise ValueError(f"Span at RVA {rva:#x} lacks one file-backed image mapping")
    offset, section, flags = matches[0]
    raw = pe.data[offset:offset + count]
    if offset < 0 or len(raw) != count or executable and not flags & 0x20000000:
        raise ValueError(f"Truncated or nonexecutable annotation span at RVA {rva:#x}")
    return {"rva": hex(rva), "va": hex(pe.image_base + rva), "file_offset": hex(offset),
            "byte_count": count, "section": section, "sha256": hashlib.sha256(raw).hexdigest()}


def span_bytes(pe, span):
    start = int(span["file_offset"], 16)
    return pe.data[start:start + span["byte_count"]]


def decode(pe):
    """Decode only the sourced Size24 layout; reject malformed/truncated tables."""
    result = {"layout_basis": LAYOUT_BASIS, "version_compatibility_certified": False,
              "version_limit": "Public consumers ignore Version; its packed encoding and native Windows acceptance are not certified.",
              "annotation_semantics": "Instruction-specific TSO annotations and their code domains; no callable-entry table.",
              "new_function_entries_proven": 0}
    if len(pe.directories) <= 10:
        raise ValueError("PE has no load-config directory slot")
    load_rva, load_bytes = pe.directories[10]
    if not load_rva and not load_bytes:
        return {**result, "status": "load-config-absent"}
    load = mapped_span(pe, load_rva, load_bytes)
    if load_bytes < 4:
        raise ValueError("Truncated load-config Size field")
    declared = struct.unpack_from("<I", span_bytes(pe, load))[0]
    if declared < 4 or declared > load_bytes:
        raise ValueError("Load-config Size exceeds its directory or omits Size")
    if declared <= 0x100:
        return {**result, "status": "volatile-pointer-field-absent", "load_config": load}
    if declared < 0x108:
        raise ValueError("Truncated load-config VolatileMetadataPointer field")
    field = mapped_span(pe, load_rva + 0x100, 8)
    pointer = struct.unpack("<Q", span_bytes(pe, field))[0]
    result.update(load_config=load, outer_pointer_field={**field, "encoded_value": hex(pointer)})
    if not pointer:
        return {**result, "status": "volatile-pointer-null"}
    header = mapped_span(pe, pointer - pe.image_base, 24)
    size, version, access_rva, access_bytes, range_rva, range_bytes = struct.unpack("<6I", span_bytes(pe, header))
    if size != 24:
        raise ValueError(f"Unsupported volatile header Size {size}; only the sourced Size24 layout is decoded")
    tables = []
    for rva, count, width in ((access_rva, access_bytes, 4), (range_rva, range_bytes, 8)):
        if count % width:
            raise ValueError(f"Volatile table byte count {count} is not divisible by entry width {width}")
        if not count:
            if rva >= pe.u32(pe.optional + 56):
                raise ValueError("Empty volatile table RVA lies outside the image")
            tables.append(None)
        elif not rva:
            raise ValueError("Nonempty volatile table has a null RVA")
        else:
            tables.append(mapped_span(pe, rva, count))
    parts = [header] + [row for row in tables if row]
    ordered = sorted(parts, key=lambda row: int(row["rva"], 16))
    for left, right in zip(ordered, ordered[1:]):
        if int(left["rva"], 16) + left["byte_count"] > int(right["rva"], 16):
            raise ValueError("Volatile header/tables overlap")
    access_raw, ranges_raw = (span_bytes(pe, row) if row else b"" for row in tables)
    accesses = [row[0] for row in struct.iter_unpack("<I", access_raw)]
    ranges = list(struct.iter_unpack("<II", ranges_raw))
    for rva in accesses:
        mapped_span(pe, rva, 1, executable=True)
    for rva, count in ranges:
        mapped_span(pe, rva, count, executable=True)
    result.update(status="compatible-layout-decoded", header=header, raw_version=hex(version),
                  access_table={"rva": hex(access_rva), "byte_count": access_bytes, "entry_width": 4, "entry_count": len(accesses), "span": tables[0]},
                  range_table={"rva": hex(range_rva), "byte_count": range_bytes, "entry_width": 8, "entry_count": len(ranges), "span": tables[1]},
                  access_rvas=[hex(rva) for rva in accesses],
                  ranges=[{"rva": hex(rva), "byte_count": count, "end_rva_exclusive": hex(rva + count)} for rva, count in ranges],
                  access_rvas_outside_ranges=[hex(rva) for rva in accesses if not any(begin <= rva < begin + count for begin, count in ranges)],
                  encoded_byte_count=sum(row["byte_count"] for row in parts))
    # Tables need not follow the header or be adjacent. Report a combined span
    # only when the actual RVAs and file mappings prove one contiguous payload.
    if all(a["section"] == b["section"] and int(a["rva"], 16) + a["byte_count"] == int(b["rva"], 16) and
           int(a["file_offset"], 16) + a["byte_count"] == int(b["file_offset"], 16)
           for a, b in zip(ordered, ordered[1:])):
        result["contiguous_span"] = mapped_span(pe, int(ordered[0]["rva"], 16), result["encoded_byte_count"])
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", help="Optional project-local JSON output; defaults to stdout")
    args = parser.parse_args()
    try:
        output = project_path(args.output) if args.output else None
        target = latest_target(verify=True)
        result = {"schema_version": 1,
                  "target": {key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
                  "generator": {"path": "scripts/check-native-volatile-metadata.py", "sha256": file_sha256(Path(__file__)),
                                "pe_parser_path": "scripts/inventory-executable.py", "pe_parser_sha256": file_sha256(PE_PARSER),
                                "coverage_helper_path": "scripts/coverage_common.py", "coverage_helper_sha256": file_sha256(ROOT / "scripts/coverage_common.py")},
                  "volatile_metadata": decode(pe_module.PE(target_bytes(target)))}
        if output:
            output.parent.mkdir(parents=True, exist_ok=True)
            output.write_text(json_text(result), encoding="utf-8")
            print(f"PASS: {result['volatile_metadata']['status']}; {output.relative_to(ROOT)}")
        else:
            print(json_text(result), end="")
    except (OSError, ValueError, struct.error) as error:
        parser.exit(1, f"ERROR: {error}\n")


if __name__ == "__main__":
    main()
