//! Current0.109.0 modifier/stat readers: constructor145970560 and HP leaves
//!14599e9c0/14599ea10. See runmods-scaling-0.109.0.md for bounded native replay.
//! Guardian/boss scaling uses separate callers.

use super::catalog::EnemyDefinition;
use super::NativeRng;

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ScalingInput {
    pub clock_seconds: f32,
    pub difficulty: f32,
    pub zone_scale: f32,
    pub hp_percent: u16,
    pub damage_percent: u16,
    pub speed_percent: u16,
    pub phase: u32,
    pub endless: bool,
    pub endless_start_seconds: f32,
}

impl ScalingInput {
    /// Both powf calls are unconditional in this constructor. The phase and
    /// endless gates select the exponent; an inactive gate supplies zero.
    pub fn endless_exponent(self) -> f32 {
        if self.phase == 1 && self.endless {
            let elapsed = (self.clock_seconds - self.endless_start_seconds) / 60.0;
            // MAXSS chooses its second operand for NaN or equal inputs.
            if elapsed > 0.0 {
                elapsed
            } else {
                0.0
            }
        } else {
            0.0
        }
    }
}

/// Exact constructor HP helper, including its different cubic coefficients.
/// Both the helper and current packed factor select on a nonzero flag.
pub fn health_polynomial(minutes: f32, zone_difficulty: f32, flag_4c: u8) -> f32 {
    let linear = 0.1 * minutes + 1.0;
    let quadratic = (f32::from_bits(0x3d13_74bc) * minutes) * minutes;
    let partial = quadratic + linear;
    let coefficient = if flag_4c != 0 {
        f32::from_bits(0x3bc2_a455)
    } else {
        f32::from_bits(0x3be6_afcd)
    };
    let cubic = (coefficient * minutes) * minutes;
    let cubic = minutes * cubic;
    (cubic + partial) * zone_difficulty
}

pub fn damage_polynomial(minutes: f32, zone_difficulty: f32) -> f32 {
    let linear = 0.07 * minutes + 1.0;
    let quadratic = (0.015 * minutes) * minutes;
    let partial = quadratic + linear;
    let cubic = ((0.0002 * minutes) * minutes) * minutes;
    zone_difficulty.sqrt() * (cubic + partial)
}

/// Fields installed by the ordinary constructor, before any active AI tick.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct InitialStats {
    pub health: f32,
    pub max_health: f32,
    pub damage: f32,
    pub movement_speed: f32,
    pub attack_interval: f32,
    pub melee_reach: f32,
    pub initial_attack_delay: f32,
}

/// Recovered arithmetic with a Windows CRT powf seam. The callback is invoked
/// twice, in HP/damage order, with bases 1.22 and 1.096. Injecting results checks
/// caller arithmetic without claiming host/Windows CRT powf bit equivalence.
pub fn initial_stats_with_powf(
    input: ScalingInput,
    definition: &EnemyDefinition,
    mut powf: impl FnMut(f32, f32) -> f32,
) -> InitialStats {
    initial_stats_with_health_bonus(
        input, definition, input.clock_seconds / 60.0, 0.0, legacy_multipliers(input), &mut powf,
    )
}

/// Selected 0.100.1 zone+e4 values. The ordinary constructor at 1454d4130
/// applies these to ordinary and elite HP, before endless/option multipliers.
/// Earlier reports and their fixtures deliberately retain a zero bonus.
pub fn late_run_health_bonus(zone_key: &str) -> f32 {
    match zone_key {
        "arena" => f32::from_bits(0x3d75_c28f),
        "sm" => f32::from_bits(0x3df5_c28f),
        "av" => f32::from_bits(0x3e38_51ec),
        "brm" => f32::from_bits(0x3e80_0000),
        crate::zones::scholomance::KEY => crate::zones::scholomance::HEALTH_BONUS,
        "aq" => f32::from_bits(0x3ea3_d70a),
        "naxx" => f32::from_bits(0x3ecc_cccd),
        _ => 0.0,
    }
}

/// Native 1454d4512..453a: clamp minutes/20, then multiply the bonus by
/// that fraction twice. A halfway run receives one quarter of the bonus.
pub fn late_run_health_multiplier(clock_seconds: f32, zone_key: &str) -> f32 {
    health_multiplier(clock_seconds / 60.0, late_run_health_bonus(zone_key))
}

fn health_multiplier(minutes: f32, bonus: f32) -> f32 {
    let elapsed = minutes / 20.0;
    // MAXSS/MINSS choose their second operand for unordered/equal input.
    let fraction = if 0.0 > elapsed { 0.0 } else { elapsed };
    let fraction = if 1.0 < fraction { 1.0 } else { fraction };
    (bonus * fraction) * fraction + 1.0
}

pub fn initial_stats_for_zone_with_powf(
    input: ScalingInput,
    definition: &EnemyDefinition,
    zone_key: &str,
    mut powf: impl FnMut(f32, f32) -> f32,
) -> InitialStats {
    initial_stats_with_health_bonus(
        input,
        definition,
        input.clock_seconds / 60.0,
        late_run_health_bonus(zone_key),
        legacy_multipliers(input),
        &mut powf,
    )
}

pub fn initial_stats_for_zone(
    input: ScalingInput,
    definition: &EnemyDefinition,
    zone_key: &str,
) -> InitialStats {
    initial_stats_for_zone_with_powf(input, definition, zone_key, f32::powf)
}

/// Current 0.121.0 ordinary/elite constructor applies the selected Heroic
/// descriptor instead of the historical Run Options percentages.
pub fn initial_stats_for_heroic_zone(
    input: ScalingInput,
    definition: &EnemyDefinition,
    effective_minutes: f32,
    zone_key: &str,
    rank: u8,
) -> InitialStats {
    initial_stats_with_health_bonus(
        input, definition, effective_minutes, late_run_health_bonus(zone_key),
        [crate::heroic::health_multiplier(rank), crate::heroic::damage_multiplier(rank), 1.0],
        &mut f32::powf,
    )
}

fn legacy_multipliers(input: ScalingInput) -> [f32; 3] {
    [f32::from(input.hp_percent) / 100.0,
     f32::from(input.damage_percent) / 100.0,
     f32::from(input.speed_percent) / 100.0]
}

fn initial_stats_with_health_bonus(
    input: ScalingInput,
    definition: &EnemyDefinition,
    minutes: f32,
    late_health_bonus: f32,
    multipliers: [f32; 3],
    powf: &mut impl FnMut(f32, f32) -> f32,
) -> InitialStats {
    let zone_difficulty = input.zone_scale * input.difficulty;
    let health_scale = health_polynomial(minutes, zone_difficulty, definition.flag_4c);
    let exponent = input.endless_exponent();
    let health_endless = powf(1.22, exponent);
    let damage_scale = damage_polynomial(minutes, zone_difficulty);
    let damage_endless = powf(1.096, exponent);
    let (health_factor, damage_factor) = if definition.flag_4c != 0 {
        (4.8, 1.0)
    } else {
        (4.95, 1.25)
    };
    let health_base = definition.base_hp * health_factor;
    let damage_base = definition.base_damage * damage_factor;
    let health = health_scale * health_base;
    let health = health * health_multiplier(minutes, late_health_bonus);
    let damage = damage_scale * damage_base;
    let health = health_endless * health;
    let damage = damage_endless * damage;
    let health = multipliers[0] * health;
    let damage = multipliers[1] * damage;
    let movement_speed = multipliers[2];
    let movement_speed = movement_speed * 1.05;
    let movement_speed = movement_speed * definition.raw_3c;
    InitialStats {
        health,
        max_health: health,
        damage,
        movement_speed,
        attack_interval: definition.raw_38,
        melee_reach: 1.2 * definition.scale + 2.2,
        initial_attack_delay: 0.5 * definition.raw_38,
    }
}

/// Host powf convenience; full Windows CRT implementation remains unrecovered.
pub fn initial_stats(input: ScalingInput, definition: &EnemyDefinition) -> InitialStats {
    initial_stats_with_powf(input, definition, f32::powf)
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct InitialTiming {
    pub facing: f32,
    pub next_movement_at: f32,
}

/// Draw before powf/entity creation, as in the native constructor.
pub fn initial_facing(rng: &mut NativeRng) -> f32 {
    rng.range_f32(0.0, f32::from_bits(0x40c9_0fdb))
}

/// Draw after entity creation, preserving the shared RNG call order.
pub fn initial_movement_deadline(clock_seconds: f32, rng: &mut NativeRng) -> f32 {
    rng.range_f32(0.0, 0.3) + clock_seconds
}

/// Draws from the shared run RNG. The original constructor draws facing before
/// powf/entity creation and movement delay after entity creation; integration
/// must preserve that ordering if those external seams consume the run RNG.
pub fn initial_timing(clock_seconds: f32, rng: &mut NativeRng) -> InitialTiming {
    let facing = initial_facing(rng);
    InitialTiming {
        facing,
        next_movement_at: initial_movement_deadline(clock_seconds, rng),
    }
}

/// Ordinary live-enemy cap from Game+230; the native conversion truncates the
/// positive finite f32 result before clamping it to 50..=120.
pub fn population_limit(density_percent: u16) -> usize {
    let scaled = (f32::from(density_percent) / 100.0) * 50.0;
    (scaled as usize).clamp(50, 120)
}

/// Ordinary and guardian constructors share this recovered GUID layout.
pub fn creature_guid(entry: u32, counter: &mut dyn crate::native_counter::NativeCounter) -> u64 {
    crate::native_counter::creature_guid(entry,counter)
}
