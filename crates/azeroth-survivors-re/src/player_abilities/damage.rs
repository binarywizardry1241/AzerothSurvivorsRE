//! Retained cast arithmetic, with the current seven-lane cooldown composition.
//! The 0.112.0 modifier recovery does not revalidate every historical cast leaf.
//! Owners: 0x1454e7bbc..0x1454e7c2c and 0x14549ebc3..0x14549ec0b.

use super::{native_max, RuntimeInstance};

#[derive(Clone, Copy, Debug)]
pub struct PowerContext {
    /// Native Game+1112, the current computed maximum-health stat.
    pub maximum_health: f32,
    /// Native Game+1116, the current computed outgoing-power multiplier.
    pub damage_multiplier: f32,
}

pub fn effective_power(instance: &RuntimeInstance<'_>, context: &PowerContext) -> f32 {
    let definition = instance.definition;
    let kind_weight = match definition.kind {
        2 | 3 | 8 => 0.5,
        _ => 1.0,
    };
    let health = if definition.base_power > 0.0 {
        instance.health_power * context.maximum_health
    } else { 0.0 };
    let base = definition.base_power * 1.4;
    let base = base * instance.power_multiplier;
    let base = base * instance.talent_power_multiplier;
    let base = base * kind_weight;
    (base + health) * context.damage_multiplier
}

/// Cooldown before the effect11 invulnerability hold. Also used by upgrade gates.
pub fn base_interval(instance: &RuntimeInstance<'_>, global_multiplier: f32) -> f32 {
    let interval = instance.definition.base_cooldown * 1.4;
    let interval = interval * instance.cooldown_multiplier;
    let interval = interval * instance.talent_cooldown_multiplier;
    let floor = match instance.definition.key {
        "divine_shield" => divine_shield_gap(instance),
        "hellfire" => 0.5,
        _ => 0.25,
    };
    native_max(interval * global_multiplier, floor)
}

pub fn scaled_duration(instance: &RuntimeInstance<'_>) -> f32 {
    let duration = instance.definition.duration * 1.4;
    let duration = duration * instance.duration_multiplier;
    let duration = duration * instance.talent_duration_multiplier;
    // 0.140.0 145f7c0af..145f7c0fa. The keyed set/amulet lane
    // can replace the ordinary capped product with six seconds times itself.
    if instance.definition.key != "divine_shield" {
        return duration;
    }
    if instance.talent_duration_multiplier > 1.0 {
        6.0 * instance.talent_duration_multiplier
    } else {
        super::native_min(duration, 6.0)
    }
}

/// 0.140.0 145dd4290: the minimum time from expiry to the next cast.
pub(super) fn divine_shield_gap(instance: &RuntimeInstance<'_>) -> f32 {
    native_max(10.0 - scaled_duration(instance), 4.0)
}

/// Native successful cast interval. Effect11 adds the scaled invulnerability duration
/// after applying the cooldown floor; it is not multiplied by global cooldown.
pub fn cooldown(instance: &RuntimeInstance<'_>, global_multiplier: f32) -> f32 {
    let interval = base_interval(instance, global_multiplier);
    if instance.definition.effect.tag == 11 {
        interval + native_max(scaled_duration(instance), 0.1)
    } else { interval }
}

#[cfg(test)]
mod lifetime_tests {
    use super::*;

    #[test]
    fn divine_shield_caps_the_live_duration_and_preserves_ten_second_cycles() {
        let definition = super::super::AbilityDefinition::by_key("divine_shield").unwrap();
        for duration in [0.25, 1.0, 2.0, 100.0] {
            for cooldown_scale in [0.0, 0.01, 0.5, 1.0] {
                let mut instance = RuntimeInstance::learned(definition);
                instance.duration_multiplier = duration;
                instance.cooldown_multiplier = cooldown_scale;
                let actual_duration = scaled_duration(&instance);
                assert!(actual_duration <= 6.0);
                let interval = cooldown(&instance, 0.1);
                assert!(interval >= 10.0);
                assert!(interval - actual_duration >= 4.0);
            }
        }
    }

    #[test]
    fn divine_shield_amulet_lane_replaces_ordinary_duration_and_preserves_the_gap() {
        let mut instance = RuntimeInstance::learned(
            super::super::AbilityDefinition::by_key("divine_shield").unwrap());
        instance.duration_multiplier = 0.5;
        instance.talent_duration_multiplier = 2.0;
        instance.cooldown_multiplier = 0.0;
        assert_eq!(scaled_duration(&instance), 12.0);
        assert_eq!(base_interval(&instance, 0.0), 4.0);
        assert_eq!(cooldown(&instance, 0.0), 16.0);
    }

    #[test]
    fn divine_shield_floor_uses_duration_before_the_minimum_aura_hold() {
        let mut instance = RuntimeInstance::learned(
            super::super::AbilityDefinition::by_key("divine_shield").unwrap());
        instance.cooldown_multiplier = 0.0;
        instance.duration_multiplier = 0.0;
        assert_eq!(scaled_duration(&instance), 0.0);
        assert_eq!(base_interval(&instance, 0.0), 10.0);
        assert_eq!(cooldown(&instance, 0.0), 10.1);
        instance.duration_multiplier = f32::NAN;
        assert_eq!(scaled_duration(&instance), 6.0);
        assert_eq!(cooldown(&instance, 0.0), 10.0);
    }

    #[test]
    fn ordinary_and_racial_immunity_keep_their_own_duration_and_floor() {
        let mut hellfire = RuntimeInstance::learned(
            super::super::AbilityDefinition::by_key("hellfire").unwrap());
        hellfire.cooldown_multiplier = 0.0;
        assert_eq!(base_interval(&hellfire, 0.0), 0.5);
        let mut racial = RuntimeInstance::learned(
            super::super::AbilityDefinition::by_key("shadowmeld").unwrap());
        racial.duration_multiplier = 10.0;
        assert!(scaled_duration(&racial) > 6.0);
        assert_eq!(base_interval(&racial, 0.0), 0.25);
    }
}

/// Inputs read by the existing current-target hit/death owner0x1454c2eb0.
/// Keep this alongside the owning actor health/component; it is not another AI.
#[derive(Clone, Copy, Debug)]
pub struct Victim {
    pub health: f32,                 // Actor+240
    pub maximum_health: f32,         // Actor+244
    pub primary_boss: bool,          // Actor+24 optional metadata present
    pub guardian: bool,              // Actor+16 optional metadata present
    /// Current 0.112.0 Actor+0x10: retained periodic vector is nonempty.
    /// The native hit owner does not inspect owner, spell or remaining ticks.
    pub has_periodic: bool,
    pub native_flag_158: u8,         // Actor+344, the current consumer tests1
    pub slow_until: f32,             // Actor+156; fear/target-avoid is separate+320
    pub stun_until: f32,             // Actor+324
    pub forced_escape_until: f32,    // Actor+336
    pub vulnerability: f32,          // Actor+168
    pub vulnerability_until: f32,    // Actor+172
    /// Selected0.127.0 actor+128/12c (fallback130/134), independent of
    /// Judgement's actor+120/124. Supplied from the shared strongest window.
    pub demoralizing_amplification: f32,
    pub additional_damage_taken: f32,// Actor+316
    pub dead: bool,                  // Actor state+104 ==1
}

#[derive(Clone, Copy, Debug)]
pub struct VictimContext<'a> {
    pub run_state: u8,               // Game+2399 must equal1
    pub now: f32,
    pub player_absorb: f32,          // Game+1028
    /// Ordered current talent-effect records, retaining native discriminants.
    pub talent_effects: &'a [(u8, f32)],
}

fn talent_sum(effects: &[(u8, f32)], tag: u8) -> f32 {
    let mut total = -0.0_f32;
    for (effect, amount) in effects {
        if *effect == tag { total += *amount; }
    }
    total
}

/// Current0x14593ed6c..0x14593f188, in instruction order. Stat21 is
/// Trauma's victim-periodic lane; guardian metadata only selects raid defense.
pub fn victim_multiplier(victim: &Victim, context: &VictimContext<'_>) -> f32 {
    let mut multiplier = 1.0;
    if victim.stun_until > context.now || victim.slow_until > context.now || victim.forced_escape_until > context.now {
        multiplier = talent_sum(context.talent_effects, 18) + 1.0;
    }
    // 0.140.0 145fbbfb4..145fbbfcd also admits Guardian metadata for stat19.
    if victim.primary_boss || victim.native_flag_158 == 1 || victim.guardian {
        multiplier += talent_sum(context.talent_effects, 19);
    }
    if victim.maximum_health * 0.3 > victim.health {
        multiplier += talent_sum(context.talent_effects, 20);
    }
    if victim.has_periodic { multiplier += talent_sum(context.talent_effects, 21); }
    if victim.vulnerability_until > context.now { multiplier += victim.vulnerability; }
    multiplier += victim.demoralizing_amplification;
    if context.player_absorb > 0.0 { multiplier += talent_sum(context.talent_effects, 28); }
    multiplier + victim.additional_damage_taken
}

#[cfg(test)]
mod shout_damage_tests {
    use super::*;
    use crate::{enemies::ai::TimedReduction, player_abilities::behavior::state::StrongestWindow};

    #[test]
    fn current_native_damage_counts_judgement_and_the_shout_fallback_independently() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.127.0/shouts/native-cases.json"
        )).unwrap();
        for case in proof["independent_hit"].as_array().unwrap() {
            let f = |index: usize| f32::from_bits(case[index].as_u64().unwrap() as u32);
            let window = StrongestWindow {
                active: TimedReduction { fraction: 0.3, until: f(2) },
                fallback: TimedReduction { fraction: 0.1, until: f(3) },
            };
            let victim = Victim {
                health: 100., maximum_health: 100., primary_boss: false,
                guardian: false, has_periodic: false, native_flag_158: 0,
                slow_until: 0., stun_until: 0., forced_escape_until: 0.,
                vulnerability: 0.12, vulnerability_until: f(1),
                demoralizing_amplification: window.value_at(f(0)),
                additional_damage_taken: 0., dead: false,
            };
            let actual = victim_multiplier(&victim, &VictimContext {
                run_state: 1, now: f(0), player_absorb: 0., talent_effects: &[],
            });
            assert_eq!(actual.to_bits(), case[4].as_u64().unwrap() as u32);
        }
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct HitDamage {
    /// Full float hit, including overkill, used by native logs and leech.
    pub amount: f32,
    /// Hit capped to positive previous HP, used by current total/spell meters.
    pub effective: f32,
    /// HP field is sent as ceil(max(remaining,0)), saturating to native u32.
    pub packet_health: u32,
    pub lethal: bool,
}

/// Historical hit prefix0x1454c33c0..0x1454c35bf; selected0.105.0 cap and
/// accounting inputs are revalidated at1459344b5..1459345c7.
/// Input power already includes the
/// cast/launch crit result. The owning run must consume this result through its
/// real meters, packets, proc, death and loot adapters in native order.
/// This routine intentionally does not mark an actor dead before those hooks.
pub fn apply_hit(victim: &mut Victim, power: f32, context: &VictimContext<'_>) -> Option<HitDamage> {
    apply_hit_with_raid_multiplier(victim, power, context, 1.0)
}

/// Current1459719bc..1a4f applies raid defense after talent-adjusted power,
/// before its minimum-one clamp. Ordinary actors retain the neutral lane.
pub fn apply_hit_with_raid_multiplier(victim: &mut Victim, power: f32,
    context: &VictimContext<'_>, raid_multiplier: f32) -> Option<HitDamage> {
    apply_hit_with_cap(victim, power, context, raid_multiplier, None)
}

///0.121.0 actor-hit145c15f50..145c1613e: parentless kind3 ward damage
/// is capped after victim/raid modifiers, before the common minimum-one rule.
/// A zero capped request is rejected at the new gate before that minimum.
pub fn apply_hit_with_cap(victim: &mut Victim, power: f32,
    context: &VictimContext<'_>, raid_multiplier: f32, cap: Option<f32>) -> Option<HitDamage> {
    if context.run_state != 1 || victim.dead { return None; }
    let factor = if victim.primary_boss || victim.guardian { raid_multiplier } else { 1.0 };
    let requested = (victim_multiplier(victim, context) * power) * factor;
    let requested = if let Some(cap) = cap {
        let amount = if cap.is_nan() || requested < cap { requested } else { cap };
        if amount == 0.0 { return None; }
        amount
    } else { requested };
    let amount = native_max(requested, 1.0);
    let before = native_max(victim.health, 0.0);
    victim.health -= amount;
    Some(HitDamage {
        amount,
        effective: super::native_min(amount, before),
        packet_health: native_max(victim.health, 0.0).ceil() as u32,
        lethal: victim.health <= 0.0,
    })
}
