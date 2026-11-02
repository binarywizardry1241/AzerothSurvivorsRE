#!/usr/bin/env python3
"""Exercise source-snapshot and native-equality replay rejection boundaries."""
from copy import deepcopy
import importlib.util
from pathlib import Path
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("switch_metadata_replay", ROOT / "scripts/replay-switch-correspondence.py")
replay = importlib.util.module_from_spec(spec)
spec.loader.exec_module(replay)


class ReplayGuards(unittest.TestCase):
    def fixture(self):
        retained = dict(target=dict(sha256="a" * 64), predecessor=dict(path="prior.json", sha256="b" * 64),
            leads={"stable": dict(current_source_receipts=[dict(path="source.rs", sha256="c" * 64)],
                current_native_candidate=dict(virtual_address="0x1000"), semantic_recovery_reset=False)})
        generated = deepcopy(retained)
        generated["leads"]["stable"]["current_source_receipts"][0]["sha256"] = "d" * 64
        return generated, retained

    def test_original_source_receipt_is_preserved(self):
        generated, retained = self.fixture()
        original = deepcopy(retained)
        replay.preserve_sources(generated, retained)
        self.assertEqual(generated, retained)
        self.assertEqual(retained, original)

    def test_only_published_witness_references_may_differ(self):
        generated, retained = self.fixture()
        retained["leads"]["stable"]["current_candidate_proof"] = dict(evidence=dict(path="old-CAS", sha256="f" * 64))
        replay.preserve_sources(generated, retained)
        self.assertEqual(generated["leads"]["stable"]["current_source_receipts"],
                         retained["leads"]["stable"]["current_source_receipts"])

    def test_changed_native_payload_is_rejected(self):
        generated, retained = self.fixture()
        generated["leads"]["stable"]["current_native_candidate"]["virtual_address"] = "0x1001"
        with self.assertRaisesRegex(ValueError, "native or historical question changed"):
            replay.preserve_sources(generated, retained)

    def test_wrong_snapshot_target_is_rejected(self):
        generated, retained = self.fixture()
        retained["target"]["sha256"] = "e" * 64
        with self.assertRaisesRegex(ValueError, "snapshot target differs"):
            replay.preserve_sources(generated, retained)

    def test_source_path_substitution_is_rejected(self):
        generated, retained = self.fixture()
        retained["leads"]["stable"]["current_source_receipts"][0]["path"] = "other.rs"
        with self.assertRaisesRegex(ValueError, "source path set differs"):
            replay.preserve_sources(generated, retained)

    def test_wrong_snapshot_bytes_are_rejected(self):
        with tempfile.TemporaryDirectory(prefix="switch-replay-guard-", dir=ROOT / "runtime") as folder:
            path = Path(folder) / "source-snapshot.json"
            path.write_text('{"snapshot":"original"}\n')
            with self.assertRaisesRegex(ValueError, "initial snapshot differs"):
                replay.original(dict(path=path.relative_to(ROOT).as_posix(), sha256="f" * 64))

    def test_publication_keeps_context_counts_and_source_snapshots(self):
        _, retained = self.fixture()
        retained["complete_AS_context_reconciliation"] = dict(counts=dict(tables=45), evidence=dict(path="old"))
        metadata_only = deepcopy(retained)
        metadata_only["inputs"] = [dict(path="new-metadata")]
        metadata_only["complete_AS_context_reconciliation"]["evidence"] = dict(path="new")
        self.assertEqual(replay.publication_payload(metadata_only), replay.publication_payload(retained))
        metadata_only["complete_AS_context_reconciliation"]["counts"]["tables"] = 44
        self.assertNotEqual(replay.publication_payload(metadata_only), replay.publication_payload(retained))
        changed_source = deepcopy(retained)
        changed_source["leads"]["stable"]["current_source_receipts"][0]["sha256"] = "d" * 64
        self.assertNotEqual(replay.publication_payload(changed_source), replay.publication_payload(retained))


if __name__ == "__main__":
    unittest.main()
