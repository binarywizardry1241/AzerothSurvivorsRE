#!/usr/bin/env python3
"""Check only current native Hero/State metadata and its actual source producers."""
import argparse
import json

from coverage_common import ROOT
from script_sources import load_script

DEST = ROOT / "docs/analysis/evidence/coop-native-metadata"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    args = parser.parse_args()
    # Reuse the canonical current native byte/query evidence; do not duplicate
    # extracts under this source-delivery subset.
    full = load_script("metadata_wire_owner", ROOT / "scripts/check-coop-heroic-wire.py")
    proof = json.loads(full.MANIFEST.read_text())
    verifier = load_script("metadata_native_verify", ROOT / "scripts/check-coop-scaling.py")
    verifier.verify(proof)
    result = full.replay(proof, metadata_only=True)
    root = ROOT / "crates/azeroth-survivors-re/src"
    requirements = {
        "coop/server_party.rs": ["pub equipment_stars: [u8; 19]", "pub pity: Vec<(u32, u8)>",
            "pub heroic_unlocks: Vec<u8>", "pub weapon_glow: u32", "out.extend_from_slice(&hero.equipment_stars)",
            "for &(id, misses) in &hero.pity", "bytes(&mut out, &hero.heroic_unlocks)?",
            "out.extend_from_slice(&hero.weapon_glow.to_le_bytes())"],
        "coop/replication.rs": ["pub active_set: u8", "pub heroic_rank: u8", "pub boss_counter: u32",
            "pub max_equipment_stars: u8", "out.push(state.heroic_rank)", "out.push(member.active_set)",
            "state.max_equipment_stars, state.active_set", "let count = self.count(7)?.min(5)"],
        "coop/client_state.rs": ["pub run_marks: f32", "pub max_boss_marks: f32", "state.boss_counter.min(boss_limit)",
            "run_marks.clamp(0.0, 4000.0)", "max_boss_marks.clamp(0.0, 400.0)"],
        "coop_profile.rs": ["gear.equipment_stars(pick.hero.class)", "records.pity.into_iter().filter",
            "save.max_heroic_rank(pick.hero.class, zone.key)", "save.weapon_glow(pick.hero.class)",
            "game.configure_armor_set(hero.words_188, hero.equipment_stars)"],
        "armory.rs": ["stars: &[u8; 19]", "zip(stars.iter().copied())",
            "(crate::save::gear::canonical_id(id), count.min(5))"],
        "gameplay/mechanics/effects.rs": ["pub equipment_stars: [u8; 19]", "pub set_descriptor:",
            "pub fn configure_armor_set", "self.effect_state.equipment_stars = stars",
            "sets::equipped_descriptor(", "pub fn equipment_stars", "pub fn item_star_rank",
            "self.equipment_ids.iter().zip(self.effect_state.equipment_stars)"],
        "gameplay/mechanics/coop.rs": ["heroic_rank: self.rules.heroic_rank",
            "boss_counter: self.endless_boss_kills()", "float_84_bits: self.run_marks().to_bits()",
            "float_88_bits: self.max_boss_marks().to_bits()", "max_equipment_stars: self.equipment_stars()",
            "active_set: self.effect_state.set_descriptor.map_or(0, |set| set.tier + 1)",
            "flag_34: self.heroic_rank() >= 3", "hero.state.effect_state.set_descriptor.map_or(0, |set| set.tier + 1)"],
        "gameplay/mechanics/party_achievements.rs": ["talents: &[String], active_set: u8)",
            "NativeFeatMember { class, word, byte, active_set }"],
        "gameplay/mod.rs": ["game.configure_armor_set(session.starting_gear, session.starting_stars)"],
    }
    for name, fragments in requirements.items():
        source = (root / name).read_text()
        for fragment in fragments:
            assert fragment in source, (name, fragment)
    result.update(target=proof["target"], canonical_native_manifest=str(full.MANIFEST.relative_to(ROOT)),
                  checked_source_files=list(requirements), source_scope="Metadata producers/storage/typed codecs only",
                  excluded_source=["Admission", "Private Save receivers/rewards", "Set effect application", "UI"],
                  dependencies=["Current accepted-snapshot settlement consumers for renamed RunProjection fields (#226)"],
                  included_counter_interfaces=["run_marks", "max_boss_marks", "endless_boss_kills"],
                  compiled=False, target_executed=False, parity="unverified")
    path = DEST / "static-check.json"
    if args.write:
        DEST.mkdir(exist_ok=True)
        path.write_text(json.dumps(result, indent=2) + "\n")
    else:
        assert result == json.loads(path.read_text())
    print(json.dumps({"metadata_wire_fixtures": len(result["wire_fixtures"]),
                      "original_instruction_steps": result["original_instruction_steps"],
                      "source_files": len(requirements), "compiled": False, "target_executed": False}))


if __name__ == "__main__":
    main()
