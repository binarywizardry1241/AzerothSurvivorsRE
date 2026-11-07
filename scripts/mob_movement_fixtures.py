#!/usr/bin/env python3
"""Recover bounded mob movement publication; never launch or compile the game.

Output is staged under runtime for review. --rea also decompiles the current
actor and packet owners through the project REA/Ghidra wrapper. Unicorn runs
unchanged PE instructions with explicit terrain/allocation/serialization seams.
"""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
OUT = ROOT / 'runtime/analysis/history/movement/mob-movement/6110c639e18c'
DISPATCH = (0x1454de15b, 0x1454de2a1)
PACKET = (0x14545b540, 0x14545b7dd)
# Explicit version-bound ABI for the shared instruction harness. Later targets
# supply a separately recovered profile; no address is relocated implicitly.
NATIVE_PROFILE = dict(
    dispatch=DISPATCH, packet=PACKET, stop_after_move=0x1454de250,
    height_query=0x14552a140, facing_packet=0x14545b080,
    guid_writer=0x14551c6a0, point_writer=0x14550db10,
    buffer_grow=0x1457744b0, upper_bound=0x14590752c,
    terrain_offset=0x898, serial_offset=0x958, target_offset=0x3e8,
)


def save(path, value):
    path.write_text(json.dumps(value, indent=2, allow_nan=False) + '\n')




def fixtures(pe, data, profile=NATIVE_PROFILE, *, execute_facing=False, prepare=None):
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s['rva'], data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    mem, stack = 0x200000000, 0x300000000
    u.mem_map(mem, 0x20000)
    u.mem_map(stack, 0x10000)
    read, write = u.reg_read, u.reg_write
    context = {}
    dispatch, packet = profile['dispatch'], profile['packet']

    def put(a, fmt, *v):
        u.mem_write(a, struct.pack(fmt, *v))

    def get(a, fmt):
        return struct.unpack(fmt, u.mem_read(a, struct.calcsize(fmt)))

    def ret():
        sp = read(r.UC_X86_REG_RSP)
        write(r.UC_X86_REG_RIP, get(sp, '<Q')[0])
        write(r.UC_X86_REG_RSP, sp + 8)

    def append(buffer, payload):
        cap, ptr, length = get(buffer, '<QQQ')
        assert length + len(payload) < 1024
        u.mem_write(ptr + length, payload)
        put(buffer + 16, '<Q', length + len(payload))

    def hook(_, address, size, unused):
        if address in (profile['stop_after_move'], dispatch[1]):
            u.emu_stop()
            return
        if execute_facing and profile['facing_packet'] <= address < profile['facing_packet_end']:
            if address == profile['facing_packet']:
                context.update(mode='face', position=list(get(read(r.UC_X86_REG_R8), '<3f')),
                               serial=read(r.UC_X86_REG_R9), target=get(read(r.UC_X86_REG_RSP) + 40, '<Q')[0])
            return
        if dispatch[0] <= address < dispatch[1] or packet[0] <= address < packet[1]:
            if address == packet[0]:
                context['mode'] = 'move'
                context['from'] = list(get(read(r.UC_X86_REG_R8), '<3f'))
                context['to'] = list(get(read(r.UC_X86_REG_R9), '<3f'))
            return
        if address == profile['height_query']:
            height = context['heights'][context['queries']]
            context['queries'] += 1
            write(r.UC_X86_REG_RAX, int(height is not None))
            write(r.UC_X86_REG_XMM0, struct.unpack('<I', struct.pack('<f', height or 0.))[0])
        elif address == profile['facing_packet']:
            context.update(mode='face', position=list(get(read(r.UC_X86_REG_R8), '<3f')),
                           serial=read(r.UC_X86_REG_R9), target=get(read(r.UC_X86_REG_RSP) + 40, '<Q')[0])
        elif address == 0x140002200:
            pass
        elif address == 0x1400021c0:
            write(r.UC_X86_REG_RAX, mem + 0x10000)
        elif address == profile['guid_writer']:
            guid = read(r.UC_X86_REG_RCX).to_bytes(8, 'little')
            append(read(r.UC_X86_REG_RDX), bytes([sum(1 << i for i, b in enumerate(guid) if b)]) + bytes(b for b in guid if b))
        elif address == profile['point_writer']:
            out, source, point = (read(v) for v in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
            u.mem_write(out, bytes(u.mem_read(source, 32)))
            append(out, bytes(u.mem_read(point, 12)))
        elif address == profile['buffer_grow']:
            put(read(r.UC_X86_REG_RCX), '<Q', 1024)
        else:
            raise RuntimeError(f'Unreviewed native boundary {address:#x}')
        ret()

    u.hook_add(UC_HOOK_CODE, hook)
    cases = []
    duration_bits = [0, 0x80000000, 0xbf800000, 0x39800000, 0x3a83126f,
                     0x3f333333, 0x3f800000, 0x7f800000, 0x7fc00000]
    duration_bits += [struct.unpack('<I', struct.pack('<f', value))[0] for value in [4294967., 4294967.5]]
    upper_bits = struct.unpack_from('<I', data, pe.rva_offset(profile['upper_bound'] - pe.image_base))[0]
    for bits in duration_bits:
        duration = struct.unpack('<f', struct.pack('<I', bits))[0]
        for heights in [[12., 3.], [None, 3.], [12., None], [None, None]]:
            u.mem_write(mem, bytes(0x20000))
            u.mem_write(stack, bytes(0x10000))
            context.clear()
            context.update(heights=heights, queries=0)
            from_point, to_point = [1., 2., 40.], [7., 8., 50.]
            if duration <= 0:
                to_point = from_point[:]
            put(mem + 0x1000, '<Q6fI', 0xf130000258000001, *from_point, *to_point, bits)
            put(mem + profile['terrain_offset'], '<Q', mem + 0x2000)
            put(mem + profile['serial_offset'], '<I', 0xffffffff)
            put(mem + profile['target_offset'], '<Q', 1)
            bp = stack + 0x7000
            put(bp + 0x2a0, '<Q', mem)
            for register, value in [(r.UC_X86_REG_RAX, mem + 0x1000), (r.UC_X86_REG_RBP, bp),
                    (r.UC_X86_REG_RSP, stack + 0x6000), (r.UC_X86_REG_R14, mem + 0x5000),
                    (r.UC_X86_REG_R12, bp - 24), (r.UC_X86_REG_XMM9, 0),
                    (r.UC_X86_REG_XMM13, upper_bits)]:
                write(register, value)
            # A later target supplies its independently recovered caller ABI.
            # Default historical setup remains unchanged; no RVA is inferred.
            if prepare is not None:
                prepare(u, r, mem, stack, bp, bits, upper_bits)
            u.emu_start(dispatch[0], 0, count=10000)
            assert context['mode'] == ('face' if duration <= 0 else 'move')
            row = dict(duration_bits=bits, from_point=from_point, to_point=to_point,
                       heights=heights, mode=context['mode'], height_queries=context['queries'])
            if context['mode'] == 'move':
                cap, ptr, length, opcode = get(mem + 0x5000, '<QQQH')
                body = bytes(u.mem_read(ptr, length))
                guid_length = 1 + body[0].bit_count()
                serial, move_type, flags, milliseconds, count = struct.unpack_from('<IBIII', body, guid_length + 12)
                assert (opcode, serial, move_type, flags, count) == (0xdd, 0, 0, 0x100, 1)
                assert milliseconds >= 1 and context['queries'] == 2
                assert context['from'] == from_point[:2] + [heights[0] if heights[0] is not None else from_point[2]]
                assert context['to'] == to_point[:2] + [heights[1] if heights[1] is not None else to_point[2]]
                assert list(struct.unpack_from('<3f', body, guid_length)) == context['from']
                assert list(struct.unpack_from('<3f', body, len(body) - 12)) == context['to']
                row.update(expected_from=context['from'], expected_to=context['to'],
                           duration_ms=milliseconds, serial=serial, flags=flags)
            else:
                assert context['serial'] == 0 and context['target'] == 1 and context['queries'] == 0
                if execute_facing:
                    cap, ptr, length, opcode = get(mem + 0x5000, '<QQQH')
                    body = bytes(u.mem_read(ptr, length))
                    head = 1 + body[0].bit_count()
                    serial, move_type, target, flags, milliseconds, count = struct.unpack_from('<IBQIII', body, head + 12)
                    assert (opcode, serial, move_type, target, flags, milliseconds, count) == (0xdd, 0, 3, 1, 0x100, 1, 1)
                    assert list(struct.unpack_from('<3f', body, head)) == from_point
                    assert list(struct.unpack_from('<3f', body, len(body) - 12)) == from_point
                    row.update(source_guid=0xf130000258000001, target_guid=target,
                               serial=serial, flags=flags, duration_ms=milliseconds,
                               packet_hex=body.hex())
            cases.append(row)
    return cases
