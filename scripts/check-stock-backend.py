#!/usr/bin/env python3
"""Check bounded original stock-backend instructions; never build or launch."""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parent.parent
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--python-libs", default="runtime/armory-recovery/python-libs")
    parser.add_argument("--output", default="runtime/stock-frontend-0.105.0/backend-vectors.json")
    args = parser.parse_args()
    libs, output = [(ROOT / value).resolve() for value in (args.python_libs, args.output)]
    assert libs.is_relative_to(ROOT) and output.is_relative_to(ROOT / "runtime")
    sys.path.insert(0, str(libs))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    data = (ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    pe = module.PE(data)
    manifest = json.loads((ROOT / "docs/analysis/evidence/0.105.0/stock-frontend/backend-manifest.json").read_text())
    for span in manifest["spans"]:
        at, size = int(span["file_offset"], 0), span["byte_count"]
        assert hashlib.sha256(data[at:at + size]).hexdigest() == span["sha256"]
    table = 0x146bb7ba0
    at = pe.rva_offset(table - pe.image_base)
    for opcode, target in manifest["packet_commands"].items():
        actual = table + struct.unpack_from("<i", data, at + (int(opcode, 0) - 0x36) * 4)[0]
        assert actual == int(target, 0)
    assert struct.unpack_from("<I", data, pe.rva_offset(0x145db8080 - pe.image_base))[0] == 1

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + s["raw_size"] for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        at, size = section["raw_offset"], section["raw_size"]
        machine.mem_write(pe.image_base + section["rva"], data[at:at + size])
    scratch, scratch_size = 0x200000000, 0x10000
    machine.mem_map(scratch, scratch_size)
    context = {}

    def on_code(_, address, size, unused):
        if address in context["stops"]:
            machine.emu_stop()
            return
        assert any(start <= address and address + size <= end for start, end in context["ranges"]), hex(address)
        at = pe.rva_offset(address - pe.image_base)
        assert bytes(machine.mem_read(address, size)) == data[at:at + size]
        # Every admitted path is leaf-only: a callee is an error, never a seam.
        assert data[at] != 0xe8, f"Unadmitted native call at {address:#x}"

    machine.hook_add(UC_HOOK_CODE, on_code)

    def reset():
        machine.mem_write(scratch, bytes(scratch_size))
        for name in ["RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "R8", "R9", "R10", "R11", "R12"]:
            machine.reg_write(getattr(reg, "UC_X86_REG_" + name), 0)
        machine.reg_write(reg.UC_X86_REG_RSP, scratch + 0xf000)
        machine.reg_write(reg.UC_X86_REG_EFLAGS, 2)

    def run(start, ranges, stops):
        context.update(ranges=ranges, stops=set(stops))
        machine.emu_start(start, 0, count=10000)
        assert machine.reg_read(reg.UC_X86_REG_RIP) in context["stops"]

    vectors = []
    for guids in [[], [0], [1], [42, 2], [2, 42], [5, 1, 9, 3, 7], list(range(10)),
                  [2**64 - 1], [2**64 - 2, 0, 1]]:
        reset()
        rows = scratch + 0x2000
        machine.mem_write(scratch, struct.pack("<QQQ", len(guids), rows, len(guids)))
        for index, guid in enumerate(guids):
            machine.mem_write(rows + index * 56 + 24, struct.pack("<Q", guid))
        machine.reg_write(reg.UC_X86_REG_RCX, scratch)
        run(0x145890550, [(0x145890550, 0x14589065b)], [0x1458905a2, 0x14589065a])
        actual = machine.reg_read(reg.UC_X86_REG_RAX)
        assert actual == ((max(guids) + 1) & (2**64 - 1) if guids else 1)
        vectors.append(dict(contract="next saved GUID", guids=guids, result=actual))

    for text in ["", "A", "é", "éé", " a ", "A1", "abcdefghijklm", "𐍈𐍈", "a" * 31]:
        # Supply the same already-trimmed UTF-8 slice as the native trim owner.
        reset()
        encoded = text.strip().encode()
        machine.mem_write(scratch + 0x2000, encoded or b"\0")
        machine.reg_write(reg.UC_X86_REG_RCX, scratch + 0x2000)
        machine.reg_write(reg.UC_X86_REG_RDX, len(encoded))
        run(0x145ba4c30, [(0x145ba4c30, 0x145ba4cee)], [0x145ba4c47, 0x145ba4ced])
        count = machine.reg_read(reg.UC_X86_REG_RAX)
        assert count == len(text.strip())
        machine.reg_write(reg.UC_X86_REG_R12, count)
        run(0x14589d88d, [(0x14589d88d, 0x14589d8a8), (0x14589ee20, 0x14589ee2f)], [0x14589ee2f])
        status = machine.reg_read(reg.UC_X86_REG_RDI) & 255
        expected = 0x45 if count == 0 else 0x46 if count == 1 else 0x48 if count <= 12 else 0x47
        assert status == expected
        vectors.append(dict(contract="invalid normalized name status", text=text, scalar_count=count, result=status,
                            limit="Caller supplies the failed-normalization outcome; this does not run the allocator/trim owners."))

    for count in [0, 1, 9, 10, 11, 255]:
        reset()
        machine.mem_write(scratch + 0xae0, struct.pack("<Q", count))
        machine.reg_write(reg.UC_X86_REG_RSI, scratch)
        run(0x14589e78d, [(0x14589e78d, 0x14589e79a)], [0x14589e79a, 0x14589e7c1])
        admitted = machine.reg_read(reg.UC_X86_REG_RIP) == 0x14589e7c1
        assert admitted == (count < 10)
        if not admitted:
            assert machine.reg_read(reg.UC_X86_REG_RDI) & 255 == 0x34
        vectors.append(dict(contract="permanent roster count admission", count=count, admitted=admitted))

    for modifiers in [[100, 100, 100, 100], [500, 400, 280, 145], [125, 150, 110, 105]]:
        reset()
        game, stack = scratch, scratch + 0x4000
        value = struct.pack("<4H", *modifiers)
        machine.mem_write(game + 0xcd0, value)
        machine.reg_write(reg.UC_X86_REG_RSI, game)
        machine.reg_write(reg.UC_X86_REG_RBP, stack)
        run(0x14589cf15, [(0x14589cf15, 0x14589cf23)], [0x14589cf23])
        assert bytes(machine.mem_read(stack + 0x24b8, 8)) == value
        run(0x14589d0ae, [(0x14589d0ae, 0x14589d0bc)], [0x14589d0bc])
        assert bytes(machine.mem_read(game + 0xfe0, 8)) == value
        vectors.append(dict(contract="shared Pick modifiers retained by both frontend modes", modifiers=modifiers))

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(dict(target_sha256=SHA, vectors=vectors,
        limits=["Original bounded leaf instructions only; no native callees execute.",
                "Name cases admit only the failed-normalization branch, with already-trimmed text.",
                "No Rust compilation, application launch or rendered/input comparison."]), indent=2) + "\n")
    print(f"{len(vectors)} bounded stock backend vectors passed; {len(manifest['spans'])} current byte ranges rehashed")


if __name__ == "__main__":
    main()
