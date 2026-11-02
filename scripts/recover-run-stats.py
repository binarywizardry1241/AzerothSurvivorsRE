#!/usr/bin/env python3
"""Extract/check the exact selected-target character-pane Lua; static only."""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
START = 0x146BAFFD0
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/run-stats"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
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
    output = RETAINED if args.check else ROOT / "runtime/fixgap20-26-27/run-stats-curated"
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
