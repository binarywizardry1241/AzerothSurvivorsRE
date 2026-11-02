#!/usr/bin/env python3
"""Check set consumers using bounded original instruction replays and source parsing.

No Rust code, application, game, OS service or server is executed. The native
branches run in Unicorn with synthetic Game/actor/ability records.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path
import platform
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
from discovery_native_subject import verify_native_query_subject

SHA = '22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
WORK = ROOT / 'runtime/set-consumers-0.121.0'
OUTPUT = ROOT / 'docs/analysis/evidence/0.121.0/set-consumers/manifest.json'
SCOPES = ('worn-stats', 'four-gate', 'effect-insertion', 'effect-aggregate',
          'execute', 'crowd-armor', 'set-numeric', 'cooldown-publication',
          'cooldown-filter', 'ground-follow-selector', 'ground-follow-update')


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


SOURCE_ROOT = ROOT

def receipt(path):
    path = ROOT / path
    logical = path.relative_to(SOURCE_ROOT) if path.is_relative_to(SOURCE_ROOT) else path.relative_to(ROOT)
    return {'path': logical.as_posix(), 'sha256': sha(path.read_bytes())}


def queries(image, pe):
    result = []
    for scope in SCOPES:
        base = WORK / scope
        plan = json.loads((base / 'plan.json').read_text())
        subject = json.loads((base / 'input.json').read_text())
        assert subject['target']['sha256'] == SHA
        a, z = (int(subject['range'][key], 16) for key in ('start', 'end'))
        at = pe.rva_offset(a - pe.image_base)
        raw = image[at:at + z - a]
        assert (ROOT / plan['target']).read_bytes() == raw
        journal = json.loads((base / 'query/journal.json').read_text())
        assert journal['status'] == 'completed', scope
        for op in journal['operations'].values():
            assert op['status'] == 'completed'
            saved = json.loads((ROOT / op['result']['path']).read_text())
            native = saved.get('structuredContent') or json.loads(saved['content'][0]['text'])
            row = dict(role=scope, procedure=op['arguments']['procedure'],
                evidence_id=native['evidence_id'], provider=native['provider'],
                analysis_profile_digest=native['analysis_profile']['digest'],
                normalized_text_sha256=sha(native['normalized_result'].encode()),
                raw_input=receipt(plan['target']), slice_virtual_address=hex(a),
                plan=receipt(base / 'plan.json'), journal=receipt(base / 'query/journal.json'),
                result=op['result'])
            verify_native_query_subject(ROOT, native, row, subject['target'], image=image, pe=pe)
            result.append(row)
    return result


class Replay:
    def __init__(self, image, pe):
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
        import unicorn.x86_const as reg
        self.reg = reg
        self.uc = Uc(UC_ARCH_X86, UC_MODE_64)
        self.heap, self.stack = 0x22000000, 0x23000000
        self.uc.mem_map(self.heap, 0x80000)
        self.uc.mem_map(self.stack, 0x20000)
        self.pages, self.steps = set(), 0

        def missing(_uc, _access, address, _size, _value, _context):
            page = address & -0x1000
            if page in self.pages:
                return False
            try:
                at = pe.rva_offset(page - pe.image_base)
            except ValueError:
                return False
            self.uc.mem_map(page, 0x1000)
            self.uc.mem_write(page, image[at:at + 0x1000])
            self.pages.add(page)
            return True

        def hook(_uc, address, _size, _context):
            if address in self.stops:
                self.uc.emu_stop()
                return
            assert any(a <= address < z for a, z in self.ranges), hex(address)
            self.steps += 1

        self.uc.hook_add(UC_HOOK_MEM_UNMAPPED, missing)
        self.uc.hook_add(UC_HOOK_CODE, hook)

    def reset(self):
        self.uc.mem_write(self.heap, bytes(0x80000))
        self.uc.mem_write(self.stack, bytes(0x20000))
        self.uc.reg_write(self.reg.UC_X86_REG_RSP, self.stack + 0x10000)
        self.uc.reg_write(self.reg.UC_X86_REG_RBP, self.stack + 0x12000)

    def write(self, address, fmt, *values):
        self.uc.mem_write(address, struct.pack(fmt, *values))

    def read(self, address, fmt):
        return struct.unpack(fmt, self.uc.mem_read(address, struct.calcsize(fmt)))

    def set(self, name, value):
        self.uc.reg_write(getattr(self.reg, 'UC_X86_REG_' + name), value)

    def xmm(self, index, *values):
        self.set('XMM' + str(index), int.from_bytes(struct.pack('<' + 'f' * len(values), *values), 'little'))

    def run(self, start, stops, ranges):
        self.stops, self.ranges = set(stops), ranges
        self.uc.emu_start(start, 0, count=100000)
        at = self.uc.reg_read(self.reg.UC_X86_REG_RIP)
        assert at in self.stops, hex(at)
        return at


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def replay(image, pe):
    m = Replay(image, pe)
    rows = []
    # Original raw16 action, including odd/even unrolled88-byte learned rows.
    for count in range(11):
        for amount in (.5, .75):
            m.reset()
            game, learned, definitions = m.heap, m.heap + 0x1000, m.heap + 0x10000
            bp = m.stack + 0x12000
            m.set('R12', game)
            m.write(game + 0x378, '<QQ', learned, count)
            m.write(bp + 0x200, '<I', 5308)
            m.write(bp + 0x1e0, '<f', amount)
            expected = []
            for n in range(count):
                primary = 5308 if n % 3 == 0 else 845 + n
                before = f32((n - 2) * .25)
                m.write(learned + n * 88, '<Q', definitions + n * 0x100)
                m.write(definitions + n * 0x100 + 0x40, '<I', primary)
                m.write(learned + n * 88 + 12, '<f', before)
                expected.append(before if primary == 5308 else f32(before - amount))
            m.run(0x145c0de8c, (0x145c0b610,), ((0x145c0de8c, 0x145c0e0fb),))
            actual = [m.read(learned + n * 88 + 12, '<f')[0] for n in range(count)]
            assert actual == expected and m.read(game + 0x1ac, '<B') == (1,)
            rows.append(dict(kind='execute_action', count=count, amount=amount, timers=actual))
    # Actual incoming crowd gate, including the native movement sampler called
    # for the fifth/later candidates. No actor/position helper is replaced.
    cases = [(n, -1, False) for n in range(9)] + [(5, 0, False), (6, 0, False), (5, -1, True)]
    for count, dead, far in cases:
        m.reset()
        game, actors = m.heap, m.heap + 0x10000
        m.set('R14', game)
        m.set('R13', 1)
        m.write(game + 0x51c, '<f', .12)
        m.write(game + 0x5b8, '<QQ', actors, count)
        m.xmm(7, 10.)
        m.xmm(8, 75.)
        m.xmm(9, 1.)
        for n in range(count):
            at = actors + n * 480
            m.write(at + 0xb0, '<B', int(n == dead))
            # Exactly eight yards is admitted; one candidate can be just out.
            m.write(at + 0x188, '<fff', 8.01 if far and n == 0 else 8., 0., 77.)
        m.run(0x145bcde50, (0x145bce15d,),
            ((0x145bcde50, 0x145bce15d), (0x145ade320, 0x145ade3a5)))
        actual = struct.unpack('<f', struct.pack('<I', m.uc.reg_read(m.reg.UC_X86_REG_XMM8) & 0xffffffff))[0]
        admitted = count - int(0 <= dead < count) - int(far) >= 5
        expected = f32(75. * f32(1. - f32(.12))) if admitted else 75.
        assert actual == expected, (count, dead, far, actual, expected)
        rows.append(dict(kind='crowd_gate', count=count, dead=dead, far=far, damage=actual))
    # Actual moving-ground distance gate/stores. Height is an explicit existing
    # engine input seam; stop before allocation/packet construction.
    for enabled in (False, True):
        for x in (0., 1.999, 2., 2.001, 3.):
            m.reset()
            game, ground, bp = m.heap, m.heap + 0x1000, m.stack + 0x12000
            m.set('R12', game)
            m.set('RSI', 0)
            m.set('R13', 0)
            m.write(game + 0x5d0, '<QQ', ground, 1)
            m.write(bp + 0x68, '<fff', x, 0., 33.)
            m.write(bp + 0x88, '<B', enabled)
            m.xmm(6, x, 0.)
            m.xmm(12, 2.)
            m.run(0x145bfd9fe, (0x145bfda5e, 0x145bfdb91), ((0x145bfd9fe, 0x145bfda5e),))
            actual = m.read(ground + 0x2c, '<fff')
            moved = enabled and f32(x) > 2.
            assert actual == ((f32(x), 0., 33.) if moved else (0., 0., 0.))
            rows.append(dict(kind='ground_move', enabled=enabled, x=x, center=actual))
    for bits in (0, 0x80000000, 1, 0x7fffff, 0x800000, 0x3f800000,
                 0xbf800000, 0x7f800000, 0xff800000, 0x7fc00000, 0xffc00000):
        m.reset()
        m.set('RBX', m.heap)
        m.write(m.heap + 12, '<I', bits)
        m.run(0x145c78490, (0x145c784c3,), ((0x145c78490, 0x145c784c3),))
        actual = bool(m.uc.reg_read(m.reg.UC_X86_REG_RAX) & 255)
        value = struct.unpack('<f', struct.pack('<I', bits))[0]
        assert actual == (value > 0. and math.isfinite(value))
        rows.append(dict(kind='cooldown_filter', bits=hex(bits), admitted=actual))
    return dict(cases=rows, original_instruction_steps=m.steps,
        seams=['Synthetic Game, actor, ground and learned-ability records.',
               'Execute action begins after the separately inspected condition/deadline admission.',
               'Moving-ground store gate receives the existing engine position/height result and stops before packet allocation.'])


def main():
    global SOURCE_ROOT
    parser = argparse.ArgumentParser()
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--source-root', type=Path, default=ROOT,
                        help='Scoped source snapshot inside the project for commit review')
    parser.add_argument('--manifest', type=Path, default=OUTPUT)
    args = parser.parse_args()
    SOURCE_ROOT = args.source_root.resolve()
    assert SOURCE_ROOT.is_relative_to(ROOT)
    args.manifest = args.manifest.resolve()
    assert args.manifest.is_relative_to(ROOT)
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.121.0'
    image = target_bytes(target)
    pe = load_script('sets_consumer_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    native = replay(image, pe)
    files = [
        'crates/azeroth-survivors-re/src/run_effects.rs',
        'crates/azeroth-survivors-re/src/gameplay/mechanics.rs',
        'crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs',
        'crates/azeroth-survivors-re/src/gameplay/mechanics/spell_display.rs',
        'crates/azeroth-survivors-re/src/gameplay/mechanics/callbacks.rs',
        'crates/azeroth-survivors-re/src/gameplay/mechanics/incoming.rs',
        'crates/azeroth-survivors-re/src/gameplay/mechanics/passives.rs',
        'crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs',
        'crates/azeroth-survivors-re/src/player_abilities/behavior/incoming.rs',
        'crates/azeroth-survivors-re/src/gameplay/client/events.rs',
    ]
    arch = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin',
            ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    rustfmt = ROOT / '.tools/rust' / ('1.98.1-' + arch[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout', '--config',
                    'skip_children=true', *[str(SOURCE_ROOT / p) for p in files]], cwd=ROOT, stdout=subprocess.DEVNULL, check=True)
    armory_path = 'crates/azeroth-survivors-re/src/armory.rs'
    armory = (SOURCE_ROOT / armory_path).read_text()
    start = '    pub fn effects(&self, catalog: &ArmoryCatalog, class: u8) -> Vec<(u8, f32)> {'
    at = armory.index(start)
    end = '\n    }\n}'
    stop = armory.index(end, at) + len(end)
    scope = dict(path=armory_path, start=start, end=end, include_end=True,
                 sha256=sha(armory[at:stop].encode()))
    assert 'sets::four_piece_tiers(' in armory[at:stop]
    assert 'sets::four_piece_effects(tier)' in armory[at:stop]
    event_path = 'crates/azeroth-survivors-re/src/gameplay/client/events.rs'
    event_text = (SOURCE_ROOT / event_path).read_text()
    event_start = '            RunEvent::GroundMoved {'
    event_end = '            RunEvent::Totem('
    at = event_text.index(event_start)
    stop = event_text.index(event_end, at)
    event_scope = dict(path=event_path, start=event_start, end=event_end, include_end=False,
                       sha256=sha(event_text[at:stop].encode()))
    spans = []
    for a, z in ((0x145c0b628, 0x145c0b6a0), (0x145c0b9a1, 0x145c0ba06),
                 (0x145c0de7a, 0x145c0deff), (0x145c0e097, 0x145c0e0fb),
                 (0x145bcde35, 0x145bce15d), (0x145ade320, 0x145ade3a5),
                 (0x145bfd8a2, 0x145bfd8ab), (0x145bfd9e8, 0x145bfdb19),
                 (0x145c78490, 0x145c784c5), (0x145c02655, 0x145c02689),
                 (0x145c02797, 0x145c027e4), (0x145bd2ab2, 0x145bd2ad5),
                 (0x145bd2d21, 0x145bd2d68), (0x145bd3099, 0x145bd30b6),
                 (0x145c4f090, 0x145c4f276), (0x145b38120, 0x145b3870e),
                 (0x145c7bec0, 0x145c7c01c), (0x147692ddc, 0x147692e18),
                 (0x1476932a4, 0x1476932a8), (0x14619c1e4, 0x14619c1e8),
                 (0x1461989a4, 0x1461989a8)):
        at = pe.rva_offset(a - pe.image_base)
        raw = image[at:at + z - a]
        spans.append(dict(virtual_address=hex(a), file_offset=hex(at), byte_count=len(raw),
                          sha256=sha(raw), bytes_hex=raw.hex()))
    result = dict(target=dict(version='0.121.0', sha256=SHA, size_bytes=len(image)),
        queries=queries(image, pe), replay=native, source_bindings=[receipt(SOURCE_ROOT / p) for p in files if not p.endswith('/gameplay/client/events.rs')],
        native_ranges=spans, source_scope_bindings=[scope, event_scope],
        generator=receipt(__file__), compilation='not_run', source_executed=False,
        application_executed=False, parity_verified=False,
        limits=['Raw slices omit external code/data except bytes lazily read by isolated original instructions.',
                'Computed-switch decompilation is incomplete; exact table/branch bytes govern the selected consumers.',
                'Source syntax parsing is not type checking, compilation or application execution.',
                'Player input prediction, terrain, engine object update and original/rebuilt presentation are not executed.'])
    encoded = json.dumps(result, indent=2) + '\n'
    if args.write:
        args.manifest.parent.mkdir(parents=True, exist_ok=True)
        args.manifest.write_text(encoded)
    else:
        assert args.manifest.read_text() == encoded, 'Set-consumer proof drift; review before --write'
    print(json.dumps(dict(native_cases=len(native['cases']), original_instruction_steps=native['original_instruction_steps'],
        queries=len(result['queries']), syntax_parsed=len(files), compilation='not_run', source_executed=False)))


if __name__ == '__main__':
    main()
