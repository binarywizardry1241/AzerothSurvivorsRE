#!/usr/bin/env python3
"""Replay only the native software SHA256 compression function on fixed vectors."""
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
    data = (ROOT/"AzerothSurvivors/AzerothSurvivors.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location("inventory",ROOT/"scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    def raw(va, size):
        offset = pe.rva_offset(va-pe.image_base)
        return data[offset:offset+size]

    start, end = 0x1404AE320, 0x1404B1068
    assert any(pe.image_base+a == start and pe.image_base+b == end for a,b,*_ in pe.functions())
    initial = raw(0x1458E5BB8,32)
    assert struct.unpack("<8I",initial) == (0x6A09E667,0xBB67AE85,0x3C6EF372,0xA54FF53A,0x510E527F,0x9B05688C,0x1F83D9AB,0x5BE0CD19)
    sys.path.insert(0,str(ROOT/"runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_RSP,UC_X86_REG_RIP
    machine = Uc(UC_ARCH_X86,UC_MODE_64)
    base = start&~4095
    machine.mem_map(base,((end-base+4095)//4096)*4096)
    machine.mem_write(start,raw(start,end-start))
    feature = 0x147764158
    machine.mem_map(feature&~4095,4096)
    machine.mem_write(feature,b"\0")
    memory,stack,stop = 0x200000000,0x300000000,0x400000000
    machine.mem_map(memory,0x20000)
    machine.mem_map(stack,0x10000)
    machine.mem_map(stop,4096)
    def closed(_machine,address,_size,_data):
        if address != stop and not start <= address < end:
            raise RuntimeError(f"Outside pure compression function: {address:#x}")
    machine.hook_add(UC_HOOK_CODE,closed)
    checks=[]
    for payload in [b"",b"abc",b"a"*55,b"a"*56,b"abc"*21846]:
        padded=payload+b"\x80"
        padded+=b"\0"*((56-len(padded)%64)%64)+struct.pack(">Q",len(payload)*8)
        machine.mem_write(memory,initial)
        machine.mem_write(memory+4096,padded)
        sp=stack+0xF008
        machine.mem_write(sp,struct.pack("<Q",stop))
        for register,value in [(UC_X86_REG_RCX,memory),(UC_X86_REG_RDX,memory+4096),
                               (UC_X86_REG_R8,len(padded)//64),(UC_X86_REG_RSP,sp)]:
            machine.reg_write(register,value)
        machine.emu_start(start,stop,count=20_000_000)
        assert machine.reg_read(UC_X86_REG_RIP)==stop
        words=struct.unpack("<8I",machine.mem_read(memory,32))
        actual=struct.pack(">8I",*words).hex()
        expected=hashlib.sha256(payload).hexdigest()
        assert actual==expected,(len(payload),actual,expected)
        checks.append(dict(input_length=len(payload),input_sha256=expected,native_sha256=actual,blocks=len(padded)//64))
    record=json.loads((ROOT/"runtime/analysis/history/interface/menu-recovery/0558cac00653/rea-1404ae320/evidence-bundle.json").read_text())["records"][0]
    report=dict(date="2026-10-16",target_sha256=SHA,owner="0x140119320",
                compression=dict(start=hex(start),end=hex(end),sha256=hashlib.sha256(raw(start,end-start)).hexdigest(),rea_evidence_id=record["evidence_id"]),
                initial_state=dict(address="0x1458e5bb8",bytes_hex=initial.hex(),owner_load="0x14011954b/0x140119559"),
                checks=checks,boundary="Only original compression instructions run in Unicorn. In-memory CPU feature byte147764158=0 selects the existing scalar fallback, bypassing CPU detection/accelerated path. Any call/branch outside the function aborts. Padding and final big-endian formatting are supplied by the harness from native119320 operations. No OS, file, HTTP or updater instructions are reachable.",
                scope="Binds native updater hash to standard SHA256; does not identify its original crate/version or replay the whole downloader.",
                provider_choice="Source fixture helper reuses pinned ring0.17.14 SHA256 already present in lock and target dependencies; no claim native updater compression is ring. No sha2 crate/version string was found in bounded target byte search.")
    (ROOT/"docs/analysis/evidence/0.92/update-sha256-native-checks.json").write_text(portable_json(report,indent=2)+"\n")
    print(f"{len(checks)} closed native SHA256 vectors passed; no requests, files or processes in target execution.")


if __name__=="__main__":main()
