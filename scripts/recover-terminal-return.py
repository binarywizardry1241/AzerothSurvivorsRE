#!/usr/bin/env python3
"""Check bounded 0.105.0 terminal return instructions without building or launching.

No native callee executes. The label cases stop before localization calls; the
startup cases supply the already-returned environment result, and the frontend
cases cover only the observed niche flag and resource-field stores.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = next(p for p in Path(__file__).resolve().parents
            if (p / 'scripts/inventory-executable.py').is_file())
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'


def local(value):
    path = (ROOT / value).resolve()
    if not path.is_relative_to(ROOT):
        raise ValueError(f'Path escapes checkout: {value}')
    return path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--python-libs', type=Path,
                        default=Path('runtime/armory-recovery/python-libs'))
    parser.add_argument('--output', type=Path,
                        default=Path('runtime/terminal-return-0.105.0/native-vectors.json'))
    args = parser.parse_args()
    output = local(args.output)
    if not output.is_relative_to(ROOT / 'runtime'):
        raise ValueError('Generated output must stay beneath runtime/')
    sys.path.insert(0, str(local(args.python_libs)))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg

    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    data = (ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, 'Selected target SHA-256 mismatch'
    pe = module.PE(data)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + s['raw_size'] for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section['rva'],
                          data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    scratch, scratch_size = 0x200000000, 0x20000
    machine.mem_map(scratch, scratch_size)
    bp, frontend, reference, text = scratch + 0x1000, scratch + 0x4000, scratch + 0x5000, scratch + 0x6000
    context = {}

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        assert at is not None
        return data[at:at + size]

    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack(fmt, *values))

    def on_code(_, address, size, unused):
        if address in context['stops']:
            machine.emu_stop()
            return
        start, end = context['span']
        assert start <= address and address + size <= end, f'Unreviewed instruction {address:#x}'
        assert bytes(machine.mem_read(address, size)) == raw(address, size)

    def on_write(_, access, address, size, value, unused):
        assert scratch <= address and address + size <= scratch + scratch_size

    machine.hook_add(UC_HOOK_CODE, on_code)
    machine.hook_add(UC_HOOK_MEM_WRITE, on_write)

    def run(start, end, stops=()):
        context.update(span=(start, end), stops=set(stops) | {end})
        machine.emu_start(start, 0, count=64)
        stopped = machine.reg_read(reg.UC_X86_REG_RIP)
        assert stopped in context['stops'], f'Instruction budget exhausted at {stopped:#x}'
        return stopped

    def reset():
        machine.mem_write(scratch, bytes(scratch_size))
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'R14', 'R15'):
            machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), 0)
        machine.reg_write(reg.UC_X86_REG_RBP, bp)
        machine.reg_write(reg.UC_X86_REG_RSP, scratch + 0x1f000)
        machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)

    vectors = []
    for value, status, expected in [(b'1', -2, 1), (b'0', -2, 0), (b'01', -2, 0),
                                    (b'', -2, 0), (b'1', 0, 0), (b'1 ', -2, 0)]:
        reset()
        put(bp + 0xf0, '<Q', status & ((1 << 64) - 1))
        put(bp + 0x108, '<Q', len(value))
        put(bp + 0x100, '<Q', text)
        if value:
            machine.mem_write(text, value)
        run(0x140001779, 0x14000179f)
        actual = machine.reg_read(reg.UC_X86_REG_RAX) & 255
        assert actual == expected
        vectors.append(dict(contract='WOW_ROGUE_GLUE exact-one flag', value=value.decode(),
                            result_status=status, flag=actual))
    for mode_tag, expected in [(0x8000000000000000, 1), (0x8000000000000001, 0)]:
        reset()
        machine.reg_write(reg.UC_X86_REG_RDI, mode_tag)
        run(0x14000fbe1, 0x14000fbe7)
        actual = machine.reg_read(reg.UC_X86_REG_RBX) & 255
        assert actual == expected
        vectors.append(dict(contract='startup variant to custom-frontend flag',
                            variant_tag=hex(mode_tag), custom_frontend=actual))
    for custom in [0, 1]:
        reset()
        machine.reg_write(reg.UC_X86_REG_R15, custom)
        run(0x140040322, 0x14004034d)
        fields = list(machine.mem_read(bp + 0x8c, 2))
        assert fields == [custom, custom]
        vectors.append(dict(contract='frontend resource fields+c/+d', custom_frontend=custom,
                            fields=fields))
        reset()
        put(reference, '<Q', frontend)
        put(frontend + 0xc, '<B', custom)
        machine.reg_write(reg.UC_X86_REG_R14, reference)
        run(0x1401b1087, 0x1401b10c4, [0x1401b10a3, 0x1401b10be])
        address = machine.reg_read(reg.UC_X86_REG_RCX)
        length = machine.reg_read(reg.UC_X86_REG_RDX)
        key = raw(address, length).decode()
        assert key == ('menu.main_menu' if custom else 'menu.character_select')
        vectors.append(dict(contract='terminal return label', custom_frontend=custom, key=key))
    for action, command, destination in [(0, 6, 0x1458a4b0e), (1, 8, 0x1458a5050),
                                         (2, 9, 0x1458a5376)]:
        actual = struct.unpack('<I', raw(0x145dc19b8 + action * 4, 4))[0]
        table = 0x146bb916c
        target = table + struct.unpack('<i', raw(table + (command - 2) * 4, 4))[0]
        assert actual == command and target == destination
        vectors.append(dict(contract='terminal command and live core dispatch', action=action,
                            command=command, destination=hex(target)))
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(dict(target_sha256=SHA, vectors=vectors,
                                     limit='No native callee, Rust compilation or game execution.'),
                                 indent=2) + '\n')
    print(f'{len(vectors)} bounded terminal return vectors passed: {output.relative_to(ROOT)}')


if __name__ == '__main__':
    main()
