#!/usr/bin/env python3
"""Check the current custom-menu hero booth against hash-bound native owners.

--prepare stages original-VA REA/Ghidra inputs. --write curates completed static
REA results and isolated instruction vectors. Default is read-only verification.
No compiler, application, Lua VM, file operation or game is executed.
"""
from portable_paths import portable_json, portable_record
from native_recovery import digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
WORK = ROOT / 'runtime/analysis/history/native-recovery/secondary-pages/408536b1c3c9'
OUT = ROOT / 'docs/analysis/evidence/0.109.0/hero-preview'
OWNERS = {
    'hero-booth': (0x140C17470, 0x140C19989),
    'hero-get-request': (0x14058D450, 0x14058D547),
    'hero-body-map': (0x140B3C0F0, 0x140B3C1C0),
    'hero-body-frame': (0x140BCB130, 0x140BCB4AF),
}
LITERALS = [(0x145D9D2A0, 4), (0x145F3DB60, 4),
            (0x145F3DB70, 40), (0x145F3DF10, 32),
            (0x145F49830, 15), (0x145F49888, 19)]


def digest(raw):
    return _shared_digest(raw)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--prepare', action='store_true')
    mode.add_argument('--write', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=False)
    assert target['sha256'] == SHA, 'Recover changed installed target before using these addresses'
    data = target_bytes(target)
    module = load_script('hero_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}

    def raw(a, n):
        at = pe.rva_offset(a - pe.image_base)
        return data[at:at+n]

    assert all(bounds[a] == b for a, b in OWNERS.values())
    if args.prepare:
        WORK.mkdir(parents=True, exist_ok=True)
        for role, (a, b) in OWNERS.items():
            source = WORK / (role + '.bin')
            source.write_bytes(raw(a, b-a))
            plan = dict(target=source.relative_to(ROOT).as_posix(),
                output=(WORK / (role + '-rea')).relative_to(ROOT).as_posix(),
                open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(a)),
                timeout=240, open_timeout=60, init_timeout=60,
                operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(a)))])
            (WORK / (role + '-plan.json')).write_text(portable_json(plan, indent=2) + '\n')
        print('Prepared four exact current-target Ghidra inputs; target not run.')
        return
    sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
                    str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
    import capstone
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    prior = None if args.write else json.loads((OUT / 'manifest.json').read_text())
    if args.write:
        OUT.mkdir(parents=True, exist_ok=True)
    rows = []
    for role, (a, b) in OWNERS.items():
        payload = raw(a, b-a)
        instructions = list(decoder.disasm(payload, a))
        assert sum(i.size for i in instructions) == b-a, role
        assembly = ''.join(f'{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}'.rstrip() + '\n'
                           for i in instructions)
        row = dict(role=role, address=hex(a), end_exclusive=hex(b), byte_count=b-a,
            file_offset=hex(pe.rva_offset(a-pe.image_base)), sha256=digest(payload),
            instruction_count=len(instructions), assembly=role+'.asm', assembly_sha256=digest(assembly.encode()))
        if args.write:
            result = json.loads((WORK / (role+'-rea/003-procedure_pseudo_code.json')).read_text())
            evidence = result['response']['result']['structuredContent']
            assert evidence['provider']['id'] == 'ghidra'
            assert evidence['subject']['digest']['sha256'] == row['sha256']
            pseudo = '\n'.join(line.rstrip() for line in evidence['normalized_result'].splitlines()).strip() + '\n'
            row.update(rea_evidence_id=evidence['evidence_id'], provider=evidence['provider'],
                analysis_profile_digest=evidence['analysis_profile']['digest'], pseudocode=role+'.c',
                pseudocode_sha256=digest(pseudo.encode()))
            (OUT / row['assembly']).write_text(assembly)
            (OUT / row['pseudocode']).write_text(pseudo)
        else:
            old = next(v for v in prior['owners'] if v['role'] == role)
            for key in ['rea_evidence_id', 'provider', 'analysis_profile_digest', 'pseudocode', 'pseudocode_sha256']:
                row[key] = old[key]
            assert (OUT / row['assembly']).read_text() == assembly
            assert digest((OUT / row['pseudocode']).read_bytes()) == row['pseudocode_sha256']
        rows.append(row)
    # These instructions have no calls or branches. Register/stack fixtures are explicit:
    # the native original arithmetic, not a translated helper, supplies each output.
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    for a, n in [(0x140C17470, 9497)] + LITERALS:
        for page in range(a & ~4095, (a+n+4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                machine.mem_write(page, raw(page, 4096))
                mapped.add(page)
    memory = 0x200000000
    machine.mem_map(memory, 4096)
    sizes = []
    for width in [0, 1, 124, 2048, 4096]:
        for height in [0, 1, 168, 2048, 4096]:
            machine.reg_write(reg.UC_X86_REG_ESI, width)
            machine.reg_write(reg.UC_X86_REG_R13D, height)
            machine.emu_start(0x140C1763C, 0x140C1764F, count=6)
            result = [machine.reg_read(reg.UC_X86_REG_EDX), machine.reg_read(reg.UC_X86_REG_R8D)]
            assert result == [max(width, 1), max(height, 1)]
            sizes.append(dict(request=[width, height], native_minimum=result))
    f32 = lambda v: struct.unpack('<f', struct.pack('<f', v))[0]
    scales = []
    assert struct.unpack('<f', raw(0x145D9D2A0, 4))[0] == 1.0
    numerator = struct.unpack('<f', raw(0x145F3DB60, 4))[0]
    assert numerator == f32(f32(f32(4/3) * f32(4/3)) + 1.)
    for aspect in [0., .5, 1., 4/3, 16/9, 32/9, 9/16, 2., 3.]:
        aspect = f32(aspect)
        machine.mem_write(memory+0x128, struct.pack('<Q', memory+0x400))
        machine.mem_write(memory+0x400, struct.pack('<f', aspect))
        machine.reg_write(reg.UC_X86_REG_RBP, memory)
        machine.emu_start(0x140C18E2A, 0x140C18E52, count=7)
        result = struct.unpack('<f', (machine.reg_read(reg.UC_X86_REG_XMM10) & 0xffffffff).to_bytes(4,'little'))[0]
        expected = f32(math.sqrt(f32(numerator / f32(f32(aspect*aspect)+1.))))
        assert result == expected
        scales.append(dict(display_aspect=aspect, native_root_scale=result))
    # The withdrawn-request branch is independently replayed with missing map
    # entries and no-op ECS submission; native state stores/publication execute.
    for address in [0x14000d750,0x140556310,0x140556680,0x144e7f8d0,0x14058d6c0]:
        page=address & ~4095
        if page not in mapped:
            machine.mem_map(page,4096);machine.mem_write(page,raw(page,4096));mapped.add(page)
    withdrawn = []
    call_trace = []
    def cleanup_hook(u, address, size, unused):
        if 0x140C176A2 <= address < 0x140C178B2:
            return
        if address == 0x140C18FCD:
            u.emu_stop()
            return
        call_trace.append(hex(address))
        out = u.reg_read(reg.UC_X86_REG_RCX)
        if address == 0x14000D750:
            u.reg_write(reg.UC_X86_REG_RAX, 0)
        elif address == 0x140556310:
            u.mem_write(out, bytes(0xd0)); u.mem_write(out+24, struct.pack('<Q',2))
        elif address == 0x140556680:
            u.mem_write(out, struct.pack('<Q',0xffffffffffffffff))
        elif address == 0x144E7F8D0:
            pass
        elif address == 0x14058D6C0:
            assert u.mem_read(out,1) == b'\x02'
        else:
            raise AssertionError(f'Unreviewed cleanup seam {address:#x}')
        sp = u.reg_read(reg.UC_X86_REG_RSP)
        u.reg_write(reg.UC_X86_REG_RIP,struct.unpack('<Q',u.mem_read(sp,8))[0])
        u.reg_write(reg.UC_X86_REG_RSP,sp+8)
    hook = machine.hook_add(UC_HOOK_CODE,cleanup_hook)
    for active in [0,1]:
        machine.mem_write(memory,bytes(4096));state=memory+0x500
        machine.mem_write(state,b'\x5a'*0xb0);machine.mem_write(state+0x90,struct.pack('<I',active))
        for off,ptr in [(0x40,0xc00),(0x68,0x800),(0x78,0x900),(0x88,0xa00),(0x98,0xb00)]:
            machine.mem_write(memory+off,struct.pack('<Q',memory+ptr))
        machine.reg_write(reg.UC_X86_REG_RBP,memory);machine.reg_write(reg.UC_X86_REG_RBX,state)
        machine.reg_write(reg.UC_X86_REG_R15,memory+0x700);machine.reg_write(reg.UC_X86_REG_R14D,1)
        machine.reg_write(reg.UC_X86_REG_RSP,memory+0xf00);call_trace=[]
        machine.emu_start(0x140C176A2,0,count=10000)
        fields={hex(off):bytes(machine.mem_read(state+off,n)).hex()for off,n in [(0,4),(0x10,4),(0x90,4),(0x98,8),(0xa0,4)]}
        assert fields['0x90']=='00000000'
        if active:
            assert fields == {'0x0':'00000000','0x10':'02000000','0x90':'00000000','0x98':'0000000000000000','0xa0':'00000000'}
            assert call_trace == ['0x14000d750','0x140556310','0x144e7f8d0','0x14000d750','0x140556680','0x14058d6c0']
        else:
            assert call_trace == []
        withdrawn.append(dict(previously_active=bool(active),state_fields=fields,callee_seams=call_trace))
    machine.hook_del(hook)
    proof = dict(target_sha256=SHA, target_version='0.109.0', owners=rows,
        literals=[dict(address=hex(a), byte_count=n, sha256=digest(raw(a,n)), hex=raw(a,n).hex()) for a,n in LITERALS],
        native_vectors=dict(minimum_target_axes=sizes, fallback_root_scales=scales, withdrawn_request=withdrawn),
        source_refs=['crates/benilla-app/src/portrait/hero_booth.rs',
            'crates/benilla-app/src/portrait/mod.rs', 'crates/benilla-app/src/entities.rs',
            'crates/benilla-app/src/ui_dressup.rs', 'crates/benilla-app/src/local_client.rs',
            'crates/azeroth-survivors-re/src/preview.rs', 'crates/azeroth-survivors-re/src/menu.rs'],
        limits=['Raw-function Ghidra imports use generic ABI and omit external data/caller completeness.',
            '34 bounded arithmetic vectors run without native calls. Two withdrawn-request cases additionally replay the native branch with map-miss/hash and ECS/publication seams; neither reaches OS/game code.',
            'Shared assembler/rig/material/particle dependencies are source-connected; their complete current-target ownership remains separate.',
            'Compilation, actual input, texture residency, GPU rendering and original/rebuilt visual parity are unverified.'])
    path = OUT / 'manifest.json'
    if args.write:
        path.write_text(portable_json(proof, indent=2) + '\n')
    else:
        assert portable_record(json.loads(path.read_text())) == portable_record(proof), 'Hero preview evidence drift'
    print('Checked four current native owners and 34 no-call arithmetic cases and two withdrawn-request branches; no compiler/game.')


if __name__ == '__main__':
    main()
