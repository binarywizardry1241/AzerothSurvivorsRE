#!/usr/bin/env python3
"""Enumerate explicit static operands throughout a verified native instruction set.

This is an independent operand inventory, not Ghidra Data Reference analysis,
register propagation, runtime aliases, or function/source identity inference.
"""
import argparse
from bisect import bisect_left, bisect_right
from collections import Counter
import gzip
import hashlib
import importlib.util
import json
from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path
from instruction_facts import NativeOperandStream, derived_json, artifact_path
from derived_gzip import derived_gzip_text
GENERATOR_SHA256=file_sha256(ROOT/'scripts/audit-native-operands.py')

def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value

def explicit_operands(instruction,capstone):
    """Only addresses encoded independently of register/segment input values."""
    x=capstone.x86_const
    direct=any(instruction.group(group) for group in (capstone.CS_GRP_CALL,capstone.CS_GRP_JUMP))
    for index,operand in enumerate(instruction.operands):
        if operand.type==x.X86_OP_MEM:
            memory=operand.mem
            if memory.segment or memory.index:continue
            if memory.base in (x.X86_REG_RIP,x.X86_REG_EIP):value=instruction.address+instruction.size+memory.disp
            elif not memory.base:value=memory.disp
            else:continue
            value&=(1<<(instruction.addr_size*8))-1
            yield {'operand_index':index,'kind':'address-expression' if instruction.mnemonic=='lea' else 'fixed-memory',
                'target':value,'width':operand.size,'access':operand.access}
        elif operand.type==x.X86_OP_IMM and not direct:
            # An address-shaped number remains a candidate, even for MOVABS.
            yield {'operand_index':index,'kind':'mapped-immediate-candidate','target':operand.imm&((1<<64)-1),
                'width':operand.size,'access':operand.access}

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--census-summary',required=True);parser.add_argument('--inventory-output',help='Project-local gzip operand inventory path; details are written beside it');parser.add_argument('--summary-output',help='Project-local compact summary path; defaults to the selected version evidence');parser.add_argument('--write',action='store_true');args=parser.parse_args()
    import capstone
    target=latest_target();summary_path=project_path(args.census_summary);summary_digest=file_sha256(summary_path);summary=load_json(summary_path)
    if summary['target']['sha256']!=target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('Verified selected-target census required')
    directory=project_path(summary['artifacts']['directory'])
    dependencies=[{'path':name,'sha256':file_sha256(ROOT/name)} for name in ('scripts/summarize-native-image.py','scripts/inventory-current-target.py','scripts/inventory-executable.py','scripts/recover-native-import-thunks.py','scripts/coverage_common.py','scripts/instruction_facts.py','scripts/derived_gzip.py')]
    helpers=module('operand_census','scripts/summarize-native-image.py');pe_helpers=module('operand_pe','scripts/inventory-current-target.py');thunks=module('operand_thunks','scripts/recover-native-import-thunks.py')
    pe=pe_helpers.pe_parser(target_bytes(target))
    for name in ('instructions.tsv.gz','bodies.tsv.gz','references.tsv.gz'):
        if file_sha256(directory/name)!=summary['artifacts']['files'][name]['sha256']:raise ValueError('Operand source artifact differs: '+name)
    owner=helpers.owner_lookup([(int(r['start'],16),int(r['end'],16),int(r['entry'],16)) for r in helpers.rows(directory/'bodies.tsv.gz') if r['external']=='false'])
    sections=sorted((pe.image_base+s['rva'],pe.image_base+s['rva']+s['virtual_size'],s) for s in pe.sections);starts=[r[0] for r in sections]
    def section(address):
        if pe.image_base<=address<pe.image_base+pe.u32(pe.optional+60):return {'name':'PE-headers','characteristics':'0x0'}
        index=bisect_right(starts,address)-1
        return sections[index][2] if index>=0 and address<sections[index][1] else None
    def code(address):
        value=section(address);return bool(value and int(value['characteristics'],16)&0x20000000)
    imports={int(r['iat_start_address'],16)+8*i:(r['library'],name) for r in pe.imports() for i,name in enumerate(r['functions'])}
    relocated={pe.image_base+site:value for site,kind,value in pe_helpers.relocations(pe)[0] if kind==10}
    diagnostic_path=ROOT/f"runtime/coverage/{target['sha256']}/diagnostic-ownership.json";diagnostic_digest=file_sha256(diagnostic_path)
    diagnostics=load_json(diagnostic_path);diagnostic_targets={}
    if diagnostics['target']['sha256']!=target['sha256']:raise ValueError('Diagnostic operand target differs')
    for row in diagnostics['diagnostics']:
        for occurrence in row['diagnostic_occurrences']:diagnostic_targets.setdefault(int(occurrence['virtual_address'],16),set()).add(row['path'])
        for location in row['location_records']:
            for field in (0,8,16,20):diagnostic_targets.setdefault(int(location['location_address'],16)+field,set()).add(row['path'])
    literals={key:set(value) for key,value in diagnostic_targets.items()}
    for slot,value in relocated.items():
        if value in literals:diagnostic_targets.setdefault(slot,set()).update(literals[value])
    program_pairs=set()
    for row in helpers.rows(directory/'references.tsv.gz'):
        source=helpers.address(row['from']);destination=helpers.address(row['to'])
        if source is not None and destination is not None:program_pairs.add((source<<64)|destination)
    counts=Counter();operand_domains=Counter();ownership=Counter();unowned_code={};thunk_candidates={};import_sites={slot:set() for slot in imports};diagnostic_sites={};observed=0
    output=artifact_path(args.inventory_output) if args.inventory_output else directory/'explicit-operands.jsonl.gz'
    boundary_sites=bytearray((pe.u32(pe.optional+56)+7)//8);observed_ranges=[]
    with NativeOperandStream(target['sha256'],pe,capstone) as facts, derived_gzip_text(output,publish=args.write) as out:
        for row,instruction in facts.instructions(helpers.rows(directory/'instructions.tsv.gz')):
            site=instruction.address;source_owner=owner(site);observed+=1
            rva=site-pe.image_base;boundary_sites[rva>>3]|=1<<(rva&7)
            if observed_ranges and observed_ranges[-1][1]==site:observed_ranges[-1]=(observed_ranges[-1][0],site+instruction.size)
            else:observed_ranges.append((site,site+instruction.size))
            x=capstone.x86_const
            for operand in instruction.operands:
                if operand.type==x.X86_OP_MEM:
                    memory=operand.mem
                    domain='segment-dependent-memory' if memory.segment else 'index-dependent-memory' if memory.index else 'base-register-dependent-memory' if memory.base not in (0,x.X86_REG_RIP,x.X86_REG_EIP) else 'explicit-static-memory-or-address'
                    operand_domains[domain]+=1
                elif operand.type==x.X86_OP_IMM:operand_domains['immediate-operands']+=1
                elif operand.type==x.X86_OP_REG:operand_domains['register-operands']+=1
            for operand in explicit_operands(instruction,capstone):
                destination=operand['target'];destination_section=section(destination);kind=operand['kind']
                if destination_section is None and kind=='mapped-immediate-candidate':
                    operand_domains['unmapped-immediate-candidates-excluded']+=1;continue
                if destination_section is None:operand_domains['static-memory-or-address-outside-PE']+=1
                present=((site<<64)|destination) in program_pairs
                counts[kind]+=1;counts[kind+(':program-pair-present' if present else ':program-pair-absent')]+=1
                ownership['source-owned' if source_owner is not None else 'source-unowned']+=1
                record={**operand,'target':hex(destination),'site':hex(site),'instruction_bytes':row['bytes'],
                    'source_native_owner':hex(source_owner) if source_owner is not None else None,'program_reference_pair_present':present,'target_region':destination_section['name'] if destination_section else 'outside-PE-image'}
                if destination in imports:
                    record['declared_import_slot']={'library':imports[destination][0],'symbol':imports[destination][1]};import_sites[destination].add((site,source_owner))
                if destination in relocated:
                    record['initial_dir64_carrier_value']=hex(relocated[destination])
                if destination in diagnostic_targets:
                    record['diagnostic_path_candidates']=sorted(diagnostic_targets[destination])
                    for name in diagnostic_targets[destination]:diagnostic_sites.setdefault(name,set()).add((site,source_owner))
                if code(destination) and owner(destination) is None:
                    unowned_code.setdefault(destination,Counter())[kind]+=1
                    if kind=='address-expression':
                        value=thunks.candidate(pe,imports,site,row['bytes'],destination,capstone)
                        if value is not None:thunk_candidates[site]=value
                out.write(json.dumps(record,separators=(',',':'))+'\n')
            if observed%1000000==0:print(f'Audited {observed:,} verified instruction operands',flush=True)
    if observed!=summary['counts']['instructions']:raise ValueError('Operand census instruction count differs')
    del program_pairs
    destinations=sorted(unowned_code);exact=set();interior=set()
    observed_starts=[start for start,_ in observed_ranges]
    for destination in destinations:
        rva=destination-pe.image_base;index=bisect_right(observed_starts,destination)-1
        if 0<=rva<len(boundary_sites)*8 and boundary_sites[rva>>3]&(1<<(rva&7)):exact.add(destination)
        elif index>=0 and destination<observed_ranges[index][1]:interior.add(destination)
    del boundary_sites,observed_ranges
    exceptions=[]
    for destination,kinds in sorted(unowned_code.items()):
        try:
            offset=pe.rva_offset(destination-pe.image_base);raw=pe.data[offset:offset+16]
        except ValueError:offset=None;raw=b''
        exceptions.append({'destination':hex(destination),'operand_kinds':dict(kinds),'decode_status':'exact-observed-instruction' if destination in exact else 'observed-instruction-interior' if destination in interior else 'not-observed',
            'file_offset':hex(offset) if offset is not None else None,'file_backed':offset is not None,'current_up_to_16_bytes':raw.hex()})
    detail={'target':summary['target'],'generator':{'path':'scripts/audit-native-operands.py','sha256':GENERATOR_SHA256},
        'source_census':{'path':args.census_summary,'sha256':summary_digest},
        'diagnostic_input':{'path':diagnostic_path.relative_to(ROOT).as_posix(),'sha256':diagnostic_digest},'verified_instruction_count':observed,
        'generator_dependencies':dependencies,'instruction_facts':facts.receipt(),'all_explicit_operand_domains':dict(sorted(operand_domains.items())),
        'retained_explicit_operand_counts':dict(sorted(counts.items())),'source_ownership':dict(ownership),
        'unowned_executable_address_candidates':exceptions,'exact_import_thunk_candidates':list(thunk_candidates.values()),
        'import_slot_ownership':[{'slot':hex(slot),'library':imports[slot][0],'symbol':imports[slot][1],'instruction_sites':len(sites),'native_owners':len({value for _,value in sites}-{None})} for slot,sites in sorted(import_sites.items())],
        'diagnostic_path_ownership':[{'path':name,'instruction_sites':len(sites),'native_owners':len({value for _,value in sites}-{None}),'sites_without_native_owner':sum(value is None for _,value in sites)} for name,sites in sorted(diagnostic_sites.items())],
        'inventory':{'path':output.relative_to(ROOT).as_posix(),'sha256':file_sha256(output)},
        'complete_runtime_aliases_or_source_semantics':False,
        'limits':['All verified instruction boundaries were inspected; only operand addresses independent of incoming registers, indices and segments are enumerated. PE headers and out-of-image static addresses are retained; only immediate numeric candidates require an image mapping. Register-based addresses require additional producer/alias evidence.',
            'Mapped immediates are numeric address candidates. An address expression alone does not establish a function entry, source owner, referenced-data type or executable flow.',
            'Program reference presence is a source/destination pair comparison, not a comparison of reference access semantics. Initial DIR64 values are image facts, not values observed after writes.']}
    detail_path=output.parent/'operand-boundaries.json'
    compact={key:value for key,value in detail.items() if key not in ('unowned_executable_address_candidates','exact_import_thunk_candidates','import_slot_ownership','diagnostic_path_ownership')}
    compact['unowned_executable_candidates']={'destinations':len(destinations),'exact_observed_instructions':len(exact),'observed_instruction_interiors':len(interior),'not_observed':len(destinations)-len(exact)-len(interior),'exact_import_thunk_sources':len(thunk_candidates)}
    compact['import_slots_with_owned_explicit_operands']=sum(any(value is not None for _,value in sites) for sites in import_sites.values())
    compact['diagnostic_paths_with_explicit_operands']=len(diagnostic_sites)
    if any(file_sha256(ROOT/row['path'])!=row['sha256'] for row in dependencies) or file_sha256(ROOT/'scripts/audit-native-operands.py')!=GENERATOR_SHA256 or file_sha256(summary_path)!=summary_digest or file_sha256(diagnostic_path)!=diagnostic_digest:raise ValueError('Operand generator or selected census changed during audit')
    derived_json(detail_path,detail,publish=args.write)
    compact['details']={'path':detail_path.relative_to(ROOT).as_posix(),'sha256':file_sha256(detail_path)}
    summary_output=artifact_path(args.summary_output) if args.summary_output else ROOT/f"docs/analysis/evidence/{target['version']}/native-operand-boundaries.json"
    derived_json(summary_output,compact,publish=args.write)
    print(json_text(compact))
if __name__=='__main__':main()
