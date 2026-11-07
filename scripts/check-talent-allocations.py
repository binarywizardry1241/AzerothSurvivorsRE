#!/usr/bin/env python3
"""Replay current talent allocation/migration contracts without builds or game launches."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import struct

from native_talent_fixture import ROOT, Machine, data, pe, target

EVIDENCE = ROOT / 'docs/analysis/evidence/0.112.0/talent-allocations'


def raw(address, size):
    offset = pe.rva_offset(address - pe.image_base)
    return data[offset:offset + size]


def qword(address):
    return struct.unpack('<Q', raw(address, 8))[0]


def string(address):
    pointer, count = struct.unpack('<QQ', raw(address, 16))
    return raw(pointer, count).decode() if pointer else None


def records(class_id):
    base = qword(0x14723f158 + 8 * (class_id - 1))
    values = []
    for tree in range(3):
        pointer, count = struct.unpack('<QQ', raw(base + tree * 64 + 48, 16))
        for index in range(count):
            address = pointer + index * 160
            values.append(dict(address=address, tree=tree, key=string(address + 48),
                               row=raw(address + 152, 1)[0], column=raw(address + 153, 1)[0],
                               max_rank=raw(address + 154, 1)[0],
                               prerequisite=string(address), alternative_prerequisite=string(address + 16),
                               exclusive=bool(raw(address + 155, 1)[0])))
    return values


def normalized(rows, values, budget):
    """Review model of save/talents.rs; native instructions are checked separately."""
    by_key = {row['key']: row for row in rows}
    result = {}
    candidates = [(by_key[key], min(rank, by_key[key]['max_rank']))
                  for key, rank in values if key in by_key]
    candidates.sort(key=lambda item: (item[0]['row'], item[0]['tree'], item[0]['column']))
    for row, requested in candidates:
        for _ in range(requested):
            if learnable(by_key, row, result, budget):
                result[row['key']] = result.get(row['key'], 0) + 1
    return list(result.items())


def learnable(by_key, row, allocation, budget):
    previous = sum(rank for key, rank in allocation.items()
                   if by_key[key]['tree'] == row['tree'] and by_key[key]['row'] < row['row'])
    requirements = row['prerequisite'] is None or any(
        allocation.get(key, 0) >= by_key[key]['max_rank']
        for key in [row['prerequisite'], row['alternative_prerequisite']] if key in by_key)
    excluded = any(by_key[key]['row'] == row['row'] and key != row['key']
                   and by_key[key]['tree'] == row['tree'] and rank
                   and (row['row'] == 6 or (row['exclusive'] and by_key[key]['exclusive']))
                   for key, rank in allocation.items())
    return (sum(allocation.values()) < budget and allocation.get(row['key'], 0) < row['max_rank']
            and previous >= 5 * row['row'] and requirements and not excluded)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare-rea', action='store_true', help='prepare bounded project-local Ghidra carriers/plans')
    args = parser.parse_args()
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    assert manifest['target_sha256'] == target['sha256']
    for row in manifest['functions'] + manifest['replayed_shared_owners']:
        assert hashlib.sha256(raw(int(row['address'], 16), row['byte_count'])).hexdigest() == row['sha256'], row['name']
        for kind in ['assembly', 'pseudocode']:
            if kind in row:
                assert hashlib.sha256((ROOT / row[kind]).read_bytes()).hexdigest() == row[kind + '_sha256']
    if args.prepare_rea:
        work = ROOT / 'runtime/analysis/history/progression/talent-allocations/205cde7ec765/reproduce'
        work.mkdir(parents=True, exist_ok=True)
        lo = min(int(row['address'], 16) for row in manifest['functions'])
        hi = max(int(row['end_exclusive'], 16) for row in manifest['functions'])
        carrier = bytearray(hi - lo)
        for row in manifest['functions']:
            address = int(row['address'], 16)
            carrier[address - lo:address - lo + row['byte_count']] = raw(address, row['byte_count'])
        (work / 'owners.bin').write_bytes(carrier)
        (work / 'seeds.tsv').write_text(''.join(
            f"{row['address']}\tfunction\n{row['address']}\tcode\n" for row in manifest['functions']))
        plan = dict(target=str((work / 'owners.bin').relative_to(ROOT)),
                    output=str((work / 'rea').relative_to(ROOT)), init_timeout=60,
                    timeout=240, open_timeout=240,
                    open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(lo)),
                    environment=dict(REA_GHIDRA_SEED_FILE=str((work / 'seeds.tsv').relative_to(ROOT)),
                                     REA_GHIDRA_DISABLED_ANALYZERS='Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables'),
                    operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=row['address']), label=row['name'])
                                for row in manifest['functions']])
        (work / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
        print('Prepared ten bounded Ghidra owners; no analysis or game process launched.')
        return
    rows = records(9)
    by_key = {row['key']: row for row in rows}
    for row in rows:
        assert all(key is None or any(other['key'] == key and other['tree'] == row['tree'] for other in rows)
                   for key in [row['prerequisite'], row['alternative_prerequisite']])
    vm = Machine()
    full = [(row['key'], row['max_rank']) for row in reversed(rows)]
    inputs = [(full, budget) for budget in [0, 1, 4, 5, 9, 10, 15, 20, 21, 25, 30, 31, 40, 50, 51, 60, 0xffffffff]]
    for tree in range(3):
        subset = [(row['key'], 255) for row in reversed(rows) if row['tree'] == tree]
        inputs.extend((subset, budget) for budget in [0, 5, 10, 15, 20, 25, 30, 31, 40, 51, 0xffffffff])
    inputs.extend([
        ([('demonic_familiar', 5), ('demonic_embrace', 5), ('fel_stamina', 3), ('unholy_power', 5), ('felfire_training', 3)], 51),
        ([('cataclysm', 5), ('imp_shadow_bolt', 5), ('aftermath', 5)], 51),
        ([('demonic_knowledge', 5), ('improved_imp', 5), ('demonic_familiar', 5)], 51),
    ])
    rng = random.Random(112)
    for _ in range(120):
        values = [(row['key'], rng.randrange(1, 9)) for row in rows if rng.random() < .8]
        rng.shuffle(values)
        inputs.append((values, rng.randrange(0, 65)))
    gates = 0
    for index, (values, budget) in enumerate(inputs):
        vm.heap = vm.H + 0x10000
        vector = vm.vector([(by_key[key]['address'], rank) for key, rank in values if key in by_key])
        out = vm.alloc(24)
        vm.call(0x14599fe20, out, vector, 9, budget)
        actual = vm.values(out)
        assert actual == normalized(rows, values, budget), (index, actual)
        # A bounded spread checks actual learn/refund owners independently of normalization.
        if index in [0, 3, 7, 11, 14, 17, 22, 25]:
            allocation = dict(actual)
            for row in rows:
                address = row['address']
                pointer, size = qword(address + 48), qword(address + 56)
                query = vm.vector([(by_key[key]['address'], rank) for key, rank in actual])
                learn = bool(vm.call(0x14599f980, query, 9, pointer, size, stack=[budget]) & 255)
                assert learn == learnable(by_key, row, allocation, budget), (index, row['key'], 'learn')
                refund = bool(vm.call(0x14599f500, query, 9, pointer, size) & 255)
                candidate = dict(allocation)
                rank = candidate.get(row['key'], 0)
                if rank <= 1:
                    candidate.pop(row['key'], None)
                else:
                    candidate[row['key']] = rank - 1
                expected = rank > 0 and sum(dict(normalized(rows, list(candidate.items()), 0xffffffff)).values()) == sum(candidate.values())
                assert refund == expected, (index, row['key'], 'refund')
                assert dict(vm.values(query)) == (candidate if expected else allocation), (index, row['key'], 'refund mutation')
                gates += 2
    historical = json.loads((ROOT / 'docs/analysis/evidence/0.109.0/talents-menu/native-cases.json').read_text())
    for case in historical['save_rows']:
        assert vm.serialize(vm.parse(case['input'])) == case['output']
    for case in historical['switch']:
        save = vm.parse(case['input'])
        changed = vm.call(0x1458d2770, save, 1, case['slot']) & 255
        assert (changed, vm.serialize(save)) == (case['changed'], case['output'])
    fixtures = json.loads((EVIDENCE / 'native-save-cases.json').read_text())
    assert fixtures['target_sha256'] == target['sha256']
    for case in fixtures['cases']:
        save = vm.parse(case['input'])
        assert vm.serialize(save) == case['output'], case['label']
        for slot in range(3):
            out = vm.alloc(24)
            vm.call(0x1458d2340, out, save, case['class_id'], slot)
            assert vm.values(out) == [tuple(row) for row in case['specs'][slot]], case['label']
        assert vm.call(0x1458d2770, save, case['class_id'], case['switched_slot']) & 255
        assert vm.serialize(save) == case['switched_output'], case['label']
    print(f'0.112.0 native contracts passed: {len(inputs)} normalization, {gates} learn/refund, '
          f'{len(historical["save_rows"])} shared Save, {len(historical["switch"])} shared switches, '
          f'{len(fixtures["cases"])} current Warlock/Warrior save/all-spec/switch cases. No build or game launched.')


if __name__ == '__main__':
    main()
