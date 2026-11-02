#!/usr/bin/env python3
"""Stage a selected-target bounded Ghidra volley query; do not start REA."""
import hashlib
import importlib.util
import json
import struct
from coverage_common import ROOT, latest_target, target_bytes


def main():
    target = latest_target(verify=True)
    assert target['sha256'] == 'dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b'
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location('volley_rea_pe', ROOT / 'scripts/inventory-executable.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)
    start, end = 0x145950BF0, 0x145956052
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    assert bounds[start] == end
    table = 0x1471F2B2C
    entry = table + struct.unpack_from('<i', data, pe.rva_offset(table - pe.image_base) + 4)[0]
    assert entry == 0x145950FF8
    offset = pe.rva_offset(start - pe.image_base)
    raw = data[offset:offset + end - start]
    output = ROOT / 'runtime/boss-volleys-0.108.0/rea-preparation'
    output.mkdir(parents=True, exist_ok=True)
    (output / 'dispatch.bin').write_bytes(raw)
    (output / 'seed.tsv').write_text(f'{entry:#x}\tfunction\n{entry:#x}\tcode\n')
    plan = dict(target=str((output / 'dispatch.bin').relative_to(ROOT)),
                output=str((output / 'dispatch').relative_to(ROOT)), init_timeout=60, timeout=240,
                environment={'REA_GHIDRA_DISABLED_ANALYZERS': 'Stack,Decompiler Switch Analysis,Function ID,Function Start Search,Disassemble Entry Points,Subroutine References,Data Reference,Reference,Non-Returning Functions - Discovered,Shared Return Calls,Create Address Tables',
                             'REA_GHIDRA_SEED_FILE': str((output / 'seed.tsv').relative_to(ROOT))},
                open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(entry)))])
    (output / 'plan.json').write_text(json.dumps(plan, indent=2) + '\n')
    (output / 'input.json').write_text(json.dumps(dict(target_sha256=target['sha256'],
        va=hex(start), end_exclusive=hex(end), byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest(),
        limits='Original-VA raw import; seeded branch is an analyst assertion. External data, calls and Win64 register conventions require instruction review.'), indent=2) + '\n')
    print((output / 'plan.json').relative_to(ROOT))


if __name__ == '__main__':
    main()
