#!/usr/bin/env python3
"""Verify the current mob movement consumer extracts and bounded native contracts.

Read-only: no compilation, original/rebuilt application, or geometry loading.
The idle ray's result is an explicit supplied seam, not an executed world query.
"""
import hashlib
import importlib.util
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
KEPT = ROOT / "docs/analysis/evidence/0.113.2/ground-handoff"


def main():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "consumer evidence belongs to a different target"
    data = target_bytes(target)
    spec = importlib.util.spec_from_file_location("handoff_pe", ROOT / "scripts/inventory-executable.py")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    pe = module.PE(data)
    sys.path[:0] = [str(ROOT / "runtime/armory-recovery/python-libs"),
                    str(ROOT / "runtime/camera-recovery-0.105.0/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    from unicorn import x86_const as r

    manifest = json.loads((KEPT / "manifest.json").read_text())
    assert manifest["target_sha256"] == SHA
    for source in manifest["reviewed_source"]:
        assert hashlib.sha256((ROOT / source["path"]).read_bytes()).hexdigest() == source["sha256"], source["path"]
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    counts = 0
    for owner in manifest["owners"]:
        start = int(owner["va"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + owner["byte_count"]]
        assert hashlib.sha256(raw).hexdigest() == owner["sha256"], owner["role"]
    for row in manifest["ranges"]:
        start = int(row["va"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16), row["role"]
        raw = data[offset:offset + row["byte_count"]]
        assert hashlib.sha256(raw).hexdigest() == row["sha256"], row["role"]
        instructions = list(decoder.disasm(raw, start))
        assert instructions[-1].address + instructions[-1].size == start + len(raw)
        text = "\n".join(f"{i.address:x}: {i.mnemonic} {i.op_str}".rstrip() for i in instructions) + "\n"
        assert (KEPT / row["assembly"]).read_text() == text, row["role"]
        counts += len(instructions)

    def packf(value):
        return struct.pack("<f", value)

    def bits(value):
        return struct.unpack("<I", packf(value))[0]

    def unpackf(raw):
        return struct.unpack("<f", raw)[0]

    def machine():
        u = Uc(UC_ARCH_X86, UC_MODE_64)
        for start, end in [(0x1411a2000, 0x1411a5000), (0x145fa3000, 0x145fa4000)]:
            u.mem_map(start, end - start)
            offset = pe.rva_offset(start - pe.image_base)
            u.mem_write(start, data[offset:offset + end - start])
        u.mem_map(0x100000, 0x10000)
        u.reg_write(r.UC_X86_REG_RBP, 0x101000)
        u.reg_write(r.UC_X86_REG_RSP, 0x100800)
        return u

    def writef(u, at, value):
        u.mem_write(at, packf(value))

    def qword(u, at, value):
        u.mem_write(at, struct.pack("<Q", value))

    def dword(u, at, value):
        u.mem_write(at, struct.pack("<I", value))

    def run(u, start, stops, ray=None):
        observed = []

        def hook(uc, pc, size, _):
            if pc in stops:
                observed.append(pc)
                uc.emu_stop()
            elif pc == 0x1411a45cb and ray is not None:
                # The real collision ray is not executed. Retain the call's
                # exact supplied origin/direction/reach before returning its fixture.
                origin = uc.reg_read(r.UC_X86_REG_R8)
                direction = uc.reg_read(r.UC_X86_REG_R9)
                assert struct.unpack("<3f", uc.mem_read(direction, 12)) == (0., -1., 0.)
                assert bytes(uc.mem_read(uc.reg_read(r.UC_X86_REG_RSP) + 0x20, 4)) == struct.pack("<I", 0x4080e38e)
                assert unpackf(uc.mem_read(origin + 4, 4)) == ray[0]
                result = uc.reg_read(r.UC_X86_REG_RCX)
                dword(uc, result, int(ray[1] is not None))
                writef(uc, result + 8, ray[1] or 0.)
                uc.reg_write(r.UC_X86_REG_RIP, pc + size)

        u.hook_add(UC_HOOK_CODE, hook)
        u.emu_start(start, 0, count=500)
        assert len(observed) == 1, f"consumer slice did not reach a declared exit: {observed}"
        return observed[0]

    cases = 0
    # Current native conversion stores all XYZ, including ground-path Z.
    for point in [(1., 2., 10.), (-5., 3., -12.), (0., 0., 40.), (0.5, -0.25, 3.)]:
        u = machine()
        qword(u, 0x101000 + 0x140, 0x104000)
        qword(u, 0x101000 + 0x178, 0x105000)
        u.mem_write(0x101000 + 0x198, struct.pack("<3f", *point))
        writef(u, 0x105000 + 0x14, 100.)
        run(u, 0x1411a282d, {0x1411a2878})
        assert struct.unpack("<3f", u.mem_read(0x105000 + 0x10, 12)) == (-point[1], point[2], -point[0])
        cases += 1
    # Reuse the old seat only when current Y is the clamp's last written Y.
    for current, written, old_seat, expected in [(20., 20., 10., 10.), (10., 20., 10., 10.),
                                               (9., 20., 10., 9.), (-5., -5., 7., 7.)]:
        u = machine()
        u.reg_write(r.UC_X86_REG_RAX, 0x104000)
        u.reg_write(r.UC_X86_REG_RDX, 0x105000)
        writef(u, 0x104000 + 0x28, old_seat)
        writef(u, 0x104000 + 0x2c, written)
        writef(u, 0x105000 + 0x14, current)
        run(u, 0x1411a3f48, {0x1411a3f6b})
        assert u.reg_read(r.UC_X86_REG_XMM2) & 0xffffffff == bits(expected)
        cases += 1
    # Ground continuation requires every field of the new spline token.
    for present, memo_id, seconds, nanos, expected in [
            (True, 17, 100, 200, 0x1411a4192),
            (False, 17, 100, 200, 0x1411a4547),
            (True, 18, 100, 200, 0x1411a4547),
            (True, 17, 101, 200, 0x1411a4547),
            (True, 17, 100, 201, 0x1411a4547),
            (True, 17, 100, 0xffffffff, 0x1411a4547)]:
        u = machine()
        qword(u, 0x101000 + 0x568, 0x104000 if present else 0)
        qword(u, 0x101000 + 0x598, 0x105000)
        u.reg_write(r.UC_X86_REG_RCX, 0x105000)
        dword(u, 0x105000 + 0x48, 17)
        qword(u, 0x105000 + 0x28, 100)
        dword(u, 0x105000 + 0x30, 200)
        dword(u, 0x104000, memo_id)
        qword(u, 0x104000 + 8, seconds)
        dword(u, 0x104000 + 0x10, nanos)
        assert run(u, 0x1411a4111, {0x1411a4192, 0x1411a4547, 0x1411a453d}) == expected
        cases += 1
    # The cache-hit branch skips the unit without touching any memo byte.
    # On the next displacement, its unchanged old token must take the idle arm.
    for legacy in [0, 1]:
        for sparse in [0, 1]:
            for old_path in [False, True]:
                u = machine()
                memo, transform, epoch, spline = 0x104000, 0x105000, 0x106000, 0x107000
                u.reg_write(r.UC_X86_REG_RAX, memo)
                qword(u, 0x101000 + 0x5c0, transform)
                qword(u, 0x101000 + 0x2e0, epoch)
                qword(u, 0x101000 + 0x598, spline)
                qword(u, 0x101000 + 0x568, memo)
                u.mem_write(0x101000 + 0x5a2, bytes([legacy]))
                u.mem_write(0x101000 + 0x5d7, bytes([sparse]))
                dword(u, memo, 17)
                qword(u, memo + 8, 100)
                dword(u, memo + 0x10, 200 if old_path else 0xffffffff)
                writef(u, memo + 0x18, 1.)
                writef(u, memo + 0x1c, 2.)
                qword(u, memo + 0x20, 5)
                writef(u, memo + 0x28, 10.)
                writef(u, memo + 0x2c, 20.)
                u.mem_write(memo + 0x34, b"\x01")
                u.mem_write(transform + 0x10, struct.pack("<3f", 1., 20., 2.))
                qword(u, epoch, 5)
                dword(u, spline + 0x48, 18)
                qword(u, spline + 0x28, 101)
                dword(u, spline + 0x30, 201)
                before = bytes(u.mem_read(memo, 0x38))
                writes = []

                def memo_write(uc, access, address, size, value, _):
                    if address < memo + 0x38 and address + size > memo:
                        writes.append((address, size))

                u.hook_add(UC_HOOK_MEM_WRITE, memo_write)
                assert run(u, 0x1411a3f00, {0x1411a3fea, 0x1411a3757, 0x1411a3b43}) == (
                    0x1411a3b43 if sparse else 0x1411a3757)
                assert not writes, "a native cache hit must not write any memo field"
                assert bytes(u.mem_read(memo, 0x38)) == before
                u.reg_write(r.UC_X86_REG_RCX, spline)
                assert run(u, 0x1411a4111, {0x1411a4192, 0x1411a4547, 0x1411a453d}) == 0x1411a4547
                assert not writes and bytes(u.mem_read(memo, 0x38)) == before
                cases += 1
    slack = unpackf(data[pe.rva_offset(0x145fa3864 - pe.image_base):][:4])
    assert bits(slack) == bits(1. / 36.)
    # Supplied hit/miss fixtures establish selection only, not real geometry.
    for seat, distance in [(10., None), (10., 0.), (10., 2.), (-5., None)]:
        u = machine()
        qword(u, 0x101000 + 0x5c0, 0x105000)
        writef(u, 0x101000 + 0x5d0, seat)
        u.reg_write(r.UC_X86_REG_XMM13, bits(slack))
        origin = unpackf(packf(seat + slack))
        run(u, 0x1411a4547, {0x1411a460d, 0x1411a464c}, ray=(origin, distance))
        expected = seat if distance is None else unpackf(packf(origin - distance))
        assert u.reg_read(r.UC_X86_REG_XMM15) & 0xffffffff == bits(expected)
        cases += 1
    print(f"0.113.2 ground handoff: {len(manifest['owners'])} owner hashes, "
          f"{len(manifest['ranges'])} exact extracts/{counts} instructions, {cases} native cases passed")


if __name__ == "__main__":
    main()
