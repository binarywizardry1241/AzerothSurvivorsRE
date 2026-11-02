#!/usr/bin/env python3
"""Join Survivors diagnostic sites to verified code and reviewed source groups."""
import argparse
from collections import Counter
import gzip
import hashlib
import importlib.util
from coverage_common import ROOT,latest_target,load_json,json_text,file_sha256,project_path
from script_sources import current_path

GENERATOR_SHA256=file_sha256(ROOT/'scripts/summarize-custom-native-coverage.py')
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value

def current_source_candidate(reference):
    """Hash the resolved live candidate without relabeling historical source."""
    original=project_path(reference)
    resolved=project_path(current_path(original,ROOT))
    result={'source_file':resolved.relative_to(ROOT).as_posix(),'candidate_sha256':file_sha256(resolved)}
    if resolved!=original:
        result['source_reference']=reference
        result['resolution_role']='Current source candidate reached through a historical script alias; not historical execution-source equivalence.'
    return result

def semantic_projection(systems,names,source_hash=None):
    rows=[]
    for row in systems['systems']:
        if row.get('original_path') not in names:continue
        refs=row.get('source_refs',[]);anchors=row.get('source_review_anchors',[])
        files=sorted(set(refs)|{anchor['path'] for anchor in anchors})
        rows.append({'original_path':row['original_path'],'source_refs':refs,'source_review_anchors':anchors,
            'source_candidate_hashes':[{'source_file':name,'candidate_sha256':source_hash(name)} if source_hash else current_source_candidate(name) for name in files]})
    if len(rows)!=len(names):raise ValueError('Custom semantic mapping is incomplete or duplicated')
    return sorted(rows,key=lambda row:row['original_path'])

def reviewed_source_candidates(systems,diagnostics,owner):
    """Analyst correspondence is independent of native semantic classification."""
    by_path={row['original_path']:row for row in systems['systems'] if row.get('original_path')}
    result={}
    for diagnostic in diagnostics:
        if not diagnostic['custom_game_crate']:continue
        name=diagnostic['path']
        if name not in by_path:raise ValueError('Custom source correspondence is absent')
        row=by_path[name]
        owners={owner(int(reference['instruction_address'],16)) for reference in diagnostic['verified_references']}
        result[name]={'reconstruction_system':row['id'],'path_evidence_role':'reviewed-source-correspondence-candidate-not-native-semantics',
            'reconstruction_source_refs':row.get('source_refs',[]),'expanded_native_reference_owners':len(owners-{None})}
    return result

def reference_join(diagnostics,observed,owner,candidates,excluded=None):
    """References and native bodies have independent, explicitly counted roles."""
    paths=[];sites=[];owners=set();location_owners=set();unique_sites=set();excluded=excluded or set();consumed_exclusions=set()
    for diagnostic in diagnostics:
        if not diagnostic['custom_game_crate']:continue
        name=diagnostic['path'];candidate=candidates[name];counts=Counter()
        for reference in diagnostic['verified_references']:
            site=int(reference['instruction_address'],16);current=observed.get(site);native_owner=owner(site)
            if current is not None and current!=reference['instruction_bytes']:raise ValueError('Custom diagnostic source bytes differ')
            decoded=current is not None;unique_sites.add(site);counts['reference_records']+=1;counts['exact_decoded_instruction_sites']+=decoded
            counts['reference_records_with_body_owner']+=native_owner is not None;counts['reference_records_without_body_owner']+=native_owner is None
            if native_owner is not None:owners.add(native_owner)
            kind=reference['kind']
            if kind not in ('rust_location','path_literal'):raise ValueError('Unsupported custom reference kind')
            role='native-location-reference' if kind=='rust_location' else 'literal-path-candidate'
            if (site,name) in excluded:
                if kind=='rust_location':raise ValueError('A literal exclusion cannot remove a native Location')
                role='proved-adjacent-literal-reference';counts['proved_adjacent_literal_references']+=1;consumed_exclusions.add((site,name))
            prefix='native_location' if kind=='rust_location' else 'path_literal_candidate'
            counts[prefix+'_reference_records']+=1;counts[prefix+'_records_with_body_owner']+=native_owner is not None;counts[prefix+'_records_without_body_owner']+=native_owner is None
            if kind=='rust_location' and native_owner is not None:location_owners.add(native_owner)
            if kind=='path_literal' and reference.get('target_address') and reference.get('path_address'):
                counts['literal_candidates_at_filename_start' if reference['target_address']==reference['path_address'] else 'literal_candidates_near_filename']+=1
            sites.append({'path':name,'site':hex(site),'instruction_bytes':reference['instruction_bytes'],'exact_decoded_instruction':decoded,'actual_native_owner':hex(native_owner) if native_owner is not None else None,
                'reference_kind':kind,'diagnostic_site_role':role,
                'declared_extent_start':reference.get('runtime_function_start'),'declared_extent_end_exclusive':reference.get('runtime_function_end'),
                'native_source_line':reference.get('source_line'),'native_source_column':reference.get('source_column')})
        paths.append({'path':name,'system':candidate['reconstruction_system'],'path_evidence_role':candidate['path_evidence_role'],
            'source_mapping_present':bool(candidate['reconstruction_source_refs']),'reconstruction_source_ref_count':len(candidate['reconstruction_source_refs']),
            'expanded_native_reference_owner_count':candidate['expanded_native_reference_owners'],'counts':dict(counts),'native_source_semantics_established':False})
    totals=Counter()
    for row in paths:totals.update(row['counts'])
    if consumed_exclusions!=excluded:raise ValueError('Literal exclusion is not an exact custom reference')
    return paths,sites,{'custom_paths':len(paths),'custom_paths_with_source_correspondence':sum(row['source_mapping_present'] for row in paths),
        'custom_paths_without_source_correspondence':sum(not row['source_mapping_present'] for row in paths),'custom_paths_with_all_reference_sites_decoded':sum(row['counts'].get('reference_records',0)==row['counts'].get('exact_decoded_instruction_sites',0) for row in paths),
        'unique_instruction_sites':len(unique_sites),'distinct_actual_native_owners':len(owners),
        'custom_paths_with_native_location_references':sum(row['counts'].get('native_location_reference_records',0)>0 for row in paths),
        'custom_paths_with_native_location_body_owners':sum(row['counts'].get('native_location_records_with_body_owner',0)>0 for row in paths),
        'distinct_native_location_body_owners':len(location_owners),**dict(totals)}

def main():
    parser=argparse.ArgumentParser(description=__doc__);selection=parser.add_mutually_exclusive_group();selection.add_argument('--classification');selection.add_argument('--census-summary',help='Current independently verified census without asserting a current semantic classifier');parser.add_argument('--output',help='Compact report output; defaults to selected target evidence directory');parser.add_argument('--site-role-proof');parser.add_argument('--write',action='store_true');args=parser.parse_args()
    target=latest_target();inputs=[];classification=None
    if args.census_summary:
        census_path=project_path(args.census_summary)
    else:
        classification_path=project_path(args.classification or 'docs/analysis/coverage/native-ownership-classification.json');classification_digest=file_sha256(classification_path);classification=load_json(classification_path)
        if classification['target']['sha256']!=target['sha256']:raise ValueError('Current verified census/classification required; use --census-summary for independent diagnostic/source joining')
        census_path=project_path(classification['census_summary']);inputs.append({'path':classification_path.relative_to(ROOT).as_posix(),'sha256':classification_digest})
    census_digest=file_sha256(census_path);census=load_json(census_path)
    if (classification is not None and census_digest!=classification['census_summary_sha256']) or census.get('target')!={key:target[key] for key in ('version','path','sha256','size_bytes')} or not census['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('Current verified census/classification required')
    diagnostic_path=ROOT/f"runtime/coverage/{target['sha256']}/diagnostic-ownership.json";diagnostic_digest=file_sha256(diagnostic_path);diagnostic=load_json(diagnostic_path)
    if diagnostic['target']['sha256']!=target['sha256']:raise ValueError('Custom diagnostic target differs')
    candidates=None
    if classification is not None:
        source=classification['source_candidates']['audit'];source_path=project_path(source['path'])
        if file_sha256(source_path)!=source['sha256']:raise ValueError('Source candidate inventory differs')
        candidates={row['diagnostic_path']:row for row in load_json(source_path)['paths']};inputs.append(source)
    systems_path=ROOT/'docs/analysis/coverage/systems.json';systems=load_json(systems_path);names={row['path'] for row in diagnostic['diagnostics'] if row['custom_game_crate']}
    if systems.get('target')!={key:target[key] for key in ('version','path','sha256','size_bytes')}:raise ValueError('Current source mapping target differs')
    projection=semantic_projection(systems,names)
    if candidates is not None:
        for row in projection:
            if candidates[row['original_path']]['reconstruction_source_refs']!=row['source_refs']:raise ValueError('Custom classification source mapping is stale')
    inputs.extend([{'path':census_path.relative_to(ROOT).as_posix(),'sha256':census_digest},{'path':diagnostic_path.relative_to(ROOT).as_posix(),'sha256':diagnostic_digest}])
    dependencies=[{'path':name,'sha256':file_sha256(ROOT/name)} for name in ('scripts/summarize-native-image.py','scripts/script_sources.py','docs/analysis/script-provenance.json')]
    excluded=set();site_role_input=None
    if args.site_role_proof:
        proof_path=project_path(args.site_role_proof);site_role_input={'path':proof_path.relative_to(ROOT).as_posix(),'sha256':file_sha256(proof_path)}
        helper_path='scripts/check-native-custom-site-roles.py';dependencies.append({'path':helper_path,'sha256':file_sha256(ROOT/helper_path)})
        roles=module('custom_native_roles',helper_path);excluded=roles.verify_inventory(load_json(proof_path),target);inputs.append(site_role_input)
    directory=project_path(census['artifacts']['directory']);helper=module('custom_native_bodies','scripts/summarize-native-image.py')
    for name in ('instructions.tsv.gz','bodies.tsv.gz'):
        path=directory/name;expected=census['artifacts']['files'][name]['sha256']
        if file_sha256(path)!=expected:raise ValueError('Custom census artifact differs')
        inputs.append({'path':path.relative_to(ROOT).as_posix(),'sha256':expected})
    owner=helper.owner_lookup([(int(row['start'],16),int(row['end'],16),int(row['entry'],16)) for row in helper.rows(directory/'bodies.tsv.gz') if row['external']=='false'])
    if candidates is None:candidates=reviewed_source_candidates(systems,diagnostic['diagnostics'],owner)
    wanted={int(reference['instruction_address'],16) for row in diagnostic['diagnostics'] if row['custom_game_crate'] for reference in row['verified_references']};observed={}
    with gzip.open(directory/'instructions.tsv.gz','rt') as stream:
        fields=next(stream).rstrip('\n').split('\t');address_index=fields.index('address');bytes_index=fields.index('bytes')
        for line in stream:
            values=line.rstrip('\n').split('\t');site=int(values[address_index],16)
            if site in wanted:observed[site]=values[bytes_index]
            if len(observed)==len(wanted):break
    paths,sites,counts=reference_join(diagnostic['diagnostics'],observed,owner,candidates,excluded)
    inventory=directory/'custom-diagnostic-sites.json';raw=json_text({'target':census['target'],'reference_records':sites});projection_path=directory/'custom-source-mapping.json';projection_raw=json_text(projection)
    report={'schema_version':1,'target':census['target'],'generator':{'path':'scripts/summarize-custom-native-coverage.py','sha256':GENERATOR_SHA256},'generator_dependencies':dependencies,
        'inputs':inputs,'counts':counts,'paths':paths,'inventory':{'path':inventory.relative_to(ROOT).as_posix(),'sha256':hashlib.sha256(raw.encode()).hexdigest()},
        'semantic_site_role_input':site_role_input,
        'source_mapping_review':{'systems_path':systems_path.relative_to(ROOT).as_posix(),'projection_fields':['original_path','source_refs','source_review_anchors','source_candidate_hashes'],
            'projection_sha256':hashlib.sha256(projection_raw.encode()).hexdigest(),'snapshot':{'path':projection_path.relative_to(ROOT).as_posix(),'sha256':hashlib.sha256(projection_raw.encode()).hexdigest()},
            'source_hash_role':'Reviewed analyst source correspondence candidates; no whole-function or runtime equivalence claim.'},
        'scope':'Azeroth Survivors custom deltas over the existing public benilla/wenilla baseline. Generic engine/compiler/Windows reconstruction is not a prerequisite.',
        'whole_custom_behavior_recovered':False,'parity_verified':False,'limits':['A source correspondence and decoded diagnostic instruction do not establish whole-function semantics, dispatch completeness or gameplay parity.',
            'Ownerless decoded custom blocks remain explicit recovery leads for their actual Survivors mechanisms; enclosing PE unwind ranges are never assigned as body owners.',
            'The path inventory cannot prove absence of systems that emit no diagnostic filename. Their discovery remains an AS-specific evidence question, not a mandate to reconstruct the engine.']}
    if file_sha256(ROOT/'scripts/summarize-custom-native-coverage.py')!=GENERATOR_SHA256 or any(file_sha256(project_path(row['path']))!=row['sha256'] for row in inputs+dependencies):raise ValueError('Custom coverage input/generator drift')
    if semantic_projection(load_json(systems_path),names)!=projection:raise ValueError('Custom semantic mapping changed during audit')
    output=project_path(args.output or f"docs/analysis/evidence/{target['version']}/native-custom-coverage.json")
    if args.write:inventory.write_text(raw);projection_path.write_text(projection_raw);output.parent.mkdir(parents=True,exist_ok=True);output.write_text(json_text(report))
    print(json_text(counts))
if __name__=='__main__':main()
