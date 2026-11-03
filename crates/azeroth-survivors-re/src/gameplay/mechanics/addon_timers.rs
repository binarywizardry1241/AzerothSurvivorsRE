//! Current AZSTIMERS projection of the actual equipped effect clocks.

use super::Mechanics;
use azeroth_survivors_re::run_effects::addon_timers;

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AddonTimer {
    pub index: usize,
    pub name: &'static str,
    /// Generated amulet suffixes localize the prefix and keyed ability separately.
    pub generated_ability_key: Option<&'static str>,
    pub icon: &'static str,
    pub kind: &'static str,
    pub ready: f32,
    pub wait: f32,
}

impl Mechanics {
    pub fn addon_timers(&self) -> Vec<AddonTimer> {
        let talent_count = self.effect_state.equipped.generic_talent_count();
        let generated_ability_key = self.worn_amulet()
            .and_then(|item| item.payload.ability_key.as_deref());
        addon_timers::collect(
            &self.effect_state.equipped.rows,
            &self.effect_state.generic.deadlines,
            &self.effect_state.generic.counters,
            self.current_cooldown_multiplier(),
            self.clock,
            self.effect_state.incoming.lethal_talent_ready_at,
            self.effect_state.equipped.sum(32) > 0.0,
        ).into_iter().filter_map(|timer| {
            // Configure/refresh constructs one source identity per generic
            // effect. Native1458e430e nevertheless skips an index outside the
            // metadata vector, independently of deadline/counter defaults.
            let source = self.effect_state.meter_sources.get(timer.index)?;
            Some(AddonTimer { index: timer.index, name: source.name,
                generated_ability_key: if timer.index >= talent_count { generated_ability_key }
                    else { None }, icon: source.icon,
                kind: timer.kind, ready: timer.ready, wait: timer.wait })
        }).collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use super::super::rng_integration::class_run;

    #[test]
    fn cooldown_input_matches_current_native_aura_vectors() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.115.0/addon-timers/cooldown-input-cases.json"
        )).unwrap();
        let number = |value: &serde_json::Value| f32::from_bits(value.as_u64().unwrap() as u32);
        for case in proof["cases"].as_array().unwrap() {
            let auras = case["auras"].as_array().unwrap().iter().map(|row| {
                azeroth_survivors_re::player_abilities::behavior::buffs::Aura {
                    source_guid: 0,
                    effect: azeroth_survivors_re::player_abilities::StatusEffect {
                        tag: row["tag"].as_u64().unwrap() as u32,
                        value: number(&row["value_bits"]), duration: 0.0,
                    },
                    spell_id: 0, expires_at: number(&row["expires_bits"]), healing_power: 0.0,
                }
            }).collect::<Vec<_>>();
            let expected = number(&case["native_bits"]);
            let actual = super::super::aura_cooldown(number(&case["raw_recovery_bits"]),
                &auras, number(&case["now_bits"]), number(&case["buff_bonus_bits"]));
            assert!((actual.is_nan() && expected.is_nan()) || actual.to_bits() == expected.to_bits());
        }
    }

    #[test]
    fn live_entry_retains_native_racial_recovery_before_any_reciprocal() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.115.0/addon-timers/cooldown-base-cases.json"
        )).unwrap();
        for case in proof["cases"].as_array().unwrap() {
            let class = match case["class_id"].as_u64().unwrap() {
                1 => "warrior", 2 => "paladin", 3 => "hunter", 4 => "rogue", 5 => "priest",
                7 => "shaman", 8 => "mage", 9 => "warlock", 11 => "druid", _ => unreachable!(),
            };
            let mut game = class_run(class, case["race_id"].as_u64().unwrap() as u8);
            game.level = case["level"].as_u64().unwrap() as u32;
            game.set_racial_progression_components(1.0, 0.0, 0.8, 0.0);
            game.configure_effects(&[], &[]);
            assert_eq!(game.effect_state.numeric.recovery.to_bits(),
                case["raw_recovery_bits"].as_u64().unwrap() as u32);
            assert_eq!(game.current_cooldown_multiplier().to_bits(),
                case["cooldown_bits"].as_u64().unwrap() as u32);
        }
    }

    #[test]
    fn live_build_rows_use_shared_effect_slots_and_current_cooldown() {
        let mut game = class_run("warlock", 1);
        game.configure_effects(&[("legion_gate".into(), 1),
            ("pact_of_the_annihilan".into(), 1)], &[]);
        game.clock = 40.0;
        let initial = game.addon_timers();
        let pact = initial.iter().find(|row| row.name == "Pact of the Nathrezim").unwrap();
        let index = pact.index;
        assert_eq!((pact.kind, pact.ready, pact.wait), ("summon", 40.0, 30.0));
        game.effect_state.generic.deadlines[index] = 10.0;
        game.effect_state.generic.counters[index] = 1;
        game.effect_state.numeric.recovery = 9.0;
        let active = game.addon_timers();
        let pact = active.iter().find(|row| row.index == index).unwrap();
        assert_eq!((pact.ready, pact.wait), (23.0, 13.0));
        assert_eq!(pact.icon, game.effect_state.meter_sources[index].icon);
        assert_eq!(game.effect_state.generic.deadlines[index], 10.0);
        assert_eq!(game.effect_state.generic.counters[index], 1);
        game.refresh_effects();
        let refreshed = game.addon_timers();
        let pact = refreshed.iter().find(|row| row.index == index).unwrap();
        assert_eq!(pact.ready, 40.0, "base timestamp survives the ordinary effect refresh");
        assert_eq!(game.effect_state.generic.deadlines[index], 10.0);
        assert_eq!(game.effect_state.generic.counters[index], 1);
    }

    #[test]
    fn generated_amulet_identity_is_attached_only_to_its_generic_suffix() {
        use azeroth_survivors_re::loot_rewards::{amulets, AmuletItem};
        let mut game = class_run("rogue", 1);
        game.configure_effects(&[("cheat_death".into(), 1)], &[]);
        for key in ["execute", "eviscerate", "backstab"] {
            let definition = amulets::catalog().by_key(&format!("legendary:{key}")).unwrap();
            game.treasure_state.amulet = Some(AmuletItem {
                key: definition.key.clone(), rarity: 4, picks: 1, payload: definition,
            });
            game.refresh_effects();
            let timers = game.addon_timers();
            assert!(timers.iter().find(|row| row.name == "Cheat Death").unwrap()
                .generated_ability_key.is_none());
            let amulet = timers.iter().find(|row| row.name == definition.name).unwrap();
            assert_eq!(amulet.generated_ability_key, Some(key));
            assert!(amulet.index >= game.effect_state.equipped.generic_talent_count());
        }
        game.treasure_state.amulet = None;
        game.refresh_effects();
        assert!(game.addon_timers().iter().all(|row| row.generated_ability_key.is_none()));
    }

    #[test]
    fn live_lethal_row_uses_separate_deadline_and_new_run_starts_without_timers() {
        let mut game = class_run("rogue", 1);
        assert!(game.addon_timers().is_empty());
        game.configure_effects(&[("cheat_death".into(), 1)], &[]);
        game.clock = 30.0;
        game.effect_state.incoming.lethal_talent_ready_at = 90.0;
        game.effect_state.generic.deadlines.fill(700.0);
        let timers = game.addon_timers();
        assert_eq!(timers.len(), 1);
        assert_eq!((timers[0].name, timers[0].kind, timers[0].ready, timers[0].wait),
            ("Cheat Death", "cooldown", 90.0, 150.0));
        game.effect_state.meter_sources.clear();
        assert!(game.addon_timers().is_empty(), "native formatter skips missing metadata");
        assert!(class_run("rogue", 1).addon_timers().is_empty());
    }
}
