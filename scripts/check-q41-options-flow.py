#!/usr/bin/env python3
"""Replay bounded #41 Options flow/address classifications; no build or game.

--stage prepares compact evidence beneath runtime/. The source correspondence
and synthetic Win64 inputs do not execute reconstructed Rust or an ECS World.
"""
from runtime_layout import retained_runtime_path
import argparse
import bisect
import csv
import gzip
import hashlib
import json
import sqlite3
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
from coverage_common import file_sha256
from shared_native_inventory import open_readonly_uri as open_native_inventory

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
WORK = ROOT / "runtime/analysis/history/findings/q41-flow-relations/710b14cd9802"
CURATED = ROOT / "docs/analysis/evidence/q41-options-flow"
RANGES = {
    "descriptor-dispatch": (0x1401A6770, 0x1401A67D9),
    "format-argument": (0x1401A68F4, 0x1401A691E),
    "resource-failures": (0x1401A6B86, 0x1401A6BDF),
    "descriptor-bounds": (0x1401A6CC2, 0x1401A6CD8),
    "string-format-adapter": (0x140149550, 0x140149562),
}


def digest(path):
    return file_sha256(path)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r

    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Recover a changed target before using these sites"
    image = target_bytes(target)
    pe = load_script("q41_options_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    queue = json.loads((ROOT / "docs/analysis/evidence/unknown-recovery-comparison-2.json").read_text())
    assert queue["target"]["sha256"] == SHA
    names = ["instructions.tsv.gz", "bodies.tsv.gz", "native-instructions.sqlite",
             "diagnostic_code_input", "guarded_table_input"]
    inputs = {name: queue["inputs"][name] for name in names}
    for row in inputs.values():
        assert digest(retained_runtime_path(ROOT / row["path"], ROOT)) == row["sha256"], row["path"]

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    def span(address, size):
        return {"address": hex(address), "end_exclusive": hex(address + size),
                "file_offset": hex(pe.rva_offset(address - pe.image_base)),
                "bytes": size, "sha256": hashlib.sha256(raw(address, size)).hexdigest()}

    bodies = []
    with gzip.open(ROOT / inputs["bodies.tsv.gz"]["path"], "rt") as stream:
        for row in csv.DictReader(stream, delimiter="\t"):
            if row["external"] == "false":
                bodies.append((int(row["start"], 16), int(row["end"], 16), row["entry"]))
    bodies.sort()
    starts = [row[0] for row in bodies]

    def owner(address):
        index = bisect.bisect_right(starts, address) - 1
        return bodies[index][2] if index >= 0 and address <= bodies[index][1] else None

    selected = {}
    sites = {0x1401A67D7, 0x1401A6904, 0x1401A6B86, 0x1401A6BA0,
             0x1401A6BB2, 0x1401A6BCC, 0x1401A6BD7}
    # The census producer exports getInstructions(true), in ascending address order.
    previous = -1
    with gzip.open(ROOT / inputs["instructions.tsv.gz"]["path"], "rt") as stream:
        for ordinal, row in enumerate(csv.DictReader(stream, delimiter="\t"), 1):
            address = int(row["address"], 16)
            assert address > previous
            previous = address
            if address > max(sites):
                break
            if address in sites:
                selected[hex(address)] = {**row, "ordinal": ordinal, "owner": owner(address)}
    assert {"0x1401a67d7", "0x1401a6ba0", "0x1401a6bcc"} <= selected.keys()
    assert selected["0x1401a67d7"]["flow"] == "COMPUTED_JUMP"
    assert selected["0x1401a6bcc"]["owner"] is None
    assert selected["0x1401a6ba0"]["owner"] is None
    assert selected["0x1401a67d7"]["owner"] == "1401a6770"
    diagnostic = json.loads((ROOT / inputs["diagnostic_code_input"]["path"]).read_text())
    seeds = [row for row in diagnostic["records"]
             if row["site"] in ("0x1401a6ba0", "0x1401a6bcc")]
    assert len(seeds) == 2
    assert all(row["classification"] == "undecoded-exact-diagnostic-lead" for row in seeds)
    guarded = json.loads((ROOT / inputs["guarded_table_input"]["path"]).read_text())
    assert not any(int(row["site"], 16) == 0x1401A67D7 for row in guarded["tables"])
    database = open_native_inventory("file:" + str(ROOT / inputs["native-instructions.sqlite"]["path"])
                               + "?mode=ro", uri=True)
    encoded = list(database.execute(
        "SELECT extent,site,bytes,kind,target,operand,access FROM refs WHERE site IN (?,?) ORDER BY site",
        (0x1401A67D7, 0x1401A6904)))
    database.close()
    assert len(encoded) == 2
    assert encoded[0][2:5] == ("ffe0", "jump_indirect", None)
    assert encoded[1][2:5] == ("488d05452cfaff", "address", "0x140149550")

    table = 0x145EEF5A8
    destinations = [table + value for value in struct.unpack("<4i", raw(table, 16))]
    assert destinations == [0x1401A67D9, 0x1401A68F4, 0x1401A6842, 0x1401A6879]
    descriptors = []
    assert raw(0x145EE77DC, 5) == b"gamma"
    source_rows = json.loads((ROOT / "crates/azeroth-survivors-re/assets/options.json").read_text())["rows"]
    assert len(source_rows) == 105
    for index, source in enumerate(source_rows):
        row = raw(0x145EE9FB0 + index * 152, 152)
        tag, pointer, length = struct.unpack_from("<QQQ", row, 24)
        assert tag in range(4) and source["storage"] == tag
        key = raw(pointer, length).decode() if tag != 3 else "gamma"
        assert source["key"] == key
        descriptors.append([index, tag, key, hex(destinations[tag])])

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    machine.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        at, count = section["raw_offset"], section["raw_size"]
        if count:
            machine.mem_write(pe.image_base + section["rva"], image[at:at + count])
    heap, stack = 0x200000000, 0x300000000
    machine.mem_map(heap, 0x10000)
    machine.mem_map(stack, 0x10000)
    stops = set(destinations + [0x145E9C123, 0x145E9C300, 0x145CDF270])
    reached = []

    def stop(uc, address, size, _):
        if address in stops:
            reached.append(address)
            uc.emu_stop()

    machine.hook_add(UC_HOOK_CODE, stop)
    for index in list(range(105)) + [105, 2**64 - 1]:
        machine.reg_write(r.UC_X86_REG_RSP, stack + 0x8008)
        machine.reg_write(r.UC_X86_REG_RCX, heap)
        machine.reg_write(r.UC_X86_REG_RDX, index)
        machine.reg_write(r.UC_X86_REG_R8, heap + 0x100)
        machine.reg_write(r.UC_X86_REG_R9, 1)
        reached.clear()
        machine.emu_start(0x1401A6770, 0, count=100)
        expected = destinations[descriptors[index][1]] if index < 105 else 0x145E9C123
        assert reached == [expected], (index, reached)
        if index >= 105:
            assert machine.reg_read(r.UC_X86_REG_RCX) == index
            assert machine.reg_read(r.UC_X86_REG_RDX) == 105
            assert machine.reg_read(r.UC_X86_REG_R8) == 0x145EEDFB0

    panic_cases = []
    for entry, location in [(0x1401A6B86, 0x145EEDFE8), (0x1401A6BB2, 0x145EEDFD0)]:
        frame = stack + 0x7000
        machine.reg_write(r.UC_X86_REG_RSP, stack + 0x6800)
        machine.reg_write(r.UC_X86_REG_RBP, frame)
        reached.clear()
        machine.emu_start(entry, 0, count=30)
        assert reached == [0x145E9C300]
        assert machine.reg_read(r.UC_X86_REG_RCX) == 0x145EE6310
        assert machine.reg_read(r.UC_X86_REG_R8) == location
        argument = machine.reg_read(r.UC_X86_REG_RDX)
        assert struct.unpack("<QQ", machine.mem_read(argument, 16)) == (frame + 7, 0x144F71820)
        path, length, line, column = struct.unpack("<QQII", raw(location, 24))
        assert raw(path, length) == b"crates\\wenilla-rogue-app\\src\\screens\\options.rs"
        panic_cases.append({"entry": hex(entry), "location": hex(location), "line": line, "column": column})

    strings = [b"", b"0", b"1", b"2", b"-1.5", b"NaN", "é".encode()]
    for value in strings:
        machine.mem_write(heap + 0x100, value or b"\0")
        machine.mem_write(heap, struct.pack("<QQ", heap + 0x100, len(value)))
        machine.reg_write(r.UC_X86_REG_RCX, heap)
        machine.reg_write(r.UC_X86_REG_RDX, heap + 0x200)
        reached.clear()
        machine.emu_start(0x140149550, 0, count=10)
        assert reached == [0x145CDF270]
        assert machine.reg_read(r.UC_X86_REG_RCX) == heap + 0x100
        assert machine.reg_read(r.UC_X86_REG_RDX) == len(value)
        assert machine.reg_read(r.UC_X86_REG_R8) == heap + 0x200

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    assembly, spans = {}, {}
    for name, (start, end) in RANGES.items():
        instructions = list(decoder.disasm(raw(start, end - start), start))
        assert sum(i.size for i in instructions) == end - start
        assembly[name] = "\n".join(f"{i.address:016x}: {i.bytes.hex():30} {i.mnemonic} {i.op_str}".rstrip()
                                      for i in instructions) + "\n"
        spans[name] = span(start, end - start)
    result = {"target": target, "gap_ids": [41],
              "lead_ids": ["Q41-O01", "Q41-M02", "Q41-F01", "Q41-F02", "Q41-M01", "Q41-A01"],
              "inputs": inputs, "selected_instruction_rows": selected,
              "selected_sites_not_observed_by_full_profile": [hex(a) for a in sorted(sites) if hex(a) not in selected],
              "encoded_reference_rows": [list(row) for row in encoded], "diagnostic_code_provenance": seeds,
              "instruction_ranges": spans,
              "data_ranges": {"descriptors": span(0x145EE9FB0, 105 * 152), "jump_table": span(table, 16),
                              "resource_message_prefix": span(0x145EE6310, 53),
                              "resource_locations": span(0x145EEDFD0, 48)},
              "descriptors": descriptors, "failure_paths": panic_cases,
              "cases": {"descriptor_dispatch_and_bounds": 107, "resource_failure_arguments": 2,
                        "string_format_adapter": len(strings)},
              "limits": ["Exact selected immutable descriptor input; arbitrary memory mutation is unproved.",
                         "Resource lookup and ECS admission, generic formatting/panic backends and reconstructed Rust are not executed.",
                         "Original census ownership and residual counts are unchanged; no global alias/body closure.",
                         "No compilation, application/game launch, game-save/configuration operation or parity comparison."]}
    # The installed local path is not a portable evidence field.
    result["target"] = {k: target[k] for k in ("version", "path", "sha256", "size_bytes")}
    if args.stage:
        output = WORK / "staged"
        output.mkdir(parents=True, exist_ok=True)
        (output / "contract.json").write_text(json.dumps(result, indent=2) + "\n")
        for name, text in assembly.items():
            (output / (name + ".asm")).write_text(text)
    else:
        assert json.loads((CURATED / "contract.json").read_text()) == result
        for name, text in assembly.items():
            assert (CURATED / (name + ".asm")).read_text() == text
    print(json.dumps({"target": target["version"], "bounded_cases": sum(result["cases"].values()),
                      "descriptor_rows": len(descriptors), "ownerless_failure_sites": 2,
                      "source_mismatch_established": False}))


if __name__ == "__main__":
    main()
