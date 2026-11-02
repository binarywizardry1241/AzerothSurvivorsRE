#!/usr/bin/env python3
"""Verify selected live set-description locale keys; no compilation or application.

The optional --apply path appends only missing selected keys to each current
source file. It changes only the final object delimiter/tail, preserving existing
bytes/values and rejecting concurrent edits. Coordinate locale ownership first.
"""
import argparse
import hashlib
import json
import re
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes

PROOF = ROOT / 'docs/analysis/evidence/0.121.0/sets-core/localization.json'
CATALOGS = ROOT / 'crates/azeroth-survivors-re/assets/locales'
SET_BONUS_KEYS = ('bonus.calm_regen', 'bonus.crowd_armor')
GLOW_KEYS = ('armory.glow','armory.glow_none','armory.glow_icy','Icy Chill','Crusader','Fiery Weapon','item.upgraded','item.not_upgraded')
MARK_KEYS = ('marks.gained','marks.earned')
PURCHASE_KEYS = ('armory.next_star','armory.upgrade','armory.marks_short','armory.star_max','armory.star_locked')
ARMORY_KEYS = ('armory.collection_complete','armory.zones_done','armory.star_cap','armory.star_cap_none',
    'armory.locked','armory.stars','armory.set_count','armory.set8','armory.set8_empowered','armory.set_empowered',
    'armory.set_bonus','armory.set_tip_title4','armory.set_tip_title8','armory.set_tip4','armory.set_tip8',
    'armory.set_tip_stars','armory.set_tip_open','armory.set_tip_pieces')
FORMATS = ('{bonus} (pieces at {stars}+ stars)',
           '{bonus} (all eight at {stars}+ stars; half again as strong at {max})')


def sha(value):
    return hashlib.sha256(value).hexdigest()


def append_selected(path, values):
    raw = path.read_bytes()
    existing = json.loads(raw)
    assert all(isinstance(k,str) and isinstance(v,str) for k,v in existing.items())
    for key,value in values.items():
        assert key not in existing or existing[key] == value, (path.name,key)
    additions = {key:value for key,value in values.items() if key not in existing}
    if not additions:
        return 0
    closing = raw.rfind(b'}')
    assert closing >= 0 and not raw[closing + 1:].strip()
    at = len(raw[:closing].rstrip())
    lines = b',\n'.join(('  '+json.dumps(key,ensure_ascii=False)+': '+json.dumps(value,ensure_ascii=False)).encode()
                          for key,value in additions.items())
    tail = (b',\n' if existing else b'\n') + lines + b'\n}' + raw[closing+1:]
    # Modify the tail only; never replace a stale whole-file snapshot.
    with path.open('r+b') as output:
        assert output.read() == raw, f'Concurrent locale edit: {path.name}'
        output.seek(at)
        output.write(tail)
        output.truncate()
    current_raw = path.read_bytes()
    current = json.loads(current_raw)
    assert current_raw[:at] == raw[:at]
    assert all(current[key] == value for key,value in existing.items())
    assert all(current[key] == value for key,value in values.items())
    return len(additions)


def inspect(apply=False, owner="sets"):
    target = latest_target(verify=True)
    proof = json.loads((ROOT/'docs/analysis/evidence/0.121.0/orb-source.json').read_text())
    assert {k:target[k] for k in ('version','path','sha256','size_bytes')} == proof['target']
    image = target_bytes(target)
    asset = json.loads((ROOT/'crates/azeroth-survivors-re/assets/sets-0.121.0.json').read_text())
    if owner == 'sets':
        keys = sorted({row['description'] for row in asset['entries']}) + list(FORMATS) + list(SET_BONUS_KEYS)
        assert len(keys) == len(set(keys)) == 58
    elif owner == 'glow':
        keys = list(GLOW_KEYS)
    elif owner == 'marks':
        keys = list(MARK_KEYS)
    elif owner == 'armory':
        keys = list(ARMORY_KEYS)
    elif owner == 'purchase':
        keys = list(PURCHASE_KEYS)
    else:
        assert owner == 'achievements'
        achievements=json.loads((ROOT/'crates/azeroth-survivors-re/assets/achievement-catalog-0.121.0.json').read_text())
        projection=[dict(name=row['name'],description=row['description'],tokens=row.get('tokens',{})) for row in achievements['achievements']]
        keys=sorted({value for row in projection for value in (row['name'],row['description'],*row['tokens'].values())}|{'Heroic'})
    present_keys = []
    if owner == 'sets':
        heroic = (ROOT/'crates/azeroth-survivors-re/src/heroic.rs').read_text()
        descriptor_block = re.search(r'pub\s+(?:const|static)\s+DESCRIPTORS\s*:[\s\S]*?(?=\npub fn descriptor)',heroic).group(0)
        present_keys = set(re.findall(r'"([^"\n]+)"',descriptor_block)) | {'Normal','Heroic'}
        difficulty = (ROOT/'crates/azeroth-survivors-re/src/run_options.rs').read_text()
        present_keys.update(re.findall(r'\.label\(\s*"([^"\n]+)"',difficulty))
        present_keys.add(re.search(r'const HELP: &str = "([^"]+)"',difficulty).group(1))
        names = json.loads((ROOT/'crates/azeroth-survivors-re/assets/armory-name-rules-0.109.0.json').read_text())
        present_keys.update(f"set.{row['key']}.{tier}" for row in names['classes'] for tier in range(5))
        present_keys.update(("set.pvp.Warlord's","set.pvp.Field Marshal's"))
        present_keys.update('ability.'+row['spell_key']+'.name' for row in asset['entries'])
        present_keys=sorted(present_keys-set(keys))
    consumer = (ROOT/'crates/azeroth-survivors-re/src/gameplay/client/inventory.rs').read_text()
    if owner == 'sets':
        armory_consumer=(ROOT/'crates/azeroth-survivors-re/src/armory.rs').read_text()
        if 'labels.label(&descriptor.description)' not in consumer:
            assert 'labels.label(&descriptor.description)' in armory_consumer
            assert 'crate::armory::set_eight_bonus(' in consumer
            assert 'fn set_eight_bonus(' in armory_consumer
        assert all('labels.label("'+key+'")' in consumer for key in FORMATS)
    table = proof['locale_table']
    raw = image[int(table['file_offset'],16):int(table['file_offset'],16)+table['byte_count']]
    assert sha(raw) == table['sha256']
    locales = []
    consumed_keys=list(keys)
    fallback_literals=None
    for binding in proof['locales']:
        for name in ('descriptor','payload'):
            receipt = binding[name]
            raw = image[int(receipt['file_offset'],16):int(receipt['file_offset'],16)+receipt['byte_count']]
            assert sha(raw) == receipt['sha256'], (binding['code'],name)
        native = json.loads(raw)
        absent=[key for key in consumed_keys if key not in native]
        if owner == 'achievements':
            assert all(key.isdecimal() for key in absent), absent
        else:
            assert not absent, absent
        if fallback_literals is None:
            fallback_literals=absent
            keys=[key for key in consumed_keys if key in native]
        else:
            assert absent == fallback_literals
        values = {key:native[key] for key in keys}
        path = CATALOGS/(binding['code']+'.json')
        inserted = append_selected(path,values) if apply else 0
        current = json.loads(path.read_text())
        assert all(current.get(key) == value for key,value in values.items()), binding['code']
        assert all(current.get(key,key)==key for key in fallback_literals), binding['code']
        assert all(key in native and current.get(key)==native[key] for key in present_keys), binding['code']
        present_values=[native[key] for key in present_keys]
        ordered = [values[key] for key in keys]
        locales.append(dict(code=binding['code'],descriptor=binding['descriptor'],payload=binding['payload'],
            values=ordered,source_path=path.relative_to(ROOT).as_posix(),
            selected_values_sha256=sha(json.dumps(ordered,ensure_ascii=False,separators=(',',':')).encode()),
            already_available_values_sha256=sha(json.dumps(present_values,ensure_ascii=False,separators=(',',':')).encode()),inserted=inserted))
    return dict(schema_version=1,target=proof['target'],gap_ids={'sets':[242,234],'glow':[235],'marks':[227],'armory':[236,234],'purchase':[229],'achievements':[237]}[owner],locale_table=table,
                generator=dict(path='scripts/check-set-localization.py',sha256=sha(Path(__file__).read_bytes())),
                owner=owner,keys=keys,consumed_keys=consumed_keys,fallback_literals=fallback_literals,
                consumed_projection=(dict(path='crates/azeroth-survivors-re/assets/achievement-catalog-0.121.0.json',
                    fields=['name','description','tokens.values'],records=len(projection),
                    sha256=sha(json.dumps(projection,sort_keys=True,ensure_ascii=False,separators=(',',':')).encode()),
                    category_key='Heroic') if owner=='achievements' else None),
                already_available_keys=present_keys,locales=locales,
                consumer={'sets':dict(paths=['crates/azeroth-survivors-re/src/gameplay/client/inventory.rs','crates/azeroth-survivors-re/src/armory.rs'],
                    anchors=['labels.label(&descriptor.description)']+['labels.label("'+key+'")' for key in FORMATS]+list(SET_BONUS_KEYS)),
                    'glow':dict(owner_gap=235,status='Exact native catalog data only; source consumer is owned by the separate glow integration.',keys=list(GLOW_KEYS)),
                    'marks':dict(owner_gap=227,status='Exact native catalog data only; source consumer receipt is owned by the separate marks integration.',keys=list(MARK_KEYS)),
                    'armory':dict(owner_gap=236,status='Exact native catalog data only; collection/SetTip source consumption belongs to the owning integration.',keys=list(ARMORY_KEYS)),
                    'purchase':dict(owner_gap=229,status='Exact native catalog data only; source consumption belongs to the owning Armory transaction integration.',native_producer='0x1400c4790',keys=list(PURCHASE_KEYS)),
                    'achievements':dict(owner_gap=237,status='Exact native catalog data and consumed-text projection only; category/tab/source integration remains with its owner.',
                        paths=['crates/azeroth-survivors-re/src/progression.rs'],anchors=['catalog.label(value)','catalog.label(value)'])}[owner],
                scope={'sets':'Only54set descriptor descriptions,2SetTip formats and2proved four-piece numeric labels.',
                    'glow':'Only8requested weapon-glow/upgraded-item locale keys, owned by#235.',
                    'marks':'Only2requested private mark reward locale keys, owned by#227.',
                    'armory':'Only18requested collection/star/SetTip locale keys, owned by#236/#234.',
                    'purchase':'Only5requested Armory star transaction locale keys, owned by#229.',
                    'achievements':'Only current achievement name/description/token strings and exact Heroic category key, owned by#237; numeric token strings retain native missing-key fallback.'}[owner]+' Whole native catalogs are not extracted; existing source entries remain unchanged.',
                compilation='not_run',application_executed=False,parity_verified=False)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--owner',choices=('sets','glow','marks','armory','purchase','achievements'),default='sets')
    parser.add_argument('--apply',action='store_true')
    parser.add_argument('--write',action='store_true')
    args=parser.parse_args()
    result=inspect(args.apply,args.owner)
    proof_path = {'sets':PROOF,'glow':ROOT/'docs/analysis/evidence/0.121.0/weapon-glow-localization.json',
                  'marks':ROOT/'docs/analysis/evidence/0.121.0/gear-marks-localization.json',
                  'armory':ROOT/'docs/analysis/evidence/0.121.0/armory-localization.json',
                  'purchase':ROOT/'docs/analysis/evidence/0.121.0/armory-purchase-localization.json',
                  'achievements':ROOT/'docs/analysis/evidence/0.121.0/achievement-localization.json'}[args.owner]
    inserted=sum(row.pop('inserted') for row in result['locales'])
    if args.write:
        proof_path.write_text(json.dumps(result,indent=2,ensure_ascii=False)+'\n')
    elif proof_path.exists():
        assert json.loads(proof_path.read_text())==result, 'Selected native/source locale proof changed'
    print(json.dumps(dict(owner=args.owner,selected_keys=len(result['keys']),locales=len(result['locales']),
        verified_values=len(result['keys'])*len(result['locales']),already_available_keys=len(result['already_available_keys']),inserted_values=inserted,
        unrelated_entries_preserved=True,compilation='not_run',application_executed=False,parity_verified=False),indent=2))


if __name__=='__main__':
    main()
