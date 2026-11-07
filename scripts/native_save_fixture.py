"""Reusable bounded instruction fixture for the hash-bound 0.109.0 typed Save.

Imports do not run the emulator. CPU.parse/serialize execute original code with
explicit allocation, bytes, metadata and absent appearance-cache seams. Native
helpers are fenced by the curated manifest; unexpected control flow is rejected.
"""
from script_sources import load_script

from bisect import bisect_right
from functools import lru_cache
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path[:0] = [
    str(ROOT / "scripts"),
    str(ROOT / "runtime/tool-state/python/armory/python-libs"),
]
from coverage_common import latest_target, target_bytes
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import (
    UC_X86_REG_RAX,
    UC_X86_REG_RCX,
    UC_X86_REG_RDX,
    UC_X86_REG_R8,
    UC_X86_REG_R9,
    UC_X86_REG_RIP,
    UC_X86_REG_RSP,
)

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
MANIFEST = ROOT / "docs/analysis/evidence/0.109.0/save-schema/manifest.json"
RUST_WHITESPACE = (
    "\t\n\v\f\r \x85\xa0\u1680"
    + "".join(map(chr, range(0x2000, 0x200B)))
    + "\u2028\u2029\u202f\u205f\u3000"
)


@lru_cache(maxsize=1)
def selected_image():
    target = latest_target(verify=True)
    data = target_bytes(target)
    assert target["sha256"] == SHA and hashlib.sha256(data).hexdigest() == SHA
    module = load_script("save_pe", ROOT / "scripts/inventory-executable.py")
    return data, module.PE(data)


class CPU:
    H, S, D = 0x200000000, 0x300000000, 0x400000000

    def __init__(self, owners=None):
        self.data, self.pe = selected_image()
        self.ends = {
            self.pe.image_base + a: self.pe.image_base + b
            for a, b, _ in self.pe.functions()
        }
        self.u = Uc(UC_ARCH_X86, UC_MODE_64)
        size = max(
            s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in self.pe.sections
        )
        self.u.mem_map(self.pe.image_base, (size + 4095) & ~4095)
        for section in self.pe.sections:
            self.u.mem_write(
                self.pe.image_base + section["rva"],
                self.data[
                    section["raw_offset"] : section["raw_offset"] + section["raw_size"]
                ],
            )
        self.u.mem_map(self.H, 0x1000000)
        self.u.mem_map(self.S, 0x200000)
        self.u.mem_map(self.D, 4096)
        self.heap = self.H + 0x10000
        self.admit = set()
        self.stops = set()
        self.extensions = []
        self.executed = set()
        owners = (
            owners
            if owners is not None
            else json.loads(MANIFEST.read_text())["native_helpers"]
        )
        for owner in owners:
            a, b = int(owner["start"], 16), int(owner["end"], 16)
            if owner.get("range_kind") == "leaf":
                self.ends[a] = b
            assert (
                self.ends[a] == b
                and hashlib.sha256(self.raw(a, b)).hexdigest() == owner["sha256"]
            )
            self.admit.add(a)
        self.range_starts = sorted(self.admit)
        ordinary = json.loads(
            (ROOT / "crates/azeroth-survivors-re/assets/armory.json").read_text()
        )
        pvp = json.loads(
            (
                ROOT / "crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json"
            ).read_text()
        )
        self.metadata = {
            piece["id"]: (hero["id"], piece["slot_id"], piece["inventory_type"])
            for hero in ordinary["classes"]
            for piece in hero["items"]
        }
        for hero in pvp["classes"]:
            for piece in hero["items"]:
                for extra in (0, 10):
                    self.metadata[piece["id"] + extra] = (
                        hero["id"],
                        piece["slot_id"],
                        piece["inventory_type"],
                    )
        self.starters = {
            (row["race"], row["class"]): row["slots"] for row in ordinary["starters"]
        }
        self.granted = set()
        self.appearance_counts = None
        self.u.hook_add(UC_HOOK_CODE, self._hook)

    def raw(self, a, b):
        offset = self.pe.rva_offset(a - self.pe.image_base)
        return self.data[offset : offset + b - a]

    def allow_owner(self, address):
        """Admit an explicitly reviewed owner, e.g. a caller's backup branch."""
        assert address in self.ends
        self.admit.add(address)
        self.range_starts = sorted(self.admit)

    def allow_range(self, start, end):
        """Admit an explicitly reviewed leaf/block without PE unwind metadata."""
        assert start < end
        self.ends[start] = end
        self.admit.add(start)
        self.range_starts = sorted(self.admit)

    def admitted(self, address):
        index = bisect_right(self.range_starts, address) - 1
        return index >= 0 and address < self.ends[self.range_starts[index]]

    def reg(self, r):
        return self.u.reg_read(r)

    def q(self, a):
        return struct.unpack("<Q", self.u.mem_read(a, 8))[0]

    def ui(self, a):
        return struct.unpack("<I", self.u.mem_read(a, 4))[0]

    def put(self, a, *values):
        self.u.mem_write(a, struct.pack("<" + "Q" * len(values), *values))

    def alloc(self, size):
        result = self.heap
        self.heap += (size + 15) & ~15
        assert self.heap < self.H + 0x1000000
        return result

    def _return(self):
        sp = self.reg(UC_X86_REG_RSP)
        self.u.reg_write(UC_X86_REG_RIP, self.q(sp))
        self.u.reg_write(UC_X86_REG_RSP, sp + 8)

    def _hook(self, _, a, n, user):
        if a == self.D or a in self.stops:
            self.u.emu_stop()
            return
        if any(extension(self, a) for extension in self.extensions):
            return
        c, d, r8, r9 = [
            self.reg(r)
            for r in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9)
        ]
        if a == 0x1459A29C0:
            self.u.reg_write(
                UC_X86_REG_RAX,
                self.H + 0xF000 if self.appearance_counts is not None else 0,
            )
        elif a == 0x145A7D6B0:
            counts = self.appearance_counts.get((d, r8))
            value = (
                0
                if counts is None
                else 1 | sum(count << (8 * (i + 1)) for i, count in enumerate(counts))
            )
            self.u.reg_write(UC_X86_REG_RAX, value)
        elif a == 0x140089200:
            raw = bytes(self.u.mem_read(c, d))
            text = raw.decode()
            trimmed = text.strip(RUST_WHITESPACE).encode()
            start = len(raw) - len(text.lstrip(RUST_WHITESPACE).encode())
            self.u.reg_write(UC_X86_REG_RAX, c + start)
            self.u.reg_write(UC_X86_REG_RDX, len(trimmed))
        elif a in (0x145BFAE10, 0x145D7E320):
            cap, ptr, length = [self.q(c + i * 8) for i in range(3)]
            unit = 32 if a == 0x145BFAE10 else 232
            newcap = max(cap * 2, length + 1, 4)
            at = self.alloc(newcap * unit)
            if length:
                self.u.mem_write(at, bytes(self.u.mem_read(ptr, length * unit)))
            self.put(c, newcap, at, length)
        elif a == 0x145BD5860:
            at = bytes(self.u.mem_read(d, r8)).find(bytes([c & 255]))
            self.u.reg_write(UC_X86_REG_RAX, int(at >= 0))
            self.u.reg_write(UC_X86_REG_RDX, max(at, 0))
        elif a == 0x145BFA0E1:
            left, right = bytes(self.u.mem_read(c, r8)), bytes(self.u.mem_read(d, r8))
            self.u.reg_write(
                UC_X86_REG_RAX, ((left > right) - (left < right)) & 0xFFFFFFFFFFFFFFFF
            )
        elif a == 0x145BFA0E7:
            self.u.mem_write(c, bytes(self.u.mem_read(d, r8)))
            self.u.reg_write(UC_X86_REG_RAX, c)
        elif a in (0x1400021D0, 0x140002200):
            pass
        elif a == 0x1400021C0:
            self.u.reg_write(UC_X86_REG_RAX, self.alloc(c))
        elif a == 0x145BA3DA0:
            at = self.alloc(r9)
            self.u.mem_write(at, bytes(self.u.mem_read(c, min(d, r9))))
            self.u.reg_write(UC_X86_REG_RAX, at)
        elif a == 0x1459A4BA0:
            self.u.mem_write(c, bytes(112))
            if d in self.metadata:
                cl, slot, inventory = self.metadata[d]
                self.u.mem_write(c + 104, bytes([slot, cl]))
                self.u.mem_write(c + 96, struct.pack("<I", inventory))
            else:
                self.put(c, 0xFFFFFFFFFFFFFFFF)
            self.u.reg_write(UC_X86_REG_RAX, c)
        elif a == 0x1459A3E80:
            self.u.mem_write(
                c, struct.pack("<19I", *self.starters.get((d, r8), [0] * 19))
            )
            self.u.reg_write(UC_X86_REG_RAX, c)
        elif a == 0x1458E4E20:
            self.u.reg_write(UC_X86_REG_RAX, int(self.ui(d + 0x30) in self.granted))
        elif a == 0x145BFA970:
            cap, ptr, length = [self.q(c + i * 8) for i in range(3)]
            unit = self.q(self.reg(UC_X86_REG_RSP) + 40)
            newcap = max(cap * 2, length + r8, 4)
            at = self.alloc(newcap * unit)
            if length:
                self.u.mem_write(at, bytes(self.u.mem_read(ptr, length * unit)))
            self.put(c, newcap, at, length)
        elif self.admitted(a):
            self.executed.add(a)
            return
        else:
            raise RuntimeError(
                f"Unadmitted native call {a:#x}, return {self.q(self.reg(UC_X86_REG_RSP)):#x}"
            )
        self._return()

    def call(self, address, *args, count=2000000):
        sp = self.S + 0x100008
        self.put(sp, self.D)
        self.u.reg_write(UC_X86_REG_RSP, sp)
        for r, value in zip(
            (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9), args
        ):
            self.u.reg_write(r, value)
        for i, value in enumerate(args[4:]):
            self.put(sp + 40 + i * 8, value)
        self.u.emu_start(address, self.D, count=count)
        assert (
            self.reg(UC_X86_REG_RIP) == self.D or self.reg(UC_X86_REG_RIP) in self.stops
        ), "Instruction limit reached"
        return self.reg(UC_X86_REG_RAX)

    def parse(self, text):
        self.heap = self.H + 0x10000
        self.u.mem_write(self.H, bytes(0x10000))
        self.u.mem_write(self.S, bytes(0x200000))
        raw = text.encode()
        assert len(raw) < 0xD000, "Fixture input would overlap the synthetic heap"
        self.u.mem_write(self.H + 0x3000, raw or b"\0")
        self.call(0x14589E380, self.H, self.H + 0x3000, len(raw))
        return self.H

    def serialize(self, address):
        result = self.H + 0x4000
        self.call(0x1458A4340, result, address)
        return (
            bytes(self.u.mem_read(self.q(result + 8), self.q(result + 16))).decode()
            if self.q(result + 16)
            else ""
        )
