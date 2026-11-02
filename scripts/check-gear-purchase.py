#!/usr/bin/env python3
"""Replay native star admission, discount and atomic debit without an application.

Descriptor allocation, ceilf/roundf and memmove are explicit synthetic seams;
ownership, class-wide armor counting, Heroic caps and debit execute original
instructions. No Rust compilation, client, network or server is involved.
"""
import hashlib
import json
import math
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


def replay(verify=True):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    target = latest_target(verify=True)
    assert target["sha256"] == "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
    image = target_bytes(target)
    pe = load_script("gear_purchase_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    for start, size in ((0x145aa4000, 0x2000), (0x145ab4000, 0x1000),
                        (0x145b01000, 0x1000), (0x145feb000, 0x1000), (0x140002000, 0x1000),
                        (0x146198000, 0x1000), (0x14623c000, 0x1000), (0x1461aa000, 0x1000),
                        (0x146fb2000, 0x1000), (0x146fc0000, 0x1000),
                        (0x146fc8000, 0x2000), (0x147695000, 0x1000),
                        (0x22000000, 0x60000), (0x23000000, 0x20000)):
        machine.mem_map(start, size)
        if start >= 0x146000000 and start < 0x150000000:
            at = pe.rva_offset(start - pe.image_base)
            machine.mem_write(start, image[at:at + size])
    ranges = []
    for a, b in ((0x145aa4ea0, 0x145aa52d6), (0x145aa52e0, 0x145aa56e0),
                 (0x145ab44d0, 0x145ab471b)):
        # The discount extent is selected independently from the PE unwind table.
        if a == 0x145aa52e0:
            b = next(pe.image_base + row[1] for row in pe.functions() if pe.image_base + row[0] == a)
        at = pe.rva_offset(a - pe.image_base)
        raw = image[at:at + b - a]
        instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, a))
        assert sum(i.size for i in instructions) == len(raw)
        machine.mem_write(a, raw)
        ranges.append({"virtual_address": hex(a), "file_offset": hex(at), "byte_count": len(raw),
                       "sha256": hashlib.sha256(raw).hexdigest(), "instruction_count": len(instructions)})
    save, out, stop = 0x22001000, 0x22000000, 0x2301fff0
    state = {}
    for address in (0x145b01970, 0x1400021d0, 0x145febc63, 0x145febc75, 0x145febc2d, stop):
        machine.mem_write(address, b"\xc3")

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
        elif address == 0x145b01970:
            destination = uc.reg_read(r.UC_X86_REG_RCX)
            item = uc.reg_read(r.UC_X86_REG_RDX) & 0xffffffff
            value = bytearray(0x70)
            if 100000 <= item < 112000 and item % 10 == 0 and (item // 1000) % 100 in (1, 2, 3, 4, 5, 7, 8, 9, 11):
                struct.pack_into("<Q", value, 0x30, min((item % 100) // 10, 5))
                value[0x69] = (item // 1000) % 100
            else:
                value[:8] = bytes([255]) * 8
            uc.mem_write(destination, bytes(value))
            ret()
        elif address in (0x145febc63, 0x145febc75):
            value = struct.unpack("<f", (uc.reg_read(r.UC_X86_REG_XMM0) & 0xffffffff).to_bytes(4, "little"))[0]
            value = math.ceil(value) if address == 0x145febc63 else math.floor(value + 0.5)
            uc.reg_write(r.UC_X86_REG_XMM0, int.from_bytes(struct.pack("<f", value), "little"))
            ret()
        elif address == 0x145febc2d:
            destination, source, count = (uc.reg_read(reg) for reg in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
            uc.mem_write(destination, bytes(uc.mem_read(source, count)))
            ret()
        elif address == 0x1400021d0:
            ret()
        else:
            assert any(int(row["virtual_address"], 16) <= address < int(row["virtual_address"], 16) + row["byte_count"] for row in ranges), hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)
    classes = [1, 2, 3, 4, 5, 7, 8, 9, 11]
    cases, steps = [], 0

    def f32(value):
        return struct.unpack("<f", struct.pack("<f", value))[0]

    for tier in range(6):
        for prior in range(6):
            for other_classes in (0, 1, 8):
                for cleared in (0, 3, 5):
                    machine.mem_write(0x22000000, bytes(0x60000))
                    machine.mem_write(0x23000000, bytes(0x20000))
                    machine.mem_write(stop, b"\xc3")
                    state["steps"] = 0
                    item = 101000 + tier * 10
                    owned, stars = [item], ([(item, prior)] if prior else [])
                    for other in classes[1:1 + other_classes]:
                        for slot in range(8):
                            key = 100000 + other * 1000 + slot * 100 + tier * 10
                            owned.append(key)
                            stars.append((key, min(prior + 1, 5)))
                    owned.sort();stars.sort()
                    for offset, pointer, values, fmt in ((0x30, 0x22010000, owned, "<I"),
                                                         (0x198, 0x22020000, stars, "<IB3x")):
                        machine.mem_write(save + offset, struct.pack("<QQQ", 1024, pointer, len(values)))
                        machine.mem_write(pointer, b"".join(struct.pack(fmt, *value) if isinstance(value, tuple) else struct.pack(fmt, value) for value in values))
                    zone = [0, 2, 4, 6, 10, 8][tier]
                    machine.mem_write(save + 0x1c8, struct.pack("<QQQ", 1024, 0x22030000, int(cleared != 0)))
                    machine.mem_write(0x22030000, struct.pack("<QBB6x", zone, 1, cleared))
                    machine.mem_write(save + 0x180, struct.pack("<QQQ", 1024, 0x22040000, 1))
                    machine.mem_write(0x22040000, struct.pack("<B3xI", 1, 500))
                    for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
                        machine.reg_write(getattr(r, "UC_X86_REG_" + name), 0)
                    machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
                    machine.reg_write(r.UC_X86_REG_RSP, 0x2301f008)
                    machine.mem_write(0x2301f008, struct.pack("<Q", stop))
                    machine.reg_write(r.UC_X86_REG_RCX, out)
                    machine.reg_write(r.UC_X86_REG_RDX, save)
                    machine.reg_write(r.UC_X86_REG_R8, item)
                    machine.emu_start(0x145aa4ea0, stop, count=30000)
                    assert machine.reg_read(r.UC_X86_REG_RIP) == stop
                    error = machine.mem_read(out, 1)[0]
                    if prior == 5:
                        expected = {"error": 1}
                    elif prior + 1 > cleared:
                        expected = {"error": 2}
                    else:
                        rank = prior + 1
                        base = 6 if rank == 5 and tier <= 3 else [1, 2, 3, 4, 6, 5][tier]
                        discount = min(f32(other_classes * f32(.05)), f32(.4))
                        cost = f32(math.ceil(f32(f32(f32(f32(1 - discount) * rank) * base) * 10) - f32(.001)) / 10)
                        expected = {"rank": rank, "cost": cost}
                    actual = {"error": machine.mem_read(out + 1, 1)[0]} if error else {
                        "rank": machine.mem_read(out + 4, 1)[0], "cost": struct.unpack("<f", machine.mem_read(out + 8, 4))[0]}
                    assert actual == expected, (tier, prior, other_classes, cleared, actual, expected)
                    cases.append({"tier": tier, "prior": prior, "other_classes": other_classes,
                                  "cleared": cleared, "expected": actual})
                    steps += state["steps"]
                    if not error:
                        for balance in (0, 500):
                            machine.mem_write(0x22040004, struct.pack("<I", balance))
                            machine.mem_write(save + 0x1a8, struct.pack("<Q", len(stars)))
                            machine.mem_write(0x22020000, b"".join(struct.pack("<IB3x", *value) for value in stars))
                            machine.reg_write(r.UC_X86_REG_RSP, 0x2301f008)
                            machine.mem_write(0x2301f008, struct.pack("<Q", stop))
                            machine.reg_write(r.UC_X86_REG_RCX, save)
                            machine.reg_write(r.UC_X86_REG_RDX, item)
                            state["steps"] = 0
                            machine.emu_start(0x145ab44d0, stop, count=30000)
                            assert machine.reg_read(r.UC_X86_REG_RIP) == stop
                            failed = machine.reg_read(r.UC_X86_REG_RAX) & 0xff
                            new_balance = struct.unpack("<I", machine.mem_read(0x22040004, 4))[0]
                            if balance == 0:
                                assert failed == 1 and machine.reg_read(r.UC_X86_REG_RDX) & 0xff == 3
                                assert new_balance == balance
                            else:
                                assert failed == 0 and new_balance == balance - math.floor(actual["cost"] * 10 + .5)
                                length = word(save + 0x1a8)
                                rows = [struct.unpack("<IB3x", machine.mem_read(0x22020000 + i * 8, 8)) for i in range(length)]
                                assert rows == sorted(rows) and dict(rows)[item] == actual["rank"]
                            steps += state["steps"]
    result = {"target": {key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
              "ranges": ranges, "offer_cases": cases, "native_instruction_steps": steps,
              "result": "passed", "limits": "Synthetic descriptor, CRT math and memmove; reconstructed Rust and game/client/server/network do not execute."}
    if verify:
        source_root = Path(__file__).resolve().parents[1]
        proof = json.loads((source_root / "docs/analysis/evidence/0.121.0/gear-purchase.json").read_text())
        for row in proof["source_bindings"]:
            assert hashlib.sha256((source_root / row["path"]).read_bytes()).hexdigest() == row["sha256"]
        for key in result:
            assert proof[key] == result[key], key
        for query in proof["queries"]:
            for role in ("plan", "journal", "result", "raw_input"):
                assert hashlib.sha256((ROOT / query[role]["path"]).read_bytes()).hexdigest() == query[role]["sha256"]
            raw = json.loads((ROOT / query["result"]["path"]).read_text())
            native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
            verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    return result


if __name__ == "__main__":
    result = replay()
    print(json.dumps({key: value for key, value in result.items() if key != "offer_cases"}, indent=2))
