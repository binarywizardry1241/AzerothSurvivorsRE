#!/usr/bin/env python3
"""Validate selected stat16/17 talent ranks in the current native owner.

Only unchanged 0.105.0 instructions execute. Allocation growth is an explicit
host seam; no original game or reconstructed source executes. Fresh output is
ignored until reviewed. --rea imports this current function through Ghidra.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import bits as _shared_bits
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.105.0.exe'
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'
OUT = ROOT / 'runtime/power-scaling-0.105.0/ranks'
START, END = 0x1458e17f0, 0x1458e1dfe


def save(path, value):
    path.write_text(portable_json(value, indent=2) + '\n')


def bits(value):
    return _shared_bits(value)


def vectors(pe):
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['virtual_size'], s['raw_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s['rva'], pe.data[s['raw_offset']:s['raw_offset'] + s['raw_size']])
    mem, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(mem, 0x10000)
    u.mem_map(stack, 0x10000)
    u.mem_map(done, 4096)
    output, input_vec, rows, definition, effect, slab = [mem + n for n in (0, 0x100, 0x200, 0x300, 0x400, 0x1000)]

    def put(at, fmt, *values):
        u.mem_write(at, struct.pack(fmt, *values))

    def get(at, fmt):
        return struct.unpack(fmt, u.mem_read(at, struct.calcsize(fmt)))

    calls = []

    def hook(_, address, size, unused):
        if address == done:
            u.emu_stop()
        elif START <= address < END:
            pass
        elif address == 0x145bcb450:
            # Vec<(talent definition *, Effect64)> growth; the selected path
            # produces one72-byte row. Preserve descriptor/copy semantics.
            vector = u.reg_read(r.UC_X86_REG_RCX)
            capacity, old, count = get(vector, '<3Q')
            assert capacity == 0 and count == 0
            put(vector, '<3Q', 4, slab, count)
            calls.append('capacity_growth')
            sp = u.reg_read(r.UC_X86_REG_RSP)
            u.reg_write(r.UC_X86_REG_RIP, get(sp, '<Q')[0])
            u.reg_write(r.UC_X86_REG_RSP, sp + 8)
        else:
            raise RuntimeError('Unreviewed instruction ' + hex(address))

    u.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for stat, amount in [(16, .05), (16, .04), (17, .20)]:
        for rank in range(1, 6):
            u.mem_write(mem, bytes(0x10000))
            u.mem_write(stack, bytes(0x10000))
            calls.clear()
            put(input_vec, '<3Q', 1, rows, 1)
            put(rows, '<QB7x', definition, rank)
            put(definition + 0x50, '<2Q', effect, 1)
            raw = bytearray(64)
            raw[0], raw[8] = 35, stat
            struct.pack_into('<f', raw, 4, amount)
            u.mem_write(effect, bytes(raw))
            sp = stack + 0x8008
            put(sp, '<Q', done)
            for reg, value in [(r.UC_X86_REG_RSP, sp), (r.UC_X86_REG_RCX, output),
                               (r.UC_X86_REG_RDX, input_vec), (r.UC_X86_REG_MXCSR, 0x1f80)]:
                u.reg_write(reg, value)
            u.emu_start(START, 0, count=2000)
            assert u.reg_read(r.UC_X86_REG_RIP) == done
            capacity, pointer, count = get(output, '<3Q')
            assert capacity == 4 and count == 1 and pointer == slab
            owner, tag, scaled, stat_out = (get(slab, '<Q')[0], get(slab + 8, '<B')[0],
                                           get(slab + 12, '<I')[0], get(slab + 16, '<B')[0])
            expected = bits(struct.unpack('<f', struct.pack('<f', amount))[0] * rank)
            assert owner == definition and tag == 35 and stat_out == stat and scaled == expected
            cases.append(dict(stat=stat, native_variant=35, input_amount_bits=bits(amount), rank=rank,
                              scaled_amount_bits=scaled, output_stat=stat_out,
                              output_variant=tag, owner_preserved=True, calls=list(calls)))
    return cases


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rea', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script('pe_inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    assert (START - pe.image_base, END - pe.image_base) in [(a, b) for a, b, _ in pe.functions()]
    offset = pe.rva_offset(START - pe.image_base)
    raw = data[offset:offset + END - START]
    record = dict(start=hex(START), end_exclusive=hex(END), file_offset=hex(offset), sha256=hashlib.sha256(raw).hexdigest())
    OUT.mkdir(parents=True, exist_ok=True)
    binary, rea_out = OUT / 'rank-owner.bin', OUT / 'rea-rank-owner'
    binary.write_bytes(raw)
    (OUT / 'rank-owner.asm').write_text(objdump_output([
        'objdump', '-d', '--no-show-raw-insn', f'--start-address={START:#x}',
        f'--stop-address={END:#x}', str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True))
    if args.rea and not rea_out.exists():
        plan = OUT / 'plan.json'
        save(plan, dict(target=str(binary.relative_to(ROOT)), output=str(rea_out.relative_to(ROOT)),
                        init_timeout=60, open_timeout=60, timeout=180,
                        open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(START)),
                        operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(START)))]))
        subprocess.run(['python3', 'scripts/rea-batch.py', str(plan.relative_to(ROOT))], cwd=ROOT, check=True)
    response = json.loads((rea_out / '003-procedure_pseudo_code.json').read_text())['response']['result']
    evidence = response.get('structuredContent') or json.loads(response['content'][0]['text'])
    assert evidence['subject']['digest']['sha256'] == record['sha256'] and evidence['provider']['id'] == 'ghidra'
    (OUT / 'rank-owner.ghidra.c').write_text(evidence['raw_result']['value'])
    cases = vectors(pe)
    save(OUT / 'native-fixtures.json', dict(target_sha256=SHA, cases=cases,
         seams=['Full current talent-rank producer executes against controlled runtime talent definitions, each containing one raw35 stat effect.',
                'The Vec capacity growth call uses host storage; no gameplay/stat/scaling instructions are replaced.',
                'Only variant, stat, f32 amount, output count and preserved definition identity are asserted. Inactive enum bytes and padding are not semantic evidence.',
                'No original application process or reconstructed source executes.']))
    save(OUT / 'manifest.json', dict(target=str(TARGET.relative_to(ROOT)), target_sha256=SHA,
         target_process_launched=False, owner=dict(**record, assembly='rank-owner.asm', decompiler='rank-owner.ghidra.c'),
         rea=dict(evidence_id=evidence['evidence_id'], provider='Ghidra 12.1.4',
                  limitation='Headerless current function import; PE instructions establish ABI and external data/calls. The switch table is external to the import; the selected raw35 branch is direct.'),
         fields=dict(input_vector='capacity,+8 rows,+16 length', input_stride=16,
                     runtime_definition='row+0 pointer; effects at definition+80/+88',
                     rank='row+8 unsigned byte converted to f32 at1458e18ca..1458e18ce',
                     stat='Effect64+8 preserved by1458e1a00',
                     amount='Effect64+4 multiplied by f32(rank) at1458e1a06..1458e1a0d',
                     output='72-byte rows {definition pointer, Effect64}'),
         semantic_normalization='Selected current native variant35 stat effects correspond to historical source internal variant30. Source rank multiplication at offset4 has the same selected16/17 semantics; the historical asset namespace is unchanged.',
         vectors=len(cases), limits=['This narrowly validates selected coefficients/stat16/17 and ranks1..5, not the full current talent catalog or other rank branches.',
                                    'Native vectors do not establish original/rebuilt gameplay or presentation parity.']))
    print(f'{len(cases)} current native stat16/17 rank vectors passed')


if __name__ == '__main__':
    main()
