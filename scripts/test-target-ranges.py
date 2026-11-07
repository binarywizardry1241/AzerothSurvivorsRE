#!/usr/bin/env python3
"""Non-compiling regressions for omitted bytes and false padding claims."""

import importlib.util
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("target_ranges", ROOT / "scripts/inventory-target-ranges.py")
ranges = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ranges)


def fixture():
    sections = [dict(name=".text", raw_offset=0x200, raw_size=0x200,
                     virtual_size=0x181, rva=0x1000, characteristics="0x60000020"),
                dict(name=".data", raw_offset=0x600, raw_size=0x200,
                     virtual_size=0x300, rva=0x2000, characteristics="0xc0000040")]
    def rva_offset(rva):
        if rva < 0x200:
            return rva
        for section in sections:
            if section["rva"] <= rva < section["rva"] + section["raw_size"]:
                return section["raw_offset"] + rva - section["rva"]
        raise ValueError("unmapped RVA")
    return SimpleNamespace(data=bytes(0xa00), pe=0x80, optional=0x98,
                           optional_size=0xf0, sections=sections,
                           u32=lambda at: 0x200, directories=[(0, 0)] * 16,
                           rva_offset=rva_offset)


class FileRangeAccounting(unittest.TestCase):
    def test_gaps_trailer_and_raw_alignment_bytes_are_kept_unknown(self):
        rows = ranges.partition(fixture())
        self.assertEqual(sum(row["byte_count"] for row in rows), 0xa00)
        selected = {row["structural_class"]: row for row in rows}
        for kind, start, end in (("raw_alignment_tail_unknown", 0x381, 0x400),
                                 ("unmapped_file_gap_unknown", 0x400, 0x600),
                                 ("overlay_or_trailer_unknown", 0x800, 0xa00)):
            self.assertEqual((selected[kind]["file_start"], selected[kind]["file_end_exclusive"]), (start, end))
            self.assertEqual(selected[kind]["semantic_status"], "unknown")
            self.assertEqual(selected[kind]["uniform_byte_observation"], 0)
        # Virtual .data extends beyond its file bytes; those extra bytes are not
        # assigned to the following file trailer or double counted.
        data = [row for row in rows if row["section"] == ".data"]
        self.assertEqual(sum(row["byte_count"] for row in data), 0x200)

    def test_security_directory_is_a_file_offset_in_the_trailer(self):
        pe = fixture()
        pe.directories[4] = (0x900, 0x40)
        row = next(row for row in ranges.partition(pe) if 4 in row["directory_indices"])
        self.assertEqual((row["file_start"], row["file_end_exclusive"]), (0x900, 0x940))
        self.assertEqual(row["structural_class"], "overlay_or_trailer_unknown")

    def test_directory_rva_splits_the_exact_raw_region(self):
        pe = fixture()
        pe.directories[3] = (0x2020, 0x30)
        row = next(row for row in ranges.partition(pe) if 3 in row["directory_indices"])
        self.assertEqual((row["file_start"], row["file_end_exclusive"]), (0x620, 0x650))

    def test_overlapping_sections_and_headers_fail(self):
        for offset in (0x100, 0x300):
            pe = fixture()
            pe.sections[1]["raw_offset"] = offset
            with self.assertRaisesRegex(ValueError, "Overlapping"):
                ranges.partition(pe)

    def test_truncated_section_and_directory_fail(self):
        pe = fixture()
        pe.sections[1]["raw_size"] = 0x500
        with self.assertRaisesRegex(ValueError, "truncated section"):
            ranges.partition(pe)
        pe = fixture()
        pe.directories[4] = (0x9f0, 0x20)
        with self.assertRaisesRegex(ValueError, "truncated directory"):
            ranges.partition(pe)

    def test_header_table_outside_size_of_headers_fails(self):
        pe = fixture()
        pe.optional_size = 0x200
        with self.assertRaisesRegex(ValueError, "header/table"):
            ranges.partition(pe)

    def test_virtual_directory_without_raw_bytes_fails(self):
        pe = fixture()
        pe.directories[2] = (0x2200, 0x20)
        with self.assertRaisesRegex(ValueError, "unmapped RVA"):
            ranges.partition(pe)

    def test_selectors_and_hashes_change_with_exact_bytes(self):
        pe = fixture()
        original = ranges.partition(pe)
        changed = bytearray(pe.data)
        changed[-1] = 0x7f
        pe.data = bytes(changed)
        after = ranges.partition(pe)
        self.assertEqual([row["selector"] for row in original], [row["selector"] for row in after])
        self.assertNotEqual(original[-1]["sha256"], after[-1]["sha256"])
        self.assertIsNone(after[-1]["uniform_byte_observation"])

    def test_data_files_extra_missing_changed_and_symlinked(self):
        scratch = ROOT / "runtime/tests/coverage"
        scratch.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as directory:
            root = Path(directory)
            archive = root / "patch.MPQ"
            archive.write_bytes(b"fixture")
            expected = {"path": "installed-game/Data/patch.MPQ", "size_bytes": 7,
                        "sha256": ranges.digest(b"fixture")}
            target = {"runtime_data": {"directory": "installed-game/Data", "archives": [expected]}}
            with patch.object(ranges, "artifact_path", return_value=root), \
                 patch.object(ranges, "artifact_reference", side_effect=lambda p: "installed-game/Data/" + p.name), \
                 patch.object(ranges, "file_sha256", side_effect=lambda p: ranges.digest((root / p.rsplit("/", 1)[-1]).read_bytes())):
                extra = root / "unknown.bin"
                extra.write_bytes(b"opaque")
                rows = ranges.data_resources(target)
                self.assertEqual([r["registered_archive"] for r in rows], [True, False])
                self.assertTrue(all(r["semantic_status"] == "unknown" for r in rows))
                archive.write_bytes(b"changed")
                with self.assertRaisesRegex(ValueError, "changed"):
                    ranges.data_resources(target)
                archive.unlink()
                with self.assertRaisesRegex(ValueError, "missing"):
                    ranges.data_resources(target)
                archive.symlink_to(extra.name)
                with self.assertRaisesRegex(ValueError, "symlink"):
                    ranges.data_resources(target)


if __name__ == "__main__":
    unittest.main()
