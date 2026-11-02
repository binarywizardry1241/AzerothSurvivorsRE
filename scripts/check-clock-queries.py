#!/usr/bin/env python3
"""Current local QueryTime original-instruction checks; no Windows/game calls."""
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, file_sha256
from creature_query_native import PE, D, ENDS
from clock_query_native import ClockProbe, H, NOW, DIFF

WORK = ROOT / 'runtime/q41-all-0.113.2'
KEEP = ROOT / 'docs/analysis/evidence/0.113.2/clock-queries.json'
EPOCH = 116_444_736_000_000_000
TICKS = 10_000_000


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    args = ap.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    probe, digest, count, fixtures = ClockProbe(), hashlib.sha256(), 0, []

    def check(ticks, game=True, payload=b'', fixture=False):
        nonlocal count
        opcode, body = probe.query(ticks, game, payload)
        seconds = 0 if ticks < EPOCH or ticks >= 1 << 63 else ((ticks-EPOCH) // TICKS) & 0xffffffff
        assert opcode == 0x1cf and body == struct.pack('<I', seconds)
        row = [ticks, game, payload.hex(), body.hex()]
        digest.update((json.dumps(row, separators=(',', ':')) + '\n').encode())
        count += 1
        if fixture:
            fixtures.append(dict(ticks=ticks, unix_time=seconds, packet_hex=body.hex()))

    for game in [False, True]:
        for seconds in range(65536):
            check(EPOCH + seconds*TICKS + 9_999_999, game)
        print('all65536 whole-second samples pass; optional Game:', game, flush=True)
    boundaries = [0, EPOCH-10_000_001, EPOCH-1, EPOCH, EPOCH+1, EPOCH+TICKS-1,
        EPOCH+TICKS, EPOCH+(2**32-1)*TICKS, EPOCH+2**32*TICKS,
        EPOCH+(2**32+1)*TICKS, EPOCH+1_760_000_000*TICKS+1,
        2**63-1, 2**63, 2**64-1]
    for ticks in boundaries:
        check(ticks, fixture=True)
        check(ticks, game=False)
    for length in range(17):
        check(EPOCH+123*TICKS, payload=bytes(range(length)))

    observations = []
    for path in sorted((WORK / 'rea-clock-contract').glob('0*.json')):
        e = json.loads(path.read_text()).get('response', {}).get('result', {}).get('structuredContent', {})
        if e.get('operation') not in ['procedure_info', 'procedure_pseudo_code']:
            continue
        assert e['subject']['digest']['sha256'] == target['sha256']
        observations.append(dict(operation=e['operation'], parameters=e['parameters'],
            evidence_id=e['evidence_id'], response_sha256=file_sha256(path)))
    assert len(observations) == 6
    spans = []
    for a, b in [(H, ENDS[H]), (DIFF, NOW), (NOW, NOW+0x28)]:
        offset = PE.rva_offset(a-PE.image_base)
        spans.append(dict(start=hex(a), end_exclusive=hex(b), sha256=hashlib.sha256(D[offset:offset+b-a]).hexdigest()))
    imported = []
    for record in PE.imports():
        base = int(record['iat_start_address'], 16)
        if base <= 0x145e9d060 < base+8*len(record['functions']):
            imported.append([record['library'], record['functions'][(0x145e9d060-base)//8]])
    assert imported == [['KERNEL32.dll', 'GetSystemTimePreciseAsFileTime']]
    source_paths = ['crates/benilla-app/src/local_client/requests.rs',
        'crates/azeroth-survivors-re/src/gameplay/mod.rs',
        'crates/azeroth-survivors-re/src/gameplay/client/clock_queries.rs',
        'crates/azeroth-survivors-re/src/gameplay/client/query_packets.rs',
        'crates/benilla-protocol/src/messages/parse.rs', 'crates/benilla-protocol/src/events/decode.rs',
        'crates/benilla-app/src/net/session.rs', 'crates/benilla-app/src/ui_quest_log.rs']
    request, driver, clock, packet, parser, decoder, consumer, ui = [(ROOT/p).read_text() for p in source_paths]
    assert 'ClientCommand::QueryTime => Some(LocalClientRequest::QueryTime)' in request
    start = driver.index('fn resolved_requests(')
    assert driver.index('if matches!(request, LocalClientRequest::QueryTime)', start) < driver.index('if !active {', start)
    assert 'client::clock_queries::query_time()' in driver
    assert 'query_at(SystemTime::now())' in clock
    assert 'now.duration_since(UNIX_EPOCH).map_or(0, |d| d.as_secs() as u32)' in clock
    assert 'super::query_packets::decode(SessionEvent::ServerUnixTime { unix_time })' in clock
    assert '(0x1cf, unix_time.to_le_bytes().to_vec())' in packet
    assert 'opcode::SMSG_QUERY_TIME_RESPONSE' in parser and 'SessionEvent::ServerUnixTime { unix_time }' in decoder
    assert 'clock.sample(unix_time, local);' in consumer and 'script.quest_log_clock_synced();' in ui
    result = dict(schema_version=1, target={k:target[k] for k in ['version','path','sha256','size_bytes']},
        gap_ids=[41,69], lead='Q41-M03-clock-query-1458646d0', native_spans=spans,
        ghidra_observations=observations, native_cases=count, result_sha256=digest.hexdigest(), fixtures=fixtures,
        clock_boundary=dict(address=hex(NOW), return_fields='EAX low DWORD / EDX high DWORD',
            iat_slot='0x145e9d060', imported=imported[0], epoch_filetime_ticks=EPOCH),
        source_hashes={p:file_sha256(ROOT/p) for p in source_paths}, limits=[
            'Local-channel dispatcher and native signed FILETIME duration conversion execute with a synthetic OS-time result. Actual Windows API, allocator/growth and sender are intercepted.',
            'The host getter returns low/high DWORDs through EAX/EDX. Headerless Ghidra pseudocode loses the high return; assembly and the actual caller control this ABI interpretation.',
            'Native bit63-set FILETIME cases are negative/error in the selected signed representation. Rust fixtures skip constructing those invalid Windows SystemTime instances; actual portable SystemTime, OS/platform range and clock accuracy remain unverified.',
            'All65536 u16 whole seconds in both optional-Game states, fraction/epoch/u32/sign boundaries and ignored payload sizes are bounded cases, not all64-bit host states.',
            'Four Rust regressions are authored/uncompiled/unrun. No reconstructed source/client/VM, Windows API, network, game or original/rebuilt parity executes.',
            'The existing engine packet decoder, wall-clock sampler and Lua synchronization consumers are reused; no run-clock, generic time subsystem or multiplayer implementation. Original census/queue counts unchanged.'])
    encoded = json.dumps(result, indent=2) + '\n'
    if args.stage:
        (WORK/'clock-queries.json').write_text(encoded)
    else:
        assert KEEP.read_text() == encoded
    print(json.dumps(dict(native_cases=count, wire_fixtures=len(fixtures), parity_verified=False)))


if __name__ == '__main__':
    main()
