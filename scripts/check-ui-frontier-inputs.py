#!/usr/bin/env python3
"""Replay current AS marker/font dispatch input contracts without compilation.

Scope stops at the custom marker record and font augmentation interfaces. The
original marker selector, publication and bounded dispatch prefixes execute;
font table input/case prefixes execute over original immutable table bytes.
"""
import argparse
import bisect
import hashlib
import json
import re
import struct

import capstone
import native_talent_fixture as native
from coverage_common import ROOT, file_sha256, json_text, latest_target

SHA = 'dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a'
OUT = ROOT / 'docs/analysis/evidence/0.112.0/ui-frontier-inputs.json'


def raw(address, size):
    offset = native.pe.rva_offset(address - native.pe.image_base)
    result = native.data[offset:offset + size]
    assert len(result) == size
    return result


def span(first, last):
    return dict(va=hex(first), end_exclusive=hex(last), byte_count=last - first,
                sha256=hashlib.sha256(raw(first, last - first)).hexdigest())


def target(table, index):
    return table + struct.unpack('<i', raw(table + index * 4, 4))[0]


class Machine(native.Machine):
    def __init__(self):
        self.stops, self.lookups = set(), []
        super().__init__()
        self.number = self.alloc(32)
        self.u.mem_write(self.number, b'\x02')
        self.put(self.number + 8, 2)
        self.u.mem_write(self.number + 16, struct.pack('<d', 0.0))

    def hook(self, uc, address, size, unused):
        if address in self.stops:
            uc.emu_stop()
            return
        if address == 0x142af6e90:
            pointer = uc.reg_read(native.UC_X86_REG_RCX)
            size = uc.reg_read(native.UC_X86_REG_RDX)
            self.lookups.append(bytes(uc.mem_read(pointer, size)).decode())
            sp = uc.reg_read(native.UC_X86_REG_RSP)
            uc.reg_write(native.UC_X86_REG_RAX, self.number)
            uc.reg_write(native.UC_X86_REG_RIP, self.q(sp))
            uc.reg_write(native.UC_X86_REG_RSP, sp + 8)
            self.seams.add(address)
            return
        super().hook(uc, address, size, unused)

    def run(self, first, stops, count=5000):
        self.stops = set(stops)
        try:
            self.u.emu_start(first, 0, count=count)
        except Exception as error:
            raise RuntimeError(f'Original prefix stopped at{self.u.reg_read(native.UC_X86_REG_RIP):#x}') from error
        position = self.u.reg_read(native.UC_X86_REG_RIP)
        assert position in self.stops, hex(position)
        self.stops.clear()
        return position

    def reg(self, name, value=None):
        register = getattr(native, 'UC_X86_REG_' + name)
        if value is None:
            return self.u.reg_read(register)
        self.u.reg_write(register, value)


def marker_inputs():
    vm = Machine()
    frame, stack = vm.S + 0x80000, vm.S + 0x180000
    value, json_object, state, storage = [vm.alloc(size) for size in (32, 32, 32, 128)]
    counter = vm.alloc(4)
    vm.put(state, 1, storage, 0)
    cases = []
    for kind, name, expected in [(3, name, {'donut': 1, 'line': 2, 'cone': 3}.get(name, 0))
            for name in ('', 'circle', 'donut', 'line', 'cone', 'DONUT', 'donuts', 'lines', 'cones', 'unknown')] + [
            (kind, '', 0) for kind in (0, 1, 2, 4, 5)]:
        vm.put(state, 1, storage, 0)
        vm.u.mem_write(value, bytes(32))
        vm.u.mem_write(value, bytes([kind]))
        text = vm.alloc(len(name) + 1)
        vm.u.mem_write(text, name.encode() + b'\0')
        vm.put(value + 0x10, text, len(name))
        for register, item in (('RAX', value), ('RBP', frame), ('RSP', stack),
                               ('RDI', json_object), ('R13', state), ('R15', counter), ('R12', 0)):
            vm.reg(register, item)
        vm.lookups = []
        # This executes the complete original shape selection and subsequent
        # custom JSON scalar decoding until the selector's actual frame store.
        vm.run(0x140101374, {0x1401021c7})
        shape = struct.unpack('<I', vm.u.mem_read(frame + 0xc0, 4))[0]
        assert shape == expected, (kind, name, shape, expected)
        vm.reg('R13', state)
        vm.reg('R12', 0)
        vm.reg('RDI', 0)
        vm.reg('RBX', storage)
        vm.run(0x140102240, {0x140102334})
        assert vm.q(state + 16) == 1
        assert struct.unpack('<I', vm.u.mem_read(storage + 0x54, 4))[0] == shape
        vm.reg('R15', storage)
        vm.reg('RDX', storage + 0x60)
        vm.run(0x140103140, {0x1401033c0})
        first = vm.reg('RAX')
        assert first == target(0x145dbe1a4, shape)
        vm.reg('R15', storage)
        vm.reg('RDX', storage + 0x60)
        vm.reg('XMM12', int.from_bytes(struct.pack('<f', 1.0), 'little'))
        vm.run(0x1401045a2, {0x1401048d0})
        second = vm.reg('RAX')
        assert second == target(0x145dbe1b4, shape)
        cases.append(dict(json_tag=kind, shape=name, selector=shape, published_record_offset='0x54',
                          geometry_destinations=[hex(first), hex(second)], lookup_keys=vm.lookups))
    source = (ROOT / 'crates/azeroth-survivors-re/src/raid_markers.rs').read_text()
    for name, variant in (('donut', 'Donut'), ('line', 'Line'), ('cone', 'Cone')):
        assert f'Some("{name}") => Shape::{variant}' in source
    assert '_ => Shape::Circle' in source
    geometry = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/raid_markers/geometry.rs').read_text()
    assert all('Shape::' + variant in geometry for variant in ('Circle', 'Donut', 'Line', 'Cone'))
    return dict(cases=cases, selector_domain=[0, 1, 2, 3], native_record_stride=128,
                native_selector_record_offset='0x54',
                ranges=[span(a, b) for a, b in ((0x140101374, 0x1401021c7), (0x140102240, 0x140102334),
                    (0x140103140, 0x140103195), (0x1401033b0, 0x1401033c2),
                    (0x1401045a2, 0x140104611), (0x1401048c0, 0x1401048d2))],
                fixture_seams=[hex(address) for address in sorted(vm.seams)])


def font_inputs():
    vm = Machine()
    frame, stack = vm.S + 0x80000, vm.S + 0x180000
    source = (ROOT / 'crates/azeroth-survivors-re/src/font_patch.rs').read_text()
    literals = source.split('const COMPOSITES:', 1)[1].split('const MIRRORS:', 1)[0]
    tuples = [tuple(int(value.strip(), 0) for value in row.split(','))
              for row in re.findall(r'\((0x[0-9a-f]+, 0x[0-9a-f]+, 0x[0-9a-f]+, \d+)\)', literals)]
    assert len(tuples) == 41
    composites = []
    for index, row in enumerate(tuples):
        address = 0x146c0cfa8 + index * 16
        native_row = struct.unpack('<IIIB3x', raw(address, 16))
        assert native_row == row
        vm.reg('RBP', frame)
        vm.reg('RSP', stack)
        vm.reg('RDI', index * 16)
        vm.run(0x1459768e0, {0x14597691c})
        mode = vm.u.mem_read(frame + 0x1f0, 1)[0]
        assert mode == row[3] and mode <= 4
        vm.run(0x1459769cf, {0x145976a64})
        destination = vm.reg('RAX')
        assert destination == target(0x146f44f30, mode)
        composites.append(dict(index=index, codepoints=list(row[:3]), mode=mode, destination=hex(destination)))
    # A separate switch handles font-table tag initials after an exact encoded
    # subtraction/unsigned guard; it is unrelated to composite placement modes.
    item = vm.alloc(24)
    table_cases = []
    for first in range(256):
        vm.u.mem_write(item, bytes([first]) + bytes(23))
        vm.reg('RBP', frame)
        vm.reg('RSP', stack)
        vm.reg('R14', item)
        vm.put(frame + 0x1c8, item + 24)
        stop = vm.run(0x145977e45, {0x145978009, 0x1459782dd})
        admitted = 0x44 <= first <= 0x70
        assert (stop == 0x145978009) == admitted
        assert vm.reg('R15') == 0x146f44f44
        if admitted:
            destination = vm.reg('RAX')
            assert destination == target(0x146f44f44, first - 0x44)
            table_cases.append(dict(first_byte=first, selector=first - 0x44, destination=hex(destination)))
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    decoder.detail = True
    instructions = list(decoder.disasm(raw(0x145977e45, 0x145978354 - 0x145977e45), 0x145977e45))
    writes = [instruction.address for instruction in instructions
              if any(instruction.reg_name(register) in ('r15', 'r15d', 'r15w', 'r15b')
                     for register in instruction.regs_access()[1])]
    assert writes == [0x145977e45]
    return dict(composites=composites, composite_mode_domain=list(range(5)),
                immutable_composite_table=span(0x146c0cfa8, 0x146c0cfa8 + 41 * 16),
                font_tag_guard_cases=256, font_tag_admitted_cases=table_cases,
                font_tag_hoisted_base='0x146f44f44', hoisted_base_explicit_register_writes=[hex(address) for address in writes],
                ranges=[span(a, b) for a, b in ((0x1459768de, 0x145976934), (0x1459769cf, 0x145976a66),
                    (0x145977e45, 0x145977e51), (0x145977fd4, 0x14597800b))])


def direct_ui_callers():
    """Independent executable-byte scan, checked against unwind instruction starts."""
    selected = {0x140056fa0, 0x1400fd960, 0x14012de80, 0x140136fa0, 0x14013be20, 0x1401884e0,
                0x1400f59e0, 0x140161580, 0x1402ae4d0, 0x14012e6b0, 0x14012b3d0}
    extents = sorted((native.pe.image_base + a, native.pe.image_base + b)
                     for a, b, unused in native.pe.functions())
    starts, decoded = [a for a, b in extents], {}
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    result = []
    for section in native.pe.sections:
        if not int(section['characteristics'], 16) & 0x20000000:
            continue
        base = native.pe.image_base + section['rva']
        content = native.data[section['raw_offset']:section['raw_offset'] + section['raw_size']]
        for offset in range(len(content) - 4):
            if content[offset] not in (0xe8, 0xe9):
                continue
            destination = base + offset + 5 + struct.unpack_from('<i', content, offset + 1)[0]
            if destination not in selected:
                continue
            address = base + offset
            index = bisect.bisect_right(starts, address) - 1
            assert index >= 0
            first, last = extents[index]
            assert first <= address < last
            if first not in decoded:
                rows = list(decoder.disasm(raw(first, last - first), first))
                assert rows[-1].address + rows[-1].size == last
                decoded[first] = {row.address: row for row in rows}
            instruction = decoded[first].get(address)
            assert instruction is not None and instruction.size == 5
            assert instruction.mnemonic == ('call' if content[offset] == 0xe8 else 'jmp')
            result.append(dict(site=hex(address), target=hex(destination), kind=instruction.mnemonic,
                               declared_owner=hex(first), owner_bytes=span(first, last)))
    assert len(result) == 20 and all(row['kind'] == 'call' for row in result)
    return result


def options_publication():
    vm = Machine()
    frame, stack = vm.S + 0x80000, vm.S + 0x180000
    resource, storage = vm.alloc(0x200), vm.alloc(56 * 2)
    rows = []
    # These are actual header stores in the current click handler. Payloads
    # are controlled, and operation bodies/IO are deliberately not executed.
    writers = [(0x14013ca68, 0x14013ca79, 5), (0x14013cb26, 0x14013cb37, 8),
               (0x14013ce0a, 0x14013ce1b, 7), (0x14013d090, 0x14013d0a1, 1),
               (0x14013d2ab, 0x14013d2bc, 0), (0x14013d33b, 0x14013d34c, 0)]
    for writer, stop, selector in writers:
        vm.reg('RBP', frame)
        vm.reg('RSP', stack)
        vm.u.mem_write(frame + 0x80, bytes(range(56)))
        vm.run(writer, {stop})
        before = bytes(vm.u.mem_read(frame + 0x80, 56))
        assert vm.q(frame + 0x80) == 0x8000000000000000 + selector
        vm.put(resource + 0x30, 2, storage, 1)
        vm.put(frame + 0xf8, resource)
        vm.reg('R15', 1)
        vm.run(0x14013d0b8, {0x14013d103})
        assert vm.q(resource + 0x40) == 2
        assert bytes(vm.u.mem_read(storage + 56, 56)) == before
        vm.reg('RAX', resource)
        vm.run(0x140137227, {0x140137257})
        assert (vm.q(frame + 0xc20), vm.q(frame + 0xc28), vm.q(frame + 0xc30)) == (2, storage, 2)
        assert (vm.q(resource + 0x30), vm.q(resource + 0x38), vm.q(resource + 0x40)) == (0, 8, 0)
        vm.reg('RAX', vm.q(frame + 0xc28) + 56)
        vm.run(0x140137875, {0x140137943})
        destination = vm.reg('R13')
        assert destination == target(0x145dc96b8, selector)
        rows.append(dict(writer=hex(writer), selector=selector, destination=hex(destination),
                         exact_record_sha256=hashlib.sha256(before).hexdigest()))
    return dict(record_stride=56, resource_vec_offsets=['0x30', '0x38', '0x40'],
                click_writer_cases=rows, table=span(0x145dc96b8, 0x145dc96b8 + 9 * 4),
                table_targets=[hex(target(0x145dc96b8, i)) for i in range(9)],
                ranges=[span(a, b) for a, b in [(a, b) for a, b, c in writers] + [
                    (0x14013d0b8, 0x14013d103), (0x140137227, 0x140137257),
                    (0x140137875, 0x140137946), (0x14013622a, 0x140136282)]])


def options_descriptor_inputs():
    vm = Machine()
    frame, stack = vm.S + 0x80000, vm.S + 0x180000
    holder, resource = vm.alloc(8), vm.alloc(0x200)
    vm.put(holder, resource)
    categories = sorted({raw(0x145dc2250 + i * 0x98 + 0x91, 1)[0] for i in range(105)})
    enumerations, rows = [], []
    for category in categories:
        assert category not in (6, 11)  # These pages use distinct builders.
        vm.reg('RBP', frame)
        vm.reg('RSP', stack)
        vm.reg('RAX', category)
        vm.reg('RSI', holder)
        vm.reg('RBX', holder)
        vm.u.mem_write(resource + 0x1c2, bytes([category]))
        vm.put(frame + 0x580, resource)
        vm.run(0x1402b16d0, {0x1402b16e4})
        assert vm.reg('RDI') == 0x145dc2250 and vm.reg('R13') == vm.reg('R15') == 0
        current, indices = (0x1402b178a if category == 10 else 0x1402b173a), []
        while True:
            stop = vm.run(current, {0x1402b1774, 0x1402b17b4, 0x1402b1836, 0x1402b1821})
            if stop in (0x1402b1836, 0x1402b1821):
                break
            index = vm.reg('R15')
            assert vm.reg('R13') == index * 0x98
            assert vm.reg('R9') == 0x145dc2250 + index * 0x98
            indices.append(index)
            # A call receives this record, index and public builder context.
            # Its Windows ABI nonvolatile registers retain the loop cursor.
            current = 0x1402b1779 if stop == 0x1402b1774 else 0x1402b17b9
        assert indices == [i for i in range(105) if raw(0x145dc2250 + i * 0x98 + 0x91, 1)[0] == category]
        enumerations.append(dict(category=category, descriptor_indices=indices))
    assert sorted(i for row in enumerations for i in row['descriptor_indices']) == list(range(105))
    for index in range(105):
        record = 0x145dc2250 + index * 0x98
        control = struct.unpack('<Q', raw(record + 0x40, 8))[0]
        vm.reg('RBP', frame)
        vm.reg('RSP', stack)
        vm.reg('RSI', record)
        stop = vm.run(0x1402aea06, {0x1402aea2b, 0x1402af0b4, 0x1402afcdf})
        if stop == 0x1402aea2b:
            assert control <= 4
            vm.run(stop, {0x1402aea49})
            assert bytes(vm.u.mem_read(frame + 0x10, 24)) == raw(record + 0x40, 24)
            vm.reg('RDX', frame + 0x10)
            vm.run(0x14012deb6, {0x14012dec7})
            assert vm.reg('RAX') == target(0x145dc9678, control)
        rows.append(dict(index=index, control=control, route=hex(stop),
                         formatter_destination=hex(target(0x145dc9678, control)) if control <= 4 else None))
    # This builder has no indirect branches. Prove that the other branch's
    # reuse of frame+0x10 cannot flow into the formatter call, and that the
    # descriptor control-copy store dominates that call. Calls retain a
    # separate external-write contract; this is an intra-procedure CFG proof.
    first = 0x1402ae4d0
    last = next(native.pe.image_base + b for a, b, u in native.pe.functions() if native.pe.image_base + a == first)
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    instructions = list(decoder.disasm(raw(first, last - first), first))
    assert instructions[-1].address + instructions[-1].size == last
    nodes = {i.address: i for i in instructions}
    graph = {}
    for instruction in instructions:
        following = instruction.address + instruction.size
        if instruction.mnemonic.startswith('j'):
            assert instruction.op_str.startswith('0x'), instruction.op_str
            edges = [int(instruction.op_str, 16)]
            if instruction.mnemonic != 'jmp':
                edges.append(following)
        elif instruction.mnemonic in ('ret', 'ud2', 'int3'):
            edges = []
        else:
            edges = [following]
        graph[instruction.address] = [edge for edge in edges if edge in nodes]
    def reaches(start, end, excluded=()):
        pending, seen = [start], set(excluded)
        while pending:
            at = pending.pop()
            if at in seen:
                continue
            if at == end:
                return True
            seen.add(at)
            pending.extend(graph[at])
        return False
    assert reaches(first, 0x1402afdf7)
    assert not reaches(first, 0x1402afdf7, (0x1402aea45,))
    assert not reaches(0x1402af2e3, 0x1402afdf7)
    return dict(descriptor_count=105, enumerations=enumerations, controls=rows,
                formatter_control_domain=sorted({row['control'] for row in rows if row['control'] <= 4}),
                builder_frame_copy_dominates_formatter=True, reused_frame_branch_cannot_reach_formatter=True,
                table=span(0x145dc2250, 0x145dc2250 + 105 * 0x98),
                ranges=[span(a, b) for a, b in ((0x1402b16d0, 0x1402b16e4), (0x1402b1730, 0x1402b17c2),
                    (0x14012b3e6, 0x14012b3e9), (0x14012b736, 0x14012b775), (0x1402ae72e, 0x1402ae732), (first, last),
                    (0x14012deb6, 0x14012dec9))])


def action_publication():
    vm = Machine()
    frame, stack = vm.S + 0x80000, vm.S + 0x180000
    commands, storage, body = vm.alloc(24), vm.alloc(0x300), vm.alloc(0x238)
    slots = []
    for slot in range(19):
        vm.reg('RBP', frame)
        vm.reg('RSP', stack)
        vm.reg('R15', slot)
        vm.run(0x1400f5deb, {0x1400f5dfc})
        assert struct.unpack('<I', vm.u.mem_read(frame + 0x2c8, 4))[0] == 7
        assert vm.u.mem_read(frame + 0x2cc, 1)[0] == slot
        # The unchanged command publisher copies the full bundle and entity.
        vm.reg('R15', commands)
        vm.reg('R13', 0)
        vm.reg('R12', frame + 0xf0)
        vm.reg('R14', 0x12345678)
        vm.put(commands, 0x300, storage, 0)
        vm.run(0x14023ad1b, {0x14023ad53})
        assert vm.q(commands + 16) == 0x240 and vm.q(storage) == 0x1402cefd0
        assert bytes(vm.u.mem_read(storage + 8, 0x230)) == bytes(vm.u.mem_read(frame + 0xf0, 0x230))
        assert vm.q(storage + 0x238) == 0x12345678
        # Queue callback copies the exact bundle to its typed insertion call.
        cursor = vm.alloc(8)
        vm.reg('RCX', storage + 8)
        vm.reg('RDX', body)
        vm.reg('R8', cursor)
        vm.reg('RSP', stack - 8)
        vm.run(0x1402cefd0, {0x1402cf004})
        insert = vm.reg('RCX')
        assert bytes(vm.u.mem_read(insert, 0x238)) == bytes(vm.u.mem_read(storage + 8, 0x238))
        action = insert + 0x1d8
        vm.reg('RSI', action)
        vm.run(0x1400fde09, {0x1400fde26})
        assert vm.reg('RCX') == target(0x145dbe164, 5)
        slots.append(dict(slot=slot, native_tag=7, consumer_selector=5, destination=hex(vm.reg('RCX'))))
    cosmetics = []
    for index in range(7):
        entry = 0x145e07600 + index * 64
        item = struct.unpack('<I', raw(entry + 0x30, 4))[0]
        slot = raw(entry + 0x3c, 1)[0]
        for available in (0, 1):
            for shown in (0, 1):
                vm.reg('RSP', stack)
                vm.reg('R14', commands)
                vm.reg('R15', 0)
                vm.reg('RDI', entry)
                vm.reg('RDX', item)
                vm.reg('RBP', shown)
                vm.u.mem_write(stack + 0x2b, bytes([available]))
                vm.put(stack + 0x3a0, commands, commands)
                vm.put(stack + 0x388, 0x12345678)
                vm.put(commands, 0x300, storage, 0)
                vm.run(0x1401619ec, {0x1401619f7, 0x140161b60})
                if available:
                    vm.run(0x1401619f7, {0x140161b5a})
                    assert vm.q(commands + 16) == 0x68 and vm.q(storage) == 0x1402d3ac0
                    assert vm.u.mem_read(storage + 8, 2) == bytes([3, slot])
                    assert struct.unpack('<II', vm.u.mem_read(storage + 12, 8)) == (1 - shown, item)
                    cursor = vm.alloc(8)
                    vm.reg('RCX', storage + 8)
                    vm.reg('RDX', body)
                    vm.reg('R8', cursor)
                    vm.reg('RSP', stack - 8)
                    vm.run(0x1402d3ac0, {0x1402d3b0e})
                    insert = vm.reg('RCX')
                    assert bytes(vm.u.mem_read(insert, 0x60)) == bytes(vm.u.mem_read(storage + 8, 0x60))
                    vm.reg('R10', insert)
                    vm.run(0x140188a80, {0x140188a92})
                    assert vm.reg('RCX') == 0x140188c46
                else:
                    assert vm.q(commands + 16) == 0
                cosmetics.append(dict(id=item, slot=slot, available=bool(available), shown=bool(shown),
                                      command_published=bool(available), optional_item_present=bool(available and not shown)))
    source = (ROOT / 'crates/azeroth-survivors-re/src/armory.rs').read_text()
    assert 'for slot in equipment_slots(catalog, state.class_id(), gear)' in source and 'ArmoryAction::Slot(slot)' in source
    source = (ROOT / 'crates/azeroth-survivors-re/src/progression/rewards.rs').read_text()
    assert 'if available {\n        card.insert((' in source
    assert 'Action::ShowCosmetic(entry.slot, (!shown).then_some(entry.id))' in source
    return dict(armory_slots=slots, reward_cosmetics=cosmetics,
                armory_command=dict(callback='0x1402cefd0', stride=0x240, bundle_bytes=0x230,
                                    action_bundle_offset='0x1d8', insert_call='0x1401751f0'),
                rewards_command=dict(callback='0x1402d3ac0', stride=0x68, action_command_offset='0x8',
                                     insert_call='0x140180cc0'),
                ranges=[span(a, b) for a, b in ((0x1400f5deb, 0x1400f5dfc), (0x14023ad1b, 0x14023ad53),
                    (0x1400f5a0d, 0x1400f5a1f), (0x140290110, 0x140290133),
                    (0x1402cefd0, 0x1402cf009), (0x1400fde09, 0x1400fde28), (0x1401619ec, 0x1401619f7),
                    (0x1401619f7, 0x140161b5a), (0x1402d3ac0, 0x1402d3b13), (0x140188a80, 0x140188a94))])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    selected = latest_target(verify=True)
    assert selected['version'] == '0.112.0' and selected['sha256'] == SHA
    result = dict(schema_version=1, target={key: selected[key] for key in ('version', 'path', 'sha256', 'size_bytes')},
        generator=dict(path='scripts/check-ui-frontier-inputs.py', sha256=file_sha256(ROOT / 'scripts/check-ui-frontier-inputs.py')),
        marker=marker_inputs(), font=font_inputs(), direct_ui_callers=direct_ui_callers(),
        options=options_publication(), options_descriptors=options_descriptor_inputs(), action_publication=action_publication(),
        source=[dict(path=path, sha256=file_sha256(ROOT / path)) for path in (
            'crates/azeroth-survivors-re/src/raid_markers.rs',
            'crates/azeroth-survivors-re/src/gameplay/raid_markers/geometry.rs',
            'crates/azeroth-survivors-re/src/font_patch.rs',
            'crates/azeroth-survivors-re/src/armory.rs',
            'crates/azeroth-survivors-re/src/progression/rewards.rs')],
        limits=['Marker JSON lookup is supplied as a numeric serde Value with tag2, number variant2 and finite f64 zero. Original selector, scalar decoder, publication and dispatch prefixes execute; geometry bodies do not.',
                'Font mode scenarios execute immutable table-load and dispatch prefixes with a controlled frame. Glyph lookup/parser callbacks are not executed, and no whole-font augmentation or rendering parity is claimed.',
                'Hoisted R15 has no explicit or partial-register writer inside the selected loop after its initial LEA. Calls rely on the Windows ABI nonvolatile-register contract; no generic font parser reconstruction is attempted.',
                'Executable E8/E9 scanning validates actual instruction starts within PE unwind extents independently of census references. This is a direct-transfer check for eleven selected entries, not indirect-caller or global ownership completeness.',
                'Options cases execute six original literal header stores and exact append/take/dispatch prefixes over controlled payloads. They do not execute operation bodies or establish every queue writer/negative niche.',
                'Options descriptor cases execute the immutable105-row category iterator and builder control-copy/formatter prefixes. Complete intra-procedure CFG edges establish control-copy dominance and separation from the reused frame branch; external calls/Windows ABI and arbitrary indirect builder callers remain interface boundaries.',
                'Armory and Rewards execute selected AS header writers, actual command publication and callback copies to typed insertion calls1401751f0/140180cc0. The fixture then supplies that exact action field to each consumer prefix. Generic ECS insertion/query registration identity and component alias lifetimes are not executed or proved.',
                'The source interface matches the recovered custom inputs. This does not assign native Ghidra function ownership or globally admit new dispatch tables.',
                'No compiler, reconstructed Rust execution, game, save I/O, font file write or original/rebuilt comparison.'],
        gap_ids=[41], compilation_run=False, game_run=False, parity_verified=False)
    if args.write:
        OUT.write_text(json_text(result))
    else:
        assert json.loads(OUT.read_text()) == result
    print(f"Checked 15 marker cases, 41 font records, 256 font guards, 20 direct UI calls, 105 Options descriptor rows, 6 Options queue cases, 19 Armory slot and 28 Rewards action cases; no compiler/game")


if __name__ == '__main__':
    main()
