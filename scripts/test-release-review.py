#!/usr/bin/env python3
"""Non-compiling admission regressions for the selected release-review proof.

Mutations are in memory; the installed EXE, source and curated proof are untouched.
"""
import copy
import json
import unittest

from coverage_common import ROOT
from script_sources import load_script

checker = load_script("release_review_checker", ROOT / "scripts/check-release-review.py")


class PopulationAdmission(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.proof = json.loads(checker.EVIDENCE.read_text())

    def test_current_reviewed_population_is_admitted(self):
        checker.validate_populations(self.proof)

    def test_duplicate_and_truncated_populations_are_rejected(self):
        for field in ["cosmetics", "companions", "achievement_text", "source_receipts", "query_receipts"]:
            for mutation in ["duplicate", "truncate", "empty"]:
                with self.subTest(field=field, mutation=mutation):
                    proof = copy.deepcopy(self.proof)
                    if mutation == "duplicate":
                        proof[field][-1] = copy.deepcopy(proof[field][0])
                    elif mutation == "truncate":
                        proof[field].pop()
                    else:
                        proof[field] = []
                    with self.assertRaises(ValueError):
                        checker.validate_populations(proof)

    def test_duplicate_and_truncated_native_sites_are_rejected(self):
        for mutation in ["duplicate", "truncate", "empty"]:
            with self.subTest(mutation=mutation):
                proof = copy.deepcopy(self.proof)
                rows = proof["native_leads"]["rip_relative_lea_matches"]
                if mutation == "duplicate":
                    rows[-1] = copy.deepcopy(rows[0])
                elif mutation == "truncate":
                    rows.pop()
                else:
                    rows.clear()
                with self.assertRaises(ValueError):
                    checker.validate_populations(proof)

    def test_repeated_table_copy_cannot_replace_missing_copy(self):
        for field in ["cosmetics", "companions", "tabard"]:
            with self.subTest(field=field):
                proof = copy.deepcopy(self.proof)
                row = proof[field] if field == "tabard" else proof[field][0]
                row["records"][-1] = copy.deepcopy(row["records"][0])
                with self.assertRaises(ValueError):
                    checker.validate_populations(proof)

    def test_valid_other_span_cannot_substitute_a_reviewed_literal(self):
        proof = copy.deepcopy(self.proof)
        proof["literals"][0] = copy.deepcopy(proof["literals"][1])
        with self.assertRaisesRegex(ValueError, "literals reviewed population"):
            checker.validate_populations(proof)

    def test_receipt_cannot_be_rebound_while_retaining_its_identity(self):
        for field, mutate in [
            ("source_receipts", lambda p: p["source_receipts"][0].update(sha256="0" * 64)),
            ("query_receipts", lambda p: p["query_receipts"][0].update(result_sha256="0" * 64)),
            ("query_receipts", lambda p: p["query_receipts"][0].update(analysis_profile_digest="0" * 64)),
            ("cosmetics", lambda p: p["cosmetics"][0]["records"][0].update(file_offset="0x75c9980")),
            ("release_items", lambda p: p["release_items"][0].update(text="Substituted release statement")),
        ]:
            with self.subTest(field=field, mutation=mutate):
                proof = copy.deepcopy(self.proof)
                mutate(proof)
                with self.assertRaises(ValueError):
                    checker.validate_populations(proof)

    def test_required_population_cannot_be_omitted(self):
        for field in checker.POPULATION_DIGESTS:
            with self.subTest(field=field):
                proof = copy.deepcopy(self.proof)
                del proof[field]
                with self.assertRaises(ValueError):
                    checker.validate_populations(proof)


if __name__ == "__main__":
    unittest.main()
