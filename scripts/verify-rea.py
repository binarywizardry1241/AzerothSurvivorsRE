#!/usr/bin/env python3
"""Smoke-check the installed REA MCP transport; optionally verify Ghidra analysis."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import selectors
import subprocess
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--native", action="store_true")
    args = parser.parse_args()
    root = Path(__file__).resolve().parent.parent
    output = root / "runtime/tool-state/verification"
    output.mkdir(parents=True, exist_ok=True)
    launcher = root / "scripts" / "rea"
    report = {
        "rea_version": subprocess.check_output([str(launcher), "--version"], cwd=root, text=True, timeout=30).strip(),
        "workspace": str(root),
    }
    with (output / "mcp-stderr.log").open("w") as stderr:
        process = subprocess.Popen([str(launcher), "mcp"], cwd=root, stdin=subprocess.PIPE,
                                   stdout=subprocess.PIPE, stderr=stderr, text=True, bufsize=1)
        selector = selectors.DefaultSelector()
        selector.register(process.stdout, selectors.EVENT_READ)
        request_id = 0

        def request(method, params, timeout=30):
            nonlocal request_id
            request_id += 1
            current_id = request_id
            process.stdin.write(json.dumps({"jsonrpc": "2.0", "id": current_id,
                                            "method": method, "params": params}) + "\n")
            process.stdin.flush()
            deadline = time.monotonic() + timeout
            while time.monotonic() < deadline:
                if not selector.select(max(0, deadline - time.monotonic())):
                    break
                line = process.stdout.readline()
                if not line:
                    raise RuntimeError("REA MCP exited; inspect runtime/tool-state/verification/mcp-stderr.log")
                message = json.loads(line)
                if message.get("id") != current_id:
                    continue
                if "error" in message:
                    raise RuntimeError(json.dumps(message["error"]))
                return message["result"]
            raise TimeoutError(f"REA MCP {method} timed out")

        def call(name, arguments, timeout=30):
            result = request("tools/call", {"name": name, "arguments": arguments}, timeout)
            if result.get("isError"):
                raise RuntimeError(json.dumps(result))
            structured = result.get("structuredContent", {})
            if "error" in structured:
                raise RuntimeError(json.dumps(structured["error"]))
            return result

        try:
            initialized = request("initialize", {"protocolVersion": "2025-06-18", "capabilities": {},
                                  "clientInfo": {"name": "AzerothSurvivorsRE-install-check", "version": "1.0.0"}})
            process.stdin.write(json.dumps({"jsonrpc": "2.0", "method": "notifications/initialized"}) + "\n")
            process.stdin.flush()
            report["server"] = initialized["serverInfo"]
            report["protocol_version"] = initialized["protocolVersion"]
            tools = request("tools/list", {})["tools"]
            report["tool_count"] = len(tools)
            names = {tool["name"] for tool in tools}
            required = {"binary_session", "open_binary", "close_binary"}
            if not required.issubset(names):
                raise RuntimeError(f"Missing REA tools: {required - names}")
            session = call("binary_session", {})
            (output / "session.json").write_text(json.dumps(session, indent=2) + "\n")
            report["mcp_handshake"] = "passed"
            report["binary_session"] = "passed"
            if args.native:
                source = output / "rea-probe.c"
                binary = output / "rea-probe"
                source.write_text('__attribute__((noinline)) int rea_probe(int value) { return value * 3 + 7; }\n'
                                  'int main(void) { return rea_probe(11); }\n')
                compiler_environment = dict(os.environ)
                compiler_environment["TMPDIR"] = str(root / "runtime" / "tmp")
                compiler_environment["CLANG_MODULE_CACHE_PATH"] = str(output / "clang-modules")
                subprocess.run(["clang", "-g", "-O0", str(source), "-o", str(binary)],
                               cwd=root, env=compiler_environment, check=True, timeout=60)
                report["native_target"] = str(binary.relative_to(root))
                report["native_target_sha256"] = hashlib.sha256(binary.read_bytes()).hexdigest()
                report["target_executed"] = False
                symbols = subprocess.check_output(["nm", "-g", str(binary)], cwd=root, text=True, timeout=30)
                procedure_address = next("0x" + line.split()[0] for line in symbols.splitlines()
                                         if line.split()[-1:] == ["_rea_probe"])
                report["procedure_address"] = procedure_address
                opened = False
                try:
                    opened_result = call("open_binary", {"path": str(binary), "provider_id": "ghidra"}, timeout=420)
                    opened = True
                    (output / "native-open.json").write_text(json.dumps(opened_result, indent=2) + "\n")
                    analyzed = call("analyze_function", {"procedure": procedure_address}, timeout=120)
                    (output / "native-function.json").write_text(json.dumps(analyzed, indent=2) + "\n")
                    evidence = analyzed["structuredContent"]
                    pseudocode = evidence["raw_result"]["value"]["pseudocode"]
                    if evidence["provider"]["id"] != "ghidra" or "* 3 + 7" not in pseudocode:
                        raise RuntimeError("Ghidra did not recover the expected probe function")
                    report["native_analysis"] = "passed"
                    report["provider"] = "ghidra"
                    report["procedure"] = "rea_probe"
                    report["evidence_id"] = evidence["evidence_id"]
                    report["pseudocode"] = pseudocode.strip()
                finally:
                    if opened:
                        call("close_binary", {}, timeout=60)
            else:
                report["native_analysis"] = "not requested"
            (output / "tool-schemas.json").write_text(json.dumps(
                [tool for tool in tools if tool["name"] in
                 {"open_binary", "close_binary", "decompile_function", "search_functions", "analyze_function"}], indent=2) + "\n")
        finally:
            process.stdin.close()
            try:
                process.wait(timeout=10)
            except subprocess.TimeoutExpired:
                process.terminate()
                process.wait(timeout=10)
            selector.close()
    (output / "report.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
