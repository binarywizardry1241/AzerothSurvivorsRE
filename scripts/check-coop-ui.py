#!/usr/bin/env python3
"""Replay bounded 0.115.0 lobby UI contracts without Rust, a game or services.

String cloning, byte comparison, vector allocation, freeing and parent builders
are explicit seams. These checks do not execute the ECS message acquisition,
network discovery, host/join paths or a renderer, and do not establish parity.
"""

if __name__ == '__main__':
    from script_sources import run_contract
    run_contract(__file__)

import argparse
import hashlib
import itertools
import json
from pathlib import Path
import re
import struct
import sys
import time

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_READ_UNMAPPED
from unicorn import x86_const as registers

MASK = (1 << 64) - 1
TARGET_SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
LABELS = (
    "Unlocked zones", "No password", "Zone: {zone}", "Zone: any",
    "{shown} of {all} shown", "No lobby matches the filters.",
)
EVENTS = {
    3: 0x14021A869, 10: 0x14021AB6E, 11: 0x14021A710,
    12: 0x14021A754, 13: 0x14021A8D9,
}


def digest(value):
    return hashlib.sha256(value).hexdigest()


def project_path(value):
    path = (ROOT / value).resolve()
    assert path.is_relative_to(ROOT), f"Path escapes project: {value}"
    return path


def verify_manifest(directory, target, data, pe):
    manifest = json.loads((directory / "manifest.json").read_text())
    assert target["version"] == "0.115.0" and target["sha256"] == TARGET_SHA
    assert manifest["target"]["sha256"] == target["sha256"]
    functions = {}
    for row in manifest["functions"]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        offset = int(row["file_offset"], 16)
        assert offset == pe.rva_offset(start - pe.image_base)
        assert start < end and digest(data[offset:offset + end - start]) == row["sha256"]
        for section in row.get("slices", []):
            first, last = int(section["start"], 16), int(section["end_exclusive"], 16)
            assert start <= first < last <= end
            part = offset + first - start
            assert digest(data[part:part + last - first]) == section["sha256"]
        functions[start] = end
    for start, needed_end in {
        0x14021A1C0: 0x14021B12B, 0x1402F0F50: 0x1402F1783,
        0x14020FA60: 0x14020FEB9, 0x14020E190: 0x14020E495,
    }.items():
        assert functions.get(start, 0) >= needed_end, f"Missing native owner {start:#x}"
    for name, expected in manifest["extracts"].items():
        path = (directory / name).resolve()
        assert path.is_relative_to(directory.resolve()), name
        assert digest(path.read_bytes()) == expected, name
    alias = json.loads((directory / "startup-alias.json").read_text())
    for row in alias["functions"]:
        assert digest((directory / row["assembly"]).read_bytes()) == row["assembly_sha256"]
    for row in manifest.get("data_ranges", []):
        start, offset = int(row["start"], 16), int(row["file_offset"], 16)
        assert offset == pe.rva_offset(start - pe.image_base)
        value = data[offset:offset + row["byte_count"]]
        assert digest(value) == row["sha256"], row["start"]
        if "bytes_hex" in row:
            assert value == bytes.fromhex(row["bytes_hex"]), row["start"]
    return manifest, functions


class Native:
    """Small code mappings; immutable PE data pages are loaded only on reads."""
    HEAP = 0x200000000

    def __init__(self, data, pe, ranges, stubs=()):
        self.data, self.pe, self.ranges = data, pe, ranges
        self.cpu = Uc(UC_ARCH_X86, UC_MODE_64)
        self.pages = set()
        self.data_pages = set()
        for start, end in ranges:
            for page in range(start & ~4095, (end + 4095) & ~4095, 4096):
                self.map_image_page(page)
        for address in stubs:
            page = address & ~4095
            if page not in self.pages:
                self.cpu.mem_map(page, 4096)
                self.pages.add(page)
        self.cpu.mem_map(self.HEAP, 0x200000)
        self.cursor = self.HEAP + 0x60000
        self.stop = None
        self.capture = None
        self.result = None
        self.calls = {}
        self.cpu.hook_add(UC_HOOK_CODE, self.hook)
        self.cpu.hook_add(UC_HOOK_MEM_READ_UNMAPPED, self.read_page)

    def map_image_page(self, page):
        if page in self.pages:
            return
        offset = self.pe.rva_offset(page - self.pe.image_base)
        self.cpu.mem_map(page, 4096)
        self.cpu.mem_write(page, self.data[offset:offset + 4096])
        self.pages.add(page)

    def read_page(self, _cpu, _access, address, _size, _value, _unused):
        page = address & ~4095
        self.map_image_page(page)
        self.data_pages.add(page)
        return True

    def reg(self, name, value=None):
        register = getattr(registers, "UC_X86_REG_" + name)
        if value is not None:
            self.cpu.reg_write(register, value & MASK)
        return self.cpu.reg_read(register)

    def put(self, address, *values):
        self.cpu.mem_write(address, struct.pack("<" + "Q" * len(values), *(v & MASK for v in values)))

    def q(self, address):
        return struct.unpack("<Q", self.cpu.mem_read(address, 8))[0]

    def alloc(self, size):
        address = self.cursor
        self.cursor += (max(size, 1) + 15) & ~15
        assert self.cursor < self.HEAP + 0x200000
        return address

    def string(self, out, value):
        pointer = self.alloc(len(value))
        self.cpu.mem_write(pointer, value or b"\0")
        self.put(out, len(value), pointer, len(value))

    def hook(self, _cpu, pc, size, _unused):
        if pc == self.stop:
            self.cpu.emu_stop()
            return
        if self.capture is not None and pc == self.capture[0]:
            _, register, displacement = self.capture
            self.result = bytes(self.cpu.mem_read(self.reg(register) + displacement, 384))
            self.cpu.emu_stop()
            return
        if any(start <= pc and pc + size <= end for start, end in self.ranges):
            return
        self.calls[hex(pc)] = self.calls.get(hex(pc), 0) + 1
        a, b, n = (self.reg(name) for name in ("RCX", "RDX", "R8"))
        if pc == 0x145D14601:  # Explicit raw-byte memcmp result seam.
            self.reg("RAX", int(bytes(self.cpu.mem_read(a, n)) != bytes(self.cpu.mem_read(b, n))))
        elif pc == 0x145CE7810:  # Clone a String, preserving its exact bytes.
            self.string(a, bytes(self.cpu.mem_read(self.q(b + 8), self.q(b + 16))))
        elif pc == 0x145D47C30:  # Vec<String> reserve; allocation policy is not asserted.
            length, capacity = self.q(a + 16), max(4, self.q(a) * 2)
            pointer = self.alloc(capacity * 24)
            if length:
                self.cpu.mem_write(pointer, bytes(self.cpu.mem_read(self.q(a + 8), length * 24)))
            self.put(a, capacity, pointer, length)
        elif pc == 0x1400021D0:  # Free seam: retain mapped fixture memory.
            pass
        elif pc == 0x145D145FB:  # Exact memcpy seam for Node construction.
            self.cpu.mem_write(a, bytes(self.cpu.mem_read(b, n)))
        elif pc == 0x1402B57B0:  # Parent builder seam, preceding the captured Node.
            self.cpu.mem_write(a, bytes(48))
        elif pc == 0x1402F09E0:  # Excluded refresh/request seam; its effects are not asserted.
            pass
        else:
            raise AssertionError(f"Unreviewed native call {pc:#x}")
        stack = self.reg("RSP")
        self.reg("RIP", self.q(stack))
        self.reg("RSP", stack + 8)

    def run(self, start, count=1000000):
        self.cpu.emu_start(start, 0, count=count)
        assert self.reg("RIP") == (self.capture[0] if self.capture else self.stop), hex(self.reg("RIP"))


def check_inputs(data, pe, functions):
    probe = Native(data, pe, [(0x14021A1C0, functions[0x14021A1C0])],
                   [0x145D14601, 0x145CE7810, 0x145D47C30, 0x1400021D0])
    table = 0x145F1452C
    offset = pe.rva_offset(table - pe.image_base)
    targets = [table + value for value in struct.unpack("<14i", data[offset:offset + 56])]
    for event, destination in EVENTS.items():
        assert targets[event] == destination
    state, rows = probe.HEAP, probe.HEAP + 0x1000
    frame, stack, tick, event = (probe.HEAP + n for n in (0x30000, 0x40000, 0x41000, 0x42000))

    def initialize():
        probe.cursor, probe.calls = probe.HEAP + 0x60000, {}
        probe.cpu.mem_write(state, bytes(0x138))
        probe.cpu.mem_write(frame - 0x100, bytes(0x500))
        probe.put(state + 0x120, 9)
        for field, value in [(0x148, state + 0x110), (0x200, 0), (0x228, state),
                             (0x260, tick), (0x278, 0x12345678)]:
            probe.put(frame + field, value)
        for name, value in [("R15", state), ("RBP", frame), ("RSP", stack), ("RDI", tick), ("R9", event)]:
            probe.reg(name, value)
        probe.stop = 0x14021A2F0

    cases = []
    for values in [[], [b"elwynn"], [b"duskwood", b"elwynn", b"duskwood"],
                   [b"", b"ELWYNN", b"elwynn", b"\xc3\xa9", b"", b"unknown"],
                   [b"k" + str(i % 17).encode() for i in range(512)]]:
        unique = list(dict.fromkeys(values))
        for current, unlocked, password in itertools.product([None, *unique, b"stale"], [0, 1], [0, 1]):
            initialize()
            probe.put(state + 0x68, rows, len(values))
            probe.cpu.mem_write(state + 0x12E, bytes([unlocked, password, 1]))
            for i, value in enumerate(values):
                probe.string(rows + i * 0xF0 + 0x90, value)
            if current is None:
                probe.put(state + 0x108, -1)
            else:
                probe.string(state + 0x108, current)
            probe.run(EVENTS[13])
            actual = None if probe.q(state + 0x108) == MASK else bytes(
                probe.cpu.mem_read(probe.q(state + 0x110), probe.q(state + 0x118)))
            if current is None:
                expected = next(iter(unique), None)
            else:
                index = unique.index(current) + 1 if current in unique else len(unique)
                expected = unique[index] if index < len(unique) else None
            assert actual == expected, (current, actual, expected)
            assert bytes(probe.cpu.mem_read(state + 0x12E, 3)) == bytes([unlocked, password, 1])
            assert probe.q(state + 0x120) == 10
            cases.append(dict(kind="zone-cycle", rows=len(values), distinct=len(unique),
                              current=None if current is None else current.hex(),
                              result=None if actual is None else actual.hex(),
                              unlocked=unlocked, no_password=password))
    for tag, field in [(3, 0x130), (11, 0x12E), (12, 0x12F)]:
        for value in range(256):
            initialize()
            probe.cpu.mem_write(state + field, bytes([value]))
            probe.run(EVENTS[tag], 30)
            assert bytes(probe.cpu.mem_read(state + field, 1)) == bytes([value ^ 1])
            assert probe.q(state + 0x120) == 10
            cases.append(dict(kind="toggle", tag=tag, input=value, result=value ^ 1))
    for capacity in range(256):
        initialize()
        probe.cpu.mem_write(event + 1, bytes([capacity]))
        probe.run(EVENTS[10], 30)
        assert bytes(probe.cpu.mem_read(state + 0x133, 1)) == bytes([capacity])
        assert probe.q(state + 0x120) == 10
        cases.append(dict(kind="capacity-input", value=capacity))
    assert len(cases) == 1164
    return cases


def check_filter_counts(data, pe, functions):
    probe = Native(data, pe, [(0x1402F0F50, functions[0x1402F0F50])], [0x145D14601])
    state, rows, zone, stack, frame = (probe.HEAP + n for n in (0, 0x1000, 0x90000, 0xA0000, 0xC0000))
    keys = [b"elwynn", b"duskwood", b"", b"ELWYNN", b"elwynn\0suffix", b"\xc3\xa9"]
    pointers = [zone + i * 64 for i in range(len(keys))]
    for pointer, key in zip(pointers, keys):
        probe.cpu.mem_write(pointer, key or b"\0")
    cases = []
    for count in [0, 1, 2, 3, 4, 5, 7, 8, 9, 16, 32, 1000]:
        values = [(i % 2, (i // 2) % 2, i % len(keys)) for i in range(count)]
        for i, (unlocked, password, key) in enumerate(values):
            probe.put(rows + i * 0xF0 + 0x98, pointers[key], len(keys[key]))
            probe.cpu.mem_write(rows + i * 0xF0 + 0xE8, bytes([unlocked, password]))
        probe.put(state + 0x68, rows, count)
        for unlocked, password, key in itertools.product([False, True], [False, True], [None, *range(len(keys))]):
            if key is not None:
                probe.put(state + 0x110, pointers[key], len(keys[key]))
            for name, value in [("R14", state), ("RDI", -1 if key is None else len(keys[key])),
                                ("R13", int(unlocked)), ("R15", int(password)), ("RSP", stack), ("RBP", frame)]:
                probe.reg(name, value)
            # The no-filter fast path skips the count loop to 13bd.
            probe.stop = 0x1402F13BD if not unlocked and not password and key is None else 0x1402F1205
            probe.run(0x1402F1154, max(200, 100 * count))
            actual = count if probe.stop == 0x1402F13BD else probe.reg("R13")
            expected = sum((not unlocked or a == 1) and (not password or b == 0)
                           and (key is None or keys[z] == keys[key]) for a, b, z in values)
            assert actual == expected, (count, unlocked, password, key, actual, expected)
            cases.append(dict(rows=count, unlocked=unlocked, no_password=password, zone=key, shown=actual))
    assert len(cases) == 336
    return cases


def check_startup(data, pe, functions):
    """Capture the registered layout and empty resource, before ECS insertion."""
    assert functions.get(0x14020B490, 0) >= 0x14020B8DD
    probe = Native(data, pe, [(0x14020B490, functions[0x14020B490])])
    frame, cursor = probe.HEAP + 0x30000, probe.HEAP + 0x41000
    probe.put(cursor, 7)
    probe.reg("RBP", frame)
    probe.reg("R15", cursor)
    probe.stop = 0x14020B75A
    probe.run(0x14020B6EF, 100)
    descriptor = frame + 0x2B0
    type_id_offset = pe.rva_offset(0x145F0FBA8 - pe.image_base)
    type_id = data[type_id_offset:type_id_offset + 16]
    input_type_id = pe.rva_offset(0x145F01550 - pe.image_base)
    assert data[input_type_id:input_type_id + 16] == type_id
    assert bytes(probe.cpu.mem_read(descriptor + 8, 16)) == type_id
    vtable = pe.rva_offset(0x145F12FD8 - pe.image_base)
    assert struct.unpack_from("<Q", data, vtable)[0] == 0x140226040
    assert struct.unpack_from("<Q", data, vtable + 56)[0] == 0x140225C80
    assert probe.q(descriptor + 0x28) == 8
    assert probe.q(descriptor + 0x30) == 0x138
    assert probe.q(descriptor + 0x48) == 0x14008BDE0
    cases = [dict(kind="resource-layout", size=0x138, alignment=8, drop="0x14008bde0")]
    state = frame + 0x2B0
    for fill in range(256):
        probe.cpu.mem_write(state, bytes([fill]) * 0x138)
        probe.reg("RBP", frame)
        probe.stop = 0x14020B8DD
        probe.run(0x14020B7DC, 100)
        assert [probe.q(state + n) for n in (0, 8, 0x10)] == [0, 1, 0]
        assert [probe.q(state + n) for n in (0x60, 0x68, 0x70)] == [0, 8, 0]
        assert probe.q(state + 0x108) == MASK
        assert bytes(probe.cpu.mem_read(state + 0x12C, 9)) == bytes(9)
        cases.append(dict(kind="startup", prefill=fill, unlocked_only=False,
                          no_password=False, private=False, capacity_raw=0, zone=None))
    return cases


def check_host_capacity(data, pe, functions):
    assert functions.get(0x1402F2B80, 0) >= 0x1402F2F3D
    probe = Native(data, pe, [(0x1402F2B80, functions[0x1402F2B80])])
    state, frame = probe.HEAP, probe.HEAP + 0x30000
    cases = []
    for raw in range(256):
        probe.cpu.mem_write(state + 0x133, bytes([raw]))
        for name, value in [("RBX", state), ("RBP", frame), ("RCX", 0x5A5A5A00)]:
            probe.reg(name, value)
        probe.stop = 0x1402F2F3D
        probe.run(0x1402F2EFF, 30)
        selected = probe.cpu.mem_read(frame + 0x2CC, 1)[0]
        assert selected == (5 if raw == 0 else min(raw, 5))
        cases.append(dict(raw=raw, displayed=selected))
    return cases


def check_open_admission(data, pe, functions):
    """Admitted picker Action 10 sets open and retains every other state byte."""
    for start, end in {0x1401003F0: 0x1401007E5, 0x14010BC00: 0x14010CC91,
                       0x14011AFB0: 0x14011B546, 0x14011B850: 0x14011C081}.items():
        assert functions.get(start, 0) >= end, f"Missing OPEN binding owner {start:#x}"
    offset = pe.rva_offset(0x145EF2648 - pe.image_base)
    assert struct.unpack_from("<Q", data, offset)[0] == 0x14011B850
    assert struct.unpack_from("<Q", data, offset + 56)[0] == 0x14011AFB0
    table = 0x145EF3538
    offset = pe.rva_offset(table + 10 * 4 - pe.image_base)
    assert table + struct.unpack_from("<i", data, offset)[0] == 0x14010C8F5
    probe = Native(data, pe, [(0x14010BC00, functions[0x14010BC00])])
    state, frame, tick, action = (probe.HEAP + n for n in (0, 0x30000, 0x41000, 0x42000))
    probe.cpu.mem_write(action, b"\x0a")
    probe.put(frame - 0x28, state, tick)
    cases = []
    for fill in range(256):
        before = bytes([fill]) * 0x138
        probe.cpu.mem_write(state, before)
        current_tick = (0x12345600 + fill) & 0xFFFFFFFF
        probe.cpu.mem_write(frame + 0x170, struct.pack("<I", current_tick))
        probe.cpu.mem_write(tick, bytes(4))
        probe.reg("RBP", frame)
        probe.reg("RAX", action)
        probe.stop = 0x14010BE70
        probe.run(0x14010C254, 30)
        expected = bytearray(before)
        expected[0x12C] = 1
        assert bytes(probe.cpu.mem_read(state, 0x138)) == expected
        assert bytes(probe.cpu.mem_read(tick, 4)) == struct.pack("<I", current_tick)
        assert not probe.calls
        cases.append(dict(prefill=fill, state_bytes_retained=0x137,
                          changed_offset="0x12c", open=1, change_tick=current_tick))
    return cases


def node_fields(node):
    def value(offset):
        return list(struct.unpack_from("<If", node, offset))
    return dict(min_width=value(152), row_gap=value(320), column_gap=value(328),
                padding=[value(216 + i * 8) for i in range(4)],
                border=[value(248 + i * 8) for i in range(4)],
                radius=[value(280 + i * 8) for i in range(4)],
                flex_direction=node[374], align_items=node[378])


def check_nodes(data, pe, functions):
    probe = Native(data, pe, [(0x14020FA60, functions[0x14020FA60])],
                   [0x145D145FB, 0x1402B57B0, 0x1402F09E0])
    start = probe.HEAP + 0x1000
    probe.put(start + 0x1000 + 0x70, 1)
    probe.cpu.mem_write(start + 0x1000 + 0x12D, b"\1")
    for name, value in [("RSP", probe.HEAP + 0x40008), ("RCX", start), ("RDX", start + 0x2000),
                        ("R8", start + 0x3000), ("R9", start + 0x1000)]:
        probe.reg(name, value)
    probe.capture = (0x14020FEB4, "R8", 8)
    probe.run(0x14020FA60, 2000)
    nodes = {"filter-row": node_fields(probe.result)}
    assert nodes["filter-row"]["column_gap"] == [1, 8.]
    assert nodes["filter-row"]["row_gap"] == [1, 6.]
    probe = Native(data, pe, [(0x14020E190, functions[0x14020E190])])
    for selected in [0, 1]:
        stack = probe.HEAP + 0x40008
        probe.put(stack + 48, selected)
        probe.reg("RSP", stack)
        probe.capture = (0x14020E490, "RBP", 0x1E0)
        probe.run(0x14020E190, 1000)
        node = node_fields(probe.result)
        assert node["min_width"] == [1, 36.]
        assert node["padding"] == [[1, 10.], [1, 10.], [1, 5.], [1, 5.]]
        assert node["radius"] == [[1, 4.]] * 4
        assert node["border"] == [[1, 2. if selected else 1.]] * 4
        nodes[f"filter-button-{selected}"] = node
    return nodes


def check_locales(manifest, data):
    evidence = manifest["locales"]
    assert set(evidence["keys"]) == set(LABELS)
    rows = evidence["locales"]
    assert len(rows) == 14 and len({row["code"] for row in rows}) == 14
    native = {}
    for row in rows:
        offset, size = int(row["file_offset"], 16), row["byte_count"]
        payload = data[offset:offset + size]
        assert digest(payload) == row["sha256"], row["code"]
        native[row["code"]] = json.loads(payload)
    for code, catalog in native.items():
        source = json.loads((ROOT / f"crates/azeroth-survivors-re/assets/locales/{code}.json").read_text())
        for key in LABELS:
            assert source[key] == catalog.get(key, native["en"][key]), (code, key)
    return dict(locales=14, labels=len(LABELS))


def check_source():
    source = (ROOT / "crates/azeroth-survivors-re/src/coop_ui.rs").read_text()
    compact = re.sub(r"\s+", "", source)
    for token in ["pub zone_key: String", "pub unlocked: bool", "pub has_password: bool",
                  "unlocked_only: false", "no_password: false", "private: false",
                  "fn shows(&self, row: &LobbyRow)", "!self.unlocked_only || row.unlocked",
                  "!self.no_password || !row.has_password", "key == &row.zone_key",
                  "fn cycle_zone(&mut self)", "keys.contains(&row.zone_key.as_str())",
                  "keys.first()", "keys.get(index + 1)", "view.cycle_zone()",
                  "view.private = !view.private", "Click::Unlocked", "Click::NoPassword",
                  '"coop-lobbies", 12.', "shown < lobbies.len()"]:
        assert re.sub(r"\s+", "", token) in compact, token
    row_loops = ["for lobby in lobbies.iter().filter(|row| view.shows(row))",
                 "for (index, lobby) in lobbies.iter().enumerate().filter(|(_, row)| view.shows(row))"]
    assert any(re.sub(r"\s+", "", loop) in compact for loop in row_loops), "filtered lobby row loop"
    for label in LABELS:
        assert json.dumps(label) in source, label
    for forbidden in [".take(8)", "TcpStream", "UdpSocket", "std::net", "reqwest", "tokio::net", "LocalServerRequest"]:
        assert forbidden not in source, forbidden
    main = (ROOT / "crates/azeroth-survivors-re/src/main.rs").read_text()
    picker = (ROOT / "crates/azeroth-survivors-re/src/picker.rs").read_text()
    menu = (ROOT / "crates/azeroth-survivors-re/src/menu.rs").read_text()
    assert ".add_plugins(coop_ui::CoopUiPlugin)" in main
    assert "coop_ui::picker_button(actions, art)" in picker
    assert "if matches!(state.dialog, Some(Dialog::Coop))" in menu and "keyboard.clear();" in menu
    return "textual consumer/input/metadata guards; Rust/ECS execution unverified"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--evidence-dir", default="docs/analysis/evidence/0.115.0/coop-ui")
    args = parser.parse_args()
    directory = project_path(args.evidence_dir)
    target = latest_target(verify=True)
    data = target_bytes(target)
    pe = load_script("coop_115_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    manifest, functions = verify_manifest(directory, target, data, pe)
    inputs = check_inputs(data, pe, functions)
    counts = check_filter_counts(data, pe, functions)
    startup = check_startup(data, pe, functions)
    capacity = check_host_capacity(data, pe, functions)
    opened = check_open_admission(data, pe, functions)
    nodes = check_nodes(data, pe, functions)
    locales = check_locales(manifest, data)
    source = check_source()
    output = ROOT / "runtime/coop-ui-0.115.0/checks" / f"run-{time.time_ns()}"
    output.mkdir(parents=True, exist_ok=False)
    result = dict(target_sha256=target["sha256"], manifest_sha256=digest((directory / "manifest.json").read_bytes()),
                  input_cases=inputs, count_cases=counts, startup_cases=startup,
                  capacity_cases=capacity, open_cases=opened, nodes=nodes, locales=locales, source=source,
                  application_executed=False, compilation_run=False,
                  limits="Native branch/initializer slices with explicit seams; ECS insertion/lifecycle and runtime/parity unverified")
    (output / "results.json").write_text(json.dumps(result, indent=2) + "\n")
    print(f"#63: {len(inputs)} input cases, {len(counts)} count cases, {len(nodes)} Node captures, "
          f"{len(startup)} startup/layout cases, {len(capacity)} host-capacity cases, "
          f"{len(opened)} OPEN-retention cases, "
          f"14 locale subsets and source guards pass; compilation/runtime/parity unverified")
    print(f"Evidence: {output.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
