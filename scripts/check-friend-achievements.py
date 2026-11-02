#!/usr/bin/env python3
"""Check selected friend-achievement native/data/source contracts, without a build.

--replay-instructions additionally replays the original composition helper with
typed memory and an explicit ability-lookup seam. This is an isolated instruction
fixture, not game, network, server, Save I/O or original/rebuilt parity validation.
"""
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

EVIDENCE = ROOT / "docs/analysis/evidence/0.119.0/friend-achievements"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def source(path):
    text = (ROOT / path).read_text()
    return re.sub(r"\s+", "", re.sub(r"//[^\n]*", "", text))


def replay_composition(data, pe):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    image_size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    machine.mem_map(pe.image_base, (image_size + 4095) & ~4095)
    for section in pe.sections:
        start = section["raw_offset"]
        machine.mem_write(pe.image_base + section["rva"], data[start:start + section["raw_size"]])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    for start in (heap, stack, stop):
        machine.mem_map(start, 0x10000)
    condition, members, key_at, ability = heap, heap + 0x100, heap + 0x200, heap + 0x300
    visited = set()

    def hook(_, address, size, unused):
        if address == stop:
            machine.emu_stop()
            return
        if 0x145b33760 <= address < 0x145b33a72:
            offset = pe.rva_offset(address - pe.image_base)
            assert bytes(machine.mem_read(address, size)) == data[offset:offset + size]
            visited.add(address)
            return
        # The existing engine interface maps the selected string to its spell
        # descriptor. Only this interface is substituted; comparisons/counts,
        # talent flags and class gates execute the original helper instructions.
        assert address == 0x145a7b310, hex(address)
        count = machine.reg_read(reg.UC_X86_REG_RDX)
        pointer = machine.reg_read(reg.UC_X86_REG_RCX)
        key = bytes(machine.mem_read(pointer, count)).decode()
        spell = {"consecration": 26573, "magma_totem": 8190}[key]
        machine.mem_write(ability + 0x40, struct.pack("<I", spell))
        machine.reg_write(reg.UC_X86_REG_RAX, ability)
        sp = machine.reg_read(reg.UC_X86_REG_RSP)
        ret = struct.unpack("<Q", machine.mem_read(sp, 8))[0]
        machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)
        machine.reg_write(reg.UC_X86_REG_RIP, ret)

    machine.hook_add(UC_HOOK_CODE, hook)

    def invoke(kind, values, cls=1, key=""):
        encoded = key.encode()
        machine.mem_write(key_at, encoded or b"\0")
        machine.mem_write(condition, struct.pack("<QQQB7x", kind, key_at, len(encoded), cls))
        machine.mem_write(members, bytes(8 * 8))
        for index, (word, value, flags) in enumerate(values):
            machine.mem_write(members + index * 8, struct.pack("<IBB2x", word, value, flags))
        sp = stack + 0xf008
        machine.mem_write(sp, struct.pack("<Q", stop))
        for register, value in ((reg.UC_X86_REG_RSP, sp), (reg.UC_X86_REG_RCX, condition),
                                (reg.UC_X86_REG_RDX, members), (reg.UC_X86_REG_R8, len(values))):
            machine.reg_write(register, value)
        machine.emu_start(0x145b33760, 0, count=100000)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
        return bool(machine.reg_read(reg.UC_X86_REG_RAX) & 1)

    cases = 0
    for kind in range(6):
        cls = 11 if kind == 1 else 2
        key = "tranquility" if kind == 1 else "consecration" if kind == 2 else ""
        for count in range(8):
            values = [(26573, index + 1 if kind == 4 else cls, 1) for index in range(count)]
            assert invoke(kind, values, cls, key) == (count >= 2 if kind == 3 else count == 5)
            cases += 1
        if kind == 3:
            continue
        values = [(26573, index + 1 if kind == 4 else cls, 1) for index in range(5)]
        for index in range(5):
            changed = list(values)
            word, value, flags = changed[index]
            changed[index] = (0 if kind == 2 else word,
                              values[(index + 1) % 5][1] if kind == 4 else 255,
                              0 if kind == 1 else flags)
            assert not invoke(kind, changed, cls, key)
            cases += 1
    print(f"Passed {cases} original composition instruction fixtures ({len(visited)} instruction sites).")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    parser.add_argument("--replay-instructions", action="store_true")
    args = parser.parse_args()
    manifest = json.loads((EVIDENCE / "manifest.json").read_text())
    target = latest_target(verify=True)
    assert all(target[key] == manifest["target"][key] for key in ("version", "sha256", "size_bytes"))
    data = target_bytes(target)
    pe = load_script("friend_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    owners = {(pe.image_base + start, pe.image_base + end) for start, end, _ in pe.functions()}

    def original(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    for row in manifest["native_owners"]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        assert (start, end) in owners
        assert digest(original(start, end - start)) == row["sha256"]
    assembly = (ROOT / manifest["assembly"]["path"]).read_bytes()
    assert digest(assembly) == manifest["assembly"]["sha256"]
    for line in assembly.decode().splitlines():
        if line and not line.startswith(";"):
            address, raw, _ = line.split(" ", 2)
            assert original(int(address, 16), len(raw) // 2).hex() == raw
    for row in manifest["native_spans"]:
        assert digest(original(int(row["start"], 16), row["byte_count"])) == row["sha256"]
    table = manifest["composition_switch"]
    assert original(int(table["start"], 16), 16).hex() == table["bytes_hex"]
    assert table["relative_targets"][0] == "0x145b3378f"
    assert original(0x145b3378f, 7).hex() == "4983f8020f93c0"
    assert original(0x145b15833, 14).hex() == "4883bd88010000020f829c000000"

    descriptors = json.loads((ROOT / manifest["source_descriptions"]).read_text())
    assert descriptors["target_sha256"] == target["sha256"]
    assert digest((ROOT / manifest["source_descriptions"]).read_bytes()) == manifest["source_description_sha256"]
    assert len(descriptors["descriptions"]) == 7
    for row in manifest["descriptions"]:
        text = descriptors["descriptions"][row["achievement_key"]].encode()
        assert original(int(row["start"], 16), len(text)) == text
        assert digest(text) == row["sha256"]
        # Exact RIP-relative LEA connects this English key to the constructor.
        address = int(row["constructor_reference"], 16)
        instruction = original(address, 7)
        assert instruction[0] in (0x48, 0x4c) and instruction[1] == 0x8d
        assert instruction[2] & 0xc7 == 5
        assert address + 7 + struct.unpack_from("<i", instruction, 3)[0] == int(row["start"], 16)

    checked = 0
    for receipt in [manifest["query_plan"], manifest["query_journal"]]:
        path = ROOT / receipt["path"]
        if path.is_file():
            assert digest(path.read_bytes()) == receipt["sha256"]
        else:
            assert not args.require_retained_queries, path
    for row in manifest["queries"] + manifest["auxiliary_queries"]:
        path = ROOT / row["result"]
        if not path.is_file():
            assert not args.require_retained_queries, path
            continue
        assert digest(path.read_bytes()) == row["result_sha256"]
        result = json.loads(path.read_text())["structuredContent"]
        assert result["subject"]["digest"]["sha256"] == row.get("input_sha256", target["sha256"])
        assert result["evidence_id"] == row["evidence_id"]
        assert result["analysis_profile"]["digest"] == row["profile_digest"]
        assert digest(result["normalized_result"].encode()) == row["normalized_sha256"]
        for field in ("input", "plan", "journal"):
            if field in row:
                auxiliary = ROOT / row[field]
                if auxiliary.is_file():
                    assert digest(auxiliary.read_bytes()) == row[field + "_sha256"]
                else:
                    assert not args.require_retained_queries, auxiliary
        checked += 1

    account = source("crates/azeroth-survivors-re/src/account_progression.rs")
    ui = source("crates/azeroth-survivors-re/src/progression.rs")
    live = source("crates/azeroth-survivors-re/src/gameplay/mod.rs")
    coop = source("crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs")
    assert "ifmatches!(self,Self::Any){returnmembers.len()>=2;}" in account
    assert "party.matches(&context.members)" in account and "party.matches(&event.members)" in account
    assert "members:self.boss_state.party_feats.members.clone()" in coop
    assert "self.coop.replica_feats.clone()" in coop
    assert "lethistory_changed=snapshot.won&&context.members.len()>=2&&" in live
    assert "singleton_victory_keeps_old_progress_and_a_prior_shared_boss_event" in live
    assert "coop-achievement-descriptions-0.119.0.json" in ui
    assert "for(key,description)indescriptions.descriptions" in ui
    assert "cooperative_beaten:save.cooperative_beaten_zones()" in ui
    # Persistence remains additive; tighter admission does not clear old history
    # or revoke an already earned key/date.
    history = source("crates/azeroth-survivors-re/src/save/coop_history.rs")
    grants = source("crates/azeroth-survivors-re/src/save/achievements.rs")
    assert "letmutbeaten=self.cooperative_beaten_zones();" in history
    assert "if!beaten.insert(index){returnfalse;}" in history
    assert "!earned.insert(key.clone())" in grants
    assert "dates.entry(key.clone()).or_insert(seconds)" in grants
    print(f"Passed {len(manifest['native_spans'])} native spans, seven description keys and live source tracing; {checked} retained Ghidra queries.")
    if args.replay_instructions:
        replay_composition(data, pe)
    print("Compilation, Rust regressions, real Save/network delivery, UI and original/rebuilt parity remain unrun.")


if __name__ == "__main__":
    main()
