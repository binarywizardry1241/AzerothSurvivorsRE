#!/usr/bin/env python3
"""Recheck selected-target Tester startup without compilation or game execution.

The complete native row factory runs in Unicorn with explicit allocation, byte
copy and ASCII-comparison seams. No original callee executes. Zone parsing runs
unchanged leaf instructions. Source connections are checked separately.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import latest_target

ROOT = Path(__file__).resolve().parents[1]
EVIDENCE = ROOT / 'docs/analysis/evidence/0.105.0/stock-frontend/tester'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--python-libs', default='runtime/tool-state/python/armory/python-libs')
    parser.add_argument('--output', default='runtime/analysis/history/findings/gap9-startup/d2cb47f5253e/checks.json')
    args = parser.parse_args()
    libs, output = [(ROOT / value).resolve() for value in (args.python_libs, args.output)]
    assert libs.is_relative_to(ROOT) and output.is_relative_to(ROOT / 'runtime')
    sys.path.insert(0, str(libs))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    assert target['sha256'] == manifest['target_sha256']
    data = (ROOT / target['path']).read_bytes()
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    for row in manifest['ranges']:
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        assert hashlib.sha256(raw(start, end - start)).hexdigest() == row['sha256']
        for key in ('assembly', 'pseudocode'):
            if key in row:
                assert hashlib.sha256((EVIDENCE / row[key]).read_bytes()).hexdigest() == row[key + '_sha256']
    for row in manifest['instruction_contracts']:
        assert raw(int(row['address'], 16), len(bytes.fromhex(row['bytes_hex']))).hex() == row['bytes_hex']

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(section['rva'] + section['raw_size'] for section in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        offset, size = section['raw_offset'], section['raw_size']
        machine.mem_write(pe.image_base + section['rva'], data[offset:offset + size])
    scratch, size = 0x200000000, 0x40000
    machine.mem_map(scratch, size)
    context, seams = {}, set()

    def read(name):
        return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))

    def write(name, value):
        machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)

    def word(address):
        return struct.unpack('<Q', machine.mem_read(address, 8))[0]

    def put(address, value):
        machine.mem_write(address, struct.pack('<Q', value))

    def allocate(count):
        address = context['arena']
        context['arena'] = (address + count + 15) & ~15
        assert context['arena'] < scratch + 0x30000
        return address

    def hook(_, address, count, unused):
        if address in context['stops']:
            machine.emu_stop()
            return
        if address in (0x140002200, 0x1400021C0, 0x1400021D0, 0x145BC977B, 0x145BCB2D0, 0x140002210):
            seams.add(hex(address))
            if address == 0x1400021C0:
                write('RAX', allocate(read('RCX')))
            elif address == 0x145BC977B:
                machine.mem_write(read('RCX'), bytes(machine.mem_read(read('RDX'), read('R8'))))
                write('RAX', read('RCX'))
            elif address == 0x145BCB2D0:
                vector, length = read('RCX'), read('RDX')
                capacity = length + read('R8')
                storage = allocate(capacity)
                if length:
                    machine.mem_write(storage, bytes(machine.mem_read(word(vector + 8), length)))
                put(vector, capacity)
                put(vector + 8, storage)
            elif address == 0x140002210:
                left = bytes(machine.mem_read(read('RCX'), read('RDX')))
                right = bytes(machine.mem_read(read('R8'), read('RDX')))
                write('RAX', int(left.lower() == right.lower()))
            sp = read('RSP')
            write('RIP', word(sp))
            write('RSP', sp + 8)
            return
        assert any(start <= address and address + count <= end for start, end in context['ranges']), hex(address)
        assert bytes(machine.mem_read(address, count)) == raw(address, count)

    def on_write(_, access, address, count, value, unused):
        assert scratch <= address and address + count <= scratch + size, hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)
    machine.hook_add(UC_HOOK_MEM_WRITE, on_write)

    def reset(ranges, stops=()):
        machine.mem_write(scratch, bytes(size))
        machine.mem_write(scratch + 0x3FFF0, b'\xcc')
        context.update(arena=scratch + 0x10000, ranges=ranges, stops=set(stops) | {scratch + 0x3FFF0})
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15', 'RBP'):
            write(name, 0)
        write('EFLAGS', 2)
        write('RSP', scratch + 0xF000)
        put(read('RSP'), scratch + 0x3FFF0)

    def run(start):
        machine.emu_start(start, 0, count=100000)
        assert read('RIP') in context['stops'], 'Native instruction budget exhausted'

    catalog = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/menu.json').read_text())
    save_source = (ROOT / 'crates/azeroth-survivors-re/src/save.rs').read_text()
    allowed = {int(k): [int(v) for v in re.findall(r'\d+', values)] for k, values in
               re.findall(r'(\d+) => &\[([^\]]+)\]', save_source[:save_source.index('/// Native appearance order')])}
    class_ids = [1, 2, 3, 4, 5, 7, 8, 9, 11]
    for class_id in class_ids:
        pointer = 0x146BB7B18 + struct.unpack('<i', raw(0x146BB7B18 + (class_id - 1) * 4, 4))[0]
        count = struct.unpack('<Q', raw(0x146BB7B48 + (class_id - 1) * 8, 8))[0]
        assert list(raw(pointer, count)) == allowed[class_id]
    vectors = []
    classes = [(row['key'], class_id) for row, class_id in zip(catalog['classes'], class_ids)]
    classes += [('UNKNOWN', 1), (' warrior', 1), ('x' * 20, 1)]
    race_inputs = ['', 'unknown', 'Night Elf', ' NIGHTELF'] + [row['name'].replace(' ', '') for row in catalog['races']]
    for class_key, class_id in classes:
        for race_name in race_inputs:
            reset([(0x1458B6E90, 0x1458B7EFA)])
            encoded_class, encoded_race = class_key.upper().encode(), race_name.encode()
            machine.mem_write(scratch + 0x1000, encoded_class or b'\0')
            machine.mem_write(scratch + 0x2000, encoded_race or b'\0')
            write('RCX', scratch + 0x3000)
            write('RDX', scratch + 0x1000)
            write('R8', len(encoded_class))
            write('R9', scratch + 0x2000)
            put(read('RSP') + 0x28, len(encoded_race))
            run(0x1458B6E90)
            row = bytes(machine.mem_read(scratch + 0x3000, 56))
            pointer, count = struct.unpack_from('<QQ', row, 8)
            name = bytes(machine.mem_read(pointer, count)).decode()
            race = next((index + 1 for index, race in enumerate(catalog['races'])
                         if race['name'].replace(' ', '').lower() == race_name.lower()
                         and index + 1 in allowed[class_id]), allowed[class_id][0])
            assert name == 'Tester' and struct.unpack_from('<Q', row, 24)[0] == 0xFFFFFF
            assert list(struct.unpack_from('<4I', row, 32)) == [1, 0, 0, 0]
            assert list(row[48:]) == [race, class_id, 0, 0, 0, 0, 0, 0]
            vectors.append(dict(kind='Tester factory', class_argument=class_key.upper(), race_argument=race_name,
                                class_id=class_id, race_id=race))
    zone_names = [row['key'] for row in catalog['zones']]
    for value in zone_names + ['Elwynn', 'WSG', 'nightelf', '', 'unknown', ' naxx', 'naxx ', 'AQ']:
        reset([(0x1458753B0, 0x1458754D9)])
        encoded = value.encode()
        machine.mem_write(scratch + 0x1000, encoded or b'\0')
        write('RCX', scratch + 0x1000)
        write('RDX', len(encoded))
        run(0x1458753B0)
        expected = zone_names.index(value) if value in zone_names else 0
        assert read('RAX') == expected
        vectors.append(dict(kind='Exact zone parser', argument=value, zone=expected))
    # Preserve the actual live route, independently of native-vector execution.
    startup = (ROOT / 'crates/azeroth-survivors-re/src/startup.rs').read_text()
    frontend = (ROOT / 'crates/azeroth-survivors-re/src/stock_frontend.rs').read_text()
    menu = (ROOT / 'crates/azeroth-survivors-re/src/menu_state.rs').read_text()
    gameplay = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/mod.rs').read_text()
    local = (ROOT / 'crates/benilla-app/src/local_client.rs').read_text()
    policy = (ROOT / 'crates/benilla-app/src/local_client/stock_frontend.rs').read_text()
    for text, tokens in [(startup, ['arguments.get(1)', "replace(' ', \"\")", 'TESTER_GUID', 'WOW_CHAR', 'WOW_REALM']),
                         (frontend, ['startup.character.is_some()', 'startup.character.as_ref()', 'guid == crate::startup::TESTER_GUID']),
                         (menu, ['startup_character.iter().cloned().chain(self.save.characters())', 'self.zone = zone;']),
                         (gameplay, ['startup.into_iter().cloned().chain(save.characters())', 'Some(crate::startup::TESTER_GUID)']),
                         (local, ['stock_frontend::startup_pick', 'crate::glue_session::roster::enter_run_pick']),
                         (policy, ['read_environment_character', 'take_environment_character', 'RunPick::enter_once'])]:
        compact = re.sub(r'\s+', '', text)
        for token in tokens:
            assert re.sub(r'\s+', '', token) in compact, token
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(dict(target_sha256=target['sha256'], vectors=vectors,
        seams=sorted(seams), source_connections='checked', limits=manifest['limitations']), indent=2) + '\n')
    print(f'{len(vectors)} native factory/zone vectors, nine class/race tables, current byte gates and live source connections passed')


if __name__ == '__main__':
    main()
