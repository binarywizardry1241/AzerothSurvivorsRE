#!/usr/bin/env python3
"""Non-compiling version-marker regressions for binary identity checks."""
import re
import struct
import time
import unittest
from coverage_common import ROOT, embedded_marker_versions, installed_version, load_json, platform_descriptor_versions
from script_sources import load_script

class VersionMarkers(unittest.TestCase):
    def test_exact_existing_regex_semantics(self):
        marker=b'!marker!'
        fixtures=(b'',b'0.109.0',b'prefix0.109.0',b'9.0.109.0',b'0.109.',b'0..109.0',b'0.109.0.1',b'.0.109.0',b'123',b'\xff0.109.0')
        for prefix in fixtures:
            with self.subTest(prefix=prefix):
                image=prefix+marker+b'x'+prefix+marker
                expected=re.findall(rb'(\d+\.\d+\.\d+)'+re.escape(marker),image)
                self.assertEqual(embedded_marker_versions(image,marker),expected)
    def test_mismatch_duplicate_and_missing_rejected(self):
        valid=b'0.109.0\x1eupdate: up to date\0' + b'0.109.0A new version is out!'
        self.assertEqual(installed_version(valid),'0.109.0')
        for image in (b'',valid+valid,valid.replace(b'0.109.0A',b'0.108.0A')):
            with self.assertRaises(ValueError):installed_version(image)
    def platform_image(self, version=b'0.115.0', platform_version=None, copies=1):
        image=bytearray(4096)
        image[:2]=b'MZ';struct.pack_into('<I',image,0x3c,0x80)
        image[0x80:0x84]=b'PE\0\0'
        struct.pack_into('<H',image,0x86,1);struct.pack_into('<H',image,0x94,240)
        struct.pack_into('<H',image,0x98,0x20b);struct.pack_into('<Q',image,0xb0,0x140000000)
        struct.pack_into('<IIII',image,0x190,3584,0x1000,3584,512)
        checker=version+b'\x1eupdate: up to date\0'
        image[512:512+len(checker)]=checker
        value=version if platform_version is None else platform_version
        for index in range(copies):
            at=1024+index*256
            raw=value+b'\0'+struct.pack('<QQ',0x140001000+at-512,len(value))
            platform_at=at+len(raw)
            raw+=b'windows\0'+struct.pack('<QQ',0x140001000+platform_at-512,7)
            image[at:at+len(raw)]=raw
        return image
    def test_mapped_platform_descriptor_replaces_missing_dialog_adjacency(self):
        self.assertEqual(installed_version(self.platform_image()),'0.115.0')
    def display_image(self, version=b'0.127.0'):
        image=self.platform_image(version=version,copies=0)
        raw=version+b'\0'+struct.pack('<QQ',0x140001200,len(version))+b'\x01v\xc0\x02 (\xc0\x01)\0'
        image[1024:1024+len(raw)]=raw
        return image
    def test_mapped_display_descriptor_replaces_separated_platform(self):
        self.assertEqual(installed_version(self.display_image()),'0.127.0')
    def manual_update_image(self, version=b'0.139.0', display_version=None):
        image=self.platform_image(version=version,copies=0)
        image[512:600]=bytes(88)  # The former adjacent updater marker is gone.
        value=version if display_version is None else display_version
        # Newer Rust strings need not have a NUL between text and descriptor.
        image[1015:1024]=b'f79c5e2b4'
        raw=value+struct.pack('<QQ',0x140001200,len(value))+b'\x01v\xc0\x02 (\xc0\x01)\0'
        image[1024:1024+len(raw)]=raw
        marker='You\u2019re up to date (v{version}).version'.encode('utf-8')
        start=1536+len(marker)
        raw=marker+version+b'\0'+struct.pack('<QQ',0x140001000+start-512,len(version))
        image[1536:1536+len(raw)]=raw
        return image, start
    def test_independent_manual_update_and_nonterminated_display_slices(self):
        image,start=self.manual_update_image()
        self.assertEqual(installed_version(image),'0.139.0')
        display=platform_descriptor_versions(image,display=True,details=True)
        updater=platform_descriptor_versions(image,updater=True,details=True)
        self.assertEqual(display,[dict(version='0.139.0',file_offset=1024,byte_count=33,
                                      descriptor_offset=1031,kind='mapped_version_display_slice')])
        self.assertEqual(updater[0]['descriptor_offset'],start+8)
    def test_aligned_manual_update_slice_to_separate_updater_literal(self):
        image, start = self.manual_update_image(version=b'0.140.0')
        marker = image[1536:start]
        image[1536:1540] = bytes(4)
        image[1540:start + 4] = marker
        start += 4
        descriptor = (start + 7) & ~7
        literal_at = 2048
        literal = b'0.140.0WOW_ROGUE_UPDATE_AUTO'
        image[literal_at:literal_at + len(literal)] = literal
        image[start:descriptor + 16] = bytes(descriptor - start) + struct.pack(
            '<QQ', 0x140001000 + literal_at - 512, 7
        )
        self.assertEqual(installed_version(image), '0.140.0')
        self.assertEqual(platform_descriptor_versions(image, updater=True, details=True), [
            dict(version='0.140.0', file_offset=1540, byte_count=descriptor + 16 - 1540,
                 descriptor_offset=descriptor, kind='mapped_manual_update_remote_version_slice')
        ])
        for offset in (start, descriptor, descriptor + 8, literal_at + 6, literal_at + 7):
            with self.subTest(offset=offset), self.assertRaises(ValueError):
                changed = image.copy()
                changed[offset] ^= 1
                installed_version(changed)
    def test_manual_update_and_display_slices_are_fail_closed(self):
        image,_=self.manual_update_image(display_version=b'0.138.0')
        with self.assertRaises(ValueError):installed_version(image)
        image,start=self.manual_update_image();image[start+8]^=1
        with self.assertRaises(ValueError):installed_version(image)
        image,start=self.manual_update_image();image[start+16]=8
        with self.assertRaises(ValueError):installed_version(image)
        image,_=self.manual_update_image();image[1031]^=1
        with self.assertRaises(ValueError):installed_version(image)
        image,start=self.manual_update_image();image[start:start+7]=b'0.138.0'
        with self.assertRaises(ValueError):installed_version(image)
        image,start=self.manual_update_image();image[1536:start+24]=bytes(start+24-1536)
        with self.assertRaises(ValueError):installed_version(image)
    def test_manual_update_cannot_hide_legacy_identity_conflict(self):
        image,_=self.manual_update_image()
        image+=b'0.138.0\x1eupdate: up to date\0'
        with self.assertRaises(ValueError):installed_version(image)
    def test_display_identity_is_fail_closed(self):
        image=self.display_image();image[1032]^=1
        with self.assertRaises(ValueError):installed_version(image)
        image=self.display_image();image[512:519]=b'0.126.0'
        with self.assertRaises(ValueError):installed_version(image)
        image=self.display_image();image[1048]^=1
        with self.assertRaises(ValueError):installed_version(image)
        image=self.display_image();image[0x80:0x84]=b'NOPE'
        with self.assertRaises(ValueError):installed_version(image)
    def test_picker_revision_uses_native_pointer_and_exact_length(self):
        recovery = load_script("menu_identity", "recover-menu-identity.py")
        pe = load_script("inventory_pe", "inventory-executable.py").PE
        proof = load_json(ROOT / "docs/analysis/evidence/menu-identity/native.json")
        args = bytearray.fromhex(next(span["bytes_hex"] for span in proof["spans"]
                                       if span["role"] == "footer-format-arguments"))
        operands = recovery.FOOTER_ARGS.fullmatch(args)
        code_at, version_at = 2048, 1024
        for version, revision in (("0.142.0", b"1234abcd"), ("0.143.10", b"12ab34cde")):
            with self.subTest(version=version):
                image = self.display_image(version.encode("ascii"))
                struct.pack_into("<I", image, 0x1ac, 0x60000020)
                display, = platform_descriptor_versions(image, display=True, details=True)
                descriptor_at = display["descriptor_offset"]
                revision_at = version_at - len(revision)
                # The preceding hex byte belongs to another packed literal.
                image[revision_at - 1:version_at] = b"f" + revision
                for operand, offset in (("revision", revision_at), ("version", descriptor_at),
                                        ("format", descriptor_at + 16)):
                    struct.pack_into("<i", args, operands.start(operand),
                                     offset - code_at - operands.end(operand))
                struct.pack_into("<I", args, operands.start("length"), len(revision))
                image[code_at:code_at + len(args)] = args
                target = {"version": version, "sha256": "fixture"}
                self.assertEqual(recovery.recover(target, pe(image))["build_revision"],
                                 revision.decode("ascii"))
                image[code_at + operands.start("length")] += 1
                with self.assertRaisesRegex(ValueError, "footer arguments"):
                    recovery.recover(target, pe(image))
    def test_platform_identity_is_fail_closed(self):
        for image in (self.platform_image(platform_version=b'0.114.2'),
                      self.platform_image(copies=2),self.platform_image(copies=0)):
            with self.assertRaises(ValueError):installed_version(image)
        image=self.platform_image();image[1032]^=1
        with self.assertRaises(ValueError):installed_version(image)
        image=self.platform_image();image[0x80:0x84]=b'NOPE'
        with self.assertRaises(ValueError):installed_version(image)
    def test_legacy_dialog_conflict_cannot_be_hidden_by_platform(self):
        image=self.platform_image()+b'0.114.2A new version is out!'
        with self.assertRaises(ValueError):installed_version(image)
    def test_large_digit_table_has_linear_marker_search(self):
        image=b'9'*4_000_000+b'\0' + b'0.109.0\x1eupdate: up to date\0' + b'0.109.0A new version is out!'
        start=time.monotonic()
        self.assertEqual(installed_version(image),'0.109.0')
        self.assertLess(time.monotonic()-start,2.0)
if __name__=='__main__':unittest.main()
