#!/usr/bin/env python3
"""Replay the complete selected Cards keyboard handler with explicit API seams.

The shipped instructions execute in an emulator against synthetic resources;
only just-pressed set queries and command enqueue calls are supplied. No target
process, Rust compiler, game, renderer or external account is used. --stage
writes proposed evidence beneath ignored runtime/ for review.
"""
import argparse
import collections
import hashlib
import itertools
import json
import math
from pathlib import Path
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
WORK = ROOT / "runtime/analysis/history/findings/q41-card-typing/f4f4a3385d50"
KEEP = ROOT / "docs/analysis/evidence/0.113.2/card-keyboard"
RANGES = {
    "keyboard": (0x1400B3420, 0x1400B37B9),
    "snapshot-typing": (0x1400D8667, 0x1400D8789),
    "typing-getter": (0x1405C90A0, 0x1405C9192),
    "keyboard-wrapper": (0x1400BE610, 0x1400BE969),
    "pointer-opening-load": (0x1400B4F60, 0x1400B4F68),
    "pointer-opening-gate": (0x1400B54BA, 0x1400B54DC),
    "root-revision-gate": (0x1400B38D9, 0x1400B3928),
    "initializer-world-context": (0x1400BE22C, 0x1400BE26C),
    "initializer-typing-id": (0x1400BE28B, 0x1400BE2BF),
    "initializer-typing-store": (0x1400BE37B, 0x1400BE3B1),
    "typing-type-lookup": (0x1400CD8E3, 0x1400CD996),
}
KEYS = dict(Digit1=7, Digit2=8, Digit3=9, Digit4=10,
            Numpad1=86, Numpad2=87, Numpad3=88, Numpad4=89, KeyR=37)
HASHES = {7: 0x9FB060E55B860125, 8: 0x5DB5E5C23709178B,
          9: 0x1CD9DC15E88EA765, 10: 0xDADD51724411B5D0,
          86: 0x0553012CA8DB3D6B, 87: 0xC5877B74625F4E71,
          88: 0x83F8FC5D3E225CA4, 89: 0x422CD6E4F7A7EC49,
          37: 0x2497FA721601C666}


def digest(value):
    return hashlib.sha256(value).hexdigest()


def json_bytes(value):
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def f32(value):
    try:
        return struct.unpack("<f", struct.pack("<f", value))[0]
    except OverflowError:
        return math.copysign(math.inf, value)


def from_bits(value):
    return struct.unpack("<f", struct.pack("<I", value))[0]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as regs

    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Changed target requires fresh recovery"
    image = target_bytes(target)
    pe = load_script("card_keyboard_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        result = image[offset:offset + size]
        assert len(result) == size
        assert pe.rva_offset(address + size - 1 - pe.image_base) == offset + size - 1
        return result

    def span(address, end):
        return dict(address=hex(address), end_exclusive=hex(end), byte_count=end - address,
                    sha256=digest(raw(address, end - address)))

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    assembly, instructions = {}, {}
    for role, (start, end) in RANGES.items():
        rows = list(decoder.disasm(raw(start, end - start), start))
        assert sum(row.size for row in rows) == end - start
        instructions[role] = rows
        assembly[role] = "\n".join(f"{row.address:016x}: {row.bytes.hex():30} {row.mnemonic} {row.op_str}".rstrip()
                                     for row in rows) + "\n"
    extents = {pe.image_base + start: pe.image_base + end for start, end, _ in pe.functions()}
    assert extents[0x1400B3420] == 0x1400B37B9
    assert extents[0x1405C90A0] == 0x1405C9192
    calls = {row.address: int(row.op_str, 16) for row in instructions["keyboard"] if row.mnemonic == "call"}
    assert set(calls.values()) == {0x14015E7C0, 0x1400DD4A0}
    assert len(calls) == 14  # Nine key lookups plus four Select and one Reroll enqueue sites.
    threshold_address = 0x145EA2570
    assert raw(threshold_address, 4).hex() == "6666e63e"
    threshold = from_bits(0x3EE66666)

    keycode_sources = list((ROOT / "runtime/tool-state/cargo/registry/src").glob("*/bevy_input-0.18.1/src/keyboard.rs"))
    assert len(keycode_sources) == 1, "Restore the project-local retained Bevy 0.18.1 source"
    keycode_path = keycode_sources[0]
    enum_text = keycode_path.read_text().split("pub enum KeyCode {", 1)[1].split("\n}", 1)[0]
    variants = re.findall(r"^    ([A-Z][A-Za-z0-9_]*)(?:\([^\n]*\))?,\s*$", enum_text, re.M)
    assert variants[0] == "Unidentified" and len(variants) == 195
    assert {name: variants.index(name) for name in KEYS} == KEYS

    vm = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(section["rva"] + max(section["raw_size"], section["virtual_size"]) for section in pe.sections)
    vm.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        offset, size = section["raw_offset"], section["raw_size"]
        vm.mem_write(pe.image_base + section["rva"], image[offset:offset + size])
    heap, stack, sentinel = 0x200000000, 0x300000000, 0x30000FF00
    vm.mem_map(heap, 0x10000)
    vm.mem_map(stack, 0x10000)
    vm.mem_write(sentinel, b"\xcc")
    cards, buttons, capture, commands, clock, tick = [heap + offset for offset in (0, 0x1000, 0x2000, 0x3000, 0x4000, 0x5000)]
    button_res, capture_res, card_res, command_res, clock_res = [heap + offset for offset in (0x6000, 0x6100, 0x6200, 0x6300, 0x6400)]
    entry_rsp = stack + 0xE008
    pressed, queries, events, excursions = set(), [], [], set()
    mode, probe_ends, decoder_visited = "keyboard", set(), set()
    decoder_start, decoder_end = 0x144350500, 0x1443526BD
    decoder_rows = {row.address: row for row in decoder.disasm(raw(decoder_start, decoder_end - decoder_start), decoder_start)}

    def reg(name, value=None):
        register = getattr(regs, "UC_X86_REG_" + name)
        if value is not None:
            vm.reg_write(register, value)
        return vm.reg_read(register)

    def put(address, value, fmt="Q"):
        vm.mem_write(address, struct.pack("<" + fmt, value))

    def get(address, fmt="Q"):
        return struct.unpack("<" + fmt, vm.mem_read(address, struct.calcsize("<" + fmt)))[0]

    def native_return(value=0):
        sp = reg("RSP")
        reg("RIP", get(sp))
        reg("RSP", sp + 8)
        reg("RAX", value)

    def hook(_, pc, size, unused):
        if pc in probe_ends:
            vm.emu_stop()
        elif mode == "name-decoder":
            assert decoder_start <= pc < decoder_end and decoder_rows[pc].mnemonic != "call", hex(pc)
            decoder_visited.add(pc)
        elif mode != "keyboard":
            assert RANGES[mode][0] <= pc < RANGES[mode][1], hex(pc)
        elif pc == sentinel:
            vm.emu_stop()
        elif RANGES["keyboard"][0] <= pc < RANGES["keyboard"][1]:
            excursions.add(pc)
        elif pc == 0x14015E7C0:
            assert reg("RCX") == buttons + 0x20
            key = get(reg("R8"), "I")
            assert reg("RDX") == HASHES[key]
            queries.append(key)
            native_return(heap + 0x7000 if key in pressed else 0)
        elif pc == 0x1400DD4A0:
            assert reg("RCX") == commands
            pointer = reg("RDX")
            tag = get(pointer, "I")
            assert tag in (2, 3)
            events.append([tag, get(pointer + 8) if tag == 2 else None])
            native_return()
        else:
            raise AssertionError(f"Unreviewed native excursion {pc:#x}")

    vm.hook_add(UC_HOOK_CODE, hook)
    case_hash, counts = hashlib.sha256(), collections.Counter()
    samples = {}

    def case(group, keys=(), count=4, closing=0, captured=0, now=0x3F800000, opened=0,
             available=1, free=1, price=1, gold=1, key_count=1):
        nonlocal pressed, queries, events
        pressed, queries, events = set(keys), [], []
        vm.mem_write(heap, bytes(0x10000))
        vm.mem_write(stack + 0xD000, bytes(0x2000))
        put(cards, 0xABCD)
        put(cards + 8, 0xFEDC)
        put(cards + 0x10, closing, "B")
        put(cards + 0x14, 0xDEADBEEF, "I")
        put(cards + 0x18, count)
        put(cards + 0x20, free)
        put(cards + 0x28, price)
        put(cards + 0x30, gold)
        put(cards + 0x44, opened, "I")
        put(cards + 0x48, available, "B")
        put(buttons + 0x38, key_count)
        put(capture + 1, captured, "B")
        put(clock + 0x5C, now, "I")
        put(tick, 0x12345678, "I")
        for at, value in ((button_res, buttons), (capture_res, capture), (card_res, cards),
                          (card_res + 0x10, tick), (command_res, commands), (clock_res, clock),
                          (entry_rsp, sentinel), (entry_rsp + 0x28, command_res), (entry_rsp + 0x30, clock_res)):
            put(at, value)
        put(card_res + 0x1C, 0x31415926, "I")
        for name, value in (("RSP", entry_rsp), ("RDX", button_res), ("R8", capture_res), ("R9", card_res)):
            reg(name, value)
        expected_queries, expected_events, selected = [], [], None
        expected_tick = 0x12345678
        if count != 0 and closing == 0 and captured == 0 and key_count != 0:
            for index in range(4):
                top, pad = 7 + index, 86 + index
                expected_queries.append(top)
                match = top in pressed
                if not match:
                    expected_queries.append(pad)
                    match = pad in pressed
                if match:
                    expected_tick = 0x31415926
                    age = f32(from_bits(now) - from_bits(opened))
                    if count > index and selected is None and not threshold > age:
                        selected = index
                        expected_events.append([2, index])
            expected_queries.append(37)
            if 37 in pressed and available == 1 and (free != 0 or gold >= price):
                expected_events.append([3, None])
        parameters = dict(group=group, keys=sorted(keys), count=count, closing=closing, captured=captured,
                          now_bits=hex(now), opened_bits=hex(opened), available=available, free=free,
                          price=price, gold=gold, key_count=key_count)
        try:
            vm.emu_start(0x1400B3420, 0, count=800)
        except Exception as error:
            raise AssertionError((parameters, hex(reg("RIP")), hex(reg("RSP")), queries, events)) from error
        assert reg("RIP") == sentinel, parameters
        assert events == expected_events, (parameters, events, expected_events)
        assert queries == expected_queries, (parameters, queries, expected_queries)
        assert get(tick, "I") == expected_tick, parameters
        if selected is None:
            assert (get(cards), get(cards + 8), get(cards + 0x10, "B"), get(cards + 0x14, "I")) == (0xABCD, 0xFEDC, closing, 0xDEADBEEF), parameters
        else:
            assert (get(cards), get(cards + 8), get(cards + 0x10, "I"), get(cards + 0x14, "I")) == (1, selected, 1, now), parameters
        result = dict(**parameters, events=events, queried=queries, tick_written=expected_tick != 0x12345678)
        case_hash.update(json_bytes(result))
        counts[group] += 1
        counts["total"] += 1
        counts["selection_events"] += sum(event[0] == 2 for event in events)
        counts["reroll_events"] += sum(event[0] == 3 for event in events)
        if group == "simultaneous":
            samples[str(keys)] = result

    individual = [(), *((key,) for key in KEYS.values()), (7, 8, 9, 10, 37), tuple(KEYS.values())]
    for captured, closing, count, keys in itertools.product((0, 1, 2, 255), (0, 1, 255), (0, 1, 4), individual):
        case("entry_gates", keys, count=count, closing=closing, captured=captured)
    clocks = (0xBF800000, 0, 0x3EA3D70A, 0x3EE66665, 0x3EE66666, 0x3EE66667, 0x3F800000,
              0x7F800000, 0xFF800000, 0x7FC00001, 0xFFC00001, 0x7F800001)
    for now, count, keys in itertools.product(clocks, (0, 1, 2, 3, 4, 5), individual):
        case("opening_clock", keys, count=count, now=now)
    for mask, now, count in itertools.product(range(1 << 9), (0, 0x3EE66666, 0x7FC00001), (1, 3, 4)):
        case("key_combinations", [key for bit, key in enumerate(KEYS.values()) if mask & (1 << bit)], count=count, now=now)
    for available, free, wallet, keys in itertools.product((0, 1, 2, 255), (0, 1, 2, (1 << 64) - 1),
                                                         ((0, 0), (0, 1), (1, 0), (1, 1), (1, 2), (2, 1),
                                                          ((1 << 64) - 1, (1 << 64) - 2), ((1 << 64) - 1, (1 << 64) - 1),
                                                          ((1 << 64) - 1, 0), (0, (1 << 64) - 1)),
                                                         ((37,), (7, 37))):
        price, gold = wallet
        case("reroll_wallet", keys, available=available, free=free, price=price, gold=gold)
    for keys in individual:
        case("empty_key_set", keys, key_count=0)
    for keys in ((7, 37), (10, 37), (7, 8, 9, 10, 37), (7, 86, 37), (86, 87, 88, 89, 37)):
        case("simultaneous", keys)
    for now, opened in ((0x3F800000, 0x3F800000), (0x40000000, 0x3F800000),
                        (0x7F800000, 0x7F800000), (0, 0x7FC00001)):
        case("difference_clock", (7, 37), now=now, opened=opened)

    keyboard_counts = dict(sorted(counts.items()))
    keyboard_case_digest = case_hash.hexdigest()
    keyboard_visited_count = len(excursions)
    # These selected static interfaces use the original comparison instructions,
    # including their differing unordered-float behavior. They do not replay the
    # surrounding pointer controller or root hierarchy.
    pointer_cases, revision_cases, named_keys = [], [], []
    for now, closing in itertools.product(clocks, (0, 1, 2, 255, 256)):
        vm.mem_write(heap, bytes(0x10000))
        reg("RSP", entry_rsp)
        mode, probe_ends = "pointer-opening-load", {0x1400B4F68}
        vm.emu_start(0x1400B4F60, 0, count=4)
        assert reg("XMM7") & 0xFFFFFFFF == 0x3EE66666
        put(entry_rsp + 0x58, cards)
        put(cards + 0x10, closing, "I")
        put(cards + 0x44, 0, "I")
        reg("XMM6", now)
        mode, probe_ends = "pointer-opening-gate", {0x1400B54DC}
        vm.emu_start(0x1400B54BA, 0, count=20)
        admitted = bool(reg("R8") & 255)
        assert admitted == (closing == 0 and from_bits(now) >= threshold)
        pointer_cases.append(dict(now_bits=hex(now), closing=closing, admitted=admitted))
    exit_threshold = from_bits(0x3EA3D70A)
    assert raw(0x145ECBAB0, 4).hex() == "0ad7a33e"
    exit_clocks = (0, 0x3EA3D709, 0x3EA3D70A, 0x3EA3D70B, 0x3EE66666,
                   0x7F800000, 0xFF800000, 0x7FC00001)
    frame, incoming = heap + 0x8000, heap + 0x9000
    for now, closing, changed, count in itertools.product(exit_clocks, (0, 1, 2), (False, True), (0, 1)):
        vm.mem_write(heap, bytes(0x10000))
        reg("RSP", entry_rsp)
        reg("RBP", frame)
        reg("R12", cards)
        reg("R8", incoming)
        put(incoming + 0xE0, int(changed), "I")
        put(cards + 0x40, 0, "I")
        put(cards + 0x10, closing, "I")
        put(cards + 0x14, 0, "I")
        put(clock + 0x5C, now, "I")
        put(frame + 0x3D0, clock)
        put(frame + 0x3B0, count)
        mode, probe_ends = "root-revision-gate", {0x1400B3928, 0x1400B471B}
        vm.emu_start(0x1400B38D9, 0, count=25)
        admitted = reg("RIP") == 0x1400B3928
        assert admitted == (changed and count != 0 and (closing != 1 or not exit_threshold > from_bits(now)))
        revision_cases.append(dict(now_bits=hex(now), closing=closing, revision_changed=changed,
                                   count=count, admitted=admitted))
    for name, key in KEYS.items():
        vm.mem_write(heap, bytes(0x10000))
        string, output, status = heap + 0x8000, heap + 0x8100, heap + 0x8200
        vm.mem_write(string, name.encode())
        for register, value in (("RAX", string), ("RDX", len(name)), ("RSI", status),
                                ("RDI", output), ("RBP", stack + 0x8000), ("RSP", entry_rsp)):
            reg(register, value)
        mode, probe_ends = "name-decoder", {0x144350639}
        vm.emu_start(0x14435058C, 0, count=500)
        assert reg("RIP") == 0x144350639
        assert get(output, "I") == key and get(status, "B") == 255, (name, get(output, "I"))
        named_keys.append(dict(name=name, native_discriminant=key))
    name_rows = [decoder_rows[address] for address in sorted(decoder_visited)]
    assembly["key-name-decoder"] = "\n".join(f"{row.address:016x}: {row.bytes.hex():30} {row.mnemonic} {row.op_str}".rstrip()
                                               for row in name_rows) + "\n"
    name_ranges = []
    for row in name_rows:
        if name_ranges and name_ranges[-1][1] == row.address:
            name_ranges[-1][1] += row.size
        else:
            name_ranges.append([row.address, row.address + row.size])
    length_table = 0x1469A6290
    length_offsets = struct.unpack("<19i", raw(length_table, 76))
    assert [length_table + length_offsets[length - 2] for length in (4, 6, 7)] == [0x1443512CF, 0x1443508DD, 0x144350EB0]
    identity = (json.loads((WORK / "resource-identity/identity.json").read_text()) if args.stage
                else json.loads((KEEP / "manifest.json").read_text())["resource_identity"])
    identity = {key: value for key, value in identity.items() if key != "ranges"}
    assert identity["target"]["sha256"] == SHA
    typeid = bytes.fromhex("0bb84550b75c0970ae2aad7a9fab2f6d")
    for row in identity["typeids"]:
        assert raw(int(row["address"], 16), 16) == bytes.fromhex(row["bytes_hex"]) == typeid
    assert raw(0x145ECF090, 16) == bytes([54]) * 16
    for row in identity["vtable_bindings"]:
        assert raw(int(row["address"], 16), 8) == struct.pack("<Q", int(row["value"], 16))
    assert raw(0x1400BE39D, 4).hex() == "4c897210"  # system_state+0x10 = retained R14 ID
    assert identity["rea"]["actual_bodies"]["0x1400be1e0"]["total_bytes"] == 676
    assert identity["rea"]["actual_bodies"]["0x1400cd8d0"]["total_bytes"] == 752
    source_path = ROOT / "crates/azeroth-survivors-re/src/gameplay/mod.rs"
    source = source_path.read_text()
    helper = source.split("fn keyboard_choice_actions(", 1)[1].split("\nfn tick(", 1)[0]
    controls = source.split("fn controls(", 1)[1].split("const CHOICE_OPENING_SECONDS", 1)[0]
    assert "f32::from_bits(0x3ee6_6666)" in source and "f32::from_bits(0x3ea3_d70a)" in source
    assert "if count == 0 { return (None, false); }" in helper
    assert "if age < CHOICE_OPENING_SECONDS" in helper
    for index in range(1, 5):
        assert f"[KeyCode::Digit{index}, KeyCode::Numpad{index}]" in helper
    assert "can_reroll && keys.just_pressed(KeyCode::KeyR)" in helper
    assert "if !input.keyboard_captured && opened.closing.is_none()" in controls
    guarded = controls.split("if !input.keyboard_captured && opened.closing.is_none()", 1)[1]
    assert guarded.index("keyboard_choice_actions(") < guarded.index("if reroll")
    bridge_path = ROOT / "crates/benilla-app/src/local_client.rs"
    bridge = bridge_path.read_text()
    bridge_line = "input.keyboard_captured = session.active && keyboard.typing;"
    assert bridge_line in bridge
    focus_path = ROOT / "crates/benilla-app/src/ui_script/input.rs"
    focus = focus_path.read_text()
    focus_line = "capture.typing = script.has_keyboard_focus() || binding_capture;"
    assert focus_line in focus

    record = dict(schema_version=1, target_sha256=SHA, lead_ids=["Q41-S01", "Q41-M03"],
                  claim_id="cc745d386a67e806", classification="AS_cards_keyboard_capture_and_transaction_order",
                  ranges=[dict(role=role, assembly=role + ".asm", **span(start, end),
                               assembly_sha256=digest(assembly[role].encode())) for role, (start, end) in RANGES.items()],
                  threshold=dict(address=hex(threshold_address), bits="0x3ee66666", value=threshold),
                  exit_threshold=dict(address="0x145ecbab0", bits="0x3ea3d70a", value=exit_threshold),
                  key_mapping=dict(observed_native_values=KEYS, native_name_cases=named_keys,
                                   native_decoder_declared_extent=span(decoder_start, decoder_end),
                                   native_decoder_ranges=[span(start, end) for start, end in name_ranges],
                                   length_table=dict(**span(length_table, length_table + 76), bytes_hex=raw(length_table, 76).hex(),
                                                     admitted_lengths=[4, 6, 7]),
                                   decoder_assembly="key-name-decoder.asm", decoder_assembly_sha256=digest(assembly["key-name-decoder"].encode()),
                                   source_mapping="Native bounded name decoder independently proves nine discriminants; retained Bevy enum is additional correspondence",
                                   source=keycode_path.relative_to(ROOT).as_posix(), source_sha256=digest(keycode_path.read_bytes()), variants=len(variants)),
                  resource_identity=identity,
                  source_projections=[dict(path=source_path.relative_to(ROOT).as_posix(), helper_sha256=digest(helper.encode()),
                                           controls_sha256=digest(controls.encode())),
                                      dict(path=bridge_path.relative_to(ROOT).as_posix(), projection=bridge_line),
                                      dict(path=focus_path.relative_to(ROOT).as_posix(), projection=focus_line)],
                  seams=[dict(address="0x14015e7c0", role="Just-pressed hash-set membership", supplied="Boolean membership for exact raw key value; verifies actual prehashed query and set pointer"),
                         dict(address="0x1400dd4a0", role="Command enqueue", supplied="Record tag2/index or tag3 without executing queue allocation or backend delivery")],
                  case_counts=keyboard_counts, case_results_sha256=keyboard_case_digest,
                  pointer_gate_cases=len(pointer_cases), pointer_gate_results_sha256=digest(json_bytes(pointer_cases)),
                  root_revision_cases=len(revision_cases), root_revision_results_sha256=digest(json_bytes(revision_cases)),
                  simultaneous_examples=list(samples.values()), visited_instructions=keyboard_visited_count,
                  native_instructions_executed=True, compilation_run=False, game_run=False,
                  limits=["The complete keyboard handler executes; key-set hashing/query implementation and command queue/backend consumer are explicit supplied seams.",
                          "Game resources, bytes, clocks and command pointers are synthetic; invalid Boolean and float cases establish decoded behavior, not reachable source domains.",
                          "Getter, producer, wrapper and exact type-ID binding are target-byte/static Ghidra evidence only, not executed by this fixture. Same-valid-World resource identity is recovered; global ECS aliases and actual native chat interaction remain separate checks.",
                          "Pointer and root revision cases execute only the retained local comparisons; key-name cases begin at the visitor's length-dispatch state with synthetic name pointers and stop before its epilogue.",
                          "No reconstructed Rust, compiler, target process, application, save/configuration operation, rendering or original/rebuilt comparison runs."])
    out = WORK / "staged-keyboard" if args.stage else KEEP
    if args.stage:
        out.mkdir(parents=True, exist_ok=True)
        for role, text in assembly.items():
            (out / (role + ".asm")).write_text(text)
        (out / "manifest.json").write_text(json.dumps(record, indent=2) + "\n")
    else:
        assert json.loads((out / "manifest.json").read_text()) == record
        for role, text in assembly.items():
            assert (out / (role + ".asm")).read_text() == text
        provider = json.loads((out / "ghidra.json").read_text())
        assert provider["target_sha256"] == SHA
        assert provider["keyboard_body"]["ranges"] == [{"start": "0x1400b3420", "end": "0x1400b37b8"}]
        assert provider["keyboard_body"]["total_bytes"] == 921
        assert provider["provider"]["id"] == "ghidra"
        for files in provider["reproduction"].values():
            for name, sha256 in files.items():
                assert digest((out / name).read_bytes()) == sha256
    print(json.dumps(dict(result="passed", cases=counts["total"], pointer_gate_cases=len(pointer_cases),
                          root_revision_cases=len(revision_cases), native_key_name_cases=len(named_keys),
                          compilation_run=False, game_run=False, REA_started=False)))


if __name__ == "__main__":
    main()
