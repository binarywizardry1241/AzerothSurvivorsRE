#!/usr/bin/env python3
"""Static 0.105.0 boundary recovery; never compile or launch the game.

Unicorn runs original sampling, floor/filter and GameObject instructions.
Explicit seams cover libm, terrain answers, Vec growth, field-map insertion and
packet delivery. Generated evidence and REA plans stay under ignored runtime/.
"""
from portable_paths import objdump_output, portable_json, portable_record
from native_recovery import f32 as _shared_f32
from script_sources import load_script
import argparse
import hashlib
import json
import math
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
OUT = ROOT / "runtime/analysis/history/movement/boundary-pillars/ca2d08dc2dd8"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/boundary-pillars"
TABLE = 0x146BA9450
BEGIN = 0x145917CC0
CREATE = 0x145944080
DESCRIPTOR = 0x146E78E28
RANGES = {
    "boundary-start": (0x145919C2F, 0x14591A170),
    "boundary-circle": (0x14591A239, 0x14591A3B9),
    "boundary-callers": (0x145901DFA, 0x145901E43),
    "boundary-movement-start": (0x1458F9498, 0x1458F94C1),
    "create-pillar": (CREATE, 0x145944BAD),
}


def save(path, value):
    path.write_text(portable_json(value, indent=2, allow_nan=False) + "\n")


def f32(value):
    return _shared_f32(value)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare-rea", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA, "Selected EXE hash mismatch"
    module = load_script("pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    OUT.mkdir(parents=True, exist_ok=True)

    def raw(address, size):
        at = pe.rva_offset(address - pe.image_base)
        return data[at:at + size]

    def span(address, end):
        return dict(start=hex(address), end_exclusive=hex(end),
                    file_offset=hex(pe.rva_offset(address - pe.image_base)),
                    sha256=hashlib.sha256(raw(address, end - address)).hexdigest())

    zones, zone_ranges = [], []
    for index in range(12):
        address = TABLE + index * 240
        record = raw(address, 240)
        key_ptr, key_len = struct.unpack_from("<QQ", record, 8)
        pointer, count = struct.unpack_from("<QQ", record, 88)
        zones.append(dict(key=raw(key_ptr, key_len).decode(),
                          center=list(struct.unpack_from("<ff", record, 200)),
                          radius=struct.unpack_from("<f", record, 216)[0],
                          indoor=bool(record[236]),
                          polygon=[list(struct.unpack("<ff", raw(pointer + n * 8, 8)))
                                   for n in range(count)]))
        zone_ranges.append(dict(role=zones[-1]["key"], **span(address, address + 240)))
        if count:
            zone_ranges.append(dict(role=zones[-1]["key"] + "-polygon",
                                    **span(pointer, pointer + count * 8)))
    # Reuse the actual floor-zone source only after exact current-target equality.
    zone_asset = ROOT / "crates/azeroth-survivors-re/assets/native-floor-zones-0.100.1.json"
    assert portable_record(zones) == portable_record(json.loads(zone_asset.read_text())), "Current boundary inputs drifted"
    assert [i for i, zone in enumerate(zones) if zone["polygon"]] == [2, 7]
    assert struct.unpack("<IIf", raw(DESCRIPTOR, 12)) == (9013, 4831, 1.0)

    owners = []
    for name, (start, end) in RANGES.items():
        if name == "create-pillar":
            assert bounds[start] == end
        assembly = objdump_output([
            "objdump", "-d", "--no-show-raw-insn", f"--start-address={start:#x}",
            f"--stop-address={end:#x}", str(TARGET.relative_to(ROOT)),
        ], cwd=ROOT, text=True)
        (OUT / (name + ".asm")).write_text(assembly)
        owners.append(dict(role=name, **span(start, end), assembly=name + ".asm"))
    for name, start in [("game-begin", BEGIN), ("create-pillar", CREATE)]:
        binary = OUT / (name + ".bin")
        binary.write_bytes(raw(start, bounds[start] - start))
        plan = dict(target=str(binary.relative_to(ROOT)),
                    output=str((OUT / ("rea-" + name)).relative_to(ROOT)),
                    init_timeout=60, timeout=240,
                    open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                    operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)))])
        if args.prepare_rea:
            save(OUT / (name + "-plan.json"), plan)

    if args.prepare_rea:
        print("Staged two current-hash REA/Ghidra plans under runtime/analysis/history/movement/boundary-pillars/ca2d08dc2dd8")
        return

    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn import x86_const as x
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    end = max(section["rva"] + max(section["virtual_size"], section["raw_size"])
              for section in pe.sections)
    uc.mem_map(pe.image_base, (end + 4095) & ~4095)
    for section in pe.sections:
        uc.mem_write(pe.image_base + section["rva"],
                     data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    mem, stack = 0x200000000, 0x300000000
    uc.mem_map(mem, 0x80000)
    uc.mem_map(stack, 0x20000)
    frame, points, terrain = stack + 0x10000, mem + 0x30000, mem + 0x10000
    context = {}

    def put(at, fmt, *values):
        uc.mem_write(at, struct.pack(fmt, *values))

    def get(at, fmt):
        return struct.unpack(fmt, uc.mem_read(at, struct.calcsize(fmt)))

    def reg(name, value=None):
        key = getattr(x, "UC_X86_REG_" + name)
        if value is None:
            return uc.reg_read(key)
        uc.reg_write(key, value)

    def xmm(index, value=None):
        if value is None:
            return struct.unpack("<f", struct.pack("<I", reg("XMM" + str(index)) & 0xFFFFFFFF))[0]
        reg("XMM" + str(index), struct.unpack("<I", struct.pack("<f", value))[0])

    def ret():
        sp = reg("RSP")
        reg("RIP", get(sp, "<Q")[0])
        reg("RSP", sp + 8)

    def hook(_, address, size, unused):
        mode = context["mode"]
        if address == context["stop"]:
            uc.emu_stop()
        elif address == 0x1458753B0:
            reg("RAX", context["zone"])
            ret()
        elif address in (0x145BC97F9, 0x145BC981D, 0x145BC97C3, 0x145BC97BD):
            value = {0x145BC97F9: lambda: math.hypot(xmm(0), xmm(1)),
                     0x145BC981D: lambda: math.ceil(xmm(0)),
                     0x145BC97C3: lambda: math.cos(xmm(0)),
                     0x145BC97BD: lambda: math.sin(xmm(0))}[address]()
            xmm(0, f32(value))
            ret()
        elif address == 0x145BFB120:
            # Vec capacity/allocation is outside the geometric contract.
            header = reg("RCX")
            put(header, "<QQ", 4096, points)
            ret()
        elif address == 0x1458C7B60:
            context["height_queries"] += 1
            height = context.get("primary")
            reg("RAX", int(height is not None))
            xmm(0, 0.0 if height is None else height)
            ret()
        elif address == 0x1458CC950:
            height = context.get("secondary")
            put(reg("RCX"), "<Ifff", int(height is not None), 0.0, 0.0,
                0.0 if height is None else height)
            ret()
        elif address == CREATE and mode == "filter":
            context["objects"].append(list(get(reg("R8"), "<fff")))
            assert reg("RDX") == DESCRIPTOR and reg("R9") == 5
            assert get(reg("RSP") + 0x28, "<I")[0] == 16
            ret()
        elif address == 0x1458A8BA0 and mode == "object":
            guid = reg("R8")
            context["fields"].update({0: guid & 0xFFFFFFFF, 1: guid >> 32})
            ret()
        elif address == 0x1458E1710 and mode == "object":
            field = get(reg("RDX") + 0x20, "<Q")[0]
            context["fields"][field] = reg("R8") & 0xFFFFFFFF
            ret()
        elif not any(a <= address < b for a, b in RANGES.values()):
            raise RuntimeError("Unreviewed native instruction " + hex(address))

    uc.hook_add(UC_HOOK_CODE, hook)

    def reset(mode, stop, zone=0, **values):
        uc.mem_write(mem, bytes(0x80000))
        uc.mem_write(stack, bytes(0x20000))
        for name in ["RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "R8", "R9",
                     "R10", "R11", "R12", "R13", "R14", "R15"]:
            reg(name, 0)
        for n in range(16):
            reg("XMM" + str(n), 0)
        reg("MXCSR", 0x1F80)
        reg("RBP", frame)
        reg("RSP", frame - 0x800)
        reg("R13", mem)
        put(frame + 0x138, "<Q", mem)
        put(mem + 0x950, "<Q", terrain)
        context.clear()
        context.update(mode=mode, stop=stop, zone=zone, objects=[], fields={}, height_queries=0, **values)

    shapes = []
    for index, zone in enumerate(zones):
        reset("shape", 0x145919E9D, index)
        uc.emu_start(0x145919C2F, 0, count=1000000)
        assert reg("RIP") == context["stop"]
        _, pointer, count = get(frame + 0x140, "<QQQ")
        xy = [list(get(pointer + n * 8, "<ff")) for n in range(count)]
        shapes.append(dict(zone=zone["key"], points=xy))

    filters = []
    for index in [0, 2, 6, 7, 11]:
        zone = zones[index]
        xy = [zone["center"][0] + 2.5, zone["center"][1] + 2.5]
        for primary, secondary, grid in [(30.0, None, "absent"), (None, 40.0, "absent"),
                                          (None, None, "absent"), (30.0, None, "clear"),
                                          (30.0, None, "blocked"), (30.0, None, "outside")]:
            reset("filter", 0x14591A170, index, primary=primary, secondary=secondary)
            put(frame + 0xF0, "<Q", TABLE + index * 240)
            put(frame + 0x140, "<QQQ", 4096, points, 1)
            put(points, "<ff", *xy)
            reg("RSI", 1)
            put(terrain + 0xB8, "<f", 50.0)
            put(terrain + 0x68, "<q", 0 if secondary is not None else -1)
            put(terrain + 0x40, "<q", -1 if grid == "absent" else 0)
            if grid != "absent":
                origin = xy if grid == "outside" else zone["center"]
                put(terrain + 0x48, "<QQQff", mem + 0x20000, 16, 4, *origin)
                uc.mem_write(mem + 0x20000, bytes([int(grid == "blocked")]) * 16)
            uc.emu_start(0x145919E9D, 0, count=10000)
            assert reg("RIP") == context["stop"]
            filters.append(dict(zone=zone["key"], point=xy, primary=primary,
                                secondary=secondary, fallback=50.0, grid=grid,
                                expected=context["objects"], primary_queries=context["height_queries"]))

    objects = []
    for counter in [0, 0x00FFFFFF, 0xFFFFFFFF]:
        for words in [[1, 2, 3, 4], [0xFFFFFFFFFFFFFFFF] * 4,
                      [0x123456789ABCDEF0, 0x0FEDCBA987654321,
                       0x778899AABBCCDD00, 0xAAAABBBBCCCCDDDD]]:
            reset("object", 0x1458A8160)
            sp = frame + 8
            reg("RSP", sp)
            reg("RCX", mem)
            reg("RDX", DESCRIPTOR)
            reg("R8", points)
            reg("R9", 5)
            put(sp + 0x28, "<I", 16)
            put(points, "<fff", 1.25, -2.5, 30.0)
            put(mem + 0xA0C, "<I", counter)
            put(mem + 0x958, "<QQQQ", *words)
            uc.emu_start(CREATE, 0, count=100000)
            assert reg("RIP") == context["stop"]
            assert reg("R8") == 5 and reg("RDX") >> 48 == 0xF110
            orientation = get(reg("RSP") + 0x28, "<f")[0]
            assert context["fields"][18] == struct.unpack("<I", struct.pack("<f", orientation))[0]
            objects.append(dict(counter=counter, words=words, guid=reg("RDX"),
                                orientation=orientation,
                                fields=[[k, v] for k, v in sorted(context["fields"].items())],
                                next_counter=get(mem + 0xA0C, "<I")[0],
                                next_words=list(get(mem + 0x958, "<QQQQ"))))

    fixtures = dict(target_sha256=SHA, shapes=shapes, filters=filters, objects=objects)
    # One record per line keeps the complete numerical fixtures reviewable
    # without thousands of formatting-only lines or a second native extract.
    lines = ['{', '  "target_sha256": ' + json.dumps(SHA) + ',']
    for name in ["shapes", "filters", "objects"]:
        lines.append('  "' + name + '": [')
        lines.append(',\n'.join('    ' + json.dumps(row, separators=(',', ':')) for row in fixtures[name]))
        lines.append('  ]' + (',' if name != 'objects' else ''))
    (OUT / "native-fixtures.json").write_text('\n'.join(lines) + '\n}\n')
    rea = []
    for name, start in [("game-begin", BEGIN), ("create-pillar", CREATE)]:
        response = OUT / ("rea-" + name) / "003-procedure_pseudo_code.json"
        if not response.exists() and args.check:
            retained = json.loads((RETAINED / "manifest.json").read_text())
            assert retained["target_sha256"] == SHA
            record = next(row for row in retained["rea"] if row["role"] == name)
            assert all(record[key] == value for key, value in span(start, bounds[start]).items())
            rea.append(record)
            continue
        result = json.loads(response.read_text())["response"]["result"]
        evidence = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        assert evidence["subject"]["digest"]["sha256"] == span(start, bounds[start])["sha256"]
        assert evidence["provider"]["id"] == "ghidra"
        rea.append(dict(role=name, **span(start, bounds[start]), evidence_id=evidence["evidence_id"]))
        # Keep only the selected native boundary ranges in curated assembly;
        # full raw-slice decompilations stay disposable in runtime/.
    manifest = dict(target=str(TARGET.relative_to(ROOT)), target_sha256=SHA,
                    target_process_launched=False, owners=owners, rea=rea,
                    zone_source=str(zone_asset.relative_to(ROOT)),
                    zone_source_sha256=hashlib.sha256(zone_asset.read_bytes()).hexdigest(),
                    zone_ranges=zone_ranges, descriptor=span(DESCRIPTOR, DESCRIPTOR + 12),
                    constants=[dict(value=struct.unpack("<f", raw(a, 4))[0], **span(a, a + 4))
                               for a in [0x145D6D650, 0x145D74048, 0x145D6D270,
                                         0x145D6D36C, 0x145D9AE90]],
                    validation=dict(zones=len(shapes), filter_cases=len(filters), object_cases=len(objects)),
                    limits=["Unchanged native instructions with controlled terrain/map/packet/allocation seams.",
                            "Host-rounded libm seams do not establish Windows CRT bit parity.",
                            "Ghidra imports omit external code/data and infer a generic ABI; original PE instructions own arguments.",
                            "No Rust compilation, test executable, MPQ-content read, game process or rendered comparison."])
    save(OUT / "manifest.json", manifest)
    if args.check:
        assert portable_record(json.loads((RETAINED / "native-fixtures.json").read_text())) == portable_record(fixtures)
        assert portable_record(json.loads((RETAINED / "manifest.json").read_text())) == portable_record(manifest)
        for owner in owners:
            assert (RETAINED / owner["assembly"]).read_bytes() == (OUT / owner["assembly"]).read_bytes()
    print("Verified 12 current zone inputs, 12 native shapes, 30 floor/filter cases and 9 object/counter/RNG cases")
    print("Pillar counts:", {row["zone"]: len(row["points"]) for row in shapes})


if __name__ == "__main__":
    main()
