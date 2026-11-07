#!/usr/bin/env python3
"""Check #170's exact native key, predicate and live source without compilation.

Optional replay executes only bounded original instructions with typed memory;
it does not run the game, reconstructed code, a server, Save I/O or networking.
"""
from runtime_layout import retained_runtime_path
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

EVIDENCE = ROOT / 'docs/analysis/evidence/hakkar-smoothie'
SOURCE = ROOT / 'crates/azeroth-survivors-re'


def digest(value):
    return hashlib.sha256(value).hexdigest()


def compact(path):
    return re.sub(r'\s+', '', re.sub(r'//[^\n]*', '', path.read_text()))


def replay(image, pe, definition):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    machine.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        offset = section['raw_offset']
        machine.mem_write(pe.image_base + section['rva'], image[offset:offset + section['raw_size']])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    for address in (heap, stack, stop):
        machine.mem_map(address, 0x10000)
    condition, members, events = heap, heap + 0x100, heap + 0x1000
    bp = stack + 0x8000
    visited = set()
    boundaries = {stop, 0x145b42e10, 0x145b4322c, 0x145b3efc6}

    def put(address, value):
        machine.mem_write(address, struct.pack('<Q', value))

    def hook(_, address, size, unused):
        if address in boundaries:
            machine.emu_stop()
            return
        assert any(a <= address and address + size <= b for a, b in [
            (0x145b33760, 0x145b33a72), (0x145b3eef6, 0x145b3efc6),
            (0x145b42f72, 0x145b430f7),
        ]), hex(address)
        offset = pe.rva_offset(address - pe.image_base)
        assert bytes(machine.mem_read(address, size)) == image[offset:offset + size]
        visited.add(address)

    machine.hook_add(UC_HOOK_CODE, hook)

    # Execute the constructor's actual stores, retaining its original PE data.
    machine.reg_write(reg.UC_X86_REG_RBP, bp)
    machine.emu_start(0x145b3eef6, 0, count=10000)
    descriptor = bytes(machine.mem_read(bp + 0x3d8, 0x98))
    q = lambda at: struct.unpack_from('<Q', descriptor, at)[0]
    text = lambda at: bytes(machine.mem_read(q(at), q(at + 8))).decode()
    assert text(0) == 'coop:smoothie'
    assert descriptor[0x48:0x4a] == b'\x09\0'
    assert struct.unpack_from('<I', descriptor, 0x4c)[0] == definition['boss_id'] == 994
    assert list(struct.unpack('<I', machine.mem_read(q(0x50), 4))) == definition['spells'] == [1680]
    assert q(0x58) == q(0x60) == 1
    assert text(0x68) == definition['party']['key'] == 'bladestorm'
    assert descriptor[0x78] == definition['party']['class'] == 1
    machine.mem_write(condition, descriptor[0x60:0x80])

    def fill(values):
        machine.mem_write(members, bytes(8 * 8))
        for index, (cls, flags) in enumerate(values):
            machine.mem_write(members + index * 8, struct.pack('<IBB2x', 0, cls, flags))

    def composition(values):
        fill(values)
        sp = stack + 0xf008
        put(sp, stop)
        for register, value in ((reg.UC_X86_REG_RSP, sp), (reg.UC_X86_REG_RCX, condition),
                                (reg.UC_X86_REG_RDX, members), (reg.UC_X86_REG_R8, len(values))):
            machine.reg_write(register, value)
        machine.emu_start(0x145b33760, 0, count=10000)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
        return bool(machine.reg_read(reg.UC_X86_REG_RAX) & 1)

    cases = 0
    for count in range(8):
        for flags in (0, 1, 2, 3, 0x80, 0x82, 0xff):
            assert composition([(1, flags)] * count) == (count == 5 and flags & 2 != 0)
            cases += 1
    for index in range(5):
        for cls, flags in ((2, 2), (0, 2), (255, 2), (1, 0), (1, 1), (1, 0x80)):
            values = [(1, 2)] * 5
            values[index] = (cls, flags)
            assert not composition(values)
            cases += 1

    def boss(values, boss_id=994, spell=1680, kind=0, count=1, won=False, max_modifiers=False):
        fill(values)
        machine.mem_write(stack, bytes(0x10000))
        machine.mem_write(bp - 0x40, descriptor[0x60:0x80])
        put(bp + 8, 0)  # Present cooperative context; absent is the -1 sentinel.
        put(bp + 0x10, count)
        put(bp + 0x88, events)
        put(bp + 0x80, events + count * 0x28)
        machine.mem_write(bp + 0xe4, bytes([not max_modifiers, 0, 0, won]))
        for index in range(count):
            machine.mem_write(events + index * 0x28,
                              struct.pack('<QQQIIBB6x', 0, members, len(values),
                                          boss_id, spell, 0, kind))
        for register, value in ((reg.UC_X86_REG_RSP, bp - 0x300),
                                (reg.UC_X86_REG_RBP, bp), (reg.UC_X86_REG_R10, 9),
                                (reg.UC_X86_REG_R9, 994), (reg.UC_X86_REG_R8, 1),
                                (reg.UC_X86_REG_R11, q(0x50))):
            machine.reg_write(register, value)
        machine.emu_start(0x145b42f72, 0, count=10000)
        edge = machine.reg_read(reg.UC_X86_REG_RIP)
        assert edge in (0x145b42e10, 0x145b4322c)
        return edge == 0x145b4322c

    for count in range(8):
        for kind in range(4):
            for spell in (0, 1679, 1680, 1681):
                expected = count == 5 and kind != 2 and spell == 1680
                assert boss([(1, 2)] * count, kind=kind, spell=spell) == expected
                cases += 1
    for index in range(5):
        for cls, flags in ((2, 2), (1, 0), (1, 1)):
            values = [(1, 2)] * 5
            values[index] = (cls, flags)
            assert not boss(values)
            cases += 1
    for won in (False, True):
        for modifiers in (False, True):
            assert boss([(1, 2)] * 5, won=won, max_modifiers=modifiers)
            cases += 1
    assert not boss([(1, 2)] * 5, boss_id=995)
    assert not boss([(1, 2)] * 5, count=0)
    cases += 2
    print(f'Passed {cases} original predicate fixtures and constructor stores ({len(visited)} instruction sites).')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--require-retained-queries', action='store_true')
    parser.add_argument('--replay-instructions', action='store_true')
    args = parser.parse_args()
    proof = json.loads((EVIDENCE / 'manifest.json').read_text())
    target = latest_target(verify=True)
    assert all(proof['target'][key] == target[key] for key in ('version', 'sha256', 'size_bytes'))
    image = target_bytes(target)
    pe = load_script('smoothie_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    raw = lambda at, n: image[pe.rva_offset(at - pe.image_base):pe.rva_offset(at - pe.image_base) + n]
    reused = proof['reused_manifest']
    assert digest((ROOT / reused['path']).read_bytes()) == reused['sha256']
    previous = json.loads((ROOT / reused['path']).read_text())
    assert previous['target'] == proof['target']
    for row in previous['native_owners']:
        if row['role'] in ('achievement-constructor', 'party-composition', 'run-grant'):
            assert digest(raw(int(row['start'], 16), row['byte_count'])) == row['sha256']
    for row in proof['native_spans'] + proof['data']:
        assert pe.rva_offset(int(row['start'], 16) - pe.image_base) == int(row['file_offset'], 16)
        assert digest(raw(int(row['start'], 16), row['byte_count'])) == row['sha256']
    for row in (proof['assembly'], previous['assembly']):
        assembly = (retained_runtime_path(ROOT / row['path'], ROOT)).read_bytes()
        assert digest(assembly) == row['sha256']
        for line in assembly.decode().splitlines():
            if line and not line.startswith(';'):
                address, code, _ = line.split(' ', 2)
                assert raw(int(address, 16), len(code) // 2).hex() == code
    selected = []
    for row in previous['queries']:
        path = ROOT / row['result']
        if not path.is_file():
            assert not args.require_retained_queries, path
            continue
        assert digest(path.read_bytes()) == row['result_sha256']
        result = json.loads(path.read_text())['structuredContent']
        if result['parameters']['procedure'] not in proof['reused_query_procedures']:
            continue
        assert result['subject']['digest']['sha256'] == target['sha256']
        assert result['evidence_id'] == row['evidence_id']
        assert result['analysis_profile']['digest'] == row['profile_digest']
        assert digest(result['normalized_result'].encode()) == row['normalized_sha256']
        selected.append(result['parameters']['procedure'])
    if args.require_retained_queries:
        assert sorted(selected) == sorted(proof['reused_query_procedures'])
    asset = proof['source_asset']
    assert digest((ROOT / asset['path']).read_bytes()) == asset['sha256']
    overlay = json.loads((ROOT / asset['path']).read_text())
    assert overlay['target_sha256'] == target['sha256']
    description = overlay['descriptions']['coop:smoothie']
    row = next(r for r in proof['data'] if r['role'] == 'description')
    assert description.encode() == raw(int(row['start'], 16), row['byte_count'])
    assert raw(0x1475e25b0 + 9 * 4, 4) == struct.pack('<i', 0x145b42faa - 0x1475e25b0)
    catalogs = SOURCE / 'assets/locales'
    locale_paths = list(catalogs.glob('*.json'))
    assert len(locale_paths) == 14
    assert all(description in json.loads(path.read_text()) for path in locale_paths)
    definitions = json.loads((SOURCE / 'assets/coop-achievements-0.117.0.json').read_text())
    definition = next(r['cooperative'] for r in definitions['achievements'] if r['key'] == 'coop:smoothie')
    assert definition == dict(type='boss', boss_id=994, spells=[1680], max_modifiers=False,
                              party=dict(kind='talent', key='bladestorm', **{'class': 1}))
    ui = compact(SOURCE / 'src/progression.rs')
    account = compact(SOURCE / 'src/account_progression.rs')
    assert 'include_str!("../assets/hakkar-smoothie-0.119.0.json")' in ui
    assert 'for(key,description)indescriptions.descriptions' in ui
    assert '.description=description;' in ui and 'fnlabel(&self,catalog:&MenuCatalog,value:&str)' in ui
    assert 'letmutoutput=catalog.label(value).to_owned();' in ui
    assert ui.count('entry.label(labels,&entry.description)') == 2
    assert 'ifmembers.len()!=5{returnfalse;}' in account
    assert '"bladestorm"=>2' in account and 'member.byte&flag!=0' in account
    assert 'event.word_18==*boss_id&&party.matches(&event.members)' in account
    assert 'event.kind_21!=2&&spells.contains(&event.word_1c)' in account
    producer = compact(SOURCE / 'src/gameplay/mechanics/party_achievements.rs')
    bosses = compact(SOURCE / 'src/gameplay/mechanics/bosses.rs')
    assert 'u8::from(talents.iter().any(|key|key=="bladestorm"))<<1' in producer
    assert 'members:self.boss_state.party_feats.members.clone()' in bosses
    save = compact(SOURCE / 'src/save/achievements.rs')
    assert 'dates.entry(key.clone()).or_insert(seconds)' in save
    print(f'Passed native data/spans, description lookup in fourteen locales and live source tracing; {len(selected)} retained Ghidra results.')
    if args.replay_instructions:
        replay(image, pe, definition)
    print('Compilation, game/server/Save/network execution and original/rebuilt parity remain unverified.')


if __name__ == '__main__':
    main()
