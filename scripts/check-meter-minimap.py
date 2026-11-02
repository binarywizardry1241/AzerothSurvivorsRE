#!/usr/bin/env python3
"""Check #56's current native button geometry without compilation or game execution.

Unchanged x64 constructor/position prefixes run in Unicorn. Asset handles,
allocation, image conversion and ECS insertion are explicit seams. This does
not run Bevy layout, picking, FrameXML, a renderer, or the reference application.
--collect stages compact evidence in runtime/ for review; --prepare-rea stages
the exact raw owners for scripts/rea-batch.py and the Ghidra provider.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from native_recovery import f32
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
WORK = ROOT / 'runtime/meter-gap56-0.113.2'
RETAINED = ROOT / 'docs/analysis/evidence/0.113.2/meter-minimap'
OWNERS = [(0x1402b23f0, 0x1402b33e5), (0x1402137d0, 0x14021475c)]
RANGES = {
    'children': (0x1402b23f0, 0x1402b2c9d),
    'placement': (0x1402139eb, 0x140213a2b),
    'offsets': (0x140213e5b, 0x140213e6b),
    'half-size': (0x140213f19, 0x140213f21),
    'button-and-transform': (0x140213f51, 0x14021425b),
    'minimap-width-gate': (0x14021394d, 0x140213976),
}


def dump(path, value):
    path.write_text(json.dumps(value, indent=2, allow_nan=False) + '\n')


def source_check():
    source = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/meter.rs').read_text()
    button = source.split('                    MeterButton,', 1)[1].split('                    MeterWindow,', 1)[0]
    assert 'UiTransform::default()' in button
    assert 'width: Val::Px(31.)' in button and 'height: Val::Px(31.)' in button
    assert 'Val::Percent' not in button and 'JustifyContent::Center' not in button
    for a, b, size in [(6, 5, 21), (7, 6, 19), (0, 0, 53)]:
        assert f'left: Val::Px({a}.)' in button
        assert f'top: Val::Px({b}.)' in button
        assert f'width: Val::Px({size}.)' in button and f'height: Val::Px({size}.)' in button
    assert button.index('BackgroundColor(Color::srgba(0., 0., 0., 0.8))') < button.index('MinimapIcon,') < button.index('meter.icons.get(TRACKING)')
    assert 'border_radius: BorderRadius::MAX' in button
    assert button.count('Pickable::IGNORE') == 3
    assert 'minimap.is_some()' in source
    assert '.filter(|rect| (rect[2] - rect[0]) * viewport.x > 1.)' in source
    assert '((left + right) * viewport.x * 0.5 - 75.175407 * factor) / meter.scale - 15.5' in source
    assert '((top + bottom) * viewport.y * 0.5 + 27.361612 * factor) / meter.scale - 15.5' in source
    assert 'transform.scale = Vec2::splat(factor / meter.scale)' in source
    assert 'node.width = Val::Px(31. * factor' not in source
    assert '* meter.scale' in source.split('fn fit(', 1)[1]
    assert 'cursor.cursor_over && (button.is_some()' in source
    assert 'Action::Toggle => {' in source and 'icon.color = if active {' in source
    bridge = (ROOT / 'crates/benilla-app/src/local_client.rs').read_text()
    assert 'script.named_frame_normalized_rect("Minimap")' in bridge


def replay(pe):
    sys.path[:0] = [str(ROOT / 'runtime/armory-recovery/python-libs')]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(pe.image_base, (max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections) + 4095) & ~4095)
    for s in pe.sections:
        machine.mem_write(pe.image_base + s['rva'], pe.data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    machine.mem_map(0x200000000, 0x100000)
    machine.mem_map(0x300000000, 0x200000)
    read_q = lambda at: struct.unpack('<Q', machine.mem_read(at, 8))[0]
    register = lambda name: machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    nodes = []

    def hook(cpu, address, size, unused):
        if RANGES['children'][0] <= address < RANGES['children'][1]:
            return
        c, d, e, sp = register('RCX'), register('RDX'), register('R8'), register('RSP')
        if address in [0x1402659d0, 0x140267240, 0x140266f70]:
            raw = bytes(machine.mem_read(e + 8, 384))
            node = {name: list(struct.unpack_from('<If', raw, offset)) for name, offset in
                    [('left', 104), ('top', 120), ('width', 136), ('height', 144)]}
            node['position_type'] = raw[371]
            node['border_radius'] = [list(struct.unpack_from('<If', raw, 280 + index * 8)) for index in range(4)]
            nodes.append(dict(site=hex(read_q(sp) - 5), node=node))
            if address == 0x1402659d0:
                # Four zero color lanes followed by the native 0.8 alpha.
                assert bytes(machine.mem_read(e + 0x188, 20)) == bytes(16) + struct.pack('<f', 0.8)
            if address == 0x140266f70:
                machine.emu_stop()
                return
            machine.mem_write(c, bytes(48))
        elif address in [0x1400de550, 0x140159a10]:
            machine.mem_write(c, bytes(112))  # Asset-handle result, outside geometry.
        elif address == 0x142674550:
            machine.mem_write(c, bytes(136))  # ImageNode conversion, outside layout fields.
        elif address == 0x145cf998b:
            machine.mem_write(c, bytes(machine.mem_read(d, e)))
        elif address == 0x140002200:
            pass
        elif address == 0x1400021c0:
            c = 0x200000800
        else:
            raise AssertionError(f'Unreviewed constructor callee {address:x}')
        machine.reg_write(reg.UC_X86_REG_RAX, c)
        machine.reg_write(reg.UC_X86_REG_RIP, read_q(sp))
        machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    machine.reg_write(reg.UC_X86_REG_RSP, 0x3001f0008)
    machine.reg_write(reg.UC_X86_REG_RCX, 0x200000100)
    machine.reg_write(reg.UC_X86_REG_RDX, 0x200000200)
    machine.mem_write(0x200000200, struct.pack('<QQQ', 0, 0x200000300, 0x200000400))
    hook_id = machine.hook_add(UC_HOOK_CODE, hook)
    machine.emu_start(RANGES['children'][0], RANGES['children'][1], count=10000)
    machine.hook_del(hook_id)
    assert len(nodes) == 3
    for row, (left, top, width) in zip(nodes, [(6., 5., 21.), (7., 6., 19.), (0., 0., 53.)]):
        assert row['node']['position_type'] == 1
        assert row['node']['left'] == [1, left] and row['node']['top'] == [1, top]
        assert row['node']['width'] == row['node']['height'] == [1, width]
    assert nodes[0]['node']['border_radius'] == [[1, f32(3.4028234663852886e38)]] * 4

    def set_float(name, value):
        machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), int.from_bytes(struct.pack('<f', value), 'little'))

    def get_float(name):
        return struct.unpack('<f', (register(name) & 0xffffffff).to_bytes(4, 'little'))[0]

    def run(start, end):
        machine.emu_start(start, end, count=1000)
        assert register('RIP') == end

    positions, buttons = [], []
    for width in [70., 105., 140., 210., 280.]:
        for left, top in [(0., 0.), (121.25, 90.5), (1500., 20.)]:
            right, bottom = f32(left + width), f32(top + width)
            set_float('XMM1', right)
            set_float('XMM3', left)
            set_float('XMM2', f32(f32(top + bottom) * 0.5))
            run(*RANGES['placement'])
            factor = get_float('XMM0')
            run(*RANGES['offsets'])
            run(*RANGES['half-size'])
            x, y = get_float('XMM1'), get_float('XMM2')
            expected_x = f32(f32(f32(left + right) * 0.5) + f32(f32(-75.175407) * factor))
            expected_y = f32(f32(f32(top + bottom) * 0.5) + f32(f32(27.361612) * factor))
            assert x == f32(expected_x - 15.5) and y == f32(expected_y - 15.5)
            run(0x140213f51, 0x140214224)
            parent = register('R8')
            assert list(struct.unpack('<If', machine.mem_read(parent + 104, 8))) == [1, x]
            assert list(struct.unpack('<If', machine.mem_read(parent + 120, 8))) == [1, y]
            assert list(struct.unpack('<IfIf', machine.mem_read(parent + 136, 16))) == [1, 31., 1, 31.]
            scale = list(struct.unpack('<ff', machine.mem_read(parent + 400, 8)))
            assert scale == [factor, factor]
            assert struct.unpack('<i', machine.mem_read(parent + 416, 4))[0] == 4060
            buttons.append(dict(left=x, top=y, size=[31., 31.], scale=scale, z=4060))
            for zoom in [0.5, 0.75, 1., 1.5, 2.]:
                # Bevy centers UiTransform on the button. The Canvas's zoom and
                # this inverse zoom cancel for every child and its input bounds.
                for local_x, local_y in [(0., 0.), (7., 6.), (26., 25.), (31., 31.), (53., 53.)]:
                    actual_x = (expected_x / zoom + (local_x - 15.5) * factor / zoom) * zoom
                    actual_y = (expected_y / zoom + (local_y - 15.5) * factor / zoom) * zoom
                    assert abs(actual_x - (x + 15.5 + (local_x - 15.5) * factor)) < 0.001
                    assert abs(actual_y - (y + 15.5 + (local_y - 15.5) * factor)) < 0.001
                positions.append(dict(rect=[left, top, right, bottom], zoom=zoom, factor=factor, native_left=x, native_top=y))
    width_gates = []
    for right in [50., 100., 100.25, 101., 102., 170., float('nan'), float('inf')]:
        machine.reg_write(reg.UC_X86_REG_RDX, 0x200000d00)
        machine.mem_write(0x200000d04, struct.pack('<f', 100.))
        machine.mem_write(0x200000d0c, struct.pack('<f', right))
        run(0x14021394d, 0x140213968)
        admitted = bool(register('RAX') & 0xff)
        assert admitted == (right > 101.)
        width_gates.append(dict(right_bits=struct.pack('<f', right).hex(), admitted=admitted))
    return dict(constructor_nodes=nodes, native_button_cases=buttons, placement_cases=positions, width_gates=width_gates,
                limits=['ECS insertion, allocation and asset-handle conversion are seams.',
                        'Scale comparisons model the existing centered Bevy transform; actual layout/picking/GPU execution is unverified.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--collect', action='store_true')
    parser.add_argument('--prepare-rea', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Installed target changed; recover current owners first'
    pe = load_script('meter_minimap_pe', ROOT / 'scripts/inventory-executable.py').PE(target_bytes(target))

    def raw(start, end):
        offset = pe.rva_offset(start - pe.image_base)
        return pe.data[offset:offset + end - start]

    if args.prepare_rea:
        destination = WORK / 'reproduce'
        for start, end in OWNERS:
            folder = destination / hex(start)
            folder.mkdir(parents=True, exist_ok=True)
            (folder / 'owner.bin').write_bytes(raw(start, end))
            dump(folder / 'plan.json', dict(target=str((folder / 'owner.bin').relative_to(ROOT)),
                 output=str((folder / 'rea').relative_to(ROOT)), init_timeout=60, timeout=240,
                 open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                 operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(start)), label='owner')]))
        print('Prepared two current-owner Ghidra plans under', destination.relative_to(ROOT))
        return
    cases = replay(pe)
    source_check()
    if args.collect:
        sys.path.insert(0, str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'))
        import capstone as cs
        destination = WORK / 'curated'
        destination.mkdir(parents=True, exist_ok=True)
        decoder = cs.Cs(cs.CS_ARCH_X86, cs.CS_MODE_64)
        decoder.detail = True
        ranges, literals, observations = [], {}, []
        for name, (start, end) in RANGES.items():
            payload = raw(start, end)
            decoded = list(decoder.disasm(payload, start))
            assert sum(row.size for row in decoded) == len(payload)
            assembly = ''.join(f'{row.address:x} {row.bytes.hex()} {row.mnemonic} {row.op_str}'.rstrip() + '\n' for row in decoded)
            (destination / (name + '.asm')).write_text(assembly)
            ranges.append(dict(role=name, start=hex(start), end_exclusive=hex(end), file_offset=hex(pe.rva_offset(start-pe.image_base)), sha256=hashlib.sha256(payload).hexdigest(), assembly=name+'.asm', assembly_sha256=hashlib.sha256(assembly.encode()).hexdigest()))
            for instruction in decoded:
                for operand in instruction.operands:
                    if operand.type == cs.x86.X86_OP_MEM and operand.mem.base == cs.x86.X86_REG_RIP:
                        address = instruction.address + instruction.size + operand.mem.disp
                        count = operand.size
                        literals[(address, count)] = dict(address=hex(address), size=count, hex=raw(address,address+count).hex())
        for address, count in [(0x145f01752,17), (0x145f01763,50)]:
            literals[(address,count)] = dict(address=hex(address), size=count, hex=raw(address,address+count).hex())
        for start, end in OWNERS:
            response = json.loads((WORK / hex(start) / 'rea/003-owner.json').read_text())
            evidence = json.loads(response['response']['result']['content'][0]['text'])
            assert evidence['subject']['digest']['sha256'] == hashlib.sha256(raw(start,end)).hexdigest()
            observations.append(dict(start=hex(start), end_exclusive=hex(end), sha256=evidence['subject']['digest']['sha256'], evidence_id=evidence['evidence_id'], provider='Ghidra 12.1.4'))
        # Retain one canonical copy of overlapping/adjacent immutable inputs.
        intervals = []
        for address, count in sorted(literals):
            if intervals and address <= intervals[-1][1]:
                intervals[-1][1] = max(intervals[-1][1], address + count)
            else:
                intervals.append([address, address + count])
        inputs = [dict(address=hex(a), size=b-a, hex=raw(a,b).hex()) for a,b in intervals]
        dump(destination/'manifest.json', dict(target_sha256=SHA, gap_ids=[56], ranges=ranges, literals=inputs, ghidra_owners=observations, limits=cases['limits']))
        dump(destination/'native-cases.json', cases)
        print('Staged reviewed-range candidates under', destination.relative_to(ROOT))
    else:
        manifest = json.loads((RETAINED/'manifest.json').read_text())
        assert manifest['target_sha256'] == SHA
        for row in manifest['ranges']:
            assert hashlib.sha256(raw(int(row['start'],16),int(row['end_exclusive'],16))).hexdigest() == row['sha256']
            assert hashlib.sha256((RETAINED/row['assembly']).read_bytes()).hexdigest() == row['assembly_sha256']
        for row in manifest['literals']:
            address = int(row['address'],16)
            assert raw(address,address+row['size']).hex() == row['hex']
        for row in manifest['ghidra_owners']:
            assert hashlib.sha256(raw(int(row['start'],16),int(row['end_exclusive'],16))).hexdigest() == row['sha256']
        assert cases == json.loads((RETAINED/'native-cases.json').read_text())
    print(f"#56: three native child records, {len(cases['native_button_cases'])} native button/placement cases, {len(cases['width_gates'])} width gates, {len(cases['placement_cases'])} zoom compositions and live source guards pass; no compilation/layout/game execution.")


if __name__ == '__main__':
    main()
