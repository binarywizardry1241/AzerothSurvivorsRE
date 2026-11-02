#!/usr/bin/env python3
"""Archive inactive historical Ghidra Programs or restore them without Ghidra."""

import argparse
import json
import fcntl
import os
from pathlib import Path

from shared_program_archives import ROOT, archive_program, ensure_program_available, list_archives


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


def historical_programs(root):
    registry = json.loads((root / "docs/analysis/coverage/targets.json").read_text())
    versions = registry["selected_sha256_by_version"]
    newest = max(versions, key=lambda v: tuple(map(int, v.split("."))))
    selected = versions[newest]
    historical = set(versions.values()) - {selected}
    found = set()
    for prefix in ["runtime/coverage", "runtime/ghidra-queries", "runtime/analysis/programs"]:
        base = root / prefix
        if not base.exists():
            continue
        for target in historical:
            directory = base / target
            if directory.is_symlink() or not directory.exists():
                continue
            for path in directory.rglob("*.gpr"):
                if path.is_file() and not path.is_symlink():
                    found.add(path.parent.resolve())
            for path in directory.rglob("shared-program-archive.json"):
                if path.is_file() and not path.is_symlink():
                    found.add(path.parent.resolve())
    return sorted(found)


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


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--archive", metavar="PROJECT")
    mode.add_argument("--ensure", metavar="PROJECT")
    mode.add_argument("--archive-historical", action="store_true")
    mode.add_argument("--historical", action="store_true", help="List eligible historical Program locations")
    mode.add_argument("--idle-slices", action="store_true", help="List isolated raw/retained Programs eligible for cold storage")
    mode.add_argument("--archive-idle-slices", action="store_true", help="Archive inactive isolated raw/retained Programs")
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


if __name__ == "__main__":
    main()
