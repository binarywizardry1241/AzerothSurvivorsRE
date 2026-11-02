#!/usr/bin/env python3
"""Replay current account progress with synthetic Save/Definition/allocation seams.

No application or Rust compilation executes. Ghidra receipts and the current
installed image bind this check; the accompanying fixture is consumed by Rust.
"""
import sys, struct, json, hashlib
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes, project_path
from script_sources import load_script
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as r
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from capstone.x86_const import X86_OP_MEM, X86_REG_RIP
proof = json.loads((ROOT / 'docs/analysis/evidence/0.121.0/achievement-progress.json').read_text())
t = latest_target(verify=True)
assert all((t[k] == v for k, v in proof['target'].items()))
image = target_bytes(t)
pe = load_script('predicates_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
uc = Uc(UC_ARCH_X86, UC_MODE_64)
mapped = set()
d = Cs(CS_ARCH_X86, CS_MODE_64)
d.detail = True
starts = {0x145ba3940, 0x145ba4260, 0x145c7abb0, 0x145c8cbf0, 0x145c92230, 0x145c97d30, 0x145c97de0}
ranges = []

def map_page(a, original=False):
    page = a & ~4095
    if page not in mapped:
        uc.mem_map(page, 4096)
        mapped.add(page)
        if original:
            try:
                o = pe.rva_offset(page - pe.image_base)
                raw = image[o:o + 4096]
                uc.mem_write(page, raw)
            except ValueError:
                pass
for a, z, _ in pe.functions():
    a += pe.image_base
    z += pe.image_base
    if a not in starts:
        continue
    o = pe.rva_offset(a - pe.image_base)
    raw = image[o:o + z - a]
    for page in range(a & ~4095, z + 4095 & ~4095, 4096):
        map_page(page)
    uc.mem_write(a, raw)
    ranges.append({'start': hex(a), 'end': hex(z), 'sha256': hashlib.sha256(raw).hexdigest()})
    for ins in d.disasm(raw, a):
        for op in ins.operands:
            if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                map_page(ins.address + ins.size + op.mem.disp, True)
for a in (0x146fc0000, 0x147687000, 0x14768f000):
    map_page(a, True)
for a in (0x140002200, 0x1400021c0, 0x1400021d0, 0x145fec390):
    map_page(a)
    uc.mem_write(a, b'\xc3')
uc.mem_map(0x22000000, 4194304)
SAVE, OWNED, STARS, HBEAT, OUT, DEF, ZONE, STACK, STOP = (0x22000000, 0x22001000, 0x22004000, 0x22008000, 0x2200c000, 0x2200d000, 0x2200e000, 0x223f0000, 0x223ffff0)
uc.mem_write(STOP, b'\xcc')
uc.mem_write(ZONE, b'naxx')
state = {'steps': 0, 'heap': 0x22100000}
results = []

def q(a):
    return struct.unpack('<Q', uc.mem_read(a, 8))[0]

def ret(value=0):
    uc.reg_write(r.UC_X86_REG_RAX, value)
    sp = uc.reg_read(r.UC_X86_REG_RSP)
    uc.reg_write(r.UC_X86_REG_RIP, q(sp))
    uc.reg_write(r.UC_X86_REG_RSP, sp + 8)

def allocate(n):
    a = state['heap']
    state['heap'] += n + 31 & ~31
    assert state['heap'] < STACK
    return a

def hook(_uc, a, _size, _ctx):
    state['steps'] += 1
    if a == STOP:
        uc.emu_stop()
    elif a in (0x140002200, 0x1400021d0):
        ret()
    elif a == 0x1400021c0:
        ret(allocate(uc.reg_read(r.UC_X86_REG_RCX)))
    elif a == 0x145fec390:
        vec = uc.reg_read(r.UC_X86_REG_RCX)
        length = uc.reg_read(r.UC_X86_REG_RDX)
        extra = uc.reg_read(r.UC_X86_REG_R8)
        width = q(uc.reg_read(r.UC_X86_REG_RSP) + 40)
        cap, ptr, n = struct.unpack('<QQQ', uc.mem_read(vec, 24))
        assert n == length and width in (1, 4, 8)
        newcap = max(cap * 2, length + extra, 8)
        newptr = allocate(newcap * width)
        if n:
            uc.mem_write(newptr, bytes(uc.mem_read(ptr, n * width)))
        uc.mem_write(vec, struct.pack('<QQQ', newcap, newptr, n))
        ret()
uc.hook_add(UC_HOOK_CODE, hook)
CLASSES = [1, 2, 3, 4, 5, 7, 8, 9, 11]
TIERS = [0, 1, 2, 3, 5, 4]

def ids(c, t):
    return [100000 + c * 1000 + s * 100 + t * 10 for s in range(8)]

def make(name, sets=(), extra_owned=(), extra_stars=(), hbeat=()):
    owned = set(extra_owned)
    stars = dict(extra_stars)
    for c, t, n, rank in sets:
        for i in ids(c, t)[:n]:
            owned.add(i)
            stars[i] = rank
    return {'name': name, 'owned': sorted(owned), 'stars': sorted(stars.items()), 'hbeat': list(hbeat)}
states = [make('empty'), make('orphan-star', extra_stars=[(101000, 5)]), make('owned-zero', extra_owned=ids(1, 0)), make('three-pieces', sets=[(1, 0, 3, 1)]), make('four-pieces', sets=[(1, 0, 4, 1)]), make('owned-unworn-full1', sets=[(1, 0, 8, 1)]), make('owned-unworn-full3', sets=[(1, 0, 8, 3)]), make('owned-unworn-full5', sets=[(1, 0, 8, 5)]), make('one-below-set8', sets=[(1, 0, 7, 3)]), make('all-shared', sets=[(c, 2, 8, 1) for c in CLASSES]), make('different-tiers', sets=[(c, i % 6, 8, 1) for i, c in enumerate(CLASSES)]), make('wardrobe-one', sets=[(3, t, 8, 3) for t in TIERS]), make('wardrobe-split', sets=[(CLASSES[i], t, 8, 3) for i, t in enumerate(TIERS)]), make('legendary-all', sets=[(c, 4, 8, 3) for c in CLASSES]), make('legendary-one-below', sets=[(c, 4, 8, 2 if c == 11 else 3) for c in CLASSES]), make('radiant-mixed-tiers', sets=[(c, i % 6, 8, 5) for i, c in enumerate(CLASSES)]), make('radiant-one-below', sets=[(c, i % 6, 8, 4 if c == 11 else 5) for i, c in enumerate(CLASSES)]), make('all-ranks-all-tiers', sets=[(c, t, 8, 5) for c in CLASSES for t in TIERS]), make('heroic-sparse', hbeat=[(0, 1, 1), (7, 3, 3), (11, 11, 5)]), make('heroic-all3', hbeat=[(z, CLASSES[z % 9], 3) for z in range(12)]), make('heroic-duplicates', hbeat=[(0, 1, 3), (0, 2, 5), (0, 3, 5), (12, 1, 5)]), make('naxx4', hbeat=[(11, 1, 4)]), make('naxx5', hbeat=[(11, 1, 5)])]

def model(s, kind, minimum):
    own = set(s['owned'])
    stars = dict(s['stars'])
    beats = s['hbeat']
    if kind == 23:
        return (s['marks'] // 10, minimum // 10)

    def count(c, t, m):
        return sum((i in own and stars.get(i, 0) >= m for i in ids(c, t)))
    if kind == 27:
        return (int(any((v >= minimum for _, v in s['stars']))), 1)
    if kind == 28:
        return (int(any((count(c, t, 1) >= 4 for c in CLASSES for t in TIERS))), 1)
    if kind == 29:
        return (max((sum((count(c, t, 1) == 8 for c in CLASSES)) for t in TIERS)), 9)
    if kind == 30:
        return (int(any((h >= minimum for z, c, h in beats))), 1)
    if kind == 31:
        return (sum((any((zz == z and h >= minimum for zz, c, h in beats)) for z in range(12))), 12)
    if kind == 32:
        return (int(any((z == 11 and h >= minimum for z, c, h in beats))), 1)
    if kind == 33:
        return (int(any((count(c, t, minimum) >= 8 for c in CLASSES for t in TIERS))), 1)
    if kind == 34:
        return (max((sum((count(c, t, 3) == 8 for t in TIERS)) for c in CLASSES)), 6)
    if kind == 35:
        return (sum((count(c, 4, 3) == 8 for c in CLASSES)), 9)
    if kind == 36:
        return (sum((any((count(c, t, 5) == 8 for t in TIERS)) for c in CLASSES)), 9)

def run(s, kind, minimum):
    uc.mem_write(SAVE, bytes(1024))
    uc.mem_write(OUT, bytes(24))
    uc.mem_write(DEF, bytes(152))
    state['heap'] = 0x22100000
    if s['owned']:
        uc.mem_write(OWNED, struct.pack('<' + 'I' * len(s['owned']), *s['owned']))
    uc.mem_write(SAVE + 56, struct.pack('<QQ', OWNED, len(s['owned'])))
    for i, (ident, rank) in enumerate(s['stars']):
        uc.mem_write(STARS + i * 8, struct.pack('<IB3x', ident, rank))
    uc.mem_write(SAVE + 416, struct.pack('<QQ', STARS, len(s['stars'])))
    for i, (zone, c, rank) in enumerate(s['hbeat']):
        uc.mem_write(HBEAT + i * 16, struct.pack('<QBB6x', zone, c, rank))
    uc.mem_write(SAVE + 464, struct.pack('<QQ', HBEAT, len(s['hbeat'])))
    uc.mem_write(DEF + 72, bytes([kind, minimum if kind != 23 else 0]))
    if kind == 23:
        uc.mem_write(SAVE + 648, struct.pack('<Q', s['marks']))
        uc.mem_write(DEF + 80, struct.pack('<Q', minimum))
        uc.mem_write(DEF + 88, bytes([7]))
    uc.mem_write(DEF + 80, struct.pack('<QQ', ZONE, 4)) if kind != 23 else None
    uc.mem_write(DEF + 96, bytes([minimum if kind != 23 else 0]))
    uc.mem_write(STACK, struct.pack('<Q', STOP))
    for reg, value in [(r.UC_X86_REG_RSP, STACK), (r.UC_X86_REG_RCX, OUT), (r.UC_X86_REG_RDX, SAVE), (r.UC_X86_REG_R8, DEF)]:
        uc.reg_write(reg, value)
    try:
        uc.emu_start(0x145ba4260, 0, count=1000000)
    except Exception as e:
        raise AssertionError((s['name'], kind, minimum, hex(uc.reg_read(r.UC_X86_REG_RIP)))) from e
    assert uc.reg_read(r.UC_X86_REG_RIP) == STOP
    some, a, b = struct.unpack('<QQQ', uc.mem_read(OUT, 24))
    assert some == 1
    expected = model(s, kind, minimum)
    assert (a, b) == expected, (s['name'], kind, minimum, (a, b), expected)
    results.append({'state': s['name'], 'kind': kind, 'minimum': minimum, 'progress': [a, b]})
for s in states:
    for kind in range(27, 37):
        for minimum in [1, 3, 4, 5] if kind == 27 else [1, 3, 5] if kind in (30, 31, 32, 33) else [1]:
            run(s, kind, minimum)
for marks in [0, 1, 9, 10, 99, 999, 1000, 1001, 9999, 10000, 99999, 100000, 2 ** 64 - 1]:
    s = make('marks-' + str(marks))
    s['marks'] = marks
    for target in [1000, 10000, 100000]:
        run(s, 23, target)
assert ranges == proof['native_ranges']
assert len(results) == proof['replay']['cases']
assert state['steps'] == proof['replay']['original_instruction_steps']
assert hashlib.sha256(json.dumps(results, sort_keys=True).encode()).hexdigest() == proof['replay']['case_sha256']
from discovery_native_subject import verify_native_query_subject
for query in proof['queries']:
    native = json.loads(project_path(query['result']['path']).read_text())['structuredContent']
    verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
for row in proof['native_data']:
    a = int(row['virtual_address'], 16)
    o = pe.rva_offset(a - pe.image_base)
    assert hashlib.sha256(image[o:o + row['byte_count']]).hexdigest() == row['sha256']
for row in proof['source_bindings']:
    raw = project_path(row['path']).read_bytes()
    if 'start' in row:
        source = raw.decode()
        at = source.index(row['start'])
        stop = source.index(row['end'], at + len(row['start']))
        raw = source[at:stop].encode()
    assert hashlib.sha256(raw).hexdigest() == row['sha256'], row['path']
account_source = (ROOT/'crates/azeroth-survivors-re/src/account_progression.rs').read_text()
assert '../assets/account-achievements-0.121.0.json' in account_source
inputs_source = (ROOT/'crates/azeroth-survivors-re/src/progression.rs').read_text()
assert inputs_source.count('achievement_inputs(save)') >= 2
fixture = json.loads((ROOT / 'docs/analysis/evidence/0.121.0/achievement-progress-cases.json').read_text())
assert fixture['cases'] == [[row['state'], row['kind'], row['minimum'], *row['progress']] for row in results]
print(json.dumps({'cases': len(results), 'original_instruction_steps': state['steps'], 'application_executed': False}, indent=2))
