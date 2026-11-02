#!/usr/bin/env python3
"""Retain selected target/menu consumers and completed REA results as source-bound text.

Does not execute the target. Derived binaries and transient sessions remain local.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
from pathlib import Path
import hashlib
import json
import subprocess
import struct

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.100.1.exe'
SHA = '17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b'
PROCEDURES = {
    'save-parse': (0x145430740, 'runtime/save-specs-01001/ghidra-core/003-145430740.json'),
    'ordinary-write': (0x1454356a0, 'runtime/save-specs-01001/consolidation/rea-normalize/003-procedure_pseudo_code.json'),
    'hourly-backup': (0x145469450, 'runtime/save-specs-01001/consolidation/rea-hourly/003-procedure_pseudo_code.json'),
    'backup-name-filter': (0x14546a1f0, None),
    'backup-path-order': (0x145502f00, None),
    'talent-budget': (0x14542f490, None),
    'talent-can-learn': (0x145483ba0, None),
    'talent-exclusive': (0x1454834e0, None),
    'talent-previous-rows': (0x145483d70, None),
    'talent-normalize': (0x145483fc0, 'runtime/target-menu-consolidation/rea-talent-normalize/003-procedure_pseudo_code.json'),
    'talent-collector': (0x14553b8e0, None),
    'talent-comparator': (0x145507670, None),
    'talent-refund': (0x145483720, None),
    'spec-view': (0x14542e5c0, None),
    'spec-switch': (0x14542e9f0, None),
    'spec-allocation-edit': (0x145439e60, None),
    'spec-cards': (0x140165440, 'runtime/target-menu-consolidation/rea-spec-panel/003-procedure_pseudo_code.json'),
    'saves-page': (0x140279c80, 'runtime/target-menu-consolidation/rea-saves-page/003-procedure_pseudo_code.json'),
    'font-augment': (0x1455181d0, 'runtime/target-menu-consolidation/rea-font-augment/003-procedure_pseudo_code.json'),
    'gear-reader': (0x14546f110, 'runtime/target-menu-consolidation/rea-gear-reader/003-procedure_pseudo_code.json'),
    'armor-effect-scaling': (0x14554c7c0, 'runtime/target-menu-consolidation/rea-armor-scaling/003-procedure_pseudo_code.json'),
    'weapon-effect-scaling': (0x14554ca00, None),
    'extra-effect-scaling': (0x14554cc40, None),
    'late-enemy-health': (0x1454d4130, None),
    'store-level-controls': (0x140062560, None),
    'hud-constructor': (0x140105220, 'runtime/target-menu-consolidation/rea-levelup-constructor/003-procedure_pseudo_code.json'),
    'hud-flags': (0x140363920, 'runtime/target-menu-consolidation/rea-stored-hud-flags/003-procedure_pseudo_code.json'),
    'stored-hud-update': (0x1400909d0, 'runtime/target-menu-consolidation/rea-hud-live-update/003-procedure_pseudo_code.json'),
    'stored-button-gradient': (0x1400b68f0, None),
    'hud-root': (0x140082d40, None),
    'save-serialize': (0x145436620, 'runtime/target-menu-consolidation/rea-save-serialize/003-procedure_pseudo_code.json'),
    'roster-result': (0x14544a260, None),
    'class-atlas-rectangle': (0x1400b7b00, None),
    'class-descriptor': (0x1454207d0, None),
    'roster-guid-allocation': (0x145439d50, None),
    'roster-login-consumer': (0x1454440d0, None),
    'menu-state-initialize': (0x14543edf0, None),
    'picker-input': (0x1400c44f0, 'runtime/target-menu-consolidation/rea-picker-input/003-procedure_pseudo_code.json'),
}


def main():
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    bounds = {pe.image_base + start: pe.image_base + end for start, end, *_ in pe.functions()}
    bounds.update({0x14542f490:0x14542f511,0x1400b7b00:0x1400b7cc8,0x1454207d0:0x1454207ef,0x145439d50:0x145439e5b})
    out = ROOT / 'runtime/native-evidence/0.100.1/target-menu'
    out.mkdir(parents=True, exist_ok=True)
    rows = []
    for label, (start, evidence_path) in PROCEDURES.items():
        end = bounds[start]
        offset = pe.rva_offset(start-pe.image_base)
        code = data[offset:offset+end-start]
        assembly = objdump_output(['objdump','-d','--no-show-raw-insn',
            f'--start-address={start:#x}',f'--stop-address={end:#x}',str(TARGET)],text=True,cwd=ROOT)
        (out / (label+'.asm')).write_text(assembly)
        row = dict(role=label, virtual_address=hex(start), end_exclusive=hex(end),
            file_offset=hex(offset), byte_count=len(code), sha256=hashlib.sha256(code).hexdigest(),
            disassembly=str((out/(label+'.asm')).relative_to(ROOT)))
        if evidence_path:
            response = json.loads((ROOT/evidence_path).read_text())['response']['result']
            record = response.get('structuredContent') or json.loads(response['content'][0]['text'])
            derived = Path(record['subject']['local_path']).read_bytes()
            assert hashlib.sha256(derived).hexdigest() == record['subject']['digest']['sha256']
            assert derived[:len(code)] == code
            assert data[offset:offset+len(derived)] == derived
            assert record['provider']['id'] == 'ghidra'
            text = record['normalized_result']
            if isinstance(text,dict): text=text.get('pseudocode')
            if text:
                # Preserve decompiler content while keeping curated text diff-clean.
                text = '\n'.join(line.rstrip() for line in text.splitlines()).rstrip() + '\n'
                (out/(label+'.ghidra.c')).write_text(text)
                row['rea_evidence_id'] = record['evidence_id']
                row['rea_subject_sha256'] = record['subject']['digest']['sha256']
                row['pseudocode'] = str((out/(label+'.ghidra.c')).relative_to(ROOT))
                row['rea_limits'] = record['limitations']
        rows.append(row)
    def span(va,size):
        off=pe.rva_offset(va-pe.image_base);raw=data[off:off+size]
        return dict(virtual_address=hex(va), file_offset=hex(off),byte_count=size,
            bytes_hex=raw.hex(),sha256=hashlib.sha256(raw).hexdigest())
    boss=[]
    # Five current Naxx records, identified by their exact ID and native zone table.
    for index in range(12):
        zone=0x146733518+index*240
        off=pe.rva_offset(zone+8-pe.image_base);ptr,length=struct.unpack_from('<QQ',data,off)
        key=data[pe.rva_offset(ptr-pe.image_base):pe.rva_offset(ptr-pe.image_base)+length].decode()
        if key != 'naxx':continue
        ptr,count=struct.unpack_from('<QQ',data,pe.rva_offset(zone+0x88-pe.image_base))
        assert count==5
        boss=[span(ptr+88*j,88) for j in range(count)]
    # Only the constructor's actual R8+8 Node arguments are retained; other
    # linear-evaluator candidates are not treated as recovered Nodes.
    snapshots = json.loads((ROOT/'runtime/target-menu-consolidation/hud-node-stores.json').read_text())[0]['snapshots']
    calls = {'0x140106a9b','0x140106f4a','0x1401072a3','0x1401077ae','0x140107b36'}
    hud_nodes = [row for row in snapshots if row['argument']=='R8+8' and row['call'].split()[0] in calls]
    (out/'hud-layout.json').write_text(portable_json(dict(target_sha256=SHA,
        constructor='0x140105220',nodes=hud_nodes,
        method='Matching Bevy0.18.1 Node offsets; original-PE literal stores and selected typed bundle argument. Branch-linear snapshots corroborated against owning instruction blocks.',
        literals=[span(0x14593fa30,100),span(0x1459158b8,100),span(0x145916b4c,60),span(0x14593d088,20),span(0x145940cb5,68)],
        limitations=['Exact stores and layout are static evidence; CUA original/rebuilt comparison is owned by the root task.']),indent=2)+'\n')
    manifest=dict(date='2026-10-19',target=str(TARGET.relative_to(ROOT)),sha256=SHA,
        methods=['Exact selected-PE RUNTIME_FUNCTION bounds and source bytes.',
            'Completed ./scripts/rea Ghidra sessions reused, with raw-slice identities retained.',
            'Original-PE assembly binds external constants and jump-table destinations.'],
        procedures=rows,naxx_boss_records=boss,store_levels_option=span(0x145955630,152),
        spec_colors=[span(0x145940688,20),span(0x145940a00,20),span(0x145940550,16)],
        limitations=['Static evidence does not establish original/rebuilt runtime parity.',
            'Raw x86_64 Ghidra import uses generic GCC ABI; Windows register arguments require original assembly corroboration.',
            'The parse evidence covers the larger contiguous save slice and its complete input hash; individual owner bytes are separately bound here.',
            'Analysis sessions and binary assets remain ignored local files; source builds do not require this executable.'])
    (out/'manifest.json').write_text(portable_json(manifest,indent=2)+'\n')
    print(f'Retained {len(rows)} current target/menu owners')

if __name__=='__main__': main()
