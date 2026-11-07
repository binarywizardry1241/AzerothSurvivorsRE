#!/usr/bin/env python3
"""Check native collection drops and per-set counters without compiling or running the app.

Selected original instructions execute in Unicorn with synthetic allocation,
slot/rank projection and UI-context memory. UI rendering is not executed.
"""
import sys, json, struct, hashlib, argparse
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes, project_path
from script_sources import load_script
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED, UC_MEM_READ_UNMAPPED
import unicorn.x86_const as reg
def check_current(proof, target, image, pe):
    """Current armor-only summary prefix, with the owned-rank collector seam."""
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from discovery_native_subject import verify_native_query_subject
    for row in proof['native_ranges'] + proof.get('native_data', []):
        address = int(row['virtual_address'], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = image[offset:offset + row['byte_count']]
        assert hashlib.sha256(raw).hexdigest() == row['sha256']
        assert raw == bytes.fromhex(row['bytes_hex'])
        if 'instruction_count' in row:
            instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, address))
            assert len(instructions) == row['instruction_count']
            assert sum(i.size for i in instructions) == len(raw)
    for query in proof['queries']:
        path = project_path(query['result']['path'])
        assert hashlib.sha256(path.read_bytes()).hexdigest() == query['result']['sha256']
        native = json.loads(path.read_text())
        native = native.get('structuredContent') or json.loads(native['content'][0]['text'])
        verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
        assert hashlib.sha256(native['normalized_result'].encode()).hexdigest() == query['normalized_text_sha256']
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    def page(address):
        address &= ~4095
        if address in mapped: return
        offset = pe.rva_offset(address - pe.image_base)
        machine.mem_map(address, 4096)
        machine.mem_write(address, image[offset:offset + 4096])
        mapped.add(address)
    for row in proof['native_ranges']:
        address = int(row['virtual_address'], 16)
        for address in range(address & ~4095, (address + row['byte_count'] + 4095) & ~4095, 4096):
            page(address)
    page(0x140103420)
    machine.mem_map(0x22000000, 0x100000)
    state = dict(steps=0, slots=[])
    def hook(uc, address, _size, _context):
        state['steps'] += 1
        if address == 0x1401279a1:
            uc.emu_stop()
        elif address == 0x140103420:
            iterator = uc.reg_read(reg.UC_X86_REG_RDX)
            begin, end = struct.unpack('<QQ', uc.mem_read(iterator + 0x10, 16))
            assert (begin, end) == (0, 8)
            output = uc.reg_read(reg.UC_X86_REG_RCX)
            pairs = [(slot, value) for slot, value in enumerate(state['slots'][:end]) if value is not None]
            for i, (slot, value) in enumerate(pairs):
                uc.mem_write(0x22006000 + i * 16, struct.pack('<QB7x', slot, value))
            uc.mem_write(output, struct.pack('<QQQ', len(pairs), 0x22006000, len(pairs)))
            sp = uc.reg_read(reg.UC_X86_REG_RSP)
            uc.reg_write(reg.UC_X86_REG_RIP, struct.unpack('<Q', uc.mem_read(sp, 8))[0])
            uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)
    def fault(uc, access, address, _size, _value, _context):
        if access != UC_MEM_READ_UNMAPPED: return False
        try:
            page(address)
            return True
        except ValueError:
            return False
    machine.hook_add(UC_HOOK_CODE, hook)
    machine.hook_add(UC_HOOK_MEM_UNMAPPED, fault)
    historical = json.loads((ROOT / 'docs/analysis/evidence/collection-progress-cases.json').read_text())
    cases = []
    for slots, profile, values in historical['profiles']:
        for tier in (0, 1, 2, 3, 5, 4):
            state['slots'] = values
            machine.mem_write(0x22000000, bytes(0x10000))
            machine.mem_write(0x22004118, struct.pack('<QQ', 0x22005000, 0x22000000))
            machine.mem_write(0x22005030, bytes([1 if slots == 9 else 4]))
            for name, value in (('RCX', 0x22003000), ('RDX', 0x22003000),
                                ('R8', 0x22004000), ('R9', tier), ('RSP', 0x220ff000)):
                machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
            machine.emu_start(0x1401277d0, 0, count=10000)
            rbp = machine.reg_read(reg.UC_X86_REG_RBP)
            denominator, stars = struct.unpack('<II', machine.mem_read(rbp + 0x284, 8))
            assert [stars, denominator] == [sum(value or 0 for value in values[:8]), 40]
            cases.append([slots, profile, tier, [stars, denominator]])
    source = (ROOT / 'crates/azeroth-survivors-re/src/armory.rs').read_text()
    for needle in proof['source_contracts']:
        assert needle in source, needle
    assert cases == proof['cases']
    print(json.dumps(dict(summary_cases=len(cases), original_instruction_steps=state['steps'],
        case_sha256=hashlib.sha256(json.dumps(cases, sort_keys=True).encode()).hexdigest(),
        application_executed=False, compilation='not_run', parity='unverified'), indent=2))

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--proof', type=project_path,
    default=ROOT / 'docs/analysis/evidence/armory-collection.json')
args = parser.parse_args()
proof = json.loads(args.proof.read_text())
target = latest_target(verify=True)
assert all((target[k] == v for k, v in proof['target'].items()))
image = target_bytes(target)
pe = load_script('collection_native_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
if proof['target']['version'] == '0.127.0':
    check_current(proof, target, image, pe)
    raise SystemExit(0)
machine = Uc(UC_ARCH_X86, UC_MODE_64)
mapped = set()
ranges = []
starts = {0x145aff7d0, 0x145c71160, 0x145c77660, 0x1402b1560, 0x1401a3ae0, 0x145ab4910}

def original_page(address):
    page = address & ~4095
    if page in mapped:
        return
    offset = pe.rva_offset(page - pe.image_base)
    machine.mem_map(page, 4096)
    mapped.add(page)
    machine.mem_write(page, image[offset:offset + 4096])
for a, z, _ in pe.functions():
    a += pe.image_base
    z += pe.image_base
    if a not in starts:
        continue
    ranges.append((a, z))
    for page in range(a & ~4095, z + 4095 & ~4095, 4096):
        original_page(page)
SEAMS = {0x140002200, 0x1400021c0, 0x1400021d0, 0x145fec390, 0x145b02ff0, 0x1401a2570}
for a in SEAMS:
    original_page(a)
    machine.mem_write(a, b'\xc3')
BASE = 0x22000000
SAVE = BASE
BEATS = BASE + 4096
OUT = BASE + 12288
CTX = BASE + 16384
HERO = BASE + 20480
PAIRS = BASE + 24576
STACK = BASE + 4128760
STOP = BASE + 4194288
machine.mem_map(BASE, 4194304)
machine.mem_write(STOP, b'\xcc')
state = {'heap': BASE + 65536, 'steps': 0, 'slots': [], 'stop': STOP}
cases = []

def readq(a):
    return struct.unpack('<Q', machine.mem_read(a, 8))[0]

def ret(value=None):
    if value is not None:
        machine.reg_write(reg.UC_X86_REG_RAX, value)
    sp = machine.reg_read(reg.UC_X86_REG_RSP)
    machine.reg_write(reg.UC_X86_REG_RIP, readq(sp))
    machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)

def alloc(n):
    p = state['heap']
    state['heap'] += n + 31 & ~31
    assert state['heap'] < STACK
    return p

def hook(uc, address, size, ctx):
    state['steps'] += 1
    if address == state['stop']:
        uc.emu_stop()
        return
    assert any((a <= address < z for a, z in ranges)) or address in SEAMS, hex(address)
    if address in (0x140002200, 0x1400021d0):
        ret()
    elif address == 0x1400021c0:
        ret(alloc(uc.reg_read(reg.UC_X86_REG_RCX)))
    elif address == 0x145fec390:
        vec = uc.reg_read(reg.UC_X86_REG_RCX)
        n = uc.reg_read(reg.UC_X86_REG_RDX)
        extra = uc.reg_read(reg.UC_X86_REG_R8)
        width = readq(uc.reg_read(reg.UC_X86_REG_RSP) + 40)
        cap, ptr, length = struct.unpack('<QQQ', uc.mem_read(vec, 24))
        assert n == length
        newcap = max(2 * cap, n + extra, 8)
        newptr = alloc(newcap * width)
        if n:
            uc.mem_write(newptr, bytes(uc.mem_read(ptr, n * width)))
        uc.mem_write(vec, struct.pack('<QQQ', newcap, newptr, n))
        ret()
    elif address == 0x145b02ff0:
        ret(len(state['slots']))
    elif address == 0x1401a2570:
        output = uc.reg_read(reg.UC_X86_REG_RCX)
        pairs = [(s, rank) for s, rank in enumerate(state['slots']) if rank is not None]
        for i, (slot, rank) in enumerate(pairs):
            uc.mem_write(PAIRS + i * 16, struct.pack('<QB7x', slot, rank))
        uc.mem_write(output, struct.pack('<QQQ', len(pairs), PAIRS, len(pairs)))
        ret(output)

def fault(uc, access, address, size, value, ctx):
    if access != UC_MEM_READ_UNMAPPED:
        return False
    try:
        original_page(address)
        return True
    except ValueError:
        return False
machine.hook_add(UC_HOOK_CODE, hook)
machine.hook_add(UC_HOOK_MEM_UNMAPPED, fault)

def run(address, args, stop=STOP):
    state['heap'] = BASE + 65536
    state['stop'] = stop
    machine.mem_write(STACK, struct.pack('<Q', STOP))
    for r, v in zip([reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8, reg.UC_X86_REG_R9], args):
        machine.reg_write(r, v)
    machine.reg_write(reg.UC_X86_REG_RSP, STACK)
    try:
        machine.emu_start(address, 0, count=1000000)
    except Exception as e:
        raise AssertionError(hex(machine.reg_read(reg.UC_X86_REG_RIP))) from e
    assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
classes = [1, 2, 3, 4, 5, 7, 8, 9, 11]
base = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/armory.json').read_text())
pvp = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json').read_text())
diffs = []
for c in classes:
    pieces = next((x['items'] for x in base['classes'] if x['id'] == c)) + next((x['items'] for x in pvp['classes'] if x['id'] == c))
    for zone, z in enumerate(pvp['zones']):
        for boss, b in enumerate(z['bosses']):
            run(0x145aff7d0, [OUT, c, zone, boss])
            cap, ptr, n = struct.unpack('<QQQ', machine.mem_read(OUT, 24))
            native = [struct.unpack('<If', machine.mem_read(ptr + i * 8, 8)) for i in range(n)]
            expected = [(p['id'], z['drop_percent'] / 100) for p in pieces if p['rarity'] == z['tier'] and p['slot'] in b['slots']]
            if [x for x, _ in native] != [x for x, _ in expected] or any((abs(v - w) > 1e-06 for (_, v), (_, w) in zip(native, expected))):
                diffs.append([c, zone, boss, native, expected])
            cases.append(['drops', c, zone, boss, [[x, struct.unpack('<I', struct.pack('<f', v))[0]] for x, v in native]])
print('drop cases', len(cases), 'source mismatches', len(diffs))
print(json.dumps(diffs[:4]))
summary_cases = []
for slots in (9, 10):
    patterns = [[None] * slots, [0] * slots, [1] * slots, [3] * slots, [5] * slots, [1] * 4 + [None] * (slots - 4), [3] * 7 + [None] * (slots - 7), [5] * 7 + [4] + [5] * (slots - 8), [None] * 8 + [5] * (slots - 8), list(range(slots))]
    for index, values in enumerate(patterns):
        state['slots'] = values
        machine.mem_write(SAVE, bytes(1024))
        machine.mem_write(CTX + 280, struct.pack('<QQ', HERO, SAVE))
        machine.mem_write(HERO + 48, bytes([1 if slots == 9 else 4]))
        for tier in (0, 1, 2, 3, 5, 4):
            run(0x1402b1560, [OUT, OUT, CTX, tier], 0x1402b1948)
            rbp = machine.reg_read(reg.UC_X86_REG_RBP)
            total, den = struct.unpack('<II', machine.mem_read(rbp + 644, 8))
            flags = list(machine.mem_read(rbp + 676, 3))
            cap = machine.reg_read(reg.UC_X86_REG_RAX) & 255
            expected = [sum((v or 0 for v in values)), slots * 5, int(all((v is not None and v >= 5 for v in values[:8]))), int(sum((v is not None and v >= 3 for v in values[:8])) >= 8), int(sum((v is not None and v >= 1 for v in values[:8])) >= 4), 0]
            actual = [den, total, *flags, cap]
            assert actual == expected, (slots, index, tier, actual, expected)
            summary_cases.append([slots, index, tier, actual])
cap_cases = []
for c in classes:
    for tier, first, second in [(0, 0, 1), (1, 2, 3), (2, 4, 5), (3, 6, 7), (5, 8, 9), (4, 10, 11)]:
        for left in range(6):
            for right in range(6):
                beats = [(zone, c, rank) for zone, rank in [(first, left), (second, right)] if rank]
                machine.mem_write(SAVE, bytes(1024))
                for i, (zone, cls, rank) in enumerate(beats):
                    machine.mem_write(BEATS + i * 16, struct.pack('<QBB6x', zone, cls, rank))
                machine.mem_write(SAVE + 464, struct.pack('<QQ', BEATS, len(beats)))
                run(0x145ab4910, [SAVE, c, tier])
                actual = machine.reg_read(reg.UC_X86_REG_RAX) & 255
                assert actual == max(left, right), (c, tier, left, right, actual)
                cap_cases.append([c, tier, left, right, actual])
cases.extend([['cap', *x] for x in cap_cases])
print('cap cases', len(cap_cases))
cases.extend([['summary', *x] for x in summary_cases])
print('summary cases', len(summary_cases))
assert not diffs
assert len(cases) == proof['replay']['cases']
assert state['steps'] == proof['replay']['original_instruction_steps']
assert hashlib.sha256(json.dumps(cases, sort_keys=True).encode()).hexdigest() == proof['replay']['case_sha256']
for row in proof['native_ranges'] + proof['native_data']:
    address = int(row['virtual_address'], 16)
    offset = pe.rva_offset(address - pe.image_base)
    assert hashlib.sha256(image[offset:offset + row['byte_count']]).hexdigest() == row['sha256']
from discovery_native_subject import verify_native_query_subject
for query in proof['queries']:
    native = json.loads(project_path(query['result']['path']).read_text())['structuredContent']
    verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
    assert hashlib.sha256(native['normalized_result'].encode()).hexdigest() == query['normalized_text_sha256']
for row in proof['source_bindings']:
    raw = project_path(row['path']).read_bytes()
    if 'start' in row:
        text = raw.decode()
        raw = text[text.index(row['start']):text.index(row['end'], text.index(row['start']))].encode()
    assert hashlib.sha256(raw).hexdigest() == row['sha256'], row['path']
source = (ROOT / 'crates/azeroth-survivors-re/src/armory.rs').read_text()
for needle in proof['source_contracts']:
    assert needle in source, needle
fixture = json.loads((ROOT / 'docs/analysis/evidence/collection-progress-cases.json').read_text())
assert fixture['cases'] == summary_cases
print(json.dumps(dict(drop_cases=540, summary_cases=len(summary_cases), original_instruction_steps=state['steps'], application_executed=False), indent=2))
