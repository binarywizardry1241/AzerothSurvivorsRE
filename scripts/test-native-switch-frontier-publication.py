#!/usr/bin/env python3
"""Check evidence publication failure/replay boundaries without native analysis."""
import hashlib
from copy import deepcopy
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest import mock

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("switch_frontier", ROOT / "scripts/review-native-switch-frontier.py")
frontier = importlib.util.module_from_spec(spec)
spec.loader.exec_module(frontier)


class PublicationTests(unittest.TestCase):
    def setUp(self):
        self.scratch = ROOT / "runtime/switch-frontier-publication-tests"
        self.scratch.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=self.scratch)
        self.root = Path(self.temporary.name)
        self.input = self.root / "runtime/input.json"
        self.input.parent.mkdir(parents=True)
        self.input.write_bytes(b'{"input":"verified"}\n')
        self.commitments = [{"path": "runtime/input.json", "sha256": hashlib.sha256(self.input.read_bytes()).hexdigest()}]
        self.target = {"version": "0.120.5", "sha256": "f" * 64}
        self.directory = self.root / "docs/analysis/evidence/0.120.5"

    def tearDown(self):
        self.temporary.cleanup()
        try:
            self.scratch.rmdir()
        except OSError:
            pass

    def publish(self, revision):
        full = {"target": self.target, "generator": {"fixture": True},
                "records": [{"fixture_revision": revision}], "input_commitments": self.commitments}
        compact = {"target": self.target, "counts": {"fixture_revision": revision}}
        correspondence = {"target": self.target, "leads": {"fixture_revision": revision}}
        return frontier.publish_results(self.root, full, compact, correspondence, self.commitments, True)

    def documents(self):
        return {p.name: p.read_bytes() for p in self.directory.iterdir()}

    def correspondence_fixture(self):
        candidate = dict(virtual_address="0x140000040", end_exclusive="0x140000044",
                         byte_count=4, sha256="d" * 64, dispatch_site="0x140000020")
        location = dict(site=candidate["dispatch_site"], table_address=candidate["virtual_address"],
                        native_owner="0x140000010")
        full = dict(target=self.target, generator=dict(fixture=True), records=[],
                    input_commitments=self.commitments,
                    correspondence_candidates={candidate["dispatch_site"]: dict(native_candidate=candidate, location=location)})
        compact = dict(target=self.target, counts=dict(added_tables=0))
        correspondence = dict(target=self.target, leads={"retained": dict(
            current_native_candidate=candidate, current_native_location=location,
            current_table_applied=True, applicability="pending_current_producer_dependency_consumer_contract_revalidation")})
        return full, compact, correspondence

    def test_applied_candidate_gets_exact_immutable_range_and_location_witness(self):
        full, compact, correspondence = self.correspondence_fixture()
        full["complete_AS_context_reconciliation"] = {"counts": {"current_AS_context_tables": 2},
                                                       "scope": "applied and proposed contexts"}
        original = deepcopy(correspondence)
        frontier.publish_results(self.root, full, compact, correspondence, self.commitments, True)
        published = json.loads((self.directory / "computed-correspondence-frontier.json").read_text())
        lead = published["leads"]["retained"]
        proof = lead["current_candidate_proof"]
        witness_path = self.root / proof["evidence"]["path"]
        self.assertEqual(hashlib.sha256(witness_path.read_bytes()).hexdigest(), proof["evidence"]["sha256"])
        witness = json.loads(witness_path.read_text())
        for field, selector in (("current_native_candidate", "selector"), ("current_native_location", "location_selector")):
            selected = witness
            for part in proof[selector]:
                selected = selected[part]
            self.assertEqual(selected, lead[field])
        self.assertEqual(witness["input_commitments"], self.commitments)
        self.assertEqual(witness["inputs"], self.commitments)
        self.assertEqual(correspondence, original)
        self.assertTrue(lead["current_table_applied"])
        self.assertTrue(lead["applicability"].startswith("pending_"))
        self.assertEqual(witness["records"], [])  # The applied table is outside the added frontier.
        context_proof = published["complete_AS_context_reconciliation"]
        self.assertEqual(context_proof["evidence"], proof["evidence"])
        self.assertEqual(context_proof["counts"]["current_AS_context_tables"], 2)
        self.assertEqual(witness[context_proof["selector"][0]]["scope"], "applied and proposed contexts")

    def test_complete_context_reconciliation_includes_applied_ambiguous_and_generic_matches(self):
        def table(site, offsets):
            return dict(site=hex(site), table_address=hex(site + 0x10000), file_offset=hex(site),
                        byte_count=4 * len(offsets), sha256="d" * 64, guard=hex(site - 5),
                        guard_kind="ja", selector_register="rax", guard_bound=len(offsets) - 1,
                        selector_minimum=0, selector_maximum=len(offsets) - 1,
                        case_targets=[hex(site + offset) for offset in offsets])

        def contexts(tables, generic):
            return {row["site"]: dict(site=row["site"], table_address=row["table_address"],
                    native_owner=None, as_owner_diagnostic_contexts=[],
                    as_declared_extent_contexts=[] if row["site"] in generic else ["AS-context.rs"])
                    for row in tables}

        previous = [table(0x100, [2, 10]), table(0x200, [2, 10]), table(0x300, [2, 30]),
                    table(0x400, [2, 40]), table(0x500, [2, 50])]
        current = [table(0x1100, [2, 10]), table(0x1200, [2, 30]), table(0x1300, [2, 40]),
                   table(0x1400, [2, 60]), table(0x1500, [2, 50])]
        proof = frontier.reconcile_context_tables(current, contexts(current, {"0x1500"}), current[:2],
                                                  previous, contexts(previous, {"0x400"}), previous[:3])
        self.assertEqual(proof["counts"], dict(
            current_AS_context_tables=4, current_applied_AS_context_tables=2,
            current_proposal_only_AS_context_tables=2, predecessor_AS_context_tables=4,
            predecessor_applied_AS_context_tables=3, current_unique_predecessor_AS_geometry_candidate=1,
            current_ambiguous_predecessor_AS_geometry_candidates=1, current_without_predecessor_AS_geometry_candidate=2,
            current_without_any_predecessor_proposed_geometry_candidate=1,
            predecessor_AS_tables_without_current_AS_geometry_candidate=1,
            new_semantics_or_behavioral_equivalence_inferred=0))
        rows = proof["current_AS_context_tables"]
        self.assertEqual(rows["0x1100"]["predecessor_AS_context_geometry_candidates"], ["0x100", "0x200"])
        self.assertEqual(rows["0x1300"]["predecessor_AS_context_geometry_candidates"], [])
        self.assertEqual(rows["0x1300"]["predecessor_all_proposed_geometry_candidates"], ["0x400"])
        self.assertEqual(proof["predecessor_AS_tables_without_current_AS_geometry_candidate"], ["0x500"])
        self.assertEqual(rows["0x1100"]["location"]["native_owner"], None)
        self.assertNotIn("ownership", rows["0x1100"])

    def test_context_extraction_preserves_extent_only_association_without_inventing_body_owner(self):
        tables = [dict(site="0x100", table_address="0x10000"), dict(site="0x300", table_address="0x20000")]
        diagnostics = dict(diagnostics=[dict(path="AS-context.rs", custom_game_crate=True,
            verified_references=[dict(instruction_address="0x110", runtime_function_start="0x80", runtime_function_end="0x180")])])
        contexts = frontier.diagnostic_contexts(tables, diagnostics, lambda _: None)
        self.assertEqual(contexts["0x100"]["as_declared_extent_contexts"], ["AS-context.rs"])
        self.assertEqual(contexts["0x100"]["as_owner_diagnostic_contexts"], [])
        self.assertIsNone(contexts["0x100"]["native_owner"])
        self.assertTrue(frontier.as_context(contexts["0x100"]))
        self.assertFalse(frontier.as_context(contexts["0x300"]))

    def retained_geometry_fixture(self):
        table = dict(site="0x140000020", table_address="0x140000040", file_offset="0x40",
                     byte_count=8, sha256="d" * 64, guard="0x140000018", guard_kind="ja",
                     selector_register="rax", guard_bound=1, selector_minimum=0,
                     selector_maximum=1, case_targets=["0x140000030", "0x140000038"])
        proposal = self.root / "runtime/older/guarded-proposals.json"
        proposal.parent.mkdir(parents=True)
        proposal.write_text(json.dumps(dict(target=self.target, tables=[table])))
        receipt = lambda p: dict(path=p.relative_to(self.root).as_posix(),
                                 sha256=hashlib.sha256(p.read_bytes()).hexdigest())
        old_path = self.root / "runtime/older/frontier.json"
        old = dict(target=self.target, inputs=[receipt(proposal)], leads={"retained": dict(
            stable_question_id="retained", selector="stable-selector",
            current_native_candidate=frontier.table_candidate(table))})
        old_path.write_text(json.dumps(old))
        current = dict(target=dict(version="0.121.0", sha256="e" * 64),
                       predecessor=receipt(old_path), leads={"retained": dict(
                           stable_question_id="retained", selector="stable-selector",
                           current_native_candidate=None)})
        current_path = self.root / "runtime/frontier.json"
        current_path.write_text(json.dumps(current))
        return table, old_path, current_path, current

    def test_unmapped_predecessor_reuses_last_hash_bound_table_as_geometry_only(self):
        table, old_path, current_path, current = self.retained_geometry_fixture()
        original = deepcopy(current)
        row, baseline, inputs = frontier.retained_question_geometry(
            self.root, current_path, current, "retained")
        self.assertEqual(row, table)
        self.assertEqual(baseline["target"], self.target)
        self.assertEqual(len(baseline["predecessor_chain"]), 2)
        self.assertEqual(baseline["native_candidate"], frontier.table_candidate(table))
        self.assertIn(old_path, inputs)
        self.assertEqual(current, original)
        self.assertIsNone(current["leads"]["retained"]["current_native_candidate"])
        self.assertNotIn("current_native_candidate", baseline)

    def test_stale_retained_predecessor_cannot_supply_geometry(self):
        _, old_path, current_path, current = self.retained_geometry_fixture()
        old_path.write_text("{}")
        with self.assertRaisesRegex(ValueError, "input hash differs"):
            frontier.retained_question_geometry(self.root, current_path, current, "retained")

    def test_never_mapped_question_stays_without_a_geometry_baseline(self):
        _, _, current_path, current = self.retained_geometry_fixture()
        current.pop("predecessor")
        current_path.write_text(json.dumps(current))
        row, baseline, inputs = frontier.retained_question_geometry(
            self.root, current_path, current, "retained")
        self.assertIsNone(row)
        self.assertIsNone(baseline["native_candidate"])
        self.assertEqual(inputs, [current_path])

    def test_candidate_or_location_substitution_cannot_publish(self):
        self.publish(1)
        documents = self.documents()
        objects = sorted(self.root.glob("runtime/analysis/objects/*/*"))
        for field in ("current_native_candidate", "current_native_location"):
            with self.subTest(field=field):
                full, compact, correspondence = self.correspondence_fixture()
                changed = dict(correspondence["leads"]["retained"][field], substituted=True)
                correspondence["leads"]["retained"][field] = changed
                with self.assertRaisesRegex(ValueError, "differs from the immutable witness"):
                    frontier.publish_results(self.root, full, compact, correspondence, self.commitments, True)
                self.assertEqual(self.documents(), documents)
                self.assertEqual(sorted(self.root.glob("runtime/analysis/objects/*/*")), objects)

    def test_unmapped_question_publishes_without_a_fabricated_current_witness(self):
        full, compact, correspondence = self.correspondence_fixture()
        lead = correspondence["leads"]["retained"]
        lead.update(current_native_candidate=None, current_native_location=None,
                    applicability="pending_unmapped_or_ambiguous_current_geometry_candidate")
        frontier.publish_results(self.root, full, compact, correspondence, self.commitments, True)
        published = json.loads((self.directory / "computed-correspondence-frontier.json").read_text())["leads"]["retained"]
        self.assertIsNone(published["current_native_candidate"])
        self.assertIsNone(published["current_native_location"])
        self.assertNotIn("current_candidate_proof", published)

    def test_repeated_success_is_deterministic_and_old_payload_stays_immutable(self):
        first = self.publish(1)
        old = self.root / first["inputs"][0]["path"]
        original = old.read_bytes()
        second = self.publish(2)
        new = self.root / second["inputs"][0]["path"]
        self.assertNotEqual(old, new)
        self.assertEqual(old.read_bytes(), original)
        self.assertEqual(new.name, hashlib.sha256(new.read_bytes()).hexdigest())
        documents = self.documents()
        objects = sorted(self.root.glob("runtime/analysis/objects/*/*"))
        repeated = self.publish(2)
        self.assertEqual(repeated, second)
        self.assertEqual(self.documents(), documents)
        self.assertEqual(sorted(self.root.glob("runtime/analysis/objects/*/*")), objects)
        self.assertEqual(old.read_bytes(), original)

    def test_failed_input_revalidation_leaves_all_existing_proof_bytes_unchanged(self):
        first = self.publish(1)
        old = self.root / first["inputs"][0]["path"]
        original = old.read_bytes()
        documents = self.documents()
        objects = sorted(self.root.glob("runtime/analysis/objects/*/*"))
        self.input.write_bytes(b'{"input":"changed"}\n')
        with self.assertRaises(AssertionError):
            self.publish(2)
        self.assertEqual(self.documents(), documents)
        self.assertEqual(old.read_bytes(), original)
        self.assertEqual(sorted(self.root.glob("runtime/analysis/objects/*/*")), objects)

    def test_second_document_failure_rolls_back_the_first_document(self):
        first = self.publish(1)
        old = self.root / first["inputs"][0]["path"]
        original = old.read_bytes()
        documents = self.documents()
        replace = frontier.os.replace
        failed = False

        def fail_once(source, destination):
            nonlocal failed
            if Path(destination) == self.directory / "computed-correspondence-frontier.json" and not failed:
                failed = True
                raise OSError("fixture second-document failure")
            return replace(source, destination)

        with mock.patch.object(frontier.os, "replace", side_effect=fail_once):
            with self.assertRaisesRegex(OSError, "second-document failure"):
                self.publish(2)
        self.assertTrue(failed)
        self.assertEqual(self.documents(), documents)
        self.assertEqual(old.read_bytes(), original)
        self.assertFalse(any("frontier-" in p.name for p in self.directory.iterdir()))


if __name__ == "__main__":
    unittest.main()
