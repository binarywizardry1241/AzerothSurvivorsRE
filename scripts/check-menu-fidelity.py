#!/usr/bin/env python3
"""Check selected 0.109.0 menu instruction contracts; no compilation or app launch."""
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

EVIDENCE = ROOT / 'docs/analysis/evidence/0.109.0/menu-fidelity'
EXPLICIT_ENDS = {0x1459a77c0: 0x1459a7991, 0x14361df00: 0x14361df39}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare-rea', action='store_true')
    args = parser.parse_args()
    target = latest_target()
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    assert target['sha256'] == manifest['target_sha256']
    data = target_bytes(target)
    module = load_script('menu_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}

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
        destination = ROOT / 'runtime/analysis/history/interface/menu-fidelity/7d09140bff3e/reproduce'
        for row in manifest['functions']:
            address = int(row['rea_procedure'], 16)
            end = EXPLICIT_ENDS.get(address, ends.get(address))
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

    sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
                   str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
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
        raw = native(0x146bde390 + index * 240, 240)
        pointer, length = struct.unpack_from('<QQ', raw, 8)
        assert native(pointer, length).decode() == profile['key']
        assert struct.unpack_from('<I', raw, 0xc0)[0] == profile['map_id']
        assert index == profile['zone_index']
        machine.mem_write(0x30000000, raw)
        machine.reg_write(reg.UC_X86_REG_RCX, 0x30001000)
        machine.reg_write(reg.UC_X86_REG_RDX, 0x30000000)
        call(machine, 0x1459a77c0)
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
                if address in [0x145bfa117, 0x145bfa11d]:
                    value = struct.unpack('<f', machine.reg_read(reg.UC_X86_REG_XMM0).to_bytes(16, 'little')[:4])[0]
                    xmm(machine, reg.UC_X86_REG_XMM0, f32((math.sin if address == 0x145bfa117 else math.cos)(value)))
                    stack = machine.reg_read(reg.UC_X86_REG_RSP)
                    target_address = struct.unpack('<Q', machine.mem_read(stack, 8))[0]
                    machine.reg_write(reg.UC_X86_REG_RSP, stack + 8)
                    machine.reg_write(reg.UC_X86_REG_RIP, target_address)
            machine.hook_add(UC_HOOK_CODE, trig)
            machine.emu_start(0x14007c692, 0x14007c787, count=500)
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
    write(machine, 0x14808a9e8, struct.pack('<Q', 0x30000000))
    write(machine, 0x1480441d8, bytes(0x34))
    write(machine, 0x1480441dc, struct.pack('<III', 1, 0, 3))
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
        call(machine, 0x14084ff50)
        frames = struct.unpack('<I', machine.mem_read(0x3000080c, 4))[0]
        active, ready = machine.mem_read(0x148044205, 2)
        cases.append(dict(contract='scene-stabilization', case=label, frames=frames, active=active, ready=ready))
        return frames, active, ready

    for frame in range(21):
        actual = stabilize(f'unchanged-{frame}')
        assert actual == (frame, int(frame >= 3), int(frame >= 18))
    # Once ready, dirty loader fields do not clear the readiness latch.
    machine.mem_write(0x30000710, struct.pack('<Q', 1))
    assert stabilize('latched-dirty-loader')[2] == 1
    for label, offset, payload in [('map-changed', 0x1480441e0, struct.pack('<I', 1)),
                                   ('zone-changed', 0x1480441e4, struct.pack('<I', 4))]:
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
        write(machine, 0x148044206, b'\0')
        assert stabilize('blocked-' + name) == (18, 1, 0)
    machine.mem_write(0x30000700, bytes(0x40))
    machine.mem_write(0x3000073c, b'\x01\x01')
    machine.mem_write(0x30000720, struct.pack('<Q', 999))
    machine.mem_write(0x3000080c, struct.pack('<I', 0xffffffff))
    write(machine, 0x148044206, b'\0')
    assert stabilize('saturating-placements-ignored') == (0xffffffff, 1, 1)
    write(machine, 0x1480441dc, bytes(4))
    assert stabilize('request-removed')[1:] == (0, 0)

    for state in range(4):
        for menu_active in range(2):
            for old in range(2):
                machine = cpu()
                write(machine, 0x14808a9e8, struct.pack('<Q', 0x30000000))
                write(machine, 0x1480441d8, bytes(0x34))
                write(machine, 0x148044205, bytes([menu_active]))
                machine.mem_write(0x30000100, bytes([state]))
                machine.mem_write(0x30000200, bytes([old]))
                machine.reg_write(reg.UC_X86_REG_RCX, 0x30000100)
                machine.reg_write(reg.UC_X86_REG_R15, 0x30000200)
                machine.reg_write(reg.UC_X86_REG_R14, 0x30000300)
                machine.reg_write(reg.UC_X86_REG_EBX, 123)
                machine.reg_write(reg.UC_X86_REG_RSP, 0x20008000)
                machine.emu_start(0x1409ac081, 0x1409ac0a1, count=200)
                actual = machine.mem_read(0x30000200, 1)[0]
                assert actual == int(state == 2 or menu_active)
                tick = struct.unpack('<I', machine.mem_read(0x3000032c, 4))[0]
                assert tick == (123 if actual != old else 0)
                cases.append(dict(contract='world-live', state=state, menu_active=menu_active, old=old, result=actual, changed_tick=tick))

    for cursor, touches, scale in [((10., 50.), True, 2.), (None, True, 2.),
                                   ((-1., 5.), True, 1.), ((100., 5.), True, 1.),
                                   ((5., 100.), True, 1.), ((0., 0.), True, 1.),
                                   (None, False, 1.)]:
        machine = cpu()
        window, touchmap, control = 0x30000100, 0x30001000, 0x30002000
        machine.mem_write(window, bytes(0xf8))
        if cursor is not None:
            machine.mem_write(window, struct.pack('<I', 1))
            machine.mem_write(window + 8, struct.pack('<dd', *cursor))
        machine.mem_write(window + 0xc0, struct.pack('<IIf', 100, 100, scale))
        machine.mem_write(touchmap, struct.pack('<QQQQ', control, 15, 14, int(touches)))
        machine.mem_write(control, bytes([0 if touches else 255] + [255] * 15))
        machine.mem_write(control - 8, struct.pack('<ff', 17., 73.))
        machine.reg_write(reg.UC_X86_REG_RDX, window)
        machine.reg_write(reg.UC_X86_REG_RBX, touchmap)
        machine.reg_write(reg.UC_X86_REG_RSP, 0x20008000)
        missing = []
        def stop_empty(machine, address, size, unused):
            if address == 0x140198a35:
                missing.append(True)
                machine.emu_stop()
        machine.hook_add(UC_HOOK_CODE, stop_empty)
        machine.emu_start(0x1401983c0, 0x1401984ec, count=500)
        actual = None if missing else struct.unpack('<f', machine.reg_read(reg.UC_X86_REG_XMM6).to_bytes(16, 'little')[:4])[0]
        valid = cursor is not None and 0 <= cursor[0] < 100 and 0 <= cursor[1] < 100
        expected = cursor[1] / scale if valid else 73. if touches else None
        assert actual == expected, (cursor, actual, expected)
        cases.append(dict(contract='scroll-cursor', window_cursor=cursor, active_touch=touches, scale=scale, logical_y=actual))

    # Execute the complete selected observer, Unicode trim and Rust f32 parser.
    # No parser or numeric-conversion seam: invalid suffixes must be rejected.
    scale_vectors = [
        ('renderScale', '2junk', .25), ('RENDERSCALE', ' +2.5 ', 2.5),
        ('renderscale', '\u2003+1.75\u3000', 1.75), ('renderScale', 'NaN', None),
        ('renderScale', 'inf', 4.), ('renderScale', '-inf', .25),
        ('renderScale', '0.1', .25), ('renderScale', '9', 4.),
        ('renderScale', '1.25', 1.25), ('renderScale', '', .25),
        ('renderScale', '1e0', 1.), ('renderScale', '1 2', .25),
        ('renderScaleX', '2', 1.), ('otherOption', '2', 1.),
    ]
    for name, value, expected in scale_vectors:
        machine = cpu()
        encoded = value.encode()
        machine.mem_write(0x30000100, encoded)
        machine.mem_write(0x30000200, name.encode())
        machine.mem_write(0x30000300, struct.pack('<9Q', 0, 0x30000200, len(name), 0, 0, 0, 0, 0x30000100, len(encoded)))
        machine.mem_write(0x30000408, struct.pack('<Q', 0x30000300))
        machine.mem_write(0x30000500, struct.pack('<4Q', 0x30000600, 0, 0x30000700, 0x123400000000))
        machine.mem_write(0x30000600, struct.pack('<f', 1.))
        machine.reg_write(reg.UC_X86_REG_RDX, 0x30000400)
        machine.reg_write(reg.UC_X86_REG_R8, 0x30000500)
        machine.reg_write(reg.UC_X86_REG_RSP, 0x20008008)
        machine.mem_write(0x20008008, struct.pack('<Q', 0x2000f000))
        machine.emu_start(0x140c04c60, 0x2000f000, count=100000)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == 0x2000f000
        actual = struct.unpack('<f', machine.mem_read(0x30000600, 4))[0]
        assert math.isnan(actual) if expected is None else actual == expected
        cases.append(dict(contract='render-scale-cvar', name=name, value=value,
                          result='NaN' if math.isnan(actual) else actual))
    source = (ROOT / 'crates/benilla-app/src/world_backdrop.rs').read_text()
    assert 'ev.new.trim().parse::<f32>().unwrap_or(0.0)' in source

    shaders = []
    for path in ['crates/benilla-world/src/shaders/ffx_glow.wgsl', 'crates/benilla-app/src/shaders/ui_gamma.wgsl',
                 'crates/benilla-app/src/shaders/ui_node_gamma.wgsl', 'crates/benilla-app/src/shaders/ui_slice_gamma.wgsl']:
        source = (ROOT / path).read_bytes()
        raw = source.replace(b'\r\n', b'\n').replace(b'\n', b'\r\n')
        offset = data.find(raw)
        assert offset >= 0 and data.find(raw, offset + 1) < 0, path
        shaders.append(dict(source=path, source_sha256=hashlib.sha256(source).hexdigest(),
                            native_sha256=hashlib.sha256(raw).hexdigest(), native_bytes=len(raw), file_offset=hex(offset)))
    assert native(0x145de4cf0, 17) == b'Azeroth Survivors'
    source = (ROOT / 'crates/azeroth-survivors-re/src/scrollbar.rs').read_text()
    assert '(kept_wheel, begin_drag, continue_drag, synchronize)' in source
    assert 'touches.iter().next()' in source and 'scope.enabled' not in source
    assert 'run_if(crate::update_ui::menu_input_enabled)' not in source
    assert 'menu_scene.0' in (ROOT / 'crates/benilla-app/src/client_state.rs').read_text()
    assert 'PickerBackdropRoot' in (ROOT / 'crates/azeroth-survivors-re/src/menu.rs').read_text()
    report = dict(target_sha256=target['sha256'], native_cases=cases, shaders=shaders,
                  limitations=manifest['limitations'])
    output = ROOT / 'runtime/analysis/history/interface/menu-fidelity/7d09140bff3e/native-cases.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(report, indent=2) + '\n')
    print(f"PASS {len(cases)} native menu cases; {len(shaders)} full embedded shaders; {len(manifest['functions'])} retained owner ranges. No compilation or game launch.")


if __name__ == '__main__':
    main()
