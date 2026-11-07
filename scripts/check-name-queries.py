#!/usr/bin/env python3
"""Verify native name-query fallback and connected source without compiling."""
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, file_sha256, latest_target
from creature_query_native import PE, D, ENDS
from name_query_native import NameProbe, H, S

WORK = ROOT / 'runtime/analysis/history/findings/q41-all/f1125d689593'
KEEP = ROOT / 'docs/analysis/evidence/name-queries.json'


def decoded(body):
    """Wire projection; actual client decoder has separate authored Rust tests."""
    guid = struct.unpack_from('<Q', body)[0]
    end = body.index(0, 8)
    name = body[8:end].decode()
    off = body.index(0, end + 1) + 1
    if len(body) - off < 12:
        return None
    race, gender, klass = struct.unpack_from('<III', body, off)
    return dict(guid=guid, name=name, race=race, gender=gender, **{'class': klass})


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    probe, digest, cases, fixtures = NameProbe(), hashlib.sha256(), 0, []

    def check(guid, name='Tester', race=4, sex=1, klass=8, present=True, game=True, payload=None, fixture=False):
        nonlocal cases
        result = probe.name(guid, name, race, sex, klass, present, game, payload)
        if not present:
            assert result is None
        else:
            echoed = guid if payload is None else int.from_bytes(payload[:8].ljust(8, b'\0'), 'little')
            expected = struct.pack('<Q', echoed) + name.encode() + b'\0\0' + struct.pack('<III', race, sex, klass)
            assert result == (0x51, expected), (guid, name, race, sex, klass, result)
            if fixture:
                fixtures.append(dict(guid=echoed, name=name, race=race, sex=sex,
                    **{'class': klass}, opcode=0x51, packet_hex=expected.hex(), decoded=decoded(expected)))
        digest.update(json.dumps([guid, name, race, sex, klass, present, game,
            payload.hex() if payload is not None else None, result[1].hex() if result else None],
            ensure_ascii=False, separators=(',', ':')).encode() + b'\n')
        cases += 1

    for game in [False, True]:
        for axis in range(3):
            for value in range(256):
                fields = [4, 1, 8]
                fields[axis] = value
                check(0xfedcba9876543210, race=fields[0], sex=fields[1], klass=fields[2], game=game)
        for count in range(321):
            check(0, name='A' * count, game=game)
        for length in range(13):
            check(0, payload=bytes(range(1, 14))[:length], game=game)
        for present in [False, True]:
            check(1, present=present, game=game)
    for guid in [0, 1, 0x8000000000000000, 0xffffffffffffffff]:
        for name in ['', 'Tester', '龍é', 'A' * 24, 'A' * 25, 'A' * 64, 'abc\0def']:
            check(guid, name, fixture=True)

    observations = []
    for path in sorted((WORK / 'rea-local-contracts').glob('0*.json')):
        evidence = json.loads(path.read_text()).get('response', {}).get('result', {}).get('structuredContent', {})
        if evidence.get('operation') not in ['procedure_info', 'procedure_pseudo_code']:
            continue
        assert evidence['subject']['digest']['sha256'] == target['sha256']
        observations.append(dict(operation=evidence['operation'], parameters=evidence['parameters'],
            evidence_id=evidence['evidence_id'], response_sha256=file_sha256(path)))
    assert len(observations) == 12
    spans = []
    for start, end in [(H, ENDS[H]), (S, ENDS[S])]:
        off = PE.rva_offset(start - PE.image_base)
        spans.append(dict(start=hex(start), end_exclusive=hex(end), sha256=hashlib.sha256(D[off:off+end-start]).hexdigest()))
    sources = ['crates/benilla-app/src/local_client/requests.rs',
        'crates/azeroth-survivors-re/src/gameplay/mod.rs',
        'crates/azeroth-survivors-re/src/gameplay/client/name_queries.rs',
        'crates/azeroth-survivors-re/src/gameplay/client/query_packets.rs',
        'crates/benilla-protocol/src/messages/parse.rs', 'crates/benilla-protocol/src/events/decode.rs']
    request, driver, name_source, wire = [(ROOT / p).read_text() for p in sources[:4]]
    assert 'ClientCommand::NameQuery { guid } => Some(LocalClientRequest::NameQuery { guid })' in request
    start = driver.index('fn resolved_requests(')
    assert driver.index('if let LocalClientRequest::NameQuery { guid }', start) < driver.index('if !active {', start)
    assert 'client::name_queries::name_query(guid, player)' in driver
    assert 'super::query_packets::decode(SessionEvent::PlayerName' in name_source
    assert 'guid: u64, player: &LocalPlayerUi' in name_source and 'guid == player.guid' not in name_source
    assert '(0x51, body)' in wire
    result = dict(schema_version=1, target=target, gap_ids=[41, 68],
        lead='Q41-M03-name-query-1458646d0', native_spans=spans,
        ghidra_observations=observations, native_cases=cases, result_sha256=digest.hexdigest(),
        fixtures=fixtures, source_hashes={p: file_sha256(ROOT / p) for p in sources},
        limits=['Local flag0 only; nonlocal lookup/party code is excluded and never entered.',
            'Synthetic character wrapper; allocation/growth/memcpy/sender intercepted. No Rust, OS, client/cache/VM, game or network execution.',
            'Wire projections are Python expectations; authored Rust regressions use the actual packet decoder but remain uncompiled/unrun.',
            'Bounded fallback echoes every requested GUID and uses the retained character independently of optional Game presence. Arbitrary mutation, aliases/scheduling and original/rebuilt parity remain unverified.',
            'Original census and Q41 selector counts remain unchanged.'])
    encoded = json.dumps(result, indent=2, ensure_ascii=False) + '\n'
    if args.stage:
        (WORK / 'name-queries.json').write_text(encoded)
    else:
        assert KEEP.read_text() == encoded
    print(json.dumps(dict(native_cases=cases, fixtures=len(fixtures), parity_verified=False)))


if __name__ == '__main__':
    main()
