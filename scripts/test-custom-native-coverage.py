#!/usr/bin/env python3
"""Noncompiling custom-only code/source partition regressions."""
import importlib.util
import hashlib
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('custom_coverage',ROOT/'scripts/summarize-custom-native-coverage.py');helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
def fixture():
    custom={'path':'game.rs','custom_game_crate':True,'verified_references':[{'instruction_address':'0x100','instruction_bytes':'90','kind':'rust_location'},{'instruction_address':'0x101','instruction_bytes':'c3','kind':'rust_location'}]}
    candidate={'reconstruction_system':'game','path_evidence_role':'native-location-record-bound','reconstruction_source_refs':['source.rs'],'expanded_native_reference_owners':1}
    return [custom,{'path':'engine.rs','custom_game_crate':False}],{'game.rs':candidate}
class CustomCoverage(unittest.TestCase):
    def test_current_alias_hash_names_the_resolved_file_and_original_reference(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime') as directory:
            current=Path(directory)/'current.py';current.write_text('current source\n')
            former=(Path(directory)/'former.py').relative_to(ROOT).as_posix()
            with patch.object(helper,'current_path',return_value=current):
                candidate=helper.current_source_candidate(former)
                self.assertEqual(candidate['source_file'],current.relative_to(ROOT).as_posix())
                self.assertEqual(candidate['source_reference'],former)
                self.assertEqual(candidate['candidate_sha256'],hashlib.sha256(current.read_bytes()).hexdigest())
                self.assertIn('not historical execution',candidate['resolution_role'])
                current.write_text('changed current source\n')
                self.assertNotEqual(helper.current_source_candidate(former)['candidate_sha256'],candidate['candidate_sha256'])
    def test_unmoved_missing_and_escaping_source_candidates_keep_their_boundaries(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime') as directory:
            current=Path(directory)/'current.py';current.write_text('source\n')
            reference=current.relative_to(ROOT).as_posix()
            candidate=helper.current_source_candidate(reference)
            self.assertEqual(candidate['source_file'],reference)
            self.assertNotIn('source_reference',candidate)
            with self.assertRaisesRegex(ValueError,'Cannot hash input'):
                helper.current_source_candidate(str(current.with_name('absent.py')))
            with patch.object(helper,'current_path',return_value=ROOT.parent/'outside.py'):
                with self.assertRaisesRegex(ValueError,'escapes|outside'):
                    helper.current_source_candidate(reference)
    def test_current_census_join_keeps_reviewed_source_as_a_candidate(self):
        diagnostics,_=fixture()
        systems={'systems':[{'id':'custom-game','original_path':'game.rs','source_refs':['source.rs']}]}
        candidates=helper.reviewed_source_candidates(systems,diagnostics,lambda site:0x100 if site==0x100 else None)
        self.assertEqual(candidates['game.rs']['expanded_native_reference_owners'],1)
        self.assertIn('not-native-semantics',candidates['game.rs']['path_evidence_role'])
        paths,sites,counts=helper.reference_join(diagnostics,{0x100:'90',0x101:'c3'},lambda site:None,candidates)
        self.assertEqual(counts['custom_paths_with_source_correspondence'],1)
        self.assertEqual(counts['reference_records_without_body_owner'],2)
        self.assertFalse(paths[0]['native_source_semantics_established'])
        with self.assertRaisesRegex(ValueError,'correspondence is absent'):
            helper.reviewed_source_candidates({'systems':[]},diagnostics,lambda site:None)
    def test_engine_paths_do_not_expand_the_custom_reconstruction_scope(self):
        diagnostics,candidates=fixture();paths,sites,counts=helper.reference_join(diagnostics,{0x100:'90',0x101:'c3'},lambda site:0x100,candidates)
        self.assertEqual(counts['custom_paths'],1);self.assertEqual(counts['custom_paths_with_source_correspondence'],1);self.assertEqual(counts['distinct_actual_native_owners'],1)
        self.assertFalse(paths[0]['native_source_semantics_established'])
    def test_decoded_ownerless_and_undecoded_sites_are_independent(self):
        diagnostics,candidates=fixture();_,sites,counts=helper.reference_join(diagnostics,{0x100:'90'},lambda site:None,candidates)
        self.assertEqual(counts['exact_decoded_instruction_sites'],1);self.assertEqual(counts['reference_records_without_body_owner'],2);self.assertEqual(counts['custom_paths_with_all_reference_sites_decoded'],0)
        self.assertTrue(sites[0]['exact_decoded_instruction']);self.assertIsNone(sites[0]['actual_native_owner'])
    def test_wrong_code_bytes_fail_instead_of_promoting_path_membership(self):
        diagnostics,candidates=fixture()
        with self.assertRaisesRegex(ValueError,'bytes differ'):helper.reference_join(diagnostics,{0x100:'cc'},lambda site:None,candidates)
    def test_review_projection_ignores_ledger_metadata_without_hash_cycle(self):
        row={'original_path':'game.rs','source_refs':['source.rs'],'source_review_anchors':[{'path':'source.rs','symbol':'game'}],'evidence_refs':['old.json']}
        systems={'systems':[row],'counts':{'mapped':1}}
        first=helper.semantic_projection(systems,{'game.rs'},lambda name:'a'*64)
        row['evidence_refs']=['new-partition.json'];systems['counts']['mapped']=2
        self.assertEqual(first,helper.semantic_projection(systems,{'game.rs'},lambda name:'a'*64))
        self.assertNotEqual(first,helper.semantic_projection(systems,{'game.rs'},lambda name:'b'*64))
    def test_literal_address_is_not_a_location_or_body_ownership_claim(self):
        diagnostics,candidates=fixture();diagnostics[0]['verified_references'][0]['kind']='path_literal'
        _,sites,counts=helper.reference_join(diagnostics,{0x100:'90',0x101:'c3'},lambda site:0x100 if site==0x100 else None,candidates,{(0x100,'game.rs')})
        self.assertEqual(counts['reference_records'],2);self.assertEqual(counts['path_literal_candidate_reference_records'],1)
        self.assertEqual(counts['native_location_reference_records'],1);self.assertEqual(counts['native_location_records_without_body_owner'],1)
        self.assertEqual(counts['custom_paths_with_native_location_body_owners'],0);self.assertEqual(counts['distinct_native_location_body_owners'],0)
        self.assertEqual(sites[0]['diagnostic_site_role'],'proved-adjacent-literal-reference')
    def test_exclusion_cannot_hide_location_or_unknown_custom_site(self):
        diagnostics,candidates=fixture()
        with self.assertRaisesRegex(ValueError,'cannot remove a native Location'):helper.reference_join(diagnostics,{0x100:'90'},lambda site:None,candidates,{(0x100,'game.rs')})
        with self.assertRaisesRegex(ValueError,'not an exact custom reference'):helper.reference_join(diagnostics,{0x100:'90'},lambda site:None,candidates,{(0x900,'game.rs')})
    def test_unknown_reference_kind_is_not_silently_a_literal(self):
        diagnostics,candidates=fixture();diagnostics[0]['verified_references'][0]['kind']='unknown'
        with self.assertRaisesRegex(ValueError,'Unsupported custom reference kind'):helper.reference_join(diagnostics,{0x100:'90'},lambda site:None,candidates)
if __name__=='__main__':unittest.main()
