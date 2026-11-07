#!/usr/bin/env python3
"""Bounded full-PE selection regressions; no target/provider/compiler runs."""
import importlib.util
import hashlib
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('selection', ROOT / 'scripts/census-current-target.py')
selection = importlib.util.module_from_spec(spec)
spec.loader.exec_module(selection)


class Selection(unittest.TestCase):
    target = dict(version='fixture', path='fixture.exe', sha256='a' * 64, size_bytes=123)

    def reference(self, address, count=10, instruction=None):
        return dict(runtime_function_start=address, owner_byte_count=count, owner_sha256='b' * 64,
                    instruction_address=instruction or address)

    def inventory(self, rows):
        return dict(target=self.target, diagnostics=[dict(path=path, custom_game_crate=True, verified_references=refs)
                                                    for path, refs in rows])

    def test_smallest_owner_selection_is_deterministic_and_shared_owners_are_deduplicated(self):
        rows = [('z.rs', [self.reference('0x120', 30), self.reference('0x110')]),
                ('a.rs', [self.reference('0x110'), self.reference('0x100')])]
        selected = selection.select_owners(self.inventory(rows), self.target)
        self.assertEqual([row['path'] for row in selected], ['a.rs', 'z.rs'])
        self.assertEqual([row['reference']['runtime_function_start'] for row in selected], ['0x100', '0x110'])
        selected.append(dict(path='shared.rs', reference=self.reference('0x100')))
        seeds, plan = selection.bounded_plan(self.target, selected, ROOT / 'runtime/selection-fixture', 'Create Address Tables')
        self.assertEqual(seeds.count('\tcode\n'), 2)
        self.assertEqual(len(plan['operations']), 8)
        self.assertEqual(plan['operations'][0]['arguments']['procedure'], '0x100')
        self.assertNotIn('search_procedures', [row['name'] for row in plan['operations']])

    def test_changed_same_version_identity_is_rejected(self):
        with self.assertRaisesRegex(ValueError, 'another selected target'):
            selection.select_owners(self.inventory([]), {**self.target, 'sha256': 'c' * 64})

    def test_missing_owners_and_changed_scope_fail_closed(self):
        for rows in ([], [('missing.rs', [])], [('a.rs', [self.reference('0x100')]), ('b.rs', [self.reference('0x110')])]):
            with self.assertRaises(ValueError):
                selection.select_owners(self.inventory(rows), self.target, limit=1)

    def test_plan_keeps_full_pe_input_and_exact_bounded_analysis_settings(self):
        selected = selection.select_owners(self.inventory([('a.rs', [self.reference('0x100')])]), self.target)
        seeds, plan = selection.bounded_plan(self.target, selected, ROOT / 'runtime/selection-fixture', 'Exact,Exclusions')
        self.assertEqual(plan['target'], 'fixture.exe')
        self.assertNotIn('open_options', plan)
        self.assertEqual(plan['environment']['REA_GHIDRA_STARTUP_TIMEOUT_MS'], '300000')
        self.assertEqual(plan['environment']['REA_GHIDRA_DISABLED_ANALYZERS'], 'Exact,Exclusions')
        self.assertEqual(plan['operations'][0]['timeout'], 360)
        self.assertEqual(plan['operations'][1]['timeout'], 60)
        self.assertEqual(seeds, '0x100\tfunction\n0x100\tcode\n')

    def test_reviewed_banners_scope_is_admitted_but_further_growth_is_rejected(self):
        rows = [(f'path-{index}.rs', [self.reference('0x100')]) for index in range(58)]
        rows.append(('realmd.rs', [self.reference('0x110')]))
        rows.append(('banners.rs', [self.reference('0x120')]))
        self.assertEqual(len(selection.select_owners(self.inventory(rows), self.target)), 60)
        rows.append(('unreviewed.rs', [self.reference('0x120')]))
        with self.assertRaisesRegex(ValueError, 'review a changed scope explicitly'):
            selection.select_owners(self.inventory(rows), self.target)

    def test_bulk_change_with_unchanged_target_header_is_rejected(self):
        summary = dict(target=self.target, inventory=dict(path='runtime/fixture.json', sha256='original-bulk-digest'))
        selection.validate_ownership_summary(summary, self.target, 'runtime/fixture.json', 'original-bulk-digest')
        with self.assertRaisesRegex(ValueError, 'canonical path/digest'):
            selection.validate_ownership_summary(summary, self.target, 'runtime/fixture.json', 'changed-bulk-digest')
        with self.assertRaisesRegex(ValueError, 'another selected target'):
            selection.validate_ownership_summary({**summary, 'target': {**self.target, 'sha256': 'c' * 64}},
                                                 self.target, 'runtime/fixture.json', 'original-bulk-digest')

    def test_selected_owner_bytes_must_match_exact_current_file_extent(self):
        row = dict(path='fixture.rs', reference=dict(owner_file_offset='0x2', owner_byte_count=4,
                   owner_sha256=hashlib.sha256(b'code').hexdigest()))
        selection.validate_owner_bytes([row], b'xxcodexx')
        for image in (b'xxedited', b'xxco'):
            with self.assertRaisesRegex(ValueError, 'owner bytes differ'):
                selection.validate_owner_bytes([row], image)


if __name__ == '__main__':
    unittest.main()
