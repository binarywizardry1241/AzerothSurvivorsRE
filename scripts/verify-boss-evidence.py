#!/usr/bin/env python3
"""Hash/check retained boss evidence; never compile or launch either game."""
from pathlib import Path
import hashlib
import json
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'docs/analysis/evidence/0.97.2/bosses'
FIXTURES = ROOT / 'crates/azeroth-survivors-re/tests/fixtures'
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'


def main():
    data = (ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    subprocess.run([sys.executable, 'scripts/recover-boss-point-data.py', '--check'], cwd=ROOT, check=True)
    spans = set()
    evidence_ids = set()
    assembly_checks = set()

    def visit(value):
        if isinstance(value, dict):
            if all(k in value for k in ('file_offset', 'byte_count', 'sha256')):
                offset = value['file_offset']
                offset = int(offset, 16) if isinstance(offset, str) else offset
                count = value['byte_count']
                assert hashlib.sha256(data[offset:offset+count]).hexdigest() == value['sha256'], value
                spans.add((offset, count, value['sha256']))
            if all(k in value for k in ('assembly', 'assembly_sha256')):
                path = OUT / value['assembly']
                assert hashlib.sha256(path.read_bytes()).hexdigest() == value['assembly_sha256'], path
                assembly_checks.add(path)
            if 'evidence_id' in value:
                evidence_ids.add(value['evidence_id'])
            for child in value.values():
                visit(child)
        elif isinstance(value, list):
            for child in value:
                visit(child)

    json_files = sorted(p for p in OUT.glob('*.json') if p.name != 'source-validation.json')
    for path in json_files:
        value = json.loads(path.read_text())
        assert value['target_sha256'] == SHA, path
        visit(value)

    groups = {
        'spawning': (FIXTURES / 'boss-spawning-native.json', ['schedule', 'point_filters', 'farthest_comparisons', 'point_draws']),
        'scaling': (FIXTURES / 'boss-scaling-native.json', ['creation_cases']),
        'ai': (FIXTURES / 'boss-ai-native.json', ['enrage_cases', 'timer_cases', 'damage_cases', 'speed_cases']),
        'abilities': (OUT / 'abilities-fixtures.json', ['lookups', 'charge_duration', 'charge_clip', 'minion_indices', 'area_range', 'missile_draws']),
        'death': (FIXTURES / 'boss-death-native.json', ['death_cases', 'completion_cases', 'meter_cases']),
    }
    counts = {}
    for name, (path, keys) in groups.items():
        value = json.loads(path.read_text())
        assert value['target_sha256'] == SHA, path
        counts[name] = {key: len(value[key]) for key in keys}
        if name == 'death':
            assert len(value['attraction']['pickups']) == 7
            counts[name]['attraction_pickup_rows'] = len(value['attraction']['pickups'])
        visit(value)
    total = sum(sum(group.values()) for group in counts.values())
    docs = sorted((ROOT / 'docs/analysis').glob('boss*-0.97.2.md'))
    links = 0
    for path in docs:
        for target in re.findall(r'\]\(([^)]+)\)', path.read_text()):
            if '://' in target or target.startswith('#'):
                continue
            resolved = (path.parent / target.split('#', 1)[0]).resolve()
            assert resolved.is_relative_to(ROOT), (path, target)
            assert resolved.exists() or resolved == OUT / 'source-validation.json', (path, target)
            links += 1

    paths = set(json_files) | set(OUT.glob('*.asm')) | set(OUT.glob('*.c')) | set(docs)
    paths.update((ROOT / 'crates/azeroth-survivors-re/src/bosses').glob('*.rs'))
    paths.update((ROOT / 'crates/azeroth-survivors-re/tests').glob('boss_*.rs'))
    paths.update(FIXTURES.glob('boss-*.json'))
    paths.update((ROOT / 'scripts').glob('*boss*.py'))
    paths.update(ROOT / path for path in [
        'crates/azeroth-survivors-re/src/enemies/ai.rs',
        'crates/azeroth-survivors-re/src/enemies/spawning.rs',
        'crates/azeroth-survivors-re/src/guardians/catalog.rs',
        'crates/azeroth-survivors-re/src/lib.rs',
        'crates/azeroth-survivors-re/Cargo.toml',
    ])
    artifacts = [dict(path=str(p.relative_to(ROOT)), bytes=p.stat().st_size,
        sha256=hashlib.sha256(p.read_bytes()).hexdigest()) for p in sorted(paths)]
    report = dict(date='2026-10-18', target_version='0.97.2', target_sha256=SHA,
        target_executed_as_application=False, source_compiled=False, rust_tests_run=False,
        checks=dict(target_identity='passed', catalog_regeneration='passed: 60 bosses / 191 abilities / 12 zones / 10 fixed points',
            unique_native_byte_spans=dict(status='passed', count=len(spans)),
            retained_assembly_digests=dict(status='passed', count=len(assembly_checks)),
            local_report_links=dict(status='passed', count=links),
            native_cases=counts, total_native_cases=total,
            native_oracle_generation='Completed by recovery scripts, with unchanged instructions and documented external seams; no application launch',
            source_review='Independent static review of catalog/placement, actor stage, deferred dispatch and ability interfaces; no compiler checks',
            rust_compilation='intentionally not run', rust_tests='authored; intentionally not run',
            original_rebuilt_launch='not run', runtime_parity='not established'),
        rea=dict(provider='Ghidra', launcher='./scripts/rea via scripts/rea-batch.py',
            evidence_ids=sorted(evidence_ids), opened_sessions='exported and closed',
            limits='Function and branch slices have documented outside-code/data seams. Win64 instructions and selected PE constants govern; Ghidra output is not original source.'),
        incomplete=['Real world/terrain/path/entity/packet/player-damage/account adapters',
            'Integration with the shared active-run frame, aura/proc and other effect queues',
            'Windows CRT math equivalence, rendered behavior and original/rebuilt runtime parity',
            'Rust compilation and test execution await explicit resumption'],
        delivery='Local source/evidence commit; no push under active menu-parity restriction.', artifacts=artifacts)
    (OUT / 'source-validation.json').write_text(json.dumps(report, indent=2) + '\n')
    print(f'Passed: {len(spans)} unique byte spans, {len(assembly_checks)} assembly digests, {links} links, {len(evidence_ids)} REA records, {total} native cases, {len(artifacts)} artifacts. No compilation/Rust tests/game launch.')


if __name__ == '__main__':
    main()
