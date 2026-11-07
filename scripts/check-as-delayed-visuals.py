#!/usr/bin/env python3
"""Replay current delayed-visual deadline, compaction and publication order.

No compiler or game application executes. Byte movement and the spell serializer
are explicit seams; the original function owns comparisons, record snapshots,
removal, queue stores and iteration. Source regressions remain uncompiled.
"""
import argparse
import hashlib
import itertools
import json
import math
import struct
import sys

from coverage_common import ROOT, json_text, latest_target, target_bytes
from script_sources import load_script

sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as r

sys.path.insert(0, str(ROOT / "runtime/tool-state/python/camera/python-libs"))
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
FIRST, LAST = 0x14591CAD0, 0x14591CC4E
KEPT = ROOT / "docs/analysis/evidence/as-state-contracts/delayed-visuals.json"
STAGE = ROOT / "runtime/analysis/history/native-recovery/as-state-contracts/a6cf7f2e1fff/staged/delayed-visuals.json"


def digest(value):
    return hashlib.sha256(value).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["version"] == "0.113.2" and target["sha256"] == SHA
    image = target_bytes(target)
    pe = load_script("as_visuals_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    at = pe.rva_offset(FIRST - pe.image_base)
    raw = image[at:at + LAST - FIRST]
    assembly = "\n".join(f"{i.address:x}: {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                         for i in Cs(CS_ARCH_X86, CS_MODE_64).disasm(raw, FIRST)) + "\n"
    if args.stage:
        STAGE.parent.mkdir(parents=True, exist_ok=True)
        STAGE.with_suffix(".asm").write_text(assembly)
    else:
        assert assembly == KEPT.with_suffix(".asm").read_text(), "Delayed visual assembly drift"

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    u.mem_map(FIRST & ~4095, 4096)
    u.mem_write(FIRST, raw)
    game, rows, queue, stack, done = (0x200000000, 0x200004000, 0x200008000,
                                    0x300000000, 0x400000000)
    u.mem_map(game, 0x10000)
    u.mem_map(stack, 0x10000)
    u.mem_map(done, 4096)
    published = []

    def q(address):
        return struct.unpack("<Q", u.mem_read(address, 8))[0]

    def hook(uc, address, size, context):
        if address == done:
            uc.emu_stop()
        elif address == 0x14591CB73:
            dest, source, count = (uc.reg_read(register) for register in
                                   (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
            uc.mem_write(dest, bytes(uc.mem_read(source, count)))
            uc.reg_write(r.UC_X86_REG_RIP, address + 5)
        elif address == 0x14591CBC7:
            source = uc.reg_read(r.UC_X86_REG_RDX)
            spell = uc.reg_read(r.UC_X86_REG_R8) & 0xFFFFFFFF
            point = bytes(uc.mem_read(uc.reg_read(r.UC_X86_REG_RBP) - 0x34, 12))
            opaque = struct.pack("<QI", source, spell) + point + bytes(8)
            uc.mem_write(uc.reg_read(r.UC_X86_REG_RCX), opaque)
            published.append(opaque)
            uc.reg_write(r.UC_X86_REG_RIP, address + 5)

    u.hook_add(UC_HOOK_CODE, hook)
    cases = []
    deadlines = (-math.inf, -1.0, 0.0, 1.0, math.inf, math.nan)
    for count in range(4):
        for times in itertools.product(deadlines, repeat=count):
            for now in (-math.inf, -0.0, 0.0, 1.0, math.inf, math.nan):
                u.mem_write(game, bytes(0x10000))
                u.mem_write(stack, bytes(0x10000))
                u.mem_write(game, bytes((i * 7 + 13) % 256 for i in range(0x2000)))
                u.mem_write(game + 0x5C0, struct.pack("<QQQ", 8, rows, count))
                u.mem_write(game + 0x620, struct.pack("<QQQ", 8, queue, 1))
                u.mem_write(game + 0xB6C, struct.pack("<f", now))
                u.mem_write(queue, b"P" * 32)
                original = [struct.pack("<QfI3fI", 100 + index, deadline,
                                        200 + index, float(index), 2.0, 3.0, 0x11223344)
                            for index, deadline in enumerate(times)]
                if original:
                    u.mem_write(rows, b"".join(original))
                retained = [row for row, deadline in zip(original, times) if not now >= deadline]
                expected_messages = [row[:8] + row[12:28] + bytes(8)
                                     for row, deadline in zip(original, times) if now >= deadline]
                before = bytes(u.mem_read(game, 0x2000))
                expected = bytearray(before)
                struct.pack_into("<Q", expected, 0x5D0, len(retained))
                struct.pack_into("<Q", expected, 0x630, 1 + len(expected_messages))
                published.clear()
                sp = stack + 0xF008
                u.mem_write(sp, struct.pack("<Q", done))
                u.reg_write(r.UC_X86_REG_RSP, sp)
                u.reg_write(r.UC_X86_REG_RCX, game)
                u.reg_write(r.UC_X86_REG_EFLAGS, 2)
                u.reg_write(r.UC_X86_REG_MXCSR, 0x1F80)
                u.emu_start(FIRST, 0, count=2000)
                assert u.reg_read(r.UC_X86_REG_RIP) == done
                assert bytes(u.mem_read(game, 0x2000)) == expected
                assert bytes(u.mem_read(rows, len(retained) * 32)) == b"".join(retained)
                assert published == expected_messages
                assert bytes(u.mem_read(queue, 32)) == b"P" * 32
                assert bytes(u.mem_read(queue + 32, len(expected_messages) * 32)) == b"".join(expected_messages)
                cases.append(dict(now_hex=struct.pack("<f", now).hex(),
                                  deadlines_hex=[struct.pack("<f", value).hex() for value in times],
                                  remaining=[row.hex() for row in retained],
                                  published=[row.hex() for row in expected_messages]))
    source = (ROOT / "crates/azeroth-survivors-re/src/bosses/raid_actions.rs").read_text()
    body = source.split("pub fn advance(&mut self", 1)[1].split("#[cfg(test)]", 1)[0]
    compact = "".join(body.split())
    assert "if!(now>=self.0[index].at){index+=1;continue;}" in compact
    assert compact.index("if!(now>=") < compact.index("letvisual=self.0.remove(index);")
    assert "port.cast_spell(SpellCast" in compact
    assert "fn unordered_visual_times_retain_rows_without_blocking_later_due_rows" in source
    result = dict(schema_version=1,
                  target={key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
                  owner=dict(va=hex(FIRST), end_exclusive=hex(LAST), byte_count=LAST-FIRST,
                             sha256=digest(raw)), native_queue_cases=len(cases),
                  cases_sha256=digest(json_text(cases).encode()),
                  queue_layout="Game+5c0/5c8/5d0, 32-byte records: source0/deadline8/spell12/position16",
                  source_refs=["crates/azeroth-survivors-re/src/bosses/raid_actions.rs"],
                  limits=["Memmove and the returned 32-byte spell-packet record are explicit host seams.",
                          "Preallocated queue capacity excludes allocator growth; actual serializer/client/render behavior is not executed.",
                          "Source queue regression is authored but not compiled or executed; whole Game and original/rebuilt parity remain unverified."])
    if args.stage:
        STAGE.parent.mkdir(parents=True, exist_ok=True)
        STAGE.write_text(json_text(result))
    else:
        assert result == json.loads(KEPT.read_text()), "Delayed visual evidence drift"
    print(json_text(dict(target_sha256=SHA, native_queue_cases=len(cases), source_guards="pass",
                         compilation_run=False, game_run=False)))


if __name__ == "__main__":
    main()
