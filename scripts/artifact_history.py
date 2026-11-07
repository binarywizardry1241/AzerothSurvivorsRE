#!/usr/bin/env python3
"""Read registered historical evidence directly from Git without restoring copies."""

import argparse
from functools import lru_cache
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
INDEX = "docs/analysis/artifact-history.json"
EVIDENCE = PurePosixPath("docs/analysis/evidence")
COMMIT = re.compile(r"[0-9a-f]{40}")
SHA256 = re.compile(r"[0-9a-f]{64}")


@lru_cache(maxsize=8)
def _indexes(root):
    path = root / INDEX
    return json.loads(path.read_text()) if path.is_file() else ()


def _paths_in_commit(root, commit, prefixes):
    for prefix in prefixes:
        path = PurePosixPath(prefix)
        if path == EVIDENCE or not path.is_relative_to(EVIDENCE) or ".." in path.parts:
            raise ValueError(f"Invalid historical evidence directory: {prefix}")
    result = subprocess.run(["git", "ls-tree", "--full-tree", "-r", "-z", "--name-only", commit, "--", *prefixes],
                            cwd=root, capture_output=True, text=True)
    if result.returncode:
        raise ValueError(f"Historical evidence tree unavailable at {commit}; retain Git history")
    return result.stdout.rstrip("\0").split("\0") if result.stdout else ()


@lru_cache(maxsize=8)
def archive_index(root=ROOT):
    entries = {}
    for document in _indexes(root):
        commit = document["source_commit"]
        if not COMMIT.fullmatch(commit):
            raise ValueError("Invalid historical evidence commit")
        prefixes = document.get("prefixes", ())
        paths = _paths_in_commit(root, commit, prefixes) if prefixes else ()
        for name in (*document.get("paths", ()), *paths):
            artifact = PurePosixPath(name)
            if (name != artifact.as_posix() or artifact.is_absolute()
                    or not artifact.is_relative_to("docs/analysis") or ".." in artifact.parts
                    or name in entries):
                raise ValueError(f"Invalid or duplicate historical evidence path: {name}")
            entries[name] = commit
    return entries


def artifact_name(path, root):
    path = Path(path)
    if path.is_absolute():
        if not path.is_relative_to(root):
            return None
        path = path.relative_to(root)
    if ".." in path.parts:
        return None
    return path.as_posix()


def has_archived_artifact(path, root=ROOT):
    name = artifact_name(path, root)
    return bool(name and name.startswith("docs/analysis/") and name in archive_index(root))


@lru_cache(maxsize=1024)
def _archived_paths(directory, suffix, recursive, root):
    prefix = directory + "/"
    return tuple(root / name for name in archive_index(root)
                 if name.startswith(prefix) and name.endswith(suffix)
                 and (recursive or "/" not in name[len(prefix):]))


def iter_artifact_paths(directory, suffix, recursive=False, root=ROOT):
    """List retained inputs in the worktree and in the historical index."""
    directory = root / directory
    paths = (directory.rglob if recursive else directory.glob)("*" + suffix)
    name = artifact_name(directory, root)
    archived = _archived_paths(name, suffix, recursive, root) if name else ()
    return sorted(set(paths).union(archived))


def archived_replacement(path, root=ROOT):
    name = artifact_name(path, root)
    relocated = _relocations(root).get(name)
    if relocated is not None:
        return relocated
    for document in _indexes(root):
        replacement = document.get("replacement")
        if replacement and name in document.get("paths", ()):
            target = root / replacement
            if not target.resolve().is_relative_to(root / "docs/analysis"):
                raise ValueError(f"Archived evidence replacement leaves analysis docs: {name}")
            return target
    return None


@lru_cache(maxsize=8)
def _relocations(root):
    locations = {}
    for document in _indexes(root):
        for name, replacement in document.get("relocations", {}).items():
            source = PurePosixPath(name)
            target = PurePosixPath(replacement)
            if (source == EVIDENCE or target == EVIDENCE
                    or not source.is_relative_to(EVIDENCE) or not target.is_relative_to(EVIDENCE)
                    or ".." in (*source.parts, *target.parts) or name in locations):
                raise ValueError(f"Invalid evidence relocation: {name}")
            locations[name] = root / target
    return locations


def current_artifact_path(path, root=ROOT):
    """Resolve a retained live evidence input to its stable category path."""
    path = root / path
    if path.exists():
        return path
    return _relocations(root).get(artifact_name(path, root), path)


def committed_bytes(name, commit, expected, root):
    def matching_blob(revision):
        result = subprocess.run(["git", "cat-file", "blob", revision + ":" + name],
                                cwd=root, capture_output=True)
        if result.returncode == 0 and (expected is None or hashlib.sha256(result.stdout).hexdigest() == expected):
            return result.stdout
        return None

    original = matching_blob(commit)
    if original is not None:
        return original
    if expected is not None:
        history = subprocess.run(["git", "log", "--format=%H", commit, "--", name],
                                 cwd=root, capture_output=True, text=True)
        for revision in dict.fromkeys(history.stdout.splitlines()):
            if revision != commit and (original := matching_blob(revision)) is not None:
                return original
    raise ValueError(f"Exact historical bytes unavailable for {name}; retain Git history")


@lru_cache(maxsize=128)
def _read(name, commit, expected, root):
    return committed_bytes(name, commit, expected, root)


def archived_artifact(path, expected=None, root=ROOT):
    name = artifact_name(path, root)
    commit = archive_index(root).get(name)
    if commit is None:
        return None
    if expected is not None and not SHA256.fullmatch(expected):
        raise ValueError(f"Invalid historical evidence SHA-256: {name}")
    return _read(name, commit, expected, root)


def read_artifact(path, root=ROOT):
    path = root / path
    if not path.is_file():
        archived = archived_artifact(path, root=root)
        if archived is not None:
            return archived
    return path.read_bytes()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", help="Original project-relative evidence path")
    parser.add_argument("--sha256", help="Require the original recorded SHA-256")
    args = parser.parse_args()
    data = archived_artifact(args.path, args.sha256)
    if data is None:
        parser.error("Path is not in the historical evidence index")
    sys.stdout.buffer.write(data)


if __name__ == "__main__":
    main()
