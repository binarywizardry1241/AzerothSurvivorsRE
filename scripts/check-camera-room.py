#!/usr/bin/env python3
"""Check current camera correction, registration and graph-edge contracts.

No builds or applications. Original instructions execute only in bounded
synthetic fixtures; WMO/terrain/physics and CRT math are explicit seams.
"""
from script_sources import load_script
import hashlib
import json
import math
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
from coverage_common import latest_target, target_bytes

OUT = ROOT / 'docs/analysis/evidence/0.109.0/camera-room'


def load(name, path):
    module = load_script(name, path)
    return module


def main():
    target = latest_target(verify=True)
    data = target_bytes(target)
    manifest = json.loads((OUT / 'manifest.json').read_text())
    assert manifest['target']['sha256'] == target['sha256']
    pe = load('camera_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + size]
    for span in manifest['spans']:
        assert hashlib.sha256(raw(int(span['va'], 16), span['byte_count'])).hexdigest() == span['sha256'], span['role']
    for reference in manifest['reused_evidence']:
        path = ROOT / reference['path']
        assert hashlib.sha256(path.read_bytes()).hexdigest() == reference['sha256'], reference['path']
        if 'manifest_role' in reference:
            retained = json.loads(path.read_text())
            assert retained['target']['sha256'] == target['sha256']
            span = next(s for s in retained['ranges'] if s['role'] == reference['manifest_role'])
            assert hashlib.sha256(raw(int(span['address'], 16), span['byte_count'])).hexdigest() == span['sha256']
    for name, digest in manifest['extract_sha256'].items():
        assert hashlib.sha256((OUT / name).read_bytes()).hexdigest() == digest, name

    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(p['rva'] + max(p['raw_size'], p['virtual_size']) for p in pe.sections)
    u.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    memory, stack = 0x200000000, 0x300000000
    u.mem_map(memory, 0x10000)
    u.mem_map(stack, 0x10000)
    def put(address, fmt, *values):
        u.mem_write(address, struct.pack('<' + fmt, *values))
    def get(address, fmt):
        return struct.unpack('<' + fmt, u.mem_read(address, struct.calcsize('<' + fmt)))
    def reg(name, value):
        u.reg_write(getattr(r, 'UC_X86_REG_' + name), value)
    def xf(name):
        return struct.unpack('<f', u.reg_read(getattr(r, 'UC_X86_REG_' + name)).to_bytes(16, 'little')[:4])[0]
    def setxf(name, value):
        reg(name, int.from_bytes(struct.pack('<f', value), 'little'))
    def clear():
        u.mem_write(memory, bytes(0x10000))
        u.mem_write(stack, bytes(0x10000))
    context = {}
    allowed = [(int(s['va'], 16), int(s['va'], 16) + s['byte_count']) for s in manifest['spans'] if s.get('execute')]
    allowed.append((0x14013d450, 0x14013d503))  # Canonical run-hud extract.
    def hook(uc, address, size, unused):
        context['last_instruction'] = address
        if address == context['stop']:
            context['done'] = True
            uc.emu_stop()
            return
        if context.get('correction'):
            fn = {0x145bfa17d: math.asin, 0x145bfa135: math.exp,
                  0x145bfa11d: math.cos, 0x145bfa117: math.sin}.get(address)
            if fn:
                setxf('XMM0', old.f32(fn(xf('XMM0'))))
            elif address == 0x1417080b0:
                reg('RAX', 0)
                setxf('XMM0', 0)
            elif address == 0x140946c80:
                reg('RAX', int(context['inside'](get(u.reg_read(r.UC_X86_REG_RCX), '3f'))))
            elif address == 0x1415c70f0:
                hit = context['cast'](get(u.reg_read(r.UC_X86_REG_RDX), '3f'), get(u.reg_read(r.UC_X86_REG_R8), '3f'))
                reg('RAX', int(hit is not None))
                if hit is not None:
                    setxf('XMM0', hit)
            elif any(a <= address < b for a, b in allowed):
                return
            else:
                raise AssertionError('Unreviewed correction callee ' + hex(address))
            rsp = u.reg_read(r.UC_X86_REG_RSP)
            reg('RIP', get(rsp, 'Q')[0])
            reg('RSP', rsp + 8)
        else:
            assert any(a <= address < b for a, b in allowed), 'Unreviewed instruction ' + hex(address)
    u.hook_add(UC_HOOK_CODE, hook)
    def run(entry, stop, correction=False):
        context.update(stop=stop, done=False, correction=correction)
        if memory <= stop < memory + 0x10000:
            u.mem_write(stop, b'\xcc')
        try:
            u.emu_start(entry, 0, count=10000)
        except Exception as error:
            raise AssertionError((hex(entry), hex(context.get('last_instruction', 0)),
                                  hex(u.reg_read(r.UC_X86_REG_RIP)))) from error
        assert context['done'], 'Native instruction budget exhausted'

    old = load('historical_camera_model', ROOT / 'scripts/native_camera.py')
    fixture_path = ROOT / 'docs/analysis/evidence/0.105.0/camera-room/native-vectors.json'
    fixtures = json.loads(fixture_path.read_text())
    for retained in fixtures['cases']:
        case = retained['input']
        def inside(point):
            p = [old.f32(a - b) for a, b in zip(point, case['pivot'])]
            return {'all': True, 'none': False, 'courtyard': p[2] < 18,
                    'radius': sum(v * v for v in p) <= 25}[case['room']]
        def cast(origin, movement):
            return None if case['hit'] is None else old.f32(math.sqrt(sum(v * v for v in movement)) * case['hit'])
        expected = old.source_model(case, inside, cast)
        clear()
        rsp = stack + 0x8000
        for name, value in [('RSP', rsp), ('RDI', memory + 0x1000), ('R13', memory + 0x2000),
                            ('R12', memory + 0x3000), ('RSI', memory + 0x4000), ('R14', memory + 0x5000),
                            ('R10', 0 if case['map'] is None else memory + 0x6000),
                            ('RBP', memory + 0x7000), ('R15', rsp + 0x1c8), ('RBX', 0)]:
            reg(name, value)
        put(memory + 0x1000, '4f', 0, 0, 0, 1)
        put(memory + 0x1010, '3f', *case['eye'])
        put(memory + 0x2058, 'f', case['dt'])
        put(memory + 0x3070, '3f', *case['pivot'])
        put(memory + 0x404c, 'f', 0)
        put(memory + 0x5000, 'f', case['tilt'])
        put(memory + 0x6000, 'I', case['map'] or 0)
        context.update(inside=inside, cast=cast)
        run(0x140988511, 0x140988b3b, correction=True)
        actual = dict(tilt=get(memory + 0x5000, 'f')[0], eye=list(get(memory + 0x1010, '3f')))
        assert actual == retained['output'], (case, actual, retained['output'])
        assert all(abs(a - b) < .00005 for a, b in zip([actual['tilt'], *actual['eye']], [expected['tilt'], *expected['eye']])), (case, actual, expected)
    for case in fixtures['room_admission_cases']:
        clear()
        for name, value in [('RBP', memory + 0x7000), ('RCX', 1), ('RAX', 0), ('R12', 1),
                            ('R14', memory + 0x8000), ('R15', memory + 0x9000)]:
            reg(name, value)
        put(memory + 0x9000, 'I', case['flags'])
        setxf('XMM8', case['depth'])
        setxf('XMM0', 0)
        run(0x14198fc17, 0x14198fc57)
        assert bool(get(memory + 0x8000, 'Q')[0]) == case['accepted'] == (case['depth'] <= 1760 and case['flags'] & 8 == 0)

    # Original append helpers: preallocated vectors exclude allocation/OS seams.
    schedule_cases = 0
    for entry, direction in [(0x14013d450, 1), (0x14013d550, 0), (0x14013d650, None)]:
        for group_count in [None, 0, 2]:
            clear()
            config, children = memory + 0x1000, memory + 0x2000
            objects = [config] if group_count is None else [children + i * 0x70 for i in range(group_count)]
            if group_count is not None:
                put(config, 'q', -1)
                put(config + 0x10, 'QQ', children, group_count)
            for i, obj in enumerate(objects):
                field = 0 if direction is None else 0x18
                put(obj + field, 'QQQ', 4, memory + 0x4000 + i * 0x100, 0)
            rsp = stack + 0x8008
            put(rsp, 'Q', memory + 0xff00)
            for name, value in [('RSP', rsp), ('RCX', config), ('RDX', 0x1111222233334444), ('R8', 0x5555666677778888)]:
                reg(name, value)
            run(entry, memory + 0xff00)
            for obj in objects:
                field = 0 if direction is None else 0x18
                assert get(obj + field + 0x10, 'Q')[0] == 1
                row = get(obj + field + 8, 'Q')[0]
                assert get(row, 'QQ') == (0x1111222233334444, 0x5555666677778888)
                if direction is not None:
                    assert get(row + 0x30, 'B')[0] == direction
            schedule_cases += 1
    # The real graph consumer converts Before0/After1 into directed endpoints.
    for direction in [0, 1]:
        for current_kind in [0, 1]:
            for index, generation in [(13, 71), (0, 0xffffffff)]:
                clear()
                bp = memory + 0x1000
                put(bp + 0x48, 'Q', current_kind)
                put(bp + 0x50, 'Q', generation)
                put(bp + 0x58, 'Q', index)
                put(bp + 0x108, 'Q', memory + 0x4000)
                for name, value in [('RBP', bp), ('RSI', direction), ('R10', 97), ('RDX', 19)]:
                    reg(name, value)
                run(0x144e976f4, 0x144e977a1)
                current, other = (current_kind, index, generation), (1, 97, 19)
                assert get(bp + 0x60, 'III') == (other if direction else current)
                assert get(bp + 0xd8, 'III') == (current if direction else other)
                schedule_cases += 1
    # Final shake application reads the corrected position and adds XYZ only.
    shake_cases = 0
    for offset in [(0., 0., 0.), (-0., 0., -0.), (1., 2., 3.), (-3., 0., 4.), (math.nan, 0., 0.), (0., math.inf, 0.)]:
        clear()
        put(memory + 0x1000, '7f', .1, .2, .3, .4, 5, 6, 7)
        put(memory + 0x2000, 'I', 3)
        reg('RBX', memory + 0x1000)
        reg('RDI', memory + 0x2000)
        reg('RSP', stack + 0x8000)
        put(stack + 0x803c, 'I', 17)
        for name, value in zip(['XMM8', 'XMM6', 'XMM1'], offset):
            setxf(name, value)
        run(0x1409651f3, 0x140965232)
        assert get(memory + 0x1000, '4f') == tuple(old.f32(x) for x in [.1, .2, .3, .4])
        for actual, initial, delta in zip(get(memory + 0x1010, '3f'), [5, 6, 7], offset):
            assert math.isnan(actual) if math.isnan(delta) else actual == initial + delta
        assert get(memory + 0x2000, 'I')[0] == (17 if any(x != 0 for x in offset) else 3)
        shake_cases += 1

    # Exact data links join dependency sets to the actual function-system types.
    for dependency, default, eq in [(0x145f0d278, 0x1460333d8, 0x140a4bd90), (0x145f107e8, 0x146036318, 0x140a4c840)]:
        assert get(dependency + 8, 'QQ') == get(default + 8, 'QQ') == (0, 1)
        assert get(dependency + 0x30, 'Q')[0] == get(default + 0x30, 'Q')[0] == eq
    for vtable, runner, defaults in [(0x145fc0e10, 0x140ea1b70, 0x14129eb00), (0x145ee2280, 0x1409b1160, None), (0x145edff10, 0x1409b21d0, 0x1412a4b10)]:
        assert get(vtable + 0x48, 'Q')[0] == runner
        if defaults is not None:
            assert get(vtable + 0x90, 'Q')[0] == defaults
    assert get(0x145ff4c40, 'Q')[0] == 0x140cdf0b0
    assert get(0x145ff4c60, 'Q')[0] == 0x141259950
    assert raw(0x14601526c, 33) == b'benilla_app::player::PlayerPlugin'
    length = get(0x145fb34f8 + 8, 'Q')[0]
    label = 0x145fb3518 + get(0x145fb3518 + 4, 'i')[0]
    assert raw(label, length) == b'Input'
    assert get(0x145edf1c8 + 0x18, 'Q')[0] == 0x1409a0530
    assert raw(0x145ee2bc8, 12) == b'InWorldGated'
    assert get(0x145fa3488 + 0x48, 'Q')[0] == 0x140d04d00

    source = (ROOT / 'crates/benilla-app/src/player/camera_room.rs').read_text()
    for fragment in ('map != Some(189)', 'distance >= 2.0', 'horizontal.length() > 0.001',
                     'for step in 1..=10', 'distance * 0.97', '12.0 } else { 2.5', 'for _ in 0..8',
                     'Quat::from_rotation_arc(offset / distance, ray) * eye.rotation',
                     'world.camera_room_at(point)', 'collision.cast_camera(origin, movement, false)'):
        assert fragment in source, fragment
    schedule = (ROOT / 'crates/benilla-app/src/player.rs').read_text()
    block = schedule.split('camera_room::correct_view', 1)[1].split('\n        )', 1)[0]
    for fragment in ('.in_set(WorldStage::Input)', '.after(control)', '.before(crate::camera_shake::apply_camera_shake)',
                     '.run_if(not(resource_exists::<crate::run_mode::CaptureMode>))', '.in_set(crate::client_state::InWorldGated)'):
        assert fragment in block, fragment
    room = (ROOT / 'crates/benilla-world/src/wmo_portal/interior.rs').read_text().split('pub fn camera_room_at', 1)[1].split('/// Whether a world position', 1)[0]
    assert 'camera_room_group(model, local, terrain_local)' in room and 'POSITION_PROBE_LIFT' not in room
    seed = (ROOT / 'crates/benilla-world/src/wmo_portal/seed.rs').read_text().split('pub(crate) fn camera_room_group', 1)[1].split('/// The shared body:', 1)[0]
    assert 'EXTERIOR' in seed and '1760.0' in seed
    print(f'Current camera contracts: 67 correction/room cases, {schedule_cases} schedule cases, {shake_cases} shake application cases; target, extracts and source routes pass')


if __name__ == '__main__':
    main()
