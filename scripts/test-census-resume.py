#!/usr/bin/env python3
"""Non-compiling guards for resuming the exact durable full-image census.

Fixtures are project-local files; these tests never invoke REA, Ghidra or a game.
The Program database cursor is exercised separately by real interruption/resume
validation; JSON progress alone is deliberately never treated as that cursor.
"""

from copy import deepcopy
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
from shared_analysis import SharedAnalysis


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("durable_census", ROOT / "scripts/census-native-image.py")
census = importlib.util.module_from_spec(spec)
spec.loader.exec_module(census)
store_spec = importlib.util.spec_from_file_location("manage_analysis_store", ROOT / "scripts/manage-analysis-store.py")
store_manager = importlib.util.module_from_spec(store_spec)
store_spec.loader.exec_module(store_manager)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


class DurableCensusResume(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/coverage-tests"
        scratch.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(temporary.cleanup)
        self.base = Path(temporary.name)
        self.root = self.base / "project"
        self.root.mkdir()
        self.output = self.root / "runtime/coverage/fixture/ghidra/full-image"
        self.output.mkdir(parents=True)
        self.target_file = self.root / "runtime/reference.exe"
        self.target_file.write_bytes(b"hash-bound native input; never executed")
        self.target = dict(version="0.115.0", path=str(self.target_file),
                           sha256=digest(self.target_file), size_bytes=self.target_file.stat().st_size)
        self.starts = self.output / "starts.tsv"
        self.starts.write_text("140001000\n140002000\n")
        self.script = self.root / "scripts/ghidra/ReaNativeCensus.java"
        self.script.parent.mkdir(parents=True)
        self.script.write_text("// fixture collector, never compiled\n")
        self.driver = self.root / "scripts/rea-native-census.mjs"
        self.driver.write_text("// fixture driver, never launched\n")
        self.plan = dict(
            format="rea-whole-image-native-census-v1", output=str(self.output),
            target_path=str(self.target_file), target_sha256=self.target["sha256"],
            target_version=self.target["version"], starts=str(self.starts),
            starts_sha256=digest(self.starts), seed_count=2, seed_scope="declared",
            script_sha256=digest(self.script),
            tooling={str(path.relative_to(self.root)): digest(path) for path in (self.script, self.driver)},
            startup_timeout_ms=60000, batch_size=16,
            persistence=dict(format="ghidra-program-checkpoint-v1",
                             project_root=str(self.output / "project"),
                             project_name="NativeCensus", program_name=self.target_file.name),
        )

    def validate(self, plan=None, target=None):
        return census.validate_resume_plan(self.plan if plan is None else plan,
                                           self.target if target is None else target,
                                           root=self.root)

    def test_exact_saved_plan_is_reused_without_regenerating_or_mutating_it(self):
        before = deepcopy(self.plan)
        self.assertIs(self.validate(), self.plan)
        self.assertEqual(self.plan, before)
        self.assertEqual(self.plan["startup_timeout_ms"], 60000)
        self.assertEqual(self.starts.read_text(), "140001000\n140002000\n")

    def test_same_version_replacement_target_and_wrong_version_are_rejected(self):
        for field, value in (("sha256", "b" * 64), ("version", "0.115.1")):
            with self.subTest(field=field), self.assertRaises(ValueError):
                self.validate(target={**self.target, field: value})

    def test_a_different_target_path_is_not_an_identity_match(self):
        other = self.root / "runtime/another-reference.exe"
        other.write_bytes(self.target_file.read_bytes())
        with self.assertRaises(ValueError):
            self.validate({**self.plan, "target_path": str(other)})

    def test_live_target_bytes_are_rechecked_before_resume(self):
        self.target_file.write_bytes(b"same registered version, replacement EXE")
        with self.assertRaises(ValueError):
            self.validate()

    def test_legacy_optimistic_progress_cannot_substitute_for_a_saved_program(self):
        (self.output / "progress.json").write_text(json.dumps(dict(
            target_sha256=self.target["sha256"], stage="completed", completed=2, total=2)))
        legacy = {key: value for key, value in self.plan.items() if key != "persistence"}
        with self.assertRaisesRegex(ValueError, "durable"):
            self.validate(legacy)
        with self.assertRaisesRegex(ValueError, "durable"):
            self.validate({**self.plan, "persistence": {"format": "json-progress-only"}})

    def test_seed_mutation_and_stale_seed_digest_are_rejected(self):
        with self.assertRaises(ValueError):
            self.validate({**self.plan, "starts_sha256": "c" * 64})
        self.starts.write_text(self.starts.read_text() + "140003000\n")
        with self.assertRaises(ValueError):
            self.validate()

    def test_missing_seed_input_fails_closed(self):
        self.starts.unlink()
        with self.assertRaises((ValueError, OSError)):
            self.validate()

    def test_collector_digest_and_every_tool_digest_are_rechecked(self):
        with self.assertRaises(ValueError):
            self.validate({**self.plan, "script_sha256": "d" * 64})
        for name in self.plan["tooling"]:
            with self.subTest(tool=name):
                changed = deepcopy(self.plan)
                changed["tooling"][name] = "e" * 64
                with self.assertRaises(ValueError):
                    self.validate(changed)

    def test_changed_and_missing_driver_cannot_resume_a_saved_analysis(self):
        self.driver.write_text("// changed after the plan was committed\n")
        with self.assertRaises(ValueError):
            self.validate()
        self.driver.unlink()
        with self.assertRaises((ValueError, OSError)):
            self.validate()

    def test_output_seed_and_database_paths_must_remain_under_project_runtime(self):
        source = self.root / "docs"
        source.mkdir()
        for field in ("output", "starts"):
            with self.subTest(field=field), self.assertRaises(ValueError):
                self.validate({**self.plan, field: str(source)})
        changed = deepcopy(self.plan)
        changed["persistence"]["project_root"] = str(source)
        with self.assertRaises(ValueError):
            self.validate(changed)

    def test_symlink_escape_is_rejected_even_when_the_spelling_is_under_runtime(self):
        outside = self.base / "outside"
        outside.mkdir()
        link = self.root / "runtime/escape"
        link.symlink_to(outside, target_is_directory=True)
        for field, value in (("output", str(link / "census")),
                             ("starts", str(link / "starts.tsv"))):
            with self.subTest(field=field), self.assertRaises(ValueError):
                self.validate({**self.plan, field: value})
        changed = deepcopy(self.plan)
        changed["persistence"]["project_root"] = str(link / "project")
        with self.assertRaises(ValueError):
            self.validate(changed)

    def test_tooling_paths_cannot_escape_checkout_by_traversal_or_symlink(self):
        external = self.base / "outside-tool.mjs"
        external.write_text("// same bytes cannot authorize an external tool\n")
        for name in ("../outside-tool.mjs", "scripts/escape.mjs"):
            if name.startswith("scripts/"):
                (self.root / name).symlink_to(external)
            changed = deepcopy(self.plan)
            changed["tooling"][name] = digest(external)
            with self.subTest(path=name), self.assertRaises(ValueError):
                self.validate(changed)

    def test_shared_pass_identity_ignores_task_paths_and_tuning_but_not_native_inputs(self):
        another=deepcopy(self.plan)
        another.update(output=str(self.root/'runtime/another-task'),starts=str(self.root/'runtime/another-starts.tsv'),heap='12G',batch_size=512)
        self.assertEqual(census.canonical_census_directory(self.plan,self.root),census.canonical_census_directory(another,self.root))
        for field,value in [('target_sha256','a'*64),('starts_sha256','b'*64),('script_sha256','c'*64)]:
            changed={**another,field:value}
            self.assertNotEqual(census.canonical_census_directory(self.plan,self.root),census.canonical_census_directory(changed,self.root))

    def test_shared_pass_publishes_once_and_task_alias_preserves_exact_inputs(self):
        plan=deepcopy(self.plan);plan['persistence'].update(shared_workspace=True,project_root=str(self.root/'runtime/analysis/programs'/self.target['sha256']/'census'))
        frozen,directory=census.publish_census_plan(plan,self.output,self.target,self.root)
        self.assertTrue(self.output.is_symlink())
        self.assertEqual(self.output.resolve(),directory)
        self.assertEqual(digest(Path(frozen['starts'])),plan['starts_sha256'])
        before=(directory/'plan.json').read_bytes()
        another=self.root/'runtime/another-task';another.mkdir()
        (another/'starts.tsv').write_bytes(self.starts.read_bytes())
        second=deepcopy(plan);second.update(output=str(another),starts=str(another/'starts.tsv'),heap='12G')
        resumed,same=census.publish_census_plan(second,another,self.target,self.root)
        self.assertEqual(same,directory);self.assertEqual(resumed,frozen)
        self.assertEqual((directory/'plan.json').read_bytes(),before)
        self.assertTrue(another.is_symlink())

    def test_only_explicit_exact_archived_predecessor_can_bridge_storage_driver_changes(self):
        name='scripts/rea-native-census.mjs';expected=digest(self.driver);original=self.driver.read_bytes()
        self.driver.write_text('// new storage adapter\n')
        with self.assertRaises(ValueError):self.validate()
        archived=self.root/'runtime/analysis/tools'/expected/self.driver.name;archived.parent.mkdir(parents=True);archived.write_bytes(original)
        with patch.dict(census.STORAGE_PREDECESSORS,{name:expected}):
            self.assertIs(self.validate(),self.plan)
            archived.write_text('// corrupted old source\n')
            with self.assertRaises(ValueError):self.validate()

    def test_canonical_pass_rebases_hash_bound_input_alias_and_recovers_interrupted_rebase(self):
        object=self.root/'runtime/objects/proof.bin';object.parent.mkdir(parents=True);object.write_bytes(b'original immutable proof bytes')
        requested=self.root/'runtime/shallow-task';requested.mkdir();(requested/'starts.tsv').write_bytes(self.starts.read_bytes())
        alias=requested/'proof.bin'
        import os
        old_value=os.path.relpath(object,alias.parent)
        alias.symlink_to(old_value)
        plan=deepcopy(self.plan);plan.update(output=str(requested),starts=str(requested/'starts.tsv'));plan['persistence'].update(shared_workspace=True,project_root=str(self.root/'runtime/analysis/programs'/self.target['sha256']/'census'))
        frozen,directory=census.publish_census_plan(plan,requested,self.target,self.root)
        self.assertEqual(digest(directory/'proof.bin'),digest(object));self.assertEqual(digest(alias),digest(object))
        moved=directory/'proof.bin';moved.unlink();moved.symlink_to(old_value)
        self.assertFalse(moved.exists())
        census.restore_census_aliases(frozen,self.root)
        self.assertEqual(digest(moved),digest(object))

    def test_completed_pass_exports_share_one_inode_without_changing_resume_paths(self):
        def completed(output):
            output.mkdir(parents=True, exist_ok=True)
            plan = {**self.plan, "output": str(output)}
            path = output / "plan.json"
            path.write_text(json.dumps(plan))
            files = {}
            for name in store_manager.CENSUS_EXPORTS:
                export = output / name
                export.write_bytes(gzip.compress(name.encode(), mtime=0))
                files[name] = {"sha256": digest(export), "bytes": export.stat().st_size}
            progress = dict(stage="completed", plan_sha256=digest(path),
                            target_sha256=plan["target_sha256"], script_sha256=plan["script_sha256"],
                            files=files)
            (output / "progress.json").write_text(json.dumps(progress))
            return path, progress

        first, progress = completed(self.output)
        second, _ = completed(self.root / "runtime/another-pass")
        source = first.with_name("instructions.tsv.gz")
        peer = second.with_name(source.name)
        saved_progress = first.with_name("progress.json").read_bytes()
        self.assertFalse(source.samefile(peer))
        store = SharedAnalysis(self.root)
        canonical = store.object_path(progress["files"][source.name]["sha256"])
        # A corrupt pass must fail before any of its files are consolidated.
        corrupt = second.with_name("externals.tsv.gz")
        original = corrupt.read_bytes()
        corrupt.write_bytes(gzip.compress(b"wrong export", mtime=0))
        with self.assertRaisesRegex(ValueError, "differs from its saved commitment"):
            store_manager.share_census_exports(second, self.root)
        self.assertFalse(canonical.exists())
        corrupt.write_bytes(original)

        store_manager.share_census_exports(first, self.root)
        store_manager.share_census_exports(second, self.root)
        self.assertTrue(source.samefile(canonical) and peer.samefile(canonical))
        self.assertEqual(peer.resolve(), peer)  # Existing launchers require an in-pass path.
        self.assertEqual(peer.stat().st_mode & 0o222, 0)
        self.assertEqual(gzip.decompress(peer.read_bytes()), source.name.encode())
        self.assertEqual(first.with_name("progress.json").read_bytes(), saved_progress)
        self.assertEqual(store_manager.share_census_exports(second, self.root)["shared"], 0)


if __name__ == "__main__":
    unittest.main()
