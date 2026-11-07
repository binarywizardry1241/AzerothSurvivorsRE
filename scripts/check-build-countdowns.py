#!/usr/bin/env python3
"""Check current build countdown producer/UI bytes and source without compilation.

--collect stages the compact native manifest/extracts under --work for review.
--verify executes bounded original timer instructions with synthetic input seams.
No build, native target process, GPU, filesystem operation or Windows CRT runs.
"""
from portable_paths import portable_json, portable_record
from native_recovery import f32 as _shared_f32, bits as _shared_bits, digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import itertools
import json
import math
from pathlib import Path
import struct
import sys

from coverage_common import ROOT, latest_target, project_path, target_bytes

SHA = "dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a"
RETAINED = ROOT / "docs/analysis/evidence/build-countdowns"
SPANS = {
    "timer-admission-deadline": (0x1458F5400, 0x1458F5493),
    "inactive-timer": (0x1458F55F0, 0x1458F5602),
    "remaining-clamp": (0x1458F557D, 0x1458F5587),
    "number-finite-gate": (0x14598F8CF, 0x14598F8F6),
    "number-nonfinite-zero": (0x14598F913, 0x14598F929),
    "timer-schema-key-icon": (0x1458F54EB, 0x1458F557D),
    "timer-schema-left": (0x1458F5587, 0x1458F55B1),
    "three-build-vectors": (0x1400D1473, 0x1400D17CF),
    "timer-label-input": (0x1400D1D52, 0x1400D1E3F),
    "timer-label-style": (0x14025B6D5, 0x14025B77D),
    "timer-icon-style": (0x14025B443, 0x14025B5EB),
}
LITERALS = {
    "timer-keys": (0x145DB9108, 10),
    "producer-keys": (0x146C09B40, 20),
    "producer-timer-key": (0x146C09C0D, 6),
    "icon-size": (0x145DC99E0, 16),
    "icon-radius": (0x145DBAE80, 16),
    "label-color": (0x145E06BA8, 20),
    "label-shadow-offset": (0x145DB16B0, 8),
    "label-shadow-color": (0x145DBEA48, 20),
    "ceil-import-thunk": (0x145C0A429, 6),
}
OWNERS = {
    "hud-producer": (0x1458F40B0, 0x1458F7396),
    "hud-updater": (0x1400CEF80, 0x1400D213A),
    "build-row-constructor": (0x14025A730, 0x14025B8C1),
    "icon-loader": (0x140126DE0, 0x14012704E),
}

def digest(data):
    return _shared_digest(data)

def f32(value):
    return _shared_f32(value)

def bits(value):
    return _shared_bits(value)

def dump(path, value):
    path.write_text(portable_json(value, indent=2) + "\n")

def source_check():
    base = ROOT / "crates/azeroth-survivors-re/src"
    view = (base / "gameplay/run_hud/view.rs").read_text()
    for token in ["game.hud_build_timers()", "BuildCountdown(usize)",
                  "Vec<Option<Handle<Image>>>; 3", "row_index == 2 && icons.is_empty()",
                  "countdown(timers.get(index).copied()), 13., GOLD",
                  "Label::BuildCountdown(index) => countdown(timers.get(*index).copied())",
                  "f64::from(remaining).ceil() } else { 0. }", "remaining.is_finite()",
                  "width: Val::Px(28.)", "height: Val::Px(28.)",
                  "border_radius: BorderRadius::all(Val::Px(3.))",
                  "align_items: AlignItems::Center", "justify_content: JustifyContent::Center",
                  "native_hud_questionmark"]:
        assert token in view, token
    signature = view.split('let build_signature =', 1)[1].split(';', 1)[0]
    assert "timer_icons" in signature and "remaining" not in signature
    assert '.entity(state.build_root.expect("live HUD build container"))' in view
    assert "talent_art: Res<TalentArt>" in view and "talent_art.icon(key).cloned()" in view
    talents = (base / "talents.rs").read_text()
    assert "pub(crate) fn icon(&self, key: &str) -> Option<&Handle<Image>>" in talents
    assert "icons.extend(tree.talents.iter().map(|talent| talent.icon.clone()))" in talents
    demons = (base / "gameplay/mechanics/demons.rs").read_text()
    body = demons.split("pub fn hud_build_timers(&self)",1)[1].split("pub(super) fn configure_demons",1)[0]
    for token in ["self.effect_state.equipped.rows.iter().enumerate()", "row.bytes[63] != 34",
                  "self.effect_state.meter_sources.get(index)?", "generic.counters.get(index)",
                  "generic.deadlines.get(index)", "row.float(8) * self.current_cooldown_multiplier()",
                  "raw.max(row.float(12))", "timestamp + period - self.clock", "Some((source.icon, remaining))"]:
        assert token in body, token


def replay(raw):
    import unicorn as u
    from unicorn import x86_const as x
    machine = u.Uc(u.UC_ARCH_X86, u.UC_MODE_64)
    scratch = 0x400000000
    machine.mem_map(scratch, 0x10000)
    active_spans = [SPANS[key] for key in ["timer-admission-deadline", "inactive-timer", "remaining-clamp", "number-finite-gate"]]
    for page in sorted({value & ~4095 for a, b in active_spans for value in range(a, b + 4095, 4096)}):
        machine.mem_map(page, 4096)
        machine.mem_write(page, raw(page, 4096))
    def reg(name, value=None):
        number = getattr(x, "UC_X86_REG_" + name)
        if value is None:
            return machine.reg_read(number)
        machine.reg_write(number, value)
    def scalar(name, value=None):
        if value is None:
            return struct.unpack("<f", struct.pack("<I", reg(name) & 0xffffffff))[0]
        reg(name, bits(value))
    def qword(at, value):
        machine.mem_write(at, struct.pack("<Q", value))
    def float_at(at, value):
        machine.mem_write(at, struct.pack("<f", value))
    stops = set()
    def hook(cpu, address, size, unused):
        if address in stops:
            cpu.emu_stop()
        elif not any(a <= address < b for a, b in active_spans):
            raise AssertionError("Unreviewed instruction: " + hex(address))
    machine.hook_add(u.UC_HOOK_CODE, hook)
    def run(start, *ends):
        stops.clear(); stops.update(ends)
        reg("MXCSR", 0x1f80)
        machine.emu_start(start, 0, count=100)
        assert reg("RIP") in stops
        return reg("RIP")
    frame, row, times, counts = [scratch + value for value in [0x1000, 0x2000, 0x3000, 0x4000]]
    results = []
    values = itertools.product([0, 34, 253], [False, True], [0, 1], [False, True],
                               [0., 7.], [.1, 1., 2.], [0., 13., 30.])
    for tag, has_activity, count, has_time, timestamp, recovery, now in values:
        machine.mem_write(row, bytes(64))
        machine.mem_write(row, bytes([tag]))
        float_at(row + 8, 30.); float_at(row + 12, 13.)
        qword(frame - 0x48, int(has_activity)); qword(frame, counts)
        qword(frame + 8, int(has_time)); qword(frame + 0x10, times)
        machine.mem_write(counts, struct.pack("<I", count)); float_at(times, timestamp)
        reg("RBP", frame); reg("RBX", row); reg("R15", row); reg("R12", 0)
        reg("R10", 1); reg("R11", 1); scalar("XMM7", recovery)
        scalar("XMM8", now); scalar("XMM9", 0.)
        stop = run(0x1458F5400, 0x1458F5493, 0x1458F53F0)
        admitted = stop == 0x1458F5493
        assert admitted == (tag == 34)
        if admitted:
            deadline = (f32((timestamp if has_time else 0.) + max(f32(30. * f32(recovery)), 13.))
                        if has_activity and count else f32(now))
            assert bits(scalar("XMM10")) == bits(deadline)
            run(0x1458F557D, 0x1458F5587)
            remaining = max(f32(deadline - f32(now)), 0.)
            assert bits(scalar("XMM10")) == bits(remaining)
            results.append(dict(activity=has_activity, count=count, has_time=has_time,
                                timestamp=timestamp, recovery=recovery, now=now,
                                remaining_bits=bits(remaining)))
    # Native maxss chooses the supplied +0 for negative/unordered remaining.
    for deadline, now in itertools.product([-1., 0., 13., 30., math.nan, math.inf], [0., 13., math.nan]):
        scalar("XMM10", deadline); scalar("XMM8", now); scalar("XMM9", 0.)
        run(0x1458F557D, 0x1458F5587)
        difference = f32(deadline - now)
        expected = difference if difference > 0. else 0.
        assert bits(scalar("XMM10")) == bits(expected)
    finite_cases = [-math.inf, -3., -0., 0., .001, .9999, 1., 13., 30., math.inf, math.nan]
    for value in finite_cases:
        reg("RSP", frame + 0x500)
        reg("XMM1", int.from_bytes(struct.pack("<d", value), "little"))
        stop = run(0x14598F8CF, 0x14598F8F6, 0x14598F92E)
        assert (stop == 0x14598F92E) == math.isfinite(value)
    canonical = json.dumps(results, sort_keys=True, separators=(",", ":")).encode()
    return dict(admission_cases=432, admitted_countdown_cases=len(results), clamp_boundary_cases=18, number_finite_cases=len(finite_cases),
                admitted_cases_sha256=digest(canonical),
                representative_cases=[results[index] for index in [0, 27, 72, 100, 143]],
                seams=["Synthetic effect, activity/timestamp vectors, global cooldown and clock.",
                       "Original allocator, serialization, ECS, Windows ceil/formatting and renderer are not executed."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--collect", action="store_true")
    parser.add_argument("--verify", action="store_true")
    parser.add_argument("--work", default="runtime/analysis/history/combat/build-countdowns/8ffa7440efbf/curated")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Installed target changed; recover its HUD contract first"
    data = target_bytes(target)
    module = load_script("countdown_pe", ROOT / "scripts/inventory-executable.py")
    pe = module.PE(data)
    def raw(start, size):
        offset = pe.rva_offset(start - pe.image_base)
        value = data[offset:offset + size]
        assert len(value) == size
        return value
    def span(start, end):
        return dict(address=hex(start), end_exclusive=hex(end), byte_count=end-start,
                    file_offset=hex(pe.rva_offset(start-pe.image_base)), sha256=digest(raw(start,end-start)))
    bounds = {pe.image_base + a: pe.image_base + b for a, b, *_ in pe.functions()}
    for key, (start, end) in OWNERS.items():
        assert bounds[start] == end, key
    imports = next(row for row in pe.imports() if row["library"] == "api-ms-win-crt-math-l1-1-0.dll")
    thunk = raw(0x145C0A429, 6)
    assert thunk[:2] == b"\xff\x25"
    iat = 0x145C0A429 + 6 + struct.unpack("<i", thunk[2:])[0]
    assert iat == int(imports["iat_start_address"], 16) + imports["functions"].index("ceil") * 8
    source_check()
    manifest = dict(schema_version=1,target={key:target[key] for key in ["version","path","sha256","size_bytes"]},
                    owners=[dict(role=key, **span(a,b)) for key,(a,b) in OWNERS.items()],
                    ranges=[dict(role=key, **span(a,b)) for key,(a,b) in SPANS.items()],
                    literals=[dict(role=key, **span(a,a+n), bytes_hex=raw(a,n).hex()) for key,(a,n) in LITERALS.items()],
                    limits=["Focused Ghidra raw-range recovery; imports, global callers and ECS ownership remain bounded.",
                            "No compilation, game, rendered/native interaction or original/rebuilt parity check."])
    if args.collect:
        import capstone
        output = project_path(args.work); output.mkdir(parents=True, exist_ok=True)
        decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64)
        for row in manifest["ranges"]:
            start=int(row["address"],16); value=raw(start,row["byte_count"])
            instructions=list(decoder.disasm(value,start))
            assert b"".join(bytes(i.bytes) for i in instructions)==value
            text="".join(f"{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()+"\n" for i in instructions)
            filename=row["role"]+".asm"; (output/filename).write_text(text)
            row.update(assembly=filename,assembly_sha256=digest(text.encode()))
        manifest["generator"] = dict(path="scripts/check-build-countdowns.py",
                                     sha256=digest(Path(__file__).read_bytes()))
        manifest["ghidra"] = []
        for role, record, imported in [
            ("hud-producer", "producer/session/003-procedure_pseudo_code.json", "producer/range.bin"),
            ("hud-updater", "ghidra/004-procedure_pseudo_code.json", "hud.bin"),
            ("build-row-constructor", "timer-update/session/003-procedure_pseudo_code.json", "timer-update/range.bin"),
            ("icon-loader", "timer-icon/session/003-procedure_pseudo_code.json", "timer-icon/range.bin"),
        ]:
            root = ROOT / "runtime/analysis/history/combat/build-countdowns/8ffa7440efbf"
            observed = json.loads((root / record).read_text())["response"]["result"]["structuredContent"]
            value = observed["normalized_result"]
            manifest["ghidra"].append(dict(role=role,evidence_id=observed["evidence_id"],
                import_sha256=digest((root/imported).read_bytes()),
                decompiler_text_sha256=digest(value.encode()),
                limitations="Raw x86-64 import, inferred ABI/types; external PE/global callers are not recovered."))
        dump(output/"manifest.json",manifest)
        if args.verify: dump(output/"native-cases.json",replay(raw))
        print("Staged current build countdown evidence:", output.relative_to(ROOT))
    else:
        retained=json.loads((RETAINED/"manifest.json").read_text())
        assert retained["target"] == manifest["target"]
        assert retained["generator"]["sha256"] == digest(Path(__file__).read_bytes())
        for actual, expected in zip(manifest["ranges"],retained["ranges"],strict=True):
            assert all(expected[key]==value for key,value in actual.items())
            assert digest((RETAINED/expected["assembly"]).read_bytes())==expected["assembly_sha256"]
        assert manifest["owners"]==retained["owners"] and manifest["literals"]==retained["literals"]
        if args.verify: assert portable_record(replay(raw))==portable_record(json.loads((RETAINED/"native-cases.json").read_text()))
        print("Current native build countdown bytes/source verified" + ("; 432 admission + 18 clamp + 11 number cases" if args.verify else ""))

if __name__ == "__main__":
    main()
