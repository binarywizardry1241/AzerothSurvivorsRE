#!/usr/bin/env python3
"""Recover guarded AMD64 signed-relative jump tables from verified native code.

No guessed table lengths: accept an explicit unsigned CMP/JA(JAE) bound on the
unchanged selector and the exact MOVSXD/ADD/JMP idiom. Other enum/vtable and
runtime invariants remain unknown. Table targets are code seeds, not functions.
"""
from runtime_layout import retained_runtime_path
import argparse
from array import array
from bisect import bisect_right
from collections import Counter,defaultdict,deque
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
from coverage_common import ROOT,latest_target,target_bytes,load_json,json_text,file_sha256,project_path
from instruction_facts import artifact_path, derived_bytes
from shared_analysis import SharedAnalysis
GENERATOR_SHA256=file_sha256(ROOT/'scripts/recover-native-jump-tables.py')
ALIAS_HELPER_SHA256=file_sha256(ROOT/'scripts/native_scalar_aliases.py')

def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path);value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value

ALIASES=module('native_table_scalar_aliases','scripts/native_scalar_aliases.py')

def scalar_domain(instructions,selector,capstone,classifier):
    """Exact contiguous unsigned domains; wrapped/disjoint domains stay unknown."""
    x=capstone.x86_const;state={};canon=lambda i,r:classifier.canonical_register(i.reg_name(r))
    def project(domain,bits):
        if domain is None:return None
        low,high,*_=domain;modulus=1<<bits
        if high-low>=modulus-1:return 0,modulus-1
        if low//modulus==high//modulus:return low%modulus,high%modulus
        return None
    for instruction in instructions:
        if instruction.group(capstone.CS_GRP_JUMP) and any(o.type==x.X86_OP_IMM and o.imm<=instruction.address for o in instruction.operands):
            state.clear();continue
        if any(instruction.group(g) for g in (capstone.CS_GRP_CALL,capstone.CS_GRP_RET,capstone.CS_GRP_INT,capstone.CS_GRP_IRET)) or instruction.mnemonic in ('jmp','ud2'):
            state.clear();continue
        operands=instruction.operands;result=None;destination=None;kind=None
        if operands and operands[0].type==x.X86_OP_REG:
            left=operands[0];destination=canon(instruction,left.reg);previous=state.get(destination);bits=left.size*8
            if len(operands)>=2:
                right=operands[1]
                if instruction.mnemonic in ('mov','movabs') and left.size in (4,8):
                    # Large MOVABS values may carry image-base relocations.
                    # An ensuing mask/shift can still bound an unknown input.
                    if right.type==x.X86_OP_IMM and not (instruction.mnemonic=='movabs' and right.imm>1048576):result=(right.imm&((1<<bits)-1),)*2;kind='literal-selector'
                    elif right.type==x.X86_OP_REG:result=project(state.get(canon(instruction,right.reg)),right.size*8);kind='propagated-scalar-domain'
                elif instruction.mnemonic=='movzx' and left.size in (4,8) and right.size in (1,2):
                    source=state.get(canon(instruction,right.reg)) if right.type==x.X86_OP_REG else None
                    if source and instruction.reg_name(right.reg) in ('ah','bh','ch','dh'):source=(source[0]>>8,source[1]>>8)
                    result=project(source,right.size*8) if source else (0,(1<<(right.size*8))-1);kind='zero-extension'
                elif instruction.mnemonic=='lea' and left.size in (4,8) and right.type==x.X86_OP_MEM and right.mem.base!=x.X86_REG_RIP:
                    constants={register:('value',value[0]) for register,value in state.items() if value[0]==value[1]}
                    value=classifier.memory_address(instruction,right,constants,capstone)
                    if value is not None:result=(value&((1<<bits)-1),)*2;kind='literal-selector'
                elif instruction.mnemonic=='and' and left.size in (4,8) and right.type==x.X86_OP_IMM and 0<=right.imm<=1048576 and right.imm&(right.imm+1)==0:
                    result=project(previous,(right.imm+1).bit_length()-1) if previous else (0,right.imm);kind='and-mask'
                elif instruction.mnemonic=='shr' and left.size in (4,8) and right.type==x.X86_OP_IMM:
                    before=project(previous,bits) if previous else (0,(1<<bits)-1)
                    shift=right.imm&(bits-1)
                    if before:result=(before[0]>>shift,before[1]>>shift);kind='logical-right-shift'
                elif instruction.mnemonic in ('xor','sub') and left.size in (4,8) and right.type==x.X86_OP_REG and left.reg==right.reg:result=(0,0);kind='literal-selector'
                elif instruction.mnemonic in ('add','sub') and left.size in (4,8) and right.type==x.X86_OP_IMM and previous:
                    amount=right.imm*(1 if instruction.mnemonic=='add' else -1);result=project((previous[0]+amount,previous[1]+amount),bits);kind='propagated-scalar-domain'
            elif instruction.mnemonic.startswith('set') and left.size==1 and instruction.reg_name(left.reg) not in ('ah','bh','ch','dh') and previous and previous[0]>>8==previous[1]>>8:
                result=(previous[0]&~255,(previous[1]&~255)|1);kind='setcc-boolean'
        try:written=instruction.regs_access()[1]
        except capstone.CsError:state.clear();continue
        for register in written:state.pop(canon(instruction,register),None)
        if destination is not None and result is not None:state[destination]=(*result,instruction,kind)
    return state.get(selector)

def recover(instructions,pe,capstone,classifier):
    x86=capstone.x86_const
    ins=[i for i in instructions if i.mnemonic!='nop']
    if len(ins)<4:return None,'short-context'
    jump,addition,load=ins[-1],ins[-2],ins[-3]
    if jump.mnemonic!='jmp' or len(jump.operands)!=1 or jump.operands[0].type!=x86.X86_OP_REG or jump.operands[0].size!=8:return None,'not-register-jump'
    canon=lambda i,r:classifier.canonical_register(i.reg_name(r))
    destination=canon(jump,jump.operands[0].reg)
    if addition.mnemonic!='add' or len(addition.operands)!=2 or any(o.type!=x86.X86_OP_REG or o.size!=8 for o in addition.operands):return None,'not-relative-add'
    if canon(addition,addition.operands[0].reg)!=destination:return None,'different-add-destination'
    base_register=canon(addition,addition.operands[1].reg)
    if base_register==destination:return None,'overwritten-relative-base'
    if load.mnemonic!='movsxd' or len(load.operands)!=2 or load.operands[0].type!=x86.X86_OP_REG or load.operands[0].size!=8 or load.operands[1].type!=x86.X86_OP_MEM:return None,'not-signed-table-load'
    if canon(load,load.operands[0].reg)!=destination or load.operands[1].size!=4:return None,'different-load-destination'
    memory=load.operands[1].mem
    if load.addr_size!=8 or memory.segment or not memory.base or not memory.index or memory.scale!=4 or canon(load,memory.base)!=base_register:return None,'unsupported-table-address'
    selector=canon(load,memory.index)
    # A conditional branch with no register writes preserves constants on its
    # fallthrough path. Calls, unconditional transfers and LOOP-style writes
    # still invalidate the bounded propagation; no other incoming path is proved.
    context=[]
    for instruction in ins[:-3]:
        try:writes=instruction.regs_access()[1]
        except capstone.CsError:writes=None
        backward=any(o.type==x86.X86_OP_IMM and o.imm<=instruction.address for o in instruction.operands)
        if instruction.group(capstone.CS_GRP_JUMP) and instruction.mnemonic!='jmp' and writes==[] and not backward:continue
        context.append(instruction)
    state=classifier.local_values(context,lambda slot:None,capstone)
    base=state.get(base_register)
    if not base or base[0]!='value':return None,'table-base-not-static'
    # The guard must fall through directly to the dispatch without another
    # transfer or selector mutation. Moves to other registers remain harmless.
    guard_index=None;count=None;guard=None;guard_kind=None;guard_bound=None
    for index in range(len(ins)-5,-1,-1):
        compare,branch=ins[index:index+2]
        if compare.mnemonic!='cmp' or len(compare.operands)!=2:continue
        left,right=compare.operands
        if left.type!=x86.X86_OP_REG or right.type!=x86.X86_OP_IMM or canon(compare,left.reg)!=selector or branch.mnemonic not in ('ja','jae'):continue
        bound=right.imm
        if not 0<=bound<=1048576:continue
        count=bound+1 if branch.mnemonic=='ja' else bound
        if not count:continue
        if len(branch.operands)!=1 or branch.operands[0].type!=x86.X86_OP_IMM or compare.address<=branch.operands[0].imm<=jump.address:continue
        if left.size not in (1,2,4,8) or compare.reg_name(left.reg) in ('ah','bh','ch','dh'):continue
        if left.size in (1,2):
            prefix_domain=scalar_domain(ins[:index],selector,capstone,classifier)
            if prefix_domain is None or not 0<=prefix_domain[0]<=prefix_domain[1]<(1<<(left.size*8)):continue
        if left.size==4:
            upper_zero=False
            for earlier in reversed(ins[:index]):
                if any(earlier.group(group) for group in (capstone.CS_GRP_CALL,capstone.CS_GRP_JUMP,capstone.CS_GRP_RET,capstone.CS_GRP_INT,capstone.CS_GRP_IRET)):break
                try:written=earlier.regs_access()[1]
                except capstone.CsError:break
                aliases=[earlier.reg_name(r) for r in written if canon(earlier,r)==selector]
                if any((name.startswith('e') and len(name)==3) or (name.startswith('r') and name.endswith('d')) for name in aliases):upper_zero=True;break
                if selector in aliases:break
            if not upper_zero:continue
        after=ins[index+2:-3]
        if any(any(i.group(group) for group in (capstone.CS_GRP_CALL,capstone.CS_GRP_JUMP,capstone.CS_GRP_RET,capstone.CS_GRP_INT,capstone.CS_GRP_IRET)) for i in after):continue
        changed=False
        for i in after:
            try:writes=i.regs_access()[1]
            except capstone.CsError:changed=True;break
            if any(canon(i,r)==selector for r in writes):changed=True;break
        if changed:continue
        span=ins[index:]
        if any(a.address+a.size!=b.address for a,b in zip(span,span[1:])):continue
        guard_index=index;guard=compare;guard_kind=branch.mnemonic;guard_bound=bound;break
    alias_proof=None
    alias_guards=ALIASES.guard_bounds(ins[:-3],selector,jump.address,capstone,classifier)
    if alias_guards:
        strongest=min(alias_guards,key=lambda value:value['maximum'])
        if guard_index is None or strongest['maximum']<count-1:
            guard_index=strongest['index'];guard=strongest['instruction'];guard_bound=strongest['bound'];guard_kind='alias-'+strongest['branch'].mnemonic;count=strongest['maximum']+1
            alias_proof={'compare':hex(guard.address),'compare_instruction_bytes':guard.bytes.hex(),
                'branch':hex(strongest['branch'].address),'branch_instruction_bytes':strongest['branch'].bytes.hex(),
                'maximum':strongest['maximum'],'relation':'exact same scalar through register copies or lossless zero extension under the unsigned bound',
                'observed_context':[{'site':hex(i.address),'instruction_bytes':i.bytes.hex()} for i in ins[:-3]]}
    lower=0
    if guard_index is not None:
        domain=scalar_domain(ins[:-3],selector,capstone,classifier)
        if domain is not None:
            lower=max(0,domain[0]);upper=min(count-1,domain[1])
            if upper<lower:return None,'guarded-fallthrough-has-empty-proved-domain'
            count=upper-lower+1
    if guard_index is None:
        domain=scalar_domain(ins[:-3],selector,capstone,classifier)
        if domain is not None:
            low,high,producer,kind=domain
            if 0<=low<=high<=1048576:
                index=ins.index(producer);span=ins[index:]
                if all(a.address+a.size==b.address for a,b in zip(span,span[1:])):
                    lower=low;guard_index=index;guard=producer;guard_kind=kind;guard_bound=high;count=high-low+1
    if guard_index is None:return None,'relative-table-without-proven-unsigned-bound'
    table=base[1]+memory.disp+lower*4;size=count*4
    try:
        offset=pe.rva_offset(table-pe.image_base);end=pe.rva_offset(table-pe.image_base+size-1)
    except ValueError:return None,'table-not-file-backed'
    if end!=offset+size-1:return None,'table-not-contiguous'
    section=next((s for s in pe.sections if s['rva']<=table-pe.image_base and table-pe.image_base+size<=s['rva']+s['raw_size']),None)
    if section is None or int(section['characteristics'],16)&0x80000000:return None,'table-not-immutable-file-backed-data'
    raw=pe.data[offset:offset+size]
    executable=[s for s in pe.sections if int(s['characteristics'],16)&0x20000000]
    targets=[base[1]+value[0] for value in struct.iter_unpack('<i',raw)]
    if not all(any(pe.image_base+s['rva']<=target<pe.image_base+s['rva']+s['virtual_size'] for s in executable) for target in targets):return None,'bounded-table-has-non-executable-target'
    return {'site':hex(jump.address),'guard':hex(guard.address),'selector_register':selector,
        'guard_kind':guard_kind,'guard_bound':guard_bound,'selector_alias_proof':alias_proof,
        'selector_minimum':lower,'selector_maximum':lower+count-1,
        'table_address':hex(table),'relative_base':hex(base[1]),'file_offset':hex(offset),'byte_count':size,
        'sha256':hashlib.sha256(raw).hexdigest(),'case_targets':[hex(value) for value in targets],
        'unique_targets':len(set(targets)),'guarded_fallthrough_cases_complete':True,
        'all_possible_incoming_contexts_or_type_invariants_complete':False},None

def validate_scalar_targets(table,starts,lengths,linear_boundary):
    """Validate a complete potential domain; never discard individual indices."""
    known=linear=0;failures=[]
    for target in sorted({int(value,16) for value in table['case_targets']}):
        index=bisect_right(starts,target)-1
        if index>=0 and starts[index]==target:known+=1;continue
        if index>=0 and target<starts[index]+lengths[index]:
            failures.append({'target':hex(target),'reason':'inside-established-instruction','instruction':hex(starts[index])});continue
        if linear_boundary(target):linear+=1
        else:failures.append({'target':hex(target),'reason':'no-independent-instruction-boundary'})
    return {'existing_flow_instruction_targets':known,'declared_linear_instruction_targets':linear,'exceptions':failures}

def validate_linear_inventory(summary,metadata,target,pe,capstone):
    """Admit only the complete current declared-linear inventory and producer."""
    from shared_native_inventory import decoder_contract
    source='scripts/inventory-native-instructions.py'
    expected={'path':source,'sha256':file_sha256(ROOT/source),'decoder':'Capstone',
        'decoder_version':capstone.__version__,'parser_sha256':file_sha256(ROOT/'scripts/inventory-executable.py')}
    if summary.get('target')!=target or metadata.get('target_sha256')!=target['sha256']:
        raise ValueError('Declared-linear inventory belongs to another target')
    if summary.get('declared_extent_pass_complete') is not True or summary.get('counts',{}).get('pending_extents')!=0:
        raise ValueError('Complete declared-linear inventory required')
    if summary.get('generator')!=expected or metadata.get('generator')!=expected:
        raise ValueError('Declared-linear producer/parser/decoder commitment differs')
    records=pe.functions()
    if summary['counts'].get('unwind_extents')!=len(records) or metadata.get('unwind_records_sha256')!=hashlib.sha256(json_text(records).encode()).hexdigest():
        raise ValueError('Declared-linear unwind range commitment differs')
    contract=decoder_contract((ROOT/source).read_text())
    if metadata.get('decoder_contract')!=contract:
        raise ValueError('Declared-linear decoder contract differs')
    return contract

def recover_declared_linear(connection,pe,decoder,capstone,classifier,starts,lengths,linear_boundary):
    """Reuse strict recovery on complete, exact PE-declared linear extents.

    The inventory selects extents containing encoded indirect jumps, not new
    functions or reachable paths. A sparse chunk-backed read avoids requiring
    another expanded SQLite inventory or a whole-image instruction detail cache.
    """
    if decoder.skipdata or not decoder.detail or decoder.arch!=capstone.CS_ARCH_X86 or decoder.mode!=capstone.CS_MODE_64:
        raise ValueError('Declared-linear recovery requires detail without skip-data')
    jumps=defaultdict(dict)
    for ordinal,site,raw in connection.execute("SELECT extent,site,bytes FROM refs WHERE kind='jump_indirect' ORDER BY extent,site"):
        if site in jumps[ordinal]:raise ValueError('Duplicate declared-linear indirect jump')
        jumps[ordinal][site]=raw
    records=pe.functions();tables=[];rejected=[];extents=[];counts=Counter()
    counts['indirect_jump_records']=sum(map(len,jumps.values()))
    counts['candidate_extents']=len(jumps)
    found=set()
    for ordinal,start,end,offset,checksum,decoded_end,instruction_count in connection.execute('SELECT ordinal,start,end,file_offset,sha256,decoded_end,instructions FROM extents ORDER BY ordinal'):
        if ordinal not in jumps:continue
        if ordinal in found:raise ValueError('Duplicate declared-linear extent')
        found.add(ordinal)
        if not 0<=ordinal<len(records) or (start,end)!=tuple(pe.image_base+n for n in records[ordinal][:2]):
            raise ValueError('Declared-linear extent is not an exact PE unwind range')
        actual_offset=pe.rva_offset(start-pe.image_base)
        if end<=start or actual_offset!=offset or pe.rva_offset(end-pe.image_base-1)!=offset+end-start-1:
            raise ValueError('Declared-linear extent file mapping differs')
        raw=bytes(pe.data[offset:offset+end-start])
        if len(raw)!=end-start or hashlib.sha256(raw).hexdigest()!=checksum:
            raise ValueError('Declared-linear extent bytes differ')
        receipt={'ordinal':ordinal,'start':hex(start),'end_exclusive':hex(end),'file_offset':hex(offset),
            'byte_count':len(raw),'sha256':checksum,'complete_linear_decode':decoded_end==end}
        extents.append(receipt)
        if decoded_end!=end:
            counts['incomplete_extents_not_scanned']+=1;continue
        instructions=list(decoder.disasm(raw,start))
        if (sum(i.size for i in instructions)!=len(raw) or len(instructions)!=instruction_count
                or not instructions or instructions[0].address!=start
                or any(a.address+a.size!=b.address for a,b in zip(instructions,instructions[1:]))):
            raise ValueError('Declared-linear current decode differs from inventory')
        decoded={i.address:i for i in instructions}
        expected={i.address:i.bytes.hex() for i in instructions if i.group(capstone.CS_GRP_JUMP)
            and (not i.operands or i.operands[0].type!=capstone.x86_const.X86_OP_IMM)}
        if jumps[ordinal]!=expected:raise ValueError('Declared-linear indirect-jump bytes or boundaries differ')
        receipt.update(instruction_count=len(instructions),instruction_starts_sha256=hashlib.sha256('\n'.join(f'{i.address:x}' for i in instructions).encode()).hexdigest())
        counts['complete_extents_scanned']+=1;ring=[]
        boundary=lambda address:address in decoded or linear_boundary(address)
        for instruction in instructions:
            ring.append(instruction)
            if instruction.address in expected:
                table,reason=recover(ring,pe,capstone,classifier)
                if table is None:counts[reason]+=1
                else:
                    site_check=validate_scalar_targets({'case_targets':[table['site']]},starts,lengths,boundary)
                    case_check=validate_scalar_targets(table,starts,lengths,boundary)
                    first=ring[0].address;last=instruction.address+instruction.size
                    context_offset=offset+first-start
                    table['candidate_origins']=['declared-linear']
                    table['declared_linear_origin']={'extent_ordinal':ordinal,'context_start':hex(first),
                        'context_end_exclusive':hex(last),'context_sha256':hashlib.sha256(bytes(pe.data[context_offset:context_offset+last-first])).hexdigest(),
                        'dispatch_instruction_boundary':site_check,'whole_domain_instruction_boundaries':case_check,
                        'reachability_or_function_ownership_established':False}
                    table['whole_domain_instruction_boundaries']=case_check
                    if site_check['exceptions'] or case_check['exceptions']:
                        table['candidate_rejection_reason']='declared-linear-instruction-boundary-conflict-or-unproved-target'
                        rejected.append(table);counts[table['candidate_rejection_reason']]+=1
                    else:tables.append(table);counts['strict_tables_with_validated_dispatch_and_all_targets']+=1
            if instruction.mnemonic in ('jmp','ud2') or any(instruction.group(g) for g in (capstone.CS_GRP_CALL,capstone.CS_GRP_RET,capstone.CS_GRP_INT,capstone.CS_GRP_IRET)):
                ring=[]
    if found!=set(jumps):raise ValueError('Declared-linear indirect jump names an absent extent')
    return tables,rejected,{'counts':dict(sorted(counts.items())),'extents':extents}

def merge_linear_tables(observed,linear):
    """Keep observed hypotheses, rejecting conflicting linear alternatives."""
    fields=('site','guard','selector_register','guard_kind','guard_bound','selector_minimum','selector_maximum',
        'table_address','relative_base','file_offset','byte_count','sha256','case_targets')
    result={row['site']:dict(row,candidate_origins=['ghidra-observed']) for row in observed};rejected=[]
    if len(result)!=len(observed):raise ValueError('Duplicate observed table site')
    for row in linear:
        old=result.get(row['site'])
        if old is None:result[row['site']]=row
        elif all(old.get(field)==row.get(field) for field in fields):
            old['candidate_origins']=['ghidra-observed','declared-linear'];old['declared_linear_origin']=row['declared_linear_origin']
        else:rejected.append(dict(row,candidate_rejection_reason='declared-linear-conflicts-with-observed-table'))
    return [result[site] for site in sorted(result,key=lambda value:int(value,16))],rejected

def arguments(argv=None):
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--census-summary',default='docs/analysis/coverage/full-image-selected.json')
    parser.add_argument('--inventory-output');parser.add_argument('--summary-output',default='docs/analysis/coverage/native-jump-tables.json')
    parser.add_argument('--include-declared-linear',action='store_true',help='Opt in to strict byte/boundary-verified candidates from the current declared-linear inventory; no reachability or function ownership inferred')
    parser.add_argument('--linear-summary',help='Current declared-linear summary; requires --include-declared-linear (default: docs/analysis/coverage/instruction-summary.json)')
    parser.add_argument('--write',action='store_true');args=parser.parse_args(argv)
    if args.linear_summary and not args.include_declared_linear:parser.error('--linear-summary requires --include-declared-linear')
    return args

def main():
    args=arguments()
    import capstone
    target=latest_target();report=load_json(project_path(args.census_summary))
    if report['target']['sha256']!=target['sha256'] or not report['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('Verified current census required')
    directory=project_path(report['artifacts']['directory']);helpers=module('table_census','scripts/summarize-native-image.py');classifier=module('table_classifier','scripts/classify-native-ownership.py');pe_helper=module('table_pe','scripts/inventory-current-target.py')
    pe_dependencies=[{'path':name,'sha256':file_sha256(ROOT/name)} for name in ('scripts/inventory-current-target.py','scripts/inventory-executable.py')]
    pe=pe_helper.pe_parser(target_bytes(target));decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
    if file_sha256(directory/'instructions.tsv.gz')!=report['artifacts']['files']['instructions.tsv.gz']['sha256']:raise ValueError('Instruction inventory differs')
    ring=deque();tables=[];counts=Counter();previous_end=None;observed_starts=array('Q');observed_lengths=array('B')
    for row in helpers.rows(directory/'instructions.tsv.gz'):
        site=int(row['address'],16);observed_starts.append(site);observed_lengths.append(int(row['length']))
        if site!=previous_end:ring.clear()
        previous_end=site+int(row['length'])
        ring.append(row)
        if row['flow']=='COMPUTED_JUMP':
            current=next(decoder.disasm(bytes.fromhex(row['bytes']),site,count=1))
            if not current.group(capstone.CS_GRP_JUMP):continue
            instructions=[]
            for part in ring:instructions.extend(decoder.disasm(bytes.fromhex(part['bytes']),int(part['address'],16),count=1))
            table,reason=recover(instructions,pe,capstone,classifier)
            if table is not None:tables.append(table);counts['guarded-relative-tables']+=1
            else:counts[reason]+=1
        if row['flow'] not in ('FALL_THROUGH','CONDITIONAL_JUMP'):ring.clear()
    # Wide scalar domains can span adjacent offset arrays. Executable-section
    # membership alone does not make those arithmetic results valid code.
    # Preserve every rejected index/table and retain whole-domain validation.
    functions=sorted((pe.image_base+start,pe.image_base+end) for start,end,_ in pe.functions());function_starts=[row[0] for row in functions];linear_cache={};linear_extents={}
    def linear_boundary(address):
        index=bisect_right(function_starts,address)-1
        if index<0 or address>=functions[index][1]:return False
        first,last=functions[index]
        if index not in linear_cache:
            offset=pe.rva_offset(first-pe.image_base);raw=pe.data[offset:offset+last-first]
            decoded=list(decoder.disasm_lite(raw,first));complete=sum(row[1] for row in decoded)==len(raw)
            linear_cache[index]={row[0] for row in decoded} if complete else set()
            linear_extents[index]={'start':hex(first),'end_exclusive':hex(last),'file_offset':hex(offset),'byte_count':len(raw),'sha256':hashlib.sha256(raw).hexdigest(),
                'complete_linear_decode':complete,'instruction_count':len(decoded),'instruction_starts_sha256':hashlib.sha256('\n'.join(f'{row[0]:x}' for row in decoded).encode()).hexdigest()}
        return address in linear_cache[index]
    admitted=[];candidate_tables=[]
    for table in tables:
        if table['guard_kind'] in ('ja','jae'):admitted.append(table);continue
        validation=validate_scalar_targets(table,observed_starts,observed_lengths,linear_boundary)
        table['whole_domain_instruction_boundaries']=validation
        table['successor_interpretation']='mathematically bounded potential successors; incoming/type restrictions remain unproved'
        if validation['exceptions']:
            table['candidate_rejection_reason']='scalar-domain-has-unproved-or-conflicting-instruction-targets';candidate_tables.append(table)
            counts['guarded-relative-tables']-=1;counts[table['candidate_rejection_reason']]+=1
        else:admitted.append(table)
    tables=admitted
    scalar_rejected_count=len(candidate_tables)
    linear_input=None;linear_review=None;origin_counts=None
    if args.include_declared_linear:
        from shared_native_inventory import _open_chunks_readonly
        summary_path=project_path(args.linear_summary or 'docs/analysis/coverage/instruction-summary.json')
        summary_checksum=file_sha256(summary_path)
        linear_summary=load_json(summary_path);database=project_path(linear_summary['inventory']['path'])
        if file_sha256(summary_path)!=summary_checksum:raise ValueError('Declared-linear summary changed while reading')
        if file_sha256(database)!=linear_summary['inventory']['sha256']:raise ValueError('Declared-linear inventory commitment differs')
        linear_helpers=[{'path':name,'sha256':file_sha256(ROOT/name)} for name in (
            'scripts/inventory-native-instructions.py','scripts/shared_native_inventory.py','scripts/coverage_common.py',
            'scripts/native_scalar_aliases.py','scripts/classify-native-ownership.py','scripts/summarize-native-image.py',
            'scripts/inventory-current-target.py','scripts/inventory-executable.py')]
        decoder_binding=dict(classifier.native_decoder_identity(),skipdata=False)
        with _open_chunks_readonly(database,root=ROOT) as connection:
            metadata=json.loads(connection.execute('SELECT value FROM metadata WHERE id=1').fetchone()[0])
            contract=validate_linear_inventory(linear_summary,metadata,report['target'],pe,capstone)
            linear_tables,linear_rejected,linear_review=recover_declared_linear(
                connection,pe,decoder,capstone,classifier,observed_starts,observed_lengths,linear_boundary)
        tables,conflicts=merge_linear_tables(tables,linear_tables)
        candidate_tables=[dict(row,candidate_origins=['ghidra-observed']) for row in candidate_tables]
        candidate_tables.extend(linear_rejected+conflicts)
        counts['guarded-relative-tables']=len(tables)
        origin_counts={'ghidra_observed':sum('ghidra-observed' in row['candidate_origins'] for row in tables),
            'declared_linear_only':sum(row['candidate_origins']==['declared-linear'] for row in tables),
            'observed_and_declared_linear':sum(len(row['candidate_origins'])==2 for row in tables),
            'rejected_declared_linear_tables':len(linear_rejected)+len(conflicts)}
        linear_input={'summary':{'path':summary_path.relative_to(ROOT).as_posix(),'sha256':summary_checksum},
            'inventory':{'path':database.relative_to(ROOT).as_posix(),'sha256':linear_summary['inventory']['sha256']},
            'decoder_contract':contract,'decoder':decoder_binding,'helpers':linear_helpers}
        linear_review['input']=linear_input
    output=artifact_path(args.inventory_output) if args.inventory_output else directory/'guarded-jump-tables.json'
    boundary_output=output.with_name(output.stem+'-linear-boundaries.json')
    boundary_payload={'target':report['target'],'generator':{'path':'scripts/recover-native-jump-tables.py','sha256':GENERATOR_SHA256,'capstone_version':capstone.__version__},
        'source_census':{'path':args.census_summary,'sha256':file_sha256(project_path(args.census_summary))},
        'method':'Exact current PE .pdata extents, decoded linearly from their declared beginning; no owner or source semantics inferred.',
        'extents':[linear_extents[index] for index in sorted(linear_extents)]}
    if linear_review is not None:boundary_payload['declared_linear_recovery']=linear_review
    boundary_text=json_text(boundary_payload)
    payload={'schema_version':1,'target':report['target'],'census_summary':args.census_summary,'census_summary_sha256':file_sha256(project_path(args.census_summary)),
        'generator':{'path':'scripts/recover-native-jump-tables.py','sha256':GENERATOR_SHA256,'capstone_version':capstone.__version__},
        'counts':dict(sorted(counts.items())),'tables':tables,'candidate_tables':candidate_tables,
        'linear_boundary_input':{'path':boundary_output.relative_to(ROOT).as_posix(),'sha256':hashlib.sha256(boundary_text.encode()).hexdigest()},'pe_parser_helpers':pe_dependencies,'native_semantics_or_all_computed_edges_complete':False}
    if linear_input is not None:payload.update(declared_linear_input=linear_input,candidate_origin_counts=origin_counts)
    serialized=json_text(payload)
    compact={key:value for key,value in payload.items() if key not in ('tables','candidate_tables')}
    compact['rejected_scalar_domain_tables']=scalar_rejected_count
    if linear_input is not None:compact['rejected_candidate_tables']=len(candidate_tables)
    compact['selector_alias_helpers']={'path':'scripts/native_scalar_aliases.py','sha256':ALIAS_HELPER_SHA256}
    compact['alias_guard_tables']=sum(table['selector_alias_proof'] is not None for table in tables)
    compact.update(case_entries=sum(len(t['case_targets']) for t in tables),unique_target_addresses=len({value for t in tables for value in t['case_targets']}),
        edge_digest=helpers.flow_edge_digest((int(t['site'],16),int(value,16)) for t in tables for value in t['case_targets']),
        census_helpers={'path':'scripts/summarize-native-image.py','sha256':helpers.GENERATOR_SHA256},
        scalar_helpers={'path':'scripts/classify-native-ownership.py','sha256':classifier.GENERATOR_SHA256},
        inventory={'path':output.relative_to(ROOT).as_posix(),'sha256':hashlib.sha256(serialized.encode()).hexdigest()},gap_ids=[41],parity_verified=False,
        limits=['Only explicit unsigned selector guards or whole-domain boundary-validated potential scalar successors in the exact signed-relative table idiom are recovered. Missing enum/type invariants and other dispatch remain unknown.',
            'Recovered successors describe the guarded fallthrough path; unknown incoming computed edges or wider caller invariants are not silently excluded.',
            'Successors seed code and flow edges, never invented function boundaries. No application compilation or execution.'])
    if file_sha256(ROOT/'scripts/native_scalar_aliases.py')!=ALIAS_HELPER_SHA256 or any(file_sha256(retained_runtime_path(ROOT/row['path'], ROOT))!=row['sha256'] for row in pe_dependencies) or file_sha256(ROOT/'scripts/recover-native-jump-tables.py')!=GENERATOR_SHA256:raise ValueError('Jump proof generator changed during analysis; rerun before publication')
    if file_sha256(ROOT/'scripts/summarize-native-image.py')!=helpers.GENERATOR_SHA256 or file_sha256(ROOT/'scripts/classify-native-ownership.py')!=classifier.GENERATOR_SHA256:raise ValueError('Jump proof dependency changed during analysis')
    if linear_input is not None:
        for reference in [linear_input['summary'],linear_input['inventory'],*linear_input['helpers']]:
            if file_sha256(ROOT/reference['path'])!=reference['sha256']:raise ValueError('Declared-linear input changed during recovery')
        if dict(classifier.native_decoder_identity(),skipdata=False)!=linear_input['decoder']:raise ValueError('Declared-linear decoder changed during recovery')
        target_bytes(target)
    if args.write:
        derived_bytes(boundary_output,boundary_text.encode(),publish=True)
        if output.is_relative_to(ROOT/'runtime'):SharedAnalysis(ROOT).publish_output(output,serialized.encode())
        else:derived_bytes(output,serialized.encode(),publish=True)
        derived_bytes(args.summary_output,json_text(compact).encode(),publish=True)
    print(json_text({key:compact[key] for key in ('counts','case_entries','unique_target_addresses')}))
if __name__=='__main__':main()
