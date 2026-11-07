#!/usr/bin/env python3
"""Check the bounded current Armory Slot diagnostic contract without a build/game.

Exact original instructions run with synthetic action/state/account-snapshot
memory. ECS iteration, account projection and UI rendering are outside this
check. --stage writes reviewable evidence only under runtime/.
"""
import argparse
import hashlib
import json
import struct
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
WORK = ROOT / "runtime/analysis/history/findings/q41-c01/53e633ec2c9b"
CURATED = ROOT / "docs/analysis/evidence/0.113.2/q41-c01"
RANGES = {
    "dispatch": (0x140147509, 0x140147528),
    "slot-action": (0x14014786B, 0x1401478B1),
    "slot-bounds-panic": (0x140147B9D, 0x140147BB0),
    "bounds-diagnostic": (0x145E9C123, 0x145E9C163),
}
DATA = {
    "action-targets": (0x145EE1FFC, 48),
    "armory-location": (0x145ED77E0, 24),
    "armory-path": (0x145ED6DF8, 46),
    "bounds-format": (0x1473A81D0, 55),
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as regs

    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Recover changed target before reusing addresses"
    image = target_bytes(target)
    pe = load_script("q41_c01_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    queue_path = ROOT / "docs/analysis/evidence/0.113.2/unknown-recovery.json"
    queue = json.loads(queue_path.read_text())
    assert queue["target"]["sha256"] == SHA
    diagnostic_input = queue["inputs"]["diagnostic-ownership.json"]
    diagnostic_path = ROOT / diagnostic_input["path"]
    assert hashlib.sha256(diagnostic_path.read_bytes()).hexdigest() == diagnostic_input["sha256"]
    diagnostics = json.loads(diagnostic_path.read_text())
    armory = next(row for row in diagnostics["diagnostics"]
                  if row["path"] == "crates/wenilla-rogue-app/src/screens/armory.rs")
    selected_diagnostic = next(row for row in armory["verified_references"]
                               if row["instruction_address"] == "0x140147b9d")
    assert selected_diagnostic["kind"] == "rust_location"
    assert selected_diagnostic["target_address"] == "0x145ed77e0"
    assert selected_diagnostic["runtime_function_start"] == "0x140147060"

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return image[offset:offset + size]

    def span(address, size):
        return dict(address=hex(address), end_exclusive=hex(address + size),
                    byte_count=size, sha256=hashlib.sha256(raw(address, size)).hexdigest())

    assert raw(0x140147B9D, 7).hex() == "4c8d053cfcd805"
    path, count, line, column = struct.unpack("<QQII", raw(0x145ED77E0, 24))
    assert (path, count, line, column) == (0x145ED6DF8, 46, 1845, 28)
    assert raw(path, count) == b"crates\\wenilla-rogue-app\\src\\screens\\armory.rs"
    assert raw(0x1473A81D0, 55) == b" index out of bounds: the len is \xc0\x12 but the index is \xc0\x00"
    base = 0x145EE1FFC
    targets = [base + offset for offset in struct.unpack("<12i", raw(base, 48))]
    assert targets[5] == 0x14014786B

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    assembly = {}
    for role, (start, end) in RANGES.items():
        instructions = list(decoder.disasm(raw(start, end - start), start))
        assert sum(i.size for i in instructions) == end - start
        assembly[role] = "\n".join(
            f"{i.address:016x}: {i.bytes.hex():30} {i.mnemonic} {i.op_str}".rstrip()
            for i in instructions) + "\n"

    # The finite switch lane is admitted explicitly as discriminant 7. This does
    # not infer a bound for every possible enum discriminant at the dispatch.
    native = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    native.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for section in pe.sections:
        offset, size = section["raw_offset"], section["raw_size"]
        native.mem_write(pe.image_base + section["rva"], image[offset:offset + size])
    heap, stack = 0x200000000, 0x300000000
    native.mem_map(heap, 0x10000)
    native.mem_map(stack, 0x10000)
    rbp, rsp = stack + 0x1000, stack + 0xE000
    continuation, panic = 0x1401471A6, 0x145E9C123
    trace = []

    def reg(name, value=None):
        register = getattr(regs, "UC_X86_REG_" + name)
        if value is not None:
            native.reg_write(register, value)
        return native.reg_read(register)

    def hook(_, pc, size, unused):
        trace.append(pc)
        if pc in (continuation, panic):
            native.emu_stop()
            return
        assert any(a <= pc and pc + size <= b for a, b in RANGES.values()), hex(pc)

    native.hook_add(UC_HOOK_CODE, hook)
    rows = []
    for slot in range(19):
        for worn in (0, 101000, 0xFFFFFFFF):
            native.mem_write(heap, bytes(0x1000))
            native.mem_write(stack, bytes(0x10000))
            action, view, tick = heap, heap + 0x100, heap + 0x200
            native.mem_write(action, struct.pack("<IB", 7, slot))
            native.mem_write(view + 0x48, struct.pack("<II", 1, 202000))
            native.mem_write(rbp + 0x218, struct.pack("<Q", view))
            native.mem_write(rbp + 0x220, struct.pack("<Q", tick))
            native.mem_write(rbp + 0x250, struct.pack("<I", 23))
            native.mem_write(rbp + 0x40 + slot * 4, struct.pack("<I", worn))
            for name, value in (("RBP", rbp), ("RSP", rsp), ("RSI", action)):
                reg(name, value)
            trace.clear()
            native.emu_start(0x140147509, 0, count=1000)
            present, selected = struct.unpack("<II", native.mem_read(view + 0x48, 8))
            focused = bytes(native.mem_read(view + 0x70, 2))
            assert reg("RIP") == continuation
            assert (present, selected, focused) == (int(worn != 0), worn, bytes([1, slot]))
            assert struct.unpack("<I", native.mem_read(tick, 4))[0] == 23
            assert 0x14014786B in trace and 0x140147526 in trace
            rows.append(dict(slot=slot, worn=worn, selected=worn if present else None,
                             focused_slot=slot, continuation=hex(continuation)))

    for slot in (19, 255):
        native.mem_write(heap, bytes(0x1000))
        native.mem_write(stack, bytes(0x10000))
        native.mem_write(heap, struct.pack("<IB", 7, slot))
        native.mem_write(rbp + 0x218, struct.pack("<Q", heap + 0x100))
        native.mem_write(rbp + 0x220, struct.pack("<Q", heap + 0x200))
        for name, value in (("RBP", rbp), ("RSP", rsp), ("RSI", heap)):
            reg(name, value)
        trace.clear()
        native.emu_start(0x140147509, 0, count=1000)
        assert reg("RIP") == panic
        assert (reg("RCX"), reg("RDX"), reg("R8")) == (slot, 19, 0x145ED77E0)
        assert 0x140147892 in trace and 0x140147B9D in trace
        rows.append(dict(slot=slot, panic=hex(panic), length=19,
                         location=hex(reg("R8")), source_line=line, source_column=column))

    source = (ROOT / "crates/azeroth-survivors-re/src/armory.rs").read_text()
    slot_arm = source[source.index("            ArmoryAction::Slot(slot) => {"):
                      source.index("            ArmoryAction::Piece(id) => {")]
    worn_body = source[source.index("    pub fn worn("):source.index("    pub fn cosmetic(")]
    assert "view.slot = Some(slot);" in slot_arm
    assert "view.selected = gear.worn(class, slot);" in slot_arm
    assert "let slot = native_slot(class, slot);" in worn_body
    assert ".get(&(class, slot))" in worn_body
    source_projection = dict(
        path="crates/azeroth-survivors-re/src/armory.rs",
        slot_arm_sha256=hashlib.sha256(slot_arm.encode()).hexdigest(),
        worn_body_sha256=hashlib.sha256(worn_body.encode()).hexdigest(),
        contract="Slot UI producer -> ArmoryAction::Slot -> view.slot and GearSave::worn -> view.selected",
        limit="Static live-source correspondence only; Rust and UI were not executed.")
    record = dict(
        target_sha256=SHA, lead="Q41-C01", selected_site="0x140147b9d",
        queue_input=dict(path=queue_path.relative_to(ROOT).as_posix(),
                         sha256=hashlib.sha256(queue_path.read_bytes()).hexdigest()),
        diagnostic_input=diagnostic_input, selected_diagnostic=selected_diagnostic,
        declared_extent=span(0x140147060, 0xB64),
        source_location=dict(path=raw(path, count).decode(), line=line, column=column),
        dispatch=dict(site="0x140147526", table=hex(base),
                      table_targets=[hex(a) for a in targets],
                      admitted_action_discriminant=7, admitted_index=5,
                      limit="Only discriminant 7 is followed. No global enum-domain or all-target ownership proof."),
        ranges=[dict(role=role, assembly=role + ".asm", **span(a, b-a),
                     assembly_sha256=hashlib.sha256(assembly[role].encode()).hexdigest())
                for role, (a, b) in RANGES.items()],
        data=[dict(role=role, bytes_hex=raw(a, size).hex(), **span(a, size))
              for role, (a, size) in DATA.items()],
        source_projection=source_projection, case_count=len(rows),
        cases_sha256=hashlib.sha256(json.dumps(rows, separators=(",", ":")).encode()).hexdigest(),
        boundary_cases=[row for row in rows if row["slot"] in (0, 18, 19, 255)],
        native_instructions_executed=True, application_executed=False,
        rebuilt_code_executed=False,
        limits=["Only the selected switch lane and its direct bounds failure execute; account snapshot, ECS action membership/ticks and iteration are supplied synthetic memory.",
                "The 19-slot array is supplied after account projection. Arbitrary nonzero IDs test selection semantics, not ownership admission or item validity.",
                "A declared unwind extent and decoded branch/table targets do not become a Ghidra function-body ownership assertion.",
                "No original process, files, configuration, saves, compiler, reconstructed Rust, renderer or original/rebuilt comparison runs."])
    directory = WORK / "staged" if args.stage else CURATED
    if args.stage:
        directory.mkdir(parents=True, exist_ok=True)
        for role, text in assembly.items():
            (directory / (role + ".asm")).write_text(text)
        (directory / "contract.json").write_text(json.dumps(record, indent=2) + "\n")
    else:
        assert json.loads((directory / "contract.json").read_text()) == record
        for role, text in assembly.items():
            assert (directory / (role + ".asm")).read_text() == text
        provider = json.loads((directory / "ghidra.json").read_text())
        assert provider["target_sha256"] == SHA
        assert provider["provider"]["id"] == "ghidra"
        for artifact, digest in (("seed_file", "seed_sha256"),
                                 ("probe_plan", "probe_plan_sha256")):
            assert hashlib.sha256((directory / provider[artifact]).read_bytes()).hexdigest() == provider[digest]
        assert provider["function_body"]["total_bytes"] == 1137
        assert not any(int(row["start"], 16) <= 0x140147B9D <= int(row["end"], 16)
                       for row in provider["function_body"]["ranges"])
        branch = next(row for row in provider["records"] if row.get("address") == "0x140147892")
        assert branch["bytes"] == raw(0x140147892, 6).hex()
        assert branch["flow"]["direct_destinations"] == ["0x140147b9d"]
        call = next(row for row in provider["records"] if row.get("address") == "0x140147ba9")
        assert call["bytes"] == raw(0x140147BA9, 5).hex()
        assert call["flow"]["direct_destinations"] == ["0x145e9c123"]
    print(f"Passed {len(rows)} exact original Slot-action/bounds cases and current source projection; no build/game.")


if __name__ == "__main__":
    main()
