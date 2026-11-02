#!/usr/bin/env python3
"""Non-compiling explicit operand/address admission regressions."""
import importlib.util
from pathlib import Path
import unittest
import capstone
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('operand_audit',ROOT/'scripts/audit-native-operands.py');helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
class Operands(unittest.TestCase):
    def rows(self,raw,address=0x140001000):
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        return list(helper.explicit_operands(next(decoder.disasm(bytes.fromhex(raw),address,count=1)),capstone))
    def test_rip_lea_is_address_expression(self):
        row=self.rows('488d0579000000')[0]
        self.assertEqual((row['kind'],row['target']),('address-expression',0x140001080))
    def test_read_and_write_addresses_keep_access_and_width(self):
        read=self.rows('488b0579000000')[0];write=self.rows('48890579000000')[0]
        self.assertEqual(read['width'],8);self.assertEqual(read['access'],capstone.CS_AC_READ)
        self.assertEqual(write['access'],capstone.CS_AC_WRITE)
    def test_incoming_register_index_and_segment_are_excluded(self):
        for raw in ('488b00','488b04c500000040','65488b042500000040'):
            self.assertEqual(self.rows(raw),[])
    def test_absolute_address_and_address_size_wrapping(self):
        self.assertEqual(self.rows('488b042500000040')[0]['target'],0x40000000)
        self.assertEqual(self.rows('67488b0579000000',0x1fffffff0)[0]['target'],0x71)
    def test_direct_branch_immediate_is_separate_from_numeric_candidate(self):
        self.assertEqual(self.rows('e800000000'),[])
        row=self.rows('48b88010004001000000')[0]
        self.assertEqual((row['kind'],row['target']),('mapped-immediate-candidate',0x140001080))
if __name__=='__main__':unittest.main()
