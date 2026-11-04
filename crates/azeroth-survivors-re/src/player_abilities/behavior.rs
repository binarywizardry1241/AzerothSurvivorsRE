//! Current 0.97.2 player ability runtime and shared behavior.
//! Native layout/consumers: player-ability-behavior-0.97.2.md.
//! Requires the caller's actual run, actors, packets and damage implementation.

use super::{catalog::AbilityDefinition, native_max, native_min};
use crate::enemies::NativeRng;

pub mod buffs;
pub mod dispatch;
pub mod execution;
pub mod hit_passives;
pub mod incoming;
pub mod passive_tick;
pub mod periodic;
pub mod soul_reaping;
pub mod state;
pub mod targeting;
pub mod totem_passives;
pub mod totems;

/// Repeated current minss/NaN-mask sequence: retain the original left operand
/// if the instruction result is unordered (scheduler, control and healing).
pub fn min_preserving_original_nan(left: f32, right: f32) -> f32 {
    let result = native_min(left, right);
    if result.is_nan() { left } else { result }
}

/// Semantic ability state, not a memory overlay. Current 0.112.0 removed
/// Empowerment's dedicated damage/haste upgrade lanes; it uses ordinary buff
/// duration/cooldown and effect strength. Offset annotations below retain the
/// historical 0.105.0 layout; they are not the current ABI.
#[derive(Clone, Copy, Debug)]
pub struct RuntimeInstance<'a> {
    pub definition: &'a AbilityDefinition,
    pub rank: u32,                // +32
    pub remaining: f32,           // +36
    pub power_multiplier: f32,    // +40
    pub cooldown_multiplier: f32, // +44
    pub target_bonus: u32,        // +48
    pub area_multiplier: f32,     // +52
    pub duration_multiplier: f32, // +56
    /// Current five ordinary upgrade lanes; this is not serialized save state.
    pub upgrade_counts: [u32; 5],
    pub talent_power_multiplier: f32, // +68
    pub talent_cooldown_multiplier: f32, // +72
    pub talent_target_bonus: u32, // +76
    pub talent_area_multiplier: f32, // +80
    pub talent_duration_multiplier: f32, // +84
    pub health_power: f32,        // +88
    pub effect_multiplier: f32,   // +92
}

impl<'a> RuntimeInstance<'a> {
    /// Native learned-record constructor 0x1454e457b..0x1454e45ef.
    pub fn learned(definition: &'a AbilityDefinition) -> Self {
        Self {
            definition,
            rank: 1,
            remaining: 0.5,
            power_multiplier: 1.0,
            cooldown_multiplier: 1.0,
            target_bonus: 0,
            area_multiplier: 1.0,
            duration_multiplier: 1.0,
            upgrade_counts: [0; 5],
            talent_power_multiplier: 1.0,
            talent_cooldown_multiplier: 1.0,
            talent_target_bonus: 0,
            talent_area_multiplier: 1.0,
            talent_duration_multiplier: 1.0,
            health_power: 0.0,
            effect_multiplier: 1.0,
        }
    }
}

/// World boundary for the current ordered auto-cast loop. Passing the entire
/// ability slice allows native cast/proc logic to shorten another cooldown.
pub trait SchedulerPort {
    /// Some run-local effects accelerate only selected learned cooldowns.
    fn cooldown_elapsed(&self, _instance: &RuntimeInstance<'_>, delta: f32) -> f32 {
        delta
    }
    fn cast(
        &mut self,
        abilities: &mut [RuntimeInstance<'_>],
        snapshot: RuntimeInstance<'_>,
    ) -> bool;
    /// Use the canonical `damage::cooldown` with this run's current modifiers.
    fn cooldown(&self, instance: &RuntimeInstance<'_>) -> f32;
    /// Native successful-cast proc/overcast work occurs before rescheduling.
    fn after_success(
        &mut self,
        abilities: &mut [RuntimeInstance<'_>],
        snapshot: RuntimeInstance<'_>,
    );
    ///14549ec38..ed65 publishes only the successful cast's final scheduled
    /// remaining value. Initial timers and failed-cast retries emit no packet.
    fn publish_cooldown(&mut self, _spell_id: u32, _remaining: f32) {}
}

/// Native 0x14549e46b..0x14549ed86. Order is significant: decrement/cast/reschedule
/// one instance before visiting the next. This performs at most one ordinary
/// auto-cast per instance per tick; elapsed overshoot is not carried forward.
pub fn tick_cooldowns(
    abilities: &mut [RuntimeInstance<'_>],
    delta: f32,
    port: &mut impl SchedulerPort,
) {
    for index in 0..abilities.len() {
        let elapsed = port.cooldown_elapsed(&abilities[index], delta);
        abilities[index].remaining -= elapsed;
        if abilities[index].definition.kind == 11 {
            abilities[index].remaining = native_max(abilities[index].remaining, 0.0);
            continue;
        }
        if abilities[index].remaining > 0.0 {
            continue;
        }
        abilities[index].remaining = f32::INFINITY;
        let snapshot = abilities[index];
        if port.cast(abilities, snapshot) {
            port.after_success(abilities, snapshot);
            let interval = port.cooldown(&abilities[index]);
            //14549ec20..ec35 restores the old value when minss yields NaN.
            abilities[index].remaining =
                min_preserving_original_nan(abilities[index].remaining, interval);
            port.publish_cooldown(
                abilities[index].definition.spell_id,
                abilities[index].remaining,
            );
        } else {
            abilities[index].remaining = 0.2;
        }
    }
}

/// Cast/crit draws use the high 24 bits, unlike the 23-bit placement sampler.
pub fn unit24(rng: &mut NativeRng) -> f32 {
    (rng.next_u64() >> 40) as u32 as f32 * (1.0 / 16_777_216.0)
}

/// 0.139.2: resolve the first echo and its talent continuation at full Echo
/// chance, then roll the fractional part of any chance beyond the first 100%.
pub fn extra_cast_count(factor: f32, additional_attempts: u32, rng: &mut NativeRng) -> u32 {
    if !(factor > 0.0) {
        return 0;
    }
    let attempts = additional_attempts.wrapping_add(1);
    let mut count = 0u32;
    if factor >= 1.0 {
        count = attempts;
    } else {
        for _ in 0..attempts {
            if unit24(rng) >= factor {
                break;
            }
            count += 1;
        }
    }
    let overflow = (factor - 1.0).max(0.0);
    count = count.wrapping_add(overflow.floor() as u32);
    let fraction = overflow.fract();
    if fraction > 0.0 && unit24(rng) < fraction {
        count = count.wrapping_add(1);
    }
    count
}

#[cfg(test)]
mod echo_tests {
    use super::*;

    #[test]
    fn arcane_power_cascades_at_full_chance_with_native_rng_use() {
        let mut rng = NativeRng::from_words([1, 2, 3, 4]);
        let initial = rng;
        assert_eq!(extra_cast_count(1.0, 3, &mut rng), 4);
        assert_eq!(extra_cast_count(2.0, 3, &mut rng), 5);
        assert_eq!(extra_cast_count(2.0, 0, &mut rng), 2);
        assert_eq!(rng, initial);

        let mut one_draw = initial;
        one_draw.next_u64();
        assert_eq!(extra_cast_count(1.25, 3, &mut rng), 5);
        assert_eq!(rng, one_draw);
    }
}
