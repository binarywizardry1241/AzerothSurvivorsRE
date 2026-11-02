#!/usr/bin/env python3
"""Replay current equipped gear names and jewelry/amulet text, without a build.

Native current constructors execute. Definition bytes, current source locale
catalogs, allocation, Unicode casing, formatting and named CRT imports are
explicit fixtures. English native outputs also form authored Rust regressions;
this checker does not execute Rust or establish application parity.
"""
import argparse,hashlib,json,math,struct
from pathlib import Path
import inventory_text_native as m
from coverage_common import ROOT

OUT=ROOT/'docs/analysis/evidence/0.113.2/equipped-inventory/prose.json'
FIXTURE=ROOT/'crates/azeroth-survivors-re/tests/fixtures/equipped-inventory-0.113.2.json'
SHA='58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
assets=ROOT/'crates/azeroth-survivors-re/assets'
f32=lambda value:struct.unpack('<f',struct.pack('<f',value))[0]
def digest(value):return hashlib.sha256(json.dumps(value,ensure_ascii=False,sort_keys=True).encode()).hexdigest()
gear=json.loads((assets/'armory.json').read_text());pvp=json.loads((assets/'pvp-gear-0.105.0.json').read_text());rules=json.loads((assets/'armory-name-rules-0.109.0.json').read_text())
rows=[]
for cls in gear['classes']+pvp['classes']:
 for row in cls['items']:
  rows.append(row)
  if row.get('horde'):rows.append(dict(row,id=row['id']+10,name=row['horde']['name']))
def expected_name(row,locale):
 fallback=row['name'];rule=next(v for v in rules['classes']if v['id']==(row['id']-100000)//1000);slot=row['slot'];rarity=row['rarity']
 if slot>=8:return locale.get('weapon.pvp.'+fallback if rarity==5 else f"weapon.{rule['key']}.{slot-8}.{rarity}",fallback)
 noun=rules['nouns'][rule['material']][slot]
 if rarity==5:set_fallback=fallback[:-len(noun)-1];key='set.pvp.'+set_fallback;suffix=False
 else:set_fallback=rule['sets'][rarity]['fallback'];key=f"set.{rule['key']}.{rarity}";suffix=rule['sets'][rarity]['suffix']
 template=locale.get('item.name_of'if suffix else 'item.name_prefix','{noun} of {set}'if suffix else '{set} {noun}')
 return template.replace('{noun}',locale.get(f"noun.{rule['material']}.{slot}",noun)).replace('{set}',locale.get(key,set_fallback))
cat=json.loads((assets/'native-amulets-0.100.1.json').read_text())
amulets=[row for row in cat['shared']+cat['generated']if row['key']!='star_of_mystaria']+[json.loads((assets/'legionlord-0.112.0.json').read_text())['definition']]
assert len(amulets)==129
# Independent current inventory-owner exponent branch. It is reused by all
# amulet vectors; powf is a named mathematical seam with current IAT identity.
m.ranges.append((0x145970460,0x1459704c5))
def multiplier(rarity,picks):
 frame=m.alloc(0x400);game=m.alloc(0x500);m.u.mem_write(game+0x400,struct.pack('<II',rarity,0));m.u.mem_write(game+0x408,struct.pack('<I',picks))
 m.u.reg_write(m.r.UC_X86_REG_RBP,frame);m.u.reg_write(m.r.UC_X86_REG_R12,game);m.u.reg_write(m.r.UC_X86_REG_RSP,m.ns['stack']+0x1f0008)
 m.u.emu_start(0x145970460,0x1459704c5,count=10000)
 result=struct.unpack('<f',m.u.mem_read(frame+0x150,4))[0]
 retention=f32(1.+f32([.6,.5,.35,.25,.2][rarity]*-.5));expected=f32(3.-f32(2.*f32(math.pow(retention,max(0,picks-1)))))
 assert result==expected,(rarity,picks,result,expected)
 return result
imports=[]
for address,name in [(0x145cf9a15,'powf'),(0x145cf9a27,'floorf'),(0x145cf999d,'memmove')]:
 offset=m.pe.rva_offset(address-m.pe.image_base);thunk=m.ns['data'][offset:offset+6];assert thunk[:2]==b'\xff\x25';iat=address+6+struct.unpack_from('<i',thunk,2)[0];found=[]
 for library in m.pe.imports():
  index=(iat-int(library['iat_start_address'],16))//8
  if 0<=index<len(library['functions']):found.append((library['library'],library['functions'][index]))
 assert len(found)==1 and found[0][1]==name,(address,found)
 imports.append(dict(thunk=hex(address),iat=hex(iat),library=found[0][0],symbol=name))
factors=[]
for rarity in range(5):
 for picks in [0,1,2,5,10]:
  m.ns['cursor']=m.ns['heap']+0x1000;factors.append([rarity,picks,multiplier(rarity,picks)])
languages=[];jewelry_fixture=[];amulet_fixture=[];keys=set();scaling_cases=0
for code in ['en','pl','cs','de','pt','es','fr','ro','tr','ru','uk','zh','ja','ko']:
 locale=json.loads((assets/f'locales/{code}.json').read_text());m.ns['locale']=locale;names=[];jewelry=[];amulet_rows=[]
 for row in rows:
  m.ns['cursor']=m.ns['heap']+0x1000;out=m.alloc(112);m.invoke(0x145825570,out,row['id']);actual=m.ns['pair'](out+8);assert actual==expected_name(row,locale),(code,row['id'],actual);names.append(actual)
 for native_tag in range(20):
  for amount in [0.,.005,.1234,.15,.75,1.5]:
   m.ns['cursor']=m.ns['heap']+0x1000;definition=m.alloc(72);m.u.mem_write(definition+0x44,bytes([native_tag]));m.u.mem_write(definition+0x40,struct.pack('<f',.05));out=m.alloc(24);m.invoke(0x145849050,out,definition,xmm2=amount)
   lines=[m.ns['pair'](m.q(out+8)+i*24+8)for i in range(m.q(out+16))];source_tag=19 if native_tag==6 else native_tag-1 if native_tag>=7 else native_tag
   record=dict(tag=source_tag,amount=f32(amount),base=f32(.05),lines=lines);jewelry.append(record)
   if code=='en':jewelry_fixture.append(record)
 for row in amulets:
  for picks in [1,2,5]:
   m.ns['cursor']=m.ns['heap']+0x1000;records=[];factor=multiplier(row['rarity'],picks)
   for effect in row['effects']:
    raw=bytearray.fromhex(effect['raw_hex']);raw[0]={30:36,31:37}.get(raw[0],raw[0])
    for string in effect['strings']:
     value=string['value'].encode();at=m.alloc(len(value)+1);m.u.mem_write(at,value);struct.pack_into('<QQ',raw,string['offset'],at,len(value))
    records.append(raw)
   at=m.alloc(len(records)*64);m.u.mem_write(at,b''.join(records));factor_at=m.alloc(4);m.u.mem_write(factor_at,struct.pack('<f',factor));iterator=m.alloc(24);m.put(iterator,at,at+len(records)*64,factor_at);scaled=m.alloc(24);m.invoke(0x1459910d0,scaled,iterator)
   # Source scaled_bytes changes only the declared magnitude; native preserves
   # padding as unspecified bytes, so compare semantic words and owned strings.
   for index,(effect,raw) in enumerate(zip(row['effects'],records)):
    old=effect['raw_hex'];tag=int(old[:2],16);offset=4 if tag in [0,2,3,4,5,7,11,13,15,16,17,18,22,30] else 8 if tag in [6,9,12] else (12 if bytes.fromhex(old)[8:12]==bytes([255])*4 else 4)if tag==8 else 32 if tag==31 else None
    if offset is not None:
     value=f32(struct.unpack_from('<f',raw,offset)[0]*factor)
     if tag==31 and raw[36]==1:value=min(value,.5)
     if tag==31 and raw[36]==2:value=math.floor(f32(value+struct.unpack('<f',bytes.fromhex('17b7d138'))[0]))
     actual=struct.unpack('<f',m.u.mem_read(m.q(scaled+8)+index*64+offset,4))[0];assert actual==value,(row['key'],picks,offset,actual,value)
    scaling_cases+=1
   output=m.alloc(24);count=m.alloc(8);buffer=m.alloc(len(records)*24);m.put(output,count,0,buffer);m.invoke(0x1459a9e30,m.q(scaled+8),m.q(scaled+8)+m.q(scaled+16)*64,output)
   lines=[m.ns['pair'](buffer+i*24+8)for i in range(m.q(count))];record=dict(key=row['key'],rarity=row['rarity'],picks=picks,lines=lines);amulet_rows.append(record)
   if code=='en':amulet_fixture.append(record)
 keys.update(m.ns['lookups']);m.ns['lookups']=[]
 languages.append(dict(locale=code,name_cases=len(names),names_sha256=digest(names),jewelry_cases=len(jewelry),jewelry_sha256=digest(jewelry),amulet_cases=len(amulet_rows),amulet_sha256=digest(amulet_rows)))
 print(f'{code}:581 names,120 jewelry,387 amulet vectors',flush=True)
spans=[]
for a,z in m.ranges:
 offset=m.pe.rva_offset(a-m.pe.image_base);spans.append(dict(address=hex(a),end_exclusive=hex(z),sha256=hashlib.sha256(m.ns['data'][offset:offset+z-a]).hexdigest()))
fixture=dict(target_sha256=SHA,jewelry=jewelry_fixture,amulets=amulet_fixture)
record=dict(target_sha256=SHA,mathematical_imports=imports,amulet_factors=factors,languages=languages,semantic_effect_scaling_cases=scaling_cases,ranges=spans,locale_keys=sorted(keys),english_fixture_sha256=digest(fixture),
 limits=['Actual current native names match the existing piece_name grammar across14 locales.',
 'Temporary definitions and owned strings are fixture inputs; current factor/scaling/line constructors execute.',
 'No Rust is executed. The English fixture is consumed by authored, unrun Rust source regressions.',
 'Allocation, String formatting, locale lookup, Unicode casing, powf/floorf/roundf/truncf are explicit host seams.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--write',action='store_true');args=parser.parse_args()
for path,value in [(OUT,record),(FIXTURE,fixture)]:
 if args.write:path.write_text(json.dumps(value,ensure_ascii=False,indent=2)+'\n')
 else:assert json.loads(path.read_text())==value,path
print('Passed8134 current names,1680 jewelry and5418 amulet text vectors; no compiler/game.')
