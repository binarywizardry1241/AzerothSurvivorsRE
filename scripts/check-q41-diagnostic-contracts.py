#!/usr/bin/env python3
"""Check Q41-D01's expanded sites and previously unresolved pointer graphs.

This is operand/interface classification, not source or gameplay equivalence.
All native instructions come from the installed, hash-verified reference input.
"""
from runtime_layout import retained_runtime_path
from portable_paths import portable_json, portable_record
import argparse
from collections import Counter
import csv
import gzip
import hashlib
import importlib.util
import json
import struct

from coverage_common import ROOT, file_sha256, latest_target, load_json, target_bytes


def require(value, message):
    if not value:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def digest(value):
    return hashlib.sha256(value).hexdigest()


def main():
    import capstone
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--proof', default='docs/analysis/evidence/q41-diagnostic-contracts.json')
    args = parser.parse_args()
    target = latest_target(verify=True)
    require(target['sha256'] == '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c', 'Wrong target')
    identity = {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    pe = module('q41_diag_pe', 'scripts/inventory-executable.py').PE(target_bytes(target))
    model = module('q41_diag_model', 'scripts/check-owned-custom-diagnostics.py')
    owner = module('q41_diag_registers', 'scripts/classify-native-ownership.py')
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    inputs = []

    def consume(path, expected=None):
        require(expected is None or file_sha256(ROOT / path) == expected, 'Changed input: ' + path)
        inputs.append(dict(path=path, sha256=file_sha256(ROOT / path)))
        return ROOT / path

    def raw(address, size):
        off = pe.rva_offset(address - pe.image_base)
        if size:
            require(pe.rva_offset(address + size - 1 - pe.image_base) - off == size - 1, 'Noncontiguous mapped bytes')
        return pe.data[off:off + size]

    canonical = load_json(consume('docs/analysis/evidence/native-diagnostics/q41-custom-diagnostics.json'))
    owned = load_json(consume('docs/analysis/evidence/native-diagnostics/owned-custom-diagnostics.json'))
    projection = load_json(consume('docs/analysis/evidence/execheck-diagnostic-sites.json'))
    require(all(p['target'] == identity for p in (canonical, owned, projection)), 'Proof target mismatch')
    expanded = projection['profiles']['expanded_all_seeds']
    source = expanded['artifacts']['jsonl']
    consume(source['path'], source['sha256'])
    selected = [json.loads(line) for line in (retained_runtime_path(ROOT / source['path'], ROOT)).read_text().splitlines()]
    selected = [r for r in selected if r['actual_native_owner'] is None and r['custom_game_crate']]
    require(len(selected) == 60 and len({r['path'] for r in selected}) == 14, 'Expanded selection differs')
    prior = {r['site']: r for r in canonical['sites']}
    helpers = {r['entry']: r for r in canonical['helpers']}
    expanded_rows = []
    for row in selected:
        site = row['site']
        require(site in prior, 'Expanded site needs new interface recovery: ' + site)
        contract = prior[site]
        reference = row['original_reference']
        require(contract['path'] == row['path'] and contract['diagnostic_target'] == reference['target_address'] and
                contract['reference_kind'] == row['reference_kind'], 'Changed diagnostic input')
        a, b = map(lambda x: int(x, 16), contract['declared_extent'])
        require(reference['owner_sha256'] == digest(raw(a, b - a)), 'Changed diagnostic extent')
        flow = [next(decoder.disasm(raw(int(s, 16), 15), int(s, 16), count=1)) for s in contract['flow_sites']]
        require(flow[0].bytes.hex() == row['instruction_bytes'] == row['exported_instruction_bytes_at_site'], 'Changed exported site')
        require(digest(b''.join(bytes(i.bytes) for i in flow)) == contract['flow_bytes_sha256'], 'Changed diagnostic flow')
        require(all(i.address + i.size == j.address or
                    (i.group(capstone.CS_GRP_JUMP) and i.operands[0].type == capstone.x86_const.X86_OP_IMM and i.operands[0].imm == j.address)
                    for i, j in zip(flow, flow[1:])), 'Invalid immediate flow edge')
        require(flow[-1].mnemonic == 'call' and flow[-1].operands[0].type == capstone.x86_const.X86_OP_IMM and
                hex(flow[-1].operands[0].imm) == contract['callee'], 'Changed diagnostic consumer')
        helper = helpers[contract['callee']]
        h0, h1 = int(helper['entry'], 16), int(helper['end_exclusive'], 16)
        require(digest(raw(h0, h1-h0)) == helper['sha256'], 'Changed canonical interface')
        if row['reference_kind'] == 'rust_location':
            pointer, size, line, column = struct.unpack('<QQII', raw(int(reference['target_address'], 16), 24))
            require(raw(pointer, size).decode() == row['path'].replace('/', '\\') and
                    (line, column) == (contract['source_line'], contract['source_column']), 'Changed Location data')
        expanded_rows.append(dict(site=site, path=row['path'], role=contract['role'], callee=contract['callee'],
                                  declared_extent_sha256=reference['owner_sha256'], flow_bytes_sha256=contract['flow_bytes_sha256']))

    artifact = owned['artifacts']['owned_AS']
    consume(artifact['path'], artifact['sha256'])
    with gzip.open(ROOT / artifact['path'], 'rt') as stream:
        rows = [json.loads(line) for line in stream]
    selected = [r for r in rows if any(p['boundary'] in ('local_cycle', 'return') for p in r['first_interface_paths'])]
    require(len(selected) == 31, 'Canonical unresolved selector differs')
    interfaces = {int(r['entry'], 16): r for r in owned['supporting_interfaces']}
    used_helpers = {}
    results = []
    require(model.pointer_model_checks(decoder, owner.canonical_register, capstone)['synthetic_pointer_model_cases'] == 5, 'Pointer transfer regression checks differ')
    for row in selected:
        start, end = map(lambda x: int(x, 16), row['declared_extent'])
        require(digest(raw(start, end-start)) == row['declared_extent_sha256'], 'Changed selected owner')
        code = {i.address: i for i in decoder.disasm(raw(start, end-start), start)}
        require(sum(i.size for i in code.values()) == end-start, 'Owner decode incomplete')
        first = code[int(row['site'], 16)]
        require(first.mnemonic == 'lea' and first.operands[1].type == capstone.x86_const.X86_OP_MEM and
                first.operands[1].mem.base == capstone.x86_const.X86_REG_RIP and
                first.address + first.size + first.operands[1].mem.disp == int(row['data_contract']['target'], 16), 'Changed selected pointer origin')
        pending = [(first.address + first.size, [first], {})]
        seen, exits, repeated, instructions = set(), {}, set(), {}
        while pending:
            address, flow, continued = pending.pop()
            require(address in code, 'Unresolved outside-extent successor: ' + hex(address))
            current = code[address]
            state = model.pointer_projection(flow + [current], owner.canonical_register, capstone, continued)
            key = (address, tuple(state['retained_registers']), tuple((x['base'], x['displacement']) for x in state['live_local_pointer_locations']))
            if key in seen:
                repeated.add(hex(address))
                continue
            seen.add(key)
            require(len(seen) <= 4096, 'Pointer graph bound reached')
            instructions[address] = current.bytes.hex()
            require(not state['opaque_pointer_use'] and not state['unresolved_memory_alias'] and
                    not state['live_local_pointer_locations'], 'Unresolved alias or pointer use')
            if current.group(capstone.CS_GRP_CALL):
                require(current.operands[0].type == capstone.x86_const.X86_OP_IMM, 'Computed consumer remains unresolved')
                callee = current.operands[0].imm
                require(callee in interfaces, 'Unknown supporting interface: ' + hex(callee))
                helper = interfaces[callee]
                a = int(helper['entry'], 16)
                b = int(helper['end_exclusive'], 16) if helper['end_exclusive'] else a + helper['byte_count']
                require(digest(raw(a, b-a)) == helper['sha256'], 'Supporting interface changed')
                used_helpers[hex(callee)] = dict(sha256=helper['sha256'], meaningful_input_arguments=helper['meaningful_input_arguments'], role=helper['role'])
                supplied = set(state['exact_argument_carriers'])
                require(not supplied.intersection(helper['meaningful_input_arguments']), 'Selected operand reaches meaningful interface input')
                preserved = set(state['retained_registers']) - model.VOLATILE_GPRS
                if preserved:
                    require(helper.get('returns_normally', True), 'Nonreturning helper cannot preserve a continuing path')
                    following_calls = dict(continued)
                    following_calls[address] = True
                    pending.append((address + current.size, flow + [current], following_calls))
                    continue
                exits[(address, 'nonconsuming_call')] = dict(site=hex(address), kind='nonconsuming_call', callee=hex(callee),
                    retained_registers=state['retained_registers'], supplied_arguments=sorted(supplied),
                    contract='Selected pointer is absent from meaningful inputs; only volatile copies remain.')
                continue
            if current.group(capstone.CS_GRP_RET):
                # This is deliberately a register-level result. Concrete Rust
                # ABI/output types are not inferred from volatile residue.
                require('rax' not in state['retained_registers'] and set(state['retained_registers']).issubset(model.VOLATILE_GPRS), 'Selected pointer may escape through return')
                exits[(address, 'return_residue')] = dict(site=hex(address), kind='return_residue', retained_registers=state['retained_registers'],
                    contract='No exact pointer store or RAX return; residue exists only in volatile non-RAX registers. Concrete output ABI is not certified.')
                continue
            if current.group(capstone.CS_GRP_JUMP):
                require(current.operands[0].type == capstone.x86_const.X86_OP_IMM, 'Computed successor remains unresolved')
                next_addresses = [current.operands[0].imm]
                if current.mnemonic != 'jmp':
                    next_addresses.append(address + current.size)
            else:
                require(current.mnemonic not in ('ud2', 'int3', 'hlt'), 'Trap before classified interface')
                after = model.pointer_projection(flow + [current, current], owner.canonical_register, capstone, continued)
                require(not after['opaque_pointer_use'] and not after['unresolved_memory_alias'] and
                        not after['live_local_pointer_locations'], 'Unresolved pointer transfer')
                if not after['retained_registers']:
                    exits[(address, 'overwritten')] = dict(site=hex(address), kind='overwritten')
                    continue
                next_addresses = [address + current.size]
            pending.extend((a, flow + [current], continued) for a in next_addresses)
        results.append(dict(site=row['site'], path=row['path'], owner=row['actual_body_owner'],
                            declared_extent=row['declared_extent'], declared_extent_sha256=row['declared_extent_sha256'],
                            graph_states=len(seen), revisited_addresses=sorted(repeated),
                            graph_instruction_commitment=digest(json.dumps(sorted(instructions.items()), separators=(',', ':')).encode()),
                            exits=sorted(exits.values(), key=lambda r: (r['site'], r['kind'])),
                            successful_AS_semantics_complete=False, output_ABI_certified=False))
    census = load_json(consume('docs/analysis/coverage/full-image-census.json'))
    reference_path = census['artifacts']['directory'] + '/references.tsv.gz'
    consume(reference_path, census['artifacts']['files']['references.tsv.gz']['sha256'])
    owners = {r['owner'][2:] for r in results}
    with gzip.open(ROOT / reference_path, 'rt') as stream:
        outer = [r for r in csv.DictReader(stream, delimiter='\t') if r['to'] in owners]
    require(Counter(r['type'] for r in outer) == Counter(UNCONDITIONAL_CALL=24, DATA=12), 'Outer reference selector differs')
    outer_results = []
    for reference in outer:
        address, destination = int(reference['from'], 16), int(reference['to'], 16)
        if reference['type'] == 'DATA':
            section = next(s for s in pe.sections if pe.image_base+s['rva'] <= address < pe.image_base+s['rva']+s['virtual_size'])
            require(section['name'] == '.pdata' and struct.unpack('<I', raw(address, 4))[0] == destination-pe.image_base,
                    'Unclassified non-call owner reference')
            outer_results.append(dict(site=hex(address), target=hex(destination), role='PE_runtime_function_start_metadata', bytes=raw(address, 4).hex()))
            continue
        call = next(decoder.disasm(raw(address, 15), address, count=1))
        require(call.mnemonic == 'call' and call.operands[0].type == capstone.x86_const.X86_OP_IMM and call.operands[0].imm == destination,
                'Changed outer direct call')
        cursor, continuation = address + call.size, []
        # Check all possible volatile residues observed at any selected return,
        # including registers not present on this particular callee's returns.
        residues = {'rdx', 'r8', 'r10', 'r11'}
        while True:
            current = next(decoder.disasm(raw(cursor, 15), cursor, count=1))
            require(len(continuation) < 64, 'Outer continuation bound reached')
            continuation.append(current)
            reads, writes = current.regs_access()
            require(not residues.intersection(owner.canonical_register(current.reg_name(r)) for r in reads),
                    'Direct caller consumes a selected volatile residue')
            residues.difference_update(owner.canonical_register(current.reg_name(r)) for r in writes)
            if current.group(capstone.CS_GRP_RET):
                break
            if current.group(capstone.CS_GRP_JUMP):
                require(current.mnemonic == 'jmp' and current.operands[0].type == capstone.x86_const.X86_OP_IMM,
                        'Outer callback continuation needs further branch recovery')
                cursor = current.operands[0].imm
            else:
                require(not current.group(capstone.CS_GRP_CALL), 'Outer continuation reaches a new interface')
                cursor += current.size
        outer_results.append(dict(site=hex(address), target=hex(destination), role='direct_caller_ignores_volatile_residue',
                                  continuation_instruction_count=len(continuation), return_site=hex(continuation[-1].address),
                                  flow_address_bytes_sha256=digest(b''.join(struct.pack('<Q', i.address)+bytes(i.bytes) for i in continuation)),
                                  concrete_callback_ABI_certified=False))
    native_root = ROOT / 'runtime/analysis/history/findings/q41-diagnostics/1e0c7e1c9978/cards'
    native_receipt = json.loads(consume('runtime/analysis/history/findings/q41-diagnostics/1e0c7e1c9978/cards/input-receipt.json').read_text())
    require(native_receipt['target'] == identity and native_receipt['start'] == '0x140054020' and
            native_receipt['end_exclusive'] == '0x1400551d0' and native_receipt['sha256'] == digest(raw(0x140054020, 0x11b0)), 'Changed Ghidra input receipt')
    native_result_paths = list((native_root / 'rea/results').glob('*.json'))
    require(len(native_result_paths) == 1, 'Ambiguous retained native query result')
    native_result_path = native_result_paths[0]
    native_result = json.loads(json.loads(consume(native_result_path.relative_to(ROOT).as_posix()).read_text())['content'][0]['text'])
    require(native_result['provider']['id'] == 'ghidra' and native_result['subject']['digest']['sha256'] == native_receipt['sha256'], 'Changed Ghidra result input/provider')
    require(native_result['operation'] == 'procedure_pseudo_code' and native_result['parameters'] == {'procedure': '0x140054020'}, 'Wrong retained native query')
    require('void entry(' in native_result['normalized_result'], 'Cards decompiler output signature changed')
    native_query = dict(evidence_id=native_result['evidence_id'], provider='ghidra', function='0x140054020',
                        source_range_sha256=native_receipt['sha256'], inferred_return='void',
                        limitations='Raw-function Ghidra inference corroborates the state-mutator role; it is not original types, callback ABI closure or whole-game proof.')
    result = dict(schema_version=1, target=identity, lead='Q41-D01', gap_ids=[41],
                  generator=dict(path='scripts/check-q41-diagnostic-contracts.py', sha256=file_sha256(ROOT/'scripts/check-q41-diagnostic-contracts.py'), capstone_version=capstone.__version__),
                  dependencies=[dict(path=p, sha256=file_sha256(ROOT/p)) for p in ('scripts/coverage_common.py', 'scripts/inventory-executable.py', 'scripts/check-owned-custom-diagnostics.py', 'scripts/classify-native-ownership.py')],
                  inputs=inputs, ghidra_query=native_query, pointer_model_regression_cases=5,
                  expanded_counts=dict(sites=len(expanded_rows), paths=14, roles=dict(sorted(Counter(r['role'] for r in expanded_rows).items()))),
                  expanded_sites=expanded_rows, canonical_graph_counts=dict(sites=31, owners=len({r['owner'] for r in results}), states=sum(r['graph_states'] for r in results),
                  exits=dict(sorted(Counter(e['kind'] for r in results for e in r['exits']).items()))),
                  supporting_interfaces=used_helpers, canonical_graphs=results,
                  outer_references=outer_results,
                  native_semantics_complete=False, source_implementation_added=False, parity_verified=False,
                  limits=['All expanded immediate consumers reuse byte-verified canonical roles; no body ownership is forced.',
                          'Repeated pointer states close only the operand-flow graph; they do not establish loop termination, valid collection state or executed branches.',
                          'Volatile non-RAX return residue is retained explicitly; concrete Rust output ABI and complete successful AS state remain unproved.',
                          'No source change, compilation, game/application/network execution or original/rebuilt comparison.'])
    path = ROOT / args.proof
    if args.write:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(portable_json(result, indent=2) + '\n')
    else:
        require(portable_record(json.loads(path.read_text())) == portable_record(result), 'Retained diagnostic contract proof differs')
    print(json.dumps(dict(expanded=result['expanded_counts'], canonical=result['canonical_graph_counts'], outer_references=len(outer_results), checked=True), sort_keys=True))


if __name__ == '__main__':
    main()
