#!/usr/bin/env python3
"""Non-compiling pipeline fixtures, isolated beneath project runtime/."""
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
import time
import unittest
from unittest.mock import patch

from execheck_pipeline import Pipeline, AuditSession, digest

ROOT = Path(__file__).resolve().parents[1]


class PipelineTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(dir=ROOT / "runtime", prefix="pipeline-fixture-")
        self.root = Path(self.temporary.name)
        self.identity = {"sha256": "a" * 64, "version": "fixture"}
        self.messages = []
        (self.root / "scripts").mkdir()
        self.producer = self.root / "scripts/producer.py"
        self.producer.write_text("import pathlib,sys,time\nsource,destination,delay=sys.argv[1:]\ntime.sleep(float(delay))\npathlib.Path(destination).write_bytes(pathlib.Path(source).read_bytes())\n")
        (self.root / "left.txt").write_text("first")
        (self.root / "right.txt").write_text("independent")

    def tearDown(self):
        self.temporary.cleanup()

    def stage(self, name, source, *, needs=(), delay="0", cache=True):
        return {"id": name, "argv": [sys.executable, "-B", "scripts/producer.py", source, name + ".txt", delay],
                "needs": list(needs), "inputs": [source], "outputs": [name + ".txt"],
                "tools": ["scripts/producer.py"], "memory_mb": 1, "cache": cache}

    def run_plan(self, stages, **options):
        return Pipeline(self.root, self.identity, stages, workers=2, memory_mb=2,
                        notify=self.messages.append, **options).run()

    def test_cache_and_precise_descendant_invalidation(self):
        stages = [self.stage("left", "left.txt"), self.stage("right", "right.txt"), self.stage("join", "left.txt", needs=("left",))]
        first = self.run_plan(stages)
        self.assertFalse(first["errors"])
        second = self.run_plan(stages)
        self.assertTrue(all(row["cache_hit"] for row in second["stages"].values()))
        (self.root / "left.txt").write_text("changed")
        third = self.run_plan(stages)
        self.assertFalse(third["stages"]["left"]["cache_hit"])
        self.assertFalse(third["stages"]["join"]["cache_hit"])
        self.assertTrue(third["stages"]["right"]["cache_hit"])

    def test_parallel_readers(self):
        report = self.run_plan([self.stage("left", "left.txt", delay="0.3"), self.stage("right", "right.txt", delay="0.3")])
        self.assertFalse(report["errors"])
        summed = sum(row["metrics"]["wall_seconds"] for row in report["stages"].values())
        self.assertLess(report["wall_seconds"], summed * 0.85)

    def test_corrupt_output_reruns_but_not_independent_stage(self):
        stages = [self.stage("left", "left.txt"), self.stage("right", "right.txt")]
        self.run_plan(stages)
        (self.root / "left.txt").write_text("corrupt")
        report = self.run_plan(stages)
        self.assertFalse(report["stages"]["left"]["cache_hit"])
        self.assertTrue(report["stages"]["right"]["cache_hit"])

    def test_missing_shared_output_restores_only_with_intact_closure(self):
        stage = self.stage("copy", "left.txt")
        output = "runtime/coverage/inventory.json"
        child = self.root / "runtime/child.bin"
        child.parent.mkdir()
        child.write_bytes(b"source")
        stage["argv"][4] = output
        stage["outputs"] = [output]
        (self.root / "left.txt").write_text(json.dumps({"child": {
            "path": "runtime/child.bin", "sha256": "a" * 64}}))
        first = self.run_plan([stage])
        self.assertFalse(first["errors"])
        path = self.root / output
        path.unlink()
        replay = self.run_plan([stage])
        self.assertTrue(replay["stages"]["copy"]["cache_hit"])
        self.assertTrue(path.is_symlink())
        self.assertEqual(replay["stages"]["copy"]["seal_sha256"], first["stages"]["copy"]["seal_sha256"])
        path.unlink()
        child.write_bytes(b"changed")
        pipeline = Pipeline(self.root, self.identity, [stage], memory_mb=2, notify=self.messages.append)
        self.assertIsNone(pipeline._cached(digest(pipeline._commitment(stage, {}))))
        self.assertFalse(path.exists())

    def test_failed_producer_never_publishes_dependents_and_resumes(self):
        stage = self.stage("left", "left.txt")
        stage["argv"] = [sys.executable, "-c", "import os;from pathlib import Path;Path(os.environ['REA_STAGE_METRICS_PATH']).write_text('{');raise SystemExit(3)"]
        report = self.run_plan([stage, self.stage("join", "left.txt", needs=("left",)), self.stage("right", "right.txt")])
        self.assertEqual(set(report["errors"]), {"left", "join"})
        self.assertGreater(report["stages"]["left"]["metrics"]["wall_seconds"], 0)
        self.assertIn("stage_metrics_error", report["stages"]["left"]["metrics"])
        self.assertIn("failed (3)", report["errors"]["left"])
        self.assertNotIn("seal_sha256", report["stages"]["left"])
        self.assertFalse(list((self.root / "runtime/analysis/pipeline").glob("*.metrics.json")))
        resumed = self.run_plan([self.stage("left", "left.txt"), self.stage("join", "left.txt", needs=("left",)), self.stage("right", "right.txt")])
        self.assertFalse(resumed["errors"])
        self.assertTrue(resumed["stages"]["right"]["cache_hit"])

    def test_timing_only_runner_reuses_seals_and_consumes_sidecar(self):
        from execheck_pipeline import file_digest
        stage = self.stage("copy", "left.txt")
        stage["argv"] = [sys.executable, "-c",
                         "import os;from pathlib import Path;"
                         "Path('copy.txt').write_text('first');"
                         "Path(os.environ['REA_STAGE_METRICS_PATH']).write_text('{\"rows\":3}')"]
        session = AuditSession(self.root, "runtime/audit.json", self.identity, new=True)
        revision = file_digest(ROOT / "scripts/execheck_pipeline.py")
        original = "b" * 64
        first = self.run_plan([stage], audit_session=session, runner_predecessor=(revision, original))
        self.assertEqual(first["stages"]["copy"]["metrics"]["stage"], {"rows": 3})
        self.assertFalse(list((self.root / "runtime/analysis/pipeline").glob("*.metrics.json")))
        phase = json.loads(session.path.read_bytes())["phases"][0]
        self.assertEqual(phase["stages"]["copy"]["metrics"], first["stages"]["copy"]["metrics"])
        cached = self.run_plan([stage], audit_session=session, runner_predecessor=(revision, original))
        self.assertTrue(cached["stages"]["copy"]["cache_hit"])
        changed = self.run_plan([stage], audit_session=session, runner_predecessor=("c" * 64, original))
        self.assertFalse(changed["stages"]["copy"]["cache_hit"])

    def test_tool_and_environment_invalidation(self):
        stages = [self.stage("left", "left.txt")]
        self.run_plan(stages)
        self.producer.write_text(self.producer.read_text() + "# changed\n")
        self.assertFalse(self.run_plan(stages)["stages"]["left"]["cache_hit"])
        self.assertFalse(self.run_plan(stages, environment={"EXECHECK_FIXTURE": "changed"})["stages"]["left"]["cache_hit"])

    def test_docstring_example_is_not_a_dependency_but_real_import_is(self):
        other = self.root / "scripts/unrelated.py"
        other.write_text("value=1\n")
        self.producer.write_text('"""An example uses scripts/unrelated.py."""\n' + self.producer.read_text())
        stages = [self.stage("copy", "left.txt")]
        self.run_plan(stages)
        other.write_text("value=2\n")
        self.assertTrue(self.run_plan(stages)["stages"]["copy"]["cache_hit"])
        self.producer.write_text("import unrelated\n" + self.producer.read_text())
        self.run_plan(stages)
        other.write_text("value=3\n")
        self.assertFalse(self.run_plan(stages)["stages"]["copy"]["cache_hit"])

    def test_embedded_generated_code_keeps_its_executable_helper_dependency(self):
        from execheck_pipeline import source_closure
        helper = self.root / "scripts/injected.mjs"; helper.write_text("export const value=1;\n")
        self.producer.write_text('body=\'const helper = await import(process.cwd()+"/scripts/injected.mjs");\'\n')
        self.assertIn("scripts/injected.mjs", source_closure(self.root, ["scripts/producer.py"]))

    def test_one_fresh_scan_per_audit_reuses_phases_without_invalidating_data_children(self):
        fresh = self.stage("fresh", "left.txt", cache=False)
        fresh["fresh_each_audit"] = True
        stages = [fresh, self.stage("child", "fresh.txt", needs=("fresh",))]
        session = AuditSession(self.root, "runtime/audit.json", self.identity, new=True)
        first = self.run_plan(stages, audit_session=session)
        resumed = self.run_plan(stages, audit_session=AuditSession(self.root, "runtime/audit.json", self.identity))
        self.assertFalse(first["stages"]["fresh"]["cache_hit"])
        self.assertTrue(resumed["stages"]["fresh"]["cache_hit"])
        self.assertTrue(resumed["stages"]["child"]["cache_hit"])
        next_session = AuditSession(self.root, "runtime/audit.json", self.identity, new=True)
        renewed = self.run_plan(stages, audit_session=next_session)
        self.assertFalse(renewed["stages"]["fresh"]["cache_hit"])
        self.assertTrue(renewed["stages"]["child"]["cache_hit"])
        self.assertTrue(list((self.root / "runtime/audit.runs").glob("*.json")))

    def test_scan_witness_rejects_changed_output_and_target_or_replaced_session(self):
        stage = self.stage("fresh", "left.txt", cache=False)
        stage["fresh_each_audit"] = True
        session = AuditSession(self.root, "runtime/audit.json", self.identity, new=True)
        self.run_plan([stage], audit_session=session)
        (self.root / "fresh.txt").write_text("corrupt")
        self.assertFalse(self.run_plan([stage], audit_session=session)["stages"]["fresh"]["cache_hit"])
        with self.assertRaisesRegex(ValueError, "target/resources differ"):
            AuditSession(self.root, "runtime/audit.json", {"sha256": "b" * 64})
        AuditSession(self.root, "runtime/audit.json", self.identity, new=True)
        with self.assertRaisesRegex(ValueError, "replaced"):
            session.witnessed("fresh", "any-key")

    def test_session_keeps_all_phase_timings(self):
        session = AuditSession(self.root, "runtime/audit.json", self.identity, new=True)
        stages = [self.stage("copy", "left.txt")]
        self.run_plan(stages, audit_session=session, phase="native")
        self.run_plan(stages, audit_session=session, phase="derive")
        document = json.loads(session.path.read_bytes())
        self.assertEqual([row["phase"] for row in document["phases"]], ["native", "derive"])
        self.assertGreater(document["elapsed_seconds"], 0)

    def test_session_rejects_runtime_escape_and_final_alias(self):
        with self.assertRaisesRegex(ValueError, "regular project runtime"):
            AuditSession(self.root, "runtime/../audit.json", self.identity, new=True)
        directory = self.root / "runtime"; directory.mkdir(exist_ok=True)
        (directory / "alias.json").symlink_to(self.root / "left.txt")
        with self.assertRaisesRegex(ValueError, "regular project runtime"):
            AuditSession(self.root, "runtime/alias.json", self.identity, new=True)

    def test_reconcile_frontier_rejects_stale_selection_before_any_readers(self):
        import importlib.util
        spec = importlib.util.spec_from_file_location("run_execheck_fixture", ROOT / "scripts/run-execheck.py")
        runner = importlib.util.module_from_spec(spec); spec.loader.exec_module(runner)
        import hashlib
        directory = self.root / "docs/analysis/coverage"; directory.mkdir(parents=True)
        census = directory / "census.json"; census.write_text(json.dumps({"guarded_edge_digest": "applied-edges"}))
        selected = directory / "native-ownership-classification.json"
        switches = directory / "native-jump-tables.json"
        switches.write_text(json.dumps({"target": self.identity, "edge_digest": "applied-edges"}))
        document = {"target": self.identity, "census_summary": "docs/analysis/coverage/census.json", "census_summary_sha256": hashlib.sha256(census.read_bytes()).hexdigest()}
        selected.write_text(json.dumps(document))
        runner.reconcile_frontier(self.root, self.identity, "docs/analysis/coverage/census.json")
        switches.write_text(json.dumps({"target": self.identity, "edge_digest": "stale-edges"}))
        with self.assertRaisesRegex(ValueError, "applied switch edges differ"):
            runner.reconcile_frontier(self.root, self.identity, "docs/analysis/coverage/census.json")
        switches.write_text(json.dumps({"target": self.identity, "edge_digest": "applied-edges"}))
        document["target"] = {"sha256": "stale"}; selected.write_text(json.dumps(document))
        with self.assertRaisesRegex(ValueError, "classification target is stale"):
            runner.reconcile_frontier(self.root, self.identity, "docs/analysis/coverage/census.json")
        document["target"] = self.identity; selected.write_text(json.dumps(document)); census.write_text("changed")
        with self.assertRaisesRegex(ValueError, "classification census differs"):
            runner.reconcile_frontier(self.root, self.identity, "docs/analysis/coverage/census.json")

    def test_inherited_analysis_environment_is_committed(self):
        stages = [self.stage("copy", "left.txt")]
        self.run_plan(stages)
        with patch.dict("os.environ", {"REA_FIXTURE_SETTING": "changed"}):
            self.assertFalse(self.run_plan(stages)["stages"]["copy"]["cache_hit"])

    def test_resource_writer_lease_serializes_independent_stages(self):
        stages = [self.stage("left", "left.txt", delay="0.2"), self.stage("right", "right.txt", delay="0.2")]
        for stage in stages:
            stage["resources"] = ["same-program"]
        result = self.run_plan(stages)
        self.assertFalse(result["errors"])
        self.assertGreater(result["wall_seconds"], 0.4)

    def test_transitive_artifact_corruption_invalidates_cached_producer(self):
        (self.root / "runtime").mkdir()
        artifact = self.root / "runtime/body.bin"
        artifact.write_text("body")
        import hashlib
        expected = hashlib.sha256(artifact.read_bytes()).hexdigest()
        (self.root / "manifest.json").write_text(json.dumps({"artifact": {"path": "runtime/body.bin", "sha256": expected}}))
        stage = self.stage("copy", "manifest.json")
        stage["argv"] = [sys.executable,"-c","import hashlib,json;from pathlib import Path;m=Path('manifest.json');r=json.loads(m.read_text())['artifact'];assert hashlib.sha256(Path(r['path']).read_bytes()).hexdigest()==r['sha256'];Path('copy.json').write_bytes(m.read_bytes())"]
        stage["outputs"] = ["copy.json"]
        self.run_plan([stage])
        artifact.write_text("corrupted")
        result = self.run_plan([stage])
        self.assertIn("failed", result["errors"]["copy"])

    def test_input_drift_rejects_publication(self):
        stage = self.stage("left", "left.txt")
        stage["argv"] = [sys.executable, "-c", "from pathlib import Path;Path('left.txt').write_text('changed')"]
        report = self.run_plan([stage])
        self.assertIn("inputs changed", report["errors"]["left"])

    def test_output_seal_is_immutable_after_mutable_output_changes(self):
        stages = [self.stage("copy", "left.txt")]
        result = self.run_plan(stages)
        pipeline = Pipeline(self.root, self.identity, stages, memory_mb=2, notify=self.messages.append)
        receipt = json.loads(pipeline.store.object_path(result["stages"]["copy"]["seal_sha256"]).read_bytes())
        sealed = pipeline.store.object_path(receipt["outputs"]["copy.txt"]["sha256"])
        (self.root / "copy.txt").write_text("mutated")
        self.assertEqual(sealed.read_text(), "first")

    def test_legacy_writer_cannot_mutate_existing_cas_output_alias(self):
        stage = self.stage("copy", "left.txt")
        stage["argv"][4] = "runtime/copy.txt"
        stage["outputs"] = ["runtime/copy.txt"]
        result = self.run_plan([stage])
        pipeline = Pipeline(self.root, self.identity, [stage], memory_mb=2, notify=self.messages.append)
        receipt = json.loads(pipeline.store.object_path(result["stages"]["copy"]["seal_sha256"]).read_bytes())
        item = receipt["outputs"]["runtime/copy.txt"]
        sealed = pipeline.store.object_path(item["sha256"])
        output = self.root / "runtime/copy.txt"
        output.unlink(); output.symlink_to(sealed)
        (self.root / "left.txt").write_text("new content")
        changed = self.run_plan([stage])
        self.assertFalse(changed["errors"])
        self.assertTrue(output.is_symlink())
        self.assertEqual(output.read_text(), "new content")
        self.assertEqual(sealed.read_text(), "first")

    def test_reject_cycle_duplicate_output_and_budget(self):
        left = self.stage("left", "left.txt", needs=("right",))
        right = self.stage("right", "right.txt", needs=("left",))
        with self.assertRaisesRegex(ValueError, "Cyclic"):
            self.run_plan([left, right])
        left = self.stage("left", "left.txt")
        right = self.stage("right", "right.txt")
        right["outputs"] = left["outputs"]
        with self.assertRaisesRegex(ValueError, "Two stage writers"):
            self.run_plan([left, right])
        left["memory_mb"] = 3
        with self.assertRaisesRegex(ValueError, "memory budget"):
            self.run_plan([left])

    def test_default_profile_has_closed_dependencies_in_each_phase(self):
        from execheck_profile import profile
        for phase in ("scan", "native", "derive", "reconcile"):
            included = {"scan", phase} | ({"derive"} if phase == "reconcile" else set())
            stages = [stage for stage in profile()["stages"] if stage["phase"] in included]
            Pipeline(self.root, self.identity, stages, memory_mb=10000, notify=self.messages.append)
            if phase == "native":
                native = [stage for stage in stages if stage["id"] in ("declared", "expanded")]
                self.assertEqual(len(native), 2)
                self.assertTrue(all(not stage["cache"] for stage in native))
                self.assertEqual(native[0]["resources"], native[1]["resources"])
                self.assertEqual(native[0]["needs"], ["pe"])
                self.assertNotIn("docs/analysis/coverage/diagnostic-ownership.json", native[0]["inputs"])
                verifier = next(stage for stage in stages if stage["id"] == "verify-declared")
                self.assertIn("diagnostics", verifier["needs"])
                self.assertIn("complement", native[1]["needs"])
            if phase == "reconcile":
                by_id = {stage["id"]: stage for stage in stages}
                self.assertEqual(by_id["selection"]["needs"], ["history"])
                self.assertEqual(by_id["connections"]["needs"], ["selection", "changelog"])

    def test_default_connections_wait_for_current_changelog_on_target_refresh(self):
        from execheck_profile import profile
        definitions = {stage["id"]: stage for stage in profile()["stages"]}

        def ancestors(name):
            result, pending = set(), list(definitions[name]["needs"])
            while pending:
                parent = pending.pop()
                self.assertNotEqual(parent, name, "Cyclic default profile")
                if parent not in result:
                    result.add(parent)
                    pending.extend(definitions[parent]["needs"])
            return result

        self.assertIn("changelog", ancestors("connections"))
        self.assertNotIn("connections", ancestors("changelog"))
        self.assertIn("docs/analysis/coverage/changelog.json", definitions["connections"]["inputs"])
        coverage = self.root / "docs/analysis/coverage"
        coverage.mkdir(parents=True)
        (coverage / "changelog.json").write_text(json.dumps({"target": "previous-target"}))
        programs = {
            "selection": "from pathlib import Path;Path('docs/analysis/coverage/native-image-current.json').write_text('{}')",
            "changelog": "from pathlib import Path;import json,time;time.sleep(0.25);Path('docs/analysis/coverage/changelog.json').write_text(json.dumps({'target':'current-target'}))",
            "connections": "from pathlib import Path;import json;p=Path('docs/analysis/coverage');assert json.loads((p/'changelog.json').read_text())['target']=='current-target';(p/'exe-connections.json').write_text('{}')",
        }
        stages = []
        for definition in definitions.values():
            if definition["id"] not in programs:
                continue
            stage = dict(definition)
            stage.update(argv=[sys.executable, "-B", "-c", programs[stage["id"]]],
                         tools=["scripts/producer.py"], memory_mb=1,
                         inputs=(["docs/analysis/coverage/changelog.json"]
                                 if stage["id"] == "connections" else ["left.txt"]),
                         needs=[name for name in stage["needs"] if name in programs])
            stages.append(stage)
        result = self.run_plan(stages)
        self.assertFalse(result["errors"])
        self.assertEqual(json.loads((coverage / "exe-connections.json").read_text()), {})

    def test_default_complement_waits_for_current_declared_inventory(self):
        from execheck_profile import profile
        coverage = self.root / "docs/analysis/coverage"
        coverage.mkdir(parents=True)
        (coverage / "instruction-summary.json").write_text(json.dumps("previous-target"))
        programs = {
            "pe": "from pathlib import Path;Path('docs/analysis/coverage/native-summary.json').write_text('{}')",
            "linear": "from pathlib import Path;import json,time;time.sleep(0.25);Path('docs/analysis/coverage/instruction-summary.json').write_text(json.dumps('current-target'))",
            "complement": "from pathlib import Path;import json;p=Path('docs/analysis/coverage');assert json.loads((p/'instruction-summary.json').read_text())=='current-target';(p/'unwind-complement-summary.json').write_text('{}')",
        }
        stages = []
        for definition in profile()["stages"]:
            if definition["id"] not in programs:
                continue
            stage = dict(definition)
            stage.update(argv=[sys.executable, "-B", "-c", programs[stage["id"]]],
                         tools=["scripts/producer.py"], memory_mb=1,
                         outputs=stage["outputs"][:1])
            stages.append(stage)
        complement = next(stage for stage in stages if stage["id"] == "complement")
        self.assertIn("docs/analysis/coverage/instruction-summary.json", complement["inputs"])
        result = self.run_plan(stages)
        self.assertFalse(result["errors"])
        self.assertEqual(json.loads((coverage / "unwind-complement-summary.json").read_text()), {})

    def test_historical_readable_provenance_can_move_without_relabeling_payloads(self):
        (self.root / "docs").mkdir()
        historical = self.root / "docs/old-report.json"
        historical.write_text('{"path":"docs/retired.json","sha256":"old"}')
        (self.root / "manifest.json").write_text(json.dumps({"history": {"path": "docs/old-report.json", "sha256": "historical-bytes"}}))
        stage = self.stage("copy", "manifest.json")
        result = self.run_plan([stage])
        self.assertFalse(result["errors"])
        self.assertTrue(self.run_plan([stage])["stages"]["copy"]["cache_hit"])
        historical.write_text("{}")
        self.assertFalse(self.run_plan([stage])["stages"]["copy"]["cache_hit"])

    def test_optional_retired_raw_input_is_bound_as_missing_then_invalidates_on_restore(self):
        (self.root / "manifest.json").write_text(json.dumps({"raw_artifact": {"path": "runtime/retired.bin", "sha256": "historical"}}))
        stage = self.stage("copy", "manifest.json")
        self.assertFalse(self.run_plan([stage])["errors"])
        self.assertTrue(self.run_plan([stage])["stages"]["copy"]["cache_hit"])
        (self.root / "runtime/retired.bin").write_text("restored")
        self.assertFalse(self.run_plan([stage])["stages"]["copy"]["cache_hit"])

    def test_whole_image_scan_can_bypass_stage_cache(self):
        stages = [self.stage("left", "left.txt", cache=False)]
        self.run_plan(stages)
        result = self.run_plan(stages)
        self.assertFalse(result["stages"]["left"]["cache_hit"])
        self.assertFalse(result["execheck_semantic_review_complete"])
        self.assertGreater(result["stages"]["left"]["metrics"]["peak_rss_bytes"], 0)

    def test_domain_validator_runs_without_unneeded_historical_archive_traversal(self):
        (self.root / "manifest.json").write_text(json.dumps({"old_inventory": {"path": "runtime/obsolete.sqlite", "sha256": "old"}}))
        stage = self.stage("copy", "manifest.json", cache=False)
        stage["transitive_inputs"] = False
        self.assertFalse(self.run_plan([stage])["errors"])
        self.assertFalse(self.run_plan([stage])["stages"]["copy"]["cache_hit"])
        stage["cache"] = True
        with self.assertRaisesRegex(ValueError, "always-run domain validator"):
            self.run_plan([stage])

    def test_interrupt_kills_descendant_after_group_leader_exits(self):
        child = self.root / "scripts/child.py"
        child.write_text("import subprocess,sys,time\nfrom pathlib import Path\np=subprocess.Popen([sys.executable,'-c','import signal,time;signal.signal(signal.SIGTERM,signal.SIG_IGN);time.sleep(30)'])\nPath('grandchild.pid').write_text(str(p.pid))\ntime.sleep(30)\n")
        launcher = self.root / "launch.py"
        launcher.write_text("import signal,sys\nfrom pathlib import Path\nsys.path.insert(0," + repr(str(ROOT / "scripts")) + ")\nfrom execheck_pipeline import Pipeline,AuditSession\ndef stop(*args):raise KeyboardInterrupt\nsignal.signal(signal.SIGTERM,stop)\nPipeline(Path.cwd(),{'sha256':'fixture'},[{'id':'child','argv':[sys.executable,'scripts/child.py'],'tools':['scripts/child.py'],'memory_mb':1}],memory_mb=1,notify=lambda message:None,audit_session=AuditSession(Path.cwd(),'runtime/audit.json',{'sha256':'fixture'},new=True),phase='native').run()\n")
        process = subprocess.Popen([sys.executable, "-B", str(launcher)], cwd=self.root, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        grandchild = None
        try:
            deadline = time.monotonic() + 5
            marker = self.root / "grandchild.pid"
            while not marker.exists() and time.monotonic() < deadline:
                time.sleep(0.02)
            self.assertTrue(marker.exists())
            grandchild = int(marker.read_text())
            # Allow the descendant to install its deliberate TERM handler.
            time.sleep(0.1)
            process.send_signal(signal.SIGTERM)
            process.wait(timeout=5)
            journal = json.loads((self.root / "runtime/audit.json").read_bytes())
            self.assertIn("interrupted", journal["phases"][0]["errors"])
            self.assertGreater(journal["phases"][0]["wall_seconds"], 1)
            deadline = time.monotonic() + 2
            while time.monotonic() < deadline:
                state = subprocess.run(["ps", "-o", "stat=", "-p", str(grandchild)], capture_output=True, text=True).stdout.strip()
                if not state or state.startswith("Z"):
                    break
                time.sleep(0.02)
            self.assertTrue(not state or state.startswith("Z"), "descendant escaped cancellation")
        finally:
            if process.poll() is None:
                process.kill(); process.wait()
            if grandchild is not None:
                try:
                    os.kill(grandchild, signal.SIGKILL)
                except ProcessLookupError:
                    pass


if __name__ == "__main__":
    unittest.main()
