#!/usr/bin/env python3
"""Non-compiling regression checks for release intake and context inheritance."""

import hashlib
import importlib.util
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch
from contextlib import redirect_stderr, redirect_stdout

PROJECT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location('changelog_index', PROJECT / 'scripts/index-current-changelog.py')
index = importlib.util.module_from_spec(spec)
spec.loader.exec_module(index)


class HistoricalCrosswalk(unittest.TestCase):
    def setUp(self):
        scratch = PROJECT / 'runtime/changelog-crosswalk-tests'
        scratch.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(temporary.cleanup)
        self.base = Path(temporary.name)
        self.root = self.base / 'project'
        self.root.mkdir()
        context = patch.object(index, 'ROOT', self.root)
        context.start()
        self.addCleanup(context.stop)

    def write(self, name, text):
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text)
        return path

    def crosswalk(self, name, target='0.107.0', rows=None, historical=None):
        text = f'# Release coverage — selected {target} target\n\n'
        if historical:
            version, ref = historical
            text += f'Historical release context: [{version}]({ref})\n\n'
        text += '| Release | Scope | Status | Remaining | Owners |\n| --- | --- | --- | --- | --- |\n'
        for release, status, owner in rows or [('0.106.0', 'partial', 'docs/current.md')]:
            text += f'| {release} | Spell contract | {status} | Review #41 | [owner]({owner}) |\n'
        return self.write(name, text)

    def test_claim_intake_works_before_target_registration(self):
        changelog = self.write('CHANGELOG.md', '## 0.107.0\n\n- Older claim\n\n'
                               '## 0.108.0\n\n- Spell damage\n  - Boss phase condition\n')
        argv = ['index-current-changelog.py', '--claims-only', '0.108.0', '--changelog', str(changelog)]
        output = io.StringIO()
        with patch.object(sys, 'argv', argv), patch.object(index, 'latest_target', side_effect=AssertionError), redirect_stdout(output):
            index.main()
        parent, child = (json.loads(line) for line in output.getvalue().splitlines())
        expected = hashlib.sha256(b'Spell damage').hexdigest()[:16]
        self.assertEqual(parent['id'], f'changelog:0.108.0:{expected}')
        self.assertEqual(child['parent_id'], parent['id'])
        self.assertEqual(child['source_span']['line_start'], 8)
        self.assertNotIn('target', parent)

    def test_no_inheritance_preserves_existing_context_and_identity_shape(self):
        path = self.crosswalk('current.md')
        contexts, identity = index.parse_crosswalk(path, '0.107.0')
        self.assertEqual(identity, {'path': 'current.md', 'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                                    'target_version': '0.107.0', 'status': 'current_release_context'})
        self.assertEqual(contexts, {'0.106.0': {
            'reference': 'current.md#L5', 'reviewed_scope': 'Spell contract', 'contextual_status': 'partial',
            'remaining_check_or_omission': 'Review #41', 'source_refs': [], 'evidence_refs': ['docs/current.md'],
            'mentioned_gap_ids': [41], 'contextual_systems': []}})

    def test_inheritance_keeps_original_refs_digest_and_historical_target(self):
        old = self.crosswalk('old.md', '0.105.0', [('0.101.0', 'implemented unverified', 'crates/live.rs')])
        current = self.crosswalk('current.md', historical=('0.105.0', 'old.md'))
        original, old_identity = index.parse_crosswalk(old, '0.107.0')
        contexts, identity = index.parse_crosswalk(current, '0.107.0')
        inherited = contexts['0.101.0']
        self.assertEqual(inherited['reference'], original['0.101.0']['reference'])
        self.assertEqual(inherited['source_refs'], ['crates/live.rs'])
        self.assertEqual(inherited['contextual_status'], 'historical_release_context')
        self.assertEqual(inherited['historical_contextual_status'], 'implemented unverified')
        self.assertEqual(inherited['target_version'], '0.105.0')
        self.assertEqual(inherited['origin_crosswalk'], {key: old_identity[key] for key in ('path', 'sha256', 'target_version')})
        self.assertEqual(identity['historical_release_context'], old_identity)
        self.assertEqual(contexts['0.106.0']['contextual_status'], 'partial')
        self.assertNotIn('target_version', contexts['0.106.0'])

    def test_local_rows_override_inherited_rows_without_historical_fields(self):
        self.crosswalk('old.md', '0.105.0', [('0.101.0', 'old status', 'docs/old.md')])
        current = self.crosswalk('current.md', rows=[('0.101.0', 'new status', 'docs/new.md')],
                                 historical=('0.105.0', 'old.md'))
        contexts, _ = index.parse_crosswalk(current, '0.107.0')
        self.assertEqual(contexts['0.101.0']['contextual_status'], 'new status')
        self.assertEqual(contexts['0.101.0']['evidence_refs'], ['docs/new.md'])
        self.assertNotIn('origin_crosswalk', contexts['0.101.0'])

    def test_nested_inheritance_preserves_original_target_and_digest(self):
        oldest = self.crosswalk('oldest.md', '0.100.0', [('0.99.0', 'partial', 'docs/oldest.md')])
        self.crosswalk('old.md', '0.105.0', historical=('0.100.0', 'oldest.md'))
        current = self.crosswalk('current.md', historical=('0.105.0', 'old.md'))
        contexts, _ = index.parse_crosswalk(current, '0.107.0')
        self.assertEqual(contexts['0.99.0']['target_version'], '0.100.0')
        self.assertEqual(contexts['0.99.0']['origin_crosswalk']['sha256'], hashlib.sha256(oldest.read_bytes()).hexdigest())
        self.assertEqual(contexts['0.99.0']['historical_contextual_status'], 'partial')

    def test_cycle_is_rejected(self):
        self.crosswalk('a.md', '0.105.0', historical=('0.105.0', 'b.md'))
        self.crosswalk('b.md', '0.105.0', historical=('0.105.0', 'a.md'))
        with self.assertRaisesRegex(ValueError, 'cycle'):
            index.parse_crosswalk(self.root / 'a.md', '0.107.0')

    def test_outside_workspace_reference_is_rejected(self):
        (self.base / 'outside.md').write_text('# selected 0.105.0 target\n')
        current = self.crosswalk('current.md', historical=('0.105.0', '../outside.md'))
        with self.assertRaisesRegex(ValueError, 'escapes checkout'):
            index.parse_crosswalk(current, '0.107.0')

    def test_newer_or_equal_target_inheritance_is_rejected(self):
        for version in ('0.108.0', '0.107.0'):
            with self.subTest(version=version):
                self.crosswalk('old.md', version)
                current = self.crosswalk('current.md', historical=(version, 'old.md'))
                with self.assertRaisesRegex(ValueError, 'older than'):
                    index.parse_crosswalk(current, '0.107.0')

    def test_declared_version_must_match_historical_file(self):
        self.crosswalk('old.md', '0.104.0')
        current = self.crosswalk('current.md', historical=('0.105.0', 'old.md'))
        with self.assertRaisesRegex(ValueError, 'version disagrees'):
            index.parse_crosswalk(current, '0.107.0')

    def test_missing_or_remote_historical_file_is_rejected(self):
        for link, error in [('missing.md', 'missing'), ('https://example.invalid/old.md', 'project-local'), ('old.md#part', 'without a fragment')]:
            with self.subTest(link=link):
                current = self.crosswalk('current.md', historical=('0.105.0', link))
                with self.assertRaisesRegex(ValueError, error):
                    index.parse_crosswalk(current, '0.107.0')

    def test_malformed_or_duplicate_historical_declarations_are_rejected(self):
        self.crosswalk('old.md', '0.105.0')
        for line in ['Historical release context: old.md',
                     'Historical release context: [0.105.0](old.md)\nHistorical release context: [0.105.0](old.md)']:
            with self.subTest(line=line):
                current = self.crosswalk('current.md')
                current.write_text(current.read_text() + line + '\n')
                with self.assertRaisesRegex(ValueError, 'invalid or duplicate'):
                    index.parse_crosswalk(current, '0.107.0')

    def test_historical_context_never_applies_an_old_individual_review(self):
        changelog = self.write('CHANGELOG.md', '## 0.101.0\n\n- Spell damage\n')
        self.crosswalk('old.md', '0.105.0', [('0.101.0', 'implemented unverified', 'crates/live.rs')])
        current = self.crosswalk('current.md', historical=('0.105.0', 'old.md'))
        source = self.write('crates/live.rs', '// reviewed source\n')
        claim = index.parse_claims(changelog)[0][0]
        reviews = self.write('reviews.json', json.dumps({'schema_version': 1, 'reviews': [{
            'claim_id': claim['id'], 'target': {'version': '0.105.0', 'sha256': 'a' * 64},
            'status': 'source_connected', 'rationale': 'Old target only.', 'source_refs': ['crates/live.rs'],
            'evidence_refs': [], 'reviewed_ref_sha256': {'crates/live.rs': hashlib.sha256(source.read_bytes()).hexdigest()}}]}))
        target = {'version': '0.107.0', 'sha256': 'b' * 64, 'path': 'installed-game/AzerothSurvivors.exe',
                  'size_bytes': 10, 'identity_manifest': 'target.json'}
        systems = self.write('systems.json', json.dumps({'target': target, 'systems': []}))
        self.write('changelog_2026-10-15_1.json', '{}\n')
        ledger = index.build_ledger(target, changelog, current, reviews, systems)
        self.assertEqual(ledger['entries'][0]['status'], 'pending_claim_recovery')
        self.assertEqual(ledger['entries'][0]['contextual_status'], 'historical_release_context')
        self.assertEqual(ledger['entries'][0]['mapping_basis'], 'release_context_only')
        self.assertEqual(ledger['summary']['applied_claim_reviews'], 0)
        self.assertEqual(ledger['generated_from']['reviews']['historical_unapplied_reviews'][0]['application'], 'historical_unapplied')

    def test_ledger_output_cannot_overwrite_an_inherited_crosswalk(self):
        changelog = self.write('CHANGELOG.md', '## 0.101.0\n\n- Spell damage\n')
        old = self.crosswalk('old.md', '0.105.0', [('0.101.0', 'partial', 'crates/live.rs')])
        current = self.crosswalk('current.md', historical=('0.105.0', 'old.md'))
        reviews = self.write('reviews.json', '{"schema_version": 1, "reviews": []}')
        systems = self.write('systems.json', '{"systems": []}')
        self.write('changelog_2026-10-15_1.json', '{}\n')
        target = {'version': '0.107.0', 'sha256': 'b' * 64, 'path': 'installed-game/AzerothSurvivors.exe',
                  'size_bytes': 10, 'identity_manifest': 'target.json'}
        argv = ['index-current-changelog.py', '--write', '--changelog', str(changelog), '--crosswalk', str(current),
                '--reviews', str(reviews), '--systems', str(systems), '--output', str(old)]
        before, stderr = old.read_bytes(), io.StringIO()
        with patch.object(sys, 'argv', argv), patch.object(index, 'latest_target', return_value=target), redirect_stderr(stderr):
            with self.assertRaises(SystemExit) as stopped:
                index.main()
        self.assertEqual(stopped.exception.code, 1)
        self.assertIn('must not overwrite a historical crosswalk', stderr.getvalue())
        self.assertEqual(old.read_bytes(), before)

    def ownership_fixture(self, historical=False):
        changelog = self.write('CHANGELOG.md', '## 0.107.0\n\n- Chaos Orb markers\n')
        crosswalk = self.crosswalk('current.md', rows=[('0.107.0', 'partial', 'docs/markers.md')])
        target = {'version': '0.107.0', 'sha256': 'b' * 64, 'path': 'installed-game/AzerothSurvivors.exe',
                  'size_bytes': 10, 'identity_manifest': 'target.json'}
        reviewed_target = {'version': '0.105.0', 'sha256': 'a' * 64} if historical else {
            key: target[key] for key in ('version', 'sha256')}
        source = self.write('crates/live.rs', '// possible consumer; not certified\n')
        evidence = self.write('docs/markers.md', reviewed_target['sha256'] + '\nCurrent marker ownership lead.\n')
        claim = index.parse_claims(changelog)[0][0]
        review = {'claim_id': claim['id'], 'target': reviewed_target, 'status': 'pending_claim_recovery',
                  'rationale': 'Marker ownership only; behavior remains unrecovered.', 'source_refs': ['crates/live.rs'],
                  'evidence_refs': ['docs/markers.md'], 'systems': ['custom-game-markers'], 'gap_ids': [41, 42],
                  'reviewed_ref_sha256': {'crates/live.rs': hashlib.sha256(source.read_bytes()).hexdigest(),
                                          'docs/markers.md': hashlib.sha256(evidence.read_bytes()).hexdigest()}}
        reviews = self.root / 'reviews.json'
        systems = self.write('systems.json', json.dumps({'target': target, 'systems': [{
            'id': 'custom-game-markers', 'source_refs': ['crates/live.rs']}]}))
        self.write('changelog_2026-10-15_1.json', '{}\n')
        return {'target': target, 'changelog': changelog, 'crosswalk': crosswalk,
                'reviews': reviews, 'systems': systems, 'review': review}

    def ownership_ledger(self, fixture):
        fixture['reviews'].write_text(json.dumps({'schema_version': 1, 'reviews': [fixture['review']]}))
        return index.build_ledger(*(fixture[key] for key in ('target', 'changelog', 'crosswalk', 'reviews', 'systems')))

    def test_pending_ownership_never_advances_claim_source_or_parity(self):
        fixture = self.ownership_fixture()
        ledger = self.ownership_ledger(fixture)
        entry = ledger['entries'][0]
        self.assertEqual(entry['status'], 'pending_claim_recovery')
        self.assertEqual(entry['mapping_basis'], 'individual_target_ownership_lead')
        self.assertEqual(entry['systems'], ['custom-game-markers'])
        self.assertEqual(entry['gap_ids'], [41, 42])
        self.assertEqual(entry['source_refs'], [])
        self.assertEqual(entry['ownership_source_refs'], ['crates/live.rs'])
        self.assertEqual(entry['evidence_refs'], ['docs/markers.md'])
        self.assertEqual(entry['assessment'], {'recovery': 'unknown', 'implementation': 'unknown',
            'static_validation': 'not_run', 'runtime_validation': 'unverified', 'parity': 'unverified'})
        self.assertNotIn('native_contract', entry)
        self.assertNotIn('static_checks', entry)
        self.assertEqual(ledger['summary']['pending_claim_recovery'], 1)
        self.assertEqual(ledger['summary']['applied_claim_reviews'], 0)
        self.assertEqual(ledger['summary']['applied_ownership_reviews'], 1)
        self.assertEqual(ledger['generated_from']['reviews']['applied_reviews'], 0)

    def test_old_target_ownership_remains_unapplied(self):
        ledger = self.ownership_ledger(self.ownership_fixture(historical=True))
        entry = ledger['entries'][0]
        self.assertEqual(entry['status'], 'pending_claim_recovery')
        self.assertEqual(entry['mapping_basis'], 'release_context_only')
        self.assertEqual(entry['source_refs'], [])
        self.assertEqual(entry['systems'], [])
        self.assertEqual(entry['gap_ids'], [41])
        self.assertNotIn('ownership_rationale', entry)
        self.assertEqual(ledger['summary']['applied_claim_reviews'], 0)
        self.assertEqual(ledger['summary']['applied_ownership_reviews'], 0)
        self.assertEqual(ledger['generated_from']['reviews']['historical_unapplied_reviews'][0]['application'], 'historical_unapplied')

    def test_changed_source_keeps_claim_pending_and_original_review_intact(self):
        fixture = self.ownership_fixture()
        fixture['review']['status'] = 'source_connected'
        self.write('crates/live.rs', '// edited after the review\n')
        ledger = self.ownership_ledger(fixture)
        entry = ledger['entries'][0]
        self.assertEqual(entry['status'], 'pending_claim_recovery')
        self.assertEqual(entry['source_refs'], [])
        self.assertEqual(entry['stale_source_review'], {
            'previous_status': 'source_connected', 'changed_refs': ['crates/live.rs']})
        self.assertEqual(ledger['generated_from']['reviews']['stale_source_reviews'], 1)
        self.assertEqual(json.loads(fixture['reviews'].read_text())['reviews'][0], fixture['review'])

    def test_retired_historical_script_requires_exact_git_source_and_stays_unapplied(self):
        fixture = self.ownership_fixture(historical=True)
        name, raw = 'scripts/retired.py', b'# exact historical source\n'
        expected = hashlib.sha256(raw).hexdigest()
        fixture['review']['source_refs'].append(name)
        fixture['review']['reviewed_ref_sha256'][name] = expected
        with patch.object(index, 'historical_source', return_value=raw) as source:
            ledger = self.ownership_ledger(fixture)
        source.assert_called_once_with(name, expected, self.root)
        self.assertEqual(ledger['summary']['applied_ownership_reviews'], 0)
        with patch.object(index, 'historical_source', side_effect=ValueError('unavailable')):
            with self.assertRaisesRegex(ValueError, 'review reference missing'):
                self.ownership_ledger(fixture)

    def test_current_review_cannot_use_retired_historical_script(self):
        fixture = self.ownership_fixture()
        name = 'scripts/retired.py'
        fixture['review']['source_refs'].append(name)
        fixture['review']['reviewed_ref_sha256'][name] = 'c' * 64
        with patch.object(index, 'historical_source') as source:
            with self.assertRaisesRegex(ValueError, 'review reference missing'):
                self.ownership_ledger(fixture)
        source.assert_not_called()

    def test_pending_ownership_requires_known_systems_and_positive_gaps(self):
        for field, value, error in [('systems', [], 'needs systems'),
                                    ('systems', ['unknown-system'], 'unknown system'),
                                    ('gap_ids', [], 'needs systems'),
                                    ('gap_ids', [True], 'permanent positive integers'),
                                    ('gap_ids', [0], 'permanent positive integers')]:
            with self.subTest(field=field, value=value):
                fixture = self.ownership_fixture()
                fixture['review'][field] = value
                with self.assertRaisesRegex(ValueError, error):
                    self.ownership_ledger(fixture)

    def test_pending_ownership_requires_hashed_target_bound_evidence(self):
        for fault, error in [('missing', 'needs systems'), ('unbound', 'exact target hash'),
                             ('digest_missing', 'exact file SHA-256'), ('digest_changed', 'reference bytes changed')]:
            with self.subTest(fault=fault):
                fixture = self.ownership_fixture()
                if fault == 'missing':
                    fixture['review']['evidence_refs'] = []
                elif fault == 'unbound':
                    evidence = self.write('docs/markers.md', 'Ownership report without target identity.\n')
                    fixture['review']['reviewed_ref_sha256']['docs/markers.md'] = hashlib.sha256(evidence.read_bytes()).hexdigest()
                elif fault == 'digest_missing':
                    del fixture['review']['reviewed_ref_sha256']['docs/markers.md']
                else:
                    self.write('docs/markers.md', 'changed evidence\n')
                with self.assertRaisesRegex(ValueError, error):
                    self.ownership_ledger(fixture)

    def test_pending_ownership_requires_exact_target_and_rationale(self):
        for field, value, error in [('target', {'version': '0.107.0'}, 'exact target version and SHA-256'),
                                    ('target', {'version': '0.106.0', 'sha256': 'b' * 64}, 'version disagrees'),
                                    ('rationale', '', 'rationale is required')]:
            with self.subTest(field=field):
                fixture = self.ownership_fixture()
                fixture['review'][field] = value
                with self.assertRaisesRegex(ValueError, error):
                    self.ownership_ledger(fixture)

    def test_pending_ownership_rejects_native_or_static_certification_fields(self):
        for field, value in [('native_contract', 'claimed recovery'), ('static_checks', [])]:
            with self.subTest(field=field):
                fixture = self.ownership_fixture()
                fixture['review'][field] = value
                with self.assertRaisesRegex(ValueError, 'cannot certify'):
                    self.ownership_ledger(fixture)

    def test_no_ownership_rows_preserves_existing_review_counter_shape(self):
        fixture = self.ownership_fixture()
        fixture['review']['status'] = 'source_connected'
        ledger = self.ownership_ledger(fixture)
        self.assertEqual(ledger['summary']['applied_claim_reviews'], 1)
        self.assertNotIn('applied_ownership_reviews', ledger['summary'])
        self.assertNotIn('applied_ownership_reviews', ledger['generated_from']['reviews'])
        self.assertEqual(ledger['entries'][0]['source_refs'], ['crates/live.rs'])


if __name__ == '__main__':
    unittest.main()
