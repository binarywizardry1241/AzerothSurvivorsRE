#!/usr/bin/env python3
"""Pure Python snapshot-selection regressions; no EXE, provider or compiler."""

import json
from pathlib import Path
import tempfile
import unittest

from coverage_common import ROOT, file_sha256
from native_residual_summary import LEGACY_SUMMARY, residual_summary_path


class ResidualSummarySelection(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(dir=ROOT/'runtime', prefix='residual-selector-')
        self.addCleanup(self.temporary.cleanup)
        self.directory = Path(self.temporary.name)
        self.summary = self.write('summary.json', {
            'generator': {'path': 'scripts/classify-native-residuals.py'},
            'target': {'sha256': 'a'*64},
        })
        self.proof = self.write('proof.json', {'inputs': [self.receipt(self.summary)]})

    def write(self, name, value):
        path = self.directory/name
        path.write_text(json.dumps(value)+'\n')
        return path

    def receipt(self, path):
        return {'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)}

    def test_existing_proof_selects_its_exact_snapshot(self):
        self.assertEqual(residual_summary_path(self.proof), self.summary)

    def test_explicit_selection_overrides_retained_snapshot(self):
        other = self.write('other.json', {'generator': {'path': 'scripts/classify-native-residuals.py'}})
        self.assertEqual(residual_summary_path(self.proof, other), other)

    def test_only_new_proof_uses_legacy_fallback(self):
        # Selection of an existing legacy input is distinct from admission of
        # its target or data; those remain the producers' checks.
        from unittest.mock import patch
        with patch('native_residual_summary.LEGACY_SUMMARY', str(self.summary)):
            self.assertEqual(residual_summary_path(self.directory/'new.json'), self.summary)
        self.assertEqual(LEGACY_SUMMARY, 'runtime/analysis/history/findings/q41-ownership/2bcdf9438d76/residual-summary-v2.json')

    def test_existing_proof_without_summary_does_not_fall_back(self):
        self.write('proof.json', {'inputs': []})
        with self.assertRaisesRegex(ValueError, 'missing or ambiguous'):
            residual_summary_path(self.proof)

    def test_ambiguous_and_duplicate_summary_receipts_are_rejected(self):
        other = self.write('other.json', {'generator': {'path': 'scripts/classify-native-residuals.py'}})
        for second in (other, self.summary):
            with self.subTest(second=second):
                self.write('proof.json', {'inputs': [self.receipt(self.summary), self.receipt(second)]})
                with self.assertRaisesRegex(ValueError, 'missing or ambiguous'):
                    residual_summary_path(self.proof)

    def test_changed_snapshot_cannot_satisfy_retained_receipt(self):
        self.summary.write_text(self.summary.read_text()+' ')
        with self.assertRaisesRegex(ValueError, 'snapshot changed'):
            residual_summary_path(self.proof)

    def test_missing_selected_or_retained_input_is_rejected(self):
        self.summary.unlink()
        with self.assertRaisesRegex(ValueError, 'Retained input is missing'):
            residual_summary_path(self.proof)
        with self.assertRaisesRegex(ValueError, 'Selected residual summary is missing'):
            residual_summary_path(self.proof, self.summary)

    def test_malformed_receipt_container_or_entry_is_rejected(self):
        for inputs in ({}, [None], [{}], [{'path': 4}]):
            with self.subTest(inputs=inputs):
                self.write('proof.json', {'inputs': inputs})
                with self.assertRaises(ValueError):
                    residual_summary_path(self.proof)

    def test_explicit_non_summary_documents_are_rejected(self):
        for value in ([], {}, {'generator': []}, {'generator': {'path': 'other.py'}}):
            with self.subTest(value=value):
                path = self.write('ordinary.json', value)
                with self.assertRaisesRegex(ValueError, 'not a residual summary'):
                    residual_summary_path(self.proof, path)

    def test_unrelated_json_inputs_do_not_become_summary_candidates(self):
        ordinary = self.write('ordinary.json', ['unrelated data'])
        self.write('proof.json', {'inputs': [self.receipt(ordinary), self.receipt(self.summary)]})
        self.assertEqual(residual_summary_path(self.proof), self.summary)

    def test_input_paths_cannot_escape_project(self):
        with self.assertRaises(ValueError):
            residual_summary_path(self.proof, ROOT.parent/'outside.json')
        self.write('proof.json', {'inputs': [{'path': '../outside.json', 'sha256': '0'*64}]})
        with self.assertRaises(ValueError):
            residual_summary_path(self.proof)


if __name__ == '__main__':
    unittest.main()
