#!/usr/bin/env python3
"""Replay the selected EXE's flat locale parser without a build or game.

The real parser, string, expectation and hex instructions execute. Allocation,
vector growth, valid-UTF8 conversion, formatting and copying are explicit host
seams. --collect stages compact fixtures; --check checks their retained copy.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import latest_target, target_bytes

ROOT = Path(__file__).resolve().parents[1]
SHA = "dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b"
WORK = ROOT / "runtime/analysis/history/interface/locale-overrides/f85c9ec06bba"
RETAINED = ROOT / "docs/analysis/evidence/localization-overrides"
RANGES = {"parser": (0x1458E6A10, 0x1458E70AE),
          "string": (0x1458E2970, 0x1458E31AE),
          "expect": (0x1458E2760, 0x1458E292E),
          "hex": (0x1458E22B0, 0x1458E2754)}


def replay(data, pe):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s["rva"], data[s["raw_offset"]:s["raw_offset"] + s["raw_size"]])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(heap, 0x800000)
    u.mem_map(stack, 0x200000)
    u.mem_map(done, 4096)
    cursor, instructions = heap, 0

    def reg(key):
        return u.reg_read(key)

    def q(at):
        return struct.unpack("<Q", u.mem_read(at, 8))[0]

    def put(at, *values):
        u.mem_write(at, struct.pack("<" + "Q" * len(values), *(v & ((1 << 64) - 1) for v in values)))

    def alloc(count):
        nonlocal cursor
        assert 0 <= count <= 0x100000
        at = cursor
        cursor += (count + 31) & ~15
        assert cursor < heap + 0x800000
        return at

    def string(value):
        value = value.encode()
        at = alloc(len(value))
        if value:
            u.mem_write(at, value)
        return len(value), at, len(value)

    def read(at, count):
        assert count < 0x100000
        return bytes(u.mem_read(at, count)).decode()

    def grow(vector, count, stride):
        capacity, pointer, length = (q(vector + i * 8) for i in range(3))
        capacity = max(capacity * 2, length + count, 8)
        result = alloc(capacity * stride)
        if length:
            u.mem_write(result, bytes(u.mem_read(pointer, length * stride)))
        put(vector, capacity, result, length)

    def hook(_, pc, size, __):
        nonlocal instructions
        if pc == done:
            u.emu_stop()
            return
        instructions += 1
        rcx, rdx, r8, r9 = (reg(key) for key in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8, r.UC_X86_REG_R9))
        if any(a <= pc < b for a, b in RANGES.values()):
            return
        if pc == 0x1400021C0:
            u.reg_write(r.UC_X86_REG_RAX, alloc(rcx))
        elif pc in (0x140002200, 0x1400021D0):
            pass
        elif pc == 0x145D933F0:
            grow(rcx, 1, 1)
        elif pc == 0x145BF4D90:
            grow(rcx, 1, 48)
        elif pc == 0x145BF4A90:
            grow(rcx, r8, q(reg(r.UC_X86_REG_RSP) + 0x28))
        elif pc == 0x145BF293B:
            if r8:
                u.mem_write(rcx, bytes(u.mem_read(rdx, r8)))
            u.reg_write(r.UC_X86_REG_RAX, rcx)
        elif pc == 0x145BCDEB0:
            # All inputs here originate in valid UTF-8 files or native escaped
            # scalars. Assert that seam rather than fabricate invalid-byte IO.
            read(rdx, r8)
            put(rcx, 0, rdx, r8)
        elif pc == 0x145BC5690:
            fmt = bytes(u.mem_read(rdx, 16))
            if fmt.startswith(b"\x09expected "):
                value = "expected " + chr(struct.unpack("<I", u.mem_read(q(r8), 4))[0])
            else:
                assert fmt.startswith(b"\x05line "), (hex(rdx), fmt)
                line = q(q(r8))
                reason = q(r8 + 16)
                value = f"line {line}: " + read(q(reason), q(reason + 8))
            put(rcx, *string(value))
        else:
            raise AssertionError(f"Unreviewed native instruction/callee {pc:#x}")
        sp = reg(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RIP, q(sp))
        u.reg_write(r.UC_X86_REG_RSP, sp + 8)

    u.hook_add(UC_HOOK_CODE, hook)
    inputs = [
        "{}", ' \t\r\n{ "a" : "b" } ', '{"":"","a":""}',
        '{"a":"first","a":"last"}', '{"_comment":"ignored","a":"b"}',
        '{"_comment":"ignored"}', '{"\\u005fmeta":"ignored"}',
        '\ufeff\ufeff{"a":"b"}', '{} trailing input', '{"a":"b"} trailing input',
        '{"a":"é日本語🌍"}', '{"a":"raw\n\t\x00control"}',
        r'{"a":"\"\\\/\b\f\n\r\t"}', r'{"a":"\u00e9\u20AC"}',
        r'{"a":"\uD83D\uDE00"}', r'{"a":"\uD800"}', r'{"a":"\uDC00"}',
        r'{"a":"\uD800\u0041"}', r'{"a":"\uDBFF\uFFFF"}', r'{"a":"\u+041"}',
        "", " ", "[]", "{", '{"a"', '{"a":', '{"a":"b"', '{"a":"b",}',
        '{"a":1}', '{"a":true}', '{"a":null}', '{"a":{}}',
        '{"_comment":1}', '{"a":"b" "c":"d"}', ' \ufeff{}',
        r'{"a":"\q"}', r'{"a":"\uZ123"}', r'{"a":"\u12"}',
        r'{"a":"\uD800\uZZZZ"}', '{"a":"\\',
        '{\n"a": "b",\n"bad": false}', '{\n"a"\n"b"}',
        '\v{}', '\u00a0{}', '{"a":"b",\n}',
    ]
    # Every truncation boundary of an escaped string, including a surrogate pair.
    sample = r'{"x":"\uD83D\uDE00"}'
    inputs += [sample[:i] for i in range(len(sample))]
    cases = []
    for value in dict.fromkeys(inputs):
        cursor = heap
        _, pointer, count = string(value)
        output = alloc(32)
        sp = stack + 0x1F0000 - 8
        put(sp, done)
        u.reg_write(r.UC_X86_REG_RSP, sp)
        u.reg_write(r.UC_X86_REG_RCX, output)
        u.reg_write(r.UC_X86_REG_RDX, pointer)
        u.reg_write(r.UC_X86_REG_R8, count)
        u.emu_start(RANGES["parser"][0], 0, count=200000)
        assert reg(r.UC_X86_REG_RIP) == done
        row = dict(input=value)
        if q(output) == 1:
            row["error"] = read(q(output + 16), q(output + 24))
        else:
            assert q(output) == 0
            entries = {}
            for index in range(q(output + 24)):
                record = q(output + 16) + index * 48
                entries[read(q(record + 8), q(record + 16))] = read(q(record + 32), q(record + 40))
            row["entries"] = entries
        cases.append(row)
    return cases, instructions


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    modes = parser.add_mutually_exclusive_group(required=True)
    modes.add_argument("--collect", action="store_true")
    modes.add_argument("--check", action="store_true")
    parser.add_argument("--evidence-dir", type=Path, default=RETAINED)
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "A new target requires independent recovery"
    data = target_bytes(target)
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    cases, count = replay(data, pe)
    spans = {}
    for role, (start, end) in RANGES.items():
        offset = pe.rva_offset(start - pe.image_base)
        spans[role] = dict(start=hex(start), end_exclusive=hex(end), file_offset=hex(offset),
                           sha256=hashlib.sha256(data[offset:offset + end - start]).hexdigest())
    evidence = dict(target_sha256=SHA, target_process_launched=False, native_ranges=spans,
                    instruction_count=count, cases=cases,
                    limits=["Original parser/string/expect/hex instructions with allocator, vector, copy, UTF-8 validation and formatting seams.",
                            "No file IO, rebuilt Rust, game, renderer or original/rebuilt parity executes."])
    output = (WORK if args.collect else args.evidence_dir.resolve()) / "parser-vectors.json"
    assert output.is_relative_to(ROOT)
    if args.collect:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(evidence, ensure_ascii=False, indent=2) + "\n")
    else:
        assert json.loads(output.read_text()) == evidence
    print(f"Verified {len(cases)} original parser cases / {count} instructions")


if __name__ == "__main__":
    main()
