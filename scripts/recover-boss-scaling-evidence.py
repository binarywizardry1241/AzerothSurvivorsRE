#!/usr/bin/env python3
"""Retain hash-bound 0.97.2 primary-boss creation evidence and REA provenance."""
from portable_paths import objdump_output, portable_json
from pathlib import Path
import hashlib,importlib.util,json,struct,subprocess
ROOT=Path(__file__).resolve().parents[1]
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
EXPECTED='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
OUT=ROOT/'docs/analysis/evidence/bosses';RUN=ROOT/'runtime/analysis/history/raid/bosses/c18a36bfd52c/scaling'
def main():
 data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==EXPECTED
 spec=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py');inv=importlib.util.module_from_spec(spec);spec.loader.exec_module(inv);pe=inv.PE(data)
 def rec(a,b):
  o=pe.rva_offset(a-pe.image_base);raw=data[o:o+b-a];return {'va':hex(a),'end_exclusive':hex(b),'file_offset':hex(o),'byte_count':b-a,'sha256':hashlib.sha256(raw).hexdigest()}
 function=rec(0x1454bf100,0x1454bfeec);assert any(pe.image_base+a==0x1454bf100 and pe.image_base+b==0x1454bfeec for a,b,_ in pe.functions())
 OUT.mkdir(parents=True,exist_ok=True)
 spans=[]
 for name,a,b in [('scaling-health-and-entity',0x1454bf2cc,0x1454bf3e0),('scaling-initial-ability-timers',0x1454bf3e0,0x1454bf6b7),('scaling-damage-and-actor',0x1454bf6b7,0x1454bf8b7)]:
  asm=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={b:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True);p=OUT/(name+'.asm');p.write_text(asm);spans.append({'label':name,**rec(a,b),'assembly':p.name,'assembly_sha256':hashlib.sha256(asm.encode()).hexdigest()})
 constants=[]
 for a,n in [(0x1469aa530,8),(0x1469aa540,16),(0x1469aa550,4),(0x1458eb52c,4),(0x146627ee0,16),(0x145930f00,4),(0x1458fcc38,4),(0x145c14514,4),(0x14590af00,4),(0x1458eb480,4)]:
  o=pe.rva_offset(a-pe.image_base);constants.append({**rec(a,a+n),'words':list(struct.unpack('<'+'I'*(n//4),data[o:o+n]))})
 bundle=json.loads((RUN/'rea-1454bf100/evidence-bundle.json').read_text());records=[]
 for e in bundle['records']:
  if e['operation']=='analyze_function':
   raw=e['normalized_result']['pseudocode'];start=raw.index('LAB_1454bf2cc:');end=raw.index('  puStack_e0 = (undefined1 *)0x14571e040;',start)
   record={k:e.get(k)for k in ['evidence_id','operation','parameters','subject','provider','analysis_profile','limitations']};record['full_pseudocode_sha256']=hashlib.sha256(raw.encode()).hexdigest();record['pseudocode_excerpt']=raw[start:end];record['excerpt_note']='Constructor stat/cooldown/actor source excerpt; original SSE operand order and Win64 registers govern.';records.append(record)
 result={'date':'2026-10-18','target_version':'0.97.2','target_sha256':EXPECTED,'target_executed':False,'constructor':function,'spans':spans,'constants':constants,'rea_records':records,
 'limitations':['Static evidence and bounded instruction emulation do not establish gameplay/runtime parity.','Placement/announcement/account JSON and external engine implementations have separate owners.','Windows CRT powf is an explicit fixture seam; complete cross-platform bit parity is unverified.']}
 (OUT/'scaling-native.json').write_text(portable_json(result,indent=2)+'\n');print('Retained boss constructor,3focused scopes,10constant spans and REA record')
if __name__=='__main__':main()
