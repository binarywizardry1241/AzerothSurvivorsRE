#!/usr/bin/env python3
"""Check current zone default resolution and its complete guardian-damage caller.

--stage writes a candidate to ignored runtime; default reproduces curated proof.
Original instructions plus synthetic inputs/powf returns; no compiler/game.
"""
import argparse
from collections import Counter
import hashlib
import json
import math
import re
import struct

from coverage_common import ROOT, latest_target, file_sha256
from zone_key_native import ModeProbe, KEYS, TABLE, PARSER, END, PE, D, bits, value, f, raw, model

WORK=ROOT/'runtime/analysis/history/findings/q41-mode-parser/a2d5061954ed'
KEEP=ROOT/'docs/analysis/evidence/0.113.2/zone-key-guardian-damage.json'


def compact(value):
    return json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False).encode()


def sha(value):
    return hashlib.sha256(value).hexdigest()


def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--stage',action='store_true');args=ap.parse_args()
    target=latest_target(verify=True)
    assert target['sha256']=='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
    p=ModeProbe();digest=hashlib.sha256();counts=Counter()
    def expected(data):
        return next((i for i,key in enumerate(KEYS)if key.encode()==data),0)
    for n in range(65536):
        data=n.to_bytes(2,'little');got=p.key(data);assert got==expected(data)
        digest.update(data+struct.pack('<Q',got));counts[got]+=1
    assert counts=={0:65532,4:1,7:1,8:1,10:1}
    mutations=set()
    for key in KEYS:
        data=key.encode()
        for i in range(len(data)):
            for n in range(256):mutations.add(data[:i]+bytes([n])+data[i+1:])
        mutations.update([data.upper(),data+b' ',b' '+data,data+b'\0',*([data[:i]for i in range(len(data))])])
    mutation_results=[]
    for data in sorted(mutations):
        got=p.key(data);assert got==expected(data);mutation_results.append([data.hex(),got])
    null_lengths=[]
    for length in [0,1,*range(9,66)]:
        p.invoke(PARSER,0,length);assert p.reg('RAX')==0;null_lengths.append(length)
    texts=[*KEYS,'','unknown','obsolete-zone','ELWYNN','Duskwood',' elwynn','elwynn ','elwynn\0','naxx\0','💥','ñ']
    source_cases=[]
    for text in texts:
        data=text.encode();index=expected(data)
        assert p.key(data)==index and p.key(data,True)==TABLE+index*240
        p.local_key(data)  # Local (flag0) accessor preserves the raw saved key.
        source_cases.append(dict(text=text,index=index))
    menu=json.loads((ROOT/'crates/azeroth-survivors-re/assets/menu.json').read_text())
    entries=json.loads((ROOT/'crates/azeroth-survivors-re/assets/run-entry-0.100.1.json').read_text())['zones']
    bindings=json.loads((ROOT/'crates/azeroth-survivors-re/assets/addon-zones-0.105.0.json').read_text())
    source=(ROOT/'crates/azeroth-survivors-re/src/guardians/catalog.rs').read_text()
    arrays=dict(re.findall(r'static (\w+): &\[EnemyDefinition\] = &\[(.*?)\n\];',source,re.S))
    source_zones=re.findall(r'key: "(.*?)",.*?scalar_e0: f32::from_bits\(0x([0-9a-f]+)\),.*?enemies: (\w+),',source[source.index('pub static ZONES'):],re.S)
    assert [row[0]for row in source_zones]==KEYS
    inputs=[]
    for i,(key,scalar,array)in enumerate(source_zones):
        address=TABLE+i*240;record=raw(address,240)
        ptr,n=struct.unpack_from('<QQ',record,8);assert raw(ptr,n).decode()==key
        assert int(scalar,16)==struct.unpack_from('<I',record,224)[0]
        row=next(r for r in entries if r['key']==key);binding=next(r for r in bindings if r['key']==key)
        assert row['map_id']==struct.unpack_from('<I',record,192)[0]
        assert binding['area_id']==struct.unpack_from('<I',record,196)[0]
        assert struct.pack('<3f',*row['spawn'])==record[200:212]
        assert next(r for r in menu['zones']if r['key']==key)['key']==key
        enemy_ptr,count=struct.unpack_from('<QQ',record,120)
        blocks=re.findall(r'EnemyDefinition \{(.*?)\n    \}',arrays[array],re.S);assert len(blocks)==count
        enemies=[]
        for j,block in enumerate(blocks):
            data=raw(enemy_ptr+j*80,80);entry=struct.unpack_from('<I',data,32)[0];damage=struct.unpack_from('<I',data,52)[0]
            assert int(re.search(r'\bid: (\d+)',block)[1])==entry
            assert int(re.search(r'base_damage: f32::from_bits\(0x([0-9a-f]+)',block)[1],16)==damage
            enemies.append(dict(index=j,id=entry,base_damage_bits=damage,record_sha256=sha(data)))
        inputs.append(dict(index=i,key=key,definition=hex(address),definition_sha256=sha(record),
            zone_scale_bits=int(scalar,16),map_id=row['map_id'],area_id=binding['area_id'],
            spawn_bits=list(struct.unpack_from('<3I',record,200)),enemies=enemies))
    assert sum(len(row['enemies'])for row in inputs)==148
    profiles=[(0.,1.,0,100,0,False,0.,1.),(600.,1.5,3,175,0,False,0.,1.),
        (817.5,2.25,5,120,1,True,720.,1.375),(-10.,.75,9,0,1,False,0.,1.),
        (600.,1.,0xffffffff,65535,1,True,720.,1.),(1200.,.75,0,100,2,True,720.,3.),
        (0.,-1.,1,100,0,False,0.,1.),(-0.,1.,1,100,1,True,0.,1.),
        (math.nan,1.,1,100,1,True,0.,1.375),(math.inf,1.,1,100,1,True,720.,1.375),
        (-math.inf,1.,1,100,0,False,0.,1.),(600.,0.,0,0,0,False,0.,1.),
        (600.,math.nan,0,100,0,False,0.,1.),(600.,math.inf,0,100,0,False,0.,1.)]
    damage_results=[]
    for zone in inputs:
        for enemy in zone['enemies']:
            for pi,profile in enumerate(profiles):
                got=p.damage(zone['key'].encode(),enemy['index'],*profile)
                expected_bits=model(*profile,value(zone['zone_scale_bits']),value(enemy['base_damage_bits']))
                assert got is not None
                assert math.isnan(value(got))if math.isnan(value(expected_bits))else got==expected_bits,(zone['key'],enemy['index'],pi,got,expected_bits)
                clock,difficulty,kills,percent,phase,endless,start,pow_result=profile
                elapsed=f(f(clock-start)/60.);elapsed=elapsed if elapsed>0 else 0.
                expected_calls=[[bits(f(1.096)),bits(elapsed)]]if phase==1 and endless else[]
                assert p.pow_calls==expected_calls
                damage_results.append([zone['index'],enemy['index'],pi,got,p.pow_calls.copy()])
    bounds=[]
    for zone in inputs:
        for index in [len(zone['enemies']),0xffffffffffffffff]:
            assert p.damage(zone['key'].encode(),index,*profiles[0])is None
            bounds.append([zone['index'],index])
    default_damage=[]
    for row in source_cases:
        if row['text']in KEYS:continue
        zone=inputs[row['index']];enemy=zone['enemies'][0]
        got=p.damage(row['text'].encode(),0,*profiles[2]);want=model(*profiles[2],value(zone['zone_scale_bits']),value(enemy['base_damage_bits']))
        assert got==want;default_damage.append([row['text'],got])
    resolver=(ROOT/'crates/azeroth-survivors-re/src/zones.rs').read_text()
    assert 'ZoneDefinition::by_key(key).unwrap_or(&ZONES[0])'in resolver
    gameplay=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
    mechanics=(ROOT/'crates/azeroth-survivors-re/src/gameplay/mechanics.rs').read_text()
    assert 'zones::resolve(zone_key).key'in gameplay and 'zones::resolve(&pick.zone).key'in gameplay
    assert 'let zone = azeroth_survivors_re::zones::resolve(zone_key);'in mechanics
    scaling=(ROOT/'crates/azeroth-survivors-re/src/guardians/scaling.rs').read_text()
    selected=scaling[scaling.index('pub fn guardian_damage_with_powf'):scaling.index('/// Uses host f32::powf')]
    required=['powf(1.096, exponent)','input.clock_seconds / 60.0','0.08 * minutes + 1.0',
        '(0.004 * minutes) * minutes','quadratic + linear','input.zone_scale * input.difficulty',
        'zone_difficulty.sqrt()','difficulty * polynomial','base_damage * time_difficulty',
        'damage * 1.4','damage * endless','input.guardian_kills as f32 * 0.05 + 1.0',
        'kills * damage','(f32::from(input.damage_percent) / 100.0) * damage']
    positions=[selected.index(token)for token in required];assert positions==sorted(positions)
    assert 'self.phase == 1 && self.endless'in scaling
    fields={str(offset):name for offset,name in [(0x2a8,'raw zone key pointer'),(0x2b0,'raw zone key length'),
        (0xb6c,'clock seconds'),(0xbe4,'difficulty'),(0x794,'guardian kill count'),(0x2cc,'damage percent u16'),
        (0xa90,'phase u32'),(0xc00,'endless flag'),(0xa94,'endless start seconds')]}
    ranges=[]
    for a,b in [(PARSER,END),(0x1458089b0,0x1458089cf),(0x145881860,0x1458818f4),(0x145974490,0x14597461f)]:
        ranges.append(dict(start=hex(a),end_exclusive=hex(b),sha256=sha(raw(a,b-a))))
    observations=[]
    for path in sorted((WORK/'rea-parser').glob('0*.json')):
        ev=json.loads(path.read_text()).get('response',{}).get('result',{}).get('structuredContent',{})
        if ev.get('operation')not in ['procedure_info','procedure_pseudo_code']:continue
        assert ev['subject']['digest']['sha256']==target['sha256']
        observations.append(dict(operation=ev['operation'],parameters=ev['parameters'],evidence_id=ev['evidence_id'],response_sha256=file_sha256(path)))
    result=dict(schema_version=1,target=target,gap_ids=[41,66],lead='Q41-P01-zone-key-145808880',
        native_ranges=ranges,ghidra_observations=observations,source_key_cases=source_cases,
        two_byte_cases=65536,two_byte_results_sha256=digest.hexdigest(),two_byte_index_counts=dict(sorted(counts.items())),
        byte_mutation_cases=len(mutation_results),byte_mutation_results_sha256=sha(compact(mutation_results)),
        null_pointer_unsupported_lengths=null_lengths,source_inputs=inputs,guardian_game_fields=fields,
        damage_profiles_bits=[[bits(clock),bits(difficulty),kills,percent,phase,endless,bits(start),bits(pow_result)]for clock,difficulty,kills,percent,phase,endless,start,pow_result in profiles],
        damage_cases=len(damage_results),damage_results_sha256=sha(compact(damage_results)),
        damage_bounds_cases=bounds,unknown_key_damage_cases=default_damage,
        limits=['Original AS parser/definition/local-key/damage instructions execute with synthetic state and an injected powf result. Bounds calls are intercepted.',
            'Byte fuzz includes invalid UTF8 as negative machine-code cases; source strings are valid UTF8. Unknown native keys return index0. The local flag0 accessor preserves raw text; no cooperative branch executes.',
            'All12 current map/area/spawn records and148 base-damage/zone-scale inputs match source. This does not revalidate every enemy/boss field or guardian health/AI/event/combat behavior.',
            'The arithmetic oracle models inspected Rust f32 operation order, not compiled Rust. Finite/signed-zero bits match exactly; NaNs compare classification. Windows CRT powf implementation/bit parity remain unverified.',
            'Normal picker selection already normalizes zone keys and stock realm ports already supply valid keys. This repairs runtime/API boundary handling, without claiming a failing ordinary picker/roster session was reproduced.',
            'Rust regressions are authored/unrun. No compilation, source/real client/MPQ/world/save/gameplay/rendering or original/rebuilt parity validation. Original census/P01 counts stay unchanged.'])
    encoded=json.dumps(result,indent=2,ensure_ascii=False)+'\n'
    # Keep enemy input records compact; table bytes have one owning native image.
    encoded=re.sub(r'\{\n          "index":.*?\n        \}',
        lambda m:json.dumps(json.loads(m[0]),ensure_ascii=False,separators=(',',':')),encoded,flags=re.S)
    path=WORK/'zone-key-guardian-damage.json'if args.stage else KEEP
    if args.stage:path.write_text(encoded)
    else:assert path.read_text()==encoded
    print(json.dumps(dict(two_byte_cases=65536,mutations=len(mutation_results),damage_cases=len(damage_results),bounds_cases=len(bounds),source_executed=False,parity_verified=False)))


if __name__=='__main__':main()
