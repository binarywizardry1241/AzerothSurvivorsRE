#!/usr/bin/env python3
"""Replay current native rank tokens and tuple ordering; never build/run a game.

The delimiter iterator and descriptor allocation are declared synthetic seams.
The former returns the actual colon boundary; the latter supplies the synthetic
gear-class/non-gear distinction. This does not execute the descriptor generator,
file I/O, reconstructed Rust, UI, networking or the application.
"""
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


def replay():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r

    target = latest_target(verify=True)
    assert target["sha256"] == "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
    image = target_bytes(target)
    pe = load_script("gear_records_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    source_root = Path(__file__).resolve().parents[1]
    proof = json.loads((source_root / "docs/analysis/evidence/0.121.0/gear-records.json").read_text())
    assert proof["target"] == {key: target[key] for key in ("version", "path", "sha256", "size_bytes")}
    for row in proof["source_bindings"]:
        assert hashlib.sha256((source_root / row["path"]).read_bytes()).hexdigest() == row["sha256"]
    for query in proof["queries"]:
        for role in ("plan", "journal", "result", "raw_input"):
            path = ROOT / query[role]["path"]
            assert hashlib.sha256(path.read_bytes()).hexdigest() == query[role]["sha256"]
        raw = json.loads((ROOT / query["result"]["path"]).read_text())
        native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
        assert hashlib.sha256(native["normalized_result"].encode()).hexdigest() == query["normalized_text_sha256"]
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    ranges = []
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    for start, size in ((0x145ab6000, 0x1000), (0x145ab8000, 0x1000),
                        (0x145b01000, 0x1000), (0x140002000, 0x1000),
                        (0x145cac000, 0x2000), (0x22000000, 0x20000),
                        (0x23000000, 0x20000)):
        machine.mem_map(start, size)
    for a, b in ((0x145ab6a50, 0x145ab6e1c), (0x145cace10, 0x145cacec9)):
        at = pe.rva_offset(a - pe.image_base)
        raw = image[at:at + b - a]
        instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, a))
        assert sum(i.size for i in instructions) == len(raw)
        machine.mem_write(a, raw)
        ranges.append({"virtual_address": hex(a), "file_offset": hex(at),
                       "byte_count": len(raw), "sha256": hashlib.sha256(raw).hexdigest(),
                       "instruction_count": len(instructions)})
    stop, out, token, context, cap = 0x2301fff0, 0x22000000, 0x22001000, 0x22000080, 0x22000090
    for address in (0x145ab8f70, 0x145b01970, 0x1400021d0, stop):
        machine.mem_write(address, b"\xc3")
    state = {}

    def word(address):
        return struct.unpack("<Q", machine.mem_read(address, 8))[0]

    def ret():
        sp = machine.reg_read(r.UC_X86_REG_RSP)
        machine.reg_write(r.UC_X86_REG_RIP, word(sp))
        machine.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(uc, address, _size, _data):
        state["steps"] += 1
        if address == stop:
            uc.emu_stop()
        elif address == 0x145ab8f70:
            destination = uc.reg_read(r.UC_X86_REG_RCX)
            value = state["token"].encode()
            delimiter = value.find(b":")
            result = struct.pack("<IIQQ", int(delimiter >= 0), 0,
                                 max(delimiter, 0), max(delimiter + 1, 0))
            uc.mem_write(destination, result)
            ret()
        elif address == 0x145b01970:
            destination = uc.reg_read(r.UC_X86_REG_RCX)
            item = uc.reg_read(r.UC_X86_REG_RDX) & 0xffffffff
            value = bytearray(0x70)
            if item in (101000, 101010, 104960):
                value[0x69] = 1
            else:
                value[:8] = bytes([255]) * 8
            uc.mem_write(destination, bytes(value))
            ret()
        elif address == 0x1400021d0:
            ret()
        else:
            assert (0x145ab6a50 <= address < 0x145ab6e1c or
                    0x145cace10 <= address < 0x145cacec9), hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)

    def reset():
        machine.mem_write(0x22000000, bytes(0x20000))
        machine.mem_write(0x23000000, bytes(0x20000))
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            machine.reg_write(getattr(r, "UC_X86_REG_" + name), 0)
        machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
        machine.reg_write(r.UC_X86_REG_RSP, 0x2301f008)
        machine.mem_write(0x2301f008, struct.pack("<Q", stop))
        state.clear()
        state["steps"] = 0

    cases, steps = [], 0
    inputs = ["101000:1", "101000:5", "101000:6", "101000:255", "101000:256",
              "101000:0", "101000:0001", "+101000:+2", "101000:-1", "-101000:2",
              "101000:", ":1", "101000", "101000:1:2", "101000 :1", " 101000:1",
              "101000: 1", "1:2", "4294967295:2", "4294967296:2", "101010:3", "104960:5"]
    for maximum in (5, 255):
        for value in inputs:
            reset()
            state["token"] = value
            machine.mem_write(token, value.encode())
            machine.mem_write(context, struct.pack("<QQ", context + 8, cap))
            machine.mem_write(cap, bytes([maximum]))
            machine.reg_write(r.UC_X86_REG_RCX, out)
            machine.reg_write(r.UC_X86_REG_RDX, context)
            machine.reg_write(r.UC_X86_REG_R8, token)
            machine.reg_write(r.UC_X86_REG_R9, len(value.encode()))
            machine.emu_start(0x145ab6a50, stop, count=2000)
            assert machine.reg_read(r.UC_X86_REG_RIP) == stop
            tag, item = struct.unpack("<II", machine.mem_read(out, 8))
            count = machine.mem_read(out + 8, 1)[0]
            actual = [item, count] if tag else None
            if value in ("101000:1", "101000:5", "101000:6", "101000:255", "101000:0001", "+101000:+2", "101010:3", "104960:5"):
                expected = [int(value.split(":")[0]), min(int(value.split(":")[1]), maximum)]
            else:
                expected = None
            assert actual == expected, (value, maximum, actual, expected)
            cases.append({"token": value, "cap": maximum, "expected": actual})
            steps += state["steps"]
    ordering = []
    for values in ([(101010, 5), (101000, 4), (101010, 1), (101000, 2)],
                   [(101000, 2), (101000, 5), (101000, 1)],
                   [(104960, 5), (101010, 1), (101000, 1)]):
        reset()
        machine.mem_write(out, b"".join(struct.pack("<IB3x", *row) for row in values))
        machine.reg_write(r.UC_X86_REG_RCX, out)
        machine.reg_write(r.UC_X86_REG_RDX, len(values))
        machine.reg_write(r.UC_X86_REG_R8, 1)
        machine.emu_start(0x145cace10, stop, count=2000)
        assert machine.reg_read(r.UC_X86_REG_RIP) == stop
        actual = [struct.unpack("<IB3x", machine.mem_read(out + i * 8, 8)) for i in range(len(values))]
        assert actual == sorted(values)
        ordering.append({"input": values, "sorted": actual})
        steps += state["steps"]
    assert ranges == proof["ranges"]
    assert cases == proof["token_cases"]
    assert json.loads(json.dumps(ordering)) == proof["tuple_sort_cases"]
    assert steps == proof["original_instruction_steps"]
    return {"target": {key: target[key] for key in ("version", "sha256", "size_bytes")},
            "ranges": ranges, "token_cases": cases, "tuple_sort_cases": ordering,
            "original_instruction_steps": steps, "result": "passed",
            "limits": "Synthetic delimiter and descriptor seams; native application, reconstructed Rust and file I/O are not executed."}


if __name__ == "__main__":
    print(json.dumps(replay(), indent=2))
