#!/usr/bin/env python3
"""Verify/curate complete streaming Ghidra output against selected PE bytes.

Bulk output stays ignored. This checks every exported instruction's bytes,
independent Capstone boundaries, bodies, and graph/reference ownership. It does
not infer source semantics from names or claim indirect alias completeness.
"""
import argparse
from bisect import bisect_right
from collections import Counter
import csv
import gzip
import hashlib
import importlib.util
import sqlite3
from pathlib import Path
import sys
from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path
from portable_paths import portable_record
from derived_gzip import derived_gzip_text
from instruction_facts import BoundaryVerifier, HELPER_SHA256 as FACTS_SHA256, derived_bytes, derived_json, artifact_path
from shared_native_inventory import open_readonly_uri as open_native_inventory, inventory_size
GENERATOR_SHA256=file_sha256(ROOT/'scripts/summarize-native-image.py')
DERIVED_GZIP_SHA256=file_sha256(ROOT/'scripts/derived_gzip.py')


def rows(path):
    with gzip.open(path,'rt',newline='') as stream:
        yield from csv.DictReader(stream,delimiter='\t')


def address(value):
    if not value or ':' in value:return None
    return int(value,16)


def owner_lookup(ranges):
    """Actual disjoint Ghidra body ranges; no unwind-sized replacement bodies."""
    ordered=sorted(ranges)
    if any(a[1]>=b[0] for a,b in zip(ordered,ordered[1:])):
        raise ValueError('Ghidra body ranges overlap; cannot assign unique source owners')
    starts=[row[0] for row in ordered]
    def find(site):
        if site is None:return None
        index=bisect_right(starts,site)-1
        return ordered[index][2] if index>=0 and site<=ordered[index][1] else None
    return find



def merge_ranges(ranges):
    merged=[]
    for start,end in sorted(ranges):
        if merged and start<=merged[-1][1]:merged[-1]=(merged[-1][0],max(end,merged[-1][1]))
        else:merged.append((start,end))
    return merged


def subtract_ranges(ranges,covered):
    """Subtract sorted half-open unions, preserving every unobserved byte."""
    result=[];index=0
    for start,end in ranges:
        cursor=start
        while index<len(covered) and covered[index][1]<=cursor:index+=1
        scan=index
        while scan<len(covered) and covered[scan][0]<end:
            left,right=covered[scan]
            if left>cursor:result.append((cursor,min(left,end)))
            cursor=max(cursor,min(right,end))
            if cursor>=end:break
            scan+=1
        if cursor<end:result.append((cursor,end))
    return result


def executable_missing_partitions(executable,declared,decoded):
    missing=subtract_ranges(merge_ranges(executable),decoded)
    outside=subtract_ranges(missing,merge_ranges(declared))
    return subtract_ranges(missing,outside),outside

def flow_edge_digest(edges):
    return hashlib.sha256('\n'.join(f'{source:x}:{destination:x}' for source,destination in sorted(set(edges))).encode()).hexdigest()

def write_missing_ranges(path,partitions,pe,image,decoder,*,publish=False):
    categories=Counter()
    with derived_gzip_text(path,publish=publish) as out:
        out.write('start\tend_exclusive\tbyte_count\tlocation\tcategory\tsha256\n')
        for location,ranges in partitions:
            for start,end in ranges:
                try:
                    offset=pe.rva_offset(start-pe.image_base);last=pe.rva_offset(end-pe.image_base-1)
                    raw=image[offset:offset+end-start] if last==offset+end-start-1 else b''
                except ValueError:raw=b''
                if len(raw)!=end-start:category='non-file-backed-unknown'
                elif raw==b'\xcc'*len(raw):category='uniform-CC-candidate'
                elif raw==b'\x90'*len(raw):category='uniform-NOP-candidate'
                else:
                    decoded=list(decoder.disasm_lite(raw,start))
                    category='NOP-CC-instruction-candidate' if sum(row[1] for row in decoded)==len(raw) and all(row[2] in ('nop','int3') for row in decoded) else 'mixed-unclassified'
                categories[location+':'+category]+=end-start
                out.write(f'{start:x}\t{end:x}\t{end-start}\t{location}\t{category}\t{hashlib.sha256(raw).hexdigest() if raw else ""}\n')
    return dict(sorted(categories.items()))

def verify_pointer_seeds(plan,target,pe,module,selection,expected_seeds,declared):
    original_body_sha=plan['pointer_selection']['body_summary_sha256']
    primary_summary=plan['pointer_selection'].get('body_summary')
    pointer_starts,commitment=selection.pointer_leaf_starts(target,pe,module,original_body_sha,primary_summary=primary_summary)
    if commitment!=plan['pointer_selection']:raise ValueError('Pointer leaf selection commitment differs')
    if plan['seed_scope']=='pointers':return pointer_starts
    owned,_=selection.observed_body_index(target,original_body_sha,primary_summary=primary_summary)
    return {value for value in expected_seeds if value in declared or not owned(value)}|pointer_starts


def complement_seed_targets(commitment, alternate=None):
    database = project_path(alternate or commitment['path'])
    if file_sha256(database) != commitment['sha256']:
        raise ValueError('Complement seed inventory differs')
    with open_native_inventory(database.as_uri() + '?mode=ro', uri=True) as connection:
        return {row[0] for row in connection.execute('select distinct target from seeds')}


def summarize(directory,target,check_instructions=True,*,publish=False,artifact_directory=None,complement_inventory=None):
    artifact_directory=project_path(artifact_directory) if artifact_directory else directory
    if not artifact_directory.is_relative_to(ROOT/'runtime'):raise ValueError('Census derivatives must stay inside runtime/')
    plan=load_json(directory/'plan.json');progress=load_json(directory/'progress.json')
    if progress.get('stage')!='completed':raise ValueError('Streaming census has not completed')
    if plan['target_sha256']!=target['sha256'] or progress['target_sha256'].lower()!=target['sha256']:
        raise ValueError('Streaming census target differs')
    session=load_json(directory/'session-result.json')
    if session['result'].get('ok') is not True:raise ValueError('Native census did not complete its verified execution')
    image=target_bytes(target)
    spec=importlib.util.spec_from_file_location('census_pe',ROOT/'scripts/inventory-current-target.py')
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    pe=module.pe_parser(image)
    for name,record in progress['files'].items():
        path=directory/name
        if file_sha256(path)!=record['sha256'] or inventory_size(path)!=record['bytes']:
            raise ValueError(f'Streaming census output differs: {name}')
    starts_path=Path(plan['starts'])
    if file_sha256(starts_path)!=plan['starts_sha256']:raise ValueError('Seed commitment differs')
    expected={pe.image_base+item[0] for item in pe.functions()}
    actual={int(line,16) for line in starts_path.read_text().splitlines()}
    scope=plan.get('seed_scope','declared')
    expected_seeds=expected.copy() if scope not in ('complement','pointers') else set()
    if scope in ('all','complement'):
        expected_seeds.update(complement_seed_targets(plan['complement_inventory'], complement_inventory))
    elif complement_inventory is not None:
        raise ValueError('Census plan has no complement seed inventory')
    if scope in ('all','pointers'):
        selection_spec=importlib.util.spec_from_file_location('census_pointer_selection',ROOT/'scripts/census-native-image.py')
        selection=importlib.util.module_from_spec(selection_spec);selection_spec.loader.exec_module(selection)
        expected_seeds=verify_pointer_seeds(plan,target,pe,module,selection,expected_seeds,expected)
    import_thunk_input=None
    if plan.get('import_thunks'):
        import capstone
        entry=plan['import_thunks'];inventory=project_path(entry['path'])
        if file_sha256(inventory)!=entry['sha256']:raise ValueError('Import-thunk seed input differs')
        spec=importlib.util.spec_from_file_location('verify_import_thunks',ROOT/'scripts/recover-native-import-thunks.py')
        helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
        payload=load_json(inventory)
        expected_seeds.update(helper.verify_inventory(payload,target,pe,capstone))
        import_thunk_input={'path':entry['path'],'sha256':entry['sha256']}
    unwind_handler_input=None
    if plan.get('unwind_handlers'):
        entry=plan['unwind_handlers'];inventory=project_path(entry['path'])
        if file_sha256(inventory)!=entry['sha256']:raise ValueError('PE metadata seed input differs')
        spec=importlib.util.spec_from_file_location('verify_unwind_entries',ROOT/'scripts/recover-native-unwind-handlers.py')
        helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
        expected_seeds.update(helper.verify_inventory(load_json(inventory),target,pe))
        unwind_handler_input={'path':entry['path'],'sha256':entry['sha256']}
    if actual!=expected_seeds:raise ValueError('Full seed-scope queue is incomplete or changed')
    if plan.get('diagnostic_leads'):
        lead_path=project_path(plan['diagnostic_leads']['path'])
        if file_sha256(lead_path)!=plan['diagnostic_leads']['sha256']:raise ValueError('Diagnostic code inventory differs')
        leads=load_json(lead_path)
        if leads['target']['sha256']!=target['sha256']:raise ValueError('Diagnostic code target differs')
        for lead in leads['code_only_seeds']:
            raw=bytes.fromhex(lead['instruction_bytes']);offset=pe.rva_offset(int(lead['site'],16)-pe.image_base)
            if image[offset:offset+len(raw)]!=raw:raise ValueError('Diagnostic code bytes differ')
    address_code_input=None
    if plan.get('address_leads'):
        import capstone
        entry=plan['address_leads'];inventory=project_path(entry['path'])
        if file_sha256(inventory)!=entry['sha256']:raise ValueError('Address-code input differs')
        spec=importlib.util.spec_from_file_location('verify_address_code',ROOT/'scripts/recover-native-address-leads.py');helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
        helper.verify_inventory(load_json(inventory),target,pe,capstone)
        address_code_input={'path':inventory.relative_to(ROOT).as_posix(),'sha256':entry['sha256']}
    guarded_edges=set();observed_guarded_edges=set()
    if plan.get('jump_tables'):
        jump_path=project_path(plan['jump_tables']['path'])
        if file_sha256(jump_path)!=plan['jump_tables']['sha256']:raise ValueError('Guarded table input differs')
        jump_manifest=load_json(jump_path)
        if jump_manifest['target']['sha256']!=target['sha256']:raise ValueError('Guarded table target differs')
        for table in jump_manifest['tables']:
            offset=int(table['file_offset'],16);raw=image[offset:offset+table['byte_count']]
            if hashlib.sha256(raw).hexdigest()!=table['sha256']:raise ValueError('Guarded table bytes differ')
            guarded_edges.update((int(table['site'],16),int(value,16)) for value in table['case_targets'])
        if len(jump_manifest['tables'])!=progress['guarded_tables'] or len(guarded_edges)!=progress['guarded_flow_edges_applied']:
            raise ValueError('Guarded flow application count differs')
    functions,ranges=set(),[]
    for row in rows(directory/'bodies.tsv.gz'):
        if row['external']=='true':continue
        entry,start,end=map(address,(row['entry'],row['start'],row['end']))
        if end<start:raise ValueError('Invalid Ghidra body range')
        functions.add(entry);ranges.append((start,end,entry))
    owner=owner_lookup(ranges)
    helper_final={}
    helper_input=directory/'direct-call-helpers.tsv.gz'
    if helper_input.exists():
        helper_output=directory/'direct-call-helper-final-owners.tsv.gz';helper_counts=Counter()
        with derived_gzip_text(helper_output,publish=publish) as out:
            out.write('address\towner_before_primary_body_repair\tfinal_native_owner\n')
            for row in rows(helper_input):
                site=address(row['address']);before=address(row['native_owner']);after=owner(site)
                helper_counts['targets']+=1
                if after is None:helper_counts['without_final_owner']+=1
                if before!=after:helper_counts['owner_changed_during_primary_body_repair']+=1
                before_text=f'{before:x}' if before is not None else ''
                after_text=f'{after:x}' if after is not None else ''
                out.write(f'{site:x}\t{before_text}\t{after_text}\n')
        helper_final={'counts':{key:helper_counts[key] for key in ('targets','without_final_owner','owner_changed_during_primary_body_repair')},'raw_helper_owner_observation_stage':'before-primary-body-repair',
            'final_owner_audit':{'path':helper_output.relative_to(ROOT).as_posix(),'sha256':file_sha256(helper_output)}}
    import_slots={int(record['iat_start_address'],16) + 8*index:
        (record['library'],name) for record in pe.imports() for index,name in enumerate(record['functions'])}
    import_libraries=Counter(library for library,_ in import_slots.values())
    import_references,import_reference_owners=Counter(),set()
    executable_sections=[section for section in pe.sections if int(section['characteristics'],16)&0x20000000]
    pointer_slots={pe.image_base+site:value for site,kind,value in module.relocations(pe)[0]
        if kind==10 and any(pe.image_base+section['rva']<=value<pe.image_base+section['rva']+section['virtual_size']
                           for section in executable_sections)}
    pointer_sections=Counter()
    for slot in pointer_slots:
        section=next((section['name'] for section in pe.sections
            if pe.image_base+section['rva']<=slot<pe.image_base+section['rva']+section['virtual_size']),'<unmapped>')
        pointer_sections[section]+=1
    pointer_references,pointer_source_owners=Counter(),set()
    kinds,targets,globals_by_kind=Counter(),Counter(),Counter()
    owned_references=unowned_references=0
    global_targets,global_readers,global_writers=set(),set(),set()
    calls,unowned_destinations,unowned_call_sources=set(),set(),set()
    for row in rows(directory/'references.tsv.gz'):
        source,target_address=address(row['from']),address(row['to'])
        if row['type']=='COMPUTED_JUMP' and (source,target_address) in guarded_edges:observed_guarded_edges.add((source,target_address))
        source_owner=owner(source);destination_owner=owner(target_address)
        kinds[row['type']]+=1
        if target_address in pointer_slots:
            pointer_references[row['type']]+=1
            pointer_source_owners.add((target_address,source_owner))
        if target_address in import_slots:
            library,name=import_slots[target_address]
            import_references[library]+=1
            import_reference_owners.add((target_address,source_owner))
        if source_owner is not None:owned_references+=1
        else:unowned_references+=1
        if ':' in row['to']:targets['non-default-address-space']+=1
        elif destination_owner is not None:targets['native-body']+=1
        else:
            targets['memory-without-native-body']+=1
            if row['type'] in ('READ','WRITE','READ_WRITE'):
                global_targets.add(target_address);globals_by_kind[row['type']]+=1
                if 'READ' in row['type']:global_readers.add((target_address,source_owner))
                if 'WRITE' in row['type']:global_writers.add((target_address,source_owner))
        if 'CALL' in row['type']:
            if source_owner is not None and destination_owner is not None:calls.add((source_owner,destination_owner))
            if destination_owner is None and target_address is not None:unowned_destinations.add(target_address)
            if source_owner is None and source is not None:unowned_call_sources.add(source)
    if observed_guarded_edges!=guarded_edges:raise ValueError('Export omitted guarded computed-flow edges')
    diagnostic=load_json(ROOT/f"runtime/coverage/{target['sha256']}/diagnostic-ownership.json")
    if diagnostic['target']['sha256']!=target['sha256']:raise ValueError('Diagnostic ownership target differs')
    bindings=[]
    for diagnostic_path in diagnostic['diagnostics']:
        site_owners=Counter(owner(int(reference['instruction_address'],16)) for reference in diagnostic_path['verified_references'])
        bindings.append({'path':diagnostic_path['path'],'custom_game_crate':diagnostic_path['custom_game_crate'],
            'verified_sites':sum(site_owners.values()),'sites_inside_actual_ghidra_bodies':sum(v for k,v in site_owners.items() if k is not None),
            'actual_native_body_owners':len([k for k in site_owners if k is not None]),
            'sites_without_actual_ghidra_owner':site_owners.get(None,0),'semantic_source_ownership_established':False})
    independent={'performed':False}
    if check_instructions:
        import capstone
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
        stream=iter(rows(directory/'instructions.tsv.gz'))
        current=next(stream,None);count=byte_count=0;flows=Counter();inside_extent=outside_extent=0
        # Check the exact source bytes and independently decode every exported
        # instruction. This also covers decoded executable-complement bodies.
        def instruction_rows():
            if current is not None:yield current
            yield from stream
        extents=[(pe.image_base+start,pe.image_base+end) for start,end,_ in pe.functions()]
        extent_starts=[start for start,_ in extents]
        decoded_ranges=[]
        facts=BoundaryVerifier(target['sha256'],pe,capstone)
        for row,instruction in facts.instructions(instruction_rows()):
            site=instruction.address;length=instruction.size
            index=bisect_right(extent_starts,site)-1
            if index>=0 and site+length<=extents[index][1]:inside_extent+=1
            else:outside_extent+=1
            if decoded_ranges and site<decoded_ranges[-1][1]:raise ValueError('Exported instructions overlap or are unsorted')
            if decoded_ranges and site==decoded_ranges[-1][1]:decoded_ranges[-1]=(decoded_ranges[-1][0],site+length)
            else:decoded_ranges.append((site,site+length))
            count+=1;byte_count+=length;flows[row['flow']]+=1
            if count%1000000==0:print(f'Independently verified {count:,} instructions',flush=True)
        facts.close()
        if count!=progress['instructions'] or byte_count!=progress['instruction_bytes']:
            raise ValueError('Instruction census counters differ')
        missing=subtract_ranges(merge_ranges(extents),decoded_ranges)
        missing_path=artifact_directory/'missing-declared-ranges.tsv.gz'
        missing_categories={key.split(':',1)[1]:value for key,value in write_missing_ranges(missing_path,[('declared',missing)],pe,image,decoder,publish=publish).items()}
        executable=[(pe.image_base+section['rva'],pe.image_base+section['rva']+section['virtual_size']) for section in executable_sections]
        missing_inside,missing_outside=executable_missing_partitions(executable,extents,decoded_ranges)
        executable_missing_path=artifact_directory/'missing-executable-ranges.tsv.gz'
        executable_categories=write_missing_ranges(executable_missing_path,[('declared',missing_inside),('outside-declared',missing_outside)],pe,image,decoder,publish=publish)
        executable_bytes=sum(end-start for start,end in merge_ranges(executable));missing_executable_bytes=sum(end-start for start,end in missing_inside+missing_outside)
        independent={'performed':True,'decoder':'Capstone','version':capstone.__version__,
            'instruction_facts':facts.receipt(),
            'exact_source_bytes_verified':True,'instruction_records':count,'decoded_bytes':byte_count,
            'instructions_inside_declared_extents':inside_extent,'instructions_outside_declared_extents':outside_extent,
            'flow_kinds':dict(sorted(flows.items())),
            'declared_extent_bytes_unobserved_by_ghidra':sum(end-start for start,end in missing),
            'unobserved_declared_ranges':len(missing),'unobserved_bytes_by_candidate_kind':dict(sorted(missing_categories.items())),
            'unobserved_range_inventory':{'path':missing_path.relative_to(ROOT).as_posix(),'sha256':file_sha256(missing_path)},
            'executable_sections':{'mapped_bytes':executable_bytes,'observed_instruction_union_bytes':executable_bytes-missing_executable_bytes,
                'unobserved_bytes':missing_executable_bytes,'unobserved_declared_bytes':sum(end-start for start,end in missing_inside),
                'unobserved_outside_declared_bytes':sum(end-start for start,end in missing_outside),'unobserved_ranges':len(missing_inside)+len(missing_outside),
                'unobserved_bytes_by_location_and_candidate_kind':executable_categories,
                'range_inventory':{'path':executable_missing_path.relative_to(ROOT).as_posix(),'sha256':file_sha256(executable_missing_path)}},
            'padding_or_noncode_proven':False}
    if file_sha256(ROOT/'scripts/summarize-native-image.py')!=GENERATOR_SHA256:raise ValueError('Summarizer changed during analysis; retain artifacts and rerun the derivation')
    if file_sha256(ROOT/'scripts/derived_gzip.py')!=DERIVED_GZIP_SHA256:raise ValueError('Derived gzip helper changed during analysis; retain artifacts and rerun the derivation')
    return {'schema_version':1,'target':{k:target[k] for k in ('version','path','sha256','size_bytes')},
        'generator':{'path':'scripts/summarize-native-image.py','sha256':GENERATOR_SHA256,
            'dependencies':[{'path':'scripts/derived_gzip.py','sha256':DERIVED_GZIP_SHA256},{'path':'scripts/instruction_facts.py','sha256':FACTS_SHA256}]},
        'installed_reference_import':session['parameters'].get('installed_reference_import','REA-private-session-snapshot'),
        'profile':session['parameters'],'profile_digest':session['profileDigest'],
        'counts':{k:progress[k] for k in ('instructions','instruction_bytes','computed_calls','computed_jumps','native_functions','body_ranges','references','external_locations','seeds_without_instructions','seeds_without_functions','seeded_functions_repaired')},
        'incremental_census':{key:progress[key] for key in ('reuse_mode','reuse_fallback_reason','predecessor_plan_sha256','decode_entries_requested','decode_entries_reused','body_entries_requested','body_entries_reused','body_entries_affected','body_entries_new','body_repairs_executed','affected_flow_instructions_examined') if key in progress},
        'guarded_flow_observations':{key:progress[key] for key in ('guarded_tables','guarded_table_edges','additional_code_seed_targets','guarded_flow_edges_applied','additional_code_seeds_without_instructions') if key in progress},
        'guarded_edge_digest':flow_edge_digest(guarded_edges),
        'direct_call_helper_observations':{key:progress[key] for key in ('direct_call_helper_targets','direct_call_helper_functions_created','direct_call_helpers_without_instructions','direct_call_helpers_without_owner') if key in progress},
        'direct_call_helper_final_ownership':helper_final,
        'guarded_table_input':{'path':Path(plan['jump_tables']['path']).relative_to(ROOT).as_posix(),'sha256':plan['jump_tables']['sha256']} if plan.get('jump_tables') else None,
        'diagnostic_code_input':{'path':Path(plan['diagnostic_leads']['path']).relative_to(ROOT).as_posix(),'sha256':plan['diagnostic_leads']['sha256']} if plan.get('diagnostic_leads') else None,
        'import_thunk_input':import_thunk_input,
        'unwind_handler_input':unwind_handler_input,
        'address_code_input':address_code_input,'additional_address_code_starts':progress.get('additional_address_code_starts',0),
        'additional_diagnostic_code_starts':progress.get('additional_diagnostic_code_starts',0),
        'seed_scope':scope,'requested_seeds':len(actual),'requested_seed_function_records':len(actual&functions),
        'requested_seeds_with_decoded_entries':len(actual)-progress['seeds_without_instructions'],
        'requested_seeds_with_repaired_flow_bodies':progress['seeded_functions_repaired'],
        'declared_starts':len(expected),'declared_starts_with_actual_bodies':len(expected&functions),
        'independent_instructions':independent,'reference_kinds':dict(sorted(kinds.items())),
        'reference_destinations':dict(sorted(targets.items())),
        'reference_source_ownership':{'inside_native_body':owned_references,'outside_native_body':unowned_references},
        'declared_import_observations':{'slot_count':len(import_slots),'libraries':dict(sorted(import_libraries.items())),
            'native_references_by_library':dict(sorted(import_references.items())),
            'slot_source_owner_pairs':len(import_reference_owners),'runtime_slot_overwrites_or_external_implementation_verified':False},
        'relocated_code_pointer_observations':{'slots':len(pointer_slots),'slot_sections':dict(sorted(pointer_sections.items())),
            'distinct_encoded_targets':len(set(pointer_slots.values())),
            'slots_targeting_actual_native_entries':sum(value in functions for value in pointer_slots.values()),
            'slots_targeting_native_body_bytes':sum(owner(value) is not None for value in pointer_slots.values()),
            'native_reference_kinds_to_slots':dict(sorted(pointer_references.items())),
            'slot_source_owner_pairs':len(pointer_source_owners),'dynamic_callee_or_vtable_semantics_established':False},
        'diagnostic_bindings':bindings,
        'direct_native_call_pairs':len(calls),'call_destinations_without_native_owner':len(unowned_destinations),
        'call_source_sites_without_native_owner':len(unowned_call_sources),
        'global_static_observations':{'read_write_reference_records':dict(sorted(globals_by_kind.items())),
            'distinct_targets':len(global_targets),'reader_pairs':len(global_readers),'writer_pairs':len(global_writers),
            'complete_alias_or_global_semantics':False},
        'artifacts':{'directory':directory.relative_to(ROOT).as_posix(),'plan_sha256':file_sha256(directory/'plan.json'),
            'progress_sha256':file_sha256(directory/'progress.json'),'session_result_sha256':file_sha256(directory/'session-result.json'),'files':portable_record(progress['files'])},
        'whole_image_input':True,'all_seeded_body_operations_complete':len(actual&functions)==len(actual) and progress['seeded_functions_repaired']==len(actual),
        'global_native_semantics_complete':False,'global_references_complete':False,'native_source_ownership_complete':False,
        'parity_verified':False,'gap_ids':[41],
        'limits':['Ghidra flow bodies are observed, not forced to declared unwind extents; computed flow and decoder disagreements remain explicit.',
            'Auto-analysis and semantic/decompiler/address-table passes are disabled. Exported static references are complete for this Program state, not all possible runtime edges.',
            'Global read/write records and direct call pairs establish machine-code relationships, not source-level aliasing, reconstructed behavior or semantic ownership.',
            'No application compilation, target execution or original/rebuilt comparison.']}


def compact(report, original, *, artifact_directory=None, publish=True):
    """Keep bulk bindings in runtime and preserve the original summary bytes."""
    if 'diagnostic_bindings' not in report:
        return report
    directory = project_path(artifact_directory or report['artifacts']['directory'])
    snapshot = directory / 'full-summary.json'
    if snapshot.exists() and snapshot.read_bytes() != original:
        raise ValueError('Refusing to replace an immutable full-summary snapshot')
    derived_bytes(snapshot, original, publish=publish)
    bindings = report['diagnostic_bindings']
    audit = directory / 'diagnostic-bindings.json'
    derived_json(audit, {'target': report['target'], 'diagnostic_bindings': bindings}, publish=publish)
    result = {key: value for key, value in report.items() if key != 'diagnostic_bindings'}
    result['curation_generator'] = {
        'path': 'scripts/summarize-native-image.py',
        'sha256': GENERATOR_SHA256,
        'dependencies': [{'path': 'scripts/instruction_facts.py', 'sha256': FACTS_SHA256}],
    }
    result['diagnostic_binding_counts'] = {
        'paths': len(bindings),
        'custom_paths': sum(row['custom_game_crate'] for row in bindings),
        'paths_with_verified_diagnostic_sites': sum(bool(row['verified_sites']) for row in bindings),
        'paths_with_actual_native_owners': sum(bool(row['actual_native_body_owners']) for row in bindings),
        'verified_sites': sum(row['verified_sites'] for row in bindings),
        'sites_without_actual_native_owner': sum(row['sites_without_actual_ghidra_owner'] for row in bindings),
    }
    exceptions = [row for row in bindings if row['verified_sites'] and row['sites_without_actual_ghidra_owner']]
    result['diagnostic_owner_exceptions'] = {
        'paths_with_unowned_verified_sites': len(exceptions),
        'custom_paths': [
            {'path': row['path'], 'unowned_sites': row['sites_without_actual_ghidra_owner']}
            for row in exceptions if row['custom_game_crate']
        ],
        'whole_queue_paths_without_any_owner': [
            row['path'] for row in exceptions if not row['actual_native_body_owners']
        ] if report['seed_scope'] in ('all', 'declared') else [],
        'complete_exception_records_in_diagnostic_binding_audit': True,
    }
    result['diagnostic_binding_audit'] = {'path': audit.relative_to(ROOT).as_posix(), 'sha256': file_sha256(audit)}
    result['full_summary_snapshot'] = {
        'path': snapshot.relative_to(ROOT).as_posix(), 'sha256': hashlib.sha256(original).hexdigest(),
    }
    return result


def summary_output(directory, requested=None):
    """Stage candidate passes in runtime. Only the selected report is tracked."""
    output = artifact_path(requested or directory / 'summary.json')
    if not output.is_relative_to(ROOT / 'runtime') and output != ROOT / 'docs/analysis/coverage/full-image-selected.json':
        raise ValueError('Write the summary inside runtime/ or to the canonical full-image-selected.json')
    return output


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--input');parser.add_argument('--write',action='store_true');parser.add_argument('--skip-instruction-check',action='store_true');parser.add_argument('--summary-output');parser.add_argument('--artifact-directory',help='Fresh runtime directory for verifier derivatives; preserves the native census bundle')
    parser.add_argument('--complement-inventory', help='Alternate inventory path with the exact complement digest in the frozen plan')
    args=parser.parse_args()
    target=latest_target();directory=project_path(args.input or f"runtime/coverage/{target['sha256']}/ghidra/full-image-durable")
    if args.write and args.skip_instruction_check:raise ValueError('Curated evidence requires all independent instruction checks')
    if args.write:
        output = summary_output(project_path(args.artifact_directory) if args.artifact_directory else directory,
                                args.summary_output)
    report=summarize(directory,target,not args.skip_instruction_check,publish=args.write,artifact_directory=args.artifact_directory,complement_inventory=args.complement_inventory)
    if args.write:
        derived_json(output, compact(report, json_text(report).encode(), artifact_directory=args.artifact_directory),
                     publish=True)
    else:print(json_text(report))
if __name__=='__main__':main()
