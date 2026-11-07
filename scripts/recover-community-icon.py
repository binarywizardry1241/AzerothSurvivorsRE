#!/usr/bin/env python3
"""Recover the 0.92 community icon's textual alpha mask, not an executable asset."""
from portable_paths import portable_json
import hashlib
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SHA = '47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2'

def main():
    data = (ROOT / 'AzerothSurvivors/AzerothSurvivors.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    address, width, height = 0x1458e4bff, 40, 30
    offset = pe.rva_offset(address - pe.image_base)
    alpha = data[offset:offset + width * height]
    output = ROOT / 'crates/azeroth-survivors-re/assets/community-icon.json'
    output.write_text(portable_json(dict(width=width, height=height,
                                     alpha_rows=[alpha[row * width:(row + 1) * width].hex() for row in range(height)]), indent=2) + '\n')
    rgba = bytes(value for a in alpha for value in (255, 255, 255, a))
    functions = []
    for start, role in [('1401231b0', 'Creates 40×30 RGBA image at 123b30–123b7a and passes handle to 200950 at 124113'),
                        ('140101160', 'Expands alpha to RGBA(255,255,255,a), 101360–1013b7'),
                        ('140200950', 'Community button and 24×18 tinted ImageNode')]:
        bundle = ROOT / f'runtime/analysis/history/interface/menu-recovery/0558cac00653/rea-{start}/evidence-bundle.json'
        evidence = None
        if bundle.exists():
            records = json.loads(bundle.read_text())['records']
            evidence = next(record['evidence_id'] for record in records if record['operation'] == 'analyze_function')
        functions.append(dict(address='0x' + start, role=role, rea_evidence_id=evidence))
    report = dict(target_sha256=SHA, source_va=hex(address), source_file_offset=hex(offset),
                  byte_count=len(alpha), width=width, height=height,
                  alpha_sha256=hashlib.sha256(alpha).hexdigest(), rgba_sha256=hashlib.sha256(rgba).hexdigest(),
                  output=str(output.relative_to(ROOT)), output_sha256=hashlib.sha256(output.read_bytes()).hexdigest(),
                  image_creation=dict(dimension='D2 (native tag1)', format='Rgba8UnormSrgb (native tag22)',
                                      asset_usage='RENDER_WORLD (native bits2)', pixel_rule='(255,255,255,alpha)',
                                      sampler='Image.new default; no per-image sampler override at this producer'),
                  button=dict(display_width=24, display_height=18, image_tint_srgba=[0.973, 0.824, 0.416, 1.0],
                              tint_va='0x1458f3558', size_va='0x1458f3070', width='Auto', height='Auto',
                              padding_horizontal=14, padding_vertical=8, border=1, radius=4,
                              frame_helper='0x1400a1200', shadow_srgba=[0, 0, 0, 0.85],
                              shadow_offset=[0, 2], shadow_spread=0, shadow_blur=6,
                              action_tag=11, url='https://discord.gg/UzxaZuSAk'),
                  native_functions=functions,
                  validation=['Original static alpha bytes expand to 4800 RGBA bytes by recovered code.',
                              'Source image helper reconstructs the same bytes; integrated rendering and OS URL dispatch remain separate checks.',
                              'No external URL was opened during this recovery.'])
    (ROOT / 'docs/analysis/evidence/0.92/community-icon-native.json').write_text(portable_json(report, indent=2) + '\n')
    print(f'Recovered {width}x{height} community mask as textual alpha rows; RGBA SHA-256 {hashlib.sha256(rgba).hexdigest()}')

if __name__ == '__main__':
    main()
