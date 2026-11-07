#!/usr/bin/env python3
"""Verify current Again contracts without compiling or launching a game.

Native replay requires an existing checkout-local Unicorn package. It executes
only reviewed admission/selection/stores, stops before callees, and permits writes
only to scratch memory. Source tracing is separate from compiled Rust validation.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

EVIDENCE = ROOT / 'docs/analysis/evidence/terminal-restart'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--python-libs', type=Path,
                        help='Existing project-local Unicorn directory')
    parser.add_argument('--output', type=Path,
                        default=Path('runtime/analysis/history/interface/terminal-restart/9687d826a4a5/native-vectors.json'))
    args = parser.parse_args()
    manifest = json.loads((EVIDENCE / 'manifest.json').read_text())
    target = latest_target(verify=True)
    require(target['sha256'] == manifest['target']['sha256'], 'Different installed EXE')
    data = target_bytes(target)
    inventory = load_script('inventory', ROOT / 'scripts/inventory-executable.py')
    pe = inventory.PE(data)

    def raw(start, end):
        offset = pe.rva_offset(start - pe.image_base)
        value = data[offset:offset + end - start]
        require(len(value) == end - start, 'Truncated native range')
        return value

    for row in manifest['ranges']:
        a, b = int(row['start'], 16), int(row['end_exclusive'], 16)
        require(hashlib.sha256(raw(a, b)).hexdigest() == row['sha256'], row['role'])
        require(pe.rva_offset(a - pe.image_base) == int(row['file_offset'], 16), 'PE mapping')
        require(hashlib.sha256((EVIDENCE / row['assembly']).read_bytes()).hexdigest()
                == row['assembly_sha256'], 'Retained assembly changed')
    for row in manifest['ghidra']:
        a, b = int(row['input_start'], 16), int(row['input_end_exclusive'], 16)
        require(hashlib.sha256(raw(a, b)).hexdigest() == row['input_sha256'], 'Ghidra input')
        require(hashlib.sha256((EVIDENCE / row['pseudocode']).read_bytes()).hexdigest()
                == row['pseudocode_sha256'], 'Retained pseudocode changed')
    for row in manifest['calls']:
        site = int(row['site'], 16)
        instruction = raw(site, site + 5)
        require(instruction[0] == 0xe8 and site + 5 + struct.unpack_from('<i', instruction, 1)[0]
                == int(row['callee'], 16), 'Native call contract changed')
    table = manifest['command_table']
    address = int(table['address'], 16)
    values = bytes.fromhex(table['bytes_hex'])
    require(raw(address, address + len(values)) == values, 'Command table changed')
    for name in ('again', 'pick'):
        offset = struct.unpack_from('<i', values, 4 * (table[name] - 2))[0]
        require(address + offset == int(table[name + '_destination'], 16), 'Command routing')

    menu = (ROOT / manifest['source_refs'][0]).read_text()
    restart = menu.split('fn begin_restart(', 1)[1].split('///', 1)[0]
    require('self.entering || self.in_run' in restart and 'self.enter_started_at = Some(elapsed)' in restart,
            'Restart admission/request changed')
    require(not any(word in restart for word in ('commit_enter', 'commit_pick', 'save.', 'random()')),
            'Again must not replay picker normalization/persistence')
    terminal = (ROOT / manifest['source_refs'][1]).read_text()
    require('action == TerminalAction::Again && session.mechanics.is_none()' in terminal,
            'Again absent-game no-op missing')
    require('menu.begin_restart(time.elapsed_secs())' in terminal
            and 'menu.begin_enter(' not in terminal, 'Terminal still replays picker Enter')
    require(terminal.index('session.mechanics.is_none()') < terminal.index('super::persist_run('),
            'Absent-game guard must precede terminal teardown')

    cases = []
    if args.python_libs is not None:
        libraries = (ROOT / args.python_libs).resolve()
        output = (ROOT / args.output).resolve()
        require(libraries.is_relative_to(ROOT) and libraries.is_dir(), 'Libraries leave project')
        require(output.is_relative_to(ROOT / 'runtime'), 'Output leaves runtime/')
        sys.path.insert(0, str(libraries))
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
        import unicorn.x86_const as registers
        machine = Uc(UC_ARCH_X86, UC_MODE_64)
        extent = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
        machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
        for section in pe.sections:
            machine.mem_write(pe.image_base + section['rva'],
                              data[section['raw_offset']:section['raw_offset'] + section['raw_size']])
        scratch, size = 0x20000000, 0x20000
        machine.mem_map(scratch, size)
        context = {}

        def read(name):
            return machine.reg_read(getattr(registers, 'UC_X86_REG_' + name))

        def write(name, value):
            machine.reg_write(getattr(registers, 'UC_X86_REG_' + name), value)

        def put(address, value):
            machine.mem_write(address, struct.pack('<Q', value))

        def word(address):
            return struct.unpack('<Q', machine.mem_read(address, 8))[0]

        def instruction_hook(_, address, count, unused):
            if address in context['stops']:
                machine.emu_stop()
                return
            require(any(a <= address and address + count <= b for a, b in context['ranges']),
                    'Execution leaves reviewed native ranges')
            instruction = bytes(machine.mem_read(address, count))
            require(instruction == raw(address, address + count), 'Modified native instruction')
            # No selected path may call a native callee, including indirect calls.
            require(instruction[0] != 0xe8
                    and not (instruction[0] == 0xff and (instruction[1] >> 3) & 7 in (2, 3)),
                    'Unexpected native call')

        def write_hook(_, access, address, count, value, unused):
            require(scratch <= address and address + count <= scratch + size, 'Write leaves scratch')

        machine.hook_add(UC_HOOK_CODE, instruction_hook)
        machine.hook_add(UC_HOOK_MEM_WRITE, write_hook)

        def run(start, spans, stops):
            context.update(ranges=spans, stops=set(stops))
            machine.emu_start(start, 0, count=5000)
            require(read('RIP') in context['stops'], 'Native instruction budget exhausted')

        def reset():
            machine.mem_write(scratch, bytes(size))
            for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'RSP', 'R13'):
                write(name, 0)
            write('EFLAGS', 2)

        server, bp, rows = scratch + 0x1000, scratch + 0x8000, scratch + 0x10000
        for tag in (0, 1, 2):
            reset()
            put(server + 0x10, tag)
            write('RSI', server)
            run(0x1458b4ef6, [(0x1458b4ef6, 0x1458b4f0c)], [0x1458b4f0c, 0x1458b6478])
            require(word(server + 0x10) == 2 and read('RAX') == tag, 'Game option take')
            require(read('RIP') == (0x1458b6478 if tag == 2 else 0x1458b4f0c), 'Absent game gate')
            cases.append(dict(kind='game-option', tag=tag))
        for count in range(7):
            for mask in range(1 << count):
                reset()
                put(server + 0xb18, count)
                put(server + 0xb10, rows)
                for index in range(count):
                    machine.mem_write(rows + index * 0xb0 + 0xa8, bytes([(mask >> index) & 1]))
                write('RSI', server)
                run(0x1458b4f23, [(0x1458b4f23, 0x1458b4f72)], [0x1458b5cb2, 0x1458b646e])
                require(read('RIP') == (0x1458b5cb2 if mask else 0x1458b646e), 'Active connection gate')
                if mask:
                    require(read('RBX') == (mask & -mask).bit_length() - 1, 'First active connection')
                cases.append(dict(kind='active-connection', count=count, mask=mask))
        for poison in (0, 0x5a, 0xa5, 0xff):
            reset()
            machine.mem_write(server, bytes([poison]) * 0x1200)
            before = bytes(machine.mem_read(server, 0x1200))
            write('R13', server)
            run(0x1458b79e8, [(0x1458b79e8, 0x1458b7a1a)], [0x1458b7a1a])
            expected = bytearray(before)
            expected[0x1162] = 0
            expected[0x10a8:0x10e0] = bytes(0x38)
            require(bytes(machine.mem_read(server, 0x1200)) == expected, 'Replacement checkpoint reset')
            cases.append(dict(kind='checkpoint-reset', poison=poison))
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(dict(target=manifest['target'], cases=cases,
                                         limits=manifest['limits']), indent=2) + '\n')
    print(f'{len(manifest["ranges"])} native ranges, two Ghidra inputs, three calls and source routes verified; '
          f'{len(cases)} bounded native cases; no compilation or game launch')


if __name__ == '__main__':
    main()
