#!/usr/bin/env python3
"""Non-compiling admission checks for the supported MPQ source projection."""
import unittest

from coverage_common import ROOT
from script_sources import load_script

tool = load_script('tested_current_mpq_inventory', ROOT / 'scripts/inventory-current-mpq-members.py')


def target(*names):
    return {'runtime_data': {'directory': 'installed-game/Data', 'archives': [
        {'path': 'installed-game/Data/' + name} for name in names]}}


class SourceProjectionAdmission(unittest.TestCase):
    def test_case_folded_patch_order_places_base_patch_before_numbered_and_lettered(self):
        selected = target('patch-A.MPQ', 'patch-9.MPQ', 'PATCH.MPQ', 'patch-2.MPQ')
        names = [row['path'].split('/')[-1] for row in tool.supported_source_order(selected)]
        self.assertEqual(names, ['PATCH.MPQ', 'patch-2.MPQ', 'patch-9.MPQ', 'patch-A.MPQ'])

    def test_unreviewed_source_domains_cannot_receive_invented_precedence(self):
        for name in ('model.MPQ', 'speech2.MPQ', 'patch-10.MPQ', 'backup/patch-2.MPQ', 'patch-Ä.MPQ'):
            with self.subTest(name=name), self.assertRaisesRegex(ValueError, 'outside reviewed'):
                tool.supported_source_order(target('patch.MPQ', name))

    def test_case_alias_or_duplicate_archive_cannot_change_winning_record(self):
        for names in [('patch-A.MPQ', 'PATCH-a.mpq'), ('patch.MPQ', 'patch.MPQ')]:
            with self.subTest(names=names), self.assertRaisesRegex(ValueError, 'Ambiguous'):
                tool.supported_source_order(target(*names))


if __name__ == '__main__':
    unittest.main()
