#!/usr/bin/env python3
"""Extract SHA-bound 0.97.2 hero preview evidence without executing the target."""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
FUNCTIONS = {
    0x1407f29c0: 'HeroPreviewPlugin build from current-target named plugin vtable',
    0x140876380: 'Hero preview bridge system resource registration',
    0x1408767a0: 'Hero preview bridge system runtime resource tuple',
    0x140816b50: 'Hero preview bridge into shared model pane and dressup appearance',
    0x1407a1f50: '164-byte hero request setter, yaw/aspect and physical size cap',
    0x1407a2100: 'Hero preview cached output-image getter',
    0x1403a29f0: 'Menu hero look/equipment/yaw/pane request publisher',
    0x1403a1880: 'Armory preview image consumer',
    0x145423b80: 'Class-specific saved gear profile read for hero request',
    0x145459e90: 'Hero outfit and display resolution',
    0x145500d30: 'Hero five-feature normalization',
    0x1401b0f50: 'Nineteen-slot display/inventory conversion',
    0x145459600: 'Race/class baseline outfit getter',
    0x1454598d0: 'Baseline item definition reader',
    0x140a030e0: 'Body pane authored-camera/fixed-camera framing',
    0x140a6b970: 'Pane diagonal-FOV custom projection matrix',
    0x1407ae0c0: 'Live character pane camera, root scale and model rebuild',
    0x1408242e0: 'Portrait and character-pane setup including native light buffer',
    0x1418c5210: 'LightBlob model constructor with no prop probe',
    0x1416af7b0: 'Shared model-light core row and directional SH packer',
    0x1408757e0: 'GxAspect runtime producer from primary Window logical dimensions',
    0x1408755a0: 'GxAspect resource registration and primary Window query',
    0x140897ee0: 'Character pane resource tuple shares GxAspect TypeID',
    0x14079da50: 'Character material-twin adapter selects lane zero',
    0x1407db730: 'Material twin clones source light and conditionally selects Rig',
    0x1403ab340: 'Menu hero publisher resource registration; yaw TypeID fifth resource',
    0x1403ab990: 'Menu hero publisher runtime resource tuple',
    0x1403a24c0: 'Character turn-button hold speed and logical cursor drag',
    0x1403aa430: 'Character turn/drag input registration shares yaw TypeID',
    0x1403aa820: 'Character turn/drag input runtime resource tuple',
    0x140399640: 'ArmoryPlugin yaw resource initialization and input system registration',
    0x14023d600: 'Character pane and signed turn-button speed components',
    0x14109dbc0: 'Pane body part relight iterator collector',
    0x14109cea0: 'Pane rider relight iterator collector',
    0x14109d6c0: 'Pane billboard relight iterator collector',
    0x14061b100: 'Pane body part map calls current material twin adapter',
    0x14061b5e0: 'Pane rider map calls current material twin adapter',
    0x14061ba50: 'Pane billboard map calls current material twin adapter',
    0x14085ad80: 'PortraitPlugin initializes shared GxAspect to four-thirds',
}


def baseline_outfits(binary, pe):
    """The current target's 66 item records and 72 race/class 19-slot arrays."""
    def at(address, length):
        offset = pe.rva_offset(address-pe.image_base)
        return binary[offset:offset+length]

    def u64(address):
        return struct.unpack('<Q', at(address, 8))[0]

    slot_map = at(0x14698b040, 23)
    items = []
    for address in range(0x1469865f0, 0x146987040, 40):
        name, length, item, display, inv, cls, subcls, sheath = struct.unpack('<QQ6I', at(address, 40))
        items.append(dict(id=item, name=at(name, length).decode('utf-8'), display_id=display,
                          inventory_type=inv, item_class=cls, item_subclass=subcls,
                          sheath=sheath, slot_id=slot_map[inv-1] if 1 <= inv <= 23 else 17))
    definitions = {item['id']:item for item in items}
    tables = {1:0x14698afe8, 2:0x14698ad80, 3:0x14698add8, 4:0x14698ae30,
              5:0x14698ae88, 6:0x14698aee0, 7:0x14698af38, 8:0x14698af90}
    outfits = []
    for race, table in tables.items():
        for cls in [1,2,3,4,5,7,8,9,11]:
            vector = u64(table+(cls-1)*8)
            data, count = struct.unpack('<QQ', at(vector+8, 16))
            slots = [0]*19
            for item in struct.unpack('<'+'I'*count, at(data, count*4)):
                definition = definitions.get(item)
                if definition:
                    slots[definition['slot_id']] = item
            outfits.append(dict(race=race, **{'class':cls}, slots=slots))
    baseline = json.loads((ROOT/'crates/azeroth-survivors-re/assets/armory.json').read_text())
    return dict(item_table=dict(address='0x1469865f0', stride=40, count=len(items)),
                race_class_tables={str(k):hex(v) for k,v in tables.items()},
                items=items, outfits=outfits,
                reused_catalog_version=baseline['version'],
                items_equal_catalog=items == baseline['starter_items'],
                outfits_equal_catalog=outfits == baseline['starters'])


def shader_match(binary):
    start = 0x5d4aace
    end = binary.index(b'\0', start)
    native = binary[start:end]
    source_path = 'crates/benilla-assets/src/shaders/wow_model.wgsl'
    source = (ROOT/source_path).read_bytes()
    if native != source:
        raise SystemExit('Current wow_model.wgsl differs from the target shader bytes')
    return dict(source=source_path, file_offset=hex(start), end_exclusive=hex(end),
                bytes=len(native), line_endings='LF', source_equals_embedded=True,
                sha256=hashlib.sha256(native).hexdigest())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare', action='store_true')
    args = parser.parse_args()
    binary = TARGET.read_bytes()
    if hashlib.sha256(binary).hexdigest() != SHA:
        raise SystemExit('EXE differs from the authoritative 0.97.2 target')
    inventory = load_script('inventory', ROOT/'scripts/inventory-executable.py')
    pe = inventory.PE(binary)
    functions = {pe.image_base+a:pe.image_base+z for a,z,_ in pe.functions()}
    runtime = ROOT/'runtime/hero-preview-0.97.2'
    runtime.mkdir(exist_ok=True)
    evidence = ROOT/'docs/analysis/evidence/0.97.2'
    records = []
    for start, role in FUNCTIONS.items():
        end = functions[start]
        offset = pe.rva_offset(start-pe.image_base)
        payload = binary[offset:offset+end-start]
        stem = f'{start:x}'
        if args.prepare:
            (runtime/f'{stem}.bin').write_bytes(payload)
            plan = dict(target=f'runtime/hero-preview-0.97.2/{stem}.bin',
                        output=f'runtime/hero-preview-0.97.2/rea-{stem}',
                        open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(start)),
                        timeout=240,open_timeout=60,
                        operations=[dict(name='analyze_function',arguments=dict(procedure=hex(start)))])
            (runtime/f'plan-{stem}.json').write_text(portable_json(plan,indent=2)+'\n')
            assembly = objdump_output(['objdump','-d','--no-show-raw-insn',
                        f'--start-address={start:#x}',f'--stop-address={end:#x}',str(TARGET)],text=True)
            (runtime/f'{stem}.asm').write_text(assembly)
        assembly = runtime/f'{stem}.asm'
        if assembly.exists():
            (evidence/f'hero-preview-0.97.2-{stem}.asm').write_text(assembly.read_text())
        record = dict(address=hex(start),end_exclusive=hex(end),file_offset=hex(offset),
                      byte_count=len(payload),sha256=hashlib.sha256(payload).hexdigest(),role=role)
        bundle = runtime/f'rea-{stem}'/'evidence-bundle.json'
        if bundle.exists():
            r = next(r for r in json.loads(bundle.read_text())['records'] if r['operation']=='analyze_function')
            record['rea_evidence_id'] = r['evidence_id']
            (runtime/f'{stem}.c').write_text(r['raw_result']['value']['pseudocode'])
        records.append(record)
    def raw_at(address, length):
        offset = pe.rva_offset(address-pe.image_base)
        return binary[offset:offset+length]
    yaw_type = raw_at(0x1458f9ba8, 16)
    if yaw_type != raw_at(0x14594f2e0, 16) or yaw_type != raw_at(0x14594f4c0, 16):
        raise SystemExit('Yaw resource TypeID chain differs')
    if raw_at(0x145ab1160, 16) != raw_at(0x1459f8200, 16):
        raise SystemExit('GxAspect resource TypeID chain differs')
    report = dict(date='2026-10-18',target_version='0.97.2',target_sha256=SHA,
                  target_executed=False,functions=records,
                  plugin=dict(name_address='0x1458f616f',name_getter='0x1400430b0',
                              vtable_name_slot='0x1458ee860',vtable_build_slot='0x1458ee840',
                              system_vtable='0x145a0b5d0'),
                  shared_request=dict(bytes=164,tag=0,items=4,item_count=19,item_stride=8,
                                      appearance=156,appearance_order=['race','sex','skin','face','hair_style','hair_color','facial_hair'],
                                      request_global='0x14799fa98',yaw_global='0x14799fb3c',
                                      aspect_global='0x14799fb40',physical_size_global='0x14799fa88',
                                      physical_size_cap_each_axis=2048,zero_size_preserved=True),
                  publisher=dict(address='0x1403a29f0',aux_tag_at_d=1,aux_first_byte=0,
                                 pages=['Picker','armory tab 0 (Character)'],
                                 picker_yaw=0.35,picker_yaw_literal='0x1458eb508',
                                 picker_aspect='logical width/max(logical height,1)',
                                 armory_aspect='100/122',armory_aspect_literal='0x14594f374',
                                 physical_size='round(node dimension * transform column length)',
                                 ranged_cleared_if='main hand or off hand ID is nonzero'),
                  framing=dict(authored_camera='raw cameras[1]',fallback_aim='MD20 header bounding-box center',
                               fallback_eye_wow=[200/36,0,87/36],fallback_fov=0.5,
                               fallback_near=1/36,fallback_far=5000,
                               projection='infinite reverse RH; fovy=fov/sqrt(aspect^2+1)',
                               projection_update='no-op; retains logical aspect',
                               root_scale_authored=1,
                               root_scale_fallback='sqrt((25/9)/(display_aspect^2+1))',
                               display_aspect_producer='0x1408757e0',
                               display_aspect_resource_type_id_address='0x145ab1160',
                               display_aspect_resource_type_id_bytes=raw_at(0x145ab1160, 16).hex(),
                               display_aspect_default=4/3,
                               display_aspect_default_write='0x14085e86e',
                               display_aspect_default_type_id_descriptor='0x1459f8200',
                               display_aspect='primary Window logical width/height; keep previous if height<=0 or difference<=0.0001'),
                  character_light=dict(setup='0x1408242e0',model_constructor='0x1418c5210',
                                       ambient=[0.7,0.7,0.7],diffuse=[0.8,0.8,0.64],
                                       sun_travel_bevy=[-1,0,0],prop_probe=False,
                                       row19_w_dial=0.4,row19_literal='0x145933ce0',
                                       material_lane_binding='14079da50 passes lane0 to1407db730; preserves source entity selector and fog'),
                  rotation=dict(yaw_resource_type_id_address='0x1458f9ba8',
                                yaw_resource_type_id_bytes=yaw_type.hex(),
                                publisher_registration='0x1403ab340 slot +0x278',
                                input_system='0x1403a24c0',drag_radians_per_logical_pixel=0.012,
                                drag_literal='0x14594f370',
                                drag='held hero-pane Interaction::Pressed; cursor physicalX/Window scale; first held frame records X, subsequent frames add (X-previousX)*0.012; reset previous X otherwise',
                                buttons='while Interaction::Pressed, yaw += per-node signed speed * Time.delta_secs',
                                left_radians_per_second=-2.4,right_radians_per_second=2.4,
                                turn_speed_writes=['0x14023e650','0x14023e665'],
                                turn_path_table='0x14593fb10',
                                initial_character_yaw=0.61,initial_yaw_write='0x140399d5e',
                                initial_yaw_type_id_descriptor='0x14594f4c0'),
                  baseline=baseline_outfits(binary, pe),
                  wow_model_shader=shader_match(binary),
                  validation=dict(builds='not run',
                                  compiler_checks='not run',
                                  tests='not run',
                                  runtime='not run'))
    (evidence/'hero-preview-0.97.2.json').write_text(portable_json(report,indent=2)+'\n')
    print(f'Recorded {len(records)} hero-preview slices; prepared={args.prepare}.')


if __name__ == '__main__':
    main()
