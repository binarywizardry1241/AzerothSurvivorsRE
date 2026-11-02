#!/usr/bin/env python3
"""Non-compiling fixtures for whole-PE/raw-slice discovery query admission."""
import copy
import hashlib
import json
from pathlib import Path
from types import SimpleNamespace
import tempfile
import unittest

from discovery_native_subject import verify_native_query_subject


ROOT = Path(__file__).resolve().parents[1]


class NativeSubjectTests(unittest.TestCase):
    def setUp(self):
        directory = ROOT / "runtime/tests/discovery-native-subject"
        directory.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=directory)
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name).resolve()
        self.image = bytes(range(64))
        self.raw = self.image[8:24]
        (self.root / "slice.bin").write_bytes(self.raw)
        self.base = 0x140100000
        self.pe = SimpleNamespace(image_base=self.base, rva_offset=lambda rva: rva)
        self.target = dict(version="fixture", sha256=self.sha(self.image), size_bytes=len(self.image))
        self.provider = dict(id="ghidra", name="Ghidra", version="fixture")
        self.options = dict(format="raw-binary", architecture="x86_64", entry_point=hex(self.base + 8))
        self.arguments = dict(procedure=hex(self.base + 10))
        self.native = dict(evidence_id="ev_fixture", operation="procedure_pseudo_code", parameters=self.arguments,
                           subject=dict(format="raw-binary", architecture="x86_64",
                                        local_path=str(self.root / "slice.bin"), digest=dict(sha256=self.sha(self.raw))),
                           provider=self.provider,
                           analysis_profile=dict(digest="profile", provider=self.provider,
                                                 parameters=dict(target_format="raw-binary", architecture="x86_64",
                                                                 entry_point=hex(self.base + 8))))
        self.operation = dict(name="procedure_pseudo_code", arguments=self.arguments)
        self.plan = dict(target="slice.bin", open_options=copy.deepcopy(self.options), operations=[self.operation])
        self.query = dict(procedure=self.arguments["procedure"], evidence_id="ev_fixture", provider=self.provider,
                          analysis_profile_digest="profile", slice_virtual_address=hex(self.base + 8),
                          raw_input=self.receipt("slice.bin"))
        self.journal = dict(status="completed", identity=dict(
            target=dict(path=str(self.root / "slice.bin"), sha256=self.sha(self.raw), size_bytes=len(self.raw)),
            open_options=dict(provider_id="ghidra", **self.options)), operations={})
        self.seal()

    @staticmethod
    def sha(raw):
        return hashlib.sha256(raw).hexdigest()

    def receipt(self, name):
        return dict(path=name, sha256=self.sha((self.root / name).read_bytes()))

    def write_json(self, name, value):
        (self.root / name).write_text(json.dumps(value) + "\n")
        return self.receipt(name)

    def seal(self):
        self.query["plan"] = self.write_json("plan.json", self.plan)
        self.query["result"] = self.write_json("result.json", dict(structuredContent=self.native))
        self.journal["identity"]["plan"] = dict(plan_path="plan.json", plan_sha256=self.query["plan"]["sha256"],
                                                  operations=self.plan["operations"])
        self.journal["identity_sha256"] = self.sha(json.dumps(self.journal["identity"], sort_keys=True,
                                                              separators=(",", ":")).encode())
        self.journal["operations"] = dict(one=dict(**self.operation, status="completed", result=self.query["result"]))
        self.query["journal"] = self.write_json("journal.json", self.journal)

    def verify(self, **kwargs):
        return verify_native_query_subject(self.root, self.native, self.query, self.target,
                                           image=self.image, pe=self.pe, **kwargs)

    def test_whole_pe_preserved(self):
        self.native = dict(subject=dict(format="pe", digest=dict(sha256=self.target["sha256"])))
        self.assertEqual(self.verify()["kind"], "whole_selected_PE")

    def test_exact_raw_slice(self):
        result = self.verify()
        self.assertEqual(result["file_offset"], "0x8")
        self.assertFalse(result["semantic_or_runtime_correspondence_established"])

    def test_wrong_parent_target(self):
        self.target["sha256"] = "f" * 64
        with self.assertRaisesRegex(ValueError, "parent target"):
            self.verify()

    def test_wrong_slice_hash(self):
        self.native["subject"]["digest"]["sha256"] = "f" * 64
        with self.assertRaisesRegex(ValueError, "subject digest"):
            self.verify()

    def test_wrong_slice_bytes_with_rebound_receipts(self):
        (self.root / "slice.bin").write_bytes(b"x" * len(self.raw))
        self.query["raw_input"] = self.receipt("slice.bin")
        self.native["subject"]["digest"]["sha256"] = self.query["raw_input"]["sha256"]
        with self.assertRaisesRegex(ValueError, "bytes/base"):
            self.verify()

    def test_wrong_base(self):
        self.query["slice_virtual_address"] = hex(self.base + 9)
        with self.assertRaisesRegex(ValueError, "bytes/base"):
            self.verify()

    def test_noncontiguous_pe_mapping(self):
        self.pe.rva_offset = lambda rva: rva + (1 if rva == 23 else 0)
        with self.assertRaisesRegex(ValueError, "bytes/base"):
            self.verify()

    def test_wrong_architecture(self):
        self.native["subject"]["architecture"] = "x86"
        with self.assertRaisesRegex(ValueError, "explicit x86_64"):
            self.verify()

    def test_procedure_outside_slice(self):
        self.query["procedure"] = hex(self.base + 32)
        with self.assertRaisesRegex(ValueError, "outside"):
            self.verify()

    def test_wrong_plan_mapping_with_valid_receipt(self):
        self.plan["open_options"]["entry_point"] = hex(self.base)
        self.seal()
        with self.assertRaisesRegex(ValueError, "plan/journal"):
            self.verify()

    def test_wrong_result_mapping_with_valid_receipts(self):
        self.native["analysis_profile"]["parameters"]["entry_point"] = hex(self.base)
        self.seal()
        with self.assertRaisesRegex(ValueError, "analysis mapping"):
            self.verify()

    def test_wrong_result_identity_with_valid_receipts(self):
        self.native["evidence_id"] = "ev_other"
        self.seal()
        with self.assertRaisesRegex(ValueError, "identity/provider/profile"):
            self.verify()

    def test_result_receipt_mismatch(self):
        (self.root / "result.json").write_text("{}")
        with self.assertRaisesRegex(ValueError, "receipt hash"):
            self.verify()

    def test_journal_identity_mismatch(self):
        self.journal["identity_sha256"] = "f" * 64
        self.query["journal"] = self.write_json("journal.json", self.journal)
        with self.assertRaisesRegex(ValueError, "commit to this plan"):
            self.verify()

    def test_unfinished_operation(self):
        self.journal["operations"]["one"]["status"] = "pending"
        self.query["journal"] = self.write_json("journal.json", self.journal)
        with self.assertRaisesRegex(ValueError, "completed plan/journal"):
            self.verify()

    def test_different_result_in_completed_journal(self):
        self.journal["operations"]["one"]["result"] = dict(path="other.json", sha256="f" * 64)
        self.query["journal"] = self.write_json("journal.json", self.journal)
        with self.assertRaisesRegex(ValueError, "completed plan/journal"):
            self.verify()

    def test_wrong_plan_operation(self):
        self.plan["operations"] = [dict(name="procedure_pseudo_code", arguments=dict(procedure=hex(self.base + 11)))]
        self.seal()
        with self.assertRaisesRegex(ValueError, "completed plan/journal"):
            self.verify()


if __name__ == "__main__":
    unittest.main()
