#!/usr/bin/env python3
"""Check exact independent indirect-site selection, static bindings and limits."""
import argparse
from collections import Counter
from copy import deepcopy
import csv
import gzip
import importlib.util
import json
from pathlib import Path

from coverage_common import ROOT, latest_target, project_path, file_sha256, load_json


def require(condition, message):
    if not condition:
        raise ValueError(message)


def producer_module():
    spec = importlib.util.spec_from_file_location('indirect_operand_producer', ROOT/'scripts/classify-independent-indirects.py')
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def validate(record, target, *, files=True, root=None,
             census_summary='docs/analysis/coverage/full-image-census.json'):
    root = (ROOT if root is None else Path(root)).resolve()
    def artifact_path(value):
        path = (root / value).resolve()
        require(path.is_relative_to(root), 'Indirect artifact escapes project')
        return path
    identity = {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    require(record['target'] == identity, 'Independent indirect target differs')
    for flag in ('computed_runtime_targets_complete', 'source_semantics_complete', 'global_aliasing_complete', 'parity_verified'):
        require(record[flag] is False, 'Operand classification cannot establish ' + flag)
    require(record['exact_selected_sites_classified'] is True, 'Exact selected-site flag differs')
    producer = producer_module()
    require(record['generator']['path'] == producer.GENERATOR, 'Unexpected indirect classifier')
    require({row['path'] for row in record['dependencies']} == set(producer.DEPENDENCIES), 'Classifier dependency set differs')
    census_path = census_summary
    census = load_json(root/census_path)
    require(census['target'] == identity and census['independent_instructions']['exact_source_bytes_verified'], 'Census identity differs')
    require(record['source_census'] == dict(path=census_path, sha256=file_sha256(root/census_path)), 'Census commitment differs')
    require(record['source_census'] in record['inputs'], 'Census missing from commitments')
    ownership = load_json(artifact_path(record['ghidra_ownership']['path']))
    residual = load_json(artifact_path(record['residual_summary']['path']))
    require(ownership['target'] == identity and residual['target'] == identity, 'Source proof target differs')
    require(ownership['census_summary_sha256'] == record['source_census']['sha256'], 'Ownership census differs')
    require(record['source_census'] in residual['inputs'], 'Residual census differs')
    require(record['ghidra_ownership'] in record['inputs'] and record['residual_summary'] in record['inputs'], 'Proof input commitment missing')
    total = 0
    for lead, name, label in [('Q41-F01', 'instruction-summary', 'declared'), ('Q41-F02', 'unwind-complement-summary', 'complement')]:
        path = f'docs/analysis/coverage/{name}.json'
        summary = load_json(root/path)
        binding = record['independent_inputs'][lead]
        require(summary['target'] == identity, 'Independent inventory target differs')
        require(binding['summary'] == dict(path=path, sha256=file_sha256(root/path)), 'Independent summary differs')
        require(binding['inventory'] == {key: summary['inventory'][key] for key in ('path', 'sha256')}, 'Independent inventory binding differs')
        require(binding['summary'] in record['inputs'] and binding['inventory'] in record['inputs'], 'Independent input commitment missing')
        require(residual['independent_inputs'][name] == dict(summary=binding['summary'], inventory=binding['inventory']), 'Residual independent binding differs')
        expected = sum(summary['counts']['reference_kinds'].get(kind, 0) for kind in producer.KINDS)
        require(binding['expected_records'] == expected, 'Independent expected selector differs')
        require(binding['residual_artifact'] == residual['artifacts'][label+'-indirect-sites.tsv.gz'], 'Residual selected artifact differs')
        require(binding['residual_artifact']['rows'] == expected, 'Residual selected count differs')
        require(record['per_lead'][lead]['records'] == expected, 'Independent selected total differs')
        total += expected
    require(record['counts']['records'] == total and record['artifact']['rows'] == total, 'Combined selected total differs')
    ghidra_total = sum(ownership['indirect_counts'].get(kind, 0) for kind in ('actual_indirect_call', 'actual_indirect_jump'))
    require(record['counts']['ghidra:present'] == ghidra_total, 'Ghidra intersection count differs')
    require(record['counts']['ghidra:absent'] + ghidra_total == total, 'Ghidra presence partition differs')
    if not files:
        return total
    import capstone
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    commitments = [record['generator'], *record['dependencies'], *record['inputs'], record['artifact']]
    for item in commitments:
        path = artifact_path(item['path'])
        require(path.is_file() and file_sha256(path) == item['sha256'], 'Changed indirect commitment: ' + item['path'])
    rows = {}
    counts = Counter()
    per_lead = {lead: Counter() for lead in record['independent_inputs']}
    with gzip.open(artifact_path(record['artifact']['path']), 'rt') as stream:
        for line in stream:
            row = json.loads(line)
            require(row['site'] not in rows, 'Duplicate independent output site')
            _, decoded_operand = producer.decode_row(row, decoder, capstone)
            require(row['operand_state'] == decoded_operand, 'Encoded operand state differs from exact selected bytes')
            rows[row['site']] = row
            require(row['lead_id'] in per_lead, 'Unexpected independent lead')
            for flag in ('initial_image_binding_is_runtime_dispatch', 'incoming_register_state_established',
                         'global_aliasing_complete', 'runtime_dispatch_verified', 'source_semantics_established'):
                require(row[flag] is False, 'Optimistic row semantics: ' + flag)
            operand = row['operand_state']
            binding = row['slot_binding']
            fixed = operand['operand_class'] in ('fixed-relative-memory', 'fixed-absolute-memory')
            require(('slot' in operand) == fixed, 'Fixed/dynamic operand partition differs')
            require((binding['kind'] != 'dynamic-address-state-required') == fixed, 'Fixed/dynamic binding differs')
            if fixed:
                require(binding['slot'] == operand['slot'], 'Encoded slot differs from binding slot')
            for key in ('records', 'kind:' + row['kind'], 'operand:' + operand['operand_class'],
                        'binding:' + binding['kind'], 'ghidra:' + ('present' if row['ghidra_indirect_record_present'] else 'absent'),
                        'body:' + ('present' if row['observed_body_owner'] is not None else 'absent')):
                counts[key] += 1
                per_lead[row['lead_id']][key] += 1
    require(dict(counts) == record['counts'], 'Observed operand/binding histogram differs')
    require({lead: dict(value) for lead, value in per_lead.items()} == record['per_lead'], 'Per-lead histogram differs')
    # Re-read exact owning selectors and residual body joins. Equal totals alone
    # cannot hide substituted sites, bytes, kinds, extent IDs or owner presence.
    for lead, binding in record['independent_inputs'].items():
        expected = set()
        for source in producer.selected_rows(artifact_path(binding['inventory']['path']), lead):
            require(source['site'] not in expected, 'Duplicate owning-inventory site')
            expected.add(source['site'])
            actual = rows.get(source['site'])
            require(actual is not None and actual['lead_id'] == lead, 'Selected site missing/substituted')
            require(all(actual[key] == value for key, value in source.items()), 'Selected row fields differ')
        with gzip.open(artifact_path(binding['residual_artifact']['path']), 'rt') as stream:
            residual_sites = set()
            for source in csv.DictReader(stream, delimiter='\t'):
                site = hex(int(source['site'], 16))
                require(site in expected and site not in residual_sites, 'Residual selector site differs')
                residual_sites.add(site)
                require(rows[site]['observed_body_owner'] == (source['source_owner'] or None), 'Residual body ownership differs')
            require(residual_sites == expected, 'Residual selector incomplete')
    with gzip.open(artifact_path(ownership['artifact']['path']), 'rt') as stream:
        observed = set()
        for line in stream:
            source = json.loads(line)
            actual = rows.get(source['site'])
            require(actual is not None and actual['ghidra_indirect_record_present'], 'Ghidra intersection site missing')
            require(actual['instruction_bytes'] == source['instruction_bytes'] and actual['ghidra_initial_target'] == source.get('initial_target'), 'Ghidra static candidate differs')
            observed.add(source['site'])
        require(len(observed) == ghidra_total, 'Ghidra intersection set differs')
    return total


def negative_tests(record, target):
    failures = 0
    mutations = [lambda r: r['target'].__setitem__('sha256', '0'*64),
                 lambda r: r['counts'].__setitem__('records', r['counts']['records']-1),
                 lambda r: r['artifact'].__setitem__('rows', r['artifact']['rows']-1),
                 lambda r: r['source_census'].__setitem__('sha256', '0'*64),
                 lambda r: r['independent_inputs']['Q41-F01']['inventory'].__setitem__('sha256', '0'*64),
                 lambda r: r['independent_inputs']['Q41-F02'].__setitem__('expected_records', 0),
                 lambda r: r['counts'].__setitem__('ghidra:absent', 0)]
    for flag in ('computed_runtime_targets_complete', 'source_semantics_complete', 'global_aliasing_complete', 'parity_verified'):
        mutations.append(lambda r, flag=flag: r.__setitem__(flag, True))
    for mutate in mutations:
        changed = deepcopy(record)
        mutate(changed)
        try:
            validate(changed, target, files=False)
        except ValueError:
            failures += 1
        else:
            raise ValueError('Changed target/count/binding/completeness was accepted')
    # Small static instruction fixtures exercise address-width, slot versus
    # register/index/segment distinctions and incorrect flow/byte selectors.
    import capstone
    producer = producer_module()
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    for raw, expected, slot in [('ffd0', 'register', None), ('ff10', 'register-relative-memory', None),
                                 ('ff1488', 'indexed-memory', None), ('65ff10', 'segment-relative-memory', None),
                                 ('ff1501000000', 'fixed-relative-memory', '0x140001007'),
                                 ('67ff1501000000', 'fixed-relative-memory', '0x40001008'),
                                 ('ff142578563412', 'fixed-absolute-memory', '0x12345678')]:
        row = dict(site='0x140001000', kind='call_indirect', instruction_bytes=raw, operand=0, access=0)
        _, state = producer.decode_row(row, decoder, capstone)
        require(state['operand_class'] == expected and state.get('slot') == slot, 'Static address fixture differs')
    for raw, kind in [('90', 'call_indirect'), ('ffd0', 'jump_indirect'), ('ffd090', 'call_indirect'), ('e800000000', 'call_indirect')]:
        row = dict(site='0x140001000', kind=kind, instruction_bytes=raw, operand=0, access=0)
        try:
            producer.decode_row(row, decoder, capstone)
        except ValueError:
            failures += 1
        else:
            raise ValueError('Wrong instruction/flow selector accepted')
    return failures


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof', required=True)
    parser.add_argument('--negative-tests', action='store_true')
    args = parser.parse_args()
    record = load_json(project_path(args.proof))
    target = latest_target(verify=True)
    total = validate(record, target)
    negative = negative_tests(record, target) if args.negative_tests else 0
    print(f'PASS: {total} exact independent indirect sites, original bytes/owning inventory/body and Ghidra joins; {negative} negative cases. Runtime/aliases/semantics/parity remain open.')


if __name__ == '__main__':
    main()
