#!/usr/bin/env python3
"""Map historical callback owners to the verified target and prepare REA plans.

Exact fragment matches locate candidates only. Target assembly/Ghidra evidence,
not the historical address, determines the current implementation.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import bisect
from collections import Counter
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / 'runtime/run-callbacks-0.100.1'
OUT = ROOT / 'docs/analysis/evidence/0.100.1/run-callbacks'
OWNERS = {
    'player-damage': 0x14548f420,
    'actor-hit': 0x1454c2eb0,
    'game-tick': 0x14549d550,
    'passive-multi-hit': 0x1454d43d0,
    'begin-passive': 0x1454d49e0,
    'polymorph-producer': 0x1454d4dc0,
    'redemption-enqueue': 0x1454d5230,
    'soul-fire-credit': 0x1454d68b0,
    'bloodrage-publish': 0x1454d69f0,
    'seal-fate-publish': 0x1454d7020,
    'soul-fire-publish': 0x1454d5bd0,
    'self-buff': 0x1454e8880,
    'passive-description': 0x1454d7be0,
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--collect', action='store_true')
    args = parser.parse_args()
    inventory = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    paths = [ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe',
             ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe']
    expected = ['a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589',
                json.loads((ROOT / 'docs/analysis/target-refresh-0.100.1.json').read_text())['current_target']['sha256']]
    images = []
    for path, sha in zip(paths, expected):
        data = path.read_bytes()
        assert hashlib.sha256(data).hexdigest() == sha, f'wrong target: {path}'
        images.append(inventory.PE(data))
    old, target = images
    old_ends = {old.image_base+a: old.image_base+z for a,z,_ in old.functions()}
    functions = sorted(target.functions()); starts = [a for a,_,_ in functions]
    low, high = target.rva_offset(0x5300000), target.rva_offset(0x5800000)
    search = target.data[low:high]
    WORK.mkdir(parents=True, exist_ok=True); OUT.mkdir(parents=True, exist_ok=True)
    records = []
    for role, old_start in OWNERS.items():
        if old_start not in old_ends:
            records.append({'role':role,'historical_address':hex(old_start),'status':'Historical label is an interior branch, not an unwind-function boundary; no target address inferred.'})
            continue
        at = old.rva_offset(old_start-old.image_base)
        raw_old = old.data[at:at+old_ends[old_start]-old_start]
        votes, proofs = Counter(), {}
        step = max(32, ((len(raw_old)//512+15)//16)*16)
        for offset in range(0, len(raw_old)-31, step):
            fragment = raw_old[offset:offset+32]
            found = search.find(fragment)
            if found < 0 or search.find(fragment, found+1) >= 0: continue
            va = target.offset_va(low+found)
            if va is None: continue
            rva = va-target.image_base
            i = bisect.bisect_right(starts,rva)-1
            if i < 0 or not functions[i][0] <= rva < functions[i][1]: continue
            owner = target.image_base+functions[i][0]
            votes[owner] += 1
            proofs.setdefault(owner, []).append({'old_address':hex(old_start+offset),'address':hex(va),'hex':fragment.hex()})
        if not votes:
            records.append({'role':role,'historical_address':hex(old_start),'status':'No unique 32-byte fragment in bounded search; no target behavior inferred.'})
            print(role,'unresolved location',flush=True)
            continue
        start,count = votes.most_common(1)[0]
        i = bisect.bisect_left(starts,start-target.image_base)
        end = target.image_base+functions[i][1]
        at = target.rva_offset(start-target.image_base); raw = target.data[at:at+end-start]
        source = {'address':hex(start),'end_exclusive':hex(end),'file_offset':hex(at),'byte_count':len(raw),'sha256':hashlib.sha256(raw).hexdigest()}
        row = {'role':role,'historical_address':hex(old_start),'location_votes':count,'location_proofs':proofs[start][:8],'source':source}
        binary = WORK / f'{role}.bin'; binary.write_bytes(raw)
        plan = {'target':str(binary.relative_to(ROOT)),'output':str((WORK/f'rea-{role}').relative_to(ROOT)),
                'open_options':{'format':'raw-binary','architecture':'x86_64','entry_point':hex(start)},
                'timeout':240,'open_timeout':90,'operations':[{'name':'procedure_pseudo_code','arguments':{'procedure':hex(start)}}]}
        (WORK/f'plan-{role}.json').write_text(portable_json(plan,indent=2)+'\n')
        assembly = objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={start:#x}',f'--stop-address={end:#x}',str(paths[1].relative_to(ROOT))],cwd=ROOT,text=True)
        (OUT/f'{role}.asm').write_text(assembly)
        response = WORK/f'rea-{role}/003-procedure_pseudo_code.json'
        if args.collect and response.exists():
            evidence = json.loads(response.read_text())['response']['result']['structuredContent']
            assert evidence['subject']['digest']['sha256'] == source['sha256']
            assert evidence['provider']['id'] == 'ghidra'
            code = evidence['normalized_result']
            (OUT/f'{role}.ghidra.c').write_text(code)
            row['rea_evidence'] = evidence
        records.append(row)
        print(role,hex(start),hex(end),count,flush=True)
    manifest = {'date':'2026-10-18','target':str(paths[1].relative_to(ROOT)),'target_sha256':expected[1],
                'target_executed':False,'search_rvas':['0x5300000','0x5800000'],
                'method':'Unique exact 32-byte historical fragment votes locate target PE unwind functions; unchanged target slices imported through project-local REA/Ghidra.',
                'functions':records,'limitations':['Location votes do not prove unchanged behavior.','Raw Ghidra imports infer generic ABI and unresolved external constants; original PE assembly governs Win64 arguments.','Static analysis does not establish runtime parity.']}
    (OUT/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n')

if __name__ == '__main__': main()
