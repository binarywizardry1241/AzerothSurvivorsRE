"""Hash-bound 0.97.2 guardian stat/rescale oracle; no game/process launch.

Executes unchanged x86-64 instructions. Zone resolution, temporary curve-vector
construction/free and powf are explicit stubs. Powf results are injected, so
these fixtures verify the callers' arithmetic and arguments, not CRT powf.
"""
from native_recovery import reset_machine
from pathlib import Path
import hashlib
import importlib.util
import json
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

TARGET_SHA256 = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
data = (ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe").read_bytes()
assert hashlib.sha256(data).hexdigest() == TARGET_SHA256
spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
pe = inventory.PE(data)
NATIVE_RANGES = {
    "health": [(0x1454ef9f0, 0x1454efd50)],
    "damage": [(0x1454efdf0, 0x1454eff7f)],
    "rescale": [(0x1454cde83, 0x1454cdeea)],
}
uc = Uc(UC_ARCH_X86, UC_MODE_64)
image_size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
uc.mem_map(pe.image_base, (image_size + 4095) & ~4095)
for section in pe.sections:
    uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
GAME, CURVE, ACTOR, STACK, STOP = 0x200000000, 0x200010000, 0x200020000, 0x300000000, 0x400000000
uc.mem_map(GAME, 0x30000)
uc.mem_map(STACK, 0x20000)
uc.mem_map(STOP, 4096)
active, zone_index, curve, pow_result, events = None, 0, [], 0, []


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def putu(address, value):
    uc.mem_write(address, struct.pack("<I", value))


def putq(address, value):
    uc.mem_write(address, struct.pack("<Q", value))


def readu(address):
    return struct.unpack("<I", uc.mem_read(address, 4))[0]


def readq(address):
    return struct.unpack("<Q", uc.mem_read(address, 8))[0]


def return_stub():
    sp = uc.reg_read(UC_X86_REG_RSP)
    uc.reg_write(UC_X86_REG_RSP, sp + 8)
    uc.reg_write(UC_X86_REG_RIP, readq(sp))


def hook(_, address, size, __):
    if address in (STOP, 0x1454cdeea):
        uc.emu_stop()
    elif any(a <= address < b for a, b in NATIVE_RANGES[active]):
        return
    elif address == 0x14540e820:
        uc.reg_write(UC_X86_REG_RAX, zone_index)
        return_stub()
    elif address == 0x14552b760:
        output = uc.reg_read(UC_X86_REG_RCX)
        for index, (time, hp) in enumerate(curve):
            putu(CURVE + index * 8, time)
            putu(CURVE + index * 8 + 4, hp)
        putq(output, len(curve))
        putq(output + 8, CURVE)
        putq(output + 16, len(curve))
        return_stub()
    elif address == 0x1400021d0:
        return_stub()
    elif address == 0x145756e73:
        events.append({"base_bits": uc.reg_read(UC_X86_REG_XMM0) & 0xffffffff,
                       "exponent_bits": uc.reg_read(UC_X86_REG_XMM1) & 0xffffffff,
                       "result_bits": pow_result})
        uc.reg_write(UC_X86_REG_XMM0, pow_result)
        return_stub()
    else:
        raise RuntimeError(f"Out-of-scope native instruction {address:x} in {active}")


uc.hook_add(UC_HOOK_CODE, hook)


def reset():
    reset_machine(uc, globals(), GAME, STACK, STOP)


def execute(kind):
    global active
    active = kind
    uc.emu_start(NATIVE_RANGES[kind][0][0], 0, count=100000)
    assert uc.reg_read(UC_X86_REG_RIP) in (STOP, 0x1454cdeea)
    return uc.reg_read(UC_X86_REG_XMM0) & 0xffffffff


def native_knots(index):
    bosses = readq(0x146716438 + index * 0xf0 + 0x88)
    return [[readu(bosses + i * 0x58 + 0x40), readu(bosses + i * 0x58 + 0x44)]
            for i in range(5) if uc.mem_read(bosses + i * 0x58 + 0x54, 1)[0] != 1]


stat_cases = []
inputs = [
    ("start", 0., 1., 0, 100, 100, 0, False, 0., 1.),
    ("early", 30., 1., 0, 100, 100, 1, False, 0., 1.),
    ("first_knot", 180., 1., 0, 100, 100, 1, False, 0., 1.),
    ("between_knots", 337.5, 1.5, 2, 175, 80, 1, False, 0., 1.),
    ("late_extrapolation", 1800., 2.25, 21, 300, 250, 1, False, 0., 1.),
    ("maximum_integer_modifiers", 720., 0.75, 0xffffffff, 65535, 65535, 1, False, 0., 1.),
    ("zero_percent", 600., 1., 2, 0, 0, 1, False, 0., 1.),
    ("endless_at_start", 720., 1., 2, 100, 100, 1, True, 720., 1.),
    ("endless_future_start_clamps", 600., 1., 2, 100, 100, 1, True, 720., 1.),
    ("endless_one_minute_injected_pow", 780., 1., 3, 100, 100, 1, True, 720., 2.),
    ("endless_fractional_injected_pow", 817.5, 1., 3, 100, 100, 1, True, 720., 1.375),
    ("endless_wrong_phase", 780., 1., 3, 100, 100, 0, True, 720., 2.),
]
for zone_index in range(12):
    zone = 0x146716438 + zone_index * 0xf0
    enemies, count = readq(zone + 0x78), readq(zone + 0x80)
    for enemy_index in (0, count - 1):
        for label, clock, difficulty, kills, hp_pct, dmg_pct, phase, endless, start, power in inputs:
            reset()
            curve = native_knots(zone_index)
            pow_result = bits(power)
            for offset, value in [(0x8e4,bits(clock)), (0x944,bits(difficulty)),
                                  (0x664,kills), (0x858,phase), (0x85c,bits(start))]:
                putu(GAME+offset,value)
            uc.mem_write(GAME+0x232,struct.pack("<HH",hp_pct,dmg_pct))
            uc.mem_write(GAME+0x952,bytes([endless]))
            outputs, calls = {}, {}
            for kind in ("health", "damage"):
                sp = STACK + 0x1f008
                putq(sp,STOP)
                uc.reg_write(UC_X86_REG_RSP,sp)
                uc.reg_write(UC_X86_REG_RCX,GAME)
                uc.reg_write(UC_X86_REG_RDX,enemy_index)
                events = []
                outputs[kind+"_bits"] = execute(kind)
                calls[kind] = events
            stat_cases.append({"label": label, "zone_index":zone_index, "enemy_index":enemy_index,
                "clock_bits":bits(clock), "difficulty_bits":bits(difficulty),
                "zone_scale_bits":readu(zone+0xe0), "guardian_kills":kills,
                "hp_percent":hp_pct, "damage_percent":dmg_pct, "phase":phase,
                "endless":endless, "endless_start_bits":bits(start),
                "pow_result_bits":pow_result, "base_hp_bits":readu(enemies+enemy_index*0x50+0x30),
                "base_damage_bits":readu(enemies+enemy_index*0x50+0x34),
                "hp_knots_bits":curve, "pow_calls":calls, **outputs})

curve_cases = []
zone_index = 0
zone = 0x146716438
enemies = readq(zone+0x78)
for label, seconds, pairs in [
    ("empty_curve_uses_polynomial",600,[]),
    ("single_knot_ignores_time",600,[(3,8000)]),
    ("first_knot_zero_time",0,[(0,8000),(1,16000)]),
    ("first_knot_small_denominator",0.015,[(0.0005,8000),(1,16000)]),
    ("two_knot_interpolation",240,[(3,8000),(6,16000)]),
    ("two_knot_extrapolation",720,[(3,8000),(6,16000)]),
    ("near_duplicate_time_denominator",180.015,[(3,8000),(3.0005,16000)]),
    ("decreasing_knot_hp",240,[(3,16000),(6,8000)]),
]:
    reset()
    curve = [[bits(t),bits(h)] for t,h in pairs]
    pow_result = bits(1)
    putu(GAME+0x8e4,bits(seconds))
    putu(GAME+0x944,bits(1))
    uc.mem_write(GAME+0x232,struct.pack("<HH",100,100))
    uc.reg_write(UC_X86_REG_RCX,GAME)
    uc.reg_write(UC_X86_REG_RDX,0)
    events = []
    result = execute("health")
    curve_cases.append({"label":label,"clock_bits":bits(seconds),"difficulty_bits":bits(1),
                       "zone_scale_bits":readu(zone+0xe0),"base_hp_bits":readu(enemies+0x30),
                       "hp_knots_bits":curve,"health_bits":result})

rescale_cases = []
for label, hp, maximum, damage, new_max, new_damage in [
    ("increase_retains_half",bits(50),bits(100),bits(20),bits(200),bits(30)),
    ("decrease_retains_current",bits(50),bits(100),bits(20),bits(90),bits(10)),
    ("equal_hp_max",bits(150),bits(100),bits(20),bits(100),bits(20)),
    ("overfull_hp_clamps",bits(150),bits(100),bits(20),bits(200),bits(10)),
    ("negative_hp_clamps",bits(-10),bits(100),bits(20),bits(200),bits(10)),
    ("zero_old_max",bits(0),bits(0),bits(20),bits(200),bits(20)),
    ("nan_new_stats",bits(50),bits(100),bits(20),0x7fc00001,0x7fc00001),
    ("nan_old_damage",bits(50),bits(100),0x7fc00001,bits(200),bits(30)),
    ("nan_hp",0x7fc00001,bits(100),bits(20),bits(200),bits(30)),
    ("negative_zero_damage",bits(50),bits(100),0,bits(100),0x80000000),
]:
    reset()
    for offset,value in [(0xf0,hp),(0xf4,maximum),(0xf8,damage)]: putu(ACTOR+offset,value)
    uc.reg_write(UC_X86_REG_RDI,ACTOR)
    uc.reg_write(UC_X86_REG_XMM6,new_max)
    uc.reg_write(UC_X86_REG_XMM0,new_damage)
    uc.reg_write(UC_X86_REG_XMM12,bits(1))
    execute("rescale")
    rescale_cases.append({"label":label,"hp_bits":hp,"max_hp_bits":maximum,"damage_bits":damage,
                          "new_max_hp_bits":new_max,"new_damage_bits":new_damage,
                          "output_hp_bits":readu(ACTOR+0xf0),"output_max_hp_bits":readu(ACTOR+0xf4),
                          "output_damage_bits":readu(ACTOR+0xf8)})

manifest = {"target_version":"0.97.2","target_sha256":TARGET_SHA256,
    "method":"Unchanged x86-64 PE instruction ranges in Unicorn; native SSE f32 arithmetic, controlled game/actor state; no game/process launch.",
    "evidence_ids":["ev_2bc657ab96ff5aae41847ccd5c490dc62727a5497c57edf69b09ca86c6157d4c", "ev_08414aa773676824707084beb7bbc5a734991236b78c5e41621b83d6b21a96c6"],
    "native_ranges":[{"scope":name,"start":hex(a),"end_exclusive":hex(b),
                      "sha256":hashlib.sha256(data[pe.rva_offset(a-pe.image_base):pe.rva_offset(a-pe.image_base)+b-a]).hexdigest()}
                     for name,ranges in NATIVE_RANGES.items() for a,b in ranges],
    "stubs":{"0x14540e820":"Zone resolver returns caller-selected original table index.",
             "0x14552b760":"Returns curve pairs from first five original zone bosses, excluding byte+54==1; allocation not executed.",
             "0x1400021d0":"Temporary vector free returns without effects.",
             "0x145756e73":"Records f32 base/exponent and returns explicit injected f32 result; CRT powf is not executed."},
    "limits":["Only scalar callers and bounded actor rescale write block are executed.",
              "This does not verify CRT powf, zone resolution, allocation, guardian AI, game integration or rendered parity.",
              "Stat cases use original unmodified zone scales, enemy base stats and boss curve data; game state is injected.",
              "Curve cases inject synthetic temporary curve vectors to exercise scalar branches absent from the original catalog; they do not assert those vectors occur in game."],
    "stat_cases":stat_cases,"curve_cases":curve_cases,"rescale_cases":rescale_cases}
output = ROOT / "crates/azeroth-survivors-re/tests/fixtures/guardians-native.json"
output.write_text(json.dumps(manifest,indent=2)+"\n")
print(f"Recorded {len(stat_cases)} guardian stat cases, {len(curve_cases)} curve cases and {len(rescale_cases)} rescale cases")
print(f"Output SHA-256: {hashlib.sha256(output.read_bytes()).hexdigest()}")
