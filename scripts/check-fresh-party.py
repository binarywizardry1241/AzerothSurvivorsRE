#!/usr/bin/env python3
"""Verify fresh-party native contracts without application or service execution."""
import hashlib
import itertools
import json
import re
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.123.0/fresh-party/manifest.json"


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
    pe = load_script("fresh_party_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    admitted, assembly = set(), []
    for rows, curated in ((proof["native_owners"], False), (proof["native_ranges"], True)):
        for row in rows:
            start = int(row["virtual_address"], 16)
            offset = pe.rva_offset(start - pe.image_base)
            raw = image[offset:offset + row["byte_count"]]
            assert offset == int(row["file_offset"], 16) and sha(raw) == row["sha256"]
            decoded = list(decoder.disasm(raw, start))
            assert sum(i.size for i in decoded) == len(raw)
            assert len(decoded) == row["instruction_count"]
            if curated:
                admitted.update(i.address for i in decoded)
                assembly.append("// " + row["role"] + "\n")
                assembly.extend(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip()
                                + "\n" for i in decoded)
    assert verified(proof["assembly"]).read_text() == "".join(assembly)
    for row in proof["dispatch_tables"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16) and sha(raw) == row["sha256"]
        cases = struct.unpack("<" + "i" * (len(raw) // 4), raw)
        assert [hex(start + value) for value in cases] == row["destinations"]
    for query in proof["queries"]:
        native = json.loads(verified(query["result"]).read_text())["structuredContent"]
        assert verify_native_query_subject(ROOT, native, query, proof["target"], image=image, pe=pe) == query["subject_verification"]
        assert sha(native["normalized_result"].encode()) == query["normalized_sha256"]
    dependency = proof["ordering_dependency"]
    retained = json.loads(verified(dependency["manifest"]).read_text())
    assert retained["target"] == proof["target"]
    query = next(row for row in retained["queries"]
                 if row["procedure"] == dependency["receiver_procedure"])
    native = json.loads(verified(query["result"]).read_text())["structuredContent"]
    assert verify_native_query_subject(ROOT, native, query, proof["target"], image=image, pe=pe) == query["subject_verification"]
    assert sha(native["normalized_result"].encode()) == query["normalized_sha256"]
    row = dependency["control_reply_range"]
    start = int(row["virtual_address"], 16)
    offset = pe.rva_offset(start - pe.image_base)
    raw = image[offset:offset + row["byte_count"]]
    assert offset == int(row["file_offset"], 16) and sha(raw) == row["sha256"]
    decoded = list(decoder.disasm(raw, start))
    assert sum(i.size for i in decoded) == len(raw) and len(decoded) == row["instruction_count"]
    assert [(hex(i.address), i.op_str) for i in decoded if i.mnemonic == "call"] == [
        (dependency["send_call_site"], dependency["send_procedure"])]
    for path, fragments in proof["source_requirements"].items():
        source = re.sub(r"\s+", "", project_path(path).read_text())
        for fragment in fragments:
            assert re.sub(r"\s+", "", fragment) in source, (path, fragment)
    directory = (ROOT / "crates/azeroth-survivors-re/src/coop_directory.rs").read_text()
    for tag in (21, 22):
        arm = directory.split(f"DirectoryResponse::Text {{ tag: {tag}, text }} => {{", 1)[1].split(
            "DirectoryResponse::Text", 1)[0]
        assert arm.index("drain_service_relay(&mut service);") < arm.index("service_party_reset(")
        assert arm.index("service_party_reset(") < arm.index("if menu.in_run")
        assert arm.index("service_party_reset(") < arm.index("Session::service_")
    closed = directory.split("DirectoryResponse::Text { tag: 27, text } => {", 1)[1].split(
        "DirectoryResponse::Number", 1)[0]
    assert closed.index("drain_service_relay(&mut service);") < closed.index("active = false")
    assert closed.index("active = false") < closed.index("service.secondary = None")
    assert closed.index("service.secondary = None") < closed.index("service_party_ended(")
    assert proof["target_executed"] is False
    return image, pe, admitted


def ordering_cases(image, pe, dependency):
    """Original control-false tail calls its sender before returning to the pump."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    start = int(dependency["control_reply_range"]["virtual_address"], 16)
    end = int(dependency["control_reply_range"]["end_exclusive"], 16)
    send = int(dependency["send_procedure"], 16)
    uc.mem_map(start & ~0xfff, 0x1000)
    uc.mem_map(send & ~0xfff, 0x1000)
    offset = pe.rva_offset(start - pe.image_base)
    uc.mem_write(start, image[offset:offset + end - start])
    uc.mem_map(0x26000000, 0x4000)
    sent, steps = [], 0
    frame, peer, service, stack = 0x26001000, 0x26002000, 0x26003000, 0x26003800

    def read(name):
        return uc.reg_read(getattr(reg, "UC_X86_REG_" + name))

    def hook(machine, address, size, _):
        nonlocal steps
        if address == end:
            machine.emu_stop()
            return
        if address == send:
            packet = bytes(machine.mem_read(read("R8"), 17))
            sent.append((read("RCX"), read("RDX"), packet))
            rsp = read("RSP")
            uc.reg_write(reg.UC_X86_REG_RIP, struct.unpack('<Q', machine.mem_read(rsp, 8))[0])
            uc.reg_write(reg.UC_X86_REG_RSP, rsp + 8)
            return
        assert start <= address < end
        steps += 1

    uc.hook_add(UC_HOOK_CODE, hook)
    for response in (False, True):
        sent.clear()
        uc.mem_write(frame, struct.pack('<Q', service))
        uc.mem_write(frame - 0x58, bytes([response]))
        uc.mem_write(peer - 0x18, struct.pack('<Q', 7))
        for name, value in [('RBP', frame), ('R14', peer), ('RBX', 5), ('RDX', 2), ('RSP', stack)]:
            uc.reg_write(getattr(reg, 'UC_X86_REG_' + name), value)
        uc.emu_start(start, 0, count=100)
        assert sent == ([] if response else [(service, 5, struct.pack('<QQB', 2, 7, 1))])
    return {"control_reply_cases": 2, "instruction_steps": steps}


def native_cases(image, pe, admitted):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    for lo, size in ((0x145bd7000, 0xb000), (0x145ccc000, 0x1000)):
        uc.mem_map(lo, size)
    for lo, hi in ((0x145bd7b80, 0x145bdabf2), (0x145be0190, 0x145be039f),
                   (0x145ccc2f0, 0x145ccc448)):
        offset = pe.rva_offset(lo - pe.image_base)
        uc.mem_write(lo, image[offset:offset + hi - lo])
    memory, stack, sentinel = 0x22000000, 0x23000000, 0x24000000
    uc.mem_map(memory, 0x20000)
    uc.mem_map(stack, 0x10000)
    uc.mem_map(sentinel, 0x1000)
    uc.mem_map(0x140002000, 0x1000)  # allocator seam, never executed
    uc.mem_map(0x146005000, 0x1000)  # memset seam, never executed
    endpoints, stops, frees = set(), [], []
    steps = 0

    def write(name, value):
        uc.reg_write(getattr(reg, "UC_X86_REG_" + name), value)

    def read(name):
        return uc.reg_read(getattr(reg, "UC_X86_REG_" + name))

    def qword(address, value):
        uc.mem_write(address, struct.pack("<Q", value))

    def value(address):
        return struct.unpack("<Q", uc.mem_read(address, 8))[0]

    def hook(machine, address, size, _):
        nonlocal steps
        if address in endpoints:
            stops.append(address)
            machine.emu_stop()
            return
        if address in (0x1400021d0, 0x14600505d):
            if address == 0x1400021d0:
                frees.append((read("RCX"), read("RDX"), read("R8")))
            else:
                machine.mem_write(read("RCX"), bytes([read("RDX") & 255]) * read("R8"))
            rsp = read("RSP")
            write("RIP", value(rsp))
            write("RSP", rsp + 8)
            return
        assert address in admitted, ("escaped native contract", hex(address))
        steps += 1

    uc.hook_add(UC_HOOK_CODE, hook)

    def run(start, ends):
        endpoints.clear()
        endpoints.update(ends)
        stops.clear()
        uc.emu_start(start, 0, count=10000)
        assert len(stops) == 1, (hex(start), stops)
        return stops[0]

    def call(start, pointer):
        write("RCX", pointer)
        write("RSP", stack + 0x8000)
        qword(stack + 0x8000, sentinel)
        run(start, (sentinel,))

    counts = {"admission": 0, "deque": 0, "inner_map": 0, "closed": 0}
    # Exact native flag/head writes after the two already-bound clear calls.
    for active, fatal, reconnecting, head, joined in itertools.product(
            range(2), range(2), range(2), (0, 1, 7), (False, True)):
        service, frame = memory + 0x1000, memory + 0x3000
        uc.mem_write(service, bytes([0x5a]) * 0x300)
        uc.mem_write(service + 0x1f8, bytes((active, fatal, reconnecting)))
        qword(service + 0x50, head)
        before = bytes(uc.mem_read(service, 0x300))
        write("RBP", frame)
        qword(frame + 0x300, service)
        write("RDI", service)
        if joined:
            run(0x145bd8129, (0x145bd8130,))
        run(0x145bd8152 if joined else 0x145bd826e,
            (0x145bd8163 if joined else 0x145bd8286,))
        after = bytes(uc.mem_read(service, 0x300))
        expected = bytearray(before)
        expected[0x50:0x58] = bytes(8)
        expected[0x1f9:0x1fb] = bytes(2)
        if joined:
            expected[0x1f8] = 1
        assert after == expected
        counts["admission"] += 1
    # Real truncate instructions over empty, contiguous and wrapped VecDeques.
    for capacity in (1, 2, 4, 8):
        for head, length in itertools.product(range(capacity), range(capacity + 1)):
            deque, buffer = memory + 0x1000, memory + 0x8000
            uc.mem_write(buffer, bytes(0x1000))
            uc.mem_write(deque, struct.pack("<QQQQ", capacity, buffer, head, length))
            expected = []
            for i in range(length):
                pointer = memory + 0x12000 + i * 16
                uc.mem_write(buffer + ((head + i) % capacity) * 24,
                             struct.pack("<QQQ", i + 1, pointer, i + 1))
                expected.append((pointer, i + 1, 1))
            frees.clear()
            write("RDX", 0)
            call(0x145ccc2f0, deque)
            assert value(deque + 24) == 0
            assert value(deque) == capacity and value(deque + 8) == buffer
            assert value(deque + 16) == head
            assert sorted(frees) == sorted(expected)
            counts["deque"] += 1
    # Real 112-byte relay row destructors and table emptying; allocator/memset
    # supply only their ordinary memory boundary, with every drop recorded.
    for members, length in itertools.product(range(4), range(4)):
        table, controls = memory + 0x1000, memory + 0x6000
        uc.mem_write(memory + 0x4000, bytes(0x10000))
        uc.mem_write(controls, bytes([255]) * 32)
        uc.mem_write(controls, bytes(members))
        uc.mem_write(table, struct.pack("<QQQQ", controls, 15, 14 - members, members))
        expected = []
        for bucket in range(members):
            end = controls - bucket * 112
            buffer = memory + 0x8000 + bucket * 0x1000
            qword(end - 0x68, 4)
            qword(end - 0x60, buffer)
            qword(end - 0x58, 3)
            qword(end - 0x50, length)
            for i in range(length):
                pointer = memory + 0x15000 + bucket * 0x100 + i * 16
                uc.mem_write(buffer + ((3 + i) % 4) * 32,
                             struct.pack("<QQQQ", i + 1, i + 1, pointer, i + 1))
                expected.append((pointer, i + 1, 1))
            expected.append((buffer, 128, 8))
        frees.clear()
        call(0x145be0190, table)
        assert value(table + 24) == 0
        assert sorted(frees) == sorted(expected)
        assert value(table) == controls and value(table + 8) == 15
        if members:
            assert value(table + 16) == 14
            assert bytes(uc.mem_read(controls, 32)) == bytes([255]) * 32
        counts["inner_map"] += 1
    # Closed27 disables guest admission; its separate inner-clear call is bound
    # in the selected assembly and source ordering above. Inbox/flags stay intact.
    for active, fatal, reconnecting in itertools.product(range(2), repeat=3):
        service, frame = memory + 0x1000, memory + 0x3000
        uc.mem_write(service, bytes([0x5a]) * 0x300)
        uc.mem_write(service + 0x1f8, bytes((active, fatal, reconnecting)))
        before = bytes(uc.mem_read(service, 0x300))
        write("RBP", frame)
        qword(frame + 0x300, service)
        run(0x145bd8316, (0x145bd8324,))
        expected = bytearray(before)
        expected[0x1f8] = 0
        assert bytes(uc.mem_read(service, 0x300)) == expected
        counts["closed"] += 1
    counts["total"] = sum(counts.values())
    counts["instruction_steps"] = steps
    return counts


if __name__ == "__main__":
    proof = json.loads(MANIFEST.read_text())
    image, pe, admitted = verify(proof)
    cases = native_cases(image, pe, admitted)
    ordering = ordering_cases(image, pe, proof["ordering_dependency"])
    print(json.dumps({"target": proof["target"]["version"], "queries": len(proof["queries"]),
                      "native_cases": cases, "ordering_dependency": ordering, "application_executed": False,
                      "limits": "Synthetic containers and allocator/memset seams; no application, transport, service or parity validation."}))
