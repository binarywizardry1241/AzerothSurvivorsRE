#!/usr/bin/env python3
"""Verify a selected addon API proof against installed bytes; no execution."""
import argparse
import hashlib
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
from script_sources import load_script
from coverage_common import project_path


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def select_manifest(raw, explicit=None):
    if explicit is not None:
        return project_path(explicit)
    expected = sha(raw)
    matches = []
    for path in (ROOT / 'docs/analysis/evidence').glob('*/addon-api/manifest.json'):
        if json.loads(path.read_text()).get('target', {}).get('sha256') == expected:
            matches.append(path)
    if len(matches) != 1:
        raise ValueError('Select one reviewed addon API manifest matching the installed EXE with --manifest')
    return matches[0]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--manifest', help='Reviewed native addon API manifest')
    parser.add_argument('--extract', help='Embedded API extraction binding; defaults beside the manifest directory')
    args = parser.parse_args()
    config = json.loads((ROOT / ".codex/reference-game.json").read_text())
    raw = Path(config["exe"]).read_bytes()
    manifest = select_manifest(raw, args.manifest)
    base = manifest.parent.parent
    extract_path = project_path(args.extract) if args.extract else base / 'addon-api-extract.json'
    extract = json.loads(extract_path.read_text())
    native = json.loads(manifest.read_text())
    assert sha(raw) == extract["target"]["sha256"] == native["target"]["sha256"]
    assert len(raw) == extract["target"]["size_bytes"] == native["target"]["size_bytes"]
    lua = extract["embedded_api"]
    offset = int(lua["file_offset"], 16)
    payload = project_path(lua["path"]).read_bytes()
    assert len(payload) == lua["byte_count"] and sha(payload) == lua["sha256"]
    assert raw[offset:offset + len(payload)] == payload
    pe = load_script("addon_api_pe", ROOT / "scripts/inventory-executable.py").PE(raw)
    count = 0
    for row in native["owners"] + native["literals"]:
        address = int(row["address"], 16)
        offset = pe.rva_offset(address - pe.image_base)
        assert offset == int(row["file_offset"], 16), row["role"]
        payload = raw[offset:offset + row["byte_count"]]
        assert sha(payload) == row["sha256"], row["role"]
        if "hex" in row:
            assert payload.hex() == row["hex"], row["role"]
        for kind in ("assembly", "pseudocode"):
            if kind in row:
                path = project_path(manifest.parent / row[kind])
                assert sha(path.read_bytes()) == row[kind + "_sha256"], path
        if "assembly" in row:
            original = bytearray()
            cursor = address
            for line in project_path(manifest.parent / row["assembly"]).read_text().splitlines():
                at, encoded, _ = line.split("  ", 2)
                assert int(at, 16) == cursor
                chunk = bytes.fromhex(encoded)
                original.extend(chunk)
                cursor += len(chunk)
            assert bytes(original) == payload, row["role"]
            assert cursor == int(row["end_exclusive"], 16)
        count += 1
    print(f"PASS: installed {native['target']['version']} identity, exact embedded Lua, {count} native ranges and curated hashes")


if __name__ == "__main__":
    main()
