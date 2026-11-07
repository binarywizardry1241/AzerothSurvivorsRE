#!/usr/bin/env python3
"""Verify retained current jewelry native evidence, or prepare its Ghidra inputs.

Default is read-only. --prepare-rea writes bounded source-code slices and static
REA plans under runtime/analysis/history/native-recovery/jewelry/2686e0c0745b. It never copies or executes the EXE.
"""
from script_sources import load_script
import argparse
import hashlib
import json

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
EVIDENCE = ROOT / 'docs/analysis/evidence/jewelry'
WORK = ROOT / 'runtime/analysis/history/native-recovery/jewelry/2686e0c0745b'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prepare-rea', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    assert manifest['target']['sha256'] == SHA
    module = load_script('jewelry_evidence_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    for row in manifest['ranges'] + manifest['ghidra_observations']:
        a, b = int(row['address'], 16), int(row['end_exclusive'], 16)
        at = pe.rva_offset(a - pe.image_base)
        assert hashlib.sha256(data[at:at + b - a]).hexdigest() == row['sha256'], row['role']
        for key in ['assembly', 'pseudocode']:
            if key in row:
                assert hashlib.sha256((EVIDENCE / row[key]).read_bytes()).hexdigest() == row[key + '_sha256']
    if args.prepare_rea:
        for role, start, end, entries in [
            ('jewelry', 0x14589e0e0, 0x14589ece4, [0x14589e0e0, 0x14589e760, 0x14589ec50]),
            ('codex-details', 0x14026fc40, 0x140273085, [0x14026fc40]),
            ('seen-producer', 0x14595ca60, 0x14595db15, [0x14595ca60]),
            ('seen-tick', 0x1458aee30, 0x1458b1f7d, [0x1458aee30]),
        ]:
            work = WORK / role
            work.mkdir(parents=True, exist_ok=True)
            at = pe.rva_offset(start - pe.image_base)
            (work / 'code.bin').write_bytes(data[at:at + end - start])
            (work / 'seeds.tsv').write_text(''.join(f'{a:#x}\tcode\n{a:#x}\tfunction\n' for a in entries))
            plan = dict(target=str((work / 'code.bin').relative_to(ROOT)),
                        output=str((work / 'rea').relative_to(ROOT)), init_timeout=60, timeout=240,
                        open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                        environment={'REA_GHIDRA_SEED_FILE': str((work / 'seeds.tsv').relative_to(ROOT))},
                        operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(a))) for a in entries])
            (work / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
        print('Prepared current hash-bound static REA plans under runtime/analysis/history/native-recovery/jewelry/2686e0c0745b')
    else:
        print('Checked 9 canonical native intervals and 5 fresh Ghidra owner observations; no compiler/game')


if __name__ == '__main__':
    main()
