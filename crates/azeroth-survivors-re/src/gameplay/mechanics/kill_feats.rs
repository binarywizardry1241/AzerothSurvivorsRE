//! Current feat snapshots consume ordered lethal hits and incoming-boss history.
use super::*;

impl Mechanics {
    pub fn killing_blows(&self) -> &[(u32, u32)] {
        &self.effect_state.generic.killing_blows
    }

    pub fn boss_killing_blows(&self) -> &[azeroth_survivors_re::account_progression::BossKillingBlow] {
        &self.effect_state.generic.boss_killing_blows
    }

    pub fn personal_boss_killing_blows(
        &self,
    ) -> &[azeroth_survivors_re::account_progression::BossKillingBlow] {
        &self.effect_state.generic.personal_boss_killing_blows
    }

    pub fn graduation_enhancement(&self) -> bool {
        self.effect_state.graduation_enhancement
    }

    pub fn damaged_by_bosses(&self) -> &[u32] {
        &self.effect_state.generic.damaged_by_bosses
    }

    /// Native1458ec805..939 records an admitted metadata-bearing source before
    /// HP subtraction/retaliation; even an absorbed hit enters this history.
    pub(super) fn record_incoming_boss(&mut self, source_guid: u64) {
        if let Some(boss) = self.bosses.iter().find(|row| row.guid == source_guid) {
            let history = &mut self.effect_state.generic.damaged_by_bosses;
            if !history.contains(&boss.definition.id) {
                history.push(boss.definition.id);
            }
        }
    }
}

// 0.140.0 0x146058213: sum allocated ranks in rows 0–6 of each Shaman tree.
pub(super) fn graduation_enhancement(class: u8, allocation: &[(String, u8)]) -> bool {
    use crate::save::talents::{Allocation, catalog, previous_rows};

    if class != 7 {
        return false;
    }
    let allocation = allocation.iter().cloned().collect::<Allocation>();
    let trees = &catalog().class(class).trees;
    let enhancement = previous_rows(&trees[1], &allocation, 7);
    enhancement > previous_rows(&trees[0], &allocation, 7)
        && enhancement > previous_rows(&trees[2], &allocation, 7)
}

#[cfg(test)]
mod tests {
    use super::*;
    use super::super::rng_integration::{class_run, TerrainFixture};

    #[test]
    fn graduation_requires_enhancement_to_be_the_highest_point_tree() {
        let mut shaman = class_run("shaman", 0);
        assert!(!shaman.graduation_enhancement());
        shaman.configure_effects(&[("enh_thundering_strikes".into(), 3)], &[]);
        assert!(shaman.graduation_enhancement());
        for other in ["convection", "tidal_focus"] {
            shaman.configure_effects(
                &[("enh_thundering_strikes".into(), 3), (other.into(), 3)],
                &[],
            );
            assert!(!shaman.graduation_enhancement());
        }
    }

    #[test]
    fn player_and_captured_water_elemental_frostbolts_record_only_the_lethal_boss_hit() {
        for kind in [0, 2] {
            let mut game = class_run("mage", 0);
            game.abilities[0].remaining = f32::INFINITY;
            let mut terrain = TerrainFixture;
            let player = game.zone.center.into();
            let zone = native_zone(game.zone.key);
            game.clock = zone.bosses[0].time_minutes * 60.0;
            game.spawn_due_bosses(player, [0.0; 2], &mut terrain);
            let definition = native_zone("naxx").bosses.iter().find(|row| row.id == 1493).unwrap();
            game.bosses[0].definition = definition;
            game.bosses[0].health = 10.0;
            let guid = game.bosses[0].guid;
            for (power, expected) in [(1.0, 0), (100.0, 1), (100.0, 1)] {
                game.execution.pending.0.push(PendingHit {
                    context: HitContext { captured_source_kind: Some(kind),
                        pet_entry: (kind == 2).then_some(9517), ..Default::default() },
                    target_guid: guid, source_guid: if kind == 2 { 9517 } else { 1 },
                    effect: player_abilities::StatusEffect { tag: 0, value: 0.0, duration: 0.0 },
                    resolves_at: game.clock, spell_id: 116, damage: power,
                    critical: false, damages_player: false, school: 4,
                });
                game.tick(0.01, player, [0.0; 2], 0.0, &mut terrain);
                assert_eq!(game.killing_blows().len(), expected);
            }
            assert_eq!(game.killing_blows(), &[(1493, 116)]);
            let hit = game.boss_killing_blows()[0];
            assert_eq!(game.personal_boss_killing_blows(), &[hit]);
            assert_eq!((hit.boss_id, hit.spell_id, hit.school, hit.source_kind, hit.melee),
                (1493, 116, 4, kind, false));
        }
    }

    #[test]
    fn absorbed_boss_hits_disqualify_no_damage_before_reflected_killing_blow() {
        for spell_id in [324, 467, 20925] {
            let mut game = class_run("paladin", 0);
            game.abilities[0].remaining = f32::INFINITY;
            let player = game.zone.center.into();
            let mut terrain = TerrainFixture;
            let zone = native_zone(game.zone.key);
            game.clock = zone.bosses[0].time_minutes * 60.0;
            game.spawn_due_bosses(player, [0.0; 2], &mut terrain);
            let definition = azeroth_survivors_re::bosses::catalog::ZONES.iter()
                .flat_map(|zone| zone.bosses).find(|row| row.id == 894).unwrap();
            game.bosses[0].definition = definition;
            game.bosses[0].health = 1.0;
            let guid = game.bosses[0].guid;
            game.execution.vitals.absorb = 100.0;
            let health = game.health();
            game.execution.auras.push(buffs::Aura {
                source_guid: 0,
                effect: player_abilities::StatusEffect { tag: 12, value: 1000.0, duration: 0.0 },
                spell_id, expires_at: game.clock + 10.0, healing_power: 0.0,
            });
            game.damage_player(1.0, true, guid, player, 0.0, &mut terrain);
            assert_eq!(game.health(), health, "fully absorbed damage still records the source");
            assert_eq!(game.damaged_by_bosses(), &[894]);
            let hit = game.boss_killing_blows()[0];
            assert_eq!((hit.boss_id, hit.spell_id, hit.source_kind), (894, spell_id, 0));
            let definition = azeroth_survivors_re::account_progression::definitions().iter()
                .find(|row| row.key == "feat:gordok").unwrap();
            assert!(azeroth_survivors_re::account_progression::meets_feat_with_events(
                definition, Default::default(), game.killing_blows(), game.boss_killing_blows(), game.damaged_by_bosses(),
            ));
        }
    }

    fn native_zone(key: &str) -> &'static azeroth_survivors_re::bosses::catalog::ZoneDefinition {
        azeroth_survivors_re::bosses::catalog::ZONES.iter().find(|row| row.key == key).unwrap()
    }
}
