#!/usr/bin/env python3
"""Validate the narrow current-target AS adjacent-label exclusions; no compilation."""
import argparse
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes

PROOF = 'docs/analysis/evidence/native-custom-site-roles.json'
PATH = 'crates/wenilla-rogue/src/game/auras.rs'
SITES = {0x145994020, 0x14599456f, 0x14591c62d, 0x1459284ea, 0x1459294ad}
COUNTS = {'bounds-failure-location': 67, 'missing-key-failure-location': 1,
          'formatted-failure-location': 23, 'checked-vector-removal-location': 2,
          'option-failure-location': 1, 'adjacent-literal-reference': 2}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def verify_inventory(payload, target, pe=None, data=None):
    """Return only proved (site VA, path) exclusions; preserve raw census records.

    All source/descriptor/consumer code spans must fit a single unambiguous,
    executable, file-backed PE mapping. Data spans use the same file-backed
    barrier. Runtime audit totals are descriptive; only the five exact pairs
    become exclusions. No function ownership or source equivalence is inferred.
    """
    if not isinstance(payload, dict):
        payload = json.loads(project_path(payload).read_text())
    require(payload['schema_version'] == 1, 'unsupported schema')
    for dependency in [payload['validator'], *payload['dependencies']]:
        require(hashlib.sha256(project_path(dependency['path']).read_bytes()).hexdigest() == dependency['sha256'],
                'validator/dependency digest mismatch')
    require(all(payload['target'][key] == target[key]
                for key in ('version', 'sha256', 'size_bytes')), 'target mismatch')
    data = target_bytes(target) if data is None and pe is None else (pe.data if data is None else data)
    require(len(data) == target['size_bytes'] and hashlib.sha256(data).hexdigest() == target['sha256'],
            'current target bytes mismatch')
    if pe is None:
        spec = importlib.util.spec_from_file_location('custom_site_pe', ROOT / 'scripts/inventory-executable.py')
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        pe = module.PE(data)

    def bound(record, code=False):
        start, size = int(record['va'], 16), record['byte_count']
        require(isinstance(size, int) and size > 0, 'empty/invalid span')
        rva = start - pe.image_base
        overlapping = [section for section in pe.sections
                       if section['rva'] < rva + size and rva < section['rva'] + max(section['virtual_size'], section['raw_size'])]
        require(len(overlapping) == 1, 'span overlaps multiple/no PE sections')
        section = overlapping[0]
        require(section['rva'] <= rva and rva + size <= section['rva'] + min(section['virtual_size'], section['raw_size']),
                'span exceeds the file-backed loaded section')
        flags = int(section['characteristics'], 16)
        require(not code or flags & 0x20000000, 'code span is not executable')
        offset = section['raw_offset'] + rva - section['rva']
        require(0 <= offset and offset + size <= len(data), 'span exceeds file')
        value = data[offset:offset + size]
        require(hashlib.sha256(value).hexdigest() == record['sha256'], 'span hash mismatch')
        require('hex' not in record or value.hex() == record['hex'], 'span hex mismatch')
        require('file_offset' not in record or int(record['file_offset'], 16) == offset, 'file offset mismatch')
        return value

    def call_target(record):
        value = bound(record, True)
        require(len(value) == 5 and value[0] == 0xe8, 'not a direct CALL')
        return int(record['va'], 16) + 5 + struct.unpack('<i', value[1:])[0]

    result = set()
    for row in payload['exclusions']:
        site = int(row['site'], 16)
        pair = (site, row['path'])
        require(site in SITES and row['path'] == PATH and pair not in result, 'unexpected/duplicate exclusion')
        require(row['role'] == 'adjacent-literal-reference', 'unexpected role')
        source = row['source_instruction']
        value = bound(source, True)
        require(int(source['va'], 16) == site and len(value) == 7
                and value[:3] in (bytes.fromhex('488d05'), bytes.fromhex('4c8d05')), 'not expected RIP-relative LEA')
        destination = site + 7 + struct.unpack('<i', value[3:])[0]
        require(destination == int(source['decoded_target'], 16) == int(row['literal']['va'], 16), 'LEA/literal target mismatch')
        require(bound(row['literal']) == b'spell' and row['pointed_literal_length'] == 5, 'literal is not five-byte spell')
        filename = row['filename']
        require(int(filename['va'], 16) == destination + 5 == int(row['diagnosed_filename_start'], 16), 'filename is not adjacent')
        require(bound(filename).decode().replace('\\', '/') == row['path'], 'filename mismatch')
        consumer = row['consumer']
        whole = bound(consumer['producer_to_consumer_code'], True)
        begin = int(consumer['producer_to_consumer_code']['va'], 16)
        call = int(consumer['call_instruction']['va'], 16)
        require(begin <= site and begin + len(whole) == call + 5, 'producer/consumer range mismatch')
        require(call_target(consumer['call_instruction']) == int(consumer['entry'], 16), 'consumer target mismatch')
        require(whole[site - begin:site - begin + 7] == value, 'producer is outside consumer span')
        require(whole[-5:] == bound(consumer['call_instruction'], True), 'CALL is not range terminator')
        if 'descriptor' in row:
            descriptor = row['descriptor']
            require(value[:3] == bytes.fromhex('488d05') and consumer['entry'] == '0x1458ec8b0', 'descriptor contract mismatch')
            require(descriptor['base_register'] == 'rbp' and descriptor['explicit_length'] == 5
                    and consumer['argument_register'] == 'r9', 'descriptor register/length mismatch')
            produced = bound(descriptor['producer_code'], True)
            require(int(descriptor['producer_code']['va'], 16) == site and whole[site-begin:site-begin+len(produced)] == produced, 'descriptor producer mismatch')
            if site == 0x14591c62d:
                pointer, length, count = '-0x8', '0x0', 1
                pointer_store, length_store, argument = '488945f8', '48c7450005000000', '4c8d4df8'
            else:
                pointer, length = '0x168', '0x170'
                count = 1 if site == 0x145994020 else 2
                pointer_store, length_store, argument = '48898568010000', '48c7857001000005000000', '4c8d8d68010000'
            require((descriptor['pointer_offset'], descriptor['length_offset']) == (pointer, length), 'descriptor offsets mismatch')
            require(produced == value + bytes.fromhex(pointer_store + length_store), 'descriptor pointer/length stores mismatch')
            require(bound(descriptor['length_instruction'], True) == bytes.fromhex(length_store), 'explicit length witness mismatch')
            require(consumer['descriptor_count'] == count and bytes.fromhex('48c7442420' + count.to_bytes(4, 'little').hex()) in whole
                    and bytes.fromhex(argument) in whole, 'descriptor CALL arguments mismatch')
        else:
            contract = row['pointer_length_arguments']
            require(site in (0x1459284ea, 0x1459294ad) and value[:3] == bytes.fromhex('4c8d05')
                    and consumer['entry'] == '0x1458e6910', 'pointer/length contract mismatch')
            require((contract['pointer_register'], contract['length_register'], contract['explicit_length']) == ('r8', 'r9d', 5), 'argument registers/length mismatch')
            require(bound(contract['length_instruction'], True) == bytes.fromhex('41b905000000')
                    and int(contract['length_instruction']['va'], 16) == begin and site == begin + 12, 'length setup mismatch')
            forwarded = bound(contract['callee_forwarding_code'], True)
            require(forwarded[:9] == bytes.fromhex('4889d14c89c24d89c8') and len(forwarded) == 14
                    and forwarded[9] == 0xe8, 'pointer/length forwarding mismatch')
            sink = int(contract['callee_forwarding_code']['va'], 16) + 14 + struct.unpack('<i', forwarded[10:])[0]
            require(sink == int(contract['forwarded_call'], 16) == 0x1458eb470
                    and contract['forwarded_pointer_register'] == 'rdx' and contract['forwarded_length_register'] == 'r8', 'forwarded arguments mismatch')
        result.add(pair)
    require({site for site, _ in result} == SITES, 'incomplete exclusions')
    audit = payload['audit']
    require(audit['raw_reference_count'] == 96 and audit['actual_source_locations'] == 94
            and audit['adjacent_literal_references'] == 2 and audit['declared_pe_extents'] == 20
            and audit['declared_extent_membership_is_function_ownership'] is False
            and audit['role_counts'] == COUNTS, 'audit summary mismatch')
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof', default=PROOF)
    parser.add_argument('--check-audit', action='store_true', help='also hash-check the ignored full 96-site audit and null-owner boundary')
    parser.add_argument('--negative-tests', action='store_true')
    args = parser.parse_args()
    payload = json.loads(project_path(args.proof).read_text())
    target = latest_target(verify=True)
    data = target_bytes(target)
    result = verify_inventory(payload, target, data=data)
    if args.check_audit:
        audit_bytes = project_path(payload['audit']['path']).read_bytes()
        require(hashlib.sha256(audit_bytes).hexdigest() == payload['audit']['sha256'], 'full audit digest mismatch')
        audit = json.loads(audit_bytes)
        require(len(audit['reference_records']) == 96 and audit['role_counts'] == COUNTS
                and all(row['actual_native_owner'] is None for row in audit['reference_records']), 'full audit boundary mismatch')
        # Native read-back and Location layout are already independently retained
        # in the finite runtime producer; this option binds its exact snapshot.
        print('Full 96-site audit snapshot hash and null-owner boundary: PASS')
    if args.negative_tests:
        mutations = [lambda p: p['target'].update(sha256='0'*64),
                     lambda p: p['exclusions'].append(copy.deepcopy(p['exclusions'][0])),
                     lambda p: p['exclusions'][0]['source_instruction'].update(decoded_target='0x14722a095'),
                     lambda p: p['exclusions'][0].update(pointed_literal_length=38),
                     lambda p: p['exclusions'][0]['filename'].update(va='0x14722a090'),
                     lambda p: p['exclusions'][0]['descriptor'].update(explicit_length=38),
                     lambda p: p['exclusions'][0]['consumer'].update(descriptor_count=2),
                     lambda p: p['exclusions'][3]['pointer_length_arguments'].update(length_register='edx')]
        for mutate in mutations:
            invalid = copy.deepcopy(payload)
            mutate(invalid)
            try:
                verify_inventory(invalid, target, data=data)
            except ValueError:
                pass
            else:
                raise ValueError('negative mutation was accepted')
        print('Negative target/duplicate/alias/length/descriptor/register checks: 8 PASS')
    print(f'Current-target AS source-role exclusions: PASS ({len(result)} exact site/path pairs; 94 Location audit preserved)')


if __name__ == '__main__':
    main()
