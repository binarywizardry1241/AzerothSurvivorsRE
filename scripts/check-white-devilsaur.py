#!/usr/bin/env python3
"""Verify the bounded White Devilsaur native/source integration, without compilation.

Checks byte/data/query commitments and source connections. Rustfmt parses stdin
only; it does not type check, compile, execute tests or launch the game/server.
"""
import argparse
import hashlib
import json
import platform
import re
import struct
import subprocess

from coverage_common import ROOT, latest_target, project_path, target_bytes
from script_sources import load_script

PROOF = ROOT / "docs/analysis/evidence/0.117.0/white-devilsaur-integration.json"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    args = parser.parse_args()
    proof = json.loads(PROOF.read_text())
    target = latest_target()
    assert target["sha256"] == proof["target"]["sha256"]
    data = target_bytes(target)
    pe = load_script("white_integration_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        assert at is not None
        return data[at:at + size]

    base_path = project_path(proof["base_contract"]["path"])
    assert digest(base_path.read_bytes()) == proof["base_contract"]["sha256"]
    base = json.loads(base_path.read_text())
    admitted_inputs = set()

    def verify_base_spans(value):
        if isinstance(value, dict):
            if {"va", "byte_count", "sha256"} <= value.keys():
                assert digest(raw(int(value["va"], 16), value["byte_count"])) == value["sha256"]
                admitted_inputs.add(value["sha256"])
            for item in value.values():
                verify_base_spans(item)
        elif isinstance(value, list):
            for item in value:
                verify_base_spans(item)

    verify_base_spans(base)

    for span in proof["native_spans"]:
        assert digest(raw(int(span["va"], 16), span["byte_count"])) == span["sha256"], span["role"]
        admitted_inputs.add(span["sha256"])
    for entry in proof["selected_dispatch_entries"]:
        table = int(entry["table_base"], 16)
        at = table + entry["index"] * 4
        offset = int.from_bytes(raw(at, 4), "little", signed=True)
        assert table + offset == int(entry["destination"], 16)
    for field in proof["data_fields"]:
        actual = raw(int(field["va"], 16), len(bytes.fromhex(field["hex"])))
        assert actual.hex() == field["hex"], field["role"]

    source = {}
    for receipt in proof["source_receipts"]:
        text = project_path(receipt["path"]).read_text()
        if "sha256" in receipt:
            assert digest(text.encode()) == receipt["sha256"], receipt["path"]
        for fragment in receipt.get("fragments", []):
            start = text.index(fragment["start"])
            end = text.index(fragment["end"], start)
            assert digest(text[start:end].encode()) == fragment["sha256"], receipt["path"]
        source[receipt["path"]] = text
    for check in proof["source_connections"]:
        assert check["anchor"] in source[check["path"]], check["role"]

    pets = source["crates/azeroth-survivors-re/src/run_effects/pets.rs"]
    for row in proof["white_descriptors"]:
        descriptor = raw(int(row["va"], 16), 64)
        native = struct.unpack_from("<IIfffIBB", descriptor, 32)
        assert native == (row["entry"], row["model"],
                          struct.unpack("<f", int(row["scale_bits"], 16).to_bytes(4, "little"))[0],
                          float(row["damage"]),
                          struct.unpack("<f", int(row["period_bits"], 16).to_bytes(4, "little"))[0],
                          row["spell_id"], row["school"], row["special"])
        blocks = [block for block in pets.split("PetDefinition {")[1:]
                  if re.search(r"\bentry:\s*" + str(row["entry"]) + r"\s*,", block)]
        assert len(blocks) == 1
        block = blocks[0].split("},", 1)[0]
        for key in ("model", "spell_id", "school", "special"):
            assert re.search(r"\b" + key + r":\s*" + str(row[key]) + r"\s*,", block), (row["entry"], key)
        for key in ("scale", "period"):
            assert f"{key}: f32::from_bits({row[key + '_bits']})," in block
        assert f"damage: {row['damage']}.0," in block
        assert f"native_address: {row['va']}," in block

    templates = source["crates/azeroth-survivors-re/src/gameplay/client/creature_queries.rs"]
    for row in proof["creature_templates"]:
        expected = (f'({row["entry"]}, "{row["name"]}", "{row["name"]}", '
                    f'"{row["subname"]}", {row["type"]}, {row["display"]})')
        assert expected in templates, row["entry"]
    catalog = json.loads((ROOT / "crates/azeroth-survivors-re/assets/talents.json").read_text())
    ordinary = {"tame_beast": 9510, "bestial_wrath": 9511, "force_of_nature": 9515,
                "stormstrike": 9516, "water_elemental": 9517}
    producers = 0
    for class_row in catalog["classes"]:
        for tree in class_row["trees"]:
            for talent in tree["talents"]:
                if talent["key"] not in ordinary:
                    continue
                for effect in talent["effects"]:
                    payload = bytes.fromhex(effect.get("raw_hex", effect.get("payload", "")))
                    if payload[0] == 29:
                        address = int.from_bytes(payload[8:16], "little")
                        assert f"0x{address:x} => Some({ordinary[talent['key']]})," in pets
                        producers += 1
    assert producers == 7

    checked = 0
    retained = {}
    for query in proof["query_receipts"]:
        assert query["input_sha256"] in admitted_inputs, query["role"]
        plan = project_path(query["plan"])
        result = project_path(query["result"])
        if not plan.is_file() or not result.is_file():
            if args.require_retained_queries:
                raise ValueError("Missing retained query: " + query["role"])
            continue
        assert digest(plan.read_bytes()) == query["plan_sha256"]
        assert digest(result.read_bytes()) == query["result_sha256"]
        evidence = json.loads(result.read_text())["structuredContent"]
        assert evidence["evidence_id"] == query["evidence_id"]
        assert evidence["analysis_profile"]["digest"] == query["profile_sha256"]
        assert evidence["subject"]["digest"]["sha256"] == query["input_sha256"]
        retained[query["result"]] = evidence
        checked += 1
    for extract in proof["instruction_extracts"]:
        if extract["source_result"] in retained:
            evidence = retained[extract["source_result"]]
            assert extract["evidence_id"] == evidence["evidence_id"]
            actual = evidence["normalized_result"]["instructions"]
            assert all(line in actual for line in extract["instructions"])

    host = {("Darwin", "arm64"): "aarch64-apple-darwin",
            ("Darwin", "x86_64"): "x86_64-apple-darwin",
            ("Linux", "aarch64"): "aarch64-unknown-linux-gnu",
            ("Linux", "x86_64"): "x86_64-unknown-linux-gnu"}.get(
                (platform.system(), platform.machine()))
    rustfmt = ROOT / ".tools/rust" / ("1.98.1-" + (host or "unsupported")) / "bin/rustfmt"
    if not rustfmt.is_file():
        raise ValueError("Configured project parser unavailable; no installation attempted")
    syntax = 0
    for path, text in source.items():
        if path.endswith(".rs"):
            result = subprocess.run([str(rustfmt), "--edition", "2024", "--emit", "stdout",
                                     "--config", "skip_children=true"], input=text, text=True,
                                    stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, cwd=ROOT, timeout=30)
            assert result.returncode == 0, (path, result.stderr)
            syntax += 1
    print(f"Passed {len(proof['native_spans'])} target-bound native spans, "
          f"{len(proof['selected_dispatch_entries'])} selected dispatch entries, "
          f"{len(proof['data_fields'])} data fields, two White descriptors and "
          f"{len(proof['source_connections'])} source connections.")
    print(f"Verified {checked}/{len(proof['query_receipts'])} retained query receipts; "
          f"parsed {syntax} Rust files with rustfmt/stdin only.")
    print("No compilation, Rust regression execution, game/client/network/server operation or parity proof.")


if __name__ == "__main__":
    main()
