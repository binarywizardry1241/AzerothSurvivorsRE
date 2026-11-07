#!/usr/bin/env python3
"""Non-compiling regressions for coverage accounting's false-positive boundaries."""

import copy
import hashlib
import importlib.util
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import coverage_common as common

ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("coverage_check", ROOT / "scripts/check-reconstruction-coverage.py")
check = importlib.util.module_from_spec(spec)
spec.loader.exec_module(check)


class LatestSuppliedTarget(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/tests/coverage"
        scratch.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.registry = self.root / "targets.json"
        for key, value in (("ROOT", self.root), ("REGISTRY", self.registry)):
            context = patch.object(common, key, value)
            context.start()
            self.addCleanup(context.stop)
        self.records = []

    def add(self, version, payload=b"fixture", suffix=""):
        directory = self.root / ("revision" + suffix)
        directory.mkdir(exist_ok=True)
        path = directory / f"AzerothSurvivors-{version}.exe"
        path.write_bytes(payload)
        row = {"version": version, "path": path.relative_to(self.root).as_posix(), "sha256": hashlib.sha256(payload).hexdigest(), "size_bytes": len(payload), "identity_manifest": "targets.json"}
        self.records.append(row)
        return row

    def write(self, selected=None):
        value = {"schema_version": 1, "supplied_roots": ["."], "targets": self.records}
        if selected:
            value["selected_sha256_by_version"] = selected
        self.registry.write_text(common.json_text(value))

    def test_highest_semantic_version_wins_without_mtime(self):
        self.add("0.99.0")
        self.add("0.105.0")
        self.write()
        self.assertEqual(common.latest_target()["version"], "0.105.0")

    def test_unregistered_newer_exe_stops_stale_coverage(self):
        self.add("0.105.0")
        self.write()
        self.add("0.106.0")
        with self.assertRaisesRegex(ValueError, "Unregistered newer"):
            common.latest_target()

    def test_missing_latest_does_not_fall_back(self):
        self.add("0.99.0")
        latest = self.add("0.105.0", b"latest")
        self.write()
        (self.root / latest["path"]).unlink()
        with self.assertRaisesRegex(ValueError, "never fall back"):
            common.latest_target()

    def test_changed_same_version_bytes_are_not_old_evidence(self):
        row = self.add("0.105.0")
        self.write()
        (self.root / row["path"]).write_bytes(b"changed")
        with self.assertRaisesRegex(ValueError, "Unregistered"):
            common.latest_target()

    def test_same_version_successor_requires_explicit_hash_choice(self):
        self.add("0.105.0", b"first", "-old")
        new = self.add("0.105.0", b"second", "-new")
        self.write()
        with self.assertRaisesRegex(ValueError, "Multiple hashes"):
            common.latest_target()
        self.write({"0.105.0": new["sha256"]})
        self.assertEqual(common.latest_target()["sha256"], new["sha256"])


class CoverageAccounting(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/tests/coverage"
        scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        (self.root / "source.rs").write_text("fn main() {}\n")
        (self.root / "evidence.md").write_text("Bounded evidence, not whole-system parity.\n")
        self.original = "crates/wenilla-rogue/src/game/new_system.rs"
        self.data = b"prefix\0" + self.original.encode() + b"\0suffix"
        self.target = {"version": "0.105.0", "path": "game.exe", "sha256": hashlib.sha256(self.data).hexdigest()}
        system = {
            "id": "game.new_system", "original_path": self.original,
            "native_path_evidence": [{"file_offset": "0x7", "byte_count": len(self.original), "sha256": hashlib.sha256(self.original.encode()).hexdigest()}],
            "source_refs": ["source.rs"], "evidence_refs": ["evidence.md"], "gap_ids": [41],
            "remaining_source_work": ["Recover the actual input, state transition and consumer."],
        }
        for dimension in check.DIMENSIONS:
            system[dimension] = {"status": "partial" if dimension in ("recovery", "implementation") else "unverified", "summary": "Bounded scope remains open."}
        self.ledger = {"target": self.target, "systems": [system]}

    def validate(self, ledger=None, data=None):
        findings = check.Findings()
        check.validate_systems(ledger or self.ledger, self.target, self.data if data is None else data, {41}, findings, self.root)
        return findings

    def test_honest_partial_coverage_passes_and_preserves_remaining_work(self):
        findings = self.validate()
        self.assertEqual(findings.errors, [])
        self.assertEqual(findings.warnings[0]["category"], "open_source_recovery")

    def test_new_native_path_cannot_be_hidden_by_old_fifty_one_count(self):
        data = self.data + b"\0crates/wenilla-rogue/src/game/previously_unknown.rs\0"
        findings = self.validate(data=data)
        self.assertTrue(any(error["category"] == "path_accounting" for error in findings.errors))

    def test_missing_implementation_can_be_accounted_without_fake_source_refs(self):
        ledger = copy.deepcopy(self.ledger)
        ledger["systems"][0]["implementation"]["status"] = "missing"
        ledger["systems"][0]["source_refs"] = []
        self.assertEqual(self.validate(ledger).errors, [])

    def test_relocated_or_changed_range_is_rejected(self):
        ledger = copy.deepcopy(self.ledger)
        ledger["systems"][0]["native_path_evidence"][0]["file_offset"] = "0x8"
        self.assertTrue(any(error["category"] == "native_path" for error in self.validate(ledger).errors))

    def test_old_target_mapping_is_rejected(self):
        ledger = copy.deepcopy(self.ledger)
        ledger["target"] = dict(self.target, version="0.97.2")
        self.assertTrue(any(error["category"] == "target_identity" for error in self.validate(ledger).errors))

    def test_duplicate_mapping_and_missing_gap_are_rejected(self):
        ledger = copy.deepcopy(self.ledger)
        ledger["systems"].append(copy.deepcopy(ledger["systems"][0]))
        ledger["systems"][0]["gap_ids"] = [999]
        categories = {error["category"] for error in self.validate(ledger).errors}
        self.assertTrue({"system_id", "path_accounting", "gap_ownership"} <= categories)

    def test_filename_presence_cannot_certify_complete_recovery(self):
        ledger = copy.deepcopy(self.ledger)
        ledger["systems"][0]["recovery"]["status"] = "complete"
        self.assertTrue(any(error["category"] == "completion_claim" for error in self.validate(ledger).errors))

    def test_source_change_is_flagged_without_discarding_its_mapping(self):
        ledger = copy.deepcopy(self.ledger)
        ledger["reviewed_source_hashes"] = {"source.rs": "0" * 64}
        findings = self.validate(ledger)
        self.assertEqual(findings.errors, [])
        self.assertTrue(any(item["category"] == "stale_source_review" for item in findings.warnings))

    def test_references_cannot_leave_workspace(self):
        ledger = copy.deepcopy(self.ledger)
        ledger["systems"][0]["source_refs"] = ["../outside.rs"]
        self.assertTrue(any(error["category"] == "references" for error in self.validate(ledger).errors))

    def test_release_context_cannot_certify_individual_claim(self):
        ledger = {"target": self.target, "entries": [{"id": "0.105.0:abc", "release": "0.105.0", "text": "A supplied claim.", "status": "complete", "target_sha256": self.target["sha256"], "mapping_basis": "release_context_only", "source_refs": ["source.rs"], "evidence_refs": ["evidence.md"]}]}
        findings = check.Findings()
        check.validate_changelog(ledger, self.target, self.ledger, {41}, findings, self.root)
        self.assertTrue(any(error["category"] == "completion_claim" for error in findings.errors))

    def test_summary_cannot_hide_incomplete_native_ownership(self):
        findings = check.Findings()
        summary = {"counts": {"custom_game_diagnostic_paths": 1}, "ownership_complete": True}
        check.validate_summary(summary, self.ledger, 1, findings)
        self.assertTrue(any(error["category"] == "completion_claim" for error in findings.errors))

    def diagnostic_summary(self):
        return {"target": self.target,
                "generator": {"path": "source.rs", "sha256": hashlib.sha256((self.root / "source.rs").read_bytes()).hexdigest(),
                              "candidate_parser_path": "evidence.md", "candidate_parser_sha256": hashlib.sha256((self.root / "evidence.md").read_bytes()).hexdigest()},
                "inventory": {"path": "absent-disposable.json", "sha256": "0" * 64},
                "custom_diagnostics": [{"path": self.original, "system_id": "game.new_system", "verified_instruction_references": 1}],
                "counts": {"custom_diagnostic_paths": 1, "custom_paths_with_verified_references": 1},
                "native_source_ownership_complete": False, "parity_verified": False}

    def test_decoded_diagnostics_do_not_depend_on_disposable_bulk_file(self):
        findings = check.Findings()
        check.validate_diagnostic_ownership(self.diagnostic_summary(), self.target, self.ledger, self.data, findings, self.root)
        self.assertEqual(findings.errors, [])
        self.assertEqual(findings.warnings[0]["category"], "disposable_inventory_absent")

    def test_decoded_diagnostics_reject_wrong_system_or_missing_path(self):
        for rows in ([], [{"path": self.original, "system_id": "other", "verified_instruction_references": 1}]):
            summary = self.diagnostic_summary()
            summary["custom_diagnostics"] = rows
            findings = check.Findings()
            check.validate_diagnostic_ownership(summary, self.target, self.ledger, self.data, findings, self.root)
            self.assertTrue(any(error["category"] == "diagnostic_ownership" for error in findings.errors))

    def test_decoded_path_count_does_not_certify_native_semantics(self):
        summary = self.diagnostic_summary()
        summary["native_source_ownership_complete"] = True
        findings = check.Findings()
        check.validate_diagnostic_ownership(summary, self.target, self.ledger, self.data, findings, self.root)
        self.assertTrue(any(error["category"] == "completion_claim" for error in findings.errors))

    def instruction_summary(self):
        scripts = self.root / "scripts"
        scripts.mkdir(exist_ok=True)
        parser = scripts / "inventory-executable.py"
        parser.write_text("fixture parser")
        tool = scripts / "inventory-native-instructions.py"
        tool.write_text("fixture decoder")
        return dict(target=self.target,
                    generator=dict(path="scripts/inventory-native-instructions.py", sha256=common.file_sha256(tool),
                                   parser_sha256=common.file_sha256(parser)),
                    inventory=dict(path="runtime/absent.sqlite", sha256="a" * 64),
                    counts=dict(unwind_extents=3, processed_extents=3, pending_extents=0,
                                completely_decoded_extents=2, extents_with_undecoded_suffix=1,
                                linear_instruction_records=20, decoded_bytes_summed=80,
                                decoded_bytes_union=70, undecoded_suffix_bytes_summed=2,
                                executable_bytes_outside_unwind_extents=10),
                    declared_extent_pass_complete=True, native_semantics_complete=False,
                    parity_verified=False, gap_ids=[41], limits=["Linear decode only"])

    def validate_instructions(self, summary):
        findings = check.Findings()
        check.validate_instruction_summary(summary, self.target,
            dict(runtime_function_records=3, executable_bytes_outside_runtime_function_extents=10),
            findings, self.root)
        return findings

    def test_complete_linear_pass_retains_missing_database_as_reproducible_limit(self):
        findings = self.validate_instructions(self.instruction_summary())
        self.assertEqual(findings.errors, [])
        self.assertEqual(findings.warnings[0]["category"], "disposable_inventory_absent")

    def test_linear_pass_rejects_incomplete_or_changed_extent_denominator(self):
        for changed in (dict(pending_extents=1), dict(unwind_extents=2), dict(decoded_bytes_union=81),
                        dict(executable_bytes_outside_unwind_extents=0), dict(completely_decoded_extents=-1)):
            summary = self.instruction_summary()
            summary["counts"].update(changed)
            self.assertTrue(any(error["category"] == "instruction_coverage"
                                for error in self.validate_instructions(summary).errors))

    def test_linear_pass_cannot_close_native_semantics_parity_or_gap_ownership(self):
        for changed in (dict(native_semantics_complete=True), dict(parity_verified=True), dict(gap_ids=[])):
            summary = {**self.instruction_summary(), **changed}
            self.assertTrue(any(error["category"] == "completion_claim"
                                for error in self.validate_instructions(summary).errors))

    def test_linear_pass_rejects_stale_tool_target_and_inventory_digest(self):
        summary = self.instruction_summary()
        summary["generator"]["sha256"] = "b" * 64
        self.assertTrue(any(error["category"] == "instruction_generator"
                            for error in self.validate_instructions(summary).errors))
        summary = self.instruction_summary()
        summary["target"] = {**self.target, "sha256": "b" * 64}
        self.assertTrue(any(error["category"] == "target_identity"
                            for error in self.validate_instructions(summary).errors))
        summary = self.instruction_summary()
        database = self.root / summary["inventory"]["path"]
        database.parent.mkdir(exist_ok=True)
        database.write_bytes(b"changed database")
        self.assertTrue(any(error["category"] == "instruction_inventory"
                            for error in self.validate_instructions(summary).errors))


if __name__ == "__main__":
    unittest.main()
