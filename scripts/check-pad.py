#!/usr/bin/env python3
"""Check selected current pad contracts and real binding/focus consumers.

Bounded original x64 with synthetic state; no compiler, UI/OS/device or game.
--write retains the compact result and exact selected assembly intervals.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import itertools
import json
import math
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
OUT = ROOT / 'docs/analysis/evidence/0.112.0/pad'
SPANS = {
    'radial': (0x1401b84e6, 0x1401b8519),
    'look-speed': (0x1401c3fec, 0x1401c3ffb),
    'zoom-speed': (0x1401c4068, 0x1401c4077),
    'activity': (0x1401c0d85, 0x1401c0dce),
    'cursor': (0x1401c1020, 0x1401c1054),
    'handoff': (0x1401c10a5, 0x1401c110a),
    'jump': (0x1401c15cc, 0x1401c15e6),
    'wait': (0x1401c2994, 0x1401c2a1b),
    'inactive': (0x1401c20a1, 0x1401c20ba),
    'repeat': (0x1401c2c5a, 0x1401c2cdb),
    'score': (0x1401c2e0e, 0x1401c2e68),
    'start': (0x1401c148c, 0x1401c14ac),
    'back': (0x1401c317d, 0x1401c319a),
    'slider': (0x14011dad8, 0x14011db04),
}


def f(value):
    return _shared_f32(value)


def bits(value):
    return _shared_bits(value)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    module = load_script('pad_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    deps=json.loads((OUT/'dependencies.json').read_text());assert deps['target_sha256']==SHA
    for row in deps['owners']:
        a,b=int(row['address'],16),int(row['end_exclusive'],16);off=pe.rva_offset(a-pe.image_base)
        assert hashlib.sha256(data[off:off+b-a]).hexdigest()==row['sha256'],row['role']
        if 'raw_input_range'in row:
            lo,hi=map(lambda x:int(x,16),row['raw_input_range']);off=pe.rva_offset(lo-pe.image_base)
            assert hashlib.sha256(data[off:off+hi-lo]).hexdigest()==row['raw_input_sha256']
        else:assert row['sha256']==row['raw_input_sha256']
        if 'pseudocode'in row:assert hashlib.sha256((OUT/row['pseudocode']).read_bytes()).hexdigest()==row['pseudocode_sha256']
    sys.path[:0] = [str(ROOT / 'runtime/armory-recovery/python-libs'),
                   str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs')]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as x
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    native = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    native.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        native.mem_write(pe.image_base + s['rva'], data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    mem = 0x200000000
    native.mem_map(mem, 0x100000)
    allowed, stops = (0, 0), set()

    def raw(a, n):
        at = pe.rva_offset(a - pe.image_base)
        assert at is not None
        return data[at:at + n]

    def reg(name, value=None):
        register = getattr(x, 'UC_X86_REG_' + name)
        if value is not None:
            native.reg_write(register, value)
        return native.reg_read(register)

    def put(at, fmt, *values):
        native.mem_write(at, struct.pack('<' + fmt, *values))

    def get(at, fmt):
        return struct.unpack('<' + fmt, native.mem_read(at, struct.calcsize('<' + fmt)))

    def xmm(name, *values):
        reg(name, int.from_bytes(struct.pack('<4f', *(list(values) + [0.] * (4 - len(values)))), 'little'))

    def low(name):
        return struct.unpack('<f', reg(name).to_bytes(16, 'little')[:4])[0]

    def hook(_, address, count, unused):
        if address in stops:
            native.emu_stop()
        else:
            assert allowed[0] <= address and address + count <= allowed[1], hex(address)

    native.hook_add(UC_HOOK_CODE, hook)

    def run(role, endpoints=None):
        nonlocal allowed, stops
        allowed = SPANS[role]
        stops = set(endpoints or [allowed[1]])
        reg('EFLAGS', 2)
        reg('MXCSR', 0x1f80)
        native.emu_start(allowed[0], 0, count=10000)
        assert reg('RIP') in stops

    counts = {}
    values = [0xff800000, 0xbf800000, 0x80000001, 0x80000000, 0, 1, 0x3e800000,
              0x3f800000, 0x7f7fffff, 0x7f800000, 0x7fc00000, 0x7fa00001, 0xffc12345]
    for role, output in [('look-speed', 'XMM6'), ('zoom-speed', 'XMM7')]:
        for value in values:
            reg('RDI', (value << 32) | 1)
            run(role)
            decoded = struct.unpack('<f', struct.pack('<I', value))[0]
            assert reg(output) & 0xffffffff == (value if decoded > 0. else 0)
    counts['speed_bits'] = 26
    count = 0
    for dead in [0., .25, .9, float('nan')]:
        for left in [(0., 0.), (.1, .2), (.15, .2), (.25, 0.), (.6, .8), (-.6, .8), (1., -1.)]:
            for right in [(0., 0.), (.15, .2), (-.6, -.8)]:
                for name, value in [('XMM8', left[0]), ('XMM7', left[1]), ('XMM0', right[0]), ('XMM1', right[1]), ('XMM6', dead)]:
                    xmm(name, value)
                reg('RSI', mem)
                run('radial')
                expected = []
                for pair in [left, right]:
                    length = f(math.sqrt(f(f(pair[0] * pair[0]) + f(pair[1] * pair[1]))))
                    expected.extend((0., 0.) if length < dead else pair)
                assert all(math.isclose(a, b, rel_tol=2e-6, abs_tol=2e-6) for a, b in zip(get(mem, '4f'), expected))
                count += 1
    counts['radial'] = count
    stack, state, dirty, inputs = mem + 0xf0000, mem + 0x1000, mem + 0x2000, mem + 0x3000
    points = [(0., 0.), (.1, .2), (.3, .4), (.300001, .4), (.6, .8), (-.6, .8), (float('nan'), 0.), (float('inf'), 0.)]
    for left in points:
        for right in points:
            put(stack + 0x58, '4f', *(left + right))
            reg('RSP', stack)
            run('activity')
            active = lambda p: f(math.sqrt(f(f(p[0] * p[0]) + f(p[1] * p[1])))) > .5
            assert get(stack + 0x28, 'B')[0] == int(active(left) or active(right))
    counts['activity'] = 64
    count = 0
    for latch, mode, activity, keyboard, mouse in itertools.product([0, 1], repeat=5):
        for travel in [0., 12., 12.01]:
            put(state + 0x4e, 'B', latch)
            put(state + 0x4d, 'B', mode)
            put(state + 0x24, 'f', travel)
            put(state + 0x10, 'I', 99)
            put(stack + 0x28, 'B', activity)
            for name, value in [('RSP', stack), ('R8', state), ('R9', dirty), ('R10', 42), ('RCX', keyboard), ('RDX', mouse)]:
                reg(name, value)
            xmm('XMM0', 0.)
            run('handoff')
            expected = mode if latch else 1 if activity else mode and not (keyboard or mouse or f(travel) > 12.)
            assert get(state + 0x4e, 'B')[0] == 0 and get(state + 0x4d, 'B')[0] == expected
            assert get(state + 0x24, 'f')[0] == (0. if not latch and activity and not mode else f(travel))
            count += 1
    counts['handoff'] = count
    for blocked, held in itertools.product([0, 1], repeat=2):
        put(state + 0x4f, 'B', blocked)
        for name, value in [('RBX', state), ('R12', held), ('RDI', dirty), ('RSI', inputs), ('R15', 42)]:
            reg(name, value)
        run('jump')
        assert get(state + 0x4f, 'B')[0] == blocked & held
        assert get(inputs + 0x15, 'B')[0] == (((blocked & held) ^ 1) & held)
    counts['jump_release'] = 4
    bp, clock = mem + 0x8000, mem + 0xa000
    for counter in range(256):
        for remembered in [0, 1]:
            put(state + 0x10, 'Q', 0)
            put(state + 0x4c, 'B', counter)
            put(state + 0x28, 'I2f', remembered, 42., 27.)
            put(bp + 0x370, 'I', 42)
            for name, value in [('R11', state), ('R10', dirty), ('RBP', bp)]:
                reg(name, value)
            xmm('XMM9', 200., 100.)
            run('wait', [0x1401c2a1b, 0x1401c2aee, 0x1401c2a60])
            updated = min(counter + 1, 255)
            assert get(state + 0x4c, 'B')[0] == updated
            selected = not remembered or updated >= 3
            assert (reg('RIP') == 0x1401c2a1b) == selected
            if selected:
                assert struct.unpack('<2f', reg('XMM9').to_bytes(16, 'little')[:8]) == ((42., 27.) if remembered else (100., 50.))
    counts['focus_wait'] = 512
    for active, now, deadline, same in [(0, 0., 0., True), (1, .37, .38, True), (1, .38, .38, True), (1, 1., 2., False), (1, 2., 1., True)]:
        put(state + 0x34, 'Iii', active, 1 if same else -1, 0)
        put(state + 0x20, 'f', deadline)
        put(clock + 0x5c, 'f', now)
        put(bp + 0x360, 'Q', state)
        put(bp + 0x358, 'Q', dirty)
        put(bp + 0x370, 'I', 42)
        for name, value in [('RBP', bp), ('R13', clock), ('RSI', 1), ('RDX', 0)]:
            reg(name, value)
        run('repeat', [0x1401c2cdb, 0x1401c2f50])
        fired = reg('RIP') == 0x1401c2cdb
        expected = not active or not same or f(now) >= f(deadline)
        assert fired == expected
        assert math.isclose(get(state + 0x20, 'f')[0], now + (.38 if not active or not same else .11) if fired else deadline, rel_tol=2e-6, abs_tol=2e-6)
    counts['focus_repeat'] = 5
    # All selected intervals execute, including actual logical request writes.
    for role, frame, offsets in [('start',stack,(0x1f4,0x1e8,0x1d8)),('back',bp,(0xcc,0xc0,0xb0))]:
        for pressed in [0,1]:
            put(dirty,'I',99);put(inputs,'B',0)
            put(frame+offsets[0],'I',42);put(frame+offsets[1],'Q',dirty);put(frame+offsets[2],'Q',inputs)
            reg('RSP',stack);reg('RBP',bp);reg('RAX',pressed);run(role)
            assert get(dirty,'I')[0]==(42 if pressed else 99) and get(inputs,'B')[0]==pressed
    counts['logical_menu'] = 4
    put(state+0x10,'I',1);put(state+0x34,'I',1);put(state+0x4c,'B',17);put(bp+0x370,'I',42)
    reg('R9',state);reg('R14',dirty);reg('RBP',bp);run('inactive')
    assert get(state+0x10,'I')[0]==get(state+0x34,'I')[0]==0 and get(state+0x4c,'B')[0]==17
    counts['inactive'] = 1
    count=0
    for old,new in itertools.product([(0.,0.),(10.,0.),(0.,10.),(-3.,4.)],repeat=2):
        put(state+0x44,'2f',*old);put(inputs+0x10,'2f',*new)
        reg('RBX',inputs);reg('R8',state);reg('R9',dirty);reg('R10',42);xmm('XMM0',3.)
        run('cursor');delta=[f(a-b) for a,b in zip(old,new)]
        expected=f(3.+f(math.sqrt(f(f(delta[0]*delta[0])+f(delta[1]*delta[1])))))
        assert low('XMM0')==expected and get(state+0x44,'2f')==new and get(state+0x40,'I')[0]==1
        count+=1
    counts['cursor_segments']=count
    count=0
    for direction in [(1.,0.),(-1.,0.),(0.,1.),(0.,-1.)]:
        for point in [(0.,0.),(4.,0.),(4.01,0.),(10.,0.),(10.,3.),(-10.,4.),(0.,10.),(3.,-10.)]:
            put(inputs+8,'4f',point[0],point[1],point[0],point[1]);reg('RCX',inputs);reg('RAX',24)
            xmm('XMM0',*direction);xmm('XMM1',0.,0.);xmm('XMM2',4.);xmm('XMM8',.5,.5)
            run('score',[0x1401c2e68,0x1401c2df0])
            forward=f(f(point[0]*direction[0])+f(point[1]*direction[1]))
            assert (reg('RIP')==0x1401c2e68)==(forward>4.)
            if forward>4.:
                lateral=[f(f(point[i])-f(forward*direction[i]))for i in range(2)]
                expected=f(forward+f(2.*f(math.sqrt(f(f(lateral[0]*lateral[0])+f(lateral[1]*lateral[1]))))))
                assert low('XMM3')==expected,(direction,point,low('XMM3'),expected)
            count+=1
    counts['direction_score']=count
    # Continuous descriptors use (max-min)/20, including nonpositive/NaN steps.
    rows=json.loads((ROOT/'crates/azeroth-survivors-re/assets/options.json').read_text())['rows']
    ranges=[tuple(row['range']) for row in rows if row['control']<=4]
    ranges += [(0.,1.,0.),(-1.,1.,-1.),(0.,1.,float('nan')),(0.,1.,float('inf'))]
    count=0
    for lo,hi,step in ranges:
        for current in [lo,(lo+hi)/2,hi,float('nan')]:
            for direction in [-1,0,1]:
                lo,hi,step,current=map(f,[lo,hi,step,current])
                for name,value in [('XMM7',lo),('XMM6',hi),('XMM8',step),('XMM0',current),('XMM2',direction)]:xmm(name,value)
                run('slider');actual=low('XMM6')
                used=step if step>0. else f(f(hi-lo)/20.)
                value=f(current+f(f(direction)*used))
                expected=value if math.isnan(value) else min(max(value,lo),hi)
                assert (math.isnan(actual) and math.isnan(expected)) or bits(actual)==bits(expected),(lo,hi,step,current,direction,actual,expected)
                count+=1
    counts['slider']=count
    options=(ROOT/'crates/azeroth-survivors-re/src/options.rs').read_text()
    for token in ['let value = device_slider_value(row.range, current, direction)', 'if step > 0.', '(max - min) / 20.', 'state.set(row, slider_string(row, value))']:
        assert token in options, token
    # Current target's exact command identity/body and actual source VM lifecycle.
    command = b'AZS_OPENLEVELS'
    assert command in data and b'AZS_OpenStoredLevels();\r\n\t</Binding>' in data
    bindings = (ROOT / 'crates/benilla-app/src/bindings.rs').read_text()
    for token in ['defaults.extend(extension.binding_defaults.iter().cloned())',
                  'script.seed_binding_set(1, Some(store::resolve(&overrides, &defaults)))',
                  'script.seed_binding_set(2, Some(store::resolve(&overrides, &defaults)))',
                  'script.keybind_snapshot()', 'script.default_bindings()',
                  'crate::local_state::write_atomic(path, &text)', 'std::fs::remove_file(chr)']:
        assert token in bindings, token
    source = (ROOT / 'crates/azeroth-survivors-re/src/native_input/mod.rs').read_text()
    for token in ['std::mem::take(&mut state.synthetic_input)', 'MessageCursor<',
                  'output.menu_requested = focused && state.pad_mode && pad.pause;',
                  'KeyCode::KeyC', 'Key::Character("c".into())']:
        assert token in source, token
    focus = (ROOT / 'crates/azeroth-survivors-re/src/native_input/focus.rs').read_text()
    for token in ['device_slider(world, target.entity, direction.x)', 'UiStack',
                  'state.focus_missing.saturating_add(1)', 'device_scroll_position(world, next)',
                  'pulse_secondary(world, state, window)']:
        assert token in focus, token
    ranges = []
    for role, (a, b) in SPANS.items():
        code = raw(a, b - a)
        instructions = list(md.disasm(code, a))
        assert sum(i.size for i in instructions) == len(code), role
        assembly = ''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip()+'\n' for i in instructions)
        path = OUT / (role + '.asm')
        if args.write:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(assembly)
        else:
            assert path.read_text() == assembly
        ranges.append(dict(role=role, address=hex(a), end_exclusive=hex(b),
                           sha256=hashlib.sha256(code).hexdigest(), assembly=path.name))
    proof = dict(target=target, ranges=ranges, counts=counts,
                 source_scope=['native_input/mod.rs', 'native_input/focus.rs', 'native_input/policy.rs',
                               'native_bindings.rs', 'benilla-app/bindings.rs', 'local_client/device.rs'],
                 limits=['Original x64 runs with synthetic registers/state; no callees, ECS, layout or device backend executes.',
                         'Binding registration/save/source consumers are traced; the Rust VM/filesystem/scheduler is not executed.',
                         'Generic Bevy/input/platform implementation and all original/rebuilt gameplay/presentation comparisons remain unverified.'])
    if args.write:
        (OUT / 'validation.json').write_text(json.dumps(proof, indent=2) + '\n')
    else:
        assert json.loads((OUT / 'validation.json').read_text()) == proof
    print(f'Checked {sum(counts.values())} current native pad cases and live binding/focus routes; no compiler/game/device')


if __name__ == '__main__':
    main()
