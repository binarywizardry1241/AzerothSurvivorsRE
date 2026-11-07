#!/usr/bin/env python3
"""Replay current tabard ID-key lookup/fallback with declared format/locale seams."""
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script
from equipment_native import EquipmentProbe

SHA = "507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293"
OWNER = (0x145AB6630, 0x145AB78F5)


def main():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    data = target_bytes(target)
    pe = load_script("tabard_locale_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    contracts = json.loads((ROOT / "docs/analysis/evidence/party-rewards/contracts.json").read_text())
    for row in contracts["native_spans"]:
        address, count = int(row["va"], 16), row["byte_count"]
        at = pe.rva_offset(address - pe.image_base)
        assert at is not None and hashlib.sha256(data[at:at + count]).hexdigest() == row["sha256"]

    class Probe(EquipmentProbe):
        def hook(self, machine, address, count, unused):
            if self.stop == address or any(a <= address and address + count <= b for a, b in self.ranges):
                return super().hook(machine, address, count, unused)
            out, second, third = (self.reg(name) for name in ("RCX", "RDX", "R8"))
            if address == 0x145F66A30:
                # Typed format seam: literal-prefix + one current u32 formatter.
                size = machine.mem_read(second, 1)[0]
                prefix = self.text(second + 1, size)
                assert prefix == "tabard."
                assert bytes(machine.mem_read(second + 1 + size, 2)) == b"\xc0\0"
                assert self.q(third + 8) == 0x145F784E0
                number = struct.unpack("<I", machine.mem_read(self.q(third), 4))[0]
                self.output(out, prefix + str(number))
            elif address == 0x145B29C00:
                key = self.text(out, second)
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
                machine.mem_write(out, bytes(machine.mem_read(second, third)))
                self.reg("RAX", out)
            else:
                return super().hook(machine, address, count, unused)
            stack = self.reg("RSP")
            self.reg("RIP", self.q(stack))
            self.reg("RSP", stack + 8)

    assets = ROOT / "crates/azeroth-survivors-re/assets"
    base = json.loads((assets / "rewards-catalogs-0.112.0.json").read_text())["tabards"]
    additions = json.loads((assets / "party-rewards-0.117.0.json").read_text())["tabards"]
    probe = Probe(data, pe, [OWNER])
    cases = []
    for row in base + additions:
        key = f"tabard.{row['id']}"
        for selected in (None, "Translated · żółw", "", key):
            probe.locale = {row["name"]: "unrelated literal-name translation"}
            if selected is not None:
                probe.locale[key] = selected
            out = probe.alloc(112)
            probe.invoke(OWNER[0], out, row["id"])
            actual = probe.pair(out + 8)
            assert actual == (row["name"] if selected is None else selected)
            cases.append((row["id"], selected, actual))
    assert probe.keys == {f"tabard.{row['id']}" for row in base + additions}
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/client/inventory.rs").read_text()
    owner = source.split("fn tabard_name(", 1)[1].split("#[cfg(test)]", 1)[0]
    assert "party-rewards-0.117.0.json" in owner
    owner = "".join(owner.split())
    assert 'labels.labels.get(&format!("tabard.{id}"))' in owner
    assert ".unwrap_or(&tabard.name)" in owner
    assert "labels.label(&tabard.name)" not in owner
    proof = json.loads((ROOT / "docs/analysis/evidence/party-rewards/tabard-localization.json").read_text())
    assert proof["target_sha256"] == SHA
    assert proof["cases"] == len(cases) == 84
    assert proof["cases_sha256"] == hashlib.sha256(json.dumps(cases, separators=(",", ":")).encode()).hexdigest()
    print("Passed 84 native tabard ID-key/Unicode/empty/fallback cases, exact format records and live tooltip source")


if __name__ == "__main__":
    main()
