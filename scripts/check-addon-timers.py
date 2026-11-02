#!/usr/bin/env python3
"""Check 0.115.0 timer evidence and execute the unchanged native row selector.

This runs isolated x86 instructions in Unicorn over synthetic Game/effect/stat/
deadline/counter vectors. It never compiles or starts a process, game or addon.
The sole intercepted call is Vec reserve, an explicit storage-allocation seam.
"""

import argparse
import hashlib
import json
import math
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
EVIDENCE = ROOT / "docs/analysis/evidence/0.115.0/addon-timers"
SELECTOR = 0x1459721C0
RESERVE = 0x145D150F0


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False, allow_nan=False) + "\n"


def f32(value):
    try:
        return struct.unpack("<f", struct.pack("<f", value))[0]
    except OverflowError:
        return math.copysign(math.inf, value)


def bits(value):
    return struct.pack("<f", value).hex()


def x86_max(left, right):
    # MAXSS selects its second operand on unordered or equal operands.
    return right if math.isnan(left) or math.isnan(right) or left <= right else left


def non_nan_max(left, right):
    # Tag 34 follows MAXSS with an unordered-result mask selecting its product.
    value = x86_max(left, right)
    return left if math.isnan(value) else value


def effect(tag, at4=1.25, at8=2.5, at12=3.75):
    return dict(tag=tag, at4=f32(at4), at8=f32(at8), at12=f32(at12))


def expected_rows(effects, deadlines, counters, stats, cooldown, clock, lethal):
    stat_sum = -0.0
    for tag, value in stats:
        if tag == 32:
            stat_sum = f32(stat_sum + value)
    supremacy = stat_sum > 0.0
    rows = []
    for ordinal, value in enumerate(effects):
        tag = value["tag"]
        deadline = deadlines[ordinal] if ordinal < len(deadlines) else 0.0
        if tag in (0, 10, 16, 17):
            wait = value["at4" if tag == 10 else "at8"]
            if not wait > 0.0:
                continue
            kind, ready = "cooldown", deadline
        elif tag == 19:
            kind, ready, wait = "cooldown", lethal, value["at4"]
        elif tag == 32:
            wait = 12.0 if supremacy else x86_max(f32(value["at4"] * cooldown), 4.0)
            kind, ready = "summon", deadline
        elif tag == 34:
            wait = non_nan_max(f32(value["at8"] * cooldown), value["at12"])
            active = ordinal < len(counters) and counters[ordinal] != 0
            kind, ready = "summon", f32(deadline + wait) if active else clock
        else:
            continue
        rows.append(dict(kind=kind, ordinal=ordinal, ready=ready, wait=wait))
    return rows


def row_record(row):
    return dict(kind=row["kind"], ordinal=row["ordinal"],
                ready_f32_le=bits(row["ready"]), wait_f32_le=bits(row["wait"]))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="retain checked native cases")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA and target["version"] == "0.115.0"
    data = target_bytes(target)
    pe = load_script("timer115_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        assert offset is not None and 0 <= offset <= len(data) - size, hex(address)
        return data[offset:offset + size]

    manifest = json.loads((EVIDENCE / "manifest.json").read_text())
    assert manifest["target"]["sha256"] == SHA
    assert manifest["target"]["size"] == len(data)
    checked_ranges = []
    for row in manifest["native_ranges"] + manifest["extra_ranges"]:
        address, size = int(row["va"], 16), row["size"]
        original = raw(address, size)
        assert hashlib.sha256(original).hexdigest() == row["sha256"], row["role"]
        assert pe.rva_offset(address - pe.image_base) == int(row["file_offset"], 16)
        if row.get("bytes_hex") is not None:
            assert original.hex() == row["bytes_hex"], row["role"]
        if "assembly" in row:
            assert hashlib.sha256((EVIDENCE / row["assembly"]).read_bytes()).hexdigest() == row["assembly_sha256"]
        checked_ranges.append(dict(role=row["role"], va=row["va"], size=size, sha256=row["sha256"]))
    for row in manifest["rea"]:
        assert hashlib.sha256((EVIDENCE / row["pseudocode"]).read_bytes()).hexdigest() == row["pseudocode_sha256"]
    api = manifest["embedded_api"]
    assert hashlib.sha256(raw(int(api["va"], 16), api["size"])).hexdigest() == api["sha256"]
    definitions = manifest["talent_definitions"]
    assert hashlib.sha256((EVIDENCE / definitions["path"]).read_bytes()).hexdigest() == definitions["sha256"]
    switch = struct.unpack("<35i", raw(0x14733303C, 140))
    expected_targets = {0: 0x1459723A9, 10: 0x1459724BD, 16: 0x1459723A9,
                        17: 0x1459723A9, 19: 0x1459724FA, 32: 0x1459723BB,
                        34: 0x145972409}
    assert [0x14733303C + item for item in switch] == [expected_targets.get(tag, 0x14597237E) for tag in range(35)]

    sys.path[:0] = [str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"),
                   str(ROOT / "runtime/armory-recovery/python-libs")]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as registers

    class Probe:
        GAME, EFFECTS, DEADLINES, COUNTERS, STATS = 0x30000000, 0x30002000, 0x30008000, 0x30009000, 0x3000A000
        OUTPUT, ROWS, STACK, RETURN = 0x3000C000, 0x30010000, 0x20018008, 0x20000000

        def __init__(self):
            self.u = Uc(UC_ARCH_X86, UC_MODE_64)
            self.u.mem_map(0x20000000, 0x20000)
            self.u.mem_map(0x30000000, 0x20000)
            self.allocations = 0
            self.returned = False
            self.u.hook_add(UC_HOOK_MEM_UNMAPPED, self.missing)
            self.u.hook_add(UC_HOOK_CODE, self.hook)

        def missing(self, machine, access, address, size, value, _):
            page = address & ~4095
            assert pe.image_base <= page < pe.image_base + 0x10000000, hex(address)
            machine.mem_map(page, 4096)
            machine.mem_write(page, raw(page, 4096))
            return True

        def put(self, address, *values):
            self.u.mem_write(address, struct.pack("<" + "Q" * len(values), *values))

        def readq(self, address):
            return struct.unpack("<Q", self.u.mem_read(address, 8))[0]

        def hook(self, machine, address, size, _):
            if address == self.RETURN:
                self.returned = True
                machine.emu_stop()
            elif address == RESERVE:
                # Native Vec is [capacity, pointer, length]. Allocate storage only;
                # row selection, output fields, length and order remain native.
                vector = machine.reg_read(registers.UC_X86_REG_RCX)
                assert self.readq(vector) == 0 and self.readq(vector + 16) == 0
                self.put(vector, 256, self.ROWS, 0)
                self.allocations += 1
                stack = machine.reg_read(registers.UC_X86_REG_RSP)
                machine.reg_write(registers.UC_X86_REG_RIP, self.readq(stack))
                machine.reg_write(registers.UC_X86_REG_RSP, stack + 8)

        def run(self, effects, deadlines, counters, stats, cooldown, clock, lethal):
            for index, row in enumerate(effects):
                value = bytearray(64)
                value[0] = row["tag"]
                struct.pack_into("<fff", value, 4, row["at4"], row["at8"], row["at12"])
                self.u.mem_write(self.EFFECTS + 64 * index, bytes(value))
            for address, values, form in [(self.DEADLINES, deadlines, "f"), (self.COUNTERS, counters, "i")]:
                if values:
                    self.u.mem_write(address, struct.pack("<" + form * len(values), *values))
            for index, (tag, value) in enumerate(stats):
                self.u.mem_write(self.STATS + 8 * index, struct.pack("<B3xf", tag, value))
            self.put(self.GAME + 0x70, self.DEADLINES if deadlines else 0, len(deadlines))
            self.put(self.GAME + 0x88, self.COUNTERS if counters else 0, len(counters))
            self.put(self.GAME + 0x808, self.STATS if stats else 0, len(stats))
            self.put(self.GAME + 0x838, self.EFFECTS if effects else 0, len(effects))
            for offset, value in [(0x498, cooldown), (0xB9C, clock), (0x198, lethal)]:
                self.u.mem_write(self.GAME + offset, struct.pack("<f", value))
            self.put(self.STACK, self.RETURN)
            for register, value in [(registers.UC_X86_REG_RSP, self.STACK),
                                    (registers.UC_X86_REG_RCX, self.OUTPUT),
                                    (registers.UC_X86_REG_RDX, self.GAME)]:
                self.u.reg_write(register, value)
            self.u.emu_start(SELECTOR, 0, count=100000)
            assert self.returned, "selector instruction budget exhausted"
            capacity, pointer, count = struct.unpack("<QQQ", self.u.mem_read(self.OUTPUT, 24))
            assert capacity == (256 if count else 0)
            assert pointer == (self.ROWS if count else 8)
            assert self.allocations == bool(count)
            result = []
            for index in range(count):
                kind_ptr, kind_len, ordinal, ready, wait = struct.unpack("<QQQff", self.u.mem_read(pointer + 32 * index, 32))
                result.append(dict(kind=raw(kind_ptr, kind_len).decode(), ordinal=ordinal, ready=ready, wait=wait))
            return result

    cases = []

    def check(label, effects, deadlines=(), counters=(), stats=(), cooldown=1.0, clock=20.0, lethal=123.0):
        assert len(effects) < 256
        deadlines = list(map(f32, deadlines))
        stats = [(tag, f32(value)) for tag, value in stats]
        cooldown, clock, lethal = map(f32, [cooldown, clock, lethal])
        actual = Probe().run(effects, deadlines, counters, stats, cooldown, clock, lethal)
        expected = expected_rows(effects, deadlines, counters, stats, cooldown, clock, lethal)
        assert len(actual) == len(expected), (label, actual, expected)
        for found, wanted in zip(actual, expected):
            assert found["kind"] == wanted["kind"] and found["ordinal"] == wanted["ordinal"], label
            for field in ("ready", "wait"):
                assert (math.isnan(found[field]) and math.isnan(wanted[field])) or bits(found[field]) == bits(wanted[field]), (label, field, found, wanted)
        cases.append(dict(case=label,
                          effects=[dict(tag=row["tag"], at4_f32_le=bits(row["at4"]), at8_f32_le=bits(row["at8"]), at12_f32_le=bits(row["at12"])) for row in effects],
                          deadlines_f32_le=list(map(bits, deadlines)), counters=list(counters),
                          stats=[dict(tag=tag, value_f32_le=bits(value)) for tag, value in stats],
                          cooldown_f32_le=bits(cooldown), clock_f32_le=bits(clock), lethal_f32_le=bits(lethal),
                          rows=list(map(row_record, actual))))

    check("empty-equipment", [])
    for tag in [*range(35), 35, 255]:
        check(f"switch-tag-{tag}", [effect(tag)], deadlines=[40.0])
    check("all-tags-in-order", [effect(tag) for tag in range(36)], deadlines=range(36), counters=[1] * 36)
    for tag in [0, 10, 16, 17]:
        for wait in [-math.inf, -2.0, -0.0, 0.0, 0.25, 2.0, math.inf, math.nan]:
            check(f"ordinary-{tag}-{bits(wait)}", [effect(tag, at4=wait, at8=wait)], deadlines=[40.0])
        for deadline in [None, -math.inf, -0.0, 0.25, math.inf, math.nan]:
            check(f"ordinary-deadline-{tag}-{bits(deadline) if deadline is not None else 'missing'}", [effect(tag)], deadlines=[] if deadline is None else [deadline])
    for wait in [-math.inf, -2.0, -0.0, 0.0, 2.0, math.inf, math.nan]:
        for lethal in [-0.0, 123.0, math.nan]:
            check(f"lethal-{bits(wait)}-{bits(lethal)}", [effect(19, at4=wait)], deadlines=[777.0], lethal=lethal)
    for base in [-math.inf, -1.0, -0.0, 0.0, 1.0, 10.0, math.inf, math.nan]:
        for cooldown in [-2.0, 0.0, 0.5, 1.0, 2.0, math.inf, math.nan]:
            check(f"gate-product-{bits(base)}-{bits(cooldown)}", [effect(32, at4=base)], deadlines=[40.0], cooldown=cooldown)
    stat_cases = [[], [(31, 100)], [(32, 0)], [(32, -0.0)], [(32, 1)], [(32, -1)],
                  [(32, math.nan)], [(32, math.inf)], [(32, -math.inf)],
                  [(32, 1), (32, -1)], [(32, 1), (31, 100), (32, -2)],
                  [(32, 33554432), (32, 1), (32, -33554432)],
                  [(32, 33554432), (32, -33554432), (32, 1)],
                  [(32, 1), (32, 2), (32, -2)], [(31, math.nan), (32, 1)]]
    for index, stats in enumerate(stat_cases):
        check(f"gate-stat-sum-{index}", [effect(32, at4=20.0)], deadlines=[40.0], stats=stats, cooldown=0.5)
    for deadline in [None, -0.0, -2.0, math.inf, math.nan]:
        check(f"gate-deadline-{bits(deadline) if deadline is not None else 'missing'}", [effect(32)], deadlines=[] if deadline is None else [deadline])
    summon_cases = [(30, 1, 13), (30, 0.25, 13), (30, 0, 13), (30, -1, 13),
                    (30, math.nan, 13), (math.nan, 1, 13), (30, 1, math.nan),
                    (math.nan, 1, math.nan), (30, math.inf, 13), (math.inf, 0, 13),
                    (-math.inf, 1, 13), (30, 1, math.inf), (30, 1, -math.inf),
                    (0, 1, -0.0), (-0.0, 1, 0), (-0.0, 1, -0.0),
                    (-1, 1, -2), (13, 1, 13), (math.inf, 1, math.nan),
                    (-math.inf, 1, math.nan), (1, math.nan, -math.inf)]
    for index, (base, cooldown, floor) in enumerate(summon_cases):
        for active in [None, 0, 1, -1]:
            check(f"summon-wait-{index}-activity-{active}", [effect(34, at8=base, at12=floor)],
                  deadlines=[40.0], counters=[] if active is None else [active], cooldown=cooldown)
    for deadline in [None, -math.inf, -0.0, 0.0, 40.0, math.inf, math.nan]:
        check(f"summon-active-deadline-{bits(deadline) if deadline is not None else 'missing'}", [effect(34, at8=30, at12=13)],
              deadlines=[] if deadline is None else [deadline], counters=[1], clock=88.0)
    for clock in [-math.inf, -0.0, 0.0, 2.0, math.inf, math.nan]:
        check(f"summon-inactive-clock-{bits(clock)}", [effect(34)], counters=[0], clock=clock)
    check("short-vectors-use-effect-ordinals", [effect(255), effect(0), effect(34), effect(19), effect(32), effect(34)],
          deadlines=[99.0, 42.0, 45.0], counters=[0, 0, 1])
    check("duplicates-and-omissions-retain-order", [effect(0), effect(0), effect(255), effect(10, at4=0), effect(32), effect(34), effect(34), effect(19)],
          deadlines=[1, 2, 3, 4, 5, 6, 7, 8], counters=[0, 0, 0, 0, 0, 1, 0, 0])

    result = dict(target_sha256=SHA, selector=hex(SELECTOR), checked_ranges=checked_ranges,
                  case_count=len(cases), cases=cases,
                  limits=["The full unchanged 0x1459721c0 selector executes in Unicorn with synthetic current-layout state; no game, addon or reconstructed Rust executes.",
                          "0x145d150f0 Vec reserve is the only intercepted call: it supplies an initially empty 256-row storage block without native allocator execution.",
                          "Code/data ranges, canonical assembly/decompiler files, embedded API and talent catalog hashes are checked against the installed hash-bound EXE.",
                          "The numeric oracle independently expresses observed x86 f32 operations; NaN outputs are checked as NaN without constraining payload/sign.",
                          "Formatting, metadata/localization construction, publication/delivery, compilation and original/rebuilt gameplay or visual parity are outside this instruction probe."])
    path = EVIDENCE / "native-cases.json"
    if args.write:
        path.write_text(encoded(result))
    else:
        assert result == json.loads(path.read_text()), "retained native cases differ"
    print(f"0.115.0 timers: {len(cases)} full native-selector cases; {len(checked_ranges)} code/data ranges and canonical evidence verified; no build/game")


if __name__ == "__main__":
    main()
