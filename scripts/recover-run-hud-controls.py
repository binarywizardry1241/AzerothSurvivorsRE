#!/usr/bin/env python3
"""Recover/check selected 0.105.0 HUD controls without builds or game launches.

Ghidra responses remain under ignored runtime/. Curated procedures contain only
selected owners; the shared HUD constructor is owned by the layout manifest.
Unicorn runs bounded original instruction blocks with explicit input seams.
"""
from portable_paths import objdump_output, portable_json, portable_record
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/analysis/history/findings/fixgap7-controls/0a67d4e83b28"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/run-hud"
OWNERS = {
    "scale": (0x14003DB10, "rea-scale"),
    "visibility": (0x14036F970, "rea-visibility"),
    "drag-start": (0x1402788C0, "rea-drag-activation"),
    "drag-update-save": (0x140275650, "rea-owner-140275650"),
    "placement": (0x140277C70, "../game-mode-audit-0.105.0/rea-run-hud"),
    "frame-bounds": (0x140639A80, "rea-minimap-bounds"),
    "pause-panel": (0x14027A720, "rea-persistence-candidate"),
    "pause-actions": (0x140279DB0, "rea-pause-input"),
    "pause-children": (0x1401B3D20, "rea-pause-children"),
    "panel-style": (0x140012C60, None),
    "storage-base": (0x1458DCB00, None),
    "storage-read": (0x1458DDB50, None),
    "storage-write": (0x1458DC8C0, None),
}

# Only the producer/consumer link is needed here; keep unrelated paint and model
# conversion bodies in runtime/ rather than copying their complete procedures.
FRAME_SPANS = [
    ("resource-id-init", 0x140C5659F, 0x140C5660A, 0x140C56170),
    ("resource-id-state-field", 0x140C568B7, 0x140C568D3, 0x140C56170),
    ("resource-fetch", 0x140C571D7, 0x140C57223, 0x140C56EC0),
    ("resource-wrapper", 0x140C57502, 0x140C57522, 0x140C56EC0),
    ("paint-resource-argument", 0x140C575B8, 0x140C57611, 0x140C56EC0),
    ("paint-stack-frame", 0x140BFA140, 0x140BFA15B, 0x140BFA140),
    ("paint-empty-slot", 0x140BFA896, 0x140BFA89F, 0x140BFA140),
    ("convert-slot-argument", 0x140BFBA87, 0x140BFBA98, 0x140BFA140),
    ("paint-call-convert", 0x140BFBAD7, 0x140BFBAFC, 0x140BFA140),
    ("paint-publish-slot", 0x140BFC46D, 0x140BFC49F, 0x140BFA140),
    ("convert-stack-frame", 0x140C01C70, 0x140C01C8B, 0x140C01C70),
    ("convert-coordinate-transform", 0x140C01CE4, 0x140C01D74, 0x140C01C70),
    ("convert-minimap-variant", 0x140C0248D, 0x140C0253A, 0x140C01C70),
    ("quad-debug-variant-dispatch", 0x140C76793, 0x140C767C5, 0x140C76780),
    ("quad-debug-minimap-name", 0x140C76ABD, 0x140C76B2D, 0x140C76780),
]
SUPPORTING_ANALYSIS = {
    "minimap-paint": (0x140BFA140, "rea-minimap-paint"),
    "quad-convert": (0x140C01C70, "rea-quad-convert"),
    "quad-content-debug": (0x140C76780, "rea-frame-rect-producer"),
    "touch-input-producer": (0x144562920, "rea-fallback-touch-input"),
    "touch-drag-system-init": (0x140285AE0, "rea-fallback-drag-init"),
}
PERSISTENCE_LIFETIME_SPANS = [
    ("screens-plugin-register", 0x140063E36, 0x140063E52, 0x140063DF0),
    ("screens-plugin-name", 0x14006F540, 0x14006F54D, 0x14006F540),
    ("plugin-build-dispatch", 0x144DD2BE5, 0x144DD2BFD, 0x144DD28A0),
    ("persistence-setup-call", 0x140042D1B, 0x140042D2B, 0x14003FC40),
]
TOUCH_FALLBACK_SPANS = [
    ("touch-resource-id", 0x140028A99, 0x140028AC5, 0x140028A40),
    ("touch-resource-descriptor", 0x140028C7F, 0x140028CAF, 0x140028A40),
    ("drag-touch-resource-init", 0x140285BFE, 0x140285C16, 0x140285AE0),
    ("drag-touch-resource-state", 0x140285C60, 0x140285C7C, 0x140285AE0),
    ("drag-touch-resource-fetch", 0x140285F3F, 0x140285F83, 0x140285E80),
    ("drag-touch-resource-data", 0x140285FB2, 0x140285FD1, 0x140285E80),
    ("drag-touch-resource-argument", 0x14028602E, 0x1402860A0, 0x140285E80),
    ("input-touch-resource-init", 0x144569CA4, 0x144569CDC, 0x144569C30),
    ("input-touch-resource-state", 0x144569CED, 0x144569D05, 0x144569C30),
    ("input-touch-resource-fetch", 0x144569E8E, 0x144569EDD, 0x144569E50),
    ("input-touch-resource-call", 0x144569F1C, 0x144569F7F, 0x144569E50),
    ("input-clear-three-transient-maps", 0x144562944, 0x144562A64, 0x144562920),
    ("input-preserve-previous-position", 0x144562AA4, 0x144562B1F, 0x144562920),
    ("input-position-from-event", 0x144562BF0, 0x144562D08, 0x144562920),
    ("input-phase-dispatch", 0x144562D4D, 0x144562D6A, 0x144562920),
    ("pressed-map-iterator", 0x143608050, 0x143608089, 0x143608050),
]


def write(path, value):
    path.write_text(portable_json(value, indent=2, ensure_ascii=False) + "\n")


def native_vectors(data, pe):
    # Uses an existing project-local analysis dependency; never installs it.
    sys.path.insert(0, str(ROOT / "runtime/tool-state/python/armory/python-libs"))
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RAX, UC_X86_REG_RCX,
                                  UC_X86_REG_RDX, UC_X86_REG_RDI,
                                  UC_X86_REG_RBX, UC_X86_REG_RBP,
                                  UC_X86_REG_RSI, UC_X86_REG_RSP,
                                  UC_X86_REG_XMM0, UC_X86_REG_XMM1, UC_X86_REG_XMM2,
                                  UC_X86_REG_XMM4, UC_X86_REG_XMM5,
                                  UC_X86_REG_XMM6, UC_X86_REG_XMM7,
                                  UC_X86_REG_XMM8, UC_X86_REG_XMM11,
                                  UC_X86_REG_XMM12, UC_X86_REG_XMM13,
                                  UC_X86_REG_RIP, UC_X86_REG_MXCSR)
    u = Uc(UC_ARCH_X86, UC_MODE_64)
    extent = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    u.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        u.mem_write(pe.image_base + section["rva"],
                    data[section["raw_offset"]:section["raw_offset"] + section["raw_size"]])
    scratch = 0x200000000
    u.mem_map(scratch, 0x10000)
    spans = [(0x14003DBB6, 0x14003DBFC), (0x14036FE31, 0x14036FE3F),
             (0x1402758B3, 0x1402758B9), (0x1402784C1, 0x140278511),
             (0x14027A436, 0x14027A452), (0x140277DE8, 0x140277E0D),
             (0x140278123, 0x1402781B9), (0x1402789D5, 0x140278A74),
             (0x143608050, 0x143608089)]
    stops = {b for a, b in spans} | {0x140279F24, 0x14027A48E, 0x14027901D}

    def hook(_, address, size, user):
        if address in stops:
            u.emu_stop()
        elif not any(a <= address < b for a, b in spans):
            raise RuntimeError("Unreviewed instruction " + hex(address))

    u.hook_add(UC_HOOK_CODE, hook)

    def f32(value):
        return struct.unpack("<f", struct.pack("<f", value))[0]

    def bits(value):
        return struct.unpack("<I", struct.pack("<f", value))[0]

    def vector(reg, values):
        u.reg_write(reg, int.from_bytes(struct.pack("<4f", *values), "little"))

    def scalar(reg):
        return struct.unpack("<f", struct.pack("<I", u.reg_read(reg) & 0xFFFFFFFF))[0]

    def run(a):
        u.reg_write(UC_X86_REG_MXCSR, 0x1F80)
        u.emu_start(a, 0, count=1000)
        pc = u.reg_read(UC_X86_REG_RIP)
        assert pc in stops
        return pc

    scales = []
    for word in [0, 0x80000000, bits(-2), bits(0.25), bits(0.5), bits(0.75),
                 bits(1), bits(1.5), bits(2), bits(3), 0x7F7FFFFF,
                 0x7F800000, 0xFF800000, 0x7FC00000, 0x7F800001]:
        for error in [0, 1]:
            u.reg_write(UC_X86_REG_RDI, word << 32 | error)
            run(0x14003DBB6)
            scales.append(dict(parsed_bits=f"{word:08x}", parse_error=bool(error),
                               expected_bits=f"{u.reg_read(UC_X86_REG_XMM0) & 0xFFFFFFFF:08x}"))
    visibility = []
    for value in ["", "0", "1", "00", "false", "0.0", "-0", "yes"]:
        u.mem_write(scratch, value.encode() + b"\0")
        u.reg_write(UC_X86_REG_RAX, scratch)
        u.reg_write(UC_X86_REG_RDX, len(value.encode()))
        run(0x14036FE31)
        visibility.append(dict(trimmed=value, expected=bool(u.reg_read(UC_X86_REG_RCX) & 0xFF)))
    drags = []
    for initial, start, current in [((100, 50), (115, 75), (155, 95)),
                                     ((0, 0), (0, 0), (-10, -20)),
                                     ((1000, 800), (50, 50), (0, 0))]:
        vector(UC_X86_REG_XMM6, [*initial, 0, 0])
        vector(UC_X86_REG_XMM7, [*start, 0, 0])
        vector(UC_X86_REG_XMM0, [*current, 0, 0])
        run(0x1402758B3)
        result = struct.unpack("<2f", (u.reg_read(UC_X86_REG_XMM6) & ((1 << 64) - 1)).to_bytes(8, "little"))
        drags.append(dict(initial=initial, pointer_start=start, pointer_now=current, expected=result))
    placements = []
    for scale in [0.5, 1, 2]:
        for viewport in [(1280, 720), (100, 50)]:
            for position in [(-5, -10), (20, 30), (2000, 1000)]:
                for node in [(200, 80), (0, 0)]:
                    vector(UC_X86_REG_XMM2, [0, 0, 0, 0])
                    vector(UC_X86_REG_XMM6, [scale, 0, 0, 0])
                    vector(UC_X86_REG_XMM7, [viewport[0], 0, 0, 0])
                    vector(UC_X86_REG_XMM8, [viewport[1], 0, 0, 0])
                    vector(UC_X86_REG_XMM12, [node[0], 0, 0, 0])
                    vector(UC_X86_REG_XMM11, [node[1], 0, 0, 0])
                    vector(UC_X86_REG_XMM13, [*position, 0, 0])
                    run(0x1402784C1)
                    placements.append(dict(ui_scale=scale, viewport=viewport,
                        logical_node_size_before_ui_scale=node, stored=position,
                        expected=[scalar(UC_X86_REG_XMM5), scalar(UC_X86_REG_XMM4)]))
    defaults = []
    for scale in [0.5, 1, 2]:
        for viewport_width in [1280, 800]:
            for rect in [None, [1000, 0, 1001, 200], [1000, 0, 1200, 200], [2000, 0, 2200, 200]]:
                bp = scratch + 0x1000
                u.mem_write(bp - 0x60, struct.pack("<I4f", int(rect is not None), *(rect or [0, 0, 0, 0])))
                u.reg_write(UC_X86_REG_RBP, bp)
                run(0x140277DE8)
                valid = bool(u.reg_read(UC_X86_REG_RBX) & 0xFF)
                u.reg_write(UC_X86_REG_RAX, 0)
                u.reg_write(UC_X86_REG_RCX, 0)
                vector(UC_X86_REG_XMM6, [scale, 0, 0, 0])
                vector(UC_X86_REG_XMM7, [viewport_width, 0, 0, 0])
                vector(UC_X86_REG_XMM11, [rect[0] if rect else 0, 0, 0, 0])
                run(0x140278123)
                left, right, _, _ = struct.unpack("<4f", u.reg_read(UC_X86_REG_XMM0).to_bytes(16, "little"))
                defaults.append(dict(ui_scale=scale, viewport_width=viewport_width, frame_rect=rect,
                    frame_width_gt_one=valid, expected=dict(build_left=left,
                        build_top=f32(scalar(UC_X86_REG_XMM1) / scale), tally_top=left, tally_right=right)))
    confirmation = []
    for armed in [False, True]:
        for start in [0, 10, 32768]:
            for delta in [0, 0.349, 0.35, 0.351, 2.999, 3, 3.001]:
                u.mem_write(scratch + 0x18, struct.pack("<If", int(armed), start))
                u.reg_write(UC_X86_REG_RCX, scratch)
                vector(UC_X86_REG_XMM0, [start + delta, 0, 0, 0])
                vector(UC_X86_REG_XMM6, [0.35, 0, 0, 0])
                vector(UC_X86_REG_XMM7, [3, 0, 0, 0])
                pc = run(0x14027A436)
                confirmation.append(dict(armed=armed, start=start, now=f32(start + delta),
                    expected={0x14027A452: "accept", 0x140279F24: "ignore", 0x14027A48E: "arm"}[pc]))
    touch_fallback = []
    for entries in [[], [(0, (123, 456))], [(5, (-10, 42))],
                    [(5, (11, 22)), (10, (33, 44))],
                    [(20, (800, 600))], [(31, (7, 9))]]:
        table, resource, stack = scratch + 0x4000, scratch + 0x2000, scratch + 0x8000
        control = bytearray(b"\xff" * 48)
        for index, pos in entries:
            control[index] = 0
            u.mem_write(table - index * 136 - 8, struct.pack("<2f", *pos))
        u.mem_write(table, bytes(control))
        u.mem_write(resource, struct.pack("<4Q", table, 31, 0, len(entries)))
        u.reg_write(UC_X86_REG_RSI, resource)
        u.reg_write(UC_X86_REG_RSP, stack)
        pc = run(0x1402789D5)
        result = None if pc == 0x14027901D else list(struct.unpack("<2f",
            (u.reg_read(UC_X86_REG_XMM6) & ((1 << 64) - 1)).to_bytes(8, "little")))
        touch_fallback.append(dict(pressed_bucket_positions=entries, expected=result))
    return dict(scale=scales, visibility=visibility, drag=drags,
                placement=placements, defaults=defaults, confirmation=confirmation,
                touch_fallback=touch_fallback,
                seams=["Scale starts after the native f32 parser; error and parsed bits are explicit inputs.",
                       "Visibility starts after native trim/CVar lookup; missing values default true in the owner.",
                       "Drag inputs are window-logical pointer coordinates; window/pointer selection is not emulated.",
                       "Placement enters the Some(Vec2) clamp block; node size already includes inverse_scale_factor.",
                       "Default placement executes the actual optional-rect width guard and default-offset preparation; query supplies a window-logical rectangle.",
                       "Confirmation runs only the timestamp acceptance branch, before dispatch.",
                       "Touch fallback starts after the window-cursor path failed; fixtures supply pressed-map buckets, and the native iterator/selection blocks run unchanged."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--prepare-native", action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert hashlib.sha256(data).hexdigest() == SHA
    module = load_script("inventory", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    bounds = {a + pe.image_base: b + pe.image_base for a, b, *_ in pe.functions()}
    if args.check:
        manifest = json.loads((RETAINED / "controls-manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        for row in (manifest["procedures"] + manifest.get("fragments", []) +
                    manifest.get("supporting_native_analysis", []) + manifest["literals"]):
            start = int(row["virtual_address"], 16)
            off = pe.rva_offset(start - pe.image_base)
            assert off == int(row["file_offset"], 16)
            assert hashlib.sha256(data[off:off + row["byte_count"]]).hexdigest() == row["sha256"]
            if "end_exclusive" in row:
                assert bounds[start] == int(row["end_exclusive"], 16)
            if "owning_function" in row:
                owner = int(row["owning_function"], 16)
                if owner in bounds:
                    assert owner <= start < start + row["byte_count"] <= bounds[owner]
                else:
                    assert row.get("leaf_without_exception_record") and owner == start
            for kind in ["assembly", "pseudocode"]:
                if kind in row:
                    assert hashlib.sha256((RETAINED / row[kind]).read_bytes()).hexdigest() == row[kind + "_sha256"]
        expected = json.loads((RETAINED / "controls-vectors.json").read_text())
        # Round-trip converts tuple inputs to their portable JSON array form.
        assert portable_record(json.loads(json.dumps(native_vectors(data, pe)))) == portable_record(expected)
        count = sum(len(value) for key, value in expected.items() if key != "seams")
        print(f"Verified HUD control owner hashes and {count} bounded native vectors; no build or game launch")
        return
    if args.prepare_native:
        for role, (start, _) in (OWNERS | SUPPORTING_ANALYSIS).items():
            end = bounds[start]
            off = pe.rva_offset(start - pe.image_base)
            name = "controls-" + role
            path = WORK / "prepared" / (name + ".bin")
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(data[off:off + end - start])
            write(path.with_suffix(".plan.json"), dict(target=str(path.relative_to(ROOT)),
                output=str((path.parent / ("rea-" + name)).relative_to(ROOT)),
                init_timeout=60, timeout=240,
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)))]))
        print("Prepared selected HUD control slices and static REA/Ghidra plans under runtime/")
        return
    out = WORK / "curated"
    out.mkdir(parents=True, exist_ok=True)
    rows = []
    for role, (start, evidence) in OWNERS.items():
        end = bounds[start]
        off = pe.rva_offset(start - pe.image_base)
        raw = data[off:off + end - start]
        name = "controls-" + role
        asm = objdump_output(["objdump", "-d", "--no-show-raw-insn",
            f"--start-address={start:#x}", f"--stop-address={end:#x}", str(TARGET)],
            text=True, cwd=ROOT)
        # Remove the machine-specific objdump file banner, preserve instructions.
        asm = asm[asm.index("Disassembly of section"):]
        (out / (name + ".asm")).write_text(asm)
        row = dict(role=role, virtual_address=hex(start), end_exclusive=hex(end),
                   file_offset=hex(off), byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest(),
                   assembly=name + ".asm", assembly_sha256=hashlib.sha256(asm.encode()).hexdigest())
        if evidence:
            response = json.loads((WORK / evidence / "003-procedure_pseudo_code.json").read_text())["response"]["result"]
            record = response.get("structuredContent") or json.loads(response["content"][0]["text"])
            subject = Path(record["subject"]["local_path"]).read_bytes()
            assert subject == raw
            assert hashlib.sha256(subject).hexdigest() == record["subject"]["digest"]["sha256"]
            assert record["provider"]["id"] == "ghidra"
            text = record["normalized_result"]
            if isinstance(text, dict):
                text = text["pseudocode"]
            text = "\n".join(line.rstrip() for line in text.splitlines()).strip() + "\n"
            (out / (name + ".ghidra.c")).write_text(text)
            row.update(pseudocode=name + ".ghidra.c", rea_evidence_id=record["evidence_id"],
                       pseudocode_sha256=hashlib.sha256(text.encode()).hexdigest(),
                       rea_limits=record["limitations"])
        rows.append(row)
    fragments = []
    for name, spans in [("frame-producer", FRAME_SPANS),
                        ("persistence-lifetime", PERSISTENCE_LIFETIME_SPANS),
                        ("touch-fallback", TOUCH_FALLBACK_SPANS)]:
        first = len(fragments)
        extracts = []
        for role, start, end, owner in spans:
            off = pe.rva_offset(start - pe.image_base)
            raw = data[off:off + end - start]
            asm = objdump_output(["objdump", "-d", "--no-show-raw-insn",
                f"--start-address={start:#x}", f"--stop-address={end:#x}", str(TARGET)],
                text=True, cwd=ROOT)
            extracts.append("# " + role + "\n" + asm[asm.index("Disassembly of section"):])
            fragments.append(dict(role=role, virtual_address=hex(start),
                file_offset=hex(off), byte_count=len(raw), sha256=hashlib.sha256(raw).hexdigest(),
                owning_function=hex(owner)))
            if owner not in bounds:
                fragments[-1]["leaf_without_exception_record"] = True
        assembly = "\n".join(extracts)
        filename = "controls-" + name + ".asm"
        (out / filename).write_text(assembly)
        fragments[first].update(assembly=filename,
            assembly_sha256=hashlib.sha256(assembly.encode()).hexdigest())
    frame_analysis = []
    for role, (start, evidence) in SUPPORTING_ANALYSIS.items():
        response = json.loads((WORK / evidence / "003-procedure_pseudo_code.json").read_text())["response"]["result"]
        record = response.get("structuredContent") or json.loads(response["content"][0]["text"])
        off = pe.rva_offset(start - pe.image_base)
        raw = data[off:off + bounds[start] - start]
        assert record["provider"]["id"] == "ghidra"
        assert record["subject"]["digest"]["sha256"] == hashlib.sha256(raw).hexdigest()
        frame_analysis.append(dict(role=role, virtual_address=hex(start),
            end_exclusive=hex(bounds[start]), file_offset=hex(off), byte_count=len(raw),
            sha256=hashlib.sha256(raw).hexdigest(), rea_evidence_id=record["evidence_id"],
            retention="Selected assembly fragments only; complete procedure bodies remain disposable."))
    literals = []
    for role, va, size in [("scale-default", 0x145D6D36C, 4), ("scale-min", 0x145D6D754, 4),
                          ("scale-max", 0x145D6D42C, 4), ("hud-keys-format", 0x145DC0170, 22),
                          ("visibility-keys", 0x145DCCED5, 75),
                          ("pause-labels", 0x145DC0638, 76),
                          ("pause-row-height-base", 0x145DBF588, 8),
                          ("pause-title-hint-keys", 0x145DB8DED, 56),
                          ("pause-dispatch-table", 0x145DC19F4, 16),
                          ("frame-resource-guid-getter", 0x145E5B870, 16),
                          ("frame-resource-guid-producer", 0x145EF50C8, 16),
                          ("quad-debug-variant-table", 0x145F7011C, 28),
                          ("quad-convert-variant-table", 0x145F6FFA8, 28),
                          ("quad-minimap-debug-name", 0x145F6EDA8, 22),
                          ("screens-plugin-vtable", 0x145D717B0, 112),
                          ("screens-plugin-name", 0x145D73BD0, 41),
                          ("touch-resource-guid-drag", 0x145D6E400, 16),
                          ("touch-resource-guid-input", 0x1468FD3A0, 16),
                          ("touch-input-phase-table", 0x146907E88, 16),
                          ("storage-name-suffix", 0x146E5A6E0, 7)]:
        off = pe.rva_offset(va - pe.image_base)
        raw = data[off:off + size]
        literals.append(dict(role=role, virtual_address=hex(va), file_offset=hex(off),
                             byte_count=size, bytes_hex=raw.hex(), sha256=hashlib.sha256(raw).hexdigest()))
    manifest = dict(target_sha256=SHA, procedures=rows, fragments=fragments,
        supporting_native_analysis=frame_analysis, literals=literals,
        contracts={
            "scale": {"cvar": "hudScale", "default": "1", "finite_clamp": [0.5, 2.0],
                      "invalid_or_nonfinite": 1.0, "destination": "UiScale resource",
                      "schedule_gate": "Not recovered from the generic system adapters."},
            "visibility": {"keys_in_native_byte_order": ["hudClock", "hudBosses", "hudTally",
                "hudBuild", "hudBanners", "hudLoot", "hudMeter", "hudLevels", "hudFlag"],
                "default": True, "hidden_if": "Native trim result is exactly the one-byte string 0.",
                "flag_world_resource": "hudFlag also updates a separate world flag resource."},
            "persistence": {"file": "hud.txt", "directory": "save::native_base_directory",
                "format": "tally <x> <y>\\nbuild <x> <y>\\n; only rows with stored Some(Vec2) are written.",
                "read": "Exactly three whitespace fields; exact tally/build key; both f32 values finite; later valid duplicates overwrite.",
                "coordinates": "Absolute top-left window-logical pixels before UiScale; persisted values are not normalized.",
                "save_trigger": "Release of an active drag; both saved positions are serialized.",
                "load_lifetime": "ScreensPlugin build at 0x14003fc40 calls 0x140272060 at 0x140042d1e. Its vtable build slot is +0x40 at 0x145d717b0, registered by 0x140063df0 and dispatched by Bevy add_plugin at 0x144dd2bfa. This is plugin/world setup; no per-run-entry reread is established.",
                "constructor": "layout-persistent-init.asm and layout-persistent-init.ghidra.c"},
            "drag": {"start": "Changed Interaction::Pressed on a Movable and no active drag; no keyboard modifier test.",
                "pointer": "In-bounds window cursor physical coordinates divided by window scale; otherwise Touches::iter().next().map(Touch::position), copied directly with no scaling or normalization.",
                "held": "Left mouse pressed OR Touches pressed-map nonempty; release/save only when both are absent.",
                "update": "initial_top_left + pointer_now - pointer_start",
                "placement": "clamp(stored, 0, max(viewport - ComputedNode.size * inverse_scale_factor * UiScale, 0)) / UiScale",
                "default_none": {"build": "left = 10 / UiScale; top = 120 / UiScale; right = Auto",
                    "tally": "left = Auto; top = 10 / UiScale; right = margin / UiScale",
                    "margin": "200 without a frame rectangle wider than one pixel; otherwise max(viewport_width - frame.left + 10, 10)",
                    "query": "0x140639a80 copies MinimapWidget's optional rendered rectangle in window-logical pixels; this is the rendered QuadContent::Minimap widget, independent of its FrameXML name.",
                    "update": "Default offsets are reapplied each placement update, so they react to scale, resize and frame movement; None is not converted to Some."},
                "parts": ["tally", "build"]},
            "touch_fallback": {
                "resource_guid_le": "59142ee2089a069b9d97891a40800fae",
                "type": "bevy_input 0.18.1 touch::Touches; 128 bytes, four 32-byte maps",
                "drag_binding": "0x140285ae0 uses getter 0x140028a40 and stores the ID at state+0x260; adapter 0x140285e80 passes that resource as argument 5 to drag-start 0x1402788c0.",
                "producer_binding": "0x144569c30 registers the identical GUID at 0x1468fd3a0 into state+8; adapter 0x144569e50 passes that ResMut to input producer 0x144562920.",
                "producer": "The producer clears the three transient maps at +0x20/+0x40/+0x60, preserves previous position for the pressed map, reads touch-event phases, and stores event position directly. Its four-map phase behavior matches the version-bound Bevy source.",
                "selection": "Only the currently pressed map at resource+0 is read. Native iterator 0x143608050 and drag 0x1402789d5 select its first full bucket, reading the last Vec2 of a 136-byte (u64,Touch) bucket. There is no pointer-ID, mouse-only, or window filter.",
                "coordinates": "Touch::position is copied directly; the fallback adds no UiScale, scale-factor, or normalized-coordinate transform.",
                "release": "0x140275753 tests the pressed-map iterator if Left mouse is absent; empty releases/saves, nonempty continues the drag.",
                "primary_source_corroboration": "https://raw.githubusercontent.com/bevyengine/bevy/v0.18.1/crates/bevy_input/src/touch.rs",
                "limit": "Platform event delivery and controlled live touch behavior were not executed."},
            "frame_rectangle_producer": {
                "resource_guid_le": "c5f8832fb3ae5279947190ab93214030",
                "getter": "0x140639a80; tag bit 0 and rect at resource + 0x10",
                "init": "0x140c565ce uses the identical GUID at 0x145ef50c8; resource ID stored at system state + 0x270 by 0x140c568cc.",
                "adapter": "0x140c571d7 fetches state + 0x270, resolves resource data to rsp+0xc0, wraps it at rsp+0x1c0, and passes that ResMut at rsp+0x48 to 0x140bfa140.",
                "paint": "0x140bfa896 initializes a None slot; convert receives its address at 0x140bfba8f; 0x140bfc46d copies all 64 bytes into that resource.",
                "variant": "Both native QuadContent switches use discriminant xor 0x8000000000000000. Variant 1 is formatted as Minimap at 0x140c76abd and converted at 0x140c024f2.",
                "conversion": "The Minimap branch writes Some tag 1, window-logical y-down rect at +0x10, z at +0x20, alpha at +0x30, and zoom bytes at +0x34.",
                "source_binding": "crates/benilla-app/src/minimap/mod.rs::MinimapWidget and ui_script/extract/mod.rs::convert_entry/paint_script",
                "static_limit": "Generic ABI and jump-table omissions in raw Ghidra imports are resolved by the retained original assembly and hash-bound dispatch tables; frame scheduling remains unverified."},
            "pause": {"panel_width": 420.0, "panel_height": "160 + 54 * button_count",
                "backdrop_opacity": 0.55, "backdrop_global_z": 6400, "canvas_max_scale": 1.3,
                "backdrop_word": {"instruction": "0x14027afcd", "word": "0x19003f0ccccd",
                    "low_f32_bits": "3f0ccccd", "high_u32": 6400},
                "panel_padding": [30.0, 30.0, 22.0, 22.0], "panel_row_gap": 12.0,
                "title": {"size": 46.0, "font": "heading", "key_active_run": "menu.paused"},
                "hint": {"size": 15.0, "key_active_run": "menu.escape_resume"},
                "buttons": {"minimum_width": 240.0, "gap": 10.0, "margin_top": 6.0,
                    "padding": [22.0, 22.0, 10.0, 10.0], "font_size": 17.0,
                    "actions": ["Resume", "Options", "End Run", "Quit"]},
                "confirm": {"first_press": "arm", "second_press_minimum_seconds": 0.35,
                    "second_press_exclusive_maximum_seconds": 3.0, "too_early": "ignore", "expired": "arm again",
                    "scope": "Only buttons carrying native Confirm, including End Run; dispatch remains separate."},
                "input_limit": "Field gates and native callbacks recovered; stock FrameXML GameMenu interception was not established."}},
        limits=["Static Ghidra and bounded original-instruction execution; the game was not launched.",
                "Raw imports omit external data/callees and use generic ABI; assembly corroborates Windows arguments.",
                "Native system schedule gating and all pointer/platform interactions need runtime comparison.",
                "Shared constructor 0x140272060 is retained by the layout scope; no duplicate extract here."])
    write(out / "controls-manifest.json", manifest)
    write(out / "controls-vectors.json", native_vectors(data, pe))
    print("Staged selected control evidence and bounded native vectors in", out.relative_to(ROOT))


if __name__ == "__main__":
    main()
