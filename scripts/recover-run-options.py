#!/usr/bin/env python3
"""Recover SHA-bound 0.92 Run Options constants and bounded native instructions."""
from portable_paths import objdump_output, portable_json
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parent.parent
EXPECTED = '47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2'
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors.exe'
OUTPUT = ROOT / 'docs/analysis/evidence/run-options'


def main():
    data = TARGET.read_bytes()
    digest = hashlib.sha256(data).hexdigest()
    if digest != EXPECTED:
        raise SystemExit('Selected 0.92 target SHA-256 mismatch')
    spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    constants = []
    for label, va, count in [
        ('canvas_design', 0x1458f3400, 2),
        ('percent_offset', 0x1466da400, 4),
        ('percent_divisor', 0x1465e23d0, 4),
        ('density_health_weights', 0x1466da410, 4),
        ('damage_speed_weights', 0x1466da420, 4),
        ('base_reward', 0x1458a8420, 1), ('reward_cap', 0x1458a82d0, 1),
        ('gold_color_tag_rgba', 0x1458f3558, 5),
        ('muted_color_tag_rgba', 0x1458f359c, 5),
        ('increased_difficulty_color_tag_rgba', 0x1458f35b8, 5),
        ('heading_color_tag_rgba', 0x1458f35cc, 5),
        ('increased_reward_color_tag_rgba', 0x1458f37a0, 5),
        ('body_color_tag_rgba', 0x1458f3a74, 5),
    ]:
        offset = pe.rva_offset(va - pe.image_base)
        payload = data[offset:offset + count * 4]
        constants.append(dict(label=label, va=hex(va), file_offset=hex(offset),
                              bytes_hex=payload.hex(), f32=list(struct.unpack('<' + 'f' * count, payload))))
    OUTPUT.mkdir(parents=True, exist_ok=True)
    instructions = []
    for label, start, end in [
        ('reward_uncapped_and_capped', 0x145424750, 0x145424898),
        ('canvas_constructor', 0x140223fb0, 0x140224275),
        ('row_wrapper', 0x1400136a0, 0x140013914),
        ('row_value', 0x140225d00, 0x140225f7e),
    ]:
        text = objdump_output(['objdump', '-d', '--no-show-raw-insn',
            f'--start-address={start:#x}', f'--stop-address={end:#x}', str(TARGET.relative_to(ROOT))],
            cwd=ROOT, text=True)
        path = OUTPUT / f'{label}.asm'
        path.write_text(text)
        instructions.append(dict(path=str(path.relative_to(ROOT)), start_va=hex(start),
                                 end_va_exclusive=hex(end), sha256=hashlib.sha256(text.encode()).hexdigest()))
    report = dict(date='2026-10-16', target=str(TARGET.relative_to(ROOT)), sha256=digest,
        byte_count=len(data), constants=constants, instructions=instructions,
        lea_candidate_correction='The adjacent one-byte key c at1458f5402 precedes Run Options at1458f5403. References to c in talent renderers are not Run Options references.',
        limitations=['Static extraction does not execute the target.',
                     'Color records include the Color::Srgba discriminant before four f32 channels.',
                     'See run-options-0.92-recovery.md for manually checked consumers, REA evidence and runtime scope.'])
    (OUTPUT / 'constants.json').write_text(portable_json(report, indent=2) + '\n')
    print(f'Recovered {len(constants)} constant groups and {len(instructions)} bounded instruction extracts')


if __name__ == '__main__':
    main()
