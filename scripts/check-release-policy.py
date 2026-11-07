#!/usr/bin/env python3
"""Verify bounded 0.120.5 co-op policy evidence without builds or sockets.

Original instructions run only in Unicorn with synthetic memory. Byte-search
and formatting calls are explicit fixture seams; no native OS calls execute.
"""
import hashlib
import itertools
import json
import struct

from artifact_history import read_artifact
from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


MANIFEST = ROOT / "docs/analysis/evidence/0.120.5/release-policy/manifest.json"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def retained(row):
    raw = read_artifact(project_path(row["path"]))
    assert sha(raw) == row["sha256"], row["path"]
    return raw


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
    assert target == proof["target"] and target["version"] == "0.120.5"
    image = target_bytes(target)
    pe = load_script("release_policy_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16)
        assert len(raw) == row["byte_count"] and sha(raw) == row["sha256"], row["role"]
        assert raw == bytes.fromhex(row["bytes_hex"]), row["role"]
        if "assembly" in row:
            instructions = list(decoder.disasm(raw, start))
            assert sum(i.size for i in instructions) == len(raw)
            assert len(instructions) == row["instruction_count"]
            text = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n"
                           for i in instructions)
            assert retained(row["assembly"]).decode() == text
    for query in proof["queries"]:
        raw = json.loads(retained(query["result"]))
        native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
        assert sha(native["normalized_result"].encode()) == query["normalized_text_sha256"]
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    for row in proof["locales"]:
        at = pe.rva_offset(int(row["record_virtual_address"], 16) - pe.image_base)
        code, code_length, _, _, pointer, size = struct.unpack_from("<6Q", image, at)
        code_at = pe.rva_offset(code - pe.image_base)
        assert image[code_at:code_at + code_length].decode() == row["code"]
        offset = pe.rva_offset(pointer - pe.image_base)
        payload = image[offset:offset + size]
        assert hex(pointer) == row["payload_virtual_address"]
        assert len(payload) == row["byte_count"] and sha(payload) == row["sha256"]
        catalog = json.loads(payload)
        assert len(catalog) == row["keys"] == 2991
        assert catalog["the co-op relay cannot be reached"] == row["relay_unreachable"]
        source_catalog = json.loads((ROOT / f"crates/azeroth-survivors-re/assets/locales/{row['code']}.json").read_text())
        assert "the co-op relay cannot be reached" not in source_catalog
    assert [r["code"] for r in proof["locales"]] == [
        "en", "pl", "cs", "de", "pt", "es", "fr", "ro", "tr", "ru", "uk", "zh", "ja", "ko"]
    for row in proof["source_bindings"]:
        retained(row)
    source = (ROOT / "crates/azeroth-survivors-re/src/coop_forms.rs").read_text()
    recognized = source.split("fn localized_reason(reason: &str)", 1)[1].split("\n}", 1)[0]
    assert '"the co-op relay cannot be reached"' not in recognized
    dispatch = next(r for r in proof["native_data"] if r["role"] == "ui-reason-dispatch")
    table = bytes.fromhex(dispatch["bytes_hex"])
    assert 0x1461969cc + struct.unpack_from("<i", table, (33 - 13) * 4)[0] == 0x14008ae34
    vtable = next(r for r in proof["native_data"] if r["role"] == "guest-vtable")
    assert struct.unpack_from("<Q", bytes.fromhex(vtable["bytes_hex"]), 0x48)[0] == 0x145b74870
    assert proof["target_executed"] is False
    return image, pe


def branch_cases(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    for address, size in ((0x145b66000, 0x2000), (0x145b74000, 0x2000),
                          (0x145f7f000, 0x1000), (0x145f88000, 0x1000),
                          (0x1475fe000, 0x1000), (0x148537000, 0x1000),
                          (0x22000000, 0x10000), (0x23000000, 0x20000)):
        machine.mem_map(address, size)
    rows = {r["role"]: r for r in proof["native_ranges"] + proof["native_data"]}
    for role in ("guest-failure-getter", "alternate-url-authority", "alternate-url-format"):
        row = rows[role]
        machine.mem_write(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    stop = 0x2301fff0
    heap, stack, frame = 0x22000000, 0x23000000, 0x23010000
    mode, outcome = None, []

    def qword(address):
        return struct.unpack("<Q", machine.mem_read(address, 8))[0]

    def return_from_call(value=None):
        if value is not None:
            machine.reg_write(reg.UC_X86_REG_RAX, value)
        sp = machine.reg_read(reg.UC_X86_REG_RSP)
        machine.reg_write(reg.UC_X86_REG_RIP, qword(sp))
        machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def hook(uc, address, _size, _context):
        if address == stop:
            outcome.append(uc.reg_read(reg.UC_X86_REG_RAX) & 0xff)
            uc.emu_stop()
        elif mode == "url" and address in (0x145f88130, 0x145f88220):
            pointer = uc.reg_read(reg.UC_X86_REG_RDX)
            count = uc.reg_read(reg.UC_X86_REG_R8)
            needle = bytes([uc.reg_read(reg.UC_X86_REG_RCX) & 0xff])
            data = bytes(uc.mem_read(pointer, count))
            found = data.find(needle) if address == 0x145f88130 else data.rfind(needle)
            uc.reg_write(reg.UC_X86_REG_RDX, max(found, 0))
            return_from_call(int(found >= 0))
        elif mode == "url" and address == 0x145f7f700:
            assert uc.reg_read(reg.UC_X86_REG_RDX) == 0x1475fec3b
            arguments = uc.reg_read(reg.UC_X86_REG_R8)
            values = []
            for index in range(3):
                pair = qword(arguments + index * 16)
                pointer, length = struct.unpack("<QQ", uc.mem_read(pair, 16))
                values.append(bytes(uc.mem_read(pointer, length)).decode() if length else "")
            outcome.append(values[0] + "://" + values[1] + "/" + values[2])
            uc.emu_stop()
        elif mode == "url" and address == 0x145b6688a:
            outcome.append(None)
            uc.emu_stop()
        elif mode == "getter":
            assert 0x145b74870 <= address < 0x145b74930, (mode, hex(address))
        else:
            assert mode == "url" and 0x145b66b94 <= address < 0x145b66cf2, (mode, hex(address))

    machine.hook_add(UC_HOOK_CODE, hook)

    def reset():
        outcome.clear()
        machine.mem_write(heap, bytes(0x10000))
        machine.mem_write(stack, bytes(0x20000))
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            machine.reg_write(getattr(reg, "UC_X86_REG_" + name), 0)
        machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x1f008)
        machine.mem_write(stack + 0x1f008, struct.pack("<Q", stop))

    mode = "getter"
    getter_count = 0
    for selected, admitted, failed in itertools.product((False, True), repeat=3):
        reset()
        machine.mem_write(heap, struct.pack("<Q", heap + 0x1000))
        machine.mem_write(heap + 0x1078, struct.pack("<Q", 0 if selected else 0xffffffffffffffff))
        machine.mem_write(heap + 0x1158, bytes((admitted, failed)))
        machine.mem_write(0x148537b78, struct.pack("<Q", heap + 0x2000))
        machine.reg_write(reg.UC_X86_REG_RCX, heap)
        machine.emu_start(0x145b74870, stop, count=256)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
        if not outcome:
            outcome.append(machine.reg_read(reg.UC_X86_REG_RAX) & 0xff)
        assert outcome == [int(selected and failed and not admitted)]
        getter_count += 1
    mode = "url"
    for original, expected in proof["url_cases"]:
        reset()
        delimiter = original.index("://")
        raw = original.encode()
        machine.mem_write(heap, raw)
        machine.mem_write(frame + 0x308, struct.pack("<Q", len(raw)))
        machine.mem_write(frame + 0x318, struct.pack("<Q", heap))
        machine.reg_write(reg.UC_X86_REG_RBP, frame)
        machine.reg_write(reg.UC_X86_REG_RSI, delimiter + 3)
        machine.reg_write(reg.UC_X86_REG_RAX, delimiter)
        machine.emu_start(0x145b66b94, 0x145b66ce0, count=1024)
        assert outcome == [expected], (original, expected, outcome)
    return {"getter_cases": getter_count, "url_suffix_cases": len(proof["url_cases"])}


def main():
    proof = json.loads(read_artifact(MANIFEST))
    verify(proof)
    result = branch_cases(proof)
    print(json.dumps({"target": proof["target"]["version"], "queries": len(proof["queries"]),
                      "ranges": len(proof["native_ranges"]), "locales": len(proof["locales"]),
                      **result, "application_executed": False, "parity_verified": False}, indent=2))


if __name__ == "__main__":
    main()
