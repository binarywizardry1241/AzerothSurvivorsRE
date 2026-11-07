#!/usr/bin/env python3
"""Add exact current engine diagnostic starts without inventing entry points.

Retains prior independent source/case code roles and their input commitments.
Only newly prepared undecoded, nonconflicting diagnostic starts are added.
"""
from runtime_layout import retained_runtime_path
import argparse
from collections import Counter
import copy
import hashlib
import importlib.util
import json

from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path


def augment(existing, diagnostics, custom_paths):
    if existing.get('function_entry_or_incoming_flow_edges_inferred') is not False or diagnostics.get('function_entry_or_incoming_flow_edges_inferred') is not False:
        raise ValueError('Only explicit code-only inputs are eligible')
    records = {}
    for row in existing['code_only_seeds']:
        if row['site'] in records:
            raise ValueError('Existing code-only inventory has a duplicate instruction start')
        records[row['site']] = copy.deepcopy(row)
    for incoming in diagnostics['code_only_seeds']:
        if incoming['classification'] != 'undecoded-exact-diagnostic-lead':
            raise ValueError('New diagnostic start is not a nonconflicting undecoded lead')
        site = incoming['site']
        role = 'custom-diagnostic-reference' if set(incoming['diagnostic_paths']) & custom_paths else 'engine-diagnostic-reference'
        if site in records:
            row = records[site]
            if row['instruction_bytes'] != incoming['instruction_bytes']:
                raise ValueError('A code start has conflicting exact instruction bytes')
        else:
            row = copy.deepcopy(incoming)
            row.update(evidence_role=role, evidence_roles=[], function_entry_inferred=False)
            records[site] = row
        row.setdefault('evidence_roles', [row['evidence_role']])
        row['evidence_roles'] = sorted(set(row['evidence_roles']) | {role})
        row['diagnostic_paths'] = sorted(set(row.get('diagnostic_paths', [])) | set(incoming['diagnostic_paths']))
    result = copy.deepcopy(existing)
    result['code_only_seeds'] = [records[site] for site in sorted(records, key=lambda value: int(value, 16))]
    previous_end = None
    for row in result['code_only_seeds']:
        start = int(row['site'], 16)
        size = len(bytes.fromhex(row['instruction_bytes']))
        if not size:
            raise ValueError('Empty code-only instruction')
        if previous_end is not None and start < previous_end:
            raise ValueError('Code-only instruction intervals overlap')
        previous_end = start + size
    result['counts_by_evidence_role'] = dict(sorted(Counter(role for row in records.values() for role in row.get('evidence_roles', [row['evidence_role']])).items()))
    result['distinct_code_only_starts'] = len(records)
    result['evidence_role_counts_may_overlap_at_one_code_start'] = True
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--code-input', required=True)
    parser.add_argument('--diagnostic-leads', required=True)
    parser.add_argument('--output', required=True)
    parser.add_argument('--revalidate-input', help='Require byte-for-byte-equivalent admitted rows to a prior immutable input; retain a fixed-validator attestation')
    args = parser.parse_args()
    import capstone
    target = latest_target(verify=True)
    generation = {'path': 'scripts/augment-native-code-leads.py', 'sha256': file_sha256(ROOT / 'scripts/augment-native-code-leads.py'), 'capstone_version': capstone.__version__}
    code_path, diagnostic_path = project_path(args.code_input), project_path(args.diagnostic_leads)
    existing, diagnostics = load_json(code_path), load_json(diagnostic_path)
    if any(value['target']['sha256'] != target['sha256'] for value in (existing, diagnostics)):
        raise ValueError('Current target differs')
    source_path = project_path(diagnostics['diagnostic_input']['path'])
    census_path = project_path(diagnostics['census_summary'])
    source, census = load_json(source_path), load_json(census_path)
    if file_sha256(source_path) != diagnostics['diagnostic_input']['sha256'] or file_sha256(census_path) != diagnostics['census_summary_sha256']:
        raise ValueError('Diagnostic input commitments differ')
    if source['target']['sha256'] != target['sha256'] or census['target']['sha256'] != target['sha256'] or not census['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('A current independently verified diagnostic parent is required')
    producer = project_path(diagnostics['generator']['path'])
    if file_sha256(producer) != diagnostics['generator']['sha256']:
        raise ValueError('Diagnostic lead generator differs')
    custom = {row['path'] for row in source['diagnostics'] if row['custom_game_crate']}
    allowed = {(reference['instruction_address'], reference['instruction_bytes'], row['path'])
               for row in source['diagnostics'] for reference in row['verified_references']}
    for row in diagnostics['code_only_seeds']:
        if any((row['site'], row['instruction_bytes'], path) not in allowed for path in row['diagnostic_paths']):
            raise ValueError('Diagnostic lead has no exact reference provenance')
    dependencies = [{'path': path, 'sha256': file_sha256(ROOT / path)} for path in
                    ('scripts/inventory-current-target.py', 'scripts/inventory-executable.py', 'scripts/coverage_common.py')]
    spec = importlib.util.spec_from_file_location('augment_native_pe', ROOT / dependencies[0]['path'])
    pe_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(pe_module)
    pe = pe_module.pe_parser(target_bytes(target))
    result = augment(existing, diagnostics, custom)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    for row in result['code_only_seeds']:
        address, raw = int(row['site'], 16), bytes.fromhex(row['instruction_bytes'])
        offset = pe.rva_offset(address - pe.image_base)
        decoded = list(decoder.disasm(raw, address, count=1))
        if pe.data[offset:offset + len(raw)] != raw or len(decoded) != 1 or decoded[0].size != len(raw):
            raise ValueError('Code-only instruction bytes differ')
        if not any(pe.image_base + section['rva'] <= address < address + len(raw) <= pe.image_base + section['rva'] + min(section['virtual_size'], section['raw_size']) and int(section['characteristics'], 16) & 0x20000000 for section in pe.sections):
            raise ValueError('Code-only instruction mapping is not executable and file-backed')
    inputs = [{'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)} for path in (code_path, diagnostic_path, source_path, census_path)]
    if args.revalidate_input:
        prior_path = project_path(args.revalidate_input)
        prior = load_json(prior_path)
        if prior['target']['sha256'] != target['sha256'] or prior['code_only_seeds'] != result['code_only_seeds']:
            raise ValueError('Fixed validator changed admitted rows; a fresh census profile is required')
        encoded_rows = json.dumps(result['code_only_seeds'], sort_keys=True, separators=(',', ':')).encode()
        result['independent_revalidation'] = {'prior_input': {'path': prior_path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(prior_path)},
                                             'prior_generator': prior['generator'],
                                             'all_admitted_record_fields_identical': True,
                                             'admitted_rows_sha256': hashlib.sha256(encoded_rows).hexdigest(),
                                             'instruction_interval_overlap_count': 0,
                                             'native_instruction_bytes_and_executable_file_mapping_rechecked': True,
                                             'new_profile_required': False}
        inputs.append(result['independent_revalidation']['prior_input'])
    result.update(generator=generation, generator_dependencies=dependencies, inputs=inputs,
                  legacy_census_metric='additional_diagnostic_code_starts counts newly inserted code starts after the guarded-case queue. Per-record roles preserve actual custom/engine diagnostics, dispatch sources and case targets.')
    if file_sha256(ROOT / generation['path']) != generation['sha256'] or any(file_sha256(retained_runtime_path(ROOT / row['path'], ROOT)) != row['sha256'] for row in dependencies + inputs):
        raise ValueError('Code-only augmentation inputs changed during analysis')
    project_path(args.output).write_text(json_text(result))
    print(json_text({'distinct_code_only_starts': result['distinct_code_only_starts'], 'counts_by_evidence_role': result['counts_by_evidence_role']}))


if __name__ == '__main__':
    main()
