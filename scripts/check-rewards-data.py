#!/usr/bin/env python3
"""Check current Rewards records against connected assets without compiling."""
from script_sources import load_script
import argparse, hashlib, json, struct
from coverage_common import ROOT,latest_target,target_bytes
parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--stage',action='store_true');args=parser.parse_args()
t=latest_target(verify=True);assert t['sha256']=='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0';d=target_bytes(t)
m = load_script('pe', ROOT/'scripts/inventory-executable.py');p=m.PE(d)
def raw(a,n):off=p.rva_offset(a-p.image_base);return d[off:off+n]
def string(a):
 ptr,n=struct.unpack('<QQ',raw(a,16))
 if ptr==0:assert n==0;return None
 assert n<10000
 return raw(ptr,n).decode()
asset=json.loads((ROOT/'crates/azeroth-survivors-re/assets/progression.json').read_text());records={};tables=[]
for kind,a,count,stride in [('perks',0x145ded238,13,120),('companions',0x145deef18,13,96),('tabards',0x145def618,20,64)]:
 rows=[]
 for i in range(count):
  at=a+i*stride
  if kind=='perks':
   costs,n,descs,nn=struct.unpack('<4Q',raw(at+48,32));assert n==nn and 1<=n<=3
   row=dict(key=string(at),name=string(at+16),icon=string(at+32),costs=list(struct.unpack('<'+'I'*n,raw(costs,n*4))),descriptions=[string(descs+j*16)for j in range(n)],achievement=string(at+80),prerequisite=string(at+96),category=raw(at+112,1)[0])
  elif kind=='companions':
   display,scale,creature=struct.unpack('<IfI',raw(at+80,12));row=dict(key=string(at),name=string(at+16),model=string(at+32),icon=string(at+48),achievement=string(at+64),display_id=display,scale=scale,creature_id=creature)
  else:
   item,display,cost=struct.unpack('<III',raw(at+48,12));row=dict(id=item,name=string(at),icon=string(at+16),zone=string(at+32),display_id=display,cost=cost)
  retained={k:asset[kind][i][k]for k in row};assert row==retained,(kind,i,row,retained);rows.append(row)
 records[kind]=dict(count=count,record_sha256=hashlib.sha256(json.dumps(rows,sort_keys=True,ensure_ascii=False).encode()).hexdigest())
 tables.append(dict(kind=kind,address=hex(a),count=count,stride=stride,sha256=hashlib.sha256(raw(a,count*stride)).hexdigest()))
assert asset['companions'][-1]['key']=='sapphiron'and asset['companions'][-1]['achievement']=='feat:nou'and asset['companions'][-1]['achievement_name']=='no u'
record=dict(target_sha256=t['sha256'],records=records,tables=tables,limits=['Data records only. Runtime selection, account grants, validation, persistence and presentation have separate owning reports; this comparison executes no native function or application.'])
path=ROOT/('runtime/analysis/staging/native-evidence/0.109.0/rewards-menu'if args.stage else'docs/analysis/evidence/0.109.0/rewards-menu')/'data.json'
if args.stage:path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(record,indent=2)+'\n')
else:assert json.loads(path.read_text())==record
print('Verified all current13 perks,13 companions and20 tabards against live asset')
