#!/usr/bin/env python3
"""Extract SHA-bound 0.97.2 backdrop profiles; never execute the target."""
from portable_paths import portable_json
from script_sources import load_script
import hashlib
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUT = ROOT / 'docs/analysis/evidence/0.97.2/menu-background-0.97.2.json'


def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    inventory = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = inventory.PE(data)
    def read(va, n):
        at = pe.rva_offset(va - pe.image_base)
        return data[at:at+n]
    def floats(va, count=4):
        return list(struct.unpack('<'+'f'*count, read(va, count*4)))
    def string(va):
        address, length = struct.unpack('<QQ', read(va, 16))
        return read(address, length).decode()
    # Profile layout is bound by stores at 145509dae..145509dc3. The zone
    # collection inserts one capacity field before its borrowed static definition;
    # static offsets below are therefore eight bytes before the heap offsets.
    profiles = []
    for i in range(12):
        va = 0x146716440 + i * 240
        key = string(va)
        center = floats(va + 0xc0, 3)
        radius = struct.unpack('<f', struct.pack('<f', floats(va + 0xd0, 1)[0] * floats(0x1458eb524, 1)[0]))[0]
        orbit = floats(0x1469ad360)
        orbit[0] = radius
        sweep = floats(0x1469ad270)
        clearance = floats(0x1458f6600, 1)[0]
        if key == 'feralas':
            orbit = floats(0x1469ad260)
            orbit[0] = radius
            clearance = floats(0x1459c7c78, 1)[0]
        elif key == 'duskwood':
            center = floats(0x1469ad280, 2) + floats(0x145933c50, 1)
            orbit, sweep = floats(0x1469ad2a0), floats(0x1469ad290)
        elif key == 'elwynn':
            center = floats(0x1469ad2b0, 2) + floats(0x145a11764, 1)
            orbit, sweep = floats(0x1469ad2d0), floats(0x1469ad2c0)
            clearance = floats(0x1469ad2e0, 1)[0]
        elif key == 'arena':
            orbit, sweep = floats(0x1469ad300), floats(0x1469ad2f0)
            clearance = 0.0
        elif key == 'naxx':
            orbit, sweep = floats(0x1469ad320), floats(0x1469ad310)
            clearance = 0.0
        elif key == 'sm':
            center = floats(0x1469ad330, 2) + floats(0x1459c7890, 1)
            orbit, sweep = floats(0x1469ad350), floats(0x1469ad340)
            clearance = 0.0
        profile = dict(key=key, map_id=struct.unpack('<I', read(va+0xb8, 4))[0],
                       zone_index=i, center=center, radius=orbit[0], eye_height=orbit[1],
                       phase=orbit[2], amplitude=orbit[3], period=sweep[0],
                       target_radius=sweep[1], target_height=sweep[2],
                       radius_wave=sweep[3], clearance=clearance)
        profiles.append(profile)
    asset = dict(target_version='0.97.2', target_sha256=SHA, profiles=profiles)
    (ROOT/'crates/azeroth-survivors-re/assets/menu-background-0.97.2.json').write_text(portable_json(asset,indent=2)+'\n')
    thunk_va = 0x145756e25
    thunk = read(thunk_va, 6)
    assert thunk[:2] == b'\xff\x25'
    trunc_iat = thunk_va + 6 + struct.unpack_from('<i', thunk, 2)[0]
    imported = next((table['library'], table['functions'][(trunc_iat - int(table['iat_start_address'], 16)) // 8])
                    for table in pe.imports()
                    if 0 <= (trunc_iat - int(table['iat_start_address'], 16)) // 8 < len(table['functions']))
    assert imported[1] == 'truncf'
    functions = []
    for address, end, role in [
        (0x14009df40,0x14009e254,'menuScene default, environment override and enabled gate'),
        (0x14009ad90,0x14009b211,'28 ember position/alpha update'),
        (0x14009d4d0,0x14009debd,'zone request, orbit, image and black cover fade'),
        (0x1402472a0,0x1402480fe,'loading image and gradient constructor'),
        (0x145509c20,0x145509df1,'zone orbit profile leaf'),
        (0x14070eb40,0x14070f544,'engine camera, ground clearance and camera query'),
        (0x14070f550,0x14070f75c,'engine map and residency stabilization'),
    ]:
        payload = read(address,end-address)
        record = dict(address=hex(address), end_exclusive=hex(end), role=role,
                      file_offset=hex(pe.rva_offset(address-pe.image_base)),
                      sha256=hashlib.sha256(payload).hexdigest(), byte_count=len(payload))
        bundle = ROOT/f'runtime/menu-background-0.97.2/rea-{address:x}/evidence-bundle.json'
        if bundle.exists():
            records=json.loads(bundle.read_text())['records']
            found=next(r for r in records if r['operation']=='analyze_function')
            record['rea_evidence_id']=found['evidence_id']
        functions.append(record)
    constants=[]
    for va,n in [(0x1469ad260,0x110),(0x1458eb524,4),(0x1458f6600,4),(0x145933c50,4),
                 (0x145a11764,4),(0x1459c7890,4),(0x1459c7c78,4),(0x1458f8d40,4),
                 (0x1458eb4f0,4),(0x1458f8fe0,16),(0x1458f8ff0,16),
                 (0x14593e930,0xa0),(0x1458f8f6c,16),(0x1458f6620,20),(0x1458eb514,4),(0x14593a358,152)]:
        payload=read(va,n)
        constants.append(dict(address=hex(va),file_offset=hex(pe.rva_offset(va-pe.image_base)),
                              byte_count=n,bytes_hex=payload.hex(),f32=floats(va,n//4)))
    evidence=dict(date='2026-10-18',target_version='0.97.2',target_sha256=SHA,
                  target_executed=False,functions=functions,constants=constants,
                  particle_math=dict(thunk=hex(thunk_va),iat=hex(trunc_iat),bytes_hex=thunk.hex(),
                                     library=imported[0],function=imported[1]),
                  zone_table=dict(address='0x146716440',stride=240,count=12,
                                  key_offset=0,map_offset=184,center_offset=192,radius_offset=208),
                  profiles=profiles,
                  gate=dict(cvar='menuScene',default='1',override='WOW_MENU_SCENE',disabled_value='trimmed exact 0'),
                  option=dict(address='0x14593a358',page=8,control=7,storage=0,
                              label='Main Menu Background',choices=[['Animated Zone','1'],['Black','0']]),
                  fade=dict(rise_seconds=floats(0x1458f8d40,1)[0],fall_seconds=-floats(0x1458eb4f0,1)[0],
                            formula='1 - f*f*(3 - 2*f)',image_tint=[.4,.38,.36],
                            disabled_image_alpha=0,scene_engine_integrated=True,
                            clearance_lift_applies_to="eye_only",runtime_parity="unverified"),
                  limitations=['Raw slices omit callees and external data; Windows ABI signatures are interpreted from original instructions.',
                               'Profile leaf has no unwind entry; explicit boundary ends after its final branch and before padding.',
                               'Source scene driver and compositor are connected; shared engine fidelity and runtime parity remain unverified; no target launched.'])
    OUT.parent.mkdir(parents=True,exist_ok=True)
    OUT.write_text(portable_json(evidence,indent=2)+'\n')
    print(f'Recovered {len(profiles)} selected-target orbit profiles and menuScene option/gate.')

if __name__ == '__main__':
    main()
