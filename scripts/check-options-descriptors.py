#!/usr/bin/env python3
"""Compare every current Options descriptor with connected source data; no IO/game."""
from script_sources import load_script
import argparse, hashlib, json, struct
from coverage_common import ROOT,latest_target,target_bytes
SHA='dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a';target=latest_target(verify=True);assert target['sha256']==SHA;data=target_bytes(target)
module = load_script('pe', ROOT/'scripts/inventory-executable.py');pe=module.PE(data)
def raw(a,n):offset=pe.rva_offset(a-pe.image_base);return data[offset:offset+n]
def text(a,n):return raw(a,n).decode()if n else''
source=json.loads((ROOT/'crates/azeroth-survivors-re/assets/options.json').read_text());rows=[];BASE,COUNT,STRIDE=0x145dc2250,105,152;assert len(source['rows'])==COUNT
for index,prior in enumerate(source['rows']):
 at=BASE+index*STRIDE;b=raw(at,STRIDE);key=text(*struct.unpack_from('<QQ',b,32))or'gamma';control=struct.unpack_from('<Q',b,64)[0];storage=struct.unpack_from('<Q',b,24)[0];assert control<=7 and storage<=3;choices=[]
 if control in [4,7]:
  pointer,count=struct.unpack_from('<QQ',b,72);assert count<=32
  for i in range(count):
   stride=32 if control==7 else 16;entry=raw(pointer+i*stride,stride);choices.append(dict(label=text(*struct.unpack_from('<QQ',entry)),value=text(*struct.unpack_from('<QQ',entry,16))if control==7 else str(i)))
 row=dict(key=key,label=text(*struct.unpack_from('<QQ',b,104)),page=b[145],storage=storage,control=control,range=list(struct.unpack_from('<3f',b,88)),inverted=bool(b[72])if control==5 else False,choices=choices,indent=bool(b[144]),linked=text(*struct.unpack_from('<QQ',b,120)),multiplier=struct.unpack_from('<f',b,136)[0]);assert row=={key:prior[key]for key in row},(index,key)
 if storage==1:assert prior['default']==text(*struct.unpack_from('<QQ',b,48)),key
 rows.append(row)
record=dict(target_sha256=SHA,table=dict(va=hex(BASE),count=COUNT,stride=STRIDE,sha256=hashlib.sha256(raw(BASE,COUNT*STRIDE)).hexdigest()),compared_fields=COUNT*11,fields_digest=hashlib.sha256(json.dumps(rows,ensure_ascii=False,sort_keys=True,separators=(',',':')).encode()).hexdigest(),literal_defaults=sum(row['storage']==1 for row in rows),limits=['All105 descriptor records and direct stored defaults match connected source. Historical source addresses retain their actual provenance.','This compares static descriptors only. Engine/global default registration, dispatch, file writes, numeric formatting and active option application remain separate contracts; combatLogFile has its own current replay.'])
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args();path=ROOT/('runtime/analysis/staging/native-evidence/options-descriptors'if args.stage else'docs/analysis/evidence/options-descriptors')/'data.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print('Passed all 105 current Options descriptors / 1155 fields and literal stored defaults')
