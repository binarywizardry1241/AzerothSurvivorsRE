#!/usr/bin/env python3
"""Non-compiling false-positive boundary checks for diagnostic discovery."""

import importlib.util
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import capstone

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("native_ownership", ROOT / "scripts/discover-native-ownership.py")
owner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(owner)
spec = importlib.util.spec_from_file_location("coverage_checker", ROOT / "scripts/check-reconstruction-coverage.py")
coverage = importlib.util.module_from_spec(spec)
spec.loader.exec_module(coverage)


class DiagnosticReferences(unittest.TestCase):
    def decode(self, raw, site, target=0x2000, outside=False):
        class PE:
            image_base = 0x1000
            data = raw

            def rva_offset(self, rva):
                return rva

        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        decoder.detail = True
        candidate = {"instruction_address": hex(site), "target_address": hex(target)}
        if not outside:
            candidate.update(runtime_function_start="0x1000", runtime_function_end=hex(0x1000 + len(raw)))
        result, _ = owner.decode_candidates(PE(), {"file.rs": [candidate]}, {"file.rs": []}, decoder)
        return result["file.rs"]

    def test_decoded_rip_relative_lea_keeps_exact_owner_bytes(self):
        raw = b"\x48\x8d\x05" + struct.pack("<i", 0x2000 - 0x1007) + b"\xc3"
        found = self.decode(raw, 0x1000)
        self.assertEqual(len(found["verified_references"]), 1)
        self.assertEqual(found["verified_references"][0]["instruction_bytes"], raw[:7].hex())
        self.assertEqual(found["verified_references"][0]["owner_byte_count"], len(raw))

    def test_lea_pattern_inside_mov_immediate_is_rejected(self):
        # Bytes at +2 look exactly like LEA RIP but are a movabs immediate.
        immediate = b"\x48\x8d\x05" + struct.pack("<i", 0x2000 - 0x1009) + b"\x00"
        found = self.decode(b"\x48\xb8" + immediate + b"\xc3", 0x1002)
        self.assertEqual(found["verified_references"], [])
        self.assertEqual(found["unverified_candidates"][0]["reason"],
                         "not_matching_decoded_rip_lea_from_unwind_start")

    def test_equal_displacement_with_different_target_is_rejected(self):
        raw = b"\x48\x8d\x05" + struct.pack("<i", 0x2000 - 0x1007) + b"\xc3"
        self.assertEqual(self.decode(raw, 0x1000, target=0x2001)["verified_references"], [])

    def test_no_unwind_extent_stays_unverified(self):
        found = self.decode(b"\xc3", 0x1000, outside=True)
        self.assertEqual(found["verified_references"], [])
        self.assertEqual(found["unverified_candidates"][0]["reason"], "outside_declared_unwind_extent")


class SourceMappingProjection(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/coverage-tests"
        scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.root = Path(self.temporary.name)
        self.addCleanup(self.temporary.cleanup)
        (self.root / "scripts").mkdir()
        self.tool = self.root / "scripts/discover-native-ownership.py"
        self.parser = self.root / "scripts/inventory-executable.py"
        self.tool.write_bytes(b"original native producer")
        self.parser.write_bytes(b"original candidate parser")
        subprocess.run(["git", "init", "-q"], cwd=self.root, check=True)
        subprocess.run(["git", "add", "scripts"], cwd=self.root, check=True)
        subprocess.run(["git", "-c", "user.name=Fixture", "-c", "user.email=fixture@example.invalid",
                        "commit", "-qm", "chore: fixture producer"], cwd=self.root, check=True)
        generator = dict(path="scripts/discover-native-ownership.py", sha256=self.digest(self.tool.read_bytes()),
                         candidate_parser_path="scripts/inventory-executable.py",
                         candidate_parser_sha256=self.digest(self.parser.read_bytes()), decoder="fixture", decoder_version="1")
        self.tool.write_bytes(b"current metadata join producer")
        self.target = dict(version="fixture", path="fixture.exe", sha256="a" * 64, size_bytes=123)
        names = ["crates/wenilla-rogue-app/src/screens/old.rs", "crates/wenilla-rogue-app/src/screens/new.rs"]
        self.payload = dict(schema_version=1, target=self.target, generator=generator,
                            counts=dict(diagnostic_paths=2, custom_diagnostic_paths=2,
                                        custom_paths_with_verified_references=0),
                            diagnostics=[dict(path=name, custom_game_crate=True,
                                              system_id="old" if i == 0 else "engine-selected-target-deltas",
                                              candidate_native_owners=[], verified_references=[], unverified_candidates=[])
                                         for i, name in enumerate(names)],
                            limits=["Native facts only"], native_source_ownership_complete=False, parity_verified=False)
        self.systems = dict(target=self.target, systems=[dict(original_path=name, id=sid)
                                                       for name, sid in zip(names, ["old", "new"])])
        self.mapping = self.root / "systems.json"
        self.mapping.write_text(json.dumps(self.systems))
        self.raw = self.root / "frozen.json"
        self.raw.write_text(json.dumps(self.payload))
        self.inventory = dict(path="frozen.json", sha256=self.digest(self.raw.read_bytes()), regenerate="fixture")
        self.sources = owner.execution_sources(generator, self.root)

    @staticmethod
    def digest(value):
        return hashlib.sha256(value).hexdigest()

    def project(self, **kwargs):
        return owner.project_source_mapping(self.payload, self.inventory, self.systems,
                                            self.mapping, self.sources, root=self.root, **kwargs)

    def test_mapping_only_adds_new_custom_id_without_rewriting_native_input(self):
        before = self.raw.read_bytes()
        summary = self.project()
        self.assertEqual([r["system_id"] for r in summary["custom_diagnostics"]], ["old", "new"])
        self.assertEqual(summary["inventory"], self.inventory)
        self.assertEqual(summary["generator"], self.payload["generator"])
        self.assertNotEqual(summary["source_mapping_projection"]["generator"]["sha256"], summary["generator"]["sha256"])
        self.assertEqual(self.raw.read_bytes(), before)
        self.assertEqual(self.payload["diagnostics"][1]["system_id"], "engine-selected-target-deltas")
        owner.validate_source_mapping_projection(summary, self.payload, self.systems, self.root)

    def test_native_equivalence_ignores_only_generator_and_system_labels(self):
        changed = json.loads(json.dumps(self.payload))
        changed["generator"]["sha256"] = "b" * 64
        changed["diagnostics"][1]["system_id"] = "new"
        self.assertEqual(owner.native_facts(self.payload), owner.native_facts(changed))
        for mutation in (lambda p: p["counts"].update(diagnostic_paths=3),
                         lambda p: p["target"].update(sha256="b" * 64),
                         lambda p: p["diagnostics"][0].update(candidate_native_owners=["0x1000"]),
                         lambda p: p["diagnostics"][0].update(verified_references=[{"instruction_bytes":"90"}]),
                         lambda p: p.update(native_source_ownership_complete=True)):
            mutated = json.loads(json.dumps(changed)); mutation(mutated)
            self.assertNotEqual(owner.native_facts(self.payload), owner.native_facts(mutated))

    def test_fresh_verification_keeps_its_tool_identity_separate_from_native_production(self):
        projection = self.project()["source_mapping_projection"]
        witness = dict(generator={**self.payload["generator"], **projection["generator"]},
                       native_fact_sha256=projection["native_fact_sha256"],
                       method="fresh_decode_exact_native_fact_comparison")
        summary = self.project(fresh_verification=witness)
        self.assertEqual(summary["generator"], self.payload["generator"])
        self.assertNotEqual(summary["generator"]["sha256"], summary["fresh_native_verification"]["generator"]["sha256"])
        owner.validate_source_mapping_projection(summary, self.payload, self.systems, self.root)
        for change in ({"generator":self.payload["generator"]},
                       {"native_fact_sha256":"b" * 64}, {"method":"not-a-fresh-native-check"}):
            with self.subTest(change=change), self.assertRaisesRegex(ValueError, "verification witness"):
                self.project(fresh_verification={**witness, **change})

    def test_projection_rejects_stale_mapping_and_changed_native_facts(self):
        summary = self.project()
        self.mapping.write_text(self.mapping.read_text() + "\n")
        with self.assertRaisesRegex(ValueError, "input changed"):
            owner.validate_source_mapping_projection(summary, self.payload, self.systems, self.root)
        self.mapping.write_text(json.dumps(self.systems))
        changed = json.loads(json.dumps(self.payload)); changed["diagnostics"][0]["verified_references"] = [{"instruction_bytes":"90"}]
        with self.assertRaisesRegex(ValueError, "changed native facts"):
            owner.validate_source_mapping_projection(summary, changed, self.systems, self.root)

    def test_original_producer_requires_exact_committed_bytes(self):
        self.assertEqual(self.sources[0]["sha256"], self.payload["generator"]["sha256"])
        self.assertNotEqual(self.digest(self.tool.read_bytes()), self.sources[0]["sha256"])
        wrong = json.loads(json.dumps(self.sources)); wrong[0]["sha256"] = "c" * 64
        with self.assertRaisesRegex(ValueError, "commitments differ"):
            owner.project_source_mapping(self.payload, self.inventory, self.systems,
                                         self.mapping, wrong, root=self.root)
        wrong = json.loads(json.dumps(self.sources)); wrong[0]["git_commit"] = "bad"
        with self.assertRaisesRegex(ValueError, "Invalid diagnostic native producer"):
            owner.project_source_mapping(self.payload, self.inventory, self.systems,
                                         self.mapping, wrong, root=self.root)

    def test_projection_requires_complete_current_target_mapping(self):
        for change in (lambda s: s["target"].update(sha256="b" * 64),
                       lambda s: s["systems"].pop(),
                       lambda s: s["systems"][1].update(id="old")):
            systems = json.loads(json.dumps(self.systems)); change(systems)
            self.mapping.write_text(json.dumps(systems))
            with self.assertRaises(ValueError):
                owner.project_source_mapping(self.payload, self.inventory, systems,
                                             self.mapping, self.sources, root=self.root)

    def test_accounting_accepts_historical_native_producer_only_through_valid_projection(self):
        summary = self.project(); findings = coverage.Findings()
        with patch("script_sources.load_script", return_value=owner):
            coverage.validate_diagnostic_ownership(summary, self.target, self.systems, b"", findings, self.root)
        self.assertFalse(findings.errors)
        summary["custom_diagnostics"][1]["system_id"] = "old"
        findings = coverage.Findings()
        with patch("script_sources.load_script", return_value=owner):
            coverage.validate_diagnostic_ownership(summary, self.target, self.systems, b"", findings, self.root)
        self.assertTrue(findings.errors)


if __name__ == "__main__":
    unittest.main()
