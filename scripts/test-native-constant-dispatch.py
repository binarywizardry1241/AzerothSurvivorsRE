#!/usr/bin/env python3
"""Non-compiling immutable dispatch versus loaded-pointer regressions."""
import importlib.util
from pathlib import Path
import unittest
import capstone
ROOT=Path(__file__).resolve().parents[1]
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value
helper=module('constant_audit','scripts/audit-native-constant-dispatch.py');classifier=module('constant_classifier','scripts/classify-native-ownership.py')
class Constants(unittest.TestCase):
    def value(self,raw):
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        instructions=list(decoder.disasm(bytes.fromhex(raw),0x140001000));return helper.immutable_target(instructions[:-1],instructions[-1],capstone,classifier)
    def test_lea_and_register_copy_before_call(self):
        self.assertEqual(self.value('488d05200000004889c1ffd1'),0x140001027)
    def test_initial_memory_load_and_partial_write_are_not_constants(self):
        for raw in ('488b0520000000ffd0','488d05200000006689c8ffd0'):
            self.assertIsNone(self.value(raw))
    def test_literal_jump_and_full_transfer_reset(self):
        self.assertEqual(self.value('b834120000ffe0'),0x1234)
        self.assertIsNone(self.value('488d0520000000e800000000ffd0'))
if __name__=='__main__':unittest.main()
