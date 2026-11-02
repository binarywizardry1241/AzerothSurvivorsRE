#!/usr/bin/env python3
"""Current byte/source integrity only; no Rust or native code is executed."""
import hashlib
import importlib.util
import json
import re
import struct
from pathlib import Path

from coverage_common import latest_target, target_bytes

ROOT = Path(__file__).resolve().parents[1]


def check():
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.115.0/coop-overlay/manifest.json').read_text())
    target = latest_target(verify=True)
    assert target['sha256'] == proof['target']['sha256']
    image = target_bytes(target)
    spec = importlib.util.spec_from_file_location('overlay_pe', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(image)
    count = 1

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    for row in proof['ranges']:
        data = raw(int(row['start'], 16), row['size'])
        assert hashlib.sha256(data).hexdigest() == row['sha256'], row['start']
        count += 1
        if 'extract' in row:
            text = (ROOT / row['extract']).read_bytes()
            assert hashlib.sha256(text).hexdigest() == row['extract_sha256']
            assert all(line == line.rstrip() for line in text.splitlines())
            count += 2
    for path in proof['canonical_references']:
        assert json.loads((ROOT / path).read_text())['target']['sha256'] == target['sha256']
        count += 1
    for base, key in [(0x14702c46c, 'rank_targets'), (0x14702c47c, 'range_targets')]:
        targets = proof['contracts'][key]
        assert [hex(base + offset) for offset in struct.unpack('<' + 'i' * len(targets),
            raw(base, len(targets) * 4))] == targets
        count += 1
    text = b'{n} yd radius{n} yd cone{n} yd range'
    assert raw(0x14702ab10, len(text)) == text
    assert struct.unpack('<f', raw(0x145ee3c50, 4))[0] == 0.25
    assert struct.unpack('<f', raw(0x145ee037c, 4))[0] == 0.5
    count += 3
    assert raw(0x146cccb98, 2).decode() == proof['contracts']['hud_amulet_separator'] == ', '
    count += 1
    for row in proof['contracts']['semantic_tags']:
        address = int(row['address'], 16)
        pointer, length = struct.unpack('<QQ', raw(address, 16))
        assert raw(pointer, length).decode() == row['key']
        assert struct.unpack('<I', raw(address + 104, 4))[0] == row['native_tag']
        assert hex(struct.unpack('<I', raw(address + 108, 4))[0]) == row['value_bits']
        count += 3

    source = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/coop_overlay.rs').read_text()
    for key in ('choices_keys', 'card_keys', 'replacement_keys', 'kinds'):
        for value in proof['contracts'][key]:
            assert '"' + value + '"' in source, value
            count += 1
    for text in ['state.choice_revision.wrapping_add(1)', 'game.with_party_hero', 'row.synchronized',
                 'locale.for_code', 'state.choice_generations', 'LifecyclePacket::EventBytes',
                 'NativeMessage::HudJson', 'NativeMessage::Resources', 'NativeMessage::Timers',
                 'game.coop_hud', 'game.apply_replica_hud', 'game.visual_spell_scales()',
                 'native_overlays::Card::from_payload', 'native_overlays::spawn',
                 'CHOICE_OPENING_SECONDS', 'CHOICE_EXIT_SECONDS', 'keyboard_choice_actions',
                 'opened.renewal_pending', 'old == Some(state.choice_revision)',
                 'client::talent_view::publication', 'totem_passives::passive_interval',
                 'spell_secondary(instance', 'DotPlan::new', 'LocalSpellDescriptions',
                 'LocalSpellScales', 'spell_text::native_tag(instance)']:
        # Formatting may insert whitespace around operators/call arguments.
        compact = re.sub(r'\s+', '', source)
        assert re.sub(r'\s+', '', text) in compact, text
        count += 1
    assert re.search(r'pub\(in crate::gameplay\) fn guest_controls', source)
    count += 1
    parent = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/coop.rs').read_text()
    controls = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
    commands = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/coop_commands.rs').read_text()
    for value in ['mod overlay', 'overlay::install', 'overlay::receive_choices']:
        assert value in parent, value
        count += 1
    assert 'coop::overlay::guest_controls' in controls
    assert 'choice_generations' in commands
    count += 2
    engine = (ROOT / 'crates/benilla-app/src/local_client/spell_descriptions.rs').read_text()
    for value in ['script.replace_spell_tooltip_overrides', 'row.rank.clone()', 'row.range.clone()',
                  'row.cast.clone()', 'row.cooldown.clone()', 'row.secondary',
                  '.after(crate::ui_tooltip::SpellTooltipFeed)']:
        assert value in engine, value
        count += 1
    assert 'spell_descriptions::install(app)' in (ROOT / 'crates/benilla-app/src/local_client.rs').read_text()
    assert '.in_set(SpellTooltipFeed)' in (ROOT / 'crates/benilla-app/src/ui_tooltip/mod.rs').read_text()
    locale = (ROOT / 'crates/azeroth-survivors-re/src/localization.rs').read_text()
    view = locale[locale.index('pub(crate) fn for_code'):locale.index('#[cfg(test)]')]
    assert 'path:None' in re.sub(r'\s+', '', view)
    assert 'std::fs' not in view and '.select(' not in view
    count += 4
    print(f'co-op overlay 0.115.0: {count} byte/table/source guards passed; no compilation/runtime validation')


if __name__ == '__main__':
    check()
