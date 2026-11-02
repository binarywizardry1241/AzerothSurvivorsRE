#!/usr/bin/env python3
"""Non-compiling boundary and bounded target-flow regressions."""
import importlib.util
from pathlib import Path
import unittest
import capstone
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('address_leads',ROOT/'scripts/recover-native-address-leads.py');helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
class PE:
    image_base=0;sections=[{'rva':0x100,'virtual_size':0x100,'characteristics':'0x20000000'}]
    def __init__(self,raw):self.data=b'\0'*0x100+raw+b'\0'*(0x100-len(raw))
    def rva_offset(self,address):
        if not 0x100<=address<0x200:raise ValueError('unmapped')
        return address
class AddressCode(unittest.TestCase):
    def flow(self,raw,boundary=lambda a:None,**kwargs):return helper.bounded_flow(PE(bytes.fromhex(raw)),0x100,boundary,capstone,**kwargs)
    def test_exact_return_and_direct_successor_graph(self):
        proof,reason=self.flow('7501c3c3');self.assertIsNone(reason);self.assertEqual(len(proof['instructions']),3)
    def test_instruction_interiors_and_crossing_known_starts_reject(self):
        self.assertEqual(self.flow('4889c1c3',lambda a:'exact' if a==0x101 else None)[1],'instruction-crosses-established-boundary')
        self.assertEqual(self.flow('c3',lambda a:'interior')[1],'overlaps-established-instruction')
    def test_invalid_far_opcode_and_nonexecutive_successors_reject(self):
        self.assertEqual(self.flow('ea05000080bdfe')[1],'invalid-x64-instruction')
        self.assertEqual(self.flow('e900100000')[1],'successor-not-executable')
    def test_computed_exit_keeps_unknown_alias_and_bound_limit_is_explicit(self):
        proof,reason=self.flow('ffe0');self.assertIsNone(reason);self.assertEqual(len(proof['open_computed_exits']),1)
        self.assertEqual(self.flow('909090c3',max_instructions=2)[1],'bounded-flow-limit')
    def test_instruction_may_not_cross_into_following_nonexec_mapping(self):
        pe=PE(bytes.fromhex('48c3'))
        pe.sections=[{'rva':0x100,'virtual_size':1,'raw_size':1,'characteristics':'0x20000000'},
            {'rva':0x101,'virtual_size':0xff,'raw_size':0xff,'characteristics':'0x40000000'}]
        self.assertIsNone(helper.executable_bytes(pe,0x100,2))
        self.assertEqual(helper.bounded_flow(pe,0x100,lambda a:None,capstone)[1],'invalid-x64-instruction')
        pe=PE(bytes.fromhex('488d0509000000')+b'\x90'*9+bytes.fromhex('48c3'))
        pe.sections=[{'rva':0x100,'virtual_size':0x11,'raw_size':0x11,'characteristics':'0x20000000'},
            {'rva':0x111,'virtual_size':0xef,'raw_size':0xef,'characteristics':'0x40000000'}]
        payload={'target':{'sha256':'a'},'code_only_seeds':[{'site':'0x110','instruction_bytes':'48c3','source_site':'0x100','source_instruction_bytes':'488d0509000000','code_validation':{'instructions':[]}}]}
        with self.assertRaisesRegex(ValueError,'target mapping'):
            helper.verify_inventory(payload,{'sha256':'a'},pe,capstone)
    def test_owned_rip_lea_source_requires_exact_width_bytes_and_target(self):
        pe=PE(bytes.fromhex('488d0509000000c3'))
        self.assertTrue(helper.source_lea(pe,0x100,'488d0509000000',0x110,capstone))
        self.assertFalse(helper.source_lea(pe,0x100,'488d0509000000',0x111,capstone))
        self.assertFalse(helper.source_lea(pe,0x100,'8d0509000000',0x10f,capstone))
    def test_existing_instruction_remains_a_seed_for_fresh_import(self):
        pe=PE(bytes.fromhex('4889c1c3'))
        proof,reason=helper.code_proof(pe,0x100,lambda a:'exact' if a==0x100 else None,lambda a:3,capstone)
        self.assertIsNone(reason);self.assertEqual(proof['instructions'],[{'site':'0x100','instruction_bytes':'4889c1'}])
        self.assertEqual(proof['validation_basis'],'independently-verified-existing-instruction')
    def test_unowned_exact_source_does_not_invent_a_body_or_block_code_seed(self):
        source={'site':'0x100','source_native_owner':None,'instruction_bytes':'488d0509000000'}
        pe=PE(bytes.fromhex(source['instruction_bytes'])+b'\x90'*9+b'\xc3')
        self.assertTrue(helper.source_lea(pe,int(source['site'],16),source['instruction_bytes'],0x110,capstone))
        proof,reason=helper.code_proof(pe,0x110,lambda a:None,lambda a:None,capstone)
        self.assertIsNone(reason);self.assertEqual(proof['instructions'][0]['site'],'0x110')
        self.assertIsNone(source['source_native_owner'])
if __name__=='__main__':unittest.main()
