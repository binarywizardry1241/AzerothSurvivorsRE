#!/usr/bin/env python3
"""Reconcile the 0.113.2 unknown queue from existing hash-bound inventories.

Default verifies the retained compact proof; --write updates it after review.
Only standard-library inventory queries run. This does not decode EXE bytes,
start Ghidra, compile source, execute the game or regenerate a native census.
Missing runtime inventories must be restored by their documented owning producer.
"""
import argparse
import bisect, collections, csv, gzip, hashlib, json, sqlite3
from pathlib import Path

from coverage_common import ROOT, latest_target, load_json
from coverage_common import file_sha256
from shared_native_inventory import open_readonly_uri as open_native_inventory, inventory_size
SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
BASE = ROOT/'runtime/coverage'/SHA
DEFAULT_CENSUS = ROOT/'docs/analysis/coverage/full-image-census.json'
OUT = ROOT/'docs/analysis/evidence/0.113.2/unknown-recovery.json'
EXPANDED_INPUTS = {
    'guarded_table_input':'jump_tables',
    'diagnostic_code_input':'diagnostic_leads',
    'import_thunk_input':'import_thunks',
    'unwind_handler_input':'unwind_handlers',
    'address_code_input':'address_leads',
}

def load(p): return load_json(p)
def sha(p): return file_sha256(p)
def artifact(p): return {'path':p.relative_to(ROOT).as_posix(),'sha256':sha(p),'bytes':inventory_size(p)}
def tsv(p):
    with gzip.open(p,'rt',newline='') as f: yield from csv.DictReader(f,delimiter='\t')
def hx(x): return None if x is None else hex(x)
def address(x): return None if not x or ':' in x else int(x,16)


def project_path(value):
    path=Path(value)
    path=(path if path.is_absolute() else ROOT/path).resolve()
    if not path.is_relative_to(ROOT.resolve()):raise ValueError(f'Inventory path escapes project: {value}')
    return path


def selected_census_path(explicit=None):
    if explicit is not None:return project_path(explicit)
    if OUT.is_file():
        return project_path(load(OUT)['inputs']['full-image-census']['path'])
    return project_path(DEFAULT_CENSUS)


def census_context(summary_path,target):
    """Select an independently verified census without promoting its semantics."""
    summary_path=project_path(summary_path);summary=load(summary_path)
    if any(summary.get('target',{}).get(key)!=target[key] for key in ('version','path','sha256','size_bytes')):
        raise ValueError('Census summary belongs to another selected target')
    independent=summary.get('independent_instructions',{})
    if not (summary.get('whole_image_input') and summary.get('all_seeded_body_operations_complete')
            and independent.get('performed') and independent.get('exact_source_bytes_verified')):
        raise ValueError('Census requires complete full-image operations and independent instruction-byte verification')
    full=project_path(summary['artifacts']['directory'])
    plan=load(full/'plan.json');progress=load(full/'progress.json');session=load(full/'session-result.json')
    if (plan.get('target_sha256')!=target['sha256'] or plan.get('target_version')!=target['version']
            or progress.get('target_sha256')!=target['sha256'] or progress.get('stage')!='completed'):
        raise ValueError('Census plan/progress identity or completion differs')
    if (session.get('result',{}).get('ok') is not True or session.get('parameters')!=summary['profile']
            or session.get('profileDigest')!=summary['profile_digest']):
        raise ValueError('Census session/profile commitment differs')
    if project_path(plan['output'])!=full:raise ValueError('Census output directory differs from plan')
    for key,name in [('plan_sha256','plan.json'),('progress_sha256','progress.json'),('session_result_sha256','session-result.json')]:
        if sha(full/name)!=summary['artifacts'][key]:raise ValueError(f'Census {name} commitment differs')
    starts=project_path(plan['starts'])
    if sha(starts)!=plan['starts_sha256'] or plan['starts_sha256']!=summary['profile']['starts_sha256']:
        raise ValueError('Census start queue commitment differs')
    if (plan['seed_count']!=summary['requested_seeds'] or progress['total']!=plan['seed_count']
            or progress['completed']!=progress['total']):
        raise ValueError('Census seed completion counts differ')
    if (plan.get('seed_scope','declared') not in ('declared','all')
            or plan.get('seed_scope','declared')!=summary['seed_scope']
            or plan['declared_start_count']!=summary['declared_starts']):
        raise ValueError('Census must include the complete declared-start scope')
    for key in ('instructions','instruction_bytes','body_ranges'):
        if progress[key]!=summary['counts'][key]:raise ValueError(f'Census {key} count differs')
    if (independent['instruction_records']!=summary['counts']['instructions']
            or independent['decoded_bytes']!=summary['counts']['instruction_bytes']):
        raise ValueError('Independent instruction counts differ from census')
    expanded={}
    for key,plan_key in EXPANDED_INPUTS.items():
        record=summary.get(key);commitment=plan.get(plan_key)
        if record is None and commitment is None:continue
        if record is None or commitment is None:raise ValueError(f'Census {key} is absent from summary or plan')
        path=project_path(record['path'])
        if not path.is_file():raise FileNotFoundError(path)
        if path!=project_path(commitment['path']) or record['sha256']!=commitment['sha256'] or sha(path)!=record['sha256']:
            raise ValueError(f'Census {key} commitment differs')
        if load(path).get('target',{}).get('sha256')!=target['sha256']:
            raise ValueError(f'Census {key} belongs to another selected target')
        # The retained plan artifact keeps its original bytes/digest; expose
        # portable equivalent paths rather than machine-specific launch paths.
        expanded[key]={'artifact':artifact(path),'plan_key':plan_key,
            'plan_commitment':{**commitment,'path':path.relative_to(ROOT).as_posix()}}
    return summary,full,plan,progress,expanded


def completed_operations(summary,progress,linear_counts,selected_queue):
    if summary['declared_starts']!=linear_counts['unwind_extents']:
        raise ValueError('Census and linear declared-start counts differ')
    # A complete seeded pass has repaired each requested body; the independent
    # summary separately records actual bodies at declared starts.
    declared_bodies=summary['declared_starts_with_actual_bodies']
    if (summary['seed_scope'] not in ('declared','all')
            or summary['requested_seeds_with_decoded_entries']!=summary['requested_seeds']):
        raise ValueError('Declared-entry completion requires every census seed to decode')
    return {'declared_starts':summary['declared_starts'],'decoded_declared_entries':summary['declared_starts'],
        'repaired_declared_bodies':declared_bodies,'linear_processed_extents':linear_counts['processed_extents'],
        'linear_pending_extents':linear_counts['pending_extents'],
        'linear_undecoded_suffix_extents':linear_counts['extents_with_undecoded_suffix'],
        'streaming_stage':progress['stage'],'selected_owner_queue':selected_queue}


def exact_output_availability(summary,expanded):
    """An available proof input is classification evidence, not semantic closure."""
    unavailable=[
      {'id':'Q41-M01','output':'expanded current guarded-switch proof/admission queue','current_input':summary.get('guarded_table_input'),'producer':'scripts/recover-native-jump-tables.py / scripts/recover-native-declared-dispatch.py / scripts/recover-custom-native-dispatch.py; current bounded input selection required','count':None},
      {'id':'Q41-M02','output':'expanded current complement/address-taken/metadata/import-thunk/diagnostic-code seed queue and resulting current Ghidra bodies','current_inputs':{k:summary.get(k) for k in ['address_code_input','import_thunk_input','unwind_handler_input','diagnostic_code_input']},'producer':'scripts/recover-native-address-leads.py, recover-native-unwind-handlers.py, recover-native-import-thunks.py, prepare-native-diagnostic-leads.py and census-native-image.py; source inventories retained','count':None},
      {'id':'Q41-M03','output':'complete current semantic/source and dynamic alias/producer-consumer residual classifier over observed code/data','current_status':{key:summary[key] for key in ['global_native_semantics_complete','global_references_complete','native_source_ownership_complete']},'producer':'scripts/classify-native-ownership.py plus current system evidence crosswalk; historical/source membership does not supply semantic proof','count':None}]
    available=[]
    requirements={'Q41-M01':{'guarded_table_input'},'Q41-M02':set(EXPANDED_INPUTS)-{'guarded_table_input'}}
    for row in unavailable[:]:
        if row['id'] in requirements and requirements[row['id']]<=expanded.keys():
            unavailable.remove(row)
            available.append({**row,'status':'available_for_bounded_classification','semantic_recovery':'unverified',
                'current_census_profile_digest':summary['profile_digest']})
    return unavailable,available


class AppliedGuardPartition:
    """Partition opcode observations without claiming complete dynamic flow."""
    with_guard='Q41-F01-jump-with-applied-guard'
    without_guard='Q41-F01-jump-without-applied-guard'

    def __init__(self,tables):
        self.table_records=len(tables)
        self.sites={int(row['site'],16) for row in tables}
        self.observed={}
        self.counts=collections.Counter()

    def observe(self,site,flow):
        if site in self.sites:self.observed.setdefault(site,set()).add(flow)
        if flow!='COMPUTED_JUMP':return None
        key=self.with_guard if site in self.sites else self.without_guard
        self.counts[key]+=1
        return key

    def finish(self,total):
        if sum(self.counts.values())!=total:raise ValueError('Applied-guard partition differs from computed-jump population')
        exceptions=[]
        for site in sorted(self.sites):
            flows=self.observed.get(site,set())
            if 'COMPUTED_JUMP' not in flows:
                exceptions.append({'site':hex(site),'observed_flows':sorted(flows),
                    'reason':'observed_with_other_flow' if flows else 'absent_from_instruction_inventory'})
        return {'base_selector':'Q41-F01-jump','guarded_table_records':self.table_records,
            'distinct_applied_table_sites':len(self.sites),
            'partition_records':{key:self.counts[key] for key in [self.with_guard,self.without_guard]},
            'expected_site_exceptions':exceptions,
            'limits':'The base selector is every computed-jump opcode record, not a count of wholly unresolved sites. Applied table proof retains its guarded/fallthrough and unknown-incoming-context limits; table membership does not establish all runtime targets or semantic/source closure.'}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write',action='store_true',help='Write the reviewed compact proof; default verifies it')
    parser.add_argument('--census-summary',help='Verified current census summary; default follows the retained proof, or the canonical census when no proof exists')
    args=parser.parse_args()
    selected_target=latest_target(verify=True)
    assert selected_target['version']=='0.113.2' and selected_target['sha256']==SHA,'Unsupported selected target; preserve this historical queue'
    census_path=selected_census_path(args.census_summary)
    summary,FULL,plan,progress,expanded=census_context(census_path,selected_target)
    inputs={}
    for name in ['native-summary','instruction-summary','unwind-complement-summary','full-image-census','seeded-census']:
        p=census_path if name=='full-image-census' else ROOT/'docs/analysis/coverage'/f'{name}.json';d=load(p)
        assert d['target']['sha256']==SHA
        inputs[name]=artifact(p)
    linear_summary=load(ROOT/'docs/analysis/coverage/instruction-summary.json')
    for name in ['inventory.json','diagnostic-ownership.json','native-instructions.sqlite','unwind-complement.sqlite']:
        inputs[name]=artifact(BASE/name)
    for name in ['instructions.tsv.gz','bodies.tsv.gz','references.tsv.gz','externals.tsv.gz','starts.tsv','direct-call-helper-final-owners.tsv.gz','missing-executable-ranges.tsv.gz','missing-declared-ranges.tsv.gz','diagnostic-bindings.json','progress.json','plan.json','session-result.json']:
        inputs[name]=artifact(FULL/name)
    for name,data in summary['artifacts']['files'].items():
        actual=inputs.get(name) or artifact(FULL/name)
        assert actual['sha256']==data['sha256'] and actual['bytes']==data['bytes']
    for key,record in expanded.items():inputs[key]=record['artifact']
    for key in ['native-summary','instruction-summary','unwind-complement-summary']:
        rec=load(ROOT/'docs/analysis/coverage'/f'{key}.json')['inventory']
        assert inputs[Path(rec['path']).name]['sha256']==rec['sha256']
    assert inputs['missing-executable-ranges.tsv.gz']['sha256']==summary['independent_instructions']['executable_sections']['range_inventory']['sha256']
    assert inputs['missing-declared-ranges.tsv.gz']['sha256']==summary['independent_instructions']['unobserved_range_inventory']['sha256']

    inventory=load(BASE/'inventory.json');image_base=int(inventory['pe']['image_base'],16)
    sections=inventory['pe']['sections'];diagnostic=load(BASE/'diagnostic-ownership.json')
    body_ranges=sorted((int(r['start'],16),int(r['end'],16),int(r['entry'],16)) for r in tsv(FULL/'bodies.tsv.gz') if r['external']=='false')
    assert all(a[1]<b[0] for a,b in zip(body_ranges,body_ranges[1:]))
    starts=[r[0] for r in body_ranges]
    entries={r[2] for r in body_ranges}
    def owner(site):
        if site is None:return None
        i=bisect.bisect_right(starts,site)-1
        return body_ranges[i][2] if i>=0 and site<=body_ranges[i][1] else None
    def section(site):
        return next((s['name'] for s in sections if image_base+s['rva']<=site<image_base+s['rva']+s['virtual_size']),'<unmapped>')

    selectors={}
    class Selection:
        def __init__(self,key,inputs_,selector,projection,order):
            self.key=key;self.h=hashlib.sha256();self.count=0;self.bytes=0;self.groups=collections.Counter()
            self.value={'inputs':inputs_,'selector':selector,'projection':projection,'order':order}
        def add(self,row,byte_count=0,group=None):
            self.h.update((json.dumps(row,ensure_ascii=False,separators=(',',':'))+'\n').encode())
            self.count+=1;self.bytes+=byte_count
            if group is not None:self.groups[group]+=1
        def finish(self,**extra):
            self.value.update(records=self.count,output_sha256=self.h.hexdigest(),**extra)
            if self.bytes:self.value['bytes']=self.bytes
            if self.groups:self.value['record_groups']=dict(sorted(self.groups.items()))
            selectors[self.key]=self.value

    range_columns=['start','end_exclusive','byte_count','location','category','sha256']
    for loc,key in [('declared','Q41-U01'),('outside-declared','Q41-U02')]:
        s=Selection(key,['missing-executable-ranges.tsv.gz'],f"CSV rows where location == {loc!r}",range_columns,'source file row order')
        by_bytes=collections.Counter();by_rows=collections.Counter()
        for r in tsv(FULL/'missing-executable-ranges.tsv.gz'):
            if r['location']!=loc:continue
            s.add([r[c] for c in range_columns],int(r['byte_count']),r['category']);by_bytes[r['category']]+=int(r['byte_count']);by_rows[r['category']]+=1
        s.finish(bytes_by_candidate_kind=dict(sorted(by_bytes.items())),section='.text')

    linear=open_native_inventory(f'file:{BASE/"native-instructions.sqlite"}?mode=ro',uri=True)
    complement=open_native_inventory(f'file:{BASE/"unwind-complement.sqlite"}?mode=ro',uri=True)
    sql="SELECT ordinal,start,end,file_offset,sha256,decoded_end,instructions FROM extents WHERE decoded_end < end ORDER BY ordinal"
    s=Selection('Q41-U03-suffix',['native-instructions.sqlite'],sql,['ordinal','start_preferred_VA','end_exclusive_preferred_VA','file_offset','range_sha256','decoded_end_preferred_VA','instruction_count'],'SQL ORDER BY ordinal')
    for r in linear.execute(sql):s.add(list(r),r[2]-r[5])
    processed_extents=linear.execute('SELECT count(*) FROM extents').fetchone()[0]
    assert processed_extents==linear_summary['counts']['processed_extents']
    s.finish(processed_extents=processed_extents,expected_extents=linear_summary['counts']['unwind_extents'],pending_extents=linear_summary['counts']['pending_extents'])

    for db,label,queries in [(linear,'native-instructions.sqlite',[
        ('Q41-F02-call',"SELECT extent,site,bytes,kind,target,operand,access FROM refs WHERE kind='call_indirect' ORDER BY extent,site,operand,kind,target"),
        ('Q41-F02-jump',"SELECT extent,site,bytes,kind,target,operand,access FROM refs WHERE kind='jump_indirect' ORDER BY extent,site,operand,kind,target"),
        ('Q41-A01-linear',"SELECT extent,site,bytes,kind,target,operand,access FROM refs WHERE kind='address' ORDER BY extent,site,operand,kind,target")]),(complement,'unwind-complement.sqlite',[
        ('Q41-F02-complement',"SELECT site,kind,target,operand,access FROM refs WHERE kind='jump_indirect' ORDER BY site,operand,kind,target"),
        ('Q41-A01-complement',"SELECT site,kind,target,operand,access FROM refs WHERE kind='address' ORDER BY site,operand,kind,target")])]:
        for key,sql in queries:
            s=Selection(key,[label],sql,'all SELECT columns, SQLite types (addresses are preferred VA integers; target is encoded VA/pointer-slot string or null)','SQL ORDER BY as written')
            for r in db.execute(sql):s.add(list(r))
            s.finish()

    decoded_ranges=[(a,b) for a,b in complement.execute('SELECT site,end FROM instructions ORDER BY site')]
    merged=[]
    for a,b in decoded_ranges:
        if merged and a<=merged[-1][1]:merged[-1]=(merged[-1][0],max(b,merged[-1][1]))
        else:merged.append((a,b))
    s=Selection('Q41-U04',['unwind-complement.sqlite'],'For each regions row ordered by start, subtract the union of [site,end) from instructions; retain each residual [start,end) with the regions.category. Never subtract a padding candidate.',['start_preferred_VA_integer','end_exclusive_preferred_VA_integer','original_region_category'],'regions.start ascending; residual start ascending')
    cursor=0;byte_groups=collections.Counter()
    for a,b,cat in complement.execute('SELECT start,end,category FROM regions ORDER BY start'):
        while cursor<len(merged) and merged[cursor][1]<=a:cursor+=1
        j=cursor;pos=a
        while j<len(merged) and merged[j][0]<b:
            x,y=merged[j]
            if x>pos:s.add([pos,min(x,b),cat],min(x,b)-pos,cat);byte_groups[cat]+=min(x,b)-pos
            pos=max(pos,min(b,y));j+=1
            if pos>=b:break
        if pos<b:s.add([pos,b,cat],b-pos,cat);byte_groups[cat]+=b-pos
    s.finish(bytes_by_candidate_kind=dict(sorted(byte_groups.items())),section='.text')
    sql='SELECT site,end,bytes,mnemonic,operands FROM instructions ORDER BY site'
    s=Selection('Q41-S01-complement',['unwind-complement.sqlite'],sql,'all SELECT columns (preferred VA integers)','SQL ORDER BY site')
    for r in complement.execute(sql):s.add(list(r),r[1]-r[0])
    s.finish()

    flow={}
    for key,wanted in [('Q41-F01-call',{'COMPUTED_CALL','COMPUTED_CALL_TERMINATOR'}),('Q41-F01-jump',{'COMPUTED_JUMP'}),('Q41-O01',None)]:
        flow[key]=(Selection(key,['instructions.tsv.gz','bodies.tsv.gz'],f"CSV rows whose flow is in {sorted(wanted)!r}" if wanted else 'CSV rows where owner(address) is null',['address','length','bytes','flow','actual_native_owner_preferred_VA_or_null'],'source file row order'),wanted)
    guarded=None;guarded_selections={}
    if 'guarded_table_input' in expanded:
        guarded=AppliedGuardPartition(load(project_path(expanded['guarded_table_input']['artifact']['path']))['tables'])
        for key,predicate in [(guarded.with_guard,'is in'),(guarded.without_guard,'is not in')]:
            guarded_selections[key]=Selection(key,['instructions.tsv.gz','bodies.tsv.gz','guarded_table_input'],
                f'CSV rows whose flow == COMPUTED_JUMP and integer address {predicate} the distinct guarded_table_input tables[].site set',
                ['address','length','bytes','flow','actual_native_owner_preferred_VA_or_null'],'source file row order')
    total_instructions=0;total_bytes=0
    with gzip.open(FULL/'instructions.tsv.gz','rt') as f:
        next(f)
        for line in f:
            a,length,raw,kind=line.rstrip('\n').split('\t');site=int(a,16);own=owner(site)
            total_instructions+=1;total_bytes+=int(length)
            for key,(s,wanted) in flow.items():
                if (wanted is not None and kind in wanted) or (wanted is None and own is None):s.add([a,length,raw,kind,hx(own)],int(length),kind)
            if guarded is not None:
                key=guarded.observe(site,kind)
                if key is not None:guarded_selections[key].add([a,length,raw,kind,hx(own)],int(length),kind)
            if total_instructions%5000000==0:print('Read existing instruction records',total_instructions,flush=True)
    for s,_ in flow.values():s.finish()
    guarded_partition=None
    if guarded is not None:
        guarded_partition=guarded.finish(flow['Q41-F01-jump'][0].count)
        assert sum(s.count for s in guarded_selections.values())==flow['Q41-F01-jump'][0].count
        for s in guarded_selections.values():s.finish()
    assert total_instructions==summary['independent_instructions']['instruction_records'] and total_bytes==summary['independent_instructions']['decoded_bytes']

    ref_columns=['from','to','type','operand','primary','source']
    ref_filters={
        'Q41-O02':lambda r,src,dst:src is None,
        'Q41-D01':lambda r,src,dst:address(r['to']) is not None and dst is None,
        'Q41-D02':lambda r,src,dst:address(r['to']) is not None and dst is None and r['type'] in ('READ','WRITE','READ_WRITE')}
    ref_s={k:Selection(k,['references.tsv.gz','bodies.tsv.gz'],{'Q41-O02':'owner(from) is null','Q41-D01':'to has default address space and owner(to) is null','Q41-D02':"to has default address space and owner(to) is null and type in ('READ','WRITE','READ_WRITE')"}[k],ref_columns,'source file row order') for k in ref_filters}
    globals_=set();readers=set();writers=set()
    for r in tsv(FULL/'references.tsv.gz'):
        src=owner(address(r['from']));dst=owner(address(r['to']))
        for key,predicate in ref_filters.items():
            if predicate(r,src,dst):ref_s[key].add([r[c] for c in ref_columns],group=r['type'])
        if ref_filters['Q41-D02'](r,src,dst):
            value=address(r['to']);globals_.add(value)
            if 'READ' in r['type']:readers.add((value,src))
            if 'WRITE' in r['type']:writers.add((value,src))
    for key,s in ref_s.items():s.finish(**({'distinct_targets':len(globals_),'reader_pairs':len(readers),'writer_pairs':len(writers)} if key=='Q41-D02' else {}))

    code_slots=[]
    for rva,kind,target in inventory['pe']['base_relocation_records']['records']:
        if kind==10 and any(x['executable'] and image_base+x['rva']<=target<image_base+x['rva']+x['virtual_size'] for x in sections):code_slots.append((image_base+rva,target))
    s=Selection('Q41-A02',['inventory.json','bodies.tsv.gz'],'pe.base_relocation_records.records where kind == 10 and encoded_u64 lies in executable section virtual extent',['slot_preferred_VA_integer','encoded_target_preferred_VA_integer','slot_section','actual_target_owner_preferred_VA_or_null'],'slot preferred VA ascending')
    pointer_groups=collections.Counter()
    for slot,target in sorted(code_slots):
        own=owner(target);group='entry' if target in entries else 'body-interior' if own is not None else 'without-observed-body'
        s.add([slot,target,section(slot),hx(own)],group=group);pointer_groups[group]+=1
    s.finish(distinct_encoded_targets=len({target for _,target in code_slots}),distinct_targets_without_observed_body=len({target for _,target in code_slots if owner(target) is None}))

    s=Selection('Q41-D03',['inventory.json'],'Every embedded_candidates[kind] row; no sample, semantic or current-source filter',['kind','file_offset','virtual_address','byte_count','sha256','literal'],'kind lexicographic; existing array order within kind')
    for kind,records in sorted(inventory['embedded_candidates'].items()):
        for r in records:s.add([kind,r['file_offset'],r['virtual_address'],r['byte_count'],r['sha256'],r['literal']],int(r['byte_count']),kind)
    s.finish(zero_candidate_classes=['textual_numeric_id'])

    excluded_ids={'custom-game-coop-route','custom-game-coop-tcp','custom-game-game-party','custom-game-server-party'}
    diag_s={key:Selection(key,['diagnostic-ownership.json','bodies.tsv.gz'],predicate,['path','system_id','instruction_address','target_address','runtime_function_start','runtime_function_end','instruction_bytes','actual_native_owner_preferred_VA_or_null'],'diagnostic path lexicographic; verified_references source-array order') for key,predicate in {
        'Q41-C01':'verified_references where owner(instruction_address) is null and custom_game_crate and system_id not in excluded_ids',
        'Q41-C02':'verified_references where owner(instruction_address) is null and not custom_game_crate',
        'Q41-C03':'verified_references where owner(instruction_address) is null and system_id in excluded_ids'}.items()}
    diag_counts=collections.Counter();path_counts=collections.Counter();path_records=[]
    no_ref=Selection('Q41-C04',['diagnostic-ownership.json'],'diagnostics where verified_references == []',['path','system_id','custom_game_crate','occurrences'],'diagnostic path lexicographic')
    for d in sorted(diagnostic['diagnostics'],key=lambda d:d['path']):
        if not d['verified_references']:no_ref.add([d['path'],d['system_id'],d['custom_game_crate'],d['diagnostic_occurrences']])
        unowned=0
        for r in d['verified_references']:
            own=owner(int(r['instruction_address'],16))
            if own is not None:continue
            unowned+=1;key='Q41-C03' if d['system_id'] in excluded_ids else 'Q41-C01' if d['custom_game_crate'] else 'Q41-C02'
            diag_s[key].add([d['path'],d['system_id'],r['instruction_address'],r['target_address'],r['runtime_function_start'],r['runtime_function_end'],r['instruction_bytes'],None],group=d['path'])
        if unowned:path_records.append({'path':d['path'],'system_id':d['system_id'],'custom_game_crate':d['custom_game_crate'],'unowned_verified_sites':unowned})
    for s in diag_s.values():s.finish(paths=len(s.groups))
    no_ref.finish()

    selected=load(ROOT/'docs/analysis/coverage/seeded-census.json')
    s=Selection('Q41-P01',['seeded-census'],'For each mapping.retained_observations artifact, observations.outgoing.normalized_result.unresolved_calls; join source address to outgoing.references and current owner(target_address)',['path','selected_owner','source_address','reason','observed_target_address_or_null','current_target_owner_or_null'],'mapping array order; unresolved_calls array order')
    procedure_inputs=[];resolution=collections.Counter()
    for m in selected['mappings']:
        p=ROOT/m['retained_observations']['path'];assert sha(p)==m['retained_observations']['sha256'];procedure_inputs.append(artifact(p))
        outgoing=load(p)['observations']['outgoing']['normalized_result']
        for u in outgoing['unresolved_calls']:
            targets=[r['target_address'] for r in outgoing['references'] if r['source_address']==u['address'] and r.get('kind',{}).get('call')]
            assert len(targets)<=1
            target=targets[0] if targets else None;own=owner(address(target))
            resolution['now-has-observed-target-owner' if own is not None else 'no-static-target-owner']+=1
            s.add([m['path'],m['address'],u['address'],u['reason'],target,hx(own)])
    s.finish(current_target_classification=dict(sorted(resolution.items())),procedure_artifact_manifest_sha256=hashlib.sha256((json.dumps(procedure_inputs,sort_keys=True,separators=(',',':'))+'\n').encode()).hexdigest())

    # Additional identity/data projections use the same already-verified inputs.
    s=Selection('Q41-A03',['inventory.json'],'pe.base_relocation_records.records where kind != 10 or encoded_u64 is outside executable section virtual extents',['site_RVA_integer','kind_integer','encoded_u64_integer_or_null'],'source records order')
    for row in inventory['pe']['base_relocation_records']['records']:
        rva,kind,value=row
        code=kind==10 and any(x['executable'] and image_base+x['rva']<=value<image_base+x['rva']+x['virtual_size'] for x in sections)
        if not code:s.add(row)
    s.finish()
    s=Selection('Q41-E01',['inventory.json'],'each pe.imports library function in IAT order',['library','symbol','IAT_slot_preferred_VA_integer'],'pe.imports array order, then function index')
    for library in inventory['pe']['imports']:
        for index,name in enumerate(library['functions']):s.add([library['library'],name,int(library['iat_start_address'],16)+index*8])
    s.finish()
    sql='SELECT ordinal,start,end,file_offset,sha256,decoded_end,instructions FROM extents ORDER BY ordinal'
    s=Selection('Q41-S01-linear',['native-instructions.sqlite'],sql,['ordinal','start_preferred_VA_integer','end_exclusive_preferred_VA_integer','file_offset_integer','range_sha256','decoded_end_preferred_VA_integer','instructions_integer'],'SQL ORDER BY ordinal')
    for row in linear.execute(sql):s.add(list(row))
    s.finish(decoded_instruction_records=linear_summary['counts']['linear_instruction_records'],decoded_bytes=linear_summary['counts']['decoded_bytes_summed'])
    selectors['Q41-S01-full']={'inputs':['instructions.tsv.gz'],'selector':'Identity selection of all records, with original compressed inventory bytes as output','projection':'Original gzip artifact bytes, including TSV header; no recompression','order':'Source file row order','records':total_instructions,'decoded_bytes':total_bytes,'output_sha256':inputs['instructions.tsv.gz']['sha256']}

    unavailable,available=exact_output_availability(summary,expanded)

    proof={
        'schema_version':1,'target':{k:inventory['target'][k] for k in ['version','path','sha256','size_bytes']},'gap_ids':[41],
        'derivation':'Existing inventory selection only; no Ghidra analysis, independent decoding, target execution or source compilation.',
        'address_model':{'image_base':hex(image_base),'PE_section_intervals':'RVA [start,end); section raw offsets are file offsets','TSV_range_addresses':'preferred VAs in bare hexadecimal, end_exclusive except bodies.tsv.gz.end is inclusive','SQLite_addresses':'preferred VA integers; extents/regions/instructions end is exclusive','owner_lookup':'Nonexternal bodies.tsv.gz inclusive [start,end], unique disjoint range containing site; null when absent. See scripts/summarize-native-image.py::owner_lookup.'},
        'selector_output_encoding':'SHA-256 of UTF-8 JSONL arrays; json.dumps(array,ensure_ascii=False,separators=(comma,colon)) plus LF for each projected row, no header. SQLite values preserve integer/null/string types; CSV values preserve strings. Empty selections hash zero bytes.',
        'inputs':inputs,'profiles':{'full_image':summary['profile'],'full_image_digest':summary['profile_digest'],'selected_diagnostic_owner':selected['profile']},
        'selectors':selectors,'diagnostic_ownerless_path_partition':[r for r in path_records if r['custom_game_crate']],
        'excluded_logic_system_ids':sorted(excluded_ids),
        'selected_procedure_inputs_source':f'docs/analysis/coverage/seeded-census.json mappings[].retained_observations; Q41-P01 verifies all{len(selected["mappings"])} artifact SHA-256 values and records an ordered manifest digest.',
        'completed_operations':completed_operations(summary,progress,linear_summary['counts'],load(BASE/'ghidra/full-image-diagnostic-owner-repaired/progress.json')['queue']),
        'unavailable_exact_outputs':unavailable,
        'limits':['Selectors preserve overlapping pass views; records/bytes from different selectors must not be added as unique unknowns.','No unknown lead becomes resolved through grouping, body ownership, a path name or a source correspondence.','Engine and co-op classification applies to diagnostic context only; it is not a whole-function semantic attribution.','No source build/runtime/parity claim is made.']}
    if expanded:
        proof['expanded_input_commitments']=expanded
        proof['original_plan_commitments']={key:plan.get(key) for key in ['seed_scope','seed_count','declared_start_count','starts','starts_sha256','complement_inventory','pointer_selection','script_sha256','tooling']}
        proof['original_plan_commitments']['starts']=project_path(plan['starts']).relative_to(ROOT).as_posix()
        if plan.get('complement_inventory'):
            rec=plan['complement_inventory']
            proof['original_plan_commitments']['complement_inventory']={**rec,'path':project_path(rec['path']).relative_to(ROOT).as_posix()}
    if available:proof['available_exact_outputs']=available
    if guarded_partition is not None:proof['guarded_jump_partition']=guarded_partition
    proof['generator']={'path':Path(__file__).resolve().relative_to(ROOT).as_posix(),'sha256':sha(Path(__file__))}
    if args.write:
        OUT.parent.mkdir(parents=True,exist_ok=True)
        OUT.write_text(json.dumps(proof,indent=2,ensure_ascii=False)+'\n')
    else:
        assert proof==load(OUT),'Unknown queue proof drift; review exact inputs/selectors before --write'
    print(json.dumps({'target_sha256':SHA,'selectors':len(selectors),'input_artifacts':len(inputs),'proof_sha256':sha(OUT),'written':args.write,'native_analysis_run':False,'compilation_run':False,'game_run':False},indent=2))


if __name__ == "__main__":
    main()
