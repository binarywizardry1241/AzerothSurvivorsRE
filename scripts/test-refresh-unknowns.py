#!/usr/bin/env python3
"""Current-census selector admission tests; no target analysis or compilation."""
import copy
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('refresh_unknowns', ROOT / 'scripts/summarize-refresh-unknowns.py')
queue = importlib.util.module_from_spec(spec)
spec.loader.exec_module(queue)


class CurrentCensus(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='refresh-unknowns-fixture-', dir=ROOT / 'runtime')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.directory = self.root / 'runtime/census'
        self.directory.mkdir(parents=True)
        self.path = self.root / 'docs/analysis/coverage/full-image-census.json'
        self.path.parent.mkdir(parents=True)
        self.target = dict(version='0.115.0', path='installed-game/fixture.exe', sha256='a' * 64, size_bytes=12)
        self.counts = dict(instructions=3, instruction_bytes=7, native_functions=2, references=4)
        self.exports = {}
        for name in ('instructions.tsv.gz', 'bodies.tsv.gz', 'references.tsv.gz',
                     'externals.tsv.gz', 'direct-call-helpers.tsv.gz'):
            path = self.directory / name
            path.write_bytes(('fixture ' + name).encode())
            self.exports[name] = dict(sha256=queue.file_sha256(path), bytes=path.stat().st_size)
        self.progress = dict(target_sha256=self.target['sha256'], stage='completed', files=self.exports, **self.counts)
        self.plan = dict(target_sha256=self.target['sha256'], seed_scope='declared')
        self.session = dict(result=dict(ok=True), profileDigest='fixture-profile')
        self.bindings = [dict(path='crates/fixture.rs', custom_game_crate=True,
                             verified_sites=2, sites_without_actual_ghidra_owner=1)]
        self.independent = dict(performed=True, exact_source_bytes_verified=True, instruction_records=3, decoded_bytes=7,
            unobserved_range_inventory=self.artifact('missing-declared-ranges.tsv.gz', b'declared residuals'),
            executable_sections=dict(range_inventory=self.artifact('missing-executable-ranges.tsv.gz', b'executable residuals')))
        self.summary = dict(target=self.target, whole_image_input=True, seed_scope='declared',
            requested_seeds=2, all_seeded_body_operations_complete=True, profile_digest='fixture-profile',
            independent_instructions=self.independent, counts=self.counts,
            artifacts=dict(directory=self.directory.relative_to(self.root).as_posix(), files=self.exports),
            diagnostic_binding_counts=dict(paths=1, custom_paths=1, verified_sites=2, sites_without_actual_native_owner=1))
        self.save()

    def artifact(self, name, raw):
        path = self.directory / name
        path.write_bytes(raw)
        return dict(path=path.relative_to(self.root).as_posix(), sha256=queue.file_sha256(path))

    def save(self):
        for name, value, key in [('plan.json', self.plan, 'plan_sha256'),
                                  ('progress.json', self.progress, 'progress_sha256'),
                                  ('session-result.json', self.session, 'session_result_sha256')]:
            path = self.directory / name
            path.write_text(json.dumps(value))
            self.summary['artifacts'][key] = queue.file_sha256(path)
        full = {key: value for key, value in self.summary.items()
                if key not in ('full_summary_snapshot', 'diagnostic_binding_audit')}
        full['diagnostic_bindings'] = self.bindings
        self.summary['full_summary_snapshot'] = self.artifact('full-summary.json', json.dumps(full).encode())
        self.summary['diagnostic_binding_audit'] = self.artifact('diagnostic-bindings.json',
            json.dumps(dict(target=self.target, diagnostic_bindings=self.bindings)).encode())
        self.path.write_text(json.dumps(self.summary))

    def load(self):
        return queue.ghidra_census_input(self.target, root=self.root)

    def test_current_verified_bundle_publishes_exact_artifact_selectors(self):
        selected = self.load()
        self.assertEqual(selected['summary']['sha256'], queue.file_sha256(self.path))
        self.assertEqual(selected['counts'], self.counts)
        self.assertEqual(len(selected['artifact_selectors']), 6)
        for selector in selected['artifact_selectors']:
            binding = selector['artifact']
            self.assertEqual(binding['sha256'], queue.file_sha256(self.root / binding['path']))
        self.assertFalse(selected['explicit_ownerless_site_inventory_available'])
        self.assertFalse(selected['computed_destination_classification_available'])
        self.assertFalse(selected['global_native_semantics_complete'])
        self.assertFalse(selected['global_aliasing_complete'])
        self.assertFalse(selected['parity_verified'])

    def test_absent_or_historical_summary_does_not_block_current_refresh(self):
        self.path.unlink()
        self.assertIsNone(self.load())
        # No current artifacts or verification flags are needed to retain history.
        self.path.write_text(json.dumps(dict(target=dict(version='0.113.2', sha256='b' * 64))))
        self.assertIsNone(self.load())
        self.path.write_text(json.dumps(dict(target={**self.target, 'sha256': 'b' * 64})))
        self.assertIsNone(self.load())

    def test_explicit_census_does_not_replace_or_fall_back_to_seed_pointer(self):
        explicit = self.path.with_name('expanded.json')
        explicit.write_bytes(self.path.read_bytes())
        historical = json.dumps(dict(target=dict(version='0.113.2', sha256='b' * 64)))
        self.path.write_text(historical)
        selected = queue.ghidra_census_input(self.target, root=self.root,
            census_summary=explicit.relative_to(self.root))
        self.assertEqual(selected['summary']['path'], explicit.relative_to(self.root).as_posix())
        self.assertEqual(self.path.read_text(), historical)
        explicit.write_text(historical)
        with self.assertRaisesRegex(ValueError, 'belongs to another target'):
            queue.ghidra_census_input(self.target, root=self.root,
                census_summary=explicit.relative_to(self.root))
        explicit.unlink()
        with self.assertRaisesRegex(ValueError, 'summary is missing'):
            queue.ghidra_census_input(self.target, root=self.root,
                census_summary=explicit.relative_to(self.root))
        with self.assertRaisesRegex(ValueError, 'summary escapes project'):
            queue.ghidra_census_input(self.target, root=self.root, census_summary='../outside.json')

    def test_selected_hash_requires_exact_version_path_and_size(self):
        for key, replacement in [('version', '0.114.0'), ('path', 'other.exe'), ('size_bytes', 13)]:
            with self.subTest(key=key):
                changed = {**self.summary, 'target': {**self.target, key: replacement}}
                self.path.write_text(json.dumps(changed))
                with self.assertRaisesRegex(ValueError, 'selected-target identity'):
                    self.load()

    def test_current_unverified_or_partial_scope_fails_closed(self):
        original = copy.deepcopy(self.summary)
        cases = [('whole_image_input', False), ('seed_scope', 'pointers'),
                 ('performed', False), ('exact_source_bytes_verified', False)]
        for key, replacement in cases:
            with self.subTest(key=key):
                changed = copy.deepcopy(original)
                destination = changed['independent_instructions'] if key in ('performed', 'exact_source_bytes_verified') else changed
                destination[key] = replacement
                self.path.write_text(json.dumps(changed))
                with self.assertRaisesRegex(ValueError, 'independent source-byte verification'):
                    self.load()

    def test_incomplete_or_failed_execution_is_not_a_current_inventory(self):
        self.progress['stage'] = 'body-repair'
        self.save()
        with self.assertRaisesRegex(ValueError, 'execution identity or completion'):
            self.load()
        self.progress['stage'] = 'completed'
        self.session['result']['ok'] = False
        self.save()
        with self.assertRaisesRegex(ValueError, 'execution identity or completion'):
            self.load()

    def test_missing_seed_bodies_remain_visible_without_discarding_completed_inventory(self):
        self.summary['all_seeded_body_operations_complete'] = False
        self.save()
        selected = self.load()
        self.assertFalse(selected['all_seeded_body_operations_complete'])
        self.assertIn('actual_ghidra_flow_body_intervals', selected['available_inventories'])

    def test_mutated_raw_or_residual_artifact_is_rejected(self):
        for name in ['bodies.tsv.gz', 'missing-executable-ranges.tsv.gz']:
            with self.subTest(name=name):
                path = self.directory / name
                original = path.read_bytes()
                path.write_bytes(b'changed')
                with self.assertRaisesRegex(ValueError, 'artifact changed or missing'):
                    self.load()
                path.write_bytes(original)

    def test_rehashed_snapshot_cannot_disagree_with_curated_summary(self):
        full = json.loads((self.directory / 'full-summary.json').read_text())
        full['counts']['instructions'] = 99
        self.summary['full_summary_snapshot'] = self.artifact('full-summary.json', json.dumps(full).encode())
        self.path.write_text(json.dumps(self.summary))
        with self.assertRaisesRegex(ValueError, 'Immutable Ghidra census summary differs: counts'):
            self.load()

    def test_rehashed_diagnostic_audit_cannot_disagree_with_immutable_summary(self):
        self.summary['diagnostic_binding_audit'] = self.artifact('diagnostic-bindings.json',
            json.dumps(dict(target=self.target, diagnostic_bindings=[])).encode())
        self.path.write_text(json.dumps(self.summary))
        with self.assertRaisesRegex(ValueError, 'diagnostic bindings differ'):
            self.load()

    def test_artifact_selector_cannot_escape_project(self):
        self.summary['independent_instructions']['unobserved_range_inventory']['path'] = '../outside.tsv.gz'
        self.save()
        with self.assertRaisesRegex(ValueError, 'artifact escapes project'):
            self.load()

    def test_independent_counts_must_agree_with_actual_exports(self):
        self.summary['independent_instructions']['instruction_records'] = 99
        self.save()
        with self.assertRaisesRegex(ValueError, 'independent instruction counters differ'):
            self.load()

    def test_missing_semantic_inventory_descriptions_change_only_for_verified_census(self):
        self.assertIn('Complete current Ghidra body', queue.missing_semantic_inventories(None)[0])
        missing = queue.missing_semantic_inventories(self.load())
        self.assertIn('Explicit ownerless-instruction', missing[0])
        self.assertIn('per-path diagnostic counts are available', missing[0])
        self.assertIn('computed-destination classification', missing[1])
        self.assertIn('alias/type/ID', missing[1])
        self.assertIn('source producer/consumer closure', missing[2])

    def test_admitted_classifiers_replace_missing_inventory_descriptions_only(self):
        missing = queue.missing_semantic_inventories(self.load(), {
            'explicit_ownerless_site_inventory_available': True,
            'computed_destination_classification_available': True})
        self.assertIn('classified diagnostic sites', missing[0])
        self.assertIn('state/type/cycle and outer-consumer', missing[0])
        self.assertIn('encoded computed-destination classifications are available', missing[1])
        self.assertIn('dynamic destination/alias/type/ID', missing[1])
        self.assertIn('source producer/consumer closure', missing[2])
        self.assertEqual(queue.missing_semantic_inventories(None, {
            'explicit_ownerless_site_inventory_available': True}),
            queue.missing_semantic_inventories(None))


if __name__ == '__main__':
    unittest.main()
