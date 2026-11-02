#!/usr/bin/env python3
"""Replay the bounded 0.117.0 marker draw-state contract without compiling.

Original paint instructions run in Unicorn with preallocated synthetic vectors.
The sole intercepted callee is the shared draw submission boundary; no renderer,
game, server, filesystem scenario or reconstructed Rust code is executed.
"""
import argparse
import hashlib
import json
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293"
OWNERS = {
    "paint": (0x1401371A0, 0x140137666,
              "a633beaaebdfb63f8bf1adddbb7eca68ce42e590706eb2549eb76f2be77584a7"),
    "draw": (0x14014A830, 0x14014BA18,
             "55316fc1b145ea0da7c8e7750f66f67e0ff39a91a3d411390a113c23496ec440"),
    "ground_fx": (0x14179DBD0, 0x14179F9F1,
                  "b29abc47dc3cf994608b81b52c4fa8c9fc7d21ec059f51c632157e227c2180a8"),
}
SUBMIT = 0x141807840
TOWER = (0x14014B857, 0x14014B92D)
OUTPUT = ROOT / "runtime/0.117.0/marker-order/check.json"


def digest(data):
    return hashlib.sha256(data).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true", help="save compact results under runtime/")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["version"] == "0.117.0" and target["sha256"] == SHA
    data = target_bytes(target)
    pe = load_script("marker_order_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    for directory in ("runtime/camera-recovery-0.105.0/python-libs", "runtime/armory-recovery/python-libs"):
        path = ROOT / directory
        if path.is_dir():
            sys.path.insert(0, str(path))
    import capstone
    import unicorn
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    from unicorn import x86_const as r

    def raw(address, length):
        offset = pe.rva_offset(address - pe.image_base)
        assert offset is not None and offset >= 0
        value = data[offset:offset + length]
        assert len(value) == length
        return value

    extents = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    owners = []
    for name, (start, end, expected) in OWNERS.items():
        value = raw(start, end - start)
        assert extents[start] == end and digest(value) == expected, name
        assert sum(i.size for i in decoder.disasm(value, start)) == len(value), name
        owners.append(dict(role=name, start=hex(start), end_exclusive=hex(end),
                           sha256=expected, file_offset=hex(pe.rva_offset(start - pe.image_base))))
    kept = ROOT / "docs/analysis/evidence/0.117.0/marker-order"
    proof = json.loads((kept / "manifest.json").read_text())
    assert proof["target"]["sha256"] == SHA
    for row in proof["ranges"]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        assert digest(raw(start, end - start)) == row["sha256"]
        assert digest((kept / row["extract"]).read_bytes()) == row["extract_sha256"]
    dispatch = proof["style_dispatch"]
    table = bytes.fromhex(dispatch["hex"])
    assert raw(int(dispatch["address"], 16), len(table)) == table
    assert digest(table) == dispatch["sha256"]
    assert raw(0x140137519, 10) == bytes.fromhex("48b900b0364600800000")
    assert raw(0x1401375D7, 5) == bytes.fromhex("e864026d01")
    assert 0x1401375D7 + 5 + struct.unpack("<i", raw(0x1401375D8, 4))[0] == SUBMIT
    assert struct.unpack("<fI", raw(0x14013751B, 8)) == (11692.0, 32768)
    assert raw(0x14014B909, 10) == bytes.fromhex("c785e800000000000046")
    assert raw(0x14179F87E, 10) == bytes.fromhex("48b80000004600800000")
    assert struct.unpack("<fI", raw(0x14179F880, 8)) == (8192.0, 32768)
    assert raw(0x14179F8C2, 3) == bytes.fromhex("41b001")
    assert raw(0x14179F8CC, 1) == b"\xe8"
    assert 0x14179F8CC + 5 + struct.unpack("<i", raw(0x14179F8CD, 4))[0] == 0x141807670

    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    mapped = set()
    mem, size = 0x200000000, 0x40000
    stop = mem + size - 16
    machine.mem_map(mem, size)

    def demand(uc, access, address, length, value, unused):
        # Only exact installed-image bytes may satisfy an unexpected native read.
        page = address & ~4095
        assert page not in mapped
        uc.mem_map(page, 4096)
        uc.mem_write(page, raw(page, 4096))
        mapped.add(page)
        return True

    machine.hook_add(UC_HOOK_MEM_UNMAPPED, demand)
    put = lambda address, fmt, *values: machine.mem_write(address, struct.pack("<" + fmt, *values))
    get = lambda address, fmt: struct.unpack("<" + fmt, machine.mem_read(address, struct.calcsize("<" + fmt)))
    captured = []
    mode = "paint"

    def hook(uc, address, instruction_size, unused):
        if address == SUBMIT:
            assert mode == "paint"
            arg = bytes(uc.mem_read(uc.reg_read(r.UC_X86_REG_RCX), 160))
            order, raster = struct.unpack_from("<fi", arg, 0x78)
            assert (order, raster) == (11692.0, 32768)
            assert struct.unpack_from("<f", arg, 0x80)[0] == 0.0
            assert arg[0x84:0x87] == bytes(3)
            captured.append(dict(order=order, raster_bias=raster, argument_sha256=digest(arg)))
            sp = uc.reg_read(r.UC_X86_REG_RSP)
            uc.reg_write(r.UC_X86_REG_RIP, get(sp, "Q")[0])
            uc.reg_write(r.UC_X86_REG_RSP, sp + 8)
            return
        start, end = OWNERS["paint"][:2] if mode == "paint" else TOWER
        assert start <= address < end, f"Unexpected native callee/branch: {address:#x}"

    machine.hook_add(UC_HOOK_CODE, hook)
    paint_cases, submits, skipped_cases, empty_cases = 0, 0, 0, 0
    profile_counts = {}
    # These input boundaries test submission admission and invariant draw fields,
    # without independently transcribing color, pulse or paint arithmetic.
    gains = ((1.0, 1.0), (0.75, 0.5), (0.0, 1.0), (1.0, 0.0), (-0.25, 1.0))
    for style in range(6):
        profile_counts[str(style)] = {"profiles": 0, "submissions": 0}
        for occupied in (False, True):
            for fading in (False, True):
                for burst in (0.0, 0.5, 1.0):
                    for pulse, fade in gains:
                        for vertex_count in (0, 3):
                            machine.mem_write(mem, bytes(size))
                            put(mem, "9Q", *(mem + n * 0x100 for n in range(1, 10)))
                            put(mem + 0x100, "3f", 1.0, 0.5, 0.12)
                            put(mem + 0x230, "I", int(fading))
                            put(mem + 0x27C, "B", int(occupied))
                            put(mem + 0x300, "f", burst)
                            put(mem + 0x400, "f", 1.6 if fading else 1.0)
                            put(mem + 0x500, "f", pulse)
                            put(mem + 0x600, "f", fade)
                            put(mem + 0x700, "Q", mem + 0x4000)
                            put(mem + 0x710, "Q", mem + 0x5000)
                            put(mem + 0x800, "Q", 0x12345678)
                            put(mem + 0x900, "3f", 100.0, 200.0, 3.0)
                            put(mem + 0x1008, "Q", mem + 0x2000)
                            put(mem + 0x1010, "Q", vertex_count)
                            put(mem + 0x102C, "B", style)
                            put(mem + 0x4000, "3Q", 128, mem + 0x6000, 0)
                            for vertex in range(3):
                                put(mem + 0x2000 + vertex * 36, "9f",
                                    float(vertex), 0.0, 0.0, 0.25, 0.75, 0.2, 0.4, 0.6, 1.0)
                            sp = mem + 0x30008
                            put(sp, "Q", stop)
                            machine.reg_write(r.UC_X86_REG_RCX, mem)
                            machine.reg_write(r.UC_X86_REG_RDX, mem + 0x1000)
                            machine.reg_write(r.UC_X86_REG_RSP, sp)
                            captured.clear()
                            machine.emu_start(OWNERS["paint"][0], stop, count=10000)
                            assert machine.reg_read(r.UC_X86_REG_RIP) == stop
                            admitted = (vertex_count != 0 and pulse * fade > 0.0 and
                                        not (style == 4 and occupied) and not (style == 5 and not occupied))
                            expected_count = (1 if style in (0, 2) else 2) if admitted else 0
                            assert len(captured) == expected_count, (style, occupied, fading, burst, pulse, fade, vertex_count)
                            assert get(mem + 0x4010, "Q")[0] == 3 * len(captured)
                            paint_cases += 1
                            submits += len(captured)
                            skipped_cases += int(not captured)
                            empty_cases += int(vertex_count == 0)
                            profile_counts[str(style)]["profiles"] += 1
                            profile_counts[str(style)]["submissions"] += len(captured)

    # Replay the separate tower constructor with varied incoming data. The slice
    # ends before its vertex copying/submission path and has no intercepted calls.
    mode = "tower"
    tower_cases = 0
    for texture in (0, 0x12345678, 0xFFFFFFFFFFFFFFFF):
        for index in (0, 3, 127):
            machine.mem_write(mem, bytes([0xA5]) * size)
            bp = mem + 0x10000
            put(bp + 0x198, "Q", mem + 0x1000)
            put(bp + 0x1A8, "Q", mem + 0x2000)
            put(mem + 0x1010, "I", index)
            put(bp + 0x1B4, "I", index)
            put(bp + 0x208, "Q", texture)
            machine.reg_write(r.UC_X86_REG_RBP, bp)
            machine.emu_start(TOWER[0], TOWER[1], count=1000)
            assert machine.reg_read(r.UC_X86_REG_RIP) == TOWER[1]
            assert get(bp + 0xE8, "fi") == (8192.0, 0)
            assert get(bp + 0xF0, "f")[0] == 0.0
            assert bytes(machine.mem_read(bp + 0xF4, 3)) == bytes(3)
            tower_cases += 1

    source_paths = ["crates/azeroth-survivors-re/src/gameplay/raid_markers.rs",
                    "crates/benilla-world/src/particles/buffer.rs",
                    "crates/benilla-world/src/particles/render.rs", "crates/benilla-world/src/sky_order.rs",
                    "crates/benilla-world/src/ground_fx.rs"]
    source = (ROOT / source_paths[0]).read_text()
    ground, columns = source.split("let columns = geometry::columns", 1)
    def field(text, name):
        return re.search(r"\b" + name + r"\s*:\s*([^,]+),", text).group(1).strip()
    assert float(field(ground, "bias")) == 11692.0
    assert int(field(ground, "raster_bias")) == 32768
    assert field(ground, "no_depth_test") == "false"
    assert float(field(columns, "bias")) == 8192.0
    assert int(field(columns, "raster_bias")) == 0
    assert field(columns, "no_depth_test") == "false"
    renderer = (ROOT / source_paths[2]).read_text()
    ladder = (ROOT / source_paths[3]).read_text()
    assert "distance: rangefinder.distance(&draw.anchor) + draw.bias" in renderer
    assert "no_depth_test: draw.no_depth_test" in renderer
    assert re.search(r"if key\.no_depth_test[^}]+CompareFunction::Always", renderer, re.S)
    assert "CompareFunction::GreaterEqual" in renderer
    assert re.search(r"pub const GROUND_FX:\s*f32\s*=\s*8192\.0;", ladder)
    assert re.search(r"pub const DECAL_RASTER:\s*i32\s*=\s*32768;", ladder)
    ground_fx = (ROOT / source_paths[4]).read_text()
    assert field(ground_fx, "bias") == "crate::sky_order::Rung::GROUND_FX"
    assert field(ground_fx, "raster_bias") == "crate::sky_order::Rung::DECAL_RASTER"
    assert "pub bias: f32" in (ROOT / source_paths[1]).read_text()
    # Equal anchors isolate the native order delta; arbitrary world separations
    # and actual occlusion/GPU blending remain outside this static check.
    assert 11692.0 - 8192.0 == 3500.0
    result = dict(schema="as-marker-order-check-v1", target={k: target[k] for k in ("version", "sha256", "size_bytes")},
                  owners=owners, tools=dict(capstone=capstone.__version__, unicorn=unicorn.__version__),
                  paint_profiles=paint_cases, captured_submissions=submits, skipped_profiles=skipped_cases,
                  empty_geometry_profiles=empty_cases, per_style=profile_counts, tower_constructor_profiles=tower_cases,
                  captured_ground_order=11692.0, captured_ground_raster_bias=32768,
                  captured_tower_order=8192.0, captured_tower_raster_bias=0, equal_anchor_order_delta=3500.0,
                  captured_ground_and_tower_slope=0.0, captured_ground_and_tower_zero_flags=[0, 0, 0],
                  native_ground_fx_order=8192.0, native_ground_fx_raster_bias=32768,
                  source_receipts=[dict(path=p, sha256=digest((ROOT / p).read_bytes())) for p in source_paths],
                  limits=["Only exact paint instructions and a bounded separate tower constructor slice execute in Unicorn.",
                          "Preallocated synthetic memo, marker, vertex and effect-stream memory; allocation paths are forbidden.",
                          "The sole external paint callee is captured at shared submission 0x141807840, without executing it.",
                          "No Python transcription of native color/paint arithmetic; the checker asserts admission and invariant draw fields.",
                          "Source field/consumer guards and equal-anchor ordering do not execute reconstructed Rust or certify all camera/terrain/blending behavior.",
                          "No compilation, game/server/GPU operation, original-game launch or original/rebuilt parity comparison."])
    if args.write:
        OUTPUT.parent.mkdir(parents=True, exist_ok=True)
        OUTPUT.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, separators=(",", ":")))


if __name__ == "__main__":
    main()
