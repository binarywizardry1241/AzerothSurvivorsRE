#!/usr/bin/env python3
"""Check the custom AddOns inventory's current client-locale snapshot, without a build/game.

The unchanged wrapper executes with explicit Chain/inventory/collector seams;
the collector records the actual locale argument. This does not execute the
TOC parser, filesystem, VM, sort implementation or in-game addon loader.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = '76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0'
START, END = 0x1411dde70, 0x1411ddf2d
WORK = ROOT / 'runtime/analysis/history/interface/menu-lifecycle/969b671942c0/1411dde70'
STAGED = ROOT / 'runtime/analysis/staging/native-evidence/addons-metadata'
RETAINED = ROOT / 'docs/analysis/evidence/addons-metadata'


def encoded(value):
    return json.dumps(value, ensure_ascii=False, indent=2) + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--collect', action='store_true')
    mode.add_argument('--check', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=False)
    assert target['version'] == '0.109.0' and target['sha256'] == SHA
    data = target_bytes(target)
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)
    offset = pe.rva_offset(START - pe.image_base)
    native_hash = hashlib.sha256(data[offset:offset + END - START]).hexdigest()
    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
    machine.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section['rva'], data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(heap, 0x10000)
    machine.mem_map(stack, 0x10000)
    machine.mem_map(done, 4096)
    current, observed = None, []

    def q(address):
        return struct.unpack('<Q', machine.mem_read(address, 8))[0]

    def put(address, *values):
        machine.mem_write(address, struct.pack('<' + 'Q' * len(values), *values))

    def ret(value=None):
        if value is not None:
            machine.reg_write(r.UC_X86_REG_RAX, value)
        sp = machine.reg_read(r.UC_X86_REG_RSP)
        machine.reg_write(r.UC_X86_REG_RIP, q(sp))
        machine.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(_, pc, size, __):
        if pc == done:
            machine.emu_stop()
        elif pc == 0x1411dcd60:
            ret(heap + 0x100 if current is not None else 0)
        elif pc == 0x1411ddf50:
            put(machine.reg_read(r.UC_X86_REG_RCX), 0, 8, 0)
            ret()
        elif pc == 0x14060ed20:
            iterator = machine.reg_read(r.UC_X86_REG_RDX)
            observed.append(q(q(iterator + 32)))
            put(machine.reg_read(r.UC_X86_REG_RCX), 0, 8, 0)
            ret()
        elif not START <= pc < END:
            raise AssertionError(f'Unreviewed native AddOns instruction/callee {pc:#x}')

    machine.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for current in [None, 0, 1, 2, 3, 4, 5, 6, 7, 255]:
        observed = []
        if current is not None:
            machine.mem_write(heap + 0x11c, bytes([current]))
        sp = stack + 0x8000 - 8
        put(sp, done)
        machine.reg_write(r.UC_X86_REG_RSP, sp)
        machine.reg_write(r.UC_X86_REG_RCX, heap + 0x200)
        machine.emu_start(START, done, count=1000)
        assert machine.reg_read(r.UC_X86_REG_RIP) == done
        assert observed == [current if current is not None else 0]
        cases.append(dict(chain_locale=current, metadata_locale=observed[0]))
    source = (ROOT / 'crates/azeroth-survivors-re/src/addons.rs').read_text()
    bridge = (ROOT / 'crates/benilla-app/src/local_client.rs').read_text()
    assert 'Self::load_for_locale(home, benilla_app::local_client::client_locale_index())' in source
    assert '.metadata_value(&name, "Title", locale)' in source
    assert '.metadata_value(&name, "Notes", locale)' in source
    assert 'pub fn client_locale_index() -> usize' in bridge
    assert 'crate::ui_script::client_locale().index()' in bridge
    contracts = dict(target_sha256=SHA, start=hex(START), end_exclusive=hex(END),
                     byte_count=END - START, native_sha256=native_hash, native_cases=cases)
    if args.check:
        manifest = json.loads((RETAINED / 'manifest.json').read_text())
        assert manifest['contracts'] == contracts
        assert hashlib.sha256((RETAINED / 'inventory-locale.asm').read_bytes()).hexdigest() == manifest['assembly_sha256']
        print('Verified 10 current native locale snapshot/forwarding cases and live client/TOC consumers; no compilation/game')
        return
    STAGED.mkdir(parents=True, exist_ok=True)
    assembly = ('\n'.join(line.rstrip() for line in (WORK / 'native.asm').read_text().splitlines()) + '\n').encode()
    value = json.loads((WORK / 'rea/003-procedure_pseudo_code.json').read_text())['response']['result']['structuredContent']
    manifest = dict(contracts=contracts, assembly_sha256=hashlib.sha256(assembly).hexdigest(),
                    evidence_id=value['evidence_id'], analysis_profile_digest=value['analysis_profile']['digest'],
                    limits=['Unchanged wrapper only. The Chain pointer, empty raw inventory and collector are explicit host seams.',
                            'Current source uses the same client locale as real FrameXML; custom-menu language is a separate resource.',
                            'TOC parsing, sorting, account writing, shared-engine dependency/load policy, compilation and rendered/runtime parity do not execute in this check.'])
    (STAGED / 'manifest.json').write_text(encoded(manifest))
    (STAGED / 'inventory-locale.asm').write_bytes(assembly)
    print('Staged current AddOns metadata evidence:', STAGED.relative_to(ROOT))


if __name__ == '__main__':
    main()
