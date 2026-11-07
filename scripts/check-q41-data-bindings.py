#!/usr/bin/env python3
"""Classify the selected Options data reader and replay its exact native mapper.

Only original instructions and declared allocation/localization seams run. No
compiler, application, files/save operations, Rust or renderer is exercised.
"""
from runtime_layout import retained_runtime_path
import argparse
import csv
import gzip
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = '58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb'
WORK = ROOT / 'runtime/analysis/history/findings/q41-data-relations/26c724b75a92'
CURATED = ROOT / 'docs/analysis/evidence/0.113.2/q41-data-bindings'
ENTRY, END = 0x1401A8020, 0x1401A81C6
LITERAL, SIZE = 0x145EEE140, 17
READER = 0x1401A8163
MASK = (1 << 64) - 1


def digest(value):
    return hashlib.sha256(value).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--stage', action='store_true')
    args = parser.parse_args()
    sys.path[:0] = [str(ROOT / 'runtime/tool-state/python/camera/python-libs'),
                   str(ROOT / 'runtime/tool-state/python/armory/python-libs')]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    target = latest_target(verify=True)
    assert target['sha256'] == SHA, 'Changed target requires fresh recovery'
    image = target_bytes(target)
    pe = load_script('q41_data_pe', ROOT / 'scripts/inventory-executable.py').PE(image)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + count]

    def span(address, count):
        return dict(address=hex(address), end_exclusive=hex(address + count),
                    byte_count=count, sha256=digest(raw(address, count)))

    queue_path = ROOT / 'docs/analysis/evidence/0.113.2/unknown-recovery.json'
    queue = json.loads(queue_path.read_text())
    assert queue['target']['sha256'] == SHA
    assert queue['selectors']['Q41-D01']['records'] == 531765
    assert queue['selectors']['Q41-D02']['records'] == 174560
    inputs = {key: queue['inputs'][key] for key in ('references.tsv.gz', 'bodies.tsv.gz')}
    for item in inputs.values():
        assert digest((retained_runtime_path(ROOT / item['path'], ROOT)).read_bytes()) == item['sha256']
    with gzip.open(ROOT / inputs['bodies.tsv.gz']['path'], 'rt') as file:
        owners = list(csv.DictReader(file, delimiter='\t'))
    assert not any(row['external'] == 'false' and int(row['start'], 16) <= LITERAL <= int(row['end'], 16)
                   for row in owners)
    reader_owner = [row for row in owners if row['external'] == 'false'
                    and int(row['start'], 16) <= READER <= int(row['end'], 16)]
    assert len(reader_owner) == 1 and int(reader_owner[0]['entry'], 16) == ENTRY
    references, inspected = [], 0
    with gzip.open(ROOT / inputs['references.tsv.gz']['path'], 'rt') as file:
        for ordinal, row in enumerate(csv.DictReader(file, delimiter='\t'), 1):
            inspected = ordinal
            try:
                address = int(row['to'], 16)
            except ValueError:
                continue
            if LITERAL <= address < LITERAL + SIZE:
                references.append(dict(row=ordinal, **row))
    assert references == [dict(row=57548, **{'from': '1401a8163', 'to': '145eee140',
        'type': 'READ', 'operand': '1', 'primary': 'true', 'source': 'DEFAULT'})]
    assert raw(LITERAL, 26) == b'Azeroth SurvivorsLevel Up!'
    section = next(row for row in pe.sections
                   if pe.image_base + row['rva'] <= LITERAL <
                   pe.image_base + row['rva'] + row['virtual_size'])
    assert not int(section['characteristics'], 16) & 0x80000000
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instructions = list(decoder.disasm(raw(ENTRY, END - ENTRY), ENTRY))
    assert sum(row.size for row in instructions) == END - ENTRY
    assert next(row for row in instructions if row.address == READER).bytes.hex() == '0f1005d65fd405'
    assembly = '\n'.join(f'{row.address:016x}: {row.bytes.hex():30} {row.mnemonic} {row.op_str}'.rstrip()
                         for row in instructions) + '\n'

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(row['rva'] + max(row['raw_size'], row['virtual_size']) for row in pe.sections)
    machine.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for row in pe.sections:
        machine.mem_write(pe.image_base + row['rva'], image[row['raw_offset']:row['raw_offset'] + row['raw_size']])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(heap, 0x200000)
    machine.mem_map(stack, 0x10000)
    machine.mem_map(stop, 4096)
    position = heap
    calls, case_calls, trace = [], [], set()
    translated = b'Level Up!'
    allocation_failure = False
    failure = []

    def q(address):
        return struct.unpack('<Q', machine.mem_read(address, 8))[0]

    def put(address, *values):
        machine.mem_write(address, struct.pack('<' + 'Q' * len(values), *values))

    def alloc(count):
        nonlocal position
        address = position
        position += (max(count, 1) + 15) & ~15
        assert position < heap + 0x200000
        machine.mem_write(address, bytes(max(count, 1)))
        return address

    def string(value, capacity=None):
        capacity = len(value) if capacity is None else capacity
        assert capacity >= len(value)
        pointer = alloc(capacity)
        machine.mem_write(pointer, value or b'\0')
        return capacity, pointer, len(value)

    def hook(uc, address, count, ignored):
        if address == stop:
            uc.emu_stop()
            return
        seams = {0x140002200, 0x1400021C0, 0x1400021D0,
                 0x145895670, 0x145895AD0, 0x145E9BD8B}
        if address not in seams:
            assert ENTRY <= address < END, f'Unreviewed instruction {address:#x}'
            trace.add(address)
            return
        c, d, r8, r9 = [uc.reg_read(register) for register in
                        (reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX,
                         reg.UC_X86_REG_R8, reg.UC_X86_REG_R9)]
        event = dict(address=hex(address), arguments=[c, d, r8, r9])
        case_calls.append(event)
        calls.append(hex(address))
        if address == 0x1400021C0:
            assert (c, d) == (17, 1)
            uc.reg_write(reg.UC_X86_REG_RAX, 0 if allocation_failure else alloc(c))
        elif address == 0x1400021D0:
            assert r8 == 1
        elif address == 0x145895670:
            assert (c, d) == (LITERAL + SIZE, 9)
            pointer = alloc(len(translated))
            uc.mem_write(pointer, translated)
            uc.reg_write(reg.UC_X86_REG_RAX, pointer)
            uc.reg_write(reg.UC_X86_REG_RDX, len(translated))
        elif address == 0x145895AD0:
            assert r9 == 8 and q(uc.reg_read(reg.UC_X86_REG_RSP) + 40) == 0
            value = bytes(uc.mem_read(d, r8))
            assert value == translated
            put(c, *string(value))
        elif address == 0x145E9BD8B:
            assert (c, d) == (1, 17)
            failure.append(event)
            uc.emu_stop()
            return
        sp = uc.reg_read(reg.UC_X86_REG_RSP)
        uc.reg_write(reg.UC_X86_REG_RIP, q(sp))
        uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    machine.hook_add(UC_HOOK_CODE, hook)
    cases = []

    def invoke(kind, key, label=b'', capacity=None, translation=b'Level Up!', fail=False):
        nonlocal position, translated, allocation_failure
        position = heap
        translated, allocation_failure = translation, fail
        case_calls.clear()
        source, output = alloc(48), alloc(48)
        machine.mem_write(output, b'\xa5' * 48)
        key_string, label_string = string(key, capacity), string(label)
        if kind == 'header':
            put(source, MASK, *key_string, 0x12345678, 0x87654321)
        else:
            put(source, *key_string, *label_string)
        original = bytes(machine.mem_read(source, 48))
        sp = stack + 0xF008
        put(sp, stop)
        machine.reg_write(reg.UC_X86_REG_RSP, sp)
        machine.reg_write(reg.UC_X86_REG_RCX, output)
        machine.reg_write(reg.UC_X86_REG_RDX, source)
        machine.emu_start(ENTRY, stop, count=1000)
        if fail:
            assert machine.reg_read(reg.UC_X86_REG_RIP) == 0x145E9BD8B
            assert bytes(machine.mem_read(output, 48)) == b'\xa5' * 48
            assert not any(event['address'] == '0x1400021d0' for event in case_calls)
            cases.append(dict(kind=kind, key=key.decode(), capacity=key_string[0],
                              allocation_failure=True, output_published=False))
            return
        assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
        assert machine.reg_read(reg.UC_X86_REG_RAX) == output
        frees = [event['arguments'][:3] for event in case_calls if event['address'] == '0x1400021d0']
        if kind == 'header' and key == b'AZS':
            assert q(output) == MASK and q(output + 8) == SIZE and q(output + 24) == SIZE
            actual = bytes(machine.mem_read(q(output + 16), q(output + 24)))
            assert actual == b'Azeroth Survivors'
            assert frees == [[key_string[1], key_string[0], 1]]
            expected = 'Azeroth Survivors'
        elif kind == 'command' and key == b'AZS_OPENLEVELS':
            assert bytes(machine.mem_read(output, 24)) == original[:24]
            actual = bytes(machine.mem_read(q(output + 32), q(output + 40)))
            assert actual == translation
            assert frees == ([[label_string[1], label_string[0], 1]] if label_string[0] else [])
            expected = translation.decode()
        else:
            assert bytes(machine.mem_read(output, 48)) == original
            assert not case_calls
            expected = 'unchanged'
        cases.append(dict(kind=kind, key=key.decode(), capacity=key_string[0],
                          old_label=label.decode(), output=expected,
                          freed_objects=len(frees)))

    # Exact case and length; a valid owned string may have spare capacity.
    for capacity in (3, 17, 31):
        invoke('header', b'AZS', capacity=capacity)
    for key in (b'', b'AZ', b'AZSS', b'azs', b'AzS', b'AZs', b'AZS\0',
                b'MOVEMENT', b'HEADER_AZS', b'OTHER'):
        invoke('header', key)
    invoke('header', b'AZS', capacity=7, fail=True)
    for label in (b'', b'Changed by an addon'):
        for translation in (b'Level Up!', 'Niveau sup\u00e9rieur !'.encode()):
            invoke('command', b'AZS_OPENLEVELS', label, translation=translation)
    command = b'AZS_OPENLEVELS'
    for index in range(len(command)):
        changed = command[:index] + bytes([command[index] ^ 0x20]) + command[index + 1:]
        invoke('command', changed, b'Unchanged command label')
    for key in (b'', b'AZS_OPENLEVEL', b'AZS_OPENLEVELSS', b'JUMP', b'HEADER_AZS'):
        invoke('command', key, b'Unchanged command label')
    assert len(cases) == 37
    assert READER in trace
    options_path = ROOT / 'crates/azeroth-survivors-re/src/options.rs'
    source = options_path.read_text()
    sync = source.split('fn sync_engine(', 1)[1].split('\nfn ', 1)[0]
    assert 'if name == "HEADER_AZS"' in sync
    assert 'crate::native_bindings::label("BINDING_HEADER_AZS")' in sync
    assert 'state.bindings.engine_rows.clone_from(&snapshot.rows)' in sync
    assert 'state.bindings.rows = snapshot.rows.iter()' in sync
    draw = source.split('fn draw_bindings(', 1)[1].split('\nfn ', 1)[0]
    assert 'label(header, &art.font, &row.label, 17.0 * scale, GOLD)' in draw
    assert 'live_binding_snapshot_preserves_custom_azs_header_and_other_labels' in source
    source_roles = {
        'sync_engine': sync,
        'draw_bindings': draw,
        'native_labels': (ROOT / 'crates/azeroth-survivors-re/src/native_bindings.rs').read_text(),
        'binding_xml': (ROOT / 'crates/azeroth-survivors-re/assets/stored-level-bindings-0.105.0.xml').read_text(),
    }
    record = dict(
        target_sha256=SHA, gap_ids=[17, 21, 41], lead_ids=['Q41-D01', 'Q41-D02'],
        selected_target=hex(LITERAL), selected_reader=hex(READER),
        queue_input=dict(path=queue_path.relative_to(ROOT).as_posix(), sha256=digest(queue_path.read_bytes())),
        queue_selectors={key: queue['selectors'][key] for key in ('Q41-D01', 'Q41-D02')},
        inputs=inputs, reference_records_inspected=inspected, selected_references=references,
        literal=dict(**span(LITERAL, SIZE), bytes_hex=raw(LITERAL, SIZE).hex(),
                     value='Azeroth Survivors', encoding='UTF-8/ASCII',
                     observed_read_bytes=16, final_output_byte_from_immediate='73',
                     section=section['name'], section_characteristics=section['characteristics'],
                     file_offset=pe.rva_offset(LITERAL - pe.image_base),
                     lifetime='Image-backed immutable input; an allocated owned String is published by the selected branch.'),
        owner=dict(**span(ENTRY, END - ENTRY), assembly='binding-label-mapper.asm', assembly_sha256=digest(assembly.encode())),
        layout=dict(classification='Instruction-derived semantic layout, not an original/debug type',
                    size_bytes=48, header=dict(sentinel_offset=0, sentinel='ffffffffffffffff',
                                              string_fields=['capacity@8', 'pointer@16', 'length@24']),
                    command=dict(key_fields=['capacity@0', 'pointer@8', 'length@16'],
                                 label_fields=['capacity@24', 'pointer@32', 'length@40'])),
        native_cases=len(cases), cases=cases, cases_sha256=digest(json.dumps(cases, separators=(',', ':')).encode()),
        seam_addresses=sorted(set(calls)),
        source_projection={key: dict(sha256=digest(value.encode()), limit='Static source trace; Rust was not executed')
                           for key, value in source_roles.items()},
        compiler_run=False, application_executed=False, rebuilt_code_executed=False, parity_verified=False,
        limits=[
            'The reference selector scans the committed full-profile export, not every possible mutable alias or computed address.',
            'One observed READ and zero observed writers are bounded export facts; no whole-image semantic or alias closure is claimed.',
            'String/enum layouts are recovered from instructions. Ghidra reports no defined type at the selected literal.',
            'Synthetic valid header/command strings drive the original mapper. Allocation/free and localization/string construction are explicit seams.',
            'A failed allocation stops at the native error interface; allocation/runtime internals are not reconstructed.',
            'The neighboring command-label branch is checked at its declared localization seam; actual locale resources and UI execution remain separate.',
            'No compiler, original/rebuilt application, actual VM/device/file IO, rendering or parity comparison runs.'])
    directory = WORK / 'staged' if args.stage else CURATED
    if args.stage:
        directory.mkdir(parents=True, exist_ok=True)
        (directory / 'contract.json').write_text(json.dumps(record, ensure_ascii=False, indent=2) + '\n')
        (directory / 'binding-label-mapper.asm').write_text(assembly)
    else:
        assert json.loads((directory / 'contract.json').read_text()) == record
        assert (directory / 'binding-label-mapper.asm').read_text() == assembly
        provider = json.loads((directory / 'ghidra.json').read_text())
        assert provider['target_sha256'] == SHA
        assert provider['function_body']['total_bytes'] == END - ENTRY
        assert provider['literal_references'] == [hex(READER)]
        assert provider['literal_type']['status'] == 'unavailable'
        assert provider['literal_body']['found'] is False
        for key in ('probe_plan', 'seed_file'):
            assert digest((directory / provider[key]['path']).read_bytes()) == provider[key]['sha256']
    print(f'Passed {len(cases)} exact native mapper cases; classified one current D01/D02 literal/reader; no build/game')


if __name__ == '__main__':
    main()
