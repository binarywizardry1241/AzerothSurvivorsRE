#!/usr/bin/env python3
"""Check selected 0.112.5 menu-scene instruction and composition contracts; no compilation or app launch."""
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

EVIDENCE = ROOT / 'docs/analysis/evidence/0.112.5/menu-zone-background'
EXPECTED_SHA = '445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare-rea', action='store_true')
    args = parser.parse_args()
    target = latest_target()
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    assert target['sha256'] == manifest['target_sha256'] == EXPECTED_SHA
    data = target_bytes(target)
    module = load_script('menu_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def native(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    for row in manifest['functions']:
        raw = native(int(row['address'], 16), row['byte_count'])
        assert hashlib.sha256(raw).hexdigest() == row['sha256'], row['name']
        for key in ['assembly', 'pseudocode']:
            if key in row:
                assert hashlib.sha256((ROOT / row[key]).read_bytes()).hexdigest() == row[key + '_sha256']
    if args.prepare_rea:
        destination = ROOT / 'runtime/menu-zone-background-0.112.5/reproduce'
        for row in manifest['functions']:
            address = int(row['address'], 16)
            end = int(row['end_exclusive'], 16)
            assert end is not None, row['name']
            folder = destination / row['name']
            folder.mkdir(parents=True, exist_ok=True)
            carrier = folder / 'owner.bin'
            carrier.write_bytes(native(address, end - address))
            plan = dict(target=str(carrier.relative_to(ROOT)), output=str((folder / 'rea').relative_to(ROOT)),
                        open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(address)),
                        timeout=240, operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(address)))])
            (folder / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
        print(f"Prepared {len(manifest['functions'])} project-local REA plans; target never launched.")
        return

    sys.path[:0] = [str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'),
                   str(ROOT / 'runtime/armory-recovery/python-libs')]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_MEM_UNMAPPED, UC_HOOK_CODE
    from unicorn import x86_const as reg
    cases = []

    def cpu():
        machine = Uc(UC_ARCH_X86, UC_MODE_64)
        machine.mem_map(0x20000000, 0x10000)
        machine.mem_map(0x30000000, 0x10000)

        def missing(machine, access, address, size, value, unused):
            page = address & ~4095
            assert pe.image_base <= page < pe.image_base + max(section['rva'] + section['virtual_size'] for section in pe.sections), hex(address)
            try:
                payload = native(page, 4096)
            except ValueError:
                payload = bytes(4096)  # The selected PE's uninitialized writable data.
            machine.mem_map(page, 4096)
            machine.mem_write(page, payload.ljust(4096, b'\0'))
            return True
        machine.hook_add(UC_HOOK_MEM_UNMAPPED, missing)
        return machine

    def write(machine, address, payload):
        try:
            machine.mem_write(address, payload)
        except Exception:
            page = address & ~4095
            machine.mem_map(page, 4096)
            machine.mem_write(page, native(page, 4096).ljust(4096, b'\0'))
            machine.mem_write(address, payload)

    def call(machine, address):
        machine.reg_write(reg.UC_X86_REG_RSP, 0x20008000)
        machine.mem_write(0x20008000, struct.pack('<Q', 0x2000f000))
        machine.emu_start(address, 0x2000f000, count=2000)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == 0x2000f000

    profiles = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/menu-background-0.97.2.json').read_text())['profiles']
    fields = ['radius', 'eye_height', 'phase', 'amplitude', 'period', 'target_radius', 'target_height', 'radius_wave', 'clearance']
    for index, profile in enumerate(profiles):
        machine = cpu()
        raw = native(0x146c08760 + index * 240, 240)
        pointer, length = struct.unpack_from('<QQ', raw, 8)
        assert native(pointer, length).decode() == profile['key']
        assert struct.unpack_from('<I', raw, 0xc0)[0] == profile['map_id']
        assert index == profile['zone_index']
        machine.mem_write(0x30000000, raw)
        machine.reg_write(reg.UC_X86_REG_RCX, 0x30001000)
        machine.reg_write(reg.UC_X86_REG_RDX, 0x30000000)
        call(machine, 0x1458d0ed0)
        actual = list(struct.unpack('<12f', machine.mem_read(0x30001000, 48)))
        expected = profile['center'] + [profile[key] for key in fields]
        assert actual == expected, profile['key']
        cases.append(dict(contract='orbit-profile', zone=profile['key'], values=actual))

    def f32(value):
        return struct.unpack('<f', struct.pack('<f', value))[0]

    def xmm(machine, register, value):
        machine.reg_write(register, int.from_bytes(struct.pack('<f', value), 'little'))

    for profile in profiles:
        for seconds in [0., 1., 31.25, -3.]:
            machine = cpu()
            frame = 0x30008000
            values = profile['center'] + [profile[key] for key in fields]
            machine.mem_write(frame - 0x50, struct.pack('<12f', *values))
            machine.reg_write(reg.UC_X86_REG_RBP, frame)
            machine.reg_write(reg.UC_X86_REG_RSP, 0x20008000)
            machine.reg_write(reg.UC_X86_REG_RBX, profile['map_id'])
            machine.reg_write(reg.UC_X86_REG_R14, profile['zone_index'])
            xmm(machine, reg.UC_X86_REG_XMM6, seconds)

            def trig(machine, address, size, unused):
                if address in [0x145c1d52b, 0x145c1d555]:
                    value = struct.unpack('<f', machine.reg_read(reg.UC_X86_REG_XMM0).to_bytes(16, 'little')[:4])[0]
                    xmm(machine, reg.UC_X86_REG_XMM0, f32((math.sin if address == 0x145c1d52b else math.cos)(value)))
                    stack = machine.reg_read(reg.UC_X86_REG_RSP)
                    target_address = struct.unpack('<Q', machine.mem_read(stack, 8))[0]
                    machine.reg_write(reg.UC_X86_REG_RSP, stack + 8)
                    machine.reg_write(reg.UC_X86_REG_RIP, target_address)
            machine.hook_add(UC_HOOK_CODE, trig)
            machine.emu_start(0x1400f4442, 0x1400f4537, count=500)
            actual = struct.unpack('<III7f', machine.mem_read(frame - 0x50, 40))
            phase = f32(f32(seconds * f32(math.tau)) / profile['period'])
            wave = f32(math.sin(phase))
            angle = f32(profile['phase'] + (f32(wave * profile['amplitude']) if profile['amplitude'] < f32(math.tau) else phase))
            sine, cosine = f32(math.sin(angle)), f32(math.cos(angle))
            radius = f32(profile['radius'] + f32(wave * profile['radius_wave']))
            target_radius = f32(profile['radius'] * profile['target_radius'])
            x, y, z = profile['center']
            expected = [f32(x + f32(radius * cosine)), f32(y + f32(radius * sine)), f32(z + profile['eye_height']),
                        f32(x - f32(target_radius * cosine)), f32(y - f32(target_radius * sine)), f32(z + profile['target_height']), profile['clearance']]
            assert actual[:3] == (1, profile['map_id'], profile['zone_index'])
            assert all(abs(a - b) <= 0.0001 for a, b in zip(actual[3:], expected)), (profile['key'], actual, expected)
            cases.append(dict(contract='orbit-request', zone=profile['key'], seconds=seconds, payload=list(actual)))

    # Whole native stabilization owner, with valid local Res wrappers. Mutex poison
    # and thread-panicking lanes are neutralized explicitly; no ECS scheduler runs.
    machine = cpu()
    write(machine, 0x1480be9e8, struct.pack('<Q', 0x30000000))
    write(machine, 0x148078160, bytes(0x34))
    write(machine, 0x148078164, struct.pack('<III', 1, 0, 3))
    machine.mem_write(0x30000100, struct.pack('<Q', 0x30000200))
    machine.mem_write(0x30000200, b'\x01')
    machine.mem_write(0x30000300, struct.pack('<Q', 0x30000400))
    machine.mem_write(0x30000310, struct.pack('<Q', 0x30000500))
    machine.mem_write(0x3000031c, struct.pack('<I', 123))
    machine.mem_write(0x30000600, struct.pack('<Q', 0x30000700))
    machine.mem_write(0x3000073c, b'\x01\x01')
    machine.mem_write(0x30000800, struct.pack('<IIII', 2, 0, 0, 0))

    def stabilize(label):
        machine.reg_write(reg.UC_X86_REG_RDX, 0x30000100)
        machine.reg_write(reg.UC_X86_REG_R8, 0x30000300)
        machine.reg_write(reg.UC_X86_REG_R9, 0x30000600)
        machine.mem_write(0x20008028, struct.pack('<Q', 0x30000800))
        call(machine, 0x14085d590)
        frames = struct.unpack('<I', machine.mem_read(0x3000080c, 4))[0]
        active, ready = machine.mem_read(0x14807818d, 2)
        cases.append(dict(contract='scene-stabilization', case=label, frames=frames, active=active, ready=ready))
        return frames, active, ready

    for frame in range(21):
        actual = stabilize(f'unchanged-{frame}')
        assert actual == (frame, int(frame >= 3), int(frame >= 18))
    # Once ready, dirty loader fields do not clear the readiness latch.
    machine.mem_write(0x30000710, struct.pack('<Q', 1))
    assert stabilize('latched-dirty-loader')[2] == 1
    for label, offset, payload in [('map-changed', 0x148078168, struct.pack('<I', 1)),
                                   ('zone-changed', 0x14807816c, struct.pack('<I', 4))]:
        write(machine, offset, payload)
        assert stabilize(label) == (0, 0, 0)
    # Every independent pending/ready input must block a fresh latch.
    for name, offset, payload in [('colliders', 0x10, struct.pack('<Q', 1)),
                                  ('merge', 0x18, struct.pack('<Q', 1)),
                                  ('gx', 0x28, struct.pack('<Q', 1)),
                                  ('focus', 0x3c, b'\0'), ('scene', 0x3d, b'\0')]:
        machine.mem_write(0x30000700, bytes(0x40))
        machine.mem_write(0x3000073c, b'\x01\x01')
        machine.mem_write(0x30000700 + offset, payload)
        machine.mem_write(0x3000080c, struct.pack('<I', 17))
        write(machine, 0x14807818e, b'\0')
        assert stabilize('blocked-' + name) == (18, 1, 0)
    machine.mem_write(0x30000700, bytes(0x40))
    machine.mem_write(0x3000073c, b'\x01\x01')
    machine.mem_write(0x30000720, struct.pack('<Q', 999))
    machine.mem_write(0x3000080c, struct.pack('<I', 0xffffffff))
    write(machine, 0x14807818e, b'\0')
    assert stabilize('saturating-placements-ignored') == (0xffffffff, 1, 1)
    write(machine, 0x148078164, bytes(4))
    assert stabilize('request-removed')[1:] == (0, 0)

    # Replay the camera-admission predicate, including the inlined menu mutex/read.
    # Stop before the ECS camera iteration; these cases establish native inputs,
    # not a renderer or Bevy scheduling result.
    for state in range(3):
        for covered in range(2):
            for frames in range(5):
                for active in range(2):
                    for masked in range(2):
                        machine = cpu()
                        write(machine, 0x1480be9e8, struct.pack('<Q', 0x30000000))
                        write(machine, 0x148078160, bytes(0x34))
                        write(machine, 0x14807818c, bytes([masked, active]))
                        for wrapper, value in [(0x100, 0x200), (0x300, 0x400), (0x500, 0x600)]:
                            machine.mem_write(0x30000000 + wrapper, struct.pack('<Q', 0x30000000 + value))
                        machine.mem_write(0x30000200, bytes([state]))
                        machine.mem_write(0x30000448, bytes([covered]))
                        machine.mem_write(0x30000600, struct.pack('<I', frames))
                        machine.reg_write(reg.UC_X86_REG_RDX, 0x30000100)
                        machine.reg_write(reg.UC_X86_REG_R8, 0x30000300)
                        machine.reg_write(reg.UC_X86_REG_R9, 0x30000500)
                        machine.reg_write(reg.UC_X86_REG_RSP, 0x20008000)
                        machine.mem_write(0x20008028, struct.pack('<Q', 0x30000700))
                        machine.emu_start(0x140881470, 0x14088151d, count=1000)
                        assert machine.reg_read(reg.UC_X86_REG_RIP) == 0x14088151d
                        actual = machine.reg_read(reg.UC_X86_REG_RBP) & 255
                        expected = int(((state == 2 or covered) and frames not in (1, 2))
                                       or (active and not masked))
                        assert actual == expected, (state, covered, frames, active, masked)
                        cases.append(dict(contract='camera-admission', state=state, covered=covered,
                                          cover_frames=frames, active=active, masked=masked, result=actual))

    # Exact fade arithmetic through the cover/picture alpha registers. UI queries
    # after this boundary are deliberately excluded.
    for ready in (False, True):
        for enabled in (False, True):
            for fade in (0., .25, 1.):
                for delta in (0., .016, 1.4):
                    machine = cpu()
                    machine.reg_write(reg.UC_X86_REG_RBP, 0x30008000)
                    machine.reg_write(reg.UC_X86_REG_R12, 0x30000200)
                    machine.mem_write(0x30000218, struct.pack('<fB', fade, enabled))
                    machine.mem_write(0x30008040, struct.pack('<Q', 0x30000100))
                    machine.mem_write(0x30008030, struct.pack('<I', 123))
                    xmm(machine, reg.UC_X86_REG_XMM0, delta)
                    machine.emu_start(0x1400f4561 if ready else 0x1400f45a0, 0x1400f45fb, count=100)
                    assert machine.reg_read(reg.UC_X86_REG_RIP) == 0x1400f45fb
                    actual_fade = struct.unpack('<f', machine.mem_read(0x30000218, 4))[0]
                    expected_fade = min(f32(fade + f32(f32(delta) / f32(1.4))), 1.) if ready else max(f32(fade + f32(f32(delta) / f32(-.35))), 0.)
                    alpha = f32(1. - f32(f32(3. - f32(expected_fade + expected_fade)) * f32(expected_fade * expected_fade)))
                    cover = struct.unpack('<f', machine.reg_read(reg.UC_X86_REG_XMM6).to_bytes(16, 'little')[:4])[0]
                    picture = struct.unpack('<f', machine.reg_read(reg.UC_X86_REG_XMM7).to_bytes(16, 'little')[:4])[0]
                    assert (actual_fade, cover, picture) == (expected_fade, alpha, alpha if enabled else 0.)
                    cases.append(dict(contract='cover-fade', ready=ready, enabled=enabled, fade=fade,
                                      delta=delta, result=actual_fade, cover=cover, picture=picture))

    # Trace the actual source integration. Native replay cannot execute a Bevy
    # schedule; the authored ECS regression separately exercises the phase edge.
    compositor = (ROOT / 'crates/azeroth-survivors-re/src/menu_compositor.rs').read_text()
    backdrop = (ROOT / 'crates/benilla-app/src/world_backdrop.rs').read_text()
    assert 'gate.after(LocalPlayerSet::CameraGate).after(MenuSceneSet::Ready)' in compositor
    assert '.add_systems(PostUpdate, claim_backdrop)' in backdrop
    assert '(track_render_size, retarget_world_camera).chain()' in backdrop
    assert '(track_render_size, retarget_world_camera, claim_backdrop)' not in backdrop
    assert 'the_registered_backdrop_claim_reads_the_final_menu_camera_gate' in backdrop
    background = (ROOT / 'crates/azeroth-survivors-re/src/background.rs').read_text()
    assert 'same && scene.request.is_some() && scene.ready' in background
    assert 'profile.request((time.elapsed_secs() - scene.started) * speed)' in background
    assert 'scene.selected' in background and 'scene.fade <= 0.0' in background
    scene = (ROOT / 'crates/azeroth-survivors-re/src/menu_scene.rs').read_text()
    assert '*focus = ViewFocus::camera()' in scene
    assert 'runtime.stabilization.resolve(progress.as_deref())' in scene
    assert 'menu.ready = runtime.presentable()' in scene
    assert '*camera = pose' in scene

    output = ROOT / 'runtime/menu-zone-background-0.112.5/native-cases.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(dict(target_sha256=target['sha256'], native_cases=cases,
                                     limitations=manifest['limitations']), indent=2) + '\n')
    print(f"PASS {len(cases)} native scene cases; {len(manifest['functions'])} hash-bound owner ranges; source composition trace. No compilation or game launch.")


if __name__ == '__main__':
    main()
