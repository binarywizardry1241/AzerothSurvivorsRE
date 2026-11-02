#!/usr/bin/env python3
"""Recover/check the 104 current Options descriptors and eight added defaults.

Static-only: no compiler, game, registry mutation or target file operation.
--stage writes reviewed-candidate JSON beneath runtime, never application assets.
--prepare stages bounded original-VA Ghidra inputs; --check replays native dispatch.
"""
from portable_paths import portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
TABLE, COUNT, STRIDE = 0x145DA1810, 104, 152
ASSET = ROOT / "crates/azeroth-survivors-re/assets/options.json"
WORK = ROOT / "runtime/options-0.109.0"
EVIDENCE = ROOT / "docs/analysis/evidence/0.109.0/options"
# Registered name/default pairs, independently located in this target's table.
ADDED = {
    "UnitNamePlayerPVPTitle": 0x145FFCD78,
    "gxMultisample": 0x145FFE2C8,
    "anisotropic": 0x145FFE428,
    "trilinear": 0x145FFE3D0,
    "ffxGlow": 0x145FFE798,
    "ffxDeath": 0x145FFE7F0,
    "EmoteSounds": 0x145FFD350,
    "SoundListenerAtCharacter": 0x145FFD2F8,
}
OWNERS = {"write": (0x14001D920, 0x14001DE88),
          "cvar-write": (0x140728070, 0x1407282BB),
          "default-value": (0x140723A60, 0x140723C16)}


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(portable_json(value, indent=2, ensure_ascii=False) + "\n")


def load():
    target = latest_target(verify=True)
    if target["sha256"] != SHA:
        raise ValueError("This recovery belongs only to registered 0.109.0 bytes")
    data = target_bytes(target)
    module = load_script("options_pe", ROOT / "scripts/inventory-executable.py")
    return target, data, module.PE(data)


def inspect_label(label):
    """Locate a selected-target descriptor by its exact label/pointer pair.

    This retains observed data only. A row does not establish its live setting
    consumer, default registration or file/VM behavior.
    """
    target = latest_target(verify=True)
    data = target_bytes(target)
    pe = load_script("options_label_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    encoded = label.encode("utf-8")

    def occurrences(raw):
        at = 0
        while (at := data.find(raw, at)) >= 0:
            yield at
            at += len(raw)

    def text(pointer, count):
        if not count:
            return ""
        if count > 65536:
            raise ValueError("Unbounded descriptor text")
        at = pe.rva_offset(pointer - pe.image_base)
        if at is None or at + count > len(data):
            raise ValueError("Unmapped descriptor text")
        return data[at:at + count].decode("utf-8")

    rows = []
    for literal_at in occurrences(encoded):
        va = pe.offset_va(literal_at)
        if va is None:
            continue
        for pointer_at in occurrences(struct.pack("<QQ", va, len(encoded))):
            at = pointer_at - 104
            if at < 0 or at + 152 > len(data):
                continue
            raw = data[at:at + 152]
            storage, control = struct.unpack_from("<Q", raw, 24)[0], struct.unpack_from("<Q", raw, 64)[0]
            if storage > 3 or control > 7 or raw[145] > 11:
                continue
            try:
                key = text(*struct.unpack_from("<QQ", raw, 32)) or "gamma"
                linked = text(*struct.unpack_from("<QQ", raw, 120))
                default = text(*struct.unpack_from("<QQ", raw, 48)) if storage == 1 else None
            except (ValueError, UnicodeError, struct.error):
                continue
            key_at, key_length = struct.unpack_from("<QQ", raw, 32)
            key_addresses = [pe.offset_va(hit) for hit in occurrences(key.encode("utf-8"))]
            key_addresses = [address for address in key_addresses if address is not None]
            rows.append(dict(key=key, label=label, page=raw[145], storage=storage,
                control=control, default=default, range=list(struct.unpack_from("<3f", raw, 88)),
                inverted=bool(raw[72]) if control == 5 else False, indent=bool(raw[144]),
                linked=linked, multiplier=struct.unpack_from("<f", raw, 136)[0],
                key_virtual_address=hex(key_at), key_literal_addresses=list(map(hex, key_addresses)),
                descriptor=dict(virtual_address=hex(pe.offset_va(at)), file_offset=hex(at),
                    byte_count=152, sha256=hashlib.sha256(raw).hexdigest(), bytes_hex=raw.hex())))
    return dict(target=target, rows=rows,
        limits="Exact label/pointer/descriptor data only; consumer, default registration, persistence and parity remain independent.")


def check_card_rays(contract_path):
    """Replay the retained scalar instruction contract, without a game/provider."""
    contract_path = (ROOT / contract_path).resolve()
    if not contract_path.is_relative_to(ROOT):
        raise ValueError("Contract must remain inside this checkout")
    contract = json.loads(contract_path.read_text())
    target = latest_target(verify=True)
    if any(target[key] != value for key, value in contract["target"].items()):
        raise ValueError("Card-rays contract belongs to a different installed target")
    image = target_bytes(target)
    pe = load_script("card_rays_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    query = contract["native_query"]
    response = json.loads((ROOT / query["result"]["path"]).read_text())
    native = response.get("structuredContent") or json.loads(response["content"][0]["text"])
    from discovery_native_subject import verify_native_query_subject
    verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
    for row in contract["ranges"]:
        address = int(row["address"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        payload = image[offset:offset + row["byte_count"]]
        if hashlib.sha256(payload).hexdigest() != row["sha256"]:
            raise ValueError("Card-rays native range differs: " + row["role"])
        if "bytes_hex" in row and payload.hex() != row["bytes_hex"]:
            raise ValueError("Card-rays retained bytes differ")
    observed = inspect_label(contract["descriptor"]["label"])["rows"]
    if len(observed) != 1 or any(observed[0][key] != value
            for key, value in contract["descriptor"].items()):
        raise ValueError("Card-rays descriptor differs")
    source = json.loads(ASSET.read_text())
    matches = [row for row in source["rows"] if row["key"] == contract["descriptor"]["key"]]
    if len(matches) != 1 or any(matches[0][key] != value
            for key, value in contract["descriptor"].items()):
        raise ValueError("Connected card-rays Options row differs")
    if matches[0]["default"] != contract["default"]:
        raise ValueError("Connected card-rays default differs")
    locales = json.loads((contract_path.parent / "locales.json").read_text())
    for row in locales["locales"]:
        entries = json.loads((ROOT / row["source"]).read_text())
        if any(entries.get(key) != value for key, value in row["entries"].items()):
            raise ValueError("Connected card-rays locale entries differ: " + row["code"])
    sys.path[:0] = [str(ROOT / "runtime/camera-recovery-0.105.0/python-libs"),
                   str(ROOT / "runtime/armory-recovery/python-libs")]
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_UNMAPPED
    import unicorn.x86_const as reg
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    ranges = {row["role"]: (int(row["address"], 16), int(row["address"], 16) + row["byte_count"])
              for row in contract["ranges"]}
    trim = ranges["trim"]
    enabled = ranges["enabled-predicate"]
    heap, stack, done = 0x200000000, 0x300000000, 0x400000000
    for address in (heap, stack, done):
        machine.mem_map(address, 0x10000)

    def map_image(_, access, address, size, value, unused):
        page = address & ~4095
        offset = pe.rva_offset(page - pe.image_base)
        if offset is None or not 0 <= offset < len(image):
            raise ValueError("Native scalar replay left the selected image/synthetic memory")
        machine.mem_map(page, 4096)
        machine.mem_write(page, image[offset:offset + 4096])
        return True

    def code(_, address, size, unused):
        if address == done:
            machine.emu_stop()
        elif not any(a <= address and address + size <= b for a, b in (trim, enabled)):
            raise ValueError("Unreviewed card-rays callee: " + hex(address))

    machine.hook_add(UC_HOOK_MEM_UNMAPPED, map_image)
    machine.hook_add(UC_HOOK_CODE, code)
    for case in contract["cases"]:
        payload = case["input"].encode("utf-8")
        machine.mem_write(heap, payload or b"\0")
        machine.mem_write(stack + 0x8000, struct.pack("<Q", done))
        for name, value in (("RCX", heap), ("RDX", len(payload)), ("RSP", stack + 0x8000)):
            machine.reg_write(getattr(reg, "UC_X86_REG_" + name), value)
        machine.emu_start(trim[0], done, count=100000)
        pointer = machine.reg_read(reg.UC_X86_REG_RAX)
        length = machine.reg_read(reg.UC_X86_REG_RDX)
        if bytes(machine.mem_read(pointer, length)).decode() != case["trimmed"]:
            raise ValueError("Native card-rays trim result differs")
        machine.emu_start(enabled[0], enabled[1], count=20)
        if bool(machine.reg_read(reg.UC_X86_REG_BL)) != case["enabled"]:
            raise ValueError("Native card-rays enable predicate differs")
    print(json.dumps(dict(target=target["version"], native_scalar_cases=len(contract["cases"]),
        descriptor_rows=1, limits="Isolated original scalar instructions only; no Rust compilation, settings file/VM, UI, application or parity execution.")))


def recover(data, pe):
    def blob(va, size):
        at = pe.rva_offset(va - pe.image_base)
        raw = data[at:at + size]
        assert len(raw) == size
        return raw

    def text(pointer, length):
        return blob(pointer, length).decode() if length else ""

    prior = json.loads(ASSET.read_text())
    prior_rows = {row["key"]: row for row in prior["rows"]}
    rows, defaults = [], {}
    for index in range(COUNT):
        va = TABLE + index * STRIDE
        raw = blob(va, STRIDE)
        key = text(*struct.unpack_from("<QQ", raw, 32)) or "gamma"
        control, storage = struct.unpack_from("<Q", raw, 64)[0], struct.unpack_from("<Q", raw, 24)[0]
        assert control <= 7 and storage <= 3
        choices = []
        if control in (4, 7):
            pointer, length = struct.unpack_from("<QQ", raw, 72)
            assert length <= 32
            for i in range(length):
                entry = blob(pointer + i * (32 if control == 7 else 16), 32 if control == 7 else 16)
                choices.append(dict(label=text(*struct.unpack_from("<QQ", entry)),
                    value=text(*struct.unpack_from("<QQ", entry, 16)) if control == 7 else str(i)))
        row = dict(key=key, label=text(*struct.unpack_from("<QQ", raw, 104)),
            page=raw[145], storage=storage, control=control, default=None,
            range=list(struct.unpack_from("<3f", raw, 88)),
            inverted=bool(raw[72]) if control == 5 else False, choices=choices,
            indent=bool(raw[144]), linked=text(*struct.unpack_from("<QQ", raw, 120)),
            multiplier=struct.unpack_from("<f", raw, 136)[0], source_address=hex(va))
        if key in ADDED:
            address = ADDED[key]
            pair = blob(address, 32)
            p, n, v, vn = struct.unpack("<4Q", pair)
            assert text(p, n) == key and storage == 0
            default = text(v, vn)
            defaults[key] = dict(value=default, virtual_address=hex(address),
                file_offset=hex(pe.rva_offset(address - pe.image_base)), byte_count=32,
                sha256=hashlib.sha256(pair).hexdigest())
        elif storage == 1:
            default = text(*struct.unpack_from("<QQ", raw, 48))
        elif storage == 2:
            default = "0"  # Current page-Defaults branch, retained by bindings owner.
        else:
            # Deliberately retain historical defaults outside this bounded repair.
            # Descriptor equality is not revalidation of their registration code.
            default = prior_rows[key]["default"]
        row["default"] = default
        rows.append(row)
    assert set(defaults) == set(ADDED)
    return dict(target_sha256=SHA,
        default_provenance="Eight added engine defaults and descriptor literals: 0.109.0. Other defaults retain their owning historical contracts.",
        pages=prior["pages"], rows=rows, selected_target_sha256=SHA,
        native_manifest="docs/analysis/evidence/0.109.0/options/manifest.json"), defaults


def vectors(data, pe, rows):
    # Use an already installed project-local Unicorn; do not download dependencies.
    sys.path.insert(0, str(ROOT / "runtime/armory-recovery/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    import unicorn.x86_const as r
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section["rva"], data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    stack, value = 0x200000000, 0x300000000
    u.mem_map(stack, 0x10000)
    u.mem_map(value, 4096)
    u.mem_write(value, b"1")
    stops = {0x140728070, 0x145BCCE30, 0x140724F90, 0x145BDB8D0, 0x145D99653}

    def hook(_, address, size, unused):
        if address in stops:
            u.emu_stop()
        elif not OWNERS["write"][0] <= address < OWNERS["write"][1]:
            raise RuntimeError("Unreviewed native instruction " + hex(address))

    u.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for index in range(COUNT + 1):
        u.reg_write(r.UC_X86_REG_RSP, stack + 0x8000)
        u.reg_write(r.UC_X86_REG_RCX, 0)
        u.reg_write(r.UC_X86_REG_RDX, index)
        u.reg_write(r.UC_X86_REG_R8, value)
        u.reg_write(r.UC_X86_REG_R9, 1)
        u.emu_start(OWNERS["write"][0], 0, count=500)
        pc = u.reg_read(r.UC_X86_REG_RIP)
        if index == COUNT:
            assert pc == 0x145D99653
            assert u.reg_read(r.UC_X86_REG_RDX) == COUNT
            cases.append(dict(index=index, route="bounds-rejection"))
            continue
        row = rows[index]
        assert pc == [0x140728070, 0x145BCCE30, 0x140724F90, 0x145BDB8D0][row["storage"]]
        if row["storage"] == 0:
            p, n = u.reg_read(r.UC_X86_REG_RDX), u.reg_read(r.UC_X86_REG_R8)
            assert bytes(u.mem_read(p, n)).decode() == row["key"]
            assert u.reg_read(r.UC_X86_REG_R9) == value
        cases.append(dict(index=index, key=row["key"], storage=row["storage"], first_call=hex(pc)))
    return cases


def prepare(data, pe):
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    for name, (start, end) in OWNERS.items():
        assert bounds[start] == end
        work = WORK / name
        work.mkdir(parents=True, exist_ok=True)
        at = pe.rva_offset(start - pe.image_base)
        raw = data[at:at + end - start]
        (work / "input.bin").write_bytes(raw)
        entries = [start]
        if name == "write":
            table = 0x145DA8A70
            offset = pe.rva_offset(table - pe.image_base)
            entries += [table + x for x in struct.unpack_from("<4i", data, offset)]
        entries = sorted(set(entries))
        seed = "".join(f"{a:#x}\tfunction\n{a:#x}\tcode\n" for a in entries)
        (work / "seed.tsv").write_text(seed)
        save(work / "input.json", dict(target_sha256=SHA, start=hex(start), end_exclusive=hex(end),
            byte_count=len(raw), file_offset=hex(at), sha256=hashlib.sha256(raw).hexdigest()))
        operations = [dict(name=op, arguments=dict(procedure=hex(a)))
                      for a in entries for op in ("procedure_pseudo_code", "read_function_instructions")]
        save(work / "plan.json", dict(target=str((work / "input.bin").relative_to(ROOT)),
            output=str((work / "rea-seeded").relative_to(ROOT)), init_timeout=60, timeout=240,
            environment={"REA_GHIDRA_SEED_FILE": str((work / "seed.tsv").relative_to(ROOT))},
            open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
            operations=operations))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--stage", action="store_true")
    mode.add_argument("--prepare", action="store_true")
    mode.add_argument("--check", action="store_true")
    mode.add_argument("--inspect-label", help="Print exact selected-target descriptor candidates without writing")
    mode.add_argument("--check-card-rays", metavar="CONTRACT", help="Verify/replay a retained current card-rays scalar contract")
    args = parser.parse_args()
    if args.check_card_rays is not None:
        check_card_rays(args.check_card_rays)
        return
    if args.inspect_label is not None:
        print(json.dumps(inspect_label(args.inspect_label), indent=2, ensure_ascii=False))
        return
    target, data, pe = load()
    if args.prepare:
        prepare(data, pe)
        print("Prepared original-VA bounded Ghidra plans in runtime/options-0.109.0")
        return
    asset, defaults = recover(data, pe)
    if args.stage:
        save(WORK / "options.json", asset)
        save(WORK / "added-defaults.json", defaults)
        print("Staged 104 descriptors and eight current defaults for review")
        return
    assert portable_record(json.loads(ASSET.read_text())) == portable_record(asset)
    cases = vectors(data, pe, asset["rows"])
    manifest = json.loads((EVIDENCE / "manifest.json").read_text())
    assert manifest["target_sha256"] == SHA and manifest["added_defaults"] == defaults
    retained_defaults = sorted((r["key"], r["default"]) for r in asset["rows"]
                               if r["key"] not in ADDED and r["storage"] in (0, 3))
    assert hashlib.sha256(json.dumps(retained_defaults, ensure_ascii=False,
        separators=(",", ":")).encode()).hexdigest() == manifest["retained_nonliteral_defaults_sha256"]
    assert len(cases) == manifest["native_dispatch"]["cases"]
    assert hashlib.sha256(json.dumps(cases, sort_keys=True,
        separators=(",", ":")).encode()).hexdigest() == manifest["native_dispatch"]["cases_sha256"]
    for row in manifest["ranges"]:
        at = pe.rva_offset(int(row["virtual_address"], 16) - pe.image_base)
        assert hashlib.sha256(data[at:at + row["byte_count"]]).hexdigest() == row["sha256"]
    for row in manifest["extracts"]:
        assert hashlib.sha256((EVIDENCE / row["path"]).read_bytes()).hexdigest() == row["sha256"]
    locale_checks = 0
    for path in sorted((ASSET.parent / "locales").glob("*.json")):
        locale = json.loads(path.read_text())
        for key in ADDED:
            for suffix in ("", ".tip"):
                assert isinstance(locale["opt." + key + suffix], str)
                locale_checks += 1
        for key in ("gxMultisample", "anisotropic"):
            assert isinstance(locale["opt." + key + ".1"], str)
            locale_checks += 1
    assert locale_checks == 252
    print(json.dumps(dict(target="0.109.0", descriptor_comparisons=len(asset["rows"]),
        added_default_comparisons=len(defaults), native_dispatch_cases=len(cases),
        locale_key_checks=locale_checks,
        limits="Stops before first external call; no registry/VM/UI/filesystem/runtime/parity execution.")))


if __name__ == "__main__":
    main()
