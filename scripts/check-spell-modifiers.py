#!/usr/bin/env python3
"""Replay the current seven-lane evaluator for bounded selectors and live inputs.

Uses original Win64 instructions and the shared exact-target mapped-image VM.
No compiler or game process. The target's unchecked dispatch is exercised only
for explicit selectors0..4 and modifiers0..6, not claimed as a full input domain.
"""
from native_recovery import f32 as _shared_f32, bits as _shared_bits
import argparse
import hashlib
import json
import struct

import native_talent_fixture as n

ROOT = n.ROOT
SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
BASE = ROOT/'docs/analysis/evidence/demonic-empowerment'
OUT = BASE/'spell-modifier-cases.json'


def f32(value):
    return _shared_f32(value)


def bits(value):
    return _shared_bits(value)


def native_bytes(address, size):
    offset = n.pe.rva_offset(address-n.pe.image_base)
    if offset is None or size < 0 or offset+size > len(n.data):
        raise ValueError('Unmapped current native range')
    return n.data[offset:offset+size]


def recover():
    if n.target['sha256'] != SHA:
        raise ValueError('Exact current target required')
    manifest = json.loads((BASE/'manifest.json').read_text())
    row = next(row for row in manifest['ranges'] if row['role'] == 'spell-modifiers')
    if hashlib.sha256(native_bytes(int(row['address'], 16), row['byte_count'])).hexdigest() != row['sha256']:
        raise ValueError('Current evaluator byte drift')
    for field in ['assembly', 'pseudocode']:
        if hashlib.sha256((BASE/row[field]).read_bytes()).hexdigest() != row[field+'_sha256']:
            raise ValueError('Current evaluator extraction drift')
    vm = n.Machine()
    abilities = {}
    # The current containing caller searches 0x34f8 bytes in 0x78-byte steps.
    # Only these five exact records are needed by this bounded replay.
    wanted = {'shadow_bolt', 'immolate', 'hellfire', 'soul_fire', 'demonic_empowerment'}
    for index in range(113):
        address = 0x146bf5eb0+index*120
        p, size = struct.unpack('<QQ', native_bytes(address, 16))
        key = native_bytes(p, size).decode()
        if key in wanted:
            abilities[key] = address
    if set(abilities) != wanted:
        raise ValueError('Current selected ability table drift')

    def string(value):
        encoded = value.encode()
        p = vm.alloc(len(encoded));vm.u.mem_write(p, encoded)
        return p, len(encoded)

    def evaluate(payloads, rank, ability_key):
        records = []
        model = [1.0, 1.0, 0, 1.0, 1.0, 0.0, 1.0]
        cooldown = 0.0;targets = 0.0
        ability = abilities[ability_key]
        school, kind = native_bytes(ability+116, 2)
        for payload in payloads:
            raw = bytearray.fromhex(payload['raw_hex'])
            selector = raw[8];modifier = raw[36]
            factor = payload.get('rank_values', [])
            factor = factor[min(rank-1, len(factor)-1)] if factor else float(rank)
            amount = f32(struct.unpack_from('<f', raw, 32)[0]*factor)
            if modifier == 1:
                amount = min(amount, 0.5)
            elif modifier == 2:
                amount = float(int(f32(amount+f32(0.0001))))
            key = next((s['value'] for s in payload['strings'] if s['offset'] == 16), None)
            keys = next((s['values'] for s in payload.get('lists', []) if s['offset'] == 16), None)
            pointer, count = 0, 0
            if selector == 1:
                pointer, count = string(key)
            elif selector == 2:
                pairs = [string(value) for value in keys]
                pointer = vm.alloc(16*len(pairs));count = len(pairs)
                vm.u.mem_write(pointer, b''.join(struct.pack('<QQ', *pair) for pair in pairs))
            record = bytearray(32)
            record[0:2] = raw[8:10]
            struct.pack_into('<QQ', record, 8, pointer, count)
            record[24] = modifier
            struct.pack_into('<f', record, 28, amount)
            records.append(record)
            matches = [True, key == ability_key, bool(keys and ability_key in keys), raw[9] == school, raw[9] == kind][selector]
            if not matches:
                continue
            if modifier == 1:
                cooldown = f32(cooldown+amount)
            elif modifier == 2:
                targets = f32(targets+amount)
            else:
                lane = {0: 0, 3: 3, 4: 4, 5: 5, 6: 6}[modifier]
                model[lane] = f32(model[lane]+amount)
        model[1] = max(f32(1.0-cooldown), f32(0.4))
        model[2] = round(targets)
        aggregate = vm.alloc(48);array = vm.alloc(32*len(records));output = vm.alloc(28)
        vm.u.mem_write(array, b''.join(records));vm.put(aggregate+32, array, len(records))
        vm.call(0x145897ab0, output, aggregate, ability)
        actual = list(struct.unpack('<7I', vm.u.mem_read(output, 28)))
        expected = [bits(value) if index != 2 else value for index, value in enumerate(model)]
        if actual != expected:
            raise ValueError(('Current seven-lane evaluator mismatch', actual, expected, ability_key))
        return actual

    def payload(selector, modifier):
        raw = bytearray(64);raw[0] = 31;raw[8] = selector
        raw[9] = 5 if selector == 3 else 0
        raw[36] = modifier
        struct.pack_into('<f', raw, 32, 2.0 if modifier == 2 else 0.25)
        strings = [{'offset': 16, 'value': 'shadow_bolt'}] if selector == 1 else []
        lists = [{'offset': 16, 'values': ['immolate', 'shadow_bolt']}] if selector == 2 else []
        return dict(raw_hex=raw.hex(), strings=strings, lists=lists, rank_values=[])

    selector_cases = []
    for selector in range(5):
        for modifier in range(7):
            value = payload(selector, modifier)
            for ability_key in ['shadow_bolt', 'hellfire']:
                selector_cases.append(dict(selector=selector, modifier=modifier, ability_key=ability_key,
                    payload=value, lane_bits=evaluate([value], 1, ability_key)))
    source = json.loads((ROOT/'crates/azeroth-survivors-re/assets/warlock-effects-0.112.0.json').read_text())
    selected = [('bane', 3), ('intensity', 5), ('imp_searing_pain', 3), ('aftermath', 5)]
    current_cases = []
    for key, rank in selected:
        talent = next(t for t in source['talents'] if t['key'] == key)
        effects = [p for p in talent['effects'] if p['raw_hex'].startswith('1f')]
        for ability_key in sorted(abilities):
            current_cases.append(dict(talent_key=key, rank=rank, ability_key=ability_key,
                lane_bits=evaluate(effects, rank, ability_key)))
    medallion = json.loads((ROOT/'crates/azeroth-survivors-re/assets/legionlord-0.112.0.json').read_text())['definition']
    effects = [dict(p, lists=[], rank_values=[]) for p in medallion['effects']]
    for ability_key in sorted(abilities):
        current_cases.append(dict(amulet_key=medallion['key'], rank=1, ability_key=ability_key,
            lane_bits=evaluate(effects, 1, ability_key)))
    # Multiple additive cooldown rows reach the shared 0.4 cap in insertion order.
    additive = [payload(0, 1)]*3
    combined = dict(payloads=additive, ability_key='shadow_bolt', lane_bits=evaluate(additive, 1, 'shadow_bolt'))
    return dict(target_sha256=SHA, version='0.112.0', selector_cases=selector_cases,
        current_cases=current_cases, combined_case=combined,
        limits=['Explicit selectors0..4 and modifiers0..6 only; unchecked dispatch is not a complete native enum-domain proof.',
                'Source assets are checked separately against current native producers; native evaluator replay uses their defined payload fields.',
                'No compiler, game process or original/rebuilt comparison.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args();result = recover();serialized = json.dumps(result, indent=2)+'\n'
    if args.write:
        OUT.write_text(serialized)
    elif OUT.read_text() != serialized:
        raise ValueError('Missing/stale current modifier fixtures')
    print(f"{len(result['selector_cases'])+len(result['current_cases'])+1} current seven-lane modifier cases pass; no build or game run.")


if __name__ == '__main__':
    main()
