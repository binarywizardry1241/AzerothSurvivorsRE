#!/usr/bin/env python3
"""Check bounded 0.112.0 buff-potency instructions without building or launching.

Verifies selected PE ranges and jump-table destinations, then emulates isolated
stat/aura/shield/thorns arithmetic with synthetic inputs. This does not execute
the application, compile Rust, or establish original/rebuilt gameplay parity.
Default mode is read-only; --output writes observations only beneath runtime/.
"""
from native_recovery import f32 as _shared_f32
from script_sources import load_script

import argparse
import hashlib
import json
import math
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes

SHA = "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a"
EVIDENCE = ROOT / "docs/analysis/evidence/0.112.0/buff-potency"


def f32(value):
    return _shared_f32(value)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    output = (ROOT / args.output).resolve() if args.output else None
    if output and not output.is_relative_to(ROOT / "runtime"):
        raise ValueError("Observation output must remain under project runtime/")
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Current target differs from selected buff evidence"
    data = target_bytes(target)
    manifest = json.loads((EVIDENCE / "manifest.json").read_text())
    assert manifest["target_sha256"] == SHA
    pe_module = load_script("buff_pe", ROOT / "scripts/inventory-executable.py")
    pe = pe_module.PE(data)
    for row in manifest["ranges"]:
        address = int(row["address"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        raw = data[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16)
        assert hashlib.sha256(raw).hexdigest() == row["sha256"], row["role"]
    assembly = EVIDENCE / "selected-native.asm"
    assert hashlib.sha256(assembly.read_bytes()).hexdigest() == manifest["assembly_sha256"]
    for table in manifest["dispatch_tables"]:
        base = int(table["address"], 16)
        offset = pe.rva_offset(base - pe.image_base)
        for row in table["selected_entries"]:
            actual = base + struct.unpack_from("<i", data, offset + row["index"] * 4)[0]
            assert actual == int(row["destination"], 16), row

    sys.path[:0] = [str(ROOT / "runtime/armory-recovery/python-libs"),
                   str(ROOT / "runtime/camera-recovery-0.105.0/python-libs")]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as r
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    image_end = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    machine.mem_map(pe.image_base, (image_end + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section["rva"],
                          data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    memory, stack = 0x200000000, 0x300000000
    machine.mem_map(memory, 0x10000)
    machine.mem_map(stack, 0x10000)
    game, rows, frame = memory, memory + 0x3000, stack + 0x8000
    allowed = None
    executed = set()

    def put(address, fmt, *values):
        machine.mem_write(address, struct.pack("<" + fmt, *values))

    def xmm(index, value=None):
        register = getattr(r, "UC_X86_REG_XMM" + str(index))
        if value is not None:
            machine.reg_write(register, struct.unpack("<I", struct.pack("<f", value))[0])
        return struct.unpack("<f", (machine.reg_read(register) & 0xffffffff).to_bytes(4, "little"))[0]

    def hook(_, address, size, unused):
        assert any(a <= address < b for a, b in allowed), hex(address)
        executed.add(address)

    machine.hook_add(UC_HOOK_CODE, hook)

    def reset():
        machine.mem_write(memory, bytes(0x10000))
        machine.mem_write(stack, bytes(0x10000))
        for name in ("RAX", "RBX", "RCX", "RDX", "RDI", "RSI", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
            machine.reg_write(getattr(r, "UC_X86_REG_" + name), 0)
        machine.reg_write(r.UC_X86_REG_RBP, frame)
        machine.reg_write(r.UC_X86_REG_RSP, frame - 0x1000)
        machine.reg_write(r.UC_X86_REG_EFLAGS, 2)
        for index in range(16):
            xmm(index, 0.0)

    def run(start, stop, ranges):
        nonlocal allowed
        allowed = ranges
        machine.emu_start(start, stop, count=10000)
        assert machine.reg_read(r.UC_X86_REG_RIP) == stop

    cases = []
    for tag in (21, 23):
        for rank in (1, 2, 3, 4, 5):
            reset()
            amount = f32(f32(0.06) * rank)
            put(rows, "If", tag, amount)
            machine.reg_write(r.UC_X86_REG_R14, rows)
            machine.reg_write(r.UC_X86_REG_R13, 1)
            machine.reg_write(r.UC_X86_REG_RBX, 8)
            xmm(11, 0.25)
            run(0x1458f30c5, 0x1458f3107,
                [(0x1458f30c5, 0x1458f3107), (0x1458f3970, 0x1458f3aaf)])
            result = xmm(11)
            assert result == (f32(0.25 + amount) if tag == 23 else 0.25)
            cases.append(dict(kind="stat", stat=tag, rank=rank, amount=amount,
                              initial_buff_bonus=0.25, native_buff_bonus=result))

    for jewelry_bonus in (0.0, 0.2, 0.4):
        for rank in (1, 2, 3, 4, 5):
            reset()
            amount = f32(f32(0.06) * rank)
            xmm(9, jewelry_bonus)
            run(0x1458f3956, 0x1458f3963, [(0x1458f3956, 0x1458f3963)])
            put(rows, "If", 23, amount)
            machine.reg_write(r.UC_X86_REG_R14, rows)
            machine.reg_write(r.UC_X86_REG_R13, 1)
            machine.reg_write(r.UC_X86_REG_RBX, 8)
            run(0x1458f30af, 0x1458f3107,
                [(0x1458f30af, 0x1458f3107), (0x1458f3970, 0x1458f3aaf)])
            result = xmm(11)
            assert result == f32(f32(jewelry_bonus) + amount)
            cases.append(dict(kind="jewelry_and_stat", jewelry_stat=17, jewelry_bonus=f32(jewelry_bonus),
                              talent_stat=23, talent_rank=rank, talent_amount=amount,
                              native_buff_bonus=result))

    aura_sets = [
        [(8, 0.2, 0, 11.0)], [(9, 0.3, 0, 11.0)],
        [(8, 0.2, 0, 10.0), (9, 0.3, 0, 9.0)],
        [(0, 0.7, 23505, 11.0), (0, 0.7, 23451, 11.0)],
        [(7, 0.8, 0, 11.0), (6, 0.9, 0, 11.0),
         (10, 0.4, 0, 11.0), (11, 0.5, 0, 11.0), (12, 0.6, 0, 11.0)],
        [(8, 0.2, 23505, 11.0), (9, 0.3, 23451, 11.0),
         (8, 0.1, 0, 11.0), (9, 0.4, 0, 11.0)],
    ]
    for bonus in (0.0, f32(0.06), f32(f32(0.06) * 5), 0.55):
        for auras in aura_sets:
            reset()
            machine.reg_write(r.UC_X86_REG_RSI, game)
            put(game + 0xa4c, "f", 10.0)
            put(game + 0x390, "QQ", rows, len(auras))
            for index, (tag, magnitude, spell, deadline) in enumerate(auras):
                put(rows + index * 24, "IffIff", tag, magnitude, 42.0, spell, deadline, 17.0)
            original_rows = bytes(machine.mem_read(rows, len(auras) * 24))
            xmm(11, bonus)
            xmm(12, 1.25)
            xmm(4, 0.2)
            put(frame - 0x10, "f", 1.5)
            run(0x1458f3107, 0x1458f3234, [(0x1458f3107, 0x1458f3234)])
            strength = f32(1.0 + bonus)
            damage, recovery, movement = f32(1.25), f32(0.2), f32(1.5)
            for tag, magnitude, spell, deadline in auras:
                if not 10.0 < deadline:
                    continue
                if tag == 8:
                    damage = f32(damage + f32(f32(magnitude) * strength))
                elif tag == 9:
                    recovery = f32(recovery + f32(f32(magnitude) * strength))
                if spell == 23505:
                    damage = f32(damage + 0.5)
                if spell == 23451:
                    movement = f32(movement + f32(0.6))
            actual = [xmm(12), xmm(4), struct.unpack("<f", machine.mem_read(frame - 0x10, 4))[0]]
            assert actual == [damage, recovery, movement], (auras, bonus, actual)
            assert bytes(machine.mem_read(rows, len(auras) * 24)) == original_rows
            cases.append(dict(kind="auras", buff_bonus=bonus, auras=[list(row) for row in auras],
                              native_damage=actual[0], native_recovery=actual[1], native_movement=actual[2],
                              stored_aura_rows_unchanged=True))

    # Isolate current shield's final potency multiplication. The producer has
    # already computed its root-power/HP/effect-scaled amount into XMM1.
    for bonus in (0.0, f32(0.06), f32(f32(0.06) * 5), 0.55):
        for amount in (12.5, 375.0):
            reset()
            machine.reg_write(r.UC_X86_REG_RDI, game)
            put(game + 0x4c0, "f", bonus)
            xmm(1, amount)
            run(0x1459281af, 0x1459281cb, [(0x1459281af, 0x1459281cb)])
            actual = xmm(0)
            assert actual == f32(f32(1.0 + bonus) * amount)
            cases.append(dict(kind="shield", buff_bonus=bonus, prepared_amount=amount,
                              native_amount=actual))

    for bonus in (0.0, f32(0.06), f32(f32(0.06) * 5), 0.55):
        for health, effect, effect_multiplier, power, talent_power in (
                (537.25, 0.18, 1.3, 1.2, 1.15), (1200.0, 0.3, 1.5, 2.1, 1.4)):
            reset()
            machine.reg_write(r.UC_X86_REG_RDI, game)
            put(game + 0x4c0, "f", bonus)
            prepared_fraction = f32(f32(effect_multiplier) * f32(effect))
            xmm(0, health)
            xmm(1, prepared_fraction)
            xmm(9, power)
            xmm(11, talent_power)
            run(0x14592818b, 0x1459281cb, [(0x14592818b, 0x1459281cb)])
            root = f32(math.sqrt(f32(f32(power) * f32(talent_power))))
            prepared_amount = f32(f32(root * f32(1.4)) * f32(f32(health) * prepared_fraction))
            actual = xmm(0)
            assert actual == f32(f32(1.0 + bonus) * prepared_amount)
            cases.append(dict(kind="shield_full_order", buff_bonus=bonus, maximum_health=health,
                              effect=effect, effect_multiplier=effect_multiplier, power=power,
                              talent_power=talent_power, native_amount=actual))

    for bonus in (0.0, f32(0.06), f32(f32(0.06) * 5), 0.55):
        for outgoing_damage in (1.0, 1.75):
            reset()
            machine.reg_write(r.UC_X86_REG_R13, game)
            put(game + 0x4c0, "f", bonus)
            put(game + 0x484, "f", outgoing_damage)
            xmm(2, 23.0)
            run(0x1458ed7a8, 0x1458ed7c6, [(0x1458ed7a8, 0x1458ed7c6)])
            actual = xmm(2)
            assert actual == f32(f32(23.0 * f32(1.0 + bonus)) * outgoing_damage)
            cases.append(dict(kind="thorns", buff_bonus=bonus, prepared_amount=23.0,
                              outgoing_damage=outgoing_damage, native_amount=actual))

    thorns_sets = [
        [(13, 0.4, 101, 9.0), (13, 0.2, 202, 11.0), (13, 0.6, 303, 12.0)],
        [(12, 0.9, 404, 12.0), (13, 0.3, 505, 11.0)],
        [(13, 0.6, 606, 12.0)],
    ]
    for bonus in (0.0, f32(0.06), f32(f32(0.06) * 5), 0.55):
        for auras in thorns_sets:
            reset()
            machine.reg_write(r.UC_X86_REG_R13, game)
            machine.reg_write(r.UC_X86_REG_RBX, 1)  # physical incoming hit
            put(frame + 0x90, "Q", 123)  # nonzero actual attacker GUID
            put(game + 0x390, "QQ", rows, len(auras))
            put(game + 0x4c0, "f", bonus)
            put(game + 0x484, "f", 1.75)
            xmm(8, 10.0)
            for index, (tag, magnitude, spell, deadline) in enumerate(auras):
                put(rows + index * 24, "IffIff", tag, magnitude, 42.0, spell, deadline, 0.0)
            run(0x1458ecb21, 0x1458ed7c6,
                [(0x1458ecb21, 0x1458ecc20), (0x1458ed7a2, 0x1458ed7c6)])
            power = f32(-0.0)
            for tag, magnitude, spell, deadline in auras:
                if tag == 13 and 10.0 < deadline:
                    power = f32(power + f32(magnitude))
            actual, spell_id = xmm(2), machine.reg_read(r.UC_X86_REG_R9)
            assert actual == f32(f32(power * f32(1.0 + bonus)) * 1.75)
            assert spell_id == next(spell for tag, _, spell, _ in auras if tag == 13)
            cases.append(dict(kind="thorns_sum_and_attribution", buff_bonus=bonus,
                              auras=[list(row) for row in auras], outgoing_damage=1.75,
                              native_amount=actual, native_spell_id=spell_id))

    result = dict(target_version=target["version"], target_sha256=SHA, cases=cases,
                  instruction_address_count=len(executed), target_process_launched=False,
                  compilation="not_run", gameplay_and_parity="unverified")
    retained = json.loads((EVIDENCE / "bounded-cases.json").read_text())
    assert result == retained, "Native observations differ from retained bounded fixtures"
    if output:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(result, indent=2) + "\n")
    print(f"Verified 0.112.0 buff potency: {len(cases)} bounded native cases, "
          f"{len(manifest['ranges'])} exact ranges; no build or application launch.")


if __name__ == "__main__":
    main()
