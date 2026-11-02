#!/usr/bin/env python3
"""Check current final-boss clear publication and source without compiling.

Original instruction fixtures use synthetic wrapper/stack memory and stop at
the account boundary. No client, server, network or filesystem save executes.
"""
import hashlib
import json
import platform
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / "docs/analysis/evidence/0.123.0/coop-clear"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    target = latest_target(verify=True)
    assert {k: target[k] for k in proof["target"]} == proof["target"]
    image = target_bytes(target)
    pe = load_script("coop_clear123_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instructions = {}
    for row in proof["native_ranges"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert raw.hex() == row["bytes_hex"] and sha(raw) == row["sha256"]
        assert offset == int(row["file_offset"], 16)
        decoded = list(decoder.disasm(raw, start))
        assert sum(i.size for i in decoded) == len(raw), row["role"]
        instructions.update({i.address: i for i in decoded})
        text = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n" for i in decoded)
        assert (ROOT / row["assembly"]).read_text() == text
    for row in proof["data_ranges"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert raw.hex() == row["bytes_hex"] and sha(raw) == row["sha256"]
        assert offset == int(row["file_offset"], 16)
        table = int(row["table_base"], 16)
        assert row["serialized_tag"] == 15 and row["dispatch_index"] == 14
        assert start == table + 4 * row["dispatch_index"]
        assert table + struct.unpack("<i", raw)[0] == int(row["target"], 16) == 0x145c2fb28
    for row in proof["queries"]:
        native = json.loads((ROOT / row["result"]["path"]).read_text())["structuredContent"]
        verify_native_query_subject(ROOT, native, row, target, image=image, pe=pe)
        assert sha(native["normalized_result"].encode()) == row["normalized_text_sha256"]
    for row in proof["instruction_guards"]:
        instruction = instructions[int(row["address"], 16)]
        assert [instruction.mnemonic, instruction.op_str] == row["instruction"]
    for row in proof["source_bindings"]:
        assert sha((ROOT / row["path"]).read_bytes()) == row["sha256"], row["path"]
    for row in proof["source_scopes"]:
        text = (ROOT / row["path"]).read_text()
        start = text.index(row["start_marker"])
        end = text.index(row["end_marker"], start)
        assert sha(text[start:end].encode()) == row["sha256"], row["path"]
    assert proof["target_executed"] is False
    return len(instructions)


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(0x145c10000, 0x1000)
    machine.mem_map(0x145c27000, 0x1000)
    wrapper, frame = 0x22000000, 0x23000000
    machine.mem_map(wrapper, 0x4000)
    machine.mem_map(frame, 0x2000)
    for row in proof["native_ranges"]:
        if row["role"] in ("clear-admission", "driver-clear-gate"):
            machine.mem_write(int(row["virtual_address"], 16), bytes.fromhex(row["bytes_hex"]))
    state = {}

    def hook(uc, address, _size, _context):
        if address in state["stops"]:
            state["end"] = address
            uc.emu_stop()
            return
        state["steps"] += 1
    machine.hook_add(UC_HOOK_CODE, hook)

    def run(start, stops):
        state.clear()
        state.update(stops=stops, steps=0)
        machine.reg_write(r.UC_X86_REG_RSI, wrapper)
        machine.reg_write(r.UC_X86_REG_RBP, frame)
        machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
        machine.emu_start(start, 0, count=100)
        assert "end" in state
        return state["end"], state["steps"]

    cases = steps = 0
    for won in (0, 1, 2):
        for guid in (42, 0xffffff):
            for mode in (0, 1, 2):
                for flags in (0, 1, 2, 3):
                    machine.mem_write(frame + 0x79, bytes([won]))
                    machine.mem_write(wrapper + 0x1a00, struct.pack("<Q", guid))
                    machine.mem_write(wrapper + 0x10, struct.pack("<I", mode))
                    machine.mem_write(wrapper + 0xd5c, bytes([flags]))
                    end, count = run(0x145c27878, {0x145c2789a, 0x145c278b8})
                    admitted = won == 1 and guid != 0xffffff and (mode == 2 or flags & 1 == 0)
                    assert (end == 0x145c278b8) == admitted
                    cases += 1; steps += count
    for phase in (0, 1, 2, 0x100):
        for flags in (0, 1, 2, 3):
            machine.mem_write(wrapper + 0xbb8, struct.pack("<I", phase))
            machine.mem_write(wrapper + 0xd5c, bytes([flags]))
            end, count = run(0x145c107ae, {0x145c107c0, 0x145c107f0})
            assert (end == 0x145c107c0) == (phase != 0 and flags == 0)
            cases += 1; steps += count
    return cases, steps


def source_checks():
    base = ROOT / "crates/azeroth-survivors-re/src/gameplay"
    paths = [base / name for name in ("mod.rs", "coop.rs", "guest_settlement.rs", "mechanics/coop.rs")]
    hosts = {("Darwin", "arm64"): "aarch64-apple-darwin", ("Darwin", "x86_64"): "x86_64-apple-darwin",
             ("Linux", "x86_64"): "x86_64-unknown-linux-gnu", ("Linux", "aarch64"): "aarch64-unknown-linux-gnu"}
    parser = ROOT / ".tools/rust" / ("1.98.1-" + hosts[(platform.system(), platform.machine())]) / "bin/rustfmt"
    for path in paths:
        result = subprocess.run([str(parser), "--edition", "2024", "--emit", "stdout", "--config", "skip_children=true"],
                                input=path.read_text(), text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert result.returncode == 0, result.stderr
    # Source ownership and transaction guards are checked separately from native
    # instruction execution; Rust regressions remain authored and uncompiled.
    source = paths[2].read_text()
    assert "pub(super) fn persist_victory" in source
    assert "record_run_victory_notice" in source and "pub(super) fn victory" in source
    clear = source.split("pub(super) fn persist_victory", 1)[1].split("/// Native ZoneKey", 1)[0]
    assert "grant_terminal_xp" not in clear and "apply_run_counts" not in clear
    assert "TESTER_GUID" in clear and "heroic_cleared_rank" in clear and "commit_account" in clear
    assert clear.index("let effective_rank =") < clear.index("record_run_victory_notice")
    assert "record_run_victory_notice(class, zone_key, effective_rank)" in clear
    coop = paths[1].read_text()
    accepted = coop.split("NativeMessage::State(value) if guest =>", 1)[1].split("NativeMessage::Lifecycle(LifecyclePacket::EventBytes", 1)[0]
    assert accepted.index("state.state = Some(value)") < accepted.index("state.receive_victory") < accepted.index("if terminal_edge")
    receive = coop.split("fn receive_victory", 1)[1].split("/// The native snapshot owner", 1)[0]
    assert "snapshot.victory" in receive and "self.pending_events.extend" in receive
    assert ".summary(" not in receive and ".account(" not in receive and ".settle(" not in receive
    host = paths[0].read_text().split("fn persist_run_at(", 1)[1].split("fn hud(", 1)[0]
    assert host.index("guest_settlement::persist_victory") < host.index("let terminal_edge =")
    assert "record_run_victory_notice" not in host
    mechanics = paths[3].read_text()
    assert "flag_8d: self.victory_reached()" in mechanics
    return len(paths)


def main():
    proof = json.loads((BASE / "manifest.json").read_text())
    instructions = verify(proof)
    cases, steps = replay(proof)
    syntax = source_checks()
    print(json.dumps({"target_sha256": proof["target"]["sha256"], "queries": len(proof["queries"]),
                      "instructions_verified": instructions, "original_instruction_cases": cases,
                      "original_instruction_steps": steps, "rust_syntax_paths": syntax,
                      "compilation": "not_run", "client_network_server_save_execution": "not_run",
                      "parity": "unverified"}, indent=2))


if __name__ == "__main__":
    main()
