#!/usr/bin/env python3
"""Non-compiling exact selector-copy/flag/width guard regressions."""
import importlib.util
from pathlib import Path
import unittest
import capstone
ROOT=Path(__file__).resolve().parents[1]
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value
helper=module('scalar_aliases','scripts/native_scalar_aliases.py');classifier=module('alias_classifier','scripts/classify-native-ownership.py')
class AliasGuards(unittest.TestCase):
    def guards(self,raw,selector='rax'):
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        instructions=list(decoder.disasm(bytes.fromhex(raw),0x1000));return helper.guard_bounds(instructions,selector,0x1040,capstone,classifier)
    def test_byte_guard_before_zero_extension_of_same_or_copied_register(self):
        for raw in ('4080fe137750400fb6c6','80f91377500fb6c1'):
            self.assertEqual(self.guards(raw)[0]['maximum'],19)
    def test_zero_extension_before_guard_can_use_original_byte_alias(self):
        self.assertEqual(self.guards('0fb6c33c057750',selector='rbx'),[])
        self.assertEqual(self.guards('0fb6cb3c057750',selector='rcx'),[])
        self.assertEqual(self.guards('0fb6c380fb057750')[0]['maximum'],5)
    def test_full_compare_after_zero_extension_retains_noop_copy(self):
        self.assertEqual(self.guards('400fb6ce83f90b775089c9',selector='rcx')[0]['maximum'],11)
    def test_unknown_upper_bits_and_unrelated_registers_do_not_alias(self):
        self.assertFalse(self.guards('80f90377504889c8'))
        self.assertFalse(self.guards('80fa0377500fb6c1'))
    def test_high_byte_guard_does_not_shrink_low_byte_selector(self):
        self.assertFalse(self.guards('0fb6c380fc037750'))
    def test_flag_write_or_selector_write_invalidates_relation(self):
        self.assertFalse(self.guards('80f90331d277500fb6c1'))
        self.assertFalse(self.guards('80f90377500fb6c183c001'))
    def test_flag_preserving_mov_between_compare_and_branch_is_valid(self):
        self.assertEqual(self.guards('80f90389d277500fb6c1')[0]['maximum'],3)
    def test_backward_transfer_and_call_invalidate_prior_aliases(self):
        self.assertFalse(self.guards('80f903775075f80fb6c1'))
        self.assertFalse(self.guards('80f9037750e8000000000fb6c1'))
    def test_a_narrow_partial_write_never_preserves_full_unknown_value(self):
        self.assertFalse(self.guards('80f903775088c8'))
    def test_later_conditional_exit_preserves_earlier_bound(self):
        self.assertEqual(self.guards('80f90377500fb6c10fa3d07350')[0]['maximum'],3)
        self.assertFalse(self.guards('80f90377500fb6c17400'))
    def test_unsigned_upper_bound_can_make_truncation_lossless(self):
        self.assertEqual(self.guards('4883f90377500fb6c1')[0]['maximum'],3)
if __name__=='__main__':unittest.main()
