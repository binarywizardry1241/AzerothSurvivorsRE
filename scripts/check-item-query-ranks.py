#!/usr/bin/env python3
"""Replay current item-query rank selection and inspect stat/flavor field routing.

Only isolated original instructions execute. Frozen Game records and persistent
star rows are synthetic; no application, source binary, compiler or server runs.
"""
import argparse
import hashlib
import json
import math
from pathlib import Path
import platform
import struct
import subprocess

from artifact_history import read_artifact
from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

SHA = '22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150'
ARCHIVED_OUTPUT = ROOT / 'docs/analysis/evidence/0.121.0/item-set-publication/item-query-ranks.json'
OUTPUT = ROOT / 'docs/analysis/evidence/item-set-publication/item-query-ranks.json'


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


SOURCE_ROOT = ROOT

def receipt(path):
    path = ROOT / path
    logical = path.relative_to(SOURCE_ROOT) if path.is_relative_to(SOURCE_ROOT) else path.relative_to(ROOT)
    return dict(path=logical.as_posix(), sha256=sha(read_artifact(path)))


def replays(image, pe):
    from unicorn import UC_HOOK_CODE
    base = load_script('set_consumer_replay', ROOT / 'scripts/check-set-consumers.py')
    m = base.Replay(image, pe)
    cases, seam_calls, round_calls = [], [], []
    state = {}

    def stub(_uc, address, _size, _context):
        if address == 0x145febc75:
            assert state['kind'] == 'health'
            bits = m.uc.reg_read(m.reg.UC_X86_REG_XMM0) & 0xffffffff
            value = struct.unpack('<f', struct.pack('<I', bits))[0]
            rounded = math.copysign(math.floor(abs(value) + .5), value) if math.isfinite(value) else value
            m.xmm(0, rounded)
            round_calls.append(bits)
            sp = m.uc.reg_read(m.reg.UC_X86_REG_RSP)
            m.set('RIP', m.read(sp, '<Q')[0])
            m.set('RSP', sp + 8)
            return
        if address != 0x145bad070:
            return
        assert state['kind'] == 'dispatch'
        assert m.uc.reg_read(m.reg.UC_X86_REG_RCX) == m.heap + 0x10
        hero = m.uc.reg_read(m.reg.UC_X86_REG_RDX)
        requested = m.read(m.uc.reg_read(m.reg.UC_X86_REG_R8), '<I')[0]
        seam_calls.append((hero, requested))
        rank = state['frozen']
        m.set('RAX', int(rank is not None))
        m.set('RDX', rank or 0)
        sp = m.uc.reg_read(m.reg.UC_X86_REG_RSP)
        m.set('RIP', m.read(sp, '<Q')[0])
        m.set('RSP', sp + 8)

    m.uc.hook_add(UC_HOOK_CODE, stub)
    for size in (0, 1, 2, 3, 4, 5):
        m.reset()
        payload = bytes.fromhex('1122334455')[:size]
        m.uc.mem_write(m.heap + 0x4000, payload)
        m.set('R12', size)
        m.set('R14', m.heap + 0x4000)
        m.run(0x145b0f822, (0x145b0ffa5,), ((0x145b0f580, 0x145b112ae),))
        requested = int.from_bytes(payload[:4].ljust(4, b'\0'), 'little')
        assert m.uc.reg_read(m.reg.UC_X86_REG_R14) == requested
        cases.append(dict(kind='request_prefix', payload_hex=payload.hex(), requested=requested))
    # Full local lookup prefix, including the19 unrolled race/ID comparisons.
    # Stop before the unrelated runtime finalization callback on either result.
    for race in (1, 2, 5, 6, 8, 11):
        for slot in range(19):
            for pvp in (False, True):
                m.reset()
                game, request = m.heap, m.heap + 0x2000
                item = 101050 if pvp else 101000
                displayed = item + 10 if pvp and race in (2, 5, 6, 8) else item
                m.set('RCX', game)
                m.set('R8', request)
                m.write(game + 0x355, '<B', race)
                m.write(game + 0x300 + slot * 4, '<I', item)
                m.write(game + 0x35c + slot, '<B', slot % 6)
                m.write(request, '<I', displayed)
                at = m.run(0x145bad0b4, (0x145badbd1, 0x145bade86),
                           ((0x145bad0b4, 0x145badbd1),))
                assert at == 0x145badbd1
                assert m.uc.reg_read(m.reg.UC_X86_REG_R15) & 255 == slot % 6
                cases.append(dict(kind='frozen_slot', race=race, slot=slot,
                                  requested=displayed, rank=slot % 6))
    for race, requested, expected in ((1, 101060, None), (1, 101050, 0),
            (1, 0, None), (1, 109000, None), (2, 101050, None), (2, 101060, 0)):
        m.reset()
        m.set('RCX', m.heap)
        m.set('R8', m.heap + 0x2000)
        m.write(m.heap + 0x355, '<B', race)
        m.write(m.heap + 0x300, '<II', 101050, 101050)
        m.write(m.heap + 0x35c, '<BB', 0, 5)
        m.write(m.heap + 0x2000, '<I', requested)
        at = m.run(0x145bad0b4, (0x145badbd1, 0x145bade86),
                   ((0x145bad0b4, 0x145badbd1),))
        result = (m.uc.reg_read(m.reg.UC_X86_REG_R15) & 255) if at == 0x145badbd1 else None
        assert result == expected
        cases.append(dict(kind='frozen_first_or_miss', race=race, requested=requested, rank=result))
    # Packet-handler prefix: the independently replayed frozen-lookup boundary
    # returns an explicit Option<u8>. Test Some(0), misses, canonical PvP save
    # lookup, and remote route guards without executing another hero runtime.
    configurations = [
        dict(remote=False, frozen=0, requested=101050, saved=[(101050, 5)], expected=0),
        dict(remote=False, frozen=3, requested=101050, saved=[(101050, 5)], expected=3),
        dict(remote=False, frozen=None, requested=101060, saved=[(101050, 5)], expected=5),
        dict(remote=False, frozen=None, requested=101050, saved=[], expected=0),
        dict(remote=False, frozen=None, requested=101050, saved=[(101000, 1), (101050, 4), (101100, 2)], expected=4),
        dict(remote=False, frozen=None, requested=101050, saved=[(101000, 1), (101100, 2)], expected=0),
        dict(remote=False, frozen=3, requested=101050, saved=[(101050, 5)], absent=True, expected=5),
        dict(remote=True, frozen=0, requested=101050, saved=[(101050, 5)], expected=0),
        dict(remote=True, frozen=4, requested=101060, saved=[(101050, 5)], expected=4),
        dict(remote=True, frozen=None, requested=101050, saved=[(101050, 5)], expected=0),
    ]
    configurations += [dict(remote=True, frozen=4, requested=101050, saved=[(101050, 5)],
                            invalid=invalid, expected=0) for invalid in ('route', 'index', 'peer', 'game')]
    for case in configurations:
        m.reset()
        state.update(kind='dispatch', frozen=case['frozen'])
        before = len(seam_calls)
        app, bp, peers, saved = m.heap, m.stack + 0x12000, m.heap + 0x2000, m.heap + 0x4000
        m.set('RSI', app)
        m.set('RBX', int(case['remote']))
        m.set('R13', int(case.get('invalid') == 'index'))
        m.set('R14', case['requested'])
        m.set('R12', 0)
        m.write(bp + 0x2cc, '<I', case['requested'])
        m.write(app + 0x10, '<I', 2 if case.get('absent') or case.get('invalid') == 'game' else 0)
        m.write(app + 0xd48, '<I', 0 if case.get('invalid') == 'route' else 3)
        m.write(app + 0xd80, '<QQ', peers, 1)
        m.write(peers, '<QQ', 0 if case.get('invalid') == 'peer' else 1, 7)
        m.write(app + 0x12b0, '<QQ', saved, len(case['saved']))
        for n, (item, rank) in enumerate(case['saved']):
            m.write(saved + n * 8, '<IB3x', item, rank)
        m.run(0x145b0ffa5, (0x145b107f1,),
              ((0x145b0ffa5, 0x145b100c4), (0x145b107ba, 0x145b107f1), (0x145bad070, 0x145bad071)))
        assert m.uc.reg_read(m.reg.UC_X86_REG_R12) == case['expected'], case
        called = len(seam_calls) - before
        assert called == int(not case.get('absent') and not case.get('invalid'))
        if called:
            assert seam_calls[-1] == (7 if case['remote'] else 0, case['requested'])
        cases.append(dict(kind='rank_dispatch', **case, frozen_calls=called))
    # The actual flavor prefix selects its localized key and argument vector.
    # Capture before the common string formatter rather than replacing it.
    def read(address, size):
        if address >= pe.image_base:
            at = pe.rva_offset(address - pe.image_base)
            return image[at:at + size]
        return bytes(m.uc.mem_read(address, size))

    for rank in (0, 1, 3, 5):
        m.reset()
        m.set('R12', rank)
        m.write(m.stack + 0x12000 + 0x2ef, '<B', rank)
        m.run(0x145b108ee, (0x145b1097e, 0x145b10c8f),
              ((0x145b108ee, 0x145b1097e), (0x145b10c6b, 0x145b10c8f)))
        key = read(m.uc.reg_read(m.reg.UC_X86_REG_RDX), m.uc.reg_read(m.reg.UC_X86_REG_R8)).decode()
        assert key == ('item.upgraded' if rank else 'item.not_upgraded')
        pointer = m.uc.reg_read(m.reg.UC_X86_REG_R9)
        count = m.read(m.uc.reg_read(m.reg.UC_X86_REG_RSP) + 0x20, '<Q')[0]
        arguments = {}
        for n in range(count):
            name, length, value, _formatter = struct.unpack('<QQQQ', read(pointer + n * 32, 32))
            arguments[read(name, length).decode()] = read(value, 1)[0]
        assert arguments == (dict(n=rank, of=5) if rank else dict(of=5))
        cases.append(dict(kind='flavor_key', rank=rank, key=key, arguments=arguments))
    # The same projected effect vector also supplies health, independently of
    # formatted equip lines. Native rounds each tag2 row and wraps its i32 sum.
    health_vectors = [[], [(2, 100.)], [(2, 100.5), (0, .2)],
        [(0, .2), (2, 100.5), (2, 10.5)], [(2, -.5), (2, 1.5)],
        [(2, float('nan')), (2, 12.)], [(2, float('inf'))],
        [(2, -float('inf'))], [(2, 2147483648.), (2, 1.)]]
    for vector in health_vectors:
        m.reset()
        state['kind'] = 'health'
        bp, effects = m.stack + 0x12000, m.heap + 0x4000
        m.set('R15', effects)
        m.set('RDI', 0)
        m.write(bp + 0x2d8, '<Q', len(vector))
        expected = 0
        for n, (tag, value) in enumerate(vector):
            m.write(effects + n * 8, '<If', tag, value)
            value = base.f32(value)
            if tag != 2:
                continue
            if math.isnan(value):
                amount = 0
            elif value >= 2147483648.:
                amount = 2147483647
            elif value <= -2147483648.:
                amount = -2147483648
            else:
                amount = int(math.copysign(math.floor(abs(value) + .5), value))
            expected = (expected + amount) & 0xffffffff
        m.run(0x145b110bd, (0x145b111b1,),
              ((0x145b110bd, 0x145b111b1), (0x145febc75, 0x145febc76)))
        actual = m.uc.reg_read(m.reg.UC_X86_REG_RDI) & 0xffffffff
        assert actual == expected, (vector, actual, expected)
        cases.append(dict(kind='projected_health', native_rows_hex=bytes(m.uc.mem_read(effects, len(vector) * 8)).hex(),
                          health_bits=hex(actual)))
    return dict(cases=cases, original_instruction_steps=m.steps - len(seam_calls) - len(round_calls),
        seams=['Synthetic frozen Game equipment/race/star fields and persistent sorted star rows.',
               'Handler replay substitutes only145bad070 with explicit Option<u8>; its local nineteen-slot prefix is replayed independently.',
               'Frozen lookup stops before145bc5e90 runtime finalization; flavor selection stops before shared localization/string allocation.',
               'Only the imported roundf call is supplied for health-row conversion; original conversion/saturation/summing instructions execute.'])


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
    assert target['sha256'] == SHA
    image = target_bytes(target)
    pe = load_script('item_query_rank_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    publication = load_script('item_query_publication', ROOT / 'scripts/check-item-set-publication.py')
    queries = [publication.query(scope) for scope in ('item-query', 'item-query-rank', 'item-query-lines')]
    for row in queries:
        verify_native_query_subject(ROOT, publication.native_result(ROOT / row['result']['path']),
                                    row, target, image=image, pe=pe)
    assert (0x145b0f580 - pe.image_base, 0x145b1243d - pe.image_base) in [(a, z) for a, z, _ in pe.functions()]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    at = pe.rva_offset(0x145b0f580 - pe.image_base)
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    md.skipdata = True
    instructions = {i.address: (i.mnemonic, i.op_str) for i in md.disasm(image[at:at + 0x1d2e], 0x145b0f580)}
    anchors = {
        0x145b107ff: ('call', '0x145b01970'),
        0x145b10861: ('call', '0x145affe20'),
        0x145b1087b: ('mov', 'edx, r14d'),
        0x145b1087e: ('mov', 'r8d, r12d'),
        0x145b10881: ('call', '0x145aff210'),
        0x145b108b0: ('mov', 'rax, qword ptr [rbp + 0x280]'),
        0x145b108b7: ('mov', 'qword ptr [rdi + 0x10], rax'),
        0x145b108bb: ('movups', 'xmm0, xmmword ptr [rbp + 0x270]'),
        0x145b108c2: ('movups', 'xmmword ptr [rdi], xmm0'),
        0x145b108e8: ('call', '0x145c6eb70'),
        0x145b111bf: ('mov', 'r12, qword ptr [rbp + 0x130]'),
        0x145b111c6: ('mov', 'rax, qword ptr [rbp + 0x138]'),
        0x145b1125e: ('mov', 'qword ptr [rbp + 0x290], r12'),
        0x145b1126c: ('mov', 'qword ptr [rbp + 0x298], rcx'),
        0x145b1124a: ('mov', 'dword ptr [rbp + 0x2c0], edi'),
        0x145b11284: ('call', '0x145b81a20'),
    }
    for address, expected in anchors.items():
        assert instructions[address] == expected
    table = 0x1476642f8
    cell = pe.rva_offset(table - pe.image_base) + (0x56 - 0x4b) * 4
    assert table + struct.unpack_from('<i', image, cell)[0] == 0x145b0f822
    # The equip-line mapper's health arm is None; health is serialized through
    # the separate rounded/saturated accumulator exercised above.
    line_table = 0x1476623e8
    at = pe.rva_offset(line_table - pe.image_base) + 2 * 4
    assert line_table + struct.unpack_from('<i', image, at)[0] == 0x145af3c77
    at = pe.rva_offset(0x145af3c77 - pe.image_base)
    assert next(md.disasm(image[at:at + 11], 0x145af3c77)).op_str == 'qword ptr [rsi], 0xffffffffffffffff'
    reused = []
    for name, role in [('affixes/manifest.json', 'again-command-dispatch'),
                       ('gear-purchase.json', 'star-purchase-0x145ab44d0')]:
        path = ROOT / 'docs/analysis/evidence/0.121.0' / name
        proof = json.loads(read_artifact(path))
        assert proof['target']['sha256'] == SHA
        row = next(row for row in proof['queries'] if row['role'] == role)
        verify_native_query_subject(ROOT, publication.native_result(ROOT / row['result']['path']),
                                    row, target, image=image, pe=pe)
        reused.append(dict(proof=receipt(path), query_role=role))
    files = ['crates/azeroth-survivors-re/src/gameplay/client/inventory.rs',
             'crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs',
             'crates/azeroth-survivors-re/src/gameplay/coop_commands.rs']
    source = (SOURCE_ROOT / files[0]).read_text()
    for text in ('game.item_star_rank(entry)', 'menu.backend_save.star_count(entry)',
                 'let definition = definition(&armory, &labels, entry, stars)',
                 'let item = definition(armory, &display.labels, entry, stars)',
                 '.effects_at_stars(stars)', '"item.not_upgraded"', '"item.upgraded"'):
        assert text in source, text
    assert 'hero.item_star_rank(entry)' in (SOURCE_ROOT / files[2]).read_text()
    arch = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin',
            ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    rustfmt = ROOT / '.tools/rust' / ('1.98.1-' + arch[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true', *[str(SOURCE_ROOT / p) for p in files]],
                   cwd=ROOT, stdout=subprocess.DEVNULL, check=True)
    replay = replays(image, pe)
    ranges = []
    for a, z in ((0x145bad09c, 0x145badbd1), (0x145b0ff6d, 0x145b100c4),
                 (0x145b107ba, 0x145b10984), (0x145b10c6b, 0x145b10c95),
                 (0x145b110bd, 0x145b111b1), (0x147664324, 0x147664328),
                 (0x145c6eb70, 0x145c6ecf3), (0x1476623f0, 0x1476623f4),
                 (0x145af3c77, 0x145af3c83), (0x145b0f822, 0x145b0f842),
                 (0x145b0fcd3, 0x145b0fcdc)):
        at = pe.rva_offset(a - pe.image_base)
        raw = image[at:at + z - a]
        ranges.append(dict(virtual_address=hex(a), file_offset=hex(at), byte_count=len(raw),
                           sha256=sha(raw), bytes_hex=raw.hex()))
    result = dict(schema_version=1, gap_ids=[230, 234],
        target={key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
        queries=queries, reused_proofs=reused, native_ranges=ranges, replay=replay,
        reused_response_extract='docs/analysis/evidence/0.121.0/item-set-publication/manifest.json:0x145b111b1..0x145b11289',
        source_bindings=[receipt(SOURCE_ROOT / p) for p in files], generator=receipt(__file__),
        compilation='not_run', source_executed=False, application_executed=False, parity_verified=False,
        limits=['Packet-handler owning unwind range ends145b1243d; the retained raw query slice covers the selected prefix/response branch through145b112ae, not the whole handler.',
                'Remote hero state swap and general networking are existing separately owned boundaries, not executed by these cases.',
                'Projection/line formatter/serializer calls and flavor pointer/length stores are inspected; no game, Rust code or item-query wire exchange executes.'])
    encoded = json.dumps(result, indent=2) + '\n'
    if args.write:
        args.manifest.parent.mkdir(parents=True, exist_ok=True)
        args.manifest.write_text(encoded)
    else:
        retained = ARCHIVED_OUTPUT if args.manifest == OUTPUT and not OUTPUT.is_file() else args.manifest
        assert read_artifact(retained).decode() == encoded, 'Item-query rank proof drift; review before --write'
    print(json.dumps(dict(cases=len(replay['cases']), original_instruction_steps=replay['original_instruction_steps'],
                          queries=len(queries), reused_proofs=len(reused), syntax_parsed=len(files), compilation='not_run')))


if __name__ == '__main__':
    main()
