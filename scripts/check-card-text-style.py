#!/usr/bin/env python3
"""Check current card text contracts without compiling or launching a game.

Replay the unchanged native TextSpan constructor with both handle variants and
ordinary/numeric segments. Stop before ECS spawning; font metrics/layout and
rendered parity are outside this check. Reuse the canonical card geometry test.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target

EVIDENCE = ROOT / 'docs/analysis/evidence/0.105.0/card-layout'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', default='runtime/analysis/history/interface/card-span-style/94e6bda7e138/checks.json')
    args = parser.parse_args()
    output = (ROOT / args.output).resolve()
    assert output.is_relative_to(ROOT / 'runtime')
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / 'span-fonts.json').read_text())
    assert target['sha256'] == manifest['target_sha256']
    data = (ROOT / target['path']).read_bytes()
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    for row in manifest['owners'] + manifest['fragments']:
        offset = pe.rva_offset(int(row['address'], 16) - pe.image_base)
        assert hashlib.sha256(data[offset:offset + row['byte_count']]).hexdigest() == row['sha256']
        if 'assembly' in row:
            assert hashlib.sha256((EVIDENCE / row['assembly']).read_bytes()).hexdigest() == row['assembly_sha256']
    geometry_module = load_script('geometry', ROOT / 'scripts/native_card_layout.py')
    geometry = geometry_module.verify(pe)

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(section['rva'] + section['raw_size'] for section in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        offset = section['raw_offset']
        machine.mem_write(pe.image_base + section['rva'], data[offset:offset + section['raw_size']])
    stack, inputs = 0x20000000, 0x30000000
    machine.mem_map(stack, 0x10000)
    machine.mem_map(inputs, 0x10000)

    def write(name, value): machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    def read(name): return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    def put(address, value): machine.mem_write(address, struct.pack('<Q', value))

    def guard(_, address, size, unused):
        if address == 0x1401C7587:
            # Stop at the first ECS spawn call; no host, allocator or renderer.
            machine.emu_stop()
        elif not 0x1401C73C0 <= address < 0x1401C763B:
            raise AssertionError(f'Unexpected native call outside constructor: {address:#x}')

    machine.hook_add(UC_HOOK_CODE, guard)
    cases = []
    for handle_tag in (0, 1):
        for numeric in (False, True):
            machine.mem_write(stack, bytes(0x10000))
            machine.mem_write(inputs, bytes(0x10000))
            write('RSP', stack + 0xF000)
            write('RCX', inputs)
            write('RDX', inputs + 0x100)
            font = inputs + 0x300
            put(inputs + 0x100, 1)
            put(inputs + 0x108, inputs + 0x200)
            put(inputs + 0x110, 1)
            put(inputs + 0x118, font)
            put(inputs + 0x208, inputs + 0x400)
            put(inputs + 0x210, 1)
            machine.mem_write(inputs + 0x218, bytes([numeric]))
            handle = bytearray(17)
            handle[0] = handle_tag
            handle[1:8] = b'CARD_ID' if handle_tag else bytes(7)
            struct.pack_into('<Q', handle, 8, inputs + 0x500)
            handle[16] = 1 if handle_tag else 0
            machine.mem_write(font, bytes(handle))
            put(inputs + 0x500, 1)
            machine.emu_start(0x1401C73C0, 0x1401C763B, count=1000)
            assert read('RIP') == 0x1401C7587
            bp = read('RBP')
            actual = bytes(machine.mem_read(bp + 8, 17))
            assert actual[0] == handle_tag
            assert actual[8:16] == handle[8:16]
            if handle_tag:
                assert actual == handle
            size = struct.unpack('<f', machine.mem_read(bp + 0x20, 4))[0]
            assert size == 15
            color = struct.unpack('<Iffff', machine.mem_read(bp + 0x5C, 20))
            expected = (0.302, 1.0, 0.416) if numeric else (0.949, 0.902, 0.788)
            assert color[0] == 0 and color[4] == 1
            assert all(abs(a - b) < 1e-6 for a, b in zip(color[1:4], expected))
            cases.append(dict(handle_tag=handle_tag, numeric=numeric,
                              font_size=size, supplied_font_preserved=True, rgb=list(color[1:4])))

    source = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/native_overlays.rs').read_text()
    rich = source.split('fn number_text(', 1)[1].split('pub fn numeric_spans(', 1)[0]
    assert 'font: art.font.clone()' in rich and 'font_size: 15.' in rich
    assert rich.index('font.clone()', rich.index('TextSpan::new(span)')) < rich.index('TextColor(if numeric')
    tile = source.split('fn card_tile(', 1)[1].split('fn card_annotations(', 1)[0]
    assert 'if card.lines.is_empty()' not in tile
    assert 'text(ui, art, &card.text, 14., CARD_BODY, false' in tile
    assert 'for line in &card.lines' in tile
    tooltip = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/native_overlays/tooltip.rs').read_text()
    span = tooltip.split('TextSpan::new(value)', 1)[1]
    assert span.index('line_font.clone()') < span.index('TextColor(')
    assert 'let line_font = font(15.0)' in tooltip
    result = dict(target_sha256=target['sha256'], application_executed=False,
                  geometry_cases=geometry['cases'], span_cases=cases,
                  source_connections='checked',
                  limitations=manifest['limitations'])
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2) + '\n')
    print('Card text style: 4 native geometry/font cases + 4 native span cases passed; source connections checked.')


if __name__ == '__main__':
    main()
