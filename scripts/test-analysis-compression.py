#!/usr/bin/env python3
"""Verify transparent CAS compression with portable injected storage copies."""

import gzip
import json
import os
from pathlib import Path
import shutil
import sys
import tempfile
import unittest
from unittest.mock import patch

from shared_analysis import SharedAnalysis, file_digest

ROOT = Path(__file__).resolve().parents[1]


class CompressionTests(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/tests/analysis-compression"
        scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.root = Path(self.temporary.name)
        self.store = SharedAnalysis(self.root)

    def tearDown(self):
        self.temporary.cleanup()
        try:
            (ROOT / "runtime/tests/analysis-compression").rmdir()
        except OSError:
            pass

    def put(self, data):
        with patch.dict(os.environ, {"REA_CAS_FILESYSTEM_COMPRESSION": "0"}):
            return self.store.put_bytes(data)

    @staticmethod
    def sparse_copy(source, destination):
        # Fixture bytes are all zero. A sparse copy changes allocated blocks,
        # while its ordinary readable byte stream stays exactly the same.
        with destination.open("xb") as stream:
            stream.truncate(source.stat().st_size)

    def test_verified_compression_preserves_hash_alias_and_mode(self):
        receipt = self.put(b"\0" * (2 * 1024 * 1024))
        original = self.store.verify_receipt(receipt)
        old_mode = original.stat().st_mode & 0o777
        alias = self.root / "runtime/task/native.bin"
        self.store.link_alias(alias, receipt)
        result = self.store.compress_object(receipt, copier=self.sparse_copy)
        self.assertTrue(result["compressed"])
        self.assertGreater(result["reclaimed_allocated_bytes"], 0)
        self.assertEqual(file_digest(alias), receipt["sha256"])
        self.assertEqual(original.stat().st_mode & 0o777, old_mode)
        self.assertEqual(self.store.verify()["integrity"], "ok")
        self.assertFalse(self.store.compress_object(receipt, copier=self.sparse_copy)["compressed"])

    def test_bad_copy_is_rejected_and_original_stays_accessible(self):
        receipt = self.put(b"\0" * (2 * 1024 * 1024))
        original = self.store.verify_receipt(receipt)
        inode = original.stat().st_ino

        def corrupt(source, destination):
            destination.write_bytes(b"different bytes")

        with self.assertRaisesRegex(ValueError, "staging bytes differ"):
            self.store.compress_object(receipt, copier=corrupt)
        self.assertEqual(original.stat().st_ino, inode)
        self.store.verify_receipt(receipt)
        self.assertEqual(list((self.store.store / "compression-staging").iterdir()), [])

    def test_copy_without_reduction_does_not_replace_object(self):
        receipt = self.put(b"x" * (2 * 1024 * 1024))
        original = self.store.verify_receipt(receipt)
        inode = original.stat().st_ino
        result = self.store.compress_object(receipt, copier=shutil.copyfile)
        self.assertFalse(result["compressed"])
        self.assertEqual(original.stat().st_ino, inode)

    def test_compressed_magic_is_skipped_before_copy(self):
        # Deliberately padded gzip-like bytes exercise magic rather than size.
        receipt = self.put(b"\x1f\x8b" + os.urandom(2 * 1024 * 1024))

        def unexpected(*args):
            self.fail("Compressed formats must not be copied")

        result = self.store.compress_object(receipt, copier=unexpected)
        self.assertEqual(result["reason"], "compressed payload format")

    def test_only_owned_abandoned_staging_copy_is_cleaned(self):
        receipt = self.put(b"\0" * (2 * 1024 * 1024))
        staging = self.store.store / "compression-staging"
        staging.mkdir()
        stem = receipt["sha256"] + "-" + "a" * 32
        (staging / (stem + ".pending")).write_bytes(b"interrupted scratch")
        (staging / (stem + ".json")).write_text(json.dumps({"format": "rea-cas-filesystem-compression-v1",
             "sha256": receipt["sha256"], "bytes": receipt["bytes"], "token": "a" * 32}))
        unowned = staging / "unique-evidence.bin"
        unowned.write_bytes(b"keep")
        self.store.compress_object(receipt, copier=self.sparse_copy)
        self.assertEqual(unowned.read_bytes(), b"keep")
        self.assertFalse((staging / (stem + ".pending")).exists())

    def test_portable_unavailable_compression_keeps_file(self):
        receipt = self.put(b"x" * (2 * 1024 * 1024))
        with patch("shared_analysis.sys.platform", "linux"):
            result = self.store.compress_object(receipt)
        self.assertFalse(result["compressed"])
        self.assertEqual(result["reason"], "filesystem compression unavailable")
        self.store.verify_receipt(receipt)

    @unittest.skipUnless(sys.platform == "darwin" and Path("/usr/bin/ditto").is_file(), "Darwin ditto probe")
    def test_installed_ditto_preserves_actual_local_bytes(self):
        receipt = self.put((b"native instructions and references\n" * 100000))
        result = self.store.compress_object(receipt)
        self.assertTrue(result["compressed"])
        self.assertGreater(result["reclaimed_allocated_bytes"], 0)
        self.store.verify_receipt(receipt)


if __name__ == "__main__":
    unittest.main()
