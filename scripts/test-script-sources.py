#!/usr/bin/env python3
"""Check source relocation and exact historical hashes without native execution."""
import hashlib
import io
import json
from contextlib import redirect_stderr, redirect_stdout
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import script_sources as sources


class ScriptSources(unittest.TestCase):
    def setUp(self):
        scratch = sources.ROOT / 'runtime/script-source-tests'
        scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(self.temporary.cleanup)
        self.addCleanup(sources.provenance.cache_clear)
        self.root = Path(self.temporary.name)
        self.former = 'scripts/check-xinput-0.109.0.py'
        self.original = subprocess.check_output(['git', 'cat-file', 'blob',
            '47c9f68d25834d2265e6a2e0548a3592e66d8d32:' + self.former], cwd=sources.ROOT)
        self.expected = hashlib.sha256(self.original).hexdigest()
        index = self.root / sources.INDEX
        index.parent.mkdir(parents=True)
        index.write_text(json.dumps({'source_commit': '47c9f68d25834d2265e6a2e0548a3592e66d8d32',
            'relocations': {self.former: {'replacement': 'scripts/check-xinput.py', 'status': 'retired'}}}))

    def test_current_reference_is_separate_from_execution_hash(self):
        self.assertEqual(sources.current_path(self.former, self.root), self.root / 'scripts/check-xinput.py')
        self.assertEqual(sources.historical_source(self.former, self.expected, self.root), self.original)

    def test_changed_current_code_cannot_satisfy_an_old_source_commitment(self):
        current = self.root / 'scripts/check-xinput.py'
        current.parent.mkdir()
        current.write_bytes(b'changed implementation')
        self.assertTrue(sources.historical_matches(self.former, self.expected, self.root))
        self.assertFalse(sources.historical_matches(self.former, hashlib.sha256(current.read_bytes()).hexdigest(), self.root))

    def test_unrecorded_paths_and_traversal_have_no_historical_fallback(self):
        for name in ['scripts/unrecorded.py', '../outside', '/outside']:
            self.assertFalse(sources.historical_matches(name, self.expected, self.root))

    def test_storage_adaptation_retains_exact_producer_without_claiming_current_hash(self):
        path = self.root / sources.INDEX
        path.write_text(json.dumps({'relocations': {}, 'retained_execution_sources': {
            self.former: {'source_commit': '47c9f68d25834d2265e6a2e0548a3592e66d8d32'}}}))
        sources.provenance.cache_clear()
        current = self.root / self.former
        current.parent.mkdir()
        current.write_bytes(b'new storage adapter')
        self.assertEqual(sources.historical_source(self.former, self.expected, self.root), self.original)
        self.assertNotEqual(hashlib.sha256(current.read_bytes()).hexdigest(), self.expected)
        self.assertFalse(sources.historical_matches(self.former, '0' * 64, self.root))
        self.assertFalse(sources.historical_matches(self.former, None, self.root))

    def test_unrelated_paths_keep_their_identity(self):
        self.assertEqual(sources.current_path('docs/REA.md', self.root), self.root / 'docs/REA.md')

    def test_stable_name_selects_exact_historical_source_by_digest(self):
        self.assertEqual(sources.historical_source('scripts/check-xinput.py', self.expected, self.root), self.original)

    def test_relocations_keep_their_own_committed_source_boundary(self):
        commit = subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=sources.ROOT,
                                         text=True).strip()
        reference = 'scripts/coverage_common.py'
        original = subprocess.check_output(['git', 'cat-file', 'blob', commit + ':' + reference],
                                           cwd=sources.ROOT)
        index = self.root / sources.INDEX
        index.write_text(json.dumps({'source_commit': '0' * 40, 'relocations': {
            reference: {'replacement': 'scripts/shared-coverage.py', 'source_commit': commit}}}))
        sources.provenance.cache_clear()
        expected = hashlib.sha256(original).hexdigest()
        self.assertEqual(sources.historical_source(reference, expected, self.root), original)
        self.assertEqual(sources.historical_source('scripts/shared-coverage.py', expected, self.root), original)
        self.assertFalse(sources.historical_matches(reference, '0' * 64, self.root))

    def test_shared_loader_preserves_fresh_module_namespaces_and_relocated_imports(self):
        path = self.root / 'scripts/check-xinput.py'
        path.parent.mkdir()
        path.write_text('values = []\n')
        first = sources.load_script('probe', self.former, self.root)
        first.values.append(1)
        second = sources.load_script('probe', path, self.root)
        self.assertEqual(first.values, [1])
        self.assertEqual(second.values, [])

    def test_shared_loader_rejects_paths_outside_its_project(self):
        with self.assertRaisesRegex(ValueError, 'leaves the project'):
            sources.load_script('probe', '../../outside.py', self.root)

    def test_relocation_cannot_redirect_a_project_reference_outside(self):
        path = self.root / sources.INDEX
        path.write_text(json.dumps({'relocations': {
            self.former: {'replacement': '../outside.py'}}}))
        sources.provenance.cache_clear()
        with self.assertRaisesRegex(ValueError, 'leaves the project'):
            sources.current_path(self.former, self.root)

    def test_recorded_producer_check_does_not_relabel_the_live_source(self):
        current = self.root / 'scripts/check-xinput.py'
        current.parent.mkdir()
        current.write_bytes(b'changed live implementation')
        self.assertTrue(sources.recorded_input_matches(current, self.expected, self.root))
        self.assertNotEqual(hashlib.sha256(current.read_bytes()).hexdigest(), self.expected)

    def test_ordinary_inputs_never_use_a_script_history_fallback(self):
        path = self.root / 'source.rs'
        path.write_bytes(b'changed source')
        with patch.object(sources, 'historical_matches', return_value=True) as historical:
            self.assertFalse(sources.recorded_input_matches(path, self.expected, self.root))
            historical.assert_not_called()

    def test_recorded_inputs_keep_verified_native_archive_hash_semantics(self):
        path = self.root / 'inventory.sqlite'
        path.write_bytes(b'lossless archive receipt, not the original SQLite stream')
        with patch('coverage_common.file_sha256', return_value=self.expected) as logical_hash:
            with patch.object(sources, 'historical_matches') as historical:
                self.assertTrue(sources.recorded_input_matches(path, self.expected, self.root))
                logical_hash.assert_called_once_with(path)
                historical.assert_not_called()

    def test_retained_suite_dispatch_preserves_arguments_and_source_digest(self):
        raw = b'import sys\nassert sys.argv[1:] == ["--fixture"]\nprint("retained checks ran")\n'
        tool = self.root / 'scripts/check-contract.py'
        index = self.root / sources.INDEX
        index.write_text(json.dumps({'relocations': {}, 'contract_suites': {
            'scripts/check-contract.py': {'snapshot': {
                'producer_path': 'scripts/original-check.py',
                'source_sha256': hashlib.sha256(raw).hexdigest()}}}}))
        sources.provenance.cache_clear()
        output = io.StringIO()
        with patch.object(sources, 'historical_source', return_value=raw), redirect_stdout(output), redirect_stderr(io.StringIO()):
            with self.assertRaises(SystemExit) as result:
                sources.run_contract(tool, ['--contract', 'snapshot', '--fixture'], self.root)
        self.assertEqual(result.exception.code, 0)
        self.assertEqual(output.getvalue(), 'retained checks ran\n')
        with patch.object(sources, 'historical_source', return_value=b'raise AssertionError("must not execute")'):
            with self.assertRaisesRegex(ValueError, 'source differs'):
                sources.run_contract(tool, ['--contract', 'snapshot'], self.root)

    def test_retained_file_hash_adapter_keeps_non_script_inputs_strict(self):
        tree = sources._RecordedInputChecks(['digest']).visit(
            __import__('ast').parse('assert digest(path) == expected'))
        __import__('ast').fix_missing_locations(tree)
        with self.assertRaises(AssertionError):
            exec(compile(tree, '<fixture>', 'exec'), {'path': self.root / 'source.rs',
                'expected': self.expected, 'recorded_input_matches':
                    lambda path, expected: sources.recorded_input_matches(path, expected, self.root)})

    def test_suite_preserves_producer_identity_and_routes_only_the_configured_reference(self):
        raw = (b'from pathlib import Path\nfrom coverage_common import reference_config, file_sha256\n'
               b'ROOT = Path(__file__).resolve().parents[1]\n'
               b'assert ROOT / "AzerothSurvivors/fixture.exe" == reference_config()["exe"]\n'
               b'print(file_sha256(ROOT / "scripts/original-check.py"))\n')
        expected = hashlib.sha256(raw).hexdigest()
        index = self.root / sources.INDEX
        index.write_text(json.dumps({'relocations': {}, 'contract_suites': {
            'scripts/check-contract.py': {'snapshot': {
                'producer_path': 'scripts/original-check.py', 'source_sha256': expected,
                'producer_hash_functions': ['file_sha256'],
                'reference_paths': ['AzerothSurvivors/fixture.exe']}}}}))
        sources.provenance.cache_clear()
        output, receipt = io.StringIO(), io.StringIO()
        reference = self.root / 'configured/reference.exe'
        with patch.object(sources, 'historical_source', return_value=raw), \
                patch('coverage_common.reference_config', return_value={'exe': reference}), \
                redirect_stdout(output), redirect_stderr(receipt):
            with self.assertRaises(SystemExit):
                sources.run_contract(self.root / 'scripts/check-contract.py', ['--contract', 'snapshot'], self.root)
        self.assertEqual(output.getvalue().strip(), expected)
        binding = json.loads(receipt.getvalue())
        self.assertEqual(binding['original_producer']['sha256'], expected)
        self.assertEqual(binding['execution_adapter']['path'], 'scripts/script_sources.py')

    def test_suite_rejects_a_changed_installed_input_before_loading_its_producer(self):
        index = self.root / sources.INDEX
        index.write_text(json.dumps({'relocations': {}, 'contract_suites': {
            'scripts/check-contract.py': {'snapshot': {
                'producer_path': 'scripts/original-check.py', 'source_sha256': 'a' * 64,
                'target_sha256': 'b' * 64}}}}))
        sources.provenance.cache_clear()
        with patch.object(sources, 'historical_source') as producer, \
                patch('coverage_common.reference_config', return_value={'exe': self.root / 'reference.exe'}), \
                patch('coverage_common.file_sha256', return_value='c' * 64):
            with self.assertRaisesRegex(ValueError, 'unavailable for the configured installed EXE'):
                sources.run_contract(self.root / 'scripts/check-contract.py', ['--contract', 'snapshot'], self.root)
            producer.assert_not_called()


if __name__ == '__main__':
    unittest.main()
