#!/usr/bin/env python3
"""Replay current custom DBC dictionary producers without compilation or a game.

Existing canonical reader/UTF-8/producer ranges are reused. Native loops and
string/field selection execute; allocation, memcpy, hash and map insertion are
explicit seams. Original replacement-branch instructions check last-row wins
separately. Display-ID collection and deduplication execute with allocation and
sorting seams. No files inside an MPQ or native OS callees execute.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target
EVIDENCE = ROOT / 'docs/analysis/evidence/0.105.0/custom-dbc'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', default='runtime/gap41-dbc-consumers/checks.json')
    args = parser.parse_args()
    output = (ROOT / args.output).resolve()
    assert output.is_relative_to(ROOT / 'runtime')
    sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    current = json.loads((EVIDENCE / 'dictionary-consumers.json').read_text())
    assert target['sha256'] == current['target_sha256']
    original = json.loads((EVIDENCE / 'manifest.json').read_text())
    data = (ROOT / target['path']).read_bytes()
    module = load_script('pe', ROOT / 'scripts/inventory-executable.py')
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    ranges = []
    for row in original['ranges'] + current['ranges']:
        start = int(row['virtual_address'], 16)
        end = start + row['byte_count']
        assert hashlib.sha256(raw(start, end - start)).hexdigest() == row['sha256']
        for key in ('assembly', 'pseudocode'):
            if key in row:
                assert hashlib.sha256((EVIDENCE / row[key]).read_bytes()).hexdigest() == row[key + '_sha256']
        if row['role'] != 'utf8-width-table': ranges.append((start, end))
    for row in current['collector']['data_spans']:
        assert hashlib.sha256(raw(int(row['address'], 16), row['byte_count'])).hexdigest() == row['sha256']
    for row in current['tables']:
        assert raw(int(row['address'], 16), row['byte_count']).hex() == row['bytes_hex']
    for row in current['calls']:
        site, to = int(row['site'], 16), int(row['target'], 16)
        value = raw(site, 5)
        assert value[0] == 0xE8 and site + 5 + struct.unpack_from('<i', value, 1)[0] == to
    for reference in current['canonical_consumers']:
        manifest = (EVIDENCE / reference['manifest']).resolve()
        assert manifest.is_relative_to(ROOT / 'docs/analysis/evidence')
        evidence = json.loads(manifest.read_text())
        assert evidence['target_sha256'] == target['sha256']
        row = next(row for row in evidence['native_ranges'] if row['role'] == reference['owner'])
        address = int(row['virtual_address'], 16)
        assert hashlib.sha256(raw(address, row['byte_count'])).hexdigest() == row['sha256']
        for kind in ('assembly', 'pseudocode'):
            assert hashlib.sha256((manifest.parent / row[kind]).read_bytes()).hexdigest() == row[kind + '_sha256']
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(section['rva'] + section['raw_size'] for section in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        off, count = section['raw_offset'], section['raw_size']
        machine.mem_write(pe.image_base + section['rva'], data[off:off + count])
    scratch, size = 0x200000000, 0x60000
    machine.mem_map(scratch, size)
    stop = scratch + size - 0x10
    context, seams = {}, set()

    def read(name): return machine.reg_read(getattr(reg, 'UC_X86_REG_' + name))
    def write(name, value): machine.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
    def word(address): return struct.unpack('<Q', machine.mem_read(address, 8))[0]
    def put(address, value): machine.mem_write(address, struct.pack('<Q', value & ((1 << 64) - 1)))
    def string(address, count): return bytes(machine.mem_read(address, count)).decode() if count else ''

    def hook(_, address, count, unused):
        if address in context['stops']:
            machine.emu_stop(); return
        if address in (0x140002200, 0x1400021C0, 0x1400021D0, 0x145BC977B,
                       0x1458BA8B0, 0x1407CF030, 0x1458BA640, 0x140D8AA00,
                       0x145BCB2D0, 0x145AE9780):
            seams.add(hex(address))
            if address == 0x1400021C0:
                pointer = context['arena']; context['arena'] = (pointer + read('RCX') + 15) & ~15
                assert context['arena'] < scratch + 0x50000
                write('RAX', pointer)
            elif address == 0x145BCB2D0:
                # Fixed scratch capacity substitutes only Vec allocation/growth.
                vector = read('RCX')
                assert word(vector) == 0
                put(vector, 0x4000); put(vector + 8, scratch + 0x20000)
            elif address == 0x145AE9780:
                pointer, length = read('RCX'), read('RDX')
                values = sorted(struct.unpack('<' + 'I' * length, machine.mem_read(pointer, length * 4)))
                machine.mem_write(pointer, struct.pack('<' + 'I' * length, *values))
            elif address == 0x145BC977B:
                machine.mem_write(read('RCX'), bytes(machine.mem_read(read('RDX'), read('R8'))))
                write('RAX', read('RCX'))
            elif address == 0x1458BA8B0:
                context['result'][read('RDX') & 0xFFFFFFFF] = string(read('R8'), read('R9'))
                write('RAX', 0)
            elif address == 0x1407CF030:
                payload = read('R9')
                context['result'][read('R8') & 0xFFFFFFFF] = string(word(payload + 8), word(payload + 16))
                put(read('RCX'), -1)
            elif address == 0x1458BA640:
                payload = read('R9')
                context['result'][read('R8') & 0xFFFFFFFF] = dict(
                    name=string(word(payload + 8), word(payload + 16)),
                    icon=string(word(payload + 32), word(payload + 40)),
                    dispel=string(word(payload + 48), word(payload + 56)))
                put(read('RCX'), -1)
            elif address == 0x140D8AA00:
                # Deterministic collisions exercise the native key comparison.
                write('RAX', 0)
            sp = read('RSP'); write('RIP', word(sp)); write('RSP', sp + 8); return
        assert any(lo <= address and address + count <= hi for lo, hi in ranges), hex(address)
        assert bytes(machine.mem_read(address, count)) == raw(address, count)

    def on_write(_, access, address, count, value, unused):
        assert scratch <= address and address + count <= scratch + size, hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)
    machine.hook_add(UC_HOOK_MEM_WRITE, on_write)

    def reset(stops=()):
        machine.mem_write(scratch, bytes(size)); machine.mem_write(stop, b'\xcc')
        context.update(arena=scratch + 0x20000, result={}, stops=set(stops) | {stop})
        for name in ('RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15', 'RBP'):
            write(name, 0)
        write('RSP', scratch + 0x1F000); put(read('RSP'), stop); write('EFLAGS', 2)

    def run(start):
        machine.emu_start(start, 0, count=100000)
        assert read('RIP') in context['stops']

    def table(rows, fields, string_fields, declared_fields=None):
        strings = bytearray(b'\0'); records = bytearray()
        for values in rows:
            encoded = list(values)
            for field in string_fields:
                value = encoded[field]
                if isinstance(value, str): value = value.encode()
                encoded[field] = len(strings); strings.extend(value + b'\0')
            records.extend(struct.pack('<' + 'I' * fields, *encoded))
        return b'WDBC' + struct.pack('<4I', len(rows), fields if declared_fields is None else declared_fields,
                                     fields * 4, len(strings)) + records + strings

    def seat(value, descriptor=scratch + 0x1000, buffer=scratch + 0x5000):
        machine.mem_write(buffer, value)
        rows, fields, stride, strings = struct.unpack_from('<4I', value, 4)
        machine.mem_write(descriptor, struct.pack('<QQQQIII', len(value), buffer, len(value),
                                                 20 + rows * stride, rows, fields, stride))
        return descriptor

    vectors = []
    # Icon producer keeps empty strings and replaces duplicate keys.
    for rows in [[], [[0, 'Icon0']], [[7, 'Old'], [7, 'New'], [8, '']], [[4, b'\xff'], [5, 'Zażółć']]]:
        reset(); value = table(rows, 2, [1]); desc = seat(value)
        iterator, target_map = scratch + 0x2000, scratch + 0x3000
        machine.mem_write(iterator, struct.pack('<QII', desc, 0, len(rows)))
        put(target_map + 0x10, 100)
        write('RCX', target_map); write('RDX', iterator); run(0x1458B9140)
        expected = {row[0]: row[1] if isinstance(row[1], str) else '' for row in rows}
        assert context['result'] == expected
        vectors.append(dict(kind='SpellIcon ID/string dictionary', output=context['result']))
    item_rows = [[7, 0, 0, 0, 0, 'First'], [7, 0, 0, 0, 0, 'Second'],
                 [8, 0, 0, 0, 0, ''], [8, 0, 0, 0, 0, 'Hidden'], [9, 0, 0, 0, 0, b'\xff']]
    for requested in [[], [7], [8], [9], [99], [7, 8, 9, 99, 7]]:
        reset(); desc = seat(table(item_rows, 6, [5])); iterator = scratch + 0x2000
        ids = scratch + 0x3000
        if requested: machine.mem_write(ids, struct.pack('<'+'I'*len(requested), *requested))
        machine.mem_write(iterator, struct.pack('<QQQQ', ids, ids, 0, ids + len(requested) * 4))
        write('RCX', iterator); write('RDX', desc); write('R8', scratch + 0x4000)
        run(0x1459AD750)
        expected = {7: 'First'} if 7 in requested else {}
        assert context['result'] == expected
        vectors.append(dict(kind='Requested ItemDisplayInfo icons', requested=requested, output=context['result']))
    # Metadata loop uses base column120 even when another locale is populated;
    # custom header accepts a declared field count independent of row stride.
    for dispel in [0, 1, 2, 3, 4, 5, 0xFFFFFFFF]:
        for icon_id in [0, 7, 99]:
            reset(); row = [0] * 122
            row[0], row[4], row[117], row[120], row[121] = 42, dispel, icon_id, 'Base name', 'Other locale'
            desc = seat(table([row], 122, [120, 121], declared_fields=1))
            icons, controls = scratch + 0x2000, scratch + 0x3000
            machine.mem_write(controls, b'\0\0' + b'\xff' * 30)
            put(icons, controls); put(icons + 8, 15); put(icons + 0x18, 2)
            for index, key in enumerate([0, 7]):
                text = ('Zero icon' if key == 0 else 'Seven icon').encode(); pointer = scratch + 0x4000 + index * 100
                machine.mem_write(pointer, text)
                machine.mem_write(controls - (index + 1) * 24, struct.pack('<IIQQ', key, 0, pointer, len(text)))
            iterator = scratch + 0x1500
            machine.mem_write(iterator, struct.pack('<QQII', desc, icons, 0, 1))
            write('RCX', iterator); write('RDX', scratch + 0x3500); run(0x1459B2E30)
            expected = dict(name='Base name', icon={0:'Zero icon',7:'Seven icon'}.get(icon_id,''),
                            dispel={1:'Magic',2:'Curse',3:'Disease',4:'Poison'}.get(dispel,''))
            assert context['result'] == {42: expected}, (dispel, icon_id, context['result'])
            vectors.append(dict(kind='Spell metadata', dispel=dispel, icon_id=icon_id, output=expected))
    # Original loader header blocks: compare branches without replacing the
    # arithmetic. Stop before result construction/cleanup and OS-facing callees.
    header_cases = [
        (b'', 0, False),
        (b'WDBC' + bytes(15), 19, False),
        (b'XDBC' + bytes(16), 20, False),
        (b'WDBC' + struct.pack('<4I', 0, 0, 0, 0), 20, True),
        (b'WDBC' + struct.pack('<4I', 2, 999, 8, 3), 39, True),
        (b'WDBC' + struct.pack('<4I', 2, 999, 8, 3), 38, False),
        (b'WDBC' + struct.pack('<4I', 0x80000000, 0, 2, 1), 21, True),
        (b'WDBC' + struct.pack('<4I', 0xFFFFFFFF, 1, 4, 0xFFFFFFFF), 100, False),
    ]
    for start, success, invalid, short, pointer_reg, length_reg, base_reg in [
        (0x1458C036E, 0x1458C03AC, 0x1458C0911, 0x1458C0955, 'R11', 'RAX', 'R8'),
        (0x1458C0457, 0x1458C0495, 0x1458C0933, 0x1458C09B4, 'R11', 'RAX', 'R8'),
        (0x1458BF0F6, 0x1458BF13A, 0x1458BF409, 0x1458BF421, 'R12', 'RBX', 'RDX'),
    ]:
        for value, file_length, expected in header_cases:
            reset([success, invalid, short]); pointer = scratch + 0x5000
            if value: machine.mem_write(pointer, value)
            write('RBP', scratch + 0x18000)
            write(pointer_reg, pointer); write(length_reg, file_length)
            run(start)
            accepted = read('RIP') == success
            assert accepted == expected, (hex(start), value.hex(), file_length)
            if accepted:
                rows, _, stride, _ = struct.unpack_from('<4I', value, 4)
                assert read(base_reg) == 20 + ((rows * stride) & 0xFFFFFFFF)
            vectors.append(dict(kind='Header admission', owner=hex(start), header=value.hex(),
                                actual_file_length=file_length, accepted=accepted))
    # Run original occupied-bucket writes, separately from the producer seams.
    reset([0x1458BA9BA]); bucket = scratch + 0x8000
    old_pointer, new_pointer = scratch + 0x9000, scratch + 0xA000
    put(bucket - 16, old_pointer); put(bucket - 8, 3)
    write('RCX', bucket); write('R12', 0); write('RDI', new_pointer); write('RSI', 0)
    # The taken jump leaves this block at 1458baa0c; stop before its epilogue.
    context['stops'].add(0x1458BAA0C); run(0x1458BA9A4)
    assert (word(bucket - 16), word(bucket - 8), read('RAX'), read('RDX')) == (new_pointer, 0, old_pointer, 3)
    vectors.append(dict(kind='Original SpellIcon replacement', replaced_with_empty=True))
    reset([0x1458BA834]); bucket = scratch + 0x8000
    payload, previous = scratch + 0x9000, scratch + 0xA000
    old, new = bytes(range(64)), bytes(reversed(range(64)))
    machine.mem_write(bucket - 64, old); machine.mem_write(payload, new)
    write('RAX', bucket); write('R15', 0); write('RSI', previous)
    write('RBP', scratch + 0x18000); put(read('RBP') - 8, payload)
    run(0x1458BA744)
    assert bytes(machine.mem_read(bucket - 64, 64)) == new
    assert bytes(machine.mem_read(previous, 64)) == old
    vectors.append(dict(kind='Original Spell metadata replacement', replaced_full_payload=True))

    # Native display-ID collection, pair flattening and final deduplication.
    # Allocation and sorting are seams; all native selection loops still run.
    def dword(address): return struct.unpack('<I', raw(address, 4))[0]
    def qword(address): return struct.unpack('<Q', raw(address, 8))[0]
    expected = []
    for index in range(9):
        base = 0x146BBD128 + index * 0x130
        expected.extend(value for offset in range(0x88, 0x128, 4) if (value := dword(base + offset)))
        pointer, count = qword(base + 0x78), qword(base + 0x80)
        expected.extend(dword(pointer + row * 0x90 + offset)
                        for row in range(count) for offset in range(0x78, 0x8C, 4))
        base = 0x146BBE098 + index * 0x78
        expected.extend(value for offset in range(0x30, 0x70, 4) if (value := dword(base + offset)))
        pointer, count = qword(base + 0x20), qword(base + 0x28)
        expected.extend(dword(pointer + row * 0x30 + offset)
                        for row in range(count) for offset in [0, 0x18])
    expected.extend(dword(0x146BBA4F0 + row * 0x28 + 0x14) for row in range(66))
    expected.extend(dword(0x146BB9300 + row * 4) for row in range(20))
    expected = sorted(set(expected))
    reset(); result = scratch + 0x1000; write('RCX', result); run(0x1458BC2E0)
    pointer, count = word(result + 8), word(result + 16)
    actual = list(struct.unpack('<' + 'I' * count, machine.mem_read(pointer, count * 4)))
    assert actual == expected
    # Armory currently asks for a subset of this shared cache: class equipment.
    requested = set()
    for filename in ['armory.json', 'pvp-gear-0.105.0.json']:
        catalog = json.loads((ROOT / 'crates/azeroth-survivors-re/assets' / filename).read_text())
        for cls in catalog['classes']:
            for item in cls['items']:
                if item['display_id']: requested.add(item['display_id'])
                if (horde := item.get('horde')) and horde['display_id']:
                    requested.add(horde['display_id'])
    assert requested <= set(actual), sorted(requested - set(actual))
    assert json.loads((ROOT / 'crates/azeroth-survivors-re/assets/native-dbc-display-ids-0.105.0.json').read_text()) == actual
    vectors.append(dict(kind='Native display-ID collector', output=actual,
                        armory_requested_subset_count=len(requested)))

    source = (ROOT / 'crates/azeroth-survivors-re/src/native_dbc.rs').read_text()
    client = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/client.rs').read_text()
    aura = (ROOT / 'crates/azeroth-survivors-re/src/gameplay/client/addon_lists.rs').read_text()
    armory = (ROOT / 'crates/azeroth-survivors-re/src/armory.rs').read_text()
    for text, tokens in [(source, ['wrapping_mul', 'from_utf8', 'spells.string(row, 120)', 'spells.word(row, 117)',
                                 'Magic', 'Curse', 'Disease', 'Poison', 'table.string(row, 5)']),
                         (client, ['native_dbc::spell(0)', 'load_spell_catalog']),
                         (aura, ['native_dbc::spell(aura.spell)', 'spell.dispel']),
                         (armory, ['native_dbc::item_icon_dictionary()', 'load_gear_art'])]:
        for token in tokens: assert token in text, token
    assert 'load_spell_dispel_types' not in client
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(dict(target_sha256=target['sha256'], vectors=vectors,
        seams=sorted(seams), limitations=current['limitations']), indent=2, ensure_ascii=False) + '\n')
    print(f'{len(vectors)} native dictionary emission cases, current loader/caller/data bindings and source consumers passed')


if __name__ == '__main__': main()
