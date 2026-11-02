#!/usr/bin/env python3
"""Classify every exact F01/F02 operand without inventing computed callees.

The independent unwind and complement inventories include sites absent from
the saved Ghidra Program. Decode their already verified bytes, preserve that
absence, and distinguish fixed image slots from dynamic address expressions.
No incoming register state, alias, runtime dispatch or function is inferred.
"""
import argparse
from collections import Counter
from contextlib import closing
import gzip
import importlib.util
import json
from pathlib import Path
import sqlite3

from coverage_common import ROOT, latest_target, target_bytes, project_path, file_sha256, load_json, json_text
from derived_gzip import derived_gzip_text
from shared_native_inventory import open_readonly_uri as open_native_inventory

GENERATOR = 'scripts/classify-independent-indirects.py'
GENERATOR_SHA256 = file_sha256(ROOT / GENERATOR)
DEPENDENCIES = ('scripts/coverage_common.py', 'scripts/derived_gzip.py',
                'scripts/summarize-native-image.py', 'scripts/inventory-current-target.py',
                'scripts/inventory-executable.py')
KINDS = ('call_indirect', 'jump_indirect')


def require(condition, message):
    if not condition:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def selected_rows(path, lead):
    """Yield each exact owning-inventory row, without caps or extent merging."""
    with closing(open_native_inventory(project_path(path).as_uri() + '?mode=ro', uri=True)) as connection:
        if lead == 'Q41-F01':
            sql = "SELECT site,kind,bytes,operand,access,extent FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand"
        else:
            sql = "SELECT r.site,r.kind,i.bytes,r.operand,r.access,NULL FROM refs r LEFT JOIN instructions i ON i.site=r.site WHERE r.kind IN ('call_indirect','jump_indirect') ORDER BY r.site,r.kind,r.operand"
        for site, kind, raw, operand, access, extent in connection.execute(sql):
            yield dict(site=hex(site), kind=kind, instruction_bytes=raw,
                       operand=operand, access=access, extent_ordinal=extent)


def operand_state(instruction, capstone):
    """Only encoded address components; a slot is never a resolved callee."""
    require(len(instruction.operands) == 1, 'Unexpected computed-transfer operand count')
    operand = instruction.operands[0]
    x86 = capstone.x86_const
    state = dict(width_bytes=operand.size)
    if operand.type == x86.X86_OP_REG:
        return dict(state, operand_class='register', register=instruction.reg_name(operand.reg))
    if operand.type != x86.X86_OP_MEM:
        raise ValueError('Selected transfer is not an indirect register/memory operand')
    memory = operand.mem
    state.update(segment=instruction.reg_name(memory.segment) or None,
                 base=instruction.reg_name(memory.base) or None,
                 index=instruction.reg_name(memory.index) or None,
                 scale=memory.scale, displacement=memory.disp,
                 address_size_bytes=instruction.addr_size)
    if memory.segment:
        return dict(state, operand_class='segment-relative-memory')
    if memory.index:
        return dict(state, operand_class='indexed-memory')
    mask = (1 << (instruction.addr_size * 8)) - 1
    if memory.base in (x86.X86_REG_RIP, x86.X86_REG_EIP):
        return dict(state, operand_class='fixed-relative-memory',
                    slot=hex((instruction.address + instruction.size + memory.disp) & mask))
    if memory.base == 0:
        return dict(state, operand_class='fixed-absolute-memory', slot=hex(memory.disp & mask))
    return dict(state, operand_class='register-relative-memory')


def decode_row(row, decoder, capstone):
    raw = bytes.fromhex(row['instruction_bytes'])
    decoded = list(decoder.disasm(raw, int(row['site'], 16), count=1))
    require(len(decoded) == 1 and decoded[0].size == len(raw), 'Selected bytes do not decode exactly')
    instruction = decoded[0]
    expected = capstone.CS_GRP_CALL if row['kind'] == 'call_indirect' else capstone.CS_GRP_JUMP
    require(row['kind'] in KINDS and instruction.group(expected), 'Selected transfer kind differs')
    require(row['operand'] == 0 and row['access'] == 0, 'Independent flow selector fields differ')
    return instruction, operand_state(instruction, capstone)


def main():
    import capstone
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--ownership-summary', required=True)
    parser.add_argument('--residual-summary', required=True)
    parser.add_argument('--output-directory', required=True)
    parser.add_argument('--summary-output', required=True)
    args = parser.parse_args()
    dependencies = [dict(path=p, sha256=file_sha256(ROOT / p)) for p in DEPENDENCIES]
    target = latest_target(verify=True)
    identity = {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    inputs = {}
    def consume(path, digest=None):
        path = project_path(path)
        actual = file_sha256(path)
        require(digest is None or actual == digest, 'Changed input: ' + str(path))
        record = dict(path=path.relative_to(ROOT).as_posix(), sha256=actual)
        inputs[record['path']] = record
        return record
    census_binding = consume('docs/analysis/coverage/full-image-census.json')
    census = load_json(project_path(census_binding['path']))
    require(census['target'] == identity and census['independent_instructions']['exact_source_bytes_verified'],
            'A current exact-byte-verified census is required')
    directory = project_path(census['artifacts']['directory'])
    body_binding = consume(directory / 'bodies.tsv.gz', census['artifacts']['files']['bodies.tsv.gz']['sha256'])
    ownership_binding = consume(args.ownership_summary)
    ownership = load_json(project_path(ownership_binding['path']))
    require(ownership['target'] == identity and ownership['census_summary_sha256'] == census_binding['sha256'],
            'Ownership selects a different target/census')
    consume(ownership['generator']['path'], ownership['generator']['sha256'])
    ghidra_binding = consume(ownership['artifact']['path'], ownership['artifact']['sha256'])
    ghidra = {}
    with gzip.open(project_path(ghidra_binding['path']), 'rt') as stream:
        for line in stream:
            row = json.loads(line)
            require(row['site'] not in ghidra, 'Duplicate Ghidra indirect site')
            ghidra[row['site']] = row
    residual_binding = consume(args.residual_summary)
    residual = load_json(project_path(residual_binding['path']))
    require(residual['target'] == identity and census_binding in residual['inputs'],
            'Residuals select a different target/census')
    independent = {}
    for lead, name, label in [('Q41-F01', 'instruction-summary', 'declared'),
                              ('Q41-F02', 'unwind-complement-summary', 'complement')]:
        summary_binding = consume(f'docs/analysis/coverage/{name}.json')
        summary = load_json(project_path(summary_binding['path']))
        require(summary['target'] == identity, 'Independent target differs: ' + lead)
        inventory_binding = consume(summary['inventory']['path'], summary['inventory']['sha256'])
        require(residual['independent_inputs'][name] == dict(summary=summary_binding, inventory=inventory_binding),
                'Residual inventory binding differs: ' + lead)
        artifact = residual['artifacts'][label + '-indirect-sites.tsv.gz']
        consume(artifact['path'], artifact['sha256'])
        expected = sum(summary['counts']['reference_kinds'].get(kind, 0) for kind in KINDS)
        require(expected == artifact['rows'], 'Independent/residual selector count differs: ' + lead)
        independent[lead] = dict(summary=summary_binding, inventory=inventory_binding,
                                 expected_records=expected, residual_artifact=artifact)
    helpers = module('independent_indirect_census', 'scripts/summarize-native-image.py')
    pe_helpers = module('independent_indirect_pe', 'scripts/inventory-current-target.py')
    pe = pe_helpers.pe_parser(target_bytes(target))
    owner = helpers.owner_lookup([(int(r['start'], 16), int(r['end'], 16), int(r['entry'], 16))
                                  for r in helpers.rows(project_path(body_binding['path'])) if r['external'] == 'false'])
    imports = {int(r['iat_start_address'], 16) + 8*i: (r['library'], symbol)
               for r in pe.imports() for i, symbol in enumerate(r['functions'])}
    relocations = {pe.image_base + site: value for site, kind, value in pe_helpers.relocations(pe)[0] if kind == 10}
    def domain(address):
        if pe.image_base <= address < pe.image_base + pe.u32(pe.optional + 60):
            return 'PE-headers'
        for section in pe.sections:
            if pe.image_base + section['rva'] <= address < pe.image_base + section['rva'] + section['virtual_size']:
                return 'executable' if int(section['characteristics'], 16) & 0x20000000 else 'data:' + section['name']
        return 'outside-loaded-sections'
    def image_bytes(address, count):
        try:
            start = pe.rva_offset(address - pe.image_base)
            end = pe.rva_offset(address + count - 1 - pe.image_base)
        except ValueError:
            return None
        return pe.data[start:start+count] if end == start+count-1 else None
    def slot_binding(state):
        if 'slot' not in state:
            return dict(kind='dynamic-address-state-required')
        slot = int(state['slot'], 16)
        common = dict(slot=state['slot'], slot_domain=domain(slot))
        if slot in imports and state['width_bytes'] == 8:
            library, symbol = imports[slot]
            return dict(common, kind='declared-import-slot', library=library, symbol=symbol)
        if slot in relocations and state['width_bytes'] == 8:
            value = relocations[slot]
            return dict(common, kind='relocation-backed-image-pointer', initial_image_address=hex(value),
                        initial_address_domain=domain(value), initial_address_body_owner=hex(owner(value)) if owner(value) is not None else None)
        raw = image_bytes(slot, state['width_bytes'])
        return dict(common, kind='fixed-slot-without-declared-pointer-binding',
                    initial_file_bytes=raw.hex() if raw is not None else None)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    output = project_path(args.output_directory)
    require(output.is_relative_to(ROOT / 'runtime'), 'Bulk output must stay inside runtime/')
    output.mkdir(parents=True, exist_ok=True)
    artifact = output / 'independent-indirect-operands.jsonl.gz'
    counts = Counter()
    per_lead = {}
    seen = set()
    matched = set()
    with derived_gzip_text(artifact, publish=True) as stream:
        for lead, binding in independent.items():
            local = Counter()
            for row in selected_rows(binding['inventory']['path'], lead):
                require(row['site'] not in seen, 'Duplicate/overlapping independent indirect site')
                seen.add(row['site'])
                instruction, state = decode_row(row, decoder, capstone)
                raw = bytes.fromhex(row['instruction_bytes'])
                require(image_bytes(int(row['site'], 16), len(raw)) == raw, 'Original instruction bytes differ')
                actual = owner(int(row['site'], 16))
                prior = ghidra.get(row['site'])
                if prior is not None:
                    require(prior['instruction_bytes'] == row['instruction_bytes'] and prior['kind'] == row['kind'].split('_')[0],
                            'Ghidra/independent transfer differs')
                    require(prior['native_owner'] == (hex(actual) if actual is not None else None), 'Ghidra owner differs')
                    matched.add(row['site'])
                slot = slot_binding(state)
                record = dict(row, lead_id=lead, mnemonic=instruction.mnemonic,
                              operand_text=instruction.op_str, operand_state=state, slot_binding=slot,
                              observed_body_owner=hex(actual) if actual is not None else None,
                              ghidra_indirect_record_present=prior is not None,
                              ghidra_initial_target=prior.get('initial_target') if prior is not None else None,
                              initial_image_binding_is_runtime_dispatch=False,
                              incoming_register_state_established=False, global_aliasing_complete=False,
                              runtime_dispatch_verified=False, source_semantics_established=False)
                stream.write(json.dumps(record, separators=(',', ':')) + '\n')
                for key in ('records', 'kind:' + row['kind'], 'operand:' + state['operand_class'],
                            'binding:' + slot['kind'], 'ghidra:' + ('present' if prior is not None else 'absent'),
                            'body:' + ('present' if actual is not None else 'absent')):
                    counts[key] += 1
                    local[key] += 1
            require(local['records'] == binding['expected_records'], 'Independent selector count differs: ' + lead)
            per_lead[lead] = dict(sorted(local.items()))
    require(matched == set(ghidra), 'Ghidra indirect sites are not the exact independent intersection')
    for record in [*inputs.values(), *dependencies, dict(path=GENERATOR, sha256=GENERATOR_SHA256)]:
        require(file_sha256(project_path(record['path'])) == record['sha256'], 'Input/generator changed during classification: ' + record['path'])
    report = dict(schema_version=1, target=identity,
                  generator=dict(path=GENERATOR, sha256=GENERATOR_SHA256, capstone_version=capstone.__version__),
                  dependencies=dependencies, inputs=list(inputs.values()), independent_inputs=independent,
                  source_census=census_binding, ghidra_ownership=ownership_binding, residual_summary=residual_binding,
                  artifact=dict(path=artifact.relative_to(ROOT).as_posix(), sha256=file_sha256(artifact), rows=counts['records']),
                  counts=dict(sorted(counts.items())), per_lead=per_lead,
                  exact_selected_sites_classified=True, computed_runtime_targets_complete=False,
                  source_semantics_complete=False, global_aliasing_complete=False, parity_verified=False,
                  gap_ids=[41], lead_ids=['Q41-F01', 'Q41-F02'],
                  limits=['Every exact independent indirect selector row is retained, including sites absent from Ghidra bodies.',
                          'An encoded slot/import or initial relocation word is a static image/loader declaration, not an observed callee or runtime alias.',
                          'No straight-line state propagation is attempted for independent sites; registers, indexed/segment addresses, incoming edges, table types and runtime dispatch remain unknown.',
                          'Spatial body/path context does not establish AS mechanics, generic subsystem semantics or source equivalence. No native analysis session, application compilation or game execution.'])
    destination = project_path(args.summary_output)
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(json_text(report))
    print(json_text(dict(counts=report['counts'], per_lead=per_lead)))


if __name__ == '__main__':
    main()
