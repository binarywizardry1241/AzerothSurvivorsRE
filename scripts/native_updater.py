#!/usr/bin/env python3
"""Bind current updater state/lifecycle contracts without a build, game or network.

--prepare writes project-local raw-function REA/Ghidra plans. Run only the
required plans with scripts/rea-batch.py, then --collect stages compact evidence.
--check rehashes retained evidence and replays only the declared instruction
intervals with Unicorn. No native callee, OS, HTTP or updater adapter executes.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import subprocess
import sys

from coverage_common import latest_target

ROOT = Path(__file__).resolve().parents[1]
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
WORK = ROOT / 'runtime/updater-0.105.0'
STAGED = ROOT / 'runtime/native-evidence/0.105.0/updater'
RETAINED = ROOT / 'docs/analysis/evidence/0.105.0/updater'
OWNERS = {
    'gate': 0x140080fa0, 'download-schema': 0x14007ef40,
    'latest-schema': 0x14007f4d0, 'data-schema': 0x14007fd20,
    'patch-schema': 0x140151770, 'version': 0x140080cb0,
    'check-prepare': 0x14007a040, 'check': 0x140248550,
    'start': 0x14007b2e0, 'apply': 0x14007a830,
    'stage': 0x140249350, 'download': 0x140080200,
    'dialog-body': 0x1400b7ef0, 'ui-body-rebuild': 0x1400c2b90,
    'input': 0x1400c3c40, 'banner': 0x1400c3070,
    'modal': 0x1400c4420, 'ready': 0x1400c5b80,
    'progress': 0x1400c5db0, 'frontend-keyboard': 0x140059aa0,
    'frontend-events': 0x14005b9d0,
}
# One canonical extract for each selected interval. The already retained frontend
# initialization remains in terminal/return-routing-manifest.json.
SPANS = {
    'modal-state': (0x1400c4521, 0x1400c453f),
    'modal-menu-gate': (0x1400c49c9, 0x1400c49e7),
    'banner-state': (0x1400c3150, 0x1400c315b),
    'banner-menu-gate': (0x1400c3181, 0x1400c31b0),
    'entering-tag': (0x140059bbf, 0x140059bd2),
    'world-entry-menu-gate': (0x14005cb57, 0x14005cb7b),
    'return-menu-gate': (0x14005d7e9, 0x14005d7fe),
    'actions-table-path': (0x1400c4199, 0x1400c41fe),
    'actions-sparse-path': (0x1400c4399, 0x1400c43fe),
    'ready-delay': (0x1400c5bf2, 0x1400c5c6a),
    'body-category': (0x1400c2c1b, 0x1400c2c4b),
    'start-admission': (0x14007b312, 0x14007b374),
    'start-regate': (0x14007b374, 0x14007b39c),
    'auto-install-value': (0x140248c42, 0x140248cd9),
    'patch-name-rule': (0x140151a70, 0x140151abc),
    'dialog-dispatch': (0x1400b7f6d, 0x1400b7f99),
    'dialog-state-headings': (0x1400b7f99, 0x1400b815e),
    'failure-buttons': (0x1400b904c, 0x1400b909e),
    'available-buttons': (0x1400ba061, 0x1400ba0b3),
    'download-agent-and-open': (0x140080239, 0x1400803a5),
    'download-size-and-hash-result': (0x140080933, 0x140080998),
    'stage-failed-publication': (0x14024995b, 0x140249980),
    'stage-ready-publication': (0x1402499d6, 0x1402499fc),
}


def save(path, value):
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + '\n')


def save_vectors(path, value):
    # The positional case columns are explained by the replay above. Keep one
    # vector per line instead of expanding every scalar into another source row.
    fields = {key: item for key, item in value.items() if key != 'cases'}
    lines = [json.dumps(fields, indent=2)[:-2] + ',\n  "cases": {']
    groups = list(value['cases'].items())
    for index, (key, rows) in enumerate(groups):
        lines.append('    ' + json.dumps(key) + ': [')
        lines.extend('      ' + json.dumps(row) + (',' if at + 1 < len(rows) else '')
                     for at, row in enumerate(rows))
        lines.append('    ]' + (',' if index + 1 < len(groups) else ''))
    lines.extend(['  }', '}'])
    path.write_text('\n'.join(lines) + '\n')


def digest(value):
    return hashlib.sha256(value).hexdigest()


def native_vectors(pe):
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as r
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + s['raw_size'] for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section['rva'], pe.data[
            section['raw_offset']:section['raw_offset'] + section['raw_size']])
    scratch, scratch_size = 0x200000000, 0x10000
    machine.mem_map(scratch, scratch_size)
    context, updater, bp, tick, timer, clock = [scratch + n for n in
                                              (0x100, 0x200, 0x3000, 0x4000, 0x5000, 0x6000)]
    policy = {}

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        return pe.data[at:at + size]

    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack(fmt, *values))

    def reg(name, value):
        machine.reg_write(getattr(r, 'UC_X86_REG_' + name), value)

    def read(name):
        return machine.reg_read(getattr(r, 'UC_X86_REG_' + name))

    def hook(_, address, size, unused):
        if address in policy['stops']:
            machine.emu_stop()
            return
        assert any(a <= address and address + size <= b for a, b in policy['ranges']), hex(address)
        assert bytes(machine.mem_read(address, size)) == raw(address, size)
        if address in policy.get('start_calls', ()):
            policy['started'] = True
            reg('RIP', address + size)

    def write(_, access, address, size, value, unused):
        assert scratch <= address and address + size <= scratch + scratch_size

    machine.hook_add(UC_HOOK_CODE, hook)
    machine.hook_add(UC_HOOK_MEM_WRITE, write)

    def run(start, stops, ranges, start_calls=()):
        policy.update(stops=set(stops), ranges=ranges, start_calls=start_calls, started=False)
        machine.emu_start(start, 0, count=128)
        stopped = read('RIP')
        assert stopped in policy['stops'], f'Instruction budget exhausted: {stopped:#x}'
        return stopped

    def reset():
        machine.mem_write(scratch, bytes(scratch_size))
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'RSP',
                     'R12', 'R13', 'R14', 'R15'):
            reg(name, 0)
        reg('RBP', bp)
        reg('RSP', bp + 0x1000)

    cases = {'modal': [], 'banner': [], 'actions': [], 'lifecycle': [], 'ready': [], 'patch_name': []}
    for state in range(5):
        for dismissed in (False, True):
            for mode in (0, 1):
                for enabled in (False, True):
                    reset()
                    put(context, '<I', mode)
                    put(context + 13, '<B', enabled)
                    put(updater + 16, '<B', dismissed)
                    put(bp - 0x58, '<Q', state)
                    reg('R14', updater)
                    reg('RBX', context)
                    run(0x1400c4521, [0x1400c453f],
                        [SPANS['modal-state'], SPANS['modal-menu-gate']])
                    actual = bool(read('RAX') & 0xff)
                    expected = state in (2, 3) or (state in (1, 4) and not dismissed and mode == 0 and enabled)
                    assert actual == expected, (state, dismissed, mode, enabled, actual)
                    cases['modal'].append([state, dismissed, mode, enabled, actual])
                    for version_present in (False, True):
                        reset()
                        reg('RAX', state)
                        admitted = run(0x1400c3150, [0x1400c315b, 0x1400c31a7],
                                       [SPANS['banner-state']]) == 0x1400c315b
                        put(context, '<I', mode)
                        put(context + 13, '<B', enabled)
                        put(updater + 16, '<B', dismissed)
                        reg('RSI', context)
                        reg('RDI', updater)
                        reg('RDX', 0 if version_present else (1 << 64) - 1)
                        run(0x1400c3181, [0x1400c31b0], [SPANS['banner-menu-gate']])
                        actual = admitted and bool(read('RAX') & 0xff)
                        expected = state in (1, 4) and version_present and dismissed and mode == 0 and enabled
                        assert actual == expected
                        cases['banner'].append([state, dismissed, mode, enabled, version_present, actual])
    for path, start, end, done, call in (
        ('table', 0x1400c4199, 0x1400c41fe, 0x1400c405d, 0x1400c41d1),
        ('sparse', 0x1400c4399, 0x1400c43fe, 0x1400c4264, 0x1400c43d1),
    ):
        for interaction in range(3):
            for action in range(3):
                reset()
                put(context, '<B', action)
                put(context + 1, '<B', interaction)
                put(updater + 16, '<B', 1)
                put(bp + 0x1000 + 0x58, '<Q', updater)
                put(bp + 0x1000 + 0x68, '<Q', tick)
                put(bp + 0x1000 + 0x54, '<I', 77)
                reg('RCX', context)
                reg('RDX', context + 1)
                run(start, [done], [(start, end)], start_calls=[call])
                dismissed = bool(machine.mem_read(updater + 16, 1)[0])
                started = policy['started']
                assert started == (interaction == 0 and action == 0)
                assert dismissed == (interaction != 0 or action != 2)
                cases['actions'].append([path, interaction, action, started, dismissed])
    for custom in (False, True):
        reset()
        put(context + 12, '<B', custom)
        put(context + 13, '<B', custom)
        put(context, '<I', 1)
        put(bp + 0x100, '<Q', context)
        put(bp + 0x108, '<Q', tick)
        put(bp + 0x16c, '<I', 77)
        run(0x14005cb57, [0x14005cb7b], [SPANS['world-entry-menu-gate']])
        assert struct.unpack('<I', machine.mem_read(context, 4))[0] == 0
        assert machine.mem_read(context + 13, 1)[0] == 0
        cases['lifecycle'].append(['world-entry', custom, 0, False])
        reg('RDX', tick)
        reg('R8D', 77)
        run(0x14005d7e9, [0x14005d7fe], [SPANS['return-menu-gate']])
        assert bool(machine.mem_read(context + 13, 1)[0]) == custom
        cases['lifecycle'].append(['return', custom, 0, custom])
    for mode in (0, 1):
        reset()
        put(context, '<I', mode)
        reg('R14', context)
        run(0x140059bbf, [0x140059bd2], [SPANS['entering-tag']])
        assert struct.unpack('<I', machine.mem_read(context, 4))[0] == 1
        cases['lifecycle'].append(['entering', mode, 1])
    for state, has_deadline, deadline, now in ((3, 0, 0., 0.), (3, 1, 1.2, 1.),
        (3, 1, 1.2, 1.2), (3, 1, 1.2, 2.), (2, 1, 1.2, 2.), (4, 1, 1.2, 2.)):
        reset()
        put(clock + 0x5c, '<f', now)
        put(timer, '<If', has_deadline, deadline)
        reg('EBX', state)
        reg('R15', clock)
        reg('R12', timer)
        reg('R13', tick)
        reg('R14D', 77)
        stopped = run(0x1400c5bf2, [0x1400c5c22, 0x1400c5c56], [SPANS['ready-delay']])
        apply = stopped == 0x1400c5c56
        assert apply == (state == 3 and has_deadline == 1 and now >= deadline)
        if state != 3:
            assert struct.unpack('<I', machine.mem_read(timer, 4))[0] == 0
        elif not has_deadline:
            assert bytes(machine.mem_read(timer, 8)) == struct.pack('<If', 1, now + 1.2)
        cases['ready'].append([state, has_deadline, deadline, now, apply])
    for name in ('patch-0.mpq', 'patch-a.mpq', 'patch-z.mpq', 'patch-_.mpq',
                 'patch-aa.mpq', 'patch.mpq', '../patch-a.mpq', 'patch-a.mpq ', 'other-a.mpq'):
        reset()
        encoded = name.encode()
        machine.mem_write(context, encoded)
        reg('RCX', context)
        reg('R13', len(encoded))
        stopped = run(0x140151a70, [0x140151abc, 0x140151b6c], [SPANS['patch-name-rule']])
        accepted = stopped == 0x140151abc
        assert accepted == (name in ('patch-0.mpq', 'patch-a.mpq', 'patch-z.mpq'))
        cases['patch_name'].append([name, accepted])
    return dict(target_sha256=SHA, method='Unchanged selected x86_64 instructions with explicit stopped/recorded call seams',
                application_executed=False, native_callees_executed=False, cases=cases,
                case_count=sum(len(rows) for rows in cases.values()))


def source_trace():
    source = (ROOT / 'crates/azeroth-survivors-re/src/update_ui.rs').read_text()
    compact = ''.join(source.split())
    for value in ('fn from_frontend(', 'mode: entering as u32',
                  'menus_enabled: !stock_frontend && !in_run', '.add_systems(PreUpdate, sync_context)',
                  'sync_context, rebuild, rebuild_body, animate, refresh_progress,',
                  '.after(crate::gameplay::RunSet::Input)', 'menu.entering', 'menu.in_run',
                  'stock_frontend.is_some()', 'Act::Later => state.dismissed = true',
                  'Act::Reopen => state.dismissed = false'):
        assert ''.join(value.split()) in compact, value
    worker = (ROOT / 'crates/azeroth-survivors-re/src/update_worker.rs').read_text()
    assert 'Self::Downloading { .. } | Self::Ready(_) => true' in worker
    assert 'State::Available(p) | State::Failed { plan: p, .. } => p.clone()' in worker
    assert 'Downloading { .. } | State::Ready(_)' in source
    assert 'Act::Cancel' not in source
