#!/usr/bin/env python3
"""Validate address-taken executable candidates as code-only recovery leads."""
import argparse
from array import array
from bisect import bisect_right
from collections import Counter,deque
import gzip
import hashlib
import importlib.util
import json
from coverage_common import ROOT,latest_target,target_bytes,load_json,json_text,file_sha256,project_path
GENERATOR_SHA256=file_sha256(ROOT/'scripts/recover-native-address-leads.py')
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value

def source_lea(pe,site,raw,target,capstone):
    decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
    try:offset=pe.rva_offset(site-pe.image_base)
    except ValueError:return False
    encoded=bytes.fromhex(raw);ins=list(decoder.disasm(encoded,site,count=1));x=capstone.x86_const
    if pe.data[offset:offset+len(encoded)]!=encoded or len(ins)!=1 or ins[0].size!=len(encoded):return False
    i=ins[0]
    if i.mnemonic!='lea' or len(i.operands)!=2 or i.operands[0].type!=x.X86_OP_REG or i.operands[0].size!=8 or i.operands[1].type!=x.X86_OP_MEM:return False
    memory=i.operands[1].mem
    return i.addr_size==8 and not memory.segment and not memory.index and memory.base==x.X86_REG_RIP and i.address+i.size+memory.disp==target

def executable_bytes(pe,address,size,truncate=False):
    for section in pe.sections:
        start=pe.image_base+section['rva'];end=start+min(section['virtual_size'],section.get('raw_size',section['virtual_size']))
        if not start<=address<end or not int(section['characteristics'],16)&0x20000000:continue
        count=min(size,end-address) if truncate else size
        if address+count>end:return None
        try:offset=pe.rva_offset(address-pe.image_base);last=pe.rva_offset(address-pe.image_base+count-1)
        except ValueError:return None
        raw=pe.data[offset:offset+count]
        return raw if last==offset+count-1 and len(raw)==count else None
    return None

def bounded_flow(pe,entry,known_boundary,capstone,max_instructions=512,max_bytes=4096):
    """Finite exact code graph; open computed exits retain their alias limits."""
    decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
    pending=deque([entry]);seen={};joins=set();open_exits=[];total=0;x=capstone.x86_const
    code=lambda address:any(pe.image_base+s['rva']<=address<pe.image_base+s['rva']+s['virtual_size'] and int(s['characteristics'],16)&0x20000000 for s in pe.sections)
    while pending:
        address=pending.popleft()
        if address in seen:continue
        state=known_boundary(address)
        if state=='interior':return None,'overlaps-established-instruction'
        if state=='exact':joins.add(address);continue
        if not code(address):return None,'successor-not-executable'
        try:offset=pe.rva_offset(address-pe.image_base)
        except ValueError:return None,'not-file-backed'
        window=executable_bytes(pe,address,15,truncate=True)
        if window is None:return None,'instruction-not-executable-file-backed'
        ins=list(decoder.disasm(window,address,count=1))
        if len(ins)!=1:return None,'invalid-x64-instruction'
        i=ins[0]
        if i.group(capstone.CS_GRP_PRIVILEGE) or i.mnemonic in ('ljmp','lcall','iret','iretd','iretq'):return None,'privileged-or-far-transfer'
        if any(known_boundary(address+delta)=='exact' for delta in range(1,i.size)):return None,'instruction-crosses-established-boundary'
        seen[address]={'site':hex(address),'instruction_bytes':i.bytes.hex()};total+=i.size
        if len(seen)>max_instructions or total>max_bytes:return None,'bounded-flow-limit'
        if i.group(capstone.CS_GRP_RET) or i.mnemonic in ('ud2','int3'):continue
        if i.group(capstone.CS_GRP_INT):
            if i.mnemonic=='int' and i.operands and i.operands[0].type==x.X86_OP_IMM and i.operands[0].imm==0x29:continue
            return None,'unsupported-interrupt'
        if i.group(capstone.CS_GRP_JUMP):
            if not i.operands:return None,'missing-jump-operand'
            if i.operands[0].type==x.X86_OP_IMM:pending.append(i.operands[0].imm)
            else:open_exits.append({'site':hex(address),'instruction_bytes':i.bytes.hex()})
            if i.mnemonic=='jmp':continue
        # CALL returns are followed lexically; callees remain a separate queue.
        pending.append(address+i.size)
    return {'instructions':[seen[a] for a in sorted(seen)],'existing_code_joins':[hex(a) for a in sorted(joins)],'open_computed_exits':open_exits,'byte_count':total},None

def code_proof(pe,entry,known_boundary,known_length,capstone):
    """Keep established code seeds when a later fresh import repeats the queue."""
    if known_boundary(entry)=='exact':
        raw=executable_bytes(pe,entry,known_length(entry))
        if not raw:return None,'established-instruction-not-file-backed'
        decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
        decoded=list(decoder.disasm(raw,entry,count=1))
        if len(decoded)!=1 or decoded[0].size!=len(raw):return None,'established-instruction-decode-differs'
        return {'instructions':[{'site':hex(entry),'instruction_bytes':raw.hex()}],
            'existing_code_joins':[hex(entry)],'open_computed_exits':[],
            'byte_count':len(raw),'validation_basis':'independently-verified-existing-instruction'},None
    proof,reason=bounded_flow(pe,entry,known_boundary,capstone)
    if reason=='bounded-flow-limit':proof,reason=bounded_flow(pe,entry,known_boundary,capstone,max_instructions=65536,max_bytes=1048576)
    if proof is not None:proof['validation_basis']='bounded-coherent-new-code'
    return proof,reason

def verify_inventory(payload,target,pe,capstone):
    if payload['target']['sha256']!=target['sha256']:raise ValueError('Address-code target differs')
    for row in payload['code_only_seeds']:
        target_address=int(row['site'],16)
        if not source_lea(pe,int(row['source_site'],16),row['source_instruction_bytes'],target_address,capstone):raise ValueError('Address source LEA differs')
        offset=pe.rva_offset(target_address-pe.image_base);raw=bytes.fromhex(row['instruction_bytes'])
        if executable_bytes(pe,target_address,len(raw))!=raw:raise ValueError('Address target mapping or bytes differ')
        for proof in row['code_validation']['instructions']:
            site=int(proof['site'],16);offset=pe.rva_offset(site-pe.image_base);raw=bytes.fromhex(proof['instruction_bytes'])
            if executable_bytes(pe,site,len(raw))!=raw:raise ValueError('Address code validation mapping or bytes differ')
    return {int(row['site'],16) for row in payload['code_only_seeds']}

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--operand-summary',required=True);parser.add_argument('--inventory-output',help='Project-local full inventory path; operand snapshot is written beside it');parser.add_argument('--summary-output',default='docs/analysis/coverage/native-address-code-leads.json',help='Project-local compact summary path');parser.add_argument('--write',action='store_true');args=parser.parse_args()
    import capstone
    target=latest_target();operand_path=project_path(args.operand_summary);operand_digest=file_sha256(operand_path);operand=load_json(operand_path)
    if operand['target']['sha256']!=target['sha256']:raise ValueError('Operand target differs')
    census_path=project_path(operand['source_census']['path']);summary=load_json(census_path)
    if file_sha256(census_path)!=operand['source_census']['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('Verified address source census differs')
    directory=project_path(summary['artifacts']['directory'])
    dependencies=[{'path':name,'sha256':file_sha256(ROOT/name)} for name in ('scripts/summarize-native-image.py','scripts/inventory-current-target.py','scripts/inventory-executable.py')]
    helpers=module('address_census','scripts/summarize-native-image.py');pe_module=module('address_pe','scripts/inventory-current-target.py');pe=pe_module.pe_parser(target_bytes(target))
    for key in ('inventory','details'):
        if file_sha256(project_path(operand[key]['path']))!=operand[key]['sha256']:raise ValueError('Operand inventory differs')
    details=load_json(project_path(operand['details']['path']));targets={int(row['destination'],16) for row in details['unowned_executable_address_candidates']};sources={}
    with gzip.open(project_path(operand['inventory']['path']),'rt') as f:
        for line in f:
            row=json.loads(line);destination=int(row['target'],16)
            if destination not in targets or row['kind']!='address-expression':continue
            if source_lea(pe,int(row['site'],16),row['instruction_bytes'],destination,capstone):sources.setdefault(destination,row)
    starts=array('Q');lengths=array('B');source_sites={int(row['site'],16):row for row in sources.values()};verified=set()
    path=directory/'instructions.tsv.gz'
    if file_sha256(path)!=summary['artifacts']['files']['instructions.tsv.gz']['sha256']:raise ValueError('Source instruction artifact differs')
    for row in helpers.rows(path):
        site=int(row['address'],16);starts.append(site);lengths.append(int(row['length']))
        if site in source_sites and row['bytes']==source_sites[site]['instruction_bytes']:verified.add(site)
    if verified!=set(source_sites):raise ValueError('Source LEA is not an exact observed instruction')
    def boundary(address):
        index=bisect_right(starts,address)-1
        return 'exact' if index>=0 and starts[index]==address else 'interior' if index>=0 and address<starts[index]+lengths[index] else None
    def known_length(address):
        index=bisect_right(starts,address)-1
        if index<0 or starts[index]!=address:raise ValueError('Missing exact established instruction')
        return lengths[index]
    seeds=[];exceptions=[];counts=Counter();byte_owners={};conflicts=set()
    for destination,source in sorted(sources.items()):
        proof,reason=code_proof(pe,destination,boundary,known_length,capstone)
        if proof is None:exceptions.append({'site':hex(destination),'reason':reason,'source_site':source['site']});counts[reason]+=1;continue
        for instruction in proof['instructions']:
            site=int(instruction['site'],16)
            for byte in range(site,site+len(bytes.fromhex(instruction['instruction_bytes']))):
                old=byte_owners.get(byte)
                if old and old[0]!=site:conflicts.update((old[1],destination))
                else:byte_owners[byte]=(site,destination)
        first=next((row for row in proof['instructions'] if int(row['site'],16)==destination),None)
        if first is None:raise ValueError('Code proof omitted its selected entry')
        seeds.append({'site':hex(destination),'instruction_bytes':first['instruction_bytes'],'source_site':source['site'],'source_instruction_bytes':source['instruction_bytes'],
            'source_native_owner':source['source_native_owner'],'code_validation':proof,'function_entry_or_incoming_flow_established':False})
    admitted=[]
    for row in seeds:
        if int(row['site'],16) in conflicts:exceptions.append({'site':row['site'],'reason':'conflicting-address-code-candidates','source_site':row['source_site']});counts['conflicting-address-code-candidates']+=1
        else:admitted.append(row)
    for destination in sorted(targets-set(sources)):exceptions.append({'site':hex(destination),'reason':'no-exact-rip-lea-source'});counts['no-exact-rip-lea-source']+=1
    output=project_path(args.inventory_output) if args.inventory_output else directory/'address-code-leads.json'
    operand_snapshot=output.parent/'address-source-operands-summary.json';operand_raw=operand_path.read_bytes()
    if hashlib.sha256(operand_raw).hexdigest()!=operand_digest:raise ValueError('Operand summary changed before snapshot')
    payload={'target':summary['target'],'generator':{'path':'scripts/recover-native-address-leads.py','sha256':GENERATOR_SHA256,'capstone_version':capstone.__version__},
        'source_census':operand['source_census'],'operand_summary':{'path':operand_snapshot.relative_to(ROOT).as_posix(),'sha256':operand_digest},'generator_dependencies':dependencies,'function_entry_or_incoming_flow_edges_inferred':False,'code_only_seeds':admitted,'exceptions':exceptions,
        'counts':{'addressed_executable_targets':len(targets),'admitted_code_only_starts':len(admitted),
            'retained_existing_instruction_starts':sum(row['code_validation']['validation_basis']=='independently-verified-existing-instruction' for row in admitted),'exceptions':dict(sorted(counts.items()))},
        'limits':['Exact independently verified RIP-LEA sources and coherent target decoding establish code candidates only; a source without a native body owner remains eligible. No function entry, incoming computed edge, callback type, source semantics or runtime use is invented.',
            'Previously verified target starts remain code-only seeds for fresh imports; prior decoding does not remove their seed provenance.',
            'All bounded successors must decode consistently with prior established instructions. Calls are followed on their return path; computed exits preserve unresolved alias/type state.']}
    verify_inventory(payload,target,pe,capstone);compact={key:value for key,value in payload.items() if key not in ('code_only_seeds','exceptions')}
    if any(file_sha256(ROOT/row['path'])!=row['sha256'] for row in dependencies) or file_sha256(ROOT/'scripts/recover-native-address-leads.py')!=GENERATOR_SHA256 or file_sha256(operand_path)!=operand_digest:raise ValueError('Address generator/input changed during analysis')
    if args.write:operand_snapshot.write_bytes(operand_raw);output.write_text(json_text(payload));compact['inventory']={'path':output.relative_to(ROOT).as_posix(),'sha256':file_sha256(output)};project_path(args.summary_output).write_text(json_text(compact))
    print(json_text(compact))
if __name__=='__main__':main()
