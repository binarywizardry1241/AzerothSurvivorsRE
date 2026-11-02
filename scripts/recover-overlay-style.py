#!/usr/bin/env python3
"""Recover/check shared pause and terminal styles; never build or launch a game.

--prepare stages raw Ghidra plans. --collect stages compact evidence in runtime.
--check validates retained evidence, current bytes and the live source constants.
--verify additionally executes original constructors, with allocator/memcpy seams.
"""
from portable_paths import portable_json
from native_recovery import digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
RETAINED = ROOT / "docs/analysis/evidence/0.109.0/overlay-style"
OWNERS = {"button": (0x140100690, 0x140100835),
          "panel": (0x140101170, 0x1401016BC),
          "color": (0x144C85C10, 0x144C86386),
          "shadow": (0x142649B80, 0x142649C3D)}
RANGES = {"button": OWNERS["button"], "panel": OWNERS["panel"],
          "shadow": OWNERS["shadow"],
          "color-forwarder": (0x144C7DCF0, 0x144C7DCF5),
          "color-admission-copy": (0x144C85C10, 0x144C85C61),
          "color-return": (0x144C8633B, 0x144C86386),
          "terminal-panel-call": (0x140203F96, 0x140203F9B),
          "terminal-button-call": (0x140205884, 0x140205889),
          "pause-panel-call": (0x1402087E8, 0x1402087ED)}
LITERALS = {"button-border": (0x145DD6730, 16),
            "button-top": (0x145DD4BC0, 16), "button-bottom": (0x145DD4BD0, 16),
            "panel-border": (0x145DD6788, 16),
            "panel-top": (0x145DD4BE0, 16), "panel-bottom": (0x145DD4BF0, 16),
            "panel-shadow": (0x145DD4C00, 16),
            "panel-border-width": (0x145D9D2B0, 16),
            "panel-radius": (0x145D9D360, 16),
            "color-dispatch-zero": (0x146AF06D8, 4)}


def require(value, message):
    if not value:
        raise ValueError(message)


def digest(data):
    return _shared_digest(data)


def dump(path, value):
    path.write_text(portable_json(value, indent=2) + "\n")


def evidence(path):
    response = json.loads(path.read_text())["response"]["result"]
    return response.get("structuredContent") or json.loads(response["content"][0]["text"])


def source_check():
    source = (ROOT / "crates/azeroth-survivors-re/src/menu.rs").read_text()
    source = "".join(source.split())
    tokens = ["Color::linear_rgba(0.231,0.051,0.043,1.0)",
              "Color::linear_rgba(0.102,0.020,0.020,1.0)",
              "Color::srgb(0.690,0.541,0.227)",
              "Color::linear_rgba(0.078,0.059,0.035,0.90)",
              "Color::linear_rgba(0.031,0.024,0.016,0.93)",
              "Color::srgb(0.427,0.333,0.145)",
              "node.border=UiRect::all(Val::Px(1.))",
              "node.border_radius=BorderRadius::all(Val::Px(10.))",
              "BoxShadow::new(Color::srgba(0.,0.,0.,0.6),Val::Px(0.),Val::Px(14.),Val::Px(0.),Val::Px(40.),)"]
    for token in tokens:
        require(token in source, "Shared style source changed: " + token)
    for path, token in [("gameplay/terminal_view.rs", "menu::native_panel("),
                        ("menu_overlay.rs", "menu::native_panel("),
                        ("gameplay/terminal_view.rs", "menu::native_button_gradient()")]:
        require(token in (ROOT / "crates/azeroth-survivors-re/src" / path).read_text(),
                "Live shared style consumer changed: " + path)


def replay(pe, data, raw):
    import unicorn as u
    import unicorn.x86_const as x
    machine = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    extent = max(s["rva"] + max(s["raw_size"], s["virtual_size"]) for s in pe.sections)
    machine.mem_map(pe.image_base, (extent + 4095) & ~4095)
    for section in pe.sections:
        off, count = section["raw_offset"], section["raw_size"]
        machine.mem_write(pe.image_base + section["rva"], data[off:off + count])
    scratch, size = 0x200000000, 0x100000
    machine.mem_map(scratch, size)
    stop = scratch + size - 16
    state, vectors = {}, []

    def read(name):
        return machine.reg_read(getattr(x, "UC_X86_REG_" + name))

    def write(name, value):
        machine.reg_write(getattr(x, "UC_X86_REG_" + name), value)

    def word(address):
        return struct.unpack("<Q", machine.mem_read(address, 8))[0]

    def code(cpu, address, count, unused):
        if address == stop:
            cpu.emu_stop()
            return
        if address in (0x140002200, 0x1400021C0, 0x145BFA0E7):
            if address == 0x1400021C0:
                length, alignment = read("RCX"), read("RDX")
                require(length in (52, 64, 72) and alignment in (4, 8), "Unexpected allocation")
                state["arena"] = (state["arena"] + alignment - 1) & ~(alignment - 1)
                require(state["arena"] + length < scratch + size, "Allocation leaves scratch")
                write("RAX", state["arena"])
                state["arena"] += length
            elif address == 0x145BFA0E7:
                require(read("R8") == 384, "Unexpected memcpy extent")
                require(all(scratch <= read(reg) and read(reg) + read("R8") <= scratch + size
                            for reg in ("RCX", "RDX")), "memcpy leaves scratch")
                cpu.mem_write(read("RCX"), bytes(cpu.mem_read(read("RDX"), read("R8"))))
                write("RAX", read("RCX"))
            sp = read("RSP")
            write("RIP", word(sp))
            write("RSP", sp + 8)
            return
        require(any(start <= address and address + count <= end for start, end in RANGES.values()),
                f"Unreviewed native instruction {address:#x}")
        require(bytes(cpu.mem_read(address, count)) == raw(address, count), "Changed native code")

    def memory(cpu, access, address, count, value, unused):
        require(scratch <= address and address + count <= scratch + size, "Write leaves scratch memory")

    machine.hook_add(u.UC_HOOK_CODE, code)
    machine.hook_add(u.UC_HOOK_MEM_WRITE, memory)
    f32s = lambda *values: struct.pack("<" + "f" * len(values), *values)
    for role in ("button", "panel"):
        for poison in (0, 0x5A, 0xA5):
            machine.mem_write(scratch, bytes([poison]) * size)
            machine.mem_write(stop, b"\xcc")
            for name in ("RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15"):
                write(name, 0)
            write("EFLAGS", 2)
            stack = scratch + 0x20008
            machine.mem_write(stack, struct.pack("<Q", stop))
            write("RSP", stack)
            output, node = scratch + 0x30000, scratch + 0x40000
            write("RCX", output)
            write("RDX", node)
            state["arena"] = scratch + 0x50000
            try:
                machine.emu_start(OWNERS[role][0], 0, count=5000)
            except u.UcError as error:
                raise ValueError(f"{role}/{poison:#x}: native replay at {read('RIP'):#x}: {error}") from error
            require(read("RIP") == stop and read("RAX") == output, "Constructor did not return output")
            gradient_at = output + (0x50 if role == "button" else 0x180)
            require(word(gradient_at) == 1 and word(gradient_at + 16) == 1, "Gradient vector")
            gradient = word(gradient_at + 8)
            require(word(gradient + 8) == 2 and word(gradient + 24) == 2, "Stop vector")
            require(bytes(machine.mem_read(gradient + 32, 4)) == f32s(3.1415927410125732), "Gradient angle")
            stops = word(gradient + 16)
            colors = [(0.231, 0.051, 0.043, 1.), (0.102, 0.020, 0.020, 1.)] if role == "button" else [(0.078, 0.059, 0.035, 0.90), (0.031, 0.024, 0.016, 0.93)]
            for index, color in enumerate(colors):
                require(bytes(machine.mem_read(stops + index * 32 + 12, 16)) == f32s(*color), "Raw gradient color")
            edge = (0.690, 0.541, 0.227, 1.) if role == "button" else (0.427, 0.333, 0.145, 1.)
            edge_at = output if role == "button" else output + 0x198
            require(bytes(machine.mem_read(edge_at, 80)) == (struct.pack("<I", 0) + f32s(*edge)) * 4, "Four border colors")
            if role == "panel":
                require(bytes(machine.mem_read(output + 0xF8, 32)) == (struct.pack("<If", 1, 1.)) * 4, "Overwritten border widths")
                require(bytes(machine.mem_read(output + 0x118, 32)) == (struct.pack("<If", 1, 10.)) * 4, "Overwritten corner radii")
                require(bytes(machine.mem_read(output, 0xF8)) == bytes([poison]) * 0xF8, "Caller layout preservation")
                shadow = word(output + 0x1F0)
                expected = b"".join(struct.pack("<If", 1, value) for value in (0., 14., 0., 40.))
                expected += struct.pack("<I", 1) + f32s(0., 0., 0., 0.6)
                require(bytes(machine.mem_read(shadow, 52)) == expected, "Panel shadow")
            vectors.append({"role": role, "poison": poison, "result": "passed"})
    return vectors


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("prepare", "collect", "check", "verify"):
        parser.add_argument("--" + name, action="store_true")
    parser.add_argument("--work", type=project_path, default=ROOT / "runtime/fixgap-7-9/shared-style")
    args = parser.parse_args()
    require(args.work.is_relative_to(ROOT / "runtime"), "Work must remain in runtime")
    target = latest_target(verify=True)
    require(target["sha256"] == SHA, "Selected target changed")
    data = target_bytes(target)
    module = load_script("overlay_style_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        require(offset is not None and len(data[offset:offset + count]) == count, "Unmapped native bytes")
        return data[offset:offset + count]

    if args.prepare:
        for role, (start, end) in OWNERS.items():
            out = args.work / role
            out.mkdir(parents=True, exist_ok=True)
            require(not (out / "session").exists(), "Select fresh --work for a replay")
            (out / "range.bin").write_bytes(raw(start, end - start))
            (out / "seeds.tsv").write_text(f"{start:#x}\tfunction\n{start:#x}\tcode\n")
            dump(out / "plan.json", dict(target=(out / "range.bin").relative_to(ROOT).as_posix(),
                output=(out / "session").relative_to(ROOT).as_posix(), init_timeout=60, timeout=240,
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                environment=dict(REA_GHIDRA_SEED_FILE=(out / "seeds.tsv").relative_to(ROOT).as_posix(),
                    REA_GHIDRA_STARTUP_TIMEOUT_MS="180000",
                    REA_GHIDRA_DISABLED_ANALYZERS="Function ID,Function Start Search,Create Address Tables,Call Convention ID"),
                operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(start)), label=role)]))
        print("Prepared four Ghidra plans; no analysis started")
        return
    if args.collect:
        import capstone
        out = args.work / "curated"
        out.mkdir(exist_ok=True)
        manifest = dict(target={key: target[key] for key in ("version", "path", "sha256", "size_bytes")}, owners=[], ranges=[], literals=[])
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        for role, (start, end) in OWNERS.items():
            record = evidence(args.work / role / "session" / f"003-{role}.json")
            require(record["provider"]["id"] == "ghidra", "Wrong analysis provider")
            require(record["subject"]["digest"]["sha256"] == digest(raw(start, end-start)), "Raw import identity")
            code = record["normalized_result"]
            code = code if isinstance(code, str) else code["pseudocode"]
            original_hash = digest(code.encode())
            code = "\n".join(line.rstrip() for line in code.splitlines()).strip() + "\n"
            name = role + ".ghidra.c"
            (out / name).write_text(code)
            manifest["owners"].append(dict(role=role, start=hex(start), end_exclusive=hex(end), sha256=digest(raw(start, end-start)), evidence_id=record["evidence_id"], pseudocode=name, pseudocode_sha256=digest(code.encode()), original_pseudocode_sha256=original_hash, text_normalization="trim trailing line whitespace and outer blank lines", provider=record["provider"], analysis_profile_digest=record["analysis_profile"]["digest"], analysis_preset=record["analysis_profile"]["parameters"]["analyzer_preset"], limitations=record.get("limitations", [])))
        for role, (start, end) in RANGES.items():
            instructions = list(decoder.disasm(raw(start, end-start), start))
            require(sum(i.size for i in instructions) == end-start, "Incomplete instruction range")
            assembly = "".join(f"{i.address:x}: {i.mnemonic} {i.op_str}".rstrip() + "\n" for i in instructions)
            name = role + ".asm"
            (out / name).write_text(assembly)
            manifest["ranges"].append(dict(role=role, start=hex(start), end_exclusive=hex(end), sha256=digest(raw(start, end-start)), assembly=name, assembly_sha256=digest(assembly.encode())))
        for role, (address, count) in LITERALS.items():
            manifest["literals"].append(dict(role=role, address=hex(address), byte_count=count, hex=raw(address,count).hex(), sha256=digest(raw(address,count))))
        cases = args.work / "native-cases.json"
        if cases.exists():
            (out / "native-cases.json").write_bytes(cases.read_bytes())
            manifest["native_cases"] = dict(path="native-cases.json", sha256=digest(cases.read_bytes()))
        manifest["limits"] = "Raw Ghidra ABI/types are inferred. Native replay covers only Color tag0, successful synthetic allocations and memcpy; other color variants, allocation failures, ECS scheduling, shaping/GPU and original/rebuilt parity are unverified."
        manifest["source_refs"] = ["crates/azeroth-survivors-re/src/" + name for name in
                                   ("menu.rs", "menu_overlay.rs", "gameplay/terminal_view.rs")]
        dump(out / "manifest.json", manifest)
        print("Staged compact evidence:", out.relative_to(ROOT))
    if args.check or args.verify:
        manifest = json.loads((RETAINED / "manifest.json").read_text())
        require(all(target[key] == value for key, value in manifest["target"].items()), "Stale evidence target")
        for row in manifest["owners"] + manifest["ranges"]:
            start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
            require(digest(raw(start, end-start)) == row["sha256"], "Changed current native range")
            for kind in ("pseudocode", "assembly"):
                if kind in row:
                    require(digest((RETAINED / row[kind]).read_bytes()) == row[kind + "_sha256"], "Changed retained extract")
        for row in manifest["literals"]:
            require(raw(int(row["address"],16), row["byte_count"]).hex() == row["hex"], "Changed native literal")
        if "native_cases" in manifest:
            row = manifest["native_cases"]
            require(digest((RETAINED / row["path"]).read_bytes()) == row["sha256"], "Changed retained cases")
        for role, expected in (("terminal-panel-call", 0x140101170),
                               ("terminal-button-call", 0x140100690),
                               ("pause-panel-call", 0x140101170)):
            address = RANGES[role][0]
            call = raw(address, 5)
            require(call[0] == 0xE8 and address + 5 + struct.unpack("<i", call[1:])[0] == expected,
                    "Changed live native style caller: " + role)
        source_check()
        if args.verify:
            vectors = replay(pe, data, raw)
            args.work.mkdir(parents=True, exist_ok=True)
            dump(args.work / "native-cases.json", dict(target=manifest["target"], vectors=vectors, seams=["allocation shim", "successful zeroed allocation", "memcpy"], limits=manifest["limits"]))
            print(f"{len(vectors)} original constructor executions passed; no compiler or game")
        else:
            print("Current shared styles: bytes, extracts, constants and live consumers match")


if __name__ == "__main__":
    main()
