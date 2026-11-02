#!/usr/bin/env python3
"""Non-compiling hash/target/admission regressions for atomic native accounting."""
import hashlib
import importlib.util
import json
from pathlib import Path
import tempfile
import struct
import unittest
from unittest.mock import patch
from types import SimpleNamespace
from coverage_common import finding_reference, finding_register
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('full_native_checker',ROOT/'scripts/check-full-image-native.py');checker=importlib.util.module_from_spec(spec);spec.loader.exec_module(checker)
spec=importlib.util.spec_from_file_location('coverage_checker',ROOT/'scripts/check-reconstruction-coverage.py');coverage=importlib.util.module_from_spec(spec);spec.loader.exec_module(coverage)
class Findings:
    def __init__(self):self.errors=[];self.warnings=[]
    def require(self,value,category,detail):
        if not value:self.errors.append((category,detail))
    def warn(self,category,detail):self.warnings.append((category,detail))
class Accounting(unittest.TestCase):
    def setUp(self):
        scratch=ROOT/'runtime/coverage-tests';scratch.mkdir(parents=True,exist_ok=True)
        self.folder=tempfile.TemporaryDirectory(dir=scratch);self.root=Path(self.folder.name);self.findings=Findings()
    def tearDown(self):self.folder.cleanup()
    def test_disposable_absence_warns_but_missing_durable_evidence_fails(self):
        checker.bound_path('runtime/absent.json','a'*64,self.findings,self.root)
        self.assertFalse(self.findings.errors);self.assertEqual(len(self.findings.warnings),1)
        checker.bound_path('docs/missing.json','a'*64,self.findings,self.root)
        self.assertTrue(self.findings.errors)
    def test_changed_committed_bytes_fail(self):
        path=self.root/'evidence.json';path.write_bytes(b'old')
        digest=hashlib.sha256(b'old').hexdigest();checker.bound_path('evidence.json',digest,self.findings,self.root)
        self.assertFalse(self.findings.errors);path.write_bytes(b'new')
        checker.bound_path('evidence.json',digest,self.findings,self.root);self.assertTrue(self.findings.errors)
    def test_generator_changes_fail_but_candidate_source_changes_warn(self):
        path=self.root/'tool.py';path.write_bytes(b'new');old=hashlib.sha256(b'old').hexdigest()
        checker.references({'generator':{'path':'tool.py','sha256':old}},self.findings,self.root,'current derivative')
        self.assertTrue(self.findings.errors);self.findings=Findings()
        checker.review_source_candidates([{'source_candidate':{'path':'tool.py','sha256':old}}],self.findings,self.root)
        self.assertFalse(self.findings.errors);self.assertEqual(self.findings.warnings[0][0],'stale_source_review')
    def test_escape_and_invalid_digest_are_rejected(self):
        checker.bound_path('../escape','bad',self.findings,self.root)
        self.assertEqual({row[0] for row in self.findings.errors},{'full_native_boundary','full_native_commitment'})
    def test_target_is_exact_including_same_version_hash_successors(self):
        target={'version':'0.109.0','path':'installed-game/game.exe','sha256':'a'*64,'size_bytes':123}
        checker.identity({'target':{**target,'sha256':'b'*64}},target,self.findings,'selected')
        self.assertTrue(self.findings.errors)
    def test_pending_source_assignment_keeps_candidates_out_of_source_correspondence(self):
        original='crates/wenilla-rogue-app/src/screens/ime.rs'
        data=original.encode();target={'version':'fixture','path':'fixture.exe','sha256':hashlib.sha256(data).hexdigest()}
        (self.root/'candidate.rs').write_text('candidate engine interface')
        (self.root/'evidence.json').write_text('{}')
        row={'id':'ime','original_path':original,'native_path_evidence':[{
            'file_offset':'0x0','byte_count':len(data),'sha256':hashlib.sha256(data).hexdigest()}],
            'source_refs':[],'candidate_source_refs':['candidate.rs'],
            'source_correspondence_status':'pending_native_source_assignment',
            'evidence_refs':['evidence.json'],'gap_ids':[1],
            'remaining_source_work':['Assign current native bodies to the candidate AS interface.']}
        for dimension in coverage.DIMENSIONS:row[dimension]={'status':'partial','summary':'No whole-system proof.'}
        ledger={'target':target,'systems':[row]}
        coverage.validate_systems(ledger,target,data,{1},self.findings,self.root)
        self.assertFalse(self.findings.errors)
        self.assertEqual(row['source_refs'],[])
        self.assertEqual(row['implementation']['status'],'partial')
        for change in ({'source_correspondence_status':'unreviewed'},
                       {'candidate_source_refs':[]},
                       {'candidate_source_refs':['missing.rs']},
                       {'candidate_source_refs':['../escape.rs']},
                       {'remaining_source_work':[]}):
            with self.subTest(change=change):
                invalid={**row,**change};findings=Findings()
                coverage.validate_systems({'target':target,'systems':[invalid]},target,data,{1},findings,self.root)
                self.assertTrue(any(category=='references' for category,_ in findings.errors))
    def test_unpublished_selector_warns_and_required_missing_selector_fails(self):
        checker.validate({},self.findings,self.root);self.assertFalse(self.findings.errors);self.assertTrue(self.findings.warnings)
        checker.validate({},self.findings,self.root,required=True);self.assertTrue(self.findings.errors)
    def test_operand_union_rejects_cross_census_and_changed_inventory(self):
        target={'version':'0.109.0','path':'installed-game/game.exe','sha256':'a'*64,'size_bytes':123}
        inventory=self.root/'operands.jsonl';inventory.write_bytes(b'current')
        inv={'path':'operands.jsonl','sha256':hashlib.sha256(b'current').hexdigest()}
        census=self.root/'selected.json';census.write_bytes(b'census');digest=hashlib.sha256(census.read_bytes()).hexdigest()
        tool=self.root/'scripts/audit-native-operands.py';tool.parent.mkdir();tool.write_bytes(b'audit')
        generator={'path':'scripts/audit-native-operands.py','sha256':hashlib.sha256(tool.read_bytes()).hexdigest()}
        audit={'target':target,'generator':generator,'generator_dependencies':[generator],
            'source_census':{'path':'selected.json','sha256':digest},'inventory':inv}
        path=self.root/'audit.json';path.write_text(json.dumps(audit));binding={'audit':{'path':'audit.json','sha256':hashlib.sha256(path.read_bytes()).hexdigest()},'inventory':inv}
        selected={'path':'selected.json','sha256':digest}
        checker.review_operand_union(binding,selected,target,self.findings,self.root)
        self.assertFalse(self.findings.errors)
        checker.review_operand_union(binding,{**selected,'sha256':'c'*64},target,self.findings,self.root)
        self.assertTrue(any(category=='full_native_operand_union' for category,_ in self.findings.errors))
        self.findings=Findings();inventory.write_bytes(b'changed')
        checker.review_operand_union(binding,selected,target,self.findings,self.root)
        self.assertTrue(any(category=='full_native_integrity' for category,_ in self.findings.errors))
    def test_operand_union_is_required_for_current_classification(self):
        checker.review_operand_union(None,{}, {},self.findings,self.root)
        self.assertEqual(self.findings.errors[0][0],'full_native_operand_union')
    def test_supporting_profile_keeps_its_old_generator_commitment(self):
        target={'version':'0.109.0','path':'installed-game/game.exe','sha256':'a'*64,'size_bytes':123}
        record={'target':target,'generator':{'path':'scripts/old-tool.py','sha256':'f'*64},'profile':{'script_sha256':'b'*64},
            'artifacts':{'directory':'runtime/old-profile','files':{}},'independent_instructions':{'exact_source_bytes_verified':True},'counts':{}}
        checker.census_artifacts(record,target,self.findings,self.root,current=False)
        self.assertFalse(self.findings.errors)
    def selected_profile_fixture(self,wrong_selected=False):
        target={'version':'current','path':'installed-game/game.exe','sha256':'a'*64,'size_bytes':123}
        coverage=self.root/'docs/analysis/coverage';coverage.mkdir(parents=True)
        old_target={**target,'version':'historical','sha256':'b'*64}
        current=coverage/'full-image-current.json';current.write_text(json.dumps({'target':old_target if wrong_selected else target,'artifacts':{},'counts':{}}))
        historical=coverage/'full-image-old.json';historical.write_text(json.dumps({'target':old_target,'artifacts':{},'counts':{}}))
        same=coverage/'full-image-supporting.json';same.write_text(json.dumps({'target':target,'artifacts':{},'counts':{}}))
        selection={'target':target,'records':{key:{'path':value,'sha256':'f'*64} for key,value in
                   (('census',current.relative_to(self.root).as_posix()),('classification','runtime/absent-classification'),
                    ('jump_tables','runtime/absent-jump'),('historical_ranges','runtime/absent-ranges'))}}
        return target,selection
    def test_unselected_other_hash_profiles_are_retained_without_current_validation(self):
        target,selection=self.selected_profile_fixture()
        def audit(record,target,findings,*args):
            checker.identity(record,target,findings,'profile');return {}
        with patch.object(checker,'references'),patch.object(checker,'census_artifacts',side_effect=audit) as audit_mock:
            result=checker.validate(target,self.findings,self.root,selection)
        self.assertFalse(self.findings.errors)
        self.assertEqual(audit_mock.call_count,2) # Selected plus same-hash supporting profile.
        self.assertEqual(len(result['historical_profiles_unapplied']),1)
        self.assertEqual(self.findings.warnings[0][0],'historical_native_profile_unapplied')
    def test_selected_wrong_target_is_never_skipped_as_historical(self):
        target,selection=self.selected_profile_fixture(wrong_selected=True)
        def audit(record,target,findings,*args):
            checker.identity(record,target,findings,'profile');return {}
        with patch.object(checker,'references'),patch.object(checker,'census_artifacts',side_effect=audit) as audit_mock:
            result=checker.validate(target,self.findings,self.root,selection)
        self.assertEqual(audit_mock.call_count,2)
        self.assertEqual(len(result['historical_profiles_unapplied']),1)
        self.assertTrue(any(category=='full_native_target' for category,_ in self.findings.errors))

    def test_current_guarded_admission_reconstructs_cases_even_with_genuine_hash_and_valid_targets(self):
        data=bytearray(0x200);raw=struct.pack('<ii',0x20,0x30);data[0x100:0x108]=raw
        for site in (0x1a0,0x1b0,0x1c0):data[site]=0xc3
        pe=SimpleNamespace(data=bytes(data),image_base=0,sections=[{'rva':0x100,'virtual_size':0x100,'raw_size':0x100,'characteristics':'0x60000020'}],rva_offset=lambda rva:rva)
        target={'version':'fixture','path':'fixture.exe','size_bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()}
        table={'site':'0x180','selector_minimum':0,'selector_maximum':1,'byte_count':8,'case_targets':['0x1a0','0x1b0'],
               'table_address':'0x100','relative_base':'0x180','file_offset':'0x100','sha256':hashlib.sha256(raw).hexdigest()}
        payload={'target':target,'tables':[table]}
        checker.review_guarded_table_encoding(payload,target,self.findings,pe=pe)
        self.assertFalse(self.findings.errors)
        # 0x1c0 is another exact RET start, while table/hash/byte count stay real.
        table['case_targets'][1]='0x1c0'
        checker.review_guarded_table_encoding(payload,target,self.findings,pe=pe)
        self.assertTrue(any(category=='full_native_guarded_encoding' for category,_ in self.findings.errors))
    def execution_witness(self,selected,old=b'old'):
        name='scripts/proof.py';digest=hashlib.sha256(old).hexdigest()
        path=self.root/'witness.json';path.write_text(json.dumps({'census':selected,'tools':[{'path':name,'sha256':digest,'git_commit':'a'*40}]}))
        return {'path':'witness.json','sha256':hashlib.sha256(path.read_bytes()).hexdigest()},name,digest
    def test_exact_committed_execution_tool_only_relaxes_execution_references(self):
        selected={'path':'selected.json','sha256':'b'*64};binding,name,digest=self.execution_witness(selected)
        path=self.root/name;path.parent.mkdir();path.write_bytes(b'new')
        with patch.object(checker.subprocess,'run',return_value=SimpleNamespace(returncode=0,stdout=b'old')) as git:
            accepted=checker.executed_tool_sources(binding,selected,self.findings,self.root)
            self.assertEqual(git.call_args.args[0],['git','cat-file','blob','a'*40+':'+name])
        checker.references({'path':name,'sha256':digest},self.findings,self.root,'executed',accepted)
        self.assertFalse(self.findings.errors)
        checker.references({'path':name,'sha256':digest},self.findings,self.root,'current derivative')
        self.assertTrue(any(k=='full_native_integrity' for k,_ in self.findings.errors))
    def test_execution_witness_rejects_another_census_and_changed_git_bytes(self):
        selected={'path':'selected.json','sha256':'b'*64};binding,_,_=self.execution_witness(selected)
        with patch.object(checker.subprocess,'run') as git:
            self.assertFalse(checker.executed_tool_sources(binding,{**selected,'sha256':'c'*64},self.findings,self.root));git.assert_not_called()
        self.findings=Findings()
        with patch.object(checker.subprocess,'run',return_value=SimpleNamespace(returncode=0,stdout=b'changed')):
            self.assertFalse(checker.executed_tool_sources(binding,selected,self.findings,self.root))
        self.assertTrue(any(k=='full_native_execution_source' for k,_ in self.findings.errors))
    def test_execution_witness_rejects_paths_outside_scripts(self):
        selected={'path':'selected.json','sha256':'b'*64};binding,_,_=self.execution_witness(selected)
        path=self.root/'witness.json';record=json.loads(path.read_text());record['tools'][0]['path']='../outside';path.write_text(json.dumps(record));binding['sha256']=hashlib.sha256(path.read_bytes()).hexdigest()
        with patch.object(checker.subprocess,'run') as git:
            self.assertFalse(checker.executed_tool_sources(binding,selected,self.findings,self.root));git.assert_not_called()
        self.assertTrue(self.findings.errors)
class FindingRegisters(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory(prefix='finding-register-', dir=ROOT / 'runtime')
        self.addCleanup(self.folder.cleanup)
        self.root = Path(self.folder.name)
        (self.root / 'docs').mkdir()

    def write(self, source, verification):
        (self.root / 'docs/CURRENT-STATE.md').write_text(source)
        (self.root / 'docs/verification-needed.md').write_text(verification)

    def row(self, number, link=''):
        return f'| #{number} | Open | <a id="gap-{number}"></a>Finding {number}. {link} |\n'

    def test_moved_ids_keep_machine_ownership_and_the_global_numbering_frontier(self):
        self.write(self.row(3), self.row(99))
        records = finding_register(self.root)
        self.assertEqual(set(records), {3, 99})
        self.assertEqual(max(records) + 1, 100)
        self.assertEqual(finding_reference(99, self.root), 'docs/verification-needed.md#gap-99')
        self.assertEqual(finding_reference(3, self.root), 'docs/CURRENT-STATE.md#gap-3')

    def test_mixed_issue_keeps_separate_reciprocally_linked_owners(self):
        self.write(self.row(7, '[Verification](verification-needed.md#gap-7)'),
                   self.row(7, '[Source](CURRENT-STATE.md#gap-7)'))
        self.assertEqual(set(finding_register(self.root)[7]), {'source', 'verification'})
        self.assertEqual(finding_reference(7, self.root), 'docs/CURRENT-STATE.md#gap-7')
        self.assertEqual(finding_reference(7, self.root, verification=True), 'docs/verification-needed.md#gap-7')

    def test_accidental_cross_register_duplicates_are_rejected(self):
        self.write(self.row(7), self.row(7))
        with self.assertRaisesRegex(ValueError, 'reciprocal ownership'):
            finding_register(self.root)

    def test_duplicate_or_invalid_ids_cannot_be_hidden_inside_one_document(self):
        for rows in (self.row(7) * 2, self.row(0), self.row(-1)):
            self.write(rows, '')
            with self.assertRaisesRegex(ValueError, 'invalid or duplicate'):
                finding_register(self.root)

    def test_missing_document_and_missing_anchor_fail_instead_of_dropping_ownership(self):
        self.write(self.row(7), self.row(8))
        (self.root / 'docs/verification-needed.md').unlink()
        with self.assertRaises(FileNotFoundError):
            finding_register(self.root)
        self.write('| #7 | Open | No stable anchor |\n', '')
        with self.assertRaisesRegex(ValueError, 'no stable anchor'):
            finding_register(self.root)

    def test_unknown_ids_do_not_silently_link_to_the_source_register(self):
        self.write(self.row(7), '')
        with self.assertRaisesRegex(ValueError, 'Unknown permanent finding'):
            finding_reference(8, self.root)

    def test_frozen_source_register_reference_resolves_a_moved_verification_owner(self):
        self.write(self.row(3), self.row(99))
        spec = importlib.util.spec_from_file_location('finding_accounting', ROOT / 'scripts/check-reconstruction-coverage.py')
        accounting = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(accounting)
        self.assertEqual(accounting.reference_path('docs/CURRENT-STATE.md#gap-99', self.root),
                         self.root / 'docs/verification-needed.md')
        self.assertEqual(accounting.reference_path('docs/CURRENT-STATE.md#gap-3', self.root),
                         self.root / 'docs/CURRENT-STATE.md')


if __name__=='__main__':unittest.main()
