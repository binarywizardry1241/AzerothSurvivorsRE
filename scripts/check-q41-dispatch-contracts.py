#!/usr/bin/env python3
"""Check thirteen selected AS-context dispatches and bounded producer subsets.

Conditional cells are not a claim that every incoming discriminant is valid.
No compilation, application launch or native target process is performed.
"""
from portable_paths import portable_json, portable_record
import argparse
import gzip
import hashlib
import importlib.util
import json
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes, file_sha256

SITES = [int(s, 16) for s in (
    '1400a4137 1400b0e45 14010c265 140113990 140113bf0 1402553a6 '
    '1402b1263 145854245 145931af4 1459439b4 1459793ef 14597e7f4 1459e066f'
).split()]


def require(value, message):
    if not value:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, ROOT / path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def sha(value):
    return hashlib.sha256(value).hexdigest()


def current_coop_contract():
    """Check the selected current AS interfaces, not all incoming enum values."""
    from discovery_native_subject import verify_native_query_subject
    import capstone

    target = latest_target(verify=True)
    identity = {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.127.0/coop-dispatch/manifest.json').read_text())
    require(proof['target'] == identity, 'Co-op dispatch proof belongs to another target')
    pe = module('current_coop_dispatch_pe', 'scripts/inventory-executable.py').PE(target_bytes(target))
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    checked = 0

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        require(count > 0 and pe.rva_offset(address + count - 1 - pe.image_base) == offset + count - 1,
                'Noncontiguous current co-op range')
        return pe.data[offset:offset + count]

    def receipt(record):
        path = (ROOT / record['path']).resolve()
        require(path.is_relative_to(ROOT), 'Co-op evidence escapes this checkout')
        require(file_sha256(path) == record['sha256'], 'Changed co-op evidence: ' + record['path'])
        return path

    for row in proof['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        payload = raw(start, end - start)
        require(sha(payload) == row['sha256'] and len(payload) == row['byte_count']
                and pe.rva_offset(start - pe.image_base) == int(row['file_offset'], 16),
                'Changed co-op native range: ' + row['role'])
        instructions = list(decoder.disasm(payload, start))
        require(sum(item.size for item in instructions) == len(payload)
                and len(instructions) == row['independently_decoded_instructions']
                and row['complete_original_byte_linear_decode'] is True, 'Incomplete co-op range decode')
        if 'assembly' in row:
            rendered = ''.join(f'{item.address:016x} {item.bytes.hex():<30} {item.mnemonic} {item.op_str}\n'
                               for item in instructions)
            require(receipt(row['assembly']).read_text() == rendered, 'Changed canonical co-op assembly')
        checked += len(instructions)
    for row in proof['instructions']:
        address = int(row['site'], 16)
        instruction = next(decoder.disasm(raw(address, 15), address, count=1))
        require((instruction.bytes.hex(), instruction.mnemonic, instruction.op_str) ==
                (row['bytes'], row['mnemonic'], row['operands']), 'Changed co-op instruction at ' + row['site'])
    for row in proof['tables']:
        address = int(row['address'], 16)
        payload = raw(address, 4 * row['entries'])
        require(sha(payload) == row['sha256'], 'Changed current co-op table')
        destinations = [hex(address + value[0]) for value in struct.iter_unpack('<i', payload)]
        require(destinations == row['case_targets'], 'Changed co-op conditional case vector')
    for row in proof['data']:
        payload = raw(int(row['address'], 16), row['byte_count'])
        require(payload.hex() == row['bytes_hex'] and sha(payload) == row['sha256'], 'Changed co-op data cell')
    for row in proof.get('imports', []):
        address, slot = int(row['stub'], 16), int(row['iat_slot'], 16)
        instruction = next(decoder.disasm(raw(address, 6), address, count=1))
        require(instruction.mnemonic == 'jmp' and instruction.op_str ==
                f'qword ptr [rip + {hex(slot - address - instruction.size)}]', 'Changed co-op import thunk')
        imported = [(item['library'], item['functions'][(slot - int(item['iat_start_address'], 16)) // 8])
                    for item in pe.imports()
                    if 0 <= slot - int(item['iat_start_address'], 16) < len(item['functions']) * 8]
        require(imported == [(row['library'], row['function'])], 'Changed co-op import identity')
    for query in proof['queries']:
        for key in ('plan', 'journal', 'result', 'raw_input'):
            receipt(query[key])
        result = json.loads(receipt(query['result']).read_text())
        native = result.get('structuredContent') or json.loads(result['content'][0]['text'])
        normalized = native['normalized_result']
        serialized = normalized if isinstance(normalized, str) else json.dumps(normalized, sort_keys=True)
        require(sha(serialized.encode()) == query.get('normalized_text_sha256', query.get('normalized_sha256')),
                'Changed co-op normalized native result')
        observed = verify_native_query_subject(ROOT, native, query, identity, image=pe.data, pe=pe)
        require(observed == query['subject_verification'], 'Changed co-op query subject binding')
    owners = proof['diagnostic_owners']
    owner_paths = {'custom-game-server': 'crates/wenilla-rogue/src/server.rs',
                   'custom-game-server-party': 'crates/wenilla-rogue/src/server/party.rs'}
    require(owners['system_ids'] == list(owner_paths)
            and owners['reconstructed_driver_label_is_original_driver_module'] is False,
            'Reconstructed coordinator labels cannot establish original driver.rs ownership')
    location_counts = []
    for body in owners['bodies']:
        start, end = int(body['start'], 16), int(body['end_exclusive'], 16)
        query = proof['queries'][body['query_index']]
        require(int(query['slice_virtual_address'], 16) == start
                and query['subject_verification']['byte_count'] == end - start,
                'Source Location guards must belong to the queried complete body')
        counts = dict.fromkeys(owner_paths, 0)
        for row in body['locations']:
            site, address = int(row['instruction'], 16), int(row['location'], 16)
            require(start <= site < end, 'Source Location instruction escaped its owning body')
            item = next(decoder.disasm(raw(site, 15), site, count=1))
            references = [item.address + item.size + operand.mem.disp for operand in item.operands
                          if operand.type == capstone.CS_OP_MEM
                          and operand.mem.base == capstone.x86.X86_REG_RIP]
            require(item.mnemonic == 'lea' and references == [address], 'Changed source Location reference')
            pointer, length, line, column = struct.unpack('<QQII', raw(address, 24))
            require((pointer, length, line, column) == (int(row['path_pointer'], 16), row['path_length'],
                                                       row['line'], row['column'])
                    and pe.rva_offset(address - pe.image_base) == int(row['file_offset'], 16),
                    'Changed native Rust Location record')
            path = raw(pointer, length)
            require(sha(path) == row['path_sha256']
                    and path.decode().replace('\\', '/') == row['original_path'] == owner_paths[row['system']],
                    'Changed original native module path')
            counts[row['system']] += 1
        location_counts.append(counts)
    require(location_counts == [{'custom-game-server': 4, 'custom-game-server-party': 6},
                                {'custom-game-server': 0, 'custom-game-server-party': 4}],
            'Changed bounded server/party diagnostic owner set')
    game = json.loads(receipt(proof['game_slot_producers']).read_text())
    require(game['target'] == identity and game['target_executed'] is False,
            'Game-slot producers belong to another target')
    game_instructions = 0
    for row in game['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        payload = raw(start, end - start)
        instructions = list(decoder.disasm(payload, start))
        require(pe.rva_offset(start - pe.image_base) == int(row['file_offset'], 16)
                and len(payload) == row['byte_count'] and sha(payload) == row['sha256']
                and payload.hex() == row['bytes_hex'], 'Changed local Game producer bytes')
        require(sum(item.size for item in instructions) == len(payload)
                and len(instructions) == row['instruction_count'], 'Incomplete local Game producer decode')
        rendered = [f'{item.address:x} {item.bytes.hex()} {item.mnemonic} {item.op_str}'.rstrip()
                    for item in instructions]
        require(rendered == row['assembly'], 'Changed local Game producer assembly')
        game_instructions += len(instructions)
    for row in game['alias_checks']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        payload = raw(start, end - start)
        instructions = list(decoder.disasm(payload, start))
        require(sha(payload) == row['sha256'] and sum(item.size for item in instructions) == len(payload)
                and len(instructions) == row['instruction_count'], 'Changed Game output-pointer alias block')
        require(row['register'] == 'R14' and not any(
            item.reg_name(register).startswith('r14') for item in instructions
            for register in item.regs_access()[1]), 'Changed preserved Game output-pointer register')
    require(len(game['ranges']) == 15 and game['contract']['empty_value'] == 2
            and game['contract']['network_role_field'] == '0xd98'
            and game['contract']['network_role_is_independent'] is True,
            'Local Game absence must stay distinct from network role')
    require({row['site'] for row in proof['dispatches']} ==
            {'0x145bb6640', '0x145bd6353', '0x145bd679a', '0x145bd7007'},
            'Current co-op dispatch selection differs')
    denied = proof['guest_denied_contract']
    denied_table = int(denied['table'], 16)
    destination = denied_table + struct.unpack('<i', raw(denied_table + 4, 4))[0]
    require(denied['native_variant'] == 2 and denied['wire_tag'] == 3
            and denied['table_index'] == 1 and destination == int(denied['destination'], 16)
            and denied['joined_zone_or_game_gate'] is False
            and denied['ordinary_failure_helper_called'] is False,
            'Guest Denied must retain its distinct refusal/role teardown path')
    denied_instructions = list(decoder.disasm(raw(0x145bd83e2, 0x71), 0x145bd83e2))
    denied_calls = [item.op_str for item in denied_instructions if item.mnemonic == 'call']
    require(denied_calls == ['0x14606171b', 'qword ptr [rax + 0x30]', '0x145bab0b0'],
            'Guest Denied may not inherit ordinary failure settlement from connection close')
    ui = proof['guest_denied_ui_proof']
    ui_start = int(ui['start'], 16)
    ui_payload = raw(ui_start, ui['byte_count'])
    ui_instructions = list(decoder.disasm(ui_payload, ui_start))
    require(sha(ui_payload) == ui['sha256']
            and pe.rva_offset(ui_start - pe.image_base) == int(ui['file_offset'], 16)
            and len(ui_instructions) == ui['independently_decoded_instructions']
            and sum(item.size for item in ui_instructions) == len(ui_payload),
            'Changed canonical refusal UI consumer')
    ui_rendered = ''.join(f'{hex(item.address)}: {item.mnemonic} {item.op_str}\n'
                          for item in ui_instructions)
    require(receipt(ui['assembly']).read_text() == ui_rendered
            and denied['ui_generates_game_or_leave_reset_request'] is False,
            'Refused UI state must not imply an automatic Game reset request')
    compressed = next(row for row in proof['alias_contracts'] if row['site'] == '0x145bd679a')
    require(compressed['selected_index'] == 19 and compressed['selected_destination'] == '0x145bd706a',
            'Compressed cleanup is not an additional 22-case message dispatcher')
    handler = list(decoder.disasm(raw(0x145bd6280, 0xe14), 0x145bd6280))
    r12_writes = [(item.address, item.mnemonic, item.op_str) for item in handler
                  if 'r12' in {item.reg_name(register) for register in item.regs_access()[1]}]
    require(r12_writes == [(0x145bd62e6, 'mov', 'r12, qword ptr [r9]'),
                           (0x145bd64ae, 'mov', 'r12, qword ptr [r9]'),
                           (0x145bd707b, 'pop', 'r12')], 'Changed original-message alias preservation')
    for address, mnemonic, operands in [(0x145bd630b, 'cmp', 'rax, 0x13'),
            (0x145bd630f, 'je', '0x145bd659d'), (0x145bd64ca, 'cmp', 'rax, 0x13'),
            (0x145bd64ce, 'je', '0x145bd659d')]:
        item = next(value for value in handler if value.address == address)
        require((item.mnemonic, item.op_str) == (mnemonic, operands), 'Changed compressed cleanup dominator')
    # Country state is owned by the service, whose exact pump was already
    # recovered by the relay owner. Follow these four event tails only, stopping
    # before another receive; no native code is executed.
    pump = {item.address: item for item in decoder.disasm(raw(0x145cb7780, 14012), 0x145cb7780)}
    for row in proof['country_contract']['pump_reset_paths']:
        pending, seen = [int(row['entry'], 16)], set()
        while pending:
            address = pending.pop()
            if address in seen or address in (0x145cb8fc2, 0x145cb8ff6, 0x145cb7c31):
                continue
            require(address in pump, 'Country event escaped the declared pump body')
            seen.add(address)
            item = pump[address]
            if item.mnemonic == 'ret':
                continue
            if item.group(capstone.CS_GRP_JUMP):
                require(item.operands[0].type == capstone.CS_OP_IMM,
                        'Unresolved indirect country lifecycle branch')
                pending.append(item.operands[0].imm)
                if item.mnemonic == 'jmp':
                    continue
            pending.append(item.address + item.size)
        require((0x145cb8c08 in seen) == row['clear_reachable'], 'Changed country map reset path')
        require(row['clear_reachable'] == (row['event'] == 'Hosted'), 'Unexpected service country reset event')
    # These original data bits define the country trim set. The chat iterator
    # separately adds C0/C1 controls; Python str.isspace is not its specification.
    table = raw(0x1477b322f, 256)
    whitespace = set(range(9, 14)) | {0x20, 0x1680, 0x3000}
    whitespace |= {value for value in range(256) if table[value] & 1}
    whitespace |= {0x2000 + value for value in range(256) if table[value] & 2}
    require(whitespace == {int(value, 16) for value in proof['country_contract']['trim_codepoints']}
            and len(whitespace) == 25, 'Changed country Unicode White_Space set')
    require(proof['roster_contract']['country_tail_has_count'] is False,
            'Roster country appendix must reuse the decoded row count')
    zones = json.loads(receipt(proof['guest_zone_table_proof']).read_text())
    require(all(zones['target'][key] == identity[key] for key in ('version', 'sha256', 'size_bytes')),
            'Canonical zone table belongs to another target')
    zone_table = zones['zone_table']
    zone_bytes = raw(int(zone_table['virtual_address'], 16), zone_table['byte_count'])
    require(sha(zone_bytes) == zone_table['sha256'] and zone_bytes.hex() == zone_table['hex']
            and zones['zone_stride'] == 240, 'Changed canonical guest zone table')
    zone_keys = []
    for index in range(12):
        pointer, length = struct.unpack_from('<QQ', zone_bytes, index * 240 + 8)
        zone_keys.append(raw(pointer, length).decode('ascii'))
    require(zone_keys == proof['guest_zone_contract']['keys']
            and proof['guest_zone_contract']['unknown_key_result'] == 0,
            'Guest ZoneKey must use the canonical row-zero fallback')
    receipt(proof['guest_sync_proof'])
    events = proof['service_event_contract']['branches']
    require(len(events) == 13 and proof['service_event_contract']['site'] == '0x145cb7c68',
            'Changed selected thirteen-event service dispatcher')
    event_table = next(row for row in proof['tables'] if row['role'] == 'service-native1-13')
    wire_table = next(row for row in proof['tables'] if row['role'] == 'service-wire20-33')
    parser = {item.address: item for item in decoder.disasm(raw(0x145ec1e60, 3752), 0x145ec1e60)}
    for row in events:
        require(row['table_index'] == row['native_variant'] - 1
                and row['wire_tag'] == row['native_variant'] + 20
                and row['pump_destination'] == event_table['case_targets'][row['table_index']]
                and row['decoder_entry'] == wire_table['case_targets'][row['wire_tag'] - 20],
                'Changed wire/native service event correspondence')
        pending, seen = [int(row['decoder_entry'], 16)], set()
        while pending:
            address = pending.pop()
            if address in seen or address in (0x145ec29b8, 0x145ec2c49):
                continue
            require(address in parser, 'Service decoder path escaped its declared body')
            seen.add(address)
            item = parser[address]
            if item.mnemonic in ('ret', 'ud2', 'int3'):
                continue
            if item.group(capstone.CS_GRP_JUMP):
                require(item.operands[0].type == capstone.CS_OP_IMM,
                        'Unresolved indirect service event producer')
                pending.append(item.operands[0].imm)
                if item.mnemonic == 'jmp':
                    continue
            pending.append(item.address + item.size)
        writes = [parser[address] for address in seen if 'r14' in {
            parser[address].reg_name(register) for register in parser[address].regs_access()[1]}]
        if row['native_variant'] == 10:
            require([(item.address, item.mnemonic, item.op_str) for item in writes] ==
                    [(0x145ec214f, 'mov', 'r14, qword ptr [rbp + 0x148]')],
                    'Service variant10 must retain its owned String-capacity niche')
        else:
            require(writes and all(item.mnemonic == 'movabs' and item.op_str ==
                    f'r14, {hex(0x8000000000000000 | row["native_variant"])}' for item in writes),
                    'Changed exact native service discriminator producer')
    require(proof['source_semantics_complete'] is False and proof['parity_verified'] is False,
            'Bounded co-op proof cannot certify global semantics or parity')
    stale = []
    for row in proof['source_first']:
        try:
            receipt(row)
        except ValueError as error:
            stale.append(str(error))
    require(not stale, 'Native contracts verified; source receipts need review: ' + '; '.join(stale))
    source_paths = {row['path'] for row in proof['source_first']}
    for row in proof.get('source_assertions', []):
        require(row['path'] in source_paths, 'Source guard lacks an inspected source receipt')
        content = (ROOT / row['path']).read_text()
        require(all(value in content for value in row['required']),
                'Changed co-op source interface guard: ' + row['path'])
        for sequence in row['ordered']:
            start = content.index(sequence['start'])
            body = content[start:content.index(sequence['end'], start)]
            require(not any(value in body for value in sequence.get('forbidden', [])),
                    'Co-op source branch added an unproved side effect: ' + row['path'])
            cursor = 0
            for value in sequence['tokens']:
                cursor = body.index(value, cursor) + len(value)
    print(json.dumps(dict(dispatches=4, queries=len(proof['queries']), ranges=len(proof['ranges']),
                          decoded_instructions=checked, tables=len(proof['tables']),
                          game_slot_ranges=len(game['ranges']), game_slot_instructions=game_instructions,
                          service_event_cases=len(events), native_source_locations=14,
                          refusal_ui_instructions=len(ui_instructions),
                          target_executed=False, compiled=False), sort_keys=True))


def main():
    import capstone
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    parser.add_argument('--current-coop', action='store_true', help='Check the bounded 0.127.0 co-op dispatch proof')
    args = parser.parse_args()
    if args.current_coop:
        require(not args.write, 'The current co-op proof is read-only')
        return current_coop_contract()
    target = latest_target(verify=True)
    require(target['sha256'] == '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c', 'Wrong target')
    identity = {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    pe = module('q41_dispatch_pe', 'scripts/inventory-executable.py').PE(target_bytes(target))
    registers = module('q41_dispatch_regs', 'scripts/classify-native-ownership.py')
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    inputs, spans = [], {}

    def consume(path, expected=None):
        digest = file_sha256(ROOT / path)
        require(expected is None or digest == expected, 'Changed selected input: ' + path)
        inputs.append(dict(path=path, sha256=digest))
        return ROOT / path

    def raw(address, count):
        off = pe.rva_offset(address-pe.image_base)
        require(count > 0 and pe.rva_offset(address+count-1-pe.image_base)-off == count-1, 'Noncontiguous native range')
        return pe.data[off:off+count]

    def span(start, end):
        spans[hex(start)] = dict(end_exclusive=hex(end), sha256=sha(raw(start, end-start)))

    def decode(start, end):
        span(start, end)
        code = list(decoder.disasm(raw(start, end-start), start))
        require(sum(i.size for i in code) == end-start, 'Incomplete exact extent decode')
        return code

    def guard(address, mnemonic, operands):
        instruction = next(decoder.disasm(raw(address, 15), address, count=1))
        require((instruction.mnemonic, instruction.op_str) == (mnemonic, operands), 'Changed native producer at ' + hex(address))
        span(address, address+instruction.size)
        return dict(site=hex(address), bytes=instruction.bytes.hex(), instruction=mnemonic+' '+operands)

    projection = json.loads(consume('docs/analysis/evidence/0.115.0/expanded-gap-dispatch.json').read_text())
    require(projection['target'] == identity, 'Expanded dispatch target differs')
    artifact = projection['artifact']
    with gzip.open(consume(artifact['path'], artifact['sha256']), 'rt') as stream:
        selected = [r for r in map(json.loads, stream) if int(r['site'], 16) in SITES]
    require(sorted(int(r['site'], 16) for r in selected) == SITES, 'Selected thirteen-site population differs')

    metadata = json.loads(consume('docs/analysis/evidence/0.115.0/addon-timers/metadata.json').read_text())
    table = metadata['spells']['native']
    require(table['va'] == '0x146cc4580' and table['size'] == 113*120 and
            sha(raw(int(table['va'], 16), table['size'])) == table['sha256'], 'Changed current ability input table')
    source_path = 'crates/azeroth-survivors-re/src/player_abilities/catalog.rs'
    source = (ROOT/source_path).read_text()
    chunks = re.findall(r'AbilityDefinition \{(.*?)\n    \},', source.split('pub static ABILITIES:', 1)[1].split('pub static CLASSES:', 1)[0], re.S)
    require(len(chunks) == 113, 'Ability source population differs')
    descriptors = []
    for index, chunk in enumerate(chunks):
        address = int(table['va'], 16)+120*index
        key_pointer, key_length = struct.unpack('<QQ', raw(address, 16))
        key = raw(key_pointer, key_length).decode()
        pointer, count = struct.unpack('<QQ', raw(address+48, 16))
        require(0 < count <= 5, 'Unrecovered current upgrade slice length')
        types = list(raw(pointer, count))
        kind = raw(address+117, 1)[0]
        source_key = json.loads(re.search(r'\bkey:\s*("[^"]+")', chunk)[1])
        source_types = [int(v) for v in re.search(r'upgrade_types:\s*&\[([^]]*)\]', chunk)[1].split(',') if v.strip()]
        source_kind = int(re.search(r'\bkind:\s*(\d+)', chunk)[1])
        require((key, types, kind) == (source_key, source_types, source_kind), 'Changed descriptor/source dispatch fields: ' + key)
        require(set(types).issubset(range(5)) and kind in range(12), 'Unrecovered descriptor discriminant')
        descriptors.append(dict(address=hex(address), key=key, upgrade_types=types, kind=kind))
    descriptor_contract = dict(records=113, table=table, source=source_path,
                               compared_dispatch_fields_sha256=sha(json.dumps(descriptors, sort_keys=True, separators=(',', ':')).encode()),
                               observed_upgrade_types=sorted({k for d in descriptors for k in d['upgrade_types']}),
                               observed_cast_kinds=sorted({d['kind'] for d in descriptors}),
                               arbitrary_pointer_ancestry_certified=False)

    # A guarded current caller copies control+0x40 into the exact local tuple
    # passed to the numeric formatter. Its other caller remains separate.
    options_guards = [guard(*v) for v in [
        (0x1400aa099, 'cmp', 'rcx, 0x69'), (0x1400aa09d, 'jae', '0x1400aa643'),
        (0x1400aa0a7, 'imul', 'rax, rcx, 0x98'),
        (0x1400aa0ae, 'lea', 'rcx, [rip + 0x5e3f54b]'),
        (0x1400aa0b5, 'cmp', 'dword ptr [rax + rcx + 0x40], 5'),
        (0x1400aa0ba, 'jae', '0x1400aa062'),
        (0x1400aa0c3, 'add', 'rax, 0x40'),
        (0x1400aa0df, 'movups', 'xmm0, xmmword ptr [rax]'),
        (0x1400aa0e2, 'movaps', 'xmmword ptr [rbp - 0x50], xmm0'),
        (0x1400aa5a0, 'lea', 'rdx, [rbp - 0x50]'),
        (0x1400aa5aa, 'call', '0x1400a40f0')]]
    option_source = json.loads(consume('crates/azeroth-survivors-re/assets/options.json').read_text())['rows']
    require(len(option_source) == 105, 'Options input population differs')
    option_controls = []
    for index, definition in enumerate(option_source):
        address = 0x145ee9600+152*index
        pointer, count = struct.unpack('<QQ', raw(address+32, 16))
        key = raw(pointer, count).decode() if count else 'gamma'
        control = struct.unpack('<Q', raw(address+64, 8))[0]
        require(key == definition['key'] and control == definition['control'] and control < 8, 'Changed immutable Options control tuple')
        option_controls.append(dict(key=key, control=control))
    span(0x145ee9600, 0x145ee9600+105*152)
    # The caller compares only the low dword. These immutable qwords establish
    # the zero upper dword needed by the formatter's full-qword selector.
    option_input = dict(address='0x145ee9600', rows=105, stride=152, all_control_upper_dwords_zero=True,
                        control_key_sha256=sha(json.dumps(option_controls, sort_keys=True, separators=(',', ':')).encode()))
    # Four exact parser assignments reach shape field+0x54 in both ordinary
    # append and replacement records (record size128). Calls preserve RSI at
    # this Win64 interface; full mutable-row alias closure is not inferred.
    parser_code = decode(0x1401116e0, 0x140112b87)
    shape_assignments = [i for i in parser_code if 0x14011207a <= i.address < 0x140112706 and
                         'rsi' in {registers.canonical_register(i.reg_name(r)) for r in i.regs_access()[1]}]
    require([(i.address, i.mnemonic, i.op_str) for i in shape_assignments] == [
        (0x14011207a, 'xor', 'esi, esi'), (0x1401121f0, 'mov', 'esi, 1'),
        (0x140112253, 'mov', 'esi, 2'), (0x1401122c3, 'mov', 'esi, 3')], 'Shape producer domain differs')
    marker_guards = [guard(*v) for v in [
        (0x140112706, 'mov', 'dword ptr [rbp + 0x94], esi'),
        (0x1401127df, 'mov', 'eax, dword ptr [rbp + 0x94]'),
        (0x1401127e5, 'mov', 'dword ptr [rbp + 0x4c], eax'),
        (0x14011297a, 'mov', 'eax, dword ptr [rbp + 0x94]'),
        (0x140112980, 'mov', 'dword ptr [rbx + rsi - 0x2c], eax'),
        (0x1401131f0, 'mov', 'eax, dword ptr [r14 + 0x54]'),
        (0x140113677, 'mov', 'eax, dword ptr [r14 + 0x54]')]]

    # Direct concrete constructor inputs witness three negative niche cases.
    header_guards = [guard(*v) for v in [
        (0x145975408, 'movabs', 'rax, 0x8000000000000004'),
        (0x145975412, 'mov', 'qword ptr [rbp + 0xb0], rax'),
        (0x14597541d, 'lea', 'r8, [rbp + 0xb0]'),
        (0x14597542a, 'call', '0x145979340'),
        (0x14597d00f, 'movabs', 'rax, 0x8000000000000003'),
        (0x14597d019, 'mov', 'qword ptr [rbp + 0x170], rax'),
        (0x14597d027, 'lea', 'r12, [rbp + 0x170]'),
        (0x14597d02e, 'mov', 'r8, r12'), (0x14597d038, 'call', '0x145979340'),
        (0x14597d048, 'lea', 'rbx, [rbp + 0x60]'),
        (0x14597d424, 'movabs', 'rax, 0x8000000000000002'),
        (0x14597d42e, 'mov', 'qword ptr [rbp + 0x60], rax'),
        (0x14597d439, 'mov', 'r8, rbx'), (0x14597d43c, 'call', '0x145979340'),
        (0x14597a926, 'movabs', 'rax, 0x8000000000000000'),
        (0x14597a930, 'mov', 'qword ptr [r13 + 0x78], rax'),
        (0x14597ae57, 'movabs', 'rax, 0x8000000000000002'),
        (0x14597ae68, 'mov', 'qword ptr [rcx + 0x78], rax'),
        (0x14597a31a, 'movabs', 'rax, 0x8000000000000003'),
        (0x14597a324, 'mov', 'qword ptr [r13 + 0x78], rax'),
        (0x14597a7fb, 'movabs', 'rdx, 0x8000000000000004'),
        (0x14597a805, 'mov', 'qword ptr [r13 + 0x78], rdx')]]
    open_proof = json.loads(consume('docs/analysis/evidence/0.115.0/coop-ui/open-admission.json').read_text())
    require(open_proof['target']['sha256'] == target['sha256'] and open_proof['contract']['action'] == 10, 'Changed established OPEN input')

    # Cases below are admitted ONLY under the stated producer/predicate.
    specs = {
        0x1400a4137: ('Options numeric presentation', 'u64([RDX])', list(range(5)), 'Current caller1400aa5aa copies only control<5 into the argument tuple.', 'Other caller140340d57 and arbitrary RDX/control tuple ancestry remain unclosed.'),
        0x1400b0e45: ('Options action handler', '(u64([R15]) XOR2^63) if signed-negative, otherwise4', [4], 'Every nonnegative first word normalizes to4.', 'Negative niche discriminants and complete ECS Action writer/type identity remain unclosed.'),
        0x14010c265: ('Menu/Armory Action including Coop OPEN', 'u8([RAX])', [10], 'Existing current Action10 producer/table-cell/Coop-field consumer proof.', 'The other Action values and arbitrary row/component aliases are not re-certified.'),
        0x140113990: ('Ground-marker outline shape', 'u32([R14+0x54])', list(range(4)), 'Current JSON receiver produces shape0..3 at record+0x54.', 'Other mutable-row writers/aliases and actual world/rendering execution remain unproved.'),
        0x140113bf0: ('Ground-marker fill shape', 'u32([R14+0x54])', list(range(4)), 'Same current JSON receiver shape field0..3.', 'Other mutable-row writers/aliases and actual world/rendering execution remain unproved.'),
        0x1402553a6: ('Armory secondary input', '8 if u32([RSI])<2, otherwise(u32([RSI])-2)', [8], 'SUB/CMOVB sends raw tags0/1 to8 without assuming the other tags.', 'The actual shared input enum and remaining raw tag range are unclosed at this AS interface.'),
        0x1402b1263: ('Rewards input', 'u8([RAX]); tag6 handled before this branch', [], 'The preceding equality branch separately handles6.', 'Other action discriminants require exact native producers/type identity; byte width does not establish a table length.'),
        0x145854245: ('Ordinary upgrade magnitude', 'u8(DL)', list(range(5)), 'All113 immutable current descriptor slices contain only0..4 and match existing UpgradeKind source.', 'Arbitrary byte slices/definition pointers and all mutable selector ancestry remain unclosed.'),
        0x145931af4: ('Ability cast-kind dispatch', 'u8([RSI+0x75])', descriptor_contract['observed_cast_kinds'], 'All113 current descriptor kind fields match existing catalog dispatch fields.', 'Arbitrary learned-instance/definition pointer ancestry and complete branch mechanics remain unclosed.'),
        0x1459439b4: ('Effect64 application', 'u8([RCX]);255 ends input', [], 'Current loop stops on end pointer or tag255 before advancing64bytes.', 'A complete successful Effect64 producer/type population is missing; do not infer it from adjacent table words.'),
        0x1459793ef: ('Choice constructor', '(u64([R8]) XOR2^63) if signed-negative, otherwise1', [1, 2, 3, 4], 'Nonnegative header→1; concrete native callers witness negative2/3/4.', 'Cursor-derived Learn0/all input ancestry and arbitrary niche headers remain unclosed.'),
        0x14597e7f4: ('Choice accept', '(display+0x78 header XOR2^63) if signed-negative, otherwise1', list(range(5)), 'Current constructor stores negative0/2/3/4 at display+0x78; ordinary nonnegative Vec headers normalize to1.', 'Whole constructor input validity and arbitrary writes/aliases into the live display Vec remain unclosed.'),
        0x1459e066f: ('Ordinary upgrade prose', 'u8([R14+R13]) forwarded unchanged to magnitude', list(range(5)), 'Current immutable upgrade-type population0..4 supplies the existing descriptor/choice slice interface.', 'Generic incoming slice ancestry and every alias/mutation before prose remain unclosed.'),
    }
    rows = []
    for row in selected:
        site = int(row['site'], 16)
        start, end = (int(v, 16) for v in row['declared_extent'])
        code = {i.address: i for i in decode(start, end)}
        for item in row['prelude']:
            require(item['site'] in {hex(a) for a in code} and code[int(item['site'], 16)].bytes.hex() == item['bytes'], 'Changed selected prelude')
        expression = row['expression']
        base = int(expression['base_candidate']['address'], 16)
        definition = expression['base_candidate']['nearest_definition']
        instruction = code[int(definition['site'], 16)]
        require(instruction.mnemonic == 'lea' and instruction.operands[1].mem.base == capstone.x86_const.X86_REG_RIP and
                instruction.address+instruction.size+instruction.operands[1].mem.disp == base, 'Changed table base expression')
        name, selector, cases, admission, blocker = specs[site]
        cells = []
        for value in cases:
            cell = base+value*4
            relative = struct.unpack('<i', raw(cell, 4))[0]
            destination = base+relative
            require(start <= destination < end and destination in code, 'Conditional case does not target a decoded instruction in the declared extent')
            cells.append(dict(selector=value, address=hex(cell), bytes=raw(cell, 4).hex(), destination=hex(destination)))
            span(cell, cell+4)
        if site == 0x14010c265:
            require(cells[0]['destination'] == open_proof['contract']['open_branch'], 'Established OPEN target differs')
        rows.append(dict(site=row['site'], context_paths=row['AS_context_paths'], declared_extent=row['declared_extent'],
                         role=name, incoming_selector=selector, table_base=hex(base), encoded_cells=cells,
                         bounded_admission=admission, remaining_blocker=blocker,
                         all_incoming_paths_or_aliases_complete=False, complete_AS_source_semantics=False,
                         body_ownership_inferred_from_extent=False))

    # Exact native evidence receipts include failure/overreach warnings. An
    # oversized inferred Ghidra body is never used to admit cells or meanings.
    native_queries = []
    results = ROOT/'runtime/q41-dispatch-contracts-0.115.0/rea-owners/results'
    for path in sorted(results.glob('*.json')):
        receipt = json.loads(json.loads(consume(path.relative_to(ROOT).as_posix()).read_text())['content'][0]['text'])
        require(receipt['subject']['digest']['sha256'] == target['sha256'] and receipt['provider']['id'] == 'ghidra', 'Wrong native query target/provider')
        text = receipt['normalized_result']
        warnings = [line.strip() for line in text.splitlines() if 'WARNING' in line]
        native_queries.append(dict(procedure=receipt['parameters']['procedure'], evidence_id=receipt['evidence_id'],
                                   profile_digest=receipt['analysis_profile']['digest'], normalized_sha256=sha(text.encode()),
                                   normalized_bytes=len(text.encode()), warning_count=len(warnings), warning_examples=warnings[:3],
                                   used_to_certify_dispatch_bounds=False))
    require({r['procedure'] for r in native_queries} == {r['declared_extent'][0] for r in selected}, 'Incomplete native query population')
    require(len(native_queries) == 12, 'Native query count differs')
    counterpart_paths = ['crates/azeroth-survivors-re/src/options.rs', 'crates/azeroth-survivors-re/src/armory.rs',
                         'crates/azeroth-survivors-re/src/progression.rs', 'crates/azeroth-survivors-re/src/raid_markers.rs',
                         'crates/azeroth-survivors-re/src/gameplay/raid_markers/geometry.rs',
                         'crates/azeroth-survivors-re/src/player_abilities/upgrades.rs',
                         'crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs',
                         'crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs',
                         'crates/azeroth-survivors-re/src/run_effects.rs',
                         'crates/azeroth-survivors-re/src/gameplay/mechanics/choices.rs']
    require(all((ROOT/p).is_file() for p in counterpart_paths), 'Missing existing source counterpart')
    proof = dict(schema_version=1, target=identity, gap_ids=[41], lead_ids=['Q41-F01', 'Q41-M01'],
                 generator=dict(path='scripts/check-q41-dispatch-contracts.py', sha256=file_sha256(ROOT/'scripts/check-q41-dispatch-contracts.py')),
                 inputs=inputs, native_ranges=spans, sites=rows, descriptor_contract=descriptor_contract,
                 options_guarded_caller=options_guards, immutable_options_input=option_input, marker_shape_producer=marker_guards,
                 marker_assignments=[dict(site=hex(i.address), bytes=i.bytes.hex(), instruction=i.mnemonic+' '+i.op_str) for i in shape_assignments],
                 choice_header_producers=header_guards, native_queries=native_queries, source_counterparts=counterpart_paths,
                 counts=dict(sites=13, queries=12, conditional_cells=sum(len(r['encoded_cells']) for r in rows), descriptor_inputs=113),
                 source_defect_established=False, complete_incoming_state=False, source_semantics_complete=False, parity_verified=False,
                 limits=['Every cell has an explicit conditional admission; it does not define the full table or every possible incoming state.',
                         'Mutable alias/descriptor ancestry, remaining negative/action/effect discriminants and executed branches stay unresolved.',
                         'Ghidra warnings and oversized neighboring bodies are retained as limitations, never inferred source contracts.',
                         'Existing source behavior is not reopened only for newest-target proof. No gameplay source changes, compilation or application/game/network execution.'])
    output = ROOT/'docs/analysis/evidence/0.115.0/q41-dispatch-contracts.json'
    if args.write:
        output.write_text(portable_json(proof, indent=2)+'\n')
    else:
        require(portable_record(json.loads(output.read_text())) == portable_record(proof), 'Retained dispatch proof differs')
    print(json.dumps(proof['counts'], sort_keys=True))


if __name__ == '__main__':
    main()
