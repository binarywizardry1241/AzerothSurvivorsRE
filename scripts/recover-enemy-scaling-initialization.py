#!/usr/bin/env python3
"""Retain 0.97.2 Game constructor spawn-field defaults and aggregate mapping.

Static hash-bound PE reads and focused REA/Ghidra provenance. Never launches the
game. Run generated raw-slice plans with scripts/rea-batch.py before extraction.
"""
from portable_paths import objdump_output, portable_json
from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import subprocess
from enemy_evidence import curated_native

ROOT=Path(__file__).resolve().parents[1]
TARGET=ROOT/'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
EXPECTED='a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
RUNTIME=ROOT/'runtime/enemies-0.97.2/scaling'
OUTPUT=ROOT/'docs/analysis/evidence/0.97.2/enemies'
FUNCTIONS=[('game-constructor',0x14549bb90,0x14549cefd),
           ('constructor-final-stat-refresh',0x1454950d0,0x14549617c)]
SPANS=[('constructor-output-argument',0x14549bb90,0x14549bc28),
       ('budget-credit-wave-and-previous-defaults',0x14549c4bf,0x14549c4df),
       ('elite-deadline-default',0x14549c504,0x14549c514),
       ('guardian-lair-suppression-zero-default',0x14549c5a1,0x14549c5ef),
       ('ordinary-suppression-zero-default',0x14549c84a,0x14549c854),
       ('game-aggregate-copy',0x14549cd2e,0x14549cd68)]


def main():
    data=TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest()==EXPECTED
    spec=importlib.util.spec_from_file_location('inventory',ROOT/'scripts/inventory-executable.py')
    inventory=importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe=inventory.PE(data)
    extents={pe.image_base+a:pe.image_base+b for a,b,_ in pe.functions()}
    def record(va,end):
        offset=pe.rva_offset(va-pe.image_base)
        raw=data[offset:offset+end-va]
        return {'va':hex(va),'end_exclusive':hex(end),'file_offset':hex(offset),
                'byte_count':end-va,'sha256':hashlib.sha256(raw).hexdigest()}
    functions=[]
    for name,start,end in FUNCTIONS:
        assert extents[start]==end
        functions.append({'role':name,'boundary':'original PE RUNTIME_FUNCTION',**record(start,end)})
        offset=pe.rva_offset(start-pe.image_base)
        (RUNTIME/f'{start:x}.bin').write_bytes(data[offset:offset+end-start])
        plan={'target':f'runtime/enemies-0.97.2/scaling/{start:x}.bin',
              'output':f'runtime/enemies-0.97.2/scaling/rea-{start:x}',
              'open_options':{'format':'raw-binary','architecture':'x86_64','entry_point':hex(start)},
              'timeout':240,'open_timeout':90,
              'operations':[{'name':'analyze_function','arguments':{'procedure':hex(start)}}]}
        (RUNTIME/f'plan-{start:x}.json').write_text(portable_json(plan,indent=2)+'\n')
    spans=[]
    for name,start,end in SPANS:
        assembly=objdump_output(['objdump','-d','--no-show-raw-insn',f'--start-address={start:#x}',
            f'--stop-address={end:#x}',str(TARGET.relative_to(ROOT))],cwd=ROOT,text=True)
        path=OUTPUT/f'initialization-{name}.asm'
        path.write_text(assembly)
        spans.append({'label':name,**record(start,end),'assembly':path.name,
                      'assembly_sha256':hashlib.sha256(assembly.encode()).hexdigest()})
    constants=[]
    for va,size in [(0x1458f662c,4),(0x1469aa310,8)]:
        offset=pe.rva_offset(va-pe.image_base)
        raw=data[offset:offset+size]
        constants.append({**record(va,va+size),'hex':raw.hex(),
                          'f32_values':list(struct.unpack('<'+'f'*(size//4),raw))})
    thunk=0x145756ddd
    offset=pe.rva_offset(thunk-pe.image_base)
    assert data[offset:offset+2]==b'\xff\x25'
    iat=thunk+6+struct.unpack_from('<i',data,offset+2)[0]
    names=[(lib['library'],name) for lib in pe.imports()
           for index,name in enumerate(lib['functions']) if int(lib['iat_start_address'],16)+index*8==iat]
    assert len(names)==1 and names[0][1]=='memcpy'
    records=[]
    for _,start,end in FUNCTIONS:
        bundle=json.loads((RUNTIME/f'rea-{start:x}/evidence-bundle.json').read_text())
        for evidence in bundle['records']:
            if evidence['operation']=='analyze_function':
                assert evidence['parameters']['procedure']==hex(start)
                assert evidence['subject']['digest']['sha256']==record(start,end)['sha256']
                records.append(curated_native(evidence))
    fields=[('spawn_budget',0x90c,0x934,'f32',3.0,'14549c4bf..14549c4ce'),
            ('death_credit',0x910,0x938,'f32',0.0,'14549c4bf..14549c4ce; MOVSS memory source zeros high32 of low64 before MOVLPS'),
            ('pattern_deadline',0x914,0x93c,'f32',60.0,'14549c4ce..14549c4d8'),
            ('elite_deadline',0x924,0x94c,'f32',240.0,'14549c504..14549c514'),
            ('suppress_guardian_lair_respawn',0x958,0x980,'u8',0,'14549c5e5..14549c5ef zero store begins at stack97d'),
            ('suppress_ordinary_spawns',0x95b,0x983,'u8',0,'14549c84a..14549c854 store ff000000 at stack982 gives bytes00 00 00 ff'),
            ('previous_pattern',0x95e,0x986,'u8',255,'14549c4d8..14549c4df')]
    result={'date':'2026-10-18','version':'0.97.2','target':str(TARGET.relative_to(ROOT)),
            'target_sha256':EXPECTED,'target_executed':False,
            'aggregate_mapping':{'source':'RBP+0x28','output':'saved original RCX at RBP+0xa90',
                'copy_bytes':0x960,'copy_call':hex(0x14549cd63),
                'copy_thunk':{**record(thunk,thunk+6),'iat':hex(iat),'library':names[0][0],'symbol':names[0][1]},
                'field_rule':'Game+offset is stack RBP+(offset+0x28); equal stack/Game offsets are different fields'},
            'fields':[{'name':name,'game_offset':hex(go),'stack_rbp_offset':hex(so),'type':kind,
                       'value':value,'value_bits':struct.unpack('<I',struct.pack('<f',value))[0] if kind=='f32' else value,
                       'instruction_scope':scope} for name,go,so,kind,value,scope in fields],
            'functions':functions,'spans':spans,'constants':constants,'rea_records':records,
            'limitations':['These are recovered fresh-Game constructor values; subsequent state transitions are separate owning paths.',
                'The final stat refresh call was independently decompiled and inspected; no direct writes to the seven spawn fields were found.',
                'Static reconstruction does not establish application/runtime parity. No build or compiler-based test ran.']}
    path=OUTPUT/'initialization-native.json'
    path.write_text(portable_json(result,indent=2)+'\n')
    print('Retained seven constructor defaults, six focused spans and two REA records: '+str(path.relative_to(ROOT)))

if __name__=='__main__': main()
