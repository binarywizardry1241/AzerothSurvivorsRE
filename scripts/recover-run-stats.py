#!/usr/bin/env python3
"""Extract/check the exact selected-target character-pane Lua; static only."""
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
START = 0x146BAFFD0
RETAINED = ROOT / "docs/analysis/evidence/run-stats"


def check_current():
    from coverage_common import latest_target, target_bytes

    target = latest_target(verify=True)
    assert target["version"] == "0.141.0"
    assert target["sha256"] == "6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa"
    data = target_bytes(target)
    pe = load_script("pe", ROOT / "scripts/inventory-executable.py").PE(data)

    def read(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + size]

    script_path = ROOT / "docs/analysis/evidence/addon-api/paperdoll-run-stats.lua"
    script = read(0x1476F0A63, 9167)
    assert script_path.read_bytes() == script
    assert read(0x1476F3ACB, 37) == rb"Interface\FrameXML\PaperDollFrame.lua"
    assert read(0x145DDBB58, 6) == bytes.fromhex("41 b8 cf 23 00 00")
    label_table = read(0x1476F3608, 76 * 16)
    assert hashlib.sha256(label_table).hexdigest() == "1c9b4bf0cbbebe062add1a2899bf1ce5fa3dca49f7f518ee94d53985e2aac384"
    native_labels = [read(pointer, length).decode()
                     for pointer, length in struct.iter_unpack("<QQ", label_table)]

    src = ROOT / "crates/azeroth-survivors-re/src/gameplay"
    run_stats = (src / "client/run_stats.rs").read_text()
    bootstrap = (src / "client/addon_bootstrap.rs").read_text()
    client = (src / "client.rs").read_text()
    extras = run_stats.split("const EXTRA_LABELS:", 1)[1].split("];", 1)[0]
    source_labels = json.loads((RETAINED / "manifest.json").read_text())["labels"]
    source_labels += re.findall(r'"([^"\n]+)"', extras)
    assert len(set(native_labels)) == len(native_labels) == len(source_labels) == 76
    assert set(native_labels) == set(source_labels)
    assert script_path.name in run_stats and r"Interface\FrameXML\PaperDollFrame.lua" in run_stats
    assert "extension.framexml_appends.push((PATH.into(), payload))" in run_stats
    assert "run_stats::configure(&mut extension, locale)" in client
    assert "run_stats::configure(&mut extension, &locale)" in client
    assert "script_postlude" not in client and "script_postlude" not in bootstrap

    locales = set()
    for code_ptr, code_len, _, _, json_ptr, json_len, _ in struct.iter_unpack(
            "<7Q", read(0x147AE1870, 14 * 0x38)):
        code = read(code_ptr, code_len).decode()
        native = json.loads(read(json_ptr, json_len))
        rebuilt = json.loads((ROOT / f"crates/azeroth-survivors-re/assets/locales/{code}.json").read_text())
        assert all(rebuilt[label] == native[label] for label in native_labels), code
        locales.add(code)
    assert len(locales) == 14
    print("Verified 0.141.0 PaperDoll Lua, 76 labels, 14 locales and named core append; static only")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--check", action="store_true")
    mode.add_argument("--check-current", action="store_true")
    args = parser.parse_args()
    if args.check_current:
        check_current()
        return
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected target changed"
    pe_module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = pe_module.PE(data)
    at = pe.rva_offset(START - pe.image_base)
    end = data.index(b"\nend\nWorn gear: ", at) + 5
    source = data[at:end]
    assert source.startswith(b"\n\n-- Azeroth Survivors:") and source.endswith(b"\nend\n")
    text = source.decode()
    english = json.loads((ROOT / "crates/azeroth-survivors-re/assets/locales/en.json").read_text())
    labels = sorted({value for value in re.findall(r'"([^"\\\n]*)"', text) if value in english})
    fields = sorted(set(re.findall(r"\bs\.([a-z]+)\b", text)))
    feed = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/addon_scalars.rs").read_text()
    assert set(fields) <= set(re.findall(r"([a-z]+)=\{", feed)), "Panel field lacks a live producer"
    catalogs = []
    for match in re.finditer(rb'\{\r?\n  "game\.title":', data):
        pointer = pe.offset_va(match.start()).to_bytes(8, "little")
        descriptor = data.index(pointer)
        size = int.from_bytes(data[descriptor + 8:descriptor + 16], "little")
        code_pointer = int.from_bytes(data[descriptor - 32:descriptor - 24], "little")
        code_at = pe.rva_offset(code_pointer - pe.image_base)
        code = data[code_at:code_at + 2].decode()
        native = json.loads(data[match.start():match.start() + size])
        active = json.loads((ROOT / f"crates/azeroth-survivors-re/assets/locales/{code}.json").read_text())
        assert all(active[label] == native[label] for label in labels), code
        catalogs.append(code)
    assert len(catalogs) == 14
    metadata = dict(target_sha256=SHA, virtual_address=hex(START), file_offset=hex(at),
                    byte_count=len(source), sha256=hashlib.sha256(source).hexdigest(),
                    source="character-pane.lua", fields=fields, labels=labels, locales=sorted(catalogs),
                    limits=["Exact embedded Lua source; host FrameXML/load/event/render behavior is not established by extraction."])
    output = RETAINED if args.check else ROOT / "runtime/analysis/history/findings/fixgap20-26-27/f1152a393fb1/run-stats-curated"
    if args.check:
        assert (output / "character-pane.lua").read_bytes() == source
        assert json.loads((output / "manifest.json").read_text()) == metadata
    else:
        output.mkdir(parents=True, exist_ok=True)
        (output / "character-pane.lua").write_bytes(source)
        (output / "manifest.json").write_text(json.dumps(metadata, indent=2) + "\n")
    print(f"Verified native character-pane Lua: {len(source)} bytes, {len(fields)} input fields, {len(labels)} localized literals; no game execution")


if __name__ == "__main__":
    main()
