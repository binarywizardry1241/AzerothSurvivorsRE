#!/usr/bin/env python3
"""Verify selected 0.115.0 secondary-menu contracts without compilation/game IO.

Only admitted navigation instructions execute; account/drop getters, byte equality,
free and scheduler/UI delivery are explicit seams. Catalog checks are static PE
reads and source connection guards, independent of instruction execution.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
from coverage_common import latest_target, target_bytes
from script_sources import load_script
sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as x

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
ASSETS = ROOT / 'crates/azeroth-survivors-re/assets'
OUT = ROOT / 'docs/analysis/evidence/0.115.0/secondary-menus'
TABLES = {
    'perks': (120, [0x145f26fb8, 0x147034700]),
    'companions': (96, [0x145f25670, 0x146ccd3e0, 0x14703aac8, 0x14733a878]),
    'tabards': (64, [0x145f28dc0, 0x147036f40]),
    'cosmetics': (64, [0x145f24ef0, 0x147037518]),
}


def digest(value):
    return hashlib.sha256(json.dumps(value, separators=(',', ':'), ensure_ascii=False).encode()).hexdigest()


def verify():
    target = latest_target(verify=True)
    assert target['version'] == '0.115.0' and target['sha256'] == SHA
    data = target_bytes(target)
    native_path = OUT / 'native.json'
    native_record = json.loads(native_path.read_text())
    assert native_record['target_sha256'] == SHA
    pe = load_script('secondary_menu_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    ranges = {}

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        assert offset is not None and count >= 0 and offset + count <= len(data)
        return data[offset:offset + count]

    def span(role, address, count):
        row = dict(role=role, address=hex(address), byte_count=count,
                   sha256=hashlib.sha256(raw(address, count)).hexdigest())
        ranges[(address, count)] = row
        return row

    def pair(address):
        return struct.unpack('<QQ', raw(address, 16))

    def text(address):
        pointer, count = pair(address)
        assert count < 10000
        if not pointer:
            assert count == 0
            return None
        return raw(pointer, count).decode()

    for row in native_record['relocation_only_matches']:
        assert hashlib.sha256(raw(int(row['address'], 16), row['size'])).hexdigest() == row['sha256']
        historical = ROOT / row['historical_manifest']
        assert hashlib.sha256(historical.read_bytes()).hexdigest() == row['historical_manifest_sha256']

    source_assets = ['talents-menu-0.109.0.json', 'warlock-talents-0.112.0.json',
                     'warrior-talents-0.112.0.json', 'rewards-catalogs-0.112.0.json',
                     'armory-cosmetics-0.112.0.json', 'codex-0.105.0.json',
                     'jewelry-codex-0.112.0.json', 'menu.json']
    assets = {name: json.loads((ASSETS / name).read_text()) for name in source_assets}
    classes = assets['talents-menu-0.109.0.json']['classes']
    classes[7] = assets['warlock-talents-0.112.0.json']
    replacements = {row['key']: row for row in assets['warrior-talents-0.112.0.json']['talents']}
    for tree in classes[0]['trees']:
        tree['talents'] = [replacements.get(row['key'], row) for row in tree['talents']]
    talents, trees = [], []
    span('talent-index', 0x147029fc8, 9 * 200)
    for ci, cls in enumerate(classes):
        base = 0x147029fc8 + ci * 200
        assert raw(base + 192, 1)[0] == cls['id']
        for ti, tree in enumerate(cls['trees']):
            descriptor = base + ti * 64
            header = [text(descriptor + offset) for offset in (0, 16, 32)]
            assert header == [tree[key] for key in ('name', 'background', 'icon')]
            pointer, count = pair(descriptor + 48)
            assert count == len(tree['talents'])
            trees.append([cls['id'], header, count])
            span('talent-records', pointer, count * 160)
            for index, expected in enumerate(tree['talents']):
                address = pointer + index * 160
                actual = {key: text(address + offset) for key, offset in (
                    ('prerequisite', 0), ('alternative_prerequisite', 16),
                    ('key', 48), ('name', 64), ('icon', 80), ('description', 112),
                    ('supremacy_description', 128))}
                actual.update(zip(('row', 'column', 'max_rank', 'exclusive'), raw(address + 152, 4)))
                actual['exclusive'] = bool(actual['exclusive'])
                assert actual == {key: expected.get(key) for key in actual}, actual['key']
                talents.append(actual)
    assert len(talents) == 355 and len(trees) == 27

    rewards = assets['rewards-catalogs-0.112.0.json']
    expected_tables = {kind: rewards[kind] for kind in ('perks', 'companions', 'tabards')}
    expected_tables['cosmetics'] = assets['armory-cosmetics-0.112.0.json']['cosmetics']
    table_results = []
    for kind, (stride, bases) in TABLES.items():
        expected = expected_tables[kind]
        for base in bases:
            span(kind, base, len(expected) * stride)
            rows = []
            for index, wanted in enumerate(expected):
                at = base + index * stride
                if kind == 'perks':
                    costs, count = pair(at + 48)
                    descriptions, count2 = pair(at + 64)
                    assert count == count2 and 1 <= count <= 3
                    actual = {key: text(at + offset) for key, offset in (
                        ('key', 0), ('name', 16), ('icon', 32), ('achievement', 80), ('prerequisite', 96))}
                    span('perk-costs', costs, count * 4)
                    span('perk-descriptions', descriptions, count * 16)
                    actual.update(costs=list(struct.unpack('<' + 'I' * count, raw(costs, count * 4))),
                                  descriptions=[text(descriptions + i * 16) for i in range(count)],
                                  category=raw(at + 112, 1)[0])
                elif kind == 'companions':
                    actual = {key: text(at + offset) for key, offset in (
                        ('key', 0), ('name', 16), ('model', 32), ('icon', 48), ('achievement', 64))}
                    display, scale, creature = struct.unpack('<IfI', raw(at + 80, 12))
                    actual.update(display_id=display, scale=scale, creature_id=creature)
                else:
                    actual = {key: text(at + offset) for key, offset in (
                        ('name', 0), ('icon', 16), ('zone' if kind == 'tabards' else 'achievement', 32))}
                    item, display, value = struct.unpack('<III', raw(at + 48, 12))
                    actual.update(id=item, display_id=display)
                    if kind == 'tabards':
                        actual['cost'] = value
                    else:
                        actual.update(inventory_type=value, slot=raw(at + 60, 1)[0])
                assert actual == wanted, (kind, index, actual, wanted)
                rows.append(actual)
            table_results.append(dict(kind=kind, address=hex(base), records=len(rows), sha256=digest(rows)))

    # This verifies Codex membership/structural metadata; per-rarity effects and
    # localized constructed descriptions keep their separately recorded provenance.
    codex = assets['codex-0.105.0.json']['entries']
    delta = assets['jewelry-codex-0.112.0.json']
    codex = [row for row in codex if row['key'] != delta['entry']['key']]
    position = next(i for i, row in enumerate(codex) if row['key'] == delta['after']) + 1
    codex.insert(position, delta['entry'])
    pools = []
    span('class-pools', 0x146cc3058, 9 * 144)
    for index, cls in enumerate(assets['menu.json']['classes']):
        at = 0x146cc3058 + index * 144
        assert text(at + 16) == cls['key']
        pointer, count = pair(at + 48)
        span('class-pool-keys', pointer, count * 16)
        pool = [text(pointer + i * 16) for i in range(count)]
        assert pool == cls['spell_keys']
        cid = (1, 2, 3, 4, 5, 7, 8, 9, 11)[index]
        pools.extend((cid, key) for key in pool)
    assert [(row['class_id'], row['spell']) for row in codex if row['group'] == 'legendary'] == pools
    assert len(pools) == 103
    fixed = []
    for group, base, stride, count in [('jewelry', 0x147005690, 72, 23),
                                      ('amulets', 0x1470068f0, 80, 16)]:
        expected = [row for row in codex if row['group'] in (('rings', 'trinkets') if group == 'jewelry' else ('amulets',))]
        assert len(expected) == count
        span('codex-' + group, base, count * stride)
        for index, row in enumerate(expected):
            address = base + index * stride
            actual = dict(key=text(address), name=text(address + 16), icon=text(address + 32))
            assert actual == {key: row[key] for key in actual}, actual['key']
            if group == 'amulets':
                assert struct.unpack('<Q', raw(address + 64, 8))[0] == row['quality']
            fixed.append(actual)
    assert len(codex) == 142 and len(fixed) == 39

    nav_start, nav_end = 0x14023ec90, 0x14023ee7e
    nav_span = span('navigation', nav_start, nav_end - nav_start)
    assert nav_span['sha256'] == '25af2596b4cccea1fff39fe90b372bbd78c26c4d869553fcd7d5c7382ae3e11d'
    vm = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    vm.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        vm.mem_write(pe.image_base + s['rva'], data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    memory, stack, stop = 0x200000000, 0x300000000, 0x400000000
    vm.mem_map(memory, 0x10000)
    vm.mem_map(stack, 0x20000)
    vm.mem_map(stop, 4096)
    seams, visited = set(), set()
    drop_zone = None

    def reg(name, value=None):
        which = getattr(x, 'UC_X86_REG_' + name)
        if value is None:
            return vm.reg_read(which)
        vm.reg_write(which, value)

    def q(address):
        return struct.unpack('<Q', vm.mem_read(address, 8))[0]

    def put(address, *values):
        vm.mem_write(address, struct.pack('<' + 'Q' * len(values), *values))

    def hook(uc, pc, count, unused):
        if pc == stop:
            uc.emu_stop()
            return
        if nav_start <= pc and pc + count <= nav_end:
            visited.add(pc)
            return
        c, d2, n = reg('RCX'), reg('RDX'), reg('R8')
        if pc == 0x1458c1ce0:
            vm.mem_write(c, bytes(48))
        elif pc == 0x145d14601:
            reg('RAX', 0 if bytes(vm.mem_read(c, n)) == bytes(vm.mem_read(d2, n)) else 1)
        elif pc == 0x1458d2020:
            put(c, 0, memory + 0x6000, int(drop_zone is not None))
            put(memory + 0x6000, drop_zone or 0)
        elif pc == 0x1400021d0:
            pass
        else:
            raise RuntimeError(f'Unreviewed native navigation excursion {pc:#x}')
        seams.add(pc)
        sp = reg('RSP')
        reg('RIP', q(sp))
        reg('RSP', sp + 8)

    vm.hook_add(UC_HOOK_CODE, hook)
    navigation = []
    for oldtab in range(7):
        for newtab in (*range(7), 255):
            for drop_zone in (None, 4):
                for plan in ('absent', 'equal-empty', 'changed'):
                    vm.mem_write(memory, bytes(0x10000))
                    vm.mem_write(stack, bytes(0x20000))
                    selection = struct.pack('<QQQ', 2, memory + 0x700, 6)
                    vm.mem_write(memory, selection)
                    put(memory + 0x18, 0xffffffffffffffff if plan == 'absent' else 0)
                    # The baseline account getter supplies an empty plan. A
                    # different purchased-row count admits the dirty branch
                    # without invoking an imported-row parser or dereferencing
                    # fabricated contents. Equal plans keep both counts zero.
                    put(memory + 0x28, int(plan == 'changed'))
                    vm.mem_write(memory + 0x48, b'\x01')
                    vm.mem_write(memory + 0x4c, struct.pack('<I', 101000))
                    put(memory + 0x50, 9)
                    vm.mem_write(memory + 0x72, b'\x01')
                    vm.mem_write(memory + 0x76, bytes([oldtab, 254]))
                    sp = stack + 0x10008
                    put(sp, stop)
                    reg('RSP', sp)
                    reg('RCX', memory)
                    reg('RDX', newtab)
                    reg('R8', memory + 0x800)
                    vm.emu_start(nav_start, stop, count=10000)
                    assert reg('RIP') == stop
                    assert bytes(vm.mem_read(memory, 24)) == selection
                    opened, tab, zone = vm.mem_read(memory + 0x72, 1)[0], vm.mem_read(memory + 0x76, 1)[0], q(memory + 0x50)
                    pending = vm.mem_read(memory + 0x77, 1)[0]
                    blocked = oldtab == 6 and newtab != 6 and plan == 'changed'
                    assert opened == (1 if blocked else int(newtab != 255))
                    assert tab == (oldtab if blocked or newtab == 255 else newtab)
                    assert zone == (4 if not blocked and newtab == 2 and drop_zone is not None else 9)
                    assert pending == (newtab if blocked else 254)
                    navigation.append([oldtab, newtab, drop_zone, plan, opened, tab, zone, pending])
    assert len(navigation) == 336

    guards = {
        'crates/azeroth-survivors-re/src/armory_cosmetics.rs': ['assets/armory-cosmetics-0.112.0.json'],
        'crates/azeroth-survivors-re/src/save/talents.rs': ['talents-menu-0.109.0.json', 'warlock-talents-0.112.0.json', 'warrior-talents-0.112.0.json'],
        'crates/azeroth-survivors-re/src/talents.rs': ['crate::scrollbar::kept_list(body, "talent-details", 9.', 'self.supremacy_description'],
        'crates/azeroth-survivors-re/src/progression/rewards.rs': ['"rewards-companion-looks"', '"rewards-appearances"'],
        'crates/azeroth-survivors-re/src/armory.rs': ['"armory-equipment"', 'view.selected = gear.worn(class, slot);', 'view.selected = Some(id);'],
        'crates/azeroth-survivors-re/src/progression.rs': ['destination != Page::Rewards && edited', 'menu.dialog = Some(Dialog::RewardsChanges(destination));'],
        'crates/azeroth-survivors-re/src/codex.rs': ['"../assets/codex-0.105.0.json"', 'catalog.entries.insert(at, delta.entry);'],
    }
    for path, tokens in guards.items():
        source = (ROOT / path).read_text()
        for token in tokens:
            assert token in source, (path, token)
    return dict(generator=dict(path='scripts/check-secondary-menus.py', sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()),
                native_manifest_sha256=hashlib.sha256(native_path.read_bytes()).hexdigest(),
                target={key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
                application_executed=False, rebuilt_code_executed=False,
                native_navigation_instructions_executed=True,
                talent_records=len(talents), talent_trees=len(trees), talent_metadata_sha256=digest(talents),
                reward_records={key: len(value) for key, value in expected_tables.items()}, table_copies=table_results,
                codex_class_membership=len(pools), codex_fixed_metadata=len(fixed), codex_entries=len(codex),
                codex_metadata_sha256=digest([pools, fixed]), navigation_cases=len(navigation),
                navigation_sha256=digest(navigation), navigation_instruction_addresses=len(visited),
                navigation_seams=[hex(pc) for pc in sorted(seams)],
                assets={name: hashlib.sha256((ASSETS / name).read_bytes()).hexdigest() for name in source_assets},
                source_guards=guards, ranges=[ranges[key] for key in sorted(ranges)],
                limits=['Catalog comparisons verify the stated fields, not all effects/rank-formatting/achievement-grant logic.',
                        'Navigation executes complete original instructions with account/drop getters, free and byte equality seams; ECS/action membership and actual UI/filesystem are not run.',
                        'Historical layout bodies whose shapes differ are not promoted to current equivalence; a changed shape alone is not a source defect.',
                        'No compilation, Rust regression, application, input/rendering or original/rebuilt comparison.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true', help='write reviewed evidence to ignored runtime staging')
    args = parser.parse_args()
    value = verify()
    if args.stage:
        path = ROOT / 'runtime/native-evidence/0.115.0/secondary-menus/contracts.json'
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + '\n')
    else:
        assert json.loads((OUT / 'contracts.json').read_text()) == value
    print('Passed355 talent records/27 trees,62 Rewards/appearance records across10 native copies,142 Codex membership/39 fixed records and336 native navigation cases; no compiler/game')


if __name__ == '__main__':
    main()
