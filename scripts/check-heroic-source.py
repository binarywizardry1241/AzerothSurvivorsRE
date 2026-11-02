#!/usr/bin/env python3
"""Verify Heroic descriptor/source data and original scalar-guard branches.

This does not compile or execute Rust, the game, a client or a server. The
instruction fixtures isolate the current native scalar selectors from the
surrounding guardian arithmetic and use synthetic memory/register inputs.
"""
from portable_paths import portable_json
import argparse
import hashlib
import json
import re
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script


MANIFEST = ROOT / "docs/analysis/evidence/0.121.0/heroic-source.json"


def sha(value):
    return hashlib.sha256(value).hexdigest()


def retained(row):
    path = project_path(row["path"])
    assert sha(path.read_bytes()) == row["sha256"], row["path"]
    return path


def twist_projection(proof, shared):
    roles = set(proof["shared_twist_native_roles"])
    data_roles = {row["native_data_role"] for row in proof["additional_policy_contracts"]
                  if row.get("native_data_role")}
    return {"target": shared["target"],
            "native_ranges": sorted((row for row in shared["native_ranges"] if row["role"] in roles),
                                    key=lambda row: row["role"]),
            "native_data": sorted((row for row in shared["native_data"] if row["role"] in data_roles),
                                  key=lambda row: row["role"])}


def verify(proof):
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"]
    image = target_bytes(target)
    pe = load_script("heroic_source_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    assert json.loads(retained(proof["helper_contract"]).read_text())["target"] == target
    for query in proof["supporting_context_queries"] + proof["policy_queries"]:
        raw = json.loads(retained(query["result"]).read_text())
        native = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
        verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    for row in proof["native_ranges"] + proof["native_data"]:
        address = int(row["virtual_address"], 16)
        at = pe.rva_offset(address - pe.image_base)
        raw = image[at:at + row["byte_count"]]
        assert at == int(row["file_offset"], 16)
        assert sha(raw) == row["sha256"] and raw.hex() == row["bytes_hex"]
        if row in proof["native_ranges"]:
            instructions = list(decoder.disasm(raw, address))
            assert sum(i.size for i in instructions) == len(raw)
            assert len(instructions) == row["instruction_count"]
    sources = {row["path"]: retained(row).read_text() for row in proof["source_bindings"]}
    source = sources[proof["source_bindings"][0]["path"]]
    calendar = sources[proof["calendar_contract"]["source"]]
    assert dict((key, int(value)) for key, value in re.findall(r'"([a-z]+)" => ([0-9]+),', calendar)) == proof["calendar_contract"]["explicit_zone_ordinals"]
    for expression in ("SystemTime::now()", "duration_since(std::time::UNIX_EPOCH)",
                       ".map_or(0,", "duration.as_secs() / 604_800", "as u32",
                       "_ => 0,", "super::selector_from_inputs(zone, week)"):
        assert expression in calendar
    descriptors = proof["descriptors"]
    # This checks the published Rust data against original descriptor bytes.
    # It does not claim to execute the Rust consumers or infer their behavior.
    fields = {field: re.findall(re.escape(field) + r": ([0-9.]+),", source)
              for field in ("health_multiplier", "damage_multiplier", "marks_multiplier", "reward_multiplier")}
    assert len(descriptors) == 5 and all(len(values) == 5 for values in fields.values())
    for index, row in enumerate(descriptors):
        for field, values in fields.items():
            assert struct.pack("<f", float(values[index])).hex() == row[field + "_bytes"]
        for text in row["twists"]:
            assert json.dumps(text, ensure_ascii=False) in source
    for row in proof["policy_scalar_fixtures"]:
        body = re.search(r"pub fn " + re.escape(row["field"]) + r"\([^\n]+\{\n(.*?)\n\}", source, re.S)[1]
        assert row["source_condition"] in body
        values = re.findall(r"\n\s+([0-9]+\.[0-9]+)\n", body)
        assert len(values) == 2
        assert struct.pack("<f", float(values[0])).hex() == row["true_bytes"]
        assert struct.pack("<f", float(values[1])).hex() == row["false_bytes"]
    shared = json.loads(project_path(proof["shared_twist_contract"]["path"]).read_text())
    projection = twist_projection(proof, shared)
    assert sha(json.dumps(projection, sort_keys=True, separators=(",", ":")).encode()) == proof["shared_twist_contract"]["selected_projection_sha256"]
    assert shared["target"] == target
    for row in shared["native_ranges"]:
        if row["role"] in proof["shared_twist_native_roles"]:
            address = int(row["virtual_address"], 16)
            at = pe.rva_offset(address - pe.image_base)
            raw = image[at:at + row["byte_count"]]
            assert sha(raw) == row["sha256"]
            instructions = list(decoder.disasm(raw, address))
            assert sum(i.size for i in instructions) == len(raw)
            assert len(instructions) == row["instruction_count"]
            retained(row["assembly"])
    for row in proof["additional_policy_contracts"]:
        if row.get("native_data_role"):
            native = next(value for value in shared["native_data"] if value["role"] == row["native_data_role"])
            address = int(native["virtual_address"], 16)
            at = pe.rva_offset(address - pe.image_base)
            raw = image[at:at + native["byte_count"]]
            assert sha(raw) == native["sha256"]
            assert list(struct.unpack("<" + "I" * (len(raw) // 4), raw)) == native["values_bits"]
        body = re.search(r"pub fn " + re.escape(row["field"]) + r"\([^\n]+\{\n(.*?)\n\}", source, re.S)[1]
        for condition in row["source_conditions"]:
            assert condition in body
        values = re.findall(r"\n\s+([0-9]+(?:\.[0-9]+)?)\n", body)
        if row.get("value_kind") == "u32":
            assert [int(value) for value in values] == row["source_values"]
        else:
            assert [struct.unpack("<I", struct.pack("<f", float(value)))[0] for value in values] == row["source_value_bits"]
    return target


def replay(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    for row in proof["native_ranges"] + proof["native_data"]:
        address = int(row["virtual_address"], 16)
        for page in range(address & ~0xFFF, (address + row["byte_count"] + 0xFFF) & ~0xFFF, 0x1000):
            if page not in mapped:
                machine.mem_map(page, 0x1000)
                mapped.add(page)
        machine.mem_write(address, bytes.fromhex(row["bytes_hex"]))
    machine.mem_map(0x22000000, 0x1000)
    state = {}

    def hook(uc, address, _size, _context):
        if address == state["stop"]:
            state["returned"] = True
            uc.emu_stop()
        else:
            assert state["start"] <= address < state["stop"], hex(address)
            state["steps"] += 1

    machine.hook_add(UC_HOOK_CODE, hook)
    steps = 0
    outcomes = []
    selectors = proof["scalar_selector_fixtures"] + proof["policy_scalar_fixtures"]
    for selector in selectors:
        for rank in range(256):
            machine.mem_write(0x22000000, bytes(0x1000))
            machine.mem_write(0x2200036F, bytes([rank]))
            machine.mem_write(0x220004C8, struct.pack("<f", 1.0))
            for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "R8", "R9", "R12", "R14", "R15"):
                machine.reg_write(getattr(reg, "UC_X86_REG_" + name), 0)
            machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)
            machine.reg_write(reg.UC_X86_REG_RSI, 0x22000000)
            machine.reg_write(reg.UC_X86_REG_RDI, 0x22000000)
            machine.reg_write(reg.UC_X86_REG_RCX, 0x22000000)
            machine.reg_write(reg.UC_X86_REG_R12, rank)
            machine.reg_write(reg.UC_X86_REG_R15, rank)
            machine.reg_write(reg.UC_X86_REG_XMM7, 0x3F800000)
            machine.reg_write(reg.UC_X86_REG_XMM11, 0x3F800000)
            machine.reg_write(reg.UC_X86_REG_XMM12, 0x3F800000)
            for name, value in selector.get("register_inputs", {}).items():
                machine.reg_write(getattr(reg, "UC_X86_REG_" + name), rank if value == "rank" else value)
            state.update(start=int(selector["start"], 16), stop=int(selector["end_exclusive"], 16), steps=0, returned=False)
            if selector.get("returns"):
                machine.reg_write(reg.UC_X86_REG_RSP, 0x22000F00)
                machine.mem_write(0x22000F00, struct.pack("<Q", state["stop"]))
            machine.emu_start(state["start"], state["stop"], count=64)
            assert machine.reg_read(reg.UC_X86_REG_RIP) == state["stop"]
            actual = machine.reg_read(getattr(reg, "UC_X86_REG_" + selector["output_register"])) & 0xFFFFFFFF
            if "threshold" in selector:
                active = rank >= selector["threshold"] if selector["comparison"] == "at_least" else rank != selector["threshold"]
                expected = int.from_bytes(bytes.fromhex(selector["true_bytes" if active else "false_bytes"]), "little")
            else:
                expected = int.from_bytes(bytes.fromhex(selector.get("default_bytes", "0000803f")), "little")
                if 1 <= rank <= 5:
                    row = proof["descriptors"][rank - 1]
                    expected = int.from_bytes(bytes.fromhex(row[selector["field"] + "_bytes"]), "little")
            assert actual == expected, (selector["field"], rank, hex(actual), hex(expected))
            outcomes.append((selector["field"], rank, actual))
            steps += state["steps"]
    return {"scalar_selector_cases": len(outcomes), "original_instruction_steps": steps,
            "outcomes_sha256": sha(json.dumps(outcomes).encode())}


def replay_parser(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    row = next(row for row in proof["native_ranges"] if row["role"] == "pick-rank-parser")
    start = int(row["virtual_address"], 16)
    end = start + row["byte_count"]
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(0x145ABF000, 0x2000)
    machine.mem_map(0x22000000, 0x10000)
    machine.mem_map(0x23000000, 0x10000)
    machine.mem_write(start, bytes.fromhex(row["bytes_hex"]))
    state = {}
    stop = 0x2300FFF0

    def hook(uc, address, _size, _context):
        if address == stop:
            state["returned"] = True
            uc.emu_stop()
        else:
            assert start <= address < end, hex(address)
            state["steps"] += 1

    machine.hook_add(UC_HOOK_CODE, hook)
    inputs = {b"", b"+", b"-", b"-0", b"-1", b"++1", b" 1", b"1 ", b"1\n", b"1\x00",
              b"100,100,100,100", b"1.0", b"0x5", b"1_0", "５".encode(), "é".encode(),
              b"0" * 1024, b"0" * 1024 + b"255", b"9" * 1024}
    for value in range(1025):
        decimal = str(value).encode()
        inputs.update((decimal, b"+" + decimal, b"000" + decimal, b"+000" + decimal))
    for value in range(256):
        inputs.update((bytes([value]), b"+" + bytes([value])))
    outcomes = []
    steps = 0
    for value in sorted(inputs):
        machine.mem_write(0x22000000, value + b"\x00")
        for name in ("RAX", "RCX", "RDX", "R8", "R9", "R10", "R11"):
            machine.reg_write(getattr(reg, "UC_X86_REG_" + name), 0)
        machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)
        machine.reg_write(reg.UC_X86_REG_RCX, 0x22000000)
        machine.reg_write(reg.UC_X86_REG_RDX, len(value))
        machine.reg_write(reg.UC_X86_REG_RSP, 0x2300F008)
        machine.mem_write(0x2300F008, struct.pack("<Q", stop))
        state.update(returned=False, steps=0)
        try:
            machine.emu_start(start, stop, count=100000)
        except Exception as error:
            raise AssertionError((value, hex(machine.reg_read(reg.UC_X86_REG_RIP)),
                                  hex(machine.reg_read(reg.UC_X86_REG_RSP)), state)) from error
        assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
        # An independent whole-number oracle specifies the observed domain;
        # it does not copy the native fast/two-digit/overflow instruction paths.
        digits = value[1:] if value.startswith(b"+") else value
        expected = 0
        if digits and all(48 <= byte <= 57 for byte in digits):
            number = int(digits)
            if number <= 255:
                expected = min(number, 5)
        actual = machine.reg_read(reg.UC_X86_REG_RAX)
        assert actual == expected, (value, actual, expected)
        outcomes.append((value.hex(), actual))
        steps += state["steps"]
    return {"pick_rank_parser_cases": len(outcomes), "parser_original_instruction_steps": steps,
            "parser_outcomes_sha256": sha(json.dumps(outcomes).encode())}


def replay_calendar(proof):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    rows = {row["role"]: row for row in proof["native_ranges"] + proof["native_data"]}
    mapped = set()
    for role in ("zone-ordinal-helper", "week-helper", "zone-length-dispatch"):
        row = rows[role]
        address = int(row["virtual_address"], 16)
        for page in range(address & ~0xFFF, (address + row["byte_count"] + 0xFFF) & ~0xFFF, 0x1000):
            if page not in mapped:
                machine.mem_map(page, 0x1000)
                mapped.add(page)
        machine.mem_write(address, bytes.fromhex(row["bytes_hex"]))
    for address, size in ((0x145F99000, 0x1000), (0x22000000, 0x10000), (0x23000000, 0x10000)):
        machine.mem_map(address, size)
    for address in (0x145F994E0, 0x145F99490):
        machine.mem_write(address, b"\xc3")
    stop, state = 0x2300FFF0, {}

    def hook(uc, address, _size, _context):
        state["steps"] += 1
        if address == 0x145F994E0:
            uc.reg_write(reg.UC_X86_REG_RAX, 0x12345678)
            uc.reg_write(reg.UC_X86_REG_RDX, 0x9ABCDEF0)
        elif address == 0x145F99490:
            output = uc.reg_read(reg.UC_X86_REG_RCX)
            now = uc.reg_read(reg.UC_X86_REG_RDX)
            assert struct.unpack("<II", uc.mem_read(now, 8)) == (0x12345678, 0x9ABCDEF0)
            assert uc.reg_read(reg.UC_X86_REG_R8) == 0xD53E8000
            assert uc.reg_read(reg.UC_X86_REG_R9) == 0x019DB1DE
            uc.mem_write(output, struct.pack("<QQ", int(state["error"]), state["seconds"]))
        else:
            row = rows[state["role"]]
            start = int(row["virtual_address"], 16)
            assert start <= address < start + row["byte_count"], hex(address)

    machine.hook_add(UC_HOOK_CODE, hook)

    def run(role, arguments):
        for name in ("RAX", "RCX", "RDX", "R8", "R9", "R10", "R11"):
            machine.reg_write(getattr(reg, "UC_X86_REG_" + name), 0)
        machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)
        machine.reg_write(reg.UC_X86_REG_RSP, 0x2300F008)
        machine.mem_write(0x2300F008, struct.pack("<Q", stop))
        for name, value in arguments.items():
            machine.reg_write(getattr(reg, "UC_X86_REG_" + name), value)
        state.update(role=role, steps=0)
        machine.emu_start(int(rows[role]["virtual_address"], 16), stop, count=256)
        assert machine.reg_read(reg.UC_X86_REG_RIP) == stop
        return machine.reg_read(reg.UC_X86_REG_RAX)

    zone_values = {"elwynn": 0, **proof["calendar_contract"]["explicit_zone_ordinals"]}
    inputs = {"", "unknown", "ELWYNN", "Duskwood", "wsg\x00", "azs", "é", "naxxramas"}
    for value in zone_values:
        inputs.update((value, value.upper(), " " + value, value + " ", value + "x"))
    zones = []
    steps = 0
    for value in sorted(inputs):
        raw = value.encode()
        machine.mem_write(0x22000000, raw + b"\x00" * 16)
        actual = run("zone-ordinal-helper", {"RCX": 0x22000000, "RDX": len(raw)})
        assert actual == zone_values.get(value, 0), (value, actual)
        zones.append((value, actual))
        steps += state["steps"]
    seconds = (0, 1, 604799, 604800, 604801, 1209599, 1209600,
               (2**32 - 1) * 604800, 2**32 * 604800 - 1,
               2**32 * 604800, (2**32 + 1) * 604800, 2**64 - 1)
    weeks = []
    for error in (False, True):
        for value in seconds:
            state.update(error=error, seconds=value)
            actual = run("week-helper", {})
            expected = 0 if error else value // 604800 & 0xFFFFFFFF
            assert actual == expected, (error, value, actual, expected)
            weeks.append((error, str(value), actual))
            steps += state["steps"]
    return {"calendar_zone_cases": len(zones), "calendar_week_cases": len(weeks),
            "calendar_original_instruction_steps": steps,
            "calendar_outcomes_sha256": sha(json.dumps((zones, weeks)).encode())}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="Write the compact checked result beside the manifest")
    args = parser.parse_args()
    proof = json.loads(MANIFEST.read_text())
    target = verify(proof)
    result = {"target": target, "manifest_sha256": sha(MANIFEST.read_bytes()),
              "checker_sha256": sha(__file_bytes()), **replay(proof), **replay_parser(proof), **replay_calendar(proof),
              "source_data_checked": True, "source_executed": False, "application_executed": False,
              "compilation": "not_run", "parity_verified": False}
    if args.write:
        (MANIFEST.parent / "heroic-source-static.json").write_text(portable_json(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


def __file_bytes():
    from pathlib import Path
    return Path(__file__).read_bytes()


if __name__ == "__main__":
    main()
