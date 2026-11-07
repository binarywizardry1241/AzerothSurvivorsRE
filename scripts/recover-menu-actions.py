#!/usr/bin/env python3
"""Recover current-target home actions/zone policy without launching the game."""
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
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.97.2.exe"
SHA = "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
WORK = ROOT / "runtime/analysis/history/interface/menu-actions/213951b39c5b"
OUT = ROOT / "docs/analysis/evidence/0.97.2"
STARTS = [0x140099B40, 0x140091C00, 0x1402707E0, 0x14541D7F0, 0x145427250]


def save(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(data, ensure_ascii=False, indent=2) + "\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--prepare", action="store_true")
    mode.add_argument("--collect", action="store_true")
    mode.add_argument("--fixtures", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected-target SHA-256 mismatch"
    inv = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inv.PE(data)
    functions = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}

    def span(va, end):
        offset = pe.rva_offset(va - pe.image_base)
        raw = data[offset:offset + end - va]
        return dict(virtual_address=hex(va), end_virtual_address_exclusive=hex(end),
                    file_offset=hex(offset), length_bytes=len(raw), raw_hex=raw.hex(),
                    sha256=hashlib.sha256(raw).hexdigest())

    identity = dict(path=str(TARGET.relative_to(ROOT)), size_bytes=len(data), sha256=SHA)
    if args.fixtures:
        fixtures(data, pe, span, identity)
        return
    WORK.mkdir(parents=True, exist_ok=True)
    records = []
    for start in STARTS:
        # This leaf has no unwind record; two observed RETs and following INT3
        # padding bound its explicitly selected 71-byte instruction interval.
        end = 0x145427297 if start == 0x145427250 else functions[start]
        source = span(start, end)
        source["boundary"] = ("Explicit leaf interval; RETs at +64/+70, followed by INT3 padding"
                              if start == 0x145427250 else "Current PE RUNTIME_FUNCTION")
        stem = f"{start:x}"
        if args.prepare:
            (WORK / f"{stem}.bin").write_bytes(bytes.fromhex(source["raw_hex"]))
            plan = dict(target=f"runtime/analysis/history/interface/menu-actions/213951b39c5b/{stem}.bin",
                        output=f"runtime/analysis/history/interface/menu-actions/213951b39c5b/rea-{stem}",
                        open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                        timeout=180, open_timeout=60, cleanup_timeout=60,
                        environment={"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
                        operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)), timeout=240)])
            save(WORK / f"plan-{stem}.json", plan)
        else:
            response = json.loads((WORK / f"rea-{stem}/003-procedure_pseudo_code.json").read_text())
            evidence = response["response"]["result"]["structuredContent"]
            assert evidence["subject"]["digest"]["sha256"] == source["sha256"]
            assert evidence["provider"]["id"] == "ghidra" and evidence["normalized_result"]
            assembly = objdump_output([
                "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
                f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT))], cwd=ROOT, text=True)
            records.append(dict(source=source, rea_evidence=evidence, original_pe_disassembly=assembly))
    if args.collect:
        switch = 0x1458FC524
        at = pe.rva_offset(switch - pe.image_base)
        action_map = {str(i): hex(switch + struct.unpack_from("<i", data, at + i * 4)[0]) for i in range(14)}
        literals = []
        for va, value in [(0x1458FA93C, "https://discord.gg/UzxaZuSAk"),
                          (0x1458FA958, "https://wow.aethus.pl/support"), (0x1458FAFBC, "explorer")]:
            source = span(va, va + len(value))
            assert bytes.fromhex(source["raw_hex"]) == value.encode()
            literals.append(dict(text=value, source=source))
        save(OUT / "catalog-actions-native.json", dict(
            artifact=identity, target_executed=False, analyses=records, literals=literals,
            action_jump_table=dict(source=span(switch, switch + 14 * 4), destinations=action_map),
            method="REA/Ghidra exact unchanged native slices; full-PE disassembly binds omitted constants/jump-table data.",
            limitations=["Raw imports use generic GCC ABI; Windows x64 argument and action interpretation is checked against original instruction text.",
                         "URL-opening process creation and actual OS exit were not executed.",
                         "Policy fixtures separately execute bounded selected native instructions with explicit external stubs; they are not game-runtime observations."]))
    print("Prepared native action plans" if args.prepare else "Collected five native action/policy analyses")


def fixtures(data, pe, span, identity):
    # Reuse an existing project-local installed dependency; no package download.
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import __version__ as unicorn_version
    from unicorn.x86_const import UC_X86_REG_RAX, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_RSP, UC_X86_REG_RIP

    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    image_end = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    uc.mem_map(pe.image_base, (image_end + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    uc.mem_map(heap, 0x10000)
    uc.mem_map(stack, 0x20000)
    uc.mem_map(stop, 0x1000)
    save_at, rows_at, pick_at, out_at, allocation_at = heap, heap + 0x1000, heap + 0x2000, heap + 0x3000, heap + 0x6000
    selected_index = 0
    calls = {}

    def hook(machine, at, size, _):
        if 0x14541D7F0 <= at < 0x14541D987 or 0x145427250 <= at < 0x145427297:
            return
        calls[hex(at)] = calls.get(hex(at), 0) + 1
        if at == 0x14540E820:
            machine.reg_write(UC_X86_REG_RAX, selected_index)
        elif at == 0x1400021C0:
            assert machine.reg_read(UC_X86_REG_RCX) < 0x1000
            machine.reg_write(UC_X86_REG_RAX, allocation_at)
        elif at == 0x145756DDD:
            destination, source, length = [machine.reg_read(r) for r in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8)]
            assert length < 0x1000
            machine.mem_write(destination, bytes(machine.mem_read(source, length)))
            machine.reg_write(UC_X86_REG_RAX, destination)
        elif at not in (0x140002200, 0x1400021D0):
            raise RuntimeError(f"Unreviewed native external call {at:#x}")
        rsp = machine.reg_read(UC_X86_REG_RSP)
        ret = struct.unpack("<Q", machine.mem_read(rsp, 8))[0]
        machine.reg_write(UC_X86_REG_RSP, rsp + 8)
        machine.reg_write(UC_X86_REG_RIP, ret)

    uc.hook_add(UC_HOOK_CODE, hook)

    def call(start, rcx, rdx, r8=0):
        rsp = stack + 0x1F008
        uc.mem_write(rsp, struct.pack("<Q", stop))
        for reg, value in [(UC_X86_REG_RSP, rsp), (UC_X86_REG_RCX, rcx), (UC_X86_REG_RDX, rdx), (UC_X86_REG_R8, r8)]:
            uc.reg_write(reg, value)
        uc.emu_start(start, stop, count=10000)
        assert uc.reg_read(UC_X86_REG_RIP) == stop
        return uc.reg_read(UC_X86_REG_RAX)

    def prepare(cid, value):
        rows = [(255, 12)] + ([] if value is None else [(cid, value)])
        uc.mem_write(save_at, bytes(0x200))
        uc.mem_write(rows_at, b"".join(bytes([key]) + bytes(7) + struct.pack("<Q", val) for key, val in rows))
        uc.mem_write(save_at + 0x20, struct.pack("<QQ", rows_at, len(rows)))

    values = [None, 0, 1, 9, 10, 11, 12, 13, 0xFFFFFFFFFFFFFFFF]
    count_cases, selection_cases = [], []
    for cid in (1, 2, 3, 4, 5, 7, 8, 9, 11):
        for value in values:
            prepare(cid, value)
            actual = call(0x145427250, save_at, cid)
            count_cases.append(dict(class_id=cid, stored_unlock=value, native_open_zones=actual))
    for cid in (1, 11):
        for value in values:
            for selected_index in range(12):
                prepare(cid, value)
                zone = 0x6715440 + selected_index * 240
                pointer, length = struct.unpack_from("<QQ", data, zone)
                uc.mem_write(pick_at, bytes(24) + struct.pack("<QQQ", length, pointer, length) + bytes(8) + bytes([cid]) + bytes(7))
                call(0x14541D7F0, out_at, save_at, pick_at)
                pointer, length = struct.unpack("<QQ", uc.mem_read(out_at + 0x20, 16))
                output = bytes(uc.mem_read(pointer, length)).decode()
                selection_cases.append(dict(class_id=cid, stored_unlock=value, input_zone_index=selected_index, native_zone_key=output))
    save(OUT / "catalog-zone-policy-fixtures.json", dict(
        artifact=identity, method="Unchanged native x86_64 instructions in bounded Unicorn; unknown external calls abort; no OS/process/file/network calls reachable.",
        emulator=dict(name="Unicorn", version=unicorn_version),
        native_bodies=[span(0x145427250, 0x145427297), span(0x14541D7F0, 0x14541D987)],
        count_checks=len(count_cases), selection_checks=len(selection_cases), external_stub_calls=calls,
        external_stubs={"0x14540e820": "Return caller-selected existing zone index; key lookup is outside this fixture's boundary.",
                        "0x140002200": "Allocator diagnostic/no-op", "0x1400021c0": "Return bounded in-memory allocation",
                        "0x1400021d0": "No-op deallocation of fixture memory", "0x145756ddd": "Bounded memcpy"},
        limits=["Selected-zone lookup is deliberately stubbed; every supplied index selects an existing native row.",
                "Fixtures exercise the count and replacement policy only; save parsing, migration and rendered interaction are outside the boundary."],
        count_cases=count_cases, selection_cases=selection_cases))
    print(f"Recorded {len(count_cases)} native count outputs and {len(selection_cases)} selected-zone outputs")


if __name__ == "__main__":
    main()
