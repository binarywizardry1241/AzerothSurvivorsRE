#!/usr/bin/env python3
"""Check permanent race ownership through the save/reset source connections.

Replays only the hash-bound original reset instructions in synthetic memory.
String deallocation is an observed seam. Rust is inspected, never compiled or
executed; this does not test real file I/O, a running game, or native parity.
"""
import hashlib
import itertools
import json
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

# Reuse the existing project-local analysis dependencies without installation.
sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"),
                str(ROOT / "runtime/tool-state/python/armory/python-libs")]
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as reg

SHA = "291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08"
PROOF = ROOT / "docs/analysis/evidence/0.120.0/race-unlocks/manifest.json"
SOURCE = ROOT / "crates/azeroth-survivors-re/src"
LOADER_PROOF = ROOT / "docs/analysis/evidence/0.120.0/race-account/manifest.json"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def compact(text):
    return re.sub(r"\s+", "", re.sub(r"//[^\n]*", "", text))


def block(text, marker):
    start = text.index("{", text.index(marker))
    depth = 1
    for end in range(start + 1, len(text)):
        depth += (text[end] == "{") - (text[end] == "}")
        if not depth:
            return compact(text[start + 1:end])
    raise AssertionError(marker)


def parser_evidence(target, image, pe, prior):
    proof = json.loads(LOADER_PROOF.read_text())
    assert all(target[key] == proof["target"][key] for key in ("version", "sha256", "size_bytes"))
    roles = {"race-collector", "race-next", "race-line-next", "race-id-valid",
             "loader-race-collection", "loader-race-sorting-entry",
             "loader-race-sort-dedup", "loader-race-sort-large", "loader-race-assignment"}
    rows = [row for row in proof["native_ranges"] if row["role"] in roles]
    assert {row["role"] for row in rows} == roles
    rows += [row for row in prior["native_ranges"] if row["role"] in {"race-save-output", "perk-reset"}]
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in rows:
        start, end = int(row["va"], 16), int(row["end_va"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16)
        raw = image[offset:offset + end - start]
        assert len(raw) == row["byte_count"] and digest(raw) == row["sha256"]
        instructions = list(decoder.disasm(raw, start))
        assert len(instructions) == row["instruction_count"]
        assert sum(item.size for item in instructions) == len(raw)
        assembly = "\n".join(
            f"{item.address:016x}  {item.bytes.hex():22s} {item.mnemonic} {item.op_str}".rstrip()
            for item in instructions
        ) + "\n"
        assert digest((ROOT / row["assembly"]["path"]).read_bytes()) == row["assembly"]["sha256"]
        assert (ROOT / row["assembly"]["path"]).read_text() == assembly
    labels = {"collector", "race-next", "race-line-next", "save-loader"}
    queries = [query for query in proof["queries"] if query["label"] in labels]
    assert {query["label"] for query in queries} == labels
    for query in queries:
        for kind in ("plan", "journal", "result"):
            assert digest((ROOT / query[kind]["path"]).read_bytes()) == query[kind]["sha256"]
        assert json.loads((ROOT / query["journal"]["path"]).read_text())["status"] == "completed"
        evidence = json.loads((ROOT / query["result"]["path"]).read_text())["structuredContent"]
        assert evidence["provider"]["id"] == "ghidra"
        assert evidence["evidence_id"] == query["evidence_id"]
        assert evidence["parameters"]["procedure"] == query["procedure"]
        assert evidence["subject"]["digest"]["sha256"] == query["subject_sha256"]
        assert evidence["analysis_profile"]["digest"] == query["analysis_profile_digest"]
        assert digest(evidence["normalized_result"].encode()) == query["normalized_result_sha256"]
        assert query["subject_sha256"] in {SHA, *(row["sha256"] for row in rows)}
    return {"canonical_native_ranges": len(rows),
            "independently_decoded_instructions": sum(row["instruction_count"] for row in rows),
            "completed_durable_queries_verified": len(queries)}


def original_reset(image, pe, proof):
    row = next(row for row in proof["native_ranges"] if row["role"] == "perk-reset")
    start, end = int(row["va"], 16), int(row["end_va"], 16)
    offset = pe.rva_offset(start - pe.image_base)
    assert offset == int(row["file_offset"], 16)
    raw = image[offset:offset + end - start]
    assert len(raw) == row["byte_count"] and digest(raw) == row["sha256"]
    assert digest((ROOT / row["assembly"]["path"]).read_bytes()) == row["assembly"]["sha256"]
    cpu = Uc(UC_ARCH_X86, UC_MODE_64)
    cpu.mem_map(start & ~4095, 4096)
    cpu.mem_write(start, raw)
    release, base = 0x1400021D0, 0x200000000
    cpu.mem_map(release & ~4095, 4096)
    cpu.mem_map(base, 0x20000)
    account, perks, races = base + 0x1000, base + 0x2000, base + 0x3000
    stop, stack = base + 0x10000, base + 0x1F008
    released = []
    instructions = 0

    def hook(machine, pc, size, unused):
        nonlocal instructions
        if pc == stop:
            machine.emu_stop()
            return
        if pc == release:
            # The original loop passes each nonempty perk String to drop.
            assert machine.reg_read(reg.UC_X86_REG_R8) == 1
            released.append((machine.reg_read(reg.UC_X86_REG_RCX),
                             machine.reg_read(reg.UC_X86_REG_RDX)))
            sp = machine.reg_read(reg.UC_X86_REG_RSP)
            destination = struct.unpack("<Q", machine.mem_read(sp, 8))[0]
            machine.reg_write(reg.UC_X86_REG_RSP, sp + 8)
            machine.reg_write(reg.UC_X86_REG_RIP, destination)
            return
        assert start <= pc and pc + size <= end, hex(pc)
        instructions += 1

    cpu.hook_add(UC_HOOK_CODE, hook)
    cases = 0
    for resets, perk_count, owned in itertools.product(
        (0, 1, 2, 3, 0xFFFFFFFF), (0, 1, 2, 5),
        ((), (1,), (2, 5, 6, 8), tuple(range(1, 9))),
    ):
        before = bytearray((index * 17 + 13) % 256 for index in range(0x240))
        struct.pack_into("<QQQ", before, 0x108, perk_count, perks, perk_count)
        struct.pack_into("<QQQ", before, 0x138, len(owned), races, len(owned))
        struct.pack_into("<I", before, 0x1F8, resets)
        cpu.mem_write(account, bytes(before))
        race_data = bytes(owned) + b"permanent-race-sentinel"
        cpu.mem_write(races, race_data)
        expected_frees = []
        for index in range(perk_count):
            # Alternate zero-capacity and allocated String rows, retaining the
            # original loop's skip/deallocate branches independently of rank.
            capacity, pointer = (index % 2) * 7, base + 0x4000 + 32 * index
            cpu.mem_write(perks + 32 * index, struct.pack("<QQQQ", capacity, pointer, 3, 0))
            if capacity:
                expected_frees.append((pointer, capacity))
        cpu.mem_write(stack, struct.pack("<Q", stop))
        cpu.reg_write(reg.UC_X86_REG_RSP, stack)
        cpu.reg_write(reg.UC_X86_REG_RCX, account)
        cpu.reg_write(reg.UC_X86_REG_RAX, 0xAAAAAAAAAAAAAAAA)
        released.clear()
        cpu.emu_start(start, 0, count=1000)
        assert cpu.reg_read(reg.UC_X86_REG_RIP) == stop
        accepted = resets < 2 and perk_count != 0
        assert bool(cpu.reg_read(reg.UC_X86_REG_RAX) & 0xFF) == accepted
        after = bytearray(before)
        if accepted:
            struct.pack_into("<Q", after, 0x118, 0)
            struct.pack_into("<I", after, 0x1F8, resets + 1)
        assert bytes(cpu.mem_read(account, len(before))) == bytes(after)
        assert bytes(cpu.mem_read(races, len(race_data))) == race_data
        assert released == (expected_frees if accepted else [])
        cases += 1
    return {"cases": cases, "original_instructions": instructions,
            "account_bytes_checked_per_case": 0x240,
            "seam": "String deallocation observed without freeing memory"}


def source_connections():
    schema = (SOURCE / "save/schema.rs").read_text()
    save = (SOURCE / "save.rs").read_text()
    progression = (SOURCE / "progression.rs").read_text()
    backend = (SOURCE / "menu_state/backend.rs").read_text()
    parser = block(schema, "fn purchased_races(")
    assert 'csv(lines,"races|")' in parser
    assert '.parse::<u8>().ok()' in parser and '(1..=8).contains(race)' in parser
    assert '.collect::<BTreeSet<_>>()' in parser and '.into_iter().collect()' in parser
    normalize = block(schema, "fn normalize(")
    assert '"races",purchased_races(lines).into_iter().map(|id|id.to_string())' in normalize
    assert normalize.index('"tabard",') < normalize.index('"races",') < normalize.index('"pets|"')
    assert 'schema::normalize(' in block(save, "pub fn parse(")
    assert 'schema::normalize(&self.lines,false)' in block(save, "pub fn plaintext(")
    assert 'schema::purchased_races(&self.lines)' in block(save, "pub fn purchased_races(")
    assert 'seal(&self.plaintext())' in block(save, "fn export_payload(")
    assert 'Self::parse(input)' in block(save, "pub fn import(")
    assert 'letplain=self.plaintext();' in block(save, "fn payload(")
    assert 'Self::parse(&input)' in block(save, "pub fn load(")
    assert 'self.export_payload()?' in block(save, "pub fn write_export(")
    assert 'backup::after_write(self,path,&payload,clock);' in block(save, "fn write_with_clock(")
    backup = (SOURCE / "save/backup.rs").read_text()
    assert '!save.plaintext().is_empty()' in block(backup, "fn has_progress(")
    assert 'fs::write(&backup,payload)' in block(backup, "fn after_write(")
    assert 'races:save.purchased_races()' in block(progression, "fn read_with_menu(")
    apply = block(progression, "fn apply_reward_command(")
    assert 'plan.races.sort_unstable();plan.races.dedup();' in apply
    assert '("races|",plan.races.iter().map(u8::to_string)' in apply
    reset = block(progression, "fn apply_reward_reset(")
    assert 'ifowned.resets>=2||owned.perks.is_empty()' in reset
    assert 'owned.perks.clear();owned.resets+=1;' in reset
    assert '[("perk|",String::new()),("resets|",owned.resets.to_string())]' in reset
    assert 'races' not in reset and 'tabard' not in reset
    write = block(progression, "fn write_rewards(")
    assert 'letmutraces=self.races.clone();races.sort_unstable();races.dedup();' in write
    assert 'races.iter().map(u8::to_string)' in write
    assert '["perk|","tabard|","races|","pets|","resets|"]' in write
    ui_reset = compact(progression).split('Action::Resetifreset_available(&owned)=>', 1)[1].split('Action::BuyTabard', 1)[0]
    assert 'letmutreset=owned.clone();reset.perks.clear();reset.resets+=1;' in ui_reset
    assert 'reset.write_rewards(&mutmenu.save)' in ui_reset
    assert 'menu.queue_reward_reset();' in ui_reset
    assert 'self.queue_account_command(Command::ResetRewards);' in block(backend, 'fn queue_reward_reset(')
    drain = block(backend, 'fn drain_backend_commands(')
    assert 'Command::ResetRewards=>crate::progression::apply_reward_reset(&mutself.backend_save)' in drain
    assert 'Ok(true)=>ifletSome(path)=self.save_path.as_deref()' in drain
    assert 'self.backend_save.write(path)' in drain
    menu = (SOURCE / 'menu_state.rs').read_text()
    assert 'self.drain_backend_commands(_catalog);' in block(menu, 'fn persist_selection(')
    browser = (SOURCE / 'save_browser.rs').read_text()
    assert 'save.write(path)' in block(browser, 'pub fn replace(')
    assert '100*self.races.len()asu32' in block(progression, "fn spent(")
    tests = (SOURCE / "progression/race_persistence_tests.rs").read_text()
    assert '#[cfg(test)]modrace_persistence_tests;' in compact(progression)
    assert len(re.findall(r"#\[test\]", tests)) >= 5
    return ["typed loader / serializer / permanent race reader",
            "accepted command17 / backend reset18 / optimistic Rewards reset",
            "ordinary envelope / load / export / import / nondefault backup gate",
            "permanent race cost survives perk refund",
            "authored Rust integration regressions (not executed)"]


def main():
    target = latest_target(verify=True)
    proof = json.loads(PROOF.read_text())
    assert target["version"] == "0.120.0" and target["sha256"] == SHA
    assert all(target[key] == proof["target"][key] for key in ("version", "sha256", "size_bytes"))
    image = target_bytes(target)
    pe = load_script("race_persistence_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    result = {"target_sha256": SHA, "reset": original_reset(image, pe, proof),
              "parser_and_serializer_evidence": parser_evidence(target, image, pe, proof),
              "source_connections": source_connections(),
              "compilation": False, "source_executed": False,
              "application_executed": False, "file_io_verified": False, "parity_verified": False}
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
