#!/usr/bin/env python3
"""Explain remaining custom diagnostic flow boundaries without assigning owners.

Linear declared extents supply independent instruction boundaries only. A
conservative path walk retains call-return assumptions and unresolved computed
exits; only the supplied census supplies actual Ghidra body ownership.
"""
import argparse
from collections import Counter, deque
import hashlib
import importlib.util

from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def potential_walk(instructions, start, edges, capstone):
    pending = [start]
    reached = set()
    computed = set()
    assumed_returns = set()
    while pending:
        site = pending.pop()
        if site in reached or site not in instructions:
            continue
        reached.add(site)
        instruction = instructions[site]
        if instruction.group(capstone.CS_GRP_RET) or instruction.mnemonic in ('ud2', 'int3', 'hlt'):
            continue
        if instruction.group(capstone.CS_GRP_CALL):
            assumed_returns.add(site)
        if instruction.group(capstone.CS_GRP_JUMP):
            direct = [operand.imm for operand in instruction.operands
                      if operand.type == capstone.x86_const.X86_OP_IMM]
            pending.extend(direct)
            if not direct:
                computed.add(site)
                pending.extend(edges.get(site, ()))
            if instruction.mnemonic == 'jmp':
                continue
        pending.append(site + instruction.size)
    return reached, computed, assumed_returns


def adjacent_literal_descriptor(reference, decoded, pe, capstone):
    """Recognize an observed pointer/length label, keeping raw leads intact."""
    if reference['reference_kind'] != 'path_literal':
        return None
    site = int(reference['site'], 16)
    index = next((index for index, instruction in enumerate(decoded) if instruction.address == site), None)
    if index is None or index + 2 >= len(decoded):
        return None
    x = capstone.x86_const
    source, pointer, length = decoded[index:index + 3]
    if source.mnemonic != 'lea' or source.bytes[:3] != bytes.fromhex('488d05'):
        return None
    target = source.address + source.size + source.operands[1].mem.disp
    path_bytes = reference['path'].replace('/', '\\').encode()
    offset = pe.rva_offset(target - pe.image_base)
    if pe.data[offset:offset + 5 + len(path_bytes)] != b'spell' + path_bytes:
        return None
    if pointer.mnemonic != 'mov' or len(pointer.operands) != 2 or pointer.operands[0].type != x.X86_OP_MEM or pointer.operands[1].type != x.X86_OP_REG or pointer.reg_name(pointer.operands[1].reg) != 'rax':
        return None
    memory = pointer.operands[0].mem
    if pointer.operands[0].size != 8 or pointer.reg_name(memory.base) != 'rbp' or memory.index or memory.segment:
        return None
    descriptor_offset = memory.disp
    if length.mnemonic != 'mov' or len(length.operands) != 2 or length.operands[0].type != x.X86_OP_MEM or length.operands[1].type != x.X86_OP_IMM or length.operands[1].imm != 5 or length.operands[0].size != 8:
        return None
    other = length.operands[0].mem
    if length.reg_name(other.base) != 'rbp' or other.index or other.segment or other.disp != descriptor_offset + 8:
        return None
    count = None
    argument = None
    call = None
    for instruction in decoded[index + 3:index + 43]:
        if instruction.group(capstone.CS_GRP_CALL):
            if instruction.mnemonic != 'call' or len(instruction.operands) != 1 or instruction.operands[0].type != x.X86_OP_IMM:
                return None
            call = instruction
            break
        if any(instruction.group(group) for group in (capstone.CS_GRP_JUMP, capstone.CS_GRP_RET,
                                                      capstone.CS_GRP_INT, capstone.CS_GRP_IRET,
                                                      capstone.CS_GRP_PRIVILEGE)) or instruction.mnemonic == 'ud2':
            return None
        operands = instruction.operands
        if any(instruction.reg_name(register) in ('rbp', 'ebp', 'bp', 'bpl', 'rsp', 'esp', 'sp', 'spl') for register in instruction.regs_access()[1]):
            return None
        for operand in operands:
            if operand.type != x.X86_OP_MEM or not operand.access & capstone.CS_AC_WRITE:
                continue
            memory = operand.mem
            base = instruction.reg_name(memory.base)
            if memory.index or memory.segment or base not in ('rbp', 'rsp'):
                return None
            if base == 'rbp' and memory.disp < descriptor_offset + 16 and descriptor_offset < memory.disp + operand.size:
                return None
            if base == 'rsp' and memory.disp < 0x28 and 0x20 < memory.disp + operand.size:
                count = None
        if instruction.mnemonic == 'mov' and len(operands) == 2 and operands[0].type == x.X86_OP_MEM:
            memory = operands[0].mem
            if instruction.reg_name(memory.base) == 'rbp' and descriptor_offset <= memory.disp < descriptor_offset + 16:
                return None
            if instruction.reg_name(memory.base) == 'rsp' and memory.disp == 0x20 and operands[0].size == 8 and operands[1].type == x.X86_OP_IMM:
                count = operands[1].imm
        if any(instruction.reg_name(register) in ('r9', 'r9d', 'r9w', 'r9b') for register in instruction.regs_access()[1]):
            argument = None
            if instruction.mnemonic == 'lea' and len(operands) == 2 and operands[0].type == x.X86_OP_REG and instruction.reg_name(operands[0].reg) == 'r9' and operands[1].type == x.X86_OP_MEM:
                memory = operands[1].mem
                if instruction.reg_name(memory.base) == 'rbp' and not memory.index and not memory.segment and memory.disp == descriptor_offset:
                    argument = instruction
    if call is None or argument is None or count not in (1, 2):
        return None
    last = call.address + call.size
    start_offset = pe.rva_offset(site - pe.image_base)
    raw = pe.data[start_offset:start_offset + last - site]
    def span(address, size):
        position = pe.rva_offset(address - pe.image_base)
        return {'va': hex(address), 'byte_count': size, 'sha256': hashlib.sha256(pe.data[position:position + size]).hexdigest()}
    return {'site': reference['site'], 'path': reference['path'], 'original_reference_kind': 'path_literal',
            'role': 'adjacent-literal-reference', 'raw_reference_preserved': True,
            'source_instruction': dict(span(site, source.size), decoded_target=hex(target)),
            'literal': dict(span(target, 5), text='spell'), 'filename': span(target + 5, len(path_bytes)),
            'descriptor': {'base_register': 'rbp', 'pointer_offset': hex(descriptor_offset),
                           'length_offset': hex(descriptor_offset + 8), 'explicit_length': 5,
                           'length_instruction': span(length.address, length.size)},
            'consumer': {'entry': hex(call.operands[0].imm), 'argument_register': 'r9', 'descriptor_count': count,
                         'call_instruction': span(call.address, call.size),
                         'producer_to_consumer_code': dict(span(site, len(raw)), file_offset=hex(start_offset))},
            'native_body_owner_or_source_location_inferred': False,
            'scope': 'Observed label pointer/length descriptor; no function ownership or complete consumer semantics inferred.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--census-summary', required=True)
    parser.add_argument('--jump-summary', required=True)
    parser.add_argument('--rejection-summaries', nargs='*', default=[], help='Additional current switch summaries retaining whole-domain candidate rejections')
    parser.add_argument('--output', required=True)
    parser.add_argument('--summary-output', help='Optional compact durable frontier/descriptor observations; raw leads are never excluded')
    args = parser.parse_args()
    import capstone
    target = latest_target(verify=True)
    summary_path = project_path(args.census_summary)
    summary = load_json(summary_path)
    if summary['target']['sha256'] != target['sha256'] or not summary['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('Current independently verified census required')
    helpers = module('custom_frontier_census', 'scripts/summarize-native-image.py')
    tables_helper = module('custom_frontier_tables', 'scripts/recover-native-jump-tables.py')
    custom_helper = module('custom_frontier_transparent_tails', 'scripts/recover-custom-native-dispatch.py')
    classifier = module('custom_frontier_values', 'scripts/classify-native-ownership.py')
    pe = module('custom_frontier_pe', 'scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    directory = project_path(summary['artifacts']['directory'])
    body_path = directory / 'bodies.tsv.gz'
    if file_sha256(body_path) != summary['artifacts']['files']['bodies.tsv.gz']['sha256']:
        raise ValueError('Native body artifact differs')
    owner = helpers.owner_lookup([(int(row['start'], 16), int(row['end'], 16), int(row['entry'], 16))
                                  for row in helpers.rows(body_path) if row['external'] == 'false'])
    jump_path = project_path(args.jump_summary)
    jump = load_json(jump_path)
    inventory = project_path(jump['inventory']['path'])
    if jump['target']['sha256'] != target['sha256'] or file_sha256(inventory) != jump['inventory']['sha256']:
        raise ValueError('Current jump inventory commitment differs')
    table_payload = load_json(inventory)
    tables = table_payload['tables']
    rejected_tables = {int(row['site'], 16): row for row in table_payload.get('candidate_tables', [])}
    rejection_inputs = []
    for name in args.rejection_summaries:
        path = project_path(name)
        extra = load_json(path)
        extra_path = project_path(extra['inventory']['path'])
        if extra['target']['sha256'] != target['sha256'] or file_sha256(extra_path) != extra['inventory']['sha256']:
            raise ValueError('Supplemental rejected-switch input differs')
        rejected = load_json(extra_path)
        parent = project_path(rejected['census_summary'])
        if rejected['target']['sha256'] != target['sha256'] or file_sha256(parent) != rejected['census_summary_sha256']:
            raise ValueError('Supplemental rejected-switch parent differs')
        for row in rejected.get('candidate_tables', []):
            rejected_tables.setdefault(int(row['site'], 16), row)
        rejection_inputs.extend({'path': item.relative_to(ROOT).as_posix(), 'sha256': file_sha256(item)} for item in (path, extra_path))
    edges = {int(table['site'], 16): {int(value, 16) for value in table['case_targets']} for table in tables}
    diagnostic_path = ROOT / f"runtime/coverage/{target['sha256']}/diagnostic-ownership.json"
    diagnostics = load_json(diagnostic_path)
    if diagnostics['target']['sha256'] != target['sha256']:
        raise ValueError('Diagnostic target differs')
    declared = {(pe.image_base + start, pe.image_base + end) for start, end, _ in pe.functions()}
    groups = {}
    custom_sites = set()
    unbound = []
    for row in diagnostics['diagnostics']:
        if not row['custom_game_crate']:
            continue
        for reference in row['verified_references']:
            site = int(reference['instruction_address'], 16)
            custom_sites.add(site)
            if owner(site) is not None:
                continue
            if reference.get('runtime_function_start') is None:
                unbound.append({'site': hex(site), 'path': row['path']})
                continue
            span = (int(reference['runtime_function_start'], 16), int(reference['runtime_function_end'], 16))
            if span not in declared or not span[0] <= site < span[1]:
                raise ValueError('Diagnostic declaration is not an exact current PE extent')
            groups.setdefault(span, []).append({'site': hex(site), 'path': row['path'], 'reference_kind': reference['kind']})
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    records = []
    literal_roles = []
    for (start, end), references in sorted(groups.items()):
        offset = pe.rva_offset(start - pe.image_base)
        raw = pe.data[offset:offset + end - start]
        decoded = list(decoder.disasm(raw, start))
        if sum(instruction.size for instruction in decoded) != len(raw):
            raise ValueError('Incomplete independent linear decode of custom declaration')
        instructions = {instruction.address: instruction for instruction in decoded}
        for reference in references:
            role = adjacent_literal_descriptor(reference, decoded, pe, capstone)
            if role is not None:
                literal_roles.append(role)
        reached, computed, assumed_returns = potential_walk(instructions, start, edges, capstone)
        contexts = {}
        ring = deque()
        for instruction in decoded:
            ring.append(instruction)
            if instruction.address in computed and instruction.address not in edges:
                proposal, reason = tables_helper.recover(list(ring), pe, capstone, classifier)
                if proposal is None and reason == 'not-relative-add':
                    proposal, reason = custom_helper.recover_transparent_tail(list(ring), pe, capstone, classifier, tables_helper)
                if instruction.address in rejected_tables:
                    proposal = None
                    rejected = rejected_tables[instruction.address]
                    reason = rejected.get('reason', rejected.get('candidate_rejection_reason', 'whole-domain-proposal-rejected'))
                contexts[instruction.address] = {'site': hex(instruction.address), 'operand': instruction.op_str,
                                                'local_table_recovery': reason or 'new-bounded-table-proposal',
                                                'new_table': proposal,
                                                'whole_domain_rejection': rejected_tables.get(instruction.address)}
            if any(instruction.group(group) for group in (capstone.CS_GRP_CALL, capstone.CS_GRP_RET, capstone.CS_GRP_INT, capstone.CS_GRP_IRET)) or instruction.mnemonic in ('jmp', 'ud2'):
                ring.clear()
        sites = {int(reference['site'], 16) for reference in references}
        records.append({'declared_start': hex(start), 'declared_end_exclusive': hex(end),
                        'declared_entry_current_body_owner': hex(owner(start)) if owner(start) is not None else None,
                        'byte_count': len(raw), 'sha256': hashlib.sha256(raw).hexdigest(),
                        'complete_linear_decode': True, 'instruction_count': len(decoded),
                        'unowned_diagnostic_references': references,
                        'potentially_reached_unowned_sites': [hex(site) for site in sorted(sites & reached)],
                        'unreached_unowned_sites': [hex(site) for site in sorted(sites - reached)],
                        'computed_frontiers': [contexts[site] for site in sorted(contexts)],
                        'calls_with_unproved_return_assumption': len(assumed_returns),
                        'potential_paths_are_not_actual_native_ownership': True})
    reasons = Counter(frontier['local_table_recovery'] for record in records for frontier in record['computed_frontiers'])
    payload = {'schema_version': 1, 'target': summary['target'],
               'generator': {'path': 'scripts/audit-custom-native-frontiers.py', 'sha256': file_sha256(ROOT / 'scripts/audit-custom-native-frontiers.py'), 'capstone_version': capstone.__version__},
               'generator_dependencies': [{'path': path, 'sha256': file_sha256(ROOT / path)} for path in
                                          ('scripts/summarize-native-image.py', 'scripts/recover-native-jump-tables.py',
                                           'scripts/recover-custom-native-dispatch.py',
                                           'scripts/native_scalar_aliases.py', 'scripts/classify-native-ownership.py',
                                           'scripts/inventory-current-target.py', 'scripts/inventory-executable.py', 'scripts/coverage_common.py')],
               'inputs': [{'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)}
                          for path in (summary_path, jump_path, inventory, body_path, diagnostic_path)] + rejection_inputs,
               'counts': {'custom_reference_sites': len(custom_sites),
                          'custom_sites_with_current_body_owner': sum(owner(site) is not None for site in custom_sites),
                          'unowned_custom_sites': sum(owner(site) is None for site in custom_sites),
                          'unowned_custom_declared_extents': len(records),
                          'unbound_custom_references': len(unbound),
                          'distinct_computed_frontiers': sum(len(record['computed_frontiers']) for record in records),
                          'potentially_reached_unowned_sites': sum(len(record['potentially_reached_unowned_sites']) for record in records)},
               'adjacent_literal_roles': literal_roles,
               'frontier_recovery_reasons': dict(reasons), 'records': records, 'unbound_references': unbound,
               'gap_ids': [41], 'native_source_semantics_complete': False, 'parity_verified': False,
               'limits': ['Declared extents establish selection and independent instruction boundaries only; no missing body owner is invented.',
                          'The potential path walk assumes calls can return and does not validate values, branch feasibility, runtime aliases or missing enum/type invariants.',
                          'Local switch proposals require their own complete whole-domain boundary validation and Ghidra replay before admission.',
                          'No compilation, target execution or gameplay comparison.']}
    output = project_path(args.output)
    output.write_text(json_text(payload))
    if args.summary_output:
        compact = {key: value for key, value in payload.items() if key != 'records'}
        compact['raw_diagnostic_reference_inventory_preserved'] = True
        compact['source_role_exclusions_applied'] = False
        compact['full_inventory'] = {'path': output.relative_to(ROOT).as_posix(), 'sha256': file_sha256(output)}
        compact['records'] = []
        for record in records:
            current = dict(record)
            current['computed_frontiers'] = []
            for frontier in record['computed_frontiers']:
                item = {key: value for key, value in frontier.items() if key not in ('new_table', 'whole_domain_rejection')}
                table = frontier.get('new_table')
                if table:
                    item['unadmitted_proposal'] = {key: table[key] for key in ('site', 'selector_minimum', 'selector_maximum', 'table_address', 'byte_count', 'sha256')}
                rejected = frontier.get('whole_domain_rejection')
                if rejected:
                    item['whole_domain_rejection'] = {key: rejected[key] for key in ('site', 'reason', 'candidate_rejection_reason', 'selector_minimum', 'selector_maximum', 'table_address', 'byte_count', 'sha256') if key in rejected}
                    validation = rejected.get('validation', rejected.get('whole_domain_instruction_boundaries', {}))
                    exceptions = validation.get('exceptions', [])
                    item['whole_domain_rejection']['boundary_exception_counts'] = dict(Counter(row['reason'] for row in exceptions))
                    item['whole_domain_rejection']['boundary_exception_examples'] = exceptions[:5]
                current['computed_frontiers'].append(item)
            compact['records'].append(current)
        project_path(args.summary_output).write_text(json_text(compact))
    print(json_text({key: payload[key] for key in ('counts', 'frontier_recovery_reasons')}))


if __name__ == '__main__':
    main()
