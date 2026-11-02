#!/usr/bin/env python3
"""Read-only census reporting regressions; no provider, compiler or target runs."""
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('census', ROOT / 'scripts/census-current-target.py')
census = importlib.util.module_from_spec(spec)
spec.loader.exec_module(census)


class ProgressReporting(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / 'runtime/coverage-tests'
        scratch.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.target = dict(version='fixture', path='fixture.exe', sha256='a' * 64, size_bytes=115)

    def write(self, stored_profile, **changes):
        path = self.root / 'ghidra' / stored_profile / 'progress.json'
        path.parent.mkdir(parents=True, exist_ok=True)
        state = dict(target=self.target, profile=stored_profile, status='bounded_pass_finished',
                     whole_image_input=stored_profile != census.PROFILES[1],
                     queue=dict(procedures=1, completed=1))
        state.update(changes)
        path.write_text(json.dumps(state))

    def test_missing_profiles_are_explicit(self):
        report = census.progress_report(self.target, self.root)
        self.assertEqual(set(report['profiles']), set(census.PROFILES))
        self.assertTrue(all(p['status'] == 'not_run' for p in report['profiles'].values()))

    def test_completed_sample_does_not_claim_full_image_coverage(self):
        self.write(census.PROFILES[1])
        report = census.progress_report(self.target, self.root)
        self.assertEqual(report['profiles'][census.PROFILES[0]]['status'], 'not_run')
        self.assertEqual(report['profiles'][census.PROFILES[1]]['queue']['completed'], 1)
        self.assertFalse(report['all_image_native_semantics_and_edges_complete'])

    def test_full_and_sample_progress_are_independent(self):
        self.write(census.PROFILES[0], status='running')
        self.write(census.PROFILES[1])
        report = census.progress_report(self.target, self.root)
        self.assertEqual(report['profiles'][census.PROFILES[0]]['status'], 'running')
        self.assertEqual(report['profiles'][census.PROFILES[1]]['status'], 'bounded_pass_finished')
        self.assertEqual(set(census.progress_report(self.target, self.root, True)['profiles']),
                         {census.PROFILES[1]})

    def test_changed_full_profile_preserves_original_failure(self):
        changed = 'full-image-no-address-tables'
        self.write(census.PROFILES[0], status='failed')
        self.write(changed, status='running')
        report = census.progress_report(self.target, self.root)
        self.assertEqual(report['profiles'][census.PROFILES[0]]['status'], 'failed')
        self.assertEqual(report['profiles'][changed]['status'], 'running')
        self.assertTrue(report['profiles'][changed]['whole_image_input'])
        self.assertFalse(report['all_image_native_semantics_and_edges_complete'])

    def test_profile_selection_records_exact_exclusions_without_inherited_seeds(self):
        profile, environment = census.configuration(False, 'full-image-no-address-tables', 600, {
            'REA_GHIDRA_SEED_FILE': 'other-task.json',
            'REA_GHIDRA_DISABLED_ANALYZERS': 'other analyzer',
        })
        self.assertEqual(profile, 'full-image-no-address-tables')
        self.assertEqual(environment['REA_GHIDRA_DISABLED_ANALYZERS'], census.DISABLED + ',Create Address Tables')
        self.assertNotIn('REA_GHIDRA_SEED_FILE', environment)
        self.assertEqual(environment['GHIDRA_HEADLESS_MAXMEM'], '2G')
        self.assertEqual(environment['REA_GHIDRA_STARTUP_TIMEOUT_MS'], '600000')

    def test_effective_heap_override_is_recorded(self):
        _, environment = census.configuration(False, census.PROFILES[0], 600, {'GHIDRA_MAXMEM': '4G'})
        self.assertEqual(environment['GHIDRA_HEADLESS_MAXMEM'], '4G')

    def test_extended_entry_decoding_has_an_independent_resource_store(self):
        profile, environment = census.configuration(False, 'full-image-entry-decoding-extended', 1800, {})
        self.assertEqual(environment['GHIDRA_HEADLESS_MAXMEM'], '6G')
        self.assertEqual(environment['REA_GHIDRA_STARTUP_TIMEOUT_MS'], '1800000')
        self.assertEqual(environment['REA_GHIDRA_DISABLED_ANALYZERS'], census.FULL_PROFILES['full-image-entry-decoding'])
        self.write('full-image-entry-decoding', status='failed')
        self.write(profile, status='running')
        report = census.progress_report(self.target, self.root)
        self.assertEqual(report['profiles']['full-image-entry-decoding']['status'], 'failed')
        self.assertEqual(report['profiles'][profile]['status'], 'running')

    def test_resume_preserves_heap_attempt_evidence(self):
        profile, environment = census.configuration(False, census.PROFILES[0], 600, {})
        state = dict(target=self.target, profile=profile, analysis_environment=environment)
        with self.assertRaisesRegex(ValueError, 'Stored heap limit differs'):
            census.validate_resume(state, self.target, profile, 'c' * 64,
                                   {**environment, 'GHIDRA_HEADLESS_MAXMEM': '6G'})

    def test_one_byte_bodies_are_observed_without_certifying_placeholder_ownership(self):
        state = census.summarize({}, [dict(status='completed', instruction_count=1, body_bytes=1),
                                     dict(status='completed', instruction_count=20, body_bytes=100),
                                     dict(status='completed', instruction_count=5)])
        self.assertEqual(state['observations']['procedures_with_one_byte_bodies'], 1)
        self.assertNotIn('procedures_with_placeholder_bodies', state['observations'])
        self.assertEqual(state['observations']['procedures_with_unknown_body_extents'], 1)
        self.assertFalse(state['all_image_native_semantics_and_edges_complete'])

    def test_entry_decoding_is_a_separate_full_profile_with_only_one_enabled_analyzer(self):
        profile, environment = census.configuration(False, 'full-image-entry-decoding', 600, {})
        self.assertEqual(profile, 'full-image-entry-decoding')
        self.assertEqual(set(environment['REA_GHIDRA_DISABLED_ANALYZERS'].split(',')),
                         set(census.DISABLED.split(',')) - {'Disassemble Entry Points'} | {'Create Address Tables'})
        self.assertNotIn('REA_GHIDRA_SEED_FILE', environment)

    def test_completed_queries_do_not_imply_decoded_instructions(self):
        state = census.summarize({}, [dict(status='completed', instruction_count=0),
                                      dict(status='completed', instruction_count=12),
                                      dict(status='completed', instruction_count=None),
                                      dict(status='completed'), dict(status='pending')])
        self.assertEqual(state['queue']['completed'], 4)
        self.assertEqual(state['observations']['procedures_with_decoded_instructions'], 1)
        self.assertEqual(state['observations']['procedures_queried_without_decoded_instructions'], 1)
        self.assertEqual(state['observations']['procedures_with_unknown_instruction_counts'], 2)
        self.assertFalse(state['all_image_native_semantics_and_edges_complete'])

    def test_sample_rejects_a_changed_full_profile(self):
        with self.assertRaisesRegex(ValueError, 'cannot be combined'):
            census.configuration(True, 'full-image-no-address-tables', 600, {})

    def test_resume_rejects_another_profile_or_analyzer_configuration(self):
        profile, environment = census.configuration(False, 'full-image-no-address-tables', 600, {})
        state = dict(target=self.target, profile=profile, unwind_directory_sha256='c' * 64,
                     analysis_environment=environment)
        census.validate_resume(state, self.target, profile, 'c' * 64, environment)
        with self.assertRaisesRegex(ValueError, 'target/profile'):
            census.validate_resume(state, self.target, census.PROFILES[0], 'c' * 64, environment)
        with self.assertRaisesRegex(ValueError, 'analyzer exclusions'):
            census.validate_resume({**state, 'analysis_environment': {
                'REA_GHIDRA_DISABLED_ANALYZERS': census.DISABLED}},
                self.target, profile, 'c' * 64, environment)

    def test_resume_rejects_changed_target_or_unwind_records(self):
        profile, environment = census.configuration(False, census.PROFILES[0], 600, {})
        state = dict(target=self.target, profile=profile, unwind_directory_sha256='c' * 64)
        with self.assertRaisesRegex(ValueError, 'target/profile'):
            census.validate_resume(state, {**self.target, 'sha256': 'b' * 64}, profile, 'c' * 64, environment)
        with self.assertRaisesRegex(ValueError, 'unwind records'):
            census.validate_resume(state, self.target, profile, 'd' * 64, environment)

    def test_changed_same_version_hash_is_rejected(self):
        self.write(census.PROFILES[1], target={**self.target, 'sha256': 'b' * 64})
        with self.assertRaisesRegex(ValueError, 'identity/profile mismatch'):
            census.progress_report(self.target, self.root)

    def test_misfiled_profile_is_rejected(self):
        self.write(census.PROFILES[1], profile='another-profile')
        with self.assertRaisesRegex(ValueError, 'identity/profile mismatch'):
            census.progress_report(self.target, self.root)

    def transport_failure(self, **changes):
        error = dict(code='resource_constraint', details=dict(
            resource='transport', operation='search_procedures', reported_limits=dict(
                boundary='mcp-response', evidence_id='ev_fixture',
                evidence_reference=dict(kind='retained-evidence', evidence_id='ev_fixture'))))
        error.update(changes)
        return dict(content=[dict(type='text', text=json.dumps(dict(error=error)))], isError=True)

    def native_record(self, **changes):
        record = dict(evidence_id='ev_fixture', operation='search_procedures', provider=dict(id='ghidra'),
                      subject=dict(digest=dict(sha256=self.target['sha256'])),
                      analysis_profile=dict(digest='profile-fixture', parameters={}),
                      normalized_result=[dict(address=hex(0x140001000 + i), name=f'function_{i}') for i in range(500)])
        record.update(changes)
        return record

    def test_transport_constraint_exports_on_same_connection_without_reanalysis(self):
        owner = self
        class Client:
            output = owner.root
            sequence = 3
            calls = [dict(file='failed-call.json')]
            observed = []
            def call(self, name, arguments, timeout, label=None):
                self.observed.append((name, arguments))
                if name == 'search_procedures':
                    census.save(self.output / 'failed-call.json', dict(response=dict(result=owner.transport_failure())))
                    raise RuntimeError('saved transport error')
                owner.assertEqual(name, 'export_evidence_bundle')
                census.save(Path(arguments['path']), dict(records=[owner.native_record()]))
                return {}
        client, state = Client(), {}
        record = census.native_evidence(client, 'search_procedures', dict(pattern='.', mode='regex'),
                                        600, self.target['sha256'], state)
        self.assertEqual([call[0] for call in client.observed], ['search_procedures', 'export_evidence_bundle'])
        self.assertEqual(len(record['normalized_result']), 500)
        self.assertEqual(state['transport_exports'][0]['evidence_id'], 'ev_fixture')
        self.assertTrue(state['transport_exports'][0]['complete_retained_record'])

    def test_ordinary_provider_failure_does_not_export(self):
        self.assertIsNone(census.retained_transport_evidence(
            self.transport_failure(code='provider_timeout'), 'search_procedures'))
        self.assertIsNone(census.retained_transport_evidence(self.transport_failure(), 'procedure_info'))
        owner = self
        class Client:
            output = owner.root
            calls = [dict(file='failed-call.json')]
            observed = []
            def call(self, name, arguments, timeout, label=None):
                self.observed.append(name)
                census.save(self.output / 'failed-call.json', dict(response=dict(result=
                    owner.transport_failure(code='provider_timeout'))))
                raise RuntimeError('ordinary provider failure')
        client = Client()
        with self.assertRaisesRegex(RuntimeError, 'ordinary provider failure'):
            census.native_evidence(client, 'search_procedures', {}, 600, self.target['sha256'], {})
        self.assertEqual(client.observed, ['search_procedures'])

    def test_export_requires_exact_record_operation_and_selected_native_identity(self):
        record = self.native_record()
        for changes in (dict(evidence_id='ev_other'), dict(operation='procedure_info'),
                        dict(provider=dict(id='other')), dict(subject=dict(digest=dict(sha256='b' * 64)))):
            with self.assertRaises(ValueError):
                census.exported_evidence(dict(records=[{**record, **changes}]),
                                          'ev_fixture', 'search_procedures', self.target['sha256'])

    def test_exported_profile_must_match_requested_exclusions_and_resume_digest(self):
        record = self.native_record()
        census.validate_native_profile(record, {})
        with self.assertRaisesRegex(ValueError, 'profile changed'):
            census.validate_native_profile(record, dict(analysis_profile=dict(digest='another-profile')))
        with self.assertRaisesRegex(ValueError, 'analyzer exclusions'):
            census.validate_native_profile(record, dict(analysis_environment=dict(
                REA_GHIDRA_DISABLED_ANALYZERS='Create Address Tables')))

    def test_native_and_external_procedures_are_accounted_separately(self):
        native = self.native_record()['normalized_result']
        external = [dict(address='EXTERNAL:0x1', value='KERNEL32.DLL::DuplicateHandle')]
        rows, imports = census.classify_procedures(external + list(reversed(native)))
        self.assertEqual(len(rows), len(native))
        self.assertEqual(imports, external)
        self.assertEqual(len(rows) + len(imports), len(native) + len(external))
        self.assertEqual(rows[0]['address'], native[0]['address'])

    def test_unexpected_address_space_and_duplicate_native_entries_fail_closed(self):
        for procedures in ([dict(address='OTHER:0x1')],
                           [dict(address='EXTERNAL:invalid')],
                           [dict(address='0x140001000'), dict(address='0x140001000')]):
            with self.assertRaises(ValueError):
                census.classify_procedures(procedures)

    def saved_inventory(self, record):
        path = self.root / 'retained-inventory.json'
        census.save(path, dict(records=[record]))
        return dict(procedure_inventory_evidence_id='ev_fixture',
                    analysis_profile=dict(digest='profile-fixture'),
                    transport_exports=[dict(operation='search_procedures', evidence_id='ev_fixture',
                        path=path.relative_to(ROOT).as_posix(), sha256=census.file_sha256(path))])

    def test_retained_inventory_reuses_the_complete_validated_record(self):
        record = self.native_record()
        state = self.saved_inventory(record)
        result = census.retained_procedure_inventory(state, self.target['sha256'])
        self.assertEqual(result, record)

    def test_retained_inventory_rejects_export_identity_profile_and_digest_drift(self):
        state = self.saved_inventory(self.native_record())
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            census.retained_procedure_inventory({**state, 'transport_exports': [
                {**state['transport_exports'][0], 'sha256': 'wrong'}]}, self.target['sha256'])
        with self.assertRaisesRegex(ValueError, 'target digest'):
            census.retained_procedure_inventory(state, 'b' * 64)
        with self.assertRaisesRegex(ValueError, 'profile changed'):
            census.retained_procedure_inventory({**state, 'analysis_profile': dict(digest='other')}, self.target['sha256'])
        state = self.saved_inventory(self.native_record(evidence_id='ev_other'))
        with self.assertRaisesRegex(ValueError, 'exact retained'):
            census.retained_procedure_inventory(state, self.target['sha256'])


if __name__ == '__main__':
    unittest.main()
