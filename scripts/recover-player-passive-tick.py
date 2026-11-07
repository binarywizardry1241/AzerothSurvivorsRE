#!/usr/bin/env python3
"""Retain current GameTick passive consumers; reuse its existing REA/Ghidra evidence."""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import argparse, hashlib, json, struct, subprocess

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
SPANS = [
    (0x1454a0987, 0x1454a13ac, 'bloodrage-seal-soul-redemption'),
    (0x1454a13ac, 0x1454a16f4, 'hunters-mark'),
    (0x1454a16f4, 0x1454a1f18, 'faerie-fire'),
    (0x1454a1f18, 0x1454a3265, 'lightwell'),
    (0x1454a3265, 0x1454a3884, 'polymorph-resource-bar'),
]
HELPERS = [0x1454d69f0, 0x1454d7020, 0x1454d5bd0, 0x1454d5740, 0x1454d5950,
           0x1454d7810, 0x145531920, 0x145544ec0, 0x1455464c0, 0x145532400,
           0x145532030, 0x145523780, 0x145524320, 0x145524410,0x1454d42f0,0x145544f90,
           0x145512d50,0x14552b8f0,0x1454d2850,0x14541b9d0]
CONSTANTS = [0x1459eb2d0,0x1458eb52c,0x1458f8de4,0x1458f6620,0x1458f6624,
             0x1458f662c,0x14593e270,0x1458eb50c,0x14590aefc,0x1458fcc38,
             0x1458eb4f8,0x145bfc414,0x14698ebd0,0x1458f8de0,0x1459eb3c0,0x14590ae44,
             0x1459c799c,0x145a116e0,0x145a116e4,0x1458f8fa0,0x1458ed014,0x1458eb4fc]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare', action='store_true')
    args = parser.parse_args()
    binary = TARGET.read_bytes()
    assert hashlib.sha256(binary).hexdigest() == SHA
    inventory = load_script('inventory', ROOT/'scripts/inventory-executable.py')
    pe = inventory.PE(binary)
    functions = {pe.image_base+a:pe.image_base+z for a,z,_ in pe.functions()}
    # Leaf has no unwind record; final RET is at1454d43ce, followed by INT3.
    functions[0x1454d42f0] = 0x1454d43cf
    functions[0x145512d50] = 0x145512df7
    runtime = ROOT/'runtime/analysis/history/native-recovery/player-passive-tick/d94a2c1f9116'; runtime.mkdir(exist_ok=True)
    evidence = ROOT/'runtime/analysis/staging/native-evidence/0.97.2/player-passive-tick'; evidence.mkdir(parents=True, exist_ok=True)
    rows = []
    for start, end, name in SPANS+[(a, functions[a], f'{a:x}') for a in HELPERS]:
        offset = pe.rva_offset(start-pe.image_base); payload = binary[offset:offset+end-start]
        assembly = objdump_output(['objdump','-d','--no-show-raw-insn',
            f'--start-address={start:#x}',f'--stop-address={end:#x}',str(TARGET)],text=True)
        (evidence/f'{name}.asm').write_text(assembly)
        record = dict(name=name,address=hex(start),end_exclusive=hex(end),file_offset=hex(offset),
                      bytes=len(payload),sha256=hashlib.sha256(payload).hexdigest())
        record['boundary'] = ('Explicit leaf RET followed by INT3' if start in (0x1454d42f0,0x145512d50)
                              else 'Original PE RUNTIME_FUNCTION' if start in HELPERS else 'Focused GameTick span')
        if start in HELPERS:
            if args.prepare:
                (runtime/f'{start:x}.bin').write_bytes(payload)
                plan = dict(target=f'runtime/analysis/history/native-recovery/player-passive-tick/d94a2c1f9116/{start:x}.bin',
                    output=f'runtime/analysis/history/native-recovery/player-passive-tick/d94a2c1f9116/rea-{start:x}',
                    open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(start)),
                    timeout=240,open_timeout=90,
                    operations=[dict(name='analyze_function',arguments=dict(procedure=hex(start)))])
                (runtime/f'plan-{start:x}.json').write_text(portable_json(plan,indent=2)+'\n')
            bundle = runtime/f'rea-{start:x}/evidence-bundle.json'
            if bundle.exists():
                item = next(x for x in json.loads(bundle.read_text())['records'] if x['operation']=='analyze_function')
                assert item['subject']['digest']['sha256'] == record['sha256'], f'wrong helper bytes: {name}'
                assert item['provider']['id'] == 'ghidra', f'wrong helper provider: {name}'
                record['rea_evidence_id'] = item['evidence_id']
                record['provider'] = item['provider']
                record['analysis_status'] = 'REA/Ghidra retained'
                code = item.get('normalized_result',{}).get('pseudocode') or item['raw_result']['value']['pseudocode']
                (evidence/f'{name}.ghidra.c').write_text(code)
            else:
                record['analysis_status'] = 'Exact assembly retained; focused REA helper analysis not run'
        rows.append(record)
    shared = json.loads((ROOT/'docs/analysis/evidence/0.97.2/player-abilities/behavior-native.json').read_text())
    tick = dict(next(x for x in shared['analyses'] if x['name']=='14549d550'))
    for key in ('assembly', 'pseudocode'):
        tick[key] = 'docs/analysis/evidence/0.97.2/player-abilities/' + tick[key]
    owner = tick['original']
    owner_offset = pe.rva_offset(int(owner['address'],16)-pe.image_base)
    assert hashlib.sha256(binary[owner_offset:owner_offset+owner['size']]).hexdigest() == owner['sha256']
    assert tick['provider']['id'] == 'ghidra'
    constants = []
    for address in CONSTANTS:
        offset = pe.rva_offset(address-pe.image_base)
        constants.append(dict(address=hex(address),file_offset=hex(offset),
            bytes=binary[offset:offset+4].hex(), f32=struct.unpack_from('<f',binary,offset)[0]))
    offset = pe.rva_offset(0x1469ac2f0-pe.image_base)
    profile = binary[offset:offset+16]
    assert struct.unpack('<IIfI',profile) == (9012,6671,1.0,0)
    imported = {int(library['iat_start_address'],16)+index*8:(library['library'],name)
                for library in pe.imports() for index,name in enumerate(library['functions'])}
    math = []
    for address, name in ((0x145756e2b,'sinf'),(0x145756e31,'cosf')):
        at = pe.rva_offset(address-pe.image_base)
        thunk = binary[at:at+6]
        assert thunk[:2] == b'\xff\x25'
        iat = address+6+struct.unpack_from('<i',thunk,2)[0]
        assert imported[iat][1] == name
        math.append(dict(address=hex(address),file_offset=hex(at),bytes=thunk.hex(),
                         iat=hex(iat),library=imported[iat][0],name=name,
                         sha256=hashlib.sha256(thunk).hexdigest()))
    report = dict(version='0.97.2',target_sha256=SHA,target_executed=False,game_tick=tick,
        ranges=rows,constants=constants,math_imports=math,
        lightwell_profile=dict(address='0x1469ac2f0',file_offset=hex(offset),bytes=profile.hex(),
                               sha256=hashlib.sha256(profile).hexdigest(),entry=9012,display=6671,scale=1.0),
        validation='Static extraction only; no builds/compiler checks/tests/emulation/launches.')
    (evidence/'native.json').write_text(portable_json(report,indent=2)+'\n')
    print(f'Retained {len(rows)} exact passive tick ranges; prepared={args.prepare}.')


if __name__ == '__main__': main()
