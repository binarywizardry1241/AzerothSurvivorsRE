#!/usr/bin/env python3
"""Retain static REA evidence for current menu Enter, hover and drag behavior.

This only reads the supplied PE, prepares raw Ghidra inputs or collects completed
REA records. It never runs the original or reconstructed game or native fixtures.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script

import argparse
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
WORK = ROOT / "runtime/analysis/history/interface/menu-input/413d65871dec"
FUNCTIONS = {
    "picker border/lift": 0x140099120,
    "scrollbar drag begin": 0x1400732D0,
    "scrollbar drag continuation": 0x140071DD0,
    "Enter keyboard producer and transition timeout": 0x140067EE0,
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--prepare", action="store_true")
    mode.add_argument("--collect", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    inv = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inv.PE(data)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}

    def span(start, end):
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + end - start]
        return dict(virtual_address=hex(start), end_virtual_address_exclusive=hex(end),
                    file_offset=hex(offset), length_bytes=len(raw),
                    sha256=hashlib.sha256(raw).hexdigest(), raw_hex=raw.hex())

    def disassemble(start, end):
        return objdump_output([
            "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
            f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)

    WORK.mkdir(parents=True, exist_ok=True)
    records = []
    for role, start in FUNCTIONS.items():
        source = span(start, bounds[start])
        if args.prepare:
            (WORK / f"{start:x}.bin").write_bytes(bytes.fromhex(source["raw_hex"]))
            plan = dict(target=f"runtime/analysis/history/interface/menu-input/413d65871dec/{start:x}.bin",
                        output=f"runtime/analysis/history/interface/menu-input/413d65871dec/rea-{start:x}",
                        open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                        timeout=180, open_timeout=60, cleanup_timeout=60,
                        environment={"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
                        operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)), timeout=240)])
            (WORK / f"plan-{start:x}.json").write_text(portable_json(plan, indent=2) + "\n")
            continue
        response = json.loads((WORK / f"rea-{start:x}/003-procedure_pseudo_code.json").read_text())
        evidence = response["response"]["result"]["structuredContent"]
        assert evidence["subject"]["digest"]["sha256"] == source["sha256"]
        records.append(dict(role=role, source=source, rea_evidence=evidence,
                            original_pe_disassembly=disassemble(start, bounds[start])))
    if args.prepare:
        print("Prepared four current-target menu input REA plans")
        return

    supporting = []
    for role, start in [
        ("Hover query initialization repeats Interaction getter as Changed filter", 0x140338E80),
        ("Interaction component-id getter", 0x140284480),
        ("Action system initialization binds UI state TypeId to slot0x148", 0x1400A7DD0),
        ("Action runner resolves slot0x148 and passes dispatcher argument5", 0x140127490),
        ("Dispatcher action3 and pending keyboard entry converge after action iteration", 0x140099B40),
        ("Footer switches label using entering resource first byte", 0x140249100),
        ("Enter keyboard system initialization", 0x140078BA0),
        ("Enter keyboard system runner", 0x14012FDF0),
        ("Shared wheel selects maximum hovered list stack", 0x1400384D0),
    ]:
        supporting.append(dict(role=role, source=span(start, bounds[start]),
                               original_pe_disassembly=disassemble(start, bounds[start])))
    report = dict(
        artifact=dict(path=str(TARGET.relative_to(ROOT)), size_bytes=len(data), sha256=SHA),
        date="2026-10-18", target_executed=False,
        method="REA/Ghidra on unchanged PE function bodies; original full-PE instructions establish Windows x64 register/call bindings.",
        functions=records, supporting_functions=supporting,
        entering_resource_type_id=span(0x1458F9A88, 0x1458F9A98),
        timeout_seconds=span(0x1458F6600, 0x1458F6604),
        completion_key_repeat_seconds=span(0x1458EB488, 0x1458EB48C),
        hover_lift_sign_bit_lanes=span(0x1458F8F50, 0x1458F8F60),
        native_action3_constructor=span(0x140249810, 0x140249830),
        native_keyboard_pending_write=span(0x140068001, 0x14006801E),
        native_enter_commit_and_transition=span(0x14009A9CC, 0x14009AB61),
        policy={
            "keyboard_keys": {"58": "Enter", "102": "NumpadEnter", "115": "Escape consumed with Enter keys"},
            "keyboard_gates": "main-menu byte+13, no armory(+0x72), language, options(+0x190) or run-options; entering tag must be zero",
            "keyboard_pending": "tag1, timestamp-1.0; shared dispatcher then validates name, normalizes/clamps Pick and emits command11",
            "started": "first DWORD=1, timestamp float+4=current elapsed_secs, completion byte+15=0",
            "actions": "Changed Interaction byte0(Pressed), with no separate mouse-button gate; skip dispatcher actions while tag1 and timestamp>=0",
            "timeout_without_completion": "clear tag only when elapsed-started>30.0, including the branch without completion flags",
            "hover": "Changed Interaction only; None byte2 uses resting Color at0, other interactions use active Color at20; optional UiTransform translation=(Px0,Px(-lift)) while active and(Px0,Px0) otherwise",
            "drag_begin": "Changed Pressed interaction on thumb before track, without a separate mouse-button-resource gate",
        },
        limitations=[
            "Static source recovery only. No compilation, compiler checks, compile-based tests, emulated fixtures or game/rebuilt launches were run.",
            "Native imports use generic GCC ABI; the original Windows x64 instruction text is required for calling-convention interpretation.",
            "The original UI state type name and full launch/session completion producer remain unbound. Source implements the proved menu transition and absent-completion timeout, not world entry.",
            "The current Enter caller binds name-validator/generator and Pick/save helper calls; this input pass does not independently revalidate every inner algorithm. Existing helpers retain their separate version-bound provenance.",
            "KeyCode ordinals58/102/115 match the corresponding variants in the project-local Bevy0.18.1 dependency source; native key set lookup and consumption instructions bind their use here.",
            "Scrollbar input contains a fallback collection of136-byte records. Its original type identity is not yet bound, so source does not substitute a guessed touch/input collection.",
            "Full shared-wheel query membership, schedule/run predicates and overlap behavior across every root remain incomplete.",
        ])
    output = ROOT / "docs/analysis/evidence/0.97.2/catalog-menu-input-native.json"
    output.write_text(portable_json(report, ensure_ascii=False, indent=2) + "\n")
    print(f"Collected {output.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
