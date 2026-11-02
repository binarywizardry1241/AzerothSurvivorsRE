#!/usr/bin/env python3
"""Audit or migrate immutable REA payloads into the shared analysis workspace.

Default: read-only candidate/deduplication audit. --migrate verifies bytes,
publishes each unique payload once and preserves old paths as relative aliases.
Mutable Programs, SQLite inventories, journals, progress and settings are never
selected. This does not infer semantic equivalence or remove historical evidence.
"""

import argparse
from collections import defaultdict
import json
import os
from pathlib import Path
import re

from shared_analysis import SharedAnalysis, file_digest

ROOT = Path(__file__).resolve().parents[1]
BLOCKED_PARTS = {"analysis", "cargo", "cargo-target", "node_modules", "target", "project", "runner",
                 "home", "tmp", "cache", "config", "data", "state", "menu-state", "tests", "Saves",
                 "AddOns", "python-libs", "python-deps", "query-python-deps", ".git"}
BLOCKED_NAME = re.compile(r"journal|progress|ready|bootstrap|active.process|ownership|persistent.profile|"
                          r"session.result|^plan[.-]|^attempts[.]|^.*[.]lock$", re.I)
IMMUTABLE_SUFFIXES = (".tsv.gz", ".csv.gz", ".json.gz", ".asm", ".ghidra.c", ".bin")


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
    parser.add_argument("--find-sha256", help="Find a shared payload and every retained provenance/alias")
    parser.add_argument("--find-target", help="Find observations/query identities mentioning this exact target SHA")
    parser.add_argument("--find-text", help="Find function/range labels, addresses or legacy paths in provenance")
    parser.add_argument("--limit", type=int, default=50)
    parser.add_argument("--minimum-bytes", type=int, default=65536)
    args = parser.parse_args()
    if args.minimum_bytes < 1:
        parser.error("--minimum-bytes must be positive")
    if any([args.find_sha256, args.find_target, args.find_text]):
        if args.migrate or args.verify or args.recover or args.repair_aliases or args.audit_aliases:
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
    else:
        result = audit(ROOT, args.minimum_bytes)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
