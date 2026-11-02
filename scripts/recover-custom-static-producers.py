#!/usr/bin/env python3
"""Recover custom dispatch domains loaded from bounded immutable descriptors.

This supplements current switch proof with a proved descriptor-index guard,
stride, field load and exact immutable bytes. It never guesses an enum count.
"""
import argparse
from collections import Counter
import hashlib
import struct

from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path
from importlib.util import spec_from_file_location, module_from_spec


def module(name, path):
    spec = spec_from_file_location(name, ROOT / path)
    result = module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def descriptor_domain(instructions, pe, capstone, classifier, recovery):
    x = capstone.x86_const
    if len(instructions) < 8:
        return None
    field, table_base, load, addition, jump = instructions[-5:]
    canon = lambda instruction, register: classifier.canonical_register(instruction.reg_name(register))
    if jump.mnemonic != 'jmp' or len(jump.operands) != 1 or jump.operands[0].type != x.X86_OP_REG or jump.operands[0].size != 8:
        return None
    destination = canon(jump, jump.operands[0].reg)
    if addition.mnemonic != 'add' or len(addition.operands) != 2 or any(operand.type != x.X86_OP_REG or operand.size != 8 for operand in addition.operands) or canon(addition, addition.operands[0].reg) != destination:
        return None
    if load.mnemonic != 'movsxd' or len(load.operands) != 2 or load.operands[0].type != x.X86_OP_REG or load.operands[0].size != 8 or canon(load, load.operands[0].reg) != destination or load.operands[1].type != x.X86_OP_MEM or load.operands[1].size != 4:
        return None
    dispatch_memory = load.operands[1].mem
    base_register = canon(addition, addition.operands[1].reg)
    if base_register == destination:
        return None
    if dispatch_memory.segment or load.addr_size != 8 or not dispatch_memory.index or not dispatch_memory.base or dispatch_memory.scale != 4 or canon(load, dispatch_memory.base) != base_register:
        return None
    selector = canon(load, dispatch_memory.index)
    if table_base.mnemonic != 'lea' or len(table_base.operands) != 2 or table_base.operands[0].type != x.X86_OP_REG or table_base.operands[0].size != 8 or canon(table_base, table_base.operands[0].reg) != base_register or table_base.operands[1].type != x.X86_OP_MEM or table_base.operands[1].mem.base != x.X86_REG_RIP or table_base.operands[1].mem.index or table_base.operands[1].mem.segment or table_base.addr_size != 8 or base_register == selector:
        return None
    if field.mnemonic != 'mov' or len(field.operands) != 2 or field.operands[0].type != x.X86_OP_REG or field.operands[0].size != 8 or canon(field, field.operands[0].reg) != selector or field.operands[1].type != x.X86_OP_MEM or field.operands[1].size != 8 or field.addr_size != 8:
        return None
    memory = field.operands[1].mem
    if memory.segment or not memory.base or not memory.index or memory.scale != 1:
        return None
    prefix = instructions[:-5]
    state = classifier.local_values(prefix, lambda slot: None, capstone)
    registers = [canon(field, memory.base), canon(field, memory.index)]
    static = [(register, state[register][1]) for register in registers if state.get(register, (None,))[0] == 'value']
    if len(static) != 1:
        return None
    static_register, descriptor_base = static[0]
    offset_register = next(register for register in registers if register != static_register)
    producer_index = None
    for index in range(len(prefix) - 1, -1, -1):
        if offset_register in {canon(prefix[index], register) for register in prefix[index].regs_access()[1]}:
            producer_index = index
            break
    if producer_index is None:
        return None
    multiply = prefix[producer_index]
    if multiply.mnemonic != 'imul' or len(multiply.operands) != 3 or multiply.operands[0].type != x.X86_OP_REG or multiply.operands[0].size != 8 or multiply.operands[1].type != x.X86_OP_REG or multiply.operands[1].size != 8 or multiply.operands[2].type != x.X86_OP_IMM:
        return None
    stride = multiply.operands[2].imm
    index_register = canon(multiply, multiply.operands[1].reg)
    guards = recovery.ALIASES.guard_bounds(prefix[:producer_index], index_register, jump.address, capstone, classifier)
    if not guards:
        return None
    guard = min(guards, key=lambda value: value['maximum'])
    maximum = guard['maximum']
    if maximum > 65535 or stride <= 0 or memory.disp < 0 or memory.disp + 8 > stride or maximum * stride + memory.disp + 8 >= (1 << 63):
        return None
    span = instructions[guard['index']:]
    if any(first.address + first.size != second.address for first, second in zip(span, span[1:])):
        return None
    # Keep only one guarded fallthrough path: no transfer after the guard and
    # before the final computed jump can bypass the indexed field producer.
    if any(any(instruction.group(group) for group in (capstone.CS_GRP_CALL, capstone.CS_GRP_JUMP, capstone.CS_GRP_RET, capstone.CS_GRP_INT, capstone.CS_GRP_IRET))
           for instruction in instructions[guard['branch_index'] + 1:-1]):
        return None
    first_address = descriptor_base + memory.disp
    byte_count = maximum * stride + 8
    section = next((section for section in pe.sections if pe.image_base + section['rva'] <= first_address and first_address + byte_count <= pe.image_base + section['rva'] + section['raw_size']), None)
    if section is None or int(section['characteristics'], 16) & 0x80000000:
        return None
    offset = pe.rva_offset(first_address - pe.image_base)
    if pe.rva_offset(first_address + byte_count - pe.image_base - 1) != offset + byte_count - 1:
        return None
    raw = pe.data[offset:offset + byte_count]
    values = [struct.unpack_from('<Q', raw, index * stride)[0] for index in range(maximum + 1)]
    lower, upper = min(values), max(values)
    if upper > 1048576:
        return None
    relative_base = table_base.address + table_base.size + table_base.operands[1].mem.disp
    table_address = relative_base + dispatch_memory.disp + 4 * lower
    table_size = (upper - lower + 1) * 4
    table_section = next((section for section in pe.sections if pe.image_base + section['rva'] <= table_address and table_address + table_size <= pe.image_base + section['rva'] + section['raw_size']), None)
    if table_section is None or int(table_section['characteristics'], 16) & 0x80000000:
        return None
    table_offset = pe.rva_offset(table_address - pe.image_base)
    table_raw = pe.data[table_offset:table_offset + table_size]
    targets = [relative_base + value[0] for value in struct.iter_unpack('<i', table_raw)]
    if not all(any(pe.image_base + section['rva'] <= target < pe.image_base + section['rva'] + section['virtual_size'] and int(section['characteristics'], 16) & 0x20000000 for section in pe.sections) for target in targets):
        return None
    return {'site': hex(jump.address), 'guard': hex(guard['instruction'].address), 'guard_kind': 'immutable-descriptor-domain',
            'guard_bound': maximum, 'selector_register': selector, 'selector_minimum': lower, 'selector_maximum': upper,
            'selector_alias_proof': None, 'table_address': hex(table_address), 'relative_base': hex(relative_base),
            'file_offset': hex(table_offset), 'byte_count': table_size, 'sha256': hashlib.sha256(table_raw).hexdigest(),
            'case_targets': [hex(value) for value in targets], 'unique_targets': len(set(targets)),
            'producer_proof': {'descriptor_field_address': hex(first_address), 'stride': stride, 'field_offset': memory.disp,
                               'row_count': maximum + 1, 'byte_count': byte_count, 'sha256': hashlib.sha256(raw).hexdigest(),
                               'values': values, 'instructions': [{'site': hex(instruction.address), 'instruction_bytes': instruction.bytes.hex()} for instruction in span]},
            'guarded_fallthrough_cases_complete': True, 'all_possible_incoming_contexts_or_type_invariants_complete': False}


def combined_code_leads(diagnostics, tables, pe, decoder, capstone):
    """Keep true diagnostic references and independently decoded JMPs distinct."""
    if diagnostics.get('function_entry_or_incoming_flow_edges_inferred') is not False:
        raise ValueError('Code-only inputs must not infer entries or incoming flow')
    records = {row['site']: dict(row, evidence_role='custom-diagnostic-reference')
               for row in diagnostics['code_only_seeds']}
    for table in tables:
        site = int(table['site'], 16)
        offset = pe.rva_offset(site - pe.image_base)
        instructions = list(decoder.disasm(pe.data[offset:offset + 15], site, count=1))
        if len(instructions) != 1 or instructions[0].mnemonic != 'jmp' or not instructions[0].operands or instructions[0].operands[0].type == capstone.x86_const.X86_OP_IMM:
            raise ValueError('Bounded switch source is not an independently decoded computed JMP')
        instruction = instructions[0]
        if not any(pe.image_base + section['rva'] <= site and site + instruction.size <= pe.image_base + section['rva'] + section['raw_size'] and int(section['characteristics'], 16) & 0x20000000 for section in pe.sections):
            raise ValueError('Bounded switch source leaves executable file-backed bytes')
        record = {'site': table['site'], 'instruction_bytes': instruction.bytes.hex(),
                  'classification': 'independently-decoded-bounded-switch-source',
                  'evidence_role': 'independently-decoded-bounded-switch-source',
                  'function_entry_or_incoming_edge_inferred': False}
        if table['site'] in records and records[table['site']]['instruction_bytes'] != record['instruction_bytes']:
            raise ValueError('Code-only seed byte commitments conflict')
        records.setdefault(table['site'], record)
    ordered = [records[site] for site in sorted(records, key=lambda value: int(value, 16))]
    return {'target': diagnostics['target'], 'code_only_seeds': ordered,
            'function_entry_or_incoming_flow_edges_inferred': False,
            'counts_by_evidence_role': dict(Counter(row['evidence_role'] for row in ordered)),
            'legacy_census_metric': 'additional_diagnostic_code_starts counts both explicitly distinguished code-only evidence roles; JMP sources are not diagnostic-reference sites.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--jump-summary', required=True)
    parser.add_argument('--selection', required=True)
    parser.add_argument('--diagnostic-leads', required=True, help='Original exact custom diagnostic code-only starts')
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    import capstone
    target = latest_target(verify=True)
    jump_path = project_path(args.jump_summary)
    jump = load_json(jump_path)
    inventory_path = project_path(jump['inventory']['path'])
    if file_sha256(inventory_path) != jump['inventory']['sha256'] or jump['target']['sha256'] != target['sha256']:
        raise ValueError('Current base jump proof required')
    payload = load_json(inventory_path)
    selection_path = project_path(args.selection)
    selection = load_json(selection_path)
    if selection['target']['sha256'] != target['sha256']:
        raise ValueError('Current custom extent selection required')
    for parent in selection['selection']['inputs']:
        if file_sha256(project_path(parent['path'])) != parent['sha256']:
            raise ValueError('Custom selection parent commitment differs')
    generation_digest = file_sha256(ROOT / 'scripts/recover-custom-static-producers.py')
    diagnostic_lead_path = project_path(args.diagnostic_leads)
    diagnostic_leads = load_json(diagnostic_lead_path)
    if diagnostic_leads['target']['sha256'] != target['sha256']:
        raise ValueError('Code-only diagnostic input target differs')
    dependencies = [{'path': path, 'sha256': file_sha256(ROOT / path)} for path in
                    ('scripts/classify-native-ownership.py', 'scripts/native_scalar_aliases.py', 'scripts/recover-native-jump-tables.py',
                     'scripts/summarize-native-image.py', 'scripts/inventory-current-target.py', 'scripts/inventory-executable.py', 'scripts/coverage_common.py')]
    census_path = project_path(payload['census_summary'])
    if file_sha256(census_path) != payload['census_summary_sha256']:
        raise ValueError('Source census commitment differs')
    census = load_json(census_path)
    if census['target']['sha256'] != target['sha256'] or not census['independent_instructions'].get('exact_source_bytes_verified'):
        raise ValueError('Current independently verified source census required')
    instruction_path = project_path(census['artifacts']['directory']) / 'instructions.tsv.gz'
    if file_sha256(instruction_path) != census['artifacts']['files']['instructions.tsv.gz']['sha256']:
        raise ValueError('Source instruction artifact differs')
    classifier = module('static_producer_values', 'scripts/classify-native-ownership.py')
    recovery = module('static_producer_tables', 'scripts/recover-native-jump-tables.py')
    helpers = module('static_producer_census', 'scripts/summarize-native-image.py')
    pe = module('static_producer_pe', 'scripts/inventory-current-target.py').pe_parser(target_bytes(target))
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    declared = {(pe.image_base + start, pe.image_base + end) for start, end, _ in pe.functions()}
    spans = {(int(row['declared_start'], 16), int(row['declared_end_exclusive'], 16)) for row in selection['references']}
    if not spans <= declared:
        raise ValueError('Custom selected extents differ')
    tables = list(payload['tables'])
    sites = {table['site'] for table in tables}
    additions = []
    for first, last in sorted(spans):
        offset = pe.rva_offset(first - pe.image_base)
        raw = pe.data[offset:offset + last - first]
        decoded = list(decoder.disasm(raw, first))
        if sum(instruction.size for instruction in decoded) != len(raw):
            raise ValueError('Custom source extent has incomplete independent boundaries')
        for index, instruction in enumerate(decoded):
            if instruction.mnemonic != 'jmp' or hex(instruction.address) in sites:
                continue
            table = descriptor_domain(decoded[:index + 1], pe, capstone, classifier, recovery)
            if table is None:
                continue
            boundaries = {instruction.address for instruction in decoded}
            if not all(int(value, 16) in boundaries for value in table['case_targets']):
                raise ValueError('Static producer successor leaves independently decoded custom extent')
            observed_starts, observed_lengths = [], []
            for row in helpers.rows(instruction_path):
                address = int(row['address'], 16)
                if address >= last:
                    break
                if address >= first:
                    observed_starts.append(address)
                    observed_lengths.append(int(row['length']))
            validation = recovery.validate_scalar_targets(dict(table, case_targets=table['case_targets'] + [table['site']]), observed_starts, observed_lengths, lambda address: address in boundaries)
            if validation['exceptions']:
                raise ValueError('Static producer whole-domain/source boundary conflicts with current census')
            table['whole_domain_instruction_boundaries'] = dict(validation, complete_same_declared_extent=True, source_extent_sha256=hashlib.sha256(raw).hexdigest())
            tables.append(table)
            additions.append(table['site'])
    output = project_path(args.output)
    output.mkdir(parents=True, exist_ok=False)
    payload = dict(payload, tables=tables,
                   generator={'path': 'scripts/recover-custom-static-producers.py', 'sha256': generation_digest, 'capstone_version': capstone.__version__},
                   generator_dependencies=dependencies,
                   static_producer_parent={'path': args.jump_summary, 'sha256': file_sha256(jump_path)},
                   immutable_descriptor_additions=additions)
    payload['counts'] = dict(payload['counts'], **{'admitted-tables': len(tables), 'immutable-descriptor-tables': len(additions)})
    inventory = output / 'guarded-jump-tables.json'
    inventory.write_text(json_text(payload))
    code_leads = combined_code_leads(diagnostic_leads, tables, pe, decoder, capstone)
    code_leads['generator'] = payload['generator']
    code_leads['inputs'] = [{'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)} for path in (diagnostic_lead_path, inventory)]
    code_path = output / 'combined-code-leads.json'
    code_path.write_text(json_text(code_leads))
    compact = {key: value for key, value in payload.items() if key not in ('tables', 'candidate_tables')}
    compact.update(inventory={'path': inventory.relative_to(ROOT).as_posix(), 'sha256': file_sha256(inventory)},
                   case_entries=sum(len(table['case_targets']) for table in tables),
                   unique_target_addresses=len({value for table in tables for value in table['case_targets']}),
                   edge_digest=helpers.flow_edge_digest((int(table['site'], 16), int(value, 16)) for table in tables for value in table['case_targets']),
                   gap_ids=[41], parity_verified=False)
    compact['code_only_input'] = {'path': code_path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(code_path), 'counts_by_evidence_role': code_leads['counts_by_evidence_role']}
    (output / 'guarded-jump-tables-summary.json').write_text(json_text(compact))
    if file_sha256(ROOT / 'scripts/recover-custom-static-producers.py') != generation_digest or any(file_sha256(ROOT / dependency['path']) != dependency['sha256'] for dependency in dependencies):
        raise ValueError('Static producer generator changed during analysis')
    print(json_text({'tables': len(tables), 'immutable_descriptor_additions': additions, 'case_entries': compact['case_entries']}))


if __name__ == '__main__':
    main()
