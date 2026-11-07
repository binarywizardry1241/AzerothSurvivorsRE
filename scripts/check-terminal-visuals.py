#!/usr/bin/env python3
"""Verify current terminal visual/clone/hook contracts without compiling or a game.

Default verifies selected EXE ranges, current TypeId occurrences, direct query
calls, retained evidence and the live terminal bundle. --python-libs additionally
runs strictly bounded original instruction slices in Unicorn using scratch
memory. Calls, allocator growth, panic handling, callbacks and game code outside
those slices are forbidden; no OS APIs or game process are started.
"""
from portable_paths import portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

EVIDENCE = ROOT / 'docs/analysis/evidence/0.108.0/terminal-visuals'


def require(value, message):
    if not value:
        raise ValueError(message)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--python-libs', type=Path,
                        help='Existing project-local Unicorn installation')
    parser.add_argument('--output', type=Path,
                        default=Path('runtime/analysis/history/interface/terminal-visuals/5e13c68cce68/native-vectors.json'))
    parser.add_argument('--prepare-rea', action='store_true',
                        help='Stage raw-function Ghidra reproduction plans under runtime/')
    args = parser.parse_args()
    manifest = json.loads((EVIDENCE / 'contracts.json').read_text())
    target = latest_target(verify=True)
    require(target['sha256'] == manifest['target_sha256'], 'Terminal contracts belong to another EXE')
    data = target_bytes(target)
    module = load_script('terminal_pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, length):
        at = pe.rva_offset(address - pe.image_base)
        value = data[at:at + length]
        require(len(value) == length, 'Truncated native range')
        return value

    def locations(needle):
        found, at = [], 0
        while (at := data.find(needle, at)) >= 0:
            found.append(hex(pe.offset_va(at)))
            at += 1
        return found

    ranges = {row['role']: row for row in manifest['ranges']}
    for row in ranges.values():
        a, e = int(row['virtual_address'], 16), int(row['end_exclusive'], 16)
        require(hashlib.sha256(raw(a, e-a)).hexdigest() == row['sha256'],
                f"Native bytes changed: {row['role']}")
        require(pe.rva_offset(a-pe.image_base) == int(row['file_offset'], 16), 'PE mapping changed')
        for kind in ('assembly', 'pseudocode'):
            if kind in row:
                require(hashlib.sha256((EVIDENCE / row[kind]).read_bytes()).hexdigest()
                        == row[kind+'_sha256'], f"Retained evidence changed: {row['role']}")
    for row in manifest['typeids'].values():
        require(locations(bytes.fromhex(row['bytes_hex'])) == row['locations'], 'TypeId occurrence drift')
    calls = 0
    for row in manifest['query_registration'].values():
        for call in row['calls']:
            a = int(call['site'], 16)
            value = raw(a, 5)
            require(value[0] == 0xe8 and a+5+struct.unpack_from('<i', value, 1)[0]
                    == int(row['getter'], 16), f'Query registration call changed at {a:#x}')
            calls += 1
    for row in [manifest['terminal_tuple'], manifest['updater_badge_tuple'], *manifest['hook_mutation_diagnostics'],
                *manifest.get('diagnostics', [])]:
        value = bytes.fromhex(row['bytes_hex'])
        require(raw(int(row['address'], 16), len(value)) == value, 'Native diagnostic/tuple changed')
    for row in manifest['vtables']:
        for slot, address_field in [('init_slot', 'init'), ('run_slot', 'run')]:
            require(struct.unpack('<Q', raw(int(row[slot], 16), 8))[0] == int(row[address_field], 16),
                    'Native system vtable changed')
    for row in manifest['hook_mutation_diagnostics']:
        for owner in row['owners']:
            a, e = int(owner['address'], 16), int(owner['end_exclusive'], 16)
            require(hashlib.sha256(raw(a, e-a)).hexdigest() == owner['sha256'],
                    f'Public hook-registration owner changed at {a:#x}')
    if args.prepare_rea:
        directory = ROOT / 'runtime/analysis/history/interface/terminal-visuals/5e13c68cce68/reproduction'
        directory.mkdir(parents=True, exist_ok=True)
        for row in ranges.values():
            if 'rea_evidence_id' not in row:
                continue
            a, e = int(row['virtual_address'], 16), int(row['end_exclusive'], 16)
            binary = directory / (row['role']+'.bin')
            binary.write_bytes(raw(a, e-a))
            plan = dict(target=str(binary.relative_to(ROOT)),
                        output=str((directory/('rea-'+row['role'])).relative_to(ROOT)),
                        init_timeout=60, timeout=240,
                        open_options=dict(format='raw-binary', architecture='x86_64', entry_point=hex(a)),
                        operations=[dict(name='procedure_pseudo_code', arguments=dict(procedure=hex(a)))])
            (directory/(row['role']+'-plan.json')).write_text(portable_json(plan, indent=2)+'\n')
    view = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/terminal_view.rs').read_text()
    button = view.split('fn button(', 1)[1].split('fn survived(', 1)[0]
    require('Interaction::None,' in button and '\n        Button,' not in button
            and 'NativeHover::' not in button, 'Terminal Interaction-only bundle changed')
    require('BorderColor::all(menu::BUTTON_EDGE)' in button
            and 'menu::native_button_gradient()' in button and 'BoxShadow::new(' in button,
            'Terminal visual components changed')
    cases = []
    if args.python_libs:
        libraries = (ROOT / args.python_libs).resolve()
        require(libraries.is_relative_to(ROOT) and libraries.is_dir(), 'Unicorn must be project-local')
        sys.path.insert(0, str(libraries))
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
        from unicorn import x86_const as r
        u = Uc(UC_ARCH_X86, UC_MODE_64)
        extent = max(s['rva'] + max(s['raw_size'], s['virtual_size']) for s in pe.sections)
        u.mem_map(pe.image_base, (extent + 4095) & ~4095)
        for section in pe.sections:
            u.mem_write(pe.image_base+section['rva'], data[section['raw_offset']:section['raw_offset']+section['raw_size']])
        scratch, size = 0x20000000, 0x20000
        u.mem_map(scratch, size)
        instructions, stops, result = {}, {}, [None]

        def code(machine, address, length, _):
            if address in stops:
                result[0] = stops[address]
                machine.emu_stop()
                return
            require(address in instructions, f'Native slice escaped at {address:#x}')
            expected, mnemonic = instructions[address]
            require(length == len(expected) and bytes(machine.mem_read(address, length)) == expected
                    and expected == raw(address, length), 'Native instruction drift')
            require(mnemonic not in ('call', 'ret', 'syscall', 'int', 'ud2'),
                    f'Forbidden native operation at {address:#x}')

        def write(_, __, address, length, ___, ____):
            require(scratch <= address and address+length <= scratch+size, 'Native write escaped scratch')

        u.hook_add(UC_HOOK_CODE, code)
        u.hook_add(UC_HOOK_MEM_WRITE, write)

        def put(address, fmt, *value):
            u.mem_write(address, struct.pack(fmt, *value))

        def get(address, fmt):
            return struct.unpack(fmt, u.mem_read(address, struct.calcsize(fmt)))

        def reset():
            u.mem_write(scratch, bytes([0xa5])*size)
            u.reg_write(r.UC_X86_REG_RSP, scratch+0x1e008)
            for reg in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8, r.UC_X86_REG_R9):
                u.reg_write(reg, 0)

        def run(role, exits=None):
            row = ranges[role]
            instructions.clear()
            stops.clear()
            for line in (EVIDENCE / row['assembly']).read_text().splitlines():
                address, value, mnemonic, *_ = line.split()
                address, value = int(address, 16), bytes.fromhex(value)
                instructions[address] = (value, mnemonic)
                if mnemonic == 'ret':
                    stops[address] = 'return'
            stops.update(exits or {})
            result[0] = None
            u.emu_start(int(row['virtual_address'], 16), int(row['end_exclusive'], 16), count=512)
            require(result[0] is not None, 'Native slice did not reach its reviewed exit')
            return result[0]

        # Full leaf ComponentInfo initializer: preserve descriptor/id; empty hooks.
        for poison in (0, 0x5a, 0xa5, 0xff):
            for identity in (0, 1, 127, 0xffffffff):
                reset()
                destination, descriptor = scratch+0x1000, scratch+0x3000
                u.mem_write(destination, bytes([poison])*0x130)
                value = bytes((i*19+poison) & 255 for i in range(0x58))
                u.mem_write(descriptor, value)
                u.reg_write(r.UC_X86_REG_RCX, destination)
                u.reg_write(r.UC_X86_REG_RDX, identity)
                u.reg_write(r.UC_X86_REG_R8, descriptor)
                require(run('component-info-new') == 'return', 'Initializer exit differs')
                require(bytes(u.mem_read(destination, 0x58)) == value
                        and get(destination+0x100, '<Q') == (identity,)
                        and bytes(u.mem_read(destination+0x108, 0x28)) == bytes(0x28), 'Initializer contract differs')
                cases.append(dict(contract='component-info defaults', poison=poison, identity=identity))
        # Exact public setters admit one hook pointer only; preexisting slots stop
        # before the native panic handler and must remain unchanged.
        for name, address in manifest['native_hook_setters'].items():
            role = 'hook-'+name.replace('on_', 'on-').replace('_', '-')
            # Retained roles use on-add, on-insert, on-replace, on-remove, on-despawn.
            offset = {'on_add': 0, 'on_insert': 8, 'on_replace': 16, 'on_remove': 24, 'on_despawn': 32}[name]
            for occupied in (0, 0x12345678):
                for hook in (0, 0x34567890):
                    reset()
                    pointer = scratch+0x1000
                    u.mem_write(pointer, bytes(40))
                    put(pointer+offset, '<Q', occupied)
                    u.reg_write(r.UC_X86_REG_RCX, pointer)
                    u.reg_write(r.UC_X86_REG_RDX, hook)
                    # The first conditional branch is the reviewed duplicate-hook exit.
                    lines = (EVIDENCE / ranges[role]['assembly']).read_text().splitlines()
                    branch = next(line.split()[-1] for line in lines if ' jne ' in line)
                    outcome = run(role, {int(branch, 16): 'occupied'})
                    expected = bytearray(40)
                    struct.pack_into('<Q', expected, offset, occupied if occupied else hook)
                    require(bytes(u.mem_read(pointer, 40)) == expected
                            and outcome == ('occupied' if occupied else 'return'), 'Hook setter contract differs')
                    cases.append(dict(contract='hook setter', hook=name, occupied=bool(occupied), value=hook))
        # Type-erased entity-clone writers. Preallocated scratch storage means no
        # allocation or growth callee can run. Component identity is synthetic.
        writer_rows = [('dynamic-terminal-writer', 'EndAction', 0x14012cb1d, 0x14012cb4d),
                       ('dynamic-interaction-writer', 'Interaction', 0x140129ebd, 0x140129eed),
                       ('reflected-interaction-writer', 'Interaction', 0x142620238, 0x142620268)]
        for role, component, wrong_type, consumed in writer_rows:
            for mode, value in [('copy', 0), ('copy', 1), ('copy', 2), ('copy', 255),
                                ('wrong descriptor flag', 1), ('wrong TypeId', 1), ('already written', 1)]:
                reset()
                builder, descriptor, queue, allocator, chunk = [scratch+x for x in (0x1000,0x2000,0x3000,0x4000,0x5000)]
                ids, pointers, cursor, source = [scratch+x for x in (0x6000,0x7000,0x9000,0xa000)]
                u.mem_write(builder, bytes(0x60))
                put(builder+0x10, '<Q', 73)
                put(builder+0x30, '<Q', queue)
                put(builder+0x38, '<Q', allocator)
                put(builder+0x48, '<Q', descriptor)
                put(builder+0x58, '<B', int(mode == 'already written'))
                put(descriptor, '<Q', int(mode != 'wrong descriptor flag'))
                identity = bytes.fromhex(manifest['typeids'][component]['bytes_hex'])
                u.mem_write(descriptor+8, bytes(16) if mode == 'wrong TypeId' else identity)
                put(queue, '<3Q', 4, ids, 0)
                put(queue+0x18, '<3Q', 4, pointers, 0)
                put(allocator+0x10, '<Q', chunk)
                put(chunk, '<Q', cursor-0x100)
                put(chunk+0x20, '<Q', cursor)
                if role == 'reflected-interaction-writer':
                    put(source, '<2Q', source+0x100, source+0x200)
                    put(source+0x100, '<B', value)
                    put(source+0x200, '<Q', 1)
                    u.mem_write(source+0x208, identity)
                    u.reg_write(r.UC_X86_REG_RCX, source)
                    u.reg_write(r.UC_X86_REG_RDX, builder)
                else:
                    u.reg_write(r.UC_X86_REG_RCX, builder)
                    u.reg_write(r.UC_X86_REG_RDX, value)
                before = bytes(u.mem_read(queue, 0x30))
                outcome = run(role, {wrong_type: 'type rejected', consumed: 'duplicate rejected'})
                if mode == 'copy':
                    require(outcome == 'return' and get(cursor-1, '<B') == (value,)
                            and get(ids, '<Q') == (73,) and get(pointers, '<Q') == (cursor-1,)
                            and get(queue+0x10, '<Q') == (1,) and get(queue+0x28, '<Q') == (1,)
                            and get(builder+0x58, '<B') == (1,), 'Clone writer copied different state')
                else:
                    require(outcome == ('duplicate rejected' if mode == 'already written' else 'type rejected')
                            and bytes(u.mem_read(queue, 0x30)) == before
                            and get(chunk+0x20, '<Q') == (cursor,), 'Rejected clone changed queue/storage')
                cases.append(dict(contract='entity-clone component writer', role=role, mode=mode, value=value))
        output = (ROOT / args.output).resolve()
        require(output.is_relative_to(ROOT / 'runtime'), 'Vector output must remain under runtime/')
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(portable_json(dict(target_sha256=target['sha256'], cases=cases), indent=2)+'\n')
    print(f"Terminal 0.108.0: {len(ranges)} native ranges, {calls} query calls, "
          f"{len(manifest['hook_mutation_diagnostics'])} hook diagnostic carriers and {len(cases)} bounded native vectors passed")


if __name__ == '__main__':
    main()
