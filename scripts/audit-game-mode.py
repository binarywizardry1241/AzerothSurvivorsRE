#!/usr/bin/env python3
"""Reproduce selected game-mode audit data from the hash-bound 0.105.0 EXE.

Static reads only. Generated data and optional REA input slices stay in runtime/.
This is not a complete talent decoder, gameplay implementation or parity test.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/native-recovery/game-mode-audit/45b065b87af5"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/game-mode-audit"
NATIVE = {
    "demon-targeting": (0x14594CDC0, 0x14594E0E4),
    "demon-attack-timing": (0x14594E0F0, 0x14594E482),
    "demon-projectile": (0x14594ED10, 0x14594F14A),
    "demon-crit": (0x145950E90, 0x14595143D),
    "lair-telemetry": (0x1459B1B70, 0x1459B208F),
    "meter-update": (0x140172AE0, 0x140173CC1),
    "controller-poll": (0x140092AB0, 0x140093741),
}


def write(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n")


def recover(data, pe):
    def offset(address):
        return pe.rva_offset(address - pe.image_base)

    def span(address, size):
        at = offset(address)
        raw = data[at:at + size]
        assert len(raw) == size
        return dict(virtual_address=hex(address), file_offset=hex(at),
                    byte_count=size, sha256=hashlib.sha256(raw).hexdigest())

    def pair(address):
        return struct.unpack_from("<QQ", data, offset(address))

    def string(address):
        pointer, length = pair(address)
        assert 0 < length < 10000
        at = offset(pointer)
        return data[at:at + length].decode()

    # Revalidated current descriptors: the older 104-byte talent layout must
    # not be used here. Decode selected fields of current 120-byte records;
    # optional/prerequisite fields after byte 87 are deliberately not decoded.
    selected = [(0x146E66668, "shadow_dance"), (0x146E68C48, "shadow_weaving")]
    selected += [(0x146E70688 + i * 120, key) for i, key in enumerate([
        "demonic_familiar", "demonic_embrace", "fel_stamina", "unholy_power",
        "soul_devourer", "soul_link", "felfire_training", "master_demonologist",
        "legion_gate", "demonic_supremacy", "summon_infernal", "summon_doomguard",
        "pact_of_the_annihilan", "butcher",
    ])]
    selected += [(0x146E71698, "aftermath")]
    records = []
    for address, expected_key in selected:
        key, name, icon, description = [string(address + n) for n in (0, 16, 32, 64)]
        assert key == expected_key
        effects, count = pair(address + 48)
        assert 1 <= count <= 6
        tail = list(data[offset(address + 80):offset(address + 88)])
        assert tail[0] <= 6 and tail[1] <= 3 and tail[2] in (1, 2, 3, 5)
        payloads = [data[offset(effects + i * 64):offset(effects + i * 64) + 64]
                    for i in range(count)]
        records.append(dict(key=key, name=name, icon=icon, description=description,
                            row=tail[0], column=tail[1], max_rank=tail[2],
                            record_prefix=span(address, 88),
                            effects_range=span(effects, count * 64),
                            effects=[dict(discriminant=b[0], payload=b.hex()) for b in payloads]))
    assert records[0]["effects"][0]["discriminant"] == 28
    assert struct.unpack_from("<f", bytes.fromhex(records[1]["effects"][0]["payload"]), 4)[0] == struct.unpack("<f", struct.pack("<f", .005))[0]

    start_marker = b"-- Azeroth Survivors: the run for addons, off the server's addon lines."
    end_marker = b'AZSApiFrame:SetScript("OnEvent", AZS_ApiOnEvent);\n'
    assert data.count(start_marker) == data.count(end_marker) == 1
    start = data.index(start_marker)
    end = data.index(end_marker, start) + len(end_marker)
    lua = data[start:end]
    # Embedded templates/source are a shipped contract, not evidence of live
    # server publication, Lua execution, input dispatch or native UI parity.
    api = dict(**span(pe.offset_va(start), len(lua)),
               message_prefixes=re.findall(r'arg1 == "([A-Z]+)"', lua.decode()),
               functions=re.findall(r'^function (AZS_\w+)\(', lua.decode(), re.M))
    mode_text = b"Damage DoneHealing DoneBoss Damage"
    mode_at = data.index(mode_text)
    proc_text = b";proc="
    proc_at = data.index(proc_text)
    literals = [dict(role="meter mode labels", **span(pe.offset_va(mode_at), len(mode_text)),
                     text=mode_text.decode()),
                dict(role="current run-format proc fields", **span(pe.offset_va(proc_at), 20),
                     hex=data[proc_at:proc_at + 20].hex())]
    extents = {(a + pe.image_base, b + pe.image_base) for a, b, _ in pe.functions()}
    native = []
    for role, (a, b) in NATIVE.items():
        assert (a, b) in extents, (role, "not an exact PE exception extent")
        native.append(dict(role=role, end_exclusive=hex(b), **span(a, b - a)))
    # This instruction subrange belongs to the cast function; it is not a
    # standalone function. It counts matching keys, tests >39, removes the
    # first match, calls two cleanup paths, then creates the new totem.
    native.append(dict(role="totem-kind-cap-branch", end_exclusive="0x145921cb5",
                       parent_function="0x14591f620", **span(0x145921B3E, 0x177)))
    return dict(target_sha256=SHA, selected_talents=records, addon_api=api,
                literals=literals, native_ranges=native,
                limits=["Static selected records and exact byte ranges; no application execution.",
                        "Current effect payloads are retained, not fully decoded or mapped to older enum meanings.",
                        "Diagnostic paths, labels and embedded API code do not alone prove runtime behavior.",
                        "Native slice decompilation omits external data/ABI and can miss jump-table arms."]), lua


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="compare selected data with reviewed evidence")
    parser.add_argument("--prepare-native", action="store_true", help="stage one REA plan per exact native function")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected EXE SHA-256 mismatch"
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    result, lua = recover(data, pe)
    if args.check:
        assert json.loads((RETAINED / "selected-data.json").read_text()) == result
        assert (RETAINED / "addon-api.lua").read_bytes() == lua
        manifest = json.loads((RETAINED / "native-manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        for row in manifest["native_observations"]:
            at, size = int(row["file_offset"], 16), row["byte_count"]
            assert pe.offset_va(at) == int(row["virtual_address"], 16)
            assert hashlib.sha256(data[at:at + size]).hexdigest() == row["sha256"]
            if "pseudocode" in row:
                assert hashlib.sha256((RETAINED / row["pseudocode"]).read_bytes()).hexdigest() == row["pseudocode_sha256"]
            if "assembly" in row:
                assert (RETAINED / row["assembly"]).is_file()
    else:
        WORK.mkdir(parents=True, exist_ok=True)
        write(WORK / "selected-data.json", result)
        (WORK / "addon-api.lua").write_bytes(lua)
    if args.prepare_native:
        WORK.mkdir(parents=True, exist_ok=True)
        for row in result["native_ranges"]:
            if row["role"] not in NATIVE:
                continue
            name, a = row["role"], int(row["virtual_address"], 16)
            at = int(row["file_offset"], 16)
            path = WORK / (name + ".bin")
            path.write_bytes(data[at:at + row["byte_count"]])
            write(WORK / (name + "-audit-plan.json"), dict(
                target=str(path.relative_to(ROOT)),
                output=str((WORK / ("rea-audit-" + name)).relative_to(ROOT)),
                init_timeout=60, timeout=240,
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(a)),
                operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(a)))]))
    print("Verified 0.105.0 hash, 17 selected talent records, exact addon source, meter/proc literals and 8 native ranges; game not executed")


if __name__ == "__main__":
    main()
