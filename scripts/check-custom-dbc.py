#!/usr/bin/env python3
"""Check bounded current custom DBC owners and original string-reader instructions.

Native slicing, bounds and UTF-8 instructions execute in Unicorn. No Rust
compilation, MPQ read or game runs.
"""

import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, json_text, project_path

EVIDENCE = ROOT / "docs/analysis/evidence/custom-dbc"


def vectors(raw, utf8_raw, utf8_widths):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, __version__
    from unicorn import x86_const as r
    start, utf8, panic = 0x145873b10, 0x145ba4cf0, 0x145d699f0
    memory, stack, stop = 0x200000000, 0x300000000, 0x400000000
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    for address in (start, utf8, panic, memory, stack, stop):
        u.mem_map(address & ~0xfff, 0x10000 if address in (memory, stack) else 0x1000)
    table = 0x1471ec7f5
    u.mem_map(table & ~0xfff, 0x1000)
    u.mem_write(start, raw)
    u.mem_write(utf8, utf8_raw)
    u.mem_write(table, utf8_widths)
    context = {}

    def hook(uc, address, size, _):
        if address == stop:
            uc.emu_stop()
        elif address == panic:
            context["panicked"] = True
            uc.emu_stop()
        elif not (start <= address < start + len(raw) or utf8 <= address < utf8 + len(utf8_raw)):
            raise AssertionError(f"Unreviewed original instruction {address:#x}")

    u.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for label, strings, offset, expected in (
        ("ascii", b"\0Spell\0unused", 1, "Spell"),
        ("first-empty", b"\0Spell\0", 0, ""),
        ("utf8", "\0Zażółć\0".encode(), 1, "Zażółć"),
        ("invalid-utf8", b"\0\xff\0", 1, ""),
        ("truncated-utf8", b"\0\xe2\x82", 1, ""),
        ("overlong-utf8", b"\0\xc0\x80\0", 1, ""),
        ("surrogate-utf8", b"\0\xed\xa0\x80\0", 1, ""),
        ("four-byte-utf8", "\0😀\0".encode(), 1, "😀"),
        ("unterminated-tail", b"\0Spell", 1, "Spell"),
        ("exact-end", b"\0Spell", 6, ""),
        ("past-end", b"\0Spell", 7, None),
    ):
        for record_size, row, field in ((4, 0, 0), (8, 1, 1)):
            count = row + 1
            data = bytearray(b"WDBC" + struct.pack("<4I", count, record_size // 4, record_size, len(strings)))
            data.extend(bytes(count * record_size))
            struct.pack_into("<I", data, 20 + row * record_size + field * 4, offset)
            block = len(data)
            data.extend(strings)
            cases.append((label, bytes(data), record_size, row, field, block, expected))
    cases.append(("field-outside-buffer", b"WDBC" + bytes(16), 4, 0, 0, 20, None))
    results = []
    for label, data, stride, row, field, block, expected in cases:
        u.mem_write(memory, bytes(0x10000))
        u.mem_write(stack, bytes(0x10000))
        pointer = memory + 0x1000
        u.mem_write(pointer, data)
        u.mem_write(memory + 8, struct.pack("<QQQ", pointer, len(data), block))
        u.mem_write(memory + 0x28, struct.pack("<I", stride))
        rsp = stack + 0x8000
        u.mem_write(rsp, struct.pack("<Q", stop))
        for reg, value in ((r.UC_X86_REG_RCX, memory), (r.UC_X86_REG_RDX, row),
                           (r.UC_X86_REG_R8, field), (r.UC_X86_REG_RSP, rsp)):
            u.reg_write(reg, value)
        context["panicked"] = False
        u.emu_start(start, 0, count=2000)
        if expected is None:
            assert context["panicked"], label
            actual = "native bounds panic"
        else:
            assert not context["panicked"], label
            length = u.reg_read(r.UC_X86_REG_RDX)
            actual = bytes(u.mem_read(u.reg_read(r.UC_X86_REG_RAX), length)).decode("utf-8") if length else ""
            assert actual == expected, (label, actual, expected)
        results.append({"case": label, "row": row, "field": field, "stride": stride, "result": actual})
    return {"emulator": "Unicorn " + __version__, "cases": results,
            "limits": ["Original reader instructions execute on synthetic DBC buffers, not the actual MPQs or reconstructed Rust.",
                       "The original UTF-8 validator and its byte-width table execute. Allocation, dictionary/hash dispatch and external callers do not execute."]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--record", action="store_true", help="stage current vectors in ignored runtime for review")
    args = parser.parse_args()
    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / "manifest.json").read_text())
    assert all(manifest["target"][key] == target[key] for key in ("version", "path", "sha256"))
    data = project_path(target["path"]).read_bytes()
    ranges = {}
    for row in manifest["ranges"]:
        at = int(row["file_offset"], 16)
        raw = data[at:at + row["byte_count"]]
        assert len(raw) == row["byte_count"] and hashlib.sha256(raw).hexdigest() == row["sha256"]
        for kind in ("assembly", "pseudocode"):
            if kind in row:
                assert hashlib.sha256((EVIDENCE / row[kind]).read_bytes()).hexdigest() == row[kind + "_sha256"]
        if "hex" in row:
            assert raw.hex() == row["hex"]
        ranges[row["role"]] = raw
    observed = vectors(ranges["string-reader"], ranges["utf8-validator"], ranges["utf8-width-table"])
    if args.record:
        path = ROOT / "runtime/analysis/history/findings/fixgap/1f94da23ce36/coverage/dbc-curation/native-vectors.json"
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json_text(observed))
    else:
        assert observed == json.loads((EVIDENCE / "native-vectors.json").read_text())
    print(f"Verified four current native DBC extents, UTF-8 validator/table and {len(observed['cases'])} original string-reader cases; dictionary consumers and parity remain open")


if __name__ == "__main__":
    main()
