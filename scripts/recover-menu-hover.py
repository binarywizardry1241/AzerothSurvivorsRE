#!/usr/bin/env python3
"""Record SHA-bound native menu border/lift behavior and constructor styles."""
from portable_paths import portable_json
import hashlib
import importlib.util
import json
from pathlib import Path
import struct

ROOT = Path(__file__).resolve().parent.parent
SHA = "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"


def main():
    data = (ROOT / "AzerothSurvivors/AzerothSurvivors.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    literals = []
    for address, length, role in [
        (0x1458F3558, 20, "GOLD Srgba Color"),
        (0x1458F35CC, 20, "PAPER Srgba Color"),
        (0x1458F3914, 20, "Class/zone unselected resting border"),
        (0x1458F39A0, 20, "Class/zone unselected active border"),
        (0x1458E50B0, 20, "Run Options resting border"),
        (0x1458E50C4, 20, "Run Options active border"),
        (0x1458F3150, 16, "Enter gradient stop0"),
        (0x1458F3160, 16, "Enter gradient stop1"),
        (0x1458F3170, 16, "Enter gradient stop2"),
        (0x1458F3180, 16, "Enter glow"),
        (0x1458A84E0, 16, "Hover translation float sign-bit mask"),
    ]:
        offset = pe.rva_offset(address - pe.image_base)
        payload = data[offset:offset + length]
        literals.append(dict(address=hex(address), file_offset=hex(offset), bytes_hex=payload.hex(),
                             f32=list(struct.unpack("<" + "f" * (length // 4), payload)), role=role))
    native = []
    for address, role in [
        ("140125150", "Changed Interaction border/lift updater"),
        ("1401ffe50", "Class icon state and queued hover insertion"),
        ("140206410", "Enabled zone state and queued hover insertion"),
        ("140203cb0", "Enter constructor, hover, gradient and shadow"),
        ("14011b060", "Run Options constructor and hover"),
        ("140200950", "Top-right constructors"),
        ("1401adea0", "552-byte top-right spawn bundle writer"),
        ("140238fc0", "88-byte class/zone deferred component insertion writer"),
        ("1401c8d40", "Escape Menu constructor and per-button loop"),
        ("1401a5f90", "528-byte Escape Menu button spawn bundle writer"),
    ]:
        bundle = ROOT / f"runtime/menu-recovery/rea-{address}/evidence-bundle.json"
        records = json.loads(bundle.read_text())["records"]
        record = next(record for record in records if record["operation"] == "analyze_function")
        native.append(dict(address="0x" + address, role=role, rea_evidence_id=record["evidence_id"]))
    report = dict(
        date="2026-10-16", target_sha256=SHA, native_functions=native, literals=literals,
        type_bindings=dict(style_size=44, style_fields=dict(resting_color=0, active_color=20, lift_px=40),
                           Interaction_storage=dict(Pressed=0, Hovered=1, None_=2),
                           UiTransform_size=32, UiTransform_fields=dict(translation=0, scale=16, rotation=24),
                           Val2_fields=dict(x=0, y=8),
                           method="Public Bevy0.18.1 metadata/variant constants compiled to LLVM IR, cross-checked original loads/stores"),
        updater=dict(native_none_tag=2, rest="BorderColor::all(style.resting), optional translation=Px(0,0)",
                     active="Both Hovered/Pressed: BorderColor::all(style.active), optional translation=Px(0,-style.lift)",
                     preserved=["UiTransform scale", "UiTransform rotation", "BackgroundColor", "BackgroundGradient", "BoxShadow"],
                     filter="Native iteration uses change ticks for Interaction; owned implementation additionally repaints when the style itself is newly inserted/changed"),
        constructors=[dict(control="Class icon", resting="GOLD if selected, else Srgba(.169,.129,.071,1)",
                           active="GOLD if selected, else Srgba(.690,.541,.227,1)", lift_px=2,
                           stores="1ffeca–1ffee1,2004bf–200550,2005d4; queued238fc0"),
                      dict(control="Enabled zone card", resting="GOLD if selected, else Srgba(.169,.129,.071,1)",
                           active="GOLD if selected, else Srgba(.690,.541,.227,1)", lift_px=2,
                           condition="Locked card path bypasses queued hover insertion at206e9d–206eb1",
                           stores="206b06–206b56,206ed8–206f68,206fe0; queued238fc0"),
                      dict(control="Enter", resting="GOLD", active="PAPER Srgba(1,.914,.659,1)", lift_px=2,
                           stores="203f49–203f6f,2042f8–20431b,204411"),
                      dict(control="Run Options", resting="BUTTON_EDGE Srgba(.690,.541,.227,1)",
                           active="PAPER Srgba(1,.914,.659,1)", lift_px=2,
                           stores="11b091–11b0b7,11b2d6–11b2f9,11b3f2")],
        enter_appearance=dict(gradient="PI; three Auto stops; Oklaba tag0; Color::LinearRgba exported Srgba components",
                              stops=[[.478, .102, .063, 1], [.227, .031, .024, 1], [.133, .016, .016, 1]],
                              shadow=dict(color_linear_rgba=[1, .42, .1, .35], offset_px=[0, 0], spread_px=2, blur_px=30)),
        top_right=dict(spawn_bundle_size=552, fields="parent8+Node384+BorderColor80+BackgroundGradient24+Action24+Interaction1+BoxShadow24+padding7",
                       bounded_negative="No44-byte hover component is carried by the community or language/options/quit constructor bundle; native125150 therefore does not act on this recovered path.",
                       limitation="This does not establish absence of every possible global painter or component hook. No additional dynamic path has been proved."),
        escape_menu=dict(spawn_bundle_size=528, fields="parent8+Node384+BorderColor80+BackgroundGradient24+Interaction1+MenuAction1+BoxShadow24+padding6",
                         stores="1c9b7c copies488-byte style tuple;1c9b91 InteractionNone;1c9b98 menu action;1c9b9f-1c9bb4 shadow;1c9bd3 spawn1a5f90",
                         bounded_negative="No44-byte hover component is captured or separately queued by this constructor loop; recovered125150 therefore has no style component to read on this path.",
                         limitation="Absence of every possible external component hook/global painter is not proven."),
        implementation=dict(module="crates/azeroth-survivors-re/src/hover.rs", plugin="NativeHoverPlugin",
                             component="NativeHover::new(resting,active,lift)",
                             picker="Class icons, enabled zones, Enter and Run Options attached; Run Options has common red gradient and recovered black shadow.",
                             validation="Integrated hover build/render and native/rebuilt pointer-state comparison pending; owning report tracks later validation."),
        provenance=["picker-input-provenance.json", "native-hover-command-provenance.json", "menu-slices-provenance.json", "existing constructor slice provenance alongside these records"])
    path = ROOT / "docs/analysis/evidence/0.92/menu-hover-native.json"
    path.write_text(portable_json(report, indent=2) + "\n")
    print(f"Recorded {len(native)} native function bindings and {len(literals)} literal regions.")


if __name__ == "__main__":
    main()
