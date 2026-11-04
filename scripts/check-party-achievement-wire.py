#!/usr/bin/env python3
"""Replay current State15 party-feat wire evidence without compiling or launching."""
import argparse
import hashlib
import json
import math
import struct
import sys

from coverage_common import ROOT, artifact_path, latest_target, target_bytes
from script_sources import load_script


def digest(data):
    return hashlib.sha256(data).hexdigest()


def check_state15_0_140():
    """Replay the current State15 writer, party scalar reader and validator."""
    target = latest_target()
    assert target["sha256"] == "27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9"
    image = target_bytes(target)
    pe = load_script("current_party_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from native_terminal import NativeReplay
    replay = NativeReplay(image, pe)
    r, vm = replay.registers, replay.machine
    data, values = replay.app, replay.app + 0x200
    pack = struct.pack

    def reg(name, value=None):
        register = getattr(r, "UC_X86_REG_" + name)
        if value is None:
            return vm.reg_read(register)
        vm.reg_write(register, value)

    def put(offset, fmt, *fields):
        replay.put(data + offset, "<" + fmt, *fields)

    result = bytearray()

    def write_leaf(address):
        if address == 0x14620a360:
            result.append(reg("RDX") & 255)
        elif address == 0x14620a500:
            result.extend(pack("<I", reg("RDX") & 0xffffffff))
        elif address == 0x14620a3a0:
            result.extend(pack("<I", reg("XMM1") & 0xffffffff))
        elif address == 0x14620a400:
            length = reg("R8")
            result.extend(pack("<I", length))
            if length:
                result.extend(vm.mem_read(reg("RDX"), length))
        else:
            return False
        reg("RAX", reg("RCX"))
        replay.return_seam()
        return True

    replay.seam = write_leaf
    for party, fallen in [(False, False), (True, False), (True, True)]:
        result.clear()
        replay.reset("state15_writer", [(0x146055d51, 0x146056135),
                     (0x146057778, 0x146057884)], [0x14605799f])
        reg("RDI", data)
        put(0xd8, "fI5IIff", 2500.0, 8, 1, 2, 3, 4, 5, 6, 7.5, 2.5)
        put(0x102, "9B", 1, 0, 1, 1, 5, 5, 4, 8, 7)
        put(0x10, "QQ", values, 1)
        vm.mem_write(values, b"z")
        put(0x28, "QQ", values + 8, 1)
        put(0x40, "QQ", values + 24, 1)
        put(0x58, "QQ", values + 40, 1)
        put(0x70, "QQ", values + 48, 1)
        put(0x88, "QQ", values + 64, 1)
        replay.put(values + 8, "<II", 11, 12)
        replay.put(values + 24, "<IIBBB", 13, 14, 15, 2, 1)
        replay.put(values + 40, "<I", 16)
        replay.put(values + 48, "<IIBBB", 17, 18, 19, 3, 0)
        replay.put(values + 64, "<IB", 20, 1)
        put(0x98, "QQQ", 1 if party else 0xffffffffffffffff, values + 80, 1)
        put(0xc8, "IfIBB", int(fallen), 2400.5, 21, 3, 5)
        replay.put(values + 80, "<IBBB", 22, 7, 23, 8)
        put(0xb8, "QQ", values + 96, 1)
        replay.put(values + 96, "<QQQIIBBB", 1, values + 144, 1, 24, 25, 26, 2, 1)
        replay.put(values + 144, "<IBBB", 27, 4, 28, 6)
        replay.run(0x146055d51)
        expected = (
            pack("<BfBBIB5IBIffBBBB", 15, 2500.0, 5, 1, 8, 0, 1, 2, 3, 4, 5,
                 5, 6, 7.5, 2.5, 4, 8, 1, 7)
            + pack("<IcIII", 1, b"z", 1, 11, 12)
            + pack("<IIIBBB", 1, 13, 14, 15, 2, 1)
            + pack("<II", 1, 16)
            + pack("<IIIBBB", 1, 17, 18, 19, 3, 0)
            + pack("<BIIBB", 1, 1, 20, 1, int(party))
        )
        if party:
            expected += pack("<IBIBBIBBfI", 1, 7, 22, 23, 8, 21, 5, 3, 2400.5 if fallen else -1.0, 1)
            expected += pack("<IIBBBIBIBB", 24, 25, 26, 2, 1, 1, 4, 27, 28, 6)
        assert result == expected, (result.hex(), expected.hex())

    replay.seam = None
    marker_bits = [0, 0x80000000, 0xbf800000, 0xff800000, 0x7f800000,
                   0x7fc00001, 0x45160000, 0x45161000]
    for bits in marker_bits:
        marker = struct.unpack("<f", pack("<I", bits))[0]
        # Reader entry immediately after the member list. Its reader primitives
        # remain original, including the ordered first-fall option test.
        replay.reset("state15_party_reader", [(0x146053aac, 0x146053b64),
                     (0x14620cdc0, 0x14620d30e)], [0x146053b64])
        body = pack("<IBBII", 2501, 250, 251, bits, 0)
        vm.mem_write(data, body)
        replay.put(replay.bp + 0x5c8, "<QQQB", data, len(body), 0, 1)
        replay.run(0x146053aac)
        present = marker >= 0.0
        assert replay.get(replay.bp + 0x380, "<IIIBB") == (present, bits, 2501, 251, 250)
        assert replay.get(replay.bp + 0x5d8, "<Q")[0] == len(body)
        for clock in (0.0, 2399.0, 2400.0, 2500.0):
            replay.reset("state15_party_validation", [(0x145e36b32, 0x145e36c04)], [0x145e36c04])
            replay.put(replay.bp + 0x70, "<IIIBB", present, bits, 2501, 251, 250)
            replay.put(replay.bp + 0xaf, "<B", 4)
            reg("XMM6", struct.unpack("<Q", pack("<d", clock))[0])
            reg("XMM7", struct.unpack("<Q", pack("<d", 4294967295.0))[0])
            replay.scalar(r.UC_X86_REG_XMM8, clock)
            replay.run(0x145e36b32)
            option, actual, deaths, count, rank = replay.get(replay.bp + 0x70, "<IIIBB")
            expected_marker = 0.0 if not math.isfinite(marker) else marker if marker < clock else clock
            assert (option, deaths, count, rank) == (present, min(2501, int(clock)), 5, 4)
            if present:
                assert actual == struct.unpack("<I", pack("<f", expected_marker))[0]

    from itertools import product

    survival_cases = 0
    for zone, clock, first_fall, members, party_rank, cap in product(
        (10, 11), (2399.0, 2400.0, 2500.0), (None, 2399.0, 2400.0, 2500.0),
        (2, 3, 5), (4, 5), (4, 5),
    ):
        replay.reset("insane_survival", [(0x145e5d571, 0x145e5d5f8)],
                     [0x145e5c720, 0x145e5d6df])
        reg("RCX", 11)
        reg("R10", 2400)
        reg("R14", 3)
        reg("RBX", 1)
        reg("RAX", 2)
        replay.scalar(r.UC_X86_REG_XMM6, clock)
        replay.scalar(r.UC_X86_REG_XMM7, first_fall or 0.0)
        for offset, fmt, value in [(0xc0, "Q", zone), (0xc8, "Q", members),
                                   (0x10f, "B", first_fall is not None),
                                   (0xf4, "B", min(party_rank, cap)), (0x117, "B", 5)]:
            replay.put(replay.bp + offset, "<" + fmt, value)
        replay.run(0x145e5d571)
        expected = (zone == 11 and clock >= 2400.0 and members >= 3
                    and min(party_rank, cap) == 5
                    and (first_fall is None or first_fall >= 2400.0))
        assert (reg("RIP") == 0x145e5d6df) == expected
        survival_cases += 1

    wire = (ROOT / "crates/azeroth-survivors-re/src/coop/replication.rs").read_text()
    reader = wire.split("        15 => {", 1)[1].split("        18 =>", 1)[0]
    writer = wire.split("        NativeMessage::State(state) => {", 1)[1].split("        NativeMessage::End =>", 1)[0]
    state = (ROOT / "crates/azeroth-survivors-re/src/coop/client_state.rs").read_text()
    for section, anchors in [(writer, ("push_words(&mut out, &state.words)",
                 "push_state_rows(&mut out, &state.secondary_rows)", "u8::from(state.enhancement)",
                 "state.boss_flags.len()", "state.coop.is_some()", "coop.word_30.to_le_bytes()",
                 "[coop.heroic_rank, coop.initial_member_count]", "coop.first_fall_bits.to_le_bytes()",
                 "coop.events.len()")),
            (reader, ("let words = reader.words()?", "let secondary_rows = reader.state_rows()?",
                 "let enhancement = reader.flag()?", "reader.count(6)?", "let coop = if reader.flag()?",
                 "let word_30 = reader.word()?", "let heroic_rank = reader.byte()?",
                 "let initial_member_count = reader.byte()?", "let first_fall_bits = reader.word()?",
                 "reader.count(12)?"))]:
        cursor = 0
        for anchor in anchors:
            cursor = section.index(anchor, cursor) + len(anchor)
        assert "alive_since" not in section
    for anchor in ("coop.heroic_rank.min(state.heroic_rank)", "coop.initial_member_count.min(5)",
                   "first_fall.is_finite()", "first_fall < admitted_clock", "context.class == 7",
                   "state.secondary_rows.truncate(history_limit as usize)",
                   "state.boss_flags.truncate(history_limit as usize)"):
        assert anchor in state, anchor
    print(f"0.140.0 State15 passed 3 writer, 8 reader, 32 validation and "
          f"{survival_cases} survival cases over {replay.instructions} original instructions "          "plus source connections.")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    parser.add_argument("--state15-0.140.0", dest="current_state15", action="store_true",
                        help="check the current State15 writer and first-fall admission")
    args = parser.parse_args()
    if args.current_state15:
        check_state15_0_140()
        return
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
