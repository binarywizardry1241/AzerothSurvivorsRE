#!/usr/bin/env python3
"""Revalidate ordinary gear and every live amulet against immutable 0.105.0.

No compilation or game process runs. Amulet construction uses bounded original
x64 instructions in Unicorn with reviewed allocation, locale-miss, formatting,
memcmp and memcpy seams. Unknown calls fail closed. --prepare stages focused
REA/Ghidra input; --check compares the compact retained result. Output otherwise
stays under ignored runtime/analysis/history/inventory/equipment-catalog/c4fa4e50a04f.
"""
from native_recovery import digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import re
import struct
import sys

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "runtime/analysis/history/inventory/equipment-catalog/c4fa4e50a04f"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/equipment-catalog"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
CONSTRUCTOR = (0x14587B8E0, 0x14587CFC7)
OFFERS = (0x145959720, 0x14595AC39)
ABILITIES, ABILITY_COUNT = 0x146BACAD8, 113
SHARED, SHARED_COUNT = 0x146BB5798, 17
NORMALIZE = {35: 30, 36: 31}
SCALERS = ((0x1459B5410, 0x1459B55D9), (0x1458E0750, 0x1458E0BDA))


def write(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n")


def digest(value):
    return _shared_digest(value)


def module(name, path):
    result = load_script(name, path)
    return result


def load():
    data = TARGET.read_bytes()
    assert digest(data) == SHA, "Selected EXE SHA-256 mismatch"
    pe = module("inventory", ROOT / "scripts/inventory-executable.py").PE(data)
    return data, pe


def prepare(data, pe):
    for name, (start, end) in (("offers", OFFERS), ("effect-iterator", SCALERS[0]),
                               ("passive-scaling", SCALERS[1])):
        at = pe.rva_offset(start - pe.image_base)
        (WORK / f"amulet-{name}.bin").write_bytes(data[at:at + end - start])
        write(WORK / f"{name}-plan.json", dict(
            target=f"runtime/analysis/history/inventory/equipment-catalog/c4fa4e50a04f/amulet-{name}.bin",
            output=f"runtime/analysis/history/inventory/equipment-catalog/c4fa4e50a04f/rea-{name}",
            open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
            timeout=240, open_timeout=90, init_timeout=60,
            environment={"REA_GHIDRA_STARTUP_TIMEOUT_MS": "180000"},
            operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)),
                             label=f"amulet-{name}")]))


def amulets(data, pe):
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    size = max(s["rva"] + max(s["virtual_size"], s["raw_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (size + 4095) & ~4095)
    for section in pe.sections:
        start, count = section["raw_offset"], section["raw_size"]
        u.mem_write(pe.image_base + section["rva"], data[start:start + count])
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    u.mem_map(heap, 0x1000000)
    u.mem_map(stack, 0x200000)
    u.mem_map(done, 4096)
    next_heap = heap + 0x1000
    calls = {}

    def get(at, fmt):
        return struct.unpack(fmt, u.mem_read(at, struct.calcsize(fmt)))

    def put(at, fmt, *values):
        u.mem_write(at, struct.pack(fmt, *values))

    def text(at, length):
        assert 0 <= length < 4096
        return bytes(u.mem_read(at, length)).decode()

    def pair(at):
        return text(*get(at, "<2Q"))

    def alloc(count):
        nonlocal next_heap
        assert 0 <= count < 0x100000
        at = next_heap
        next_heap += (count + 15) & ~15
        assert next_heap < heap + 0x1000000
        u.mem_write(at, bytes(count))
        return at

    def string_output(at, value):
        raw = value.encode()
        pointer = alloc(len(raw) + 1)
        u.mem_write(pointer, raw)
        put(at, "<3Q", len(raw), pointer, len(raw))

    def hook(_, at, instruction_size, unused):
        if any(start <= at < end for start, end in (CONSTRUCTOR, *SCALERS)):
            return
        calls[at] = calls.get(at, 0) + 1
        rcx, rdx, r8 = (u.reg_read(reg) for reg in
                        (r.UC_X86_REG_RCX, r.UC_X86_REG_RDX, r.UC_X86_REG_R8))
        if at == 0x145BFB270:  # reserve Effect64 vector; capacity sufficient for all paths
            if get(rcx, "<Q")[0] == 0:
                put(rcx + 8, "<Q", alloc(256 * 64))
            put(rcx, "<Q", 256)
        elif at == 0x1458DA590:  # locale miss preserves English fallback
            u.reg_write(r.UC_X86_REG_RAX, 0)
            u.reg_write(r.UC_X86_REG_RDX, 0)
        elif at in (0x140002200, 0x1400021D0):  # allocation shim / deallocation
            pass
        elif at == 0x1400021C0:
            u.reg_write(r.UC_X86_REG_RAX, alloc(rcx))
        elif at == 0x14023FF50:  # successful Result<RawVec>: discriminant, capacity, pointer
            assert r8 == 0 and u.reg_read(r.UC_X86_REG_R9) == 1
            put(rcx, "<3Q", 0, rdx, alloc(rdx))
        elif at == 0x145BC977B:
            u.mem_write(rcx, bytes(u.mem_read(rdx, r8)))
            u.reg_write(r.UC_X86_REG_RAX, rcx)
        elif at == 0x145BC9787:
            u.reg_write(r.UC_X86_REG_RAX,
                        int(u.mem_read(rcx, r8) != u.mem_read(rdx, r8)))
        elif at == 0x145BC9817:  # floorf for scaled spell target count
            value = struct.unpack("<f", struct.pack("<I", u.reg_read(r.UC_X86_REG_XMM0) & 0xFFFFFFFF))[0]
            assert math.isfinite(value)
            u.reg_write(r.UC_X86_REG_XMM0, struct.unpack("<I", struct.pack("<f", math.floor(value)))[0])
        elif at == 0x145B9C4D0:  # reviewed compact literal/string format bytecode
            cursor, arg, value = rdx, 0, ""
            while True:
                op = u.mem_read(cursor, 1)[0]
                cursor += 1
                if op == 0:
                    break
                if op < 0x80:
                    value += text(cursor, op)
                    cursor += op
                else:
                    assert op == 0xC0, hex(op)
                    pointer, formatter = get(r8 + arg * 16, "<2Q")
                    arg += 1
                    assert formatter == 0x1400020C0
                    value += pair(pointer)
            string_output(rcx, value)
        else:
            raise RuntimeError("Unreviewed native call " + hex(at))
        sp = u.reg_read(r.UC_X86_REG_RSP)
        u.reg_write(r.UC_X86_REG_RSP, sp + 8)
        u.reg_write(r.UC_X86_REG_RIP, get(sp, "<Q")[0])

    u.hook_add(UC_HOOK_CODE, hook)

    def effects(pointer, count):
        rows = []
        assert count <= 16
        for index in range(count):
            raw = bytearray(u.mem_read(pointer + index * 64, 64))
            strings = []
            for offset in range(0, 49, 8):
                address, length = struct.unpack_from("<2Q", raw, offset)
                if pe.image_base <= address < pe.image_base + size and 0 < length <= 256:
                    try:
                        value = text(address, length)
                    except UnicodeDecodeError:
                        continue
                    strings.append(dict(offset=offset, value=value))
            native_tag = raw[0]
            raw[0] = NORMALIZE.get(native_tag, native_tag)
            effect = dict(kind="passive", tag=raw[0])
            if raw[0] == 30:
                effect = dict(kind="stat", stat_tag=raw[8],
                              amount_bits=struct.unpack_from("<I", raw, 4)[0])
            elif raw[0] == 31:
                assert raw[8] in (0, 1) and raw[36] < 8
                selector = dict(kind="all") if raw[8] == 0 else dict(
                    kind="key", key=text(*struct.unpack_from("<2Q", raw, 16)))
                effect = dict(kind="spell", selector=selector, modifier=raw[36],
                              amount_bits=struct.unpack_from("<I", raw, 32)[0])
            rows.append(dict(tag=native_tag, raw_hex=raw.hex(), strings=strings, effect=effect))
        return rows

    generated = []
    for index in range(ABILITY_COUNT):
        definition = ABILITIES + index * 120
        next_heap = heap + 0x1000
        u.mem_write(heap, bytes(112))
        u.mem_write(stack, bytes(0x200000))
        sp = stack + 0x1F0008
        put(sp, "<Q", done)
        for reg, value in ((r.UC_X86_REG_RSP, sp), (r.UC_X86_REG_RCX, heap),
                           (r.UC_X86_REG_RDX, definition), (r.UC_X86_REG_MXCSR, 0x1F80)):
            u.reg_write(reg, value)
        try:
            u.emu_start(CONSTRUCTOR[0], done, count=100000)
        except Exception as error:
            raise RuntimeError(pair(definition) + " at " + hex(u.reg_read(r.UC_X86_REG_RIP))) from error
        assert u.reg_read(r.UC_X86_REG_RIP) == done
        generated.append(dict(ability_key=pair(definition), key=pair(heap + 8),
                              name=pair(heap + 32), icon=pair(heap + 72), rarity=get(heap + 96, "<Q")[0],
                              effects=effects(*get(heap + 56, "<2Q"))))
    shared = []
    for index in range(SHARED_COUNT):
        at = SHARED + index * 80
        shared.append(dict(key=pair(at), name=pair(at + 16), icon=pair(at + 32),
                           rarity=get(at + 64, "<Q")[0], effects=effects(*get(at + 48, "<2Q"))))
    scaling_cases = 0
    scaling_digest = hashlib.sha256()
    for row in generated + shared:
        # Legionlord has its own current rank interpolation, already checked in
        # demon-offers/native-cases.json; it never takes this generic multiplier.
        if row["key"] == "legendary:demonic_empowerment":
            continue
        for record in row["effects"]:
            for factor in (1.0, 1.5, 2.0, 2.5):
                raw = bytearray.fromhex(record["raw_hex"])
                expected = bytearray(raw)
                tag = raw[0]
                offset = (4 if tag in (0, 2, 3, 4, 5, 7, 11, 13, 15, 16, 17, 18, 22, 30)
                          else 8 if tag in (6, 9, 12)
                          else (12 if raw[8:12] == bytes([255]) * 4 else 4) if tag == 8
                          else 32 if tag == 31 else None)
                if offset is not None:
                    value = struct.unpack_from("<f", raw, offset)[0] * factor
                    value = struct.unpack("<f", struct.pack("<f", value))[0]
                    if tag == 31 and raw[36] == 1:
                        value = min(value, 0.5)
                    if tag == 31 and raw[36] == 2:
                        epsilon = struct.unpack("<f", struct.pack("<I", 0x38D1B717))[0]
                        value = math.floor(struct.unpack("<f", struct.pack("<f", value + epsilon))[0])
                    struct.pack_into("<f", expected, offset, value)
                source, state, sink, count, output, scale = (heap + x for x in
                    (0x200000, 0x200100, 0x200200, 0x200300, 0x200400, 0x200500))
                raw[0] = record["tag"]
                u.mem_write(source, bytes(raw))
                put(state, "<3Q", source, source + 64, scale)
                put(sink, "<3Q", count, 0, output)
                put(scale, "<f", factor)
                u.mem_write(stack, bytes(0x200000))
                u.mem_write(output, bytes(64))
                sp = stack + 0x1F0008
                put(sp, "<Q", done)
                for reg, value in ((r.UC_X86_REG_RSP, sp), (r.UC_X86_REG_RCX, state),
                                   (r.UC_X86_REG_RDX, sink), (r.UC_X86_REG_MXCSR, 0x1F80)):
                    u.reg_write(reg, value)
                u.emu_start(SCALERS[0][0], done, count=10000)
                assert u.reg_read(r.UC_X86_REG_RIP) == done and get(count, "<Q")[0] == 1
                observed = bytearray(u.mem_read(output, 64))
                observed[0] = NORMALIZE.get(observed[0], observed[0])
                assert observed == expected, (row["key"], tag, factor, observed.hex(), expected.hex())
                scaling_cases += 1
                scaling_digest.update(observed)
    return (dict(generated=generated, shared=shared), {hex(k): v for k, v in calls.items()},
            dict(case_count=scaling_cases, factors=[1.0, 1.5, 2.0, 2.5],
                 normalized_output_sha256=scaling_digest.hexdigest()))


def signature(row):
    """Compare all effect bytes, owned strings and decoded fields; ignore only PE pointers."""
    effects = []
    for record in row["effects"]:
        raw = bytearray.fromhex(record["raw_hex"])
        for string in record["strings"]:
            raw[string["offset"]:string["offset"] + 8] = bytes(8)
        effects.append(dict(raw_hex=raw.hex(), strings=record["strings"], effect=record["effect"]))
    return dict(ability_key=row.get("ability_key"), key=row["key"], name=row["name"],
                icon=row["icon"], rarity=row["rarity"], effects=effects)


def verify_retained(data, pe):
    manifest = json.loads((RETAINED / "manifest.json").read_text())
    assert manifest["target_sha256"] == SHA
    scopes = [(row, RETAINED) for row in manifest["scopes"]]
    for dependency in manifest["canonical_dependencies"]:
        if "manifest_role" not in dependency:
            continue
        path = ROOT / dependency["manifest"]
        shared = json.loads(path.read_text())
        assert shared["target_sha256"] == SHA
        row = next(row for row in shared["scopes"] if row["role"] == dependency["manifest_role"])
        scopes.append((row, path.parent))
    for row, folder in scopes:
        at = pe.rva_offset(int(row["address"], 16) - pe.image_base)
        assert digest(data[at:at + row["byte_count"]]) == row["sha256"]
        for field in ("assembly", "pseudocode"):
            if field in row:
                path = ROOT / row[field] if row[field].startswith("docs/") else folder / row[field]
                assert digest(path.read_bytes()) == row[field + "_sha256"]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    WORK.mkdir(parents=True, exist_ok=True)
    data, pe = load()
    if args.prepare:
        prepare(data, pe)
        return
    numeric_target = dict(version="0.105.0", sha256=SHA,
                          evidence="docs/analysis/evidence/0.105.0/equipment-catalog/catalog-validation.json")
    for name in ("armory.json", "native-amulets-0.100.1.json"):
        asset = json.loads((ROOT / "crates/azeroth-survivors-re/assets" / name).read_text())
        assert asset["numeric_effects_target"] == numeric_target
    gear = module("pvp_gear", ROOT / "scripts/recover-pvp-gear.py")
    _, gear_proof, _ = gear.recover(data, pe)
    assert gear_proof["ordinary_effects_unchanged"] == 415
    native, calls, scaling = amulets(data, pe)
    historical = json.loads((ROOT / "crates/azeroth-survivors-re/assets/native-amulets-0.100.1.json").read_text())
    legionlord = json.loads((ROOT / "crates/azeroth-survivors-re/assets/legionlord-0.105.0.json").read_text())
    assert legionlord["target_sha256"] == SHA
    expected = dict(generated=historical["generated"] + [legionlord["definition"]], shared=historical["shared"])
    consumer = (ROOT / "crates/azeroth-survivors-re/src/loot_rewards/amulets.rs").read_text()
    assert 'include_str!("../../assets/native-amulets-0.100.1.json")' in consumer
    assert 'include_str!("../../assets/legionlord-0.105.0.json")' in consumer
    assert "catalog.generated.push(current.definition)" in consumer
    scale_source = consumer[consumer.index("pub fn scaled_bytes("):consumer.index("pub const LEGIONLORD_KEY")]
    rank_source = (ROOT / "crates/azeroth-survivors-re/src/loot_rewards/catalog.rs").read_text()
    rank_source = rank_source[rank_source.index("pub const AMULET_STEPS"):]
    step_bits = [int(value, 16) for value in re.findall(r"from_bits\(0x([0-9a-f_]+)\)", rank_source)]
    assert len(step_bits) == 5
    at = pe.rva_offset(0x146BB64C4 - pe.image_base)
    assert list(struct.unpack_from("<5I", data, at)) == step_bits
    checked = []
    for group in ("generated", "shared"):
        source = {row["key"]: row for row in expected[group]}
        assert len(source) == len(expected[group]) == len(native[group])
        assert {row["key"] for row in native[group]} == set(source)
        for row in native[group]:
            observed = signature(row)
            assert observed == signature(source[row["key"]]), row["key"]
            checked.append(observed)
    checked.sort(key=lambda row: row["key"])
    spans = []
    for role, start, count in (("amulet-constructor", CONSTRUCTOR[0], CONSTRUCTOR[1] - CONSTRUCTOR[0]),
                                ("amulet-offers", OFFERS[0], OFFERS[1] - OFFERS[0]),
                                ("ability-descriptors", ABILITIES, ABILITY_COUNT * 120),
                                ("shared-amulets", SHARED, SHARED_COUNT * 80),
                                ("constructor-jump-table", 0x146BB66A8, 16 * 4),
                                ("effect-scaling-iterator", SCALERS[0][0], SCALERS[0][1] - SCALERS[0][0]),
                                ("passive-scaling-leaf", SCALERS[1][0], SCALERS[1][1] - SCALERS[1][0]),
                                ("passive-scaling-jump-table", 0x146E78018, 35 * 4),
                                ("amulet-rarity-steps", 0x146BB64C4, 5 * 4)):
        at = pe.rva_offset(start - pe.image_base)
        spans.append(dict(role=role, virtual_address=hex(start), file_offset=hex(at),
                          byte_count=count, sha256=digest(data[at:at + count])))
    result = dict(version="0.105.0", target_sha256=SHA, target_executed=False,
                  ordinary_gear_count=415, historical_amulets_unchanged=129,
                  generated_count=113, shared_count=17, live_amulet_count=len(checked),
                  amulet_effect_count=sum(len(row["effects"]) for row in checked),
                  normalized_amulet_digest=digest(json.dumps(checked, sort_keys=True).encode()),
                  native_to_internal_effect_variants={str(k): v for k, v in NORMALIZE.items()},
                  host_seam_calls=calls, generic_amulet_scaling=scaling,
                  source_scaling_function_sha256=digest(scale_source.encode()),
                  current_rarity_step_bits=step_bits, native_spans=spans,
                  ordinary_gear_evidence="docs/analysis/evidence/0.105.0/pvp-gear/data-evidence.json",
                  ordinary_gear_consumers="docs/analysis/evidence/0.105.0/pvp-gear/procedures.json",
                  native_catalogs=["crates/azeroth-survivors-re/assets/armory.json",
                                   "crates/azeroth-survivors-re/assets/native-amulets-0.100.1.json",
                                   "crates/azeroth-survivors-re/assets/legionlord-0.105.0.json"],
                  limits=["Historical raw amulet payloads retain their original pointer/provenance namespace.",
                          "Native 35/36 stat/spell variants normalize to existing internal 30/31; all other selected variants match unchanged.",
                          "Generic scaling cases compare original x64 with a source translation; Rust execution and cross-platform powf parity are not established.",
                          "Legionlord's separate rank path is covered by the canonical demon-offers evidence, not the generic cases.",
                          "Only immutable definitions, constructors and selected scaling consumers are checked; proc execution, UI, build and runtime parity are not established."])
    write(WORK / "catalog-validation.json", result)
    if args.check:
        assert result == json.loads((RETAINED / "catalog-validation.json").read_text())
        verify_retained(data, pe)
    print(f"Revalidated 415 ordinary gear pieces and {len(checked)} live amulets / {result['amulet_effect_count']} effects; "
          f"{scaling['case_count']} current generic scaling cases passed; source values unchanged")


if __name__ == "__main__":
    main()
