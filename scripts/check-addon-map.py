#!/usr/bin/env python3
"""Replay only the selected EXE's addon map-rectangle selector in Unicorn.

The two external lookup calls receive controlled inputs. No game, window,
reconstructed source, filesystem operation or network operation is executed.
Requires the existing project-local Unicorn analysis dependency.
"""
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
ENTRY, END = 0x1458EDED0, 0x1458EE06C


def main():
    spec = importlib.util.spec_from_file_location("weapon", ROOT / "scripts/recover-weapon-power.py")
    weapon = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(weapon)
    spec = importlib.util.spec_from_file_location("pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    data = (ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe").read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    pe = module.PE(data)
    u, r, mem, stack, done = weapon.machine(pe)
    from unicorn import UC_HOOK_CODE
    context = {}

    def hook(_, address, size, unused):
        if address == done:
            u.emu_stop()
            return
        if address in (0x1458753B0, 0x1458C0F00):
            if address == 0x1458753B0:
                u.reg_write(r.UC_X86_REG_RAX, context["zone"])
            else:
                u.reg_write(r.UC_X86_REG_RAX, 0 if context["null"] else mem + 0x1000)
                u.reg_write(r.UC_X86_REG_RDX, len(context["rows"]))
            sp = u.reg_read(r.UC_X86_REG_RSP)
            u.reg_write(r.UC_X86_REG_RIP, struct.unpack("<Q", u.mem_read(sp, 8))[0])
            u.reg_write(r.UC_X86_REG_RSP, sp + 8)
            return
        if not ENTRY <= address < END:
            raise RuntimeError(f"Unreviewed native call/instruction {address:#x}")

    u.hook_add(UC_HOOK_CODE, hook)
    outer = [0, 999, 500., -2000., -8000., -11000.]
    small = [0, 888, -500., -1000., -9000., -10000.]
    exact = [0, 12, 4., 3., 2., 1.]
    cases = [
        ("null_table", [], None, True), ("empty_table", [], None, False),
        ("exact_area_before_geometry", [outer, exact, small], 1, False),
        ("smallest_containing", [outer, small], 1, False),
        ("keep_first_equal_area", [small, [0, 777, *small[2:]]], 0, False),
        ("wrong_map", [[1, *small[1:]]], None, False),
        ("outside", [[0, 888, 100., 0., 200., 0.]], None, False),
        ("exact_first_duplicate", [exact, [0, 12, 40., 30., 20., 10.]], 0, False),
    ]
    vectors = []
    for name, rows, expected, null in cases:
        context.update(zone=0, rows=rows, null=null)
        u.mem_write(mem, bytes(0x10000))
        u.mem_write(stack, bytes(0x10000))
        for index, row in enumerate(rows):
            u.mem_write(mem + 0x1000 + index*24, struct.pack("<II4f", *row))
        sp = stack + 0x8000
        u.mem_write(sp, struct.pack("<Q", done))
        u.reg_write(r.UC_X86_REG_RSP, sp)
        u.reg_write(r.UC_X86_REG_RCX, mem + 0x100)
        u.reg_write(r.UC_X86_REG_RDX, mem + 0x200)
        u.reg_write(r.UC_X86_REG_R8, 6)
        u.reg_write(r.UC_X86_REG_MXCSR, 0x1F80)
        u.emu_start(ENTRY, done + 1, count=10000)
        raw = bytes(u.mem_read(mem + 0x100, 20))
        present = struct.unpack_from("<I", raw)[0]
        assert present == int(expected is not None), (name, raw.hex())
        if expected is not None:
            assert raw[4:] == struct.pack("<4f", *rows[expected][2:]), name
        vectors.append(dict(name=name, rows=rows, null_table=null, selected_index=expected,
                            native_output_hex=raw.hex()))
    at = pe.rva_offset(ENTRY - pe.image_base)
    result = dict(target_sha256=SHA, native_range=[hex(ENTRY), hex(END)],
                  native_sha256=hashlib.sha256(data[at:at+END-ENTRY]).hexdigest(), cases=vectors,
                  seams=["Zone-key lookup is intercepted and selects native zone index0.",
                         "DBC lookup supplies the explicitly listed24-byte records.",
                         "All other instructions are unchanged native map-selector bytes; unknown calls abort.",
                         "No reconstructed code, game process or MPQ loader executes."])
    output = ROOT / "runtime/addon-bridge-0.105.0/map-native.json"
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2) + "\n")
    print(f"{len(vectors)} unchanged 0.105.0 addon map-selector vectors passed")


if __name__ == "__main__":
    main()
