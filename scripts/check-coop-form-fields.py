#!/usr/bin/env python3
"""Replay hash-bound 0.115.0 co-op form editing, status and selected geometry.

This reads the configured installed EXE in place. It does not compile Rust,
connect a socket, launch an application or execute the ECS input readers.
Unicode counts, allocation/reserve, localization/formatting, submission and
engine child builders are explicit fixture seams. Bulk results stay in runtime/.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

ui = load_script("coop_form_shared_native", ROOT / "scripts/check-coop-ui.py")
TARGET_SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
REQUIRED = {
    0x1402107E0: 0x140211173, 0x140211270: 0x14021178D,
    0x14020CB50: 0x14020D017, 0x14021CA40: 0x14021D26D,
    0x1402EE800: 0x1402EF1C7, 0x1402F17E0: 0x1402F292D,
    0x1402EF2C0: 0x1402EF5F7, 0x14020E930: 0x14020F5A9,
    0x1458095E0: 0x145809709, 0x145809710: 0x14580972F,
    0x145809010: 0x1458090A8, 0x14020D0D0: 0x14020DBC2,
}
FIELDS = {1: 0x90, 2: 0xC0, 3: 0xA8, 4: 0xD8, 5: 0xF0}
LIMITS = {1: 32, 2: 120, 3: 32, 4: 5, 5: 32}
CYCLE = {1: 2, 2: 3, 3: 1, 4: 5, 5: 4}
ACTIVE = ("hosting", "joining", "joined", "left")
REASONS = (
    "the host left", "the co-op service cannot be reached",
    "too many tries; wait a minute", "that lobby name isn't allowed",
    "a different version of the game", "you left the run", "the run is under way",
    "that description isn't allowed", "wrong password", "the host sent you away",
    "no lobby with that code", "too many lobbies open; try again later",
    "that lobby plays a different version of the game", "the party is full",
    "already in a lobby", "co-op needs the game's site", "that password is too long",
    "the host closed the party", "", "unrecognized why", "locked:sm",
    "locked:notreal", "locked:SM", "locked:",
)
PHASE_FORMATS = {
    "joining": "Joining...", "connecting": "Connecting to the co-op service...",
    "refused": "Could not join: {why}.", "denied": "Could not join: {why}.",
    "ended": "The party ended: {why}.", "closed": "The party ended: {why}.",
    "unavailable": "Co-op is unavailable: {why}.",
}


def digest(value):
    return hashlib.sha256(value).hexdigest()


def project_path(value):
    path = (ROOT / value).resolve()
    assert path.is_relative_to(ROOT), f"Path leaves project: {value}"
    return path


def verify_evidence(manifest_path, target, data, pe):
    manifest = json.loads(manifest_path.read_text())
    assert target["version"] == "0.115.0" and target["sha256"] == TARGET_SHA
    assert manifest["target"]["sha256"] == TARGET_SHA
    assert manifest["target"]["size_bytes"] == len(data)
    functions = {int(row["start"], 16): row for row in manifest["functions"]}
    for start, end in REQUIRED.items():
        assert start in functions, f"Missing native form owner {start:#x}"
        row = functions[start]
        assert int(row["end_exclusive"], 16) == end, f"Wrong form range {start:#x}"
        offset = pe.rva_offset(start - pe.image_base)
        assert int(row["file_offset"], 16) == offset
        assert digest(data[offset:offset + end - start]) == row["sha256"], row["start"]
        if "canonical_manifest" in row:
            canonical = json.loads(project_path(row["canonical_manifest"]).read_text())
            assert canonical["target"]["sha256"] == TARGET_SHA
            assert any(item["start"] == row["start"] and item["sha256"] == row["sha256"]
                       for item in canonical["functions"])
    directory = ROOT / "docs/analysis/evidence/0.115.0/coop-forms"
    for name, expected in manifest["extracts"].items():
        path = (directory / name).resolve()
        assert path.is_relative_to(directory.resolve()), name
        assert digest(path.read_bytes()) == expected, name
    for row in manifest.get("external_extracts", []):
        assert digest(project_path(row["path"]).read_bytes()) == row["sha256"]
    for row in manifest.get("data_ranges", []):
        start = int(row["start"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert int(row["file_offset"], 16) == offset
        value = data[offset:offset + row["byte_count"]]
        assert digest(value) == row["sha256"], row["start"]
        if "bytes_hex" in row:
            assert value == bytes.fromhex(row["bytes_hex"])
    for name in ("field-layout.json", "party-header-layout.json", "zone-fields.json"):
        assert name in manifest["extracts"], f"Missing compact form fixture {name}"
    return directory


class Keyboard(ui.Native):
    def hook(self, cpu, pc, size, user):
        # Stop before the next ECS event, including ignored-key continuation.
        if pc in (0x14021CBF0, 0x14021D238):
            if pc == 0x14021D238:
                self.blocked = True
            self.reg("RIP", self.stop)
            cpu.emu_stop()
            return
        if any(start <= pc < end for start, end in self.ranges):
            return super().hook(cpu, pc, size, user)
        a, b, count = (self.reg(register) for register in ("RCX", "RDX", "R8"))
        if pc in (0x145CEFAB0, 0x145CEF490):
            self.reg("RAX", len(bytes(self.cpu.mem_read(a, b)).decode()))
        elif pc == 0x145D14A10:
            length = self.q(a + 16)
            capacity = max(8, length + count, self.q(a) * 2)
            address = self.alloc(capacity)
            self.cpu.mem_write(address, bytes(self.cpu.mem_read(self.q(a + 8), length)))
            self.put(a, capacity, address, length)
        elif pc == 0x14020F670:
            self.mode = self.reg("R9") & 255
        else:
            return super().hook(cpu, pc, size, user)
        stack = self.reg("RSP")
        self.reg("RIP", self.q(stack))
        self.reg("RSP", stack + 8)


def check_keyboard(data, pe):
    rows = []
    strings = ("", "a", "é🐉", "a" * 5, "a" * 31, "é" * 32,
               "x" * 33, "界" * 119, "界" * 120)
    inputs = ("hello", "aé9", "a\0b\x7fc\x9fd", "\t\r\n",
              "é🐉" * 20, "k7 qf-2éX", " " * 50)
    for field, offset in FIELDS.items():
        for initial in strings:
            for key, payload in [(0, value) for value in inputs] + [
                    (17, ""), (18, ""), (19, ""), (28, "")]:
                native = Keyboard(data, pe, [(0x14021CA40, 0x14021D26D)],
                                  [0x145CEFAB0, 0x145CEF490, 0x145D14A10, 0x14020F670])
                state, stack, event, tick = (native.HEAP + n for n in (0, 0x40008, 0x1000, 0x2000))
                native.mode = None
                for other, field_offset in FIELDS.items():
                    native.string(state + field_offset, initial.encode() if other == field else b"keep")
                native.cpu.mem_write(state + 0x132, bytes([field]))
                native.cpu.mem_write(state + 0x131, bytes([1 if field <= 3 else 2]))
                for displacement, field_offset in ((0x30, 0x90), (0x38, 0xC0),
                                                   (0x40, 0xA8), (0x48, 0xF0), (0x58, 0xD8)):
                    native.put(stack + displacement, state + field_offset)
                native.put(stack + 0x80, tick)
                native.cpu.mem_write(event + 8, struct.pack("<I", key))
                raw = payload.encode()
                if len(raw) < 24:
                    native.cpu.mem_write(event + 0x10, bytes([len(raw)]) + raw)
                else:
                    pointer = native.alloc(len(raw))
                    native.cpu.mem_write(pointer, raw)
                    native.cpu.mem_write(event + 0x10, b"\x18")
                    native.put(event + 0x18, pointer, len(raw))
                for register, value in (("RSP", stack), ("RAX", event), ("R15", state),
                                        ("R12", tick), ("R13", native.HEAP + 0x3000),
                                        ("RDX", 42), ("RSI", field), ("R10", 0x145F14588)):
                    native.reg(register, value)
                native.stop = 0x14021CBD0
                native.run(0x14021CC38, 20000)
                actual = bytes(native.cpu.mem_read(native.q(state + offset + 8),
                                                   native.q(state + offset + 16))).decode()
                expected = initial
                if key == 0:
                    for character in payload:
                        if ord(character) < 32 or 127 <= ord(character) < 160 or len(expected) >= LIMITS[field]:
                            continue
                        if field == 4:
                            if not character.isascii() or not character.isalnum():
                                continue
                            character = character.upper()
                        expected += character
                elif key == 19 and field != 4 and len(expected) < LIMITS[field]:
                    expected += " "
                elif key == 28:
                    expected = expected[:-1]
                assert actual == expected, (field, key, initial, payload, actual, expected)
                focus = bytes(native.cpu.mem_read(state + 0x132, 1))[0]
                assert focus == (CYCLE[field] if key == 18 else field)
                assert native.mode == ((1 if field <= 3 else 2) if key == 17 else None)
                rows.append(dict(field=field, key=key, initial=initial, input=payload,
                                 output=actual, focus=focus, submit_mode=native.mode))
    assert len(rows) == 495
    return rows


def check_admission(data, pe):
    rows = []
    for phase in (*ACTIVE, "host", "off", "unavailable", "refused", "denied", "ended", "closed", "connecting"):
        for role in ("", "host", "guest"):
            for opened in (0, 1):
                for focus in (0, 1):
                    native = Keyboard(data, pe, [(0x14021CA40, 0x14021D26D)])
                    state = native.HEAP
                    native.string(state, phase.encode())
                    native.string(state + 0x30, role.encode())
                    native.cpu.mem_write(state + 0x12C, bytes([opened]))
                    native.cpu.mem_write(state + 0x132, bytes([focus]))
                    native.reg("R15", state)
                    native.blocked = False
                    native.stop = 0x14021CB0C
                    native.run(0x14021CA5D, 200)
                    expected = not opened or not focus or bool(role) and phase in ACTIVE
                    assert native.blocked == expected, (phase, role, opened, focus)
                    rows.append(dict(phase=phase, role=role, open=opened,
                                     focus=focus, blocked=native.blocked))
    assert len(rows) == 144
    return rows


class Status(ui.Native):
    def read(self, address, count):
        if self.pe.image_base <= address < self.pe.image_base + 0x10000000:
            for page in range(address & ~4095, (address + count + 4095) & ~4095, 4096):
                self.map_image_page(page)
        return self.cpu.mem_read(address, count)

    def hook(self, cpu, pc, size, user):
        if any(start <= pc < end for start, end in self.ranges):
            return super().hook(cpu, pc, size, user)
        a, b, count = (self.reg(register) for register in ("RCX", "RDX", "R8"))
        if pc in (0x145D145FB, 0x145D14601):
            self.read(b, count)
            if pc == 0x145D14601:
                self.read(a, count)
        if pc == 0x1458DFEE0:
            self.reg("RAX", a)  # English locale lookup seam preserves literal bytes.
        elif pc == 0x140002200:
            pass
        elif pc == 0x1400021C0:
            self.reg("RAX", self.alloc(a))
        elif pc == 0x145809010:
            pointer, length = struct.unpack_from("<QQ", bytes(self.read(a, 40)), 24)
            self.reg("RAX", pointer)
            self.reg("RDX", length)  # Native zone record's English fallback.
        elif pc == 0x1458E0370:
            template = bytes(self.read(b, count)).decode()
            parameters = self.reg("R9")
            key_pointer, key_length, argument = struct.unpack("<QQQ", self.cpu.mem_read(parameters, 24))
            key = bytes(self.read(key_pointer, key_length)).decode()
            # The zone argument is a borrowed str; why is an owned String.
            if key == "zone":
                value = self.read(self.q(argument), self.q(argument + 8))
            else:
                value = self.read(self.q(argument + 8), self.q(argument + 16))
            self.string(a, template.replace("{" + key + "}", bytes(value).decode()).encode())
        else:
            return super().hook(cpu, pc, size, user)
        stack = self.reg("RSP")
        self.reg("RIP", self.q(stack))
        self.reg("RSP", stack + 8)


def check_zones(data, pe, directory):
    rows = json.loads((directory / "zone-fields.json").read_text())
    assert len(rows) == 12
    for row in rows:
        offset = pe.rva_offset(int(row["row"], 16) - pe.image_base)
        words = struct.unpack_from("<6Q", data, offset)
        for key, pointer, count in (("key", words[1], words[2]), ("name", words[3], words[4])):
            value = pe.rva_offset(pointer - pe.image_base)
            assert data[value:value + count].decode() == row[key]
    assert rows[0]["key"] == "elwynn"
    return {row["key"]: row["name"] for row in rows}


def check_status(data, pe, zones):
    rows = []
    phases = (*PHASE_FORMATS, "online", "off", "hosting", "joined", "left", "nonsense")
    for phase in phases:
        for reason in REASONS:
            native = Status(data, pe, [(0x14020E930, 0x14020F5A9),
                                      (0x1458095E0, 0x145809709), (0x145809710, 0x14580972F)],
                            [0x1458DFEE0, 0x1458E0370, 0x140002200, 0x1400021C0,
                             0x1400021D0, 0x145D145FB, 0x145D14601, 0x145809010])
            state = native.HEAP
            native.string(state, phase.encode())
            native.string(state + 24, reason.encode())
            for register, value in (("RSP", state + 0x40008), ("RCX", state + 0x1000),
                                    ("RDX", state + 0x2000), ("R8", state)):
                native.reg(register, value)
            native.stop = 0x14020F1A0
            native.run(0x14020E930, 10000)
            frame = native.reg("RBP")
            actual = bytes(native.cpu.mem_read(native.q(frame + 0x2E0), native.q(frame + 0x2E8))).decode()
            why = reason
            if reason.startswith("locked:"):
                why = "you haven't unlocked {zone} with this class yet".replace(
                    "{zone}", zones.get(reason[7:], zones["elwynn"]))
            expected = PHASE_FORMATS.get(phase, "").replace("{why}", why)
            assert actual == expected, (phase, reason, actual, expected)
            rows.append(dict(phase=phase, reason=reason, output=actual))
    assert len(rows) == 312
    return rows


class Layout(ui.Native):
    def hook(self, cpu, pc, size, user):
        if pc == 0x1402D2C30:  # Text child builder is outside this geometry capture.
            stack = self.reg("RSP")
            self.reg("RIP", self.q(stack))
            self.reg("RSP", stack + 8)
            return
        return super().hook(cpu, pc, size, user)


def check_layout(data, pe, directory):
    rows = []
    for selected in (0, 1):
        for site in (0x1402EEABC, 0x1402EEF90):
            native = Layout(data, pe, [(0x1402EE800, 0x1402EF1C7)],
                            [0x1402B57B0, 0x1402D2C30, 0x1402BF210, 0x145D145FB])
            start = native.HEAP
            native.put(start, 0, start + 0x1000)
            native.put(start + 0x100, 0, 1, 0, start + 0x1000,
                       start + 0x2000, start + 0x2100, start + 0x2200)
            native.cpu.mem_write(start + 0x1000, b"\1")
            native.cpu.mem_write(start + 0x2100, b"\1")
            native.cpu.mem_write(start + 0x2200, bytes([selected]))
            native.put(start + 0x2000, 1, 0)
            for register, value in (("RCX", start), ("RDX", start + 0x100), ("RSP", start + 0x40008)):
                native.reg(register, value)
            native.capture = (site, "R8", 8)
            native.run(0x1402EE800, 3000)
            rows.append(dict(selected=selected, site=hex(site), node=ui.node_fields(native.result),
                             width=list(struct.unpack_from("<If", native.result, 136))))
    assert rows == json.loads((directory / "field-layout.json").read_text())
    native = Layout(data, pe, [(0x14020D0D0, 0x14020DBC2)], [0x145D145FB])
    start = native.HEAP
    native.put(start, 0)
    native.string(start + 0x1048, b"ABCDE")
    for register, value in (("RCX", start), ("RDX", start + 0x2000), ("R8", start + 0x3000),
                            ("R9", start + 0x1000), ("RSP", start + 0x40008)):
        native.reg(register, value)
    native.capture = (0x14020D359, "R8", 8)
    native.run(0x14020D0D0, 3000)
    header = ui.node_fields(native.result)
    assert header == json.loads((directory / "party-header-layout.json").read_text())
    return dict(fields=rows, party_header=header)


def check_source():
    forms = (ROOT / "crates/azeroth-survivors-re/src/coop_forms.rs").read_text()
    view = (ROOT / "crates/azeroth-survivors-re/src/coop_ui.rs").read_text()
    compact = lambda text: re.sub(r"\s+", "", text)
    for token in ("pub(crate) enum FormRequest", "pub(crate) enum Field", "Self::Description => 120",
                  "Self::Code => 5", "_ => 32", "character.is_control()", "character.is_ascii_alphanumeric()",
                  "character.to_ascii_uppercase()", "value.pop()", "value.chars().count()",
                  '"•".repeat(value.chars().count())', "display.push('|')", "!role.is_empty()",
                  '"hosting" | "joining" | "joined" | "left"'):
        assert compact(token) in compact(forms), token
    for variant in ("Host", "Join", "Leave", "Refresh"):
        assert re.search(r"\b" + variant + r"\b", forms), variant
    for reason in REASONS[:18]:
        assert json.dumps(reason) in forms, reason
    for sentence in set(PHASE_FORMATS.values()):
        assert json.dumps(sentence) in view, sentence
    for token in ("fn take_requests", "fn lists_active", "FormRequest::Refresh", "FormRequest::Leave",
                  "forms::party_active", "Click::Field", "Click::Lobby", "Key::Character", "Key::Tab",
                  "Key::Enter", "Val::Px(200.)", "Val::Px(10.), Val::Px(6.)", "Val::Px(3.)",
                  '"Lobby code"', '"Host the lobby"', '"Leave the party"', "fn status_message"):
        assert compact(token) in compact(view), token
    for text in (forms, view):
        for forbidden in ("TcpStream", "UdpSocket", "tokio::net", "std::net"):
            assert forbidden not in text, forbidden
    return "Meaningful form/input/geometry consumer guards; Rust/ECS execution unverified"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", default="docs/analysis/evidence/0.115.0/coop-forms/manifest.json")
    parser.add_argument("--output-dir", default="runtime/coop-form-fields-0.115.0")
    args = parser.parse_args()
    target = latest_target(verify=True)
    data = target_bytes(target)
    pe = load_script("coop_form_field_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    directory = verify_evidence(project_path(args.manifest), target, data, pe)
    output = project_path(args.output_dir)
    assert output.is_relative_to(ROOT / "runtime"), "Bulk results must remain under runtime/"
    output.mkdir(parents=True, exist_ok=True)
    zones = check_zones(data, pe, directory)
    editing = check_keyboard(data, pe)
    admission = check_admission(data, pe)
    status = check_status(data, pe, zones)
    layout = check_layout(data, pe, directory)
    source = check_source()
    for name, rows in (("keyboard-cases", editing), ("keyboard-admission", admission),
                       ("status-cases", status), ("node-captures", layout)):
        (output / f"{name}.json").write_text(json.dumps(rows, indent=2) + "\n")
    summary = dict(target_sha256=TARGET_SHA, keyboard_editing=len(editing),
                   keyboard_admission=len(admission), phase_and_reason=len(status),
                   node_captures=5, zone_key_name_records=len(zones), source=source,
                   limits="No compilation, Rust tests, ECS/input/rendering, network/game or parity execution")
    (output / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
