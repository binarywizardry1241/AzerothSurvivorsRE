#!/usr/bin/env python3
"""Line-delimited fake MCP peer for the non-compiling batch recovery tests.

The scenario, counters and request transcript must all live under this checkout's
runtime directory. This peer never loads a provider or executes its target.
"""

import json
import os
from pathlib import Path
import sys
import time


ROOT = Path(__file__).resolve().parents[2]


def atomic_json(path, value):
    pending = path.with_suffix(path.suffix + ".pending")
    with pending.open("w") as stream:
        json.dump(value, stream)
        stream.write("\n")
        stream.flush()
        os.fsync(stream.fileno())
    pending.replace(path)


def main():
    scenario_path = Path(sys.argv[1]).resolve()
    if not scenario_path.is_relative_to(ROOT / "runtime"):
        raise ValueError("Fake MCP scenario must remain in project runtime")
    scenario = json.loads(scenario_path.read_text())
    state_path = scenario_path.parent / "peer-state.json"
    state = json.loads(state_path.read_text()) if state_path.exists() else {"launches": 0, "calls": {}}
    state["launches"] += 1
    generation = state["launches"]
    atomic_json(state_path, state)
    transcript = scenario_path.parent / "peer-requests.jsonl"

    def log(request):
        with transcript.open("a") as stream:
            stream.write(json.dumps({"generation": generation, "request": request}) + "\n")
            stream.flush()
            os.fsync(stream.fileno())

    def respond(identifier, result):
        sys.stdout.write(json.dumps({"jsonrpc": "2.0", "id": identifier, "result": result}) + "\n")
        sys.stdout.flush()

    for line in sys.stdin:
        request = json.loads(line)
        log(request)
        identifier = request.get("id")
        if identifier is None:
            continue
        initializing = request["method"] == "initialize"
        if not initializing and request["method"] != "tools/call":
            respond(identifier, {})
            continue
        name = "initialize" if initializing else request["params"]["name"]
        arguments = request.get("params", {}) if initializing else request["params"].get("arguments", {})
        state["calls"][name] = state["calls"].get(name, 0) + 1
        attempt = state["calls"][name]
        atomic_json(state_path, state)
        delay = scenario.get("delays", {}).get(name, 0)
        if delay:
            time.sleep(delay)
        # Match the real provider's lazy first-native-operation preparation.
        program = scenario.get("program")
        if program and name not in {"initialize", "open_binary", "close_binary", "export_evidence_bundle", "binary_session"}:
            directory = Path(program["root"])
            if not directory.resolve().is_relative_to(ROOT / "runtime"):
                raise ValueError("Fake Program leaves runtime")
            directory.mkdir(parents=True, exist_ok=True)
            (directory / "program.lock").touch()
            descriptor = {key: program[key] for key in ("root", "target_sha256", "workspace_id", "profile_digest")}
            atomic_json(Path(os.environ["REA_SHARED_PROGRAM_RECEIPT"]), descriptor)
            atomic_json(directory / "ready.json", {key: value for key, value in program.items() if key != "root"})
        actions = scenario.get("failures", {}).get(name, [])
        action = actions[attempt - 1] if attempt <= len(actions) else "success"
        if action == "exit":
            return 17
        if action in {"missing_result", "both_result_error", "invalid_result_shape"}:
            envelope = {"jsonrpc": "2.0", "id": identifier}
            if action == "both_result_error":
                envelope.update(result={"content": []}, error={"code": -32603, "message": "fixture malformed envelope"})
            elif action == "invalid_result_shape":
                envelope["result"] = ["A tool result must be an object"]
            sys.stdout.write(json.dumps(envelope) + "\n")
            sys.stdout.flush()
            continue
        if action in {"timeout", "partial"}:
            if action == "partial":
                # A response without its closing object/newline is not committed.
                sys.stdout.write(json.dumps({"jsonrpc": "2.0", "id": identifier, "result": {}})[:-1])
                sys.stdout.flush()
            # Cancellation/EOF ends promptly, so the runner's real deadline and
            # process ownership code are tested without long fixture sleeps.
            for pending in sys.stdin:
                cancellation = json.loads(pending)
                log(cancellation)
                if cancellation.get("method") == "notifications/cancelled":
                    return 0
            return 0
        if action in {"permanent", "provider_timeout"}:
            error = {"code": "invalid_argument" if action == "permanent" else "analysis_timeout",
                     "message": "fixture " + action}
            respond(identifier, {"isError": True, "structuredContent": {"error": error},
                                 "content": [{"type": "text", "text": json.dumps({"error": error})}]})
            continue
        if action in {"provider_timeout_text", "permanent_text", "process_failure_text"}:
            code = {"provider_timeout_text": "provider_timeout", "permanent_text": "invalid_argument",
                    "process_failure_text": "execution_failure"}[action]
            error = {"code": code, "message": "fixture " + action}
            if action != "permanent_text":
                error["details"] = {"diagnostics": {"failure_kind":
                    "process" if action == "process_failure_text" else "timeout"}}
            respond(identifier, {"isError": True,
                                 "content": [{"type": "text", "text": json.dumps({"error": error})}]})
            continue
        if initializing:
            respond(identifier, {"protocolVersion": "2025-06-18", "capabilities": {"tools": {}},
                                 "serverInfo": {"name": "durable-batch-fixture", "version": "1"}})
            continue
        if name == "export_evidence_bundle":
            output = Path(arguments["path"]).resolve()
            if not output.is_relative_to(ROOT / "runtime"):
                raise ValueError("Fake export escapes runtime")
            if output.exists():
                error = {"code": "invalid_argument", "message": "Evidence bundle output already exists"}
                respond(identifier, {"isError": True,
                                     "content": [{"type": "text", "text": json.dumps({"error": error})}]})
                continue
            atomic_json(output, {"records": []})
        respond(identifier, {"content": [{"type": "text", "text": json.dumps(
            {"fixture": True, "operation": name, "arguments": arguments,
             "generation": generation, "attempt": attempt})}]})
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
