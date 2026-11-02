#!/usr/bin/env python3
"""Add a guarded project-local Ghidra streaming hook to pinned REA 6.5.0.

The hook is inert without REA_NATIVE_CENSUS_PLAN. It leaves original target
inputs and existing selected-body recovery tooling unchanged.
"""
import argparse
import hashlib
import importlib.util
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
ANCHOR='        "-readOnly",\n'
INSERT='''        // Project-local streaming census: the plan/tool hashes enter its seed commitment.
        ...(process.env.REA_NATIVE_CENSUS_PLAN ? ["-noanalysis"] : []),
'''
POST_ANCHOR='        "-postScript",\n        // Ghidra checks the caller\'s cwd before scriptPath for a basename.'
PATH_ANCHOR='        bridgeDirectory,\n'
PATH_REPLACEMENT='        process.env.REA_NATIVE_CENSUS_PLAN ? bridgeDirectory + ";" + scriptPath.join(process.cwd(), "scripts/ghidra") : bridgeDirectory,\n'
POST='''        ...(process.env.REA_NATIVE_CENSUS_PLAN ? [
            "-postScript", scriptPath.join(process.cwd(), "scripts/ghidra/ReaNativeCensus.java")
        ] : []),
'''
def changes():
    path=ROOT/'node_modules/rea-agents/dist/ghidra/GhidraLauncher.js'
    source=path.read_text(); durable=None
    repair=ROOT/'scripts/repair-rea-durable-queries.py'
    if repair.exists():
        spec=importlib.util.spec_from_file_location('rea_durable_guard',repair)
        durable=importlib.util.module_from_spec(spec);spec.loader.exec_module(durable)
    stripped=durable.strip_launcher(source) if durable else source
    original=stripped.replace(INSERT,'').replace(POST,'').replace(PATH_REPLACEMENT,PATH_ANCHOR)
    # Exact dependency and anchor checks prevent patching an unknown package.
    if hashlib.sha256(original.encode()).hexdigest() != '739676ebc64bd7b23ed1bc4a9395d596efe7bf8080eb67af1ff3e00d86609a67':
        raise ValueError('Unrecognized pinned REA launcher')
    if original.count(ANCHOR)!=1 or original.count(POST_ANCHOR)!=1 or original.count(PATH_ANCHOR)!=1:
        raise ValueError('Pinned Ghidra launcher anchors differ')
    expected=original.replace(ANCHOR,INSERT+ANCHOR).replace(POST_ANCHOR,POST+POST_ANCHOR).replace(PATH_ANCHOR,PATH_REPLACEMENT)
    previous=original.replace(ANCHOR,INSERT+ANCHOR).replace(POST_ANCHOR,POST+POST_ANCHOR)
    if stripped not in (original,previous,expected):raise ValueError('Partial launcher patch')
    if durable and stripped!=source:expected=durable.add_launcher(expected)
    return path,expected,source!=expected,hashlib.sha256(original.encode()).hexdigest()
def snapshot_changes():
    spec=importlib.util.spec_from_file_location('rea_reference_guard',ROOT/'scripts/repair-rea-reference-input.py')
    guard=importlib.util.module_from_spec(spec);spec.loader.exec_module(guard)
    if any(changed for _,_,changed in guard.changes()):raise ValueError('Apply repair-rea-reference-input.py --apply first')
    path,expected,changed=guard.changes()[0]
    return path,expected,changed,guard.UPSTREAM_STANDALONE
def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--apply',action='store_true');args=parser.parse_args()
    for path,expected,changed,upstream in (changes(),snapshot_changes()):
        if changed and args.apply:path.write_text(expected)
        print(f"{'applied' if changed and args.apply else 'pending' if changed else 'present'}: {path.relative_to(ROOT)} upstream_sha256={upstream} repaired_sha256={hashlib.sha256(expected.encode()).hexdigest()}")
if __name__=='__main__':main()
