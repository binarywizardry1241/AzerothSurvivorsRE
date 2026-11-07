#!/usr/bin/env python3
"""Check/recover the selected 0.109.0 ready-label pulse without building a game.

--prepare stages the selected raw Ghidra plans, without starting a provider.
--collect stages compact evidence under runtime/analysis/history/interface/hud-gap7/696062fa29c4/curated.
--check verifies retained target/byte/extract identities and the live source path.
--verify additionally replays the original scalar instructions with Unicorn;
the Windows sinf result is an explicit input seam, never a host-libm parity claim.
"""
from portable_paths import portable_json
from native_recovery import f32 as _shared_f32, digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct

from coverage_common import ROOT, latest_target, project_path, target_bytes

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
WORK = ROOT / "runtime/analysis/history/interface/hud-gap7/696062fa29c4"
RETAINED = ROOT / "docs/analysis/evidence/0.109.0/hud-ready"
OWNERS = {
    "hud-update": (0x14028E670, "hud/session/007-0x14028e670.json"),
    "hud-constructor": (0x14020CCD0, "constructors/session/005-0x14020ccd0.json"),
    "boss-rows": (0x140209D00, "constructors/session/003-0x140209d00.json"),
    "build-rows": (0x14020A060, "constructors/session/004-0x14020a060.json"),
    "hudparts-visibility": (0x14007D0B0, "hudparts/session/003-0x14007d0b0.json"),
}
RANGES = {
    "ready-label-key": (0x14020E550, 0x14020E561),
    "ready-label-style": (0x14020E626, 0x14020E6E1),
    "ready-phase-gate": (0x1402908AE, 0x140290912),
    "ready-color-update": (0x140290B21, 0x140290B74),
    "sinf-thunk": (0x145BFA117, 0x145BFA11D),
}
LITERALS = {
    "ready-label-key": (0x145DEDC93, 17),
    "angular-rate": (0x145DF0570, 4),
    "absolute-mask": (0x145D9D730, 16),
    "alpha-range": (0x145DCD0B8, 4),
    "alpha-base": (0x145DCD094, 4),
    "gold-color": (0x145DF15A4, 20),
}


def digest(data):
    return _shared_digest(data)


def dump(path, value):
    path.write_text(portable_json(value, indent=2) + "\n")


def f32(value):
    return _shared_f32(value)


def replay(raw):
    import unicorn as u
    from unicorn import x86_const as x

    machine = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    pages = {address & ~0xFFF for address in
             [0x140290B37, 0x145BFA117] + [address for address, _ in LITERALS.values()]}
    for address in pages:
        machine.mem_map(address, 0x1000)
    machine.mem_write(0x140290B37, raw(0x140290B37, 0x29))
    for address, count in LITERALS.values():
        if address != 0x145DEDC93:
            machine.mem_write(address, raw(address, count))
    scratch = 0x400000000
    machine.mem_map(scratch, 0x4000)
    values = {}

    def hook(cpu, address, size, unused):
        if address == 0x145BFA117:
            values["argument_bits"] = cpu.reg_read(x.UC_X86_REG_XMM0) & 0xFFFFFFFF
            cpu.reg_write(x.UC_X86_REG_XMM0, values["sine_bits"])
            sp = cpu.reg_read(x.UC_X86_REG_RSP)
            cpu.reg_write(x.UC_X86_REG_RIP, struct.unpack("<Q", cpu.mem_read(sp, 8))[0])
            cpu.reg_write(x.UC_X86_REG_RSP, sp + 8)

    machine.hook_add(u.UC_HOOK_CODE, hook)
    rows = []
    for elapsed in (0.0, 0.125, 0.25, 1.0, 17.25, 1048576.0):
        for sine in (-1.0, -0.5, -0.0, 0.0, 0.5, 1.0):
            elapsed = f32(elapsed)
            values["sine_bits"] = struct.unpack("<I", struct.pack("<f", sine))[0]
            machine.mem_write(scratch + 0x5C, struct.pack("<f", elapsed))
            machine.reg_write(x.UC_X86_REG_RAX, scratch)
            machine.reg_write(x.UC_X86_REG_RSP, scratch + 0x3000)
            machine.emu_start(0x140290B37, 0x140290B60, count=64)
            argument = struct.unpack("<I", struct.pack("<f", f32(elapsed * 4.5)))[0]
            assert values["argument_bits"] == argument
            expected = f32(f32(abs(sine) * f32(0.45)) + f32(0.55))
            actual = machine.reg_read(x.UC_X86_REG_XMM0) & 0xFFFFFFFF
            assert actual == struct.unpack("<I", struct.pack("<f", expected))[0]
            rows.append(dict(elapsed=elapsed, sine_bits=hex(values["sine_bits"]),
                             sinf_argument_bits=hex(argument), alpha_bits=hex(actual)))
    return rows


def source_check():
    source = (ROOT / "crates/azeroth-survivors-re/src/gameplay/stored_hud.rs").read_text()
    assert "(sync, animate, animate_ready).chain().in_set(RunSet::Present)" in source
    assert "row.commands().entity(label).insert(ReadyLabel);" in source
    assert "(elapsed * 4.5).sin().abs() * 0.45 + 0.55" in source
    assert "mut labels: Query<&mut TextColor, With<ReadyLabel>>" in source
    body = source.split("fn animate_ready(", 1)[1].split("\nfn animate(", 1)[0]
    assert "GOLD.with_alpha(ready_alpha(time.elapsed_secs()))" in body
    assert all(gate not in body for gate in ("Display::None", "session.", "game.clock", "delta_secs"))


def main():
    global WORK
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare", action="store_true")
    parser.add_argument("--collect", action="store_true")
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--verify", action="store_true")
    parser.add_argument("--work", default="runtime/analysis/history/interface/hud-gap7/696062fa29c4", help="Project-local analysis output")
    args = parser.parse_args()
    WORK = project_path(args.work)
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Installed EXE changed; do not reuse 0.109.0 addresses"
    data = target_bytes(target)
    module = load_script("hud_ready_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    bounds = {a + pe.image_base: b + pe.image_base for a, b, *_ in pe.functions()}

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        result = data[offset:offset + count]
        assert len(result) == count
        return result

    def span(address, count):
        return dict(address=hex(address), file_offset=hex(pe.rva_offset(address-pe.image_base)),
                    byte_count=count, sha256=digest(raw(address, count)))

    # Resolve the retained JMP thunk through this PE's import table, rather than
    # naming a trigonometric routine from its call shape alone.
    thunk = raw(0x145BFA117, 6)
    assert thunk[:2] == b"\xff\x25"
    iat = 0x145BFA11D + struct.unpack("<i", thunk[2:])[0]
    imports = [(row["library"], name) for row in pe.imports()
               for index, name in enumerate(row["functions"])
               if int(row["iat_start_address"], 16) + index * 8 == iat]
    assert imports == [("api-ms-win-crt-math-l1-1-0.dll", "sinf")]
    assert raw(0x145DEDC93, 17) == b"hud.move_to_begin"
    if args.prepare:
        groups = {"hud": [0x140287980,0x1402892C0,0x14028A610,0x14028BCE0,0x14028E670,0x140291520],
                  "hudparts": [0x14007D0B0], "constructors": [0x140209D00,0x14020A060,0x14020CCD0]}
        assert all(not (WORK/name).exists() for name in groups), "Choose a fresh --work path"
        for name, starts in groups.items():
            out = WORK / name
            out.mkdir(parents=True)
            start, end = min(starts), max(bounds[address] for address in starts)
            (out/"range.bin").write_bytes(raw(start,end-start))
            (out/"seeds.tsv").write_text("".join(f"{hex(address)}\tfunction\n{hex(address)}\tcode\n" for address in starts))
            dump(out/"plan.json", dict(target=(out/"range.bin").relative_to(ROOT).as_posix(),
                 output=(out/"session").relative_to(ROOT).as_posix(), init_timeout=60, timeout=240,
                 open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                 environment=dict(REA_GHIDRA_SEED_FILE=(out/"seeds.tsv").relative_to(ROOT).as_posix(),
                     REA_GHIDRA_STARTUP_TIMEOUT_MS="180000",
                     REA_GHIDRA_DISABLED_ANALYZERS="Function ID,Function Start Search,Create Address Tables"),
                 operations=[dict(name="procedure_pseudo_code",arguments=dict(procedure=hex(address)),
                                  label=hex(address)) for address in starts]))
        print("Prepared three selected HUD plans under", WORK.relative_to(ROOT))
    if args.collect:
        import capstone
        out = WORK / "curated"
        out.mkdir(parents=True, exist_ok=True)
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        ranges = []
        for role, (start, end) in RANGES.items():
            instructions = list(decoder.disasm(raw(start, end-start), start))
            assert sum(i.size for i in instructions) == end-start
            text = "".join(f"{i.address:x}: {i.mnemonic:8} {i.op_str}".rstrip() + "\n" for i in instructions)
            filename = role + ".asm"
            (out / filename).write_text(text)
            ranges.append(dict(role=role, **span(start, end-start), assembly=filename,
                               assembly_sha256=digest(text.encode())))
        owners = []
        for role, (start, path) in OWNERS.items():
            response = json.loads((WORK / path).read_text())["response"]["result"]
            record = response.get("structuredContent") or json.loads(response["content"][0]["text"])
            subject = Path(record["subject"]["local_path"])
            assert subject.is_relative_to(WORK) and digest(subject.read_bytes()) == record["subject"]["digest"]["sha256"]
            assert record["provider"]["id"] == "ghidra"
            if role == "hud-update":
                code = record["normalized_result"]
                code = code if isinstance(code, str) else code["pseudocode"]
                excerpt = "LAB_140290b21:" + code.split("LAB_140290b21:", 1)[1].split("  goto LAB_140290b74;", 1)[0] + "  goto LAB_140290b74;\n"
                filename = "ready-color-update.ghidra.c"
                (out / filename).write_text(excerpt)
                next(row for row in ranges if row["role"] == "ready-color-update").update(
                    pseudocode_excerpt=filename, pseudocode_excerpt_sha256=digest(excerpt.encode()),
                    rea_evidence_id=record["evidence_id"])
            owners.append(dict(role=role, **span(start, bounds[start]-start),
                               end_exclusive=hex(bounds[start]), rea_evidence_id=record["evidence_id"],
                               analysis_input_sha256=record["subject"]["digest"]["sha256"],
                               analysis_profile_digest=record["analysis_profile"]["digest"]))
        dump(out / "manifest.json", dict(target={key: target[key] for key in ("version", "path", "sha256", "size_bytes")},
             ranges=ranges, literals=[dict(role=role, **span(address, count), bytes_hex=raw(address,count).hex())
                                      for role, (address, count) in LITERALS.items()], owners=owners,
             sinf_import=dict(library=imports[0][0], name=imports[0][1], iat_address=hex(iat)),
             contract=dict(label="hud.move_to_begin", constructor_font_size=40,
                 clock="Bevy application Time::elapsed_secs f32; independent of the run clock",
                 alpha="abs(sinf(elapsed * 4.5f)) * 0.45f + 0.55f; separate scalar f32 operations",
                 color="Srgba gold (0.973f,0.824f,0.416f) with replaced alpha",
                 hidden="Updater writes Node display before color; hidden display does not skip the pulse"),
             limits=["Static Ghidra raw imports omit PE/global/callee relationships; source boundaries use independent PE bytes and assembly.",
                     "Only the selected ready-label transition is repaired; the remaining constructor/owner bodies are bounded recovery leads.",
                     "Windows sinf is an explicit replay seam; Rust sin, scheduling, layout and rendered parity are unverified.",
                     "No compiler, game, input/rendering or original/rebuilt comparison was run."]))
        if args.verify:
            dump(out / "vectors.json", dict(target_sha256=SHA, vectors=replay(raw),
                 seam="Injected sinf result bits; original time multiplication, sign-mask, scale and offset instructions execute unchanged."))
        print("Staged compact 0.109.0 HUD evidence under runtime/")
    if args.check:
        manifest = json.loads((RETAINED / "manifest.json").read_text())
        assert manifest["target"]["sha256"] == SHA
        for row in manifest["ranges"] + manifest["literals"] + manifest["owners"]:
            assert all(row[key] == value for key,value in span(int(row["address"],16),row["byte_count"]).items())
            if "end_exclusive" in row:
                assert bounds[int(row["address"],16)] == int(row["end_exclusive"],16)
            if "assembly" in row:
                assert digest((RETAINED/row["assembly"]).read_bytes()) == row["assembly_sha256"]
            if "pseudocode_excerpt" in row:
                assert digest((RETAINED/row["pseudocode_excerpt"]).read_bytes()) == row["pseudocode_excerpt_sha256"]
        source_check()
        if args.verify:
            vectors = json.loads((RETAINED / "vectors.json").read_text())
            assert vectors["target_sha256"] == SHA and vectors["vectors"] == replay(raw)
        print("Verified 0.109.0 HUD owner/range identities and live ready-label source" +
              ("; 36 bounded original-instruction pulse vectors pass" if args.verify else ""))
    elif args.verify and not args.collect:
        print(f"Verified {len(replay(raw))} bounded original-instruction HUD pulse vectors")


if __name__ == "__main__":
    main()
