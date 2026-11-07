#!/usr/bin/env python3
"""Verify Fire Nova cast-event alias and configured DBC/resource route.

Reads the installed reference in place; no asset exports, compilation, native
instruction execution or client/game/server operation.
"""

from script_sources import current_path, recorded_input_matches
import hashlib
import json
import platform
import re
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes, project_path, verify_resources
from discovery_native_subject import verify_native_query_subject
from script_sources import load_script

BASE = ROOT / "docs/analysis/evidence/fire-nova"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def receipt(row):
    path = current_path(project_path(row["path"]))
    assert recorded_input_matches(path, row['sha256']), row['path']
    return path


def check():
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64

    proof = json.loads((BASE / "manifest.json").read_text())
    selected = latest_target(verify=True)
    target = {key: selected[key] for key in ("version", "path", "sha256", "size_bytes")}
    assert target == proof["target"] and proof["target_executed"] is False
    verify_resources(selected)
    image = target_bytes(target)
    pe = load_script("fire_nova123_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)

    def original(row):
        start = int(row["start"], 0)
        at = pe.rva_offset(start - pe.image_base)
        assert hex(at) == row["file_offset"]
        size = row["byte_count"]
        assert pe.rva_offset(start - pe.image_base + size - 1) == at + size - 1
        raw = image[at:at + size]
        assert digest(raw) == row["sha256"]
        if "hex" in row:
            assert raw.hex() == row["hex"]
        return raw

    instructions = {}
    for row in proof["code_ranges"]:
        start = int(row["start"], 0)
        raw = original(row)
        observed = list(decoder.disasm(raw, start))
        assert sum(item.size for item in observed) == len(raw)
        instructions.update({item.address: item for item in observed})
    for row in proof["reviewed_code_blocks"]:
        original(row)
    receipt(proof["curated_code"])
    expected = {
        0x145b31fce: ("movzx", "edx, byte ptr [rsi + 0x75]"),
        0x145b32035: ("lea", "r8, [rip + 0x17fc29c]"),
        0x145b3235e: ("mov", "eax, dword ptr [rsi + 0x40]"),
        0x145b32361: ("cmp", "eax, 0x5ff"),
        0x145b32366: ("mov", "r8d, 0x209d"),
        0x145b3236c: ("cmovne", "r8d, eax"),
        0x145b323b7: ("call", "0x145c74160"),
        0x145c74186: ("mov", "ebx, r8d"),
        0x145c741b6: ("mov", "word ptr [rbp + 0x28], 0x132"),
        0x145c74223: ("mov", "dword ptr [rax + rdx], ebx"),
    }
    for address, pair in expected.items():
        instruction = instructions[address]
        assert (instruction.mnemonic, instruction.op_str) == pair, hex(address)
    record = proof["ability_record"]
    raw = original(record)
    fields = record["fields"]
    assert fields["spell_id"] == struct.unpack_from("<I", raw, 64)[0] == 1535
    assert fields["pulse_spell_id"] == struct.unpack_from("<I", raw, 100)[0] == 0
    assert fields["school"] == raw[116] == 2 and fields["kind"] == raw[117] == 2
    for offset, row in zip((0, 16, 32, 48), proof["record_targets"]):
        pointer, size = struct.unpack_from("<QQ", raw, offset)
        assert (pointer, size) == (int(row["start"], 0), row["byte_count"])
        value = original(row)
        if row["utf8"] is not None:
            assert value.decode() == row["utf8"]
    assert proof["record_targets"][0]["utf8"] == "fire_nova"
    cell = proof["dispatch_cell"]
    cell_bytes = original(cell)
    assert int(cell["start"], 0) == int(cell["table_base"], 0) + fields["kind"] * 4
    assert int(cell["table_base"], 0) + struct.unpack("<i", cell_bytes)[0] == int(cell["target"], 0) == 0x145b322b5
    for query in proof["queries"]:
        result = json.loads(receipt(query["result"]).read_text())
        native = result.get("structuredContent") or json.loads(result["content"][0]["text"])
        observed = verify_native_query_subject(ROOT, native, query, target, image=image, pe=pe)
        assert observed == query["verified_subject"]
        assert digest(native["normalized_result"].encode()) == query["normalized_sha256"]
        if "canonical_extract" in query:
            assert receipt(query["canonical_extract"]).read_text() == native["normalized_result"]

    mpq = load_script("fire_nova123_mpq", ROOT / "scripts/check-minimap-lifecycle.py")
    order = load_script("fire_nova123_order", ROOT / "scripts/inventory-current-mpq-members.py")
    archives = [mpq.Archive(row["path"]) for row in order.supported_source_order(selected)]
    registered = {row["path"]: row for row in selected["runtime_data"]["archives"]}

    def resolve(name):
        for archive in reversed(archives):
            entry = archive.lookup(name)
            if entry is not None:
                return archive, entry
        return None

    decoded = {}
    for row in proof["dbc_inputs"]:
        archive, entry = resolve(row["name"])
        assert archive.reference == row["archive"] and list(entry) == row["entry"]
        assert registered[archive.reference]["sha256"] == row["archive_sha256"]
        assert digest(archive.hashes) == row["archive_hash_table_sha256"]
        assert digest(archive.blocks) == row["archive_block_table_sha256"]
        data = archive.read(entry)
        assert digest(data) == row["sha256"]
        magic, count, fields_count, size, strings_count = struct.unpack_from("<4s4I", data)
        assert magic == b"WDBC"
        assert (count, fields_count, size) == (row["record_count"], row["field_count"], row["record_bytes"])
        assert len(data) == 20 + count * size + strings_count
        strings = data[20 + count * size:]
        found = {}
        for record in row["rows"]:
            at = 20 + record["record_index"] * size
            value = data[at:at + size]
            assert at == record["record_offset"] and digest(value) == record["sha256"]
            actual = list(struct.unpack("<" + "I" * fields_count, value))
            assert actual == record["fields"] and actual[0] == record["id"]
            for column, text in record.get("strings", {}).items():
                assert strings[actual[int(column)]:].split(b"\0", 1)[0].decode() == text
            found[record["id"]] = actual
        decoded[row["name"]] = found
    spells = decoded["DBFilesClient\\Spell.dbc"]
    visuals = decoded["DBFilesClient\\SpellVisual.dbc"]
    kits = decoded["DBFilesClient\\SpellVisualKit.dbc"]
    assert spells[1535][115] == 221 and visuals[221][2] == 352
    assert kits[352][13] == 2552 and all(value == 0xffffffff for value in kits[352][3:13])
    assert spells[8349][115] == 963 and visuals[963][2] == 984
    assert kits[984][5] == 714 and kits[984][13] == 5636
    for row in proof["asset_inputs"]:
        resolved = resolve(row["name"])
        assert bool(resolved) == row["present"], row["name"]
        if resolved:
            archive, entry = resolved
            assert archive.reference == row["archive"] and list(entry) == row["entry"]
            data = archive.read(entry)
            assert len(data) == row["byte_count"] and digest(data) == row["sha256"]
    sources = {row["path"]: receipt(row).read_text() for row in proof["source_witnesses"]}
    catalog = sources["crates/azeroth-survivors-re/src/player_abilities/catalog.rs"]
    fire = catalog.split('key: "fire_nova"', 1)[1].split("AbilityDefinition {", 1)[0]
    assert re.search(r"spell_id:\s*1535,", fire) and re.search(r"pulse_spell_id:\s*0,", fire)
    dispatch = sources["crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs"]
    visual = dispatch.split("fn visual(", 1)[1].split("pub(super) fn direct(", 1)[0]
    assert re.search(r"let spell_id = if instance\.definition\.kind == 2 && "
                     r"instance\.definition\.spell_id == 1535\s*\{\s*8349\s*\}\s*"
                     r"else\s*\{\s*instance\.definition\.spell_id\s*\};", visual)
    assert re.search(r"port\.cast_spell\(SpellCast\s*\{\s*"
                     r"source_guid: context\.player_guid,\s*spell_id,", visual)
    # This event-only alias must not replace learned, first-hit or damage IDs.
    direct = dispatch.split("pub(super) fn direct(", 1)[1].split("pub fn cast<", 1)[0]
    assert "spell_id: instance.definition.spell_id," in direct
    assert "port.begin_cast(definition.spell_id);" in dispatch
    assert "state.seen_spells.push(definition.spell_id);" in dispatch
    assert "visual(instance, context, CastTarget::None, &selected, port);" in dispatch
    events = sources["crates/azeroth-survivors-re/src/gameplay/client/events.rs"]
    spell_go = events.split("fn spell_go(", 1)[1].split("fn object(", 1)[0]
    assert "spell_id:cast.spell_id," in spell_go
    visuals = sources["crates/benilla-app/src/creature_anim/spell_visual.rs"]
    assert "let def = spells.catalog.get(spell_id)?;" in visuals
    assert "visuals.stages(def.visual).copied()" in visuals
    assert "|s| s.cast," in visuals
    assert "kit.sound.filter(|_| play.sound)" in visuals
    fx = sources["crates/benilla-app/src/entities/spell_fx/mod.rs"]
    assert "asset_server.load(m2_url(path))" in fx
    asset = sources["crates/benilla-assets/src/lib.rs"]
    assert "match benilla_formats::m2_file_name(raw)" in asset
    hosts = {("Darwin", "arm64"): "aarch64-apple-darwin",
             ("Darwin", "x86_64"): "x86_64-apple-darwin",
             ("Linux", "x86_64"): "x86_64-unknown-linux-gnu",
             ("Linux", "aarch64"): "aarch64-unknown-linux-gnu"}
    host = hosts[(platform.system(), platform.machine())]
    rustfmt = ROOT / ".tools/rust" / ("1.98.1-" + host) / "bin/rustfmt"
    assert rustfmt.is_file(), "Configured non-compiling Rust syntax parser unavailable"
    for name in ("crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs",
                 "crates/azeroth-survivors-re/src/gameplay/client/events.rs"):
        parsed = subprocess.run([str(rustfmt), "--edition", "2024", "--emit", "stdout",
                                 "--config", "skip_children=true"], input=sources[name], text=True,
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, parsed.stderr
    return {"status": "passed", "target_sha256": target["sha256"],
            "code_ranges": len(proof["code_ranges"]), "instructions_verified": len(instructions),
            "queries": len(proof["queries"]), "dbc_tables": len(proof["dbc_inputs"]),
            "dbc_rows": sum(len(row["rows"]) for row in proof["dbc_inputs"]),
            "source_alias_implemented": True, "rust_syntax_paths": 2,
            "runtime_verified": False, "parity_verified": False}


if __name__ == "__main__":
    print(json.dumps(check(), indent=2))
