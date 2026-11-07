#!/usr/bin/env python3
"""Non-compiling exact-slot and conservative register-value regressions."""
import importlib.util
from pathlib import Path
import struct
import os
import tempfile
import unittest
from unittest.mock import patch
import capstone
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('native_classifier',ROOT/'scripts/classify-native-ownership.py')
classifier=importlib.util.module_from_spec(spec);spec.loader.exec_module(classifier)
class NativeValues(unittest.TestCase):
    def setUp(self):
        self.decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);self.decoder.detail=True
    def state(self,raw,reader=lambda slot:None):
        return classifier.local_values(list(self.decoder.disasm(raw,0x140001000)),reader,capstone)
    def test_literal_code_address_and_register_copy(self):
        state=self.state(bytes.fromhex('488d05200000004889c1'))
        self.assertEqual(state['rax'],('value',0x140001027));self.assertEqual(state['rcx'],state['rax'])
    def test_declared_import_pointer_survives_full_width_copy(self):
        value=('import','kernel32.dll','ExitProcess',0x140001027)
        state=self.state(bytes.fromhex('488b05200000004889c1'),lambda slot:value if slot==0x140001027 else None)
        self.assertEqual(state['rcx'],value)
    def test_unknown_memory_and_partial_register_write_invalidate_values(self):
        for suffix in ('6689c8','488b0424'):
            state=self.state(bytes.fromhex('488d0520000000'+suffix))
            self.assertNotIn('rax',state)
    def test_same_register_zeroing_establishes_a_full_width_zero(self):
        for raw in ('31c0','4829c0'):
            self.assertEqual(self.state(bytes.fromhex(raw))['rax'],('value',0))
        self.assertNotIn('rax',self.state(bytes.fromhex('6631c0')))
    def test_known_scaled_index_and_address_width_are_applied_exactly(self):
        base=0x140005000;value=('value',0x140006000)
        raw=bytes.fromhex('48b8')+struct.pack('<Q',base)+bytes.fromhex('b902000000488b54c810')
        self.assertEqual(self.state(raw,lambda slot:value if slot==base+32 else None)['rdx'],value)
        instruction=next(self.decoder.disasm(bytes.fromhex('67488b44c810'),0x140001000))
        state={'rax':('value',0xfffffff0),'rcx':('value',3)}
        self.assertEqual(classifier.memory_address(instruction,instruction.operands[1],state,capstone),0x18)
    def test_call_and_branch_destroy_straight_line_assumptions(self):
        for suffix in ('ffd1','eb00','0f0b'):
            state=self.state(bytes.fromhex('488d0520000000'+suffix))
            self.assertEqual(state,{})
    def test_long_straight_line_retains_literals_until_a_real_transfer(self):
        raw=bytes.fromhex('488d0520000000')+b'\x90'*40+bytes.fromhex('4889c1')
        self.assertEqual(self.state(raw)['rcx'],('value',0x140001027))
        self.assertEqual(self.state(raw+bytes.fromhex('eb00')), {})
    def test_indexed_and_segment_memory_not_assumed_static(self):
        for raw in ('488b0448','65488b042530000000'):
            instruction=next(self.decoder.disasm(bytes.fromhex(raw),0x140001000))
            self.assertIsNone(classifier.memory_address(instruction,instruction.operands[1],{},capstone))
    def test_register_aliases_include_extended_and_partial_forms(self):
        self.assertEqual(classifier.canonical_register('eax'),'rax')
        self.assertEqual(classifier.canonical_register('r12d'),'r12')
        self.assertEqual(classifier.canonical_register('r8b'),'r8')
    def test_path_occurrences_do_not_all_establish_compiled_source_locations(self):
        row={'path':'file.rs','location_records':[],'verified_references':[]}
        self.assertEqual(classifier.path_evidence_role(row,{}),'literal-path-only-candidate')
        self.assertEqual(classifier.path_evidence_role({**row,'location_records':[{}]},{}),'native-location-record-bound')
        self.assertEqual(classifier.path_evidence_role(row,{'file.rs':{'role':'embedded-shader-comment'}}),'confirmed-embedded-resource-comment')
    def test_debug_identity_preserves_external_identity_and_only_bounded_contributions(self):
        raw=b'RSDS'+bytes(range(16))+struct.pack('<I',1)+b'benilla_rogue.pdb\0'
        self.assertEqual(classifier.debug_payload(2,raw)['pdb_path_in_record'],'benilla_rogue.pdb')
        raw=b'\0'*4+struct.pack('<II',0x1000,0x200)+b'.text\0\0\0'
        self.assertEqual(classifier.debug_payload(13,raw)['section_contributions'][0]['rva'],'0x1000')
        self.assertEqual(classifier.debug_payload(13,raw[:-1]),{})
class OwnershipPublication(unittest.TestCase):
    def setUp(self):
        base=ROOT/'runtime/tests/ownership-publication';base.mkdir(parents=True,exist_ok=True)
        self.temporary=tempfile.TemporaryDirectory(dir=base);self.addCleanup(self.temporary.cleanup)
        self.root=Path(self.temporary.name)

    def snapshot(self,path):
        return path.read_bytes(),path.stat().st_mtime_ns

    def test_json_verification_and_republication_preserve_all_artifact_bytes_and_mtime(self):
        for name in ('import-ownership','diagnostic-source-candidates','conditional-export-resolvers','receipt'):
            with self.subTest(artifact=name):
                path=self.root/(name+'.json');value={'artifact':name,'nested':[1,{'value':'é'}]}
                classifier.derived_json(path,value,publish=True)
                os.utime(path,ns=(1000000001,1000000002));original=self.snapshot(path)
                for publish in (False,True):
                    classifier.derived_json(path,value,publish=publish)
                    self.assertEqual(self.snapshot(path),original)

    def test_missing_or_changed_json_read_only_fails_without_mutation(self):
        path=self.root/'missing'/'artifact.json'
        with self.assertRaisesRegex(ValueError,'missing or differs'):classifier.derived_json(path,{'x':1})
        self.assertFalse(path.parent.exists())
        path=self.root/'artifact.json';classifier.derived_json(path,{'x':1},publish=True)
        original=self.snapshot(path)
        with self.assertRaisesRegex(ValueError,'missing or differs'):classifier.derived_json(path,{'x':2})
        self.assertEqual(self.snapshot(path),original)

    def test_json_verification_compares_exact_bytes_including_line_endings(self):
        path=self.root/'artifact.json';value={'x':1}
        path.write_bytes(classifier.json_text(value).replace('\n','\r\n').encode('utf-8'))
        original=self.snapshot(path)
        with self.assertRaisesRegex(ValueError,'missing or differs'):classifier.derived_json(path,value)
        self.assertEqual(self.snapshot(path),original)
        classifier.derived_json(path,value,publish=True)
        self.assertEqual(path.read_bytes(),classifier.json_text(value).encode('utf-8'))

    def test_json_final_alias_detaches_on_change_without_mutating_shared_target(self):
        target=self.root/'object';classifier.derived_json(target,{'x':1},publish=True)
        alias=self.root/'artifact.json';alias.symlink_to(target.name);original=self.snapshot(target)
        alias_mtime=alias.lstat().st_mtime_ns
        for publish in (False,True):
            classifier.derived_json(alias,{'x':1},publish=publish)
            self.assertTrue(alias.is_symlink());self.assertEqual(alias.lstat().st_mtime_ns,alias_mtime)
            self.assertEqual(self.snapshot(target),original)
        with self.assertRaisesRegex(ValueError,'missing or differs'):classifier.derived_json(alias,{'x':2})
        self.assertTrue(alias.is_symlink());self.assertEqual(alias.lstat().st_mtime_ns,alias_mtime)
        self.assertEqual(self.snapshot(target),original)
        classifier.derived_json(alias,{'x':2},publish=True)
        self.assertFalse(alias.is_symlink());self.assertEqual(self.snapshot(target),original)
        self.assertEqual(alias.read_text(),classifier.json_text({'x':2}))

    def test_json_parent_alias_and_failed_publication_preserve_destination(self):
        directory=self.root/'real';directory.mkdir();alias=self.root/'parent'
        alias.symlink_to(directory.name,target_is_directory=True);path=alias/'artifact.json'
        classifier.derived_json(path,{'x':1},publish=True);original=self.snapshot(path)
        with patch.object(Path,'replace',side_effect=OSError('fixture failure')):
            with self.assertRaisesRegex(OSError,'fixture failure'):classifier.derived_json(path,{'x':2},publish=True)
        self.assertEqual(self.snapshot(path),original);self.assertEqual(list(directory.iterdir()),[directory/'artifact.json'])
        self.assertTrue(alias.is_symlink())

if __name__=='__main__':unittest.main()
