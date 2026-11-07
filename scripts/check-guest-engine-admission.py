#!/usr/bin/env python3
"""Check #180's complete native event-admission domain without game execution.

The original pure predicate and exact receiver prefix execute in Unicorn.
The receiver stops before rejection cleanup or the admitted engine callback;
neither path invokes a game, socket, server, OS service or rebuilt source.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from equipment_native import EquipmentProbe
from script_sources import load_script


SHA = '6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f'
PROOF = ROOT / 'docs/analysis/evidence/guest-engine-admission.json'
PRIOR = ROOT / 'docs/analysis/evidence/coop-item-registry-comparison/manifest.json'
PREDICATE = (0x145ae0ce0, 0x145ae0e04)
TABLE = (0x1472da60c, 0x1472dab30)
RECEIVE = (0x145b1cd70, 0x145b1cdee)
PREPARE = (0x145b1d4f8, 0x145b1d520)
LOGIN = (0x145b099ee, 0x145b09a1c)
CALLBACK = 0x145afd100
SOURCE = 'crates/azeroth-survivors-re/src/coop/server_party.rs'
LIVE = 'crates/azeroth-survivors-re/src/gameplay/coop.rs'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def encoded(value):
    return json.dumps(value, sort_keys=True, separators=(',', ':')).encode()


def source_slice(path, first, last):
    text = (ROOT / path).read_text()
    start = text.index(first)
    stop = text.index(last, start)
    return dict(path=path, start_marker=first, end_marker=last,
                sha256=digest(text[start:stop].encode()))


class Probe(EquipmentProbe):
    def __init__(self, data, pe):
        super().__init__(data, pe, [PREDICATE, RECEIVE, PREPARE])
        self.receiving = False
        self.outcome = None
        self.instructions = 0

    def hook(self, uc, pc, size, unused):
        if pc == self.stop:
            uc.emu_stop()
            return
        if self.receiving and pc in (RECEIVE[1], CALLBACK):
            if pc == CALLBACK:
                packet = self.reg('R9')
                self.outcome = dict(slot=self.reg('R8'), actor_count=self.reg('RDX'),
                                    actor_vector=self.reg('RCX'),
                                    packet=list(struct.unpack('<QQQH', uc.mem_read(packet, 26))))
            uc.emu_stop()
            return
        assert any(first <= pc and pc + size <= last for first, last in self.ranges), hex(pc)
        self.instructions += 1

    def allowed(self, opcode, length):
        self.receiving = False
        self.invoke(PREDICATE[0], opcode, length)
        return bool(self.reg('RAX') & 0xff)

    def receiver(self, mode, synchronized, ports, opcode, length):
        self.receiving, self.outcome = True, None
        state, packet, actors = self.HEAP + 0x1000, self.HEAP + 0x3000, self.HEAP + 0x4000
        body = self.HEAP + 0x6000
        self.native.mem_write(state, bytes(0x2000))
        self.native.mem_write(actors, bytes(0x1000))
        self.native.mem_write(body, b'\x07\x00\xff')
        self.native.mem_write(state + 0xca0, struct.pack('<I', mode))
        self.native.mem_write(state + 0xfd1, bytes([synchronized]))
        self.put(state + 0x1010, actors, len(ports))
        for index, active in enumerate(ports):
            self.native.mem_write(actors + index * 0xb0 + 0xa8, bytes([active]))
        # Native received Engine variant: cap/pointer/length/opcode at+8/+10/+18/+20.
        self.put(packet + 8, max(length, 3), body, length, opcode)
        bp = self.STACK + 0x100000
        self.put(bp + 0x438, packet)
        self.reg('RBP', bp)
        self.reg('RSI', state)
        self.reg('RSP', self.STACK + 0x180008)
        self.native.emu_start(RECEIVE[0], self.DONE, count=10000)
        assert self.reg('RIP') in (RECEIVE[1], CALLBACK)
        assert bytes(self.native.mem_read(body, 3)) == b'\x07\x00\xff'
        return self.outcome, actors, body


def run():
    target = latest_target(verify=True)
    assert target['sha256'] == SHA and target['version'] == '0.119.0'
    image = target_bytes(target)
    pe = load_script('guest_engine_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    prior = json.loads(PRIOR.read_text())
    assert prior['target']['sha256'] == SHA
    queries = []
    for role in ('guest-engine-admission', 'guest-request', 'guest-receive', 'guest-callback'):
        query = next(row for row in prior['queries'] if row['role'] == role)
        result = project_path(query['result']['path'])
        assert digest(result.read_bytes()) == query['result']['sha256']
        evidence = json.loads(result.read_text())['structuredContent']
        assert evidence['provider']['id'] == 'ghidra'
        assert evidence['evidence_id'] == query['evidence_id']
        assert evidence['analysis_profile']['digest'] == query['analysis_profile_digest']
        assert evidence['subject']['digest']['sha256'] == query['input_sha256']
        assert digest(evidence['normalized_result'].encode()) == query['normalized_sha256']
        queries.append(dict(role=role, original_manifest=PRIOR.relative_to(ROOT).as_posix(),
                            **{key: query[key] for key in ('evidence_id', 'analysis_profile_digest',
                                                          'result', 'input_sha256', 'normalized_sha256')}))

    ranges = []
    for role, (first, last) in [('predicate', PREDICATE), ('table', TABLE),
                                ('receiver', RECEIVE), ('callback-preparation', PREPARE),
                                ('login-sync-writer', LOGIN)]:
        offset = pe.rva_offset(first - pe.image_base)
        assert pe.rva_offset(last - 1 - pe.image_base) == offset + last - first - 1
        ranges.append(dict(role=role, start=hex(first), end_exclusive=hex(last),
                           file_offset=hex(offset), sha256=digest(image[offset:offset + last - first])))

    base = TABLE[0]
    offset = pe.rva_offset(base - pe.image_base)
    cells = [base + struct.unpack_from('<i', image, offset + index * 4)[0] for index in range(329)]
    assert set(cells) == {0x145ae0d4c, 0x145ae0de5}
    source = (ROOT / SOURCE).read_text()
    values = re.search(r'const GUEST_ENGINE_OPCODES: &\[u16\] = &\[(.*?)\];', source, re.S)[1]
    opcodes = [int(value, 16) for value in re.findall(r'0x[0-9a-f]+', values)]
    assert len(opcodes) == 75 and sorted(set(opcodes)) == opcodes
    assert 'payload_len <= 0xfffd && GUEST_ENGINE_OPCODES.binary_search(&opcode).is_ok()' in source
    admitted = set(opcodes)
    probe = Probe(image, pe)
    lengths = (0, 0xfffd, 0xfffe, 0xffffffffffffffff)
    matrix = hashlib.sha256()
    native_admitted = []
    for opcode in range(65536):
        for length in lengths:
            observed = probe.allowed(opcode, length)
            assert observed == (opcode in admitted and length <= 0xfffd), (opcode, length)
            matrix.update(struct.pack('<HQB', opcode, length, observed))
            if length == 0 and observed:
                native_admitted.append(opcode)
    assert native_admitted == opcodes
    assert [opcode for opcode in range(0x96, 0x1df) if cells[opcode - 0x96] == 0x145ae0d4c] == [
        opcode for opcode in opcodes if 0x96 <= opcode <= 0x1de and not
        (0xb5 <= opcode <= 0xcb and opcode != 0xc7 or opcode in (0xda, 0xdb, 0xee))]

    receiver_count, receiver_admitted = 0, 0
    receiver_digest = hashlib.sha256()
    for mode in (0, 1, 2, 3, 0xffffffff):
        for sync in (0, 1, 2, 3, 255):
            for ports in ([], [0], [1], [0, 1], [2, 1], [0, 255], [0, 0]):
                for opcode in (0x58, 0x3d, 0xb5, 0xcc, 0x321):
                    for length in (0, 0xfffd, 0xfffe):
                        result, actors, body = probe.receiver(mode, sync, ports, opcode, length)
                        expected = mode <= 1 and sync & 1 != 0 and any(ports) and opcode in admitted and length <= 0xfffd
                        assert bool(result) == expected, (mode, sync, ports, opcode, length, result)
                        if result:
                            assert result['slot'] == next(i for i, value in enumerate(ports) if value)
                            assert result['actor_count'] == len(ports) and result['actor_vector'] == actors
                            assert result['packet'] == [max(length, 3), body, length, opcode]
                            receiver_admitted += 1
                        receiver_digest.update(encoded([mode, sync, ports, opcode, length, result]))
                        receiver_count += 1

    live = (ROOT / LIVE).read_text()
    method = live[live.index('    fn guest_engine_packet('):live.index('    pub(crate) fn leave(')]
    assert 'self.sync_sent && engine_active' in method
    assert 'server_party::guest_engine_packet_allowed(' in method and 'opcode, payload.len(),' in method
    assert '.then_some(EnginePacket { opcode, payload })' in method
    first = '            NativeMessage::Lifecycle(LifecyclePacket::EngineCommand { opcode, payload }) => {\n'
    last = '            NativeMessage::ZoneKey(zone) if guest => {\n'
    arm = live[live.index(first):live.index(last)]
    assert arm.index('if let Some(client) = client') < arm.index('} else if guest {')
    assert arm.index('state.guest_engine_packet(opcode, payload, local.active)') < arm.index('packet.decode_server()')
    assert arm.index('packet.decode_server()') < arm.index('observe(') < arm.index('inbound.0.push(')
    assert 'continue;' in arm[arm.index('state.guest_engine_packet('):arm.index('packet.decode_server()')]
    assert 'self.sync_sent = false;' in live[live.index('    pub(crate) fn leave('):live.index('    pub(crate) fn settle(')]
    bootstrap = live[live.index('    if runtime.is_guest() {', live.index('fn bootstrap(')):]
    assert bootstrap.index('local.begin(player);') < bootstrap.index('if !state.sync_sent && local.active {')
    assert 'runtime.send(None, NativeMessage::Lifecycle(LifecyclePacket::Synchronize))' in bootstrap
    port = (ROOT / 'crates/benilla-app/src/local_client/events.rs').read_text()
    assert port.index('if world.resource::<LocalClientSession>().active {') < port.index('std::mem::take(&mut world.resource_mut::<LocalWireEvents>().0)')
    client = (ROOT / 'crates/benilla-app/src/local_client.rs').read_text()
    assert 'pub fn begin(&mut self, player: LocalPlayerUi)' in client and 'active: true,' in client

    return dict(schema_version=1, target={key: target[key] for key in ('version', 'sha256', 'size_bytes')},
                gap_ids=[41, 63, 180], lead_ids=['Q41-F01', 'Q41-M01'],
                generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(), sha256=digest(Path(__file__).read_bytes())),
                ranges=ranges, reused_queries=queries, table_cells=329, table_destinations=sorted(set(map(hex, cells))),
                admitted_opcodes=[hex(value) for value in opcodes], opcode_lengths=list(lengths),
                counts=dict(opcode_length_cases=65536 * len(lengths), receiver_cases=receiver_count,
                            receiver_admitted=receiver_admitted, native_instructions=probe.instructions),
                opcode_matrix_sha256=matrix.hexdigest(), receiver_matrix_sha256=receiver_digest.hexdigest(),
                source_slices=[source_slice(SOURCE, '// 0.119.0 helper145ae0ce0', '/// Server initializer'),
                               source_slice(LIVE, '    fn guest_engine_packet(', '    pub(crate) fn leave('),
                               source_slice(LIVE, first, last)],
                limits=['Only the original pure admission predicate, receiver prefix and callback argument preparation execute in Unicorn.',
                        'Receiver replay stops before rejection cleanup or engine callback; no host-call substitution is used.',
                        'Native mode/sync/vector state is synthetic; actual transport/client/engine lifetimes and scheduling are unexecuted.',
                        'The source local engine-port adapter uses LocalClientSession.active, independently of world readiness.',
                        'The table is fully bounded by the original opcode subtraction/comparison; no neighboring cells are inferred.',
                        'Rust regressions are authored but uncompiled/unrun. No game/server/socket execution or original/rebuilt parity.'],
                source_defect_repaired=True, guest_item_registry_bridge='unchanged_unrecovered',
                compilation='not_run', runtime_validation='not_run', parity='unverified')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-proof', action='store_true')
    args = parser.parse_args()
    result = run()
    if args.write_proof:
        PROOF.write_text(portable_json(result, indent=2) + '\n')
    else:
        assert portable_record(result) == portable_record(json.loads(PROOF.read_text())), 'Changed native/source proof; review before regenerating'
    print(json.dumps({key: result[key] for key in ('target', 'counts', 'table_cells', 'source_defect_repaired',
                                                'guest_item_registry_bridge', 'compilation', 'runtime_validation', 'parity')}, sort_keys=True))
