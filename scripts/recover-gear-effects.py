#!/usr/bin/env python3
"""Revalidate the ordinary Armory effect catalog against exact 0.100.1 data/consumers.

Optional SHA-bound analysis; source builds do not read the selected executable.
Keeps name/appearance/drop provenance distinct from the revalidated numeric effects.
"""
from script_sources import load_script
from pathlib import Path
import argparse
import hashlib
import json
import math
import struct

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
SCHOLOMANCE_SHA = '27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9'


def scholomance(write):
    from coverage_common import latest_target, target_bytes

    target = latest_target(verify=True)
    assert (target['version'], target['sha256']) == ('0.140.0', SCHOLOMANCE_SHA)
    data = target_bytes(target)
    pe = load_script('inventory', ROOT / 'scripts/inventory-executable.py').PE(data)

    def read(va, size):
        offset = pe.rva_offset(va - pe.image_base)
        result = data[offset:offset + size]
        assert len(result) == size
        return result

    def unpack(va, fmt):
        return struct.unpack(fmt, read(va, struct.calcsize(fmt)))

    def string(va):
        pointer, size = unpack(va, '<QQ')
        assert 0 < size < 128
        return read(pointer, size).decode()

    def effects(va):
        pointer, count = unpack(va, '<QQ')
        assert 1 <= count <= 8
        return [unpack(pointer + index * 8, '<If') for index in range(count)]

    classes = []
    for cid in (1, 2, 3, 4, 5, 7, 8, 9, 11):
        address, = unpack(0x1473f68b8 + (cid - 1) * 8, '<Q')
        stored_class, material = unpack(address + 0x224, '<BB')
        assert stored_class == cid
        weapon, count = unpack(address + 0x210, '<QQ')
        assert count == (2 if cid in (4, 7) else 1)
        items = []
        for slot in range(8 + count):
            row = address + slot * 0x40 if slot < 8 else weapon + (slot - 8) * 0x50
            native_id, display = unpack(row + 0x30, '<II')
            if slot < 8:
                inventory, = unpack(row + 0x38, '<I')
                slot_id, = unpack(0x1473f027c + slot, '<B')
                kind, subclass, sheath = 4, material, 0
            else:
                kind, subclass, inventory, sheath, slot_id = unpack(row + 0x38, '<IIIIB')
            base, five_star = effects(row + 0x10), effects(row + 0x20)
            assert [tag for tag, _ in base] == [tag for tag, _ in five_star]
            items.append(dict(native_id=native_id, name=string(row), display_id=display,
                item_class=kind, item_subclass=subclass, inventory_type=inventory, sheath=sheath,
                slot_id=slot_id, effects=base, five_star_effects=[value for _, value in five_star]))
        classes.append(dict(id=cid, name=string(address + 0x200), items=items))

    assert sum(len(row['items']) for row in classes) == 83
    assert len({piece['native_id'] for row in classes for piece in row['items']}) == 83
    asset = ROOT / 'crates/azeroth-survivors-re/assets/scholomance-gear-0.140.0.json'
    # One record per item keeps the complete pointer-free catalog reviewable.
    rows = ['{', f'  "target_sha256": "{SCHOLOMANCE_SHA}",', '  "classes": [']
    for index, row in enumerate(classes):
        rows.append(f'    {{"id": {row["id"]}, "name": {json.dumps(row["name"])}, "items": [')
        rows.extend('      ' + json.dumps(piece) + (',' if slot + 1 < len(row['items']) else '')
                    for slot, piece in enumerate(row['items']))
        rows.append('    ]}' + (',' if index + 1 < len(classes) else ''))
    rows.extend(['  ]', '}'])
    value = '\n'.join(rows) + '\n'
    if write:
        asset.write_text(value)
    else:
        assert asset.read_text() == value
    print('Verified 72 Tier 0.5 armor pieces and 11 weapons, including both native stat rows')


def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    def read(va, size):
        offset = pe.rva_offset(va - pe.image_base)
        value = data[offset:offset + size]
        assert len(value) == size
        return value
    def q(va): return struct.unpack('<Q', read(va, 8))[0]
    def effects(va, count): return [struct.unpack('<If', read(va + 8*i, 8)) for i in range(count)]
    def f32(value): return struct.unpack('<f', struct.pack('<f', value))[0]
    def scaled(values, factor):
        return [(tag, float(math.floor(f32(value*factor) + 0.5)) if tag == 2 else f32(value*factor))
                for tag, value in values]
    base = struct.unpack('<5f', read(0x146d36b40, 20))
    extra = struct.unpack('<5f', read(0x146d36bb0, 20))
    factor = struct.unpack('<f', read(0x145947ed4, 4))[0]
    armor = [effects(at, count) for at, count in [
        (0x1469d6504,2),(0x1469d6514,2),(0x1469d6524,2),(0x1469d6534,2),
        (0x1469d6544,2),(0x1469d6554,1),(0x1469d655c,1),(0x1469d6564,3)]]
    flavors = [effects(0x1469d657c + 16*i, 2) for i in range(8)]
    path = ROOT / 'crates/azeroth-survivors-re/assets/armory.json'
    catalog = json.loads(path.read_text())
    changed = []
    rows = []
    for index, class_def in enumerate(catalog['classes']):
        record = 0x1469d59a0 + index * 304
        cid = read(record + 297, 1)[0]
        assert cid == class_def['id']
        weapon_table, weapon_count = q(record + 120), q(record + 128)
        for piece in class_def['items']:
            slot, rarity = piece['slot'], piece['rarity']
            assert 0 <= rarity < 5 and 0 <= slot < weapon_count + 8
            if slot < 8:
                values = scaled(armor[slot], f32(factor * base[rarity]))
            else:
                weapon = weapon_table + (slot - 8) * 144
                values = scaled(effects(q(weapon + 88), q(weapon + 96)), f32(factor * base[rarity]))
            if rarity:
                values += scaled(flavors[(cid * 3 + slot) % 8], f32(factor * extra[rarity]))
                if rarity == 4:
                    values.append((11, 1.0) if slot >= 8 else (12, struct.unpack('<f', bytes.fromhex('31082c3d'))[0]))
            merged = {}
            for tag, value in values: merged[tag] = f32(merged.get(tag, 0.) + value)
            recovered = [dict(tag=tag, value=value) for tag, value in merged.items()]
            if recovered != piece['effects']:
                changed.append(dict(id=piece['id'], previous=piece['effects'], recovered=recovered))
                piece['effects'] = recovered
            rows.append(dict(id=piece['id'], effects=recovered))
    catalog['numeric_effects_target'] = dict(version='0.100.1', sha256=SHA,
        evidence='docs/analysis/evidence/0.100.1/target-menu/gear-effects.json')
    path.write_text(json.dumps(catalog, indent=2, ensure_ascii=False) + '\n')
    report = dict(version='0.100.1', target=str(TARGET.relative_to(ROOT)), sha256=SHA,
        class_table_va='0x1469d59a0', class_stride=304,
        ordinary_gear_owner='0x14546f110', scaling_owners=['0x14554c7c0','0x14554ca00','0x14554cc40'],
        scale_factor=factor, base_scale=base, extra_scale=extra, armor_effects=armor, extra_effects=flavors,
        ordinary_piece_count=len(rows), changed_piece_count=len(changed), changed=changed, pieces=rows,
        limitations=['Only five ordinary rarities are covered here; PvP qualities 5/6 have a separate current owner.',
            'Item names, appearance, localized prose, drops and starter outfits retain their existing historical provenance.',
            'Current instruction consumers and exact tables establish numeric source data; no original runtime comparison is implied.'])
    output = ROOT / 'docs/analysis/evidence/0.100.1/target-menu/gear-effects.json'
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(report, indent=2) + '\n')
    print(f'Revalidated {len(rows)} ordinary pieces; {len(changed)} numeric effect changes')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--scholomance', action='store_true', help='verify the 0.140.0 Tier 0.5 catalog')
    parser.add_argument('--write', action='store_true', help='regenerate the selected Scholomance asset')
    args = parser.parse_args()
    if args.scholomance:
        scholomance(args.write)
    elif args.write:
        parser.error('--write is only used with --scholomance')
    else:
        main()
