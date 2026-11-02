//! Special-demon hit effects. Current Consume Magic uses the 0.112.0
//! common-melee owner145956d00 and selector1459efc30; older helpers below
//! retain their stated provenance. The canonical hit owner has
//! already resolved each hit before these producers run; shield generation uses
//! that hit's full critical-adjusted power, independently of effective damage.
use crate::{
    player_abilities::{
        behavior::{min_preserving_original_nan, periodic::ActorPeriodic, state::Vitals},
        RuntimeInstance,
        native_max, native_min,
    },
};

/// Current1459efc30: eligible positive remaining DoTs compete by learned rank,
/// then Agony/Corruption/Immolate/Drain Life priority. Unlearned rows use rank1.
pub fn consume_magic_spell(rows: &[ActorPeriodic], learned: &[RuntimeInstance<'_>]) -> Option<u32> {
    let priority = |spell| match spell { 980 => 0, 172 => 1, 348 => 2, 689 => 3, _ => 4 };
    let rank = |spell| learned.iter().find(|row| row.definition.spell_id == spell)
        .map_or(1, |row| row.rank);
    let mut selected = None;
    for row in rows {
        if row.ticks_remaining == 0 || !(row.power_per_tick > 0.0) || priority(row.spell_id) == 4 {
            continue;
        }
        if selected.is_none_or(|previous| rank(row.spell_id) > rank(previous)
            || (rank(row.spell_id) == rank(previous) && priority(row.spell_id) <= priority(previous))) {
            selected = Some(row.spell_id);
        }
    }
    selected
}

/// Current1459577d9..145957837 mutates every remaining row of the selected
/// spell, including later nonpositive duplicates. Tick counts and owners stay.
pub fn consume_magic(rows: &mut [ActorPeriodic], spell: u32, now: f32) -> f32 {
    let mut consumed = 0.0;
    for row in rows {
        if row.spell_id != spell || row.ticks_remaining == 0 { continue; }
        consumed += (row.power_per_tick * 0.1) * row.ticks_remaining as f32;
        row.power_per_tick *= 0.9;
        row.interval *= 0.9;
        row.next_tick_at = now + native_max(row.next_tick_at - now, 0.0) * 0.9;
    }
    consumed
}

///Current145959b85..145959bcd and14595a04b..14595a08d use the common70/10
/// logarithmic radius softcap, independently of the learned Hellfire radius.
pub fn infernal_landing_radius(area: f32) -> f32 {
    let radius = area * 8.0;
    if radius > 70.0 {
        ((radius - 70.0) / 10.0).ln_1p() * 10.0 + 70.0
    } else {
        radius
    }
}

/// 0.127.0 145c88e73..145c88ec2. `pool` is Game+1a8, within total absorb+53c.
/// All Voidwalkers share the ten-percent-maximum-health cap. The caller supplies
/// the current ordered sum of raw talent effect31's float at+4.
pub fn grant_soul_link(vitals: &mut Vitals, pool: &mut f32, hit_power: f32, fraction: f32) -> f32 {
    if fraction <= 0.0 {
        return 0.0;
    }
    let capacity = native_max(vitals.maximum_health * 0.1 - *pool, 0.0);
    let gain = native_min(hit_power * fraction, capacity);
    if !(gain > 0.0) {
        return 0.0;
    }
    *pool += gain;
    vitals.absorb += gain;
    gain
}

/// 0.127.0 145c70e16..145c70e5a enforces a shrinking maximum before actor AI.
/// Only the Soul Link excess is lost; unrelated absorb remains available.
pub fn clamp_soul_link_capacity(vitals: &mut Vitals, pool: &mut f32) {
    let cap = vitals.maximum_health * 0.1;
    if *pool > cap {
        let excess = *pool - cap;
        *pool = cap;
        vitals.absorb = native_max(vitals.absorb - excess, 0.0);
    }
}

///Current14595711f..14595715a. A Voidwalker killing blow updates HP directly;
/// it does not feed general healing's overheal conversion or healing pool.
/// The caller credits only the returned positive effective amount under the
/// captured Voidwalker descriptor, and publishes the resulting vital fields.
pub fn voidwalker_kill_heal(vitals: &mut Vitals) -> f32 {
    voidwalker_kill_heal_for_rank(vitals, 0)
}

pub fn voidwalker_kill_heal_for_rank(vitals: &mut Vitals, heroic_rank: u8) -> f32 {
    let before = vitals.health;
    let requested = 2.5 * crate::heroic::healing_factor(heroic_rank);
    vitals.health = min_preserving_original_nan(before + requested, vitals.maximum_health);
    vitals.health - before
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::player_abilities::behavior::passive_tick::{
        DemonSoulShardCredit, PassiveTickState, credit_demon_soul_shards,
    };

    fn fixture() -> serde_json::Value {
        serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.105.0/demon-effects/native-vectors.json"
        ))
        .unwrap()
    }
    fn population_fixture() -> serde_json::Value {
        serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.127.0/warlock-population/native-cases.json"
        ))
        .unwrap()
    }
    fn f(case: &serde_json::Value, key: &str) -> f32 {
        f32::from_bits(case[key].as_u64().unwrap() as u32)
    }
    fn vitals(health: f32, maximum: f32, absorb: f32) -> Vitals {
        Vitals {
            health,
            maximum_health: maximum,
            absorb,
            absorb_applied_at: 0.0,
            absorb_same_tick_count: 0,
        }
    }

    #[test]
    fn shared_voidwalker_cap_matches_selected_native_instructions() {
        for case in population_fixture()["shield"].as_array().unwrap() {
            let mut hp = vitals(75.0, f(case, "maximum_bits"), f(case, "absorb_bits"));
            let mut pool = f(case, "pool_bits");
            grant_soul_link(
                &mut hp,
                &mut pool,
                f(case, "damage_bits"),
                f(case, "fraction_bits"),
            );
            assert_eq!(
                pool.to_bits(),
                f(case, "expected_pool_bits").to_bits(),
                "{case}"
            );
            assert_eq!(
                hp.absorb.to_bits(),
                f(case, "expected_absorb_bits").to_bits(),
                "{case}"
            );
        }
    }
    #[test]
    fn shrinking_maximum_removes_only_the_soul_link_excess() {
        for case in population_fixture()["shield_cap"].as_array().unwrap() {
            let mut hp = vitals(75.0, f(case, "maximum_bits"), f(case, "absorb_bits"));
            let mut pool = f(case, "pool_bits");
            clamp_soul_link_capacity(&mut hp, &mut pool);
            assert_eq!(pool.to_bits(), f(case, "expected_pool_bits").to_bits());
            assert_eq!(
                hp.absorb.to_bits(),
                f(case, "expected_absorb_bits").to_bits()
            );
        }
    }
    #[test]
    fn voidwalker_killing_blow_uses_direct_effective_healing() {
        for case in fixture()["cases"]["kill_heal"].as_array().unwrap() {
            let mut hp = vitals(f(case, "health_bits"), f(case, "maximum_bits"), 3.0);
            let actual = voidwalker_kill_heal(&mut hp);
            assert_eq!(
                hp.health.to_bits(),
                f(case, "expected_health_bits").to_bits()
            );
            assert_eq!(actual.to_bits(), f(case, "effective_bits").to_bits());
            assert_eq!(hp.absorb, 3.0);
        }
    }
    #[test]
    fn felguard_fractional_credit_and_cap_match_selected_native_instructions() {
        for case in fixture()["cases"]["shard_credit"].as_array().unwrap() {
            let mut state = PassiveTickState::default();
            state.soul_fire_points = case["points"].as_u64().unwrap() as u32;
            state.soul_fire_fraction = f(case, "fraction_bits");
            let recent = f(case, "recent_bits");
            if recent != 0.0 {
                state.demon_soul_shard_credits.push(DemonSoulShardCredit {
                    at: 10.0,
                    amount: recent,
                });
            }
            let credited = credit_demon_soul_shards(&mut state, 10.0);
            assert_eq!(
                state.soul_fire_points,
                case["expected_points"].as_u64().unwrap() as u32
            );
            assert_eq!(
                state.soul_fire_fraction.to_bits(),
                f(case, "expected_fraction_bits").to_bits(),
                "{case}"
            );
            assert_eq!(
                u64::from(credited),
                case["publisher_calls"].as_u64().unwrap()
            );
            if !case["admitted_bits"].is_null() {
                assert_eq!(
                    state
                        .demon_soul_shard_credits
                        .last()
                        .unwrap()
                        .amount
                        .to_bits(),
                    case["admitted_bits"].as_u64().unwrap() as u32
                );
            }
        }
    }
    #[test]
    fn soul_shard_window_expires_at_one_second() {
        let mut state = PassiveTickState::default();
        for _ in 0..12 {
            credit_demon_soul_shards(&mut state, 10.0);
        }
        assert_eq!(state.demon_soul_shard_credits.len(), 10);
        assert!(!credit_demon_soul_shards(&mut state, 10.999));
        assert!(credit_demon_soul_shards(&mut state, 11.0));
        assert_eq!(state.demon_soul_shard_credits.len(), 1);
    }
}
