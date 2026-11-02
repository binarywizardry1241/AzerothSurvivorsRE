#!/usr/bin/env python3
"""Check bounded terminal visual-query ownership without compiling or running a game.

The E8 scan is a discovery aid, not proof that indirect/global hooks are absent.
--prepare-rea stages the two newly reviewed raw-function plans below runtime/.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import bisect
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess

from coverage_common import latest_target


ROOT = Path(__file__).resolve().parents[1]
EVIDENCE = ROOT / "docs/analysis/evidence/0.105.0/terminal/hover"
INTERACTION = 0x140295CF0
BORDER = 0x1402967D0


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare-rea", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / "visual-query-owners.json").read_text())
    require(target["sha256"] == manifest["target_sha256"], "Review belongs to another target")
    path = ROOT / target["path"]
    data = path.read_bytes()
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)
    functions = sorted((pe.image_base + lo, pe.image_base + hi) for lo, hi, _ in pe.functions())
    starts = [lo for lo, _ in functions]

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + count]
        require(len(value) == count, f"Truncated native range at {address:#x}")
        return value

    for row in manifest["ranges"]:
        start, end = int(row["virtual_address"], 16), int(row["end_exclusive"], 16)
        require(hashlib.sha256(raw(start, end - start)).hexdigest() == row["sha256"],
                f"Native bytes changed: {row['role']}")
        for key in ("assembly", "pseudocode"):
            if key in row:
                text_path = EVIDENCE / row[key]
                require(hashlib.sha256(text_path.read_bytes()).hexdigest() == row[key + "_sha256"],
                        f"Retained {key} changed: {row['role']}")

    # Only candidate CALL rel32 sites inside executable sections and unwind
    # ranges are admitted; objdump then verifies the selected instruction.
    candidates = {}
    for section in pe.sections:
        if not int(section["characteristics"], 16) & 0x20000000:
            continue
        chunk = data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]]
        at = 0
        while True:
            at = chunk.find(b"\xe8", at)
            if at < 0:
                break
            address = pe.image_base + section["rva"] + at
            if at + 5 <= len(chunk) and address + 5 + struct.unpack_from("<i", chunk, at + 1)[0] == INTERACTION:
                index = bisect.bisect_right(starts, address) - 1
                if index >= 0 and address + 5 <= functions[index][1]:
                    candidates.setdefault(functions[index], []).append(address)
            at += 1
    verified, visual_queries = [], []
    for (start, end), sites in sorted(candidates.items()):
        assembly = objdump_output(
            ["objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
             f"--stop-address={end:#x}", str(path)], cwd=ROOT, text=True)
        calls = {int(at, 16): int(to, 16) for at, to in
                 re.findall(r"^([0-9a-f]+):\s+callq\s+0x([0-9a-f]+)", assembly, re.M)}
        if any(calls.get(site) == INTERACTION for site in sites):
            verified.append(hex(start))
            if BORDER in calls.values():
                visual_queries.append(hex(start))
    require(verified == manifest["interaction_direct_callers"], "Interaction caller census changed")
    require(visual_queries == [row["query"] for row in manifest["visual_queries"]],
            "Unclassified direct Interaction/BorderColor query")
    for row in manifest["visual_queries"]:
        for site, expected in row["call_contracts"]:
            address, expected = int(site, 16), int(expected, 16)
            value = raw(address, 5)
            require(value[0] == 0xE8 and address + 5 + struct.unpack_from("<i", value, 1)[0] == expected,
                    f"Query/runner call changed at {address:#x}")
    for row in manifest["state_layouts"]:
        require(raw(int(row["address"], 16), len(bytes.fromhex(row["bytes_hex"]))).hex() == row["bytes_hex"],
                "Specialized state layout changed")

    registration = manifest["registration_reference_census"]
    for target, expected in registration["absolute_pointer_file_offsets"].items():
        needle = struct.pack("<Q", int(target, 16))
        found, offset = [], 0
        while (offset := data.find(needle, offset)) >= 0:
            found.append(hex(offset))
            offset += 1
        require(found == expected, f"Unreviewed absolute getter pointer: {target}")
    site = int(registration["call_site"], 16)
    target = int(registration["component_getter"], 16)
    value = raw(site, 5)
    require(value[0] == 0xE8 and site + 5 + struct.unpack_from("<i", value, 1)[0] == target,
            "Terminal action registration call changed")
    require(raw(int(registration["component_type_id_va"], 16), 16).hex()
            == registration["component_type_id_hex"], "Terminal action TypeId changed")

    if args.prepare_rea:
        work = ROOT / "runtime/terminal-hover-recovery-0.105.0"
        work.mkdir(parents=True, exist_ok=True)
        for row in manifest["ranges"]:
            if "rea_evidence_id" not in row:
                continue
            start, end = int(row["virtual_address"], 16), int(row["end_exclusive"], 16)
            name = row["role"]
            binary = work / f"{name}.bin"
            binary.write_bytes(raw(start, end - start))
            plan = {"target": str(binary.relative_to(ROOT)),
                    "output": str((work / f"rea-{name}-fresh").relative_to(ROOT)),
                    "init_timeout": 60, "timeout": 240,
                    "open_options": {"format": "raw-binary", "architecture": "x86_64", "entry_point": hex(start)},
                    "operations": [{"name": "procedure_pseudo_code", "arguments": {"procedure": hex(start)}}]}
            (work / f"{name}-plan.json").write_text(portable_json(plan, indent=2) + "\n")
    print(f"Verified {len(verified)} direct Interaction callers, three specialized border queries, "
          "Ghidra body identities, state layouts and EndAction registration references; "
          "indirect/global hooks remain unresolved")


if __name__ == "__main__":
    main()
