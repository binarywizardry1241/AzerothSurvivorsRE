#!/usr/bin/env python3
"""Check current AS GameObject output and the shared template wire boundary.

Original instructions execute in Unicorn with the documented service seams.
Rust is parsed/inspected only; its tests are authored but not run. --stage writes
candidate evidence to runtime; default compares both curated proofs.
"""
import argparse
import hashlib
import json
import re
import struct

from creature_query_native import ROOT, T, D, PE, ENDS
from template_query_native import TemplateQueryProbe

WORK = ROOT / 'runtime/q41-object-query-0.113.2'
KEEP = ROOT / 'docs/analysis/evidence/0.113.2'


def sha(value):
    return hashlib.sha256(value).hexdigest()


def compact(value):
    return json.dumps(value, sort_keys=True, ensure_ascii=False, separators=(',', ':')).encode()


def strings(body, count, offset):
    result = []
    for _ in range(count):
        end = body.index(0, offset)
        result.append(body[offset:end].decode())
        offset = end + 1
    return result, offset


def decoded(opcode, body):
    entry, = struct.unpack_from('<I', body)
    if opcode == 0x5f:
        if entry & 0x80000000:
            return dict(kind='unknown_object', entry=entry & 0x7fffffff)
        type_id, display = struct.unpack_from('<II', body, 4)
        names, offset = strings(body, 5, 12)
        data = list(struct.unpack_from('<24i', body, offset))
        return dict(kind='object', entry=entry, name=names[0], type_id=type_id,
                    display_id=display, data=data)
    assert opcode == 0x61
    row = dict(kind='creature', entry=entry & 0x7fffffff if entry & 0x80000000 else entry,
        name=None, subname=None, creature_type=None, type_flags=0, pet_family=0,
        rank=0, pet_spell_list=0, display_id=0, civilian=False, racial_leader=False)
    if not entry & 0x80000000:
        names, offset = strings(body, 5, 4)
        flags, kind, family, rank, unused, spells, display, civilian, leader = struct.unpack_from('<7I2B', body, offset)
        row.update(name=names[0], subname=names[4] or None, creature_type=kind,
                   type_flags=flags, pet_family=family, rank=rank, pet_spell_list=spells,
                   display_id=display, civilian=bool(civilian), racial_leader=bool(leader))
    return row


def object_source():
    text = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/client/object_queries.rs').read_text()
    pairs = re.findall(r'(\d+(?:\.\.=\d+)?|_)\s*=>\s*\("(object\.[^"]+)",\s*"([^"]+)"\)', text)
    assert len(pairs) == 10
    names, fallback = {}, None
    for selector, key, name in pairs:
        if selector == '_':
            fallback = key, name
        else:
            bounds = list(map(int, selector.split('..=')))
            for entry in range(bounds[0], bounds[-1] + 1):
                names[entry] = key, name
    models = list(map(int, re.search(r'\[([\d, ]+)\]\[index as usize\]', text)[1].split(', ')))
    assert len(models) == 9 and len(names) == 13
    for token in ['entry.checked_sub(9005)', 'Some(index @ 0..=8)',
                  'if index == 0 { 3 } else { 5 }', '_ => (5, 2614)', 'data: [0; 24]',
                  'super::query_packets::decode(query_with(entry,', 'locale.lookup(key).unwrap_or(fallback)']:
        assert token in text
    return names, fallback, models


def encode_object(entry, name, type_id, display):
    return struct.pack('<3I', entry, type_id, display) + name.encode() + bytes(5 + 96)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    args = ap.parse_args()
    names, fallback, models = object_source()
    probe = TemplateQueryProbe()
    english = probe.locale.copy()
    def spec(entry, locale):
        key, raw = names.get(entry, fallback)
        index = entry - 9005
        display = models[index] if 0 <= index < 9 else 2614
        type_id = 3 if index == 0 else 5
        return key, raw, type_id, display, locale.get(key, raw)
    output_hash = hashlib.sha256()
    for entry in range(65536):
        key, raw, type_id, display, name = spec(entry, english)
        opcode, packet = probe.response(0x5e, entry)
        assert opcode == 0x5f and packet == encode_object(entry, name, type_id, display), entry
        assert probe.keys == {key}
        output_hash.update(struct.pack('<I', len(packet)) + packet)
        if (entry + 1) % 8192 == 0:
            print(f'native GameObject entries: {entry + 1}/65536', flush=True)
    entries = [0, 9000, *range(9001, 9014), 9014, 65535, 0x7fffffff]
    cases = []
    for entry in entries:
        key, raw, type_id, display, name = spec(entry, english)
        cases.append(dict(entry=entry, key=key, raw_name=raw, type_id=type_id,
                          display_id=display, name=name))
    locales = {}
    for code in ['en', 'pl', 'cs', 'de', 'pt', 'es', 'fr', 'ro', 'tr', 'ru', 'uk', 'zh', 'ja', 'ko', 'missing']:
        locale = {} if code == 'missing' else json.loads(
            (ROOT / f'crates/azeroth-survivors-re/assets/locales/{code}.json').read_text())
        probe.locale = locale
        packets = []
        for entry in entries:
            key, raw, type_id, display, name = spec(entry, locale)
            opcode, body = probe.response(0x5e, entry)
            assert opcode == 0x5f and body == encode_object(entry, name, type_id, display)
            packets.append(body.hex())
        locales[code] = dict(cases=len(entries), sha256=sha(compact(packets)))
    boundaries = []
    for entry in [65536, 0x80000000, 0x8000232d, 0xffffffff]:
        key, raw, type_id, display, name = spec(entry, {})
        opcode, body = probe.response(0x5e, entry)
        assert body == encode_object(entry, name, type_id, display)
        boundaries.append(dict(entry=entry, decoded=decoded(opcode, body)))
    payloads = []
    for entry in [0, 9001, 9005, 9013, 65535]:
        for length in range(16):
            payload = (struct.pack('<I', entry) + b'\xff' * 12)[:length]
            parsed = int.from_bytes(payload[:4], 'little')
            key, raw, type_id, display, name = spec(parsed, {})
            opcode, body = probe.response(0x5e, parsed, payload)
            assert body == encode_object(parsed, name, type_id, display)
            payloads.append(dict(payload=payload.hex(), packet=body.hex()))
    native_ranges, evidence = [], []
    for address in [0x145809000, 0x1458d58f0]:
        offset = PE.rva_offset(address - PE.image_base)
        native_ranges.append(dict(start=hex(address), end_exclusive=hex(ENDS[address]),
            sha256=sha(D[offset:offset + ENDS[address]-address])))
    for path in sorted((WORK / 'rea-object-query').glob('*procedure_pseudo_code*.json')):
        ev = json.loads(path.read_text())['response']['result']['structuredContent']
        assert ev['subject']['digest']['sha256'] == T['sha256']
        evidence.append(dict(evidence_id=ev['evidence_id'], operation=ev['operation'], parameters=ev['parameters']))
    wire_cases = []
    for entry in [0, 9001, 9005, 9006, 9013, 0x8000232d, 0xffffffff]:
        probe.locale = english
        key, raw, type_id, display, name = spec(entry, english)
        opcode, body = probe.response(0x5e, entry)
        wire_cases.append(dict(kind='object', entry=entry, type_id=type_id, display_id=display,
                               name=name, opcode=opcode, packet_hex=body.hex(), decoded=decoded(opcode, body)))
    for value in ['', 'Cache\0tail', 'Café 青', 'A\0B\0C\0D\0E\0F']:
        probe.locale = dict(english, **{'object.cache': value})
        opcode, body = probe.response(0x5e, 9005)
        assert body == encode_object(9005, value, 3, 259)
        wire_cases.append(dict(kind='object', entry=9005, type_id=3, display_id=259, name=value,
                               opcode=opcode, packet_hex=body.hex(), decoded=decoded(opcode, body)))
    creature_proof = json.loads((KEEP / 'creature-queries.json').read_text())
    known = {r['entry']: r for r in creature_proof['hits']}
    for entry, overrides in [(600, {}), (690, {}), (9613, {}), (9513, {}), (0x80000258, {}),
            (600, {'enemy.600': 'Mob\0tail'}), (600, {'zone.elwynn.subtitle': 'Sub\0tail'}),
            (600, {'enemy.600': '青\0x', 'zone.elwynn.subtitle': 'Zone\0more'}),
            (600, {'enemy.600': ''}), (600, {'enemy.600': 'A\0B\0C\0D\0E\0F'})]:
        probe.locale = dict(english, **overrides)
        row = known.get(entry)
        if row:
            name = probe.locale.get(row['name_key'], row['raw_name']) if row['name_key'] else row['raw_name']
            subname = probe.locale.get(row['subname_key'], row['raw_subname']) if row['subname_key'] else row['raw_subname']
            kind, rank, display = row['fields'][1], row['fields'][3], row['fields'][6]
        else:
            name, subname, kind, rank, display = None, None, None, 0, 0
        opcode, body = probe.response(0x60, entry)
        expected = struct.pack('<I', entry | 0x80000000) if name is None else (
            struct.pack('<I', entry) + name.encode() + bytes(4) + (subname or '').encode() + bytes(1) +
            struct.pack('<7I2B', 0, kind, 0, rank, 0, 0, display, 0, 0))
        assert opcode == 0x61 and body == expected
        wire_cases.append(dict(kind='creature', entry=entry, name=name, subname=subname,
            creature_type=kind, rank=rank, display_id=display, opcode=opcode,
            packet_hex=body.hex(), decoded=decoded(opcode, body)))
    bridge = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/client/query_packets.rs').read_text()
    for token in ['benilla_protocol::messages::parse_server(opcode, &body).ok()?',
                  'benilla_protocol::decode(packet).into_iter().next()', 'body.extend_from_slice(value.as_bytes())',
                  'body.push(0)', 'entry | 0x8000_0000', 'type_flags', 'creature_type.unwrap_or(0)',
                  'pet_spell_list', 'u8::from(civilian)', '(0x61, body)', '(0x5f, body)']:
        assert token in bridge, token
    for path in ['creature_queries.rs', 'object_queries.rs']:
        assert 'super::query_packets::decode(query_with(entry,' in (
            ROOT / 'crates/azeroth-survivors-re/src/gameplay/client' / path).read_text()
    common_limits = ['Original AS instructions execute with allocator/growth/memory/formatting/locale seams and synthetic host/buffers; sender is intercepted.',
        'Rust serializers, actual wire parser, events/cache and FrameXML are not executed; Python decoder projection follows the inspected reused parser source.',
        'Native byte agreement plus source guards does not certify compilation, dynamic aliases, actual client/UI or original/rebuilt parity.']
    result = dict(schema_version=1, target=T, gap_ids=[41, 49, 65], cases=cases,
        native_ranges=native_ranges, ghidra_evidence=evidence,
        incoming_contract_ref='docs/analysis/evidence/0.113.2/creature-queries.json',
        u16_entries_tested=65536, native_packets_sha256=output_hash.hexdigest(), locales=locales,
        u32_boundaries=boundaries, payload_cases=len(payloads), payload_sha256=sha(compact(payloads)),
        limits=common_limits)
    wire = dict(schema_version=1, target=T, gap_ids=[41, 64, 65], cases=wire_cases,
        creature_producer_ref='docs/analysis/evidence/0.113.2/creature-queries.json',
        object_producer_ref='docs/analysis/evidence/0.113.2/object-queries.json',
        decoder_sources=['crates/benilla-protocol/src/messages/gameobject.rs',
                         'crates/benilla-protocol/src/messages/parse.rs', 'crates/benilla-protocol/src/events/decode.rs'],
        limits=common_limits)
    for name, record in [('object-queries.json', result), ('template-query-wire.json', wire)]:
        output = json.dumps(record, indent=2, ensure_ascii=False) + '\n'
        path = WORK / name if args.stage else KEEP / name
        if args.stage:
            path.write_text(output)
        else:
            assert path.read_text() == output, name
    print(json.dumps(dict(u16_entries=65536, locale_cases=15*len(entries), payload_cases=len(payloads),
                         native_wire_cases=len(wire_cases), source_executed=False, parity_verified=False)))


if __name__ == '__main__':
    main()
