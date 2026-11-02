#!/usr/bin/env python3
"""Non-compiling guarded jump-table proof regressions on synthetic bytes."""
import importlib.util
from pathlib import Path
import struct
import unittest
import capstone
ROOT=Path(__file__).resolve().parents[1]
def module(name,file):
    spec=importlib.util.spec_from_file_location(name,ROOT/file);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
recovery=module('native_table_recovery','scripts/recover-native-jump-tables.py')
classifier=module('native_table_classifier','scripts/classify-native-ownership.py')
class FakePe:
    image_base=0x140000000
    def __init__(self,writable=False):
        self.data=bytearray(0x2000)
        self.sections=[dict(rva=0x1000,virtual_size=0x1000,raw_size=0x1000,characteristics='0x60000020'),
            dict(rva=0x2000,virtual_size=0x1000,raw_size=0x1000,characteristics='0xc0000040' if writable else '0x40000040')]
        for index in range(4):struct.pack_into('<i',self.data,0x1000+4*index,0x1050+4*index-0x2000)
    def rva_offset(self,rva):
        if 0x1000<=rva<0x3000:return rva-0x1000
        raise ValueError('unmapped')
class GuardedTables(unittest.TestCase):
    def instructions(self,width=64,producer=b'',mutation=b'',inside_guard=False):
        address=0x140001000
        raw=producer+(bytes.fromhex('4883f803') if width==64 else bytes.fromhex('83f803'))
        raw+=b'\x77'+bytes([0 if inside_guard else 0x50])
        raw+=mutation
        rip=address+len(raw)+7
        raw+=bytes.fromhex('488d0d')+struct.pack('<i',0x140002000-rip)
        raw+=bytes.fromhex('486304814801c8ffe0')
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        return list(decoder.disasm(raw,address))
    def recover(self,**kwargs):return recovery.recover(self.instructions(**kwargs),FakePe(),capstone,classifier)
    def test_exact_unsigned_guard_and_relative_targets(self):
        table,reason=self.recover();self.assertIsNone(reason)
        self.assertEqual(table['guard_bound'],3);self.assertEqual(table['case_targets'],[hex(0x140001050+4*i) for i in range(4)])
    def test_unknown_upper_selector_bits_are_not_treated_as_zero(self):
        self.assertIsNone(self.recover(width=32)[0])
        self.assertIsNotNone(self.recover(width=32,producer=bytes.fromhex('b801000000'))[0])
        literal=self.recover(width=32,producer=bytes.fromhex('b8010000007500'))[0]
        self.assertEqual((literal['selector_minimum'],literal['selector_maximum']),(1,1));self.assertEqual(literal['case_targets'],['0x140001054'])
    def test_relative_base_cannot_be_overwritten_by_the_table_load(self):
        instructions=self.instructions()
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        tail=instructions[-3].address
        instructions=instructions[:-3]+list(decoder.disasm(bytes.fromhex('48630c814801c9ffe1'),tail))
        self.assertEqual(recovery.recover(instructions,FakePe(),capstone,classifier)[1],'overwritten-relative-base')
    def test_static_base_before_a_conditional_guard_is_preserved_on_fallthrough(self):
        address=0x140001000
        raw=bytes.fromhex('488d0d')+struct.pack('<i',0x140002000-address-7)
        raw+=bytes.fromhex('4883f8037750486304814801c8ffe0')
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        table,reason=recovery.recover(list(decoder.disasm(raw,address)),FakePe(),capstone,classifier)
        self.assertIsNone(reason);self.assertEqual(len(table['case_targets']),4)
    def test_selector_mutation_or_guard_target_inside_dispatch_rejected(self):
        self.assertIsNone(self.recover(mutation=bytes.fromhex('48ffc0'))[0])
        self.assertIsNone(self.recover(inside_guard=True)[0])
    def test_writable_tables_are_not_promoted_to_static_targets(self):
        table,reason=recovery.recover(self.instructions(),FakePe(True),capstone,classifier)
        self.assertIsNone(table);self.assertEqual(reason,'table-not-immutable-file-backed-data')
    def test_non_executable_entry_keeps_the_whole_table_unknown(self):
        pe=FakePe();struct.pack_into('<i',pe.data,0x1000,0x100000)
        self.assertIsNone(recovery.recover(self.instructions(),pe,capstone,classifier)[0])
    def test_full_width_and_mask_proves_bound_without_enum_or_compare(self):
        address=0x140001000;raw=bytes.fromhex('83e003')
        raw+=bytes.fromhex('488d0d')+struct.pack('<i',0x140002000-address-len(raw)-7)
        raw+=bytes.fromhex('486304814801c8ffe0')
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        table,reason=recovery.recover(list(decoder.disasm(raw,address)),FakePe(),capstone,classifier)
        self.assertIsNone(reason);self.assertEqual(table['guard_kind'],'and-mask');self.assertEqual(table['guard_bound'],3);self.assertEqual(len(table['case_targets']),4)
    def test_narrow_mask_and_later_selector_write_do_not_bound_address(self):
        for prefix in ['2403','83e00348ffc0']:
            address=0x140001000;raw=bytes.fromhex(prefix)
            raw+=bytes.fromhex('488d0d')+struct.pack('<i',0x140002000-address-len(raw)-7);raw+=bytes.fromhex('486304814801c8ffe0')
            decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
            self.assertIsNone(recovery.recover(list(decoder.disasm(raw,address)),FakePe(),capstone,classifier)[0])
    def test_whole_scalar_domain_rejects_any_instruction_interior(self):
        table={'case_targets':['0x1000','0x1001','0x1004']}
        result=recovery.validate_scalar_targets(table,[0x1000,0x1004],[4,2],lambda address:True)
        self.assertEqual(result['exceptions'],[{'target':'0x1001','reason':'inside-established-instruction','instruction':'0x1000'}])
        self.assertEqual(len(table['case_targets']),3)
    def test_unknown_scalar_targets_need_an_independent_boundary(self):
        table={'case_targets':['0x1000','0x1004']}
        result=recovery.validate_scalar_targets(table,[0x1000],[2],lambda address:False)
        self.assertEqual(result['exceptions'][0]['target'],'0x1004')
        result=recovery.validate_scalar_targets(table,[0x1000],[2],lambda address:address==0x1004)
        self.assertFalse(result['exceptions']);self.assertEqual(result['declared_linear_instruction_targets'],1)
    def test_byte_compare_bound_needs_known_zero_upper_bits(self):
        address=0x140001000
        for prefix,accepted in [(bytes.fromhex('0fb6c3'),True),(b'',False)]:
            raw=prefix+bytes.fromhex('3c037750')
            raw+=bytes.fromhex('488d0d')+struct.pack('<i',0x140002000-address-len(raw)-7)
            raw+=bytes.fromhex('486304814801c8ffe0')
            decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
            value=recovery.recover(list(decoder.disasm(raw,address)),FakePe(),capstone,classifier)[0]
            self.assertEqual(value is not None,accepted)
            if value:self.assertEqual(len(value['case_targets']),4)
    def test_relative_pointer_arithmetic_requires_64_bit_widths(self):
        instructions=self.instructions();decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        tail=instructions[-3].address
        replaced=instructions[:-3]+list(decoder.disasm(bytes.fromhex('4863048101c8ffe0'),tail))
        self.assertEqual(recovery.recover(replaced,FakePe(),capstone,classifier)[1],'not-relative-add')
    def test_high_byte_guard_does_not_bound_low_selector_byte(self):
        address=0x140001000;raw=bytes.fromhex('0fb6c380fc037750')
        raw+=bytes.fromhex('488d0d')+struct.pack('<i',0x140002000-address-len(raw)-7)
        raw+=bytes.fromhex('486304814801c8ffe0')
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        table,reason=recovery.recover(list(decoder.disasm(raw,address)),FakePe(),capstone,classifier)
        self.assertIsNone(table) # Full byte domain exceeds this four-entry fixture.
    def test_address_override_cannot_be_modeled_as_64_bit_table_access(self):
        instructions=self.instructions();decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        tail=instructions[-3].address
        replaced=instructions[:-3]+list(decoder.disasm(bytes.fromhex('67486304814801c8ffe0'),tail))
        self.assertEqual(recovery.recover(replaced,FakePe(),capstone,classifier)[1],'unsupported-table-address')
    def test_exact_byte_alias_guard_before_zero_extension_bounds_table(self):
        address=0x140001000;raw=bytes.fromhex('80fb0377500fb6c3')
        raw+=bytes.fromhex('488d0d')+struct.pack('<i',0x140002000-address-len(raw)-7)
        raw+=bytes.fromhex('486304814801c8ffe0')
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        table,reason=recovery.recover(list(decoder.disasm(raw,address)),FakePe(),capstone,classifier)
        self.assertIsNone(reason);self.assertEqual(table['guard_kind'],'alias-ja');self.assertEqual(len(table['case_targets']),4)
        self.assertEqual(table['selector_alias_proof']['compare_instruction_bytes'],'80fb03')
    def test_alias_guard_intersects_known_domain_and_rejects_empty_path(self):
        address=0x140001000;raw=bytes.fromhex('b80a0000003c03775089c1')
        raw+=bytes.fromhex('488d15')+struct.pack('<i',0x140002000-address-len(raw)-7)
        raw+=bytes.fromhex('4863048a4801d0ffe0')
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        table,reason=recovery.recover(list(decoder.disasm(raw,address)),FakePe(),capstone,classifier)
        self.assertIsNone(table);self.assertEqual(reason,'guarded-fallthrough-has-empty-proved-domain')
    def domain(self,raw):
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        value=recovery.scalar_domain(list(decoder.disasm(bytes.fromhex(raw),0x1000)),'rax',capstone,classifier)
        return value[:2] if value else None
    def test_zero_extension_and_logical_shift_domains(self):
        self.assertEqual(self.domain('0fb6c1'),(0,255));self.assertEqual(self.domain('0fb7c1'),(0,65535))
        self.assertEqual(self.domain('48c1e838'),(0,255));self.assertEqual(self.domain('c1e81e'),(0,3))
        self.assertEqual(self.domain('b8ff0100000fb6c4'),(1,1)) # AH, not AL
    def test_setcc_requires_known_upper_bits(self):
        self.assertIsNone(self.domain('0f94c0'));self.assertEqual(self.domain('31c00f94c0'),(0,1))
        self.assertEqual(self.domain('b8000100000f94c0'),(256,257))
    def test_literal_and_sparse_mask_do_not_invent_indices(self):
        self.assertEqual(self.domain('b805000000'),(5,5));self.assertIsNone(self.domain('83e005'))
        self.assertEqual(self.domain('b80700000083e003'),(3,3));self.assertIsNone(self.domain('b800000000b001'))
    def test_backward_iteration_invalidates_lexical_singleton(self):
        self.assertIsNone(self.domain('31c083c00175fb'))
        self.assertEqual(self.domain('31c083c00175fbb803000000'),(3,3))
    def test_backward_iteration_invalidates_static_table_base(self):
        address=0x140001000;raw=bytes.fromhex('488d0d')+struct.pack('<i',0x140002000-address-7)
        raw+=bytes.fromhex('4883c10475fa4883f8037750486304814801c8ffe0')
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
        self.assertEqual(recovery.recover(list(decoder.disasm(raw,address)),FakePe(),capstone,classifier)[1],'table-base-not-static')
    def test_image_address_is_not_a_stable_numeric_selector(self):
        self.assertIsNone(self.domain('488d0500000000'))
        self.assertIsNone(self.domain('48b80010004001000000'))
if __name__=='__main__':unittest.main()
