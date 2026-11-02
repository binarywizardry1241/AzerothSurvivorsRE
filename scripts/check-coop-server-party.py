#!/usr/bin/env python3
"""Static current-target server-party proof: no compilation or target execution."""
import hashlib
import importlib.util
import json
import struct
from pathlib import Path

from coverage_common import latest_target, target_bytes

ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / 'docs/analysis/evidence/0.115.0/coop-server-party/manifest.json'
SOURCE = ROOT / 'crates/azeroth-survivors-re/src/coop/server_party.rs'


def check():
    manifest = json.loads(MANIFEST.read_text())
    target = latest_target(verify=True)
    assert target['sha256'] == manifest['target']['sha256']
    image = target_bytes(target)
    count = 0
    for row in manifest['functions']:
        offset = int(row['file_offset'], 16)
        size = int(row['end_exclusive'], 16) - int(row['start'], 16)
        assert hashlib.sha256(image[offset:offset + size]).hexdigest() == row['sha256'], row['start']
        count += 1
        if 'extract' in row:
            entry = row['extract']
            raw = (ROOT / entry['path']).read_bytes()
            assert hashlib.sha256(raw).hexdigest() == entry['sha256']
            assert all(line == line.rstrip() for line in raw.splitlines())
            count += 1
    spec = importlib.util.spec_from_file_location('coop_server_pe', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(image)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    # Whole owner hashes above bind instruction semantics. These independently
    # bind the serializer's nineteen dispatch targets and primitive byte writers.
    table = 0x146ccb14c
    branches = {1: 0x14581c6fd, 2: 0x14581d1b2, 3: 0x14581cb1c,
                4: 0x14581cb4f, 6: 0x14581d1ee, 7: 0x14581d25e,
                9: 0x14581d3ba, 16: 0x14581cb3e, 17: 0x14581c73c}
    for tag, expected in branches.items():
        target_address = table + struct.unpack('<i', raw(table + (tag - 1) * 4, 4))[0]
        assert target_address == expected
        assert bytes([0xb2, tag]) in raw(expected, 16), (tag, hex(expected))
        count += 1
    assert struct.unpack('<d', raw(0x145fabfe0, 8))[0] == 10.0
    count += 1
    # Current native class/race tables are the exact existing source mapping.
    for class_id, record in manifest['contracts']['hero_identity']['class_races'].items():
        index = int(class_id) - 1
        length = struct.unpack('<Q', raw(0x14700bcc0 + index * 8, 8))[0]
        pointer = struct.unpack('<Q', raw(0x14700bd18 + index * 8, 8))[0]
        assert pointer == int(record['address'], 16)
        assert list(raw(pointer, length)) == record['bytes']
        count += 1
    source = SOURCE.read_text()
    required = ['pub const GAME_VERSION: &str = "0.115.0"', 'pub const PROTOCOL_VERSION: u32 = 4',
                'MAX_MESSAGES_PER_CLIENT_TICK: usize = 200', 'REJECTION_DRAIN_SECONDS: f64 = 10.0',
                'allowed_races.contains(&hero.race)', '((0x5df >> (hero.class - 1)) & 1) == 0',
                '(0x800000..0xffff00).contains(&hero.guid)', 'other_client_guids.into_iter().any',
                'request.protocol != PROTOCOL_VERSION', 'request.version != GAME_VERSION.as_bytes()',
                'self.clients.remove(index)', 'self.next_slot.wrapping_add(1).max(1)',
                'now - since > REJECTION_DRAIN_SECONDS', 'Some(Err(reason))',
                'pub fn encode_lifecycle', 'pub fn decode_lifecycle', 'pub fn validate_hero_identity',
                'LifecyclePacket::Hero', 'LifecyclePacket::Roster', 'profile(&mut out, &hero.profile)?']
    for token in required:
        assert token in source, token
        count += 1
    admission = source[source.index('let rejection = match'):source.index('let slot = self.clients[index].slot')]
    positions = [admission.index('JoinRejected::' + key) for key in
                 ['NotHosting', 'DifferentVersion', 'WrongPassword', 'Full', 'RunUnderWay']]
    assert positions == sorted(positions)
    for reason in manifest['contracts']['rejection_reasons']:
        assert json.dumps(reason) in source
        count += 1
    print(f'PASS: {count} current-target range/extract/dispatch/table/source guards; '
          'Rust compilation, executable networking and game/parity validation not run')


if __name__ == '__main__':
    check()
