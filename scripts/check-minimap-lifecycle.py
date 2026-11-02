#!/usr/bin/env python3
"""Check the retained minimap failure against installed resources and source lifetimes.

Read-only by default. --write records compact evidence, never asset contents.
This is an independent MPQ/resource and source-order check, not Rust execution.
Only the stored/zlib, unencrypted, sectored MPQ forms used by these inputs are read.
"""

import argparse
import hashlib
import json
import struct
import zlib

from coverage_common import ROOT, artifact_path, file_sha256, latest_target, load_json

SHA = "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
OUTPUT = ROOT / "docs/analysis/evidence/0.109.0/minimap-lifecycle.json"
FAILURES = {
    "Azeroth\\map31_31.blp": "f7a3bdcacfa0acb8e4a526dfc1afdaaa.blp",
    "Azeroth\\map31_32.blp": "a4bb42226fce2f0e8eb247caa86479b5.blp",
    "Azeroth\\map32_31.blp": "1357b2221b80394db7cf75ea7c4b1f6c.blp",
    "Azeroth\\map32_32.blp": "6cc087b26eab6f8a75d13e678903d4d5.blp",
}
MASK = 0xFFFFFFFF
CRYPT = [0] * 0x500
seed = 0x100001
for column in range(256):
    for row in range(5):
        seed = (seed * 125 + 3) % 0x2AAAAB
        high = (seed & 0xFFFF) << 16
        seed = (seed * 125 + 3) % 0x2AAAAB
        CRYPT[column + row * 256] = high | (seed & 0xFFFF)


def name_hash(name, kind):
    first, second = 0x7FED7FED, 0xEEEEEEEE
    for char in name.replace("/", "\\").upper().encode("ascii"):
        first = CRYPT[kind + char] ^ ((first + second) & MASK)
        second = (char + first + second + (second << 5) + 3) & MASK
    return first


def decrypt(data, key):
    seed = 0xEEEEEEEE
    words = []
    for (word,) in struct.iter_unpack("<I", data):
        seed = (seed + CRYPT[0x400 + (key & 255)]) & MASK
        plain = word ^ ((key + seed) & MASK)
        words.append(plain)
        key = ((((~key) << 21) + 0x11111111) | (key >> 11)) & MASK
        seed = (plain + seed + (seed << 5) + 3) & MASK
    return struct.pack(f"<{len(words)}I", *words)


class Archive:
    def __init__(self, reference):
        self.reference = reference
        self.path = artifact_path(reference)
        self.size = self.path.stat().st_size
        with self.path.open("rb") as stream:
            header = stream.read(32)
            magic, _, _, version, shift, hp, bp, hn, bn = struct.unpack("<IIIHHIIII", header)
            assert magic == 0x1A51504D and version <= 1 and shift <= 23
            assert hn and hn * 16 <= self.size and bn * 16 <= self.size
            self.sector_size = 512 << shift
            self.hashes = self.table(stream, hp, hn, "(hash table)")
            self.blocks = self.table(stream, bp, bn, "(block table)")
            self.hash_count = hn

    def table(self, stream, offset, count, name):
        assert offset + count * 16 <= self.size
        stream.seek(offset)
        return decrypt(stream.read(count * 16), name_hash(name, 0x300))

    def lookup(self, name):
        a, b = name_hash(name, 0x100), name_hash(name, 0x200)
        start = name_hash(name, 0) % self.hash_count
        for step in range(self.hash_count):
            slot = (start + step) % self.hash_count
            ha, hb, _, _, index = struct.unpack_from("<IIHHI", self.hashes, slot * 16)
            if index == MASK:
                return None
            if index == MASK - 1:
                continue
            if (ha, hb) == (a, b):
                assert index * 16 + 16 <= len(self.blocks)
                return struct.unpack_from("<IIII", self.blocks, index * 16)
        return None

    def read(self, entry):
        offset, packed, size, flags = entry
        assert flags & 0x80000000 and not flags & 0x03010100, hex(flags)
        assert offset + packed <= self.size and size < 16 * 1024 * 1024
        with self.path.open("rb") as stream:
            stream.seek(offset)
            data = stream.read(packed)
        if flags & 0x200:
            count = (size + self.sector_size - 1) // self.sector_size
            offsets = struct.unpack_from(f"<{count + 1}I", data)
            assert (count + 1) * 4 <= offsets[0] <= len(data)
            output = bytearray()
            for index in range(count):
                assert offsets[index] <= offsets[index + 1] <= len(data)
                chunk = data[offsets[index]:offsets[index + 1]]
                expected = min(self.sector_size, size - index * self.sector_size)
                if len(chunk) < expected:
                    assert chunk and chunk[0] == 2, "unsupported MPQ sector codec"
                    chunk = zlib.decompress(chunk[1:])
                assert len(chunk) == expected
                output.extend(chunk)
            data = bytes(output)
        assert len(data) == size
        return data


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    target = latest_target(verify=True)
    assert target["sha256"] == SHA
    registered = load_json("docs/analysis/target-refresh-0.109.0.json")["runtime_data"]["archives"]
    # The registered input has patch.MPQ then patch-2..8. Refuse a changed chain.
    ordered = sorted(registered, key=lambda row: (not row["path"].lower().endswith("/patch.mpq"), row["path"].lower()))
    assert [row["path"].split("/")[-1] for row in ordered] == ["patch.MPQ", *[f"patch-{i}.MPQ" for i in range(2, 9)]]
    directory = artifact_path("installed-game/Data")
    assert {p.name.lower() for p in directory.iterdir() if p.suffix.lower() == ".mpq"} == {
        row["path"].split("/")[-1].lower() for row in ordered
    }
    for row in ordered:
        assert artifact_path(row["path"]).stat().st_size == row["size_bytes"]
        assert file_sha256(row["path"]) == row["sha256"]
    archives = [Archive(row["path"]) for row in ordered]

    def resolve(name):
        for archive in reversed(archives):
            entry = archive.lookup(name)
            if entry is not None:
                return archive, entry
        return None

    name = "textures\\Minimap\\md5translate.trs"
    archive, entry = resolve(name)
    body = archive.read(entry)
    translations = {}
    for line in body.decode("utf-8").splitlines():
        if "\t" in line:
            left, right = line.strip().split("\t", 1)
            translations[left.lower()] = right
    failed = []
    for logical, filename in FAILURES.items():
        assert translations[logical.lower()] == filename
        path = f"textures\\Minimap\\{filename}"
        assert resolve(path) is None
        assert resolve(path.replace("\\", "/").upper()) is None
        failed.append(dict(logical=logical, filename=filename, present_in_archives=[]))

    # A real tile by the Elwynn run center is a positive control for lookup/read/BLP shape.
    logical = "Azeroth\\map33_49.blp"
    filename = translations[logical.lower()]
    control_archive, control_entry = resolve(f"textures/Minimap/{filename}")
    tile = control_archive.read(control_entry)
    assert tile[:4] == b"BLP2" and struct.unpack_from("<II", tile, 12) == (256, 256)

    source = (ROOT / "crates/benilla-app/src/minimap/mod.rs").read_text()
    emit = source[source.index("fn emit_minimap("):source.index("///", source.index("fn emit_minimap(") + 1)]
    assert emit.index("composite.active = false;") < emit.index("if !player.active {\n        return;") < emit.index("widget.0.as_ref()")
    assert emit.index("if !player.active") < emit.index("assets.translate.get(&key)")
    assert emit.index("if !player.active") < emit.index(".tile(dir, tx, ty)")
    assert 'format!("mpq://textures/Minimap/{hash}")' in source
    player = (ROOT / "crates/benilla-app/src/player/wire_in.rs").read_text()
    reset = player[player.index("pub(super) fn release_on_session_end("):]
    assert "*player = Player::default();" in reset
    probe = (ROOT / "crates/benilla-app/src/capture/mod.rs").read_text()
    assert "player.active = true;" in probe[probe.index('std::env::var("WOW_MM_PROBE")'):]
    result = dict(
        schema_version=1, target_sha256=SHA, gap_id=44,
        archives=ordered,
        translate=dict(archive=archive.reference, bytes=len(body), sha256=hashlib.sha256(body).hexdigest(), entries=len(translations)),
        failed_tiles=failed,
        positive_control=dict(logical=logical, filename=filename, archive=control_archive.reference,
                              bytes=len(tile), sha256=hashlib.sha256(tile).hexdigest(), dimensions=[256, 256]),
        source_contract="Reset composite/hover, then return before tile lookup/load when Player.active is false. Active-player lookup and missing-file errors remain unchanged.",
        diagnosis="The four retained paths are the translation hits around (0,0). Logout resets Player to inactive/zero before the old MinimapWidget necessarily disappears. The old renderer admitted that source state.",
        limits=["Source and resource proof; no Rust execution, game reproduction, rendering or original/rebuilt parity.",
                "The historical log has no call stack. Its timing/path match supports this cause without proving the exact historical scheduling."],
    )
    encoded = json.dumps(result, indent=2) + "\n"
    if args.write:
        OUTPUT.write_text(encoded)
    else:
        assert OUTPUT.read_text() == encoded, "minimap evidence changed; review before --write"
    print(f"Minimap lifecycle: eight archive hashes, four absent origin tiles, readable Elwynn control and source lifetime guards pass ({len(translations)} translations). No Rust/game executed.")


if __name__ == "__main__":
    main()
