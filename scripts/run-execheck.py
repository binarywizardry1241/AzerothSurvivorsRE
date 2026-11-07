#!/usr/bin/env python3
"""Run/resume a static execheck dependency graph; default only prints its plan.

The reusable profile covers automated discovery and native derivation. Reviewed
contracts, findings, release items and discovery closure remain explicit work in
the execheck skill. Success here never declares those reviews complete.
"""
import argparse
import json
from pathlib import Path
import subprocess
import sys

from coverage_common import ROOT, file_sha256, latest_target, load_json, project_path
from execheck_pipeline import Pipeline, source_closure, AuditSession
from runtime_layout import owned_runtime_path
from shared_analysis import file_digest

# These changes preserve the exact stage inputs and sealed output bytes.
COMPATIBLE_RUNNER_REVISION = (
    "b14ad1ef9c96b17dd08da551d56897ac7d103cbe93a26255353844cbcf827fe0",
    "047cd44e961bbab64e50a88f5160fd352db142a52c38eca0059fb536e2282ab6",
)


def substitute(value, bindings):
    if isinstance(value, str):
        for key, replacement in bindings.items():
            value = value.replace("{" + key + "}", str(replacement))
        return value
    if isinstance(value, list):
        return [substitute(item, bindings) for item in value]
    if isinstance(value, dict):
        return {key: substitute(item, bindings) for key, item in value.items()}
    return value


def toolchain(python_path):
    """Bind the actual Capstone module and native decoder library, not its label."""
    result = {"python_version": sys.version, "python_executable_sha256": file_digest(Path(sys.executable).resolve())}
    if python_path:
        dependency = project_path(python_path)
        paths = sorted(path for path in dependency.rglob("*") if path.is_file() and path.suffix in (".py", ".so", ".dylib", ".dll"))
        if not paths:
            raise ValueError("No existing decoder dependency files in --python-path")
        result["decoder_files"] = {path.relative_to(ROOT).as_posix(): file_sha256(path) for path in paths}
    return result


def reconcile_frontier(root, target, census_summary):
    """Reject a stale publication frontier before repeating expensive readers."""
    classification = root / "docs/analysis/coverage/native-ownership-classification.json"
    action = "Publish reviewed ownership and applied switch proofs before --phase reconcile"
    if not classification.resolve().is_relative_to(root) or not classification.is_file():
        raise ValueError(action + ": classification is missing")
    document = json.loads(classification.read_bytes())
    if document.get("target", {}).get("sha256") != target["sha256"]:
        raise ValueError(action + ": classification target is stale")
    census = (root / census_summary).resolve()
    if not census.is_relative_to(root):
        raise ValueError("Census summary leaves the project")
    if ((root / document.get("census_summary", "")).resolve() != census
            or document.get("census_summary_sha256") != file_digest(census)):
        raise ValueError(action + ": classification census differs")
    switches = root / "docs/analysis/coverage/native-jump-tables.json"
    if (not switches.resolve().is_relative_to(root) or not switches.is_file()
            or json.loads(switches.read_bytes()).get("target", {}).get("sha256") != target["sha256"]):
        raise ValueError(action + ": applied switch target is stale")
    switch_proof = json.loads(switches.read_bytes())
    census_proof = json.loads(census.read_bytes())
    if (not census_proof.get("guarded_edge_digest")
            or switch_proof.get("edge_digest") != census_proof["guarded_edge_digest"]):
        raise ValueError(action + ": applied switch edges differ from the selected census")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", help="Optional project-local explicit DAG; default uses execheck_profile.py")
    parser.add_argument("--run", action="store_true")
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--memory-mb", type=int, default=10000)
    parser.add_argument("--python-path", help="Existing project-local Capstone dependency directory")
    parser.add_argument("--phase", choices=("scan", "native", "derive", "reconcile"), default="scan")
    parser.add_argument("--work", help="Reusable runtime output directory; default includes target and tool hashes")
    parser.add_argument("--census-summary", help="Reviewed verified summary for derive/reconcile phases")
    parser.add_argument("--audit-session", help="Project runtime JSON shared by phases of this audit")
    parser.add_argument("--new-audit", action="store_true", help="Start fresh scan witnesses; use once per user-requested audit")
    parser.add_argument("--bind", action="append", default=[], metavar="KEY=VALUE", help="Explicit profile-specific input binding")
    args = parser.parse_args()
    if args.new_audit and not args.audit_session:
        raise ValueError("--new-audit requires --audit-session")
    if args.run and not args.plan and not args.python_path:
        raise ValueError("The default profile requires --python-path to an existing project-local Capstone installation so its exact code/library bytes are bound")
    if args.plan:
        plan = load_json(project_path(args.plan))
    else:
        from execheck_profile import profile
        plan = profile()
    if plan.get("format") != "execheck-dag-v1":
        raise ValueError("Unknown pipeline plan format")
    if args.run:
        # Sequential, uncached whole-input checks; never trust a previous selected target.
        for option in ("--inspect-installed", "--check"):
            subprocess.run([sys.executable, "-B", "scripts/register-target.py", option], cwd=ROOT, check=True)
    target = latest_target()
    identity = {key: target[key] for key in ("version", "sha256", "size_bytes", "path")}
    # The registry's full MPQ-chain bindings are part of every stage identity.
    identity["registered_inputs"] = target
    identity["toolchain"] = toolchain(args.python_path)
    from execheck_pipeline import digest
    # Only native-profile changes need a different durable census plan. Other
    # producer changes invalidate their own stage and descendants in place.
    collector = {name: file_sha256(ROOT / name) for name in
                 ("scripts/ghidra/ReaNativeCensus.java", "scripts/census-native-image.py",
                  "scripts/rea-native-census.mjs", "package-lock.json")}
    # Preserve the existing work namespace for these exact storage-only adapters.
    for name, updated, prior in (
        ("scripts/census-native-image.py", "c0d9e29540db6bfa3dc8eed8171a05626f8e74f7e14661675b4f9b9b4ad85d2b",
         "96e45cfd9ade2d479e3fe27ad0a483620f8e2ae0c75425e608994ed2ce1b2c37"),
        ("scripts/rea-native-census.mjs", "894d8111dcb6047e5b583d9c71a937946043aee040a9a2287887e96c7ba60253",
         "9733aa2c5cfd7ec9934a1ad060eba0b8fcaf591bb404333ce6842c4100da5cdb"),
    ):
        if collector[name] == updated:
            collector[name] = prior
    profile_hash = digest({"collector": collector})[:16]
    summary_profile = digest(source_closure(ROOT, ["scripts/summarize-native-image.py"]))[:16]
    work = args.work or f"runtime/coverage/{target['sha256']}/pipeline/{profile_hash}"
    work = owned_runtime_path(project_path(work), ROOT).relative_to(ROOT).as_posix()
    bindings = {"python": sys.executable, "target_sha": target["sha256"], "version": target["version"], "work": work,
                "census_summary": args.census_summary or "docs/analysis/coverage/full-image-census.json", "summary_profile": summary_profile}
    for value in args.bind:
        key, separator, replacement = value.partition("=")
        if not separator or key in ("python", "target_sha", "version"):
            raise ValueError("Invalid or reserved --bind")
        bindings[key] = replacement
    stages = substitute(plan["stages"], bindings)
    included_phases = {"scan", args.phase}
    if args.phase == "reconcile":
        included_phases.add("derive")
    selected = {row["id"] for row in stages if row.get("phase", "scan") in included_phases}
    stages = [stage for stage in stages if stage["id"] in selected]
    for stage in stages:
        if any("{" in item or "}" in item for item in stage["argv"]):
            raise ValueError(f"Unresolved binding in {stage['id']}; use --bind NAME=VALUE")
    if args.phase in ("derive", "reconcile") and not args.census_summary:
        raise ValueError("Choose --census-summary explicitly after reviewing the native frontier")
    if not args.run:
        print(json.dumps({"target": identity, "work": work, "phase": args.phase, "stages": stages,
                          "semantic_review_complete": False}, indent=2))
        return 0
    if not args.plan and args.phase == "reconcile":
        reconcile_frontier(ROOT, target, args.census_summary)
    if not args.plan and args.phase == "native":
        subprocess.run([sys.executable, "-B", "scripts/manage-program-archives.py", "--retire-historical"],
                       cwd=ROOT, check=True)
        subprocess.run([sys.executable, "-B", "scripts/manage-program-archives.py", "--sweep-ready-raw"],
                       cwd=ROOT, check=True)
    environment = {"PYTHONDONTWRITEBYTECODE": "1"}
    if args.python_path:
        environment["PYTHONPATH"] = str(project_path(args.python_path))
    session = None
    if args.audit_session:
        session_identity = {key: target[key] for key in ("version", "sha256", "size_bytes", "path", "runtime_data")}
        session = AuditSession(ROOT, args.audit_session, session_identity, new=args.new_audit)
    report = Pipeline(ROOT, identity, stages, workers=args.workers, memory_mb=args.memory_mb,
                      environment=environment, audit_session=session, phase=args.phase,
                      runner_predecessor=COMPATIBLE_RUNNER_REVISION,
                      notify=lambda message: print(message, flush=True)).run()
    # A game update during processing invalidates the run even if all children passed.
    subprocess.run([sys.executable, "-B", "scripts/register-target.py", "--check"], cwd=ROOT, check=True)
    print(json.dumps(report, indent=2))
    return 1 if report["errors"] else 0


if __name__ == "__main__":
    try:
        import signal
        def interrupted(signum, frame):
            raise KeyboardInterrupt
        signal.signal(signal.SIGTERM, interrupted)
        sys.exit(main())
    except KeyboardInterrupt:
        print("Interrupted; completed stage receipts and native checkpoints are retained.", file=sys.stderr); sys.exit(130)
    except (ValueError, OSError, subprocess.CalledProcessError) as error:
        print(str(error), file=sys.stderr); sys.exit(1)
