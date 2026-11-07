#!/usr/bin/env python3
"""Check bounded Heroic helper contracts with original bytes and synthetic memory.

This performs no compilation or application/server execution. Allocator,
localization, string-copy and formatting interfaces are explicit fixture seams.
"""
from portable_paths import portable_json
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


MANIFEST = ROOT / "docs/analysis/evidence/heroic-native/manifest.json"


def sha(value):
    return hashlib.sha256(value).hexdigest()


def retained(row):
    path = project_path(row["path"])
    assert sha(path.read_bytes()) == row["sha256"], row["path"]
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"] and target["version"] == "0.121.0"
    image = target_bytes(target)
    pe = load_script("heroic_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        address = int(row["virtual_address"], 16)
        at = pe.rva_offset(address - pe.image_base)
        raw = image[at:at + row["byte_count"]]
        assert at == int(row["file_offset"], 16)
        assert sha(raw) == row["sha256"] and raw == bytes.fromhex(row["bytes_hex"])
        if "assembly" in row:
            instructions = list(decoder.disasm(raw, address))
            assert sum(i.size for i in instructions) == len(raw)
            assert len(instructions) == row["instruction_count"]
            text = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n"
                           for i in instructions)
            assert retained(row["assembly"]).read_text() == text
    for query in proof["queries"]:
        raw = json.loads(retained(query["result"]).read_text())
        native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
        assert sha(native["normalized_result"].encode()) == query["normalized_text_sha256"]
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    for row in proof["source_bindings"]:
        retained(row)
    assert proof["target_executed"] is False


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    rows = {r["role"]: r for r in proof["native_ranges"] + proof["native_data"]}
    for address, count in ((0x145abf000, 0x2000), (0x146fca000, 0x1000),
                           (0x140002000, 0x1000), (0x145aea000, 0x1000),
                           (0x145fbe000, 0x1000), (0x145feb000, 0x1000),
                           (0x14601b000, 0x1000), (0x146194000, 0x1000),
                           (0x22000000, 0x10000), (0x23000000, 0x20000)):
        machine.mem_map(address, count)
    for role in ("affix-selection", "rank-name", "affix-domain", "rank-label-data", "rank-format"):
        row = rows[role]
        machine.mem_write(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    for address in (0x140002200, 0x1400021c0, 0x14601b9b0, 0x145aeaf60,
                    0x145febc1b, 0x145fbe970, 0x146194453):
        machine.mem_write(address, b"\xc3")
    heap, out, stack, stop = 0x22000000, 0x22000000, 0x23000000, 0x2301fff0
    state = {}
    cases = []

    def qword(address):
        return struct.unpack("<Q", machine.mem_read(address, 8))[0]

    def ret(value=None):
        if value is not None:
            machine.reg_write(reg.UC_X86_REG_RAX, value)
        sp = machine.reg_read(reg.UC_X86_REG_RSP)
        machine.reg_write(reg.UC_X86_REG_RIP, qword(sp))
        machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)

    def string(pair):
        pointer, length = struct.unpack("<QQ", machine.mem_read(pair, 16))
        return bytes(machine.mem_read(pointer, length)).decode() if length else ""

    def hook(uc, address, _size, _context):
        state["instructions"] += 1
        if address == stop:
            state["returned"] = True
            uc.emu_stop()
        elif address == 0x140002200:  # allocator initialization seam
            ret()
        elif address == 0x1400021c0:  # allocator seam, successful synthetic allocation
            count = uc.reg_read(reg.UC_X86_REG_RCX)
            assert count <= 0x1000 and uc.reg_read(reg.UC_X86_REG_RDX) == 1
            ret(heap + 0x1000)
        elif address == 0x14601b9b0:  # Vec<u8> growth seam
            pair = uc.reg_read(reg.UC_X86_REG_RCX)
            cap, pointer, length = struct.unpack("<QQQ", uc.mem_read(pair, 24))
            assert (cap, length) == (1, 1)
            uc.mem_write(heap + 0x1100, bytes(uc.mem_read(pointer, length)))
            uc.mem_write(pair, struct.pack("<QQQ", 2, heap + 0x1100, length))
            ret()
        elif address == 0x145aeaf60:  # existing localization lookup seam
            key = bytes(uc.mem_read(uc.reg_read(reg.UC_X86_REG_RCX), uc.reg_read(reg.UC_X86_REG_RDX))).decode()
            assert key in ("Normal", "Heroic")
            state["key"] = key
            translated = state["translation"]
            if translated is None:
                uc.reg_write(reg.UC_X86_REG_RDX, 0)
                ret(0)
            else:
                data = translated.encode()
                uc.mem_write(heap + 0x2000, data)
                uc.reg_write(reg.UC_X86_REG_RDX, len(data))
                ret(heap + 0x2000)
        elif address == 0x145febc1b:  # memcpy seam used by Normal's owned-string copy
            count = uc.reg_read(reg.UC_X86_REG_R8)
            uc.mem_write(uc.reg_read(reg.UC_X86_REG_RCX), bytes(uc.mem_read(uc.reg_read(reg.UC_X86_REG_RDX), count)))
            ret()
        elif address == 0x145fbe970:  # packed formatter seam; inspect both native argument slices
            assert uc.reg_read(reg.UC_X86_REG_RDX) == 0x146fca068
            arguments = uc.reg_read(reg.UC_X86_REG_R8)
            state["format_arguments"] = [string(qword(arguments + 16 * i)) for i in range(2)]
            state["formatted_boundary"] = True
            uc.emu_stop()
        elif address == 0x146194453:  # explicit index-bounds failure seam
            assert uc.reg_read(reg.UC_X86_REG_RDX) == 6
            assert uc.reg_read(reg.UC_X86_REG_R8) == 0x146fca050
            state["bounds_failure"] = True
            uc.emu_stop()
        else:
            assert (0x145abfe70 <= address < 0x145abff78 or
                    0x145ac00b0 <= address < 0x145ac026c), hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)

    def reset():
        state.clear()
        state["instructions"] = 0
        machine.mem_write(heap, bytes(0x10000))
        machine.mem_write(stack, bytes(0x20000))
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            machine.reg_write(getattr(reg, "UC_X86_REG_" + name), 0)
        machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x1f008)
        machine.mem_write(stack + 0x1f008, struct.pack("<Q", stop))
        machine.reg_write(reg.UC_X86_REG_RCX, out)

    selectors = list(range(24)) + [2**32 - 1, 2**32, 2**63, 2**64 - 2, 2**64 - 1]
    instruction_count = 0
    for rank in range(6):
        for selector in selectors:
            reset()
            machine.reg_write(reg.UC_X86_REG_RDX, rank)
            machine.reg_write(reg.UC_X86_REG_R8, selector)
            machine.emu_start(0x145abfe70, stop, count=256)
            assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
            _, pointer, length = struct.unpack("<QQQ", machine.mem_read(out, 24))
            values = list(machine.mem_read(pointer, length)) if length else []
            expected = []
            if rank >= 3:
                expected.append(selector % 3)
                if rank >= 5:
                    expected.append((selector % 3 + (selector // 3 & 1) + 1) % 3)
            assert values == expected, (rank, selector, values, expected)
            assert len(set(values)) == len(values)
            cases.append(dict(rank=rank, selector=str(selector), affix_ids=values))
            instruction_count += state["instructions"]

    label_cases = []
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        for translation in (None, "Héroïque"):
            reset()
            state["translation"] = translation
            machine.reg_write(reg.UC_X86_REG_RDX, rank)
            try:
                machine.emu_start(0x145ac00b0, stop, count=256)
            except Exception as error:
                raise AssertionError((rank, translation, hex(machine.reg_read(reg.UC_X86_REG_RIP)), state)) from error
            expected_key = "Normal" if rank == 0 else "Heroic"
            assert state["key"] == expected_key
            if rank >= 6:
                assert state.get("bounds_failure") is True
                observation = "bounds_failure"
            elif rank:
                assert state.get("formatted_boundary") is True
                expected_args = [translation or expected_key, ("", "I", "II", "III", "IV", "V")[rank]]
                assert state["format_arguments"] == expected_args
                observation = expected_args
            else:
                assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
                _, pointer, length = struct.unpack("<QQQ", machine.mem_read(out, 24))
                observation = bytes(machine.mem_read(pointer, length)).decode()
                assert observation == (translation or "Normal")
            label_cases.append(dict(rank=rank, localization_hit=translation is not None, observation=observation))
            instruction_count += state["instructions"]
    return dict(affix_selection_cases=len(cases), rank_name_cases=len(label_cases),
                original_instruction_steps=instruction_count,
                affix_cases_sha256=sha(json.dumps(cases, sort_keys=True).encode()),
                rank_name_observations=label_cases)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="Write the compact checked result beside the manifest")
    args = parser.parse_args()
    proof = json.loads(MANIFEST.read_text())
    verify(proof)
    result = dict(target=proof["target"], manifest_sha256=sha(MANIFEST.read_bytes()),
                  check_sources={"scripts/check-heroic-native.py": sha(__file_bytes())},
                  queries=len(proof["queries"]), **replay(proof),
                  limits=proof["limits"], application_executed=False, parity_verified=False)
    if args.write:
        (MANIFEST.parent / "static-check.json").write_text(portable_json(result, indent=2, ensure_ascii=False) + "\n")
    print(json.dumps(result, indent=2, ensure_ascii=False))


def __file_bytes():
    from pathlib import Path
    return Path(__file__).read_bytes()


if __name__ == "__main__":
    main()
