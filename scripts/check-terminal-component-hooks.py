#!/usr/bin/env python3
"""Check native terminal component insertion/default hooks, without a game/build.

Only three exact, linear initializer spans execute in Unicorn. No native callees,
branches, returns, operating-system calls or applications execute. Synthetic
memory inputs exercise the descriptor copy, five empty hook slots and empty
required-component state separately from any later dynamic registration.
"""
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys

from coverage_common import latest_target


ROOT = Path(__file__).resolve().parents[1]
EVIDENCE = ROOT / "docs/analysis/evidence/0.105.0/terminal/hover"


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--python-libs", type=Path, required=True,
                        help="Existing checkout-local Unicorn package directory")
    parser.add_argument("--output", type=Path,
                        default=Path("runtime/terminal-hook-recovery-0.105.0/native-vectors.json"))
    parser.add_argument("--prepare-rea", action="store_true",
                        help="Also stage reproducible raw-function Ghidra plans below runtime/")
    args = parser.parse_args()
    libraries = (ROOT / args.python_libs).resolve()
    output = (ROOT / args.output).resolve()
    require(libraries.is_relative_to(ROOT) and libraries.is_dir(), "Unicorn must be checkout-local")
    require(output.is_relative_to(ROOT / "runtime"), "Generated output must stay under runtime/")
    sys.path.insert(0, str(libraries))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as registers

    target = latest_target(verify=True)
    manifest = json.loads((EVIDENCE / "component-insertion.json").read_text())
    require(target["sha256"] == manifest["target_sha256"], "Contracts belong to another target")
    data = (ROOT / target["path"]).read_bytes()
    inventory = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = inventory.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        value = data[offset:offset + count]
        require(len(value) == count, f"Truncated native range at {address:#x}")
        return value

    for row in manifest["ranges"]:
        start, end = int(row["virtual_address"], 16), int(row["end_exclusive"], 16)
        require(hashlib.sha256(raw(start, end - start)).hexdigest() == row["sha256"],
                f"Reviewed native bytes changed: {row['role']}")
        if "pseudocode" in row:
            require(hashlib.sha256((EVIDENCE / row["pseudocode"]).read_bytes()).hexdigest()
                    == row["pseudocode_sha256"], f"Retained pseudocode changed: {row['role']}")
    for site, destination in manifest["calls"]:
        site, destination = int(site, 16), int(destination, 16)
        value = raw(site, 5)
        require(value[0] == 0xE8 and site + 5 + struct.unpack_from("<i", value, 1)[0] == destination,
                f"Terminal insertion call changed at {site:#x}")

    if args.prepare_rea:
        work = ROOT / "runtime/terminal-hook-recovery-0.105.0/reproduction"
        work.mkdir(parents=True, exist_ok=True)
        for row in manifest["ranges"]:
            if row.get("provider") != "ghidra":
                continue
            start, end = int(row["virtual_address"], 16), int(row["end_exclusive"], 16)
            binary = work / f"{row['role']}.bin"
            binary.write_bytes(raw(start, end - start))
            plan = {"target": str(binary.relative_to(ROOT)),
                    "output": str((work / f"rea-{row['role']}").relative_to(ROOT)),
                    "init_timeout": 60, "timeout": 240,
                    "open_options": {"format": "raw-binary", "architecture": "x86_64",
                                     "entry_point": hex(start)},
                    "operations": [{"name": "procedure_pseudo_code",
                                    "arguments": {"procedure": hex(start)}}]}
            (work / f"{row['role']}-plan.json").write_text(json.dumps(plan, indent=2) + "\n")

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(section["rva"] + max(section["raw_size"], section["virtual_size"])
                 for section in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section["rva"],
                    data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    scratch, scratch_size = 0x20000000, 0x10000
    u.mem_map(scratch, scratch_size)
    bp, destination, descriptor = scratch + 0x1000, scratch + 0x3000, scratch + 0x5000
    active = [0, 0]
    next_instruction = [0]

    def code_hook(machine, address, length, _):
        require(active[0] <= address and address + length <= active[1],
                f"Execution escapes reviewed initializer at {address:#x}")
        require(address == next_instruction[0], "Initializer control flow was not linear")
        next_instruction[0] = address + length
        value = bytes(machine.mem_read(address, length))
        require(value == raw(address, length), "Native initializer instructions were modified")
        # The reviewed spans contain only data movement and XOR. Reject all
        # other opcodes, including every direct/indirect control transfer.
        index = 0
        while index < length and (value[index] in {0x66, 0xf2, 0xf3}
                                  or 0x40 <= value[index] <= 0x4f):
            index += 1
        opcode = value[index]
        allowed = opcode in {0x89, 0x8b, 0xc7}
        if opcode == 0x0f:
            allowed = value[index + 1] in {0x10, 0x11, 0x28, 0x29, 0x57, 0x6f, 0x7f}
        require(allowed, f"Unreviewed initializer opcode at {address:#x}")

    def write_hook(_, __, address, length, ___, ____):
        require(scratch <= address and address + length <= scratch + scratch_size,
                f"Native initializer write escapes scratch memory at {address:#x}")

    u.hook_add(UC_HOOK_CODE, code_hook)
    u.hook_add(UC_HOOK_MEM_WRITE, write_hook)

    def execute(start, end):
        active[:] = [start, end]
        next_instruction[0] = start
        u.emu_start(start, end, count=256)
        require(u.reg_read(registers.UC_X86_REG_RIP) == end, "Initializer instruction budget exhausted")

    cases = []
    for poison in (0, 0x5A, 0xA5, 0xFF):
        for identity in (0, 1, 127, 0xFFFFFFFF):
            u.mem_write(scratch, bytes([poison]) * scratch_size)
            descriptor_bytes = bytes((i * 19 + poison) & 255 for i in range(0x58))
            u.mem_write(descriptor, descriptor_bytes)
            u.reg_write(registers.UC_X86_REG_RCX, destination)
            u.reg_write(registers.UC_X86_REG_RDX, identity)
            u.reg_write(registers.UC_X86_REG_R8, descriptor)
            execute(0x144E2D8F0, 0x144E2D9D8)
            result = bytes(u.mem_read(destination, 0x130))
            require(result[:0x58] == descriptor_bytes, "Component descriptor copy differs")
            require(struct.unpack_from("<Q", result, 0x100)[0] == identity, "Component identity differs")
            require(result[0x108:0x130] == bytes(0x28), "A component hook was initialized nonempty")
            for base in (0x58, 0x90, 0xC8):
                require(struct.unpack_from("<3Q", result, base) == (0, 8, 0),
                        "Component dependency/required-by vector is not empty")
            for base in (0x70, 0xA8, 0xE0):
                require(struct.unpack_from("<3Q", result, base + 8) == (0, 0, 0),
                        "Component dependency/required-by map is not empty")
            cases.append({"contract": "component-info defaults", "poison": poison,
                          "identity": identity, "hooks": [0] * 5})

    for name, start, end in (("EndAction", 0x14028EA01, 0x14028EA4F),
                             ("Interaction", 0x140295FD3, 0x140296027)):
        for poison in (0, 0x5A, 0xA5, 0xFF):
            u.mem_write(scratch, bytes([poison]) * scratch_size)
            u.reg_write(registers.UC_X86_REG_RBP, bp)
            execute(start, end)
            value = bytes(u.mem_read(bp - 0x58, 0x70))
            for offset in (0, 0x38):
                require(struct.unpack_from("<3Q", value, offset) == (0, 8, 0),
                        f"{name} initializes a required-component dependency")
            for offset in (0x18, 0x50):
                require(struct.unpack_from("<3Q", value, offset + 8) == (0, 0, 0),
                        f"{name} initializes a required-component map entry")
            cases.append({"contract": "required-component defaults", "component": name,
                          "poison": poison, "direct_dependencies": 0, "inherited_dependencies": 0})

    view = (ROOT / "crates/azeroth-survivors-re/src/gameplay/terminal_view.rs").read_text()
    button = view.split("fn button(", 1)[1].split("fn survived(", 1)[0]
    require("Interaction::None," in button and "\n        Button," not in button,
            "Terminal source bundle reintroduced a Button marker")
    require("NativeHover::" not in button, "Terminal source bundle reintroduced picker Hover")
    device = (ROOT / "crates/azeroth-survivors-re/src/native_input/mod.rs").read_text()
    focus = (ROOT / "crates/azeroth-survivors-re/src/native_input/focus.rs").read_text()
    require("type CustomControl = (\n    With<Interaction>,\n"
            "    Or<(With<Button>, With<crate::gameplay::DeviceTerminalAction>)>,\n);" in device,
            "Device controls must admit typed terminal actions without admitting arbitrary Interaction nodes")
    require(".query_filtered::<&Interaction, CustomControl>()" in device,
            "Custom touch press routing omits terminal actions")
    require("), CustomControl>();" in focus,
            "Gamepad focus candidate routing omits terminal actions")
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps({"target_sha256": target["sha256"], "case_count": len(cases),
                                 "cases": cases, "limitations": manifest["limitations"]}, indent=2) + "\n")
    print(f"Verified terminal insertion calls, exact native ranges, {len(cases)} bounded hook/dependency "
          "initializer vectors and the source Interaction-only bundle; later dynamic hooks remain unverified")


if __name__ == "__main__":
    main()
