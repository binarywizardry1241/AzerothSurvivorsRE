#!/usr/bin/env python3
"""Bind missing source-path roles to current bytes and an immutable source tree."""
import argparse
from collections import Counter
import hashlib
import importlib.util
import re
import struct
import subprocess
from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path


def exact_resource_matches(image, needle, length, digest):
    """Search current contents; historical addresses have no selection role."""
    matches = set()
    at = image.find(needle)
    while at >= 0:
        for first in range(max(0, at + len(needle) - length), at + 1):
            raw = image[first:first + length]
            if len(raw) == length and hashlib.sha256(raw).hexdigest() == digest:
                matches.add(first)
        at = image.find(needle, at + 1)
    return sorted(matches)


def shader_comment(raw, path):
    return b'#define_import_path ' in raw and any(line.lstrip().startswith(b'//') and path in line for line in raw.splitlines())


def event_label(image, offset, raw_path):
    first = offset - len(b'event ')
    if first < 0:
        return None
    match = re.match(rb'event ' + re.escape(raw_path) + rb':([0-9]+)', image[first:])
    return (first, match.end(), int(match[1])) if match else None


def verify_location(raw, pointer, length, line, column):
    return len(raw) == 24 and struct.unpack('<QQII', raw) == (pointer, length, line, column)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source-tree', required=True, help='Exact immutable Git commit/tree used for source-file presence')
    parser.add_argument('--historical-resource-proof', required=True, help='Old byte commitments are search keys only; no old address is read')
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    if not re.fullmatch('[0-9a-f]{40}', args.source_tree):
        raise ValueError('An exact immutable source tree is required')
    target = latest_target(verify=True)
    generation = {'path': 'scripts/audit-native-source-roles.py', 'sha256': file_sha256(ROOT / 'scripts/audit-native-source-roles.py')}
    dependencies = [{'path': path, 'sha256': file_sha256(ROOT / path)} for path in ('scripts/inventory-current-target.py', 'scripts/inventory-executable.py', 'scripts/coverage_common.py')]
    diagnostic_path = ROOT / f"runtime/coverage/{target['sha256']}/diagnostic-ownership.json"
    diagnostic = load_json(diagnostic_path)
    if diagnostic['target']['sha256'] != target['sha256']:
        raise ValueError('Current diagnostic identity differs')
    proof_path = project_path(args.historical_resource_proof)
    old = load_json(proof_path)
    inputs = [{'path': path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(path)} for path in (diagnostic_path, proof_path)]
    tree = subprocess.check_output(['git', 'rev-parse', args.source_tree + '^{tree}'], cwd=ROOT).decode().strip()
    files = set(subprocess.check_output(['git', 'ls-tree', '-rz', '--name-only', tree], cwd=ROOT).decode().split('\0'))
    missing = [row for row in diagnostic['diagnostics'] if not row['custom_game_crate'] and row['path'] not in files]
    spec = importlib.util.spec_from_file_location('source_roles_pe', ROOT / 'scripts/inventory-current-target.py')
    parser_module = importlib.util.module_from_spec(spec); spec.loader.exec_module(parser_module)
    pe = parser_module.pe_parser(target_bytes(target))
    resources, roles = [], []
    old_resources = {row['path']: row for row in old.get('embedded_resource_paths', [])}
    def span(offset, length):
        raw = pe.data[offset:offset + length]
        if len(raw) != length:
            raise ValueError('Current source role bytes are not file-backed')
        return {'va': hex(pe.offset_va(offset)), 'byte_count': length, 'sha256': hashlib.sha256(raw).hexdigest()}
    for row in missing:
        path, locations, labels = row['path'], [], []
        for occurrence in row['diagnostic_occurrences']:
            offset, length = int(occurrence['file_offset'], 16), occurrence['byte_count']
            raw = pe.data[offset:offset + length]
            if hashlib.sha256(raw).hexdigest() != occurrence['sha256'] or raw.replace(b'\\', b'/') != path.encode():
                raise ValueError('Current diagnostic literal bytes differ')
            label = event_label(pe.data, offset, raw)
            if label:
                first, count, line = label
                labels.append(dict(span(first, count), source_line=line))
        for location in row['location_records']:
            address, pointer = int(location['location_address'], 16), int(location['path_address'], 16)
            offset = pe.rva_offset(address - pe.image_base)
            literal = next((value for value in row['diagnostic_occurrences'] if int(value['virtual_address'], 16) == pointer), None)
            if literal is None or not verify_location(pe.data[offset:offset + 24], pointer, literal['byte_count'], location['source_line'], location['source_column']):
                raise ValueError('Current Rust location descriptor differs')
            locations.append(dict(span(offset, 24), source_line=location['source_line'], source_column=location['source_column']))
        resource = old_resources.get(path)
        if resource:
            key = resource['resource']
            matches = exact_resource_matches(pe.data, path.encode(), key['byte_count'], key['sha256'])
            if len(matches) != 1:
                raise ValueError('Historical resource contents do not have one exact current match')
            first = matches[0]; raw = pe.data[first:first + key['byte_count']]
            if not shader_comment(raw, path.encode()):
                raise ValueError('Current path is not a witnessed embedded shader comment')
            address = pe.offset_va(first)
            if not any(pe.image_base + section['rva'] <= address < address + len(raw) <= pe.image_base + section['rva'] + min(section['virtual_size'], section['raw_size']) and not int(section['characteristics'], 16) & 0x80000000 for section in pe.sections):
                raise ValueError('Current shader is not immutable file-backed data')
            resources.append({'path': path, 'role': 'embedded-shader-comment', 'resource_path': resource['resource_path'],
                              'resource': span(first, len(raw)), 'file_offset': hex(first), 'unique_in_selected_image': True,
                              'historical_byte_commitment_used_only_as_current_content_search_key': True, 'historical_address_reused': False,
                              'source_revision_proven': False})
            role = 'embedded-shader-comment'
        else:
            role = 'rust-source-location' if locations else 'event-label-literals' if labels else 'literal-path-without-type-proof'
        roles.append({'path': path, 'role': role, 'rust_location_records': locations, 'tracing_event_labels': labels})
    result = {'schema_version': 1, 'target': {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
              'generator': generation, 'generator_dependencies': dependencies,
              'diagnostic_input': {'path': diagnostic_path.relative_to(ROOT).as_posix(), 'sha256': file_sha256(diagnostic_path)},
              'historical_resource_search_keys': {'path': args.historical_resource_proof, 'sha256': file_sha256(proof_path)},
              'source_snapshot': {'git_reference': args.source_tree, 'git_tree': tree},
              'counts': {'missing_source_paths_in_snapshot': len(missing), **dict(Counter(row['role'] for row in roles))},
              'embedded_resource_paths': resources, 'missing_candidate_source_roles': roles,
              'source_revision_proven': False, 'native_contract_match_established': False, 'gap_ids': [41],
              'limits': ['File absence refers only to the exact selected Git tree; it does not prove public/private source availability or the compiled revision.',
                         'Current bytes independently establish path descriptor/comment roles. Historical RVAs, public repository status and source identity are not promoted.',
                         'No diagnostic lead is excluded, and no actual function body ownership or runtime behavior is inferred.']}
    if any(file_sha256(project_path(row['path'])) != row['sha256'] for row in [generation] + dependencies + inputs):
        raise ValueError('Source-role generator/input changed during analysis')
    project_path(args.output).write_text(json_text(result))
    print(json_text(result['counts']))


if __name__ == '__main__':
    main()
