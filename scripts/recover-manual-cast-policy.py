#!/usr/bin/env python3
"""Replay current manual-cast gates and the desktop host's native capability.

No EXE process, allocations, host-call replacements or UI are used. Every
executed instruction belongs to a retained span. The factory's indirect call
executes the actual selected desktop vtable slot, including its native return.
Alternate enabled-host payloads are static recovery, not desktop UI parity.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib
import json
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
EXE = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
data = EXE.read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
inventory = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
pe = inventory.PE(data)
sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

OUT = ROOT / 'docs/analysis/evidence/0.100.1/manual-cast-policy'
OUT.mkdir(parents=True, exist_ok=True)
roles = [
    ('desktop-host', 0x14000d230, 0x14000d4fc),
    ('core-host-forwarder', 0x1454241d0, 0x1454242c3),
    ('core-wrapper-forwarder', 0x145452f80, 0x145453009),
    ('callback-ownership', 0x14543f1ab, 0x14543f1c7),
    ('desktop-capability', 0x140030500, 0x140030503),
    ('startup-empty', 0x14543f148, 0x14543f166),
    ('game-initial-discriminant', 0x1454add49, 0x1454add75),
    ('factory-missing-config', 0x14544f73d, 0x14544f7ce),
    ('factory-capability', 0x14544fc62, 0x14544fcb4),
    ('factory-publish', 0x14544ff3f, 0x14544ff51),
    ('reload-clear', 0x14544d6de, 0x14544d713),
    ('disconnect-clear', 0x14543fe5c, 0x14543fea5),
    ('manual-cast-response', 0x14544518a, 0x14544520b),
    ('manual-cast-phase-two', 0x1454453cb, 0x1454453d9),
    ('choice-payload', 0x1454ee470, 0x1454eea26),
    ('result-payload', 0x1454f0640, 0x1454f0c60),
    ('gossip-publisher', 0x1454f9790, 0x1454f9943),
    ('gossip-serializer-header', 0x14545cf50, 0x14545cfbc),
    ('npc-text-serializer-header', 0x14545e340, 0x14545e3b0),
]
owners = []
for role, lo, hi in roles:
    off = pe.rva_offset(lo - pe.image_base)
    owners.append(dict(role=role, start=hex(lo), end_exclusive=hex(hi),
                       sha256=hashlib.sha256(data[off:off + hi - lo]).hexdigest()))
    (OUT / (role + '.asm')).write_text(objdump_output([
        'objdump', '-d', '--no-show-raw-insn', f'--start-address={lo:#x}',
        f'--stop-address={hi:#x}', str(EXE)], text=True, cwd=ROOT))

u = Uc(UC_ARCH_X86, UC_MODE_64)
end = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
u.mem_map(pe.image_base, (end + 4095) & ~4095)
for section in pe.sections:
    u.mem_write(pe.image_base + section['rva'],
                data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
MEM, STACK, STOP = 0x200000000, 0x300000000, 0x20000f000
u.mem_map(MEM, 0x10000)
u.mem_map(STACK, 0x10000)
spans = [(0x140030500, 0x140030503), (0x14544fc79, 0x14544fc98),
         (0x1454451e2, 0x14544520b), (0x1454453cb, 0x1454453d9),
         (0x1454ee470, 0x1454ee4b1), (0x1454eea16, 0x1454eea26),
         (0x1454f0640, 0x1454f0681), (0x1454f0c2c, 0x1454f0c4e),
         (0x14543f15e, 0x14543f166), (0x1454add5c, 0x1454add64),
         (0x14544d6e6, 0x14544d6f2), (0x14543fe9d, 0x14543fea5)]
stops = {STOP, 0x14544fc98, 0x145447a82, 0x1454ee470, 0x1454f0640,
         0x1454ee4b1, 0x1454f0681, 0x14543f166, 0x1454add64,
         0x14544d6f2, 0x14543fea5}
entry_stops = set()


def instruction(_, address, size, context):
    if address in entry_stops:
        u.emu_stop()
    elif not any(lo <= address < hi for lo, hi in spans):
        raise RuntimeError('Unreviewed native instruction ' + hex(address))


u.hook_add(UC_HOOK_CODE, instruction)


def reset():
    u.mem_write(MEM, bytes(0x10000))
    u.mem_write(STACK, bytes(0x10000))
    u.reg_write(UC_X86_REG_RSP, STACK + 0x8000)
    u.reg_write(UC_X86_REG_RBP, STACK + 0x7000)
    u.mem_write(STACK + 0x8000, struct.pack('<Q', STOP))


def run(start, allowed_stops):
    global entry_stops
    entry_stops = set(allowed_stops)
    u.emu_start(start, 0, count=10000)
    pc = u.reg_read(UC_X86_REG_RIP)
    assert pc in entry_stops, hex(pc)
    return pc


vt = 0x145907f38
vtoff = pe.rva_offset(vt - pe.image_base)
slot = struct.unpack_from('<Q', data, vtoff + 0x40)[0]
assert slot == 0x140030500
reset()
game = MEM + 0x1000
u.mem_write(game + 0xf70, struct.pack('<QQ', MEM + 0x3000, vt))
u.reg_write(UC_X86_REG_R13, game)
run(0x14544fc79, [0x14544fc98])
capability = u.mem_read(STACK + 0x7000 + 0x968, 1)[0]
assert capability == 0

phase_actions = []
for state in [0, 1, 2, 3, 0xffffffff]:
    for phase in [0, 1, 2, 3, 4, 5, 6, 7, 255]:
        reset()
        u.mem_write(game + 0x10, struct.pack('<I', state))
        u.mem_write(game + 0x9c9, bytes([phase]))
        u.reg_write(UC_X86_REG_RSI, game)
        pc = run(0x1454451e2, [0x145447a82, 0x1454ee470, 0x1454f0640])
        phase_actions.append(dict(wrapper_discriminant=state, phase=phase, next_owner=hex(pc)))

guards = []
for flag in [0, 1, 2, 255]:
    for kind in [0, 1, 2, 255]:
        for role, start, after_guard in [('choices', 0x1454ee470, 0x1454ee4b1),
                                          ('results', 0x1454f0640, 0x1454f0681)]:
            reset()
            u.mem_write(game + 0x9a8, bytes([flag]))
            u.mem_write(game + 0x9b7, bytes([kind]))
            u.reg_write(UC_X86_REG_RCX, game)
            pc = run(start, [STOP, after_guard])
            guards.append(dict(role=role, capability_byte=flag, choice_kind=kind,
                               produces_payload=pc == after_guard))

lifecycle = []
for role, start, stop, before, dest in [
        ('startup', 0x14543f15e, 0x14543f166, 0, game + 0x10),
        ('construct_game', 0x1454add5c, 0x1454add64, 2, STACK + 0x7028),
        ('reload', 0x14544d6e6, 0x14544d6f2, 0, game + 0x10),
        ('disconnect', 0x14543fe9d, 0x14543fea5, 1, game + 0x10)]:
    reset()
    u.reg_write(UC_X86_REG_RSI, game)
    u.mem_write(dest, struct.pack('<Q', before))
    run(start, [stop])
    after = struct.unpack('<Q', u.mem_read(dest, 8))[0]
    lifecycle.append(dict(role=role, before=before, after=after))

evidence = []
for role in ['choices', 'results']:
    source = ROOT / f'runtime/manual-cast-0.100.1/rea-{role}/003-procedure_pseudo_code.json'
    if source.exists():
        result = json.loads(json.loads(source.read_text())['response']['result']['content'][0]['text'])
        (OUT / (role + '.ghidra.c')).write_text('\n'.join(line.rstrip() for line in result['normalized_result'].splitlines()).rstrip() + '\n')
        evidence.append(dict(role=role, evidence_id=result['evidence_id'],
                             provider=result['provider'], subject=result['subject']['digest']))

(OUT / 'native.json').write_text(portable_json(dict(
    target_sha256=SHA, method=__doc__, owners=owners, ghidra=evidence,
    desktop_vtable=dict(address=hex(vt), slot='0x40', target=hex(slot), result=capability,
                       bytes=data[vtoff:vtoff + 0x48].hex(),
                       sha256=hashlib.sha256(data[vtoff:vtoff + 0x48]).hexdigest()),
    phase_actions=phase_actions, guards=guards, lifecycle=lifecycle,
    limitations=['Enabled-host payload bodies are static/Ghidra recovery only.',
                 'No original/rebuilt GUI runtime comparison ran.']), indent=2) + '\n')
print(f'Recovered desktop false capability, {len(phase_actions)} phase dispatches, '
      f'{len(guards)} payload guards and {len(lifecycle)} lifecycle stores.')
