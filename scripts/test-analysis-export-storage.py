#!/usr/bin/env python3
"""Non-compiling data-preservation checks for retained export consolidation."""

import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from shared_analysis import SharedAnalysis

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('export_storage', ROOT / 'scripts/consolidate-analysis-exports.py')
storage = importlib.util.module_from_spec(spec)
spec.loader.exec_module(storage)


class ExportStorage(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / 'runtime/analysis-export-tests'
        scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.root = Path(self.temporary.name)
        self.addCleanup(self.temporary.cleanup)
        self.target = 'a' * 64
        registry = self.root / 'docs/analysis/coverage/targets.json'
        registry.parent.mkdir(parents=True)
        registry.write_text(json.dumps({'targets': [{'version': '0.109.0', 'sha256': self.target},
                                                   {'version': '0.112.0', 'sha256': 'b' * 64}]}))
        self.index = {'schema_version': 1, 'minimum_bytes': 1, 'roots': [
            {'path': 'runtime/coverage/' + self.target, 'target_version': '0.109.0',
             'target_sha256': self.target}], 'groups': []}
        self.base = self.root / self.index['roots'][0]['path']
        self.base.mkdir(parents=True)

    def pair(self):
        first, second = self.base / 'one.tsv', self.base / 'two.tsv'
        first.write_bytes(b'address\tbytes\n140001000\t90\n')
        second.write_bytes(first.read_bytes())
        return first, second, storage.scan(self.index, self.root)

    def test_dry_run_never_changes_originals(self):
        first, second, index = self.pair()
        report = storage.consolidate(index, self.root)
        self.assertEqual(report['redundant_bytes'], first.stat().st_size)
        self.assertFalse(first.is_symlink())
        self.assertFalse(second.is_symlink())
        self.assertFalse((self.root / storage.STORE).exists())

    def test_shared_bytes_preserve_all_historical_paths_and_hashes_without_exe(self):
        first, second, index = self.pair()
        original = first.read_bytes()
        report = storage.consolidate(index, self.root, apply=True)
        canonical = self.root / index['groups'][0]['canonical']
        self.assertEqual(report['historical_paths'], 2)
        self.assertEqual(canonical.read_bytes(), original)
        self.assertEqual(canonical.stat().st_mode & 0o222, 0)
        for alias in [first, second]:
            self.assertTrue(alias.is_symlink())
            self.assertFalse(Path(alias.readlink()).is_absolute())
            self.assertEqual(alias.resolve(), canonical)
            self.assertEqual(alias.read_bytes(), original)
            self.assertEqual(storage.digest(alias), index['groups'][0]['sha256'])

    def test_changed_copy_aborts_before_any_replacement(self):
        first, second, index = self.pair()
        second.write_bytes(b'x' * second.stat().st_size)
        with self.assertRaisesRegex(ValueError, 'Historical export differs'):
            storage.consolidate(index, self.root, apply=True)
        self.assertFalse(first.is_symlink())
        self.assertFalse(second.is_symlink())
        self.assertFalse((self.root / storage.STORE).exists())

    def test_same_size_different_evidence_stays_unique(self):
        (self.base / 'one.json').write_bytes(b'one')
        (self.base / 'two.json').write_bytes(b'two')
        self.assertEqual(storage.scan(self.index, self.root)['groups'], [])

    def test_identical_bytes_from_different_targets_stay_separate(self):
        other = self.root / 'runtime/coverage' / ('b' * 64)
        other.mkdir(parents=True)
        self.index['roots'].append({'path': other.relative_to(self.root).as_posix(),
                                    'target_version': '0.112.0', 'target_sha256': 'b' * 64})
        (self.base / 'one.json').write_bytes(b'identical')
        (other / 'two.json').write_bytes(b'identical')
        self.assertEqual(storage.scan(self.index, self.root)['groups'], [])

    def test_repeated_apply_and_scan_preserve_index_and_storage(self):
        first, second, index = self.pair()
        storage.consolidate(index, self.root, apply=True)
        self.assertEqual(storage.consolidate(index, self.root, apply=True)['redundant_bytes'], 0)
        self.assertEqual(storage.scan(index, self.root), index)
        second.unlink()
        storage.consolidate(index, self.root, apply=True)
        self.assertEqual(first.resolve(), second.resolve())

    def test_shared_cas_keeps_historical_canonical_aliases_verifiable(self):
        first, second, index = self.pair()
        storage.consolidate(index, self.root, apply=True)
        canonical = self.root / index['groups'][0]['canonical']
        original = canonical.read_bytes()
        SharedAnalysis(self.root).migrate_file(canonical, provenance={'target_sha256': self.target})
        self.assertTrue(canonical.is_symlink())
        self.assertEqual(first.read_bytes(), original)
        self.assertEqual(second.resolve(), canonical.resolve())
        self.assertEqual(storage.consolidate(index, self.root)['redundant_bytes'], 0)

    def test_build_cache_roots_and_parent_traversal_are_rejected(self):
        for name in ['runtime/cargo-target', 'runtime/optimized-2026-10-21/target',
                     '.tools/rust', '../outside']:
            with self.subTest(name=name):
                self.index['roots'][0]['path'] = name
                with self.assertRaises(ValueError):
                    storage.scan(self.index, self.root)

    def test_redirected_alias_and_changed_archive_are_rejected(self):
        first, second, index = self.pair()
        third = self.base / 'other.tsv'
        third.write_bytes(first.read_bytes())
        second.unlink()
        second.symlink_to(third.name)
        with self.assertRaisesRegex(ValueError, 'Alias points outside'):
            storage.consolidate(index, self.root, apply=True)
        second.unlink()
        second.write_bytes(first.read_bytes())
        storage.consolidate(index, self.root, apply=True)
        canonical = self.root / index['groups'][0]['canonical']
        canonical.chmod(0o644)
        canonical.write_bytes(b'changed archive')
        with self.assertRaisesRegex(ValueError, 'Canonical export differs'):
            storage.consolidate(index, self.root, apply=True)


if __name__ == '__main__':
    unittest.main()
