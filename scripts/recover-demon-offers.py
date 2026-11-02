#!/usr/bin/env python3
"""Check selected Demonology offers against immutable 0.105.0 native code/data.

Only bounded x64 instructions execute in Unicorn; no application or source build
runs. Constructor vector growth, allocation, locale miss and string formatting
are reviewed host seams. --check compares retained compact evidence.
"""
from native_recovery import f32 as _shared_f32
from script_sources import load_script
from pathlib import Path
import argparse, hashlib, json, math, struct, sys

ROOT = Path(__file__).resolve().parents[1]
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe'
OUT = ROOT / 'runtime/demon-offers-01050/check'
RETAINED = ROOT / 'docs/analysis/evidence/0.105.0/demon-offers'
OWNERS = {
    'upgrade-magnitude': (0x145986de0, 0x1459870f0),
    'upgrade-apply': (0x145987150, 0x145987255),
    'amulet-constructor': (0x14587b8e0, 0x14587cfc7),
    'amulet-rank': (0x14587af80, 0x14587b0bd),
    'amulet-interpolation': (0x1459a9020, 0x1459a91aa),
    'spell-modifiers': (0x1458e3a30, 0x1458e3d9f),
    'empowerment-effect': (0x1459232ec, 0x145923314),
    'empowerment-description': (0x14597028f, 0x145970431),
}


def f32(v):
    return _shared_f32(v)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    offset = lambda a: pe.rva_offset(a - pe.image_base)
    description_address, description_length = 0x1471b3c73, 134
    description = data[offset(description_address):offset(description_address) + description_length].decode()
    assert description in (ROOT / 'crates/azeroth-survivors-re/src/run_effects/demon_talents.rs').read_text()
    # Native compact format bytecode C1 + flags has precision0, then argument0.
    assert data[offset(0x1471b355d):offset(0x1471b355d) + 6] == bytes.fromhex('c12000007000')
    if args.check:
        manifest = json.loads((RETAINED / 'manifest.json').read_text())
        assert manifest['target_sha256'] == SHA
        assert manifest['empowerment_description']['literal_sha256'] == hashlib.sha256(description.encode()).hexdigest()
        for scope in manifest['scopes']:
            at = offset(int(scope['address'], 16))
            raw = data[at:at + scope['byte_count']]
            assert hashlib.sha256(raw).hexdigest() == scope['sha256']
            assert hashlib.sha256((RETAINED / scope['assembly']).read_bytes()).hexdigest() == scope['assembly_sha256']
        for row in manifest['ability_records']:
            at = offset(int(row['address'], 16))
            assert data[at:at + row['byte_count']].hex() == row['raw_hex']
    def text(a):
        pointer, length = struct.unpack_from('<QQ', data, offset(a))
        return None if not pointer else data[offset(pointer):offset(pointer) + length].decode()
    records = []
    for i in range(14):
        key_address = 0x146e70688 + i * 120
        at = offset(key_address)
        raw = data[at - 32:at + 88]
        records.append(dict(key=text(key_address), record_address=hex(key_address - 32),
                            byte_count=120, sha256=hashlib.sha256(raw).hexdigest(),
                            prerequisite=text(key_address - 32),
                            alternative_prerequisite=text(key_address - 16),
                            exclusive_row=bool(data[at + 83])))
    ui = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/demonology-0.105.0.json').read_text())
    assert ui['target_sha256'] == SHA
    assert [r['key'] for r in records] == [r['key'] for r in ui['talents']]
    for row, definition in zip(records, ui['talents']):
        assert definition['prerequisite'] == row['prerequisite']
    assert [r['key'] for r in records if r['exclusive_row']] == ['soul_devourer', 'soul_link']
    assert next(r for r in records if r['key'] == 'legion_gate')['alternative_prerequisite'] == 'soul_link'
    selected = json.loads((ROOT / 'docs/analysis/evidence/0.105.0/game-mode-audit/selected-data.json').read_text())
    scorch = next(row for row in selected['selected_talents'] if row['key'] == 'aftermath')
    key_address = int(scorch['record_prefix']['virtual_address'], 16)
    at = offset(key_address)
    raw = data[at - 32:at + 88]
    for field in ['record_prefix', 'effects_range']:
        scope = scorch[field]
        start = offset(int(scope['virtual_address'], 16))
        assert hashlib.sha256(data[start:start + scope['byte_count']]).hexdigest() == scope['sha256']
    scorch_record = dict(key='aftermath', record_address=hex(key_address - 32), byte_count=120,
                         sha256=hashlib.sha256(raw).hexdigest(), prerequisite=text(key_address - 32),
                         alternative_prerequisite=text(key_address - 16), exclusive_row=bool(data[at + 83]))
    assert scorch_record['prerequisite'] is None and scorch_record['alternative_prerequisite'] is None
    assert not scorch_record['exclusive_row']
    assert data[at + 80:at + 83] == bytes([1, 2, 5])
    for field in ['key', 'name', 'icon', 'description', 'row', 'column', 'max_rank']:
        assert ui['scorched_earth'][field] == scorch[field]
    assert ui['scorched_earth']['numeric_values'] == ['5', '10', '15', '20', '25']
    assert ui['scorched_earth']['prerequisite'] is None and not ui['scorched_earth']['milestone']
    effects_at = offset(int(scorch['effects_range']['virtual_address'], 16))
    scorch_effects = [bytes.fromhex(row['payload']) for row in scorch['effects']]
    assert data[effects_at:effects_at + 128] == b''.join(scorch_effects)
    power, status = scorch_effects
    assert power[0] == 36 and power[8] == 1 and power[36] == 0
    assert text(int(scorch['effects_range']['virtual_address'], 16) + 16) == 'hellfire'
    assert struct.unpack_from('<f', power, 32)[0] == f32(.05)
    assert status[0] == 8 and struct.unpack_from('<I', status, 24)[0] == 0 and status[32] == 1
    assert text(int(scorch['effects_range']['virtual_address'], 16) + 64 + 40) == 'hellfire'
    assert struct.unpack_from('<fIff', status, 4) == (f32(.05), 1, f32(.4), 3.)

    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(heap, 0x100000)
    u.mem_map(stack, 0x20000)
    u.mem_map(done, 4096)
    next_heap = heap + 0x1000
    def put(a, fmt, *values):
        u.mem_write(a, struct.pack(fmt, *values))
    def get(a, fmt):
        return struct.unpack(fmt, u.mem_read(a, struct.calcsize(fmt)))
    def alloc(size):
        nonlocal next_heap
        pointer = next_heap
        next_heap += (size + 15) & ~15
        u.mem_write(pointer, bytes(size))
        return pointer
    allowed = list(OWNERS.values())
    calls = {}
    def hook(_, a, size, unused):
        if a == done:
            u.emu_stop()
            return
        if a in (0x14587cc28, 0x1459206ee):
            u.emu_stop()
            return
        if any(start <= a < end for start, end in allowed):
            return
        calls[a] = calls.get(a, 0) + 1
        rcx, rdx = u.reg_read(r.UC_X86_REG_RCX), u.reg_read(r.UC_X86_REG_RDX)
        if a == 0x145bfb270:
            if get(rcx, '<Q')[0] == 0:
                put(rcx + 8, '<Q', alloc(256 * 64))
            put(rcx, '<Q', 256)
        elif a in (0x140002200, 0x1400021d0):
            pass
        elif a == 0x1400021c0:
            u.reg_write(r.UC_X86_REG_RAX, alloc(rcx))
        elif a == 0x145bc9787:
            count = u.reg_read(r.UC_X86_REG_R8)
            u.reg_write(r.UC_X86_REG_RAX, int(u.mem_read(rcx, count) != u.mem_read(rdx, count)))
        elif a == 0x145bc97b1:
            value = struct.unpack('<f', struct.pack('<I', u.reg_read(r.UC_X86_REG_XMM0) & 0xffffffff))[0]
            rounded = math.copysign(math.floor(abs(value) + .5), value)
            u.reg_write(r.UC_X86_REG_XMM0, struct.unpack('<I', struct.pack('<f', rounded))[0])
        elif a == 0x1458da590:
            assert rdx == description_length and bytes(u.mem_read(rcx, rdx)).decode() == description
            u.reg_write(r.UC_X86_REG_RAX, 0)
            u.reg_write(r.UC_X86_REG_RDX, 0)
        else:
            raise RuntimeError('Unreviewed native call ' + hex(a))
        sp = u.reg_read(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RIP, get(sp, '<Q')[0])
        u.reg_write(r.UC_X86_REG_RSP, sp + 8)
    u.hook_add(UC_HOOK_CODE, hook)
    def invoke(start, rcx, rdx=0, r8=0):
        sp = stack + 0x18008
        put(sp, '<Q', done)
        for register, value in [(r.UC_X86_REG_RSP, sp), (r.UC_X86_REG_RCX, rcx),
                                (r.UC_X86_REG_RDX, rdx), (r.UC_X86_REG_R8, r8),
                                (r.UC_X86_REG_MXCSR, 0x1f80)]:
            u.reg_write(register, value)
        u.emu_start(start, 0, count=10000)
    invoke(0x14587b8e0, heap, 0x146baf508)
    assert u.reg_read(r.UC_X86_REG_RIP) == 0x14587cc28
    vector = u.reg_read(r.UC_X86_REG_RBP) + 0x30
    pointer, count = get(vector + 8, '<2Q')
    assert count == 4
    constructed = [bytes(u.mem_read(pointer + i * 64, 64)) for i in range(count)]
    asset = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/legionlord-0.105.0.json').read_text())
    assert asset['target_sha256'] == SHA
    for raw, record in zip(constructed, asset['definition']['effects']):
        assert raw[0] == 36
        assert record['raw_hex'] == '1f' + raw.hex()[2:]
    # Keep the native key/definition vectors for actual rank interpolation.
    amulet = alloc(112)
    key = alloc(29)
    u.mem_write(key, b'legendary:demonic_empowerment')
    put(amulet + 8, '<2Q', key, 29)
    put(amulet + 0x38, '<2Q', pointer, count)
    rank_cases = []
    for rank in [0, 1, 2, 3, 4, 5, 9, 10, 11, 0xffffffff]:
        output = alloc(24)
        invoke(0x14587af80, output, amulet, rank)
        assert u.reg_read(r.UC_X86_REG_RIP) == done
        _, result, count = get(output, '<3Q')
        fraction = f32((min(max(rank, 3), 10) - 3) / 7.0)
        values = []
        for i, endpoint in enumerate([2.0, 1.5, .75, 2.0]):
            native = get(result + i * 64 + 32, '<I')[0]
            base = struct.unpack_from('<f', constructed[i], 32)[0]
            model = f32(f32(f32(endpoint - base) * fraction) + base)
            assert native == struct.unpack('<I', struct.pack('<f', model))[0]
            values.append(native)
        rank_cases.append(dict(rank=rank, amount_bits=values))
    instance = alloc(104)
    upgrade_cases = []
    for rarity in range(5):
        for damage_bonus, haste_bonus in [(0, 0), (.44, .29), (.45, .3), (1, 1)]:
            for kind in [0, 1, 2, 3, 4, 5]:
                u.mem_write(instance, bytes(104))
                put(instance, '<Q', 0x146baf508)
                put(instance + 0x2c, '<f', .21)
                put(instance + 0x38, '<f', 5.99)
                put(instance + 0x3c, '<f', damage_bonus)
                put(instance + 0x40, '<f', haste_bonus)
                invoke(0x145986de0, instance, kind, rarity)
                assert u.reg_read(r.UC_X86_REG_RIP) == done
                native = u.reg_read(r.UC_X86_REG_XMM0) & 0xffffffff
                powers = [.02, .04, .06, .10, .15]
                if kind == 0:
                    model = min(f32(powers[rarity]), max(f32(f32(.45) - f32(damage_bonus)), 0.0))
                elif kind == 5:
                    model = min(f32(powers[rarity]), max(f32(f32(.3) - f32(haste_bonus)), 0.0))
                elif kind == 1:
                    model = min(f32([.03, .05, .08, .12, .15][rarity]), max(f32(f32(.21) - f32(.2)), 0.0))
                elif kind == 4:
                    model = min(f32([.5, 1, 1.5, 2.5, 4][rarity] / 8), max(f32(6 - f32(5.99)), 0.0))
                else:
                    model = 0.0
                assert native == struct.unpack('<I', struct.pack('<f', model))[0], (kind, rarity, native, model)
                upgrade_cases.append(dict(rarity=rarity, kind=kind, damage_bonus=damage_bonus,
                                          haste_bonus=haste_bonus, increment_bits=native))
    modifier_cases = []
    for qualified in (False, True):
        aggregate, rows, output = alloc(96), alloc(4 * 32), alloc(36)
        for index, amount in enumerate([2.0, 1.5, .75, 2.0]):
            raw = constructed[index]
            put(rows + index * 32, '<B', int(qualified))
            u.mem_write(rows + index * 32 + 8, raw[16:32])
            put(rows + index * 32 + 24, '<B', raw[36])
            put(rows + index * 32 + 28, '<f', amount)
        put(aggregate + 24, '<3Q', 4, rows, 4)
        invoke(0x1458e3a30, output, aggregate, 0x146baf508)
        assert u.reg_read(r.UC_X86_REG_RIP) == done
        bits = list(get(output, '<9I'))
        expected = [2.5, 1., 0, 1., 3., 0., 3., 2.5 if qualified else 1., .25]
        assert bits == [0 if i == 2 else struct.unpack('<I', struct.pack('<f', v))[0] for i, v in enumerate(expected)]
        modifier_cases.append(dict(qualified=qualified, lane_bits=bits))
    scorch_cases = []
    for rank in range(1, 6):
        for matches in (False, True):
            aggregate, rows, output = alloc(96), alloc(32), alloc(36)
            put(rows, '<B', 1)
            u.mem_write(rows + 8, power[16:32])
            put(rows + 24, '<B', power[36])
            amount = f32(struct.unpack_from('<f', power, 32)[0] * rank)
            put(rows + 28, '<f', amount)
            put(aggregate + 24, '<3Q', 1, rows, 1)
            invoke(0x1458e3a30, output, aggregate, 0x146baf238 if matches else 0x146baf508)
            assert u.reg_read(r.UC_X86_REG_RIP) == done
            bits = list(get(output, '<9I'))
            expected = [f32(1. + amount) if matches else 1., 1., 0, 1., 1., 0., 1.,
                        f32(1. + amount) if matches else 1., 1.]
            assert bits == [struct.unpack('<I', struct.pack('<f', v))[0] for v in expected]
            scorch_cases.append(dict(rank=rank, matches=matches, lane_bits=bits))
    empowerment_cases = []
    for bonus in [0., .15, .45]:
        for effect_multiplier in [1., 3.]:
            for qualified_power in [1., 2.5]:
                put(instance + 0x3c, '<2f', bonus, min(bonus, .3))
                put(instance + 0x60, '<f', qualified_power)
                u.reg_write(r.UC_X86_REG_R12, instance)
                u.reg_write(r.UC_X86_REG_RSI, 0x146baf508)
                u.reg_write(r.UC_X86_REG_XMM10, struct.unpack('<I', struct.pack('<f', .3))[0])
                u.reg_write(r.UC_X86_REG_XMM0, struct.unpack('<I', struct.pack('<f', effect_multiplier))[0])
                u.emu_start(0x1459232ec, 0, count=100)
                assert u.reg_read(r.UC_X86_REG_RIP) == 0x1459206ee
                damage = u.reg_read(r.UC_X86_REG_XMM10) & 0xffffffff
                haste = u.reg_read(r.UC_X86_REG_XMM6) & 0xffffffff
                models = [f32(f32(f32(f32(.3) + f32(bonus)) * effect_multiplier) * qualified_power),
                          f32(f32(f32(.15) + f32(min(bonus, .3))) * effect_multiplier)]
                assert [damage, haste] == [struct.unpack('<I', struct.pack('<f', v))[0] for v in models]
                empowerment_cases.append(dict(bonus=bonus, effect_multiplier=effect_multiplier,
                                               qualified_power=qualified_power, damage_bits=damage, haste_bits=haste))
    description_cases = []
    stats = alloc(80)
    frame = stack + 0x10000
    for bonus in [0., .15, .45]:
        for effect_multiplier in [1., 3., .1]:
            for qualified_power in [1., 2.5]:
                for buff_bonus in [0., .2]:
                    put(instance + 0x3c, '<2f', bonus, min(bonus, .3))
                    put(instance + 0x60, '<f', qualified_power)
                    put(stats + 0x40, '<f', buff_bonus)
                    put(frame + 0x1b8, '<Q', instance)
                    for register, value in [(r.UC_X86_REG_RDI, 0x146baf508), (r.UC_X86_REG_RBP, frame),
                                            (r.UC_X86_REG_R12, stats), (r.UC_X86_REG_RSP, stack + 0x18008),
                                            (r.UC_X86_REG_XMM7, struct.unpack('<I', struct.pack('<f', effect_multiplier))[0])]:
                        u.reg_write(register, value)
                    u.emu_start(0x14597028f, 0x145970309, count=100)
                    damage = u.reg_read(r.UC_X86_REG_XMM9) & 0xffffffff
                    u.emu_start(0x14597034c, 0x14597035e, count=100)
                    haste = u.reg_read(r.UC_X86_REG_XMM7) & 0xffffffff
                    factor = f32(1. + f32(buff_bonus))
                    models = [f32(f32(f32(f32(f32(f32(.3) + f32(bonus)) * f32(effect_multiplier)) * qualified_power) * factor) * 100.),
                              f32(f32(f32(f32(f32(.15) + f32(min(bonus, .3))) * f32(effect_multiplier)) * factor) * 100.)]
                    assert [damage, haste] == [struct.unpack('<I', struct.pack('<f', value))[0] for value in models]
                    description_cases.append(dict(bonus=bonus, effect_multiplier=effect_multiplier,
                                                  qualified_power=qualified_power, buff_bonus=buff_bonus,
                                                  damage_percent_bits=damage, haste_percent_bits=haste))
    result = dict(target_sha256=SHA, talent_records=records, scorched_earth_record=scorch_record,
                  scorched_earth_modifier_cases=scorch_cases,
                  empowerment_description_template=description, empowerment_description_cases=description_cases,
                  constructor_raw=[raw.hex() for raw in constructed], rank_cases=rank_cases,
                  upgrade_cases=upgrade_cases, modifier_cases=modifier_cases, empowerment_cases=empowerment_cases, calls={hex(a): n for a, n in calls.items()},
                  limits=['Immutable native instruction emulation only; no source compilation or application execution.',
                          'Reviewed heap/vector-growth boundaries; no OS, file, networking or renderer code executes.',
                          'The source tests remain unrun and original/rebuilt runtime and visual parity are unverified.'])
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / 'native-cases.json').write_text(json.dumps(result, indent=2) + '\n')
    if args.check:
        expected = json.loads((RETAINED / 'native-cases.json').read_text())
        assert expected == result
    print(f'Checked 15 talent records, 2 Scorched Earth payloads/10 keyed modifier cases, 4 constructor effects, {len(rank_cases)} rank cases and {len(upgrade_cases)} upgrade-cap cases, 2 modifier cases, 12 buff cases and {len(description_cases)} description cases; static only')


if __name__ == '__main__':
    main()
