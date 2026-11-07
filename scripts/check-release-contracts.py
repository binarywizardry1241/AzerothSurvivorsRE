#!/usr/bin/env python3
"""Verify selected 0.120.4 release evidence; no builds, sockets or game execution."""
from portable_paths import portable_json
import argparse
import ast
import hashlib
import itertools
import json
import re
import struct
import sys

from artifact_history import read_artifact
from coverage_common import ROOT, latest_target, project_path, target_bytes
from script_sources import load_script


MANIFEST = ROOT / "docs/analysis/evidence/0.120.4/release-contracts/manifest.json"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def verified_bytes(row):
    raw = read_artifact(project_path(row["path"]))
    assert sha(raw) == row["sha256"], ("changed retained input", row["path"])
    return raw


def verify(proof):
    selected = latest_target(verify=True)
    assert all(selected[k] == proof["target"][k] for k in ("version", "sha256", "size_bytes"))
    assert selected["version"] == "0.120.4"
    image = target_bytes(selected)
    pe = load_script("release_1204_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/camera/python-libs"))
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in proof["native_owners"] + proof["native_ranges"] + proof["native_data"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16)
        raw = image[offset:offset + row["byte_count"]]
        assert len(raw) == row["byte_count"] and sha(raw) == row["sha256"], row["role"]
        if "bytes_hex" in row:
            assert raw == bytes.fromhex(row["bytes_hex"]), row["role"]
        if "assembly" in row:
            ins = list(decoder.disasm(raw, start))
            assert sum(i.size for i in ins) == len(raw)
            assert len(ins) == row["instruction_count"]
            expected = "".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() + "\n" for i in ins)
            assert verified_bytes(row["assembly"]).decode() == expected, row["role"]
        if row.get("encoding") == "f32":
            assert struct.unpack("<f", raw)[0] == row["value"]
        if row.get("encoding") == "f64":
            assert struct.unpack("<d", raw)[0] == row["value"]
        if row.get("encoding") == "relative_i32":
            assert [hex(start + x[0]) for x in struct.iter_unpack("<i", raw)] == row["targets"]
    for query in proof["queries"]:
        result = json.loads(verified_bytes(query["result"]))["structuredContent"]
        journal = json.loads(verified_bytes(query["journal"]))
        plan = json.loads(verified_bytes(query["plan"]))
        raw = verified_bytes(query["raw_input"])
        assert journal["status"] == "completed"
        assert result["provider"]["id"] == "ghidra"
        assert result["evidence_id"] == query["evidence_id"]
        assert result["subject"]["digest"]["sha256"] == sha(raw)
        assert sha(result["normalized_result"].encode()) == query["normalized_text_sha256"]
        assert result["parameters"]["procedure"] == query["procedure"]
        assert plan["open_options"] == {"format": "raw-binary", "architecture": "x86_64", "entry_point": query["slice_virtual_address"]}
        offset = pe.rva_offset(int(query["slice_virtual_address"], 16) - pe.image_base)
        assert image[offset:offset + len(raw)] == raw
    locations = json.loads(verified_bytes(proof["module_location_evidence"]))
    assert locations["target"] == proof["target"]
    for module, owner in (("custom-game-coop-relay", "0x145c61910"),
                          ("custom-game-server-party", "0x145b25ad0")):
        assert any(row["system_id"] == module and any(
            ref.get("runtime_function_start") == owner for ref in row["verified_references"])
            for row in locations["diagnostics"])
    assert proof["target_executed"] is False
    return selected


def relay_cases(proof):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RAX, UC_X86_REG_RDX, UC_X86_REG_RSI,
                                    UC_X86_REG_RCX, UC_X86_REG_R14, UC_X86_REG_R13,
                                    UC_X86_REG_XMM0, UC_X86_REG_XMM6)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(0x145c61000, 0x2000)
    memory = 0x22000000
    machine.mem_map(memory, 0x4000)
    rows = {r["role"]: r for r in proof["native_ranges"]}
    admitted = set()
    for role in ("sender-credit-gate", "sender-credit-charge", "receiver-next", "receiver-forward-gap"):
        row = rows[role]
        start = int(row["virtual_address"], 16)
        raw = bytes.fromhex(row["bytes_hex"])
        machine.mem_write(start, raw)
        admitted.update(int(line.split()[0], 16) for line in verified_bytes(row["assembly"]).splitlines())
    stop_addresses = {0x145c62260, 0x145c622f1, 0x145c6232e,
                      0x145c61cad, 0x145c61e91, 0x145c61f25}
    stops = []

    def hook(uc, address, size, _):
        if address in stop_addresses:
            stops.append(address)
            uc.emu_stop()
        else:
            assert address in admitted, ("escaped admitted branch", hex(address))

    machine.hook_add(UC_HOOK_CODE, hook)

    def run(start):
        stops.clear()
        machine.emu_start(start, 0x145c63000, count=32)
        assert len(stops) == 1
        return stops[0]

    def double(value):
        return int.from_bytes(struct.pack("<d", value), "little")

    gate = charge = forward = 0
    for sent, boundary, credit in itertools.product(range(6), range(6), (-1.0, 0.0, 0.5, 2.0)):
        machine.reg_write(UC_X86_REG_RAX, sent)
        machine.reg_write(UC_X86_REG_RDX, boundary)
        machine.reg_write(UC_X86_REG_XMM0, double(credit))
        machine.reg_write(UC_X86_REG_XMM6, 0)
        stop = run(0x145c622e2)
        assert (stop == 0x145c622f1) == (sent >= boundary or credit > 0.0)
        gate += 1
        for length in (0, 1, 4096):
            machine.reg_write(UC_X86_REG_RAX, sent)
            machine.reg_write(UC_X86_REG_RDX, boundary)
            machine.reg_write(UC_X86_REG_RSI, memory)
            machine.reg_write(UC_X86_REG_RCX, memory + 0x1000)
            machine.reg_write(UC_X86_REG_XMM0, double(credit))
            machine.mem_write(memory + 0x150, struct.pack("<d", credit))
            machine.mem_write(memory + 0x1018, struct.pack("<Q", length))
            assert run(0x145c62314) == 0x145c6232e
            observed = struct.unpack("<d", machine.mem_read(memory + 0x150, 8))[0]
            assert observed == (credit - length if sent < boundary else credit)
            charge += 1
    bucket = memory + 0x2000
    mask = (1 << 64) - 1
    for received, pending in itertools.product((0, 1, 9, mask - 1, mask), (0, 1)):
        for sequence in sorted({0, received, (received + 1) & mask, (received + 2) & mask, mask}):
            machine.mem_write(bucket - 0x18, struct.pack("<Q", received))
            machine.mem_write(bucket - 8, bytes([pending]))
            machine.reg_write(UC_X86_REG_R14, bucket)
            machine.reg_write(UC_X86_REG_R13, sequence)
            stop = run(0x145c61c99)
            next_sequence = (received + 1) & mask
            expected = sequence == next_sequence or (sequence > next_sequence and not pending)
            assert (stop in (0x145c61cad, 0x145c61e91)) == expected
            observed = struct.unpack("<Q", machine.mem_read(bucket - 0x18, 8))[0]
            assert observed == (sequence if expected else received)
            forward += 1
    return {"sender_gate": gate, "sender_charge": charge, "receiver_forward_gap": forward,
            "total": gate + charge + forward,
            "limits": "Synthetic registers and row memory; stops before allocation, map lookup, transport or payload delivery."}


def source_observation():
    base = ROOT / "crates/azeroth-survivors-re/src"
    party = (base / "coop/server_party.rs").read_text()
    relay = (base / "coop/relay.rs").read_text()
    directory = (base / "coop_directory.rs").read_text()
    version = ast.literal_eval(re.search(r'pub const GAME_VERSION:\s*&str\s*=\s*("[^"]+")', party)[1])
    return {"shared_game_version": version, "native_game_version": "0.120.4",
            "version_matches": version == "0.120.4",
            "pending_limit_expression": re.search(r"const MAX_PENDING_BYTES: usize = ([^;]+)", relay)[1],
            "ack_0_5_second_gate_present": "self.ack_clock)) >= 0.5" in relay,
            "strict_next_and_forward_control_present": "sequence == next" in relay and "sequence > next" in relay and "control(peer.receive_sequence, false)" in relay,
            "all_payload_credit_gate_present": "peer.sent < peer.pending.len() && self.credit > 0.0" in relay,
            "joined_branch_inner_reset_present": any(token in directory.split(
                "DirectoryResponse::Text { tag: 22, text } => {", 1)[1].split(
                "DirectoryResponse::Text { tag: 23", 1)[0]
                for token in (".peers.clear()", ".lost()", "service_party_reset(", "fresh_party(")),
            "source_sha256": {str(p.relative_to(ROOT)): sha(p.read_bytes()) for p in
                              (base / "coop/server_party.rs", base / "coop/relay.rs", base / "coop_directory.rs")},
            "limits": "Read-only source observations; no Rust compilation, source execution or repair."}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", help="Optional result path below runtime/")
    args = parser.parse_args()
    manifest = read_artifact(MANIFEST)
    proof = json.loads(manifest)
    target = verify(proof)
    from coop_handshake_check import replay
    result = {"target": {k: target[k] for k in ("version", "sha256", "size_bytes")},
              "manifest_sha256": sha(manifest), "native_ranges": len(proof["native_ranges"]),
              "query_receipts": len(proof["queries"]), "relay_branches": relay_cases(proof),
              "exact_version_admission": replay(proof["admission_replay"]),
              "source": source_observation(),
              "limits": "Static bytes, durable bounded raw-slice Ghidra and original-instruction emulation only. No application/client/game/server/network operation or parity comparison."}
    if args.output:
        output = project_path(args.output)
        assert output.is_relative_to(ROOT / "runtime")
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(portable_json(result, indent=2) + "\n")
    print(json.dumps({k: v for k, v in result.items() if k != "source"}, separators=(",", ":")))


if __name__ == "__main__":
    main()
