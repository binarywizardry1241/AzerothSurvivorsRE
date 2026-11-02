#!/usr/bin/env python3
"""Recover bounded terminal button construction; no build or game execution.

This proves only the selected constructor, queued spawn bundle and common
default style. It does not infer absence of an external/global visual updater.
Fresh Ghidra work is staged under runtime/terminal-hover-0.105.0 before the
reviewed textual extracts are promoted. All generated output stays in runtime/.
"""
from portable_paths import objdump_output, portable_json
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
WORK = ROOT / "runtime/terminal-hover-0.105.0"
RANGES = {
    "button-style": (0x140012180, 0x140012325,
                     "73cd6f4ecec26bc0b6ee81eeb1801cb67da034eac344667994954d5f8ae2b4d7",
                     "ev_fa9d2bdb4f0a9d8f0f4e1fb1ed4eebc1c3f60ac9b2c7f41c1b2c79b6533a8d86"),
    "button-bundle": (0x140191EC0, 0x140192097,
                      "3bd5958167e508dfb812d2c31136ab0044d71d657ddfee73f71030ed8b644cc4",
                      "ev_a43ce84b0e34e928002da3c97b2e9355f2c1a01b2ee0ae3be5916134dcac9d18"),
}
TYPE = ("(bevy_ecs::hierarchy::ChildOf, (wenilla_rogue_app::screens::hud::EndAction, "
        "bevy_ui::focus::Interaction, bevy_ui::ui_node::Node, "
        "(bevy_ui::ui_node::BorderColor, bevy_ui::gradients::BackgroundGradient), "
        "bevy_ui::ui_node::BoxShadow))")


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=WORK / "curated")
    args = parser.parse_args()
    output = args.output.resolve()
    require(output.is_relative_to(ROOT / "runtime"), "Generated output must remain under runtime/")
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    data = TARGET.read_bytes()
    require(hashlib.sha256(data).hexdigest() == SHA, "Selected EXE SHA-256 mismatch")
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + count]
        require(len(value) == count, f"Truncated PE range at {address:#x}")
        return value

    def region(role, start, end):
        value = raw(start, end - start)
        return {"role": role, "virtual_address": hex(start), "end_exclusive": hex(end),
                "file_offset": hex(pe.rva_offset(start - pe.image_base)),
                "byte_count": len(value), "sha256": hashlib.sha256(value).hexdigest()}

    def call(address, target):
        value = raw(address, 5)
        require(value[0] == 0xE8 and address + 5 + struct.unpack_from("<i", value, 1)[0] == target,
                f"Call target mismatch at {address:#x}")

    output.mkdir(parents=True, exist_ok=True)
    ranges = []
    for role, (start, end, digest, evidence) in RANGES.items():
        row = region(role, start, end)
        require(row["sha256"] == digest, f"Reviewed {role} bytes changed")
        row.update(provider="ghidra", rea_evidence_id=evidence, assembly=f"{role}.asm")
        ranges.append(row)
        text = objdump_output(["objdump", "-d", "--no-show-raw-insn",
                                        f"--start-address={start:#x}", f"--stop-address={end:#x}",
                                        str(TARGET)], cwd=ROOT, text=True)
        (output / f"{role}.asm").write_text(text.replace(str(TARGET), str(TARGET.relative_to(ROOT))))
    require(any(pe.image_base + lo == RANGES["button-style"][0] and
                pe.image_base + hi == RANGES["button-style"][1] for lo, hi, _ in pe.functions()),
            "Common style does not match the selected PE unwind boundary")
    require(raw(0x145DC5B62, len(TYPE)) == TYPE.encode(), "Terminal bundle type literal changed")
    require(raw(0x14033755C, 7) == bytes.fromhex("488d15ffe5a805"), "Bundle type LEA changed")
    require(raw(0x140337567, 6) == bytes.fromhex("41b8e7000000"), "Bundle type length changed")
    call(0x1401B12B4, 0x140012180)
    call(0x1401B1442, 0x140191EC0)
    require(raw(0x140191F29, 6) == bytes.fromhex("41b810020000"), "Spawn bundle size changed")
    require(raw(0x1401B13FE, 7) == bytes.fromhex("c685f106000002"), "Initial Interaction tag changed")

    border = list(struct.unpack("<I4f", raw(0x145D6ED7C, 20)))
    stops = [list(struct.unpack("<4f", raw(at, 16))) for at in (0x145D6D240, 0x145D6D250)]
    require(border == [0, *[struct.unpack("<f", struct.pack("<f", v))[0]
                            for v in (.690, .541, .227, 1.)]], "Default border literal changed")
    contracts = {
        "target": str(TARGET.relative_to(ROOT)), "target_sha256": SHA, "ranges": ranges,
        "source_owner": "crates/azeroth-survivors-re/src/gameplay/terminal_view.rs::button",
        "constructor": {
            "owner": "0x1401af460..0x1401b167a",
            "owner_manifest": "presentation-manifest.json",
            "style_call": "0x1401b12b4", "spawn_call": "0x1401b1442",
            "bundle_bytes": 528, "bundle_type": TYPE, "initial_interaction": "None (byte 2)",
            "bundle_fields": {"ChildOf": 0, "Node": 8, "BorderColor": 392,
                              "BackgroundGradient": 472, "EndAction": 496,
                              "Interaction": 497, "BoxShadow": 504},
            "type_literal": region("bundle-type", 0x145DC5B62, 0x145DC5B62 + len(TYPE)),
            "type_reference": region("bundle-type-reference", 0x14033755C, 0x140337575),
            "bounded_negative": "This tuple contains neither picker::Hover nor the Bevy Button marker. "
                                "The terminal constructor does not queue a separate Hover insertion. "
                                "This does not rule out an external/global visual updater selecting Interaction.",
        },
        "default_style": {
            "border_color": {"bevy_color_variant": border[0], "srgba": border[1:]},
            "gradient": {"angle_bits": "40490fdb", "angle": "PI", "interpolation_tag": 0,
                         "stops_linear_rgba": stops,
                         "conversion": "Native helper144c67100 exports raw RGBA; stops are stored as LinearRgba"},
            "shadow": {"rgba": [0, 0, 0, .85], "offset_px": [0, 2], "spread_px": 0, "blur_px": 6},
            "source_status": "Existing source default border, two raw linear gradient stops and shadow match; unchanged.",
        },
        "checks": {"kind": "Exact PE hash, two unchanged function hashes/unwind boundary, "
                           "embedded tuple/type-reference bytes, two call targets, bundle size, initial Interaction and border literal",
                   "result": "passed", "script": "scripts/recover-terminal-buttons.py"},
        "limitations": [
            "Global Interaction/gradient/border/shadow query registration and terminal hover/press visual consumer remain unresolved. "
            "No interpolation, active color or hover shadow has been inferred or implemented from these constructors.",
            "Raw Ghidra slices use generic compiler types and omit callees/data; original PE instructions and literals corroborate fields.",
            "No source compilation, compiling tests, game launch or original/rebuilt interaction/visual comparison.",
        ],
    }
    (output / "button-contracts.json").write_text(portable_json(contracts, indent=2) + "\n")
    print("Verified selected EXE, two Ghidra function ranges and bounded terminal button constructor/default-style contracts")


if __name__ == "__main__":
    main()
