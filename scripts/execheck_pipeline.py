"""Content-bound DAG execution for static EXE audits (no shell or game execution).

Cache receipts are immutable manifests in the common analysis catalog/CAS. They
are execution evidence, not a semantic review or a completeness certificate.
"""
from concurrent.futures import ThreadPoolExecutor, wait, FIRST_COMPLETED
from contextlib import contextmanager
import ast
import ctypes
import fcntl
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import threading
import time
import uuid

from shared_analysis import SharedAnalysis, file_digest

# These producers replace changed files atomically and can keep a stable CAS
# alias when the data is unchanged. Mutable checkpoints are deliberately separate.
SHARED_STAGE_OUTPUTS = frozenset({
    "inventory.json", "diagnostic-ownership.json", "dispatch-boundaries.json",
    "guarded-proposals.json", "guarded-jump-tables.json", "diagnostics.json",
})


def shareable_stage_output(root, path):
    return path.is_relative_to(root / "runtime/coverage") and path.name in SHARED_STAGE_OUTPUTS


def clone_file(source, destination):
    """Use APFS copy-on-write for mutable views when available."""
    if sys.platform != "darwin":
        return False
    clone = getattr(ctypes.CDLL(None), "clonefile", None)
    if clone is None:
        return False
    clone.argtypes = (ctypes.c_char_p, ctypes.c_char_p, ctypes.c_int)
    return clone(os.fsencode(source), os.fsencode(destination), 0) == 0

FORMAT = "execheck-stage-v1"
SCHEMA = """CREATE TABLE IF NOT EXISTS execheck_stage_cache (
    stage_key TEXT PRIMARY KEY, receipt_sha256 TEXT NOT NULL
);"""


def encoded(value):
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def digest(value):
    return hashlib.sha256(encoded(value)).hexdigest()


def atomic_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, name = tempfile.mkstemp(prefix=".publish-", dir=path.parent)
    try:
        with os.fdopen(descriptor, "wb") as stream:
            stream.write(encoded(value)); stream.flush(); os.fsync(stream.fileno())
        os.replace(name, path)
    finally:
        Path(name).unlink(missing_ok=True)


def local(root, value):
    path = root / value
    if not path.resolve().is_relative_to(root):
        raise ValueError(f"Pipeline path leaves checkout: {value}")
    return path


def source_closure(root, paths):
    """Local imports + literal script references; dynamic tool inputs are explicit."""
    found, pending = set(), list(paths)
    while pending:
        name = pending.pop()
        if name in found:
            continue
        path = local(root, name)
        if not path.is_file():
            raise ValueError(f"Missing stage tool: {name}")
        found.add(name)
        text = path.read_text() if path.suffix in (".py", ".mjs", ".js") else ""
        names = set()
        if path.suffix == ".py":
            tree = ast.parse(text)
            # Instructions/examples in comments and docstrings are not imports.
            # Keep literal paths in executable code and metadata commitments.
            class WithoutDocstrings(ast.NodeTransformer):
                def visit_Expr(self, node):
                    return None if isinstance(node.value, ast.Constant) and isinstance(node.value.value, str) else self.generic_visit(node)
            tree = WithoutDocstrings().visit(tree)
            strings = []
            for node in ast.walk(tree):
                if isinstance(node, ast.Constant) and isinstance(node.value, str):
                    strings.append(node.value)
                modules = ([item.name for item in node.names] if isinstance(node, ast.Import)
                           else [node.module] if isinstance(node, ast.ImportFrom) else [])
                for module in modules:
                    candidate = "scripts/" + (module or "").replace(".", "/") + ".py"
                    if (root / candidate).is_file():
                        names.add(candidate)
            for value in strings:
                # Embedded generated code and subprocess command strings can
                # execute helpers too. Conservatively include their literals;
                # dynamic paths still require explicit stage tool inputs.
                names.update(re.findall(r"scripts/[\w./-]+\.(?:py|mjs|java)", value))
                names.update("scripts/" + name for name in re.findall(r"[\w.-]+\.(?:py|mjs)", value)
                             if (root / "scripts" / name).is_file())
        else:
            names.update(re.findall(r"scripts/[\w./-]+\.(?:py|mjs|java)", text))
            names.update("scripts/" + name for name in re.findall(r"[\w.-]+\.(?:py|mjs)", text)
                         if (root / "scripts" / name).is_file())
        pending.extend(name for name in names if (root / name).is_file() and name not in found)
    return {name: file_digest(root / name) for name in sorted(found)}


def expand_files(root, patterns):
    files = set()
    for pattern in patterns:
        if Path(pattern).is_absolute() or ".." in Path(pattern).parts:
            raise ValueError("Use project-relative input patterns")
        matches = list(root.glob(pattern))
        if not matches:
            raise ValueError(f"Missing pipeline input: {pattern}")
        for path in matches:
            local(root, path.relative_to(root))
            if path.is_dir():
                raise ValueError(f"Declare file patterns instead of directories: {pattern}")
            files.add(path.relative_to(root).as_posix())
    return {name: file_digest(root / name) for name in sorted(files)}


def manifest_inputs(root, inputs):
    """Bind retained payloads as well as their small manifest files.

    Historical producer script hashes are provenance, not expected current tool
    bytes. Native input manifests and gzip/SQLite payload commitments are inputs.
    """
    result, pending = dict(inputs), list(inputs)
    def references(value):
        if isinstance(value, dict):
            name, sha = value.get("path"), value.get("sha256")
            if isinstance(name, str) and isinstance(sha, str) and name.startswith(("runtime/", "docs/")):
                yield name, sha
            directory, files = value.get("directory"), value.get("files")
            if isinstance(directory, str) and directory.startswith("runtime/") and isinstance(files, dict):
                for name, record in files.items():
                    if isinstance(record, dict) and isinstance(record.get("sha256"), str):
                        yield str(Path(directory) / name), record["sha256"]
            for item in value.values():
                yield from references(item)
        elif isinstance(value, list):
            for item in value:
                yield from references(item)
    visited = set()
    while pending:
        name = pending.pop()
        if name in visited:
            continue
        visited.add(name)
        path = local(root, name)
        if path.suffix == ".sqlite":
            from shared_native_inventory import historical_file_sha256
            historical_file_sha256(path, root=root)
        # Large inventories are leaf payloads. Their exact bytes are still bound.
        if path.suffix != ".json" or path.stat().st_size > 32 * 1024 * 1024:
            continue
        for child, _expected in references(json.loads(path.read_bytes())):
            if child in result:
                continue
            child_path = local(root, child)
            if not child_path.is_file():
                result[child] = "missing-referenced-payload"
                continue
            observed = file_digest(child_path)
            if child_path.suffix == ".sqlite":
                from shared_native_inventory import historical_file_sha256
                historical_file_sha256(child_path, root=root)
            # Bind available bytes/missing states without relabeling historical
            # commitments. The producer validates required payloads and may
            # legitimately recover optional old artifacts through another source.
            if child not in result:
                result[child] = observed
                # Follow runtime evidence payloads; readable historical reports
                # are leaf provenance. Their own former references may have
                # moved, and their original bytes are retained through Git.
                if child.startswith("runtime/"):
                    pending.append(child)
    return dict(sorted(result.items()))


@contextmanager
def leases(directory, names):
    """Sorted cross-process locks prevent parallel writers and lock inversion."""
    descriptors = []
    try:
        for name in sorted(set(names)):
            path = directory / (digest(name) + ".lock")
            descriptor = path.open("a+b")
            fcntl.flock(descriptor, fcntl.LOCK_EX)
            descriptors.append(descriptor)
        yield
    finally:
        for descriptor in reversed(descriptors):
            fcntl.flock(descriptor, fcntl.LOCK_UN); descriptor.close()


class AuditSession:
    """Fresh scan witnesses for phases belonging to one user-requested audit.

    Witnesses control whether a fresh scan must execute, never its semantic
    receipt/cache key. A new audit reruns scans without invalidating unchanged
    downstream artifacts just because the execution witness is new.
    """
    def __init__(self, root, path, identity, *, new=False):
        self.root = Path(root).resolve()
        self.path = local(self.root, path)
        self.path = self.path.parent.resolve() / self.path.name
        if not self.path.is_relative_to(self.root / "runtime") or self.path.is_symlink():
            raise ValueError("Audit session must be a regular project runtime JSON file")
        self.path.parent.mkdir(parents=True, exist_ok=True)
        self.lock_path = self.path.with_suffix(self.path.suffix + ".lock")
        self.identity = identity
        with self._lock():
            if new or not self.path.exists():
                if self.path.exists():
                    previous = json.loads(self.path.read_bytes())
                    previous_id = str(uuid.UUID(previous["id"]))
                    archive = self.path.parent / (self.path.stem + ".runs") / (previous_id + ".json")
                    atomic_json(archive, previous)
                document = {"format": "execheck-audit-session-v1", "id": str(uuid.uuid4()), "target": identity,
                            "started_at_unix": time.time(), "fresh_scans": {}, "phases": []}
                atomic_json(self.path, document)
            else:
                document = json.loads(self.path.read_bytes())
            if document.get("format") != "execheck-audit-session-v1" or document.get("target") != identity:
                raise ValueError("Audit session target/resources differ; start a new audit")
            self.id = document["id"]

    @contextmanager
    def _lock(self):
        with self.lock_path.open("a+b") as descriptor:
            fcntl.flock(descriptor, fcntl.LOCK_EX)
            try:
                yield
            finally:
                fcntl.flock(descriptor, fcntl.LOCK_UN)

    def _document(self):
        document = json.loads(self.path.read_bytes())
        if document.get("id") != self.id or document.get("target") != self.identity:
            raise ValueError("Audit session was replaced while a phase was active")
        return document

    def witnessed(self, name, key):
        with self._lock():
            return self._document()["fresh_scans"].get(name, {}).get("stage_key") == key

    def remember(self, name, key, seal):
        with self._lock():
            document = self._document()
            document["fresh_scans"][name] = {"stage_key": key, "receipt_sha256": seal}
            atomic_json(self.path, document)

    def record_run(self, report):
        with self._lock():
            document = self._document()
            document.setdefault("phases", []).append({key: report[key] for key in
                ("phase", "wall_seconds", "started_at_unix", "finished_at_unix", "stages", "errors")})
            document["elapsed_seconds"] = time.time() - document["started_at_unix"]
            atomic_json(self.path, document)


class Pipeline:
    def __init__(self, root, identity, stages, *, workers=2, memory_mb=10000,
                 environment=None, notify=print, audit_session=None, phase="custom",
                 runner_predecessor=None):
        self.root = Path(root).resolve()
        self.identity, self.stages = identity, {stage["id"]: stage for stage in stages}
        if len(self.stages) != len(stages):
            raise ValueError("Duplicate stage id")
        if workers < 1 or memory_mb < 1:
            raise ValueError("Positive worker and memory budgets required")
        self.workers, self.memory_mb = workers, memory_mb
        self.environment = dict(environment or {})
        self.notify = notify
        self.audit_session = audit_session
        self.phase = phase
        self.runner_predecessor = runner_predecessor
        if audit_session and audit_session.identity.get("sha256") != identity.get("sha256"):
            raise ValueError("Pipeline and audit session targets differ")
        self.processes, self.process_lock = set(), threading.Lock()
        self.stage_measurements = {}
        self.cancelled = threading.Event()
        self._validate()
        self.store = SharedAnalysis(self.root)
        with self.store.connect() as connection:
            connection.executescript(SCHEMA)
        self.directory = self.root / "runtime/analysis/pipeline"
        self.locks = self.directory / "locks"
        self.locks.mkdir(parents=True, exist_ok=True)

    def _validate(self):
        visited, active, output_owners = set(), set(), {}
        def visit(name):
            if name not in self.stages:
                raise ValueError(f"Unknown stage dependency: {name}")
            if name in active:
                raise ValueError("Cyclic pipeline")
            if name in visited:
                return
            stage = self.stages[name]
            if not re.fullmatch(r"[a-z0-9][a-z0-9_-]*", name):
                raise ValueError("Invalid stage name")
            if not isinstance(stage.get("argv"), list) or not stage["argv"]:
                raise ValueError(f"Missing argument vector: {name}")
            if not stage.get("transitive_inputs", True) and stage.get("cache", True):
                raise ValueError("An always-run domain validator is required when transitive input expansion is disabled")
            if not 0 < stage.get("memory_mb", 1024) <= self.memory_mb:
                raise ValueError(f"Stage exceeds memory budget: {name}")
            active.add(name)
            for dependency in stage.get("needs", []):
                visit(dependency)
            active.remove(name); visited.add(name)
            for output in stage.get("outputs", []):
                local(self.root, output)
                if output in output_owners:
                    raise ValueError(f"Two stage writers for {output}")
                output_owners[output] = name
        for name in self.stages:
            visit(name)

    def _commitment(self, stage, parents):
        environment = self._environment(stage)
        runner_sha256 = file_digest(Path(__file__))
        if self.runner_predecessor and runner_sha256 == self.runner_predecessor[0]:
            runner_sha256 = self.runner_predecessor[1]
        # Include native libraries, interpreter and settings, not just script bytes.
        executable = shutil.which(stage["argv"][0], path=environment.get("PATH"))
        if not executable:
            raise ValueError(f"Missing executable: {stage['argv'][0]}")
        history = None
        if stage.get("git_history"):
            head = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=self.root, text=True).strip()
            refs = subprocess.check_output(["git", "for-each-ref", "--format=%(objectname)"], cwd=self.root, text=True)
            history = {"head": head, "refs": sorted(set(refs.splitlines()))}
        return {"format": FORMAT, "target": self.identity, "stage": {key: value for key, value in stage.items() if key != "env"},
                "runner_sha256": runner_sha256,
                "git_history": history,
                "tool_provenance_sha256": file_digest(self.root / "docs/analysis/script-provenance.json") if (self.root / "docs/analysis/script-provenance.json").is_file() else None,
                "interpreter": {"path": str(Path(executable).resolve()),
                                "sha256": file_digest(Path(executable).resolve())},
                "environment": {key: hashlib.sha256(value.encode()).hexdigest() for key, value in environment.items() if key != "REA_STAGE_METRICS_PATH"},
                "tools": source_closure(self.root, stage.get("tools", [])),
                "inputs": (manifest_inputs(self.root, expand_files(self.root, stage.get("inputs", [])))
                           if stage.get("transitive_inputs", True) else expand_files(self.root, stage.get("inputs", []))),
                "parents": {name: parents[name]["seal_sha256"] for name in stage.get("needs", [])}}

    def _environment(self, stage):
        # Inherited analysis controls affect cache identity; unrelated process
        # credentials are neither propagated nor written into durable receipts.
        allowed = {"PATH", "HOME", "USER", "LOGNAME", "SHELL", "LANG", "LC_ALL", "TZ", "TMPDIR", "JAVA_HOME", "PYTHONPATH", "PYTHONDONTWRITEBYTECODE", "PYTHONHASHSEED"}
        inherited = {key: value for key, value in os.environ.items()
                     if key in allowed or key.startswith(("REA_", "GHIDRA_", "DYLD_", "LD_"))}
        return inherited | self.environment | stage.get("env", {})

    def _cached(self, key):
        with self.store.connect() as connection:
            row = connection.execute("SELECT receipt_sha256 FROM execheck_stage_cache WHERE stage_key=?", (key,)).fetchone()
        if not row:
            return None
        path = self.store.object_path(row[0])
        if file_digest(path) != row[0]:
            raise ValueError("Corrupt stage receipt")
        receipt = json.loads(path.read_bytes())
        if receipt.get("stage_key") != key:
            raise ValueError("Stage receipt key differs")
        for name, item in receipt["outputs"].items():
            path = local(self.root, name)
            if not path.is_file() or file_digest(path) != item["sha256"]:
                return None
            sealed = self.store.object_path(item["sha256"])
            if not sealed.is_file() or file_digest(sealed) != item["sha256"]:
                raise ValueError("Corrupt immutable stage output")
        try:
            current = manifest_inputs(self.root, {name: item["sha256"] for name, item in receipt["outputs"].items()})
        except (OSError, ValueError):
            return None
        if current != receipt.get("output_closure"):
            return None
        return receipt | {"seal_sha256": row[0]}

    def _seal_file(self, path, key):
        if shareable_stage_output(self.root, path):
            receipt = self.store.migrate_file(path, {"stage_key": key})
            return {field: receipt[field] for field in ("sha256", "bytes")}
        sha = file_digest(path)
        destination = self.store.object_path(sha)
        if destination.exists():
            if file_digest(destination) != sha:
                raise ValueError("Corrupt stage output in CAS")
            return {"sha256": sha, "bytes": path.stat().st_size}
        # put_file hard-links; snapshot first so a later producer cannot mutate CAS.
        with tempfile.TemporaryDirectory(prefix=".seal-", dir=self.directory) as staging:
            pending = Path(staging) / "payload"
            if not clone_file(path, pending):
                shutil.copyfile(path, pending)
            if file_digest(pending) != sha or file_digest(path) != sha:
                raise ValueError("Stage output changed during publication")
            self.store.put_file(pending, "execheck-stage-output", {"stage_key": key})
        return {"sha256": sha, "bytes": path.stat().st_size}

    def _detach_output_aliases(self, stage):
        """Protect preexisting CAS objects even for an in-place legacy producer."""
        aliases = []
        for name in stage.get("outputs", []):
            path = local(self.root, name)
            if not path.is_symlink():
                continue
            target = path.resolve(strict=True)
            if not target.is_relative_to(self.store.objects):
                raise ValueError(f"Output aliases an unexpected mutable file: {name}")
            if shareable_stage_output(self.root, path):
                continue
            with tempfile.TemporaryDirectory(prefix=".producer-", dir=path.parent) as staging:
                pending = Path(staging) / "payload"
                if not clone_file(target, pending):
                    shutil.copyfile(target, pending)
                pending.chmod(0o600)
                os.replace(pending, path)
            aliases.append(name)
        return aliases

    def _execute(self, stage, parents):
        name = stage["id"]
        resources = stage.get("resources", []) + ["stage:" + name]
        if stage.get("publisher"):
            resources.append("target-publisher:" + self.identity["sha256"])
        with leases(self.locks, resources):
            if self.cancelled.is_set():
                raise RuntimeError("Pipeline interrupted")
            for parent in stage.get("needs", []):
                for path, expected in parents[parent]["output_closure"].items():
                    if expected == "missing-referenced-payload" and not local(self.root, path).is_file():
                        continue
                    if file_digest(local(self.root, path)) != expected:
                        raise ValueError(f"{name}: published parent output changed: {path}")
            cache_started = time.monotonic()
            commitment = self._commitment(stage, parents)
            key = digest(commitment)
            reuse = stage.get("cache", True)
            fresh_in_session = stage.get("fresh_each_audit", False) and self.audit_session is not None
            if fresh_in_session:
                reuse = self.audit_session.witnessed(name, key)
            cached = self._cached(key) if reuse else None
            if cached:
                self.notify(f"{name}: verified cache hit")
                return cached | {"cache_hit": True, "metrics": {"cache_validation_seconds": time.monotonic() - cache_started}}
            log = self.directory / (name + "-" + key + ".log")
            metrics_path = self.directory / (name + "-" + key + ".metrics.json")
            metrics_path.unlink(missing_ok=True)
            environment = self._environment(stage)
            environment["REA_STAGE_METRICS_PATH"] = str(metrics_path)
            for value in stage.get("outputs", []):
                local(self.root, value).parent.mkdir(parents=True, exist_ok=True)
            detached = self._detach_output_aliases(stage)
            self.notify(f"{name}: started")
            started = time.monotonic()
            with log.open("wb") as stream:
                with self.process_lock:
                    if self.cancelled.is_set():
                        raise RuntimeError("Pipeline interrupted before launch")
                    process = subprocess.Popen(stage["argv"], cwd=self.root, env=environment,
                                               stdout=stream, stderr=subprocess.STDOUT, start_new_session=True)
                    self.processes.add(process)
                if hasattr(os, "wait4"):
                    _, status, usage = os.wait4(process.pid, 0)
                    process.returncode = os.waitstatus_to_exitcode(status)
                    metrics = {"cpu_user_seconds": usage.ru_utime, "cpu_system_seconds": usage.ru_stime,
                               "peak_rss_bytes": usage.ru_maxrss * (1 if sys.platform == "darwin" else 1024)}
                else:
                    process.wait(); metrics = {"cpu_user_seconds": None, "cpu_system_seconds": None, "peak_rss_bytes": None}
                with self.process_lock:
                    self.processes.remove(process)
            metrics["wall_seconds"] = time.monotonic() - started
            if metrics_path.is_file():
                try:
                    metrics["stage"] = json.loads(metrics_path.read_bytes())
                except (OSError, ValueError) as error:
                    metrics["stage_metrics_error"] = str(error)[:500]
                finally:
                    metrics_path.unlink(missing_ok=True)
            # Failed producers have no evidence receipt, but their spent time
            # must survive both ordinary failures and interrupted retries.
            self.stage_measurements[name] = metrics
            if process.returncode:
                raise RuntimeError(f"{name} failed ({process.returncode}); see {log.relative_to(self.root)}")
            if self.cancelled.is_set():
                raise RuntimeError("Pipeline interrupted before publication")
            # Readers may have run concurrently; never publish against drifting inputs.
            if self._commitment(stage, parents) != commitment:
                raise ValueError(f"{name}: inputs changed during execution")
            outputs = {value: self._seal_file(local(self.root, value), key) for value in stage.get("outputs", [])}
            for value in detached:
                path = local(self.root, value)
                if path.is_relative_to(self.root / "runtime"):
                    item = outputs[value]
                    receipt = item | {"path": self.store.object_path(item["sha256"]).relative_to(self.root).as_posix(), "kind": "execheck-stage-output"}
                    self.store.link_alias(path, receipt, {"stage_key": key})
            output_closure = manifest_inputs(self.root, {name: item["sha256"] for name, item in outputs.items()})
            receipt = {"format": FORMAT, "stage_key": key, "commitment": commitment, "outputs": outputs,
                       "output_closure": output_closure}
            seal = self.store.put_bytes(encoded(receipt), "execheck-stage-receipt", {"target": self.identity["sha256"], "stage": name})
            with self.store.connect() as connection:
                connection.execute("INSERT OR REPLACE INTO execheck_stage_cache VALUES (?,?)", (key, seal["sha256"]))
            if fresh_in_session:
                self.audit_session.remember(name, key, seal["sha256"])
            log.unlink(missing_ok=True)
            self.notify(f"{name}: finished in {metrics['wall_seconds']:.2f}s")
            return receipt | {"seal_sha256": seal["sha256"], "cache_hit": False, "metrics": metrics}

    def run(self):
        pending, running, done, errors = set(self.stages), {}, {}, {}
        started = time.monotonic()
        self.started_at_unix = time.time()
        interruption = None
        with ThreadPoolExecutor(max_workers=self.workers) as pool:
            try:
                return self._schedule(pool, pending, running, done, errors, started)
            except KeyboardInterrupt as error:
                import signal
                self.cancelled.set()
                with self.process_lock:
                    groups = [process.pid for process in self.processes]
                    for group in groups:
                        try:
                            os.killpg(group, signal.SIGTERM)
                        except ProcessLookupError:
                            pass
                time.sleep(1)
                for group in groups:
                    try:
                        os.killpg(group, signal.SIGKILL)
                    except ProcessLookupError:
                        pass
                interruption = error
        # Include interrupted work in the same journal after child termination;
        # otherwise retry time would disappear from the audit measurements.
        for future, name in running.items():
            try:
                done[name] = future.result()
            except Exception as error:
                errors[name] = str(error)
        errors["interrupted"] = "Pipeline interrupted; completed receipts are retained"
        self._report(done, errors, started)
        raise interruption

    def _schedule(self, pool, pending, running, done, errors, started):
        while pending or running:
            for name in sorted(pending):
                stage = self.stages[name]
                needs = set(stage.get("needs", []))
                if needs & errors.keys():
                    errors[name] = "blocked by failed dependency"; pending.remove(name); continue
                occupied = sum(self.stages[item]["memory_mb"] if "memory_mb" in self.stages[item] else 1024 for item in running.values())
                if needs <= done.keys() and len(running) < self.workers and occupied + stage.get("memory_mb", 1024) <= self.memory_mb:
                    running[pool.submit(self._execute, stage, dict(done))] = name; pending.remove(name)
            if not running:
                if pending:
                    continue  # Failed dependency propagation can take several levels.
                break
            completed, _ = wait(running, timeout=30, return_when=FIRST_COMPLETED)
            if not completed:
                self.notify("Running: " + ", ".join(sorted(running.values())))
            for future in completed:
                name = running.pop(future)
                try:
                    done[name] = future.result()
                except Exception as error:
                    errors[name] = str(error); self.notify(str(error))
        return self._report(done, errors, started)

    def _report(self, done, errors, started):
        stages = {name: {key: value[key] for key in ("seal_sha256", "cache_hit", "metrics")} for name, value in sorted(done.items())}
        for name, metrics in self.stage_measurements.items():
            if name not in done:
                stages[name] = {"cache_hit": False, "metrics": metrics,
                                "error": errors.get(name, "Interrupted before receipt publication")}
        report = {"format": "execheck-pipeline-run-v1", "target": self.identity, "phase": self.phase,
                  "started_at_unix": self.started_at_unix, "finished_at_unix": time.time(),
                  "wall_seconds": time.monotonic() - started,
                  "stages": dict(sorted(stages.items())),
                  "errors": errors, "automated_stages_complete": not errors,
                  "execheck_semantic_review_complete": False, "parity_verified": False}
        atomic_json(self.directory / (self.identity["sha256"] + "-latest.json"), report)
        if self.audit_session:
            self.audit_session.record_run(report)
        return report
