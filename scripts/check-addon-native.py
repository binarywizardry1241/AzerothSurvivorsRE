#!/usr/bin/env python3
"""Verify selected 0.105.0 addon native evidence without compiling or running it.

Checks the selected EXE's full identity, retained instruction/data ranges,
embedded formatting contracts, character/zone lookup records and exact Lua
parser excerpt. These are evidence-integrity checks, not execution or parity.
"""
from native_recovery import digest as _shared_digest
from script_sources import load_script

import hashlib
import json
from pathlib import Path
import re
import struct


ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
EVIDENCE = ROOT / "docs/analysis/evidence/0.105.0/addon-bridge"
SHA256 = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"


def digest(raw):
    return _shared_digest(raw)


def load_pe(raw):
    module = load_script("addon_evidence_pe", ROOT / "scripts/inventory-executable.py")
    return module.PE(raw)


def checked_path(name):
    path = (EVIDENCE / name).resolve()
    assert path.is_relative_to(ROOT), f"Evidence path escapes project: {name}"
    return path


def main():
    data = TARGET.read_bytes()
    assert digest(data) == SHA256, "Selected 0.105.0 EXE SHA-256 mismatch"
    pe = load_pe(data)
    manifest = json.loads((EVIDENCE / "native-manifest.json").read_text())
    assert manifest["target_sha256"] == SHA256

    def address_bytes(address, count):
        value = int(address, 16) if isinstance(address, str) else address
        offset = pe.rva_offset(value - pe.image_base)
        raw = data[offset:offset + count]
        assert len(raw) == count, f"Truncated native range {value:#x}"
        return offset, raw

    def read_string_pair(address):
        _, raw = address_bytes(address, 16)
        pointer, length = struct.unpack("<QQ", raw)
        assert length < 10000, f"Unbounded string pair {address:#x}"
        return address_bytes(pointer, length)[1].decode("utf-8")

    def verify_range(row):
        offset, raw = address_bytes(row["address"], row["byte_count"])
        assert offset == int(row["file_offset"], 16)
        assert digest(raw) == row["sha256"], row.get("role", row["address"])
        if "hex" in row:
            assert raw.hex() == row["hex"]
        return raw

    extents = {(a + pe.image_base, b + pe.image_base) for a, b, _ in pe.functions()}
    for row in manifest["native_observations"]:
        verify_range(row)
        start, end = int(row["address"], 16), int(row["end"], 16)
        assert end - start == row["byte_count"]
        if "parent_function" in row:
            parent = int(row["parent_function"], 16)
            assert any(a == parent and a <= start < end <= b for a, b in extents)
        else:
            assert (start, end) in extents, f"Not an exact PE function: {row['role']}"
        for kind in ("assembly", "pseudocode"):
            if kind in row:
                assert digest(checked_path(row[kind]).read_bytes()) == row[kind + "_sha256"]

    def precision_at(raw, at, *, literal_allowed=False):
        code = raw[at]
        if literal_allowed and code not in (0xC0, 0xC1, 0xC5):
            # For example the fixed `kind=dead` prefix. The complete literal
            # bytes are independently checked by verify_range above.
            return None
        assert code in (0xC0, 0xC1, 0xC5), f"Unexpected format opcode {code:#x}"
        return raw[at + 5] if code == 0xC5 else (0 if code == 0xC1 else None)

    for row in manifest["format_bytes"]:
        raw = verify_range(row)
        fields = [
            {"name": match[1].decode(),
             "precision": precision_at(raw, match.end(), literal_allowed=True)}
            for match in re.finditer(rb"([a-z]+)=", raw)
        ]
        assert fields == row["fields"], row["role"]

    spell_row = manifest["spell_row"]
    raw = verify_range(spell_row["format"])
    precisions = [precision_at(raw, m.start()) for m in re.finditer(rb"[\xc0\xc1\xc5]", raw)]
    assert precisions == spell_row["precision"]

    zones = manifest["zone_map_records"]
    for index, row in enumerate(zones["records"]):
        address = int(zones["address"], 16) + index * zones["stride"]
        assert row["index"] == index and int(row["address"], 16) == address
        _, raw = address_bytes(address, zones["stride"])
        assert digest(raw) == row["sha256"]
        for field, offset in (("key", 8), ("name", 24), ("subtitle", 40)):
            assert read_string_pair(address + offset) == row[field]
        map_id, area_id, x, y = struct.unpack_from("<IIff", raw, 0xC0)
        assert (map_id, area_id, [x, y]) == (row["map_id"], row["area_id"], row["center"])
        assert struct.unpack_from("<f", raw, 0xE0)[0] == row["difficulty_f32"]
        boss_address = struct.unpack_from("<Q", raw, 0x88)[0]
        assert boss_address == int(row["bosses_address"], 16)
        assert len(row["bosses"]) == 5
        for boss_index, boss in enumerate(row["bosses"]):
            entry = boss_address + boss_index * 0x58
            _, boss_raw = address_bytes(entry, 0x58)
            assert boss["index"] == boss_index and int(boss["address"], 16) == entry
            assert digest(boss_raw) == boss["sha256"]
            assert read_string_pair(entry) == boss["name"]
            assert struct.unpack_from("<f", boss_raw, 0x40)[0] == boss["at_minutes_f32"]
            assert boss_raw[0x54] == int(boss["final"])
    assert len(zones["records"]) == zones["count"] == 12

    identities = manifest["identity_records"]
    for row in identities["classes"]:
        number = row["id"]
        pointer = struct.unpack("<Q", address_bytes(0x146E7B190 + (number - 2) * 8, 8)[1])[0] \
            if 2 <= number <= 11 else 0x146BAB7A8
        assert pointer == int(row["address"], 16)
        assert read_string_pair(pointer + 0x10) == row["key"]
        assert read_string_pair(pointer + 0x20) == row["display_name"]
    for row in identities["races"]:
        number = row["id"]
        pointer = struct.unpack("<Q", address_bytes(0x146E7B120 + (number - 2) * 8, 8)[1])[0] \
            if 2 <= number <= 8 else 0x146BAA610
        assert pointer == int(row["address"], 16)
        assert read_string_pair(pointer) == row["key"]
        assert read_string_pair(pointer + 0x10) == row["client_race_token"]

    gear = manifest["legacy_gear_effects"]
    raw = verify_range(gear)
    address = int(gear["address"], 16)
    for index, row in enumerate(gear["mapping"]):
        assert row["tag"] == index
        assert address + struct.unpack_from("<i", raw, index * 4)[0] == int(row["target"], 16)

    imports = {
        int(library["iat_start_address"], 16) + index * 8: (library["library"], name)
        for library in pe.imports()
        for index, name in enumerate(library["functions"])
    }
    for row in manifest["math_imports"]:
        address = int(row["thunk"], 16)
        _, raw = address_bytes(address, 6)
        assert raw[:2] == b"\xff\x25"
        assert digest(raw) == row["thunk_bytes_sha256"]
        iat = address + 6 + struct.unpack_from("<i", raw, 2)[0]
        assert iat == int(row["iat"], 16)
        assert imports[iat] == (row["library"], row["name"])
    publication = manifest["publication"]
    assert struct.unpack("<d", address_bytes(publication["interval_address"], 8)[1])[0] == .2

    parser = json.loads((EVIDENCE / "native-stats-parser.json").read_text())
    assert parser["target_sha256"] == SHA256
    offset, raw = address_bytes(parser["virtual_address"], parser["byte_count"])
    assert offset == int(parser["file_offset"], 16) and digest(raw) == parser["sha256"]
    assert checked_path(parser["path"]).read_bytes() == raw + b"\n"
    print(
        "Verified selected 0.105.0 EXE SHA-256, "
        f"{len(manifest['native_observations'])} native ranges, exact format bytes/precisions, "
        "12 zone/boss schedules, class/race lookups, math imports and Lua parser; "
        "no compilation or target execution."
    )


if __name__ == "__main__":
    main()
