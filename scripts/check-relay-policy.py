#!/usr/bin/env python3
"""Check current relay policy bytes, synthetic native branches and source wiring.

No Rust compilation, OS sockets, client/server process or game is invoked.
Unicorn executes only retained original instruction ranges in synthetic memory.
"""
import hashlib
import itertools
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.121.0/relay-policy/manifest.json"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def retained(row):
    path = project_path(row["path"])
    assert sha(path.read_bytes()) == row["sha256"], row["path"]
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
    assert target == proof["target"] and target["version"] == "0.121.0"
    if "state_producer_evidence" in proof:
        producers = json.loads(project_path(proof["state_producer_evidence"]).read_text())
        assert producers["target"] == target
        assert {"selected-endpoint-initial-install", "initial-failure-close"} <= {
            row["role"] for row in producers["native_ranges"]
        }
        verify(producers)
    image = target_bytes(target)
    pe = load_script("relay_policy_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16)
        assert raw == bytes.fromhex(row["bytes_hex"]) and sha(raw) == row["sha256"], row["role"]
        if "assembly" in row:
            instructions = list(decoder.disasm(raw, start))
            assert sum(i.size for i in instructions) == len(raw), row["role"]
            assert len(instructions) == row["instruction_count"]
            text = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n"
                           for i in instructions)
            assert retained(row["assembly"]).read_text() == text
    for query in proof["queries"]:
        raw = json.loads(retained(query["result"]).read_text())
        native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
        assert sha(native["normalized_result"].encode()) == query["normalized_text_sha256"]
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    data = {r["role"]: r for r in proof["native_data"]}
    if "guest-vtable" in data:
        assert struct.unpack_from("<Q", bytes.fromhex(data["guest-vtable"]["bytes_hex"]), 0x48)[0] == 0x145c64be0
    assert proof["target_executed"] is False


def native_cases(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()

    def mapped_write(address, raw):
        for page in range(address & ~4095, (address + len(raw) + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)
        machine.mem_write(address, raw)

    for row in proof["native_ranges"] + proof["native_data"]:
        mapped_write(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    heap, stack, frame, stop = 0x22000000, 0x23000000, 0x23010000, 0x2301fff0
    mapped_write(heap, bytes(0x10000))
    mapped_write(stack, bytes(0x20000))
    for address in (0x145f95950, 0x145fc7490, 0x145c656b0, 0x145fbe970,
                    0x145c59261, 0x145c59312, 0x145c59d6e, 0x145b1604a, 0x145b32800):
        mapped_write(address, b"\xc3")
    # Native calls outside each retained range are explicit synthetic seams.
    mode, outcome, calls = None, [], []
    elapsed, socket_state = 0.0, 0
    worker_state, worker_close, factory = heap + 0xf000, heap + 0xf010, heap + 0xf020

    def qword(address):
        return struct.unpack("<Q", machine.mem_read(address, 8))[0]

    def writeq(address, value):
        machine.mem_write(address, struct.pack("<Q", value))

    def ret(value=None, second=None):
        if value is not None:
            machine.reg_write(reg.UC_X86_REG_RAX, value)
        if second is not None:
            machine.reg_write(reg.UC_X86_REG_RDX, second)
        sp = machine.reg_read(reg.UC_X86_REG_RSP)
        machine.reg_write(reg.UC_X86_REG_RIP, qword(sp))
        machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def hook(uc, address, _size, _context):
        if address == stop:
            outcome.append(uc.reg_read(reg.UC_X86_REG_RAX) & 0xff)
            uc.emu_stop()
        elif mode == "health" and address in (0x145c59261, 0x145c59312, 0x145c59d6e, 0x145c5914b):
            outcome.append({0x145c59261: "healthy", 0x145c59312: "admitted-retry",
                            0x145c59d6e: "failed-or-absent", 0x145c5914b: "fallback"}[address])
            uc.emu_stop()
        elif mode == "health" and address == worker_state:
            ret(socket_state)
        elif mode == "health" and address == worker_close:
            calls.append("close")
            ret()
        elif mode == "health" and address == factory:
            calls.append(("open", uc.reg_read(reg.UC_X86_REG_RCX), uc.reg_read(reg.UC_X86_REG_RDX)))
            ret(heap + 0x7000, heap + 0x8000)
        elif mode == "health" and address == 0x145f95950:
            seconds = int(elapsed)
            ret(seconds, round((elapsed - seconds) * 1_000_000_000))
        elif mode == "terminal" and address == worker_state:
            ret(socket_state)
        elif mode == "terminal" and address == 0x145b1604a:
            outcome.append(None)
            uc.emu_stop()
        elif mode == "terminal" and address == 0x145b32800:
            pointer = uc.reg_read(reg.UC_X86_REG_RDX)
            length = uc.reg_read(reg.UC_X86_REG_R8)
            outcome.append(bytes(uc.mem_read(pointer, length)).decode())
            uc.emu_stop()
        elif mode == "url" and address == 0x145c656b0:
            # str split_once('/') iterator interface: exact match start/end.
            result = uc.reg_read(reg.UC_X86_REG_RCX)
            iterator = uc.reg_read(reg.UC_X86_REG_RDX)
            pointer, length = qword(iterator), qword(iterator + 8)
            found = bytes(uc.mem_read(pointer, length)).find(b"/")
            uc.mem_write(result, bytes([int(found >= 0)]))
            if found >= 0:
                writeq(result + 8, found)
                writeq(result + 16, found + 1)
            ret()
        elif mode == "url" and address == 0x145fc7490:
            pointer = uc.reg_read(reg.UC_X86_REG_RDX)
            count = uc.reg_read(reg.UC_X86_REG_R8)
            needle = bytes([uc.reg_read(reg.UC_X86_REG_RCX) & 0xff])
            found = bytes(uc.mem_read(pointer, count)).rfind(needle)
            ret(int(found >= 0), max(found, 0))
        elif mode == "url" and address == 0x145fbe970:
            args = uc.reg_read(reg.UC_X86_REG_R8)
            values = []
            for index in range(3):
                pair = qword(args + index * 16)
                pointer, length = qword(pair), qword(pair + 8)
                values.append(bytes(uc.mem_read(pointer, length)).decode() if length else "")
            outcome.append(values[0] + "://" + values[1] + "/" + values[2])
            uc.emu_stop()
        elif mode == "url" and address == 0x145c58d6a:
            outcome.append(None)
            uc.emu_stop()

    machine.hook_add(UC_HOOK_CODE, hook)

    def reset():
        outcome.clear()
        calls.clear()
        machine.mem_write(heap, bytes(0x10000))
        machine.mem_write(stack, bytes(0x20000))
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            machine.reg_write(getattr(reg, "UC_X86_REG_" + name), 0)
        machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x1f008)
        writeq(stack + 0x1f008, stop)

    mode = "getter"
    getter_cases = 0
    for selected, admitted, failed in (itertools.product((False, True), repeat=3) if 216 in proof["gap_ids"] else []):
        reset()
        writeq(heap, heap + 0x1000)
        writeq(heap + 0x1078, 0 if selected else 0xffffffffffffffff)
        machine.mem_write(heap + 0x1158, bytes((admitted, failed)))
        mapped_write(0x1485c6b78, struct.pack("<Q", heap + 0x2000))
        machine.reg_write(reg.UC_X86_REG_RCX, heap)
        machine.emu_start(0x145c64be0, stop, count=256)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
        if not outcome:
            outcome.append(machine.reg_read(reg.UC_X86_REG_RAX) & 0xff)
        assert outcome == [int(selected and failed and not admitted)]
        getter_cases += 1

    mode = "health"
    health_cases, one_shot_cases = 0, 0
    for selected, failed, admitted, alternate, socket_state, elapsed in (itertools.product(
            (False, True), (False, True), (False, True), (False, True), (0, 1, 2), (0., 8., 8.001, 15., 15.001)) if 215 in proof["gap_ids"] else []):
        reset()
        owner, vtable, endpoint = heap + 0x1000, heap + 0x2000, heap + 0x3000
        writeq(owner + 0x60, 0 if selected else 0xffffffffffffffff)
        machine.mem_write(owner + 0x140, bytes((admitted, failed)))
        writeq(owner + 0x190, factory)
        writeq(owner + 0x130, heap + 0x4000)
        writeq(owner + 0x138, vtable)
        writeq(vtable + 0x28, worker_state)
        writeq(vtable + 0x30, worker_close)
        writeq(owner + 0xe0, endpoint)
        writeq(owner + 0xe8, 19)
        writeq(frame + 0x50, owner + 0xd8)
        writeq(owner + 0xd8, 19 if alternate else 0xffffffffffffffff)
        machine.mem_write(owner + 0x128, struct.pack("<I", 0xffffffff))
        machine.reg_write(reg.UC_X86_REG_RBP, frame)
        machine.reg_write(reg.UC_X86_REG_R12, owner)
        expected = "failed-or-absent"
        if selected and not failed:
            if (socket_state == 0 and elapsed <= 8.) or (socket_state == 1 and elapsed <= 15.):
                expected = "healthy"
            elif admitted:
                expected = "admitted-retry"
            elif alternate:
                expected = "fallback"
        try:
            machine.emu_start(0x145c58fd6, stop, count=256)
        except Exception as error:
            raise AssertionError((selected, failed, admitted, alternate, socket_state, elapsed,
                                  hex(machine.reg_read(reg.UC_X86_REG_RIP)))) from error
        assert outcome == [expected], (selected, failed, admitted, alternate, socket_state, elapsed, outcome)
        if expected == "fallback":
            assert qword(owner + 0xd8) == 0xffffffffffffffff
            assert calls == ["close", ("open", endpoint, 19)]
            outcome.clear()
            calls.clear()
            machine.emu_start(0x145c58fd6, stop, count=256)
            assert outcome == ["failed-or-absent"]
            assert bytes(machine.mem_read(owner + 0x141, 1)) == b"\x01"
            assert calls == ["close"]
            one_shot_cases += 1
        elif expected == "admitted-retry":
            assert qword(owner + 0xd8) == (19 if alternate else 0xffffffffffffffff)
        health_cases += 1

    mode = "terminal"
    terminal_cases = 0
    for socket_state, selected, admitted, failed in (itertools.product((False, True), repeat=4) if 216 in proof["gap_ids"] else []):
        reset()
        owner, context, handle, vtable = heap + 0x1000, heap + 0x4000, heap + 0x6000, heap + 0x7000
        writeq(handle, owner)
        writeq(context + 0x1088, handle)
        writeq(context + 0x1090, vtable)
        writeq(vtable + 0x28, worker_state)
        writeq(vtable + 0x48, 0x145c64be0)
        writeq(owner + 0x78, 0 if selected else 0xffffffffffffffff)
        machine.mem_write(owner + 0x158, bytes((admitted, failed)))
        mapped_write(0x1485c6b78, struct.pack("<Q", heap + 0x2000))
        machine.reg_write(reg.UC_X86_REG_RDI, context)
        machine.emu_start(0x145b15efc, stop, count=512)
        expected = None if socket_state else ("the co-op relay cannot be reached"
                    if selected and failed and not admitted else "the host left")
        assert outcome == [expected], (socket_state, selected, admitted, failed, outcome)
        terminal_cases += 1

    mode = "url"
    for original, expected in proof.get("url_cases", []):
        reset()
        raw = original.encode()
        delimiter = original.index("://")
        machine.mem_write(heap, raw)
        writeq(frame + 0x300, len(raw))
        writeq(frame + 0x310, heap)
        machine.reg_write(reg.UC_X86_REG_RBP, frame)
        machine.reg_write(reg.UC_X86_REG_RBX, delimiter + 3)
        machine.reg_write(reg.UC_X86_REG_R8, delimiter)
        machine.emu_start(0x145c58c39, stop, count=1024)
        assert outcome == [expected], (original, expected, outcome)
    return {"getter_cases": getter_cases, "initial_health_cases": health_cases, "one_shot_cases": one_shot_cases,
            "terminal_reason_cases": terminal_cases, "url_suffix_cases": len(proof.get("url_cases", []))}


def source_wiring(proof):
    source = ROOT / "crates/azeroth-survivors-re/src"
    lifetime = (source / "coop/relay_lifetime.rs").read_text()
    directory = (source / "coop_directory.rs").read_text()
    session = (source / "coop/session.rs").read_text()
    runtime = (source / "coop_runtime.rs").read_text()
    forms = (source / "coop_forms.rs").read_text()
    relay = (source / "coop/relay.rs").read_text()
    if 215 in proof["gap_ids"]:
        assert 'url.split_once("://")?' in lifetime and "authority.rsplit_once(':')?" in lifetime
        assert lifetime.index("if !self.admitted") < lifetime.index("std::mem::take(&mut self.fallback)")
        replacement = directory.split("action @ (Action::Reopen | Action::Fallback)", 1)[1].split("\nfn transport_closed", 1)[0]
        assert replacement.index("worker.stop()") < replacement.index("config.alternate.take()") < replacement.index("config.url = alternate")
        assert replacement.index("Worker::open(config.url.clone())") < replacement.index("ClientMessage::Authenticate(config.auth.clone())") < replacement.index("ClientMessage::Heartbeat") < replacement.index("lifetime.reopened(Instant::now())")
        assert "if action == Action::Fallback" in replacement and "service_relay_fallback(&service.relay_protocol)" in replacement
        rewind = relay.split("fn initial_fallback", 1)[1].split("\n    }", 1)[0]
        assert "peer.sent = 0" in rewind and "control_pending" not in rewind
        # Source ordering is inspected, not executed: failed replacement retains the
        # old selected worker/lifetime for the next bounded unhealthy observation.
        assert "service.secondary = Some(worker)" in replacement
    if 216 in proof["gap_ids"]:
        assert "self.failed && !self.admitted" in lifetime
        assert "self.service && !self.is_hosting() && self.relay_initial_failure" in session
        assert directory.index("poll_secondary(&mut service") < directory.index("driver.service_relay_initial_failure(")
        assert "service.secondary_config.is_some()" in directory and "state.initial_failure()" in directory
        closed = directory.split("fn transport_closed(", 1)[1].split("fn initialize_identity", 1)[0]
        guest = closed.split("if secondary && !host", 1)[1].split("} else {", 1)[0]
        assert "driver.service_peer_closed(0)" in guest
        assert "service.secondary_config = None" not in guest and "service.secondary_lifetime = None" not in guest
        terminal = runtime.split("if !driver.is_hosting() && !driver.connected()", 1)[1].split("runtime.incoming", 1)[0]
        assert terminal.index("if driver.denial.is_none()") < terminal.index("driver.relay_unreachable()")
        assert '"the co-op relay cannot be reached"' in terminal and '"the host left"' in terminal
        assert '"the co-op relay cannot be reached"' in forms.split("fn localized_reason", 1)[1].split("\n}", 1)[0]

def main(manifest=MANIFEST):
    proof = json.loads(manifest.read_text())
    verify(proof)
    result = native_cases(proof)
    source_wiring(proof)
    print(json.dumps({"target": proof["target"]["version"], "ranges": len(proof["native_ranges"]),
                      "queries": len(proof["queries"]), **result,
                      "application_executed": False, "parity_verified": False}, indent=2))


if __name__ == "__main__":
    main()
