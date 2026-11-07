#!/usr/bin/env python3
"""Storage/query fidelity fixtures; no provider, decoder, build or game starts."""

import hashlib
from contextlib import closing
from concurrent.futures import ThreadPoolExecutor
import json
from pathlib import Path
import sqlite3
import tempfile
import unittest
from unittest.mock import patch

from shared_analysis import SharedAnalysis
import shared_native_inventory as native

ROOT = Path(__file__).resolve().parents[1]


class NativeStorage(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/tests/shared-native"
        scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.root = Path(self.temporary.name)
        (self.root / "runtime").mkdir()

    def tearDown(self):
        self.temporary.cleanup()

    def database(self, name="one.sqlite", target="a" * 64):
        path = self.root / "runtime" / name
        with closing(sqlite3.connect(path)) as c, c:
            c.executescript("CREATE TABLE metadata(id INTEGER PRIMARY KEY,value TEXT);CREATE TABLE extents(ordinal INTEGER PRIMARY KEY,start INTEGER,end INTEGER,file_offset INTEGER,sha256 TEXT,decoded_end INTEGER,instructions INTEGER);CREATE TABLE refs(extent INTEGER,site INTEGER,bytes TEXT,kind TEXT,target TEXT,operand INTEGER,access INTEGER)")
            c.execute("INSERT INTO metadata VALUES(1,?)", (json.dumps({"target_sha256": target}),))
            c.executemany("INSERT INTO extents VALUES(?,?,?,?,?,?,?)", [(0, 4096, 4102, 0, "first", 4102, 2), (1, 8192, 8194, 6, "second", 8193, 1)])
            c.executemany("INSERT INTO refs VALUES(?,?,?,?,?,?,?)", [(0, 4096, "e805000000", "call_direct", "0x100a", 0, 0), (1, 8192, "ffd0", "call_indirect", None, 0, 0)])
            c.execute("CREATE INDEX refs_target ON refs(target)")
        return path

    def test_lossless_migration_preserves_original_hash_tables_nulls_and_row_order(self):
        path = self.database()
        expected_size = path.stat().st_size
        expected_hash = hashlib.sha256(path.read_bytes()).hexdigest()
        with closing(sqlite3.connect(path)) as c, c:
            expected = {t: c.execute("SELECT * FROM " + t + " ORDER BY rowid").fetchall() for t in ["metadata", "extents", "refs"]}
        result = native.migrate_inventory(path, root=self.root, apply=True)
        self.assertEqual(result["source_sha256"], expected_hash)
        self.assertLess(path.stat().st_size, 2000)
        self.assertEqual(native.historical_file_sha256(path, root=self.root), expected_hash)
        self.assertEqual(native.inventory_size(path, root=self.root), expected_size)
        with native.open_readonly(path, root=self.root) as c:
            for table, rows in expected.items():
                self.assertEqual(c.execute("SELECT * FROM " + table + " ORDER BY rowid").fetchall(), rows)
            c.row_factory = sqlite3.Row
            self.assertEqual(dict(c.execute("SELECT * FROM refs WHERE kind='call_indirect'").fetchone()), dict(zip(["extent", "site", "bytes", "kind", "target", "operand", "access"], expected["refs"][1])))
        self.assertEqual(native.migrate_inventory(path, root=self.root, apply=True)["state"], "already-shared")

    def test_equal_chunks_share_storage_but_target_membership_stays_distinct(self):
        first = self.database("one.sqlite", "a" * 64)
        second = self.database("two.sqlite", "b" * 64)
        native.migrate_inventory(first, root=self.root, apply=True)
        native.migrate_inventory(second, root=self.root, apply=True)
        with SharedAnalysis(self.root).connect() as c:
            self.assertEqual(c.execute("SELECT count(*) FROM native_snapshots").fetchone()[0], 2)
            self.assertEqual(c.execute("SELECT count(*) FROM native_chunks").fetchone()[0], 4)
            self.assertEqual(c.execute("SELECT count(*) FROM native_membership").fetchone()[0], 6)
        with native.open_readonly(second, root=self.root) as c:
            self.assertEqual(json.loads(c.execute("SELECT value FROM metadata").fetchone()[0])["target_sha256"], "b" * 64)

    def test_interrupted_publication_keeps_original_and_retry_reuses_chunks(self):
        path = self.database();before = path.read_bytes()
        with patch.object(native, "_write_receipt", side_effect=RuntimeError("interrupt")):
            with self.assertRaisesRegex(RuntimeError, "interrupt"):
                native.migrate_inventory(path, root=self.root, apply=True)
        self.assertEqual(path.read_bytes(), before)
        native.migrate_inventory(path, root=self.root, apply=True)
        with SharedAnalysis(self.root).connect() as c:
            self.assertEqual(c.execute("SELECT count(*) FROM native_chunks").fetchone()[0], 3)

    def test_corrupt_chunk_and_archive_fail_closed(self):
        path = self.database();native.migrate_inventory(path, root=self.root, apply=True)
        value = native.descriptor(path)
        archive = self.root / value["archive"]["path"]
        archive.chmod(0o644);archive.write_bytes(b"corrupt")
        with self.assertRaises(ValueError):
            native.historical_file_sha256(path, root=self.root)
        with SharedAnalysis(self.root).connect() as c:
            c.execute("UPDATE native_chunks SET payload=? WHERE sha256 IN (SELECT sha256 FROM native_membership WHERE table_name='refs')", (b"bad",))
        with native._open_chunks_readonly(path, root=self.root) as c:
            with self.assertRaises(sqlite3.Error):
                c.execute("SELECT * FROM refs").fetchall()

    def test_hot_cache_keeps_indexes_and_never_evicts_active_readers(self):
        paths = [self.database(str(i) + ".sqlite", str(i) * 64) for i in range(3)]
        for path in paths:
            native.migrate_inventory(path, root=self.root, apply=True)
        readers = [native.open_readonly(p, root=self.root) for p in paths]
        plan = readers[0].execute("EXPLAIN QUERY PLAN SELECT site FROM refs WHERE target=?", ("0x100a",)).fetchall()
        self.assertTrue(any("refs_target" in str(row) for row in plan), plan)
        hot = self.root / "runtime/analysis/native-hot"
        self.assertEqual(len(list(hot.glob("*.sqlite"))), 3)
        readers[1].close();readers[2].close()
        self.assertEqual(readers[0].execute("SELECT count(*) FROM refs").fetchone()[0], 2)
        readers[0].close()
        self.assertEqual(len(list(hot.glob("*.sqlite"))), 1)

    def test_receipt_catalog_escape_and_active_journal_are_rejected(self):
        path = self.database();journal = Path(str(path) + "-wal");journal.write_bytes(b"active")
        with self.assertRaisesRegex(ValueError, "active/recovery journal"):
            native.migrate_inventory(path, root=self.root, apply=True)
        journal.unlink();native.migrate_inventory(path, root=self.root, apply=True)
        value = native.descriptor(path);value["catalog"] = "../outside.sqlite"
        path.write_bytes(native.MAGIC + json.dumps(value).encode())
        with self.assertRaisesRegex(ValueError, "catalog path differs"):
            native.open_readonly(path, root=self.root)

    def test_incremental_writer_resumes_and_reuses_exact_inputs_across_targets(self):
        metadata = {"target_sha256": "a" * 64, "generator": {"decoder_version": "fixture"}, "decoder_contract": "c" * 64}
        path = self.root / "runtime/new.sqlite"
        w = native.NativeWriter(path, metadata, root=self.root)
        refs = [(4096, "e805000000", "call_direct", "0x100a", 0, 0)]
        w.store_extent((0, 4096, 4102, 0, "range", 4102, 2), refs);w.commit();w.close()
        w = native.NativeWriter(path, metadata, root=self.root)
        self.assertEqual(w.execute("SELECT ordinal FROM extents").fetchall(), [(0,)])
        w.store_extent((1, 8192, 8193, 6, "other", 8193, 1), []);w.commit();w.close()
        with native.open_readonly(path, root=self.root) as c:
            self.assertEqual(c.execute("SELECT count(*) FROM extents").fetchone()[0], 2)
            self.assertEqual(c.execute("SELECT count(*) FROM refs").fetchone()[0], 1)
        self.assertEqual(native.reuse_decoded_extent("range", 4096, 4102, "c" * 64, "fixture", root=self.root), (6, 2, refs))
        for changed in [("different", 4096, 4102, "c" * 64, "fixture"), ("range", 4100, 4106, "c" * 64, "fixture"), ("range", 4096, 4102, "d" * 64, "fixture"), ("range", 4096, 4102, "c" * 64, "changed")]:
            self.assertIsNone(native.reuse_decoded_extent(*changed, root=self.root))
        # A new target can query the same exact decode input, but its own member
        # tables stay empty until its source-byte/range validation records it.
        other = native.NativeWriter(self.root / "runtime/other.sqlite", {**metadata, "target_sha256": "b" * 64}, root=self.root)
        self.assertEqual(other.execute("SELECT count(*) FROM extents").fetchone()[0], 0)
        other.close()

    def test_decode_session_opens_once_reuses_parsed_chunks_and_preserves_catalog(self):
        metadata={"target_sha256":"a"*64,"generator":{"decoder_version":"fixture"},"decoder_contract":"c"*64}
        writer=native.NativeWriter(self.root/'runtime/session.sqlite',metadata,root=self.root)
        for ordinal in range(2):
            start=4096+ordinal*8
            writer.store_extent((ordinal,start,start+6,ordinal*6,'range'+str(ordinal),start+6,2),
                                [(start,'e805000000','call_direct','0x100a',0,0)])
        writer.commit();writer.close()
        database=self.root/'runtime/analysis/knowledge.sqlite'
        before=(database.read_bytes(),database.stat().st_mtime_ns)
        connect=native.sqlite3.connect
        with patch.object(native.sqlite3,'connect',wraps=connect) as opened:
            with native.DecodeCache('c'*64,'fixture',root=self.root) as cache:
                rows=cache.lookup_many([('range0',4096,4102),('range1',4104,4110),('missing',0,1)])
                self.assertEqual([value[:2] if value else None for value in rows],[(6,2),(6,2),None])
                self.assertEqual(cache.metrics['hits'],2);self.assertEqual(cache.metrics['misses'],1)
                self.assertEqual(cache.metrics['chunks_parsed'],1);self.assertEqual(cache.metrics['parsed_chunk_hits'],1)
                with self.assertRaises(sqlite3.OperationalError):cache.connection.execute('DELETE FROM native_ranges')
            self.assertEqual(opened.call_count,1)
        self.assertEqual((database.read_bytes(),database.stat().st_mtime_ns),before)

    def test_decode_session_observes_committed_append_without_stale_chunk_membership(self):
        metadata={"target_sha256":"a"*64,"generator":{"decoder_version":"fixture"},"decoder_contract":"c"*64}
        writer=native.NativeWriter(self.root/'runtime/session.sqlite',metadata,root=self.root)
        writer.store_extent((0,4096,4097,0,'first',4097,1),[(4096,'c3','jump_indirect',None,0,0)])
        writer.commit()
        with native.DecodeCache('c'*64,'fixture',root=self.root) as cache:
            self.assertIsNotNone(cache.lookup('first',4096,4097))
            writer.store_extent((1,4100,4101,1,'second',4101,1),[(4100,'c3','jump_indirect',None,0,0)])
            writer.commit()
            self.assertEqual(cache.lookup('second',4100,4101)[2][0][0],4100)
            self.assertEqual(cache.metrics['chunks_parsed'],2)
        writer.close()
        def read(_):
            with native.DecodeCache('c'*64,'fixture',root=self.root) as cache:return cache.lookup('first',4096,4097)
        with ThreadPoolExecutor(max_workers=3) as pool:self.assertEqual(len(list(pool.map(read,range(6)))),6)

    def test_decode_session_does_not_create_missing_store_and_rechecks_corrupt_payload(self):
        with native.DecodeCache('c'*64,'fixture',root=self.root) as cache:self.assertIsNone(cache.lookup('none',1,2))
        self.assertFalse((self.root/'runtime/analysis').exists())
        metadata={"target_sha256":"a"*64,"generator":{"decoder_version":"fixture"},"decoder_contract":"c"*64}
        writer=native.NativeWriter(self.root/'runtime/session.sqlite',metadata,root=self.root)
        writer.store_extent((0,4096,4097,0,'range',4097,1),[(4096,'c3','jump_indirect',None,0,0)]);writer.commit();writer.close()
        with native.DecodeCache('c'*64,'fixture',root=self.root) as cache:
            self.assertIsNotNone(cache.lookup('range',4096,4097))
            with SharedAnalysis(self.root).connect() as connection:
                connection.execute("UPDATE native_chunks SET payload=? WHERE sha256 IN (SELECT sha256 FROM native_membership WHERE table_name='refs')",(b'bad',))
            with self.assertRaises((ValueError,native.zlib.error)):cache.lookup('range',4096,4097)

    def test_writer_chunk_boundaries_and_compatible_provenance_fork_share_progress(self):
        metadata = {"target_sha256": "a" * 64, "unwind_records_sha256": "u", "generator": {"decoder_version": "fixture", "parser_sha256": "p", "sha256": "old"}, "decoder_contract": "c" * 64}
        path = self.root / "runtime/first.sqlite"
        writer = native.NativeWriter(path, metadata, root=self.root)
        for ordinal in range(native.CHUNK_ROWS + 3):
            start = 4096 + ordinal
            writer.store_extent((ordinal, start, start + 1, ordinal, str(ordinal), start + 1, 1), [(start, "c3", "jump_indirect", None, 0, 0)])
        writer.commit();writer.close()
        changed = {**metadata, "generator": {**metadata["generator"], "sha256": "new-storage-plumbing"}}
        writer = native.NativeWriter(self.root / "runtime/second.sqlite", changed, root=self.root)
        self.assertEqual(writer.execute("SELECT count(*) FROM extents").fetchone()[0], native.CHUNK_ROWS + 3)
        writer.close()
        with native.open_readonly(path, root=self.root) as c:
            self.assertEqual(c.execute("SELECT count(*) FROM refs").fetchone()[0], native.CHUNK_ROWS + 3)
            self.assertEqual(c.execute("SELECT site FROM refs ORDER BY rowid DESC LIMIT 1").fetchone()[0], 4096 + native.CHUNK_ROWS + 2)
        checked = native.verify_inventory(path, root=self.root)
        self.assertEqual(checked["tables"]["refs"], native.CHUNK_ROWS + 3)

    def test_decoder_mode_options_invalidate_reuse_but_storage_edits_do_not(self):
        source = (ROOT / "scripts/inventory-native-instructions.py").read_text()
        contract = native.decoder_contract(source)
        storage = source.replace('    root.mkdir(parents=True, exist_ok=True)', '    root.mkdir(parents=True, exist_ok=True)\n    storage_only_marker = "fixture"')
        self.assertEqual(native.decoder_contract(storage), contract)
        changed = [source.replace("capstone.CS_MODE_64", "capstone.CS_MODE_32"),
                   source.replace("decoder.detail = True", "decoder.detail = False"),
                   source.replace("decoder.skipdata = False", "decoder.skipdata = True")]
        self.assertTrue(all(native.decoder_contract(s) != contract for s in changed))
        writer = native.NativeWriter(self.root / "runtime/options.sqlite", {"target_sha256": "a" * 64, "generator": {"decoder_version": "fixture"}, "decoder_contract": contract}, root=self.root)
        writer.store_extent((0, 4096, 4097, 0, "encoded", 4097, 1), []);writer.commit();writer.close()
        self.assertEqual(native.reuse_decoded_extent("encoded", 4096, 4097, contract, "fixture", root=self.root), (1, 1, []))
        for altered in changed:
            self.assertIsNone(native.reuse_decoded_extent("encoded", 4096, 4097, native.decoder_contract(altered), "fixture", root=self.root))
        with self.assertRaisesRegex(ValueError, "indirect native decoder option"):
            native.decoder_contract(source.replace("decoder.detail = True", "decoder.detail = runtime_option()"))

    def test_legacy_contract_bridge_binds_verified_original_source_and_preserves_rows(self):
        source = (ROOT / "scripts/inventory-native-instructions.py").read_text()
        path = self.root / "scripts/inventory-native-instructions.py"
        path.parent.mkdir();path.write_text(source)
        source_sha = hashlib.sha256(source.encode()).hexdigest()
        legacy = native._legacy_decoder_contract(source)
        strengthened = native.decoder_contract(source)
        metadata = {"target_sha256": "a" * 64, "generator": {"path": "scripts/inventory-native-instructions.py", "sha256": source_sha, "decoder_version": "fixture"}, "decoder_contract": legacy}
        writer = native.NativeWriter(self.root / "runtime/legacy.sqlite", metadata, root=self.root)
        refs = [(4096, "ffd0", "call_indirect", None, 0, 0)]
        writer.store_extent((0, 4096, 4098, 0, "encoded", 4098, 1), refs);writer.commit();writer.close()
        with SharedAnalysis(self.root).connect() as connection:
            before = connection.execute("SELECT metadata FROM native_snapshots").fetchall()
            ranges = connection.execute("SELECT * FROM native_ranges").fetchall()
        self.assertIsNone(native.reuse_decoded_extent("encoded", 4096, 4098, strengthened, "fixture", root=self.root))
        report = native.upgrade_decoder_contracts(root=self.root, apply=True)
        self.assertEqual(report["source_verified"], 1)
        self.assertEqual(native.reuse_decoded_extent("encoded", 4096, 4098, strengthened, "fixture", root=self.root), (2, 1, refs))
        altered = native.decoder_contract(source.replace("capstone.CS_MODE_64", "capstone.CS_MODE_32"))
        self.assertIsNone(native.reuse_decoded_extent("encoded", 4096, 4098, altered, "fixture", root=self.root))
        with SharedAnalysis(self.root).connect() as connection:
            self.assertEqual(connection.execute("SELECT metadata FROM native_snapshots").fetchall(), before)
            self.assertEqual(connection.execute("SELECT * FROM native_ranges").fetchall(), ranges)
            self.assertEqual(connection.execute("SELECT source_sha256 FROM native_decoder_compat").fetchone()[0], source_sha)

    def test_equal_legacy_algorithms_do_not_bridge_unknown_or_different_options(self):
        source = (ROOT / "scripts/inventory-native-instructions.py").read_text()
        modified = source.replace("capstone.CS_MODE_64", "capstone.CS_MODE_32")
        self.assertEqual(native._legacy_decoder_contract(source), native._legacy_decoder_contract(modified))
        path = self.root / "scripts/inventory-native-instructions.py"
        path.parent.mkdir();path.write_text(modified)
        metadata = {"target_sha256": "b" * 64, "generator": {"path": "scripts/inventory-native-instructions.py", "sha256": hashlib.sha256(modified.encode()).hexdigest(), "decoder_version": "fixture"}, "decoder_contract": native._legacy_decoder_contract(modified)}
        writer = native.NativeWriter(self.root / "runtime/legacy.sqlite", metadata, root=self.root)
        writer.store_extent((0, 4096, 4097, 0, "encoded", 4097, 1), []);writer.commit();writer.close()
        native.upgrade_decoder_contracts(root=self.root, apply=True)
        self.assertIsNone(native.reuse_decoded_extent("encoded", 4096, 4097, native.decoder_contract(source), "fixture", root=self.root))
        self.assertEqual(native.reuse_decoded_extent("encoded", 4096, 4097, native.decoder_contract(modified), "fixture", root=self.root), (1, 1, []))


if __name__ == "__main__":
    unittest.main()
