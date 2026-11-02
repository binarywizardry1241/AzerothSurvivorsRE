#!/usr/bin/env python3
"""Audit immutable register CALL/JMP values without initial-slot assumptions."""
import argparse
from collections import Counter,deque
import importlib.util
from coverage_common import ROOT,latest_target,target_bytes,load_json,json_text,file_sha256,project_path
from instruction_facts import InstructionFacts, derived_json
GENERATOR_SHA256=file_sha256(ROOT/'scripts/audit-native-constant-dispatch.py')
def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value

def immutable_target(instructions,current,capstone,classifier):
    if not any(current.group(group) for group in (capstone.CS_GRP_CALL,capstone.CS_GRP_JUMP)):return None
    if len(current.operands)!=1 or current.operands[0].type!=capstone.x86_const.X86_OP_REG:return None
    # No memory value is ever supplied to propagation: imports, mutable slots
    # and relocation-backed vtable contents cannot masquerade as constants.
    state=classifier.local_values(instructions,lambda slot:None,capstone)
    value=state.get(classifier.canonical_register(current.reg_name(current.operands[0].reg)))
    return value[1] if value and value[0]=='value' else None

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--census-summary',required=True);parser.add_argument('--artifact-directory',help='Fresh runtime directory for derived dispatch evidence');parser.add_argument('--write',action='store_true');args=parser.parse_args()
    import capstone
    target=latest_target();summary_path=project_path(args.census_summary);summary_digest=file_sha256(summary_path);summary=load_json(summary_path)
    if summary['target']['sha256']!=target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('Verified current census required')
    directory=project_path(summary['artifacts']['directory']);dependencies=[{'path':name,'sha256':file_sha256(ROOT/name)} for name in ('scripts/classify-native-ownership.py','scripts/summarize-native-image.py','scripts/inventory-current-target.py','scripts/inventory-executable.py','scripts/instruction_facts.py')]
    helpers=module('constant_census','scripts/summarize-native-image.py');classifier=module('constant_values','scripts/classify-native-ownership.py');pe=module('constant_pe','scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    for name in ('bodies.tsv.gz','references.tsv.gz','instructions.tsv.gz'):
        if file_sha256(directory/name)!=summary['artifacts']['files'][name]['sha256']:raise ValueError('Constant dispatch artifact differs')
    owner=helpers.owner_lookup([(int(r['start'],16),int(r['end'],16),int(r['entry'],16)) for r in helpers.rows(directory/'bodies.tsv.gz') if r['external']=='false'])
    incoming=set()
    for row in helpers.rows(directory/'references.tsv.gz'):
        if 'CALL' in row['type'] or 'JUMP' in row['type']:
            destination=helpers.address(row['to'])
            if destination is not None:incoming.add(destination)
    facts=InstructionFacts(target['sha256'],pe,capstone,cache_policy='direct')
    ring=deque();previous=None;counts=Counter();records=[]
    for row in helpers.rows(directory/'instructions.tsv.gz'):
        address=int(row['address'],16)
        if address!=previous or address in incoming:ring.clear()
        previous=address+int(row['length'])
        if row['flow'].startswith('COMPUTED_'):
            current=facts.instruction(row)
            context=[facts.instruction(prior) for prior in ring]
            destination=immutable_target(context,current,capstone,classifier)
            if destination is not None and any(pe.image_base+s['rva']<=destination<pe.image_base+s['rva']+s['virtual_size'] and int(s['characteristics'],16)&0x20000000 for s in pe.sections):
                kind='call' if current.group(capstone.CS_GRP_CALL) else 'jump';target_owner=owner(destination);counts[kind]+=1
                if target_owner is None:counts[kind+'-without-owner']+=1
                records.append({'site':hex(address),'instruction_bytes':row['bytes'],'kind':kind,'target':hex(destination),
                    'source_native_owner':hex(owner(address)) if owner(address) is not None else None,'target_native_owner':hex(target_owner) if target_owner is not None else None,
                    'observed_fallthrough_context':list(ring),'initial_slot_value_used':False,'runtime_call_or_incoming_aliases_verified':False})
        ring.append(row)
        if row['flow']!='FALL_THROUGH':ring.clear()
    facts.close()
    payload={'target':summary['target'],'generator':{'path':'scripts/audit-native-constant-dispatch.py','sha256':GENERATOR_SHA256,'capstone_version':capstone.__version__},
        'generator_dependencies':dependencies,'instruction_facts':facts.receipt(),'source_census':{'path':args.census_summary,'sha256':summary_digest},'counts':dict(counts),'records':records,
        'limits':['Constants follow the observed fallthrough block and reset at known incoming targets, gaps and transfers. Unobserved computed incoming aliases remain unknown.',
            'No initial PE import, relocation slot or memory-loaded value participates. A constant computed CALL is a concrete entry lead; JMP and address-only values do not establish source function semantics.']}
    artifact_directory=project_path(args.artifact_directory) if args.artifact_directory else directory
    if not artifact_directory.is_relative_to(ROOT/'runtime'):raise ValueError('Dispatch artifacts must stay inside runtime/')
    path=artifact_directory/'constant-register-dispatch.json'
    if file_sha256(ROOT/'scripts/audit-native-constant-dispatch.py')!=GENERATOR_SHA256 or file_sha256(summary_path)!=summary_digest or any(file_sha256(ROOT/r['path'])!=r['sha256'] for r in dependencies):raise ValueError('Constant audit inputs changed')
    compact={k:v for k,v in payload.items() if k!='records'}
    derived_json(path,payload,publish=args.write)
    compact['inventory']={'path':path.relative_to(ROOT).as_posix(),'sha256':file_sha256(path)}
    print(json_text(compact))
if __name__=='__main__':main()
