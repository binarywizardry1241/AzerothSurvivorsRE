#!/usr/bin/env python3
"""Check residual-set commitments and independent census/count boundaries."""
import argparse
from copy import deepcopy
import gzip
import hashlib
import json
from pathlib import Path

from coverage_common import ROOT, latest_target, load_json, project_path, file_sha256

ARTIFACT_NAMES = frozenset(('diagnostic-sites.jsonl.gz', 'static-reference-roles.tsv.gz',
    'ownerless-reference-sources.tsv.gz', 'unowned-executable-destinations.tsv.gz',
    'declared-reference-roles.tsv.gz', 'declared-indirect-sites.tsv.gz',
    'declared-extent-roles.tsv.gz', 'complement-reference-roles.tsv.gz',
    'complement-indirect-sites.tsv.gz', 'complement-stops.jsonl.gz',
    'complement-region-roles.tsv.gz', 'ownerless-instructions.tsv.gz'))


def require(condition, message):
    if not condition:
        raise ValueError(message)


def validate(record, target, census, *, artifacts=True, root=None,
             census_summary='docs/analysis/coverage/full-image-census.json'):
    root = (ROOT if root is None else Path(root)).resolve()
    def artifact_path(value):
        path = (root / value).resolve()
        require(path.is_relative_to(root), 'Residual artifact escapes project')
        return path
    require(record['target'] == {k:target[k] for k in ('version','path','sha256','size_bytes')},
            'Residual target differs')
    require(record['source_semantics_complete'] is False and record['global_aliasing_complete'] is False
            and record['computed_runtime_targets_complete'] is False and record['parity_verified'] is False,
            'Residual inventory cannot certify source/alias/runtime/parity completeness')
    counts=record['counts']; rows=record['artifacts']
    require(set(rows) == ARTIFACT_NAMES, 'Complete residual artifact set differs')
    require(record['explicit_residual_sets_available'] is True, 'Explicit residual set unavailable')
    for item in rows.values():
        require(type(item['rows']) is int and item['rows'] >= 0, 'Invalid residual row count')
    census_path = artifact_path(census_summary)
    require(census['target'] == record['target'], 'Residual owning census target differs')
    require(census['independent_instructions']['exact_source_bytes_verified'] is True,
            'Residual owning census lacks exact source-byte verification')
    require(dict(path=census_path.relative_to(root).as_posix(), sha256=file_sha256(census_path)) in record['inputs'],
            'Residual owning census commitment missing or stale')
    for name in ('instructions.tsv.gz', 'bodies.tsv.gz', 'references.tsv.gz', 'externals.tsv.gz', 'direct-call-helpers.tsv.gz'):
        source = artifact_path(census['artifacts']['directory'])/name
        require(dict(path=source.relative_to(root).as_posix(), sha256=census['artifacts']['files'][name]['sha256']) in record['inputs'],
                'Residual census inventory commitment missing or stale: '+name)
    require(counts['instruction_records']==census['counts']['instructions'], 'Instruction total differs')
    require(counts['static_reference_records']==census['counts']['references'], 'Reference total differs')
    require(rows['static-reference-roles.tsv.gz']['rows']==census['counts']['references'], 'Reference artifact total differs')
    require(rows['ownerless-reference-sources.tsv.gz']['rows']==counts['reference_records_with_ownerless_sources'],
            'Ownerless-source total differs')
    require(rows['ownerless-instructions.tsv.gz']['rows']==counts['ownerless_instruction_records'],
            'Ownerless-instruction total differs')
    require(rows['unowned-executable-destinations.tsv.gz']['rows']==counts['distinct_unowned_executable_destinations'],
            'Unowned destination total differs')
    diagnostic=census['diagnostic_binding_counts']
    require(counts['diagnostic_sites']['records']==diagnostic['verified_sites'], 'Diagnostic total differs')
    require(counts['diagnostic_sites']['ownerless']==diagnostic['sites_without_actual_native_owner'],
            'Independent diagnostic body join differs')
    require(counts['diagnostic_sites']['owned']+counts['diagnostic_sites']['ownerless']==diagnostic['verified_sites'],
            'Diagnostic partition differs')
    require(rows['diagnostic-sites.jsonl.gz']['rows']==diagnostic['verified_sites'], 'Diagnostic artifact total differs')
    instruction=load_json(root/'docs/analysis/coverage/instruction-summary.json')
    complement=load_json(root/'docs/analysis/coverage/unwind-complement-summary.json')
    for item in (instruction,complement):
        require(item['target']['sha256']==target['sha256'], 'Independent reference target differs')
    for name,summary in [('instruction-summary',instruction),('unwind-complement-summary',complement),
                         ('diagnostic-ownership',load_json(root/'docs/analysis/coverage/diagnostic-ownership.json'))]:
        binding=record['independent_inputs'][name]
        source=root/'docs/analysis/coverage'/f'{name}.json'
        require(summary['target']==record['target'], 'Independent inventory target differs: '+name)
        require(binding['summary']==dict(path=source.relative_to(root).as_posix(),sha256=file_sha256(source)),
                'Independent summary commitment differs: '+name)
        require(binding['inventory']==dict(path=summary['inventory']['path'],sha256=summary['inventory']['sha256']),
                'Independent inventory does not match owning summary: '+name)
        require(binding['summary'] in record['inputs'] and binding['inventory'] in record['inputs'],
                'Independent inventory missing from consumed commitments: '+name)
    kinds=instruction['counts']['reference_kinds']
    require(rows['declared-indirect-sites.tsv.gz']['rows']==kinds['call_indirect']+kinds['jump_indirect'],
            'Declared indirect selector differs')
    require(rows['declared-reference-roles.tsv.gz']['rows']==sum(kinds.values()), 'Declared reference selector differs')
    kinds=complement['counts']['reference_kinds']
    require(rows['complement-indirect-sites.tsv.gz']['rows']==kinds.get('call_indirect',0)+kinds['jump_indirect'],
            'Complement indirect selector differs')
    require(rows['complement-reference-roles.tsv.gz']['rows']==sum(kinds.values()), 'Complement reference selector differs')
    require(rows['complement-stops.jsonl.gz']['rows']==sum(complement['counts']['stop_reasons'].values()),
            'Complement stop selector differs')
    require(rows['complement-region-roles.tsv.gz']['rows']==complement['counts']['complement_regions'],
            'Complement region selector differs')
    require(rows['declared-extent-roles.tsv.gz']['rows']==instruction['counts']['unwind_extents'],
            'Declared extent selector differs')
    if artifacts:
        for item in [record['generator'],*record['dependencies'],*record['inputs'],*rows.values()]:
            path=artifact_path(item['path'])
            require(path.is_file() and file_sha256(path)==item['sha256'], 'Changed residual commitment: '+item['path'])
        for name,item in rows.items():
            with gzip.open(artifact_path(item['path']),'rt') as stream:
                observed=sum(1 for _ in stream)-(1 if name.endswith('.tsv.gz') else 0)
            require(observed==item['rows'], 'Truncated/extra residual rows: '+name)
    return len(rows)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof',required=True)
    parser.add_argument('--census-summary',default='docs/analysis/coverage/full-image-census.json')
    parser.add_argument('--negative-tests',action='store_true')
    args=parser.parse_args()
    record=load_json(project_path(args.proof));target=latest_target(verify=True)
    census_path=project_path(args.census_summary)
    census=load_json(census_path)
    def check(value, *, artifacts=True):
        return validate(value,target,census,artifacts=artifacts,census_summary=args.census_summary)
    total=check(record)
    negative=0
    if args.negative_tests:
        for field,value in [('source_semantics_complete',True),('global_aliasing_complete',True),
                            ('computed_runtime_targets_complete',True),('parity_verified',True)]:
            changed=deepcopy(record);changed[field]=value
            try:check(changed,artifacts=False)
            except ValueError:negative+=1
            else:raise ValueError('Optimistic completion was accepted')
        changed=deepcopy(record);changed['counts']['static_reference_records']-=1
        try:check(changed,artifacts=False)
        except ValueError:negative+=1
        else:raise ValueError('Truncated reference total was accepted')
        changed=deepcopy(record);changed['target']['sha256']='0'*64
        try:check(changed,artifacts=False)
        except ValueError:negative+=1
        else:raise ValueError('Wrong target was accepted')
        changed=deepcopy(record);changed['independent_inputs']['instruction-summary']['inventory']['sha256']='0'*64
        try:check(changed,artifacts=False)
        except ValueError:negative+=1
        else:raise ValueError('Same-target substituted inventory was accepted')
        changed=deepcopy(record)
        receipt=dict(path=census_path.relative_to(ROOT).as_posix(),sha256=file_sha256(census_path))
        changed['inputs']=[dict(item,sha256='0'*64) if item==receipt else item for item in changed['inputs']]
        try:check(changed,artifacts=False)
        except ValueError:negative+=1
        else:raise ValueError('Wrong owning census receipt was accepted')
    print(f'PASS: {total} complete residual artifacts, independent census/linear/complement selector counts; {negative} negative cases. Semantics/runtime/parity remain open.')


if __name__=='__main__':
    main()
