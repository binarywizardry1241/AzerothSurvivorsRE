#!/usr/bin/env python3
"""Replay the selected target's real Options number/gamma formatting, without Rust/game execution.

Only allocation/free and CRT memory routines use explicit scratch-host seams.
The original formatting, decimal conversion and parsing instructions run unchanged.
--collect stages a compact manifest/vectors under ignored runtime; --check replays
them and traces the live pointer/device and definition-refresh consumers.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
RETAINED = ROOT / 'docs/analysis/evidence/0.109.0/options-values'
STAGED = ROOT / 'runtime/analysis/staging/native-evidence/0.109.0/options-values'
RANGES = {
    'number': (0x14001c700, 0x14001c927),
    'dispatch': (0x14001d920, 0x14001de88),
    'format': (0x145bcce30, 0x145bccfcc),
    'format-write': (0x145bcd630, 0x145bcd696),
    'format-specification': (0x145bcde00, 0x145bce230),
    'string-writer': (0x145bd0cc0, 0x145bd0eb8),
    'formatter-state': (0x145bd22b0, 0x145bd24ef),
    'padding': (0x145bd24f0, 0x145bd2751),
    'decimal-buffer': (0x145bd4930, 0x145bd4ae8),
    'decimal-emission': (0x145bd5a90, 0x145bd5c09),
    'float-parsing': (0x145bd6bf0, 0x145bd70b9),
    'fixed-decimal': (0x145bd70f0, 0x145bd7524),
    'binary-decimal': (0x145bd7ba0, 0x145bd8b16),
    'decimal-rounding': (0x145bd9e10, 0x145bda2ab),
    'decimal-multiplication': (0x145bda770, 0x145bda8fa),
    'parse-f32': (0x145bdb8d0, 0x145bdbd93),
    'float-display': (0x145bddaf0, 0x145bddbd1),
    'float-formatter-leaf': (0x145bddbe0, 0x145bddc19),
    'grow-buffer': (0x145d99130, 0x145d991a3),
    'reserve-buffer': (0x145d99210, 0x145d992a1),
}
LATCHED = {'gxVSync': 0x145ffe140, 'gxWindow': 0x145ffe198}


def encoded(value):
    return json.dumps(value, ensure_ascii=False, indent=2) + '\n'


def replay(data, pe):
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    machine.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section['rva'],
                          data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(heap, 0x800000)
    machine.mem_map(stack, 0x200000)
    machine.mem_map(done, 4096)
    cursor = heap + 0x1000
    instructions = set()

    def get(name):
        return machine.reg_read(getattr(r, 'UC_X86_REG_' + name))

    def q(address):
        return struct.unpack('<Q', machine.mem_read(address, 8))[0]

    def put(address, *values):
        machine.mem_write(address, struct.pack('<' + 'Q' * len(values), *values))

    def allocate(count):
        nonlocal cursor
        assert 0 <= count < 0x100000
        address = cursor
        cursor += (count + 31) & ~15
        assert cursor < heap + 0x800000
        return address

    def ret(value=None):
        if value is not None:
            machine.reg_write(r.UC_X86_REG_RAX, value)
        sp = get('RSP')
        machine.reg_write(r.UC_X86_REG_RIP, q(sp))
        machine.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(_, pc, size, __):
        if pc in (done, 0x140728070):
            machine.emu_stop()
            return
        if pc in (0x140002200, 0x1400021d0):
            ret()
        elif pc == 0x1400021c0:
            ret(allocate(get('RCX')))
        elif pc == 0x1400021e0:
            old, old_size, new_size = get('RCX'), get('RDX'), get('R9')
            address = allocate(new_size)
            machine.mem_write(address, bytes(machine.mem_read(old, min(old_size, new_size))))
            ret(address)
        elif pc == 0x145bfa0db:
            address, value, count = get('RCX'), get('RDX'), get('R8')
            machine.mem_write(address, bytes([value & 255]) * count)
            ret(address)
        elif pc == 0x145bfa0e7:
            address, source, count = get('RCX'), get('RDX'), get('R8')
            machine.mem_write(address, bytes(machine.mem_read(source, count)))
            ret(address)
        elif pc == 0x145bfa0e1:
            left, right, count = get('RCX'), get('RDX'), get('R8')
            ret(int(bytes(machine.mem_read(left, count)) != bytes(machine.mem_read(right, count))))
        elif any(start <= pc < end for start, end in RANGES.values()):
            instructions.add(pc)
        else:
            raise AssertionError(f'Unreviewed native instruction/callee {pc:#x}')

    machine.hook_add(UC_HOOK_CODE, hook)

    def reset():
        nonlocal cursor
        cursor = heap + 0x1000
        sp = stack + 0x180000 - 8
        put(sp, done)
        put(heap, 0, 0, 0)
        machine.reg_write(r.UC_X86_REG_RSP, sp)

    numbers = []
    for value in [0., -0., 1., -1., .35, .35000002, .0049, .005, .0051,
                  .0149, .015, .0151, -.0049, -.005, -.0051, .00001,
                  .0001, .9999, 1.005, 1.125, 2.675, 1234.56789,
                  float('inf'), -float('inf'), float('nan')]:
        bits = struct.pack('<f', value)
        reset()
        machine.reg_write(r.UC_X86_REG_RCX, heap)
        machine.reg_write(r.UC_X86_REG_XMM1, int.from_bytes(bits, 'little'))
        machine.emu_start(0x14001c700, done, count=1000000)
        assert get('RIP') == done
        result = bytes(machine.mem_read(q(heap + 8), q(heap + 16))).decode()
        numbers.append(dict(input_f32_bits=bits.hex(), output=result))
    rows = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/options.json').read_text())['rows']
    gamma = next(index for index, row in enumerate(rows) if row['storage'] == 3)
    brightness = []
    for value in ['0', '1', '0.36', '0.3333333', '-0', '', 'garbage', 'NaN', 'inf', '-inf']:
        reset()
        raw = value.encode()
        machine.mem_write(heap + 0x100, raw or b'\0')
        for name, number in [('RCX', 0), ('RDX', gamma), ('R8', heap + 0x100), ('R9', len(raw))]:
            machine.reg_write(getattr(r, 'UC_X86_REG_' + name), number)
        machine.emu_start(0x14001d920, done, count=1000000)
        assert get('RIP') == 0x140728070
        assert bytes(machine.mem_read(get('RDX'), get('R8'))) == b'gamma'
        result = bytes(machine.mem_read(get('R9'), q(get('RSP') + 0x28))).decode()
        brightness.append(dict(displayed=value, stored=result))
    return dict(target_sha256=SHA, number=numbers, brightness=brightness,
                native_instruction_addresses_exercised=len(instructions),
                seams=['Scratch allocation/reallocation/free, memcpy, memset and equality-only memcmp.',
                       'The normal Rust format/parse/round/decimal conversion instructions execute unchanged.',
                       'Gamma stops at its first CVar-set call; no registry, VM, filesystem, UI or game executes.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--collect', action='store_true')
    mode.add_argument('--check', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=False)
    assert target['version'] == '0.109.0' and target['sha256'] == SHA
    data = target_bytes(target)
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    ranges = {}
    for name, (start, end) in RANGES.items():
        offset = pe.rva_offset(start - pe.image_base)
        ranges[name] = dict(start=hex(start), end_exclusive=hex(end),
                            byte_count=end - start,
                            sha256=hashlib.sha256(data[offset:offset + end - start]).hexdigest())
    registered = {}
    for name, address in LATCHED.items():
        offset = pe.rva_offset(address - pe.image_base)
        row = data[offset:offset + 88]
        pointer, length = struct.unpack_from('<QQ', row, 40)
        at = pe.rva_offset(pointer - pe.image_base)
        assert data[at:at + length].decode() == name and row[80] == 1
        registered[name] = dict(address=hex(address), byte_count=88,
                                latched=True, sha256=hashlib.sha256(row).hexdigest())
    vectors = replay(data, pe)
    source = (ROOT / 'crates/azeroth-survivors-re/src/options.rs').read_text()
    for required in ['format!("{value:.2}")', 'if text == "-0"',
                     'format!("{:.6}", 1.0 - value.parse::<f32>().unwrap_or(0.0))',
                     'state.set(row, slider_string(row, value));',
                     'self.definitions_pending = true;',
                     'state.open && (!state.last_open || state.definitions_pending)']:
        assert required in source, required
    assert source.count('slider_string(row, value)') == 2
    apply_window = source[source.index('fn apply_window('):source.index('\nfn label(')]
    assert apply_window.index('if state.engine_connected') < apply_window.index('windows.single_mut()')
    if args.check:
        manifest = json.loads((RETAINED / 'manifest.json').read_text())
        assert manifest['target_sha256'] == SHA and manifest['native_ranges'] == ranges
        assert manifest['latched_registry_records'] == registered
        assert json.loads((RETAINED / 'native-vectors.json').read_text()) == vectors
        for row in manifest['extracts']:
            assert hashlib.sha256((RETAINED / row['path']).read_bytes()).hexdigest() == row['sha256']
        print('Verified 25 native number-format and 10 native brightness cases, live pointer/device '
              'consumers and batched definitions refresh; no compilation or game')
        return
    STAGED.mkdir(parents=True, exist_ok=True)
    assembly = (ROOT / 'runtime/analysis/history/interface/menu-lifecycle/969b671942c0/14001c700/native.asm').read_text()
    assembly = ('\n'.join(line.rstrip() for line in assembly.splitlines()) + '\n').encode()
    (STAGED / 'number-format.asm').write_bytes(assembly)
    response = json.loads((ROOT / 'runtime/analysis/history/interface/menu-lifecycle/969b671942c0/14001c700/rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
    manifest = dict(target_sha256=SHA, native_ranges=ranges,
                    latched_registry_records=registered,
                    extracts=[dict(path='number-format.asm', sha256=hashlib.sha256(assembly).hexdigest())],
                    ghidra=dict(evidence_id=response['evidence_id'],
                                analysis_profile_digest=response['analysis_profile']['digest'],
                                raw_range_sha256=ranges['number']['sha256']),
                    canonical_dispatch='docs/analysis/evidence/0.109.0/options/write.asm',
                    limits=vectors['seams'] + ['Source tracing and native fixtures do not execute Rust or establish runtime/parity.'])
    (STAGED / 'manifest.json').write_text(encoded(manifest))
    (STAGED / 'native-vectors.json').write_text(encoded(vectors))
    print('Staged reviewed Options value evidence:', STAGED.relative_to(ROOT))


if __name__ == '__main__':
    main()
