#!/usr/bin/env python3
"""Recover exact computed-gap expressions from the complete expanded AS selector.

A lexical table/base/selector candidate does not establish its incoming state or
valid enum domain. No compilation, Ghidra mutation or native execution.
"""
import argparse
from bisect import bisect_right
from collections import Counter
import csv
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

from coverage_common import ROOT,file_sha256,latest_target,target_bytes
from derived_gzip import derived_gzip_text

WORK=ROOT/'runtime/q41-expanded-ownership-0.115.0'
KEEP=ROOT/'docs/analysis/evidence/0.115.0/expanded-gap-dispatch.json'


def module(name,path):
    spec=importlib.util.spec_from_file_location(name,ROOT/path)
    value=importlib.util.module_from_spec(spec);spec.loader.exec_module(value);return value


def main():
    import capstone
    from capstone.x86_const import X86_OP_REG,X86_OP_MEM,X86_REG_RIP
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--write',action='store_true');args=ap.parse_args()
    generator_sha256=file_sha256(Path(__file__))
    inputs={}
    def checked(record):
        path=ROOT/record['path'];assert file_sha256(path)==record['sha256'],record['path']
        inputs[record['path']]=dict(path=record['path'],sha256=record['sha256']);return path
    def read(path):return json.loads(checked(dict(path=path,sha256=file_sha256(ROOT/path))).read_text())
    target=latest_target(verify=True)
    identity={k:target[k]for k in ('version','path','sha256','size_bytes')}
    source=read('docs/analysis/evidence/0.115.0/expanded-code-ownership.json')
    assert source['target']==identity
    boundary_path=checked(source['outputs']['missing-range-boundaries.tsv.gz'])
    for path in ['scripts/coverage_common.py','scripts/derived_gzip.py','scripts/inventory-executable.py',
                 'scripts/classify-native-ownership.py','scripts/recover-native-jump-tables.py','scripts/native_scalar_aliases.py']:
        checked(dict(path=path,sha256=file_sha256(ROOT/path)))
    pe=module('expanded_dispatch_pe','scripts/inventory-executable.py').PE(target_bytes(target))
    values=module('expanded_dispatch_values','scripts/classify-native-ownership.py')
    tables=module('expanded_dispatch_tables','scripts/recover-native-jump-tables.py')
    decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
    extents=sorted((pe.image_base+a,pe.image_base+b)for a,b,_ in pe.functions());starts=[r[0]for r in extents]
    def raw(a,n):return pe.data[pe.rva_offset(a-pe.image_base):pe.rva_offset(a-pe.image_base)+n]
    def form(i):return dict(site=hex(i.address),bytes=i.bytes.hex(),mnemonic=i.mnemonic,operands=i.op_str)
    def reg(i,r):return values.canonical_register(i.reg_name(r))
    def writes(i,r):return any(reg(i,w)==r for w in i.regs_access()[1])
    rows=[]
    with gzip.open(boundary_path,'rt')as stream:
        selected=[r for r in csv.DictReader(stream,delimiter='\t')if r['previous_flow']=='COMPUTED_JUMP'and r['AS_declared_context_paths']!='[]']
    assert len(selected)==68
    for original in selected:
        site=int(original['previous_site'],16);start,end=extents[bisect_right(starts,site)-1]
        assert start<=site<end
        decoded=[i for i in decoder.disasm(raw(start,site-start+15),start)if i.address<=site]
        assert decoded and decoded[-1].address==site
        jump=decoded[-1]
        row=dict(site=hex(site),instruction=form(jump),missing_range=[original['start'],original['end_exclusive']],
            missing_bytes=int(original['byte_count']),AS_context_paths=json.loads(original['AS_declared_context_paths']),
            declared_extent=[hex(start),hex(end)],prefix_sha256=hashlib.sha256(raw(start,site+jump.size-start)).hexdigest(),
            source_owner_or_valid_inputs_proven=False,runtime_dispatch_verified=False)
        if jump.mnemonic=='ud2':
            row.update(classification='architectural_UD2_trap_not_indirect_dispatch',next_action='No computed target follows this trap; surrounding successful source remains separately owned.')
            rows.append(row);continue
        assert jump.mnemonic=='jmp'and jump.operands[0].type==X86_OP_REG
        destination=reg(jump,jump.operands[0].reg)
        add_index=next(j for j in range(len(decoded)-2,-1,-1)if writes(decoded[j],destination))
        addition=decoded[add_index]
        assert addition.mnemonic=='add'and all(o.type==X86_OP_REG for o in addition.operands)
        base_register=reg(addition,addition.operands[1].reg)
        load_index=next(j for j in range(add_index-1,-1,-1)if writes(decoded[j],destination))
        load=decoded[load_index]
        assert load.mnemonic=='movsxd'and load.operands[1].type==X86_OP_MEM
        memory=load.operands[1].mem
        assert load.operands[1].size==4 and memory.scale==4 and reg(load,memory.base)==base_register
        selector=reg(load,memory.index)
        between=decoded[load_index+1:-1]
        assert not any(any(i.group(g)for g in [capstone.CS_GRP_CALL,capstone.CS_GRP_JUMP,capstone.CS_GRP_RET])for i in between)
        assert not any(writes(i,base_register)for i in decoded[load_index+1:add_index])
        # All side instructions are retained; only target/base noninterference
        # is established. They are not dropped from a guard-domain proof.
        expression=dict(kind='signed_relative_i32_table_expression',load=form(load),addition=form(addition),
            selector_register=selector,base_register=base_register,displacement=memory.disp,
            side_instructions=[form(i)for i in between if i.address!=addition.address])
        prefix=decoded[:load_index]
        state=values.local_values(prefix,lambda slot:None,capstone)
        base=state.get(base_register)
        lexical=next((i for i in reversed(prefix)if writes(i,base_register)),None)
        lexical_value=None
        if lexical and lexical.mnemonic=='lea'and lexical.operands[1].type==X86_OP_MEM and lexical.operands[1].mem.base==X86_REG_RIP:
            lexical_value=lexical.address+lexical.size+lexical.operands[1].mem.disp
        base_value=base[1]if base and base[0]=='value'else lexical_value
        expression['base_candidate']=dict(address=hex(base_value)if base_value is not None else None,
            basis='bounded_straight_line_encoded_value'if base and base[0]=='value'else'nearest_lexical_RIP_LEA_requires_incoming_state'if lexical_value is not None else'unresolved_incoming_register',
            nearest_definition=form(lexical)if lexical else None,incoming_paths_proven=False)
        domain=tables.scalar_domain(prefix,selector,capstone,values)
        if domain:
            low,high,producer,kind=domain
            expression['selector_candidate']=dict(minimum=low,maximum=high,producer=form(producer),kind=kind,
                valid_native_enum_values_established=False)
        else:expression['selector_candidate']=None
        bounded,reason=tables.recover(decoded[-128:],pe,capstone,values)
        row['existing_bounded_recovery']=dict(result=bounded,reason=reason,
            complete_incoming_state_or_AS_contract=False)
        # A finite scalar width bounds a read window; it is not an enum/table
        # length. Keep invalid/outside-code destinations explicit in the result.
        window=None
        if base_value is not None and domain and 0<=domain[0]<=domain[1]<=255:
            at=base_value+memory.disp+domain[0]*4;count=domain[1]-domain[0]+1;content=raw(at,count*4)
            assert len(content)==count*4
            assert pe.rva_offset(at-pe.image_base+len(content)-1)==pe.rva_offset(at-pe.image_base)+len(content)-1
            targets=[base_value+v[0]for v in struct.iter_unpack('<i',content)]
            executable=lambda a:any(pe.image_base+s['rva']<=a<pe.image_base+s['rva']+s['virtual_size']and int(s['characteristics'],16)&0x20000000 for s in pe.sections)
            window=dict(address=hex(at),entry_count=count,byte_count=len(content),sha256=hashlib.sha256(content).hexdigest(),
                targets=[hex(a)for a in targets],executable_destinations=sum(executable(a)for a in targets),
                is_table_length_or_valid_enum_population=False)
        row.update(classification='AS_context_signed_relative_expression_incoming_state_or_valid_domain_open',expression=expression,
            scalar_read_window=window,prelude=[form(i)for i in decoded[-128:]],
            next_action='Trace actual producer/type and incoming base/selector at this exact site; use scalar read-window candidates only after proving the valid domain.')
        rows.append(row)
    out=WORK/'AS-computed-gap-context.jsonl.gz'
    with derived_gzip_text(out,publish=True)as stream:
        for row in rows:stream.write(json.dumps(row,separators=(',',':'))+'\n')
    counts=dict(selected_boundaries=len(rows),architectural_traps=sum(r['instruction']['mnemonic']=='ud2'for r in rows),
        register_jumps=sum(r['instruction']['mnemonic']=='jmp'for r in rows),
        base_candidate_bases=dict(Counter(r['expression']['base_candidate']['basis']for r in rows if 'expression'in r)),
        finite_scalar_read_windows=sum(r.get('scalar_read_window')is not None for r in rows),
        existing_bounded_recovery_reasons=dict(Counter(r['existing_bounded_recovery']['reason']or'recovered_bounded_guard'for r in rows if 'existing_bounded_recovery'in r)))
    proof=dict(schema_version=1,target=identity,gap_ids=[41],lead_ids=['Q41-U01','Q41-U03','Q41-B01','Q41-M01','Q41-F01'],
        generator=dict(path=Path(__file__).relative_to(ROOT).as_posix(),sha256=generator_sha256),inputs=sorted(inputs.values(),key=lambda r:r['path']),
        artifact=dict(path=out.relative_to(ROOT).as_posix(),sha256=file_sha256(out),rows=len(rows)),counts=counts,
        site_classifications=[dict(site=r['site'],classification=r['classification'],
            base_candidate=r.get('expression',{}).get('base_candidate'),selector_candidate=r.get('expression',{}).get('selector_candidate'))for r in rows],
        incoming_state_complete=False,source_semantics_complete=False,parity_verified=False,
        limits=['Every selected site is present; Ghidra COMPUTED_JUMP UD2 observations are kept apart from actual indirect jumps.',
            'A nearest lexical RIP-LEA or finite machine scalar domain is a candidate, not incoming dominance, a native valid enum domain or table length.',
            'No AS source defect follows from absent Ghidra bytes. Existing repaired source is not reopened for proof-only target registration.',
            'No native queries, compilation, game/native execution or original/rebuilt comparison.'])
    assert file_sha256(Path(__file__))==generator_sha256
    for r in inputs.values():assert file_sha256(ROOT/r['path'])==r['sha256'],r['path']
    text=json.dumps(proof,indent=2)+'\n';(WORK/'dispatch-proof.json').write_text(text)
    if args.write:KEEP.write_text(text)
    else:assert json.loads(KEEP.read_text())==proof,'Curated proof differs; inspect runtime proposal before --write'
    print(json.dumps(counts,indent=2))


if __name__=='__main__':main()
