#!/usr/bin/env python3
"""Move loose runtime entries into their owners and verify preserved references."""

import argparse
from contextlib import ExitStack
import fcntl
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tarfile

from runtime_layout import LAYOUT, ROOT, destination, loose_entries, relocations, retained_runtime_path
from shared_analysis import SharedAnalysis, _fsync_directory

PENDING = Path("runtime/analysis/.runtime-layout-pending.json")


def save(path, document):
    pending = path.with_name(path.name + ".new")
    with pending.open("w") as stream:
        json.dump(document, stream, indent=2, sort_keys=True)
        stream.write("\n")
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(pending, path)
    _fsync_directory(path.parent)


def mapped(relative, moves):
    path = Path(relative)
    if len(path.parts) >= 2 and path.parts[0] == "runtime" and path.parts[1] in moves:
        return Path(moves[path.parts[1]]).joinpath(*path.parts[2:])
    return path


def plan(root):
    runtime = root / "runtime"
    moves = {p.name: destination(p.name, p.is_dir() and not p.is_symlink()) for p in loose_entries(root)}
    if len(set(moves.values())) != len(moves):
        raise ValueError("Runtime destinations must be distinct")
    for value in moves.values():
        path = root / value
        if path.exists() or path.is_symlink():
            raise ValueError(f"Runtime destination is already occupied: {value}")
    links = []
    for parent, directories, files in os.walk(runtime):
        for name in directories + files:
            source = Path(parent) / name
            if not source.is_symlink():
                continue
            before = os.readlink(source)
            target = Path(os.path.normpath(source.parent / before))
            old = source.relative_to(root)
            new = mapped(old, moves)
            expected = target
            if target.is_relative_to(runtime):
                expected = root / mapped(target.relative_to(root), moves)
            if new != old or expected != target:
                after = str(expected) if os.path.isabs(before) else os.path.relpath(expected, (root / new).parent)
                if after != before:
                    links.append([new.as_posix(), before, after])
    return {"moves": moves, "links": links}


def check_open_files(root, moves):
    runtime = root / "runtime"
    status = subprocess.run(["lsof", "-n", "-P", "-Fn"], capture_output=True, text=True)
    if status.returncode not in (0, 1):
        raise ValueError("Could not check open runtime files")
    for row in status.stdout.splitlines():
        if not row.startswith(f"n{runtime}/"):
            continue
        path = Path(row[1:])
        if path.relative_to(runtime).parts[0] in moves:
            raise ValueError(f"Close the process using {path.relative_to(root)} before migration")


def apply(root=ROOT, *, check_processes=True):
    root = root.resolve()
    store = SharedAnalysis(root)
    pending = root / PENDING
    with store.lock(), ExitStack() as leases:
        document = json.loads(pending.read_text()) if pending.is_file() else plan(root)
        moves = document["moves"]
        if not moves:
            return 0, 0
        if check_processes:
            check_open_files(root, moves)
        for old, new in moves.items():
            source = root / "runtime" / old
            destination_path = root / new
            if Path(old).name != old or not destination_path.is_relative_to(root / "runtime"):
                raise ValueError("Invalid runtime relocation")
            actual = source if source.exists() or source.is_symlink() else destination_path
            if actual.is_dir() and not actual.is_symlink():
                for lock in actual.rglob("query.lock"):
                    descriptor = os.open(lock, os.O_RDONLY | os.O_NOFOLLOW)
                    leases.callback(os.close, descriptor)
                    fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if not pending.is_file():
            with store.connect() as connection:
                document["unavailable_aliases"] = [path for (path,) in connection.execute("SELECT path FROM analysis_aliases")
                    if mapped(path, moves) != Path(path) and not (root / path).exists() and not (root / path).is_symlink()]
            save(pending, document)
        unavailable = set(document.get("unavailable_aliases", ()))
        for old, new in moves.items():
            source = root / "runtime" / old
            target = root / new
            target.parent.mkdir(parents=True, exist_ok=True)
            if target.parent.resolve() != target.parent:
                raise ValueError(f"Runtime destination parent is redirected: {new}")
            source_exists = source.exists() or source.is_symlink()
            target_exists = target.exists() or target.is_symlink()
            if source_exists == target_exists:
                raise ValueError(f"Ambiguous runtime relocation: {old}")
            if source_exists:
                source.rename(target)
                _fsync_directory(source.parent)
                _fsync_directory(target.parent)
        for name, before, after in document["links"]:
            link = root / name
            if not link.parent.resolve().is_relative_to(root / "runtime") or not link.is_symlink():
                raise ValueError(f"Expected retained runtime symlink: {name}")
            actual = os.readlink(link)
            if actual == after:
                continue
            if actual != before:
                raise ValueError(f"Runtime symlink changed during migration: {name}")
            replacement = link.with_name(link.name + ".relocating")
            if replacement.is_symlink() and os.readlink(replacement) == after:
                os.replace(replacement, link)
            else:
                replacement.symlink_to(after)
                os.replace(replacement, link)
            _fsync_directory(link.parent)
        aliases = 0
        with store.connect() as connection:
            for table in ("analysis_aliases", "analysis_migrations"):
                for path, digest in connection.execute(f"SELECT path,sha256 FROM {table}").fetchall():
                    new = mapped(path, moves).as_posix()
                    if new == path:
                        continue
                    alias = root / new
                    if table == "analysis_aliases":
                        if path in unavailable and not alias.exists() and not alias.is_symlink():
                            pass
                        elif not alias.is_symlink() or alias.resolve(strict=True) != store.object_path(digest):
                            raise ValueError(f"Relocated catalog alias differs: {new}")
                        else:
                            aliases += 1
                    connection.execute(f"UPDATE {table} SET path=? WHERE path=?", (new, path))
        registered = relocations(root)
        if any(name in registered and registered[name] != value for name, value in moves.items()):
            raise ValueError("A legacy root already has a different registered destination")
        save(root / LAYOUT, {"relocations": {**registered, **moves}})
        pending.unlink()
        _fsync_directory(pending.parent)
        return len(moves), aliases


def retained_bytes(value, root=ROOT):
    """Read a packed cold file without recreating a loose history scope."""
    path = Path(os.path.normpath(root / value))
    path = retained_runtime_path(path, root)
    history = root / "runtime/analysis/history"
    if not path.is_relative_to(history) or path == history:
        raise ValueError("Expected a retained recovery path under runtime history")
    category = path.relative_to(history).parts[0]
    name = path.relative_to(root).as_posix()
    archive_path = history / category / "retained.tar.gz"
    with tarfile.open(archive_path, "r:gz") as archive:
        with archive.extractfile("retained-scopes.json") as source:
            receipt = json.load(source)["entries"].get(name)
        if not receipt:
            raise ValueError(f"Path is not in the cold archive: {name}")
        if receipt[0] == "file":
            with archive.extractfile(name) as source:
                data = source.read()
            expected = receipt[2]
        elif receipt[0] == "link":
            target = Path(os.path.normpath(path.parent / receipt[1]))
            objects = root / "runtime/analysis/objects"
            if not target.is_relative_to(objects) or target.resolve() != target:
                raise ValueError(f"Archived link does not directly identify a shared object: {name}")
            data = target.read_bytes()
            expected = target.name
        else:
            raise ValueError(f"Expected an archived file: {name}")
        if hashlib.sha256(data).hexdigest() != expected:
            raise ValueError(f"Archived bytes differ from the receipt: {name}")
        return data


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true", help="Relocate inactive loose roots and rebase catalog links")
    parser.add_argument("--check", action="store_true", help="Fail if the runtime root contains unmanaged entries")
    parser.add_argument("--show-retained", metavar="PATH", help="Read one packed historical file using its old or category path")
    args = parser.parse_args()
    if args.show_retained:
        if args.apply or args.check:
            parser.error("--show-retained cannot be combined with migration or layout checking")
        sys.stdout.buffer.write(retained_bytes(args.show_retained))
        return 0
    if args.apply:
        roots, aliases = apply()
        print(f"Relocated {roots} runtime entries and verified {aliases} catalog aliases")
    entries = loose_entries()
    if entries:
        print("\n".join(p.name for p in entries))
    if (ROOT / PENDING).exists():
        print("A runtime relocation is pending. Resume with --apply.")
        return 1
    return int(args.check and bool(entries))


if __name__ == "__main__":
    raise SystemExit(main())
