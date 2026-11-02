#!/usr/bin/env python3
"""Replay current native compact-stat arithmetic and localization arguments."""
import argparse
import hashlib
import json
import math
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.121.0/armory-stat-format/manifest.json"
KEYS = ("damage", "cooldown", "hp", "crit", "crit_damage", "speed", "armor",
        "regen", "pickup", "gold", "area", "count", "echo", "calm_regen", "crowd_armor")


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def bits(value):
    return struct.unpack("<I", struct.pack("<f", value))[0]


def roundf(value):
    return f32(math.copysign(math.floor(abs(value) + 0.5), value))


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg
    selected = latest_target(verify=True)
    image = target_bytes(selected)
    pe = load_script("armory_stat_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    # Map the existing image into synthetic memory once. This is not an OS
    # process; only the bounded formatter below can execute original code.
    size = max(section["rva"] + max(section["virtual_size"], section["raw_size"]) for section in pe.sections)
    machine.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section["rva"],
                          image[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(heap, 0x10000)
    machine.mem_map(stack, 0x20000)
    machine.mem_map(stop, 4096)
    state, seen, steps = {}, set(), 0

    def qword(address): return struct.unpack("<Q", machine.mem_read(address, 8))[0]
    def float_at(address): return struct.unpack("<f", machine.mem_read(address, 4))[0]
    def text_at(address, length): return bytes(machine.mem_read(address, length)).decode()

    def hook(uc, address, _size, _context):
        nonlocal steps
        if 0x145af3ef0 <= address < 0x145af46a6:
            steps += 1
            seen.add(address)
            return
        if address == stop:
            uc.emu_stop()
            return
        rcx, rdx, r8, r9, sp = [uc.reg_read(register) for register in (
            reg.UC_X86_REG_RCX, reg.UC_X86_REG_RDX, reg.UC_X86_REG_R8,
            reg.UC_X86_REG_R9, reg.UC_X86_REG_RSP)]
        if address == 0x145febc75:
            value = struct.unpack("<f", struct.pack("<I", uc.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff))[0]
            uc.reg_write(reg.UC_X86_REG_XMM0, bits(roundf(value)))
        elif address == 0x145aeaf60:
            # Current locale descriptor boundary; caller's key remains exact.
            uc.reg_write(reg.UC_X86_REG_RAX, 0)
            uc.reg_write(reg.UC_X86_REG_RDX, 0)
        elif address == 0x145fbe970:
            state["precision_format"] = {"address": hex(rdx),
                "hex": bytes(uc.mem_read(rdx, 48)).hex(), "function": hex(qword(r8 + 8))}
            value = float_at(qword(r8))
            state["fixed_bits"] = bits(value)
            state["fixed"] = format(value, ".1f")
            raw = state["fixed"].encode()
            uc.mem_write(heap + 0x3000, raw)
            uc.mem_write(rcx, struct.pack("<QQQ", len(raw), heap + 0x3000, len(raw)))
        elif address == 0x145aeb340:
            assert qword(sp + 0x28) == 1
            pointer, formatter = qword(r9 + 16), qword(r9 + 24)
            state["key"] = text_at(rdx, r8)
            state["formatter"] = hex(formatter)
            if "fixed" in state:
                state["value"] = state["fixed"]
            elif state["tag"] == 11:
                state["value"] = struct.unpack("<I", uc.mem_read(pointer, 4))[0]
            else:
                state["value_bits"] = bits(float_at(pointer))
        elif address != 0x1400021d0:
            raise AssertionError(f"Unexpected original call {address:#x}")
        uc.reg_write(reg.UC_X86_REG_RIP, qword(sp))
        uc.reg_write(reg.UC_X86_REG_RSP, sp + 8)
    machine.hook_add(UC_HOOK_CODE, hook)

    cases = []
    percent_bits = {bits(value) for value in (0.0, -0.0, .001, .015, .0195, .0745, .105, .12345, -.015, 1.234)}
    for boundary in (.0145, .0995, .1, -.1):
        percent_bits.update(bits(boundary) + delta for delta in (-1, 0, 1))
    fixed_bits = {bits(value) for value in (0.0, -0.0, 1.25, 1.5, 1.55, 12.45, -1.25, -1.5)}
    for boundary in (1.25, 12.45):
        fixed_bits.update(bits(boundary) + delta for delta in (-1, 0, 1))
    for tag in range(15):
        values = [0, 1, 2, 3, 255, 0xffffffff] if tag == 11 else sorted(fixed_bits if tag in (2, 7, 13) else percent_bits)
        for raw in values:
            state.clear(); state["tag"] = tag
            sp = stack + 0x1f008
            machine.mem_write(sp, struct.pack("<Q", stop))
            machine.reg_write(reg.UC_X86_REG_RSP, sp)
            machine.reg_write(reg.UC_X86_REG_RCX, heap)
            machine.reg_write(reg.UC_X86_REG_RDX, heap + 0x1000)
            machine.mem_write(heap + 0x1000, struct.pack("<II", tag, raw))
            machine.emu_start(0x145af3ef0, stop, count=10000)
            assert state["key"] == "bonus." + KEYS[tag]
            if tag == 11:
                assert state["value"] == raw
                assert state["formatter"] == "0x14765c0d0"
            else:
                value = struct.unpack("<f", struct.pack("<I", raw))[0]
                if tag in (7, 13):
                    expected = f32(value * 100.0) if tag == 13 else value
                    assert state["fixed_bits"] == bits(expected)
                    assert state["value"] == format(expected, ".1f")
                    assert state["formatter"] == "0x14765c108"
                    assert state["precision_format"] == proof["precision_format"]
                else:
                    percent = f32(value * 100.0)
                    expected = roundf(value) if tag == 2 else (
                        f32(roundf(f32(percent * 10.0)) / 10.0) if abs(percent) < 10.0 else roundf(percent))
                    assert state["value_bits"] == bits(expected), (tag, raw, state, expected)
                    assert state["formatter"] == "0x14765c138"
            cases.append({"input_bits": raw, **state})
    return {"cases": cases, "instruction_steps": steps, "distinct_executed_instructions": len(seen)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    proof = json.loads(MANIFEST.read_text())
    verifier = load_script("armory_stat_native_verify", ROOT / "scripts/check-coop-scaling.py")
    decoded = verifier.verify(proof)
    for binding in proof["source_bindings"]:
        bound = (ROOT / binding["path"]).read_text()
        at = bound.index(binding["start"])
        section = bound[at:bound.index(binding["end"], at)]
        assert hashlib.sha256(section.encode()).hexdigest() == binding["sha256"], binding["path"]
    result = replay(proof)
    source = (ROOT / "crates/azeroth-survivors-re/src/armory.rs").read_text()
    percent = source[source.index("pub(crate) fn native_percent("):source.index("pub(crate) fn native_decimal(")]
    bonus = source[source.index("pub(crate) fn localized_bonus("):source.index("fn load_art(")]
    for fragment in ("let percent = value * 100.", "(percent * 10.).round() / 10.", "percent.abs() < 10.", "percent.round()"):
        assert fragment in percent
    for name in KEYS:
        assert '"bonus.' + name + '"' in bonus
    for fragment in ('7 => format!("{value:.1}")', '13 => format!("{:.1}", value * 100.)',
                     '2 | 11 => format!("{:.0}", value.round())', "native_percent(value).trim_end_matches('%')"):
        assert fragment in bonus, fragment
    result.update(target=proof["target"], decoded_instructions=decoded,
                  source_connection_checked=True, compiled=False, target_executed=False,
                  seams=["roundf is a declared IEEE-f32 away-from-zero arithmetic seam.",
                         "Fixed one-decimal formatting and locale formatting are synthetic boundaries; final native strings do not execute."],
                  parity="unverified")
    output = MANIFEST.with_name("static-check.json")
    if args.write: output.write_text(json.dumps(result, indent=2) + "\n")
    else: assert result == json.loads(output.read_text())
    print(json.dumps({key: value for key, value in result.items() if key != "cases"} | {"case_count": len(result["cases"])}))


if __name__ == "__main__":
    main()
