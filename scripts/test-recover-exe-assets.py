#!/usr/bin/env python3
"""Synthetic, reference-free regression cases for the executable asset recovery."""

import importlib.util
from pathlib import Path
import struct
import tempfile
import unittest
import zlib


ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("recover_exe_assets", ROOT / "scripts/recover-exe-assets.py")
recovery = importlib.util.module_from_spec(spec)
spec.loader.exec_module(recovery)


def chunk(kind, payload):
    return struct.pack(">I", len(payload)) + kind + payload + struct.pack(">I", zlib.crc32(kind + payload) & 0xFFFFFFFF)


def png():
    return recovery.PNG_SIGNATURE + chunk(b"IHDR", struct.pack(">IIBBBBB", 1, 1, 8, 6, 0, 0, 0)) + chunk(b"IDAT", zlib.compress(b"\0\x11\x22\x33\xff")) + chunk(b"IEND", b"")


def font():
    family = "Test Font".encode("utf-16-be")
    head = bytearray(54)
    head[12:16] = b"\x5f\x0f\x3c\xf5"
    name = struct.pack(">3H6H", 0, 1, 18, 3, 1, 0x409, 1, len(family), 0) + family
    tables = {b"cmap": b"\0\0\0\0", b"glyf": b"\0" * 4, b"head": bytes(head), b"maxp": b"\0\1\0\0\0\1", b"name": name}
    result = bytearray(struct.pack(">I4H", 0x10000, len(tables), 0, 0, 0) + b"\0" * (16 * len(tables)))
    head_at = None
    for index, (tag, raw) in enumerate(sorted(tables.items())):
        at = len(result)
        if tag == b"head":
            head_at = at
        struct.pack_into(">4sIII", result, 12 + index * 16, tag, recovery.sum32(raw), at, len(raw))
        result += raw + b"\0" * (-len(raw) % 4)
    struct.pack_into(">I", result, head_at + 8, (0xB1B0AFBA - recovery.sum32(bytes(result))) & 0xFFFFFFFF)
    return bytes(result)


def icon_resource_fixture():
    image = png()
    group = struct.pack("<HHHBBBBHHIH", 0, 1, 1, 1, 1, 0, 0, 1, 32, len(image), 7)
    data = b"\0" * 64 + group + image
    resources = [
        dict(index=0, type={"id": 14}, name={"id": 1}, payload=dict(location=dict(offset=64, bytes=len(group)), sha256=recovery.sha(group))),
        dict(index=1, type={"id": 3}, name={"id": 7}, payload=dict(location=dict(offset=64 + len(group), bytes=len(image)), sha256=recovery.sha(image))),
    ]
    evidence = dict(subject=dict(digest=dict(sha256=recovery.sha(data))), normalized_result=dict(resources=resources, icon_groups=[dict(resource_index=0, images=[dict(same_language_resource_index=1)])]))
    return FakePE(data), evidence


class FakePE:
    def __init__(self, data):
        self.data = data
        self.image_base = 0x140000000
        self.sections = [dict(raw_offset=0, raw_size=len(data), characteristics="0x40000040")]

    def offset_va(self, at):
        return self.image_base + at

    def rva_offset(self, rva):
        if not 0 <= rva < len(self.data):
            raise ValueError("outside file")
        return rva


class RecoveryTests(unittest.TestCase):
    def test_png_exact_bounded_extent(self):
        raw = png()
        row = recovery.png_at(b"lead" + raw + b"suffix", 4, 4 + len(raw))
        self.assertEqual((row["size_bytes"], row["width"], row["height"]), (len(raw), 1, 1))

    def test_png_crc_mismatch_rejected(self):
        raw = bytearray(png())
        raw[16] ^= 1
        with self.assertRaisesRegex(ValueError, "CRC"):
            recovery.png_at(bytes(raw), 0, len(raw))

    def test_png_truncated_chunk_rejected(self):
        raw = png()
        with self.assertRaises(ValueError):
            recovery.png_at(raw, 0, len(raw) - 1)

    def test_png_scanline_size_rejected_despite_valid_crcs(self):
        raw = recovery.PNG_SIGNATURE + chunk(b"IHDR", struct.pack(">IIBBBBB", 1, 1, 8, 6, 0, 0, 0)) + chunk(b"IDAT", zlib.compress(b"\0")) + chunk(b"IEND", b"")
        with self.assertRaisesRegex(ValueError, "scanline"):
            recovery.png_at(raw, 0, len(raw))

    def test_sfnt_checksums_names_and_exact_extent(self):
        raw = font()
        row = recovery.sfnt_at(raw + b"suffix", 0, len(raw))
        self.assertEqual(row["family"], "Test Font")
        self.assertEqual(row["size_bytes"], len(raw))

    def test_sfnt_corrupted_table_rejected(self):
        raw = bytearray(font())
        raw[-1] ^= 1
        with self.assertRaises(ValueError):
            recovery.sfnt_at(bytes(raw), 0, len(raw))

    def test_sfnt_invalid_global_checksum_rejected(self):
        raw = bytearray(font())
        head = recovery.sfnt_at(bytes(raw), 0, len(raw))["tables"]["head"]["offset"]
        raw[head + 8] ^= 1
        with self.assertRaisesRegex(ValueError, "global checksum"):
            recovery.sfnt_at(bytes(raw), 0, len(raw))

    def test_pointer_length_recovers_adjacent_string_boundary(self):
        text = b"mpq://Interface/Icons/Test.blp"
        raw = bytearray(256)
        raw[64:64 + len(text) + 8] = text + b"Neighbor"
        struct.pack_into("<QQ", raw, 0, 0x140000040, len(text))
        slices = recovery.pointer_slices(FakePE(bytes(raw)))
        self.assertEqual(slices[0]["text"], text.decode())
        rows = recovery.path_evidence(FakePE(bytes(raw)), slices)
        self.assertIn("exact pointer/length-bounded path", rows[0]["evidence_kinds"])
        self.assertEqual(rows[0]["normalized_archive_candidate"], "interface/icons/test.blp")

    def test_pointer_length_crossing_file_boundary_rejected(self):
        raw = bytearray(64)
        struct.pack_into("<QQ", raw, 0, 0x14000003C, 100)
        self.assertEqual(recovery.pointer_slices(FakePE(bytes(raw))), [])

    def test_archive_normalization_rejects_parent_traversal(self):
        self.assertEqual(recovery.archive_path("mpq://Fonts\\AZS_JP.TTF"), "fonts/azs_jp.ttf")
        with self.assertRaises(ValueError):
            recovery.archive_path("Interface/../escape.blp")

    def test_all_paths_stay_in_checkout(self):
        with self.assertRaises(ValueError):
            recovery.local("../outside")

    def test_ico_preserves_original_image_payload(self):
        pe, evidence = icon_resource_fixture()
        temporary_root = ROOT / "runtime/tmp"
        temporary_root.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=temporary_root) as directory:
            row = recovery.recover_resource_icons(pe, evidence, Path(directory))[0]
            raw = (ROOT / row["output_path"]).read_bytes()
            self.assertEqual(struct.unpack_from("<HHH", raw), (0, 1, 1))
            self.assertEqual(raw[22:], png())
            self.assertEqual((ROOT / row["original_group_output_path"]).read_bytes(), pe.data[64:84])

    def test_ico_wrong_target_evidence_rejected(self):
        pe, evidence = icon_resource_fixture()
        evidence["subject"]["digest"]["sha256"] = "0" * 64
        with self.assertRaisesRegex(ValueError, "target hash"):
            recovery.recover_resource_icons(pe, evidence, ROOT / "runtime/tmp")

    def test_ico_wrong_resource_hash_rejected(self):
        pe, evidence = icon_resource_fixture()
        evidence["normalized_result"]["resources"][1]["payload"]["sha256"] = "0" * 64
        temporary_root = ROOT / "runtime/tmp"
        temporary_root.mkdir(parents=True, exist_ok=True)
        with tempfile.TemporaryDirectory(dir=temporary_root) as directory:
            with self.assertRaisesRegex(ValueError, "id/size/hash"):
                recovery.recover_resource_icons(pe, evidence, Path(directory))

    def test_language_font_triple_retains_exact_paths(self):
        raw = bytearray(256)
        strings = [(128, b"ja"), (130, b"Fonts\\AZS_JP.TTF"), (146, b"azs_jp.ttf")]
        for index, (offset, text) in enumerate(strings):
            raw[offset:offset + len(text)] = text
            struct.pack_into("<QQ", raw, index * 16, 0x140000000 + offset, len(text))
        pe = FakePE(bytes(raw))
        rows = recovery.language_font_records(pe, recovery.pointer_slices(pe))
        self.assertEqual(len(rows), 1)
        self.assertEqual(rows[0]["virtual_path"]["text"], "Fonts\\AZS_JP.TTF")
        self.assertEqual(rows[0]["locale"]["text"], "ja")


if __name__ == "__main__":
    unittest.main()
