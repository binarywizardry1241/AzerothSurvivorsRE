#!/usr/bin/env python3
"""Measure bounded current-target decode reuse without altering census evidence."""
import argparse
import importlib.util
from itertools import islice
import time

import capstone
from coverage_common import ROOT, latest_target, target_bytes, load_json, file_sha256, project_path, json_text
from instruction_facts import InstructionFacts, BoundaryVerifier, NativeOperandStream, derived_json


def module(name, filename):
    spec = importlib.util.spec_from_file_location(name, ROOT / 'scripts' / filename)
    value = importlib.util.module_from_spec(spec); spec.loader.exec_module(value)
    return value


def consumer_fields(instruction):
    """Every intrinsic field accessed by the five consumers, via public APIs."""
    x=capstone.x86_const;operands=[];registers=set()
    reads,writes=instruction.regs_access();registers.update(reads);registers.update(writes)
    for operand in instruction.operands:
        reg=operand.reg if operand.type==x.X86_OP_REG else 0
        immediate=operand.imm if operand.type==x.X86_OP_IMM else 0
        memory=None
        if reg:registers.add(reg)
        if operand.type==x.X86_OP_MEM:
            m=operand.mem;memory=[m.segment,m.base,m.index,m.scale,m.disp]
            registers.update((m.segment,m.base,m.index))
        operands.append([operand.type,operand.size,operand.access,reg,immediate,memory])
    return [instruction.address,instruction.bytes.hex(),instruction.size,instruction.id,
            instruction.mnemonic,instruction.op_str,instruction.addr_size,list(instruction.groups),
            reads,writes,operands,{reg:instruction.reg_name(reg) for reg in registers if reg}]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--census-summary', required=True)
    parser.add_argument('--instructions', type=int, default=100000)
    parser.add_argument('--skip', type=int, default=0, help='Skip this many sorted records before the measured window')
    parser.add_argument('--output', required=True, help='Project runtime benchmark JSON')
    parser.add_argument('--window-in-memory', action='store_true', help='Read a bounded <=1m window once so repeated gzip traversal is outside decoding timings')
    parser.add_argument('--stream-only', action='store_true', help='Measure the default dense operand stream without populating unused detail caches')
    args = parser.parse_args()
    if args.instructions < 1 or args.skip < 0:
        raise ValueError('Positive sample size and nonnegative skip required')
    if args.window_in_memory and args.instructions > 1000000:
        raise ValueError('In-memory benchmark windows are limited to one million instructions')
    output = project_path(args.output)
    if not output.is_relative_to(ROOT / 'runtime'):
        raise ValueError('Benchmark output must stay inside project runtime/')
    target = latest_target(); summary = load_json(project_path(args.census_summary))
    if summary['target']['sha256'] != target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('Current verified census required')
    census = module('facts_benchmark_census', 'summarize-native-image.py')
    pe = module('facts_benchmark_pe', 'inventory-current-target.py').pe_parser(target_bytes(target))
    source = project_path(summary['artifacts']['directory']) / 'instructions.tsv.gz'
    digest = file_sha256(source)
    if digest != summary['artifacts']['files']['instructions.tsv.gz']['sha256']:
        raise ValueError('Benchmark instruction source changed')
    def source_rows():
        return islice(census.rows(source), args.skip, args.skip + args.instructions)
    retained = list(source_rows()) if args.window_in_memory else None
    def rows():
        return iter(retained) if retained is not None else source_rows()
    baseline = {}
    for detail in (False, True):
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64); decoder.detail = detail
        started = time.monotonic(); count = 0
        for row in rows():
            address = int(row['address'], 16); raw = bytes.fromhex(row['bytes'])
            offset = pe.rva_offset(address - pe.image_base)
            if len(raw) != int(row['length']) or pe.data[offset:offset + len(raw)] != raw:
                raise ValueError('Current benchmark bytes differ')
            decoded = list(decoder.disasm(raw,address,count=1)) if detail else list(decoder.disasm_lite(raw,address,count=1))
            if len(decoded) != 1 or (decoded[0].size if detail else decoded[0][1]) != len(raw):
                raise ValueError('Independent benchmark boundary differs')
            if detail:
                # Materialize the detail normally read by the operand audit.
                list(decoded[0].operands)
            count += 1
        baseline['detail' if detail else 'boundary'] = {'instructions':count,'elapsed_seconds':time.monotonic() - started}
    started=time.monotonic()
    with BoundaryVerifier(target['sha256'],pe,capstone) as boundaries:
        for _row,_instruction in boundaries.instructions(rows()):pass
        boundary_receipt=boundaries.receipt()
    boundary_measurement={**boundaries.metrics,'elapsed_seconds':time.monotonic()-started,'receipt':boundary_receipt}
    measurements = []
    for publish in (() if args.stream_only else (True, False)):
        started = time.monotonic()
        with InstructionFacts(target['sha256'],pe,capstone,publish=publish) as facts:
            for _, instruction in facts.instructions(rows()):
                # Exercise cached operand wrappers as the consuming audit does.
                list(instruction.operands)
            receipt = facts.receipt()
        measurements.append({'publish':publish,**facts.metrics,'elapsed_seconds':time.monotonic() - started})
    if measurements and measurements[-1]['decoded_instructions']:
        raise ValueError('Measured replay did not reuse every verified instruction')
    started=time.monotonic()
    with NativeOperandStream(target['sha256'],pe,capstone) as stream:
        for _,instruction in stream.instructions(rows()):list(instruction.operands)
        receipt=stream.receipt()
    stream_measurement={**stream.metrics,'elapsed_seconds':time.monotonic()-started}
    # Keep this stronger public-API comparison outside the timing windows. The
    # persisted producer reads C details directly; an independent public view
    # catches omitted or misinterpreted fields on the actual selected image.
    started=time.monotonic();equivalent=0
    decoder=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);decoder.detail=True
    with (NativeOperandStream(target['sha256'],pe,capstone) if args.stream_only else InstructionFacts(target['sha256'],pe,capstone,publish=False)) as facts:
        for row,instruction in facts.instructions(rows()):
            legacy=list(decoder.disasm(bytes.fromhex(row['bytes']),int(row['address'],16),count=1))
            if len(legacy)!=1 or consumer_fields(legacy[0])!=consumer_fields(instruction):
                raise ValueError('Cached consumer fields differ from independent Capstone at '+row['address'])
            equivalent+=1
    if file_sha256(source) != digest:
        raise ValueError('Benchmark input changed during measurement')
    payload = {'target_sha256':target['sha256'],'source_sha256':digest,'sample':{'skip':args.skip,'limit':args.instructions},
               'baseline':baseline,'boundary_batch':boundary_measurement,'operand_stream':stream_measurement,'facts':measurements,'receipt':receipt,
               'consumer_field_equivalence':{'instructions':equivalent,'all_fields_equal':True,'elapsed_seconds':time.monotonic()-started},
               'limits':['A bounded static instruction window is not a full execheck runtime measurement.']}
    derived_json(output,payload,publish=True)
    print(json_text(payload))


if __name__ == '__main__':
    main()
