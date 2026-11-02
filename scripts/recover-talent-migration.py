#!/usr/bin/env python3
"""Replay current allocation decoding/normalization without compiling or launching a game.

The original decoder, Unicode trim, lookup, collector, insertion sort, learning
gates and normalizer execute unchanged. Only allocation/free, memcmp and memchr
are host seams. Cases intentionally stay below the large-sort threshold (21).
"""
from portable_paths import objdump_output, portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe'
WORK = ROOT / 'runtime/talent-migration-01050'
OUT = ROOT / 'runtime/native-evidence/0.105.0/talent-migration'
RETAINED = ROOT / 'docs/analysis/evidence/0.105.0/talent-migration'
OWNERS = {
    'decode-entry': (0x1459a6540, 0x1459a679b),
    'normalize': (0x1458e2c50, 0x1458e3400),
    'collect': (0x14599f9f0, 0x14599fb8b),
    'requirements': (0x1458b9220, 0x1458b9391),
    'lookup': (0x1458e6190, 0x1458e62bb),
    'exclude': (0x1458e2070, 0x1458e2226),
    'sort': (0x1459822f0, 0x145982400),
    'split': (0x1459a67a0, 0x1459a695a),
    'trim': (0x14006f550, 0x14006f7c9),
}


def save(path, value):
    path.write_text(portable_json(value, indent=2, ensure_ascii=True) + '\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    parser.add_argument('--prepare-native', action='store_true')
    parser.add_argument('--collect', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    offset = lambda a: pe.rva_offset(a - pe.image_base)
    ranges = []
    for role, (lo, hi) in OWNERS.items():
        blob = data[offset(lo):offset(lo) + hi - lo]
        ranges.append(dict(role=role, address=hex(lo), end_exclusive=hex(hi),
                           file_offset=hex(offset(lo)), byte_count=hi - lo,
                           sha256=hashlib.sha256(blob).hexdigest()))
        if args.prepare_native and role in ['decode-entry', 'normalize', 'collect', 'requirements']:
            WORK.mkdir(parents=True, exist_ok=True)
            (WORK / f'{role}.bin').write_bytes(blob)
            save(WORK / f'{role}-plan.json', dict(
                target=str((WORK / f'{role}.bin').relative_to(ROOT)),
                output=f'runtime/talent-migration-01050/rea-{role}',
                init_timeout=60, open_timeout=60, timeout=180,
                open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(lo)),
                operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(lo)))]))
        if args.collect:
            OUT.mkdir(parents=True, exist_ok=True)
            text = objdump_output(['objdump', '-d', '--no-show-raw-insn',
                f'--start-address={lo:#x}', f'--stop-address={hi:#x}', str(TARGET.relative_to(ROOT))],
                cwd=ROOT, text=True)
            filename = f'{role}.asm'
            (OUT / filename).write_text(text)
            ranges[-1].update(assembly=filename, assembly_sha256=hashlib.sha256(text.encode()).hexdigest())
            if role in ['decode-entry', 'normalize', 'collect', 'requirements']:
                raw = json.loads((WORK / f'rea-{role}/003-procedure_pseudo_code.json').read_text())
                evidence = raw['response']['result']['structuredContent']
                assert evidence['subject']['digest']['sha256'] == ranges[-1]['sha256']
                text = '\n'.join(line.rstrip() for line in evidence['normalized_result'].splitlines()).strip() + '\n'
                filename = f'{role}.ghidra.c'
                (OUT / filename).write_text(text)
                ranges[-1].update(pseudocode=filename, pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest(),
                                 evidence_id=evidence['evidence_id'], provider=evidence['provider'],
                                 analysis_profile_digest=evidence['analysis_profile']['digest'])
    if args.prepare_native:
        print('Prepared four exact Ghidra slices; no target executed')
        return
    if args.check:
        manifest = json.loads((RETAINED / 'manifest.json').read_text())
        assert manifest['target_sha256'] == SHA
        for expected, actual in zip(manifest['ranges'], ranges, strict=True):
            assert all(expected[k] == v for k, v in actual.items())
            for field in ['assembly', 'pseudocode']:
                if field in expected:
                    assert hashlib.sha256((RETAINED / expected[field]).read_bytes()).hexdigest() == expected[field + '_sha256']

    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(heap, 0x800000)
    u.mem_map(stack, 0x20000)
    u.mem_map(done, 4096)
    next_heap = heap

    def put(a, fmt, *values):
        u.mem_write(a, struct.pack(fmt, *values))

    def get(a, fmt):
        return struct.unpack(fmt, u.mem_read(a, struct.calcsize(fmt)))

    def alloc(size):
        nonlocal next_heap
        pointer = next_heap
        next_heap += (max(size, 1) + 15) & ~15
        assert next_heap < heap + 0x800000
        u.mem_write(pointer, bytes(max(size, 1)))
        return pointer

    def hook(_, a, size, unused):
        if a == done:
            u.emu_stop()
            return
        if any(lo <= a < hi for lo, hi in OWNERS.values()):
            return
        rcx, rdx, r8 = [u.reg_read(x) for x in [r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8]]
        if a in [0x140002200, 0x1400021d0]:
            pass
        elif a == 0x1400021c0:
            u.reg_write(r.UC_X86_REG_RAX, alloc(rcx))
        elif a == 0x145bc9787:
            u.reg_write(r.UC_X86_REG_RAX, int(u.mem_read(rcx, r8) != u.mem_read(rdx, r8)))
        elif a == 0x145ba4f00:
            found = bytes(u.mem_read(rdx, r8)).find(bytes([rcx & 255]))
            u.reg_write(r.UC_X86_REG_RAX, int(found >= 0))
            u.reg_write(r.UC_X86_REG_RDX, max(found, 0))
        elif a in [0x145bcb680, 0x145bcb2d0]:
            capacity, old, count = get(rcx, '<3Q')
            width = 16 if a == 0x145bcb680 else get(u.reg_read(r.UC_X86_REG_RSP) + 0x28, '<Q')[0]
            new_capacity = max(4, capacity * 2, count + 1)
            pointer = alloc(new_capacity * width)
            if count:
                u.mem_write(pointer, bytes(u.mem_read(old, count * width)))
            put(rcx, '<2Q', new_capacity, pointer)
        else:
            raise RuntimeError(f'Unreviewed native call {a:#x}')
        sp = u.reg_read(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RIP, get(sp, '<Q')[0])
        u.reg_write(r.UC_X86_REG_RSP, sp + 8)

    u.hook_add(UC_HOOK_CODE, hook)

    def invoke(a, *values):
        sp = stack + 0x18008
        put(sp, '<Q', done)
        u.reg_write(r.UC_X86_REG_RSP, sp)
        for register, value in zip([r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8, r.UC_X86_REG_R9], values):
            u.reg_write(register, value)
        u.emu_start(a, 0, count=200000)
        assert u.reg_read(r.UC_X86_REG_RIP) == done, 'Native instruction limit reached'

    def key(pointer):
        p, n = get(pointer + 0x20, '<2Q')
        return bytes(u.mem_read(p, n)).decode()

    def decode(text, class_id):
        raw = text.encode()
        text_at, class_at, state = alloc(len(raw)), alloc(1), alloc(80)
        u.mem_write(text_at, raw)
        put(class_at, '<B', class_id)
        put(state, '<8Q', class_at, 0, len(raw), text_at, len(raw), 0, len(raw), 0x2c0000002c)
        put(state + 0x40, '<B', 1)
        put(state + 0x48, '<B', 1)
        output = []
        for _ in range(100):
            invoke(OWNERS['decode-entry'][0], state)
            pointer = u.reg_read(r.UC_X86_REG_RAX)
            if not pointer:
                return output
            output.append((pointer, u.reg_read(r.UC_X86_REG_RDX) & 255))
        raise AssertionError('Decoder did not terminate')

    cases = []

    def case(label, text, budget=51, class_id=9, expected=None):
        decoded = decode(text, class_id)
        vector, rows, output = alloc(24), alloc(16 * len(decoded)), alloc(24)
        for i, (pointer, rank) in enumerate(decoded):
            put(rows + i * 16, '<QB7x', pointer, rank)
        put(vector, '<3Q', len(decoded), rows, len(decoded))
        invoke(OWNERS['normalize'][0], output, vector, class_id, budget)
        _, pointer, count = get(output, '<3Q')
        native = sorted((key(get(pointer + i * 16, '<Q')[0]), get(pointer + i * 16 + 8, '<B')[0]) for i in range(count))
        if expected is not None:
            assert native == sorted(expected), (label, native, expected)
        row = dict(label=label, class_id=class_id, budget=budget, allocation=text,
                   decoded=[[key(p), n] for p, n in decoded], normalized=[list(x) for x in native],
                   unspent=budget - sum(rank for _, rank in native))
        cases.append(row)
        return native

    base = 'demonic_familiar:5,demonic_embrace:5,fel_stamina:3,unholy_power:5'
    keep = [(k, int(n)) for k, n in (entry.split(':') for entry in base.split(','))]
    case('old-tree-shared-keys-and-removed-talents', 'demonic_embrace:5,fel_intellect:5,fel_stamina:3,imp_health_funnel:5,summon_imp:1,unholy_power:5,imp_succubus:3,master_demonologist:5,demonic_pact:1,demonic_knowledge:3,imp_enslave:3,demonic_sacrifice:3,felguard:1',
         expected=[('demonic_embrace', 5), ('fel_stamina', 3), ('unholy_power', 5)])
    for rank in [1, 3, 255]:
        case(f'preserved-keys-{rank}', base + f',felfire_training:{rank},imp_shadow_bolt:5,bane:5,aftermath:{rank},demonic_knowledge:3',
             expected=keep + [('felfire_training', min(rank, 3)), ('imp_shadow_bolt', 5), ('bane', 5), ('aftermath', min(rank, 5))])
    for whitespace in [' ', '\t', '\u00a0', '\u2003', '\u3000']:
        case(f'trim-{ord(whitespace):04x}', base + f',{whitespace}felfire_training{whitespace}:{whitespace}+3{whitespace}',
             expected=keep + [('felfire_training', 3)])
    for invalid in ['', '0', '256', '-1', '3x', '1:2', '+', '\u200b3', '\x1c3']:
        case('invalid-rank-' + repr(invalid), base + ',felfire_training:' + invalid, expected=keep)
    case('unknown-key', base + ',demonic_knowledge:3,unknown:255', expected=keep)
    case('no-rename-to-supremacy', base + ',demonic_knowledge:3', expected=keep)
    for budget in [0, 1, 5, 10, 18, 20, 21, 51]:
        case(f'budget-{budget}', base + ',felfire_training:3,demonic_knowledge:3', budget)
    for choice, other in [('soul_devourer', 'soul_link'), ('soul_link', 'soul_devourer')]:
        case(choice + '-gate', base + f',{choice}:3,felfire_training:3,master_demonologist:3,legion_gate:1',
             expected=keep + [(choice, 3), ('felfire_training', 3), ('master_demonologist', 3), ('legion_gate', 1)])
    case('mutual-exclusion', base + ',soul_link:3,soul_devourer:3,felfire_training:3',
         expected=keep + [('soul_devourer', 3), ('felfire_training', 3)])
    case('same-key-on-other-class', base + ',felfire_training:3,aftermath:5', class_id=1, expected=[])
    result = dict(target_sha256=SHA, cases=cases,
                  limits=['Original bounded x64 instructions only; no build, source test binary or game executes.',
                          'Allocator/vector growth, inert frees, memcmp and memchr are reviewed host seams.',
                          'Cases use fewer than 21 candidates; large-sort code and filesystem/envelope/UI execution are not covered.',
                          'Source regression tests, compilation and original/rebuilt gameplay/presentation remain unverified.'])
    OUT.mkdir(parents=True, exist_ok=True)
    save(OUT / 'native-cases.json', result)
    if args.check:
        assert portable_record(json.loads((RETAINED / 'native-cases.json').read_text())) == portable_record(result)
    if args.collect:
        save(OUT / 'manifest.json', dict(target_sha256=SHA, ranges=ranges))
    print(f'Passed {len(cases)} native allocation decode/normalization cases; static only')


if __name__ == '__main__':
    main()
