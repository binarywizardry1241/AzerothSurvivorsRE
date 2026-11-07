#!/usr/bin/env python3
"""Curate exact current frame-stage and synchronous player-aura call sites.

The complete owning native functions were recovered separately with Ghidra.
These unmodified PE instruction windows retain the actual branch/call sites;
they do not assert untraced mode flags or complete frame parity.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib, json, re, subprocess
ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
data = TARGET.read_bytes(); assert hashlib.sha256(data).hexdigest() == SHA
module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
pe = module.PE(data)
bounds = [(pe.image_base + a, pe.image_base + b) for a,b,*_ in pe.functions()]
OUT = ROOT / 'docs/analysis/evidence/run-effects'
OUT.mkdir(parents=True, exist_ok=True)
cache, records = {}, []
for role, address in [
    ('frame-flagged-mode', 0x1454af06c),
    ('frame-player-cast', 0x1454b0601),
    ('frame-pending-hostile', 0x1454b57b9),
    ('frame-area-hostile', 0x1454b5c8f),
    ('frame-actor-update', 0x1454b70d2),
    ('frame-xp-arrival', 0x1454b775c),
    ('frame-normal-spawn', 0x1454b9444),
    ('frame-primary-boss-spawn', 0x1454bb0d1),
    ('aura-absorb-consumed', 0x1454a0b1c),
    ('aura-talent-rescue', 0x1454a1696),
    ('aura-self-buff-one', 0x1454fcc0b),
    ('aura-self-buff-two', 0x1454fcd58),
    ('aura-self-buff-three', 0x1454fd3ed),
    ('aura-shared-status', 0x1454fff36),
]:
    owner = next((a,b) for a,b in bounds if a <= address < b)
    if owner not in cache:
        text = objdump_output(['objdump','-d','--no-show-raw-insn',
            f'--start-address={owner[0]:#x}',f'--stop-address={owner[1]:#x}',str(TARGET)],text=True)
        cache[owner] = [(int(m[1],16),line) for line in text.splitlines() if (m := re.match(r'^([0-9a-f]+):',line))]
    lines = cache[owner]; index = next(i for i,(at,_) in enumerate(lines) if at == address)
    window = lines[max(0,index-12):index+5]
    lo, hi = window[0][0], lines[min(index+5,len(lines)-1)][0]
    offset = pe.rva_offset(lo - pe.image_base); raw = data[offset:offset+hi-lo]
    (OUT / (role + '.asm')).write_text('\n'.join(line for _,line in window)+'\n')
    records.append(dict(role=role, address=hex(lo),end_exclusive=hex(hi),anchor=hex(address),
        owner=hex(owner[0]),file_offset=hex(offset),sha256=hashlib.sha256(raw).hexdigest()))
(OUT / 'frame-publication.json').write_text(portable_json(dict(target_sha256=SHA, target_executed=False,
    method=__doc__, windows=records, findings=[
    'Normal schedule creation follows player casts, pending hostile/area impacts, actor-update and XP arrivals.',
    'Game9b2 flagged early mode refills health, clears pending levels and uses Game994. Its semantic mode is unverified; no queue interpretation is assumed.',
    'Absorb cleanup and talent rescue call the player-aura projector synchronously inside incoming damage.',
    'Current self-buff and shared-status owners call the projector before returning to their scheduler.',
    'A full event-time descriptor must survive when a shield is applied and consumed in one frame.',
    'This selected stage correction does not establish all timed-cast, companion, milestone or entire-frame parity.'
    ]),indent=2)+'\n')
print('Curated',len(records),'selected-target frame/publication instruction windows')
