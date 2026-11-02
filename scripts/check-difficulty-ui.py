#!/usr/bin/env python3
"""Verify the current Difficulty UI with original static instructions and data.

--write publishes compact evidence from retained journaled queries. This check
compiles no application and starts no game, client, network or server.
"""
import argparse
import gc
import hashlib
import json
from pathlib import Path
import re
import platform
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes, project_path
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script
from compact_evidence import proof_text

DEST = ROOT / 'docs/analysis/evidence/0.121.0/difficulty-ui'
WORK = ROOT / 'runtime/fixgap219/difficulty-ui'
GROUPS = {
    'runmods': [0x140288ed0, 0x140289500, 0x140289bc0],
    'page': [0x14014b510, 0x14014b7e0, 0x14014bce0],
    'rows': [0x140276280, 0x140276860, 0x140276f90, 0x140277e40, 0x140278430],
    'rank-row': [0x14014d0e0],
    'footer-affixes': [0x140126140, 0x14014a3b0],
    'formatter': [0x140277c10],
    'affix-labels': [0x145ababa0, 0x145ababe0],
}
SOURCES = [f'crates/azeroth-survivors-re/src/{name}.rs' for name in ['menu', 'run_options', 'picker']]
MENU_FRAGMENTS = {
    'rank-action-variant': r'Heroic\(u8\),',
    'rank-before-input': r'let heroic_before\s*=\s*state\.heroic_rank;',
    'rank-action-admission': r'Action::Heroic\(rank\)\s*=>\s*if\s*\*rank\s*<=\s*state\.max_heroic_rank\(\)\s*\{\s*state\.heroic_rank\s*=\s*\(\*rank\)\.min\(azeroth_survivors_re::heroic::MAX_RANK\);\s*\}',
    'rank-changed-pick': r'if state\.heroic_rank\s*!=\s*heroic_before\s*\{\s*state\.commit_pick\(&catalog\);\s*\}',
    'picker-rank-input': r'zone_visibility\.observe_content\(\s*crate::save::Pick\s*\{[\s\S]*?heroic_rank:\s*state\.heroic_rank,',
}
COLORS = [(0x1461ac070, 20), (0x1461abd20, 32), (0x1461ac0b4, 80), (0x1461ac2e0, 20),
          (0x1461ea964, 20), (0x1461e97d0, 64), (0x1461eaa7c, 60), (0x1461eb008, 8), (0x1461afc68, 240)]


def sha(value):
    return hashlib.sha256(value).hexdigest()


def receipt(path):
    return {'path': path.relative_to(ROOT).as_posix(), 'sha256': sha(path.read_bytes())}


def menu_fragment_bindings():
    source = (ROOT / SOURCES[0]).read_text()
    result = []
    for role, pattern in MENU_FRAGMENTS.items():
        matches = re.findall(pattern, source)
        assert len(matches) == 1, f'Expected one owned menu fragment: {role}'
        result.append(dict(path=SOURCES[0], role=role, sha256=sha(matches[0].encode())))
    return result


def native_result(path):
    raw = json.loads(path.read_text())
    return raw.get('structuredContent') or json.loads(raw['content'][0]['text'])


def build_manifest(target, image, pe):
    queries = []
    ranges = []
    for group, procedures in GROUPS.items():
        plan_path = WORK / group / 'plan.json'
        plan = json.loads(plan_path.read_text())
        journal_path = WORK / group / 'query/journal.json'
        journal = json.loads(journal_path.read_text())
        for procedure in procedures:
            operation = next(row for row in journal['operations'].values()
                if row['arguments'].get('procedure') == hex(procedure))
            assert operation['status'] == 'completed'
            result_path = project_path(operation['result']['path'])
            result = native_result(result_path)
            raw_input = ROOT / plan['target']
            start = int(plan['open_options']['entry_point'], 16)
            queries.append(dict(role=f'difficulty-{procedure:x}', procedure=hex(procedure),
                evidence_id=result['evidence_id'], provider=result['provider'],
                analysis_profile_digest=result['analysis_profile']['digest'],
                normalized_text_sha256=sha(result['normalized_result'].encode()),
                plan=receipt(plan_path), journal=receipt(journal_path), result=operation["result"],
                raw_input=receipt(raw_input), slice_virtual_address=hex(start)))
            native = next((s, e) for s, e, _ in pe.functions()
                          if pe.image_base + s == procedure)
            at = pe.rva_offset(native[0])
            ranges.append(dict(virtual_address=hex(procedure), file_offset=hex(at),
                byte_count=native[1] - native[0], sha256=sha(image[at:at + native[1] - native[0]])))
    data = []
    for address, length in COLORS:
        at = pe.rva_offset(address - pe.image_base)
        data.append(dict(virtual_address=hex(address), file_offset=hex(at), byte_count=length,
                         bytes_hex=image[at:at + length].hex(), sha256=sha(image[at:at + length])))
    prior = json.loads((DEST / 'manifest.json').read_text())
    assert prior['target'] == target
    locales = {'keys': prior['locale_keys'], 'locales': prior['locales']}
    return dict(schema_version=1, target=target, gap_ids=[219],
        bounded_contract_system_ids=['custom-app-screens-runmods', 'custom-app-screens-picker'],
        scope='Current six-rank Difficulty selection, rank persistence/labels, authored UI submissions and exact locale consumers; gameplay arithmetic/weekly seed production remain in their owning reports.',
        queries=queries, native_ranges=ranges, native_data=data,
        locale_keys=locales['keys'], locales=locales['locales'],
        source_bindings=[receipt(ROOT / name) for name in SOURCES[1:]],
        source_fragment_bindings=menu_fragment_bindings(),
        source_observations=[dict(**receipt(ROOT / SOURCES[0]),
            binding='Informational full-file hash; mandatory owned UI fragments are verified separately.')],
        script_bindings=[receipt(ROOT / name) for name in ['scripts/difficulty_ui_native.py', 'scripts/check-difficulty-ui.py']], target_executed=False)


def verify(proof, target, image, pe):
    assert proof['target'] == target and proof['target_executed'] is False
    for row in proof['native_ranges'] + proof['native_data']:
        at = pe.rva_offset(int(row['virtual_address'], 16) - pe.image_base)
        raw = image[at:at + row['byte_count']]
        assert at == int(row['file_offset'], 16) and sha(raw) == row['sha256']
        if 'bytes_hex' in row:
            assert raw.hex() == row['bytes_hex']
    native_twists = []
    for rank in range(5):
        at = pe.rva_offset(0x1461afc68 + rank * 48 - pe.image_base)
        fields = struct.unpack_from('<4Q', image, at)
        pair = []
        for pointer, length in zip(fields[::2], fields[1::2]):
            offset = pe.rva_offset(pointer - pe.image_base)
            pair.append(image[offset:offset + length].decode())
        native_twists.append(pair)
    heroic_source = (ROOT / 'crates/azeroth-survivors-re/src/heroic.rs').read_text()
    source_twists = [list(pair) for pair in re.findall(r'twists:\s*\[\s*"([^"\n]*)",\s*"([^"\n]*)",?\s*\]', heroic_source)]
    assert source_twists == native_twists, 'Live shared Heroic twist rows differ from native UI consumers'
    for query in proof['queries']:
        for key in ['plan', 'journal', 'result', 'raw_input']:
            row = query[key]
            assert sha(project_path(row['path']).read_bytes()) == row['sha256'], row['path']
        result = native_result(project_path(query['result']['path']))
        assert result['provider']['id'] == 'ghidra'
        assert sha(result['normalized_result'].encode()) == query['normalized_text_sha256']
        verify_native_query_subject(ROOT, result, query, target, image=image, pe=pe)
    for row in proof['script_bindings'] + proof['source_bindings']:
        assert sha(project_path(row['path']).read_bytes()) == row['sha256'], row['path']
    assert proof['source_fragment_bindings'] == menu_fragment_bindings()
    locale_values = 0
    for row in proof['locales']:
        at = int(row['descriptor_file_offset'], 16)
        assert pe.offset_va(at) == int(row['descriptor_address'], 16)
        assert image[at:at + 56].hex() == row['descriptor_hex']
        descriptor = struct.unpack_from('<6Q', image, at)
        assert descriptor[4] == int(row['payload_address'], 16) and descriptor[5] == row['payload_bytes']
        offset = pe.rva_offset(descriptor[4] - pe.image_base)
        raw = image[offset:offset + descriptor[5]]
        assert sha(raw) == row['payload_sha256']
        native = json.loads(raw)
        subset = {key: native[key] for key in proof['locale_keys']}
        assert sha(json.dumps(subset, sort_keys=True, ensure_ascii=False, separators=(',', ':')).encode()) == row['keys_sha256']
        source = json.loads((ROOT / f'crates/azeroth-survivors-re/assets/locales/{row["code"]}.json').read_text())
        assert all(source[key] == value for key, value in subset.items())
        locale_values += len(subset)
    return locale_values


def source_contracts():
    menu, ui, picker = [(ROOT / name).read_text() for name in SOURCES]
    assert 'Heroic(u8)' in menu and 'Action::Mod(' not in menu and 'Action::ResetMods' not in menu
    compact = re.sub(r'\s+', '', menu)
    assert 'Action::Heroic(rank)=>if*rank<=state.max_heroic_rank(){state.heroic_rank=(*rank).min(azeroth_survivors_re::heroic::MAX_RANK);}' in compact
    assert 'ifstate.heroic_rank!=heroic_before{state.commit_pick(&catalog);}' in compact
    assert 'heroic_rank: pick.heroic_rank' in picker and 'mods: pick.mods' not in picker
    assert 'crate::run_options::rank_name(state.heroic_rank, catalog)' in picker
    assert 'Color::srgb(1., 0.353, 0.235)' in picker
    for name in ['health_multiplier', 'damage_multiplier', 'marks_multiplier', 'reward_multiplier']:
        assert f'heroic::{name}(rank)' in ui
    for token in ['for rank in 0..=heroic::MAX_RANK', 'descriptor.twists', 'rank <= maximum',
                  'let reason = if maximum == 0',
                  'Vec2::new(860., 700.)', 'Val::Px(124.)', 'Val::Px(18.)', 'Val::Px(16.)',
                  'trim_end_matches', 'state.save_revision', 'heroic::zone_selector(', 'heroic::current_week()',
                  'for rank in 1..=heroic::MAX_RANK', 'seen[usize::from(id)]']:
        assert token in ui, token
    hosts = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin',
             ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    host = hosts.get((platform.system(), platform.machine()))
    assert host is not None, 'Configured Rust syntax parser unavailable on this host'
    parser = ROOT / '.tools/rust' / f'1.98.1-{host}' / 'bin/rustfmt'
    for source in [menu, ui, picker]:
        result = subprocess.run([str(parser), '--edition', '2024', '--emit', 'stdout',
            '--config', 'skip_children=true'], input=source, text=True,
            stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
        assert result.returncode == 0, result.stderr


def submissions():
    import difficulty_ui_native as native
    results = {}
    instructions = 0
    summaries = []
    for role, arguments in [('frame', {}), ('page', {}),
            ('page', dict(selected=5, maximum=0, normal=False, account=0)),
            ('page', dict(selected=3, maximum=2, normal=True, account=2))]:
        result = native.sample(role, **arguments)
        instructions += result['instructions']
        key = f'{role}-{len(summaries)}'
        results[key] = result
        summaries.append(dict(role=role, arguments=arguments, nodes=len(result['nodes']), texts=len(result['texts'])))
        if role == 'page':
            assert [row['rank'] for row in result['rows']] == list(range(6))
            maximum = arguments.get('maximum', 5)
            assert [row['lock'] == 0xffffffffffffffff for row in result['rows']] == [rank <= maximum for rank in range(6)]
        gc.collect()
    for rank in range(6):
        for locked, selected in [(False, True), (False, False), (True, False)]:
            result = native.sample('row', selected=rank, current=rank if selected else (rank + 1) % 6, locked=locked)
            instructions += result['instructions']
            summaries.append(dict(role='row', rank=rank, locked=locked, selected=selected,
                nodes=len(result['nodes']), text_sizes=[row['size'] for row in result['texts']]))
            root = result['nodes'][0]['node']
            assert root['padding'] == [[1, 12.], [1, 12.], [1, 7.], [1, 7.]]
            assert root['column_gap'] == [1, 14.] and root['border_radius'] == [[1, 6.]] * 4
            assert result['texts'][0]['size'] == 22.
            assert sum(row['site'] == '0x14014d9d4' for row in result['nodes']) == 5
            assert sum(row['site'] == '0x14014b9fb' for row in result['texts']) == (2 if rank == 0 else 4)
            if rank != 0:
                assert sum(row['site'] == '0x14014ea0e' for row in result['texts']) == (0 if locked else 2)
            if rank == 1 and not locked and selected:
                results['heroic-row'] = result
            if rank == 5 and locked:
                results['locked-row'] = result
            gc.collect()
        footer = native.sample('footer', selected=rank)
        instructions += footer['instructions']
        assert [row['size'] for row in footer['texts']] == [17., 12.]
        assert footer['keys'] == (['picker.run_options', 'picker.normal_difficulty'] if rank == 0 else ['picker.run_options'])
        summaries.append(dict(role='footer', rank=rank, keys=footer['keys'], text_sizes=[row['size'] for row in footer['texts']]))
        gc.collect()
    for selector in range(6):
        affixes = native.sample('affixes', affix_selector=selector)
        instructions += affixes['instructions']
        assert [row['from_rank'] for row in affixes['rows']] == [3, 5]
        assert len({row['affix'] for row in affixes['rows']}) == 2
        assert [row['size'] for row in affixes['texts']] == [17., 13., 12., 11., 13., 12., 11.]
        assert affixes['nodes'][0]['node']['padding'] == [[1, 12.], [1, 12.], [1, 8.], [1, 8.]]
        summaries.append(dict(role='affixes', selector=selector, rows=affixes['rows'], text_sizes=[row['size'] for row in affixes['texts']]))
        if selector == 0:
            results['weekly-affixes'] = affixes
        gc.collect()
    labels = [
        ('Bolstering', 'A death makes the enemies near it tougher and stronger, stacking.'),
        ('Sanguine', 'A slain elite leaves a pool that heals enemies standing in it.'),
        ('Explosive', 'Orbs come out of the horde: only direct hits hurt them, so kill them before they burst.'),
    ]
    for id, pair in enumerate(labels):
        for role, key in zip(['affix-name', 'affix-description'], pair):
            result = native.sample(role, selected=id)
            instructions += result['instructions']
            assert result['keys'] == [key]
            summaries.append(dict(role=role, id=id, key=key))
            gc.collect()
    frame = results['frame-0']['nodes'][0]
    assert frame['canvas'] == [860., 700., struct.unpack('<f', bytes.fromhex('3333b33f'))[0]]
    page = results['page-1']
    assert page['nodes'][0]['node']['padding'] == [[1, 28.], [1, 28.], [1, 18.], [1, 18.]]
    assert page['nodes'][0]['node']['row_gap'] == [1, 7.]
    assert [row['size'] for row in page['texts']] == [34., 15., 12.]
    return dict(cases=summaries, retained_submissions=results, instruction_steps=instructions,
        limits=['Original constructor instructions execute in Unicorn synthetic memory; this is static replay, not application execution.',
                'Allocation, UI submission, fonts, localization, generic number/string formatting and color conversion are declared seams.',
                'Scalar helper calls are fixed-value fixture seams for layout only; their values/actual gameplay consumers retain their independent owning proofs.',
                'Existing Bevy Node offsets are applied to current original submissions; no computed layout, fonts, GPU, input device or rendered comparison executes.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ['version', 'path', 'sha256', 'size_bytes']}
    assert target['version'] == '0.121.0'
    image = target_bytes(target)
    pe = load_script('difficulty_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    manifest = build_manifest(target, image, pe) if args.write else json.loads((DEST / 'manifest.json').read_text())
    locales = verify(manifest, target, image, pe)
    source_contracts()
    captured = submissions()
    result = dict(target=target, query_count=len(manifest['queries']), locale_values=locales,
        constructor_cases=sum(not row['role'].startswith('affix-') for row in captured['cases']),
        getter_cases=sum(row['role'].startswith('affix-') for row in captured['cases']), instruction_steps=captured['instruction_steps'],
        rust_syntax_files=3, compilation=False, application_execution=False, network_execution=False, parity=False)
    if args.write:
        DEST.mkdir(parents=True, exist_ok=True)
        for name, value in [('manifest.json', manifest), ('submissions.json', captured), ('static-check.json', result)]:
            (DEST / name).write_text(proof_text(value) + '\n')
    else:
        assert json.loads((DEST / 'submissions.json').read_text()) == captured
        assert json.loads((DEST / 'static-check.json').read_text()) == result
    print(f'Verified {result["constructor_cases"]} current UI constructor cases, {locales} locale values and three Rust syntax files; no build/game/network/server')


if __name__ == '__main__':
    main()
