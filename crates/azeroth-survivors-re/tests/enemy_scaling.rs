//! Authored 0.97.2 constructor-oracle regression coverage.
//! Source-only work mode: this Rust test has not been compiled or run.
use azeroth_survivors_re::enemies::{
    catalog::ZONES,
    scaling::{creature_guid, initial_stats_with_powf, initial_timing, population_limit, ScalingInput},
    NativeRng,
};
use serde_json::Value;

fn number(row: &Value, key: &str) -> u64 {
    row[key].as_u64().unwrap()
}
fn float(row: &Value, key: &str) -> f32 {
    f32::from_bits(number(row, key) as u32)
}
fn fixture() -> Value {
    serde_json::from_str(include_str!("fixtures/enemy-scaling-native.json")).unwrap()
}
fn native_bits(actual: f32, row: &Value, key: &str) {
    assert_eq!(actual.to_bits(), number(row, key) as u32, "{key}: {row}");
}

#[test]
fn ordinary_initialization_matches_unchanged_native_constructor_instructions() {
    let fixture = fixture();
    assert_eq!(fixture["target_sha256"], "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589");
    let cases = fixture["scaling_cases"].as_array().unwrap();
    assert_eq!(cases.len(), 1184);
    for row in cases {
        let zone = &ZONES[number(row, "zone_index") as usize];
        let mut definition = zone.enemies[number(row, "enemy_index") as usize];
        // This constructor oracle supplies historical0.97.2 inputs. Current
        // catalog dimensions have their own0.127.0 record/reach regression.
        definition.scale = float(&row["created"][0], "scale_bits");
        assert_eq!(zone.scalar_e0.to_bits(), number(row,"zone_scale_bits") as u32);
        let input = ScalingInput {
            clock_seconds: float(row,"clock_bits"),
            difficulty: float(row,"difficulty_bits"),
            zone_scale: zone.scalar_e0,
            hp_percent: number(row,"hp_percent") as u16,
            damage_percent: number(row,"damage_percent") as u16,
            speed_percent: number(row,"speed_percent") as u16,
            phase: number(row,"phase") as u32,
            endless: row["endless"].as_bool().unwrap(),
            endless_start_seconds: float(row,"endless_start_bits"),
        };
        let mut calls = Vec::new();
        let stats = initial_stats_with_powf(input,&definition,|base, exponent| {
            calls.push((base.to_bits(),exponent.to_bits()));
            float(row,"pow_result_bits")
        });
        for (actual,key) in [(stats.health,"health_bits"),(stats.max_health,"max_health_bits"),
            (stats.damage,"damage_bits"),(stats.movement_speed,"movement_speed_bits"),
            (stats.attack_interval,"attack_interval_bits"),(stats.melee_reach,"melee_reach_bits"),
            (stats.initial_attack_delay,"initial_attack_delay_bits")] {
            native_bits(actual,row,key);
        }
        assert_eq!(calls.len(),2);
        for ((base,exponent),native) in calls.into_iter().zip(row["pow_calls"].as_array().unwrap()) {
            assert_eq!(base,number(native,"base_bits") as u32);
            assert_eq!(exponent,number(native,"exponent_bits") as u32);
        }
        let seed: Vec<u64> = row["seed"].as_array().unwrap().iter().map(|v|v.as_u64().unwrap()).collect();
        let mut rng = NativeRng::from_words(seed.try_into().unwrap());
        let timing = initial_timing(input.clock_seconds,&mut rng);
        native_bits(timing.facing,row,"facing_bits");
        native_bits(timing.next_movement_at,row,"next_movement_at_bits");
        let after: Vec<u64> = row["rng_after"].as_array().unwrap().iter().map(|v|v.as_u64().unwrap()).collect();
        assert_eq!(rng.words.as_slice(),after.as_slice());
        let mut counter = number(row,"counter_before") as u32;
        assert_eq!(creature_guid(definition.id,&mut counter),number(row,"guid"));
        assert_eq!(counter,number(row,"counter_after") as u32);
        let entity = &row["created"][0];
        assert_eq!(number(entity,"entry"),u64::from(definition.id));
        assert_eq!(number(entity,"model_id"),u64::from(definition.model_id));
        assert_eq!(number(entity,"flag_4c"),u64::from(definition.flag_4c));
        native_bits(definition.scale,entity,"scale_bits");
        native_bits(stats.health,entity,"health_bits");
    }
}

#[test]
fn population_gate_counts_dead_rows_without_consuming_capacity() {
    let fixture=fixture();
    for row in fixture["population_cases"].as_array().unwrap() {
        // Original constructor sums each status discriminant XOR 1.
        let live: u64 = row["statuses"].as_array().unwrap().iter().map(|v|v.as_u64().unwrap()^1).sum();
        let limit=population_limit(number(row,"density_percent") as u16);
        assert_eq!(live < limit as u64,row["success"].as_bool().unwrap(),"{row}");
        assert_eq!(number(row,"actor_count_after"),row["statuses"].as_array().unwrap().len() as u64+u64::from(live<limit as u64));
        if live>=limit as u64 {
            assert!(row["pow_calls"].as_array().unwrap().is_empty());
            assert!(row["created"].as_array().unwrap().is_empty());
        }
    }
}

#[test]
fn creature_guid_wraps_and_requested_enemy_index_saturates_to_last_row() {
    let fixture=fixture();
    let zone=&ZONES[0];
    for row in fixture["clamp_guid_cases"].as_array().unwrap() {
        let index=number(row,"requested_enemy_index").min(zone.enemies.len() as u64-1) as usize;
        let definition=&zone.enemies[index];
        let mut counter=number(row,"counter_before") as u32;
        assert_eq!(creature_guid(definition.id,&mut counter),number(row,"guid"));
        assert_eq!(counter,number(row,"counter_after") as u32);
        assert_eq!(number(&row["created"][0],"entry"),u64::from(definition.id));
    }
}
