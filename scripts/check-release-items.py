#!/usr/bin/env python3
"""Verify release records, historical source and current owning-proof links.

This read-only check never refreshes receipts. The initial source snapshot is
verified from Git independently of current source. --allow-pending checks a
draft without reporting final source validation. Owning checkers, compilers,
applications, networks and servers are not launched by this accounting check.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import subprocess
import sys

sys.dont_write_bytecode = True
from coverage_common import ROOT, latest_target, target_bytes

PROOF = ROOT / 'docs/analysis/evidence/0.121.0/release-items.json'
INITIAL_COMMIT = '1f5b24900d29bd4afcd33a2c09c1e5f392ef82fc'
INITIAL_FIELDS = ('source_refs', 'status', 'investigation', 'next_static_step')
CURRENT_STATUSES = {'source_static_connected', 'source_connected_static_partial',
                    'aggregate_of_linked_items'}
PROOF_ROLES = {'native_contract', 'native_and_source_static', 'source_static',
               'localization_contract', 'resource_contract'}


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def local_path(name):
    path = Path(name)
    assert not path.is_absolute() and '..' not in path.parts, f'nonportable project path: {name}'
    return ROOT / path


def git_bytes(commit, path):
    return subprocess.run(['git', 'show', f'{commit}:{path}'], cwd=ROOT,
                          check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout


def pointer(value, path):
    assert path.startswith('/'), f'invalid proof selector: {path}'
    for field in path[1:].split('/'):
        field = field.replace('~1', '/').replace('~0', '~')
        value = value[int(field)] if isinstance(value, list) else value[field]
    return value


def initial_review(proof):
    initial = proof['initial_source_review']
    assert initial['commit'] == INITIAL_COMMIT
    assert re.fullmatch(r'[0-9a-f]{40}', initial['commit'])
    historical = json.loads(git_bytes(initial['commit'], PROOF.relative_to(ROOT).as_posix()))
    assert historical['target'] == proof['target']
    assert len(initial['source_sha256']) == 37
    assert initial['source_sha256'] == historical['source_sha256'], 'initial source receipts changed'
    for path, expected in initial['source_sha256'].items():
        local_path(path)
        assert digest(git_bytes(initial['commit'], path)) == expected, f'initial source drift: {path}'
    assert proof['literals'] == historical['literals'], 'retained native literals changed'
    for item, old in zip(proof['items'], historical['items']):
        assert item['gap_id'] == old['gap_id']
        assert item['initial_review'] == {key: old[key] for key in INITIAL_FIELDS}
        for key in ('native_literal_selectors', 'native_diagnostic_leads'):
            assert item[key] == old[key], f'retained navigation changed: #{item["gap_id"]}'
    return len(initial['source_sha256'])


def owner_proofs(proof, selected, sealed):
    catalog = proof['owning_proofs']
    current = proof['current_source_review']
    used = {name for item in proof['items'] for name in item['current_review']['proof_refs']}
    assert used == set(catalog), 'unused or unknown owning proof reference'
    missing = []
    available = {}
    for name, row in catalog.items():
        assert row['role'] in PROOF_ROLES and row['scope']
        assert row['path'].startswith('docs/analysis/evidence/0.121.0/')
        path = local_path(row['path'])
        if not path.exists():
            assert not sealed and row.get('pending_delivery') is True, f'missing owning proof: {name}'
            missing.append(name)
            continue
        value = json.loads(path.read_text())
        target = value.get('target')
        if isinstance(target, dict):
            assert target['sha256'] == selected['sha256'], f'owning proof target drift: {name}'
            for field in ('version', 'path', 'size_bytes'):
                if field in target:
                    assert target[field] == selected[field], f'owning proof {field} drift: {name}'
        else:
            assert value['target_sha256'] == selected['sha256'], f'owning proof target drift: {name}'
        assert row['required_fields'], f'proof has no declared contract selectors: {name}'
        for selector in row['required_fields']:
            selected_value = pointer(value, selector)
            assert selected_value is not None, f'missing proof contract: {name}{selector}'
            if isinstance(selected_value, (str, list, dict)):
                assert selected_value, f'empty proof contract: {name}{selector}'
        for selector, expected in row.get('expected_values', {}).items():
            assert pointer(value, selector) == expected, f'owning proof observation drift: {name}{selector}'
        if sealed:
            assert not row.get('pending_delivery', False), f'unreviewed delivered proof: {name}'
            assert digest(path.read_bytes()) == current['proof_sha256'][name], f'owning proof receipt drift: {name}'
        available[name] = value
    if sealed:
        assert set(current['proof_sha256']) == set(catalog), 'current proof receipt domain drift'
    return available, missing


def current_review(proof, selected, allow_pending):
    current = proof['current_source_review']
    assert current['state'] in ('awaiting_source_freeze', 'sealed')
    sealed = current['state'] == 'sealed'
    assert sealed or allow_pending, 'current review awaits source freeze; --allow-pending checks only the draft'
    assert current['executable_semantic_completeness'] is False
    assert current['compilation'] == current['runtime'] == 'not_run' and current['parity'] == 'unverified'
    source_paths = set()
    for item in proof['items']:
        review = item['current_review']
        assert review['scope'] and review['proof_refs'] and review['source_refs'] and review['limits']
        assert len(set(review['proof_refs'])) == len(review['proof_refs'])
        assert len(set(review['source_refs'])) == len(review['source_refs'])
        assert local_path(review['report']).is_file(), f'missing owning report: #{item["gap_id"]}'
        assert isinstance(review['remaining_static'], list) and isinstance(review['dependencies'], list)
        for dependency in review['dependencies']:
            assert isinstance(dependency['gap_id'], int) and dependency['gap_id'] > 0
            assert dependency['gap_id'] != item['gap_id'] and dependency['scope']
            assert dependency['status'] in ('open', 'connected', 'pending_review')
        for path in review['source_refs']:
            assert path.startswith('crates/') and local_path(path).is_file(), f'missing current source: {path}'
            source_paths.add(path)
        assert review['static_checks'], f'missing owning check records: #{item["gap_id"]}'
        for check in review['static_checks']:
            assert check['scope'] and check['status'] in ('pending_final_review', 'recorded_pass')
            assert check['argv'][:2] == ['python3', '-B']
            assert local_path(check['argv'][2]).is_file()
            assert check['argv'][2].startswith('scripts/check-')
            assert not any(arg.startswith(('--write', '--apply', '--stage')) for arg in check['argv'][3:])
            assert check['proof_refs'] and set(check['proof_refs']) <= set(review['proof_refs'])
            if sealed:
                assert check['status'] == 'recorded_pass', f'unreviewed owning check: #{item["gap_id"]}'
        if sealed:
            assert review['status'] in CURRENT_STATUSES, f'unreviewed final item: #{item["gap_id"]}'
            assert review['source_status'] in ('implemented', 'partial', 'aggregate')
            assert review['static_status'] in ('bounded_contracts_and_source_checked',
                'bounded_contracts_checked_source_partial',
                'bounded_contracts_checked_external_input_partial', 'aggregate')
            if review['status'] == 'source_static_connected':
                assert review['source_status'] == 'implemented'
                assert review['static_status'] == 'bounded_contracts_and_source_checked'
            if review['status'] == 'aggregate_of_linked_items':
                assert item['gap_id'] == 218 and review['source_status'] == review['static_status'] == 'aggregate'
            if review['status'] == 'source_connected_static_partial':
                assert review['remaining_static'] or any(row['status'] != 'connected' for row in review['dependencies'])
        else:
            assert review['status'] == review['source_status'] == review['static_status'] == 'pending_source_freeze'
    available, missing = owner_proofs(proof, selected, sealed)
    if sealed:
        assert re.fullmatch(r'[0-9a-f]{40}', current['source_commit'])
        commands = {tuple(row['argv']) for item in proof['items']
                    for row in item['current_review']['static_checks']}
        assert len(commands) == current['static_checker_count']
        assert set(current['source_sha256']) == source_paths, 'current source receipt domain drift'
        for path, expected in current['source_sha256'].items():
            assert digest(git_bytes(current['source_commit'], path)) == expected, f'current Git source receipt drift: {path}'
            assert digest(local_path(path).read_bytes()) == expected, f'current source receipt drift: {path}'
    else:
        assert not current['source_sha256'] and not current['proof_sha256'], 'draft must not seal moving source/proof receipts'
    return sealed, len(source_paths), len(available), missing


def native_navigation(proof, selected, data, pe):
    literals = {row['literal']: row for row in proof['literals']}
    assert len(literals) == len(proof['literals'])
    occurrences = 0
    for text, row in literals.items():
        raw = text.encode()
        assert len(raw) == row['byte_count'] and digest(raw) == row['sha256']
        actual = []
        cursor = 0
        while (cursor := data.find(raw, cursor)) != -1:
            address = pe.offset_va(cursor)
            actual.append({'file_offset': hex(cursor), 'virtual_address': hex(address) if address is not None else None})
            cursor += len(raw)
        assert actual == row['matches'], f'literal occurrences drift: {text}'
        occurrences += len(actual)
    diagnostics = json.loads((ROOT / f"runtime/coverage/{selected['sha256']}/diagnostic-ownership.json").read_text())
    assert diagnostics['target']['sha256'] == selected['sha256']
    current = {row['path']: row for row in diagnostics['diagnostics']}
    checked = set()
    for item in proof['items']:
        assert all(term in literals for term in item['native_literal_selectors'])
        for lead in item['native_diagnostic_leads']:
            row = current[lead['path']]
            assert lead['path_occurrence'] == row['diagnostic_occurrences'][0]
            assert lead['verified_reference_count'] == len(row['verified_references'])
            for candidate in lead['candidate_owners']:
                assert any(all(ref.get(key) == value for key, value in candidate.items()) for ref in row['verified_references']), f"diagnostic selector drift: {lead['path']}"
                address = int(candidate['instruction_address'], 16)
                original = bytes.fromhex(candidate['instruction_bytes'])
                offset = pe.rva_offset(address - pe.image_base)
                assert data[offset:offset + len(original)] == original, 'diagnostic instruction byte drift'
                assert int(candidate['runtime_function_start'], 16) <= address < int(candidate['runtime_function_end'], 16), 'diagnostic range drift'
                checked.add((address, original))
    return len(literals), occurrences, len(checked)


def check(allow_pending=False):
    proof = json.loads(PROOF.read_text())
    assert proof['schema_version'] == 2
    selected = latest_target(verify=True)
    assert proof['target'] == {key: selected[key] for key in ('version', 'path', 'sha256', 'size_bytes')}, 'selected target drift'
    assert selected['version'] == '0.121.0'
    index = module('release_items_index', 'scripts/index-current-changelog.py')
    claims = [row for row in index.parse_claims(ROOT / 'docs/CHANGELOG.md')[0] if row['release'] == '0.121.0']
    assert len(claims) == len(proof['items']) == 22
    assert [row['gap_id'] for row in proof['items']] == list(range(218, 240))
    for claim, item in zip(claims, proof['items']):
        assert (item['claim_id'], item['claim'], item['source_span']) == (claim['id'], claim['text'], claim['source_span']), f"claim drift #{item['gap_id']}"
        assert item['compilation'] == item['runtime'] == 'not_run' and item['parity'] == 'unverified'
    initial_count = initial_review(proof)
    sealed, source_count, proof_count, missing = current_review(proof, selected, allow_pending)
    data = target_bytes(selected)
    inventory = module('release_items_pe', 'scripts/inventory-current-target.py')
    literal_count, occurrences, sites = native_navigation(proof, selected, data, inventory.pe_parser(data))
    item_statuses = {status: sum(item['current_review']['status'] == status for item in proof['items'])
                    for status in sorted({item['current_review']['status'] for item in proof['items']})}
    print(json.dumps(dict(target=selected['version'], sha256=selected['sha256'], supplied_items=22,
        initial_source_commit=INITIAL_COMMIT, initial_source_receipts=initial_count,
        current_source_commit=proof['current_source_review'].get('source_commit'),
        current_review_sealed=sealed, reviewed_current_source_paths=source_count,
        current_source_receipts_verified=source_count if sealed else 0,
        current_item_status_counts=item_statuses,
        recorded_unique_owning_checks=proof['current_source_review'].get('static_checker_count', 0),
        owning_proofs_checked=proof_count, pending_proof_deliveries=missing,
        literal_selectors=literal_count, exact_literal_occurrences=occurrences,
        unique_diagnostic_instruction_sites_checked=sites,
        result='passed_bounded_accounting' if sealed else 'pending_source_freeze',
        executable_semantic_completeness=False, owning_checkers_rerun=False,
        compilation=False, source_executed=False, application_executed=False,
        network_executed=False, server_executed=False, parity_verified=False), indent=2))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--allow-pending', action='store_true')
    args = parser.parse_args()
    try:
        check(args.allow_pending)
    except (AssertionError, KeyError, ValueError, OSError, subprocess.CalledProcessError) as exc:
        print(f'Release item proof error: {exc}', file=sys.stderr)
        sys.exit(1)
