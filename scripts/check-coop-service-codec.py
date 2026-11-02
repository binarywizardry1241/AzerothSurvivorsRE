#!/usr/bin/env python3
"""Replay native binary lobby requests without Rust, network or a game.

Only allocation/growth and memcpy are explicit seams. The native encoder and
profile writer execute their original instructions and immutable jump table.
This does not execute the reconstructed Rust or establish runtime/parity proof.
"""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

old = load_script("coop_ui_native", ROOT / "scripts/check-coop-ui.py")
TARGET_SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
RANGES = [
    (0x145B7A740, 0x145B7AF41, "a1601a4fd6f44251fc383931fc003f1a0ff5a30fd6521efd2ada42947d1f6170"),
    (0x145B7A4F0, 0x145B7A734, "ad8c239c8555723b46466d94c5caa0344a88a377473e5a06142c59820e2b5db2"),
    (0x145B7A240, 0x145B7A4E1, "23bf1f86d03e208bec7e335ed2c9fa343abbc29dd8a8c6512f3a1191379346f4"),
]


def block(value):
    return struct.pack("<I", len(value)) + value


class Probe(old.Native):
    def __init__(self, data, pe):
        super().__init__(data, pe, [(a, b) for a, b, _ in RANGES],
                         [0x145EB6EC0, 0x145E9E020, 0x145D145FB])

    def hook(self, cpu, pc, size, context):
        if pc == self.stop or any(a <= pc and pc + size <= b for a, b in self.ranges):
            return super().hook(cpu, pc, size, context)
        if pc in (0x145EB6EC0, 0x145E9E020):
            address = self.reg("RCX")
            length = self.q(address + 16)
            needed = length + 1 if pc == 0x145EB6EC0 else self.reg("RDX") + self.reg("R8")
            capacity = max(self.q(address) * 2, needed, 8)
            pointer = self.alloc(capacity)
            if length:
                self.cpu.mem_write(pointer, bytes(self.cpu.mem_read(self.q(address + 8), length)))
            self.put(address, capacity, pointer, length)
            stack = self.reg("RSP")
            self.reg("RIP", self.q(stack))
            self.reg("RSP", stack + 8)
        else:
            return super().hook(cpu, pc, size, context)

    def reset(self, variant):
        self.cursor = self.HEAP + 0x60000
        self.cpu.mem_write(self.HEAP, bytes(0x50000))
        request = self.HEAP + 0x1000
        self.put(request, 0x8000000000000000 + variant)
        stack = self.HEAP + 0x40000
        self.stop = self.HEAP + 0x4F000
        self.put(stack, self.stop)
        self.reg("RSP", stack)
        self.reg("RCX", self.HEAP)
        self.reg("RDX", request)
        return request

    def profile(self, address, hero, class_id, zone, opened, classes, maximum):
        self.string(address, hero)
        self.string(address + 24, zone)
        self.string(address + 48, classes)
        self.cpu.mem_write(address + 72, bytes([opened, class_id, maximum]))

    def encode(self):
        self.run(0x145B7A740)
        return bytes(self.cpu.mem_read(self.q(self.HEAP + 8), self.q(self.HEAP + 16)))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", help="Optional project-local JSON fixture output")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == TARGET_SHA
    data = target_bytes(target)
    pe = load_script("pe", ROOT / "scripts/inventory-executable.py").PE(data)
    for first, last, digest in RANGES:
        offset = pe.rva_offset(first - pe.image_base)
        assert hashlib.sha256(data[offset:offset + last - first]).hexdigest() == digest
    manifest_path = ROOT / "docs/analysis/evidence/0.115.0/coop-forms/requests.json"
    manifest = json.loads(manifest_path.read_text())
    assert manifest["target"]["sha256"] == TARGET_SHA
    for row in manifest["functions"]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert hashlib.sha256(data[offset:offset + end-start]).hexdigest() == row["sha256"]
    for name, expected in manifest["extracts"].items():
        assert hashlib.sha256((manifest_path.parent / name).read_bytes()).hexdigest() == expected
    for row in manifest["data_ranges"]:
        offset = pe.rva_offset(int(row["start"],16) - pe.image_base)
        value = data[offset:offset + row["byte_count"]]
        assert hashlib.sha256(value).hexdigest() == row["sha256"]
    probe, cases = Probe(data, pe), []

    def check(kind, expected):
        actual = probe.encode()
        assert actual == expected, (kind, actual.hex(), expected.hex())
        cases.append({"kind": kind, "frame_hex": actual.hex()})

    for version, staff in itertools.product([b"", b"0.115.0", "é".encode()], [b"", b"none"]):
        request = probe.reset(0)
        probe.string(request + 8, version)
        probe.string(request + 32, staff)
        probe.cpu.mem_write(request + 56, struct.pack("<I", 3) + b"\1")
        check("handshake", b"\1" + struct.pack("<I", 3) + block(version) + block(staff) + b"\1")

    for hero, opened, maximum in itertools.product([b"", b"H", "英雄é".encode()], [0, 1], [0, 1, 5, 255]):
        classes, zone, class_id = bytes([0, 7, 255]), b"elwynn", 255
        payload = block(hero) + bytes([class_id]) + block(zone) + bytes([opened]) + block(classes) + bytes([maximum])
        request = probe.reset(3)
        probe.profile(request + 8, hero, class_id, zone, opened, classes, maximum)
        check("profile", b"\4" + payload)
        for public in (0, 1):
            request = probe.reset(2)
            probe.string(request, b"name")
            probe.string(request + 24, "description🌍".encode())
            probe.string(request + 48, b"password")
            probe.profile(request + 72, hero, class_id, zone, opened, classes, maximum)
            probe.cpu.mem_write(request + 152, bytes([public]))
            check("host", b"\3" + block(b"name") + bytes([public]) + block("description🌍".encode()) + block(b"password") + payload)

    for code, password in itertools.product([b"", b"A123", b"A" * 1024], [b"", "🔒é".encode()]):
        request = probe.reset(4)
        probe.string(request + 8, code)
        probe.string(request + 32, password)
        check("join", b"\5" + block(code) + block(password))

    for peer, payload in itertools.product([0, 0x78563412, 0xFFFFFFFF], [b"", b"\0\xff", bytes(range(256))]):
        request = probe.reset(5)
        probe.string(request + 8, payload)
        probe.cpu.mem_write(request + 32, struct.pack("<I", peer))
        check("relay", b"\6" + struct.pack("<I", peer) + block(payload))
        request = probe.reset(6)
        probe.cpu.mem_write(request + 8, struct.pack("<I", peer))
        check("close-peer", b"\7" + struct.pack("<I", peer))

    for variant, wire, kind in [(1, 2, "refresh"), (7, 8, "leave"), (8, 9, "heartbeat")]:
        probe.reset(variant)
        check(kind, bytes([wire]))
    for guid, name in itertools.product([0, 0x0807060504030201, 0xFFFFFFFFFFFFFFFF], [b"", b"A", "英雄é".encode()]):
        request = probe.reset(9)
        probe.string(request + 8, name)
        probe.put(request + 32, guid)
        check("profile-request", b"\x0a" + struct.pack("<Q", guid) + block(name))
    for word, integer, payload in itertools.product([0, 0xFFFFFFFFFFFFFFFF], [0, 0xFFFFFFFF], [b"", b"\xff\0"]):
        request = probe.reset(10)
        auth = request + 8
        probe.string(auth, b"A")
        probe.string(auth + 24, "é".encode())
        probe.string(auth + 48, payload)
        probe.put(auth + 72, word, 0xFEDCBA9876543210)
        probe.cpu.mem_write(auth + 88, struct.pack("<I", integer))
        check("secondary-auth", b"\x0b" + block(b"A") + struct.pack("<QI", word, integer) + block("é".encode()) + struct.pack("<Q", 0xFEDCBA9876543210) + block(payload))
    if args.output:
        output = (ROOT / args.output).resolve()
        assert output.is_relative_to(ROOT)
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps({"target_sha256": TARGET_SHA, "cases": cases}, indent=2) + "\n")
    print(f"PASS {len(cases)} native service encoder cases; reconstructed Rust and runtime/parity unverified")


if __name__ == "__main__":
    main()
