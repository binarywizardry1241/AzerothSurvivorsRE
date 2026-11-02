#!/usr/bin/env python3
"""Check 0.117.0 co-op reward data, lookup/gates and live source consumers.

Replays bounded original lookup/getter instructions with synthetic Save memory
and an explicit byte-comparison seam. Never builds or launches the application.
"""
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293"
ASSETS = ROOT / "crates/azeroth-survivors-re/assets"
SOURCES = ROOT / "crates/azeroth-survivors-re/src"
LOOKUP = (0x145ADA7F0, 0x145ADAB5B)
GETTER = (0x145B4AF90, 0x145B4B0AD)
METADATA = (0x145AB6630, 0x145AB78F5)
QUALITY = (0x145AF9F3E, 0x145AF9F63)
TABLES = {
    "cosmetics": (64, (0x1461A95F8, 0x1472C9420, 0x1475CADC0)),
    "companions": (96, (0x1461AA1D8, 0x1472D01F8, 0x1475CA238, 0x1475D6008)),
    "tabards": (64, (0x1461ADAA0, 0x1472C8C60, 0x1475C9830)),
}


def populations():
    base = json.loads((ASSETS / "rewards-catalogs-0.112.0.json").read_text())
    extra = json.loads((ASSETS / "party-rewards-0.117.0.json").read_text())
    cosmetics = json.loads((ASSETS / "armory-cosmetics-0.112.0.json").read_text())
    assert extra["target_sha256"] == SHA
    assert [row["id"] for row in extra["cosmetics"]] == list(range(90108, 90115))
    assert [row["creature_id"] for row in extra["companions"]] == list(range(9623, 9627))
    assert [row["id"] for row in extra["tabards"]] == [90025]
    assert extra["tabard_insertion_index"] == 7
    tabards = list(base["tabards"])
    at = extra["tabard_insertion_index"]
    tabards[at:at] = extra["tabards"]
    return {
        "cosmetics": cosmetics["cosmetics"] + extra["cosmetics"],
        "companions": base["companions"] + extra["companions"],
        "tabards": tabards,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    data = target_bytes(target)
    pe = load_script("party_rewards_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        assert at is not None
        return data[at:at + count]

    def pair(address):
        pointer, count = struct.unpack("<QQ", raw(address, 16))
        if pointer == 0:
            assert count == 0
            return None
        assert 0 < count < 1000
        return raw(pointer, count).decode()

    groups = populations()
    checked = 0
    for kind, (stride, tables) in TABLES.items():
        for table in tables:
            for index, want in enumerate(groups[kind]):
                at = table + index * stride
                if kind == "companions":
                    got = dict(zip(("key", "name", "model", "icon", "achievement"),
                                   (pair(at + offset) for offset in (0, 16, 32, 48, 64))))
                    got.update(zip(("display_id", "scale", "creature_id"),
                                   struct.unpack("<IfI", raw(at + 80, 12))))
                else:
                    got = dict(zip(("name", "icon", "zone" if kind == "tabards" else "achievement"),
                                   (pair(at + offset) for offset in (0, 16, 32))))
                    got.update(zip(("id", "display_id", "cost" if kind == "tabards" else "inventory_type"),
                                   struct.unpack("<III", raw(at + 48, 12))))
                    if kind == "cosmetics":
                        got["slot"] = raw(at + 60, 1)[0]
                assert got == want, (kind, hex(table), index, got, want)
                checked += 1

    proof = json.loads((ROOT / "docs/analysis/evidence/0.117.0/party-rewards/contracts.json").read_text())
    assert proof["target_sha256"] == SHA
    for row in proof["native_spans"]:
        address, count = int(row["va"], 16), row["byte_count"]
        assert hashlib.sha256(raw(address, count)).hexdigest() == row["sha256"]
    query_checks = 0
    for row in proof["queries"]:
        plan, result = ROOT / row["plan_path"], ROOT / row["result_path"]
        if not plan.exists() or not result.exists():
            assert not args.require_retained_queries, row["procedure"]
            continue
        assert hashlib.sha256(plan.read_bytes()).hexdigest() == row["plan_sha256"]
        assert hashlib.sha256(result.read_bytes()).hexdigest() == row["result_sha256"]
        payload = json.loads(result.read_text())
        evidence = payload.get("structuredContent") or json.loads(payload["content"][0]["text"])
        assert evidence["evidence_id"] == row["evidence_id"]
        assert evidence["analysis_profile"]["digest"] == row["analysis_profile_digest"]
        assert evidence["operation"] == "procedure_pseudo_code"
        assert evidence["parameters"]["procedure"] == row["procedure"]
        assert evidence["subject"]["digest"]["sha256"] == row["raw_input_sha256"]
        assert hashlib.sha256(evidence["normalized_result"].encode()).hexdigest() == row["normalized_pseudocode_sha256"]
        assert any(span["va"] == row["procedure"] and span["sha256"] == row["raw_input_sha256"]
                   for span in proof["native_spans"])
        query_checks += 1

    from equipment_native import EquipmentProbe

    class Probe(EquipmentProbe):
        def hook(self, machine, address, count, unused):
            if any(a <= address and address + count <= b for a, b in self.ranges):
                assert bytes(machine.mem_read(address, count)) == raw(address, count)
            if address == 0x145F93CE7:
                left, right, length = (self.reg(name) for name in ("RCX", "RDX", "R8"))
                a, b = bytes(machine.mem_read(left, length)), bytes(machine.mem_read(right, length))
                self.reg("RAX", ((a > b) - (a < b)) & 0xFFFFFFFFFFFFFFFF)
                stack = self.reg("RSP")
                self.reg("RIP", self.q(stack))
                self.reg("RSP", stack + 8)
                return
            if address in (0x145F66A30, 0x145B29C00, 0x145F93CDB):
                a, b, length = (self.reg(name) for name in ("RCX", "RDX", "R8"))
                if address == 0x145F66A30:
                    # The constructed lookup key is irrelevant for a declared
                    # locale miss; exact formatting/localization is separate.
                    self.output(a, "")
                elif address == 0x145B29C00:
                    self.reg("RAX", 0)
                    self.reg("RDX", 0)
                else:
                    machine.mem_write(a, bytes(machine.mem_read(b, length)))
                    self.reg("RAX", a)
                stack = self.reg("RSP")
                self.reg("RIP", self.q(stack))
                self.reg("RSP", stack + 8)
                return
            super().hook(machine, address, count, unused)

    probe = Probe(data, pe, [LOOKUP, GETTER, METADATA, QUALITY])
    cases = []
    for row in groups["companions"]:
        key, gate = row["key"], row["achievement"]
        pointer = probe.alloc(len(key) + 1)
        probe.native.mem_write(pointer, key.encode())
        probe.invoke(LOOKUP[0], pointer, len(key))
        assert probe.reg("RAX") and probe.pair(probe.reg("RAX")) == key
        populations_earned = [[], ["unrelated"], [gate] if gate else [],
                              sorted(["a", gate, "z"]) if gate else ["a", "z"]]
        for earned in populations_earned:
            account, looks = probe.alloc(0x200), probe.alloc(24)
            probe.output(looks, key)
            probe.put(account + 0x138, 1, looks, 1)
            keys = probe.alloc(24 * len(earned))
            for index, value in enumerate(earned):
                probe.output(keys + index * 24, value)
            probe.put(account + 0xA8, len(earned), keys, len(earned))
            for slot in (0, 1, 2):
                probe.invoke(GETTER[0], account, slot)
                actual = probe.pair(probe.reg("RAX"))
                want = key if slot == 0 and (gate is None or gate in earned) else "squirrel"
                assert actual == want, (key, earned, slot, actual, want)
                cases.append((key, earned, slot, actual))
    for key in ("", "unknown", "bigglesworthx", "ancient_protecto", "ANCIENT_PROTECTOR"):
        pointer = probe.alloc(len(key) + 16)
        probe.native.mem_write(pointer, key.encode())
        probe.invoke(LOOKUP[0], pointer, len(key))
        assert probe.reg("RAX") == 0, key

    metadata = []
    new_tabard = groups["tabards"][7]
    for row in groups["cosmetics"] + [new_tabard]:
        result = probe.alloc(112)
        probe.invoke(METADATA[0], result, row["id"])
        word = lambda offset: struct.unpack("<I", probe.native.mem_read(result + offset, 4))[0]
        rarity = probe.q(result + 48)
        # Metadata +0x20 is an empty effects Vec pointer, not quality. The
        # actual ItemQuery consumer translates the rarity at +0x30 to quality.
        frame = probe.alloc(0x400)
        probe.reg("RBP", frame)
        probe.reg("R13", rarity)
        probe.stop = QUALITY[1]
        probe.native.emu_start(QUALITY[0], QUALITY[1], count=100)
        quality = struct.unpack("<I", probe.native.mem_read(frame + 0x2AC, 4))[0]
        actual = dict(id=word(80), name=probe.pair(result + 8), rarity=rarity, quality=quality,
                      display_id=word(84), inventory_type=word(96),
                      slot=probe.native.mem_read(result + 104, 1)[0])
        want = dict(id=row["id"], name=row["name"], rarity=1 if "slot" in row else 2,
                    quality=2 if "slot" in row else 3, display_id=row["display_id"],
                    inventory_type=row.get("inventory_type", 19), slot=row.get("slot", 18))
        assert actual == want
        metadata.append(actual)
    assert metadata == proof["item_metadata"]

    for source in ("armory_cosmetics.rs", "run_effects/loot_companions.rs", "progression.rs",
                   "gameplay/client/inventory.rs"):
        assert "party-rewards-0.117.0.json" in (SOURCES / source).read_text(), source
    assert "cosmetics::get(*id).is_some()" in (SOURCES / "armory.rs").read_text()
    assert "loot_companions::definitions()" in (SOURCES / "save/schema.rs").read_text()
    inventory = "".join((SOURCES / "gameplay/client/inventory.rs").read_text().split())
    assert "is_purchasable_tabard(id){2}else{3}" in inventory
    account_source = (SOURCES / "account_progression.rs").read_text()
    purchase = account_source.split("pub fn is_purchasable_tabard(", 1)[1].split("\n}\n", 1)[0]
    compact_purchase = "".join(purchase.split())
    assert "OnceLock<Vec<Tabard>>" in compact_purchase
    assert "rewards-catalogs-0.112.0.json" in purchase
    assert "party-rewards-0.117.0.json" in purchase
    assert "tabard.id==id&&tabard.zone.is_none()" in compact_purchase
    assert "Save" not in purchase and "MenuCatalog" not in purchase
    assert "pub(crate)useazeroth_survivors_re::account_progression::is_purchasable_tabard;" in "".join((SOURCES / "progression.rs").read_text().split())
    creature = json.loads((ROOT / "docs/analysis/evidence/0.117.0/party-rewards/creature-query-contract.json").read_text())
    assert creature["target"]["sha256"] == SHA
    assert [row["entry"] for row in creature["creature_templates"]] == list(range(9623, 9627))
    for row in creature["native_spans"]:
        assert hashlib.sha256(raw(int(row["va"], 16), row["byte_count"])).hexdigest() == row["sha256"]
    entry = creature["selected_dispatch_entry"]
    base = int(entry["table_base"], 16)
    assert base + struct.unpack("<i", raw(base + entry["index"] * 4, 4))[0] == int(entry["destination"], 16)
    for row in creature["data_fields"]:
        expected = bytes.fromhex(row["hex"])
        assert raw(int(row["va"], 16), len(expected)) == expected
    creature_queries = 0
    for row in creature["query_receipts"]:
        plan, result = ROOT / row["plan"], ROOT / row["result"]
        if not plan.exists() or not result.exists():
            assert not args.require_retained_queries, row["role"]
            continue
        assert hashlib.sha256(plan.read_bytes()).hexdigest() == row["plan_sha256"]
        assert hashlib.sha256(result.read_bytes()).hexdigest() == row["result_sha256"]
        response = json.loads(result.read_text())
        value = response.get("structuredContent") or json.loads(response["content"][0]["text"])
        assert value["evidence_id"] == row["evidence_id"]
        assert value["analysis_profile"]["digest"] == row["profile_sha256"]
        assert value["subject"]["digest"]["sha256"] == row["input_sha256"]
        creature_queries += 1
    queries = (SOURCES / "gameplay/client/creature_queries.rs").read_text()
    for row in groups["companions"][-4:]:
        assert re.search(r'\(\s*' + str(row["creature_id"]) +
                         r',\s*"",\s*"",\s*"",\s*8,\s*' + str(row["display_id"]) + r'\s*\)', queries)
    assert hashlib.sha256(json.dumps(cases, separators=(",", ":")).encode()).hexdigest() == proof["companion_getter_cases_sha256"]
    print(f"Passed {checked} exact descriptor records across 10 tables, 26 native key lookups, "
          f"5 rejected keys, {len(cases)} native gate/slot cases, 15 native item constructions "
          f"and live catalog/save/remote consumers; {query_checks}/3 item/getter and "
          f"{creature_queries}/4 creature query receipts checked")


if __name__ == "__main__":
    main()
