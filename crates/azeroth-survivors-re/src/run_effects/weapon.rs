//! Historical 0.105.0 basic weapon swings, separate from ordinary spell power.
//! Current ordinary contracts: docs/analysis/ordinary-weapons-pets-0.110.0.md.
//! Owners: tick145902c51..2f6b and ordered selector145925e50.
//! The application owns the native stage position, melee publication and the
//! synchronous canonical actor-hit call. No substitute actor collection is used.

use crate::{
    enemies::{NativeRng, Position},
    player_abilities::{behavior::execution::Critical, behavior::unit24},
};

pub const TARGET_SHA256: &str = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7";

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Profile {
    pub damage: f32,
    pub interval: f32,
    pub range: f32,
}

/// Native class-table indirection146e7b190 and default146bab7a8. Profile
/// presence, rather than learned spells or worn item appearance, enables swings.
pub fn profile(class: u8) -> Option<Profile> {
    let (damage, interval) = match class {
        2 => (27.0, f32::from_bits(0x3fe6_6666)),
        4 => (14.0, f32::from_bits(0x3f99_999a)),
        3 | 5 | 7 | 8 | 9 | 11 => return None,
        _ => (27.5, f32::from_bits(0x3fcc_cccd)),
    };
    Some(Profile {
        damage,
        interval,
        range: 6.0,
    })
}

/// Current Game+538 starts at exact+0.0: constructor145900998 clears the
/// aggregate at RBP+568, copied from RBP+30. A disabled class preserves it,
/// and one due frame produces at most one swing.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct State {
    pub remaining: f32,
}

impl State {
    pub fn new(remaining: f32) -> Self {
        Self { remaining }
    }

    pub fn elapse(&mut self, profile: Option<Profile>, delta: f32) -> bool {
        if profile.is_none() {
            return false;
        }
        self.remaining -= delta;
        // UCOMISS(0, remaining)/JB also defers an unordered timer.
        self.remaining <= 0.0
    }

    pub fn no_target(&mut self) {
        self.remaining = f32::from_bits(0x3e19_999a);
    }

    /// The native read follows the synchronous hit/proc tail: callers supply
    /// the current cooldown at this edge, after any stat-changing hit callback.
    pub fn complete(&mut self, profile: Profile, current_cooldown: f32) {
        let interval = profile.interval * f32::from_bits(0x3f99_999a);
        self.remaining = current_cooldown.sqrt() * interval;
    }
}

/// Native ordered eight-byte stat rows at Game+778/+780. Temporary effects
/// append only to the stat-refresh scratch clone, so they must not be included
/// in this separate weapon-stat read. General damage still uses computed stats.
pub fn stat_multiplier(stats: &[(u8, f32)]) -> f32 {
    let mut sum = -0.0_f32;
    for &(tag, amount) in stats {
        if tag == 16 {
            sum += amount;
        }
    }
    sum + 1.0
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Swing {
    pub power: f32,
    pub critical: bool,
    pub packet_amount: u32,
}

/// Called only after a successful target query. Its single24-bit crit draw
/// advances the actual run RNG before melee publication and canonical damage.
pub fn swing(
    profile: Profile,
    stats: &[(u8, f32)],
    current_damage: f32,
    critical: Critical,
    rng: &mut NativeRng,
) -> Swing {
    let mut power = stat_multiplier(stats) * (profile.damage * 1.5);
    let is_critical = critical.chance > unit24(rng);
    power *= current_damage;
    if is_critical {
        power *= critical.multiplier;
    }
    Swing {
        power,
        critical: is_critical,
        packet_amount: power as u32,
    }
}

/// A sampled view of the actual live actor. The raw flag remains a byte:
/// selector14599eb80 computes wrapping(2-flag) rather than coercing to bool.
#[derive(Clone, Copy, Debug)]
pub struct Candidate {
    pub guid: u64,
    pub position: Position,
    pub health: f32,
    pub dead: bool,
    pub avoid_until: f32,
    pub has_metadata: bool,
    pub flag: u8,
}

impl Candidate {
    fn priority(&self, now: f32) -> u8 {
        if self.avoid_until > now {
            3
        } else if self.has_metadata {
            0
        } else {
            2_u8.wrapping_sub(self.flag)
        }
    }
}

fn distance_squared(a: Position, b: Position) -> f32 {
    let x = a.x - b.x;
    let y = a.y - b.y;
    y * y + x * x
}

/// Inclusive XY radius, stable distance then priority ordering. Native copies
/// the FIRST ordinary target's position as the6yd partition center; it does
/// not use player position for that partition. Nearby ordinary targets sort
/// by current HP in f32 total order; far and avoided targets retain their order.
pub fn ordered_targets(
    candidates: &[Candidate],
    now: f32,
    origin: Position,
    range: f32,
) -> Vec<&Candidate> {
    let squared = range * range;
    let mut result = candidates
        .iter()
        .filter(|candidate| {
            !candidate.dead && squared >= distance_squared(candidate.position, origin)
        })
        .collect::<Vec<_>>();
    result.sort_by(|a, b| {
        distance_squared(a.position, origin).total_cmp(&distance_squared(b.position, origin))
    });
    result.sort_by_key(|candidate| candidate.priority(now));
    let avoided_index = result
        .iter()
        .position(|candidate| candidate.priority(now) == 3)
        .unwrap_or(result.len());
    let avoided = result.split_off(avoided_index);
    if let Some(index) = result
        .iter()
        .position(|candidate| candidate.priority(now) == 2)
    {
        let ordinary = result.split_off(index);
        let center = ordinary[0].position;
        let (mut near, far): (Vec<&Candidate>, Vec<&Candidate>) = ordinary
            .into_iter()
            .partition(|candidate| distance_squared(candidate.position, center) <= 36.0);
        near.sort_by(|a, b| a.health.total_cmp(&b.health));
        result.extend(near);
        result.extend(far);
    }
    result.extend(avoided);
    result
}

#[cfg(test)]
mod tests {
    use super::*;

    fn fixtures() -> serde_json::Value {
        let value: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.105.0/power-scaling/weapon/native-fixtures.json"
        ))
        .unwrap();
        assert_eq!(value["target_sha256"], TARGET_SHA256);
        value
    }

    fn float(value: &serde_json::Value) -> f32 {
        f32::from_bits(value.as_u64().unwrap() as u32)
    }

    fn assert_bits(actual: f32, expected: &serde_json::Value) {
        let expected = float(expected);
        assert!(
            actual.to_bits() == expected.to_bits() || actual.is_nan() && expected.is_nan(),
            "{actual:?} != {expected:?}"
        );
    }

    #[test]
    fn selected_talent_ranks_match_current_native_stat16_and17() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.105.0/power-scaling/ranks/native-fixtures.json"
        ))
        .unwrap();
        assert_eq!(fixtures["target_sha256"], TARGET_SHA256);
        assert_eq!(fixtures["cases"].as_array().unwrap().len(), 15);
        for case in fixtures["cases"].as_array().unwrap() {
            let stat = case["stat"].as_u64().unwrap() as u8;
            let amount_bits = case["input_amount_bits"].as_u64().unwrap() as u32;
            // The retained catalog represents the current numeric variant35
            // contract as historical internal variant30. Check real payloads
            // through their normal rank entry, without migrating that schema.
            let payload = crate::run_effects::catalog()
                .classes
                .iter()
                .flat_map(|class| &class.talents)
                .flat_map(|talent| &talent.effects)
                .find(|payload| {
                    let bytes = crate::run_effects::EffectRow::decode(&payload.raw_hex);
                    bytes[0] == 30
                        && bytes[8] == stat
                        && u32::from_le_bytes(bytes[4..8].try_into().unwrap()) == amount_bits
                })
                .expect("selected stat coefficient in retained catalog");
            let row = crate::run_effects::EffectRow::talent(
                payload,
                case["rank"].as_u64().unwrap() as u8,
            );
            assert_eq!(case["native_variant"], 35);
            assert_eq!(row.tag(), 30);
            assert_eq!(row.bytes[8], stat);
            assert_bits(row.float(4), &case["scaled_amount_bits"]);
        }
    }

    #[test]
    fn weapon_timer_matches_current_post_aura_recovery_conversion() {
        let fixtures = fixtures();
        assert_eq!(fixtures["recovery"].as_array().unwrap().len(), 6);
        for case in fixtures["recovery"].as_array().unwrap() {
            let profile = Profile {
                damage: 27.5,
                interval: float(&case["interval_bits"]),
                range: 6.0,
            };
            let mut state = State::default();
            state.complete(profile, float(&case["cooldown_bits"]));
            assert_bits(state.remaining, &case["timer_bits"]);
        }
    }

    #[test]
    fn weapon_scalar_timer_crit_and_rng_match_selected_native_stage() {
        let fixtures = fixtures();
        assert_eq!(fixtures["swings"].as_array().unwrap().len(), 28);
        for case in fixtures["initial_timer"].as_array().unwrap() {
            assert_bits(State::default().remaining, &case["after_copy_bits"]);
        }
        for case in fixtures["swings"].as_array().unwrap() {
            let profile = profile(case["class"].as_u64().unwrap() as u8);
            let mut state = State::new(float(&case["remaining_bits"]));
            let mut rng = NativeRng {
                words: std::array::from_fn(|i| case["rng_before"][i].as_u64().unwrap()),
            };
            if state.elapse(profile, float(&case["delta_bits"])) {
                let profile = profile.unwrap();
                assert_bits(profile.range, &case["radius_bits"]);
                if case["target"].as_bool().unwrap() {
                    let stats = case["stats"]
                        .as_array()
                        .unwrap()
                        .iter()
                        .map(|row| (row[0].as_u64().unwrap() as u8, float(&row[1])))
                        .collect::<Vec<_>>();
                    let attack = swing(
                        profile,
                        &stats,
                        float(&case["damage_bits"]),
                        Critical {
                            chance: float(&case["chance_bits"]),
                            multiplier: float(&case["critical_multiplier_bits"]),
                        },
                        &mut rng,
                    );
                    assert_bits(attack.power, &case["hit"]["power_bits"]);
                    assert_eq!(attack.critical, case["hit"]["critical"]);
                    assert_eq!(attack.packet_amount, case["melee"]["amount"]);
                    assert_eq!(case["calls"], serde_json::json!(["query", "melee", "hit"]));
                    assert_eq!(case["hit"]["spell"], 0);
                    assert_eq!(case["hit"]["school"], 0);
                    assert_eq!(case["hit"]["suppress_log"], true);
                    state.complete(profile, float(&case["cooldown_after_bits"]));
                } else {
                    assert_eq!(case["calls"], serde_json::json!(["query"]));
                    state.no_target();
                }
            } else {
                assert_eq!(case["calls"], serde_json::json!([]));
            }
            assert_bits(state.remaining, &case["remaining_after_bits"]);
            assert_eq!(
                rng.words,
                std::array::from_fn(|i| case["rng_after"][i].as_u64().unwrap()),
                "{}",
                case["name"]
            );
        }
    }

    #[test]
    fn weapon_target_order_matches_full_selected_native_query() {
        let fixtures = fixtures();
        assert_eq!(fixtures["queries"].as_array().unwrap().len(), 15);
        for case in fixtures["queries"].as_array().unwrap() {
            let candidates = case["actors"]
                .as_array()
                .unwrap()
                .iter()
                .map(|actor| Candidate {
                    guid: actor["guid"].as_u64().unwrap(),
                    position: Position {
                        x: actor["x"].as_f64().unwrap() as f32,
                        y: actor["y"].as_f64().unwrap() as f32,
                        z: 0.0,
                    },
                    health: float(&actor["health_bits"]),
                    dead: actor["dead"].as_bool().unwrap(),
                    avoid_until: float(&actor["avoid_bits"]),
                    has_metadata: actor["metadata"].as_bool().unwrap(),
                    flag: actor["flag"].as_u64().unwrap() as u8,
                })
                .collect::<Vec<_>>();
            let selected = ordered_targets(
                &candidates,
                float(&case["now_bits"]),
                Position::default(),
                float(&case["radius_bits"]),
            )
            .into_iter()
            .map(|target| target.guid)
            .collect::<Vec<_>>();
            assert_eq!(
                selected,
                case["selected"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|id| id.as_u64().unwrap())
                    .collect::<Vec<_>>(),
                "{}",
                case["name"]
            );
        }
    }
}
