#!/usr/bin/env python3
"""Check selected stock roster ordering, level projection and zone data statically.

Unicorn replays only reviewed original instructions. String cloning is an
explicit metadata-copy seam; allocations, gear conversion and the game do not
execute. Outputs stay beneath runtime/.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
RANGES = {
    'iterator': (0x1459a8ac0, 0x1459a8d39,
                 '413e64a37d8326b810bc0dd4eb6fa151778af8938bcbfb19f90c085d79fd8c06'),
    'collector': (0x1458df270, 0x1458df37a,
                  'e9b41fb1700a83ed3da8a7b3aadd4d1a4427e680c3a1f05fea40a5ea92b74b58'),
    'projection': (0x1459b45c0, 0x1459b47d6,
                   '87d45998d52f99e14ad561e7602dffa73966fdcc8200917e9ba010d591e0654f'),
    'wire-zeroes': (0x1458b604f, 0x1458b6220,
                    'f28675a7a1e3c3d0380428dee5d96f929342c6229b61a844be22d034587a321c'),
}


def local(path):
    result = (ROOT / path).resolve()
    if not result.is_relative_to(ROOT):
        raise ValueError('Path must remain inside this checkout')
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--python-libs', type=Path,
                        default=Path('runtime/armory-recovery/python-libs'))
    parser.add_argument('--output', type=Path,
                        default=Path('runtime/stock-roster-iterator-0.105.0/vectors.json'))
    args = parser.parse_args()
    output = local(args.output)
    if not output.is_relative_to(ROOT / 'runtime'):
        raise ValueError('Generated output must stay in runtime/')
    sys.path.insert(0, str(local(args.python_libs)))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg

    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    data = (ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    pe = module.PE(data)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        result = data[offset:offset + size]
        assert len(result) == size
        return result

    for start, end, digest in RANGES.values():
        assert hashlib.sha256(raw(start, end - start)).hexdigest() == digest
    for address in (0x1458b607f, 0x1458b60d1, 0x1458b6169, 0x1458b61b5):
        assert raw(address, 7) == bytes.fromhex('c7041000000000')
    assert raw(0x1458b611b, 4) == bytes.fromhex('c6043000')
    assert raw(0x1458b620d, 8) == bytes.fromhex('43c7042e00000000')

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + s['raw_size'] for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section['rva'],
                          data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    scratch, size = 0x200000000, 0x20000
    machine.mem_map(scratch, size)
    bp, sp = scratch + 0x1000, scratch + 0x1f000
    source, destination, context = scratch + 0x5000, scratch + 0x9000, scratch + 0xd000
    execution = {}

    def on_code(_, address, length, unused):
        if address == execution['end']:
            machine.emu_stop()
            return
        assert execution['start'] <= address < address + length <= execution['end']
        instruction = bytes(machine.mem_read(address, length))
        assert instruction == raw(address, length)
        if address in (0x1459a8c4b, 0x1458df2ee):
            assert instruction[0] == 0xe8 and length == 5
            assert address + 5 + struct.unpack_from('<i', instruction, 1)[0] == 0x145b9c990
            to, row = (machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
                       for name in ('RCX', 'RDX'))
            assert scratch <= to <= to + 24 <= scratch + size
            assert scratch <= row <= row + 56 <= scratch + size
            machine.mem_write(to, bytes(machine.mem_read(row, 24)))
            machine.reg_write(reg.UC_X86_REG_RIP, address + length)
        elif instruction[0] == 0xe8:
            raise AssertionError(f'Unreviewed native call {address:#x}')

    def on_write(_, access, address, length, value, unused):
        assert scratch <= address < address + length <= scratch + size

    machine.hook_add(UC_HOOK_CODE, on_code)
    machine.hook_add(UC_HOOK_MEM_WRITE, on_write)

    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack(fmt, *values))

    def setreg(name, value):
        machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)

    def reset():
        machine.mem_write(scratch, bytes(size))
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'R8', 'R9',
                     'R10', 'R11', 'R12', 'R13', 'R14', 'R15'):
            setreg(name, 0)
        setreg('RBP', bp)
        setreg('RSP', sp)
        setreg('EFLAGS', 2)

    def run(start, end):
        execution.update(start=start, end=end)
        machine.emu_start(start, 0, count=4096)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == end

    vectors = []
    # Parent iterator optional head: presence is independent of the row contents.
    # Remaining rows then use the complete native collecting loop.
    rows = [bytes((n * 61 + i) % 256 for i in range(56)) for n in range(3)]
    for tag, has_head, count in [(0, False, 0), (0, False, 1), (0, False, 3),
                                 (1, False, 0), (1, False, 3), (1, True, 0),
                                 (1, True, 1), (1, True, 3)]:
        reset()
        head = source + 0x1000
        machine.mem_write(head, rows[2])
        machine.mem_write(source, b''.join(rows[:count]))
        put(context + 8, '<Q', head if has_head else 0)
        setreg('RBX', context)
        setreg('R13', tag)
        setreg('R14', destination)
        run(0x1459a8c28, 0x1459a8cab)
        copied_head = int(bool(tag and has_head))
        assert machine.reg_read(reg.UC_X86_REG_RSI) == copied_head
        # Complete collecting loop takes pointers to output count and storage.
        put(context, '<QQQ', context + 0x100, copied_head, destination)
        setreg('RCX', source)
        setreg('RDX', source + count * 56)
        setreg('R8', context)
        setreg('RSP', sp)
        run(0x1458df270, 0x1458df379)
        expected = ([rows[2]] if copied_head else []) + rows[:count]
        actual_count = struct.unpack('<Q', machine.mem_read(context + 0x100, 8))[0]
        assert actual_count == len(expected)
        assert bytes(machine.mem_read(destination, actual_count * 56)) == b''.join(expected)
        vectors.append(dict(kind='native-order', optional_tag=tag, optional_present=has_head,
                            saved_rows=count, output_rows=actual_count))
    for level in (0, 1, 2, 59, 60, 61, 255, 0xffffffff):
        reset()
        setreg('RSI', source + 0x33)
        put(source + 0x20, '<I', level)
        run(0x1459b46ad, 0x1459b46c5)
        result = machine.reg_read(reg.UC_X86_REG_RBX)
        assert result == max(1, min(level, 60))
        vectors.append(dict(kind='display-level', saved=level, projected=result))

    # Reuse the existing current-target zone catalog rather than creating a
    # competing copy of the twelve native descriptors.
    zones = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/addon-zones-0.105.0.json').read_text())
    entries = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/run-entry-0.100.1.json').read_text())['zones']
    for index, zone in enumerate(zones):
        address = 0x146ba9450 + index * 0xf0
        key_ptr, key_length = struct.unpack('<QQ', raw(address + 8, 16))
        assert raw(key_ptr, key_length).decode() == zone['key']
        map_id, area_id = struct.unpack('<II', raw(address + 0xc0, 8))
        assert (map_id, area_id) == (zone['map_id'], zone['area_id'])
        entry = next(row for row in entries if row['key'] == zone['key'])
        spawn = list(struct.unpack('<3f', raw(address + 0xc8, 12)))
        assert entry['map_id'] == map_id and entry['spawn'] == spawn
        vectors.append(dict(kind='zone-descriptor', key=zone['key'], map=map_id, area=area_id, spawn=spawn))
    assert len(zones) == 12
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(dict(target_sha256=SHA, vectors=vectors,
        limits=['String deep cloning is a declared metadata-copy seam.',
                'Gear conversion, allocations, source compilation and game execution are not checked.']),
        indent=2) + '\n')
    print(f'{len(vectors)} bounded stock roster/level/zone vectors passed')


if __name__ == '__main__':
    main()
