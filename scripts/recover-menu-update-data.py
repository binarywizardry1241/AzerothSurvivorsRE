#!/usr/bin/env python3
"""Retain SHA-bound data-manifest/selection rules; no target process or update I/O."""
from portable_paths import portable_json

import hashlib
import importlib.util
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parent.parent
SHA = "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"


def main():
    data = (ROOT / "AzerothSurvivors/AzerothSurvivors.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)

    def raw(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + length]

    functions = []
    for address, role in [
        (0x140112920, "Eligibility, previous-backup cleanup, independent URL env overrides/defaults"),
        (0x140118E40, "GET data manifest, JSON reader, required patches array"),
        (0x14013A7D0, "Result collector stops on first invalid patch"),
        (0x1400F1360, "Mapped patch Vec collector"),
        (0x140150850, "Download parser then ASCII case-insensitive patch filename validation"),
        (0x140158BD0, "Keep metadata error or file length unequal to decoded size"),
        (0x1400E7F80, "Sequential EXE/data checks, local patch selection, data-only Available synthesis"),
    ]:
        boundary = next(item for item in pe.functions() if pe.image_base + item[0] == address)
        end = pe.image_base + boundary[1]
        record = json.loads((ROOT / f"runtime/analysis/history/interface/menu-recovery/0558cac00653/rea-{address:x}/evidence-bundle.json").read_text())["records"][0]
        functions.append(dict(address=hex(address), end=hex(end), byte_sha256=hashlib.sha256(raw(address, end-address)).hexdigest(),
                              rea_evidence_id=record["evidence_id"], role=role))

    # Replay only the comparison block, supplied with the ASCII-lowercase copy
    # produced earlier in 150850. Both branch outcomes stop before error/return
    # construction. No target helper, import, filesystem or network can execute.
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_R13
    start, success, failure = 0x140150B50, 0x140150B9C, 0x140150C4C
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    machine.mem_map(start & ~4095, 4096)
    machine.mem_write(start, raw(start, failure-start+1))
    memory = 0x200000000
    machine.mem_map(memory, 4096)
    result = None

    def closed(_machine, address, _size, _data):
        nonlocal result
        if address in [success, failure]:
            result = address == success
            machine.emu_stop()
        elif not start <= address < success:
            raise RuntimeError(f"Outside pure filename comparison block: {address:#x}")

    machine.hook_add(UC_HOOK_CODE, closed)
    translation = bytes.maketrans(b"ABCDEFGHIJKLMNOPQRSTUVWXYZ", b"abcdefghijklmnopqrstuvwxyz")

    def validate(name):
        nonlocal result
        result = None
        lowered = name.translate(translation)
        machine.mem_write(memory, lowered + b"\0")
        machine.reg_write(UC_X86_REG_RCX, memory)
        machine.reg_write(UC_X86_REG_R13, len(lowered))
        machine.emu_start(start, failure+1, count=100)
        assert result is not None
        expected = (len(lowered) == 11 and lowered[:6] == b"patch-" and lowered[7:] == b".mpq"
                    and (48 <= lowered[6] <= 57 or 97 <= lowered[6] <= 122))
        assert result == expected
        return dict(name_hex=name.hex(), lowered_hex=lowered.hex(), accepted=result)

    checks = [validate(b"patch-" + bytes([lane]) + b".mpq") for lane in range(256)]
    checks += [validate(name) for name in [b"PaTcH-Z.MpQ", b"", b"patch-aa.mpq", b"../patch-a.mpq", b"patch-a.mpq "]]
    literals = []
    for address, length, role in [
        (0x1458E4490, 7, "Required patches key"), (0x1458E4497, 10, "Wrong/missing patches error"),
        (0x1458E758D, 30, "Rust compact format: {name} is not a data patch's name"),
        (0x1458BFB63, 6, "Synthetic data-only plan current version"),
        (0x1458BFBE9, 65, "Synthetic data-only plan notes"),
        (0x1458A90DC, 13, "Data-only dialog heading locale key"),
        (0x1458E3FC8, 3, "Startup previous-backup extension"),
        (0x1458E3FCB, 20, "Executable metadata URL env key"),
        (0x1458E4004, 18, "Data metadata URL env key"),
        (0x1458E3FDF, 37, "Default executable metadata URL"),
        (0x1458C0DDF, 43, "Default data metadata URL"),
        (0x146AE3338, 6, "Native log helper1456b36b0 stdout selector"),
    ]:
        payload = raw(address, length)
        literals.append(dict(address=hex(address), bytes_hex=payload.hex(), text=payload.decode("utf8", errors="backslashreplace"), role=role))
    imports = []
    for address in [0x1458A51A8, 0x1458A51A0, 0x1458A5178]:
        entry = next(entry for entry in pe.imports() if int(entry["iat_start_address"], 16) <= address < int(entry["iat_start_address"], 16)+8*len(entry["functions"]))
        imports.append(dict(address=hex(address), library=entry["library"], name=entry["functions"][(address-int(entry["iat_start_address"], 16))//8]))
    report = dict(
        date="2026-10-16", target_sha256=SHA, native_functions=functions, literals=literals,
        manifest=dict(required="Root patches array; empty accepted; missing/wrong type produces no patches",
                      entries="Existing Download parser runs first. Stop on the first error; never return a partial successful list.",
                      name="Make ASCII-lowercase copy; require exactly11 bytes: patch-, one ASCII alphanumeric byte, .mpq. Preserve original name/case in Download and error.",
                      invalid_name_error="{name} is not a data patch's name",
                      base="Prefix of full data manifest URL through last slash, or empty. Part URL resolution remains literal concatenation from Download parser."),
        preparation=dict(owner="0x140112920", steps=[
            "Read exact opt-out env before current_exe. Exact0 short-circuits; otherwise require shipped stem. Failure returns empty updater without worker.",
            "Remove current_exe.with_extension('old'), ignoring result; std wrapper1456b39b0→1456b6420→DeleteFileW.",
            "Read WOW_ROGUE_UPDATE_URL, retaining successful string verbatim (including empty); otherwise use embedded executable metadata URL.",
            "Read WOW_ROGUE_DATA_URL, retaining successful string verbatim (including empty); otherwise use embedded data metadata URL.",
            "Capture both URLs and eligibility-returned current_exe into rogue-update thread closure."],
                         data_path="Sibling Data derived from current_exe, independent of source app --data-dir. No data-directory env override in these owners."),
        selection=dict(owner="0x140158bd0", directory="current_exe.parent().unwrap_or(Path::new('.')).join('Data')",
                       callback="std::fs::metadata(Data.join(original_name))",
                       keep="Any metadata error, or metadata.len() != Download.size",
                       skip="Matching length only. No local SHA, type restriction or deduplication in this selection owner.",
                       metadata_binding=dict(chain="1456b3d60 →1456b62b0 →1456b6570", len_offset="Result+0x38", compare="158d18 loads length,158d80 compares Download+0x48",
                                             proof="FindFirstFileExW buffer+28/+32 size high/low combined at1456b66ac/66b0;1456b66d0 writes Result+0x38", imports=imports)),
        check_sequence=dict(owner="0x1400e7f80", steps=[
            "Fetch latest EXE metadata; on error log and retain no EXE; non-newer manifest also discarded.",
            "Fetch data metadata even without a newer EXE; on error log and use empty patch list.",
            "Select pending local patches by metadata length in original order.",
            "If no EXE and no pending patches, do not publish Available.",
            "If no EXE but patches remain, synthesize version0.92.0 and literal notes; optional EXE remains None.",
            "Otherwise retain newer EXE version/notes and optional download; add pending data patches.",
            "Publish Available1, then exact WOW_ROGUE_UPDATE_AUTO=1 may start native install worker."],
                            data_only_notes=raw(0x1458BFBE9, 65).decode(),
                            ui="00ec39 tests optional EXE atplan+0x50; None uses New game data heading and omits versions row; part-size display sums optional EXE parts plus all pending patch parts."),
        native_filename_checks=dict(count=len(checks), cases=checks, interval=dict(start=hex(start), end=hex(success), sha256=hashlib.sha256(raw(start, success-start)).hexdigest()),
                                    boundary="Only comparison instructions run in Unicorn. ASCII-lowercase-copy input supplied; success/failure branch stops before allocation/helper/import calls. No OS or update code reachable."),
        env_conversion=dict(interval=["0x1456c7890","0x1456c7952"],byte_sha256=hashlib.sha256(raw(0x1456C7890,194)).hexdigest(),
                            rea_evidence_id=json.loads((ROOT/"runtime/analysis/history/interface/menu-recovery/0558cac00653/rea-1456c7890/evidence-bundle.json").read_text())["records"][0]["evidence_id"],
                            boundary="Explicit194-byte leaf interval; no PE unwind entry; original ret/CC boundary retained, not claimed as unwind-proven function.",
                            rule="WTF8 String conversion rejects ED A0..BF surrogate encodings; failed env String conversion takes the default URL branch, not lossy substitution."),
        implementation=dict(source26_validation='Build26 final --locked --offline PASS in11.08s (menu-build-26-final.log); preceding combined build PASS in29.09s. All169 focused harness cases with overlap PASS:74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater,18 installer; test compilation12.95s (menu-tests-26-menu-bridges.log). The five connected memory-only fixtures passed within those harnesses. No live adapter, app, metadata/HTTP request, download, staging/replacement/install or process launch was executed.',
                            module="crates/azeroth-survivors-re/src/update_data.rs", api="update::data::DataManifest::{from_json,patches,into_pending}",
                            pipeline="crates/azeroth-survivors-re/src/update_check.rs; CheckRequest::{prepare_with,check_with}; injected PrepareHost/CheckHost and gated environment/metadata adapter",
                            scope="Data validation/selection connected to sequential EXE/data checks and UpdatePlan; native gated old-backup cleanup, independent HTTP agents, local metadata; optional EXE/data-only UI. Source26 connects the gated download/install/restart adapters as code; no live backend was executed.",
                            tests="Four data fixtures passed build22 (11.82s;26 bin tests). Six new preparation/check sequence fixtures passed23 (15.47s;64 harness cases:35 binary,15 native-save,14 update integration)."),
        limitations=["Manifest/check sequence is static reconstruction, not an acquired live response or runtime installer observation.",
                     "Combined metadata/UI pipeline compiled and injected tests passed23 (15.47s;64 harness cases). No real adapter call, metadata request, backup cleanup or new UI launch was performed.",
                     "Source26 connects native-gated adapters as code; compilation and all five connected memory-only fixtures passed in build26, no live adapter execution.",
                     "std::fs metadata import chain is bound from original instruction bytes; the scoped generic-GCC Ghidra signature is not trusted as a Windows ABI declaration."])
    path = ROOT / "docs/analysis/evidence/menu-update-data.json"
    path.write_text(portable_json(report, indent=2) + "\n")
    print(f"Recorded {len(functions)} Ghidra owners and {len(checks)} closed native filename checks; no requests or processes.")


if __name__ == "__main__":
    main()
