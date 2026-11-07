#!/usr/bin/env python3
"""Recover current Codex data/text with bounded native x64, without a game/build.

Original constructors, descriptions, rarity math, tag labels and the Codex
growth branch execute in Unicorn. Explicit host seams provide allocation,
UTF-8 strings, compact Rust formatting, uppercase-first and locale lookup.
Unknown callees fail closed. No native OS/filesystem/VM callees are admitted.
--apply writes the two source assets; --check compares them without writing.
"""
from portable_paths import portable_json, portable_record
from native_recovery import digest as _shared_digest
from script_sources import load_script
from decimal import Decimal
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

from coverage_common import latest_target, target_bytes

ROOT = Path(__file__).resolve().parents[1]
SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
WORK = ROOT / "runtime/analysis/history/native-recovery/secondary-pages/408536b1c3c9"
ASSETS = ROOT / "crates/azeroth-survivors-re/assets"
RANGES = {
    "effect-description-map": (0x1459D7D40, 0x1459DAD58),
    "codex-growth": (0x14022153F, 0x140221D8C),
    "jewelry-increment": (0x145891780, 0x145891DE2),
    "jewelry-tag-label": (0x140367400, 0x140367557),
}
FUNCTIONS = [0x145897D80, 0x145898470, 0x145898850, 0x1458998B0,
             0x145899AA0, 0x145891DF0, 0x145892450, 0x145894960,
             0x1458930F0]
LANGUAGES = [("en", "English"), ("pl", "Polski"), ("cs", "Čeština"),
             ("de", "Deutsch"), ("pt", "Português (Brasil)"), ("es", "Español"),
             ("fr", "Français"), ("ro", "Română"), ("tr", "Türkçe"),
             ("ru", "Русский"), ("uk", "Українська"), ("zh", "简体中文"),
             ("ja", "日本語"), ("ko", "한국어")]


def digest(data):
    return _shared_digest(data)


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(value, ensure_ascii=False, indent=2) + "\n")


def embedded_locales(data, pe):
    """Parse exact current payloads; never relabel an older source catalog."""
    starts = [match.start() for match in re.finditer(rb'\{\r?\n  "game.title":', data)]
    assert len(starts) == len(LANGUAGES), starts
    result = {}
    for (code, name), start in zip(LANGUAGES, starts):
        prefix = ((code if code != "en" else "") + name).encode()
        assert data[start - len(prefix):start] == prefix, code
        text = data[start:start + 1000000].decode("utf-8", errors="replace")
        catalog, end = json.JSONDecoder().raw_decode(text)
        payload = text[:end].encode()
        assert data[start:start + len(payload)] == payload
        assert all(isinstance(key, str) and isinstance(value, str)
                   for key, value in catalog.items())
        result[code] = (catalog, dict(code=code, native_name=name,
            file_offset=hex(start), virtual_address=hex(pe.offset_va(start)),
            byte_count=len(payload), labels=len(catalog), embedded_sha256=digest(payload)))
    return result


def recover(data, pe):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r

    ends = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    admitted = dict(RANGES)
    admitted.update({hex(a): (a, ends[a]) for a in FUNCTIONS})
    # Shared constructor provenance is retained by equipment-catalog; it is
    # admitted unchanged here so localized names/effects use its real output.
    native = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    native.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        at, count = section["raw_offset"], section["raw_size"]
        native.mem_write(pe.image_base + section["rva"], data[at:at + count])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    native.mem_map(heap, 0x2000000)
    native.mem_map(stack, 0x200000)
    native.mem_map(done, 4096)
    cursor = heap + 0x1000
    calls, locale, keys = {}, {}, set()

    def reg(which):
        return native.reg_read(which)

    def q(at):
        return struct.unpack("<Q", native.mem_read(at, 8))[0]

    def put(at, *values):
        native.mem_write(at, struct.pack("<" + "Q" * len(values), *values))

    def text(at, count):
        assert 0 <= count < 65536
        return bytes(native.mem_read(at, count)).decode()

    def pair(at):
        return text(q(at), q(at + 8))

    def alloc(count):
        nonlocal cursor
        assert 0 <= count < 0x100000
        at = cursor
        cursor += (max(count, 1) + 15) & ~15
        assert cursor < heap + 0x2000000
        native.mem_write(at, bytes(count))
        return at

    def output(at, value):
        raw = value.encode()
        ptr = alloc(len(raw) + 1)
        native.mem_write(ptr, raw)
        put(at, len(raw), ptr, len(raw))

    def number(at, formatter, precision=None):
        if formatter == 0x1400020C0:
            return pair(at)
        if formatter == 0x1400020E0:
            return pair(at + 8)
        if formatter in (0x145BDF7D0, 0x145BDE8E0):
            return str(struct.unpack("<I", native.mem_read(at, 4))[0])
        assert formatter == 0x145BDDBE0, hex(formatter)
        value = struct.unpack("<f", native.mem_read(at, 4))[0]
        if precision is not None:
            return format(value, f".{precision}f")
        # Same shortest-round-trip boundary as the existing native Codex
        # recovery; all current general-format operands are separately bound.
        short = next(format(value, f".{n}g") for n in range(1, 10)
                     if struct.pack("<f", float(format(value, f".{n}g"))) == struct.pack("<f", value))
        return format(Decimal(short), 'f') if 'e' in short.lower() else short

    def hook(_, pc, instruction_size, unused):
        if pc == 0x140221D8C:
            native.emu_stop()
            return
        if any(a <= pc < b for a, b in admitted.values()):
            return
        calls[hex(pc)] = calls.get(hex(pc), 0) + 1
        rcx, rdx, r8, r9 = (reg(x) for x in
                            (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8, r.UC_X86_REG_R9))
        if pc in (0x140002200, 0x1400021D0):
            pass
        elif pc == 0x1400021C0:
            native.reg_write(r.UC_X86_REG_RAX, alloc(rcx))
        elif pc == 0x1400539A0:
            assert r8 == 0 and r9 == 1
            put(rcx, 0, rdx, alloc(rdx))
        elif pc == 0x145C26670:
            if q(rcx) == 0:
                put(rcx + 8, alloc(256 * 64))
            put(rcx, 256)
        elif pc == 0x145BFA970:
            width = q(reg(r.UC_X86_REG_RSP) + 40)
            assert 0 < width <= 64
            capacity = max(q(rcx) * 2, rdx + r8, 8 if width == 1 else 4)
            ptr = alloc(capacity * width)
            if rdx:
                native.mem_write(ptr, bytes(native.mem_read(q(rcx + 8), rdx * width)))
            put(rcx, capacity, ptr)
        elif pc == 0x145BFA0E7:
            native.mem_write(rcx, bytes(native.mem_read(rdx, r8)))
            native.reg_write(r.UC_X86_REG_RAX, rcx)
        elif pc == 0x145BFA0E1:
            native.reg_write(r.UC_X86_REG_RAX, int(native.mem_read(rcx, r8) != native.mem_read(rdx, r8)))
        elif pc in (0x1458EC500, 0x1458EC450):
            key = text(rcx, rdx)
            keys.add(key)
            value = locale.get(key, key if pc == 0x1458EC450 else None)
            if value is None:
                native.reg_write(r.UC_X86_REG_RAX, 0)
                native.reg_write(r.UC_X86_REG_RDX, 0)
            else:
                raw = value.encode()
                ptr = alloc(len(raw) + 1)
                native.mem_write(ptr, raw)
                native.reg_write(r.UC_X86_REG_RAX, ptr)
                native.reg_write(r.UC_X86_REG_RDX, len(raw))
        elif pc == 0x145BCD2F0:
            output(rcx, pair(rdx + 8))
        elif pc == 0x145898220:
            value = pair(rdx + 8)
            output(rcx, value[:1].upper() + value[1:])
        elif pc == 0x14588E1E0:
            value = text(rdx, r8)
            needle = text(r9, q(reg(r.UC_X86_REG_RSP) + 40))
            replacement = text(q(reg(r.UC_X86_REG_RSP) + 48), q(reg(r.UC_X86_REG_RSP) + 56))
            output(rcx, value.replace(needle, replacement))
        elif pc == 0x1458EC8B0:
            value = text(rdx, r8)
            count = q(reg(r.UC_X86_REG_RSP) + 40)
            for index in range(count):
                at = r9 + index * 32
                value = value.replace("{" + pair(at) + "}", number(q(at + 16), q(q(at + 24) + 24)))
            output(rcx, value)
        elif pc == 0x145BCCE30:
            at, arg, value = rdx, 0, ""
            while True:
                op = native.mem_read(at, 1)[0]
                at += 1
                if op == 0:
                    break
                if op < 0x80:
                    value += text(at, op)
                    at += op
                    continue
                precision = None
                if op in (0xC1, 0xC5):
                    at += 4
                    precision = 0
                    if op == 0xC5:
                        precision = struct.unpack('<H', native.mem_read(at, 2))[0]
                        at += 2
                else:
                    assert op == 0xC0, hex(op)
                value += number(q(r8 + arg * 16), q(r8 + arg * 16 + 8), precision)
                arg += 1
            output(rcx, value)
        else:
            raise RuntimeError(f"Unreviewed native call {pc:#x} from {q(reg(r.UC_X86_REG_RSP)):#x}")
        sp = reg(r.UC_X86_REG_RSP)
        native.reg_write(r.UC_X86_REG_RSP, sp + 8)
        native.reg_write(r.UC_X86_REG_RIP, q(sp))

    native.hook_add(UC_HOOK_CODE, hook)

    def invoke(at, rcx=0, rdx=0, r8=0):
        sp = stack + 0x1F0008
        put(sp, done)
        native.reg_write(r.UC_X86_REG_RSP, sp)
        native.reg_write(r.UC_X86_REG_MXCSR, 0x1F80)
        for which, value in ((r.UC_X86_REG_RCX, rcx), (r.UC_X86_REG_RDX, rdx), (r.UC_X86_REG_R8, r8)):
            native.reg_write(which, value)
        native.emu_start(at, done, count=1000000)
        assert reg(r.UC_X86_REG_RIP) == done

    def descriptions(ptr, count):
        out, array = alloc(24), alloc(32 * 24)
        put(out, array, 0, array)
        invoke(0x1459D7D40, ptr, ptr + count * 64, out)
        assert q(out + 8) <= 32
        return [pair(array + index * 24 + 8) for index in range(q(out + 8))]

    def jewelry_description(at, bits):
        out = alloc(24)
        native.reg_write(r.UC_X86_REG_XMM2, bits)
        invoke(0x145891DF0, out, at)
        return pair(out + 8)

    menu = json.loads((ASSETS / "menu.json").read_text())
    abilities = {pair(0x146BE1C18 + i * 120): 0x146BE1C18 + i * 120 for i in range(113)}
    spells = {row["key"]: row for row in menu["abilities"]}
    # Class pools were recovered independently by the current balance owner.
    pools = []
    for index, (cid, cls) in enumerate(zip((1, 2, 3, 4, 5, 7, 8, 9, 11), menu["classes"])):
        at = 0x146BE06E8 + index * 144
        assert pair(at + 16) == cls["key"]
        ptr, count = q(at + 48), q(at + 56)
        pool = [pair(ptr + number * 16) for number in range(count)]
        assert pool == cls["spell_keys"], cls["key"]
        pools.extend((cid, key) for key in pool)
    assert len(pools) == 103 and len(set(key for _, key in pools)) == 103
    assert set(spells) == set(abilities)
    results, provenance, entries = {}, [], []
    current_locales = embedded_locales(data, pe)
    for code, _ in LANGUAGES:
        locale, locale_proof = current_locales[code]
        keys = set()
        localized, structure = {}, []
        for cid, key in pools:
            cursor = heap + 0x1000
            out = alloc(112)
            invoke(0x1458930F0, out, abilities[key])
            name = pair(out + 32).split(":", 1)[0]
            item = dict(key=pair(out + 8), name=name, icon=pair(out + 72),
                        group="legendary", quality=4, class_id=cid, spell=key, spell_icon=spells[key]["icon"])
            row = dict(name=name, descriptions=descriptions(q(out + 56), q(out + 64)))
            localized[item["key"]] = row
            structure.append(dict(item, descriptions=row["descriptions"]))
        for index in range(22):
            cursor = heap + 0x1000
            at = 0x146BE91B8 + index * 72
            invoke(0x145892450, at)
            name = text(reg(r.UC_X86_REG_RAX), reg(r.UC_X86_REG_RDX))
            item = dict(key=pair(at), name=name, icon=pair(at + 32), group="rings" if index < 9 else "trinkets", quality=0)
            row = dict(name=name, descriptions=[])
            none = alloc(16)
            for quality in range(5):
                invoke(0x145891780, at, quality, none)
                row["descriptions"].append(jewelry_description(at, reg(r.UC_X86_REG_XMM0) & 0xFFFFFFFF))
            invoke(0x140367400, at)
            row["tag_label"] = text(reg(r.UC_X86_REG_RAX), reg(r.UC_X86_REG_RDX))
            bp = stack + 0x100000
            native.mem_write(bp - 0x100, bytes(0x900))
            put(bp + 0x670, at)
            native.reg_write(r.UC_X86_REG_RBP, bp)
            native.reg_write(r.UC_X86_REG_RSP, bp - 0x80)
            native.reg_write(r.UC_X86_REG_R13, 0x145DEBDF0)
            native.emu_start(0x14022153F, 0, count=1000000)
            assert reg(r.UC_X86_REG_RIP) == 0x140221D8C
            row["growth"] = pair(bp + 0x608)
            localized[item["key"]] = row
            structure.append(dict(item, **{k: v for k, v in row.items() if k != "name"}))
        for index in range(17):
            cursor = heap + 0x1000
            at = 0x146BEA470 + index * 80
            invoke(0x145894960, at)
            name = text(reg(r.UC_X86_REG_RAX), reg(r.UC_X86_REG_RDX))
            item = dict(key=pair(at), name=name, icon=pair(at + 32), group="amulets", quality=q(at + 64))
            row = dict(name=name, descriptions=descriptions(q(at + 48), q(at + 56)))
            localized[item["key"]] = row
            structure.append(dict(item, descriptions=row["descriptions"]))
        assert len(localized) == len(structure) == 142
        if code == "en":
            entries = structure
        results[code] = localized
        provenance.append(dict(locale_proof, lookup_keys=sorted(keys)))
        print(f"{code}: 142 selected-target Codex entries", flush=True)
    ranges = []
    for role, (a, b) in admitted.items():
        at = pe.rva_offset(a - pe.image_base)
        ranges.append(dict(role=role, address=hex(a), end_exclusive=hex(b), sha256=digest(data[at:at + b - a])))
    spans = []
    for role, at, count in [("class-pools", 0x146BE06E8, 9 * 144),
                            ("ability-descriptors", 0x146BE1C18, 113 * 120),
                            ("jewelry-definitions", 0x146BE91B8, 22 * 72),
                            ("shared-amulets", 0x146BEA470, 17 * 80),
                            ("growth-branches", 0x145DF0304, 16 * 4),
                            ("growth-cap-branches", 0x145DF0390, 19 * 4)]:
        offset = pe.rva_offset(at - pe.image_base)
        spans.append(dict(role=role, address=hex(at), byte_count=count, sha256=digest(data[offset:offset + count])))
    shared_keys = provenance[0]["lookup_keys"]
    assert all(row["lookup_keys"] == shared_keys for row in provenance)
    for row in provenance:
        del row["lookup_keys"]
    proof = dict(target_sha256=SHA, entries=142, class_legendary=103, jewelry=22, shared_amulets=17,
                 locales=provenance, locale_lookup_keys=shared_keys, native_ranges=ranges, data_spans=spans, host_calls=calls,
                 constructor_evidence="../equipment-catalog/manifest.json",
                 limits=["Host seams replace allocation, copying, comparison, Rust formatting, string replacement, Unicode uppercase-first and locale lookup.",
                         "Locale lookup parses exact JSON payloads in the selected EXE, with language prefixes, byte ranges and hashes checked; no OS/game/VM code runs.",
                         "Native descriptions and catalog coverage do not establish rendered UI, compilation or runtime parity."])
    return dict(version="0.109.0", target_sha256=SHA, entries=entries), results, proof


OWNERS = {"page": ("codex-page", 0x14021bc60, 0x14021e00d),
          "details": ("codex-details", 0x14021eaf0, 0x140221f13),
          "tile": ("codex-tile", 0x140365a00, 0x1403663d8),
          "legendary-constructor": ("codex-legendary", 0x1458930f0, 0x1458947e4),
          "effect-map": ("codex-effect-map", 0x1459d7d40, 0x1459dad58)}

def evidence(data, pe, write):
    folder = ROOT / "docs/analysis/evidence/0.109.0/codex"
    bounds = {pe.image_base+a: pe.image_base+b for a,b,_ in pe.functions()}
    prior = None if write else json.loads((folder/"manifest.json").read_text())
    if write: folder.mkdir(parents=True, exist_ok=True)
    rows = []
    for role, (stem, a, b) in OWNERS.items():
        assert bounds[a] == b
        at = pe.rva_offset(a-pe.image_base)
        row = dict(role=role, address=hex(a), end_exclusive=hex(b), sha256=digest(data[at:at+b-a]))
        if write:
            x = json.loads((WORK/(stem+"-rea/003-procedure_pseudo_code.json")).read_text())["response"]["result"]["structuredContent"]
            assert x["provider"]["id"] == "ghidra" and x["subject"]["digest"]["sha256"] == row["sha256"]
            value = "\n".join(line.rstrip() for line in x["normalized_result"].splitlines()).strip()+"\n"
            row.update(rea_evidence_id=x["evidence_id"], provider=x["provider"], analysis_profile_digest=x["analysis_profile"]["digest"], pseudocode=role+".c", pseudocode_sha256=digest(value.encode()))
            (folder/row["pseudocode"]).write_text(value)
        else:
            old = next(r for r in prior["owners"] if r["role"] == role)
            for key in ["rea_evidence_id","provider","analysis_profile_digest","pseudocode","pseudocode_sha256"]: row[key] = old[key]
            assert digest((folder/row["pseudocode"]).read_bytes()) == row["pseudocode_sha256"]
        rows.append(row)
    result = dict(target_sha256=SHA, owners=rows, limits=["Ghidra raw-function imports omit referenced globals and use a generic ABI; caller instructions, native data and the bounded replay separately establish Windows-register contracts.","No application, rendering or original/rebuilt comparison ran."])
    if write: save(folder/"manifest.json", result)
    else: assert result == prior


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    assert not (args.check and args.apply)
    target = latest_target(verify=True)
    assert target["version"] == "0.109.0" and target["sha256"] == SHA
    data = target_bytes(target)
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    catalog, locales, proof = recover(data, pe)
    if args.apply or args.check:
        evidence(data, pe, args.apply)
    # English structure is unchanged; reuse the historical canonical asset only
    # after comparing every regenerated current record. Current locale changes
    # are a compact overlay, avoiding a second 600KB corpus of identical text.
    base = json.loads((ASSETS / "codex-0.105.0.json").read_text())
    assert base["entries"] == catalog["entries"]
    legacy = json.loads((ASSETS / "codex-locales-0.105.0.json").read_text())
    changes = {code: {key: value for key, value in rows.items() if legacy[code][key] != value}
               for code, rows in locales.items()}
    changes = {code: rows for code, rows in changes.items() if rows}
    delta = dict(target_sha256=SHA, locales=changes)
    name = "codex-locale-delta-0.109.0.json"
    if args.check:
        assert portable_record(json.loads((ASSETS / name).read_text())) == portable_record(delta)
    elif args.apply:
        save(ASSETS / name, delta)
    else:
        save(WORK / name, delta)
    proof["constructor_evidence"] = "manifest.json"
    proof["source_assets"] = [dict(path="crates/azeroth-survivors-re/assets/" + n,
        sha256=digest((ASSETS / n).read_bytes())) for n in ["codex-0.105.0.json", "codex-locales-0.105.0.json"]]
    proof["source_assets"].append(dict(path="crates/azeroth-survivors-re/assets/"+name,
        sha256=digest((json.dumps(delta,ensure_ascii=False,indent=2)+"\n").encode())))
    proof["current_structural_records_match_historical_source"] = 142
    proof["current_localized_overlay_records"] = sum(len(rows) for rows in changes.values())
    source = (ROOT / "crates/azeroth-survivors-re/src/codex.rs").read_text()
    if args.check:
        assert name in source and "text.0.entry(code).or_default().extend(rows)" in source
        retained = ROOT / "docs/analysis/evidence/0.109.0/codex/validation.json"
        assert portable_record(json.loads(retained.read_text())) == portable_record(proof)
    else:
        save(WORK / "codex-validation.json", proof)
        if args.apply:
            save(ROOT / "docs/analysis/evidence/0.109.0/codex/validation.json", proof)
    print("Checked 142 current entries, 1,988 localized records, 1,540 fresh jewelry rarity descriptions, 308 native growth branches and 13 current locale corrections")


if __name__ == "__main__":
    main()
