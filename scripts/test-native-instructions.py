#!/usr/bin/env python3
"""Non-compiling static decoder/accounting regressions; never start a provider."""

import importlib.util
from pathlib import Path
import sqlite3
import tempfile
import unittest
from unittest.mock import patch

import capstone

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("native_instructions", ROOT / "scripts/inventory-native-instructions.py")
native = importlib.util.module_from_spec(spec)
spec.loader.exec_module(native)


class StaticInstructions(unittest.TestCase):
    def setUp(self):
        self.decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        self.decoder.detail = True
        self.decoder.skipdata = False

    def decode(self, raw):
        return native.decode_extent(bytes.fromhex(raw), 0x140001000, self.decoder, capstone)

    def test_direct_call_target_is_decoded_relative_to_next_instruction(self):
        decoded, count, refs = self.decode("e805000000c3")
        self.assertEqual((decoded, count), (6, 2))
        self.assertEqual(refs[0][2:], ("call_direct", "0x14000100a", 0, 0))

    def test_register_call_is_explicitly_unresolved(self):
        refs = self.decode("ffd0c3")[2]
        self.assertEqual(refs[0][2:], ("call_indirect", None, 0, 0))

    def test_import_slot_is_a_memory_operand_and_never_a_callee(self):
        refs = self.decode("ff150a000000c3")[2]
        self.assertEqual(refs[0][2:], ("call_indirect", None, 0, 0))
        self.assertEqual(refs[1][2:4], ("memory", "0x140001010"))
        self.assertTrue(refs[1][-1] & capstone.CS_AC_READ)

    def test_lea_address_is_not_a_memory_read(self):
        refs = self.decode("488d050a000000c3")[2]
        self.assertEqual(refs[0][2:], ("address", "0x140001011", 1, 0))

    def test_global_read_and_write_remain_distinct(self):
        read = self.decode("488b050a000000")[2][0]
        write = self.decode("4889050a000000")[2][0]
        self.assertEqual(read[-1], capstone.CS_AC_READ)
        self.assertEqual(write[-1], capstone.CS_AC_WRITE)

    def test_indexed_and_segment_based_addresses_are_not_guessed(self):
        # mov rax,[rax+rcx*8]; mov rax,gs:[0x60]
        self.assertEqual(self.decode("488b04c865488b042560000000")[2], [])

    def test_indirect_jump_is_explicitly_unresolved(self):
        self.assertEqual(self.decode("ffe0")[2][0][2:], ("jump_indirect", None, 0, 0))

    def test_decoding_stops_at_truncated_instruction_without_skipdata(self):
        decoded, count, refs = self.decode("90e8aabb")
        self.assertEqual((decoded, count, refs), (1, 1, []))

    def test_linear_decode_does_not_claim_reachability_after_return(self):
        self.assertEqual(self.decode("c390")[0:2], (2, 2))
        self.assertIn("proof that decoded bytes execute", native.LIMITS[0])

    def test_native_adapter_matches_public_decoder_on_all_reference_kinds_and_truncation(self):
        raw = bytes.fromhex("e805000000ffd0ff150a000000488d050a000000488b050a0000004889050a000000ffe064488b04256000000090e8aabb")
        observed = native.decode_extent(raw, 0x140001000, self.decoder, capstone)
        with patch.object(native, "instructions", side_effect=lambda data, address, decoder, module: decoder.disasm(data, address)):
            ordinary = native.decode_extent(raw, 0x140001000, self.decoder, capstone)
        self.assertEqual(observed, ordinary)

    def test_overlap_union_does_not_double_count_bytes(self):
        self.assertEqual(native.union_size([(10, 20), (15, 30), (40, 44), (40, 40)]), 24)

    def test_executable_gaps_include_virtual_tail_and_exclude_nonexecutable_sections(self):
        sections = [dict(rva=10, virtual_size=40, characteristics="0x20000000"),
                    dict(rva=70, virtual_size=10, characteristics="0x40000000")]
        records = [(15, 25, 0), (20, 30, 0), (40, 45, 0)]
        self.assertEqual(native.outside_intervals(sections, records, 100),
                         [[110, 115], [130, 140], [145, 150]])

    def test_resume_rejects_changed_target_decoder_or_tool(self):
        scratch = ROOT / "runtime/tests/coverage"
        scratch.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as directory:
            path = Path(directory) / "inventory.sqlite"
            metadata = dict(target_sha256="a" * 64, generator=dict(decoder_version="fixture", sha256="b" * 64))
            native.open_inventory(path, metadata).close()
            native.open_inventory(path, metadata).close()
            for changed in (dict(target_sha256="c" * 64), dict(generator=dict(decoder_version="changed")),
                            dict(generator=dict(sha256="changed"))):
                with self.assertRaisesRegex(ValueError, "resume target/tool/decoder differs"):
                    native.open_inventory(path, {**metadata, **changed})

    def test_pending_and_undecoded_extents_cannot_certify_native_completeness(self):
        scratch = ROOT / "runtime/tests/coverage"
        scratch.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as directory:
            path = Path(directory) / "inventory.sqlite"
            connection = native.open_inventory(path, {})
            connection.execute("INSERT INTO extents VALUES(0,10,20,0,'fixture',15,2)")
            connection.commit()
            target = dict(version="fixture", path="fixture.exe", sha256="a" * 64, size_bytes=20)
            summary = native.summarize(connection, target, path, {}, [(10, 20, 0), (30, 40, 0)], [])
            connection.close()
            self.assertFalse(summary["declared_extent_pass_complete"])
            self.assertFalse(summary["native_semantics_complete"])
            self.assertFalse(summary["parity_verified"])
            self.assertEqual(summary["counts"]["pending_extents"], 1)
            self.assertEqual(summary["counts"]["undecoded_suffix_bytes_summed"], 5)

    def test_equal_summary_publication_preserves_alias_bytes_and_mtime(self):
        scratch=ROOT/'runtime/tests/coverage';scratch.mkdir(parents=True,exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as directory:
            path=Path(directory)/'summary.json';source=Path(directory)/'immutable'
            source.write_text(native.json_text({'counts':{'instructions':1}}));path.symlink_to(source.name)
            before=(source.read_bytes(),source.stat().st_mtime_ns)
            self.assertFalse(native.publish_json(path,{'counts':{'instructions':1}}))
            self.assertTrue(path.is_symlink());self.assertEqual((source.read_bytes(),source.stat().st_mtime_ns),before)
            self.assertTrue(native.publish_json(path,{'counts':{'instructions':2}}))
            self.assertFalse(path.is_symlink());self.assertEqual((source.read_bytes(),source.stat().st_mtime_ns),before)


if __name__ == "__main__":
    unittest.main()
