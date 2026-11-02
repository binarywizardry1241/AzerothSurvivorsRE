#!/usr/bin/env python3
"""Verify historical 0.91.4 evidence against the preserved project-local archive.

Uses only Python's standard library and Git's file inventory. Does not start REA,
execute the target, read MPQs, or modify the retained source evidence.
"""

import argparse
import collections
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "runtime/verification/historical-evidence.json"


def main():
    def project_path(value):
        path = (ROOT / value).resolve()
        if not path.is_relative_to(ROOT):
            raise argparse.ArgumentTypeError("binary must stay inside this checkout")
        return path

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=project_path,
                        default=ROOT / "AzerothSurvivors/AzerothSurvivors-0.91.4.exe",
                        help="historical 0.91.4 EXE; current 0.92 is a separate target")
    args = parser.parse_args()
    counts, failures = collections.Counter(), []

    def check(category, condition, detail):
        counts[category] += 1
        if not condition:
            failures.append({"category": category, "detail": detail})

    def load(path):
        return json.loads((ROOT / path).read_bytes())

    def digest(raw):
        return hashlib.sha256(raw).hexdigest()

    binary = args.binary
    data = binary.read_bytes()
    if digest(data) != "719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150":
        parser.error("Historical evidence verification requires the preserved 0.91.4 executable hash")
    pe = struct.unpack_from("<I", data, 0x3c)[0]
    section_count, optional_size = struct.unpack_from("<H", data, pe + 6)[0], struct.unpack_from("<H", data, pe + 20)[0]
    image_base = struct.unpack_from("<Q", data, pe + 24 + 24)[0]
    sections = []
    for i in range(section_count):
        at = pe + 24 + optional_size + i * 40
        size, rva, raw_size, raw_start = struct.unpack_from("<IIII", data, at + 8)
        sections.append((data[at:at + 8].rstrip(b"\0").decode(), rva, size, raw_start, raw_size))

    def va_offset(address):
        rva = int(address, 16) - image_base if isinstance(address, str) else address - image_base
        for _, start, _, raw, length in sections:
            if start <= rva < start + length:
                return raw + rva - start
        raise ValueError(f"Unmapped image address: {address}")

    def offset_va(offset):
        for _, rva, _, start, length in sections:
            if start <= offset < start + length:
                return image_base + rva + offset - start
        raise ValueError(f"Unmapped file offset: {offset:#x}")

    def c_string(offset):
        return data[offset:data.index(b"\0", offset)].decode("ascii")

    imports = {}
    import_rva = struct.unpack_from("<I", data, pe + 24 + 120)[0]
    descriptor = va_offset(image_base + import_rva)
    while any(data[descriptor:descriptor + 20]):
        lookup, _, _, name_rva, first_thunk = struct.unpack_from("<IIIII", data, descriptor)
        library = c_string(va_offset(image_base + name_rva))
        at, index = va_offset(image_base + (lookup or first_thunk)), 0
        while (entry := struct.unpack_from("<Q", data, at + index * 8)[0]):
            function = f"ordinal:{entry & 0xffff}" if entry >> 63 else c_string(va_offset(image_base + entry) + 2)
            imports[image_base + first_thunk + index * 8] = (library, function)
            index += 1
        descriptor += 20

    embedded = load("docs/analysis/evidence/embedded-game-data.json")
    inventory = load("docs/analysis/evidence/executable-inventory.json")
    changelog = load("docs/analysis/evidence/changelog-index.json")
    check("artifact", len(data) == embedded["artifact"]["size_bytes"] == inventory["size_bytes"], "EXE length")
    check("artifact", digest(data) == embedded["artifact"]["sha256"] == inventory["sha256"] == changelog["executable"]["sha256"], "EXE hash")

    def walk(value, context="embedded"):
        if isinstance(value, list):
            for i, item in enumerate(value):
                walk(item, f"{context}[{i}]")
        elif isinstance(value, dict):
            if "file_offset" in value:
                start = int(value["file_offset"], 16)
                if "virtual_address" in value:
                    check("address_mapping", offset_va(start) == int(value["virtual_address"], 16), context)
                if "length_bytes" in value:
                    raw = data[start:start + value["length_bytes"]]
                    check("span_length", len(raw) == value["length_bytes"], context)
                    if "raw_hex" in value:
                        check("raw_span", raw.hex() == value["raw_hex"], context)
                    if "sha256" in value:
                        check("span_hash", digest(raw) == value["sha256"], context)
                    if "text" in value:
                        check("text_span", raw == value["text"].encode("utf-8"), context)
            if "record" in value:
                start = int(value["record"]["file_offset"], 16)
                for key, fmt in (("u32_by_record_offset", "<I"), ("floats_by_record_offset", "<f"), ("f32_by_record_offset", "<f")):
                    for offset, expected in value.get(key, {}).items():
                        check("numeric_field", struct.unpack_from(fmt, data, start + int(offset, 16))[0] == expected, f"{context}.{key}.{offset}")
                for key, expected in value.items():
                    scalar = re.fullmatch(r"(u8|u16|u32|u64|f32|f64)_at_(\d+)", key)
                    byte_array = re.fullmatch(r"bytes_at_(\d+)", key)
                    if scalar:
                        fmt = {"u8": "<B", "u16": "<H", "u32": "<I", "u64": "<Q", "f32": "<f", "f64": "<d"}[scalar[1]]
                        check("numeric_field", struct.unpack_from(fmt, data, start + int(scalar[2]))[0] == expected, f"{context}.{key}")
                    if byte_array:
                        at = start + int(byte_array[1])
                        check("byte_array_field", list(data[at:at + len(expected)]) == expected, f"{context}.{key}")
            if "byte_values" in value and "file_offset" in value:
                at = int(value["file_offset"], 16)
                check("byte_slice", list(data[at:at + value["length_bytes"]]) == value["byte_values"], context)
            for key, item in value.items():
                walk(item, f"{context}.{key}")

    walk(embedded)
    extraction_summary = []
    for metadata, path, size_key in ((embedded["locale"], embedded["locale"]["extracted_file"], "length_bytes"),
                                     (inventory["embedded_addon_api"], inventory["embedded_addon_api"]["path"], "size_bytes")):
        raw = (ROOT / path).read_bytes()
        start, length = int(metadata["file_offset"], 16), metadata[size_key]
        check("extracted_file", len(raw) == length and raw == data[start:start + length] and digest(raw) == metadata["sha256"], path)
        extraction_summary.append({"path": path, "file_offset": hex(start), "length_bytes": length, "sha256": digest(raw)})
    english = load(embedded["locale"]["extracted_file"])
    check("catalog", len(english) == embedded["locale"]["entry_count"] == 2491, "English entry count")

    def pair(record, offset, target, count_key="length_bytes"):
        pointer, length = struct.unpack_from("<QQ", data, int(record["file_offset"], 16) + offset)
        check("linked_pointer", va_offset(pointer) == int(target["file_offset"], 16) and length == target[count_key], f"{record['file_offset']}+{offset}")

    for kind, stride in (("classes", 144), ("zones", 184)):
        table = embedded["class_table" if kind == "classes" else "zone_table"]
        check("table_count", len(embedded[kind]) == table["count"], kind)
        for i, row in enumerate(embedded[kind]):
            record = row["record"]
            check("table_stride", int(record["file_offset"], 16) == int(table["file_offset"], 16) + i * stride and record["length_bytes"] == stride, f"{kind}[{i}]")
            for offset, key in ((16, "key"), (32, "name")) if kind == "classes" else ((0, "key"), (16, "name"), (32, "subtitle"), (96, "loading_screen"), (112, "blurb")):
                pair(record, offset, row[key])
            if kind == "classes":
                pair(record, 48, row["ability_slice"], "count")
                pair(record, 64, row["default_ability_key_candidate"])
                for n, ability in enumerate(row["ability_keys"]):
                    pair({"file_offset": hex(int(row["ability_slice"]["file_offset"], 16) + n * 16)}, 0, ability)
                check("class_byte", data[int(record["file_offset"], 16) + 140] == row["class_id_byte_candidate"], row["key"]["text"])
            else:
                for offset, collection, slice_key, child_stride in ((64, "enemies", "enemy_slice", 80), (80, "bosses", "boss_slice", 88)):
                    pair(record, offset, row[slice_key], "count")
                    check("table_count", len(row[collection]) == row[slice_key]["count"], f"{i}.{collection}")
                    for n, child in enumerate(row[collection]):
                        check("table_stride", int(child["record"]["file_offset"], 16) == int(row[slice_key]["file_offset"], 16) + n * child_stride, f"{i}.{collection}[{n}]")
                        pair(child["record"], 16 if collection == "enemies" else 0, child["name"])
                        if collection == "bosses":
                            pair(child["record"], 32, child["yell"])
                            pair(child["record"], 16, child["ability_slice"], "count")

    mechanics = load("docs/analysis/evidence/mechanics-tables.json")
    check("mechanics_artifact", mechanics["artifact"]["sha256"] == digest(data), "Mechanics target hash")
    walk(mechanics, "mechanics")
    mechanics_counts = {}

    def table_rows(table, rows, base, count, stride, label):
        check("mechanics_table_definition", int(table["file_offset"], 16) == base and table["count"] == count and table["stride_bytes"] == stride and len(rows) == count, label)
        for i, row in enumerate(rows):
            check("mechanics_table_stride", int(row["record"]["file_offset"], 16) == base + i * stride and row["record"]["length_bytes"] == stride, f"{label}[{i}]")

    for key, base, count, stride in (("abilities", 0x66c9730, 111, 120), ("rings_and_trinkets", 0x66cf140, 22, 72), ("general_amulets", 0x66d03d8, 17, 80)):
        table_rows(mechanics["tables"][key], mechanics[key], base, count, stride, key)
        mechanics_counts[key] = len(mechanics[key])
        for row in mechanics[key]:
            for offset, name in ((0, "key"), (16, "name"), (32, "icon")):
                pair(row["record"], offset, row[name])
            if key == "abilities":
                pair(row["record"], 48, row["opaque_byte_slice_at_48"])
            if key == "rings_and_trinkets":
                pair(row["record"], 48, row["description"])

    effect_arrays, talent_count, tree_count = [], 0, 0
    for amulet in mechanics["general_amulets"]:
        pair(amulet["record"], 48, amulet["effects"], "count")
        effect_arrays.append(amulet["effects"])
    table_rows(mechanics["tables"]["talent_class_index"], mechanics["talent_classes"], 0x68a56d8, 9, 200, "talent_class_index")
    class_by_key = {row["key"]["text"]: row for row in embedded["classes"]}
    for class_row in mechanics["talent_classes"]:
        class_record = class_row["record"]
        class_start = int(class_record["file_offset"], 16)
        class_id = struct.unpack_from("<Q", data, class_start + 192)[0]
        check("talent_class_id", class_id == class_row["class_id_at_192"] == class_by_key[class_row["class_key"]]["class_id_byte_candidate"], class_row["class_key"])
        check("talent_tree_count", len(class_row["trees"]) == 3, class_row["class_key"])
        for index, tree in enumerate(class_row["trees"]):
            tree_count += 1
            check("talent_tree_stride", int(tree["record"]["file_offset"], 16) == class_start + index * 64 and tree["record"]["length_bytes"] == 64, class_row["class_key"])
            for offset, name in ((0, "name"), (16, "background"), (32, "icon")):
                pair(tree["record"], offset, tree[name])
            pair(tree["record"], 48, tree["talent_slice"], "count")
            check("talent_slice_count", len(tree["talents"]) == tree["talent_slice"]["count"] and tree["talent_slice"]["entry_stride_bytes"] == 104, tree["name"]["text"])
            for i, talent in enumerate(tree["talents"]):
                talent_count += 1
                record = talent["record"]
                check("talent_record_stride", int(record["file_offset"], 16) == int(tree["talent_slice"]["file_offset"], 16) + i * 104 and record["length_bytes"] == 104, talent["key"]["text"])
                for offset, name in ((0, "key"), (16, "name"), (32, "icon"), (64, "description")):
                    pair(record, offset, talent[name])
                pair(record, 48, talent["effects"], "count")
                effect_arrays.append(talent["effects"])
                prerequisite = talent["prerequisite_key_candidate"]
                if prerequisite is not None:
                    pair(record, 80, prerequisite)
                else:
                    check("talent_null_prerequisite", struct.unpack_from("<Q", data, int(record["file_offset"], 16) + 80)[0] == 0, talent["key"]["text"])
    effect_count = 0
    for effects in effect_arrays:
        check("effect_slice_count", effects["entry_stride_bytes"] == 64 and len(effects["entries"]) == effects["count"], effects["file_offset"])
        for i, effect in enumerate(effects["entries"]):
            effect_count += 1
            check("effect_record_stride", int(effect["record"]["file_offset"], 16) == int(effects["file_offset"], 16) + i * 64 and effect["record"]["length_bytes"] == 64, effects["file_offset"])
    check("talent_totals", tree_count == 27 and talent_count == 353, "27 trees / 353 talent rows")
    mechanics_counts.update(talent_classes=len(mechanics["talent_classes"]), talent_trees=tree_count, talent_records=talent_count, effect_records=effect_count)
    for literal in embedded["selected_literals"]:
        raw = literal["text"].encode()
        check("literal_count", data.count(raw) == literal["occurrences"], literal["text"])
        for location in literal["locations"]:
            start = int(location["file_offset"], 16)
            check("literal_bytes", data[start:start + len(raw)] == raw, literal["text"])

    for source in inventory["game_source_paths"]:
        raw = source["path"].replace("/", "\\").encode()
        start = int(source["first_file_offset"], 16)
        check("source_path", data[start:start + len(raw)] == raw, source["path"])
        for location in source["rust_source_location_candidates"]:
            pointer, length, line, column = struct.unpack_from("<QQII", data, va_offset(location["location_address"]))
            check("source_context", pointer == int(location["path_address"], 16) and length == len(raw) and line == location["source_line"] and column == location["source_column"] and data[va_offset(pointer):va_offset(pointer) + length] == raw, source["path"])
            for ref in location["rip_relative_lea_candidates"]:
                address = int(ref["instruction_address"], 16)
                code = data[va_offset(address):va_offset(address) + 7]
                check("source_reference_bytes", code[0] in (0x48, 0x4c) and code[1] == 0x8d and code[2] & 0xc7 == 5 and address + 7 + struct.unpack_from("<i", code, 3)[0] == int(ref["target_address"], 16), ref["instruction_address"])

    assembly_summary = []
    for manifest_path in sorted((ROOT / "docs/analysis/evidence").glob("*-assembly-manifest.json")):
        name = manifest_path.name.removesuffix("-assembly-manifest.json")
        manifest = json.loads(manifest_path.read_bytes())
        check("assembly_artifact", manifest["artifact_sha256"] == digest(data), name)
        for output in manifest["outputs"]:
            raw = (ROOT / output["path"]).read_bytes()
            check("assembly_file", len(raw) == output["size_bytes"] and digest(raw) == output["sha256"], output["path"])
            lines = 0
            for match in re.finditer(rb"(?m)^([0-9a-fA-F]+):[ \t]+((?:[0-9a-fA-F]{2}[ \t]+)+)", raw):
                address, code = int(match[1], 16), bytes.fromhex(match[2].decode())
                start = va_offset(address)
                check("assembly_instruction_bytes", data[start:start + len(code)] == code, hex(address))
                lines += 1
            check("assembly_lines", lines > 0, output["path"])
            assembly_summary.append({"path": output["path"], "sha256": digest(raw), "verified_instruction_lines": lines})
        for constant in manifest.get("observed_float_constants", []):
            check("assembly_constant", struct.unpack_from("<f", data, va_offset(constant["address"]))[0] == constant["value"], constant["address"])
        if "definition_table" in manifest:
            table = manifest["definition_table"]
            check("assembly_definition_table", table["address"] == mechanics["tables"]["abilities"]["virtual_address"] and table["stride_bytes"] == 120 and table["record_count"] == 111 and int(table["native_lookup_byte_limit"], 16) == 111 * 120, name)
        for string in manifest.get("linked_binary_strings", []):
            start = va_offset(string["address"])
            check("assembly_linked_string", data[start:start + string["size_bytes"]] == string["value"].encode("utf-8"), string["address"])
        if "guardian_math_import_thunk" in manifest:
            thunk = manifest["guardian_math_import_thunk"]
            code = data[va_offset(thunk["address"]):va_offset(thunk["address"]) + 6]
            check("import_thunk", code.hex() == thunk["bytes"] and int(thunk["address"], 16) + 6 + struct.unpack_from("<i", code, 2)[0] == int(thunk["iat_address"], 16), name)
            check("import_name", imports.get(int(thunk["iat_address"], 16)) == (thunk["library"], thunk["imported_function"]), name)

    original_raw = (ROOT / changelog["source"]["path"]).read_bytes()
    original = json.loads(original_raw)
    check("changelog_hash", digest(original_raw) == changelog["source"]["sha256"], "Original source hash")
    check("changelog_count", len(original["messages"]) == len(changelog["messages"]) == original["messageCount"] == changelog["source"]["message_count"] == 140, "Message count")
    version_count = 0
    for i, (source, indexed) in enumerate(zip(original["messages"], changelog["messages"]), 1):
        check("changelog_message", source["id"] == indexed["message_id"] and source["timestamp"] == indexed["timestamp"] and source.get("edited_timestamp") == indexed["edited_timestamp"] and indexed["message_ordinal"] == i, str(i))
        headings = re.findall(r"(?m)^[ \t]*v?(0\.\d+\.\d+)(?:[ \t]+changelog)?[ \t]*$", source["content"])
        check("changelog_versions", headings == indexed["versions"], str(i))
        version_count += len(headings)
        for section in indexed["sections"]:
            check("changelog_section_text", section["text"] in source["content"], f"{i}:{section['version']}")
        if not headings:
            check("changelog_unversioned_text", source["content"] == indexed["unversioned_content"], str(i))
    check("changelog_sections", version_count == changelog["source"]["version_section_count"] == 138, "Version section count")
    for term in changelog["executable"]["version_marker_search"]:
        needle = term["exact_ascii_term"].encode()
        check("version_marker_count", data.count(needle) == term["occurrence_count"], term["exact_ascii_term"])
        for hit in term["locations"]:
            start, context = int(hit["file_offset"], 16), bytes.fromhex(hit["context_hex"])
            context_start = int(hit["context_file_offset"], 16)
            check("version_context", data[start:start + hit["matched_length"]] == needle and data[context_start:context_start + len(context)] == context and digest(context) == hit["context_sha256"], hex(start))

    paths = subprocess.check_output(["git", "ls-files", "-z", "--cached", "--others", "--exclude-standard"], cwd=ROOT).decode().split("\0")
    parsed_json = []
    for path in sorted(set(paths)):
        if path.endswith(".json") and (ROOT / path).is_file() and ROOT / path != OUT:
            try:
                load(path)
                parsed_json.append(path)
                check("project_json_parse", True, path)
            except (ValueError, UnicodeError) as error:
                check("project_json_parse", False, f"{path}: {error}")
    summary = {"schema_version": 1, "result": "passed" if not failures else "failed",
               "method": "Independent stdlib PE decoding, direct original-byte comparisons, retained-file hashing and Git-listed JSON parsing; no REA session, game execution or MPQ reads.",
               "scope": "Historical 0.91.4 evidence; current 0.92 target is not covered by these fixed addresses.",
               "verification_input_path": str(binary.relative_to(ROOT)),
               "artifact": {"path": embedded["artifact"]["path"], "size_bytes": len(data), "sha256": digest(data)},
               "extractions": extraction_summary, "checks_by_category": dict(sorted(counts.items())),
               "check_count": sum(counts.values()), "failures": failures, "assembly": assembly_summary,
               "mechanics_tables": mechanics_counts,
               "changelog": {"path": changelog["source"]["path"], "sha256": digest(original_raw), "messages": len(original["messages"]), "version_sections": version_count,
                             "first_version": changelog["messages"][0]["versions"][0], "first_timestamp": original["messages"][0]["timestamp"],
                             "last_version": changelog["messages"][-1]["versions"][-1], "last_timestamp": original["messages"][-1]["timestamp"], "selected_target": "0.91.4"},
               "project_json_files_parsed": parsed_json,
               "limits": ["Byte integrity does not prove gameplay semantics, executed reachability, complete extraction coverage or changelog authenticity.",
                          "Assembly instruction bytes were checked against the original EXE; instruction boundaries and recovered semantic names require native analysis.",
                          "Historical section bodies are checked as exact source substrings after the indexer's heading/separator trimming."]}
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps({"result": summary["result"], "checks": summary["check_count"], "failures": failures, "output": str(OUT.relative_to(ROOT))}, indent=2))
    return bool(failures)


if __name__ == "__main__":
    raise SystemExit(main())
