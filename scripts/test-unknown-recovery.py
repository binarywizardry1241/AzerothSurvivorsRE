#!/usr/bin/env python3
"""Small inventory-selection regressions; no native scan, target or compiler runs."""
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('unknown_recovery',Path(__file__).with_name('summarize-unknown-recovery.py'))
queue=importlib.util.module_from_spec(spec)
spec.loader.exec_module(queue)


class CensusSelection(unittest.TestCase):
    def setUp(self):
        self.temp=tempfile.TemporaryDirectory(prefix='unknown-recovery-fixture-',dir=ROOT/'runtime')
        self.addCleanup(self.temp.cleanup)
        self.root=Path(self.temp.name)
        self.addCleanup(patch.stopall)
        patch.object(queue,'ROOT',self.root).start()
        patch.object(queue,'OUT',self.root/'proof.json').start()
        patch.object(queue,'DEFAULT_CENSUS',self.root/'default-census.json').start()
        self.full=self.root/'alternate-census';self.full.mkdir()
        self.target=dict(version='0.113.2',path='fixture.exe',sha256=queue.SHA,size_bytes=12)
        starts=self.full/'starts.tsv';starts.write_text('1000\n1010\n')
        profile=dict(starts_sha256=queue.sha(starts))
        self.plan=dict(target_sha256=queue.SHA,target_version='0.113.2',output=str(self.full),
                       starts=str(starts),starts_sha256=queue.sha(starts),seed_count=2,
                       seed_scope='declared',declared_start_count=2)
        self.progress=dict(target_sha256=queue.SHA,stage='completed',completed=2,total=2,
                           instructions=3,instruction_bytes=4,body_ranges=2)
        self.session=dict(result=dict(ok=True),parameters=profile,profileDigest='fixture-profile')
        self.summary=dict(target=self.target,whole_image_input=True,all_seeded_body_operations_complete=True,
            profile=profile,profile_digest='fixture-profile',counts=dict(instructions=3,instruction_bytes=4,body_ranges=2),
            independent_instructions=dict(performed=True,exact_source_bytes_verified=True,instruction_records=3,decoded_bytes=4),
            artifacts=dict(directory='alternate-census'),declared_starts=2,declared_starts_with_actual_bodies=2,
            seed_scope='declared',requested_seeds=2,requested_seeds_with_decoded_entries=2,global_native_semantics_complete=False,
            global_references_complete=False,native_source_ownership_complete=False)
        self.summary_path=self.root/'summary.json'
        self.save()

    def save(self):
        for name,payload in [('plan',self.plan),('progress',self.progress),('session-result',self.session)]:
            path=self.full/f'{name}.json';path.write_text(json.dumps(payload))
            key='session_result_sha256' if name=='session-result' else f'{name}_sha256'
            self.summary['artifacts'][key]=queue.sha(path)
        self.summary_path.write_text(json.dumps(self.summary))

    def test_selects_committed_directory_and_dynamic_counts(self):
        summary,full,plan,progress,expanded=queue.census_context(self.summary_path,self.target)
        self.assertEqual(full,self.full)
        self.assertEqual(summary['counts']['instructions'],3)
        self.assertEqual(expanded,{})
        linear=dict(unwind_extents=2,processed_extents=2,pending_extents=0,extents_with_undecoded_suffix=0)
        self.assertEqual(queue.completed_operations(summary,progress,linear,{'complete':7}),{
            'declared_starts':2,'decoded_declared_entries':2,'repaired_declared_bodies':2,
            'linear_processed_extents':2,'linear_pending_extents':0,'linear_undecoded_suffix_extents':0,
            'streaming_stage':'completed','selected_owner_queue':{'complete':7}})

    def test_default_follows_existing_proof_selection_and_explicit_override(self):
        queue.OUT.write_text(json.dumps({'inputs':{'full-image-census':{'path':'summary.json'}}}))
        self.assertEqual(queue.selected_census_path(),self.summary_path)
        self.assertEqual(queue.selected_census_path('explicit-summary.json'),self.root/'explicit-summary.json')

    def test_absent_proof_falls_back_to_canonical_census(self):
        self.assertFalse(queue.OUT.exists())
        self.assertEqual(queue.selected_census_path(),queue.DEFAULT_CENSUS)

    def test_proof_and_explicit_selection_cannot_escape_project(self):
        queue.OUT.write_text(json.dumps({'inputs':{'full-image-census':{'path':'../outside.json'}}}))
        with self.assertRaisesRegex(ValueError,'escapes project'):
            queue.selected_census_path()
        with self.assertRaisesRegex(ValueError,'escapes project'):
            queue.selected_census_path('../outside.json')

    def test_same_version_different_target_is_rejected(self):
        with self.assertRaisesRegex(ValueError,'another selected target'):
            queue.census_context(self.summary_path,{**self.target,'sha256':'b'*64})

    def test_incomplete_or_unverified_full_image_is_rejected(self):
        for key in ['whole_image_input','all_seeded_body_operations_complete']:
            with self.subTest(key=key):
                self.summary[key]=False;self.save()
                with self.assertRaisesRegex(ValueError,'complete full-image'):
                    queue.census_context(self.summary_path,self.target)
                self.summary[key]=True
        self.summary['independent_instructions']['exact_source_bytes_verified']=False;self.save()
        with self.assertRaisesRegex(ValueError,'independent instruction-byte'):
            queue.census_context(self.summary_path,self.target)

    def test_changed_plan_or_instruction_counts_are_rejected(self):
        (self.full/'plan.json').write_text('{}')
        with self.assertRaisesRegex(ValueError,'identity or completion'):
            queue.census_context(self.summary_path,self.target)
        self.progress['instructions']=4;self.save()
        with self.assertRaisesRegex(ValueError,'instructions count differs'):
            queue.census_context(self.summary_path,self.target)

    def test_missing_plan_or_input_commitment_is_rejected(self):
        self.summary['guarded_table_input']=dict(path='missing.json',sha256='f'*64);self.save()
        with self.assertRaisesRegex(ValueError,'absent from summary or plan'):
            queue.census_context(self.summary_path,self.target)
        self.plan['jump_tables']=self.summary['guarded_table_input'];self.save()
        with self.assertRaises(FileNotFoundError):
            queue.census_context(self.summary_path,self.target)

    def test_expanded_proof_inputs_are_available_without_semantic_closure(self):
        for key,plan_key in queue.EXPANDED_INPUTS.items():
            path=self.root/f'{key}.json';path.write_text(json.dumps(dict(target=self.target)))
            self.summary[key]=dict(path=path.name,sha256=queue.sha(path))
            self.plan[plan_key]=dict(path=str(path),sha256=queue.sha(path),producer='original-fixture-tool')
        self.save()
        summary,_,_,_,expanded=queue.census_context(self.summary_path,self.target)
        self.assertEqual(set(expanded),set(queue.EXPANDED_INPUTS))
        self.assertEqual(expanded['address_code_input']['plan_commitment']['producer'],'original-fixture-tool')
        missing,available=queue.exact_output_availability(summary,expanded)
        self.assertEqual([row['id'] for row in missing],['Q41-M03'])
        self.assertEqual([row['id'] for row in available],['Q41-M01','Q41-M02'])
        self.assertTrue(all(row['semantic_recovery']=='unverified' for row in available))
        path=self.root/'address_code_input.json';path.write_text('{}')
        with self.assertRaisesRegex(ValueError,'commitment differs'):
            queue.census_context(self.summary_path,self.target)

    def test_partial_expansion_keeps_missing_outputs_and_original_default_shape(self):
        missing,available=queue.exact_output_availability(self.summary,{})
        self.assertEqual([row['id'] for row in missing],['Q41-M01','Q41-M02','Q41-M03'])
        self.assertEqual(available,[])
        missing,available=queue.exact_output_availability(self.summary,{'guarded_table_input':{}})
        self.assertEqual([row['id'] for row in missing],['Q41-M02','Q41-M03'])
        self.assertEqual([row['id'] for row in available],['Q41-M01'])

    def test_unknown_declared_entry_completion_is_rejected(self):
        self.summary['requested_seeds']=3
        linear=dict(unwind_extents=2,processed_extents=2,pending_extents=0,extents_with_undecoded_suffix=0)
        with self.assertRaisesRegex(ValueError,'every census seed to decode'):
            queue.completed_operations(self.summary,self.progress,linear,{})

    def test_complement_only_pass_cannot_claim_declared_entry_completion(self):
        self.summary['seed_scope']='complement';self.plan['seed_scope']='complement';self.save()
        with self.assertRaisesRegex(ValueError,'complete declared-start scope'):
            queue.census_context(self.summary_path,self.target)

    def test_applied_guard_partition_preserves_all_jumps_and_site_exceptions(self):
        partition=queue.AppliedGuardPartition([{'site':site} for site in ['0x1000','0x2000','0x4000','0x1000']])
        rows=[(0x1000,'COMPUTED_JUMP'),(0x2000,'FALL_THROUGH'),(0x3000,'COMPUTED_JUMP'),(0x5000,'COMPUTED_CALL')]
        selected=[partition.observe(site,flow) for site,flow in rows]
        self.assertEqual(selected,[partition.with_guard,None,partition.without_guard,None])
        result=partition.finish(2)
        self.assertEqual(result['partition_records'],{partition.with_guard:1,partition.without_guard:1})
        self.assertEqual(result['guarded_table_records'],4)
        self.assertEqual(result['distinct_applied_table_sites'],3)
        self.assertEqual(result['expected_site_exceptions'],[
            {'site':'0x2000','observed_flows':['FALL_THROUGH'],'reason':'observed_with_other_flow'},
            {'site':'0x4000','observed_flows':[],'reason':'absent_from_instruction_inventory'}])
        with self.assertRaisesRegex(ValueError,'differs from computed-jump population'):
            partition.finish(3)


if __name__=='__main__':unittest.main()
