#!/usr/bin/env python3
"""Retain static hash-bound 0.97.2 ordinary enemy spawning evidence.

No game execution or compilation. Raw REA imports are exact unmodified PE
function intervals at original VAs; they omit the rest of the image/data.
Run scripts/rea-batch.py on the generated plans to refresh the Ghidra records.
"""
from portable_paths import objdump_output, portable_json
from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
OUT = ROOT / "runtime/analysis/staging/native-evidence/0.97.2/enemies"
RUNTIME = ROOT / "runtime/analysis/history/native-recovery/enemy-spawning/20e2f3691d48"
FUNCTIONS = (0x1454beef0, 0x145536a90, 0x14552ef30, 0x1454c2040, 0x1454c17b0, 0x1454c2a20, 0x14552f110, 0x14552f4d0, 0x145529990, 0x1454d1b70)
BRANCHES = (0x1454a7f41, 0x1454a818a, 0x1454a7fb1, 0x1454a8050)
SCOPES = (("spawning-tick", 0x1454a701a, 0x1454a792f),
          ("spawning-waves", 0x1454a792f, 0x1454a92bd))
CONSTANTS = (0x1458eb480,0x1458eb488,0x1458eb4f8,0x1458eb500,0x1458eb510,
             0x1458eb514,0x1458eb524,0x1458eb52c,0x1458fcc38,0x1458f6620,
             0x1458f6688,0x14590ae44,0x14590aec8,0x145930f00,0x1459d72d0,
             0x1458fcd80,0x1459f74d4,0x146720f80,0x1459c78b4,0x14593e520,
             0x1458fcce8,0x1458fcde8,0x1458fcdec,0x1469aa400,0x1469aa408,
             0x1469aa40c,0x1458f8f90,0x1458f8f98,0x1458ed014,0x1459eb3c0,0x1459c799c,
             0x1459c7a24,0x145a1176c,0x145a41874,0x1459c79e8,
             0x14593ec30,0x1458f8de0,0x1458f8de4,0x1458f8e00,
             0x1458f6628,0x1459c77e0,0x1458fcde4,0x145bba2f0,
             0x14590aefc,0x14590af08,0x14593e2d0,0x1458f8d40,
             0x1458fce34,0x1458f6600,0x1469aa410,0x1469aa414)

def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location("inventory", ROOT/"scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec); spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    ends = {pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    OUT.mkdir(parents=True, exist_ok=True); RUNTIME.mkdir(parents=True, exist_ok=True)
    def bound(a,b):
        offset = pe.rva_offset(a-pe.image_base); raw = data[offset:offset+b-a]
        return dict(va=hex(a), end_exclusive=hex(b), file_offset=hex(offset),
                    byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest())
    functions = []
    for a in FUNCTIONS:
        b=ends[a];row=bound(a,b);functions.append(row)
        offset=int(row['file_offset'],16); path=RUNTIME/f'{a:x}.bin';path.write_bytes(data[offset:offset+b-a])
        plan=dict(target=str(path.relative_to(ROOT)),output=f'runtime/analysis/history/native-recovery/enemy-spawning/20e2f3691d48/rea-{a:x}',
                  open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),
                  timeout=240,open_timeout=60,operations=[dict(name='analyze_function',arguments=dict(procedure=hex(a)))])
        (RUNTIME/f'plan-{a:x}.json').write_text(portable_json(plan,indent=2)+'\n')
    branch_slices=[]
    for a in BRANCHES:
        b=0x1454a92bd;row=bound(a,b);row['owning_function']='0x14549d550'
        row['boundary_note']='Unmodified branch-entry-through-shared-tail slice; not an original function boundary.'
        branch_slices.append(row)
        offset=int(row['file_offset'],16); path=RUNTIME/f'{a:x}.bin';path.write_bytes(data[offset:offset+b-a])
        plan=dict(target=str(path.relative_to(ROOT)),output=f'runtime/analysis/history/native-recovery/enemy-spawning/20e2f3691d48/rea-{a:x}',
                  open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),
                  timeout=240,open_timeout=60,operations=[dict(name='analyze_function',arguments=dict(procedure=hex(a)))])
        (RUNTIME/f'plan-{a:x}.json').write_text(portable_json(plan,indent=2)+'\n')
    scopes=[]
    for label,a,b in SCOPES + tuple((f'spawning-{a:x}',a,ends[a]) for a in FUNCTIONS):
        text=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',
                                      f'--stop-address={b:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True)
        path=OUT/f'{label}.asm';path.write_text(text)
        scopes.append(dict(label=label,**bound(a,b),assembly=path.name,
                           assembly_sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
    constants=[]
    for a in CONSTANTS:
        offset=pe.rva_offset(a-pe.image_base);raw=data[offset:offset+4]
        constants.append(dict(va=hex(a),file_offset=hex(offset),hex=raw.hex(),f32=struct.unpack('<f',raw)[0]))
    imports=[]
    for module in pe.imports():
        for index,name in enumerate(module['functions']):
            a=int(module['iat_start_address'],16)+index*8
            if a in (0x1458e83f8,0x1458e8428):imports.append(dict(iat_va=hex(a),library=module['library'],name=name))
    records=[]
    bundles=list(RUNTIME.glob('rea-*/evidence-bundle.json'))
    bundles.append(ROOT/'runtime/analysis/history/raid/guardians/b4a536d2fa6d/rea-14549d550/evidence-bundle.json')
    for bundle in bundles:
        if not bundle.exists():continue
        for record in json.loads(bundle.read_text())['records']:
            if record['operation']!='analyze_function':continue
            text=record['normalized_result'].get('pseudocode','')
            if record.get('parameters',{}).get('procedure')=='0x14549d550':
                text='\n'.join(text.splitlines()[6053:6384])
            records.append(dict(evidence_id=record['evidence_id'],operation=record['operation'],
                parameters=record.get('parameters'),subject=record.get('subject'),provider=record.get('provider'),
                analysis_profile=record.get('analysis_profile'),limitations=record.get('limitations'),
                relationship_coverage=record.get('relationship_coverage'),pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest(),pseudocode=text,
                note='Decompiler output is not original source. Raw imports use GCC analysis signatures; original Win64 instructions govern arguments and fallback tail jumps.'))
    manifest=dict(date='2026-10-18',version='0.97.2',target=str(TARGET.relative_to(ROOT)),target_sha256=SHA,
        target_executed=False,functions=functions,branch_slices=branch_slices,scopes=scopes,constants=constants,math_imports=imports,
        pattern_jump_table=dict(**bound(0x1469acc70,0x1469acc80),hex=data[pe.rva_offset(0x1469acc70-pe.image_base):pe.rva_offset(0x1469acc70-pe.image_base)+16].hex(),targets=[hex(0x1469acc70+struct.unpack_from('<i',data,pe.rva_offset(0x1469acc70-pe.image_base)+4*j)[0]) for j in range(4)]),
        limitations=['Static source reconstruction only; not connected to a world loop.',
        'REA exact raw slices omit callee code and global data; Win64 instruction audit binds conclusions.',
        'Ordinary budget/population, timed elites and all four periodic formations recovered; boss/guardian schedules and gameplay entity adapters are separate owners.'])
    (OUT/'spawning-manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
    (OUT/'spawning-rea.json').write_text(portable_json(dict(target_sha256=SHA,records=records),indent=2)+'\n')
    print(f'Retained {len(scopes)} instruction scopes, {len(constants)} constants, {len(records)} REA records.')
if __name__=='__main__':main()
