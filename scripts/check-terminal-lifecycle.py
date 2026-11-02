#!/usr/bin/env python3
"""Check bounded 0.107.0 startup and terminal reset contracts without compiling.

Only hash-bound PE instructions run in Unicorn. Native allocators, byte copying,
vector growth and long ASCII comparison are declared scratch-memory seams.
"""
from portable_paths import portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

EVIDENCE = ROOT / 'docs/analysis/evidence/0.107.0/terminal-lifecycle'


def require(value, why):
    if not value:
        raise ValueError(why)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--python-libs', default='runtime/armory-recovery/python-libs')
    parser.add_argument('--output', default='runtime/gap9-0.107.0/lifecycle-checks.json')
    parser.add_argument('--prepare-rea', action='store_true', help='Stage current raw-function Ghidra plans under runtime/')
    args = parser.parse_args()
    libs, output = [(ROOT / value).resolve() for value in (args.python_libs, args.output)]
    require(libs.is_relative_to(ROOT) and output.is_relative_to(ROOT / 'runtime'), 'Path leaves checkout/runtime')
    sys.path.insert(0, str(libs))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg

    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    require(all(target[k] == v for k, v in manifest['target'].items()), 'Evidence belongs to another target')
    data = target_bytes(target)
    module = load_script('native_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        require(offset is not None, f'Unmapped address {address:#x}')
        return data[offset:offset + count]

    by_role = {row['role']: row for row in manifest['ranges']}
    for row in manifest['ranges']:
        a, b = int(row['start'], 16), int(row['end_exclusive'], 16)
        require(len(raw(a, b - a)) == b - a and hashlib.sha256(raw(a, b - a)).hexdigest() == row['sha256'], row['role'])
        for key in ('assembly', 'pseudocode'):
            if key in row:
                require(hashlib.sha256((EVIDENCE / row[key]).read_bytes()).hexdigest() == row[key + '_sha256'], key)
    if args.prepare_rea:
        directory = ROOT / 'runtime/gap9-0.107.0/lifecycle-reproduction'
        directory.mkdir(parents=True, exist_ok=True)
        for row in manifest['ranges']:
            if 'rea_evidence_id' not in row:
                continue
            name, start = row['role'], int(row['start'], 16)
            binary = directory / (name + '.bin')
            binary.write_bytes(raw(start, row['byte_count']))
            plan = dict(target=str(binary.relative_to(ROOT)), output=str((directory / ('rea-' + name)).relative_to(ROOT)),
                        init_timeout=60, timeout=180,
                        open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(start)),
                        operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(start)))])
            (directory / (name + '-plan.json')).write_text(portable_json(plan, indent=2) + '\n')

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s['rva'] + s['raw_size'] for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        at, count = section['raw_offset'], section['raw_size']
        machine.mem_write(pe.image_base + section['rva'], data[at:at + count])
    scratch, size = 0x200000000, 0x80000
    machine.mem_map(scratch, size)
    context, seams, vectors = {}, set(), []

    def read(name): return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    def write(name, value): machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    def word(address): return struct.unpack('<Q', machine.mem_read(address, 8))[0]
    def put(address, value): machine.mem_write(address, struct.pack('<Q', value & ((1 << 64) - 1)))

    def allocate(count):
        address = context['arena']
        context['arena'] = (address + max(1, count) + 15) & ~15
        require(context['arena'] < scratch + 0x70000, 'Scratch allocation exhausted')
        return address

    def hook(_, address, count, unused):
        if address in context['stops']:
            machine.emu_stop()
            return
        if address in (0x140002200, 0x1400021C0, 0x1400021D0, 0x145BF1D41, 0x145BF3940, 0x140502660):
            seams.add(hex(address))
            if address == 0x1400021C0:
                write('RAX', allocate(read('RCX')))
            elif address == 0x145BF1D41:
                machine.mem_write(read('RCX'), bytes(machine.mem_read(read('RDX'), read('R8'))))
                write('RAX', read('RCX'))
            elif address == 0x145BF3940:
                vector, length, extra = read('RCX'), read('RDX'), read('R8')
                storage = allocate(length + extra)
                if length:
                    machine.mem_write(storage, bytes(machine.mem_read(word(vector + 8), length)))
                put(vector, length + extra)
                put(vector + 8, storage)
            elif address == 0x140502660:
                a = bytes(machine.mem_read(read('RCX'), read('RDX')))
                b = bytes(machine.mem_read(read('R8'), read('RDX')))
                write('RAX', int(a.lower() == b.lower()))
            sp = read('RSP')
            write('RIP', word(sp)); write('RSP', sp + 8)
            return
        require(any(a <= address and address + count <= b for a, b in context['ranges']), f'Unreviewed instruction {address:#x}')
        require(bytes(machine.mem_read(address, count)) == raw(address, count), 'Instruction differs from target')

    def on_write(_, access, address, count, value, unused):
        require(scratch <= address and address + count <= scratch + size, f'Write leaves scratch {address:#x}')

    machine.hook_add(UC_HOOK_CODE, hook)
    machine.hook_add(UC_HOOK_MEM_WRITE, on_write)

    def reset(roles, stops=()):
        machine.mem_write(scratch, bytes(size))
        machine.mem_write(scratch + size - 16, b'\xcc')
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15', 'RBP'):
            write(name, 0)
        write('EFLAGS', 2); write('RSP', scratch + 0xF000)
        put(read('RSP'), scratch + size - 16)
        context.update(arena=scratch + 0x20000, ranges=[(int(by_role[r]['start'], 16), int(by_role[r]['end_exclusive'], 16)) for r in roles], stops=set(stops) | {scratch + size - 16})

    def run(start):
        try:
            machine.emu_start(start, 0, count=100000)
        except Exception as error:
            raise RuntimeError(f'Native replay stopped at {read("RIP"):#x}, stack {read("RSP"):#x}: {error}') from error
        require(read('RIP') in context['stops'], f'Instruction budget exhausted {read("RIP"):#x}')

    catalog = json.loads((ROOT / 'crates/azeroth-survivors-re/assets/menu.json').read_text())
    source = (ROOT / 'crates/azeroth-survivors-re/src/save.rs').read_text()
    allowed = {int(k): [int(v) for v in re.findall(r'\d+', values)] for k, values in re.findall(r'(\d+) => &\[([^\]]+)\]', source[:source.index('/// Native appearance order')])}
    classes = [1, 2, 3, 4, 5, 7, 8, 9, 11]
    for cid in classes:
        ptr = 0x146BE7698 + struct.unpack('<i', raw(0x146BE7698 + (cid - 1) * 4, 4))[0]
        n = struct.unpack('<Q', raw(0x146BE76C8 + (cid - 1) * 8, 8))[0]
        require(list(raw(ptr, n)) == allowed[cid], f'Class/race table {cid}')
    inputs = [(row['key'], cid) for row, cid in zip(catalog['classes'], classes)] + [('UNKNOWN', 1), (' warrior', 1), ('x' * 20, 1)]
    races = ['', 'unknown', 'Night Elf', ' NIGHTELF'] + [row['name'].replace(' ', '') for row in catalog['races']]
    for key, cid in inputs:
        for race_name in races:
            reset(['tester-factory'])
            c, r = key.upper().encode(), race_name.encode()
            machine.mem_write(scratch + 0x1000, c or b'\0'); machine.mem_write(scratch + 0x2000, r or b'\0')
            write('RCX', scratch + 0x3000); write('RDX', scratch + 0x1000); write('R8', len(c)); write('R9', scratch + 0x2000)
            put(read('RSP') + 0x28, len(r)); run(0x1458AA470)
            row = bytes(machine.mem_read(scratch + 0x3000, 56))
            ptr, count = struct.unpack_from('<QQ', row, 8)
            expected = next((i + 1 for i, value in enumerate(catalog['races']) if value['name'].replace(' ', '').lower() == race_name.lower() and i + 1 in allowed[cid]), allowed[cid][0])
            require(bytes(machine.mem_read(ptr, count)) == b'Tester', 'Default name')
            require(struct.unpack_from('<Q', row, 24)[0] == 0xFFFFFF and list(struct.unpack_from('<4I', row, 32)) == [1, 0, 0, 0], 'Transient identity/counters')
            require(list(row[48:]) == [expected, cid, 0, 0, 0, 0, 0, 0], 'Factory race/class/appearance')
            vectors.append(dict(kind='factory', class_argument=key.upper(), race_argument=race_name, race=expected, class_id=cid))
    zones = [row['key'] for row in catalog['zones']]
    for value in zones + ['Elwynn', 'WSG', '', 'unknown', ' naxx', 'naxx ', 'AQ', 'nightelf']:
        reset(['zone-parser', 'realm-name'])
        encoded = value.encode(); machine.mem_write(scratch + 0x1000, encoded or b'\0')
        write('RCX', scratch + 0x1000); write('RDX', len(encoded)); run(0x1458AB720)
        result = bytes(machine.mem_read(read('RAX'), read('RDX'))).decode()
        expected = catalog['zones'][zones.index(value) if value in zones else 0]['name']
        require(result == expected, f'Realm fallback {value!r}: {result!r}')
        vectors.append(dict(kind='realm-name', argument=value, result=result))
    for value, status, expected in [(b'1', -2, 1), (b'0', -2, 0), (b'01', -2, 0), (b'', -2, 0), (b'1', 0, 0), (b'1 ', -2, 0)]:
        reset(['glue-environment-value'], [0x14000179F])
        bp = scratch + 0x4000; write('RBP', bp)
        put(bp + 0xF0, status); put(bp + 0x108, len(value)); put(bp + 0x100, scratch + 0x1000)
        machine.mem_write(scratch + 0x1000, value or b'\0'); run(0x140001779)
        require(read('RAX') & 255 == expected, 'Glue environment admission')
        vectors.append(dict(kind='glue-value', value=value.decode(), status=status, admitted=expected))
    for zone_present in (False, True):
        for class_present in (False, True):
            for glue in (0, 1):
                reset(['startup-selector'], [0x14000F500, 0x14000F546, 0x14000F610, 0x14000F63D])
                options = scratch + 0x4000
                put(options, 1 if zone_present else -1)
                put(options + 0x18, 1 if class_present else -1)
                put(options + 8, scratch + 0x1000); put(options + 0x10, 3)
                put(options + 0x20, scratch + 0x2000); put(options + 0x28, 7)
                put(options + 0x30, -1)
                machine.mem_write(options + 0x61, bytes([glue]))
                write('RCX', scratch + 0x6000); write('RDX', options)
                run(0x14000F4C0)
                expected = 0x14000F546 if class_present else 0x14000F500 if zone_present else 0x14000F610 if glue else 0x14000F63D
                require(read('RIP') == expected, 'Startup route admission')
                if not class_present and not zone_present and glue:
                    require(read('RDX') == 0 and read('R9') == 0, 'Default stock route must omit realm and character')
                vectors.append(dict(kind='startup-route', zone=zone_present, character=class_present, glue=glue, stop=hex(expected)))
    for tag in (0, 1, 2):
        reset(['again-move-option'], [0x1458A588C, 0x1458A6DC2])
        server = scratch + 0x4000; put(server + 0x10, tag); write('RSI', server)
        run(0x1458A5876)
        require(word(server + 0x10) == 2 and read('RAX') == tag, 'Again must take and clear the game option')
        require(read('RIP') == (0x1458A6DC2 if tag == 2 else 0x1458A588C), 'Again absent-game admission')
        vectors.append(dict(kind='again-option', tag=tag))
    table = struct.unpack('<12i', raw(0x146BE8EAC, 48))
    for command, expected in [(6, 0x1458A586E), (8, 0x1458A5DB0), (9, 0x1458A60D6)]:
        require(0x146BE8EAC + table[command - 2] == expected, 'Terminal command dispatch')
    # Stop at the persist call: no save/destructor/packet/native callee executes.
    for count in range(5):
        for mask in range(1 << count):
            reset(['menu-return'], [0x1458A212E])
            server, rows = scratch + 0x4000, scratch + 0x6000
            put(server + 0xB18, count); put(server + 0xB10, rows)
            for i in range(count): machine.mem_write(rows + i * 0xB0 + 0xA8, bytes([(mask >> i) & 1]))
            write('RCX', server); run(0x1458A20D0)
            if mask:
                require(read('RIP') == 0x1458A212E and read('RDI') == (mask & -mask).bit_length() - 1, 'First active connection')
            else: require(read('RIP') == scratch + size - 16, 'No active connection must return')
            vectors.append(dict(kind='menu-active-gate', count=count, mask=mask))
    # Environment keys and Menu reset/logout order remain separately source-traced.
    require(raw(0x146BE377A, 41) == b'WOW_USERWOW_PASSWOW_HOSTWOW_REALMWOW_CHAR', 'Environment key table')
    main_source = (ROOT / manifest['source_refs'][0]).read_text()
    terminal = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/terminal.rs').read_text()
    startup = (ROOT / 'crates/azeroth-survivors-re/src/startup.rs').read_text()
    for text, tokens in [(main_source, ['NativeStartup::positional', 'native_startup.configure_client', 'WOW_ROGUE_GLUE']), (startup, ['arguments.get(1)', 'TESTER_GUID', 'allowed_races', 'WOW_REALM', 'WOW_CHAR']), (terminal, ['persist_run', 'menu.return_from_run()', 'finish_client_delivery', 'action == TerminalAction::Menu', 'action == TerminalAction::Again'])]:
        for token in tokens: require(token in text, f'Missing source connection {token}')
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(portable_json(dict(target=manifest['target'], vectors=vectors, seams=sorted(seams), source_connections='bounded token checks plus documented manual tracing', limits=manifest['limitations']), indent=2) + '\n')
    print(f'{len(vectors)} native factory/realm/environment/active-connection cases passed; nine class/race tables and selected source connections checked')


if __name__ == '__main__':
    main()
