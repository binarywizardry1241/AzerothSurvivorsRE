#!/usr/bin/env python3
"""Replay the bounded 0.117.0 purchased-tabard value predicate.

The original pure leaf parses the supplied UTF-8 bytes, checks the current ID
mask/pointer table and rejects achievement-gated descriptors. No external call
is intercepted, no reconstructed Rust or native game process is executed.
"""

import argparse
import hashlib
import importlib.util
import json
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes


SHA = "507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293"
ROUTINE = (0x145B2BBD0, 0x145B2BDEE)
ROUTINE_SHA = "c18c75d0d13a2f1d3ec67afa14902cf0a87cd6bf9c438a8bcd11591b074b9d55"
POINTER_TABLE = (0x1475C60A0, 0x1475C6168)
MASK = 0x1FFFC3F
KEPT = ROOT / "docs/analysis/evidence/0.117.0/tabard-admission/purchases.json"
STAGED = ROOT / "runtime/analysis/history/native-recovery/target/6f083622318f/tabard-admission/checker-purchases.json"


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True,
                                     separators=(",", ":")).encode()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true",
                        help="stage deterministic cases under project runtime/")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "purchased-tabard proof belongs to another EXE"
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location(
        "purchased_tabards_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)

    def raw(start, end):
        offset = pe.rva_offset(start - pe.image_base)
        result = data[offset:offset + end - start]
        assert len(result) == end - start
        return result

    code = raw(*ROUTINE)
    assert hashlib.sha256(code).hexdigest() == ROUTINE_SHA
    sys.path[:0] = [str(ROOT / "runtime/tests/query-python-deps"),
                    str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import UC_HOOK_MEM_WRITE
    from equipment_native import EquipmentProbe

    instructions = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(code, ROUTINE[0]))
    assert sum(row.size for row in instructions) == len(code)
    assert all(row.mnemonic != "call" for row in instructions)
    table_bytes = raw(*POINTER_TABLE)
    assert len(table_bytes) == 25 * 8
    tabards = []
    for index in range(25):
        if not (MASK >> index) & 1:
            continue
        pointer, = struct.unpack_from("<Q", table_bytes, index * 8)
        descriptor = raw(pointer, pointer + 64)
        gate_pointer, gate_length = struct.unpack_from("<QQ", descriptor, 0x20)
        item_id, = struct.unpack_from("<I", descriptor, 0x30)
        assert item_id == 90001 + index
        gate = raw(gate_pointer, gate_pointer + gate_length).decode() if gate_pointer else None
        tabards.append(dict(id=item_id, descriptor=hex(pointer), gate=gate,
                            descriptor_sha256=hashlib.sha256(descriptor).hexdigest(),
                            purchasable=gate_pointer == 0))
    assert {row["id"] for row in tabards} == set(range(90001, 90007)) | set(range(90011, 90026))
    by_id = {row["id"]: row for row in tabards}
    assert by_id[90016]["gate"] == "feat:herod"
    assert by_id[90025]["gate"] == "coop:odds"

    # Bind the normalization helper's catalog inputs to the current native gate
    # table. This checks data composition, without executing reconstructed Rust.
    catalog = json.loads((ROOT / "crates/azeroth-survivors-re/assets/rewards-catalogs-0.112.0.json").read_text())
    additions = json.loads((ROOT / "crates/azeroth-survivors-re/assets/party-rewards-0.117.0.json").read_text())
    rows = catalog["tabards"]
    index = additions["tabard_insertion_index"]
    rows[index:index] = additions["tabards"]
    # The pointer lookup is indexed by ID; the source catalog has display order.
    assert {row["id"]: row.get("zone") for row in rows} == {
        row["id"]: row["gate"] for row in tabards
    }
    assert len(rows) == len(tabards) == 21
    assert sum(row.get("zone") is None for row in rows) == 13

    class PurchasedProbe(EquipmentProbe):
        def __init__(self):
            super().__init__(data, pe, [ROUTINE])
            self.native.hook_add(UC_HOOK_MEM_WRITE, self.check_write)

        def check_write(self, _, _kind, address, size, _value, _unused):
            assert self.STACK <= address <= address + size <= self.STACK + 0x200000, hex(address)

        def hook(self, _, pc, size, unused):
            if pc == self.stop:
                self.native.emu_stop()
                return
            assert ROUTINE[0] <= pc and pc + size <= ROUTINE[1], f"Unexpected native instruction/call {pc:#x}"

        def purchase(self, text):
            self.cursor = self.HEAP + 0x1000
            value = text.encode()
            pointer = self.alloc(len(value) + 1)
            self.native.mem_write(pointer, value)
            self.invoke(ROUTINE[0], rdx=pointer, r8=len(value))
            return bool(self.reg("RAX") & 0xFF), self.reg("RDX")

    inputs = []
    for item_id in range(89999, 90028):
        text = str(item_id)
        inputs.extend([text, "+" + text, text.zfill(6), text.zfill(8),
                       text.zfill(9), text.zfill(12), "+" + text.zfill(12)])
    inputs.extend([
        "", "+", "-", "0", "+0", "-0", "1", "12", "123", "1234", "123456",
        "1234567", "12345678", "123456789", "1000000000", "4294967294", "4294967295",
        "4294967296", "+4294967295", "+4294967296", "9999999999", "99999999999999999999",
        "-90011", " 90011", "90011 ", "\t90011", "90011\n", "\n90011", "90011\r\n",
        "90011x", "x90011", "90x11", "++90011", "+-90011", "9+0011", "90011.0",
        "0x15f9b", "９００１１", "٩٠٠١١", "90011\0", "\0" + "90011", "\u00a090011",
        "0" * 100 + "90011", "+" + "0" * 100 + "90011",
        "0" * 100 + "4294967295", "0" * 100 + "4294967296",
    ])
    # Preserve first occurrence/order, keeping fixtures deterministic and small.
    inputs = list(dict.fromkeys(inputs))
    probe = PurchasedProbe()
    cases = []
    for text in inputs:
        encoded = text.encode()
        valid_syntax = re.fullmatch(rb"\+?[0-9]+", encoded) is not None
        parsed = int(text) if valid_syntax else None
        if parsed is not None and parsed > 0xFFFFFFFF:
            parsed = None
        accepted, payload = probe.purchase(text)
        expected = parsed in by_id and by_id[parsed]["purchasable"]
        assert accepted == expected, (text, accepted, expected)
        # RDX is a meaningful parsed ID only on valid u32 input. Its contents on
        # malformed/overflow rejection are intentionally not interpreted.
        if parsed is not None:
            assert payload == parsed, (text, payload, parsed)
        cases.append(dict(input=text, parsed_u32=parsed, accepted=accepted))

    proof = dict(
        target_sha256=SHA, target_process_launched=False,
        routine=dict(start=hex(ROUTINE[0]), end_exclusive=hex(ROUTINE[1]),
                     sha256=ROUTINE_SHA, instructions=len(instructions)),
        pointer_table=dict(start=hex(POINTER_TABLE[0]), end_exclusive=hex(POINTER_TABLE[1]),
                           entry_count=25, sha256=hashlib.sha256(table_bytes).hexdigest(),
                           valid_id_mask=hex(MASK)),
        descriptors=tabards,
        native_cases=len(cases), accepted_cases=sum(row["accepted"] for row in cases),
        case_sha256=digest(cases), cases=cases,
        seams=[],
        limits=["The complete original pure leaf executes unchanged in scratch Unicorn memory with the exact current pointer table/descriptors. All external instructions/calls fail closed; there are no host-call substitutions.",
                "UTF-8 bytes and Win64 stack are supplied fixtures. Only AL acceptance and RDX for syntactically valid u32 input are interpreted; malformed/overflow payload bits have no claimed meaning.",
                "This proves only per-value purchased-tabard parsing/admission. Full Save parsing, sorting/deduplication, unlock authority, normalization, serialization and reward UI retain their owning evidence.",
                "No compilation, compiling tests, reconstructed Rust, native process, file/save/configuration operation, game/client/network/server execution, rendering or original/rebuilt parity comparison."])
    text = json.dumps(proof, indent=2, ensure_ascii=False) + "\n"
    if args.stage:
        STAGED.parent.mkdir(parents=True, exist_ok=True)
        STAGED.write_text(text)
    else:
        assert KEPT.read_text() == text, "Curated purchased-tabard cases missing/stale; inspect --stage"
    print(f"PASS: {len(cases)} original purchased-tabard cases; "
          "90016 and 90025 rejected; no host-call seam/compiler/game")


if __name__ == "__main__":
    main()
