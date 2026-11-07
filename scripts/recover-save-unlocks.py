#!/usr/bin/env python3
"""Check beaten-zone unlock restoration using bounded unchanged 0.105.0 instructions.

No build or application runs. Pipe-split fields and existing typed unlocks are
explicit inputs; allocation, envelope IO, sorting and the full loader are outside
the emulator. Fresh evidence is staged in runtime/ for review.
"""
from portable_paths import objdump_output, portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/progression/save-unlock/58edea489ca1/curated"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/save-unlocks"
SPANS = {
    "beat-record": (0x145889778, 0x145889916),
    "beat-key-collector": (0x145996570, 0x145996879),
    "zone-key": (0x1458D6970, 0x1458D6B1B),
    "unlock-merge-tail": (0x1458895CE, 0x14588964F),
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected EXE hash mismatch"
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    end = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (end + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s["rva"], data[s["raw_offset"]:s["raw_offset"] + s["raw_size"]])
    mem, done = 0x20000000, 0x30000000
    u.mem_map(mem, 0x10000)
    u.mem_map(done, 4096)
    frame, fields_at, text_at, pairs_at, unlocks_at = (mem + n for n in (0x1000, 0x3000, 0x4000, 0x6000, 0x8000))
    state = {}

    def raw(a, n):
        off = pe.rva_offset(a - pe.image_base)
        return data[off:off + n]

    def put(a, fmt, *values):
        u.mem_write(a, struct.pack(fmt, *values))

    def reg(name, value):
        u.reg_write(getattr(x, "UC_X86_REG_" + name), value)

    def hook(_, address, size, unused):
        if address in state["stops"]:
            state["stop"] = address
            u.emu_stop()
            return
        assert any(a <= address < address + size <= b for a, b in state["ranges"]), hex(address)
        assert bytes(u.mem_read(address, size)) == raw(address, size)
        # Every external call is forbidden; all tested vectors have spare capacity.
        assert raw(address, 1) != b"\xe8", f"Unexpected call {address:#x}"

    u.hook_add(UC_HOOK_CODE, hook)

    def run(start, stops, ranges):
        state.clear()
        state.update(stops=stops, ranges=ranges)
        u.emu_start(start, done + 1, count=100000)
        assert "stop" in state, "Instruction budget exhausted"
        return state["stop"]

    def parse_class(fields):
        u.mem_write(mem, bytes(0x10000))
        at = text_at
        for i, field in enumerate(fields):
            encoded = field.encode()
            u.mem_write(at, encoded + b"\0")
            put(fields_at + i * 16, "<QQ", at, len(encoded))
            at += len(encoded) + 1
        put(frame + 0x1C8, "<QQ", fields_at, len(fields))
        reg("RBP", frame)
        reg("RBX", 10)
        stop = run(0x145889778, {0x1458897A0, 0x145889895}, [(0x145889778, 0x145889895)])
        return u.reg_read(x.UC_X86_REG_RAX) & 0xFF if stop == 0x145889895 else None

    def zone_index(key):
        u.mem_write(text_at, key.encode() + b"\0")
        reg("RDX", text_at)
        reg("R8", len(key.encode()))
        reg("RSP", mem + 0xF000)
        put(mem + 0xF000, "<Q", done)
        run(SPANS["zone-key"][0], {done}, [SPANS["zone-key"]])
        return u.reg_read(x.UC_X86_REG_RDX) if u.reg_read(x.UC_X86_REG_RAX) & 1 else None

    def merge(existing, pairs):
        u.mem_write(mem, bytes(0x10000))
        for i, (cls, index) in enumerate(pairs):
            put(pairs_at + i * 16, "<B7xQ", cls, index)
        for i, (cls, count) in enumerate(existing):
            put(unlocks_at + i * 16, "<B7xQ", cls, count)
        put(frame + 0x208, "<QQQ", 128, unlocks_at, len(existing))
        reg("RBP", frame)
        reg("RCX", pairs_at)
        reg("RSI", pairs_at + len(pairs) * 16)
        reg("RDI", 12)
        run(0x1458893C8, {0x1458893D1}, [
            (0x1458893C8, 0x1458893D1), (0x1458895A0, 0x14588964F),
        ])
        count = struct.unpack("<Q", u.mem_read(frame + 0x218, 8))[0]
        return [list(struct.unpack("<B7xQ", u.mem_read(unlocks_at + i * 16, 16))) for i in range(count)]

    keys = [z["key"] for z in json.loads((ROOT / "crates/azeroth-survivors-re/assets/menu.json").read_text())["zones"]]
    assert len(keys) == 12
    zone_cases = []
    for expected, key in enumerate(keys):
        index = zone_index(key)
        assert index == expected, (key, index, expected)
        zone_cases.append(dict(key=key, index=index))
    for key in ["", "unknown", "AQ", "Elwynn", " aq", "aq ", "aqx", "naxxramas", "é", "sm\t"]:
        assert zone_index(key) is None
        zone_cases.append(dict(key=key, index=None))

    class_cases = []
    for value, expected in [("0", 0), ("1", 1), ("6", 6), ("255", 255), ("+8", 8), ("001", 1),
                            ("", None), ("+", None), ("-1", None), ("256", None), ("999999", None),
                            ("1x", None), (" 1", None), ("1 ", None)]:
        fields = ["beat", value, "aq"]
        assert parse_class(fields) == expected
        class_cases.append(dict(fields=fields, class_id=expected))
    for fields in [["beat", "1"], ["beat", "1", "aq", "extra"], ["Beat", "1", "aq"]]:
        assert parse_class(fields) is None
        class_cases.append(dict(fields=fields, class_id=None))

    save_cases = []

    def case(name, text, existing=()):
        pairs = set()
        for line in text.splitlines():
            fields = line.strip().split("|")
            cls = parse_class(fields)
            if cls is not None:
                for key in fields[2].split(","):
                    index = zone_index(key)
                    if index is not None:
                        pairs.add((cls, index))
        ordered = sorted(pairs)
        unlocks = merge(existing, ordered)
        expected = dict(existing)
        for cls, index in ordered:
            expected[cls] = max(expected.get(cls, 0), min(index + 2, 12))
        assert dict(unlocks) == expected
        save_cases.append(dict(name=name, plaintext=text, existing_typed_unlocks=list(existing),
                               beaten_pairs=ordered, unlocks=unlocks))

    for cls in [1, 2, 3, 4, 5, 7, 8, 9, 11]:
        for key in keys:
            case(f"class_{cls}_beat_{key}", f"beat|{cls}|{key}\n")
    for count in range(13):
        for key in [keys[0], "brm", "aq", "naxx"]:
            text = (f"open|1|{keys[count - 1]}\n" if count else "") + f"beat|1|{key}\n"
            case(f"existing_{count}_beat_{key}", text, [(1, count)] if count else [])
    for name, text, existing in [
        ("duplicates_and_classes", "beat|8|naxx,elwynn,naxx\nbeat|1|aq,aq\nbeat|8|ab\n", []),
        ("unknown_tokens", "beat|1|unknown,,aq,AQ, aq,naxxramas\n", []),
        ("malformed_rows", "beat|256|naxx\nbeat|-1|naxx\nbeat|x|naxx\nbeat|1|aq|extra\nbeat|1\n", []),
        ("unknown_only", "beat|1|unknown,,AQ\nunknown|keep\n", []),
        ("u8_classes", "beat|0|elwynn\nbeat|6|aq\nbeat|255|naxx\n", []),
        ("numeric_class_forms", "beat|+8|aq\nbeat|001|brm\n", []),
        ("legacy_maximum", "unlock|1|9\nbeat|1|elwynn\n", [(1, 11)]),
        ("legacy_aq_repair", "unlock|1|9\nbeat|1|aq\n", [(1, 11)]),
        ("explicit_other_class", "open|8|naxx\nbeat|1|aq\nunknown|keep\n", [(8, 12)]),
        ("no_beaten_rows", "open|8|sm\nunknown|keep\n", [(8, 8)]),
    ]:
        case(name, text, existing)

    spans = []
    for role, (start, end) in SPANS.items():
        spans.append(dict(role=role, address=hex(start), end_exclusive=hex(end),
                          file_offset=hex(pe.rva_offset(start - pe.image_base)),
                          sha256=hashlib.sha256(raw(start, end - start)).hexdigest()))
    result = dict(target_sha256=SHA, spans=spans, zone_cases=zone_cases, class_cases=class_cases,
                  save_cases=save_cases,
                  merge_prelude="docs/analysis/evidence/0.105.0/game-mode-audit/beaten-zone-unlock-repair.asm",
                  limits=["Bounded unchanged native instructions with synthetic memory; no application or source compilation.",
                          "Pipe splitting/outer trimming, comma token iteration, beat sorting/deduplication and existing typed unlocks are harness inputs.",
                          "Actual key acceptance, u8 class parsing, next-zone clamp and maximum merge use original instructions; IO, envelope and allocations are not exercised."])
    if args.check:
        assert portable_record(json.loads((RETAINED / "native-vectors.json").read_text())) == portable_record(json.loads(json.dumps(result)))
    else:
        WORK.mkdir(parents=True, exist_ok=True)
        (WORK / "native-vectors.json").write_text(portable_json(result, indent=2, ensure_ascii=False) + "\n")
        for role, (start, end) in SPANS.items():
            assembly = objdump_output(["objdump", "-d", "--no-show-raw-insn",
                f"--start-address={start:#x}", f"--stop-address={end:#x}", str(TARGET)], text=True)
            (WORK / f"{role}.asm").write_text(assembly.replace(str(TARGET), TARGET.name))
    print(f"Passed {len(zone_cases)} native zone-key, {len(class_cases)} class/record and {len(save_cases)} unlock-merge cases")


if __name__ == "__main__":
    main()
