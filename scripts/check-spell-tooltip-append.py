#!/usr/bin/env python3
"""Check current tooltip append evidence, source consumers and bounded vectors.

This reads bytes and source; the separate recovery script replays native
instructions. Neither check compiles code or launches the game.
"""
import hashlib
import json
import struct
import re

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script


def check_state_consumer_closure(directory, target, data, pe, raw):
    """Bind the finite typed-state classification without executing the target."""
    receipt = json.loads((directory / 'state-consumer-closure.json').read_text())
    assert receipt['target'] == {'version': target['version'], 'sha256': target['sha256']}
    assert not receipt['compiled'] and not receipt['target_executed']
    count = 3
    layout = receipt['local_ui_state']
    assert layout['size'] == 0xf0 and layout['alignment'] == 8
    assert layout['vec'] == dict(capacity_offset=0x48, pointer_offset=0x50,
                                 length_offset=0x58, row_stride=0xb0)
    identity = bytes.fromhex(layout['type_id_hex'])
    assert len(identity) == 16 and data.count(identity) == 3
    literals = {int(address, 16) for address in layout['type_id_addresses']}
    assert len(literals) == 3
    for address in literals:
        assert raw(hex(address), 16) == identity
        count += 1
    functions = receipt['functions']
    pdata = {(pe.image_base + start, pe.image_base + end)
             for start, end, _ in pe.functions()}
    for address, row in functions.items():
        start, end = int(address, 16), int(row['end_exclusive'], 16)
        assert (start, end) in pdata
        assert hashlib.sha256(raw(address, end - start)).hexdigest() == row['sha256']
        count += 2
    guards = receipt['instruction_guards']
    for address, row in guards.items():
        value = bytes.fromhex(row['hex'])
        assert raw(address, len(value)) == value
        assert any(int(start, 16) <= int(address, 16) < int(owner['end_exclusive'], 16)
                   for start, owner in functions.items())
        count += 2
    # Reproduce the exact encoded RIP-reference census. These two instruction
    # forms are the bounded enumeration, not a whole-image semantic claim.
    references = set()
    for section in pe.sections:
        if not int(section['characteristics'], 16) & 0x20000000:
            continue
        block = data[section['raw_offset']:section['raw_offset'] + section['raw_size']]
        for pattern, size in [
            (rb'[\x48\x4c]\x8d[\x05\x0d\x15\x1d\x25\x2d\x35\x3d]', 7),
            (rb'[\x66\xf3]\x0f\x6f[\x05\x0d\x15\x1d\x25\x2d\x35\x3d]', 8),
        ]:
            for match in re.finditer(pattern, block):
                address = pe.image_base + section['rva'] + match.start()
                destination = address + size + struct.unpack_from('<i', block, match.start() + size - 4)[0]
                if destination in literals:
                    references.add((hex(address), hex(destination)))
    expected = receipt['type_references']
    assert references == {(row['instruction'], row['literal']) for row in expected}
    assert len(expected) == receipt['enumeration']['type_reference_count'] == 39
    assert len({row['owner'] for row in expected}) == receipt['enumeration']['type_reference_owner_count'] == 35
    for row in expected:
        assert row['instruction'] in guards and row['owner'] in functions
        assert int(row['owner'], 16) <= int(row['instruction'], 16) < int(functions[row['owner']]['end_exclusive'], 16)
        count += 2
    routes = receipt['system_routes']
    assert len(routes) == len({row['init'] for row in routes}) == receipt['enumeration']['typed_system_routes'] == 28
    accessors = receipt['direct_type_accessors']
    assert len(accessors) == receipt['enumeration']['direct_type_accessors'] == 6
    owners = {row['init'] for row in routes} | {row['function'] for row in accessors}
    owners.add(receipt['enumeration']['registration_helper'])
    assert owners == {row['owner'] for row in expected}
    for row in routes:
        init_slot, run_slot = int(row['vtable_init_slot'], 16), int(row['vtable_run_slot'], 16)
        assert init_slot - run_slot == 56
        assert struct.unpack('<Q', raw(hex(init_slot), 8))[0] == int(row['init'], 16)
        assert struct.unpack('<Q', raw(hex(run_slot), 8))[0] == int(row['run'], 16)
        assert data.count(struct.pack('<Q', int(row['init'], 16))) == 1
        assert all(row[key] in functions for key in ['init', 'run', 'consumer'])
        assert all(address in guards for address in row['guards'])
        if row['consumer_call'] is None:
            assert row['consumer'] == row['run']
        else:
            value = raw(row['consumer_call'], 5)
            assert value[0] in (0xe8, 0xe9)
            assert int(row['consumer_call'], 16) + 5 + struct.unpack_from('<i', value, 1)[0] == int(row['consumer'], 16)
            assert row['consumer_call'] in guards
        if row['raw_vec_role'] == 'none':
            assert not ({'0x48', '0x50', '0x58'} & set(row['state_fields']))
        count += 8
    assert {(row['init'], row['raw_vec_role']) for row in routes if row['raw_vec_role'] != 'none'} == {
        ('0x140061ec0', 'forward to custom compositor'),
        ('0x14014b6d0', 'queue replacement'),
    }
    for helper in receipt['helpers']:
        assert helper['function'] in functions
        assert helper['provider'] == 'ghidra' and helper['evidence_id'].startswith('ev_')
        assert len(helper['analysis_profile_sha256']) == 64
        count += 3
    assert len(receipt['forwarded_state_leaves']) == 5
    assert 'untyped/erased access path' in receipt['limits']
    return count + 15


def main():
    target = latest_target(verify=True)
    directory = ROOT / 'docs/analysis/evidence/coop-spell-text'
    contract = json.loads((directory / 'append-contract.json').read_text())
    assert contract['target'] == {'version': target['version'], 'sha256': target['sha256']}
    assert not contract['compiled'] and not contract['target_executed']
    data = target_bytes(target)
    pe = load_script('append_integrity_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    count = 3

    def raw(address, size):
        at = pe.rva_offset(int(address, 16) - pe.image_base)
        return data[at:at + size]

    owner = json.loads((ROOT / contract['canonical_constructor']['manifest']).read_text())
    row = next(row for row in owner['ranges'] if row['role'] == contract['canonical_constructor']['range_role'])
    assert hashlib.sha256(raw(row['start'], int(row['end_exclusive'], 16) - int(row['start'], 16))).hexdigest() == row['sha256']
    assert hashlib.sha256((ROOT / row['extract']).read_bytes()).hexdigest() == row['extract_sha256']
    count += 2
    for row in contract['helpers']:
        assert hashlib.sha256(raw(row['start'], int(row['end_exclusive'], 16) - int(row['start'], 16))).hexdigest() == row['sha256']
        assert hashlib.sha256((ROOT / row['extract']).read_bytes()).hexdigest() == row['extract_sha256']
        assert row['provider'] == 'ghidra' and row['evidence_id'].startswith('ev_')
        assert len(row['analysis_profile_sha256']) == 64
        count += 4
    consumers = json.loads((directory / 'consumer-contract.json').read_text())
    assert consumers['target'] == contract['target']
    assert not consumers['compiled'] and not consumers['target_executed']
    count += 2
    closure = consumers['native_cache_lineage']['typed_state_consumer_closure']
    assert closure['receipt'] == 'docs/analysis/evidence/0.115.0/coop-spell-text/state-consumer-closure.json'
    assert not closure['native_raw_resource_to_framexml_cache_write_proven']
    count += check_state_consumer_closure(directory, target, data, pe, raw) + 2
    for row in consumers['helpers']:
        assert hashlib.sha256(raw(row['start'], int(row['end_exclusive'], 16) - int(row['start'], 16))).hexdigest() == row['sha256']
        assert hashlib.sha256((ROOT / row['extract']).read_bytes()).hexdigest() == row['extract_sha256']
        assert row['provider'] == 'ghidra' and row['evidence_id'].startswith('ev_')
        assert len(row['analysis_profile_sha256']) == 64
        count += 4
    for row in consumers['binding_literals']:
        value = bytes.fromhex(row['hex'])
        assert raw(row['address'], len(value)) == value
        assert hashlib.sha256(value).hexdigest() == row['sha256']
        assert value.decode() == row['text']
        count += 3
    for row in consumers['binding_vtables']:
        value = bytes.fromhex(row['hex'])
        assert raw(row['address'], len(value)) == value
        assert hashlib.sha256(value).hexdigest() == row['sha256']
        assert all(struct.unpack_from('<Q', value, offset)[0] == int(row['callback'], 16)
                   for offset in row['callback_offsets'])
        count += 3
    for row in consumers['native_cache_lineage']['audited_ranges']:
        assert hashlib.sha256(raw(row['start'], int(row['end_exclusive'], 16) - int(row['start'], 16))).hexdigest() == row['sha256']
        count += 1
    for row in consumers['native_cache_lineage']['direct_edges']:
        value = raw(row['address'], 5)
        assert value[0] in (0xe8, 0xe9)
        assert int(row['address'], 16) + 5 + struct.unpack_from('<i', value, 1)[0] == int(row['target'], 16)
        count += 2
    assert consumers['resource_layout'] == dict(stride=176, id_offset=168,
        name_offset=0, text_18_offset=24, text_30_offset=48,
        rank_offset=72, range_offset=96, cast_offset=120, cooldown_offset=144)
    selector = consumers['json_spell_hover']['selector']
    assert raw(selector['address'], selector['length']).decode() == selector['text'] == 'spell'
    selection = (directory / '1402fa610.asm').read_text()
    renderer = (directory / '14002c3f0.asm').read_text()
    for instruction in [
        '0x1402fb15b: imul rax, qword ptr [rax + 0x58], 0xb0',
        '0x1402fb180: cmp dword ptr [rbx + rcx + 0xa8], edi',
        '0x1402fb18a: jne 0x1402fb170',
        '0x1402fbbdc: call 0x14002c3f0',
    ]:
        assert instruction in selection, instruction
        count += 1
    # The rich-text body starts from the primary String at row+0x18.
    # The renderer never reads a secondary String from row+0x30.
    assert '0x14002c5e9: mov r12, qword ptr [rbx + 0x28]' in renderer
    assert '0x14002c5f6: mov rbx, qword ptr [rbx + 0x20]' in renderer
    assert '[rbx + 0x30]' not in renderer and '[rbx + 0x38]' not in renderer and '[rbx + 0x40]' not in renderer
    count += 5
    aura_renderer = (directory / '1451c6910.asm').read_text()
    for instruction in [
        '0x1451c6d15: bt rcx, 0x20',
        '0x1451c6d20: cmp qword ptr [rdi + 0x40], 0',
        '0x1451c6d25: je 0x1451c7065',
        '0x1451c6d2b: lea rdx, [rdi + 0x30]',
        '0x1451c6e31: lea rdx, [rdi + 0x18]',
        '0x1451c7065: cmp qword ptr [rdi + 0x28], 0',
        '0x1451c7070: lea rdx, [rdi + 0x18]',
    ]:
        assert instruction in aura_renderer, instruction
        count += 1
    for filename, instruction in [
        ('1453c5eb0.asm', '0x1453c6414: movabs rax, 0x100000000'),
        ('1453c5eb0.asm', '0x1453c6444: call 0x1451c9110'),
        ('1453c6e50.asm', '0x1453c79a6: movabs rax, 0x100000000'),
        ('1453c6e50.asm', '0x1453c79d9: call 0x1451c9110'),
        ('1451c9110.asm', '0x1451c924b: call 0x1451c5130'),
        ('1451c5130.asm', '0x1451c51e5: call 0x1451c6910'),
    ]:
        assert instruction in (directory / filename).read_text(), instruction
        count += 1
    for row in contract['literals']:
        value = bytes.fromhex(row['hex'])
        assert raw(row['address'], len(value)) == value
        assert hashlib.sha256(value).hexdigest() == row['sha256']
        assert value.decode() == row['text']
        count += 3
    for row in contract.get('format_specs', []):
        value = bytes.fromhex(row['hex'])
        assert raw(row['address'], len(value)) == value
        assert hashlib.sha256(value).hexdigest() == row['sha256']
        assert value[0] == 0xc5 and struct.unpack_from('<H', value, 5)[0] == 1
        assert value[7:] == b'\x01%\x00'
        count += 4
    for row in contract['scalars']:
        value = bytes.fromhex(row['hex'])
        assert raw(row['address'], 4) == value
        assert struct.unpack('<f', value)[0] == row['value']
        count += 2
    for row in contract['tables']:
        value = raw(row['address'], len(row['targets']) * 4)
        assert hashlib.sha256(value).hexdigest() == row['sha256']
        base = int(row['address'], 16)
        assert [hex(base + n) for n in struct.unpack('<' + 'i' * len(row['targets']), value)] == row['targets']
        count += 2
    fixture = json.loads((ROOT / contract['replay']['fixture']).read_text())
    assert fixture['target_sha256'] == target['sha256']
    assert fixture['native_instruction_replay'] and not fixture['target_executed']
    assert fixture['format_boundary_cases'] == [dict(format_address='0x147339cce', value=3.125, expected='3.1%')]
    assert fixture['cases'] == len(fixture['results']) * len(fixture['inputs']) * len(fixture['modes']) == contract['replay']['cases']
    assert len(fixture['results']) == 113 and len({row['key'] for row in fixture['results']}) == 113
    assert len(fixture['expected']) == len(set(fixture['expected']))
    for row in fixture['results']:
        assert len(row['primary_indices']) == len(fixture['inputs']) * len(fixture['modes'])
        assert all(0 <= index < len(fixture['expected']) for index in row['primary_indices'])
        count += 2
    # Reused semantic descriptors must match every current native field read
    # by the appendix producer. The source retains its historical status enum;
    # only the display adapter translates the selected target's insertion.
    catalog = (ROOT / 'crates/azeroth-survivors-re/src/player_abilities/catalog.rs').read_text()
    definitions = catalog.split('pub static ABILITIES:', 1)[1].split('pub static CLASSES:', 1)[0]
    definitions = re.findall(r'AbilityDefinition\s*\{(.*?school:\s*\d+,\s*kind:\s*\d+,?\s*)\}', definitions, re.S)
    assert len(definitions) == 113
    for index, definition in enumerate(definitions):
        key = re.search(r'key:\s*"([^"]+)"', definition)[1]
        native = raw(hex(0x146cc4580 + index * 120), 120)
        address, length = struct.unpack_from('<QQ', native)
        assert raw(hex(address), length).decode() == key
        for field, offset in [('base_power', 68), ('base_cooldown', 72), ('radius', 80), ('duration', 88)]:
            literal = re.search(field + r':\s*(f32::from_bits\((0x[0-9a-f]+)\)|[0-9.]+)', definition)
            bits = int(literal[2], 16) if literal[2] else struct.unpack('<I', struct.pack('<f', float(literal[1])))[0]
            assert struct.unpack_from('<I', native, offset)[0] == bits, (key, field)
        targets = int(re.search(r'targets:\s*(\d+)', definition)[1])
        kind = int(re.search(r'kind:\s*(\d+)', definition)[1])
        tag = int(re.search(r'effect:\s*StatusEffect\s*\{\s*tag:\s*(\d+)', definition)[1])
        tag = 10 if key == 'demonic_empowerment' else tag + 1 if tag >= 10 else tag
        assert struct.unpack_from('<I', native, 84)[0] == targets, (key, 'targets')
        assert native[117] == kind, (key, 'kind')
        assert struct.unpack_from('<I', native, 104)[0] == tag, (key, 'current status')
        count += 8
    source = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/coop_spell_text.rs').read_text()
    compact = re.sub(r'\s+', '', source)
    for token in ['0x3f80a3d7', '0x3f7eb852', '0x3ba3d70a',
                  'game.spell_text_stats()', 'game.spell_talent_lines(instance.definition, locale)',
                  'instance.power_multiplier', 'instance.cooldown_multiplier', 'instance.target_bonus',
                  'instance.area_multiplier', 'instance.duration_multiplier', 'power.sqrt() - 1.',
                  'stats.area - 1.', 'stats.targets', 'stats.buff_bonus', 'stats.crit', 'stats.crit_damage',
                  'stats.extra_cast.floor()', 'stats.extra_cast.trunc()', 'mode != Mode::Racial',
                  'definition.kind != 11', 'definition.kind != 6', 'rows.join(", ")',
                  'groups.join("\\n")', 'text.push_str("\\n\\n")',
                  'all_native_append_vectors', 'primary_indices', 'assert_eq!(actual']:
        assert re.sub(r'\s+', '', token) in compact, token
    for color in ['|cffffffff', '|cff1eff00', '|cff71d5ff', '|cff9d9d9d']:
        assert color in source
    templates = set(re.findall(r'"([^"\n]*\{(?:p|sign|crit|times|more|n|total)\}[^"\n]*)"', source))
    templates |= {'Upgrades: ', 'Your bonuses: ', 'Talents: ', 'once', 'twice', '+1 target',
                  'Not learned yet: a level-up may offer it.', 'Racial: casts on its own.',
                  'A talent casts it on its own.'}
    # Every producer literal uses the native locale key; formatting syntax/test
    # diagnostics are not translation templates.
    templates = {text for text in templates if text not in {'{key}', '{:.0}'}}
    for path in (ROOT / 'crates/azeroth-survivors-re/assets/locales').glob('*.json'):
        catalog = json.loads(path.read_text())
        for text in templates:
            assert text in catalog, (path.name, text)
    overlay = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/coop_overlay.rs').read_text()
    for text in ['spell_text::primary(', 'spell_text::Mode::Talent', 'spell_resource(game,',
                 'spell_resources(game, &locale)', '.map(local_description)',
                 'NativeMessage::Resources(resources.clone())', 'game.with_party_hero(slot,',
                 'locale.for_code(&code)', 'spell_auxiliary::append(']:
        assert text in overlay, text
    guest_schedule = re.search(r'\.add_systems\(\s*Update,\s*guest_metadata(.*?)\)\s*\)\s*\.add_systems', overlay, re.S)
    assert guest_schedule is not None
    assert '.before(LocalClientSet::Feed' in guest_schedule[1]
    assert '.after(RunSet::Tick' not in guest_schedule[1]
    count += 3
    client = (ROOT / 'crates/benilla-app/src/local_client/spell_descriptions.rs').read_text()
    assert '.after(crate::ui_unit::UnitFeed)' in client
    assert '.after(super::LocalClientSet::Feed)' in client
    assert 'script.replace_spell_tooltip_overrides(rows.0.iter().map(|row|' in client
    # The app preserves vector order and supplies separate spell/aura bodies.
    # The current FrameXML projection keeps the final row per spell ID.
    spell_view = client.split('SpellTooltipView {', 1)[1].split('..Default::default()', 1)[0]
    assert 'description: plain(row.description.clone())' in spell_view
    assert 'secondary' not in spell_view
    assert '.rev().find(' not in client
    count += 5
    assert re.search(r'let body = if row\.secondary\.is_empty\(\)\s*\{\s*&row\.description\s*\}\s*else\s*\{\s*&row\.secondary\s*\}', client)
    assert 'plain(body.clone())' in client
    assert 'take_aura_tooltip_asks()' not in client
    ui_spell = (ROOT / 'crates/benilla-ui/src/script/tooltip_spell.rs').read_text()
    replacement = ui_spell.split('pub fn replace_spell_tooltip_overrides(', 1)[1].split('pub fn set_spell_tooltip(', 1)[0]
    replacement_compact = re.sub(r'\s+', '', replacement)
    for token in ['model.embedding_spell_tooltips.clear()', 'model.embedding_aura_text.clear()',
                  'model.embedding_spell_tooltips.insert(id, spell)',
                  'model.embedding_aura_text.insert(id, (spell.name.clone(), aura_description))']:
        assert re.sub(r'\s+', '', token) in replacement_compact, token
        count += 1
    assert 'model.spell_tooltips.clear()' not in replacement and 'model.aura_tooltips.clear()' not in replacement
    assert '.drain(' not in replacement
    spell_lookup = ui_spell.split('fn resolve_spell_view(', 1)[1].split('fn built_at_the_call(', 1)[0]
    assert spell_lookup.index('let Some(ordinary)') < spell_lookup.index('.embedding_spell_tooltips')
    assert 'return None;' in spell_lookup
    ui_aura = (ROOT / 'crates/benilla-ui/src/script/tooltip_aura.rs').read_text()
    aura_lookup = ui_aura.split('fn aura_view_of(', 1)[1].split('/// The aura builder', 1)[0]
    for token in ['model.aura_tooltips.get(&key).cloned()', 'model.embedding_aura_text.get(&key.spell_id)',
                  'let Some(mut view)', 'return None;', 'view.name = name.clone()',
                  'view.description = description.clone()', 'view.dispel_type = None']:
        assert token in aura_lookup, token
        count += 1
    assert 'model.aura_tooltip_asks.insert(key)' in aura_lookup
    tests = (ROOT / 'crates/benilla-ui/src/script/tests/tooltip_spell.rs').read_text()
    assert 'embedding_views_wait_for_the_ordinary_spell_and_aura' in tests
    assert 'embedding_tooltips_use_the_latest_row_and_separate_bodies' in tests
    count += 10
    print(f'PASS: {count + 6} current tooltip append byte/source/vector integrity guards; locale and host/guest wiring checked; Rust regressions remain uncompiled')


if __name__ == '__main__':
    main()
