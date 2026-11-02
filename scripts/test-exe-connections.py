#!/usr/bin/env python3
"""Non-compiling checks of the EXE/source audit's evidence distinctions."""
import importlib.util
import unittest
from pathlib import Path
from unittest.mock import patch

spec = importlib.util.spec_from_file_location("audit_connections", Path(__file__).with_name("audit-exe-connections.py"))
audit = importlib.util.module_from_spec(spec)
spec.loader.exec_module(audit)


class EvidencePartition(unittest.TestCase):
    def test_current_contract_membership_is_not_an_unrelated_system_contract(self):
        binding = {"target_sha256": "current", "validity": "current_bounded_ground_contract_only",
                   "bounded_contract_system_ids": ["ground"]}
        bindings = {"ground.json": binding}
        self.assertEqual(audit.reference_partition(bindings, bindings, "current", "ground")["current_bounded_contracts"], ["ground.json"])
        unrelated = audit.reference_partition(bindings, bindings, "current", "menu")
        self.assertEqual(unrelated["current"], ["ground.json"])
        self.assertEqual(unrelated["current_bounded_contracts"], [])
        self.assertEqual(audit.reference_partition(bindings, bindings, "current")["current_bounded_contracts"], [])

    def test_malformed_or_unregistered_contract_owners_are_rejected(self):
        for field in ("system_ids", "bounded_contract_system_ids"):
            for malformed in (None, "ground", [1], [""]):
                with self.subTest(field=field, malformed=malformed):
                    bindings = {"contract.json": {"target_sha256": "current", field: malformed}}
                    with self.assertRaisesRegex(ValueError, "ownership list"):
                        audit.reference_partition(bindings, bindings, "current", "ground")
            bindings = {"contract.json": {"target_sha256": "current", field: ["absent"]}}
            with self.subTest(field=field), self.assertRaisesRegex(ValueError, "unregistered system"):
                audit.system_rows({"systems": [], "evidence_target_bindings": bindings}, {"paths": []}, [], "current")

    def test_general_owners_restrict_contracts_and_bounded_owners_can_narrow_them(self):
        binding = {"target_sha256": "current", "validity": "selected_target_bounded_name_construction_and_consumers",
                   "system_ids": ["inventory", "addon"]}
        bindings = {"names.json": binding}
        self.assertEqual(audit.reference_partition(bindings, bindings, "current", "addon")["current_bounded_contracts"], ["names.json"])
        unrelated = audit.reference_partition(bindings, bindings, "current", "menu")
        self.assertEqual(unrelated["current"], ["names.json"])
        self.assertEqual(unrelated["current_bounded_contracts"], [])
        self.assertEqual(audit.reference_partition(bindings, bindings, "current")["current_bounded_contracts"], [])
        binding["bounded_contract_system_ids"] = ["inventory"]
        self.assertEqual(audit.reference_partition(bindings, bindings, "current", "inventory")["current_bounded_contracts"], ["names.json"])
        self.assertEqual(audit.reference_partition(bindings, bindings, "current", "addon")["current_bounded_contracts"], [])
        binding["bounded_contract_system_ids"] = []
        self.assertEqual(audit.reference_partition(bindings, bindings, "current", "inventory")["current_bounded_contracts"], [])
        binding["bounded_contract_system_ids"] = ["menu"]
        with self.assertRaisesRegex(ValueError, "exceeds general system scope"):
            audit.reference_partition(bindings, bindings, "current", "menu")

    def test_current_diagnostic_link_does_not_establish_behavior(self):
        bindings = {
            "diagnostics.json": {"target_sha256": "current", "validity": "current_exact_input_discovery_or_locale_data_only_no_whole_system_semantics_or_parity"},
            "contract.json": {"target_sha256": "current", "validity": "current_bounded_raid_contract_only_no_whole_subsystem_or_runtime_parity"},
            "historical.json": {"target_sha256": "old", "validity": "current_bounded_contract"},
        }
        rows = audit.reference_partition([*bindings, "unknown.json"], bindings, "current")
        self.assertEqual(rows["current_bounded_contracts"], ["contract.json"])
        self.assertEqual(rows["historical"], ["historical.json"])
        self.assertEqual(rows["other_or_unbound"], ["unknown.json"])
        self.assertEqual(rows["current"], ["contract.json", "diagnostics.json"])

    def test_selected_contract_is_bounded_but_selected_inventory_is_not(self):
        bindings = {
            "navigation.json": {"target_sha256": "current", "validity": "current_selected_ground_navigation_and_publication_contracts_only"},
            "pets.json": {"target_sha256": "current", "validity": "current_selected_ordinary_weapons_pets_contracts_only_no_parity"},
            "census.json": {"target_sha256": "current", "validity": "current_selected_native_inventory_only"},
        }
        self.assertEqual(audit.reference_partition(bindings, bindings, "current")["current_bounded_contracts"],
                         ["navigation.json", "pets.json"])

    def test_selected_target_behavior_labels_require_the_current_hash(self):
        validities = (
            "selected_target_bounded_revive_contracts_not_runtime_or_parity",
            "selected_target_bounded_raid_source_lifetime_not_whole_system_or_parity",
            "selected_target_bounded_solo_raid_targets_not_whole_system_or_parity",
            "selected_target_bounded_contract_with_open_runtime_parity",
            "selected_target_bounded_name_construction_and_consumers",
            "selected_target_bounded_coop_source_contracts_not_full_implementation_runtime_or_parity",
        )
        for validity in validities:
            with self.subTest(validity=validity):
                bindings = {
                    "current.json": {"target_sha256": "current", "validity": validity},
                    "changed-same-version.json": {"target_sha256": "old", "validity": validity},
                    "unbound.json": {"validity": validity},
                }
                result = audit.reference_partition(bindings, bindings, "current")
                self.assertEqual(result["current_bounded_contracts"], ["current.json"])
                self.assertEqual(result["historical"], ["changed-same-version.json"])
                self.assertEqual(result["other_or_unbound"], ["unbound.json"])

    def test_selected_target_classifiers_are_current_links_without_behavior(self):
        validities = (
            "selected_target_bounded_diagnostic_interface_classification_only",
            "selected_target_byte_resource_and_reference_classification_only",
            "selected_target_static_population_classification_not_semantic_closure",
            "selected_target_bounded_unreviewed_classification_only",
            "current_declared_entry_flow_observations_semantics_and_parity_unverified",
            "current_exact_census_proof_input_commitments_only",
        )
        bindings = {str(index): {"target_sha256": "current", "validity": validity}
                    for index, validity in enumerate(validities)}
        result = audit.reference_partition(bindings, bindings, "current")
        self.assertEqual(result["current"], sorted(bindings))
        self.assertEqual(result["current_bounded_contracts"], [])

    def test_bounded_contract_links_never_promote_system_semantics_or_parity(self):
        systems = {"systems": [{"id": "one", "original_path": "game.rs", "source_refs": ["source.rs"],
                   "gap_ids": [41], "evidence_refs": ["contract.json"], "remaining_source_work": []}],
                   "evidence_target_bindings": {"contract.json": {"target_sha256": "current", "system_ids": ["one"],
                       "validity": "selected_target_bounded_contract_with_open_runtime_parity"}}}
        row = audit.system_rows(systems, {"paths": [{"path": "game.rs"}]}, [], "current")[0]
        self.assertTrue(row["registered_current_bounded_contract_present"])
        self.assertEqual(row["evidence_links"]["current_bounded_contracts"], ["contract.json"])
        self.assertFalse(row["whole_system_semantics_verified"])
        self.assertFalse(row["parity_verified"])

    def test_census_requires_identical_current_target_and_committed_parent(self):
        target = dict(version="0.110.0", path="installed-game/AzerothSurvivors.exe", sha256="new", size_bytes=10)
        census = {"target": target, "independent_instructions": {"exact_source_bytes_verified": True}, "artifacts": {"files": {}}}
        historical = {"current_native_body_census": {"path": "runtime/test-census.json", "sha256": "digest"}}
        with patch.object(audit, "file_sha256", return_value="digest"), patch.object(audit, "load_json", return_value=census):
            self.assertEqual(audit.census_input(historical, target)[0], "runtime/test-census.json")
            with self.assertRaisesRegex(ValueError, "must use the selected"):
                audit.census_input(historical, target, "runtime/other.json")
            census["target"] = {**target, "sha256": "old"}
            with self.assertRaisesRegex(ValueError, "selected installed EXE"):
                audit.census_input(historical, target)

    def test_no_containing_body_is_not_a_function_or_missing_source(self):
        systems = {"systems": [{"id": "one", "original_path": "game.rs", "source_refs": ["source.rs"],
                   "gap_ids": [41], "evidence_refs": [], "remaining_source_work": []}], "evidence_target_bindings": {}}
        sites = [{"path": "game.rs", "reference_kind": "rust_location", "site": "0x1000", "actual_native_owner": None}]
        result = audit.system_rows(systems, {"paths": [{"path": "game.rs"}]}, sites, "current")[0]
        self.assertEqual(result["ownerless_location_sites"], ["0x1000"])
        self.assertEqual(result["location_body_owners"], [])
        self.assertEqual(result["source_refs"], ["source.rs"])
        self.assertFalse(result["whole_system_semantics_verified"])
        self.assertFalse(result["parity_verified"])

    def test_unregistered_path_cannot_disappear_from_crosswalk(self):
        with self.assertRaises(ValueError):
            audit.system_rows({"systems": [], "evidence_target_bindings": {}},
                              {"paths": [{"path": "new.rs"}]}, [], "current")

    def test_changed_same_version_target_is_rejected(self):
        target = dict(version="0.109.0", path="installed-game/AzerothSurvivors.exe", sha256="new", size_bytes=10)
        with self.assertRaises(ValueError):
            audit.same_target({"target": {**target, "sha256": "old"}}, target)


if __name__ == "__main__":
    unittest.main()
