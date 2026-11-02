#!/usr/bin/env python3
"""Check #53's selected native dimension contract without compiling or running Lua/game code.

An optional project-local addon root checks the unchanged input files and cropped alpha.
The Rust implementation is inspected as source; this does not execute or type-check it.
"""

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct

from coverage_common import latest_target, target_bytes

ROOT = Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "docs/analysis/evidence/0.113.2/jewelry-texture-admission.json"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def project_path(value):
    path = (ROOT / value).resolve()
    if not path.is_relative_to(ROOT):
        raise argparse.ArgumentTypeError("addon input must remain inside this checkout")
    return path


def check(addon_root=None):
    manifest = json.loads(MANIFEST.read_text())
    target = latest_target()
    assert target["sha256"] == manifest["target_sha256"], "target changed; recover a new contract"
    raw = target_bytes(target)
    spec = importlib.util.spec_from_file_location("pe_inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(raw)
    unwind_rva, unwind_size = pe.directories[3]
    unwind_offset = pe.rva_offset(unwind_rva)
    functions = {tuple(pe.image_base + value for value in struct.unpack_from("<II", raw, at))
                 for at in range(unwind_offset, unwind_offset + unwind_size, 12)}
    for item in manifest["ghidra_recovery"]:
        address, end = int(item["va"], 16), int(item["end_exclusive"], 16)
        assert (address, end) in functions, item["name"]
        offset = pe.rva_offset(address - pe.image_base)
        observed = raw[offset:offset + end - address]
        assert digest(observed) == item["slice_sha256"], item["name"]
        if "canonical_assembly" in item:
            lines = (ROOT / item["canonical_assembly"]).read_text().splitlines()
            instructions = [line.split() for line in lines if line and not line.startswith(";")]
            assembled = b"".join(bytes.fromhex(fields[1]) for fields in instructions)
            assert assembled == observed, item["canonical_assembly"]
    for item in manifest["native_ranges"]:
        address, count = int(item["va"], 16), item["byte_count"]
        offset = pe.rva_offset(address - pe.image_base)
        observed = raw[offset:offset + count]
        assert offset == item["file_offset"], item["name"]
        assert digest(observed) == item["sha256"], item["name"]
        assert observed.hex() == item["hex"], item["name"]

    # This is the exact x86 unsigned comparison at 0x145c31088/0x145c3109c:
    # lea r9d,[dimension-0x2001]; cmp r9d,0xffffe000; jb reject.
    # Its immutable bytes were checked above. Exhaust every possible u16 TGA dimension.
    source = (ROOT / "crates/benilla-formats/src/tga.rs").read_text()
    helper = source.split("pub fn tga_texture_size(", 1)[1].split("\n}", 1)[0]
    bounds = re.search(r"let fits = \|n: u32\| \((\d+)\.\.=(\d+)\)\.contains\(&n\);", helper)
    assert bounds, "review the changed Rust admission expression against native evidence"
    low, high = map(int, bounds.groups())
    for dimension in range(65536):
        native = ((dimension - 0x2001) & 0xffffffff) >= 0xffffe000
        assert native == (low <= dimension <= high), dimension
    assert "fits(width) && fits(height)" in helper

    assets_checked = 0
    if addon_root:
        for item in manifest["addon_inputs"]:
            data = (addon_root / item["path"]).read_bytes()
            assert digest(data) == item["sha256"], item["path"]
            if "crop" not in item:
                continue
            width, height = struct.unpack_from("<HH", data, 12)
            assert [width, height] == item["dimensions"]
            assert data[1] == 0 and data[2] == 2 and data[16] == 32 and data[17] == 8
            assert low <= width <= high and low <= height <= high
            start = 18 + data[0]
            pixels = data[start:start + width * height * 4]
            assert len(pixels) == width * height * 4
            # All three supplied images have descriptor 8: bottom-origin BGRA with 8 alpha bits.
            rgba = bytearray()
            for y in range(height):
                row = (height - 1 - y) * width * 4
                for x in range(width):
                    blue, green, red, alpha = pixels[row + x * 4:row + x * 4 + 4]
                    rgba.extend((red, green, blue, alpha))
            assert digest(rgba) == item["decoded_rgba_sha256"], item["path"]
            left, top, right, bottom = item["crop"]
            alphas = [rgba[(y * width + x) * 4 + 3]
                      for y in range(top, bottom) for x in range(left, right)]
            counts = [sum(a == 0 for a in alphas), sum(0 < a < 255 for a in alphas),
                      sum(a == 255 for a in alphas)]
            assert counts == item["crop_alpha_zero_partial_opaque"], item["path"]
            assets_checked += 1

    print(f"PASS: {target['version']} native byte ranges; all 65,536 u16 dimensions match "
          f"the Rust source admission bounds on both axes; {assets_checked} unchanged addon crops checked.")
    print("No Rust compilation, addon/Lua execution, game launch or rendering/parity comparison ran.")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--addon-root", type=project_path)
    args = parser.parse_args()
    check(args.addon_root)


if __name__ == "__main__":
    main()
