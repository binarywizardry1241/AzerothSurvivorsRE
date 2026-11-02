#!/usr/bin/env python3
"""Rebind historical migration inputs to current native Save/allocation results.

The original 0.105.0 fixture remains unchanged. No compiler or game is started.
"""
import argparse
import hashlib
import json

from native_talent_fixture import ROOT, Machine, data, pe, target

HISTORICAL = ROOT / 'docs/analysis/evidence/0.105.0/talent-migration/native-cases.json'
CURRENT = ROOT / 'docs/analysis/evidence/0.112.0/talent-allocations/migration-cases.json'


def recover():
    historical = json.loads(HISTORICAL.read_text())
    manifest = json.loads((CURRENT.parent / 'manifest.json').read_text())
    assert manifest['target_sha256'] == target['sha256']
    for owner in manifest['functions'] + manifest['replayed_shared_owners']:
        offset = pe.rva_offset(int(owner['address'], 16) - pe.image_base)
        assert hashlib.sha256(data[offset:offset + owner['byte_count']]).hexdigest() == owner['sha256']
    vm = Machine()
    cases = []
    for old in historical['cases']:
        class_id, points = old['class_id'], old['budget']
        xp = sum(80 + 15 * earned for earned in range(points))
        allocation = old['allocation']
        plain = (f'talent|{class_id}|{xp}|{allocation}\n'
                 f'spec|{class_id}|2|{allocation}|{allocation}|{allocation}\nstat|wins=7\n')
        save = vm.parse(plain)
        canonical = vm.serialize(save)
        normalized = None
        for slot in range(3):
            out = vm.alloc(24)
            vm.call(0x1458d2340, out, save, class_id, slot)
            actual = vm.values(out)
            if normalized is None:
                normalized = actual
            assert actual == normalized, (old['label'], slot)
        reopened = vm.parse(canonical)
        assert vm.serialize(reopened) == canonical, old['label']
        cases.append(dict(label=old['label'], class_id=class_id, budget=points,
                          allocation=allocation, normalized=normalized,
                          unspent=points - sum(rank for _, rank in normalized), canonical=canonical))
    return dict(target_version=target['version'], target_sha256=target['sha256'],
                historical_input_fixture=str(HISTORICAL.relative_to(ROOT)),
                historical_input_sha256=hashlib.sha256(HISTORICAL.read_bytes()).hexdigest(),
                native_owners_manifest=str((CURRENT.parent / 'manifest.json').relative_to(ROOT)),
                cases=cases,
                limits=['Historical input strings are reused; all expected allocations, ordering, unspent points and canonical rows are current native results.',
                        'The whole current Save parser, normalizer, all three spec readers and serializer execute with declared host memory-management/C-byte seams.',
                        'No reconstructed Rust code, sealed-import cryptography, game, save-file I/O or original/rebuilt comparison ran.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    value = recover()
    serialized = json.dumps(value, indent=2, ensure_ascii=True) + '\n'
    if args.write:
        CURRENT.write_text(serialized)
    elif CURRENT.read_text() != serialized:
        raise ValueError('Current migration fixture is missing or stale')
    print(f"{len(value['cases'])} current native migration inputs/all-spec/reopen cases pass; historical fixture preserved. No build or game run.")


if __name__ == '__main__':
    main()
