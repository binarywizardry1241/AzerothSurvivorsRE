#!/usr/bin/env python3
"""Audit or migrate immutable REA payloads into the shared analysis workspace.

Default: read-only candidate/deduplication audit. --migrate verifies bytes,
publishes each unique payload once and preserves old paths as relative aliases.
Mutable Programs, SQLite inventories, journals, progress and settings are never
selected. This does not infer semantic equivalence or remove historical evidence.
"""

import argparse
from collections import defaultdict
import fcntl
import json
import os
from pathlib import Path
import re

from shared_analysis import SharedAnalysis, _fsync_directory, file_digest

ROOT = Path(__file__).resolve().parents[1]
BLOCKED_PARTS = {"analysis", "cargo", "cargo-target", "node_modules", "target", "project", "runner",
                 "home", "tmp", "cache", "config", "data", "state", "menu-state", "tests", "Saves",
                 "AddOns", "python-libs", "python-deps", "query-python-deps", ".git"}
BLOCKED_NAME = re.compile(r"journal|progress|ready|bootstrap|active.process|ownership|persistent.profile|"
                          r"session.result|^plan[.-]|^attempts[.]|^.*[.]lock$", re.I)
IMMUTABLE_SUFFIXES = (".tsv.gz", ".csv.gz", ".json.gz", ".asm", ".ghidra.c", ".bin")
CENSUS_EXPORTS = ("instructions.tsv.gz", "bodies.tsv.gz", "references.tsv.gz",
                  "externals.tsv.gz", "direct-call-helpers.tsv.gz")


def share_census_exports(plan_path, root=ROOT):
    """Share immutable completed exports without changing any saved plan or receipt."""
    plan_path = (root / plan_path).resolve(strict=True)
    output = plan_path.parent
    if plan_path.name != "plan.json" or not output.is_relative_to(root / "runtime"):
        raise ValueError("Expected a saved census plan under runtime/")
    with os.fdopen(os.open(output / "census.lock", os.O_RDWR | os.O_CREAT | os.O_NOFOLLOW, 0o600)) as lease:
        try:
            fcntl.flock(lease, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            return {"shared": 0, "reclaimed_allocated_bytes": 0, "skipped": "census output is in use"}
        plan = json.loads(plan_path.read_text())
        progress_path = output / "progress.json"
        progress = json.loads(progress_path.read_text())
        if progress.get("stage") != "completed":
            return {"shared": 0, "reclaimed_allocated_bytes": 0, "skipped": "census is unfinished"}
        plan_sha = file_digest(plan_path)
        if (Path(plan["output"]).resolve() != output or progress.get("plan_sha256") != plan_sha
                or progress.get("target_sha256") != plan["target_sha256"]
                or progress.get("script_sha256") != plan["script_sha256"]):
            raise ValueError(f"Completed census does not match its saved plan: {output}")
        names = CENSUS_EXPORTS + (("reuse-state.json.gz",) if progress.get("reuse_state") else ())
        files = []
        for name in names:
            record = progress["files"][name]
            path = output / name
            if path.resolve(strict=True) != path or not path.is_file():
                raise ValueError(f"Census export is not a local regular file: {path}")
            with path.open("rb") as stream:
                if stream.read(2) != b"\x1f\x8b":
                    raise ValueError(f"Census export is not gzip: {path}")
            if path.stat().st_size != record["bytes"] or file_digest(path) != record["sha256"]:
                raise ValueError(f"Census export differs from its saved commitment: {path}")
            files.append((path, record))

        for path in (plan_path, progress_path, output / "session-result.json"):
            if path.is_file() and not path.is_symlink():
                files.append((path, {"sha256": file_digest(path), "bytes": path.stat().st_size}))

        store = SharedAnalysis(root)
        shared = reclaimed = 0
        with store.lock():
            for path, record in files:
                original = path.stat()
                existing = store.object_path(record["sha256"])
                pending = path.with_name("." + path.name + ".shared.pending")
                if existing.is_file() and not existing.is_symlink() and path.samefile(existing) and not pending.exists():
                    continue
                receipt = store.put_file(path, "frozen-native-census-export", {
                    "path": path.relative_to(root).as_posix(),
                    "plan_sha256": plan_sha, "target_sha256": plan["target_sha256"],
                })
                if receipt["sha256"] != record["sha256"] or receipt["bytes"] != record["bytes"]:
                    raise ValueError(f"Census export changed during publication: {path}")
                destination = store.verify_receipt(receipt)
                if pending.is_symlink() or (pending.exists() and not pending.samefile(destination)):
                    raise ValueError(f"Unexpected census link staging file: {pending}")
                try:
                    if not path.samefile(destination):
                        pending.unlink(missing_ok=True)
                        os.link(destination, pending)
                        os.replace(pending, path)
                        _fsync_directory(output)
                        if original.st_nlink == 1:
                            reclaimed += original.st_blocks * 512
                        shared += 1
                finally:
                    pending.unlink(missing_ok=True)
        return {"shared": shared, "reclaimed_allocated_bytes": reclaimed}


def migrate_census_exports(root=ROOT):
    result = {"passes": 0, "shared": 0, "reclaimed_allocated_bytes": 0, "skipped": []}
    for plan_path in sorted((root / "runtime/analysis/census").glob("*/*/plan.json")):
        if not (plan_path.parent / "progress.json").is_file():
            continue
        row = share_census_exports(plan_path, root)
        result["passes"] += 1
        for field in ("shared", "reclaimed_allocated_bytes"):
            result[field] += row[field]
        if row.get("skipped"):
            result["skipped"].append({"plan": plan_path.relative_to(root).as_posix(), "reason": row["skipped"]})
    return result


def candidates(root, minimum=65536):
    """Conservative immutable-output selection; never follow directory aliases."""
    runtime = root / "runtime"
    if not runtime.is_dir():
        return
    for parent, directories, names in os.walk(runtime, followlinks=False):
        directories[:] = sorted(name for name in directories
                                if name not in BLOCKED_PARTS and not name.startswith("optimized-")
                                and not name.endswith((".rep", ".app"))
                                and not (Path(parent) / name).is_symlink())
        for name in sorted(names):
            path = Path(parent) / name
            if path.is_symlink() or not path.is_file():
                continue
            relative = path.relative_to(root)
            if relative.parts[1] == "analysis-exports":
                if re.fullmatch(r"[a-f0-9]{64}", name):
                    yield path
                continue
            if BLOCKED_NAME.search(name) or path.stat().st_size < minimum:
                continue
            # Serialized native payloads and completed query results are immutable;
            # arbitrary JSON inventories/settings are deliberately not guessed.
            result_json = name.endswith(".json") and ("results" in relative.parts or
                           re.match(r"\d{3,}-(?!initialize|open_binary|close_binary)", name) or
                           name == "evidence-bundle.json")
            if name.endswith(IMMUTABLE_SUFFIXES) or result_json:
                yield path


def consolidate_proof_files(root=ROOT):
    """Share frozen census inputs and compress exact retained PE/stage artifacts."""
    from execheck_pipeline import SHARED_STAGE_OUTPUTS

    store = SharedAnalysis(root)
    inputs = store.store / "census"
    coverage = root / "runtime/coverage"
    paths = [*inputs.glob("*/*/*-input.json"), *inputs.glob("*/*/*-input-summary.json"),
             *inputs.glob("*/*/starts.tsv")]
    for name in SHARED_STAGE_OUTPUTS:
        paths.extend(coverage.glob(f"**/{name}"))
    result = {"shared": 0, "reclaimed_allocated_bytes": 0}
    for path in sorted(set(paths)):
        if path.is_symlink() or path.parent.resolve() != path.parent or not path.is_file():
            continue
        row = store.migrate_file(path, scope_provenance(root, path))
        result["shared"] += 1
        result["reclaimed_allocated_bytes"] += row["reclaimed_allocated_bytes"]
    return result


def consolidate_identical_legacy_files(root=ROOT):
    """Consolidate exact matches in the existing immutable migration scope."""
    store = SharedAnalysis(root)
    groups = defaultdict(list)
    for path in candidates(root, minimum=1):
        groups[file_digest(path)].append(path)
    result = {"shared": 0, "reclaimed_allocated_bytes": 0}
    for digest, paths in groups.items():
        if len(paths) == 1 and not store.object_path(digest).is_file():
            continue
        for path in paths:
            row = store.migrate_file(path, scope_provenance(root, path))
            result["shared"] += 1
            result["reclaimed_allocated_bytes"] += row["reclaimed_allocated_bytes"]
    return result


def scope_provenance(root, path):
    name = path.relative_to(root).as_posix()
    result = {"legacy_path": name, "binding": "original payload retains its native provenance"}
    parts = path.relative_to(root).parts
    if len(parts) > 2 and parts[1] in {"coverage", "analysis-exports"} and re.fullmatch(r"[a-f0-9]{64}", parts[2]):
        result["path_target_sha256"] = parts[2]
    return result


def audit(root, minimum=65536):
    grouped = defaultdict(list)
    total = allocated = 0
    for path in candidates(root, minimum):
        observed = path.stat()
        sha256 = file_digest(path)
        grouped[sha256].append((path, observed))
        total += observed.st_size
        allocated += observed.st_blocks * 512
    duplicate_bytes = 0
    groups = []
    for sha256, entries in grouped.items():
        size = entries[0][1].st_size
        identities = {(s.st_dev, s.st_ino) for _, s in entries}
        duplicate_bytes += size * (len(identities) - 1)
        if len(entries) > 1:
            groups.append({"sha256": sha256, "bytes": size,
                           "paths": [p.relative_to(root).as_posix() for p, _ in entries]})
    return {"mode": "read-only", "candidate_files": sum(map(len, grouped.values())),
            "unique_payloads": len(grouped), "candidate_logical_bytes": total,
            "candidate_allocated_bytes": allocated, "exact_duplicate_logical_bytes": duplicate_bytes,
            "duplicate_groups": groups}


def migrate(root, minimum=65536):
    store = SharedAnalysis(root)
    recovered = store.recover_migrations()
    paths = list(candidates(root, minimum))
    migrated = reclaimed = 0
    for path in paths:
        result = store.migrate_file(path, scope_provenance(root, path))
        reclaimed += result["reclaimed_allocated_bytes"]
        migrated += not result["already_shared"]
    registered = 0
    for parent, directories, names in os.walk(root / "runtime", followlinks=False):
        directories[:] = [name for name in directories if name not in BLOCKED_PARTS
                          and not name.endswith((".rep", ".app"))
                          and not name.startswith("optimized-")
                          and not (Path(parent) / name).is_symlink()]
        for name in names:
            alias = Path(parent) / name
            if alias.is_symlink() and alias.resolve().is_relative_to(store.objects):
                store.register_alias(alias, scope_provenance(root, alias))
                registered += 1
    verification = store.verify()
    return {"mode": "migrated", "recovered_migrations": recovered, "migrated_paths": migrated,
            "registered_existing_aliases": registered,
            "reclaimed_allocated_bytes_estimate": reclaimed, **verification}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--migrate", action="store_true")
    mode.add_argument("--verify", action="store_true")
    mode.add_argument("--recover", action="store_true")
    mode.add_argument("--repair-aliases", action="store_true", help="Repair only dangling catalog-verified CAS aliases")
    mode.add_argument("--audit-aliases", action="store_true", help="List repairable aliases without changing links")
    mode.add_argument("--share-census-exports", metavar="PLAN", help="Share completed exports under the saved census lock")
    mode.add_argument("--migrate-census-exports", action="store_true", help="Share completed exports in the canonical census store")
    mode.add_argument("--consolidate-proof-files", action="store_true", help="Share frozen census inputs and immutable PE/stage evidence")
    mode.add_argument("--consolidate-identical-legacy", action="store_true", help="Share only byte-identical legacy immutable payloads")
    parser.add_argument("--find-sha256", help="Find a shared payload and every retained provenance/alias")
    parser.add_argument("--find-target", help="Find observations/query identities mentioning this exact target SHA")
    parser.add_argument("--find-text", help="Find function/range labels, addresses or legacy paths in provenance")
    parser.add_argument("--limit", type=int, default=50)
    parser.add_argument("--minimum-bytes", type=int, default=65536)
    args = parser.parse_args()
    if args.minimum_bytes < 1:
        parser.error("--minimum-bytes must be positive")
    if any([args.find_sha256, args.find_target, args.find_text]):
        if any((args.migrate, args.verify, args.recover, args.repair_aliases, args.audit_aliases,
                args.share_census_exports, args.migrate_census_exports, args.consolidate_proof_files,
                args.consolidate_identical_legacy)):
            parser.error("Search cannot be combined with a mutation or verification mode")
        if not (ROOT / "runtime/analysis/knowledge.sqlite").is_file():
            parser.error("No shared catalog exists yet")
        result = SharedAnalysis(ROOT).find_objects(args.find_sha256, args.find_target, args.find_text, args.limit)
    elif args.migrate:
        result = migrate(ROOT, args.minimum_bytes)
    elif args.verify:
        if not (ROOT / "runtime/analysis/knowledge.sqlite").is_file():
            parser.error("No shared catalog exists yet")
        result = SharedAnalysis(ROOT).verify()
    elif args.recover:
        result = {"recovered_migrations": SharedAnalysis(ROOT).recover_migrations()}
    elif args.repair_aliases or args.audit_aliases:
        if not (ROOT / "runtime/analysis/knowledge.sqlite").is_file():
            parser.error("No shared catalog exists yet")
        result = SharedAnalysis(ROOT).repair_aliases(apply=args.repair_aliases)
    elif args.share_census_exports:
        result = share_census_exports(args.share_census_exports)
    elif args.migrate_census_exports:
        result = migrate_census_exports()
    elif args.consolidate_proof_files:
        result = consolidate_proof_files()
    elif args.consolidate_identical_legacy:
        result = consolidate_identical_legacy_files()
    else:
        result = audit(ROOT, args.minimum_bytes)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
