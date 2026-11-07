#!/usr/bin/env python3
"""Current SHA-bound totem passive recovery. Static extraction only."""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parent.parent
TARGET = ROOT / 'AzerothSurvivors/AzerothSurvivors-0.97.2.exe'
SHA = 'a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589'
RUNTIME = ROOT / 'runtime/analysis/history/native-recovery/player-totem-passives/a1ae05a395c3'
EVIDENCE = ROOT / 'docs/analysis/evidence/player-totem-passives'
FUNCTIONS = [0x1454d43d0, 0x1454d49e0, 0x1455321e0]
RANGES = [(0x1454a422c, 0x1454a46a0, 'call-of-flame-expiry'),
          (0x1454a46c0, 0x1454a4c10, 'prepulse-heal'),
          (0x14549f01c, 0x14549f02a, 'maximum-health-pointer')]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--collect', action='store_true')
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    functions = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
    RUNTIME.mkdir(parents=True, exist_ok=True)

    def span(start, end):
        at = pe.rva_offset(start - pe.image_base)
        raw = data[at:at + end - start]
        assert len(raw) == end - start
        return dict(address=hex(start), end_exclusive=hex(end), file_offset=hex(at),
                    size=len(raw), sha256=hashlib.sha256(raw).hexdigest())

    analyses = []
    for address in FUNCTIONS:
        end = functions[address]
        native = span(address, end)
        at = pe.rva_offset(address - pe.image_base)
        target = RUNTIME / f'{address:x}.bin'
        target.write_bytes(data[at:at + end - address])
        plan = dict(target=str(target.relative_to(ROOT)),
                    output=f'runtime/analysis/history/native-recovery/player-totem-passives/a1ae05a395c3/rea-{address:x}',
                    open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(address)),
                    timeout=180, open_timeout=90, cleanup_timeout=60,
                    environment={'REA_GHIDRA_STARTUP_TIMEOUT_MS': '180000'},
                    operations=[dict(name='analyze_function', arguments=dict(procedure=hex(address)), timeout=240)])
        (RUNTIME / f'plan-{address:x}.json').write_text(portable_json(plan, indent=2) + '\n')
        if args.collect:
            EVIDENCE.mkdir(parents=True, exist_ok=True)
            bundle = json.loads((RUNTIME / f'rea-{address:x}/evidence-bundle.json').read_text())
            record = next(row for row in bundle['records'] if row.get('operation') == 'analyze_function')
            assert record['subject']['digest']['sha256'] == native['sha256']
            assert record['provider']['id'] == 'ghidra'
            code = record['normalized_result']['pseudocode']
            assert code
            (EVIDENCE / f'{address:x}.ghidra.c').write_text(code)
            assembly = objdump_output(['objdump', '-d', f'--start-address={address}',
                                               f'--stop-address={end}', str(TARGET)], cwd=ROOT, text=True)
            (EVIDENCE / f'{address:x}.asm').write_text(assembly)
            analyses.append(dict(native=native, boundary='PE RUNTIME_FUNCTION',
                                 rea_evidence_id=record['evidence_id'], provider=record['provider'],
                                 pseudocode=f'{address:x}.ghidra.c', assembly=f'{address:x}.asm'))
    if args.collect:
        ranges = []
        for start, end, name in RANGES:
            assembly = objdump_output(['objdump', '-d', f'--start-address={start}',
                                               f'--stop-address={end}', str(TARGET)], cwd=ROOT, text=True)
            (EVIDENCE / f'{name}.asm').write_text(assembly)
            ranges.append(dict(native=span(start, end), owner='0x14549d550', assembly=f'{name}.asm',
                               reused_ghidra_evidence_id='ev_c5c9cc29e1e6e39c77e71ac55fc8abbce607fd9cb931b6b010eee7b8f4720299',
                               reused_manifest='../player-abilities/behavior-native.json'))
        scalars = {}
        for address in [0x1459eb2d0, 0x1458eb480, 0x1458f667c, 0x1458f8d40,
                        0x1458ed010, 0x1458f6620, 0x145bfc414, 0x14698ebd0,
                        0x1458f8de0, 0x1459eb3c0, 0x1458eb51c, 0x145930f10]:
            at = pe.rva_offset(address - pe.image_base)
            scalars[hex(address)] = dict(native=span(address, address + 4),
                                         raw_hex=data[at:at+4].hex(), bits=hex(struct.unpack_from('<I', data, at)[0]),
                                         float_value=str(struct.unpack_from('<f', data, at)[0]))
        strings = []
        for address, size in [(0x14671d78c, 10), (0x14671d796, 11),
                              (0x1469aafd0, 5), (0x1469aafd5, 24)]:
            at = pe.rva_offset(address - pe.image_base)
            strings.append(dict(native=span(address, address + size),
                                text=data[at:at + size].decode('ascii')))
        result = dict(version='0.97.2', target=dict(path=str(TARGET.relative_to(ROOT)), sha256=SHA),
                      method='Unchanged current native slices through REA/Ghidra and original PE disassembly/data.',
                      analyses=analyses, ranges=ranges, scalars=scalars, strings=strings,
                      limitations=['Raw Ghidra signature inference is generic x64; original Win64 registers/stack bind arguments.',
                                   'Static source reconstruction only; no compiler checks, tests, emulation or application launches.'])
        (EVIDENCE / 'native.json').write_text(portable_json(result, indent=2) + '\n')
        print('Collected totem passive native evidence.')
    else:
        print('Prepared three exact current function slices and REA plans.')


if __name__ == '__main__':
    main()
