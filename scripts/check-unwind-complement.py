#!/usr/bin/env python3
"""Validate complement evidence and byte accounting without a native decoder.

The caller supplies its Findings collector. Matching encoded bytes, retained
leads and partitions cannot certify instruction semantics or reachability.
"""

from collections import Counter
from contextlib import closing
import hashlib
import importlib.util
import json
from pathlib import Path
import sqlite3
import struct

from coverage_common import ROOT
from shared_native_inventory import open_readonly_uri as open_native_inventory, historical_file_sha256


def _module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


COLLECTOR = _module("checked_unwind_complement", Path(__file__).with_name("inventory-unwind-complement.py"))
COUNT_KEYS = (
    "complement_regions", "mapped_regions", "executable_complement_bytes", "file_backed_bytes",
    "virtual_zero_fill_bytes", "incoming_seed_leads", "unique_seed_addresses", "decoded_instruction_records",
    "decoded_bytes_summed", "decoded_bytes_union", "overlapping_decode_bytes",
    "imported_pointer_transfer_sites", "imported_pointer_slots",
)
PARTITION_KEYS = {"uniform_cc_candidate", "uniform_zero_candidate", "uniform_nop_candidate",
                  "x86_padding_sequence_candidate", "mixed_or_other", "virtual_zero_fill", "decoded_candidate_bytes"}
REF_KINDS = {"call_direct", "call_indirect", "jump_direct", "jump_indirect", "address", "memory"}
STOP_REASONS = {"outside_file_backed_complement", "invalid_or_boundary_truncated", "return",
                "trap_or_privileged_exit", "jump_no_fallthrough"}


def _path(value, root):
    if not isinstance(value, str) or not value:
        raise ValueError("Missing project-local path")
    path = (root / value).resolve()
    if not path.is_relative_to(root.resolve()):
        raise ValueError("Complement reference escapes project")
    return path


def _hash(path):
    if path.suffix == ".sqlite":
        historical = historical_file_sha256(path)
        if historical is not None:
            return historical
    before = path.stat()
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    after = path.stat()
    if (before.st_size, before.st_mtime_ns, before.st_ctime_ns, before.st_ino) != (
            after.st_size, after.st_mtime_ns, after.st_ctime_ns, after.st_ino):
        raise ValueError("Complement input changed while hashing")
    return digest.hexdigest()


def _natural(value):
    return type(value) is int and value >= 0


def _address(value):
    if isinstance(value, str):
        value = int(value, 16)
    if not _natural(value) or value >= 1 << 64:
        raise ValueError("Invalid encoded address")
    return value


def _counter(value):
    return isinstance(value, dict) and all(isinstance(k, str) and k and _natural(v) for k, v in value.items())


def _identity(actual, expected):
    return isinstance(actual, dict) and all(actual.get(key) == expected.get(key)
        for key in ("version", "path", "sha256", "size_bytes"))


def _validate_database(connection, record, parent_path, pe, native, gaps, rows, findings):
    require = findings.require
    stored_metadata = connection.execute("SELECT value FROM metadata").fetchall()
    expected_metadata = {key: record[key] for key in
                         ("target", "generator", "input_summary_sha256", "input_inventory_sha256")}
    require(len(stored_metadata) == 1 and json.loads(stored_metadata[0][0]) == expected_metadata,
            "complement_inventory", "Complement database metadata differs from summary")
    stored_regions = [dict(zip(("start", "end", "file_offset", "sha256", "category"), row)) for row in
                      connection.execute("SELECT start,end,file_offset,sha256,category FROM regions ORDER BY start")]
    require(stored_regions == rows, "complement_mapping", "Complement regions/byte hashes differ from selected PE")
    regions = COLLECTOR.Regions(rows)
    decoded = {}
    for site, end, encoded, mnemonic, operands in connection.execute(
            "SELECT site,end,bytes,mnemonic,operands FROM instructions ORDER BY site"):
        region = regions.find(site) if _natural(site) else None
        raw = bytes.fromhex(encoded)
        valid = (region is not None and region["file_offset"] is not None and _natural(end)
                 and 1 <= end - site <= 15 and end <= region["end"] and len(raw) == end - site
                 and encoded == raw.hex() and isinstance(mnemonic, str) and bool(mnemonic)
                 and isinstance(operands, str))
        if valid:
            offset = region["file_offset"] + site - region["start"]
            valid = pe.data[offset:offset + len(raw)] == raw
        require(valid, "complement_bytes", f"Invalid complement instruction byte range at {site!r}")
        if not valid:
            raise ValueError("Cannot account invalid complement instruction rows")
        require(site not in decoded, "complement_bytes", "Duplicate decoded instruction start")
        decoded[site] = (end, encoded, mnemonic, operands)
    refs = []
    for site, kind, target, operand, access in connection.execute("SELECT site,kind,target,operand,access FROM refs"):
        target = _address(target) if target is not None else None
        valid = (site in decoded and kind in REF_KINDS and _natural(operand) and _natural(access)
                 and ((target is None) == (kind in ("call_indirect", "jump_indirect"))))
        require(valid, "complement_inventory", "Invalid complement reference row")
        refs.append((site, kind, target, operand, access))
    seeds = list(connection.execute("SELECT target,source,kind,source_bytes FROM seeds"))
    for address, source, kind, encoded in seeds:
        valid = _natural(address) and regions.find(address) is not None
        if kind in ("call_direct", "jump_direct"):
            raw = bytes.fromhex(encoded)
            valid = valid and _natural(source) and 1 <= len(raw) <= 15 and encoded == raw.hex()
            if valid:
                offset = pe.rva_offset(source - pe.image_base)
                valid = pe.data[offset:offset + len(raw)] == raw
        else:
            valid = valid and kind in ("pe_entry", "pe_export") and source is None and encoded is None
        require(valid, "complement_seeds", "Invalid incoming seed provenance/bytes")
    expected_metadata_seeds = [(pe.image_base + pe.u32(pe.optional + 16), None, "pe_entry", None)]
    expected_metadata_seeds += [(pe.image_base + int(row["rva"], 16), None, "pe_export", None)
                               for row in native.pe_module().exports(pe) if not row["forwarder"]]
    expected_metadata_seeds = [row for row in expected_metadata_seeds if regions.find(row[0]) is not None]
    require(sorted(row for row in seeds if row[2] in ("pe_entry", "pe_export")) == sorted(expected_metadata_seeds),
            "complement_seeds", "PE entry/export seeds differ from target metadata")
    if parent_path.exists():
        with closing(open_native_inventory(parent_path.as_uri() + "?mode=ro", uri=True)) as parent:
            expected_direct = [(int(target, 16), site, kind, encoded) for site, encoded, kind, target in
                parent.execute("SELECT site,bytes,kind,target FROM refs WHERE kind IN ('call_direct','jump_direct')")
                if regions.find(int(target, 16)) is not None]
        require(sorted(row for row in seeds if row[2] in ("call_direct", "jump_direct")) == sorted(expected_direct),
                "complement_seeds", "Incoming direct seeds differ from bound parent inventory")
    stops = list(connection.execute("SELECT site,reason FROM stops"))
    require(len(stops) == len(set(stops)), "complement_inventory", "Duplicate complement stop records")
    for site, reason in stops:
        valid = _natural(site) and reason in STOP_REASONS
        if reason in ("return", "trap_or_privileged_exit", "jump_no_fallthrough"):
            valid = valid and site in decoded
        elif reason == "invalid_or_boundary_truncated":
            region = regions.find(site)
            valid = valid and region is not None and region["file_offset"] is not None and site not in decoded
        else:
            region = regions.find(site)
            valid = valid and (region is None or region["file_offset"] is None) and site not in decoded
        require(valid, "complement_inventory", "Invalid complement path stop")
    resolved = set(decoded) | {site for site, reason in stops}
    require(all(seed[0] in resolved for seed in seeds), "complement_flow", "Incoming seed lacks decoding or explicit stop")
    require(all(target in resolved for site, kind, target, operand, access in refs
                if kind in ("call_direct", "jump_direct") and regions.find(target) is not None),
            "complement_flow", "Complement direct successor lacks decoding or explicit stop")
    terminating = {site for site, reason in stops if reason in ("return", "trap_or_privileged_exit", "jump_no_fallthrough")}
    require(all(end in resolved or site in terminating for site, (end, *_) in decoded.items()),
            "complement_flow", "Decoded path lacks continuation or terminal stop")
    union_bytes = sum(end - start for start, end in COLLECTOR.merge((site, row[0]) for site, row in decoded.items()))
    summed = sum(row[0] - site for site, row in decoded.items())
    slots = {int(row["iat_start_address"], 16) + 8 * index for row in pe.imports()
             for index in range(len(row["functions"]))}
    transfers = [(site, target) for site, kind, target, operand, access in refs
                 if kind == "memory" and target in slots and decoded[site][2] in ("jmp", "call")]
    expected_counts = dict(complement_regions=len(gaps), mapped_regions=len(rows),
        executable_complement_bytes=sum(end - start for start, end in gaps),
        file_backed_bytes=sum(row["end"] - row["start"] for row in rows if row["file_offset"] is not None),
        virtual_zero_fill_bytes=sum(row["end"] - row["start"] for row in rows if row["file_offset"] is None),
        incoming_seed_leads=len(seeds), unique_seed_addresses=len({row[0] for row in seeds}),
        seed_kinds=dict(sorted(Counter(row[2] for row in seeds).items())),
        decoded_instruction_records=len(decoded), decoded_bytes_summed=summed, decoded_bytes_union=union_bytes,
        overlapping_decode_bytes=summed - union_bytes,
        reference_kinds=dict(sorted(Counter(row[1] for row in refs).items())),
        stop_reasons=dict(sorted(Counter(row[1] for row in stops).items())),
        imported_pointer_transfer_sites=len(transfers), imported_pointer_slots=len({target for site, target in transfers}))
    require(record["counts"] == expected_counts, "complement_accounting", "Complement summary counts differ from exact inventory rows")
    require(record["residual_byte_partition"] == COLLECTOR.residual_partition(rows, decoded),
            "complement_accounting", "Complement residual partition differs from exact instruction union")


def validate(record, target, parent_summary, data, findings, root=ROOT):
    """Check retained complement evidence; never import Capstone or start REA."""
    root = Path(root).resolve()
    require = findings.require
    try:
        require(_identity(record.get("target"), target) and _identity(parent_summary.get("target"), target),
                "complement_target", "Complement/parent identity differs from selected target")
        require(len(data) == target["size_bytes"] and hashlib.sha256(data).hexdigest() == target["sha256"],
                "complement_target", "Supplied complement-check bytes differ from selected target")
        require(record.get("schema_version") == 1 and record.get("byte_accounting_complete") is True
                and record.get("seeded_flow_pass_complete") is True,
                "complement_accounting", "Complement pass is absent or incomplete")
        require(record.get("native_semantics_complete") is False and record.get("parity_verified") is False
                and 41 in record.get("gap_ids", []) and bool(record.get("limits")),
                "completion_claim", "Complement evidence must retain native/parity limits and #41")
        generator = record["generator"]
        require(generator.get("path") == "scripts/inventory-unwind-complement.py"
                and generator.get("decoder") == "Capstone" and bool(generator.get("decoder_version")),
                "complement_generator", "Missing/invalid complement decoder identity")
        for path, key in (("scripts/inventory-unwind-complement.py", "sha256"),
                          ("scripts/inventory-native-instructions.py", "helper_sha256"),
                          ("scripts/inventory-executable.py", "parser_sha256"),
                          ("scripts/inventory-current-target.py", "pe_helper_sha256")):
            from script_sources import historical_matches
            require(_hash(_path(path, root)) == generator.get(key)
                    or historical_matches(path, generator.get(key), root),
                    "complement_generator", f"Missing exact complement producer source: {path}")
        parent_summary_path = _path("docs/analysis/coverage/instruction-summary.json", root)
        require(_hash(parent_summary_path) == record.get("input_summary_sha256")
                and json.loads(parent_summary_path.read_text()) == parent_summary,
                "complement_input", "Complement parent summary differs from current canonical record")
        require(parent_summary.get("declared_extent_pass_complete") is True
                and parent_summary["counts"].get("pending_extents") == 0
                and parent_summary["counts"].get("undecoded_suffix_bytes_summed") == 0,
                "complement_input", "Complement requires a complete declared-extent parent pass")
        parent_path = _path(parent_summary["inventory"]["path"], root)
        require(parent_path.is_relative_to(root / "runtime")
                and record.get("input_inventory_sha256") == parent_summary["inventory"].get("sha256"),
                "complement_input", "Complement parent inventory path/digest differs")
        if not parent_path.is_relative_to(root / "runtime"):
            return
        if parent_path.exists():
            require(_hash(parent_path) == record.get("input_inventory_sha256"), "complement_input", "Bound parent inventory bytes changed")
        else:
            findings.warn("disposable_inventory_absent", "Recreate parent instruction inventory to reproduce complement seed provenance")
        counts = record["counts"]
        numbers_valid = all(_natural(counts.get(key)) for key in COUNT_KEYS)
        groups_valid = all(_counter(counts.get(key)) for key in ("seed_kinds", "reference_kinds", "stop_reasons"))
        require(numbers_valid and groups_valid, "complement_accounting", "Complement counts must be nonnegative integers")
        partition = record["residual_byte_partition"]
        partition_valid = _counter(partition) and set(partition) <= PARTITION_KEYS and "decoded_candidate_bytes" in partition
        require(partition_valid, "complement_accounting", "Invalid complement residual partition")
        if not numbers_valid or not groups_valid or not partition_valid:
            return
        require(set(counts["seed_kinds"]) <= {"call_direct", "jump_direct", "pe_entry", "pe_export"}
                and set(counts["reference_kinds"]) <= REF_KINDS and set(counts["stop_reasons"]) <= STOP_REASONS,
                "complement_accounting", "Unknown complement seed/reference/stop kind")
        require(counts["file_backed_bytes"] + counts["virtual_zero_fill_bytes"] == counts["executable_complement_bytes"]
                == parent_summary["counts"].get("executable_bytes_outside_unwind_extents"),
                "complement_accounting", "Complement backing/parent denominator differs")
        require(counts["decoded_bytes_union"] <= counts["decoded_bytes_summed"]
                and counts["decoded_bytes_union"] <= counts["file_backed_bytes"]
                and counts["overlapping_decode_bytes"] == counts["decoded_bytes_summed"] - counts["decoded_bytes_union"]
                and counts["unique_seed_addresses"] <= counts["incoming_seed_leads"]
                and sum(counts["seed_kinds"].values()) == counts["incoming_seed_leads"]
                and counts["imported_pointer_slots"] <= counts["imported_pointer_transfer_sites"]
                <= counts["reference_kinds"].get("memory", 0)
                and counts["decoded_instruction_records"] <= counts["decoded_bytes_summed"]
                <= 15 * counts["decoded_instruction_records"],
                "complement_accounting", "Invalid complement overlap/seed/import accounting")
        require(sum(partition.values()) == counts["executable_complement_bytes"]
                and partition["decoded_candidate_bytes"] == counts["decoded_bytes_union"]
                and partition.get("virtual_zero_fill", 0) == counts["virtual_zero_fill_bytes"],
                "complement_accounting", "Complement residual partition is not disjoint/exhaustive")
        native = COLLECTOR.module("checked_complement_native", "scripts/inventory-native-instructions.py")
        pe = native.pe_module().pe_parser(data)
        gaps = native.outside_intervals(pe.sections, pe.functions(), pe.image_base)
        rows = COLLECTOR.mapped_regions(pe, gaps)
        category_bytes = Counter()
        for row in rows:
            category_bytes[row["category"]] += row["end"] - row["start"]
        require(sum(end - start for start, end in gaps) == counts["executable_complement_bytes"]
                and len(gaps) == counts["complement_regions"] and len(rows) == counts["mapped_regions"]
                and sum(row["end"] - row["start"] for row in rows if row["file_offset"] is not None) == counts["file_backed_bytes"]
                and category_bytes["virtual_zero_fill"] == counts["virtual_zero_fill_bytes"]
                and all(value <= category_bytes.get(category, 0) for category, value in partition.items()
                        if category != "decoded_candidate_bytes"),
                "complement_mapping", "Complement denominator/range counts differ from selected PE")
        inventory = record["inventory"]
        path = _path(inventory["path"], root)
        require(path.is_relative_to(root / "runtime"), "complement_inventory", "Complement inventory must remain inside runtime")
        if not path.is_relative_to(root / "runtime"):
            return
        if not path.exists():
            findings.warn("disposable_inventory_absent", "Recreate complement inventory before querying decoded candidates")
            return
        require(_hash(path) == inventory.get("sha256"), "complement_inventory", "Complement database digest differs")
        with closing(open_native_inventory(path.as_uri() + "?mode=ro", uri=True)) as connection:
            _validate_database(connection, record, parent_path, pe, native, gaps, rows, findings)
    except (ValueError, OSError, KeyError, TypeError, AttributeError, IndexError, OverflowError, sqlite3.Error, struct.error) as error:
        require(False, "complement_inventory", f"Invalid complement evidence: {error}")
