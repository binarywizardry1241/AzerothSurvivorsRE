#!/usr/bin/env python3
"""Verify selected White Devilsaur data/code/source/query receipts without execution.

This rechecks the exact reviewed population, not current pet behavior or parity.
Saved query payloads are optional unless --require-retained-queries is supplied.
"""
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, artifact_path, project_path
from script_sources import load_script

PROOF = ROOT / "docs/analysis/evidence/white-devilsaur-leads.json"
PROOF_SHA = "22f987e0436f87e6eecbf511e0aa801d2da924bc97b77911f3d453a56eabc64c"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--require-retained-queries", action="store_true")
    parser.add_argument("--require-original-source", action="store_true",
                        help="Also require the historical pre-implementation source snapshots")
    args = parser.parse_args()
    encoded = PROOF.read_bytes()
    if sha(encoded) != PROOF_SHA:
        raise ValueError("Reviewed proof population changed; review before rebinding")
    proof = json.loads(encoded)
    data = artifact_path(proof["target"]["path"]).read_bytes()
    assert sha(data) == proof["target"]["sha256"]
    assert len(data) == proof["target"]["size_bytes"]
    pe = load_script("white_leads_pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, size):
        start = pe.rva_offset(address - pe.image_base)
        assert start is not None
        return data[start:start + size]

    def pair(address):
        pointer, size = struct.unpack("<QQ", raw(address, 16))
        assert size < 500
        return raw(pointer, size).decode() if pointer and size else None

    checked = 0

    def spans(value):
        nonlocal checked
        if isinstance(value, dict):
            if {"file_offset", "byte_count", "sha256", "va", "end_exclusive"} <= value.keys():
                address, size = int(value["va"], 16), value["byte_count"]
                assert size > 0 and pe.rva_offset(address - pe.image_base) == int(value["file_offset"], 16)
                assert int(value["end_exclusive"], 16) == address + size
                assert sha(raw(address, size)) == value["sha256"]
                if "text" in value:
                    assert raw(address, size) == value["text"].encode()
                checked += 1
            for item in value.values():
                spans(item)
        elif isinstance(value, list):
            for item in value:
                spans(item)

    spans(proof)
    source_matches = []
    for receipt in proof["source_receipts"]:
        matches = sha(project_path(receipt["path"]).read_bytes()) == receipt["sha256"]
        if args.require_original_source and not matches:
            raise ValueError("Historical source snapshot changed: " + receipt["path"])
        source_matches.append(matches)
    for row in proof["pet_records"]:
        address = int(row["va"], 16)
        assert pair(address) == row["name"] and pair(address + 16) == row["icon"]
        fields = struct.unpack_from("<IIfffI", raw(address, 64), 32)
        assert fields == tuple(row[key] for key in ("entry", "model", "scale", "damage", "period", "spell_id"))
        assert tuple(raw(address + 56, 2)) == (row["school"], row["special"])
    for case in [proof["action_case"], *proof["related_cases"]]:
        entry = int(case["entry"]["va"], 16)
        assert int(case["table_base"], 16) + 4 * case["index"] == entry
        assert int(case["table_base"], 16) + struct.unpack("<i", raw(entry, 4))[0] == int(case["target"], 16)
    for owner in proof["ownership"]:
        for location in owner["location_records"]:
            pointer, size, line, column = struct.unpack("<QQII", raw(int(location["location_address"], 16), 24))
            assert pointer == int(location["path_address"], 16)
            assert raw(pointer, size).decode().replace("\\", "/") == owner["diagnostic_path"]
            assert (line, column) == (location["source_line"], location["source_column"])
        for reference in owner["verified_references"]:
            site, target = int(reference["instruction_address"], 16), int(reference["target_address"], 16)
            instruction = bytes.fromhex(reference["instruction_bytes"])
            assert raw(site, len(instruction)) == instruction
            assert site + 7 + struct.unpack_from("<i", instruction, 3)[0] == target
            start = int(reference["owner_file_offset"], 16)
            assert sha(data[start:start + reference["owner_byte_count"]]) == reference["owner_sha256"]
    retained = 0
    for query in proof["queries"]:
        extract = query["extract"]
        paths = [project_path(extract["extract"]), project_path(extract["plan"]),
                 project_path(query["result_path"])]
        if not all(path.is_file() for path in paths):
            if args.require_retained_queries:
                raise ValueError("Missing retained query payload: " + extract["label"])
            continue
        assert paths[0].read_bytes() == raw(int(extract["va"], 16), extract["byte_count"])
        assert sha(paths[1].read_bytes()) == query["plan_sha256"]
        assert sha(paths[2].read_bytes()) == query["result_sha256"]
        result = json.loads(paths[2].read_text())["structuredContent"]
        assert result["evidence_id"] == query["evidence_id"]
        assert result["subject"]["digest"]["sha256"] == extract["sha256"]
        assert result["analysis_profile"]["digest"] == query["analysis_profile_digest"]
        assert sha(result["normalized_result"].encode()) == query["normalized_pseudocode_sha256"]
        retained += 1
    print(f"Passed exact reviewed proof, {checked} native spans, 5 pet records, "
          "selected action4/action2 entries and 3 bounded module ownership receipts.")
    print(f"Historical pre-implementation source snapshots still matching: {sum(source_matches)}/5; "
          "changed source requires the separately reviewed integration evidence.")
    print(f"Checked {retained}/{len(proof['queries'])} retained query receipts; "
          f"{len(proof['queries']) - retained} unavailable checks not run.")
    print("No native instruction execution, compilation, application/server launch or parity proof.")


if __name__ == "__main__":
    main()
