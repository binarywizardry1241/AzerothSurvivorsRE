#!/usr/bin/env python3
"""Recover selected native run HUD layout; never compile or launch the game.

--prepare stages exact owners and REA/Ghidra plans under runtime/.
--collect stages reviewed textual evidence, without promoting it automatically.
--verify replays bounded original instructions through the existing Unicorn probe.
--check checks the retained source-byte and pseudocode hashes.
"""
from portable_paths import objdump_output, portable_json
from native_recovery import digest as _shared_digest
from script_sources import load_script
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TARGET = ROOT / "AzerothSurvivors/AzerothSurvivors-0.105.0.exe"
SHA = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
WORK = ROOT / "runtime/fixgap7-layout"
OUT = ROOT / "runtime/native-evidence/0.105.0/run-hud"
RETAINED = ROOT / "docs/analysis/evidence/0.105.0/run-hud"
OWNERS = {
    "layout-update": 0x14026F450,
    "layout-constructor": 0x1401B8700,
    "layout-boss-row": 0x1401B5730,
    "layout-boss-content": 0x1401B6C20,
    "layout-build-content": 0x1401B5A90,
    "layout-build-row": 0x14014ACF0,
    "layout-persistent-init": 0x140272060,
    "layout-visibility-projection": 0x14027CA30,
    "layout-visibility-query": 0x1403908B0,
}
FRAGMENTS = {
    "layout-time-format": (0x140012BA0, 0x140012C57),
    "layout-producer-abilities": (0x1458FAE0B, 0x1458FB244),
    "layout-producer-boss-admission": (0x1458FB994, 0x1458FBCC1),
    "layout-producer-next-boss": (0x1458FBCC1, 0x1458FBD55),
    "layout-producer-next-boss-write": (0x1458FD54C, 0x1458FD623),
    "layout-producer-amulet": (0x1458FB70D, 0x1458FB994),
    "layout-color-srgba": (0x144C6F020, 0x144C6F071),
    "layout-visibility-boss-binding": (0x140336238, 0x1403362E9),
    "layout-visibility-boss-type": (0x1402803E0, 0x14028043F),
    "layout-visibility-tally-binding": (0x140335F68, 0x140335FD5),
    "layout-visibility-tally-type": (0x14028ED30, 0x14028ED96),
    "layout-visibility-build-binding": (0x140336E98, 0x140336F66),
    "layout-visibility-build-type": (0x14028E1F0, 0x14028E255),
    "layout-visibility-clock-binding": (0x1403371C8, 0x1403372A4),
    "layout-visibility-clock-type": (0x1402812C0, 0x14028131F),
    "layout-visibility-next-binding": (0x140335608, 0x1403356E4),
    "layout-visibility-next-type": (0x14027FA40, 0x14027FA9F),
    "layout-visibility-boss-getter": (0x1402A38D0, 0x1402A3953),
    "layout-visibility-tally-getter": (0x1402A1DE0, 0x1402A1E63),
    "layout-visibility-build-getter": (0x1402A5E70, 0x1402A5EF3),
    "layout-visibility-clock-getter": (0x1402A63D0, 0x1402A6453),
    "layout-visibility-next-getter": (0x1402A0860, 0x1402A08E3),
    "layout-loading-plugin-build": (0x140ADBB90, 0x140ADBE64),
    "layout-loading-plugin-name": (0x1407A9350, 0x1407A935D),
    "layout-visibility-system-init": (0x140287D20, 0x140287F3E),
    "layout-visibility-system-runner": (0x140287FC0, 0x140288238),
    "layout-visibility-resource-getter": (0x140029800, 0x140029885),
    "layout-visibility-suppression-producer": (0x14003C8A0, 0x14003C9B0),
    "layout-visibility-engine-cover": (0x14063CEE0, 0x14063CFD2),
}
CONSTANTS = {
    "boss-count-widths-f32": (0x145DBF4E8, 8),
    "boss-name-sizes-f32": (0x145DB7CD8, 8),
    "boss-bar-heights-f32": (0x145DB7CE0, 8),
    "gold-color": (0x145DB87F8, 20),
    "muted-color": (0x145DB883C, 20),
    "red-color": (0x145DB8858, 20),
    "boss-gradient-top-f32": (0x145DB7D00, 16),
    "boss-gradient-bottom-f32": (0x145DB7D10, 16),
    "boss-border-color": (0x145DB8A00, 20),
    "black-border-color": (0x145DB8B48, 20),
    "boss-background-f32": (0x145DB7CF0, 16),
    "clock-format-template": (0x145D6EF57, 17),
    "label-space-template": (0x145DB87F4, 4),
    "srgba-tag-zero-jump-table-entry": (0x146ABEED8, 4),
    "boss-marker-typeid": (0x145DBF610, 16),
    "tally-marker-typeid": (0x145DBF720, 16),
    "build-marker-typeid": (0x145DBF710, 16),
    "boss-marker-bundle-name": (0x145DC56FF, 99),
    "tally-marker-bundle-name": (0x145DC5618, 231),
    "build-marker-bundle-name": (0x145DC59D5, 200),
    "clock-marker-bundle-name": (0x145DC5A9D, 197),
    "next-marker-bundle-name": (0x145DC5357, 200),
    "suppression-resource-typeid": (0x145D6D9A0, 16),
    "loading-plugin-vtable": (0x145E841B0, 112),
    "loading-plugin-name": (0x145ED4FF3, 48),
    "engine-cover-resource-typeid": (0x145E5B700, 16),
}


def load_module(name, path):
    module = load_script(name, path)
    return module


def write(path, value):
    path.write_text(portable_json(value, indent=2) + "\n")


def digest(value):
    return _shared_digest(value)


def replay():
    # Reuse the exact Bevy Node384 decoder and fail-closed Windows ABI probe.
    # Its local Unicorn dependency is optional analysis tooling, never a build input.
    m = load_module("hud_probe_base", ROOT / "scripts/recover-rewards-layout.py")

    class Probe(m.Probe):
        def hook(self, machine, address, size, unused):
            bp = self.reg(m.UC_X86_REG_RBP)
            if address == self.halt:
                if self.start == 0x1401B6C20:
                    self.records.append(dict(site=hex(address), kind="node", role="boss-fill",
                                             node=self.node(bp - 0x30)))
                elif self.start == 0x1401B5A90 and address == 0x1401B62B5:
                    self.records.append(dict(site=hex(address), kind="node", role="build-icon",
                                             node=self.node(bp - 0x58)))
                self.u.emu_stop()
                return
            if self.start <= address < m.bounds[self.start] or address == 0x400000000:
                return super().hook(machine, address, size, unused)
            c, d, r8, sp = (self.reg(r) for r in
                           (m.UC_X86_REG_RCX, m.UC_X86_REG_RDX,
                            m.UC_X86_REG_R8, m.UC_X86_REG_RSP))
            site = self.q(sp) - 5
            if address in (0x140189F40, 0x140190EE0, 0x140190C30,
                           0x140191980, 0x14018A1F0, 0x14018AA00):
                offset = 16 if address == 0x140191980 else 8
                self.records.append(dict(site=hex(site), kind="node", node=self.node(r8 + offset)))
                self.u.mem_write(c + 8, self.read(d, 40))
                self.wq(c, 100)
                self.result(c)
            elif address in (0x140191C30, 0x140190460, 0x140191190):
                offset = 16 if address == 0x140191190 else 8
                font = struct.unpack("<f", self.read(r8 + offset + 72, 4))[0]
                self.records.append(dict(site=hex(site), kind="text", size=font))
                self.u.mem_write(c + 8, self.read(d, 40))
                self.wq(c, 101)
                self.result(c)
            elif address == 0x14018EF20:
                # Formatting/localization is an explicit seam; retain the font only.
                self.records.append(dict(site=hex(site), kind="text",
                                         size=struct.unpack("<f", self.read(r8 + 80, 4))[0]))
                self.u.mem_write(c + 8, self.read(d, 40))
                self.wq(c, 101)
                self.result(c)
            elif address == 0x145B9C4D0:
                if self.start == 0x140012BA0:
                    self.records.append(dict(minutes=self.q(self.q(r8)),
                                             seconds=self.q(self.q(r8 + 16))))
                self.outstr(c, "0")
            elif address == 0x144E07D20:
                self.result(321)
            elif address == 0x145BCB2D0:
                raise RuntimeError("Unexpected command-buffer growth in fixed fixture")
            elif address == 0x144C67100:
                # Tag0's unchanged native branch is a direct copy; separately bound below.
                assert struct.unpack("<I", self.read(d, 4))[0] == 0
                self.u.mem_write(c, self.read(d + 4, 16))
                self.result(c)
            elif address == 0x142633750:
                self.u.mem_write(c, bytes(48))
                self.result(c)
            elif address == 0x1401471A0:
                # The opaque user MPQ image handle is outside this layout fixture.
                self.u.mem_write(c, bytes(24))
                self.result(c)
            elif address == 0x1426D6630:
                self.u.mem_write(c, bytes(136))
                self.result(c)
            else:
                return super().hook(machine, address, size, unused)
            self.u.reg_write(m.UC_X86_REG_RIP, self.q(sp))
            self.u.reg_write(m.UC_X86_REG_RSP, sp + 8)

    def spawner(probe):
        p = probe.alloc(64)
        commands = probe.alloc(64)
        probe.wq(commands, 0x10000)
        probe.wq(commands + 8, probe.alloc(0x10000))
        probe.wq(p + 24, commands)
        probe.wq(p + 32, commands)
        return p

    probe = Probe(0x1401B8700, 0x1401BA42F)
    parent = spawner(probe)
    context, art = probe.alloc(64), probe.alloc(128)
    probe.wq(context, art)
    for offset in range(0, 128, 24):
        probe.u.mem_write(art + offset, b"\1")
    probe.run([parent, context])
    result = dict(constructor=probe.records)
    for index in (0, 1):
        probe = Probe(0x1401B6C20, 0x1401B7457)
        parent = spawner(probe)
        context, selected, font, width = (probe.alloc(n) for n in (32, 8, 24, 4))
        probe.wq(selected, index)
        probe.u.mem_write(font, b"\1")
        probe.u.mem_write(width, struct.pack("<f", 520 if index == 0 else 420))
        for offset, value in ((0, selected), (8, font), (16, width)):
            probe.wq(context + offset, value)
        probe.run([parent, context])
        result["boss-" + str(index)] = probe.records
    probe = Probe(0x1401B5A90)
    parent, context, inputs = spawner(probe), probe.alloc(64), probe.alloc(64)
    probe.wq(inputs, probe.alloc(64))
    probe.run([parent, context, inputs])
    result["build-empty"] = probe.records
    probe = Probe(0x1401B5A90, 0x1401B62B5)
    parent, context, inputs = spawner(probe), probe.alloc(64), probe.alloc(64)
    probe.wq(inputs, probe.alloc(64))
    vector, (icon, length) = probe.alloc(24), probe.string("inv_misc_questionmark")
    for offset, value in ((0, length), (8, icon), (16, length)):
        probe.wq(vector + offset, value)
    for offset, value in ((0, 1), (8, vector), (16, 1)):
        probe.wq(context + offset, value)
    probe.run([parent, context, inputs])
    result["build-icon"] = probe.records
    time_cases = [(-1.0, 0), (0.0, 0), (59.99, 59), (60.0, 60),
                  (3599.99, 3599), (6000.0, 6000), (float("nan"), 0),
                  (float("inf"), (1 << 64) - 1)]
    result["time-format"] = []
    for value, seconds in time_cases:
        probe = Probe(0x140012BA0)
        probe.u.reg_write(m.UC_X86_REG_XMM1, int.from_bytes(struct.pack("<d", value), "little"))
        probe.run([probe.alloc(24)])
        assert probe.records == [dict(minutes=seconds // 60, seconds=seconds % 60)]
        result["time-format"].append(dict(input=repr(value), **probe.records[0]))

    class VisibilityProbe(m.Probe):
        def hook(self, machine, address, size, unused):
            if address in self.stops:
                self.u.emu_stop()
                return
            assert self.start <= address < self.end, hex(address)

        def run_slice(self):
            self.u.emu_start(self.start, 0x400000000, count=100)
            assert self.reg(m.UC_X86_REG_RIP) in self.stops

    # Run the native selector itself. ECS Has<T> results are explicit fixture
    # inputs; query construction and named bundle TypeIds are separate extracts.
    probe = VisibilityProbe(0x14027CFAA)
    probe.end, probe.stops = 0x14027CFDC, {0x14027CFDC}
    flags = probe.alloc(16)
    probe.wq(probe.sp + 0x18, flags)
    result["visibility-main"] = []
    for bits in range(16):
        values = bytes((bits >> i) & 1 for i in range(4))
        probe.u.mem_write(flags, values)
        for marker, index in (("clock", 0), ("next-boss", 0), ("bosses", 1),
                              ("tally", 2), ("build", 3)):
            probe.u.reg_write(m.UC_X86_REG_RBP, int(index == 1))
            probe.u.reg_write(m.UC_X86_REG_R15, flags + 1)
            probe.u.mem_write(probe.sp + 4, struct.pack("<I", int(index == 3)))
            probe.u.mem_write(probe.sp + 0x10, struct.pack("<I", int(index == 2)))
            probe.run_slice()
            value = probe.reg(m.UC_X86_REG_R14) & 255
            assert value == 1 - values[index]
            result["visibility-main"].append(dict(flags=list(values), marker=marker,
                                                   visibility=value))
    probe = VisibilityProbe(0x14027CB3C)
    probe.end, probe.stops = 0x14027CB8A, {0x14027CB4A, 0x14027CB8A}
    flags, cover = probe.alloc(16), probe.alloc(16)
    probe.wq(probe.sp + 0x18, flags)
    probe.u.reg_write(m.UC_X86_REG_R10, cover)
    result["visibility-banners-loot"] = []
    for bits in range(8):
        loading, banners, loot = ((bits >> i) & 1 for i in range(3))
        probe.u.mem_write(cover, bytes([loading]))
        probe.u.mem_write(flags + 4, bytes([banners, loot]))
        for marker in ("banner", "loot", "both"):
            banner_tag, loot_tag = marker in ("banner", "both"), marker in ("loot", "both")
            probe.u.reg_write(m.UC_X86_REG_RBP, int(banner_tag))
            probe.u.reg_write(m.UC_X86_REG_R9, int(loot_tag))
            probe.run_slice()
            value = probe.reg(m.UC_X86_REG_RAX) & 255
            expected = loading or (banner_tag and not banners) or (loot_tag and not loot)
            assert value == expected
            result["visibility-banners-loot"].append(dict(loading=loading, banners=banners,
                                                         loot=loot, marker=marker, visibility=value))
    assert len(result["constructor"]) == 10
    assert [r["node"]["width"] for r in result["boss-0"] if r["kind"] == "node"] == [[1, 520], [2, 100]]
    assert [r["size"] for r in result["boss-0"] if r["kind"] == "text"] == [17]
    assert [r["size"] for r in result["boss-1"] if r["kind"] == "text"] == [15]
    icon = result["build-icon"][-1]["node"]
    assert icon["width"] == icon["height"] == [1, 28]
    assert icon["border"] == [[1, 1]] * 4
    assert icon["border_radius"] == [[1, 3]] * 4
    return dict(target_sha256=SHA, fixtures=result,
                seams=["font handles and fixed empty build inputs", "ECS entity/command submission",
                       "ECS marker membership supplied to bounded visibility branches",
                       "allocation", "formatting/localization", "box shadow allocation",
                       "opaque MPQ image asset and ImageNode"],
                limits=["Unmodified selected instructions establish Node fields and font sizes.",
                        "The application, layout engine, renderer, input and text shaping never run.",
                        "No build, gameplay, visual or interactive parity is established."])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("prepare", "collect", "verify", "check"):
        parser.add_argument("--" + name, action="store_true")
    args = parser.parse_args()
    data = TARGET.read_bytes()
    assert digest(data) == SHA, "Selected target SHA-256 mismatch"
    pe = load_module("hud_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    bounds = {pe.image_base + a: pe.image_base + b for a, b, _ in pe.functions()}
    WORK.mkdir(parents=True, exist_ok=True)
    OUT.mkdir(parents=True, exist_ok=True)

    def span(a, b):
        at = pe.rva_offset(a - pe.image_base)
        return dict(address=hex(a), end_exclusive=hex(b), file_offset=hex(at),
                    byte_count=b - a, sha256=digest(data[at:at + b - a]))

    if args.check:
        manifest = json.loads((RETAINED / "layout-manifest.json").read_text())
        assert manifest["target_sha256"] == SHA
        for row in manifest["ranges"]:
            for key, value in span(int(row["address"], 16), int(row["end_exclusive"], 16)).items():
                assert row[key] == value, (row["role"], key)
            if "pseudocode" in row:
                assert digest((RETAINED / row["pseudocode"]).read_bytes()) == row["pseudocode_sha256"]
            assert digest((RETAINED / row["assembly"]).read_bytes()) == row["assembly_sha256"]
        for row in manifest["constants"]:
            at = int(row["file_offset"], 16)
            assert data[at:at + row["byte_count"]].hex() == row["hex"]
        print("Verified selected native HUD ranges and retained pseudocode hashes")
    rows = []
    for role, address in OWNERS.items():
        row = dict(role=role, **span(address, bounds[address]))
        if args.prepare:
            at = int(row["file_offset"], 16)
            path = WORK / (role + ".bin")
            path.write_bytes(data[at:at + row["byte_count"]])
            write(WORK / (role + "-plan.json"), dict(
                target=str(path.relative_to(ROOT)), output=str((WORK / ("rea-" + role)).relative_to(ROOT)),
                init_timeout=60, timeout=240,
                open_options=dict(format="raw-binary", architecture="x86_64", entry_point=hex(address)),
                operations=[dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(address)))]))
        rows.append(row)
    rows += [dict(role=role, **span(a, b)) for role, (a, b) in FRAGMENTS.items()]
    if args.collect:
        for row in rows:
            role = row["role"]
            assembly = objdump_output([
                "objdump", "-d", "--no-show-raw-insn", "--start-address=" + row["address"],
                "--stop-address=" + row["end_exclusive"], str(TARGET)], text=True, cwd=ROOT)
            assembly = assembly.replace(str(TARGET), "AzerothSurvivors/AzerothSurvivors-0.105.0.exe")
            row["assembly"] = role + ".asm"
            (OUT / row["assembly"]).write_text(assembly)
            row["assembly_sha256"] = digest(assembly.encode())
            response = WORK / ("rea-" + role) / "003-procedure_pseudo_code.json"
            if role == "layout-persistent-init" and not response.exists():
                response = ROOT / "runtime/fixgap7-controls/rea-owner-140272060/003-procedure_pseudo_code.json"
            if response.exists():
                raw = json.loads(response.read_text())["response"]["result"]
                record = raw.get("structuredContent") or json.loads(raw["content"][0]["text"])
                assert record["provider"]["id"] == "ghidra"
                assert record["subject"]["digest"]["sha256"] == row["sha256"]
                value = record["normalized_result"]
                text = value if isinstance(value, str) else value["pseudocode"]
                text = "\n".join(line.rstrip() for line in text.splitlines()).strip() + "\n"
                row["rea_evidence_id"] = record["evidence_id"]
                if role == "layout-constructor":
                    # Typed instruction fixtures and the assembly retain the
                    # constructor contract without duplicating spawn boilerplate.
                    row["ghidra_normalized_sha256"] = digest(text.encode())
                    row["pseudocode_retention"] = "runtime only; assembly and typed instruction fixtures retained"
                else:
                    row["pseudocode"] = role + ".ghidra.c"
                    (OUT / row["pseudocode"]).write_text(text)
                    row["pseudocode_sha256"] = digest(text.encode())
        constants = []
        for role, (address, count) in CONSTANTS.items():
            row = dict(role=role, **span(address, address + count))
            at = int(row["file_offset"], 16)
            row["hex"] = data[at:at + count].hex()
            constants.append(row)
        write(OUT / "layout-manifest.json", dict(target_sha256=SHA, ranges=rows, constants=constants,
              visibility_projection=dict(
                  owner="0x14027ca30", query_initializer="0x1403908b0",
                  component="bevy_camera::visibility::Visibility",
                  value_bytes=dict(inherited=0, hidden=1),
                  markers=dict(ClockText=0, NextBossText=0, BossBars=1, Tally=2, BuildRows=3),
                  main_clause="Visibility = 1 - HudParts[marker_index]; Node.display unchanged",
                  banner_loot_clause="loading_cover || (banner_marker && !HudParts[4]) || (loot_marker && !HudParts[5])",
                  loading_binding=dict(plugin_name_getter="0x1407a9350",
                                       plugin_vtable="0x145e841b0", plugin_build="0x140adbb90",
                                       engine_resource_typeid_high64="a8124f22a0d568a8",
                                       engine_getter="0x14063cee0", byte_offset=72,
                                       app_copy="0x14003c8a0",
                                       app_resource_typeid_high64="4878caffe80135d0"),
                  pause_or_choice_gate=False),
              limitations=["Static Ghidra raw x86-64 import; generic GCC ABI.",
                           "Windows registers, Node layouts, constants and jump tables corroborated in the original PE.",
                           "Source implementation and native/rebuilt parity are separate claims."]))
    if args.verify:
        write(OUT / "layout-vectors.json", replay())
        print("Verified constructor, boss, build, time and 104 native visibility instruction fixtures")


if __name__ == "__main__":
    main()
