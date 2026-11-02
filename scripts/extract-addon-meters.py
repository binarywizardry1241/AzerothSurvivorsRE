#!/usr/bin/env python3
"""Stage/check the selected target's addon meter projection; never execute it."""
from portable_paths import objdump_output, portable_json
from native_recovery import digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
RUNTIME = ROOT / "runtime/addon-bridge-0.105.0/meters"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/addon-bridge/meters"
OWNERS = {
    "serialize-meter": (0x1458BFF90, 0x1458C01AA),
    "serialize-taken": (0x1458EC300, 0x1458EC544),
    "meter-row": (0x1459B8D60, 0x1459B8F76),
    "taken-row": (0x1459B98D0, 0x1459B9A83),
    "sanitize-field": (0x1459B9B70, 0x1459B9DBC),
    "sort-meter-rows": (0x145981C90, 0x145981D54),
    "sort-taken-rows": (0x145981F70, 0x14598202A),
}
LITERALS = {
    "meter-format": (0x1471B67B0, 30),
    "taken-format": (0x1471B5B48, 9),
    "separator": (0x146BBE500, 1),
    "duration-floor": (0x145D6D36C, 4),
    "sum-initial": (0x145DAC578, 8),
    "proc-byte-formatter-prefix": (0x145BAA8B0, 26),
    "area": (0x146E79247, 4),
    "boss-spell": (0x146E7924B, 10),
    "boss-melee": (0x146E79255, 10),
    "mob-spell": (0x146E7925F, 9),
    "mob-melee": (0x146E79268, 9),
    "elite": (0x146E78B09, 5),
}


def digest(raw):
    return _shared_digest(raw)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert digest(data) == SHA, "Selected target digest mismatch"
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    extents = {(start + pe.image_base, end + pe.image_base) for start, end, _ in pe.functions()}
    output = RETAINED if args.check else RUNTIME / "curated"
    if not args.check:
        output.mkdir(parents=True, exist_ok=True)
    previous = json.loads((RETAINED / "manifest.json").read_text()) if args.check else None
    owners = []
    for role, (start, end) in OWNERS.items():
        assert (start, end) in extents, (role, "not an exact exception-table extent")
        at = pe.rva_offset(start - pe.image_base)
        raw = data[at:at + end - start]
        row = dict(role=role, address=hex(start), end_exclusive=hex(end),
                   file_offset=hex(at), byte_count=len(raw), sha256=digest(raw),
                   assembly=role + ".asm")
        if args.check:
            stored = next(item for item in previous["owners"] if item["role"] == role)
            assert all(stored[key] == value for key, value in row.items())
            assert digest((output / row["assembly"]).read_bytes()) == stored["assembly_sha256"]
            if "pseudocode" in stored:
                assert digest((output / stored["pseudocode"]).read_bytes()) == stored["pseudocode_sha256"]
        else:
            text = objdump_output([
                "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
                f"--stop-address={end:#x}", str(TARGET)], text=True)
            text = text.replace(str(TARGET), TARGET.name)
            (output / row["assembly"]).write_text(text)
            row["assembly_sha256"] = digest(text.encode())
            evidence = {
                "serialize-meter": RUNTIME / "rea-serialize-meter/003-procedure_pseudo_code.json",
                "meter-row": RUNTIME / "rea-nested/003-procedure_pseudo_code.json",
            }.get(role)
            if evidence and evidence.is_file():
                native = json.loads(evidence.read_text())["response"]["result"]["structuredContent"]
                assert native["provider"]["id"] == "ghidra"
                if role == "serialize-meter":
                    assert native["subject"]["digest"]["sha256"] == row["sha256"]
                else:
                    assert digest((RUNTIME / "nested.bin").read_bytes()) == native["subject"]["digest"]["sha256"]
                pseudo = "\n".join(line.rstrip() for line in native["normalized_result"].splitlines()).strip() + "\n"
                row.update(rea_evidence_id=native["evidence_id"],
                           rea_input_sha256=native["subject"]["digest"]["sha256"],
                           analysis_profile_digest=native["analysis_profile"]["digest"],
                           provider=native["provider"], pseudocode=role + ".ghidra.c",
                           pseudocode_sha256=digest(pseudo.encode()))
                (output / row["pseudocode"]).write_text(pseudo)
        owners.append(row)
    literals = []
    for role, (address, size) in LITERALS.items():
        at = pe.rva_offset(address - pe.image_base)
        raw = data[at:at + size]
        literals.append(dict(role=role, address=hex(address), file_offset=hex(at),
                             byte_count=size, sha256=digest(raw), hex=raw.hex()))
    round_iat = 0x145D6A368
    library = next(item for item in pe.imports() if
                   int(item["iat_start_address"], 16) <= round_iat <
                   int(item["iat_start_address"], 16) + len(item["functions"]) * 8)
    round_import = dict(iat=hex(round_iat), library=library["library"],
                        name=library["functions"][(round_iat - int(library["iat_start_address"], 16)) // 8])
    assert round_import["name"] == "round"
    if args.check:
        assert previous["target_sha256"] == SHA and previous["literals"] == literals
        assert previous["round_import"] == round_import
    else:
        manifest = dict(target_sha256=SHA, owners=owners, literals=literals,
                        round_import=round_import, limits=[
            "Static REA/Ghidra and original Win64 assembly; no game or reconstructed application executed.",
            "Raw Ghidra import uses the generic GCC ABI; original assembly controls argument bindings and unmapped literals.",
            "Native incoming accounting is owned by1458f3330; its canonical extract remains with the terminal-totals evidence.",
            "The retained source tests were not compiled or executed; native/rebuilt runtime and visual parity remain unverified.",
        ])
        (output / "manifest.json").write_text(portable_json(manifest, indent=2) + "\n")
    print("Verified selected EXE and seven addon meter owners plus format/category literals; static only")


if __name__ == "__main__":
    main()
