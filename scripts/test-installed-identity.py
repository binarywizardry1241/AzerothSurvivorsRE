#!/usr/bin/env python3
"""Non-compiling version-marker regressions for binary identity checks."""
import re
import struct
import time
import unittest
from coverage_common import embedded_marker_versions, installed_version

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
    def test_display_identity_is_fail_closed(self):
        image=self.display_image();image[1032]^=1
        with self.assertRaises(ValueError):installed_version(image)
        image=self.display_image();image[512:519]=b'0.126.0'
        with self.assertRaises(ValueError):installed_version(image)
        image=self.display_image();image[1048]^=1
        with self.assertRaises(ValueError):installed_version(image)
        image=self.display_image();image[0x80:0x84]=b'NOPE'
        with self.assertRaises(ValueError):installed_version(image)
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
