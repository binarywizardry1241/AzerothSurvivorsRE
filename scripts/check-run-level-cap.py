#!/usr/bin/env python3
"""Check the AS ReputationFrame level-cap append without compiling or running a game.

The original patcher instructions run in synthetic memory with explicit file,
UTF-8 conversion, formatting, allocation and publication seams. The installed
stock Lua consumer runs separately in a standalone Lua interpreter.
"""
from portable_paths import portable_json, portable_record
import argparse
import gzip
import hashlib
import json
import math
import re
import struct
import subprocess
from pathlib import Path

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from coverage_common import ROOT, latest_target, target_bytes, file_sha256, verify_resources, load_json
from equipment_native import EquipmentProbe
from script_sources import load_script

SHA = "6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f"
WORK = ROOT / "runtime/analysis/history/findings/q41-embedded-resources/0d964184062b"
KEEP = ROOT / "docs/analysis/evidence/0.119.0/run-level-cap"
START, END = 0x145B44190, 0x145B443C1
BOOT_START, BOOT_END = 0x145AA8A20, 0x145AA8B5B
PATH = r"Interface\FrameXML\ReputationFrame.lua"
SUFFIX = ROOT / "docs/analysis/evidence/0.119.0/run-level-cap.lua"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(path):
    return dict(path=path.relative_to(ROOT).as_posix(), sha256=file_sha256(path))


class Patcher(EquipmentProbe):
    start, end = START, END
    root, chain, read = 0x145DFBCC0, 0x145E6C240, 0x145E6D460
    utf8, format, publish = 0x145F64930, 0x145F66F30, 0x145E6FD70
    cleanup = (0x1400021D0, 0x145F36A30, 0x145F503F0)
    template, cap_at, formatter, cap = 0x1475DACE8, 0x1475DACE4, 0x145F789E0, 99

    def hook(self, _, pc, size, unused):
        if pc == self.stop:
            self.native.emu_stop()
            return
        if self.start <= pc and pc + size <= self.end:
            return
        rcx, rdx, r8, r9 = (self.reg(x) for x in ("RCX", "RDX", "R8", "R9"))
        self.edges.append(hex(pc))
        if pc == self.root:  # supplying-root acquisition; no OS calls execute
            if self.mode == "root-unavailable":
                self.put(rcx, 0xffffffffffffffff)
            else:
                self.output(rcx, "reference-root")
        elif pc == self.chain:  # archive-chain acquisition
            self.put(rcx, 0xffffffffffffffff if self.mode == "chain-unavailable" else 0, 0, 0, 0)
        elif pc == self.read:  # selected file read
            assert self.text(r8, r9) == PATH and r9 == 38
            if self.mode == "file-unavailable":
                self.put(rcx, 0xffffffffffffffff, self.alloc(8), 0)
            else:
                self.output(rcx, self.original)
        elif pc == self.utf8:  # the selected String::from_utf8_lossy interface
            text = self.text(rdx, r8)
            raw = text.encode()
            pointer = self.alloc(len(raw) + 1)
            self.native.mem_write(pointer, raw)
            self.put(rcx, 0, pointer, len(raw))
        elif pc == self.format:  # shared format engine is an explicit seam
            assert rdx == self.template
            assert self.q(r8 + 8) == 0x1400020C0
            assert self.q(r8 + 16) == self.cap_at
            assert self.q(r8 + 24) == self.formatter
            value = struct.unpack("<I", self.native.mem_read(self.q(r8 + 16), 4))[0]
            assert value == self.cap
            self.output(rcx, self.pair(self.q(r8)) + self.suffix)
        elif pc == self.publish:  # replacement publication, without touching a file
            assert self.text(rcx, rdx) == PATH and rdx == 38
            self.published.append(self.text(self.q(r8 + 8), self.q(r8 + 16)))
        elif pc in self.cleanup:
            pass  # deallocation / diagnostic reporting seams
        else:
            raise AssertionError(f"Unreviewed native call {pc:#x}")
        sp = self.reg("RSP")
        self.reg("RIP", self.q(sp))
        self.reg("RSP", sp + 8)

    def run(self, original, mode, suffix):
        self.mode, self.original, self.suffix = mode, original, suffix
        self.published, self.edges = [], []
        self.invoke(self.start)
        expected = [original + suffix] if mode == "available" else []
        assert self.published == expected
        return dict(mode=mode, original_sha256=digest(original.encode()),
                    publications=len(self.published), edges=self.edges)


class CurrentPatcher(Patcher):
    start, end = 0x145BA54D0, 0x145BA5701
    root, chain, read = 0x145EC8320, 0x145F3F790, 0x145F409B0
    utf8, format, publish = 0x146031E70, 0x146034470, 0x145F432C0
    cleanup = (0x1400021D0, 0x146003F70, 0x14601D930)
    template, cap_at, formatter, cap = 0x14707F7D8, 0x14707F7D4, 0x146045F20, 120


class XpCapProbe(EquipmentProbe):
    """Original XP admission/arithmetic; level side effects are an explicit seam."""
    def hook(self, _, pc, size, unused):
        if pc == 0x145C2BD2B:
            self.reg("RIP", self.DONE)
        elif pc == 0x145C2B5B8:
            # Native level/XP/pending writes have executed. Stat refresh, log,
            # healing and object fields are outside this bounded cap question.
            self.reg("RIP", 0x145C2B534)
        elif pc == 0x14606176F:
            value = struct.unpack("<f", struct.pack("<I", self.reg("XMM0") & 0xffffffff))[0]
            self.reg("XMM0", struct.unpack("<I", struct.pack("<f", float(math.floor(value + .5))))[0])
            sp = self.reg("RSP")
            self.reg("RIP", self.q(sp)); self.reg("RSP", sp + 8)
        else:
            assert 0x145C2B460 <= pc < 0x145C2B5B8, hex(pc)

    def run(self, level, xp, amount):
        state = self.alloc(0x1000)
        self.native.mem_write(state + 0x530, struct.pack("<II", level, xp))
        self.invoke(0x145C2B460, rcx=state, rdx=amount)
        got = tuple(struct.unpack("<I", self.native.mem_read(state + at, 4))[0]
                    for at in (0x530, 0x534, 0xcd4))
        expected_level, expected_xp, pending = level, (xp + amount) & 0xffffffff, 0
        while expected_level < 120:
            required = xp_required(expected_level)
            if expected_xp < required:
                break
            expected_xp -= required; expected_level += 1; pending += 1
        assert got == (expected_level, expected_xp, pending), (level, xp, amount, got)
        return dict(level=level, xp=xp, amount=amount, result=list(got))


class RecipientCapProbe(EquipmentProbe):
    def hook(self, _, pc, size, unused):
        if pc == 0x145B52B25:
            self.reg("RIP", 0x145B52DC9)
        elif pc == 0x145B52DCC:
            self.reg("RIP", self.DONE)
        else:
            assert 0x145B52B13 <= pc < 0x145B52B25 or pc == 0x145B52DC9, hex(pc)

    def run(self, level):
        source, output = self.alloc(0xd0), self.alloc(4)
        self.native.mem_write(source + 0x9c, struct.pack("<I", level))
        self.reg("R13", source); self.reg("RBP", output - 0x4c)
        self.invoke(0x145B52B13)
        got = struct.unpack("<I", self.native.mem_read(output, 4))[0]
        assert got == min(level, 120)
        return dict(level=level, result=got)


class ChoiceAdmissionProbe(EquipmentProbe):
    def hook(self, _, pc, size, unused):
        if pc == 0x145C2BF14:
            self.reg("RIP", self.DONE)
        elif pc == 0x145C8E970:
            assert self.reg("RCX") == self.state and self.reg("RDX") == 0
            assert self.reg("R8") & 255 == 1
            self.admitted += 1
            sp = self.reg("RSP")
            self.reg("RIP", self.q(sp)); self.reg("RSP", sp + 8)
        else:
            assert 0x145C2BEDA <= pc < 0x145C2BF14, hex(pc)

    def run(self, level, pending, store, spend):
        self.state, self.admitted = self.alloc(0x1000), 0
        self.native.mem_write(self.state + 0x530, struct.pack("<I", level))
        self.native.mem_write(self.state + 0xcd4, struct.pack("<I", pending))
        self.native.mem_write(self.state + 0xd74, bytes([store, spend]))
        self.native.mem_write(self.state + 0xd83, b"\x01")
        self.reg("RSI", self.state)
        self.invoke(0x145C2BEDA)
        assert self.admitted == int(pending != 0 and (not store or spend))
        return dict(level=level, pending=pending, store=store, spend=spend, admitted=self.admitted)


def xp_required(level):
    def f32(value):
        return struct.unpack("<f", struct.pack("<f", value))[0]
    n = f32(max(level - 1, 0))
    quadratic = f32(f32(f32(.35) * n) * n)
    linear = f32(f32(n * 4.) + 5.)
    return math.floor(f32(quadratic + linear) + .5)


def check_current(args, target):
    assert target["version"] == "0.127.0"
    assert target["sha256"] == "3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb"
    keep = ROOT / "docs/analysis/evidence/0.127.0/run-level-cap"
    work = ROOT / "runtime/analysis/history/progression/level-cap/2f947655c618"
    suffix_path = keep.with_suffix(".lua")
    image = target_bytes(target)
    pe = load_script("levelcap_current_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    def raw(address, count):
        at = pe.rva_offset(address - pe.image_base)
        assert pe.rva_offset(address - pe.image_base + count - 1) == at + count - 1
        return image[at:at + count]
    template = raw(CurrentPatcher.template, 83)
    assert template[:2] == b"\xc0L" and template[78:] == b"\xc0\x02;\n\0"
    assert raw(CurrentPatcher.cap_at, 4) == struct.pack("<I", 120)
    suffix = template[2:78].decode() + "120" + template[80:82].decode()
    assert suffix_path.read_text() == suffix
    assert raw(0x14707F82B, 38) == PATH.encode()
    extents = {(pe.image_base + a, pe.image_base + b) for a, b, _ in pe.functions()}
    md = Cs(CS_ARCH_X86, CS_MODE_64); md.detail = True
    spans, sites = [], {}
    for role, start, end in (("patcher", CurrentPatcher.start, CurrentPatcher.end),
                             ("xp", 0x145C2B460, 0x145C2BF76),
                             ("recipient", 0x145B528D0, 0x145B5300C),
                             ("choices", 0x145C8E970, 0x145C8FA34),
                             ("bootstrap", 0x145B98130, 0x145B9826B)):
        assert (start, end) in extents
        value = raw(start, end - start); decoded = list(md.disasm(value, start))
        assert sum(i.size for i in decoded) == len(value)
        sites.update({i.address: i for i in decoded})
        asm = "\n".join(f"{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                        for i in decoded) + "\n"
        path = keep / (role + ".asm")
        if args.write:
            keep.mkdir(parents=True, exist_ok=True); path.write_text(asm)
        else:
            assert path.read_text() == asm
        spans.append(dict(role=role, start=hex(start), end_exclusive=hex(end),
                          sha256=digest(value), assembly=receipt(path)))
    assert sites[0x145B981C8].op_str == hex(CurrentPatcher.start)
    assert sites[0x145C2B58E].op_str == "r12d, 0x77" and sites[0x145C2B592].mnemonic == "ja"
    assert sites[0x145B52B13].op_str == "ecx, dword ptr [r13 + 0x9c]"
    assert sites[0x145B52B1A].op_str == "ecx, 0x78"
    assert sites[0x145B52B1D].op_str == "eax, 0x78"
    assert sites[0x145B52DC9].op_str == "dword ptr [rbp + 0x4c], eax"
    assert sites[0x145C2BF0A].op_str == "edx, edx" and sites[0x145C2BF0C].op_str == "r8b, 1"
    assert sites[0x145C2BF0F].op_str == "0x145c8e970"
    assert sites[0x145C8E9DE].op_str == "0x145c8e9ee"  # earned mode0 to class pool
    assert sites[0x145C8F57E].op_str == "dword ptr [rbp + 0xb8], 0x19"  # empty-pool gold card
    assert sites[0x145C8F5D2].op_str == "r8d, 0xa0" and sites[0x145C8F5DD].op_str.endswith(", 1")
    assert sites[0x145C8F89C].op_str == "byte ptr [rdi + 0xd83], 2"
    assert sites[0x145C8F939].op_str == "0x145c90b10"
    for address, instruction in sites.items():
        if 0x145C8E970 <= address < 0x145C8FA34:
            assert "0x530" not in instruction.op_str  # no direct run-level read/rejection
    census_path = ROOT / "docs/analysis/coverage/full-image-declared-0.127.0.json"
    census = load_json(census_path); assert census["target"]["sha256"] == target["sha256"]
    bodies_path = ROOT / census["artifacts"]["directory"] / "bodies.tsv.gz"
    assert file_sha256(bodies_path) == census["artifacts"]["files"]["bodies.tsv.gz"]["sha256"]
    with gzip.open(bodies_path, "rt") as stream:
        assert stream.readline().strip() == "entry\tname\tstart\tend\texternal"
        body_rows = [line.rstrip().split("\t") for line in stream if line.startswith("145c8e970\t")]
    assert body_rows and body_rows[0][2] == "145c8e970" and body_rows[-1][3] == "145c8fa33"
    choice_inventory = dict(census=receipt(census_path), bodies=receipt(bodies_path), rows=body_rows,
                            role="retained current Ghidra flow body; original-byte branch/argument review, no fresh query")
    # The skipped scalar clamps preserve the selected EAX until its output store.
    for address, instruction in sites.items():
        if 0x145B52B25 <= address < 0x145B52DC9:
            assert not {"eax", "rax", "ax", "al", "ah"}.intersection(
                instruction.reg_name(register) for register in instruction.regs_access()[1])
    queries = []
    for role, directory in (("patcher", work / "rea-145ba54d0"),
                            ("xp", work / "rea-145c2b460"),
                            ("recipient", work / "validation/rea-145b528d0")):
        state = json.loads((directory / "journal.json").read_text())
        assert state["status"] == "completed"
        operation = next(iter(state["operations"].values()))
        assert operation["status"] == "completed"
        result = ROOT / operation["result"]["path"]
        assert file_sha256(result) == operation["result"]["sha256"]
        evidence = json.loads(result.read_text())["structuredContent"]
        span = next(s for s in spans if s["role"] == role)
        assert state["identity"]["target"]["sha256"] == span["sha256"]
        assert evidence["subject"]["digest"]["sha256"] == span["sha256"]
        path = keep / (role + ".c")
        text = "\n".join(line.rstrip() for line in evidence["raw_result"]["value"]["pseudocode"].splitlines()).rstrip() + "\n"
        if args.write: path.write_text(text)
        else: assert path.read_text() == text
        queries.append(dict(role=role, evidence_id=evidence["evidence_id"],
                            profile=evidence["analysis_profile"]["digest"],
                            result=receipt(result), journal=receipt(directory / "journal.json"),
                            plan=receipt(directory / "plan.json"), pseudocode=receipt(path)))
    patcher = CurrentPatcher(image, pe, [(CurrentPatcher.start, CurrentPatcher.end)])
    patch_cases = [patcher.run(original, mode, suffix)
                   for original in ("", "MAX_PLAYER_LEVEL = 60;\n", "-- 世界\nMAX_PLAYER_LEVEL = 60;\n")
                   for mode in ("available", "root-unavailable", "chain-unavailable", "file-unavailable")]
    xp = XpCapProbe(image, pe, [(0x145C2B460, 0x145C2BF76)])
    xp_cases = [xp.run(level, initial, amount) for level in (1, 98, 99, 100, 118, 119, 120, 121)
                for initial, amount in ((0, 0), (0, xp_required(level)-1), (0, xp_required(level)),
                                        (0, xp_required(level)+1), (0, 0xffffffff), (0xffffffff, 1))]
    recipient = RecipientCapProbe(image, pe, [(0x145B528D0, 0x145B5300C)])
    recipient_cases = [recipient.run(level) for level in (0, 98, 99, 100, 119, 120, 121, 0xffffffff)]
    admission = ChoiceAdmissionProbe(image, pe, [(0x145C2B460, 0x145C2BF76)])
    admission_cases = [admission.run(level, pending, store, spend)
                       for level in (99, 119, 120) for pending in (0, 2)
                       for store, spend in ((0, 0), (1, 0), (1, 1))]
    mechanics = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics.rs").read_text()
    progression = (ROOT / "crates/azeroth-survivors-re/src/run_progression.rs").read_text()
    state = (ROOT / "crates/azeroth-survivors-re/src/coop/client_state.rs").read_text()
    assert "pub const RUN_LEVEL_CAP: u32 = 120;" in progression
    assert "while self.level < RUN_LEVEL_CAP && self.xp >= self.xp_required()" in mechanics
    assert "self.pending_levels = self.pending_levels.wrapping_add(1)" in mechanics
    assert "state.word_6c.min(crate::run_progression::RUN_LEVEL_CAP)" in state
    choices = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/choices.rs").read_text()
    assert "self.pending_levels == 0" in choices and "RUN_LEVEL_CAP" not in choices
    endless = (ROOT / "crates/azeroth-survivors-re/src/gameplay/mechanics/progression.rs").read_text()
    endless = endless.split("fn continue_hero_endless", 1)[1].split("    ///", 1)[0]
    assert "self.rules.endless = true" in endless and "self.level =" not in endless
    assert "cap120_preserves_final_level_choices_and_stops_new_levels_in_endless" in mechanics
    hud = (ROOT / "crates/azeroth-survivors-re/src/gameplay/client/framexml_hud.rs").read_text()
    assert "evidence/0.127.0/run-level-cap.lua" in hud and "RUN_LEVEL_CAP.into()" in hud
    members = load_script("levelcap_current_members", ROOT / "scripts/inventory-current-mpq-members.py")
    reader = load_script("levelcap_current_mpq", ROOT / "scripts/check-minimap-lifecycle.py")
    resources, archives = [], [(row, reader.Archive(row["path"])) for row in reversed(members.supported_source_order(target))]
    def member(path):
        for row, archive in archives:
            entry = archive.lookup(path)
            if entry is not None:
                value = archive.read(entry)
                resources.append(dict(archive=row["path"], path=path, bytes=len(value), sha256=digest(value)))
                return value
        raise AssertionError(path)
    stock = member(PATH)
    assert b"MAX_PLAYER_LEVEL = 60;" in stock
    assert b"ReputationFrame.xml" in member(r"Interface\FrameXML\FrameXML.toc").splitlines()
    assert b'<Script file="ReputationFrame.lua"/>' in member(r"Interface\FrameXML\ReputationFrame.xml")
    fixture = work / "stock-consumer.lua"; fixture.write_bytes(stock)
    try:
        lua = subprocess.run(["lua", str(ROOT / "scripts/check-run-level-cap.lua"), str(fixture), str(suffix_path), "120"],
                             cwd=ROOT, check=True, capture_output=True, text=True)
    finally: fixture.unlink(missing_ok=True)
    match = re.fullmatch(r"Passed (\d+) stock run-level-cap Lua assertions\n", lua.stdout); assert match, lua.stdout
    result = dict(schema_version=1, target={k: target[k] for k in ("version", "sha256", "size_bytes")},
                  gap_ids=[296], generator=receipt(Path(__file__).resolve()), native_spans=spans, queries=queries,
                  cap=dict(va=hex(CurrentPatcher.cap_at), value=120),
                  template=dict(va=hex(CurrentPatcher.template), bytes=83, sha256=digest(template)),
                  suffix=receipt(suffix_path), patch_cases=patch_cases, xp_cases=xp_cases,
                  recipient_cases=recipient_cases, choice_admission_cases=admission_cases,
                  choice_inventory=choice_inventory, stock_resources=resources,
                  lua_assertions=int(match[1]), lua_harness=receipt(ROOT / "scripts/check-run-level-cap.lua"),
                  limits=["XP probes execute native addition, threshold, cap and earned-level writes; roundf and per-level presentation/stat/heal side effects are explicit seams.",
                          "Recipient probes execute the cap load/unsigned clamp/output store; intervening instructions are checked to preserve EAX. Full validation is not emulated.",
                          "Choice admission probes execute the current pending/phase/store/spend gate and verify mode0+pause arguments; card construction is a seam. Retained current Ghidra body/original assembly establishes final publication without another level gate.",
                          "Raw-function Ghidra pseudocode can omit paths after unknown non-returning helpers; original assembly owns the recipient cap proof.",
                          "Stock Lua executes in two standalone mocked-widget VMs; Rust regressions are authored but unrun. No application compilation, game/client/server execution or parity validation."])
    manifest = keep / "manifest.json"
    if args.write: manifest.write_text(portable_json(result, indent=2) + "\n")
    else: assert portable_record(json.loads(manifest.read_text())) == portable_record(result)
    print(f"PASS: {len(patch_cases)} patcher, {len(xp_cases)} XP, {len(recipient_cases)} recipient, {len(admission_cases)} choice admission native cases; {match[1]} stock Lua assertions; cap120 connected; compilation/parity unverified")


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--write", action="store_true", help="publish reviewed compact evidence")
    ap.add_argument("--queries", action="store_true", help="also verify retained local queries")
    args = ap.parse_args()
    target = latest_target(verify=True)
    if target["version"] == "0.127.0":
        return check_current(args, target)
    assert target["sha256"] == SHA and target["version"] == "0.119.0"
    image = target_bytes(target)
    pe = load_script("levelcap_pe", ROOT / "scripts/inventory-executable.py").PE(image)

    def raw(address, length):
        at = pe.rva_offset(address - pe.image_base)
        assert pe.rva_offset(address - pe.image_base + length - 1) == at + length - 1
        return image[at:at + length]

    template = raw(0x1475DACE8, 83)
    assert template[:2] == b"\xc0L" and template[78:] == b"\xc0\x02;\n\0"
    assert raw(0x1475DACE4, 4) == struct.pack("<I", 99)
    suffix = template[2:78].decode() + "99" + template[80:82].decode()
    assert SUFFIX.read_text() == suffix
    assert raw(0x1475DAD3B, 38) == PATH.encode()
    extents = {(pe.image_base + a, pe.image_base + b) for a, b, _ in pe.functions()}
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    spans, sites = [], {}
    for role, start, end in (("patcher", START, END), ("bootstrap", BOOT_START, BOOT_END)):
        assert (start, end) in extents
        value = raw(start, end - start)
        decoded = list(md.disasm(value, start))
        assert sum(i.size for i in decoded) == len(value)
        sites.update({i.address: i for i in decoded})
        asm = "\n".join(f"{i.address:x} {i.bytes.hex()} {i.mnemonic} {i.op_str}".rstrip()
                         for i in decoded) + "\n"
        path = KEEP / (role + ".asm")
        if args.write:
            KEEP.mkdir(parents=True, exist_ok=True)
            path.write_text(asm)
        else:
            assert path.read_text() == asm
        spans.append(dict(role=role, start=hex(start), end_exclusive=hex(end),
                          sha256=digest(value), assembly=receipt(path), instructions=len(decoded)))
    assert sites[0x145AA8AB8].mnemonic == "call" and sites[0x145AA8AB8].op_str == hex(START)
    # The current formatter's exact u32/radix input prefix is already canonical.
    reused = ROOT / "docs/analysis/evidence/0.119.0/rewards-tabard-localization/contracts.json"
    formatter = next(s for s in json.loads(reused.read_text())["data_spans"]
                     if s["role"] == "u32-ID-read-and-radix-10")
    assert digest(raw(int(formatter["va"], 16), formatter["byte_count"])) == formatter["sha256"]

    queries = []
    for name, start, end in (("reputation", START, END), ("bootstrap", BOOT_START, BOOT_END)):
        journal = WORK / (name + "-query/journal.json")
        if args.write or args.queries:
            state = json.loads(journal.read_text())
            assert state["status"] == "completed"
            assert state["identity"]["target"]["sha256"] == digest(raw(start, end - start))
            op = next(o for o in state["operations"].values()
                      if o["arguments"] == {"procedure": hex(start)})
            assert op["status"] == "completed"
            result = ROOT / op["result"]["path"]
            assert file_sha256(result) == op["result"]["sha256"]
            evidence = json.loads(result.read_text())["structuredContent"]
            assert evidence["subject"]["digest"]["sha256"] == digest(raw(start, end - start))
            c = KEEP / (name + ".c")
            text = "\n".join(line.rstrip() for line in evidence["raw_result"]["value"].splitlines()).rstrip() + "\n"
            if args.write:
                c.write_text(text)
            else:
                assert c.read_text() == text
            queries.append(dict(evidence_id=evidence["evidence_id"],
                                profile=evidence["analysis_profile"]["digest"],
                                result=receipt(result), journal=receipt(journal),
                                plan=receipt(WORK / (name + "-plan.json")), pseudocode=receipt(c)))
    if not queries:
        queries = json.loads((KEEP / "manifest.json").read_text())["queries"]
        for query in queries:
            assert receipt(ROOT / query["pseudocode"]["path"]) == query["pseudocode"]

    source = ROOT / "crates/azeroth-survivors-re/src/gameplay/client/framexml_hud.rs"
    text = source.read_text()
    assert 'run-level-cap.lua' in text and 'RUN_LEVEL_CAP.into()' in text and PATH in text
    client = ROOT / "crates/azeroth-survivors-re/src/gameplay/client.rs"
    assert 'framexml_appends.splice(0..0, framexml_hud::appends())' in client.read_text()
    manifest = ROOT / "crates/benilla-app/src/ui_script/manifest.rs"
    assert 'load_files_into_with_appends' in manifest.read_text()
    lifecycle = ROOT / "crates/benilla-app/src/ui_script/lifecycle.rs"
    assert 'extension.framexml_appends.clone()' in lifecycle.read_text()

    probe = Patcher(image, pe, [(START, END)])
    cases = [probe.run(s, mode, suffix) for s in ("", "MAX_PLAYER_LEVEL = 60;\n", "-- 世界\nMAX_PLAYER_LEVEL = 60;\n")
             for mode in ("available", "root-unavailable", "chain-unavailable", "file-unavailable")]
    members = load_script("levelcap_members", ROOT / "scripts/inventory-current-mpq-members.py")
    reader = load_script("levelcap_mpq", ROOT / "scripts/check-minimap-lifecycle.py")
    verify_resources(target)
    archives = [(row, reader.Archive(row["path"]))
                for row in reversed(members.supported_source_order(target))]
    resources = []

    def member(path):
        for row, mpq in archives:
            entry = mpq.lookup(path)
            if entry is not None:
                value = mpq.read(entry)
                resources.append(dict(archive=row["path"], archive_sha256=row["sha256"],
                                      path=path, bytes=len(value), sha256=digest(value)))
                return value
        raise AssertionError("Installed stock resource unavailable: " + path)

    stock = member(PATH)
    toc = member(r"Interface\FrameXML\FrameXML.toc")
    xml = member(r"Interface\FrameXML\ReputationFrame.xml")
    assert b"ReputationFrame.xml" in toc.splitlines()
    assert b'<Script file="ReputationFrame.lua"/>' in xml
    assert b"MAX_PLAYER_LEVEL = 60;" in stock
    assert stock.count(b"MAX_PLAYER_LEVEL") == 4
    WORK.mkdir(parents=True, exist_ok=True)
    fixture = WORK / "stock-consumer.lua"
    fixture.write_bytes(stock)
    try:
        lua = subprocess.run(["lua", str(ROOT / "scripts/check-run-level-cap.lua"), str(fixture), str(SUFFIX)],
                             cwd=ROOT, check=True, capture_output=True, text=True)
    finally:
        fixture.unlink(missing_ok=True)
    match = re.fullmatch(r"Passed (\d+) stock run-level-cap Lua assertions\n", lua.stdout)
    assert match, lua.stdout
    result = dict(schema_version=1, target={k: target[k] for k in ("version", "sha256", "size_bytes")},
                  gap_ids=[41, 181], lead_ids=["Q41-I01:resource_path:219", "Q41-B02", "Q41-R01"],
                  generator=receipt(Path(__file__).resolve()), native_spans=spans, queries=queries,
                  template=dict(va="0x1475dace8", byte_count=83, sha256=digest(template)),
                  cap=dict(va="0x1475dace4", type="u32", value=99), suffix=receipt(SUFFIX),
                  reused_formatter=receipt(reused), native_instruction_cases=cases,
                  stock_resources=resources,
                  interpreted_lua=dict(harness=receipt(ROOT / "scripts/check-run-level-cap.lua"),
                                       assertions=int(match[1]), fresh_vms=2),
                  source=[receipt(p) for p in (source, client, manifest, lifecycle)],
                  limits=["Full original patcher instructions run only in synthetic memory; filesystem/chain, UTF-8, shared formatting/allocation, diagnostics and publication are explicit seams.",
                          "Original stock Lua consumers run in standalone mocked-widget VMs; no compiled Rust, real core loader, addons, game/client/server/network execution or rendering occurs.",
                          "The current integer formatter input prefix is reused without duplicating its canonical evidence or reconstructing the surrounding generic engine.",
                          "This repair affects the client UI cap only; it does not change gameplay progression or establish whole-image recovery or original/rebuilt parity."])
    if args.write:
        (KEEP / "manifest.json").write_text(portable_json(result, indent=2) + "\n")
    else:
        assert portable_record(json.loads((KEEP / "manifest.json").read_text())) == portable_record(result)
    print(f"PASS: 12 bounded native cases; {match[1]} stock Lua assertions; AS cap99 core append connected; runtime/parity unverified")


if __name__ == "__main__":
    main()
