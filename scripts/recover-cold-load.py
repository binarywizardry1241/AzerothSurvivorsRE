#!/usr/bin/env python3
"""Recover bounded cold-load timing contracts without compiling or launching a game.

All generated material stays under runtime/cold-load-0.105.0 for review. --rea
decompiles selected unchanged function slices with the project REA/Ghidra wrapper.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe'
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
OUT = ROOT / 'runtime/cold-load-0.105.0'
HOLD = (0x140836110, 0x14083647b)
WATCH = (0x140abbd60, 0x140abc282)


def save(path, value):
    path.write_text(portable_json(value, indent=2, allow_nan=False) + '\n')


def machine(pe, data):
    # Reuse the already-installed project-local native instruction emulator.
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s['rva'], data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    mem, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(mem, 0x20000)
    u.mem_map(stack, 0x10000)
    u.mem_map(done, 4096)
    return u, r, mem, stack, done


def settle_cases(pe, data):
    u, r, mem, stack, done = machine(pe, data)
    from unicorn import UC_HOOK_CODE
    player, progress, clock, baseline = (mem + n for n in (0x1000, 0x2000, 0x3000, 0x4000))
    context = {}

    def put(a, fmt, *v):
        u.mem_write(a, struct.pack(fmt, *v))

    def get(a, fmt):
        return struct.unpack(fmt, u.mem_read(a, struct.calcsize(fmt)))

    def hook(_, address, size, unused):
        if address == done:
            u.emu_stop()
            return
        if HOLD[0] <= address < HOLD[1]:
            return
        read, write = u.reg_read, u.reg_write
        if address == 0x145b4cb10:  # world_to_tile seam; both supplied tiles are (0, 0)
            write(r.UC_X86_REG_RAX, 0)
            write(r.UC_X86_REG_RDX, 0)
        elif address == 0x145bc9787:  # exact byte comparison of the six counters
            a, b, n = (read(reg) for reg in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
            write(r.UC_X86_REG_RAX, int(u.mem_read(a, n) != u.mem_read(b, n)))
        elif address == 0x1409bd600:  # settle logging only, not the release decision
            context['release'] = bool(read(r.UC_X86_REG_RCX) & 0xff)
        else:
            raise RuntimeError(f'Unreviewed boundary {address:#x}')
        sp = read(r.UC_X86_REG_RSP)
        write(r.UC_X86_REG_RIP, get(sp, '<Q')[0])
        write(r.UC_X86_REG_RSP, sp + 8)

    u.hook_add(UC_HOOK_CODE, hook)
    cases = []
    specs = [
        ('expired_clock_during_loading_pause', 18., 6., False, False, False, 'timeout'),
        ('pause_accounted_before_release', 18., 24., False, False, False, 'held'),
        ('resident_world_during_loading_pause', 18., 24., True, False, False, 'resident'),
        ('resumed_stalled_world', 31., 24., False, False, False, 'timeout'),
        ('advancing_unpaused_world', 18., 6., False, False, True, 'held'),
        ('stale_world', 18., 6., False, True, False, 'held'),
    ]
    for name, now, deadline, scene_ready, stale, changed, expected in specs:
        u.mem_write(mem, bytes(0x20000))
        u.mem_write(stack, bytes(0x10000))
        context.clear()
        counters = (1, 2, int(not scene_ready), 0, 0, 0)
        put(progress, '<6Q', *counters)
        put(progress + 0x30, '<IiiBB', 1, 0, 0, int(not stale), int(scene_ready))
        put(player + 0xa0, '<ff', deadline, 0.)
        put(player + 0xeb, '<BBBB', 1, int(stale), 0, 0)
        put(clock + 0x5c, '<f', now)
        put(baseline, '<Q6Q', 1, *(tuple(v + 1 for v in counters) if changed else counters))
        # Bevy Mut<Player>, Res<WorldLoadProgress>, Res<Time>, Local<counters>, optional net.
        put(mem, '<Q', player)
        put(mem + 0x10, '<Q', mem + 0x5000)
        put(mem + 0x1c, '<I', 1)
        put(mem + 0x100, '<Q', progress)
        put(mem + 0x200, '<Q', clock)
        put(mem + 0x300, '<Q', 0)
        sp = stack + 0x8008  # Win64 entry alignment after the caller's return address
        put(sp, '<Q', done)
        put(sp + 0x28, '<QQ', baseline, mem + 0x300)
        for reg, value in ((r.UC_X86_REG_RSP, sp), (r.UC_X86_REG_RDX, mem),
                           (r.UC_X86_REG_R8, mem + 0x100), (r.UC_X86_REG_R9, mem + 0x200)):
            u.reg_write(reg, value)
        u.emu_start(HOLD[0], done + 1, count=10000)
        assert u.reg_read(r.UC_X86_REG_RIP) == done, 'native instruction bound exhausted'
        held = bool(get(player + 0xeb, '<B')[0])
        actual = 'held' if held else 'resident' if context.get('release') else 'timeout'
        assert actual == expected, (name, actual, expected)
        after = get(player + 0xa0, '<f')[0]
        if expected == 'held':
            assert after == now + 6., (name, after)
        cases.append(dict(name=name, now=now, supplied_deadline=deadline,
                          scene_ready=scene_ready, stale=stale, counters_changed=changed,
                          outcome=actual, deadline_after=after))
    return cases


def audio_cases(pe, data):
    u, r, mem, stack, done = machine(pe, data)
    from unicorn import UC_HOOK_CODE
    watch, handle = mem + 0x1000, mem + 0x2000
    context = {}

    def put(a, fmt, *v):
        u.mem_write(a, struct.pack(fmt, *v))

    def get(a, fmt):
        return struct.unpack(fmt, u.mem_read(a, struct.calcsize(fmt)))

    def double(value):
        return struct.unpack('<Q', struct.pack('<d', value))[0]

    def hook(_, address, size, unused):
        read, write = u.reg_read, u.reg_write
        if address == done:
            u.emu_stop()
            return
        if address == 0x140abc0f5:  # loss > 100 ms, before the logging filter
            sp = read(r.UC_X86_REG_RSP)
            counted, advanced, span = get(sp + 0xb8, '<3d')
            context['warnings'].append(dict(counted=counted, advanced=advanced, span=span,
                                            lost=counted - advanced))
        if WATCH[0] <= address < WATCH[1]:
            return
        if address == 0x141510d30:  # handle.state(): Playing
            write(r.UC_X86_REG_RAX, 0)
        elif address == 0x141510d60:  # handle.position(): controlled sample
            write(r.UC_X86_REG_XMM0, double(context['pos']))
        elif address == 0x145b73920:  # Instant::now(): controlled poll time
            sec, nano = divmod(round(context['now'] * 1_000_000_000), 1_000_000_000)
            write(r.UC_X86_REG_RAX, sec)
            write(r.UC_X86_REG_RDX, nano)
        elif address == 0x145b73770:  # Instant::duration_since, integer seconds/nanoseconds
            sec, nano = get(read(r.UC_X86_REG_RCX), '<QI')
            before = read(r.UC_X86_REG_RDX) * 1_000_000_000 + (read(r.UC_X86_REG_R8) & 0xffffffff)
            sec, nano = divmod(sec * 1_000_000_000 + nano - before, 1_000_000_000)
            assert sec >= 0
            write(r.UC_X86_REG_RAX, sec)
            write(r.UC_X86_REG_RDX, nano)
        else:
            raise RuntimeError(f'Unreviewed audio boundary {address:#x}')
        sp = read(r.UC_X86_REG_RSP)
        write(r.UC_X86_REG_RIP, get(sp, '<Q')[0])
        write(r.UC_X86_REG_RSP, sp + 8)

    u.hook_add(UC_HOOK_CODE, hook)
    dt = 1. / 60.
    ordinary = [(0., 0., 0.), (.01, .01, .01)]
    delayed = ordinary[:]
    now = .01
    for i in range(1, 181):
        ordinary.append((.01 + i * dt, .01 + i * dt, dt))
        now += dt + (.4 if i == 60 else 0.)
        # Work before this frame's poll is charged to the next frame's start delta.
        delayed.append((now, now, dt + (.4 if i == 61 else 0.)))
    scenarios = [('healthy_regular_poll', ordinary, 0.),
                 ('healthy_poll_delayed_400ms', delayed, .4),
                 ('real_playback_freeze_1200ms', [(0., 0., 0.), (.01, .01, .01), (1.41, .21, 1.4)], 1.2)]
    cases = []
    for name, samples, expected_loss in scenarios:
        u.mem_write(mem, bytes(0x20000))
        context.clear()
        context['warnings'] = []
        put(handle, '<Q', mem + 0x2100)
        # Disable log formatting/output after capturing the native verdict.
        put(0x147ff6fa8, '<Q', mem + 0x10000)
        put(mem + 0x10000, '<Q', 5)
        for now, pos, frame_dt in samples:
            context.update(now=now, pos=pos)
            u.mem_write(stack, bytes(0x10000))
            sp = stack + 0x8008
            put(sp, '<Q', done)
            for reg, value in ((r.UC_X86_REG_RSP, sp), (r.UC_X86_REG_RCX, watch),
                               (r.UC_X86_REG_RDX, handle), (r.UC_X86_REG_XMM2, double(frame_dt))):
                u.reg_write(reg, value)
            u.emu_start(WATCH[0], done + 1, count=10000)
            assert u.reg_read(r.UC_X86_REG_RIP) == done, 'native instruction bound exhausted'
        warnings = context['warnings']
        assert len(warnings) == int(expected_loss > 0), (name, warnings)
        if warnings:
            assert abs(warnings[0]['lost'] - expected_loss) < 1e-6, (name, warnings)
        cases.append(dict(name=name, polls=len(samples), native_warning_count=len(warnings), warnings=warnings,
                          actual_playback_loss=1.2 if name.startswith('real_') else 0.))
    return cases


def recover_owner(pe, data, name, span, rea):
    assert (span[0] - pe.image_base, span[1] - pe.image_base) in [(a, b) for a, b, _ in pe.functions()]
    offset = pe.rva_offset(span[0] - pe.image_base)
    raw = data[offset:offset + span[1] - span[0]]
    (OUT / (name + '.bin')).write_bytes(raw)
    (OUT / (name + '.asm')).write_text(objdump_output([
        'objdump', '-d', '--no-show-raw-insn', f'--start-address={span[0]:#x}',
        f'--stop-address={span[1]:#x}', str(TARGET.relative_to(ROOT)),
    ], cwd=ROOT, text=True))
    response = OUT / ('rea-' + name) / '003-procedure_pseudo_code.json'
    if rea and not response.exists():
        plan = OUT / (name + '-plan.json')
        save(plan, dict(target=str((OUT / (name + '.bin')).relative_to(ROOT)),
                        output=str((OUT / ('rea-' + name)).relative_to(ROOT)),
                        init_timeout=60, open_timeout=60, timeout=180,
                        open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(span[0])),
                        operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(span[0])))]))
        subprocess.run(['python3', 'scripts/rea-batch.py', str(plan.relative_to(ROOT))], cwd=ROOT, check=True)
    owner = dict(role=name, start=hex(span[0]), end_exclusive=hex(span[1]),
                 file_offset=hex(offset), sha256=hashlib.sha256(raw).hexdigest(), assembly=name + '.asm')
    if response.exists():
        result = json.loads(response.read_text())['response']['result']
        evidence = result.get('structuredContent') or json.loads(result['content'][0]['text'])
        assert evidence['subject']['digest']['sha256'] == owner['sha256']
        assert evidence['provider']['id'] == 'ghidra'
        owner.update(evidence_id=evidence['evidence_id'], pseudocode=name + '.c',
                     provider='Ghidra 12.1.4', limitation='Headerless slice: ABI and external data require original-PE instructions.')
        pseudo = evidence.get('result') or evidence['normalized_result']
        (OUT / (name + '.c')).write_text('\n'.join(line.rstrip() for line in pseudo.splitlines()).strip() + '\n')
    return owner


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rea', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, 'wrong selected EXE'
    inventory = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = inventory.PE(data)
    OUT.mkdir(parents=True, exist_ok=True)
    owner = recover_owner(pe, data, 'hold-140836110', HOLD, args.rea)
    owner['role'] = 'settle-release'
    cases = settle_cases(pe, data)
    save(OUT / 'settle-fixtures.json', dict(target_sha256=SHA,
         method='Unchanged selected-PE settle-release instructions in Unicorn',
         seams=['Controlled Bevy resource layout, clock, player flags, tile and six residency counters.',
                'world_to_tile returns the supplied matching tile; memcmp compares actual counter bytes.',
                'The settle log callback is intercepted; no networking, asset worker or game process runs.',
                'Paused deadlines are supplied inputs: this does not execute the Rust pause adapter.'], cases=cases))
    save(OUT / 'settle-manifest.json', dict(target=str(TARGET.relative_to(ROOT)), target_sha256=SHA,
         target_process_launched=False, owners=[owner],
         timeout=dict(address='0x145d6d428', value=struct.unpack_from('<f', data, pe.rva_offset(0x5d6d428))[0]),
         validation=dict(native_cases=len(cases)),
         limits=['No compilation, source-test execution, MPQ load, application launch or native runtime parity comparison.']))
    print(f'{len(cases)} selected-target settle cases passed; staged under {OUT.relative_to(ROOT)}')
    owner = recover_owner(pe, data, 'audio-watch', WATCH, args.rea)
    cases = audio_cases(pe, data)
    constants = []
    for role, address, expected in [('watch-window', 0x145d9ddb0, 1.),
                                     ('minimum-loss', 0x145f4eb40, .1),
                                     ('startup-wait', 0x145f4eb48, 3.)]:
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + 8]
        value = struct.unpack('<d', raw)[0]
        assert value == expected
        constants.append(dict(role=role, address=hex(address), file_offset=hex(offset),
                              byte_count=8, sha256=hashlib.sha256(raw).hexdigest(), value=value))
    save(OUT / 'audio-fixtures.json', dict(target_sha256=SHA,
         method='Unchanged selected-PE StreamWatch::feed instructions in Unicorn',
         seams=['Playback state/position, frame delta and monotonic poll times are controlled inputs.',
                'Instant::duration_since subtracts supplied integer seconds/nanoseconds.',
                'Logging is disabled after recording the native loss verdict; no decoder, device or game process runs.',
                'The healthy delayed-poll case reproduces a native diagnostic false positive, not audible loss.'], cases=cases))
    save(OUT / 'audio-manifest.json', dict(target=str(TARGET.relative_to(ROOT)), target_sha256=SHA,
         target_process_launched=False, owners=[owner], constants=constants,
         validation=dict(native_cases=len(cases)),
         limits=['The source diagnostic deliberately corrects this native meter defect; it does not alter playback.',
                 'No compilation, source-test execution, MPQ load, application launch or listening comparison.']))
    print(f'{len(cases)} selected-target audio cases passed; healthy delayed polling reproduces the false warning')


if __name__ == '__main__':
    main()
