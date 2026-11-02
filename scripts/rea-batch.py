#!/usr/bin/env python3
"""Run a resumable static REA/Ghidra plan; never execute the target.

Plan: {"target":"...", "output":"runtime/rea-batch/run", "timeout":180,
"open_timeout":1800, "environment":{"REA_GHIDRA_STARTUP_TIMEOUT_MS":"1800000"},
"operations":[{"name":"analyze_function", "arguments":{"procedure":"0x..."},
"label":"guardian", "timeout":1800}]}. Completed queries are retained. Timeout
or transport failure reopens the saved analysis and retries the unfinished query.
"""

import argparse
import fcntl
import hashlib
import json
import os
from pathlib import Path
import re
import select
import shutil
import subprocess
import tempfile
import time

from coverage_common import artifact_path
from shared_analysis import SharedAnalysis

ROOT = Path(__file__).resolve().parent.parent
ENV_KEYS = {"REA_GHIDRA_STARTUP_TIMEOUT_MS", "REA_GHIDRA_SEED_FILE", "REA_GHIDRA_DISABLED_ANALYZERS",
            "REA_PROGRAM_VARIANT"}
STATIC_TOOLS = set("binary_overview binary_session procedure_pseudo_code analyze_function procedure_info "
                   "procedure_callers procedure_callees search_strings search_procedures xrefs read_bytes "
                   "inspect_native_instruction inspect_native_data_type resolve_containing_procedure "
                   "address_to_file_offset inspect_analysis_view get_evidence_bundle decompile_function "
                   "search_functions inspect_rust_binary procedure_references read_function_instructions".split())


def local_path(value):
    path = (ROOT / value).resolve()
    if not path.is_relative_to(ROOT):
        raise ValueError(f"Path escapes project: {value}")
    return path


def arguments_local(value, key=""):
    if isinstance(value, dict):
        return {k: arguments_local(v, k) for k, v in value.items()}
    if isinstance(value, list):
        return [arguments_local(v, key) for v in value]
    if isinstance(value, str) and (value.startswith("/") or key == "path" or
                                  key.endswith(("_path", "_dir", "_directory"))):
        return str(local_path(value))
    return value


def save(path, value):
    if path.is_symlink() or not path.parent.resolve().is_relative_to(ROOT / "runtime"):
        raise ValueError("Query output file escapes project runtime/ or is a symlink")
    descriptor, name = tempfile.mkstemp(prefix=path.name + ".", suffix=".pending", dir=path.parent)
    pending = Path(name)
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8") as stream:
            stream.write(json.dumps(value, indent=2, ensure_ascii=False) + "\n")
            stream.flush()
            os.fsync(stream.fileno())
        pending.replace(path)
        parent = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(parent)
        finally:
            os.close(parent)
    finally:
        pending.unlink(missing_ok=True)


class TransportFailure(RuntimeError):
    pass


class ToolFailure(RuntimeError):
    def __init__(self, response):
        super().__init__("REA returned an error; full response saved")
        self.response = response


def transient(error):
    if isinstance(error, (TimeoutError, TransportFailure, BrokenPipeError, ConnectionError)):
        return True
    if not isinstance(error, ToolFailure):
        return False
    response = error.response
    result = response.get("result", {})
    failure = result.get("structuredContent", {}).get("error", response.get("error", {}))
    # REA's pinned MCP projection places formal errors in a JSON text block.
    # Do not classify arbitrary diagnostic prose or search text as retryable.
    if not isinstance(failure, dict) or not failure.get("code", failure.get("_tag")):
        for content in result.get("content", []):
            if content.get("type") != "text":
                continue
            try:
                projected = json.loads(content.get("text", ""))
            except (TypeError, ValueError):
                continue
            if isinstance(projected, dict) and isinstance(projected.get("error"), dict):
                failure = projected["error"]
                break
    if not isinstance(failure, dict):
        return False
    code = str(failure.get("code", failure.get("_tag", ""))).lower()
    if code in {"analysis_cancelled", "analysiscancellederror", "cancelled"}:
        return False
    if code in {"analysis_timeout", "analysistimeouterror", "timeout", "provider_timeout", "process_exited"}:
        return True
    def process_failure(value):
        if isinstance(value, dict):
            if value.get("failure_kind") in {"timeout", "process"}:
                return True
            return any(process_failure(child) for child in value.values())
        return isinstance(value, list) and any(process_failure(child) for child in value)
    return process_failure(failure.get("details", failure.get("diagnostics", {})))


class _TransportClient:
    def __init__(self, output, environment):
        self.output, self.sequence, self.buffer, self.calls = output, 0, b"", []
        self.stderr = (output / "mcp-stderr.log").open("wb")
        self.stdout = (output / "mcp-stdout.jsonl").open("wb")
        self.process = subprocess.Popen([str(ROOT / "scripts/rea"), "mcp"], cwd=ROOT,
                                        env=environment, stdin=subprocess.PIPE,
                                        stdout=subprocess.PIPE, stderr=self.stderr, bufsize=0)

    def send(self, message):
        data = (json.dumps(message) + "\n").encode()
        view = memoryview(data)
        while view:
            view = view[os.write(self.process.stdin.fileno(), view):]

    def request(self, method, params, timeout, label):
        self.sequence += 1
        request_id, started = self.sequence, time.monotonic()
        stem = f"{request_id:03d}-{re.sub(r'[^A-Za-z0-9_.-]+', '-', label)}"
        record = {"method": method, "params": params, "timeout": timeout}
        print(f"[{stem}] requesting (timeout {timeout}s)", flush=True)
        try:
            self.send({"jsonrpc": "2.0", "id": request_id, "method": method, "params": params})
            deadline = started + timeout
            while True:
                while b"\n" in self.buffer:
                    line, self.buffer = self.buffer.split(b"\n", 1)
                    if not line.strip():
                        continue
                    try:
                        response = json.loads(line)
                    except (ValueError, UnicodeDecodeError) as error:
                        raise TransportFailure("REA MCP returned invalid JSON") from error
                    if not isinstance(response, dict):
                        raise TransportFailure("REA MCP returned a non-object envelope")
                    if response.get("id") == request_id:
                        record["response"] = response
                        if (response.get("jsonrpc") != "2.0" or type(response["id"]) is not int or
                                ("result" in response) == ("error" in response)):
                            raise TransportFailure("REA MCP returned an invalid response envelope")
                        if "error" in response:
                            raise ToolFailure(response)
                        result = response["result"]
                        if not isinstance(result, dict) or not isinstance(result.get("structuredContent", {}), dict):
                            raise TransportFailure("REA MCP returned an invalid result object")
                        if result.get("isError") or "error" in result.get("structuredContent", {}):
                            raise ToolFailure(response)
                        return result
                remaining = deadline - time.monotonic()
                if remaining <= 0 or not select.select([self.process.stdout.fileno()], [], [], max(0, remaining))[0]:
                    self.send({"jsonrpc": "2.0", "method": "notifications/cancelled",
                               "params": {"requestId": request_id, "reason": "Batch call deadline exceeded"}})
                    raise TimeoutError(f"{label} exceeded {timeout}s")
                chunk = os.read(self.process.stdout.fileno(), 1024 * 1024)
                if not chunk:
                    raise TransportFailure("REA MCP exited; inspect mcp-stderr.log")
                self.stdout.write(chunk)
                self.stdout.flush()
                self.buffer += chunk
        except BaseException as error:
            record["error"] = f"{type(error).__name__}: {error}"
            if isinstance(error, KeyboardInterrupt):
                try:
                    self.send({"jsonrpc": "2.0", "method": "notifications/cancelled",
                               "params": {"requestId": request_id, "reason": "Batch interrupted"}})
                except (BrokenPipeError, OSError):
                    pass
            raise
        finally:
            record["elapsed_seconds"] = round(time.monotonic() - started, 3)
            save(self.output / f"{stem}.json", record)
            self.calls.append({"file": f"{stem}.json", "error": record.get("error"),
                               "elapsed_seconds": record["elapsed_seconds"]})
            print(f"[{stem}] {'ERROR' if 'error' in record else 'done'} ({record['elapsed_seconds']}s)", flush=True)

    def call(self, name, arguments, timeout, label=None):
        return self.request("tools/call", {"name": name, "arguments": arguments}, timeout, label or name)

    def stop(self):
        try:
            self.process.stdin.close()
        except BrokenPipeError:
            pass
        try:
            self.process.wait(timeout=10)
        except subprocess.TimeoutExpired:
            self.process.terminate()
            try:
                self.process.wait(timeout=10)
            except subprocess.TimeoutExpired:
                self.process.kill()
                self.process.wait()
        self.stdout.close()
        self.stderr.close()
        self.process.stdout.close()


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":")).encode()).hexdigest()


def file_digest(path):
    value = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            value.update(chunk)
    return value.hexdigest()


def runtime_output(value):
    path = local_path(value)
    if not path.is_relative_to(ROOT / "runtime") or path == ROOT / "runtime":
        raise ValueError("Query output must stay inside project runtime/")
    return path


class OutputLock:
    def __init__(self, directory):
        path = runtime_output(directory) / "query.lock"
        if path.is_symlink():
            raise ValueError("Query lock must not be a symlink")
        descriptor = os.open(path, os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW | os.O_NONBLOCK, 0o600)
        import stat
        if not stat.S_ISREG(os.fstat(descriptor).st_mode):
            os.close(descriptor)
            raise ValueError("Query lock must be a regular file")
        self.stream = os.fdopen(descriptor, "a+")
        try:
            fcntl.flock(self.stream, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            self.stream.close()
            raise ValueError("Another query runner owns this output") from None

    def close(self):
        if not self.stream.closed:
            fcntl.flock(self.stream, fcntl.LOCK_UN)
            self.stream.close()

    def __enter__(self):
        return self

    def __exit__(self, *unused):
        self.close()


def tooling_commitments():
    names = ["scripts/rea-batch.py", "scripts/rea", "scripts/repair-rea-reference-input.py",
             "scripts/repair-rea-durable-queries.py", "scripts/rea-durable-queries.mjs",
             "scripts/shared-ghidra-programs.mjs",
             "scripts/ghidra/ReaDurableQueryPrepare.java", "scripts/ghidra/ReaDurableQueryBridge.fragment.java",
             "node_modules/rea-agents/bridge/ghidra/ReaGhidraBridge.java",
             "node_modules/rea-agents/bridge/ghidra/ReaGhidraApplySeeds.java",
             "node_modules/rea-agents/dist/ghidra/GhidraLauncher.js",
             "node_modules/rea-agents/dist/ghidra/GhidraJavaLaunch.js",
             "node_modules/rea-agents/dist/ghidra/GhidraAnalysisProfile.js",
             "node_modules/rea-agents/dist/ghidra/GhidraProviderClient.js",
             "node_modules/rea-agents/dist/ghidra/GhidraSessionValues.js",
             "node_modules/rea-agents/dist/cli-runtime/binary-BVOr2mgE.js",
             "node_modules/rea-agents/dist/mcp/main-kBXHZ8S5.js"]
    return {name: file_digest(ROOT / name) for name in names if (ROOT / name).is_file()}


# These calls depend on the active MCP ledger/lifecycle, rather than immutable
# native observations. Their responses must not be replayed as a fresh ledger.
SESSION_TOOLS = {"open_binary", "close_binary", "binary_session", "get_evidence_bundle",
                 "export_evidence_bundle", "inspect_analysis_view"}


class ResumableClient:
    """Persist successful query units and retry only unfinished transient work.

    Saved result files retain their original REA Evidence and execution profile.
    A resumed query does not manufacture a new Evidence ID or claim a new native
    execution. The provider owns the separate saved Ghidra Program checkpoints.
    """
    def __init__(self, output, environment, *, journal_directory=None, retry_attempts=3,
                 identity_extra=None):
        self.output = runtime_output(output)
        self.output.mkdir(parents=True, exist_ok=True)
        self.directory = runtime_output(journal_directory or output)
        self.directory.mkdir(parents=True, exist_ok=True)
        if not isinstance(retry_attempts, int) or retry_attempts < 1:
            raise ValueError("retry_attempts must be a positive integer")
        self.lock = OutputLock(self.directory)
        self.environment = dict(environment)
        self.environment.setdefault("REA_DURABLE_QUERY_ROOT", str(ROOT / "runtime/ghidra-queries"))
        self.environment["REA_DURABLE_STATIC_QUERIES"] = "1"
        self.environment["REA_SHARED_PROGRAM_RECEIPT"] = str(self.directory / "current-program.json")
        self.retry_attempts = retry_attempts
        self.identity_extra = identity_extra
        self.calls, self.transport, self.initialization, self.opening = [], None, None, None
        self.journal_path = self.directory / "journal.json"
        try:
            if self.journal_path.is_symlink():
                raise ValueError("Query journal must not be a symlink")
            self.state = json.loads(self.journal_path.read_text()) if self.journal_path.exists() else None
        except BaseException:
            self.lock.close()
            raise
        self.tools = tooling_commitments()
        self.identity = None
        self._target_signature = None
        self._inputs = {}
        self._shared = None
        self.deferred = False
        self.request_lock = None
        self.request_directory = None
        self.native_slot = None

    def acquire_request(self):
        """Coalesce matching analysis contexts before any MCP/JVM startup.

        This kernel lease is released on interruption or process exit. Different
        task/output/seed filenames do not split identical native requests.
        """
        identity = {"target": self.identity["target"]["sha256"],
                    "open_options": self.identity["open_options"], "tooling": self.tools,
                    "inputs": sorted(self.identity["inputs"].values()),
                    "environment": {key: value for key, value in self.identity["environment"].items()
                                    if key not in {"REA_GHIDRA_SEED_FILE", "REA_GHIDRA_STARTUP_TIMEOUT_MS"}}}
        self.request_directory = runtime_output("runtime/analysis/requests/" + digest(identity))
        self.request_directory.mkdir(parents=True, exist_ok=True)
        if self.request_directory.resolve() != self.request_directory:
            raise ValueError("Shared request directory is redirected")
        # Seeds extend one Program. Serialize compatible profiles before timed
        # provider calls too, while keeping exact seed/tool cache contexts apart.
        gate = {"target": identity["target"], "open_options": identity["open_options"],
                "environment": {k: v for k, v in identity["environment"].items()
                                if k not in {"REA_GHIDRA_ALLOW_NEW_PE_ANALYSIS"}}}
        locks = runtime_output("runtime/analysis/requests/locks")
        locks.mkdir(parents=True, exist_ok=True)
        if locks.resolve() != locks:
            raise ValueError("Shared request lock directory is redirected")
        self.request_lock = os.open(locks / (digest(gate) + ".lock"),
                                    os.O_CREAT | os.O_RDWR | os.O_NOFOLLOW, 0o600)
        waiters = runtime_output("runtime/analysis/requests/waiters/" + digest(gate))
        waiters.mkdir(parents=True, exist_ok=True)
        if waiters.resolve() != waiters:
            raise ValueError("Shared request waiter directory is redirected")
        self.environment["REA_NATIVE_REQUEST_WAITERS"] = str(waiters)
        descriptor, name = tempfile.mkstemp(prefix="request-", suffix=".waiting", dir=waiters)
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX)
            try:
                fcntl.flock(self.request_lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except BlockingIOError:
                print("[Ghidra queue] waiting for matching native request; completed results will be reused", flush=True)
                fcntl.flock(self.request_lock, fcntl.LOCK_EX)
        finally:
            Path(name).unlink(missing_ok=True)
            os.close(descriptor)

    def remember_context(self):
        pointer = Path(self.environment["REA_SHARED_PROGRAM_RECEIPT"])
        if self.request_directory is not None and pointer.is_file() and self.shared_context() is not None:
            save(self.request_directory / "current-program.json", json.loads(pointer.read_text()))

    def ensure_open(self):
        if not self.deferred:
            return
        self.acquire_native_capacity()
        self.deferred = False
        params, timeout = self.initialization
        self.request("initialize", params, timeout, "initialize")
        self.send({"jsonrpc": "2.0", "method": "notifications/initialized"})
        arguments, timeout = self.opening
        self.call("open_binary", arguments, timeout)

    def acquire_native_capacity(self):
        if self.native_slot is not None:
            return
        script = Path(__file__).resolve().parent / "shared-ghidra-programs.mjs"
        receipt = self.directory / "native-process.json"
        command = [self.environment.get("REA_NODE_BINARY") or shutil.which("node"), str(script), "--native-lease",
                   str(ROOT / "runtime/analysis/programs"), str(receipt),
                   self.identity["target"]["sha256"],
                   "shared" if self.identity["open_options"].get("format") == "raw-binary" else "exclusive"]
        self.native_slot = subprocess.Popen(command, cwd=ROOT, stdin=subprocess.PIPE,
                                            stdout=subprocess.PIPE)
        ticket = self.native_slot.stdout.readline().decode().strip()
        if not ticket or self.native_slot.poll() is not None:
            raise RuntimeError("Native capacity custodian failed before admission")
        self.environment["REA_NATIVE_PERMIT"] = ticket
        self.environment["REA_NATIVE_PROCESS_RECEIPT"] = str(receipt)

    @property
    def shared(self):
        if self._shared is None:
            self._shared = SharedAnalysis(ROOT)
        return self._shared

    def verified_result_path(self, receipt):
        """Admit a historical result or its catalogued immutable CAS alias."""
        logical = Path(os.path.normpath(ROOT / receipt["path"]))
        if (not logical.is_relative_to(self.directory)
                and not logical.parent.resolve().is_relative_to(self.directory)):
            raise ValueError("Saved completed query result escaped output")
        resolved = logical.resolve()
        if not resolved.is_relative_to(self.directory):
            canonical = self.shared.object_path(receipt["sha256"])
            with self.shared.connect() as connection:
                alias = connection.execute("SELECT sha256 FROM analysis_aliases WHERE path=?",
                    (logical.relative_to(ROOT).as_posix(),)).fetchone()
            if resolved != canonical or alias != (receipt["sha256"],):
                raise ValueError("Saved result is not its catalogued shared object")
            self.shared.verify_receipt({"path": canonical.relative_to(ROOT).as_posix(),
                "sha256": receipt["sha256"], "bytes": canonical.stat().st_size})
        if file_digest(resolved) != receipt["sha256"]:
            raise ValueError("Saved completed query result changed")
        return resolved

    def shared_context(self):
        """Only a ready, revision-bound Program can supply cross-task cache hits.

        The launcher publishes a pointer after selecting the Program; Ghidra's
        saved readiness/revision remains authoritative. Never guess it from a
        task name or carry a result across target hashes.
        """
        offline = self.deferred
        pointer = (self.request_directory / "current-program.json" if offline and self.request_directory
                   else Path(self.environment["REA_SHARED_PROGRAM_RECEIPT"]))
        if pointer.is_symlink() or not pointer.is_file():
            return None
        descriptor = json.loads(pointer.read_text())
        root = Path(descriptor["root"])
        allowed = ROOT / "runtime/analysis/programs"
        if root.resolve() != root or not root.is_relative_to(allowed):
            raise ValueError("Shared Program receipt leaves the canonical workspace")
        if descriptor["target_sha256"] != self.identity["target"]["sha256"]:
            raise ValueError("Shared Program receipt belongs to another target")
        ready_path = root / "ready.json"
        if ready_path.is_symlink() or not ready_path.is_file():
            return None
        lease = None
        try:
            if offline:
                try:
                    lease = os.open(root / "program.lock", os.O_RDONLY | os.O_NOFOLLOW)
                    fcntl.flock(lease, fcntl.LOCK_SH | fcntl.LOCK_NB)
                except (FileNotFoundError, BlockingIOError):
                    return None
            ready = json.loads(ready_path.read_text())
        finally:
            if lease is not None:
                os.close(lease)
        if not ready.get("ready"):
            return None
        for key in ("target_sha256", "workspace_id", "profile_digest"):
            if ready.get(key) != descriptor.get(key):
                if offline and key == "profile_digest":
                    return None  # Another compatible request extended preparation.
                raise ValueError("Shared Program readiness commitment differs")
        revision = ready.get("revision")
        if type(revision) is not int or revision < 0:
            raise ValueError("Invalid saved Program revision")
        return {key: ready[key] for key in
                ("target_sha256", "workspace_id", "profile_digest", "revision")} | {
                    "preparation_sha256": ready.get("preparation_sha256")}

    def shared_query_identity(self, name, arguments):
        context = self.shared_context()
        if context is None:
            return None
        # Session profile/seed paths remain in provenance. Actual saved Program
        # preparation and revision determine reuse, independently of task paths.
        context = {key: value for key, value in context.items() if key != "profile_digest"}
        producer = {key: value for key, value in self.tools.items()
                    if key.startswith("node_modules/")}
        return {"format": "rea-shared-native-query-v1", "program": context,
                "producer": producer,
                "operation": {"name": name, "arguments": arguments}}

    def shared_hit(self, key, row, identity, label):
        if identity is None:
            return None
        receipt = self.shared.lookup_query_receipt(identity)
        if receipt is None:
            return None
        path = self.directory / "results" / (key + "-" + receipt["identity_sha256"][:16] + ".json")
        self.shared.link_alias(path, receipt, provenance={"journal": str(self.journal_path), "identity": identity})
        row.update(status="completed", shared_identity=identity,
                   result={"path": path.relative_to(ROOT).as_posix(), "sha256": receipt["sha256"]})
        save(self.journal_path, self.state)
        print(f"[{label or row['name']}] using shared completed query", flush=True)
        return json.loads(self.shared.verify_receipt(receipt).read_text())

    @property
    def sequence(self):
        return len(self.calls)

    def _spawn(self):
        attempts = self.directory / "attempts"
        if attempts.is_symlink():
            raise ValueError("Query attempt directory must not be a symlink")
        attempts.mkdir(exist_ok=True)
        number = max([int(path.name) for path in attempts.iterdir() if path.name.isdigit()] or [0]) + 1
        directory = attempts / f"{number:04d}"
        directory.mkdir()
        self.transport = _TransportClient(directory, self.environment)

    def _record(self, action):
        if self.transport is None:
            self._spawn()
        first = len(self.transport.calls)
        try:
            return action(self.transport)
        finally:
            for row in self.transport.calls[first:]:
                path = self.transport.output / row["file"]
                self.calls.append({**row, "file": os.path.relpath(path, self.output)})

    def request(self, method, params, timeout, label):
        for attempt in range(self.retry_attempts if method == "initialize" else 1):
            try:
                result = self._record(lambda client: client.request(method, params, timeout, label))
                if method == "initialize":
                    self.initialization = (params, timeout)
                return result
            except BaseException as error:
                if not transient(error) or attempt + 1 >= self.retry_attempts:
                    raise
                print(f"[{label}] transient initialization failure; retrying ({attempt + 2}/{self.retry_attempts})", flush=True)
                self.transport.stop()
                self.transport = None

    def send(self, message):
        if self.transport is None:
            self._spawn()
        self.transport.send(message)

    def _bind(self, arguments):
        target = artifact_path(arguments["path"])
        if not target.is_file():
            raise ValueError("Query target is not a regular file")
        inputs = {}
        seed = self.environment.get("REA_GHIDRA_SEED_FILE")
        if seed:
            path = local_path(seed)
            inputs[path.relative_to(ROOT).as_posix()] = file_digest(path)
        identity = {"target": {"path": str(target), "sha256": file_digest(target),
                               "size_bytes": target.stat().st_size},
                    "open_options": {key: value for key, value in arguments.items() if key != "path"},
                    "environment": {key: self.environment[key] for key in sorted(ENV_KEYS | {
                        "GHIDRA_HEADLESS_MAXMEM", "GHIDRA_MAXMEM", "GHIDRA_INSTALL_DIR", "REA_JAVA_HOME",
                        "JAVA_HOME", "REA_DURABLE_QUERY_ROOT", "REA_DURABLE_STATIC_QUERIES"}) if key in self.environment},
                    "inputs": inputs, "tooling": self.tools, "plan": self.identity_extra}
        if self.state is not None:
            if (self.state.get("schema_version") != 1 or self.state.get("identity") != identity
                    or self.state.get("identity_sha256") != digest(identity)):
                raise ValueError("Saved query target, plan, tool or seed identity differs; retain it and use a new output")
        else:
            self.state = {"schema_version": 1, "identity": identity, "identity_sha256": digest(identity),
                          "status": "running", "operations": {}}
        self.identity = identity
        self._inputs = {ROOT / name: expected for name, expected in {**self.tools, **inputs}.items()}
        if self.identity_extra and self.identity_extra.get("plan_path"):
            self._inputs[local_path(self.identity_extra["plan_path"])] = self.identity_extra["plan_sha256"]
        self._target_signature = (target, target.stat().st_size, target.stat().st_mtime_ns)
        self.state["status"] = "running"
        save(self.journal_path, self.state)

    def prepare_open(self, arguments):
        """Validate stored commitments before spawning any provider process."""
        self._bind(arguments)
        for row in self.state["operations"].values():
            if row.get("status") == "completed":
                self.verified_result_path(row["result"])

    def _verify_inputs(self, *, rehash=False):
        if self.identity is None:
            raise ValueError("Open the target before issuing a native query")
        path, size, modified = self._target_signature
        if (path.stat().st_size, path.stat().st_mtime_ns) != (size, modified):
            raise ValueError("Query target changed during the run")
        if rehash and file_digest(path) != self.identity["target"]["sha256"]:
            raise ValueError("Query target digest changed")
        for path, expected in self._inputs.items():
            if file_digest(path) != expected:
                raise ValueError("Query tool or seed changed during the run: " + str(path))

    def _restart(self):
        self._verify_inputs(rehash=True)
        if self.transport is not None:
            try:
                self._record(lambda client: client.call("close_binary", {}, 10))
            except Exception:
                pass  # Full failure record is retained; provider owns orphan cleanup.
            self.transport.stop()
            self.transport = None
        self._spawn()
        if self.initialization is None or self.opening is None:
            raise ValueError("Cannot recover a query without initialize/open commitments")
        params, timeout = self.initialization
        self._record(lambda client: client.request("initialize", params, timeout, "initialize"))
        self.transport.send({"jsonrpc": "2.0", "method": "notifications/initialized"})
        arguments, timeout = self.opening
        return self._record(lambda client: client.call("open_binary", arguments, timeout))

    def call(self, name, arguments, timeout, label=None):
        if name == "open_binary":
            self._bind(arguments)
            self.opening = (dict(arguments), timeout)
            for attempt in range(self.retry_attempts):
                try:
                    return self._restart() if attempt else self._record(lambda client: client.call(name, arguments, timeout, label))
                except BaseException as error:
                    if not transient(error) or attempt + 1 >= self.retry_attempts:
                        raise
                    print(f"[open_binary] transient failure; reopening ({attempt + 2}/{self.retry_attempts})", flush=True)
        if name in SESSION_TOOLS:
            self.ensure_open()
            return self._record(lambda client: client.call(name, arguments, timeout, label))
        if name not in STATIC_TOOLS:
            raise ValueError("Only static REA operations are resumable")
        self._verify_inputs()
        key = digest({"name": name, "arguments": arguments})
        operations = self.state["operations"]
        row = operations.setdefault(key, {"name": name, "arguments": arguments, "status": "pending", "attempts": 0})
        if self.deferred:
            context = self.shared_query_identity(name, arguments)
            if context is not None:
                if row["status"] == "completed" and row.get("shared_identity") == context:
                    print(f"[{label or name}] using saved completed query without provider startup", flush=True)
                    return json.loads(self.verified_result_path(row["result"]).read_text())
                cached = self.shared_hit(key, row, context, label)
                if cached is not None:
                    return cached
            self.ensure_open()
        shared_identity = self.shared_query_identity(name, arguments)
        if row["status"] == "completed":
            path = self.verified_result_path(row["result"])
            if row.get("shared_identity") == shared_identity:
                print(f"[{label or name}] using saved completed query", flush=True)
                return json.loads(path.read_text())
            row.setdefault("prior_results", []).append({"result": row.pop("result"),
                                                         "shared_identity": row.pop("shared_identity", None)})
            row["status"] = "pending"
        cached = self.shared_hit(key, row, shared_identity, label)
        if cached is not None:
            return cached
        for attempt in range(self.retry_attempts):
            row.update(status="running", attempts=row["attempts"] + 1)
            row.pop("error", None)
            save(self.journal_path, self.state)
            try:
                if attempt:
                    self._restart()
                    shared_identity = self.shared_query_identity(name, arguments)
                    cached = self.shared_hit(key, row, shared_identity, label)
                    if cached is not None:
                        return cached
                result = self._record(lambda client: client.call(name, arguments, timeout, label))
                self._verify_inputs()
                if shared_identity is None:
                    # The provider starts lazily on the first native operation.
                    # Its now-saved revision is protected by the live Program lease.
                    shared_identity = self.shared_query_identity(name, arguments)
                results = self.directory / "results"
                if results.is_symlink():
                    raise ValueError("Query result directory must not be a symlink")
                results.mkdir(exist_ok=True)
                if shared_identity is not None:
                    if self.shared_query_identity(name, arguments) != shared_identity:
                        raise ValueError("Saved Program changed during a static query")
                    receipt = self.shared.publish_query(shared_identity, result)
                    path = results / (key + "-" + receipt["identity_sha256"][:16] + ".json")
                    self.shared.link_alias(path, receipt, provenance={"journal": str(self.journal_path),
                                                                   "identity": shared_identity})
                    row["shared_identity"] = shared_identity
                else:
                    path = results / (key + ".json")
                    save(path, result)
                row.update(status="completed", result={"path": path.relative_to(ROOT).as_posix(),
                                                        "sha256": file_digest(path)})
                save(self.journal_path, self.state)
                return result
            except BaseException as error:
                row.update(status="interrupted" if isinstance(error, KeyboardInterrupt) else "failed",
                           error=f"{type(error).__name__}: {error}")
                self.state["status"] = row["status"]
                save(self.journal_path, self.state)
                if not transient(error) or attempt + 1 >= self.retry_attempts:
                    raise
                print(f"[{label or name}] transient failure; reopening saved analysis and retrying unfinished query ({attempt + 2}/{self.retry_attempts})", flush=True)

    def stop(self):
        try:
            if self.transport is not None:
                self.transport.stop()
            elif (self.deferred and self.request_directory is not None
                  and (self.request_directory / "current-program.json").is_file()
                  and self.shared_context() is not None):
                # A preceding task kept the Program hot for queued consumers.
                # A cache-only final consumer can retire it without a JVM.
                pointer = json.loads((self.request_directory / "current-program.json").read_text())
                project = Path(pointer["root"]) / "project"
                if (project / "rea-project.gpr").is_file() and self.opening[0].get("format") == "raw-binary":
                    subprocess.run([sys.executable, "-B", str(Path(__file__).resolve().parent / "manage-program-archives.py"),
                                    "--archive", str(project), "--automatic-cache", "--defer-if-queued",
                                    self.environment["REA_NATIVE_REQUEST_WAITERS"]], cwd=ROOT, capture_output=True)
        finally:
            self.lock.close()
            if self.native_slot is not None:
                self.native_slot.stdin.close()
                self.native_slot.wait()
                self.native_slot.stdout.close()
                self.native_slot = None
            if self.request_lock is not None:
                os.close(self.request_lock)
                self.request_lock = None


# Existing selected-procedure census clients get the same recovery behavior.
Client = ResumableClient


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("plan", help="JSON plan path inside this checkout")
    parser.add_argument("--resume", action="store_true", help="Require an existing saved query journal")
    parser.add_argument("--retry-attempts", type=int, default=3)
    for flag in ("target", "output", "seed-file", "disabled-analyzers"):
        parser.add_argument("--" + flag)
    for flag in ("timeout", "open-timeout", "cleanup-timeout", "init-timeout", "startup-timeout-ms"):
        parser.add_argument("--" + flag, type=float)
    args = parser.parse_args()
    plan_path = local_path(args.plan)
    plan = json.loads(plan_path.read_text())
    if type(plan.get("allow_full_image_analysis", False)) is not bool:
        parser.error("allow_full_image_analysis must be a boolean")
    target = artifact_path(args.target or plan["target"])
    open_options = dict(plan.get("open_options", {}))
    if set(open_options) - {"format", "architecture", "entry_point"}:
        parser.error("open_options accepts only format, architecture, and entry_point")
    if open_options:
        if (open_options.get("format") != "raw-binary" or
                open_options.get("architecture") not in {"6502", "x86", "x86_64", "arm", "arm64"} or
                not re.fullmatch(r"0x[0-9a-fA-F]+", str(open_options.get("entry_point", "")))):
            parser.error("open_options must select raw-binary with a supported architecture and hexadecimal entry_point")
    output = runtime_output(args.output or plan.get("output", "runtime/analysis/tasks/" + plan_path.stem + "-" + file_digest(plan_path)[:16]))
    configured = dict(plan.get("environment", {}))
    if set(configured) - ENV_KEYS:
        parser.error("Plan environment only accepts " + ", ".join(sorted(ENV_KEYS)))
    for key, value in (("REA_GHIDRA_STARTUP_TIMEOUT_MS", args.startup_timeout_ms),
                       ("REA_GHIDRA_SEED_FILE", args.seed_file), ("REA_GHIDRA_DISABLED_ANALYZERS", args.disabled_analyzers)):
        if value is not None:
            configured[key] = str(int(value)) if key.endswith("_MS") else value
    environment = dict(os.environ)
    environment.update({k: str(v) for k, v in configured.items()})
    environment["REA_GHIDRA_ALLOW_NEW_PE_ANALYSIS"] = "1" if plan.get("allow_full_image_analysis", False) else "0"
    if environment.get("REA_GHIDRA_SEED_FILE"):
        environment["REA_GHIDRA_SEED_FILE"] = str(local_path(environment["REA_GHIDRA_SEED_FILE"]))
    timeout = args.timeout or plan.get("timeout", 180)
    cleanup = args.cleanup_timeout or plan.get("cleanup_timeout", 60)
    operations = plan.get("operations", [])
    if not isinstance(operations, list):
        parser.error("operations must be a list")
    for op in operations:
        if not isinstance(op, dict) or op.get("name") not in STATIC_TOOLS:
            parser.error("Only static REA operations are allowed: " + ", ".join(sorted(STATIC_TOOLS)))
        op["arguments"] = arguments_local(op.get("arguments", {}))
        if not isinstance(op["arguments"], dict) or op.get("timeout", timeout) <= 0:
            parser.error("Each operation needs object arguments and a positive timeout")
    initialization = args.init_timeout or plan.get("init_timeout", 30)
    if min(timeout, cleanup, initialization, args.open_timeout or plan.get("open_timeout", timeout)) <= 0:
        parser.error("Timeouts must be positive")
    if args.retry_attempts < 1:
        parser.error("--retry-attempts must be positive")
    if output.exists() and not (output / "journal.json").exists():
        raise ValueError("Output exists without a durable query journal; use a new output")
    if args.resume and not (output / "journal.json").exists():
        raise ValueError("--resume requires an existing query journal")
    output.mkdir(parents=True, exist_ok=True)
    effective = {"plan_path": plan_path.relative_to(ROOT).as_posix(),
                 "plan_sha256": file_digest(plan_path), "operations": operations,
                 "timeout": timeout, "cleanup_timeout": cleanup, "init_timeout": initialization,
                 "open_timeout": args.open_timeout or plan.get("open_timeout", timeout)}
    client = Client(output, environment, retry_attempts=args.retry_attempts, identity_extra=effective)
    try:
        client.prepare_open({"path": str(target), "provider_id": "ghidra", **open_options})
    except BaseException:
        client.stop()
        raise
    if not (output / "plan.json").exists():
        save(output / "plan.json", plan)
    failure, operation_errors, cleanup_errors = None, [], []
    try:
        client.acquire_request()
        client.initialization = ({"protocolVersion": "2025-06-18", "capabilities": {},
                                  "clientInfo": {"name": "AzerothSurvivorsRE-batch", "version": "1"}}, initialization)
        client.opening = ({"path": str(target), "provider_id": "ghidra", **open_options},
                          args.open_timeout or plan.get("open_timeout", timeout))
        client.deferred = True
        for op in operations:
            try:
                client.call(op["name"], op["arguments"], op.get("timeout", timeout), op.get("label"))
            except Exception as error:
                operation_errors.append({"operation": op, "error": f"{type(error).__name__}: {error}"})
                print(f"Operation failed: {error}", flush=True)
                if plan.get("stop_on_error", True):
                    raise
    except BaseException as error:
        failure = f"{type(error).__name__}: {error}"
    finally:
        if client.transport is not None:
            try:
                client.remember_context()
            except BaseException as error:
                cleanup_errors.append(f"cache context: {type(error).__name__}: {error}")
            bundle = ((client.transport.output / "evidence-bundle.json") if client.transport else
                      output / f"evidence-bundle-{time.time_ns()}.json")
            for name, arguments in (("export_evidence_bundle", {"path": str(bundle)}), ("close_binary", {})):
                try:
                    client.call(name, arguments, cleanup)
                except BaseException as error:
                    cleanup_errors.append(f"{name}: {type(error).__name__}: {error}")
                    print(f"Cleanup {name} failed: {error}", flush=True)
        if client.state is not None:
            client.state["status"] = "interrupted" if failure and failure.startswith("KeyboardInterrupt:") else "failed" if failure or operation_errors else "completed"
            save(client.journal_path, client.state)
        try:
            save(output / "run.json", {"target": str(target), "environment": {k: environment[k] for k in ENV_KEYS if k in environment},
                                       "failure": failure, "operation_errors": operation_errors, "cleanup_errors": cleanup_errors,
                                       "calls": client.calls})
        finally:
            client.stop()
    print(f"Results: {output}", flush=True)
    return int(bool(failure or operation_errors or cleanup_errors))


if __name__ == "__main__":
    raise SystemExit(main())
