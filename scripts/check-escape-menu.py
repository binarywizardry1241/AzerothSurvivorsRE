#!/usr/bin/env python3
"""Check the 0.112.5 Escape contract without compiling or starting a game.

Unmodified selected-EXE instructions run against explicit input/resource seams.
The source assertions establish connectivity only; they do not execute Rust.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

# Reuse the retained analysis dependency when no ordinary Unicorn install exists.
sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import (
    UC_X86_REG_RAX, UC_X86_REG_RBP, UC_X86_REG_RBX, UC_X86_REG_RCX,
    UC_X86_REG_RDX, UC_X86_REG_RSI, UC_X86_REG_RSP, UC_X86_REG_R8,
    UC_X86_REG_R9, UC_X86_REG_R11, UC_X86_REG_R12, UC_X86_REG_R13, UC_X86_REG_R14,
)

EVIDENCE = ROOT / "docs/analysis/evidence/0.112.5/escape-menu"
MASK = (1 << 64) - 1
ESCAPE = 0x73
MODIFIERS = {value for value in range(63) if (0x7B18000000000000 >> value) & 1}


class Native:
    def __init__(self, image, pe):
        self.image, self.pe = image, pe

    def raw(self, first, last):
        at = self.pe.rva_offset(first - self.pe.image_base)
        return self.image[at:at + last - first]

    def machine(self, first, last):
        u = Uc(UC_ARCH_X86, UC_MODE_64)
        start, finish = first & ~4095, (last + 4095) & ~4095
        u.mem_map(start, finish - start)
        u.mem_write(first, self.raw(first, last))
        u.mem_map(0x200000000, 0x20000)
        return u


def producer_cases(native):
    """Execute native ownership/admission loops before iterator/allocator calls."""
    rows = []
    batches = [
        ("empty", []), ("ordinary", [(0x12, 0, 0)]),
        ("escape-press", [(ESCAPE, 0, 0)]),
        ("escape-release", [(ESCAPE, 1, 0)]),
        ("escape-repeat", [(ESCAPE, 0, 1)]),
        ("escape-release-repeat", [(ESCAPE, 1, 0), (ESCAPE, 0, 1)]),
        ("ordinary-before-escape", [(0x12, 0, 0), (ESCAPE, 0, 0)]),
        ("release-before-press", [(ESCAPE, 1, 0), (ESCAPE, 0, 0)]),
        ("two-presses-coalesce", [(ESCAPE, 0, 0), (ESCAPE, 0, 0)]),
    ]
    for typing in (False, True):
        for capture in (False, True):
            for name, events in batches:
                u = native.machine(0x14007D170, 0x14007DDCC)
                bp, event = 0x200000800, 0x200002000
                for index, (key, state, repeat) in enumerate(events):
                    u.mem_write(event + index * 0x50 + 0x40, struct.pack("<I", key))
                    u.mem_write(event + index * 0x50 + 0x4C, bytes([state, repeat]))
                u.mem_write(bp + 0x53, bytes([capture]))
                for register, value in (
                    (UC_X86_REG_RBP, bp), (UC_X86_REG_R13, len(events)),
                    (UC_X86_REG_R11, event), (UC_X86_REG_RSI, not typing),
                    (UC_X86_REG_RBX, 0),
                ):
                    u.reg_write(register, value)
                result = {}

                def hook(uc, address, size, context):
                    if address == 0x14007D7DC:
                        result["owns_escape"] = bool(uc.reg_read(UC_X86_REG_RBX) & 255)
                    if address in (0x14007D973, 0x14007D9D4):
                        result["request"] = address == 0x14007D9D4 and bool(
                            struct.unpack("<I", uc.mem_read(bp + 0x48, 4))[0] & 255)
                        uc.emu_stop()

                u.hook_add(UC_HOOK_CODE, hook)
                u.emu_start(0x14007D79F, 0, count=1000)
                expected = {
                    "owns_escape": not typing and any(k == ESCAPE for k, _, _ in events),
                    "request": not typing and any(k == ESCAPE and s == 0 and r == 0
                                                   for k, s, r in events),
                }
                assert result == expected, (typing, capture, name, result, expected)
                rows.append(dict(kind="producer", typing=typing,
                                 binding_capture=capture, batch=name, **result))
    return rows


def filter_cases(native):
    """Execute the actual retained-event predicate, including release/repeat."""
    rows = []
    for owns in (False, True):
        for capture in (False, True):
            for key in (0x12, min(MODIFIERS), ESCAPE):
                for state in (0, 1):
                    for repeat in (0, 1):
                        u = native.machine(0x1402BCA50, 0x1402BCCC9)
                        bp, pair, flags = 0x200000800, 0x200002000, 0x200003000
                        u.mem_write(pair, struct.pack("<QQ", flags, flags + 1))
                        u.mem_write(flags, bytes([owns, capture]))
                        u.mem_write(bp + 0x20, struct.pack("<I", key))
                        u.mem_write(bp + 0x2C, bytes([state, repeat]))
                        u.reg_write(UC_X86_REG_RBP, bp)
                        u.reg_write(UC_X86_REG_R12, pair)
                        u.reg_write(UC_X86_REG_R13, 0x7B18000000000000)
                        result = {}

                        def hook(uc, address, size, context):
                            if address in (0x1402BCB2B, 0x1402BCB80, 0x1402BCC48):
                                result["retained"] = address != 0x1402BCB2B
                                uc.emu_stop()

                        u.hook_add(UC_HOOK_CODE, hook)
                        u.emu_start(0x1402BCB18, 0, count=100)
                        expected = not ((owns and key == ESCAPE) or
                                        (capture and state == 0 and
                                         key != ESCAPE and key not in MODIFIERS))
                        assert result.get("retained") == expected, (
                            owns, capture, key, state, repeat, result)
                        rows.append(dict(kind="filter", owns_escape=owns,
                                         binding_capture=capture, key=key, state=state,
                                         repeat=repeat, **result))
    return rows


def reader_cases(native):
    """Retained messages already seen by the persistent reader are not fresh."""
    rows = []
    for name, seen, oldest, expected in (
        ("new-reader", 0, 0, 3), ("partly-seen-old-buffer", 1, 0, 2),
        ("old-buffer-seen", 2, 0, 1),
        ("typing-press-already-seen-next-frame", 3, 0, 0),
        ("reader-beyond-retained-count", 4, 0, 0),
        ("expired-old-messages", 0, 10, 3),
    ):
        u = native.machine(0x14007D170, 0x14007DDCC)
        bp, messages, reader = 0x200000800, 0x200002000, 0x200003000
        def q(address, value):
            u.mem_write(address, struct.pack("<Q", value))
        q(reader, seen)
        for offset, value in ((8, 0x200004000), (0x10, 2), (0x18, oldest),
                              (0x28, 0x200006000), (0x30, 1),
                              (0x38, oldest + 2), (0x40, oldest + 3)):
            q(messages + offset, value)
        u.reg_write(UC_X86_REG_RBP, bp)
        u.reg_write(UC_X86_REG_R14, messages)
        u.reg_write(UC_X86_REG_R8, reader)
        def hook(uc, address, size, context):
            if address == 0x14007D78A:
                uc.emu_stop()
        u.hook_add(UC_HOOK_CODE, hook)
        u.emu_start(0x14007D707, 0, count=100)
        fresh = struct.unpack("<Q", u.mem_read(bp + 0x10, 8))[0]
        assert fresh == expected, (name, fresh, expected)
        rows.append(dict(kind="reader", case=name, fresh_count=fresh))
    return rows


def consumer_cases(native):
    """Execute the request take, priorities and pause/pregame transition gates."""
    cases = [
        ("no-request", {"request": False}, "none"),
        ("typing-rejects", {"typing": True}, "none"),
        ("capture-cancel-first", {"binding_capture": True, "options": True,
                                  "talents": True}, "capture-cancel"),
        ("options-close-first", {"options": True, "talents": True}, "options-close"),
        ("talents-close", {"talents": True}, "talents-close"),
        ("popup-selection-close", {"selection": 0}, "selection-close"),
        ("popup-dismiss", {"popup": True}, "popup-close"),
        ("other-overlay-close", {"other": True}, "other-close"),
        ("pregame-menu-close", {"menu": True}, "menu-close"),
        ("frontend-menu-open", {"frontend": True}, "menu-open"),
        ("frontend-main-rejects-open", {"frontend": True, "frontend_main": True}, "none"),
        ("frontend-exempts-typing", {"typing": True, "frontend": True}, "menu-open"),
        ("resume", {"paused": True}, "resume"),
        ("resume-precedes-choice-gates", {"paused": True, "choice": True}, "resume"),
        ("inactive-rejects", {"active": False}, "none"),
        ("choice-rejects-open", {"choice": True}, "none"),
        ("reward-rejects-open", {"reward": True}, "none"),
        ("started-run-pauses", {}, "pause"),
        ("unstarted-run-opens-pregame-menu", {"started": False}, "menu-open"),
    ]
    rows = []
    for name, changes, expected in cases:
        u = native.machine(0x14008E180, 0x14008E451)
        for address in (0x140084070, 0x1400459D0, 0x140105590):
            # Mapped stops, never emulated replacement service implementations.
            u.mem_map(address & ~4095, 4096)
        values = dict(request=True, typing=False, binding_capture=False, options=False,
                      talents=False, selection=0xFE, popup=False, other=False, menu=False,
                      frontend=False, frontend_main=False, paused=False, active=True,
                      choice=False, reward=False, started=True)
        values.update(changes)
        cursor = 0x200002000

        def alloc():
            nonlocal cursor
            cursor += 0x400
            return cursor

        def q(address, value):
            u.mem_write(address, struct.pack("<Q", value & MASK))

        def resource():
            wrapper, data, tick = alloc(), alloc(), alloc()
            q(wrapper, data)
            q(wrapper + 0x10, tick)
            u.mem_write(wrapper + 0x1C, struct.pack("<I", 37))
            return wrapper, data

        resources = {key: resource() for key in (
            "request", "options", "talents", "selection", "extra", "other",
            "menu", "frontend", "screen", "commands", "typing")}
        for key in ("request", "talents", "other", "menu", "typing"):
            u.mem_write(resources[key][1], bytes([values[key]]))
        opt, selected, frontend, screen = [resources[key][1] for key in
                                          ("options", "selection", "frontend", "screen")]
        q(opt + 0x90, 0 if values["binding_capture"] else MASK)
        u.mem_write(opt + 0x1C0, bytes([values["options"]]))
        u.mem_write(selected + 0x77, bytes([values["selection"]]))
        u.mem_write(selected + 0x72, bytes([values["popup"]]))
        u.mem_write(frontend, bytes([values["frontend_main"]]))
        u.mem_write(frontend + 0xD, bytes([values["frontend"]]))
        u.mem_write(screen + 0xE8, bytes([values["active"], values["started"], values["paused"]]))
        u.mem_write(screen + 0x80, bytes([0 if values["choice"] else 0xFF]))
        u.mem_write(screen + 0xA0, bytes([0 if values["reward"] else 0xFF]))
        sp, stop = 0x20001F008, 0x200001000
        q(sp, stop)
        for offset, key in ((0x28, "selection"), (0x30, "extra"), (0x38, "other"),
                            (0x40, "menu"), (0x48, "frontend"), (0x50, "screen"),
                            (0x58, "commands"), (0x60, "typing")):
            q(sp + offset, resources[key][0])
        for register, key in ((UC_X86_REG_RDX, "request"), (UC_X86_REG_R8, "options"),
                              (UC_X86_REG_R9, "talents")):
            u.reg_write(register, resources[key][0])
        u.reg_write(UC_X86_REG_RSP, sp)
        result = {"action": "none"}

        def hook(uc, address, size, context):
            if address == stop:
                uc.emu_stop()
            elif address == 0x140084070:
                command = uc.reg_read(UC_X86_REG_RDX)
                assert struct.unpack("<I", uc.mem_read(command, 4))[0] == 7
                result["action"] = "pause" if uc.mem_read(command + 4, 1)[0] else "resume"
                uc.emu_stop()
            elif address in (0x1400459D0, 0x140105590):
                result["action"] = "options-close" if address == 0x1400459D0 else "popup-close"
                uc.emu_stop()
            elif not 0x14008E180 <= address < 0x14008E451:
                raise AssertionError(f"Unreviewed native consumer escape: {address:#x}")

        u.hook_add(UC_HOOK_CODE, hook)
        u.emu_start(0x14008E180, 0, count=1000)
        assert u.mem_read(resources["request"][1], 1)[0] == 0, name
        if result["action"] == "none":
            if values["binding_capture"] and struct.unpack("<Q", u.mem_read(opt + 0x90, 8))[0] == MASK:
                result["action"] = "capture-cancel"
            elif values["talents"] and u.mem_read(resources["talents"][1], 1)[0] == 0:
                result["action"] = "talents-close"
            elif values["selection"] != 0xFE and u.mem_read(selected + 0x77, 1)[0] == 0xFE:
                result["action"] = "selection-close"
            elif values["other"] and u.mem_read(resources["other"][1], 1)[0] == 0:
                result["action"] = "other-close"
            elif values["menu"] and u.mem_read(resources["menu"][1], 1)[0] == 0:
                result["action"] = "menu-close"
            elif not values["menu"] and u.mem_read(resources["menu"][1], 1)[0] == 1:
                result["action"] = "menu-open"
        assert result["action"] == expected, (name, result, expected)
        rows.append(dict(kind="consumer", case=name, request_taken=True, **result))
    return rows


def presentation_cases(native):
    """Read each native selected localization key at its normal lookup call."""
    rows = []
    for role, first, last, labels in (
        ("first-row", 0x14001C0E8, 0x14001C113, ("menu.back", "menu.resume")),
        ("title", 0x140346B11, 0x140346B4C, ("picker.menu", "menu.paused")),
        ("hint", 0x140346CEE, 0x140346D29, ("menu.escape_back", "menu.escape_resume")),
    ):
        for started in (False, True):
            u = native.machine(first, last)
            u.mem_map(0x1458C5000, 4096)
            u.reg_write(UC_X86_REG_RBP, 0x200000800)
            u.reg_write(UC_X86_REG_RSP, 0x20001F008)
            u.reg_write(UC_X86_REG_R12, 0x200002000)
            u.reg_write(UC_X86_REG_RSI, started)
            u.mem_write(0x200002000, bytes([started]))
            result = {}

            def hook(uc, address, size, context):
                if address == 0x1458C5E30:
                    pointer, length = uc.reg_read(UC_X86_REG_RCX), uc.reg_read(UC_X86_REG_RDX)
                    result["label"] = native.raw(pointer, pointer + length).decode()
                    uc.emu_stop()

            u.hook_add(UC_HOOK_CODE, hook)
            u.emu_start(first, 0, count=50)
            assert result.get("label") == labels[started], (role, started, result)
            rows.append(dict(kind="presentation", role=role, started=started, **result))
    return rows


def source_checks():
    client = (ROOT / "crates/benilla-app/src/local_client.rs").read_text()
    capture = client.split("fn capture_game_menu_input(", 1)[1].split("fn capture_input(", 1)[0]
    for contract in (
        "!session.active || !extension.custom_game_menu || capture.typing",
        "keyboard.drain()", "event.key_code != KeyCode::Escape",
        "*state == bevy::input::ButtonState::Pressed && !*repeat",
        "keyboard.write_batch(retained)", "input.custom_game_menu_requested = false",
        "Local<bevy::ecs::message::MessageCursor<bevy::input::keyboard::KeyboardInput>>",
        "reader.read(&keyboard)", "reader.clear(&keyboard)",
    ):
        assert contract in capture, contract
    assert capture.index("reader.read(&keyboard)") < capture.index("if !session.active")
    assert capture.index("reader.clear(&keyboard)") > capture.index("keyboard.write_batch(retained)")
    assert "capture_game_menu_input.in_set(LocalClientSet::OverlayCapture)" in client
    assert "LocalClientSet::OverlayCapture.before(crate::ui_script::UiInput)" in client
    assert "input.custom_game_menu_requested |= device.as_ref()" in client
    assert "capture_input\n                    .after(crate::ui_script::UiInput)" in client
    pause = (ROOT / "crates/azeroth-survivors-re/src/gameplay/run_hud/pause.rs").read_text()
    for contract in (
        "std::mem::take(&mut native.custom_game_menu_requested)", "!native.keyboard_captured",
        "!options.open && !options_were_open", "session.talent_view_open = false",
        "else if state.open", "!session.mechanics.as_ref().unwrap().is_paused_for_choice()",
    ):
        assert contract in pause, contract
    gameplay = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mod.rs").read_text()
    assert ".after(benilla_app::local_client::LocalClientSet::Input)" in gameplay
    assert ".after(OptionsSet::Input)" in gameplay
    assert "pause.paused(&options)" in gameplay
    assert "6400" in pause and "crate::menu_overlay::spawn(" in pause
    assert '("menu.paused", "menu.resume", "menu.escape_resume")' in pause
    assert '("picker.menu", "menu.back", "menu.escape_back")' in pause


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", "--verify", action="store_true", help="Run read-only checks (the default).")
    parser.add_argument("--output", help="Optional ignored project-local runtime JSON report.")
    args = parser.parse_args()
    manifest = json.loads((EVIDENCE / "manifest.json").read_text())
    target = latest_target(verify=True)
    assert target["version"] == manifest["target_version"]
    assert target["sha256"] == manifest["target_sha256"], "Selected target changed; refresh this contract."
    image = target_bytes(target)
    pe = load_script("escape_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    native = Native(image, pe)
    intervals = []
    for row in manifest.get("whole_owner_context", []):
        first, last = int(row["va"], 16), int(row["end_exclusive"], 16)
        assert hashlib.sha256(native.raw(first, last)).hexdigest() == row["sha256"]
    for row in manifest["ranges"]:
        first, last = int(row["va"], 16), int(row["end_exclusive"], 16)
        encoded = native.raw(first, last)
        assert row["byte_count"] == last - first
        assert hashlib.sha256(encoded).hexdigest() == row["sha256"], row["role"]
        assert all(last <= begin or first >= end for begin, end in intervals), "Duplicate native byte range"
        intervals.append((first, last))
        if "assembly" in row:
            text = (EVIDENCE / row["assembly"]).read_bytes()
            assert hashlib.sha256(text).hexdigest() == row["assembly_sha256"]
            cursor, collected = first, bytearray()
            for line in text.decode().splitlines():
                fields = line.split("\t", 3)
                assert len(fields) >= 3, (row["assembly"], line)
                assert int(fields[0], 16) == cursor, "Noncontiguous assembly extraction"
                instruction = bytes.fromhex(fields[1])
                assert instruction and instruction == encoded[cursor - first:cursor - first + len(instruction)]
                collected.extend(instruction)
                cursor += len(instruction)
            assert cursor == last and collected == encoded, "Assembly does not cover exact native range"
        if "hex" in row:
            assert bytes.fromhex(row["hex"]) == encoded
        if "utf8" in row:
            assert row["utf8"].encode() == encoded
    rows = (producer_cases(native) + filter_cases(native) + reader_cases(native) + consumer_cases(native)
            + presentation_cases(native))
    source_checks()
    record = dict(target_sha256=target["sha256"], native_cases=len(rows), cases=rows,
                  source_connectivity_checked=True, rebuilt_code_executed=False,
                  application_executed=False, compilation_run=False, limits=manifest["limits"])
    if args.output:
        output = (ROOT / args.output).resolve()
        assert output.is_relative_to(ROOT / "runtime"), "Output must stay in project runtime/."
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(record, indent=2) + "\n")
    print(f"Passed {len(rows)} selected-native Escape branches and static source connectivity; no compilation/game.")


if __name__ == "__main__":
    main()
