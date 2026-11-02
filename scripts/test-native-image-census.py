#!/usr/bin/env python3
"""Non-compiling bulk-census collector guards and interval ownership tests."""
import importlib.util
from pathlib import Path
import unittest
import hashlib
import gzip
import json
import tempfile
from types import SimpleNamespace
ROOT=Path(__file__).resolve().parents[1]
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path)
    result=importlib.util.module_from_spec(spec);spec.loader.exec_module(result);return result
summary=module('bulk_census_summary','scripts/summarize-native-image.py')
repair=module('bulk_census_repair','scripts/repair-rea-native-census.py')
selection=module('bulk_census_selection','scripts/census-native-image.py')
class BulkCensus(unittest.TestCase):
    def test_new_census_accepts_missing_or_precreated_empty_output(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime',prefix='census-output-fixture-') as name:
            for path in (Path(name)/'missing',Path(name)/'precreated'):
                if path.name=='precreated':path.mkdir()
                self.assertIsNone(selection.prepare_census_output(path))
                self.assertTrue(path.is_dir())
                self.assertEqual(list(path.iterdir()),[])
    def test_resume_requires_saved_plan_without_creating_output(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime',prefix='census-output-fixture-') as name:
            missing=Path(name)/'missing';empty=Path(name)/'empty';empty.mkdir()
            for path in (missing,empty):
                with self.assertRaisesRegex(ValueError,'Resume requires an existing census plan'):
                    selection.prepare_census_output(path,resume=True)
            self.assertFalse(missing.exists());self.assertEqual(list(empty.iterdir()),[])
    def test_unrecognized_nonempty_output_is_preserved(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime',prefix='census-output-fixture-') as name:
            directory=Path(name);marker=directory/'progress.json';marker.write_text('{"pending":true}')
            for resume in (False,True):
                with self.assertRaises(ValueError):selection.prepare_census_output(directory,resume=resume)
                self.assertEqual(marker.read_text(),'{"pending":true}')
                self.assertEqual(list(directory.iterdir()),[marker])
    def test_existing_plan_selects_resume_path_for_run_and_resume(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime',prefix='census-output-fixture-') as name:
            directory=Path(name);plan=directory/'plan.json';plan.write_text('{}')
            for resume in (False,True):self.assertEqual(selection.prepare_census_output(directory,resume=resume),plan)
            self.assertEqual(plan.read_text(),'{}')
    def test_non_directory_output_is_preserved(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime',prefix='census-output-fixture-') as name:
            path=Path(name)/'output';path.write_text('retained')
            with self.assertRaisesRegex(ValueError,'not a directory'):selection.prepare_census_output(path)
            self.assertEqual(path.read_text(),'retained')
    def test_expanded_verifier_uses_exact_isolated_primary_summary(self):
        with tempfile.TemporaryDirectory(dir=ROOT/'runtime',prefix='primary-census-fixture-') as name:
            directory=Path(name);body=directory/'bodies.tsv.gz'
            body.write_bytes(gzip.compress(b'entry\tstart\tend\texternal\n100\t100\t10f\tfalse\n',mtime=0))
            report={'target':{'sha256':'a'*64},'independent_instructions':{'exact_source_bytes_verified':True},'artifacts':{'directory':directory.relative_to(ROOT).as_posix(),'files':{'bodies.tsv.gz':{'sha256':hashlib.sha256(body.read_bytes()).hexdigest()}}}}
            primary=directory/'primary.json';primary.write_text(json.dumps(report));reference=primary.relative_to(ROOT).as_posix()
            pe=SimpleNamespace(image_base=0,sections=[{'rva':0,'virtual_size':0x1000,'characteristics':'0x20000000'}])
            helper=SimpleNamespace(relocations=lambda value:([(0,10,0x130)],{}))
            target={'sha256':'a'*64}
            _,commitment=selection.pointer_leaf_starts(target,pe,helper,primary_summary=reference)
            plan={'seed_scope':'all','pointer_selection':commitment}
            self.assertEqual(summary.verify_pointer_seeds(plan,target,pe,helper,selection,{0x100,0x105,0x120},{0x100}),{0x100,0x120,0x130})
            primary.write_text('{}')
            with self.assertRaises((ValueError,KeyError)):
                summary.verify_pointer_seeds(plan,target,pe,helper,selection,{0x100},{0x100})
    def test_input_snapshot_rejects_changed_proof_before_seed_selection(self):
        writes=[];destination=SimpleNamespace(write_bytes=writes.append)
        source=SimpleNamespace(read_bytes=lambda:b'changed proof')
        with self.assertRaisesRegex(ValueError,'changed before immutable snapshot'):
            selection.snapshot_input(source,destination,hashlib.sha256(b'original proof').hexdigest())
        self.assertEqual(writes,[])
        expected=hashlib.sha256(b'changed proof').hexdigest()
        self.assertIs(selection.snapshot_input(source,destination,expected),destination);self.assertEqual(writes,[b'changed proof'])
    def test_body_ranges_are_inclusive_and_gaps_never_acquire_unwind_owners(self):
        owner=summary.owner_lookup([(0x100,0x10f,0x100),(0x120,0x12f,0x100),(0x150,0x151,0x150)])
        for site,expected in [(None,None),(0xff,None),(0x100,0x100),(0x10f,0x100),(0x110,None),(0x120,0x100),(0x12f,0x100),(0x150,0x150),(0x151,0x150),(0x152,None)]:
            self.assertEqual(owner(site),expected)
    def test_ambiguous_overlaps_rejected(self):
        with self.assertRaisesRegex(ValueError,'overlap'):summary.owner_lookup([(1,4,1),(4,6,4)])
    def test_observed_instruction_unions_preserve_all_missing_declared_bytes(self):
        declared=summary.merge_ranges([(10,20),(18,30),(40,50)])
        self.assertEqual(declared,[(10,30),(40,50)])
        self.assertEqual(summary.subtract_ranges(declared,[(1,12),(14,18),(25,45),(49,99)]),[(12,14),(18,25),(45,49)])
        self.assertEqual(summary.subtract_ranges(declared,[]),declared)
        self.assertEqual(summary.subtract_ranges(declared,[(0,99)]),[])
    def test_external_addresses_never_coerce_to_native(self):
        self.assertEqual(summary.address('140001000'),0x140001000)
        for value in ('','EXTERNAL:00000001','ram:0010'):self.assertIsNone(summary.address(value))
    def test_whole_executable_unknown_partition_preserves_declared_and_complement_gaps(self):
        inside,outside=summary.executable_missing_partitions([(10,50)],[(20,30),(35,45)],[(10,15),(25,40)])
        self.assertEqual(inside,[(20,25),(40,45)]);self.assertEqual(outside,[(15,20),(45,50)])
        self.assertEqual(sum(end-start for start,end in inside+outside),20)
    def test_pinned_launcher_repair_is_present_and_inert_without_explicit_plan(self):
        path,source,changed,upstream=repair.changes()
        self.assertFalse(changed)
        self.assertEqual(source.count('process.env.REA_NATIVE_CENSUS_PLAN ?'),3)
        self.assertIn('process.env.REA_DURABLE_QUERY_ROOT && !process.env.REA_NATIVE_CENSUS_PLAN',source)
        self.assertEqual(source.count('"-noanalysis"'),1)
        self.assertEqual(upstream,'739676ebc64bd7b23ed1bc4a9395d596efe7bf8080eb67af1ff3e00d86609a67')
if __name__=='__main__':unittest.main()
