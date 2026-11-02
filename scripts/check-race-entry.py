#!/usr/bin/env python3
"""Check current race-entry contracts without compiling or launching a process."""
from portable_paths import portable_json
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path[:0] = [str(ROOT / "scripts"), str(ROOT / "runtime/armory-recovery/python-libs"),
                  str(ROOT / "runtime/camera-recovery-0.105.0/python-libs")]
from coverage_common import latest_target, target_bytes
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *

TARGET = "291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08"
selected = latest_target(verify=True)
assert selected["sha256"] == TARGET
image = target_bytes(selected)
spec = importlib.util.spec_from_file_location("roster_replay_pe", ROOT / "scripts/inventory-executable.py")
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
pe = module.PE(image)


def raw(address, size):
    offset = pe.rva_offset(address - pe.image_base)
    return image[offset:offset + size]


def derive():
    results = []
    for class_id in [1, 2, 3, 4, 5, 7, 8, 9, 11]:
        for race in range(1, 9):
            cpu = Uc(UC_ARCH_X86, UC_MODE_64)
            cpu.mem_map(0x145B13000, 0x3000)
            cpu.mem_write(0x145B13000, raw(0x145B13000, 0x3000))
            cpu.mem_map(0x140002000, 0x1000)
            cpu.mem_map(0x200000000, 0x10000)
            cpu.mem_map(0x300000000, 0x10000)
            bp = 0x200000000
            server, rows, connections = bp + 0x4000, bp + 0x7000, bp + 0x8000

            def qword(address, value):
                cpu.mem_write(address, struct.pack("<Q", value))

            qword(bp + 0x2DC8, 1)
            qword(bp + 0x2DB8, 0)
            qword(bp + 0x2D88, 0)
            qword(server + 0x1018, 1)
            qword(server + 0x1010, connections)
            qword(rows + 0x18, 1)
            hero = bytes([race, class_id, 1, 2, 3, 4, 5, 6])
            cpu.mem_write(rows + 0x30, hero)
            for register, value in [(UC_X86_REG_RBP, bp), (UC_X86_REG_RSI, server),
                                    (UC_X86_REG_RDI, rows), (UC_X86_REG_R14, 1),
                                    (UC_X86_REG_RAX, 1), (UC_X86_REG_RSP, 0x300008000)]:
                cpu.reg_write(register, value)

            def hook(_, address, size, unused):
                if address == 0x145B141A0:
                    cpu.emu_stop()
                    return
                if address == 0x1400021D0:
                    sp = cpu.reg_read(UC_X86_REG_RSP)
                    destination = struct.unpack("<Q", cpu.mem_read(sp, 8))[0]
                    cpu.reg_write(UC_X86_REG_RIP, destination)
                    cpu.reg_write(UC_X86_REG_RSP, sp + 8)
                    return
                if not (0x145B13F97 <= address < 0x145B14035
                        or 0x145B1409B <= address < 0x145B141A0):
                    raise RuntimeError(f"Unreviewed original instruction {address:#x}")

            cpu.hook_add(UC_HOOK_CODE, hook)
            cpu.emu_start(0x145B13F97, 0, count=10000)
            actual = bytes(cpu.mem_read(bp + 0x2C70, 8))
            guid = struct.unpack("<Q", cpu.mem_read(server + 0x17C8, 8))[0]
            assert actual == hero and guid == 1
            results.append(dict(class_id=class_id, race=race, accepted=True,
                                hero=list(actual), selected_guid=guid))
    return dict(target_sha256=TARGET,
                native_ranges=[["0x145b13f97", "0x145b14035"],
                               ["0x145b1409b", "0x145b141a0"]],
                cases=results,
                seams=["Roster factory result supplies one explicit typed56-byte row with selected GUID1. GUID parser is bypassed with decoded register/token parts.",
                       "Allocator deallocation is a no-op; connection list has one synthetic entry.",
                       "Stops immediately after copied identity and selected GUID are committed, before zone/run construction."],
                compilation=False, process_executed=False, parity_verified=False)



EVIDENCE = ROOT / "docs/analysis/evidence/0.120.0/race-entry"


def digest(value):
    return hashlib.sha256(value).hexdigest()


def verify_native(queries):
    proof = json.loads((EVIDENCE / "manifest.json").read_text())
    assert all(selected[key] == value for key, value in proof["target"].items())
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    instructions = 0
    for row in proof["native_ranges"]:
        start = int(row["start"], 16)
        length = int(row["end_exclusive"], 16) - start
        assert pe.rva_offset(start - pe.image_base) == int(row["file_offset"], 16)
        original = raw(start, length)
        assert digest(original) == row["sha256"], row["role"]
        decoded = list(decoder.disasm(original, start))
        assert sum(item.size for item in decoded) == length
        assert len(decoded) == row["instruction_count"]
        assembly = "\n".join(
            f"{item.address:016x}  {item.bytes.hex():22s} {item.mnemonic} {item.op_str}".rstrip()
            for item in decoded) + "\n"
        path = EVIDENCE / row["assembly"]
        assert digest(path.read_bytes()) == row["assembly_sha256"]
        assert path.read_text() == assembly
        instructions += len(decoded)
    for row in proof["native_data"]:
        start = int(row["address"], 16)
        assert pe.rva_offset(start - pe.image_base) == int(row["file_offset"], 16)
        original = raw(start, row["byte_count"])
        assert digest(original) == row["sha256"]
        assert int(row["table_base"], 16) + row["index"] * 4 == start
        target = int(row["table_base"], 16) + struct.unpack("<i", original)[0]
        assert target == int(row["relative_target"], 16)
    if queries:
        for row in proof["queries"]:
            for key in ["plan", "journal", "result"]:
                path = ROOT / row[key]["path"]
                assert digest(path.read_bytes()) == row[key]["sha256"]
            journal = json.loads((ROOT / row["journal"]["path"]).read_text())
            assert journal["status"] == "completed"
            result = json.loads((ROOT / row["result"]["path"]).read_text())["structuredContent"]
            assert result["evidence_id"] == row["evidence_id"]
            assert result["provider"]["id"] == "ghidra"
            assert result["parameters"]["procedure"] == row["procedure"]
            assert result["analysis_profile"]["digest"] == row["analysis_profile_digest"]
            assert digest(result["normalized_result"].encode()) == row["normalized_result_sha256"]
            native = row["native_input"]
            start, end = int(native["start"], 16), int(native["end_exclusive"], 16)
            assert digest(raw(start, end - start)) == native["sha256"]
            assert result["subject"]["digest"]["sha256"] == native["sha256"]
    return len(proof["native_ranges"]), instructions, len(proof["native_data"]), len(proof["queries"]) if queries else 0


def verify_source():
    paths = ["crates/azeroth-survivors-re/src/menu_state.rs",
             "crates/azeroth-survivors-re/src/menu_state/backend.rs",
             "crates/azeroth-survivors-re/src/save.rs"]
    menu, backend, save = [(ROOT / path).read_text() for path in paths]
    restore = menu.split("fn restore_pick(", 1)[1].split("pub fn class_id(", 1)[0]
    assert restore.index("self.save.pick()") < restore.index("self.save.clamp_hero(pick.hero)")
    assert restore.index("self.save.clamp_hero(pick.hero)") < restore.index("self.race = pick.hero.race")
    command = backend.split("Command::Pick(pick) =>", 1)[1].split("Command::Gear(row)", 1)[0]
    expected = ["pick.normalized()", "self.backend_save.clamp_hero(pick.hero)",
                "self.backend_pick = pick.clone()", "self.backend_save.set_hero(&pick.hero)",
                "self.backend_save.set_pick(&pick)"]
    positions = [command.index(text) for text in expected]
    assert positions == sorted(positions)
    roster = menu.split("pub fn select_roster_character(", 1)[1].split("pub fn selected_roster_guid(", 1)[0]
    for text in ["CLASS_IDS.iter().position", "(1..=8).contains(&character.race)",
                 "self.selected_character_guid = Some(guid)", "self.race = character.race",
                 "self.features = character.features"]:
        assert text in roster, text
    assert "allowed_races" not in roster and "clamp_hero" not in roster
    normalized = save.split("pub fn normalized(mut self) -> Self", 1)[1].split("/// Current 0.109.0", 1)[0]
    assert "(1..=8).contains(&self.hero.race)" in normalized
    assert "self.hero.race = allowed_races(self.hero.class)[0]" in normalized
    return [dict(path=path, sha256=digest((ROOT / path).read_bytes())) for path in paths]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--queries", action="store_true", help="Also verify retained durable query receipts")
    parser.add_argument("--write", action="store_true", help="Save compact current proof results")
    args = parser.parse_args()
    ranges, instructions, slots, queries = verify_native(args.queries)
    source = verify_source()
    roster = derive()
    result = dict(target_sha256=TARGET, native_ranges=ranges, original_instructions=instructions,
                  dispatch_slots=slots, completed_queries_verified=queries,
                  roster_identity_cases=len(roster["cases"]), source_receipts=source,
                  roster_replay_seams=roster["seams"], compilation=False,
                  application_process_executed=False, parity_verified=False)
    if args.write:
        output = ROOT / "runtime/gap187/entry-check.json"
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(portable_json(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
