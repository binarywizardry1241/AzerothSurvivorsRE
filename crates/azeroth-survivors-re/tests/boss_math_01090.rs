//! Current0.109.0 native instructions with explicit powf seams; not game parity.
use azeroth_survivors_re::bosses::scaling::{BossScalingInput, initial_stats_with_powf};
use serde_json::Value;
#[path = "fixtures/legacy_boss_zones.rs"]
mod legacy_boss_zones;

fn float(value: &Value) -> f32 {
    value.as_f64().unwrap() as f32
}
fn bits(value: &Value) -> u32 {
    value.as_u64().unwrap() as u32
}

#[test]
fn current_boss_caller_arithmetic_matches_native_vectors() {
    let fixture: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/boss-inputs/manifest.json"
    ))
    .unwrap();
    assert_eq!(
        fixture["target_sha256"],
        "76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0"
    );
    let cases = fixture["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 480);
    let zones = legacy_boss_zones::by_historical_ordinal();
    for case in cases {
        let zone = zones[case[0].as_u64().unwrap() as usize];
        let definition = &zone.bosses[case[1].as_u64().unwrap() as usize];
        let profile = &fixture["profiles"][case[2].as_u64().unwrap() as usize];
        let input = BossScalingInput {
            clock_seconds: float(&profile[0]),
            difficulty: float(&profile[1]),
            zone_scale: zone.scalar_e0,
            hp_percent: bits(&profile[2]) as u16,
            damage_percent: bits(&profile[3]) as u16,
            speed_percent: bits(&profile[4]) as u16,
            phase: bits(&profile[5]),
            endless: profile[6].as_bool().unwrap(),
            endless_start_seconds: float(&profile[7]),
        };
        let mut calls = 0;
        let stats = initial_stats_with_powf(input, definition, |base, exponent| {
            let expected = &case[3][calls];
            calls += 1;
            assert_eq!(
                [base.to_bits(), exponent.to_bits()],
                [bits(&expected[0]), bits(&expected[1])]
            );
            f32::from_bits(bits(&expected[2]))
        });
        assert_eq!(calls, case[3].as_array().unwrap().len());
        let actual = [
            stats.health,
            stats.max_health,
            stats.damage,
            stats.movement_speed,
            stats.melee_reach,
            stats.next_movement_at,
            stats.stun_until,
            stats.raw_148_clock,
        ];
        for (actual, expected) in actual.iter().zip(case[4].as_array().unwrap()) {
            assert_eq!(actual.to_bits(), bits(expected), "{case}");
        }
    }
}
