#!/usr/bin/env python3
"""Retain current desktop Saves controls, listing and captured import lifecycle.

--fixtures executes bounded extension and two-record ordering instructions with
explicit path/mtime memory and a byte-comparison seam. No game or OS imports run.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import argparse, hashlib, json, struct, subprocess, sys

ROOT=Path(__file__).resolve().parents[1]
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA='17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
OUT=ROOT/'docs/analysis/evidence/saves-browser-comparison'
WORK=ROOT/'runtime/analysis/history/native-recovery/target-menu-consolidation/1af1b394d2c0'
OWNERS={
    'desktop-page':0x140279c80,'desktop-row':0x1401517c0,'confirmation-pane':0x140151bf0,
    'ui-input':0x14028d750,'world-input':0x140287fa0,'extension-filter':0x1402852f0,
    'entry-filter-map':0x1401adcf0,'entry-collect':0x1401abbc0,
    'short-ordering':0x140230ff0,'long-ordering':0x14017b800,
    'merge-ordering':0x14000a660,
    'discard-sort-metadata':0x14017a6c0,'export-save':0x14543a660,
    'import-save':0x14543a760,'saves-directory':0x14543a9c0,
}
REA={'desktop-page':'rea-saves-page','ui-input':'rea-saves-ui-input',
     'world-input':'rea-saves-world-input','extension-filter':'rea-saves-file-list'}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--fixtures',action='store_true')
    args=parser.parse_args()
    data=TARGET.read_bytes();assert hashlib.sha256(data).hexdigest()==SHA
    iv = load_script('iv', ROOT/'scripts/inventory-executable.py');pe=iv.PE(data)
    ends={pe.image_base+a:pe.image_base+z for a,z,_ in pe.functions()}
    def raw(a,n):
        off=pe.rva_offset(a-pe.image_base);return data[off:off+n]
    def span(a,n):
        return dict(address=hex(a),file_offset=hex(pe.rva_offset(a-pe.image_base)),
                    byte_count=n,sha256=hashlib.sha256(raw(a,n)).hexdigest())
    OUT.mkdir(parents=True,exist_ok=True);procedures=[]
    for role,a in OWNERS.items():
        end=ends[a];row=dict(role=role,end_exclusive=hex(end),**span(a,end-a))
        assembly=objdump_output(['objdump','-d','--no-show-raw-insn',
            f'--start-address={a:#x}',f'--stop-address={end:#x}',str(TARGET)],cwd=ROOT,text=True)
        (OUT/f'{role}.asm').write_text(assembly.replace(str(ROOT)+'/',''))
        if role in REA:
            j=json.loads((WORK/REA[role]/'003-procedure_pseudo_code.json').read_text())['response']['result']
            ev=j.get('structuredContent') or json.loads(j['content'][0]['text'])
            assert ev['provider']['id']=='ghidra' and ev['subject']['digest']['sha256']==row['sha256']
            row.update(evidence_id=ev['evidence_id'],provider=ev['provider'],
                       analysis_profile_digest=ev['analysis_profile']['digest'])
            (OUT/f'{role}.ghidra.c').write_text(ev['normalized_result'].rstrip()+'\n')
        procedures.append(row)
    literals=[]
    for role,a,n in [('export-label',0x1459435b8,19),('open-folder-label',0x1459435cb,25),
                     ('desktop-import-label',0x1459435e4,14),('backups-explanation',0x145952a8f,21),
                     ('not-save-error',0x14673db4c,15),('damaged-error',0x14673db5b,12)]:
        literals.append(dict(role=role,**span(a,n),text=raw(a,n).decode()))
    base=0x14595b7ac
    cases={i:hex(base+struct.unpack('<i',raw(base+4*i,4))[0]) for i in [0,9,11,13,14,15,17]}
    manifest=dict(target=str(TARGET.relative_to(ROOT)),target_sha256=SHA,target_executed=False,
        procedures=procedures,literals=literals,ui_action_cases=cases,
        limits=['Selected desktop Windows PE only; no browser executable was supplied.',
                'Ghidra raw imports use generic GCC signatures. Original assembly binds Win64 arguments.',
                'UI/world input pseudocode omits or loses structured indirect-jump branches; complete owner assembly is authoritative.',
                'Static reconstruction and finite fragments do not establish interactive or cross-platform filesystem parity.'])
    (OUT/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
    if not args.fixtures:return
    sys.path.insert(0,str(ROOT/'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RAX,UC_X86_REG_RBP,UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_RSP,UC_X86_REG_RSI
    def create(base,length):
        uc=Uc(UC_ARCH_X86,UC_MODE_64);uc.mem_map(base,length);uc.mem_write(base,raw(base,length));uc.mem_map(0x200000,0x10000);return uc
    extensions=[]
    for text in [None,'','sav','SAV','SaV','sAv','sAV','SAv','SA v','saV','s','sa','save','savx','.sav','säv','txt']:
        uc=create(0x140285000,0x1000);rbp=0x200100
        encoded=(text or '').encode();uc.mem_write(0x202000,encoded or b'\0')
        uc.reg_write(UC_X86_REG_RBP,rbp);uc.reg_write(UC_X86_REG_RAX,0 if text is None else 0x202000)
        uc.reg_write(UC_X86_REG_RDX,len(encoded));uc.emu_start(0x14028531e,0x14028539d,count=100)
        extensions.append(dict(extension=text,accepted=(uc.reg_read(UC_X86_REG_RSI)&0xff)!=0))
    orders=[]
    names=[('z.sav','A.sav'),('A.sav','z.sav'),('a.sav','A.sav'),('a.sav','a.sav'),('a.sav','aa.sav')]
    for first_time,second_time in [(None,None),(None,10),(10,None),(10,20),(20,10),(10,10)]:
        for first,second in names:
            uc=create(0x140230000,0x2000);rows=0x204000
            for i,(name,mtime) in enumerate([(first,first_time),(second,second_time)]):
                a=rows+i*72;ptr=0x206000+i*0x100;encoded=name.encode();uc.mem_write(ptr,encoded)
                uc.mem_write(a,struct.pack('<QQQ',len(encoded),ptr,len(encoded)))
                uc.mem_write(a+24,struct.pack('<Iq',mtime is not None,mtime or 0));uc.mem_write(a+68,struct.pack('<I',i))
            uc.mem_map(0x145773000,0x1000);uc.mem_write(0x1457731e7,b'\xc3')
            def comparator(emulator,address,size,userdata):
                if address!=0x1457731e7:return
                n=emulator.reg_read(UC_X86_REG_R8)
                a=bytes(emulator.mem_read(emulator.reg_read(UC_X86_REG_RCX),n))
                b=bytes(emulator.mem_read(emulator.reg_read(UC_X86_REG_RDX),n))
                emulator.reg_write(UC_X86_REG_RAX,((a>b)-(a<b))&0xffffffffffffffff)
            uc.hook_add(UC_HOOK_CODE,comparator)
            uc.mem_write(0x20fff8,struct.pack('<Q',0x600000));uc.reg_write(UC_X86_REG_RSP,0x20fff8)
            uc.reg_write(UC_X86_REG_RCX,rows);uc.reg_write(UC_X86_REG_RDX,rows+72)
            uc.emu_start(0x140230ff0,0x600000,count=2000)
            order=[struct.unpack('<I',uc.mem_read(rows+i*72+68,4))[0] for i in range(2)]
            orders.append(dict(first=first,second=second,first_mtime=first_time,second_mtime=second_time,order=order))
    (OUT/'native-list-fixtures.json').write_text(portable_json(dict(target_sha256=SHA,
        method='Original extension fragment; original two-record insertion with explicit memory and memcmp byte-comparison seam.',
        extensions=extensions,ordering=orders),indent=2)+'\n')
    print(f'Executed {len(extensions)} extension and {len(orders)} ordering cases.')


if __name__=='__main__':main()
