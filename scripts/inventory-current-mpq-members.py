#!/usr/bin/env python3
"""Account for the selected installed MPQ tables and names without extracting assets.

--write saves hash-bound row inventories and a compact evidence manifest. The
default reproduces and verifies them. Existing engine archive precedence is a
source observation, not proof of native mounting, resource semantics or parity.
"""
import argparse
from collections import defaultdict
import hashlib
import json
from pathlib import PurePosixPath, PureWindowsPath
import re
import struct

from coverage_common import ROOT, file_sha256, json_text, latest_target, load_json, verify_resources
from script_sources import load_script


def supported_source_order(target):
    """Project the inspected patch-only source domain; reject other mount rules.

    The engine also supports base archives and speech2, and ignores nested and
    multi-character patch names. Those domains require their own explicit
    projection; never assign them invented lexical priority here.
    """
    directory = PurePosixPath(target['runtime_data']['directory'])
    records = target['runtime_data']['archives']
    seen = set()
    for row in records:
        path = PurePosixPath(row['path'])
        name = path.name.lower()
        if (path.parent != directory or not path.name.isascii()
                or not (name == 'patch.mpq' or re.fullmatch(r'patch-.\.mpq', name))):
            raise ValueError('Archive outside reviewed top-level patch-only source order: ' + row['path'])
        if name in seen:
            raise ValueError('Ambiguous case-insensitive archive name: ' + row['path'])
        seen.add(name)
    return sorted(records, key=lambda row: (PurePosixPath(row['path']).name.lower() != 'patch.mpq',
                                           PurePosixPath(row['path']).name.lower()))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    verify_resources(target)
    identity = {key: target[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    work = ROOT / 'runtime/coverage' / target['sha256'] / 'mpq-members'
    output = ROOT / 'docs/analysis/evidence/mpq-member-coverage.json'
    parser_path = ROOT / 'scripts/check-minimap-lifecycle.py'
    mpq = load_script('current_mpq_reader', parser_path)
    records = supported_source_order(target)
    members, archives, by_name = [], [], defaultdict(list)
    canonical = lambda name: name.replace('/', '\\').upper()
    for priority, record in enumerate(records):
        archive = mpq.Archive(record['path'])
        if archive.size != record['size_bytes'] or file_sha256(archive.path) != record['sha256']:
            raise ValueError('Archive identity differs: ' + record['path'])
        entry = archive.lookup('(listfile)')
        if entry is None:
            raise ValueError('Archive has no listfile: ' + record['path'])
        listed = archive.read(entry)
        names = [line.strip() for line in listed.decode('utf-8-sig').splitlines() if line.strip()]
        if len(set(map(canonical, names))) != len(names):
            raise ValueError('Duplicate canonical listfile name')
        names = sorted(set(names + ['(listfile)']), key=canonical)
        hashed = defaultdict(list)
        for name in names:
            hashed[(mpq.name_hash(name, 0x100), mpq.name_hash(name, 0x200))].append(name)
        active, named, blocks, opaque = 0, set(), set(), []
        for slot, (ha, hb, locale, platform, index) in enumerate(struct.iter_unpack('<IIHHI', archive.hashes)):
            if index in (0xFFFFFFFF, 0xFFFFFFFE):
                continue
            active += 1
            offset, packed, size, flags = struct.unpack_from('<IIII', archive.blocks, index * 16)
            if not flags & 0x80000000 or offset + packed > archive.size:
                raise ValueError('Invalid active block')
            candidates = hashed.get((ha, hb), [])
            if not candidates:
                opaque.append(slot)
            for name in candidates:
                if archive.lookup(name) != (offset, packed, size, flags):
                    raise ValueError('Listfile hash/probe mismatch')
                named.add(canonical(name))
            blocks.add(index)
            row = dict(archive=record['path'], source_priority=priority, hash_slot=slot,
                       hash_a=hex(ha), hash_b=hex(hb), locale=locale, platform=platform,
                       block_index=index, file_offset=offset, packed_bytes=packed,
                       uncompressed_bytes=size, flags=hex(flags), names=candidates)
            members.append(row)
            for name in candidates:
                by_name[canonical(name)].append(row)
        if named != set(map(canonical, names)):
            raise ValueError('Listfile contains names without active blocks')
        existing = {i for i, row in enumerate(struct.iter_unpack('<IIII', archive.blocks)) if row[3] & 0x80000000}
        archives.append(dict(path=record['path'], sha256=record['sha256'], size_bytes=archive.size,
                             hash_table_sha256=hashlib.sha256(archive.hashes).hexdigest(),
                             block_table_sha256=hashlib.sha256(archive.blocks).hexdigest(),
                             listfile_sha256=hashlib.sha256(listed).hexdigest(), listed_names=len(names),
                             active_hash_slots=active, opaque_hash_slots=opaque,
                             blocks_without_active_hash=sorted(existing - blocks), source_priority=priority))
    resolved = [dict(name=name, occurrences=len(rows),
                     source_archive=max(rows, key=lambda row: row['source_priority'])['archive'],
                     overridden_archives=sorted({row['archive'] for row in rows[:-1]}))
                for name, rows in sorted(by_name.items())]
    summary = load_json('docs/analysis/coverage/native-summary.json')
    if summary['target'] != identity:
        raise ValueError('Current PE inventory target differs')
    inventory = load_json(summary['inventory']['path'])
    if file_sha256(summary['inventory']['path']) != summary['inventory']['sha256']:
        raise ValueError('Current PE inventory commitment differs')
    basename = defaultdict(list)
    for name in by_name:
        basename[PureWindowsPath(name).name].append(name)
    leads = []
    for ordinal, row in enumerate(inventory['embedded_candidates']['resource_path']):
        key = canonical(row['literal'])
        leads.append(dict(selector=f'Q41-I01:resource_path:{ordinal}', **row,
                          exact_member=key if key in by_name else None,
                          basename_candidates=[] if key in by_name else basename[PureWindowsPath(key).name],
                          semantic_status='unrecovered_native_resource_consumer'))
    chain_path = ROOT / 'crates/benilla-formats/src/chain.rs'
    chain = chain_path.read_text()
    if 'Ascending priority: later archives win' not in chain or 'self.archives.iter().rev()' not in chain:
        raise ValueError('Source archive precedence requires review')
    outputs = {}
    for name, rows in [('members.jsonl', members), ('source-overrides.jsonl', resolved), ('resource-leads.jsonl', leads)]:
        path = work / name
        raw = ''.join(json.dumps(row, ensure_ascii=False, separators=(',', ':')) + '\n' for row in rows).encode()
        if args.write:
            work.mkdir(parents=True, exist_ok=True)
            path.write_bytes(raw)
        elif path.read_bytes() != raw:
            raise ValueError('Member inventory changed: ' + name)
        outputs[name] = dict(path=path.relative_to(ROOT).as_posix(), sha256=hashlib.sha256(raw).hexdigest(), records=len(rows), bytes=len(raw))
    result = dict(schema_version=1, target=identity, gap_ids=[41], lead_ids=['Q41-R01', 'Q41-D03'],
                  generator=dict(path='scripts/inventory-current-mpq-members.py', sha256=file_sha256(__file__)),
                  parser=dict(path=parser_path.relative_to(ROOT).as_posix(), sha256=file_sha256(parser_path)),
                  source_chain=dict(path=chain_path.relative_to(ROOT).as_posix(), sha256=file_sha256(chain_path)),
                  native_resource_candidate_input=summary['inventory'], archives=archives, outputs=outputs,
                  counts=dict(archives=len(archives), active_hash_slots=len(members), unique_names=len(by_name),
                              opaque_hash_slots=sum(len(row['opaque_hash_slots']) for row in archives),
                              blocks_without_active_hash=sum(len(row['blocks_without_active_hash']) for row in archives),
                              resource_path_candidates=len(leads)),
                  limits=['Only listfiles and MPQ tables read; assets remain in installed archives.',
                          'Source priority is not target-specific mount/locale/resource proof.',
                          'Native consumers, schemas and IDs remain open; no compilation, execution or parity.'])
    # Recheck installed identities after the table walk, before publishing proof.
    if latest_target(verify=True) != target:
        raise ValueError('Installed inputs changed')
    verify_resources(target)
    if args.write:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json_text(result))
    elif load_json(output) != result:
        raise ValueError('Member proof changed')
    print(json_text(result['counts']).rstrip())


if __name__ == '__main__':
    main()
