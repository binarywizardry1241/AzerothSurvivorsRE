#!/usr/bin/env python3
"""Exercise runtime migration without native analysis or application builds."""

from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from runtime_layout import ROOT, destination, loose_entries, owned_runtime_path, retained_runtime_path
from script_sources import load_script
from shared_analysis import SharedAnalysis

manager = load_script("runtime_layout_manager", "manage-runtime-layout.py")


class RuntimeLayout(unittest.TestCase):
    def setUp(self):
        scratch = ROOT / "runtime/tmp"
        scratch.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=scratch)
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.store = SharedAnalysis(self.root)

    def test_migration_preserves_alias_bytes_and_external_readers(self):
        source = self.root / "runtime/coop-example-0.141.0/result.json"
        receipt = self.store.put_bytes(b'{"answer":1}\n')
        self.store.link_alias(source, receipt)
        reader = self.root / "runtime/coverage/retained-result.json"
        reader.parent.mkdir()
        reader.symlink_to("../coop-example-0.141.0/result.json")

        self.assertEqual(manager.apply(self.root, check_processes=False), (1, 1))
        location = retained_runtime_path(source, self.root)
        self.assertEqual(location.parent, self.root / destination(source.parent.name, True))
        self.assertEqual(location.read_bytes(), b'{"answer":1}\n')
        self.assertEqual(reader.resolve(), location.resolve())
        self.assertFalse(source.parent.exists())
        self.assertEqual(loose_entries(self.root), [])
        self.assertEqual(self.store.verify()["aliases"], 1)
        self.assertEqual(manager.apply(self.root, check_processes=False), (0, 0))

    def test_interrupted_alias_update_can_resume(self):
        source = self.root / "runtime/fixgap-example-0.141.0/result.json"
        self.store.link_alias(source, self.store.put_bytes(b"proof"))
        real_readlink = manager.os.readlink
        destination_path = self.root / destination(source.parent.name, True) / source.name

        def interrupted(path, *args, **kwargs):
            if Path(path) == destination_path:
                raise OSError("interrupted before alias rebase")
            return real_readlink(path, *args, **kwargs)

        with patch.object(manager.os, "readlink", side_effect=interrupted):
            with self.assertRaisesRegex(OSError, "interrupted"):
                manager.apply(self.root, check_processes=False)
        self.assertTrue((self.root / manager.PENDING).is_file())
        self.assertEqual(manager.apply(self.root, check_processes=False), (1, 1))
        self.assertEqual(retained_runtime_path(source, self.root).read_bytes(), b"proof")

    def test_new_loose_output_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "canonical runtime owner"):
            owned_runtime_path(self.root / "runtime/fixgap-next", self.root)
        path = self.root / "runtime/analysis/tasks/raid"
        self.assertEqual(owned_runtime_path(path, self.root), path)


if __name__ == "__main__":
    unittest.main()
