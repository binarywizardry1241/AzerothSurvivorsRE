#!/usr/bin/env python3
"""Verify #172's current native/data/source connections without compiling or running the game."""

from runtime_layout import retained_runtime_path
from script_sources import current_path, recorded_input_matches
import hashlib
import json
import platform
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

EVIDENCE = ROOT / "docs/analysis/evidence/achievement-unlock-names"


def digest(data):
    return hashlib.sha256(data).hexdigest()


def exported_pseudocode(text):
    return "\n".join(line.rstrip() for line in text.strip().splitlines()) + "\n"


def receipt(row, optional=False):
    path = current_path(retained_runtime_path(ROOT / row["path"], ROOT))
    if optional and not path.is_file():
        return None
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def main():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    proof = json.loads((EVIDENCE / "manifest.json").read_text())
    selected = latest_target(verify=True)
    assert proof["target"] == {key: selected[key] for key in proof["target"]}
    assert proof["finding"] == 172 and proof["target_executed"] is False
    data = target_bytes(selected)
    pe = load_script("unlock_names_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    cs = Cs(CS_ARCH_X86, CS_MODE_64)

    dependency = proof["lookup_dependency"]
    lookup = json.loads((ROOT / dependency["manifest"]).read_text())
    assert lookup["target"] == proof["target"]
    span = next(row for row in lookup["native_spans"] if row["role"] == dependency["role"])
    assert all(span[key] == dependency[key] for key in ("va", "end_exclusive", "sha256"))
    offset = pe.rva_offset(int(span["va"], 16) - pe.image_base)
    assert digest(data[offset:offset + span["byte_count"]]) == span["sha256"]

    def raw(start, count):
        offset = pe.rva_offset(start - pe.image_base)
        return data[offset:offset + count]

    def word(start):
        return struct.unpack("<Q", raw(start, 8))[0]

    def string(start, length):
        return raw(start, length).decode("utf-8")

    instructions = {}
    for row in proof["ranges"] + proof["registries"] + proof["formats"]:
        start = int(row["start"], 16)
        assert int(row["end_exclusive"], 16) - start == row["byte_count"]
        assert pe.rva_offset(start - pe.image_base) == int(row["file_offset"], 16)
        content = raw(start, row["byte_count"])
        assert digest(content) == row["sha256"], row["role"]
        if "assembly" in row:
            decoded = list(cs.disasm(content, start))
            assert len(decoded) == row["instruction_count"]
            assert sum(len(item.bytes) for item in decoded) == len(content)
            assembly = "\n".join(
                f"{item.address:016x}  {item.bytes.hex():22s} {item.mnemonic} {item.op_str}".rstrip()
                for item in decoded) + "\n"
            assert receipt(row["assembly"]).read_text() == assembly
            instructions.update({item.address: item for item in decoded})
            receipt(row["decompilation"])
        if "bytes_hex" in row:
            assert content.hex() == row["bytes_hex"]
        if "rows" in row:
            assert row["stride"] == 64 and len(row["rows"]) * 64 == len(content)
            for index, descriptor in enumerate(row["rows"]):
                address = start + index * 64
                assert hex(address) == descriptor["va"]
                assert string(word(address), word(address + 8)) == descriptor["name"]
                assert string(word(address + 16), word(address + 24)) == descriptor["icon"]
                achievement = string(word(address + 32), word(address + 40)) if word(address + 32) else None
                assert achievement == descriptor["achievement"]
                assert word(address + 48) & 0xffffffff == descriptor["id"]

    for edge in proof["direct_call_edges"]:
        address, target = int(edge["va"], 16), int(edge["target"], 16)
        start, end = (int(value, 16) for value in edge["owner"])
        decoded = {item.address: item for item in cs.disasm(raw(start, end - start), start)}
        assert decoded[address].mnemonic == "call" and decoded[address].op_str == hex(target)

    for anchor in proof["ui_anchors"]:
        start, end = (int(value, 16) for value in anchor["range"])
        assert start in instructions and any(item.address + item.size == end
                                            for item in instructions.values())
    assert instructions[0x140264c20].op_str == "0x145b445f0"
    assert instructions[0x140264fad].op_str == "0x1402d9570"
    assert instructions[0x1402db01e].op_str == "0x145f66f30"
    assert instructions[0x1402daac3].op_str == "0x1402cf480"

    # The two branches format a u32 descriptor ID at +0x30. The shared selection
    # tests the returned pointer, never the string length or equality to the key.
    for address in (0x145c3ea81, 0x145c3eb6c):
        assert instructions[address].op_str == "rax, [r13 + 0x30]"
    for address in (0x145c3eabc, 0x145c3eba7):
        assert instructions[address].mnemonic == "call"
        assert instructions[address].op_str == "0x145b29ab0"
    assert instructions[0x145c3ebcb].mnemonic == "test"
    assert instructions[0x145c3ebcb].op_str == "r12, r12"
    assert instructions[0x145c3ebce].mnemonic == "cmovne"
    assert instructions[0x145c3ebd2].mnemonic == "cmove"

    available_queries = 0
    for query in proof["queries"]:
        for field in ("input", "plan", "journal"):
            receipt(query[field], optional=True)
        result = receipt(query["result"], optional=True)
        if result:
            evidence = json.loads(result.read_text())["structuredContent"]
            assert evidence["provider"]["id"] == "ghidra"
            assert evidence["evidence_id"] == query["evidence_id"]
            assert evidence["analysis_profile"]["digest"] == query["analysis_profile_digest"]
            assert evidence["subject"]["digest"]["sha256"] == query["input"]["sha256"]
            assert digest(evidence["normalized_result"].encode()) == query["normalized_sha256"]
            export = next(row for row in proof["ranges"] if row["role"] == query["role"])
            assert receipt(export["decompilation"]).read_text() == exported_pseudocode(evidence["normalized_result"])
            available_queries += 1

    source_path = ROOT / "crates/azeroth-survivors-re/src/progression.rs"
    source = source_path.read_text()
    for row in proof["source_connections"]:
        text = (retained_runtime_path(ROOT / row["path"], ROOT)).read_text()
        start = text.index(row["start_marker"])
        end = text.index(row["end_marker"], start) if row["end_marker"] else len(text)
        assert digest(text[start:end].encode()) == row["sha256"]
    assert "unlock.label(labels)" in source and "labels.label(&unlock.name)" not in source
    assert "(input.run_if(crate::update_ui::menu_input_enabled), rebuild)" in source
    assert "Page::Achievements" in source and source.count("achievement_card(") == 4
    assert "labels.labels.get(&key).map(String::as_str).unwrap_or(&self.name)" in source

    base = ROOT / "crates/azeroth-survivors-re/assets"
    catalog = json.loads((base / "rewards-catalogs-0.112.0.json").read_text())
    achievements = catalog["achievements"] + json.loads((base / "coop-achievements-0.117.0.json").read_text())["achievements"]
    additions = json.loads((base / "party-rewards-0.117.0.json").read_text())
    cosmetics = json.loads((base / "armory-cosmetics-0.112.0.json").read_text())["cosmetics"] + additions["cosmetics"]
    tabards = catalog["tabards"][:]
    at = additions["tabard_insertion_index"]
    tabards[at:at] = additions["tabards"]
    registries = {row["role"]: row["rows"] for row in proof["registries"]}
    for kind, rows in (("tabards", tabards), ("cosmetics", cosmetics)):
        assert len(rows) == len(registries[kind])
        for native, row in zip(registries[kind], rows):
            assert (native["id"], native["name"], native["icon"], native["achievement"]) == (
                row["id"], row["name"], row["icon"], row.get("achievement", row.get("zone")))
    joined = []
    literals = 0
    for achievement in achievements:
        for unlock in achievement["unlocks"]:
            candidates = [(kind, row) for kind, rows in registries.items() for row in rows
                          if row["achievement"] == achievement["key"]
                          and row["name"] == unlock["name"] and row["icon"] == unlock["icon"]]
            if unlock["prefix"] == "Reward":
                assert len(candidates) == 1, achievement["key"]
                kind, row = candidates[0]
                joined.append(("tabard" if kind == "tabards" else "cosmetic", row))
            else:
                assert not candidates
                literals += 1
    assert len(joined) == 22 and literals == 35
    assert sum(kind == "cosmetic" for kind, row in joined) == 14

    review = json.loads((ROOT / "docs/analysis/evidence/locale-catalog-review.json").read_text())
    locale_cases = 0
    for locale in review["locales"]:
        payload = locale["payload"]
        start = int(payload["file_offset"], 16)
        content = data[start:start + payload["byte_count"]]
        assert digest(content) == payload["sha256"]
        native = json.loads(content)
        labels = json.loads((base / "locales" / (locale["code"] + ".json")).read_text())
        for kind, row in joined:
            key = f"{kind}.{row['id']}"
            # Older descriptors may have no ID-key translation; direct fallback
            # is checked separately from the eight new cooperative ID keys.
            assert labels.get(key, row["name"]) == native.get(key, row["name"]), (locale["code"], key)
            locale_cases += 1

    host = {("Darwin", "arm64"): "aarch64-apple-darwin",
            ("Darwin", "x86_64"): "x86_64-apple-darwin",
            ("Linux", "aarch64"): "aarch64-unknown-linux-gnu",
            ("Linux", "x86_64"): "x86_64-unknown-linux-gnu"}.get((platform.system(), platform.machine()))
    rustfmt = ROOT / ".tools/rust" / ("1.98.1-" + (host or "unsupported")) / "bin/rustfmt"
    assert rustfmt.is_file(), "Configured Rust syntax parser unavailable"
    result = subprocess.run([str(rustfmt), "--edition", "2024", "--emit", "stdout", "--config", "skip_children=true"],
                            input=source, text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, cwd=ROOT, timeout=30)
    assert result.returncode == 0, result.stderr
    print(f"Passed: {len(proof['ranges'])} native spans / {len(instructions)} instructions, "
          f"{len(proof['direct_call_edges'])} direct edges, 35 descriptors, 22 appearance joins, "
          f"{locale_cases} locale/name cases, 35 literal rows, {available_queries} retained Ghidra results; Rust syntax parsed.")
    print("Authored Rust regressions unrun; compilation, actual UI and original/rebuilt parity unverified.")


if __name__ == "__main__":
    main()
