#!/usr/bin/env python3
"""Retain the current picker footer identity; other catalog provenance stays historical."""
from portable_paths import portable_json
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess
ROOT=Path(__file__).resolve().parents[1]
EXE=ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
d=EXE.read_bytes();assert hashlib.sha256(d).hexdigest()==SHA
m = load_script('inventory', ROOT/'scripts/inventory-executable.py');pe=m.PE(d)
OUT=ROOT/'docs/analysis/evidence/0.100.1/menu-identity';OUT.mkdir(parents=True,exist_ok=True)
def span(role,address,length):
 off=pe.rva_offset(address-pe.image_base);raw=d[off:off+length]
 return dict(role=role,address=hex(address),file_offset=hex(off),byte_count=length,sha256=hashlib.sha256(raw).hexdigest(),bytes_hex=raw.hex())
build=span('build-revision',0x14593d528,8);version=span('version',0x14593d530,7)
descriptor=span('version-descriptor',0x14593d538,16)
assert struct.unpack('<QQ',bytes.fromhex(descriptor['bytes_hex']))==(0x14593d530,7)
fmt=span('compact-format',0x14593d548,10)
assert bytes.fromhex(fmt['bytes_hex'])==b'\x01v\xc0\x02 (\xc0\x01)\x00'
identity=dict(version=bytes.fromhex(version['bytes_hex']).decode(),build_revision=bytes.fromhex(build['bytes_hex']).decode())
(ROOT/'crates/azeroth-survivors-re/assets/menu-identity-0.100.1.json').write_text(portable_json(identity,indent=2)+'\n')
owners=[span('picker-root',0x1400c1b30,5827),span('footer-format-arguments',0x1400c2f48,0x1400c2fac-0x1400c2f48)]
for row in owners:
 a=int(row['address'],16);end=a+row['byte_count']
 (OUT/(row['role']+'.asm')).write_text(subprocess.check_output(['objdump','-d','--no-show-raw-insn',f'--start-address={a:#x}',f'--stop-address={end:#x}',str(EXE)],cwd=ROOT,text=True).replace(str(ROOT)+'/', ''))
# Full current owner, recovered through the project REA/Ghidra batch profile.
source=ROOT/'runtime/consolidation-2026-10-19/footer-rea/003-procedure_pseudo_code.json'
result=json.loads(source.read_text())['response']['result']
evidence=result.get('structuredContent') or json.loads(result['content'][0]['text'])
assert evidence['provider']['id']=='ghidra'
assert evidence['subject']['digest']['sha256']==owners[0]['sha256']
(OUT/'picker-root.ghidra.c').write_text('\n'.join(line.rstrip()for line in evidence['normalized_result'].splitlines()).rstrip()+'\n')
(OUT/'native.json').write_text(portable_json(dict(target_sha256=SHA,identity=identity,format='v{version} ({build_revision})',spans=[build,version,descriptor,fmt]+owners,ghidra=dict(evidence_id=evidence['evidence_id'],provider=evidence['provider'],subject_sha256=evidence['subject']['digest']['sha256']),limits=['Selected-PE static data and original formatter argument construction; no original/rebuilt GUI comparison.','Only the current display identity overrides the historical menu.json; other definitions retain their owning provenance.']),indent=2)+'\n')
print('Recovered picker footer: v'+identity['version']+' ('+identity['build_revision']+')')
