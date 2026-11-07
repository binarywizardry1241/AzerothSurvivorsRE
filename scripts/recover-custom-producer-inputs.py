#!/usr/bin/env python3
"""Reproduce current static ability inputs and native factory first words.

Runs original instructions in the existing explicit Unicorn fixture, never a
game process or compilation. Static descriptor coverage is not a proof of all
mutable producers, indirect callers, queue writes or runtime parity.
"""
import argparse
from collections import Counter
import hashlib
import struct
import capstone

from coverage_common import ROOT, latest_target, load_json, json_text, file_sha256, project_path

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
BASE = 0x146bf5eb0
COUNT = 113
STRIDE = 120
TABLE_SHA = '5024b1bb850af4c469fa8402529a8bed1defb46d08925f923724d290aa9d7790'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', required=True)
    parser.add_argument('--summary-output', help='Optional compact durable contracts; the complete fixture rows remain in the runtime output')
    args = parser.parse_args()
    target = latest_target(verify=True)
    if target['version'] != '0.112.0' or target['sha256'] != SHA:
        raise ValueError('Exact current 0.112.0 producer fixture target required')
    generation = {'path': 'scripts/recover-custom-producer-inputs.py', 'sha256': file_sha256(ROOT / 'scripts/recover-custom-producer-inputs.py')}
    fixture_path = ROOT / 'scripts/native_talent_fixture.py'
    fixture_digest = file_sha256(fixture_path)
    import native_talent_fixture as native
    if native.target['sha256'] != SHA:
        raise ValueError('Native fixture target differs')
    pe, image = native.pe, native.data
    offset = pe.rva_offset(BASE - pe.image_base)
    raw = image[offset:offset + COUNT * STRIDE]
    if hashlib.sha256(raw).hexdigest() != TABLE_SHA:
        raise ValueError('113-descriptor native table differs')
    manifest_path = ROOT / 'docs/analysis/evidence/demonic-empowerment/manifest.json'
    manifest_digest = file_sha256(manifest_path)
    manifest = load_json(manifest_path)
    factory = next(row for row in manifest['ranges'] if int(row['address'], 16) == 0x1458a1730)
    start = pe.rva_offset(0x1458a1730 - pe.image_base)
    if hashlib.sha256(image[start:start + factory['byte_count']]).hexdigest() != factory['sha256']:
        raise ValueError('Canonical complete native factory range differs')
    def text(pointer, count):
        if count > 65535:
            raise ValueError('Unexpected descriptor text length')
        at = pe.rva_offset(pointer - pe.image_base)
        return image[at:at + count].decode('utf-8')
    machine = native.Machine()
    rows = []
    upgrade_domain = set()
    for index in range(COUNT):
        address = BASE + index * STRIDE
        record_offset = offset + index * STRIDE
        key_pointer, key_length = struct.unpack_from('<QQ', image, record_offset)
        upgrade_pointer, upgrade_count = struct.unpack_from('<QQ', image, record_offset + 48)
        if upgrade_count > 32:
            raise ValueError('Unexpected static upgrade slice length')
        if upgrade_count:
            upgrade_offset = pe.rva_offset(upgrade_pointer - pe.image_base)
            upgrade_bytes = image[upgrade_offset:upgrade_offset + upgrade_count]
        else:
            upgrade_bytes = b''
        upgrade_domain.update(upgrade_bytes)
        result = machine.alloc(112)
        machine.call(0x1458a1730, result, address)
        header = machine.q(result)
        effect_pointer, effect_count = machine.q(result + 56), machine.q(result + 64)
        if effect_count > 256:
            raise ValueError('Unexpected constructed effect count')
        choice = machine.alloc(0xa0)
        machine.put(choice + 0x78, header)
        machine.u.reg_write(native.UC_X86_REG_RAX, choice)
        machine.u.reg_write(native.UC_X86_REG_R9, 0)
        machine.u.emu_start(0x145966aea, 0x145966b16, count=32)
        selector = machine.u.reg_read(native.UC_X86_REG_RDX)
        if header >> 63 or selector != 1:
            raise ValueError('Static factory header no longer projects to the native nonnegative branch')
        rows.append({'index': index, 'key': text(key_pointer, key_length),
                     'descriptor': {'va': hex(address), 'byte_count': STRIDE,
                                    'sha256': hashlib.sha256(image[record_offset:record_offset + STRIDE]).hexdigest()},
                     'upgrade_types': {'pointer': hex(upgrade_pointer), 'length': upgrade_count,
                                       'hex': upgrade_bytes.hex(), 'sha256': hashlib.sha256(upgrade_bytes).hexdigest()},
                     'factory_selector_byte_0x75': image[record_offset + 0x75],
                     'factory_output_first_qword': hex(header), 'first_qword_signed_nonnegative': True,
                     'artificial_consumer_field_fixture_projection': selector,
                     'effect_tags': [machine.u.mem_read(effect_pointer + index * 64, 1)[0] for index in range(effect_count)]})
    projection_start = 0x145966aea
    projection_end = 0x145966b16
    projection_offset = pe.rva_offset(projection_start - pe.image_base)
    projection_raw = image[projection_offset:projection_offset + projection_end - projection_start]
    metadata = []
    for address, owner in ((0x1484713f8, 0x145961590), (0x148471614, 0x145964550),
                           (0x148471704, 0x145966a60), (0x148472e44, 0x145993420)):
        section = next(section for section in pe.sections if pe.image_base + section['rva'] <= address < pe.image_base + section['rva'] + section['virtual_size'])
        if section['name'] != '.pdata' or (address - pe.image_base - section['rva']) % 12:
            raise ValueError('Metadata reference is not a PE runtime-function entry start')
        offset = pe.rva_offset(address - pe.image_base)
        encoded = image[offset:offset + 12]
        begin, end, unwind = struct.unpack('<III', encoded)
        if pe.image_base + begin != owner or (begin, end, unwind) not in pe.functions():
            raise ValueError('PE metadata reference differs from the declared runtime-function entry')
        metadata.append({'reference_site': hex(address), 'entry_byte_count': 12, 'sha256': hashlib.sha256(encoded).hexdigest(),
                         'role': 'PE-pdata-RUNTIME_FUNCTION-BeginAddress-DWORD', 'owner_entry': hex(owner),
                         'end_exclusive': hex(pe.image_base + end), 'unwind_rva': hex(unwind), 'runtime_indirect_caller_inferred': False})
    # These exact native fragments are producer leads, not complete sum-type
    # bounds. In particular the iterator call has no recovered input writer.
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    def code_span(first, last):
        offset = pe.rva_offset(first - pe.image_base)
        encoded = image[offset:offset + last - first]
        decoded = list(decoder.disasm(encoded, first))
        if sum(instruction.size for instruction in decoded) != len(encoded):
            raise ValueError('Producer fragment does not completely decode')
        return {'va': hex(first), 'end_exclusive': hex(last), 'byte_count': len(encoded),
                'sha256': hashlib.sha256(encoded).hexdigest(), 'instructions':
                [{'site': hex(instruction.address), 'instruction_bytes': instruction.bytes.hex(),
                  'mnemonic': instruction.mnemonic, 'operands': instruction.op_str} for instruction in decoded]}
    literals = []
    for first, store, call, value, frame_offset, alias in (
            (0x14595d678, 0x14595d682, 0x14595d69a, 4, 0xb0, None),
            (0x14596525f, 0x145965269, 0x145965288, 3, 0x170, None),
            (0x145965674, 0x14596567e, 0x14596568c, 2, 0x60, 'RBX=RBP+0x60'),
            (0x1459657dd, 0x1459657e7, 0x1459657fb, 3, 0x170, 'R12=RBP+0x170'),
            (0x1459658dc, 0x1459658e6, 0x145965901, 4, 0x170, None)):
        at = pe.rva_offset(first - pe.image_base)
        if image[at:at + 10] != b'\x48\xb8' + struct.pack('<Q', (1 << 63) | value):
            raise ValueError('Exact producer niche literal differs')
        at = pe.rva_offset(call - pe.image_base)
        if image[at] != 0xe8 or call + 5 + struct.unpack_from('<i', image, at + 1)[0] != 0x145961590:
            raise ValueError('Exact producer constructor call differs')
        literals.append({'encoded_header': hex((1 << 63) | value), 'normalized_selector': value,
                         'header_store': hex(store), 'frame_offset': hex(frame_offset), 'call': hex(call),
                         'incoming_alias_precondition': alias, 'native_span': code_span(first, call + 5),
                         'all_incoming_paths_or_aliases_proved': False})
    choice_contracts = {
        'constructor_selector': code_span(0x145961600, 0x145961641),
        'accept_selector': code_span(0x145966adb, 0x145966b26),
        'pool_call': code_span(0x14595cb03, 0x14595cb10),
        'destination_vec': code_span(0x14595d711, 0x14595d71f),
        'returned_vec_copy': code_span(0x14595d7ac, 0x14595d7bb),
        'literal_constructor_inputs': literals,
        'weighted_learn_input': code_span(0x14595ce80, 0x14595ce9b),
        'weighted_learn_append': code_span(0x14595cc90, 0x14595ccb9),
        'weighted_upgrade_input': code_span(0x14595d2b7, 0x14595d2d6),
        'weighted_upgrade_append': code_span(0x14595d040, 0x14595d069),
        'weighted_selection_payload': code_span(0x14595d506, 0x14595d58c),
        'selected32_byte_append': code_span(0x14595d3d0, 0x14595d3fa),
        'selected_iterator_setup': code_span(0x14595d61c, 0x14595d663),
        'iterator_adapter': code_span(0x1459d9d2b, 0x1459d9d61),
        'iterator_cursor_read': code_span(0x1459ec044, 0x1459ec0ed),
        'constructor_niche_output_stores': [code_span(first, last) for first, last in
                                          ((0x14596256a, 0x145962578), (0x145962a4b, 0x145962a59),
                                           (0x145962b6f, 0x145962b84), (0x1459630a7, 0x1459630bc))],
        'constructor_upgrade_vector_source': code_span(0x145961e54, 0x145961e67),
        'constructor_upgrade_vector_output': code_span(0x145962ad9, 0x145962af9),
        'unresolved_iterator_call': {'call': '0x1459ec39b', 'native_input_copy': code_span(0x1459ec36d, 0x1459ec3a0),
                                     'copied_input': 'RBP-0x60..RBP-0x40 -> RBP+0xa0..RBP+0xc0',
                                     'earlier_sum_writer': '32-byte cursor buffer assembled from weighted selection in14595ca60',
                                     'all_caller_aliases_and_mutations_proved': False},
        'live_choice_domain_complete': False,
        'limits': ['Native literal caller fragments and the returned Vec copy are exact current code leads; they do not enumerate every live record mutation.',
                   'The constructor receives a32-byte sum, while accept reads that sum from160-byte display record+0x78.',
                   'The113 factory outputs are112-byte records with a different layout; their first words cannot supply the constructor sum domain.']}
    frame = machine.alloc(0x400)
    sum_input = machine.alloc(32)
    display_input = machine.alloc(160)
    contextual_prefixes = []
    for selector in range(5):
        header = 1 if selector == 1 else (1 << 63) | selector
        machine.put(sum_input, header)
        machine.u.reg_write(native.UC_X86_REG_RBP, frame)
        machine.u.reg_write(native.UC_X86_REG_R8, sum_input)
        machine.u.emu_start(0x145961600, 0x14596163f, count=32)
        if machine.u.reg_read(native.UC_X86_REG_RIP) != 0x14596163f:
            raise ValueError('Constructor prefix did not reach its computed JMP')
        constructor_destination = machine.u.reg_read(native.UC_X86_REG_RCX)
        machine.put(display_input + 0x78, header)
        machine.u.reg_write(native.UC_X86_REG_RAX, display_input)
        machine.u.reg_write(native.UC_X86_REG_R9, 0)
        machine.u.emu_start(0x145966aea, 0x145966b24, count=32)
        if machine.u.reg_read(native.UC_X86_REG_RIP) != 0x145966b24:
            raise ValueError('Accept prefix did not reach its computed JMP')
        accept_destination = machine.u.reg_read(native.UC_X86_REG_RDX)
        machine.u.reg_write(native.UC_X86_REG_RDX, selector)
        machine.u.emu_start(0x145993424, 0x145993435, count=16)
        if machine.u.reg_read(native.UC_X86_REG_RIP) != 0x145993435:
            raise ValueError('Magnitude prefix did not reach its computed JMP')
        magnitude_destination = machine.u.reg_read(native.UC_X86_REG_R9)
        destinations = []
        for base, actual in ((0x146c0c74c, constructor_destination), (0x146c0c7b0, accept_destination), (0x147220a7c, magnitude_destination)):
            at = pe.rva_offset(base - pe.image_base)
            expected = base + struct.unpack_from('<i', image, at + selector * 4)[0]
            if expected != actual:
                raise ValueError('Native contextual selector prefix differs from its exact table bytes')
            destinations.append(hex(actual))
        contextual_prefixes.append({'selector': selector, 'fixture_header': hex(header),
                                    'constructor_target': destinations[0], 'accept_target': destinations[1],
                                    'magnitude_target': destinations[2]})
    choice_contracts['contextual_native_prefix_replays'] = contextual_prefixes
    choice_contracts['contextual_replay_limits'] = ['Each32-byte or160-byte input is explicitly populated as a fixture; no whole constructor, Game queue lifecycle or arbitrary input alias is emulated.',
                                                   'The magnitude values are scoped to the extracted113 static upgrade slices, without asserting all live slice pointer ancestry.',
                                                   'No contextual target is automatically admitted as a globally guarded whole-domain edge.']
    payload = {'schema_version': 1, 'target': {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
               'generator': generation,
               'fixture': {'path': fixture_path.relative_to(ROOT).as_posix(), 'sha256': fixture_digest,
                           'seams_used': [hex(address) for address in sorted(machine.seams)]},
               'descriptor_table': {'va': hex(BASE), 'stride': STRIDE, 'count': COUNT, 'byte_count': len(raw), 'sha256': TABLE_SHA},
               'canonical_factory': {'manifest': manifest_path.relative_to(ROOT).as_posix(), 'manifest_sha256': manifest_digest,
                                     'va': factory['address'], 'byte_count': factory['byte_count'], 'sha256': factory['sha256']},
               'consumer_header_projection': {'va': hex(projection_start), 'byte_count': len(projection_raw), 'sha256': hashlib.sha256(projection_raw).hexdigest(),
                                              'fixture_field_offset': '0x78', 'copy_ancestry_into_live_choice_queue_proved': False,
                                              'factory_output_is_choice_sum_type': False,
                                              'evidence_role': 'artificial-scalar-projection-only'},
               'counts': {'static_descriptors': len(rows), 'factory_replays': len(rows), 'nonnegative_first_qwords': sum(row['first_qword_signed_nonnegative'] for row in rows),
                          'factory_selector_counts': dict(sorted(Counter(row['factory_selector_byte_0x75'] for row in rows).items()))},
               'static_upgrade_domain': sorted(upgrade_domain), 'rows': rows,
               'metadata_reference_roles': metadata,
               'choice_input_native_contracts': choice_contracts,
               'unresolved_boundaries': ['All writes/copy ancestry into live Game+0x658 choice records and their +0x78 headers still require separate producer proof.',
                                         'Magnitude dispatch observed encoded callers1458965c0,14596748a and1459f49d2 read runtime slices; their complete pointer/length producer ancestry remains separate.',
                                         'Negative jewelry/amulet headers and every mutation of the live sum type are not inferred from these113 positive factory outputs.'],
               'gap_ids': [41], 'runtime_game_validation': False, 'parity_verified': False,
               'limits': ['Only113 exact current immutable descriptors are enumerated; no complete dynamic or indirect-caller domain is asserted.',
                          'Heap/byte operations and English localization fallback retain the explicit shared fixture seams.',
                          'The header is inserted into the consumer field as an explicit fixture input; this does not establish live queue copy ancestry.',
                          'The factory112-byte output and constructor32-byte incoming choice sum have different layouts. Factory first words do not establish any learn/upgrade choice variant domain.',
                          'No compilation or game process.']}
    if bytes(machine.u.mem_read(BASE, len(raw))) != raw:
        raise ValueError('Native factory replay changed immutable descriptor inputs')
    if file_sha256(fixture_path) != fixture_digest or file_sha256(ROOT / generation['path']) != generation['sha256'] or file_sha256(manifest_path) != manifest_digest:
        raise ValueError('Producer fixture/generator changed during replay')
    output = project_path(args.output)
    output.write_text(json_text(payload))
    if args.summary_output:
        compact = {key: value for key, value in payload.items() if key not in ('rows', 'consumer_header_projection')}
        compact['static_upgrade_slices'] = [{'index': row['index'], 'key': row['key'], 'descriptor': row['descriptor'],
                                            'upgrade_types': row['upgrade_types'], 'factory_selector_byte_0x75': row['factory_selector_byte_0x75']} for row in rows]
        compact['full_fixture_inventory'] = {'path': output.relative_to(ROOT).as_posix(), 'sha256': file_sha256(output)}
        project_path(args.summary_output).write_text(json_text(compact))
    print(json_text({'counts': payload['counts'], 'static_upgrade_domain': payload['static_upgrade_domain']}))


if __name__ == '__main__':
    main()
