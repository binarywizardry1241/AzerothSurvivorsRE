#!/usr/bin/env python3
"""Retain hash-bound 0.97.2 guardian instructions and existing REA provenance.

This performs static reads only. REA plans import exact unmodified function
bytes at original VAs; the game and imported code are never launched.
"""
from portable_paths import objdump_output, portable_json
from pathlib import Path
import hashlib
import importlib.util
import json
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
EXPECTED = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUTPUT = ROOT / 'runtime/analysis/staging/native-evidence/0.97.2/guardians'
RUNTIME = ROOT / 'runtime/analysis/history/raid/guardians/b4a536d2fa6d'
RANGES = [
    ('guardian-lair-selection',0x1454b22ba,0x1454b237f),
    ('guardian-lair-placement',0x1454b2ced,0x1454b37e1),
    ('guardian-candidate-filter',0x14552f2f0,0x14552f464),
    ('guardian-ai-decision',0x14550a0a0,0x14550a1d0),
    ('guardian-ai-timers',0x1454caa55,0x1454cae7d),
    ('guardian-ability-summons',0x1454ccd73,0x1454ccf2a),
    ('guardian-ability-area-strike',0x1454ccf2a,0x1454ccf5e),
    ('guardian-ability-area-damage',0x1454cd09d,0x1454cd1d2),
    ('guardian-ability-charge',0x1454cd7a8,0x1454cdd10),
    ('lair-respawn',0x1454a97df,0x1454a9ddc),
    ('lair-marker',0x1454a9ddc,0x1454aa103),
    ('guardian-death',0x1454c422b,0x1454c44dd),
    ('guardian-health',0x1454ef9f0,0x1454efd50),
    ('guardian-damage',0x1454efdf0,0x1454eff7f),
    ('wake-rescale',0x1454cdd32,0x1454ce220),
    ('queued-strength',0x1454aa235,0x1454aa34c),
    ('scheduled-magnet',0x1454c16a0,0x1454c17a6),
]
FUNCTIONS = [0x14549d550,0x1454b07c0,0x1454c2eb0,0x1454c9510,
             0x1454ef9f0,0x1454efdf0,0x14550a0a0,0x14552b760]

def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == EXPECTED
    spec = importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py')
    inventory=importlib.util.module_from_spec(spec);spec.loader.exec_module(inventory)
    pe=inventory.PE(data)
    extents={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    OUTPUT.mkdir(parents=True,exist_ok=True);RUNTIME.mkdir(parents=True,exist_ok=True)
    def record(start,end):
        offset=pe.rva_offset(start-pe.image_base);raw=data[offset:offset+end-start]
        return dict(va=hex(start),end_exclusive=hex(end),file_offset=hex(offset),
                    byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest())
    scopes=[]
    for name,start,end in RANGES:
        assembly=objdump_output(['objdump','-d','--no-show-raw-insn',
            f'--start-address={start:#x}',f'--stop-address={end:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True)
        path=OUTPUT/f'{name}.asm';path.write_text(assembly)
        scopes.append(dict(label=name,**record(start,end),assembly=path.name,
                           assembly_sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
    functions=[]
    for start in FUNCTIONS:
        end = 0x14550a1d0 if start == 0x14550a0a0 else extents[start]
        row=record(start,end)
        row['boundary_source'] = ('explicit leaf interval ending after RET; no PE unwind entry'
            if start == 0x14550a0a0 else 'original PE RUNTIME_FUNCTION start/end')
        functions.append(row)
        offset=int(row['file_offset'],16);raw=data[offset:offset+end-start]
        path=RUNTIME/f'{start:x}.bin';path.write_bytes(raw)
        plan=dict(target=str(path.relative_to(ROOT)),output=f'runtime/analysis/history/raid/guardians/b4a536d2fa6d/rea-{start:x}',
                  open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(start)),
                  timeout=240,open_timeout=60,operations=[dict(name='analyze_function',arguments=dict(procedure=hex(start)))])
        (RUNTIME/f'plan-{start:x}.json').write_text(portable_json(plan,indent=2)+'\n')
    provenance=[]
    for bundle in sorted(RUNTIME.glob('rea-*/evidence-bundle.json')):
        value=json.loads(bundle.read_text())
        for evidence in value['records']:
            if evidence['operation'] not in ('analyze_function','procedure_pseudo_code'):continue
            normalized=evidence['normalized_result']
            text=normalized.get('pseudocode','') if isinstance(normalized,dict) else str(normalized)
            entry=evidence.get('parameters',{}).get('procedure')
            # Store a focused recovered-code excerpt for large shared procedures.
            if entry=='0x14549d550':
                lines=text.splitlines();snippet='\n'.join(lines[6780:7110])
            elif entry=='0x1454c2eb0':
                lines=text.splitlines();snippet='\n'.join(lines[1048:1125])
            elif len(text)>35000:
                snippet=None
            else:snippet=text
            provenance.append(dict(evidence_id=evidence['evidence_id'],operation=evidence['operation'],
                parameters=evidence.get('parameters'),subject=evidence.get('subject'),
                provider=evidence.get('provider'),analysis_profile=evidence.get('analysis_profile'),
                limitations=evidence.get('limitations'),relationship_coverage=evidence.get('relationship_coverage'),
                pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest(),pseudocode_excerpt=snippet,
                excerpt_note='Decompiler-generated non-source; Win64 registers and original instructions govern. Excerpts can omit context.'))
    manifest=dict(date='2026-10-18',version='0.97.2',target=str(TARGET.relative_to(ROOT)),
                  target_sha256=EXPECTED,target_executed=False,functions=functions,scopes=scopes,
                  limitations=['Static evidence is not runtime parity.',
                    'Raw function slices omit callee code/data; REA generic GCC signatures require Win64 instruction verification.',
                    'Original PE RUNTIME_FUNCTION extents bind function bytes; names are recovered roles, not source symbols.'])
    (OUTPUT/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
    (OUTPUT/'rea-provenance.json').write_text(portable_json(dict(target_sha256=EXPECTED,records=provenance),indent=2)+'\n')
    print(f'Retained {len(scopes)} instruction scopes and {len(provenance)} REA records.')

if __name__=='__main__':main()
