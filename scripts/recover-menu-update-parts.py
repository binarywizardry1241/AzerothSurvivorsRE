#!/usr/bin/env python3
"""Bind native part-reader decisions and replay only pure threshold/rate arithmetic."""
from portable_paths import portable_json

import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import sys

ROOT=Path(__file__).resolve().parent.parent
SHA="47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"


def main():
    data=(ROOT/"AzerothSurvivors/AzerothSurvivors.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest()==SHA
    spec=importlib.util.spec_from_file_location("inventory",ROOT/"scripts/inventory-executable.py")
    inventory=importlib.util.module_from_spec(spec);spec.loader.exec_module(inventory);pe=inventory.PE(data)
    def raw(va,size):
        offset=pe.rva_offset(va-pe.image_base);return data[offset:offset+size]
    owners=[]
    for address,role in [(0x14012B670,"Lazy sequential response reader, progress, rate and failure transitions"),
                         (0x1400E8D80,"One progress context initialized before patch/EXE sequence"),
                         (0x1456A1E60,"Elapsed now minus saved timestamp; backwards result saturates zero"),
                         (0x14012BF90,"Clone retained plan before every positive-read publication"),
                         (0x1403A3C30,"HTTP error-to-I/O wrapper; decompiler truncates after allocation"),
                         (0x1456DAE10,"I/O Display dispatch; original table-bound branch names kind41 Other")]:
        boundary=next(item for item in pe.functions() if pe.image_base+item[0]==address);end=pe.image_base+boundary[1]
        record=json.loads((ROOT/f"runtime/menu-recovery/rea-{address:x}/evidence-bundle.json").read_text())["records"][0]
        owners.append(dict(address=hex(address),end=hex(end),sha256=hashlib.sha256(raw(address,end-address)).hexdigest(),rea_evidence_id=record["evidence_id"],role=role))
    sys.path.insert(0,str(ROOT/"runtime/armory-recovery/python-libs"))
    from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RAX,UC_X86_REG_RDX,UC_X86_REG_RBX,UC_X86_REG_R14,UC_X86_REG_XMM0,UC_X86_REG_RIP
    machine=Uc(UC_ARCH_X86,UC_MODE_64)
    code=0x14012B000;machine.mem_map(code,4096);machine.mem_write(code,raw(code,4096))
    for base in [0x1458A8000,0x1458C0000]:machine.mem_map(base,4096);machine.mem_write(base,raw(base,4096))
    memory=0x200000000;machine.mem_map(memory,4096)
    threshold_start,threshold_yes,threshold_no=0x14012B6F1,0x14012B966,0x14012B733
    rate_start,rate_end=0x14012B966,0x14012B9CD
    mode="threshold";outcome=None
    def closed(_machine,address,_size,_data):
        nonlocal outcome
        if mode=="threshold":
            if address in [threshold_yes,threshold_no]:outcome=address==threshold_yes;machine.emu_stop()
            elif not threshold_start<=address<threshold_no:raise RuntimeError(f"Outside threshold block: {address:#x}")
        elif address==rate_end:machine.emu_stop()
        elif not rate_start<=address<rate_end:raise RuntimeError(f"Outside rate block: {address:#x}")
    machine.hook_add(UC_HOOK_CODE,closed)
    thresholds=[]
    for seconds,nanos in [(0,0),(0,249_999_999),(0,250_000_000),(1,0),((1<<64)-1,999_999_999)]:
        outcome=None;machine.reg_write(UC_X86_REG_RAX,seconds);machine.reg_write(UC_X86_REG_RDX,nanos)
        machine.emu_start(threshold_start,0,count=100)
        expected=seconds+float(nanos)/1_000_000_000>=.25
        assert outcome==expected
        thresholds.append(dict(seconds=seconds,nanoseconds=nanos,samples=outcome))
    mode="rate";rates=[]
    for done,previous_done,old_rate,elapsed in [(40,0,0.,.25),(50,40,160.,.25),(1,(1<<64)-2,0.,.25),((1<<64)-1,0,0.,1.),(143,127,2.2,1.25)]:
        machine.mem_write(memory+0x10,struct.pack("<d",old_rate));machine.mem_write(memory+0x18,struct.pack("<Q",previous_done))
        machine.reg_write(UC_X86_REG_RBX,memory);machine.reg_write(UC_X86_REG_R14,done)
        machine.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack("<d",elapsed)+b"\0"*8,"little"))
        machine.emu_start(rate_start,rate_end,count=100)
        assert machine.reg_read(UC_X86_REG_RIP)==rate_end
        actual=struct.unpack("<d",machine.mem_read(memory+0x10,8))[0]
        instantaneous=float((done-previous_done)&((1<<64)-1))/elapsed
        expected=instantaneous if old_rate==0. else .3*instantaneous+.7*old_rate
        assert struct.pack("<d",actual)==struct.pack("<d",expected)
        rates.append(dict(done=done,previous_done=previous_done,old_rate=old_rate,elapsed=elapsed,native_rate=actual,rate_bits_hex=struct.pack("<d",actual).hex()))
    # Bind kind naming to this EXE's tables rather than a host Rust enum ordinal.
    # The full owner has an external jump table; the exact in-owner branch is
    # retained separately and only its table lookup instructions are replayed.
    kind_start,kind_end=0x1456DAE9A,0x1456DAEC7
    kinds=Uc(UC_ARCH_X86,UC_MODE_64)
    for page in [0x1456DA000,0x146AEF000]:
        kinds.mem_map(page,4096);kinds.mem_write(page,raw(page,4096))
    from unicorn.x86_const import UC_X86_REG_R8
    def kind_closed(_machine,address,_size,_data):
        if address==kind_end:kinds.emu_stop()
        elif not kind_start<=address<kind_end:raise RuntimeError(f"Outside I/O-kind lookup: {address:#x}")
    kinds.hook_add(UC_HOOK_CODE,kind_closed)
    kind_checks=[]
    for index,display,debug in [(40,"too many open files","TooManyOpenFiles"),(41,"other error","Other"),(42,"uncategorized error","Uncategorized")]:
        kinds.reg_write(UC_X86_REG_R8,index<<32)
        kinds.emu_start(kind_start,kind_end,count=100)
        pointer=kinds.reg_read(UC_X86_REG_RAX);length=kinds.reg_read(UC_X86_REG_R8)
        assert raw(pointer,length).decode()==display
        debug_pointer=struct.unpack('<Q',raw(0x146AEF668+8*index,8))[0]
        debug_length=struct.unpack('<Q',raw(0x146AEF510+8*index,8))[0]
        assert raw(debug_pointer,debug_length).decode()==debug
        kind_checks.append(dict(index=index,display=display,display_pointer=hex(pointer),debug=debug,debug_pointer=hex(debug_pointer)))
    kind_branch=dict(start=hex(kind_start),end=hex(0x1456DAEF1),sha256=hashlib.sha256(raw(kind_start,0x1456DAEF1-kind_start)).hexdigest(),
                     boundary="Exact original in-owner branch, not an original standalone function; replay stops before formatting callback or stack epilogue.",
                     rea_evidence_id=json.loads((ROOT/'runtime/menu-recovery/rea-1456dae9a/evidence-bundle.json').read_text())["records"][0]["evidence_id"])
    report=dict(date="2026-10-16",target_sha256=SHA,owners=owners,
                native_checks=dict(threshold=thresholds,rate=rates,intervals=[dict(start=hex(a),end=hex(b),sha256=hashlib.sha256(raw(a,b-a)).hexdigest()) for a,b in [(threshold_start,threshold_no),(rate_start,rate_end)]],
                                   boundary="Only pure conversion/threshold/rate instructions run in Unicorn. Threshold stops at either branch; rate stops before Instant::now call12b9cd. Any other call/branch aborts. Rate block precondition elapsed>=.25; zero elapsed is checked separately at the threshold. No OS, HTTP, file or full updater instructions execute."),
                read_rules=dict(open="If no current reader, consume next part index before attempting open; open failure leaves current=None and consumed index.",
                                short_read="A positive response read returns immediately; it does not fill remaining caller buffer from the next part.",
                                eof="On Ok0 drop current reader before attempting next; skip empty parts; final EOF returns0 without time/account/publication.",
                                error="Read error propagates unchanged with current reader retained; no progress/time/publication. The outer downloader stops on error, without application retry.",
                                empty_buffer="No early empty-buffer return exists. Underlying readers returning0 cause all remaining parts to be opened/read/dropped, potentially draining the part list without bytes."),
                progress=dict(initialization="0e8dc9 samples now once; context done/rate/last_done=0, total from entire plan, reused across patch and optional EXE downloads.",
                              count="Response-reader bytes before payload gzip decode, not TCP/HTTP headers or decoded output. Add exact positive count with u64 wrapping; no total clamp.",
                              elapsed="1456a1e60 samples now, subtracts last sample timestamp, saturates backwards to zero; convert seconds + nanos/1e9 to f64.",
                              threshold="elapsed>=0.25; below threshold retains old rate and previous sample byte/time lanes.",
                              rate="instantaneous=wrapping_sub(done,last_done) as f64 / elapsed; if old_rate==0 use instantaneous; otherwise 0.3*instantaneous+0.7*old_rate.",
                              reset="At a speed update call now a second time, store that timestamp and current done. Do not reuse elapsed's first timestamp.",
                              publication="Every positive read: account, optionally sample/reset, clone retained plan12bf90, publish Downloading2(done,total,rate,plan) via112360, then return count."),
                failure_boundary=dict(http_conversion="12b94e passes native I/O-kind byte0x29 into3a3c30. Target Display and Debug tables bind41 to Other. Source PartHost propagates converted io::Error unchanged; source26 NativeParts supplies the target-backed io::Error::other conversion as code.",
                                      decompiler="3a3c30 truncates after allocation/conversion and1456dae10 at an external jump table. The original in-owner branch and both43-entry string tables close kind naming without inventing a complete transport adapter.",
                                      kind_branch=kind_branch,native_kind_checks=kind_checks,
                                      tables=[dict(address=hex(a),byte_count=43*8,sha256=hashlib.sha256(raw(a,43*8)).hexdigest()) for a in [0x146AEF260,0x146AEF3B8,0x146AEF510,0x146AEF668]]),
                implementation=dict(source26_validation='Build26 final --locked --offline PASS in11.08s (menu-build-26-final.log); preceding combined build PASS in29.09s. All169 focused harness cases with overlap PASS:74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater,18 installer; test compilation12.95s (menu-tests-26-menu-bridges.log). The five connected memory-only fixtures passed within those harnesses. No live adapter, app, metadata/HTTP request, download, staging/replacement/install or process launch was executed.',
                            module="crates/azeroth-survivors-re/src/update_parts.rs",parent="update::install child, called by source26 worker through NativeParts; also normal installer harness",linked_to_app=True,
                                    scope="Read/time/publication host interface; source26 NativeParts supplies real gated ureq/Instant/publication code without executing it during validation.",
                                    fixtures="Six part-reader fixtures PASS within18 installer cases in build25. Locked offline build14.34s;test compile7.54s;105 harness cases with overlap PASS:41 binary,15 native-save,6 config,1 run-modifier,10 save-browser,14 updater,18 installer. No app/request/backend execution."),
                limits=["Native arithmetic/table lookups were replayed, but no live response, worker, UI or updater process was executed.","Source26 worker calls the part reader through NativeParts; compilation and connected memory-only fixtures passed in build26, no real backend execution.","The helper receives converted io errors; source26 NativeParts uses io::Error::other, bound to target kind41/Other; no real HTTP call executed."])
    (ROOT/"docs/analysis/evidence/0.92/menu-update-parts.json").write_text(portable_json(report,indent=2)+"\n")
    print(f"Retained {len(owners)} REA owners; {len(thresholds)} threshold, {len(rates)} exact native rate and {len(kind_checks)} I/O-kind lookup cases PASS.")


if __name__=="__main__":main()
