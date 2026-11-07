#!/usr/bin/env python3
"""Check reviewed UI/source connections and syntax without compiling the app.

The receipt records a human-readable, bounded native/source review. Matching
source hashes does not execute Rust or establish rendering/network parity.
"""
import argparse
import hashlib
import json
import platform
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

BASE = ROOT / "docs/analysis/evidence/coop-lobby-ui-comparison"
RECEIPT = BASE / "source.json"
PREFIX = "crates/azeroth-survivors-re/src/"
SCOPES = (
    ("coop_ui.rs", "impl CoopUi {", "pub(crate) fn host_capacity"),
    ("coop_ui.rs", "fn difficulty_name(", "fn text("),
    ("coop_ui.rs", "fn input(", "fn rebuild("),
    ("coop_ui.rs", "fn rebuild(", "#[cfg(test)]"),
    ("coop_directory.rs", "fn profile(", "impl Service {"),
    ("coop_directory.rs", "DirectoryResponse::Lobbies(rows) =>", "DirectoryResponse::Text { tag: 21"),
    ("coop_directory.rs", "fn publish_directory(", "///1458e2590"),
    ("menu_state.rs", "    pub(crate) fn close_dialog(", "    pub(crate) fn from_save_path("),
)
FILES = ("coop_directory_row.rs", "run_options.rs")
SYNTAX = ("coop_ui.rs", "coop_directory.rs", "coop_directory_row.rs", "menu.rs", "menu_state.rs", "run_options.rs")


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def current():
    target = latest_target(verify=True)
    if target["sha256"] != "de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be":
        raise ValueError("This source review belongs to the selected 0.123.0 target")
    scopes = []
    for name, first, last in SCOPES:
        text = (ROOT / PREFIX / name).read_text()
        start = text.index(first)
        end = text.index(last, start)
        scopes.append(dict(path=PREFIX + name, start_marker=first, end_marker=last,
                           sha256=sha(text[start:end].encode())))
    files = [dict(path=PREFIX + name, sha256=sha((ROOT / PREFIX / name).read_bytes())) for name in FILES]
    image = target_bytes(target)
    pe = load_script("lobby_source_layout_pe", ROOT / "scripts/inventory-executable.py").PE(image)
    layout = []
    for role, address, size, value in (("text_column_row_gap", 0x1461c0b08, 8, 3.),
                                      ("zone_rank_column_gap", 0x1461b2410, 4, 10.)):
        at = pe.rva_offset(address - pe.image_base)
        raw = image[at:at + size]
        if size == 8:
            unit, native = struct.unpack("<If", raw)
            assert unit == 1
        else:
            native = struct.unpack("<f", raw)[0]
        assert native == value
        layout.append(dict(role=role, virtual_address=hex(address), file_offset=hex(at),
                           bytes_hex=raw.hex(), sha256=sha(raw), pixels=value))
    return dict(schema_version=1, target={key: target[key] for key in ("version", "sha256", "size_bytes")},
                native_manifest_sha256=sha((BASE / "manifest.json").read_bytes()),
                locale_receipt_sha256=sha((BASE.parent / "coop-lobby-locales.json").read_bytes()),
                source_scopes=scopes, source_files=files, native_card_layout=layout,
                source_execution="not_run", compilation="not_run", parity="unverified")


def check():
    expected = json.loads(RECEIPT.read_text())
    assert current() == expected, "Reviewed source/native/locale scope changed; reassess the connection"
    ui = (ROOT / PREFIX / "coop_ui.rs").read_text()
    menu = (ROOT / PREFIX / "menu.rs").read_text()
    state = (ROOT / PREFIX / "menu_state.rs").read_text()
    options = (ROOT / PREFIX / "run_options.rs").read_text()
    # These cross-file action edges are outside the larger layout scopes.
    assert "CoopDifficulty," in state
    assert "Action::Close=>state.close_dialog()" in menu
    assert "} else if state.dialog.is_some() {\n            state.close_dialog();" in menu
    assert "Dialog::RunOptions | Dialog::CoopDifficulty" in options
    assert '"The party\'s run", None,' in ui
    assert 'lobby.heroic_rank, view.role == "host"' in ui
    card = ui.split("fn selection_card(", 1)[1].split("fn text(", 1)[0]
    compact = "".join(card.split())
    assert "row_gap:Val::Px(3.)" in compact
    assert "column_gap:Val::Px(10.),align_items:AlignItems::Center" in compact
    host = {("Darwin", "arm64"): "aarch64-apple-darwin", ("Darwin", "x86_64"): "x86_64-apple-darwin",
            ("Linux", "x86_64"): "x86_64-unknown-linux-gnu"}.get((platform.system(), platform.machine()))
    assert host, "Configured Rust syntax parser unavailable on this host"
    parser = ROOT / ".tools/rust" / f"1.98.1-{host}" / "bin/rustfmt"
    assert parser.is_file(), "Configured Rust syntax parser unavailable; no installation attempted"
    for name in SYNTAX:
        result = subprocess.run([str(parser), "--edition", "2024", "--emit", "stdout", "--config", "skip_children=true"],
                                input=(ROOT / PREFIX / name).read_text(), text=True,
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
        assert result.returncode == 0, (name, result.stderr)
    print(f"Co-op UI source review: {len(SCOPES)} scopes, {len(FILES)} files, six Rust syntax parses; no compilation/execution/parity")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--record", action="store_true", help="Record an independently reviewed source connection")
    args = parser.parse_args()
    if args.record:
        RECEIPT.write_text(json.dumps(current(), indent=2) + "\n")
    check()
