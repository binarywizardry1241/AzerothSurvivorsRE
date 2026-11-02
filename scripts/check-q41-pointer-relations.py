#!/usr/bin/env python3
"""Check bounded Armory code-pointer, data-relocation and PE-metadata leads.

Only original instruction fragments execute with synthetic memory. --stage
writes review material under runtime/; no compiler or application is invoked.
"""
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
WORK = ROOT / "runtime/q41-pointer-relations-0.113.2"
CURATED = ROOT / "docs/analysis/evidence/0.113.2/q41-pointer-relations"
RANGES = {
    "armory-argument": (0x140136A95, 0x140136AEF),
    "display-dispatch": (0x14017F820, 0x14017F831),
    "string-display": (0x1400020E0, 0x1400020F3),
    "string-adapter": (0x145CDF5D0, 0x145CDF5E1),
    "string-drop": (0x1400051C0, 0x1400051D8),
    "localize-then-substitute": (0x1458956D0, 0x145895715),
    "placeholder-argument": (0x145895CE7, 0x145895D52),
    "armory-location-use": (0x140137723, 0x140137735),
}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as regs

    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Re-select and recover changed target"
    image = target_bytes(target)
    pe = load_script("pointer_relations_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    def span(address, size):
        return dict(address=hex(address), end_exclusive=hex(address + size),
                    byte_count=size, sha256=digest(raw(address, size)))

    queue_path = ROOT / "docs/analysis/evidence/0.113.2/unknown-recovery.json"
    queue = json.loads(queue_path.read_text())
    assert queue["target"]["sha256"] == SHA
    inputs = {}
    for role in ["inventory.json", "bodies.tsv.gz", "references.tsv.gz", "native-instructions.sqlite"]:
        item = queue["inputs"][role]
        assert file_sha256(ROOT / item["path"]) == item["sha256"], role
        inputs[role] = item
    inventory = json.loads((ROOT / inputs["inventory.json"]["path"]).read_text())
    relocations = inventory["pe"]["base_relocation_records"]["records"]
    code_slot = [0x5ED7700, 10, 0x1400020E0]
    data_slot = [0x5ED76D0, 10, 0x145ED6DF8]
    assert code_slot in relocations and data_slot in relocations
    sections = pe.sections
    executable = lambda a: any(int(s["characteristics"], 16) & 0x20000000 and
                              pe.image_base + s["rva"] <= a <
                              pe.image_base + s["rva"] + s["virtual_size"] for s in sections)
    assert executable(code_slot[2]) and not executable(data_slot[2])

    bodies = []
    with gzip.open(ROOT / inputs["bodies.tsv.gz"]["path"], "rt") as stream:
        for row in csv.DictReader(stream, delimiter="\t"):
            if row["external"] == "false":
                bodies.append((int(row["start"], 16), int(row["end"], 16), int(row["entry"], 16)))
    bodies.sort()
    starts = [row[0] for row in bodies]

    def owner(address):
        at = bisect.bisect_right(starts, address) - 1
        return bodies[at][2] if at >= 0 and address <= bodies[at][1] else None

    assert owner(code_slot[2]) == code_slot[2]
    assert owner(0x1481FA240) is None
    selected_references = []
    with gzip.open(ROOT / inputs["references.tsv.gz"]["path"], "rt") as stream:
        for row in csv.DictReader(stream, delimiter="\t"):
            if row["from"] in ("1481fa240", "1481fa248"):
                selected_references.append(row)
    assert selected_references == [
        dict(zip(["from", "to", "type", "operand", "primary", "source"],
                 ["1481fa240", "140136300", "DATA", "0", "true", "DEFAULT"])),
        dict(zip(["from", "to", "type", "operand", "primary", "source"],
                 ["1481fa248", "1473dc7f8", "DATA", "0", "true", "DEFAULT"])),
    ]
    linear_path = ROOT / inputs["native-instructions.sqlite"]["path"]
    with open_native_inventory(f"file:{linear_path}?mode=ro", uri=True) as database:
        constructor = database.execute(
            "SELECT extent,site,bytes,kind,target,operand,access FROM refs "
            "WHERE kind='address' AND site=? AND target=?", (0x140136ABC, "0x145ed76e8")).fetchone()
        location_use = database.execute(
            "SELECT extent,site,bytes,kind,target,operand,access FROM refs "
            "WHERE kind='address' AND site=? AND target=?", (0x140137723, "0x145ed76d0")).fetchone()
    assert constructor and location_use
    vtable = struct.unpack("<QQQQ", raw(0x145ED76E8, 32))
    assert vtable == (0x1400051C0, 24, 8, 0x1400020E0)
    rdata = next(s for s in sections if s["name"] == ".rdata")
    assert pe.image_base + rdata["rva"] <= 0x145ED76E8
    assert 0x145ED76E8 + 32 <= pe.image_base + rdata["rva"] + rdata["virtual_size"]
    assert not int(rdata["characteristics"], 16) & 0x80000000
    location = struct.unpack("<QQII", raw(0x145ED76D0, 24))
    assert location == (0x145ED6DF8, 46, 1650, 19)
    assert raw(location[0], location[1]) == b"crates\\wenilla-rogue-app\\src\\screens\\armory.rs"
    runtime_function = struct.unpack("<III", raw(0x1481FA240, 12))
    assert runtime_function == (0x136300, 0x137735, 0x73DC7F8)
    pdata = next(s for s in sections if s["name"] == ".pdata")
    assert pe.image_base + pdata["rva"] <= 0x1481FA240 < pe.image_base + pdata["rva"] + pdata["virtual_size"]
    assert (0x1481FA240 - pe.image_base - pdata["rva"]) % 12 == 0
    assert raw(0x145ED7708, 14) == b"lineitem.equip"

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    assembly = {}
    for role, (start, end) in RANGES.items():
        instructions = list(decoder.disasm(raw(start, end - start), start))
        assert sum(i.size for i in instructions) == end - start
        assembly[role] = "\n".join(
            f"{i.address:016x}: {i.bytes.hex():30} {i.mnemonic} {i.op_str}".rstrip()
            for i in instructions) + "\n"

    native = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in sections)
    native.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in sections:
        offset, length = section["raw_offset"], section["raw_size"]
        native.mem_write(pe.image_base + section["rva"], image[offset:offset + length])
    heap, stack = 0x200000000, 0x300000000
    native.mem_map(heap, 0x10000)
    native.mem_map(stack, 0x10000)
    rbp, rsp = stack + 0x1000, stack + 0xE000
    stops, trace = set(), []

    def reg(name, value=None):
        register = getattr(regs, "UC_X86_REG_" + name)
        if value is not None:
            native.reg_write(register, value)
        return native.reg_read(register)

    def hook(_, pc, length, unused):
        trace.append(pc)
        if pc in stops:
            native.emu_stop()
        else:
            assert any(a <= pc and pc + length <= b for a, b in RANGES.values()), hex(pc)

    native.hook_add(UC_HOOK_CODE, hook)
    reg("RBP", rbp)
    reg("RSP", rsp)
    reg("R14", heap + 0x800)
    stops.add(0x1458956D0)
    native.emu_start(0x140136A95, 0, count=100)
    descriptor = bytes(native.mem_read(rbp + 0x378, 32))
    assert struct.unpack("<QQQQ", descriptor) == (0x145ED7708, 4, rbp + 0x3A8, 0x145ED76E8)
    assert (reg("RCX"), reg("RDX"), reg("R8"), reg("R9")) == (heap + 0x800, 0x145ED770C, 10, rbp + 0x378)
    assert struct.unpack("<Q", native.mem_read(rsp + 0x20, 8))[0] == 1
    cases = [dict(kind="armory-constructor", key="item.equip", argument="line", count=1)]
    stops.clear()
    stops.add(0x145CD30D0)
    for text in [b"", b"x", b"+5 Strength", "Żółć".encode(), b"{" * 31, b"z" * 255]:
        native.mem_write(heap, struct.pack("<Q", heap + 0x20))
        native.mem_write(heap + 0x20, struct.pack("<QQ", heap + 0x40, 0x145ED76E8))
        native.mem_write(heap + 0x40, struct.pack("<QQQ", len(text), heap + 0x100, len(text)))
        native.mem_write(heap + 0x100, text + b"\x00")
        reg("RCX", heap)
        reg("RDX", heap + 0x800)
        trace.clear()
        native.emu_start(0x14017F820, 0, count=100)
        assert (reg("RCX"), reg("RDX"), reg("R8")) == (heap + 0x800, heap + 0x100, len(text))
        assert 0x1400020E0 in trace and 0x145CDF5D0 in trace
        cases.append(dict(kind="display-method", byte_count=len(text), text_sha256=digest(text),
                          output_boundary="0x145cd30d0"))
    stops.clear()
    stops.update((0x1400021D0, heap + 0x900))
    for capacity in [0, 1, 31]:
        native.mem_write(heap + 0x40, struct.pack("<QQQ", capacity, heap + 0x100, 0))
        native.mem_write(rsp, struct.pack("<Q", heap + 0x900))
        reg("RCX", heap + 0x40)
        reg("RSP", rsp)
        native.emu_start(0x1400051C0, 0, count=100)
        if capacity:
            assert reg("RIP") == 0x1400021D0
            assert (reg("RCX"), reg("RDX"), reg("R8")) == (heap + 0x100, capacity, 1)
        else:
            assert reg("RIP") == heap + 0x900
        cases.append(dict(kind="string-drop", capacity=capacity, deallocation_requested=bool(capacity)))

    source_path = ROOT / "crates/azeroth-survivors-re/src/armory.rs"
    source = source_path.read_text()
    begin = source.index('                        menu_catalog.label("item.equip").replace(')
    end = source.index("                    },", begin)
    projection = source[begin:end]
    assert '"{line}"' in projection and "&effect_line(menu_catalog, effect.tag, effect.value)" in projection
    record = dict(
        target_sha256=SHA, leads=["Q41-A02", "Q41-A03", "Q41-O02"],
        classification_ids=["Q41-A02-armory-line-display-145ed7700",
                            "Q41-A03-armory-location-145ed76d0",
                            "Q41-O02-armory-runtime-function-1481fa240"],
        queue=dict(path=str(queue_path.relative_to(ROOT)), sha256=file_sha256(queue_path)),
        inputs=inputs,
        selected=dict(code_pointer_relocation=code_slot, data_pointer_relocation=data_slot,
                      metadata_references=selected_references,
                      code_pointer_target_owner=hex(owner(code_slot[2])), metadata_source_owner=None),
        constructor_reference=list(constructor), location_reference=list(location_use),
        data=[dict(role=role, bytes_hex=raw(a, n).hex(), **span(a, n)) for role, a, n in [
            ("armory-string-vtable", 0x145ED76E8, 32),
            ("armory-rust-location", 0x145ED76D0, 24),
            ("armory-localization-literals", 0x145ED7708, 14),
            ("armory-runtime-function", 0x1481FA240, 12)]],
        source_path_reference=dict(path="docs/analysis/evidence/0.113.2/q41-c01/contract.json", role="armory-path"),
        source_location=dict(path=raw(location[0], location[1]).decode(), line=location[2], column=location[3]),
        declared_extent=span(0x140136300, 0x1435),
        ranges=[dict(role=role, assembly=role + ".asm", **span(a, b-a),
                     assembly_sha256=digest(assembly[role].encode())) for role, (a, b) in RANGES.items()],
        source_projection=dict(path=str(source_path.relative_to(ROOT)), sha256=digest(projection.encode()),
                               contract='Armory non-health effect -> item.equip -> {line} -> effect_line'),
        case_count=len(cases), cases=cases,
        conclusion="Selected code slot is a String display adapter for one Armory localization argument; the noncode relocation is a Rust Location path; the ownerless exported reference is PE runtime-function metadata.",
        limits=["Synthetic original-instruction replay checks descriptor and ABI transfers, not the complete localization implementation or rendered text.",
                "Template key selection and selected {line} source consumer match statically; whole Armory behavior and source execution remain unverified.",
                "No new function ownership is inferred from PE declared extents or metadata references; original census counts remain unchanged.",
                "Compiler, game, original/rebuilt comparison, saves and configuration are not invoked."])
    destination = WORK / "staged" if args.stage else CURATED
    if args.stage:
        destination.mkdir(parents=True, exist_ok=True)
        for role, text in assembly.items():
            (destination / (role + ".asm")).write_text(text)
        (destination / "contract.json").write_text(json.dumps(record, indent=2) + "\n")
    else:
        assert json.loads((destination / "contract.json").read_text()) == record
        for role, text in assembly.items():
            assert (destination / (role + ".asm")).read_text() == text
    print(f"Passed {len(cases)} original-instruction cases; A02/A03/O02 membership and target bytes verified; no compiler/game.")


if __name__ == "__main__":
    main()
