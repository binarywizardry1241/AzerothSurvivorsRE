#!/usr/bin/env python3
"""Non-compiling admission/boundary regressions for the data-candidate join."""

import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from coverage_common import ROOT
from script_sources import load_script

tool = load_script("tested_current_data_classifier", ROOT / "scripts/classify-current-target-data.py")
addon = load_script("tested_addon_proof_selection", ROOT / "scripts/check-addon-api.py")


class DataCandidateAdmission(unittest.TestCase):
    def test_nested_overlapping_and_equal_start_ranges_keep_every_hit(self):
        rows = [(10, 90, "outer"), (10, 20, "equal-start"), (19, 23, "overlap"), (90, 91, "next")]
        index = tool.RangeIndex(rows, lambda row: row[0], lambda row: row[1])
        for address in range(0, 100):
            expected = {row[2] for row in rows if row[0] <= address < row[1]}
            self.assertEqual({row[2] for row in index.at(address)}, expected)

    def test_empty_index_cannot_invent_a_flow_body(self):
        index = tool.RangeIndex([], lambda row: row[0], lambda row: row[1])
        self.assertEqual(index.at(0x140001000), [])

    def test_disjoint_flow_owner_keeps_gap_end_and_split_body_boundaries(self):
        bodies = [(10, 20, "a"), (25, 30, "b"), (40, 45, "a"), (45, 90, "c")]
        starts = [row[0] for row in bodies]
        for address in range(0, 100):
            expected = next((row[2] for row in bodies if row[0] <= address < row[1]), None)
            self.assertEqual(tool.flow_owner(bodies, starts, address), expected)
        self.assertIsNone(tool.flow_owner([], [], 20))

    def test_historical_target_or_changed_input_is_rejected(self):
        (ROOT / "runtime").mkdir(exist_ok=True)
        with tempfile.TemporaryDirectory(prefix="data-classification-test-", dir=ROOT / "runtime") as directory:
            path = Path(directory) / "evidence.json"
            target = dict(version="0.117.0", sha256="a" * 64, size_bytes=100)
            historical = dict(target=dict(target, sha256="b" * 64))
            path.write_text(json.dumps(historical))
            with self.assertRaisesRegex(ValueError, "another target"):
                tool.Inputs(target).load(path)
            path.write_text(json.dumps(dict(target=target)))
            inputs = tool.Inputs(target)
            inputs.load(path)
            path.write_text(json.dumps(dict(target=target, altered=True)))
            with self.assertRaisesRegex(ValueError, "checksum differs|changed during"):
                inputs.stable()

    def test_source_and_descriptor_reference_families_remain_separate(self):
        payload = dict(selector="payload", start=100, end=108)
        descriptor = dict(selector="descriptor", start=200, end=216)
        payloads = tool.RangeIndex([payload], lambda row: row["start"], lambda row: row["end"])
        descriptors = tool.RangeIndex([descriptor], lambda row: row["start"], lambda row: row["end"])
        self.assertEqual(payloads.at(203), [])
        self.assertEqual(descriptors.at(103), [])
        self.assertEqual(descriptors.at(215), [descriptor])
        self.assertEqual(descriptors.at(216), [])


class AddonProofAdmission(unittest.TestCase):
    def test_exact_input_selects_its_retained_proof_without_a_release_name(self):
        with tempfile.TemporaryDirectory(prefix='addon-proof-selection-', dir=ROOT / 'runtime') as folder:
            root = Path(folder).resolve()
            manifest = root / 'docs/analysis/evidence/fixture/addon-api/manifest.json'
            manifest.parent.mkdir(parents=True)
            manifest.write_text(json.dumps({'target': {'sha256': addon.sha(b'fixture input')}}))
            with patch.object(addon, 'ROOT', root):
                self.assertEqual(addon.select_manifest(b'fixture input'), manifest)
                with self.assertRaisesRegex(ValueError, 'Select one reviewed'):
                    addon.select_manifest(b'different input')

    def test_ambiguous_proofs_are_not_silently_selected(self):
        with tempfile.TemporaryDirectory(prefix='addon-proof-selection-', dir=ROOT / 'runtime') as folder:
            root = Path(folder).resolve()
            for name in ('one', 'two'):
                manifest = root / f'docs/analysis/evidence/{name}/addon-api/manifest.json'
                manifest.parent.mkdir(parents=True)
                manifest.write_text(json.dumps({'target': {'sha256': addon.sha(b'fixture input')}}))
            with patch.object(addon, 'ROOT', root):
                with self.assertRaisesRegex(ValueError, 'Select one reviewed'):
                    addon.select_manifest(b'fixture input')


if __name__ == "__main__":
    unittest.main()
