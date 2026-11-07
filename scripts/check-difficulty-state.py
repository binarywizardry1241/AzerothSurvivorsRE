#!/usr/bin/env python3
"""Check the selected rank's native constructor copies without running the game.

Only original bounded instructions execute in Unicorn. memcpy is an explicit
memory-copy seam; constructor allocation, admission and game execution are absent.
"""
from portable_paths import portable_json
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/difficulty-state.json"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    return {"path": str(path.relative_to(ROOT)), "sha256": digest(path.read_bytes())}


def context():
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    assert target["version"] == "0.121.0"
    image = target_bytes(target)
    pe = load_script("difficulty_state_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    return target, image, pe


def prepare():
    target, image, pe = context()
    directory = ROOT / "runtime/analysis/history/findings/fixgap219/888a65e3edb9/constructor"
    result_path = next((directory / "query/results").glob("*.json"))
    result = json.loads(result_path.read_text())
    native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
    query = {
        "procedure": "0x145bdcb10", "evidence_id": native["evidence_id"],
        "provider": native["provider"],
        "analysis_profile_digest": native["analysis_profile"]["digest"],
        "plan": receipt(directory / "plan.json"),
        "journal": receipt(directory / "query/journal.json"),
        "result": receipt(result_path),
        "raw_input": receipt(ROOT / "runtime/analysis/history/target-audit/execheck/60f68e86a5e9/heroic-native/caller/code.bin"),
        "slice_virtual_address": "0x145bdcb10",
    }
    rows = []
    for role, start, end in (("rank-read", 0x145bdcbd9, 0x145bdcbe0),
                              ("copy-input", 0x145bdcff8, 0x145bdd00d),
                              ("copy-output", 0x145bde16f, 0x145bde188)):
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        rows.append(dict(role=role, virtual_address=hex(start), file_offset=hex(offset),
                         byte_count=len(raw), bytes_hex=raw.hex(), sha256=digest(raw)))
    return dict(schema_version=1, target=target, gap_ids=[219], query=query,
                native_ranges=rows,
                contract="The constructor reads rank at input+0x1bf, copies the full 0x1c0-byte input into Game+0x1b0, then copies the 0xd38-byte Game out. Rank therefore reaches Game+0x36f unchanged.",
                source_refs=["crates/azeroth-survivors-re/src/menu_state.rs",
                             "crates/azeroth-survivors-re/src/gameplay/mod.rs",
                             "crates/azeroth-survivors-re/src/gameplay/mechanics.rs"],
                limits="Bounded constructor state connection only. Pick parse/admission, Heroic policies and their consumers have independent proofs. Raw Ghidra function discovery omits external switch targets. memcpy is a synthetic seam; no reconstructed source, compiler, OS, application or server runs.",
                target_executed=False, runtime_validation="not_run", parity="unverified")


def check(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    target, image, pe = context()
    assert proof["target"] == target
    query = proof["query"]
    for key in ("plan", "journal", "result", "raw_input"):
        row = query[key]
        assert digest(project_path(row["path"]).read_bytes()) == row["sha256"]
    result = json.loads(project_path(query["result"]["path"]).read_text())
    native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
    verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(0x145bdc000, 0x3000)
    machine.mem_map(0x145feb000, 0x1000)
    source, frame, output, stack = 0x22000000, 0x23000080, 0x24000000, 0x25000000
    for address, count in ((source, 0x1000), (frame - 0x80, 0x3000),
                           (output, 0x1000), (stack, 0x1000)):
        machine.mem_map(address, count)
    for row in proof["native_ranges"]:
        address = int(row["virtual_address"], 16)
        at = pe.rva_offset(address - pe.image_base)
        raw = image[at:at + row["byte_count"]]
        assert at == int(row["file_offset"], 16)
        assert raw == bytes.fromhex(row["bytes_hex"]) and digest(raw) == row["sha256"]
        assert sum(i.size for i in decoder.disasm(raw, address)) == len(raw)
        machine.mem_write(address, raw)
    copies = []

    def hook(uc, address, size, unused):
        if address == 0x145febc1b:
            dst, src, count = (uc.reg_read(r) for r in
                               (reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8))
            assert count in (0x1c0, 0xd38)
            copies.append((dst, src, count))
            uc.mem_write(dst, bytes(uc.mem_read(src, count)))
            sp = uc.reg_read(reg.UC_X86_REG_RSP)
            uc.reg_write(reg.UC_X86_REG_RIP, struct.unpack("<Q", uc.mem_read(sp, 8))[0])
            uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)
        else:
            assert any(int(row["virtual_address"], 16) <= address <
                       int(row["virtual_address"], 16) + row["byte_count"]
                       for row in proof["native_ranges"]), hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)
    for rank in (0, 1, 2, 3, 4, 5, 6, 255):
        state = bytearray((n * 37 + 11) % 256 for n in range(0x1c0))
        state[0x1bf] = rank
        machine.mem_write(source, bytes(state))
        machine.mem_write(frame - 0x80, bytes(0x3000))
        machine.mem_write(frame + 0xf08, struct.pack("<Q", output))
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x800)
        machine.reg_write(reg.UC_X86_REG_RBP, frame)
        machine.reg_write(reg.UC_X86_REG_R15, source)
        machine.reg_write(reg.UC_X86_REG_R13, source)
        machine.reg_write(reg.UC_X86_REG_R14, 0)
        machine.emu_start(0x145bdcbd9, 0x145bdcbe0, count=8)
        assert machine.reg_read(reg.UC_X86_REG_R14) == rank
        machine.emu_start(0x145bdcff8, 0x145bdd00d, count=16)
        machine.emu_start(0x145bde16f, 0x145bde188, count=16)
        assert bytes(machine.mem_read(output + 0x1b0, 0x1c0)) == state
        assert machine.mem_read(output + 0x36f, 1)[0] == rank
    assert len(copies) == 16
    return {"rank_cases": 8, "native_copy_calls": len(copies),
            "target_executed": False, "runtime_validation": "not_run", "parity": "unverified"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="Publish the current reviewed constructor proof")
    args = parser.parse_args()
    proof = prepare() if args.write else json.loads(MANIFEST.read_text())
    result = check(proof)
    if args.write:
        proof["static_result"] = result
        MANIFEST.write_text(portable_json(proof, indent=2) + "\n")
    print(json.dumps(result))


if __name__ == "__main__":
    main()
