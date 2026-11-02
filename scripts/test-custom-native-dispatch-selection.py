#!/usr/bin/env python3
"""Non-compiling checks for bounded current custom-dispatch selection."""
import importlib.util
from pathlib import Path
import unittest
import struct

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('custom_dispatch_selection', ROOT / 'scripts/select-custom-native-dispatch.py')
selection = importlib.util.module_from_spec(spec)
spec.loader.exec_module(selection)
spec = importlib.util.spec_from_file_location('custom_dispatch_frontier', ROOT / 'scripts/audit-custom-native-frontiers.py')
frontier = importlib.util.module_from_spec(spec)
spec.loader.exec_module(frontier)
spec = importlib.util.spec_from_file_location('custom_dispatch_recovery', ROOT / 'scripts/recover-custom-native-dispatch.py')
custom_recovery = importlib.util.module_from_spec(spec)
spec.loader.exec_module(custom_recovery)
spec = importlib.util.spec_from_file_location('custom_dispatch_base_fixtures', ROOT / 'scripts/test-native-jump-tables.py')
fixtures = importlib.util.module_from_spec(spec)
spec.loader.exec_module(fixtures)
spec = importlib.util.spec_from_file_location('custom_static_producers', ROOT / 'scripts/recover-custom-static-producers.py')
static_producers = importlib.util.module_from_spec(spec)
spec.loader.exec_module(static_producers)
spec = importlib.util.spec_from_file_location('native_dispatch_merge', ROOT / 'scripts/merge-native-dispatch-proofs.py')
native_merge = importlib.util.module_from_spec(spec)
spec.loader.exec_module(native_merge)
spec = importlib.util.spec_from_file_location('native_address_fixtures', ROOT / 'scripts/test-native-address-leads.py')
address_fixtures = importlib.util.module_from_spec(spec)
spec.loader.exec_module(address_fixtures)
spec = importlib.util.spec_from_file_location('native_code_augmentation', ROOT / 'scripts/augment-native-code-leads.py')
augmentation = importlib.util.module_from_spec(spec)
spec.loader.exec_module(augmentation)
spec = importlib.util.spec_from_file_location('native_address_code_merge', ROOT / 'scripts/merge-native-address-code-leads.py')
address_merge = importlib.util.module_from_spec(spec)
spec.loader.exec_module(address_merge)


class CustomSelection(unittest.TestCase):
    def test_declared_extent_end_is_exclusive_and_gaps_do_not_select_tables(self):
        tables = [{'site': hex(site), 'case_targets': ['0x1', '0x2']} for site in (0xff, 0x100, 0x10f, 0x110, 0x120, 0x130)]
        result = selection.select_tables(tables, [(0x100, 0x110), (0x120, 0x130)])
        self.assertEqual([row['site'] for row in result], ['0x100', '0x10f', '0x120'])
        self.assertIs(result[0], tables[1])
        self.assertEqual(result[0]['case_targets'], ['0x1', '0x2'])

    def test_only_exact_custom_undecoded_leads_are_selected(self):
        records = [
            {'classification': 'undecoded-exact-diagnostic-lead', 'diagnostic_paths': ['custom']},
            {'classification': 'decoded-without-body-owner', 'diagnostic_paths': ['custom']},
            {'classification': 'conflicts-with-existing-instruction-interior', 'diagnostic_paths': ['custom']},
            {'classification': 'undecoded-exact-diagnostic-lead', 'diagnostic_paths': ['engine']},
            {'classification': 'undecoded-exact-diagnostic-lead', 'diagnostic_paths': ['engine', 'custom']},
        ]
        self.assertEqual(selection.select_leads(records, {'custom'}), [records[0], records[4]])

    def test_potential_walk_stops_at_unproved_indirect_jump(self):
        import capstone
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        decoder.detail = True
        instructions = {row.address: row for row in decoder.disasm(bytes.fromhex('ffd0ffe090c3'), 0x1000)}
        reached, computed, assumptions = frontier.potential_walk(instructions, 0x1000, {}, capstone)
        self.assertEqual(reached, {0x1000, 0x1002})
        self.assertEqual(computed, {0x1002})
        self.assertEqual(assumptions, {0x1000})
        reached, _, _ = frontier.potential_walk(instructions, 0x1000, {0x1002: {0x1004, 0x9999}}, capstone)
        self.assertEqual(reached, {0x1000, 0x1002, 0x1004, 0x1005})

    def tail_recovery(self, tail, width=64):
        import capstone
        original = fixtures.GuardedTables().instructions(width=width)
        raw = b''.join(row.bytes for row in original[:-1]) + bytes.fromhex(tail) + original[-1].bytes
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        decoder.detail = True
        return custom_recovery.recover_transparent_tail(list(decoder.disasm(raw, original[0].address)),
                                                        fixtures.FakePe(), capstone, fixtures.classifier, fixtures.recovery)

    def test_store_after_add_preserves_the_already_calculated_destination(self):
        table, reason = self.tail_recovery('4889542408')
        self.assertIsNone(reason)
        self.assertEqual(table['case_targets'], [hex(0x140001050 + 4 * index) for index in range(4)])
        self.assertTrue(table['dispatch_tail_proof']['destination_preserved_and_no_transfers'])

    def test_changing_old_base_after_add_does_not_change_calculated_destination(self):
        self.assertIsNotNone(self.tail_recovery('b901000000')[0])

    def test_tail_rejects_partial_or_full_destination_writes_and_transfers(self):
        for tail in ('b001', 'b401', 'b801000000', '0f44c2', '48f7e1',
                     '7500', 'eb00', 'e800000000', '0f0b'):
            with self.subTest(tail=tail):
                self.assertIsNone(self.tail_recovery(tail)[0])

    def test_tail_does_not_invent_upper_selector_bits(self):
        self.assertIsNone(self.tail_recovery('4889542408', width=32)[0])

    def descriptor_recovery(self, *, writable=False, narrow_guard=False, mutation=b'', narrow_multiply=False, overwritten_base=False):
        import capstone
        pe = fixtures.FakePe(writable)
        for index, value in enumerate((0, 1, 3)):
            struct.pack_into('<Q', pe.data, 0x1108 + index * 0x10, value)
        address = 0x140001000
        raw = bytes.fromhex('83fa02' if narrow_guard else '4883fa02') + bytes.fromhex('7750')
        raw += mutation + bytes.fromhex('6bc210' if narrow_multiply else '486bc210')
        raw += bytes.fromhex('488d0d') + struct.pack('<i', 0x140002100 - address - len(raw) - 7)
        raw += bytes.fromhex('488b440108')
        raw += bytes.fromhex('488d0d') + struct.pack('<i', 0x140002000 - address - len(raw) - 7)
        raw += bytes.fromhex('48630c814801c9ffe1' if overwritten_base else '486304814801c8ffe0')
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        decoder.detail = True
        return static_producers.descriptor_domain(list(decoder.disasm(raw, address)), pe, capstone,
                                                  fixtures.classifier, fixtures.recovery)

    def test_bounded_immutable_descriptor_values_define_complete_potential_domain(self):
        table = self.descriptor_recovery()
        self.assertIsNotNone(table)
        self.assertEqual(table['producer_proof']['values'], [0, 1, 3])
        self.assertEqual((table['selector_minimum'], table['selector_maximum']), (0, 3))
        self.assertEqual(len(table['case_targets']), 4)

    def test_descriptor_recovery_rejects_mutability_upper_bits_and_index_changes(self):
        for kwargs in ({'writable': True}, {'narrow_guard': True}, {'mutation': bytes.fromhex('4881c200010000')},
                       {'mutation': bytes.fromhex('e800000000')}, {'narrow_multiply': True}, {'overwritten_base': True}):
            with self.subTest(kwargs=kwargs):
                self.assertIsNone(self.descriptor_recovery(**kwargs))

    def test_switch_source_seeds_retain_their_distinct_non_diagnostic_role(self):
        import capstone
        pe = fixtures.FakePe()
        pe.data[0:2] = bytes.fromhex('ffe0')
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        decoder.detail = True
        diagnostics = {'target': {}, 'function_entry_or_incoming_flow_edges_inferred': False,
                       'code_only_seeds': [{'site': '0x140001010', 'instruction_bytes': '488d0500000000'}]}
        result = static_producers.combined_code_leads(diagnostics, [{'site': '0x140001000'}], pe, decoder, capstone)
        self.assertEqual(result['counts_by_evidence_role'], {'independently-decoded-bounded-switch-source': 1, 'custom-diagnostic-reference': 1})
        self.assertFalse(result['function_entry_or_incoming_flow_edges_inferred'])
        self.assertNotIn('diagnostic_paths', result['code_only_seeds'][0])
        pe.data[0] = 0x90
        with self.assertRaisesRegex(ValueError, 'computed JMP'):
            static_producers.combined_code_leads(diagnostics, [{'site': '0x140001000'}], pe, decoder, capstone)

    def literal_role(self, *, kind='path_literal', length=5, overwrite=b''):
        import capstone
        pe = fixtures.FakePe()
        path = 'crates/wenilla-rogue/src/game/auras.rs'
        literal = b'spell' + path.replace('/', '\\').encode()
        pe.data[0x1000:0x1000 + len(literal)] = literal
        address = 0x140001000
        raw = bytes.fromhex('488d05') + struct.pack('<i', 0x140002000 - address - 7)
        raw += bytes.fromhex('4889856801000048c78570010000') + struct.pack('<i', length)
        raw += bytes.fromhex('48c7442420010000004c8d8d68010000') + overwrite
        raw += b'\xe8' + struct.pack('<i', 0x140001080 - address - len(raw) - 5)
        pe.data[:len(raw)] = raw
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        decoder.detail = True
        reference = {'site': hex(address), 'path': path, 'reference_kind': kind}
        return frontier.adjacent_literal_descriptor(reference, list(decoder.disasm(raw, address)), pe, capstone)

    def test_adjacent_label_role_preserves_raw_path_literal_without_inventing_owner(self):
        role = self.literal_role()
        self.assertEqual(role['literal']['text'], 'spell')
        self.assertTrue(role['raw_reference_preserved'])
        self.assertFalse(role['native_body_owner_or_source_location_inferred'])

    def test_literal_role_never_overrides_real_locations_or_mutated_descriptors(self):
        for kwargs in ({'kind': 'rust_location'}, {'length': 6},
                       {'overwrite': bytes.fromhex('4531c9')},
                       {'overwrite': bytes.fromhex('48878568010000')},
                       {'overwrite': bytes.fromhex('c644242101')},
                       {'overwrite': bytes.fromhex('4889442420')},
                       {'overwrite': bytes.fromhex('c744242001000000')},
                       {'overwrite': bytes.fromhex('4887442420')},
                       {'overwrite': bytes.fromhex('48ab')},
                       {'overwrite': bytes.fromhex('0f0b')}):
            with self.subTest(kwargs=kwargs):
                self.assertIsNone(self.literal_role(**kwargs))

    def test_identical_complete_domains_deduplicate_with_both_origins(self):
        table = {'site': '0x1000', 'table_address': '0x2000', 'relative_base': '0x2000',
                 'file_offset': '0x1000', 'byte_count': 8, 'sha256': 'a' * 64,
                 'selector_minimum': 0, 'selector_maximum': 1, 'case_targets': ['0x1010', '0x1020']}
        rows, rejected = native_merge.merge_tables([({'source': 'first'}, [table]), ({'source': 'second'}, [dict(table)])])
        self.assertFalse(rejected)
        self.assertEqual(len(rows), 1)
        self.assertEqual(len(rows[0]['proof_origins']), 2)
        self.assertNotIn('proof_origins', table)

    def test_conflicting_domains_are_rejected_instead_of_unioning_cases(self):
        table = {'site': '0x1000', 'table_address': '0x2000', 'relative_base': '0x2000',
                 'file_offset': '0x1000', 'byte_count': 8, 'sha256': 'a' * 64,
                 'selector_minimum': 0, 'selector_maximum': 1, 'case_targets': ['0x1010', '0x1020']}
        rows, rejected = native_merge.merge_tables([({}, [table]), ({}, [dict(table, case_targets=['0x1010', '0x1030'])])])
        self.assertFalse(rows)
        self.assertEqual(rejected[0]['reason'], 'conflicting-complete-input-domains')

    def test_new_code_proofs_reject_all_overlapping_roots_and_self_overlap(self):
        proof = lambda *rows: {'instructions': [{'site': hex(site), 'instruction_bytes': raw} for site, raw in rows]}
        first = proof((0x1000, '4889c1'), (0x1003, 'c3'))
        identical = proof((0x1000, '4889c1'))
        disjoint = proof((0x2000, 'c3'))
        self.assertEqual(native_merge.conflicting_code_proofs({1: first, 2: identical, 3: disjoint}), set())
        interior = proof((0x1001, '89c1'), (0x1003, 'c3'))
        self.assertEqual(native_merge.conflicting_code_proofs({1: first, 2: identical, 3: disjoint, 4: interior}), {1, 2, 4})
        self.assertEqual(native_merge.conflicting_code_proofs({1: proof((0x1000, '4889c1'), (0x1001, '89c1'))}), {1})

    def test_merge_rejects_stale_recorded_helpers_even_if_outer_generator_is_unchanged(self):
        inventory = {'generator_dependencies': [{'path': 'classifier.py', 'sha256': 'current'}],
                     'pe_parser_helpers': [{'path': 'pe.py', 'sha256': 'current'}]}
        native_merge.verify_recorded_dependencies(inventory, lambda path: 'current')
        for changed in ('classifier.py', 'pe.py'):
            with self.subTest(changed=changed), self.assertRaisesRegex(ValueError, 'dependency differs'):
                native_merge.verify_recorded_dependencies(inventory, lambda path: 'old' if path == changed else 'current')

    def test_merge_reconstructs_all_cases_and_counts_from_signed_table_bytes(self):
        import copy
        table, reason = fixtures.GuardedTables().recover()
        self.assertIsNone(reason)
        pe = fixtures.FakePe()
        native_merge.verify_table_encoding(table, pe)
        for field, value in (('case_targets', ['0x140001000'] + table['case_targets'][1:]),
                             ('byte_count', table['byte_count'] - 4),
                             ('selector_maximum', table['selector_maximum'] - 1),
                             ('relative_base', '0x140001000')):
            invalid = copy.deepcopy(table)
            invalid[field] = value
            with self.subTest(field=field), self.assertRaises(ValueError):
                native_merge.verify_table_encoding(invalid, pe)
        with self.assertRaisesRegex(ValueError, 'immutable'):
            native_merge.verify_table_encoding(table, fixtures.FakePe(writable=True))

    def test_linear_source_context_cannot_erase_or_cross_established_instructions(self):
        import capstone
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        context = list(decoder.disasm(bytes.fromhex('4889c1c3'), 0x1000))
        self.assertFalse(native_merge.context_conflicts(context, [0x1000, 0x1003], [3, 1]))
        self.assertFalse(native_merge.context_conflicts(context, [], []))
        for starts, lengths in (([0x1001], [2]), ([0xfff], [3]), ([0x1000], [2])):
            with self.subTest(starts=starts):
                self.assertTrue(native_merge.context_conflicts(context, starts, lengths))

    def test_a_rejected_whole_table_does_not_poison_independent_code_roots(self):
        valid = {'site': '0x1000', 'case_targets': ['0x2000']}
        proofs = {0x2000: {'instructions': [{'site': '0x2000', 'instruction_bytes': '4889c1'}]},
                  0x2001: {'instructions': [{'site': '0x2001', 'instruction_bytes': '89c1'}]}}
        self.assertEqual(native_merge.conflicting_code_proofs(proofs), {0x2000, 0x2001})
        required = native_merge.required_code_proofs([valid], proofs)
        self.assertEqual(set(required), {0x2000})
        self.assertFalse(native_merge.conflicting_code_proofs(required))

    def test_address_merge_preserves_roles_and_rejects_conflicting_graph_roots(self):
        existing = {'code_only_seeds': [{'site': '0x1000', 'instruction_bytes': 'c3',
                    'evidence_role': 'guarded-relative-case-target', 'evidence_roles': ['guarded-relative-case-target']}]}
        def candidate(site, raw):
            return {'site': site, 'instruction_bytes': raw, 'source_site': '0x3000',
                    'source_instruction_bytes': '488d0500000000', 'source_native_owner': None,
                    'code_validation': {'instructions': [{'site': site, 'instruction_bytes': raw}]}}
        candidates = [candidate('0x1000', 'c3'), candidate('0x2000', '4889c1'), candidate('0x2001', '89c1')]
        result = address_merge.add_address_rows(existing, candidates, {0x2000, 0x2001})
        self.assertEqual(result['distinct_code_only_starts'], 1)
        self.assertEqual(result['counts_by_evidence_role'], {'address-taken-code-target': 1, 'guarded-relative-case-target': 1})
        self.assertEqual(len(result['address_code_rejections']), 2)
        self.assertNotIn('address_source', existing['code_only_seeds'][0])
        self.assertEqual(result['code_only_seeds'][0]['address_source']['source_site'], '0x3000')
        self.assertEqual(result['code_only_seeds'][0]['address_source']['source_native_owner_observation_role'], 'original-operand-parent-only')
        self.assertNotIn('source_native_owner', result['code_only_seeds'][0]['address_source'])
        for candidate_rows, conflicts in ((candidates + [candidates[0]], set()), (candidates, {0x9999})):
            with self.assertRaisesRegex(ValueError, 'root sets'):
                address_merge.add_address_rows(existing, candidate_rows, conflicts)
        with self.assertRaisesRegex(ValueError, 'conflicting exact'):
            address_merge.add_address_rows(existing, [candidate('0x1000', '90')], set())
        with self.assertRaisesRegex(ValueError, 'overlap'):
            address_merge.add_address_rows({'code_only_seeds': []}, candidates[1:], set())

    def test_bounded_case_code_rejects_known_interiors_and_opaque_interrupts(self):
        import capstone
        helper = address_fixtures.helper
        for raw, reason in (('fa', 'privileged-or-far-transfer'), ('cd80', 'unsupported-interrupt'),
                            ('ea05000080bdfe', 'invalid-x64-instruction')):
            with self.subTest(raw=raw):
                pe = address_fixtures.PE(bytes.fromhex(raw))
                self.assertEqual(helper.code_proof(pe, 0x100, lambda a: None, lambda a: None, capstone)[1], reason)
        pe = address_fixtures.PE(bytes.fromhex('4889c1c3'))
        self.assertEqual(helper.code_proof(pe, 0x100, lambda a: 'exact' if a == 0x101 else None,
                                          lambda a: 1, capstone)[1], 'instruction-crosses-established-boundary')
        self.assertEqual(helper.code_proof(pe, 0x100, lambda a: 'interior', lambda a: None, capstone)[1],
                         'overlaps-established-instruction')

    def test_diagnostic_augmentation_preserves_source_and_case_roles(self):
        old = {'function_entry_or_incoming_flow_edges_inferred': False, 'code_only_seeds': [
            {'site': '0x1000', 'instruction_bytes': '488d00', 'evidence_role': 'guarded-relative-case-target',
             'evidence_roles': ['guarded-relative-case-target'], 'function_entry_inferred': False}]}
        fresh = {'function_entry_or_incoming_flow_edges_inferred': False, 'code_only_seeds': [
            {'site': '0x1000', 'instruction_bytes': '488d00', 'classification': 'undecoded-exact-diagnostic-lead', 'diagnostic_paths': ['engine']},
            {'site': '0x2000', 'instruction_bytes': '488d00', 'classification': 'undecoded-exact-diagnostic-lead', 'diagnostic_paths': ['custom']}]}
        result = augmentation.augment(old, fresh, {'custom'})
        self.assertEqual(result['counts_by_evidence_role'], {'custom-diagnostic-reference': 1, 'engine-diagnostic-reference': 1, 'guarded-relative-case-target': 1})
        self.assertEqual(result['code_only_seeds'][0]['evidence_role'], 'guarded-relative-case-target')
        self.assertNotIn('diagnostic_paths', old['code_only_seeds'][0])
        fresh['code_only_seeds'][0]['classification'] = 'conflicts-with-existing-instruction-interior'
        with self.assertRaisesRegex(ValueError, 'nonconflicting undecoded'):
            augmentation.augment(old, fresh, {'custom'})
        fresh['code_only_seeds'][0]['classification'] = 'undecoded-exact-diagnostic-lead'
        fresh['code_only_seeds'][0]['instruction_bytes'] = '90'
        with self.assertRaisesRegex(ValueError, 'conflicting exact'):
            augmentation.augment(old, fresh, {'custom'})

    def test_diagnostic_augmentation_rejects_instruction_interval_overlap(self):
        old = {'function_entry_or_incoming_flow_edges_inferred': False, 'code_only_seeds': [
            {'site': '0x1000', 'instruction_bytes': '488d0500000000', 'evidence_role': 'guarded-relative-case-target'}]}
        fresh = {'function_entry_or_incoming_flow_edges_inferred': False, 'code_only_seeds': [
            {'site': '0x1001', 'instruction_bytes': '8d0500000000', 'classification': 'undecoded-exact-diagnostic-lead', 'diagnostic_paths': ['engine']}]}
        with self.assertRaisesRegex(ValueError, 'intervals overlap'):
            augmentation.augment(old, fresh, set())
        fresh['code_only_seeds'][0]['site'] = '0xfff'
        fresh['code_only_seeds'][0]['instruction_bytes'] = '488d0500000000'
        with self.assertRaisesRegex(ValueError, 'intervals overlap'):
            augmentation.augment(old, fresh, set())


if __name__ == '__main__':
    unittest.main()
