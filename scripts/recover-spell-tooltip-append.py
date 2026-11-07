#!/usr/bin/env python3
"""Replay selected 0.115.0 spell tooltip append instructions without an OS/game.

The base description is the explicit sentinel BASE. Native constructor append,
nonempty-group iterator, collector and cast-count word helper execute unchanged.
Only locale, String/formatting/allocation and named floor/trunc boundaries are
substituted. Unknown calls fail closed. --write updates curated vectors.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
FIXTURE = ROOT / 'docs/analysis/evidence/0.115.0/coop-spell-text/append-fixtures.json'
OWNERS = (0x1458629b0, 0x1459c1b00, 0x1459d1360, 0x14586a730)


def replay():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    pe = load_script('append_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    image_end = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (image_end + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(heap, 0x1000000)
    u.mem_map(stack, 0x20000)
    u.mem_map(stop, 4096)
    allowed = [(address, ends[address]) for address in OWNERS]
    next_heap = heap + 0x1000
    primary = 0
    calls = set()

    def reg(which):
        return u.reg_read(which)

    def q(at):
        return struct.unpack('<Q', u.mem_read(at, 8))[0]

    def wq(at, value):
        u.mem_write(at, struct.pack('<Q', value))

    def alloc(size):
        nonlocal next_heap
        at = next_heap
        next_heap += max(32, (size + 15) & ~15)
        assert next_heap < heap + 0x1000000
        return at

    def text(at, size):
        return bytes(u.mem_read(at, size)).decode()

    def pair(at):
        return text(q(at), q(at + 8))

    def outstr(at, value):
        raw = value.encode()
        ptr = alloc(max(1024, len(raw)))
        u.mem_write(ptr, raw)
        u.mem_write(at, struct.pack('<3Q', max(1024, len(raw)), ptr, len(raw)))

    def ret():
        sp = reg(UC_X86_REG_RSP)
        u.reg_write(UC_X86_REG_RIP, q(sp))
        u.reg_write(UC_X86_REG_RSP, sp + 8)

    def grow(at, minimum, unit):
        capacity, old = q(at), q(at + 8)
        capacity = max(capacity * 2, minimum, 16)
        ptr = alloc(capacity * unit)
        if q(at):
            u.mem_write(ptr, bytes(u.mem_read(old, q(at) * unit)))
        wq(at, capacity)
        wq(at + 8, ptr)

    def hook(_, address, size, _data):
        nonlocal primary
        if address == 0x1458649b7:
            u.emu_stop()
            return
        if any(a <= address < b for a, b in allowed):
            return
        rcx, rdx, r8, r9 = [reg(r) for r in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9)]
        calls.add(hex(address))
        if address == 0x14585c8e0:
            primary = rcx
            outstr(rcx, 'BASE')
        elif address in (0x140002200, 0x1400021d0):
            pass
        elif address == 0x1400021c0:
            u.reg_write(UC_X86_REG_RAX, alloc(rcx))
        elif address == 0x145d145fb:
            u.mem_write(rcx, bytes(u.mem_read(rdx, r8)))
            u.reg_write(UC_X86_REG_RAX, rcx)
        elif address == 0x145d14a10:
            grow(rcx, rdx + r8, q(reg(UC_X86_REG_RSP) + 40))
        elif address == 0x145d14e50:
            grow(rcx, q(rcx + 16) + 1, 24)
        elif address == 0x1458dff90:
            # No translation selects the unchanged embedded English template.
            u.reg_write(UC_X86_REG_RAX, 0)
            u.reg_write(UC_X86_REG_RDX, 0)
        elif address == 0x1458627d0:
            value = struct.unpack('<f', reg(UC_X86_REG_XMM1).to_bytes(16, 'little')[:4])[0]
            rendered = format(value, '.0f') if value >= struct.unpack('<f', bytes.fromhex('33331f41'))[0] else format(value, '.1f').removesuffix('.0')
            outstr(rcx, rendered)
        elif address in (0x145d14697, 0x145d14661):
            value = struct.unpack('<f', reg(UC_X86_REG_XMM0).to_bytes(16, 'little')[:4])[0]
            value = math.floor(value) if address == 0x145d14697 else math.trunc(value)
            u.reg_write(UC_X86_REG_XMM0, int.from_bytes(struct.pack('<f', value) + bytes(12), 'little'))
        elif address == 0x1458c01f0:
            separator = text(r9, q(reg(UC_X86_REG_RSP) + 40))
            outstr(rcx, separator.join(pair(rdx + index * 24 + 8) for index in range(r8)))
        elif address == 0x145ce7350:
            ptr, index, result = rdx, 0, ''
            while True:
                op = u.mem_read(ptr, 1)[0]
                ptr += 1
                if op == 0:
                    break
                if op < 0x80:
                    result += text(ptr, op)
                    ptr += op
                    continue
                precision = None
                if op in (0xc1, 0xc5):
                    ptr += 4
                    precision = 0
                    if op == 0xc5:
                        precision = struct.unpack('<H', u.mem_read(ptr, 2))[0]
                        ptr += 2
                elif op != 0xc0:
                    raise ValueError(f'Unknown format operation {op:#x}')
                at, method = q(r8 + index * 16), q(r8 + index * 16 + 8)
                index += 1
                if method == 0x145cf8100:
                    value = struct.unpack('<f', u.mem_read(at, 4))[0]
                    result += format(value, '.' + str(precision) + 'f') if precision is not None else str(value)
                elif method == 0x1400020c0:
                    result += pair(at)
                elif method == 0x1400020e0:
                    result += pair(at + 8)
                else:
                    raise ValueError(f'Unknown format method {method:#x}')
            outstr(rcx, result)
        elif address == 0x1458e0370:
            result = text(rdx, r8)
            for index in range(q(reg(UC_X86_REG_RSP) + 40)):
                at = r9 + index * 32
                key, value = pair(at), q(at + 16)
                method = q(q(at + 24) + 24)
                if method == 0x1400020c0:
                    value = pair(value)
                elif method == 0x1400020e0:
                    value = pair(value + 8)
                elif method in (0x145cf8e00, 0x145cf9cf0):
                    value = str(int.from_bytes(u.mem_read(value, 4 if method == 0x145cf8e00 else 8), 'little'))
                else:
                    raise ValueError(f'Unknown named method {method:#x}')
                result = result.replace('{' + key + '}', value)
            outstr(rcx, result)
        else:
            raise ValueError(f'Unsupported call {address:#x} from {q(reg(UC_X86_REG_RSP)):#x}')
        ret()

    u.hook_add(UC_HOOK_CODE, hook)
    # Current C5 metadata uses a u16 precision. The zero high byte is not a
    # format terminator: a following literal percent must remain in the result.
    # This directly checks the reviewed formatting boundary, separately from
    # the unchanged native constructor cases below.
    format_output, format_value, format_args = alloc(24), alloc(4), alloc(16)
    u.mem_write(format_value, struct.pack('<f', 3.125))
    u.mem_write(format_args, struct.pack('<2Q', format_value, 0x145cf8100))
    format_sp = stack + 0x1f008
    wq(format_sp, stop)
    for register, value in ((UC_X86_REG_RSP, format_sp), (UC_X86_REG_RCX, format_output), (UC_X86_REG_RDX, 0x147339cce), (UC_X86_REG_R8, format_args)):
        u.reg_write(register, value)
    hook(None, 0x145ce7350, 0, None)
    assert pair(format_output + 8) == '3.1%'
    format_boundary_cases = [dict(format_address='0x147339cce', value=3.125, expected='3.1%')]
    source = (ROOT / 'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text()
    keys = re.findall(r'key: "([^"]+)"', source.split('pub static ABILITIES:', 1)[1].split('pub static CLASSES:', 1)[0])
    assert len(keys) == 113
    cases = []
    variants = [
        dict(name='neutral', instance={}, stats={}, talents=[]),
        dict(name='modified', instance={16: 1.46, 20: .9, 24: 2, 28: 1.35, 32: 1.3, 60: 1.05, 72: 1.15}, stats={4: 1.25, 8: .8, 12: .2, 16: 1.7, 40: 1.15, 52: 1, 56: 1.25, 64: .2}, talents=['First talent', 'Second talent']),
        dict(name='fractional-extra-cast', instance={}, stats={56: .25}, talents=[]),
        dict(name='thresholds', instance={16: 1.005, 20: .995, 24: 1, 28: 1.005, 32: 1.005}, stats={4: .8, 8: .995, 40: .8, 52: 2, 56: 2., 64: .005}, talents=['Single talent']),
    ]
    for index, key in enumerate(keys):
        definition = 0x146cc4580 + index * 120
        at = pe.rva_offset(definition - pe.image_base)
        key_ptr, key_len = struct.unpack_from('<QQ', data, at)
        assert data[pe.rva_offset(key_ptr - pe.image_base):pe.rva_offset(key_ptr - pe.image_base) + key_len].decode() == key
        for variant in variants:
            for mode in range(4):
                next_heap = heap + 0x1000
                u.mem_write(stack, bytes(0x20000))
                for register in (UC_X86_REG_RAX, UC_X86_REG_RBX, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RSI, UC_X86_REG_RDI, UC_X86_REG_RBP, UC_X86_REG_R8, UC_X86_REG_R9, UC_X86_REG_R10, UC_X86_REG_R11, UC_X86_REG_R12, UC_X86_REG_R13, UC_X86_REG_R14, UC_X86_REG_R15):
                    u.reg_write(register, 0)
                u.reg_write(UC_X86_REG_EFLAGS, 2)
                u.reg_write(UC_X86_REG_MXCSR, 0x1f80)
                instance, stats, output, names = alloc(88), alloc(84), alloc(200), alloc(24)
                u.mem_write(instance, bytes(88))
                u.mem_write(stats, bytes(84))
                wq(instance, definition)
                u.mem_write(instance + 8, struct.pack('<If', 1, .5))
                instance_floats = {16: 1., 20: 1., 28: 1., 32: 1., 56: 1., 60: 1., 68: 1., 72: 1., 80: 1.}
                instance_floats.update({off: value for off, value in variant['instance'].items() if off != 24})
                for off, value in instance_floats.items():
                    u.mem_write(instance + off, struct.pack('<f', value))
                u.mem_write(instance + 24, struct.pack('<I', variant['instance'].get(24, 0)))
                stat_floats = {0: 120., 4: 1., 8: 1., 12: .05, 16: 1.5, 40: 1.}
                stat_floats.update({off: value for off, value in variant['stats'].items() if off != 52})
                for off, value in stat_floats.items():
                    u.mem_write(stats + off, struct.pack('<f', value))
                u.mem_write(stats + 52, struct.pack('<I', variant['stats'].get(52, 0)))
                values = alloc(24 * len(variant['talents']))
                for name_index, name in enumerate(variant['talents']):
                    outstr(values + 24 * name_index, name)
                u.mem_write(names, struct.pack('<3Q', len(variant['talents']), values, len(variant['talents'])))
                sp = stack + 0x1f008
                wq(sp, stop)
                wq(sp + 40, names)
                for register, value in ((UC_X86_REG_RSP, sp), (UC_X86_REG_RCX, output), (UC_X86_REG_RDX, instance), (UC_X86_REG_R8, stats), (UC_X86_REG_R9, mode)):
                    u.reg_write(register, value)
                try:
                    u.emu_start(OWNERS[0], stop, count=200000)
                except Exception as error:
                    raise RuntimeError(f'{key} {variant["name"]} mode{mode} at {reg(UC_X86_REG_RIP):#x}: {error}') from error
                assert reg(UC_X86_REG_RIP) == 0x1458649b7
                cases.append(dict(key=key, scenario=variant['name'], mode=mode, base='BASE', instance_f32=instance_floats, instance_u32={24: variant['instance'].get(24, 0)}, stats_f32=stat_floats, stats_u32={52: variant['stats'].get(52, 0)}, talents=variant['talents'], primary=pair(primary + 8)))
    functions = []
    for address in OWNERS:
        end = ends[address]
        at = pe.rva_offset(address - pe.image_base)
        functions.append(dict(start=hex(address), end_exclusive=hex(end), file_offset=hex(at), sha256=hashlib.sha256(data[at:at + end - address]).hexdigest()))
    # Durable vectors share scenario inputs and expected text. All raw cases stay
    # disposable, retaining direct per-case inputs for investigation.
    (ROOT / 'runtime/analysis/history/findings/gap102/6d5d1bb31515/append-raw-cases.json').write_text(json.dumps(cases, separators=(',', ':'), ensure_ascii=False) + '\n')
    inputs = []
    for name in variants:
        example = next(case for case in cases if case['scenario'] == name['name'])
        inputs.append({key: example[key] for key in ('scenario', 'base', 'instance_f32', 'instance_u32', 'stats_f32', 'stats_u32', 'talents')})
    expected = []
    results = []
    for key in keys:
        indices = []
        for case in (case for case in cases if case['key'] == key):
            if case['primary'] not in expected:
                expected.append(case['primary'])
            indices.append(expected.index(case['primary']))
        results.append(dict(key=key, primary_indices=indices))
    return dict(target_sha256=SHA, method=__doc__, target_executed=False, native_instruction_replay=True, functions=functions, substituted_calls=sorted(calls), format_boundary_cases=format_boundary_cases, inputs=inputs, modes=[0, 1, 2, 3], result_order='input scenario order, then mode order; primary_indices addresses expected', cases=len(cases), expected=expected, results=results, limitations=['Base description is an explicit BASE boundary and is verified by its separate current-target owner.', 'English identity locale and named formatting/allocation/math substitutions are bounded adapters; no application or rendered/localized parity.', 'Only constructor entry through0x1458649b7 executes; later optional labels and status body use their existing proof.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    actual = json.loads(json.dumps(replay()))
    if args.write:
        FIXTURE.write_text(json.dumps(actual, indent=2, ensure_ascii=False) + '\n')
    else:
        assert json.loads(FIXTURE.read_text()) == actual
    print(f'PASS: {actual["cases"]} current native spell appendix cases; no compilation or game launch')


if __name__ == '__main__':
    main()
