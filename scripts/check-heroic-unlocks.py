#!/usr/bin/env python3
"""Verify Heroic save/admission bytes and replay bounded original instructions.

No compilation or game/server execution. Synthetic memory supplies typed Save
vectors; replay stops at the native return and calls no allocation/sort helpers.
"""
from portable_paths import portable_json
import argparse
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


PROOF = Path("docs/analysis/evidence/0.121.0/heroic-unlocks/manifest.json")
SOURCE_ROOT = Path(__file__).resolve().parents[1]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def verify(proof, analysis_root):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    selected = latest_target(verify=True)
    target = {k: selected[k] for k in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"]
    image = target_bytes(target)
    pe = load_script("heroic_save_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_ranges"] + proof["native_data"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert raw == bytes.fromhex(row["bytes_hex"]) and digest(raw) == row["sha256"]
        assert offset == int(row["file_offset"], 16)
        if "assembly" in row:
            instructions = list(decoder.disasm(raw, start))
            assert sum(i.size for i in instructions) == len(raw)
            text = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n"
                           for i in instructions)
            assert (SOURCE_ROOT / row["assembly"]).read_text() == text
    for row in proof["queries"]:
        def retained(item):
            path = analysis_root / item["path"]
            assert digest(path.read_bytes()) == item["sha256"]
            return path
        native = json.loads(retained(row["result"]).read_text())["structuredContent"]
        assert digest(native["normalized_result"].encode()) == row["normalized_text_sha256"]
        verify_native_query_subject(analysis_root, native, row, target, image=image, pe=pe)
    for row in proof["source_bindings"]:
        assert digest((SOURCE_ROOT / row["path"]).read_bytes()) == row["sha256"]
    assert 'mod heroic;' in (SOURCE_ROOT / "crates/azeroth-survivors-re/src/save.rs").read_text()
    schema = (SOURCE_ROOT / "crates/azeroth-survivors-re/src/save/schema.rs").read_text()
    assert 'super::heroic::records(&super::heroic::clears(lines))' in schema
    assert proof["target_executed"] is False


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    code = {row["role"]: row for row in proof["native_ranges"]}
    for address, count in ((0x145aa3000, 0x2000), (0x22000000, 0x10000), (0x23000000, 0x20000)):
        machine.mem_map(address, count)
    roles = ("class-ceiling", "account-ceiling", "record-clear")
    for role in roles:
        row = code[role]
        machine.mem_write(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    state = {}
    stop, base, normal, heroic, stack = 0x2301fff0, 0x22000000, 0x22001000, 0x22002000, 0x2301f008

    def hook(uc, address, _size, _context):
        if address == stop:
            state["returned"] = True
            uc.emu_stop()
            return
        row = code[state["role"]]
        start = int(row["virtual_address"], 16)
        assert start <= address < start + row["byte_count"], hex(address)
        state["instructions"] += 1
    machine.hook_add(UC_HOOK_CODE, hook)

    def setup(role, beaten, clears):
        state.clear()
        state.update(role=role, returned=False, instructions=0)
        machine.mem_write(base, bytes(0x10000))
        machine.mem_write(0x23000000, bytes(0x20000))
        machine.mem_write(stop, b"\xc3")
        for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            machine.reg_write(getattr(r, "UC_X86_REG_" + name), 0)
        machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
        machine.reg_write(r.UC_X86_REG_RSP, stack)
        machine.mem_write(stack, struct.pack("<Q", stop))
        machine.reg_write(r.UC_X86_REG_RCX, base)
        machine.mem_write(base + 0xe0, struct.pack("<QQ", normal, len(beaten)))
        for index, (cls, zone) in enumerate(sorted(beaten)):
            machine.mem_write(normal + 16 * index, struct.pack("<B7xQ", cls, zone))
        machine.mem_write(base + 0x1c8, struct.pack("<QQQ", 8, heroic, len(clears)))
        for index, (cls, zone, rank) in enumerate(clears):
            machine.mem_write(heroic + 16 * index, struct.pack("<QBB6x", zone, cls, rank))

    def run(role):
        machine.emu_start(int(code[role]["virtual_address"], 16), 0, count=10000)
        assert state["returned"]
        return machine.reg_read(r.UC_X86_REG_RAX) & 0xff

    cases = steps = 0
    scenarios = [([], []), ([(1, 0)], []), ([(1, 0)], [(2, 0, 3)]),
                 ([(1, 0), (2, 0), (11, 11)], [(1, 1, 5), (2, 0, 4), (11, 11, 5)]),
                 ([(1, 0)], [(2, 0, 1), (3, 0, 2), (5, 0, 5), (11, 1, 4)])]
    for beaten, clears in scenarios:
        for zone in (0, 1, 10, 11):
            maximum = max((rank for _, key, rank in clears if key == zone), default=0)
            ceiling = min(maximum + 1, 5) if any(key == zone for _, key in beaten) else 0
            setup("account-ceiling", beaten, clears)
            machine.reg_write(r.UC_X86_REG_RDX, zone)
            assert run("account-ceiling") == ceiling
            cases += 1; steps += state["instructions"]
            for cls in (1, 2, 3, 4, 5, 7, 8, 9, 11):
                setup("class-ceiling", beaten, clears)
                machine.reg_write(r.UC_X86_REG_RDX, cls)
                machine.reg_write(r.UC_X86_REG_R8, zone)
                assert run("class-ceiling") == (ceiling if (cls, zone) in beaten else 0)
                cases += 1; steps += state["instructions"]
    for existing in ([], [(1, 0, 3)]):
        for zone in (0, 12):
            for rank in (0, 1, 2, 3, 4, 5, 6, 255):
                setup("record-clear", [], existing)
                machine.reg_write(r.UC_X86_REG_RDX, 1)
                machine.reg_write(r.UC_X86_REG_R8, zone)
                machine.reg_write(r.UC_X86_REG_R9, rank)
                changed = zone < 12 and rank != 0 and (not existing or rank > 3)
                assert bool(run("record-clear")) == changed
                size = struct.unpack("<Q", machine.mem_read(base + 0x1d8, 8))[0]
                assert size == len(existing) + int(changed and not existing)
                if size:
                    value = struct.unpack("<QBB6x", machine.mem_read(heroic, 16))
                    assert value == (0, 1, min(rank, 5) if changed else 3)
                cases += 1; steps += state["instructions"]
    return {"cases": cases, "original_instruction_steps": steps}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--analysis-root", type=Path, default=ROOT,
                        help="Primary checkout containing shared query journals/results")
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    proof = json.loads((SOURCE_ROOT / PROOF).read_text())
    verify(proof, args.analysis_root.resolve())
    result = {"target": proof["target"], **replay(proof), "target_executed": False,
              "compilation": "not_run", "runtime": "not_run", "parity": "unverified"}
    if args.write:
        (SOURCE_ROOT / PROOF.parent / "static-check.json").write_text(portable_json(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
