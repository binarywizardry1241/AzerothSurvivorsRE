#!/usr/bin/env python3
"""Recover current Armory name grammar and check every source gear name without compiling."""
from portable_paths import portable_json
from script_sources import load_script
import argparse
import hashlib
import json
import struct
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes

SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
ASSET=ROOT/'crates/azeroth-survivors-re/assets/armory-name-rules-0.109.0.json'
OUT=ROOT/'docs/analysis/evidence/0.109.0/armory-pages'
WORK=ROOT/'runtime/secondary-pages-0.109.0'
OWNERS={'collection':('armory-collection',0x1402339b0,0x1402357e8),
        'missing-list':('armory-missing',0x140140a30,0x1401413f9),
        'missing-entries':('armory-details',0x140230940,0x1402313c7),
        'look-footer':('armory-look',0x140235c20,0x140236a61),
        'gear-name-constructor':('gear-name-text',0x1459a4ba0,0x1459a5be5),
        'rarity-name':('gear-name',0x1459a3680,0x1459a374e),
        'slot-name':('slot-name',0x1459a7170,0x1459a7242),
        'details-content':('armory-details-content',0x140142300,0x140143735),
        'effect-lines':('gear-effect-lines',0x1459b9370,0x1459b94f3),
        'effect-format':('gear-effect-format',0x1459a0760,0x1459a0969),
        'stat-description':('stat-effect-description',0x145895e40,0x145896fc5),
        'race-tip':('armory-race-tip',0x140238eb0,0x140239acc),
        'race-hover':('armory-race-hover',0x1401630f0,0x140163fac),
        'gear-flavor':('gear-flavor',0x1459a2e90,0x1459a31c1),
        'primary-input':('armory-primary',0x140161be0,0x140162744),
        'secondary-input':('armory-secondary',0x14015fcf0,0x14016053b),
        'navigation':('armory-navigation',0x14013ead0,0x14013ecbe),
        'codex-selection':('codex-selection',0x14037d490,0x14037d9c5)}


def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args()
    target=latest_target(verify=False);assert target['sha256']==SHA
    data=target_bytes(target)
    m = load_script('name_pe', ROOT/'scripts/inventory-executable.py');pe=m.PE(data)
    def raw(a,n):o=pe.rva_offset(a-pe.image_base);return data[o:o+n]
    def q(a):return struct.unpack('<Q',raw(a,8))[0]
    def pair(a):p,n=struct.unpack('<QQ',raw(a,16));return raw(p,n).decode()
    catalog=json.loads((ROOT/'crates/azeroth-survivors-re/assets/armory.json').read_text())
    rules=[];spans=[]
    for cls in catalog['classes']:
        a=q(0x147235b80+(cls['id']-1)*8);material=raw(a+0x128,1)[0];assert material in range(1,5)
        sets=[dict(fallback=pair(a+i*24),suffix=bool(raw(a+i*24+16,1)[0])) for i in range(5)]
        rules.append(dict(id=cls['id'],key=cls['key'],material=['cloth','leather','mail','plate'][material-1],sets=sets))
        spans.append(dict(address=hex(a),byte_count=304,sha256=hashlib.sha256(raw(a,304)).hexdigest()))
    nouns={}
    for material,key in enumerate(['cloth','leather','mail','plate']):
        names=[]
        for slot in range(8):
            pointer=q(0x147235930+slot*64+material*8);length=q(0x147235950+slot*64+material*8)
            names.append(raw(pointer,length).decode())
            spans.append(dict(address=hex(pointer),byte_count=length,sha256=hashlib.sha256(raw(pointer,length)).hexdigest()))
        nouns[key]=names
    asset=dict(target_sha256=SHA,classes=rules,nouns=nouns)
    en=json.loads((ROOT/'crates/azeroth-survivors-re/assets/locales/en.json').read_text())
    cases=[]
    for cls in catalog['classes']:
        rule=next(r for r in rules if r['id']==cls['id'])
        for p in cls['items']:
            if p['slot']<8:
                n=nouns[rule['material']][p['slot']];r=rule['sets'][p['rarity']]
                key='item.name_of' if r['suffix'] else 'item.name_prefix'
                text=en[key].replace('{noun}',n).replace('{set}',r['fallback'])
                keys=[key,f"noun.{rule['material']}.{p['slot']}",f"set.{rule['key']}.{p['rarity']}"]
                assert en[keys[1]]==n and en[keys[2]]==r['fallback']
            else:
                keys=[f"weapon.{rule['key']}.{p['slot']-8}.{p['rarity']}"];text=en[keys[0]]
            assert text==p['name'],(p['id'],text,p['name']);cases.append(dict(id=p['id'],name=text,keys=keys))
    pvp=json.loads((ROOT/'crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json').read_text())
    for cls in pvp['classes']:
        rule=next(r for r in rules if r['id']==cls['id'])
        for p in cls['items']:
            for name in [p['name'],p['horde']['name']]:
                if p['slot']<8:
                    noun=nouns[rule['material']][p['slot']];assert name.endswith(' '+noun)
                    prefix=name[:-len(noun)-1];keys=[f'set.pvp.{prefix}',f"noun.{rule['material']}.{p['slot']}",'item.name_prefix']
                    text=en[keys[2]].replace('{set}',en[keys[0]]).replace('{noun}',en[keys[1]])
                else:
                    keys=['weapon.pvp.'+name];text=en[keys[0]]
                assert name==text;cases.append(dict(id=p['id'],name=name,keys=keys))
    assert len(cases)==581
    for code in ['en','pl','cs','de','pt','es','fr','ro','tr','ru','uk','zh','ja','ko']:
        locale=json.loads((ROOT/f'crates/azeroth-survivors-re/assets/locales/{code}.json').read_text())
        assert all(key in locale for c in cases for key in c['keys']),code
    bounds={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    rows=[]
    prior=None if args.write else json.loads((OUT/'manifest.json').read_text())
    if args.write:OUT.mkdir(parents=True,exist_ok=True)
    for role,(stem,a,b) in OWNERS.items():
        assert bounds[a]==b,(role,hex(bounds[a]),hex(b))
        row=dict(role=role,address=hex(a),end_exclusive=hex(b),byte_count=b-a,sha256=hashlib.sha256(raw(a,b-a)).hexdigest())
        if args.write:
            x=json.loads((WORK/f'{stem}-rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
            assert x['provider']['id']=='ghidra' and x['subject']['digest']['sha256']==row['sha256']
            text='\n'.join(line.rstrip() for line in x['normalized_result'].splitlines()).strip()+'\n'
            row.update(rea_evidence_id=x['evidence_id'],provider=x['provider'],analysis_profile_digest=x['analysis_profile']['digest'],pseudocode=role+'.c',pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest());(OUT/row['pseudocode']).write_text(text)
        else:
            old=next(x for x in prior['owners'] if x['role']==role)
            for k in ['rea_evidence_id','provider','analysis_profile_digest','pseudocode','pseudocode_sha256']:row[k]=old[k]
            assert hashlib.sha256((OUT/row['pseudocode']).read_bytes()).hexdigest()==row['pseudocode_sha256']
        rows.append(row)
    payload=json.dumps(asset,ensure_ascii=False,indent=2)+'\n'
    proof=dict(target_sha256=SHA,target_version='0.109.0',owners=rows,data_spans=spans,
        source_asset=dict(path=ASSET.relative_to(ROOT).as_posix(),sha256=hashlib.sha256(payload.encode()).hexdigest()),
        checks=dict(ordinary_names=415,pvp_faction_names=166,languages=14,all_english_names_match_existing_source=True),
        limits=['Current native grammar, set/noun tables, page and input owners are recovered. Current numeric/display/starter verification belongs to catalog.json, scaling.json, display-fallback.json and starters.json; input vectors belong to input.json.',
            'Ghidra raw imports omit external globals and generic ABI is not a Windows call signature.',
            'Name/key checks do not execute the reconstructed UI or certify complete Armory page, GPU appearance, compilation or gameplay parity.'])
    if args.write:
        ASSET.write_text(payload);(OUT/'manifest.json').write_text(portable_json(proof,indent=2)+'\n')
    else:
        assert ASSET.read_text()==payload
        assert prior==proof
    print('Checked 45 native set grammar records, 32 nouns, 415 ordinary/166 PvP faction names and all keys in 14 languages; no compiler/game.')

if __name__=='__main__':main()
