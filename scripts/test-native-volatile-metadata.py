#!/usr/bin/env python3
"""Noncompiling regressions using encoded PE64 bytes, with no reference EXE."""
import importlib.util
from pathlib import Path
import struct
import unittest

spec = importlib.util.spec_from_file_location("volatile_check", Path(__file__).with_name("check-native-volatile-metadata.py"))
checker = importlib.util.module_from_spec(spec)
spec.loader.exec_module(checker)

BASE, OPTIONAL, METADATA = 0x140000000, 0x98, 0x520


def fixture():
    data = bytearray(0xA00)
    data[:2] = b"MZ"
    struct.pack_into("<I", data, 0x3C, 0x80)
    data[0x80:0x84] = b"PE\0\0"
    struct.pack_into("<HHIIIHH", data, 0x84, 0x8664, 2, 0, 0, 0, 0xF0, 0x22)
    struct.pack_into("<H", data, OPTIONAL, 0x20B)
    struct.pack_into("<Q", data, OPTIONAL + 24, BASE)
    struct.pack_into("<II", data, OPTIONAL + 56, 0x3000, 0x200)
    struct.pack_into("<I", data, OPTIONAL + 108, 16)
    struct.pack_into("<II", data, OPTIONAL + 112 + 10 * 8, 0x2000, 0x108)
    for at, name, rva, virtual, raw, offset, flags in (
        (0x188, b".text", 0x1000, 0x100, 0x200, 0x200, 0x60000020),
        (0x1B0, b".rdata", 0x2000, 0x500, 0x600, 0x400, 0x40000040),
    ):
        data[at:at + len(name)] = name
        struct.pack_into("<IIII", data, at + 8, virtual, rva, raw, offset)
        struct.pack_into("<I", data, at + 36, flags)
    struct.pack_into("<I", data, 0x400, 0x108)
    struct.pack_into("<Q", data, 0x500, BASE + 0x2120)
    struct.pack_into("<6I", data, METADATA, 24, 0x80038003, 0x2138, 4, 0x213C, 8)
    struct.pack_into("<III", data, METADATA + 24, 0x1010, 0x1000, 0x40)
    return data


def decode(data):
    return checker.decode(checker.pe_module.PE(bytes(data)))


class VolatileMetadata(unittest.TestCase):
    def test_complete_layout_and_raw_version_do_not_claim_callable_entries(self):
        result = decode(fixture())
        self.assertEqual(result["raw_version"], "0x80038003")
        self.assertFalse(result["version_compatibility_certified"])
        self.assertEqual(result["encoded_byte_count"], 36)
        self.assertEqual(result["contiguous_span"]["byte_count"], 36)
        self.assertEqual(result["access_rvas"], ["0x1010"])
        self.assertEqual(result["ranges"], [{"rva": "0x1000", "byte_count": 64, "end_rva_exclusive": "0x1040"}])
        self.assertEqual(result["new_function_entries_proven"], 0)

    def test_uninterpreted_version_is_preserved_without_certification(self):
        data = fixture()
        struct.pack_into("<I", data, METADATA + 4, 0xFFFFFFFF)
        result = decode(data)
        self.assertEqual(result["raw_version"], "0xffffffff")
        self.assertFalse(result["version_compatibility_certified"])

    def test_nonadjacent_tables_are_not_guessed_to_be_contiguous(self):
        data = fixture()
        struct.pack_into("<I", data, METADATA + 16, 0x2200)
        struct.pack_into("<II", data, 0x600, 0x1000, 0x40)
        self.assertNotIn("contiguous_span", decode(data))

    def test_access_outside_a_validity_domain_is_reported_without_inventing_a_version_rule(self):
        data = fixture()
        struct.pack_into("<I", data, METADATA + 24, 0x1080)
        self.assertEqual(decode(data)["access_rvas_outside_ranges"], ["0x1080"])

    def test_absent_directory_field_and_null_pointer_are_distinct(self):
        for kind in ("directory", "field", "null"):
            with self.subTest(kind=kind):
                data = fixture()
                if kind == "directory":
                    struct.pack_into("<II", data, OPTIONAL + 112 + 10 * 8, 0, 0)
                elif kind == "field":
                    struct.pack_into("<I", data, 0x400, 0x100)
                else:
                    struct.pack_into("<Q", data, 0x500, 0)
                self.assertNotEqual(decode(data)["status"], "compatible-layout-decoded")

    def test_zero_tables_do_not_read_header_bytes_as_records(self):
        data = fixture()
        struct.pack_into("<4I", data, METADATA + 8, 0, 0, 0, 0)
        result = decode(data)
        self.assertEqual(result["access_rvas"], [])
        self.assertEqual(result["ranges"], [])
        self.assertEqual(result["encoded_byte_count"], 24)

    def test_invalid_sizes_widths_nulls_and_overlapping_tables_fail(self):
        for field, value in ((0, 28), (8, 0), (12, 3), (16, 0), (20, 7),
                             (8, 0x2120), (16, 0x2138), (12, 0xFFFFFFFC)):
            with self.subTest(field=field, value=value):
                data = fixture()
                struct.pack_into("<I", data, METADATA + field, value)
                with self.assertRaises(ValueError):
                    decode(data)

    def test_pointer_and_table_image_bounds_do_not_wrap(self):
        for field, value in (("pointer", BASE - 1), ("pointer", BASE + 0x2FF0),
                             ("access", 0x2FFE), ("access", 0xFFFFFFFC)):
            with self.subTest(field=field, value=value):
                data = fixture()
                if field == "pointer":
                    struct.pack_into("<Q", data, 0x500, value)
                else:
                    struct.pack_into("<I", data, METADATA + 8, value)
                with self.assertRaises(ValueError):
                    decode(data)

    def test_annotations_require_executable_loaded_file_backing(self):
        for field, value in ((24, 0x2220), (24, 0x1100), (28, 0x2220),
                             (28, 0x10F0), (28, 0xFFFFFFF0)):
            with self.subTest(field=field, value=value):
                data = fixture()
                struct.pack_into("<I", data, METADATA + field, value)
                with self.assertRaises(ValueError):
                    decode(data)

    def test_virtual_only_or_truncated_file_bytes_are_not_accepted(self):
        for kind in ("bss", "truncated", "ambiguous", "partial-overlap"):
            with self.subTest(kind=kind):
                data = fixture()
                if kind == "bss":
                    struct.pack_into("<I", data, 0x1B0 + 16, 0x120)
                elif kind == "ambiguous":
                    struct.pack_into("<I", data, 0x188 + 12, 0x2000)
                    struct.pack_into("<I", data, 0x188 + 8, 0x600)
                elif kind == "partial-overlap":
                    struct.pack_into("<I", data, 0x188 + 12, 0x2080)
                else:
                    del data[METADATA + 30:]
                with self.assertRaises(ValueError):
                    decode(data)

    def test_partial_load_config_pointer_is_not_absence(self):
        data = fixture()
        struct.pack_into("<I", data, 0x400, 0x104)
        with self.assertRaisesRegex(ValueError, "Truncated load-config"):
            decode(data)

    def test_pe32_does_not_reuse_the_pe64_pointer_offset(self):
        data = fixture()
        struct.pack_into("<H", data, OPTIONAL, 0x10B)
        with self.assertRaisesRegex(ValueError, "PE32\\+"):
            decode(data)


if __name__ == "__main__":
    unittest.main()
