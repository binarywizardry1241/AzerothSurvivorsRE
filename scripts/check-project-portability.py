#!/usr/bin/env python3
"""Validate source-distribution paths and optional text constraints.

Ignores local configuration, runtime, dependencies and Git history by using Git's
tracked/unignored inventory. Supply additional text constraints with --forbid.
Dependency authorship and fixture paths are retained.
"""
import argparse
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
HOME_PATH = re.compile(r'''(?:^|[\s"'`(=])/(?:Users|home)/([^\s/\\"'`<>]+)[/\\]''')
WINDOWS_HOME_PATH = re.compile(r'''[A-Za-z]:[\\/]+Users[\\/]+([^\s/\\"'`<>]+)[/\\]+''', re.I)
FIXTURE_USERS = {"player", "example", "fixture"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--forbid", action="append", default=[], help="disallowed text token")
    args = parser.parse_args()
    if any(not value for value in args.forbid):
        parser.error("forbidden identifiers must be nonempty")
    forbidden = [value.casefold().encode() for value in args.forbid]
    names = subprocess.check_output(["git", "ls-files", "--cached", "--others", "--exclude-standard", "-z"], cwd=ROOT)
    failures, count = [], 0
    for name in sorted(set(names.decode().split("\0")) - {""}):
        path = ROOT / name
        if not path.is_file():
            continue
        count += 1
        raw = path.read_bytes()
        if any(value in name.casefold().encode() or value in raw.lower() for value in forbidden):
            failures.append(f"{name}: forbidden identifier")
        if b"\0" in raw:
            continue
        for number, line in enumerate(raw.decode("utf-8", "replace").splitlines(), 1):
            if any(match[1] not in FIXTURE_USERS
                   for pattern in (HOME_PATH, WINDOWS_HOME_PATH) for match in pattern.finditer(line)):
                failures.append(f"{name}:{number}: absolute home path")
    for failure in failures:
        print(failure)
    print(f"Project portability: {'failed' if failures else 'passed'} ({count} files, {len(failures)} findings)")
    return bool(failures)


if __name__ == "__main__":
    raise SystemExit(main())
