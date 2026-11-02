#!/usr/bin/env python3
"""Verify the current cooperative-history contract without compiling a client.

--native replays only the original pure zone-key lookup in Unicorn. It does not
start the game, a client, a socket, or a server. Native dependencies are optional
and can be supplied through an existing project-local PYTHONPATH.
"""

import argparse
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

MANIFEST = ROOT / "docs/analysis/evidence/0.117.0/coop-history/manifest.json"


def verify():
    manifest = json.loads(MANIFEST.read_text())
    target = latest_target(verify=True)
    assert target["sha256"] == manifest["target"]["sha256"]
    image = target_bytes(target)
    pe = load_script("coop_history_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    for row in manifest["native_ranges"]:
        at = pe.rva_offset(int(row["va"], 16) - pe.image_base)
        raw = image[at:at + row["byte_count"]]
        assert len(raw) == row["byte_count"]
        assert hashlib.sha256(raw).hexdigest() == row["sha256"], row["label"]
    for row in manifest["query_receipts"]:
        path = ROOT / row["path"]
        assert hashlib.sha256(path.read_bytes()).hexdigest() == row["sha256"], path
    catalog = json.loads((ROOT / "crates/azeroth-survivors-re/assets/menu.json").read_text())
    source_keys = [zone["key"] for zone in catalog["zones"]]
    native_keys = []
    for index in range(12):
        at = pe.rva_offset(0x14729b018 + index * 0xf0 - pe.image_base)
        pointer, length = struct.unpack_from("<QQ", image, at)
        start = pe.rva_offset(pointer - pe.image_base)
        native_keys.append(image[start:start + length].decode("ascii"))
    assert source_keys == native_keys == manifest["ordered_zone_keys"]
    source = (ROOT / "crates/azeroth-survivors-re/src/save/coop_history.rs").read_text()
    schema = (ROOT / "crates/azeroth-survivors-re/src/save/schema.rs").read_text()
    save = (ROOT / "crates/azeroth-survivors-re/src/save.rs").read_text()
    assert 'mod coop_history;' in save
    for fragment in ['strip_prefix("coopbeat|")', "row.split(',')", "BTreeSet<usize>",
                     'position(|zone| zone.key == key)', 'pub fn cooperative_beaten_zones',
                     'pub fn mark_cooperative_victory', '!beaten.insert(index)']:
        assert fragment in source, fragment
    assert "super::coop_history::record(&super::coop_history::zones(lines))" in schema
    assert schema.index("super::coop_history::record") < schema.index('csv(lines, "perk|")')
    assert schema.index("super::coop_history::record") > schema.index('format!(\n            "beat|')
    return manifest, pe, image, native_keys


def replay(pe, image, keys):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from capstone.x86 import X86_OP_MEM, X86_REG_RIP
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    from unicorn.x86_const import UC_X86_REG_RAX, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_RSP

    start, end = 0x145b4d1d0, 0x145b4d380
    offset = pe.rva_offset(start - pe.image_base)
    raw = image[offset:offset + end - start]
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    pages = {start & ~0xfff}
    for instruction in decoder.disasm(raw, start):
        for operand in instruction.operands:
            if operand.type == X86_OP_MEM and operand.mem.base == X86_REG_RIP:
                pages.add((instruction.address + instruction.size + operand.mem.disp) & ~0xfff)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    for page in pages:
        machine.mem_map(page, 0x1000)
        at = pe.rva_offset(page - pe.image_base)
        machine.mem_write(page, image[at:at + 0x1000])
    stack, string, stop = 0x20000000, 0x21000000, 0x22000000
    machine.mem_map(stack, 0x2000)
    machine.mem_map(string, 0x1000)
    machine.mem_map(stop, 0x1000)
    machine.mem_write(stack + 0x1000, struct.pack("<Q", stop))

    def lookup(value):
        machine.mem_write(string, value + b"\0" * 16)
        machine.reg_write(UC_X86_REG_RSP, stack + 0x1000)
        machine.reg_write(UC_X86_REG_RCX, stack + 0x100)
        machine.reg_write(UC_X86_REG_RDX, string)
        machine.reg_write(UC_X86_REG_R8, len(value))
        machine.emu_start(start, stop, count=256)
        assert machine.reg_read(UC_X86_REG_RSP) == stack + 0x1008
        return (machine.reg_read(UC_X86_REG_RDX)
                if machine.reg_read(UC_X86_REG_RAX) & 1 else None)

    expected = {key.encode(): index for index, key in enumerate(keys)}
    cases = 0
    for first in range(256):
        for second in range(256):
            value = bytes([first, second])
            assert lookup(value) == expected.get(value), value
            cases += 1
    values = {b"", b"not-a-zone", b"coopbeat|elwynn"}
    for key in expected:
        values.update([key, key.upper(), b" " + key, key + b" ", key + b"\0", key + b"|"])
        for index in range(len(key)):
            values.add(key[:index] + key[index + 1:])
            for byte in [0, 44, 65, 124, 255]:
                values.add(key[:index] + bytes([byte]) + key[index + 1:])
    for value in sorted(values):
        assert lookup(value) == expected.get(value), value
        cases += 1
    return cases


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--native", action="store_true")
    args = parser.parse_args()
    manifest, pe, image, keys = verify()
    cases = replay(pe, image, keys) if args.native else None
    print(json.dumps({"target": manifest["target"]["version"], "native_ranges": len(manifest["native_ranges"]),
                      "ordered_zones": len(keys), "native_lookup_cases": cases,
                      "scope": "bounded native lookup and source connections; compilation/runtime/parity unverified"}))


if __name__ == "__main__":
    main()
