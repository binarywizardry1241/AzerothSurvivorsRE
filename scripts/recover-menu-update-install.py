#!/usr/bin/env python3
"""Retain static0.92 updater installer sequencing, without executing target code or I/O."""
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

    def raw(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + length]

    functions = []
    for address, role in [
        ("140113bf0", "Available/Failed guard; exact filename recheck; Downloading2; worker spawn"),
        ("1400ef950", "FnOnce thread entry; calls worker0e8d80"),
        ("1400e8d80", "Patch/executable staging order, failure cleanup, Failed4/Ready3 publication"),
        ("140119320", "Stream gzip decoding, buffered staged file, SHA256 and decompressed size check"),
        ("14012b670", "Sequential part HTTP reader, wire-byte progress and rate smoothing"),
        ("140161480", "gzip reader constructor through155200 header parser"),
        ("1401670c0", "gzip read dispatch; scoped decompiler external jump-table limitation"),
        ("140113110", "Patch replacement, EXE backup/replacement/rollback and respawn"),
        ("14001c280", "Ready3 1.2s timer; apply; localized failure or AppExit success"),
        ("1456a6570", "OpenOptions flags, CreateFileW and truncate-existing behavior"),
    ]:
        record = json.loads((ROOT / f"runtime/analysis/history/interface/menu-recovery/0558cac00653/rea-{address}/evidence-bundle.json").read_text())["records"][0]
        va = int(address, 16)
        boundary = next(item for item in pe.functions() if pe.image_base + item[0] == va)
        end = pe.image_base + boundary[1]
        functions.append(dict(address=hex(va), end=hex(end), byte_sha256=hashlib.sha256(raw(va,end-va)).hexdigest(),
                              role=role, rea_evidence_id=record["evidence_id"]))
    import_records = []
    for address in [0x1458A5048, 0x1458A5178, 0x1458A5A98, 0x1458A5A88, 0x1458A5050]:
        library = next(entry for entry in pe.imports() if int(entry["iat_start_address"],16) <= address < int(entry["iat_start_address"],16)+8*len(entry["functions"]))
        import_records.append(dict(iat=hex(address), library=library["library"],
                                   name=library["functions"][(address-int(library["iat_start_address"],16))//8]))
    report = dict(
        date="2026-10-16", target_sha256=SHA, native_functions=functions, imported_primitives=import_records,
        action_start=dict(owner="0x140113bf0", accepted_states=[1,4],
                          guard="Re-query exact eligible shipped executable before Downloading2 or worker creation",
                          progress="done=0; total=sum executable part sizes plus every pending patch part size; rate=0",
                          thread_name="rogue-update"),
        stages=dict(owner="0x1400e8d80", order="Every pending patch in plan order, then optional executable",
                    data_directory="current_exe.parent().unwrap_or(Path::new('.')).join('Data')",
                    patch="Data.join(format!('{name}.update'))", executable="current_exe.with_extension('update')",
                    failure="Record stage before attempting its download. On error remove every attempted stage, ignoring cleanup errors, publish Failed4 with original plan+error.",
                    success="Publish Ready3 with retained plan; no replacement performed on this worker thread"),
        gzip=dict(library="flate2-1.1.9", variant="Public read::GzDecoder; private32KiB BufReader into bufread::GzDecoder (single member)",
                  primary_source="runtime/tool-state/cargo/registry/src/index.crates.io-1949cf8c6b5b557f/flate2-1.1.9/src/gz/bufread.rs",
                  primary_source_sha256=hashlib.sha256((ROOT/"runtime/tool-state/cargo/registry/src/index.crates.io-1949cf8c6b5b557f/flate2-1.1.9/src/gz/bufread.rs").read_bytes()).hexdigest(),
                  public_read_source_sha256=hashlib.sha256((ROOT/"runtime/tool-state/cargo/registry/src/index.crates.io-1949cf8c6b5b557f/flate2-1.1.9/src/gz/read.rs").read_bytes()).hexdigest(),
                  private_buffer_source_sha256=hashlib.sha256((ROOT/"runtime/tool-state/cargo/registry/src/index.crates.io-1949cf8c6b5b557f/flate2-1.1.9/src/bufreader.rs").read_bytes()).hexdigest(),
                  input_route="1193e5 allocates0x8000;11943b–119459 builds BufReader before161480. Public read::GzDecoder::new builds that same private32KiB buffer then bufread::GzDecoder.",
                  backend="Target byte paths include miniz_oxide-0.8.9 at file0x6ad9025; same dependency already in source lock.",
                  constructor="0x140161929 writes multi byte+0xf0=false",
                  trailer="0x140167400–16741a compares CRC32 and ISIZE;167420 sees multi=false and branches167570 to End",
                  table=dict(address="0x1458e9e08",targets=[hex(0x1458E9E08+lane) for lane in struct.unpack('<5i',raw(0x1458E9E08,20))]),
                  branch=dict(start="0x140167180",end="0x14016780e",sha256=hashlib.sha256(raw(0x140167180,0x68e)).hexdigest(),
                              boundary="Explicit original interval within1670c0; not a standalone original function",
                              rea_evidence_id=json.loads((ROOT/"runtime/analysis/history/interface/menu-recovery/0558cac00653/rea-140167180/evidence-bundle.json").read_text())["records"][0]["evidence_id"])),
        open_options=dict(owner="0x140119469",wrapper="0x1456afd70 →1456a68b0 →1456a6570",
                          fields=dict(write_at25=True,truncate_at27=True,create_at28=True,read_at24=False,append_at26=False,create_new_at29=False),
                          windows="CreateFileW GENERIC_WRITE0x40000000/share7/OPEN_ALWAYS4; if existing and truncate, SetFileInformationByHandle FileEndOfFileInfo5 with length0, plus std fallback",
                          source_equivalent="OpenOptions::new().write(true).create(true).truncate(true).open(path)"),
        download=dict(owner="0x140119320", reader="0x14012b670", gzip_constructor="0x140161480", header="0x140155200 checks1f8b and method8 at1554ca/1554d4/1554de",
                      agent="ureq2.12.1 connect10s/read30s/User-Agent AzerothSurvivors/0.2.0",
                      parts="Sequential GET; finish current response before next. Wire-byte progress before payload gzip decode.",
                      decoded_read_buffer=65536, writer_buffer=8192, gzip_input_buffer=32768,
                      verification="SHA256(lowercase hex) and decoded byte count equal download.sha256/download.size; failure message the download is damaged (checksum mismatch)",
                      retry="No application retry loop observed in the part/download owners; ureq internals remain separate",
                      rate=dict(sample_minimum_seconds=struct.unpack('<d',raw(0x1458C07A0,8))[0],old_weight=.7,new_weight=.3)),
        apply=dict(owner="0x140113110", guard_order=["Exact eligible current executable","Retained state must be Ready3; otherwise nothing downloaded"],
                   patches="For each: ignore remove(destination) result, then rename(stage,destination); propagate rename failure and stop. Already-applied earlier patches remain.",
                   executable=["ignore remove(current_exe.with_extension('old')) result",
                               "rename(current_exe,old); on failure stop",
                               "rename(update,current_exe); on failure attempt rename(old,current_exe), ignore rollback error, return original replacement error"],
                   spawn="Command(current_exe) with original argument tail after argv0; propagate spawn failure without rolling back applied files. Drop child handles; no wait branch observed.",
                   shell="No shell/update script is constructed by this owner; direct rename helpers resolve to MoveFileExW and removal to DeleteFileW.",
                   delay=dict(owner="0x14001c280", seconds=struct.unpack('<f',raw(0x1458A85D4,4))[0], behavior="Entering Ready3 sets elapsed+1.2; leaving Ready clears; at deadline invoke apply; success emits AppExit::Success; failure localizes Could not put the update in place: {error} and publishes Failed4")),
        implementation=dict(source26_validation='Build26 final --locked --offline PASS in11.08s (menu-build-26-final.log); preceding combined build PASS in29.09s. All169 focused harness cases with overlap PASS:74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater,18 installer; test compilation12.95s (menu-tests-26-menu-bridges.log). The five connected memory-only fixtures passed within those harnesses. No live adapter, app, metadata/HTTP request, download, staging/replacement/install or process launch was executed.',
                            module="crates/azeroth-survivors-re/src/update_install.rs", linked_to_app=True,
                            scope="Path/apply/cleanup/Ready/stream/part helpers connected in source26 through update_worker.rs native-gated filesystem/HTTP/process adapters. No real adapter executed; compilation and all five connected memory-only fixtures passed in build26.",
                            tests="crates/azeroth-survivors-re/tests/update_install.rs",
                            result="All18/18 installer fixtures passed Cargo25:6 earlier apply/cleanup/timer,6 stream and6 part-reader cases. Locked offline build14.34s;test compile7.54s;105 harness cases with overlap passed (41 binary,15 native-save,6 config,1 run-modifier,10 save-browser,14 updater,18 installer). Logs runtime/analysis/history/interface/menu-recovery/0558cac00653/menu-{build,tests}-25-save-events-talents-progress.log. All injected backends read/write memory; no requests, actual file replacement or process launch.",
                            stream_fixtures=["Every two-part split, one-byte and empty parts; empty payload", "CRC and ISIZE corruption produce native flate2 InvalidInput error", "Decoded size/SHA mismatch and no decoder-side case normalization", "Only first gzip member decoded, even if second is corrupt", "65538-byte independent zlib fixture crosses64KiB output read and8KiB writer capacities", "Input/write/flush errors precede manifest verification"],
                            sha256="Five closed native4ae320 vectors pass; see update-sha256-native-checks.json. Source helper reuses pinned ring0.17.14 standard SHA256; does not assert native updater crate identity.",
                            part_reader="menu-update-parts.json binds lazy/short/empty/error semantics, shared wrapping counters, exact clock sampling and per-positive-read publication. Six source fixtures PASS25;10 closed native arithmetic checks and3 native I/O-kind lookups passed. Kind0x29 is target Other; source26 NativeParts supplies io::Error::other conversion as code, without live execution."),
        limitations=["Source26 connects updater helpers to the app through native-gated worker/transport/file/process adapters as code; no real adapter was executed.",
                     "Data-manifest schema and local selection four fixtures passed22. Metadata/combined plan/UI pipeline compiled and injected sequence fixtures passed23 (15.47s;64 harness cases); source26 connects the real installer adapters as code, compiled with fixtures passing in build26; no live execution.",
                     "1670c0 scoped Ghidra output stops at external jump dispatch. Original table/branch bytes plus exact flate2 primary source bind single-member/trailer semantics; target runtime decoding has not been replayed.",
                     "No reference/rebuilt installer execution or update download occurred."])
    path = ROOT / "docs/analysis/evidence/menu-update-install.json"
    path.write_text(portable_json(report, indent=2) + "\n")
    print(f"Recorded {len(functions)} REA owners and {len(import_records)} exact PE-import bindings; static only.")


if __name__ == "__main__":
    main()
