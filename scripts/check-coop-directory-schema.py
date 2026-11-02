#!/usr/bin/env python3
"""Verify current directory rank/text fields without running the application."""

from script_sources import current_path, recorded_input_matches
import hashlib
import itertools
import json
import re
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.123.0/coop-directory-schema/manifest.json"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(project_path(row["path"]))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from capstone.x86_const import X86_REG_RIP
    selected = latest_target(verify=True)
    assert all(selected[k] == proof["target"][k]
               for k in ("version", "sha256", "size_bytes"))
    image = target_bytes(selected)
    pe = load_script("directory_schema_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    admitted, assembly = set(), []
    for collection, curated in ((proof["native_owners"], False), (proof["native_ranges"], True)):
        for row in collection:
            start = int(row["virtual_address"], 16)
            offset = pe.rva_offset(start - pe.image_base)
            assert offset == int(row["file_offset"], 16)
            raw = image[offset:offset + row["byte_count"]]
            assert sha(raw) == row["sha256"], row["role"]
            instructions = list(decoder.disasm(raw, start))
            assert sum(i.size for i in instructions) == len(raw)
            assert len(instructions) == row["instruction_count"]
            if curated:
                admitted.update(i.address for i in instructions)
                assembly.append("// " + row["role"] + "\n")
                assembly.extend(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip()
                                + "\n" for i in instructions)
    assert receipt(proof["assembly"]).read_text() == "".join(assembly)
    for key in proof["key_bindings"]:
        start = int(key["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + key["byte_count"]]
        assert offset == int(key["file_offset"], 16)
        assert sha(raw) == key["sha256"] and raw.decode() == key["key"]
        setup, call = int(key["setup_start"], 16), int(key["lookup_call"], 16)
        offset = pe.rva_offset(setup - pe.image_base)
        instructions = list(decoder.disasm(image[offset:offset + call + 5 - setup], setup))
        length, literal, _, lookup = instructions
        assert length.mnemonic == "mov" and length.op_str == f"edx, {len(raw) if len(raw) < 10 else hex(len(raw))}"
        assert literal.mnemonic == "lea" and literal.op_str.startswith("rcx, [rip +")
        operand = literal.operands[1]
        assert operand.mem.base == X86_REG_RIP
        assert literal.address + literal.size + operand.mem.disp == start
        assert lookup.address == call and lookup.mnemonic == "call"
        assert lookup.operands[0].imm == int(key["lookup_target"], 16)
    query = proof["query"]
    native = json.loads(receipt(query["result"]).read_text())["structuredContent"]
    verdict = verify_native_query_subject(ROOT, native, query, proof["target"], image=image, pe=pe)
    assert verdict == query["subject_verification"]
    assert sha(native["normalized_result"].encode()) == query["normalized_sha256"]
    for path, fragments in proof["source_requirements"].items():
        source = re.sub(r"\s+", "", project_path(path).read_text())
        for fragment in fragments:
            assert re.sub(r"\s+", "", fragment) in source, (path, fragment)
    assert proof["target_executed"] is False
    return receipt(query["raw_input"]).read_bytes(), admitted


def scalar_cases(proof, raw, admitted):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RAX, UC_X86_REG_R14, UC_X86_REG_RBP
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(0x140099000, 0x2000)
    machine.mem_write(int(proof["query"]["slice_virtual_address"], 16), raw)
    memory = 0x22000000
    machine.mem_map(memory, 0x4000)
    value, fallback, frame = memory + 0x100, memory + 0x200, memory + 0x1000
    stops, endpoints = [], set()

    def hook(uc, address, size, _):
        if address in endpoints:
            stops.append(address)
            uc.emu_stop()
        else:
            assert address in admitted, ("escaped selected scalar instructions", hex(address))

    machine.hook_add(UC_HOOK_CODE, hook)

    def run(start, stop):
        endpoints.clear()
        endpoints.update(stop)
        stops.clear()
        machine.reg_write(UC_X86_REG_RBP, frame)
        machine.reg_write(UC_X86_REG_R14, fallback)
        machine.emu_start(start, 0x14009b000, count=64)
        assert len(stops) == 1
        return stops[0]

    def json_value(tag, kind=0, payload=0, length=0):
        machine.mem_write(value, struct.pack("<QQQQ", tag, kind, payload, length))
        machine.reg_write(UC_X86_REG_RAX, value)

    mask = (1 << 64) - 1
    rank = strings = 0
    values = (0, 1, 5, 6, (1 << 63) - 1, 1 << 63, mask - 1, mask)
    for tag, kind, payload in itertools.product(range(7), range(3), values):
        json_value(tag, kind, payload)
        run(0x14009a3ed, (0x14009a427,))
        observed = struct.unpack("<q", machine.mem_read(frame + 0x20, 8))[0]
        expected = -1
        if tag == 2 and kind == 0 and payload < 1 << 63:
            expected = payload
        if tag == 2 and kind == 1:
            expected = payload if payload < 1 << 63 else payload - (1 << 64)
        assert observed == expected, (tag, kind, payload, observed, expected)
        rank += 1
    machine.reg_write(UC_X86_REG_RAX, 0)
    run(0x14009a3ed, (0x14009a427,))
    assert struct.unpack("<q", machine.mem_read(frame + 0x20, 8))[0] == -1
    rank += 1
    for start, accepted, finish, pointer, length_slot in (
            (0x14009a357, 0x14009a37a, 0x14009a3d8, 0x90, 0x98),
            (0x14009a43c, 0x14009a45f, 0x14009a4bd, 0xa0, 0xa8)):
        for tag, length in itertools.product(range(7), (0, 1, 32)):
            json_value(tag, length=length)
            stop = run(start, (accepted, finish))
            assert (stop == accepted) == (tag == 3 and length > 0)
            observed = struct.unpack("<Q", machine.mem_read(frame + length_slot, 8))[0]
            assert observed == (length if tag == 3 else 0)
            if stop == finish:
                assert struct.unpack("<Q", machine.mem_read(frame + pointer, 8))[0] == 1
            strings += 1
        machine.reg_write(UC_X86_REG_RAX, 0)
        assert run(start, (accepted, finish)) == finish
        assert struct.unpack("<Q", machine.mem_read(frame + length_slot, 8))[0] == 0
        strings += 1
    return {"signed_rank": rank, "string_type_and_empty_default": strings, "total": rank + strings}


def main():
    proof = json.loads(MANIFEST.read_text())
    raw, admitted = verify(proof)
    print(json.dumps({"target": proof["target"]["version"], "query_receipts": 1,
                      "owner_instructions": sum(r["instruction_count"] for r in proof["native_owners"]),
                      "selected_instructions": len(admitted), "key_literals": len(proof["key_bindings"]),
                      "source_files": len(proof["source_requirements"]),
                      "native_cases": scalar_cases(proof, raw, admitted),
                      "limits": "Synthetic JSON-Value representations and missing-key Null seam. Stops before lookup/allocation/copy and application delivery; no compilation, network, UI or parity proof."}))


if __name__ == "__main__":
    main()
