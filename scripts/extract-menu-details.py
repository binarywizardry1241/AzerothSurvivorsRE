#!/usr/bin/env python3
"""Recover menu art/content records from the SHA-bound 0.92.0 reference, without execution."""
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent
EXPECTED = '47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2'

def main():
    spec = importlib.util.spec_from_file_location('inventory', ROOT / 'scripts/inventory-executable.py')
    inv = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inv)
    data = (ROOT / 'AzerothSurvivors/AzerothSurvivors.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest() == EXPECTED
    pe = inv.PE(data)
    def pair(at):
        a, n = struct.unpack_from('<QQ', data, at)
        return pe.rva_offset(a - pe.image_base), n
    def string(at):
        o, n = pair(at)
        assert n < 10000
        return data[o:o+n].decode('utf-8')
    p = ROOT / 'crates/azeroth-survivors-re/assets/menu.json'
    catalog = json.loads(p.read_text())
    provenance = json.loads((ROOT / 'docs/analysis/evidence/menu-provenance.json').read_text())
    for row, record in zip(catalog['classes'], provenance['classes']):
        row['spell_keys'] = record['spell_keys']
        row['starting_spell_key'] = record['starting_spell_key']
    abilities = []
    # First of 111 contiguous 120-byte records, validated against exact localized names.
    for i in range(111):
        at = 0x66d4320 + i*120
        key, name, icon = (string(at+o) for o in (0,16,32))
        assert catalog['labels']['ability.'+key+'.name'] == name
        abilities.append(dict(key=key, name=name, icon=icon, description=catalog['labels'].get('ability.'+key+'.desc','')))
    catalog['abilities'] = abilities
    for i, zone in enumerate(catalog['zones']):
        at = 0x66d1210+i*184
        assert string(at) == zone['key']
        zone['blurb'] = string(at+112)
        enemy, count = pair(at+64)
        zone['enemies'] = [string(enemy+j*80+16) for j in range(count)]
        zone['enemy_keys'] = [f'enemy.{struct.unpack_from("<I",data,enemy+j*80+32)[0]}' for j in range(count)]
        english = json.loads((ROOT/'crates/azeroth-survivors-re/assets/locales/en.json').read_text())
        assert all(english[key] == name for key, name in zip(zone['enemy_keys'], zone['enemies']))
        boss, count = pair(at+80)
        zone['bosses'] = [dict(key=f'boss.{struct.unpack_from("<I",data,boss+j*88+48)[0]}.name', name=string(boss+j*88), minute=struct.unpack_from('<f',data,boss+j*88+64)[0]) for j in range(count)]
        assert all(english[boss['key']] == boss['name'] for boss in zone['bosses'])
    p.write_text(json.dumps(catalog,indent=2,ensure_ascii=False)+'\n')
    report = dict(artifact_sha256=EXPECTED, version='0.92.0', target_executed=False,
        method='PE pointer walks; names checked against embedded locale. Boss time fields corroborated by the runtime picker display.',
        ability_table=dict(file_offset='0x66d4320',virtual_address=hex(pe.offset_va(0x66d4320)),count=111,stride_bytes=120),
        zones=dict(file_offset='0x66d1210',count=9,stride_bytes=184,blurb_offset=112,enemy_offset=64,boss_offset=80,enemy_locale_id_offset=32,boss_locale_id_offset=48),
        output='crates/azeroth-survivors-re/assets/menu.json')
    (ROOT/'docs/analysis/evidence/menu-details.json').write_text(json.dumps(report,indent=2)+'\n')
    print(f'Recovered {len(abilities)} ability icons/descriptions and {len(catalog["zones"])} zone summaries.')

if __name__ == '__main__':
    main()
