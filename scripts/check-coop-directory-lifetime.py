#!/usr/bin/env python3
"""Replay bounded native directory idle/request lifetime; no builds or sockets.

Original instructions decide expiry and which app commands update its clock.
Allocation, session close/drop, memcpy and the generic app-command prehandler
are explicit seams. This does not execute Rust, service/TLS, ECS or parity.
"""
import hashlib
import itertools
import json
import math
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as reg

SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
MANIFEST = ROOT / 'docs/analysis/evidence/0.115.0/coop-directory-lifetime/manifest.json'
MASK = (1 << 64) - 1
STATE, STACK, COMMAND = 0x100000, 0x201000, 0x300000
COPY, PREHANDLE = 0x145d145fb, 0x145893a20


def digest(data):
    return hashlib.sha256(data).hexdigest()


def native_check(target, data, pe):
    manifest = json.loads(MANIFEST.read_text())
    assert target['version'] == manifest['target']['version'] == '0.115.0'
    assert target['sha256'] == manifest['target']['sha256'] == SHA
    assert manifest['target_executed'] is False
    assert manifest['native_instructions_emulated'] is True
    functions = {}
    for row in manifest['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row['file_offset'], 16)
        raw = data[offset:offset + end - start]
        assert digest(raw) == row['sha256'], row['role']
        path = (ROOT / row['extract']).resolve()
        assert path.parent == MANIFEST.parent
        assert digest(path.read_bytes()) == row['extract_sha256']
        owner = row['owner']
        a, b = int(owner['start'], 16), int(owner['end_exclusive'], 16)
        owner_offset = pe.rva_offset(a - pe.image_base)
        assert a <= start < end <= b
        assert digest(data[owner_offset:owner_offset + b - a]) == owner['sha256']
        functions[row['role']] = (start, raw)
    literals = {}
    for row in manifest['literals']:
        address = int(row['address'], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = bytes.fromhex(row['hex'])
        assert offset == int(row['file_offset'], 16)
        assert data[offset:offset + len(raw)] == raw
        assert digest(raw) == row['sha256']
        literals[row['role']] = (address, raw)
    assert struct.unpack('<d', literals['idle-seconds'][1])[0] == 60.0
    assert int.from_bytes(literals['leave-value'][1], 'little') == 0x8000000000000007
    for row in manifest['ghidra']:
        assert re.fullmatch(r'ev_[0-9a-f]{64}', row['evidence_id'])
        assert row['input_sha256'] == next(r['sha256'] for r in manifest['ranges']
                                         if r['role'] == row['role'])
        for key in ('profile_digest', 'normalized_result_sha256', 'query_plan_sha256'):
            assert re.fullmatch(r'[0-9a-f]{64}', row[key])
        assert re.fullmatch(r'[0-9a-f]{64}', row['retained_result']['sha256'])
        result = (ROOT / row['retained_result']['path']).resolve()
        assert result.is_relative_to(ROOT / 'runtime')
        if result.exists():
            assert digest(result.read_bytes()) == row['retained_result']['sha256']
            evidence = json.loads(result.read_text())['structuredContent']
            assert evidence['evidence_id'] == row['evidence_id']
            assert evidence['subject']['digest']['sha256'] == row['input_sha256']
            assert evidence['analysis_profile']['digest'] == row['profile_digest']
            assert digest(evidence['normalized_result'].encode()) == row['normalized_result_sha256']
            plan = result.parent.parent / 'plan.json'
            assert digest(plan.read_bytes()) == row['query_plan_sha256']
    assert {row['role'] for row in manifest['ghidra']} == {'idle-gate', 'close-service'}
    return manifest, functions, literals


def machine(functions, literals):
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    pages = set()
    def map_range(start, count):
        for page in range(start & ~0xfff, (start + count + 0xfff) & ~0xfff, 0x1000):
            if page not in pages:
                uc.mem_map(page, 0x1000)
                pages.add(page)
    for start, raw in [*functions.values(), *literals.values()]:
        map_range(start, len(raw))
        uc.mem_write(start, raw)
    for address in [COPY, PREHANDLE]:
        map_range(address, 1)
        uc.mem_write(address, b'\xc3')
    # Targets of externally bounded branches are observed, never decoded.
    for address in [0x145878291, 0x145878ebe, 0x14587975f, 0x145879797,
                    0x14587a1b5, 0x14587a260, 0x14587a312, 0x14587a3b0]:
        map_range(address, 1)
    map_range(STATE, 0x4000)
    map_range(STACK - 0x1000, 0x5000)
    map_range(COMMAND, 0x1000)
    uc.reg_write(reg.UC_X86_REG_RBX, STATE)
    uc.reg_write(reg.UC_X86_REG_RBP, STACK)
    uc.reg_write(reg.UC_X86_REG_RSP, STACK + 0x2000)
    uc.reg_write(reg.UC_X86_REG_MXCSR, 0x1f80)
    return uc


def qword(uc, address, value):
    uc.mem_write(address, struct.pack('<Q', value & MASK))


def clock(uc, value):
    uc.reg_write(reg.UC_X86_REG_XMM6, int.from_bytes(struct.pack('<d', value), 'little'))


def returns(uc):
    sp = uc.reg_read(reg.UC_X86_REG_RSP)
    pc = int.from_bytes(uc.mem_read(sp, 8), 'little')
    uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)
    uc.reg_write(reg.UC_X86_REG_RIP, pc)


def replay_idle(functions, literals):
    values = [-math.inf, -100.0, -0.0, 0.001, math.nextafter(60.0, -math.inf),
              60.0, math.nextafter(60.0, math.inf), 100.0, 160.0, math.inf, math.nan]
    count = 0
    stops = {0x145878291: 'retain', 0x145878ebe: 'close', 0x14587975f: 'absent'}
    for present, role, now, last in itertools.product([False, True], [0, 1, 2, 3, 4, 255], values, values):
        uc = machine(functions, literals)
        qword(uc, STATE + 0x1590, 1 if present else MASK)
        uc.mem_write(STATE + 0xc58, struct.pack('<I', role))
        uc.mem_write(STATE + 0x16c8, struct.pack('<d', last))
        clock(uc, now)
        observed = []
        def hook(uc, address, size, user):
            if address in stops:
                observed.append(stops[address])
                uc.emu_stop()
        uc.hook_add(UC_HOOK_CODE, hook)
        uc.emu_start(functions['idle-gate'][0], 0, count=100)
        expected = 'absent' if not present else 'close' if role == 2 and now - last >= 60.0 else 'retain'
        assert observed == [expected], (present, role, now, last, observed, expected)
        count += 1
    return count


def replay_touch(functions, literals):
    count = 0
    tags = [*range(36), 255, 0xffffffff]
    for present, handled, tag, now in itertools.product([False, True], [False, True], tags,
                                                       [-math.inf, 0.0, 60.0, math.inf, math.nan]):
        uc = machine(functions, literals)
        qword(uc, STATE + 0x1590, 1 if present else MASK)
        qword(uc, STACK + 0xdb0, STATE + 0x1590)
        qword(uc, STACK + 0xe00, STATE)
        last = struct.pack('<d', 41.5)
        uc.mem_write(STATE + 0x16c8, last)
        uc.reg_write(reg.UC_X86_REG_EDI, tag)
        uc.reg_write(reg.UC_X86_REG_RSI, COMMAND)
        clock(uc, now)
        observed = []
        def hook(uc, address, size, user):
            if address in [0x14587a260, 0x14587a312, 0x14587a3b0]:
                observed.append(address)
                uc.emu_stop()
            elif address == PREHANDLE:
                uc.reg_write(reg.UC_X86_REG_RAX, int(handled))
                returns(uc)
            elif address == COPY:
                destination = uc.reg_read(reg.UC_X86_REG_RCX)
                source = uc.reg_read(reg.UC_X86_REG_RDX)
                size = uc.reg_read(reg.UC_X86_REG_R8)
                uc.mem_write(destination, bytes(uc.mem_read(source, size)))
                uc.reg_write(reg.UC_X86_REG_RAX, destination)
                returns(uc)
        uc.hook_add(UC_HOOK_CODE, hook)
        uc.emu_start(functions['command-touch'][0], 0, count=100)
        selected = 20 <= tag <= 24
        expected_stop = 0x14587a260 if handled else 0x14587a312 if selected else 0x14587a3b0
        assert observed == [expected_stop], (present, handled, tag, observed)
        touched = present and not handled and selected
        assert uc.mem_read(STATE + 0x16c8, 8) == (struct.pack('<d', now) if touched else last)
        count += 1
    return count


def replay_close(functions, literals):
    uc = machine(functions, literals)
    original = bytearray((index & 255) for index in range(0x1800))
    original[0x1590:0x1598] = struct.pack('<Q', 9)
    uc.mem_write(STATE, bytes(original))
    uc.reg_write(reg.UC_X86_REG_RSI, 9)
    qword(uc, STACK + 0xe00, STATE)
    calls = []
    def hook(uc, address, size, user):
        if address == 0x145879758:
            uc.emu_stop()
        elif address == COPY:
            destination = uc.reg_read(reg.UC_X86_REG_RCX)
            source = uc.reg_read(reg.UC_X86_REG_RDX)
            size = uc.reg_read(reg.UC_X86_REG_R8)
            assert size == 0x140
            uc.mem_write(destination, bytes(uc.mem_read(source, size)))
            calls.append(('copy', destination))
            returns(uc)
        elif address in [0x14581e820, 0x145871650]:
            calls.append(('close' if address == 0x14581e820 else 'drop', uc.reg_read(reg.UC_X86_REG_RCX)))
            returns(uc)
    uc.hook_add(UC_HOOK_CODE, hook)
    uc.emu_start(functions['idle-close'][0], 0, count=100)
    assert calls == [('copy', STACK + 0x788), ('close', STACK + 0x8a8), ('drop', STACK + 0x780)]
    expected = original[:]
    expected[0x1590:0x1598] = struct.pack('<Q', MASK)
    assert uc.mem_read(STATE, len(expected)) == expected
    # The Off continuation reaches ordinary command processing without status publication.
    uc = machine(functions, literals)
    uc.mem_write(STATE + 0xc58, struct.pack('<Q', 2))
    qword(uc, STACK + 0xe00, STATE)
    stopped = []
    def continuation(uc, address, size, user):
        if address in [0x14587a1b5, 0x145879797]:
            stopped.append(address)
            uc.emu_stop()
    uc.hook_add(UC_HOOK_CODE, continuation)
    uc.emu_start(functions['off-continuation'][0], 0, count=100)
    assert stopped == [0x14587a1b5]
    return 2


def main():
    target = latest_target(verify=True)
    data = target_bytes(target)
    pe = load_script('directory_lifetime_pe', ROOT / 'scripts/inventory-executable.py').PE(data)
    manifest, functions, literals = native_check(target, data, pe)
    idle = replay_idle(functions, literals)
    touch = replay_touch(functions, literals)
    close = replay_close(functions, literals)
    source = (ROOT / 'crates/azeroth-survivors-re/src/coop/directory_lifetime.rs').read_text()
    compact = re.sub(r'\s+', '', source)
    assert 'pubfnidle_due(off:bool,now:f64,last:f64)->bool' in compact
    assert 'off&&now-last>=60.0' in compact
    assert source.count('#[test]') == 2
    print(f'PASS: {idle} original-instruction idle cases, {touch} selected-command clock cases, '
          f'{close} close/continuation cases, {len(functions)} exact range certificates and source guards; '
          'two Rust regressions authored, uncompiled/unrun; no sockets, game or parity execution')


if __name__ == '__main__':
    main()
