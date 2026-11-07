#!/usr/bin/env python3
"""Reproduce #61's current-target loader counters and cover consumer, without builds.

--collect stages curated evidence under runtime/analysis/history/findings/fixgap58-61/5000ae89a404/curated-entry-ui.
--check verifies retained ranges, executes bounded native scalar replays and traces
the source connection. It does not execute the EXE, Lua, Rust or the ECS schedule.
The scoped REA plans and raw results remain disposable in runtime.
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

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
WORK = ROOT / "runtime/analysis/history/findings/fixgap58-61/5000ae89a404"
RETAINED = ROOT / "docs/analysis/evidence/entry-ui-progress"
RANGES = {
    "row-total": (0x1405A5267, 0x1405A5272),
    "empty-total": (0x1405A5A3B, 0x1405A5A41),
    "initialize-counters": (0x1405A5B98, 0x1405A5BCB),
    "stage-dispatch": (0x1405A51F3, 0x1405A520B),
    "row-attempt": (0x1405A5772, 0x1405A5819),
    "core-close-bindings": (0x1405A560B, 0x1405A5675),
    "core-close-count": (0x1405A59D7, 0x1405A59E8),
    "layer": (0x1405A53DA, 0x1405A5441),
    "layer-count": (0x1405A596F, 0x1405A5980),
    "bootstrap": (0x1405A5277, 0x1405A52CD),
    "bootstrap-count": (0x1405A5907, 0x1405A5918),
    "addons-tail": (0x1405A5C68, 0x1405A5CFA),
    "addons-tail-count": (0x1405A5E05, 0x1405A5E16),
    "slice-budget": (0x1405A5E55, 0x1405A5E81),
    "publication": (0x1405A6140, 0x1405A616E),
    "cover-progress": (0x1408DD872, 0x1408DD962),
    "world-fraction": (0x1418773F0, 0x141877465),
    "dispatch-table": (0x145F77A80, 0x145F77A9C),
    "fraction-one": (0x145EA2084, 0x145EA2088),
    "ui-weight": (0x145ECB700, 0x145ECB704),
    "world-weight": (0x145ECF1F4, 0x145ECF1F8),
    "bootstrap-diagnostic": (0x145F968B0, 0x145F968F7),
}
OBSERVATIONS = [
    ("producer", "entry-loader", "004-0x1405a42c0.json", 0x1405A42C0),
    ("cover-consumer", "loading-drive", "003-drive.json", 0x1408DC380),
    ("core-close-bindings", "entry-phases", "003-0x1407ae670.json", 0x1407AE670),
    ("layer", "entry-phases", "004-0x1407ae870.json", 0x1407AE870),
    ("layer-gate", "entry-phases", "005-0x1407ae910.json", 0x1407AE910),
    ("bootstrap", "entry-phases", "006-0x1407af960.json", 0x1407AF960),
    ("addons-and-event-tail", "entry-tail", "003-0x140c46d40.json", 0x140C46D40),
    ("vm-preparation", "entry-prepare", "003-0x1405ed790.json", 0x1405ED790),
]


def encoded(value):
    return json.dumps(value, indent=2, ensure_ascii=False) + "\n"


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def f32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def dependencies():
    for directory in ("runtime/tool-state/python/camera/python-libs",
                      "runtime/tool-state/python/armory/python-libs"):
        sys.path.insert(0, str(ROOT / directory))


def native_replay(raw):
    dependencies()
    import unicorn as u
    from unicorn import x86_const as x

    cpu = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    for address, count in ((0x1405A4000, 0x3000), (0x1408DC000, 0x3000),
                           (0x141877000, 0x1000), (0x145EA2000, 0x1000),
                           (0x145ECB000, 0x1000), (0x145ECF000, 0x1000)):
        cpu.mem_map(address, count)
        cpu.mem_write(address, raw(address, count))
    mem, stack, done = 0x200000000, 0x300000000, 0x400000000
    for address in (mem, stack, done):
        cpu.mem_map(address, 0x10000)
    ui, record, screen, world, frame, epoch = [mem + n for n in (0x100, 0x400, 0x600, 0x800, 0x1000, 0x2000)]

    def put(address, fmt, *values):
        cpu.mem_write(address, struct.pack("<" + fmt, *values))

    def reg(name, value):
        cpu.reg_write(getattr(x, "UC_X86_REG_" + name), value)

    def reset():
        cpu.mem_write(mem, bytes(0x10000))
        put(stack + 0x8000, "Q", done)
        reg("RSP", stack + 0x8000)
        reg("RBP", frame)
        reg("EFLAGS", 2)
        reg("MXCSR", 0x1F80)

    stops = set()

    def stop(_, address, size, unused):
        if address in stops:
            cpu.emu_stop()

    cpu.hook_add(u.UC_HOOK_CODE, stop)
    counter_rows = []
    for total in (5, 6, 17, 1000):
        reset()
        reg("R12", ui)
        reg("R13", total)
        cpu.emu_start(0x1405A5B98, 0x1405A5BAC, count=10)
        result = struct.unpack("<QQ", cpu.mem_read(ui + 0x110, 16))
        assert result == (0, total)
        counter_rows.append(["initialize", total, *result])
    for completed in (0, 1, 50, 1 << 32):
        reset()
        put(ui + 0x110, "Q", completed)
        reg("R13", ui)
        reg("R14", 4)
        cpu.emu_start(0x1405A5803, 0x1405A5819, count=10)
        result = struct.unpack("<QQ", cpu.mem_read(ui, 16))
        assert result == (1, 5)
        assert struct.unpack("<Q", cpu.mem_read(ui + 0x110, 8))[0] == completed + 1
        counter_rows.append(["row", completed, *result])
        for start, end, state in ((0x1405A59D7, 0x1405A59E8, 3),
                                  (0x1405A596F, 0x1405A5980, 4),
                                  (0x1405A5907, 0x1405A5918, 5),
                                  (0x1405A5E05, 0x1405A5E16, 6)):
            reset()
            reg("RCX", ui)
            reg("RAX", record)
            reg("RDX", 42)
            put(ui + 0x110, "Q", completed)
            cpu.emu_start(start, end, count=10)
            result = struct.unpack("<Q", cpu.mem_read(ui, 8))[0]
            assert result == state
            assert struct.unpack("<Q", cpu.mem_read(ui + 0x110, 8))[0] == completed + 1
            counter_rows.append(["phase", state, completed, result])
    budget_rows = []
    for seconds, nanos in itertools.product((0, 1), (0, 1, 7_999_999, 8_000_000, 8_000_001, 999_999_999)):
        reset()
        reg("RAX", seconds)
        reg("RDX", nanos)
        stops = {0x1405A5119, 0x1405A5E81}
        cpu.emu_start(0x1405A5E70, done, count=10)
        result = cpu.reg_read(x.UC_X86_REG_RIP)
        assert result == (0x1405A5119 if seconds == 0 and nanos < 8_000_000 else 0x1405A5E81)
        budget_rows.append([seconds, nanos, hex(result)])

    progress_rows = []
    for previous, completed, total, ui_counts, snap in itertools.product(
            (0.0, 0.25, 0.9), (0, 1, 3, 4, 7, (1 << 63) + 1024),
            (0, 1, 4, (1 << 63) + 2048),
            (None, (0, 0), (0, 10), (3, 10), (10, 10), (20, 10)), (False, True)):
        reset()
        put(frame - 0x40, "Q", screen)
        put(frame - 0x30, "Q", epoch)
        put(frame - 0x24, "I", 99)
        put(frame - 0x20, "Q", world)
        put(frame + 0x180, "Q", ui if ui_counts is not None else 0)
        put(world, "QQ", completed, total)
        put(screen + 0x3C, "f", previous)
        put(screen + 0x49, "B", int(snap))
        if ui_counts is not None:
            put(ui + 0x110, "QQ", *ui_counts)
        stops = {0x1408DD962}
        cpu.emu_start(0x1408DD872, done, count=200)
        fraction = min(f32(f32(completed) / f32(total)), 1.0) if total else 0.0
        if ui_counts is not None:
            got, wanted = ui_counts
            ui_fraction = min(f32(f32(got) / f32(wanted)), 1.0) if wanted else 0.0
            fraction = f32(f32(fraction * f32(0.8)) + f32(ui_fraction * f32(0.2)))
        expected = f32(previous if snap else max(previous, fraction))
        result = cpu.reg_read(x.UC_X86_REG_XMM0) & 0xFFFFFFFF
        assert result == struct.unpack("<I", struct.pack("<f", expected))[0]
        progress_rows.append([previous, completed, total, ui_counts, snap, result])
    return {"counter_cases": len(counter_rows), "counter_sha256": sha(encoded(counter_rows).encode()),
            "budget_cases": len(budget_rows), "budget_sha256": sha(encoded(budget_rows).encode()),
            "progress_cases": len(progress_rows), "progress_sha256": sha(encoded(progress_rows).encode())}


def source_check():
    lifecycle = (ROOT / "crates/benilla-app/src/ui_script/lifecycle.rs").read_text()
    manifest = (ROOT / "crates/benilla-app/src/ui_script/manifest.rs").read_text()
    cover = (ROOT / "crates/benilla-app/src/loading_screen.rs").read_text()
    assert "std::time::Duration::from_millis(8)" in lifecycle
    pending = lifecycle.split("pub(crate) fn run_pending_entry_load(", 1)[1].split("/// Seat the VM", 1)[0]
    assert pending.index("c.presented()") < pending.index("begin_ingame_ui_load(")
    assert pending.index("finish_ingame_ui_load(world, load)") < pending.index("world.remove_resource::<PendingEntryUiLoad>();", pending.index("finish_ingame_ui_load(world, load)"))
    assert "completed: 0" in pending and "total: load.files.total()" in pending
    assert "world.resource_mut::<EntryUiLoadProgress>().completed += 1" in pending
    assert "world.insert_non_send_resource(load)" in pending
    total = manifest.split("pub(super) fn total(&self)", 1)[1].split("/// Perform", 1)[0]
    assert "core.toc.files.len()) + 5" in " ".join(total.split())
    assert "std::slice::from_ref(file)" in manifest
    for stage in ("Core", "Bindings", "Layer", "Bootstrap", "Complete"):
        assert f"EntryUiFilesPhase::{stage}" in manifest
    tail = lifecycle.split("fn step_ingame_ui_load(", 1)[1].split("fn finish_ingame_ui_load(", 1)[0]
    assert tail.index("files.load_addons(script)") < tail.index("finish_ui_load_with(")
    assert "script.push_sound_suppression()" in lifecycle and "script.pop_sound_suppression()" in lifecycle
    discard = lifecycle.split("fn discard_entry_ui_work(", 1)[1].split("/// The glue VM", 1)[0]
    assert "remove_non_send_resource::<EntryUiLoad>()" in discard
    assert "remove_resource::<EntryUiLoadProgress>()" in discard
    close = lifecycle.split("fn close_ui_session(", 1)[1].split("/// A `ReloadUI()", 1)[0]
    assert close.index("discard_entry_ui_work(world)") < close.index("shutdown_ui_state(")
    for term in ("entry_ui_pending.is_none()", "ui.fraction()", "progress.fraction() * 0.8", "* 0.2", "screen.displayed.max(fraction)"):
        assert term in cover, term


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--collect", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "This recovery belongs only to the named 0.113.2 target"
    data = target_bytes(target)
    pe = load_script("inventory", ROOT / "scripts/inventory-executable.py").PE(data)

    def raw(address, count):
        offset = pe.rva_offset(address - pe.image_base)
        return data[offset:offset + count]

    table = 0x145F77A80
    cases = [table + n for n in struct.unpack("<7i", raw(table, 28))]
    assert cases == [0x1405A520B, 0x1405A54D5, 0x1405A5361, 0x1405A53DA,
                     0x1405A5277, 0x1405A5552, 0x1405A6140]
    ranges = [{"role": role, "start": hex(a), "end_exclusive": hex(b),
               "file_offset": pe.rva_offset(a - pe.image_base), "sha256": sha(raw(a, b - a))}
              for role, (a, b) in RANGES.items()]
    replay = native_replay(raw)
    if args.collect:
        dependencies()
        import capstone
        decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        out = WORK / "curated-entry-ui"
        out.mkdir(exist_ok=True)
        assembly = []
        for role, (a, b) in RANGES.items():
            if a >= 0x145000000:
                continue
            assembly.append(f"; {role} {a:#x}..{b:#x}")
            assembly.extend(f"{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                            for i in decoder.disasm(raw(a, b - a), a))
        (out / "native-contracts.asm").write_text("\n".join(assembly) + "\n")
        observations = []
        for role, group, filename, address in OBSERVATIONS:
            result = json.loads((WORK / group / "session" / filename).read_text())["response"]["result"]
            evidence = result.get("structuredContent") or json.loads(result["content"][0]["text"])
            group_raw = (WORK / group / "range.bin").read_bytes()
            plan = json.loads((WORK / group / "plan.json").read_text())
            raw_start = int(plan["open_options"]["entry_point"], 16)
            if group == "entry-loader":
                extents = dict(json.loads((WORK / "pe-functions.json").read_text()))
                spans = [(a, extents[a] - a) for a in (0x1405A3690, 0x1405A42C0, 0x1405A6C80)]
            else:
                spans = [(raw_start, len(group_raw))]
            expected = bytearray(len(group_raw))
            segments = []
            for start, size in spans:
                content = raw(start, size)
                expected[start - raw_start:start - raw_start + size] = content
                segments.append({"start": hex(start), "size": size, "sha256": sha(content)})
            assert group_raw == expected, "Ghidra input must retain exact current PE segments with explicit zero-filled gaps"
            assert evidence["subject"]["digest"]["sha256"] == sha(group_raw)
            assert evidence["provider"]["id"] == "ghidra"
            observations.append({"role": role, "address": hex(address), "evidence_id": evidence["evidence_id"],
                                 "analysis_profile_digest": evidence["analysis_profile"]["digest"],
                                 "raw_input_start": hex(raw_start), "raw_input_size": len(group_raw),
                                 "raw_input_segments": segments, "unlisted_input_bytes": "zero-filled",
                                 "raw_input_sha256": sha(group_raw),
                                 "pseudocode_sha256": sha(evidence["raw_result"]["value"].encode())})
        manifest = {"target_version": "0.113.2", "target_sha256": SHA, "target_executed": False,
                    "provider": "Ghidra 12.1.4", "ranges": ranges, "observations": observations,
                    "stage_targets": [hex(a) for a in cases], "replay": replay,
                    "assembly_sha256": sha((out / "native-contracts.asm").read_bytes()),
                    "limits": ["Raw Ghidra imports omit PE/callee/global data context and use GCC ABI; Windows registers and exact PE instructions govern interpretation.",
                               "The producer's raw import does not resolve its rdata jump table and decompiler removes successors. Exact current table bytes, decoded case instructions and scalar replays establish the bounded state/count contract.",
                               "Native scalar replays provide explicit storage/clock seams. They do not execute Lua, Rust, ECS scheduling, actual files, rendering, sound or application lifecycle.",
                               "VM seeding and addon/saved-variable internals reuse existing source; these focused contracts do not certify every surrounding engine API or parity."]}
        (out / "manifest.json").write_text(encoded(manifest))
        print("Staged", out.relative_to(ROOT))
    if args.check:
        manifest = json.loads((RETAINED / "manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        assert manifest["ranges"] == ranges
        assert manifest["stage_targets"] == [hex(a) for a in cases]
        assert manifest["replay"] == replay
        for observation in manifest["observations"]:
            base = int(observation["raw_input_start"], 16)
            reconstructed = bytearray(observation["raw_input_size"])
            for segment in observation["raw_input_segments"]:
                start, size = int(segment["start"], 16), segment["size"]
                content = raw(start, size)
                assert sha(content) == segment["sha256"]
                reconstructed[start - base:start - base + size] = content
            assert sha(reconstructed) == observation["raw_input_sha256"]
        assert sha((RETAINED / "native-contracts.asm").read_bytes()) == manifest["assembly_sha256"]
        source_check()
        print(f"#61: {replay['counter_cases']} native counters, {replay['budget_cases']} slice boundaries, "
              f"{replay['progress_cases']} progress cases pass; live source seams traced. No compilation/application execution.")


if __name__ == "__main__":
    main()
