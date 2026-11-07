#!/usr/bin/env python3
"""Replay current labeled Reroll admission without compiling or running a game."""
from portable_paths import portable_json_text, portable_record
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import struct

import capstone
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as x

from coverage_common import ROOT, latest_target, target_bytes, file_sha256, json_text
from native_recovery import bits
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
RUNTIME = ROOT / 'runtime/analysis/history/native-recovery/as-ui-contracts/09a4d154b813'
OUT = ROOT / 'docs/analysis/evidence/as-ui-contracts-reroll.json'
SOURCE = ROOT / 'crates/azeroth-survivors-re/src/gameplay/mod.rs'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--native-only', action='store_true', help='Check current native facts before applying the related source patch')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['version'] == '0.113.2' and target['sha256'] == SHA
    data = target_bytes(target)
    pe = load_script('reroll_pe', ROOT / 'scripts/inventory-executable.py').PE(data)

    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        value = data[at:at + count]
        assert len(value) == count
        return value

    def span(first, last):
        return dict(va=hex(first), end_exclusive=hex(last), byte_count=last - first,
                    sha256=hashlib.sha256(raw(first, last - first)).hexdigest())

    label, label_ref = 0x145efd9a0, 0x1402a5540
    assert raw(label, 6) == b'Reroll'
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    label_instructions = list(decoder.disasm(raw(label_ref, 17), label_ref))
    assert label_instructions[0].mnemonic == 'lea'
    assert label_instructions[0].address + label_instructions[0].size + label_instructions[0].operands[1].mem.disp == label
    assert label_instructions[1].mnemonic == 'mov' and label_instructions[1].op_str == 'edx, 6'
    assert label_instructions[2].mnemonic == 'call' and label_instructions[2].op_str == '0x145895670'

    ranges = [(0x1402a5229, 0x1402a5255), (0x1400b54ba, 0x1400b554f),
              (0x1400b5661, 0x1400b567b), (0x1400b567b, 0x1400b56e4),
              (0x1400b56e9, 0x1400b5700), (0x1400e9fb9, 0x1400e9fd6),
              (0x1400ea19a, 0x1400ea1d4), (0x1400b38d9, 0x1400b3928),
              (0x1400b3944, 0x1400b3970), (0x1400b3fe8, 0x1400b3fef)]
    for first, last in ranges:
        rows = list(decoder.disasm(raw(first, last - first), first))
        assert sum(row.size for row in rows) == last - first
        assert all(row.mnemonic != 'call' for row in rows)
    controller, constructor = 0x1400b4e30, 0x1402a3100
    extents = {pe.image_base + first: pe.image_base + last for first, last, _ in pe.functions()}
    assert extents[controller] == 0x1400b5724 and extents[constructor] == 0x1402a60dc
    assert raw(0x14730b3f0, 4) == b'type' and raw(0x14730e030, 7) == b'choices'
    publish = list(decoder.disasm(raw(0x1459660f2, 5), 0x1459660f2))
    assert len(publish) == 1 and publish[0].mnemonic == 'call' and publish[0].op_str == '0x145967a30'

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(row['rva'] + max(row['raw_size'], row['virtual_size']) for row in pe.sections)
    machine.mem_map(pe.image_base, (size + 4095) & ~4095)
    for row in pe.sections:
        machine.mem_write(pe.image_base + row['rva'], data[row['raw_offset']:row['raw_offset'] + row['raw_size']])
    state, stack = 0x200000000, 0x200004000
    machine.mem_map(state, 0x10000)
    endings, visited = set(), set()

    def hook(uc, address, size, unused):
        if address in endings:
            uc.emu_stop()
        elif any(first <= address < last for first, last in ranges):
            visited.add(address)
        else:
            raise RuntimeError(f'Unreviewed native excursion {address:#x}')

    machine.hook_add(UC_HOOK_CODE, hook)

    def put(address, value, fmt='Q'):
        machine.mem_write(address, struct.pack('<' + fmt, value))

    def reg(name, value=None):
        register = getattr(x, 'UC_X86_REG_' + name)
        if value is None:
            return machine.reg_read(register)
        machine.reg_write(register, value)

    def run(first, stops):
        endings.clear()
        endings.update(stops)
        reg('RSP', stack)
        reg('EFLAGS', 2)
        reg('MXCSR', 0x1f80)
        machine.emu_start(first, 0, count=100)
        at = reg('RIP')
        assert at in endings, hex(at)
        return at

    buttons, admissions, selections, renewals = [], [], [], []
    for available, free, price, gold in itertools.product((0, 1), (0, 1),
                                                         (0, 1, 100, 0xffffffffffffffff),
                                                         (0, 1, 99, 100, 0xffffffffffffffff)):
        machine.mem_write(state, bytes(0x100))
        put(state + 0x48, available, 'B')
        put(state + 0x20, free)
        put(state + 0x28, price)
        put(state + 0x30, gold)
        reg('RAX', state)
        run(0x1402a5229, {0x1402a5255})
        expected = bool(available and (free or gold >= price))
        assert bool(reg('RBX') & 255) == expected
        buttons.append(dict(available=available, free=free, price=price, gold=gold, enabled=expected))
        for closing, pressed, age in itertools.product((0, 1), (0, 1), (0.0, 0.1, 0.449, 0.45, 0.5)):
            put(state + 0x10, closing, 'I')
            put(state + 0x44, 0.0, 'f')
            put(stack + 0x58, state)
            reg('RCX', pressed)
            reg('XMM6', bits(age))
            reg('XMM7', bits(0.45))
            at = run(0x1400b54ba, {0x1400b554f, 0x1400b5574})
            actual = at == 0x1400b554f
            assert actual == bool(expected and not closing and pressed)
            if actual:
                command = struct.unpack('<I', machine.mem_read(stack + 0x158, 4))[0]
                assert command == 3
            admissions.append(dict(available=available, free=free, price=price, gold=gold,
                                   closing=closing, pressed=pressed, age_bits=bits(age), emitted_command3=actual))

    assert raw(0x145ea2570, 4) == struct.pack('<f', 0.45)
    for index, closing, age in itertools.product((0, 1, 3, 4, 255), (0, 1), (0.1, 0.45, 0.5)):
        machine.mem_write(state, bytes(0x100))
        machine.mem_write(stack, bytes(0x300))
        put(state + 0x10, closing, 'I'); put(state + 0x18, 4)
        put(state + 0x20, 1); put(state + 0x48, 1, 'B')
        put(state + 0x80, index); put(stack + 0x58, state); put(stack + 0xa8, state + 0x90)
        reg('RCX', state + 0x80)
        run(0x1400b5661, {0x1400b4f91})
        assert struct.unpack('<Q', machine.mem_read(stack + 0xa0, 8))[0] == index
        assert machine.mem_read(stack + 0xb0, 1)[0] == 1
        assert struct.unpack('<I', machine.mem_read(state + 0x10, 4))[0] == closing
        reg('RCX', 1); reg('XMM6', bits(age)); reg('XMM7', bits(0.45))
        before = run(0x1400b54ba, {0x1400b554f, 0x1400b5574}) == 0x1400b554f
        assert before == (closing == 0)
        at = run(0x1400b567b, {0x1400b56e4, 0x1400b5700})
        committed = at == 0x1400b56e4
        assert committed == bool(index < 4 and not closing and age >= 0.45)
        if committed:
            assert struct.unpack('<I', machine.mem_read(stack + 0x158, 4))[0] == 2
            assert struct.unpack('<Q', machine.mem_read(stack + 0x160, 8))[0] == index
            run(0x1400b56e9, {0x1400b5700})
            assert struct.unpack('<I', machine.mem_read(state + 0x10, 4))[0] == 1
            assert struct.unpack('<I', machine.mem_read(state + 0x14, 4))[0] == bits(age)
            assert struct.unpack('<QQ', machine.mem_read(state, 16)) == (1, index)
        reg('RCX', 1)
        after = run(0x1400b54ba, {0x1400b554f, 0x1400b5574}) == 0x1400b554f
        assert after == bool(not closing and not committed)
        selections.append(dict(index=index, initial_closing=closing, age_bits=bits(age),
                               reroll_before_commit=before, selection_committed=committed,
                               reroll_after_commit=after))

    front, cards, clock, frame = state + 0x100, state + 0x300, state + 0x500, state + 0x1000
    for revision, same_payload, received, closing, age in itertools.product(
            (0, 1, 0x7fffffff, 0xffffffff), (False, True), (False, True), (0, 1), (0.1, 0.32, 0.5)):
        machine.mem_write(state, bytes(0x3000))
        incoming = struct.pack('<QQQQ', 3, state + 0x700, 9, 0)
        previous = incoming if same_payload else struct.pack('<QQQQ', 1, state + 0x800, 2, 0)
        machine.mem_write(front + 0x80, previous)
        put(front + 0xe0, revision, 'I'); put(cards + 0x40, revision, 'I')
        put(cards + 0x10, closing, 'I'); put(cards + 0x14, 0.0, 'f'); put(cards + 0x44, -1.0, 'f')
        put(clock + 0x5c, age, 'f')
        put(frame + 0x210, front + 0x80); put(frame + 0x240, front + 0xf0)
        put(frame + 0x250, front); put(frame + 0x260, 0x1234, 'I')
        machine.mem_write(frame + 0x1f0, incoming[:16]); machine.mem_write(frame + 0x200, incoming[16:])
        reg('RBP', frame)
        if received:
            machine.mem_write(state + 0x900, b'choices')
            reg('RAX', state + 0x900)
            assert run(0x1400e9fb9, {0x1400ea172, 0x1400e9fd6}) == 0x1400ea172
            # Resume after dropping the replaced JSON object. The original
            # replacement/revision prefix performs no payload comparison.
            run(0x1400ea19a, {0x1400ea1d4})
            assert bytes(machine.mem_read(front + 0x80, 32)) == incoming
        updated = (revision + int(received)) & 0xffffffff
        assert struct.unpack('<I', machine.mem_read(front + 0xe0, 4))[0] == updated
        put(frame + 0x3d0, clock); put(frame + 0x3b0, 1)
        reg('R8', front); reg('R12', cards)
        rebuild = run(0x1400b38d9, {0x1400b3928, 0x1400b471b}) == 0x1400b3928
        assert rebuild == bool(received and (not closing or age >= 0.32))
        if rebuild:
            put(frame + 0x348, front + 0xf0)
            reg('ECX', updated); reg('RDX', front + 0xf0); reg('EAX', 0x1234)
            run(0x1400b3944, {0x1400b3970})
            run(0x1400b3fe8, {0x1400b3fef})
            assert struct.unpack('<I', machine.mem_read(cards + 0x40, 4))[0] == updated
            assert struct.unpack('<I', machine.mem_read(cards + 0x10, 4))[0] == 0
            assert struct.unpack('<I', machine.mem_read(cards + 0x44, 4))[0] == bits(age)
        else:
            assert struct.unpack('<f', machine.mem_read(cards + 0x44, 4))[0] == -1.0
        renewals.append(dict(previous_revision=revision, same_payload=same_payload, received=received,
                             closing=closing, age_bits=bits(age), updated_revision=updated, opening_clock_reset=rebuild))

    RUNTIME.mkdir(parents=True, exist_ok=True)
    cases = RUNTIME / 'card-reroll-cases.json'
    cases.write_text(portable_json_text(dict(buttons=buttons, admissions=admissions, selections=selections, renewals=renewals)))
    if args.native_only:
        assert not args.write
        print(f'Checked {len(buttons)} labeled-button, {len(admissions)} reroll admission, {len(selections)} selection/closing and {len(renewals)} offer-renewal cases; source unchecked; no compiler/game')
        return
    source = SOURCE.read_text()
    body = source.split('fn controls(', 1)[1].split('\nfn tick(', 1)[0]
    assert 'if choosing && opened.closing.is_none() && !session.paused {' in body
    assert 'OverlayAction::Select(index) if admitted' in body
    assert body.index('let mut selected = None') < body.index('selected = Some(index)') < body.index('if let Some(index) = selected')
    assert body.index('if let Some(index) = selected') < body.index('if !input.keyboard_captured')
    assert 'OverlayAction::Banish(_) | native_overlays::OverlayAction::Skip\n                        if admitted' in body
    assert 'age >= CHOICE_OPENING_SECONDS' in body
    assert 'keyboard_choice_actions(&keys, count, age, can_reroll)' in body
    assert 'if !input.keyboard_captured && opened.closing.is_none()' in body
    keyboard = source.split('fn keyboard_choice_actions(', 1)[1].split('\nfn tick(', 1)[0]
    assert 'if age < CHOICE_OPENING_SECONDS' in keyboard
    assert 'can_reroll && keys.just_pressed(KeyCode::KeyR)' in keyboard
    assert all(f'KeyCode::Numpad{index}' in keyboard for index in range(1, 5))
    assert 'f32::from_bits(0x3ee6_6666)' in source
    assert 'fresh_offer_accepts_reroll_while_digits_wait_and_chat_keeps_keyboard_capture' in source
    assert 'pointer_selection_accepts_regenerated_row_before_exit_and_guards_later_keyboard_reroll' in source
    assert 'identical_consecutive_skip_offers_receive_a_fresh_opening_clock' in source
    assert body.count('regenerated |= game.reroll_choices()') == 1
    assert 'regenerated |= game.banish_choice(index)' in body and 'regenerated |= game.skip_choices()' in body
    assert 'if regenerated || opened.signature != signature' in body
    assert 'if opened.closing.is_some()' in body
    assert 'opened.renewal_pending = true' in body
    assert 'for action in actions' in body
    assert body.index('if reroll {') < body.index('for action in actions') < body.index('game.choose(index)')
    exit_gate = body.split('if let Some((_, began)) = opened.closing', 1)[1].split('let age =', 1)[0]
    assert 'game.choose' not in exit_gate
    assert 'opened.renewal_pending = false' in body
    assert 'if opened.renewal_pending {\n        return;\n    }' in source.split('fn hud(', 1)[1]
    evidence = json.loads((RUNTIME / 'cards-input-controller/rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
    owner = span(controller, extents[controller])
    assert evidence['provider']['id'] == 'ghidra' and evidence['subject']['digest']['sha256'] == owner['sha256']
    related = []
    for role, first in [('cards-root', 0x1400b37c0), ('screen-command-consumer', 0x1400e8e30),
                        ('generate-choices', 0x145965190)]:
        item = json.loads((RUNTIME / role / 'rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
        bounds = span(first, extents[first])
        assert item['provider']['id'] == 'ghidra' and item['subject']['digest']['sha256'] == bounds['sha256']
        related.append(dict(role=role, owner=bounds, evidence_id=item['evidence_id'], provider=item['provider'],
                            analysis_profile=item['analysis_profile'],
                            pseudocode_sha256=hashlib.sha256(item['normalized_result'].encode()).hexdigest()))
    proof = dict(schema_version=1, target={key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
                 generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(), sha256=file_sha256(Path(__file__))),
                 native_label=span(label, label + 6), label_reference=span(label_ref, label_ref + 17),
                 choice_publication_call=span(0x1459660f2, 0x1459660f7),
                 choices_message_type=span(0x14730e030, 0x14730e037),
                 labeled_constructor=span(constructor, extents[constructor]), controller=owner,
                 native_ranges=[span(first, last) for first, last in ranges],
                 button_cases=len(buttons), admission_cases=len(admissions), selection_cases=len(selections), renewal_cases=len(renewals), executed_instruction_boundaries=len(visited),
                 detailed_cases=dict(path=cases.relative_to(ROOT).as_posix(), sha256=file_sha256(cases)),
                 ghidra=dict(evidence_id=evidence['evidence_id'], provider=evidence['provider'],
                             analysis_profile=evidence['analysis_profile'],
                             pseudocode_sha256=hashlib.sha256(evidence['normalized_result'].encode()).hexdigest()),
                 related_ghidra=related,
                 source=dict(path=SOURCE.relative_to(ROOT).as_posix(), sha256=file_sha256(SOURCE)),
                 limits=['Current labeled Reroll state fields and command3 admission only; no generic ECS resource identity/alias completeness inferred.',
                         'The fixture reaches the actual enqueue CALL but does not execute it or claim complete downstream message scheduling.',
                         'Selection collection, pre-commit reroll and final closing prefixes are replayed separately; queue consumers, row iteration and native keyboard/backend scheduling are not executed.',
                         'Choices renewal resumes after the replaced JSON drop boundary, then replays revision admission/reset and opening-clock write prefixes; packet scheduling and full hierarchy construction are not executed.',
                         'Native root defers a changed revision until any existing closing interval reaches.32 seconds. Source retains the old root through that guard; accepted transactions already ran in command order. The separate current card-delivery and card-keyboard proofs own that repair; packet timing and original/rebuilt presentation remain unverified.',
                         'Existing opening gates for select/banish/skip, terminal/pause/closing and keyboard capture are retained by source tracing.',
                         'Authored live-controls Rust regressions are not run; no compiler, Rust execution, real input/UI/game or original/rebuilt parity.'],
                 gap_ids=[41], compilation_run=False, game_run=False, parity_verified=False)
    if args.write:
        OUT.parent.mkdir(parents=True, exist_ok=True)
        OUT.write_text(portable_json_text(proof))
    else:
        assert portable_record(json.loads(OUT.read_text())) == portable_record(proof), 'Current card-reroll proof is stale'
    print(f'Checked {len(buttons)} labeled-button, {len(admissions)} reroll admission, {len(selections)} selection/closing and {len(renewals)} offer-renewal cases plus live source; no compiler/game')


if __name__ == '__main__':
    main()
