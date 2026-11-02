#!/usr/bin/env python3
"""Check current generic aura indices, aliases and the absorb publication gate.

Only original instructions execute in explicit synthetic fixtures. No Rust,
compiler, game process, full publisher or global alias closure is exercised.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, file_sha256, json_text
sys.path[:0] = [str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'), str(ROOT / 'runtime/armory-recovery/python-libs')]
import capstone
import native_talent_fixture as native

KEPT = ROOT / 'docs/analysis/evidence/0.112.0/player-aura-indices'
STAGE = ROOT / 'runtime/gameplay-frontiers-0.112.0/aura-indices-staged'
SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'


def span(first, last):
    offset = native.pe.rva_offset(first - native.pe.image_base)
    value = native.data[offset:offset + last - first]
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    assert sum(row.size for row in decoder.disasm(value, first)) == len(value)
    return dict(va=hex(first), end_exclusive=hex(last), byte_count=len(value), sha256=hashlib.sha256(value).hexdigest())


def indices(machine):
    cases = [[tag] for tag in range(36)] + [[], [31, 18], [18, 31], [20, 31], [31, 20], [29, 30, 31, 33],
        [15, 31, 19, 20, 18, 15], [19, 15], [15, 15], [0, 18, 20, 31], [31, 31], [20, 18, 31, 19, 19, 15]]
    results = []
    for tags in cases:
        pointer = machine.alloc(len(tags) * 64)
        values = b''.join(bytes([tag]) + bytes(63) for tag in tags)
        machine.u.mem_write(pointer, values or bytes(1))
        output = machine.alloc(24)
        machine.call(0x1458e70c0, output, pointer, len(tags))
        count = machine.q(output + 16)
        result_pointer = machine.q(output + 8)
        actual = [[machine.q(result_pointer + i * 16), machine.u.mem_read(result_pointer + i * 16 + 8, 1)[0]] for i in range(count)]
        expected = []
        shield = next((i for i, tag in enumerate(tags) if tag in [18, 20, 31]), None)
        rescue = next((i for i, tag in enumerate(tags) if tag == 19), None)
        if shield is not None:
            expected.append([shield, 0])
        if rescue is not None:
            expected.append([rescue, 2])
        expected.extend([i, 1] for i, tag in enumerate(tags) if tag == 15)
        assert actual == expected
        assert bytes(machine.u.mem_read(pointer, len(values))) == values
        names = ['Soul Link' if tag == 31 else 'Shield Mastery' if tag == 18 else 'Last Stand' if tag == 20 else 'Other' for tag in tags]
        results.append(dict(native_generic_tags=tags, provenance=names, native_index_kind_pairs=actual, native_shield_index=shield))
    return results


def aliases(machine):
    result = []
    for name in ['Soul Link', 'Flurry', 'Last Stand', 'Reincarnation', 'Fortified', 'Shield Mastery', 'Ardent Defender',
                 'Cheat Death', 'Blessed Life', 'Divine Intervention', 'Other', 'Soul link', 'soul_link', '', 'An unknown provenance name']:
        encoded = name.encode()
        pointer = machine.alloc(len(encoded))
        machine.u.mem_write(pointer, encoded or bytes(1))
        for kind in range(3):
            value = machine.call(0x14597a300, pointer, len(encoded), kind)
            result.append(dict(name=name, kind=kind, spell_id=value))
    assert next(row['spell_id'] for row in result if row['name'] == 'Soul Link' and row['kind'] == 0) == 19028
    assert next(row['spell_id'] for row in result if row['name'] == 'Other' and row['kind'] == 0) == 27779
    return result


def publication(machine):
    result = []
    for amount_bits in [0xbf800000, 0, 0x3f800000, 0x7fc00000, 0x7f800000]:
        for active_shield in [0, 1]:
            game = machine.alloc(0x500)
            frame = machine.alloc(0x200) + 0x80
            output = machine.alloc(96)
            machine.u.mem_write(game + 0x4ec, struct.pack('<I', amount_bits))
            for register, value in [(native.UC_X86_REG_RCX, game), (native.UC_X86_REG_RAX, active_shield), (native.UC_X86_REG_RBP, frame)]:
                machine.u.reg_write(register, value)
            machine.u.emu_start(0x1458ea0c9, 0x1458ea0df, count=100)
            machine.put(frame - 0x10, 8, output, 0)
            machine.u.reg_write(native.UC_X86_REG_R12, 19028)
            machine.u.emu_start(0x1458ea1e0, 0x1458ea110, count=100)
            count = machine.q(frame)
            expected = int(amount_bits in [0x3f800000, 0x7f800000] and active_shield == 0)
            assert count == expected
            rows = [list(struct.unpack('<III', machine.u.mem_read(output + i * 12, 12))) for i in range(count)]
            assert rows == ([[19028, 0x7f800000, 1]] if expected else [])
            result.append(dict(absorb_bits=amount_bits, active_shield=bool(active_shield), published=rows))
    return result


def producer_aliases(machine):
    def raw(address, size):
        offset = native.pe.rva_offset(address - native.pe.image_base)
        return native.data[offset:offset + size]
    def pair(address):
        return struct.unpack('<QQ', raw(address, 16))
    def text(address):
        pointer, count = pair(address)
        return raw(pointer, count).decode()
    def from_memory(address):
        return bytes(machine.u.mem_read(machine.q(address), machine.q(address + 8))).decode()
    source_classes = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/talents.json').read_text())['classes']
    source = {row['id']: {talent['key']: talent for tree in row['trees'] for talent in tree['talents']} for row in source_classes}
    for class_id, filename in [(1, 'warrior-talents-0.112.0.json'), (9, 'warlock-effects-0.112.0.json')]:
        source[class_id].update({row['key']: row for row in json.loads((ROOT / 'crates/azeroth-survivors-re/assets' / filename).read_text())['talents']})
    rows = []
    def add(role, key, name, tags):
        for index, tag in enumerate(tags):
            if tag not in [15, 18, 19, 20, 31]:
                continue
            kind = 1 if tag == 15 else 2 if tag == 19 else 0
            encoded = name.encode()
            pointer = machine.alloc(len(encoded))
            machine.u.mem_write(pointer, encoded)
            rows.append(dict(producer=role, key=key, name=name, native_effect_index=index, native_tag=tag, kind=kind,
                             spell_id=machine.call(0x14597a300, pointer, len(encoded), kind)))
    for class_id in [1, 2, 3, 4, 5, 7, 8, 9, 11]:
        trees = struct.unpack('<Q', raw(0x14723f158 + 8 * (class_id - 1), 8))[0]
        for tree in range(3):
            pointer, count = pair(trees + tree * 64 + 48)
            for index in range(count):
                descriptor = pointer + index * 160
                key, name = text(descriptor + 48), text(descriptor + 64)
                effects, effect_count = pair(descriptor + 96)
                tags = [raw(effects + slot * 64, 1)[0] for slot in range(effect_count)]
                if any(tag in [15, 18, 19, 20, 31] for tag in tags):
                    assert source[class_id][key]['name'] == name
                    add(f'class{class_id}', key, name, tags)
    for index in range(113):
        output = machine.alloc(112)
        machine.call(0x1458a1730, output, 0x146bf5eb0 + index * 120)
        effects, count = machine.q(output + 56), machine.q(output + 64)
        add('generated-amulet', from_memory(output + 8), from_memory(output + 32),
            [machine.u.mem_read(effects + slot * 64, 1)[0] for slot in range(count)])
    for index in range(16):
        descriptor = 0x146c015c8 + index * 80
        effects, count = pair(descriptor + 48)
        add('shared-amulet', text(descriptor), text(descriptor + 16), [raw(effects + slot * 64, 1)[0] for slot in range(count)])
    assert len(rows) == 19
    return dict(scanned_talent_descriptors=355, scanned_generated_amulets=113, scanned_shared_amulets=16,
                actual_aura_source_rows=rows, amulet_source_contract='docs/analysis/evidence/0.112.0/balance/amulets.json',
                limits='Current immutable English provenance inputs; the shared localization seam is not replaced by a whole-program alias claim.')


def packed_words(machine):
    path = ROOT / 'docs/analysis/evidence/0.100.1/run-presentation/player-aura-native.json'
    seeds = json.loads(path.read_text())
    flag_results, application_results = [], []
    for case in seeds['flags']:
        group, mask = case['group'], case['mask']
        rows = machine.alloc(48 * 16)
        for bit in range(8):
            machine.u.mem_write(rows + (group * 8 + bit) * 16, struct.pack('<I', (mask >> bit) & 1))
        group_pointer, descriptor = machine.alloc(8), machine.alloc(24)
        machine.put(group_pointer, group)
        machine.put(descriptor, group_pointer, rows, 48)
        actual = machine.call(0x1458e2350, descriptor)
        assert actual == case['expected']
        flag_results.append([group, mask, actual])
    for case in seeds['applications']:
        rows = machine.alloc(48 * 16)
        for index, count in enumerate(case['counts']):
            machine.u.mem_write(rows + (case['group'] * 4 + index) * 16, struct.pack('<IIII', (case['present'] >> index) & 1, 0, 0, count))
        machine.u.reg_write(native.UC_X86_REG_R13, rows)
        machine.u.reg_write(native.UC_X86_REG_R14, case['group'])
        machine.u.emu_start(0x1458eafbf, 0x1458eb0bd, count=100)
        actual = machine.u.reg_read(native.UC_X86_REG_R8) & 0xffffffff
        assert actual == case['expected']
        application_results.append([case['group'], case['present'], case['counts'], actual])
    return dict(input_fixture=dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path), historical_target='0.100.1'),
                flags_cases=len(flag_results), flags_sha256=hashlib.sha256(json.dumps(flag_results, separators=(',', ':')).encode()).hexdigest(),
                applications_cases=len(application_results), applications_sha256=hashlib.sha256(json.dumps(application_results, separators=(',', ':')).encode()).hexdigest(),
                current_original_bytes_replayed=True, flags_field_base=95, applications_field_base=113)


def cooldowns(machine):
    stops = {0x1458ea2d9, 0x1458ea352}
    hook = machine.u.hook_add(native.UC_HOOK_CODE, lambda u, address, size, context: u.emu_stop() if address in stops else None)
    result = []
    try:
        for racial in [False, True]:
            for bits in [0xbf800000, 0, 0x3f000000, 0x41200000, 0x447a0000, 0x7fc00000, 0x7f800000]:
                instance, frame = machine.alloc(88), machine.alloc(0x200) + 0x80
                machine.u.mem_write(instance + 12, struct.pack('<I', bits))
                machine.u.mem_write(frame + 0x1c, struct.pack('<f', 10.0))
                for register, value in [(native.UC_X86_REG_RAX, instance), (native.UC_X86_REG_RBX, instance), (native.UC_X86_REG_RBP, frame)]:
                    machine.u.reg_write(register, value)
                machine.u.reg_write(native.UC_X86_REG_XMM6, 0)
                machine.u.reg_write(native.UC_X86_REG_XMM7, 0x447a0000)
                machine.u.emu_start(0x1458ea310 if racial else 0x1458ea330, 0, count=100)
                admitted = machine.u.reg_read(native.UC_X86_REG_RIP) == 0x1458ea352
                assert admitted == (bits in [0x3f000000, 0x41200000, 0x7f800000])
                spell_id = machine.u.reg_read(native.UC_X86_REG_R14) & 0xffffffff
                assert spell_id == (6788 if racial else 25771)
                expires = machine.u.reg_read(native.UC_X86_REG_XMM8) & 0xffffffff if admitted else None
                result.append(dict(racial=racial, remaining_bits=bits, admitted=admitted, spell_id=spell_id, expires_bits=expires))
    finally:
        machine.u.hook_del(hook)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['version'] == '0.112.0' and target['sha256'] == SHA
    source_path = ROOT / 'crates/azeroth-survivors-re/src/run_effects/player_auras.rs'
    source = source_path.read_text()
    for token in ['("Soul Link",0)=>19028', 'matches!(row.tag(),18|20)', 'row.tag()==253&&row.bytes[63]==31',
                  'let alias=|index,kind|player_aura_alias(self.provenance[index],kind)', 'if self.absorb>0. && !shield_active']:
        assert token in source, token
    machine = native.Machine()
    result = dict(schema_version=1, target={key: target[key] for key in ('version', 'sha256', 'size_bytes')},
        generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(), sha256=file_sha256(Path(__file__))),
        source=dict(path=source_path.relative_to(ROOT).as_posix(), sha256=file_sha256(source_path)),
        native_ranges=dict(index_collector=span(0x1458e70c0, 0x1458e7220), alias=span(0x14597a300, 0x14597a5ce),
            publication_call=span(0x1458ea046, 0x1458ea065), absorb_gate=span(0x1458ea0c9, 0x1458ea0df),
            shield_publication=span(0x1458ea1e0, 0x1458ea225), flags=span(0x1458e2350, 0x1458e2520),
            applications=span(0x1458eafbf, 0x1458eb0bd), cooldowns=span(0x1458ea310, 0x1458ea352)),
        index_cases=indices(machine), alias_cases=aliases(machine), shield_publication_cases=publication(machine),
        actual_producer_aliases=producer_aliases(machine), packed_word_contract=packed_words(machine), cooldown_cases=cooldowns(machine),
        original_input_rows_unchanged=True, observed_seams=[hex(a) for a in sorted(machine.seams)],
        compilation_run=False, game_process_run=False, parity_verified=False,
        limits=['Index collector and shield gate execute as original instructions in synthetic fixtures.',
                'Allocator, byte operations and external ABI seams retain their existing shared fixture meanings.',
                'The full aura publisher, native body ownership and whole mutable alias closure are not certified.'])
    if args.stage:
        STAGE.mkdir(parents=True, exist_ok=True)
        (STAGE / 'contracts.json').write_text(json_text(result))
    else:
        assert json.loads((KEPT / 'contracts.json').read_text()) == result
    print(f"Player aura indices 0.112.0: {len(result['index_cases'])} native index/order cases, {len(result['alias_cases'])} aliases, 19 actual producer rows, 10 absorb gates, 14 cooldown gates, 1536 flag words and 180 application words pass; no build or game run.")


if __name__ == '__main__':
    main()
