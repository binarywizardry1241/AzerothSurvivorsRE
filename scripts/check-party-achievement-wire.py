#!/usr/bin/env python3
"""Replay current State15 party-feat wire evidence without compiling or launching."""
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, artifact_path
from script_sources import load_script


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    args = parser.parse_args()
    evidence = json.loads((ROOT / "docs/analysis/evidence/0.117.0/party-achievement-wire/manifest.json").read_text())
    data = artifact_path("installed-game/AzerothSurvivors.exe").read_bytes()
    assert evidence["schema"] == "as-party-achievement-wire-v1"
    assert evidence["target"] == {
        "version": "0.117.0",
        "sha256": "507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293",
        "size": 145283072,
    }
    assert digest(data) == evidence["target"]["sha256"]
    pe = load_script("party_achievement_wire_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    owners = {(pe.image_base + a, pe.image_base + b) for a, b, _ in pe.functions()}
    assert [(row["role"], row["start"], row["size"]) for row in evidence["dispatch_tables"]] == [
        ("serializer", "0x1472cdc58", 76), ("parser", "0x1472cdb9c", 76),
        ("guest", "0x1472dcf1c", 72),
    ]
    for row in evidence["dispatch_tables"]:
        address = int(row["start"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + row["size"]]
        assert digest(raw) == row["sha256"]
        assert [hex(address + struct.unpack_from("<i", raw, i)[0])
                for i in range(0, len(raw), 4)] == row["targets"]
    expected = {
        "state15-writer": (0x145aaf3d8, 0x145aaf779),
        "state15-party-reader": (0x145aad347, 0x145aad577),
        "party-member-reader": (0x145c3b530, 0x145c3b668),
        "state-validator": (0x145ae0c00, 0x145ae1202),
        "count-reader": (0x145df6fb0, 0x145df702f),
        "guest-state-receive": (0x145b1c3e2, 0x145b1c4c3),
        "guest-end-receive": (0x145b1c32f, 0x145b1c3e2),
        "guest-teardown": (0x145b1a640, 0x145b1a850),
    }
    assert {row["role"] for row in evidence["native_spans"]} == expected.keys()
    for row in evidence["native_spans"]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        assert (start, end) == expected[row["role"]]
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16)
        raw = data[offset:offset + row["size"]]
        assert row["size"] == end - start and digest(raw) == row["sha256"]
        asm = (ROOT / row["extract"]).read_bytes()
        assert digest(asm) == row["extract_sha256"]
        cursor = start
        for line in asm.decode().splitlines():
            address, instruction, _ = line.split(" ", 2)
            code = bytes.fromhex(instruction)
            assert int(address, 16) == cursor and code
            assert code == raw[cursor - start:cursor - start + len(code)]
            cursor += len(code)
        assert cursor == end
        if row["unwind_owner"] is not None:
            owner = tuple(int(row["unwind_owner"][key], 16) for key in ("start", "end"))
            assert owner in owners and owner[0] <= start < end <= owner[1]

    retained = 0
    assert [row["role"] for row in evidence["queries"]] == [
        "serializer", "guest-receive", "event-validator", "event-apply", "state-validator",
    ]
    for row in evidence["queries"]:
        native = row["native_input"]
        start, end = int(native["start"], 16), int(native["end"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(native["file_offset"], 16)
        assert digest(data[offset:offset + end - start]) == row["input_sha256"]
        paths = {key: ROOT / row[key] for key in ("plan", "input", "result")}
        if not all(path.is_file() for path in paths.values()):
            assert not args.require_retained_queries, row["role"]
            continue
        for key, path in paths.items():
            assert digest(path.read_bytes()) == row[key + "_sha256"]
        result = json.loads(paths["result"].read_text())["structuredContent"]
        assert result["provider"]["id"] == "ghidra"
        assert result["subject"]["digest"]["sha256"] == row["input_sha256"]
        assert result["evidence_id"] == row["evidence_id"]
        assert result["analysis_profile"]["digest"] == row["analysis_profile_digest"]
        assert digest(result["normalized_result"].encode()) == row["normalized_result_sha256"]
        retained += 1

    wire = (ROOT / "crates/azeroth-survivors-re/src/coop/replication.rs").read_text()
    state = (ROOT / "crates/azeroth-survivors-re/src/coop/client_state.rs").read_text()
    for anchor in [
        "pub coop: Option<NativeCoopFeats>", "push_count(out, members.len().min(5))?",
        "let count = self.count(6)?.min(5)", "let count = reader.count(12)?",
        "kind_21: if kind_21 < 4 { kind_21 } else { 0 }",
        "out.push(u8::from(state.coop.is_some()))", "let coop = if reader.flag()?",
        "current_party_context_has_exact_wire_order_and_native_byte_rules",
        "party_member_counts_cap_before_consumption_and_absence_requires_flag",
    ]:
        assert anchor in wire, anchor
    for anchor in [
        "context.boss_ids.contains(&event.word_18)",
        "coop.events.truncate(history_limit as usize)",
        "coop.word_30 = coop.word_30.min(clock as u32)",
        "current_party_history_filters_bosses_caps_events_and_preserves_member_bytes",
    ]:
        assert anchor in state, anchor
    print(f"Passed {len(expected)} current native spans, 3 dispatch tables and both wire/validation source connections; {retained}/5 retained Ghidra receipts.")
    print("Authored Rust regressions, compilation, client/server execution, persistence and parity remain unrun.")


if __name__ == "__main__":
    main()
