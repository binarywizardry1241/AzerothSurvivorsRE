#!/usr/bin/env python3
"""Keep only the configured installed EXE in place for pinned REA Ghidra imports.

The reference is opened read-only and hashed before import. Other project-local
raw analysis inputs retain REA's ordinary private snapshots. No installed input
is modified. Standalone, bundled CLI and MCP paths receive the same guard.
"""
import argparse
import hashlib
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
STANDALONE='dist/ghidra/GhidraTargetSnapshot.js'
BUNDLES=('dist/cli-runtime/binary-BVOr2mgE.js','dist/mcp/main-kBXHZ8S5.js')
UPSTREAM_STANDALONE='a27e410752f5474b3a97f7388bf8fdace65d21d5dad8858ad3c27e310f03f52b'
UPSTREAM_REGION='e98edf77b8d1ed9b8ac4647b2a96448ec255631068cf22def99ed17aa5e27f9b'
IMPORT='import {readFile as readReferenceConfig, realpath as realReferencePath} from "node:fs/promises";\n'
GUARD='''// Project reference input: preserve the authorized installed EXE in place.
if (process.env.REA_REFERENCE_GAME_CONFIG) {
    const reference = JSON.parse(await READ_CONFIG(process.env.REA_REFERENCE_GAME_CONFIG, "utf8"));
    if (await REAL_PATH(sourcePath) === await REAL_PATH(reference.exe)) {
        const source = await openSnapshotSource(sourcePath);
        try {
            if (!(await source.stat()).isFile())
                throw new AnalysisArtifactChangedError("open_binary", sourcePath, "Installed reference is not a regular file");
            const hash = createHash("sha256");
            for await (const chunk of source.createReadStream({autoClose:false})) hash.update(chunk);
            const observedSha256 = hash.digest("hex");
            if (observedSha256 !== expectedSha256)
                throw new AnalysisArtifactChangedError("open_binary", sourcePath, "Installed reference digest mismatch");
            return {path:sourcePath,sha256:observedSha256};
        } finally {await source.close();}
    }
}
'''

def insertion(name):
    guard=GUARD.replace('READ_CONFIG','readReferenceConfig' if name==STANDALONE else 'readFile').replace('REAL_PATH','realReferencePath' if name==STANDALONE else 'realpath')
    indent='    ' if name==STANDALONE else '\t\t\t'
    return ''.join(indent+line+'\n' for line in guard.splitlines())

def strip(name,text):
    return text.replace(insertion(name),'').replace(IMPORT,'')

def patch(name,text):
    indent='    ' if name==STANDALONE else '\t\t\t'
    anchor=indent+'const suffix = safeExtension(sourcePath);\n'
    if text.count(anchor)!=1:raise ValueError('REA reference snapshot anchor changed: '+name)
    return (IMPORT if name==STANDALONE else '')+text.replace(anchor,insertion(name)+anchor)

def changes():
    prepared=[]
    for name in (STANDALONE,*BUNDLES):
        path=ROOT/'node_modules/rea-agents'/name;source=path.read_text();original=strip(name,source)
        if name==STANDALONE:
            fingerprint=hashlib.sha256(original.encode()).hexdigest();expected_hash=UPSTREAM_STANDALONE
        else:
            start=original.index('//#region dist/ghidra/GhidraTargetSnapshot.js');end=original.index('//#endregion',start)
            fingerprint=hashlib.sha256(original[start:end].encode()).hexdigest();expected_hash=UPSTREAM_REGION
        if fingerprint!=expected_hash:raise ValueError('Unrecognized REA snapshot implementation: '+name)
        expected=patch(name,original)
        if source not in (original,expected):raise ValueError('Partial REA reference patch: '+name)
        prepared.append((path,expected,source!=expected))
    return prepared

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--apply',action='store_true');parser.add_argument('--check',action='store_true');args=parser.parse_args()
    try:
        prepared=changes()
        if args.check and any(changed for _,_,changed in prepared):raise ValueError('Run python3 -B scripts/repair-rea-reference-input.py --apply before REA')
        for path,expected,changed in prepared:
            if changed and args.apply:path.write_text(expected)
            if not args.check:print(f"{'applied' if changed and args.apply else 'pending' if changed else 'present'}: {path.relative_to(ROOT)} sha256={hashlib.sha256(expected.encode()).hexdigest()}")
    except (OSError,ValueError) as error:parser.exit(1,f'REA reference input guard: {error}\n')
if __name__=='__main__':main()
