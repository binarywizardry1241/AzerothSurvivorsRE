#!/usr/bin/env python3
"""Extract 0.92 talent-tree definitions, bound to the supplied EXE hash."""
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

ROOT=Path(__file__).resolve().parent.parent
EXPECTED='47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2'

def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]

def numeric_value(effects, rank):
    """Native145424990 +145426f20, including their original23-entry jump tables.

    The discriminant is one byte. Bytes1..3 may contain variant data, so the
    historical u32 `tag` field must never be used as an enum value.
    """
    raw_units = {6, 15, 25, 26}
    # This helper multiplies only the selected leading float, not every field.
    scaled_at_four = {0, 2, 3, 4, 5, 7, 8, 11, 13, 15, 16, 17, 18, 22}
    scaled_at_eight = {6, 9, 12}
    for effect in effects:
        payload = bytes.fromhex(effect['payload'])
        variant = payload[0]
        value = lambda at: struct.unpack_from('<f', payload, at)[0]
        if variant == 30:
            result = f32(value(4) * rank)
            percent = payload[8] not in raw_units
        elif variant == 31:
            result = f32(value(32) * rank)
            percent = payload[36] != 2
        elif variant <= 22 and variant not in {10, 14, 19, 20}:
            if variant == 1:
                result = f32(struct.unpack_from('<I', payload, 4)[0])
                percent = False
            else:
                at = 8 if variant in {6, 9, 12} else 4
                if variant == 8 and struct.unpack_from('<I', payload, 8)[0] == 0xffffffff:
                    at = 12
                result = value(at)
                if (at == 4 and variant in scaled_at_four) or (at == 8 and variant in scaled_at_eight):
                    result = f32(result * max(rank, 1))
                percent = variant != 16 and not (variant == 15 and payload[1] in raw_units)
        else:
            continue
        if percent:
            result = f32(result * 100)
        # The native formatter uses one decimal, removing only the trailing `.0`.
        formatted = f'{result:.1f}'
        return formatted[:-2] if formatted.endswith('.0') else formatted
    return None

def main():
    spec=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py')
    m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
    data=(ROOT/'AzerothSurvivors/AzerothSurvivors.exe').read_bytes()
    assert hashlib.sha256(data).hexdigest()==EXPECTED
    pe=m.PE(data)
    english=json.loads((ROOT/'docs/analysis/evidence/0.92/embedded-english.json').read_text())
    def pair(at):
        p,n=struct.unpack_from('<QQ',data,at)
        return pe.rva_offset(p-pe.image_base),n
    def string(at):
        p,n=pair(at);assert n<10000
        return data[p:p+n].decode()
    classes=[]; evidence=[]
    for index,key in enumerate(['warrior','paladin','hunter','rogue','priest','shaman','mage','warlock','druid']):
        at=0x68aab48+index*200
        class_id=struct.unpack_from('<Q',data,at+192)[0]
        assert class_id==[1,2,3,4,5,7,8,9,11][index]
        trees=[]
        for j in range(3):
            tree_at=at+j*64
            name,background,icon=[string(tree_at+o) for o in [0,16,32]]
            start,count=pair(tree_at+48);assert count in [13,14]
            talents=[]
            for k in range(count):
                row=start+k*104
                talent_key,title,talent_icon,description=[string(row+o) for o in [0,16,32,64]]
                assert title in english and description in english
                packed=list(data[row+96:row+104]);assert packed[0]<=6 and packed[1]<=2 and packed[2] in [1,2,3,5] and packed[3:]==[0]*5
                prerequisite=string(row+80) if struct.unpack_from('<Q',data,row+80)[0] else None
                effects,n=pair(row+48);assert 1<=n<=4
                effect_rows=[dict(tag=struct.unpack_from('<I',data,effects+e*64)[0],payload=data[effects+e*64:effects+(e+1)*64].hex()) for e in range(n)]
                numeric_values=[numeric_value(effect_rows,rank) for rank in range(1,packed[2]+1)]
                milestone=packed[0] != 0 and packed[0] % 2 == 0 and packed[2] == 1 and any(bytes.fromhex(effect['payload'])[0] <= 29 for effect in effect_rows)
                talents.append(dict(key=talent_key,name=title,icon=talent_icon,description=description,row=packed[0],column=packed[1],max_rank=packed[2],prerequisite=prerequisite,effects=effect_rows,numeric_values=numeric_values,milestone=milestone))
                evidence.append(dict(key=talent_key,file_offset=hex(row),virtual_address=hex(pe.offset_va(row)),sha256=hashlib.sha256(data[row:row+104]).hexdigest()))
            keys={t['key'] for t in talents};assert all(t['prerequisite'] is None or t['prerequisite'] in keys for t in talents)
            trees.append(dict(name=name,background=background,icon=icon,talents=talents))
        classes.append(dict(key=key,id=class_id,trees=trees))
    result=dict(version='0.92.0',classes=classes)
    (ROOT/'crates/azeroth-survivors-re/assets/talents.json').write_text(json.dumps(result,indent=2,ensure_ascii=False)+'\n')
    (ROOT/'docs/analysis/evidence/0.92/talent-definitions.json').write_text(json.dumps(dict(artifact_sha256=EXPECTED,target_executed=False,index=dict(file_offset='0x68aab48',virtual_address=hex(pe.offset_va(0x68aab48)),count=9,stride_bytes=200),tree_stride=64,talent_stride=104,description_formatter=dict(function='0x145424990',rank_scaling_helper='0x145426f20',formatter_jump_table='0x1468aedb0',scaling_jump_table='0x1468aee68',effect_discriminant_bytes=1),records=evidence,limits=['The extractor performs static reads only; runtime allocation proof is recorded separately in talents-0.92-recovery.md.','Per-rank tooltip numbers are recovered from native consumers; application of talent effects during gameplay is outside the implemented menu scope.','Pixel parity and malformed imported allocation normalization remain unverified.']),indent=2)+'\n')
    print(f'Recovered {sum(len(t["talents"]) for c in classes for t in c["trees"])} talents in 27 trees, including native per-rank description values.')
if __name__=='__main__':main()
