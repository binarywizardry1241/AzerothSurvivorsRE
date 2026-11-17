#!/usr/bin/env python3
"""Non-compiling fixtures for shared exact streams and retained gzip readers."""
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import sqlite3
import tempfile
import unittest
from unittest.mock import patch

from shared_analysis import SharedAnalysis, file_digest
import shared_payloads as gzip
from shared_payloads import compact_object, descriptor, materialized, open_payload, payload_size, read_payload, retire_path, resolve_payload

ROOT = Path(__file__).resolve().parents[1]


class PayloadTests(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/tmp"
        scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(prefix="shared-payload-fixture-", dir=scratch)
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.compression = patch.dict(os.environ, {"REA_CAS_FILESYSTEM_COMPRESSION": "0"})
        self.compression.start()
        self.addCleanup(self.compression.stop)
        self.store = SharedAnalysis(self.root)

    def publish(self, data, target="a" * 64):
        receipt = self.store.put_bytes(data, provenance={"target_sha256": target})
        compact_object(self.store, receipt)
        return receipt, self.store.object_path(receipt["sha256"])

    def test_exact_encoded_bytes_headers_aliases_and_version_provenance(self):
        data = gzip.compress(os.urandom(600000), mtime=123456)
        receipt, path = self.publish(data)
        self.assertLess(path.stat().st_size, 256)
        self.assertEqual(read_payload(path), data)
        self.assertEqual(file_digest(path), hashlib.sha256(data).hexdigest())
        self.assertEqual(payload_size(path), len(data))
        alias = self.root / "runtime/history/instructions.tsv.gz"
        self.store.link_alias(alias, receipt, {"target_sha256": "b" * 64, "pass": "declared"})
        with gzip.open(alias, "rb") as stream:
            content = stream.read()
            stream.seek(0)
            self.assertEqual(stream.read(), content)
        self.store.observe(receipt, {"target_sha256": "c" * 64}, "historical-query")
        with self.store.connect() as connection:
            rows = connection.execute("SELECT provenance FROM analysis_observations WHERE sha256=?", (receipt["sha256"],)).fetchall()
        self.assertEqual(len(rows), 2)
        self.assertEqual(self.store.verify()["integrity"], "ok")
        self.assertFalse(compact_object(self.store, receipt)["compacted"])

    def test_insertion_deduplicates_across_snapshots_and_readers_do_not_lock_writers(self):
        # Deliberate content boundaries make sharing independent of byte offsets.
        segment = os.urandom(20000).replace(b"\xa5\x5a", b"AB") + b"\xa5\x5a"
        first = segment * 30
        r1, p1 = self.publish(first)
        r2, p2 = self.publish(b"new version prefix" + first, target="b" * 64)
        self.assertEqual(read_payload(p1), first)
        self.assertEqual(read_payload(p2), b"new version prefix" + first)
        with self.store.connect() as connection:
            logical = connection.execute("SELECT SUM(bytes) FROM payload_snapshots").fetchone()[0]
            unique = connection.execute("SELECT SUM(bytes) FROM payload_chunks").fetchone()[0]
        self.assertLess(unique, logical / 2)
        with open_payload(p1) as stream:
            stream.read(1)
            self.store.put_bytes(b"publication during an active reader")
            self.assertEqual(stream.read(), first[1:])

    def test_corruption_missing_chunks_and_wrong_receipts_fail_closed(self):
        receipt, path = self.publish(os.urandom(100000))
        with self.store.connect() as connection:
            original = connection.execute("SELECT sha256,payload FROM payload_chunks LIMIT 1").fetchone()
            connection.execute("UPDATE payload_chunks SET payload=? WHERE sha256=?", (b"wrong", original[0]))
        with self.assertRaisesRegex(ValueError, "chunk bytes differ"):
            read_payload(path)
        with self.store.connect() as connection:
            connection.execute("UPDATE payload_chunks SET payload=? WHERE sha256=?", (original[1], original[0]))
            connection.execute("DELETE FROM payload_membership WHERE snapshot=? AND ordinal=0", (receipt["sha256"],))
        with self.assertRaisesRegex(ValueError, "original commitment"):
            read_payload(path)

    def test_interrupted_publication_preserves_original_and_can_retry(self):
        data = os.urandom(100000)
        receipt = self.store.put_bytes(data)
        path = self.store.object_path(receipt["sha256"])
        with patch("shared_payloads.os.replace", side_effect=OSError("interrupted")):
            with self.assertRaisesRegex(OSError, "interrupted"):
                compact_object(self.store, receipt)
        self.assertEqual(path.read_bytes(), data)
        self.assertFalse(list(path.parent.glob(".payload-*")))
        compact_object(self.store, receipt)
        self.assertEqual(read_payload(path), data)

    def test_native_materialization_restores_on_failure_and_preserves_changed_outputs(self):
        data = gzip.compress(os.urandom(100000), mtime=999)
        receipt, path = self.publish(data)
        alias = self.root / "runtime/analysis/census/target/pass/instructions.tsv.gz"
        alias.parent.mkdir(parents=True)
        os.link(path, alias)
        with self.assertRaisesRegex(RuntimeError, "native failure"):
            with materialized([alias]):
                self.assertEqual(alias.read_bytes(), data)
                self.assertIsNone(descriptor(alias))
                raise RuntimeError("native failure")
        self.assertIsNotNone(descriptor(alias))
        self.assertEqual(read_payload(alias), data)
        with materialized([alias]):
            alias.write_bytes(b"new native output")
        self.assertEqual(alias.read_bytes(), b"new native output")
        self.assertEqual(read_payload(path), data)

    def test_plain_gzip_files_writing_and_text_reading_keep_standard_contract(self):
        path = self.root / "runtime/plain.gz"
        with gzip.open(path, "wt", encoding="utf-8", newline="") as stream:
            stream.write("header\tvalue\nrow\t42\n")
        data = path.read_bytes()
        receipt, packed = self.publish(data)
        with gzip.open(packed, "rt", encoding="utf-8", newline="") as stream:
            self.assertEqual(stream.read(), "header\tvalue\nrow\t42\n")
        with self.assertRaisesRegex(ValueError, "staged replacement"):
            gzip.open(packed, "wb")
        self.assertEqual(read_payload(packed), data)

    def test_retirement_deletes_archive_and_every_old_path_still_reads_exact_bytes(self):
        raw = b"address\tlength\tbytes\tflow\n140001000\t2\t4156\tFALL_THROUGH\n"
        data = gzip.compress(raw, mtime=2222)
        receipt, canonical = self.publish(data)
        aliases = [self.root / "runtime/analysis/census/target/declared/instructions.tsv.gz",
                   self.root / "runtime/analysis/census/target/expanded/instructions.tsv.gz"]
        for path in aliases:
            self.store.link_alias(path, receipt, {"target_sha256": "a" * 64, "pass": path.parent.name})
            retire_path(self.store, path, receipt)
            self.assertFalse(path.exists() or path.is_symlink())
            self.assertEqual(resolve_payload(path), canonical)
            self.assertEqual(read_payload(path), data)
            self.assertEqual(file_digest(path), receipt["sha256"])
            from coverage_common import file_sha256, project_path
            self.assertEqual(file_sha256(path), receipt["sha256"])
            self.assertEqual(project_path(path), canonical)
            with gzip.open(path, "rt") as stream:
                self.assertEqual(stream.read(), raw.decode())
            with materialized([path]):
                self.assertEqual(path.read_bytes(), data)
            self.assertFalse(path.exists())
        self.assertEqual(self.store.verify()["retired_payload_paths"], 2)
        # Nothing silently redirects an unknown filename to a similar snapshot.
        with self.assertRaises(FileNotFoundError):
            read_payload(aliases[0].with_name("missing.tsv.gz"))

    def test_completed_census_publication_removes_archives_and_replays_idempotently(self):
        from script_sources import load_script
        manager = load_script("payload_census_manager", "manage-analysis-store.py")
        directory = self.root / "runtime/analysis/census" / ("a" * 64) / "pass"
        directory.mkdir(parents=True)
        plan = directory / "plan.json"
        plan.write_text(json.dumps({"output": str(directory), "target_sha256": "a" * 64,
                                    "script_sha256": "b" * 64}))
        files, originals = {}, {}
        for name in manager.CENSUS_EXPORTS:
            data = gzip.compress(os.urandom(90000), mtime=7)
            path = directory / name
            path.write_bytes(data)
            files[name] = {"sha256": file_digest(path), "bytes": len(data)}
            originals[name] = data
        progress = directory / "progress.json"
        progress.write_text(json.dumps({"stage": "completed", "plan_sha256": file_digest(plan),
                                       "target_sha256": "a" * 64, "script_sha256": "b" * 64, "files": files}))
        retained = progress.read_bytes()
        self.assertEqual(manager.share_census_exports(plan, self.root)["shared"], 5)
        for name, data in originals.items():
            self.assertFalse((directory / name).exists())
            self.assertEqual(read_payload(directory / name), data)
        self.assertEqual(progress.read_bytes(), retained)
        self.assertEqual(manager.share_census_exports(plan, self.root)["shared"], 0)
        self.assertEqual(self.store.verify()["retired_payload_paths"], 5)

    def test_pipeline_manifest_inputs_and_parent_aliases_resolve_deleted_names(self):
        from execheck_pipeline import expand_files, manifest_inputs
        data = gzip.compress(b"retained rows\n", mtime=7)
        receipt, canonical = self.publish(data)
        path = self.root / "runtime/analysis/census/target/pass/references.tsv.gz"
        self.store.link_alias(path, receipt)
        retire_path(self.store, path, receipt)
        alias = self.root / "runtime/coverage/work/declared"
        alias.parent.mkdir(parents=True)
        alias.symlink_to(os.path.relpath(path.parent, alias.parent), target_is_directory=True)
        old = alias / path.name
        self.assertEqual(read_payload(old), data)
        name = old.relative_to(self.root).as_posix()
        self.assertEqual(expand_files(self.root, [name]), {name: receipt['sha256']})
        report = self.root / 'report.json'
        report.write_text(json.dumps({'path': name, 'sha256': receipt['sha256']}))
        result = manifest_inputs(self.root, {'report.json': file_digest(report)})
        self.assertEqual(result[name], receipt['sha256'])

    def test_retained_tar_reader_uses_shared_exact_archive(self):
        import tarfile
        from shared_payloads import open_tar
        buffer = io.BytesIO()
        with tarfile.open(fileobj=buffer, mode='w:gz') as archive:
            member = tarfile.TarInfo('retained.txt')
            member.size = 8
            archive.addfile(member, io.BytesIO(b'evidence'))
        receipt, canonical = self.publish(buffer.getvalue())
        path = self.root / 'runtime/analysis/history/category/retained.tar.gz'
        self.store.link_alias(path, receipt)
        retire_path(self.store, path, receipt)
        with open_tar(path) as archive:
            self.assertEqual(archive.extractfile('retained.txt').read(), b'evidence')
        self.assertFalse(path.exists())


if __name__ == "__main__":
    unittest.main()
