#!/usr/bin/env python3
"""Archive inactive historical Ghidra Programs or restore them without Ghidra."""

import argparse
import json
import fcntl
import os
from pathlib import Path

from shared_program_archives import (DESCRIPTOR, ROOT, archive_program, clean_archived_program_scratch,
                                     ensure_program_available, list_archives, retire_historical_program)


def queued_requests(value):
    directory = Path(value)
    if directory.resolve() != directory or not directory.is_relative_to(ROOT / "runtime/analysis/requests/waiters"):
        raise ValueError("Native request waiters leave the shared workspace")
    for path in directory.glob("*.waiting"):
        try:
            descriptor = os.open(path, os.O_RDONLY | os.O_NOFOLLOW)
        except FileNotFoundError:
            continue
        try:
            try:
                fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except BlockingIOError:
                return True
            path.unlink(missing_ok=True)
        finally:
            os.close(descriptor)
    return False


def historical_programs(root, keep_sha256=None):
    registry = json.loads((root / "docs/analysis/coverage/targets.json").read_text())
    versions = registry["selected_sha256_by_version"]
    newest = max(versions, key=lambda v: tuple(map(int, v.split("."))))
    selected = keep_sha256 or versions[newest]
    historical = {row["sha256"] for row in registry["targets"]} - {selected}
    found = set()
    for prefix in ["runtime/coverage", "runtime/ghidra-queries", "runtime/analysis/programs",
                   "runtime/analysis/programs/retained/query", "runtime/analysis/programs/retained/census"]:
        base = root / prefix
        if not base.exists():
            continue
        for target in historical:
            directory = base / target
            if directory.is_symlink() or not directory.exists():
                continue
            for path in directory.rglob("*.gpr"):
                if path.is_file() and not path.is_symlink():
                    found.add(path.parent)
            for path in directory.rglob(DESCRIPTOR):
                if path.is_file() and not path.is_symlink():
                    found.add(path.parent)
    return sorted(found)


def retire_historical():
    from coverage_common import installed_identity, latest_target

    installed = installed_identity()
    current = latest_target()
    if (current["version"], current["sha256"]) != (installed["version"], installed["sha256"]):
        raise ValueError("Register the current installed EXE before retiring older Program caches")
    registry = json.loads((ROOT / "docs/analysis/coverage/targets.json").read_text())
    older = {row["sha256"] for row in registry["targets"]} - {installed["sha256"]}
    result = {"retired": 0, "reclaimed_allocated_bytes": 0, "preserved": []}
    for project in historical_programs(ROOT, installed["sha256"]):
        try:
            bound = older.intersection(project.relative_to(ROOT).parts)
            if project.resolve() != project or len(bound) != 1 or installed["sha256"] in project.parts:
                raise ValueError("Historical project path has an ambiguous target")
            descriptor = project / DESCRIPTOR
            if (any(project.glob("*.gpr")) and descriptor.is_file()
                    and json.loads(descriptor.read_text()).get("state") in {"cold", "hot"}):
                archived = archive_program(project)
                result["reclaimed_allocated_bytes"] += archived["reclaimed_allocated_bytes_estimate"]
            row = retire_historical_program(project, next(iter(bound)))
            if row["retired"]:
                result["retired"] += 1
                result["reclaimed_allocated_bytes"] += row["reclaimed_allocated_bytes"]
                print("Retired historical Program " + project.relative_to(ROOT).as_posix(), flush=True)
            elif not row.get("already_retired"):
                result["preserved"].append({"project": project.relative_to(ROOT).as_posix(), "reasons": row["reasons"]})
        except (OSError, ValueError) as error:
            result["preserved"].append({"project": project.relative_to(ROOT).as_posix(), "reasons": [str(error)]})
    return result


def idle_slice_programs(root):
    """Select isolated raw experiments and unselected retained states.

    Current full-EXE baselines remain hot. Archive ownership checks still admit
    only inactive Programs, and preserve unfinished raw database checkpoints.
    """
    base = root / 'runtime/analysis/programs'
    found = set()
    for path in base.rglob('workspace.json'):
        if path.is_symlink():
            continue
        identity = json.loads(path.read_text()).get('identity', {})
        project = path.parent / 'project'
        if identity.get('raw_binary') is not None and any(project.glob('*.gpr')):
            found.add(project.resolve())
    retained = base / 'retained'
    if retained.exists():
        for path in retained.rglob('*.gpr'):
            if path.is_file() and not path.is_symlink():
                found.add(path.parent.resolve())
    return sorted(found)


def archive_many(projects, root=ROOT, progress=None):
    completed, skipped = [], []
    for project in projects:
        try:
            record = archive_program(project, root=root)
            completed.append(record)
        except (OSError, ValueError) as error:
            record = {"project": str(project), "state": "skipped", "error": str(error)}
            skipped.append(record)
        if progress is not None:
            progress(record)
    return {"programs": len(completed), "newly_archived": sum(not r.get("already_archived", False) for r in completed),
            "skipped": skipped, "reclaimed_allocated_bytes_estimate":
            sum(r.get("reclaimed_allocated_bytes_estimate", 0) for r in completed)}


def sweep_ready_raw():
    """Retry deferred ready raw Programs and remove retired/archived runner scratch."""
    base = ROOT / "runtime/analysis/programs"
    result = {"newly_archived": 0, "reclaimed_allocated_bytes": 0, "deferred": []}
    for project in idle_slice_programs(ROOT):
        workspace = project.parent / "workspace.json"
        ready = project.parent / "ready.json"
        if not workspace.is_file() or not json.loads(workspace.read_text()).get("identity", {}).get("raw_binary"):
            continue
        try:
            if not ready.is_file() or not json.loads(ready.read_text()).get("ready"):
                result["reclaimed_allocated_bytes"] += clean_archived_program_scratch(project, temporary_only=True)
                continue
            row = archive_program(project, automatic_cache=True)
            result["newly_archived"] += not row.get("already_archived", False)
            result["reclaimed_allocated_bytes"] += row["reclaimed_allocated_bytes_estimate"]
        except (OSError, ValueError) as error:
            result["deferred"].append({"project": project.relative_to(ROOT).as_posix(), "reason": str(error)})
    for descriptor in sorted(base.rglob(DESCRIPTOR)):
        project = descriptor.parent
        runtime = project.parent / "runtime"
        if project.name != "project" or project.resolve() != project or not runtime.is_dir():
            continue
        try:
            result["reclaimed_allocated_bytes"] += clean_archived_program_scratch(project)
        except (OSError, ValueError) as error:
            result["deferred"].append({"project": project.relative_to(ROOT).as_posix(), "reason": str(error)})
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--archive", metavar="PROJECT")
    mode.add_argument("--ensure", metavar="PROJECT")
    mode.add_argument("--archive-historical", action="store_true")
    mode.add_argument("--retire-historical", action="store_true",
                      help="Discard older registered EXE Programs after verifying the installed baseline")
    mode.add_argument("--historical", action="store_true", help="List eligible historical Program locations")
    mode.add_argument("--idle-slices", action="store_true", help="List isolated raw/retained Programs eligible for cold storage")
    mode.add_argument("--archive-idle-slices", action="store_true", help="Archive inactive isolated raw/retained Programs")
    mode.add_argument("--sweep-ready-raw", action="store_true", help="Retry ready raw archives and remove idle headless scratch")
    parser.add_argument("--automatic-cache", action="store_true", help="Single Program cache: retire unreferenced older automatic generations")
    parser.add_argument("--defer-if-queued", help="Keep a raw Program hot while live matching requests are queued")
    args = parser.parse_args()
    if args.automatic_cache and not args.archive:
        parser.error("--automatic-cache requires --archive PROJECT; historical/manual archives remain pinned")
    if args.ensure:
        result = ensure_program_available(args.ensure)
    elif args.archive:
        result = ({"skipped": True, "reason": "matching native requests are queued"}
                  if args.defer_if_queued and queued_requests(args.defer_if_queued)
                  else archive_program(args.archive, automatic_cache=args.automatic_cache))
    elif args.retire_historical:
        result = retire_historical()
    elif args.sweep_ready_raw:
        result = sweep_ready_raw()
    elif args.archive_historical or args.archive_idle_slices:
        result = archive_many(idle_slice_programs(ROOT) if args.archive_idle_slices else historical_programs(ROOT),
                              progress=lambda record: print(json.dumps(record), flush=True))
    elif args.historical:
        result = [str(p.relative_to(ROOT)) for p in historical_programs(ROOT)]
    elif args.idle_slices:
        result = [str(p.relative_to(ROOT)) for p in idle_slice_programs(ROOT)]
    else:
        result = list_archives()
    print(json.dumps(result, indent=2))
    return int(args.retire_historical and bool(result["preserved"]))


if __name__ == "__main__":
    raise SystemExit(main())
