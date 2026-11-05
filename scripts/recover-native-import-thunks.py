#!/usr/bin/env python3
"""Find exact address-taken PE import thunks omitted by unwind/pointer seeds."""
import argparse
import importlib.util
import json
import sqlite3
from coverage_common import ROOT,latest_target,target_bytes,load_json,json_text,file_sha256,project_path
from instruction_facts import artifact_path, derived_bytes
from shared_analysis import SharedAnalysis
from shared_native_inventory import open_readonly_uri as open_native_inventory, selected_inventory

GENERATOR_SHA256=file_sha256(ROOT/'scripts/recover-native-import-thunks.py')

def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);result=importlib.util.module_from_spec(spec);spec.loader.exec_module(result);return result

def candidate(pe,imports,site,source_bytes,target,capstone):
    """An exact RIP LEA and exact executable JMP[IAT], with no guessed type."""
    if not any(pe.image_base+s['rva']<=target<pe.image_base+s['rva']+s['virtual_size'] and int(s['characteristics'],16)&0x20000000 for s in pe.sections):return None
    try:target_offset=pe.rva_offset(target-pe.image_base)
    except ValueError:return None
    target_raw=pe.data[target_offset:target_offset+7]
    if not (target_raw.startswith(b'\xff\x25') or target_raw.startswith(b'\x48\xff\x25')):return None
    decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True;x=capstone.x86_const
    raw=bytes.fromhex(source_bytes)
    try:offset=pe.rva_offset(site-pe.image_base)
    except ValueError:return None
    if pe.data[offset:offset+len(raw)]!=raw:return None
    ins=list(decoder.disasm(raw,site,count=1))
    if len(ins)!=1 or ins[0].size!=len(raw):return None
    lea=ins[0]
    if lea.mnemonic!='lea' or len(lea.operands)!=2 or lea.operands[0].type!=x.X86_OP_REG or lea.operands[0].size!=8 or lea.operands[1].type!=x.X86_OP_MEM:return None
    memory=lea.operands[1].mem
    if memory.base!=x.X86_REG_RIP or memory.index or memory.segment or lea.address+lea.size+memory.disp!=target:return None
    thunks=list(decoder.disasm(target_raw,target,count=1))
    if len(thunks)!=1:return None
    thunk=thunks[0]
    if thunk.mnemonic!='jmp' or len(thunk.operands)!=1 or thunk.operands[0].type!=x.X86_OP_MEM or thunk.operands[0].size!=8:return None
    memory=thunk.operands[0].mem
    if memory.base!=x.X86_REG_RIP or memory.index or memory.segment:return None
    slot=thunk.address+thunk.size+memory.disp
    if slot not in imports:return None
    return {'entry':hex(target),'instruction_bytes':thunk.bytes.hex(),'file_offset':hex(target_offset),
        'iat_slot':hex(slot),'library':imports[slot][0],'symbol':imports[slot][1],
        'source_site':hex(site),'source_instruction_bytes':source_bytes,
        'source_semantics_or_runtime_dispatch_verified':False}

def verify_inventory(payload,target,pe,capstone):
    if payload['target']['sha256']!=target['sha256']:raise ValueError('Import-thunk target differs')
    imports={int(r['iat_start_address'],16)+8*i:(r['library'],name) for r in pe.imports() for i,name in enumerate(r['functions'])}
    entries=set()
    for row in payload['candidates']:
        verified=candidate(pe,imports,int(row['source_site'],16),row['source_instruction_bytes'],int(row['entry'],16),capstone)
        if verified is None or any(row.get(key)!=value for key,value in verified.items()):raise ValueError('Import-thunk source/target/import binding differs')
        entries.add(int(row['entry'],16))
    return entries

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--census-summary',required=True);parser.add_argument('--inventory-output',help='Project-local full inventory path');parser.add_argument('--summary-output',default='docs/analysis/coverage/native-import-thunks.json',help='Project-local compact summary path');parser.add_argument('--write',action='store_true');args=parser.parse_args()
    import capstone
    target=latest_target();summary=load_json(project_path(args.census_summary))
    if summary['target']['sha256']!=target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('Verified current census required')
    directory=project_path(summary['artifacts']['directory']);helpers=module('thunk_bodies','scripts/summarize-native-image.py');pe=module('thunk_pe','scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    for name in ('bodies.tsv.gz','instructions.tsv.gz'):
        if file_sha256(directory/name)!=summary['artifacts']['files'][name]['sha256']:raise ValueError('Thunk source census differs')
    owner=helpers.owner_lookup([(int(r['start'],16),int(r['end'],16),int(r['entry'],16)) for r in helpers.rows(directory/'bodies.tsv.gz') if r['external']=='false'])
    imports={int(r['iat_start_address'],16)+8*i:(r['library'],name) for r in pe.imports() for i,name in enumerate(r['functions'])}
    database=selected_inventory(target, root=ROOT);pending={}
    with open_native_inventory(f'file:{database}?mode=ro',uri=True) as connection:
        metadata=json.loads(connection.execute('select value from metadata where id=1').fetchone()[0])
        if metadata['target_sha256']!=target['sha256']:raise ValueError('Independent LEA discovery target differs')
        for site,raw,destination in connection.execute("select site,bytes,target from refs where kind='address'"):
            if owner(site) is None:continue
            value=candidate(pe,imports,site,raw,int(destination,16),capstone)
            if value is not None:pending[site]=value
    verified=[]
    for row in helpers.rows(directory/'instructions.tsv.gz'):
        site=int(row['address'],16)
        if site not in pending:continue
        value=pending[site]
        if row['bytes']!=value['source_instruction_bytes']:raise ValueError('LEA source Ghidra boundary differs')
        value.update(source_native_owner=hex(owner(site)),target_native_owner=hex(owner(int(value['entry'],16))) if owner(int(value['entry'],16)) is not None else None)
        verified.append(value)
    entries={int(row['entry'],16) for row in verified};unowned={entry for entry in entries if owner(entry) is None}
    payload={'target':summary['target'],'generator':{'path':'scripts/recover-native-import-thunks.py','sha256':GENERATOR_SHA256},
        'source_census':{'path':args.census_summary,'sha256':file_sha256(project_path(args.census_summary))},
        'independent_discovery':{'path':database.relative_to(ROOT).as_posix(),'sha256':file_sha256(database)},
        'candidates':verified,'counts':{'exact_source_instructions':len(verified),'distinct_import_thunk_entries':len(entries),'entries_without_actual_native_owner':len(unowned)},
        'function_source_semantics_or_runtime_binding_established':False}
    verify_inventory(payload,target,pe,capstone)
    output=artifact_path(args.inventory_output) if args.inventory_output else directory/'lea-import-thunks.json'
    compact={key:value for key,value in payload.items() if key!='candidates'}
    if file_sha256(ROOT/'scripts/recover-native-import-thunks.py')!=GENERATOR_SHA256:raise ValueError('Thunk generator changed during audit')
    if args.write:
        serialized = json_text(payload).encode()
        if output.is_relative_to(ROOT / 'runtime'):
            SharedAnalysis(ROOT).publish_output(output, serialized)
        else:
            derived_bytes(output, serialized, publish=True)
        compact['inventory'] = {'path': output.relative_to(ROOT).as_posix(), 'sha256': file_sha256(output)}
        derived_bytes(args.summary_output, json_text(compact).encode(), publish=True)
    print(json_text(compact))
if __name__=='__main__':main()
