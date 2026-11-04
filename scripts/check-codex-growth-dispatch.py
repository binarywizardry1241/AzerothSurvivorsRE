#!/usr/bin/env python3
"""Check the selected Codex field+0x44 classification; no compiler or game."""
import hashlib
import json
import re
import struct
import argparse
from pathlib import Path

from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OP_MEM
from capstone import __version__ as CAPSTONE_VERSION
from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script


PROOF = ROOT / "docs/analysis/evidence/0.120.2/codex-growth-dispatch/manifest.json"


def check_growth_ceiling(proof):
    """Replay admitted Codex branches up to the jewelry-description call."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (
        UC_X86_REG_RBP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RIP, UC_X86_REG_XMM2,
    )

    target = latest_target(verify=True)
    assert all(target[key] == proof["target"][key]
               for key in ("version", "sha256", "size_bytes"))
    image = target_bytes(target)
    pe = load_script("codex_dispatch_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def native(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    owner = proof["owner"]
    start = int(owner["start"], 16)
    end = int(owner["end_exclusive"], 16)
    assert hashlib.sha256(native(start, end - start)).hexdigest() == owner["sha256"]
    global_address = int(proof["jewelry_global"], 16)
    descriptor = struct.unpack("<Q", native(global_address, 8))[0]
    rows, count = struct.unpack("<QQ", native(descriptor, 16))
    assert count == proof["jewelry_count"]
    outer = int(proof["outer_dispatch"], 16)
    outer_table = int(proof["outer_table"], 16)
    stack = 0x200000000
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(stack, 4096)
    pages = set(range(start & ~4095, (end + 4095) & ~4095, 4096))
    pages.update(address & ~4095 for address in (global_address, descriptor))
    pages.update(int(address, 16) & ~4095 for address in proof["data_addresses"])
    pages.update(range(rows & ~4095, (rows + count * 72 + 4095) & ~4095, 4096))
    for page in sorted(pages):
        machine.mem_map(page, 4096)
        machine.mem_write(page, native(page, 4096))
    machine.reg_write(UC_X86_REG_RBP, stack)

    expected_stops = {int(case["formatter_call"], 16) for case in proof["cases"]}
    reached = []

    def stop_at_formatter(emulator, address, _size, _data):
        if address in expected_stops:
            reached.append(address)
            emulator.emu_stop()

    machine.hook_add(UC_HOOK_CODE, stop_at_formatter)
    producer = int(proof["row_producer"], 16)
    row_ready = int(proof["row_ready"], 16)
    for case in proof["cases"]:
        address = rows + case["row"] * 72
        row = native(address, 72)
        key, length = struct.unpack_from("<QQ", row)
        assert native(key, length).decode() == case["key"]
        assert row[68] == case["kind"]
        assert struct.unpack_from("<I", row, 64)[0] == int(case["base_bits"], 16)
        family = (outer_table + struct.unpack("<i", native(outer_table + 4 * row[68], 4))[0]
                  if row[68] < 17 else int(proof["outer_default"], 16))
        assert family == int(case["family"], 16)
        machine.reg_write(UC_X86_REG_RCX, case["row"])
        machine.emu_start(producer, row_ready, count=12)
        assert machine.reg_read(UC_X86_REG_RIP) == row_ready
        assert struct.unpack("<Q", machine.mem_read(stack + 0x660, 8))[0] == address
        machine.emu_start(outer, family, count=12)
        assert machine.reg_read(UC_X86_REG_RIP) == family
        # Resume after the family-local translation call. The selector reloads
        # the admitted row and computes the amount before the formatter call.
        reached.clear()
        machine.emu_start(int(case["ceiling_dispatch"], 16), 0, count=30)
        assert reached == [int(case["formatter_call"], 16)]
        assert machine.reg_read(UC_X86_REG_RDX) == address
        assert machine.reg_read(UC_X86_REG_XMM2) & 0xffffffff == int(case["ceiling_bits"], 16)
        template = case["template"].encode()
        assert native(int(case["template_address"], 16), len(template)) == template

    for record in proof["source_receipts"]:
        assert file_sha256(ROOT / record["path"]) == record["sha256"], record["path"]
    from discovery_native_subject import verify_native_query_subject

    query = proof["query"]
    result = json.loads((ROOT / query["result"]["path"]).read_text())["structuredContent"]
    verify_native_query_subject(ROOT, result, query, target, image=image, pe=pe)
    return dict(target=target["version"], jewelry_rows=count,
                admitted_ceiling_cases=len(proof["cases"]), durable_queries=1, game_executed=False)


def check_classification(proof_path):
    """Check a later bounded selector classification without reopening old proof."""
    proof = json.loads(proof_path.read_text())
    if proof.get("scope") == "admitted_growth_ceiling":
        return check_growth_ceiling(proof)
    target = latest_target(verify=True)
    assert all(target[key] == proof["target"][key]
               for key in ("version", "sha256", "size_bytes"))
    image = target_bytes(target)
    pe = load_script("codex_dispatch_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def native(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    def verify(record):
        assert file_sha256(ROOT / record["path"]) == record["sha256"], record["path"]

    for record in proof["inputs"] + proof["source_first"]:
        verify(record)
    subject = proof["raw_subject"]
    verify(subject)
    subject_bytes = native(int(subject["virtual_address"], 16), subject["byte_count"])
    assert hashlib.sha256(subject_bytes).hexdigest() == subject["sha256"]
    instructions = 0
    for row in proof["native_ranges"]:
        start = int(row["virtual_address"], 16)
        raw = native(start, row["byte_count"])
        assert hashlib.sha256(raw).hexdigest() == row["sha256"]
        decoded = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start))
        assert sum(i.size for i in decoded) == len(raw)
        assert len(decoded) == row["instruction_count"]
        assembly = "\n".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip()
                             for i in decoded) + "\n"
        verify(row["assembly"])
        assert (ROOT / row["assembly"]["path"]).read_text() == assembly
        instructions += len(decoded)
    for row in proof["native_data"]:
        assert hashlib.sha256(native(int(row["virtual_address"], 16), row["byte_count"])).hexdigest() == row["sha256"]
    for row in proof["tables"]:
        address = int(row["virtual_address"], 16)
        actual = [hex(address + item[0]) for item in struct.iter_unpack(
            "<i", native(address, len(row["case_targets"]) * 4))]
        assert actual == row["case_targets"]
    row_input = proof["row_input"]
    descriptor = struct.unpack("<Q", native(int(row_input["global_address"], 16), 8))[0]
    assert hex(descriptor) == row_input["descriptor"]
    pointer, count = struct.unpack("<QQ", native(descriptor, 16))
    assert (hex(pointer), count) == (row_input["data_address"], len(proof["jewelry_rows"]))
    records = []
    for index in range(count):
        address = pointer + index * 72
        raw = native(address, 72)
        key, length = struct.unpack_from("<QQ", raw)
        records.append(dict(index=index, address=hex(address),
                            key=native(key, length).decode(),
                            base_bits=hex(struct.unpack_from("<I", raw, 64)[0]),
                            kind=raw[68], slot=raw[69]))
    assert records == proof["jewelry_rows"]
    source = (ROOT / "crates/azeroth-survivors-re/src/loot_rewards/catalog_01120.rs").read_text()
    source_rows = re.findall(r'key: "([^"]+)"[^\n]+base: f32::from_bits\((0x[\da-f]+)\), tag: (\d+), slot: (\d+)', source)
    assert len(source_rows) == count
    for row, (key, base, tag, slot) in zip(records, source_rows):
        native_tag = int(tag) if int(tag) < 6 else 6 if int(tag) == 19 else int(tag) + 1
        assert (row["key"], row["base_bits"], row["kind"], row["slot"]) == (key, hex(int(base, 16)), native_tag, int(slot))
    codex = (ROOT / "crates/azeroth-survivors-re/src/codex.rs").read_text()
    assert "label(panel, art, &entry_text.growth, 12., MUTED);" in codex
    localized = json.loads((ROOT / "crates/azeroth-survivors-re/assets/codex-locales-0.105.0.json").read_text())["en"]
    for row in proof["growth_roles"]:
        address, count = int(row["template_address"], 16), row["template_byte_count"]
        assert native(address, count).decode() == row["template"]
        assert localized[row["source_example_key"]]["growth"] == row["source_example_growth"]
    assert proof["queries"], "Classification needs its completed durable native query"
    from discovery_native_subject import verify_native_query_subject
    for query in proof["queries"]:
        for role in ("plan", "journal", "result"):
            verify(query[role])
        stored = json.loads((ROOT / query["result"]["path"]).read_text())
        evidence = json.loads(stored["content"][0]["text"])
        verify_native_query_subject(ROOT, stored["structuredContent"], query, target, image=image, pe=pe)
        assert evidence["evidence_id"] == query["evidence_id"]
        assert evidence["parameters"]["procedure"] == query["procedure"]
        assert hashlib.sha256(stored["structuredContent"]["normalized_result"].encode()).hexdigest() == query["normalized_sha256"]

    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn
    import unicorn.x86_const as registers
    assert proof["native_tool_versions"] == {"capstone": CAPSTONE_VERSION, "unicorn": unicorn.__version__}
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    outer = proof["outer_selector"]
    first = int(outer["start"], 16)
    stops = {int(address, 16) for address in proof["tables"][0]["case_targets"]}
    stops.add(int(outer["default_target"], 16))
    pages = {first & ~4095, int(proof["tables"][0]["virtual_address"], 16) & ~4095}
    pages.update(address & ~4095 for address in stops)
    for page in pages:
        machine.mem_map(page, 4096)
        machine.mem_write(page, native(page, 4096))
    stack, row_address = 0x200000000, 0x210000000
    machine.mem_map(stack, 0x20000)
    machine.mem_map(row_address, 4096)
    bp = stack + 0x8000
    captured = []

    def capture(emulator, address, _size, _data):
        if address in stops:
            captured.append(hex(address))
            emulator.emu_stop()

    machine.hook_add(UC_HOOK_CODE, capture)
    for kind in range(256):
        machine.mem_write(bp + 0x670, struct.pack("<Q", row_address))
        machine.mem_write(row_address + 68, bytes([kind]))
        machine.reg_write(registers.UC_X86_REG_RBP, bp)
        machine.reg_write(registers.UC_X86_REG_RSP, bp + 0x7000)
        captured.clear()
        machine.emu_start(first, 0, count=30)
        expected = proof["tables"][0]["case_targets"][kind] if kind < 17 else outer["default_target"]
        assert captured == [expected], (kind, captured, expected)
    return dict(target=target["version"], native_ranges=len(proof["native_ranges"]),
                instructions=instructions, jewelry_rows=len(records), classified_growth_roles=len(proof["growth_roles"]),
                original_instruction_cases=256, durable_queries=len(proof["queries"]),
                source_omission_identified=False, compilation_or_game_execution=False)


def run():
    proof = json.loads(PROOF.read_text())
    target = latest_target(verify=True)
    assert all(target[key] == proof["target"][key]
               for key in ("version", "sha256", "size_bytes"))
    image = target_bytes(target)
    pe = load_script("codex_dispatch_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def native(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    def verify(record):
        assert file_sha256(ROOT / record["path"]) == record["sha256"], record["path"]

    for record in proof["inputs"] + proof["source_first"]:
        verify(record)
    instruction_count = 0
    for row in proof["native_ranges"]:
        start = int(row["virtual_address"], 16)
        raw = native(start, row["byte_count"])
        assert hashlib.sha256(raw).hexdigest() == row["sha256"]
        decoded = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start))
        assert sum(instruction.size for instruction in decoded) == len(raw)
        assert len(decoded) == row["instruction_count"]
        verify(row["assembly"])
        assembly = "\n".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip()
                             for i in decoded)
        assert (ROOT / row["assembly"]["path"]).read_text() == assembly + "\n"
        instruction_count += len(decoded)
    for row in proof["native_data"]:
        raw = native(int(row["virtual_address"], 16), row["byte_count"])
        assert hashlib.sha256(raw).hexdigest() == row["sha256"]
    table = proof["table"]
    address = int(table["virtual_address"], 16)
    targets = [hex(address + item[0])
               for item in struct.iter_unpack("<i", native(address, 80))]
    assert targets == table["case_targets"] and len(set(targets)) == 5
    outer = proof["outer_selector"]
    outer_address = int(outer["virtual_address"], 16)
    outer_case9 = hex(outer_address + struct.unpack_from("<i", native(outer_address, 68), 9 * 4)[0])
    assert outer_case9 == outer["case9_target"] == "0x1402e1ac8"

    # The bounded producer supplies an admitted index into the actual jewelry
    # slice, not an arbitrary object inferred from the nearby Codex diagnostic.
    initial_slice = struct.unpack("<Q", native(0x148534660, 8))[0]
    assert initial_slice == 0x1472c7218
    pointer, count = struct.unpack("<QQ", native(initial_slice, 16))
    assert pointer == 0x1472bfb30 and count == 23
    records = []
    for index in range(count):
        address = pointer + index * 72
        row = native(address, 72)
        key, length = struct.unpack_from("<QQ", row)
        records.append(dict(index=index, address=hex(address),
                            key=native(key, length).decode(),
                            base_bits=hex(struct.unpack_from("<I", row, 64)[0]),
                            kind=row[68], slot=row[69]))
    assert records == proof["jewelry_rows"]
    assert records[12]["key"] == "hoj" and records[12]["kind"] == 9
    source = (ROOT / "crates/azeroth-survivors-re/src/loot_rewards/catalog_01120.rs").read_text()
    source_rows = re.findall(r'key: "([^"]+)"[^\n]+base: f32::from_bits\((0x[\da-f]+)\), tag: (\d+), slot: (\d+)', source)
    assert len(source_rows) == 23
    for row, (key, base, tag, slot) in zip(records, source_rows):
        # The existing stable source tags predate Mystaria's inserted native tag6.
        native_tag = int(tag) if int(tag) < 6 else 6 if int(tag) == 19 else int(tag) + 1
        assert (row["key"], row["base_bits"], row["kind"], row["slot"]) == (
            key, hex(int(base, 16)), native_tag, int(slot))
    codex = (ROOT / "crates/azeroth-survivors-re/src/codex.rs").read_text()
    assert "label(panel, art, &entry_text.growth, 12., MUTED);" in codex
    assert "text.0.entry(code).or_default().extend(rows);" in codex
    localized = json.loads((ROOT / "crates/azeroth-survivors-re/assets/codex-locales-0.105.0.json").read_text())
    assert localized["en"]["hoj"]["growth"] == proof["existing_source_growth"]
    for query in proof["queries"]:
        for role in ("plan", "journal", "result"):
            verify(query[role])
        stored = json.loads((ROOT / query["result"]["path"]).read_text())
        evidence = json.loads(stored["content"][0]["text"])
        assert evidence["subject"]["digest"]["sha256"] == target["sha256"]
        assert evidence["evidence_id"] == query["evidence_id"]
        assert evidence["parameters"]["procedure"] == query["procedure"]
        assert hashlib.sha256(stored["structuredContent"]["normalized_result"].encode()).hexdigest() == query["normalized_sha256"]

    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn
    assert proof['native_tool_versions'] == {'capstone': CAPSTONE_VERSION, 'unicorn': unicorn.__version__}
    import unicorn.x86_const as registers

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    decoder.detail = True
    first, last, stop = 0x1402e1ae7, 0x1402e1c0f, 0x145a9ec50
    pages = {0x1461c3000, stop & ~4095}
    for instruction in decoder.disasm(native(first, last - first), first):
        pages.add(instruction.address & ~4095)
        for operand in instruction.operands:
            if operand.type == CS_OP_MEM and instruction.reg_name(operand.mem.base) == "rip":
                pages.add((instruction.address + instruction.size + operand.mem.disp) & ~4095)
    for page in pages:
        machine.mem_map(page, 4096)
        machine.mem_write(page, native(page, 4096))
    stack, row = 0x200000000, 0x210000000
    machine.mem_map(stack, 0x20000)
    machine.mem_map(row, 4096)
    bp = stack + 0x8000
    captured = []

    def capture(emulator, address, _size, _data):
        if address == stop:
            captured.append((emulator.reg_read(registers.UC_X86_REG_RDX),
                             emulator.reg_read(registers.UC_X86_REG_XMM2) & 0xffffffff,
                             emulator.reg_read(registers.UC_X86_REG_RCX)))
            emulator.emu_stop()

    machine.hook_add(UC_HOOK_CODE, capture)

    def f32(value):
        return struct.unpack("<f", struct.pack("<f", value))[0]

    def bits(value):
        return struct.unpack("<I", struct.pack("<f", value))[0]

    cases = 0
    for kind in range(256):
        for base in (-1., 0., .06, 1., 1e20, float("inf")):
            machine.mem_write(bp + 0x670, struct.pack("<Q", row))
            machine.mem_write(row + 64, struct.pack("<f", base) + bytes([kind]))
            machine.reg_write(registers.UC_X86_REG_RBP, bp)
            machine.reg_write(registers.UC_X86_REG_RSP, bp + 0x7000)
            machine.reg_write(registers.UC_X86_REG_MXCSR, 0x1f80)
            captured.clear()
            machine.emu_start(first, 0, count=100)
            expected = (float("inf") if kind in (0, 1, 2, 3, 4, 5, 6, 8)
                        else f32(.6) if kind == 9
                        else f32(f32(base) * (3. if kind in (7, 15, 18)
                                              else 4. if kind == 19 else 5.)))
            assert captured == [(row, bits(expected), bp + 0x1e0)], (kind, base, captured)
            cases += 1
    assert cases == proof["native_selector_cases"]

    # Execute the moved wrapper with only its optional lookup as a seam. Its
    # TEST/CMOVE pair preserves successful empty translations and otherwise
    # returns both original input words, not a guessed empty-string policy.
    wrapper = Uc(UC_ARCH_X86, UC_MODE_64)
    lookup, wrapper_start, wrapper_stop = 0x145b4f010, 0x145b4ef60, 0x220000000
    for page in {lookup & ~4095, wrapper_start & ~4095}:
        wrapper.mem_map(page, 4096)
        wrapper.mem_write(page, native(page, 4096))
    wrapper.mem_map(stack, 0x20000)
    wrapper.mem_map(wrapper_stop, 4096)
    wrapper.mem_write(wrapper_stop, b"\xcc")
    calls, result = [], []

    def lookup_boundary(emulator, address, _size, _data):
        if address == lookup:
            calls.append((emulator.reg_read(registers.UC_X86_REG_RCX),
                          emulator.reg_read(registers.UC_X86_REG_RDX)))
            emulator.reg_write(registers.UC_X86_REG_RAX, result[0])
            emulator.reg_write(registers.UC_X86_REG_RDX, result[1])
            sp = emulator.reg_read(registers.UC_X86_REG_RSP)
            return_to = struct.unpack("<Q", emulator.mem_read(sp, 8))[0]
            emulator.reg_write(registers.UC_X86_REG_RSP, sp + 8)
            emulator.reg_write(registers.UC_X86_REG_RIP, return_to)
        elif address == wrapper_stop:
            emulator.emu_stop()

    wrapper.hook_add(UC_HOOK_CODE, lookup_boundary)
    wrapper_cases = 0
    for length in (0, 73):
        for found in ((0, 0), (0, 55), (row + 256, 0), (row + 256, 13)):
            original = (0x1461c17d3, length)
            sp = stack + 0x10008
            wrapper.mem_write(sp, struct.pack("<Q", wrapper_stop))
            wrapper.reg_write(registers.UC_X86_REG_RSP, sp)
            wrapper.reg_write(registers.UC_X86_REG_RCX, original[0])
            wrapper.reg_write(registers.UC_X86_REG_RDX, original[1])
            result[:] = found
            calls.clear()
            wrapper.emu_start(wrapper_start, 0, count=40)
            actual = (wrapper.reg_read(registers.UC_X86_REG_RAX),
                      wrapper.reg_read(registers.UC_X86_REG_RDX))
            assert calls == [original] and actual == (found if found[0] else original)
            wrapper_cases += 1
    assert wrapper_cases == proof["native_wrapper_cases"]
    return dict(target=target["version"], native_ranges=len(proof["native_ranges"]),
                instructions=instruction_count, jewelry_rows=count,
                original_instruction_cases=cases + wrapper_cases,
                durable_queries=len(proof["queries"]),
                source_omission_identified=False, compilation_or_game_execution=False)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--proof", type=Path,
                        help="Later target-bound selector classification manifest")
    args = parser.parse_args()
    print(json.dumps(check_classification(args.proof) if args.proof else run(), indent=2))
