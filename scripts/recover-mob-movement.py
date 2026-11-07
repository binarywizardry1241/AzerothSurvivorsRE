#!/usr/bin/env python3
"""Revalidate mob ground-path publication against the hash-bound 0.105.0 PE.

Never build or launch the game. --rea uses the project wrapper and Ghidra on
unchanged function slices; output stays under ignored runtime/ for review.
The historical instruction harness is shared, with an explicit recovered ABI.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import argparse
import hashlib
import json
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe'
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
OUT = ROOT / 'runtime/analysis/history/movement/mob-movement/46a02b277df9'
ACTOR = 0x14593ac20
PROFILE = dict(
    dispatch=(0x14593d6bb, 0x14593d801),
    packet=(0x1458aa9e0, 0x1458aac7d), stop_after_move=0x14593d7b0,
    height_query=0x1458c7b60, facing_packet=0x1458aa520,
    facing_packet_end=0x1458aa81e,
    guid_writer=0x1458b6c70, point_writer=0x145895ba0,
    buffer_grow=0x145bcb2d0, upper_bound=0x145d6d874,
    terrain_offset=0x950, serial_offset=0xa10, target_offset=0x460,
)


def save(path, value):
    path.write_text(portable_json(value, indent=2, allow_nan=False) + '\n')


def load_module(name, filename):
    module = load_script(name, ROOT / 'scripts' / filename)
    return module


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rea', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    pe = load_module('inventory', 'inventory-executable.py').PE(data)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    OUT.mkdir(parents=True, exist_ok=True)

    def span(lo, hi):
        offset = pe.rva_offset(lo - pe.image_base)
        raw = data[offset:offset + hi - lo]
        return raw, dict(start=hex(lo), end_exclusive=hex(hi),
                         file_offset=hex(offset), sha256=hashlib.sha256(raw).hexdigest())

    owners = []
    for name, lo, hi in [('movement-dispatch', *PROFILE['dispatch']),
                         ('movement-packet', *PROFILE['packet']),
                         ('facing-packet', PROFILE['facing_packet'], bounds[PROFILE['facing_packet']])]:
        raw, record = span(lo, hi)
        if name != 'movement-dispatch':
            assert bounds[lo] == hi
        (OUT / (name + '.asm')).write_text(objdump_output([
            'objdump', '-d', '--no-show-raw-insn', f'--start-address={lo:#x}',
            f'--stop-address={hi:#x}', str(TARGET.relative_to(ROOT)),
        ], cwd=ROOT, text=True))
        owners.append(dict(role=name, **record, assembly=name + '.asm'))

    rea = []
    for name, lo in [('actor', ACTOR), ('movement-packet', PROFILE['packet'][0]),
                      ('facing-packet', PROFILE['facing_packet'])]:
        raw, record = span(lo, bounds[lo])
        binary = OUT / (name + '.bin')
        binary.write_bytes(raw)
        output = OUT / ('rea-' + name)
        if args.rea and not output.exists():
            plan = OUT / (name + '-plan.json')
            save(plan, dict(target=str(binary.relative_to(ROOT)), output=str(output.relative_to(ROOT)),
                            init_timeout=60, open_timeout=60, timeout=180,
                            open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(lo)),
                            operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(lo)))]))
            subprocess.run(['python3', 'scripts/rea-batch.py', str(plan.relative_to(ROOT))], cwd=ROOT, check=True)
        response = output / '003-procedure_pseudo_code.json'
        if response.exists():
            result = json.loads(response.read_text())['response']['result']
            evidence = result.get('structuredContent') or json.loads(result['content'][0]['text'])
            assert evidence['subject']['digest']['sha256'] == record['sha256']
            assert evidence['provider']['id'] == 'ghidra'
            rea.append(dict(role=name, **record, evidence_id=evidence['evidence_id'],
                            provider='Ghidra 12.1.4', limitation=
                            'Headerless function import; Win64 ABI and external code/data require original-PE instructions.'))
        elif args.rea:
            raise RuntimeError(f'Incomplete REA output: {output.relative_to(ROOT)}')

    harness = load_module('mob_movement_native', 'mob_movement_fixtures.py')
    cases = harness.fixtures(pe, data, PROFILE)
    historical = json.loads((ROOT / 'docs/analysis/evidence/0.100.1/mob-movement/native-fixtures.json').read_text())
    assert historical['target_sha256'] == harness.SHA
    unchanged = cases == historical['cases']
    facing_cases = [row for row in harness.fixtures(pe, data, PROFILE, execute_facing=True)
                    if row['mode'] == 'face']
    save(OUT / 'stationary-facing-fixtures.json', dict(target_sha256=SHA,
         method='Unchanged selected-PE actor dispatch and facing-packet instructions in Unicorn',
         seams=['Allocation, buffer growth, packed-GUID and Vector3 writes are modeled.',
                'No terrain query is admitted on the facing branch.',
                'The original client consumer, process and rendered game are not executed.'],
         cases=facing_cases))
    save(OUT / 'native-fixtures.json', dict(target_sha256=SHA,
         method='Unchanged selected-PE caller and movement-packet instructions in Unicorn',
         seams=['Primary-height results are controlled independently at each endpoint.',
                'Allocation, buffer growth, packed-GUID and Vector3 serialization are explicit boundaries.',
                'The nonpositive-duration facing serializer is intercepted, not executed.',
                'No original process, Rust source, MPQ geometry or rendered animation is executed.'],
         matches_0_100_1_cases=unchanged, cases=cases))
    profile = {key: [hex(v) for v in value] if isinstance(value, tuple) else hex(value)
               for key, value in PROFILE.items()}
    save(OUT / 'manifest.json', dict(target=str(TARGET.relative_to(ROOT)), target_sha256=SHA,
         target_process_launched=False, owners=owners, rea=rea, native_profile=profile,
         constants=[dict(role=role, **span(address, address + 4)[1],
                         bits=struct.unpack_from('<I', data, pe.rva_offset(address - pe.image_base))[0])
                    for role, address in [('duration-milliseconds', 0x145dbf5a4),
                                          ('duration-upper-bound', PROFILE['upper_bound'])]],
         validation=dict(native_cases=len(cases), matches_0_100_1_cases=unchanged),
         limits=['Only movement publication is revalidated here; AI, navigation and cache construction keep their earlier provenance.',
                 'Source tests, compilation, real-MPQ moving-mob and original/rebuilt runtime comparisons were not run.',
                 'Static facing-packet evidence does not close the local stationary-facing integration gap.']))
    print(f'{len(cases)} movement and {len(facing_cases)} stationary-facing native cases passed; historical movement outputs match: {unchanged}; staged at {OUT.relative_to(ROOT)}')


if __name__ == '__main__':
    main()
