#!/usr/bin/env python3
"""Replay the 0.113.2 AS elapsed clamp and ordinary local clock gate.

This executes selected original instructions in Unicorn, not the game or Rust.
The startup helper is an explicit phase-write seam when exercising phase zero;
all clock admission and f32 addition are original instructions.
"""
import argparse
import hashlib
import json
import math
import struct
import sys

from coverage_common import ROOT, json_text, latest_target, target_bytes
from script_sources import load_script

sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as r

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
KEPT = ROOT / "docs/analysis/evidence/as-state-contracts/step.json"
STAGE = ROOT / "runtime/analysis/history/native-recovery/as-state-contracts/a6cf7f2e1fff/staged/step.json"
RANGES = [(0x1458681B5, 0x1458681F1), (0x14586C2E1, 0x14586C2F9),
          (0x14590A241, 0x14590A2F2)]


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["version"] == "0.113.2" and target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("as_step_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(first, last):
        offset = pe.rva_offset(first - pe.image_base)
        assert offset is not None
        return image[offset:offset + last - first]

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    pages = set()
    for first, last in RANGES:
        for page in range(first & ~4095, (last + 4095) & ~4095, 4096):
            if page not in pages:
                u.mem_map(page, 4096)
                pages.add(page)
        u.mem_write(first, raw(first, last))
    u.mem_map(0x145FA3000, 4096)
    u.mem_write(0x145FA3620, raw(0x145FA3620, 0x145FA3628))
    assert raw(0x145FA3620, 0x145FA3628) == struct.pack("<d", 0.1)
    mem, frame = 0x200000000, 0x300000000
    u.mem_map(mem, 0x10000)
    u.mem_map(frame, 0x10000)
    stops, calls = set(), []

    def hook(uc, address, size, context):
        if address in stops:
            uc.emu_stop()
        elif address == 0x14590A2CA:
            # The actual start helper's first store is Game+c12=1; its other
            # effects are outside this selected clock-admission fixture.
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX) + 0xC12, b"\x01")
            uc.reg_write(r.UC_X86_REG_RIP, address + 5)
            calls.append(address)

    u.hook_add(UC_HOOK_CODE, hook)
    scalar_cases = []
    timestamps = [(0.0, -0.0), (0.0, 0.0), (100.0, 99.0),
                  *[(100.0, 100.0 + step) for step in
                    (0.00001, 1 / 60, 0.099999, 0.1, 0.100001, 0.25, 1.0, 3600.0)],
                  (100.0, math.inf), (100.0, -math.inf), (math.inf, math.inf),
                  (math.nan, 100.0), (100.0, math.nan)]
    for state in (0, 1, 2, 0xFFFFFFFF):
        for previous, current in timestamps:
            u.mem_write(mem, bytes(0x10000))
            u.mem_write(mem, struct.pack("<Qd", state, previous))
            u.reg_write(r.UC_X86_REG_RCX, mem)
            u.reg_write(r.UC_X86_REG_XMM1, int.from_bytes(struct.pack("<d", current), "little"))
            stops.clear()
            stops.add(0x1458681F1)
            u.emu_start(0x1458681B5, 0, count=100)
            actual = u.reg_read(r.UC_X86_REG_XMM7) & 0xFFFFFFFF
            delta = current - previous
            expected = 0.0
            if state == 1:
                # SSE ordered max/min choose their source on equality or NaN.
                expected = delta if not delta < 0.0 else 0.0
                expected = expected if not expected > 0.1 else 0.1
            if math.isnan(expected):
                assert math.isnan(struct.unpack("<f", struct.pack("<I", actual))[0])
            else:
                assert actual == bits(f32(expected)), (state, previous, current, actual, expected)
            assert bytes(u.mem_read(mem, 8)) == struct.pack("<Q", 1)
            assert bytes(u.mem_read(mem + 8, 8)) == struct.pack("<d", current)
            scalar_cases.append(dict(state=state, previous=struct.pack("<d", previous).hex(),
                                     current=struct.pack("<d", current).hex(), result_bits=actual))

    gate_cases = []
    for phase in range(7):
        for requested in (0, 1):
            for delta in (0.0, -0.0, 0.016, 0.1, math.nan):
                u.mem_write(mem, bytes(0x10000))
                u.mem_write(frame, bytes(0x10000))
                u.mem_write(mem + 0xC12, bytes([phase]))
                u.mem_write(mem + 0xC07, bytes([requested]))
                u.mem_write(mem + 0xB6C, struct.pack("<f", 300.0))
                u.reg_write(r.UC_X86_REG_RSI, mem)
                u.reg_write(r.UC_X86_REG_RBP, frame + 0x8000)
                u.reg_write(r.UC_X86_REG_XMM6, bits(delta))
                stops.clear()
                stops.update((0x14590A2F2, 0x14590ACB8))
                calls.clear()
                u.emu_start(0x14590A2AC, 0, count=100)
                active = phase == 1 or (phase == 0 and requested)
                assert bool(calls) == (phase == 0 and bool(requested))
                actual = bytes(u.mem_read(mem + 0xB6C, 4))
                expected = f32(300.0 + delta) if active else 300.0
                if math.isnan(expected):
                    assert math.isnan(struct.unpack("<f", actual)[0])
                else:
                    assert actual == struct.pack("<f", expected)
                assert u.reg_read(r.UC_X86_REG_RIP) == (0x14590A2F2 if active else 0x14590ACB8)
                gate_cases.append(dict(phase=phase, requested=requested, delta_bits=bits(delta),
                                       active=bool(active), result_hex=actual.hex()))

    # Current actual call, and the shared-mode tail jump, preserve the supplied
    # clamped scalar; neither is inferred from proximity or a function name.
    assert raw(0x14586C2F1, 0x14586C2F9) == bytes.fromhex("0f28cfe8e7de0900")
    assert raw(0x14590A2A7, 0x14590A2AC) == bytes.fromhex("e9a4f4fdff")
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics.rs").read_text()
    body = source.split("pub fn tick(", 1)[1].split("let mut forced_position", 1)[0]
    compact = "".join(body.split())
    assert "delta<=0.0" in compact
    assert "letdelta=ifdelta>0.1{0.1}else{delta};" in compact
    assert compact.index("delta<=0.0") < compact.index("letdelta=")
    rest = source.split("pub fn tick(", 1)[1].split("fn cast_context", 1)[0]
    assert "self.clock += delta;" in rest
    result = dict(schema_version=1,
                  target={key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
                  server_scalar_cases=len(scalar_cases), local_clock_cases=len(gate_cases),
                  scalar_cases_sha256=hashlib.sha256(json_text(scalar_cases).encode()).hexdigest(),
                  gate_cases_sha256=hashlib.sha256(json_text(gate_cases).encode()).hexdigest(),
                  ranges=[dict(va=hex(a), end_exclusive=hex(z), byte_count=z-a,
                               sha256=hashlib.sha256(raw(a, z)).hexdigest()) for a, z in RANGES],
                  max_step=dict(va="0x145fa3620", f64_hex=raw(0x145FA3620, 0x145FA3628).hex()),
                  source_refs=["crates/azeroth-survivors-re/src/gameplay/mechanics.rs"],
                  limits=["Native timestamp acquisition, full Game tick, scheduling and Rust execution are not exercised.",
                          "The startup helper is an explicit phase-store seam; the supplied clock gate uses original instructions.",
                          "NaN classes are checked, but exact NaN payload equivalence is not claimed.",
                          "Existing source nonpositive-tick admission remains; no complete zero-step side-effect equivalence is inferred."])
    if args.stage:
        STAGE.parent.mkdir(parents=True, exist_ok=True)
        STAGE.write_text(json_text(result))
    else:
        assert result == json.loads(KEPT.read_text()), "AS step evidence drift"
    print(json_text(dict(target_sha256=SHA, server_scalar_cases=len(scalar_cases),
                         local_clock_cases=len(gate_cases), source_guards="pass",
                         compilation_run=False, game_run=False)))


if __name__ == "__main__":
    main()
