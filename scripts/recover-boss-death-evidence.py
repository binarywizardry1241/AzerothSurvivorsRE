#!/usr/bin/env python3
"""Retain focused hash-bound 0.97.2 boss death, meter and completion evidence.

Reuse matching selected-target REA records instead of reanalysing shared large
functions. New XP-attraction helper analysis is retained separately. No launch.
"""
from portable_paths import objdump_output, portable_json
from pathlib import Path
import hashlib,importlib.util,json,subprocess
ROOT=Path(__file__).resolve().parents[1]
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
EXPECTED='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUT=ROOT/'docs/analysis/evidence/bosses'
SPANS=[('primary-boss-survivor-scan',0x1454c41d3,0x1454c422b),('primary-boss-counter-meter',0x1454c44dd,0x1454c450f),
 ('primary-boss-announcement-account',0x1454c450f,0x1454c46d9),('primary-boss-pickups',0x1454c46d9,0x1454c47cb),
 ('primary-boss-equipment-admission',0x1454c47cb,0x1454c4859),('primary-boss-equipment-roll',0x1454c4922,0x1454c4ab3),
 ('primary-boss-final-phase',0x1454c4ab3,0x1454c4af9),('deferred-completion',0x1454aa103,0x1454aa235),
 ('experience-attraction',0x1454d23c5,0x1454d24fb),('boss-meter-start',0x1454c35ee,0x1454c3668),
 ('boss-meter-empty',0x1454988e5,0x14549899d),('boss-meter-time-live',0x145498ab1,0x145498b53),
 ('completion-stop-live-actors',0x145493030,0x145493198),('completion-packet',0x14543fb70,0x14543fc5b),
 ('completion-statistics',0x1454b6620,0x1454b6a6d)]
STRINGS=[(0x1469ab877,13),(0x1469ab884,8),(0x1469aa7df,7),(0x1469aafed,5),(0x1469aaff2,4),(0x1469aaff6,4),(0x1469aaffa,5),(0x1469ab0fa,9)]
def main():
 data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==EXPECTED
 spec=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py');inv=importlib.util.module_from_spec(spec);spec.loader.exec_module(inv);pe=inv.PE(data)
 ext={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
 def rec(a,b):
  o=pe.rva_offset(a-pe.image_base);raw=data[o:o+b-a];return {'va':hex(a),'end_exclusive':hex(b),'file_offset':hex(o),'byte_count':b-a,'sha256':hashlib.sha256(raw).hexdigest()}
 OUT.mkdir(parents=True,exist_ok=True);spans=[]
 for name,a,b in SPANS:
  asm=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True);p=OUT/('death-'+name+'.asm');p.write_text(asm);spans.append({'label':name,**rec(a,b),'assembly':p.name,'assembly_sha256':hashlib.sha256(asm.encode()).hexdigest()})
 strings=[]
 for a,n in STRINGS:
  o=pe.rva_offset(a-pe.image_base);strings.append({**rec(a,a+n),'text':data[o:o+n].decode('ascii')})
 records=[];functions=[]
 for a,bundlepath,rawpath in [(0x1454c2eb0,'runtime/analysis/history/raid/guardians/b4a536d2fa6d/rea-1454c2eb0/evidence-bundle.json','runtime/analysis/history/raid/guardians/b4a536d2fa6d/1454c2eb0.bin'),
     (0x14549d550,'runtime/analysis/history/raid/guardians/b4a536d2fa6d/rea-14549d550/evidence-bundle.json','runtime/analysis/history/raid/guardians/b4a536d2fa6d/14549d550.bin'),
     (0x1454d2380,'runtime/analysis/history/raid/bosses/c18a36bfd52c/scaling/rea-1454d2380/evidence-bundle.json','runtime/analysis/history/raid/bosses/c18a36bfd52c/scaling/1454d2380.bin')]:
  native=rec(a,ext[a]);assert hashlib.sha256((ROOT/rawpath).read_bytes()).hexdigest()==native['sha256'];functions.append(native)
  bundle=json.loads((ROOT/bundlepath).read_text())
  for e in bundle['records']:
   if e['operation']!='analyze_function':continue
   raw=e['normalized_result']['pseudocode']
   if a==0x1454c2eb0:
    start=raw.index('    else {\n      lVar33 = param_7[0x9a] * 0x160;');end=raw.index('    func_0x0001455127d0();',start);excerpt=raw[start:end]
   elif a==0x14549d550:
    start=raw.index('LAB_1454aa103:');end=raw.index('LAB_1454aa235:',start);excerpt=raw[start:end]
   else:excerpt=raw
   row={k:e.get(k)for k in ['evidence_id','operation','parameters','subject','provider','analysis_profile','limitations']};row.update({'full_pseudocode_sha256':hashlib.sha256(raw.encode()).hexdigest(),'pseudocode_excerpt':excerpt,'excerpt_note':'Focused non-source Ghidra evidence. Original native instructions/Win64 ABI govern; unrelated common death behavior is omitted.'});records.append(row)
 result={'date':'2026-10-18','target_version':'0.97.2','target_sha256':EXPECTED,'target_executed':False,'functions':functions,'spans':spans,'strings':strings,'rea_records':records,
 'limitations':['Source components do not establish complete world-loop or runtime parity.','Shared generic death, pickup/entity, equipment, movement-packet and account serialization/persistence owners remain required engine integration seams.','Completion callback145492fd0 freezes movements; no direct save call exists in the retained deferred-completion branch.','Native fixture equipment candidate generation is stubbed empty; existing mob_loot contains separately recovered equipment logic.','No compilation, compiler checks, Rust tests or game launch occurred.']}
 (OUT/'death-native.json').write_text(portable_json(result,indent=2)+'\n');print(f'Retained {len(spans)} native scopes, {len(strings)} literal strings and {len(records)} selected-target REA records')
if __name__=='__main__':main()
