#!/usr/bin/env python3
"""Replay current ItemQuery metadata with explicit seams; no build or game.

All 66 starters, 21 tabards and 14 cosmetics execute their current constructors
and the known-definition response branch. Capture stops at serializer entry.
"""
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from equipment_native import EquipmentProbe
from script_sources import load_script

SHA = "507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293"
RANGES = [
    (0x145AF9E81, 0x145AFAA53),
    (0x145AB6630, 0x145AB78F5),
    (0x145AB5BE0, 0x145AB6144),
]
RESPONSE_FIELDS = {
    "entry": 48,
    "item_class": 52,
    "subclass": 56,
    "display_id": 60,
    "quality": 64,
    "inventory_type": 68,
}


class Probe(EquipmentProbe):
    def hook(self, machine, address, count, unused):
        if any(start <= address and address + count <= end for start, end in self.ranges):
            return
        first, second, third = (self.reg(name) for name in ("RCX", "RDX", "R8"))
        if address == 0x145F66A30:
            # Typed format seam: current literal-prefix plus u32 formatter.
            size = machine.mem_read(second, 1)[0]
            prefix = self.text(second + 1, size)
            assert prefix in ("starter.", "tabard.", "cosmetic."), prefix
            assert bytes(machine.mem_read(second + 1 + size, 2)) == b"\xc0\0"
            assert self.q(third + 8) == 0x145F784E0
            number = struct.unpack("<I", machine.mem_read(self.q(third), 4))[0]
            self.output(first, prefix + str(number))
        elif address == 0x145B29C00:
            key = self.text(first, second)
            self.keys.add(key)
            value = self.locale.get(key)
            if value is None:
                self.reg("RAX", 0)
                self.reg("RDX", 0)
            else:
                encoded = value.encode()
                at = self.alloc(len(encoded) + 1)
                machine.mem_write(at, encoded)
                self.reg("RAX", at)
                self.reg("RDX", len(encoded))
        elif address == 0x145F93CDB:
            machine.mem_write(first, bytes(machine.mem_read(second, third)))
            self.reg("RAX", first)
        elif address == 0x145C27830:
            # Admitted metadata cases carry an empty effects vector.
            assert second == third
            self.put(first, 0, 8, 0)
        elif address == 0x145B66370:
            self.captured = {"name": self.pair(second)}
            self.captured.update({
                key: struct.unpack("<I", machine.mem_read(second + offset, 4))[0]
                for key, offset in RESPONSE_FIELDS.items()
            })
            machine.emu_stop()
            return
        else:
            return super().hook(machine, address, count, unused)
        stack = self.reg("RSP")
        self.reg("RIP", self.q(stack))
        self.reg("RSP", stack + 8)


def main():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    data = target_bytes(target)
    pe = load_script("item_query_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    assets = ROOT / "crates/azeroth-survivors-re/assets"
    cosmetics = json.loads((assets / "armory-cosmetics-0.112.0.json").read_text())["cosmetics"]
    additions = json.loads((assets / "party-rewards-0.117.0.json").read_text())
    base = json.loads((assets / "rewards-catalogs-0.112.0.json").read_text())
    starters = json.loads((assets / "armory.json").read_text())["starter_items"]
    families = [
        ("starter", starters),
        ("tabard", base["tabards"] + additions["tabards"]),
        ("cosmetic", cosmetics + additions["cosmetics"]),
    ]
    probe = Probe(data, pe, RANGES)
    cases = []
    for family, rows in families:
        for row in rows:
            key = f"{family}.{row['id']}"
            for selected in (None, "Translated · żółw", "", key):
                probe.locale = {row["name"]: "literal decoy"}
                if selected is not None:
                    probe.locale[key] = selected
                stack = probe.STACK + 0x180000
                probe.native.mem_write(stack - 0x10000, bytes(0x20000))
                for register, value in {
                    "RSP": stack, "RBP": stack + 0x80, "RDI": row["id"],
                    "RSI": probe.HEAP, "RBX": 0, "R13": 0, "MXCSR": 0x1F80,
                }.items():
                    probe.reg(register, value)
                probe.captured = None
                probe.native.emu_start(0x145AF9E88, probe.DONE, count=1000000)
                actual = probe.captured
                assert actual is not None
                quality = 1 if family == "starter" else (
                    3 if family == "tabard" and row["zone"] is not None else 2
                )
                expected = {
                    "name": row["name"] if selected is None else selected,
                    "entry": row["id"],
                    "item_class": row.get("item_class", 4),
                    "subclass": row.get("item_subclass", 0),
                    "display_id": row["display_id"],
                    "quality": quality,
                    "inventory_type": row["inventory_type"] if family != "tabard" else 19,
                }
                assert actual == expected, (family, row["id"], selected, actual, expected)
                cases.append((family, row["id"], selected, actual))

    proof = json.loads((ROOT / "docs/analysis/evidence/item-query-bridge/contracts.json").read_text())
    assert proof["target_sha256"] == target["sha256"]
    for span in proof["native_spans"]:
        start, count = int(span["va"], 16), span["byte_count"]
        at = pe.rva_offset(start - pe.image_base)
        assert at is not None
        assert hashlib.sha256(data[at:at + count]).hexdigest() == span["sha256"]
    assert len(cases) == proof["cases"] == 404
    assert hashlib.sha256(json.dumps(cases, separators=(",", ":")).encode()).hexdigest() == proof["cases_sha256"]
    for receipt in proof["query_receipts"]:
        result = ROOT / receipt["result_path"]
        plan = ROOT / receipt["plan_path"]
        assert hashlib.sha256(result.read_bytes()).hexdigest() == receipt["result_sha256"]
        assert hashlib.sha256(plan.read_bytes()).hexdigest() == receipt["plan_sha256"]
        payload = json.loads(result.read_text())
        value = payload.get("structuredContent") or json.loads(payload["content"][0]["text"])
        assert value["evidence_id"] == receipt["evidence_id"]
        assert value["parameters"]["procedure"] == receipt["procedure"]
        assert value["analysis_profile"]["digest"] == receipt["analysis_profile_digest"]
        assert value["subject"]["digest"]["sha256"] == receipt["raw_input_sha256"]
        assert hashlib.sha256(value["normalized_result"].encode()).hexdigest() == receipt["normalized_pseudocode_sha256"]

    source = "".join((ROOT / "crates/azeroth-survivors-re/src/gameplay/client/inventory.rs").read_text().split())
    assert "is_purchasable_tabard(id){2}else{3}" in source
    assert "crate::armory::starter_name(labels,starter).to_owned()" in source
    helper = "".join((ROOT / "crates/azeroth-survivors-re/src/armory.rs").read_text().split())
    assert 'translated(labels,&format!("starter.{}",item.id),&item.name)' in helper
    assert "catalog.labels.get(key).map(String::as_str).unwrap_or(fallback)" in helper
    assert 'labels.labels.get(&format!("tabard.{id}"))' in source
    assert ".unwrap_or(&tabard.name)" in source
    print("Passed 404 native ItemQuery → descriptor → response cases, current opcode/name-copy commitments and source name/quality consumers")


if __name__ == "__main__":
    main()
