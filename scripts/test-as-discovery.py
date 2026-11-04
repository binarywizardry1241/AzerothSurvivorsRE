#!/usr/bin/env python3
"""Non-compiling discovery-profile integrity/negative fixtures, all project-local."""
import copy
import ast
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("as_discovery", ROOT / "scripts/compose-as-discovery.py")
discovery = importlib.util.module_from_spec(spec)
spec.loader.exec_module(discovery)


class ProfileTests(unittest.TestCase):
    def setUp(self):
        directory = ROOT / "runtime/tests/as-discovery"
        directory.mkdir(parents=True, exist_ok=True)
        self.temporary = tempfile.TemporaryDirectory(dir=directory)
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.target = dict(version="fixture", sha256="a" * 64, size_bytes=64)
        self.generator = self.write("fixture-generator", "fixture source\n")
        self.generator["dependencies"] = [self.write("fixture-helper", "helper source\n")]
        self.source = self.write("source.rs", "literal producer\n")
        self.native = self.write("native-result.c", "retained native pseudocode\n")
        self.query = dict(evidence_id="ev_fixture", profile_digest="c" * 64,
                          result=self.native, operation="procedure_pseudo_code")
        self.evidence = self.write_json("evidence.json", dict(target=self.target, query=self.query))
        self.write_json("census.json", dict(target=self.target))
        row = dict(selector="Q41-I01:literal:0", category="lua_ui_registration", classification="unknown",
                   file_offset="0x10", virtual_address="0x140000010", byte_count=4, sha256="d" * 64,
                   ghidra_incoming=[dict(**{"from": "140000020"}, to="140000010", source_flow_body="140000018")],
                   encoded_incoming=[], relocation_incoming=[],
                   source_literal_occurrences=[dict(path="source.rs", line=1)])
        leads = self.write("leads.jsonl", json.dumps(row) + "\n")
        leads["records"] = 1
        self.classification = dict(target=self.target, inputs=[], outputs={"embedded-classification.jsonl": leads})
        self.write_json("classification.json", self.classification)
        self.unknown = dict(target=self.target, inputs={}, sqlite_selectors=[dict(
            lead_id="Q41-F01", selector="SELECT * FROM refs WHERE kind = 'call_indirect'", question="Resolve guard and producer")])
        self.write_json("unknown.json", self.unknown)
        self.ledger = dict(target=self.target, inputs=[], current_native_body_census=self.commit("census.json"), systems=[dict(
            id="custom-fixture", original_path="original.rs", gap_ids=[41, 96], source_refs=["source.rs"],
            location_body_owners=["0x140000018"], ownerless_location_sites=["0x140000030"],
            registered_current_bounded_contract_present=True, current_bounded_contract_refs=["evidence.json"])])
        self.write_json("connections.json", self.ledger)
        self.paths = dict(classification="classification.json", unknown="unknown.json", connections="connections.json", census="census.json")
        self.review = dict(id="gap96", selector="owner[0x140000018,0x140000024)", finding_ids=[96],
                           ownership="as_specific", conclusion="Bounded native receiver only; canonical result checked.",
                           next_action="Recover outer producer, lifecycle and compare runtime separately.",
                           source_first=dict(paths=[self.source], conclusion="Existing source receiver inspected; stop at shared parser boundary."),
                           evidence=self.evidence, query=dict(selector=["query"], sha256=discovery.digest(discovery.encoded(self.query))),
                           results=[self.native], parent="module:custom-fixture")

    def commit(self, path):
        return dict(path=path, sha256=discovery.digest((self.root / path).read_bytes()))

    def write(self, path, value):
        (self.root / path).write_text(value)
        return self.commit(path)

    def write_json(self, path, value):
        return self.write(path, json.dumps(value) + "\n")

    def compose(self):
        return discovery.compose(self.root, self.target, self.paths, self.generator)

    def add_review(self, review=None):
        self.write_json("reviews.json", dict(target=self.target, reviews=[review or self.review]))
        self.paths["reviews"] = "reviews.json"

    def add_pending_native(self, changes=None, proof_changes=None):
        span = dict(virtual_address="0x140000030", end_exclusive="0x140000034",
                    byte_count=4, sha256="d" * 64)
        proof = dict(target=self.target, native_candidate=span, inputs=[self.native])
        proof.update(proof_changes or {})
        evidence = self.write_json("native-lead.json", proof)
        lead = dict(id="unresolved-native", selector="Q41-NATIVE01:interior:0x140000030-0x140000034",
                    finding_ids=[101], conclusion="Exact current range is a candidate; ownership is unknown.",
                    next_action="Recover producer and dispatch to the existing source interface.",
                    source_first=dict(paths=[self.source], conclusion="Existing source interface inspected."),
                    evidence=evidence, proof=dict(selector=["native_candidate"],
                    sha256=discovery.digest(discovery.encoded(proof["native_candidate"]))), inputs=[self.native])
        lead.update(changes or {})
        self.write_json("reviews.json", dict(target=self.target, reviews=[], pending_native_leads=[lead]))
        self.paths["reviews"] = "reviews.json"
        return lead

    def test_pending_native_range_survives_replay_without_a_fake_completed_review(self):
        self.add_pending_native()
        documents = self.compose()
        entry = next(row for row in documents[2]["entries"] if row["id"] == "pending-native:unresolved-native")
        self.assertEqual((entry["state"], entry["semantic_status"]), ("pending", "pending_native_classification"))
        native = next(row for row in documents[1]["nodes"] if row["id"] == entry["id"])
        self.assertEqual(native["ownership"], "unknown")
        self.assertEqual(native["finding_ids"], [101])
        self.assertFalse(native["lead"]["complete"])
        self.assertFalse(any(row["kind"] == "explicit_bounded_review" for row in documents[1]["nodes"]))
        discovery.retain(self.root / "saved-native", documents)
        discovery.retain(self.root / "saved-native", self.compose(), check=True)

    def test_pending_native_stale_source_requires_explicit_policy_and_stays_unknown(self):
        self.add_pending_native()
        current = self.write("source.rs", "changed after native question inspection\n")
        with self.assertRaisesRegex(ValueError, "Stale input commitment"):
            self.compose()
        self.paths["retain_stale_source_reviews"] = True
        documents = self.compose()
        node = next(r for r in documents[1]["nodes"] if r["id"] == "pending-native:unresolved-native")
        lead = node["lead"]
        self.assertEqual(lead["source_first"]["paths"], [self.source])
        self.assertEqual(lead["stale_sources"], [dict(reviewed=self.source, current=current)])
        self.assertEqual((node["ownership"], lead["ownership"], lead["state"]), ("unknown", "unknown", "pending"))
        self.assertEqual(lead["semantic_status"], "pending_native_classification")
        self.assertFalse(lead["complete"])
        self.assertIn(current, documents[0]["inputs"])

    def add_correspondence(self, changes=None, previous_changes=None, record_changes=None, candidate=None, candidate_target=None, candidate_location=None, predecessor_key="retained-table", predecessor_candidate_field="native_candidate"):
        span = dict(virtual_address="0x140000040", end_exclusive="0x140000044",
                    byte_count=4, sha256="d" * 64)
        historical = dict(stable_question_id="retained-table", selector="old-table:0x140000040")
        historical[predecessor_candidate_field] = span
        historical.update(previous_changes or {})
        predecessor = self.write_json("predecessor.json", dict(
            target=dict(self.target, sha256="b" * 64), leads={predecessor_key: historical}))
        selected = dict(stable_question_id="retained-table", selector="Q41-F01:correspondence:retained-table",
                        finding_ids=[73], predecessor_selector="old-table:0x140000040",
                        historical_native_candidate=span, current_source_receipts=[self.source],
                        current_native_location=None, applicability="pending_current_native_mapping",
                        semantic_recovery_reset=False, source_implementation_reset=False)
        selected.update(changes or {})
        if candidate is not None:
            witness = self.write_json("current-candidate.json", dict(target=candidate_target or self.target,
                                                                      native_candidate=candidate, candidate_location=candidate_location))
            selected.update(current_native_candidate=candidate,
                            current_native_location=candidate_location,
                            current_candidate_proof=dict(evidence=witness, selector=["native_candidate"], location_selector=["candidate_location"]))
        evidence = self.write_json("correspondence.json", dict(target=self.target, predecessor=predecessor,
                                                               leads={"retained-table": selected}))
        record = dict(id="retained-table", selector="Q41-F01:correspondence:retained-table", finding_ids=[73],
                      conclusion="Prior question retained; current location is unmapped.",
                      next_action="Map the prior table and continue its unresolved producer question.",
                      source_first=dict(paths=[self.source], conclusion="Existing source consumer inspected."),
                      evidence=evidence, proof=dict(selector=["leads", "retained-table"],
                                                   sha256=discovery.digest(discovery.encoded(selected))))
        record.update(record_changes or {})
        self.write_json("reviews.json", dict(target=self.target, reviews=[], pending_correspondence_leads=[record]))
        self.paths["reviews"] = "reviews.json"

    def test_unmapped_prior_question_survives_replay_without_a_current_native_range(self):
        self.add_correspondence()
        documents = self.compose()
        identity = "pending-correspondence:retained-table"
        entry = next(row for row in documents[2]["entries"] if row["id"] == identity)
        self.assertEqual((entry["state"], entry["semantic_status"]), ("pending", "pending_current_correspondence"))
        node = next(row for row in documents[1]["nodes"] if row["id"] == identity)
        self.assertEqual(node["ownership"], "unknown")
        self.assertNotIn("native_range", node)
        self.assertIn("historical_native_range", node)
        self.assertFalse(node["lead"]["complete"])
        discovery.retain(self.root / "saved-correspondence", documents)
        discovery.retain(self.root / "saved-correspondence", self.compose(), check=True)

    def test_correspondence_stale_source_requires_explicit_policy_and_preserves_receipts(self):
        self.add_correspondence()
        current = self.write("source.rs", "changed after correspondence inspection\n")
        with self.assertRaisesRegex(ValueError, "Stale input commitment"):
            self.compose()
        self.paths["retain_stale_source_reviews"] = True
        documents = self.compose()
        node = next(r for r in documents[1]["nodes"] if r["id"] == "pending-correspondence:retained-table")
        lead = node["lead"]
        self.assertEqual(lead["source_first"]["paths"], [self.source])
        self.assertEqual(lead["stale_sources"], [dict(reviewed=self.source, current=current)])
        self.assertEqual((node["ownership"], lead["ownership"], lead["state"]), ("unknown", "unknown", "pending"))
        self.assertEqual(lead["semantic_status"], "pending_current_correspondence")
        self.assertFalse(lead["complete"])
        self.assertIn(current, documents[0]["inputs"])

    def test_stale_source_policy_cannot_relax_pending_native_or_correspondence_proof(self):
        self.paths["retain_stale_source_reviews"] = True
        self.add_pending_native(dict(proof=dict(selector=["native_candidate"], sha256="f" * 64)))
        self.write("source.rs", "source drift cannot admit a forged native proof\n")
        with self.assertRaisesRegex(ValueError, "Stale finding binding proof"):
            self.compose()
        self.add_correspondence(record_changes=dict(proof=dict(selector=["leads", "retained-table"], sha256="f" * 64)))
        with self.assertRaisesRegex(ValueError, "Stale pending correspondence proof"):
            self.compose()

    def test_stale_source_policy_cannot_promote_pending_lead_ownership_or_completion(self):
        self.paths["retain_stale_source_reviews"] = True
        for mutation in (dict(ownership="as_specific"), dict(complete=True), dict(state="reviewed_bounded")):
            with self.subTest(kind="native", mutation=mutation):
                self.add_pending_native(mutation)
                with self.assertRaisesRegex(ValueError, "cannot claim"):
                    self.compose()
            with self.subTest(kind="correspondence", mutation=mutation):
                self.add_correspondence(record_changes=mutation)
                with self.assertRaisesRegex(ValueError, "cannot claim"):
                    self.compose()

    def test_summary_replay_command_preserves_profile_source_policy(self):
        # Evaluate the consumer's actual command expression without running its
        # target/graph readers or duplicating the command-construction logic.
        source = (ROOT / "scripts/summarize-as-discovery.py").read_text()
        tree = ast.parse(source)
        assignments = [node for node in tree.body if isinstance(node, ast.Assign)
                       and isinstance(node.value, ast.DictComp)
                       and "scripts/compose-as-discovery.py" in ast.get_source_segment(source, node)]
        self.assertEqual(len(assignments), 1)
        expression = compile(ast.Expression(assignments[0].value), "summary-replay-fixture", "eval")
        registry = {key: dict(path=key + ".json") for key in (
            "data_classification_input", "unknown_selector_input", "connection_ledger_input",
            "current_native_body_census", "review_input")}
        for policy, expected in [("retain_stale_as_pending", True), ("reject_stale", False)]:
            with self.subTest(policy=policy):
                commands = eval(expression, dict(r=registry, profile=dict(review_source_policy=policy)))
                for mode in ("write", "check"):
                    self.assertIn(" --" + mode, commands[mode])
                    self.assertEqual(" --retain-stale-source-reviews" in commands[mode], expected)

    def test_correspondence_cannot_promote_mapping_or_reset_retained_progress(self):
        for change in (dict(current_native_location="0x140000050"), dict(semantic_recovery_reset=True),
                       dict(source_implementation_reset=True), dict(applicability="recovered")):
            with self.subTest(change=change):
                self.add_correspondence(changes=change)
                with self.assertRaisesRegex(ValueError, "unresolved question"):
                    self.compose()
        self.add_correspondence(record_changes=dict(ownership="as_specific"))
        with self.assertRaisesRegex(ValueError, "cannot claim"):
            self.compose()

    def test_current_candidate_preserves_prior_question_without_promoting_correspondence(self):
        candidate = dict(virtual_address="0x140000050", end_exclusive="0x140000054",
                         byte_count=4, sha256="e" * 64)
        location = dict(dispatch_site="0x140000020", table_address="0x140000050")
        self.add_correspondence(candidate=candidate, candidate_location=location)
        documents = self.compose()
        node = next(row for row in documents[1]["nodes"] if row["id"] == "pending-correspondence:retained-table")
        self.assertEqual(node["current_native_candidate"], candidate)
        self.assertEqual(node["current_candidate_location"], location)
        self.assertEqual(node["historical_native_range"]["virtual_address"], "0x140000040")
        self.assertEqual(node["ownership"], "unknown")
        self.assertEqual(node["semantic_status"], "pending_current_correspondence")
        self.assertNotIn("native_range", node)
        discovery.retain(self.root / "saved-candidate", documents)
        discovery.retain(self.root / "saved-candidate", self.compose(), check=True)

    def test_legacy_predecessor_address_key_resolves_by_stable_question_identity(self):
        self.add_correspondence(predecessor_key="0x140000040")
        documents = self.compose()
        entry = next(row for row in documents[2]["entries"] if row["id"] == "pending-correspondence:retained-table")
        self.assertEqual(entry["finding_ids"], [73])
        self.assertEqual(entry["state"], "pending")

    def test_switch_frontier_predecessor_current_candidate_field_is_accepted(self):
        candidate = dict(virtual_address="0x140000050", end_exclusive="0x140000054",
                         byte_count=4, sha256="e" * 64)
        location = dict(dispatch_site="0x140000020", table_address="0x140000050")
        self.add_correspondence(candidate=candidate, candidate_location=location,
                                predecessor_candidate_field="current_native_candidate")
        documents = self.compose()
        node = next(row for row in documents[1]["nodes"] if row["id"] == "pending-correspondence:retained-table")
        self.assertEqual(node["historical_native_range"]["virtual_address"], "0x140000040")
        self.assertEqual(node["current_native_candidate"], candidate)
        self.assertEqual((node["ownership"], node["semantic_status"]), ("unknown", "pending_current_correspondence"))

    def test_predecessor_candidate_aliases_must_agree(self):
        span = dict(virtual_address="0x140000040", end_exclusive="0x140000044",
                    byte_count=4, sha256="d" * 64)
        self.add_correspondence(previous_changes=dict(current_native_candidate=span))
        self.compose()
        self.add_correspondence(previous_changes=dict(current_native_candidate=dict(span, sha256="e" * 64)))
        with self.assertRaisesRegex(ValueError, "candidate aliases conflict"):
            self.compose()

    def test_published_switch_frontier_witness_enters_pending_graph_without_adapters(self):
        spec = importlib.util.spec_from_file_location("switch_frontier_fixture", ROOT / "scripts/review-native-switch-frontier.py")
        frontier = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(frontier)
        candidate = dict(virtual_address="0x140000050", end_exclusive="0x140000054",
                         byte_count=4, sha256="e" * 64, dispatch_site="0x140000020")
        location = dict(site=candidate["dispatch_site"], table_address=candidate["virtual_address"])
        self.add_correspondence(candidate=candidate, candidate_location=location,
                                predecessor_candidate_field="current_native_candidate")
        correspondence = json.loads((self.root / "correspondence.json").read_text())
        full = dict(target=self.target, generator=dict(fixture=True), records=[], input_commitments=[self.source],
                    correspondence_candidates={candidate["dispatch_site"]: dict(native_candidate=candidate, location=location)})
        frontier.publish_results(self.root, full, dict(target=self.target), correspondence, [self.source], True)
        proof_path = "docs/analysis/evidence/fixture/computed-correspondence-frontier.json"
        published = json.loads((self.root / proof_path).read_text())
        reviews = json.loads((self.root / "reviews.json").read_text())
        record = reviews["pending_correspondence_leads"][0]
        record.update(evidence=self.commit(proof_path), proof=dict(selector=["leads", "retained-table"],
            sha256=discovery.digest(discovery.encoded(published["leads"]["retained-table"]))))
        self.write_json("reviews.json", reviews)
        documents = self.compose()
        node = next(row for row in documents[1]["nodes"] if row["id"] == "pending-correspondence:retained-table")
        self.assertEqual(node["current_native_candidate"], candidate)
        self.assertEqual(node["current_candidate_location"], location)
        self.assertEqual((node["ownership"], node["semantic_status"]), ("unknown", "pending_current_correspondence"))
        discovery.retain(self.root / "saved-producer-correspondence", documents)
        discovery.retain(self.root / "saved-producer-correspondence", self.compose(), check=True)

    def test_legacy_predecessor_candidate_still_rejects_substituted_range(self):
        self.add_correspondence(predecessor_candidate_field="current_native_candidate",
                                previous_changes=dict(current_native_candidate=dict(byte_count=99)))
        with self.assertRaisesRegex(ValueError, "predecessor identity or range"):
            self.compose()

    def test_correspondence_current_candidate_requires_current_target_and_valid_range(self):
        candidate = dict(virtual_address="0x140000050", end_exclusive="0x140000054",
                         byte_count=4, sha256="e" * 64)
        self.add_correspondence(candidate=candidate, candidate_target=dict(self.target, sha256="f" * 64))
        with self.assertRaisesRegex(ValueError, "Stale target"):
            self.compose()
        self.add_correspondence(candidate=dict(candidate, byte_count=5))
        with self.assertRaisesRegex(ValueError, "candidate range"):
            self.compose()

    def test_correspondence_rejects_substituted_predecessor_and_stale_source(self):
        self.add_correspondence(previous_changes=dict(native_candidate=dict(byte_count=99)))
        with self.assertRaisesRegex(ValueError, "predecessor identity or range"):
            self.compose()
        self.add_correspondence()
        self.write("source.rs", "changed source consumer\n")
        with self.assertRaisesRegex(ValueError, "Stale input"):
            self.compose()

    def test_correspondence_rejects_wrong_target_and_changed_proof(self):
        self.add_correspondence()
        document = json.loads((self.root / "correspondence.json").read_text())
        document["target"]["sha256"] = "f" * 64
        receipt = self.write_json("correspondence.json", document)
        reviews = json.loads((self.root / "reviews.json").read_text())
        reviews["pending_correspondence_leads"][0]["evidence"] = receipt
        self.write_json("reviews.json", reviews)
        with self.assertRaisesRegex(ValueError, "Stale target"):
            self.compose()
        self.add_correspondence()
        reviews = json.loads((self.root / "reviews.json").read_text())
        reviews["pending_correspondence_leads"][0]["proof"]["sha256"] = "f" * 64
        self.write_json("reviews.json", reviews)
        with self.assertRaisesRegex(ValueError, "Stale pending correspondence proof"):
            self.compose()

    def test_pending_native_wrong_target_cannot_enter_current_queue(self):
        self.add_pending_native(proof_changes=dict(target=dict(self.target, sha256="f" * 64)))
        with self.assertRaisesRegex(ValueError, "Stale target"):
            self.compose()

    def test_pending_native_invalid_range_or_hash_is_rejected(self):
        original = dict(virtual_address="0x140000030", end_exclusive="0x140000034",
                        byte_count=4, sha256="d" * 64)
        for changes in (dict(end_exclusive="0x140000030"), dict(byte_count=3),
                        dict(byte_count=True), dict(virtual_address="bad"), dict(sha256="bad")):
            with self.subTest(changes=changes):
                self.add_pending_native(proof_changes=dict(native_candidate=dict(original, **changes)))
                with self.assertRaisesRegex(ValueError, "Invalid pending native range"):
                    self.compose()

    def test_pending_native_invalid_evidence_selector_is_rejected(self):
        for selector in ([], "native_candidate", ["absent"]):
            with self.subTest(selector=selector):
                self.add_pending_native(dict(proof=dict(selector=selector, sha256="a" * 64)))
                with self.assertRaisesRegex(ValueError, "range selector"):
                    self.compose()

    def test_pending_native_missing_or_stale_inputs_and_source_are_rejected(self):
        for changes in (dict(inputs=[]), dict(source_first={}),
                        dict(inputs=[self.source]), dict(evidence=dict(path="missing.json", sha256="a" * 64))):
            with self.subTest(changes=changes):
                self.add_pending_native(changes)
                with self.assertRaises((ValueError, FileNotFoundError)):
                    self.compose()
        self.add_pending_native()
        self.write("native-result.c", "changed producer output\n")
        with self.assertRaisesRegex(ValueError, "Stale input"):
            self.compose()

    def test_pending_native_admits_only_exact_frozen_tool_provenance(self):
        (self.root / "scripts").mkdir()
        (self.root / "docs/analysis").mkdir(parents=True)
        provenance = self.write_json("docs/analysis/script-provenance.json", {})
        name = "scripts/producer.py"
        frozen = self.write(name, "original producer\n")
        live = self.write(name, "current producer\n")
        self.add_pending_native(dict(inputs=[frozen]), dict(inputs=[frozen]))
        with patch.object(discovery, "historical_matches", return_value=True) as match:
            profile, _, queue, _ = self.compose()
            match.assert_called_once_with(name, frozen["sha256"], self.root)
        self.assertIn(live, profile["inputs"])
        self.assertIn(provenance, profile["inputs"])
        entry = next(row for row in queue["entries"] if row["id"] == "pending-native:unresolved-native")
        self.assertEqual(entry["state"], "pending")
        with patch.object(discovery, "historical_matches", return_value=False):
            with self.assertRaisesRegex(ValueError, "Stale input commitment"):
                self.compose()

    def test_pending_native_cannot_claim_completed_semantics_or_ownership(self):
        for changes in (dict(state="reviewed_bounded"), dict(ownership="as_specific"), dict(complete=True)):
            with self.subTest(changes=changes):
                self.add_pending_native(changes)
                with self.assertRaisesRegex(ValueError, "cannot claim"):
                    self.compose()

    def test_structural_graph_never_promotes_filename_neighbor_or_source(self):
        documents = self.compose()
        self.assertTrue(all(row["ownership"] == "unknown" for row in documents[1]["nodes"]))
        self.assertTrue(all(row["state"] == "pending" for row in documents[2]["entries"]))
        self.assertIn("lexical_candidate_not_ownership", {edge["relation"] for edge in documents[1]["edges"]})
        self.assertIn("diagnostic_body_owner_not_semantic_ownership", {edge["relation"] for edge in documents[1]["edges"]})
        self.assertIn("diagnostic_site_without_flow_owner", {edge["relation"] for edge in documents[1]["edges"]})
        self.assertTrue(all(state == "partial" for state in documents[2]["stages"].values()))
        self.assertFalse(documents[2]["semantic_frontier_closed"])
        selector = next(row for row in documents[2]["entries"] if row["id"].startswith("unknown-selector:"))
        self.assertEqual(selector["selector"], self.unknown["sqlite_selectors"][0]["selector"])

    def add_container(self, **changes):
        container = dict(selector="encoded-pointer-length:40", preferred_va=0x14000000E,
                         byte_count=8, end_exclusive=0x140000016, sha256="e" * 64,
                         descriptor_rva=0x40, candidate_selectors=["Q41-I01:literal:0"],
                         role="UTF8_candidate_not_recovered_native_type",
                         ghidra_incoming=[{"from": "140000022", "to": "14000000e"}],
                         encoded_incoming=[dict(site="0x140000024", kind="address", target="0x14000000e")],
                         descriptor_ghidra_incoming=[{"from": "140000026", "to": "140000040"}],
                         descriptor_encoded_incoming=[dict(site="0x140000028", kind="address", target="0x140000048")])
        container.update(changes)
        receipt = self.write("containers.jsonl", json.dumps(container) + "\n")
        receipt["records"] = 1
        self.classification["outputs"]["string-containers.jsonl"] = receipt
        self.classification["preferred_image_base"] = 0x140000000
        self.write_json("classification.json", self.classification)
        return container

    def test_descriptor_payload_and_interior_candidate_refs_remain_independent(self):
        self.add_container()
        documents = self.compose()
        graph, queue = documents[1:3]
        payload = "string-container:encoded-pointer-length:40"
        descriptor = "string-descriptor:encoded-pointer-length:40"
        references = {(row["parent"], row["child"], row["relation"]) for row in graph["edges"]}
        self.assertIn(("native-site:preferred_va:0x140000022", payload, "container_payload_ghidra_incoming"), references)
        self.assertIn(("native-site:preferred_va:0x140000024", payload, "container_payload_encoded_incoming"), references)
        self.assertIn(("native-site:preferred_va:0x140000026", descriptor, "container_descriptor_ghidra_incoming"), references)
        self.assertIn(("native-site:preferred_va:0x140000028", descriptor, "container_descriptor_encoded_incoming"), references)
        self.assertIn((descriptor, payload, "encoded_pointer_length_candidate_not_native_type"), references)
        self.assertIn((payload, "Q41-I01:literal:0", "contains_candidate_bytes_not_semantic_ownership"), references)
        self.assertNotIn(("native-site:preferred_va:0x140000026", payload, "container_payload_ghidra_incoming"), references)
        self.assertNotIn(("native-site:preferred_va:0x140000024", "Q41-I01:literal:0", "encoded_incoming"), references)
        self.assertTrue(all(row["ownership"] == "unknown" for row in graph["nodes"]))
        self.assertTrue(all(row["state"] == "pending" for row in queue["entries"]))
        self.assertFalse(queue["semantic_frontier_closed"])
        discovery.retain(self.root / "saved", documents)
        discovery.retain(self.root / "saved", self.compose(), check=True)

    def test_legacy_manifest_without_container_export_still_composes(self):
        documents = self.compose()
        self.assertFalse(any(row["kind"] == "observed_string_container" for row in documents[1]["nodes"]))

    def test_container_requires_hashed_export_count_and_existing_exact_containment(self):
        self.add_container()
        self.write("containers.jsonl", "{}\n")
        with self.assertRaisesRegex(ValueError, "Stale input"):
            self.compose()
        for changes, error in ((dict(candidate_selectors=["unknown"]), "unknown candidate"),
                               (dict(candidate_selectors=["Q41-I01:literal:0"] * 2), "distinct exact"),
                               (dict(byte_count=4, end_exclusive=0x140000012), "outside its exact"),
                               (dict(end_exclusive=0x140000017), "range or hash")):
            with self.subTest(changes=changes):
                self.add_container(**changes)
                with self.assertRaisesRegex(ValueError, error):
                    self.compose()
        self.add_container()
        self.classification["outputs"]["string-containers.jsonl"]["records"] = 2
        self.write_json("classification.json", self.classification)
        with self.assertRaisesRegex(ValueError, "row count"):
            self.compose()

    def test_descriptorless_payload_cannot_receive_descriptor_refs(self):
        self.add_container(descriptor_rva=None)
        with self.assertRaisesRegex(ValueError, "no declared descriptor"):
            self.compose()
        self.add_container(descriptor_rva=None, descriptor_ghidra_incoming=[], descriptor_encoded_incoming=[])
        documents = self.compose()
        self.assertFalse(any(row["kind"] == "encoded_pointer_length_descriptor_candidate" for row in documents[1]["nodes"]))

    def test_reference_destination_in_wrong_address_family_is_rejected(self):
        self.add_container(ghidra_incoming=[{"from": "140000022", "to": "140000040"}])
        with self.assertRaisesRegex(ValueError, "outside its declared range"):
            self.compose()
        self.add_container(descriptor_encoded_incoming=[dict(site="0x140000028", target="0x140000010")])
        with self.assertRaisesRegex(ValueError, "outside its declared range"):
            self.compose()
        self.add_container()
        self.classification.pop("preferred_image_base")
        self.write_json("classification.json", self.classification)
        documents = self.compose()
        descriptor = next(row for row in documents[1]["nodes"] if row["kind"] == "encoded_pointer_length_descriptor_candidate")
        self.assertEqual(descriptor["native_range"], dict(rva="0x40", byte_count=16))
        self.assertEqual(descriptor["ownership"], "unknown")

    def test_exact_replay_resumes_and_status_promotion_is_rejected(self):
        documents = self.compose()
        directory = self.root / "saved"
        discovery.retain(directory, documents)
        discovery.retain(directory, self.compose(), check=True)
        original = (directory / "queue.json").read_bytes()
        forged = json.loads(original)
        forged["entries"][0]["state"] = "reviewed_bounded"
        (directory / "queue.json").write_bytes(discovery.encoded(forged))
        with self.assertRaisesRegex(ValueError, "status differs"):
            discovery.retain(directory, self.compose(), check=True)
        (directory / "queue.json").write_bytes(original)
        discovery.retain(directory, self.compose(), check=True)

    def test_changed_source_selects_new_profile_and_preserves_old(self):
        old = self.compose()
        directory = self.root / old[1]["profile_id"]
        discovery.retain(directory, old)
        self.write("source.rs", "changed producer\n")
        new = self.compose()
        self.assertNotEqual(old[1]["profile_id"], new[1]["profile_id"])
        self.assertEqual((directory / "profile.json").read_bytes(), discovery.encoded(old[0]))
        with self.assertRaisesRegex(ValueError, "status differs"):
            discovery.retain(directory, new, check=True)

    def test_stale_target_fails_before_graph_generation(self):
        stale = copy.deepcopy(self.unknown)
        stale["target"]["sha256"] = "e" * 64
        self.write_json("unknown.json", stale)
        with self.assertRaisesRegex(ValueError, "Stale target"):
            self.compose()

    def test_stale_target_size_fails(self):
        stale = copy.deepcopy(self.unknown)
        stale["target"]["size_bytes"] += 1
        self.write_json("unknown.json", stale)
        with self.assertRaisesRegex(ValueError, "Stale target size"):
            self.compose()

    def test_stale_declared_input_fails(self):
        self.write("leads.jsonl", "[]\n")
        with self.assertRaisesRegex(ValueError, "Stale input"):
            self.compose()

    def test_bounded_review_requires_query_result_and_source_commitments(self):
        self.add_review()
        documents = self.compose()
        reviewed = [row for row in documents[2]["entries"] if row["state"] == "reviewed_bounded"]
        self.assertEqual([row["id"] for row in reviewed], ["review:gap96"])
        self.assertEqual(reviewed[0]["semantic_status"], "bounded_review_only")
        self.assertFalse(documents[2]["global_native_semantics_complete"])
        discovery.retain(self.root / "saved", documents)
        discovery.retain(self.root / "saved", self.compose(), check=True)

    def test_stale_review_result_cannot_resume(self):
        self.add_review()
        self.compose()
        self.write("native-result.c", "tampered\n")
        with self.assertRaisesRegex(ValueError, "Stale input"):
            self.compose()

    def test_stale_source_review_is_pending_only_with_explicit_policy(self):
        self.add_review()
        self.write("source.rs", "changed source after bounded review\n")
        with self.assertRaisesRegex(ValueError, "Stale source review"):
            self.compose()
        self.paths["retain_stale_source_reviews"] = True
        documents = self.compose()
        review = next(row for row in documents[2]["entries"] if row["id"] == "review:gap96")
        self.assertEqual(review["state"], "pending_source_revalidation")
        node = next(row for row in documents[1]["nodes"] if row["id"] == "review:gap96")
        self.assertEqual(node["ownership"], "unknown")
        self.assertEqual(node["semantic_status"], "stale_source_review")
        self.assertEqual(node["review"]["source_first"]["paths"][0], self.source)

    def test_stale_query_cannot_promote_status(self):
        review = copy.deepcopy(self.review)
        review["query"]["sha256"] = "f" * 64
        self.add_review(review)
        with self.assertRaisesRegex(ValueError, "Stale query"):
            self.compose()

    def test_missing_source_first_and_result_are_rejected(self):
        for key in ("source_first", "results"):
            review = copy.deepcopy(self.review)
            review.pop(key)
            self.add_review(review)
            with self.assertRaises(ValueError):
                self.compose()

    def test_malformed_source_and_result_commitments_never_promote(self):
        malformed = ["not-a-list", [], ["not-a-commitment"], [{"path": "source.rs"}],
                     [{"sha256": "a" * 64}], [{"path": "source.rs", "sha256": "bad"}],
                     [{"path": "source.rs", "sha256": 4}],
                     [{"path": "source.rs", "sha256": "a" * 64, "extra": True}]]
        for values in malformed:
            for field in ("source", "results"):
                with self.subTest(values=values, field=field):
                    review = copy.deepcopy(self.review)
                    if field == "source":
                        review["source_first"]["paths"] = values
                    else:
                        review["results"] = values
                    self.add_review(review)
                    with self.assertRaises(ValueError):
                        self.compose()

    def test_malformed_evidence_commitment_never_promotes(self):
        for value in ("evidence.json", {"path": "evidence.json"}, {"path": "evidence.json", "sha256": "bad"}):
            review = copy.deepcopy(self.review)
            review["evidence"] = value
            self.add_review(review)
            with self.assertRaises(ValueError):
                self.compose()

    def test_missing_navigation_source_is_explicit_not_reviewable(self):
        (self.root / "source.rs").unlink()
        documents = self.compose()
        self.assertIn(dict(path="source.rs", exists=False), documents[0]["inputs"])
        self.add_review()
        with self.assertRaises(FileNotFoundError):
            self.compose()

    def test_arbitrary_hashed_result_is_not_query_evidence(self):
        review = copy.deepcopy(self.review)
        review["results"] = [self.source]
        self.add_review(review)
        with self.assertRaisesRegex(ValueError, "not bound"):
            self.compose()

    def test_sibling_query_export_cannot_satisfy_selected_query(self):
        other = self.write("other-native-result.c", "different native owner\n")
        sibling = dict(evidence_id="ev_other", extract=other)
        self.evidence = self.write_json("evidence.json", dict(
            target=self.target, query=self.query, sibling_query=sibling))
        review = copy.deepcopy(self.review)
        review["evidence"] = self.evidence
        review["results"] = [other]
        self.add_review(review)
        documents = self.compose()
        node = next(row for row in documents[1]["nodes"] if row["id"] == "review:gap96")
        self.assertEqual(node["ownership"], "unknown")
        self.assertEqual(node["semantic_status"], "query_result_linkage_unproved")
        self.assertEqual(node["review"]["state"], "pending_query_result_linkage")
        self.assertEqual(node["review"]["unlinked_results"], [other])
        self.assertFalse(node["review"]["complete"])

    def test_manifest_only_export_does_not_claim_retained_raw_query_result(self):
        # A canonical assembly range elsewhere in the manifest is useful
        # evidence, but sharing a manifest does not bind it to this query.
        query = dict(evidence_id="ev_fixture", normalized_result_sha256="b" * 64)
        evidence = self.write_json("evidence.json", dict(
            target=self.target, query=query, extracts={self.native["path"]: self.native["sha256"]}))
        review = copy.deepcopy(self.review)
        review["evidence"] = evidence
        review["query"]["sha256"] = discovery.digest(discovery.encoded(query))
        self.add_review(review)
        documents = self.compose()
        node = next(row for row in documents[1]["nodes"] if row["id"] == "review:gap96")
        self.assertEqual(node["review"]["state"], "pending_query_result_linkage")
        self.assertEqual(node["review"]["result_receipts"][0]["kind"], "manifest_declared_unlinked_export")

    def test_selected_range_canonical_export_remains_bounded_review(self):
        query = dict(ghidra_evidence_id="ev_fixture", start="0x140000018", size=12,
                     extract=self.native["path"], extract_sha256=self.native["sha256"])
        evidence = self.write_json("evidence.json", dict(target=self.target, ranges=[query]))
        review = copy.deepcopy(self.review)
        review["evidence"] = evidence
        review["query"] = dict(selector=["ranges", 0], sha256=discovery.digest(discovery.encoded(query)))
        self.add_review(review)
        documents = self.compose()
        node = next(row for row in documents[1]["nodes"] if row["id"] == "review:gap96")
        self.assertEqual(node["review"]["state"], "reviewed_bounded")
        self.assertEqual(node["review"]["result_receipts"][0]["kind"], "manifest_bound_export")
        self.assertEqual(node["review"]["unlinked_results"], [])

    def test_mixed_selected_and_sibling_exports_cannot_promote_review(self):
        other = self.write("other-native-result.c", "different native owner\n")
        evidence = self.write_json("evidence.json", dict(
            target=self.target, query=self.query, sibling_query=dict(evidence_id="ev_other", extract=other)))
        review = copy.deepcopy(self.review)
        review["evidence"] = evidence
        review["results"] = [self.native, other]
        self.add_review(review)
        documents = self.compose()
        node = next(row for row in documents[1]["nodes"] if row["id"] == "review:gap96")
        self.assertEqual(node["review"]["state"], "pending_query_result_linkage")
        self.assertEqual(node["ownership"], "unknown")

    def test_source_staleness_and_missing_query_link_are_both_retained(self):
        other = self.write("other-native-result.c", "different native owner\n")
        evidence = self.write_json("evidence.json", dict(
            target=self.target, query=self.query, sibling_query=dict(evidence_id="ev_other", extract=other)))
        review = copy.deepcopy(self.review)
        review["evidence"] = evidence
        review["results"] = [other]
        self.add_review(review)
        self.write("source.rs", "changed source\n")
        self.paths["retain_stale_source_reviews"] = True
        documents = self.compose()
        node = next(row for row in documents[1]["nodes"] if row["id"] == "review:gap96")
        self.assertEqual(node["review"]["state"], "pending_source_revalidation")
        self.assertEqual(node["ownership"], "unknown")
        self.assertEqual(node["review"]["unlinked_results"], [other])
        self.assertTrue(node["review"]["stale_sources"])

    def add_finding_binding(self, binding=None):
        binding = binding or dict(
            id="literal-finding", selectors=["Q41-I01:literal:0"], finding_ids=[98],
            conclusion="This exact inspected candidate is the existing finding's native lead.",
            evidence=self.commit("classification.json"),
            proof=dict(selector=["outputs", "embedded-classification.jsonl"],
                       sha256=discovery.digest(discovery.encoded(
                           self.classification["outputs"]["embedded-classification.jsonl"]))))
        self.write_json("reviews.json", dict(target=self.target, reviews=[], finding_bindings=[binding]))
        self.paths["reviews"] = "reviews.json"
        return binding

    def test_explicit_finding_binding_preserves_pending_status_and_ownership(self):
        self.add_finding_binding()
        documents = self.compose()
        entry = next(row for row in documents[2]["entries"] if row["id"] == "Q41-I01:literal:0")
        self.assertEqual(entry["finding_ids"], [41, 98])
        self.assertEqual(entry["state"], "pending")
        node = next(row for row in documents[1]["nodes"] if row["id"] == entry["id"])
        self.assertEqual(node["ownership"], "unknown")
        self.assertEqual(node["semantic_status"], "structural_only")
        other = next(row for row in documents[2]["entries"] if row["id"] == "module:custom-fixture")
        self.assertEqual(other["finding_ids"], [41, 96])
        self.assertFalse(documents[2]["semantic_frontier_closed"])
        discovery.retain(self.root / "saved", documents)
        discovery.retain(self.root / "saved", self.compose(), check=True)

    def test_finding_bindings_resolve_pending_queue_families_without_promoting_them(self):
        for kind, add, family in (
                ("native", self.add_pending_native, "pending_native_leads"),
                ("correspondence", self.add_correspondence, "pending_correspondence_leads")):
            with self.subTest(kind=kind):
                add()
                path = self.root / "reviews.json"
                document = json.loads(path.read_text())
                lead = document[family][0]
                document["finding_bindings"] = [dict(
                    id="late-" + kind, selectors=[lead["selector"]], finding_ids=[98],
                    conclusion="Exact existing pending question is attributed only.",
                    evidence=lead["evidence"], proof=lead["proof"])]
                self.write_json("reviews.json", document)
                documents = self.compose()
                entry = next(row for row in documents[2]["entries"] if row["selector"] == lead["selector"])
                self.assertEqual(entry["state"], "pending")
                self.assertIn(98, entry["finding_ids"])
                node = next(row for row in documents[1]["nodes"] if row["id"] == entry["id"])
                self.assertEqual(node["ownership"], "unknown")
                self.assertFalse(node["lead"]["complete"])
                self.assertEqual(node["lead"]["source_first"], lead["source_first"])
                discovery.retain(self.root / ("saved-late-" + kind), documents)
                discovery.retain(self.root / ("saved-late-" + kind), self.compose(), check=True)

    def test_finding_binding_requires_an_exact_existing_selector(self):
        binding = self.add_finding_binding()
        binding["selectors"] = ["Q41-I01:literal:*"]
        self.add_finding_binding(binding)
        with self.assertRaisesRegex(ValueError, "exact queue selector"):
            self.compose()

    def test_stale_finding_binding_proof_fails(self):
        binding = self.add_finding_binding()
        binding["proof"]["sha256"] = "f" * 64
        self.add_finding_binding(binding)
        with self.assertRaisesRegex(ValueError, "Stale finding binding proof"):
            self.compose()

    def test_malformed_finding_bindings_cannot_annotate_candidates(self):
        binding = self.add_finding_binding()
        for field, value in (("selectors", "Q41-I01:literal:0"), ("selectors", ["Q41-I01:literal:0"] * 2),
                             ("finding_ids", [True]), ("finding_ids", [0]), ("finding_ids", [98, 98])):
            with self.subTest(field=field, value=value):
                malformed = copy.deepcopy(binding)
                malformed[field] = value
                self.add_finding_binding(malformed)
                with self.assertRaises(ValueError):
                    self.compose()

    def test_final_stability_rehash_detects_shared_source_race(self):
        inputs = discovery.Inputs(self.root)
        inputs.load("evidence.json")
        self.write("evidence.json", "changed after parse\n")
        with self.assertRaisesRegex(ValueError, "Stale input"):
            inputs.stable()

    def test_portable_target_metadata_uses_registered_identity_without_copy(self):
        (self.root / "docs/analysis/coverage").mkdir(parents=True)
        current = dict(version="0.139.0", path="installed-game/AzerothSurvivors.exe",
                       sha256="a" * 64, size_bytes=64)
        historical = dict(current, version="0.127.0", sha256="b" * 64, size_bytes=32)
        registry = self.write_json("docs/analysis/coverage/targets.json",
                                   dict(targets=[historical, current]))
        inputs = discovery.Inputs(self.root)
        inputs.references(dict(target=current, predecessor=dict(target=historical),
                               evidence=self.source))
        self.assertEqual(inputs.commitments[registry["path"]], registry)
        self.assertIn("source.rs", inputs.commitments)
        self.assertFalse((self.root / current["path"]).exists())
        inputs.stable()

    def test_portable_target_metadata_rejects_unregistered_or_incomplete_identity(self):
        (self.root / "docs/analysis/coverage").mkdir(parents=True)
        target = dict(version="0.139.0", path="installed-game/AzerothSurvivors.exe",
                      sha256="a" * 64, size_bytes=64)
        self.write_json("docs/analysis/coverage/targets.json", dict(targets=[target]))
        for changed in (dict(target, sha256="b" * 64), dict(target, size_bytes=32),
                        dict(target, version="0.127.0"),
                        {k: v for k, v in target.items() if k != "size_bytes"}):
            with self.subTest(changed=changed), self.assertRaisesRegex(ValueError, "Unregistered"):
                discovery.Inputs(self.root).references(dict(target=changed))

    def test_target_named_field_does_not_bypass_ordinary_file_hashes(self):
        with self.assertRaisesRegex(ValueError, "Stale input"):
            discovery.Inputs(self.root).references(dict(target=dict(self.source, sha256="0" * 64)))

    def test_observed_source_disappearance_cannot_replace_its_hash(self):
        inputs = discovery.Inputs(self.root)
        inputs.observe_source("source.rs")
        (self.root / "source.rs").unlink()
        with self.assertRaisesRegex(ValueError, "disappeared"):
            inputs.observe_source("source.rs")

    def test_changed_generator_dependency_selects_distinct_profile(self):
        old = self.compose()
        self.generator["dependencies"] = [self.write("fixture-helper", "changed helper\n")]
        new = self.compose()
        self.assertNotEqual(old[1]["profile_id"], new[1]["profile_id"])

    def test_known_script_alias_resolves_without_historical_hash_promotion(self):
        path = self.root / "docs/analysis"
        path.mkdir(parents=True)
        self.write_json("docs/analysis/script-provenance.json", dict(relocations={
            "former.py": dict(replacement="source.rs")}))
        observed = discovery.Inputs(self.root).observe_source("former.py")
        self.assertEqual(observed, self.source)

    def test_project_escape_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "escapes project"):
            discovery.Inputs(self.root).commit("../external")


if __name__ == "__main__":
    unittest.main()
