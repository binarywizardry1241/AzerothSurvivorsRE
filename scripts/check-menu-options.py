#!/usr/bin/env python3
"""Check current locale records/index, Options descriptors and AddOns statuses.

--write updates only the fourteen exact embedded locale catalogs. --stage writes
compact evidence under runtime/. No compiler, Rust, file/VM native callee, UI or
game runs; leaf replay uses original instructions in synthetic Unicorn memory.
"""
import argparse
import hashlib
import json
import re
import struct
import subprocess
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c"
TABLE, INDEX = 0x14732E768, 0x148217160
GETTER, SETTER = 0x1458E1F35, 0x1458E0210
OPTIONS, COUNT, STRIDE = 0x145EE9600, 105, 152
WORK = ROOT / "runtime/menu-options-0.115.0"
KEEP = ROOT / "docs/analysis/evidence/0.115.0/menu-options"
PRIOR_COMMIT = "0a1b4a62b3de3b0b3c0569537a7e81bf4c2fc73f"
ADDED = ["Unlocked zones", "No password", "Zone: any",
         "No lobby matches the filters.", "Zone: {zone}", "{shown} of {all} shown"]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def derive(write=False):
    sys.path[:0] = [str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"),
                   str(ROOT / "runtime/armory-recovery/python-libs")]
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as reg

    target = latest_target(verify=True)
    assert (target["version"], target["sha256"]) == ("0.115.0", SHA)
    image = target_bytes(target)
    pe = load_script("menu_options_01150_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        data = image[at:at + size]
        assert len(data) == size
        return data

    def text(address, size):
        return raw(address, size).decode("utf-8") if size else ""

    def span(address, size):
        return dict(address=hex(address), file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    byte_count=size, sha256=digest(raw(address, size)))

    source = (ROOT / "crates/azeroth-survivors-re/src/localization.rs").read_text()
    previous = json.loads((ROOT / "docs/analysis/evidence/0.113.2/q41-language/proof.json").read_text())
    assert previous["target"]["sha256"] == "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
    locales, codes, keys = [], [], None
    for index in range(14):
        cp, cn, np, nn, jp, jn, trailing = struct.unpack("<7Q", raw(TABLE + 56 * index, 56))
        code, name = text(cp, cn), text(np, nn)
        assert re.fullmatch("[a-z]{2}", code)
        payload = raw(jp, jn)
        catalog = json.loads(payload)
        assert len(catalog) == 2929 and all(isinstance(k, str) and isinstance(v, str)
                                          for k, v in catalog.items())
        assert set(ADDED) <= catalog.keys()
        if keys is None:
            keys = set(catalog)
        assert keys == set(catalog)
        path = ROOT / f"crates/azeroth-survivors-re/assets/locales/{code}.json"
        relative = path.relative_to(ROOT).as_posix()
        prior = subprocess.run(["git", "show", PRIOR_COMMIT + ":" + relative], cwd=ROOT,
                               capture_output=True, check=True).stdout
        assert digest(prior) == previous["locales"][index]["source_sha256"]
        prior_catalog = json.loads(prior)
        assert len(prior_catalog) == 2923 and set(catalog) - set(prior_catalog) == set(ADDED)
        assert all(catalog[key] == value for key, value in prior_catalog.items())
        normalized = payload.replace(b"\r\n", b"\n")
        if write:
            path.write_bytes(normalized)
        assert path.read_bytes() == normalized, f"Source catalog differs: {code}"
        assert f'("{code}", "{name}")' in source
        assert f'include_str!("../assets/locales/{code}.json")' in source
        locales.append(dict(index=index, code=code, name=name, trailing_word=hex(trailing),
                            payload=span(jp, jn), keys=len(catalog),
                            source=relative, source_sha256=digest(normalized),
                            previous_source_sha256=digest(prior), unchanged_previous_values=len(prior_catalog)))
        codes.append(code)
    assert len(set(codes)) == 14
    language_array = source.split("pub const LANGUAGES:", 1)[1].split("];", 1)[0]
    assert re.findall(r'\("([^\"]+)", "([^\"]+)"\)', language_array) == [
        (row["code"], row["name"]) for row in locales]
    assert re.findall(r'include_str!\("../assets/locales/([a-z]{2})\.json"\)', source) == codes
    assert "catalogs: catalogs::load(save_directory.as_deref())" in source
    assert "self.catalogs[self.index]" in source and "self.catalogs[0].get(key)" in source

    # Complete current leaf contracts. RIP-relative destinations are checked
    # independently, rather than retaining the historical record/global RVAs.
    getter, setter = raw(GETTER, 35), raw(SETTER, 343)
    assert getter[:3] == bytes.fromhex("488b05")
    assert GETTER + 7 + struct.unpack_from("<i", getter, 3)[0] == INDEX
    assert getter[24:27] == bytes.fromhex("488d05")
    assert GETTER + 31 + struct.unpack_from("<i", getter, 27)[0] == TABLE
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    for address, body in [(GETTER, getter), (SETTER, setter)]:
        page = address & ~4095
        machine.mem_map(page, ((address + len(body) - page + 4095) // 4096) * 4096)
        machine.mem_write(address, body)
    machine.mem_map(INDEX & ~4095, 4096)
    heap, stack, stop = 0x200000000, 0x300000000, 0x400000000
    for address in [heap, stack, stop]:
        machine.mem_map(address, 4096)
    machine.mem_write(stack + 0x800, struct.pack("<Q", stop))
    native_codes = {int.from_bytes(code.encode(), "little"): i for i, code in enumerate(codes)}
    checks = hashlib.sha256()
    for value in range(65536):
        machine.mem_write(heap, struct.pack("<H", value))
        for register, arg in [(reg.UC_X86_REG_RCX, heap), (reg.UC_X86_REG_RDX, 2),
                              (reg.UC_X86_REG_RSP, stack + 0x800)]:
            machine.reg_write(register, arg)
        machine.emu_start(SETTER, stop, count=100)
        actual = struct.unpack("<Q", machine.mem_read(INDEX, 8))[0]
        assert actual == native_codes.get(value, 0)
        checks.update(struct.pack("<HQ", value, actual))
    for length in [0, 1, 3, 4, (1 << 64) - 1]:
        machine.reg_write(reg.UC_X86_REG_RCX, 0)
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

    options = json.loads((ROOT / "crates/azeroth-survivors-re/assets/options.json").read_text())
    assert len(options["rows"]) == COUNT
    descriptors = []
    for index, prior in enumerate(options["rows"]):
        row = raw(OPTIONS + index * STRIDE, STRIDE)
        key = text(*struct.unpack_from("<QQ", row, 32)) or "gamma"
        control, storage = struct.unpack_from("<Q", row, 64)[0], struct.unpack_from("<Q", row, 24)[0]
        assert control <= 7 and storage <= 3
        choices = []
        if control in [4, 7]:
            pointer, count = struct.unpack_from("<QQ", row, 72)
            assert count <= 32
            for ordinal in range(count):
                entry = raw(pointer + ordinal * (32 if control == 7 else 16), 32 if control == 7 else 16)
                choices.append(dict(label=text(*struct.unpack_from("<QQ", entry)),
                                    value=text(*struct.unpack_from("<QQ", entry, 16)) if control == 7 else str(ordinal)))
        actual = dict(key=key, label=text(*struct.unpack_from("<QQ", row, 104)), page=row[145],
                      storage=storage, control=control, range=list(struct.unpack_from("<3f", row, 88)),
                      inverted=bool(row[72]) if control == 5 else False, choices=choices,
                      indent=bool(row[144]), linked=text(*struct.unpack_from("<QQ", row, 120)),
                      multiplier=struct.unpack_from("<f", row, 136)[0])
        assert actual == {key: prior[key] for key in actual}, (index, key)
        if storage == 1:
            assert prior["default"] == text(*struct.unpack_from("<QQ", row, 48)), key
        descriptors.append(actual)

    # Current AddOns status decision, stopped before every external callee.
    addon_start, addon_end = 0x14009F470, 0x14009FFCF
    addon_body = raw(addon_start, addon_end - addon_start)
    addon_machine = Uc(UC_ARCH_X86, UC_MODE_64)
    addon_machine.mem_map(0x14009F000, 4096)
    addon_machine.mem_write(addon_start, addon_body)
    addon_heap, addon_stack = 0x200000000, 0x300000000
    addon_machine.mem_map(addon_heap, 4096)
    addon_machine.mem_map(addon_stack, 65536)
    stops = {0x14009F85F: "missing", 0x14009F956: "options.addon_out_of_date",
             0x14009FCAB: "options.addon_on_demand", 0x14009FD09: "none"}

    def addon_hook(_, pc, size, unused):
        if pc in stops:
            addon_machine.emu_stop()
            return
        assert (0x14009F837 <= pc < 0x14009F864 or 0x14009F940 <= pc < 0x14009F95B
                or 0x14009FC9C <= pc < 0x14009FCB0), hex(pc)

    addon_machine.hook_add(UC_HOOK_CODE, addon_hook)
    assert text(0x145EE6EFB, 25) == "options.addon_out_of_date"
    assert text(0x145EE6EE4, 23) == "options.addon_on_demand"
    addon_cases = []
    for missing in [False, True]:
        for outdated in [False, True]:
            for demand in [False, True]:
                for check in [False, True]:
                    addon_machine.mem_write(addon_heap, bytes(4096))
                    addon_machine.mem_write(addon_heap + 0x40, struct.pack("<Q", int(missing)))
                    addon_machine.mem_write(addon_heap + 0x60, bytes([outdated, demand]))
                    addon_machine.mem_write(addon_stack, bytes(65536))
                    bp = addon_stack + 32768
                    addon_machine.mem_write(bp + 0x2D6, bytes([check]))
                    for register, arg in [(reg.UC_X86_REG_RBP, bp), (reg.UC_X86_REG_RSP, bp - 128),
                                          (reg.UC_X86_REG_R13, addon_heap),
                                          (reg.UC_X86_REG_RCX, 0x145EE6EFB),
                                          (reg.UC_X86_REG_R9, 0x145EE6EE4)]:
                        addon_machine.reg_write(register, arg)
                    addon_machine.emu_start(0x14009F837, 0, count=100)
                    status = stops[addon_machine.reg_read(reg.UC_X86_REG_RIP)]
                    expected = ("missing" if missing else "options.addon_out_of_date" if outdated and check
                                else "options.addon_on_demand" if demand else "none")
                    assert status == expected
                    if status.startswith("options."):
                        assert (addon_machine.reg_read(reg.UC_X86_REG_RCX),
                                addon_machine.reg_read(reg.UC_X86_REG_RDX)) == (
                            (0x145EE6EFB, 25) if status.endswith("date") else (0x145EE6EE4, 23))
                    addon_cases.append(dict(missing=missing, outdated=outdated,
                                            on_demand=demand, version_check=check, status=status))

    analysis_path = WORK / "analysis.json" if (WORK / "analysis.json").is_file() else KEEP / "analysis.json"
    analysis_data = analysis_path.read_bytes()
    analysis = json.loads(analysis_data)
    assert analysis["target_sha256"] == SHA
    carriers = {"producer": (SETTER, setter), "getter": (GETTER, getter),
                "addons-page": (addon_start, addon_body)}
    assert len(analysis["queries"]) == 7
    for query in analysis["queries"]:
        address, body = carriers[query["role"]]
        assert query["parameters"]["procedure"] == hex(address)
        assert query["carrier_sha256"] == digest(body) and query["carrier_bytes"] == len(body)
        response = ROOT / query["retained_response"]
        if response.is_file():
            assert digest(response.read_bytes()) == query["response_sha256"]

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    extracts = {}
    for role, start, body in [("index-producer", SETTER, setter), ("record-getter", GETTER, getter)]:
        instructions = list(decoder.disasm(body, start))
        assert sum(i.size for i in instructions) == len(body)
        extracts[role + ".asm"] = "\n".join(
            f"{i.address:016x}: {i.bytes.hex():30} {i.mnemonic} {i.op_str}".rstrip()
            for i in instructions) + "\n"
    addon_ranges = [(0x14009F816, 0x14009F824), (0x14009F837, 0x14009F864),
                    (0x14009F940, 0x14009F95B), (0x14009FC9C, 0x14009FCB0),
                    (0x14009FD09, 0x14009FD43)]
    addon_extract = []
    for start, end in addon_ranges:
        instructions = list(decoder.disasm(raw(start, end - start), start))
        assert sum(i.size for i in instructions) == end - start
        addon_extract.extend(f"{i.address:016x}: {i.bytes.hex():30} {i.mnemonic} {i.op_str}".rstrip()
                             for i in instructions)
    extracts["addons-status.asm"] = "\n".join(addon_extract) + "\n"
    proof = dict(schema_version=1, target=target, gap_ids=[17],
                 locale_table=span(TABLE, 14 * 56), index_global=hex(INDEX),
                 producer=span(SETTER, len(setter)), getter=span(GETTER, len(getter)),
                 locales=locales, added_locale_keys=ADDED,
                 previous_catalog_source_commit=PRIOR_COMMIT,
                 native_analysis=dict(path="docs/analysis/evidence/0.115.0/menu-options/analysis.json",
                                      sha256=digest(analysis_data)),
                 static_cases=dict(two_byte_codes=65536, invalid_lengths=5,
                                   getter_indices=len(indices), code_result_sha256=checks.hexdigest(),
                                   native_values_equal_to_source=14 * 2929),
                 options=dict(table=span(OPTIONS, COUNT * STRIDE), count=COUNT, stride=STRIDE,
                              compared_fields=COUNT * 11, literal_defaults=23,
                              fields_sha256=digest(json.dumps(descriptors, ensure_ascii=False,
                                  sort_keys=True, separators=(",", ":")).encode())),
                 addons=dict(owner=span(addon_start, len(addon_body)),
                             selected_ranges=[span(start, end - start) for start, end in addon_ranges],
                             native_status_cases=addon_cases),
                 limits=["Only complete original language leaf instructions run in synthetic memory; no external callee or Rust/UI execution.",
                         "Options data compares all105 descriptors and23 stored literal defaults, not engine registration, dispatch, formatting or live application.",
                         "AddOns status cases use explicit row/check flags and stop before joining, translation or empty-status construction. Metadata/dependency/account/loader behavior is separate.",
                         "All locale payloads are current data; loader/parser/startup/persistence and font contracts retain their separate historical provenance.",
                         "Co-op filter text is UI-only data; no hosting, joining, transport, server or cooperative gameplay behavior is implemented.",
                         "Compilation, actual files/VM/input/layout/fonts/rendering and original/rebuilt parity remain unverified."])
    return proof, extracts


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    proof, extracts = derive(args.write)
    serialized = json.dumps(proof, indent=2, ensure_ascii=False) + "\n"
    if args.stage:
        WORK.mkdir(parents=True, exist_ok=True)
        (WORK / "proof.json").write_text(serialized)
        for name, value in extracts.items():
            (WORK / name).write_text(value)
    else:
        assert (KEEP / "proof.json").read_text() == serialized
        for name, value in extracts.items():
            assert (KEEP / name).read_text() == value
    print(json.dumps(dict(target="0.115.0", catalogs=14, values=41006,
                         native_leaf_cases=65800, options_descriptors=105,
                         native_addon_status_cases=16,
                         source_written=args.write, parity_verified=False)))


if __name__ == "__main__":
    main()
