#!/usr/bin/env python3
"""Bounded execution of unchanged 0.97.2 guardian decision/timer instructions.

The reference process is never launched. No OS, network, filesystem or external
native calls are reachable in these selected instruction ranges.
"""

from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
data = (ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe").read_bytes()
assert hashlib.sha256(data).hexdigest() == SHA
spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
pe = inventory.PE(data)
uc = Uc(UC_ARCH_X86, UC_MODE_64)
size = max(section["rva"] + max(section["virtual_size"], section["raw_size"]) for section in pe.sections)
uc.mem_map(pe.image_base, (size + 4095) & ~4095)
for section in pe.sections:
    uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
ACTOR, HOME, PLAYER, STACK, STOP = 0x200000000, 0x200001000, 0x200002000, 0x300000000, 0x400000000
uc.mem_map(ACTOR, 0x4000)
uc.mem_map(STACK, 0x1000)
uc.mem_map(STOP, 0x1000)
RANGES = {"decision": (0x14550a0a0, 0x14550a1d0), "timer": (0x1454caddb, 0x1454cae18)}
active, endpoints = "", set()


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def putu(address, value):
    uc.mem_write(address, struct.pack("<I", value))


def putq(address, value):
    uc.mem_write(address, struct.pack("<Q", value))


def readu(address):
    return struct.unpack("<I", uc.mem_read(address, 4))[0]


def xyz(address, values):
    uc.mem_write(address, struct.pack("<fff", *values))


def hook(_, address, size, __):
    if address in endpoints:
        uc.emu_stop()
    elif not RANGES[active][0] <= address < RANGES[active][1]:
        raise RuntimeError(f"Out-of-scope native instruction {address:x}")


uc.hook_add(UC_HOOK_CODE, hook)


def execute(kind, stops):
    global active, endpoints
    active, endpoints = kind, set(stops)
    uc.reg_write(UC_X86_REG_EFLAGS, 2)
    uc.reg_write(UC_X86_REG_MXCSR, 0x1f80)
    uc.emu_start(RANGES[kind][0], 0, count=1000)
    result = uc.reg_read(UC_X86_REG_RIP)
    assert result in endpoints
    return result


decision_rows = []
cases = [
    (False, 100, 100, (0, 0, 0), (0, 0, 0), (20, 0, 999)),
    (False, 100, 100, (0, 0, 0), (0, 0, 0), (20.001, 0, 0)),
    (False, 100, 100, (3, 0, 0), (0, 0, 0), (3, 0, 0)),
    (False, 100, 100, (3.001, 0, 0), (0, 0, 0), (3.001, 0, 0)),
    (False, 99, 100, (50, 0, 0), (0, 0, 0), (1000, 0, 0)),
    (True, 75, 100, (0, 0, 0), (0, 0, 0), (97.5, 0, 0)),
    (True, 75, 100, (0, 0, 0), (0, 0, 0), (97.501, 0, 0)),
    (True, 75, 100, (500, 0, 0), (0, 0, 0), (10, 0, 999)),
    (False, 101, 100, (0, 0, 0), (0, 0, 0), (100, 0, 0)),
]
for awake, health, maximum, current, home, player in cases:
    for path in [(current, current, 0, 0, 0), ((-50, 0, 0), current, 10, 2, 12)]:
        start, end, started, duration, now = path
        uc.mem_write(ACTOR, bytes(0x4000))
        putq(ACTOR + 0x40, 3)
        uc.mem_write(ACTOR + 0x60, bytes([awake]))
        putu(ACTOR + 0xf0, bits(health))
        putu(ACTOR + 0xf4, bits(maximum))
        putq(ACTOR + 0x10, 7)
        putu(ACTOR + 0x98, bits(0.35))
        putu(ACTOR + 0x9c, bits(77))
        xyz(ACTOR + 0x10c, start)
        xyz(ACTOR + 0x118, end)
        putu(ACTOR + 0x124, bits(started))
        putu(ACTOR + 0x128, bits(duration))
        xyz(HOME, home)
        xyz(PLAYER, player)
        putq(STACK + 0x800, STOP)
        uc.reg_write(UC_X86_REG_RSP, STACK + 0x800)
        uc.reg_write(UC_X86_REG_RCX, ACTOR)
        uc.reg_write(UC_X86_REG_RDX, HOME)
        uc.reg_write(UC_X86_REG_R8, PLAYER)
        uc.reg_write(UC_X86_REG_XMM3, bits(now))
        execute("decision", [STOP])
        decision_rows.append(dict(awake=awake, health_bits=bits(health), max_health_bits=bits(maximum),
            home_bits=list(map(bits, home)), player_bits=list(map(bits, player)),
            from_bits=list(map(bits, start)), to_bits=list(map(bits, end)),
            started_bits=bits(started), duration_bits=bits(duration), now_bits=bits(now),
            decision=uc.reg_read(UC_X86_REG_RAX) & 0xff,
            awake_after=bool(uc.mem_read(ACTOR + 0x60, 1)[0]),
            health_after_bits=readu(ACTOR + 0xf0),
            effects_after=readu(ACTOR + 0x10), slow_after_bits=readu(ACTOR + 0x98),
            slow_until_after_bits=readu(ACTOR + 0x9c)))

timer_rows = []
for index in range(3):
    for timer, elapsed, scale in [(0, 0, 1), (0.5, 0.5, 1), (0.5, 0.499, 1),
                                   (1, 20, 0.7), (8, 4, 1), (float("nan"), 1, 1)]:
        putu(ACTOR, bits(timer))
        uc.reg_write(UC_X86_REG_RAX, ACTOR)
        uc.reg_write(UC_X86_REG_RCX, index)
        uc.reg_write(UC_X86_REG_XMM7, bits(elapsed))
        uc.reg_write(UC_X86_REG_XMM8, 0)
        uc.reg_write(UC_X86_REG_XMM9, bits(scale))
        end = execute("timer", [0x1454cadc5, 0x1454cae18])
        timer_rows.append(dict(index=index, timer_bits=bits(timer), elapsed_bits=bits(elapsed),
            repeat_scale_bits=bits(scale), due=end == 0x1454cae18, after_bits=readu(ACTOR)))

result = dict(version="0.97.2", target_sha256=SHA,
    method="Unchanged x86-64 guardian instructions in bounded Unicorn; external instructions/calls rejected; no game/process/OS execution.",
    ranges={key: [hex(a), hex(b)] for key, (a, b) in RANGES.items()},
    decision_cases=decision_rows, timer_cases=timer_rows)
output = ROOT / "crates/azeroth-survivors-re/tests/fixtures/guardian-ai-native.json"
output.write_text(json.dumps(result, indent=2, allow_nan=False) + "\n")
print(f"{len(decision_rows)} decision and {len(timer_rows)} timer cases; fixture SHA-256 {hashlib.sha256(output.read_bytes()).hexdigest()}")
