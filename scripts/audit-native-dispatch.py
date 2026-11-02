#!/usr/bin/env python3
"""Audit observed indirect producers and unowned encoded-flow boundaries."""
import argparse
from bisect import bisect_left
from collections import Counter,deque
import importlib.util
from coverage_common import ROOT,latest_target,target_bytes,load_json,json_text,file_sha256,project_path

from instruction_facts import InstructionFacts, derived_json, HELPER_SHA256 as FACTS_SHA256
GENERATOR_SHA256=file_sha256(ROOT/'scripts/audit-native-dispatch.py')
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value

def computed_jump(current,instructions,capstone,classifier):
    """Classify one observed jump using its unchanged fallthrough context."""
    if not current.group(capstone.CS_GRP_JUMP):return None,None,None
    x=capstone.x86_const;operand=current.operands[0]
    record={'site':hex(current.address),'instruction_bytes':current.bytes.hex()}
    if operand.type==x.X86_OP_MEM:
        memory=operand.mem;kind='memory-with-index' if memory.index else 'memory-with-base-field' if memory.base and memory.base!=x.X86_REG_RIP else 'fixed-or-rip-memory'
        record.update(kind=kind,operand=current.op_str)
        return record,kind,None
    if operand.type==x.X86_OP_REG:
        canon=lambda ins,register:classifier.canonical_register(ins.reg_name(register))
        destination=canon(current,operand.reg);producer=None
        for earlier in reversed(instructions[:-1]):
            if destination in [canon(earlier,r) for r in earlier.regs_access()[1]]:producer=earlier;break
        if producer is None:kind='no-producer-in-contiguous-fallthrough-region'
        elif producer.mnemonic=='add':kind='add-produced-register'
        elif producer.mnemonic.startswith('mov') and len(producer.operands)==2 and producer.operands[1].type==x.X86_OP_MEM:
            memory=producer.operands[1].mem;kind='memory-load-with-index-scale-'+str(memory.scale) if memory.index else 'memory-load-base-field' if memory.base and memory.base!=x.X86_REG_RIP else 'memory-load-fixed-or-rip'
        else:kind='producer-'+producer.mnemonic
        record.update(kind=kind,producer={'site':hex(producer.address),'instruction_bytes':producer.bytes.hex(),'mnemonic':producer.mnemonic,'operand':producer.op_str} if producer else None)
        return record,'register',kind
    record['kind']='other-operand'
    return record,'other-operand',None

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--census-summary',required=True);parser.add_argument('--artifact-directory',help='Fresh runtime directory for derived dispatch evidence');parser.add_argument('--write',action='store_true');args=parser.parse_args()
    import capstone
    target=latest_target();summary=load_json(project_path(args.census_summary))
    if summary['target']['sha256']!=target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('Verified current census required')
    directory=project_path(summary['artifacts']['directory']);helpers=module('dispatch_census','scripts/summarize-native-image.py');classifier=module('dispatch_classifier','scripts/classify-native-ownership.py');pe=module('dispatch_pe','scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    for name in ('bodies.tsv.gz','references.tsv.gz','instructions.tsv.gz'):
        if file_sha256(directory/name)!=summary['artifacts']['files'][name]['sha256']:raise ValueError('Dispatch input differs')
    owner=helpers.owner_lookup([(int(r['start'],16),int(r['end'],16),int(r['entry'],16)) for r in helpers.rows(directory/'bodies.tsv.gz') if r['external']=='false'])
    executable=[s for s in pe.sections if int(s['characteristics'],16)&0x20000000]
    code=lambda address:any(pe.image_base+s['rva']<=address<pe.image_base+s['rva']+s['virtual_size'] for s in executable)
    direct={};reference_kinds=Counter();source_kinds=Counter()
    for row in helpers.rows(directory/'references.tsv.gz'):
        if row['type'] not in ('UNCONDITIONAL_CALL','UNCONDITIONAL_JUMP','CONDITIONAL_JUMP'):continue
        destination=helpers.address(row['to'])
        if destination is None or not code(destination) or owner(destination) is not None:continue
        source=helpers.address(row['from']);native_owner=owner(source)
        direct.setdefault(destination,[]).append({'site':hex(source) if source is not None else row['from'],'kind':row['type'],'source_owner':hex(native_owner) if native_owner is not None else None})
        reference_kinds[row['type']]+=1;source_kinds[str(native_owner is not None) if source is not None else 'non-default-address-space']+=1
    ordered=sorted(direct);exact=set();conflicts=set();ring=deque();previous=None;operands=Counter();producers=Counter();records=[]
    facts=InstructionFacts(target['sha256'],pe,capstone,cache_policy='direct')
    for row in helpers.rows(directory/'instructions.tsv.gz'):
        address=int(row['address'],16);end=address+int(row['length']);index=bisect_left(ordered,address)
        while index<len(ordered) and ordered[index]<end:
            (exact if ordered[index]==address else conflicts).add(ordered[index]);index+=1
        if address!=previous:ring.clear()
        previous=end;ring.append(row)
        if row['flow']=='COMPUTED_JUMP':
            current=facts.instruction(row)
            instructions=[facts.instruction(prior) for prior in list(ring)[:-1]]+[current] if current.operands and current.operands[0].type==capstone.x86_const.X86_OP_REG else [current]
            record,operand_kind,producer_kind=computed_jump(current,instructions,capstone,classifier)
            if record is not None:
                operands[operand_kind]+=1
                if producer_kind is not None:producers[producer_kind]+=1
                records.append(record)
        if row['flow'] not in ('FALL_THROUGH','CONDITIONAL_JUMP'):ring.clear()
    facts.close()
    direct_records=[{'destination':hex(address),'decode_status':'exact-instruction' if address in exact else 'instruction-interior' if address in conflicts else 'undecoded','references':rows} for address,rows in sorted(direct.items())]
    payload={'target':summary['target'],'generator':{'path':'scripts/audit-native-dispatch.py','sha256':GENERATOR_SHA256},
        'instruction_facts':facts.receipt(),'generator_dependencies':[{'path':'scripts/instruction_facts.py','sha256':FACTS_SHA256}],
        'source_census':{'path':args.census_summary,'sha256':file_sha256(project_path(args.census_summary))},
        'computed_jump_operands':dict(operands),'register_producer_shapes':dict(producers),
        'unowned_direct_flow_counts':{'destinations':len(direct),'exact_instructions':len(exact),'interior_conflicts':len(conflicts),'undecoded':len(direct)-len(exact)-len(conflicts)},
        'unowned_direct_reference_kinds':dict(reference_kinds),'incoming_source_body_ownership':dict(source_kinds),
        'producer_records':records,'unowned_direct_destinations':direct_records,
        'limits':['Last-producer shapes in observed contiguous fallthrough regions are candidates, not complete aliases, type invariants, table bounds or runtime dispatch.','Encoded jumps into unowned code do not establish source function ownership; all incoming source owners and actual instruction boundaries are retained.']}
    if file_sha256(ROOT/'scripts/audit-native-dispatch.py')!=GENERATOR_SHA256:raise ValueError('Dispatch auditor changed during analysis')
    artifact_directory=project_path(args.artifact_directory) if args.artifact_directory else directory
    if not artifact_directory.is_relative_to(ROOT/'runtime'):raise ValueError('Dispatch artifacts must stay inside runtime/')
    output=artifact_directory/'dispatch-boundaries.json'
    derived_json(output,payload,publish=args.write)
    print(json_text({k:v for k,v in payload.items() if k not in ('producer_records','unowned_direct_destinations')}))
if __name__=='__main__':main()
