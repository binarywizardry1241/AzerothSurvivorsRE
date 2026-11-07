#!/usr/bin/env python3
"""Recover/check the exact current locale records and their index interface.

--write updates only the fourteen source JSON catalogs. --stage writes compact
proof and selected native extracts below runtime/. Native checks use Unicorn;
no compiler, Rust, operating-system call, application or game is executed.
"""

if __name__ == '__main__':
    from script_sources import run_contract
    run_contract(__file__)

import argparse
import hashlib
import json
import re
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
TABLE, INDEX = 0x1472FFEF0, 0x1481ED0E0
GETTER, GETTER_END = 0x1458971E0, 0x145897203
SETTER, SETTER_END = 0x145895970, 0x145895AC7
WORK = ROOT / "runtime/analysis/history/findings/q41-remaining/687b5b35cf28/locales"
KEEP = ROOT / "docs/analysis/evidence/q41-language"


def digest(value):
    return hashlib.sha256(value).hexdigest()


def inspect_keys(pattern, code="en"):
    """Inspect matching locale keys in the installed target without writing.

    This is textual discovery, independent of the historical native locale
    getter/setter contract below.
    """
    target = latest_target(verify=True)
    image = target_bytes(target)
    pe = load_script("current_locale_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    matcher = re.compile(pattern, re.IGNORECASE)
    payloads = {}
    for match in re.finditer(rb'\{\r?\n  "game.title":', image):
        at = match.start()
        window = image[at:at + 2000000].decode("utf-8", errors="replace")
        catalog, end = json.JSONDecoder().raw_decode(window)
        raw = window[:end].encode("utf-8")
        if image[at:at + len(raw)] != raw:
            raise ValueError("Locale payload differs from exact UTF-8 input")
        payloads[at] = (catalog, raw)
    english = [at for at, (catalog, _) in payloads.items()
        if catalog.get("common.female") == "Female" and catalog.get("common.male") == "Male"]
    if len(english) != 1:
        raise ValueError("No unique exact English embedded locale payload")

    def pair_text(at):
        pointer, count = struct.unpack_from("<QQ", image, at)
        if count > 1000000:
            raise ValueError("Unbounded locale descriptor text")
        offset = pe.rva_offset(pointer - pe.image_base)
        return image[offset:offset + count].decode("utf-8")

    pointer = struct.pack("<Q", pe.offset_va(english[0]))
    tables = []
    offset = 0
    while (offset := image.find(pointer, offset)) >= 0:
        try:
            if pair_text(offset - 32) == "en" and pair_text(offset - 16) == "English":
                tables.append(offset - 32)
        except (ValueError, UnicodeError, struct.error):
            pass
        offset += 8
    if len(tables) != 1:
        raise ValueError("No unique current locale descriptor table")
    for index in range(len(payloads)):
        row = tables[0] + index * 56
        if pair_text(row) != code:
            continue
        address, count = struct.unpack_from("<QQ", image, row + 32)
        at = pe.rva_offset(address - pe.image_base)
        catalog, raw = payloads[at]
        descriptor_payload = image[at:at + count]
        if not descriptor_payload.startswith(raw) or json.loads(descriptor_payload) != catalog:
            raise ValueError("Locale descriptor differs from exact JSON payload")
        raw = descriptor_payload
        return dict(target={key: target[key] for key in ("version", "sha256", "size_bytes")},
            code=code,
            payload=dict(file_offset=hex(at), byte_count=len(raw), sha256=digest(raw)),
            entries={key: value for key, value in catalog.items() if matcher.search(key)},
            limits="Textual discovery only; native callers, presentation and behavior remain separate.")
    raise ValueError("No selected embedded locale code: " + code)


def derive(write=False):
    sys.path[:0] = [str(ROOT / "runtime/tool-state/python/camera/python-libs"),
                   str(ROOT / "runtime/tool-state/python/armory/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    import unicorn.x86_const as reg

    target = latest_target(verify=True)
    assert target["sha256"] == SHA and target["version"] == "0.113.2"
    image = target_bytes(target)
    pe = load_script("locale_01132_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        assert offset is not None and count >= 0
        data = image[offset:offset + count]
        assert len(data) == count
        return data

    def span(address, count):
        return dict(address=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=count, sha256=digest(raw(address, count)))

    def text(address, count):
        return raw(address, count).decode("utf-8")

    table = raw(TABLE, 14 * 56)
    rows, codes, key_set = [], [], None
    source = (ROOT / "crates/azeroth-survivors-re/src/localization.rs").read_text()
    for index in range(14):
        cp, cn, np, nn, jp, jn, reserved = struct.unpack_from("<7Q", table, index * 56)
        code, name = text(cp, cn), text(np, nn)
        assert re.fullmatch("[a-z]{2}", code)
        payload = raw(jp, jn)
        catalog = json.loads(payload)
        assert len(catalog) == 2923 and all(isinstance(k, str) and isinstance(v, str)
                                          for k, v in catalog.items())
        if key_set is None:
            key_set = set(catalog)
        assert key_set == set(catalog)
        path = ROOT / f"crates/azeroth-survivors-re/assets/locales/{code}.json"
        normalized = payload.replace(b"\r\n", b"\n")
        if write:
            path.write_bytes(normalized)
        assert path.read_bytes() == normalized, f"Source differs from current native {code} catalog"
        assert f'("{code}", "{name}")' in source
        assert f'include_str!("../assets/locales/{code}.json")' in source
        rows.append(dict(index=index, code=code, name=name, trailing_word=hex(reserved), payload=span(jp, jn),
                         keys=len(catalog), source=path.relative_to(ROOT).as_posix(),
                         source_sha256=digest(normalized)))
        codes.append(code)
    assert len(set(codes)) == 14
    assert "catalogs: catalogs::load(save_directory.as_deref())" in source
    assert "self.catalogs[self.index]" in source and "self.catalogs[0].get(key)" in source
    loader = (ROOT / "crates/azeroth-survivors-re/src/localization/catalogs.rs").read_text()
    assert ".zip(super::CATALOGS)" in loader and "parse(embedded)" in loader

    # These two complete leaf bodies have no external-call seams. The source's
    # UI emits only valid indices; invalid native code strings fall back to en.
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    for address, end in [(SETTER, SETTER_END), (GETTER, GETTER_END)]:
        page = address & ~4095
        machine.mem_map(page, ((end - page + 4095) // 4096) * 4096)
        machine.mem_write(address, raw(address, end - address))
    machine.mem_map(INDEX & ~4095, 4096)
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    machine.mem_map(heap, 4096)
    machine.mem_map(stack, 4096)
    machine.mem_map(stop, 4096)
    machine.mem_write(stack + 0x800, struct.pack("<Q", stop))
    native_codes = {int.from_bytes(code.encode(), "little"): i for i, code in enumerate(codes)}
    checks = hashlib.sha256()
    for value in range(65536):
        machine.mem_write(heap, struct.pack("<H", value))
        machine.reg_write(reg.UC_X86_REG_RCX, heap)
        machine.reg_write(reg.UC_X86_REG_RDX, 2)
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x800)
        machine.emu_start(SETTER, stop, count=100)
        actual = struct.unpack("<Q", machine.mem_read(INDEX, 8))[0]
        assert actual == native_codes.get(value, 0)
        checks.update(struct.pack("<HQ", value, actual))
    for length in [0, 1, 3, 4, (1 << 64) - 1]:
        machine.reg_write(reg.UC_X86_REG_RCX, 0)  # Length rejection must not read this pointer.
        machine.reg_write(reg.UC_X86_REG_RDX, length)
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x800)
        machine.emu_start(SETTER, stop, count=100)
        assert bytes(machine.mem_read(INDEX, 8)) == bytes(8)
    indices = [*range(256), 65535, 1 << 32, (1 << 64) - 1]
    for index in indices:
        machine.mem_write(INDEX, struct.pack("<Q", index))
        machine.reg_write(reg.UC_X86_REG_RSP, stack + 0x800)
        machine.emu_start(GETTER, stop, count=20)
        assert machine.reg_read(reg.UC_X86_REG_RAX) == TABLE + min(index, 13) * 56

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    extracts = {}
    for role, start, end in [("index-producer", SETTER, SETTER_END),
                             ("record-getter", GETTER, GETTER_END)]:
        ins = list(decoder.disasm(raw(start, end - start), start))
        assert sum(i.size for i in ins) == end - start
        extracts[role + ".asm"] = "\n".join(
            f"{i.address:016x}: {i.bytes.hex():30} {i.mnemonic} {i.op_str}".rstrip() for i in ins) + "\n"

    proofs = []
    for path in ["rea-first/008-pseudo-14004f660.json", "rea-first/011-pseudo-1458971e0.json",
                 "rea-interfaces/005-pseudo-145895970.json", "rea-interfaces/008-pseudo-140301380.json"]:
        p = WORK.parent / path
        ev = json.loads(p.read_text())["response"]["result"]["structuredContent"]
        assert ev["subject"]["digest"]["sha256"] == SHA
        proofs.append(dict(operation=ev["operation"], parameters=ev["parameters"],
                           evidence_id=ev["evidence_id"], profile_digest=ev["analysis_profile"]["digest"],
                           retained_response=p.relative_to(ROOT).as_posix(), response_sha256=digest(p.read_bytes())))
    proof = dict(schema_version=1, target=target, gap_ids=[17, 41],
                 lead_id="Q41-P01-language-14004fa5f", table=span(TABLE, len(table)),
                 index_global=hex(INDEX), producer=span(SETTER, SETTER_END - SETTER),
                 getter=span(GETTER, GETTER_END - GETTER), locales=rows, ghidra=proofs,
                 static_cases=dict(two_byte_codes=65536, invalid_lengths=5,
                                   getter_indices=len(indices), code_result_sha256=checks.hexdigest(),
                                   native_values_equal_to_source=14 * 2923),
                 limits=["Only original leaf instructions run in synthetic memory; no Rust or UI execution.",
                         "Caller copies the static record's code pointer/length into the language-list builder; complete virtual resource lifetime and arbitrary aliases remain open.",
                         "All locale payloads are current data; lookup/override/parser/startup/persistence and fonts retain their separate historical contracts unless separately revalidated.",
                         "Co-op text is recovered data; no hosting, joining, networking or cooperative gameplay is implemented.",
                         "Compilation, real file/environment/input/rendering and original/rebuilt parity are unverified."])
    return proof, extracts


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--stage", action="store_true")
    parser.add_argument("--inspect-key", help="Read selected-target English keys matching a regular expression")
    parser.add_argument("--locale", default="en", help="Locale code for textual inspection")
    args = parser.parse_args()
    if args.inspect_key is not None:
        if args.write or args.stage:
            parser.error("Text inspection cannot write/stage historical locale contracts")
        print(json.dumps(inspect_keys(args.inspect_key, args.locale), indent=2, ensure_ascii=False))
        return
    proof, extracts = derive(args.write)
    text = json.dumps(proof, indent=2, ensure_ascii=False) + "\n"
    if args.stage:
        WORK.mkdir(parents=True, exist_ok=True)
        (WORK / "proof.json").write_text(text)
        for name, value in extracts.items():
            (WORK / name).write_text(value)
    else:
        assert (KEEP / "proof.json").read_text() == text
        for name, value in extracts.items():
            assert (KEEP / name).read_text() == value
    print(json.dumps(dict(target="0.113.2", catalogs=14, values=40922,
                         native_cases=65800, source_written=args.write, parity_verified=False)))


if __name__ == "__main__":
    main()
