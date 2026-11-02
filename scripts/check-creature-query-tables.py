#!/usr/bin/env python3
"""Check the current finite CreatureQuery contract without compiling or running a client."""
import argparse
import hashlib
import json
import re
import struct
from collections import Counter
from pathlib import Path

from creature_query_tables_native import Probe, ROOT, T, D, PE, FS, ENDS
from coverage_common import file_sha256
from script_sources import recorded_input_matches
import capstone
import unicorn

KEEP = ROOT / 'docs/analysis/evidence/0.120.2/creature-query-tables/native-check.json'
WORK = ROOT / 'runtime/0.120.2/creature-query-tables'


def verify_receipts():
    proof = json.loads((KEEP.parent / 'manifest.json').read_text())
    assert all(proof['target'][key] == T[key] for key in ('version', 'sha256', 'size_bytes'))
    assert proof['native_tool_versions'] == {'unicorn': unicorn.__version__, 'capstone': capstone.__version__}
    for record in proof['inputs'] + proof['source_first']['paths'] + [proof['native_check']]:
        assert file_sha256(ROOT / record['path']) == record['sha256'], record['path']
    for record in proof['tools']:
        assert recorded_input_matches(ROOT / record['path'], record['sha256']), record['path']
    for query in proof['queries']:
        for key in ('plan', 'journal', 'result'):
            record = query[key]
            assert file_sha256(ROOT / record['path']) == record['sha256'], record['path']
        result = json.loads((ROOT / query['result']['path']).read_text())
        native = json.loads(result['content'][0]['text'])
        assert native['subject']['digest']['sha256'] == T['sha256']
        assert native['evidence_id'] == query['evidence_id']
        assert native['operation'] == query['operation']
        assert native['parameters']['procedure'] == query['procedure']
    for observation in proof['source_first']['observations']:
        source = (ROOT / observation['path']).read_text()
        assert all(fragment in source for fragment in observation['fragments']), observation['path']


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
    assert len(specials) == 44
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
    ap.add_argument('--quick', action='store_true')
    args = ap.parse_args()
    if not args.stage:
        verify_receipts()
    records = source_records()
    frontier = json.loads((ROOT / 'docs/analysis/evidence/0.120.2/computed-correspondence-frontier.json').read_text())
    leads = [r for key, r in frontier['leads'].items() if key.startswith('retained-table-145af')]
    assert len(leads) == 13
    probe = Probe()
    probe.dispatch_sites = {int(r['current_native_location']['dispatch_site'], 16) for r in leads}
    probe.table_loads = {site - 7: site for site in probe.dispatch_sites}
    english = probe.locale.copy()
    hits, misses = [], hashlib.sha256()
    entries = sorted(set(records) | {0,9513,65535}) if args.quick else range(65536)
    for entry in entries:
        actual = probe.query(entry)
        if entry in records:
            assert actual == expected(records[entry], english), (entry, actual, records[entry])
            hits.append(dict(**actual, **{k: records[entry][k] for k in
                ['category', 'raw_name', 'name_key', 'raw_subname', 'subname_key']}))
        else:
            assert actual == dict(entry=entry, found=False, response_entry=entry)
            misses.update(struct.pack('<II', entry, actual['response_entry']))
        if not args.quick and (entry + 1) % 8192 == 0:
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
    ranges = []
    for address in FS:
        offset = PE.rva_offset(address - PE.image_base)
        size = ENDS[address] - address
        ranges.append(dict(start=hex(address), end_exclusive=hex(ENDS[address]),
            byte_count=size, sha256=hashlib.sha256(D[offset:offset + size]).hexdigest()))
    table_observations = []
    for row in leads:
        site = int(row['current_native_location']['dispatch_site'], 16)
        reached = probe.dispatches.get(site, {})
        assert reached, 'Unreached retained table: ' + row['selector']
        native = row['current_native_candidate']
        address, size = int(native['virtual_address'], 16), native['byte_count']
        at = PE.rva_offset(address - PE.image_base)
        raw = D[at:at + size]
        assert hashlib.sha256(raw).hexdigest() == native['sha256']
        targets = [address + cell[0] for cell in struct.iter_unpack('<i', raw)]
        cells = probe.dispatch_cells[site]
        for (index,target), admitted_entries in cells.items():
            assert index < len(targets) and targets[index] == target
        indices = {index for index,target in cells}
        if not args.quick:
            # Some input entries are intercepted by earlier match branches. Their
            # unused later cells all select already observed destinations; a
            # cell which adds another successor remains an explicit failure.
            assert set(targets) <= set(reached), row['selector']
        table_observations.append(dict(selector=row['selector'], current=row['current_native_location'],
            native_table=native, table_cells=len(targets), observed_cells=len(indices),
            unobserved_indices=sorted(set(range(len(targets))) - indices),
            observed_destinations=[dict(target=hex(target), entries=sorted(admitted_entries)) for target,admitted_entries in sorted(reached.items())],
            cell_observations=[dict(index=index,target=hex(target),entries=sorted(admitted_entries)) for (index,target),admitted_entries in sorted(cells.items())]))
    result = dict(schema_version=1, target={k:T[k] for k in ('version','path','sha256','size_bytes')},
        finding_ids=[41,64,65], native_ranges=ranges,
        source_catalog_projection_sha256=digest(list(records.values())),
        hits=hits, u16_entries_tested=len(entries), miss_cases=len(entries)-len(hits),
        miss_results_sha256=misses.hexdigest(), locales=locales, u32_boundaries=boundaries,
        table_observations=table_observations, native_instructions_observed=len(probe.trace),
        native_instructions_executed=probe.steps,
        limits=['Original query owner/name getters/empty-template leaf/hit and miss serializers execute with synthetic host/packet buffers.',
                'Allocation, growth, memory copy/comparison, Rust formatting and locale-map lookup are explicit seams; sender is intercepted.',
                'Source records and live connection guards are parsed, not compiled or executed. Existing authored Rust tests remain unrun.',
                'u16 sweep covers its domain; five extra u32 values are samples. The separately owned template-query-input proof owns prefix/GUID cases.',
                'Each table lists actually reached destinations/entries; original immutable cells/guards remain separately byte-verified.',
                'No client/game/server/network or parity comparison occurred.'])
    if args.quick:
        print(json.dumps(dict(quick=True,templates=len(hits),locale_cases=15*len(hits),tables=len(table_observations),passed=True)))
        return
    encoded=json.dumps(result,indent=2,ensure_ascii=False)+'\n'
    if args.stage:
        WORK.mkdir(parents=True,exist_ok=True);(WORK/'native-check.json').write_text(encoded)
    else:
        assert KEEP.read_text()==encoded, 'Current original/source commitments differ from retained proof'
    print(json.dumps(dict(templates=len(hits),u16_entries=len(entries),locale_cases=15*len(hits),tables=len(table_observations),passed=True)))


if __name__ == '__main__':
    main()
