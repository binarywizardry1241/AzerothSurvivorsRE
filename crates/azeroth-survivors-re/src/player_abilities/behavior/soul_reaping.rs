//! Current 0.112.0 Soul Reaping remaining-Drain-Life arithmetic.
//! Player generic-hit owner14593844f..1459386f5 and Succubus projectile
//! owner145957b7e..145958179 share the same effect/periodic vector order.
//! Native evidence and connected source: docs/analysis/soul-reaping-0.112.0.md.

use super::periodic::ActorPeriodic;
use crate::run_effects::EffectRow;

/// Native raw35 is retained as marker253/35 so historical effect layouts cannot
/// reinterpret it. Sum every equipped occurrence in its original order.
pub fn coefficient(effects: &[EffectRow]) -> f32 {
    effects
        .iter()
        .filter(|row| row.tag() == 253 && row.bytes[63] == 35)
        .fold(-0.0, |sum, row| sum + row.float(4))
}

/// Spell689 alone selects rows. The native read does not filter by owner,
/// clamp tick power, consume ticks or shorten a deadline.
pub fn remaining_drain_life(rows: &[ActorPeriodic]) -> f32 {
    rows.iter()
        .filter(|row| row.spell_id == 689)
        .fold(-0.0, |sum, row| {
            sum + row.ticks_remaining as f32 * row.power_per_tick
        })
}

/// Succubus captures this bonus at launch. Player Death Coil computes it from
/// the surviving victim's rows after its normal impact, then emits a separate
/// noncritical hit. The two call sites intentionally use different timing.
pub fn bonus(effects: &[EffectRow], rows: &[ActorPeriodic]) -> f32 {
    let fraction = coefficient(effects);
    if fraction <= 0.0 {
        0.0
    } else {
        fraction * remaining_drain_life(rows)
    }
}
