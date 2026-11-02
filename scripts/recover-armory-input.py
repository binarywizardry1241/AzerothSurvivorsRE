#!/usr/bin/env python3
"""Retain current Armory secondary-click rules and original-instruction vectors.

--fixtures executes only bounded mutation/message fragments with explicit memory
seams. It does not launch the game, access saves, or replace the native UI audit.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import argparse, hashlib, json, struct, subprocess, sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
OUT = ROOT / 'docs/analysis/evidence/0.100.1/armory-input'
WORK = ROOT / 'runtime/target-menu-consolidation'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--fixtures', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    iv = load_script('iv', ROOT / 'scripts/inventory-executable.py')
    pe = iv.PE(data)
    ends = {pe.image_base+a: pe.image_base+z for a, z, _ in pe.functions()}

    def raw(a, n):
        off = pe.rva_offset(a-pe.image_base)
        return data[off:off+n]

    def span(a, n):
        return dict(address=hex(a), file_offset=hex(pe.rva_offset(a-pe.image_base)),
                    byte_count=n, sha256=hashlib.sha256(raw(a,n)).hexdigest())

    OUT.mkdir(parents=True, exist_ok=True)
    owners = []
    for role, a in [('secondary-click', 0x140255270), ('left-actions', 0x140257150),
                    ('any-shift-pressed', 0x1400320d0), ('piece-cell', 0x140247090),
                    ('piece-bundle', 0x1400e32f0), ('piece-insert', 0x140172f90),
                    ('piece-entity', 0x1400527e0), ('piece-ecs', 0x1402f9940),
                    ('piece-bundle-type', 0x140342b20), ('collection-footer', 0x140249840)]:
        end = ends[a]
        assembly = objdump_output(['objdump','-d','--no-show-raw-insn',
            f'--start-address={a:#x}', f'--stop-address={end:#x}', str(TARGET)], cwd=ROOT,text=True)
        (OUT/f'{role}.asm').write_text(assembly.replace(str(ROOT)+'/', ''))
        row = dict(role=role, end_exclusive=hex(end), **span(a,end-a))
        if role == 'secondary-click':
            result = json.loads((WORK/'rea-armory-secondary/003-procedure_pseudo_code.json').read_text())['response']['result']
            ev = result.get('structuredContent') or json.loads(result['content'][0]['text'])
            assert ev['provider']['id']=='ghidra' and ev['subject']['digest']['sha256']==row['sha256']
            row.update(evidence_id=ev['evidence_id'],provider=ev['provider'],
                       analysis_profile_digest=ev['analysis_profile']['digest'])
            (OUT/'secondary-click.ghidra.c').write_text(ev['normalized_result'].rstrip()+'\n')
        owners.append(row)
    fragments = [dict(role=role, end_exclusive=hex(end), **span(a,end-a))
        for role,a,end in [('right-press-predicate',0x1402553b7,0x1402553cb),
                           ('piece-mutation',0x1402558af,0x14025599e),
                           ('slot-mutation',0x14025581e,0x140255854)]]
    literals=[]
    for role,a,n in [('piece-bundle',0x145960bb7,335),('shortcut-key',0x14594f969,17)]:
        literals.append(dict(role=role,**span(a,n),text=raw(a,n).decode()))
    manifest = dict(target=str(TARGET.relative_to(ROOT)),target_sha256=SHA,
        target_executed=False,procedures=owners,fragments=fragments,
        literals=literals,shortcut_color=dict(**span(0x14594f944,20),values=struct.unpack('<I4f',raw(0x14594f944,20))),
        limits=['Static current native rules and finite original-instruction fragment cases.',
                'The piece mutation begins after native descriptor and ownership validation; imports are not simulated.',
                'No original/rebuilt interactive or visual comparison was performed.'])
    (OUT/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
    if not args.fixtures:
        return
    sys.path.insert(0,str(ROOT/'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    from unicorn.x86_const import UC_X86_REG_RAX, UC_X86_REG_RBP, UC_X86_REG_RSI, UC_X86_REG_R10, UC_X86_REG_R14

    def emulator():
        uc = Uc(UC_ARCH_X86,UC_MODE_64)
        uc.mem_map(0x140255000,0x1000)
        uc.mem_write(0x140255000,raw(0x140255000,0x1000))
        uc.mem_map(0x200000,0x4000)
        uc.reg_write(UC_X86_REG_RBP,0x200100)
        return uc

    rbp = 0x200100
    def u32(uc,a): return struct.unpack('<I',uc.mem_read(a,4))[0]
    rows=[]
    # Native paperdoll slot indices; payloads outside the selected slot remain untouched.
    catalog=json.loads((ROOT/'crates/azeroth-survivors-re/assets/armory.json').read_text())
    for slot,item in [(0,101000),(2,101100),(15,101800),(16,104900),(17,103800)]:
        piece=next(piece for hero in catalog['classes'] for piece in hero['items'] if piece['id']==item)
        assert piece['slot_id']==slot
        for shift in [False,True]:
            for worn in [0,item,item+10]:
                for look in [None,0,item,item+10]:
                    uc=emulator()
                    uc.mem_write(rbp+0x40+slot*4,struct.pack('<I',worn))
                    uc.mem_write(rbp-0x58+slot*8,struct.pack('<II',look is not None,look or 0))
                    uc.mem_write(rbp+0x23c,struct.pack('<I',item))
                    uc.mem_write(rbp+0x24e,bytes([shift]))
                    uc.reg_write(UC_X86_REG_RAX,slot)
                    uc.emu_start(0x1402558af,0x14025599e,count=100)
                    present=u32(uc,rbp-0x58+slot*8)!=0
                    rows.append(dict(action='piece',slot=slot,item=item,shift=shift,worn=worn,look=look,
                        after_worn=u32(uc,rbp+0x40+slot*4),
                        after_look=u32(uc,rbp-0x54+slot*8) if present else None,changed=True))
        for shift in [False,True]:
            for worn in [0,item]:
                for look in [None,0,item]:
                    uc=emulator()
                    uc.mem_write(rbp+0x40+slot*4,struct.pack('<I',worn))
                    uc.mem_write(rbp-0x58+slot*8,struct.pack('<II',look is not None,look or 0))
                    uc.mem_write(rbp+0x24e,bytes([shift]))
                    uc.mem_write(0x203004,bytes([slot]))
                    uc.reg_write(UC_X86_REG_RAX,0x203000)
                    uc.emu_start(0x14025581e,0x140255946,count=100)
                    present=u32(uc,rbp-0x58+slot*8)!=0
                    rows.append(dict(action='slot',slot=slot,item=item,shift=shift,worn=worn,look=look,
                        after_worn=u32(uc,rbp+0x40+slot*4),
                        after_look=u32(uc,rbp-0x54+slot*8) if present else None,
                        changed=(u32(uc,rbp+0x248)&1)!=0))
    presses=[]
    for button in [0,1,2,3,4,5]:
        for state in [0,1]:
            uc=emulator()
            uc.mem_write(0x203010,struct.pack('<H',button))
            uc.mem_write(0x203014,bytes([state]))
            uc.reg_write(UC_X86_REG_RSI,0x203000)
            uc.reg_write(UC_X86_REG_R10,0)
            uc.reg_write(UC_X86_REG_R14,0)
            uc.emu_start(0x1402553b7,0x1402553cb,count=20)
            presses.append(dict(button=button,state=state,accepted=uc.reg_read(UC_X86_REG_R14)!=0))
    (OUT/'native-mutation-fixtures.json').write_text(portable_json(dict(target_sha256=SHA,
        method='Bounded original-instruction execution; explicit native slot/descriptor/ownership seams.',
        mutations=rows,mouse_messages=presses),indent=2)+'\n')
    print(f'Executed {len(rows)} native mutation and {len(presses)} message-predicate cases.')


if __name__ == '__main__':
    main()
