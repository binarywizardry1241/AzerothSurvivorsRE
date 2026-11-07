#!/usr/bin/env python3
"""Check current player-form selection in unchanged native instructions.

No compilation or application execution. Registers and effect rows are explicit
inputs; execution stops before the normal-body fallback or descriptor insertion.
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
sys.path.insert(0, str(ROOT / 'scripts'))
from coverage_common import latest_target

WORK = ROOT / 'runtime/analysis/history/co-op/forms/bdf1935e7cdb'
RETAINED = ROOT / 'docs/analysis/evidence/permanent-forms'
SPANS = [('selector', 0x1458F5F7D, 0x1458F6026),
         ('bear', 0x1458F6C6A, 0x1458F6C8E),
         ('current-display-store', 0x1458F6026, 0x1458F60C3),
         ('native-display-store', 0x1458F60C3, 0x1458F6193)]
SHA = '8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'newest target requires fresh recovery'
    data = (ROOT / target['path']).read_bytes()
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section['rva'], data[
            section['raw_offset']:section['raw_offset'] + section['raw_size']])
    heap = 0x200000000
    u.mem_map(heap, 0x10000)
    def stop(machine, address, size, unused):
        if address in (0x1458F5FF0, 0x1458F6026):
            machine.emu_stop()
    u.hook_add(UC_HOOK_CODE, stop)
    examples = [[], [(25, 15473)], [(24, 768)], [(25, 768)], [(25, 9634)],
                [(25, 15473), (25, 768)], [(25, 768), (25, 9634)],
                [(25, 9634), (25, 768)], [(0, 9634), (25, 1), (25, 9634)]]
    cases = []
    for race in (1, 4, 6, 8):
        for rows in examples:
            u.mem_write(heap, bytes(0x10000))
            u.mem_write(heap + 0x7a8, struct.pack('<QQ', heap + 0x2000, len(rows)))
            for i, (tag, spell) in enumerate(rows):
                u.mem_write(heap + 0x2000 + i * 64, struct.pack('<B3xI', tag, spell))
            u.reg_write(r.UC_X86_REG_RDI, heap)
            u.reg_write(r.UC_X86_REG_R15, race)
            u.emu_start(0x1458F5F7D, 0x1458F6C8E, count=1000)
            rip = u.reg_read(r.UC_X86_REG_RIP)
            assert rip in (0x1458F5FF0, 0x1458F6026)
            actual = u.reg_read(r.UC_X86_REG_R8) & 0xffffffff if rip == 0x1458F6026 else None
            spell = next((spell for tag, spell in rows if tag == 25 and spell in (768, 9634)), None)
            expected = ({768: 8571, 9634: 2289} if race == 6 else {768: 892, 9634: 2281}).get(spell)
            assert actual == expected, (race, rows, actual, expected)
            cases.append(dict(race=race, rows=rows, display=actual))
    result = dict(target_sha256=SHA, cases=cases,
                  limitations=['Unchanged native selector only; supplied effect rows and race registers.',
                               'Stops before body fallback or descriptor-map insertion; no external callees.',
                               'Does not execute Rust, MPQ model loading, GPU presentation or a game.'])
    destination = RETAINED if args.check else WORK / 'curated'
    destination.mkdir(parents=True, exist_ok=True)
    if args.check:
        assert portable_record(json.loads((destination / 'vectors.json').read_text())) == portable_record(json.loads(json.dumps(result)))
        manifest = json.loads((destination / 'manifest.json').read_text())
        assert manifest['target_sha256'] == SHA
        for row in manifest['ranges']:
            off = int(row['file_offset'], 16)
            raw = data[off:off + row['byte_count']]
            assert hashlib.sha256(raw).hexdigest() == row['sha256']
            assert hashlib.sha256((destination / row['assembly']).read_bytes()).hexdigest() == row['assembly_sha256']
        source = (ROOT / 'crates/azeroth-survivors-re/src/run_effects/forms.rs').read_text()
        assert 'row.tag() != 25' in source and 'find_map' in source
        for constant in (9634, 2289, 2281, 768, 8571, 892):
            assert str(constant) in source
        bridge = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/client.rs').read_text()
        assert 'game.player_form_display().unwrap_or(display_id)' in bridge
        assert 'fields: ObjectFields::from_pairs(&[(131, current_display)])' in bridge
        assert 'state.player_display = None' in bridge
    else:
        (destination / 'vectors.json').write_text(portable_json(result, indent=2) + '\n')
        ranges = []
        for role, start, end in SPANS:
            off = pe.rva_offset(start - pe.image_base)
            assembly = objdump_output(['objdump', '-d', '--no-show-raw-insn',
                f'--start-address={start:#x}', f'--stop-address={end:#x}', target['path']], cwd=ROOT, text=True)
            path = destination / (role + '.asm')
            path.write_text(assembly)
            ranges.append(dict(role=role, start=hex(start), end_exclusive=hex(end),
                file_offset=hex(off), byte_count=end-start, sha256=hashlib.sha256(data[off:off+end-start]).hexdigest(),
                assembly=path.name, assembly_sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
        raw = json.loads((WORK / 'rea-player-refresh/003-procedure_pseudo_code.json').read_text())
        evidence = json.loads(raw['response']['result']['content'][0]['text'])
        manifest = dict(target=target['path'], target_sha256=SHA, parent='0x1458f52e0',
            rea_evidence_id=evidence['evidence_id'], raw_import_sha256=evidence['subject']['digest']['sha256'],
            ranges=ranges, limitations=['Ghidra raw slice has generic ABI and no external data/callee types.',
                'Original-PE assembly establishes field131 current form and field132 ordinary body.',
                'Existing full balance-catalog check owns the selected permanent talent payloads.'])
        (destination / 'manifest.json').write_text(portable_json(manifest, indent=2) + '\n')
    print(f'Permanent forms: {len(cases)} selected native cases passed; source compilation/rendering unverified')


if __name__ == '__main__':
    main()
