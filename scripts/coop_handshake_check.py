#!/usr/bin/env python3
"""Verify current protocol/version source wiring and optional bounded admission replay.

Uses the selected retained Ghidra proof; no discovery, compilation, application,
socket or server is invoked. Hero/State schemas are outside this check's scope.
"""
import argparse
import ast
import hashlib
import json
import re
import struct
import sys

from coverage_common import ROOT, latest_target, project_path, target_bytes
from script_sources import load_script


SOURCE = ROOT / 'crates/azeroth-survivors-re/src/coop/server_party.rs'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def correspondence_proof(manifest, image):
    """Reuse the canonical current extract instead of duplicating native bytes."""
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/camera/python-libs'))
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    row = next(row for row in manifest['ranges'] if row['role'] == 'exact-version-admission')
    assembly = project_path(row['assembly']['path'])
    assert digest(assembly) == row['assembly']['sha256']
    start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
    raw = image[int(row['file_offset'], 16):int(row['file_offset'], 16) + end - start]
    assert hashlib.sha256(raw).hexdigest() == row['sha256']
    instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start))
    assert sum(i.size for i in instructions) == end - start == row['byte_count'] == 58
    assert ''.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}\n' for i in instructions) == assembly.read_text()
    query = next(row for row in manifest['queries'] if row['role'] == 'join-admission')
    result = json.loads(project_path(query['result']['path']).read_text())['structuredContent']
    assert result['analysis_profile']['digest'] == query['analysis_profile_digest']
    assert hashlib.sha256(result['normalized_result'].encode()).hexdigest() == query['normalized_text_sha256']
    anchors = next(row for row in manifest['native_module_anchors']
                   if row['system_id'] == 'custom-game-server-party')
    owner = next(row for row in anchors['bounded_owners']
                 if row['runtime_function_start'] == query['procedure'])
    location = manifest['current_module_anchor_input']
    diagnostics = json.loads(project_path(location['path']).read_text())
    assert diagnostics['target'] == manifest['target']
    assert owner in next(row for row in diagnostics['diagnostics']
                         if row['path'] == anchors['diagnostic_path'])['verified_references']
    return {
        'target': manifest['target'],
        'query': {**query, 'provider': result['provider']},
        'module_location_evidence': location,
        'native_owner': {
            'virtual_address': owner['runtime_function_start'],
            'end_exclusive': owner['runtime_function_end'],
            'file_offset': owner['owner_file_offset'],
            'byte_count': owner['owner_byte_count'], 'sha256': owner['owner_sha256'],
        },
        'admission_range': {
            **row, 'virtual_address': row['start'], 'bytes_hex': raw.hex(),
            'instructions': [{'address': hex(i.address), 'bytes_hex': i.bytes.hex()}
                             for i in instructions],
        },
        'required_protocol': 5, 'required_version': manifest['target']['version'],
        'required_version_byte_count': 7, 'success_continuation': row['end_exclusive'],
        'version_rejection': '0x145b25506',
    }


def verify_proof(proof_path, expected_version):
    proof = json.loads(proof_path.read_text())
    target = latest_target(verify=True)
    for key in ('version', 'path', 'sha256', 'size_bytes'):
        assert target[key] == proof['target'][key], ('target mismatch', key)
    assert target['version'] == expected_version
    if 'ranges' in proof:
        proof = correspondence_proof(proof, target_bytes(target))
    assert proof['query']['provider']['id'] == 'ghidra'
    receipts = {}
    for name in ('plan', 'journal', 'result') + (('raw_input',) if 'raw_input' in proof['query'] else ()):
        row = proof['query'][name]
        path = project_path(row['path'])
        assert digest(path) == row['sha256'], ('query receipt changed', name)
        receipts[name] = row['sha256']
    result = json.loads(project_path(proof['query']['result']['path']).read_text())['structuredContent']
    assert result['evidence_id'] == proof['query']['evidence_id']
    assert result['subject']['digest']['sha256'] == target['sha256']
    assert result['provider'] == proof['query']['provider']
    assert int(result['parameters']['procedure'], 16) == int(proof['native_owner']['virtual_address'], 16)
    assert json.loads(project_path(proof['query']['journal']['path']).read_text())['status'] == 'completed'
    location = proof['module_location_evidence']
    assert digest(project_path(location['path'])) == location['sha256']
    image = target_bytes(target)
    pe = load_script('handshake_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    for name in ('native_owner', 'admission_range'):
        row = proof[name]
        start, end = int(row['virtual_address'], 16), int(row['end_exclusive'], 16)
        assert end - start == row['byte_count']
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        raw = image[offset:offset + row['byte_count']]
        assert hashlib.sha256(raw).hexdigest() == row['sha256'], (name, 'image bytes changed')
        if name == 'admission_range':
            assert raw == bytes.fromhex(row['bytes_hex'])
    owner, block = proof['native_owner'], proof['admission_range']
    assert int(owner['virtual_address'], 16) <= int(block['virtual_address'], 16)
    assert int(block['end_exclusive'], 16) <= int(owner['end_exclusive'], 16)
    assert int(proof['success_continuation'], 16) == int(block['end_exclusive'], 16)
    version = proof['required_version'].encode('ascii')
    assert len(version) == proof['required_version_byte_count'] == 7
    assert proof['required_protocol'] == 5 and version == expected_version.encode('ascii')
    cursor = int(block['virtual_address'], 16)
    parts = []
    for instruction in block['instructions']:
        raw = bytes.fromhex(instruction['bytes_hex'])
        assert int(instruction['address'], 16) == cursor and raw
        cursor += len(raw)
        parts.append(raw)
    assert cursor == int(block['end_exclusive'], 16)
    assert b''.join(parts) == bytes.fromhex(block['bytes_hex'])
    return proof, target, receipts


def verify_source(proof, allow_pending):
    source = SOURCE.read_text()
    version_match = re.search(r'pub const GAME_VERSION:\s*&str\s*=\s*("[^"]+")\s*;', source)
    protocol_match = re.search(r'pub const PROTOCOL_VERSION:\s*u32\s*=\s*(\d+)\s*;', source)
    assert version_match and protocol_match, 'shared admission constants missing'
    version = ast.literal_eval(version_match.group(1))
    protocol = int(protocol_match.group(1))
    assert protocol == proof['required_protocol'], 'source protocol mismatch'
    producer = source.split('impl JoinRequest {', 1)[1].split('\n}', 1)[0]
    assert re.search(r'pub fn current\(', producer)
    assert 'protocol: PROTOCOL_VERSION' in producer
    assert 'version: GAME_VERSION.as_bytes().to_vec()' in producer
    consumer = source.split('pub fn admit(', 1)[1].split('\n    pub fn ', 1)[0]
    compact = re.sub(r'\s+', ' ', consumer)
    assert 'request.protocol != PROTOCOL_VERSION || request.version != GAME_VERSION.as_bytes()' in compact
    assert 'JoinRejected::DifferentVersion' in consumer
    regression = source.split('fn native_lifecycle_wire_vectors()', 1)[1].split('\n    }', 1)[0]
    literal = re.search(r'let expected\s*=\s*(b"(?:[^"\\]|\\.)*")\s*;', regression)
    assert literal, 'fixed Join wire fixture missing'
    expected = (b'\x01' + struct.pack('<I', protocol)
                + struct.pack('<I', len(version.encode('ascii'))) + version.encode('ascii')
                + struct.pack('<I', 2) + b'pw')
    assert ast.literal_eval(literal.group(1)) == expected, 'fixed Join wire fixture differs from constants'
    assert 'JoinRequest::current(b"pw".to_vec())' in regression
    assert 'encode_lifecycle(&hello).unwrap(), expected' in regression
    assert 'decode_lifecycle(expected).unwrap(), (hello, expected.len())' in regression
    encoder = source.split('LifecyclePacket::Join(request) => {', 1)[1].split('\n        }', 1)[0]
    assert re.sub(r'\s+', ' ', encoder).strip() == (
        'out.push(1); out.extend_from_slice(&request.protocol.to_le_bytes()); '
        'bytes(&mut out, &request.version)?; bytes(&mut out, &request.password)?;')
    assert ('protocol: reader.u32()?, version: reader.bytes()?, password: reader.bytes()?,'
            in source)
    session_path = ROOT / 'crates/azeroth-survivors-re/src/coop/session.rs'
    session = session_path.read_text()
    direct = session.split('Some(DirectTcp::Join { address }) => {', 1)[1].split('\n            }', 1)[0]
    relay = session.split('pub fn service_join_with_flags(', 1)[1].split('\n    pub fn ', 1)[0]
    for route in (direct, relay):
        assert 'LifecyclePacket::Join(JoinRequest::current(' in route
        assert 'encode_lifecycle(&packet)' in route
    directory_path = ROOT / 'crates/azeroth-survivors-re/src/coop_directory.rs'
    directory = directory_path.read_text()
    assert ('version: azeroth_survivors_re::coop::server_party::GAME_VERSION.into(),'
            in directory.split('worker.submit(ClientMessage::Handshake {', 1)[1].split('});', 1)[0])
    if 'directory_protocol' in proof:
        service = (SOURCE.parent / 'service.rs').read_text()
        handshake = service.split('Self::Handshake { version, staff_key } => {', 1)[1].split('}', 1)[0]
        assert re.sub(r'\s+', ' ', handshake).strip() == (
            f"out.push(1); out.extend_from_slice(&{proof['directory_protocol']}u32.to_le_bytes()); "
            "string(&mut out, version)?; string(&mut out, staff_key)?; out.push(1);")
    connected = version == proof['required_version']
    if not connected:
        assert allow_pending, ('source GAME_VERSION pending', version, proof['required_version'])
        assert version == proof['source_first']['observed_source_version'], 'unexpected pending source state'
    return {'state': 'connected' if connected else 'pending', 'version': version,
            'protocol': protocol, 'path': str(SOURCE.relative_to(ROOT)),
            'sha256': digest(SOURCE), 'producer': 'JoinRequest::current',
            'consumer': 'PartyServer::admit', 'fixed_wire_literal_checked': True,
            'wire_fields_checked': True,
            'shared_routes': ['TCP Join', 'relay Join', 'server admission', 'directory Handshake'],
            'route_source_hashes': {str(path.relative_to(ROOT)): digest(path)
                                    for path in (session_path, directory_path)},
            'rust_regression_executed': False}


def replay(proof):
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RDX, UC_X86_REG_R10

    block = proof['admission_range']
    start = int(block['virtual_address'], 16)
    success = int(proof['success_continuation'], 16)
    rejection = int(proof['version_rejection'], 16)
    admitted = {int(row['address'], 16): bytes.fromhex(row['bytes_hex'])
                for row in block['instructions']}
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    low, high = min(start, success, rejection) & ~0xfff, (max(start, success, rejection) + 0x1000) & ~0xfff
    machine.mem_map(low, high - low)
    machine.mem_write(start, bytes.fromhex(block['bytes_hex']))
    # The hook stops before either continuation executes. Terminate Unicorn's
    # translation there too: decoding zero-filled continuation memory can cross
    # the mapped page before the hook is reached.
    machine.mem_write(success, b'\xcc')
    machine.mem_write(rejection, b'\xcc')
    packet, string = 0x20000000, 0x21000000
    machine.mem_map(packet, 0x1000)
    machine.mem_map(string, 0x1000)
    decisions, instructions = [], 0

    def hook(uc, address, size, unused):
        nonlocal instructions
        if address in (success, rejection):
            decisions.append(address == success)
            uc.emu_stop()
            return
        assert address in admitted, ('control escaped admitted compare block', hex(address))
        raw = admitted[address]
        assert size == len(raw) and bytes(uc.mem_read(address, size)) == raw
        instructions += 1

    machine.hook_add(UC_HOOK_CODE, hook)
    required_protocol = proof['required_protocol']
    required_version = proof['required_version'].encode('ascii')
    protocols = {0, 1, 3, 4, 5, 6, required_protocol, 0x7fffffff, 0x80000000, 0xffffffff}
    protocols.update(required_protocol ^ (1 << bit) for bit in range(32))
    versions = {b'', b'0.115.0', b'0.116.0', b'0.117.0', b'0.118.0', b'0.119.0',
                required_version, b'1' + required_version[1:], required_version[:-1],
                required_version + b'0', required_version + b'\0'}
    if proof['required_version'] == '0.120.0':
        versions.add(b'0.119.1')
    versions.update(required_version[:count] for count in range(len(required_version)))
    for index in range(len(required_version)):
        versions.add(required_version[:index] + b'\0' + required_version[index + 1:])
        for bit in range(8):
            value = bytearray(required_version)
            value[index] ^= 1 << bit
            versions.add(bytes(value))
    cases, accepted = 0, 0
    for protocol in sorted(protocols):
        for version in sorted(versions):
            decisions.clear()
            machine.mem_write(packet + 0x38, struct.pack('<I', protocol))
            machine.mem_write(packet + 0x18, struct.pack('<Q', len(version)))
            machine.mem_write(string, version + b'\0' * 16)
            machine.reg_write(UC_X86_REG_RDX, packet)
            machine.reg_write(UC_X86_REG_R10, string)
            machine.emu_start(start, max(success, rejection) + 1, count=64)
            expected = protocol == required_protocol and version == required_version
            assert decisions == [expected], (protocol, version.hex(), decisions)
            cases += 1
            accepted += int(expected)
    assert accepted == 1
    return {'cases': cases, 'accepted': accepted, 'rejected': cases - accepted,
            'protocol_fixtures': len(protocols), 'version_fixtures': len(versions),
            'native_instruction_count': instructions,
            'protocol_bit_mutations': 32, 'version_bit_mutations': len(required_version) * 8,
            'scope': 'Only the manifest-bound 58-byte comparison block; synthetic packet/string memory.'}


def main(proof_relative_path=None, expected_version=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof', default=proof_relative_path, required=proof_relative_path is None,
                        help='Retained admission proof; target identity is read from this record')
    parser.add_argument('--native', action='store_true', help='replay only the exact admitted comparison block')
    parser.add_argument('--allow-pending-source', action='store_true', help='evidence preparation only; permit the recorded old version')
    parser.add_argument('--output', help='optional bulk result path inside project runtime/')
    args = parser.parse_args()
    proof_path = project_path(args.proof)
    expected_version = expected_version or json.loads(proof_path.read_text())['target']['version']
    proof, target, receipts = verify_proof(proof_path, expected_version)
    source = verify_source(proof, args.allow_pending_source)
    result = {
        'target': {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
        'proof': {'path': str(proof_path.relative_to(ROOT)), 'sha256': digest(proof_path)},
        'receipt_digests': receipts, 'source': source,
        'native_admission': replay(proof) if args.native else None,
        'limits': ['Only exact protocol/version admission and shared source version wiring are checked.',
                   'No password/capacity/session, Hero or State schema revalidation.',
                   'Fixed Rust wire regression is inspected, not compiled or executed.',
                   'No discovery, application/client/server/network execution, build or original/rebuilt parity.'],
    }
    if args.output:
        output = project_path(args.output)
        assert output.is_relative_to(ROOT / 'runtime'), 'replay output belongs under runtime/'
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result, separators=(',', ':')))


if __name__ == '__main__':
    main()
