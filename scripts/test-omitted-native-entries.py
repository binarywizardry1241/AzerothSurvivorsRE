#!/usr/bin/env python3
"""Static omitted-entry bounds regressions; no provider/compiler/target runs."""
import importlib.util
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("omitted", ROOT / "scripts/prepare-omitted-native-entries.py")
omitted = importlib.util.module_from_spec(spec)
spec.loader.exec_module(omitted)


class OmittedEntries(unittest.TestCase):
    def test_selection_uses_exact_absent_addresses_and_preserves_unwind_identity(self):
        records = [(10, 20, 99), (30, 31, 100), (40, 60, 101)]
        missing, start, end = omitted.omitted_entries(records, {110, 140}, 100)
        self.assertEqual((missing, start, end), ([(30, 31, 100)], 30, 31))

    def test_a_legitimate_one_byte_entry_is_not_discarded(self):
        self.assertEqual(omitted.omitted_entries([(10, 11, 99)], set(), 100)[0], [(10, 11, 99)])

    def test_no_missing_entries_requires_no_native_probe(self):
        with self.assertRaisesRegex(ValueError, "selection must have"):
            omitted.omitted_entries([(10, 20, 99)], {110}, 100)

    def test_bounded_replay_rejects_widely_separated_or_excessive_entries(self):
        with self.assertRaisesRegex(ValueError, "bounded contiguous range"):
            omitted.omitted_entries([(10, 20, 0), (100000, 100001, 0)], set(), 100)
        with self.assertRaisesRegex(ValueError, "selection must have"):
            omitted.omitted_entries([(i, i + 1, 0) for i in range(129)], set(), 100)

    def test_invalid_zero_or_reverse_extents_fail_closed(self):
        for records in ([(10, 10, 0)], [(10, 9, 0)]):
            with self.assertRaisesRegex(ValueError, "invalid extents"):
                omitted.omitted_entries(records, set(), 100)


if __name__ == "__main__":
    unittest.main()
