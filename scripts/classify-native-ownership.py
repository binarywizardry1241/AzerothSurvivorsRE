#!/usr/bin/env python3
"""Classify static native/source/import/pointer candidates after verified census.

Exact diagnostic paths and baseline source hashes are candidates, never proof
of the target's source revision. Fixed slots preserve their initial image value;
local register propagation is deliberately bounded and not runtime observation.
"""
from runtime_layout import retained_runtime_path
import argparse
from collections import Counter, deque
import csv
import gzip
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import sqlite3
import struct
import sys
import tarfile
import tempfile
from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path, same_artifact
from shared_native_inventory import open_readonly_uri as open_native_inventory, selected_inventory
from derived_gzip import derived_gzip_text
from instruction_facts import InstructionFacts, HELPER_SHA256 as FACTS_SHA256
GENERATOR_SHA256=file_sha256(ROOT/'scripts/classify-native-ownership.py')
DERIVED_GZIP_SHA256=file_sha256(ROOT/'scripts/derived_gzip.py')


def artifact_path(value):
    """Validate a project path while preserving its final file alias."""
    project_path(value)
    path=Path(value)
    if not path.is_absolute():path=ROOT/path
    return path.parent.resolve()/path.name


def derived_json(path,value,*,publish=False):
    """Compare without writes, or atomically publish changed JSON bytes."""
    path=artifact_path(path);data=json_text(value).encode('utf-8')
    try:existing=path.read_bytes()
    except FileNotFoundError:existing=None
    if existing==data:return
    if not publish:raise ValueError('Derived ownership JSON is missing or differs: '+str(path))
    path.parent.mkdir(parents=True,exist_ok=True)
    descriptor,name=tempfile.mkstemp(prefix='.'+path.name+'.',suffix='.tmp',dir=path.parent)
    temporary=Path(name)
    try:
        with os.fdopen(descriptor,'wb') as stream:stream.write(data)
        temporary.replace(path)
    finally:temporary.unlink(missing_ok=True)


def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path)
    value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value


def canonical_register(name):
    families={'rax':('rax','eax','ax','al','ah'),'rbx':('rbx','ebx','bx','bl','bh'),
        'rcx':('rcx','ecx','cx','cl','ch'),'rdx':('rdx','edx','dx','dl','dh'),
        'rsi':('rsi','esi','si','sil'),'rdi':('rdi','edi','di','dil'),
        'rbp':('rbp','ebp','bp','bpl'),'rsp':('rsp','esp','sp','spl')}
    for register,aliases in families.items():
        if name in aliases:return register
    match=re.fullmatch(r'(r\d+)(?:d|w|b)?',name)
    return match[1] if match else name


def memory_address(instruction,operand,state,capstone):
    memory=operand.mem
    if memory.segment:return None
    value=memory.disp
    if memory.base==capstone.x86_const.X86_REG_RIP:value+=instruction.address+instruction.size
    elif memory.base:
        base=state.get(canonical_register(instruction.reg_name(memory.base)))
        if not base or base[0]!='value':return None
        value+=base[1]
    if memory.index:
        index=state.get(canonical_register(instruction.reg_name(memory.index)))
        if not index or index[0]!='value':return None
        value+=index[1]*memory.scale
    return value&((1<<(instruction.addr_size*8))-1)


def local_values(instructions,read_slot,capstone):
    """Conservative encoded-value propagation through one observed straight line."""
    state={};x86=capstone.x86_const
    for instruction in instructions:
        if any(instruction.group(group) for group in (capstone.CS_GRP_CALL,capstone.CS_GRP_JUMP,capstone.CS_GRP_RET,capstone.CS_GRP_INT,capstone.CS_GRP_IRET)) or instruction.mnemonic=='ud2':
            state.clear()
            continue
        operands=instruction.operands;result=None;destination=None
        if len(operands)>=2 and operands[0].type==x86.X86_OP_REG:
            destination=canonical_register(instruction.reg_name(operands[0].reg));source=operands[1]
            if instruction.mnemonic in ('mov','movabs'):
                if source.type==x86.X86_OP_IMM:result=('value',source.imm&((1<<64)-1))
                elif source.type==x86.X86_OP_REG:result=state.get(canonical_register(instruction.reg_name(source.reg)))
                elif source.type==x86.X86_OP_MEM and source.size==8:
                    slot=memory_address(instruction,source,state,capstone)
                    if slot is not None:result=read_slot(slot)
            elif instruction.mnemonic=='lea' and source.type==x86.X86_OP_MEM:
                value=memory_address(instruction,source,state,capstone)
                if value is not None:result=('value',value)
            elif instruction.mnemonic in ('xor','sub') and source.type==x86.X86_OP_REG and source.reg==operands[0].reg:
                result=('value',0)
            elif instruction.mnemonic in ('add','sub') and source.type==x86.X86_OP_IMM:
                previous=state.get(destination)
                if previous and previous[0]=='value':result=('value',previous[1]+source.imm*(1 if instruction.mnemonic=='add' else -1))
        try:writes=instruction.regs_access()[1]
        except capstone.CsError:writes=[]
        for register in writes:state.pop(canonical_register(instruction.reg_name(register)),None)
        if destination is not None and result is not None:
            # Partial-width assignments cannot retain a full native pointer.
            if operands[0].size==8:state[destination]=result
            elif operands[0].size==4 and result[0]=='value':state[destination]=('value',result[1]&0xffffffff)
    return state

def debug_payload(kind,raw):
    result={}
    if kind==2 and raw.startswith(b'RSDS') and len(raw)>=25:
        end=raw.find(b'\0',24)
        if end>=24:result={'signature':'RSDS','raw_guid_bytes':raw[4:20].hex(),'age':struct.unpack_from('<I',raw,20)[0],'pdb_path_in_record':raw[24:end].decode('utf8','replace')}
    if kind==13 and len(raw)>=4:
        cursor=4;entries=[]
        while cursor+8<len(raw):
            rva,size=struct.unpack_from('<II',raw,cursor);end=raw.find(b'\0',cursor+8)
            if end<0:break
            name=raw[cursor+8:end]
            if not name.startswith(b'.') or not all(32<=byte<127 for byte in name):break
            entries.append({'rva':hex(rva),'byte_count':size,'section_contribution_name':name.decode('ascii')});cursor=(end+4)&~3
        if cursor==len(raw):result={'payload_signature_hex':raw[:4].hex(),'section_contributions':entries,'named_function_or_source_symbols_recovered':0}
    return result

def debug_identity(pe):
    rva,size=pe.directories[6];records=[]
    if rva:
        start=pe.rva_offset(rva)
        if size%28:raise ValueError('Unsupported nonintegral PE debug directory')
        for offset in range(start,start+size,28):
            _,timestamp,major,minor,kind,count,payload_rva,payload_offset=struct.unpack_from('<IIHHIIII',pe.data,offset)
            raw=pe.data[payload_offset:payload_offset+count]
            if len(raw)!=count:raise ValueError('PE debug payload outside file')
            records.append({'type':kind,'file_offset':hex(payload_offset),'byte_count':count,'rva':hex(payload_rva),'sha256':hashlib.sha256(raw).hexdigest(),**debug_payload(kind,raw)})
    return {'directory_rva':hex(rva),'directory_byte_count':size,'records':records,'coff_symbol_table_offset':pe.symbol_offset,'coff_symbol_count':pe.symbol_count,
        'source_revision_or_behavior_proven':False,'external_pdb_files_inspected':False,
        'limits':['RSDS records an external symbol identity. Section contributions identify linker regions, not native function/source names or a compiled source revision.']}

def revision_literal_leads(image):
    values={}
    for match in re.finditer(rb'(?<![0-9A-Fa-f])[0-9A-Fa-f]{40}(?![0-9A-Fa-f])',image):
        text=match[0].decode('ascii');context=image[max(0,match.start()-160):min(len(image),match.end()+160)]
        role='rustc-path-stamp' if b'rustc/'+match[0] in context or b'rustc\\'+match[0] in context else 'upstream-url-context' if b'github.com/' in context else 'unattributed-numeric-or-data-literal'
        row=values.setdefault(text,{'literal':text,'occurrences':0,'context_kinds':set(),'first_file_offset':hex(match.start())})
        row['occurrences']+=1;row['context_kinds'].add(role)
    return {'isolated_40hex_occurrences':sum(row['occurrences'] for row in values.values()),'distinct_literals':len(values),
        'literals':[{**row,'context_kinds':sorted(row['context_kinds'])} for _,row in sorted(values.items())],
        'game_or_benilla_source_revision_proven':False,'compressed_or_abbreviated_revision_ids_excluded':False}


def path_evidence_role(diagnostic,resource_paths):
    if diagnostic['path'] in resource_paths:return 'confirmed-embedded-resource-comment'
    if diagnostic.get('location_records'):return 'native-location-record-bound'
    if diagnostic.get('verified_references'):return 'verified-instruction-reference-without-location-record'
    return 'literal-path-only-candidate'


def source_candidates(target,diagnostics,owner,expanded,resource_paths=None,*,systems_path=None):
    vendor_path=ROOT/'docs/analysis/benilla-vendor.json';vendor_digest=file_sha256(vendor_path)
    vendor=load_json(vendor_path);pristine={row['path']:row for row in vendor['files']}
    mapping_path=project_path(systems_path or 'docs/analysis/coverage/systems.json');mapping_digest=file_sha256(mapping_path);systems=load_json(mapping_path)
    if systems_path and systems.get('target',{}).get('sha256')!=target['sha256']:raise ValueError('Source mapping target differs')
    reconstruction={row.get('original_path'):row for row in systems['systems'] if row.get('original_path')}
    counts=Counter();roles=Counter();paths=[];resource_paths=resource_paths or {}
    for diagnostic in diagnostics['diagnostics']:
        name=diagnostic['path'];path=project_path(name);source={};baseline=pristine.get(name)
        role=path_evidence_role(diagnostic,resource_paths);roles[role]+=1
        if role=='confirmed-embedded-resource-comment':classification='embedded-resource-comment-path'
        elif path.is_file():
            before=path.stat();data=path.read_bytes();after=path.stat()
            if (before.st_size,before.st_mtime_ns)!=(after.st_size,after.st_mtime_ns):raise ValueError('Source changed during candidate review')
            digest=hashlib.sha256(data).hexdigest();lines=data.splitlines()
            classification='vendored-baseline-exact' if baseline and digest==baseline['sha256'] else 'present-source-modified-or-local'
            source={'path':name,'sha256':digest,'byte_count':len(data),'lines':len(lines),
                'pristine_vendor_sha256':baseline['sha256'] if baseline else None,
                'matches_pristine_vendor_bytes':bool(baseline and digest==baseline['sha256'])}
        else:classification='custom-reconstruction-owner' if diagnostic['custom_game_crate'] else 'missing-engine-source-candidate'
        counts[classification]+=1
        source_lines=sorted({reference['source_line'] for reference in diagnostic['verified_references'] if 'source_line' in reference})
        owners={owner(int(reference['instruction_address'],16)) for reference in diagnostic['verified_references']}
        mapped=reconstruction.get(name,{})
        paths.append({'diagnostic_path':name,'classification':classification,'path_evidence_role':role,'embedded_resource_evidence':resource_paths.get(name),'source_candidate':source,
            'verified_diagnostic_sites':len(diagnostic['verified_references']),
            'actual_body_owner_count':len(owners-{None}),'expanded_native_reference_owners':len(expanded.get(name,set())),'sites_without_body_owner':sum(owner(int(reference['instruction_address'],16)) is None for reference in diagnostic['verified_references']),
            'native_location_source_lines':source_lines,'native_source_lines_in_candidate_range':sum(0<line<=source.get('lines',0) for line in source_lines),
            'reconstruction_system':mapped.get('id'),'reconstruction_source_refs':mapped.get('source_refs',[]),
            'native_source_semantics_established':False})
    missing={row['diagnostic_path'] for row in paths if row['classification']=='missing-engine-source-candidate'}
    archives=[]
    for archive in sorted((ROOT/'runtime/analysis/history/native-recovery/upstream-sync/30a991f45830').glob('benilla-*.tar.gz')):
        matches=[];archive_digest=file_sha256(archive)
        with tarfile.open(archive) as source:
            for member in source:
                name=member.name.split('/',1)[-1]
                if member.isfile() and name in missing:
                    data=source.extractfile(member).read();matches.append({'path':name,'sha256':hashlib.sha256(data).hexdigest(),'byte_count':len(data)})
        if file_sha256(archive)!=archive_digest:raise ValueError('Source candidate archive changed during review')
        archives.append({'path':archive.relative_to(ROOT).as_posix(),'sha256':archive_digest,'missing_path_matches':matches})
    if file_sha256(vendor_path)!=vendor_digest or file_sha256(mapping_path)!=mapping_digest:raise ValueError('Source candidate mapping changed during review')
    return {'vendor_revision':vendor['revision'],'vendor_manifest_sha256':vendor_digest,
        'source_mapping':{'path':mapping_path.relative_to(ROOT).as_posix(),'sha256':mapping_digest,
            'target':systems.get('target'),'current_target_binding':systems.get('target',{}).get('sha256')==target['sha256'],
            'role':'Source correspondence candidates; no native contract or whole-module equivalence admission.'},
        'counts':dict(sorted(counts.items())),'path_evidence_roles':dict(sorted(roles.items())),'paths':paths,'retained_archive_missing_path_search':archives,'target_source_revision_proven':False}


def run_full_native(args):
    import capstone
    target=latest_target();summary=load_json(project_path(args.census_summary))
    if summary['target']['sha256']!=target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('A verified selected-target census is required')
    directory=project_path(summary['artifacts']['directory'])
    artifact_directory=project_path(args.artifact_directory) if args.artifact_directory else directory
    if not artifact_directory.is_relative_to(ROOT/'runtime'):raise ValueError('Ownership artifacts must stay inside runtime/')
    if args.write:artifact_directory.mkdir(parents=True,exist_ok=True)
    for filename in ('instructions.tsv.gz','bodies.tsv.gz','references.tsv.gz'):
        if file_sha256(directory/filename)!=summary['artifacts']['files'][filename]['sha256']:
            raise ValueError('Native ownership artifact differs: '+filename)
    helpers=module('ownership_census','scripts/summarize-native-image.py');pe_helpers=module('ownership_pe','scripts/inventory-current-target.py')
    pe=pe_helpers.pe_parser(target_bytes(target));ranges=[]
    resolver_boundary_path=ROOT/f"docs/analysis/evidence/{target['version']}/native-resolver-boundaries.json"
    resolver_boundaries=load_json(resolver_boundary_path) if resolver_boundary_path.exists() else None
    if resolver_boundaries is not None and resolver_boundaries['target']['sha256']!=target['sha256']:raise ValueError('Resolver-boundary evidence target differs')
    def verify_resolver_boundary(value):
        if isinstance(value,dict):
            if all(key in value for key in ('va','byte_count','sha256')):
                offset=pe.rva_offset(int(value['va'],16)-pe.image_base);raw=pe.data[offset:offset+value['byte_count']]
                if hashlib.sha256(raw).hexdigest()!=value['sha256']:raise ValueError('Resolver-boundary code bytes differ')
            if all(key in value for key in ('slot','kind','target')):
                offset=pe.rva_offset(int(value['slot'],16)-pe.image_base)
                if int.from_bytes(pe.data[offset:offset+8],'little')!=int(value['target'],16):raise ValueError('Resolver callback pointer differs')
            for child in value.values():verify_resolver_boundary(child)
        elif isinstance(value,list):
            for child in value:verify_resolver_boundary(child)
    if resolver_boundaries is not None:verify_resolver_boundary(resolver_boundaries)
    source_boundary_path=ROOT/f"docs/analysis/evidence/{target['version']}/native-source-boundaries.json"
    source_boundaries=load_json(source_boundary_path) if source_boundary_path.exists() else None
    source_boundary_digest=file_sha256(source_boundary_path) if source_boundaries is not None else None
    resource_paths={}
    if source_boundaries is not None:
        if source_boundaries['target']['sha256']!=target['sha256']:raise ValueError('Source-boundary target differs')
        verify_resolver_boundary(source_boundaries)
        for row in source_boundaries.get('embedded_resource_paths',[]):
            if row.get('role')!='embedded-shader-comment':raise ValueError('Unsupported resource path role')
            value=row['resource'];offset=pe.rva_offset(int(value['va'],16)-pe.image_base);raw=pe.data[offset:offset+value['byte_count']]
            path_bytes=row['path'].encode('utf8')
            if not any(b'//' in line.split(path_bytes,1)[0] for line in raw.splitlines() if path_bytes in line):raise ValueError('Source resource path is not in an explicitly witnessed line comment')
            resource_paths[row['path']]=row
    for row in helpers.rows(directory/'bodies.tsv.gz'):
        if row['external']=='false':ranges.append((int(row['start'],16),int(row['end'],16),int(row['entry'],16)))
    owner=helpers.owner_lookup(ranges)
    imports={int(record['iat_start_address'],16)+8*index:('import',record['library'],name,int(record['iat_start_address'],16)+8*index)
        for record in pe.imports() for index,name in enumerate(record['functions'])}
    executable=[section for section in pe.sections if int(section['characteristics'],16)&0x20000000]
    def code_address(value):return any(pe.image_base+s['rva']<=value<pe.image_base+s['rva']+s['virtual_size'] for s in executable)
    relocation_rows=pe_helpers.relocations(pe)[0]
    relocated={pe.image_base+site:('value',value) for site,kind,value in relocation_rows if kind==10}
    pointers={slot:value for slot,value in relocated.items() if code_address(value[1])}
    def read_slot(slot):return imports.get(slot) or relocated.get(slot)
    diagnostic=load_json(ROOT/f"runtime/coverage/{target['sha256']}/diagnostic-ownership.json")
    if diagnostic['target']['sha256']!=target['sha256']:raise ValueError('Diagnostic ownership target differs')
    diagnostic_targets={}
    for path in diagnostic['diagnostics']:
        for occurrence in path['diagnostic_occurrences']:
            value=int(occurrence['virtual_address'],16)
            diagnostic_targets.setdefault(value,set()).add(path['path'])
        for location in path['location_records']:
            for field in (0,8,16,20):diagnostic_targets.setdefault(int(location['location_address'],16)+field,set()).add(path['path'])
    # Include exact relocation-backed carriers of a diagnostic pointer. This is
    # a data relationship, not a claim that any arbitrary adjacent word is code.
    literal_targets={key:set(value) for key,value in diagnostic_targets.items()}
    for slot,value in relocated.items():
        if value[1] in literal_targets:diagnostic_targets.setdefault(slot,set()).update(literal_targets[value[1]])
    expanded={};targets=set();import_owners={slot:set() for slot in imports};import_sites={slot:set() for slot in imports};resolver_owners=set()
    for row in helpers.rows(directory/'references.tsv.gz'):
        destination=helpers.address(row['to']);source=helpers.address(row['from']);source_owner=owner(source)
        if destination in imports and source_owner is not None:
            import_owners[destination].add(source_owner);import_sites[destination].add(source)
            if imports[destination][2]=='GetProcAddress':resolver_owners.add(source_owner)
        if source_owner is not None and destination in diagnostic_targets:
            for path in diagnostic_targets[destination]:expanded.setdefault(path,set()).add(source_owner)
        if 'JUMP' in row['type'] or 'CALL' in row['type']:
            destination=helpers.address(row['to'])
            if destination is not None:targets.add(destination)
    explicit_union=None
    if args.operand_summary:
        operand_path=project_path(args.operand_summary);operand_digest=file_sha256(operand_path);operand_summary=load_json(operand_path)
        source_census = operand_summary['source_census']
        if operand_summary['target'] != summary['target'] or not same_artifact(
                source_census['path'], args.census_summary, source_census['sha256']):
            raise ValueError('Explicit operand audit selects a different census')
        for commitment in (operand_summary['generator'],*operand_summary.get('generator_dependencies',[]),operand_summary['inventory'],operand_summary['details']):
            if file_sha256(project_path(commitment['path']))!=commitment['sha256']:raise ValueError('Explicit operand generator/input/artifact differs')
        pairs=set();supplemental_pairs=set();address_kinds=Counter()
        with gzip.open(project_path(operand_summary['inventory']['path']),'rt') as stream:
            for line in stream:
                row=json.loads(line);site=int(row['site'],16);destination=int(row['target'],16);native_owner=owner(site)
                if row['source_native_owner']!=(hex(native_owner) if native_owner is not None else None):raise ValueError('Explicit operand source owner differs')
                raw=bytes.fromhex(row['instruction_bytes']);offset=pe.rva_offset(site-pe.image_base)
                if pe.data[offset:offset+len(raw)]!=raw:raise ValueError('Explicit operand instruction bytes differ')
                pair=(site,destination);pairs.add(pair);address_kinds[row['kind']]+=1
                if not row['program_reference_pair_present']:supplemental_pairs.add(pair)
                if native_owner is None:continue
                if destination in imports:import_owners[destination].add(native_owner);import_sites[destination].add(site)
                if destination in diagnostic_targets:
                    for path in diagnostic_targets[destination]:expanded.setdefault(path,set()).add(native_owner)
        explicit_union={'audit':{'path':args.operand_summary,'sha256':operand_digest},'inventory':operand_summary['inventory'],
            'exact_explicit_pairs':len(pairs),'pairs_absent_from_program_export':len(supplemental_pairs),'operand_kinds':dict(address_kinds),
            'address_expressions_assigned_read_write_or_call_semantics':False}
    resolver_callers={}
    for row in helpers.rows(directory/'references.tsv.gz'):
        if 'CALL' in row['type']:
            destination_owner=owner(helpers.address(row['to']))
            if destination_owner in resolver_owners:resolver_callers.setdefault(helpers.address(row['from']),set()).add(destination_owner)
    def literal(value):
        if not value or value[0]!='value':return None
        try:offset=pe.rva_offset(value[1]-pe.image_base)
        except ValueError:return None
        end=pe.data.find(b'\0',offset,offset+1024)
        if end<0 or end==offset:return None
        raw=pe.data[offset:end]
        if not all(32<=byte<127 for byte in raw):return None
        return {'address':hex(value[1]),'text':raw.decode('ascii'),'byte_count':len(raw),'sha256':hashlib.sha256(raw).hexdigest()}
    # No-auto-analysis Ghidra references omit many LEA/data relations. Join the
    # independent exact-instruction inventory rather than pretending those
    # disabled provider passes ran. Main databases remain read-only.
    independent_reference_counts=Counter();diagnostic_sites={};verified_diagnostic_sites=set()
    database=selected_inventory(target, root=ROOT)
    with open_native_inventory(f'file:{database}?mode=ro',uri=True) as connection:
        metadata=json.loads(connection.execute('select value from metadata where id=1').fetchone()[0])
        if metadata['target_sha256']!=target['sha256']:raise ValueError('Independent reference target differs')
        for destination,names in diagnostic_targets.items():
            for (site,) in connection.execute('select site from refs where target=?',(hex(destination),)):
                source_owner=owner(site)
                if source_owner is not None:diagnostic_sites.setdefault(site,set()).update(names)
        for site,access in connection.execute("select site,access from refs where kind='memory'"):
            if owner(site) is not None:independent_reference_counts[str(access)]+=1
    counts=Counter();unresolved=Counter();trap_mnemonics=Counter();ring=deque();previous_end=None;resolver_sites=[];resolver_caller_inputs=[]
    artifact=artifact_directory/'indirect-ownership.jsonl.gz'
    with InstructionFacts(target['sha256'],pe,capstone,cache_policy='direct') as facts, derived_gzip_text(artifact,publish=args.write) as out:
        for row in helpers.rows(directory/'instructions.tsv.gz'):
            site=int(row['address'],16)
            if site in diagnostic_sites:
                source_owner=owner(site)
                if source_owner is not None:
                    verified_diagnostic_sites.add(site)
                    for path in diagnostic_sites[site]:expanded.setdefault(path,set()).add(source_owner)
            if site!=previous_end or site in targets:ring.clear()
            previous_end=site+int(row['length'])
            if site in resolver_callers:
                context=[facts.instruction(prior) for prior in ring]
                state=local_values(context,read_slot,capstone)
                resolver_caller_inputs.append({'site':hex(site),'callee_native_owners':[hex(value) for value in sorted(resolver_callers[site])],
                    'literal_register_inputs':{register:value for register in ('rcx','rdx','r8','r9') if (value:=literal(state.get(register))) is not None},
                    'wrapper_forwarding_conversion_or_runtime_export_resolution_verified':False})
            if row['flow'].startswith('COMPUTED_'):
                instruction=facts.instruction(row)
                is_call=instruction.group(capstone.CS_GRP_CALL);is_jump=instruction.group(capstone.CS_GRP_JUMP)
                if not(is_call or is_jump):
                    trap_mnemonics[instruction.mnemonic]+=1
                else:
                    kind='call' if is_call else 'jump';counts['actual_indirect_'+kind]+=1
                    operands=instruction.operands;value=None;resolution=None;slot=None
                    if operands and operands[0].type==capstone.x86_const.X86_OP_MEM:
                        slot=memory_address(instruction,operands[0],{},capstone)
                        if slot is not None:value=read_slot(slot)
                        if value:resolution='encoded-fixed-memory-slot'
                        elif slot is None:
                            context=[]
                            context.extend(facts.instruction(prior) for prior in ring)
                            state=local_values(context,read_slot,capstone)
                            slot=memory_address(instruction,operands[0],state,capstone)
                            if slot is not None:value=read_slot(slot)
                            if value:resolution='bounded-straight-line-pointer-slot' 
                        if not value:reason='memory-slot-not-statically-bound' if slot is not None else 'indexed-register-or-segment-address-not-established-in-block'
                    elif operands and operands[0].type==capstone.x86_const.X86_OP_REG:
                        context=[]
                        context.extend(facts.instruction(prior) for prior in ring)
                        state=local_values(context,read_slot,capstone)
                        value=state.get(canonical_register(instruction.reg_name(operands[0].reg)))
                        if value:resolution='bounded-straight-line-encoded-value'
                        else:reason='register-value-not-established-in-observed-block'
                    else:reason='unsupported-computed-operand'
                    if value and value[0]=='value' and not code_address(value[1]):value=None;reason='encoded-value-is-not-executable'
                    record={'site':hex(site),'native_owner':hex(owner(site)) if owner(site) is not None else None,
                        'kind':kind,'ghidra_flow':row['flow'],'instruction_bytes':row['bytes'],
                        'resolution_basis':resolution if value else None,'runtime_dispatch_verified':False}
                    if value:
                        if value[0]=='import':
                            counts['declared_import_'+kind]+=1
                            if owner(site) is not None:import_owners[value[3]].add(owner(site));import_sites[value[3]].add(site)
                            record['initial_target']={'kind':'declared-import-slot','library':value[1],'symbol':value[2],'slot':hex(value[3])}
                            if value[2]=='GetProcAddress':
                                context=[facts.instruction(prior) for prior in ring]
                                state=local_values(context,read_slot,capstone);name=state.get('rdx');text=literal(name)
                                resolver_sites.append({'site':hex(site),'native_owner':record['native_owner'],
                                    'resolver_import':record['initial_target'],'name_input':{'kind':'literal-name',**text} if text else {'kind':'ordinal','value':name[1]} if name and name[0]=='value' and 0<name[1]<=65535 else {'kind':'not-established-in-observed-block'},
                                    'module_handle_and_runtime_binding_verified':False})
                        else:
                            counts['encoded_native_'+kind]+=1
                            record['initial_target']={'kind':'encoded-executable-address','address':hex(value[1]),
                                'actual_owner':hex(owner(value[1])) if owner(value[1]) is not None else None}
                    else:unresolved[kind+':'+reason]+=1;record['unknown_reason']=reason
                    out.write(json.dumps(record,separators=(',',':'))+'\n')
            ring.append(row)
            if row['flow']!='FALL_THROUGH':ring.clear()
    diagnostic_by_owner={}
    for path,owners in expanded.items():
        for native_owner in owners:diagnostic_by_owner.setdefault(native_owner,set()).add(path)
    import_records=[]
    for slot,value in sorted(imports.items()):
        native_owners=import_owners[slot]
        import_records.append({'slot':hex(slot),'library':value[1],'symbol':value[2],
            'observed_native_owners':[hex(value) for value in sorted(native_owners)],
            'observed_instruction_sites':[hex(value) for value in sorted(import_sites[slot])],
            'candidate_diagnostic_paths':sorted({path for native_owner in native_owners for path in diagnostic_by_owner.get(native_owner,set())}),
            'external_implementation_or_runtime_binding_verified':False})
    import_artifact=artifact_directory/'import-ownership.json'
    derived_json(import_artifact,{'target':{key:target[key] for key in ('version','sha256')},'slots':import_records},publish=args.write)
    resolver_artifact=artifact_directory/'conditional-export-resolvers.json'
    derived_json(resolver_artifact,{'target':{key:target[key] for key in ('version','sha256')},'resolver_sites':resolver_sites,'caller_literal_inputs':resolver_caller_inputs,
        'limits':['Literal register inputs into resolver-containing wrappers do not prove forwarding, CString conversion, module identity, successful export lookup or resulting runtime calls.']},publish=args.write)
    report={'schema_version':1,'target':{k:target[k] for k in ('version','path','sha256','size_bytes')},
        'debug_identity':debug_identity(pe),
        'explicit_operand_union':explicit_union,
        'source_boundary_evidence':{'path':source_boundary_path.relative_to(ROOT).as_posix(),'sha256':source_boundary_digest} if source_boundaries is not None else None,
        'resolver_boundary_evidence':{'path':resolver_boundary_path.relative_to(ROOT).as_posix(),'sha256':file_sha256(resolver_boundary_path)} if resolver_boundaries is not None else None,
        'build_revision_literal_leads':revision_literal_leads(pe.data),
        'generator':{'path':'scripts/classify-native-ownership.py','sha256':GENERATOR_SHA256,
            'capstone_version':capstone.__version__},'census_summary':args.census_summary,'census_summary_sha256':file_sha256(project_path(args.census_summary)),
        'generator_dependencies':[{'path':'scripts/derived_gzip.py','sha256':DERIVED_GZIP_SHA256},{'path':'scripts/instruction_facts.py','sha256':FACTS_SHA256}],
        'instruction_facts':facts.receipt(),
        'indirect_counts':dict(sorted(counts.items())),'computed_flow_non_call_or_jump_mnemonics':dict(sorted(trap_mnemonics.items())),
        'unknown_indirect_reasons':dict(sorted(unresolved.items())),
        'declared_import_slots':len(imports),'relocation_backed_code_pointer_slots':len(pointers),
        'independent_diagnostic_sites_on_exact_ghidra_boundaries':len(verified_diagnostic_sites),
        'independent_memory_candidates_in_observed_body_bytes_by_access_bits':dict(sorted(independent_reference_counts.items())),
        'expanded_diagnostic_paths_with_native_owners':len(expanded),'artifact':{'path':artifact.relative_to(ROOT).as_posix(),'sha256':file_sha256(artifact)},
        'import_ownership':{'slot_records':len(import_records),'slots_with_observed_native_owners':sum(bool(row['observed_native_owners']) for row in import_records),
            'slots_with_candidate_diagnostic_paths':sum(bool(row['candidate_diagnostic_paths']) for row in import_records),
            'slots_without_observed_native_owner':sum(not row['observed_native_owners'] for row in import_records),
            'artifact':{'path':import_artifact.relative_to(ROOT).as_posix(),'sha256':file_sha256(import_artifact)}},
        'conditional_export_resolvers':{'sites':len(resolver_sites),'name_input_kinds':dict(sorted(Counter(row['name_input']['kind'] for row in resolver_sites).items())),
            'literal_export_name_candidates':dict(sorted(Counter(row['name_input']['text'] for row in resolver_sites if row['name_input']['kind']=='literal-name').items())),
            'caller_sites':len(resolver_caller_inputs),'caller_sites_with_literal_register_inputs':sum(bool(row['literal_register_inputs']) for row in resolver_caller_inputs),
            'artifact':{'path':resolver_artifact.relative_to(ROOT).as_posix(),'sha256':file_sha256(resolver_artifact)}},
        'source_semantics_complete':False,'global_aliasing_complete':False,'parity_verified':False,'gap_ids':[41],
        'limits':['PE slot bindings and encoded pointer values describe the selected file and loader declarations, not observed runtime dispatch or external DLL implementation.',
            'Register candidates retain the complete observed straight-line block and stop at observed branch entries, gaps and control transfers; unknown incoming computed edges, aliases, writes and alternate paths remain open.',
            'Exact vendored paths/bytes and native diagnostic source-line ranges identify source candidates; the actual compiled source revision, inlining/generics and behavioral equivalence remain unproven.',
            'No source-system, changelog, gameplay or parity status is promoted from graph/path membership. No application compilation or execution.']}
    output=artifact_path(args.output)
    if (explicit_union is not None and file_sha256(project_path(args.operand_summary))!=explicit_union['audit']['sha256']) or (source_boundaries is not None and file_sha256(source_boundary_path)!=source_boundary_digest) or file_sha256(ROOT/'scripts/classify-native-ownership.py')!=GENERATOR_SHA256:raise ValueError('Ownership generator changed during analysis; rerun before publication')
    if file_sha256(ROOT/'scripts/derived_gzip.py')!=DERIVED_GZIP_SHA256:raise ValueError('Derived gzip helper changed during analysis')
    return report,{'expanded':{path:sorted(owners) for path,owners in expanded.items()},'resource_paths':resource_paths}


def native_decoder_identity():
    """Bind the sparse decoder actually in use, independently of old receipts."""
    import capstone
    library=Path(str(getattr(capstone._cs,'_name','')))
    if not library.is_file():raise ValueError('Native ownership decoder library identity is unavailable')
    return {'decoder':'Capstone','architecture':capstone.CS_ARCH_X86,'mode':capstone.CS_MODE_64,'detail':True,
            'python_binding_sha256':file_sha256(Path(capstone.__file__)),
            'native_library_sha256':file_sha256(library),'python_version':capstone.__version__,
            'native_version':list(capstone.cs_version())}


def native_core_inputs(args):
    """Native proof inputs exclude the independently refreshed source mapping."""
    target=latest_target();summary_path=project_path(args.census_summary);summary=load_json(summary_path)
    if summary['target']['sha256']!=target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('A verified selected-target census is required')
    inputs={args.census_summary:file_sha256(summary_path)}
    directory=project_path(summary['artifacts']['directory'])
    for name in ('instructions.tsv.gz','bodies.tsv.gz','references.tsv.gz'):
        path=directory/name;actual=file_sha256(path)
        if actual!=summary['artifacts']['files'][name]['sha256']:raise ValueError('Native ownership artifact differs: '+name)
        inputs[path.relative_to(ROOT).as_posix()]=actual
    for name in ('scripts/classify-native-ownership.py','scripts/summarize-native-image.py','scripts/inventory-current-target.py',
                 'scripts/inventory-executable.py','scripts/coverage_common.py','scripts/shared_native_inventory.py',
                 'scripts/instruction_facts.py','scripts/derived_gzip.py'):
        inputs[name]=file_sha256(ROOT/name)
    for suffix in ('native-resolver-boundaries.json','native-source-boundaries.json'):
        path=ROOT/f"docs/analysis/evidence/{target['version']}"/suffix
        inputs[path.relative_to(ROOT).as_posix()]=file_sha256(path) if path.is_file() else None
    diagnostic=ROOT/f"runtime/coverage/{target['sha256']}/diagnostic-ownership.json"
    inputs[diagnostic.relative_to(ROOT).as_posix()]=file_sha256(diagnostic)
    database=selected_inventory(target,root=ROOT)
    # This is the transport receipt's identity. Opening it verifies the exact
    # current logical snapshot binding; no historical archive needs inflating.
    from shared_analysis import file_digest
    inputs[database.relative_to(ROOT).as_posix()]=file_digest(database)
    from shared_native_inventory import _open_chunks_readonly
    with _open_chunks_readonly(database,root=ROOT) as connection:
        metadata=json.loads(connection.execute('select value from metadata where id=1').fetchone()[0])
        if metadata['target_sha256']!=target['sha256']:raise ValueError('Independent reference target differs')
    if args.operand_summary:
        path=project_path(args.operand_summary);operand=load_json(path);inputs[args.operand_summary]=file_sha256(path)
        source_census = operand['source_census']
        if operand['target'] != summary['target'] or not same_artifact(
                source_census['path'], summary_path, source_census['sha256']):
            raise ValueError('Explicit operand audit selects a different census')
        for commitment in (operand['generator'],*operand.get('generator_dependencies',[]),operand['inventory'],operand['details']):
            actual=file_sha256(project_path(commitment['path']))
            if actual!=commitment['sha256']:raise ValueError('Explicit operand generator/input/artifact differs')
            inputs[commitment['path']]=actual
    return {'format':'native-ownership-core-inputs-v1','target_sha256':target['sha256'],
            'decoder':native_decoder_identity(),'inputs':inputs}


class NativeCoreCache:
    """Immutable native resolution, separate from systems/source-file joins."""
    def __init__(self,write,root=ROOT):
        import sqlite3
        from shared_analysis import SharedAnalysis,require_primary_checkout
        self.root=root;require_primary_checkout(root)
        self.store=SharedAnalysis(root) if write else None
        path=root/'runtime/analysis/knowledge.sqlite'
        if path.is_symlink():raise ValueError('Shared analysis catalog must not be redirected')
        self.connection=None
        if write:
            self.connection=self.store.connect()
            self.connection.execute('CREATE TABLE IF NOT EXISTS native_ownership_core (input_sha256 TEXT PRIMARY KEY,receipt_sha256 TEXT NOT NULL)')
            self.connection.commit()
        elif path.is_file():
            self.connection=sqlite3.connect(path.as_uri()+'?mode=ro',uri=True,timeout=60)

    def key(self,inputs):
        from shared_analysis import canonical
        return hashlib.sha256(canonical(inputs).encode()).hexdigest()

    def load(self,inputs):
        from shared_analysis import file_digest
        if self.connection is None:return None
        if not self.connection.execute("SELECT 1 FROM sqlite_master WHERE name='native_ownership_core'").fetchone():return None
        row=self.connection.execute('SELECT receipt_sha256 FROM native_ownership_core WHERE input_sha256=?',(self.key(inputs),)).fetchone()
        if row is None:return None
        if not re.fullmatch('[0-9a-f]{64}',row[0]):raise ValueError('Native ownership core receipt digest differs')
        path=self.root/'runtime/analysis/objects'/row[0][:2]/row[0]
        if path.is_symlink() or file_digest(path)!=row[0]:raise ValueError('Native ownership core receipt differs')
        payload=json.loads(path.read_bytes())
        if payload.get('inputs')!=inputs:raise ValueError('Native ownership core inputs differ')
        for receipt in payload['artifacts'].values():
            if not re.fullmatch('[0-9a-f]{64}',receipt['sha256']):raise ValueError('Native ownership core artifact digest differs')
            artifact=self.root/receipt['path']
            expected=self.root/'runtime/analysis/objects'/receipt['sha256'][:2]/receipt['sha256']
            if artifact!=expected or artifact.is_symlink() or artifact.stat().st_size!=receipt['bytes'] or file_digest(artifact)!=receipt['sha256']:
                raise ValueError('Native ownership core artifact differs')
        return payload

    def publish(self,inputs,report,context):
        if self.store is None:return None
        native={key:value for key,value in report.items() if key!='source_candidates'}
        artifacts={}
        for name,record in (('indirect',report['artifact']),('imports',report['import_ownership']['artifact']),('resolvers',report['conditional_export_resolvers']['artifact'])):
            path=project_path(record['path'])
            artifacts[name]=self.store.put_file(path,'native-ownership-core-artifact',{'inputs_sha256':self.key(inputs)})
        payload={'inputs':inputs,'report':native,'context':context,'artifacts':artifacts}
        from shared_analysis import canonical
        receipt=self.store.put_bytes((canonical(payload)+'\n').encode(),'native-ownership-core',{'inputs_sha256':self.key(inputs)})
        self.connection.execute('INSERT OR IGNORE INTO native_ownership_core VALUES (?,?)',(self.key(inputs),receipt['sha256']))
        self.connection.commit()
        return payload

    def close(self):
        if self.connection is not None:self.connection.close()


def refresh_source_mapping(args,payload):
    from instruction_facts import derived_bytes
    target=latest_target();summary=load_json(project_path(args.census_summary));directory=project_path(summary['artifacts']['directory'])
    output_directory=project_path(args.artifact_directory) if args.artifact_directory else directory
    if not output_directory.is_relative_to(ROOT/'runtime'):raise ValueError('Ownership artifacts must stay inside runtime/')
    helpers=module('ownership_source_census','scripts/summarize-native-image.py')
    pe=module('ownership_source_pe','scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    owner=helpers.owner_lookup([(int(row['start'],16),int(row['end'],16),int(row['entry'],16)) for row in helpers.rows(directory/'bodies.tsv.gz') if row['external']=='false'])
    diagnostic=load_json(ROOT/f"runtime/coverage/{target['sha256']}/diagnostic-ownership.json")
    context=payload['context'];expanded={path:set(values) for path,values in context['expanded'].items()}
    sources=source_candidates(target,diagnostic,owner,expanded,context['resource_paths'],systems_path=getattr(args,'source_mapping',None))
    source_artifact=output_directory/'diagnostic-source-candidates.json';derived_json(source_artifact,sources,publish=args.write)
    source_summary={key:value for key,value in sources.items() if key!='paths'}
    source_summary['audit']={'path':source_artifact.relative_to(ROOT).as_posix(),'sha256':file_sha256(source_artifact)}
    source_summary['missing_engine_source_candidates']=[row['diagnostic_path'] for row in sources['paths'] if row['classification']=='missing-engine-source-candidate']
    report=json.loads(json.dumps(payload['report']));report['source_candidates']=source_summary
    for name,filename,record in (('indirect','indirect-ownership.jsonl.gz',report['artifact']),
                                 ('imports','import-ownership.json',report['import_ownership']['artifact']),
                                 ('resolvers','conditional-export-resolvers.json',report['conditional_export_resolvers']['artifact'])):
        receipt=payload['artifacts'][name];path=output_directory/filename
        derived_bytes(path,(retained_runtime_path(ROOT/receipt['path'], ROOT)).read_bytes(),publish=args.write)
        record['path']=path.relative_to(ROOT).as_posix()
    return report


def validate_source_mapping(report):
    """Reject a join whose source inputs changed before report publication."""
    audit=report['source_candidates']['audit'];path=project_path(audit['path'])
    if file_sha256(path)!=audit['sha256']:raise ValueError('Source candidate artifact changed during review')
    sources=load_json(path)
    commitments=[sources['source_mapping'],{'path':'docs/analysis/benilla-vendor.json','sha256':sources['vendor_manifest_sha256']},
                 *sources['retained_archive_missing_path_search']]
    commitments.extend(row['source_candidate'] for row in sources['paths'] if row['source_candidate'])
    for record in commitments:
        if file_sha256(project_path(record['path']))!=record['sha256']:raise ValueError('Source candidate input changed during review: '+record['path'])


def run(args):
    import time
    started=time.monotonic();inputs=native_core_inputs(args);cache=NativeCoreCache(args.write)
    try:
        payload=cache.load(inputs)
        hit=payload is not None
        if hit:
            report=refresh_source_mapping(args,payload)
        else:
            report,context=run_full_native(args)
            if native_core_inputs(args)!=inputs:raise ValueError('Native ownership inputs changed during analysis')
            payload=cache.publish(inputs,report,context)
            if payload is None:
                # Read-only reconstruction has already compared these native
                # outputs. No CAS object or catalog entry is created here.
                records={'indirect':report['artifact'],'imports':report['import_ownership']['artifact'],'resolvers':report['conditional_export_resolvers']['artifact']}
                payload={'report':report,'context':context,'artifacts':{name:{**record,'bytes':project_path(record['path']).stat().st_size} for name,record in records.items()}}
            report=refresh_source_mapping(args,payload)
        if native_core_inputs(args)!=inputs:raise ValueError('Native ownership inputs changed during source review')
        validate_source_mapping(report)
        derived_json(artifact_path(args.output),report,publish=args.write)
        print(json_text({key:report[key] for key in ('indirect_counts','computed_flow_non_call_or_jump_mnemonics','unknown_indirect_reasons')}))
        print(json_text({'source_candidate_counts':report['source_candidates']['counts']}))
        metrics=os.environ.get('REA_STAGE_METRICS_PATH')
        if metrics:
            path=artifact_path(metrics)
            if not path.is_relative_to(ROOT/'runtime'):raise ValueError('Ownership metrics must stay inside runtime/')
            previous=load_json(path) if path.exists() and not hit else {}
            previous['native_ownership_core']={'cache_hit':hit,'input_sha256':cache.key(inputs),'wall_seconds':time.monotonic()-started}
            derived_json(path,previous,publish=True)
    finally:cache.close()


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--census-summary',default='docs/analysis/coverage/full-image-selected.json')
    parser.add_argument('--operand-summary',help='Exact same-census full instruction operand audit')
    parser.add_argument('--source-mapping',help='Current-target reviewed systems/source mapping; does not invalidate native resolution')
    parser.add_argument('--artifact-directory',help='New project runtime directory for derivatives; preserves the selected census bundle')
    parser.add_argument('--output',default='docs/analysis/coverage/native-ownership-classification.json')
    parser.add_argument('--write',action='store_true');args=parser.parse_args();run(args)
if __name__=='__main__':main()
