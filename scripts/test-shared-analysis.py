#!/usr/bin/env python3
"""Exercise shared storage integrity and recovery without native tools/builds."""

from concurrent.futures import ThreadPoolExecutor
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import tempfile
import unittest

from shared_analysis import SharedAnalysis, canonical, file_digest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("manage_store", ROOT / "scripts/manage-analysis-store.py")
manage = importlib.util.module_from_spec(spec)
spec.loader.exec_module(manage)


class SharedStoreTests(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/analysis-store-tests"
        scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.root = Path(self.temporary.name)
        self.store = SharedAnalysis(self.root)

    def tearDown(self):
        self.temporary.cleanup()
        try:
            (ROOT / "runtime/analysis-store-tests").rmdir()
        except OSError:
            pass

    def file(self, name, data):
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        return path

    def test_cross_target_bytes_share_storage_without_query_validity_transfer(self):
        result = {"instructions": ["ret"], "value": 3}
        a = {"target_sha256": "a" * 64, "profile": "first", "procedure": "0x123"}
        b = dict(a, target_sha256="b" * 64)
        first = self.store.publish_query(a, result)
        self.assertIsNone(self.store.lookup_query(b))
        second = self.store.publish_query(b, result)
        self.assertEqual(first["sha256"], second["sha256"])
        self.assertEqual(self.store.lookup_query(a), result)
        self.assertEqual(self.store.lookup_query(b), result)
        self.assertEqual(len(list(self.store.objects.glob("*/*"))), 1)
        matches = self.store.find_objects(sha256=first["sha256"])
        self.assertEqual(len(matches[0]["queries"]), 2)
        self.assertEqual(len(self.store.find_objects(target_sha256="a" * 64)), 1)
        self.assertIn("not inferred", matches[0]["applicability"])

    def test_json_key_order_does_not_duplicate_new_payload(self):
        first = self.store.publish_query({"query": 1}, {"a": 1, "b": 2})
        second = self.store.publish_query({"query": 2}, {"b": 2, "a": 1})
        self.assertEqual(first["sha256"], second["sha256"])

    def test_runtime_publication_reuses_bytes_and_preserves_old_object(self):
        path = self.root / "runtime/coverage/proof.json"
        first = self.store.publish_output(path, b"first")
        old_target = path.resolve()
        stamp = path.lstat().st_mtime_ns
        self.assertEqual(self.store.publish_output(path, b"first"), first)
        self.assertEqual(path.lstat().st_mtime_ns, stamp)
        second = self.store.publish_output(path, b"second")
        self.assertEqual(path.resolve(), self.store.verify_receipt(second))
        self.assertEqual(old_target.read_bytes(), b"first")
        self.assertEqual(self.store.verify()["aliases"], 1)

    def test_migration_aliases_preserve_hash_and_do_not_copy_unique_bytes(self):
        data = b"native evidence\n" * 200
        a = self.file("runtime/history-a/export.bin", data)
        b = self.file("runtime/history-b/export.bin", data)
        old_inode = a.stat().st_ino
        first = self.store.migrate_file(a)
        second = self.store.migrate_file(b)
        self.assertTrue(a.is_symlink())
        self.assertFalse(os.path.isabs(os.readlink(a)))
        self.assertEqual(a.read_bytes(), data)
        self.assertEqual(b.read_bytes(), data)
        self.assertEqual(self.store.verify_receipt(first).stat().st_ino, old_inode)
        self.assertEqual(first["sha256"], second["sha256"])
        self.assertEqual(first["reclaimed_allocated_bytes"], 0)
        self.assertGreater(second["reclaimed_allocated_bytes"], 0)
        self.assertEqual(self.store.verify()["aliases"], 2)

    def test_interruption_after_object_publication_resumes_without_losing_source(self):
        original = self.file("runtime/history/result.bin", b"recover me")
        link = self.store.link_alias

        def fail(*args, **kwargs):
            raise RuntimeError("simulated interruption before alias")

        self.store.link_alias = fail
        with self.assertRaisesRegex(RuntimeError, "simulated"):
            self.store.migrate_file(original)
        self.assertEqual(original.read_bytes(), b"recover me")
        self.store.link_alias = link
        self.assertEqual(self.store.recover_migrations(), 1)
        self.assertTrue(original.is_symlink())
        self.assertEqual(original.read_bytes(), b"recover me")
        self.assertEqual(self.store.verify()["integrity"], "ok")

    def test_corrupt_object_is_never_reused_or_overwritten(self):
        identity = {"target_sha256": "a" * 64, "operation": "xrefs"}
        receipt = self.store.publish_query(identity, {"refs": []})
        path = self.store.verify_receipt(receipt)
        path.chmod(0o644)
        path.write_bytes(b"corrupt")
        with self.assertRaisesRegex(ValueError, "Missing|bytes differ"):
            self.store.lookup_query(identity)
        with self.assertRaises(ValueError):
            self.store.publish_query(identity, {"refs": []})
        self.assertEqual(path.read_bytes(), b"corrupt")

    def test_recovery_rejects_changed_prepublication_source(self):
        source = self.file("runtime/history/result.bin", b"original")
        committed = hashlib.sha256(b"original").hexdigest()
        with self.store.connect() as connection:
            connection.execute("INSERT INTO analysis_migrations VALUES(?,?,?,?,?,?)",
                               ("runtime/history/result.bin", committed, 8, "{}", "prepared", 0))
        source.write_bytes(b"modified")
        with self.assertRaisesRegex(ValueError, "source changed"):
            self.store.recover_migrations()
        self.assertFalse(source.is_symlink())
        self.assertEqual(source.read_bytes(), b"modified")

    def test_alias_cannot_escape_or_replace_different_bytes(self):
        receipt = self.store.put_bytes(b"safe")
        outside = self.file("outside/evidence.bin", b"keep")
        with self.assertRaises(ValueError):
            self.store.link_alias(outside, receipt)
        redirected = self.root / "runtime/redirect"
        redirected.symlink_to(self.root / "outside", target_is_directory=True)
        with self.assertRaises(ValueError):
            self.store.link_alias(redirected / "evidence.bin", receipt)
        different = self.file("runtime/existing.bin", b"keep")
        with self.assertRaises(ValueError):
            self.store.link_alias(different, receipt)
        self.assertEqual(outside.read_bytes(), b"keep")
        self.assertEqual(different.read_bytes(), b"keep")

    def test_new_alias_relative_base_uses_physical_parent(self):
        receipt = self.store.put_bytes(b"outer directory alias payload")
        physical = self.root / "runtime/analysis/tasks/deep/physical"
        physical.mkdir(parents=True)
        logical = self.root / "runtime/logical"
        logical.symlink_to(os.path.relpath(physical, logical.parent), target_is_directory=True)
        alias = logical / "result.json"
        self.store.link_alias(alias, receipt)
        self.assertEqual(alias.read_bytes(), b"outer directory alias payload")
        self.assertEqual(alias.resolve(), self.store.object_path(receipt["sha256"]))

    def moved_alias(self, register=True):
        receipt = self.store.put_bytes(b"moved immutable native evidence")
        target = "a" * 64
        source = self.root / "runtime/ghidra-queries" / target / "old-profile"
        source.mkdir(parents=True)
        alias = source / "results/native.json"
        self.store.link_alias(alias, receipt)
        destination = self.store.store / "programs" / target / "shared-key"
        destination.parent.mkdir(parents=True)
        source.rename(destination)
        source.symlink_to(os.path.relpath(destination, source.parent), target_is_directory=True)
        identity = {"target_sha256": target, "variant": "shared"}
        (destination / "workspace.json").write_text(json.dumps({"format": "rea-shared-program-v1", "identity": identity}))
        if register:
            (destination.parent / "shared-key.adopting.json").write_text(json.dumps({
                "format": "rea-shared-program-v1", "source": str(source), "alias": str(source),
                "destination": str(destination), "identity": identity}))
        return alias, receipt

    def test_registered_relocation_repairs_only_dangling_catalog_cas_link(self):
        alias, receipt = self.moved_alias()
        self.assertTrue(alias.is_symlink())
        self.assertFalse(alias.exists())
        audit = self.store.repair_aliases()
        self.assertEqual(len(audit["eligible"]), 1)
        self.assertFalse(alias.exists())
        result = self.store.repair_aliases(apply=True)
        self.assertEqual(len(result["repaired"]), 1)
        self.assertEqual(alias.read_bytes(), b"moved immutable native evidence")
        self.assertEqual(self.store.verify()["integrity"], "ok")
        self.assertEqual(self.store.repair_aliases(apply=True)["repaired"], [])

    def test_unregistered_parent_relocation_is_not_repaired(self):
        alias, receipt = self.moved_alias(register=False)
        previous = os.readlink(alias)
        result = self.store.repair_aliases(apply=True)
        self.assertEqual(result["repaired"], [])
        self.assertEqual(len(result["skipped"]), 1)
        self.assertEqual(os.readlink(alias), previous)

    def test_repair_never_replaces_arbitrary_files_or_external_links(self):
        receipt = self.store.put_bytes(b"expected")
        regular = self.root / "runtime/regular.bin"
        external = self.root / "runtime/external.bin"
        self.store.link_alias(regular, receipt)
        self.store.link_alias(external, receipt)
        regular.unlink()
        regular.write_bytes(b"independent unique evidence")
        external.unlink()
        external.symlink_to("../not-cas/unique.bin")
        result = self.store.repair_aliases(apply=True)
        self.assertEqual(result["repaired"], [])
        self.assertEqual(regular.read_bytes(), b"independent unique evidence")
        self.assertEqual(os.readlink(external), "../not-cas/unique.bin")

    def test_registered_linked_worktree_cannot_allocate_another_live_store(self):
        primary = self.root / "primary"
        linked = self.root / "linked"
        linked.mkdir()
        control = primary / ".git/worktrees/linked"
        control.mkdir(parents=True)
        (control / "commondir").write_text("../..\n")
        (control / "gitdir").write_text(str(linked / ".git") + "\n")
        (linked / ".git").write_text("gitdir: " + str(control) + "\n")
        with self.assertRaisesRegex(ValueError, "primary checkout"):
            SharedAnalysis(linked)
        self.assertFalse((linked / "runtime").exists())

    def test_migration_selection_skips_mutable_and_database_state(self):
        allowed = ["runtime/history/instructions.tsv.gz", "runtime/history/input.bin",
                   "runtime/history/results/abc.json", "runtime/history/001-native.json"]
        protected = ["runtime/history/journal.json", "runtime/history/native-progress.json",
                     "runtime/history/native-instructions.sqlite", "runtime/history/seeds.tsv",
                     "runtime/history/project/test.rep/data.bin", "runtime/ghidra-queries/a/b/ready.json",
                     "runtime/menu-state/characters.bin", "runtime/cargo/cache.bin",
                     "runtime/history/plan.json", "runtime/history/001-open_binary.json"]
        for name in allowed + protected:
            self.file(name, b"x" * 128)
        actual = {str(p.relative_to(self.root)) for p in manage.candidates(self.root, minimum=1)}
        self.assertEqual(actual, set(allowed))
        before = {name: file_digest(self.root / name) for name in protected}
        manage.migrate(self.root, minimum=1)
        for name in protected:
            self.assertFalse((self.root / name).is_symlink())
            self.assertEqual(file_digest(self.root / name), before[name])

    def test_concurrent_publication_produces_one_verified_object(self):
        def publish(i):
            store = SharedAnalysis(self.root)
            return store.publish_query({"operation": i}, {"same": "payload"})

        with ThreadPoolExecutor(max_workers=4) as executor:
            receipts = list(executor.map(publish, range(12)))
        self.assertEqual(len({row["sha256"] for row in receipts}), 1)
        verified = self.store.verify()
        self.assertEqual(verified["objects"], 1)
        self.assertEqual(verified["queries"], 12)


if __name__ == "__main__":
    unittest.main()
