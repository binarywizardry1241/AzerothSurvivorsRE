#!/usr/bin/env python3
"""Recover complete current raid root/recursive native records; no compiler/game.

The native enum payload is48bytes, recurring descriptors append8bytes, health
phases prepend16bytes and append8bytes. Registry retains each native address,
including equal payloads, so source-index references are reproducible.
"""
from script_sources import load_script
import argparse, hashlib, json, struct
from coverage_common import ROOT,latest_target,target_bytes
SHA='76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
OUT=ROOT/'docs/analysis/evidence/0.109.0/raid-native'

def prepare_rea(raw):
 """Stage fresh target-bound raw inputs and portable REA batch plans only."""
 work=ROOT/'runtime/raid-native-recovery-0.109.0';work.mkdir(parents=True,exist_ok=True)
 disabled='Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables'
 branches=[(9,0x14595a4d0),(10,0x14595950f),(11,0x14595a66c),(13,0x14595a60b),(14,0x145958553),(15,0x14595870b),(16,0x14595a082),(17,0x145958025),(20,0x145959a10),(21,0x14595a587),(25,0x14595ab76),(26,0x14595b097),(29,0x14595b8f7),(31,0x14595b1dd),(32,0x14595b75c),(33,0x14595a795)]
 def stage(name,a,b,entries):
  binary=work/(name+'.bin');binary.write_bytes(raw(a,b-a))
  seed=work/(name+'-seed.tsv');seed.write_text(''.join(f'{hex(v)}\tfunction\n{hex(v)}\tcode\n'for _,v in entries))
  plan=dict(target=str(binary.relative_to(ROOT)),output=str((work/('rea-'+name)).relative_to(ROOT)),init_timeout=60,timeout=180,
   environment=dict(REA_GHIDRA_DISABLED_ANALYZERS=disabled,REA_GHIDRA_SEED_FILE=str(seed.relative_to(ROOT))),
   open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),
   operations=[dict(name='procedure_pseudo_code',arguments=dict(procedure=hex(v)),label=str(label))for label,v in entries])
  (work/(name+'-plan.json')).write_text(json.dumps(plan,indent=2)+'\n')
 stage('dispatch',0x1459578e0,0x14595cd42,[(f'tag-{tag}',va)for tag,va in branches])
 stage('transform',0x14594d490,0x14594dd30,[('unit-fields',0x14594d490)])
 stage('boss-health',0x14596dab9,0x14596db66,[('endless-health',0x14596dab9)])
 stage('boss-damage',0x14596dec9,0x14596e028,[('damage-stats',0x14596dec9)])
 print('Prepared raw Ghidra inputs and four REA batch plans in',work.relative_to(ROOT),'; analysis not started')

def verify_rea(span,directory):
 """Verify the compact completed-query evidence against the selected target."""
 record=json.loads((directory/'rea-provenance.json').read_text());assert record['target_sha256']==SHA
 for query in record['queries']:
  source=query['raw_input'];assert span(int(source['va'],16),source['byte_count'])==source
  assert hashlib.sha256((directory/query['pseudocode']).read_bytes()).hexdigest()==query['pseudocode_sha256']

def catalog_text(value):
 """One native node/root per line keeps generated record changes reviewable."""
 lines=['{']
 for name in ['target_version','target_sha256','target_executed']:
  lines.append(f'  {json.dumps(name)}: {json.dumps(value[name])},')
 for name in ['actions','bosses','guardians']:
  rows=value[name];lines.append(f'  {json.dumps(name)}: [')
  lines.extend('    '+json.dumps(row,separators=(',',':'))+(','if i+1<len(rows)else'')for i,row in enumerate(rows))
  lines.append('  ]'+(','if name!='guardians'else''))
 return '\n'.join([*lines,'}'])+'\n'

def recover():
 t=latest_target(verify=True);assert t['sha256']==SHA
 data=target_bytes(t);m = load_script('raid_pe', ROOT/'scripts/inventory-executable.py');pe=m.PE(data)
 def raw(a,n):
  o=pe.rva_offset(a-pe.image_base);v=data[o:o+n];assert len(v)==n;return v
 def span(a,n):return dict(va=hex(a),file_offset=hex(pe.rva_offset(a-pe.image_base)),byte_count=n,sha256=hashlib.sha256(raw(a,n)).hexdigest())
 actions={};bosses=[];guardians=[]
 def add(a,stride=48):
  key=hex(a)
  if key in actions:return key
  v=raw(a,48);w=list(struct.unpack('<12I',v));tag=v[45]
  row=dict(native_tag=tag,words=w,record=span(a,48),children=[],repeat_bits=struct.unpack('<I',raw(a+48,4))[0]if stride==56 else 0)
  actions[key]=row
  if tag==18 or tag<3 or tag==32:
   ptr,n=struct.unpack('<QQ',v[:16]);assert n<1000
   child_stride=48 if tag==18 else 56
   row['children']=[add(ptr+child_stride*i,child_stride)for i in range(n)]
  return key
 for zi in range(12):
  ptr,n=struct.unpack('<QQ',raw(0x146bde390+240*zi+0x88,16))
  for bi in range(n):
   b=ptr+104*bi;bid=struct.unpack('<I',raw(b+64,4))[0];row=dict(boss_id=bid,moves=[],phases=[])
   for role,off,stride in [('moves',16,56),('phases',48,72)]:
    ap,n=struct.unpack('<QQ',raw(b+off,16))
    for slot in range(n):
     a=ap+slot*stride;r=dict(slot=slot,action=add(a+(16 if role=='phases'else 0),56 if role=='moves'else 48),record=span(a,stride))
     if role=='phases':
      text,size=struct.unpack('<QQ',raw(a,16));r.update(threshold_bits=struct.unpack('<I',raw(a+64,4))[0],yell=raw(text,size).decode())
     row[role].append(r)
   bosses.append(row)
 catalog=json.loads((ROOT/'docs/analysis/evidence/0.109.0/guardian-signatures/catalog.json').read_text());assert catalog['target_sha256']==SHA
 for r in catalog['rows']:
  row=dict(enemy_id=r['enemy_id'],variants=[],phases=[])
  for variant in r['variants']:
   row['variants'].append([dict(slot=m['slot'],action=add(int(m['record']['va'],16),56),record=m['record'])for m in variant])
  for p in r['phases']:
   row['phases'].append(dict(slot=p['index'],action=add(int(p['record']['va'],16)+16),threshold_bits=p['words'][16],yell=p['yell'],record=p['record']))
  guardians.append(row)
 keys=sorted(actions,key=lambda v:int(v,16));index={a:i for i,a in enumerate(keys)}
 for key in keys:
  actions[key]['index']=index[key];actions[key]['children']=[index[a]for a in actions[key]['children']]
 for r in bosses:
  for x in r['moves']+r['phases']:x['action']=index[x['action']]
 for r in guardians:
  for v in r['variants']:
   for x in v:x['action']=index[x['action']]
  for x in r['phases']:x['action']=index[x['action']]
 def f32(v):return struct.unpack('<f',struct.pack('<f',v))[0]
 def bits(v):return struct.unpack('<I',struct.pack('<f',v))[0]
 def duration(row):
  w=row['words'];tag=row['native_tag'];f=lambda i:struct.unpack('<f',struct.pack('<I',w[i]))[0]
  if tag in [3,8,9,13,16]:return f(3)
  if tag in [4,5,22,23,0,1,2,32,34]:return 0.
  if tag in [6,19]:return f32(1.3)
  if tag==7:return f32(1.6)
  if tag in [11,12,33]:return f(4)
  if tag in [25,28,30]:return f(2)
  if tag==26:return f(1)
  if tag==10:return f32(f32(f32(w[1])*f32(.35))+f(4))
  if tag==14:return f32(f(2)+1.)
  if tag==15:return f32(f(3)+f(4))
  if tag==17:return f32(f32(f32(w[2])*f(5))+f(4))
  if tag==18:return 0. if not row['children'] else f32(duration(actions[keys[row['children'][-1]]])+f32(f32(len(row['children'])-1)*f(4)))
  if tag==20:return f32(f(1)+.5)
  if tag==21:return .5
  if tag==24:return f32(f32(f(4)*.5)+1.)
  if tag in [27,29]:return f32(f32(f32(w[1]if tag==27 else w[5])*f(4))+f(3))
  if tag==31:return f32(f32(f32(w[3])*f32(.45))+f(6))
  raise AssertionError(('unknown native duration',tag))
 for key in keys:actions[key]['duration_bits']=bits(duration(actions[key]))
 result=dict(target_version=t['version'],target_sha256=SHA,target_executed=False,actions=[actions[k]for k in keys],bosses=bosses,guardians=guardians)
 return t,raw,span,result

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--write',action='store_true');p.add_argument('--prepare-rea',action='store_true');a=p.parse_args();_,raw,_,j=recover()
 if a.prepare_rea:prepare_rea(raw);return
 text=catalog_text(j);path=OUT/'catalog.json'
 if a.write:OUT.mkdir(parents=True,exist_ok=True);path.write_text(text)
 else:assert path.read_text()==text,'Native raid graph drifted'
 print('Raid native graph:',len(j['actions']),'actions;',sum(len(b['moves'])for b in j['bosses']),'boss moves;',sum(len(b['phases'])for b in j['bosses']),'boss phases; no compiler/game')
if __name__=='__main__':main()
