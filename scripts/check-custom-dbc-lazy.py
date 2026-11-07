#!/usr/bin/env python3
"""Replay selected DBC retry/publication instructions; no compilation or game.

Uses canonical loader extracts plus the selected Once/closure extracts. DBC
files, MPQ open/read, producers, allocation/drop and OS wait/wake are seams.
Thread interleavings are controlled and do not validate platform scheduling.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target

EVIDENCE = ROOT / 'docs/analysis/evidence/0.105.0/custom-dbc'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--record', action='store_true')
    args = parser.parse_args()
    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / 'lazy-cache.json').read_text())
    loaders = json.loads((EVIDENCE / manifest['canonical_loaders']).read_text())
    assert target['sha256'] == manifest['target_sha256'] == loaders['target_sha256']
    data = (ROOT / target['path']).read_bytes()
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    imports = {int(row['iat_start_address'], 16) + index * 8: (row['library'], name)
               for row in pe.imports() for index, name in enumerate(row['functions'])}
    for row in manifest['imports']:
        assert imports[int(row['address'], 16)] == (row['library'], row['function'])
    ranges = []
    for row in manifest['ranges'] + loaders['ranges'][:2]:
        address = int(row['virtual_address'], 16)
        assert hashlib.sha256(raw(address, row['byte_count'])).hexdigest() == row['sha256']
        for kind in ('assembly', 'pseudocode'):
            assert hashlib.sha256((EVIDENCE / row[kind]).read_bytes()).hexdigest() == row[kind + '_sha256']
        ranges.append((address, address + row['byte_count']))
    for row in manifest['tables']:
        assert raw(int(row['address'], 16), row['byte_count']).hex() == row['bytes_hex']

    sys.path.insert(0, str(ROOT / 'runtime/tool-state/python/armory/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(section['rva'] + section['raw_size'] for section in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        off, count = section['raw_offset'], section['raw_size']
        machine.mem_write(pe.image_base + section['rva'], data[off:off + count])
    scratch, size = 0x200000000, 0x20000
    machine.mem_map(scratch, size)
    stop, wait, wake, error = scratch + 0x10, scratch + 0x20, scratch + 0x30, scratch + 0x40
    context, seams = {}, set()
    vectors = []

    def read(name): return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    def write(name, value): machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    def word(address): return struct.unpack('<Q', machine.mem_read(address, 8))[0]
    def put(address, value): machine.mem_write(address, struct.pack('<Q', value & ((1 << 64) - 1)))
    def state(address): return struct.unpack('<I', machine.mem_read(address, 4))[0]
    def set_state(address, value): machine.mem_write(address, struct.pack('<I', value))
    def ret():
        sp = read('RSP'); write('RIP', word(sp)); write('RSP', sp + 8)

    def hook(_, address, count, unused):
        if address == stop:
            machine.emu_stop(); return
        if address == context.get('race_site'):
            # Another builder finished after this builder loaded its dictionary.
            set_state(context['state'], 0)
            machine.mem_write(context['cache'], context['winner'])
        if address == wait:
            seams.add('OS WaitOnAddress')
            assert state(read('RCX')) == 5
            context['waits'] += 1
            # The competing publisher completes and wakes this deterministic waiter.
            machine.mem_write(context['cache'], context['winner'])
            set_state(read('RCX'), 0)
            write('RAX', 1); ret(); return
        if address == wake:
            seams.add('OS WakeByAddressAll'); context['wakes'] += 1; ret(); return
        if address == error:
            raise AssertionError('OS wait failure must not occur in these vectors')
        if address in (0x145A36150, 0x145AA6BF0, 0x145AA7F80, 0x145B6C710,
                       0x1400021D0, 0x143D98020, 0x1458BC2E0, 0x1458B9140,
                       0x1459B2E30, 0x1459AD750, 0x1405D2CC0, 0x145D4CF00):
            seams.add(hex(address))
            if address == 0x145A36150:
                put(read('RCX'), -1)  # No configured override; native default path.
            elif address == 0x145AA6BF0:
                context['opens'] += 1
                machine.mem_write(read('RCX'), struct.pack('<4Q', *(
                    (-1 & ((1 << 64) - 1), 0, 0, 0) if context['mode'] == 'chain-failure' else (0, 1, 0, 0))))
            elif address == 0x145AA7F80:
                context['reads'] += 1
                path = bytes(machine.mem_read(read('R8'), read('R9'))).decode()
                context['paths'].append(path)
                failed = context['mode'] == 'read-failure'
                body = b'bad' if context['mode'] == 'header-failure' else b'WDBC' + struct.pack('<4I', 0, 0, 0, 0)
                buffer = scratch + 0x1000 + context['reads'] * 0x100
                machine.mem_write(buffer, body)
                machine.mem_write(read('RCX'), struct.pack('<3Q', *(
                    (-1 & ((1 << 64) - 1), 0, 0) if failed else (0, buffer, len(body)))))
            elif address == 0x143D98020:
                write('RAX', scratch + 0x5000)
            elif address == 0x1458BC2E0:
                machine.mem_write(read('RCX'), struct.pack('<3Q', 0, scratch + 0x4000, 0))
            elif address in (0x1458B9140, 0x1459B2E30, 0x1459AD750):
                output = read({0x1458B9140: 'RCX', 0x1459B2E30: 'RDX', 0x1459AD750: 'R8'}[address])
                machine.mem_write(output, context['payload'])
            elif address == 0x145D4CF00:
                write('RAX', scratch + 0x6000)
            ret(); return
        assert any(lo <= address and address + count <= hi for lo, hi in ranges), hex(address)
        assert bytes(machine.mem_read(address, count)) == raw(address, count)

    def on_write(_, access, address, count, value, unused):
        assert (scratch <= address and address + count <= scratch + size or
                0x1480045D0 <= address and address + count <= 0x14800463C), hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)
    machine.hook_add(UC_HOOK_MEM_WRITE, on_write)

    def reset(kind, value=3):
        cache = 0x148004608 if kind == 'spell' else 0x1480045D0
        flag = cache + 0x30
        machine.mem_write(scratch, bytes(size))
        machine.mem_write(cache, bytes(0x30)); set_state(flag, value)
        for at in (stop, wait, wake, error): machine.mem_write(at, b'\xcc')
        put(0x145D6A2D8, wait); put(0x145D6A2E0, wake); put(0x145D6A8F0, error)
        machine.mem_write(scratch + 0x3000, b'\xff' * 16)
        payload = struct.pack('<6Q', scratch + 0x3000, 0, 0, 0, 100, 200)
        winner = struct.pack('<6Q', scratch + 0x3000, 0, 0, 0, 333, 444)
        context.clear(); context.update(state=flag, cache=cache, payload=payload, winner=winner,
            opens=0, reads=0, paths=[], waits=0, wakes=0, mode='success', race_site=None)

    def run(address, rcx=9):
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15', 'RBP'):
            write(name, 0)
        write('RCX', rcx); write('RSP', scratch + 0x18008); put(read('RSP'), stop); write('EFLAGS', 2)
        machine.emu_start(address, 0, count=10000)
        assert read('RIP') == stop, hex(read('RIP'))

    for kind, getter, publish in [('item', 0x1458BEF90, 0x145D4D1D7), ('spell', 0x1458C0250, 0x145D4D231)]:
        for failure in ('chain-failure', 'read-failure', 'header-failure'):
            reset(kind); context['mode'] = failure; run(getter)
            assert state(context['state']) == 3 and read('RAX') == 0
            failed_opens = context['opens']
            context['mode'] = 'success'; run(getter)
            assert context['opens'] == failed_opens + 1 and state(context['state']) == 0
            assert bytes(machine.mem_read(context['cache'], 48)) == context['payload']
            before = context['opens']; run(getter)
            assert context['opens'] == before and read('RAX') == 0
            vectors.append(dict(kind=kind, case=failure + '-then-success', opens=context['opens'], final_state=0,
                                subsequent_getter_opens=0, final_empty_cached=True))
        reset(kind); run(getter)
        assert state(context['state']) == 0
        assert context['paths'] == (['DBFilesClient\\Spell.dbc', 'DBFilesClient\\SpellIcon.dbc'] if kind == 'spell'
                                    else ['DBFilesClient\\ItemDisplayInfo.dbc'])
        vectors.append(dict(kind=kind, case='success-empty-publishes', paths=context['paths'], final_state=0))
        reset(kind)
        payload = scratch + 0x7000; machine.mem_write(payload, context['payload'])
        run(publish, payload)
        assert state(context['state']) == 0 and word(payload) == 0
        assert bytes(machine.mem_read(context['cache'], 48)) == context['payload']
        vectors.append(dict(kind=kind, case='publication-moves-all-48-bytes', consumed_source=True, final_state=0))
        reset(kind, 0); machine.mem_write(context['cache'], context['winner']); machine.mem_write(payload, context['payload'])
        run(publish, payload)
        assert bytes(machine.mem_read(context['cache'], 48)) == context['winner'] and word(payload) != 0
        vectors.append(dict(kind=kind, case='later-success-does-not-replace-first', consumed_source=False, final_state=0))
        reset(kind, 1); machine.mem_write(payload, context['payload']); run(publish, payload)
        assert context['waits'] == 1 and state(context['state']) == 0 and word(payload) != 0
        assert bytes(machine.mem_read(context['cache'], 48)) == context['winner']
        vectors.append(dict(kind=kind, case='waiter-observes-first-publisher', waits=1, consumed_source=False, final_state=0))
        reset(kind, 7); machine.mem_write(payload, context['payload']); run(publish, payload)
        assert state(context['state']) == 0 and context['wakes'] == 1 and word(payload) == 0
        vectors.append(dict(kind=kind, case='publisher-wakes-waiters', wakes=1, final_state=0))
        reset(kind, 2); machine.mem_write(payload, context['payload']); run(publish, payload)
        assert state(context['state']) == 0 and word(payload) == 0
        vectors.append(dict(kind=kind, case='forced-publish-recovers-poison', final_state=0))
        reset(kind); context['race_site'] = 0x1458C0604 if kind == 'spell' else 0x1458BF238
        run(getter)
        assert state(context['state']) == 0
        assert bytes(machine.mem_read(context['cache'], 48)) == context['winner']
        vectors.append(dict(kind=kind, case='concurrent-builder-first-success-wins', final_state=0))

    source = (ROOT / 'crates/azeroth-survivors-re/src/native_dbc.rs').read_text()
    assert 'static SPELLS: OnceLock<SpellMetadataMap>' in source
    assert 'static ITEM_ICONS: OnceLock<BTreeMap<u32, String>>' in source
    helper = source[source.index('fn get_or_try_publish'):source.index('fn open_chain')]
    assert helper.index('cache.get()') < helper.index('load()?') < helper.index('cache.set(value)')
    assert 'get_or_init' not in helper and 'Mutex' not in helper
    assert source.index('Table::parse(&spells)?') < source.index('.read_file("DBFilesClient\\\\SpellIcon.dbc")')
    observed = dict(target_sha256=target['sha256'], cases=vectors, seams=sorted(seams), limitations=manifest['limitations'])
    if args.record:
        output = ROOT / 'runtime/analysis/history/findings/gap41-dbc-lazy/db0c64c0fd51/lazy-native-vectors.json'
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(observed, indent=2) + '\n')
    else:
        assert observed == json.loads((EVIDENCE / 'lazy-native-vectors.json').read_text())
    print(f'{len(vectors)} original DBC retry/cache/publication cases passed; Rust and OS runtime behavior unexecuted')


if __name__ == '__main__': main()
