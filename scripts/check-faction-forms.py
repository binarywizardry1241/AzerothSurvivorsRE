#!/usr/bin/env python3
"""Replay the unchanged 0.120.0 form selector and display-field boundary.

Requires existing Unicorn/Capstone Python packages. No compilation, game,
network or renderer runs. The descriptor-map insertion calls are recorded seams;
the source comparison interprets this small selector's checked syntax, not Rust.
"""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import re
import struct

from capstone import Cs, CS_ARCH_X86, CS_MODE_64
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
import unicorn.x86_const as reg

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

HERE = ROOT / "docs/analysis/evidence/0.120.0/faction-forms"
RETAINED = ROOT / "docs/analysis/evidence/0.120.0/race-unlocks"
SHA = "291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08"
START, STOP = 0x145B7BA7D, 0x145B7BBDE
TABLE = 0x1475F7A04


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def source_projection():
    source = (ROOT / "crates/azeroth-survivors-re/src/run_effects/forms.rs").read_text()
    function = source.split("pub fn display_override", 1)[1].split("#[cfg(test)]", 1)[0]
    # Reject an unreviewed change to iteration, tags, selection or return shape.
    pattern = r"""\(effects: &\[EffectRow\], race: u8\) -> Option<u32> \{
        let horde = matches!\(race, (?P<races>[\d |]+)\);
        effects\.iter\(\)\.find_map\(\|row\| \{
            if row\.tag\(\) != (?P<tag>\d+) \{ return None; \}
            match row\.word\((?P<offset>\d+)\) \{
                (?P<bear>\d+) => Some\(if horde \{ (?P<hb>\d+) \} else \{ (?P<ab>\d+) \}\),
                (?P<cat>\d+) => Some\(if horde \{ (?P<hc>\d+) \} else \{ (?P<ac>\d+) \}\),
                _ => None,
            \}
        \}\)
    \}"""
    compact = lambda text: re.sub(r"\s+", "", text)
    match = re.fullmatch(compact(pattern), compact(function))
    assert match, "Form source shape changed; review its native correspondence"
    values = match.groupdict()
    races = {int(value.strip()) for value in values.pop("races").split("|")}
    values = {key: int(value) for key, value in values.items()}
    assert values["offset"] == 4

    def select(rows, race):
        family = "h" if race in races else "a"
        for tag, spell in rows:
            if tag == values["tag"]:
                if spell == values["bear"]:
                    return values[family + "b"]
                if spell == values["cat"]:
                    return values[family + "c"]
        return None

    return select


def source_connections():
    guards = {
        "crates/azeroth-survivors-re/src/gameplay/mod.rs": ["native_race: hero.race,"],
        "crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs": [
            "run_effects::forms::display_override(&self.effect_state.equipped.rows, self.stats.native_race)"],
        "crates/azeroth-survivors-re/src/gameplay/client.rs": [
            "let current_display = game.player_form_display().unwrap_or(display_id);",
            "fields: ObjectFields::from_pairs(&[(131, current_display)])",
            "state.player_display = None;"],
        "crates/azeroth-survivors-re/src/gameplay/coop.rs": [
            "let mut fields = local_player_fields(player);",
            "131,\n        game.player_form_display().unwrap_or(player.display_id),"],
        "crates/benilla-app/src/local_client/player.rs": [
            "(131, player.display_id),\n        (132, player.display_id),"],
    }
    receipts = []
    for path, fragments in guards.items():
        text = (ROOT / path).read_text()
        for fragment in fragments:
            assert fragment in text, (path, fragment)
        receipts.append(dict(path=path, fragments=fragments,
                             fragment_sha256=digest("\n".join(fragments).encode())))
    return receipts


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write-proof", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA, "Current target changed; reassess this contract"
    image = target_bytes(target)
    pe = load_script("form_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    manifest = json.loads((RETAINED / "manifest.json").read_text())
    assert manifest["target"]["sha256"] == SHA
    ranges = [row for row in manifest["native_ranges"] if row["role"] in
              ("faction-form-selector", "alliance-cat-return")]
    assert len(ranges) == 2
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    for row in ranges:
        start = int(row["va"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        raw = image[offset:offset + row["byte_count"]]
        assert offset == int(row["file_offset"], 16) and digest(raw) == row["sha256"]
        assembly = "\n".join(f"{i.address:016x}  {i.bytes.hex():22s} {i.mnemonic} {i.op_str}".rstrip()
                             for i in md.disasm(raw, start)) + "\n"
        assert digest(assembly.encode()) == row["assembly"]["sha256"]
        assert (ROOT / row["assembly"]["path"]).read_text() == assembly

    table_offset = pe.rva_offset(TABLE - pe.image_base)
    table_bytes = image[table_offset:table_offset + 56]
    female, male = struct.unpack("<7I", table_bytes[:28]), struct.unpack("<7I", table_bytes[28:])
    cpu = Uc(UC_ARCH_X86, UC_MODE_64)
    for address in (START & ~4095, TABLE & ~4095):
        cpu.mem_map(address, 4096)
        offset = pe.rva_offset(address - pe.image_base)
        cpu.mem_write(address, image[offset:offset + 4096])
    heap = 0x200000000
    cpu.mem_map(heap, 0x10000)
    fields = []

    def hook(machine, pc, size, unused):
        assert any(int(row["va"], 16) <= pc < int(row["end_va"], 16) for row in ranges), hex(pc)
        if pc in (0x145B7BB92, 0x145B7BBD9):
            fields.append((machine.reg_read(reg.UC_X86_REG_RDX) & 0xFFFF,
                           machine.reg_read(reg.UC_X86_REG_R8) & 0xFFFFFFFF))
            machine.reg_write(reg.UC_X86_REG_RIP, pc + size)

    cpu.hook_add(UC_HOOK_CODE, hook)
    vectors = json.loads((HERE / "vectors.json").read_text())
    assert vectors["target_sha256"] == SHA
    project = source_projection()
    count = 0
    for race, sex, case in itertools.product(range(256), (0, 1, 2, 255), vectors["cases"]):
        rows = case["rows"]
        fields.clear()
        cpu.mem_write(heap + 0x848, struct.pack("<QQ", heap + 0x2000, len(rows)))
        for index, (tag, spell) in enumerate(rows):
            cpu.mem_write(heap + 0x2000 + index * 64, struct.pack("<B3xI", tag, spell))
        for register, value in ((reg.UC_X86_REG_RDI, heap), (reg.UC_X86_REG_RSI, race),
                                (reg.UC_X86_REG_R12, race), (reg.UC_X86_REG_R15, sex),
                                (reg.UC_X86_REG_RBP, heap + 0x4000)):
            cpu.reg_write(register, value)
        cpu.emu_start(START, STOP, count=1000)
        assert cpu.reg_read(reg.UC_X86_REG_RIP) == STOP
        family = "horde_display" if race in vectors["horde_races"] else "other_display"
        form = case[family]
        body = (female if sex else male)[race - 2] if 2 <= race <= 8 else (50 if sex else 49)
        assert fields == [(131, body if form is None else form), (132, body)], (race, sex, rows, fields)
        assert project(rows, race) == form, (race, rows)
        count += 1
    proof = dict(target=dict(version=target["version"], sha256=SHA), gap_ids=[190, 41],
                 native_manifest="docs/analysis/evidence/0.120.0/race-unlocks/manifest.json",
                 native_roles=[row["role"] for row in ranges],
                 body_tables=dict(va=hex(TABLE), file_offset=hex(table_offset), byte_count=56,
                                  sha256=digest(table_bytes), female=list(female), male=list(male)),
                 vectors_sha256=digest((HERE / "vectors.json").read_bytes()),
                 source_sha256=digest((ROOT / "crates/azeroth-survivors-re/src/run_effects/forms.rs").read_bytes()),
                 source_connections=source_connections(), native_cases=count,
                 source_projection_cases=count // 4,
                 limits=["Explicit composed effect rows, race/sex registers and descriptor-map insertion seam.",
                         "Source selector projection and connection fragments do not execute Rust or the client.",
                         "No compilation, game/network/server/model/animation/rendering or parity validation."])
    if args.write_proof:
        (HERE / "proof.json").write_text(json.dumps(proof, indent=2) + "\n")
    else:
        assert json.loads((HERE / "proof.json").read_text()) == proof, "Proof changed; review before replacing"
    print(f"PASS {count} native display-field cases; {count // 4} source selector projections; "
          "compilation/runtime/parity unverified")


if __name__ == "__main__":
    main()
