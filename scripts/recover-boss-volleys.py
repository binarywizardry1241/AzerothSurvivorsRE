#!/usr/bin/env python3
"""Check selected 0.108.0 recurring volleys and bounded Win64 instructions.

No builds, game processes or tool installation. --write-source changes only
recurring semantic tag1 records; evidence stages under ignored runtime/.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b'
WORK = ROOT / 'runtime/boss-volleys-0.108.0'
EVIDENCE = ROOT / 'docs/analysis/evidence/0.108.0/boss-volleys'
SOURCE = ROOT / 'crates/azeroth-survivors-re/src/guardians/catalog.rs'
RANGES = {
    'dispatch-prefix': (0x145950FF8, 0x14595105B),
    'dispatch-tail': (0x145955213, 0x145955E0D),
    # Canonical minion extract also owns the normal/enraged repeat calculation.
    'scheduled-repeat': (0x145973B45, 0x145973D91),
}


def dump(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + '\n'


def bits(value):
    return struct.unpack('<I', struct.pack('<f', value))[0]


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def scalar(value):
    return struct.unpack('<f', struct.pack('<I', value))[0]


def recover():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Changed EXE needs a fresh recovery'
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location('volley_pe', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + size]
        assert len(value) == size
        return value

    def span(address, size):
        value = raw(address, size)
        return dict(va=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=size, sha256=hashlib.sha256(value).hexdigest(), hex=value.hex())

    rows = []
    for zone in range(12):
        pointer, count = struct.unpack('<QQ', raw(0x146BD7B90 + zone * 240 + 0x88, 16))
        assert count == 5
        for index in range(count):
            address = pointer + index * 104
            boss_id = struct.unpack('<I', raw(address + 64, 4))[0]
            moves, count = struct.unpack('<QQ', raw(address + 16, 16))
            slots = []
            for slot in range(count):
                address = moves + slot * 56
                payload = raw(address, 56)
                if payload[45] != 4:
                    continue
                words = struct.unpack('<14I', payload)
                slots.append(dict(native_slot=slot, spell_id=words[0], count=words[1],
                                  cooldown_bits=words[12], record=span(address, 56)))
            assert len(slots) <= 1
            rows.append(dict(boss_id=boss_id, scheduled=slots))
    assert len(rows) == 60 and sum(len(r['scheduled']) for r in rows) == 26
    catalog = dict(target_version=target['version'], target_sha256=SHA, target=target['path'],
                   target_executed=False, bosses=rows,
                   limits=['Only recurring native tag4 volleys; phase/sequence/stance replacement and guardian signatures remain unreconstructed.',
                           'Semantic tag1 records are not the current 48-byte enum or 56-byte schedule ABI. Other source ability kinds retain separate provenance.'])

    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def map_pe(address):
        page = address & ~4095
        if page not in mapped:
            uc.mem_map(page, 4096)
            uc.mem_write(page, raw(page, 4096))
            mapped.add(page)

    # Map only the dispatcher, scalar constants and the shared repeat span.
    for start, end in [(0x145950BF0, 0x145956052), (0x145973C8F, 0x145973CAE)]:
        for page in range(start & ~4095, end, 4096):
            map_pe(page)
    for address in (0x145D97590, 0x145DA2290, 0x145DCD048, 0x145DECCA4,
                    0x1471EF530, 0x1471EF5D0, 0x145DA61F8, 0x145DCD0B8):
        map_pe(address)
    game, stack, record = 0x70000000, 0x71001000, 0x72000000
    uc.mem_map(game, 8192)
    uc.mem_map(stack - 4096, 8192)
    uc.mem_map(record, 4096)
    active = None
    allowed = ()
    stop = 0

    def hook(machine, address, size, unused):
        if address == stop:
            machine.emu_stop()
        elif not any(a <= address < b for a, b in allowed):
            raise AssertionError(f'Unexpected {active} instruction {address:x}')
    uc.hook_add(UC_HOOK_CODE, hook)

    def run(label, start, end, intervals=None):
        nonlocal active, allowed, stop
        active, allowed, stop = label, intervals or [(start, end)], end
        uc.reg_write(x.UC_X86_REG_EFLAGS, 2)
        uc.reg_write(x.UC_X86_REG_MXCSR, 0x1F80)
        uc.emu_start(start, end, count=1000)
        assert uc.reg_read(x.UC_X86_REG_RIP) == end, label

    def put(address, value):
        uc.mem_write(address, struct.pack('<I', value))

    def xy(register, point):
        uc.reg_write(register, bits(point[0]) | bits(point[1]) << 32)

    cases = {'speed': [], 'flight': [], 'repeat': [], 'aim': []}
    # Includes the new Huhuran spell, all current spells and each native special
    # speed branch, with unknown and signed-comparison boundary IDs.
    speeds = {0: 10., 0xFFFFFFFF: 10., 26053: 10., 10: 10., 133: 24., 6353: 24.,
              6789: 24., 11366: 24., 403: 20., 686: 20., 2812: 20., 5176: 20.,
              7269: 20., 116: 28., 10181: 28., 75: 40., 1978: 40., 3044: 40.,
              5116: 40., 6917: 40., 19434: 40., 1510: 30., 2643: 30.,
              24275: 35., 3606: 19., 0x7FFFFFFF: 10., 0x80000000: 10.}
    for spell, expected in sorted(speeds.items()):
        uc.mem_write(record, struct.pack('<II', spell, 1))
        uc.reg_write(x.UC_X86_REG_RCX, record)
        uc.reg_write(x.UC_X86_REG_RBP, stack)
        run('speed', 0x145950FF8, 0x145955786,
            [(0x145950FF8, 0x14595105B), (0x145955213, 0x145955786), (0x145955E00, 0x145955E0D)])
        actual = struct.unpack('<I', uc.mem_read(stack + 0xE0, 4))[0]
        assert actual == bits(expected), (spell, actual, expected)
        cases['speed'].append(dict(spell_id=spell, speed_bits=actual))
        # Both first/later native lanes must agree. Far/near, exact floor,
        # diagonal and nonfinite inputs expose rounding/MAXSS operand behavior.
        for source, center in [((0., 0.), (0., 0.)), ((0., 0.), (1., 0.)),
                               ((0., 0.), (f32(expected * f32(.6)), 0.)),
                               ((-13., 7.), (100., -41.)), ((0., 0.), (48., 0.)),
                               ((float('nan'), 0.), (0., 0.))]:
            delay = f32(f32(f32(f32(source[1] - center[1]) ** 2) +
                                      f32(f32(source[0] - center[0]) ** 2)) ** .5)
            delay = f32(delay / expected)
            expected_delay = delay if delay > f32(.6) else f32(.6)
            results = []
            for start, end, target_y, result_register in (
                (0x1459558DE, 0x145955919, x.UC_X86_REG_XMM11, x.UC_X86_REG_XMM6),
                (0x145955D2F, 0x145955D6A, x.UC_X86_REG_XMM11, x.UC_X86_REG_XMM7)):
                put(stack + 0xF0, bits(source[1]))
                put(stack + 0x150, bits(source[0]))
                uc.reg_write(x.UC_X86_REG_XMM10, bits(center[0]))
                uc.reg_write(target_y, bits(center[1]))
                run('flight', start, end)
                results.append(uc.reg_read(result_register) & 0xFFFFFFFF)
            assert results == [bits(expected_delay)] * 2, (spell, source, center, results, expected_delay)
            cases['flight'].append(dict(spell_id=spell, source_bits=[bits(v) for v in source],
                                        center_bits=[bits(v) for v in center], delay_bits=results[0]))

    for row in rows:
        for move in row['scheduled']:
            for enraged in (False, True):
                uc.mem_write(game + 0x50, bytes([enraged]))
                uc.reg_write(x.UC_X86_REG_R14, game)
                uc.reg_write(x.UC_X86_REG_RAX, record)
                uc.reg_write(x.UC_X86_REG_XMM0, move['cooldown_bits'])
                run('repeat', 0x145973C8F, 0x145973CAE)
                actual = struct.unpack('<I', uc.mem_read(record, 4))[0]
                assert actual == bits(f32(scalar(move['cooldown_bits']) * (f32(.7) if enraged else 1.)))
                cases['repeat'].append(dict(boss_id=row['boss_id'], enraged=enraged, result_bits=actual))

    # Later volley aims execute inline RNG; first aim's 0..1 helper and zero
    # radial multiplier are instruction-reviewed, with the helper left explicit.
    mask = (1 << 64) - 1

    def draw(state, low, high):
        while True:
            a, b, c, d = state
            v = (a + d) & mask
            value = (((v << 23) | (v >> 41)) + a) & mask
            t = (b << 17) & mask
            c ^= a; d ^= b; b ^= c; a ^= d; c ^= t
            d = ((d << 45) | (d >> 19)) & mask
            state[:] = [a, b, c, d]
            unit = f32(scalar(0x3F800000 | value >> 41) - 1.)
            value = f32(f32(unit * f32(high - low)) + low)
            if value < high:
                return value
    for initial in ([1, 2, 3, 4], [mask] * 4, [0x123456789ABCDEF, 0xFEDCBA9876543210, 0xABCD, 0x6D23]):
        for count in (3, 5, 9):
            for index in (1, count - 1):
                state = list(initial)
                phase, radius = draw(state, 0., 1.), draw(state, 2., 6.)
                angle = f32(f32(f32(index / count) * f32(6.283185307179586)) + phase)
                uc.mem_write(game + 0x9A0, struct.pack('<4Q', *initial))
                uc.reg_write(x.UC_X86_REG_RSI, game)
                uc.reg_write(x.UC_X86_REG_RBP, stack)
                uc.reg_write(x.UC_X86_REG_R15, index)
                for reg, value in ((x.UC_X86_REG_XMM6, -1.), (x.UC_X86_REG_XMM9, 1.),
                                   (x.UC_X86_REG_XMM13, 4.), (x.UC_X86_REG_XMM15, 2.),
                                   (x.UC_X86_REG_XMM8, 6.)):
                    uc.reg_write(reg, bits(value))
                put(stack + 0xB8, bits(count))
                run('aim', 0x145955B00, 0x145955C04)
                actual_state = list(struct.unpack('<4Q', uc.mem_read(game + 0x9A0, 32)))
                assert actual_state == state
                assert uc.reg_read(x.UC_X86_REG_XMM10) & 0xFFFFFFFF == bits(angle)
                assert uc.reg_read(x.UC_X86_REG_XMM7) & 0xFFFFFFFF == bits(radius)
                cases['aim'].append(dict(state=initial, state_after=state, index=index, count=count,
                                          angle_bits=bits(angle), radius_bits=bits(radius)))
    native = dict(target_sha256=SHA, target_executed=False,
                  method='Bounded no-call selected-EXE Win64 instructions, synthetic memory/registers; independent f32/RNG comparisons.',
                  ranges={k: {field: value for field, value in span(a, b - a).items() if field != 'hex'}
                          for k, (a, b) in RANGES.items()}, cases=cases,
                  limits=['No Rust compilation/execution or game process. CRT trig, terrain, packet constructors, hazard lifecycle/presentation and mixed ability ordering are not certified.'])
    return catalog, native


def source_check(catalog, write):
    source = SOURCE.read_text()
    records = {r['boss_id']: r['scheduled'] for r in catalog['bosses']}
    blocks = list(re.finditer(r'^    BossDefinition \{(.*?)(?=^    BossDefinition \{|^\];)', source, re.M | re.S))
    assert len(blocks) == 60
    for block in reversed(blocks):
        body = block[0]
        boss_id = int(re.search(r'\bid:\s*(\d+)', body)[1])
        slots = [m for m in re.finditer(r'RawBossAbility \{\s*words:\s*\[(.*?)\]\s*,?\s*\},?\s*', body, re.S)
                 if int(re.findall(r'0x[0-9a-f]+', m[1])[0], 16) == 1]
        expected = records[boss_id]
        assert len(slots) <= 1
        if not expected:
            if write and slots:
                assert boss_id == 894, 'Unexpected historical extra volley'
                m = slots[0]
                body = body[:m.start()] + body[m.end():]
            else:
                assert not slots, f'Obsolete volley remains: {boss_id}'
        else:
            assert len(slots) == 1, boss_id
            move = expected[0]
            words = [1, move['spell_id'], move['count'], 0, 0, 0, move['cooldown_bits']]
            m = slots[0]
            if write:
                generated = iter(words)
                values = re.sub(r'0x[0-9a-f]+', lambda _: f'0x{next(generated):08x}', m[1])
                body = body[:m.start(1)] + values + body[m.end(1):]
            else:
                assert [int(v, 16) for v in re.findall(r'0x[0-9a-f]+', m[1])] == words, boss_id
        if write:
            source = source[:block.start()] + body + source[block.end():]
    if write:
        SOURCE.write_text(source)
    ability = (ROOT / 'crates/azeroth-survivors-re/src/bosses/abilities.rs').read_text()
    ai = (ROOT / 'crates/azeroth-survivors-re/src/bosses/ai.rs').read_text()
    adapter = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs').read_text()
    for value in ('missile_travel_delay(spell_id, context.source, center)', 'radius: 2.5',
                  'context.effective_damage * 0.45', 'missile_aim_xy(index, count, context.player'):
        assert value in ability, value
    assert 'super::abilities::dispatch(&request.ability' in ai
    assert 'self.boss_state.effects.resolve_due(self.clock, &mut port)' in adapter
    assert 'native::ai::dispatch_queued(' in adapter
    assert 'self.damage_player(amount, false, source_guid, player, facing, world)' in adapter


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    parser.add_argument('--write-source', action='store_true')
    args = parser.parse_args()
    catalog, native = recover()
    source_check(catalog, args.write_source)
    if args.check:
        assert not args.write_source
        assert json.loads((EVIDENCE / 'catalog.json').read_text()) == catalog
        assert json.loads((EVIDENCE / 'native.json').read_text()) == native
        manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
        assert manifest['target_sha256'] == SHA
        assert hashlib.sha256((EVIDENCE / manifest['rea']['pseudocode']).read_bytes()).hexdigest() == manifest['rea']['pseudocode_sha256']
        for row in manifest['spans']:
            ref = row['assembly']
            path = ROOT / ref if ref.startswith('docs/') else EVIDENCE / ref
            assert hashlib.sha256(path.read_bytes()).hexdigest() == row['assembly_sha256']
            assert row['sha256'] == native['ranges'][row['role']]['sha256']
    else:
        WORK.mkdir(parents=True, exist_ok=True)
        (WORK / 'catalog.json').write_text(dump(catalog))
        (WORK / 'native.json').write_text(dump(native))
    print(f'0.108.0: 60 boss memberships, 26 current volleys; {sum(map(len, native["cases"].values()))} bounded native cases pass. No compilation/game process.')


if __name__ == '__main__':
    main()
