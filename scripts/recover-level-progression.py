#!/usr/bin/env python3
"""Hash-bound XP loop, exact level messages and inline per-level healing.

Execute unchanged arithmetic/branch fragments only. Calls are stop boundaries;
the localization boundary preserves the requested amount in nonvolatile XMM14.
No original runtime, external calls, replacement code or system files are used.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import bits as _shared_bits
from script_sources import load_script
from pathlib import Path
import hashlib, json, struct, subprocess, sys
ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
data = TARGET.read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
pe = module.PE(data)
u = Uc(UC_ARCH_X86, UC_MODE_64)
end = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
u.mem_map(pe.image_base, (end + 4095) & ~4095)
for section in pe.sections:
    u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
MEM, STACK = 0x200000000, 0x300000000
u.mem_map(MEM, 0x10000); u.mem_map(STACK, 0x10000)
SPANS = [(0x1454c6fd6, 0x1454c6fe4), (0x1454c6ff5, 0x1454c703a),
         (0x1454c6e8d, 0x1454c6ec7), (0x1454c6c54, 0x1454c6c6e),
         (0x1454c6cac, 0x1454c6cc1), (0x1454c6cf2, 0x1454c6d06)]
STOPS = [b for _, b in SPANS] + [0x1454c709e, 0x1454c6fd0]
def hook(_, address, size, unused):
    if address in STOPS: u.emu_stop()
    elif not any(a <= address < b for a, b in SPANS):
        raise RuntimeError('Unreviewed instruction ' + hex(address))
u.hook_add(UC_HOOK_CODE, hook)
def bits(value):
    return _shared_bits(value)
def reset():
    u.mem_write(MEM, bytes(0x10000)); u.mem_write(STACK, bytes(0x10000))
    for reg, value in [(UC_X86_REG_RSI, MEM), (UC_X86_REG_RBP, STACK + 0x8000),
                       (UC_X86_REG_RSP, STACK + 0x7000), (UC_X86_REG_MXCSR, 0x1f80)]:
        u.reg_write(reg, value)
cases = []
for maximum in [0., 1., 100., 129., 138., float('nan')]:
    for health in [-10., 0., .25, 25., 95., 100., 140., float('nan')]:
        reset()
        u.mem_write(MEM + 0x418, struct.pack('<f', health))
        u.mem_write(MEM + 0x470, struct.pack('<f', maximum))
        u.reg_write(UC_X86_REG_XMM13, bits(.2)); u.reg_write(UC_X86_REG_XMM10, 0)
        u.emu_start(SPANS[0][0], 0, count=1000)
        requested = u.reg_read(UC_X86_REG_XMM14) & 0xffffffff
        u.emu_start(SPANS[1][0], 0, count=1000)
        cases.append(dict(health_bits=bits(health), maximum_bits=bits(maximum),
            requested_bits=requested, expected=dict(health_bits=struct.unpack('<I', u.mem_read(MEM + 0x418, 4))[0],
            actual_bits=u.reg_read(UC_X86_REG_XMM1) & 0xffffffff,
            record_meter=u.reg_read(UC_X86_REG_RIP) == 0x1454c703a)))
gates = []
for kinds in [[], [0], [6], [3, 6], [6, 6]]:
    for before, after in [(0, 0), (0, 1), (1, 2), (2, 1), (3, 3), (3, 4)]:
        reset()
        u.mem_write(MEM + 0x2b0, struct.pack('<QQ', MEM + 0x2000, len(kinds)))
        u.mem_write(MEM + 0x4b4, struct.pack('<I', after))
        u.mem_write(STACK + 0x8000 - 4, struct.pack('<I', before))
        for i, kind in enumerate(kinds):
            definition = MEM + 0x4000 + i * 0x100
            u.mem_write(MEM + 0x2000 + i * 88, struct.pack('<Q', definition))
            u.mem_write(definition + 0x75, bytes([kind]))
        u.emu_start(SPANS[2][0], 0, count=1000)
        gates.append(dict(kinds=kinds, before=before, after=after,
                          show=u.reg_read(UC_X86_REG_RIP) == 0x1454c6ec7))
OUT = ROOT / 'docs/analysis/evidence/0.100.1/run-effects'
OUT.mkdir(parents=True, exist_ok=True)
owners = []
for role, lo, hi in [('level-experience', 0x1454c69e0, 0x1454c74c6), ('level-system-message', 0x14545dc90, 0x14545ded4)]:
    offset = pe.rva_offset(lo - pe.image_base); raw = data[offset:offset + hi - lo]
    owner = dict(role=role, address=hex(lo), end_exclusive=hex(hi), file_offset=hex(offset), sha256=hashlib.sha256(raw).hexdigest())
    response = ROOT / f'runtime/level-packet-0.100.1/rea-{"xp" if role == "level-experience" else "message"}/003-procedure_pseudo_code.json'
    if response.exists():
        ev = json.loads(response.read_text())['response']['result']['structuredContent']
        assert ev['subject']['digest']['sha256'] == owner['sha256'] and ev['provider']['id'] == 'ghidra'
        owner['rea_evidence_id'] = ev['evidence_id']; owner['analysis_profile'] = ev['analysis_profile']
        (OUT / (role + '.ghidra.c')).write_text(ev['normalized_result'])
    (OUT / (role + '.asm')).write_text(objdump_output(['objdump', '-d', '--no-show-raw-insn', f'--start-address={lo:#x}', f'--stop-address={hi:#x}', str(TARGET)], text=True))
    owners.append(owner)
strings = []
for role, address, length in [('stats', 0x1469f6beb, 88), ('periodic', 0x1469f6c7e, 62),
        ('healing-name', 0x1469f6ce0, 8), ('healing-icon', 0x1469f6ce8, 19)]:
    offset = pe.rva_offset(address - pe.image_base)
    strings.append(dict(role=role, address=hex(address), length=length, value=data[offset:offset + length].decode()))
descriptors = []
for role, address, length in [('damage-health-integral', 0x1469f6c43, 6), ('regeneration-two-decimals', 0x1469f6c76, 7)]:
    offset = pe.rva_offset(address - pe.image_base)
    descriptors.append(dict(role=role, address=hex(address), raw_hex=data[offset:offset + length].hex()))
(OUT / 'level-progression-native.json').write_text(portable_json(dict(target_sha256=SHA, method=__doc__,
    owners=owners, spans=[dict(start=hex(a), end_exclusive=hex(b)) for a,b in SPANS],
    strings=strings, format_descriptors=descriptors, cases=cases, periodic_message_gates=gates,
    findings=['Each earned-level loop publishes level field34, refreshes stats, sends localized system chat, then heals .20*newMaxHP.',
              'The inline heal has no spell-heal log, overheal conversion or healing pool.',
              'After the loop, field716 is remainingXP and717 is next threshold.',
              'System chat opcode0x96,type0x0a,language0,senderGUID0,textlength+1,NULtext,chatTag0; no SMSG_LEVELUP_INFO.']), indent=2) + '\n')
print('Recovered', len(cases), 'unchanged native level-heal vectors,', len(gates), 'periodic-message gates and two Ghidra owners')
