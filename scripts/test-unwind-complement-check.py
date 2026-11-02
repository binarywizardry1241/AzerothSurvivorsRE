#!/usr/bin/env python3
"""Non-compiling complement-evidence regressions; no Capstone or provider needed."""

from collections import Counter
from contextlib import closing
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import sqlite3
import struct
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("complement_check", ROOT / "scripts/check-unwind-complement.py")
check = importlib.util.module_from_spec(spec)
spec.loader.exec_module(check)


class Findings:
    def __init__(self):
        self.errors, self.warnings = [], []

    def require(self, condition, category, detail):
        if not condition:
            self.errors.append(dict(category=category, detail=detail))

    def warn(self, category, detail):
        self.warnings.append(dict(category=category, detail=detail))


def fixture_pe(overlap=False, virtual_tail=False):
    """A real minimal AMD64 PE: CALL in unwind extent, seeded leaf outside it."""
    image = bytearray(0x400)
    image[:2] = b"MZ"
    struct.pack_into("<I", image, 0x3C, 0x80)
    image[0x80:0x84] = b"PE\0\0"
    struct.pack_into("<HHIIIHH", image, 0x84, 0x8664, 2, 0, 0, 0, 240, 0x22)
    optional = 0x98
    struct.pack_into("<H", image, optional, 0x20B)
    struct.pack_into("<I", image, optional + 16, 0x1009 if overlap else 0x1000)
    struct.pack_into("<Q", image, optional + 24, 0x140000000)
    struct.pack_into("<I", image, optional + 60, 0x200)
    struct.pack_into("<I", image, optional + 108, 16)
    struct.pack_into("<II", image, optional + 112 + 3 * 8, 0x2000, 12)
    for index, (name, virtual, rva, raw_size, offset, flags) in enumerate((
            (b".text", 20 if virtual_tail else 16, 0x1000, 16, 0x200, 0x60000020),
            (b".pdata", 12, 0x2000, 12, 0x300, 0x40000040))):
        at = optional + 240 + 40 * index
        image[at:at + 8] = name.ljust(8, b"\0")
        struct.pack_into("<IIII", image, at + 8, virtual, rva, raw_size, offset)
        struct.pack_into("<I", image, at + 36, flags)
    image[0x200:0x210] = bytes.fromhex("e803000000cccccc") + (
        bytes.fromhex("6690c3") + b"\xcc" * 5 if overlap else bytes.fromhex("90c3") + b"\xcc" * 6)
    struct.pack_into("<III", image, 0x300, 0x1000, 0x1005, 0x200C)
    return bytes(image)


class ComplementEvidence(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/coverage-tests"
        scratch.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.build_fixture()

    def build_fixture(self, overlap=False, virtual_tail=False):
        self.data = fixture_pe(overlap, virtual_tail)
        self.target = dict(version="0.108.0", path="fixture.exe", sha256=hashlib.sha256(self.data).hexdigest(), size_bytes=len(self.data))
        paths = ("scripts/inventory-unwind-complement.py", "scripts/inventory-native-instructions.py",
                 "scripts/inventory-executable.py", "scripts/inventory-current-target.py")
        for name in paths:
            path = self.root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text("fixture current tool: " + name)
        generator = dict(path=paths[0], sha256=check._hash(self.root / paths[0]), decoder="Capstone", decoder_version="fixture",
                         helper_sha256=check._hash(self.root / paths[1]), parser_sha256=check._hash(self.root / paths[2]),
                         pe_helper_sha256=check._hash(self.root / paths[3]))
        native = check.COLLECTOR.module("checker_fixture_native", paths[1])
        pe = native.pe_module().pe_parser(self.data)
        gaps = native.outside_intervals(pe.sections, pe.functions(), pe.image_base)
        rows = check.COLLECTOR.mapped_regions(pe, gaps)
        self.base = pe.image_base + 0x1000
        self.parent_path = self.root / "runtime/parent.sqlite"
        self.parent_path.parent.mkdir(parents=True, exist_ok=True)
        self.parent_path.unlink(missing_ok=True)
        with closing(sqlite3.connect(self.parent_path)) as connection, connection:
            connection.execute("CREATE TABLE refs(site INTEGER,bytes TEXT,kind TEXT,target TEXT)")
            connection.execute("INSERT INTO refs VALUES(?,?,?,?)", (self.base, "e803000000", "call_direct", hex(self.base + 8)))
        self.parent = dict(target=self.target, declared_extent_pass_complete=True,
            counts=dict(pending_extents=0, undecoded_suffix_bytes_summed=0,
                        executable_bytes_outside_unwind_extents=sum(b-a for a,b in gaps)),
            inventory=dict(path="runtime/parent.sqlite", sha256=check._hash(self.parent_path)))
        parent_summary = self.root / "docs/analysis/coverage/instruction-summary.json"
        parent_summary.parent.mkdir(parents=True, exist_ok=True)
        parent_summary.write_text(json.dumps(self.parent, indent=2) + "\n")
        metadata = dict(target=self.target, generator=generator,
                        input_summary_sha256=check._hash(parent_summary), input_inventory_sha256=self.parent["inventory"]["sha256"])
        seeds = [(self.base + 8, self.base, "call_direct", "e803000000")]
        if overlap:
            seeds.append((self.base + 9, None, "pe_entry", None))
            decoded = {self.base + 8: (self.base + 10, "6690", "nop", ""),
                       self.base + 9: (self.base + 10, "90", "nop", ""),
                       self.base + 10: (self.base + 11, "c3", "ret", "")}
        else:
            decoded = {self.base + 8: (self.base + 9, "90", "nop", ""),
                       self.base + 9: (self.base + 10, "c3", "ret", "")}
        stops = [(self.base + (10 if overlap else 9), "return")]
        self.database = self.root / "runtime/complement.sqlite"
        check.COLLECTOR.write_inventory(self.database, metadata, rows, seeds, decoded, [], stops)
        union = sum(b-a for a,b in check.COLLECTOR.merge((site,row[0]) for site,row in decoded.items()))
        summed = sum(row[0]-site for site,row in decoded.items())
        self.record = dict(schema_version=1, **metadata,
            inventory=dict(path="runtime/complement.sqlite", sha256=check._hash(self.database)),
            counts=dict(complement_regions=len(gaps), mapped_regions=len(rows), executable_complement_bytes=sum(b-a for a,b in gaps),
                file_backed_bytes=sum(row["end"]-row["start"] for row in rows if row["file_offset"] is not None),
                virtual_zero_fill_bytes=sum(row["end"]-row["start"] for row in rows if row["file_offset"] is None),
                incoming_seed_leads=len(seeds), unique_seed_addresses=len(seeds), seed_kinds=dict(Counter(row[2] for row in seeds)),
                decoded_instruction_records=len(decoded), decoded_bytes_summed=summed, decoded_bytes_union=union,
                overlapping_decode_bytes=summed-union, reference_kinds={}, stop_reasons={"return": 1},
                imported_pointer_transfer_sites=0, imported_pointer_slots=0),
            residual_byte_partition=check.COLLECTOR.residual_partition(rows, decoded), byte_accounting_complete=True,
            seeded_flow_pass_complete=True, native_semantics_complete=False, parity_verified=False,
            gap_ids=[41], limits=["Candidate decoding is not semantic recovery or parity."])

    def validate(self, record=None):
        findings = Findings()
        with patch.dict(sys.modules, {"capstone": None}):
            check.validate(self.record if record is None else record, self.target, self.parent, self.data, findings, self.root)
        return findings

    def mutate_database(self, sql, parameters=()):
        with closing(sqlite3.connect(self.database)) as connection, connection:
            connection.execute(sql, parameters)
        self.record["inventory"]["sha256"] = check._hash(self.database)

    def assert_rejected(self, category=None):
        findings = self.validate()
        self.assertTrue(findings.errors)
        if category:
            self.assertIn(category, {row["category"] for row in findings.errors})

    def test_real_pe_fixture_passes_without_decoder_or_provider(self):
        self.assertEqual(self.validate().errors, [])

    def test_overlapping_decodes_use_unique_byte_union(self):
        self.build_fixture(overlap=True)
        self.assertEqual(self.record["counts"]["overlapping_decode_bytes"], 1)
        self.assertEqual(self.validate().errors, [])

    def test_virtual_tail_is_accounted_without_becoming_file_bytes(self):
        self.build_fixture(virtual_tail=True)
        self.assertEqual(self.record["counts"]["virtual_zero_fill_bytes"], 4)
        self.assertEqual(self.validate().errors, [])

    def test_missing_disposable_complement_is_warning(self):
        self.database.unlink()
        findings = self.validate()
        self.assertEqual(findings.errors, [])
        self.assertEqual(findings.warnings[0]["category"], "disposable_inventory_absent")

    def test_missing_parent_preserves_explicit_provenance_limit(self):
        self.parent_path.unlink()
        findings = self.validate()
        self.assertEqual(findings.errors, [])
        self.assertEqual(len(findings.warnings), 1)

    def test_absent_inventory_cannot_forge_file_backing_counts(self):
        self.build_fixture(virtual_tail=True)
        self.database.unlink()
        self.record["counts"]["file_backed_bytes"] -= 1
        self.record["counts"]["virtual_zero_fill_bytes"] += 1
        self.record["residual_byte_partition"]["mixed_or_other"] -= 1
        self.record["residual_byte_partition"]["virtual_zero_fill"] += 1
        self.assert_rejected("complement_mapping")

    def test_absent_inventory_cannot_reclassify_mixed_bytes_as_uniform_padding(self):
        self.database.unlink()
        self.record["residual_byte_partition"]["mixed_or_other"] -= 1
        self.record["residual_byte_partition"]["uniform_cc_candidate"] = 1
        self.assert_rejected("complement_mapping")

    def test_changed_target_or_tool_cannot_reuse_record(self):
        stale = copy.deepcopy(self.record)
        stale["target"]["sha256"] = "a" * 64
        self.assertTrue(self.validate(stale).errors)
        (self.root / "scripts/inventory-current-target.py").write_text("changed helper")
        self.assert_rejected("complement_generator")

    def test_parent_summary_and_database_hashes_are_independent(self):
        self.record["input_summary_sha256"] = "a" * 64
        self.assert_rejected("complement_input")
        self.record["input_summary_sha256"] = check._hash(self.root / "docs/analysis/coverage/instruction-summary.json")
        with self.parent_path.open("ab") as stream:
            stream.write(b"changed inventory bytes")
        self.assert_rejected("complement_input")

    def test_padding_or_unknown_partition_cannot_hide_missing_bytes(self):
        self.record["residual_byte_partition"]["invented_noncode"] = 1
        self.assert_rejected("complement_accounting")

    def test_boolean_or_negative_counts_are_not_numeric_evidence(self):
        for value in (-1, True):
            self.record["counts"]["decoded_bytes_union"] = value
            self.assert_rejected("complement_accounting")

    def test_native_semantics_parity_and_gap_remain_open(self):
        for changes in (dict(native_semantics_complete=True), dict(parity_verified=True), dict(gap_ids=[])):
            findings = self.validate({**self.record, **changes})
            self.assertIn("completion_claim", {row["category"] for row in findings.errors})

    def test_present_inventory_digest_must_match(self):
        self.record["inventory"]["sha256"] = "a" * 64
        self.assert_rejected("complement_inventory")

    def test_present_inventory_metadata_must_match_even_with_new_checksum(self):
        self.mutate_database("UPDATE metadata SET value='{}'")
        self.assert_rejected("complement_inventory")

    def test_exact_regions_and_byte_hashes_are_recomputed(self):
        self.mutate_database("UPDATE regions SET sha256=?", ("a" * 64,))
        self.assert_rejected("complement_mapping")

    def test_instruction_bytes_must_match_exe(self):
        self.mutate_database("UPDATE instructions SET bytes='cc' WHERE site=?", (self.base + 8,))
        self.assert_rejected("complement_bytes")

    def test_instruction_cannot_cross_complement_end(self):
        self.mutate_database("UPDATE instructions SET site=?,end=?,bytes='cccc' WHERE site=?",
                             (self.base + 15, self.base + 17, self.base + 8))
        self.assert_rejected("complement_bytes")

    def test_seed_provenance_must_match_parent_and_have_a_path(self):
        self.mutate_database("UPDATE seeds SET target=?", (self.base + 6,))
        self.assert_rejected("complement_seeds")

    def test_counts_and_residual_union_are_checked_against_rows(self):
        self.record["counts"]["decoded_instruction_records"] += 1
        self.assert_rejected("complement_accounting")
        self.record["counts"]["decoded_instruction_records"] -= 1
        self.record["residual_byte_partition"]["mixed_or_other"] += 1
        self.assert_rejected("complement_accounting")

    def test_terminal_stop_is_required_for_closed_trace(self):
        self.mutate_database("DELETE FROM stops")
        self.assert_rejected("complement_flow")

    def test_encoded_reference_address_can_cover_all_uint64(self):
        self.assertEqual(check._address("0xffffffffffffffff"), (1 << 64) - 1)
        for value in (True, -1, 1 << 64):
            with self.assertRaises(ValueError):
                check._address(value)


if __name__ == "__main__":
    unittest.main()
