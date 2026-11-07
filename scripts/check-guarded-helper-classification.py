#!/usr/bin/env python3
"""Verify the nine bounded helper-table classifications without target execution."""
from runtime_layout import retained_runtime_path
import hashlib
import json
import struct

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from capstone import __version__ as CAPSTONE_VERSION
from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script


def main():
    proof_path = ROOT / "docs/analysis/evidence/guarded-helper-classification/manifest.json"
    proof = json.loads(proof_path.read_text())
    if proof['native_decoder_version'] != CAPSTONE_VERSION:
        raise ValueError('Native decoder version differs')
    target = latest_target(verify=True)
    if any(target[key] != proof["target"][key] for key in ("version", "sha256", "size_bytes")):
        raise ValueError("Helper proof belongs to another target")
    image = target_bytes(target)
    pe = load_script("helper_classification_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def verify(record):
        if file_sha256(retained_runtime_path(ROOT / record["path"], ROOT)) != record["sha256"]:
            raise ValueError("Changed evidence: " + record["path"])

    for record in proof["inputs"] + proof["source_first"]["paths"]:
        verify(record)
    source = json.loads((ROOT / proof["inputs"][0]["path"]).read_text())
    selected = {row["queue_selector"] for row in source["leads"]
                if row["status"] == "supporting_native_type_or_helper_classification_pending"}
    if {row["selector"] for row in proof["classifications"]} != selected:
        raise ValueError("Helper classification dropped or added an unmatched selector")

    decoded_ranges = {}
    instruction_count = 0
    for row in proof["native_ranges"]:
        start, end = int(row["virtual_address"], 16), int(row["end_exclusive"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + end - start]
        if offset != int(row["file_offset"], 16) or len(raw) != row["byte_count"]:
            raise ValueError("Native range mapping changed")
        if hashlib.sha256(raw).hexdigest() != row["sha256"]:
            raise ValueError("Native range bytes changed")
        decoded = list(Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, start))
        if sum(instruction.size for instruction in decoded) != len(raw):
            raise ValueError("Incomplete native range decode")
        if len(decoded) != row["instruction_count"]:
            raise ValueError("Native instruction count changed")
        verify(row["assembly"])
        assembly = "\n".join(f"{i.address:016x} {i.bytes.hex():<30} {i.mnemonic} {i.op_str}".rstrip() for i in decoded)
        if (ROOT / row["assembly"]["path"]).read_text().rstrip("\n") != assembly:
            raise ValueError("Native assembly does not reproduce")
        decoded_ranges[row["id"]] = decoded
        instruction_count += len(decoded)

    for row in proof["native_tables"]:
        start = int(row["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        if hashlib.sha256(raw).hexdigest() != row["sha256"]:
            raise ValueError("Guarded table bytes changed")
        if [hex(start + cell[0]) for cell in struct.iter_unpack("<i", raw)] != row["case_targets"]:
            raise ValueError("Guarded table destinations changed")
        decoded = decoded_ranges[row["range_id"]]
        instructions = {i.address: i for i in decoded}
        dispatch = instructions[int(row["site"], 16)]
        if (dispatch.mnemonic, dispatch.op_str) != ("jmp", "rax"):
            raise ValueError("Guarded dispatch is no longer the selected register jump")

    for row in proof["classifications"]:
        decoded = decoded_ranges[row["range_id"]]
        operations = {(i.mnemonic, i.op_str) for i in decoded}
        if any(tuple(operation) not in operations for operation in row["required_instructions"]):
            raise ValueError("Classification contract changed: " + row["selector"])
        if row["role"] == "enum_cleanup":
            allowed = {"0x1400021d0", "0x140502770"}
            if any(i.op_str not in allowed for i in decoded if i.mnemonic == "call"):
                raise ValueError("Enum cleanup acquired an unreviewed call")
            start = decoded[0].address
            end = decoded[-1].address + decoded[-1].size
            for instruction in decoded:
                if instruction.mnemonic == "jmp" and instruction.op_str != "rax":
                    destination = int(instruction.op_str, 16)
                    if not start <= destination < end and instruction.op_str != "0x1400021d0":
                        raise ValueError("Enum cleanup acquired an unreviewed external tail")

    for query in proof["queries"]:
        for key in ("plan", "journal", "result"):
            verify(query[key])
        retained = json.loads((ROOT / query["result"]["path"]).read_text())
        native = json.loads(retained["content"][0]["text"])
        if native["subject"]["digest"]["sha256"] != target["sha256"]:
            raise ValueError("Native query belongs to another target")
        if native["evidence_id"] != query["evidence_id"] or native["operation"] != query["operation"]:
            raise ValueError("Native query identity changed")
        if native["parameters"]["procedure"] != query["procedure"]:
            raise ValueError("Native query selected another owner")
    for observation in proof["source_first"]["observations"]:
        text = (ROOT / observation["path"]).read_text()
        if any(fragment not in text for fragment in observation["fragments"]):
            raise ValueError("Source interface changed: " + observation["path"])
    print(json.dumps({"target": proof["target"], "classified_tables": len(proof["classifications"]),
                      "native_ranges": len(proof["native_ranges"]), "instructions": instruction_count,
                      "durable_queries": len(proof["queries"]), "passed": True,
                      "compilation_or_target_execution": False}, indent=2))


if __name__ == "__main__":
    main()
