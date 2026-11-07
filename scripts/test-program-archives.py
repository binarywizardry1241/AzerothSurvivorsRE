#!/usr/bin/env python3
"""Lossless Program archival/recovery fixtures; no Ghidra or application runs."""

import fcntl
import io
import importlib.util
import json
import os
from pathlib import Path
import tarfile
import tempfile
import subprocess
import sys
import unittest
from unittest.mock import patch

from shared_analysis import file_digest
import shared_program_archives as programs
from shared_analysis import SharedAnalysis

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("manage_program_archives", ROOT / "scripts/manage-program-archives.py")
MANAGE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MANAGE)


class ProgramArchiveTests(unittest.TestCase):
    def test_queued_consumers_keep_program_hot_and_dead_waiters_are_retired(self):
        waiters = self.root / "runtime/analysis/requests/waiters/fixture"
        waiters.mkdir(parents=True)
        path = waiters / "request.waiting"
        descriptor = os.open(path, os.O_CREAT | os.O_RDWR, 0o600)
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX)
            with patch.object(MANAGE, "ROOT", self.root):
                self.assertTrue(MANAGE.queued_requests(waiters))
            self.assertTrue(path.exists())
        finally:
            os.close(descriptor)
        with patch.object(MANAGE, "ROOT", self.root):
            self.assertFalse(MANAGE.queued_requests(waiters))
        self.assertFalse(path.exists())

    def setUp(self):
        scratch = ROOT / "runtime/tests/program-archive"
        scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.root = Path(self.temporary.name)
        self.project = self.root / "runtime/history/project"
        self.project.mkdir(parents=True)
        self.original = {"Saved.gpr": b"<project>saved</project>\n",
                         "Saved.rep/idata/00/Program.db": b"instruction references\0" * 10000,
                         "Saved.rep/user": b"progress and user metadata"}
        for name, data in self.original.items():
            path = self.project / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(data)
            path.chmod(0o640)
            os.utime(path, ns=(1234567890123456789, 1234567890123456789))

    def tearDown(self):
        self.temporary.cleanup()
        try:
            (ROOT / "runtime/tests/program-archive").rmdir()
        except OSError:
            pass

    def archive(self):
        return programs.archive_program(self.project, self.root, check_processes=False)

    def ensure(self):
        return programs.ensure_program_available(self.project, self.root, check_processes=False)

    def assert_restored(self):
        for name, expected in self.original.items():
            path = self.project / name
            self.assertEqual(path.read_bytes(), expected)
            self.assertEqual(path.stat().st_mode & 0o777, 0o640)
            self.assertEqual(path.stat().st_mtime_ns, 1234567890123456789)

    def test_archive_restore_preserves_every_byte_mode_timestamp_and_progress(self):
        result = self.archive()
        self.assertEqual(result["state"], "cold")
        self.assertGreater(result["reclaimed_allocated_bytes_estimate"], 0)
        self.assertFalse((self.project / "Saved.gpr").exists())
        self.assertFalse((self.project / "Saved.rep").exists())
        descriptor = json.loads((self.project / programs.DESCRIPTOR).read_text())
        self.assertEqual(descriptor["state"], "cold")
        self.assertTrue(self.ensure()["restored"])
        self.assert_restored()
        self.assertFalse(self.ensure()["restored"])
        self.assertEqual(programs.list_archives(self.root)[0]["state"], "hot")

    def automatic(self):
        return programs.archive_program(self.project, self.root, check_processes=False, automatic_cache=True)

    def change_generation(self, generation):
        self.ensure()
        (self.project / "Saved.rep/user").write_bytes(("new query generation " + str(generation)).encode())

    def test_three_automatic_generations_keep_only_current_cache(self):
        first = self.automatic()
        self.assertEqual(first["retention"], "automatic-cache")
        old_ids = [first["archive_id"]]
        for generation in [2, 3]:
            self.change_generation(generation)
            result = self.automatic()
            self.assertTrue(result["cache_retirement"][0]["retired"])
            rows = programs.list_archives(self.root)
            self.assertEqual(len(rows), 1)
            self.assertNotIn(rows[0]["archive_id"], old_ids)
            old_ids.append(rows[0]["archive_id"])
            store = SharedAnalysis(self.root)
            self.assertEqual(store.verify()["objects"], 1)
            with store.connect() as connection:
                self.assertEqual(connection.execute("SELECT count(*) FROM program_archive_retirements").fetchone()[0], 0)

    def test_manual_pin_survives_later_automatic_cache_generations(self):
        manual = self.archive()
        self.change_generation(2)
        self.automatic()
        self.change_generation(3)
        self.automatic()
        rows = programs.list_archives(self.root)
        self.assertEqual(len(rows), 2)
        self.assertIn((manual["archive_id"], "pinned"), [(r["archive_id"], r["retention"]) for r in rows])
        self.assertEqual(SharedAnalysis(self.root).verify()["objects"], 2)

    def test_retired_historical_program_keeps_export_and_invalidates_resume(self):
        target = "a" * 64
        parent = self.project.parent / target
        parent.mkdir()
        moved = parent / "project"
        self.project.rename(moved)
        self.project = moved
        saved = self.archive()
        receipt = json.loads((moved / programs.DESCRIPTOR).read_text())["receipt"]
        store = SharedAnalysis(self.root)
        proof = store.put_bytes(b"prior native instructions", "frozen-native-census-export")
        ready = parent / "ready.json"
        ready.write_text(json.dumps({"target_sha256": target, "ready": True}))
        alias = self.root / "runtime/historical-program.tar.gz"
        store.link_alias(alias, receipt)
        with self.assertRaisesRegex(ValueError, "path does not bind"):
            programs.retire_historical_program(moved, "b" * 64, self.root, check_processes=False)
        blocked = programs.retire_historical_program(moved, target, self.root, check_processes=False)
        self.assertFalse(blocked["retired"])
        self.assertTrue(ready.exists())
        alias.unlink()
        with store.connect() as connection:
            connection.execute("DELETE FROM analysis_aliases WHERE path=?", (alias.relative_to(self.root).as_posix(),))
        relocated = parent / "retained"
        moved.rename(relocated)
        moved.symlink_to(relocated, target_is_directory=True)
        self.project = relocated
        retired = programs.retire_historical_program(relocated, target, self.root, check_processes=False)
        self.assertEqual(retired["archive_id"], saved["archive_id"])
        self.assertTrue(retired["retired"])
        self.assertFalse(ready.exists())
        self.assertFalse((self.root / receipt["path"]).exists())
        self.assertEqual(store.verify_receipt(proof).read_bytes(), b"prior native instructions")
        with self.assertRaisesRegex(ValueError, "historical Program was retired"):
            self.ensure()
        self.assertTrue(programs.retire_historical_program(relocated, target, self.root, check_processes=False)["already_retired"])

    def test_handover_retires_expanded_program_without_creating_archive(self):
        target = "c" * 64
        parent = self.project.parent / target
        parent.mkdir()
        moved = parent / "project"
        self.project.rename(moved)
        (parent / "workspace.json").write_text(json.dumps({"identity": {"target_sha256": target}}))
        with patch.object(programs, "_remove_verified_originals", side_effect=OSError("interrupted handover")):
            with self.assertRaisesRegex(OSError, "interrupted handover"):
                programs.retire_historical_program(moved, target, self.root, check_processes=False)
        self.assertEqual(json.loads((moved / programs.DESCRIPTOR).read_text())["state"], "retiring-expanded")
        result = programs.retire_historical_program(moved, target, self.root, check_processes=False)
        self.assertTrue(result["retired"])
        self.assertFalse((moved / "Saved.rep").exists())
        self.assertEqual(programs.list_archives(self.root), [])

    def test_automatic_archive_removes_runner_scratch_but_keeps_query_receipts(self):
        runtime = self.project.parent / "runtime"
        temporary = runtime / "tmp" / "ghidra.cache"
        temporary.parent.mkdir(parents=True)
        temporary.write_bytes(b"temporary provider bytes")
        empty_cache = runtime / "cache" / "empty-ghidra" / "fscache2"
        (empty_cache / "new").mkdir(parents=True)
        (empty_cache / ".lastmaint").write_text("timestamp")
        populated_cache = runtime / "cache" / "populated-ghidra" / "fscache2"
        populated_cache.mkdir(parents=True)
        (populated_cache / ".lastmaint").write_text("timestamp")
        (populated_cache / "cached").write_bytes(b"cached data")
        config = runtime / "config" / "preferences"
        config.parent.mkdir()
        config.write_bytes(b"preferences")
        attempts = self.project.parent / "attempts"
        completed = attempts / "completed"
        failed = attempts / "failed"
        completed.mkdir(parents=True)
        failed.mkdir()
        (completed / "bridge-stdout.log").write_text("REPORT: Save succeeded for processed file:")
        (completed / "prepare.json").write_text("{}")
        (failed / "bridge-stdout.log").write_text("ERROR analysis did not finish")
        self.automatic()
        self.assertFalse(temporary.exists())
        self.assertFalse(empty_cache.parent.exists())
        self.assertTrue((populated_cache / ".lastmaint").is_file())
        self.assertTrue((populated_cache / "cached").is_file())
        self.assertTrue(config.is_file())
        self.assertFalse((completed / "bridge-stdout.log").exists())
        self.assertTrue((completed / "prepare.json").is_file())
        self.assertTrue((failed / "bridge-stdout.log").is_file())

    def test_external_alias_keeps_previous_automatic_archive(self):
        previous = self.automatic()
        descriptor = json.loads((self.project / programs.DESCRIPTOR).read_text())
        store = SharedAnalysis(self.root)
        alias = self.root / "runtime/evidence/pinned-program.tar.gz"
        store.link_alias(alias, descriptor["receipt"], {"purpose": "external evidence"})
        self.change_generation(2)
        result = self.automatic()
        self.assertFalse(result["cache_retirement"][0]["retired"])
        self.assertEqual(file_digest(alias), descriptor["receipt"]["sha256"])
        self.assertEqual(len(programs.list_archives(self.root)), 2)

    def test_native_snapshot_reference_keeps_previous_automatic_archive(self):
        self.automatic()
        descriptor = json.loads((self.project / programs.DESCRIPTOR).read_text())
        store = SharedAnalysis(self.root)
        with store.connect() as connection:
            connection.execute("CREATE TABLE native_snapshots(id TEXT PRIMARY KEY,archive_json TEXT)")
            connection.execute("INSERT INTO native_snapshots VALUES(?,?)", ("external", json.dumps(descriptor["receipt"])))
        self.change_generation(2)
        result = self.automatic()
        self.assertFalse(result["cache_retirement"][0]["retired"])
        self.assertTrue(any("native_snapshots" in reason for reason in result["cache_retirement"][0]["reasons"]))
        store.verify_receipt(descriptor["receipt"])

    def test_interrupted_new_archive_never_retires_previous_cache(self):
        previous = self.automatic()
        receipt = json.loads((self.project / programs.DESCRIPTOR).read_text())["receipt"]
        self.change_generation(2)
        with patch.object(programs, "_remove_verified_originals", side_effect=RuntimeError("interrupted new snapshot")):
            with self.assertRaisesRegex(RuntimeError, "interrupted new snapshot"):
                self.automatic()
        store = SharedAnalysis(self.root)
        store.verify_receipt(receipt)
        self.assertIn(previous["archive_id"], [r["archive_id"] for r in programs.list_archives(self.root)])
        # Resuming the verified cold publication safely finishes the transition.
        self.automatic()
        self.assertEqual(len(programs.list_archives(self.root)), 1)

    def test_interrupted_retirement_recovers_without_duplicate_growth(self):
        self.automatic()
        old_receipt = json.loads((self.project / programs.DESCRIPTOR).read_text())["receipt"]
        self.change_generation(2)
        old_path = self.root / old_receipt["path"]
        unlink = Path.unlink

        def interrupted(path, *args, **kwargs):
            if path == old_path:
                raise OSError("interrupted old cache unlink")
            return unlink(path, *args, **kwargs)

        with patch.object(Path, "unlink", interrupted):
            with self.assertRaisesRegex(OSError, "interrupted old cache unlink"):
                self.automatic()
        self.assertTrue(old_path.exists())
        self.automatic()
        self.assertFalse(old_path.exists())
        self.assertEqual(SharedAnalysis(self.root).verify()["objects"], 1)

    def test_live_program_lease_blocks_archive(self):
        with (self.project.parent / "program.lock").open("w") as stream:
            fcntl.flock(stream, fcntl.LOCK_EX | fcntl.LOCK_NB)
            with self.assertRaisesRegex(ValueError, "runner owns"):
                self.archive()
        self.assert_restored()

    def test_unheld_ghidra_lock_bytes_and_unfinished_checkpoint_survive_archive(self):
        extra = {"Saved.lock": b"#Ghidra Lock File\n<supports File Channel Locking>\n",
                 "Saved.lock~": b"", "Saved.rep/idata/00/unfinished.ps": b"unique unfinished transaction" * 100}
        for name, data in extra.items():
            path = self.project / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(data)
        self.archive()
        self.ensure()
        for name, expected in extra.items():
            self.assertEqual((self.project / name).read_bytes(), expected)

    def headless_command(self, project):
        return (f"/installed/jdk/bin/java -cp {self.root}/tools/ghidra/Utility.jar "
                f"ghidra.Ghidra ghidra.app.util.headless.AnalyzeHeadless {project} Saved\n")

    def test_restore_allows_a_different_identified_headless_project(self):
        self.archive()
        command = self.headless_command(self.root / "runtime/other/project")
        with patch.object(programs.subprocess, "check_output", return_value=command):
            self.assertTrue(programs.ensure_program_available(self.project, self.root)["restored"])
        self.assert_restored()

    def test_restore_rejects_same_or_unrecognized_active_project(self):
        self.archive()
        commands = [self.headless_command(self.project),
                    f"/installed/jdk/bin/java -cp {self.root}/tools/ghidra/Utility.jar ghidra.Ghidra\n"]
        for command in commands:
            with self.subTest(command=command):
                with patch.object(programs.subprocess, "check_output", return_value=command):
                    with self.assertRaisesRegex(ValueError, "Ghidra process is active"):
                        programs.ensure_program_available(self.project, self.root)
                self.assertFalse((self.project / "Saved.gpr").exists())

    def test_other_headless_project_does_not_bypass_restore_runner_lease(self):
        self.archive()
        command = self.headless_command(self.root / "runtime/other/project")
        with (self.project.parent / "program.lock").open("w") as stream:
            fcntl.flock(stream, fcntl.LOCK_EX | fcntl.LOCK_NB)
            with patch.object(programs.subprocess, "check_output", return_value=command):
                with self.assertRaisesRegex(ValueError, "runner owns"):
                    programs.ensure_program_available(self.project, self.root)
        self.assertFalse((self.project / "Saved.gpr").exists())

    def test_archive_keeps_global_headless_process_guard(self):
        command = self.headless_command(self.root / "runtime/other/project")
        with patch.object(programs.subprocess, "check_output", return_value=command):
            with self.assertRaisesRegex(ValueError, "Ghidra process is active"):
                programs.archive_program(self.project, self.root)
        self.assert_restored()

    def test_shell_inspecting_a_ghidra_command_is_not_an_active_jvm(self):
        command = "/bin/zsh -c '" + self.headless_command(self.project).strip() + "'\n"
        with patch.object(programs.subprocess, "check_output", return_value=command):
            self.assertEqual(programs.archive_program(self.project, self.root)["state"], "cold")

    def test_held_filechannel_lock_blocks_archive(self):
        lock = self.project / "Saved.lock"
        lock.write_bytes(b"Ghidra lock metadata")
        script = "import fcntl,sys; f=open(sys.argv[1],'r+'); fcntl.lockf(f,fcntl.LOCK_EX); print('locked',flush=True); sys.stdin.read()"
        child = subprocess.Popen([sys.executable, "-B", "-c", script, str(lock)],
                                 cwd=self.root, stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True)
        try:
            self.assertEqual(child.stdout.readline().strip(), "locked")
            with self.assertRaisesRegex(ValueError, "FileChannel lock is held"):
                self.archive()
            self.assert_restored()
        finally:
            child.stdin.close()
            child.wait(timeout=5)
            child.stdout.close()

    def test_historical_batch_continues_after_blocked_program(self):
        calls, progress = [], []

        def archive(path, root=None):
            calls.append(path)
            if path == "blocked":
                raise ValueError("live owner")
            return {"project": path, "state": "cold", "reclaimed_allocated_bytes_estimate": 10}

        with patch.object(MANAGE, "archive_program", archive):
            result = MANAGE.archive_many(["before", "blocked", "after"], self.root, progress.append)
        self.assertEqual(calls, ["before", "blocked", "after"])
        self.assertEqual(result["programs"], 2)
        self.assertEqual(result["reclaimed_allocated_bytes_estimate"], 20)
        self.assertEqual(len(result["skipped"]), 1)
        self.assertEqual(progress[1]["state"], "skipped")

    def test_archive_interruption_before_removal_resumes_cleanup(self):
        with patch.object(programs, "_remove_verified_originals", side_effect=RuntimeError("interrupted")):
            with self.assertRaisesRegex(RuntimeError, "interrupted"):
                self.archive()
        self.assert_restored()
        result = self.archive()
        self.assertTrue(result["already_archived"])
        self.assertFalse((self.project / "Saved.rep").exists())
        self.ensure()
        self.assert_restored()

    def test_partial_restoration_can_resume_from_verified_archive(self):
        self.archive()
        (self.project / "Saved.gpr").write_bytes(self.original["Saved.gpr"])
        self.ensure()
        self.assert_restored()

    def test_restore_refuses_to_overwrite_new_unexpected_bytes(self):
        self.archive()
        path = self.project / "Saved.gpr"
        path.write_bytes(b"new independent analysis")
        with self.assertRaisesRegex(ValueError, "differ"):
            self.ensure()
        self.assertEqual(path.read_bytes(), b"new independent analysis")

    def test_descriptor_survives_project_relocation_inside_runtime(self):
        self.archive()
        relocated = self.root / "runtime/shared-programs/adopted"
        relocated.parent.mkdir()
        self.project.rename(relocated)
        self.project = relocated
        self.ensure()
        self.assert_restored()
        self.assertEqual(programs.list_archives(self.root)[0]["project"], "runtime/shared-programs/adopted")

    def test_hot_program_changes_are_never_reset_to_older_archive(self):
        self.archive()
        self.ensure()
        path = self.project / "Saved.rep/user"
        path.write_bytes(b"new completed query progress")
        self.assertFalse(self.ensure()["restored"])
        self.assertEqual(path.read_bytes(), b"new completed query progress")

    def test_archive_path_escape_is_rejected_without_writing(self):
        bad = self.root / "bad.tar.gz"
        with tarfile.open(bad, "w:gz") as archive:
            member = tarfile.TarInfo("../escape")
            member.size = 4
            archive.addfile(member, io.BytesIO(b"oops"))
        with self.assertRaisesRegex(ValueError, "Unsafe"):
            programs._read_archive(bad, stage=self.project)
        self.assertFalse((self.project.parent / "escape").exists())

    def test_fresh_project_hook_does_not_create_a_database_or_program(self):
        fresh = self.root / "runtime/new/project"
        result = programs.ensure_program_available(fresh, self.root)
        self.assertFalse(result["restored"])
        self.assertFalse(fresh.exists())


if __name__ == "__main__":
    unittest.main()
