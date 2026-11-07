#!/usr/bin/env python3
"""Check current pause/terminal Canvas arithmetic without source compilation.

--prepare stages two Ghidra plans; --collect stages compact evidence in runtime.
The default read-only check validates current retained evidence and live source.
--verify executes original arithmetic with synthetic window/Canvas/camera data.
"""
from portable_paths import portable_json
from native_recovery import digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
RETAINED = ROOT / "docs/analysis/evidence/overlay-canvas"
OWNERS = {"fit": (0x14018F300, 0x14018F75E), "scale": (0x140190700, 0x140191126)}
RANGES = {"fit": (0x14018F60F, 0x14018F6AE),
          "target-fit": (0x140190C4A, 0x140190CE1),
          "camera-product": (0x140190F84, 0x140190FAF)}


def require(value, message):
    if not value:
        raise ValueError(message)


def sha(data):
    return _shared_digest(data)


def dump(path, value):
    path.write_text(portable_json(value, indent=2) + "\n")


def replay(raw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE, UC_HOOK_MEM_WRITE
    import unicorn.x86_const as x
    machine = Uc(UC_ARCH_X86, UC_MODE_64)
    pages = {a & ~4095 for start, end in RANGES.values() for a in range(start, end + 4095, 4096)}
    for page in pages:
        machine.mem_map(page, 4096)
        machine.mem_write(page, raw(page, 4096))
    scratch = 0x200000000
    machine.mem_map(scratch, 0x4000)
    state, rows = {}, []
    f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
    bits = lambda value: struct.unpack("<I", struct.pack("<f", value))[0]

    def reg(name, value=None):
        key = getattr(x, "UC_X86_REG_" + name)
        return machine.reg_read(key) if value is None else machine.reg_write(key, value)

    def scalar(name):
        return struct.unpack("<f", struct.pack("<I", reg(name) & 0xFFFFFFFF))[0]

    def hook(cpu, address, count, unused):
        if address == state["end"]:
            cpu.emu_stop()
            return
        require(state["start"] <= address and address + count <= state["end"], "Unreviewed native instruction")
        require(bytes(cpu.mem_read(address, count)) == raw(address, count), "Changed instruction bytes")

    def write(cpu, access, address, count, value, unused):
        require(scratch <= address and address + count <= scratch + 0x4000, "Write leaves scratch")

    machine.hook_add(UC_HOOK_CODE, hook)
    machine.hook_add(UC_HOOK_MEM_WRITE, write)

    def run(role):
        state["start"], state["end"] = RANGES[role]
        reg("MXCSR", 0x1F80)
        machine.emu_start(state["start"], 0, count=200)
        require(reg("RIP") == state["end"], "Native arithmetic did not reach boundary")

    for width, height in [(0, 0), (1, 1), (320, 200), (800, 600), (1920, 1080), (3440, 1440), (1080, 1920)]:
        for dpi in (0.75, 1., 1.5, 2., 3.):
            for design in ((560., 700., 1.3), (420., 700., 1.3), (1600., 900., 1.6)):
                machine.mem_write(scratch, bytes(0x4000))
                dw, dh, maximum = map(f32, design)
                logical_w, logical_h = f32(width / dpi), f32(height / dpi)
                expected = max(f32(0.1), min(f32(logical_w / dw), f32(logical_h / dh), maximum))
                offsets = [f32(f32(f32(v / expected) - d) * 0.5) for v, d in ((logical_w, dw), (logical_h, dh))]
                machine.mem_write(scratch, struct.pack("<3f", dw, dh, maximum))
                machine.mem_write(scratch + 0x20, struct.pack("<f", dpi))
                reg("R10", scratch)
                reg("R14", scratch + 0x20)
                reg("RBX", width)
                reg("R8", height)
                reg("XMM0", bits(0.1))
                reg("XMM1", bits(0.5))
                run("fit")
                require([scalar("XMM8"), scalar("XMM4"), scalar("XMM3")] == [expected, *offsets], "Canvas fit/offset mismatch")
                window = scratch + 0x100
                stack = scratch + 0x1000
                machine.mem_write(stack + 0x98, struct.pack("<Q", window))
                machine.mem_write(window + 0xC0, struct.pack("<II", width, height))
                machine.mem_write(window + 0xC8, struct.pack("<f", dpi))
                reg("RSP", stack)
                reg("R11", scratch)
                reg("XMM9", bits(0.1))
                run("target-fit")
                require(scalar("XMM10") == expected, "Target Canvas fit mismatch")
                camera_scale, ui_scale = f32(1.5), f32(1.25)
                camera, ui = scratch + 0x200, scratch + 0x400
                machine.mem_write(camera + 12, struct.pack("<f", camera_scale))
                machine.mem_write(ui, struct.pack("<f", ui_scale))
                machine.mem_write(stack + 0x80, struct.pack("<Q", ui))
                reg("RAX", camera)
                run("camera-product")
                product = f32(expected * f32(camera_scale * ui_scale))
                require(scalar("XMM10") == product, "Camera/UiScale product mismatch")
                rows.append(dict(physical=[width, height], dpi=dpi, canvas=design,
                                 fit=expected, offset=offsets, target_scale=product))
    return rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for flag in ("prepare", "collect", "check", "verify"):
        parser.add_argument("--" + flag, action="store_true")
    parser.add_argument("--work", type=project_path, default=ROOT / "runtime/analysis/history/findings/fixgap-7-9/abb72146abfe/shared-canvas")
    args = parser.parse_args()
    require(args.work.is_relative_to(ROOT / "runtime"), "Work must remain under runtime")
    target = latest_target(verify=True)
    require(target["sha256"] == SHA, "Changed target")
    data = target_bytes(target)
    module = load_script("canvas_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        require(offset is not None, "Unmapped current bytes")
        return data[offset:offset + count]

    if args.prepare:
        for role, (start, end) in OWNERS.items():
            out = args.work / role
            out.mkdir(parents=True, exist_ok=True)
            require(not (out / "session").exists(), "Choose fresh --work")
            (out / "range.bin").write_bytes(raw(start, end - start))
            (out / "seeds.tsv").write_text(f"{start:#x}\tfunction\n{start:#x}\tcode\n")
            dump(out / "plan.json", dict(target=(out / "range.bin").relative_to(ROOT).as_posix(),
                output=(out / "session").relative_to(ROOT).as_posix(), init_timeout=60, timeout=240,
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                environment=dict(REA_GHIDRA_SEED_FILE=(out / "seeds.tsv").relative_to(ROOT).as_posix(),
                    REA_GHIDRA_STARTUP_TIMEOUT_MS="180000", REA_GHIDRA_DISABLED_ANALYZERS="Function ID,Function Start Search,Create Address Tables,Call Convention ID"),
                operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)), label=role)]))
        print("Prepared two current Canvas plans without starting analysis")
        return
    if args.collect:
        import capstone
        out = args.work / "curated"
        out.mkdir(exist_ok=True)
        manifest = dict(target={key: target[key] for key in ("version", "path", "sha256", "size_bytes")}, owners=[], ranges=[])
        for role, (start, end) in OWNERS.items():
            response = json.loads((args.work / role / "session" / f"003-{role}.json").read_text())["response"]["result"]
            record = response.get("structuredContent") or json.loads(response["content"][0]["text"])
            require(record["provider"]["id"] == "ghidra", "Wrong provider")
            require(record["subject"]["digest"]["sha256"] == sha(raw(start,end-start)), "Raw input differs")
            manifest["owners"].append(dict(role=role, start=hex(start), end_exclusive=hex(end), sha256=sha(raw(start,end-start)), evidence_id=record["evidence_id"], provider=record["provider"], analysis_profile_digest=record["analysis_profile"]["digest"]))
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        for role, (start, end) in RANGES.items():
            instructions = list(decoder.disasm(raw(start,end-start), start))
            require(sum(i.size for i in instructions) == end-start, "Incomplete instruction range")
            text = "".join(f"{i.address:x}: {i.mnemonic} {i.op_str}".rstrip()+"\n" for i in instructions)
            name = role + ".asm"
            (out / name).write_text(text)
            manifest["ranges"].append(dict(role=role,start=hex(start),end_exclusive=hex(end),sha256=sha(raw(start,end-start)),assembly=name,assembly_sha256=sha(text.encode())))
        manifest["limits"] = "Current Canvas-present arithmetic only; window/query/camera membership is supplied. Other scale modes, global scheduling, renderer/DPI/runtime and original/rebuilt parity are unverified."
        dump(out / "manifest.json", manifest)
        print("Staged current Canvas evidence", out.relative_to(ROOT))
    if args.check or args.verify or not args.collect:
        manifest = json.loads((RETAINED / "manifest.json").read_text())
        require(all(target[key] == value for key,value in manifest["target"].items()), "Stale evidence")
        for row in manifest["owners"] + manifest["ranges"]:
            start,end = int(row["start"],16),int(row["end_exclusive"],16)
            require(sha(raw(start,end-start)) == row["sha256"], "Changed native extent")
            if "assembly" in row:
                require(sha((RETAINED / row["assembly"]).read_bytes()) == row["assembly_sha256"], "Changed extract")
        source = "".join((ROOT / "crates/azeroth-survivors-re/src/canvas.rs").read_text().split())
        for token in ("(logical.x/canvas.design.x).min(logical.y/canvas.design.y).min(canvas.max_scale).max(0.1)",
                      "(logical/scale-canvas.design)*0.5", "target_scale*scale",
                      "camera.target_scaling_factor().unwrap_or(1.0)*ui_scale.0"):
            require(token in source, "Changed live Canvas route: "+token)
        if args.verify:
            rows = replay(raw)
            dump(args.work / "native-cases.json", dict(target=manifest["target"],vectors=rows,native_executions=len(rows)*3,limits=manifest["limits"]))
            print(f"{len(rows)*3} current Canvas arithmetic executions pass; no compiler/game")
        else:
            print("Current Canvas bytes, owner identity and source formulas match")


if __name__ == "__main__":
    main()
