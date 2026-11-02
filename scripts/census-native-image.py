#!/usr/bin/env python3
"""Stream a hash-bound full-image Ghidra census through the project REA driver.

No target execution or application compilation. Whole-image decoding/ownership
observations remain distinct from source semantics and verified parity.
"""
import argparse
from bisect import bisect_right
import csv
import gzip
import hashlib
import importlib.util
import os
import json
import sqlite3
import subprocess
import sys
import shutil
import fcntl
import uuid
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, artifact_path
from shared_native_inventory import open_readonly as open_native_inventory

# These exact predecessors differ only in storage/launch coordination. Their
# archived bytes remain verifiable inputs; the collector itself is executed from
# its exact archived source for a legacy frozen plan.
STORAGE_PREDECESSORS = {
    'scripts/census-native-image.py': 'e3cfacf62eb4a49efc06562e3211a1aad2032f889c64ffe1ebb711c4efcf5a51',
    'scripts/rea-native-census.mjs': '234161bf645f2473bfdebea16c9753f2955b7f945236604193536f968670edc4',
    'scripts/ghidra/ReaNativeCensus.java': 'd91f77b533a723c6c8ab128b4d55c9aa0d94abc6f3f6e6ae8e54c46f1a045b09',
}

# Native collectors remain exact frozen producers. The current launch adapter may
# execute these retained sources; it never labels their output as this collector.
RETAINED_PREDECESSORS = {
    'scripts/census-native-image.py': {'8eef819cdb2ac9d3b52db40574d25fca77c07a68cc1f11506105950ad22138e4', 'd82a3403c34190240869e4add97faa71b3212bc9657a0a2999b9828cbbb1b077',
                                     '52e6f0de2d6706651c0ff5eef6e0e79993e77655e3d162b207db935388326d82',
                                     '5f3ed21972cd41a1a7842a56d9c660a2ef74d511553d98c39c6798f7c8ab7834'},
    'scripts/rea-native-census.mjs': {'14f5884b7354d2713118bd250a7ea19e23b487690ddd2a705979ca15d0dec780', '8df8dc3bfa71e20831a8ae0a0163aae92e7680bfbf0ed0c0b1d1c3a4ed98ca70',
                                   '69da5e89ef57528e5f9a036d32b403a4e78f793b2bf4def28657c64eb8381f61',
                                   '4df2787ab8a73cc106bf295f0eed9c9d772e61d0474d87c242dffe37d3f96f68'},
    'scripts/ghidra/ReaNativeCensus.java': {'3d06fe81ef6d16802020e2b1013c11a6d50fde3090ba277fb2ac161de81b0eb3',
                                         '9620e0505314b2ce1797f7419c89c9919beac2adfa772289bcfc15006a9be9df'},
}

def committed_tool_path(name, expected, root=ROOT):
    path=(Path(root)/name).resolve()
    if not path.is_relative_to(Path(root).resolve()):raise ValueError('Resume tool/input path escapes project')
    if path.is_file() and hashlib.sha256(path.read_bytes()).hexdigest()==expected:return path
    retained=Path(root)/'runtime/analysis/tools'/expected/Path(name).name
    if (STORAGE_PREDECESSORS.get(name)==expected or expected in RETAINED_PREDECESSORS.get(name,set())) and retained.is_file() and hashlib.sha256(retained.read_bytes()).hexdigest()==expected:return retained
    raise ValueError('Resume tool/input digest differs: '+name)

def canonical_census_directory(plan, root=ROOT):
    """A pass receipt is content/analysis-bound, never task-name/path-bound."""
    identity={key:plan.get(key) for key in ('format','target_sha256','starts_sha256','script_sha256','seed_scope')}
    if 'decoder_contract' in plan:
        if plan['decoder_contract'] not in ('rea-incremental-census-v1','rea-incremental-census-v2'):
            raise ValueError('Unsupported census decoder contract')
        identity['decoder_contract']=plan['decoder_contract']
    for name in ('address_leads','unwind_handlers','import_thunks','jump_tables','diagnostic_leads'):
        identity[name]=(plan.get(name) or {}).get('sha256')
    identity['disabled_analyzers']=sorted(plan.get('disabled_analyzers',[]))
    if 'incremental_reuse' in plan:identity['incremental_reuse']=plan['incremental_reuse']
    if plan.get('persistence',{}).get('variant'):identity['variant']=plan['persistence']['variant']
    key=hashlib.sha256(json.dumps(identity,sort_keys=True,separators=(',',':')).encode()).hexdigest()
    return Path(root)/'runtime/analysis/census'/plan['target_sha256']/key

def prepare_census_output(directory, *, resume=False):
    """Return a saved plan, or admit a missing/empty directory for a new run.

    Pipeline writers may create output parents before invoking the driver. Their
    empty directory is not a checkpoint; unrecognized nonempty state must remain
    untouched, and explicit resume always requires a saved plan.
    """
    directory=Path(directory)
    plan_path=directory/'plan.json'
    if directory.exists() and not directory.is_dir():
        raise ValueError('Census output is not a directory')
    if plan_path.is_file():return plan_path
    if resume:raise ValueError('Resume requires an existing census plan.json')
    if directory.exists():
        if any(directory.iterdir()):
            raise ValueError('Nonempty census output has no recognized plan.json; preserve it and choose a new output')
    else:directory.mkdir(parents=True,exist_ok=False)
    return None

def restore_census_aliases(plan, root=ROOT):
    """Recover hash-bound input aliases after an interrupted directory move."""
    root=Path(root).resolve();directory=Path(plan['output']).resolve()
    for row in plan.get('storage_aliases',[]):
        alias=directory/row['path'];target=Path(row['target']).resolve()
        if not alias.parent.resolve().is_relative_to(directory) or not target.is_relative_to(root/'runtime'):
            raise ValueError('Census storage alias escapes runtime')
        if not alias.is_symlink() or hashlib.sha256(target.read_bytes()).hexdigest()!=row['sha256']:
            raise ValueError('Census storage alias/target differs')
        value=os.path.relpath(target,alias.parent.resolve())
        if os.readlink(alias)==value:continue
        temporary=alias.with_name('.'+alias.name+'.rebase-'+uuid.uuid4().hex)
        try:temporary.symlink_to(value);temporary.replace(alias)
        finally:temporary.unlink(missing_ok=True)

def publish_census_plan(plan, directory, target, root=ROOT):
    """Publish a newly staged pass once; task output paths become aliases."""
    root=Path(root).resolve();directory=Path(directory).resolve()
    if not directory.is_relative_to(root/'runtime') or Path(plan['output']).resolve()!=directory:
        raise ValueError('New census staging directory differs')
    canonical_directory=canonical_census_directory(plan,root)
    canonical_directory.parent.mkdir(parents=True,exist_ok=True)
    with (canonical_directory.parent/'registry.lock').open('a+') as lease:
        fcntl.flock(lease.fileno(),fcntl.LOCK_EX)
        if canonical_directory!=directory:
            requested=directory
            if canonical_directory.exists():
                retained=load_json(canonical_directory/'plan.json');restore_census_aliases(retained,root)
                retained=validate_resume_plan(retained,target,root)
                # Only inputs freshly staged by this invocation can be removed.
                shutil.rmtree(requested)
                requested.symlink_to(os.path.relpath(canonical_directory,requested.parent),target_is_directory=True)
                directory=canonical_directory;plan=retained
            else:
                previous=str(directory)
                def relocate(value):
                    if isinstance(value,dict):return {key:relocate(item) for key,item in value.items()}
                    if isinstance(value,list):return [relocate(item) for item in value]
                    if isinstance(value,str) and (value==previous or value.startswith(previous+os.sep)):return str(canonical_directory)+value[len(previous):]
                    return value
                plan=relocate(plan)
                aliases=[]
                for base,dirs,files in os.walk(requested,followlinks=False):
                    if any((Path(base)/name).is_symlink() for name in dirs):raise ValueError('Fresh census staging contains a directory alias; preserve and resolve it before publication')
                    for name in files:
                        path=Path(base)/name
                        if path.is_symlink() and not os.path.isabs(os.readlink(path)):
                            original=path.resolve();destination=canonical_directory/original.relative_to(requested) if original.is_relative_to(requested) else original
                            aliases.append({'path':path.relative_to(requested).as_posix(),'target':str(destination),'sha256':hashlib.sha256(path.read_bytes()).hexdigest()})
                if aliases:plan['storage_aliases']=aliases
                # Publish the frozen plan before the directory rename. A crash
                # can lose an alias, but never expose a canonical pass without
                # its exact resumable plan/input commitments.
                with (requested/'plan.json').open('w') as stream:
                    stream.write(json_text(plan));stream.flush();os.fsync(stream.fileno())
                requested.rename(canonical_directory)
                restore_census_aliases(plan,root)
                requested.symlink_to(os.path.relpath(canonical_directory,requested.parent),target_is_directory=True)
                directory=canonical_directory
        plan_path=directory/'plan.json'
        if not plan_path.exists():plan_path.write_text(json_text(plan))
        return plan,directory

def validate_resume_plan(plan, target, root=ROOT):
    """Reject stale inputs; optimistic progress alone cannot resume a database."""
    root = Path(root).resolve()
    persistence = plan.get('persistence', {})
    if persistence.get('format') != 'ghidra-program-checkpoint-v1':
        raise ValueError('Legacy census has no durable Program checkpoint; use a new output')
    if plan.get('decoder_contract','rea-incremental-census-v1') not in ('rea-incremental-census-v1','rea-incremental-census-v2'):
        raise ValueError('Unsupported census decoder contract')
    for key, expected in (('target_version', target['version']), ('target_sha256', target['sha256'])):
        if plan.get(key) != expected:
            raise ValueError('Resume target identity differs: ' + key)
    expected_target = artifact_path(target['path']) if root == ROOT else root / target['path']
    if Path(plan['target_path']).resolve() != expected_target.resolve():
        raise ValueError('Resume target path differs')
    if hashlib.sha256(expected_target.read_bytes()).hexdigest() != target['sha256']:
        raise ValueError('Resume target bytes changed')
    for value in (plan['output'], plan['starts'], persistence['project_root']):
        path = Path(value).resolve()
        if not path.is_relative_to(root / 'runtime'):
            raise ValueError('Resume path escapes project runtime: ' + str(value))
    if persistence.get('shared_workspace'):
        if not Path(persistence['project_root']).resolve().is_relative_to(root/'runtime/analysis/programs'):
            raise ValueError('Shared census Program path differs')
    elif Path(persistence['project_root']).resolve() != (Path(plan['output']).resolve() / 'project').resolve():
        raise ValueError('Resume database path differs from census output')
    if persistence.get('project_name') != 'NativeCensus' or persistence.get('program_name') != expected_target.name:
        raise ValueError('Resume database/program identity differs')
    commitments = {**plan['tooling'], plan['starts']: plan['starts_sha256']}
    if plan.get('script_sha256') != plan['tooling'].get('scripts/ghidra/ReaNativeCensus.java'):
        raise ValueError('Resume collector script commitment differs')
    for name, expected in commitments.items():
        path = (root / name).resolve()
        if not path.is_relative_to(root):
            raise ValueError('Resume tool/input path escapes project')
        committed_tool_path(name,expected,root)
    return plan

def snapshot_input(source,destination,expected_digest):
    """Commit exactly the bytes selected by a hash-bound proof summary."""
    raw=source.read_bytes()
    if hashlib.sha256(raw).hexdigest()!=expected_digest:raise ValueError('Proof input changed before immutable snapshot')
    destination.write_bytes(raw)
    return destination


def observed_body_index(target,expected_summary_sha256=None,primary_summary=None):
    """Load only independently verified, target-bound Ghidra body ranges."""
    report_path=(ROOT/(primary_summary or 'docs/analysis/coverage/full-image-census.json')).resolve()
    if not report_path.is_relative_to(ROOT):raise ValueError('Primary body summary escapes checkout')
    report=load_json(report_path)
    summary_sha=file_sha256(report_path)
    if expected_summary_sha256 is not None and summary_sha!=expected_summary_sha256:
        retained=report.get('full_summary_snapshot',{})
        retained_path=(ROOT/retained.get('path','')).resolve()
        if not retained_path.is_relative_to(ROOT) or retained.get('sha256')!=expected_summary_sha256 or file_sha256(retained_path)!=expected_summary_sha256:
            raise ValueError('Original body-summary commitment is unavailable or differs')
        report=load_json(retained_path);summary_sha=expected_summary_sha256
    if report['target']['sha256']!=target['sha256'] or not report['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('Expanded seed selection requires a verified current full-body census')
    body_path=ROOT/report['artifacts']['directory']/'bodies.tsv.gz'
    body_sha=report['artifacts']['files']['bodies.tsv.gz']['sha256']
    if file_sha256(body_path)!=body_sha:raise ValueError('Expanded seed body inventory differs')
    ranges=[]
    with gzip.open(body_path,'rt',newline='') as stream:
        for row in csv.DictReader(stream,delimiter='\t'):
            if row['external']=='false':ranges.append((int(row['start'],16),int(row['end'],16)))
    ranges.sort();body_starts=[start for start,_ in ranges]
    def owned(value):
        index=bisect_right(body_starts,value)-1
        return index>=0 and value<=ranges[index][1]
    commitment={'body_summary':report_path.relative_to(ROOT).as_posix(),
        'body_summary_sha256':summary_sha,'body_inventory':body_path.relative_to(ROOT).as_posix(),
        'body_inventory_sha256':body_sha}
    return owned,commitment


def pointer_leaf_starts(target, pe, pe_module,expected_summary_sha256=None,primary_summary=None):
    """Select relocated executable pointers outside established native bodies."""
    owned,commitment=observed_body_index(target,expected_summary_sha256,primary_summary)
    executable=[section for section in pe.sections if int(section['characteristics'],16)&0x20000000]
    targets={value for site,kind,value in pe_module.relocations(pe)[0] if kind==10 and
        any(pe.image_base+section['rva']<=value<pe.image_base+section['rva']+section['virtual_size'] for section in executable)}
    selected={value for value in targets if not owned(value)}
    return selected,{**commitment,'distinct_executable_pointer_targets':len(targets),
        'targets_without_observed_bodies':len(selected),'target_source_semantics_established':False}


def argument_parser():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run',action='store_true')
    parser.add_argument('--resume',action='store_true',help='Resume an existing hash-bound durable Program; never overwrite a legacy run')
    parser.add_argument('--output',default=None)
    parser.add_argument('--startup-timeout',type=int,default=7200)
    parser.add_argument('--heap',default='6G')
    parser.add_argument('--batch-size',type=int,default=1024)
    parser.add_argument('--checkpoint-seconds',type=float,default=30,help='Save a durable Program checkpoint after this much productive batch time')
    parser.add_argument('--checkpoint-max-batches',type=int,default=256,help='Safety ceiling between saves; the 30-second time limit remains the normal checkpoint policy')
    parser.add_argument('--full-recompute',action='store_true',help='Repair every current entry; establishes an independent new-profile comparison receipt')
    parser.add_argument('--program-variant',help='Explicit incompatible analysis experiment; never aliases the canonical Program')
    parser.add_argument('--primary-summary',help='Verified declared-body summary for expanded seed selection; default is selected canonical summary')
    parser.add_argument('--stall-timeout',type=int,default=600,help='No-progress watchdog; total productive analysis has no startup deadline')
    parser.add_argument('--checkpoint-limit',type=int,help='Stop cleanly after this many saved batches, for interruption/resume verification')
    parser.add_argument('--jump-tables',help='Verified guarded-jump-table compact summary inside this checkout')
    parser.add_argument('--address-leads',help='Validated address-taken code-only lead summary')
    parser.add_argument('--diagnostic-leads',help='Hash-bound exact diagnostic code-only seed inventory')
    parser.add_argument('--import-thunks',help='Exact RIP-LEA / executable PE-IAT thunk seed summary')
    parser.add_argument('--unwind-handlers',help='Exact AMD64 unwind / PE-directory entry seed summary')
    parser.add_argument('--seed-scope',choices=('all','declared','complement','pointers'),default='declared')
    return parser


def main():
    args=argument_parser().parse_args()
    target=latest_target()
    directory=(ROOT/(args.output or f"runtime/coverage/{target['sha256']}/ghidra/full-image-durable")).resolve()
    if not directory.is_relative_to(ROOT / 'runtime'):raise ValueError('Output escapes project runtime')
    if not args.run and not args.resume:
        path=directory/'progress.json'
        if path.exists():
            progress=load_json(path)
            print(json_text({key:value for key,value in progress.items() if key != 'helper_targets'}).rstrip())
        else:print('Full-image durable census not run')
        return 0
    if min(args.startup_timeout,args.batch_size,args.stall_timeout,args.checkpoint_seconds,args.checkpoint_max_batches)<=0:raise ValueError('Positive timeout/batch required')
    plan_path=prepare_census_output(directory,resume=args.resume)
    if plan_path is not None:
        plan=load_json(plan_path);restore_census_aliases(plan)
        plan=validate_resume_plan(plan,target)
        print('Resuming exact saved census plan; native work continues from the Program checkpoint',flush=True)
        environment=dict(os.environ,GHIDRA_HEADLESS_MAXMEM=plan['heap'])
        if args.checkpoint_limit is not None:environment['REA_CENSUS_CHECKPOINT_LIMIT']=str(args.checkpoint_limit)
        os.chdir(ROOT)
        os.execve(str(ROOT/'scripts/rea'),[str(ROOT/'scripts/rea'),'census-native-image',str(plan_path)],environment)
    pe_spec=importlib.util.spec_from_file_location('census_pe',ROOT/'scripts/inventory-current-target.py')
    pe_module=importlib.util.module_from_spec(pe_spec);pe_spec.loader.exec_module(pe_module)
    pe=pe_module.pe_parser(target_bytes(target))
    declared={pe.image_base+row[0] for row in pe.functions()}
    starts=set() if args.seed_scope in ('complement','pointers') else declared.copy()
    supplemental=None
    if args.seed_scope in ('all','complement'):
        database=ROOT/f"runtime/coverage/{target['sha256']}/unwind-complement.sqlite"
        with open_native_inventory(database) as connection:
            metadata=json.loads(connection.execute('select value from metadata').fetchone()[0])
            if metadata['target']['sha256']!=target['sha256']:raise ValueError('Complement target differs')
            candidates={row[0] for row in connection.execute('select distinct target from seeds')}
        starts.update(candidates)
        supplemental={'path':database.relative_to(ROOT).as_posix(),'sha256':file_sha256(database),'seeds':len(candidates)}
    pointer_selection=None
    if args.seed_scope in ('all','pointers'):
        pointer_starts,pointer_selection=pointer_leaf_starts(target,pe,pe_module,primary_summary=args.primary_summary)
        if args.seed_scope=='pointers':starts=pointer_starts
        else:
            owned,_=observed_body_index(target,primary_summary=args.primary_summary)
            starts={value for value in starts if value in declared or not owned(value)}
            starts.update(pointer_starts)
    import_thunks=None
    if args.import_thunks:
        if args.seed_scope!='all':raise ValueError('Import-thunk seeds require the integrated all-seed queue')
        import capstone
        summary_path=(ROOT/args.import_thunks).resolve()
        if not summary_path.is_relative_to(ROOT):raise ValueError('Import-thunk summary escapes checkout')
        summary_bytes=summary_path.read_bytes();summary=json.loads(summary_bytes);inventory=(ROOT/summary['inventory']['path']).resolve()
        if not inventory.is_relative_to(ROOT):raise ValueError('Import-thunk inventory escapes checkout')
        inventory=snapshot_input(inventory,directory/'import-thunks-input.json',summary['inventory']['sha256'])
        spec=importlib.util.spec_from_file_location('import_thunk_selection',ROOT/'scripts/recover-native-import-thunks.py')
        helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
        if summary['generator']['sha256']!=file_sha256(ROOT/'scripts/recover-native-import-thunks.py'):raise ValueError('Import-thunk proof generator differs')
        starts.update(helper.verify_inventory(load_json(inventory),target,pe,capstone))
        snapshot=directory/'import-thunks-input-summary.json';snapshot.write_bytes(summary_bytes)
        import_thunks={'path':inventory.relative_to(ROOT).as_posix(),'sha256':file_sha256(inventory),
            'summary':snapshot.relative_to(ROOT).as_posix(),'summary_sha256':file_sha256(snapshot)}
    unwind_handlers=None
    if args.unwind_handlers:
        if args.seed_scope!='all':raise ValueError('PE metadata entries require the integrated all-seed queue')
        summary_path=(ROOT/args.unwind_handlers).resolve()
        if not summary_path.is_relative_to(ROOT):raise ValueError('PE metadata summary escapes checkout')
        summary_bytes=summary_path.read_bytes();summary=json.loads(summary_bytes);inventory=(ROOT/summary['inventory']['path']).resolve()
        if not inventory.is_relative_to(ROOT):raise ValueError('PE metadata inventory escapes checkout')
        inventory=snapshot_input(inventory,directory/'unwind-handlers-input.json',summary['inventory']['sha256'])
        spec=importlib.util.spec_from_file_location('unwind_entry_selection',ROOT/'scripts/recover-native-unwind-handlers.py')
        helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
        if summary['generator']['sha256']!=file_sha256(ROOT/'scripts/recover-native-unwind-handlers.py'):raise ValueError('PE metadata generator differs')
        starts.update(helper.verify_inventory(load_json(inventory),target,pe))
        snapshot=directory/'unwind-handlers-input-summary.json';snapshot.write_bytes(summary_bytes)
        unwind_handlers={'path':inventory.relative_to(ROOT).as_posix(),'sha256':file_sha256(inventory),
            'summary':snapshot.relative_to(ROOT).as_posix(),'summary_sha256':file_sha256(snapshot)}
    starts_path=directory/'starts.tsv';starts_path.write_text(''.join(f'{address:x}\n' for address in sorted(starts)))
    patch_spec=importlib.util.spec_from_file_location('rea_census_patch',ROOT/'scripts/repair-rea-native-census.py')
    patch=importlib.util.module_from_spec(patch_spec);patch_spec.loader.exec_module(patch)
    path,expected,changed,upstream=patch.changes()
    if changed:raise ValueError('Apply repair-rea-native-census.py --apply first')
    if patch.snapshot_changes()[2]:raise ValueError('Apply repair-rea-native-census.py --apply first')
    tools={name:file_sha256(ROOT/name) for name in ('scripts/ghidra/ReaNativeCensus.java','scripts/census-native-image.py','scripts/rea-native-census.mjs','scripts/repair-rea-native-census.py','scripts/repair-rea-reference-input.py','node_modules/rea-agents/dist/ghidra/GhidraLauncher.js','node_modules/rea-agents/dist/ghidra/GhidraTargetSnapshot.js')}
    jump_tables=None
    if args.jump_tables:
        if args.seed_scope!='all':raise ValueError('Guarded flow edges require the integrated all-seed queue')
        jump_summary_path=(ROOT/args.jump_tables).resolve()
        if not jump_summary_path.is_relative_to(ROOT):raise ValueError('Jump table summary escapes checkout')
        jump_summary_bytes=jump_summary_path.read_bytes();jump_summary=json.loads(jump_summary_bytes)
        if jump_summary['target']['sha256']!=target['sha256']:raise ValueError('Jump table summary target differs')
        jump_path=(ROOT/jump_summary['inventory']['path']).resolve()
        if not jump_path.is_relative_to(ROOT):raise ValueError('Jump table inventory escapes checkout')
        jump_path=snapshot_input(jump_path,directory/'guarded-tables-input.json',jump_summary['inventory']['sha256'])
        jump_summary_snapshot=directory/'jump-tables-input-summary.json'
        jump_summary_snapshot.write_bytes(jump_summary_bytes)
        jump_tables={'path':str(jump_path),'sha256':jump_summary['inventory']['sha256'],
            'summary':jump_summary_snapshot.relative_to(ROOT).as_posix(),'summary_sha256':file_sha256(jump_summary_snapshot),
            'selected_summary':jump_summary_path.relative_to(ROOT).as_posix()}
    diagnostic_leads=None
    if args.diagnostic_leads:
        if args.seed_scope!='all':raise ValueError('Diagnostic code leads require the integrated all-seed queue')
        path=(ROOT/args.diagnostic_leads).resolve()
        if not path.is_relative_to(ROOT):raise ValueError('Diagnostic code leads escape checkout')
        path=snapshot_input(path,directory/'diagnostic-code-input.json',file_sha256(path))
        payload=load_json(path)
        if payload['target']['sha256']!=target['sha256'] or payload.get('function_entry_or_incoming_flow_edges_inferred') is not False:raise ValueError('Invalid diagnostic code-only inventory')
        diagnostic_leads={'path':str(path),'sha256':file_sha256(path)}
    address_leads=None
    if args.address_leads:
        if args.seed_scope!='all':raise ValueError('Address-code leads require the integrated all-seed queue')
        import capstone
        summary_path=(ROOT/args.address_leads).resolve()
        if not summary_path.is_relative_to(ROOT):raise ValueError('Address-code summary escapes checkout')
        summary_bytes=summary_path.read_bytes();summary=json.loads(summary_bytes);source=(ROOT/summary['inventory']['path']).resolve()
        if not source.is_relative_to(ROOT):raise ValueError('Address-code inventory escapes checkout')
        inventory=snapshot_input(source,directory/'address-code-input.json',summary['inventory']['sha256'])
        spec=importlib.util.spec_from_file_location('address_code_selection',ROOT/'scripts/recover-native-address-leads.py');helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper)
        if summary['generator']['sha256']!=file_sha256(ROOT/'scripts/recover-native-address-leads.py'):raise ValueError('Address-code generator differs')
        helper.verify_inventory(load_json(inventory),target,pe,capstone)
        snapshot=directory/'address-code-input-summary.json';snapshot.write_bytes(summary_bytes)
        address_leads={'path':str(inventory),'sha256':file_sha256(inventory),'summary':snapshot.relative_to(ROOT).as_posix(),'summary_sha256':file_sha256(snapshot)}
        tools['scripts/recover-native-address-leads.py']=file_sha256(ROOT/'scripts/recover-native-address-leads.py')
    if import_thunks:tools['scripts/recover-native-import-thunks.py']=file_sha256(ROOT/'scripts/recover-native-import-thunks.py')
    if unwind_handlers:tools['scripts/recover-native-unwind-handlers.py']=file_sha256(ROOT/'scripts/recover-native-unwind-handlers.py')
    plan={'format':'rea-whole-image-native-census-address-code-v6' if address_leads else 'rea-whole-image-native-census-pe-entries-v5' if unwind_handlers else 'rea-whole-image-native-census-import-thunks-v4' if import_thunks else 'rea-whole-image-native-census-diagnostic-code-v3' if diagnostic_leads else 'rea-whole-image-native-census-guarded-tables-v2' if jump_tables else 'rea-whole-image-native-census-v1','address_leads':address_leads,'unwind_handlers':unwind_handlers,'import_thunks':import_thunks,'jump_tables':jump_tables,'diagnostic_leads':diagnostic_leads,'output':str(directory),'target_path':str(artifact_path(target['path'])),
        'target_sha256':target['sha256'],'target_version':target['version'],'decoder_contract':'rea-incremental-census-v2',
        'starts':str(starts_path),'starts_sha256':file_sha256(starts_path),'seed_count':len(starts),
        'seed_scope':args.seed_scope,'declared_start_count':len(declared),'complement_inventory':supplemental,'pointer_selection':pointer_selection,
        'script_sha256':tools['scripts/ghidra/ReaNativeCensus.java'],'tooling':tools,
        'startup_timeout_ms':args.startup_timeout*1000,'batch_size':args.batch_size,
        'incremental_reuse':not args.full_recompute,'checkpoint_interval_ms':max(1,int(args.checkpoint_seconds*1000)),
        'checkpoint_max_batches':args.checkpoint_max_batches,
        'stall_timeout_ms':args.stall_timeout*1000,'heap':args.heap,
        'persistence':{'format':'ghidra-program-checkpoint-v1','shared_workspace':True,'project_root':str(ROOT/'runtime/analysis/programs'/target['sha256']/'census'),
            'project_name':'NativeCensus','program_name':artifact_path(target['path']).name},
        'disabled_analyzers':['Stack','Decompiler Switch Analysis','Function ID','Function Start Search','Disassemble Entry Points','Subroutine References','Data Reference','Reference','Non-Returning Functions - Discovered','Shared Return Calls','Create Address Tables','Call Convention ID'],
        'samples':[hex(address) for address in sorted(starts)[:3]],
        'native_source_semantics_complete':False,'parity_verified':False}
    if args.program_variant:
        import re
        if not re.fullmatch(r'[a-zA-Z0-9][a-zA-Z0-9_.-]{0,95}',args.program_variant):raise ValueError('Invalid explicit Program variant')
        plan['persistence']['variant']=args.program_variant
    plan,directory=publish_census_plan(plan,directory,target)
    plan_path=directory/'plan.json'
    environment=dict(os.environ,GHIDRA_HEADLESS_MAXMEM=args.heap)
    if args.checkpoint_limit is not None:environment['REA_CENSUS_CHECKPOINT_LIMIT']=str(args.checkpoint_limit)
    print(f"Full-image census: {len(starts)} starts, {args.heap} heap, {directory.relative_to(ROOT)}",flush=True)
    os.chdir(ROOT)
    os.execve(str(ROOT/'scripts/rea'),[str(ROOT/'scripts/rea'),'census-native-image',str(plan_path)],environment)
if __name__=='__main__':sys.exit(main())
