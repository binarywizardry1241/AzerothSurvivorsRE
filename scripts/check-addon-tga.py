#!/usr/bin/env python3
"""Replay the selected EXE's #54 TGA decoder without compiling or launching it.

--prepare-rea stages a scoped Ghidra plan beneath runtime/.
--collect stages its compact evidence manifest there for review/promotion.
The default checks the retained manifest, original instructions and source wiring.
--atlas optionally checks the unchanged addon atlas from a project-local copy.
"""

import argparse
import hashlib
import itertools
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
START, END = 0x145C30ED0, 0x145C31E46
WORK = ROOT / "runtime/tga-0.113.2"
RETAINED = ROOT / "docs/analysis/evidence/0.113.2/addon-gold"
ATLAS_SHA = "7e2b57533361f224e01171dbc857247b04096fdc33e58364901b230b75b270be"
ATLAS_RGBA_SHA = "df19b43c5a4b9af721a620bce4b638202b2c6c4004b9a8e23ee8d46361b4a60c"


def digest(data):
    return hashlib.sha256(data).hexdigest()


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + "\n"


def tga(kind, width, height, depth, descriptor, data):
    header = bytearray(18)
    header[2] = kind
    struct.pack_into("<HHBB", header, 12, width, height, depth, descriptor)
    return bytes(header) + data


class NativeDecoder:
    """Whole original function; only allocation/copy/free/platform-probe seams."""

    def __init__(self, raw):
        for directory in ("runtime/camera-recovery-0.105.0/python-libs",
                          "runtime/armory-recovery/python-libs"):
            sys.path.insert(0, str(ROOT / directory))
        import unicorn as u
        from unicorn import x86_const as x

        self.x = x
        self.cpu = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
        self.cpu.mem_map(START & ~0xFFF, 0x2000)
        self.cpu.mem_write(START, raw)
        for address in (0x140002000, 0x145CF9000):
            self.cpu.mem_map(address, 0x1000)
        self.mem, self.stack, self.heap, self.done = (
            0x200000000, 0x300000000, 0x400000000, 0x500000000)
        for address, size in ((self.mem, 0x20000), (self.stack, 0x10000),
                              (self.heap, 0x200000), (self.done, 0x1000)):
            self.cpu.mem_map(address, size)
        # Stop at original error branches, before Rust error formatting/boxing. This records
        # rejection, without substituting a reconstructed header-admission function.
        self.errors = {
            0x145C31AED, 0x145C31B22, 0x145C31B36, 0x145C31B6C,
            0x145C31B9D, 0x145C31BD4, 0x145C31C16, 0x145C31C36,
            0x145C31C49, 0x145C31C60, 0x145C31C73, 0x145C31D25,
            0x145C3165C,
        }
        self.cpu.hook_add(u.UC_HOOK_CODE, self.hook)

    def reg(self, name):
        return self.cpu.reg_read(getattr(self.x, "UC_X86_REG_" + name))

    def setreg(self, name, value):
        self.cpu.reg_write(getattr(self.x, "UC_X86_REG_" + name), value)

    def ret(self, value=None):
        if value is not None:
            self.setreg("RAX", value)
        rsp = self.reg("RSP")
        address = struct.unpack("<Q", self.cpu.mem_read(rsp, 8))[0]
        self.setreg("RSP", rsp + 8)
        self.setreg("RIP", address)

    def hook(self, cpu, address, size, unused):
        if address == self.done:
            cpu.emu_stop()
        elif address in self.errors:
            self.error = address
            cpu.emu_stop()
        elif address in (0x1400021C0, 0x1400021F0):
            count = self.reg("RCX")
            pointer = self.next
            self.next += ((count + 15) // 16) * 16 + 16
            assert self.next < self.heap + 0x200000
            cpu.mem_write(pointer, bytes(count))
            self.ret(pointer)
        elif address in (0x1400021D0, 0x140002200):
            self.ret()
        elif address == 0x145CF998B:
            to, source, count = self.reg("RCX"), self.reg("RDX"), self.reg("R8")
            cpu.mem_write(to, bytes(cpu.mem_read(source, count)))
            self.ret(to)

    def decode(self, data):
        assert len(data) <= 0x1FF00
        self.next, self.error = self.heap, None
        self.cpu.mem_write(self.mem, bytes(0x100))
        self.cpu.mem_write(self.mem + 0x100, data)
        self.cpu.mem_write(self.stack + 0x8000, struct.pack("<Q", self.done))
        for name, value in (("RSP", self.stack + 0x8000), ("RCX", self.mem),
                            ("RDX", self.mem + 0x100), ("R8", len(data)), ("EFLAGS", 2)):
            self.setreg(name, value)
        self.cpu.emu_start(START, self.done, count=1000000)
        if self.error is not None:
            return None
        assert self.reg("RIP") == self.done, hex(self.reg("RIP"))
        width, height, capacity, pointer, length = struct.unpack(
            "<IIQQQ", self.cpu.mem_read(self.mem, 32))
        assert capacity == length == width * height * 4
        return width, height, bytes(self.cpu.mem_read(pointer, length))


def replay(raw):
    decoder = NativeDecoder(raw)
    rows = []

    def check(data, width, height, rgba, label):
        result = decoder.decode(data)
        assert result == (width, height, rgba), label
        rows.append([label, digest(data), digest(rgba)])

    def oriented(pixels, origin):
        return b"".join(pixels[(y if origin & 32 else 1-y) * 2
                               + (1-x if origin & 16 else x)]
                        for y in range(2) for x in range(2))

    for depth, kind, alpha, origin in itertools.product(
            (24, 32), (2, 10), range(16), (0, 16, 32, 48)):
        pixels = [bytes([3+i, 13+i, 23+i] + ([i*77] if depth == 32 else []))
                  for i in range(4)]
        data = b"".join(pixels)
        data = bytes([3]) + data if kind == 10 else data
        rgba = [bytes([p[2], p[1], p[0], p[3] if depth == 32 else 255]) for p in pixels]
        check(tga(kind, 2, 2, depth, origin | alpha, data), 2, 2,
              oriented(rgba, origin), [depth, kind, alpha, origin])
    for alpha in range(256):
        check(tga(2, 1, 1, 32, 0x20, bytes([3, 62, 121, alpha])),
              1, 1, bytes([121, 62, 3, alpha]), ["pixel-alpha", alpha])
    for descriptor in range(64):
        check(tga(10, 2, 2, 32, descriptor, bytes([0x83, 3, 62, 121, 77])),
              2, 2, bytes([121, 62, 3, 77]) * 4, ["rle-run", descriptor])
    # Horizontal-origin source indexing is shared by gray and colour-mapped consumers too.
    for kind, origin in itertools.product((3, 11), (0, 16, 32, 48)):
        data = bytes([3, 13, 23, 33])
        data = bytes([3]) + data if kind == 11 else data
        rgba = [bytes([v, v, v, 255]) for v in (3, 13, 23, 33)]
        check(tga(kind, 2, 2, 8, origin, data), 2, 2, oriented(rgba, origin), [kind, origin])
    for kind, origin, bits in itertools.product((1, 9), (0, 16, 32, 48), (15, 16, 24, 32)):
        if bits in (15, 16):
            palette = struct.pack("<HHHH", 0xFC00, 0x03E0, 0x801F, 0xFFFF)
            rgba = [bytes([255, 0, 0, 255]), bytes([0, 255, 0, 0 if bits == 16 else 255]),
                    bytes([0, 0, 255, 255]), bytes([255, 255, 255, 255])]
        else:
            pixels = [bytes([3+i, 13+i, 23+i] + ([i*77] if bits == 32 else []))
                      for i in range(4)]
            palette = b"".join(pixels)
            rgba = [bytes([p[2], p[1], p[0], p[3] if bits == 32 else 255]) for p in pixels]
        data = bytes([0, 1, 2, 3])
        data = bytes([3]) + data if kind == 9 else data
        header = bytearray(tga(kind, 2, 2, 8, origin, b""))
        header[1], header[5], header[7] = 1, 4, bits
        check(bytes(header) + palette + data, 2, 2, oriented(rgba, origin), [kind, origin, bits])
    rejected = []
    invalid = [b"", bytes(17)]
    invalid += [tga(kind, 1, 1, depth, 0x20, bytes(8)) for kind, depth in
                itertools.product((2, 10), (0, 1, 7, 8, 15, 16, 25, 31, 33, 39, 255))]
    invalid += [tga(kind, 1, 1, 32, 0x20, bytes(4)) for kind in (0, 4, 8, 12, 255)]
    invalid += [tga(2, 1, 1, 32, 0x20, bytes(3)), tga(10, 1, 1, 32, 0x20, b""),
                tga(10, 1, 1, 32, 0x20, bytes([0x80, 1, 2, 3])),
                tga(10, 1, 1, 32, 0x20, bytes([0, 1, 2, 3]))]
    for data in invalid:
        assert decoder.decode(data) is None, data.hex()
        rejected.append([digest(data), hex(decoder.error)])
    return dict(valid_cases=len(rows), valid_sha256=digest(encoded(rows).encode()),
                rejection_cases=len(rejected), rejection_sha256=digest(encoded(rejected).encode()))


def source_check():
    source = (ROOT / "crates/benilla-formats/src/tga.rs").read_text().split("#[cfg(test)]", 1)[0]
    assert "depth less alpha bits" not in source and "let alpha_bits" not in source
    for text in ("(24, false, false) => 3", "(32, false, false) => 4",
                 "let right_to_left = descriptor & 0x10 != 0", "descriptor & 0x20 != 0",
                 "src_y * width as usize + src_x", "pixels[s + 3]"):
        assert text in source, text
    assets = (ROOT / "crates/benilla-assets/src/world_assets/mod.rs").read_text()
    candidate = assets.split("fn decode_candidate(", 1)[1].split("fn decode_sprite_bytes(", 1)[0]
    assert candidate.index("if let Ok((width, height, rgba))") < candidate.index("warn!(")
    assert "tga_to_rgba(bytes)" in assets
    assert "zero_declared_alpha_retains_the_texture_pixels" in assets


def assembly_check(raw):
    path = ROOT / "docs/analysis/evidence/0.113.2/tga-decoder.asm"
    current, payload = START, bytearray()
    for line in path.read_text().splitlines():
        if not line or line.startswith(";"):
            continue
        address, rest = line.split(": ", 1)
        assert int(address, 16) == current
        part = bytes.fromhex(rest.split()[0])
        payload.extend(part)
        current += len(part)
    assert current == END and bytes(payload) == raw
    return digest(path.read_bytes())


def atlas_check(path, raw):
    path = path.resolve()
    assert path.is_relative_to(ROOT), "Use a project-local addon input copy"
    data = path.read_bytes()
    assert digest(data) == ATLAS_SHA
    assert data[:18].hex() == "000002000000000000000000400040002020"
    result = NativeDecoder(raw).decode(data)
    assert result[:2] == (64, 64)
    rgba = result[2]
    assert digest(rgba) == ATLAS_RGBA_SHA
    assert bytes(rgba[3::4]) == data[21::4] and len(set(rgba[3::4])) == 172
    crop = b"".join(rgba[y*64*4:y*64*4+32*4] for y in range(32))
    return dict(input_sha256=ATLAS_SHA, rgba_sha256=ATLAS_RGBA_SHA,
                top_left_quadrant_sha256=digest(crop), distinct_alpha_values=172)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare-rea", action="store_true")
    parser.add_argument("--collect", action="store_true")
    parser.add_argument("--atlas", type=Path)
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Evidence belongs only to selected 0.113.2 bytes"
    image = target_bytes(target)
    pe = load_script("tga_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    offset = pe.rva_offset(START - pe.image_base)
    raw = image[offset:offset + END-START]
    if args.prepare_rea:
        WORK.mkdir(parents=True, exist_ok=True)
        (WORK / "decode.bin").write_bytes(raw)
        plan = dict(target=str((WORK / "decode.bin").relative_to(ROOT)),
                    output=str((WORK / "ghidra").relative_to(ROOT)), init_timeout=60, timeout=240,
                    open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(START)),
                    environment=dict(REA_GHIDRA_STARTUP_TIMEOUT_MS="180000",
                                     REA_GHIDRA_DISABLED_ANALYZERS="Function ID,Function Start Search,Create Address Tables"),
                    operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(START)), label="decoder")])
        (WORK / "plan.json").write_text(encoded(plan))
        print("Prepared runtime/tga-0.113.2/plan.json for scripts/rea-batch.py")
        return
    result = replay(raw)
    if args.collect:
        bundle = json.loads((WORK / "ghidra/evidence-bundle.json").read_text())
        record = next(r for r in bundle["records"] if r["operation"] == "procedure_pseudo_code")
        assert record["subject"]["digest"]["sha256"] == digest(raw)
        assert record["provider"]["id"] == "ghidra"
        assert record["parameters"]["procedure"] == hex(START)
        manifest = dict(target_version="0.113.2", target_sha256=SHA,
                        function=dict(start=hex(START), end_exclusive=hex(END), file_offset=hex(offset),
                                      byte_count=len(raw), sha256=digest(raw),
                                      canonical_assembly="docs/analysis/evidence/0.113.2/tga-decoder.asm"),
                        ghidra=dict(evidence_id=record["evidence_id"],
                                    analysis_profile_digest=record["analysis_profile"]["digest"],
                                    pseudocode_sha256=digest(record["normalized_result"].encode())),
                        replay=result,
                        limits=["Whole decoder's original instructions; allocation/copy/free/probe seams. Error formatting is stopped at native rejection branches.",
                                "Raw Ghidra import omits external code/data and uses generic ABI; Windows registers and exact PE instructions own interpretation.",
                                "Source guards are tracing, not reconstructed Rust execution. No compilation, game, GPU/addon execution or original/rebuilt parity."])
        manifest["function"]["assembly_sha256"] = assembly_check(raw)
        if args.atlas:
            manifest["atlas"] = atlas_check(args.atlas, raw)
        out = WORK / "curated"
        out.mkdir(exist_ok=True)
        (out / "manifest.json").write_text(encoded(manifest))
        print("Staged", out.relative_to(ROOT))
    else:
        manifest = json.loads((RETAINED / "manifest.json").read_text())
        assert manifest["target_sha256"] == SHA and manifest["function"]["sha256"] == digest(raw)
        assert manifest["target_version"] == "0.113.2"
        assert manifest["function"]["start"] == hex(START)
        assert manifest["function"]["end_exclusive"] == hex(END)
        assert manifest["function"]["byte_count"] == len(raw)
        assert manifest["function"]["file_offset"] == hex(offset)
        assert manifest["replay"] == result
        assert manifest["function"]["canonical_assembly"] == "docs/analysis/evidence/0.113.2/tga-decoder.asm"
        assert manifest["function"]["assembly_sha256"] == assembly_check(raw)
        source_check()
        if args.atlas:
            assert manifest["atlas"] == atlas_check(args.atlas, raw)
    print(encoded(result).strip())


if __name__ == "__main__":
    main()
