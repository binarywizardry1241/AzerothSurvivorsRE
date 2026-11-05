"""Admit current residual classifiers without promoting inventory to semantics.

Ownership admission uses the existing Capstone Python environment to classify
the byte-verified census's computed flows, without running native analysis.
"""
from pathlib import Path
from collections import Counter
from collections import defaultdict
from functools import lru_cache
import csv
import gzip
import hashlib
import importlib.util
import json
import re
import subprocess

from coverage_common import ROOT, file_sha256, load_json
from script_sources import historical_matches, provenance

DIAGNOSTIC_SUMMARY = 'docs/analysis/coverage/diagnostic-ownership.json'


@lru_cache(maxsize=8)
def diagnostic_predecessor(root, expected):
    commit = provenance(root).get('diagnostic_summary_predecessors', {}).get(expected, '')
    if not re.fullmatch('[0-9a-f]{40}', commit):
        return None
    blob = subprocess.run(['git', 'cat-file', 'blob', f'{commit}:{DIAGNOSTIC_SUMMARY}'],
                          cwd=root, capture_output=True)
    if blob.returncode or hashlib.sha256(blob.stdout).hexdigest() != expected:
        return None
    return json.loads(blob.stdout)


def residual_input_matches(path, expected, current, root):
    if current == expected:
        return True
    name = path.relative_to(root).as_posix()
    if name.startswith('scripts/'):
        return historical_matches(name, expected, root)
    if name != DIAGNOSTIC_SUMMARY:
        return False
    previous = diagnostic_predecessor(root, expected)
    if previous is None:
        return False
    # A fresh replay may attest to the same frozen native diagnostics.
    current_summary = load_json(path)
    projection = 'source_mapping_projection'
    native_digest = previous.get(projection, {}).get('native_fact_sha256')
    verification = 'fresh_native_verification'
    if verification not in previous and verification in current_summary:
        witness = current_summary.pop(verification)
        if (not isinstance(witness, dict)
                or witness.get('method') != 'fresh_decode_exact_native_fact_comparison'
                or witness.get('native_fact_sha256') != native_digest):
            return False
    return (bool(native_digest) and native_digest ==
            current_summary.get(projection, {}).get('native_fact_sha256') and
            {k: v for k, v in previous.items() if k != projection} ==
            {k: v for k, v in current_summary.items() if k != projection})

SUPPORT = {
    'native-operands': ('scripts/audit-native-operands.py', 'generator_dependencies',
        ('scripts/summarize-native-image.py', 'scripts/inventory-current-target.py', 'scripts/inventory-executable.py',
         'scripts/recover-native-import-thunks.py', 'scripts/coverage_common.py',
         'scripts/instruction_facts.py', 'scripts/derived_gzip.py'),
        ('source_census', 'diagnostic_input', 'verified_instruction_count', 'inventory', 'details',
         'all_explicit_operand_domains', 'retained_explicit_operand_counts', 'source_ownership', 'unowned_executable_candidates')),
    'native-address-leads': ('scripts/recover-native-address-leads.py', 'generator_dependencies',
        ('scripts/summarize-native-image.py', 'scripts/inventory-current-target.py', 'scripts/inventory-executable.py'),
        ('source_census', 'operand_summary', 'inventory', 'counts', 'function_entry_or_incoming_flow_edges_inferred')),
    'q41-custom-diagnostics': ('scripts/check-custom-diagnostic-roles.py', 'dependencies',
        ('scripts/compact_evidence.py',), ('schema_version', 'inputs', 'selector', 'counts', 'sites', 'excluded_sites',
         'classification_digest', 'declared_extents', 'helpers', 'selected_site_roles_classified')),
    'engine-diagnostic-roles': ('scripts/check-engine-diagnostic-roles.py', 'dependencies',
        ('scripts/compact_evidence.py',), ('schema_version', 'inputs', 'selector', 'counts', 'sites', 'paths',
         'site_columns', 'declared_extents', 'classification_digest', 'helpers', 'classification_boundary_complete')),
    'unowned-unwind-destinations': ('scripts/check-unowned-unwind-destinations.py', 'reader_dependencies',
        ('scripts/recover-native-unwind-handlers.py', 'scripts/inventory-executable.py', 'scripts/summarize-native-image.py'),
        ('schema_version', 'inputs', 'selector', 'counts', 'field_projection', 'field_classification_sha256',
         'import_thunks', 'native_callbacks', 'selected_field_roles_classified')),
    'owned-custom-diagnostics': ('scripts/check-owned-custom-diagnostics.py', 'dependencies',
        ('scripts/coverage_common.py', 'scripts/derived_gzip.py', 'scripts/inventory-executable.py',
         'scripts/summarize-native-image.py', 'scripts/classify-native-ownership.py',
         'scripts/check-engine-diagnostic-roles.py', 'scripts/compact_evidence.py', 'scripts/native_residual_summary.py'),
        ('schema_version', 'inputs', 'selector', 'counts', 'artifacts', 'selection_digest', 'finite_bounds',
         'canonical_ownerless_proof', 'canonical_engine_proof', 'declared_extents', 'first_helpers',
         'failure_wrappers', 'supporting_interfaces', 'classification_boundary_complete', 'both_conditional_successors_followed')),
    'as-address-candidates': ('scripts/check-as-address-candidates.py', 'dependencies',
        ('scripts/coverage_common.py', 'scripts/native_recovery.py', 'scripts/inventory-executable.py', 'scripts/summarize-native-image.py',
         'scripts/native_residual_summary.py'),
        ('schema_version', 'inputs', 'source_contract', 'exact_direct_AS_context_candidates', 'ranges', 'checks', 'cases')),
}


def require(condition, message):
    if not condition:
        raise ValueError('Native classification ' + message)


def packed(value):
    return json.dumps(value, sort_keys=True, separators=(',', ':')).encode()


class SupportInputs:
    """Data-only admission joins; no native replay or semantic reconstruction."""
    def __init__(self, selected, root, bound, census_summary):
        self.selected, self.root, self.bound = selected, root, bound
        self.census_summary = census_summary
        self.cache = {}

    def read(self, receipt):
        return load_json(self.root/self.bound(receipt)['path'])

    def receipt(self, name):
        return self.bound(dict(path=name, sha256=file_sha256(self.root/name)))

    def census(self):
        if 'census' not in self.cache:
            self.cache['census'] = self.read(self.receipt(self.census_summary))
            require(self.cache['census']['target'] == self.selected and
                self.cache['census']['independent_instructions']['exact_source_bytes_verified'] is True, 'support census differs')
        return self.cache['census']

    def census_file(self, name):
        c = self.census()
        return self.bound(dict(path=str(Path(c['artifacts']['directory'])/name), sha256=c['artifacts']['files'][name]['sha256']))

    def proof(self, name):
        return self.read(self.receipt('docs/analysis/evidence/'+self.selected['version']+'/'+name+'.json'))

    def diagnostic_input(self):
        summary = load_json(self.root/'docs/analysis/coverage/diagnostic-ownership.json')
        require(summary['target'] == self.selected, 'diagnostic owning summary target differs')
        self.receipt('docs/analysis/coverage/diagnostic-ownership.json')
        return self.bound(summary['inventory'])

    def diagnostics(self):
        if 'diagnostics' not in self.cache:
            value = self.read(self.diagnostic_input())
            require(value['target'] == self.selected, 'diagnostic inventory target differs')
            self.cache['diagnostics'] = {row['path']: row for row in value['diagnostics']}
        return self.cache['diagnostics']

    def residual(self):
        if 'residual' not in self.cache:
            self.cache['residual'] = self.proof('native-residuals')
        return self.cache['residual']

    def json_rows(self, receipt):
        with gzip.open(self.root/self.bound(receipt)['path'], 'rt') as stream:
            for line in stream:
                yield json.loads(line)

    def diagnostic_rows(self):
        if 'diagnostic_rows' not in self.cache:
            source = self.residual()['artifacts']['diagnostic-sites.jsonl.gz']
            rows = list(self.json_rows(source))
            require(len(rows) == source['rows'] == self.census()['diagnostic_binding_counts']['verified_sites'], 'residual diagnostic population differs')
            self.cache['diagnostic_rows'] = rows
        return self.cache['diagnostic_rows']

    def same_receipt(self, actual, expected):
        require(self.bound(actual) == self.bound(expected), 'owning input commitment differs')

    def input_set(self, record, required):
        require(isinstance(record['inputs'], list), 'support inputs must be receipts')
        actual = [self.bound(r) for r in record['inputs']]
        require(all(self.bound(r) in actual for r in required), 'support required input omitted or substituted')

    def snapshot_input(self, record, expected):
        matches = [r for r in record['inputs'] if r['path'].endswith('.json') and self.read(r) == expected]
        require(bool(matches), 'support owning summary snapshot omitted or substituted')

    def common_diagnostic_inputs(self, record):
        self.input_set(record, [self.receipt(self.census_summary),
            self.census_file('bodies.tsv.gz'), self.residual()['artifacts']['diagnostic-sites.jsonl.gz']])
        self.snapshot_input(record, self.residual())

    def schema(self, name, record):
        generator, dep_field, dependencies, fields = SUPPORT[name]
        require(all(field in record for field in (*fields, dep_field)), name+' required fields missing')
        if generator:
            require('generator' in record and record['generator']['path'] == generator, name+' generator missing or different')
            self.bound(record['generator'])
        require(isinstance(record[dep_field], list) and {r['path'] for r in record[dep_field]} == set(dependencies)
                and len(record[dep_field]) == len(dependencies), name+' dependency set differs')
        for receipt in record[dep_field]: self.bound(receipt)
        if 'schema_version' in fields: require(record['schema_version'] == 1, name+' schema version differs')
        if 'selector' in fields: require(isinstance(record['selector'], str) and bool(record['selector']), name+' selector missing')
        flags = {
            'native-operands': ('complete_runtime_aliases_or_source_semantics',),
            'native-address-leads': ('function_entry_or_incoming_flow_edges_inferred',),
            'q41-custom-diagnostics': ('global_classification_semantics_complete','native_semantics_complete','parity_verified'),
            'engine-diagnostic-roles': ('native_semantics_complete','source_semantics_complete','parity_verified'),
            'unowned-unwind-destinations': ('global_native_semantics_complete','dynamic_dispatch_verified','parity_verified'),
            'owned-custom-diagnostics': ('native_semantics_complete','source_semantics_complete','global_aliasing_complete','parity_verified'),
            'as-address-candidates': ('source_semantics_complete','global_aliasing_complete','gameplay_parity_verified'),
        }
        require(all(record.get(flag) is False for flag in flags[name]), name+' completeness fields must be explicitly false')

    def operands(self, r):
        self.same_receipt(r['source_census'], self.receipt(self.census_summary))
        self.same_receipt(r['diagnostic_input'], self.diagnostic_input())
        require(r['verified_instruction_count'] == self.census()['counts']['instructions'], 'operand instruction population differs')
        details = self.read(r['details'])
        require(details['target'] == self.selected and all(details.get(k) == v for k,v in r.items()
            if k not in ('details','unowned_executable_candidates','import_slots_with_owned_explicit_operands','diagnostic_paths_with_explicit_operands')),
            'operand detail/summary binding differs')
        counts, owners = Counter(), Counter()
        for row in self.json_rows(r['inventory']):
            kind = row['kind']; require(kind in ('address-expression','fixed-memory','mapped-immediate-candidate'), 'operand kind differs')
            require(type(row['program_reference_pair_present']) is bool, 'operand pair flag differs')
            counts[kind] += 1
            counts[kind+(':program-pair-present' if row['program_reference_pair_present'] else ':program-pair-absent')] += 1
            owners['source-owned' if row['source_native_owner'] is not None else 'source-unowned'] += 1
            bytes.fromhex(row['instruction_bytes']); int(row['site'],16); int(row['target'],16)
        require(dict(counts) == r['retained_explicit_operand_counts'] and dict(owners) == r['source_ownership'], 'operand inventory population differs')
        require(counts['address-expression'] + counts['fixed-memory'] == r['all_explicit_operand_domains']['explicit-static-memory-or-address'],
                'operand static-domain population differs')
        candidates = details['unowned_executable_address_candidates']
        require(len({x['destination'] for x in candidates}) == len(candidates), 'duplicate operand candidate')
        c = r['unowned_executable_candidates']
        require(c['destinations'] == len(candidates) and c['exact_import_thunk_sources'] == len(details['exact_import_thunk_candidates'])
            and c['exact_observed_instructions']+c['observed_instruction_interiors']+c['not_observed'] == len(candidates)
            and all(c[key] == sum(x['decode_status'] == status for x in candidates) for key,status in
                [('exact_observed_instructions','exact-observed-instruction'),('observed_instruction_interiors','observed-instruction-interior'),('not_observed','not-observed')]),
            'operand candidate population differs')
        require(r['import_slots_with_owned_explicit_operands'] == sum(x['native_owners'] > 0 for x in details['import_slot_ownership'])
                and r['diagnostic_paths_with_explicit_operands'] == len(details['diagnostic_path_ownership']), 'operand detail population differs')

    def addresses(self, r):
        self.same_receipt(r['source_census'], self.receipt(self.census_summary))
        require(self.read(r['operand_summary']) == self.proof('native-operands'), 'address operand summary differs')
        full = self.read(r['inventory'])
        require(full['target'] == self.selected and all(full.get(k) == v for k,v in r.items() if k != 'inventory'), 'address inventory/summary differs')
        seeds, exceptions, c = full['code_only_seeds'], full['exceptions'], r['counts']
        details = self.read(self.proof('native-operands')['details'])
        expected = {x['destination'] for x in details['unowned_executable_address_candidates']}
        actual = [x['site'] for x in seeds+exceptions]
        require(len(set(actual)) == len(actual) and set(actual) == expected, 'address selected destination set differs')
        require(c['addressed_executable_targets'] == len(expected) and c['admitted_code_only_starts'] == len(seeds)
            and c['exceptions'] == dict(Counter(x['reason'] for x in exceptions)) and c['retained_existing_instruction_starts'] ==
            sum(x['code_validation']['validation_basis'] == 'independently-verified-existing-instruction' for x in seeds), 'address population differs')
        wanted = {(x['source_site'],x['site'],x['source_instruction_bytes'],x['source_native_owner']) for x in seeds}
        found = set()
        for row in self.json_rows(self.proof('native-operands')['inventory']):
            key = (row['site'],row['target'],row['instruction_bytes'],row['source_native_owner'])
            if row['kind'] == 'address-expression' and key in wanted: found.add(key)
        require(found == wanted, 'address source operand omitted or substituted')
        for row in seeds:
            proof = row['code_validation']; instructions = proof['instructions']
            require(row['function_entry_or_incoming_flow_established'] is False and bool(instructions)
                and any(x['site'] == row['site'] and x['instruction_bytes'] == row['instruction_bytes'] for x in instructions)
                and sum(len(bytes.fromhex(x['instruction_bytes'])) for x in instructions) == proof['byte_count'], 'address code-only proof differs')
        require(r['function_entry_or_incoming_flow_edges_inferred'] is False, 'address inventory cannot certify incoming flow')

    def diagnostic_roles(self, name, r):
        engine = name == 'engine-diagnostic-roles'
        self.same_receipt(r['inputs']['diagnostics' if engine else 'diagnostic-ownership'], self.diagnostic_input())
        self.same_receipt(r['inputs']['saved_bodies' if engine else 'ghidra-bodies'], self.census_file('bodies.tsv.gz'))
        rows = [x for x in self.diagnostic_rows() if x['actual_body_owner'] is None and
            x['context'] == ('shared-engine-or-other-path' if engine else 'AS-custom-path')]
        key = lambda x: (x['path'],x['instruction_address'],x['target_address'],x['kind'])
        expected = Counter(key(x) for x in rows)
        if engine:
            self.same_receipt(r['inputs']['canonical_D01'], self.receipt('docs/analysis/evidence/'+self.selected['version']+'/q41-custom-diagnostics.json'))
            columns = ['path_index','instruction','data_target','kind','source_line','source_column','extent_index',
                       'first_call','first_consumer','flow_address_and_bytes_sha256','selected_pointer_carriers']
            require(r['site_columns'] == columns, 'engine diagnostic site columns differ')
            require(r['paths'] == sorted({x['path'] for x in rows}), 'engine diagnostic paths differ')
            actual = Counter((r['paths'][x[0]],x[1],x[2],x[3]) for x in r['sites'] if len(x) == len(columns))
            require(actual == expected and len(r['sites']) == len(rows), 'engine diagnostic exact selector differs')
            require(r['counts']['sites'] == len(rows) and r['counts']['paths'] == len(set(x['path'] for x in rows))
                and r['counts']['declared_extents'] == len(r['declared_extents'])
                and r['counts']['rust_locations'] == sum(x['kind'] == 'rust_location' for x in rows)
                and r['counts']['path_literals'] == sum(x['kind'] == 'path_literal' for x in rows)
                and sum(r['counts']['roles'].values()) == len(rows), 'engine diagnostic population differs')
            require(hashlib.sha256(packed(r['sites'])).hexdigest() == r['classification_digest'], 'engine diagnostic digest differs')
            source = {(x['path'],x['instruction_address'],x['target_address'],x['kind']):x for x in rows}
            for x in r['sites']:
                raw = source[(r['paths'][x[0]],x[1],x[2],x[3])]
                require(r['declared_extents'][x[6]] == [raw['runtime_function_start'],raw['runtime_function_end'],raw['owner_sha256']], 'engine diagnostic extent selector differs')
        else:
            sites = r['sites']
            require(Counter((x['path'],x['site'],x['diagnostic_target'],x['reference_kind']) for x in sites) == expected,
                    'custom diagnostic exact selector differs')
            source = {(x['path'],x['instruction_address'],x['target_address'],x['kind']):x for x in rows}
            for x in sites:
                raw = source[(x['path'],x['site'],x['diagnostic_target'],x['reference_kind'])]
                require(x['declared_extent'] == [raw['runtime_function_start'],raw['runtime_function_end']], 'custom diagnostic extent selector differs')
            excluded = [x for x in self.diagnostic_rows() if x['actual_body_owner'] is None and
                x['context'] == 'excluded-coop-path' and self.diagnostics()[x['path']]['custom_game_crate']]
            require(Counter(key(x) for x in r['excluded_sites']) == Counter(key(x) for x in excluded), 'custom excluded diagnostic selector differs')
            require(r['counts']['classified_sites'] == len(rows) and r['counts']['excluded_sites'] == len(excluded)
                and r['counts']['paths'] == len({x['path'] for x in rows}) and r['counts']['roles'] == dict(Counter(x['role'] for x in sites)),
                'custom diagnostic population differs')
            projection = [[x['path'],x['site'],x['diagnostic_target'],x['reference_kind'],x['callee'],x['role']] for x in sites]
            digest = hashlib.sha256(''.join(json.dumps(x,separators=(',',':'))+'\n' for x in projection).encode()).hexdigest()
            require(digest == r['classification_digest'], 'custom diagnostic digest differs')

    def owned(self, r):
        self.common_diagnostic_inputs(r)
        for key,name in [('canonical_ownerless_proof','q41-custom-diagnostics'),('canonical_engine_proof','engine-diagnostic-roles')]:
            self.same_receipt(r[key],self.receipt('docs/analysis/evidence/'+self.selected['version']+'/'+name+'.json'))
            self.input_set(r,[r[key]])
        self.input_set(r,[self.diagnostic_input(), self.receipt('docs/analysis/evidence/'+self.selected['version']+'/addon-timers/integration.json')])
        require(set(r['artifacts']) == {'owned_AS','excluded_context'}, 'owned diagnostic artifact set differs')
        expected = {i:x for i,x in enumerate(self.diagnostic_rows()) if x['context'] == 'AS-custom-path' and x['actual_body_owner']}
        excluded = {i:x for i,x in enumerate(self.diagnostic_rows()) if x['context'] == 'excluded-coop-path' and x['actual_body_owner']}
        all_custom = [x for x in self.diagnostic_rows() if self.diagnostics()[x['path']]['custom_game_crate']]
        actual = list(self.json_rows(r['artifacts']['owned_AS'])); rejected = list(self.json_rows(r['artifacts']['excluded_context']))
        require(len(actual) == r['artifacts']['owned_AS']['rows'] == len(expected) and len(rejected) == r['artifacts']['excluded_context']['rows'] == len(excluded), 'owned diagnostic population differs')
        seen, projection, roles, stops, paths = set(), [], Counter(), Counter(), Counter()
        branching = unresolved = 0
        for row in actual:
            ordinal = row['residual_ordinal']; source = expected.get(ordinal)
            require(source is not None and ordinal not in seen, 'owned diagnostic ordinal omitted or substituted')
            seen.add(ordinal)
            require((row['path'],row['site'],row['actual_body_owner'],row['declared_extent'],row['declared_extent_sha256']) ==
                (source['path'],source['instruction_address'],source['actual_body_owner'],[source['runtime_function_start'],source['runtime_function_end']],source['owner_sha256']), 'owned diagnostic exact source differs')
            require(row['data_contract']['target'] == source['target_address'] and row['data_contract']['kind'] == source['kind'], 'owned diagnostic data contract differs')
            require(row['selected_first_interfaces_are_source_semantics'] is False and row['parity_verified'] is False
                and row['both_conditional_successors_followed'] is True, 'owned diagnostic cannot certify semantics/parity')
            leaves = row['first_interface_paths']; require(bool(leaves), 'owned diagnostic paths omitted')
            for leaf in leaves:
                require(leaf['complete_native_semantics'] is False, 'owned leaf cannot certify semantics')
                roles[leaf['role']] += 1; stops[leaf['boundary']] += 1
            branching += any(leaf['guards'] for leaf in leaves)
            unresolved += any(leaf['role'] in ('unestablished','direct_interface_with_unestablished_state_or_type','selected_mutable_data_read_requires_live_state') or leaf.get('location_argument_carrier_proven') is False for leaf in leaves)
            paths[row['path']] += 1
            projection.append([ordinal,row['path'],row['site'],source['target_address'],source['kind']])
        require(seen == expected.keys(), 'owned diagnostic selected rows incomplete')
        require(len({x['residual_ordinal'] for x in rejected}) == len(excluded), 'duplicate excluded owned ordinal')
        for row in rejected:
            source = excluded.get(row['residual_ordinal'])
            require(source is not None and (row['path'],row['site'],row['actual_body_owner']) ==
                (source['path'],source['instruction_address'],source['actual_body_owner']) and row['gameplay_recovered'] is False
                and row['custom_game_crate'] == self.diagnostics()[source['path']]['custom_game_crate'], 'excluded owned selector differs')
        c = r['counts']; custom_excluded = sum(self.diagnostics()[x['path']]['custom_game_crate'] for x in excluded.values())
        values = dict(owned_AS_sites=len(expected),owned_AS_rust_locations=sum(x['kind']=='rust_location' for x in expected.values()),
            owned_AS_path_literals=sum(x['kind']=='path_literal' for x in expected.values()),owned_AS_paths=len(paths),
            owned_excluded_context_sites=len(excluded),owned_excluded_custom_sites=custom_excluded,
            owned_excluded_noncustom_sites=len(excluded)-custom_excluded,all_custom_D01_sites=len(all_custom),
            AS_D01_sites=sum(x['context']=='AS-custom-path' for x in all_custom),excluded_custom_D01_sites=sum(x['context']=='excluded-coop-path' for x in all_custom),
            ownerless_AS_sites=sum(x['context']=='AS-custom-path' and not x['actual_body_owner'] for x in all_custom),
            ownerless_excluded_custom_sites=sum(x['context']=='excluded-coop-path' and not x['actual_body_owner'] for x in all_custom),
            first_interface_paths=sum(roles.values()),first_interface_roles=dict(roles),first_interface_boundaries=dict(stops),paths=dict(paths),
            branching_owned_AS_sites=branching,owned_AS_sites_with_unresolved_boundary=unresolved,owned_AS_sites_with_only_classified_boundaries=len(expected)-unresolved)
        require(all(c[k] == value for k,value in values.items()), 'owned diagnostic selector/path population differs')
        require(hashlib.sha256(packed(projection)).hexdigest() == r['selection_digest'], 'owned diagnostic selection digest differs')

    def unwind(self, r):
        for name in ('bodies.tsv.gz','references.tsv.gz'): self.same_receipt(r['inputs'][name],self.census_file(name))
        path = self.root/self.bound(self.residual()['artifacts']['unowned-executable-destinations.tsv.gz'])['path']
        with gzip.open(path,'rt') as stream:
            expected = {hex(int(x['destination'],16)):int(x['reference_records']) for x in csv.DictReader(stream,delimiter='\t')}
        groups = r['import_thunks']+r['native_callbacks']
        require(len({x['entry'] for x in groups}) == len(groups) and {x['entry']:x['source_reference_count'] for x in groups} == expected, 'unwind destination selector differs')
        c = r['counts']
        require(c['selected_reference_records'] == c['handler_rva_fields'] == sum(expected.values()) and c['distinct_destinations'] == len(expected)
            and c['import_thunk_fields'] == sum(x['source_reference_count'] for x in r['import_thunks'])
            and c['native_callback_fields'] == sum(x['source_reference_count'] for x in r['native_callbacks'])
            and c['native_callbacks'] == len(r['native_callbacks']) and c['import_thunks'] == len(r['import_thunks']), 'unwind population differs')
        for row in r['native_callbacks']:
            require(all(k in row for k in ('role','reachable_instructions','reachable_bytes','flow_commitment','code_ranges','handler_metadata')),
                    'unwind callback schema incomplete')
            require(len(row['handler_metadata']) == row['source_reference_count'], 'unwind callback metadata truncated')
        require(r['field_projection'] == ['source','destination','field_role','unwind_flags','UNWIND_INFO_address']
                and re.fullmatch('[0-9a-f]{64}',r['field_classification_sha256']) is not None, 'unwind field projection differs')

    def as_addresses(self, r):
        self.common_diagnostic_inputs(r)
        address = self.proof('native-address-leads')
        self.snapshot_input(r,address); self.input_set(r,[address['inventory']])
        paths = defaultdict(set)
        for row in self.diagnostic_rows():
            if row['context'] == 'AS-custom-path' and row['actual_body_owner']: paths[row['actual_body_owner']].add(row['path'])
        full = self.read(address['inventory'])
        expected = [dict(site=x['site'],source_site=x['source_site'],source_native_owner=x['source_native_owner'],
            direct_diagnostic_context=sorted(paths[x['source_native_owner']])) for x in full['code_only_seeds'] if paths[x['source_native_owner']]]
        require(r['exact_direct_AS_context_candidates'] == expected and bool(expected), 'AS address exact selector omitted or substituted')
        require(bool(r['ranges']) and all(type(x['instruction_count']) is int and x['instruction_count'] > 0
            and int(x['start'],16) < int(x['end_exclusive'],16) and re.fullmatch('[0-9a-f]{64}',x['sha256'])
            for x in r['ranges'].values()) and all(any(int(x['start'],16) <= int(row['site'],16) < int(x['end_exclusive'],16)
            for x in r['ranges'].values()) for row in expected), 'AS address range population omitted or substituted')
        cases = self.read(r['cases']); require(cases['target'] == self.selected, 'AS address cases target differs')
        require(all(type(n) is int and n > 0 for n in r['checks'].values()), 'AS address case population omitted')
        require(r['checks'] == dict(hp_helper_cases=sum(x['kind']=='hp-helper' for x in cases['hp_cases']),
            hp_caller_cases=sum(x['kind']=='hp-caller' for x in cases['hp_cases']),support_thunk_cases=len(cases['support_thunk_cases'])), 'AS address cases truncated or substituted')
        source = r['source_contract']; path = (self.root/source['path']).resolve()
        require(path.is_relative_to(self.root) and source['function'] == 'health_polynomial', 'AS source contract leaves project or differs')
        text = path.read_text(); start = text.index('pub fn health_polynomial('); cursor = text.index('{',start)+1; depth = 1
        while depth:
            depth += (text[cursor]=='{')-(text[cursor]=='}'); cursor += 1
        require(hashlib.sha256(text[start:cursor].encode()).hexdigest() == source['body_sha256'], 'AS source contract changed')

    def validate(self, name, record):
        if name == 'engine-diagnostic-roles' and isinstance(record.get('inputs'), list):
            # The residual-based engine proof has its own bounded checker and
            # binds the exact census through the native residual proof.
            residual = self.residual()
            require(self.receipt(self.census_summary) in residual['inputs'],
                    'engine diagnostic owning census differs')
            owner = checker('check-engine-diagnostic-roles')
            require(owner.derive_residual_roles(self.selected, record['interfaces']) == record,
                    'engine diagnostic residual proof differs')
            return
        self.schema(name,record)
        if name == 'native-operands': self.operands(record)
        elif name == 'native-address-leads': self.addresses(record)
        elif name in ('q41-custom-diagnostics','engine-diagnostic-roles'): self.diagnostic_roles(name,record)
        elif name == 'owned-custom-diagnostics': self.owned(record)
        elif name == 'unowned-unwind-destinations': self.unwind(record)
        elif name == 'as-address-candidates': self.as_addresses(record)


def checker(name):
    spec = importlib.util.spec_from_file_location(name.replace('-', '_'), ROOT / 'scripts' / (name + '.py'))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def validate_ownership(record, selected, root, bound, census_summary):
    """Join every actual indirect row to the independently byte-verified census.

    Ghidra COMPUTED_* totals also include trap/system instructions. Decode only
    those source rows to distinguish actual calls/jumps; do not infer callees.
    """
    import capstone
    census_name = census_summary
    if record['census_summary'] != census_name:
        raise ValueError('Ownership must select the current owning census')
    bound(dict(path=census_name, sha256=record['census_summary_sha256']))
    census = load_json(root / census_name)
    if census['target'] != selected or census['independent_instructions']['exact_source_bytes_verified'] is not True:
        raise ValueError('Ownership census target/byte verification differs')
    directory = (root / census['artifacts']['directory']).resolve()
    source_receipt = dict(census['artifacts']['files']['instructions.tsv.gz'],
                          path=str(directory / 'instructions.tsv.gz'))
    source = root / bound(source_receipt)['path']
    artifact = root / bound(record['artifact'])['path']
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    expected, traps, flows = {}, Counter(), Counter()
    instruction_count = 0
    with gzip.open(source, 'rb') as stream:
        if next(stream, b'') != b'address\tlength\tbytes\tflow\n':
            raise ValueError('Ownership census instruction header differs')
        for line in stream:
            instruction_count += 1
            if b'\tCOMPUTED_' not in line:
                continue
            address, length, raw, flow = line.decode().rstrip('\n').split('\t')
            flows['computed_calls' if 'CALL' in flow else 'computed_jumps'] += 1
            decoded = list(decoder.disasm(bytes.fromhex(raw), int(address, 16), count=1))
            if len(decoded) != 1 or decoded[0].size != int(length) or len(bytes.fromhex(raw)) != int(length):
                raise ValueError('Ownership census computed instruction does not decode exactly')
            instruction = decoded[0]
            kind = ('call' if instruction.group(capstone.CS_GRP_CALL) else
                    'jump' if instruction.group(capstone.CS_GRP_JUMP) else None)
            if kind is None:
                traps[instruction.mnemonic] += 1
                continue
            site = hex(int(address, 16))
            if site in expected:
                raise ValueError('Duplicate ownership census site')
            expected[site] = (kind, raw, flow)
    if instruction_count != census['counts']['instructions'] or any(flows[k] != census['counts'][k] for k in ('computed_calls', 'computed_jumps')):
        raise ValueError('Ownership census population differs')
    observed, counts, unknown = set(), Counter(), Counter()
    with gzip.open(artifact, 'rt') as stream:
        for line in stream:
            row = json.loads(line)
            site, kind = row['site'], row['kind']
            if site in observed or expected.get(site) != (kind, row['instruction_bytes'], row['ghidra_flow']):
                raise ValueError('Ownership indirect site/bytes/flow missing or substituted')
            if row['runtime_dispatch_verified'] is not False:
                raise ValueError('Ownership inventory cannot certify runtime dispatch')
            observed.add(site)
            counts['actual_indirect_' + kind] += 1
            target = row.get('initial_target')
            if target is None:
                unknown[kind + ':' + row['unknown_reason']] += 1
            elif target['kind'] == 'declared-import-slot':
                counts['declared_import_' + kind] += 1
            elif target['kind'] == 'encoded-executable-address':
                counts['encoded_native_' + kind] += 1
            else:
                raise ValueError('Unknown ownership static binding class')
    if observed != expected.keys() or dict(counts) != record['indirect_counts'] or dict(unknown) != record['unknown_indirect_reasons'] or dict(traps) != record['computed_flow_non_call_or_jump_mnemonics']:
        raise ValueError('Ownership exact indirect population/histogram differs')


def verified_classifications(selected, *, root=None, census_summary=None):
    root = (ROOT if root is None else Path(root)).resolve()
    census_path = (root / (census_summary or 'docs/analysis/coverage/full-image-census.json')).resolve()
    if not census_path.is_relative_to(root):
        raise ValueError('Native classification census escapes project')
    census_name = census_path.relative_to(root).as_posix()
    directory = root / 'docs/analysis/evidence' / selected['version']
    names = ('native-residuals', 'native-operands', 'native-ownership',
             'native-address-leads', 'independent-indirects', 'q41-custom-diagnostics',
             'engine-diagnostic-roles', 'unowned-unwind-destinations',
             'owned-custom-diagnostics', 'as-address-candidates')
    admitted, hashes = {}, {}

    def bound(record, *, allow_residual_predecessors=False):
        if not isinstance(record, dict) or 'path' not in record or 'sha256' not in record:
            raise ValueError('Missing native classification commitment')
        name, expected = record['path'], record['sha256']
        if not isinstance(name, str) or not isinstance(expected, str) or not re.fullmatch('[0-9a-f]{64}', expected):
            raise ValueError('Invalid native classification commitment')
        path = (root / name).resolve()
        if not path.is_relative_to(root):
            raise ValueError('Native classification artifact escapes project: ' + name)
        if path not in hashes:
            if not path.is_file():
                raise ValueError('Native classification artifact missing: ' + name)
            hashes[path] = file_sha256(path)
        if hashes[path] != expected and not (allow_residual_predecessors and
                residual_input_matches(path, expected, hashes[path], root)):
            raise ValueError('Native classification artifact changed: ' + name)
        return dict(path=path.relative_to(root).as_posix(), sha256=expected)

    def commitments(value, *, allow_residual_predecessors):
        if isinstance(value, dict):
            if 'path' in value and 'sha256' in value:
                bound(value, allow_residual_predecessors=allow_residual_predecessors)
            for key, child in value.items():
                if key != 'target':  # Portable target identity is not a workspace file.
                    commitments(child, allow_residual_predecessors=allow_residual_predecessors)
        elif isinstance(value, list):
            for child in value:
                commitments(child, allow_residual_predecessors=allow_residual_predecessors)

    support = SupportInputs(selected,root,bound,census_name)

    for name in names:
        path = directory / (name + '.json')
        if not path.is_file():
            continue
        proof = bound(dict(path=str(path), sha256=file_sha256(path)))
        value = load_json(path)
        if value.get('target') != selected:
            raise ValueError('Native classification target differs: ' + name)
        for field in ('source_semantics_complete', 'global_native_semantics_complete',
                      'global_aliasing_complete', 'computed_runtime_targets_complete',
                      'complete_runtime_aliases_or_source_semantics', 'parity_verified',
                      'native_semantics_complete', 'global_classification_semantics_complete',
                      'runtime_dispatch_verified', 'dynamic_dispatch_verified', 'gameplay_parity_verified'):
            if value.get(field) is True:
                raise ValueError('Native classification cannot certify ' + field)
        commitments({k: v for k, v in value.items() if k != 'target'},
                    allow_residual_predecessors=name == 'native-residuals')
        if name == 'native-ownership':
            validate_ownership(value, selected, root, bound, census_name)
        if name == 'independent-indirects':
            checker('check-independent-indirects').validate(value, selected, root=root, census_summary=census_name)
        if name in SUPPORT:
            try:
                support.validate(name,value)
            except (KeyError, TypeError, IndexError) as error:
                raise ValueError('Native classification malformed '+name+': '+str(error)) from error
        admitted[name] = dict(proof=proof,
                              record=value)
    residual = admitted.get('native-residuals', {}).get('record')
    if residual is not None:
        census = load_json(census_path)
        if census.get('target') != selected:
            raise ValueError('Residual classifier census target differs')
        checker('check-native-residuals').validate(residual, selected, census, root=root, census_summary=census_name)
    for path, expected in hashes.items():
        require(path.is_file() and file_sha256(path) == expected, 'bound input changed during admission: '+str(path.relative_to(root)))
    return dict(proofs={name: row['proof'] for name, row in admitted.items()},
                residual_artifact_selectors=residual['artifacts'] if residual else {},
                residual_counts=residual['counts'] if residual else {},
                explicit_ownerless_site_inventory_available=residual is not None,
                computed_destination_classification_available='native-ownership' in admitted,
                global_native_semantics_complete=False, global_aliasing_complete=False,
                parity_verified=False)
