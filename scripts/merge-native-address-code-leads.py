#!/usr/bin/env python3
"""Revalidate exact address-taken code against current table/code boundaries.

This emits code-only roots. The original RIP-LEA evidence is preserved, while
bounded graphs are recomputed against the selected current census and table
proofs. No target becomes a function entry or a computed incoming edge.
"""
import argparse
from array import array
from bisect import bisect_right
from collections import Counter
import copy
import gzip
import hashlib
import importlib.util

from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path
from native_dispatch_validation import context_conflicts


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def add_address_rows(existing, candidates, conflicts, origin=None):
    """Keep independent code roles and reject every conflicting graph root."""
    result = copy.deepcopy(existing)
    records = {row['site']: row for row in result['code_only_seeds']}
    if len(records) != len(result['code_only_seeds']):
        raise ValueError('Existing code-only roots are duplicated')
    candidate_sites = [int(row['site'], 16) for row in candidates]
    if len(set(candidate_sites)) != len(candidate_sites) or not conflicts <= set(candidate_sites):
        raise ValueError('Address candidate/conflict root sets differ or are duplicated')
    rejected = []
    for incoming in candidates:
        if int(incoming['site'], 16) in conflicts:
            rejected.append({'site': incoming['site'], 'reason': 'cross-address-code-boundary-conflict'})
            continue
        row = records.get(incoming['site'])
        if row is None:
            row = copy.deepcopy(incoming)
            row.pop('source_native_owner', None)
            row.update(classification='exact-rip-lea-code-target', evidence_role='address-taken-code-target', evidence_roles=[], function_entry_inferred=False)
            records[row['site']] = row
        elif row['instruction_bytes'] != incoming['instruction_bytes']:
            raise ValueError('Address target has conflicting exact code bytes')
        row.setdefault('evidence_roles', [row['evidence_role']])
        row['evidence_roles'] = sorted(set(row['evidence_roles']) | {'address-taken-code-target'})
        row['address_source'] = {key: incoming[key] for key in ('source_site', 'source_instruction_bytes')}
        row['address_source'].update(original_source_native_owner=incoming['source_native_owner'],
                                     original_source_census=origin, source_native_owner_observation_role='original-operand-parent-only')
        row['current_address_code_validation'] = incoming['code_validation']
    result['code_only_seeds'] = [records[site] for site in sorted(records, key=lambda value: int(value, 16))]
    previous_end = None
    for row in result['code_only_seeds']:
        first, size = int(row['site'], 16), len(bytes.fromhex(row['instruction_bytes']))
        if not size or previous_end is not None and first < previous_end:
            raise ValueError('Combined code-only instruction intervals overlap or are empty')
        previous_end = first + size
    result['counts_by_evidence_role'] = dict(sorted(Counter(role for row in records.values() for role in row['evidence_roles']).items()))
    result['distinct_code_only_starts'] = len(records)
    result['address_code_rejections'] = rejected
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--census-summary', required=True)
    parser.add_argument('--jump-summary', required=True)
    parser.add_argument('--code-input', required=True)
    parser.add_argument('--address-summary', required=True)
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    import capstone
    target = latest_target(verify=True)
    paths = [project_path(value) for value in (args.census_summary, args.jump_summary, args.code_input, args.address_summary)]
    census, jump_summary, code, address_summary = [load_json(path) for path in paths]
    if any(value['target']['sha256'] != target['sha256'] for value in (census, jump_summary, code, address_summary)) or not census['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('Current independently verified inputs required')
    if code.get('function_entry_or_incoming_flow_edges_inferred') is not False:
        raise ValueError('Current code input must retain code-only roles')
    generation = {'path': 'scripts/merge-native-address-code-leads.py', 'sha256': file_sha256(ROOT / 'scripts/merge-native-address-code-leads.py'), 'capstone_version': capstone.__version__}
    dependencies = [{'path': path, 'sha256': file_sha256(ROOT / path)} for path in
                    ('scripts/native_dispatch_validation.py', 'scripts/recover-native-address-leads.py', 'scripts/merge-native-dispatch-proofs.py',
                     'scripts/inventory-current-target.py', 'scripts/inventory-executable.py', 'scripts/coverage_common.py')]
    merger = module('address_merge_tables', 'scripts/merge-native-dispatch-proofs.py')
    helper = module('address_merge_graphs', 'scripts/recover-native-address-leads.py')
    pe = module('address_merge_pe', 'scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    inputs = [{'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)} for path in paths]
    def committed(parent, key):
        row = parent[key]
        path = project_path(row['path'])
        if file_sha256(path) != row['sha256']:
            raise ValueError('Input commitment differs: ' + row['path'])
        inputs.append({'path': row['path'], 'sha256': row['sha256']})
        return load_json(path)
    tables = committed(jump_summary, 'inventory')
    addresses = committed(address_summary, 'inventory')
    for value in (tables, addresses, code):
        if value['target']['sha256'] != target['sha256']:
            raise ValueError('Current proof target differs')
        if value['generator']['sha256'] != file_sha256(project_path(value['generator']['path'])):
            raise ValueError('Current input generator differs')
        merger.verify_recorded_dependencies(value)
    helper.verify_inventory(addresses, target, pe, capstone)
    original_sites = [int(row['site'], 16) for row in addresses['code_only_seeds']]
    if addresses.get('function_entry_or_incoming_flow_edges_inferred') is not False or len(set(original_sites)) != len(original_sites):
        raise ValueError('Address inventory is not a unique code-only root set')
    if address_summary['counts']['admitted_code_only_starts'] != len(original_sites):
        raise ValueError('Address summary root count differs')
    if any('address-taken-code-target' in row.get('evidence_roles', []) for row in code['code_only_seeds']):
        raise ValueError('Fresh address admission requires an input without previous address roles')
    boundaries = committed(tables, 'coherent_case_input')
    instruction_path = project_path(census['artifacts']['directory']) / 'instructions.tsv.gz'
    if file_sha256(instruction_path) != census['artifacts']['files']['instructions.tsv.gz']['sha256']:
        raise ValueError('Current census instructions differ')
    starts, lengths = array('Q'), array('B')
    with gzip.open(instruction_path, 'rt') as stream:
        next(stream)
        for line in stream:
            site, size, _ = line.split('\t', 2)
            starts.append(int(site, 16)); lengths.append(int(size))
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    required = {int(site, 16) for table in tables['tables'] for site in table['case_targets'] + [table['site']]}
    extra = {}
    def include(rows):
        decoded = []
        for row in rows:
            site, raw = int(row['site'], 16), bytes.fromhex(row['instruction_bytes'])
            instruction = list(decoder.disasm(raw, site, count=1))
            if helper.executable_bytes(pe, site, len(raw)) != raw or len(instruction) != 1 or instruction[0].size != len(raw):
                raise ValueError('Current additional boundary bytes differ')
            decoded.extend(instruction)
            if site in extra and extra[site] != len(raw):
                raise ValueError('Current additional boundary length differs')
            extra[site] = len(raw)
        if context_conflicts(decoded, starts, lengths):
            raise ValueError('Additional boundary conflicts with current established instructions')
    include(code['code_only_seeds'])
    for row in boundaries['records']:
        if int(row['entry'], 16) in required:
            include(row['code_validation']['instructions'])
    for table in tables['tables']:
        merger.verify_table_encoding(table, pe)
        context = table.get('source_fallthrough_context')
        if context:
            first, last = int(context['start'], 16), int(context['end_exclusive'], 16)
            raw = helper.executable_bytes(pe, first, last - first)
            if raw is None or hashlib.sha256(raw).hexdigest() != context['sha256']:
                raise ValueError('Current table source context differs')
            decoded = list(decoder.disasm(raw, first))
            if sum(row.size for row in decoded) != len(raw):
                raise ValueError('Current table context is not complete')
            include([{'site': hex(row.address), 'instruction_bytes': row.bytes.hex()} for row in decoded])
    extra_starts = sorted(extra)
    if any(first + extra[first] > second for first, second in zip(extra_starts, extra_starts[1:])):
        raise ValueError('Current table/code proof intervals overlap')
    def state_in(address, values, sizes):
        index = bisect_right(values, address) - 1
        if index < 0:
            return None
        first = values[index]
        return 'exact' if first == address else 'interior' if address < first + sizes[index] else None
    extra_lengths = [extra[first] for first in extra_starts]
    def boundary(address):
        states = [state_in(address, starts, lengths), state_in(address, extra_starts, extra_lengths)]
        return 'interior' if 'interior' in states else 'exact' if 'exact' in states else None
    def known_length(address):
        if address in extra:
            return extra[address]
        index = bisect_right(starts, address) - 1
        if index < 0 or starts[index] != address:
            raise ValueError('No current established instruction length')
        return lengths[index]
    candidates, rejected, graphs = [], [], {}
    for old in addresses['code_only_seeds']:
        source, destination = int(old['source_site'], 16), int(old['site'], 16)
        if boundary(source) != 'exact' or known_length(source) != len(bytes.fromhex(old['source_instruction_bytes'])):
            raise ValueError('RIP-LEA source lost current exact instruction provenance')
        proof, reason = helper.code_proof(pe, destination, boundary, known_length, capstone)
        if proof is None:
            rejected.append({'site': old['site'], 'source_site': old['source_site'], 'reason': reason})
            continue
        first = next(row for row in proof['instructions'] if int(row['site'], 16) == destination)
        candidates.append(dict(old, instruction_bytes=first['instruction_bytes'], code_validation=proof))
        graphs[destination] = proof
    conflicts = merger.conflicting_code_proofs(graphs)
    if len(graphs) != len(candidates):
        raise ValueError('Current graph/candidate root count differs')
    result = add_address_rows(code, candidates, conflicts, addresses['source_census'])
    admitted_count = len(candidates) - len(conflicts)
    if result['counts_by_evidence_role'].get('address-taken-code-target', 0) != admitted_count:
        raise ValueError('Current address role/root count differs')
    result['address_code_rejections'].extend(rejected)
    result.update(generator=generation, generator_dependencies=dependencies, inputs=inputs,
                  source_census={'path': args.census_summary, 'sha256': file_sha256(paths[0])},
                  address_code_admission={'input_candidates': len(addresses['code_only_seeds']), 'admitted_candidates': admitted_count,
                                          'rejected_candidates': len(result['address_code_rejections']), 'current_table_and_code_boundaries_preserved': True,
                                          'bounded_graphs_recomputed': True, 'source_owner_observations_retained_from_original_operand_parent': True,
                                          'function_entries_or_incoming_edges_inferred': False})
    if any(file_sha256(project_path(row['path'])) != row['sha256'] for row in dependencies + inputs) or file_sha256(ROOT / generation['path']) != generation['sha256']:
        raise ValueError('Current address merge input changed during analysis')
    project_path(args.output).write_text(json_text(result))
    print(json_text({key: result[key] for key in ('distinct_code_only_starts', 'counts_by_evidence_role', 'address_code_admission')}))


if __name__ == '__main__':
    main()
