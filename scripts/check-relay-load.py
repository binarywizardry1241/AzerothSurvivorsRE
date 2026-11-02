#!/usr/bin/env python3
"""Check current relay evidence and isolated instructions; never start a service."""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import itertools
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.123.0/relay-load/manifest.json"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def verified(row):
    path = project_path(row["path"])
    assert sha(path.read_bytes()) == row["sha256"], row["path"]
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    selected = latest_target(verify=True)
    assert all(selected[k] == proof["target"][k]
               for k in ("version", "sha256", "size_bytes"))
    image = target_bytes(selected)
    pe = load_script("relay_load_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    selected_instructions = set()
    assembly = []
    for rows, curated in ((proof["native_owners"], False), (proof["native_ranges"], True)):
        for row in rows:
            start = int(row["virtual_address"], 16)
            offset = pe.rva_offset(start - pe.image_base)
            assert offset == int(row["file_offset"], 16)
            raw = image[offset:offset + row["byte_count"]]
            assert sha(raw) == row["sha256"], row["role"]
            instructions = list(decoder.disasm(raw, start))
            assert sum(i.size for i in instructions) == len(raw)
            assert len(instructions) == row["instruction_count"]
            if curated:
                selected_instructions.update(i.address for i in instructions)
                assembly.append("// " + row["role"] + "\n")
                assembly.extend(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip()
                                + "\n" for i in instructions)
    assert verified(proof["assembly"]).read_text() == "".join(assembly)
    raw = verified(proof["raw_input"]).read_bytes()
    start = int(proof["slice_virtual_address"], 16)
    offset = pe.rva_offset(start - pe.image_base)
    assert image[offset:offset + len(raw)] == raw
    for row in proof["native_data"]:
        offset = pe.rva_offset(int(row["virtual_address"], 16) - pe.image_base)
        data = image[offset:offset + row["byte_count"]]
        assert sha(data) == row["sha256"]
        assert struct.unpack("<" + {"f32": "f", "f64": "d"}[row["encoding"]], data)[0] == row["value"]
    for query in proof["queries"]:
        result = json.loads(verified(query["result"]).read_text())["structuredContent"]
        subject = verify_native_query_subject(ROOT, result, query, proof["target"], image=image, pe=pe)
        assert subject == query["subject_verification"]
        assert sha(result["normalized_result"].encode()) == query["normalized_sha256"]
    for row in proof["source_bindings"]:
        verified(row)
    assert proof["target_executed"] is False
    return raw, selected_instructions


def instruction_cases(proof, raw, admitted):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(0x145bd7000, 0xb000)
    machine.mem_write(int(proof["slice_virtual_address"], 16), raw)
    memory = 0x22000000
    machine.mem_map(memory, 0x5000)
    stops, expected_stops = [], set()

    def hook(uc, address, size, _):
        if address in expected_stops:
            stops.append(address)
            uc.emu_stop()
        else:
            assert address in admitted, ("escaped selected instructions", hex(address))

    machine.hook_add(UC_HOOK_CODE, hook)

    def run(start, endpoints):
        stops.clear()
        expected_stops.clear()
        expected_stops.update(endpoints)
        machine.emu_start(start, 0x145be2000, count=64)
        assert len(stops) == 1
        return stops[0]

    def write(name, value):
        machine.reg_write(getattr(reg, "UC_X86_REG_" + name), value)

    def qword(address, value):
        machine.mem_write(address, struct.pack("<Q", value))

    def read(address, fmt="Q"):
        return struct.unpack("<" + fmt, machine.mem_read(address, struct.calcsize(fmt)))[0]

    def bits(value, fmt="d"):
        return int.from_bytes(struct.pack("<" + fmt, value), "little")

    counts = dict(gate=0, charge=0, receive=0, clamp=0, drain=0, reset=0, limit=0,
                  control_clock=0, ack=0)
    row = memory + 0x1000
    for sent, length, boundary, credit in itertools.product(range(5), range(5), range(5),
                                                           (-1.0, -0.0, 0.5, 2.0)):
        write("RDI", row)
        write("RSI", memory)
        write("RAX", sent)
        qword(row - 0x50, length)
        qword(row - 0x20, boundary)
        machine.mem_write(memory + 0x168, struct.pack("<d", credit))
        write("XMM6", 0)
        stop = run(0x145bdd1d0, (0x145bdd160, 0x145bdd1f1))
        assert (stop == 0x145bdd1f1) == (sent < length and (sent >= boundary or credit > 0))
        counts["gate"] += 1
    for sent, boundary, credit, length in itertools.product(range(5), range(5),
                                                           (-1.0, 0.0, 1.0), (0, 1, 4096)):
        write("RAX", sent)
        write("RDX", boundary)
        write("RSI", memory)
        write("RCX", row)
        write("XMM0", bits(credit))
        qword(row + 0x18, length)
        machine.mem_write(memory + 0x168, struct.pack("<d", credit))
        run(0x145bdd214, (0x145bdd22e,))
        assert read(memory + 0x168, "d") == (credit - length if sent < boundary else credit)
        counts["charge"] += 1
    mask = (1 << 64) - 1
    for previous, pending in itertools.product((0, 1, 9, mask - 1, mask), (0, 1)):
        for sequence in sorted({0, previous, (previous + 1) & mask, (previous + 2) & mask, mask}):
            qword(row - 0x18, previous)
            machine.mem_write(row - 8, bytes([pending]))
            write("R14", row)
            write("R13", sequence)
            stop = run(0x145bdcb99, (0x145bdcbad, 0x145bdcd91, 0x145bdce25))
            next_sequence = (previous + 1) & mask
            accept = sequence == next_sequence or (sequence > next_sequence and not pending)
            assert (stop != 0x145bdce25) == accept
            assert read(row - 0x18) == (sequence if accept else previous)
            counts["receive"] += 1
    for produced, acknowledged in itertools.product((0, 1, 9, mask - 1, mask), repeat=2):
        write("R14", row)
        write("RBP", memory + 0x3000)
        write("RDI", acknowledged)
        qword(row - 0x38, produced)
        run(0x145bdcaa9, (0x145bdcab8,))
        assert read(memory + 0x3000 - 0x48) == min(produced, acknowledged)
        counts["clamp"] += 1
    for sent, boundary in itertools.product((0, 1, 2, 9, mask), repeat=2):
        write("R14", row)
        write("R11", sent)
        write("R15", boundary)
        run(0x145bdcb5a, (0x145bdcb72,))
        assert read(row - 0x28) == max(sent - 1, 0)
        assert read(row - 0x20) == max(boundary - 1, 0)
        counts["drain"] += 1
    for length in (0, 1, 9, 100):
        write("R14", row)
        write("RAX", length)
        machine.mem_write(row - 8, b"\x01")
        run(0x145bdcde2, (0x145bdcdfb,))
        assert read(row - 0x28) == 0 and read(row - 0x20) == length
        assert machine.mem_read(row - 8, 1) == b"\x00"
        assert read(row - 0x40, "I") == 0xffffffff
        counts["reset"] += 1
    for length in (0, 4 * 1024 * 1024, 16 * 1024 * 1024 - 1, 16 * 1024 * 1024,
                   16 * 1024 * 1024 + 1, mask):
        write("R15", row)
        qword(row - 0x30, length)
        stop = run(0x145bdda04, (0x145bddab3, 0x145bdda12))
        assert (stop == 0x145bddab3) == (length <= 16 * 1024 * 1024)
        counts["limit"] += 1
    for seconds, nanos in itertools.product(range(5), (0, 1, 999_999_999)):
        write("RAX", seconds)
        write("RDX", nanos)
        write("XMM7", bits(1e9, "f"))
        write("XMM8", bits(3.0, "f"))
        stop = run(0x145bda949, (0x145bda985, 0x145bda9f0))
        f32 = lambda x: struct.unpack("<f", struct.pack("<f", x))[0]
        elapsed = f32(f32(seconds) + f32(f32(nanos) / f32(1e9)))
        assert (stop == 0x145bda9f0) == (elapsed >= 3)
        counts["control_clock"] += 1
    for elapsed, received in itertools.product((0.0, 1.999, 2.0, 3.0), (0, 1, 9, mask)):
        # Separate product dimension for the ACK's independently retained progress.
        for acknowledged in (0, 1, 9, mask):
            write("RSI", row)
            write("XMM6", bits(elapsed, "f"))
            write("XMM9", bits(2.0, "f"))
            qword(row - 0x18, received)
            qword(row - 0x10, acknowledged)
            stop = run(0x145bda985, (0x145bda8b2, 0x145bda9a1))
            emit = elapsed >= 2 and received > acknowledged
            assert (stop == 0x145bda9a1) == emit
            assert read(row - 0x10) == (received if emit else acknowledged)
            counts["ack"] += 1
    counts["total"] = sum(counts.values())
    return counts


def verify_current(proof):
    """Verify current bounded contracts without hashing shared source files."""
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    selected = latest_target(verify=True)
    assert proof['target'] == {key: selected[key] for key in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(selected)
    pe = load_script('relay_current_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    admitted, assembly = set(), []
    for row in proof['native_owners'] + proof['native_ranges']:
        start = int(row['virtual_address'], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row['byte_count']]
        assert offset == int(row['file_offset'], 16) and sha(raw) == row['sha256']
        instructions = list(decoder.disasm(raw, start))
        assert sum(i.size for i in instructions) == len(raw)
        assert len(instructions) == row['instruction_count']
        if row in proof['native_ranges']:
            assert raw == bytes.fromhex(row['bytes_hex'])
            admitted.update(i.address for i in instructions)
            assembly.append('// ' + row['role'] + '\n')
            assembly.extend(f'{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}'.rstrip() + '\n'
                            for i in instructions)
    assert verified(proof['assembly']).read_text() == ''.join(assembly)
    for row in proof['native_data']:
        offset = pe.rva_offset(int(row['virtual_address'], 16) - pe.image_base)
        raw = image[offset:offset + row['byte_count']]
        assert sha(raw) == row['sha256'] and raw == bytes.fromhex(row['bytes_hex'])
        if row.get('encoding') in ('f32', 'f64'):
            assert struct.unpack('<' + {'f32': 'f', 'f64': 'd'}[row['encoding']], raw)[0] == row['value']
    for query in proof['queries']:
        value = json.loads(verified(query['result']).read_text())
        native = value.get('structuredContent') or json.loads(value['content'][0]['text'])
        verify_native_query_subject(ROOT, native, query, proof['target'], image=image, pe=pe)
        assert sha(native['normalized_result'].encode()) == query['normalized_sha256']
    for row in proof['source_connections']:
        source = project_path(row['path']).read_text()
        for fragment in row.get('required', []):
            assert fragment in source, (row['path'], fragment)
        for fragment in row.get('forbidden', []):
            assert fragment not in source, (row['path'], fragment)
    assert proof['target_executed'] is False
    return admitted


def current_cases(proof, admitted):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg
    u, pages = Uc(UC_ARCH_X86, UC_MODE_64), set()
    for row in proof['native_ranges'] + proof['native_data']:
        address = int(row['virtual_address'], 16)
        raw = bytes.fromhex(row['bytes_hex'])
        for page in range(address & ~4095, (address + len(raw) + 4095) & ~4095, 4096):
            if page not in pages:
                u.mem_map(page, 4096)
                pages.add(page)
        u.mem_write(address, raw)
    memory, stack, returned = 0x22000000, 0x22400000, 0x2240d000
    u.mem_map(memory, 0x400000)
    u.mem_map(stack, 0x10000)
    for address in (0x14600b300, 0x14600b450, 0x1400021d0):
        page = address & ~4095
        if page not in pages:
            u.mem_map(page, 4096)
            pages.add(page)
    state = dict(ends=set(), stops=[], steps=0, clocks={}, frees=0)

    def write(name, value):
        u.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)

    def put(address, value, fmt='Q'):
        u.mem_write(address, struct.pack('<' + fmt, value))

    def read(address, fmt='Q'):
        return struct.unpack('<' + fmt, u.mem_read(address, struct.calcsize(fmt)))[0]

    def bits(value, fmt='f'):
        return int.from_bytes(struct.pack('<' + fmt, value), 'little')

    def f32(value):
        return struct.unpack('<f', struct.pack('<f', value))[0]

    def elapsed(seconds, nanos):
        return f32(f32(seconds) + f32(f32(nanos) / f32(1e9)))

    def resume_call():
        sp = u.reg_read(reg.UC_X86_REG_RSP)
        write('RIP', read(sp))
        write('RSP', sp + 8)

    def hook(_u, address, _size, _context):
        state['steps'] += 1
        if address in state['ends']:
            state['stops'].append(address)
            u.emu_stop()
        elif address == 0x14600b300:
            write('RAX', 333)
            write('RDX', 555)
            resume_call()
        elif address == 0x14600b450:
            marker = read(u.reg_read(reg.UC_X86_REG_RCX))
            seconds, nanos = state['clocks'].get(marker, (0, 0))
            write('RAX', seconds)
            write('RDX', nanos)
            resume_call()
        elif address == 0x1400021d0:
            state['frees'] += 1
            resume_call()
        else:
            assert address in admitted, ('escaped selected instructions', hex(address))
    u.hook_add(UC_HOOK_CODE, hook)

    def run(start, ends, limit=5000):
        state['ends'] = set(ends)
        state['stops'] = []
        write('RSP', stack + 0xe008)
        put(stack + 0xe008, returned)
        try:
            u.emu_start(start, 0, count=limit)
        except Exception as error:
            raise AssertionError(('native fixture fault', hex(start),
                                  hex(u.reg_read(reg.UC_X86_REG_RIP)),
                                  hex(u.reg_read(reg.UC_X86_REG_RSP)))) from error
        assert len(state['stops']) == 1, hex(start)
        return state['stops'][0]

    counts = {}
    def case(kind): counts[kind] = counts.get(kind, 0) + 1
    peer, frame, packet = memory + 0x1000, memory + 0x3000, memory + 0x5000
    mask = (1 << 64) - 1
    parse_ends = (0x145cbd1de, 0x145cbd2a4, 0x145cbd259, 0x145cbd284, 0x145cbd236, 0x145cbde12)
    for tag, length in itertools.product((0, 1, 2, 3, 4, 5, 255), range(20)):
        u.mem_write(packet, bytes([tag]) + bytes(31))
        write('R9', length); write('R8', packet); write('RBP', frame); write('RCX', memory)
        end = run(0x145cbd1af, parse_ends)
        valid = tag <= 4 and length >= (10 if tag == 2 else 17 if tag >= 3 else 9)
        assert (end != 0x145cbde12) == valid, (tag, length)
        case('packet_admission')
    for previous, pending in itertools.product((0, 1, 9, mask - 1, mask), (0, 1)):
        for sequence in sorted({0, previous, (previous + 1) & mask, (previous + 2) & mask, mask}):
            put(peer - 0x40, previous); put(peer - 8, pending, 'B')
            write('R13', peer); write('R14', sequence)
            end = run(0x145cbd5f4, (0x145cbd8dd, 0x145cbd60c))
            assert (end == 0x145cbd60c) == bool(pending and sequence > ((previous + 1) & mask))
            case('control_data_gate')
    for acknowledged, sequence in itertools.product((0, 1, 9, mask), repeat=2):
        put(peer - 0x38, acknowledged); write('R13', peer); write('R14', sequence)
        run(0x145cbd961, (0x145cbd978,))
        assert read(peer - 0x38) == min(acknowledged, max(sequence - 1, 0))
        case('duplicate_ack')
    for produced, sequence in itertools.product((0, 1, 9, mask), repeat=2):
        put(peer - 0x60, produced); write('R13', peer); write('RSI', sequence)
        run(0x145cbd89d, (0x145cbd8a8,))
        assert u.reg_read(reg.UC_X86_REG_RDX) == min(produced, sequence)
        write('R12', sequence)
        run(0x145cbd7fb, (0x145cbd806,))
        assert u.reg_read(reg.UC_X86_REG_R12) == min(produced, sequence)
        case('ack_range_clamp')
    for sent, length, boundary, credit in itertools.product(range(5), range(5), range(5), (-1., 0., .5)):
        write('RDI', peer); write('RSI', memory); write('XMM6', 0)
        put(peer - 0x50, sent); put(peer - 0xa8, length); put(peer - 0x48, boundary)
        put(memory + 0x168, credit, 'd')
        end = run(0x145cbe9c8, (0x145cbe9f4, 0x145cbeb7b, 0x145cbeb87))
        assert (end == 0x145cbe9f4) == (sent < length and (sent >= boundary or credit > 0))
        case('sender_gate')
    for sent, boundary, credit, length in itertools.product(range(5), range(5), (-1., 0., 1.), (0, 1, 4096)):
        write('RCX', sent); write('RDX', boundary); write('RAX', peer); write('RSI', memory)
        write('XMM0', bits(credit, 'd')); put(peer + 0x18, length); put(memory + 0x168, credit, 'd')
        run(0x145cbea1a, (0x145cbea34,))
        assert read(memory + 0x168, 'd') == (credit - length if sent < boundary else credit)
        case('sender_charge')
    for length in (0, 0x1000000 - 1, 0x1000000, 0x1000000 + 1, mask):
        write('R12', peer); put(peer - 0x58, length)
        end = run(0x145cbf1c2, (0x145cbf277, 0x145cbf1d1))
        assert (end == 0x145cbf277) == (length <= 0x1000000)
        case('pending_limit')
    # Original inclusive ACK draining, including both wrapping VecDeque spans.
    queue = memory + 0x8000
    for length, head, acknowledgement in itertools.product(range(5), (0, 2, 6), (0, 1, 2, 4, 9, mask)):
        for sent, boundary in ((0, 0), (length, length), (min(1, length), length)):
            u.mem_write(peer, bytes(0x100)); u.mem_write(queue, bytes(0x100))
            for index in range(length):
                offset = (head + index) % 8
                payload = index + 1
                u.mem_write(queue + offset * 32, struct.pack('<QQQQ', index + 1, payload, packet, payload))
            for off, value in ((0, 8), (8, queue), (0x10, head), (0x18, length),
                               (0x68, length * (length + 1) // 2), (0x70, sent), (0x78, boundary)):
                put(peer + off, value)
            state['frees'] = 0
            write('RCX', peer); write('RDX', acknowledgement)
            run(0x145cc1a30, (returned,))
            drained = min(length, acknowledgement)
            assert read(peer + 0x18) == length - drained
            assert read(peer + 0x10) == (head + drained) % 8
            assert read(peer + 0x68) == length * (length + 1) // 2 - drained * (drained + 1) // 2
            assert read(peer + 0x70) == max(sent - drained, 0)
            assert read(peer + 0x78) == max(boundary - drained, 0)
            assert state['frees'] == drained
            assert read(peer + 0x20) == (333 if drained else 0)
            case('ack_drain')
    # Range search consumes sent-prefix count before filtering matching IDs.
    iterator, output, minimum, maximum, total = memory + 0xc000, memory + 0xd000, memory + 0xe000, memory + 0xe010, memory + 0xe020
    profiles = ((0, 1, 2, 3), (0x40001, 1, 1, 1), (0x20000, 0x20000, 1, 1), (0, 0x40001, 1, 1))
    for sent, low, high, profile in itertools.product(range(5), (0, 1, 2, 4, 5), (0, 1, 3, 4, mask), profiles):
        u.mem_write(iterator, bytes(0x50)); put(total, 0); put(minimum, low); put(maximum, high)
        for index, length in enumerate(profile):
            u.mem_write(queue + index * 32, struct.pack('<QQQQ', index + 1, length, packet, length))
        u.mem_write(iterator, struct.pack('<8Q', queue, queue + 64, queue + 64, queue + 128,
                                        sent, minimum, maximum, total))
        actual = []
        for _ in range(6):
            write('RCX', output); write('RDX', iterator)
            end = run(0x145bebb40, (0x145bebc39, returned))
            if end == returned: break
            actual.append(read(u.reg_read(reg.UC_X86_REG_R8)))
        expected, used = [], 0
        for index, length in enumerate(profile[:sent]):
            if low <= index + 1 <= high:
                previous = used; used += length
                if previous and used > 0x40000: break
                expected.append(index + 1)
        assert actual == expected, (sent, low, high, profile, actual, expected)
        case('range_reply')
    # Full gap helper with synthetic leaf-node BTreeMap/monotonic-clock seams.
    leaf, out = memory + 0x10000, memory + 0x11000
    durations = ((0, 0), (0, 599999999), (0, 600000000), (1, 0), (10, 0), (10, 1000))
    for buffered, highest, gap_duration, request_duration, gap_present, request_present in itertools.product(
            (False, True), (3, 6), durations, durations[:4], (False, True), (False, True)):
        u.mem_write(peer, bytes(0x100)); u.mem_write(leaf, bytes(0x200)); u.mem_write(out, bytes(32))
        put(peer + 0x80, 3); put(peer + 0xb0, highest)
        put(peer + 0x40, 111); put(peer + 0x48, 0 if gap_present else 0xffffffff, 'I')
        put(peer + 0x50, 222); put(peer + 0x58, 0 if request_present else 0xffffffff, 'I')
        if buffered:
            put(peer + 0x90, leaf); put(peer + 0xa0, 1); put(leaf + 0x16a, 1, 'H'); put(leaf + 8, 7)
        state['clocks'] = {111: gap_duration, 222: request_duration}
        write('RCX', out); write('RDX', peer)
        run(0x145cc1c30, (returned,))
        expired = not buffered and highest > 3 and gap_present and elapsed(*gap_duration) > 10.
        emitted = (buffered or highest > 3) and not expired and (
            not request_present or elapsed(*request_duration) >= f32(.6))
        assert (read(out) != mask) == emitted
        if emitted:
            assert read(out + 8) == 4 and read(out + 0x10) == (6 if buffered else highest)
        if expired:
            assert read(peer + 0x80) == highest and read(peer + 0x48, 'I') == 0xffffffff
            assert read(peer + 0x58, 'I') == 0xffffffff
        case('missing_range')
    for length in (0, 0x800000 - 1, 0x800000, 0x800000 + 1, mask):
        put(peer - 0x18, length); write('R13', peer)
        end = run(0x145cbe0b7, (0x145cbe184, 0x145cbe0c5))
        assert (end == 0x145cbe184) == (length > 0x800000)
        case('buffer_limit')
    for seconds, nanos in itertools.product(range(12), (0, 1, 599999999, 600000000, 999999999)):
        for kind, start, endpoints, threshold, strict in (
            ('buffer_timeout', 0x145cbe0d6, (0x145cbe184, 0x145cbe281), 10., True),
            ('control_clock', 0x145cba79a, (0x145cba820, 0x145cba7d6), 3., False),
            ('oldest_retry', 0x145cbaac8, (0x145cbab0f, 0x145cba6f0), 5., False),
            ('peer_tail_clock', 0x145cba807, (0x145cba935, 0x145cba8d2), 1., False)):
            write('RAX', seconds); write('RDX', nanos); write('RBP', frame)
            write('XMM7', bits(1e9)); write('XMM8', bits(3.)); write('XMM9', bits(1.)); write('XMM10', bits(5.))
            end = run(start, endpoints)
            value = elapsed(seconds, nanos)
            assert (end == endpoints[0]) == (value > threshold if strict else value >= threshold), (kind, seconds, nanos)
            case(kind)
    for value in (0., .999, 1., 2.):
        write('XMM6', bits(value)); write('XMM9', bits(1.))
        end = run(0x145cba7d6, (0x145cba7e0, 0x145cba9e1))
        assert (end == 0x145cba7e0) == (value >= 1.)
        case('global_ack')
    counts['total'] = sum(counts.values())
    return dict(cases=counts, original_instruction_steps=state['steps'],
                seams=['Synthetic peers/VecDeque spans and one-leaf ordered receive map.',
                       'Native monotonic clock calls return explicit fixture timestamps/deltas.',
                       'Deallocation is an opaque seam; range iteration stops before payload allocation/copy.',
                       'No sockets, service, game decoder or reconstructed Rust execute.'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof', type=project_path, default=MANIFEST)
    parser.add_argument('--write', action='store_true', help='Retain current-target static results')
    args = parser.parse_args()
    proof = json.loads(args.proof.read_text())
    if proof['target']['version'] == '0.127.0':
        admitted = verify_current(proof)
        result = dict(target=proof['target'], query_receipts=len(proof['queries']),
                      selected_instructions=len(admitted), native=current_cases(proof, admitted),
                      source_connections_checked=True, compiled=False, target_executed=False, parity='unverified')
        if args.write:
            args.proof.with_name('static-check.json').write_text(portable_json(result, indent=2) + '\n')
        elif args.proof.with_name('static-check.json').exists():
            assert portable_record(result) == portable_record(json.loads(args.proof.with_name('static-check.json').read_text()))
        print(json.dumps(result, indent=2))
        return
    raw, admitted = verify(proof)
    cases = instruction_cases(proof, raw, admitted)
    print(json.dumps({"target": proof["target"]["version"], "query_receipts": len(proof["queries"]),
                      "owner_instructions": sum(r["instruction_count"] for r in proof["native_owners"]),
                      "selected_instructions": len(admitted), "native_cases": cases,
                      "limits": "Synthetic registers/memory; stops before allocation, transport and game delivery. No application execution, service capacity or parity proof."}))


if __name__ == "__main__":
    main()
