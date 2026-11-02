#!/usr/bin/env python3
"""Check report portability without native inputs, compilation or tool execution."""
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import portable_paths as paths
from script_sources import load_script

distribution = load_script("distribution_paths", "check-project-portability.py")


class PortablePaths(unittest.TestCase):
    def test_nested_report_preserves_hashes_and_original_record(self):
        root = Path("/workspace/project")
        raw = {"subject": {"local_path": str(root / "runtime/slice.bin"), "sha256": "a" * 64},
               "limitations": [f"Seeded from {root}/runtime/seeds.tsv (sha256 b)."]}
        with patch.object(Path, "is_file", return_value=False):
            result = paths.portable_record(raw, root)
        self.assertEqual(result["subject"], {"local_path": "runtime/slice.bin", "sha256": "a" * 64})
        self.assertEqual(result["limitations"], ["Seeded from runtime/seeds.tsv (sha256 b)."])
        self.assertEqual(raw["subject"]["local_path"], str(root / "runtime/slice.bin"))

    def test_complete_prefix_boundaries_and_relative_paths(self):
        with patch.object(Path, "is_file", return_value=False):
            root = Path("/workspace/project")
            self.assertEqual(paths.portable_text(str(root), root), ".")
            self.assertEqual(paths.portable_text(f"`{root}`", root), "`.`")
            self.assertEqual(paths.portable_text(str(root) + "-other/file", root), str(root) + "-other/file")
            self.assertEqual(paths.portable_text("docs/input.asm", root), "docs/input.asm")

    def test_checkout_locations_with_spaces_and_serialization_options(self):
        with patch.object(Path, "is_file", return_value=False):
            root = Path("/workspace/project with spaces")
            self.assertEqual(paths.portable_text(f"{root}/docs/input.asm", root), "docs/input.asm")
        result = paths.portable_json({"path": str(paths.ROOT / "docs/input.asm"), "label": "é"}, ensure_ascii=False)
        self.assertEqual(json.loads(result), {"path": "docs/input.asm", "label": "é"})
        self.assertTrue(paths.portable_json_text({"field": 1}).endswith("\n"))

    def test_configured_inputs_keep_portable_identities(self):
        # The temporary input configuration is project-local and cleaned on exit.
        runtime = paths.ROOT / "runtime"
        if not runtime.exists():
            runtime.mkdir()
            self.addCleanup(runtime.rmdir)
        with tempfile.TemporaryDirectory(dir=runtime) as scratch:
            root = Path(scratch)
            config = root / ".codex/reference-game.json"
            config.parent.mkdir()
            config.write_text(json.dumps({"exe": "/reference/Game.exe", "data_dir": "/reference/Data"}))
            result = paths.portable_record({"exe": "/reference/Game.exe", "archive": "/reference/Data/a.MPQ"}, root)
            self.assertEqual(result, {"exe": "installed-game/AzerothSurvivors.exe", "archive": "installed-game/Data/a.MPQ"})

    def test_objdump_normalizes_text_and_bytes_before_hashing(self):
        raw = f"\n{paths.ROOT}/AzerothSurvivors/old.exe:\tfile format coff-x86-64\n1400: retq\n"
        for output in (raw, raw.encode()):
            with patch.object(paths.subprocess, "check_output", return_value=output):
                result = paths.objdump_output(["objdump", "-d", "input"])
            expected = "\nAzerothSurvivors/old.exe:\tfile format coff-x86-64\n1400: retq\n"
            self.assertEqual(result, expected if isinstance(output, str) else expected.encode())

    def test_binary_objdump_preserves_unrelated_non_utf8_bytes(self):
        output = b"instruction label: \xff\n"
        with patch.object(paths.subprocess, "check_output", return_value=output):
            self.assertEqual(paths.objdump_output(["objdump", "-d", "input"]), output)

    def test_escaped_source_paths_are_recognized_inside_annotations(self):
        for separator in (chr(92), chr(92) * 2, "/"):
            value = "annotation:C:" + separator + "Users" + separator + "example" + separator + "source.rs"
            self.assertEqual(distribution.WINDOWS_HOME_PATH.search(value)[1], "example")


if __name__ == "__main__":
    unittest.main()
