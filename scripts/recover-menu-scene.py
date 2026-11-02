#!/usr/bin/env python3
"""Recover selected 0.97.2 menu engine slices/evidence without executing them."""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
FUNCTIONS = {
    0x1406cc240: 'Shared scene mask setter',
    0x1406cc320: 'Shared scene active getter',
    0x1406cc3f0: 'Shared 40-byte scene request setter',
    0x1406cc520: 'Shared scene renderable getter: active and not masked',
    0x1406cc600: 'Shared scene ready getter: active and ready',
    0x1406cc6e0: 'Shared scene request-present getter',
    0x1406d3050: 'MenuScenePlugin build and two system registration descriptors',
    0x14070eb40: 'Scene camera and terrain lift',
    0x141716030: 'Terrain height query wrapper initializes absent tile cache',
    0x141716050: 'Cached terrain height query from streamed ADT chunks',
    0x14070f550: 'Scene stabilization, map selection, ready latch',
    0x1407470b0: 'Scene stabilizer resource registration',
    0x140747390: 'Scene stabilizer runtime resource tuple',
    0x140963de0: 'WorldLive adapter: ordinary world or menu scene active',
    0x140963bd0: 'WorldLive adapter resource registration shares application state TypeID',
    0x1408395f0: 'Camera visibility adapter and renderable menu scene helper',
    0x14093f540: 'Request-present view-lane gate',
    0x1400a9e60: 'Backdrop publisher resource registration',
    0x1400aa700: 'Backdrop publisher runtime resource tuple',
    0x140099b40: 'Picker actions open the armory umbrella at resource +0x72',
    0x140069df0: 'Escape closes the armory umbrella at resource +0x72',
    0x1403a1cc0: 'Armory visibility consumes resource +0x72',
    0x1403a32d0: 'Armory close/tab actions write resource +0x72',
    0x1403ace80: 'Armory visibility registration binds shared mask resource TypeID',
    0x1403ad2b0: 'Armory visibility runtime resource tuple',
    0x140fbf8a0: 'Menu request suppresses stock character-select preview feed',
    0x140fe0160: 'Character-select preview system resource registration',
    0x140fe0440: 'Character-select preview system runtime resource tuple',
    0x140cf52c0: 'Character-select preview resource registration size 0xbc and alignment 4',
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare', action='store_true')
    args = parser.parse_args()
    binary = TARGET.read_bytes()
    if hashlib.sha256(binary).hexdigest() != SHA:
        raise SystemExit('Selected EXE differs from the authoritative 0.97.2 target')
    inventory = load_script('inventory', ROOT/'scripts/inventory-executable.py')
    pe = inventory.PE(binary)
    functions = {pe.image_base+a:pe.image_base+z for a,z,_ in pe.functions()}
    runtime = ROOT/'runtime/menu-scene-0.97.2'
    runtime.mkdir(exist_ok=True)
    records = []
    for start, role in FUNCTIONS.items():
        end = functions[start]
        offset = pe.rva_offset(start-pe.image_base)
        payload = binary[offset:offset+end-start]
        stem = f'{start:x}'
        plan = dict(target=f'runtime/menu-scene-0.97.2/{stem}.bin',
                    output=f'runtime/menu-scene-0.97.2/rea-{stem}',
                    open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(start)),
                    timeout=240,open_timeout=60,
                    operations=[dict(name='analyze_function',arguments=dict(procedure=hex(start)))])
        if args.prepare:
            (runtime/f'{stem}.bin').write_bytes(payload)
            (runtime/f'plan-{stem}.json').write_text(portable_json(plan,indent=2)+'\n')
            assembly = objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={start:#x}',f'--stop-address={end:#x}',str(TARGET)],text=True)
            (runtime/f'{stem}.asm').write_text(assembly)
        assembly = runtime/f'{stem}.asm'
        if assembly.exists():
            curated = ROOT/f'docs/analysis/evidence/0.97.2/menu-scene-0.97.2-{stem}.asm'
            curated.write_text(assembly.read_text())
        record=dict(address=hex(start),end_exclusive=hex(end),file_offset=hex(offset),
                    sha256=hashlib.sha256(payload).hexdigest(),byte_count=len(payload),role=role)
        for directory in [runtime,ROOT/'runtime/menu-background-0.97.2']:
            bundle=directory/f'rea-{stem}'/'evidence-bundle.json'
            if bundle.exists():
                r=next(r for r in json.loads(bundle.read_text())['records'] if r['operation']=='analyze_function')
                record['rea_evidence_id']=r['evidence_id']
                (runtime/f'{stem}.c').write_text(r['raw_result']['value']['pseudocode'])
                break
        records.append(record)
    out=ROOT/'docs/analysis/evidence/0.97.2/menu-scene-0.97.2.json'
    report=dict(date='2026-10-18',target_version='0.97.2',target_sha256=SHA,
                target_executed=False,functions=records,
                request_layout=dict(tag=0,map=4,zone=8,eye=12,target=24,clearance=36,bytes=40),
                global_lanes=dict(request='0x14799f51c',mask='0x14799f544',active='0x14799f545',ready='0x14799f546'),
                stabilization=dict(identity=['map','zone'],new_identity_frames=0,active_at_unchanged_frames=3,
                                   ready_at_unchanged_frames=18,counter='saturating u32',
                                   application_state_tag_required=1,
                                   ready_requires=['focus_resident','scene_ready','colliders_pending=0','merge_pending=0','gx_pending=0'],
                                   ready_latched_until_identity_change=True),
                application_state=dict(type_id_address='0x145ab05d0',
                                   scene_system_slot='0x10',world_live_system_slot='0x8',
                                   ordinary_world_tag=3,menu_scene_tag=1,
                                   reconstruction='Standalone menu stays in the native tag1 route; gameplay excluded'),
                mask_resource=dict(type_id_address='0x1458f9bb8',type_id_bytes='1b93c1cac923fd5b7ffc08f7c0a5045a',
                                   publisher_state_slot='0x138',armory_state_slot='0x40',field_offset='0x72',
                                   meaning='Armory umbrella open, across all tabs',
                                   reconstruction='MenuState.page != Page::Picker'),
                camera=dict(terrain_clearance='max(ground + clearance - eye.z, 0), else 0',
                            smoothing='lift += (wanted-lift) * min(2*delta_seconds, 1)',
                            lift_applied_to='eye.z only; target unchanged',
                            world_camera_gate='active and not masked'),
                stock_character_preview=dict(type_id_address='0x145ab1b80',
                            type_id_bytes='da96659844906cb1465ebe5cf01c3abe',bytes=188,
                            request_branch='Sets trailing option tag +0xb8 to 2, returns before roster look feed',
                            lighting_override_recovered=False),
                validation=dict(source_only=True,builds='not run',
                                compiler_checks='not run',
                                runtime='not run'))
    out.parent.mkdir(parents=True,exist_ok=True)
    out.write_text(portable_json(report,indent=2)+'\n')
    print(f'Recorded {len(records)} current-target native menu engine slices; prepared={args.prepare}.')

if __name__ == '__main__':main()
