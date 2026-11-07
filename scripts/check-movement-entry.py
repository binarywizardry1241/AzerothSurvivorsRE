#!/usr/bin/env python3
"""Verify current corrected-report start delivery; no compiler or game runs."""
import argparse
import hashlib
import json
from pathlib import Path

from coverage_common import ROOT, latest_target, file_sha256, json_text
from movement_entry_native import MovementEntry, FIRST, LAST, BEGIN, PHASE_STOP, D, PE, f32

OUT = ROOT / 'docs/analysis/evidence/movement-entry'
WORK = ROOT / 'runtime/analysis/history/findings/q41-movement-entry/69454deae884'


def record(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    args = ap.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    import sys
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/camera/python-libs'))
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)

    def raw(a, b):
        at = PE.rva_offset(a - PE.image_base)
        return D[at:at+b-a]

    ranges = [(FIRST, LAST), (BEGIN, PHASE_STOP)]
    native = [dict(start=hex(a), end_exclusive=hex(b), byte_count=b-a,
                   sha256=hashlib.sha256(raw(a, b)).hexdigest()) for a, b in ranges]
    asm = ''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}\n'
                  for a, b in [(0x1458fddc7, 0x1458fde34), (0x14590b5c4, PHASE_STOP)]
                  for i in decoder.disasm(raw(a, b), a))
    p = MovementEntry()
    origin = [-9396., -633., 0.]
    inputs = [(origin, [-9395., -633., 0.]), (origin, [-9395., -633., -100.]),
              (origin, [-9396., -633., -100.]), (origin, [-9200., -633., 0.]),
              ([-9270., -633., 0.5], [-9200., -633., 0.]), (origin, origin)]
    cases = []
    for phase in [0, 1, 2, 3, 4, 5, 6, 255]:
        for pending in [0, 1, 2, 255]:
            for index in [0, 1, 0xffffffffffffffff]:
                for old, reported in inputs:
                    result = p.run(old, reported, phase, pending, index)
                    final = result['final']
                    dx, dy = f32(old[0]-final[0]), f32(old[1]-final[1])
                    distance = f32(f32(dx*dx)+f32(dy*dy))
                    begins = phase == 0 and distance > f32(0.04) and pending == 0 and index == 0
                    assert result['begins'] == int(begins)
                    assert result['final_phase'] == (1 if begins else phase)
                    assert result['pending_reports'] == (12 if result['corrected'] else 0)
                    if result['corrected']:
                        assert result['corrected'] == final and final[2] == 0.5
                    cases.append(result)
    # The ignored prefix must not publish a pose, correction, or begin request.
    ignored = []
    for left in range(13):
        for separation in [3., 10.]:
            reported = [-9395., -633., 0.]
            result = p.run(origin, reported, expected=[reported[0]+separation, -633., 0.], reports_left=left)
            skip = separation > 3 and left != 0
            assert result['final'] == (origin if skip else reported)
            assert result['begins'] == (0 if skip else 1)
            assert result['corrected'] is None
            assert result['pending_reports'] == (left-1 if skip else left)
            ignored.append(dict(reports_left=left, separation=separation, result=result))
    for phase in range(256):
        p.begin_phase(phase)
    source = ROOT / 'crates/azeroth-survivors-re/src/gameplay/mod.rs'
    text = source.read_text()
    tick = text.split('fn tick(', 1)[1].split('fn account_delivery', 1)[0]
    assert 'commit_movement_report(&mut session, report.position_wow, report.facing, admission);' in tick
    commit = text.split('fn commit_movement_report(', 1)[1].split('fn movement_begins(', 1)[0]
    assert 'Admission::Ignored => return' in commit
    assert 'session.mechanics.as_mut().unwrap().relocate_player(position, facing);' in commit
    assert commit.index('Admission::Corrected(position)') < commit.index('session.accepted_position.replace(position)') < commit.index('movement_begins(previous, position)')
    assert 'last_reported_position' not in text
    assert 'correction_commits_its_position_and_teleport_before_starting_the_run' in text
    observations = []
    for path in [ROOT/'runtime/analysis/history/findings/q41-local-movement/0c550a598fd4/rea/003-procedure_info-1458fd2b0.json',
                 ROOT/'runtime/analysis/history/findings/q41-local-begin/87c7d513caa2/rea/003-procedure_info.json']:
        evidence = json.loads(path.read_text())['response']['result']['structuredContent']
        observation = {k: evidence[k] for k in ['evidence_id', 'provider', 'operation', 'parameters', 'normalized_result']}
        profile = evidence['analysis_profile']
        seed = profile['parameters']['analysis_seeds']
        seed_path = Path(seed['path'])
        assert file_sha256(seed_path) == seed['sha256']
        observation['recorded_profile_digest'] = profile['digest']
        observation['analysis_settings'] = dict(
            disabled_analyzers=profile['parameters']['analysis_options']['disabled_analyzers'],
            seed_input=record(seed_path), seed_format=seed['format'],
            seed_entries=seed['entries'])
        observation['limitations_workspace_paths_normalized'] = [
            value.replace(str(ROOT) + '/', '') for value in evidence['limitations']]
        observations.append(observation)
    proof = dict(schema_version=1, target={k:target[k] for k in ['version','path','sha256','size_bytes']},
                 gap_ids=[38,41], lead_ids=['Q41-S01','Q41-M03'], native_ranges=native,
                 source=record(source), checker=record(Path(__file__).resolve()),
                 probe=record(ROOT/'scripts/movement_entry_native.py'), ghidra=observations,
                 movement_cases=len(cases), ignored_prefix_cases=len(ignored), begin_phase_cases=256,
                 results_sha256=hashlib.sha256(json_text([cases,ignored]).encode()).hexdigest(),
                 regression_witness=cases[1],
                 limits=['Only current Elwynn local report instructions execute with supplied primary height0, hypotf, opaque corrective/notice packets and Begin phase-store seams.',
                         'Other phase/pending/index values classify gates only, not co-op behavior or a complete source state machine.',
                         'The actual Begin prefix is independently replayed through its phase store for all256 byte values. Its actor/RNG/stat/publication tail does not execute.',
                         'Source checks establish connectivity, not Rust execution. Two Rust regressions are authored/uncompiled/unrun; no real terrain/controller/ECS/game or original/rebuilt parity.'])
    if args.stage:
        staged = WORK/'staged'
        staged.mkdir(exist_ok=True)
        (staged/'contract.json').write_text(json_text(proof))
        (staged/'movement-entry.asm').write_text(asm)
    else:
        assert proof == json.loads((OUT/'contract.json').read_text())
        assert asm == (OUT/'movement-entry.asm').read_text()
    print(f"Movement entry: {len(cases)} full report + {len(ignored)} pending-prefix +256 Begin-phase cases pass; source guards pass. No Rust/game/parity execution.")


if __name__ == '__main__':
    main()
