#!/usr/bin/env python3
"""Non-compiling seeded-census/tool-repair regressions; no provider or game."""

import hashlib
import importlib.util
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


repair = module("seed_repair", "scripts/repair-rea-seeded-bodies.py")
census = module("seed_census", "scripts/census-current-target.py")
summary = module("seed_summary", "scripts/summarize-seeded-census.py")


class ToolRepair(unittest.TestCase):
    def test_exact_repair_is_idempotent_and_unknown_dependency_changes_fail_closed(self):
        fixtures = {"bridge/ghidra/ReaGhidraApplySeeds.java": b'class Seed { String format = "rea-ghidra-seeds-v1";\n        String[] args = getScriptArgs();\n        String report = "";\n}',
                    "dist/ghidra/GhidraAnalysisSeeds.js": b'const format = "rea-ghidra-seeds-v1";'}
        scratch = ROOT / "runtime/coverage-tests"
        scratch.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=scratch) as folder, patch.dict(
                repair.UPSTREAM, {k: hashlib.sha256(v).hexdigest() for k,v in fixtures.items()}, clear=True):
            root = Path(folder)
            for name, source in fixtures.items():
                path = root / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes(source)
            first = repair.changes(root)
            self.assertTrue(all(changed for _, _, changed in first))
            for path, source, _ in first:
                path.write_bytes(source)
            self.assertTrue(all(not changed for _, _, changed in repair.changes(root)))
            java = (root / next(iter(fixtures))).read_text()
            self.assertIn("fixupFunctionBody", java)
            self.assertLess(java.index("setAnalysisOption"), java.index("getScriptArgs"))
            self.assertIn(repair.FORMAT, java)
            first[0][0].write_text(java + "// unknown edit\n")
            with self.assertRaisesRegex(ValueError, "Unrecognized upstream"):
                repair.changes(root)

    def test_patched_seed_profile_has_distinct_body_semantics_and_preserves_old_profiles(self):
        _, env = census.configuration(False, census.SELECTED_PROFILE, 600, {})
        self.assertIn("Call Convention ID", env["REA_GHIDRA_DISABLED_ANALYZERS"])
        self.assertIn("Disassemble Entry Points", env["REA_GHIDRA_DISABLED_ANALYZERS"])
        self.assertNotIn("Call Convention ID", census.FULL_PROFILES["full-image-no-address-tables"])
        selection = dict(format=repair.FORMAT, seed_sha256="a" * 64,
                         mappings=[dict(reference=dict(runtime_function_start="0x1000"))])
        state = dict(selection=selection, analysis_environment=dict(REA_GHIDRA_DISABLED_ANALYZERS=""))
        record = dict(analysis_profile=dict(digest="profile", parameters=dict(analysis_seeds=dict(
            format=repair.FORMAT, sha256="a" * 64, entries=dict(function=1, code=1, label=0)))))
        census.validate_native_profile(record, state)
        for key, value in (("format", "rea-ghidra-seeds-v1"), ("sha256", "b" * 64),
                           ("entries", dict(function=0, code=1, label=0))):
            changed = {**record["analysis_profile"]["parameters"]["analysis_seeds"], key:value}
            with self.assertRaisesRegex(ValueError, "seed commitment"):
                census.validate_native_profile(dict(analysis_profile=dict(digest="profile", parameters=dict(analysis_seeds=changed))), state)

    def test_complete_selected_queue_is_not_reported_as_complete_discovery(self):
        state = census.summarize(dict(queue_basis="caller_selected_diagnostic_owners_not_procedure_discovery"),
                                 [dict(status="completed", instruction_count=1, body_bytes=1)])
        self.assertTrue(state["selected_queue_operations_complete"])
        self.assertFalse(state["discovered_queue_operations_complete"])
        self.assertFalse(state["all_image_native_semantics_and_edges_complete"])


class BodyChecks(unittest.TestCase):
    def test_duplicate_unordered_and_invalid_instruction_addresses_are_rejected(self):
        for lines in (["0x1000: RET", "0x1000: RET"], ["0x1001: RET", "0x1000: RET"], ["capped preview"]):
            with self.assertRaises(ValueError):
                summary.instruction_addresses(lines)

    def test_real_one_byte_return_and_clipped_multibyte_body_are_distinguished(self):
        import capstone
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        class PE:
            image_base = 0x1000
            data = b"\xc3\x48\x89\xc0"
            def rva_offset(self, address): return address
        def body(at):
            return dict(available=True, contains_entry=True, total_bytes=1,
                        ranges=[dict(start=hex(at), end=hex(at))])
        result, addresses = summary.body_observation(body(0x1000), ["0x1000: RET"], PE(), decoder)
        self.assertEqual(addresses, {0x1000})
        self.assertTrue(result["independent_linear_boundaries_match"])
        with self.assertRaisesRegex(ValueError, "clips an observed instruction"):
            summary.body_observation(body(0x1001), ["0x1001: MOV RAX,RAX"], PE(), decoder)

    def test_noncontiguous_bodies_and_exact_source_ranges_are_preserved(self):
        import capstone
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        class PE:
            image_base = 0x1000
            data = b"\xc3\xcc\xcc\xc3"
            def rva_offset(self, address): return address
        body = dict(available=True, contains_entry=True, total_bytes=2,
                    ranges=[dict(start="0x1000", end="0x1000"), dict(start="0x1003", end="0x1003")])
        result, _ = summary.body_observation(body, ["0x1000: RET", "0x1003: RET"], PE(), decoder)
        self.assertEqual(result["body_bytes"], 2)
        self.assertTrue(result["independent_linear_boundaries_match"])
        self.assertEqual([r["file_offset"] for r in result["ranges"]], ["0x0", "0x3"])
        with self.assertRaisesRegex(ValueError, "byte count differs"):
            summary.body_observation({**body, "total_bytes":4}, ["0x1000: RET", "0x1003: RET"], PE(), decoder)


if __name__ == "__main__":
    unittest.main()
