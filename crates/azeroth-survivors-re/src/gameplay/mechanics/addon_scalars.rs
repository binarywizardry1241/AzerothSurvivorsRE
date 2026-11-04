//! Live addon scalar inputs, revalidated for the 0.109.0 projection.
//! Underlying combat/stat owners retain their separate recovery limits.

use super::*;

#[derive(Clone, Copy)]
pub struct AddonProgress {
    pub bosses_spawned: usize,
    pub endless_deadline: f32,
    pub won: bool,
    pub owed: u32,
}

impl Mechanics {
    /// Native 0.139.2 Game construction publishes the unexpanded run seed
    /// XORed with a fixed mask, and a one-based process-global ordinal.
    pub(in crate::gameplay) fn seat_addon_run_id(&mut self, seed: u64) {
        use std::sync::atomic::{AtomicU64, Ordering};

        static RUNS: AtomicU64 = AtomicU64::new(0);
        let ordinal = RUNS.fetch_add(1, Ordering::Relaxed).wrapping_add(1);
        self.addon_run_id = format!("{:x}-{ordinal}", seed ^ 0x9e37_79b9_7f4a_7c15);
    }

    pub fn addon_progress(&self) -> AddonProgress {
        AddonProgress {
            bosses_spawned: self.boss_state.scheduler.next_primary,
            endless_deadline: self.boss_state.scheduler.endless_deadline,
            won: self.victory_reached(),
            owed: self
                .pending_levels
                .wrapping_add(self.pending_cache_choices())
                .wrapping_add(self.pending_guardian_jewelry()),
        }
    }

    pub fn abandoned(&self) -> bool {
        self.abandoned
    }

    /// Current 0.112.0 1459510e0: Bloodrage retains its raw pool;
    /// Soulfire publishes only the stored whole-shard count.
    pub fn addon_proc(&self) -> (&'static str, f32, f32) {
        let learned = |key| self.abilities.iter().find(|row| row.definition.key == key);
        if learned("bloodrage").is_some() {
            ("bloodrage", self.passive_state.bloodrage.pool, 100.0)
        } else if learned("seal_fate").is_some() {
            ("seal_fate", self.passive_state.seal_fate.points as f32, 5.0)
        } else if learned("soul_fire").is_some() {
            // Native Game+908 is converted from u32 to f32. Fractional kill
            // credit and the qualified-kill deadline are separate state.
            ("soul_fire", self.passive_state.soul_fire_points as f32, 5.0)
        } else if let Some(instance) = learned("lightwell") {
            let fraction = if let Some(last) = self.passive_state.lightwells.last() {
                (last.expires_at - self.clock) / last.duration.max(0.1)
            } else {
                let interval = behavior::totem_passives::passive_interval(
                    instance,
                    self.current_cooldown_multiplier(),
                );
                1.0 - (self.passive_state.deadlines.get("lightwell") - self.clock).max(0.0)
                    / interval
            };
            ("lightwell", addon_fraction(fraction), 1.0)
        } else {
            ("", 0.0, 0.0)
        }
    }

    /// Current 0.109.0 14591d8a0's character-stat line, including raw worn-gear
    /// contributions and conditional-stat magnitudes. The native numeric parser
    /// consumes these same scalars; the character-pane widgets are separate.
    pub fn addon_stats(&self) -> String {
        let numeric = &self.effect_state.numeric;
        let mut gear = [0.0_f32; 13];
        for &(tag, amount) in &self.effect_state.equipped.gear {
            if let Some(total) = gear.get_mut(usize::from(tag)) {
                *total += amount;
            }
        }
        let mut stats = self.effect_state.equipped.stats.clone();
        stats.extend(
            self.effect_state
                .generic
                .temporary
                .contributions(&self.effect_state.equipped.rows, self.clock),
        );
        let sum = |tag| {
            stats
                .iter()
                .filter(|(kind, _)| *kind == tag)
                .fold(0.0_f32, |total, (_, value)| total + value)
        };
        let (stormguard, stormguard_active) = self.stormguard();
        format!(
            concat!(
                "hp={:.0};dmg={:.3};cd={:.3};crit={:.3};cm={:.2};arm={:.3};reg={:.2};",
                "area={:.3};cnt={};echo={:.3};spd={:.3};pick={:.1};xp={:.2};luck={:.2};gold={:.2};heal={:.1};",
                "ghp={:.0};gdmg={:.3};gcd={:.3};gcrit={:.3};gcm={:.2};garm={:.3};greg={:.2};",
                "garea={:.3};gcnt={};gecho={:.3};gspd={:.3};gpick={:.3};ggold={:.3};",
                "lch={:.4};thn={:.3};liv={};bp={:.3};dots={};doth={:.3};",
                "big={:.3};exe={:.3};cc={:.3};dotd={:.3};shd={:.3};auto={:.3};pet={:.3};bwk={:.3};bwa={}"
            ),
            // Current stat refresh1458f9dd5..9f67 folds active aura8/9 and
            // spell23505/23451 before storing native Game47c/480/48c.
            numeric.health,
            self.current_damage_multiplier(),
            self.current_cooldown_multiplier(),
            numeric.crit,
            numeric.crit_damage,
            self.effective_armor(),
            numeric.regeneration,
            numeric.area,
            numeric.targets,
            numeric.extra_cast,
            self.movement_multiplier(),
            numeric.pickup,
            numeric.experience,
            numeric.luck,
            numeric.gold,
            numeric.heal_on_kill,
            gear[2],
            gear[0],
            gear[1],
            gear[3],
            gear[4],
            gear[6],
            gear[7],
            gear[10],
            gear[11] as u32,
            gear[12],
            gear[5],
            gear[8],
            gear[9],
            self.effect_state.leech,
            sum(22),
            self.remaining_lives(),
            numeric.buff_bonus,
            (self.level / 15).min(3) + 1,
            numeric.dot_tick,
            sum(19),
            sum(20),
            sum(18),
            sum(21),
            sum(28),
            sum(16),
            sum(17),
            stormguard,
            u8::from(stormguard_active),
        )
    }
}

/// Native 0.109.0 145983c93 uses MAXSS(0, fraction), then MINSS(1, result).
/// The fraction is the second operand of both operations: equal signed zero
/// and an unordered value survive. Rust's f32::max/min discard a NaN instead.
fn addon_fraction(fraction: f32) -> f32 {
    if fraction < 0.0 {
        0.0
    } else if fraction > 1.0 {
        1.0
    } else {
        fraction
    }
}

#[cfg(test)]
mod tests {
    use super::super::rng_integration::class_run;
    use super::*;

    #[test]
    fn proc_preserves_priority_and_reports_whole_soulfire_shards() {
        let mut game = class_run("warlock", 0);
        game.abilities.push(RuntimeInstance::learned(
            AbilityDefinition::by_key("soul_fire").unwrap(),
        ));
        game.passive_state.soul_fire_points = 2;
        game.passive_state.soul_fire_gain_at = 1000.0;
        game.passive_state.soul_fire_fraction = 0.4;
        assert_eq!(game.addon_proc(), ("soul_fire", 2.0, 5.0));
        game.passive_state.soul_fire_fraction = 0.999;
        assert_eq!(game.addon_proc(), ("soul_fire", 2.0, 5.0));
        game.abilities.push(RuntimeInstance::learned(
            AbilityDefinition::by_key("seal_fate").unwrap(),
        ));
        game.passive_state.seal_fate.points = 3;
        assert_eq!(game.addon_proc(), ("seal_fate", 3.0, 5.0));
        game.abilities.push(RuntimeInstance::learned(
            AbilityDefinition::by_key("bloodrage").unwrap(),
        ));
        game.passive_state.bloodrage.pool = 12.345;
        assert_eq!(game.addon_proc(), ("bloodrage", 12.345, 100.0));
    }

    #[test]
    fn raw_gear_contributions_do_not_apply_stat_multipliers() {
        let mut game = class_run("priest", 0);
        game.effect_state.equipped.gear =
            vec![(0, 0.125), (0, 0.25), (8, 0.2), (11, 1.9), (11, 1.9)];
        let line = game.addon_stats();
        assert!(line.contains("gdmg=0.375;"));
        assert!(line.contains("gcnt=3;"));
        assert!(line.contains("gpick=0.200;"));
    }
}
