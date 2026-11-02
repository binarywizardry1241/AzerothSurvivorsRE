#!/usr/bin/env python3
"""Replay a manifest-bound admission gate without builds, sockets or a game."""
from portable_paths import portable_json

if __name__ == '__main__':
    from script_sources import run_contract
    run_contract(__file__)

import argparse
import hashlib
import json
import sys

from coverage_common import ROOT, latest_target, project_path, target_bytes
from coop_handshake_check import replay, verify_source
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


def verify(manifest, require_source=False):
    proof = json.loads(manifest.read_text())
    selected = latest_target(verify=True)
    assert all(selected[k] == proof['target'][k] for k in ('version', 'path', 'sha256', 'size_bytes'))
    image = target_bytes(selected)
    pe = load_script('admission_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    query = proof['query']
    native = json.loads(project_path(query['result']['path']).read_text())['structuredContent']
    verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
    assert hashlib.sha256(native['normalized_result'].encode()).hexdigest() == query['normalized_text_sha256']
    sys.path.insert(0, str(ROOT / 'runtime/camera-recovery-0.105.0/python-libs'))
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    for name in ('native_owner', 'admission_range'):
        row = proof[name]
        start, end = int(row['virtual_address'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        assert offset == int(row['file_offset'], 16) and end - start == row['byte_count']
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
        if name == 'admission_range':
            assert len(raw) == 58 and raw == bytes.fromhex(row['bytes_hex'])
            instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start))
            assert sum(i.size for i in instructions) == len(raw)
            assert row['instructions'] == [{'address': hex(i.address), 'bytes_hex': i.bytes.hex()} for i in instructions]
            assembly = project_path(row['assembly']['path'])
            assert hashlib.sha256(assembly.read_bytes()).hexdigest() == row['assembly']['sha256']
            assert assembly.read_text() == ''.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}\n' for i in instructions)
    location = proof['module_location_evidence']
    path = project_path(location['path'])
    assert hashlib.sha256(path.read_bytes()).hexdigest() == location['sha256']
    diagnostics = json.loads(path.read_text())
    assert diagnostics['target'] == proof['target']
    anchors = next(row for row in diagnostics['diagnostics'] if row['system_id'] == 'custom-game-server-party')
    assert proof['native_module_anchors'] and all(row in anchors['verified_references'] for row in proof['native_module_anchors'])
    assert all(row['runtime_function_start'] == proof['native_owner']['virtual_address'] for row in proof['native_module_anchors'])
    assert proof['required_version'] == selected['version']
    assert type(proof['required_protocol']) is int and 0 <= proof['required_protocol'] <= 0xffffffff
    assert proof['success_continuation'] == proof['admission_range']['end_exclusive']
    assert not int(proof['admission_range']['virtual_address'], 16) <= int(proof['version_rejection'], 16) < int(proof['success_continuation'], 16)
    source = verify_source(proof, allow_pending=not require_source)
    if source['state'] == 'pending':
        for row in proof['source_first']['paths']:
            assert hashlib.sha256(project_path(row['path']).read_bytes()).hexdigest() == row['sha256']
    dependencies = ('scripts/check-coop-admission.py', 'scripts/coop_handshake_check.py',
                    'scripts/discovery_native_subject.py')
    return {'target': proof['target'], 'manifest_sha256': hashlib.sha256(manifest.read_bytes()).hexdigest(),
            'check_sources': {name: hashlib.sha256(project_path(name).read_bytes()).hexdigest() for name in dependencies},
            'exact_version_admission': replay(proof), 'source': source,
            'limits': 'Only the exact original 58-byte gate and inspected shared source wiring. Raw Ghidra omits external/data context; no application compilation, source execution, sockets, server, game or parity comparison.'}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--manifest', required=True)
    parser.add_argument('--require-source', action='store_true', help='require connected source constants and fixed wire fixture')
    parser.add_argument('--output', help='Optional result below runtime/')
    args = parser.parse_args()
    result = verify(project_path(args.manifest), require_source=args.require_source)
    if args.output:
        output = project_path(args.output)
        assert output.is_relative_to(ROOT / 'runtime')
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(portable_json(result, indent=2) + '\n')
    print(json.dumps(result, separators=(',', ':')))
