#!/usr/bin/env python3
"""Replay the selected target's talent-toggle watcher; no build or game launch.

The ECS world/resource tables and optional Lua String read are explicit inputs.
Only the external getter, byte comparison and deallocator are intercepted.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
START, END = 0x1401317C0, 0x140131B21
MASK = (1 << 64) - 1
RETAINED = ROOT / 'docs/analysis/evidence/0.105.0/talent-view/input-vectors.json'


def recover():
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    data = (ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, 'Selected target hash mismatch'
    pe = module.PE(data)
    assert (START - pe.image_base, END - pe.image_base) in {(a, b) for a, b, *_ in pe.functions()}
    at = pe.rva_offset(START - pe.image_base)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + size]

    fragments = []
    for role, start, finish in [
        ('toggle', b'function ToggleTalentFrame()\n\tAZS_TALENT_TOGGLES', b'AZS_TALENT_TOGGLES = "0";\n'),
        ('button-update', b'function UpdateTalentButton()\n\tTalentMicroButton:Show();\nend\n', b'function UpdateTalentButton()\n\tTalentMicroButton:Show();\nend\n'),
        ('talent-anchor', b'TalentMicroButton:ClearAllPoints();\nTalentMicroButton:SetPoint("BOTTOMLEFT", "CharacterMicroButton", "BOTTOMRIGHT", -3, 0);\n', b'TalentMicroButton:ClearAllPoints();\nTalentMicroButton:SetPoint("BOTTOMLEFT", "CharacterMicroButton", "BOTTOMRIGHT", -3, 0);\n'),
        ('map-anchor', b'WorldMapMicroButton:ClearAllPoints();\nWorldMapMicroButton:SetPoint("BOTTOMLEFT", "TalentMicroButton", "BOTTOMRIGHT", -3, 0);\n', b'WorldMapMicroButton:ClearAllPoints();\nWorldMapMicroButton:SetPoint("BOTTOMLEFT", "TalentMicroButton", "BOTTOMRIGHT", -3, 0);\n'),
    ]:
        assert data.count(start) == 1
        offset = data.index(start)
        end = data.index(finish, offset) + len(finish)
        fragment = data[offset:end]
        fragments.append(dict(role=role, file_offset=hex(offset), virtual_address=hex(pe.offset_va(offset)),
                              byte_count=len(fragment), sha256=hashlib.sha256(fragment).hexdigest(), text=fragment.decode()))

    cases = [
        ('initial-zero', True, None, '0', False, False),
        ('initial-nonzero', True, None, '7', False, False),
        ('unchanged', True, '0', '0', False, False),
        ('open', True, '0', '1', False, True),
        ('close', True, '1', '2', True, False),
        ('several-increments-one-toggle', True, '2', '4', False, True),
        ('length-change', True, '9', '10', False, True),
        ('string-change-no-number-parser', True, '1', 'x', False, True),
        ('missing-global', True, '0', None, True, True),
        ('inactive-clears-observation', False, '0', '1', False, False),
        ('inactive-does-not-toggle-open-state', False, '0', '1', True, True),
    ]
    results = []
    for name, active, previous, current, opened, expected in cases:
        u = Uc(UC_ARCH_X86, UC_MODE_64)
        size = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
        u.mem_map(pe.image_base, (size + 4095) & ~4095)
        for section in pe.sections:
            u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
        base, stack, stop = 0x200000000, 0x300000000, 0x400000000
        u.mem_map(base, 0x10000)
        u.mem_map(stack, 0x20000)
        u.mem_map(stop, 4096)
        world, ctrl, sparse, resources, game, open_ptr, prev = [base + x for x in (0, 0x1100, 0x2000, 0x2100, 0x3000, 0x4000, 0x5000)]

        def q(address):
            return struct.unpack('<Q', u.mem_read(address, 8))[0]

        def wq(address, value):
            u.mem_write(address, struct.pack('<Q', value & MASK))

        def string(address, text, destination):
            if text is None:
                wq(destination, MASK)
            else:
                value = text.encode()
                u.mem_write(address, value)
                u.mem_write(destination, struct.pack('<QQQ', len(value), address, len(value)))

        # Two real type IDs in a controlled hashbrown-style resource map. Lookup
        # and change-tick writes execute native instructions without seams.
        wq(world + 0x78, ctrl)
        wq(world + 0x80, 1)
        wq(world + 0x90, 2)
        u.mem_write(ctrl, raw(0x145D6DA70, 1) + raw(0x145D70BE0, 1) + bytes([255]) * 14)
        for index, key in enumerate((0x145D70B60, 0x145DA8D60)):
            u.mem_write(ctrl - 24 * (index + 1), raw(key, 16))
            wq(ctrl - 24 * (index + 1) + 16, index)
            wq(sparse + index * 8, MASK - index)
            wq(resources + index * 56 + 0x10, (game, open_ptr)[index])
            u.mem_write(resources + index * 56 + 0x30, b'\x01')
        wq(world + 0x210, sparse)
        wq(world + 0x218, 2)
        wq(world + 0x1E0, resources)
        u.mem_write(world + 0x5B0, struct.pack('<I', 37))
        u.mem_write(game + 0xE8, bytes([active]))
        u.mem_write(open_ptr, bytes([opened]))
        string(base + 0x6000, previous, prev)
        calls = []

        def hook(uc, address, size, context):
            if START <= address < END:
                return
            if address == stop:
                uc.emu_stop()
                return
            sp = uc.reg_read(UC_X86_REG_RSP)
            c, d, r8, r9 = [uc.reg_read(reg) for reg in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9)]
            calls.append(hex(address))
            if address == 0x14063A0A0:
                assert bytes(uc.mem_read(r8, r9)) == b'AZS_TALENT_TOGGLES'
                string(base + 0x7000, current, c)
            elif address == 0x145BC9787:
                uc.reg_write(UC_X86_REG_RAX, int(bytes(uc.mem_read(c, r8)) != bytes(uc.mem_read(d, r8))))
            elif address == 0x1400021D0:
                pass
            else:
                raise AssertionError(f'Unreviewed external call {address:#x}')
            uc.reg_write(UC_X86_REG_RIP, q(sp))
            uc.reg_write(UC_X86_REG_RSP, sp + 8)

        u.hook_add(UC_HOOK_CODE, hook)
        sp = stack + 0x1F008
        wq(sp, stop)
        u.reg_write(UC_X86_REG_RSP, sp)
        u.reg_write(UC_X86_REG_RDX, world)
        u.reg_write(UC_X86_REG_R8, prev)
        u.emu_start(START, stop, count=5000)
        assert u.reg_read(UC_X86_REG_RIP) == stop
        actual = bool(u.mem_read(open_ptr, 1)[0])
        assert actual == expected, (name, actual, expected)
        observed = None if q(prev) == MASK else bytes(u.mem_read(q(prev + 8), q(prev + 16))).decode()
        assert observed == (None if not active else (previous if current is None else current)), name
        results.append(dict(name=name, active=active, previous=previous, current=current,
                            initial_open=opened, actual_open=actual, expected_open=expected,
                            observed_counter=observed, external_calls=calls,
                            open_change_tick=struct.unpack('<I', u.mem_read(resources + 56 + 0x2C, 4))[0]))
    return dict(target_sha256=SHA, virtual_address=hex(START), end_exclusive=hex(END),
                file_offset=hex(at), byte_count=END - START,
                sha256=hashlib.sha256(data[at:at + END - START]).hexdigest(), cases=results,
                native_lua_fragments=fragments,
                method='Unmodified original-PE x86-64 instructions, including resource lookup, comparison and state/change-tick writes.',
                limitations=['Lua global getter, byte comparison and deallocation are explicit external seams.',
                             'ECS resources and counter strings are fixtures; no Lua VM, UI, game or renderer is executed.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    result = recover()
    if args.check:
        assert result == json.loads(RETAINED.read_text())
    else:
        out = ROOT / 'runtime/analysis/history/progression/talent-view/94ac5e46bada'
        out.mkdir(parents=True, exist_ok=True)
        (out / 'input-vectors.json').write_text(json.dumps(result, indent=2) + '\n')
    print(f"Verified {len(result['cases'])} native talent-view watcher cases; no build or game launch")


if __name__ == '__main__':
    main()
