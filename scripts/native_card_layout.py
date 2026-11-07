#!/usr/bin/env python3
"""Recover bounded card layout/font evidence without compiling or launching the game.

--prepare stages exact native owners and project-local REA/Ghidra batch plans.
--collect stages reviewed instruction extracts and their hash/REA manifest.
--verify executes only the selected unchanged instructions using Unicorn.
"""

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/interface/card-layout/fd1edd7b94a7"
OUT = ROOT / "runtime/analysis/staging/native-evidence/card-layout-comparison"
OWNERS = {
    "card-tile": 0x14011D220,
    "card-content": 0x1401BCFE0,
    "cards-layout": 0x1401C02D0,
    "node-reflection": 0x142644FA0,
}
FRAGMENTS = {
    "card-frame": (0x14011DBF2, 0x14011DDAC),
    "card-font-forward": (0x14011E2C1, 0x14011E34F),
    "card-font-load": (0x1401BD2FF, 0x1401BD306),
    "card-name-font": (0x1401BE6E4, 0x1401BE860),
    "card-footer": (0x1401BEF0E, 0x1401BF1A4),
    "node-dimensions": (0x14264555E, 0x14264578D),
    "node-margin": (0x142645C7E, 0x142645D01),
}


def save(path, value):
    path.write_text(json.dumps(value, indent=2) + "\n")


def verify(pe):
    # An existing project-local Unicorn installation may be supplied via PYTHONPATH.
    # No package installation, compiler or reference process is invoked here.
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, __version__
    from unicorn.x86_const import (
        UC_X86_REG_RBP, UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RBX,
        UC_X86_REG_RDI, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R14,
        UC_X86_REG_XMM9, UC_X86_REG_XMM10, UC_X86_REG_XMM11,
        UC_X86_REG_XMM12, UC_X86_REG_XMM14,
    )

    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + s["raw_size"] for s in pe.sections)
    uc.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section["rva"], pe.data[
            section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    stack, inputs = 0x20000000, 0x30000000
    uc.mem_map(stack, 0x10000)
    uc.mem_map(inputs, 0x10000)
    bp = stack + 0x1000

    def raw(address, size):
        offset = pe.rva_offset(address - pe.image_base)
        return pe.data[offset:offset + size]

    def hook(machine, address, size, _):
        if address in (0x1401BF022, 0x1401BE7A5, 0x1401BE7BA):
            # Explicit memcpy seam; all Node/font stores execute unchanged.
            dst, src, count = (machine.reg_read(r) for r in
                               (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8))
            machine.mem_write(dst, bytes(machine.mem_read(src, count)))
        elif address == 0x1401BE6EF:
            # The unrelated title-string clone is empty for this font-only vector.
            machine.mem_write(bp + 0x520, struct.pack("<QQQ", 0, 4, 0))
        else:
            return
        machine.reg_write(UC_X86_REG_RIP, address + size)

    uc.hook_add(UC_HOOK_CODE, hook)

    def reset():
        uc.mem_write(stack, bytes(0x10000))
        uc.mem_write(inputs, bytes(0x10000))
        uc.reg_write(UC_X86_REG_RBP, bp)
        uc.reg_write(UC_X86_REG_RSP, stack + 0xF000)
        uc.reg_write(UC_X86_REG_R14, inputs + 0x4000)
        for register, address in (
            (UC_X86_REG_XMM9, 0x145DB8880),
            (UC_X86_REG_XMM10, 0x145DB88B0),
            (UC_X86_REG_XMM11, 0x145DB8898),
            (UC_X86_REG_XMM12, 0x145DB88C8),
            (UC_X86_REG_XMM14, 0x145DB8938),
        ):
            uc.reg_write(register, int.from_bytes(raw(address, 16), "little"))

    def val(base, offset):
        tag, value = struct.unpack("<If", uc.mem_read(base + offset, 8))
        return dict(tag=tag, value=value if tag else None)

    reset()
    uc.emu_start(0x14011DBF2, 0x14011DDAC, count=1000)
    assert uc.reg_read(UC_X86_REG_RIP) == 0x14011DDAC
    frame = {name: val(bp + 0xF0, offset) for name, offset in
             (("width", 136), ("height", 144), ("min_height", 160))}
    assert frame == {"width": dict(tag=1, value=252.0),
                     "height": dict(tag=0, value=None),
                     "min_height": dict(tag=1, value=388.0)}
    reset()
    uc.emu_start(0x1401BEF0E, 0x1401BF19F, count=1000)
    assert uc.reg_read(UC_X86_REG_RIP) == 0x1401BF19F
    footer = {name: val(bp + 0x5B8, offset) for name, offset in
              (("width", 136), ("margin_top", 200),
               ("padding_left", 216), ("padding_right", 224),
               ("padding_top", 232), ("padding_bottom", 240))}
    assert footer == {"width": dict(tag=2, value=100.0),
                      "margin_top": dict(tag=0, value=None),
                      "padding_left": dict(tag=1, value=10.0),
                      "padding_right": dict(tag=1, value=10.0),
                      "padding_top": dict(tag=1, value=9.0),
                      "padding_bottom": dict(tag=1, value=9.0)}

    font_cases = []
    for tag in (0, 1):
        reset()
        font = inputs + 0x1000
        payload = bytearray(17)
        payload[0] = tag
        payload[1:8] = b"CARD_ID" if tag else bytes(7)
        struct.pack_into("<Q", payload, 8, inputs + 0x2000)
        payload[16] = 1 if tag else 0
        uc.mem_write(font, bytes(payload))
        uc.mem_write(inputs + 0x2000, struct.pack("<Q", 1))
        uc.mem_write(inputs + 0x20, struct.pack("<Q", inputs + 0x3000))
        uc.reg_write(UC_X86_REG_RBX, inputs)
        uc.reg_write(UC_X86_REG_RDI, font)
        uc.emu_start(0x1401BE6E4, 0x1401BE85B, count=1000)
        assert uc.reg_read(UC_X86_REG_RIP) == 0x1401BE85B
        assert bytes(uc.mem_read(bp + 0x768, 17)) == payload
        size = struct.unpack("<f", uc.mem_read(bp + 0x780, 4))[0]
        assert size == 21.0
        font_cases.append(dict(handle_tag=tag, same_font=True, size=size))
    return dict(target_sha256=SHA, engine="Unicorn " + __version__,
                application_executed=False, cases=4, frame=frame, footer=footer,
                name_font=font_cases,
                seams=["memcpy copies selected bytes without alteration",
                       "title-string clone supplies an empty string",
                       "ECS spawn calls are stopped before execution"],
                limitations=["Instruction vectors do not run the Bevy layout or renderer.",
                             "No original/rebuilt visual or interaction parity is established."])
