//! 0.141.0 completion at 0x145fb8d80 and stored-level inputs at 0x145fb9ca0
//! and 0x145fc1090. See docs/analysis/q41-reference-frontier-0.141.0.md.
use super::*;
use azeroth_survivors_re::player_abilities::{behavior::buffs::Aura, catalog::StatusEffect};

impl Mechanics {
    pub fn set_choice_player_position(&mut self, player: Position) {
        self.choice_state.last_position = Some(player);
    }

    pub fn store_levels(&self) -> bool {
        self.choice_state.store_levels
    }

    /// AZS_GetStoredLevels reports zero while automatic offers are enabled.
    pub fn stored_levels(&self) -> u32 {
        if let Some(value) = self.replica_hud().and_then(|hud| hud.get("storedLevels")).and_then(serde_json::Value::as_u64) {
            return value.min(u64::from(u32::MAX)) as u32;
        }
        if self.store_levels() { self.pending_levels } else { 0 }
    }

    pub fn set_store_levels(&mut self, enabled: bool) {
        self.choice_state.store_levels = enabled;
        if !enabled {
            self.generate_level_choices();
        }
    }

    pub fn open_stored_levels(&mut self) {
        if self.pending_levels == 0 || !self.active_run_state() || self.is_showcase() {
            return;
        }
        self.choice_state.spend_levels = true;
        self.generate_level_choices();
    }

    pub fn spending_levels(&self) -> bool {
        self.choice_state.spend_levels
    }

    pub(super) fn maybe_generate_level_choices(&mut self) {
        if !self.choice_state.store_levels || self.choice_state.spend_levels {
            self.generate_level_choices();
        }
    }

    /// The caller consumes its own source counter first. Cache selections must
    /// never decrement pending_levels. Native completion then sweeps raw XP,
    /// dispatches another pending reward, or clears spending and resumes.
    pub(super) fn complete_choice(&mut self) {
        // Completion retains phase 2 through the XP sweep even after rows clear.
        self.choice_state.completing = true;
        self.choices.clear();
        let player = self.choice_state.last_position.unwrap_or_else(|| self.zone.center.into());
        let radius = self.stats.pickup_radius;
        let mut raw_xp = 0u32;
        let mut index = 0;
        // 0x145fb8e34..0x145fb8ebd removes forwards, publishing every
        // primary/auxiliary object before the single combined XP callback.
        while index < self.pickups.len() {
            let pickup = self.pickups[index];
            if let PickupDrop::Experience { amount, .. } = pickup.drop {
                if pickup.flight.is_some()
                    || super::pickup_effects::planar(pickup.position(), player) <= radius
                {
                    raw_xp = raw_xp.wrapping_add(amount);
                    self.remove_pickup_at(index);
                    continue;
                }
            }
            index += 1;
        }
        if raw_xp != 0 {
            // The minimum of one also applies to the party-scaled collector.
            self.credit_pickup_experience(raw_xp, true);
        }
        self.choice_state.completing = false;
        if self.pending_cache_choices() != 0 {
            self.generate_cache_choices();
            return;
        }
        if self.pending_guardian_jewelry() != 0 {
            self.generate_guardian_choices();
            return;
        }
        self.maybe_generate_level_choices();
        if !self.choices.is_empty() {
            return;
        }
        self.choice_state.spend_levels = false;
        // Native replaces spell1020, including any earlier resume aura.
        self.execution.auras.retain(|aura| aura.spell_id != 1020);
        self.execution.auras.push(Aura {
            source_guid: 0,
            effect: StatusEffect { tag: 11, value: 0.0, duration: 0.0 },
            spell_id: 1020,
            expires_at: self.clock + 1.0,
            healing_power: 0.0,
        });
        self.events.push(RunEvent::Spell(SpellCast {
            source_guid: self.player_guid,
            spell_id: 1020,
            target: azeroth_survivors_re::bosses::abilities::CastTarget::None,
            hit_targets: vec![self.player_guid],
        }));
        self.publish_player_auras();
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn game() -> Mechanics {
        Mechanics::new("elwynn", "warrior", RunRules { heroic_rank: 0,
            difficulty: 1.0, density_percent: 100, hp_percent: 100,
            damage_percent: 100, speed_percent: 100, endless: false,
        }, RunPlayerStats {
            maximum_health: 100.0, health_per_level: 9.0, health_multiplier: 1.0,
            regeneration: 0.8, pickup_radius: 5.0, luck_bonus: 0.0, heal_on_kill: 0.0,
            armor_fraction: 0.0, damage_reduction: 0.0, damage_multiplier: 1.0,
            cooldown_multiplier: 1.0, critical_chance: 0.05, critical_multiplier: 1.5,
            experience_multiplier: 1.1, gold_multiplier: 1.0, native_race: 1,
            packed_player_field: 0x0101,
        }, [1, 2, 3, 4]).unwrap()
    }

    #[test]
    fn stored_levels_gain_stats_immediately_and_drain_only_when_requested() {
        let mut game = game();
        game.set_store_levels(true);
        game.add_experience(15);
        assert_eq!(game.level, 3);
        assert_eq!(game.stored_levels(), 2);
        assert_eq!(game.max_health(), 118.0);
        assert!(game.choices.is_empty());
        game.open_stored_levels();
        assert!(!game.choices.is_empty());
        assert!(game.choose(0));
        assert_eq!(game.stored_levels(), 1);
        assert!(!game.choices.is_empty());
        assert!(game.choose(0));
        assert_eq!(game.stored_levels(), 0);
        assert!(!game.spending_levels());
        assert!(game.execution.auras.iter().any(|a| a.spell_id == 1020 && a.expires_at == 1.0));
    }

    #[test]
    fn switching_storage_off_opens_queued_levels() {
        let mut game = game();
        game.set_store_levels(true);
        game.add_experience(5);
        assert!(game.choices.is_empty());
        game.set_store_levels(false);
        assert!(!game.choices.is_empty());
        assert_eq!(game.stored_levels(), 0);
    }

    #[test]
    fn completion_rounds_combined_xp_once_and_retains_distant_orbs() {
        let mut game = game();
        game.stats.experience_multiplier = 1.3;
        game.set_store_levels(true);
        let position: Position = game.zone.center.into();
        game.set_choice_player_position(position);
        for (id, distance) in [(1, 1.0), (2, 2.0), (3, 6.0)] {
            game.pickups.push(RunPickup {
                created_at: 0.0,
                id, drop: PickupDrop::Experience {
                    amount: 1, position: treasure_chests::Position::new(position.x + distance, position.y, position.z),
                }, flight: None, facing: 0.0,
                auxiliary: [None; 2],
            });
        }
        game.complete_choice();
        assert_eq!(game.xp, 3, "round((1+1)*1.3), not round(1*1.3)+round(1*1.3)");
        assert_eq!(game.pickups.len(), 1);
        assert_eq!(game.pickups[0].id, 3);
    }
}
