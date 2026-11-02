#!/usr/bin/env python3
"""Real fake-MCP subprocess regressions; no provider, compiler or game starts."""

from contextlib import redirect_stdout
import importlib.util
import io
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("resumable_rea_batch", ROOT / "scripts/rea-batch.py")
batch = importlib.util.module_from_spec(spec)
spec.loader.exec_module(batch)
REAL_POPEN = subprocess.Popen
FAKE_PEER = ROOT / "scripts/fixtures/fake-rea-mcp.py"


class BatchOperationRecovery(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/rea-batch-tests"
        scratch.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(temporary.cleanup)
        self.folder = Path(temporary.name)
        self.output = self.folder / "results"
        self.target = self.folder / "reference.bin"
        self.target.write_bytes(b"fixture native input; never opened by a provider")
        self.seed = self.folder / "seed.json"
        self.seed.write_text('{"format":"fixture-seeds","seeds":[]}\n')
        self.scenario_path = self.folder / "scenario.json"
        self.scenario_path.write_text('{"failures":{}}\n')
        self.plan_path = self.folder / "requested-plan.json"
        self.plan = {
            "target": self.target.relative_to(ROOT).as_posix(),
            "output": self.output.relative_to(ROOT).as_posix(),
            "timeout": 0.15, "open_timeout": 1, "init_timeout": 1, "cleanup_timeout": 1,
            "environment": {"REA_GHIDRA_SEED_FILE": self.seed.relative_to(ROOT).as_posix()},
            "operations": [
                {"name": "search_strings", "arguments": {"pattern": "first"}, "label": "first"},
                {"name": "procedure_pseudo_code", "arguments": {"procedure": "0x140001000"}, "label": "second"},
            ],
        }
        self.write_plan()

    def write_plan(self):
        self.plan_path.write_text(json.dumps(self.plan))

    def configure_failure(self, *actions):
        self.scenario_path.write_text(json.dumps({"failures": {"procedure_pseudo_code": list(actions)}}))

    def launch_peer(self, command, *arguments, **options):
        if "--native-lease" in command:
            return REAL_POPEN(command, *arguments, **options)
        self.assertEqual(list(command), [str(ROOT / "scripts/rea"), "mcp"])
        return REAL_POPEN([sys.executable, "-B", str(FAKE_PEER), str(self.scenario_path)],
                          *arguments, **options)

    def run_plan(self, resume=False):
        arguments = ["rea-batch.py", str(self.plan_path)] + (["--resume"] if resume else [])
        output = io.StringIO()
        with patch.object(sys, "argv", arguments), patch.object(batch.subprocess, "Popen", self.launch_peer), redirect_stdout(output):
            result = batch.main()
        return result

    def requests(self, name=None):
        path = self.folder / "peer-requests.jsonl"
        records = [json.loads(line) for line in path.read_text().splitlines()] if path.exists() else []
        if name is None:
            return records
        return [row for row in records if row["request"].get("method") == "tools/call"
                and row["request"]["params"]["name"] == name]

    def assert_reopened_and_retried_only_failed_operation(self):
        self.assertEqual(len(self.requests("search_strings")), 1)
        retry = self.requests("procedure_pseudo_code")
        self.assertEqual(len(retry), 2)
        self.assertNotEqual(retry[0]["generation"], retry[1]["generation"])
        opened = self.requests("open_binary")
        self.assertEqual(len(opened), 2)
        for row in opened:
            self.assertEqual(row["request"]["params"]["arguments"]["path"], str(self.target))

    def test_deadline_reopens_peer_and_retries_only_failed_operation(self):
        self.configure_failure("timeout")
        self.assertEqual(self.run_plan(), 0)
        self.assert_reopened_and_retried_only_failed_operation()

    def test_child_death_reopens_peer_without_replaying_first_operation(self):
        self.configure_failure("exit")
        self.assertEqual(self.run_plan(), 0)
        self.assert_reopened_and_retried_only_failed_operation()

    def test_partial_response_cannot_be_saved_as_a_completed_operation(self):
        self.configure_failure("partial")
        self.assertEqual(self.run_plan(), 0)
        self.assert_reopened_and_retried_only_failed_operation()

    def test_provider_timeout_restarts_from_failed_operation(self):
        self.configure_failure("provider_timeout")
        self.assertEqual(self.run_plan(), 0)
        self.assert_reopened_and_retried_only_failed_operation()

    def test_permanent_error_does_not_restart_or_retry(self):
        self.configure_failure("permanent")
        self.assertNotEqual(self.run_plan(), 0)
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)
        self.assertEqual(len(self.requests("open_binary")), 1)

    def test_resume_completed_journal_skips_all_completed_operations(self):
        self.assertEqual(self.run_plan(), 0)
        before = {name: self.requests(name) for name in ("search_strings", "procedure_pseudo_code")}
        self.assertEqual(self.run_plan(resume=True), 0)
        self.assertEqual({name: self.requests(name) for name in before}, before)

    def test_repeating_the_same_plan_automatically_resumes_its_journal(self):
        self.assertEqual(self.run_plan(), 0)
        before = {name: self.requests(name) for name in ("search_strings", "procedure_pseudo_code")}
        self.assertEqual(self.run_plan(), 0)
        self.assertEqual({name: self.requests(name) for name in before}, before)

    def test_keyboard_interrupt_retains_completed_result_for_the_next_run(self):
        original = batch._TransportClient.call

        def cancel_second(client, name, arguments, timeout, label=None):
            if name == "procedure_pseudo_code":
                raise KeyboardInterrupt("fixture user interruption")
            return original(client, name, arguments, timeout, label)

        with patch.object(batch._TransportClient, "call", cancel_second):
            self.assertNotEqual(self.run_plan(), 0)
        journal = json.loads((self.output / "journal.json").read_text())
        self.assertEqual(journal["status"], "interrupted")
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(self.requests("procedure_pseudo_code"), [])
        self.assertEqual(self.run_plan(resume=True), 0)
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)

    def test_changed_plan_is_rejected_before_any_provider_launch(self):
        self.assertEqual(self.run_plan(), 0)
        before = self.requests()
        self.plan["operations"][1]["arguments"]["procedure"] = "0x140002000"
        self.write_plan()
        with self.assertRaises((ValueError, SystemExit)):
            self.run_plan(resume=True)
        self.assertEqual(self.requests(), before)

    def test_replaced_target_and_seed_bytes_are_rejected_before_launch(self):
        self.assertEqual(self.run_plan(), 0)
        before = self.requests()
        for path in (self.target, self.seed):
            with self.subTest(path=path.name):
                original = path.read_bytes()
                path.write_bytes(original + b"changed")
                with self.assertRaises((ValueError, SystemExit)):
                    self.run_plan(resume=True)
                path.write_bytes(original)
                self.assertEqual(self.requests(), before)

    def test_corrupt_completed_result_cannot_be_reused(self):
        self.assertEqual(self.run_plan(), 0)
        journal = json.loads((self.output / "journal.json").read_text())
        operation = next(value for value in journal["operations"].values()
                         if value["name"] == "search_strings")
        result = batch.local_path(operation["result"]["path"])
        result.write_bytes(result.read_bytes() + b"corrupt")
        before = self.requests()
        with self.assertRaises((ValueError, SystemExit)):
            self.run_plan(resume=True)
        self.assertEqual(self.requests(), before)

    def test_resume_requires_an_existing_durable_journal(self):
        with self.assertRaises((ValueError, SystemExit)):
            self.run_plan(resume=True)
        self.assertEqual(self.requests(), [])

    def test_output_is_confined_to_runtime_including_symlink_targets(self):
        link = self.folder / "escape"
        link.symlink_to(ROOT / "scripts", target_is_directory=True)
        for output in (ROOT / "scripts/not-a-batch-output", link / "not-a-batch-output"):
            with self.subTest(output=output):
                self.plan["output"] = str(output)
                self.write_plan()
                with self.assertRaises((ValueError, SystemExit)):
                    self.run_plan()
                self.assertEqual(self.requests(), [])

    def test_changed_tool_commitment_is_rejected_before_spawning_a_peer(self):
        self.assertEqual(self.run_plan(), 0)
        before = self.requests()
        tools = batch.tooling_commitments()
        tools["scripts/rea-batch.py"] = "a" * 64
        with patch.object(batch, "tooling_commitments", return_value=tools):
            with self.assertRaises((ValueError, SystemExit)):
                self.run_plan(resume=True)
        self.assertEqual(self.requests(), before)

    def test_concurrent_runner_cannot_take_an_output_lock(self):
        self.assertEqual(self.run_plan(), 0)
        before = self.requests()
        with batch.OutputLock(self.output):
            with self.assertRaisesRegex(ValueError, "owns|lock"):
                self.run_plan(resume=True)
        self.assertEqual(self.requests(), before)

    def test_lock_symlink_cannot_lock_a_different_runtime_file(self):
        self.output.mkdir()
        foreign = self.folder / "foreign-owned.lock"
        foreign.write_text("must not be opened by the query lock\n")
        (self.output / "query.lock").symlink_to(foreign)
        with self.assertRaises(ValueError):
            with batch.OutputLock(self.output):
                self.fail("A lock symlink must not be admitted")
        self.assertEqual(foreign.read_text(), "must not be opened by the query lock\n")

    def test_transient_reopen_failure_uses_remaining_retry_budget(self):
        self.scenario_path.write_text(json.dumps({"failures": {
            "procedure_pseudo_code": ["timeout"],
            "open_binary": ["success", "exit"],
        }}))
        self.assertEqual(self.run_plan(), 0)
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 2)
        self.assertEqual(len(self.requests("open_binary")), 3)

    def test_exhausted_deadlines_retain_only_completed_work_for_later_resume(self):
        self.configure_failure("timeout", "timeout", "timeout")
        self.assertNotEqual(self.run_plan(), 0)
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 3)
        journal = json.loads((self.output / "journal.json").read_text())
        unfinished = next(value for value in journal["operations"].values()
                          if value["name"] == "procedure_pseudo_code")
        self.assertEqual(unfinished["status"], "failed")
        self.assertNotIn("result", unfinished)
        self.assertEqual(self.run_plan(resume=True), 0)
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 4)

    def test_session_views_are_read_fresh_while_native_producers_stay_cached(self):
        self.plan["operations"].append({"name": "binary_session", "arguments": {}, "label": "session"})
        self.write_plan()
        self.assertEqual(self.run_plan(), 0)
        self.assertEqual(self.run_plan(resume=True), 0)
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)
        sessions = self.requests("binary_session")
        self.assertEqual(len(sessions), 2)
        self.assertNotEqual(sessions[0]["generation"], sessions[1]["generation"])

    def test_journal_symlink_is_rejected_without_mutating_foreign_state(self):
        self.output.mkdir()
        foreign = self.folder / "foreign-journal.json"
        original = '{"status":"foreign-owned"}\n'
        foreign.write_text(original)
        (self.output / "journal.json").symlink_to(foreign)
        with self.assertRaises(ValueError):
            self.run_plan(resume=True)
        self.assertEqual(self.requests(), [])
        self.assertEqual(foreign.read_text(), original)

    def test_completed_result_cannot_be_replaced_by_an_external_output_symlink(self):
        self.assertEqual(self.run_plan(), 0)
        journal = json.loads((self.output / "journal.json").read_text())
        row = next(value for value in journal["operations"].values() if value["name"] == "search_strings")
        result = batch.local_path(row["result"]["path"])
        foreign = self.folder / "foreign-result.json"
        foreign.write_bytes(result.read_bytes())
        result.unlink()
        result.symlink_to(foreign)
        before = self.requests()
        with self.assertRaises(ValueError):
            self.run_plan(resume=True)
        self.assertEqual(self.requests(), before)

    def assert_initialization_recovers(self, action):
        self.plan["init_timeout"] = 0.15
        self.write_plan()
        self.scenario_path.write_text(json.dumps({"failures": {"initialize": [action]}}))
        self.assertEqual(self.run_plan(), 0)
        initializations = [row for row in self.requests() if row["request"].get("method") == "initialize"]
        self.assertEqual(len(initializations), 2)
        self.assertNotEqual(initializations[0]["generation"], initializations[1]["generation"])
        self.assertEqual(len(self.requests("open_binary")), 1)
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)

    def test_first_initialize_timeout_restarts_before_running_native_queries(self):
        self.assert_initialization_recovers("timeout")

    def test_first_initialize_eof_restarts_before_running_native_queries(self):
        self.assert_initialization_recovers("exit")

    def test_first_open_timeout_reopens_before_running_each_native_query_once(self):
        self.plan["open_timeout"] = 0.15
        self.write_plan()
        self.scenario_path.write_text(json.dumps({"failures": {"open_binary": ["timeout"]}}))
        self.assertEqual(self.run_plan(), 0)
        opened = self.requests("open_binary")
        self.assertEqual(len(opened), 2)
        self.assertNotEqual(opened[0]["generation"], opened[1]["generation"])
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)

    def test_initialize_deadlines_stop_at_the_control_retry_budget(self):
        self.plan["init_timeout"] = 0.15
        self.write_plan()
        self.scenario_path.write_text(json.dumps({"failures": {"initialize": ["timeout"] * 4}}))
        self.assertNotEqual(self.run_plan(), 0)
        initializations = [row for row in self.requests() if row["request"].get("method") == "initialize"]
        self.assertEqual(len(initializations), 3)
        self.assertEqual(self.requests("open_binary"), [])
        self.assertEqual(self.requests("search_strings"), [])
        self.assertEqual(self.requests("procedure_pseudo_code"), [])

    def test_open_deadlines_stop_at_the_control_retry_budget(self):
        self.plan["open_timeout"] = 0.15
        self.write_plan()
        self.scenario_path.write_text(json.dumps({"failures": {"open_binary": ["timeout"] * 4}}))
        self.assertNotEqual(self.run_plan(), 0)
        self.assertEqual(len(self.requests("open_binary")), 3)
        self.assertEqual(self.requests("search_strings"), [])
        self.assertEqual(self.requests("procedure_pseudo_code"), [])

    def test_pinned_rea_text_error_timeout_retries_the_unfinished_query(self):
        self.configure_failure("provider_timeout_text")
        self.assertEqual(self.run_plan(), 0)
        self.assert_reopened_and_retried_only_failed_operation()

    def test_pinned_rea_text_error_permanent_failure_is_not_retried(self):
        self.configure_failure("permanent_text")
        self.assertNotEqual(self.run_plan(), 0)
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)
        self.assertEqual(len(self.requests("open_binary")), 1)

    def test_pinned_rea_text_process_diagnostics_retry_execution_failure(self):
        self.configure_failure("process_failure_text")
        self.assertEqual(self.run_plan(), 0)
        self.assert_reopened_and_retried_only_failed_operation()

    def test_complete_response_without_result_or_error_is_not_cached(self):
        self.configure_failure("missing_result")
        self.assertEqual(self.run_plan(), 0)
        self.assert_reopened_and_retried_only_failed_operation()

    def test_complete_response_with_result_and_error_is_not_cached(self):
        self.configure_failure("both_result_error")
        self.assertEqual(self.run_plan(), 0)
        self.assert_reopened_and_retried_only_failed_operation()

    def test_complete_response_with_invalid_result_shape_is_not_cached(self):
        self.configure_failure("invalid_result_shape")
        self.assertEqual(self.run_plan(), 0)
        self.assert_reopened_and_retried_only_failed_operation()

    def test_resumed_cleanup_preserves_distinct_session_evidence_exports(self):
        self.assertEqual(self.run_plan(), 0)
        exports = self.requests("export_evidence_bundle")
        self.assertEqual(len(exports), 1)
        original_path = Path(exports[0]["request"]["params"]["arguments"]["path"])
        original_bytes = original_path.read_bytes()
        self.assertEqual(self.run_plan(resume=True), 0)
        exports = self.requests("export_evidence_bundle")
        self.assertEqual(len(exports), 2)
        resumed_path = Path(exports[1]["request"]["params"]["arguments"]["path"])
        self.assertNotEqual(original_path, resumed_path)
        self.assertTrue(original_path.is_relative_to(self.output / "attempts"))
        self.assertTrue(resumed_path.is_relative_to(self.output / "attempts"))
        self.assertEqual(original_path.read_bytes(), original_bytes)
        self.assertTrue(resumed_path.is_file())
        self.assertEqual(len(self.requests("search_strings")), 1)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)


if __name__ == "__main__":
    unittest.main()
