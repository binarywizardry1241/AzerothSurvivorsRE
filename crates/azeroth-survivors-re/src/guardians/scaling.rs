//! 0.97.2 guardian stat functions recovered from the selected EXE.
//!
//! Health: VA 1454ef9f0, REA ev_2bc657ab96ff5aae41847ccd5c490dc62727a5497c57edf69b09ca86c6157d4c.
//! Damage: VA 1454efdf0, REA ev_08414aa773676824707084beb7bbc5a734991236b78c5e41621b83d6b21a96c6.
//! Operand order follows original Win64 SSE instructions, rather than Ghidra's
//! reassociated pseudocode. No fused multiply-add is used. Native oracle fixtures
//! cover the scalar callers with explicit curve, zone-resolver and powf seams.

use super::catalog::HealthKnot;

/// Inputs read by both stat functions from the native game state.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ScalingInput {
    pub heroic_rank: u8,
    pub clock_seconds: f32,
    pub difficulty: f32,
    pub zone_scale: f32,
    pub guardian_kills: u32,
    pub hp_percent: u16,
    pub damage_percent: u16,
    pub phase: u32,
    pub endless: bool,
    pub endless_start_seconds: f32,
}

/// MAXSS/MINSS select their second operand for unordered or equal inputs.
/// This distinction preserves the source's NaN handling and signed zero.
fn sse_max(first: f32, second: f32) -> f32 {
    if first > second {
        first
    } else {
        second
    }
}

fn sse_min(first: f32, second: f32) -> f32 {
    if first < second {
        first
    } else {
        second
    }
}

impl ScalingInput {
    /// The native gate requires phase 1 and the endless flag together.
    pub fn endless_exponent(self) -> Option<f32> {
        (self.phase == 1 && self.endless).then(|| {
            sse_max(
                (self.clock_seconds - self.endless_start_seconds) / 60.0,
                0.0,
            )
        })
    }
}

/// The helper at 14552b760 collects the first five zone boss records' +40/+44
/// pairs, skipping records whose byte +54 is exactly 1. The catalog stores those
/// pairs as knots. Beyond the last knot the final segment is extrapolated.
/// REA ev_26d39b707ce27e4ea6feb8c85ba59085bb2d88ecca355650aad57872086fe5ba.
pub fn health_curve(time_minutes: f32, knots: &[HealthKnot]) -> f32 {
    let Some(first) = knots.first() else {
        return 0.0;
    };
    if knots.len() == 1 {
        return first.base_hp;
    }
    if first.time_minutes >= time_minutes {
        let denominator = sse_max(first.time_minutes, 0.001);
        let growth = (0.4 * time_minutes) / denominator;
        return (growth + 0.6) * first.base_hp;
    }
    let index = knots
        .iter()
        .position(|knot| knot.time_minutes >= time_minutes)
        .unwrap_or(knots.len() - 1)
        .max(1);
    let previous = knots[index - 1];
    let next = knots[index];
    let difference = next.base_hp - previous.base_hp;
    let offset = time_minutes - previous.time_minutes;
    let numerator = offset * difference;
    let denominator = sse_max(next.time_minutes - previous.time_minutes, 0.001);
    numerator / denominator + previous.base_hp
}

/// Recovered health caller with an explicit CRT powf boundary.
///
/// The callback receives (1.22f32, elapsed endless minutes). It is called only
/// behind the native phase/endless gate. Injecting its result allows the caller's
/// arithmetic to be tested independently of host versus Windows CRT powf.
pub fn guardian_health_with_powf(
    input: ScalingInput,
    base_hp: f32,
    knots: &[HealthKnot],
    mut powf: impl FnMut(f32, f32) -> f32,
) -> f32 {
    let minutes = input.clock_seconds / 60.0;
    let curve = health_curve(minutes, knots);
    let endless = input
        .endless_exponent()
        .map_or(1.0, |exponent| powf(1.22, exponent));
    let percent = f32::from(input.hp_percent) / 100.0;
    let curve = curve * 0.6;
    let zone_difficulty = input.zone_scale * input.difficulty;
    let curve = curve * zone_difficulty;
    let linear = 0.12 * minutes + 1.0;
    let quadratic = (0.009 * minutes) * minutes;
    let polynomial = quadratic + linear;
    let polynomial = polynomial * zone_difficulty;
    let polynomial = polynomial * base_hp;
    let polynomial = polynomial * 2.5;
    let selected = sse_max(curve, polynomial);
    let selected = if selected.is_nan() { curve } else { selected };
    let selected = selected * 3.0;
    let selected = selected * endless;
    let kills = input.guardian_kills as f32 * crate::heroic::guardian_health_per_kill(input.heroic_rank) + 1.0;
    ((kills * selected) * percent) * crate::heroic::health_multiplier(input.heroic_rank)
}

/// Recovered damage caller with an explicit CRT powf boundary.
pub fn guardian_damage_with_powf(
    input: ScalingInput,
    base_damage: f32,
    mut powf: impl FnMut(f32, f32) -> f32,
) -> f32 {
    let endless = input
        .endless_exponent()
        .map_or(1.0, |exponent| powf(1.096, exponent));
    let minutes = input.clock_seconds / 60.0;
    let linear = 0.08 * minutes + 1.0;
    let quadratic = (0.004 * minutes) * minutes;
    let polynomial = quadratic + linear;
    let zone_difficulty = input.zone_scale * input.difficulty;
    let difficulty = zone_difficulty.sqrt();
    let time_difficulty = difficulty * polynomial;
    let damage = base_damage * time_difficulty;
    let damage = damage * 1.4;
    let damage = damage * endless;
    let kills = input.guardian_kills as f32 * crate::heroic::guardian_damage_per_kill(input.heroic_rank) + 1.0;
    let damage = kills * damage;
    ((f32::from(input.damage_percent) / 100.0) * damage) * crate::heroic::damage_multiplier(input.heroic_rank)
}

/// Uses host f32::powf. The native caller arithmetic is fixture-verified;
/// Windows CRT powf's complete implementation/cross-platform bit parity is not.
pub fn guardian_health(input: ScalingInput, base_hp: f32, knots: &[HealthKnot]) -> f32 {
    guardian_health_with_powf(input, base_hp, knots, f32::powf)
}

pub fn guardian_damage(input: ScalingInput, base_damage: f32) -> f32 {
    guardian_damage_with_powf(input, base_damage, f32::powf)
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct GuardianVitals {
    pub hp: f32,
    pub max_hp: f32,
    pub damage: f32,
}

impl GuardianVitals {
    /// Native write block 1454cde83..1454cdeea. HP/max increase together only
    /// when the new max is greater; current HP retains its clamped fraction.
    /// Damage cannot decrease. This block does not include UI/healthbar refresh.
    pub fn rescale(&mut self, new_max_hp: f32, new_damage: f32) {
        if new_max_hp > self.max_hp {
            let fraction = self.hp / self.max_hp;
            let fraction = sse_max(0.0, fraction);
            let fraction = sse_min(1.0, fraction);
            self.max_hp = new_max_hp;
            self.hp = new_max_hp * fraction;
        }
        let selected = sse_max(self.damage, new_damage);
        self.damage = if selected.is_nan() {
            self.damage
        } else {
            selected
        };
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    fn number(case: &Value, key: &str) -> u32 {
        case[key].as_u64().unwrap() as u32
    }
    fn float(case: &Value, key: &str) -> f32 {
        f32::from_bits(number(case, key))
    }

    // Undefined arithmetic's NaN sign/payload depends on the host ISA. Preserve
    // exact finite/signed-zero bits and compare NaN classification explicitly.
    fn assert_native(actual: f32, expected: f32, label: &str) {
        if expected.is_nan() {
            assert!(actual.is_nan(), "{label}");
        } else {
            assert_eq!(actual.to_bits(), expected.to_bits(), "{label}");
        }
    }

    #[test]
    fn scalar_callers_match_unchanged_0972_native_instructions() {
        let fixture: Value =
            serde_json::from_str(include_str!("../../tests/fixtures/guardians-native.json"))
                .unwrap();
        assert_eq!(
            fixture["target_sha256"],
            "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
        );
        let cases = fixture["stat_cases"].as_array().unwrap();
        assert_eq!(cases.len(), 288);
        for case in cases {
            let label = format!(
                "{} zone {} enemy {}",
                case["label"], case["zone_index"], case["enemy_index"]
            );
            let input = ScalingInput {
                heroic_rank: 0,
                clock_seconds: float(case, "clock_bits"),
                difficulty: float(case, "difficulty_bits"),
                zone_scale: float(case, "zone_scale_bits"),
                guardian_kills: number(case, "guardian_kills"),
                hp_percent: number(case, "hp_percent") as u16,
                damage_percent: number(case, "damage_percent") as u16,
                phase: number(case, "phase"),
                endless: case["endless"].as_bool().unwrap(),
                endless_start_seconds: float(case, "endless_start_bits"),
            };
            let knots: Vec<HealthKnot> = case["hp_knots_bits"]
                .as_array()
                .unwrap()
                .iter()
                .map(|knot| HealthKnot {
                    time_minutes: f32::from_bits(knot[0].as_u64().unwrap() as u32),
                    base_hp: f32::from_bits(knot[1].as_u64().unwrap() as u32),
                })
                .collect();
            for kind in ["health", "damage"] {
                let mut actual_calls = Vec::new();
                let capture = |base: f32, exponent: f32| {
                    actual_calls.push((base, exponent));
                    float(case, "pow_result_bits")
                };
                let actual = if kind == "health" {
                    guardian_health_with_powf(input, float(case, "base_hp_bits"), &knots, capture)
                } else {
                    guardian_damage_with_powf(input, float(case, "base_damage_bits"), capture)
                };
                assert_native(actual, float(case, &format!("{kind}_bits")), &label);
                let calls = case["pow_calls"][kind].as_array().unwrap();
                assert_eq!(calls.len(), actual_calls.len(), "{label}");
                for (call, (base, exponent)) in calls.iter().zip(actual_calls) {
                    assert_native(base, float(call, "base_bits"), &label);
                    assert_native(exponent, float(call, "exponent_bits"), &label);
                }
            }
        }
    }

    #[test]
    fn rescale_matches_unchanged_native_actor_write_block() {
        let fixture: Value =
            serde_json::from_str(include_str!("../../tests/fixtures/guardians-native.json"))
                .unwrap();
        for case in fixture["rescale_cases"].as_array().unwrap() {
            let label = case["label"].as_str().unwrap();
            let mut actor = GuardianVitals {
                hp: float(case, "hp_bits"),
                max_hp: float(case, "max_hp_bits"),
                damage: float(case, "damage_bits"),
            };
            actor.rescale(
                float(case, "new_max_hp_bits"),
                float(case, "new_damage_bits"),
            );
            assert_native(actor.hp, float(case, "output_hp_bits"), label);
            assert_native(actor.max_hp, float(case, "output_max_hp_bits"), label);
            assert_native(actor.damage, float(case, "output_damage_bits"), label);
        }
    }

    #[test]
    fn curve_edge_branches_match_native_scalar_caller() {
        let fixture: Value =
            serde_json::from_str(include_str!("../../tests/fixtures/guardians-native.json"))
                .unwrap();
        for case in fixture["curve_cases"].as_array().unwrap() {
            let label = case["label"].as_str().unwrap();
            let input = ScalingInput {
                heroic_rank: 0,
                clock_seconds: float(case, "clock_bits"),
                difficulty: float(case, "difficulty_bits"),
                zone_scale: float(case, "zone_scale_bits"),
                guardian_kills: 0,
                hp_percent: 100,
                damage_percent: 100,
                phase: 0,
                endless: false,
                endless_start_seconds: 0.0,
            };
            let knots: Vec<HealthKnot> = case["hp_knots_bits"]
                .as_array()
                .unwrap()
                .iter()
                .map(|knot| HealthKnot {
                    time_minutes: f32::from_bits(knot[0].as_u64().unwrap() as u32),
                    base_hp: f32::from_bits(knot[1].as_u64().unwrap() as u32),
                })
                .collect();
            let result =
                guardian_health_with_powf(input, float(case, "base_hp_bits"), &knots, |_, _| {
                    panic!("unexpected endless powf")
                });
            assert_native(result, float(case, "health_bits"), label);
        }
    }
}
