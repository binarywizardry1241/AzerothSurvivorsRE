#!/usr/bin/env python3
"""Apply the pinned, project-local REA 6.5.0 seeded-function body repair.

Only analysis tooling changes: never the reference image or a saved database.
The distinct seed format enters REA's analysis-profile digest, so repaired and
upstream observations cannot silently share a resumable census profile.
"""

import argparse
import hashlib
import importlib.util
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
_reference_spec=importlib.util.spec_from_file_location('rea_reference_repair',ROOT/'scripts/repair-rea-reference-input.py')
_reference=importlib.util.module_from_spec(_reference_spec);_reference_spec.loader.exec_module(_reference)
FORMAT = "rea-ghidra-seeds-body-repair-v1"
UPSTREAM = {
    "bridge/ghidra/ReaGhidraApplySeeds.java": "27892a70bf0fbc72d1edc9bf070ddb21268f8d0e4edea074164488e68f45d51a",
    "dist/ghidra/GhidraAnalysisSeeds.js": "05b0c743062f157fc12219e9f06a82d3b4f8c15d69b4f0e6dc1530c6f05fb4d1",
    "dist/cli-runtime/binary-BVOr2mgE.js": "64c07dae6fe8b79a2015550cd8de208bc41f7b325dddd7262031ef76820c00df",
    "dist/mcp/main-kBXHZ8S5.js": "12a70d8ab2a57de0cc71d794e38470031bfbdde855ba4a435e0ac0613f2fe82e",
}
EARLY_OPTIONS = '''        // GhidraScript.disassemble() may run pending analysis during a seed
        // script. Apply the same profile-committed exclusions before decoding,
        // rather than waiting for REA's later analysis-options pre-script.
        String disabled = System.getenv("REA_GHIDRA_DISABLED_ANALYZERS");
        if (disabled != null && !disabled.isBlank()) {
            var options = getCurrentAnalysisOptionsAndValues(currentProgram);
            for (String name : disabled.split(",")) {
                name = name.trim();
                if (!options.containsKey(name)) {
                    throw new IllegalArgumentException("Unknown Ghidra analyzer: " + name);
                }
                setAnalysisOption(currentProgram, name, "false");
            }
        }
'''
BODY_REPAIR = '''        // The PE loader may have registered a one-address function before
        // decoding. A code seed alone does not recompute that function's body.
        // Use Ghidra's flow calculation, never the caller's unwind extent.
        for (Seed seed : seeds) {
            if (!seed.kind().equals("function") || seed.address() == null) continue;
            monitor.checkCancelled();
            Function function = getFunctionAt(seed.address());
            if (function != null && decoded(seed.address())) {
                ghidra.app.cmd.function.CreateFunctionCmd.fixupFunctionBody(
                    currentProgram, function, monitor);
            }
        }
'''


def patched_source(name, source):
    if hashlib.sha256(source).hexdigest() != UPSTREAM[name]:
        raise ValueError(f"Unrecognized upstream REA file: {name}")
    text = source.decode("utf-8").replace("rea-ghidra-seeds-v1", FORMAT)
    if name.endswith(".java"):
        start = '        String[] args = getScriptArgs();'
        if text.count(start) != 1:
            raise ValueError("REA seed argument anchor changed")
        text = text.replace(start, EARLY_OPTIONS + start)
        anchor = '        String report = '
        if text.count(anchor) != 1:
            raise ValueError("REA seed report anchor changed")
        text = text.replace(anchor, BODY_REPAIR + anchor)
    return text.encode("utf-8")


def changes(root):
    """Validate every input before writing any file; repeat application is safe."""
    result = []
    for name in UPSTREAM:
        path = root / name
        source = path.read_bytes()
        # Recover the original only from the exact patch we own. Any other
        # mutation, even in an already patched file, fails the upstream hash.
        text=source.decode("utf-8")
        reference_present=name in _reference.BUNDLES and _reference.insertion(name) in text
        normalized=_reference.strip(name,text) if reference_present else text
        original = normalized.replace(FORMAT, "rea-ghidra-seeds-v1")
        if name.endswith(".java"):
            original = original.replace(BODY_REPAIR, "")
            original = original.replace(EARLY_OPTIONS, "")
        expected = patched_source(name, original.encode("utf-8"))
        if normalized.encode('utf-8') != expected and normalized.encode('utf-8') != original.encode("utf-8"):
            raise ValueError(f"Unexpected partial REA repair: {name}")
        if reference_present:expected=_reference.patch(name,expected.decode('utf-8')).encode('utf-8')
        result.append((path, expected, source != expected))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true", help="repair only the pinned local npm dependency")
    args = parser.parse_args()
    try:
        prepared = changes(ROOT / "node_modules/rea-agents")
        for path, data, changed in prepared:
            if changed and args.apply:
                path.write_bytes(data)
            state = "applied" if changed and args.apply else "pending" if changed else "present"
            print(f"{state}: {path.relative_to(ROOT)} sha256={hashlib.sha256(data).hexdigest()}")
        return 0
    except (OSError, ValueError) as error:
        parser.exit(1, f"REA seeded-body repair: {error}\n")


if __name__ == "__main__":
    raise SystemExit(main())
