#!/usr/bin/env python3
"""QA only: copy SHA-bound embedded font data into ignored project-local runtime storage.

This is an analysis utility, not a build step or runtime requirement. Font binaries must
not be tracked. Users can instead supply compatible font data with --font-dir.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
# Byte lengths are the original native copy lengths, including final SFNT padding.
FONTS_0_92 = [
    ('AZS_NAMES_SC.TTF', 0x1458b66a8, 2368, 'AzS Names SC', False),
    ('AZS_NAMES_KR.TTF', 0x1458b6fe8, 2060, 'AzS Names KR', False),
    ('FRIZQT__.TTF', 0x1468b31de, 70856, 'Friz Quadrata TT', True),
    ('MORPHEUS.TTF', 0x1468c46b8, 101328, 'Morpheus Cyr', True),
    ('SKURRI.TTF', 0x1468dd298, 169028, 'Skurri Cyr', False),
    ('AZS_KR.TTF', 0x146906758, 498808, 'Noto Sans KR Thin', False),
    ('AZS_SC.TTF', 0x1469803d0, 1225412, 'Noto Sans SC Thin', False),
]
FONTS_0_97_2 = [
    ('AZS_NAMES_SC.TTF', 0x14593b138, 2368, 'AzS Names SC', False),
    ('AZS_NAMES_JP.TTF', 0x14593ba78, 2068, 'AzS Names JP', False),
    ('AZS_NAMES_KR.TTF', 0x14593c28c, 2060, 'AzS Names KR', False),
    ('FRIZQT__.TTF', 0x1469ae08e, 70856, 'Friz Quadrata TT', True),
    ('MORPHEUS.TTF', 0x1469bf568, 101328, 'Morpheus Cyr', True),
    ('SKURRI.TTF', 0x1469d8148, 169028, 'Skurri Cyr', False),
    ('AZS_KR.TTF', 0x146a01608, 498808, 'Noto Sans KR Thin', False),
    ('AZS_JP.TTF', 0x146a7b280, 1303236, 'Noto Sans JP Thin', False),
    ('AZS_SC.TTF', 0x146bb9544, 1225412, 'Noto Sans SC Thin', False),
]

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--target-version', choices=['0.97.2', '0.92.0'], default='0.97.2')
    args = parser.parse_args()
    current = args.target_version == '0.97.2'
    target = ROOT / ('AzerothSurvivors/AzerothSurvivors-0.97.2.exe' if current else 'AzerothSurvivors/AzerothSurvivors.exe')
    expected = ('a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589' if current
                else '47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2')
    data = target.read_bytes()
    assert hashlib.sha256(data).hexdigest() == expected, 'Reference SHA-256 mismatch'
    spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    destination = ROOT / ('runtime/analysis/history/interface/menu-fonts/464de1c5cd8f' if current else 'runtime/analysis/history/interface/menu-fonts/b488d8153517')
    destination.mkdir(parents=True, exist_ok=True)
    records = []
    for filename, address, count, family, augment in (FONTS_0_97_2 if current else FONTS_0_92):
        offset = pe.rva_offset(address - pe.image_base)
        payload = data[offset:offset + count]
        assert payload[:4] == b'\x00\x01\x00\x00'
        (destination / filename).write_bytes(payload)
        records.append(dict(filename=filename, original_virtual_address=hex(address),
                            source_file_offset=hex(offset), byte_count=count,
                            sha256=hashlib.sha256(payload).hexdigest(), family=family,
                            native_accent_augmentation=augment))
    report = ROOT / ('docs/analysis/evidence/locales-font-inputs.json' if current
                     else 'docs/analysis/evidence/menu-font-inputs.json')
    report.write_text(json.dumps(dict(target=str(target.relative_to(ROOT)), target_sha256=expected,
                                      version=args.target_version, target_executed=False,
                                      purpose='Unmodified native-copy font bytes; ignored local QA data only, never a build input.',
                                      output_directory=str(destination.relative_to(ROOT)), fonts=records), indent=2) + '\n')
    print(f'Prepared {len(records)} exact native font inputs under {destination.relative_to(ROOT)} (QA only).')

if __name__ == '__main__':
    main()
