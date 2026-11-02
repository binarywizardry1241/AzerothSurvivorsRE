#!/usr/bin/env python3
"""Recover current locale data and replay bounded language contracts without a build/game.

--collect stages compact evidence under runtime/ for review. --check verifies
evidence and live consumers; --evidence-dir may select staged evidence.
Native file/environment/hash/allocator calls are explicit fixture seams; no native
OS code executes and no player state is read or written.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import artifact_path, latest_target

ROOT = Path(__file__).resolve().parents[1]
SHA = "dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b"
WORK = ROOT / "runtime/localization-0.108.0"
RETAINED = ROOT / "docs/analysis/evidence/0.108.0/localization"
ASSETS = ROOT / "crates/azeroth-survivors-re/assets/locales"
TABLE = 0x146E95450
RANGES = {
    "lookup": (0x1458E5790, 0x1458E59D3),
    "select": (0x1458E59E0, 0x1458E5B37),
    "startup": (0x1458E6130, 0x1458E68E8),
    "persist": (0x1458E7200, 0x1458E7247),
    "directory": (0x1458E8400, 0x1458E85E8),
    "file-write": (0x1458E81C0, 0x1458E8333),
    "file-read": (0x1458E9450, 0x1458E95A5),
}
LANGUAGES = ["en", "pl", "cs", "de", "pt", "es", "fr", "ro", "tr", "ru", "uk", "zh", "ja", "ko"]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def encoded(value):
    return json.dumps(value, ensure_ascii=False, indent=2) + "\n"


def recover(data, pe):
    def blob(address, count):
        at = pe.rva_offset(address - pe.image_base)
        result = data[at:at + count]
        assert len(result) == count
        return result

    def span(address, count):
        return dict(virtual_address=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=count, sha256=digest(blob(address, count)))

    def pair(address):
        pointer, count = struct.unpack("<QQ", blob(address, 16))
        return pointer, blob(pointer, count)

    records, catalogs, payloads = [], {}, {}
    for index, code in enumerate(LANGUAGES):
        address = TABLE + index * 56
        _, native_code = pair(address)
        _, name = pair(address + 16)
        pointer, payload = pair(address + 32)
        assert native_code.decode() == code
        catalog = json.loads(payload)
        assert len(catalog) == (2773 if code == "en" else 2683)
        assert all(isinstance(k, str) and isinstance(v, str) for k, v in catalog.items())
        # Keep repository LF endings; the manifest retains the original CRLF
        # payload identity separately from the normalized source asset.
        output = payload.replace(b"\r\n", b"\n")
        catalogs[code], payloads[code] = catalog, output
        records.append(dict(index=index, code=code, name=name.decode(), cjk=bool(blob(address + 48, 1)[0]),
                            record_virtual_address=hex(address), asset_sha256=digest(output),
                            **span(pointer, len(payload))))
    assert all(set(catalogs[code]) <= set(catalogs["en"]) for code in LANGUAGES)
    assert all(catalogs[code].keys() == catalogs["pl"].keys() for code in LANGUAGES[1:])
    assert blob(0x146E98665, 7) == b"\xc0\x04.txt\x00"
    assert blob(0x146BEB2B0, 8) == b"language"
    proof = dict(target=dict(version="0.108.0", sha256=SHA, path="installed-game/AzerothSurvivors.exe"),
                 table=span(TABLE, 14 * 56), locales=records,
                 native_ranges={name: span(a, b - a) for name, (a, b) in RANGES.items()},
                 selected_index_global="0x1480520d0",
                 catalogs_vector_global="0x14804f5b0",
                 catalogs_lazy_state_global="0x14804f5c0",
                 filename_format=span(0x146E98665, 7), language_key=span(0x146BEB2B0, 8),
                 limits=["Exact embedded data and bounded native instructions, not game observations.",
                         "Catalog presence does not establish complete translated UI or glyph/rendering parity.",
                         "Raw Ghidra slices omit external memory/callees and infer a generic ABI; original PE instructions govern."])
    return catalogs, payloads, proof


def stage_assembly(data, pe):
    """Keep compact, original-PE disassembly with its exact source-byte identity."""
    sys.path.insert(0, str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"))
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for name, (start, end) in RANGES.items():
        offset = pe.rva_offset(start - pe.image_base)
        raw = data[offset:offset + end - start]
        instructions = list(decoder.disasm(raw, start))
        assert instructions[-1].address + instructions[-1].size == end
        header = (f"; 0.108.0 SHA256 {SHA}\n"
                  f"; original PE range {start:#x}..{end:#x} ({end - start} bytes), SHA256 {digest(raw)}\n")
        body = "\n".join(f"{item.address:#x}: {item.mnemonic} {item.op_str}".rstrip()
                         for item in instructions) + "\n"
        (WORK / f"{name}.asm").write_text(header + body)


def native_vectors(data, pe):
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r

    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for s in pe.sections:
        u.mem_write(pe.image_base + s["rva"], data[s["raw_offset"]:s["raw_offset"] + s["raw_size"]])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(heap, 0x400000)
    u.mem_map(stack, 0x200000)
    u.mem_map(done, 4096)
    cursor = heap + 0x10000
    saved, environment, writes = None, {}, []
    admitted = [RANGES[k] for k in ("lookup", "select", "startup", "persist")]

    def get(reg):
        return u.reg_read(reg)

    def q(at):
        return struct.unpack("<Q", u.mem_read(at, 8))[0]

    def put(at, *values):
        u.mem_write(at, struct.pack("<" + "Q" * len(values), *(v & ((1 << 64) - 1) for v in values)))

    def alloc(count):
        nonlocal cursor
        assert 0 <= count < 65536
        at = cursor
        cursor += (count + 31) & ~15
        assert cursor < heap + 0x400000
        return at

    def string(value):
        raw = value.encode()
        at = alloc(len(raw))
        if raw:
            u.mem_write(at, raw)
        return at, len(raw)

    def text(at, count):
        assert count < 65536
        return bytes(u.mem_read(at, count)).decode()

    def ret():
        sp = get(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RIP, q(sp))
        u.reg_write(r.UC_X86_REG_RSP, sp + 8)

    def hook(_, pc, size, __):
        if pc == done:
            u.emu_stop()
            return
        rcx, rdx, r8, r9 = (get(reg) for reg in (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8, r.UC_X86_REG_R9))
        if pc == 0x1458E9450:  # read language.txt; explicit UTF-8 file-result seam
            assert text(rdx, r8) == "language"
            if saved is None:
                put(rcx, -1)
            else:
                at, n = string(saved)
                put(rcx, n, at, n)
        elif pc == 0x145BB61D0:  # only the three native environment reads
            key = text(rdx, r8)
            assert key in ("LC_ALL", "LC_MESSAGES", "LANG")
            value = environment.get(key)
            if value is None:
                put(rcx, -1)
            else:
                at, n = string(value)
                put(rcx, -2, n, at, n)
        elif pc == 0x14019E230:  # Rust Unicode White_Space trim fixture seam
            value = text(rcx, rdx)
            white = "\t\n\v\f\r \u0085\u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u2028\u2029\u202f\u205f\u3000"
            leading = len(value) - len(value.lstrip(white))
            trimmed = value.strip(white)
            u.reg_write(r.UC_X86_REG_RAX, rcx + len(value[:leading].encode()))
            u.reg_write(r.UC_X86_REG_RDX, len(trimmed.encode()))
        elif pc == 0x1400021C0:
            u.reg_write(r.UC_X86_REG_RAX, alloc(rcx))
        elif pc in (0x140002200, 0x1400021D0):
            pass  # allocator guard/free; scratch allocations only
        elif pc == 0x145BF293B:
            if r8:
                u.mem_write(rcx, bytes(u.mem_read(rdx, r8)))
            u.reg_write(r.UC_X86_REG_RAX, rcx)
        elif pc == 0x1458E81C0:
            writes.append(dict(key=text(rcx, rdx), value=text(r8, r9)))
        elif pc == 0x1400179A0:
            u.reg_write(r.UC_X86_REG_RAX, 0)  # deterministic synthetic bucket only
        elif pc == 0x145BF2947:
            equal = bytes(u.mem_read(rcx, r8)) == bytes(u.mem_read(rdx, r8))
            u.reg_write(r.UC_X86_REG_RAX, int(not equal))
        elif any(a <= pc < b for a, b in admitted):
            return
        else:
            raise AssertionError(f"Unreviewed native instruction/callee {pc:#x}")
        ret()

    u.hook_add(UC_HOOK_CODE, hook)

    def run(name, value=None):
        sp = stack + 0x1F0000 - 8
        put(sp, done)
        u.reg_write(r.UC_X86_REG_RSP, sp)
        if value is not None:
            at, n = string(value)
            u.reg_write(r.UC_X86_REG_RCX, at)
            u.reg_write(r.UC_X86_REG_RDX, n)
        u.emu_start(RANGES[name][0], 0, count=10000)
        assert get(r.UC_X86_REG_RIP) == done
        return q(0x1480520D0)

    selection = []
    for code in LANGUAGES + ["", "DE", "de-DE", " de", "de ", "zz", "日本語"]:
        put(0x1480520D0, 9)
        result = run("select", code)
        assert result == (LANGUAGES.index(code) if code in LANGUAGES else 0)
        selection.append(dict(input=code, index=result))
    startup = []
    cases = [(code, {}, i) for i, code in enumerate(LANGUAGES)]
    cases += [(" \tde\r\n", {"LANG": "fr_FR"}, 3), ("DE", {"LANG": "fr_FR"}, 6),
              (None, {}, 0), ("zz", {}, 0), ("", {"LANG": "PT_br.UTF-8"}, 4),
              (None, {"LC_ALL": "zz_ZZ", "LANG": "de_DE"}, 0),
              (None, {"LC_ALL": "", "LC_MESSAGES": "cs_CZ", "LANG": "de_DE"}, 2)]
    cases += [(None, {"LANG": code.upper() + "_XX.UTF-8"}, i) for i, code in enumerate(LANGUAGES)]
    for saved, environment, expected in cases:
        result = run("startup")
        assert result == expected, (saved, environment, result, expected)
        startup.append(dict(saved=saved, environment=environment, index=result))
    persistence = []
    for code in LANGUAGES + ["DE", "zz", ""]:
        writes.clear()
        index = run("persist", code)
        assert writes == [dict(key="language", value=LANGUAGES[index])]
        persistence.append(dict(input=code, write=writes[0]))

    # One synthetic native HashMap bucket per locale. The native lookup/probe,
    # key comparison, selected->English fallback and Some("") branches execute.
    maps = heap + 0x1000
    put(0x14804F5B0, maps, 14)
    u.mem_write(0x14804F5C0, bytes(4))

    def table(index, key, value):
        control = heap + 0x3000 + index * 256
        u.mem_write(control, b"\xff" * 32)
        put(maps + index * 48, control, 15, 0, int(value is not None), 0, 0)
        if value is not None:
            kp, kn = string(key)
            vp, vn = string(value)
            put(control - 40, 0, kp, kn, vp, vn)
            u.mem_write(control, b"\x00")

    lookup = []
    for index, code in enumerate(LANGUAGES):
        for selected, english, expected in [("translated", "English", "translated" if index else "English"),
                                            (None, "English", "English"), ("", "English", "" if index else "English"),
                                            (None, None, None)]:
            for i in range(14):
                table(i, "key", english if i == 0 else selected)
            put(0x1480520D0, index)
            run("lookup", "key")
            pointer, count = get(r.UC_X86_REG_RAX), get(r.UC_X86_REG_RDX)
            value = text(pointer, count) if pointer else None
            assert value == expected, (code, selected, english, value, expected)
            lookup.append(dict(code=code, selected=selected, english=english, result=value))
    return dict(target_sha256=SHA, selection=selection, startup=startup, persistence=persistence, lookup=lookup,
                limits=["Bounded original instructions with explicit file/environment, trim, allocation/copy, hash and comparison seams.",
                        "Synthetic HashMap layout checks lookup branches, not the platform hash implementation or real JSON parser.",
                        "File helpers, disk writes, OS environment, renderer and rebuilt Rust do not execute."])
