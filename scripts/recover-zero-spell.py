#!/usr/bin/env python3
"""Stage current selector evidence and verify the spell-zero definition guard.

prepare writes a project-local REA/Ghidra plan. Run that plan with rea-batch.py,
then use collect to stage the selected text and verify for the native vectors.
All generated output stays ignored until explicitly reviewed and promoted.
Neither the reference application nor the reconstruction is launched or built.
"""
from portable_paths import objdump_output, portable_json
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/power-scaling-0.105.0/zero-spell"
OUT = ROOT / "runtime/native-evidence/0.105.0/power-scaling/zero-spell"
OWNERS = {"selector": 0x14592E820, "condition": 0x145929AA0}


def save(path, value):
    path.write_text(portable_json(value, indent=2) + "\n")


def verify(pe, blob):
    # Reuse the installed project-local interpreter dependency, if present.
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, __version__
    import unicorn.x86_const as reg

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(section["rva"] + section["raw_size"] for section in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section["rva"], blob[
            section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    stack, inputs, stop = 0x20000000, 0x30000000, 0x40000000
    machine.mem_map(stack, 0x10000)
    machine.mem_map(inputs, 0x10000)
    machine.mem_map(stop, 0x1000)
    lookup = False

    def hook(uc, address, size, unused):
        nonlocal lookup
        if address == 0x14592E89E:
            lookup = True
            uc.emu_stop()
        elif address == stop:
            uc.emu_stop()
        elif not 0x14592E820 <= address < 0x14592EA75:
            raise RuntimeError("Unreviewed instruction " + hex(address))

    machine.hook_add(UC_HOOK_CODE, hook)

    def run(selector, spell, school, source):
        nonlocal lookup
        lookup = False
        machine.mem_write(stack, bytes(0x10000))
        machine.mem_write(inputs, bytes(64))
        machine.mem_write(inputs, bytes([selector, school]))
        sp = stack + 0x8000
        machine.mem_write(sp, struct.pack("<Q", stop))
        machine.mem_write(sp + 0x28, bytes([source]))
        for register, value in [(reg.UC_X86_REG_RSP, sp), (reg.UC_X86_REG_RCX, 0),
                                (reg.UC_X86_REG_RDX, inputs), (reg.UC_X86_REG_R8, spell),
                                (reg.UC_X86_REG_R9, school)]:
            machine.reg_write(register, value)
        machine.emu_start(0x14592E820, stop, count=1000)
        return dict(selector=selector, spell_id=spell, school=school, source_kind=source,
                    attempted_definition_lookup=lookup,
                    result=None if lookup else bool(machine.reg_read(reg.UC_X86_REG_RAX) & 255))

    cases = []
    for selector in range(8):
        for source in range(4):
            case = run(selector, 0, 2, source)
            cases.append(case)
            assert not case["attempted_definition_lookup"]
            expected = (selector == 0 or (selector == 3 and source != 2)
                        or (selector == 5 and source == 0) or (selector == 6 and source == 2))
            assert case["result"] == expected, case
    for selector in (1, 2, 4):
        for source in (0, 2):
            case = run(selector, 133, 2, source)
            cases.append(case)
            assert case["attempted_definition_lookup"] == (source != 2)
            if source == 2:
                assert not case["result"]
    address = 0x146E7B6B8
    offset = pe.rva_offset(address - pe.image_base)
    payload = blob[offset:offset + 28]
    save(OUT / "native-zero-spell.json", dict(
        target_sha256=SHA, application_executed=False, engine="Unicorn " + __version__,
        cases=cases, jump_table=dict(address=hex(address),
                                    destinations=[hex(address + delta) for delta in struct.unpack("<7i", payload)],
                                    raw_hex=payload.hex(), sha256=hashlib.sha256(payload).hexdigest()),
        scope="Full current selector instructions with original switch data; definition lookup stops at its first instruction.",
        seams=["Game pointer zero is intentionally unmapped: zero-spell cases must never access it.",
               "Nonzero/nonpet cases stop at 14592e89e before reading the class, recording a lookup attempt without substituting a catalog."],
        limits=["No game process was launched.",
                "This establishes selector admission and lookup gating; it does not prove every later generic callback consumer."]))
    print(f"Verified {len(cases)} current selector/definition-lookup gates")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["prepare", "collect", "verify"])
    args = parser.parse_args()
    blob = TARGET.read_bytes()
    assert hashlib.sha256(blob).hexdigest() == SHA
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(blob)
    WORK.mkdir(parents=True, exist_ok=True)
    OUT.mkdir(parents=True, exist_ok=True)
    if args.action == "verify":
        verify(pe, blob)
        return
    bounds = {start + pe.image_base: end + pe.image_base for start, end, _ in pe.functions()}
    owners = []
    for role, start in OWNERS.items():
        end = bounds[start]
        offset = pe.rva_offset(start - pe.image_base)
        payload = blob[offset:offset + end - start]
        record = dict(role=role, address=hex(start), end_exclusive=hex(end), file_offset=hex(offset),
                      byte_count=len(payload), sha256=hashlib.sha256(payload).hexdigest(),
                      assembly=f"{role}.asm")
        if args.action == "prepare":
            (WORK / f"{role}.bin").write_bytes(payload)
        else:
            (OUT / f"{role}.asm").write_text(objdump_output([
                "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
                f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], text=True, cwd=ROOT))
        if role == "selector":
            if args.action == "prepare":
                save(WORK / "selector-plan.json", dict(
                    target=str((WORK / "selector.bin").relative_to(ROOT)),
                    output=str((WORK / "rea-selector").relative_to(ROOT)),
                    init_timeout=60, open_timeout=60, timeout=120,
                    open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                    operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)))]))
            elif (WORK / "rea-selector/003-procedure_pseudo_code.json").exists():
                response = json.loads((WORK / "rea-selector/003-procedure_pseudo_code.json").read_text())
                evidence = response["response"]["result"]["structuredContent"]
                assert evidence["subject"]["digest"]["sha256"] == record["sha256"]
                (OUT / "selector.ghidra.c").write_text(evidence["normalized_result"])
                profile = evidence["analysis_profile"]
                record.update(pseudocode="selector.ghidra.c", evidence_id=evidence["evidence_id"],
                              provider=profile["provider"], analysis_profile_digest=profile["digest"])
        owners.append(record)
    save(OUT / "manifest.json", dict(
        target_sha256=SHA, target_version="0.105.0", application_executed=False, owners=owners,
        vectors="native-zero-spell.json",
        observations=["Condition 145929aa0 forwards event spell+8, school+1c and source+1e to selector 14592e820.",
                      "Selectors 1/2/4 reject source2 and spell0 before reading the class or learned definitions.",
                      "Selector5 independently admits spell0/source0; school/source selectors need no definition."],
        limits=["Raw Ghidra imports omit external callees and static tables; original mapped-PE instructions and switch data control the fixture results.",
                "No original/rebuilt application comparison or gameplay parity is implied."]))
    print(f"Staged {len(owners)} current selector/condition owners")


if __name__ == "__main__":
    main()
