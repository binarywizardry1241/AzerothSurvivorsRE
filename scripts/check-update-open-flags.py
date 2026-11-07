#!/usr/bin/env python3
"""Run closed native OpenOptions flag arithmetic; stop before CreateFileW, with no OS calls."""

import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parent.parent
SHA = "47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2"
START, STOP = 0x1456A6570, 0x1456A66C5


def main():
    data = (ROOT / "AzerothSurvivors/AzerothSurvivors.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    spec = importlib.util.spec_from_file_location("inventory", ROOT / "scripts/inventory-executable.py")
    inventory = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(inventory)
    pe = inventory.PE(data)
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_RSP, UC_X86_REG_RIP
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    end = max(section["rva"] + max(section.get("virtual_size",0), section["raw_size"]) for section in pe.sections)
    machine.mem_map(pe.image_base, (end+4095)&~4095)
    for section in pe.sections:
        machine.mem_write(pe.image_base+section["rva"], data[section["raw_offset"]:section["raw_offset"]+section["raw_size"]])
    memory, stack = 0x200000000, 0x300000000
    machine.mem_map(memory, 0x10000)
    machine.mem_map(stack, 0x10000)

    def closed(_machine, address, _size, _data):
        if not START <= address < STOP:
            raise RuntimeError(f"Outside closed arithmetic-only interval: {address:#x}")

    machine.hook_add(UC_HOOK_CODE, closed)
    cases = []
    for create, truncate, disposition in [(True,True,4),(False,False,3),(False,True,5)]:
        options = bytearray(40)
        struct.pack_into("<I", options, 16, 7)
        options[25], options[27], options[28] = 1, int(truncate), int(create)
        machine.mem_write(memory, struct.pack("<QQ", memory+0x100,4))
        machine.mem_write(memory+0x100, "test".encode("utf-16le")+b"\0\0")
        machine.mem_write(memory+0x1000, bytes(options))
        machine.reg_write(UC_X86_REG_RCX,memory)
        machine.reg_write(UC_X86_REG_RDX,memory+0x1000)
        machine.reg_write(UC_X86_REG_RSP,stack+0xF008)
        machine.emu_start(START,STOP,count=20000)
        assert machine.reg_read(UC_X86_REG_RIP) == STOP
        sp = machine.reg_read(UC_X86_REG_RSP)
        actual = dict(access=machine.reg_read(UC_X86_REG_RDX), share=machine.reg_read(UC_X86_REG_R8),
                      disposition=struct.unpack("<I",machine.mem_read(sp+0x20,4))[0],
                      flags=struct.unpack("<I",machine.mem_read(sp+0x28,4))[0])
        assert actual == dict(access=0x40000000,share=7,disposition=disposition,flags=0)
        cases.append(dict(create=create,truncate=truncate,write=True,**actual))
    offset = pe.rva_offset(START-pe.image_base)
    record = dict(date="2026-10-16",target_sha256=SHA,engine="Unicorn x86-64",
                  start=hex(START),end_exclusive=hex(STOP),code_sha256=hashlib.sha256(data[offset:offset+STOP-START]).hexdigest(),
                  boundary="Only the original flag arithmetic executes. Every branch outside the interval aborts. Execution stops before the CreateFileW call instruction; no import/native helper, OS, filesystem, network or process function can execute.",
                  cases=cases)
    (ROOT/"docs/analysis/evidence/0.92/update-open-options-native-checks.json").write_text(json.dumps(record,indent=2)+"\n")
    print(f"PASS: {len(cases)} closed native flag checks; stopped before every OS call.")


if __name__ == "__main__":
    main()
