#!/usr/bin/env python3
"""Check solo final-phase clear projection without compiling or running a game.

Synthetic instruction fixtures stop before native account calls. Retained
queries and canonical parent ranges are reused; no native query is launched.
"""

from script_sources import current_path, recorded_input_matches
import argparse
import hashlib
import json
import platform
import subprocess
import sys

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


BASE = ROOT / "docs/analysis/evidence/0.123.0/solo-clear"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(ROOT / row["path"])
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    target = latest_target(verify=True)
    assert {key: target[key] for key in proof["target"]} == proof["target"]
    assert proof["target_executed"] is False
    image = target_bytes(target)
    pe = load_script("solo_clear123_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    parent = json.loads(receipt(proof["parent_manifest"]).read_text())
    parent_check = load_script("solo_clear123_parent", receipt(proof["parent_checker"]))
    parent_instructions = parent_check.verify(parent)
    assert len(parent["queries"]) == 6

    # The original shared-driver query remains owned by its existing proof.
    driver_manifest = json.loads(receipt(proof["driver_query_manifest"]).read_text())
    query = next(row for row in driver_manifest["queries"] if row["role"] == proof["driver_query_role"])
    result = json.loads(receipt(query["result"]).read_text())["structuredContent"]
    verify_native_query_subject(ROOT, result, query, target, image=image, pe=pe)
    assert sha(result["normalized_result"].encode()) == query["canonical_extract"]["sha256"]

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instructions = {}
    for row in proof["native_ranges"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16)
        assert raw.hex() == row["bytes_hex"] and sha(raw) == row["sha256"]
        decoded = list(decoder.disasm(raw, start))
        assert sum(instruction.size for instruction in decoded) == len(raw)
        text = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n" for i in decoded)
        assert (ROOT / row["assembly"]).read_text() == text
        instructions.update({instruction.address: instruction for instruction in decoded})
    for row in proof["instruction_guards"]:
        instruction = instructions[int(row["address"], 16)]
        assert [instruction.mnemonic, instruction.op_str] == row["instruction"]
    for row in proof["source_bindings"]:
        receipt(row)
    return parent, parent_check, parent_instructions, len(instructions)


def replay(proof, parent):
    import struct
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(0x145c10000, 0x2000)
    wrapper = 0x22000000
    machine.mem_map(wrapper, 0x4000)
    prelude = next(row for row in proof["native_ranges"] if row["role"] == "driver-mode-and-active-phase")
    gate = next(row for row in parent["native_ranges"] if row["role"] == "driver-clear-gate")
    for row in (prelude, gate):
        machine.mem_write(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    state = {}

    def hook(uc, address, _size, _context):
        if address in (0x145c107c0, 0x145c107f0, 0x145c11027, 0x145c10f10):
            state["end"] = address
            uc.emu_stop()
        else:
            state["steps"] += 1
    machine.hook_add(UC_HOOK_CODE, hook)
    cases = steps = 0
    for mode in (0, 1, 2):
        for party in (0, 1):
            for run_phase in (1, 2):
                for final_phase in (0, 1):
                    for flags in (0, 1):
                        machine.mem_write(wrapper + 0x10, struct.pack("<I", mode))
                        machine.mem_write(wrapper + 0xd62, bytes([party]))
                        # An incorrect selected-phase index reaches a terminal
                        # branch instead of the expected Playing/Choosing path.
                        machine.mem_write(wrapper + 0xd67, bytes([4, 4]))
                        machine.mem_write(wrapper + 0xd67 + party, bytes([run_phase]))
                        machine.mem_write(wrapper + 0xbb8, struct.pack("<I", final_phase))
                        machine.mem_write(wrapper + 0xd5c, bytes([flags]))
                        machine.reg_write(r.UC_X86_REG_RSI, wrapper)
                        machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
                        state.clear()
                        state["steps"] = 0
                        machine.emu_start(0x145c1077f, 0, count=100)
                        expected = (0x145c11027 if mode == 2 else
                                    0x145c107c0 if final_phase != 0 and flags == 0 else 0x145c107f0)
                        assert state.get("end") == expected, (mode, party, run_phase, final_phase, flags)
                        cases += 1
                        steps += state["steps"]
    return cases, steps


def source_checks(parent_check):
    path = ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/progression.rs"
    source = path.read_text()
    getter = source.split("pub fn victory_reached(", 1)[1].split("/// Current1458feff0", 1)[0]
    assert "self.boss_state.completion.phase != 0" in getter
    assert "self.has_party()" not in getter
    assert "self.replica_state().map_or(" in getter and "|state| state.won" in getter
    for name in ("solo_final_clear_with_pending_choice_reaches_state_and_save_before_summary",
                 "solo_pending_choice_without_final_phase_does_not_publish_or_save_a_clear"):
        assert "fn " + name + "(" in source
    # Reuse the canonical source checks for State15 publication, immediate
    # account delivery and separation from terminal XP/count acknowledgement.
    parent_paths = parent_check.source_checks()
    hosts = {("Darwin", "arm64"): "aarch64-apple-darwin", ("Darwin", "x86_64"): "x86_64-apple-darwin",
             ("Linux", "x86_64"): "x86_64-unknown-linux-gnu", ("Linux", "aarch64"): "aarch64-unknown-linux-gnu"}
    parser = ROOT / ".tools/rust" / ("1.98.1-" + hosts[(platform.system(), platform.machine())]) / "bin/rustfmt"
    parsed = subprocess.run([str(parser), "--edition", "2024", "--emit", "stdout", "--config", "skip_children=true"],
                            input=source, text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
    assert parsed.returncode == 0, parsed.stderr
    return parent_paths + 1


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--python-path", action="append", default=[], help="Existing project-local Python dependencies")
    args = parser.parse_args()
    for value in args.python_path:
        dependency = (ROOT / value).resolve()
        assert dependency.is_relative_to(ROOT), "Python dependencies must stay in the project"
        sys.path.insert(0, str(dependency))
    proof = json.loads((BASE / "manifest.json").read_text())
    parent, parent_check, parent_instructions, instructions = verify(proof)
    cases, steps = replay(proof, parent)
    syntax = source_checks(parent_check)
    print(json.dumps({"target_sha256": proof["target"]["sha256"], "retained_query_subjects_verified": 7,
                      "parent_instructions_verified": parent_instructions, "additional_instructions_verified": instructions,
                      "original_instruction_cases": cases, "original_instruction_steps": steps,
                      "rust_syntax_paths": syntax, "authored_uncompiled_regressions": 2,
                      "compilation": "not_run", "client_network_server_save_execution": "not_run",
                      "parity": "unverified"}, indent=2))


if __name__ == "__main__":
    main()
