#!/usr/bin/env python3
"""Recover hash-bound 0.97.2 boss ability dispatch/effect evidence, statically."""
from portable_paths import objdump_output, portable_json
from pathlib import Path
import hashlib, importlib.util, json, struct, subprocess
ROOT=Path(__file__).resolve().parents[1]
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUT=ROOT/'docs/analysis/evidence/bosses'
RUNTIME=ROOT/'runtime/analysis/history/raid/boss-abilities/16e013fe9d5f'
BRANCHES=(0x1454ccd0a,0x1454ccf5e,0x1454ccd73,0x1454ccf2a,0x1454ccd44)
FUNCTIONS=(0x1454eeaa0,0x14544b1a0,0x1454f0710,0x1454f08d0)
SCOPES=(('dispatch',0x1454ccbb0,0x1454cdd0b),('effect-resolution',0x1454a3caa,0x1454a417d))
CONSTANTS=(0x1458fc8ac,0x1458eb510,0x1458f6624,0x1458eb4f8,0x1458ed014,
           0x1458f8de0,0x1458eb488,0x1458eb480,0x1458eb4fc,0x1459eb290,
           0x14593e294,0x145a2a5a0,0x1458f8d70,0x1469aa5e0,0x1458f8e00,0x1458f8de4,
           0x145930f10,0x1458f8fa0,0x145933c50,0x1458f6680,0x1458f6600,0x1459c79e8,0x1459c7a20)
def main():
 data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
 spec=importlib.util.spec_from_file_location('i',ROOT/'scripts/inventory-executable.py');i=importlib.util.module_from_spec(spec);spec.loader.exec_module(i);pe=i.PE(data)
 ends={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
 ends.update({0x1454f0710:0x1454f0823,0x1454f08d0:0x1454f0a1a})
 OUT.mkdir(parents=True,exist_ok=True);RUNTIME.mkdir(parents=True,exist_ok=True)
 def bound(a,b):
  o=pe.rva_offset(a-pe.image_base);raw=data[o:o+b-a]
  return dict(va=hex(a),end_exclusive=hex(b),file_offset=hex(o),byte_count=len(raw),sha256=hashlib.sha256(raw).hexdigest())
 slices=[]
 for a,b,owner in [(a,0x1454cdd0b,'0x1454c9510') for a in BRANCHES]+[(0x1454a3caa,0x1454a417d,'0x14549d550')]+[(a,ends[a],hex(a)) for a in FUNCTIONS]:
  row=bound(a,b);row['owning_function']=owner;row['boundary_source']=('Explicit leaf interval through last RET' if a in (0x1454f0710,0x1454f08d0) else 'PE RUNTIME_FUNCTION') if a in FUNCTIONS else 'Original branch-entry-through-shared-tail interval, not a function boundary';slices.append(row)
  path=RUNTIME/f'{a:x}.bin';off=int(row['file_offset'],16);path.write_bytes(data[off:off+b-a])
  plan=dict(target=str(path.relative_to(ROOT)),output=f'runtime/analysis/history/raid/boss-abilities/16e013fe9d5f/rea-{a:x}',open_options=dict(format='raw-binary',architecture='x86_64',entry_point=hex(a)),timeout=240,open_timeout=60,operations=[dict(name='analyze_function',arguments=dict(procedure=hex(a)))])
  (RUNTIME/f'plan-{a:x}.json').write_text(portable_json(plan,indent=2)+'\n')
 scopes=[]
 for name,a,b in SCOPES+tuple((f'{a:x}',a,ends[a]) for a in FUNCTIONS):
  text=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True)
  path=OUT/f'abilities-{name}.asm';path.write_text(text);scopes.append(dict(label=name,**bound(a,b),assembly=path.name,assembly_sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
 constants=[]
 for a in CONSTANTS:
  o=pe.rva_offset(a-pe.image_base);raw=data[o:o+16];constants.append(dict(va=hex(a),hex=raw.hex(),f32=list(struct.unpack('<4f',raw))))
 a=0x1469acdc0;o=pe.rva_offset(a-pe.image_base);table=dict(**bound(a,a+20),hex=data[o:o+20].hex(),branches=[hex(a+struct.unpack_from('<i',data,o+4*j)[0]) for j in range(5)])
 catalog=json.loads((ROOT/'docs/analysis/evidence/guardians/guardian-catalog.json').read_text());assert catalog['target_sha256']==SHA
 rows=[]
 for zone in catalog['zones']:
  for boss in zone['bosses']:
   for ability in boss['abilities']:rows.append(dict(zone=zone['key']['text'],boss_index=boss['index'],boss=boss['name']['text'],slot=ability['index'],**ability))
 records=[]
 for path in RUNTIME.glob('rea-*/evidence-bundle.json'):
  for r in json.loads(path.read_text())['records']:
   if r['operation']!='analyze_function':continue
   pseudo=r['normalized_result'].get('pseudocode','');records.append(dict(evidence_id=r['evidence_id'],operation=r['operation'],parameters=r.get('parameters'),subject=r.get('subject'),provider=r.get('provider'),analysis_profile=r.get('analysis_profile'),limitations=r.get('limitations'),relationship_coverage=r.get('relationship_coverage'),pseudocode_sha256=hashlib.sha256(pseudo.encode()).hexdigest(),pseudocode=pseudo))
 manifest=dict(date='2026-10-18',version='0.97.2',target=str(TARGET.relative_to(ROOT)),target_sha256=SHA,target_executed=False,slices=slices,scopes=scopes,constants=constants,jump_table=table,boss_ability_records=rows,limitations=['Raw Ghidra imports preserve original bytes/virtual addresses; omitted callees/globals and Win64 ABI require original instruction/data audit.','Branch-slice end warnings do not imply an original EXE failure.','No original/rebuilt OS process executed and no source compiled.'])
 (OUT/'abilities-manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
 (OUT/'abilities-rea.json').write_text(portable_json(dict(target_sha256=SHA,records=records),indent=2)+'\n')
 print(f'{len(rows)} boss ability records, {len(scopes)} instruction scopes, {len(records)} REA records.')
if __name__=='__main__':main()
