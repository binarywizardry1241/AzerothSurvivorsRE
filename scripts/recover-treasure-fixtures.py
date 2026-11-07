#!/usr/bin/env python3
"""Bounded unchanged 0.97.2 instruction oracle; no game/process/OS execution.

The named target instruction slices run in Unicorn with fixed-memory inputs.
Native SIMD/f32 operations determine outputs. Out-of-scope calls fail closed,
except for the explicitly recorded placement, creation and removal stubs.
The preserved 0.92 extractor and fixtures remain unchanged.
"""
from script_sources import load_script, run_contract

if __name__ == "__main__":
    run_contract(__file__)
from native_recovery import reset_machine
from coverage_common import artifact_path
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

TARGET_SHA256 = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
data = artifact_path("installed-game/AzerothSurvivors.exe").read_bytes()
assert hashlib.sha256(data).hexdigest() == TARGET_SHA256
inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
pe = inventory.PE(data)

# Target-specific instruction anchors. These validate state/clock/price fields,
# kind comparison, cap comparison and the selected removal call before running
# any instruction; copying old addresses or shifted fields fails immediately.
OPCODE_ANCHORS = [
    ("active-state gate", 0x14549D5F7, "3c014c89ad680300000f852fcc0000"),
    ("clock +0x8e4 load/add/store", 0x14549D606, "f3410f10bde4080000f30f58fef3410f11bde4080000"),
    ("clock/deadline +0x8e4/+0x92c", 0x1454A95D3, "f3410f1085e4080000410f2e852c0900000f8225010000f30f5805222e7500f3410f11852c090000"),
    ("timer kind-2 comparison", 0x1454A96C2, "8339020f94c2"),
    ("timer count <=2", 0x1454A96D4, "4983f8027735"),
    ("range RNG entry", 0x1454F97C0, "564883ec200f2ed10f8638010000"),
    ("chest creator entry/object/model", 0x1454C825C, "4589fd488b873005000041be03000000c7455c2d23000049bf030100000000803f"),
    ("creator count >=5", 0x1454C8366, "4983f8050f823d0c0000"),
    ("creator selected-index removal call", 0x1454C8FA2, "4889f94c89c2e8b3800000"),
    ("price +0x930 load/affordability", 0x1454D34DB, "448bb9300900004489f04429f80f82c6000000"),
    ("price +0x930 write", 0x1454D352B, "899630090000"),
]
opcode_validation = []
for role, address, expected in OPCODE_ANCHORS:
    offset = pe.rva_offset(address - pe.image_base)
    length = len(expected) // 2
    actual = data[offset:offset + length]
    if actual.hex() != expected:
        raise SystemExit(f"0.97.2 opcode mismatch for {role} at {address:#x}")
    opcode_validation.append(dict(role=role, va=hex(address), file_offset=hex(offset),
                                  hex=actual.hex(), matched=True))

NATIVE_RANGES = {
    "clock": [(0x14549d5f7, 0x14549d61c)],
    "timer": [(0x1454a95d3, 0x1454a970f)],
    "range_rng": [(0x1454f97c0, 0x1454f993a)],
    "eviction": [(0x1454c825c, 0x1454c8415), (0x1454c8fa2, 0x1454c8fad)],
    "price": [(0x1454d34b0, 0x1454d3531)],
}

uc = Uc(UC_ARCH_X86, UC_MODE_64)
image_size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
uc.mem_map(pe.image_base, (image_size + 4095) & ~4095)
for section in pe.sections:
    uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
GAME, PICKUPS, STACK, STOP = 0x200000000, 0x200010000, 0x300000000, 0x400000000
uc.mem_map(GAME, 0x20000)
uc.mem_map(STACK, 0x20000)
uc.mem_map(STOP, 4096)
active = None
stops = set()
events = []

def reg(r):
    return uc.reg_read(r)

def putq(address, value):
    uc.mem_write(address, struct.pack("<Q", value))

def putu(address, value):
    uc.mem_write(address, struct.pack("<I", value))

def getu(address):
    return struct.unpack("<I", uc.mem_read(address, 4))[0]

def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]

def floatval(value):
    return struct.unpack("<f", struct.pack("<I", value))[0]

def return_stub():
    sp = reg(UC_X86_REG_RSP)
    destination = struct.unpack("<Q", uc.mem_read(sp, 8))[0]
    uc.reg_write(UC_X86_REG_RSP, sp + 8)
    uc.reg_write(UC_X86_REG_RIP, destination)

def hook(_, address, size, __):
    if address in stops:
        uc.emu_stop()
        return
    if any(a <= address < b for a, b in NATIVE_RANGES[active]):
        return
    if active == "timer" and address == 0x1454c2a20:
        events.append({"call": "placement", "min_bits": reg(UC_X86_REG_XMM2) & 0xffffffff,
                       "max_bits": reg(UC_X86_REG_XMM3) & 0xffffffff})
        # The timer's placement return is unused by this bounded count/schedule scope.
        return_stub()
    elif active == "timer" and address == 0x1454c8110:
        events.append({"call": "creation", "kind": reg(UC_X86_REG_RDX)})
        return_stub()
    elif active == "eviction" and address == 0x1454d1060:
        events.append({"call": "removal", "index": reg(UC_X86_REG_RDX)})
        # Stop before creation/height work; this stub only records selected index.
        return_stub()
    else:
        raise RuntimeError(f"Out-of-scope native instruction {address:x} in {active}")

uc.hook_add(UC_HOOK_CODE, hook)

def reset():
    reset_machine(uc, globals(), GAME, STACK, STOP, game_bytes=0x20000, vector_count=8, extra_registers=(('RBP', STACK + 0x10000), ('R13', GAME), ('RDI', GAME), ('RCX', GAME)))

def execute(kind, start, endpoints):
    global active, stops, events
    active, stops, events = kind, set(endpoints), []
    uc.emu_start(start, 0, count=100000)
    assert reg(UC_X86_REG_RIP) in stops, f"instruction limit in {kind}"
    return reg(UC_X86_REG_RIP)

def records(kinds, times=None):
    putq(GAME + 0x528, PICKUPS)
    putq(GAME + 0x530, len(kinds))
    for index, kind in enumerate(kinds):
        putu(PICKUPS + index * 72 + 0x20, kind)
        if times is not None:
            putu(PICKUPS + index * 72 + 0x40, times[index])

clock_cases = []
for state in (0, 1, 3):
    reset()
    putu(GAME + 0x8e4, bits(59.5))
    uc.reg_write(UC_X86_REG_RAX, state)
    uc.reg_write(UC_X86_REG_XMM6, bits(0.5))
    execute("clock", 0x14549d5f7, [0x14549d61c, 0x1454aa235])
    clock_cases.append({"state": state, "clock_bits": bits(59.5), "delta_bits": bits(0.5),
                        "output_clock_bits": getu(GAME + 0x8e4)})

timer_cases = []
for label, clock_bits, next_bits, kinds in [
    ("just_before_first", bits(60.0)-1, bits(60.0), [2,2]),
    ("first_due", bits(60), bits(60), [2,2]),
    ("skip_three", bits(60), bits(60), [2,2,2]),
    ("skip_five_mixed_vector_tail", bits(130), bits(130), [0,2,2,6,2,2,2]),
    ("simd_mixed_two_chests", bits(60), bits(60), [2,0,6,2]),
    ("late_tick_no_catchup", bits(500.125), bits(60), []),
    ("large_f32_clock", bits(16777216), bits(16777216), [2]),
]:
    reset()
    putu(GAME + 0x8e4, clock_bits)
    putu(GAME + 0x92c, next_bits)
    records(kinds)
    execute("timer", 0x1454a95d3, [0x1454a970f])
    timer_cases.append({"label": label, "clock_bits": clock_bits, "next_bits": next_bits,
                        "pickup_kinds": kinds, "output_next_bits": getu(GAME+0x92c),
                        "native_events": events})

rng_cases = []
for label, seed, lo, hi in [
    ("small_seed_radius", [1,2,3,4], bits(18), bits(50)),
    ("small_seed_angle", [1,2,3,4], bits(0), 0x40c90fdb),
    ("all_high_radius", [0xffffffffffffffff]*4, bits(18), bits(50)),
    ("mixed_seed_radius", [0x0123456789abcdef,0xfedcba9876543210,0x8877665544332211,0x1122334455667788], bits(18), bits(50)),
    ("last_word_only", [0,0,0,0x8000000000000000], bits(18), bits(50)),
    ("adjacent_f32_range_rejection", [0xffffffffffffffff]*4, bits(1), bits(1)+1),
]:
    reset()
    uc.mem_write(GAME, struct.pack("<4Q", *seed))
    outputs = []
    for _ in range(6):
        # Each normal return resets the stack for another independent Win64 call.
        sp = STACK + 0x1f008
        putq(sp, STOP)
        uc.reg_write(UC_X86_REG_RSP, sp)
        uc.reg_write(UC_X86_REG_RCX, GAME)
        uc.reg_write(UC_X86_REG_XMM1, lo)
        uc.reg_write(UC_X86_REG_XMM2, hi)
        execute("range_rng", 0x1454f97c0, [STOP])
        outputs.append({"value_bits": reg(UC_X86_REG_XMM0) & 0xffffffff,
                        "state": list(struct.unpack("<4Q", uc.mem_read(GAME, 32)))})
    rng_cases.append({"label": label, "initial_state": seed, "min_bits": lo,
                      "max_bits": hi, "draws": outputs})

eviction_cases = []
for label, kinds, times in [
    ("below_cap", [2]*4, [bits(0),bits(1),bits(2),bits(3)]),
    ("five_equal_keeps_first", [2]*5, [bits(0)]*5),
    ("oldest_in_middle", [2]*5, [bits(20),bits(10),bits(0),bits(30),bits(40)]),
    ("mixed_vector_filters_kinds", [0,2,6,2,2,0,2,2], [bits(-99),bits(4),bits(-100),bits(3),bits(2),bits(-101),bits(1),bits(0)]),
    ("above_cap_removes_one", [2]*7, [bits(5),bits(4),bits(3),bits(2),bits(1),bits(0),bits(6)]),
    ("signed_zero_total_order", [2]*5, [0,0x80000000,bits(1),bits(2),bits(3)]),
]:
    reset()
    records(kinds, times)
    uc.reg_write(UC_X86_REG_R15, 2)
    execute("eviction", 0x1454c825c, [0x1454c8fad])
    eviction_cases.append({"label": label, "pickup_kinds": kinds, "creation_time_bits": times,
                           "native_events": events})

price_cases = []
for price, gold in [(0,0), (20,20), (31,100), (16777215,0xffffffff),
                     (16777216,0xffffffff), (3303820000,0xffffffff),
                     (0xffffffff,0xffffffff), (20,19)]:
    reset()
    putu(GAME+0x408, gold)
    putu(GAME+0x930, price)
    endpoint = execute("price", 0x1454d34b0, [0x1454d3531,0x1454d35b4])
    price_cases.append({"price": price, "gold": gold,
                        "affordable": endpoint == 0x1454d3531,
                        "output_gold": getu(GAME+0x408), "output_price": getu(GAME+0x930)})

manifest = {
    "version": "0.97.2",
    "target": "AzerothSurvivors/AzerothSurvivors-0.97.2.exe",
    "target_sha256": TARGET_SHA256,
    "opcode_validation": opcode_validation,
    "method": "Unchanged x86-64 PE instruction bytes executed in Unicorn; native f32 SSE instructions determine outputs. No host calls, original process launch, network, file operations, terrain or UI execution.",
    "native_ranges": [{"scope": name, "start": hex(a), "end_exclusive": hex(b),
                       "sha256": hashlib.sha256(data[pe.rva_offset(a-pe.image_base):pe.rva_offset(a-pe.image_base)+(b-a)]).hexdigest()}
                      for name, ranges in NATIVE_RANGES.items() for a,b in ranges],
    "stubs": {"timer_placement": "Records exact supplied min/max bits; returns without calculating position or altering RNG.",
              "timer_creation": "Records kind only; does not alter pickups.",
              "eviction_removal": "Records selected index only; execution stops before terrain/creation."},
    "clock_cases": clock_cases, "timer_cases": timer_cases, "range_rng_cases": rng_cases,
    "eviction_cases": eviction_cases, "price_cases": price_cases,
    "limits": ["Only named instruction ranges execute. The already-mapped PE supplies original constants and SSE comparison masks.",
               "Clock fixtures inject state/delta at the active-state gate; deferred initialization and full tick are excluded.",
               "Timer does not exercise real placement or creation. Eviction does not exercise native removal effects or append.",
               "Price scope ends after affordability and gold/next-price writes; purchase counters/UI/message/removal are excluded.",
               "RNG state is injected. Full run seeding/shared consumers and trigonometry are excluded.",
               "These are bounded native-code oracle fixtures, not original-game or rendered/rebuilt parity verification."],
}
output = ROOT / "crates/azeroth-survivors-re/tests/fixtures/treasure-chests-0.97.2-native.json"
output.write_text(json.dumps(manifest, indent=2)+"\n")
print(f"Recorded {sum(len(manifest[key]) for key in ('clock_cases','timer_cases','range_rng_cases','eviction_cases','price_cases'))} fixtures: clock=3 timer=7 RNG=6 eviction=6 price=8")
print(f"Output SHA-256: {hashlib.sha256(output.read_bytes()).hexdigest()}")
