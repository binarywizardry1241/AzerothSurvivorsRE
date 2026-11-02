#!/usr/bin/env python3
"""Check bounded 0.117.0 tabard admission instructions without a game/build.

The original descriptor gate and class/slot membership instructions execute in
scratch Unicorn memory. Generic item metadata decoding is deliberately not
executed: cases entering that branch are recorded as ``metadata_fallback``,
never as an inferred rejection. Only byte comparison is a host call seam.
"""

import argparse
import hashlib
import importlib.util
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes


SHA = "507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293"
GATE = (0x145B4A9F0, 0x145B4AB76)
ADMISSION = (0x145AC20B0, 0x145AC2250)
FALLBACK = 0x145AC2175
MEMCMP = 0x145F93CE7
TABLE = (0x1475C9830, 0x1475C9D70)
EXPECTED = {
    GATE: "01459186fc35b32cc809d7af103500db5b1655d9c1f4ee7c1a4897c80c0c62d1",
    ADMISSION: "ba53b73770b933718eb360c15c0d37a92f6d0ed59c6d2684087a40c857251ce4",
}
KEPT = ROOT / "docs/analysis/evidence/0.117.0/tabard-admission/cases.json"
STAGED = ROOT / "runtime/0.117.0/tabard-admission/checker-cases.json"


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def digest(value):
    return hashlib.sha256(canonical(value)).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true",
                        help="stage deterministic cases under project runtime/")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "tabard evidence belongs to a different EXE"
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location(
        "tabard_admission_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)

    def raw(start, end):
        offset = pe.rva_offset(start - pe.image_base)
        value = data[offset:offset + end - start]
        assert len(value) == end - start
        return value

    sys.path[:0] = [str(ROOT / "runtime/tests/query-python-deps"),
                    str(ROOT / "runtime/armory-recovery/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import UC_HOOK_MEM_WRITE
    from equipment_native import EquipmentProbe

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    ranges = []
    for (start, end), expected in EXPECTED.items():
        value = raw(start, end)
        assert hashlib.sha256(value).hexdigest() == expected, hex(start)
        instructions = list(decoder.disasm(value, start))
        assert sum(i.size for i in instructions) == len(value)
        ranges.append(dict(start=hex(start), end_exclusive=hex(end),
                           sha256=expected, instructions=len(instructions)))

    class TabardProbe(EquipmentProbe):
        def __init__(self):
            super().__init__(data, pe, [GATE, ADMISSION])
            self.metadata_fallback = False
            self.comparisons = 0
            self.native.hook_add(UC_HOOK_MEM_WRITE, self.check_write)

        def check_write(self, _, _kind, address, size, _value, _unused):
            assert (self.HEAP <= address <= address + size <= self.HEAP + 0x2000000
                    or self.STACK <= address <= address + size <= self.STACK + 0x200000), hex(address)

        def hook(self, _, pc, size, unused):
            if pc == self.stop:
                self.native.emu_stop()
                return
            if pc == FALLBACK:
                self.metadata_fallback = True
                self.native.emu_stop()
                return
            if any(start <= pc and pc + size <= end for start, end in self.ranges):
                return
            # Fail closed rather than inheriting unrelated formatting/allocation
            # seams from EquipmentProbe's equipment-text fixtures.
            assert pc == MEMCMP, f"Unreviewed call {pc:#x}"
            left, right, count = (self.reg(r) for r in ("RCX", "RDX", "R8"))
            assert count <= 256
            a = bytes(self.native.mem_read(left, count))
            b = bytes(self.native.mem_read(right, count))
            self.reg("RAX", ((a > b) - (a < b)) & 0xFFFFFFFF)
            self.comparisons += 1
            sp = self.reg("RSP")
            self.reg("RSP", sp + 8)
            self.reg("RIP", self.q(sp))

        def reset(self):
            self.cursor = self.HEAP + 0x1000
            self.metadata_fallback = False

        def integers(self, values):
            pointer = self.alloc(max(4 * len(values), 4))
            if values:
                self.native.mem_write(pointer, struct.pack("<" + "I" * len(values), *values))
            return pointer

        def strings(self, values):
            pointer = self.alloc(max(24 * len(values), 24))
            for index, value in enumerate(values):
                value = value.encode()
                text = self.alloc(len(value) + 1)
                self.native.mem_write(text, value)
                self.put(pointer + index * 24, len(value), text, len(value))
            return pointer

        def admitted(self, item_id, slot, authority):
            self.reset()
            state = self.alloc(24)
            class_pointer = self.alloc(1)
            self.native.mem_write(class_pointer, b"\x01")
            self.put(state, class_pointer, self.integers(authority), len(authority))
            self.stop = self.DONE
            sp = self.STACK + 0x1F0008
            self.put(sp, self.DONE)
            for name, value in [("RSP", sp), ("RCX", state), ("RDX", item_id),
                                ("R8", slot), ("MXCSR", 0x1F80)]:
                self.reg(name, value)
            self.native.emu_start(ADMISSION[0], self.DONE, count=10000)
            if self.metadata_fallback:
                assert self.reg("RIP") == FALLBACK
                return "metadata_fallback"
            assert self.reg("RIP") == self.DONE
            return "admitted" if self.reg("RAX") & 0xFF else "not_owned"

        def available(self, descriptor, earned, purchased):
            self.reset()
            save = self.alloc(0x138)
            self.put(save + 0xB0, self.strings(earned), len(earned))
            self.put(save + 0x128, self.integers(purchased), len(purchased))
            self.invoke(GATE[0], save, descriptor)
            return bool(self.reg("RAX") & 0xFF)

    probe = TabardProbe()
    descriptors = []
    for address in range(*TABLE, 64):
        row = raw(address, address + 64)
        pointer, length = struct.unpack_from("<QQ", row, 0x20)
        item_id, = struct.unpack_from("<I", row, 0x30)
        gate = raw(pointer, pointer + length).decode() if pointer else None
        assert gate is None or len(gate) == length
        descriptors.append(dict(address=hex(address), id=item_id, gate=gate))
    tabards = set(range(90001, 90007)) | set(range(90011, 90026))
    assert {row["id"] for row in descriptors} == tabards
    assert next(row for row in descriptors if row["id"] == 90025)["gate"] == "coop:odds"

    admission_cases = []

    def admission_case(item_id, slot, authority):
        outcome = probe.admitted(item_id, slot, authority)
        expected = ("metadata_fallback" if slot != 18 or item_id not in tabards
                    else "admitted" if item_id in authority else "not_owned")
        assert outcome == expected, (item_id, slot, authority, outcome, expected)
        admission_cases.append(dict(id=item_id, slot=slot, authority=authority, outcome=outcome))

    boundaries = [0, 89999, 90000, 90001, 90006, 90007, 90010,
                  90011, 90024, 90025, 90026, 90114, 100000, 0xFFFFFFFF]
    for item_id in boundaries:
        for slot in range(20):
            admission_case(item_id, slot, [])
            admission_case(item_id, slot, [item_id])
    for item_id in sorted(tabards):
        for index in [0, 15, 16]:
            authority = list(range(2000000, 2000000 + index)) + [item_id]
            admission_case(item_id, 18, authority)
        admission_case(item_id, 18, list(range(2000000, 2000017)))

    gate_cases = []

    def gate_case(row, earned, purchased, label):
        assert earned == sorted(set(earned)), "Native earned-key fixture must be sorted/unique"
        actual = probe.available(int(row["address"], 16), earned, purchased)
        expected = row["gate"] in earned if row["gate"] is not None else row["id"] in purchased
        assert actual == expected, (row, label, earned, purchased, actual, expected)
        gate_cases.append(dict(id=row["id"], case=label, earned=earned,
                               purchased=purchased, available=actual))

    for row in descriptors:
        item_id, gate = row["id"], row["gate"]
        gate_case(row, [], [], "empty")
        gate_case(row, ["wrong:key"], [item_id], "wrong_key_with_purchase")
        for count, position in [(1, 0), (16, 0), (16, 15), (17, 16), (32, 31), (33, 32)]:
            purchased = list(range(2000000, 2000000 + count))
            purchased[position] = item_id
            gate_case(row, [], purchased, f"purchase_count_{count}_match_{position}")
        gate_case(row, [], list(range(2000000, 2000033)), "purchase_33_absent")
        if gate is not None:
            gate_case(row, [gate], [], "earned_exact")
            gate_case(row, [gate[:-1]], [item_id], "earned_prefix_with_purchase")
            gate_case(row, [gate + "x"], [item_id], "earned_extension_with_purchase")
            for side, entries in [
                    ("first", [gate] + [f"zz:{i:02}" for i in range(16)]),
                    ("middle", [f"aa:{i:02}" for i in range(8)] + [gate]
                     + [f"zz:{i:02}" for i in range(8)]),
                    ("last", [f"aa:{i:02}" for i in range(16)] + [gate])]:
                gate_case(row, entries, [], f"earned_binary_search_{side}")

    proof = dict(
        target_sha256=SHA, target_process_launched=False,
        ranges=ranges,
        descriptor_table=dict(start=hex(TABLE[0]), end_exclusive=hex(TABLE[1]),
                              row_bytes=64, sha256=hashlib.sha256(raw(*TABLE)).hexdigest(),
                              rows=descriptors),
        # Rust regressions consume the completed authority decisions. The
        # metadata-boundary matrix is regenerated and digest-checked, without
        # retaining hundreds of rows that deliberately have no boolean result.
        admission_cases=[row for row in admission_cases if row["outcome"] != "metadata_fallback"],
        retained_admission_case_count=sum(row["outcome"] != "metadata_fallback" for row in admission_cases),
        admission_case_count=len(admission_cases),
        admission_case_sha256=digest(admission_cases),
        admission_outcome_counts={name: sum(row["outcome"] == name for row in admission_cases)
                                  for name in ["admitted", "not_owned", "metadata_fallback"]},
        gate_case_count=len(gate_cases), gate_case_sha256=digest(gate_cases),
        gate_memcmp_calls=probe.comparisons,
        selected_90025_gate_cases=[row for row in gate_cases if row["id"] == 90025],
        seams=["Only memcmp at 0x145f93ce7 is replaced with an exact signed byte comparison.",
               "Save/authority vectors, sorted unique earned strings, class byte and scratch Win64 stack are explicit supplied fixtures.",
               "Validator cases reaching 0x145ac2175 stop before generic item metadata decoding and report metadata_fallback; no rejection or generic item contract is inferred."],
        limits=["The two selected original functions execute unchanged only within their stated instruction/stop boundaries. SIMD/tail membership and binary string search execute; reconstructed Rust does not.",
                "The descriptor table is current EXE data. Availability and authority admission are separate fixtures; authority production/save normalization and reward UI are outside these instruction cases.",
                "No compilation, compiling tests, native process, file/save/configuration operation, game/client/network/server execution, rendering or original/rebuilt parity comparison."])
    text = json.dumps(proof, indent=2) + "\n"
    if args.stage:
        STAGED.parent.mkdir(parents=True, exist_ok=True)
        STAGED.write_text(text)
    else:
        assert KEPT.read_text() == text, "Curated tabard admission cases missing/stale; inspect --stage output"
        manifest = json.loads((KEPT.parent / "manifest.json").read_text())
        assert manifest["target"]["sha256"] == SHA
        for span in manifest["native_ranges"]:
            selected = raw(int(span["va"], 16), int(span["end_exclusive"], 16))
            assert hashlib.sha256(selected).hexdigest() == span["sha256"], span["label"]
        for artifact in manifest["curated_artifacts"]:
            path = ROOT / artifact["path"]
            assert hashlib.sha256(path.read_bytes()).hexdigest() == artifact["sha256"], path
    print(f"PASS: {len(admission_cases)} native admission/branch cases and "
          f"{len(gate_cases)} availability cases over all 21 descriptors; no compiler/game")


if __name__ == "__main__":
    main()
