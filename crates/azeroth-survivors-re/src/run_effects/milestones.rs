//! Current generic1 counters,2 temporary-companion request and5 conversion.
//! Native branches1454cbcf4/cc206/cc453; proof: milestone-native.json.
use super::{EffectRow, actions::admit_per_second};
use crate::{enemies::NativeRng, player_abilities::behavior::unit24};

/// Caller first evaluates condition32 and the native source-index bounds gate.
/// A capped counter survives rate rejection; only an admitted trigger clears it.
pub fn advance_counter(
    row: &EffectRow,
    count: &mut u32,
    timestamps: &mut Vec<f32>,
    now: f32,
) -> bool {
    if row.tag() != 1 {
        return false;
    }
    let threshold = row.word(4);
    *count = count.wrapping_add(1).min(threshold);
    if *count < threshold || !admit_per_second(timestamps, row.word(8), now) {
        return false;
    }
    *count = 0;
    true
}

///1454c9fb4..ca1a1 keeps the base-talent prefix in each indexed state lane,
/// then recreates equipped deadlines/counters/timestamp vectors as zero/empty.
pub fn refresh_slots<T: Default>(slots: &mut Vec<T>, base_count: usize, total_count: usize) {
    slots.truncate(base_count);
    slots.resize_with(total_count, T::default);
}

/// Caller first evaluates condition8 and resolves a non-dead event victim.
/// The request keeps the original event spell/school and uses source-kind3.
pub fn conversion_amount(row: &EffectRow, victim_maximum_health: f32) -> Option<f32> {
    (row.tag() == 5).then(|| row.float(4) * victim_maximum_health)
}

/// Input is the actual stored companion collection before its later cleanup.
/// Native counts source-index matches with the temporary flag; expiry is not a
/// filter at this event edge, even when a row's deadline has already elapsed.
#[derive(Clone, Copy, Debug)]
pub struct CompanionOrigin {
    pub temporary: bool,
    pub effect_index: usize,
}

/// A historical raw2 request helper. Its retained 0.100.1 talent producer used
/// the Imp record. The selected 0.105.0 talent/amulet catalogs contain no raw2
/// producer; current temporary armies use the separate live demon lifecycle.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct TemporaryCompanionRequest {
    pub effect_index: usize,
    pub expires_at: f32,
    pub angle: f32,
}

/// Caller evaluates condition24 before this owner. The chance draw precedes
/// the cap check; an admitted summon then draws its relative spawn angle.
pub fn temporary_companion_request(
    row: &EffectRow,
    index: usize,
    companions: &[CompanionOrigin],
    now: f32,
    rng: &mut NativeRng,
) -> Option<TemporaryCompanionRequest> {
    if row.tag() != 2 {
        return None;
    }
    let draw = unit24(rng);
    // UCOMISS/JB also takes the native unordered arm.
    if draw >= row.float(4) {
        return None;
    }
    let count = companions
        .iter()
        .filter(|entry| entry.temporary && entry.effect_index == index)
        .count();
    if count >= row.word(12) as usize {
        return None;
    }
    Some(TemporaryCompanionRequest {
        effect_index: index,
        expires_at: now + row.float(8),
        angle: rng.range_f32(0.0, std::f32::consts::TAU),
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    fn row(tag: u8, word: u32) -> EffectRow {
        let mut value = super::super::catalog()
            .classes
            .iter()
            .flat_map(|class| &class.talents)
            .flat_map(|talent| &talent.effects)
            .map(|payload| EffectRow::talent(payload, 1))
            .find(|row| row.tag() == tag)
            .unwrap();
        value.bytes[4..8].copy_from_slice(&word.to_le_bytes());
        value
    }
    #[test]
    fn native_counter_wrapping_threshold_and_rate_rejection_preserve_pending_trigger() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/run-effects/milestone-native.json"
        ))
        .unwrap();
        for case in fixture["counters"].as_array().unwrap() {
            if !case["condition"].as_bool().unwrap() || !case["slot_exists"].as_bool().unwrap() {
                continue;
            }
            let mut count = case["before"].as_u64().unwrap() as u32;
            let threshold = case["threshold"].as_u64().unwrap() as u32;
            let mut effect = row(1, threshold);
            effect.bytes[8..12].fill(0);
            let triggered = advance_counter(&effect, &mut count, &mut Vec::new(), 0.0);
            assert_eq!(triggered, case["due"].as_bool().unwrap(), "{case}");
            let expected = if triggered {
                0
            } else {
                case["after"].as_u64().unwrap() as u32
            };
            assert_eq!(count, expected, "{case}");
        }
        let mut effect = row(1, 4);
        effect.bytes[8..12].copy_from_slice(&2u32.to_le_bytes());
        let mut count = 3;
        let mut times = vec![0.2, 0.3];
        assert!(!advance_counter(&effect, &mut count, &mut times, 0.8));
        assert_eq!(count, 4);
        assert!(advance_counter(&effect, &mut count, &mut times, 1.2));
        assert_eq!(count, 0);
        assert_eq!(times, vec![0.3, 1.2]);
    }
    #[test]
    fn conversion_matches_native_scalar_vectors_without_rng_or_global_damage() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/run-effects/milestone-native.json"
        ))
        .unwrap();
        for case in fixture["conversion"].as_array().unwrap() {
            let effect = row(5, case["fraction_bits"].as_u64().unwrap() as u32);
            let value = conversion_amount(
                &effect,
                f32::from_bits(case["maximum_bits"].as_u64().unwrap() as u32),
            )
            .unwrap();
            let expected = f32::from_bits(case["amount_bits"].as_u64().unwrap() as u32);
            assert!(
                value.to_bits() == expected.to_bits() || value.is_nan() && expected.is_nan(),
                "{case}"
            );
        }
    }
    #[test]
    fn counter_rate_and_refresh_match_unchanged_native_state_vectors() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/run-effects/milestone-native.json"
        ))
        .unwrap();
        for case in fixture["rates"].as_array().unwrap() {
            let mut effect = row(1, 4);
            effect.bytes[8..12]
                .copy_from_slice(&(case["cap"].as_u64().unwrap() as u32).to_le_bytes());
            let mut times = case["timestamp_bits"]
                .as_array()
                .unwrap()
                .iter()
                .map(|v| f32::from_bits(v.as_u64().unwrap() as u32))
                .collect::<Vec<_>>();
            let mut count = 3;
            let admitted = advance_counter(
                &effect,
                &mut count,
                &mut times,
                f32::from_bits(case["now_bits"].as_u64().unwrap() as u32),
            );
            assert_eq!(admitted, case["admitted"].as_bool().unwrap(), "{case}");
            assert_eq!(
                count,
                case["counter_after"].as_u64().unwrap() as u32,
                "{case}"
            );
            assert_eq!(
                times.iter().map(|v| v.to_bits()).collect::<Vec<_>>(),
                case["expected_bits"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|v| v.as_u64().unwrap() as u32)
                    .collect::<Vec<_>>(),
                "{case}"
            );
        }
        for case in fixture["refresh"].as_array().unwrap() {
            let mut counters = case["before"]
                .as_array()
                .unwrap()
                .iter()
                .map(|v| v.as_u64().unwrap() as u32)
                .collect::<Vec<_>>();
            refresh_slots(
                &mut counters,
                case["base"].as_u64().unwrap() as usize,
                case["total"].as_u64().unwrap() as usize,
            );
            assert_eq!(
                counters,
                case["after"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|v| v.as_u64().unwrap() as u32)
                    .collect::<Vec<_>>(),
                "{case}"
            );
        }
        for case in fixture["deadline_refresh"].as_array().unwrap() {
            let mut values = case["before_bits"]
                .as_array()
                .unwrap()
                .iter()
                .map(|v| f32::from_bits(v.as_u64().unwrap() as u32))
                .collect::<Vec<_>>();
            refresh_slots(
                &mut values,
                case["base"].as_u64().unwrap() as usize,
                case["total"].as_u64().unwrap() as usize,
            );
            assert_eq!(
                values.iter().map(|v| v.to_bits()).collect::<Vec<_>>(),
                case["after_bits"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|v| v.as_u64().unwrap() as u32)
                    .collect::<Vec<_>>(),
                "{case}"
            );
        }
        for case in fixture["timestamp_refresh"].as_array().unwrap() {
            let convert = |value: &serde_json::Value| {
                value
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|row| {
                        row.as_array()
                            .unwrap()
                            .iter()
                            .map(|v| v.as_u64().unwrap() as u32)
                            .collect::<Vec<_>>()
                    })
                    .collect::<Vec<_>>()
            };
            let mut values = convert(&case["before_bits"]);
            refresh_slots(
                &mut values,
                case["base"].as_u64().unwrap() as usize,
                case["total"].as_u64().unwrap() as usize,
            );
            assert_eq!(values, convert(&case["after_bits"]), "{case}");
        }
    }
    #[test]
    fn companion_producer_matches_native_chance_cap_angle_and_shared_rng_vectors() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/run-effects/milestone-native.json"
        ))
        .unwrap();
        for case in fixture["summons"].as_array().unwrap() {
            let mut effect = row(2, case["chance_bits"].as_u64().unwrap() as u32);
            effect.bytes[12..16]
                .copy_from_slice(&(case["cap"].as_u64().unwrap() as u32).to_le_bytes());
            let words = case["initial_words"]
                .as_array()
                .unwrap()
                .iter()
                .map(|v| v.as_u64().unwrap())
                .collect::<Vec<_>>();
            let mut rng = NativeRng::from_words(words.try_into().unwrap());
            let origins = case["origins"]
                .as_array()
                .unwrap()
                .iter()
                .map(|entry| CompanionOrigin {
                    temporary: entry["temporary"].as_bool().unwrap(),
                    effect_index: entry["effect_index"].as_u64().unwrap() as usize,
                })
                .collect::<Vec<_>>();
            let request = temporary_companion_request(&effect, 2, &origins, 17.5, &mut rng);
            assert_eq!(
                request.is_some(),
                case["admitted"].as_bool().unwrap(),
                "{case}"
            );
            if let Some(request) = request {
                assert_eq!(request.effect_index, 2);
                assert_eq!(
                    request.expires_at.to_bits(),
                    case["expires_bits"].as_u64().unwrap() as u32,
                    "{case}"
                );
                assert_eq!(
                    request.angle.to_bits(),
                    case["angle_bits"].as_u64().unwrap() as u32,
                    "{case}"
                );
            }
            assert_eq!(
                rng.words.as_slice(),
                case["final_words"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|v| v.as_u64().unwrap())
                    .collect::<Vec<_>>(),
                "{case}"
            );
        }
    }
}
