#!/usr/bin/env python3
"""Separate exact diagnostic code leads from decoded owners and conflicts.

Only hash-verified RIP-relative diagnostic/Location instruction references are
eligible. Undecoded, nonconflicting sites can seed code; declared extents never
become invented function owners or incoming control-flow edges.
"""
import argparse
from bisect import bisect_left
from collections import Counter
import gzip
import importlib.util
from coverage_common import ROOT,latest_target,target_bytes,load_json,json_text,file_sha256,project_path

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--census-summary',default='docs/analysis/coverage/full-image-switches-v2.json');parser.add_argument('--inventory-output',help='Project-local inventory path; defaults beside the source census');parser.add_argument('--write',action='store_true');args=parser.parse_args()
    target=latest_target();summary=load_json(project_path(args.census_summary))
    if summary['target']['sha256']!=target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('A current independently verified census is required')
    directory=project_path(summary['artifacts']['directory'])
    for name in ('bodies.tsv.gz','instructions.tsv.gz'):
        if file_sha256(directory/name)!=summary['artifacts']['files'][name]['sha256']:raise ValueError('Census input differs')
    spec=importlib.util.spec_from_file_location('diagnostic_body_index',ROOT/'scripts/summarize-native-image.py');helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
    owner=helper.owner_lookup([(int(row['start'],16),int(row['end'],16),int(row['entry'],16)) for row in helper.rows(directory/'bodies.tsv.gz') if row['external']=='false'])
    source=ROOT/f"runtime/coverage/{target['sha256']}/diagnostic-ownership.json";diagnostics=load_json(source)
    if diagnostics['target']['sha256']!=target['sha256']:raise ValueError('Diagnostic target differs')
    pending={};counts=Counter();paths={}
    for row in diagnostics['diagnostics']:
        path_counts=Counter()
        for reference in row['verified_references']:
            site=int(reference['instruction_address'],16)
            if owner(site) is not None:path_counts['owned']+=1;continue
            pending.setdefault(site,{'instruction_bytes':reference['instruction_bytes'],'diagnostic_paths':set(),'references':[]})['diagnostic_paths'].add(row['path'])
            pending[site]['references'].append(reference);path_counts['unowned']+=1
        paths[row['path']]={'custom':row['custom_game_crate'],'counts':dict(path_counts)}
    ordered=sorted(pending);exact=set();conflicts=set()
    with gzip.open(directory/'instructions.tsv.gz','rt') as stream:
        next(stream)
        for line in stream:
            address,length,*_=line.split('\t',3);start=int(address,16);end=start+int(length)
            index=bisect_left(ordered,start)
            while index<len(ordered) and ordered[index]<end:
                site=ordered[index]
                (exact if site==start else conflicts).add(site);index+=1
    spec=importlib.util.spec_from_file_location('diagnostic_source_pe',ROOT/'scripts/inventory-current-target.py');pe_module=importlib.util.module_from_spec(spec);spec.loader.exec_module(pe_module);pe=pe_module.pe_parser(target_bytes(target))
    records=[];seeds=[]
    for site,row in sorted(pending.items()):
        raw=bytes.fromhex(row['instruction_bytes']);offset=pe.rva_offset(site-pe.image_base)
        if pe.data[offset:offset+len(raw)]!=raw:raise ValueError('Diagnostic instruction commitment differs')
        kind='decoded-without-body-owner' if site in exact else 'conflicts-with-existing-instruction-interior' if site in conflicts else 'undecoded-exact-diagnostic-lead'
        counts[kind]+=1;record={'site':hex(site),'classification':kind,'diagnostic_paths':sorted(row['diagnostic_paths']),'instruction_bytes':row['instruction_bytes']}
        records.append(record)
        if kind=='undecoded-exact-diagnostic-lead':seeds.append(record)
    payload={'target':summary['target'],'census_summary':args.census_summary,'census_summary_sha256':file_sha256(project_path(args.census_summary)),
        'diagnostic_input':{'path':source.relative_to(ROOT).as_posix(),'sha256':file_sha256(source)},
        'generator':{'path':'scripts/prepare-native-diagnostic-leads.py','sha256':file_sha256(ROOT/'scripts/prepare-native-diagnostic-leads.py')},
        'counts':dict(counts),'records':records,'code_only_seeds':seeds,'function_entry_or_incoming_flow_edges_inferred':False}
    output=project_path(args.inventory_output) if args.inventory_output else directory/'diagnostic-code-leads.json'
    if args.write:output.write_text(json_text(payload))
    print(json_text({'counts':dict(counts),'code_only_seeds':len(seeds),'inventory':{'path':output.relative_to(ROOT).as_posix(),'sha256':file_sha256(output) if output.exists() else None}}))
if __name__=='__main__':main()
