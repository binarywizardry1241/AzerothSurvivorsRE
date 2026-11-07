#!/usr/bin/env python3
"""Check the current Options descriptor and replay the CVar-to-log admission.

The native CVar registry, allocator and engine logging setter are explicit seams.
The native wrapper and Unicode trimming instructions run unchanged in Unicorn.
No compiler, game, script VM, config/log-file writer or application is invoked.
"""
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a"
EVIDENCE = ROOT / "docs/analysis/evidence/0.112.0/combat-log-option"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    if (target["version"], target["sha256"]) != ("0.112.0", SHA):
        raise ValueError("Requires exact current 0.112.0 target")
    data = target_bytes(target)
    module = load_script("options_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def raw(va, size):
        offset = pe.rva_offset(va - pe.image_base)
        return data[offset:offset + size]

    def text(pair):
        pointer, length = struct.unpack("<QQ", pair)
        return raw(pointer, length).decode() if length else ""

    rows = json.loads((ROOT / "crates/azeroth-survivors-re/assets/options.json").read_text())["rows"]
    row = rows[62]
    descriptor = raw(0x145DC4720, 152)
    assert text(descriptor[32:48]) == row["key"] == "combatLogFile"
    assert text(descriptor[104:120]) == row["label"] == "Save Combat Log"
    assert struct.unpack_from("<Q", descriptor, 24)[0] == row["storage"] == 0
    assert struct.unpack_from("<Q", descriptor, 64)[0] == row["control"] == 5
    assert descriptor[72] == row["inverted"] == 0
    assert descriptor[145] == row["page"] == 4
    assert row["default"] == "0" and len(rows) == 105
    assert rows[61]["key"] == "PetMeleeDamage" and rows[63]["key"] == "guildMemberNotify"
    for record in json.loads((EVIDENCE / "manifest.json").read_text())["ranges"]:
        assert hashlib.sha256(raw(int(record["address"], 16), record["byte_count"])).hexdigest() == record["sha256"]

    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as reg
    cpu = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    cpu.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        cpu.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    cpu.mem_map(heap, 0x10000)
    cpu.mem_map(stack, 0x10000)
    cpu.mem_map(stop, 4096)

    def get(name):
        return cpu.reg_read(getattr(reg, "UC_X86_REG_" + name))

    def put(name, value):
        cpu.reg_write(getattr(reg, "UC_X86_REG_" + name), value)

    def return_call():
        sp = get("RSP")
        put("RIP", struct.unpack("<Q", cpu.mem_read(sp, 8))[0])
        put("RSP", sp + 8)

    cases = []
    values = [None, "", "0", "1", " 1 ", "\t1\r\n", "1.0", "01", "true", "2", "\u00a01\u3000", "\u200b1", "1\u200b", "\x1c1\x1c"]
    for initialized in (False, True):
        for value in values:
            cpu.mem_write(heap, bytes(0x10000))
            cpu.mem_write(heap + 0x10, bytes([initialized]))
            source = b"" if value is None else value.encode()
            cpu.mem_write(heap + 0x100, source or b"\0")
            calls = []

            def hook(_, address, size, unused):
                if 0x140008DF0 <= address < 0x140008EB6 or 0x1400695F0 <= address < 0x140069869:
                    return
                if address == 0x140569CF0:
                    assert bytes(cpu.mem_read(get("RDX"), get("R8"))) == b"combatLogFile"
                    assert bytes(cpu.mem_read(get("R9"), 1)) == b"0"
                    calls.append("register-default-0")
                elif address == 0x14056D3D0:
                    assert bytes(cpu.mem_read(get("R8"), get("R9"))) == b"combatLogFile"
                    result = (0xffffffffffffffff, 0, 0) if value is None else (len(source), heap + 0x100, len(source))
                    cpu.mem_write(get("RCX"), struct.pack("<QQQ", *result))
                elif address == 0x1400021D0:
                    pass
                elif address == 0x14056C330:
                    assert get("RCX") == heap + 0x800
                    calls.append(bool(get("RDX")))
                    cpu.emu_stop()
                    return
                else:
                    raise AssertionError("Unreviewed native instruction/call: " + hex(address))
                return_call()

            token = cpu.hook_add(UC_HOOK_CODE, hook)
            for name, value_in in (("RCX", 0), ("RDX", heap + 0x800), ("R8", heap + 0x10), ("RSP", stack + 0x8008)):
                put(name, value_in)
            cpu.mem_write(stack + 0x8008, struct.pack("<Q", stop))
            cpu.emu_start(0x140008DF0, stop, count=2000)
            cpu.hook_del(token)
            assert get("RIP") == 0x14056C330 and bool(cpu.mem_read(heap + 0x10, 1)[0])
            expected = value in ("1", " 1 ", "\t1\r\n", "\u00a01\u3000")
            assert calls == ([] if initialized else ["register-default-0"]) + [expected]
            cases.append(dict(initialized=initialized, value=value, enabled=expected))
    record = dict(target_sha256=SHA, cases=cases, descriptor_index=62,
        limits=["Native registry read/register, allocator and engine LoggingCombat setter are explicit seams.",
                "Wrapper and Unicode trim instructions execute unchanged; this does not execute Rust source, script VM, file operations, scheduling or a game."])
    output = ROOT / "runtime/analysis/history/interface/menu-pages/c17e2425557b/combat-log-cases.json" if args.stage else EVIDENCE / "cases.json"
    if args.stage:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(record, ensure_ascii=False, indent=2) + "\n")
    else:
        assert json.loads(output.read_text()) == record
    print(json.dumps(dict(target_sha256=SHA, descriptor_checks=1, native_admission_cases=len(cases), runtime_parity_verified=False)))


if __name__ == "__main__":
    main()
