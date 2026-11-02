#!/usr/bin/env python3
"""Replay the native heartbeat dispatch after its shared deadline is due.

Only hash-bound original instructions run in synthetic memory. Transport-state,
message construction and send callbacks are explicit seams; no Rust source,
socket, client, game or server executes.
"""
import hashlib
import itertools
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as R

SHA = '291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08'
START, END = 0x145aeb92f, 0x145aeb9ef
CONSTRUCT, MESSAGE = 0x145e03b40, 0x146fb2290


def replay():
    target = latest_target(verify=True)
    assert target['version'] == '0.120.0' and target['sha256'] == SHA
    proof = json.loads((ROOT / 'docs/analysis/evidence/0.120.0/coop-correspondence/manifest.json').read_text())
    assert all(target[key] == proof['target'][key] for key in ('version', 'sha256', 'size_bytes'))
    image = target_bytes(target)
    pe = load_script('heartbeat_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    owner = next(row for row in proof['ranges'] if row['role'] == 'service-pump')
    owner_start, owner_end = int(owner['start'], 16), int(owner['end_exclusive'], 16)
    offset = pe.rva_offset(owner_start - pe.image_base)
    assert owner_start <= START < END <= owner_end
    assert offset == int(owner['file_offset'], 16)
    assert hashlib.sha256(image[offset:offset + owner_end - owner_start]).hexdigest() == owner['sha256']

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    page = START & ~4095
    machine.mem_map(page, 4096)
    code_offset = pe.rva_offset(START - pe.image_base)
    machine.mem_write(START, image[code_offset:code_offset + END - START])
    machine.mem_map(CONSTRUCT & ~4095, 4096)
    base = 0x200000000
    machine.mem_map(base, 0x30000)
    service, primary, secondary, primary_vt, secondary_vt = (base + n for n in (0x1000, 0x2000, 0x3000, 0x9000, 0xa000))
    primary_state, secondary_state, primary_send, secondary_send = (base + n for n in (0x4000, 0x5000, 0x6000, 0x7000))
    frame, stack = base + 0x20000, base + 0x28000
    states, events = {}, []
    instructions = 0

    def put(address, value):
        machine.mem_write(address, struct.pack('<Q', value))

    def return_from_callback():
        sp = machine.reg_read(R.UC_X86_REG_RSP)
        destination = struct.unpack('<Q', machine.mem_read(sp, 8))[0]
        machine.reg_write(R.UC_X86_REG_RSP, sp + 8)
        machine.reg_write(R.UC_X86_REG_RIP, destination)

    def hook(cpu, pc, size, unused):
        nonlocal instructions
        if pc == END:
            cpu.emu_stop()
            return
        if pc in (primary_state, secondary_state):
            is_primary = pc == primary_state
            label = 'primary' if is_primary else 'secondary'
            assert cpu.reg_read(R.UC_X86_REG_RCX) == (primary if is_primary else secondary)
            events.append(('state', label))
            cpu.reg_write(R.UC_X86_REG_RAX, states[label])
            return_from_callback()
            return
        if pc == CONSTRUCT:
            assert cpu.reg_read(R.UC_X86_REG_RCX) == frame + 0xa0
            assert cpu.reg_read(R.UC_X86_REG_RDX) == MESSAGE
            events.append(('construct', MESSAGE))
            return_from_callback()
            return
        if pc in (primary_send, secondary_send):
            is_primary = pc == primary_send
            label = 'primary' if is_primary else 'secondary'
            assert cpu.reg_read(R.UC_X86_REG_RCX) == (primary if is_primary else secondary)
            assert cpu.reg_read(R.UC_X86_REG_RDX) == frame + 0xa0
            assert events[-1] == ('construct', MESSAGE)
            events.append(('send', label))
            return_from_callback()
            return
        assert START <= pc and pc + size <= END, hex(pc)
        instructions += 1

    machine.hook_add(UC_HOOK_CODE, hook)
    put(service + 0x90, primary)
    put(service + 0x98, primary_vt)
    put(service + 0x70, secondary)
    put(service + 0x78, secondary_vt)
    put(primary_vt + 0x28, primary_state)
    put(secondary_vt + 0x28, secondary_state)
    put(primary_vt + 0x18, primary_send)
    put(secondary_vt + 0x18, secondary_send)
    cases = []
    for p, s in itertools.product((0, 1, 2, 255), (None, 0, 1, 2, 255)):
        states.update(primary=p, secondary=s)
        machine.mem_write(service + 0x88, struct.pack('<i', -1 if s is None else 0))
        machine.reg_write(R.UC_X86_REG_R13, service)
        machine.reg_write(R.UC_X86_REG_RBP, frame)
        machine.reg_write(R.UC_X86_REG_RSP, stack)
        events.clear()
        machine.emu_start(START, 0, count=1000)
        assert machine.reg_read(R.UC_X86_REG_RIP) == END
        expected = [('state', 'primary')]
        if p == 1:
            expected += [('construct', MESSAGE), ('send', 'primary')]
        if s is not None:
            expected += [('state', 'secondary')]
            if s == 1:
                expected += [('construct', MESSAGE), ('send', 'secondary')]
        assert events == expected, (p, s, events)
        cases.append({'primary_state': p, 'secondary_state': s,
                      'sent_to': [label for kind, label in events if kind == 'send']})
    return {
        'target_sha256': SHA,
        'native_cases': len(cases),
        'native_instructions': instructions,
        'range': {'start': hex(START), 'end_exclusive': hex(END)},
        'seams': ['Shared heartbeat deadline is already due.',
                  'Transport-state callbacks return the supplied byte.',
                  'Message construction and send callbacks are observed, not executed.'],
        'result': 'Each present transport sends only in state 1, independently of the other transport.',
        'source_executed': False,
        'target_executed': False,
        'network_executed': False,
        'cases': cases,
    }


if __name__ == '__main__':
    print(json.dumps(replay(), indent=2))
