#!/usr/bin/env python3
"""Derived artifact verification/publication regressions; no compiler or target."""
import gzip
import os
from pathlib import Path
import struct
import tempfile
import unittest
from unittest.mock import patch

from coverage_common import ROOT
from derived_gzip import CHUNK_SIZE, DerivedGzipMismatch, derived_gzip_text


class DerivedGzip(unittest.TestCase):
    def setUp(self):
        fixtures = ROOT / "runtime/tests/derived-gzip"
        fixtures.mkdir(parents=True, exist_ok=True)
        self.directory = tempfile.TemporaryDirectory(dir=fixtures)
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        self.path = self.root / "derived.tsv.gz"

    def legacy(self, content=b"header\nvalue\n"):
        with self.path.open("wb") as raw:
            with gzip.GzipFile(filename="retained-source.tsv", mode="wb", fileobj=raw,
                               mtime=123456789, compresslevel=1) as output:
                output.write(content)
        os.utime(self.path, ns=(1000000001, 1000000002))
        return self.path.read_bytes(), self.path.stat().st_mtime_ns

    def unchanged(self, original):
        self.assertEqual((self.path.read_bytes(), self.path.stat().st_mtime_ns), original)
        self.assertEqual(list(self.root.iterdir()), [self.path])

    def test_equal_verification_and_publication_preserve_legacy_bytes_and_mtime(self):
        original = self.legacy()
        for publish in (False, True):
            with derived_gzip_text(self.path, publish=publish) as output:
                self.assertEqual(output.write("header\n"), 7)
                output.write("value\n")
            self.unchanged(original)

    def test_changed_content_and_missing_suffix_fail_without_changing_existing(self):
        original = self.legacy()
        for content in ("header\nchanged\n", "header\n", "header\nvalue\nextra\n"):
            with self.subTest(content=content), self.assertRaisesRegex(DerivedGzipMismatch, "differs"):
                with derived_gzip_text(self.path) as output:
                    output.write(content)
            self.unchanged(original)

    def test_missing_read_only_artifact_does_not_create_file_or_parent(self):
        missing = self.root / "absent" / "derived.tsv.gz"
        with self.assertRaisesRegex(DerivedGzipMismatch, "missing"):
            with derived_gzip_text(missing) as output:
                output.write("content")
        self.assertEqual(list(self.root.iterdir()), [])

    def test_invalid_read_only_gzip_is_rejected_without_modification(self):
        self.path.write_bytes(b"not gzip")
        original = self.path.read_bytes(), self.path.stat().st_mtime_ns
        with self.assertRaisesRegex(DerivedGzipMismatch, "invalid"):
            with derived_gzip_text(self.path) as output:
                output.write("content")
        self.unchanged(original)

    def test_explicit_create_and_update_are_deterministic_across_names(self):
        original = self.legacy()
        other = self.root / "new" / "other-name.tsv.gz"
        for path in (self.path, other):
            with derived_gzip_text(path, publish=True) as output:
                output.write("fresh\n")
        encoded = self.path.read_bytes()
        self.assertNotEqual(encoded, original[0])
        self.assertEqual(encoded, other.read_bytes())
        self.assertEqual(struct.unpack_from("<I", encoded, 4)[0], 0)
        self.assertEqual(encoded[3] & 8, 0, "gzip filename must not vary by destination")
        self.assertEqual(gzip.decompress(encoded), b"fresh\n")

    def test_final_alias_preserves_shared_object_and_detaches_only_on_change(self):
        original = self.legacy()
        alias = self.root / "alias.tsv.gz"
        alias.symlink_to(self.path.name)
        alias_mtime = alias.lstat().st_mtime_ns
        for publish in (False, True):
            with derived_gzip_text(alias, publish=publish) as output:
                output.write("header\nvalue\n")
            self.assertTrue(alias.is_symlink())
            self.assertEqual(alias.lstat().st_mtime_ns, alias_mtime)
            self.assertEqual((self.path.read_bytes(), self.path.stat().st_mtime_ns), original)
        with self.assertRaisesRegex(DerivedGzipMismatch, "differs"):
            with derived_gzip_text(alias) as output:
                output.write("changed\n")
        self.assertTrue(alias.is_symlink())
        self.assertEqual(alias.lstat().st_mtime_ns, alias_mtime)
        self.assertEqual((self.path.read_bytes(), self.path.stat().st_mtime_ns), original)
        with derived_gzip_text(alias, publish=True) as output:
            output.write("changed\n")
        self.assertFalse(alias.is_symlink())
        self.assertEqual(gzip.decompress(alias.read_bytes()), b"changed\n")
        self.assertEqual((self.path.read_bytes(), self.path.stat().st_mtime_ns), original)

    def test_parent_alias_publication_stays_at_alias_directory_destination(self):
        destination = self.root / "real"
        destination.mkdir()
        parent_alias = self.root / "parent"
        parent_alias.symlink_to(destination.name, target_is_directory=True)
        path = parent_alias / "derived.tsv.gz"
        with derived_gzip_text(path, publish=True) as output:
            output.write("content\n")
        original = path.read_bytes(), path.stat().st_mtime_ns
        with derived_gzip_text(path) as output:
            output.write("content\n")
        self.assertEqual((path.read_bytes(), path.stat().st_mtime_ns), original)
        self.assertTrue(parent_alias.is_symlink())

    def test_unicode_chunked_verification_and_empty_payload(self):
        text = "x" * (CHUNK_SIZE - 1) + "é\n" + "tail" * 100
        for content in (text, ""):
            with derived_gzip_text(self.path, publish=True) as output:
                output.write(content)
            with derived_gzip_text(self.path) as output:
                for start in range(0, len(content), 47):
                    output.write(content[start:start + 47])

    def test_producer_exceptions_preserve_existing_and_cleanup_only_owned_temp(self):
        original = self.legacy()
        unrelated = self.root / ".derived.tsv.gz.someone-else.tmp"
        unrelated.write_text("preserve")
        for publish in (False, True):
            with self.assertRaisesRegex(RuntimeError, "producer failed"):
                with derived_gzip_text(self.path, publish=publish) as output:
                    output.write("header\n")
                    raise RuntimeError("producer failed")
            self.assertEqual((self.path.read_bytes(), self.path.stat().st_mtime_ns), original)
            self.assertEqual(set(self.root.iterdir()), {self.path, unrelated})
            self.assertEqual(unrelated.read_text(), "preserve")

    def test_failed_new_publication_leaves_no_artifact_or_staging_file(self):
        with self.assertRaisesRegex(RuntimeError, "producer failed"):
            with derived_gzip_text(self.path, publish=True) as output:
                output.write("partial")
                raise RuntimeError("producer failed")
        self.assertEqual(list(self.root.iterdir()), [])

    def test_read_only_verification_never_stages_and_keeps_producer_error_identity(self):
        original = self.legacy()
        error = FileNotFoundError("a producer input is absent")
        with patch("derived_gzip.tempfile.mkstemp", side_effect=AssertionError("must not stage")):
            with derived_gzip_text(self.path) as output:
                output.write("header\nvalue\n")
            with self.assertRaises(FileNotFoundError) as caught:
                with derived_gzip_text(self.path):
                    raise error
        self.assertIs(caught.exception, error)
        self.unchanged(original)

    def test_publication_io_failure_preserves_existing_and_cleans_staging(self):
        original = self.legacy()
        with patch("derived_gzip.os.replace", side_effect=OSError("cannot publish")):
            with self.assertRaisesRegex(OSError, "cannot publish"):
                with derived_gzip_text(self.path, publish=True) as output:
                    output.write("changed\n")
        self.unchanged(original)


if __name__ == "__main__":
    unittest.main()
