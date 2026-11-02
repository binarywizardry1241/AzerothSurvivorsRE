#!/usr/bin/env python3
"""Verify dependency-source certificates without native inputs or execution."""
import hashlib
import unittest
from types import SimpleNamespace

from script_sources import load_script

transport = load_script("transport_certificate", "check-coop-directory-transport.py")


class SourceLiteral(unittest.TestCase):
    def setUp(self):
        self.raw = b"compiler-prefix/registry/src/dependency/src/client.rs"
        self.data = b"prefix" + self.raw + b"suffix"
        self.pe = SimpleNamespace(image_base=0x1000, rva_offset=lambda address: address)
        self.row = dict(address="0x1006", file_offset="0x6", byte_count=len(self.raw),
                        sha256=hashlib.sha256(self.raw).hexdigest(),
                        source_path="registry/src/dependency/src/client.rs")

    def test_relative_source_and_full_native_digest_are_independent(self):
        self.assertEqual(transport.literal_bytes(self.row, self.data, self.pe), self.raw)

    def test_literal_byte_certificates_keep_exact_content_checks(self):
        row = {key: value for key, value in self.row.items() if key not in ("source_path", "byte_count")}
        row.update(hex=self.raw.hex(), text=self.raw.decode())
        self.assertEqual(transport.literal_bytes(row, self.data, self.pe), self.raw)
        with self.assertRaises(AssertionError):
            transport.literal_bytes(dict(row, text="different literal"), self.data, self.pe)

    def test_changed_prefix_bytes_still_fail_the_original_range_digest(self):
        with self.assertRaises(AssertionError):
            transport.literal_bytes(self.row, self.data.replace(b"compiler", b"modified"), self.pe)

    def test_wrong_suffix_and_truncated_ranges_are_rejected(self):
        with self.assertRaises(AssertionError):
            transport.literal_bytes(dict(self.row, source_path="different.rs"), self.data, self.pe)
        with self.assertRaises(AssertionError):
            transport.literal_bytes(self.row, self.data[:10], self.pe)


if __name__ == "__main__":
    unittest.main()
