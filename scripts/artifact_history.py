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
COMMIT = re.compile(r"[0-9a-f]{40}")
SHA256 = re.compile(r"[0-9a-f]{64}")


@lru_cache(maxsize=8)
def _indexes(root):
    path = root / INDEX
    return json.loads(path.read_text()) if path.is_file() else ()


@lru_cache(maxsize=8)
def archive_index(root=ROOT):
    entries = {}
    for document in _indexes(root):
        commit = document["source_commit"]
        if not COMMIT.fullmatch(commit):
            raise ValueError("Invalid historical evidence commit")
        for name in document["paths"]:
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
    return artifact_name(path, root) in archive_index(root)


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
    if name not in archive_index(root):
        return None
    for document in _indexes(root):
        replacement = document.get("replacement")
        if replacement and name in document["paths"]:
            target = root / replacement
            if not target.resolve().is_relative_to(root / "docs/analysis"):
                raise ValueError(f"Archived evidence replacement leaves analysis docs: {name}")
            return target
    return None


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
