#!/usr/bin/env python3
"""Check every ownerless noncustom diagnostic site's first local interface.

Static current PE, saved body census and diagnostic records only. No fresh native
provider, source execution, compiler or game. --stage writes ignored runtime proof.
"""
from runtime_layout import retained_runtime_path
import argparse
import bisect
from collections import Counter
from functools import lru_cache
import csv
import gzip
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT=Path(__file__).resolve().parents[1]
if ROOT.name=='runtime':ROOT=ROOT.parent
sys.path[:0]=[str(ROOT/'scripts'),str(ROOT/'runtime/tool-state/python/camera/python-libs')]
from coverage_common import file_sha256,latest_target,target_bytes
from script_sources import load_script
from compact_evidence import proof_text,SOURCE_SHA256 as RENDERER_SHA256
SHA='0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
WORK=ROOT/'runtime/analysis/history/findings/q41-e01/6240452bd976'
KEEP=ROOT/'docs/analysis/evidence/0.115.0/engine-diagnostic-roles.json'
D01=ROOT/'docs/analysis/evidence/0.115.0/q41-custom-diagnostics.json'
GENERATOR='scripts/check-engine-diagnostic-roles.py'
GENERATOR_SHA256=hashlib.sha256((ROOT/GENERATOR).read_bytes()).hexdigest()
RENDERER='scripts/compact_evidence.py'
# The carrier is the Windows x64 argument location at the first call, not an
# assertion that its shared callee dereferences the supplied Location on success.
INTERFACES={
 0x145eb7363:('bounds_failure','r8'),
 0x145eb7540:('formatted_failure','r8'),
 0x145eb7280:('explicit_message_failure','r8'),
 0x145eb72c0:('option_unwrap_failure','rcx'),
 0x145eb7200:('refcell_already_borrowed_failure','rcx'),
 0x145eb7240:('refcell_mutably_borrowed_failure','rcx'),
 0x145eb76a0:('async_resumed_after_completion_failure','rcx'),
 0x145eb76c0:('async_resumed_after_panicking_failure','rcx'),
 0x145eb7570:('slice_range_failure','r9'),
 0x145eb7520:('literal_message_failure','r8'),
 0x145eb71e0:('string_slice_failure','stack+0x20'),
 0x145eb72e0:('expect_debug_failure','stack+0x20'),
 0x145cdba10:('checked_duration_add','stack+0x20'),
 0x140bc6e20:('utf8_string_splice','stack+0x28'),
 0x140b64cc0:('stable_120_byte_vector_remove','r9'),
 0x1457aa060:('checked_8_byte_slice_copy','stack+0x28'),
 0x1408682b0:('location_argument_unused_by_shared_append','r9'),
 0x142247540:('length_bounded_shared_selector',None),
 0x145ced860:('shared_debug_field_format',None),
 0x145ce7350:('shared_encoded_format_to_string',None),
 0x140002200:('empty_allocation_hook_before_literal_copy',None),
}
EXPECTED={0x145eb7540:912,0x145eb7280:263,0x145eb7200:258,0x145eb7363:104,
 0x145eb76c0:64,0x145eb76a0:64,0x145eb7570:24,0x145eb72c0:24,0x145eb7520:19,
 0x145ce7350:10,0x145eb71e0:6,'rax':6,0x145eb7240:5,0x1457aa060:3,
 0x142247540:2,0x140bc6e20:2,0x1408682b0:1,0x145cdba10:1,0x145ced860:1,
 0x140b64cc0:1,0x140002200:1,0x145eb72e0:1}


def sha(raw):return hashlib.sha256(raw).hexdigest()
def artifact(path):return dict(path=path.relative_to(ROOT).as_posix(),sha256=sha(path.read_bytes()))
def packed(value):return json.dumps(value,sort_keys=True,separators=(',',':')).encode()


def argument_carriers(flow):
    """Propagate only the exact selected LEA value across its no-call path."""
    from capstone.x86_const import X86_OP_REG,X86_OP_MEM,X86_REG_RSP
    regs={flow[0].reg_name(flow[0].operands[0].reg):True};stack={}
    for instruction in flow[1:-1]:
        op=instruction.operands;copied=False
        if instruction.mnemonic=='mov' and len(op)==2:
            if op[1].type==X86_OP_REG:
                value=regs.get(instruction.reg_name(op[1].reg),False)
                if op[0].type==X86_OP_REG:
                    regs[instruction.reg_name(op[0].reg)]=value;copied=True
                elif op[0].type==X86_OP_MEM and op[0].mem.base==X86_REG_RSP and not op[0].mem.index:
                    stack[op[0].mem.disp]=value
        for reg in instruction.regs_access()[1]:
            name=instruction.reg_name(reg)
            if not(copied and op[0].type==X86_OP_REG and name==instruction.reg_name(op[0].reg)):
                regs.pop(name,None)
    return sorted([r for r,v in regs.items()if v]+['stack+'+hex(k)for k,v in stack.items()if v])


def derive():
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    from capstone.x86_const import X86_OP_IMM,X86_OP_MEM,X86_REG_RIP
    target=latest_target(verify=True);assert target['sha256']==SHA
    image=target_bytes(target)
    pe=load_script('e01_current_pe',ROOT/'scripts/inventory-executable.py').PE(image)
    ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    def raw(a,n):
        offset=pe.rva_offset(a-pe.image_base);result=image[offset:offset+n]
        assert len(result)==n;return result
    decoder=Cs(CS_ARCH_X86,CS_MODE_64);decoder.detail=True
    queue=json.loads((ROOT/'docs/analysis/evidence/0.115.0/unknown-recovery.json').read_text())
    assert queue['target']['sha256']==SHA
    diag_input=queue['inputs']['diagnostic-ownership']['inventory']
    body_input=queue['inputs']['ghidra-census']['execution_artifacts']['bodies.tsv.gz']
    for item in [diag_input,body_input]:assert sha((retained_runtime_path(ROOT/item['path'], ROOT)).read_bytes())==item['sha256']
    diagnostics=json.loads((ROOT/diag_input['path']).read_text());assert diagnostics['target']['sha256']==SHA
    with gzip.open(ROOT/body_input['path'],'rt')as stream:
        bodies=sorted((int(r['start'],16),int(r['end'],16),int(r['entry'],16))
                      for r in csv.DictReader(stream,delimiter='\t')if r['external']=='false')
    starts=[r[0]for r in bodies]
    def owner(a):
        i=bisect.bisect_right(starts,a)-1
        return bodies[i][2]if i>=0 and a<=bodies[i][1]else None
    selected=[]
    for diagnostic in diagnostics['diagnostics']:
        p=diagnostic['path']
        if diagnostic['custom_game_crate']or'/coop/'in p or p.endswith('/party.rs'):continue
        for row in diagnostic['verified_references']:
            if owner(int(row['instruction_address'],16))is None:selected.append(dict(path=p,**row))
    selected.sort(key=lambda r:(r['path'],int(r['instruction_address'],16),r['kind']))
    assert len(selected)==1772 and Counter(r['kind']for r in selected)=={'rust_location':1751,'path_literal':21}
    paths=sorted({r['path']for r in selected});assert len(paths)==63
    path_id={p:i for i,p in enumerate(paths)}
    cache={};extents=[];extent_id={};counts=Counter();sites=[];literals=[];unresolved=[]
    helpers={}
    def instructions(a,e):
        if a not in cache:
            content=raw(a,e-a);decoded=list(decoder.disasm(content,a))
            cache[a]={i.address:i for i in decoded}
        return cache[a]
    for row in selected:
        a=int(row['runtime_function_start'],16);e=int(row['runtime_function_end'],16)
        assert ends[a]==e and sha(raw(a,e-a))==row['owner_sha256']
        if a not in extent_id:
            extent_id[a]=len(extents);extents.append([hex(a),hex(e),row['owner_sha256']])
        ins=instructions(a,e);site=int(row['instruction_address'],16);current=ins[site]
        assert current.bytes.hex()==row['instruction_bytes']
        assert current.mnemonic=='lea' and current.operands[1].type==X86_OP_MEM
        assert current.operands[1].mem.base==X86_REG_RIP
        assert current.address+current.size+current.operands[1].mem.disp==int(row['target_address'],16)
        flow=[]
        for _ in range(150):
            flow.append(current)
            if current.mnemonic=='call':break
            assert not current.mnemonic.startswith('j')or current.mnemonic=='jmp'
            assert current.mnemonic not in ['ret','int3','ud2']
            if current.mnemonic=='jmp':
                assert current.operands[0].type==X86_OP_IMM
                following=current.operands[0].imm
            else:following=current.address+current.size
            current=ins[following]
        assert current.mnemonic=='call'
        callee=current.operands[0].imm if current.operands[0].type==X86_OP_IMM else current.op_str
        assert callee in INTERFACES or callee=='rax'
        counts[callee]+=1
        role=INTERFACES[callee][0]if callee!='rax'else'length_bounded_dynamic_formatter'
        carriers=argument_carriers(flow)
        if row['kind']=='rust_location':
            pointer,length,line,column=struct.unpack('<QQII',raw(int(row['target_address'],16),24))
            assert pointer==int(row['path_address'],16)
            assert raw(pointer,length).decode()==row['path'].replace('/','\\')
            assert(line,column)==(row['source_line'],row['source_column'])
            assert INTERFACES[callee][1]in carriers
        else:
            literals.append(literal_boundary(row,flow,ins,raw,callee,decoder))
            if callee=='rax':
                unresolved.append(dict(site=hex(site),role='formatter_target_unresolved',
                    exact_input='%.1f, byte_count=4, one argument, method_slot=0x28',
                    blocker='Object/vtable is a live caller input; this operand proof does not identify its concrete callback or formatting output.',
                    scope='Shared formatting interface; no necessary AS delta established.'))
        key=hex(callee)if isinstance(callee,int)else callee
        sites.append([path_id[row['path']],hex(site),row['target_address'],row['kind'],
                      row.get('source_line'),row.get('source_column'),extent_id[a],hex(current.address),key,
                      sha(b''.join(struct.pack('<Q',i.address)+bytes(i.bytes)for i in flow)),carriers])
    assert counts==EXPECTED
    # Reuse the existing canonical D01 helper identities, without another extract.
    d01=json.loads(D01.read_text());assert d01['target']['sha256']==SHA
    d01_helpers={int(r['entry'],16):r for r in d01['helpers']}
    for entry,(role,carrier)in INTERFACES.items():
        # The allocator hook is a single RET inside a wider PE interval.
        end=entry+1 if entry==0x140002200 else ends[entry]
        h=dict(entry=hex(entry),end_exclusive=hex(end),sha256=sha(raw(entry,end-entry)),role=role,
               location_carrier=carrier,saved_body_owner=hex(owner(entry))if owner(entry)is not None else None)
        if entry in d01_helpers:
            assert h['sha256']==d01_helpers[entry]['sha256']
            h['canonical_identity']='q41-custom-diagnostics.json#helpers:'+hex(entry)
        helpers[hex(entry)]=h
    guards=helper_guards(raw,decoder,ends)
    roles=Counter(INTERFACES[k][0]if k!='rax'else'length_bounded_dynamic_formatter'for k,n in counts.items()for _ in range(n))
    return dict(schema_version=1,target={k:target[k]for k in ['version','path','sha256','size_bytes']},
        generator=dict(path=GENERATOR,sha256=GENERATOR_SHA256),
        dependencies=[dict(path=RENDERER,sha256=RENDERER_SHA256)],
        gap_ids=[41],lead='Q41-E01',selector='Every verified diagnostic reference with custom_game_crate=false, no /coop/ or /party.rs path, and no actual saved Ghidra body owner.',
        inputs={'diagnostics':diag_input,'saved_bodies':body_input,'canonical_D01':artifact(D01)},
        classification_boundary_complete=True,native_semantics_complete=False,source_semantics_complete=False,
        source_implementation_added=False,parity_verified=False,
        counts=dict(sites=len(sites),paths=len(paths),rust_locations=1751,path_literals=21,declared_extents=len(extents),
                    failure_location_sites=1743,ordinary_helper_location_sites=7,unused_location_sites=1,
                    dynamic_formatter_target_unresolved=6,roles=dict(sorted(roles.items()))),
        paths=paths,extent_columns=['start','end_exclusive','sha256'],declared_extents=extents,
        site_columns=['path_index','instruction','data_target','kind','source_line','source_column','extent_index',
                      'first_call','first_consumer','flow_address_and_bytes_sha256','selected_pointer_carriers'],
        sites=sites,classification_digest=sha(packed(sites)),helpers=list(helpers.values()),
        helper_guards=guards,literal_boundaries=literals,unresolved=unresolved,
        source_boundary='Paths are diagnostic/source candidates only. Shared source availability, historical line matching and complete source/native equivalence are not asserted. No selected first interface proves a new necessary AS operation.',
        limits=['Every selected row is retained; native semantics beyond the stated first interface remain unverified.',
                'Declared PE unwind extents provide exact byte provenance and decoding boundaries, not saved Ghidra body ownership.',
                'Panic, formatting, allocation, selector, containers, Lua VM, protocol/network and asset implementations are shared supporting context; this branch stops at those interfaces.',
                'Six exact formatter method targets remain runtime-dependent; all six literal/length/method-slot inputs are retained.',
                'No new Ghidra, generic engine reconstruction, source execution, compiler, application, co-op/network/server execution or original/rebuilt parity checks.'])


def literal_boundary(row,flow,ins,raw,callee,decoder):
    a=int(row['target_address'],16);p=int(row['path_address'],16);site=int(row['instruction_address'],16)
    filename=row['path'].replace('/','\\').encode();assert raw(p,len(filename))==filename
    flow_text=[(i.mnemonic,i.op_str)for i in flow]
    before=[i for _,i in sorted(ins.items())if i.address<site][-12:]
    record=dict(site=hex(site),path=row['path'],input_address=hex(a),filename_address=hex(p))
    if callee==0x142247540:
        assert raw(a,3)==b'aev' and p==a+3
        assert any(i.mnemonic=='mov'and i.op_str=='edx, 3'for i in before)
        record.update(role='adjacent_length_bounded_selector',consumed_bytes=3,text='aev',filename_consumed=False,
                      input_contract='rcx=literal, edx=3; helper compares stored lengths before memcmp.')
    elif callee==0x145ced860:
        assert raw(a,5)==b'nodes'and p==a+5
        assert('mov','qword ptr [rsp + 0x58], rcx')in flow_text
        assert('mov','qword ptr [rsp + 0x60], 5')in flow_text
        record.update(role='adjacent_debug_field_name',consumed_bytes=5,text='nodes',filename_consumed=False,
                      input_contract='Stack field-name pointer and length=5 enter the shared Debug field formatter.')
    elif callee==0x145ce7350 and a!=p:
        expected=b'\xc0\x00'if row['path'].endswith('benilla-mlua/src/lib.rs')else b'\xc1\x20\x00\x80\x60\x00'
        assert raw(a,len(expected))==expected and p==a+len(expected)
        # Checked native descriptor parser consumes opcode c0 with 0 payload or
        # c1 with 4 payload bytes, then reaches the terminating zero byte.
        payload=0 if expected[0]==0xc0 else 4
        assert expected[1+payload]==0
        record.update(role='adjacent_encoded_format_descriptor',consumed_bytes=len(expected),bytes_hex=expected.hex(),
                      filename_consumed=False,input_contract='rdx=encoded format stream, r8=dynamic arguments; descriptor terminates before filename.')
    elif callee==0x145ce7350:
        assert len(filename)==35 and('mov','qword ptr [rbp + 0xa0], 0x23')in flow_text
        assert('mov','qword ptr [rbp + 0x98], rax')in flow_text
        record.update(role='filename_as_dynamic_format_argument',consumed_bytes=35,text=filename.decode(),filename_consumed=True,
                      input_contract='Pointer/length=35 are a dynamic formatting argument; descriptor is a different rdx address.')
    elif callee=='rax':
        assert raw(a,4)==b'%.1f'and p==a+4
        assert any(i.mnemonic=='mov'and i.op_str=='r9d, 4'for i in before)
        assert any(i.mnemonic=='mov'and i.op_str=='rax, qword ptr [rax + 0x28]'for i in before)
        assert any(i.mnemonic=='mov'and i.op_str=='qword ptr [rsp + 0x28], 1'for i in before)
        record.update(role='adjacent_dynamic_formatter_literal',consumed_bytes=4,text='%.1f',filename_consumed=False,
                      method_slot='0x28',argument_count=1,concrete_callback_verified=False)
    elif callee==0x140002200:
        assert raw(a,5)==b'table'and p==a+5 and('mov','edi, 5')in flow_text
        assert raw(0x140002200,1)==b'\xc3'
        # No-op and allocation hooks do not consume rbx; after allocation the
        # selected literal and length are copied into the returned string.
        follow=list(decoder.disasm(raw(0x1457bb14f,0x28),0x1457bb14f))
        assert[(i.mnemonic,i.op_str)for i in follow[-4:]]==[
            ('mov','rcx, rax'),('mov','rdx, rbx'),('mov','r8, rdi'),('call','0x145d145fb')]
        record.update(role='adjacent_literal_string_copy',consumed_bytes=5,text='table',filename_consumed=False,
                      first_call_consumes_literal=False,copy_call='0x1457bb172',copy_helper='0x145d145fb')
    else:
        assert callee==0x145eb7280 and raw(a,5)==b'model'and p==a+5
        assert('mov','edx, 5')in flow_text
        record.update(role='adjacent_explicit_failure_message',consumed_bytes=5,text='model',filename_consumed=False,
                      input_contract='rcx=message, edx=5, r8=separate Rust Location.')
    return record


def helper_guards(raw,decoder,ends):
    """Verify only helper contracts required for these immediate boundaries."""
    def ops(a,e=None):return[(i.mnemonic,i.op_str)for i in decoder.disasm(raw(a,(e or ends[a])-a),a)]
    def contains(a,expected):
        decoded=ops(a);assert all(x in decoded for x in expected)
        return dict(entry=hex(a),instruction_guards=[list(x)for x in expected])
    guards=[]
    guards.append(contains(0x145eb76a0,[('mov','r8, rcx'),('mov','edx, 0x47'),('call','0x145eb7540')]))
    guards.append(contains(0x145eb76c0,[('mov','r8, rcx'),('mov','edx, 0x45'),('call','0x145eb7540')]))
    assert raw(0x1473cf601,35)==b'`async fn` resumed after completion'
    assert raw(0x1473cf624,34)==b'`async fn` resumed after panicking'
    assert raw(0x1473d53be,32)==b'RefCell already mutably borrowed'
    assert raw(0x1473d53de,24)==b'RefCell already borrowed'
    guards.append(contains(0x145eb7200,[('mov','r8, rcx'),('call','0x145eb7540')]))
    guards.append(contains(0x145eb7240,[('mov','r8, rcx'),('call','0x145eb7540')]))
    guards.append(contains(0x142247540,[('cmp','qword ptr [r14 + r12 + 0x10], rsi'),('mov','r8, rsi'),('call','0x145d14601')]))
    guards.append(contains(0x145cdba10,[('add','rcx, r8'),('cmp','r9d, 0x3b9aca00'),('mov','r8, qword ptr [rbp + 0x30]'),('call','0x145eb7280')]))
    guards.append(contains(0x140bc6e20,[('cmp','byte ptr [rsi + rdx], 0xbf'),('cmp','byte ptr [rsi + r8], 0xbf'),('mov','r8, r10'),('call','0x145eb7540')]))
    guards.append(contains(0x140b64cc0,[('mov','rdi, r9'),('imul','rdx, rbx, 0x78'),('call','0x145d14607'),('dec','r14'),('mov','qword ptr [r15 + 0x10], r14'),('mov','r8, rdi'),('call','0x145eb709b')]))
    guards.append(contains(0x1457aa060,[('mov','r8, qword ptr [rsp + 0x58]'),('call','0x145eb7540'),('jmp','0x145d14607')]))
    # The incoming fourth argument is neither read nor forwarded: r9 is first
    # written with the allocator's constant 1, before that failure/growth call.
    r9_reads=[]
    for i in decoder.disasm(raw(0x1408682b0,ends[0x1408682b0]-0x1408682b0),0x1408682b0):
        rr,ww=i.regs_access()
        if any(i.reg_name(r)in ['r9','r9d','r9b','r9w']for r in rr):r9_reads.append(hex(i.address))
    assert not r9_reads
    nested=list(decoder.disasm(raw(0x144d9a790,ends[0x144d9a790]-0x144d9a790),0x144d9a790))
    assert all(not any(i.reg_name(r)in ['r9','r9d','r9b','r9w']for r in i.regs_access()[0])for i in nested)
    assert[(i.mnemonic,i.op_str)for i in nested if i.mnemonic=='call']==[('call','0x145eb7280')]
    guards.append(dict(entry='0x1408682b0',incoming_r9_read_sites=[],location_unused=True,
        nested_interface='0x144d9a790 has no r9 reads and only calls the already identified r8-Location failure interface.'))
    guards.append(dict(entry='0x144d9a790',incoming_r9_read_sites=[],direct_call_interfaces=['0x145eb7280']))
    # Format sizing parser's opcode payload count is bounded by the encoded
    # stream and terminates on zero; this is not a full formatter reimplementation.
    guards.append(contains(0x145ce7350,[('movzx','edx, byte ptr [rbx]'),('test','dl, dl'),
        ('movzx','edx, byte ptr [rcx]'),('shl','r8b, 7'),('and','r9b, 0x40'),('shr','r9b, 5'),
        ('add','rcx, r8'),('call','0x145ceee50')]))
    guards.append(contains(0x145ceee50,[('movzx','eax, byte ptr [r12]'),('test','al, al'),
        ('movzx','eax, byte ptr [r15]'),('cmp','r13d, 0xc0'),('mov','ecx, dword ptr [r12 + 1]'),
        ('add','r12, 5'),('mov','r15, r12'),('call','qword ptr [rsi + rax + 8]')]))
    guards.append(contains(0x145cef010,[('cmp','byte ptr [rcx + r10], 0xbf'),('call','0x145eb7540')]))
    for guard in guards:
        entry=int(guard['entry'],16);guard['end_exclusive']=hex(ends[entry])
        guard['sha256']=sha(raw(entry,ends[entry]-entry))
    return guards


def derive_residual_roles(target, interfaces):
    """Replay the current residual selector against verified PE bytes."""
    import capstone
    from capstone.x86_const import X86_OP_IMM, X86_OP_MEM, X86_REG_RIP

    pe = load_script('shared_diagnostic_pe', ROOT/'scripts/inventory-executable.py').PE(target_bytes(target))
    trace = load_script('diagnostic_pointer_trace', ROOT/'scripts/check-owned-custom-diagnostics.py')
    canonical = load_script('diagnostic_registers', ROOT/'scripts/classify-native-ownership.py').canonical_register
    identity = {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    residual_path = ROOT/'docs/analysis/evidence'/target['version']/'native-residuals.json'
    residual = json.loads(residual_path.read_text())
    assert residual['target'] == identity
    inventory = residual['artifacts']['diagnostic-sites.jsonl.gz']
    assert file_sha256(ROOT/inventory['path']) == inventory['sha256']
    context = 'shared-engine-or-other-path'
    with gzip.open(ROOT/inventory['path'], 'rt') as stream:
        population = [json.loads(line) for line in stream]
    assert len(population) == inventory['rows']
    selected = sorted(
        (r for r in population if r['context'] == context and r['actual_body_owner'] is None),
        key=lambda r: int(r['instruction_address'], 16),
    )
    assert len(selected) == residual['counts']['diagnostic_contexts'][context + ':ownerless']
    ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        data = pe.data[offset:offset + size]
        assert len(data) == size
        return data

    @lru_cache(maxsize=16)
    def decode(start, end):
        rows = list(decoder.disasm(raw(start, end - start), start))
        assert sum(i.size for i in rows) == end - start, hex(start)
        return {i.address: i for i in rows}

    def rip_target(instruction):
        rip, = [op.mem.disp for op in instruction.operands
                if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP]
        return instruction.address + instruction.size + rip

    def local_flow(rows, address):
        flow = []
        seen = set()
        while address not in seen and len(flow) < 256:
            seen.add(address)
            instruction = rows[address]
            flow.append(instruction)
            if instruction.group(capstone.CS_GRP_CALL):
                assert instruction.operands[0].type == X86_OP_IMM
                return flow
            assert not instruction.group(capstone.CS_GRP_RET) and instruction.mnemonic not in ('ud2', 'int3')
            if instruction.group(capstone.CS_GRP_JUMP):
                assert instruction.mnemonic == 'jmp' and instruction.operands[0].type == X86_OP_IMM
                address = instruction.operands[0].imm
            else:
                address += instruction.size
        raise AssertionError(f'No straight route to the first call at {flow[0].address:#x}')

    # Helper role descriptions and their reviewed native anchors are carried by
    # the target proof. Replaying checks those anchors and derives every site.
    helpers = {}
    for entry, interface in interfaces.items():
        start = int(entry, 16)
        if 'tail_jump' in interface:
            thunk = next(decoder.disasm(raw(start, 15), start))
            assert thunk.mnemonic == 'jmp' and thunk.operands[0].type == X86_OP_IMM
            start = thunk.operands[0].imm
            assert hex(start) == interface['tail_jump']
        end = ends[start]
        rows = decode(start, end)
        instructions = {(i.mnemonic, i.op_str) for i in rows.values()}
        assert all(tuple(guard) in instructions for guard in interface['guards']), entry
        if interface['role'].startswith('terminal-'):
            assert not any(i.group(capstone.CS_GRP_RET) for i in rows.values()), entry
            assert list(rows.values())[-1].mnemonic == 'ud2', entry
        for site, literal in interface.get('rip_literals', []):
            address = rip_target(rows[int(site, 16)])
            assert raw(address, len(literal)) == literal.encode(), entry
        if 'fifth_argument_offsets' in interface:
            # Validate the frame before checking for any direct reference to the
            # incoming fifth argument. The callee's outgoing slots are distinct.
            values = list(rows.values())
            push_count = next(n for n, i in enumerate(values) if i.mnemonic != 'push')
            frame, base = values[push_count:push_count+2]
            assert frame.mnemonic == 'sub' and frame.op_str.startswith('rsp, ')
            assert base.mnemonic == 'lea' and base.op_str.startswith('rbp, [rsp ')
            stack_arg = 0x28 + push_count * 8 + frame.operands[1].imm
            offsets = {'rsp': stack_arg, 'rbp': stack_arg - base.operands[1].mem.disp}
            assert interface['fifth_argument_offsets'] == offsets
            for i in values:
                for op in i.operands:
                    if op.type == X86_OP_MEM and (reg := i.reg_name(op.mem.base)) in offsets:
                        assert op.mem.disp + op.size <= offsets[reg], (entry, hex(i.address))
        helpers[entry] = {'body_start': hex(start), 'end_exclusive': hex(end),
                          'body_sha256': sha(raw(start, end-start))}
        if start != int(entry, 16):
            helpers[entry]['thunk_sha256'] = sha(bytes(thunk.bytes))

    extents = {}
    paths = sorted({r['path'] for r in selected})
    path_indices = {path: index for index, path in enumerate(paths)}
    sites = []
    roles = Counter()
    for row in selected:
        start, end, site, pointer = (int(row[k], 16) for k in
            ('runtime_function_start', 'runtime_function_end', 'instruction_address', 'target_address'))
        extent = row['runtime_function_start']
        if extent not in extents:
            digest = sha(raw(start, end-start))
            assert ends[start] == end and digest == row['owner_sha256']
            extents[extent] = [hex(end), digest]
        assert extents[extent] == [hex(end), row['owner_sha256']]
        rows = decode(start, end)
        instruction = rows[site]
        assert instruction.mnemonic == 'lea' and instruction.bytes.hex() == row['instruction_bytes']
        assert rip_target(instruction) == pointer and row['kind'] == 'rust_location'
        name, length, line, column = struct.unpack('<QQII', raw(pointer, 24))
        assert hex(name) == row['path_address'] and raw(name, length).decode().replace('\\', '/') == row['path']
        assert (line, column) == (row['source_line'], row['source_column'])
        flow = local_flow(rows, site)
        call = flow[-1]
        target_entry = hex(call.operands[0].imm)
        interface = interfaces[target_entry]
        projection = trace.pointer_projection(flow, canonical, capstone)
        carriers = projection['exact_argument_carriers']
        assert carriers == interface['carriers'], (hex(site), carriers)
        if 'retained_only' in interface:
            assert projection['retained_registers'] == interface['retained_only']
        roles[interface['role']] += 1
        sites.append([hex(site), path_indices[row['path']], line, column, hex(pointer), extent,
                      hex(call.address), target_entry,
                      sha(b''.join(struct.pack('<Q', i.address) + bytes(i.bytes) for i in flow))])

    assert len({r[0] for r in sites}) == len(sites)
    assert {r[7] for r in sites} == set(interfaces)
    return dict(schema_version=1, target=identity, gap_ids=[41], lead='Q41-E01',
                generator=artifact(ROOT/GENERATOR),
                dependencies=[artifact(ROOT/'scripts'/name) for name in
                              ('inventory-executable.py', 'check-owned-custom-diagnostics.py',
                               'classify-native-ownership.py', 'compact_evidence.py')],
                inputs=[artifact(residual_path), inventory],
                selector=f"context == '{context}' and actual_body_owner == null",
                counts=dict(sites=len(sites), paths=len(paths), declared_extents=len(extents),
                            first_interfaces=len(interfaces), roles=dict(sorted(roles.items()))),
                interfaces=interfaces, helper_bodies=helpers, paths=paths,
                declared_extent_columns=['end_exclusive', 'sha256'], declared_extents=extents,
                site_columns=['instruction', 'path_index', 'source_line', 'source_column', 'location',
                              'declared_extent', 'first_call', 'first_interface', 'flow_address_and_bytes_sha256'],
                sites=sites, limits=[
                    'Classifies the selected diagnostic operand and immediate interface only.',
                    'A PE unwind extent does not establish Ghidra function ownership.',
                    'Shared event, resource, and failure boundaries do not establish successful AS semantics.',
                    'No game, compiler, server, or parity verification was run.',
                ])


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage',action='store_true')
    ap.add_argument('--interfaces', action='store_true', help='With --stage, read the reviewed helper profile from stdin')
    args=ap.parse_args()
    if args.interfaces and not args.stage:
        ap.error('--interfaces requires --stage')
    target = latest_target(verify=True)
    if target['sha256'] != SHA:
        proof = ROOT/'docs/analysis/evidence'/target['version']/'engine-diagnostic-roles.json'
        retained = None if args.interfaces else json.loads(proof.read_text())
        value = derive_residual_roles(target, json.load(sys.stdin) if args.interfaces else retained['interfaces'])
        if args.stage:
            stage = ROOT/'runtime/tmp'/f'engine-diagnostic-roles-{target["version"]}.json'
            stage.parent.mkdir(parents=True, exist_ok=True)
            stage.write_text(proof_text(value)+'\n')
            print(stage.relative_to(ROOT))
        else:
            assert value == retained, 'Retained E01 proof differs from current selected boundaries'
        print(json.dumps(value['counts'], indent=2))
        return

    value=derive();text=proof_text(value)+'\n'
    assert sha((ROOT/GENERATOR).read_bytes())==GENERATOR_SHA256
    assert sha((ROOT/RENDERER).read_bytes())==RENDERER_SHA256
    if args.stage:
        WORK.mkdir(parents=True,exist_ok=True);path=WORK/'engine-diagnostic-roles.json';path.write_text(text)
        print(json.dumps(dict(status='staged',proof=artifact(path),counts=value['counts'],digest=value['classification_digest']),indent=2))
    else:
        assert json.loads(KEEP.read_text())==value,'Retained E01 proof differs from current selected boundaries'
        print(json.dumps(dict(status='pass',proof=artifact(KEEP),counts=value['counts'],digest=value['classification_digest']),indent=2))
if __name__=='__main__':main()
