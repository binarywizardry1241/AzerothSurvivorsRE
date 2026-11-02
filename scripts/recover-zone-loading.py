#!/usr/bin/env python3
"""Hash-bound #61 cover recovery/replay; never builds or launches an application.

--prepare writes raw Ghidra plans below runtime/loading-entry-0.112.5.
--collect stages compact evidence there after the plans run through scripts/rea-batch.py.
--check checks retained evidence, native gate/progress replays and connected source.
Requires the existing project-local Capstone and Unicorn recovery dependencies.
"""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

SHA = "445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36"
WORK = ROOT / "runtime/loading-entry-0.112.5"
RETAINED = ROOT / "docs/analysis/evidence/0.112.5/zone-loading"
GROUPS = {
    "raise": ([0x14093FD70], 0x14093FEC8),
    "drive-setup": ([0x140971F30, 0x1409739E0], 0x1409758B5),
    "catalogs": ([0x145A8D820, 0x145AA75A0], 0x145AA7677),
}
FUNCTIONS = {
    "raise": (0x14093FD70, 0x14093FEC8, "raise", 3),
    "drive": (0x140971F30, 0x140973905, "drive-setup", 3),
    "setup": (0x1409739E0, 0x1409758B5, "drive-setup", 4),
    "map-loading-id": (0x145AA75A0, 0x145AA7677, "catalogs", 4),
    "loading-path": (0x145A8D820, 0x145A8D8F3, "catalogs", 3),
}


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + "\n"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def dependencies():
    for directory in ("runtime/camera-recovery-0.105.0/python-libs",
                      "runtime/armory-recovery/python-libs"):
        sys.path.insert(0, str(ROOT / directory))


def native_replay(raw):
    dependencies()
    import unicorn as u
    from unicorn import x86_const as x

    cpu = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    for address, count in ((0x140971000, 0x5000), (0x141910000, 0x1000),
                           (0x145DC2000, 0x1000), (0x145DD1000, 0x1000)):
        cpu.mem_map(address, count)
        cpu.mem_write(address, raw(address, count))
    mem, stack, done = 0x200000000, 0x300000000, 0x400000000
    cpu.mem_map(mem, 0x10000)
    cpu.mem_map(stack, 0x10000)
    cpu.mem_map(done, 0x1000)
    screen, progress, warm, ui, epoch, frame = [mem + n for n in (0x100, 0x200, 0x300, 0x500, 0x800, 0x1000)]

    def put(address, fmt, *values):
        cpu.mem_write(address, struct.pack("<" + fmt, *values))

    def reg(name, value):
        cpu.reg_write(getattr(x, "UC_X86_REG_" + name), value)

    def reset():
        cpu.mem_write(mem, bytes(0x10000))
        put(frame - 0x40, "Q", screen)
        put(frame - 0x30, "Q", epoch)
        put(frame - 0x24, "I", 99)
        put(frame - 0x20, "Q", progress)
        put(frame + 0xC0, "Q", warm)
        put(screen + 0x48, "B", 1)
        put(screen + 0x4A, "B", 1)
        put(stack + 0x8000, "Q", done)
        reg("RSP", stack + 0x8000)
        reg("RBP", frame)
        reg("RAX", screen)
        reg("RSI", screen)
        reg("EFLAGS", 2)
        reg("MXCSR", 0x1F80)

    stops = set()

    def stop(_, address, size, unused):
        if address in stops:
            cpu.emu_stop()

    cpu.hook_add(u.UC_HOOK_CODE, stop)
    ready_rows = []
    # The actual native component gates, not a replacement readiness implementation.
    for flags in itertools.product((False, True), repeat=10):
        resident, nonzero, scene, collider, merge, gx, snap, settling, heated, pending = flags
        for previous in (0, 1, 2):
            reset()
            put(progress, "QQ", 4 if resident else 3, 4 if nonzero else 0)
            put(progress + 0x10, "Q", int(collider))
            put(progress + 0x18, "Q", int(merge))
            put(progress + 0x28, "Q", int(gx))
            put(progress + 0x3D, "B", int(scene))
            put(screen + 0x38, "I", previous)
            put(screen + 0x49, "B", int(snap))
            put(frame + 0x497, "B", int(settling))
            put(warm + 0x78, "B", int(heated))
            put(frame + 0x180, "Q", ui if pending else 0)
            stops = {0x1409729BA, 0x140972C30, 0x140973753}
            cpu.emu_start(0x140972971, done, count=100)
            ready = resident and nonzero and scene and not (collider or merge or gx or snap or settling or pending) and heated
            count = struct.unpack("<I", cpu.mem_read(screen + 0x38, 4))[0]
            active = bool(cpu.mem_read(screen + 0x48, 1)[0])
            assert count == (previous + 1 if ready else 0)
            assert active == (not ready or previous < 2)
            ready_rows.append([list(flags), previous, count, active])

    progress_rows = []
    counts = (0, 1, 3, 4, 7, (1 << 63) + 1024)
    for previous, completed, total, ui_counts, snap in itertools.product(
            (0.0, 0.25, 0.9), counts, (0, 1, 4, (1 << 63) + 2048),
            (None, (0, 0), (0, 10), (3, 10), (10, 10), (20, 10)), (False, True)):
        reset()
        put(progress, "QQ", completed, total)
        put(screen + 0x3C, "f", previous)
        put(screen + 0x49, "B", int(snap))
        put(frame + 0x180, "Q", ui if ui_counts is not None else 0)
        if ui_counts is not None:
            put(ui + 0x110, "QQ", *ui_counts)
        stops = {0x140973512}
        cpu.emu_start(0x140973426, done, count=200)
        fraction = min(f32(f32(completed) / f32(total)), 1.0) if total else 0.0
        if ui_counts is not None:
            got, wanted = ui_counts
            ui_fraction = min(f32(f32(got) / f32(wanted)), 1.0) if wanted else 0.0
            fraction = f32(f32(fraction * f32(0.8)) + f32(ui_fraction * f32(0.2)))
        expected = f32(previous if snap else max(f32(previous), fraction))
        result = cpu.reg_read(x.UC_X86_REG_XMM0) & 0xFFFFFFFF
        assert result == struct.unpack("<I", struct.pack("<f", expected))[0]
        progress_rows.append([previous, completed, total, ui_counts, snap, result])
    return dict(readiness_cases=len(ready_rows), readiness_sha256=sha(encoded(ready_rows).encode()),
                progress_cases=len(progress_rows), progress_sha256=sha(encoded(progress_rows).encode()),
                limits=["Original scalar instructions with explicit component storage, clock and pipeline/UI state seams; not ECS/runtime execution.",
                        "UI counters are native input seams. The existing synchronous source loader exposes only pending/completed, not intermediate file counts."])


def source_check():
    source = (ROOT / "crates/benilla-app/src/loading_screen.rs").read_text()
    bridge = (ROOT / "crates/azeroth-survivors-re/src/gameplay/client.rs").read_text()
    game = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mod.rs").read_text()
    local = (ROOT / "crates/benilla-app/src/loading_screen/local.rs").read_text()
    enter = game.split("fn enter(", 1)[1].split("fn controls(", 1)[0]
    assert enter.index("loading.begin(zone.map_id)") < enter.index("if !loading.presented()") < enter.index("let seed = run_seeds.next()")
    assert "loading.cancel();" in enter and "loading.cancel();" in bridge
    assert "loading.set_ready(world.ready);" in bridge
    assert "loading.covering() || !session.playing() || !world.ready" in bridge
    assert "if loading.covering() || !world.ready || !session.playing()" in game
    for part in ("screen.dismiss();\n        screen.raise(\"local world entry\", false", "cover.frames = 0;", "entry.ready", "progress.presentable()", "warm.satisfied()", "entry_ui_pending.is_none()", "CLEAR_AFTER_READY_FRAMES: u32 = 3", "screens.0.path(id)", "loading_screen_id(map_id)", "LooseOpen::Archives", "progress.fraction() * 0.8", "i32::MAX", "screen.art_resolved = true"):
        assert part in source, part
    assert "self.presented = false;" in local and "self.covering = true;" in local
    assert "EnteredWorldMessage" not in enter and "WorldportMessage" not in enter


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prepare", action="store_true")
    parser.add_argument("--collect", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "This recovery belongs only to the named 0.112.5 target"
    data = target_bytes(target)
    pe = load_script("inventory", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    if args.prepare:
        for group, (starts, end) in GROUPS.items():
            out = WORK / group
            out.mkdir(parents=True, exist_ok=True)
            start = min(starts)
            (out / "range.bin").write_bytes(raw(start, end - start))
            (out / "seeds.tsv").write_text("".join(f"{address:#x}\tfunction\n{address:#x}\tcode\n" for address in starts))
            plan = dict(target=str((out / "range.bin").relative_to(ROOT)), output=str((out / "session").relative_to(ROOT)),
                        init_timeout=60, timeout=240,
                        open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(start)),
                        environment=dict(REA_GHIDRA_SEED_FILE=str((out / "seeds.tsv").relative_to(ROOT)),
                                         REA_GHIDRA_STARTUP_TIMEOUT_MS="180000",
                                         REA_GHIDRA_DISABLED_ANALYZERS="Function ID,Function Start Search,Create Address Tables"),
                        operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(address)), label=hex(address)) for address in starts])
            (out / "plan.json").write_text(encoded(plan))
        print("Prepared three scoped Ghidra plans; run each with scripts/rea-batch.py")
    if args.collect:
        dependencies()
        import capstone
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        out = WORK / "curated"
        out.mkdir(exist_ok=True)
        functions = []
        for role, (start, end, group, ordinal) in FUNCTIONS.items():
            result = json.loads((WORK / group / "session" / f"{ordinal:03d}-{start:#x}.json").read_text())["response"]["result"]
            evidence = result.get("structuredContent") or json.loads(result["content"][0]["text"])
            starts, last = GROUPS[group]
            assert evidence["subject"]["digest"]["sha256"] == sha(raw(min(starts), last - min(starts)))
            assert evidence["provider"]["id"] == "ghidra"
            # Keep just the drive/raise and two actual map/path consumers; setup's byte identity
            # and provider record suffice for the retained, unchanged stock layout.
            extracts = {}
            if role != "setup":
                body = "\n".join(line.rstrip() for line in evidence["normalized_result"].splitlines()).strip() + "\n"
                (out / f"{role}.c").write_text(body)
                assembly = "\n".join(f"{i.address:x} {i.mnemonic} {i.op_str}".rstrip() for i in decoder.disasm(raw(start, end - start), start)) + "\n"
                (out / f"{role}.asm").write_text(assembly)
                extracts = {suffix: sha((out / f"{role}.{suffix}").read_bytes()) for suffix in ("c", "asm")}
            functions.append(dict(role=role, address=hex(start), end_exclusive=hex(end),
                                  file_offset=pe.rva_offset(start - pe.image_base), sha256=sha(raw(start, end - start)),
                                  evidence_id=evidence["evidence_id"], analysis_profile_digest=evidence["analysis_profile"]["digest"],
                                  extracts=extracts))
        manifest = dict(target_version="0.112.5", target_sha256=SHA, target_executed=False,
                        provider="Ghidra 12.1.4", functions=functions, replay=native_replay(raw),
                        limitations=["Raw imports use generic GCC ABI; interpretation follows original Windows registers and PE instructions.",
                                     "Bounded loading-cover contracts only; no global engine, source execution, artwork/rendering, timing/audio or original/rebuilt parity claim."])
        (out / "manifest.json").write_text(encoded(manifest))
        print("Staged", out.relative_to(ROOT))
    if args.check:
        manifest = json.loads((RETAINED / "manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        for function in manifest["functions"]:
            start, end = int(function["address"], 16), int(function["end_exclusive"], 16)
            assert sha(raw(start, end - start)) == function["sha256"]
            for suffix, expected in function["extracts"].items():
                assert sha((RETAINED / f"{function['role']}.{suffix}").read_bytes()) == expected
        result = native_replay(raw)
        assert result == manifest["replay"]
        source_check()
        print(f"#61: {result['readiness_cases']} native readiness + {result['progress_cases']} native progress cases pass; source routes checked. No compilation or application execution.")


if __name__ == "__main__":
    main()
