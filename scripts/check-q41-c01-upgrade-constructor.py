#!/usr/bin/env python3
"""Replay the selected current upgrade-constructor bounds contract statically.

Original instructions run against synthetic candidate, learned-instance and
stack memory. No Rust compiler, target process, save, renderer or game runs.
--stage writes proposed evidence beneath ignored runtime/ for review.
"""
import argparse
import bisect
import csv
import gzip
import hashlib
import json
import struct
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
KEEP = ROOT / "docs/analysis/evidence/0.113.2/q41-c01-upgrade-constructor"
WORK = ROOT / "runtime/q41-c01-upgrade-apply"
RANGES = {
    "candidate-bound": (0x1459657AD, 0x1459657E4),
    "candidate-index": (0x1459659DE, 0x145965A06),
    "candidate-publication": (0x145965770, 0x145965799),
    "cursor-copy": (0x145999200, 0x14599922D),
    "constructor-call": (0x1459994AD, 0x1459994E0),
    "constructor-dispatch": (0x145969C60, 0x145969CA1),
    "upgrade-index": (0x14596A412, 0x14596A4C7),
    "upgrade-bounds": (0x14596B861, 0x14596B874),
}
DATA = {
    "constructor-targets": (0x14730ED74, 20),
    "upgrade-location": (0x14730E150, 24),
    "upgrade-path": (0x14730B2E8, 41),
}


def digest(value):
    return hashlib.sha256(value).hexdigest()


def encoded(value):
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as regs

    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Recover changed target before using these addresses"
    image = target_bytes(target)
    pe = load_script("q41_constructor_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        result = image[offset:offset + size]
        assert len(result) == size
        assert pe.rva_offset(address + size - 1 - pe.image_base) == offset + size - 1
        return result

    def span(address, size):
        return dict(address=hex(address), end_exclusive=hex(address + size),
                    byte_count=size, sha256=digest(raw(address, size)))

    proof_path = ROOT / "docs/analysis/evidence/0.113.2/unknown-recovery.json"
    proof = json.loads(proof_path.read_text())
    assert proof["target"]["sha256"] == SHA
    inputs = {key: proof["inputs"][key] for key in ("diagnostic-ownership.json", "bodies.tsv.gz")}
    for info in inputs.values():
        assert digest((ROOT / info["path"]).read_bytes()) == info["sha256"]
    diagnostics = json.loads((ROOT / inputs["diagnostic-ownership.json"]["path"]).read_text())
    with gzip.open(ROOT / inputs["bodies.tsv.gz"]["path"], "rt") as source:
        bodies = sorted((int(row["start"], 16), int(row["end"], 16), int(row["entry"], 16))
                        for row in csv.DictReader(source, delimiter="\t") if row["external"] == "false")
    assert all(a[1] < b[0] for a, b in zip(bodies, bodies[1:]))
    starts = [row[0] for row in bodies]

    def owner(site):
        index = bisect.bisect_right(starts, site) - 1
        return bodies[index][2] if index >= 0 and site <= bodies[index][1] else None

    selected = []
    for diagnostic in sorted(diagnostics["diagnostics"], key=lambda row: row["path"]):
        if not diagnostic["custom_game_crate"] or diagnostic["system_id"] in proof["excluded_logic_system_ids"]:
            continue
        for reference in diagnostic["verified_references"]:
            if owner(int(reference["instruction_address"], 16)) is None:
                selected.append([diagnostic["path"], diagnostic["system_id"],
                                 reference["instruction_address"], reference["target_address"],
                                 reference["runtime_function_start"], reference["runtime_function_end"],
                                 reference["instruction_bytes"], None])
    assert len(selected) == proof["selectors"]["Q41-C01"]["records"] == 57
    # The queue commits one compact JSON array per line with insertion ordering.
    selection_digest = digest(b"".join((json.dumps(row, ensure_ascii=False, separators=(",", ":")) + "\n").encode()
                                     for row in selected))
    assert selection_digest == proof["selectors"]["Q41-C01"]["output_sha256"]
    selected_row = next(row for row in selected if row[2] == "0x14596b868")
    assert selected_row[:4] == ["crates/wenilla-rogue/src/game/upgrades.rs", "custom-game-game-upgrades",
                                "0x14596b868", "0x14730e150"]
    assert raw(0x14596B868, 7).hex() == selected_row[6]
    path, count, line, column = struct.unpack("<QQII", raw(0x14730E150, 24))
    assert (path, count, line, column) == (0x14730B2E8, 41, 348, 47)
    assert raw(path, count) == b"crates\\wenilla-rogue\\src\\game\\upgrades.rs"
    helper_path = ROOT / "docs/analysis/evidence/0.113.2/q41-c01/contract.json"
    helper = json.loads(helper_path.read_text())
    assert helper["target_sha256"] == SHA
    bounds = next(row for row in helper["ranges"] if row["role"] == "bounds-diagnostic")
    assert digest(raw(int(bounds["address"], 16), bounds["byte_count"])) == bounds["sha256"]
    table = 0x14730ED74
    targets = [table + offset for offset in struct.unpack("<5i", raw(table, 20))]
    assert targets[1] == 0x14596A412

    assembly = {}
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for role, (start, end) in RANGES.items():
        instructions = list(decoder.disasm(raw(start, end - start), start))
        assert sum(item.size for item in instructions) == end - start
        assembly[role] = "\n".join(f"{item.address:016x}: {item.bytes.hex():30} {item.mnemonic} {item.op_str}".rstrip()
                                     for item in instructions) + "\n"

    vm = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(section["rva"] + max(section["virtual_size"], section["raw_size"]) for section in pe.sections)
    vm.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for section in pe.sections:
        offset, size = section["raw_offset"], section["raw_size"]
        vm.mem_write(pe.image_base + section["rva"], image[offset:offset + size])
    heap, stack = 0x200000000, 0x300000000
    vm.mem_map(heap, 0x10000)
    vm.mem_map(stack, 0x10000)
    game, choice, instances, descriptor, kinds = [heap + offset for offset in (0, 0x2000, 0x3000, 0x5000, 0x6000)]
    rbp, rsp = stack + 0x1000, stack + 0xE000
    panic, collector = 0x145E9C123, 0x1459808C0
    allowed = [RANGES[role] for role in ("constructor-dispatch", "upgrade-index", "upgrade-bounds")]

    def reg(name, value=None):
        register = getattr(regs, "UC_X86_REG_" + name)
        if value is not None:
            vm.reg_write(register, value)
        return vm.reg_read(register)

    def put(address, value):
        vm.mem_write(address, struct.pack("<Q", value))

    def get(address):
        return struct.unpack("<Q", vm.mem_read(address, 8))[0]

    def hook(_, pc, size, unused):
        if pc in (panic, collector):
            vm.emu_stop()
            return
        assert any(start <= pc and pc + size <= end for start, end in allowed), hex(pc)

    vm.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for length in (0, 1, 2, 6):
        indexes = sorted({0, max(0, length - 1), length, length + 1, 1 << 63, (1 << 64) - 1})
        for header in (0, 1, 4, (1 << 63) - 1, (1 << 63) + 1):
            for index in indexes:
                vm.mem_write(heap, bytes(0x10000))
                vm.mem_write(stack, bytes(0x10000))
                put(game + 0x330, instances)
                put(game + 0x338, length)
                put(choice, header)
                put(choice + 0x18, index)
                put(descriptor + 0x30, kinds)
                put(descriptor + 0x38, 5)
                vm.mem_write(kinds, bytes(range(5)))
                for slot in range(length):
                    put(instances + slot * 0x58, descriptor)
                for name, value in (("RBP", rbp), ("RSP", rsp), ("R14", game), ("R13", heap + 0x7000),
                                    ("R8", choice), ("RBX", 4), ("XMM0", 0)):
                    reg(name, value)
                vm.emu_start(0x145969C60, 0, count=200)
                row = dict(length=length, index=index, header=hex(header))
                if index >= length:
                    assert reg("RIP") == panic
                    assert (reg("RCX"), reg("RDX"), reg("R8")) == (index, length, 0x14730E150)
                    assert vm.mem_read(rbp + 0x247, 1) == b"\x01"
                    row["result"] = "bounds_failure"
                else:
                    assert reg("RIP") == collector
                    assert reg("RDX") == rbp + 0x168
                    assert get(rbp + 0x168) == kinds
                    assert get(rbp + 0x170) == kinds + 5
                    assert get(rbp + 0x178) == descriptor
                    assert [get(rbp + offset) for offset in (0x180, 0x190, 0x1A8)] == [instances + index * 0x58] * 3
                    assert [get(rbp + offset) for offset in (0x188, 0x198)] == [game + 0x480] * 2
                    assert get(rbp + 0x220) == index
                    row["result"] = "collector_capture"
                cases.append(row)

    source_path = ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/choices.rs"
    source = source_path.read_text()
    producer = source.split("for (index, instance) in self.abilities.iter().enumerate()", 1)[1].split("// Native completes", 1)[0]
    constructor = source.split("Candidate::Upgrade(index) => {", 1)[1].split("// Native1454db08e", 1)[0]
    assert "candidate: Candidate::Upgrade(index)" in producer
    assert "let instance = &self.abilities[index];" in constructor
    assert "upgrades::eligible_types(instance" in constructor
    assert "ability_key: instance.definition.key" in constructor
    payload_path = ROOT / "crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs"
    payload = payload_path.read_text().split("pub fn for_choice(", 1)[1].split("/// Native description reads", 1)[0]
    assert ".find(|instance| instance.definition.key == choice.ability_key)" in payload
    assert "card.lines = upgrade_lines(instance, &choice.upgrades" in payload
    record = dict(
        schema_version=1, target_sha256=SHA, lead="Q41-C01",
        classification_id="Q41-C01-upgrade-constructor-14596b868", selected_site="0x14596b868",
        queue_input=dict(path=proof_path.relative_to(ROOT).as_posix(), sha256=digest(proof_path.read_bytes())),
        selector_inputs=inputs, selector_output_sha256=selection_digest, selected_row=selected_row,
        declared_extent=span(0x145969BF0, 0x1C99),
        source_location=dict(path=raw(path, count).decode(), line=line, column=column),
        shared_diagnostic=dict(path=helper_path.relative_to(ROOT).as_posix(),
                               sha256=digest(helper_path.read_bytes()), role="bounds-diagnostic"),
        dispatch=dict(site="0x145969c9f", table=hex(table), targets=[hex(address) for address in targets],
                      admitted_selector=1, normalization="Nonnegative header -> 1; negative header XOR 0x8000000000000000",
                      limit="Only selector 1 is followed; no universal enum-domain or dynamic-alias proof"),
        ranges=[dict(role=role, assembly=role + ".asm", **span(start, end - start),
                     assembly_sha256=digest(assembly[role].encode())) for role, (start, end) in RANGES.items()],
        data=[dict(role=role, bytes_hex=raw(address, size).hex(), **span(address, size))
              for role, (address, size) in DATA.items()],
        source_projections=[dict(path=source_path.relative_to(ROOT).as_posix(),
                                 producer_sha256=digest(producer.encode()), constructor_sha256=digest(constructor.encode())),
                            dict(path=payload_path.relative_to(ROOT).as_posix(), for_choice_sha256=digest(payload.encode()))],
        native_cases=len(cases), valid_cases=sum(row["result"] == "collector_capture" for row in cases),
        invalid_cases=sum(row["result"] == "bounds_failure" for row in cases), cases_sha256=digest(encoded(cases)),
        source_change_required=False, native_instructions_executed=True, compilation_run=False, game_run=False,
        limits=["Candidate/Game/instance/pointer/stack values are synthetic. Captures are checked at the collector boundary; collector, shuffle, prose, allocation and display publication do not execute.",
                "Header cases include a synthetic negative selector-1 value; decoding it does not establish that live producers can publish it.",
                "Producer/publication/cursor extracts are statically traced, not executed by these cases. All aliases, arbitrary-run pointer ancestry, source execution, UI and parity remain unverified.",
                "Existing bounds-panic consumer evidence in ../q41-c01/ owns the shared diagnostic helper; no duplicate helper extraction is retained.",
                "The canonical 57-site ownerless inventory and Ghidra body boundaries remain unchanged."])
    output = WORK / "staged-constructor" if args.stage else KEEP
    if args.stage:
        output.mkdir(parents=True, exist_ok=True)
        for role, text in assembly.items():
            (output / (role + ".asm")).write_text(text)
        (output / "contract.json").write_text(json.dumps(record, indent=2) + "\n")
    else:
        assert json.loads((output / "contract.json").read_text()) == record
        for role, text in assembly.items():
            assert (output / (role + ".asm")).read_text() == text
        provider = json.loads((output / "ghidra.json").read_text())
        assert provider["target_sha256"] == SHA and provider["provider"]["id"] == "ghidra"
        assert provider["function_body"]["total_bytes"] == 177
        assert provider["function_body"]["ranges"] == [{"start": "0x145969bf0", "end": "0x145969ca0"}]
        assert provider["site_owner"]["found"] is False
        assert provider["branch"]["bytes"] == raw(0x14596A427, 6).hex()
        assert provider["branch"]["flow"]["direct_destinations"] == ["0x14596b861"]
        assert provider["call"]["bytes"] == raw(0x14596B86F, 5).hex()
        assert provider["call"]["flow"]["direct_destinations"] == ["0x145e9c123"]
        for name in ("probe-plan.json", "probe-seeds.tsv"):
            assert digest((output / name).read_bytes()) == provider["reproduction"][name]
        assert provider["observed_seed_sha256"] == provider["reproduction"]["probe-seeds.tsv"]
    print(json.dumps(dict(result="passed", native_cases=len(cases), compilation_run=False, game_run=False, REA_started=False)))


if __name__ == "__main__":
    main()
