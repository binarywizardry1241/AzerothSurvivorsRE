#!/usr/bin/env python3
"""Classify all current executable DATA destinations without saved Ghidra bodies.

Checks PE unwind metadata, exact import slots and bounded callback control flow.
No compiler, source/game process, exception dispatch or fresh Ghidra runs.
--stage writes proposed proof only beneath ignored project runtime storage.
"""
import argparse
from collections import Counter, defaultdict
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
if ROOT.name == 'runtime':
    ROOT = ROOT.parent
sys.path[:0] = [str(ROOT/'scripts'),str(ROOT/'runtime/camera-recovery-0.105.0/python-libs')]
from coverage_common import latest_target, target_bytes

SHA='0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
WORK=ROOT/'runtime/q41-unwind-0.115.0'
KEEP=ROOT/'docs/analysis/evidence/0.115.0/unowned-unwind-destinations.json'
GENERATOR='scripts/check-unowned-unwind-destinations.py'
GENERATOR_SHA256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
CALLBACKS=[0x145b4a160,0x145b4a2e0,0x145b4ac70,0x145b58270,0x145b612c0,0x145b624d0,
           0x145b62530,0x145b65a90,0x145b65bd0,0x145b680a0,0x145b6c280,0x145b6c2f0]
THUNKS={0x145d145f5:(0x145eb8240,'VCRUNTIME140.dll','__CxxFrameHandler3'),
        0x145d14619:(0x145eb8270,'VCRUNTIME140.dll','__C_specific_handler')}


def sha(raw):return hashlib.sha256(raw).hexdigest()


def artifact(path):return dict(path=path.relative_to(ROOT).as_posix(),sha256=sha(path.read_bytes()))


def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path)
    value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value


def merged_ranges(instructions,raw):
    ranges=[]
    for address,instruction in sorted(instructions.items()):
        end=address+instruction.size
        assert not ranges or address>=ranges[-1][1], 'Conflicting selected instruction boundaries'
        if ranges and ranges[-1][1]==address:ranges[-1][1]=end
        else:ranges.append([address,end])
    return [dict(start=hex(a),end_exclusive=hex(b),byte_count=b-a,sha256=sha(raw(a,b-a)))for a,b in ranges]


def callback_flow(entry,decoder,raw):
    from capstone import CS_GRP_JUMP,CS_GRP_CALL,CS_GRP_RET
    from capstone.x86_const import X86_OP_IMM,X86_OP_MEM,X86_REG_RIP
    todo,seen,calls,returns=[entry],{},[],[]
    while todo:
        pc=todo.pop()
        if pc in seen:continue
        assert 0x145b48000<=pc<0x145b6d000,('Callback leaves selected support region',hex(pc))
        instruction=next(decoder.disasm(raw(pc,15),pc,count=1))
        seen[pc]=instruction
        if instruction.group(CS_GRP_RET):returns.append(pc);continue
        if instruction.group(CS_GRP_JUMP):
            assert instruction.operands[0].type==X86_OP_IMM
            todo.append(instruction.operands[0].imm)
            if instruction.mnemonic=='jmp':continue
        if instruction.group(CS_GRP_CALL):
            operand=instruction.operands[0]
            assert operand.type==X86_OP_MEM and operand.mem.base==X86_REG_RIP and operand.mem.index==0
            slot=pc+instruction.size+operand.mem.disp
            assert slot==0x145eb80d8,('Unexpected callback consumer',hex(pc),hex(slot))
            calls.append(dict(site=hex(pc),iat_slot=hex(slot)))
        todo.append(pc+instruction.size)
    assert len(calls)==1 and len(returns)==1
    prologue=list(decoder.disasm(raw(entry,12),entry,count=8))
    assert [(i.mnemonic,i.op_str)for i in prologue]==[('push',r)for r in ['rsi','rdi','rbx','rbp','r12','r13','r14','r15']]
    digest=sha(b''.join(struct.pack('<Q',a)+bytes(i.bytes)for a,i in sorted(seen.items())))
    result=dict(entry=hex(entry),role='native_UNW_FLAG_EHANDLER_callback',
                reachable_instructions=len(seen),reachable_bytes=sum(i.size for i in seen.values()),
                flow_commitment=digest,call_interfaces=calls,return_sites=[hex(a)for a in returns],
                code_ranges=merged_ranges(seen,raw),
                scope='Supporting Windows exception/context interface; complete enclosing product/library semantics are not assigned.')
    return result,seen


def derive():
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from capstone.x86_const import X86_OP_MEM,X86_REG_RIP
    target=latest_target(verify=True);assert target['sha256']==SHA
    image=target_bytes(target)
    pe=module('unowned_unwind_pe','scripts/inventory-executable.py').PE(image)
    helpers=module('unowned_unwind_census','scripts/summarize-native-image.py')
    unwind=module('unowned_unwind_reader','scripts/recover-native-unwind-handlers.py')
    census_path=ROOT/'docs/analysis/coverage/full-image-census.json'
    census=json.loads(census_path.read_text())
    assert census['target']['sha256']==SHA and census['independent_instructions']['exact_source_bytes_verified']
    directory=ROOT/census['artifacts']['directory']
    inputs={}
    for name in ['bodies.tsv.gz','references.tsv.gz']:
        path=directory/name;assert sha(path.read_bytes())==census['artifacts']['files'][name]['sha256']
        inputs[name]=artifact(path)
    ranges=[(int(r['start'],16),int(r['end'],16),int(r['entry'],16))for r in helpers.rows(directory/'bodies.tsv.gz')if r['external']=='false']
    owner=helpers.owner_lookup(ranges)
    def raw(address,count):
        offset=pe.rva_offset(address-pe.image_base)
        value=image[offset:offset+count];assert len(value)==count
        return value
    executable=[(pe.image_base+s['rva'],pe.image_base+s['rva']+s['virtual_size'])for s in pe.sections if int(s['characteristics'],16)&0x20000000]
    selected=[];reference_count=0
    for ordinal,row in enumerate(helpers.rows(directory/'references.tsv.gz')):
        reference_count+=1;destination=helpers.address(row['to'])
        if destination is None or not any(a<=destination<b for a,b in executable)or owner(destination)is not None:continue
        source=helpers.address(row['from']);assert source is not None and row['type']=='DATA'
        selected.append((source,destination,ordinal,row))
    assert reference_count==3766641 and len(selected)==73393
    groups=defaultdict(list)
    for source,destination,ordinal,row in selected:groups[destination].append((source,ordinal,row))
    assert set(groups)==set(CALLBACKS)|set(THUNKS)
    assert all(owner(entry)is None for entry in groups)
    handlers,chains,metadata_counts=unwind.collect(pe)
    lookup={int(r['handler_rva_field_va'],16):r for r in handlers}
    assert len(lookup)==len(handlers)==73410
    all_pairs={(field,int(r['entry'],16))for field,r in lookup.items()}
    selected_pairs={(a,b)for a,b,_,_ in selected}
    assert len(selected_pairs)==73393 and selected_pairs<=all_pairs
    unselected=all_pairs-selected_pairs
    assert len(unselected)==17 and {b for a,b in unselected}=={0x145d13b10} and owner(0x145d13b10)is not None
    projected=[]
    for field,entry,_,row in selected:
        record=lookup[field]
        assert int(record['entry'],16)==entry
        assert int.from_bytes(raw(field,4),'little')==entry-pe.image_base
        header=int(record['metadata']['va'],16)
        assert sha(raw(header,record['metadata']['byte_count']))==record['metadata']['sha256']
        projected.append([hex(field),hex(entry),'UNWIND_INFO.ExceptionHandler_RVA',record['flags'],hex(header)])
    projected.sort()
    field_digest=sha((''.join(json.dumps(row,separators=(',',':'))+'\n'for row in projected)).encode())
    imports={int(row['iat_start_address'],16)+8*i:(row['library'],name)for row in pe.imports()for i,name in enumerate(row['functions'])}
    assert imports[0x145eb80d8]==('KERNEL32.dll','RtlVirtualUnwind')
    decoder=Cs(CS_ARCH_X86,CS_MODE_64);decoder.detail=True
    thunks=[]
    for entry,(slot,dll,name)in sorted(THUNKS.items()):
        instruction=next(decoder.disasm(raw(entry,7),entry,count=1))
        assert instruction.mnemonic=='jmp' and instruction.operands[0].type==X86_OP_MEM
        memory=instruction.operands[0].mem
        assert memory.base==X86_REG_RIP and memory.index==0
        assert entry+instruction.size+memory.disp==slot and imports[slot]==(dll,name)
        thunks.append(dict(entry=hex(entry),role='UNWIND_INFO handler-RVA to PE import JMP thunk',
                           source_reference_count=len(groups[entry]),instruction_bytes=instruction.bytes.hex(),
                           instruction_sha256=sha(bytes(instruction.bytes)),iat_slot=hex(slot),library=dll,symbol=name,
                           unwind_flag_counts={str(k):v for k,v in sorted(Counter(lookup[f]['flags'] for f, _, _ in groups[entry]).items())}))
    functions=defaultdict(list)
    for a,b,rva in pe.functions():functions[pe.image_base+rva].append((pe.image_base+a,pe.image_base+b))
    callback_records=[];union={}
    for entry in CALLBACKS:
        result,instructions=callback_flow(entry,decoder,raw)
        union.update(instructions)
        metadata=[]
        for field,_,_ in sorted(groups[entry]):
            record=lookup[field];header=int(record['metadata']['va'],16)
            assert record['flags']==1 and raw(header,4)==b'\x09\0\0\0' and field==header+4
            protected=functions[header];assert len(protected)==1
            metadata.append(dict(handler_rva_field=hex(field),metadata=record['metadata'],
                                 field_bytes=raw(field,4).hex(),flags=record['flags'],
                                 protected_runtime_function=[hex(v)for v in protected[0]],
                                 protected_entry_body_owner=hex(owner(protected[0][0]))if owner(protected[0][0])is not None else None))
        result.update(source_reference_count=len(groups[entry]),handler_metadata=metadata)
        callback_records.append(result)
    counts=dict(selected_reference_records=len(selected),distinct_destinations=len(groups),
                handler_rva_fields=len(selected_pairs),import_thunk_fields=sum(r['source_reference_count']for r in thunks),
                native_callback_fields=sum(r['source_reference_count']for r in callback_records),
                native_callbacks=len(callback_records),import_thunks=len(thunks),
                callback_reachable_instructions_summed=sum(r['reachable_instructions']for r in callback_records),
                unique_callback_instructions=len(union),unique_callback_bytes=sum(i.size for i in union.values()),
                all_PE_handler_fields=len(handlers),already_owned_handler_fields_not_in_selector=len(unselected))
    assert counts['native_callback_fields']==35 and counts['import_thunk_fields']==73358
    assert sha(Path(__file__).read_bytes())==GENERATOR_SHA256, 'Executed unwind checker changed during analysis'
    return dict(schema_version=1,target={k:target[k]for k in ['version','path','sha256','size_bytes']},
                generator=dict(path=GENERATOR,sha256=GENERATOR_SHA256),
                gap_ids=[41],lead_ids=['Q41-M01','Q41-A01','Q41-A02'],
                selected_field_roles_classified=True,global_native_semantics_complete=False,
                dynamic_dispatch_verified=False,source_implementation_added=False,parity_verified=False,
                selector='Every saved Ghidra reference whose destination is executable and has no actual saved native body.',
                inputs=inputs,reader_dependencies=[artifact(ROOT/p)for p in ['scripts/recover-native-unwind-handlers.py','scripts/inventory-executable.py','scripts/summarize-native-image.py']],
                encoding='UNWIND_INFO aligned exception-handler field: little-endian32-bit image-relative RVA; no inferred function pointer/AS gameplay dispatch.',
                field_projection=['source','destination','field_role','unwind_flags','UNWIND_INFO_address'],
                field_classification_sha256=field_digest,counts=counts,
                unwind_metadata_counts=metadata_counts,chain_records_followed=len(chains),
                import_thunks=thunks,native_callbacks=callback_records,
                canonical_callback_ranges=merged_ranges(union,raw),
                callback_OS_interface=dict(iat_slot='0x145eb80d8',library='KERNEL32.dll',symbol='RtlVirtualUnwind'),
                format_reference='https://learn.microsoft.com/en-us/cpp/build/exception-handling-x64?view=msvc-170',
                scope_conclusion='All 14 destinations are supporting Windows exception-dispatch interfaces. No AS mechanic, missing live source operation or need to reconstruct their enclosing library is established.',
                limits=['Saved Ghidra body observations are unchanged: these 14 destinations still have no body in that census. Field/CFG classification is not fresh Ghidra ownership.',
                        'All 73,393 selected fields are checked; the remaining 17 PE handler fields lead to an already-owned entry outside this selector.',
                        'Native callback traversal follows explicit local branches and verifies every call as RtlVirtualUnwind through its exact IAT slot. It does not execute callbacks, OS exception machinery, protected functions or language-specific handler data.',
                        'Supporting context restoration is where this investigation stops; generic engine/library/unwind reconstruction and excluded co-op/server logic are not implemented.',
                        'No compiler, compiling tests, game/application launch, native instruction execution, platform exception dispatch or original/rebuilt parity.'])


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
    result=derive()
    if args.stage:
        WORK.mkdir(exist_ok=True,parents=True)
        (WORK/'unowned-unwind-destinations.json').write_text(json.dumps(result,indent=2)+'\n')
    else:assert json.loads(KEEP.read_text())==result
    print(json.dumps(result['counts'],sort_keys=True))
    print('All 14 unowned executable destinations are exact PE unwind callback fields; no runtime execution.')
if __name__=='__main__':main()
