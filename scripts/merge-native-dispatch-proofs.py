#!/usr/bin/env python3
"""Merge current native switch proofs only after whole-table boundary checks.

Different proposals for one site are rejected, never unioned. Every source and
case must match an existing instruction or an independent complete declared
linear decode without conflicting with established instructions. This expands
machine-code coverage without asserting source semantics or function identity.
"""
import argparse
from array import array
from bisect import bisect_right
import gzip
import hashlib
from importlib.util import spec_from_file_location, module_from_spec

from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path
from native_dispatch_validation import context_conflicts, verify_table_encoding


def module(name, path):
    spec = spec_from_file_location(name, ROOT / path)
    result = module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def merge_tables(proofs):
    """Deduplicate identical domains; conflicting domains remain explicit."""
    accepted = {}
    origins = {}
    conflicts = {}
    def signature(table):
        return tuple(table[key] if key != 'case_targets' else tuple(table[key]) for key in
                     ('table_address', 'relative_base', 'file_offset', 'byte_count', 'sha256',
                      'selector_minimum', 'selector_maximum', 'case_targets'))
    for origin, tables in proofs:
        for table in tables:
            site = table['site']
            origins.setdefault(site, []).append(origin)
            if site in conflicts:
                continue
            if site in accepted and signature(accepted[site]) != signature(table):
                conflicts[site] = 'conflicting-complete-input-domains'
                del accepted[site]
            else:
                accepted.setdefault(site, table)
    selected = [dict(table, proof_origins=origins[site]) for site, table in sorted(accepted.items(), key=lambda row: int(row[0], 16))]
    rejected = [{'site': site, 'reason': reason, 'proof_origins': origins[site]} for site, reason in sorted(conflicts.items(), key=lambda row: int(row[0], 16))]
    return selected, rejected


def conflicting_code_proofs(proofs):
    """Reject every candidate participating in any instruction overlap."""
    instructions = {}
    for entry, proof in proofs.items():
        if proof is None:
            continue
        for row in proof['instructions']:
            site = int(row['site'], 16)
            size = len(bytes.fromhex(row['instruction_bytes']))
            if site not in instructions:
                instructions[site] = (size, set())
            if instructions[site][0] != size:
                raise ValueError('Same current instruction start decoded with different lengths')
            instructions[site][1].add(entry)
    active = []
    conflicts = set()
    for site, (size, owners) in sorted(instructions.items()):
        active = [row for row in active if row[0] > site]
        for _, old_owners in active:
            conflicts.update(old_owners)
            conflicts.update(owners)
        active.append((site + size, owners))
    return conflicts


def verify_recorded_dependencies(inventory, digest=lambda path: file_sha256(project_path(path))):
    """An unchanged outer generator cannot authorize stale helper proofs."""
    for row in inventory.get('generator_dependencies', []) + inventory.get('pe_parser_helpers', []):
        if digest(row['path']) != row['sha256']:
            raise ValueError('Input switch generator dependency differs: ' + row['path'])


def required_code_proofs(tables, proofs):
    """A rejected whole table cannot poison independent candidate admission."""
    required = {int(site, 16) for table in tables for site in table['case_targets'] + [table['site']]}
    return {entry: proof for entry, proof in proofs.items() if entry in required}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--census-summary')
    parser.add_argument('--jump-summaries', nargs='+')
    parser.add_argument('--diagnostic-leads')
    parser.add_argument('--coherent-targets', action='store_true', help='Also require independently decoded bounded coherent graphs for uncovered encoded case targets')
    parser.add_argument('--output')
    parser.add_argument('--verify-inventory', help='Independently revalidate an immutable table inventory under the current verifier without changing its rows or provenance')
    parser.add_argument('--verification-output')
    args = parser.parse_args()
    import capstone
    target = latest_target(verify=True)
    if args.verify_inventory:
        if not args.verification_output:
            parser.error('--verify-inventory requires --verification-output')
        path = project_path(args.verify_inventory)
        payload = load_json(path)
        if payload['target']['sha256'] != target['sha256']:
            raise ValueError('Revalidation inventory target differs')
        verify_recorded_dependencies(payload)
        pe = module('revalidate_merge_pe', 'scripts/inventory-current-target.py').pe_parser(target_bytes(target))
        for table in payload['tables']:
            verify_table_encoding(table, pe)
        proof = {'target': payload['target'], 'validator': {'path': 'scripts/merge-native-dispatch-proofs.py', 'sha256': file_sha256(ROOT / 'scripts/merge-native-dispatch-proofs.py')},
                 'input': {'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)}, 'prior_generator': payload['generator'],
                 'validated_tables': len(payload['tables']), 'validated_encoded_cases': sum(len(table['case_targets']) for table in payload['tables']),
                 'unique_target_addresses': len({value for table in payload['tables'] for value in table['case_targets']}),
                 'signed_le32_successors_reconstructed': True, 'selector_domain_counts_and_lengths_checked': True,
                 'table_bytes_hash_offsets_and_immutable_file_mappings_checked': True, 'all_recorded_dependencies_match': True,
                 'input_inventory_bytes_changed': False, 'admitted_table_rows_changed': False, 'new_profile_required': False}
        project_path(args.verification_output).write_text(json_text(proof))
        print(json_text(proof))
        return
    if not all((args.census_summary, args.jump_summaries, args.diagnostic_leads, args.output)):
        parser.error('Merging requires --census-summary, --jump-summaries, --diagnostic-leads and --output')
    summary_path = project_path(args.census_summary)
    summary = load_json(summary_path)
    if summary['target']['sha256'] != target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('Current independently verified census required')
    generation = {'path': 'scripts/merge-native-dispatch-proofs.py', 'sha256': file_sha256(ROOT / 'scripts/merge-native-dispatch-proofs.py'), 'capstone_version': capstone.__version__}
    dependency_paths = ('scripts/native_dispatch_validation.py', 'scripts/recover-native-jump-tables.py', 'scripts/summarize-native-image.py',
                        'scripts/recover-native-address-leads.py',
                        'scripts/recover-custom-static-producers.py', 'scripts/classify-native-ownership.py',
                        'scripts/native_scalar_aliases.py', 'scripts/inventory-current-target.py',
                        'scripts/inventory-executable.py', 'scripts/coverage_common.py')
    dependencies = [{'path': path, 'sha256': file_sha256(ROOT / path)} for path in dependency_paths]
    parents = [{'path': args.census_summary, 'sha256': file_sha256(summary_path)}]
    proofs = []
    for name in args.jump_summaries:
        path = project_path(name)
        value = load_json(path)
        inventory_path = project_path(value['inventory']['path'])
        if value['target']['sha256'] != target['sha256'] or file_sha256(inventory_path) != value['inventory']['sha256']:
            raise ValueError('Input switch inventory commitment/target differs')
        inventory = load_json(inventory_path)
        source_census_path = project_path(inventory['census_summary'])
        if inventory['target']['sha256'] != target['sha256'] or file_sha256(source_census_path) != inventory['census_summary_sha256']:
            raise ValueError('Input switch source census differs')
        if file_sha256(project_path(inventory['generator']['path'])) != inventory['generator']['sha256']:
            raise ValueError('Input switch generator source differs')
        verify_recorded_dependencies(inventory)
        origin = {'summary': name, 'summary_sha256': file_sha256(path),
                  'inventory': inventory_path.relative_to(ROOT).as_posix(), 'inventory_sha256': file_sha256(inventory_path)}
        proofs.append((origin, inventory['tables']))
        parents.extend({'path': name, 'sha256': digest} for name, digest in
                       ((origin['summary'], origin['summary_sha256']), (origin['inventory'], origin['inventory_sha256'])))
    tables, rejected = merge_tables(proofs)
    recovery = module('merge_native_boundaries', 'scripts/recover-native-jump-tables.py')
    helpers = module('merge_native_census', 'scripts/summarize-native-image.py')
    producer = module('merge_native_code_roles', 'scripts/recover-custom-static-producers.py')
    addresses = module('merge_native_case_graphs', 'scripts/recover-native-address-leads.py')
    pe = module('merge_native_pe', 'scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    instruction_path = project_path(summary['artifacts']['directory']) / 'instructions.tsv.gz'
    if file_sha256(instruction_path) != summary['artifacts']['files']['instructions.tsv.gz']['sha256']:
        raise ValueError('Current instruction boundary artifact differs')
    starts, lengths = array('Q'), array('B')
    with gzip.open(instruction_path, 'rt') as stream:
        next(stream)
        for line in stream:
            address, length, _ = line.split('\t', 2)
            starts.append(int(address, 16))
            lengths.append(int(length))
    functions = sorted((pe.image_base + first, pe.image_base + last) for first, last, _ in pe.functions())
    function_starts = [first for first, _ in functions]
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    linear = {}
    commitments = {}
    coherent = {}
    coherent_failures = {}
    new_boundaries = {}
    def known_boundary(address):
        index = bisect_right(starts, address) - 1
        return 'exact' if index >= 0 and starts[index] == address else 'interior' if index >= 0 and address < starts[index] + lengths[index] else None
    def known_length(address):
        index = bisect_right(starts, address) - 1
        if index < 0 or starts[index] != address:
            raise ValueError('Missing exact current instruction length')
        return lengths[index]
    def independent_boundary(address):
        index = bisect_right(function_starts, address) - 1
        declared = index >= 0 and address < functions[index][1]
        if declared and index not in linear:
            first, last = functions[index]
            offset = pe.rva_offset(first - pe.image_base)
            raw = pe.data[offset:offset + last - first]
            decoded = list(decoder.disasm_lite(raw, first))
            complete = sum(row[1] for row in decoded) == len(raw)
            linear[index] = {row[0]: row[1] for row in decoded} if complete else {}
            commitments[index] = {'start': hex(first), 'end_exclusive': hex(last), 'byte_count': len(raw),
                                  'sha256': hashlib.sha256(raw).hexdigest(), 'complete_linear_decode': complete,
                                  'instruction_count': len(decoded)}
        if declared and address in linear[index]:
            size = linear[index][address]
            # A full linear decode is an independent start proof, but must not
            # erase an established boundary inside that first instruction.
            if any(known_boundary(address + delta) == 'exact' for delta in range(1, size)):
                return False
            raw = addresses.executable_bytes(pe, address, size)
            if raw is None:
                return False
            new_boundaries[address] = {'instructions': [{'site': hex(address), 'instruction_bytes': raw.hex()}],
                                       'validation_basis': 'complete-declared-linear-decode'}
            return True
        if not args.coherent_targets:
            return False
        if address not in coherent and address not in coherent_failures:
            proof, reason = addresses.code_proof(pe, address, known_boundary, known_length, capstone)
            if proof is not None:
                coherent[address] = proof
                new_boundaries[address] = proof
            else:
                coherent_failures[address] = reason
        return address in coherent
    admitted = []
    for table in tables:
        verify_table_encoding(table, pe)
        context = table.get('source_fallthrough_context')
        if context:
            first, last = int(context['start'], 16), int(context['end_exclusive'], 16)
            raw = addresses.executable_bytes(pe, first, last - first)
            if raw is None or hashlib.sha256(raw).hexdigest() != context['sha256']:
                raise ValueError('Source fallthrough context bytes differ')
            decoded = list(decoder.disasm(raw, first))
            if not decoded or sum(instruction.size for instruction in decoded) != len(raw) or decoded[-1].address != int(table['site'], 16):
                raise ValueError('Source fallthrough context does not decode through its JMP')
            if context_conflicts(decoded, starts, lengths):
                rejected.append({'site': table['site'], 'reason': 'source-context-conflicts-with-current-instructions', 'proof_origins': table['proof_origins']})
                continue
        validation = recovery.validate_scalar_targets(dict(table, case_targets=table['case_targets'] + [table['site']]), starts, lengths, independent_boundary)
        if validation['exceptions']:
            rejected.append({'site': table['site'], 'reason': 'whole-table-or-source-boundary-conflict',
                             'validation': validation, 'proof_origins': table['proof_origins']})
        else:
            admitted.append(dict(table, whole_domain_instruction_boundaries=validation))
    required_boundaries = required_code_proofs(admitted, new_boundaries)
    conflicts = conflicting_code_proofs(required_boundaries)
    if conflicts:
        remaining = []
        for table in admitted:
            bad = {int(value, 16) for value in table['case_targets'] + [table['site']]} & conflicts
            if bad:
                rejected.append({'site': table['site'], 'reason': 'cross-candidate-code-boundary-conflict',
                                 'targets': [hex(value) for value in sorted(bad)], 'proof_origins': table['proof_origins']})
            else:
                remaining.append(table)
        admitted = remaining
    output = project_path(args.output)
    output.mkdir(parents=True, exist_ok=False)
    boundary_path = output / 'linear-boundaries.json'
    boundary_path.write_text(json_text({'target': summary['target'], 'extents': [commitments[index] for index in sorted(commitments)]}))
    coherent_path = output / 'coherent-case-boundaries.json'
    coherent_path.write_text(json_text({'target': summary['target'], 'code_only_semantics': True,
                                       'source_census': {'path': args.census_summary, 'sha256': file_sha256(summary_path)},
                                       'records': [{'entry': hex(entry), 'code_validation': proof} for entry, proof in sorted(coherent.items())],
                                       'independent_declared_case_starts': [hex(entry) for entry in sorted(set(new_boundaries) - set(coherent))],
                                       'conflicting_candidate_entries': [hex(entry) for entry in sorted(conflicts)],
                                       'failures': [{'entry': hex(entry), 'reason': reason} for entry, reason in sorted(coherent_failures.items())]}))
    payload = {'schema_version': 1, 'target': summary['target'], 'generator': generation, 'generator_dependencies': dependencies,
               'census_summary': args.census_summary, 'census_summary_sha256': file_sha256(summary_path), 'inputs': parents,
               'counts': {'input_table_records': sum(len(rows) for _, rows in proofs), 'distinct_input_sites': len(tables) + sum(row['reason'] == 'conflicting-complete-input-domains' for row in rejected),
                          'admitted_tables': len(admitted), 'rejected_tables': len(rejected)},
               'linear_boundary_input': {'path': boundary_path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(boundary_path)},
               'coherent_case_input': {'path': coherent_path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(coherent_path),
                                      'enabled': args.coherent_targets, 'proved_candidate_starts': len(coherent),
                                      'independent_declared_case_starts': len(set(new_boundaries) - set(coherent)),
                                      'required_for_whole_candidate_tables': len(required_boundaries),
                                      'open_computed_exits': sum(len(proof['open_computed_exits']) for proof in coherent.values()),
                                      'rejected_candidate_starts': len(coherent_failures), 'conflicting_candidates': len(conflicts)},
               'tables': admitted, 'candidate_tables': rejected, 'native_semantics_or_all_computed_edges_complete': False}
    inventory = output / 'guarded-jump-tables.json'
    inventory.write_text(json_text(payload))
    diagnostic_path = project_path(args.diagnostic_leads)
    diagnostics = load_json(diagnostic_path)
    if diagnostics['target']['sha256'] != target['sha256']:
        raise ValueError('Code-only diagnostic input target differs')
    leads = producer.combined_code_leads(diagnostics, admitted, pe, decoder, capstone)
    by_site = {row['site']: row for row in leads['code_only_seeds']}
    for row in by_site.values():
        row['evidence_roles'] = [row['evidence_role']]
    case_sources = {}
    for table in admitted:
        for target in table['case_targets']:
            case_sources.setdefault(target, set()).add(table['site'])
    for value, sources in sorted(case_sources.items(), key=lambda row: int(row[0], 16)):
        address = int(value, 16)
        if value not in by_site:
            raw = addresses.executable_bytes(pe, address, 15, truncate=True)
            first = list(decoder.disasm(raw, address, count=1)) if raw is not None else []
            if len(first) != 1:
                raise ValueError('Proved case target has no exact first instruction')
            by_site[value] = {'site': value, 'instruction_bytes': first[0].bytes.hex(),
                              'classification': 'guarded-relative-case-target', 'evidence_role': 'guarded-relative-case-target',
                              'evidence_roles': [], 'function_entry_inferred': False}
        by_site[value]['evidence_roles'].append('guarded-relative-case-target')
        by_site[value]['supporting_dispatch_sites'] = sorted(sources, key=lambda site: int(site, 16))
    leads['code_only_seeds'] = [by_site[site] for site in sorted(by_site, key=lambda site: int(site, 16))]
    roles = {}
    for row in leads['code_only_seeds']:
        for role in row['evidence_roles']:
            roles[role] = roles.get(role, 0) + 1
    leads['counts_by_evidence_role'] = roles
    leads['evidence_role_counts_may_overlap_at_one_code_start'] = True
    leads['distinct_code_only_starts'] = len(by_site)
    leads['legacy_census_metric'] = 'additional_diagnostic_code_starts is the legacy added-code counter. Manifest roles separately preserve real diagnostics, independently decoded dispatch sources and guarded case targets; no case/source becomes a function entry.'
    leads.update(generator=generation, inputs=[{'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)} for path in (diagnostic_path, inventory)])
    code_path = output / 'combined-code-leads.json'
    code_path.write_text(json_text(leads))
    compact = {key: value for key, value in payload.items() if key not in ('tables', 'candidate_tables')}
    compact.update(inventory={'path': inventory.relative_to(ROOT).as_posix(), 'sha256': file_sha256(inventory)},
                   code_only_input={'path': code_path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(code_path), 'counts_by_evidence_role': leads['counts_by_evidence_role']},
                   case_entries=sum(len(table['case_targets']) for table in admitted),
                   unique_target_addresses=len({value for table in admitted for value in table['case_targets']}),
                   edge_digest=helpers.flow_edge_digest((int(table['site'], 16), int(value, 16)) for table in admitted for value in table['case_targets']),
                   gap_ids=[41], parity_verified=False,
                   limits=['All inputs belong to the current exact target; identical sites are deduplicated and conflicting domains remain rejected.',
                           'Every whole domain and source is independently boundary-checked; declared extents never become function owners.',
                           'Guarded/static-descriptor fallthrough edges remain distinct from unknown incoming contexts, aliases, full native semantics and parity.'])
    (output / 'guarded-jump-tables-summary.json').write_text(json_text(compact))
    if file_sha256(ROOT / generation['path']) != generation['sha256'] or any(file_sha256(ROOT / row['path']) != row['sha256'] for row in dependencies):
        raise ValueError('Native merge generator changed during analysis')
    print(json_text({key: compact[key] for key in ('counts', 'case_entries', 'unique_target_addresses')}))


if __name__ == '__main__':
    main()
