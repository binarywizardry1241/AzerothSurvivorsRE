#!/usr/bin/env python3
"""Replay bounded 0.120.0 race eligibility instructions without a build or game.

The original union and account fallback execute with the installed image's class
tables. Allocation, vector growth, copy and disposal are explicit fixture seams.
The Pick check stops before sex/appearance/name/zone handling. Source assertions
are connection guards, not an execution of reconstructed Rust.
"""

from runtime_layout import retained_runtime_path
from script_sources import current_path, recorded_input_matches

import argparse
import hashlib
import json
import re
import struct
import sys
from pathlib import Path

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

sys.path[:0] = [
    str(ROOT / "runtime/tool-state/python/camera/python-libs"),
    str(ROOT / "runtime/tool-state/python/armory/python-libs"),
]
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as registers

SHA = "291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08"
CLASSES = (1, 2, 3, 4, 5, 7, 8, 9, 11)
UNION = (0x145A97AA0, 0x145A97C00)
FALLBACK = (0x145A8BF80, 0x145A8C0AE)
PICK = (0x145A98183, 0x145A981DE)
HEAP, STACK, STOP = 0x200000000, 0x300000000, 0x400000000


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path((retained_runtime_path(ROOT / row["path"], ROOT)).resolve())
    assert path.is_relative_to(ROOT), row["path"]
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def verify_manifest(path, image, pe, queries):
    manifest = json.loads(path.read_text())
    assert manifest["target"]["sha256"] == SHA
    assert manifest["target"]["size_bytes"] == len(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    count = 0
    for row in manifest["native_ranges"]:
        address = int(row["va"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        assert offset == int(row["file_offset"], 16), row["role"]
        raw = image[offset:offset + row["byte_count"]]
        assert sha(raw) == row["sha256"], row["role"]
        instructions = list(decoder.disasm(raw, address))
        assert sum(item.size for item in instructions) == len(raw), row["role"]
        assert len(instructions) == row["instruction_count"], row["role"]
        assembly = "\n".join(
            f"{item.address:016x}  {item.bytes.hex():22s} {item.mnemonic} {item.op_str}".rstrip()
            for item in instructions
        ) + "\n"
        assert receipt(row["assembly"]).read_text() == assembly, row["role"]
        count += len(instructions)
    for row in manifest.get("strings", []):
        offset = int(row["file_offset"], 16)
        raw = image[offset:offset + row["byte_count"]]
        assert sha(raw) == row["sha256"]
        assert raw == row["text"].encode("latin1")
    for row in manifest.get("source_receipts", []):
        receipt(row)
    for query in manifest.get("queries", []):
        if "pseudocode" in query:
            receipt(query["pseudocode"])
        if not queries:
            continue
        plan = json.loads(receipt(query["plan"]).read_text())
        journal = json.loads(receipt(query["journal"]).read_text())
        result_path = receipt(query["result"])
        evidence = json.loads(result_path.read_text())["structuredContent"]
        assert journal["status"] == "completed"
        assert any(
            row.get("status") == "completed"
            and row.get("result") == query["result"]
            for row in journal["operations"].values()
        ), query["label"]
        assert any(
            row["arguments"].get("procedure") == query["procedure"]
            for row in plan["operations"]
        ), query["label"]
        assert evidence["provider"]["id"] == "ghidra"
        assert evidence["evidence_id"] == query["evidence_id"]
        assert evidence["parameters"]["procedure"] == query["procedure"]
        assert evidence["subject"]["digest"]["sha256"] == query["subject_sha256"]
        assert evidence["analysis_profile"]["digest"] == query["analysis_profile_digest"]
        assert sha(evidence["normalized_result"].encode()) == query["normalized_result_sha256"]
        if query["scope"] == "full-PE":
            assert query["subject_sha256"] == SHA
        else:
            assert any(
                row["query_label"] == query["label"]
                and row["sha256"] == query["subject_sha256"]
                for row in manifest["native_ranges"]
            ), query["label"]
    return len(manifest["native_ranges"]), count, len(manifest.get("queries", [])) if queries else 0


class Native:
    def __init__(self, image, pe):
        self.u = Uc(UC_ARCH_X86, UC_MODE_64)
        extent = max(row["rva"] + max(row["virtual_size"], row["raw_size"]) for row in pe.sections)
        self.u.mem_map(pe.image_base, (extent + 4095) & ~4095)
        for row in pe.sections:
            self.u.mem_write(pe.image_base + row["rva"], image[row["raw_offset"]:row["raw_offset"] + row["raw_size"]])
        self.u.mem_map(HEAP, 0x100000)
        self.u.mem_map(STACK, 0x10000)
        self.u.mem_map(STOP, 4096)
        self.u.hook_add(UC_HOOK_CODE, self.hook)
        self.cursor = HEAP + 0x10000
        self.allowed = (UNION, FALLBACK)
        self.stop = STOP

    def reg(self, name, value=None):
        register = getattr(registers, "UC_X86_REG_" + name)
        if value is None:
            return self.u.reg_read(register)
        self.u.reg_write(register, value)

    def put(self, address, *values):
        self.u.mem_write(address, struct.pack("<" + "Q" * len(values), *values))

    def q(self, address):
        return struct.unpack("<Q", self.u.mem_read(address, 8))[0]

    def alloc(self, length):
        address = self.cursor
        self.cursor += (max(1, length) + 15) & ~15
        assert self.cursor < HEAP + 0x100000
        return address

    def reset(self, purchased):
        self.cursor = HEAP + 0x10000
        self.u.mem_write(HEAP, bytes(0x1000))
        self.u.mem_write(HEAP + 0x2000, bytes(purchased) or b"\0")
        self.put(HEAP + 0x138, len(purchased), HEAP + 0x2000, len(purchased))
        self.allowed = (UNION, FALLBACK)
        self.stop = STOP
        self.reg("RSP", STACK + 0x8008)
        self.put(STACK + 0x8008, STOP)

    def finish_call(self):
        stack = self.reg("RSP")
        self.reg("RIP", self.q(stack))
        self.reg("RSP", stack + 8)

    def hook(self, _cpu, address, _size, _data):
        if address == self.stop:
            self.u.emu_stop()
            return
        if any(start <= address < end for start, end in self.allowed):
            return
        if address == 0x140002200:  # allocator metadata setup
            pass
        elif address == 0x1400021C0:  # allocate the requested byte vector
            self.reg("RAX", self.alloc(self.reg("RCX")))
        elif address == 0x145FA3AAB:  # copy precisely the requested bytes
            destination, source, length = self.reg("RCX"), self.reg("RDX"), self.reg("R8")
            self.u.mem_write(destination, bytes(self.u.mem_read(source, length)))
            self.reg("RAX", destination)
        elif address == 0x14614AC60:  # grow a Vec<u8>; preserve its length/content
            vector = self.reg("RCX")
            capacity, source, length = self.q(vector), self.q(vector + 8), self.q(vector + 16)
            capacity = max(8, capacity * 2, length + 1)
            destination = self.alloc(capacity)
            if length:
                self.u.mem_write(destination, bytes(self.u.mem_read(source, length)))
            self.put(vector, capacity, destination, length)
        elif address == 0x1400021D0:  # disposal, after all observable byte reads
            pass
        else:
            raise AssertionError(f"Unexpected instruction/helper {address:#x}")
        self.finish_call()

    def run(self, entry):
        try:
            self.u.emu_start(entry, self.stop, count=10000)
        except Exception as error:
            raise AssertionError(f"Native fixture failed at {self.reg('RIP'):#x}") from error
        assert self.reg("RIP") == self.stop, hex(self.reg("RIP"))

    def union(self, class_id, purchased):
        self.reset(purchased)
        output = HEAP + 0x500
        self.reg("RCX", output)
        self.reg("RDX", HEAP)
        self.reg("R8", class_id)
        self.run(UNION[0])
        assert self.reg("RAX") == output
        return list(self.u.mem_read(self.q(output + 8), self.q(output + 16)))

    def fallback(self, class_id, race, purchased):
        self.reset(purchased)
        self.reg("RCX", HEAP)
        self.reg("RDX", class_id)
        self.reg("R8", race)
        self.run(FALLBACK[0])
        return self.reg("RAX") & 0xFF

    def pick_race(self, class_id, race):
        self.reset([])
        self.allowed = (PICK,)
        self.stop = PICK[1]
        pick = HEAP + 0x500
        self.u.mem_write(pick + 0x38, bytes((class_id, race)))
        self.reg("RBX", pick)
        self.reg("RDX", pick)
        self.run(PICK[0])
        return tuple(self.u.mem_read(pick + 0x38, 2))


def source_guards(native_base):
    source = (ROOT / "crates/azeroth-survivors-re/src/save.rs").read_text()
    table = source.split("pub fn allowed_races(class: u8)", 1)[1].split("\n}", 1)[0]
    parsed = {int(key): [int(value) for value in values.split(",") if value.strip()]
              for key, values in re.findall(r"(\d+)\s*=>\s*&\[([^]]*)\]", table)}
    assert parsed == native_base, "Source base eligibility differs from native metadata"
    union = source.split("fn expanded_races(", 1)[1].split("\n}", 1)[0]
    for text in ("allowed_races(class).to_vec()", "for race in purchased", "!races.contains(race)", "races.push(*race)"):
        assert text in union, text
    assert "expanded_races(class, &self.purchased_races())" in source
    fallback = source.split("fn class_race(", 1)[1].split("\n    }", 1)[0]
    for text in ("self.allowed_races(class)", "allowed.contains(&current)", "0x9a_u8 >> race",
                 "alliance(*race) == alliance(current)", ".unwrap_or(first)"):
        assert text in fallback, text
    clamp = source.split("pub fn clamp_hero(", 1)[1].split("\n    }", 1)[0]
    for text in ("self.class_race(hero.class, hero.race)", "if race != hero.race",
                 "appearance::normalize_features(race, hero.sex, hero.features)"):
        assert text in clamp, text
    assert "return Some(self.clamp_hero(hero))" in source
    pick = source.split("pub fn normalized(mut self)", 1)[1].split("\n    }", 1)[0]
    assert "if !(1..=8).contains(&self.hero.race)" in pick
    assert "self.hero.race = allowed_races(self.hero.class)[0]" in pick
    schema = (ROOT / "crates/azeroth-survivors-re/src/save/schema.rs").read_text()
    races = schema.split("fn purchased_races(", 1)[1].split("\n}", 1)[0]
    for text in ('csv(lines, "races|")', 'token.parse::<u8>()', '(1..=8).contains(race)', 'BTreeSet'):
        assert text in races, text
    return 6


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, help="Project-local curated race-account manifest")
    parser.add_argument("--queries", action="store_true", help="Also verify retained local Ghidra journals/results")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "This checker requires the exact 0.120.0 target"
    image = target_bytes(target)
    pe = load_script("race_eligibility_pe", "scripts/inventory-executable.py").PE(image)
    promoted = ROOT / "docs/analysis/evidence/race-account/manifest.json"
    path = args.manifest or (promoted if promoted.exists() else ROOT / "runtime/analysis/history/findings/gap187/7b90808b1bfc/loader/curated/manifest.json")
    path = path.resolve()
    assert path.is_relative_to(ROOT), "Manifest must be inside the project"
    new_proof = verify_manifest(path, image, pe, args.queries)
    # Reuse the canonical union; do not duplicate that older current-target extract.
    old_manifest = ROOT / "docs/analysis/evidence/race-unlocks/manifest.json"
    old = json.loads(old_manifest.read_text())
    union = next(row for row in old["native_ranges"] if row["role"] == "allowed-races-union")
    offset = pe.rva_offset(UNION[0] - pe.image_base)
    assert old["target"]["sha256"] == SHA
    assert sha(image[offset:offset + UNION[1] - UNION[0]]) == union["sha256"]
    receipt(union["assembly"])

    cpu = Native(image, pe)
    native_base = {}
    # The actual current table supplies both lengths and ordered byte slices.
    for class_id in CLASSES:
        count = cpu.q(0x146F86400 + (class_id - 1) * 8)
        address = cpu.q(0x146F864A8 + (class_id - 1) * 8)
        native_base[class_id] = list(cpu.u.mem_read(address, count))
    assert all(native_base.values())
    subsets = [[race for race in range(1, 9) if mask & (1 << (race - 1))] for mask in range(256)]
    ownerships = subsets + [[8, 2, 8, 1], [6, 6, 1, 5, 1], list(range(8, 0, -1))]
    union_cases = fallback_cases = pick_cases = 0
    alliance = lambda race: race < 8 and bool(0x9A & (1 << race))
    for class_id in CLASSES:
        for purchased in ownerships:
            expected = list(dict.fromkeys(native_base[class_id] + purchased))
            assert cpu.union(class_id, purchased) == expected, (class_id, purchased)
            union_cases += 1
            for race in range(1, 9):
                wanted = race if race in expected else next(
                    (value for value in expected if alliance(value) == alliance(race)), expected[0])
                assert cpu.fallback(class_id, race, purchased) == wanted, (class_id, race, purchased)
                fallback_cases += 1
        for race in range(256):
            wanted = race if 1 <= race <= 8 else native_base[class_id][0]
            assert cpu.pick_race(class_id, race) == (class_id, wanted), (class_id, race)
            pick_cases += 1
    connections = source_guards(native_base)
    print(json.dumps({
        "target": "0.120.0", "native_ranges_verified": new_proof[0],
        "original_instructions_verified": new_proof[1], "durable_queries_verified": new_proof[2],
        "ordered_union_cases": union_cases, "account_fallback_cases": fallback_cases,
        "pick_race_domain_cases": pick_cases, "source_connection_guards": connections,
        "limits": [
            "Union/fallback execute original instructions and original class metadata; allocation, copy, vector growth and disposal are explicit seams.",
            "Ownership inputs cover all 256 ordinary-race subsets plus three unordered/duplicate vectors per class; they are explicit inputs, not save-parser execution.",
            "Pick executes only its class/race decision slice for nine valid classes and all 256 race-byte values; sex, appearance, name, zone, save IO and UI are excluded.",
            "Source guards inspect connections and native base data; reconstructed Rust is not executed.",
        ],
        "compilation": False, "game_executed": False, "parity_verified": False,
    }, indent=2))


if __name__ == "__main__":
    main()
