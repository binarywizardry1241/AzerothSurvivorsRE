#!/usr/bin/env python3
"""Check Orb query locales and replay the original metadata packet constructor.

Only allocation, reserve and byte-copy library calls are synthetic seams.
No compiler, rebuilt Rust, OS packet delivery, game/client/server or rendering.
"""
from portable_paths import portable_json, portable_record
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

SHA = "22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150"
TABLE, START, END = 0x14765AF88, 0x145B85C20, 0x145B861E4
WORK = ROOT / "runtime/fixgap-0.121.0/resource-query"
KEEP = ROOT / "docs/analysis/evidence/0.121.0/orb-source.json"


def derive():
    sys.path[:0] = [str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"),
                   str(ROOT / "runtime/armory-recovery/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("orb_source_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        return image[at:at + size]

    def span(address, size):
        return {"virtual_address": hex(address),
                "file_offset": hex(pe.rva_offset(address - pe.image_base)),
                "byte_count": size, "sha256": hashlib.sha256(raw(address, size)).hexdigest()}

    locales = []
    for i in range(14):
        cp, cn, np, nn, jp, jn, reserved = struct.unpack("<7Q", raw(TABLE + i * 56, 56))
        code, catalog = raw(cp, cn).decode(), json.loads(raw(jp, jn))
        assert re.fullmatch("[a-z]{2}", code)
        value = catalog["object.9612.name"]
        locales.append({"index": i, "code": code, "descriptor": span(TABLE + i * 56, 56),
                        "payload": span(jp, jn), "name": value})
    assert [r["code"] for r in locales] == ["en", "pl", "cs", "de", "pt", "es", "fr", "ro", "tr", "ru", "uk", "zh", "ja", "ko"]
    code = raw(START, END - START)
    query_dir = WORK / "metadata-constructor/query-v2"
    journal = json.loads((query_dir / "journal.json").read_text())
    assert journal["status"] == "completed"
    operation = next(iter(journal["operations"].values()))
    assert operation["status"] == "completed"
    result_path = ROOT / operation["result"]["path"]
    assert file_sha256(result_path) == operation["result"]["sha256"]
    result = json.loads(result_path.read_text())
    native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
    receipt = {"role": "metadata-constructor", "procedure": hex(START),
               "evidence_id": native["evidence_id"], "provider": native["provider"],
               "analysis_profile_digest": native["analysis_profile"]["digest"],
               "normalized_text_sha256": hashlib.sha256(native["normalized_result"].encode()).hexdigest(),
               "plan": {"path": str((WORK / "metadata-constructor/plan-v2.json").relative_to(ROOT)),
                        "sha256": file_sha256(WORK / "metadata-constructor/plan-v2.json")},
               "journal": {"path": str((query_dir / "journal.json").relative_to(ROOT)),
                           "sha256": file_sha256(query_dir / "journal.json")},
               "result": operation["result"],
               "raw_input": {"path": str((WORK / "metadata-constructor/code.bin").relative_to(ROOT)),
                             "sha256": hashlib.sha256(code).hexdigest()},
               "slice_virtual_address": hex(START)}
    verify_native_query_subject(ROOT, native, receipt, target, image=image, pe=pe)
    instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(code, START))
    assert sum(i.size for i in instructions) == len(code)
    allowed = {i.address for i in instructions}
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    pages = set()

    def memory(address, size):
        for page in range(address & ~4095, (address + size + 4095) & ~4095, 4096):
            if page not in pages:
                machine.mem_map(page, 4096)
                pages.add(page)

    memory(START, len(code))
    machine.mem_write(START, code)
    seams = {0x140002200: "allocator-shim", 0x1400021C0: "allocate",
             0x145FEBC1B: "memcpy", 0x145FEC390: "reserve", 0x146193FB0: "reserve-one"}
    for address in seams:
        memory(address, 1)
        machine.mem_write(address, b"\xc3")
    heap, stack, stop = 0x22000000, 0x23000000, 0x24000000
    memory(heap, 0x100000)
    memory(stack, 0x20000)
    memory(stop, 1)
    machine.mem_write(stop, b"\xf4")
    state, steps = {}, 0

    def word(address):
        return struct.unpack("<Q", machine.mem_read(address, 8))[0]

    def put(address, *values):
        machine.mem_write(address, struct.pack("<" + "Q" * len(values), *values))

    def alloc(size):
        address = state["cursor"]
        state["cursor"] += (size + 15) & ~15
        assert state["cursor"] < heap + 0x100000
        return address

    def hook(_, address, size, user):
        nonlocal steps
        if address == stop:
            machine.emu_stop()
            return
        if address in seams:
            if address == 0x1400021C0:
                machine.reg_write(reg.UC_X86_REG_RAX, alloc(machine.reg_read(reg.UC_X86_REG_RCX)))
            elif address == 0x145FEBC1B:
                dst, src, count = [machine.reg_read(r) for r in
                                   (reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8)]
                if count:
                    machine.mem_write(dst, bytes(machine.mem_read(src, count)))
                machine.reg_write(reg.UC_X86_REG_RAX, dst)
            elif address in (0x145FEC390, 0x146193FB0):
                vector = machine.reg_read(reg.UC_X86_REG_RCX)
                capacity, pointer, length = (word(vector + n) for n in (0, 8, 16))
                needed = length + (1 if address == 0x146193FB0 else machine.reg_read(reg.UC_X86_REG_R8))
                capacity = max(capacity * 2, needed, 32)
                new = alloc(capacity)
                if length:
                    machine.mem_write(new, bytes(machine.mem_read(pointer, length)))
                put(vector, capacity, new, length)
                state["reserves"] += 1
            sp = machine.reg_read(reg.UC_X86_REG_RSP)
            machine.reg_write(reg.UC_X86_REG_RIP, word(sp))
            machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)
            return
        assert address in allowed, f"outside admitted constructor at {address:x}"
        steps += 1

    machine.hook_add(UC_HOOK_CODE, hook)
    cases = []
    names = [(r["code"], r["name"]) for r in locales] + [
        ("missing-key-fallback", "Explosive Orb"), ("non-null-empty", ""),
        ("utf8-override", "火\u7403 ⚡"), ("long-override", "Orb " * 50),
        ("embedded-nul", "Orb\0tail")]
    for label, name in names:
        state.update(cursor=heap + 0x10000, reserves=0)
        encoded = name.encode()
        name_at, result, sp = heap + 0x1000, heap + 0x3000, stack + 0x1F008
        machine.mem_write(name_at, encoded or b"\0")
        put(sp, stop)
        put(sp + 40, 1, 0, 10, 0, 16111)
        for register, value in [(reg.UC_X86_REG_RSP, sp), (reg.UC_X86_REG_RCX, result),
                                (reg.UC_X86_REG_RDX, 9612), (reg.UC_X86_REG_R8, name_at),
                                (reg.UC_X86_REG_R9, len(encoded))]:
            machine.reg_write(register, value)
        machine.emu_start(START, 0, count=10000)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
        capacity, pointer, length, opcode = (word(result + n) for n in (0, 8, 16, 24))
        packet = bytes(machine.mem_read(pointer, length))
        expected = struct.pack("<I", 9612) + encoded + b"\0" * 5 + struct.pack("<7I", 0, 10, 0, 0, 0, 0, 16111) + b"\0\0"
        assert opcode & 0xFFFF == 0x61 and packet == expected
        cases.append({"case": label, "name": name, "packet_hex": packet.hex(),
                      "opcode": opcode & 0xFFFF, "reserve_calls": state["reserves"]})
    return {"schema_version": 1,
            "target": {k: target[k] for k in ("version", "path", "sha256", "size_bytes")},
            "finding_ids": [247], "locale_table": span(TABLE, 14 * 56), "locales": locales,
            "constructor": {**span(START, END - START), "instruction_count": len(instructions)},
            "queries": [receipt],
            "packet": {"opcode": 97, "entry": 9612, "subname": "", "creature_type": 10,
                       "rank": 0, "display_id": 16111, "other_fields": 0},
            "cases": cases, "original_instruction_steps": steps,
            "limits": "Library allocation/reserve/copy seams are synthetic; no reconstructed Rust, client parser, live delivery, rendering or combat executed."}


def source_check(proof):
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/client/creature_queries.rs").read_text()
    assert re.search(r'\(9612,\s*"Explosive Orb",\s*"object\.9612\.name",\s*"",\s*10,\s*16111\)', source)
    for row in proof["locales"]:
        path = ROOT / f"crates/azeroth-survivors-re/assets/locales/{row['code']}.json"
        assert json.loads(path.read_text())["object.9612.name"] == row["name"]
    packets = (ROOT / "crates/azeroth-survivors-re/src/coop/engine_packets.rs").read_text()
    assert "SessionEvent::CreatureName {" in packets and "op::SMSG_CREATURE_QUERY_RESPONSE" in packets
    assert "creature_type.unwrap_or(0)" in packets and "*display_id" in packets
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/client/query_packets.rs").read_text()
    assert "engine_packets::encode(&template,None)" in source and "parse_server(opcode, &body)" in source


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    proof = derive()
    source_check(proof)
    if args.stage:
        KEEP.write_text(portable_json(proof, ensure_ascii=False, indent=2) + "\n")
    else:
        assert portable_record(json.loads(KEEP.read_text())) == portable_record(proof)
    print(json.dumps({"locales": len(proof["locales"]), "constructor_cases": len(proof["cases"]),
                      "original_instruction_steps": proof["original_instruction_steps"]}))


if __name__ == "__main__":
    main()
