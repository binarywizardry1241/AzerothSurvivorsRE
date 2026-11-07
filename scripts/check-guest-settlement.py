#!/usr/bin/env python3
"""Check bounded guest settlement instructions and evidence without compilation."""

from runtime_layout import retained_runtime_path
import argparse
import hashlib
import json
import platform
import re
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script


def digest(value):
    return hashlib.sha256(value).hexdigest()


SOURCE_ROOT = 'crates/azeroth-survivors-re/src/'
SOURCE_FILES = [SOURCE_ROOT + path for path in (
    'gameplay/guest_settlement.rs', 'gameplay/coop.rs', 'gameplay/mod.rs',
    'gameplay/client.rs', 'gameplay/client/events.rs',
    'gameplay/mechanics/progression.rs', 'gameplay/notifications.rs',
    'gameplay/terminal.rs', 'coop_directory.rs',
)]


def source_connections(proof):
    """Lexical block/order guards for live producers and consumers, not Rust execution."""
    source = {p: (ROOT / p).read_text() for p in SOURCE_FILES}
    tokens = re.compile(r'"(?:[^"\\]|\\.)*"|//[^\n]*|/\*.*?\*/', re.S)

    def mask(text):
        return tokens.sub(lambda match: ' ' * len(match[0]), text)

    def block(text, marker):
        masked = mask(text)
        start = masked.index(marker)
        opening = masked.index('{', start)
        depth = 1
        for end in range(opening + 1, len(masked)):
            depth += (masked[end] == '{') - (masked[end] == '}')
            if depth == 0:
                return text[opening + 1:end]
        raise AssertionError('Unclosed source block: ' + marker)

    def function(path, name):
        return block(source[SOURCE_ROOT + path], 'fn ' + name + '(')

    def compact(text):
        uncommented = tokens.sub(lambda match: match[0] if match[0].startswith('"') else '', text)
        return ''.join(uncommented.split())

    def ordered(text, *parts):
        cursor = 0
        for part in parts:
            cursor = text.index(part, cursor) + len(part)

    snapshot = 'gameplay/guest_settlement.rs'
    coop = 'gameplay/coop.rs'
    owner = 'gameplay/mod.rs'
    events = 'gameplay/client/events.rs'
    phase = compact(function(snapshot, 'admit_terminal_state'))
    ordered(phase, 'if!state.flag_8c{returnfalse;}',
            'ifstate.byte_8f<6{state.byte_8f}else{0}',
            'ifphase==self.last_terminal_phase{returnfalse;}',
            'self.last_terminal_phase=phase;', 'true')
    assert 'last_terminal_phase:0xff' in compact(source[SOURCE_ROOT + snapshot])
    cached = compact(function(snapshot, 'from_cached'))
    ordered(cached, 'RunProjection::read(state)', 'entry.veteran_bonus',
            'counts[index].saturating_sub(checkpoints.counts[index])',
            'xp_parts[index].wrapping_sub(checkpoints.xp_parts[index])')
    assert 'state.coop.clone()' in cached and 'state.rows.iter()' in cached
    summary = compact(function(snapshot, 'summary'))
    ordered(summary, 'if!self.summary_admitted()', 'guid!=crate::startup::TESTER_GUID',
            'grant_terminal_xp(', 'menu.record_character_bests(',
            'row.first_result', 'record_character_result(', 'apply_run_totals(')
    assert summary.endswith('menu.commit_account();events')
    account = compact(function(snapshot, 'account'))
    ordered(account, 'guid.is_none_or(|guid|guid==crate::startup::TESTER_GUID)',
            'apply_run_counts(self.delta_counts)', 'record_beaten_zone(',
            'grant_run_feats(', 'self.feats.won&&context.members.len()>=2',
            'mark_cooperative_victory(', 'grant_party_feats(', 'grant_account(',
            'menu.commit_account()', 'RunEvent::Achievement')
    assert 'summary_admitted' not in account and 'showcase' not in account
    for name, expected in [('acknowledge_summary', 'self.xp_parts=delivery.xp_parts;'),
                           ('acknowledge_account', 'self.counts=snapshot.counts();')]:
        assert expected in compact(function(snapshot, name))
    restored = compact(function('gameplay/mechanics/progression.rs', 'restore_guest_checkpoints'))
    for assignment in ('terminal_xp_parts=xp_parts;', 'terminal_counts=counts;',
                       'result_saved=result_saved;', 'last_terminal_phase=last_terminal_phase;'):
        assert assignment in restored
    assert 'events::guest_account_messages(events,catalog,locale,notifications,now)' in compact(
        function('gameplay/client.rs', 'guest_account_messages'))
    settle = compact(function(coop, 'settle'))
    ordered(settle, 'self.zone.is_some()&&self.state.is_some()',
            'game.is_party_replica()', 'persist_run_at(',
            'Snapshot::from_cached(', 'snapshot.summary(', 'acknowledge_summary(',
            'snapshot.account(', 'acknowledge_account(', 'self.pending_events.extend(events)')
    assert 'ifclosing{client::guest_account_messages(&mutself.pending_events' in settle
    assert 'self.terminal_delivery=snapshot.delivery().cloned();' in settle
    ordered(settle, 'self.terminal_delivery=game.summary_delivery()',
            'terminal::unlocked_zone(', 'persist_run_at(')
    receive = function(coop, 'receive')
    zone = compact(block(receive, 'NativeMessage::ZoneKey(zone) if guest =>'))
    ordered(zone, 'state.leave()', 'run.mechanics=None', 'state.entry=Some(',
            'roster_guid,', 'account_run_grants(', 'state.zone=Some(zone)')
    assert '.settle(' not in zone and 'veteran_bonus' in zone
    state = compact(block(receive, 'NativeMessage::State(value) if guest =>'))
    ordered(state, 'validate_state(', 'game.apply_replica_native(&value)',
            'admit_terminal_state(&value)', 'state.state=Some(value)',
            'ifterminal_edge{', 'state.settle(', 'time.elapsed_secs(),false)')
    end = compact(block(receive,
        'NativeMessage::End if guest && state.zone.is_some() && state.state.is_some() =>'))
    ordered(end, 'state.settle(', 'state.leave()', 'run.mechanics=None',
            'queue_delivery(', 'SessionEnd::LoggedOut')
    assert 'iflocal.active||menu.in_run{menu.return_from_run();}' in end
    assert end.count('menu.return_from_run()') == 1
    lost = compact(function(coop, 'finish_transport_lost'))
    ordered(lost, 'runtime.transport_lost', 'state.settle(', 'state.leave()',
            'run.mechanics=None', 'queue_delivery(', 'SessionEnd::Lost', 'runtime.close_lost_driver()')
    assert 'iflocal_active||menu.in_run{menu.return_from_run();}' in lost
    assert 'local_active.then_some(benilla_protocol::SessionEnd::Lost)' in lost
    bootstrap = compact(function(coop, 'bootstrap'))
    ordered(bootstrap, 'grants.veteran_bonus=entry.veteran_bonus', 'game.set_account_grants(grants)',
            'state.checkpoints.apply_to_game(&mutgame)', 'game.apply_replica_native(value)',
            'run.selected_roster_guid=state.entry',
            'game.events.extend(std::mem::take(&mutstate.pending_events))', 'run.mechanics=Some(game)')
    persistence = compact(function(owner, 'persist_run_at'))
    guest_branch = compact(block(function(owner, 'persist_run_at'),
                                 'if game.is_party_replica()'))
    ordered(guest_branch, 'if!force_summary{return;}',
            'Snapshot::from_mechanics(', 'snapshot.summary(',
            'game.mark_terminal_summary_saved(', 'snapshot.account(',
            'game.mark_account_counts_saved(', 'game.events.extend(events)', 'return;')
    # The early return is inside the actual replica branch and precedes every
    # local equipment/seen/feat/counter consumer, not merely one grant site.
    ordered(persistence, 'ifgame.is_party_replica()', 'if!force_summary{return;}',
            'letsaves_equipment=', 'game.drain_equipment()', 'grant_run_feats(')
    requests = compact(function(owner, 'native_requests'))
    ordered(requests, 'replica.settle(', 'driver.close()', 'replica.leave()',
            'session.mechanics=None', 'finish_client_delivery(')
    leave = compact(block(function('coop_directory.rs', 'poll'), 'FormRequest::Leave =>'))
    ordered(leave, 'guest.settle(', 'guest.leave()', 'run.mechanics=None',
            'queue_guest_delivery(', 'runtime.driver.take()', 'driver.close()')
    assert 'iflocal.active||menu.in_run{menu.return_from_run();}' in leave
    assert leave.count('menu.return_from_run()') == 1
    queue = compact(function(coop, 'queue_delivery'))
    ordered(queue, 'flush_events(world)', '0.extend(messages)', 'flush_events(world)',
            'ifletSome(end)=end', '0.push(event)', 'flush_events(world)',
            'local.logout()', '0.extend(later_wire)', '0.extend(later_presented)')
    delivery = compact(function(events, 'settlement_messages'))
    ordered(delivery, 'std::mem::take(events)', 'RunEvent::TalentXp', 'talent_message(',
            'RunEvent::Achievement', 'achievement_messages(', 'messages.extend(packets)',
            'notifications.account_toast(text,now)')
    assert 'else{events.push(event);}' in delivery
    assert 'account:true' in compact(function('gameplay/notifications.rs', 'account_toast'))
    rendering = compact(function('gameplay/notifications.rs', 'sync'))
    assert 'in_run||row.account' in rendering
    terminal = compact(function('gameplay/terminal.rs', 'capture'))
    ordered(terminal, 'guest.terminal_delivery.take()', 'guest_delivery.or_else(||game.terminal_delivery())')
    assert 'guest.terminal_unlocked_zone.take()' in terminal
    assert 'guest_unlock.unwrap_or_else(' in terminal
    guest_actions = compact(block(function('gameplay/terminal.rs', 'input'),
        'TerminalAction::Again|TerminalAction::Menu=>'))
    ordered(guest_actions, 'guest.settle(', 'menu.persist_selection(',
            'LifecyclePacket::Disconnect', 'driver.close()',
            'guest.leave()', 'session.mechanics=None', 'queue_delivery(', 'SessionEnd::LoggedOut')
    assert 'ifactive_client||menu.in_run{menu.return_from_run();}' in guest_actions
    projected = compact(function(events, 'project'))
    ordered(projected, 'RunEvent::TalentXp', 'talent_message(', 'terminal.queue_talent(value)')
    for row in proof['source_connections']:
        for path, anchor in row['anchors']:
            assert path in source and anchor in source[path], row['id']
    for row in proof.get('source_receipts', []):
        assert digest((retained_runtime_path(ROOT / row['path'], ROOT)).read_bytes()) == row['sha256'], row['path']
    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin',
            ('Darwin', 'x86_64'): 'x86_64-apple-darwin',
            ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu',
            ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}.get((platform.system(), platform.machine()))
    rustfmt = ROOT / '.tools/rust' / ('1.98.1-' + (host or 'unsupported')) / 'bin/rustfmt'
    assert rustfmt.is_file(), 'Configured syntax parser is unavailable; no installation attempted'
    for path, text in source.items():
        result = subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout',
                                 '--config', 'skip_children=true'], input=text, text=True,
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, cwd=ROOT, timeout=30)
        assert result.returncode == 0, (path, result.stderr)
    return len(proof['source_connections']), len(source), len(proof.get('source_receipts', []))


def native_cases(image, pe, proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    cs = Cs(CS_ARCH_X86, CS_MODE_64)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    app, stack = 0x200000000, 0x300000000
    machine.mem_map(app, 0x4000)
    machine.mem_map(stack, 0x4000)
    mapped = set()
    for row in proof['native_spans']:
        start, count = int(row['start'], 16), row['byte_count']
        for page in range(start & ~4095, (start + count + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        at = int(row['file_offset'], 16)
        machine.mem_write(start, image[at:at + count])
    for row in proof['data']:
        start = int(row['start'], 16)
        page = start & ~4095
        if page not in mapped:
            machine.mem_map(page, 4096)
            mapped.add(page)
        machine.mem_write(start, bytes.fromhex(row['bytes_hex']))

    observed, stops = [], set()

    def instruction_hook(uc, address, count, unused):
        if address in stops:
            uc.emu_stop()
            return
        at = pe.rva_offset(address - pe.image_base)
        assert bytes(uc.mem_read(address, count)) == image[at:at + count]
        instruction = next(cs.disasm(image[at:at + count], address))
        if instruction.mnemonic == 'call':
            # Explicit callee seam: preserve native guard/branch instructions;
            # record the call and continue without executing summary/save code.
            observed.append(int(instruction.op_str, 16))
            uc.reg_write(reg.UC_X86_REG_RIP, address + count)

    machine.hook_add(UC_HOOK_CODE, instruction_hook)
    count = 0
    for start, stop, register in [
        (0x145b18a59, 0x145b18a8d, reg.UC_X86_REG_RDI),
        (0x145b18b99, 0x145b18bd1, reg.UC_X86_REG_RSI),
        (0x145b1c31f, 0x145b1c375, reg.UC_X86_REG_RSI),
    ]:
        for connection in (0, 1, 2, 3, 0xffffffff):
            for zone_present in (False, True):
                for cached_present in (False, True):
                    machine.mem_write(app, bytes(0x4000))
                    machine.mem_write(app + 0xca0, struct.pack('<Q', connection))
                    machine.mem_write(app + 0xfa8, struct.pack('<Q', int(zone_present)))
                    machine.mem_write(app + 0xed0, struct.pack('<q', 0 if cached_present else -1))
                    for r in (reg.UC_X86_REG_RCX, register):
                        machine.reg_write(r, app)
                    machine.reg_write(reg.UC_X86_REG_RBP, stack + 0x1000)
                    machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x3000)
                    observed.clear()
                    stops.clear()
                    stops.add(stop)
                    machine.emu_start(start, 0, count=100)
                    assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
                    expected = [0x145b0f7d0, 0x145b15590] if connection <= 1 and zone_present and cached_present else []
                    assert observed == expected, (hex(start), connection, zone_present, cached_present, observed)
                    count += 1

    # Exact byte arithmetic at the summary's phase admission branch. Every u8
    # value is covered, including unsigned wraparound at zero and invalid tags.
    start, accept, reject = 0x145b0f857, 0x145b0f865, 0x145b10a25
    for phase in range(256):
        machine.mem_write(stack + 0x106f, bytes([phase]))
        machine.reg_write(reg.UC_X86_REG_RBP, stack + 0x1000)
        stops.clear()
        stops.update((accept, reject))
        machine.emu_start(start, 0, count=10)
        assert (machine.reg_read(reg.UC_X86_REG_RIP) == accept) == (1 <= phase <= 5)
        count += 1
    # The entry helper's maximum-of-nine XP producer is retained as static
    # code; here its selected/highest XP input seam isolates Veteran arithmetic.
    for rank in (0, 1, 2, 5, 255):
        for selected in (0, 9, 10, 11, 0xffffffff):
            for highest in (10, 0xffffffff):
                machine.mem_write(app, struct.pack('<IB', selected, 1) + bytes(35))
                machine.reg_write(reg.UC_X86_REG_RAX, app)
                machine.reg_write(reg.UC_X86_REG_RCX, 40)
                machine.reg_write(reg.UC_X86_REG_RBX, 1)
                machine.reg_write(reg.UC_X86_REG_RDI, rank)
                machine.reg_write(reg.UC_X86_REG_RDX, highest)
                stops.clear()
                stops.add(0x145b44cf0)
                machine.emu_start(0x145b44ca3, 0, count=100)
                assert machine.reg_read(reg.UC_X86_REG_RIP) == 0x145b44cf0
                actual = machine.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff
                per_rank = struct.unpack('<f', struct.pack('<f', 0.2))[0]
                expected = rank * per_rank if rank and selected < highest else 0.0
                assert actual == struct.unpack('<I', struct.pack('<f', expected))[0]
                count += 1
    for current, previous in [
        ([0] * 7, [0] * 7),
        (list(range(7)), [0] * 7),
        (list(range(7)), list(range(7))),
        ([0] * 7, list(range(7))),
        ([-(1 << 63)] * 7, [(1 << 63) - 1] * 7),
        ([(1 << 63) - 1, -5, 0, 5, -(1 << 63), 7, -7], [1, 5, -1, -5, -1, 0, 0]),
    ]:
        machine.mem_write(app + 0x400, struct.pack('<7q', *current))
        machine.mem_write(app + 0x500, struct.pack('<7q', *previous))
        machine.mem_write(app + 0x600, struct.pack('<2Q', app + 0x400, app + 0x500))
        machine.reg_write(reg.UC_X86_REG_RAX, app + 0x2000)
        machine.reg_write(reg.UC_X86_REG_RDX, app + 0x600)
        machine.reg_write(reg.UC_X86_REG_RSI, 0)
        machine.reg_write(reg.UC_X86_REG_R14, 7)
        stops.clear()
        stops.add(0x145c3d59c)
        machine.emu_start(0x145c3d479, 0, count=200)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == 0x145c3d59c
        for index, (new, old) in enumerate(zip(current, previous)):
            actual = struct.unpack('<2Q', machine.mem_read(app + 0x2000 + 16 * index, 16))
            assert actual == (index, (new - old) & ((1 << 64) - 1))
        count += 1
    # The ordinary local tick is not a second guest account/feat boundary.
    for mode in (0, 1, 2, 3, 0xffffffff):
        machine.mem_write(app + 0x10, struct.pack('<I', mode))
        machine.reg_write(reg.UC_X86_REG_RDI, app)
        stops.clear()
        stops.update((0x145b00ab0, 0x145b01d08))
        for stop in stops:
            page = stop & ~4095
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.emu_start(0x145b00aa6, 0, count=10)
        assert (machine.reg_read(reg.UC_X86_REG_RIP) == 0x145b00ab0) == (mode == 2)
        count += 1
    for start, stop, flag_offset in [
        (0x145b18ad8, 0x145b18aea, 0x611),
        (0x145b18e0b, 0x145b18e1d, 0x2e1),
    ]:
        for in_world in (0, 1, 2, 255):
            machine.reg_write(reg.UC_X86_REG_RBP, stack + 0x1000)
            machine.reg_write(reg.UC_X86_REG_RDI, app)
            machine.reg_write(reg.UC_X86_REG_RSI, app)
            machine.mem_write(stack + 0x1000 + flag_offset, bytes([in_world]))
            observed.clear()
            stops.clear()
            stops.add(stop)
            machine.emu_start(start, 0, count=20)
            assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
            assert observed == ([0x145b1a630] if in_world else [])
            count += 1
    return count


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--require-retained-queries', action='store_true')
    args = parser.parse_args()
    proof = json.loads((ROOT / 'docs/analysis/evidence/guest-settlement/manifest.json').read_text())
    target = latest_target(verify=True)
    assert all(target[k] == proof['target'][k] for k in ('version', 'sha256', 'size_bytes'))
    image = target_bytes(target)
    pe = load_script('guest_settlement_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    unwind_rva, unwind_size = pe.directories[3]
    unwind_offset = pe.rva_offset(unwind_rva)
    extents = {(pe.image_base + start, pe.image_base + end) for start, end, unused in
               (struct.unpack_from('<III', image, offset) for offset in
                range(unwind_offset, unwind_offset + unwind_size, 12))}
    for row in proof['functions']:
        assert (int(row['start'], 16), int(row['end_exclusive'], 16)) in extents, row['role']
    import capstone
    cs = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    for row in proof['functions'] + proof['native_spans'] + proof['data']:
        start, offset = int(row['start'], 16), int(row['file_offset'], 16)
        assert pe.rva_offset(start - pe.image_base) == offset, row['role']
        raw = image[offset:offset + row['byte_count']]
        assert digest(raw) == row['sha256'], row['role']
        if 'instruction_count' in row:
            instructions = list(cs.disasm(raw, start))
            assert len(instructions) == row['instruction_count'], row['role']
            assert sum(i.size for i in instructions) == row['byte_count'], row['role']
        if 'bytes_hex' in row:
            assert raw.hex() == row['bytes_hex'], row['role']
        if 'targets' in row:
            assert [hex(start + struct.unpack_from('<i', raw, i)[0]) for i in range(0, len(raw), 4)] == row['targets']
    for row in proof['relocations']:
        seed, mask = bytes.fromhex(row['seed_hex']), bytes.fromhex(row['mask_hex'])
        pattern = b''.join(re.escape(bytes([b])) if m else b'.' for b, m in zip(seed, mask))
        matches = list(re.finditer(pattern, image, re.S))
        assert len(matches) == 1 and matches[0].start() == int(row['unique_current_file_offset'], 16), row['role']
    assembly = proof['assembly']
    raw = (ROOT / assembly['path']).read_bytes()
    assert digest(raw) == assembly['sha256']
    encoded = b''.join(bytes.fromhex(line.split(':', 1)[1].strip().split()[0]) for line in raw.decode().splitlines() if line and not line.startswith(';'))
    assert encoded == b''.join(image[int(r['file_offset'], 16):int(r['file_offset'], 16) + r['byte_count']] for r in proof['native_spans'])
    checked = 0
    for row in proof['queries']:
        if not (ROOT / row['result']).exists():
            assert not args.require_retained_queries, row['result']
            continue
        for name in ('plan', 'journal', 'result', 'input'):
            assert digest((ROOT / row[name]).read_bytes()) == row[name + '_sha256'], row[name]
        evidence = json.loads((ROOT / row['result']).read_text())['structuredContent']
        assert evidence['evidence_id'] == row['evidence_id']
        assert evidence['analysis_profile']['digest'] == row['profile_digest']
        assert digest(evidence['normalized_result'].encode()) == row['normalized_sha256']
        checked += 1
    dependency = proof['account_dependency']
    account_result = ROOT / dependency['current_query']
    if account_result.exists():
        assert digest(account_result.read_bytes()) == dependency['current_query_sha256']
    else:
        assert not args.require_retained_queries, str(account_result)
    cases = native_cases(image, pe, proof)
    connected, syntax, receipts = source_connections(proof)
    print(json.dumps(dict(target=target['version'], native_ranges=len(proof['native_spans']), native_bytes=sum(r['byte_count'] for r in proof['native_spans']), independently_decoded_instructions=sum(r['instruction_count'] for r in proof['native_spans']), native_cases=cases, retained_queries_checked=checked, source_connections_checked=connected, rust_syntax_files=syntax, source_receipts_checked=receipts, target_executed=False, compilation=False, parity_verified=False), indent=2))


if __name__ == '__main__':
    main()
