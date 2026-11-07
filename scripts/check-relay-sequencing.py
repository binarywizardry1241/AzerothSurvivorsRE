#!/usr/bin/env python3
"""Verify the bounded 0.120.2 relay discovery evidence without compilation."""
from runtime_layout import retained_runtime_path
import hashlib
import json
import struct
import subprocess
from pathlib import Path

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script


def main():
    manifest = ROOT / "docs/analysis/evidence/relay-sequencing/manifest.json"
    proof = json.loads(manifest.read_text())
    selected = latest_target(verify=True)
    if any(selected[k] != proof["target"][k] for k in ("version", "sha256", "size_bytes")):
        raise ValueError("Relay proof belongs to a different selected target")
    image = target_bytes(selected)
    pe = load_script("relay_proof_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def verify(record):
        if "revision" in record:
            raw = subprocess.check_output(["git", "show", record["revision"] + ":" + record["path"]], cwd=ROOT)
            if hashlib.sha256(raw).hexdigest() != record["sha256"]:
                raise ValueError("Changed historical source: " + record["path"])
            return raw.decode()
        if file_sha256(retained_runtime_path(ROOT / record["path"], ROOT)) != record["sha256"]:
            raise ValueError("Changed evidence: " + record["path"])
        return (retained_runtime_path(ROOT / record["path"], ROOT)).read_text()

    for record in proof["inputs"] + proof["source_first"]["paths"]:
        verify(record)
    instruction_count = 0
    for row in proof["native_ranges"]:
        start, end = int(row["virtual_address"], 16), int(row["end_exclusive"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        if offset != int(row["file_offset"], 16) or len(raw) != row["byte_count"]:
            raise ValueError("Changed native range")
        if hashlib.sha256(raw).hexdigest() != row["sha256"]:
            raise ValueError("Changed native bytes")
        decoded = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start))
        if sum(i.size for i in decoded) != len(raw) or len(decoded) != row["instruction_count"]:
            raise ValueError("Native instruction boundary/count differs")
        verify(row["assembly"])
        expected = "\n".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}" for i in decoded)
        actual = "\n".join(line for line in (ROOT / row["assembly"]["path"]).read_text().splitlines()
                           if not line.startswith(";"))
        if expected != actual:
            raise ValueError("Assembly export differs from original bytes")
        instruction_count += len(decoded)
    for table in proof.get("native_tables", []):
        start = int(table["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + table["byte_count"]]
        if hashlib.sha256(raw).hexdigest() != table["sha256"]:
            raise ValueError("Changed guarded table bytes")
        targets = [hex(start + value[0]) for value in struct.iter_unpack("<i", raw)]
        if targets != table["case_targets"]:
            raise ValueError("Changed guarded table targets")
    for query in proof["queries"]:
        for key in ("plan", "journal", "result"):
            verify(query[key])
        stored = json.loads((ROOT / query["result"]["path"]).read_text())
        evidence = json.loads(stored["content"][0]["text"])
        if evidence["subject"]["digest"]["sha256"] != selected["sha256"]:
            raise ValueError("Query result belongs to another EXE")
        if evidence["evidence_id"] != query["evidence_id"] or evidence["operation"] != query["operation"]:
            raise ValueError("Query evidence identity differs")
    for source in proof["source_observations"]:
        text = verify(source["source"])
        if any(fragment not in text for fragment in source["observed_fragments"]):
            raise ValueError("Source connection changed: " + source["id"])
    print(json.dumps({"target": proof["target"], "native_ranges": len(proof["native_ranges"]),
                      "instructions": instruction_count, "durable_queries": len(proof["queries"]),
                      "guarded_tables": len(proof.get("native_tables", [])),
                      "source_observations": len(proof["source_observations"]), "passed": True,
                      "compilation_or_target_execution": False}, indent=2))


if __name__ == "__main__":
    main()
