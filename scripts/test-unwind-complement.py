#!/usr/bin/env python3
"""Non-compiling complement mapping/flow regressions; no provider or game."""

import importlib.util
from pathlib import Path
from types import SimpleNamespace
import unittest

import capstone

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("complement", ROOT / "scripts/inventory-unwind-complement.py")
complement = importlib.util.module_from_spec(spec)
spec.loader.exec_module(complement)
native = complement.module("complement_native", "scripts/inventory-native-instructions.py")


class ComplementFlow(unittest.TestCase):
    def pe(self, raw, virtual=None, raw_size=None):
        return SimpleNamespace(data=raw, image_base=0, sections=[dict(rva=0x1000,
            virtual_size=len(raw) if virtual is None else virtual,
            raw_size=len(raw) if raw_size is None else raw_size, raw_offset=0, characteristics="0x20000000")])

    def trace(self, raw, seeds=(0x1000,), gaps=None):
        raw = bytes.fromhex(raw)
        pe = self.pe(raw)
        rows = complement.mapped_regions(pe, gaps or [(0x1000,0x1000+len(raw))])
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        decoder.detail = True
        decoder.skipdata = False
        decoded, refs, stops = complement.trace(pe,complement.Regions(rows),seeds,decoder,capstone,native)
        return rows,decoded,refs,stops

    def test_virtual_tail_is_explicit_and_never_read_as_raw(self):
        rows = complement.mapped_regions(self.pe(b"\xcc\xcc",virtual=5),[(0x1000,0x1005)])
        self.assertEqual([(r['start'],r['end'],r['file_offset']) for r in rows],
                         [(0x1000,0x1002,0),(0x1002,0x1005,None)])

    def test_raw_alignment_slack_is_outside_virtual_denominator(self):
        rows = complement.mapped_regions(self.pe(b"\xcc\xcc\x90\x90",virtual=2),[(0x1000,0x1002)])
        self.assertEqual(rows[0]['end']-rows[0]['start'],2)
        self.assertEqual(rows[0]['category'],'uniform_cc_candidate')

    def test_ambiguous_section_mapping_is_rejected(self):
        pe=self.pe(b"\xcc")
        pe.sections.append(dict(pe.sections[0]))
        with self.assertRaisesRegex(ValueError,'unique virtual section'):
            complement.mapped_regions(pe,[(0x1000,0x1001)])

    def test_truncated_file_mapping_is_rejected(self):
        with self.assertRaisesRegex(ValueError,'Truncated'):
            complement.mapped_regions(self.pe(b"\xcc",virtual=2,raw_size=2),[(0x1000,0x1002)])

    def test_overlapping_regions_are_rejected(self):
        with self.assertRaisesRegex(ValueError,'Overlapping'):
            complement.Regions([dict(start=10,end=20),dict(start=15,end=25)])

    def test_padding_seed_remains_visible_and_stops_at_trap(self):
        rows,decoded,refs,stops=self.trace('cccc')
        self.assertEqual(list(decoded),[0x1000])
        self.assertEqual(complement.residual_partition(rows,decoded),
                         {'decoded_candidate_bytes':1,'uniform_cc_candidate':1})
        self.assertIn((0x1000,'trap_or_privileged_exit'),stops)

    def test_return_has_no_speculative_fallthrough(self):
        self.assertEqual(list(self.trace('c390c3')[1]),[0x1000])

    def test_conditional_follows_target_and_continuation(self):
        self.assertEqual(set(self.trace('7401c3c3')[1]),{0x1000,0x1002,0x1003})

    def test_unconditional_jump_skips_unseeded_bytes(self):
        self.assertEqual(set(self.trace('eb0190c3')[1]),{0x1000,0x1003})

    def test_call_follows_target_and_continuation(self):
        self.assertEqual(set(self.trace('e801000000c3c3')[1]),{0x1000,0x1005,0x1006})

    def test_direct_target_crosses_complement_ranges(self):
        result=self.trace('eb029090c3',gaps=[(0x1000,0x1002),(0x1004,0x1005)])
        self.assertEqual(set(result[1]),{0x1000,0x1004})

    def test_instruction_must_not_cross_unwind_boundary(self):
        rows,decoded,refs,stops=self.trace('e800000000c3',gaps=[(0x1000,0x1003),(0x1005,0x1006)])
        self.assertEqual(decoded,{})
        self.assertIn((0x1000,'invalid_or_boundary_truncated'),stops)

    def test_indirect_slot_is_not_followed_as_a_callee(self):
        rows,decoded,refs,stops=self.trace('ff2500000000c3')
        self.assertEqual(list(decoded),[0x1000])
        self.assertIn((0x1000,'jump_indirect',None,0,0),refs)
        self.assertIn((0x1000,'memory',0x1006,0,capstone.CS_AC_READ),refs)

    def test_indirect_call_keeps_encoded_continuation_without_guessing_callee(self):
        self.assertEqual(set(self.trace('ffd0c3')[1]),{0x1000,0x1002})

    def test_mid_instruction_seed_conflicts_are_retained_without_double_count(self):
        rows,decoded,refs,stops=self.trace('b8909090c3c3',seeds=(0x1000,0x1001))
        self.assertIn(0x1001,decoded)
        total=sum(row[0]-site for site,row in decoded.items())
        union=complement.residual_partition(rows,decoded)['decoded_candidate_bytes']
        self.assertGreater(total,union)
        self.assertEqual(union,6)

    def test_unseeded_bytes_are_not_automatically_decoded(self):
        rows,decoded,refs,stops=self.trace('9090c3',seeds=())
        self.assertEqual(decoded,{})
        self.assertEqual(sum(complement.residual_partition(rows,decoded).values()),3)

    def test_canonical_multibyte_nop_grammar_is_only_a_candidate_class(self):
        raw=bytes.fromhex('6666666666662e0f1f840000000000cc6690')
        rows=complement.mapped_regions(self.pe(raw),[(0x1000,0x1000+len(raw))])
        self.assertEqual(rows[0]['category'],'x86_padding_sequence_candidate')
        for rejected in ('488d00','666666666666662e0f1f840000000000','0f1f840001000000','0f1f'):
            self.assertIsNone(complement.PADDING.fullmatch(bytes.fromhex(rejected)))

    def test_int1_is_a_trap_and_does_not_decode_following_bytes(self):
        self.assertEqual(list(self.trace('f190c3')[1]),[0x1000])


if __name__ == '__main__':
    unittest.main()
