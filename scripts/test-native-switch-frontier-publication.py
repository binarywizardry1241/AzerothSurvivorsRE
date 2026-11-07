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
        self.scratch = ROOT / "runtime/tests/switch-frontier-publication"
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

    def predecessor_inputs_fixture(self):
        receipt = lambda p: dict(path=p.relative_to(self.root).as_posix(),
                                 sha256=hashlib.sha256(p.read_bytes()).hexdigest())
        frozen = self.root / "runtime/census/guarded-input.json"
        frozen.parent.mkdir(parents=True)
        frozen.write_bytes(b'{"tables":[]}\n')
        inventory = self.root / "runtime/leads/guarded.json"
        inventory.parent.mkdir(parents=True)
        inventory.write_bytes(frozen.read_bytes())
        census = dict(target=self.target, artifacts={},
                      independent_instructions=dict(exact_source_bytes_verified=True),
                      guarded_table_input=receipt(frozen))
        census_path = self.root / "runtime/census/summary.json"
        census_path.write_text(json.dumps(census))
        applied = dict(target=self.target, inventory=receipt(inventory),
                       census_summary_sha256=receipt(census_path)["sha256"])
        applied_path = self.root / "runtime/leads/jump-summary.json"
        applied_path.write_text(json.dumps(applied))
        previous = dict(target=self.target,
                        inputs=[receipt(census_path), receipt(applied_path), self.commitments[0]])
        return previous, census_path, applied_path

    def relocated_receipt(self, path):
        alias = self.root / "runtime/archive" / hashlib.sha256(path.read_bytes()).hexdigest()
        alias.parent.mkdir(exist_ok=True)
        alias.write_bytes(path.read_bytes())
        return alias

    def test_original_predecessor_inputs_keep_exact_recorded_roles_and_receipts(self):
        previous, census_path, applied_path = self.predecessor_inputs_fixture()
        original = deepcopy(previous)
        for role, path in (("census_summary", census_path), ("applied_summary", applied_path)):
            with self.subTest(role=role):
                resolved, payload, witness = frontier.predecessor_input(self.root, previous, path, role)
                self.assertEqual(resolved, path)
                self.assertEqual(payload, json.loads(path.read_text()))
                self.assertFalse(witness["relocated"])
                self.assertEqual(witness["recorded_input_path"], witness["resolved_input"]["path"])
                self.assertEqual(witness["recorded_input_sha256"], witness["resolved_input"]["sha256"])
        self.assertEqual(previous, original)

    def test_explicit_relocated_applied_summary_preserves_stale_original_and_frozen_proof(self):
        previous, census_path, applied_path = self.predecessor_inputs_fixture()
        original = deepcopy(previous)
        expected = json.loads(applied_path.read_text())
        alias = self.relocated_receipt(applied_path)
        stale = dict(expected, census_summary_sha256="e" * 64)
        applied_path.write_text(json.dumps(stale))
        resolved, payload, witness = frontier.predecessor_input(self.root, previous, alias, "applied_summary")
        self.assertEqual(resolved, alias)
        self.assertEqual(payload, expected)
        self.assertTrue(witness["relocated"])
        self.assertEqual(witness["recorded_input_path"], original["inputs"][1]["path"])
        self.assertEqual(witness["recorded_input_sha256"], original["inputs"][1]["sha256"])
        self.assertEqual(witness["resolved_input"]["path"], alias.relative_to(self.root).as_posix())
        with mock.patch.object(frontier, "project_path", side_effect=lambda p: self.root / p):
            supplied, frozen = frontier.verify_applied_input(json.loads(census_path.read_text()), payload)
        self.assertEqual(supplied.read_bytes(), frozen.read_bytes())
        self.assertEqual(json.loads(applied_path.read_text()), stale)
        self.assertEqual(previous, original)

    def test_explicit_relocated_census_matches_original_commitment_after_original_disappears(self):
        previous, census_path, _ = self.predecessor_inputs_fixture()
        expected = json.loads(census_path.read_text())
        alias = self.relocated_receipt(census_path)
        census_path.unlink()
        resolved, payload, witness = frontier.predecessor_input(self.root, previous, alias, "census_summary")
        self.assertEqual(resolved, alias)
        self.assertEqual(payload, expected)
        self.assertTrue(witness["relocated"])
        self.assertEqual(witness["recorded_input_path"], previous["inputs"][0]["path"])
        self.assertFalse(census_path.exists())

    def test_changed_recorded_path_never_implicitly_uses_an_available_alias(self):
        previous, _, applied_path = self.predecessor_inputs_fixture()
        self.relocated_receipt(applied_path)
        applied_path.write_text(json.dumps(dict(target=self.target, inventory={}, census_summary_sha256="e" * 64)))
        with self.assertRaisesRegex(ValueError, "Recorded predecessor input bytes differ"):
            frontier.predecessor_input(self.root, previous, applied_path, "applied_summary")

    def test_unrecorded_or_ambiguous_relocated_bytes_are_rejected(self):
        previous, _, applied_path = self.predecessor_inputs_fixture()
        alias = self.relocated_receipt(applied_path)
        alias.write_bytes(alias.read_bytes() + b" ")
        with self.assertRaisesRegex(ValueError, "one unique recorded digest"):
            frontier.predecessor_input(self.root, previous, alias, "applied_summary")
        alias.write_bytes(applied_path.read_bytes())
        previous["inputs"].append(dict(previous["inputs"][1], path="runtime/second/jump-summary.json"))
        with self.assertRaisesRegex(ValueError, "one unique recorded digest"):
            frontier.predecessor_input(self.root, previous, alias, "applied_summary")

    def test_relocated_receipt_cannot_substitute_another_recorded_role(self):
        previous, census_path, _ = self.predecessor_inputs_fixture()
        alias = self.relocated_receipt(census_path)
        with self.assertRaisesRegex(ValueError, "different recorded role"):
            frontier.predecessor_input(self.root, previous, alias, "applied_summary")

    def test_committed_receipt_still_requires_predecessor_target_and_role_payload(self):
        previous, _, applied_path = self.predecessor_inputs_fixture()
        for payload, error in ((dict(target=self.target, not_an_applied_summary=True), "payload differs"),
                               (dict(target=dict(self.target, sha256="e" * 64), inventory={},
                                     census_summary_sha256="d" * 64), "target differs")):
            with self.subTest(error=error):
                applied_path.write_text(json.dumps(payload))
                previous["inputs"][1]["sha256"] = hashlib.sha256(applied_path.read_bytes()).hexdigest()
                alias = self.relocated_receipt(applied_path)
                with self.assertRaisesRegex(ValueError, error):
                    frontier.predecessor_input(self.root, previous, alias, "applied_summary")

    def test_exact_relocated_summary_cannot_replace_the_census_frozen_inventory(self):
        previous, census_path, applied_path = self.predecessor_inputs_fixture()
        applied = json.loads(applied_path.read_text())
        applied["inventory"]["sha256"] = "d" * 64
        applied_path.write_text(json.dumps(applied))
        previous["inputs"][1]["sha256"] = hashlib.sha256(applied_path.read_bytes()).hexdigest()
        alias = self.relocated_receipt(applied_path)
        _, payload, _ = frontier.predecessor_input(self.root, previous, alias, "applied_summary")
        with self.assertRaisesRegex(ValueError, "not the census's frozen guarded-table input"):
            frontier.verify_applied_input(json.loads(census_path.read_text()), payload)

    def test_predecessor_receipt_cannot_escape_project_even_when_explicit(self):
        previous, _, _ = self.predecessor_inputs_fixture()
        with self.assertRaisesRegex(ValueError, "leaves the project"):
            frontier.predecessor_input(self.root, previous, self.root.parent / "outside.json", "applied_summary")

    def retained_geometry_fixture(self):
        table = dict(site="0x140000020", table_address="0x140000040", file_offset="0x40",
                     byte_count=8, sha256="d" * 64, guard="0x140000018", guard_kind="ja",
                     selector_register="rax", guard_bound=1, selector_minimum=0,
                     selector_maximum=1, case_targets=["0x140000030", "0x140000038"])
        proposal = self.root / "runtime/older/guarded-proposals.json"
        proposal.parent.mkdir(parents=True, exist_ok=True)
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
        self.assertNotIn("equivalent_proposal_inputs", baseline)

    def add_retained_proposal(self, old_path, current_path, current, table):
        proposal = self.root / "runtime/selected/guarded-proposals.json"
        proposal.parent.mkdir(parents=True, exist_ok=True)
        proposal.write_text(json.dumps(dict(target=self.target, tables=[table])))
        old = json.loads(old_path.read_text())
        old["inputs"].append(dict(path=proposal.relative_to(self.root).as_posix(),
                                  sha256=hashlib.sha256(proposal.read_bytes()).hexdigest()))
        old_path.write_text(json.dumps(old))
        current["predecessor"]["sha256"] = hashlib.sha256(old_path.read_bytes()).hexdigest()
        current_path.write_text(json.dumps(current))
        return proposal

    def test_identical_applied_and_proposed_table_receipts_preserve_both_commitments(self):
        table, old_path, current_path, current = self.retained_geometry_fixture()
        proposal = self.add_retained_proposal(old_path, current_path, current, table)
        before = {p: p.read_bytes() for p in (old_path, current_path, proposal)}
        row, baseline, inputs = frontier.retained_question_geometry(self.root, current_path, current, "retained")
        self.assertEqual(row, table)
        self.assertEqual(len(baseline["equivalent_proposal_inputs"]), 2)
        self.assertEqual(baseline["proposal_input"], baseline["equivalent_proposal_inputs"][0])
        for receipt in baseline["equivalent_proposal_inputs"]:
            path = self.root / receipt["path"]
            self.assertEqual(hashlib.sha256(path.read_bytes()).hexdigest(), receipt["sha256"])
            self.assertIn(path, inputs)
        self.assertEqual({p: p.read_bytes() for p in before}, before)

    def test_equal_candidate_cannot_hide_conflicting_guard_domain_or_successor_geometry(self):
        for change in ({"guard": "0x140000017"}, {"guard_kind": "jae"},
                       {"selector_register": "rcx"}, {"guard_bound": 2},
                       {"selector_minimum": 1}, {"selector_maximum": 2},
                       {"case_targets": ["0x140000030", "0x140000039"]}):
            with self.subTest(change=change):
                table, old_path, current_path, current = self.retained_geometry_fixture()
                self.add_retained_proposal(old_path, current_path, current, {**table, **change})
                with self.assertRaisesRegex(ValueError, "conflicting guarded geometry"):
                    frontier.retained_question_geometry(self.root, current_path, current, "retained")

    def test_duplicate_proposal_stale_hash_and_changed_candidate_are_rejected(self):
        table, old_path, current_path, current = self.retained_geometry_fixture()
        proposal = self.add_retained_proposal(old_path, current_path, current, table)
        proposal.write_text("{}")
        with self.assertRaisesRegex(ValueError, "input hash differs"):
            frontier.retained_question_geometry(self.root, current_path, current, "retained")
        table, old_path, current_path, current = self.retained_geometry_fixture()
        self.add_retained_proposal(old_path, current_path, current, {**table, "sha256": "c" * 64})
        with self.assertRaisesRegex(ValueError, "candidate differs"):
            frontier.retained_question_geometry(self.root, current_path, current, "retained")

    def test_authoritative_predecessor_proposal_role_selects_proposed_not_first_applied_payload(self):
        previous, census_path, applied_path = self.predecessor_inputs_fixture()
        proposal = self.root / "runtime/selected/guarded-proposals.json"
        proposal.parent.mkdir(parents=True)
        proposal.write_text(json.dumps(dict(target=self.target, tables=[dict(proposed_only=True)])))
        receipt = lambda p: dict(path=p.relative_to(self.root).as_posix(),
                                 sha256=hashlib.sha256(p.read_bytes()).hexdigest())
        summary_path = proposal.parent / "guarded-proposals-summary.json"
        summary_path.write_text(json.dumps(dict(target=self.target, inventory=receipt(proposal),
            census_summary_sha256=receipt(census_path)["sha256"])))
        applied_payload = self.root / json.loads(applied_path.read_text())["inventory"]["path"]
        previous["inputs"] = previous["inputs"][:2] + [receipt(summary_path), receipt(applied_payload), receipt(proposal)]
        path, payload, source = frontier.predecessor_proposal_input(self.root, previous)
        self.assertEqual(path, proposal)
        self.assertEqual(source, summary_path)
        self.assertEqual(payload["tables"], [dict(proposed_only=True)])
        changed = json.loads(proposal.read_text())
        changed["target"] = dict(version="different", sha256="e" * 64)
        proposal.write_text(json.dumps(changed))
        previous["inputs"][-1] = receipt(proposal)
        summary = json.loads(summary_path.read_text()); summary["inventory"] = receipt(proposal)
        summary_path.write_text(json.dumps(summary)); previous["inputs"][2] = receipt(summary_path)
        with self.assertRaisesRegex(ValueError, "inventory target differs"):
            frontier.predecessor_proposal_input(self.root, previous)

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
