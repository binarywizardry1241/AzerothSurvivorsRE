#!/usr/bin/env python3
"""Retain pointer-free run talent payloads and stat-switch evidence from verified PE."""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import hashlib, json, struct, subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
module = load_script('inventory', ROOT/'scripts/inventory-executable.py')
data=(ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').read_bytes(); assert hashlib.sha256(data).hexdigest()==SHA
pe=module.PE(data)
def offset(va):return pe.rva_offset(va-pe.image_base)
def string(ptr,n):
 if not 0<n<256:return None
 try:
  at=offset(ptr); value=data[at:at+n].decode('utf8')
  return value if all(c.isprintable() for c in value) else None
 except (ValueError,UnicodeError,TypeError):return None
def decode(raw):
 strings=[];lists=[]
 for at in range(8,49,8):
  ptr,n=struct.unpack_from('<QQ',raw,at)
  value=string(ptr,n)
  if value:strings.append({'offset':at,'value':value})
  if 0<n<32:
   try:
    array=offset(ptr);values=[]
    for i in range(n):
     text=string(*struct.unpack_from('<QQ',data,array+i*16))
     if not text:break
     values.append(text)
    if len(values)==n:lists.append({'offset':at,'values':values})
   except (ValueError,TypeError,struct.error):pass
 return {'strings':[entry for entry in strings if not any(value['offset']==entry['offset'] for value in lists)],'lists':lists}
source=json.loads((ROOT/'crates/azeroth-survivors-re/assets/talents.json').read_text())
source['target_sha256']=SHA
for cls in source['classes']:
 class_va=0x146735848 if cls['id']==1 else struct.unpack_from('<Q',data,offset(0x1469f84c0)+8*(cls['id']-2))[0]
 cls['leech_bits']=struct.unpack_from('<I',data,offset(class_va+0x88))[0]
 for tree in cls['trees']:
  for row in tree['talents']:
   for effect in row['effects']:
    effect.update(decode(bytes.fromhex(effect['payload'])))
(ROOT/'crates/azeroth-survivors-re/assets/talents.json').write_text(portable_json(source,indent=2,ensure_ascii=False)+'\n')
record={'target_sha256':SHA,'target_executed':False,'owner':'0x1454a6a40','tables':[],'constants':[]}
for name,va,n in [('race',0x1469f85c8,12),('gear',0x1469f85f8,13),('jewelry',0x1469f862c,19),('stats',0x1469f8678,29),('spell_selectors',0x146740018,5),('shared_status',0x1469f8b00,13)]:
 raw=data[offset(va):offset(va)+4*n]
 record['tables'].append({'role':name,'address':hex(va),'sha256':hashlib.sha256(raw).hexdigest(),'destinations':[hex(va+r) for r in struct.unpack('<'+'i'*n,raw)]})
for va in [0x14593f7c0,0x145915914,0x145913300,0x1459132f8,0x1459158a0,0x1459132f4,0x145907534,0x145915800,0x145a47630,0x145a2e6b8,0x14593fc74,0x145907498,0x145907508]:
 record['constants'].append({'address':hex(va),'bits':struct.unpack_from('<I',data,offset(va))[0],'value':struct.unpack_from('<f',data,offset(va))[0]})
out=ROOT/'runtime/analysis/staging/native-evidence/run-effects';out.mkdir(parents=True,exist_ok=True)
(out/'tables-and-payloads.json').write_text(portable_json(record,indent=2)+'\n')
work=ROOT/'runtime/analysis/history/native-recovery/run-effects/9094f1b4dd32';work.mkdir(parents=True,exist_ok=True)
start,end=0x1454848a0,0x145484c07
raw=data[offset(start):offset(start)+end-start]
(work/'effect-scale-leaf.bin').write_bytes(raw)
plan={'target':str((work/'effect-scale-leaf.bin').relative_to(ROOT)),'output':'runtime/analysis/history/native-recovery/run-effects/9094f1b4dd32/rea-scale-leaf','open_options':{'format':'raw-binary','architecture':'x86_64','entry_point':hex(start)},'environment':{'REA_GHIDRA_DISABLED_ANALYZERS':'Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Non-Returning Functions - Discovered','REA_GHIDRA_STARTUP_TIMEOUT_MS':'120000'},'init_timeout':120,'timeout':120,'operations':[{'name':'procedure_pseudo_code','arguments':{'procedure':hex(start)}}]}
(work/'plan-scale-leaf.json').write_text(portable_json(plan,indent=2)+'\n')
functions=[]
bounds={a+pe.image_base:b+pe.image_base for a,b,c in pe.functions()}
for role,va,session in [
 ('run-factory',0x14544f710,'runtime/analysis/history/native-recovery/run-effects/9094f1b4dd32/rea-run-factory'),
 ('perk-run-grants',0x14547ede0,'runtime/analysis/history/native-recovery/run-effects/9094f1b4dd32/rea-perk-run-grants'),
 ('account-xp-factor',0x14547f960,'runtime/analysis/history/native-recovery/run-effects/9094f1b4dd32/rea-account-xp-factor'),
 ('run-result',0x14544a260,'runtime/analysis/history/native-recovery/run-progression/4c78b97d85bc/rea-run-result'),
 ('account-consumer',0x14543f4f0,'runtime/analysis/history/native-recovery/run-progression/4c78b97d85bc/rea-account-consumer'),
 ('shared-status',0x1454ff860,'runtime/analysis/history/native-recovery/generic-status/c956b6c98eb2/rea-status')]:
 end=bounds[va];raw=data[offset(va):offset(va)+end-va]
 owner_source={'address':hex(va),'end_exclusive':hex(end),'file_offset':hex(offset(va)),
         'byte_count':len(raw),'sha256':hashlib.sha256(raw).hexdigest()}
 evidence_path=ROOT/session/'003-procedure_pseudo_code.json'
 if not evidence_path.exists():
  functions.append({'role':role,'source':owner_source,'rea_status':'not-collected'});continue
 response=json.loads(evidence_path.read_text())
 if 'response' not in response:
  functions.append({'role':role,'source':owner_source,'rea_status':'failed','error':response.get('error')});continue
 evidence=response['response']['result']['structuredContent']
 assert evidence['subject']['digest']['sha256']==owner_source['sha256'],role
 (out/f'{role}.ghidra.c').write_text(evidence['normalized_result'])
 (out/f'{role}.asm').write_text(objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={va:#x}',f'--stop-address={end:#x}',str((ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe').relative_to(ROOT))],text=True,cwd=ROOT))
 functions.append({'role':role,'source':owner_source,'evidence_id':evidence['evidence_id'],
                   'analysis_profile':evidence['analysis_profile'],'limitations':evidence['limitations']})
(out/'manifest.json').write_text(portable_json({'target_sha256':SHA,'target_executed':False,
 'method':'Current PE complete unwind functions analyzed with REA/Ghidra; original Win64 assembly controls external call/constant and record interpretation.',
 'functions':functions,'limitations':['Raw Ghidra imports omit external callees, constants and switch tables; no original application execution is implied.','Static source recovery and successful source tests do not establish native gameplay or visual parity.']},indent=2)+'\n')
print('Recovered',sum(len(t['talents']) for c in source['classes'] for t in c['trees']),'talent effect records and five switch tables; prepared leaf REA plan')
