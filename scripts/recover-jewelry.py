#!/usr/bin/env python3
"""Check current jewelry tables and all increment lanes without a compiler/game.

--write emits the source catalog and compact target-bound proof. Native leaf
instructions run in Unicorn with actual PE data and no supplied function calls.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
TABLE, COUNT = 0x146c00368, 23
START, END = 0x14589e0e0, 0x14589e755
OUTPUT = ROOT / 'docs/analysis/evidence/jewelry/validation.json'
CATALOG = ROOT / 'crates/azeroth-survivors-re/src/loot_rewards/catalog_01120.rs'


def f(value):
    return _shared_f32(value)


def bits(value):
    return _shared_bits(value)


def source_tag(tag):
    return 19 if tag == 6 else tag - 1 if tag >= 7 else tag


def increment(row, rarity, value, upgrades):
    tag, base = row['source_tag'], f(row['base'])
    if tag == 15:
        return 2.0 if rarity >= 3 else 1.0
    current = value if value is not None else 0.0
    raw = f(f(RARITIES[rarity] * base) * (1.0 if value is not None else 1.5))
    cap = (float('inf') if tag in (*range(6), 7, 19) else
           0.6 if tag == 8 else f(base * (3.0 if tag in (6, 14, 17) else 4.0 if tag == 18 else 5.0)))
    remaining = max(f(f(cap) - current), 0.0)
    if tag in (0, 1, 3, 4, 7, 8):
        divisor = f(1.0 + f(float(upgrades) * f(0.08))) if value is not None else 1.0
        return min(f(raw / divisor), remaining)
    if tag in (2, 5, 19):
        threshold, step, total = f(base * 3.0), f(raw * 0.0625), current
        for _ in range(16):
            if threshold >= total:
                growth = f(1.0 + f(f(f(-0.75) * total) / threshold))
            else:
                ratio = f(threshold / total)
                growth = f(f(ratio * ratio) * 0.25)
            total = f(total + f(step * growth))
        return f(total - current)
    return min(f(f(raw * remaining) / f(base * (3.0 if tag in (6, 14, 17) else 4.0 if tag == 18 else 5.0))), remaining)


RARITIES = [f(x) for x in (1.0, 1.4, 1.8, 2.4, 3.2)]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.112.0'
    data = target_bytes(target)
    module = load_script('jewelry_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        assert at is not None
        value = data[at:at + count]
        assert len(value) == count
        return value

    def span(address, count):
        return dict(address=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=count, sha256=hashlib.sha256(raw(address, count)).hexdigest())

    def text(address):
        pointer, count = struct.unpack('<QQ', raw(address, 16))
        assert 0 < count < 1024
        return raw(pointer, count).decode()

    rows = []
    for index in range(COUNT):
        at = TABLE + index * 72
        base, tag, slot, pad1, pad2 = struct.unpack('<f4B', raw(at + 64, 8))
        assert slot in (0, 1) and pad1 == pad2 == 0
        rows.append(dict(key=text(at), name=text(at + 16), icon=text(at + 32),
                         description=text(at + 48), base=base, base_bits=bits(base),
                         native_tag=tag, source_tag=source_tag(tag), slot=slot))
    assert rows[-1]['key'] == 'star_of_mystaria' and rows[-1]['native_tag'] == 6
    assert len({row['key'] for row in rows}) == COUNT
    assert struct.unpack('<5f', raw(0x146bff100, 20)) == tuple(RARITIES)
    old = (ROOT / 'crates/azeroth-survivors-re/src/loot_rewards/catalog_01001.rs').read_text()
    suffix = old[old.index('pub const RARITY_MULTIPLIERS:'):]
    # Rarity and amulet-rank constants keep their separately recovered source
    # contract. Only the jewelry table is re-generated here.
    generated = ['//! Jewelry definitions recovered from the hash-verified 0.112.0 EXE.',
                 '//! Native tag 6 maps to stable source 19; native 7..19 map to source 6..18.',
                 '//! See scripts/recover-jewelry.py and docs/analysis/jewelry-0.112.0.md.',
                 'use super::JewelryDefinition;', 'pub const JEWELRY: [JewelryDefinition; 23] = [']
    for row in rows:
        generated.append('    JewelryDefinition { key: %s, name: %s, icon: %s, description: %s, base: f32::from_bits(%s), tag: %d, slot: %d },' % (
            *(json.dumps(row[k], ensure_ascii=False) for k in ['key', 'name', 'icon', 'description']),
            hex(row['base_bits']), row['source_tag'], row['slot']))
    generated += ['];', suffix.rstrip()]
    generated = '\n'.join(generated) + '\n'

    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    native = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    native.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        native.mem_write(pe.image_base + s['rva'], data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    scratch, stack, done = 0x200000000, 0x300000000, 0x400000000
    for at in (scratch, stack, done):
        native.mem_map(at, 0x10000)

    allowed, endpoint = [(START, END)], done

    def hook(_, address, count, unused):
        if address == endpoint:
            native.emu_stop()
        elif not any(a <= address and address + count <= b for a, b in allowed):
            raise RuntimeError('Unreviewed native instruction/call: ' + hex(address))

    native.hook_add(UC_HOOK_CODE, hook)
    cases, digest, star_cases = 0, hashlib.sha256(), []
    for index, row in enumerate(rows):
        for rarity in range(5):
            for present, scale, upgrades in [(False, 0., 0), (True, 0., 0), (True, 1.5, 0),
                                            (True, 3., 3), (True, 4.95, 20), (True, 10., 100),
                                            (True, 100., 10000)]:
                value = f(row['base'] * scale)
                native.mem_write(scratch, struct.pack('<B3xfI', present, value, upgrades))
                native.mem_write(stack + 0x800, struct.pack('<Q', done))
                for which, value_ in [('RSP', stack + 0x800), ('RCX', TABLE + index * 72),
                                      ('RDX', rarity), ('R8', scratch), ('MXCSR', 0x1f80)]:
                    native.reg_write(getattr(r, 'UC_X86_REG_' + which), value_)
                native.emu_start(START, 0, count=10000)
                assert native.reg_read(r.UC_X86_REG_RIP) == done
                actual = native.reg_read(r.UC_X86_REG_XMM0) & 0xffffffff
                expected = bits(increment(row, rarity, value if present else None, upgrades))
                assert actual == expected, (row['key'], rarity, value, upgrades, hex(actual), hex(expected))
                digest.update(struct.pack('<I', actual))
                cases += 1
                if row['key'] == 'star_of_mystaria':
                    star_cases.append(dict(rarity=rarity, present=present, current_bits=bits(value),
                                           upgrades=upgrades, increment_bits=actual))
    # Reuse the one canonical current shared-stat extract, owned by the buff
    # recovery. Execute only its Mystaria arithmetic with independent inputs.
    buff_path = ROOT / 'docs/analysis/evidence/buff-potency/manifest.json'
    buff = json.loads(buff_path.read_text())
    assert buff['target_sha256'] == SHA
    stat_cases = []
    allowed, endpoint = [(0x1458f3847, 0x1458f3865)], 0x1458f38d0
    for value in [0., 0.01, 0.25, 0.74999, 0.75, 1.5, 10.]:
        for health in [1., 1.5, 4.]:
            for armor in [0., 0.08, 0.4]:
                value, health, armor = f(value), f(health), f(armor)
                for index, amount in [(9, value), (4, health), (3, armor)]:
                    native.reg_write(getattr(r, 'UC_X86_REG_XMM' + str(index)), bits(amount))
                native.emu_start(0x1458f3847, endpoint, count=20)
                assert native.reg_read(r.UC_X86_REG_RIP) == endpoint
                result = [native.reg_read(getattr(r, 'UC_X86_REG_XMM' + str(i))) & 0xffffffff for i in [4, 3]]
                expected = [bits(f(health + value)), bits(f(armor + min(f(value * f(0.16)), f(0.12))))]
                assert result == expected
                stat_cases.append(dict(value_bits=bits(value), health_bits=bits(health), armor_bits=bits(armor),
                                       health_result_bits=result[0], armor_result_bits=result[1]))
    # Every shared descriptor is read; Star is absent rather than renamed in
    # place, so the live old-asset adapter removes it before offer expansion.
    shared = []
    for index in range(16):
        at = 0x146c015c8 + index * 80
        shared.append(dict(key=text(at), name=text(at + 16), icon=text(at + 32),
                           rarity=struct.unpack('<Q', raw(at + 64, 8))[0]))
    legacy = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/native-amulets-0.100.1.json').read_text())
    assert shared == [{k: row[k] for k in ['key', 'name', 'icon', 'rarity']}
                      for row in legacy['shared'] if row['key'] != 'star_of_mystaria']
    proof = dict(target=target, jewelry_table=span(TABLE, COUNT * 72), rows=rows,
                 increment=span(START, END - START), native_cases=cases,
                 output_sha256=digest.hexdigest(), star_cases=star_cases, mystaria_stats=stat_cases,
                 stat_evidence='docs/analysis/evidence/0.112.0/buff-potency/manifest.json', shared_amulets=shared,
                 shared_table=span(0x146c015c8, 16 * 80),
                 limits=['Native x64 leaf and actual PE data execute in bounded Unicorn; no calls are supplied.',
                         'The comparison model is a translation of the live Rust formula, not compiled Rust.',
                         'Shared metadata is checked; effect consumers, Codex, compilation and game/parity have separate proof boundaries.'])
    if args.write:
        CATALOG.write_text(generated)
        OUTPUT.parent.mkdir(parents=True, exist_ok=True)
        OUTPUT.write_text(json.dumps(proof, indent=2, ensure_ascii=False) + '\n')
    else:
        assert CATALOG.read_text() == generated
        assert json.loads(OUTPUT.read_text()) == proof
    print(f'Checked {COUNT} current jewelry rows, {cases} exact native increment cases and 16 shared amulet identities; no compiler/game')


if __name__ == '__main__':
    main()
