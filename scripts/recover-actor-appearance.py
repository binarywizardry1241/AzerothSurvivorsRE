#!/usr/bin/env python3
"""Hash-bound current actor constructor, appearance storage and restoration.

REA/Ghidra resolves the shared current packet constructor. The exact selected
PE callers prove which ordinary metadata pointer and unmodified scale survive
Polymorph. No original game or external tool workspace is started here.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess
ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
data = TARGET.read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
pe = module.PE(data)
OUT = ROOT / 'runtime/native-evidence/0.100.1/run-effects'
OUT.mkdir(parents=True, exist_ok=True)
owners = []
for role, lo, hi in [
    ('actor-create', 0x1454d2910, 0x1454d3682),
    ('ordinary-create', 0x1454d4130, 0x1454d4a7d),
    ('primary-boss-create', 0x1454d11f0, 0x1454d1fdc),
    ('guardian-appearance-create', 0x1454bb6d0, 0x1454bba35),
    ('actor-appearance-restore', 0x1454d70af, 0x1454d70ed),
    ('actor-vital-publication', 0x1454d5aed, 0x1454d5caf),
]:
    offset = pe.rva_offset(lo - pe.image_base)
    raw = data[offset:offset + hi - lo]
    owner = dict(role=role, address=hex(lo), end_exclusive=hex(hi),
                 file_offset=hex(offset), sha256=hashlib.sha256(raw).hexdigest())
    (OUT / (role + '.asm')).write_text(objdump_output([
        'objdump', '-d', '--no-show-raw-insn', f'--start-address={lo:#x}',
        f'--stop-address={hi:#x}', str(TARGET)], text=True))
    if role == 'actor-create':
        path = ROOT / 'runtime/actor-appearance-0.100.1/batch.json/003-procedure_pseudo_code.json'
        if path.exists():
            evidence = json.loads(path.read_text())['response']['result']['structuredContent']
            assert evidence['subject']['digest']['sha256'] == owner['sha256']
            assert evidence['provider']['id'] == 'ghidra'
            owner['rea_evidence_id'] = evidence['evidence_id']
            owner['analysis_profile'] = evidence['analysis_profile']
            (OUT / (role + '.ghidra.c')).write_text(evidence['normalized_result'])
    owners.append(owner)
scale_address = 0x1469f5db0
scale = struct.unpack_from('<f', data, pe.rva_offset(scale_address-pe.image_base))[0]
assert struct.pack('<f', scale) == struct.pack('<f', 1.35)
manifest = dict(target_sha256=SHA, owners=owners, guardian_scale=dict(address=hex(scale_address), value=scale),
    findings=[
        'Ordinary creator stores definition pointer in Actor+90 and definition.scale(+28) in Actor+108.',
        'Guardian creator stores the same metadata pointer and definition.scale*1.35 in Actor+108.',
        'Primary boss creator stores null in Actor+90 and separate boss metadata; ordinary restoration fails its pointer gate.',
        'Restoration owner reads Actor+108 scale and Actor+90->+24 model then calls1454e75f0.',
        'Shared current packet constructor ceilf14577327d computes health once for fields22/28.',
        'Current actor-hit separately calls ceilf for health field22 and maximum-health field28.',
        'Native model/scale values are retained in run state, independently of presentation event consumption.',
    ])
(OUT / 'actor-appearance.json').write_text(portable_json(manifest, indent=2) + '\n')
print('Recovered', len(owners), 'selected-target actor appearance/vital owners; guardian scale', scale)
