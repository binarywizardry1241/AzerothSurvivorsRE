#!/usr/bin/env python3
"""Recover current menu compositor provenance; optional REA plans, never run the game."""
from portable_paths import portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
RUNTIME = ROOT / 'runtime/analysis/history/interface/menu-compositor/3ea950dbe91c'
FUNCTIONS = [
    (0x140fa1d50, 'scale-default', 'WOW_RENDER_SCALE parsing, finite check and 0.25..4 clamp'),
    (0x140fb77e0, '140fb77e0', 'backdrop image creation and startup render-size math'),
    (0x140fb7bd0, '140fb7bd0', 'resize comparison, image replacement and retired image removal'),
    (0x140fb87f0, '140fb87f0', 'world image retarget, built-size scale factor and mip bias'),
    (0x140fb7400, '140fb7400', 'first active world camera claim on UI FfxBackdrop'),
    (0x140fb9050, '140fb9050', 'case-insensitive renderScale CVar observer'),
    (0x140838a90, 'world-camera', 'world camera spawn and PerspectiveProjection constants'),
    (0x140a43d70, 'ui-camera', 'player UI camera spawn'),
]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare', action='store_true', help='also write project-local raw slices and static REA plans')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, 'Wrong reference EXE'
    inventory = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = inventory.PE(data)
    ends = {pe.image_base + a: pe.image_base + e for a, e, _ in pe.functions()}

    def read(va, length):
        offset = pe.rva_offset(va - pe.image_base)
        return data[offset:offset+length]

    functions = []
    for address, label, role in FUNCTIONS:
        end = ends[address]
        code = read(address, end-address)
        record = dict(address=hex(address), end_exclusive=hex(end), role=role,
                      file_offset=hex(pe.rva_offset(address-pe.image_base)), byte_count=len(code),
                      sha256=hashlib.sha256(code).hexdigest())
        # The first default-scale import used a larger slice named backdrop.
        run = 'backdrop' if label == 'scale-default' else label
        path = RUNTIME / ('rea-' + run) / '003-procedure_pseudo_code.json'
        if path.exists():
            response = json.loads(path.read_text()).get('response', {}).get('result', {})
            evidence = response.get('structuredContent', {})
            if evidence.get('operation') == 'procedure_pseudo_code':
                record['rea'] = dict(evidence_id=evidence['evidence_id'], provider=evidence['provider'],
                                     subject=evidence['subject'], procedure=evidence['parameters']['procedure'])
        functions.append(record)
        if args.prepare:
            RUNTIME.mkdir(parents=True, exist_ok=True)
            raw = RUNTIME / (label + '-exact.bin')
            raw.write_bytes(code)
            plan = dict(target=str(raw.relative_to(ROOT)), output=str((RUNTIME / ('rea-exact-' + label)).relative_to(ROOT)),
                        open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(address)),
                        timeout=240, environment={'REA_GHIDRA_STARTUP_TIMEOUT_MS': '180000'},
                        operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(address)))])
            (RUNTIME / (label + '-exact-plan.json')).write_text(portable_json(plan, indent=2)+'\n')

    shaders = []
    for name in ['crates/benilla-world/src/shaders/ffx_glow.wgsl',
                 'crates/benilla-app/src/shaders/ui_gamma.wgsl',
                 'crates/benilla-app/src/shaders/ui_node_gamma.wgsl',
                 'crates/benilla-app/src/shaders/ui_slice_gamma.wgsl']:
        source = (ROOT / name).read_bytes()
        native = source.replace(b'\r\n', b'\n').replace(b'\n', b'\r\n')
        at = data.find(native)
        assert at >= 0 and data.find(native, at+1) == -1, name
        shaders.append(dict(source=name, source_sha256=hashlib.sha256(source).hexdigest(),
                            source_bytes=len(source), native_bytes=len(native), file_offset=hex(at),
                            address=hex(pe.offset_va(at)), native_sha256=hashlib.sha256(native).hexdigest(),
                            transformation='LF to CRLF only; complete shader byte match'))
    constants = []
    for address, count, role in [(0x1459f7d40, 4, 'world projection: fov, aspect, near, far'),
                                (0x1458ed010, 1, 'minimum render scale'),
                                (0x1458eb4f8, 1, 'maximum render scale'),
                                (0x145ad6914, 1, 'render axis ceiling'),
                                (0x1458eb480, 1, 'default render scale')]:
        raw = read(address, count*4)
        constants.append(dict(address=hex(address), role=role, bytes_hex=raw.hex(),
                              f32=list(struct.unpack('<'+'f'*count, raw))))
    math_imports = []
    for address, expected in [(0x145756e1f, 'roundf'), (0x145756ec1, 'log2f')]:
        raw = read(address, 6)
        assert raw[:2] == b'\xff\x25'
        iat = address + 6 + struct.unpack_from('<i', raw, 2)[0]
        library, function = next(
            (table['library'], table['functions'][(iat-int(table['iat_start_address'], 16))//8])
            for table in pe.imports()
            if 0 <= (iat-int(table['iat_start_address'], 16))//8 < len(table['functions']))
        assert function == expected
        math_imports.append(dict(address=hex(address), bytes_hex=raw.hex(), iat=hex(iat),
                                 library=library, function=function))
    output = dict(date='2026-10-18', target_version='0.97.2', target_path=str(TARGET.relative_to(ROOT)),
                  target_sha256=SHA, target_executed=False, functions=functions, constants=constants,
                  math_imports=math_imports, shaders=shaders,
                  recovered=dict(render_scale_range=[0.25, 4.0], maximum_axis=8192,
                                 no_window_size=[1280, 720], size_rounding='CRT roundf; max1/min8192',
                                 target_scale='window_factor * built_width / physical_window_width',
                                 mip_bias='min(log2(target_scale / window_factor), 0)',
                                 world_camera=dict(fov_radians=0.7853981852531433, near=0.10000000149011612, far=3000),
                                 image='R8Unorm render-attachment-only size carrier; shared FFX reads the world view main texture',
                                 claim='first active WorldCamera, or None'),
                  implementation='menu_compositor.rs plus main.rs world assets/plugins; menu_scene.rs drives residency/camera',
                  validation=dict(static_only=True, shaders_matched=4, builds='not run', compiler_checks='not run',
                                  tests='not run', emulation='not run', original_launch='not run', rebuilt_launch='not run', parity='unverified'),
                  limitations=['REA raw slices use generic GCC ABI and omit external code/data; original Windows x64 instructions and PE constants control interpretation.',
                               'Native source names are analyst role bindings, not recovered Rust symbols.',
                               'Shared world terrain/model/lighting systems are reused; matching these shaders does not establish all shared engine code or visual parity.',
                               'Standalone ECS registration/scheduling, missing-data handling and render backend remain uncompiled and runtime-unverified.'])
    destination = ROOT / 'docs/analysis/evidence/0.97.2/menu-compositor-0.97.2.json'
    destination.write_text(portable_json(output, indent=2)+'\n')
    print(f'{destination.relative_to(ROOT)}: {len(functions)} PE spans, {len(shaders)} exact newline-converted shader matches')


if __name__ == '__main__':
    main()
