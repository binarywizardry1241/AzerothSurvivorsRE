#!/usr/bin/env python3
"""Check current co-op wire/state source evidence without compiling or execution."""
import argparse
import hashlib
from itertools import product
import json
import math
import struct

from coverage_common import ROOT, installed_identity, latest_target, target_bytes
from native_terminal import NativeReplay
from script_sources import load_script

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
MANIFEST = ROOT / 'docs/analysis/evidence/0.115.0/coop-replication/manifest.json'
GUEST_SPELL_ROWS = ROOT / 'docs/analysis/evidence/0.141.0/coop-guest-spell-rows.json'
PROTOCOL_13 = ROOT / 'docs/analysis/evidence/0.141.0/coop-replication.json'
SETTLEMENT = ROOT / 'docs/analysis/evidence/0.141.0/party-achievement-settlement.json'


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def installed_ranges(path):
    proof = json.loads(path.read_text())
    target = installed_identity()
    assert target == proof['target']
    data = target_bytes(target)
    pe = load_script('coop_replication_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    ranges = {}
    for row in proof['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert digest(data[offset:offset + end - start]) == row['sha256'], row['role']
        ranges[row['role']] = (start, end)
    return proof, data, pe, ranges


def check_guest_spell_rows():
    proof, data, pe, ranges = installed_ranges(GUEST_SPELL_ROWS)
    replay = NativeReplay(data, pe)
    reg = replay.registers
    cpu = replay.machine
    limit = proof['row_limit']
    vector = replay.app + 0x100
    rows = replay.app + 0x4000
    drop_row = int(proof['drop_resource_row'], 16)
    resource_stop = int(proof['resource_loop'], 16)

    def drop_resource(address):
        if address != drop_row:
            return False
        dropped.append(cpu.reg_read(reg.UC_X86_REG_RCX))
        replay.return_seam()
        return True

    replay.seam = drop_resource
    counts = [0, 127, 128, 129, limit - 1, limit, limit + 1, limit + 20]
    for count in counts:
        dropped = []
        replay.reset('resources', [ranges['resource_cap']], [resource_stop])
        replay.put(vector, '<QQQ', count, rows, count)
        cpu.reg_write(reg.UC_X86_REG_RCX, replay.app)
        cpu.reg_write(reg.UC_X86_REG_RDX, vector)
        replay.run(ranges['resource_cap'][0])
        kept = min(count, limit)
        assert replay.get(vector + 16, '<Q') == (kept,)
        assert cpu.reg_read(reg.UC_X86_REG_RAX) == kept
        assert dropped == [rows + i * 0xb0 for i in range(kept, count)]

    replay.seam = None
    vectors = [
        [], [-1.0, float('nan'), 25.0, 0.5], [float('inf'), float('-inf')],
        [1.0] * 128 + [2.0], [1.0] * (limit - 1) + [float('inf'), 3.0],
        [1.0] * (limit - 3) + [float('nan'), -2.0, 25.0, 4.0],
    ]
    timer_stop = int(proof['timer_publish'], 16)
    timer_ranges = [ranges['timer_filter_clamp'], ranges['timer_compaction']]
    for values in vectors:
        replay.reset('timers', timer_ranges, [timer_stop])
        replay.put(replay.bp + 0x8d0, '<Q', vector)
        replay.put(vector + 8, '<QQQ', len(values), rows, len(values))
        cpu.reg_write(reg.UC_X86_REG_R12, replay.app)
        for index, value in enumerate(values):
            replay.put(rows + index * 12, '<IfB', index, value, index % 2)
        replay.run(timer_ranges[0][0])
        expected = [(i, min(max(value, 0.1), 10.0), i % 2)
                    for i, value in enumerate(values[:limit]) if math.isfinite(value)]
        assert cpu.reg_read(reg.UC_X86_REG_RDX) == rows
        assert cpu.reg_read(reg.UC_X86_REG_R8) == len(expected)
        assert [replay.get(rows + index * 12, '<IIB') for index in range(len(expected))] == [
            (i, struct.unpack('<I', struct.pack('<f', value))[0], flag)
            for i, value, flag in expected
        ]

    base = ROOT / 'crates/azeroth-survivors-re/src'
    state = (base / 'coop/client_state.rs').read_text()
    assert f'const MAX_GUEST_SPELL_ROWS: usize = {limit};' in state
    resources = state.split('pub fn sanitize_resources', 1)[1].split('/// Tag 12', 1)[0]
    timers = state.split('pub fn sanitize_timers', 1)[1].split('#[cfg(test)]', 1)[0]
    assert 'rows.truncate(MAX_GUEST_SPELL_ROWS);' in resources
    assert timers.index('rows.truncate(MAX_GUEST_SPELL_ROWS);') < timers.index('rows.retain(')
    assert 'f32::from_bits(row.value_bits).is_finite()' in timers
    assert '.clamp(0.1, 10.0)' in timers
    game = (base / 'gameplay/coop.rs').read_text()
    assert 'sanitize_timers(&mut rows); state.timers = rows;' in ' '.join(game.split())
    print(f'PASS: {len(counts)} resource cases and {len(vectors)} timer cases, '
          f'{replay.instructions} native steps and source publication guards')


def replay_state_cadence(replay, proof, ranges):
    first, send = ranges['state_cadence']
    skip = int(proof['cadence_skip'], 16)
    reg = replay.registers
    cpu = replay.machine
    phase = replay.app + 0x1000
    peer = replay.app + 0x3000
    game = replay.app + 0x5000
    period = struct.unpack('<d', replay.raw(ranges['state_period_literal'][0], 8))[0]
    assert period == 1.0

    def float_bits(value):
        return struct.unpack('<Q', struct.pack('<d', value))[0]

    cases = 0
    times = ((0., 0.), (4., 4.99), (4., 5.), (4., 5.01), (4., 7.), (4., 3.), (4., math.nan))
    for start in (first, int(proof['cadence_second_path'], 16)):
        for last, now in times:
            for mode, value in product((0, 1), range(256)):
                replay.reset('state cadence', [ranges['state_cadence']], [send, skip])
                replay.put(peer + 0x368, '<d', last)
                replay.put(replay.bp + 0x1290, '<Q', phase)
                replay.put(phase + 0x10f3, '<B', mode)
                replay.put(phase + 0x10f9 + mode, '<B', value)
                replay.put(phase + 0x10f9 + (1 - mode), '<B', 1 if value & 6 == 4 else 4)
                cpu.reg_write(reg.UC_X86_REG_RAX, peer)
                cpu.reg_write(reg.UC_X86_REG_RCX, peer)
                cpu.reg_write(reg.UC_X86_REG_R12, game)
                cpu.reg_write(reg.UC_X86_REG_XMM6, float_bits(now))
                cpu.reg_write(reg.UC_X86_REG_XMM9, float_bits(period))
                stop = replay.run(start)
                periodic = now - last >= period
                assert (stop == send) == (periodic or value & 6 == 4)
                assert replay.get(peer + 0x368, '<d') == (now if periodic else last,)
                cases += 1
    return cases


def replay_controls(replay, proof, ranges):
    reg = replay.registers
    cpu = replay.machine
    packet = replay.app + 0x1000
    reader = replay.bp + 0x618
    decoded = int(proof['control_reader_done'], 16)
    reject = int(proof['control_reader_reject'], 16)
    encoded = int(proof['control_writer_done'], 16)
    readers = [ranges[role] for role in ('control_read_dispatch', 'control_read_bool',
               'control_read_fields', 'control_read_u8', 'control_read_u32')]
    writers = [ranges[role] for role in ('control_write_dispatch', 'control_write_cases')]
    widths = {ranges['control_write_u8'][0]: 1, ranges['control_write_u32'][0]: 4}
    output = bytearray()

    def write_primitive(address):
        width = widths.get(address)
        if width is None:
            return False
        value = cpu.reg_read(reg.UC_X86_REG_RDX) & ((1 << (8 * width)) - 1)
        output.extend(value.to_bytes(width, 'little'))
        cpu.reg_write(reg.UC_X86_REG_RAX, cpu.reg_read(reg.UC_X86_REG_RCX))
        replay.return_seam()
        return True

    cases = 0
    offer = 0x11223344
    for kind in range(11):
        tail = struct.pack('<I', offer) if kind in (0, 3) else b''
        for argument in range(256):
            output.clear()
            replay.seam = write_primitive
            replay.reset('control encode', writers, [encoded])
            replay.put(packet + 8, '<BBHI', kind, argument, 0, offer)
            cpu.reg_write(reg.UC_X86_REG_RDI, packet)
            replay.run(writers[0][0])
            raw = argument if kind in (0, 2) else (argument & 1 if 7 <= kind <= 9 else 0)
            assert output == bytes((8, kind, raw)) + tail

            replay.seam = None
            replay.reset('control decode', readers, [decoded, reject])
            body = bytes((kind, argument)) + tail
            cpu.mem_write(packet, body + b'\xcc')
            replay.put(reader, '<QQQB', packet, len(body) + 1, 0, 1)
            cpu.reg_write(reg.UC_X86_REG_RSI, reader)
            assert replay.run(readers[0][0]) == decoded
            value = argument if kind in (0, 2) else int(7 <= kind <= 9 and argument != 0)
            assert cpu.reg_read(reg.UC_X86_REG_RAX) == (int.from_bytes(tail, 'little') << 24) | value
            assert replay.get(reader + 16, '<Q') == (len(body),)
            cases += 2

    for kind in range(11, 256):
        replay.reset('control reject', readers, [decoded, reject])
        cpu.mem_write(packet, bytes((kind, 0xff)))
        replay.put(reader, '<QQQB', packet, 2, 0, 1)
        cpu.reg_write(reg.UC_X86_REG_RSI, reader)
        assert replay.run(readers[0][0]) == reject
        cases += 1
    return cases


def replay_state_party_context(replay, target):
    proof = json.loads(SETTLEMENT.read_text())
    assert proof['target'] == target
    span = next(row for row in proof['native_spans'] if row['role'] == 'local-party-context')
    start, end = int(span['start'], 16), int(span['end_exclusive'], 16)
    assert replay.pe.rva_offset(start - replay.pe.image_base) == int(span['file_offset'], 16)
    assert digest(replay.raw(start, end - start)) == span['sha256']
    reg, cpu = replay.registers, replay.machine
    game, result = replay.app, replay.app + 0x2000

    def clone_empty_event_vector(address):
        if address != 0x146040e60:
            return False
        assert cpu.reg_read(reg.UC_X86_REG_RDX) == game + 0xe60
        replay.put(cpu.reg_read(reg.UC_X86_REG_RCX), '<QQQ', 0, 8, 0)
        replay.return_seam()
        return True

    replay.seam = clone_empty_event_vector
    cases = 0
    for mode, remote_count in product((0, 1, 2, 255), (0, 1, 4)):
        replay.reset('party-context', [(start, end)], [replay.done])
        replay.put(game + 0x10e3, '<B', mode)
        replay.put(game + 0xcf0, '<Q', remote_count)
        replay.put(game + 0xff8, '<Q', 3)
        replay.put(game + 0x47f, '<B', 5)
        replay.put(game + 0x10c8, '<I', 7)
        replay.put(game + 0xf68, '<If', 1, 123.0)
        cpu.reg_write(reg.UC_X86_REG_RCX, result)
        cpu.reg_write(reg.UC_X86_REG_RDX, game)
        replay.run(start)
        if mode:
            assert replay.get(result, '<QQQ') == (0, 4, 0)
            assert replay.get(result + 0x30, '<IfIBB') == (1, 123.0, 7, 3, 5)
        else:
            assert replay.get(result, '<q') == (-1,)
        cases += 1
    replay.seam = None
    return cases


def check_protocol_13():
    proof, data, pe, ranges = installed_ranges(PROTOCOL_13)
    replay = NativeReplay(data, pe)
    cadence = replay_state_cadence(replay, proof, ranges)
    controls = replay_controls(replay, proof, ranges)
    party_context = replay_state_party_context(replay, proof['target'])

    base = ROOT / 'crates/azeroth-survivors-re/src'
    publish = ' '.join((base / 'gameplay/coop_publish.rs').read_text().split())
    cadence_source = publish.split('fn recipient_state_due(', 1)[1].split('fn publish(', 1)[0]
    assert 'let periodic = now - state.state_sent_at.get(&client).copied().unwrap_or(0.) >= 1.0;' in cadence_source
    assert 'if periodic { state.state_sent_at.insert(client, now); } periodic || terminal' in cadence_source
    assert publish.count('state.state_sent_at.insert(client, now);') == 1
    assert 'recipient_state_due(&mut state, client, game.native_state_terminal(), now)' in publish
    assert 'let Some(display) = display else {' in publish
    no_display = publish.split('let Some(display) = display else {', 1)[1].split('let addon_due', 1)[0]
    assert 'client.filter(|_| state_due)' in no_display
    assert '.with_party_hero(slot, |game| game.native_state())' in no_display
    assert 'runtime.send(Some(client), NativeMessage::State(native));' in no_display
    assert 'state_due.then(|| game.native_state())' in publish
    assert 'if let Some(native) = native { runtime.send(Some(client), NativeMessage::State(native)); }' in publish

    mechanics = (base / 'gameplay/mechanics/coop.rs').read_text()
    context = mechanics.split('pub fn cooperative_feat_context(', 1)[1].split('pub fn set_equipment_ids(', 1)[0]
    assert 'return self.coop.replica_feats.clone();' in context
    assert 'if !self.has_party()' in context
    assert 'remotes' not in context and 'active_slot' not in context
    assert 'flag_8c: self.native_state_terminal(),' in mechanics

    wire = (base / 'coop/replication.rs').read_text()
    writer = wire.split('fn encode_control_argument(', 1)[1].split('pub fn encode_message(', 1)[0]
    assert '7..=9 => argument & 1,' in writer
    assert 'encode_control_argument(*kind, *argument)' in wire
    reader = wire.split('        8 => {', 1)[1].split('        10 =>', 1)[0]
    assert '7..=9 => u8::from(argument != 0),' in reader
    assert '0 | 2 => argument,' in reader
    assert 'if matches!(kind, 0 | 3) { reader.word()? } else { 0 }' in reader
    print(f'PASS: {cadence} State15 cadence cases, {party_context} party context cases, {controls} Control8 cases, '
          f'{replay.instructions} native steps and source route checks')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--guest-spell-rows', action='store_true',
                        help='check current guest tag 11 and tag 12 admission')
    parser.add_argument('--protocol-13', action='store_true',
                        help='check 0.141.0 State15 cadence and Control8 wire')
    args = parser.parse_args()
    if args.protocol_13:
        check_protocol_13()
        return
    if args.guest_spell_rows:
        check_guest_spell_rows()
        return
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.115.0'
    retained = json.loads(MANIFEST.read_text())
    assert retained['target']['sha256'] == SHA
    assert retained['target_executed'] is False and retained['compiled'] is False
    data = target_bytes(target)
    pe = load_script('coop_replication_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    owners = {}
    for row in retained['owners']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert digest(data[offset:offset + end - start]) == row['sha256'], row['role']
        assert digest((ROOT / row['extract']).read_bytes()) == row['extract_sha256']
        owners[row['start']] = row
    for row in retained['shared_ranges']:
        shared = json.loads((ROOT / row['owner_manifest']).read_text())
        found = next(owner for owner in shared['functions'] if owner['start'] == row['start'])
        assert found['sha256'] == row['sha256']
        assert found['extract']['path'] == row['extract']
    tables = {}
    for row in retained['tables']:
        address = int(row['address'], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + 4 * len(row['targets'])]
        assert digest(raw) == row['sha256']
        targets = [hex(address + value) for value in struct.unpack('<' + 'i' * len(row['targets']), raw)]
        assert targets == row['targets']
        tables[row['role']] = targets
    assert len(tables['serializer19']) == 19 and len(tables['parser19']) == 19
    assert tables['enginecommandsloginSync'][7] == '0x145883dce'
    assert tables['controlboolnormalization'][7:] == ['0x14581ba07', '0x14581ba37', '0x14581b9d7']
    literals = {}
    for row in retained['literals']:
        raw = bytes.fromhex(row['hex'])
        offset = pe.rva_offset(int(row['address'], 16) - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        assert data[offset:offset + len(raw)] == raw
        assert digest(raw) == row['sha256']
        literals[row['role']] = raw
    assert literals['synchronizeconstant'] == (0x8000000000000005).to_bytes(8, 'little')
    assert literals['zoneentryevent'] == b'coopstart' and literals['zoneentrykey'] == b'bg'
    assert b';ge=' in literals['AZSRUNfieldformat'] and b';ck=' in literals['AZSRUNfieldformat']
    assert struct.unpack('<f', literals['visualscaleminimum'])[0] == struct.unpack('<f', struct.pack('<f', .1))[0]
    assert struct.unpack('<f', literals['visualscalemaximum'])[0] == 10.0
    for row in retained['ghidra_queries']:
        assert row['subject_sha256'] == owners[row['owner']]['sha256']
        assert row['evidence_id'].startswith('ev_')
        assert len(row['analysis_profile_sha256']) == 64
    assert len(retained['ghidra_queries']) >= 16
    wire = (ROOT / 'crates/azeroth-survivors-re/src/coop/replication.rs').read_text()
    state = (ROOT / 'crates/azeroth-survivors-re/src/coop/client_state.rs').read_text()
    for anchor in ('pub fn encode_message', 'pub fn decode_message', 'pub fn encode_batch',
                   'pub fn decode_frame', 'pub fn initial_world_messages',
                   'benilla_protocol::messages::parse_server', 'benilla_protocol::decode',
                   'DeflateDecoder::new', 'Compression::new(1)',
                   'MAX_INFLATED_BATCH: usize = 0x40_0000', 'reader.count(24)',
                   'reader.count(9)', 'reader.count(11)', 'reader.count(8)',
                   'String::from_utf8_lossy', 'row.key.as_bytes() == key.as_slice()',
                   'HudJson', 'kind_09 < 4', 'NativeMessage::Compressed(_)'):
        assert anchor in wire, anchor
    for anchor in ('pub struct RunProjection', 'pub fn run_modifiers',
                   'pub fn validate_state', 'pub fn sanitize_text',
                   'pub fn sanitize_resources', 'pub fn sanitize_timers',
                   'state.word_6c.min(99)', 'seconds_since_zone_start + 30.0',
                   'clock * 40.0 + 50.0', 'clock * 500.0 + 1000.0',
                   'clock * 0.05 + 1.0', 'clock * 0.1 + 2.0',
                   'density.clamp(1.0, 5.0)', 'reward.clamp(1.0, 2.0)',
                   'text.is_char_boundary(end)',
                   'clamp(0.1, 10.0)', 'pub bare: bool'):
        assert anchor in state, anchor
    assert wire.count('#[test]') == 6 and state.count('#[test]') == 3
    print(f'PASS:{len(owners)} native ranges,5 dispatch tables,{len(literals)} literals,'
          f'{len(retained["ghidra_queries"])} retained Ghidra identities;all19 wire tags '
          'and typed state source anchors;9 Rust regressions authored,unrun;'
          'no compilation,native execution,network or parity claim')


if __name__ == '__main__':
    main()
