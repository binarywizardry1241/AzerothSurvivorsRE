#!/usr/bin/env python3
"""Non-compiling exact address-taken import-thunk admission regressions."""
import importlib.util
from pathlib import Path
import unittest
import capstone
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('native_import_thunks',ROOT/'scripts/recover-native-import-thunks.py');helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)

class PE:
    image_base=0
    sections=[{'rva':0x100,'virtual_size':0x100,'characteristics':'0x20000000'}]
    def __init__(self):
        self.data=bytearray(0x400)
        self.data[0x100:0x107]=bytes.fromhex('488d0579000000') # LEA RAX,180
        self.data[0x180:0x187]=bytes.fromhex('48ff2579000000') # JMP [200]
    def rva_offset(self,address):
        if not 0<=address<len(self.data):raise ValueError('unmapped')
        return address

class ImportThunks(unittest.TestCase):
    def test_exact_rip_lea_and_import_tail_jump(self):
        row=helper.candidate(PE(),{0x200:('kernel32.dll','Example')},0x100,'488d0579000000',0x180,capstone)
        self.assertEqual(row['entry'],'0x180');self.assertEqual(row['iat_slot'],'0x200');self.assertEqual(row['instruction_bytes'],'48ff2579000000')
    def test_rejects_absent_declared_import_binding(self):
        self.assertIsNone(helper.candidate(PE(),{},0x100,'488d0579000000',0x180,capstone))
    def test_rejects_changed_source_or_wrong_effective_address(self):
        for raw,target in [('488d0578000000',0x180),('488d0579000000',0x181)]:
            self.assertIsNone(helper.candidate(PE(),{0x200:('x','y')},0x100,raw,target,capstone))
    def test_rejects_nonexecutive_destination_and_ordinary_code(self):
        pe=PE();pe.sections=[]
        self.assertIsNone(helper.candidate(pe,{0x200:('x','y')},0x100,'488d0579000000',0x180,capstone))
        pe=PE();pe.data[0x180:0x187]=bytes.fromhex('90c39090909090')
        self.assertIsNone(helper.candidate(pe,{0x200:('x','y')},0x100,'488d0579000000',0x180,capstone))
    def test_rejects_register_or_partial_width_source_address(self):
        pe=PE();pe.data[0x100:0x107]=bytes.fromhex('8d057a00000090')
        self.assertIsNone(helper.candidate(pe,{0x200:('x','y')},0x100,'8d057a000000',0x180,capstone))
        pe.data[0x100:0x107]=bytes.fromhex('488d0080909090')
        self.assertIsNone(helper.candidate(pe,{0x200:('x','y')},0x100,'488d00',0x180,capstone))
if __name__=='__main__':unittest.main()
