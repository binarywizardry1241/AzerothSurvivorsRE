#!/usr/bin/env python3
"""Retain SHA-bound 0.92 update rules; emulate only two bounded string helpers."""
from portable_paths import portable_json

import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parent.parent
SHA = "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"


def main():
    target = ROOT / "AzerothSurvivors/AzerothSurvivors.exe"
    data = target.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)

    def payload(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + size]

    # No target process is started: only these pure string helpers may execute in Unicorn.
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RAX, UC_X86_REG_RCX, UC_X86_REG_RDX,
                                  UC_X86_REG_R8, UC_X86_REG_R9, UC_X86_REG_RSP,
                                  UC_X86_REG_RIP)
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    end = max(section["rva"] + max(section.get("virtual_size", 0), section["raw_size"])
              for section in pe.sections)
    machine.mem_map(pe.image_base, (end + 4095) & ~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base + section["rva"],
                          data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    memory, stack, stop = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(memory, 0x10000)
    machine.mem_map(stack, 0x10000)
    machine.mem_map(stop, 4096)
    ranges = [(0x140153590, 0x140153CBC), (0x14010B3B0, 0x14010B4E8)]

    memcmp_import = next(dict(library=entry["library"], function=entry["functions"][(0x1458A5270-int(entry["iat_start_address"],16))//8])
                         for entry in pe.imports()
                         if int(entry["iat_start_address"],16) <= 0x1458A5270 < int(entry["iat_start_address"],16)+len(entry["functions"])*8)
    assert memcmp_import["function"] == "memcmp"

    def closed_call(_machine, address, _size, _data):
        if address == 0x1457149F7:
            count = machine.reg_read(UC_X86_REG_R8)
            left = bytes(machine.mem_read(machine.reg_read(UC_X86_REG_RCX), count))
            right = bytes(machine.mem_read(machine.reg_read(UC_X86_REG_RDX), count))
            result = (left > right) - (left < right)
            machine.reg_write(UC_X86_REG_RAX, result & ((1 << 64)-1))
            sp = machine.reg_read(UC_X86_REG_RSP)
            return_address = struct.unpack("<Q", machine.mem_read(sp, 8))[0]
            machine.reg_write(UC_X86_REG_RSP, sp+8)
            machine.reg_write(UC_X86_REG_RIP, return_address)
            return
        if address != stop and not any(start <= address < end for start, end in ranges):
            raise RuntimeError(f"Call outside bounded pure functions: {address:#x}")

    machine.hook_add(UC_HOOK_CODE, closed_call)

    def invoke(address, left, right):
        left, right = left.encode(), right.encode()
        machine.mem_write(memory, left + b"\0")
        machine.mem_write(memory + 0x1000, right + b"\0")
        sp = stack + 0xF008
        machine.mem_write(sp, struct.pack("<Q", stop))
        for register, value in [(UC_X86_REG_RCX, memory), (UC_X86_REG_RDX, len(left)),
                                (UC_X86_REG_R8, memory + 0x1000), (UC_X86_REG_R9, len(right)),
                                (UC_X86_REG_RSP, sp)]:
            machine.reg_write(register, value)
        machine.emu_start(address, stop, count=100000)
        assert machine.reg_read(UC_X86_REG_RIP) == stop
        return bool(machine.reg_read(UC_X86_REG_RAX) & 0xFF)

    cases = []
    for value in ["https://host/a", "x://a", "prefix/a://b", "a:/b", "relative/a", "", "://"]:
        actual = invoke(0x140153590, "://", value)
        assert actual == ("://" in value)
        cases.append(dict(function="0x140153590", needle="://", input=value, result=actual))
    for value in ["AzerothSurvivors", "AZEROTHSURVIVORS", "AzerothSurvivorX"]:
        actual = invoke(0x14010B3B0, value, "AzerothSurvivors")
        assert actual == (value.lower() == "azerothsurvivors")
        cases.append(dict(function="0x14010b3b0", input=value, result=actual))

    functions = []
    for address, role in [
        ("140112920", "Worker creation, endpoint environment variables/defaults"),
        ("1400e7f80", "Check result/version gate and exact auto-update value"),
        ("140119dd0", "Version prefix removal and numeric-vector comparison"),
        ("1400fd690", "Dot-separated u64 lanes; invalid/overflow lane defaults to zero"),
        ("14010afd0", "Unicode trim at both ends of each lane"),
        ("14011a0c0", "Executable stem / exact opt-out gate"),
        ("1401185f0", "Latest JSON fetch, version/notes parsing and base-URL derivation"),
        ("140118060", "Download object parser and SHA string normalization"),
        ("140141680", "Part URL/size mapping"),
        ("140019770", "Bottom-right update banner constructor"),
        ("14000eb90", "Update dialog state dispatch; external jump-table limit"),
        ("14000ec39", "Available-update dialog branch, explicit interval within 00eb90"),
        ("14001ab20", "Update modal root"),
        ("14001a340", "Updater button interaction painter and action dispatch"),
        ("140214460", "Update modal Canvas/panel/16 particle children"),
        ("140011320", "Updater resource default dismissal=false and system registration"),
        ("14001b140", "Modal fade, out-back panel scale and spark animation"),
        ("140215080", "Updater footer button Node/text/gradient/shadow"),
        ("1400275e0", "Modal system typed resource access and call bridge"),
        ("140063aa0", "ScreensPlugin native lifecycle resource construction"),
        ("14000ea60", "Always-one-decimal MiB formatting with translated MB template"),
    ]:
        record = json.loads((ROOT / f"runtime/analysis/history/interface/menu-recovery/0558cac00653/rea-{address}/evidence-bundle.json").read_text())["records"][0]
        functions.append(dict(address="0x" + address, role=role, rea_evidence_id=record["evidence_id"]))
    strings = []
    for address, size, role in [
        (0x1458E4518, 16, "Opt-out environment variable"),
        (0x1458E4528, 16, "Required case-insensitive executable stem"),
        (0x1458E3FCB, 20, "Manifest URL environment variable"),
        (0x1458E3FDF, 37, "Default latest manifest URL"),
        (0x1458C0DDF, 43, "Default data manifest URL"),
        (0x1458E44A1, 22, "HTTP user agent"),
        (0x1458BFC2A, 21, "Automatic-update environment variable"),
        (0x1458E437A, 7, "Required version key"),
        (0x1458E439A, 5, "Optional notes key"),
        (0x1458E4340, 5, "Required parts array key"),
        (0x1458E4345, 4, "Optional name key"),
        (0x1458E4349, 4, "Optional size key"),
        (0x1458E434D, 6, "SHA key"),
        (0x1458E7580, 3, "Part URL key"),
        (0x1458E7583, 3, "Absolute URL substring"),
        (0x1458E7586, 3, "Rust compact format: concatenate two string arguments"),
        (0x1458E7589, 4, "Part size key"),
        (0x1458A9090, 6, "Native size template"),
    ]:
        raw = payload(address, size)
        strings.append(dict(address=hex(address), bytes_hex=raw.hex(), role=role,
                            text=raw.decode("utf-8", errors="backslashreplace")))
    report = dict(
        date="2026-10-16", target_sha256=SHA, native_functions=functions, literals=strings,
        native_string_checks=cases,
        emulation=dict(engine="Unicorn x86-64", functions=[dict(start=hex(a), end=hex(b),
                       sha256=hashlib.sha256(payload(a, b-a)).hexdigest()) for a,b in ranges],
                       reviewed_primitive=dict(thunk="0x1457149f7", iat="0x1458a5270", **memcmp_import),
                       boundary="Only two pure functions execute; the PE-import-bound memcmp thunk is emulated. Any other branch/call outside their intervals aborts. No OS, HTTP, filesystem, update or restart target code is reachable."),
        rules=dict(eligible="WOW_ROGUE_UPDATE != exact '0' and current_exe.file_stem().to_str() ASCII-case-insensitively equals 'AzerothSurvivors'",
                   version="trim_start_matches('v'); split('.'); each lane.trim().parse::<u64>().unwrap_or(0); lexicographic Vec comparison",
                   automatic="WOW_ROGUE_UPDATE_AUTO == exact '1'",
                   latest="Nonempty version string required; notes absent/wrong type defaults empty; root parsed as download object",
                   download="parts array required and nonempty; name defaults empty; size defaults0; sha256 defaults empty, ASCII-lowercased, must have64 UTF-8 bytes (no parser hex validation)",
                   part="url string defaults empty, nonnegative integer JSON size defaults0; url containing '://' retained, otherwise concatenated with manifest prefix through last '/'",
                   errors=["latest.json is incomplete", "no parts", "a download is listed incomplete"]),
        runtime=dict(capture="runtime/analysis/history/native-recovery/reference-captures/1415f0451c23/update-dialog.png", observed_version="0.92.0 → 0.94.1", observed_size="43.0 MB",
                     observed_notes="Druids in Cat Form and Dire Bear Form are visible again.",
                     actions="Banner clicked, dialog captured, Later clicked, banner returned. No download or restart."),
        implementation=dict(source26_validation='Build26 final --locked --offline PASS in11.08s (menu-build-26-final.log); preceding combined build PASS in29.09s. All169 focused harness cases with overlap PASS:74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater,18 installer; test compilation12.95s (menu-tests-26-menu-bridges.log). The five connected memory-only fixtures passed within those harnesses. No live adapter, app, metadata/HTTP request, download, staging/replacement/install or process launch was executed.',
                            module="crates/azeroth-survivors-re/src/update.rs",
                            test_target="crates/azeroth-survivors-re/tests/update.rs",
                            ui_module="crates/azeroth-survivors-re/src/update_ui.rs",
                            scope="Eligibility/version/schema helpers; exact-gated preparation and sequential EXE/data metadata checks; combined/data-only UpdatePlan, dialog, Later/reopen and native animation. Source26 connects gated native lifecycle/worker/HTTP/file/process adapters and Downloading/Ready/Failed UI; compilation and all five connected memory-only fixtures passed in build26. Four data fixtures passed22; six injected check fixtures passed23 (15.47s;64 focused harness cases).",
                            validation="Owning report records source test results separately from this reproducible static/native-string evidence."),
        action_dispatch=dict(address="0x14001a340", pressed_tag=0,
                             action0="Calls113bf0 install worker (Download & restart / retry)",
                             action1="Writes resource+0x10=true (Later/dismiss)",
                             action2="Writes resource+0x10=false (Banner/reopen)",
                             scope="These are updater-specific one-byte action tags, not shared picker/menu tags."),
        button_interaction=dict(address="0x14001a340", table_address="0x1458aa968",
                                bytes_hex=payload(0x1458AA968,12).hex(),
                                scale=dict(Pressed=.97, Hovered=1.05, None_=1),
                                stores="UiTransform.scale x/y at component+16/+20; preserves other fields"),
        http=dict(builder="0x1401185f0", default_builder="0x14039bb50", library="ureq2.12.1", tls="rustls0.23.43",
                  timeout_connect_seconds=10,timeout_read_seconds=30,user_agent="AzerothSurvivors/0.2.0",
                  configuration_binding="AgentBuilder config offset+0x68 connect/+0x78 read matches exact primary ureq2.12.1 source and native default constructor; native fetch stores10/30 at those offsets.",
                  acquired_primary_source=dict(path="runtime/analysis/history/interface/menu-update-recovery/5c4b1380715f/ureq-2.12.1.crate",sha256="02d1a66277ed75f640d608235660df48c8e3c19f3b4edb6a263315626cc3c01d"),
                  response="Native GET.call().into_reader(), then JSON reader10bf70; source now uses serde_json::from_reader(response.into_reader()), compiled in build21 (12.05s;54 focused harness cases PASS). No part URL was fetched during validation; source26 now supplies the gated part adapter as code."),
        visibility=dict(registrar="0x140056c20",type_id_address="0x1458b5270",type_id_bytes=payload(0x1458B5270,16).hex(),
                        native_layout_size=20,alignment=4,drop=None,
                        init="063c6f word+0=0; +8=0; bool+12/+13 copy ScreensPlugin input byte+8; +14/+15/+16=false",
                        available="state1 or4; dismissal=false; lifecycle byte+0==0 and bool+13==true",
                        banner="state1 or4; dismissal=true; lifecycle byte+0==0 and bool+13==true",
                        default_dismissed=False,
                        work_modal="Downloading2/Ready3 are modal unconditionally, bypassing dismissal/context; see menu-update-worker.json.",
                        limitation="Original lifecycle resource Rust name not present in retained type strings. Source app explicitly supplies menu-only mode0/menus_enabled=true rather than deriving a guessed page/dialog gate."),
        modal=dict(global_z_index=6300,canvas=[600,420],max_scale=1.3,
                   panel=dict(width=540,height="Auto",padding_xy=[36,26],border=2,radius=10,overflow="Clip/Clip"),
                   heading_px=40,versions_px=[17,17,19],notes_px=15,notes_width=460,size_px=13,
                   footer=dict(margin_top=8,column_gap=14,padding_x=[28,22],padding_y=10,text_px=17),
                   fade=dict(seconds=.45,shade_alpha=.62,panel_scale="q=clamp((elapsed-start)/.45,0,1)-1; (1+2.70158*q^3+1.70158*q^2)*.4+.6"),
                   sparks=dict(count=16,size="fract(i*1.37)*2.5+2",base_x="fract(i*.618034)*100",speed="fract(i*.731)*.12+.1",phase="fract(i*.293)",frame="t=fract(speed*elapsed+phase); left=base_x+2*sin(9*t+6*phase); top=100-110*t; alpha=.7*sin(PI*t)",rgb=[1,.8,.35])),
        limits=["Source26 connects Download & restart through the exact gate to worker/apply/restart adapters as code. No real adapter was executed; compilation and connected memory-only fixtures passed in build26.",
                "Combined EXE/data check/UI pipeline compiled and fixtures passed23 (15.47s;64 harness cases); rendering unverified. Source26 connects installer and exact AUTO action as code; no live execution.",
                "No metadata request or source UI launch was performed during this implementation batch.",
                "Ghidra analyze_function for153590 failed; its original bytes and bounded native checks are retained instead.",
                "Native/rebuilt updater UI parity remains unverified; current source executable stem fails native shipped-executable gate."])
    path = ROOT / "docs/analysis/evidence/0.92/menu-update-native.json"
    path.write_text(portable_json(report, indent=2) + "\n")
    print(f"Recorded {len(functions)} REA bindings and {len(cases)} closed native string checks.")


if __name__ == "__main__":
    main()
