#!/usr/bin/env python3
"""Replay bounded original race-purchase/admission instructions; no build/game.

--stage preserves compact evidence after review. Allocation, string formatting
and translation are explicit fixture seams; Rust and UI/network/file code never
execute. Complete validator/perk/achievement accounting and rendered UI retain
their separate proof limits.
"""
from portable_paths import portable_json
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
               str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as r

HERE = ROOT / 'docs/analysis/evidence/race-rewards'
SHA = '291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08'
NEW = [('race-toggle', 0x1401b740b, 0x1401b74a8),
       ('race-toggle-assignment', 0x1401b782d, 0x1401b78ff),
       ('remote-hero-domain-and-pick', 0x145aa97a0, 0x145aa98fd),
       ('unopened-class-labels', 0x14011dd50, 0x14011dfb9),
       ('race-card-body', 0x14032a0d0, 0x14032ad00)]


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def derive(stage, queries):
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    image = target_bytes(target)
    pe = load_script('race_rewards_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    md.detail = True
    ranges = []
    for name, start, end in NEW:
        at = pe.rva_offset(start - pe.image_base)
        raw = image[at:at + end - start]
        ins = list(md.disasm(raw, start))
        assert sum(i.size for i in ins) == len(raw), name
        assembly = '\n'.join(f'{i.address:016x}  {i.bytes.hex():22s} {i.mnemonic} {i.op_str}'.rstrip()
                             for i in ins) + '\n'
        path = HERE / (name + '.asm')
        if stage:
            path.write_text(assembly)
        else:
            assert path.read_text() == assembly
        ranges.append(dict(role=name, va=hex(start), end_exclusive=hex(end),
                           file_offset=hex(at), sha256=digest(raw), instructions=len(ins),
                           assembly=path.relative_to(ROOT).as_posix()))
    # Original retained ranges, not another copy of their assembly.
    prior = ROOT / 'docs/analysis/evidence/race-unlocks/manifest.json'
    old = json.loads(prior.read_text())
    for row in old['native_ranges']:
        at = pe.rva_offset(int(row['va'], 16) - pe.image_base)
        assert digest(image[at:at + row['byte_count']]) == row['sha256']

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + s['raw_size'] for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'], image[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    heap, stack = 0x200000000, 0x300000000
    u.mem_map(heap, 0x10000)
    u.mem_map(stack, 0x10000)
    bp = stack + 0x1000

    def get(name):
        return u.reg_read(getattr(r, 'UC_X86_REG_' + name))

    def reg(name, value):
        u.reg_write(getattr(r, 'UC_X86_REG_' + name), value)

    def put(at, fmt, *values):
        u.mem_write(at, struct.pack('<' + fmt, *values))

    def reset():
        u.mem_write(heap, bytes(0x10000))
        u.mem_write(stack, bytes(0x10000))
        reg('RSP', stack + 0xf008)
        reg('RBP', bp)

    def run(start, stops, extra=None):
        def hook(_, pc, size, __):
            if pc in stops:
                u.emu_stop()
            elif extra:
                extra(pc)
        handle = u.hook_add(UC_HOOK_CODE, hook)
        try:
            u.emu_start(start, 0, count=3000)
            assert get('RIP') in stops, hex(get('RIP'))
            return get('RIP')
        finally:
            u.hook_del(handle)

    cards = []
    for bought in (False, True):
        for planned in (False, True):
            for points in (0, 99, 100, 101, 800):
                reset()
                put(bp + 0x490, 'QQ', heap, heap + 0x1000)
                put(bp + 0x4a0, 'I', points)
                put(bp + 0x4a8, 'Q', heap + 0x2000)
                put(heap + 0x140, 'QQ', heap + 0x3000, int(bought))
                put(heap + 0x1000 + 0x38, 'QQ', heap + 0x4000, int(planned))
                put(heap + 0x2000 + 0x50, 'B', 2)
                put(heap + 0x3000, 'B', 2)
                put(heap + 0x4000, 'B', 2)
                keys = []

                def card_seam(pc):
                    if pc == 0x145b550e0:
                        keys.append(bytes(u.mem_read(get('RCX'), get('RDX'))).decode())
                        reg('RAX', get('RCX'))
                    elif pc == 0x145b55570:
                        put(get('RCX'), 'QQQ', 0, 1, 0)
                    elif pc == 0x1400021c0:
                        reg('RAX', heap + 0x8000)
                    elif pc == 0x145fa3aab:
                        u.mem_write(get('RCX'), bytes(u.mem_read(get('RDX'), get('R8'))))
                    elif pc == 0x140002200:
                        pass
                    else:
                        return
                    sp = get('RSP')
                    reg('RIP', struct.unpack('<Q', u.mem_read(sp, 8))[0])
                    reg('RSP', sp + 8)

                run(0x1401a1652, {0x1401a18e2}, card_seam)
                expected = 'Every class' if bought else 'In plan ({cost})' if planned else 'Buy {cost}' if points >= 100 else '{cost} points'
                assert keys == [expected], keys
                assert bool(get('R13') & 255) == (not bought and (planned or points >= 100))
                # Bought cards set their filled bit in the following body;
                # pending cards already carry it at this branch boundary.
                if not bought:
                    assert bool(get('RBX') & 255) == planned
                cards.append([bought, planned, points, expected])

    validation = []
    owned_sets = [[], *[[race] for race in range(1, 9)], [2, 5, 8]]
    for owned in owned_sets:
        for mask in range(256):
            proposed = [race for race in range(1, 9) if mask & (1 << (race - 1))]
            reset()
            put(heap + 0x38, 'QQ', heap + 0x1000, len(proposed))
            u.mem_write(heap + 0x1000, bytes(proposed))
            put(bp + 0x90, 'Q', len(owned))
            put(bp + 0x60, 'Q', heap + 0x2000)
            u.mem_write(heap + 0x2000, bytes(owned))
            reg('R14', heap)
            reg('R13', 1)
            reg('RSI', 1)
            accepted = run(0x145b35cb7, {0x145b35d78, 0x145b35ff6}) == 0x145b35d78
            assert accepted == set(owned).issubset(proposed)
            validation.append([owned, proposed, accepted])
    for race in (0, 9, 255):
        reset()
        put(heap + 0x38, 'QQ', heap + 0x1000, 1)
        put(heap + 0x1000, 'B', race)
        reg('R14', heap)
        reg('R13', 1)
        reg('RSI', 1)
        assert run(0x145b35cb7, {0x145b35d78, 0x145b35ff6}) == 0x145b35ff6
        validation.append([[], [race], False])
    spending = []
    for count in range(9):
        for base in (0, 50, 150):
            reset()
            put(heap + 0x40, 'Q', count)
            reg('RSI', heap)
            reg('RBX', base)
            reg('RDI', 0)
            run(0x145b3563e, {0x145b35646})
            assert get('RAX') & 0xffffffff == base + 100 * count
            spending.append([count, base, get('RAX')])
    admission = []
    for class_id in [1, 2, 3, 4, 5, 7, 8, 9, 11, 0, 6, 10, 12, 255]:
        for race in range(256):
            reset()
            put(heap + 0x1e3, 'BB', class_id, race)
            put(heap + 0x10, 'Q', 1)
            reg('R15', heap)
            accepted = run(0x145aa97fd, {0x145aa983a, 0x145aa9b98}) == 0x145aa983a
            assert accepted == (class_id in [1, 2, 3, 4, 5, 7, 8, 9, 11] and 1 <= race <= 8)
            admission.append([class_id, race, accepted])

    source = (ROOT / 'crates/azeroth-survivors-re/src/progression.rs').read_text()
    for anchor in ['races: save.purchased_races()', 'plan.races = request.races;', 'plan.races.sort_unstable();',
                   'plan.races.dedup();', '100 * self.races.len() as u32',
                   'old.races == owned.races', 'plan.races != owned.races',
                   'owned.races.iter().any(|race| !plan.races.contains(race))',
                   'Action::BuyRace(id)', '("races|", plan.races.iter()']:
        assert anchor in source, anchor
    ui = (ROOT / 'crates/azeroth-survivors-re/src/progression/rewards.rs').read_text()
    assert '["Perks", "Companions", "Tabards", "Races", "Appearances"]' in ui
    assert 'let enabled = !bought && (planned || remaining >= 100);' in ui
    assert 'Opens it to: {classes}' in ui and 'crate::save::allowed_races(*class)' in ui
    assert 'crate::armory::race_portrait(art, id, menu.sex, true)' in ui
    assert '&[1, 2, 3, 4, 5, 6, 7, 8]' in (ROOT / 'crates/azeroth-survivors-re/src/coop_profile.rs').read_text()

    completed = []
    for folder in ['card-query', 'card-input-query', 'remote-hero-query']:
        journal = ROOT / 'runtime/analysis/history/findings/fixgap-188/6855dc2a6553' / folder / 'journal.json'
        if stage or queries:
            j = json.loads(journal.read_text())
            assert j['status'] == 'completed'
            for result in sorted((journal.parent / 'results').glob('*.json')):
                e = json.loads(result.read_text())['structuredContent']
                assert e['provider']['id'] == 'ghidra'
                if folder == 'remote-hero-query':
                    at = pe.rva_offset(0x145aa97a0 - pe.image_base)
                    expected_subject = digest(image[at:at + 0x145aaa0fd - 0x145aa97a0])
                else:
                    expected_subject = SHA
                assert e['subject']['digest']['sha256'] == expected_subject
                completed.append(dict(procedure=e['parameters']['procedure'], evidence_id=e['evidence_id'],
                                      profile=e['analysis_profile']['digest'], subject_sha256=e['subject']['digest']['sha256'],
                                      result=dict(path=result.relative_to(ROOT).as_posix(), sha256=digest(result.read_bytes())),
                                      journal=dict(path=journal.relative_to(ROOT).as_posix(), sha256=digest(journal.read_bytes()))))
    evidence = dict(target_sha256=SHA, native_ranges=ranges,
                    retained_native_ranges=prior.relative_to(ROOT).as_posix(),
                    cases=dict(card=len(cards), race_validation=len(validation), spending=len(spending), remote_admission=len(admission)),
                    vector_sha256=digest(json.dumps([cards, validation, spending, admission], separators=(',', ':')).encode()),
                    limits=['Original bounded instruction execution with synthetic memory; no reconstructed code execution.',
                            'Card formatting/translation/allocation seams; validator stops before shared spending and achievements.',
                            'Admission tests only class/race/name-length gate after GUID gate; deeper normalization/transport remain separate.',
                            'Native toggle/assignment and UI constructors reviewed statically, not executed. Runtime/rendering/parity unverified.'])
    path = HERE / 'proof.json'
    if stage:
        evidence['queries'] = completed
        path.write_text(portable_json(evidence, indent=2) + '\n')
    else:
        retained = json.loads(path.read_text())
        q = retained.pop('queries')
        assert retained == evidence
        if queries:
            assert q == completed
    print(json.dumps(evidence['cases'], sort_keys=True), 'bounded native cases; source anchors pass; no build/game')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    parser.add_argument('--queries', action='store_true')
    args = parser.parse_args()
    if args.stage:
        HERE.mkdir(parents=True, exist_ok=True)
    derive(args.stage, args.queries)
