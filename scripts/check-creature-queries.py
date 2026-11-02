#!/usr/bin/env python3
"""Check native AS Creature queries and the source inputs without compilation.

--stage writes reviewed candidates under runtime. Default reproduces and compares
curated evidence. This is instruction emulation with explicit service seams,
plus source parsing/connection guards, not execution of reconstructed Rust.
"""
import argparse
import hashlib
import json
import re
import struct
from collections import Counter

from creature_query_native import Probe, ROOT, T, D, PE, FS, ENDS

WORK = ROOT / 'runtime/q41-creature-query-0.113.2'
KEEP = ROOT / 'docs/analysis/evidence/0.113.2/creature-queries.json'


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, ensure_ascii=False,
                                    separators=(',', ':')).encode()).hexdigest()


def source_records():
    source = (ROOT / 'crates/azeroth-survivors-re/src/guardians/catalog.rs').read_text()
    menu = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/menu.json').read_text())
    subtitles = {z['key']: z['subtitle'] for z in menu['zones']}
    arrays = dict(re.findall(r'static (\w+): &\[\w+\] = &\[(.*?)\n\];', source, re.S))
    zones = re.findall(r'key: "(.*?)",.*?enemies: (\w+),\s*bosses: (\w+),',
                       source[source.index('pub static ZONES'):], re.S)
    result = {}
    for zone, enemies, bosses in zones:
        for array, kind in [(enemies, 'enemy'), (bosses, 'boss')]:
            for body in arrays[array].split('Definition {')[1:]:
                def field(name):
                    return int(re.search(r'\b' + name + r': (\d+),', body)[1])
                entry = field('id')
                name = json.loads(re.search(r'\bname: ("(?:[^"\\]|\\.)*"),', body)[1])
                assert entry not in result
                result[entry] = dict(entry=entry, category=kind, raw_name=name,
                    name_key=f'enemy.{entry}' if kind == 'enemy' else f'boss.{entry}.name',
                    raw_subname=subtitles[zone] if kind == 'enemy' else '',
                    subname_key=f'zone.{zone}.subtitle' if kind == 'enemy' else '',
                    fields=[0, field('raw_2c' if kind == 'enemy' else 'raw_3c'), 0,
                            field('flag_4c') if kind == 'enemy' else 3, 0, 0,
                            field('model_id'), 0, 0])
    counts = Counter(row['category'] for row in result.values())
    assert counts == dict(enemy=148, boss=60), counts
    bridge = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/client/creature_queries.rs').read_text()
    pattern = r'\(\s*(\d+),\s*("(?:[^"\\]|\\.)*"),\s*("(?:[^"\\]|\\.)*"),\s*("(?:[^"\\]|\\.)*"),\s*(\d+),\s*(\d+),?\s*\)'
    specials = re.findall(pattern, bridge[bridge.index('const SPECIALS'):], re.S)
    assert len(specials) == 38
    for entry, name, key, subname, kind, display in specials:
        entry = int(entry)
        assert entry not in result
        result[entry] = dict(entry=entry, category='special', raw_name=json.loads(name),
            name_key=json.loads(key), raw_subname=json.loads(subname), subname_key=json.loads(subname),
            fields=[0, int(kind), 0, 0, 0, 0, int(display), 0, 0])
    # Guards verify the reviewed live source connection; they do not execute Rust.
    requests = (ROOT / 'crates/benilla-app/src/local_client/requests.rs').read_text()
    gameplay = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
    for token in ['ClientCommand::CreatureQuery { entry, .. }',
                  'Some(LocalClientRequest::CreatureQuery { entry })']:
        assert token in requests
    assert 'client::creature_queries::creature_query(entry, &locale)' in gameplay
    for token in ['locale.lookup(key).unwrap_or(fallback)', 'enemy.raw_2c',
                  'u32::from(enemy.flag_4c)', 'boss.raw_3c', 'boss.model_id',
                  'entry & 0x7fff_ffff', 'Some(name)', 'then_some(subname)',
                  'pet_spell_list: 0', 'type_flags: 0', 'racial_leader: false']:
        assert token in bridge, token
    return result


def expected(row, locale):
    def text(key, fallback):
        return locale.get(key, fallback) if key else fallback
    return dict(entry=row['entry'], found=True,
                name=text(row['name_key'], row['raw_name']), other_names=['', '', ''],
                subname=text(row['subname_key'], row['raw_subname']), fields=row['fields'],
                keys=sorted(k for k in [row['name_key'], row['subname_key']] if k))


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--stage', action='store_true')
    args = ap.parse_args()
    records = source_records()
    probe = Probe()
    english = probe.locale.copy()
    hits, misses = [], hashlib.sha256()
    for entry in range(65536):
        actual = probe.query(entry)
        if entry in records:
            assert actual == expected(records[entry], english), (entry, actual, records[entry])
            hits.append(dict(**actual, **{k: records[entry][k] for k in
                ['category', 'raw_name', 'name_key', 'raw_subname', 'subname_key']}))
        else:
            assert actual == dict(entry=entry, found=False, response_entry=entry)
            misses.update(struct.pack('<II', entry, actual['response_entry']))
        if (entry + 1) % 8192 == 0:
            print(f'native entries checked: {entry + 1}/65536', flush=True)
    locales = {}
    for code in ['en', 'pl', 'cs', 'de', 'pt', 'es', 'fr', 'ro', 'tr', 'ru', 'uk', 'zh', 'ja', 'ko', 'missing']:
        probe.locale = {} if code == 'missing' else json.loads(
            (ROOT / f'crates/azeroth-survivors-re/assets/locales/{code}.json').read_text())
        values = []
        for row in records.values():
            actual = probe.query(row['entry'])
            assert actual == expected(row, probe.locale), (code, row['entry'], actual)
            values.append(actual)
        locales[code] = dict(cases=len(values), sha256=digest(values))
    boundaries = [probe.query(v) for v in [65536, 0x7fffffff, 0x80000000, 0x80000258, 0xffffffff]]
    assert all(not r['found'] and r['response_entry'] == r['entry'] & 0x7fffffff for r in boundaries)
    payloads = []
    for entry in [600, 690, 9600, 9613, 65535]:
        for length in range(16):
            raw = (struct.pack('<I', entry) + b'\xff' * 12)[:length]
            parsed = int.from_bytes(raw[:4], 'little')
            actual = probe.query(parsed, raw)
            assert actual == (expected(records[parsed], {}) if parsed in records else
                              dict(entry=parsed, found=False, response_entry=parsed & 0x7fffffff))
            payloads.append(dict(input=raw.hex(), result=actual))
    ranges = []
    for address in FS:
        offset = PE.rva_offset(address - PE.image_base)
        size = ENDS[address] - address
        ranges.append(dict(start=hex(address), end_exclusive=hex(ENDS[address]),
            byte_count=size, sha256=hashlib.sha256(D[offset:offset + size]).hexdigest()))
    evidence = []
    for directory in ['rea-incoming', 'rea-query', 'rea-extra-producers']:
        for path in sorted((WORK / directory).glob('*procedure_pseudo_code*.json')):
            ev = json.loads(path.read_text())['response']['result']['structuredContent']
            assert ev['subject']['digest']['sha256'] == T['sha256']
            evidence.append(dict(operation=ev['operation'], parameters=ev['parameters'],
                                 evidence_id=ev['evidence_id']))
    result = dict(schema_version=1, target=T, gap_ids=[41, 64], native_ranges=ranges,
        ghidra_evidence=evidence, source_catalog_projection_sha256=digest(list(records.values())),
        hits=hits, u16_entries_tested=65536, miss_cases=65536-len(hits),
        miss_results_sha256=misses.hexdigest(), locales=locales, u32_boundaries=boundaries,
        payload_cases=len(payloads), payload_results_sha256=digest(payloads),
        native_instructions_observed=len(probe.trace),
        limits=['Original query branch/name getters/serializers execute with synthetic host/packet buffers.',
                'Allocation, buffer growth, memcpy/memcmp, Rust formatting and locale-map lookup are seams; packet sender is intercepted.',
                'Source records and connection guards are parsed, not compiled/executed. Unit tests are authored but unrun.',
                '65536 entries exhaust the u16 domain; five extra u32 boundaries are samples, not an exhaustive u32 proof.',
                'No game, network, real ECS/cache/FrameXML or original/rebuilt parity check. Native census totals are unchanged.'])
    # One exact native fixture per line keeps the complete population reviewable.
    rendering = dict(result, hits='__HIT_ROWS__')
    output = (json.dumps(rendering, indent=2, ensure_ascii=False).replace(
        '"__HIT_ROWS__"', '[\n    ' + ',\n    '.join(
            json.dumps(row, ensure_ascii=False) for row in hits) + '\n  ]') + '\n')
    if args.stage:
        WORK.mkdir(parents=True, exist_ok=True)
        (WORK / 'creature-queries.json').write_text(output)
    else:
        assert KEEP.read_text() == output, 'Native/source commitments differ from curated evidence'
    print(json.dumps(dict(templates=len(hits), locale_cases=15*len(hits),
                         payload_cases=len(payloads), parity_verified=False)))


if __name__ == '__main__':
    main()
