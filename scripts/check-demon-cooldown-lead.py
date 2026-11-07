#!/usr/bin/env python3
"""Replay a bounded current demon-cooldown lead without compiling or launching.

The eight synthetic probes exercise only special1/special5. They do not recover
current descriptor tables, callers, aura producers or the complete demon clock.
Default mode reads retained evidence and writes nothing. --output may write a
fresh observation only beneath the project-local ignored runtime directory.
"""
from runtime_layout import retained_runtime_path
from native_recovery import f32 as _shared_f32
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes

SHA = 'e069bf3152f8d8f7160d66388907fc181c733bd170aa150d3b7ff7adf251e048'
EVIDENCE = ROOT/'docs/analysis/evidence/execheck-contract-leads.json'


def f32(value):
    return _shared_f32(value)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, help='optional observation under runtime/')
    args = parser.parse_args()
    output = None
    if args.output:
        output = (ROOT/args.output).resolve()
        if not output.is_relative_to(ROOT/'runtime'):
            raise ValueError('Observation output must remain under project runtime/')
    target = latest_target(verify=True)
    assert target['sha256'] == SHA
    data = target_bytes(target)
    evidence = json.loads(EVIDENCE.read_text())
    assert evidence['target']['sha256'] == SHA
    lead = evidence['demon_cooldown']
    for row in lead['source_witnesses']:
        assert hashlib.sha256((retained_runtime_path(ROOT/row['path'], ROOT)).read_bytes()).hexdigest() == row['sha256'], row['path']
    sys.path[:0] = [str(ROOT/'runtime/tool-state/python/armory/python-libs'),
                   str(ROOT/'runtime/tool-state/python/camera/python-libs')]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as r
    module = load_script('pe_inventory', ROOT/'scripts/inventory-executable.py')
    pe = module.PE(data)
    manifest = json.loads((ROOT/lead['canonical_manifest']).read_text())
    assert manifest['target_sha256'] == SHA
    native = next(row for row in manifest['ranges'] if row['role'] == 'cooldown')
    assert native == lead['native_range']
    start = int(native['va'], 16)
    finish = start+native['byte_count']
    offset = pe.rva_offset(start-pe.image_base)
    assert offset == int(native['file_offset'], 16)
    assert hashlib.sha256(data[offset:offset+native['byte_count']]).hexdigest() == native['sha256']
    assert hashlib.sha256((ROOT/lead['canonical_assembly']).read_bytes()).hexdigest() == lead['canonical_assembly_sha256']
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    image_end = max(s['rva']+max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    machine.mem_map(pe.image_base, (image_end+4095)&~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base+section['rva'],
                          data[section['raw_offset']:section['raw_offset']+section['raw_size']])
    memory, stack, stop = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(memory, 0x10000)
    machine.mem_map(stack, 0x10000)
    machine.mem_map(stop, 4096)

    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack('<'+fmt, *values))

    executed = set()

    def hook(_, address, size, unused):
        assert start <= address < finish or address == stop, hex(address)
        executed.add(address)

    machine.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for special, period in [(1, 2.0), (5, 2.5)]:
        for cooldown in [1.0, 0.5, 0.1, 0.0]:
            machine.mem_write(memory, bytes(0x10000))
            game, pet, definition = memory, memory+0x2000, memory+0x3000
            put(game+0xd0, '2Q', pet, 1)
            put(game+0x490, 'f', cooldown)
            put(pet+0x18, 'Q', definition)
            put(definition+0x30, 'f', period)
            put(definition+0x39, 'B', special)
            put(stack+0x8008, 'Q', stop)
            machine.reg_write(r.UC_X86_REG_RSP, stack+0x8008)
            machine.reg_write(r.UC_X86_REG_RCX, game)
            machine.reg_write(r.UC_X86_REG_RDX, 0)
            machine.emu_start(start, stop, count=1000)
            assert machine.reg_read(r.UC_X86_REG_RIP) == stop
            actual = struct.unpack('<f', (machine.reg_read(r.UC_X86_REG_XMM0)&0xffffffff).to_bytes(4, 'little'))[0]
            assert actual == max(f32(period*f32(cooldown)), 0.5)
            # Independent transcription of inspected retained source, with no
            # active aura10 and no selected target. This does not execute Rust.
            bonus = max(f32(1.0-f32(cooldown)), 0.0) if special == 5 else 0.0
            source = f32(period/f32(1.0+bonus))
            cases.append(dict(synthetic_special=special, synthetic_period=period,
                              current_cooldown=f32(cooldown), native_seconds=actual,
                              retained_source_scalar_formula_seconds=source,
                              source_haste_input=0.0, source_target='none'))
    assert cases == lead['cases']
    assert len(executed) == lead['instruction_address_count']
    record = dict(target_version=target['version'], target_sha256=SHA,
                  native_range=native, cases=cases, instruction_address_count=len(executed),
                  target_process_launched=False, compilation='not_run', parity='unverified')
    if output:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(record, indent=2)+'\n')
    print('Eight current demon cooldown helper probes pass; existing #24 source-formula mismatch remains.')


if __name__ == '__main__':
    main()
