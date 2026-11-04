#!/usr/bin/env python3
"""Check overlay source and bounded native payloads without launching the game."""
import argparse
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


def check_diagnostic_consumers():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from capstone.x86_const import X86_OP_MEM, X86_REG_RIP
    from script_sources import load_script

    proof = json.loads((ROOT / 'docs/analysis/evidence/0.141.0/q41-diagnostic-consumers.json').read_text())
    target = latest_target(verify=True)
    assert target['sha256'] == proof['target_sha256']
    pe = load_script('overlay_pe', ROOT / 'scripts/inventory-current-target.py').pe_parser(target_bytes(target))

    def raw(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return pe.data[offset:offset + length]

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    instructions = {}
    for start, end, digest in proof['ranges']:
        start, end = int(start, 16), int(end, 16)
        data = raw(start, end - start)
        assert hashlib.sha256(data).hexdigest() == digest, hex(start)
        decoded = list(decoder.disasm(data, start))
        assert sum(i.size for i in decoded) == len(data), hex(start)
        instructions.update((hex(i.address), i) for i in decoded)

    for address, text in proof['instruction_anchors'].items():
        instruction = instructions[address]
        assert f'{instruction.mnemonic} {instruction.op_str}' == text, address

    for site, (address, payload) in proof['rip_data_anchors'].items():
        instruction = instructions[site]
        operands = [op for op in instruction.operands if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP]
        assert len(operands) == 1, site
        resolved = instruction.address + instruction.size + operands[0].mem.disp
        expected = bytes.fromhex(payload[4:]) if payload.startswith('hex:') else payload.encode('ascii')
        assert resolved == int(address, 16) and raw(resolved, len(expected)) == expected, site

    address, *suffixes = proof['rank_suffix_table']
    for index, suffix in enumerate(suffixes):
        pointer, length = struct.unpack('<QQ', raw(int(address, 16) + index * 16, 16))
        assert length == len(suffix) and (length == 0 or raw(pointer, length).decode('ascii') == suffix), index

    print(f'0.141.0 diagnostic consumers: {len(proof["ranges"])} ranges, '
          f'{len(proof["instruction_anchors"])} instruction anchors, '
          f'{len(proof["rip_data_anchors"])} data anchors and {len(suffixes)} rank rows passed')


def check_choice_gold():
    from discovery_native_subject import verify_native_query_subject
    from native_terminal import NativeReplay
    from script_sources import load_script

    proof = json.loads((ROOT / 'docs/analysis/evidence/0.141.0/choice-gold-credit.json').read_text())
    target = latest_target(verify=True)
    assert all(target[key] == proof['target'][key] for key in ('version', 'sha256', 'size_bytes'))
    image = target_bytes(target)
    pe = load_script('overlay_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    cpu = NativeReplay(image, pe)
    ranges = {}
    for role, span in proof['ranges'].items():
        start, end = (int(span[key], 16) for key in ('start', 'end_exclusive'))
        assert hashlib.sha256(cpu.raw(start, end - start)).hexdigest() == span['sha256'], role
        ranges[role] = start, end
    for query in proof['queries'].values():
        evidence = json.loads((ROOT / query['result']['path']).read_text())['structuredContent']
        verify_native_query_subject(ROOT, evidence, query, target, image=image, pe=pe)

    registers = cpu.registers
    read = lambda register: cpu.machine.reg_read(getattr(registers, 'UC_X86_REG_' + register))
    write = lambda register, value: cpu.machine.reg_write(getattr(registers, 'UC_X86_REG_' + register), value)
    tag = 0x8000000000000004
    offers = ((0, 0, 25), (1, 0, 60), (1, 119, 60), (1, 120, 60), (1, 201, 100),
              (1, 0xffffffff, 0x7fffffff))
    entry, _ = ranges['source_dispatch']
    for origin, destination in ((0, 0x145fb719e), (1, 0x145fb71cb)):
        cpu.reset('offer_source', [ranges['source_dispatch']], [destination])
        write('RDX', origin)
        write('R15', cpu.app)
        assert cpu.run(entry) == destination
        if origin == 1:
            assert read('RDX') == cpu.app and read('XMM2') == 0

    for origin, price, amount in offers:
        role = 'cache_fallback' if origin else 'level_fallback'
        entry, end = ranges[role]
        cpu.reset(role, [ranges[role]], [end - 5])
        write('RAX', price)
        write('R13' if origin else 'R15', cpu.app)
        assert cpu.run(entry) == end - 5
        assert read('RDX') == cpu.app and read('R9') == (2 if origin else 0)
        assert cpu.get(read('R8'), '<QI') == (tag, amount)

        # Start from the original card writer after the title and allocation.
        row = cpu.mem + 0x4000
        entry, end = ranges['gold_row']
        cpu.reset('gold_row', [ranges['gold_row']], [end])
        cpu.put(cpu.bp + 0xd0, '<I', amount)
        write('R13', row)
        assert cpu.run(entry) == end
        assert cpu.get(row + 0x78, '<QI') == (tag, amount)

        entry, end = ranges['row_admission']
        cpu.reset('choice_admission', [ranges['row_admission']], [end])
        cpu.put(cpu.app + 0x10e7, '<B', origin)
        cpu.put(cpu.app + 0x10e9, '<B', 2)
        cpu.put(cpu.app + 0x860, '<QQ', row, 1)
        cpu.put(row + 0x78, '<QI', tag, amount)
        write('RCX', cpu.app)
        assert cpu.run(entry) == end
        assert cpu.get(cpu.bp + 0x220, '<QI') == (tag, amount)

        # Resume after the unrelated card-string copies, using the same payload.
        gold_call = ranges['gold_call'][0] + 9
        cpu.context['ranges'] = [ranges['selected_payload'], ranges['gold_call']]
        cpu.context['stops'] = {gold_call}
        assert cpu.run(ranges['selected_payload'][0]) == gold_call
        assert read('RCX') == cpu.app and read('RDX') == amount
        assert cpu.raw(gold_call, 5)[0] == 0xe8
        assert gold_call + 5 + struct.unpack('<i', cpu.raw(gold_call + 1, 4))[0] == 0x145f87c00

    gameplay = ROOT / 'crates/azeroth-survivors-re/src/gameplay'
    level = (gameplay / 'mechanics.rs').read_text().split('pub fn choose(', 1)[1].split('pub fn tick(', 1)[0]
    cache = (gameplay / 'mechanics/treasure.rs').read_text().split('fn choose_cache_reward(', 1)[1]
    cache = cache.split('fn complete_treasure_choice(', 1)[0]
    shared = (gameplay / 'mechanics/coop.rs').read_text().split('fn credit_pickup_gold(', 1)[1]
    assert level.index('credit_pickup_gold(choice.gold)') < level.index('self.complete_choice()')
    assert cache.index('credit_pickup_gold(amount)') < cache.index('self.complete_treasure_choice()')
    assert 'self.coop.shared_gold.push((self.coop.active_slot, raw))' in shared.split('fn credit_scaled_gold', 1)[0]
    print(f'PASS: {len(offers)} current native gold payload and dispatch cases, both live choice credit routes')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--diagnostic-consumers', action='store_true',
                      help='Verify the installed 0.141.0 diagnostic callers and payload boundaries')
    mode.add_argument('--choice-gold', action='store_true',
                      help='Replay the installed 0.141.0 gold-card producer and credit route')
    args = parser.parse_args()
    if args.diagnostic_consumers:
        check_diagnostic_consumers()
    elif args.choice_gold:
        check_choice_gold()
    else:
        check()
