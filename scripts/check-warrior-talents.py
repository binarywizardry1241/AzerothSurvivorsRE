#!/usr/bin/env python3
"""Check current Warrior definitions, rank collection and victim damage instructions.

No compilation or game launch. --write retains compact target-bound evidence;
normal mode reproduces and compares it. Native allocator/string/English seams
are explicitly inherited from native_talent_fixture. Damage-prefix vectors
execute only the admitted, unchanged current instructions, without host seams.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
import argparse
import hashlib
import json
import struct

from native_talent_fixture import ROOT, Machine, data, pe, target
from native_talent_fixture import (
    UC_HOOK_CODE, UC_X86_REG_R14, UC_X86_REG_RDX, UC_X86_REG_RDI,
    UC_X86_REG_RIP, UC_X86_REG_XMM0, UC_X86_REG_XMM1, UC_X86_REG_XMM8,
)

EVIDENCE = ROOT / 'docs/analysis/evidence/0.112.0/warrior-talents'
PREFIX = (0x14593ed6c, 0x14593f188)


def raw(address, size):
    offset = pe.rva_offset(address - pe.image_base)
    return data[offset:offset + size]


def span(start, end):
    return dict(start=hex(start), end_exclusive=hex(end),
                file_offset=hex(pe.rva_offset(start - pe.image_base)),
                byte_count=end - start, sha256=hashlib.sha256(raw(start, end-start)).hexdigest())


def bits(value):
    return _shared_bits(value)


def f32(value):
    return _shared_f32(value)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    assert manifest['target'] == target
    for record in manifest['ranges']:
        start, end = int(record['start'], 16), int(record['end_exclusive'], 16)
        assert span(start, end) == {k: v for k, v in record.items() if k != 'role'}
    assert hashlib.sha256((EVIDENCE / 'selected-native.asm').read_bytes()).hexdigest() == manifest['assembly_sha256']
    leads = json.loads((ROOT / 'docs/analysis/evidence/0.112.0/release-data-leads.json').read_text())
    source = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/warrior-talents-0.112.0.json').read_text())
    assert source['target_sha256'] == target['sha256'] and source['target_version'] == target['version']
    talents = {t['key']: t for t in source['talents']}
    assert set(talents) == {'imp_heroic', 'unbridled_wrath'}
    vm = Machine()
    ranks, descriptions, definitions = [], [], []
    locale_labels = []
    for locale in leads['locales']:
        payload = locale['payload']
        offset = int(payload['file_offset'], 16)
        native_locale = json.loads(data[offset:offset + payload['byte_count']])
        source_locale = json.loads((ROOT / locale['retained_source']).read_text())
        for lead in leads['selected_talents']:
            for field in ['name', 'description']:
                key = lead['fields'][field]
                assert source_locale[key] == native_locale[key] and source_locale[key]
                locale_labels.append(dict(locale=locale['code'], key=key, value=source_locale[key]))
    for lead in leads['selected_talents']:
        key = lead['fields']['key']
        definition = talents[key]
        assert all(definition[k] == v for k, v in lead['fields'].items()), key
        native_raw = bytes.fromhex(lead['effect_hex'])
        assert native_raw[0] == 36
        assert bytes.fromhex(definition['effects'][0]['payload']) == bytes([30]) + native_raw[1:]
        address = int(lead['record']['virtual_address'], 16)
        assert raw(address, 160).hex() == lead['record_hex']
        assert raw(address, 48) == bytes(48), 'Selected Warrior prerequisite/weight slices differ'
        assert not raw(address + 155, 1)[0] and not definition['exclusive']
        assert definition['prerequisite'] is None and definition['alternative_prerequisite'] is None
        assert bool(vm.call(0x14599e380, address) & 255) == definition['milestone']
        assert raw(int(lead['effect']['virtual_address'], 16), 64) == native_raw
        definitions.append(dict(key=key, record=lead['record'], effect=lead['effect'],
                                semantic_translation='Current raw36 -> source internal30; stat byte and magnitude preserved.'))
        for rank in [0, 1, 2, 3, 4, 5, 255]:
            vector = vm.vector([(address, rank)])
            out = vm.alloc(24)
            vm.call(0x14599e8d0, out, vector)
            assert vm.q(out + 16) == 1
            result = bytes(vm.u.mem_read(vm.q(out + 8), 72))
            amount = struct.unpack_from('<f', native_raw, 4)[0]
            assert result[8] == 36 and result[16] == native_raw[8]
            assert struct.unpack_from('<I', result, 12)[0] == bits(f32(amount * rank))
            ranks.append(dict(key=key, rank=rank, native_tag=result[8], stat=result[16],
                              amount_bits=struct.unpack_from('<I', result, 12)[0]))
        for rank in range(1, 6):
            out = vm.alloc(24)
            vm.call(0x14599ddf0, out, address, rank)
            text = bytes(vm.u.mem_read(vm.q(out + 8), vm.q(out + 16))).decode()
            expected = definition['description'].replace('{v}', definition['numeric_values'][rank - 1])
            assert text == expected, (key, rank, text, expected)
            descriptions.append(dict(key=key, rank=rank, text=text))

    # No calls leave this admitted prefix. An invalid periodic-row pointer with
    # a nonzero length deliberately proves the native gate reads length only.
    def prefix_only(u, address, size, unused):
        if not PREFIX[0] <= address < PREFIX[1]:
            raise AssertionError(f'Unreviewed damage-prefix instruction {address:#x}')
    guard = vm.u.hook_add(UC_HOOK_CODE, prefix_only)
    game, actor, stats = vm.H + 0x1000, vm.H + 0x4000, vm.H + 0x6000
    damage = []
    configurations = ['plain', 'control', 'boss', 'execute', 'vulnerable', 'shield', 'combined', 'duplicates']
    for rank in range(6):
        trauma = f32(struct.unpack_from('<f', bytes.fromhex(leads['selected_talents'][0]['effect_hex']), 4)[0] * rank)
        for count in [0, 1, 3]:
            for config in configurations:
                vm.u.mem_write(vm.H, bytes(0x8000))
                def put(address, fmt, *values):
                    vm.u.mem_write(address, struct.pack(fmt, *values))
                rows = [(21, trauma), (23, .3), (16, .25), (18, .1), (19, .2), (20, .3), (28, .4)]
                if config == 'duplicates':
                    rows.extend([(21, .02), (21, -.01)])
                for index, (tag, value) in enumerate(rows):
                    put(stats + index * 8, '<B3xf', tag, value)
                put(game + 0x7f8, '<QQ', stats, len(rows))
                put(actor + 8, '<QQ', 0xdead00000000, count)
                put(actor + 0x18, '<q', -1)
                put(actor + 0x158, '<ff', 100., 100.)
                control = config in ['control', 'combined']
                boss = config in ['boss', 'combined']
                execute = config in ['execute', 'combined']
                vulnerable = config in ['vulnerable', 'combined']
                shield = config in ['shield', 'combined']
                if control: put(actor + 0x1ac, '<f', 11.)
                if boss: put(actor + 0x18, '<Q', 0)
                if execute: put(actor + 0x158, '<f', 29.)
                if vulnerable: put(actor + 0x110, '<ff', .125, 11.)
                if shield: put(game + 0x4ec, '<f', 10.)
                extra = .03125 if config == 'combined' else 0.
                put(actor + 0x1a4, '<f', extra)
                for register, value in [(UC_X86_REG_R14, actor), (UC_X86_REG_RDX, 0x1d8),
                                         (UC_X86_REG_RDI, game), (UC_X86_REG_XMM0, bits(1.)),
                                         (UC_X86_REG_XMM1, bits(10.))]:
                    vm.u.reg_write(register, value)
                vm.u.emu_start(*PREFIX, count=10000)
                assert vm.u.reg_read(UC_X86_REG_RIP) == PREFIX[1]
                actual = vm.u.reg_read(UC_X86_REG_XMM8) & 0xffffffff
                def total(tag):
                    result = -0.0
                    for kind, value in rows:
                        if kind == tag: result = f32(result + f32(value))
                    return result
                expected = f32(total(18) + 1.) if control else 1.
                if boss: expected = f32(expected + total(19))
                if execute: expected = f32(expected + total(20))
                if count: expected = f32(expected + total(21))
                if vulnerable: expected = f32(expected + .125)
                if shield: expected = f32(expected + total(28))
                expected = f32(expected + extra)
                assert actual == bits(expected), (rank, count, config, hex(actual), hex(bits(expected)))
                damage.append(dict(rank=rank, periodic_rows=count, context=config, multiplier_bits=actual))
    vm.u.hook_del(guard)
    proof = dict(target=target, definitions=definitions,
                 owners=dict(rank_collector=span(0x14599e8d0, 0x14599ef73),
                             rank_description=span(0x14599ddf0, 0x14599e1ee),
                             victim_multiplier=span(*PREFIX)),
                 rank_cases=ranks, description_cases=descriptions, damage_cases=damage,
                 locale_labels=locale_labels,
                 counts=dict(ranks=len(ranks), descriptions=len(descriptions), damage=len(damage),
                             locale_labels=len(locale_labels)),
                 limits=['Rank collector vectors include raw255 to show normalization is a separate owner; saved allocation clamps to five before gameplay.',
                         'Allocator/string/English fallback seams follow native_talent_fixture; damage-prefix vectors have no call seams.',
                         'Current victim predicate checks retained periodic length, including exhausted entries, without filtering owner/spell/ticks.',
                         'Source integration, compilation, rendering and original/rebuilt gameplay parity are not executed by this check.'])
    path = EVIDENCE / 'native-cases.json'
    text = json.dumps(proof, indent=2, ensure_ascii=False) + '\n'
    if args.write:
        EVIDENCE.mkdir(parents=True, exist_ok=True)
        path.write_text(text)
    else:
        assert json.loads(path.read_text()) == proof, 'Warrior native evidence changed; review before refreshing'
    print(f"Warrior current native checks: {len(ranks)} rank, {len(descriptions)} description, {len(damage)} damage-prefix and {len(locale_labels)} localized labels passed; no build/game.")


if __name__ == '__main__':
    main()
