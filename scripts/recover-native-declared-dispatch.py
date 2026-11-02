#!/usr/bin/env python3
"""Find bounded current switch proposals across complete declared extents.

This is a mechanical code-only discovery stage. Its proposals must pass the
whole-domain/table-byte/code-boundary merge before any census uses their edges.
An incomplete linear extent is retained as a failure, never completed by guess.
"""
import argparse
from array import array
from collections import Counter
import gzip
import hashlib
import importlib.util

from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--census-summary', required=True)
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    import capstone
    target = latest_target(verify=True)
    source = project_path(args.census_summary)
    summary = load_json(source)
    if summary['target']['sha256'] != target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('Current independently verified census required')
    generation = {'path': 'scripts/recover-native-declared-dispatch.py', 'sha256': file_sha256(ROOT / 'scripts/recover-native-declared-dispatch.py'), 'capstone_version': capstone.__version__}
    dependencies = [{'path': path, 'sha256': file_sha256(ROOT / path)} for path in
                    ('scripts/recover-custom-native-dispatch.py', 'scripts/recover-native-jump-tables.py',
                     'scripts/native_dispatch_validation.py', 'scripts/native_scalar_aliases.py',
                     'scripts/classify-native-ownership.py', 'scripts/summarize-native-image.py',
                     'scripts/inventory-current-target.py', 'scripts/inventory-executable.py', 'scripts/coverage_common.py')]
    tails = module('declared_dispatch_tails', 'scripts/recover-custom-native-dispatch.py')
    recovery = module('declared_dispatch_base', 'scripts/recover-native-jump-tables.py')
    classifier = module('declared_dispatch_values', 'scripts/classify-native-ownership.py')
    verifier = module('declared_dispatch_bytes', 'scripts/native_dispatch_validation.py')
    pe = module('declared_dispatch_pe', 'scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    instructions = project_path(summary['artifacts']['directory']) / 'instructions.tsv.gz'
    if file_sha256(instructions) != summary['artifacts']['files']['instructions.tsv.gz']['sha256']:
        raise ValueError('Current instruction boundary inventory differs')
    starts, lengths = array('Q'), array('B')
    with gzip.open(instructions, 'rt') as stream:
        next(stream)
        for line in stream:
            first, length, _ = line.split('\t', 2)
            starts.append(int(first, 16))
            lengths.append(int(length))
    output = project_path(args.output)
    output.mkdir(parents=True, exist_ok=False)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    spans = sorted({(pe.image_base + first, pe.image_base + last) for first, last, _ in pe.functions()})
    tables, rejected, incomplete = [], [], []
    counts = Counter()
    decoded_bytes = 0
    for number, (first, last) in enumerate(spans, 1):
        offset = pe.rva_offset(first - pe.image_base)
        raw = pe.data[offset:offset + last - first]
        decoded = list(decoder.disasm(raw, first))
        size = sum(instruction.size for instruction in decoded)
        if size != len(raw):
            incomplete.append({'start': hex(first), 'end_exclusive': hex(last), 'byte_count': len(raw),
                               'sha256': hashlib.sha256(raw).hexdigest(), 'linear_decoded_prefix_bytes': size,
                               'first_unproved_byte': hex(first + size)})
        else:
            decoded_bytes += size
            counts['complete_declared_extents'] += 1
            ring = []
            for instruction in decoded:
                ring.append(instruction)
                if instruction.mnemonic == 'jmp' and instruction.operands and instruction.operands[0].type != capstone.x86_const.X86_OP_IMM:
                    table, reason = recovery.recover(ring, pe, capstone, classifier)
                    if table is None:
                        table, tail_reason = tails.recover_transparent_tail(ring, pe, capstone, classifier, recovery)
                        if table is None:
                            counts['unrecovered:' + str(reason)] += 1
                            counts['tail:' + str(tail_reason)] += 1
                    if table is not None:
                        if verifier.context_conflicts(ring, starts, lengths):
                            rejected.append({'site': table['site'], 'reason': 'source-context-overlaps-established-instruction'})
                        else:
                            verifier.verify_table_encoding(table, pe)
                            table['independent_linear_source_extent'] = {'start': hex(first), 'end_exclusive': hex(last), 'sha256': hashlib.sha256(raw).hexdigest()}
                            table['source_fallthrough_context'] = {'start': hex(ring[0].address), 'end_exclusive': hex(instruction.address + instruction.size),
                                                                   'sha256': hashlib.sha256(b''.join(value.bytes for value in ring)).hexdigest(),
                                                                   'established_instruction_boundaries_nonconflicting': True}
                            tables.append(table)
                            counts['bounded_table_proposals'] += 1
                            if 'dispatch_tail_proof' in table:
                                counts['transparent_tail_proposals'] += 1
                if any(instruction.group(group) for group in (capstone.CS_GRP_CALL, capstone.CS_GRP_RET, capstone.CS_GRP_INT, capstone.CS_GRP_IRET)) or instruction.mnemonic in ('jmp', 'ud2'):
                    ring.clear()
        if number % 10000 == 0 or number == len(spans):
            progress = {'declared_extents_scanned': number, 'declared_extents': len(spans), 'bounded_proposals': len(tables), 'incomplete_linear_extents': len(incomplete)}
            (output / 'progress.json').write_text(json_text(progress))
            print(json_text(progress), flush=True)
    failures = output / 'incomplete-linear-extents.json'
    failures.write_text(json_text({'target': summary['target'], 'records': incomplete}))
    inventory = output / 'guarded-jump-tables.json'
    payload = {'schema_version': 1, 'target': summary['target'], 'generator': generation, 'generator_dependencies': dependencies,
               'census_summary': args.census_summary, 'census_summary_sha256': file_sha256(source),
               'counts': dict(counts, declared_extents=len(spans), incomplete_linear_extents=len(incomplete), complete_linear_bytes=decoded_bytes),
               'incomplete_extent_inventory': {'path': failures.relative_to(ROOT).as_posix(), 'sha256': file_sha256(failures)},
               'tables': tables, 'candidate_tables': rejected,
               'proposals_require_whole_domain_instruction_boundary_admission': True,
               'native_semantics_or_all_computed_edges_complete': False}
    inventory.write_text(json_text(payload))
    compact = {key: value for key, value in payload.items() if key not in ('tables', 'candidate_tables')}
    compact['inventory'] = {'path': inventory.relative_to(ROOT).as_posix(), 'sha256': file_sha256(inventory)}
    compact['limits'] = ['Whole current declared extents are independent lexical source-code candidates, never inferred function ownership.',
                         'Only complete extents and nonconflicting local contexts supply proposals. Incomplete extents remain exact failures.',
                         'These proposals must pass the independent whole-domain merge before census use. Known-source code is not required, but source/case seeds remain code-only.',
                         'No application compilation, target execution, full type/alias reconstruction or parity claim.']
    (output / 'guarded-jump-tables-summary.json').write_text(json_text(compact))
    if file_sha256(ROOT / generation['path']) != generation['sha256'] or any(file_sha256(ROOT / row['path']) != row['sha256'] for row in dependencies):
        raise ValueError('Declared-dispatch generator changed during analysis')


if __name__ == '__main__':
    main()
