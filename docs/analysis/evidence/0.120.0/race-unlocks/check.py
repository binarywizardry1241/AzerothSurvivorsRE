#!/usr/bin/env python3
"""Verify bounded race-unlock evidence; no compilation or target execution.

Use the existing Capstone installation. --queries additionally verifies retained
local durable journals/results. Recovered semantics and source gaps are explained
by release-contracts-0.120.0.md; this verifies only exact evidence admission.
"""

import argparse
import hashlib
import importlib.util
import json
import subprocess
from pathlib import Path

from capstone import Cs, CS_ARCH_X86, CS_MODE_64

ROOT = Path(__file__).resolve().parents[5]
HERE = Path(__file__).resolve().parent


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def verify_receipt(row):
    if "git_revision" in row:
        raw = subprocess.check_output(["git", "show", f'{row["git_revision"]}:{row["path"]}'], cwd=ROOT)
    else:
        raw = (ROOT / row["path"]).read_bytes()
    assert digest(raw) == row["sha256"], row["path"]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--queries", action="store_true")
    args = parser.parse_args()
    manifest = json.loads((HERE / "manifest.json").read_text())
    config = json.loads((ROOT / ".codex/reference-game.json").read_text())
    image = Path(config["exe"]).read_bytes()
    assert len(image) == manifest["target"]["size_bytes"]
    assert digest(image) == manifest["target"]["sha256"]
    spec = importlib.util.spec_from_file_location("race_evidence_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(image)
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in manifest["native_ranges"]:
        address = int(row["va"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        assert offset == int(row["file_offset"], 16)
        raw = image[offset:offset + row["byte_count"]]
        assert digest(raw) == row["sha256"], row["role"]
        instructions = list(md.disasm(raw, address))
        assert sum(item.size for item in instructions) == len(raw), row["role"]
        assert len(instructions) == row["instruction_count"], row["role"]
        assembly = "\n".join(
            f"{item.address:016x}  {item.bytes.hex():22s} {item.mnemonic} {item.op_str}".rstrip()
            for item in instructions
        ) + "\n"
        verify_receipt(row["assembly"])
        assert (ROOT / row["assembly"]["path"]).read_text() == assembly, row["role"]
    for row in manifest["strings"]:
        offset = int(row["file_offset"], 16)
        raw = image[offset:offset + row["byte_count"]]
        assert digest(raw) == row["sha256"]
        assert raw == row["text"].encode("latin1")
    for row in manifest["source_receipts"]:
        verify_receipt(row)
    if args.queries:
        for query in manifest["queries"]:
            for key in ("plan", "journal", "result"):
                verify_receipt(query[key])
            journal = json.loads((ROOT / query["journal"]["path"]).read_text())
            assert journal["status"] == "completed"
            evidence = json.loads((ROOT / query["result"]["path"]).read_text())["structuredContent"]
            assert evidence["evidence_id"] == query["evidence_id"]
            assert evidence["provider"]["id"] == "ghidra"
            assert evidence["parameters"]["procedure"] == query["procedure"]
            assert evidence["subject"]["digest"]["sha256"] == query["subject_sha256"]
            assert digest(evidence["normalized_result"].encode()) == query["normalized_result_sha256"]
            assert evidence["analysis_profile"]["digest"] == query["analysis_profile_digest"]
            if query["scope"] == "full-PE":
                assert query["subject_sha256"] == manifest["target"]["sha256"]
            else:
                assert query["subject_sha256"] in {
                    row["sha256"] for row in manifest["native_ranges"]
                    if row["query_label"] == query["label"]
                }
    print(json.dumps(dict(
        target=manifest["target"]["version"],
        native_ranges=len(manifest["native_ranges"]),
        original_instructions=sum(row["instruction_count"] for row in manifest["native_ranges"]),
        native_literals=len(manifest["strings"]),
        source_receipts=len(manifest["source_receipts"]),
        completed_queries_verified=len(manifest["queries"]) if args.queries else 0,
        compilation=False, target_executed=False, parity_verified=False,
    ), indent=2))


if __name__ == "__main__":
    main()
