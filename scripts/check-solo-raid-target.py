#!/usr/bin/env python3
"""Replay selected-target solo raid-target instructions; no compile/game launch.

Writes regenerable vectors/proof only beneath ignored runtime/. This verifies
the native board/request/serializer contract, not rendering or runtime parity.
"""
import argparse
import hashlib
import json
import struct
import subprocess

from coverage_common import ROOT, latest_target, project_path, target_bytes
from script_sources import load_script
from raid_target_native import EXCERPTS, RANGES, TARGET_SHA256, RaidTargetProbe


def expected_board(values, icon, guid):
    result = list(values)
    changed = []
    if icon < 8:
        if guid:
            for other, value in enumerate(result):
                if other != icon and value == guid:
                    result[other] = 0
                    changed.append(other)
        if result[icon] != guid:
            result[icon] = guid
            changed.append(icon)
    return {'board': result, 'changed': changed}


def delta(icon, guid):
    return {'opcode': 0x321, 'body': (bytes([0, icon]) + struct.pack('<Q', guid)).hex()}


def listed(board):
    return {'opcode': 0x321, 'body': (b'\x01' + b''.join(
        bytes([icon]) + struct.pack('<Q', guid)
        for icon, guid in enumerate(board) if guid)).hex()}


def source_inspection():
    """Inspect live wiring only; these assertions do not execute Rust source."""
    def source(path):
        return (ROOT / path).read_text()

    requests = source('crates/benilla-app/src/local_client/requests.rs')
    gameplay = source('crates/azeroth-survivors-re/src/gameplay/mod.rs')
    resolved = gameplay.split('fn resolved_requests(', 1)[1].split('\nfn flush_exit(', 1)[0]
    board = source('crates/azeroth-survivors-re/src/gameplay/client/raid_targets.rs')
    bridge = source('crates/azeroth-survivors-re/src/gameplay/client.rs')
    party = source('crates/benilla-app/src/ui_party/mod.rs')
    party_feed = source('crates/benilla-app/src/ui_party/feed.rs')
    party_net = source('crates/benilla-app/src/ui_party/net.rs')
    inspection = {
        'local command retains wire icon and guid':
            'ClientCommand::SetRaidTarget { icon, guid } => Some(LocalClientRequest::SetRaidTarget { icon, guid })' in requests,
        'raid verb remains inside original ordered queue loop':
            'for request in std::mem::take(&mut requests.0)' in resolved
            and 'LocalClientRequest::SetRaidTarget { icon, guid } =>' in resolved
            and 'presentation.0.extend(board.set(icon, guid))' in resolved
            and '.retain(' not in resolved,
        'raid reply requires active client independently of optional Game':
            resolved.index('if !active') < resolved.index('LocalClientRequest::SetRaidTarget')
            < resolved.index('if session.mechanics.is_none()')
            and 'session.mechanics' not in resolved[:resolved.index('LocalClientRequest::SetRaidTarget')]
            and 'world.ready' not in resolved[:resolved.index('LocalClientRequest::SetRaidTarget')],
        'raid state and core Lua append are registered':
            'raid_targets::install(app)' in bridge
            and 'extension.framexml_appends.extend(raid_targets::appends())' in bridge
            and r'Interface\FrameXML\WorldStateFrame.lua' in board,
        'replacement reset precedes first snapshots; requests retain logout order':
            'add_systems(First,' in board
            and 'reset.after(super::sync_to_client).before(LocalClientSet::Lifecycle)' in board
            and 'resolved_requests\n                .after(native_requests)' in gameplay,
        'reset occurs on active identity change':
            'if local.active && board.identity != Some(session.identity)' in board
            and 'board.icons = [0; 8]' in board
            and 'board.identity = Some(session.identity)' in board
            and 'presentation.0.push(board.list())' in board,
        'native wire response uses production parser and decoder':
            'messages::parse_server(0x321, body)' in board
            and 'benilla_protocol::decode(packet)' in board,
        'production GroupState receives delta and full list':
            'SessionEvent::RaidTargetSet { icon, guid } => group.apply_raid_target_update(icon, guid)' in party_net
            and 'SessionEvent::RaidTargetList { entries } => group.apply_raid_target_list(&entries)' in party_net,
        'raid board owns lookup and update event':
            'pub raid_targets: [u64; 8]' in party
            and 'pub fn raid_target_index(&self, guid: u64) -> u8' in party
            and 'self.signal(GroupSignal::RaidTargetUpdate)' in party,
        'FrameXML event runs after unit snapshots':
            '.after(crate::ui_unit::UnitSnapshots)' in party
            and 'GroupSignal::RaidTargetUpdate => "RAID_TARGET_UPDATE"' in party_feed,
        'target snapshot obtains raid icon from GroupState':
            's.raid_target = self.group.raid_target_index(guid)' in source('crates/benilla-app/src/ui_unit/held.rs'),
        'Lua getter reads unit snapshot':
            '"GetRaidTargetIndex"' in source('crates/benilla-ui/src/script/unit/bindings.rs')
            and '|u| u.raid_target' in source('crates/benilla-ui/src/script/unit/bindings.rs'),
        'nameplate and overhead marker consume existing board':
            'let mark = group.raid_target_index(guid.0)' in source('crates/benilla-app/src/vplates.rs')
            and 'let guid = group.raid_targets[slot]' in source('crates/benilla-app/src/raid_marks.rs'),
        'core loader retains every matching source append':
            'for (target, source) in appends' in source('crates/benilla-app/src/ui_script/addons.rs')
            and 'bytes.extend_from_slice(source.as_bytes())' in source('crates/benilla-app/src/ui_script/addons.rs'),
    }
    assert all(inspection.values()), [name for name, passed in inspection.items() if not passed]
    return {'kind': 'source inspection, not Rust execution', 'checks': inspection}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare-rea', action='store_true')
    parser.add_argument('--output', default='runtime/raid-target-0.115.0/checks')
    args = parser.parse_args()
    output = project_path(args.output)
    if not output.is_relative_to(ROOT / 'runtime'):
        raise ValueError('Regenerable output must remain under project runtime/')
    output.mkdir(parents=True, exist_ok=True)
    target = latest_target(verify=True)
    assert target['version'] == '0.115.0' and target['sha256'] == TARGET_SHA256
    data = target_bytes(target)
    pe = load_script('raid_target_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    probe = RaidTargetProbe(data, pe)
    functions = []
    for role, (start, end) in RANGES.items():
        offset = pe.rva_offset(start - pe.image_base)
        functions.append({'role': role, 'start': hex(start), 'end_exclusive': hex(end),
                          'sha256': hashlib.sha256(data[offset:offset + end - start]).hexdigest()})
    excerpts = []
    for role, (start, end) in EXCERPTS.items():
        offset = pe.rva_offset(start - pe.image_base)
        excerpts.append({'role': role, 'start': hex(start), 'end_exclusive': hex(end),
                         'sha256': hashlib.sha256(data[offset:offset + end - start]).hexdigest()})
    popup = ROOT / 'docs/analysis/evidence/0.115.0/raid-targets/popup.lua'
    popup_bytes = popup.read_bytes()
    assert popup_bytes == data[0x7334dd4:0x7335112], 'Canonical popup must match exact selected-target bytes'
    popup_result = subprocess.run(['lua', str(ROOT / 'scripts/check-raid-target-popup.lua'), str(popup)],
                                  cwd=ROOT, check=True, capture_output=True, text=True)
    assert 'PASS: 128 ' in popup_result.stdout, popup_result.stdout
    inspection = source_inspection()
    cases = []
    boards = [[0] * 8, list(range(1, 9)), [9] * 8,
              [9, 0, 9, 8, 9, 0, 9, 7], [0xffffffffffffffff] * 8]
    guids = [0, 1, 7, 9, 0x8877665544332211, 0xffffffffffffffff]
    for board in boards:
        for icon in range(256):
            for guid in guids:
                result = probe.board(board, icon, guid)
                assert result == expected_board(board, icon, guid), (board, icon, guid, result)
                cases.append({'kind': 'board', 'input': board, 'icon': icon, 'guid': guid, **result})
    for icon in range(256):
        for guid in guids:
            result = probe.serialize(icon=icon, guid=guid)
            assert result == delta(icon, guid)
            cases.append({'kind': 'delta', 'icon': icon, 'guid': guid, **result})
    # Every occupied-slot mask exercises sparse ordering and all growth boundaries.
    for mask in range(256):
        board = [0x8877665544332200 + i if mask & (1 << i) else 0 for i in range(8)]
        result = probe.serialize(values=board)
        assert result == listed(board), (board, result)
        cases.append({'kind': 'list', 'input': board, **result})
    # Empty and all truncated request payloads read missing GUID bytes as zero.
    sample = bytes.fromhex('071122334455667788aabbccddeeff')
    for icon in range(256):
        for count in range(15):
            payload = bytes([icon]) + sample[1:count] if count else b''
            if payload[:1] == b'\xff':
                result = probe.request(boards[3], payload)
                assert result['decoded'] is None and result['packets'] == [listed(boards[3])]
                assert result['board'] == boards[3]
            else:
                result = probe.request(boards[3], payload, prefix_only=True)
                expected = [payload[0] if payload else 0,
                            int.from_bytes(payload[1:9], 'little')]
                assert result['decoded'] == expected, (payload.hex(), result, expected)
            cases.append({'kind': 'request-prefix', 'payload': payload.hex(), **result})
    for board in boards:
        for icon in [0, 1, 3, 7, 8, 254, 255]:
            for guid in guids:
                payload = bytes([icon]) + struct.pack('<Q', guid)
                result = probe.request(board, payload)
                if icon == 255:
                    assert result == {'decoded': None, 'board': board, 'packets': [listed(board)]}
                else:
                    expected = expected_board(board, icon, guid)
                    assert result['board'] == expected['board']
                    assert result['packets'] == [delta(i, expected['board'][i]) for i in expected['changed']]
                cases.append({'kind': 'request', 'input': board, 'payload': payload.hex(), **result})
    for role in EXCERPTS:
        for board in boards[:4]:
            result = probe.lifecycle(role, board)
            expected = [0] * 8 if role == 'replacement-reset' else board
            assert result == {'board': expected, 'packet': listed(expected)}
            cases.append({'kind': 'lifecycle', 'role': role, 'input': board, **result})
    vectors = json.dumps(cases, separators=(',', ':')).encode() + b'\n'
    (output / 'vectors.json').write_bytes(vectors)
    proof = {'target': {'version': target['version'], 'sha256': target['sha256']},
             'functions': functions, 'excerpts': excerpts, 'case_count': len(cases),
             'counts': {kind: sum(c['kind'] == kind for c in cases)
                        for kind in sorted({c['kind'] for c in cases})},
             'vectors_sha256': hashlib.sha256(vectors).hexdigest(),
             'executed_instruction_sites': len(probe.trace),
             'popup': {'file_offset': '0x7334dd4', 'end_exclusive': '0x7335112',
                       'sha256': hashlib.sha256(popup_bytes).hexdigest(),
                       'cases': 128, 'result': popup_result.stdout.strip()},
             'source_inspection': inspection,
             'seams': ['Rust allocator/free', 'Vec<u8> growth',
                       'local packet sender; no transport or cooperative delivery'],
             'limits': ['Synthetic inputs; selected native instructions in Unicorn',
                        'Reset/login excerpts begin after upstream admission; no full dispatcher claim',
                        'Live source guards are inspection only, not Rust execution',
                        'No compilation, application launch, rendering or original/rebuilt parity']}
    (output / 'proof.json').write_text(json.dumps(proof, indent=2) + '\n')
    evidence = ROOT / 'docs/analysis/evidence/0.115.0/raid-targets'
    manifest = json.loads((evidence / 'manifest.json').read_text())
    assert manifest['target']['sha256'] == target['sha256']
    assert manifest['native_checks'] == proof, 'Retained native proof changed'
    for row in manifest['functions'] + manifest['lifecycle_excerpts']:
        offset = int(row['file_offset'], 16)
        size = int(row['end_exclusive'], 16) - int(row['start'], 16)
        assert hashlib.sha256(data[offset:offset + size]).hexdigest() == row['sha256']
    assembly = (evidence / manifest['assembly']['path']).read_bytes()
    assert hashlib.sha256(assembly).hexdigest() == manifest['assembly']['sha256']
    for line in assembly.decode().splitlines():
        if not line or line.startswith(';'): continue
        address, encoded, *_ = line.split()
        offset = pe.rva_offset(int(address, 16) - pe.image_base)
        raw = bytes.fromhex(encoded)
        assert data[offset:offset + len(raw)] == raw
    descriptor = manifest['core_patch_descriptor']
    offset = int(descriptor['file_offset'], 16)
    assert data[offset:offset + 16].hex() == descriptor['bytes']
    assert struct.unpack_from('<QQ', data, offset) == (int(descriptor['pointer'],16), descriptor['length'])
    if args.prepare_rea:
        stage = output / 'reproduce'
        stage.mkdir(exist_ok=True)
        seeds = stage / 'seeds.tsv'
        seeds.write_text(''.join(f"{row['start']}\tfunction\n{row['start']}\tcode\n"
                                 for row in manifest['functions']))
        plan = {'target': target['path'], 'output': str((stage / 'rea').relative_to(ROOT)),
                'init_timeout': 60, 'open_timeout': 120, 'timeout': 240,
                'environment': {'REA_GHIDRA_STARTUP_TIMEOUT_MS': '600000',
                    'REA_GHIDRA_SEED_FILE': str(seeds.relative_to(ROOT)),
                    'REA_GHIDRA_DISABLED_ANALYZERS': 'Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables,Call Convention ID'},
                'operations': [{'name': 'procedure_pseudo_code', 'arguments': {'procedure': row['start']},
                                'label': row['role'], 'timeout': 660 if i == 0 else 240}
                               for i,row in enumerate(manifest['functions'])]}
        (stage / 'plan.json').write_text(json.dumps(plan,indent=2) + '\n')

    print(json.dumps({'passed': True, 'case_count': len(cases), 'counts': proof['counts'],
                      'popup_cases': 128, 'source_inspection_checks': len(inspection['checks']),
                      'proof': str((output / 'proof.json').relative_to(ROOT))}))


if __name__ == '__main__':
    main()
