#!/usr/bin/env python3
"""Check every current Warlock run-entry effect using the original rank collector.

No build or game runs. Numeric rank overrides and nonnumeric rank scaling are
checked independently. Ignored native union padding is never treated as data.
"""
from native_recovery import f32 as _shared_f32
import argparse
import hashlib
import json
import re
import struct

import native_talent_fixture as n

ROOT=n.ROOT
SHA='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
ASSET=ROOT/'crates/azeroth-survivors-re/assets/warlock-effects-0.112.0.json'
PROOF=ROOT/'docs/analysis/evidence/0.112.0/warlock-talents/effect-cases.json'


def raw(address,size):
 offset=n.pe.rva_offset(address-n.pe.image_base)
 if offset is None or offset<0 or size<0 or offset+size>len(n.data):raise ValueError('Unmapped current range')
 return n.data[offset:offset+size]
def pair(address):return struct.unpack('<QQ',raw(address,16))
def text(address):
 p,c=pair(address)
 return raw(p,c).decode()if p else None
def f32(v):
    return _shared_f32(v)
def floats(raw):return struct.unpack('<f',raw)[0]

def recover():
 if n.target['sha256']!=SHA:raise ValueError('Exact current installed target required')
 manifest_path=ROOT/'docs/analysis/evidence/0.112.0/warrior-talents/manifest.json'
 manifest=json.loads(manifest_path.read_text())
 if manifest['target']['sha256']!=SHA:raise ValueError('Current collector manifest target drift')
 for span in manifest['ranges']:
  start=int(span['start'],16);end=int(span['end_exclusive'],16)
  if hashlib.sha256(raw(start,end-start)).hexdigest()!=span['sha256']:raise ValueError('Current collector native range drift')
 if hashlib.sha256((manifest_path.parent/'selected-native.asm').read_bytes()).hexdigest()!=manifest['assembly_sha256']:
  raise ValueError('Current collector canonical extraction drift')
 own_manifest_path=PROOF.parent/'manifest.json'
 own_manifest=json.loads(own_manifest_path.read_text())
 if own_manifest['target_sha256']!=SHA:raise ValueError('Current Warlock manifest target drift')
 for span in own_manifest['ranges']:
  if hashlib.sha256(raw(int(span['address'],16),span['byte_count'])).hexdigest()!=span['sha256']:
   raise ValueError('Current Warlock native range drift')
  for field in ['assembly','pseudocode']:
   if field in span and hashlib.sha256((own_manifest_path.parent/span[field]).read_bytes()).hexdigest()!=span[field+'_sha256']:
    raise ValueError('Current Warlock canonical extraction drift')
 vm=n.Machine();talents=[];cases=[];retained_army=[]
 for tree_index in range(3):
  pointer,count=pair(0x14723e9d8+tree_index*64+48)
  for index in range(count):
   address=pointer+index*160;key=text(address+48);weights,c=pair(address+32)
   rank_values=[floats(raw(weights+i*4,4))for i in range(c)]if weights else []
   effects,c=pair(address+96);payloads=[];source_indices={}
   for effect_index in range(c):
    original=bytearray(raw(effects+effect_index*64,64));tag=original[0];converted=original.copy();strings=[];lists=[]
    if tag in [29,30]:
     # Config/actors own behavior, but native aggregation retains these rows
     # in the generic vector. Keep their index without a second behavioral owner.
     retained_army.append(dict(key=key,native_tag=tag))
    if tag in [29,30,31,32,33,34,35]:converted[0]=253;converted[63]=tag
    elif tag==36:converted[0]=30
    elif tag==37:converted[0]=31
    for at in range(0,49,8):
     p,length=struct.unpack_from('<QQ',original,at)
     if p and 0<length<=128:
      try:value=raw(p,length).decode()
      except(ValueError,UnicodeError,struct.error):value=None
      if value is not None and re.fullmatch(r'[a-z][a-z0-9_:]*',value):strings.append(dict(offset=at,value=value))
     if p and 0<length<=16:
      try:values=[text(p+i*16)for i in range(length)]
      except(ValueError,UnicodeError,struct.error):continue
      if all(value and re.fullmatch(r'[a-z][a-z0-9_:]*',value)for value in values):lists.append(dict(offset=at,values=values))
    payload=dict(raw_hex=converted.hex(),strings=strings,lists=lists,rank_values=rank_values if tag in [36,37]else [])
    source_indices[effect_index]=len(payloads)
    payloads.append(payload)
   talents.append(dict(key=key,name=text(address+64),icon=text(address+80),effects=payloads))
   for rank in range(1,raw(address+154,1)[0]+1):
    values=vm.vector([(address,rank)]);out=vm.alloc(24);vm.call(0x14599e8d0,out,values)
    p,total=vm.q(out+8),vm.q(out+16)
    if total!=c:raise ValueError('Current collector effect count drift')
    for effect_index in range(c):
     base=bytearray(raw(effects+effect_index*64,64));tag=base[0];native=bytes(vm.u.mem_read(p+effect_index*72+8,64))
     case=dict(key=key,rank=rank,native_tag=tag,effect_index=effect_index,
               source_effect_index=source_indices.get(effect_index))
     factor=rank_values[rank-1]if rank_values and tag in [36,37]else float(rank)
     offset=None;expected=None
     if tag==36:offset=4;expected=f32(floats(base[4:8])*factor)
     elif tag==37:offset=32;expected=f32(floats(base[32:36])*factor)
     elif tag==35:offset=4;expected=f32(floats(base[4:8])*max(f32(f32(f32(rank-1)*.5)+1.),1.))
     elif tag in [0,2,3,4,5,7,11,13,15,16,17,18,22,31]:offset=4;expected=f32(floats(base[4:8])*factor)
     elif tag in [6,9,12]:offset=8;expected=f32(floats(base[8:12])*factor)
     elif tag==8:offset=12 if base[8:12]==b'\xff'*4 else 4;expected=f32(floats(base[offset:offset+4])*factor)
     if offset is not None:
      actual=floats(native[offset:offset+4])
      if actual!=expected:raise ValueError(('Current effect scale mismatch',key,rank,tag,actual,expected))
      cases.append(dict(case,offset=offset,value_bits=struct.unpack_from('<I',native,offset)[0]))
     elif tag in [30,33]:
      if native[1]!=rank:raise ValueError('Current special-demon rank drift')
      cases.append(dict(case,rank_byte=native[1]))
     else:
      cases.append(dict(case,unchanged_semantic_payload=True))
 return dict(target_sha256=SHA,talents=talents),dict(target_sha256=SHA,version='0.112.0',cases=cases,
  retained_army_rows=retained_army,collector_manifest='docs/analysis/evidence/0.112.0/warrior-talents/manifest.json',
  limits=['Whole current collector executes; native union padding is excluded from the semantic comparison.',
          'Army grant/rank rows29..30 retain native generic vector indices as markers; Config/actors alone own behavior. Marker31 retains Soul Link amounts.',
          'No source compilation, game, presentation or original/rebuilt comparison.'])


def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--write',action='store_true');args=p.parse_args();asset,proof=recover()
 for path,value in [(ASSET,asset),(PROOF,proof)]:
  serialized=json.dumps(value,indent=2)+'\n'
  if args.write:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(serialized)
  elif path.read_text()!=serialized:raise ValueError(f'Missing/stale Warlock effects: {path.relative_to(ROOT)}')
 print(f"40 current run-entry talents and {len(proof['cases'])} rank/effect cases pass; no build or game run.")


if __name__=='__main__':main()
