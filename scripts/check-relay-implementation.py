#!/usr/bin/env python3
"""Replay the bounded relay implementation proof without compiling or running a client."""

from runtime_layout import retained_runtime_path
import argparse
import hashlib
import json
import struct
import subprocess

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from coverage_common import ROOT, file_sha256, latest_target, target_bytes
from script_sources import load_script


MANIFEST = ROOT / "docs/analysis/evidence/relay-implementation/manifest.json"


def require(condition, message):
    if not condition:
        raise ValueError(message)


def verify_file(record):
    path = retained_runtime_path(ROOT / record["path"], ROOT)
    require(file_sha256(path) == record["sha256"], "Changed proof input: " + record["path"])
    return path


def normalized_sha256(value):
    text = value if isinstance(value, str) else json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(text.encode()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-index", action="store_true",
                        help="Check explicitly staged source while preserving other chats' worktree changes")
    arguments = parser.parse_args()
    proof = json.loads(MANIFEST.read_text())
    selected = latest_target(verify=True)
    require(all(selected[key] == proof["target"][key]
                for key in ("version", "sha256", "size_bytes")),
            "Relay implementation proof belongs to a different installed target")
    image = target_bytes(selected)
    pe = load_script("relay_implementation_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    require(proof["target_executed"] is False, "Unexpected target execution claim")

    def native_bytes(record):
        start = int(record["virtual_address"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + record["byte_count"]]
        require(offset == int(record["file_offset"], 16), "Native file offset differs")
        require(len(raw) == record["byte_count"], "Truncated native proof")
        require(hashlib.sha256(raw).hexdigest() == record["sha256"],
                "Native bytes differ at " + record["virtual_address"])
        return start, raw

    for record in proof["inputs"]:
        verify_file(record)
    instructions = {}
    instruction_count = 0
    byte_count = 0
    for record in proof["native_ranges"]:
        start, raw = native_bytes(record)
        require(start + len(raw) == int(record["end_exclusive"], 16), "Native extent differs")
        decoded = list(decoder.disasm(raw, start))
        require(sum(item.size for item in decoded) == len(raw), "Native proof has undecoded bytes")
        require(len(decoded) == record["instruction_count"], "Native instruction count differs")
        assembly = verify_file(record["assembly"])
        expected = "\n".join(f"{item.address:016x} {item.bytes.hex():<30} {item.mnemonic} {item.op_str}".rstrip()
                             for item in decoded)
        actual = "\n".join(line.rstrip() for line in assembly.read_text().splitlines()
                           if not line.startswith(";"))
        require(actual == expected, "Assembly differs: " + record["role"])
        for item in decoded:
            require(item.address not in instructions, "Native instruction proof duplicated")
            instructions[item.address] = item
        instruction_count += len(decoded)
        byte_count += len(raw)

    formats = {"f32": "<f", "f64": "<d", "u32": "<I", "u64": "<Q"}
    for record in proof["native_constants"]:
        _, raw = native_bytes(record)
        fmt = formats[record["encoding"]]
        require(len(raw) == struct.calcsize(fmt), "Native constant width differs")
        require(struct.unpack(fmt, raw)[0] == record["value"], "Native constant value differs")
    for record in proof["native_tables"]:
        start, raw = native_bytes(record)
        if record.get("encoding") == "relative_i32":
            targets = [hex(start + item[0]) for item in struct.iter_unpack("<i", raw)]
            require(targets == record["case_targets"], "Guarded relay dispatch table differs")
            require(len(targets) == record["maximum_selector"] - record["minimum_selector"] + 1,
                    "Guarded relay dispatch domain differs")
            index = record["selected_selector"] - record["minimum_selector"]
            require(0 <= index < len(targets) and targets[index] == record["selected_target"],
                    "Selected relay dispatch target differs")
        else:
            require([item[0] for item in struct.iter_unpack("<Q", raw)] == record["values"],
                    "Inner encoder sequence-field table differs")
    for record in proof["instruction_assertions"]:
        instruction = instructions.get(int(record["site"], 16))
        require(instruction is not None, "Contract assertion has no decoded instruction")
        require((instruction.mnemonic, instruction.op_str) == (record["mnemonic"], record["operands"]),
                "Contract instruction differs: " + record["role"])

    for query in proof["queries"]:
        plan = json.loads(verify_file(query["plan"]).read_text())
        journal = json.loads(verify_file(query["journal"]).read_text())
        stored = json.loads(verify_file(query["result"]).read_text())
        evidence = json.loads(stored["content"][0]["text"])
        require(journal["status"] == "completed", "Native query journal is unfinished")
        require(journal["identity"]["target"]["sha256"] == selected["sha256"],
                "Native journal belongs to another target")
        operation = journal["operations"][query["journal_operation_key"]]
        require(operation["status"] == "completed", "Native operation is unfinished")
        require(operation["result"] == query["result"], "Native journal/result commitment differs")
        require(operation["name"] == query["operation"]
                and operation["arguments"]["procedure"] == query["procedure"],
                "Native journal selector differs")
        require(any(item["name"] == query["operation"]
                    and item["arguments"].get("procedure") == query["procedure"]
                    for item in plan["operations"]), "Saved plan omits the native selector")
        require(evidence["subject"]["digest"]["sha256"] == selected["sha256"],
                "Native query result belongs to another target")
        require(evidence["evidence_id"] == query["evidence_id"]
                and evidence["operation"] == query["operation"]
                and evidence["parameters"]["procedure"] == query["procedure"],
                "Native query evidence identity differs")
        require(evidence["provider"]["id"] == "ghidra", "Native query used another provider")
        require(evidence["analysis_profile"]["digest"] == query["analysis_profile_digest"],
                "Native analysis profile differs")
        require(normalized_sha256(evidence["normalized_result"]) == query["normalized_sha256"],
                "Native normalized result differs")

    for observation in proof.get("source_observations", []):
        record = observation["source"]
        if arguments.source_index:
            raw = subprocess.check_output(["git", "show", ":" + record["path"]], cwd=ROOT)
            require(hashlib.sha256(raw).hexdigest() == record["sha256"],
                    "Staged source differs: " + record["path"])
            source = raw.decode()
        else:
            source = verify_file(record).read_text()
        require(all(fragment in source for fragment in observation["observed_fragments"]),
                "Source connection differs: " + observation["id"])

    print(json.dumps({"target": proof["target"], "native_ranges": len(proof["native_ranges"]),
                      "native_bytes": byte_count, "instructions": instruction_count,
                      "native_constants": len(proof["native_constants"]),
                      "native_tables": len(proof["native_tables"]),
                      "instruction_assertions": len(proof["instruction_assertions"]),
                      "durable_queries": len(proof["queries"]),
                      "source_observations": len(proof.get("source_observations", [])),
                      "passed": True, "compilation_or_target_execution": False}, indent=2))


if __name__ == "__main__":
    main()
