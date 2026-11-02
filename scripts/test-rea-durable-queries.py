#!/usr/bin/env python3
"""Source-only exact-package repair and durable search checkpoint safeguards."""
import importlib.util
from pathlib import Path
import unittest
import subprocess
import sys
ROOT=Path(__file__).resolve().parents[1]
def module(name,file):
    spec=importlib.util.spec_from_file_location(name,ROOT/'scripts'/file)
    result=importlib.util.module_from_spec(spec);spec.loader.exec_module(result);return result
repair=module('durable_repair','repair-rea-durable-queries.py')
class DurableRepair(unittest.TestCase):
    def test_check_is_silent_for_mcp_transport(self):
        result=subprocess.run([sys.executable,'-B',str(ROOT/'scripts/repair-rea-durable-queries.py'),'--check'],cwd=ROOT,capture_output=True,text=True)
        self.assertEqual(0,result.returncode,result.stderr)
        self.assertEqual('',result.stdout)
        self.assertEqual('',result.stderr)
    def test_all_paths_are_patched_and_idempotent(self):
        self.assertEqual(7,len(repair.changes()))
        self.assertFalse(any(changed for _,_,changed in repair.changes()))
    def test_native_and_reference_guards_still_hold(self):
        native=module('native_repair','repair-rea-native-census.py')
        self.assertFalse(native.changes()[2])
        reference=module('reference_repair','repair-rea-reference-input.py')
        self.assertFalse(any(changed for _,_,changed in reference.changes()))
    def test_unknown_and_partial_launcher_fail_closed(self):
        source=(repair.PACKAGE/'dist/ghidra/GhidraLauncher.js').read_text()
        self.assertEqual(source,repair.add_launcher(repair.strip_launcher(source)))
        with self.assertRaises(ValueError):repair.strip_launcher(source.replace(repair.END,''))
        with self.assertRaises(ValueError):repair.guard('changed dependency','0'*64,'fixture')
    def test_profile_declares_changed_semantics(self):
        source=(repair.PACKAGE/'dist/ghidra/GhidraAnalysisProfile.js').read_text()
        self.assertEqual(2,source.count('durable_queries: durableQueries'))
        self.assertIn('persistent-source-immutable-v1',source)
        self.assertIn('!process.env.REA_NATIVE_CENSUS_PLAN',source)
    def test_search_cursor_cannot_skip_a_missing_batch(self):
        source=(ROOT/'scripts/ghidra/ReaDurableQueryBridge.fragment.java').read_text()
        self.assertIn('if(next!=committed)',source)
        self.assertIn('getAsInt()!=committed',source)
        self.assertIn('Search batch commitment differs',source)
        self.assertIn('inventory_sha256',source)
    def test_completion_is_saved_before_publication(self):
        source=(ROOT/'scripts/ghidra/ReaDurableQueryBridge.fragment.java').read_text()
        start=source.index('private JsonElement durableHandleRequest')
        tail=source[start:source.index('private JsonArray durableSearch',start)]
        self.assertLess(tail.index('durableSave();'),tail.index('durableWrite(resultPath,saved)'))
        self.assertIn('DURABLE_MUTATIONS.contains',tail)
        self.assertIn('result_sha256',tail)
        self.assertIn('analyzed_ready',source)
        self.assertIn('static_queries_only',source)
        prepare=(ROOT/'scripts/ghidra/ReaDurableQueryPrepare.java').read_text()
        self.assertIn('External ready marker is not authoritative',prepare)
        self.assertLess(prepare.index('enableHeadlessAnalysis(false);'),prepare.index('prepare();'))
        self.assertIn('getStoredHeadlessValue("REA durable prepared "+descriptor.runId)',source)
        self.assertLess(tail.index('++durableRevision'),tail.index('JsonElement result=handleRequest'))
        self.assertIn('NOFOLLOW_LINKS',source)
    def test_saved_projects_are_never_disposable(self):
        source=(ROOT/'scripts/rea-durable-queries.mjs').read_text()
        self.assertNotIn('HOME:paths.home',source)
        self.assertIn('Never reimport/overwrite',source)
        self.assertIn('cleanupOwnedProcessGroup(owned)',source)
        self.assertIn('canonical(resolved.tooling)!==canonical(expectedTools)',source)
if __name__=='__main__':unittest.main()
