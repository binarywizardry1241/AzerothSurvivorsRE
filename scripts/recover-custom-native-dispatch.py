#!/usr/bin/env python3
"""Recover bounded current custom switches, including transparent dispatch tails.

Only exact declared extents already associated with current custom diagnostics
are inspected. Extents supply independent boundaries, never invented owners.
The shared switch generator remains unchanged and its contracts are reused.
"""
import argparse
from array import array
from bisect import bisect_right
from collections import Counter
import gzip
import hashlib
import struct

from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path
from importlib.util import spec_from_file_location, module_from_spec


def module(name, path):
    spec = spec_from_file_location(name, ROOT / path)
    result = module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def recover_transparent_tail(instructions, pe, capstone, classifier, recovery):
    """Allow non-transferring instructions preserving the computed destination.

    A store after ADD cannot alter the register value already calculated. A
    destination write, CALL, branch, trap or unknown register access rejects the
    entire tail. The load and ADD themselves remain adjacent and 64-bit.
    """
    x = capstone.x86_const
    if len(instructions) < 5:
        return None, 'short-transparent-tail-context'
    jump = instructions[-1]
    if jump.mnemonic != 'jmp' or len(jump.operands) != 1 or jump.operands[0].type != x.X86_OP_REG or jump.operands[0].size != 8:
        return None, 'not-register-jump'
    canon = lambda instruction, register: classifier.canonical_register(instruction.reg_name(register))
    destination = canon(jump, jump.operands[0].reg)
    tail = []
    addition_index = None
    for index in range(len(instructions) - 2, -1, -1):
        instruction = instructions[index]
        if any(instruction.group(group) for group in
               (capstone.CS_GRP_CALL, capstone.CS_GRP_JUMP, capstone.CS_GRP_RET, capstone.CS_GRP_INT, capstone.CS_GRP_IRET)) or instruction.mnemonic in ('ud2', 'hlt', 'syscall', 'sysret', 'sysenter', 'sysexit'):
            return None, 'transparent-tail-has-transfer'
        try:
            writes = instruction.regs_access()[1]
        except capstone.CsError:
            return None, 'transparent-tail-register-access-unknown'
        if destination in {canon(instruction, register) for register in writes}:
            addition_index = index
            break
        tail.append(instruction)
    if addition_index is None or not tail or addition_index < 1:
        return None, 'no-transparent-tail-addition'
    addition = instructions[addition_index]
    load = instructions[addition_index - 1]
    if addition.mnemonic != 'add' or len(addition.operands) != 2 or any(operand.type != x.X86_OP_REG or operand.size != 8 for operand in addition.operands):
        return None, 'transparent-tail-destination-producer-is-not-relative-add'
    if canon(addition, addition.operands[0].reg) != destination:
        return None, 'different-add-destination'
    base_register = canon(addition, addition.operands[1].reg)
    if base_register == destination:
        return None, 'overwritten-relative-base'
    if load.mnemonic != 'movsxd' or len(load.operands) != 2 or load.operands[0].type != x.X86_OP_REG or load.operands[0].size != 8 or load.operands[1].type != x.X86_OP_MEM or load.operands[1].size != 4 or canon(load, load.operands[0].reg) != destination:
        return None, 'not-signed-table-load'
    memory = load.operands[1].mem
    if load.addr_size != 8 or memory.segment or not memory.base or not memory.index or memory.scale != 4 or canon(load, memory.base) != base_register:
        return None, 'unsupported-table-address'
    selector = canon(load, memory.index)
    prefix = instructions[:addition_index - 1]
    context = []
    for instruction in prefix:
        try:
            writes = instruction.regs_access()[1]
        except capstone.CsError:
            return None, 'prefix-register-access-unknown'
        backward = any(operand.type == x.X86_OP_IMM and operand.imm <= instruction.address for operand in instruction.operands)
        if instruction.group(capstone.CS_GRP_JUMP) and instruction.mnemonic != 'jmp' and not writes and not backward:
            continue
        context.append(instruction)
    base = classifier.local_values(context, lambda slot: None, capstone).get(base_register)
    if not base or base[0] != 'value':
        return None, 'table-base-not-static'
    guards = recovery.ALIASES.guard_bounds(prefix, selector, jump.address, capstone, classifier)
    if not guards:
        return None, 'transparent-tail-without-proven-unsigned-bound'
    guard = min(guards, key=lambda value: value['maximum'])
    lower, upper = 0, guard['maximum']
    domain = recovery.scalar_domain(prefix, selector, capstone, classifier)
    if domain is not None:
        lower, upper = max(lower, domain[0]), min(upper, domain[1])
    if upper < lower:
        return None, 'guarded-fallthrough-has-empty-proved-domain'
    span = instructions[guard['index']:]
    if any(first.address + first.size != second.address for first, second in zip(span, span[1:])):
        return None, 'transparent-tail-context-has-instruction-gap'
    table = base[1] + memory.disp + lower * 4
    size = (upper - lower + 1) * 4
    try:
        offset = pe.rva_offset(table - pe.image_base)
        last = pe.rva_offset(table - pe.image_base + size - 1)
    except ValueError:
        return None, 'table-not-file-backed'
    if last != offset + size - 1:
        return None, 'table-not-contiguous'
    section = next((section for section in pe.sections if section['rva'] <= table - pe.image_base and table - pe.image_base + size <= section['rva'] + section['raw_size']), None)
    if section is None or int(section['characteristics'], 16) & 0x80000000:
        return None, 'table-not-immutable-file-backed-data'
    raw = pe.data[offset:offset + size]
    targets = [base[1] + value[0] for value in struct.iter_unpack('<i', raw)]
    executable = [section for section in pe.sections if int(section['characteristics'], 16) & 0x20000000]
    if not all(any(pe.image_base + section['rva'] <= target < pe.image_base + section['rva'] + section['virtual_size'] for section in executable) for target in targets):
        return None, 'bounded-table-has-non-executable-target'
    return {'site': hex(jump.address), 'guard': hex(guard['instruction'].address),
            'selector_register': selector, 'guard_kind': 'alias-' + guard['branch'].mnemonic,
            'guard_bound': guard['bound'], 'selector_minimum': lower, 'selector_maximum': upper,
            'selector_alias_proof': {'compare': hex(guard['instruction'].address),
                                     'compare_instruction_bytes': guard['instruction'].bytes.hex(),
                                     'branch': hex(guard['branch'].address), 'branch_instruction_bytes': guard['branch'].bytes.hex(),
                                     'maximum': guard['maximum'], 'relation': 'exact scalar relation before the table load'},
            'dispatch_tail_proof': {'load': hex(load.address), 'addition': hex(addition.address),
                                     'destination_register': destination,
                                     'preserved_instructions': [{'site': hex(instruction.address), 'instruction_bytes': instruction.bytes.hex()} for instruction in reversed(tail)],
                                     'destination_preserved_and_no_transfers': True},
            'table_address': hex(table), 'relative_base': hex(base[1]), 'file_offset': hex(offset),
            'byte_count': size, 'sha256': hashlib.sha256(raw).hexdigest(),
            'case_targets': [hex(value) for value in targets], 'unique_targets': len(set(targets)),
            'guarded_fallthrough_cases_complete': True,
            'all_possible_incoming_contexts_or_type_invariants_complete': False}, None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--census-summary', required=True)
    parser.add_argument('--selection', required=True, help='Current custom-dispatch selection.json')
    parser.add_argument('--output', required=True, help='New project-local output directory')
    args = parser.parse_args()
    import capstone
    target = latest_target(verify=True)
    summary_path = project_path(args.census_summary)
    summary = load_json(summary_path)
    selection_path = project_path(args.selection)
    selection = load_json(selection_path)
    generation_digest = file_sha256(ROOT / 'scripts/recover-custom-native-dispatch.py')
    dependencies = [{'path': path, 'sha256': file_sha256(ROOT / path)} for path in
                    ('scripts/recover-native-jump-tables.py', 'scripts/native_scalar_aliases.py',
                     'scripts/classify-native-ownership.py', 'scripts/summarize-native-image.py',
                     'scripts/inventory-current-target.py', 'scripts/inventory-executable.py', 'scripts/coverage_common.py')]
    selection_generator = selection['selection']['generator']
    if file_sha256(project_path(selection_generator['path'])) != selection_generator['sha256']:
        raise ValueError('Custom selection generator differs')
    for parent in selection['selection']['inputs']:
        if file_sha256(project_path(parent['path'])) != parent['sha256']:
            raise ValueError('Custom selection parent commitment differs')
    if any(payload['target']['sha256'] != target['sha256'] for payload in (summary, selection)) or not summary['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('Current independently verified census and diagnostic selection required')
    recovery = module('custom_switch_base_recovery', 'scripts/recover-native-jump-tables.py')
    classifier = module('custom_switch_scalar_values', 'scripts/classify-native-ownership.py')
    helpers = module('custom_switch_census', 'scripts/summarize-native-image.py')
    pe = module('custom_switch_pe', 'scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    declared = {(pe.image_base + start, pe.image_base + end) for start, end, _ in pe.functions()}
    spans = {(int(row['declared_start'], 16), int(row['declared_end_exclusive'], 16)) for row in selection['references']}
    if not spans or not spans <= declared:
        raise ValueError('Selected custom extents do not match current PE declarations')
    instruction_path = project_path(summary['artifacts']['directory']) / 'instructions.tsv.gz'
    if file_sha256(instruction_path) != summary['artifacts']['files']['instructions.tsv.gz']['sha256']:
        raise ValueError('Source instruction inventory differs')
    starts = array('Q')
    lengths = array('B')
    with gzip.open(instruction_path, 'rt') as stream:
        next(stream)
        for line in stream:
            address, length, _ = line.split('\t', 2)
            starts.append(int(address, 16))
            lengths.append(int(length))
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    all_functions = sorted(declared)
    function_starts = [row[0] for row in all_functions]
    linear_cache = {}
    commitments = {}
    def linear_boundary(address):
        index = bisect_right(function_starts, address) - 1
        if index < 0 or address >= all_functions[index][1]:
            return False
        first, last = all_functions[index]
        if index not in linear_cache:
            offset = pe.rva_offset(first - pe.image_base)
            raw = pe.data[offset:offset + last - first]
            decoded = list(decoder.disasm_lite(raw, first))
            complete = sum(row[1] for row in decoded) == len(raw)
            linear_cache[index] = {row[0] for row in decoded} if complete else set()
            commitments[index] = {'start': hex(first), 'end_exclusive': hex(last), 'file_offset': hex(offset),
                                  'byte_count': len(raw), 'sha256': hashlib.sha256(raw).hexdigest(),
                                  'complete_linear_decode': complete, 'instruction_count': len(decoded)}
        return address in linear_cache[index]
    tables = []
    rejected = []
    counts = Counter()
    for first, last in sorted(spans):
        offset = pe.rva_offset(first - pe.image_base)
        raw = pe.data[offset:offset + last - first]
        decoded = list(decoder.disasm(raw, first))
        if sum(instruction.size for instruction in decoded) != len(raw):
            raise ValueError('Selected custom extent has an incomplete independent decode')
        ring = []
        for instruction in decoded:
            ring.append(instruction)
            if instruction.mnemonic == 'jmp' and instruction.operands and instruction.operands[0].type != capstone.x86_const.X86_OP_IMM:
                table, reason = recovery.recover(ring, pe, capstone, classifier)
                if table is None:
                    table, tail_reason = recover_transparent_tail(ring, pe, capstone, classifier, recovery)
                    if table is None:
                        counts[reason] += 1
                        counts['transparent-tail:' + tail_reason] += 1
                if table is not None:
                    # Every index and the source itself must be independently
                    # bounded; known instruction-interior conflicts reject all.
                    validation = recovery.validate_scalar_targets(dict(table, case_targets=table['case_targets'] + [table['site']]), starts, lengths, linear_boundary)
                    if validation['exceptions']:
                        rejected.append({'site': table['site'], 'reason': 'whole-table-boundary-conflict', 'validation': validation})
                        counts['whole-table-boundary-conflict'] += 1
                    else:
                        table['whole_domain_instruction_boundaries'] = validation
                        table['independent_linear_source_extent'] = {'start': hex(first), 'end_exclusive': hex(last), 'sha256': hashlib.sha256(raw).hexdigest()}
                        tables.append(table)
                        counts['admitted-tables'] += 1
                        if 'dispatch_tail_proof' in table:
                            counts['admitted-transparent-tail-tables'] += 1
            if any(instruction.group(group) for group in (capstone.CS_GRP_CALL, capstone.CS_GRP_RET, capstone.CS_GRP_INT, capstone.CS_GRP_IRET)) or instruction.mnemonic in ('jmp', 'ud2'):
                ring.clear()
    output = project_path(args.output)
    output.mkdir(parents=True, exist_ok=False)
    boundary_path = output / 'linear-boundaries.json'
    boundary_path.write_text(json_text({'target': summary['target'], 'extents': [commitments[index] for index in sorted(commitments)]}))
    payload = {'schema_version': 1, 'target': summary['target'],
               'generator': {'path': 'scripts/recover-custom-native-dispatch.py', 'sha256': generation_digest, 'capstone_version': capstone.__version__},
               'generator_dependencies': dependencies,
               'census_summary': args.census_summary, 'census_summary_sha256': file_sha256(summary_path),
               'custom_selection': {'path': args.selection, 'sha256': file_sha256(selection_path), 'declared_extent_count': len(spans)},
               'linear_boundary_input': {'path': boundary_path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(boundary_path)},
               'counts': dict(counts), 'tables': tables, 'candidate_tables': rejected,
               'native_semantics_or_all_computed_edges_complete': False}
    inventory = output / 'guarded-jump-tables.json'
    inventory.write_text(json_text(payload))
    compact = {key: value for key, value in payload.items() if key not in ('tables', 'candidate_tables')}
    compact.update(inventory={'path': inventory.relative_to(ROOT).as_posix(), 'sha256': file_sha256(inventory)},
                   case_entries=sum(len(table['case_targets']) for table in tables),
                   unique_target_addresses=len({value for table in tables for value in table['case_targets']}),
                   edge_digest=helpers.flow_edge_digest((int(table['site'], 16), int(value, 16)) for table in tables for value in table['case_targets']),
                   gap_ids=[41], parity_verified=False,
                   limits=['Only current diagnostic-associated declared extents are independently decoded; no declared extent becomes a body owner.',
                           'Every complete selector domain and source boundary is checked; no invalid case is discarded to admit a partial table.',
                           'Transparent tails preserve the already calculated destination and have no transfer; enum/type invariants and incoming aliases remain unknown.',
                           'No compilation, target execution or parity comparison.'])
    (output / 'guarded-jump-tables-summary.json').write_text(json_text(compact))
    if file_sha256(ROOT / 'scripts/recover-custom-native-dispatch.py') != generation_digest or any(file_sha256(ROOT / dependency['path']) != dependency['sha256'] for dependency in dependencies):
        raise ValueError('Custom recovery generator changed during analysis')
    print(json_text({key: compact[key] for key in ('counts', 'case_entries', 'unique_target_addresses')}))


if __name__ == '__main__':
    main()
