#!/usr/bin/env python3
"""Verify current boss aiming with original instructions and synthetic seams.

No compiler, reconstructed application, game, client or server is run.
"""
from portable_paths import portable_json
import argparse
import hashlib
import itertools
import json
import math
from pathlib import Path
import platform
import re
import struct
import subprocess
import sys

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

PROOF = ROOT / 'docs/analysis/evidence/0.121.0/boss-prediction/manifest.json'


def shared_root():
    marker = ROOT / '.git'
    if marker.is_file():
        directory = Path(marker.read_text().strip().removeprefix('gitdir: '))
        return (directory / (directory / 'commondir').read_text().strip()).resolve().parent
    return ROOT


def sha(value):
    return hashlib.sha256(value).hexdigest()


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def verify(proof, image, pe):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof['native_ranges'] + proof['native_data']:
        address = int(row['virtual_address'], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = image[offset:offset + row['byte_count']]
        assert hex(offset) == row['file_offset']
        assert sha(raw) == row['sha256'] and raw.hex() == row['bytes_hex']
        if 'assembly' in row:
            instructions = list(decoder.disasm(raw, address))
            assert sum(x.size for x in instructions) == len(raw)
            assert len(instructions) == row['instruction_count']
            text = ''.join(f'{x.address:016x} {x.bytes.hex():<30} {x.mnemonic} {x.op_str}'.rstrip() + '\n'
                           for x in instructions)
            assert (ROOT / row['assembly']).read_text() == text
    for query in proof['queries']:
        raw = json.loads((shared_root() / query['result']['path']).read_text())
        native = raw.get('structuredContent') or json.loads(raw['content'][0]['text'])
        assert sha(native['normalized_result'].encode()) == query['normalized_text_sha256']
        verify_native_query_subject(shared_root(), native, query, proof['target'], image=image, pe=pe)


def source_connections(image, pe):
    source = lambda path: (ROOT / 'crates/azeroth-survivors-re/src' / path).read_text()
    compact = lambda text: re.sub(r'\s+', '', text)
    zones = re.findall(r'key: "([^"]+)",\s*name: "[^"]+",\s*center: \[([^\]]+)\],\s*radius: f32::from_bits\((0x[0-9a-f]+)\)', source('enemies/catalog.rs'))
    assert len(zones) == 12
    for index, (key, center, radius) in enumerate(zones):
        offset = pe.rva_offset(0x146fbe250 - pe.image_base) + index * 240
        pointer, count = struct.unpack_from('<QQ', image, offset + 8)
        at = pe.rva_offset(pointer - pe.image_base)
        assert image[at:at + count].decode() == key
        center = [int(value, 16) for value in re.findall(r'0x[0-9a-f]+', center)]
        assert struct.unpack_from('<3I', image, offset + 0xc8) == tuple(center)
        assert struct.unpack_from('<I', image, offset + 0xd8)[0] == int(radius, 16)
    dispatch = compact(source('bosses/abilities.rs'))
    assert 'context.player=port.raid_aim(context,windup);' in dispatch
    assert dispatch.index('context.player=port.raid_aim') < dispatch.index('ifsuper::raid_sequences::dispatch_sequence')
    local = compact(source('gameplay/mod.rs'))
    assert local.index('record_boss_movement_flags(report.flags)') < local.index('letadmission=session.recovery.admit(')
    assert 'record_boss_movement_report(Position::from(point),report.facing,report.flags)' in local
    remote = compact(source('gameplay/coop_commands.rs'))
    assert remote.index('record_boss_movement_flags(info.flags)') < remote.index('letadmission=motion.recovery.admit(')
    assert remote.index('Admission::Ignored=>continue') < remote.index('record_boss_movement_report(Position::from(point),info.orientation,info.flags)')
    private = compact(source('gameplay/mechanics/coop.rs'))
    for suffix in ('report', 'flags'):
        assert f'std::mem::swap(&mutself.boss_aim_{suffix},&mutgame.boss_state.aim_{suffix});' in private
    adapter = compact(source('gameplay/mechanics/bosses.rs'))
    assert 'self.rules.heroic_rank' in adapter
    assert 'self.bosses.iter().any(|row|row.guid==context.source_guid)' in adapter
    assert 'record_boss_movement_report' in adapter and 'accepted_at:self.clock' in adapter
    return dict(source_zone_bindings=12, live_input_and_dispatch_connections='pass')


def replay(image, pe):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    base = 0x70000000
    machine.mem_map(base, 0x20000)
    game, actor, world, output, stack, stop = base, base + 0x2000, base + 0x3000, base + 0x4000, base + 0x1f008, base + 0x1fff0
    mapped = set()
    state = {}
    def demand(uc, _access, address, _size, _value, _user):
        page = address & ~4095
        assert page >= pe.image_base
        if page not in mapped:
            offset = pe.rva_offset(page - pe.image_base)
            uc.mem_map(page, 4096)
            uc.mem_write(page, image[offset:offset + 4096])
            mapped.add(page)
        return True
    machine.hook_add(UC_HOOK_MEM_UNMAPPED, demand)
    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack('<' + fmt, *values))
    def get(address, fmt):
        return struct.unpack('<' + fmt, machine.mem_read(address, struct.calcsize('<' + fmt)))
    def xf(index):
        return struct.unpack('<f', machine.reg_read(getattr(reg, 'UC_X86_REG_XMM' + str(index))).to_bytes(16, 'little')[:4])[0]
    def result(value):
        machine.reg_write(reg.UC_X86_REG_XMM0, struct.unpack('<I', struct.pack('<f', f32(value)))[0])
    def ret(value=None):
        if value is not None:
            machine.reg_write(reg.UC_X86_REG_RAX, value)
        pointer = machine.reg_read(reg.UC_X86_REG_RSP)
        machine.reg_write(reg.UC_X86_REG_RIP, get(pointer, 'Q')[0])
        machine.reg_write(reg.UC_X86_REG_RSP, pointer + 8)
    def height(x, y):
        return f32(f32(f32(x * 0.02) + f32(y * 0.03)) + 5.0)
    def hook(_uc, address, _size, _user):
        state['instructions'] += 1
        if state.get('speed_test') and address == 0x145bf78fa:
            state['speed'] = get(base + 0x8000 + 0x17c, 'f')[0]
            machine.emu_stop()
        elif address == stop:
            machine.emu_stop()
        elif address == 0x145b90b60:
            state['height_calls'] += 1
            result(height(xf(1), xf(2)))
            ret(int(state['height_available']))
        elif address == 0x145b8afe0:
            state['ray_calls'] += 1
            result(state['fraction'])
            ret()
        elif address == 0x145a9c190:
            ret(state['zone'])
        elif address in (0x145febc6f, 0x145febc69, 0x145febc57, 0x145febc4b):
            x, y = xf(0), xf(1)
            value = math.atan2(x, y) if address == 0x145febc6f else math.cos(x) if address == 0x145febc69 else math.sin(x) if address == 0x145febc57 else math.hypot(x, y)
            result(value)
            ret()
        else:
            assert 0x145bf22a0 <= address < 0x145bf29b6 or state.get('speed_test') and 0x145bf29c0 <= address < 0x145bf825a, hex(address)
    machine.hook_add(UC_HOOK_CODE, hook)
    def model(position, facing, flags, speed, rank, lag, windup, primary, zone, collider, fraction, terrain):
        x, y, z = position
        initial_z = height(x, y) if terrain else z
        if not primary:
            return (x, y, initial_z)
        forward = bool(flags & 1) - bool(flags & 2)
        strafe = bool(flags & 4) - bool(flags & 8)
        vx = vy = 0.0
        if not flags & 0x1000 and (forward or strafe):
            velocity = 2.5 if flags & 0x100 else 4.5 if not strafe and forward < 0 else speed if speed > 1.0 else 1.0
            angle = f32(facing + f32(math.atan2(strafe, forward)))
            vx, vy = f32(f32(math.cos(angle)) * velocity), f32(f32(math.sin(angle)) * velocity)
        def clip(a, b):
            if not collider or fraction >= 1.0:
                return b
            dx, dy = f32(b[0] - a[0]), f32(b[1] - a[1])
            length = f32(math.sqrt(f32(f32(dy * dy) + f32(dx * dx))))
            length = length if length > 0.5 else 0.5
            t = f32(fraction - f32(0.5 / length))
            t = t if t > 0.0 else 0.0
            return (f32(f32(dx * t) + a[0]), f32(f32(dy * t) + a[1]), f32(f32(f32(b[2] - a[2]) * t) + a[2]))
        offset = pe.rva_offset(0x146fbe250 - pe.image_base) + zone * 240
        cx, cy = struct.unpack_from('<ff', image, offset + 0xc8)
        radius = f32(struct.unpack_from('<f', image, offset + 0xd8)[0] - 4.0)
        def clamp(p):
            dx, dy = f32(p[0] - cx), f32(p[1] - cy)
            length = f32(math.hypot(dx, dy))
            if not 0.01 > length and not radius >= length:
                return (f32(f32(f32(dx / length) * radius) + cx), f32(f32(f32(dy / length) * radius) + cy), p[2])
            return p
        t = min(max(lag, 0.0), 1.0)
        p = clip((x, y, initial_z), (f32(f32(t * vx) + x), f32(f32(t * vy) + y), z))
        p = clamp(p)
        p = (p[0], p[1], height(p[0], p[1]) if terrain else p[2])
        seconds = f32(f32(f32(rank * f32(0.1)) + f32(0.15)) * f32(windup * f32(1.0 if rank == 0 else 0.85)))
        dx, dy = f32(vx * seconds), f32(vy * seconds)
        length = f32(math.hypot(dx, dy))
        if f32(0.05) > length:
            return p
        if length > 9.0:
            scale = f32(9.0 / length)
            dx, dy = f32(dx * scale), f32(dy * scale)
        p = clamp(clip(p, (f32(p[0] + dx), f32(p[1] + dy), p[2])))
        return (p[0], p[1], height(p[0], p[1]) if terrain else p[2])
    cases = 0
    total = 0
    flags = list(range(16)) + [0x101, 0x102, 0x104, 0x105, 0x10f, 0x1001, 0x100f]
    for rank, flag, mode in itertools.product(range(6), flags, range(8)):
        zone = mode % 2
        offset = pe.rva_offset(0x146fbe250 - pe.image_base) + zone * 240
        cx, cy = struct.unpack_from('<ff', image, offset + 0xc8)
        position = (f32(cx + (0.0 if mode < 6 else 170.0)), f32(cy + 4.0), 11.0)
        facing, speed, lag, windup = f32(0.3 * mode), f32([0.5, 7.0, 21.0][mode % 3]), f32([-1.0, 0.0, 0.4, 2.0][mode % 4]), f32([0.0, 0.01, 1.6, 30.0][mode % 4])
        primary, collider, fraction, terrain = mode != 4, mode != 3, f32([0.0, 0.4, 1.0][mode % 3]), mode != 5
        machine.mem_write(base, bytes(0x20000))
        state.clear()
        state.update(instructions=0, height_calls=0, ray_calls=0, height_available=terrain, fraction=fraction, zone=zone)
        put(game + 0xbb8, 'Q', world)
        put(game + 0x5b8, 'Q', actor)
        put(game + 0x5c0, 'Q', 1)
        put(actor + 0x18, 'q', 0 if primary else -1)
        put(world + 0x40, 'q', 0 if collider else -1)
        put(game + 0x520, '4f', *position, facing)
        put(game + 0x5a4, 'f', speed)
        put(game + 0xc74, 'f', 100.0)
        put(game + 0xcec, 'f', f32(100.0 - lag))
        put(game + 0xce8, 'I', flag)
        put(game + 0x36f, 'B', rank)
        put(stack, 'Q', stop)
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15'):
            machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), 0)
        machine.reg_write(reg.UC_X86_REG_RSP, stack)
        machine.reg_write(reg.UC_X86_REG_RCX, output)
        machine.reg_write(reg.UC_X86_REG_RDX, game)
        machine.reg_write(reg.UC_X86_REG_R8, 0)
        machine.reg_write(reg.UC_X86_REG_XMM3, struct.unpack('<I', struct.pack('<f', windup))[0])
        machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)
        machine.emu_start(0x145bf22a0, stop, count=3000)
        actual = get(output, '3f')
        lag = f32(100.0 - f32(100.0 - lag))
        expected = model(position, facing, flag, speed, rank, lag, windup, primary, zone, collider, fraction, terrain)
        assert all(abs(a - e) <= 0.0005 for a, e in zip(actual, expected)), (rank, flag, mode, actual, expected)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
        total += state['instructions']
        cases += 1
    speeds = {**dict.fromkeys((403, 686, 2812, 5176, 7269), 20.0),
        **dict.fromkeys((133, 6353, 6789, 11366), 24.0), **dict.fromkeys((116, 10181), 28.0),
        **dict.fromkeys((75, 1978, 3044, 5116, 6917, 19434), 40.0),
        1510: 30.0, 2643: 30.0, 24275: 35.0, 3606: 19.0}
    for spell in list(speeds) + [0, 1, 99999]:
        state.clear()
        state.update(instructions=0, speed_test=True)
        put(base + 0x5000, '2I', spell, 5)
        machine.reg_write(reg.UC_X86_REG_RCX, base + 0x5000)
        machine.reg_write(reg.UC_X86_REG_RBP, base + 0x8000)
        machine.reg_write(reg.UC_X86_REG_RSP, stack)
        machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)
        machine.emu_start(0x145bf2ddd, stop, count=1000)
        assert state['speed'] == speeds.get(spell, 10.0), (spell, state['speed'])
        total += state['instructions']
    return dict(original_instruction_cases=cases, missile_speed_cases=len(speeds) + 3, original_instruction_steps=total,
                fixture_seams=['primary terrain', 'optional collision fraction', 'zone-key ordinal', 'Windows CRT float trigonometry/hypot'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    proof = json.loads(PROOF.read_text())
    selected = latest_target(verify=True)
    assert proof['target'] == {k: selected[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(selected)
    pe = load_script('prediction_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    verify(proof, image, pe)
    result = replay(image, pe)
    result.update(source_connections(image, pe))
    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin', ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    rustfmt = shared_root() / '.tools/rust' / ('1.98.1-' + host[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    for path in proof['source_paths']:
        source = (ROOT / path).read_text()
        parsed = subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'], input=source, text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, (path, parsed.stderr)
    result.update(target_sha256=selected['sha256'], native_ranges=len(proof['native_ranges']), native_data=len(proof['native_data']), retained_queries_verified=len(proof['queries']), rust_syntax_paths=len(proof['source_paths']), compilation='not_run', runtime='not_run', parity='unverified')
    if args.write:
        (PROOF.parent / 'static-check.json').write_text(portable_json(result, indent=2) + '\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
