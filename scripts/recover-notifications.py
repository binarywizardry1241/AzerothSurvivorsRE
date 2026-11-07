#!/usr/bin/env python3
"""Retain selected-PE banner ownership and finite native fade/expiry vectors.

Static recovery always verifies the complete EXE hash. --fixtures executes
bounded original instruction fragments through the project-local Unicorn.
No reference application, save file, Cargo process or asset archive is used.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import argparse, hashlib, json, math, struct, subprocess, sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
OUT = ROOT / 'runtime/analysis/staging/native-evidence/0.100.1/notifications'
WORK = ROOT / 'runtime/analysis/history/native-recovery/target-menu-consolidation/1af1b394d2c0'
OWNERS = {
    'dispatch': 0x140062b50, 'update': 0x1400925b0, 'row': 0x1401034a0,
    'root-bundle': 0x14034e3e0, 'deferral-producer': 0x140061430,
    'loading-cover-query': 0x14064e8c0, 'loading-plugin-build': 0x140930a20,
    'loading-resource-registration': 0x140ce3bd0,
}
REA = {'dispatch': 'rea-named-notification', 'update': 'rea-notification-update',
       'row': 'rea-notification-row'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--fixtures', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    iv = load_script('iv', ROOT / 'scripts/inventory-executable.py')
    pe = iv.PE(data)
    bounds = {pe.image_base + a: pe.image_base + z for a, z, _ in pe.functions()}

    def raw(a, n):
        o = pe.rva_offset(a - pe.image_base)
        return data[o:o+n]

    def span(a, n):
        return dict(address=hex(a), file_offset=hex(pe.rva_offset(a - pe.image_base)),
                    byte_count=n, sha256=hashlib.sha256(raw(a, n)).hexdigest())

    OUT.mkdir(parents=True, exist_ok=True)
    procedures = []
    for role, a in OWNERS.items():
        z = bounds[a]
        row = dict(role=role, end_exclusive=hex(z), **span(a, z-a))
        text = objdump_output(['objdump', '-d', '--no-show-raw-insn',
            f'--start-address={a:#x}', f'--stop-address={z:#x}', str(TARGET)], cwd=ROOT, text=True)
        (OUT / f'{role}.asm').write_text(text.replace(str(ROOT)+'/', ''))
        if role in REA:
            result = json.loads((WORK / REA[role] / '003-procedure_pseudo_code.json').read_text())['response']['result']
            ev = result.get('structuredContent') or json.loads(result['content'][0]['text'])
            assert ev['provider']['id'] == 'ghidra'
            assert ev['subject']['digest']['sha256'] == row['sha256']
            row.update(evidence_id=ev['evidence_id'], provider=ev['provider'],
                       analysis_profile_digest=ev['analysis_profile']['digest'])
            (OUT / f'{role}.ghidra.c').write_text(ev['normalized_result'].rstrip()+'\n')
        procedures.append(row)

    strings = []
    for role, a, n in [('boss-template', 0x145913db4, 19), ('guardian-template', 0x145913d8d, 39),
                      ('root-bundle-type', 0x1459639c0, 125),
                      ('loading-plugin-type', 0x145b6d551, 48)]:
        strings.append(dict(role=role, text=raw(a, n).decode(), **span(a, n)))
    assert strings[3]['text'] == 'benilla_app::loading_screen::LoadingScreenPlugin'
    vtable = 0x145b13688
    entries = struct.unpack('<14Q', raw(vtable, 112))
    assert entries[8] == 0x140930a20 and entries[12] == 0x14118e320
    type_ids = [0x1459f3fe0, 0x145a2ed48, 0x145acdbd0]
    assert len({raw(a, 16) for a in type_ids}) == 1
    slices = []
    for role, a, z in [('guardian-producer', 0x1454d64d4, 0x1454d65d2),
                       ('boss-producer', 0x1454d6716, 0x1454d6819),
                       ('loading-plugin-name', 0x14118e320, 0x14118e32d)]:
        text = objdump_output(['objdump', '-d', '--no-show-raw-insn',
            f'--start-address={a:#x}', f'--stop-address={z:#x}', str(TARGET)], cwd=ROOT, text=True)
        (OUT / f'{role}.asm').write_text(text.replace(str(ROOT)+'/', ''))
        slices.append(dict(role=role, **span(a, z-a)))
    snapshots = json.loads((WORK / 'notification-node-stores.json').read_text())[0]['snapshots']
    node = next(row for row in snapshots if row['argument'] == 'R8+0' and row['call'].startswith('0x140092e2d'))
    node.update(method='Typed BannerRoot bundle argument; only R8+0 is the actual Node. Other linear-evaluator candidates are discarded.')
    (OUT / 'root-node.json').write_text(portable_json(node, indent=2)+'\n')
    manifest = dict(target=str(TARGET.relative_to(ROOT)), target_sha256=SHA,
        target_executed=False, procedures=procedures, strings=strings, fragments=slices,
        loading_plugin_vtable=dict(**span(vtable, 112), entries=[hex(x) for x in entries],
            build_slot=8, build='0x140930a20', name_slot=12, name='0x14118e320'),
        loading_resource_type_ids=[dict(**span(a, 16), bytes=raw(a,16).hex()) for a in type_ids],
        deferral_resource_type_id=dict(**span(0x145948788, 16), bytes=raw(0x145948788,16).hex()),
        constants=[dict(**span(a,4), bits=raw(a,4).hex(), value=struct.unpack('<f',raw(a,4))[0])
            for a in [0x1459132fc,0x1459132f0,0x145907490,0x145915930,0x145907508,
                      0x145915918,0x14593f980,0x14593f924]],
        colors=[dict(**span(a,20), values=list(struct.unpack('<5f',raw(a,20))))
            for a in [0x145940688,0x1459406e8,0x145919170]],
        text_shadow_offset=dict(**span(0x1459157d0,8), values=list(struct.unpack('<2f',raw(0x1459157d0,8)))),
        limits=['Static owners/typed metadata plus bounded instruction vectors; no original/rebuilt GUI parity claim.',
            'Raw Ghidra imports use the generic GCC ABI; original-PE Windows register arguments control the interpretation.',
            'Only the named kind0 banner producer is connected by this module. Red kind1 and unrelated native notifications are separate producers.'])
    (OUT / 'manifest.json').write_text(portable_json(manifest, indent=2)+'\n')
    if args.fixtures:
        native_fixtures(pe, data)
    print(f'Retained {len(procedures)} banner/cover owners; fixtures={args.fixtures}')


def native_fixtures(pe, data):
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RSP, UC_X86_REG_RBP, UC_X86_REG_R12,
        UC_X86_REG_R13, UC_X86_REG_R15, UC_X86_REG_EDX, UC_X86_REG_XMM0,
        UC_X86_REG_XMM1, UC_X86_REG_XMM2, UC_X86_REG_XMM3, UC_X86_REG_XMM4,
        UC_X86_REG_XMM6)
    mem = 0x25000000
    code = 0x140092000
    off = pe.rva_offset(code - pe.image_base)

    def vm():
        u = Uc(UC_ARCH_X86, UC_MODE_64)
        u.mem_map(code, 0x2000)
        u.mem_write(code, data[off:off+0x2000])
        u.mem_map(mem, 0x10000)
        u.reg_write(UC_X86_REG_RSP, mem+0x8000)
        u.reg_write(UC_X86_REG_RBP, mem+0x9000)
        return u

    def xmm(u, reg, value):
        u.reg_write(reg, int.from_bytes(struct.pack('<f', value)+bytes(12), 'little'))

    def bits(value):
        return struct.pack('<f', value).hex()

    ages = [-1., 0., 0.15, 0.3, 0.75, 2.25, 2.625,
            struct.unpack('<f',struct.pack('<I',0x403fffff))[0], 3.,
            struct.unpack('<f',struct.pack('<I',0x40400001))[0], 4., float('nan')]
    fades = []
    expires = []
    for age in ages:
        u = vm()
        u.reg_write(UC_X86_REG_R13, mem+0x100)
        u.reg_write(UC_X86_REG_R15, mem+0x200)
        u.reg_write(UC_X86_REG_R12, mem+0x300)
        u.reg_write(UC_X86_REG_EDX, 1)
        u.mem_write(mem+0x114, struct.pack('<f', 0.))
        for reg, value in [(UC_X86_REG_XMM0,3.),(UC_X86_REG_XMM1,0.1),
            (UC_X86_REG_XMM2,1.),(UC_X86_REG_XMM3,0.75),(UC_X86_REG_XMM4,4.),
            (UC_X86_REG_XMM6,age)]:
            xmm(u, reg, value)
        u.hook_add(UC_HOOK_CODE, lambda uc,a,n,_: uc.emu_stop() if a==0x140092eea else None)
        u.emu_start(0x14009306c, 0x1400931ff, count=100)
        raw_alpha = bytes(u.mem_read(mem+0x210,4))
        alpha = struct.unpack('<f',raw_alpha)[0]
        fades.append(dict(age_bits=bits(age), alpha_bits=raw_alpha.hex(),
                          alpha=alpha if math.isfinite(alpha) else None))
        u = vm()
        u.reg_write(UC_X86_REG_R12, mem+0x120)
        u.mem_write(mem+0x11c,struct.pack('<f',0.))
        xmm(u, UC_X86_REG_XMM6, age)
        # XMM7 has the recovered3.0 lifetime at the native compare.
        from unicorn.x86_const import UC_X86_REG_XMM7
        xmm(u, UC_X86_REG_XMM7, 3.)
        outcome = []
        def stop(uc,a,n,_):
            if a in (0x1400927b3,0x14009309e):
                outcome.append(a==0x14009309e)
                uc.emu_stop()
        u.hook_add(UC_HOOK_CODE,stop)
        u.emu_start(0x1400927a0,0x1400931ff,count=20)
        assert len(outcome)==1
        expires.append(dict(age_bits=bits(age),expired=outcome[0]))
    (OUT / 'native-clock-fixtures.json').write_text(portable_json(dict(target_sha256=SHA,
        target_executed=False, method='Exact selected-PE instruction fragments in Unicorn; clocks/component pointers supplied as explicit input seams.',
        fade_entry='0x14009306c', fade_stop='0x140092eea',
        expiry_entry='0x1400927a0', expiry_stops=['0x1400927b3','0x14009309e'],
        fades=fades, expiry=expires,
        limits=['These fragments have no imported function calls or private replacement arithmetic.',
                'Component storage, clock values and code mapping are explicit harness seams.',
                'Not an original-application session or presentation parity check.']),indent=2)+'\n')
    print(f'Executed {len(fades)} native fade + {len(expires)} expiry cases')


if __name__ == '__main__':
    main()
