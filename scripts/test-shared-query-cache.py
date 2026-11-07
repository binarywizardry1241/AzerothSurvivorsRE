#!/usr/bin/env python3
"""Cross-task query reuse with a real fake-MCP subprocess; no native provider."""
import hashlib
import importlib.util
import io
import json
from contextlib import redirect_stdout, nullcontext
from pathlib import Path
import subprocess
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("shared_batch", ROOT / "scripts/rea-batch.py")
batch = importlib.util.module_from_spec(spec)
spec.loader.exec_module(batch)
REAL_POPEN = subprocess.Popen
PEER = ROOT / "scripts/fixtures/fake-rea-mcp.py"
TASKS = Path("runtime/analysis/tasks")


class SharedQueryCache(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/tests/shared-query"
        scratch.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        (self.root / "runtime").mkdir()
        self.target = self.root / "reference.bin"
        self.target.write_bytes(b"fixture input, never decoded")
        self.scenario = self.root / "scenario.json"
        self.scenario.write_text('{"failures":{}}\n')
        self.revision = 1
        self.variant = "shared"
        self.context = True

    def program_context(self, client):
        if not self.context:
            return None
        return {"target_sha256": client.identity["target"]["sha256"],
                "workspace_id": self.variant, "profile_digest": "session-profile",
                "revision": self.revision, "preparation_sha256": "fixture-preparation"}

    def launch(self, unused_command, *args, **kwargs):
        if "--native-lease" in unused_command:
            return REAL_POPEN(unused_command, *args, **kwargs)
        return REAL_POPEN([sys.executable, "-B", str(PEER), str(self.scenario)], *args, **kwargs)

    def run_plan(self, name, *, session=False, real_context=False):
        operations = [{"name": "procedure_pseudo_code", "arguments": {"procedure": "0x140001000"}}]
        if session:
            operations.append({"name": "binary_session", "arguments": {}})
        plan = {"target": str(self.target), "output": (TASKS / name).as_posix(),
                "timeout": 1, "open_timeout": 1, "init_timeout": 1,
                "operations": operations}
        path = self.root / (name + ".json")
        path.write_text(json.dumps(plan))
        with patch.object(batch, "ROOT", self.root), \
             patch.object(batch.subprocess, "Popen", self.launch), \
             (nullcontext() if real_context else patch.object(batch.ResumableClient, "shared_context", lambda client: self.program_context(client))), \
             patch.object(sys, "argv", ["rea-batch.py", str(path)]), redirect_stdout(io.StringIO()):
            return batch.main()

    def requests(self, name):
        path = self.root / "peer-requests.jsonl"
        records = [json.loads(line) for line in path.read_text().splitlines()]
        return [r for r in records if r["request"].get("method") == "tools/call"
                and r["request"]["params"]["name"] == name]

    def result(self, name):
        journal = json.loads((self.root / TASKS / name / "journal.json").read_text())
        return next(r["result"] for r in journal["operations"].values())

    def program_fixture(self):
        return {"root": str(self.root / "runtime/analysis/programs" / ("a" * 64)),
                "target_sha256": hashlib.sha256(self.target.read_bytes()).hexdigest(),
                "workspace_id": "a" * 64, "profile_digest": "b" * 64,
                "ready": True, "revision": 1, "preparation_sha256": "c" * 64}

    def worker(self, name, timeout=1):
        plan = {"target": str(self.target), "output": (TASKS / name).as_posix(),
                "timeout": timeout, "open_timeout": 1, "init_timeout": 1,
                "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": "0x140001000"}}]}
        path = self.root / (name + ".json")
        path.write_text(json.dumps(plan))
        source = '''import importlib.util,sys,subprocess
from pathlib import Path
from unittest.mock import patch
base,plan,scenario,scripts=map(Path,sys.argv[1:])
sys.path.insert(0,str(scripts))
spec=importlib.util.spec_from_file_location('batch',scripts/'rea-batch.py');batch=importlib.util.module_from_spec(spec);spec.loader.exec_module(batch)
batch.ROOT=base
real=subprocess.Popen
def launch(command,*args,**kwargs):
 if '--native-lease' in command:return real(command,*args,**kwargs)
 assert command==[str(base/'scripts/rea'),'mcp']
 return real([sys.executable,'-B',str(scripts/'fixtures/fake-rea-mcp.py'),str(scenario)],*args,**kwargs)
sys.argv=['rea-batch.py',str(plan)]
with patch.object(batch.subprocess,'Popen',launch):raise SystemExit(batch.main())
'''
        return REAL_POPEN([sys.executable, "-B", "-c", source, str(self.root), str(path),
                           str(self.scenario), str(ROOT / "scripts")], stdout=subprocess.PIPE,
                          stderr=subprocess.PIPE, text=True)

    def test_simultaneous_identical_tasks_execute_once_and_replay_equal_bytes(self):
        self.scenario.write_text(json.dumps({"program": self.program_fixture(),
                                            "delays": {"procedure_pseudo_code": 0.3}}))
        first = self.worker("first")
        second = None
        try:
            deadline = time.monotonic() + 10
            while time.monotonic() < deadline:
                if (self.root / "peer-requests.jsonl").exists() and self.requests("procedure_pseudo_code"):
                    break
                time.sleep(0.01)
            else:
                self.fail("First fake native request did not start")
            second = self.worker("second")
            a = first.communicate(timeout=20)
            b = second.communicate(timeout=20)
            self.assertEqual((first.returncode, second.returncode), (0, 0), (a, b))
            self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)
            self.assertEqual(len(self.requests("open_binary")), 1)
            self.assertEqual((self.root / self.result("first")["path"]).read_bytes(),
                             (self.root / self.result("second")["path"]).read_bytes())
        finally:
            for child in [first, second]:
                if child is not None and child.poll() is None:
                    child.kill(); child.communicate()

    def test_capacity_wait_longer_than_operation_timeout_does_not_spend_attempts(self):
        import shutil
        slots = []
        child = None
        try:
            for n in range(2):
                slot = REAL_POPEN([shutil.which("node"), str(ROOT / "scripts/shared-ghidra-programs.mjs"),
                                   "--native-lease", str(self.root / "runtime/analysis/programs"),
                                   str(self.root / f"owner-{n}.json"), "fixture", "shared"],
                                  stdin=subprocess.PIPE, stdout=subprocess.PIPE)
                slots.append(slot)
                self.assertTrue(slot.stdout.readline())
            self.scenario.write_text(json.dumps({"program": self.program_fixture()}))
            child = self.worker("waiting", timeout=0.15)
            time.sleep(0.5)
            self.assertFalse((self.root / "peer-requests.jsonl").exists())
            for slot in slots:
                slot.stdin.close();slot.wait(timeout=10);slot.stdout.close()
            slots.clear()
            output = child.communicate(timeout=20)
            self.assertEqual(child.returncode, 0, output)
            self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)
            journal = json.loads((self.root / TASKS / "waiting/journal.json").read_text())
            self.assertEqual(next(iter(journal["operations"].values()))["attempts"], 1)
        finally:
            for slot in slots:
                slot.stdin.close();slot.wait(timeout=10);slot.stdout.close()
            if child is not None and child.poll() is None:
                child.kill();child.communicate()

    def test_different_task_directories_reuse_one_query_payload(self):
        self.assertEqual(self.run_plan("first"), 0)
        self.assertEqual(self.run_plan("second"), 0)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)
        self.assertEqual(len(self.requests("open_binary")), 1)
        a, b = [self.root / self.result(n)["path"] for n in ("first", "second")]
        self.assertTrue(a.is_symlink() and b.is_symlink())
        self.assertEqual(a.resolve(), b.resolve())

    def test_lazy_first_query_populates_cache_and_next_task_starts_no_provider(self):
        program = {"root": str(self.root / "runtime/analysis/programs" / ("a" * 64)),
                   "target_sha256": hashlib.sha256(self.target.read_bytes()).hexdigest(),
                   "workspace_id": "a" * 64, "profile_digest": "b" * 64,
                   "ready": True, "revision": 1, "preparation_sha256": "c" * 64}
        self.scenario.write_text(json.dumps({"program": program}))
        self.assertEqual(self.run_plan("first", real_context=True), 0)
        self.assertEqual(self.run_plan("second", real_context=True), 0)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)
        self.assertEqual(len(self.requests("open_binary")), 1)
        self.assertEqual(self.result("first")["sha256"], self.result("second")["sha256"])
        self.assertFalse((self.root / TASKS / "second/attempts").exists())

    def test_new_program_revision_retains_old_result_and_runs_again(self):
        self.assertEqual(self.run_plan("first"), 0)
        previous = self.result("first")
        self.revision += 1
        self.assertEqual(self.run_plan("first"), 0)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 2)
        self.assertTrue((self.root / previous["path"]).is_file())
        journal = json.loads((self.root / TASKS / "first/journal.json").read_text())
        self.assertEqual(len(next(iter(journal["operations"].values()))["prior_results"]), 1)

    def test_other_target_bytes_do_not_reuse_old_native_result(self):
        self.assertEqual(self.run_plan("first"), 0)
        self.target.write_bytes(b"different target")
        self.assertEqual(self.run_plan("second"), 0)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 2)

    def test_explicit_analysis_variant_is_independent(self):
        self.assertEqual(self.run_plan("first"), 0)
        self.variant = "boundary-experiment"
        self.assertEqual(self.run_plan("second"), 0)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 2)

    def test_session_ledgers_are_fresh_even_when_native_query_is_shared(self):
        self.assertEqual(self.run_plan("first", session=True), 0)
        self.assertEqual(self.run_plan("second", session=True), 0)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)
        self.assertEqual(len(self.requests("binary_session")), 2)

    def test_missing_program_readiness_never_enters_shared_cache(self):
        self.context = False
        self.assertEqual(self.run_plan("first"), 0)
        self.assertEqual(self.run_plan("second"), 0)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 2)
        self.assertFalse((self.root / "runtime/analysis/knowledge.sqlite").exists())

    def test_legacy_result_without_revision_is_retained_but_not_claimed_current(self):
        self.context = False
        self.assertEqual(self.run_plan('first'), 0)
        old = self.result('first')
        self.context = True
        self.assertEqual(self.run_plan('first'), 0)
        self.assertEqual(len(self.requests('procedure_pseudo_code')), 2)
        self.assertTrue((self.root / old['path']).is_file())
        journal = json.loads((self.root / TASKS / 'first/journal.json').read_text())
        self.assertIsNone(next(iter(journal['operations'].values()))['prior_results'][0]['shared_identity'])

    def test_corrupted_shared_object_is_rejected_before_query_replay(self):
        self.assertEqual(self.run_plan("first"), 0)
        p = (self.root / self.result("first")["path"]).resolve()
        p.chmod(0o644)
        p.write_bytes(p.read_bytes() + b"corruption")
        self.assertNotEqual(self.run_plan("second"), 0)
        self.assertEqual(len(self.requests("procedure_pseudo_code")), 1)

    def test_transient_restart_can_advance_program_revision(self):
        self.scenario.write_text(json.dumps({'failures': {'procedure_pseudo_code': ['provider_timeout_text']}}))
        original = batch._TransportClient.call
        opened = []

        def observe_open(client, name, arguments, timeout, label=None):
            if name == 'open_binary':
                opened.append(name)
                if len(opened) > 1:
                    self.revision = 2
            return original(client, name, arguments, timeout, label)

        with patch.object(batch._TransportClient, 'call', observe_open):
            self.assertEqual(self.run_plan('first'), 0)
        self.assertEqual(len(self.requests('procedure_pseudo_code')), 2)
        journal = json.loads((self.root / TASKS / 'first/journal.json').read_text())
        operation = next(iter(journal['operations'].values()))
        self.assertEqual(operation['shared_identity']['program']['revision'], 2)

    def test_real_launcher_receipt_and_saved_readiness_are_bound(self):
        with patch.object(batch, 'ROOT', self.root):
            client = batch.ResumableClient(TASKS / 'task', {})
            try:
                client.prepare_open({'path': str(self.target), 'provider_id': 'ghidra'})
                program = self.root / 'runtime/analysis/programs' / ('a' * 64)
                program.mkdir(parents=True)
                descriptor = {'root': str(program), 'target_sha256': client.identity['target']['sha256'],
                              'workspace_id': 'a' * 64, 'profile_digest': 'b' * 64}
                pointer = Path(client.environment['REA_SHARED_PROGRAM_RECEIPT'])
                pointer.write_text(json.dumps(descriptor))
                ready = {k: v for k, v in descriptor.items() if k != 'root'}
                ready.update(ready=True, revision=3, preparation_sha256='c' * 64)
                (program / 'ready.json').write_text(json.dumps(ready))
                self.assertEqual(client.shared_context()['revision'], 3)
                ready['ready'] = False
                (program / 'ready.json').write_text(json.dumps(ready))
                self.assertIsNone(client.shared_context())
                ready.update(ready=True, target_sha256='d' * 64)
                (program / 'ready.json').write_text(json.dumps(ready))
                with self.assertRaisesRegex(ValueError, 'commitment differs'):
                    client.shared_context()
            finally:
                client.stop()

    def test_result_receipt_survives_an_outer_task_directory_alias(self):
        from shared_analysis import SharedAnalysis
        with patch.object(batch, 'ROOT', self.root):
            store = SharedAnalysis(self.root)
            receipt = store.put_bytes(b'{"retained":true}\n')
            old = self.root / TASKS / 'old-task'
            logical = old / 'results/operation.json'
            store.link_alias(logical, receipt)
            current = self.root / TASKS / 'adopted'
            old.rename(current)
            old.symlink_to(current, target_is_directory=True)
            # Rebase the leaf as the Program move journal does, preserving its
            # original logical path and canonical object commitment.
            moved = current / 'results/operation.json'
            moved.unlink()
            moved.symlink_to(store.object_path(receipt['sha256']))
            client = batch.ResumableClient(old, {})
            try:
                saved = {'path': logical.relative_to(self.root).as_posix(), 'sha256': receipt['sha256']}
                self.assertEqual(client.verified_result_path(saved), store.object_path(receipt['sha256']))
            finally:
                client.stop()


if __name__ == "__main__":
    unittest.main()
