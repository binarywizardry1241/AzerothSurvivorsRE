#!/usr/bin/env python3
"""Non-compiling checks of live-input drift and the read-only path boundary."""

import hashlib
import importlib.util
from pathlib import Path
import struct
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import coverage_common as common

spec = importlib.util.spec_from_file_location("register_installed", common.ROOT / "scripts/register-target.py")
registration = importlib.util.module_from_spec(spec)
spec.loader.exec_module(registration)


class InstalledReference(unittest.TestCase):
    def setUp(self):
        scratch = common.ROOT / "runtime/tests/reference"
        scratch.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(temporary.cleanup)
        base = Path(temporary.name)
        self.root, self.game = base / "project", base / "installed"
        self.root.mkdir()
        self.game.mkdir()
        self.data = self.game / "Data"
        self.data.mkdir()
        self.exe = self.game / "AzerothSurvivors.exe"
        config = self.root / "reference-game.json"
        config.write_text(common.json_text({"exe": str(self.exe), "data_dir": str(self.data)}))
        for key, value in (("ROOT", self.root), ("REGISTRY", self.root / "targets.json"), ("REFERENCE_CONFIG", config)):
            context = patch.object(common, key, value)
            context.start()
            self.addCleanup(context.stop)
        self.set_game("0.105.0")

    def set_game(self, version, extra=b""):
        self.exe.write_bytes(version.encode() + b"\x1eupdate: up to date\0" + version.encode() + b"A new version is out!" + extra)
        return common.installed_identity()

    def register_fixture(self):
        row = common.installed_identity()
        row["identity_manifest"] = "targets.json"
        row["runtime_data"] = {"directory": "installed-game/Data", "archives": []}
        common.REGISTRY.write_text(common.json_text({"schema_version": 1, "input_mode": "installed_game", "targets": [row]}))
        return row

    def test_external_inputs_resolve_but_outputs_stay_project_local(self):
        self.assertEqual(common.artifact_path("installed-game/AzerothSurvivors.exe"), self.exe)
        self.assertEqual(common.artifact_path("installed-game/Data/patch.MPQ"), self.data / "patch.MPQ")
        with self.assertRaisesRegex(ValueError, "Path leaves project"):
            common.project_path(self.exe)
        with self.assertRaisesRegex(ValueError, "outside the project"):
            common.artifact_path(self.game / "characters.txt")
        with self.assertRaisesRegex(ValueError, "Invalid installed-game"):
            common.artifact_path("installed-game/Data/../../characters.txt")

    def test_new_live_version_rejects_stale_project_copy(self):
        old = self.register_fixture()
        (self.root / "AzerothSurvivors-0.105.0.exe").write_bytes(self.exe.read_bytes())
        self.set_game("0.107.0")
        with self.assertRaisesRegex(ValueError, "Unregistered newer"):
            common.latest_target()
        self.assertEqual(common.latest_target(verify=False)["sha256"], old["sha256"])

    def test_same_version_new_bytes_invalidate_evidence(self):
        self.register_fixture()
        self.set_game("0.105.0", b"replacement")
        with self.assertRaisesRegex(ValueError, "Unregistered"):
            common.latest_target()

    def test_missing_live_exe_has_no_project_fallback(self):
        self.register_fixture()
        (self.root / "AzerothSurvivors-0.105.0.exe").write_bytes(self.exe.read_bytes())
        self.exe.unlink()
        with self.assertRaises(OSError):
            common.latest_target()

    def test_bytes_are_verified_after_resolution(self):
        row = self.register_fixture()
        self.assertEqual(common.target_bytes(common.latest_target()), self.exe.read_bytes())
        self.set_game("0.105.0", b"changed during analysis")
        with self.assertRaisesRegex(ValueError, "changed while reading"):
            common.target_bytes(row)

    def test_actual_resource_hashes_and_membership_are_checked(self):
        archive = self.data / "patch.MPQ"
        archive.write_bytes(b"archive")
        row = {"runtime_data": {"directory": "installed-game/Data", "archives": [{"path": "installed-game/Data/patch.MPQ", "size_bytes": 7, "sha256": hashlib.sha256(b"archive").hexdigest()}]}}
        self.assertEqual(common.verify_resources(row), 1)
        (self.data / "patch-2.MPQ").write_bytes(b"new patch")
        with self.assertRaisesRegex(ValueError, "chain changed"):
            common.verify_resources(row)
        (self.data / "patch-2.MPQ").unlink()
        archive.write_bytes(b"changed")
        with self.assertRaisesRegex(ValueError, "resource missing/changed"):
            common.verify_resources(row)

    def test_disagreeing_embedded_versions_require_manual_recovery(self):
        self.exe.write_bytes(b"0.105.0\x1eupdate: up to date\0" + b"0.107.0A new version is out!")
        with self.assertRaisesRegex(ValueError, "markers are absent, ambiguous or disagree"):
            common.installed_identity()

    def test_registration_reads_the_external_pe_and_mpqs_without_writes(self):
        # Minimal PE32+ header; no executable code or compiler is involved.
        header = bytearray(512)
        header[:2] = b"MZ"
        struct.pack_into("<I", header, 0x3c, 0x80)
        header[0x80:0x84] = b"PE\0\0"
        struct.pack_into("<H", header, 0x84, 0x8664)
        struct.pack_into("<H", header, 0x94, 240)
        struct.pack_into("<H", header, 0x98, 0x20b)
        self.exe.write_bytes(header + self.exe.read_bytes())
        (self.data / "patch.MPQ").write_bytes(b"mpq fixture")
        before = {path: path.read_bytes() for path in self.game.rglob("*") if path.is_file()}
        args = SimpleNamespace(installed=True, exe=None, manifest=None, data_dir=None, version=None)
        record = registration.candidate_record(args)
        self.assertEqual(record["path"], "installed-game/AzerothSurvivors.exe")
        self.assertEqual(record["version"], "0.105.0")
        self.assertEqual(record["runtime_data"]["archives"][0]["path"], "installed-game/Data/patch.MPQ")
        self.assertEqual(common.verify_resources(record), 1)
        self.assertEqual(before, {path: path.read_bytes() for path in self.game.rglob("*") if path.is_file()})
        self.assertFalse(common.REGISTRY.exists())


if __name__ == "__main__":
    unittest.main()
