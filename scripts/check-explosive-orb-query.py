#!/usr/bin/env python3
"""Verify the bounded 0.121.0 Orb query identity, with explicit library seams.

No compilation, game/client/server operation or reconstructed Rust execution.
The original instruction fixture stops at the metadata constructor interface.
"""
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, file_sha256, json_text, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


MANIFEST = ROOT / "docs/analysis/evidence/orb-query/manifest.json"


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"]
    image = target_bytes(target)
    pe = load_script("orb_query_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        at = pe.rva_offset(int(row["virtual_address"], 16) - pe.image_base)
        raw = image[at:at + row["byte_count"]]
        assert at == int(row["file_offset"], 16)
        assert raw == bytes.fromhex(row["bytes_hex"])
        assert hashlib.sha256(raw).hexdigest() == row["sha256"]
        if row in proof["native_ranges"]:
            instructions = list(decoder.disasm(raw, int(row["virtual_address"], 16)))
            assert sum(i.size for i in instructions) == len(raw)
            assert len(instructions) == row["instruction_count"]
    for binding in proof["inputs"] + proof["source_bindings"]:
        assert file_sha256(project_path(binding["path"])) == binding["sha256"], binding["path"]
    query = proof["queries"][0]
    raw = json.loads(project_path(query["result"]["path"]).read_text())
    native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
    assert hashlib.sha256(native["normalized_result"].encode()).hexdigest() == query["normalized_text_sha256"]
    verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    rows = {row["role"]: row for row in proof["native_data"]}
    table = rows["entry-table"]
    cells = list(struct.iter_unpack("<i", bytes.fromhex(table["bytes_hex"])))
    assert len(cells) == 113 and int(table["virtual_address"], 16) + cells[112][0] == 0x145b1142e
    opcode = rows["opcode-table"]
    assert int(opcode["virtual_address"], 16) + struct.unpack_from("<i", bytes.fromhex(opcode["bytes_hex"]), 21 * 4)[0] == 0x145b0f862
    descriptor = bytes.fromhex(rows["orb-descriptor"]["bytes_hex"])
    assert struct.unpack("<QQIIII", descriptor) == (0x146fc0b2f, 13, 9612, 16111, 0x3f666666, 0)
    source = project_path("crates/azeroth-survivors-re/src/gameplay/client/creature_queries.rs").read_text()
    assert re.search(r'\(9612,\s*"",\s*"",\s*"",\s*8,\s*10990\)', source)
    assert "opcode::CMSG_CREATURE_QUERY =>" in project_path("crates/azeroth-survivors-re/src/gameplay/coop_commands.rs").read_text()
    assert "parse_server(opcode, &body)" in project_path("crates/azeroth-survivors-re/src/gameplay/client/query_packets.rs").read_text()


def replay(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    mapped, allowed = set(), set()

    def memory(address, size):
        for page in range(address & ~4095, (address + size + 4095) & ~4095, 4096):
            if page not in mapped:
                machine.mem_map(page, 4096)
                mapped.add(page)

    for row in proof["native_ranges"] + proof["native_data"]:
        address, raw = int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"])
        memory(address, len(raw))
        machine.mem_write(address, raw)
        if row in proof["native_ranges"]:
            allowed.update(i.address for i in decoder.disasm(raw, address))
    format_call, lookup_call, free_call, constructor = 0x145fbe970, 0x145aeaf60, 0x1400021d0, 0x145b85c20
    for address in (format_call, lookup_call, free_call, constructor):
        memory(address, 1)
        machine.mem_write(address, b"\xc3")
    memory(0x22000000, 0x20000)
    memory(0x23000000, 0x20000)
    stack, stop, descriptor = 0x2301f000, 0x2301fff0, 0x146fc0cc0
    machine.mem_write(stop, b"\xf4")
    state, cases = {}, []
    instruction_count = 0

    def word(address):
        return struct.unpack("<Q", machine.mem_read(address, 8))[0]

    def return_from_seam():
        sp = machine.reg_read(r.UC_X86_REG_RSP)
        machine.reg_write(r.UC_X86_REG_RIP, word(sp))
        machine.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(_, address, size, user):
        nonlocal instruction_count
        if address == stop:
            machine.emu_stop()
            return
        if address == format_call:
            output, program, args = (machine.reg_read(reg) for reg in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
            assert program == 0x146fb21e0 and word(args) == descriptor + 0x10 and word(args + 8) == 0x145fd0420
            assert struct.unpack("<I", machine.mem_read(word(args), 4))[0] == 9612
            key = b"object.9612.name"
            machine.mem_write(0x22000100, key)
            machine.mem_write(output, struct.pack("<QQQ", state["capacity"], 0x22000100, len(key)))
            return_from_seam()
            return
        if address == lookup_call:
            key, length = (machine.reg_read(reg) for reg in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX))
            assert bytes(machine.mem_read(key, length)) == b"object.9612.name"
            translation = state["translation"]
            if translation is None:
                machine.reg_write(r.UC_X86_REG_RAX, 0)
                machine.reg_write(r.UC_X86_REG_RDX, 999)
            else:
                machine.mem_write(0x22000200, translation or b"\0")
                machine.reg_write(r.UC_X86_REG_RAX, 0x22000200)
                machine.reg_write(r.UC_X86_REG_RDX, len(translation))
            return_from_seam()
            return
        if address == free_call:
            assert (machine.reg_read(r.UC_X86_REG_RCX), machine.reg_read(r.UC_X86_REG_RDX), machine.reg_read(r.UC_X86_REG_R8)) == (0x22000100, state["capacity"], 1)
            state["frees"] += 1
            return_from_seam()
            return
        if address == constructor:
            sp = machine.reg_read(r.UC_X86_REG_RSP)
            assert machine.reg_read(r.UC_X86_REG_RDX) == 9612
            name, length = machine.reg_read(r.UC_X86_REG_R8), machine.reg_read(r.UC_X86_REG_R9)
            assert bytes(machine.mem_read(name, length)) == state["expected"]
            assert [word(sp + offset) for offset in (0x28, 0x30)] == [1, 0]
            assert [struct.unpack("<I", machine.mem_read(sp + offset, 4))[0]
                    for offset in (0x38, 0x40, 0x48)] == [10, 0, 16111]
            state["constructor"] = True
            machine.emu_stop()
            return
        assert address in allowed, hex(address)
        instruction_count += 1

    machine.hook_add(UC_HOOK_CODE, hook)
    translations = (None, b"", b"Localized Orb", "爆発オーブ".encode())
    for dispatch in (False, True):
        for length in ((2, 3, 4) if dispatch else (0,)):
            for translation in translations:
                for capacity in (0, 64):
                    state.clear()
                    expected = b"Explosive Orb" if translation is None else translation
                    state.update(translation=translation, capacity=capacity, frees=0, constructor=False, expected=expected)
                    for reg in (r.UC_X86_REG_RAX, r.UC_X86_REG_RBX, r.UC_X86_REG_RCX, r.UC_X86_REG_RDX,
                                r.UC_X86_REG_RSI, r.UC_X86_REG_RDI, r.UC_X86_REG_RBP, r.UC_X86_REG_R8,
                                r.UC_X86_REG_R9, r.UC_X86_REG_R10, r.UC_X86_REG_R12, r.UC_X86_REG_R13,
                                r.UC_X86_REG_R14, r.UC_X86_REG_R15):
                        machine.reg_write(reg, 0)
                    machine.reg_write(r.UC_X86_REG_RSP, stack)
                    machine.mem_write(stack, struct.pack("<Q", stop))
                    if dispatch:
                        machine.mem_write(0x22000300, struct.pack("<I", 9612))
                        machine.reg_write(r.UC_X86_REG_RAX, 0x60)
                        machine.reg_write(r.UC_X86_REG_R14, 0x22000300)
                        machine.reg_write(r.UC_X86_REG_R12, length)
                        machine.reg_write(r.UC_X86_REG_RBP, stack - 0x500)
                        entry = 0x145b0f61e
                    else:
                        machine.reg_write(r.UC_X86_REG_RCX, descriptor)
                        entry = 0x145a99110
                    try:
                        machine.emu_start(entry, 0, count=500)
                    except Exception as error:
                        raise AssertionError(f"Fixture failed: dispatch={dispatch}, length={length}, capacity={capacity}, RIP={machine.reg_read(r.UC_X86_REG_RIP):#x}, RSP={machine.reg_read(r.UC_X86_REG_RSP):#x}") from error
                    assert state["frees"] == bool(capacity)
                    if dispatch:
                        assert state["constructor"]
                    else:
                        name, count = machine.reg_read(r.UC_X86_REG_RAX), machine.reg_read(r.UC_X86_REG_RDX)
                        assert bytes(machine.mem_read(name, count)) == expected
                    cases.append(dict(scope="dispatch-to-constructor" if dispatch else "name-getter",
                                      payload_length=length, translation="missing" if translation is None else translation.hex(),
                                      allocated_key=bool(capacity), resulting_name=expected.hex()))
    return dict(cases=len(cases), getter_cases=8, dispatch_cases=24, original_instructions_executed=instruction_count,
                result="passed", constructor_scope="name/subname/type/rank/display arguments only; serializer/wire execution omitted",
                seams=["packed key formatting", "optional localization result", "key allocation/deallocation", "metadata constructor stop"])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    proof = json.loads(MANIFEST.read_text())
    verify(proof)
    result = dict(target=proof["target"], manifest_sha256=file_sha256(MANIFEST), **replay(proof),
                  compilation="not_run", game_client_network_server_execution="not_run", parity="unverified")
    if args.write:
        (MANIFEST.parent / "static-check.json").write_text(json_text(result))
    print(json_text(result))


if __name__ == "__main__":
    main()
