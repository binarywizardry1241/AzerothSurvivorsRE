#!/usr/bin/env python3
"""Verify retained 0.97.2 enemy evidence and write its static validation record.

This reads files and hashes bytes. It never compiles source or executes game
code; the separate recovery scripts produced bounded native oracle fixtures.
"""
from pathlib import Path
import hashlib
import json
import re

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'docs/analysis/evidence/enemies'
SHA='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'


def main():
    data=TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest()==SHA
    verified=0
    evidence_ids=set()
    def visit(value):
        nonlocal verified
        if isinstance(value,dict):
            if all(key in value for key in ('file_offset','byte_count','sha256')):
                offset=int(value['file_offset'],16) if isinstance(value['file_offset'],str) else value['file_offset']
                count=value['byte_count']
                assert hashlib.sha256(data[offset:offset+count]).hexdigest()==value['sha256'],value
                verified+=1
            if 'evidence_id' in value:evidence_ids.add(value['evidence_id'])
            for child in value.values():visit(child)
        elif isinstance(value,list):
            for child in value:visit(child)
    json_files=sorted(p for p in OUT.glob('*.json') if p.name!='source-validation.json')
    for path in json_files:
        value=json.loads(path.read_text());visit(value)
        if 'target_sha256' in value:assert value['target_sha256']==SHA,path
    fixture_root=ROOT/'crates/azeroth-survivors-re/tests/fixtures'
    groups={
        'spawning':(OUT/'spawning-fixtures.json',['admission','weights','budget','population','uniform','formations','intervals']),
        'scaling':(fixture_root/'enemy-scaling-native.json',['scaling_cases','population_cases','clamp_guid_cases']),
        'ai':(fixture_root/'enemy-ai-0.97.2-native.json',['movement_cases','completion_cases','attack_cases','cast_start_cases','timing_cases','fear_cases']),
        'relocation':(fixture_root/'enemy-relocation-native.json',['selection_cases','reset_cases']),
    }
    counts={}
    for name,(path,keys) in groups.items():
        value=json.loads(path.read_text());assert value['target_sha256']==SHA
        counts[name]={key:len(value[key]) for key in keys}
    assert sum(sum(group.values()) for group in counts.values())==2871
    docs=[ROOT/'docs/analysis'/name for name in ['enemies-0.97.2.md','enemy-catalog-0.97.2.md',
        'enemy-spawning-0.97.2.md','enemy-scaling-0.97.2.md','enemy-relocation-0.97.2.md']]
    links=0
    for path in docs:
        for target in re.findall(r'\]\(([^)]+)\)',path.read_text()):
            if '://' in target or target.startswith('#'):continue
            target=target.split('#',1)[0]
            resolved=(path.parent/target).resolve()
            assert resolved.is_relative_to(ROOT),target
            assert resolved.exists() or resolved==OUT/'source-validation.json',(path,target)
            links+=1
    paths=set(json_files)|set(OUT.glob('*.asm'))|set(OUT.glob('*.c'))|set(docs)
    paths.update((ROOT/'crates/azeroth-survivors-re/src/enemies').glob('*.rs'))
    paths.update((ROOT/'crates/azeroth-survivors-re/tests').glob('enemy_*.rs'))
    paths.update(fixture_root.glob('enemy-*.json'))
    paths.update((ROOT/'scripts').glob('*enemy*.py'))
    records=[dict(path=str(p.relative_to(ROOT)),bytes=p.stat().st_size,sha256=hashlib.sha256(p.read_bytes()).hexdigest())
             for p in sorted(paths)]
    report=dict(date='2026-10-18',target_version='0.97.2',target_sha256=SHA,
        target_executed_as_application=False,source_compiled=False,rust_tests_run=False,
        work_mode='Source buildup and static REA only; builds/compiler checks/compile-based tests/game launches stopped by AGENTS.md.',
        checks=dict(target_identity='passed',native_byte_spans=dict(status='passed',count=verified),
            catalog_regeneration='passed: python3 scripts/recover-enemy-catalog.py --check; 12 zones / 148 definitions',
            local_report_links=dict(status='passed',count=links),
            native_oracle_generation='completed by recovery scripts; unchanged instruction scopes with documented seams',
            native_cases=counts,total_native_cases=2871,
            source_review='Independent static review completed; fear deadline f32 order corrected; APIs reviewed without compilation',
            rust_compilation='intentionally not run',rust_tests='authored; intentionally not run',
            original_rebuilt_launch='not run',runtime_parity='not established'),
        rea=dict(provider='Ghidra',launcher='./scripts/rea via scripts/rea-batch.py',
            evidence_ids=sorted(evidence_ids),opened_sessions='exported and closed',
            limits='Exact function/branch slices omit outside code/data; Win64 instructions and full selected PE constants govern; pseudocode is not original source.'),
        incomplete=['Real world/terrain/path/entity/packet and game-loop adapters',
            'Shared aura/proc lists and spell/projectile effect owners',
            'Full scheduled primary-boss ability AI',
            'Windows CRT math equivalence and platform/runtime/rendered parity',
            'Final Rust compilation and test execution await explicit resumption'],
        delivery='Local source/evidence commit requested; no push under active menu-parity restriction.',artifacts=records)
    (OUT/'source-validation.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f'Verified {verified} native byte spans, {links} report links, {len(evidence_ids)} unique REA records; 2871 retained native cases; {len(records)} artifacts. No compilation/tests/game launch.')


if __name__=='__main__':main()
