#!/usr/bin/env python3
"""Non-compiling exact-byte source-role checks."""
import hashlib
import importlib.util
from pathlib import Path
import struct
import unittest
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('native_source_roles',ROOT/'scripts/audit-native-source-roles.py')
helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
class SourceRoles(unittest.TestCase):
    def test_current_resource_search_uses_exact_contents_not_historical_addresses(self):
        raw=b'#define_import_path fixture\n// in crates/missing.rs\n';image=b'x'*15+raw+b'y'*10
        digest=hashlib.sha256(raw).hexdigest()
        self.assertEqual(helper.exact_resource_matches(image,b'crates/missing.rs',len(raw),digest),[15])
        self.assertEqual(helper.exact_resource_matches(image,b'crates/missing.rs',len(raw)-1,digest),[])
        self.assertEqual(helper.exact_resource_matches(image.replace(b'fixture',b'changed'),b'crates/missing.rs',len(raw),digest),[])
        self.assertEqual(len(helper.exact_resource_matches(image+raw,b'crates/missing.rs',len(raw),digest)),2)
    def test_shader_role_requires_import_marker_and_path_comment(self):
        self.assertTrue(helper.shader_comment(b'#define_import_path fixture\n// crates/a.rs\n',b'crates/a.rs'))
        self.assertFalse(helper.shader_comment(b'#define_import_path fixture\ncrates/a.rs\n',b'crates/a.rs'))
        self.assertFalse(helper.shader_comment(b'// crates/a.rs\n',b'crates/a.rs'))
        self.assertFalse(helper.shader_comment(b'#define_import_path fixture\nlet text = "// crates/a.rs";\n',b'crates/a.rs'))
    def test_event_role_requires_exact_prefix_path_and_numeric_line(self):
        raw=b'event crates\\a.rs:109\x00';path=b'crates\\a.rs'
        self.assertEqual(helper.event_label(raw,6,path),(0,len(raw)-1,109))
        self.assertIsNone(helper.event_label(raw,6,b'crates/b.rs'))
        self.assertIsNone(helper.event_label(b'other '+path+b':109',6,path))
        self.assertIsNone(helper.event_label(b'event '+path+b':bad',6,path))
    def test_location_role_requires_complete_exact_descriptor(self):
        raw=struct.pack('<QQII',0x1000,12,23,45)
        self.assertTrue(helper.verify_location(raw,0x1000,12,23,45))
        self.assertFalse(helper.verify_location(raw[:-1],0x1000,12,23,45))
        for values in ((0x1001,12,23,45),(0x1000,13,23,45),(0x1000,12,24,45),(0x1000,12,23,46)):
            self.assertFalse(helper.verify_location(raw,*values))
if __name__=='__main__':unittest.main()
