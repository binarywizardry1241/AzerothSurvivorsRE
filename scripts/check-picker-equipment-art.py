#!/usr/bin/env python3
"""Check #52's selected native consumer, installed icon resources and source path.

No compilation, reconstructed Rust execution, game or renderer runs. MPQ/DBC
reading is independent Python; BLP checks cover headers and complete DXT mip 0,
not decoded pixels or GPU presentation. --stage writes only ignored evidence.
"""
import argparse
import hashlib
import json
import struct

from coverage_common import ROOT, artifact_path, file_sha256, latest_target, load_json, target_bytes
from script_sources import load_script

SHA = "58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb"
DIRECTORY = ROOT / "docs/analysis/evidence/0.113.2/picker-equipment-art"


def digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":")).encode()).hexdigest()


def check():
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    data = target_bytes(target)
    pe = load_script("picker_art_pe", ROOT / "scripts/inventory-executable.py").PE(data)
    native = load_json(DIRECTORY / "native-contract.json")
    assert native["target_sha256"] == SHA
    for row in native["ranges"]:
        start, end = int(row["start"], 16), int(row["end_exclusive"], 16)
        offset = pe.rva_offset(start - pe.image_base)
        assert hashlib.sha256(data[offset:offset + end - start]).hexdigest() == row["sha256"]
    for row in native["calls"]:
        site = int(row["site"], 16)
        offset = pe.rva_offset(site - pe.image_base)
        assert data[offset] == 0xE8
        assert site + 5 + struct.unpack_from("<i", data, offset + 1)[0] == int(row["target"], 16)
    literal = native["dbc_literal"]
    site = int(literal["instruction"], 16)
    offset = pe.rva_offset(site - pe.image_base)
    address = int(literal["address"], 16)
    assert data[offset:offset + 3] == bytes.fromhex("4c8d05")
    assert site + 7 + struct.unpack_from("<i", data, offset + 3)[0] == address
    offset = pe.rva_offset(address - pe.image_base)
    value = literal["value"].encode()
    assert data[offset:offset + len(value)] == value

    mpq = load_script("picker_art_mpq", ROOT / "scripts/check-minimap-lifecycle.py")
    registered = load_json(ROOT / "docs/analysis/target-refresh-0.113.2.json")
    records = registered["registered_identity"]["runtime_data"]["archives"]
    ordered = sorted(records, key=lambda row: (not row["path"].lower().endswith("/patch.mpq"), row["path"].lower()))
    directory = artifact_path("installed-game/Data")
    assert {p.name.lower() for p in directory.iterdir() if p.suffix.lower() == ".mpq"} == {
        row["path"].split("/")[-1].lower() for row in ordered
    }
    for row in ordered:
        assert artifact_path(row["path"]).stat().st_size == row["size_bytes"]
        assert file_sha256(row["path"]) == row["sha256"]
    archives = [mpq.Archive(row["path"]) for row in ordered]

    def read(name):
        for archive in reversed(archives):
            entry = archive.lookup(name)
            if entry is not None:
                return archive.reference, archive.read(entry)
        raise AssertionError(f"Missing resource: {name}")

    dbc_archive, dbc = read("DBFilesClient\\ItemDisplayInfo.dbc")
    magic, rows, columns, stride, strings = struct.unpack_from("<4sIIII", dbc)
    assert magic == b"WDBC" and stride >= 24
    base = 20 + rows * stride
    assert base + strings <= len(dbc)
    icons = {}
    for row in range(rows):
        at = 20 + row * stride
        key = struct.unpack_from("<I", dbc, at)[0]
        if key not in icons:  # Native uses the first matching row, including empty.
            start = base + struct.unpack_from("<I", dbc, at + 20)[0]
            icons[key] = dbc[start:dbc.index(0, start)].decode("utf-8")

    assets = ROOT / "crates/azeroth-survivors-re/assets"
    catalog = load_json(assets / "armory.json")
    pvp = load_json(assets / "pvp-gear-0.105.0.json")
    patches = {p["id"]: p for p in load_json(assets / "armory-catalog-delta-0.109.0.json")["pieces"]}
    displays, selections = set(), []
    for ordinary, supplement in zip(catalog["classes"], pvp["classes"], strict=True):
        assert ordinary["id"] == supplement["id"]
        for piece in ordinary["items"] + supplement["items"]:
            display = patches.get(piece["id"], {}).get("display_id", piece["display_id"])
            displays.add(display)
            if piece.get("horde"):
                displays.add(piece["horde"]["display_id"])
            for race in range(1, 9):
                selected = piece["horde"]["display_id"] if piece.get("horde") and race in (2, 5, 6, 8) else display
                selections.append([piece["id"], race, selected])
    assert displays <= set(load_json(assets / "native-dbc-display-ids-0.105.0.json"))

    resources = []

    def image(name):
        archive, body = read(name)
        assert body[:4] == b"BLP2" and body[8] == 2
        width, height = struct.unpack_from("<II", body, 12)
        offset, = struct.unpack_from("<I", body, 20)
        size, = struct.unpack_from("<I", body, 84)
        assert width and height and offset >= 148 and body[10] in (0, 1, 7)
        assert size == ((width + 3) // 4) * ((height + 3) // 4) * (8 if body[10] == 0 else 16)
        assert offset + size <= len(body)
        return [name, archive, width, height, hashlib.sha256(body).hexdigest()]

    for display in sorted(displays):
        assert icons.get(display), f"Missing icon name for display {display}"
        resources.append([display, image(f"Interface\\Icons\\{icons[display]}.blp")])
    slots = ["Head", "Shoulder", "Chest", "Hands", "Waist", "Legs", "Wrist", "Feet", "MainHand", "SecondaryHand", "Ranged"]
    placeholders = [image(f"Interface\\PaperDoll\\UI-PaperDoll-Slot-{'Wrists' if s == 'Wrist' else s}.blp") for s in slots]

    armory = (ROOT / "crates/azeroth-survivors-re/src/armory.rs").read_text()
    loader = armory.split("fn load_gear_art(", 1)[1].split("#[cfg(test)]", 1)[0]
    assert "Page::Picker | Page::Character | Page::Collection | Page::DropTables" in loader
    assert loader.index("native_dbc::item_icon_dictionary()") < loader.index("open_chain(&path)") < loader.index("*loaded = true")
    assert 'art.icons.insert(format!("gear.{id}"), image)' in loader
    assert "load_gear_art," in armory.split("impl Plugin for ArmoryPlugin", 1)[1].split("fn invalidate", 1)[0]
    picker = (ROOT / "crates/azeroth-survivors-re/src/picker.rs").read_text()
    assert 'format!("gear.{}", piece.display_id(state.race))' in picker
    assert 'unwrap_or_else(|| format!("slot.{slot}"))' in picker
    menu = (ROOT / "crates/azeroth-survivors-re/src/menu.rs").read_text()
    assert "!art.is_changed()" in menu.split("fn rebuild(", 1)[1]
    return dict(target_sha256=SHA, native_contract="native-contract.json", archives=len(archives),
                dbc=dict(archive=dbc_archive, rows=rows, columns=columns, stride=stride, sha256=hashlib.sha256(dbc).hexdigest()),
                catalog_pieces=len(selections) // 8, race_selections=len(selections), selections_sha256=digest(selections),
                display_ids=len(displays), icon_resources_sha256=digest(resources),
                unique_icon_paths=len({row[1][0].lower() for row in resources}),
                placeholders=len(placeholders), placeholder_resources_sha256=digest(placeholders),
                source_connection="Picker/Armory -> load_gear_art -> dictionary -> MPQ/BLP -> MenuArt change -> rebuild -> picker ImageNode",
                limits=["No reconstructed Rust, compilation, application, renderer or original/rebuilt comparison executes.",
                        "BLP validation covers complete DXT mip0 payloads, not reconstructed decoding or GPU output.",
                        "Catalog identity and other gear behavior retain their owning historical target provenance."])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", action="store_true")
    args = parser.parse_args()
    result = check()
    if args.stage:
        output = ROOT / "runtime/analysis/history/interface/picker-art/5bd0e9fa60e9/resource-source-proof.json"
        output.write_text(json.dumps(result, indent=2) + "\n")
    else:
        assert result == load_json(DIRECTORY / "resource-source-proof.json")
    print(f"Passed #52: {result['display_ids']} display icons, {result['placeholders']} placeholders, {result['race_selections']} faction selections, native/source bindings")
