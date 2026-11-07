//! Current0.109.0 scheduled boss construction arithmetic.
//! Owner14596d8d0, selected arithmetic14596dab9..db66 and14596dec9..e028.
//! docs/analysis/evidence/boss-inputs/manifest.json revalidates all60
//! semantic headers and480 isolated native arithmetic cases. Damage/HP powf
//! call order and the current Endless admission differ from historical0.105.0.
//! Windows CRT, compilation, live actors and native parity remain unverified.

use super::catalog::BossDefinition;
pub use crate::enemies::scaling::ScalingInput as BossScalingInput;
pub use crate::enemies::scaling::creature_guid;

#[derive(Clone, Debug, PartialEq)]
pub struct BossInitialStats {
    pub health: f32,
    pub max_health: f32,
    pub damage: f32,
    pub movement_speed: f32,
    pub scale: f32,
    pub melee_reach: f32,
    pub attack_interval: f32,
    pub initial_attack_delay: f32,
    pub next_movement_at: f32,
    /// Native actor+144, consumed by the shared stun gate.
    pub stun_until: f32,
    /// Native actor+148, initialized to the current run clock. Full subsequent
    /// semantics are retained at their native offset rather than guessed.
    pub raw_148_clock: f32,
    pub movement_angle: f32,
}

/// All initial boss ability timers are 60% of their definition's repeat
/// interval (word6 / +18). They are remaining durations, not absolute times.
pub fn initial_ability_timers(definition: &BossDefinition) -> Vec<f32> {
    definition.abilities.iter().map(|ability| f32::from_bits(ability.words[6]) * 0.6).collect()
}

/// Current0.109.0 calls Windows powf only for an Endless phase1 run, in
/// damage/HP order. A non-Endless or wrong-phase run uses exact factors1.
/// Injected results isolate caller arithmetic from the Windows CRT.
pub fn initial_stats_with_powf(
    input: BossScalingInput,
    definition: &BossDefinition,
    powf: impl FnMut(f32, f32) -> f32,
) -> BossInitialStats {
    initial_stats_with_multipliers(input, definition,
        [f32::from(input.hp_percent) / 100.0,
         f32::from(input.damage_percent) / 100.0,
         f32::from(input.speed_percent) / 100.0], powf)
}

/// Current 0.121.0 scheduled boss construction uses the Heroic descriptor
/// and the definition's unmodified movement speed.
pub fn initial_heroic_stats(
    input: BossScalingInput,
    definition: &BossDefinition,
    rank: u8,
) -> BossInitialStats {
    initial_stats_with_multipliers(input, definition,
        [crate::heroic::health_multiplier(rank), crate::heroic::damage_multiplier(rank), 1.0],
        f32::powf)
}

fn initial_stats_with_multipliers(
    input: BossScalingInput,
    definition: &BossDefinition,
    multipliers: [f32; 3],
    mut powf: impl FnMut(f32, f32) -> f32,
) -> BossInitialStats {
    let (health_factor, damage_factor) = if input.phase == 1 && input.endless {
        let exponent = input.endless_exponent();
        let damage = powf(1.096, exponent);
        let health = powf(1.22, exponent);
        (health, damage)
    } else { (1.0, 1.0) };
    let health = definition.base_hp * 5.75;
    let health = health * input.zone_scale;
    let health = health * input.difficulty;
    let health = health_factor * health;
    let health = multipliers[0] * health;
    let zone_difficulty = input.zone_scale * input.difficulty;
    let damage = zone_difficulty.sqrt() * definition.base_damage;
    let damage = damage_factor * damage;
    let damage = multipliers[1] * damage;
    let movement_speed = multipliers[2] * definition.raw_4c;
    let reach = definition.scale * 1.5 + 3.5;
    // MINSS chooses the constant second operand on unordered/equal inputs.
    let melee_reach = if reach < 9.0 { reach } else { 9.0 };
    BossInitialStats {
        health,
        max_health: health,
        damage,
        movement_speed,
        scale: definition.scale,
        melee_reach,
        attack_interval: 2.0,
        initial_attack_delay: 2.0,
        next_movement_at: 1.0 + input.clock_seconds,
        stun_until: 1.5 + input.clock_seconds,
        raw_148_clock: input.clock_seconds,
        movement_angle: 0.0,
    }
}

/// Host powf convenience; its complete cross-platform equivalence is unverified.
pub fn initial_stats(input: BossScalingInput, definition: &BossDefinition) -> BossInitialStats {
    initial_stats_with_powf(input, definition, f32::powf)
}
