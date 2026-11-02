#!/usr/bin/env python3
"""Recover/check bounded totem-cap instructions without compiling or launching a game.

REA plans and fresh extracts are staged under runtime/. Check mode reads the
reviewed evidence, verifies selected-target identity and replays immutable
instructions in the already-installed project-local Unicorn emulator.
"""
from portable_paths import objdump_output, portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess
import sys

from coverage_common import ROOT, latest_target

SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK = ROOT / 'runtime/totem-cap-01050'
OUT = ROOT / 'runtime/native-evidence/0.105.0/totem-cap'
RETAINED = ROOT / 'docs/analysis/evidence/0.105.0/totem-cap'
RANGES = {
    'expiry': (0x145949470, 0x14594980a),
    'remove': (0x145926f60, 0x14592700e),
    'vector-remove': (0x145997da0, 0x145997eda),
    'begin-passive': (0x145946220, 0x145946559),
    'multi-hit': (0x145945c10, 0x145946089),
    'deadline-expiry': (0x14590b27a, 0x14590b36a),
}
GHIDRA = {'expiry', 'begin-passive', 'multi-hit'}


def write(path, value):
    path.write_text(portable_json(value, indent=2, allow_nan=False) + '\n')


def current_cap(mode, contract_path):
    """Replay a supplied current cap contract using the existing fixture engine.

    Addresses and native layouts are evidence inputs, rather than release-specific
    additions to the recovery tool. Callback seams observe order and arguments.
    """
    from coverage_common import target_bytes
    contract = json.loads((ROOT / contract_path).read_text())
    target = latest_target(verify=True)
    assert target['sha256'] == contract['target']['sha256']
    data = target_bytes(target)
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    def address(value): return int(value, 0) if isinstance(value, str) else value
    def raw(start, size):
        offset = pe.rva_offset(start - pe.image_base)
        result = data[offset:offset + size]
        assert len(result) == size
        return result
    ranges = [(address(row['start']), address(row['end_exclusive'])) for row in contract['ranges']]
    for row, (start, end) in zip(contract['ranges'], ranges):
        assert hashlib.sha256(raw(start, end - start)).hexdigest() == row['sha256']
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    image_end = max(row['rva'] + max(row['virtual_size'], row['raw_size']) for row in pe.sections)
    machine.mem_map(pe.image_base, (image_end + 4095) & ~4095)
    for row in pe.sections:
        machine.mem_write(pe.image_base + row['rva'], data[row['raw_offset']:row['raw_offset'] + row['raw_size']])
    base = 0x20000000
    machine.mem_map(base, 0x100000)
    game, rows, definition, alternate, keys, frame, stack = [base + value for value in
        (0x1000, 0x10000, 0x30000, 0x31000, 0x32000, 0x40000, 0x70000)]
    seams = {name: address(value) for name, value in contract['seams'].items()}
    start, stop = address(contract['entry']), address(contract['stop'])
    stride, guid_offset, position_offset = [contract[key] for key in ('stride', 'guid_offset', 'position_offset')]
    vector = game + contract['game_vector_offset']
    events = []
    def put(at, fmt, *values): machine.mem_write(at, struct.pack(fmt, *values))
    def get(at, fmt): return struct.unpack(fmt, machine.mem_read(at, struct.calcsize(fmt)))
    def reg(name, value=None):
        key = getattr(x, 'UC_X86_REG_' + name)
        if value is None: return machine.reg_read(key)
        machine.reg_write(key, value)
    def ret():
        sp = reg('RSP'); reg('RIP', get(sp, '<Q')[0]); reg('RSP', sp + 8)
    def hook(_, pc, size, unused):
        if pc == stop:
            machine.emu_stop(); return
        if pc == seams['memcmp']:
            a = bytes(machine.mem_read(reg('RCX'), reg('R8')))
            b = bytes(machine.mem_read(reg('RDX'), reg('R8')))
            reg('RAX', int(a != b)); ret(); return
        if pc == seams['memmove']:
            machine.mem_write(reg('RCX'), bytes(machine.mem_read(reg('RDX'), reg('R8'))))
            reg('RAX', reg('RCX')); ret(); return
        if pc == seams['expiry']:
            events.append(['expiry', reg('RDX'), list(get(reg('R8'), '<fff'))]); ret(); return
        if pc == seams['destroy']:
            events.append(['destroy', reg('RDX')]); ret(); return
        assert any(lo <= pc and pc + size <= hi for lo, hi in ranges), f'Unreviewed instruction {pc:#x}'
        assert bytes(machine.mem_read(pc, size)) == raw(pc, size)
    machine.hook_add(UC_HOOK_CODE, hook)
    cases = []
    limit = contract['limit']
    source = (ROOT / 'crates/azeroth-survivors-re/src/player_abilities/behavior/totems.rs').read_text()
    assert int(re.search(r'pub const KIND_LIMIT: usize = (\d+);', source)[1]) == limit
    assert '.count() < KIND_LIMIT' in source
    assert 'Some(rows.remove(index))' in source
    dispatch = (ROOT / 'crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs').read_text()
    cap_at = dispatch.index('remove_for_kind_limit')
    assert cap_at < dispatch.index('port.expire_totem', cap_at) < dispatch.index('Totem::new', cap_at)
    for key in ('magma_totem', 'searing_totem'):
        other = 'searing_totem' if key == 'magma_totem' else 'magma_totem'
        for count in (0, 1, limit - 2, limit - 1, limit, limit + 1, limit + 17):
            for mixed in (False, True):
                machine.mem_write(base, bytes(0x100000)); events.clear()
                for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15'):
                    reg(name, 0)
                reg('MXCSR', 0x1f80); reg('RBP', frame); reg('RSP', stack)
                put(definition, '<QQ', keys, len(key)); machine.mem_write(keys, key.encode())
                put(alternate, '<QQ', keys + 0x100, len(other)); machine.mem_write(keys + 0x100, other.encode())
                sequence = [alternate, alternate] if mixed else []
                for n in range(count):
                    sequence.append(definition)
                    if mixed and n % 7 == 0: sequence.append(alternate)
                for n, selected in enumerate(sequence):
                    put(rows + n * stride, '<Q', selected)
                    put(rows + n * stride + guid_offset, '<Q', n + 100)
                    put(rows + n * stride + position_offset, '<fff', float(n), -float(n), 11.)
                put(vector, '<QQQ', 200, rows, len(sequence))
                put(frame + contract['definition_stack_offset'], '<Q', definition)
                put(frame + contract['game_stack_offset'], '<Q', game)
                reg('RDI', game); reg('RSI', definition)
                machine.emu_start(start, stop, count=20000)
                expected = list(range(100, 100 + len(sequence)))
                if count >= limit:
                    index = sequence.index(definition); guid = expected.pop(index)
                    assert events == [['expiry', guid, [float(index), -float(index), 11.]], ['destroy', guid]]
                else: assert events == []
                remaining = get(vector + 16, '<Q')[0]
                actual = [get(rows + n * stride + guid_offset, '<Q')[0] for n in range(remaining)]
                assert actual == expected
                cases.append(dict(key=key, existing_same_kind=count, mixed=mixed,
                                  events=list(events), survivor_guids=actual))
    result = dict(target_sha256=target['sha256'], cap_cases=cases,
                  limits=['Immutable cap and stable-removal instructions only; synthetic memory and explicit CRT/callback seams.',
                          'No compilation, client/game/server operation or original/rebuilt parity validation.'])
    path = ROOT / contract['vectors']
    assert path.resolve().is_relative_to(ROOT)
    if mode == 'collect':
        path.parent.mkdir(parents=True, exist_ok=True); write(path, result)
    else:
        assert portable_record(json.loads(path.read_text())) == portable_record(result)
    print(f'Verified {target["version"]} cap contract and {len(cases)} original-instruction cases; no compilation/game launch')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('mode', choices=['prepare', 'collect', 'check'])
    parser.add_argument('--contract', help='Current hash-bound cap/layout/range input')
    args = parser.parse_args()
    if args.contract:
        if args.mode == 'prepare': parser.error('Current contract uses already retained ranges; collect or check it')
        current_cap(args.mode, args.contract)
        return
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.105.0'
    data = (ROOT / target['path']).read_bytes()
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        return data[at:at + size]

    rows = []
    out = RETAINED if args.mode == 'check' else OUT
    if args.mode != 'check':
        WORK.mkdir(parents=True, exist_ok=True)
        out.mkdir(parents=True, exist_ok=True)
    for role, (lo, hi) in RANGES.items():
        blob = raw(lo, hi - lo)
        row = dict(role=role, virtual_address=hex(lo), end_exclusive=hex(hi),
                   file_offset=hex(pe.rva_offset(lo - pe.image_base)), byte_count=len(blob),
                   sha256=hashlib.sha256(blob).hexdigest(), assembly=f'{role}.asm')
        if args.mode == 'prepare':
            if role in GHIDRA:
                (WORK / f'{role}.bin').write_bytes(blob)
                write(WORK / f'{role}-plan.json', dict(
                    target=str((WORK / f'{role}.bin').relative_to(ROOT)),
                    output=str((WORK / f'rea-{role}').relative_to(ROOT)),
                    init_timeout=60, open_timeout=60, timeout=180,
                    open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(lo)),
                    operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(lo)))]))
            continue
        if args.mode == 'collect':
            text = objdump_output(['objdump', '-d', '--no-show-raw-insn',
                f'--start-address={lo:#x}', f'--stop-address={hi:#x}', target['path']],
                cwd=ROOT, text=True)
            (out / row['assembly']).write_text(text)
        if role in GHIDRA:
            if args.mode == 'collect':
                ev = json.loads((WORK / f'rea-{role}/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
                assert ev['subject']['digest']['sha256'] == row['sha256']
                row.update(rea_evidence_id=ev['evidence_id'], provider='Ghidra 12.1.4',
                           analysis_profile_digest=ev['analysis_profile']['digest'],
                           pseudocode=f'{role}.ghidra.c')
                (out / row['pseudocode']).write_text('\n'.join(line.rstrip() for line in ev['normalized_result'].splitlines()).strip() + '\n')
            else:
                row.update({k: v for k, v in next(r for r in json.loads((out / 'manifest.json').read_text())['native_observations'] if r['role'] == role).items()
                            if k in ('rea_evidence_id', 'provider', 'analysis_profile_digest', 'pseudocode')})
        row['text_sha256'] = {name: hashlib.sha256((out / name).read_bytes()).hexdigest()
                              for name in [row['assembly']] + ([row['pseudocode']] if 'pseudocode' in row else [])}
        rows.append(row)
    if args.mode == 'prepare':
        return

    # Reuse the canonical earlier cap extract rather than duplicating it.
    cap = next(r for r in json.loads((ROOT / 'docs/analysis/evidence/0.105.0/game-mode-audit/native-manifest.json').read_text())['native_observations'] if r['role'] == 'totem-kind-cap-branch')
    assert hashlib.sha256(raw(int(cap['virtual_address'], 16), cap['byte_count'])).hexdigest() == cap['sha256']

    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    end = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (end + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    BASE = 0x20000000
    u.mem_map(BASE, 0x80000)
    GAME, ROWS, DEF, OTHER, LEARNED, KEYS = [BASE + n for n in (0x1000, 0x10000, 0x20000, 0x21000, 0x22000, 0x30000)]
    BP, STACK, PACKETS, ALLOC, TARGETS = [BASE + n for n in (0x40000, 0x50000, 0x60000, 0x61000, 0x62000)]
    STOP = BASE + 0x70000
    events, seams = [], {}
    active = []

    def put(a, fmt, *v): u.mem_write(a, struct.pack(fmt, *v))
    def get(a, fmt): return struct.unpack(fmt, u.mem_read(a, struct.calcsize(fmt)))
    def reg(name, value): u.reg_write(getattr(x, 'UC_X86_REG_' + name), value)
    def rr(name): return u.reg_read(getattr(x, 'UC_X86_REG_' + name))
    def ret():
        sp = rr('RSP'); reg('RIP', get(sp, '<Q')[0]); reg('RSP', sp + 8)
    def hook(_, address, size, unused):
        if address in seams:
            seams[address]()
            return
        if address == STOP:
            u.emu_stop(); return
        assert any(lo <= address and address + size <= hi for lo, hi in active), hex(address)
        assert bytes(u.mem_read(address, size)) == raw(address, size), 'Modified native instruction'
    u.hook_add(UC_HOOK_CODE, hook)

    def memcmp():
        a = bytes(u.mem_read(rr('RCX'), rr('R8'))); b = bytes(u.mem_read(rr('RDX'), rr('R8')))
        reg('EAX', int(a != b)); ret()
    def memmove():
        u.mem_write(rr('RCX'), bytes(u.mem_read(rr('RDX'), rr('R8')))); reg('RAX', rr('RCX')); ret()
    def reset():
        u.mem_write(BASE, bytes(0x80000)); events.clear(); seams.clear()
        seams.update({0x145bc9787: memcmp, 0x145bc978d: memmove})
        put(DEF, '<QQ', KEYS, 11); u.mem_write(KEYS, b'magma_totem')
        put(OTHER, '<QQ', KEYS + 0x100, 13); u.mem_write(KEYS + 0x100, b'searing_totem')
        reg('RBP', BP); reg('RSP', STACK); put(STACK, '<Q', STOP)
        for name in ('RBX', 'RDI', 'RSI', 'R12', 'R13', 'R14', 'R15'): reg(name, 0)

    cap_cases = []
    for key, definition in [('magma_totem', DEF), ('searing_totem', OTHER)]:
        for count in (0, 1, 38, 39, 40, 41, 57):
            for mixed in (False, True):
                reset(); sequence = []
                other = OTHER if definition == DEF else DEF
                if mixed: sequence += [other, other]
                for i in range(count):
                    sequence.append(definition)
                    if mixed and i % 7 == 0: sequence.append(other)
                for i, item in enumerate(sequence):
                    put(ROWS + i * 136, '<Q', item)
                    put(ROWS + i * 136 + 104, '<Qfff', i + 100, float(i), -float(i), 11.)
                put(GAME + 0x5a0, '<QQQ', 200, ROWS, len(sequence))
                put(BP + 0x130, '<Q', definition); put(BP + 0x168, '<Q', GAME)
                reg('RDI', GAME); reg('RSI', BASE + 0x800)
                def expired():
                    events.append(['expiry', rr('RDX'), list(get(rr('R8'), '<fff'))]); ret()
                def removed(): events.append(['destroy', rr('RDX')]); ret()
                seams.update({0x145949470: expired, 0x145926f60: removed})
                active[:] = [(0x145921b3e, 0x145921c73), RANGES['vector-remove']]
                u.emu_start(0x145921b3e, 0x145921c73, count=20000)
                expected = list(range(100, 100 + len(sequence)))
                if count >= 40:
                    index = sequence.index(definition); guid = expected.pop(index)
                    assert events == [['expiry', guid, [float(index), -float(index), 11.]], ['destroy', guid]]
                else: assert events == []
                remaining = get(GAME + 0x5b0, '<Q')[0]
                actual = [get(ROWS + i * 136 + 104, '<Q')[0] for i in range(remaining)]
                assert actual == expected
                cap_cases.append(dict(key=key, existing_same_kind=count, mixed=mixed,
                                      events=list(events), survivor_guids=actual))

    expiry_cases = []
    for learned, deadline, now, targets in [(False, 0., 10., 1), (True, 11., 10., 1),
                                           (True, 10., 10., 0), (True, 10., 10., 2),
                                           (True, 9., 10., 1), (True, None, 10., 1),
                                           (True, float('nan'), 10., 1), (True, 0., float('nan'), 1)]:
        reset()
        put(DEF, '<QQ', KEYS, 13); u.mem_write(KEYS, b'call_of_flame')
        put(DEF + 0x44, '<f', 20.); put(DEF + 0x50, '<f', 10.)
        put(LEARNED, '<Q', DEF)
        for at in (0x28, 0x2c, 0x34, 0x44, 0x48, 0x50, 0x5c, 0x64): put(LEARNED + at, '<f', 1.)
        put(GAME + 0x318, '<QQ', LEARNED, int(learned))
        put(GAME + 0x9ec, '<f', now); put(GAME + 0x4a0, '<f', 1.)
        put(GAME + 0x478, '<ff', 100., 1.)
        put(GAME + 0x5d0, '<QQQ', 20, PACKETS, 0)
        if deadline is not None:
            put(GAME + 0x7d8, '<QQ', ROWS, 1); put(ROWS, '<QQf', KEYS, 13, deadline)
        put(BASE + 0x700, '<fff', 5., 8., 13.)
        reg('RCX', GAME); reg('RDX', 0x123456); reg('R8', BASE + 0x700)
        def select():
            radius = struct.unpack('<f', struct.pack('<I', rr('XMM3') & 0xffffffff))[0]
            events.append(['targets', list(get(rr('R8'), '<fff')), radius])
            put(rr('RCX'), '<QQQ', 0, TARGETS, targets); ret()
        def started(): events.append(['begin-passive']); ret()
        def visual():
            events.append(['visual', rr('RDX'), rr('R8')]); put(rr('RCX'), '<QQQQ', 0, 0, 0, 0); ret()
        def hits(): events.append(['hits', rr('R8'), rr('R9')]); ret()
        seams.update({0x145925c80: select, 0x145946220: started,
                      0x1458b5100: visual, 0x145945c10: hits})
        active[:] = [RANGES['expiry']]
        u.emu_start(*RANGES['expiry'], count=1000)
        ready = learned and now >= (-3.4028234663852886e38 if deadline is None else deadline)
        expected = []
        if ready: expected.append(['targets', [5., 8., 13.], 10.])
        if ready and targets: expected += [['begin-passive'], ['visual', 0x123456, 8349], ['hits', 0x123456, 8349]]
        assert events == expected, events
        expiry_cases.append(dict(learned=learned, deadline='NaN' if deadline is not None and deadline != deadline else deadline,
                                 now='NaN' if now != now else now, targets=targets, events=list(events)))

    destroy_cases = []
    for guid in (0, 0x123456, 0xf13000251cfffffe):
        reset(); put(GAME + 0x5d0, '<QQQ', 20, PACKETS, 0)
        reg('RCX', GAME); reg('RDX', guid)
        def allocate(): reg('RAX', ALLOC); ret()
        seams.update({0x140002200: ret, 0x1400021c0: allocate})
        active[:] = [RANGES['remove']]
        u.emu_start(*RANGES['remove'], count=1000)
        count = get(GAME + 0x5e0, '<Q')[0]
        assert count == int(guid != 0)
        if guid:
            assert get(PACKETS + 16, '<QH') == (8, 0xaa)
            assert get(get(PACKETS + 8, '<Q')[0], '<Q')[0] == guid
        destroy_cases.append(dict(guid=guid, packets=count, opcode=0xaa if guid else None))

    cooldown_cases = []
    for base, effect, present in [(5., 1., True), (0., 1., True), (5., 0., True),
                                  (5., 2., True), (5., 1., False)]:
        reset(); put(DEF, '<QQ', KEYS, 13); u.mem_write(KEYS, b'call_of_flame')
        put(DEF + 0x40, '<Iff', 16038, 20., base); put(LEARNED, '<Q', DEF)
        for at in (0x2c, 0x48, 0x64): put(LEARNED + at, '<f', 1.)
        put(LEARNED + 0x5c, '<f', effect)
        put(GAME + 0x318, '<QQ', LEARNED, 1); put(GAME + 0x480, '<f', 1.)
        put(GAME + 0x9ec, '<f', 10.); put(GAME + 0x460, '<Q', 1)
        put(GAME + 0x7d0, '<QQQ', 10, ROWS, int(present))
        if present: put(ROWS, '<QQf', KEYS, 13, 0.)
        put(GAME + 0x5d0, '<QQQ', 20, PACKETS, 0)
        reg('RCX', GAME); reg('RDX', LEARNED)
        def minimum(): reg('XMM0', 0); ret()
        def cooldown_packet():
            events.append(['cooldown', *get(rr('R8'), '<II')])
            put(rr('RCX'), '<QQQQ', 0, 0, 0, 0); ret()
        seams.update({0x145882c60: minimum, 0x1458acb30: cooldown_packet,
                      0x140002200: ret, 0x1400021c0: allocate})
        active[:] = [RANGES['begin-passive']]
        u.emu_start(*RANGES['begin-passive'], count=2000)
        interval = get(LEARNED + 0x24, '<f')[0]
        assert abs(interval - max(base * 1.4, .25) / max(effect, .1)) < .00001
        assert get(GAME + 0x7e0, '<Q')[0] == 1
        assert get(ROWS + 16, '<f')[0] == 10. + interval
        assert events == [['cooldown', 16038, int(interval * 1000.)]]
        assert get(GAME + 0x5e0, '<Q')[0] == 2
        assert get(PACKETS + 32 + 16, '<QH') == (12, 0x135)
        assert get(ALLOC, '<IQ') == (16038, 1)
        cooldown_cases.append(dict(base_cooldown=base, effect_multiplier=effect,
            deadline_preexists=present, interval=interval, packet_order=['cooldown', '0x135']))

    vectors = dict(target_sha256=SHA, cap_cases=cap_cases, expiry_cases=expiry_cases,
        destroy_cases=destroy_cases, cooldown_cases=cooldown_cases,
        limits=['Only immutable selected instruction ranges run under emulation; neither the game nor Rust source is executed.',
                'CRT memcmp/memmove are explicit deterministic seams. Cap callback seams record calls without running nested gameplay.',
                'Expiry target collection, begin-passive, packet construction and multi-hit are explicit seams in expiry cases; their order/arguments are tested. Separate cooldown cases execute begin-passive with an explicit zero key minimum and capture the cooldown-packet constructor.',
                'No build, application/game launch, original/rebuilt comparison or visual parity validation.'])
    manifest = dict(target_sha256=SHA, native_observations=rows,
        cap_extract='../game-mode-audit/native-manifest.json#totem-kind-cap-branch',
        limits=['Ghidra imports unchanged headerless x86-64 function slices. Its raw importer uses a GCC ABI; Windows registers, unmapped external data and external jump tables require PE instruction tracing.',
                'Static recovery and instruction vectors do not establish compiled source, gameplay or presentation parity.'])
    if args.mode == 'collect':
        write(out / 'manifest.json', manifest); write(out / 'native-vectors.json', vectors)
    else:
        assert portable_record(json.loads((out / 'manifest.json').read_text())) == portable_record(manifest)
        assert portable_record(json.loads((out / 'native-vectors.json').read_text())) == portable_record(vectors)
    print(f'Verified selected 0.105.0 target, {len(rows)} native ranges, {len(cap_cases)} cap, {len(expiry_cases)} expiry, {len(destroy_cases)} destroy and {len(cooldown_cases)} cooldown instruction cases; no compilation/game launch')


if __name__ == '__main__':
    main()
