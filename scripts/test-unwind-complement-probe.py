#!/usr/bin/env python3
"""Non-compiling deterministic native-probe selection regressions."""

import importlib.util
import hashlib
from pathlib import Path
import sqlite3
import unittest

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('complement_probe',ROOT/'scripts/prepare-unwind-complement-probe.py')
probe=importlib.util.module_from_spec(spec)
spec.loader.exec_module(probe)
spec=importlib.util.spec_from_file_location('complement_curator',ROOT/'scripts/curate-unwind-complement-probe.py')
curator=importlib.util.module_from_spec(spec)
spec.loader.exec_module(curator)


class ProbeSelection(unittest.TestCase):
    def setUp(self):
        self.connection=sqlite3.connect(':memory:')
        self.addCleanup(self.connection.close)
        self.connection.executescript('CREATE TABLE regions(start,end,file_offset,sha256); CREATE TABLE seeds(target);')

    def region(self,start,end,targets,offset=0):
        self.connection.execute('INSERT INTO regions VALUES(?,?,?,?)',(start,end,offset,'fixture'))
        self.connection.executemany('INSERT INTO seeds VALUES(?)',((a,) for a in targets))

    def test_total_incoming_leads_select_region_not_distinct_seed_count(self):
        self.region(100,110,[100,101,102])
        self.region(200,210,[200]*4)
        selected,addresses=probe.select(self.connection)
        self.assertEqual(selected['address'],hex(200))
        self.assertEqual(addresses,[200])
        self.assertEqual(selected['incoming_leads'],4)

    def test_equal_lead_counts_select_lowest_address_and_sort_unique_seeds(self):
        self.region(200,210,[202,200,202])
        self.region(100,110,[103,100,103])
        self.assertEqual(probe.select(self.connection)[1],[100,103])

    def test_virtual_zero_fill_is_not_a_raw_probe(self):
        self.region(100,110,[100]*5,offset=None)
        self.region(200,210,[200])
        self.assertEqual(probe.select(self.connection)[1],[200])

    def test_missing_seeds_are_explicit(self):
        with self.assertRaisesRegex(ValueError,'No seeded'):
            probe.select(self.connection)

    def test_changed_larger_region_requires_scope_review(self):
        self.region(100,100+65537,[100])
        with self.assertRaisesRegex(ValueError,'bound'):
            probe.select(self.connection)

    def test_more_than_128_distinct_seeds_requires_scope_review(self):
        self.region(100,300,list(range(100,229)))
        with self.assertRaisesRegex(ValueError,'bound'):
            probe.select(self.connection)

    def test_curation_rejects_removed_entry_even_with_unchanged_recorded_digest(self):
        digest=hashlib.sha256(b'0x1000\tfunction\n0x1000\tcode\n0x1010\tfunction\n0x1010\tcode\n').hexdigest()
        selection=dict(seeds=['0x1000','0x1010'],seed_sha256=digest)
        curator.validate_seeds(selection,digest)
        with self.assertRaisesRegex(ValueError,'actual Ghidra seeds'):
            curator.validate_seeds({**selection,'seeds':['0x1000']},digest)


if __name__=='__main__':
    unittest.main()
