#!/usr/bin/env python3
"""Recover/check the selected native HUD scale Update registration, without execution.

--prepare stages one raw Ghidra registration-owner plan. --collect curates its
result and exact assembly/literals under runtime/. --check verifies canonical
evidence against the original PE. No application or compiler is invoked.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/findings/fixgap7-layout/9e57035e83b9/scale-schedule"
RETAINED = ROOT / "docs/analysis/evidence/run-hud"
RANGES = {
    "scale-schedule-registration": (0x140159200, 0x140159391),
    "scale-schedule-configs": (0x14006CDD0, 0x14006D29D),
    "scale-schedule-runner": (0x1400591F0, 0x140059296),
    "scale-schedule-local-init": (0x140059170, 0x1400591E9),
    "scale-schedule-plugin-call": (0x140041AC2, 0x140041ACA),
    "scale-schedule-label": (0x140003C7E, 0x140003C9B),
    "scale-schedule-label-name": (0x140102CA0, 0x140102CB5),
    "scale-schedule-empty-conditions": (0x144E09129, 0x144E09194),
}
LITERALS = {
    "scale-system-vtable": (0x145D72E98, 168),
    "update-label-vtable": (0x145DA8640, 88),
    "update-label-name": (0x145DA72D9, 6),
}


def sha(data):
    return _shared_digest(data)


def write(path, value):
    path.write_text(portable_json(value, indent=2) + "\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("prepare", "collect", "check"):
        parser.add_argument("--" + name, action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert sha(data) == SHA
    module = load_script("scale_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    WORK.mkdir(parents=True, exist_ok=True)

    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        return data[at:at + count]

    def span(address, end):
        return dict(address=hex(address), end_exclusive=hex(end), byte_count=end-address,
                    file_offset=hex(pe.rva_offset(address-pe.image_base)), sha256=sha(raw(address, end-address)))

    # Independently check the two typed links and the direct runner call.
    assert struct.unpack("<Q", raw(0x145DA8640 + 24, 8))[0] == 0x140102CA0
    assert raw(0x145DA72D9, 6) == b"Update"
    assert struct.unpack("<Q", raw(0x145D72E98 + 72, 8))[0] == 0x1400591F0
    assert raw(0x140059231, 1) == b"\xe8"
    assert 0x140059236 + struct.unpack("<i", raw(0x140059232, 4))[0] == 0x14003DB10
    if args.prepare:
        a, b = RANGES["scale-schedule-registration"]
        binary = WORK / "registration.bin"
        binary.write_bytes(raw(a, b-a))
        write(WORK / "plan.json", dict(target=str(binary.relative_to(ROOT)),
              output=str((WORK / "rea-registration").relative_to(ROOT)), init_timeout=60, timeout=240,
              open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(a)),
              operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(a)))]))
    if args.collect:
        out = WORK / "curated"
        out.mkdir(exist_ok=True)
        rows = []
        for role, (a, b) in RANGES.items():
            row = dict(role=role, **span(a, b), assembly=role + ".asm")
            assembly = objdump_output(["objdump", "-d", "--no-show-raw-insn",
                "--start-address="+hex(a), "--stop-address="+hex(b), str(TARGET)], text=True, cwd=ROOT)
            assembly = assembly.replace(str(TARGET), str(TARGET.relative_to(ROOT)))
            (out / row["assembly"]).write_text(assembly)
            row["assembly_sha256"] = sha(assembly.encode())
            if role == "scale-schedule-registration":
                response = json.loads((WORK / "rea-registration/003-procedure_pseudo_code.json").read_text())["response"]["result"]
                result = response.get("structuredContent") or json.loads(response["content"][0]["text"])
                assert result["provider"]["id"] == "ghidra"
                assert result["subject"]["digest"]["sha256"] == row["sha256"]
                value = result["normalized_result"]
                code = value if isinstance(value, str) else value["pseudocode"]
                code = "\n".join(line.rstrip() for line in code.splitlines()).strip() + "\n"
                row.update(pseudocode=role+".ghidra.c", pseudocode_sha256=sha(code.encode()),
                           rea_evidence_id=result["evidence_id"])
                (out / row["pseudocode"]).write_text(code)
            rows.append(row)
        literals = [dict(role=role, **span(a, a+n), hex=raw(a, n).hex())
                    for role, (a, n) in LITERALS.items()]
        write(out / "scale-schedule-manifest.json", dict(target_sha256=SHA, ranges=rows, literals=literals,
            contract=dict(schedule="Update", run_condition=None, zero_based_system_config_index=3,
                local_bool="Initialized false by 140059170; 14003db10 sets true at entry and the previous false value triggers CVar registration.",
                subsequent_runs="Read hudScale each Update, apply recovered finite/clamp parsing, write UiScale only if unequal.",
                native_owner_evidence="controls-manifest.json#scale"),
            limits=["Static PE assembly and raw Ghidra import; Windows ABI corroborated in call sites.",
                    "No compiler, application, scheduler or renderer runs; no runtime parity claim."]))
    if args.check:
        manifest = json.loads((RETAINED / "scale-schedule-manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        for row in manifest["ranges"] + manifest["literals"]:
            expected = span(int(row["address"], 16), int(row["end_exclusive"], 16))
            assert all(row[key] == value for key, value in expected.items())
            for kind in ("assembly", "pseudocode"):
                if kind in row:
                    assert sha((RETAINED / row[kind]).read_bytes()) == row[kind+"_sha256"]
            if "hex" in row:
                assert raw(int(row["address"], 16), row["byte_count"]).hex() == row["hex"]
        print("Verified HUD scale Update registration, empty run conditions and Local<bool> lifecycle")


if __name__ == "__main__":
    main()
