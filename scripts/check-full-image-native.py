#!/usr/bin/env python3
"""Validate current native census derivatives without replaying native analysis.

Supporting profiles retain their actual historical tool commitments. The final
classification selects the current census; current derivative generators, exact
target identity and available hash-bound input/output artifacts must agree.
Use --write to publish the validated canonical selection.
"""
import argparse
import re
import hashlib
import json
import subprocess
import importlib.util
from pathlib import Path
from artifact_history import archived_artifact, has_archived_artifact
from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, project_bytes, project_path, same_artifact, target_bytes
from instruction_facts import derived_json
from runtime_layout import retained_runtime_path
from script_sources import historical_matches

COVERAGE = 'docs/analysis/coverage'
CANONICAL_CENSUS = COVERAGE + '/full-image-selected.json'
SELECTOR = COVERAGE + '/native-image-current.json'


def retained_file(path, root):
    return path.is_file() or has_archived_artifact(path, root)


def retained_json(path, digest, root):
    if not path.is_file() and has_archived_artifact(path, root):
        return json.loads(project_bytes(path, expected=digest, root=root))
    return load_json(path)


def bound_path(value,digest,findings,root=ROOT,label='native artifact',optional_runtime=True,executed_tools=None):
    path=(root/value).resolve()
    confined=path.is_relative_to(root.resolve())
    findings.require(confined,'full_native_boundary',f'{label}: path escapes project: {value}')
    valid_digest=isinstance(digest,str) and re.fullmatch('[0-9a-f]{64}',digest) is not None
    findings.require(valid_digest,'full_native_commitment',f'{label}: invalid SHA-256')
    if not confined or not valid_digest:return None
    path=retained_runtime_path(path,root).resolve()
    if not path.is_relative_to(root.resolve()):
        findings.require(False,'full_native_boundary',f'{label}: retained path escapes project: {value}')
        return None
    if not path.is_file() and has_archived_artifact(path,root):
        try:
            exact=archived_artifact(path,digest,root) is not None
        except ValueError:
            exact=False
        findings.require(exact,'full_native_integrity',f'{label}: historical digest differs: {value}')
    elif not path.is_file() and historical_matches(value,digest,root):
        findings.warn('historical_script_source',f'{label}: exact execution source retained in Git: {value}')
    elif path.is_file():
        exact=file_sha256(path)==digest
        historical=(value,digest) in (executed_tools or {})
        if not exact and historical_matches(value,digest,root):
            historical=True
            findings.warn('historical_script_source',f'{label}: current script replaced; exact execution source retained in Git: {value}')
        findings.require(exact or historical,'full_native_integrity',f'{label}: digest differs: {value}')
        if not exact and historical:findings.warn('historical_executed_tool',f'{label}: retained exact committed execution source for {value}; current source differs')
    elif optional_runtime and path.is_relative_to(root/'runtime'):findings.warn('disposable_inventory_absent',f'{label}: recreate {value} before querying its native observations')
    else:findings.require(False,'full_native_integrity',f'{label}: missing {value}')
    return path

def references(value,findings,root,label,executed_tools=None):
    if isinstance(value,dict):
        if 'path' in value and 'sha256' in value:bound_path(value['path'],value['sha256'],findings,root,label,executed_tools=executed_tools)
        for key,child in value.items():
            if key!='target':references(child,findings,root,label+'/'+key,executed_tools)
    elif isinstance(value,list):
        for child in value:references(child,findings,root,label,executed_tools)

def executed_tool_sources(binding,selected,findings,root=ROOT):
    """Accept old execution tooling only through exact committed source bytes.

    The witness is bound to one immutable census. It never relaxes validation
    of current classification, historical-audit or operand-audit generators.
    """
    if not binding:return {}
    path=bound_path(binding['path'],binding['sha256'],findings,root,'executed tool source witnesses',False)
    if path is None or not retained_file(path,root):return {}
    record=retained_json(path,binding['sha256'],root);census=record.get('census',{})
    matches=(census.get('sha256')==selected['sha256']
             and (census.get('path')==selected['path']
                  or same_artifact(census.get('path'),selected['path'],selected['sha256'],root)))
    findings.require(matches,'full_native_execution_source','Execution source witnesses select another census')
    if not matches:return {}
    accepted={}
    for row in record.get('tools',[]):
        name,digest,commit=row.get('path',''),row.get('sha256',''),row.get('git_commit','')
        confined=(root/name).resolve().is_relative_to((root/'scripts').resolve())
        valid=confined and bool(re.fullmatch('[0-9a-f]{64}',digest)) and bool(re.fullmatch('[0-9a-f]{40}',commit))
        findings.require(valid,'full_native_execution_source','Invalid committed execution tool witness')
        if not valid:continue
        result=subprocess.run(['git','cat-file','blob',commit+':'+name],cwd=root,capture_output=True)
        exact=result.returncode==0 and hashlib.sha256(result.stdout).hexdigest()==digest
        findings.require(exact,'full_native_execution_source','Committed execution source bytes differ or are unavailable: '+name)
        if exact:accepted[(name,digest)]=commit
    return accepted

def identity(record,target,findings,label):
    findings.require(all(record.get('target',{}).get(key)==target.get(key) for key in ('version','path','sha256','size_bytes')),
        'full_native_target',f'{label}: selected target identity differs')

def review_source_candidates(rows,findings,root=ROOT):
    for row in rows:
        source=row.get('source_candidate',{})
        if not source:continue
        path=(root/source['path']).resolve();confined=path.is_relative_to(root.resolve())
        findings.require(confined,'full_native_boundary','Native source candidate escapes project')
        if confined and (not path.is_file() or file_sha256(path)!=source['sha256']):
            findings.warn('stale_source_review','Native source candidate changed since its audit; re-audit before claiming exact source bytes: '+source['path'])

def review_operand_union(binding,selected,target,findings,root=ROOT):
    findings.require(bool(binding),'full_native_operand_union','Current native classification lacks the full explicit-operand union')
    if not binding:return
    audit_path=bound_path(binding['audit']['path'],binding['audit']['sha256'],findings,root,'current explicit-operand audit',False)
    if audit_path is None or not retained_file(audit_path,root):return
    audit=retained_json(audit_path,binding['audit']['sha256'],root);identity(audit,target,findings,'explicit-operand audit')
    findings.require(audit.get('generator',{}).get('path')=='scripts/audit-native-operands.py' and bool(audit.get('generator_dependencies')),'full_native_operand_union','Explicit operand audit lacks current generator/dependency commitments')
    references({key:value for key,value in audit.items() if key!='target'},findings,root,'explicit-operand audit')
    source=audit.get('source_census',{})
    findings.require(source.get('sha256')==selected['sha256'] and same_artifact(source.get('path'),selected['path'],selected['sha256'],root),
        'full_native_operand_union','Explicit-operand audit must use the exact selected census')
    findings.require(binding.get('inventory')==audit.get('inventory'),'full_native_operand_union','Classification and explicit-operand inventory commitments differ')

def review_guarded_table_encoding(payload,target,findings,image=None,pe=None,expected_tables=None):
    """Recheck trusted producer output at the selected-census admission boundary.

    Java and historical summaries retain their original execution commitments;
    current verification independently binds every supplied case to raw bytes.
    """
    identity(payload,target,findings,'selected guarded table inventory')
    if any(payload.get('target',{}).get(key)!=target.get(key) for key in ('version','path','sha256','size_bytes')):return
    data=pe.data if pe is not None and image is None else target_bytes(target) if image is None else image
    exact=len(data)==target['size_bytes'] and hashlib.sha256(data).hexdigest()==target['sha256']
    findings.require(exact,'full_native_guarded_encoding','Selected guarded table validation target bytes differ')
    if not exact:return
    def module(name,path):
        spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value
    verifier=module('full_census_table_encoding','scripts/native_dispatch_validation.py')
    if pe is None:pe=module('full_census_table_pe','scripts/inventory-executable.py').PE(data)
    if expected_tables is not None:findings.require(len(payload['tables'])==expected_tables,'full_native_guarded_encoding','Selected guarded table count differs from verified census')
    for table in payload['tables']:
        try:verifier.verify_table_encoding(table,pe)
        except (ValueError,KeyError,TypeError) as error:
            findings.require(False,'full_native_guarded_encoding',f"Selected guarded table {table.get('site','<missing>')}: {error}")

def census_snapshot_ref(value,directory,root,filename):
    """Resolve the collector's fixed snapshot name without rebinding its hash.

    Saved plans keep their original absolute paths. A linked or moved checkout
    replays the same committed input beside that plan, inside its own runtime.
    """
    if Path(value).name!=filename:
        raise ValueError('Unexpected census input snapshot name: '+str(value))
    return str((directory/filename).relative_to(root))

def census_artifacts(record,target,findings,root,current=False,executed_tools=None,image=None):
    identity(record,target,findings,'full-image census')
    references({key:value for key,value in record.items() if key!='target' and (current or key not in ('generator','curation_generator'))},findings,root,'full-image census',executed_tools if current else None)
    artifacts=record['artifacts'];directory=(root/artifacts['directory']).resolve()
    runtime_directory=retained_runtime_path(directory,root)
    findings.require(directory.is_relative_to(root/'runtime'),'full_native_boundary','Full census inventories must stay in runtime')
    for name,key in (('plan.json','plan_sha256'),('progress.json','progress_sha256'),('session-result.json','session_result_sha256')):
        if key in artifacts:bound_path(str((directory/name).relative_to(root)),artifacts[key],findings,root,name)
        elif current:findings.require(False,'full_native_commitment',f'Current census lacks {name} commitment')
    for name,commitment in artifacts['files'].items():bound_path(str((directory/name).relative_to(root)),commitment['sha256'],findings,root,name)
    findings.require(record.get('independent_instructions',{}).get('exact_source_bytes_verified') is True,'full_native_verification','Census lacks independent instruction verification')
    if current:
        collector='scripts/ghidra/ReaNativeCensus.java'
        observed=record.get('profile',{}).get('script_sha256')
        current_source=observed==file_sha256(root/collector)
        retained_source=historical_matches(collector,observed,root)
        findings.require(current_source or retained_source,'full_native_generator',
            'Selected full-image collector source is unavailable or its bytes differ')
        if not current_source and retained_source:
            findings.warn('historical_executed_tool',
                'Frozen census retains its exact original collector in Git; new shared collector execution remains unverified')
        plan_path=runtime_directory/'plan.json'
        if plan_path.exists():
            plan=load_json(plan_path)
            findings.require(plan.get('target_sha256')==target['sha256'],'full_native_target','Selected census plan target differs')
            for name,digest in plan.get('tooling',{}).items():bound_path(name,digest,findings,root,'selected collector tooling',False,executed_tools)
            bound_path(census_snapshot_ref(plan['starts'],directory,root,'starts.tsv'),plan['starts_sha256'],findings,root,'selected starts')
            if plan.get('jump_tables'):
                entry=plan['jump_tables'];path=bound_path(census_snapshot_ref(entry['path'],directory,root,'guarded-tables-input.json'),entry['sha256'],findings,root,'selected guarded table input')
                if path is not None and path.is_file():review_guarded_table_encoding(load_json(path),target,findings,image=image,expected_tables=record.get('guarded_flow_observations',{}).get('guarded_tables'))
            if plan.get('import_thunks'):
                entry=plan['import_thunks'];path=bound_path(entry['path'],entry['sha256'],findings,root,'selected import-thunk input')
                if path is not None and path.is_file():references(load_json(path),findings,root,'selected import-thunk proof')
            if plan.get('address_leads'):
                entry=plan['address_leads'];path=bound_path(census_snapshot_ref(entry['path'],directory,root,'address-code-input.json'),entry['sha256'],findings,root,'selected address-code leads')
                if path is not None and path.is_file():references(load_json(path),findings,root,'selected address-code proof',executed_tools)
            if plan.get('unwind_handlers'):
                entry=plan['unwind_handlers'];path=bound_path(entry['path'],entry['sha256'],findings,root,'selected PE metadata entries')
                if path is not None and path.is_file():references(load_json(path),findings,root,'selected PE metadata proof')
    return record.get('counts',{})

def retain_unselected_historical_profile(record,target,current,findings,label):
    """Other-target supporting profiles retain their own immutable identity."""
    digest=record.get('target',{}).get('sha256')
    historical=not current and isinstance(digest,str) and re.fullmatch('[0-9a-f]{64}',digest) is not None and digest!=target.get('sha256')
    if historical:findings.warn('historical_native_profile_unapplied',f"{label}: retained historical target {record['target'].get('version','unknown')}/{digest}; its observations are not applied to the current target")
    return historical


def validate(target,findings,root=ROOT,selection=None,required=False,image=None):
    coverage=root/COVERAGE;result={}
    if selection is None:
        selection_path=root/SELECTOR
        if not selection_path.is_file():
            if required:findings.require(False,'full_native_selection','Shared accounting selects a missing native-image-current.json')
            else:findings.warn('native_analysis_unpublished','Whole-image derivatives have no final current selector; no new native completeness is accounted')
            return result
        selection=load_json(selection_path)
    identity(selection,target,findings,'current native-image selector');references({key:value for key,value in selection.items() if key!='target'},findings,root,'current native-image selector')
    executed_tools=executed_tool_sources(selection.get('executed_tool_sources'),selection['records']['census'],findings,root)
    classification_path=(root/selection['records']['classification']['path']).resolve()
    selected=(root/selection['records']['census']['path']).resolve()
    if retained_file(classification_path,root):
        classification=retained_json(classification_path,selection['records']['classification']['sha256'],root);identity(classification,target,findings,'native ownership classification')
        review_operand_union(classification.get('explicit_operand_union'),selection['records']['census'],target,findings,root)
        references({key:value for key,value in classification.items() if key!='target'},findings,root,'native ownership classification')
        if image is not None:
            for row in classification.get('debug_identity',{}).get('records',[]):
                offset=int(row['file_offset'],16);raw=image[offset:offset+row['byte_count']]
                findings.require(len(raw)==row['byte_count'] and hashlib.sha256(raw).hexdigest()==row['sha256'],'full_native_integrity','Native debug-record bytes differ')
        classification_census=bound_path(classification['census_summary'],classification['census_summary_sha256'],findings,root,'selected current census',False)
        findings.require(classification['census_summary_sha256']==selection['records']['census']['sha256']
            and same_artifact(classification_census,selected,selection['records']['census']['sha256'],root),
            'full_native_selection','Selector census and classification census commitment differ')
        vendor=classification['source_candidates']
        bound_path('docs/analysis/benilla-vendor.json',vendor['vendor_manifest_sha256'],findings,root,'vendor source baseline',False)
        audit=(root/vendor.get('audit',{}).get('path','runtime/absent-native-source-audit')).resolve()
        rows=load_json(audit)['paths'] if retained_file(audit,root) else vendor.get('paths',[])
        review_source_candidates(rows,findings,root)
        result['ownership']=classification['indirect_counts']
    current_record=None
    for path in sorted(set(coverage.glob('full-image-*.json'))|{selected}):
        if not retained_file(path,root):continue
        current=path.resolve()==selected
        record=retained_json(path,selection['records']['census']['sha256'],root) if current else load_json(path)
        if 'artifacts' not in record:continue
        if retain_unselected_historical_profile(record,target,current,findings,str(path.relative_to(root))):
            result.setdefault('historical_profiles_unapplied',[]).append({'path':path.relative_to(root).as_posix(),'target':record['target']})
            continue
        counts=census_artifacts(record,target,findings,root,current,executed_tools,image)
        if current:result['selected_census']=counts;current_record=record
    findings.require(current_record is not None,'full_native_selection','Selected current census is missing')
    for role in ('jump_tables','historical_ranges'):
        path=(root/selection['records'][role]['path']).resolve();name=path.name
        if not retained_file(path,root):continue
        record=retained_json(path,selection['records'][role]['sha256'],root);identity(record,target,findings,name)
        references({key:value for key,value in record.items() if key!='target'},findings,root,name,executed_tools if role=='jump_tables' else None)
        if 'census_summary' in record:bound_path(record['census_summary'],record['census_summary_sha256'],findings,root,name+' source census',False)
        if role=='jump_tables' and current_record is not None:
            findings.require(record.get('edge_digest')==current_record.get('guarded_edge_digest'),'full_native_flow','Current switch proofs differ from applied selected-census edges; follow the new edges before selection')
        if role=='historical_ranges':
            body=record.get('current_native_body_census',{})
            findings.require(body.get('sha256')==selection['records']['census']['sha256']
                and same_artifact(body.get('path'),selected,selection['records']['census']['sha256'],root),
                'full_native_selection','Historical match ownership must use the selected current census')
            inventory=retained_runtime_path((root/record['inventory']['path']).resolve(),root)
            if retained_file(inventory,root):
                inventory_record=retained_json(inventory,record['inventory']['sha256'],root)
                references(inventory_record.get('preimage_inputs',[]),findings,root,'historical preimage sources')
        result[name]=record['counts']
    return result


class SelectionFindings:
    def __init__(self):
        self.errors = []
        self.warnings = []

    def require(self, condition, category, detail):
        if not condition:
            self.errors.append(f'{category}: {detail}')

    def warn(self, category, detail):
        self.warnings.append(f'{category}: {detail}')


def candidate_selection(target, witness=None):
    classification_path = COVERAGE + '/native-ownership-classification.json'
    classification = load_json(ROOT / classification_path)
    census = classification['census_summary']
    digest = classification['census_summary_sha256']
    if not same_artifact(census, CANONICAL_CENSUS, digest):
        raise ValueError('Review and publish the classification census at ' + CANONICAL_CENSUS + ' before selection')
    paths = {'classification': classification_path, 'census': CANONICAL_CENSUS,
             'jump_tables': COVERAGE + '/native-jump-tables.json',
             'historical_ranges': COVERAGE + '/historical-range-revalidation.json'}
    generator = Path(__file__).resolve()
    selection = {'schema_version': 1, 'target': {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
                 'generator': {'path': generator.relative_to(ROOT).as_posix(), 'sha256': file_sha256(generator)},
                 'records': {role: {'path': path, 'sha256': file_sha256(ROOT / path)} for role, path in paths.items()},
                 'gap_ids': [41], 'source_semantics_complete': False, 'global_aliasing_complete': False, 'parity_verified': False}
    if witness:
        path = project_path(witness)
        selection['executed_tool_sources'] = {'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)}
    return selection


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true', help='Publish the validated canonical selector')
    parser.add_argument('--executed-tool-sources', help='Census-bound witness for exact historical execution-tool bytes')
    args = parser.parse_args()
    target = latest_target()
    selection = candidate_selection(target, args.executed_tool_sources)
    findings = SelectionFindings()
    validate(target, findings, selection=selection)
    if findings.errors:
        raise ValueError('\n'.join(findings.errors))
    if args.write:
        derived_json(ROOT / SELECTOR, selection, publish=True)
    print(json_text({'status': 'selected' if args.write else 'validated', 'warnings': findings.warnings,
                     'records': {role: row['path'] for role, row in selection['records'].items()}}))


if __name__ == '__main__':
    main()
