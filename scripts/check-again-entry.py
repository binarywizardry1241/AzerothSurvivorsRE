#!/usr/bin/env python3
"""Verify bounded Again Config ownership and its source consumers, without compiling."""
from portable_paths import portable_json
import argparse
import hashlib
import json
from pathlib import Path
import platform
import re
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

PROOF = Path("docs/analysis/evidence/0.121.0/again-entry.json")
SOURCE = "crates/azeroth-survivors-re/src/"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def compact(text):
    return re.sub(r"\s+", "", text)


def block(text, start):
    """Return a source block whose closing brace has the signature's indent."""
    offset = text.index(start)
    indent = re.match(r" *", text[text.rfind("\n", 0, offset) + 1:]).group()
    end = text.index("\n" + indent + "}", offset) + len(indent) + 2
    return text[offset:end]


def source_checks(source_root):
    main = (source_root / SOURCE / "gameplay/mod.rs").read_text()
    terminal = (source_root / SOURCE / "gameplay/terminal.rs").read_text()
    helper = block(main, "fn prepare_entry_loadout(")
    fresh = block(helper, "if !retain {")
    assert "starting_gear:[u32;19]," in compact(main)
    assert "starting_stars:[u8;19]," in compact(main)
    assert "starting_weapon_glow:u32," in compact(main)
    assert "save:&crate::save::Save" in compact(helper)
    assert "letretain=self.solo_again&&heroic_restart_rank.is_some();" in compact(helper)
    assert helper.index("let retain =") < helper.index("self.solo_again = false;")
    assert helper.index("Records::read(save.plaintext().lines())") < helper.index("if !retain")
    captures = ["self.starting_gear =", "self.starting_stars =",
                "self.starting_weapon_glow =", "self.starting_gear_effects =", "self.starting_pity ="]
    assert all(helper.count(value) == fresh.count(value) == 1 for value in captures)
    assert "letgear=crate::armory::GearSave::read_for(save,class,race);" in compact(fresh)
    assert "gear.equipped.get(&(class,slot)).copied().unwrap_or(0)" in compact(fresh)
    assert "self.starting_stars=self.starting_gear.map(|id|gear.stars(id));" in compact(fresh)
    assert "self.starting_weapon_glow=save.weapon_glow(class);" in compact(fresh)
    assert "self.starting_gear_effects=gear.effects(armory,class);" in compact(fresh)
    assert "records.pity.into_iter().filter(|(id,_)|{" in compact(fresh)
    assert "crate::save::gear::decode(*id).is_some_and(|piece|piece.class==class)" in compact(fresh)
    assert helper.rstrip().endswith("records.owned\n    }")
    assert "self.talent_allocation" not in helper
    entry = block(main, "fn enter(")
    call = """let entry_owned = session.prepare_entry_loadout(&armory, &menu.backend_save,
                pick.hero.class, pick.hero.race, menu.heroic_restart_rank);"""
    assert compact(call) in compact(entry)
    assert "game.configure_armor_set(session.starting_gear,session.starting_stars);" in compact(entry)
    assert "game.set_equipment_pity(&session.starting_pity);" in compact(entry)
    assert "&session.starting_gear_effects," in compact(entry)
    assert "session.starting_weapon_glow=" not in compact(entry)
    flag = """session.solo_again = action == TerminalAction::Again
            && session.mechanics.as_ref().is_some_and(|game| !game.has_party());"""
    assert compact(flag) in compact(terminal)
    assert terminal.index("session.solo_again =") < terminal.index("super::persist_run(game")
    assert terminal.index("session.solo_again =") < terminal.index("session.mechanics = None;")
    # These fragments bind only the new owned knowledge, not whole shared files.
    fragments = [
        ("gameplay/mod.rs", "nineteen-id-field", "starting_gear: [u32; 19],"),
        ("gameplay/mod.rs", "nineteen-star-field", "starting_stars: [u8; 19],"),
        ("gameplay/mod.rs", "chosen-glow-field", "starting_weapon_glow: u32,"),
        ("gameplay/mod.rs", "retain-selection", "let retain = self.solo_again && heroic_restart_rank.is_some();"),
        ("gameplay/mod.rs", "consume-selection", "self.solo_again = false;"),
        ("gameplay/mod.rs", "fresh-readonly-gear", "let gear = crate::armory::GearSave::read_for(save, class, race);"),
        ("gameplay/mod.rs", "nineteen-id-capture", """self.starting_gear = std::array::from_fn(|slot| {
                gear.equipped.get(&(class, slot)).copied().unwrap_or(0)
            });"""),
        ("gameplay/mod.rs", "star-capture", "self.starting_stars = self.starting_gear.map(|id| gear.stars(id));"),
        ("gameplay/mod.rs", "chosen-glow-capture", "self.starting_weapon_glow = save.weapon_glow(class);"),
        ("gameplay/mod.rs", "derived-effect-capture", "self.starting_gear_effects = gear.effects(armory, class);"),
        ("gameplay/mod.rs", "class-pity-capture", """self.starting_pity = records.pity.into_iter().filter(|(id, _)| {
                crate::save::gear::decode(*id).is_some_and(|piece| piece.class == class)
            }).collect();"""),
        ("gameplay/mod.rs", "entry-loadout-call", call),
        ("gameplay/mod.rs", "frozen-gear-consumer", "game.configure_armor_set(session.starting_gear, session.starting_stars);"),
        ("gameplay/mod.rs", "frozen-pity-consumer", "game.set_equipment_pity(&session.starting_pity);"),
        ("gameplay/mod.rs", "frozen-effects-consumer", "&session.starting_gear_effects,"),
        ("gameplay/terminal.rs", "solo-again-before-drop", flag),
    ]
    result = []
    for path, role, text in fragments:
        actual = main if path == "gameplay/mod.rs" else terminal
        assert compact(text) in compact(actual), role
        result.append(dict(path=SOURCE + path, role=role, fragment=text,
                           normalized_sha256=sha(compact(text).encode())))
    host = {("Darwin", "arm64"): "aarch64-apple-darwin",
            ("Linux", "x86_64"): "x86_64-unknown-linux-gnu"}
    rustfmt = ROOT / ".tools/rust" / ("1.98.1-" + host[(platform.system(), platform.machine())]) / "bin/rustfmt"
    for path in ("gameplay/mod.rs", "gameplay/terminal.rs"):
        parsed = subprocess.run([str(rustfmt), "--edition", "2024", "--emit", "stdout",
                                 "--config", "skip_children=true"],
                                input=(source_root / SOURCE / path).read_text(), text=True,
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, (path, parsed.stderr)
    return result


def canonical_ranges(proof, evidence_root, image, pe, decoder):
    """Verify referenced ranges in their canonical manifests without copying them."""
    ranges = instructions_checked = 0
    for selector in proof["canonical_retained_ranges"]:
        path = evidence_root / selector["manifest"]
        if not path.exists(): path = ROOT / selector["manifest"]
        manifest = json.loads(path.read_text())
        assert manifest["target"] == proof["target"]
        by_role = {row["role"]: row for row in manifest["native_ranges"]}
        for role in selector["roles"]:
            row = by_role[role]
            start = int(row["virtual_address"], 16)
            offset = pe.rva_offset(start - pe.image_base)
            assert offset == int(row["file_offset"], 16), role
            assert pe.rva_offset(start + row["byte_count"] - 1 - pe.image_base) == offset + row["byte_count"] - 1
            raw = image[offset:offset + row["byte_count"]]
            assert sha(raw) == row["sha256"] and raw.hex() == row["bytes_hex"], role
            instructions = list(decoder.disasm(raw, start))
            assert sum(item.size for item in instructions) == row["byte_count"], role
            assert len(instructions) == row["instruction_count"], role
            if "assembly" in row:
                receipt = row["assembly"]
                assembly = ROOT / (receipt["path"] if isinstance(receipt, dict) else receipt)
                text = "".join(f"{item.address:016x} {item.bytes.hex():<30} {item.mnemonic} {item.op_str}".rstrip() + "\n"
                               for item in instructions)
                assert assembly.read_text() == text
                if isinstance(receipt, dict): assert sha(assembly.read_bytes()) == receipt["sha256"]
            ranges += 1
            instructions_checked += len(instructions)
    return ranges, instructions_checked


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-root", type=Path, default=ROOT)
    parser.add_argument("--evidence-root", type=Path, default=ROOT,
                        help="Optional candidate evidence tree; missing manifests use the primary checkout")
    parser.add_argument("--write", action="store_true", help="Refresh checked range boundaries and owned source fragment receipts")
    args = parser.parse_args()
    proof = json.loads((ROOT / PROOF).read_text())
    selected = latest_target(verify=True)
    assert proof["target"] == {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    image = target_bytes(selected)
    pe = load_script("again_entry_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    for query in proof["queries"]:
        for key in ("plan", "journal", "result", "raw_input"):
            assert sha((ROOT / query[key]["path"]).read_bytes()) == query[key]["sha256"]
        response = json.loads((ROOT / query["result"]["path"]).read_text())
        native = response.get("structuredContent") or json.loads(response["content"][0]["text"])
        assert sha(native["normalized_result"].encode()) == query["normalized_text_sha256"]
        verify_native_query_subject(ROOT, native, query, proof["target"], image=image, pe=pe)
    for row in proof["native_selectors"]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        assert end - start == row["byte_count"]
        offset = pe.rva_offset(start - pe.image_base)
        assert offset == int(row["file_offset"], 16)
        assert pe.rva_offset(end - 1 - pe.image_base) == offset + row["byte_count"] - 1
        raw = image[offset:offset + row["byte_count"]]
        assert sha(raw) == row["sha256"]
        instructions = list(decoder.disasm(raw, start))
        assert sum(item.size for item in instructions) == row["byte_count"]
        if args.write: row["instruction_count"] = len(instructions)
        else: assert row["instruction_count"] == len(instructions)
    for selector in proof["retained_selectors"]:
        path = args.evidence_root / selector["manifest"]
        if not path.exists(): path = ROOT / selector["manifest"]
        retained = json.loads(path.read_text())
        assert retained["target"] == proof["target"], selector["manifest"]
        procedures = {row.get("procedure") for row in retained["queries"]}
        assert set(selector["procedures"]) <= procedures, selector["manifest"]
    referenced_ranges, referenced_instructions = canonical_ranges(proof, args.evidence_root, image, pe, decoder)
    fragments = source_checks(args.source_root.resolve())
    if args.write: proof["source_bindings"] = fragments
    else: assert proof["source_bindings"] == fragments
    if args.write: (ROOT / PROOF).write_text(portable_json(proof, indent=2) + "\n")
    print(json.dumps(dict(target=proof["target"]["version"], new_queries=len(proof["queries"]),
                         native_ranges=len(proof["native_selectors"]),
                         instruction_boundaries=sum(row["instruction_count"] for row in proof["native_selectors"]),
                         canonical_range_references=referenced_ranges, canonical_decoded_instructions=referenced_instructions,
                         retained_manifests=len(proof["retained_selectors"]), owned_source_fragments=len(fragments),
                         syntax_parses=2, target_executed=False, compilation="not_run", parity="unverified"), indent=2))


if __name__ == "__main__":
    main()
