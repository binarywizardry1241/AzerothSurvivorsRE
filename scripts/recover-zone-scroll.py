#!/usr/bin/env python3
"""Retain static REA evidence for the current chosen-zone visibility system."""
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
WORK = ROOT / "runtime/menu-zone-scroll-0.97.2"
START = 0x140096AF0


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--prepare", action="store_true")
    mode.add_argument("--prepare-producer", action="store_true")
    mode.add_argument("--collect", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    inv = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inv.PE(data)
    functions = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}

    def span(start, end):
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + end - start]
        return dict(virtual_address=hex(start), end_virtual_address_exclusive=hex(end),
                    file_offset=hex(offset), length_bytes=len(raw), sha256=hashlib.sha256(raw).hexdigest(), raw_hex=raw.hex())

    WORK.mkdir(parents=True, exist_ok=True)
    start = 0x14009B220 if args.prepare_producer else START
    source = span(start, functions[start])
    if args.prepare or args.prepare_producer:
        (WORK / f"{start:x}.bin").write_bytes(bytes.fromhex(source["raw_hex"]))
        plan = dict(target=f"runtime/menu-zone-scroll-0.97.2/{start:x}.bin",
                    output=f"runtime/menu-zone-scroll-0.97.2/rea-{start:x}",
                    open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                    timeout=180, open_timeout=60, cleanup_timeout=60,
                    environment={"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
                    operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)), timeout=240)])
        (WORK / f"plan-{start:x}.json").write_text(portable_json(plan, indent=2) + "\n")
        print("Prepared current-target chosen-zone REA plan")
        return
    response = json.loads((WORK / f"rea-{START:x}/003-procedure_pseudo_code.json").read_text())
    evidence = response["response"]["result"]["structuredContent"]
    assert evidence["subject"]["digest"]["sha256"] == source["sha256"]
    assembly = objdump_output([
        "objdump", "-d", "--no-show-raw-insn", f"--start-address={START:#x}",
        f"--stop-address={functions[START]:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
    supplement = []
    for role, va in [("ChosenZone type registration", 0x140342FB0),
                     ("ChosenZone component-id lookup", 0x1402A2D10),
                     ("ChosenZone query initialization", 0x14033C5A0),
                     ("System-parameter initialization", 0x1400A7310),
                     ("System runner calling chosen-zone body", 0x1401239B0),
                     ("Shared pending-resource registration/id getter", 0x140083B20),
                     ("Content-producer system initialization", 0x1400AD270),
                     ("Content-producer system runner", 0x14013C4C0),
                     ("Startup initializes missing pending resource to zero", 0x14008F2C0)]:
        supplement.append(dict(role=role, source=span(va, functions[va]), boundary="Current PE RUNTIME_FUNCTION"))
    producer_start = 0x14009B220
    producer_source = span(producer_start, functions[producer_start])
    producer_response = json.loads((WORK / f"rea-{producer_start:x}/003-procedure_pseudo_code.json").read_text())
    producer_evidence = producer_response["response"]["result"]["structuredContent"]
    assert producer_evidence["subject"]["digest"]["sha256"] == producer_source["sha256"]
    producer_assembly = objdump_output([
        "objdump", "-d", "--no-show-raw-insn", f"--start-address={producer_start:#x}",
        f"--stop-address={functions[producer_start]:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
    report = dict(
        artifact=dict(path=str(TARGET.relative_to(ROOT)), size_bytes=len(data), sha256=SHA),
        target_executed=False, method="REA/Ghidra on unchanged native body; current full-PE instructions and static type/call chain bind its role.",
        body=source, rea_evidence=evidence, original_pe_disassembly=assembly,
        producer=dict(body=producer_source, rea_evidence=producer_evidence, original_pe_disassembly=producer_assembly),
        chosen_type_name=span(0x145945ADC, 0x145945ADC + 46),
        chosen_type_id=span(0x1458F8E60, 0x1458F8E70),
        system_vtable=span(0x1458FB2B0, 0x1458FB358),
        negative_half_lanes=span(0x1458ED000, 0x1458ED010),
        pending_resource_type_id=span(0x1458F8CE0, 0x1458F8CF0),
        save_resource_type_id=span(0x1458F9400, 0x1458F9410),
        auxiliary_resource_type_id=span(0x1458F9A88, 0x1458F9A98),
        entering_display_binding=dict(
            resource_getter=span(0x140081DA0, functions[0x140081DA0]),
            producer_resource_read=span(0x14009B6B9, 0x14009B6F0),
            picker_shell_resource_capture=span(0x14024D9D0, 0x14024DA00),
            picker_shell_resource_read=span(0x14024DF30, 0x14024DF60),
            footer_branch=span(0x140249C10, 0x140249D20),
            normal_label_key=span(0x14593F5F4, 0x14593F600),
            entering_label_key=span(0x14593F600, 0x14593F60F),
            role="The auxiliary resource's first byte selects picker.entering when nonzero, picker.enter when zero.",
            limits="Original Rust type name and launch/session completion writer remain unbound. The Enter producer is independently bound in catalog-menu-input-native.json."),
        supporting_functions=supplement,
        limitations=["Static source recovery only; no compilation, compiler checks, emulated fixtures, or game/rebuilt launches were performed in this pass.",
                     "Raw Ghidra import uses generic GCC ABI; original Windows x64 instruction text establishes actual register/data use.",
                     "The producer and shared pending resource are recovered; the auxiliary byte controls the entering display. catalog-menu-input-native.json independently binds its Enter writer, while the original type/name, completion writer and complete system schedule ordering remain unresolved."])
    output = ROOT / "docs/analysis/evidence/0.97.2/catalog-zone-scroll-native.json"
    output.write_text(portable_json(report, ensure_ascii=False, indent=2) + "\n")
    print(f"Collected {output.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
