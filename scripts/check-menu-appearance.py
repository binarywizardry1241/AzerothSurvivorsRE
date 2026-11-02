#!/usr/bin/env python3
"""Current optional-cache menu appearance cycle, randomizer and clock-seed replay."""
import argparse
import json
from native_save_fixture import CPU, ROOT
from unicorn.x86_const import UC_X86_REG_RBP, UC_X86_REG_RSP, UC_X86_REG_R8

DEST = ROOT / "docs/analysis/evidence/0.109.0/save-schema/appearance-controls.json"
MASK = (1 << 64) - 1


def pack(values):
    return sum(value << (i * 8) for i, value in enumerate(values))


def unpack(value):
    return [(value >> (i * 8)) & 255 for i in range(5)]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    cpu = CPU()
    cpu.allow_owner(0x1459A21A0)
    cpu.allow_owner(0x1459A2790)
    cycles = []
    randoms = []
    for counts in (None, {}, {(1, 0): (0, 2, 5, 1, 255)}):
        cpu.appearance_counts = counts
        fixture_counts = (
            None
            if counts is None
            else [dict(race=r, sex=s, values=v) for (r, s), v in counts.items()]
        )
        for race, sex in ((1, 0), (2, 0), (1, 1)):
            bounds = None if counts is None else counts.get((race, sex))
            for features in (
                (0, 0, 0, 0, 0),
                (255, 255, 255, 255, 255),
                (200, 3, 9, 0, 255),
            ):
                for index in range(5):
                    for delta in (-128, -1, 0, 1, 127):
                        expected = (
                            list(features)
                            if bounds is None
                            else [
                                min(value, max(bound - 1, 0))
                                for value, bound in zip(features, bounds)
                            ]
                        )
                        count = 1 if bounds is None else max(bounds[index], 1)
                        expected[index] = (expected[index] + delta) % count
                        actual = unpack(
                            cpu.call(
                                0x1459A21A0,
                                pack(features),
                                race,
                                sex,
                                index,
                                delta & MASK,
                            )
                        )
                        assert actual == expected
                        cycles.append(
                            dict(
                                counts=fixture_counts,
                                race=race,
                                sex=sex,
                                features=features,
                                index=index,
                                delta=delta,
                                expected=actual,
                            )
                        )
            for clock in (0, 1, 7, MASK, 0x9E3779B97F4A7C15):
                state = clock ^ 0x9E3779B97F4A7C15
                expected = []
                for index in range(5):
                    state = (state ^ (state << 13)) & MASK
                    state ^= state >> 7
                    state = (state ^ (state << 17)) & MASK
                    expected.append(
                        state % (1 if bounds is None else max(bounds[index], 1))
                    )
                actual = unpack(cpu.call(0x1459A2790, race, sex, clock))
                assert actual == expected
                randoms.append(
                    dict(
                        counts=fixture_counts,
                        race=race,
                        sex=sex,
                        clock=clock,
                        expected=actual,
                    )
                )
    cpu.allow_range(0x1401620F5, 0x140162118)
    cpu.stops.add(0x140162118)
    clock_cases = []
    for error, seconds, nanos in ((0, 2, 45), (1, 2, 45), (0, MASK, 999999999)):
        frame = cpu.S + 0x100000
        cpu.u.mem_write(frame + 0x90, bytes(32))
        cpu.u.mem_write(frame + 0x90, bytes([error]))
        cpu.put(frame + 0x98, seconds, nanos)
        cpu.u.reg_write(UC_X86_REG_RBP, frame)
        cpu.u.reg_write(UC_X86_REG_RSP, cpu.S + 0xF0000)
        cpu.u.emu_start(0x1401620F5, cpu.D, count=100)
        actual = cpu.reg(UC_X86_REG_R8)
        assert actual == (7 if error else (seconds * 1000000000 + nanos) & MASK)
        clock_cases.append(
            dict(error=error, seconds=seconds, nanos=nanos, expected=actual)
        )
    result = dict(cycles=cycles, randoms=randoms, clock_cases=clock_cases)
    if args.write:
        DEST.write_text(json.dumps(result, separators=(",", ":")) + "\n")
    else:
        assert json.loads(json.dumps(result)) == json.loads(DEST.read_text())
    print(
        f"Current appearance controls passed {len(cycles)} cycles, {len(randoms)} randomizers, {len(clock_cases)} clock-seed cases"
    )


if __name__ == "__main__":
    main()
