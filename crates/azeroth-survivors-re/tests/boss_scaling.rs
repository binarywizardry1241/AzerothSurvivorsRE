//! Historical0.97.2 constructor vectors retain their original input scale.
//! Current0.109.0 data/math are checked separately; these replay old scalar outputs.
use azeroth_survivors_re::bosses::{
    catalog::ZoneDefinition,
    scaling::{creature_guid, initial_ability_timers, initial_stats_with_powf, BossScalingInput},
};
use serde_json::Value;
fn n(r: &Value, k: &str) -> u64 {
    r[k].as_u64().unwrap()
}
fn f(r: &Value, k: &str) -> f32 {
    f32::from_bits(n(r, k) as u32)
}
#[test]
fn historical_native_boss_constructor_stats_and_cooldowns() {
    let fixture: Value =
        serde_json::from_str(include_str!("fixtures/boss-scaling-native.json")).unwrap();
    assert_eq!(
        fixture["target_sha256"],
        "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
    );
    let catalog: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.97.2/bosses/catalog.json"
    )).unwrap();
    let cases = fixture["creation_cases"].as_array().unwrap();
    assert_eq!(cases.len(), 480);
    for row in cases {
        let key = catalog["zones"][n(row, "zone_index") as usize]["key"].as_str().unwrap();
        let zone = ZoneDefinition::by_key(key).unwrap();
        // The current catalog deliberately has newer Naxx sizes. Replaying old
        // constructor vectors requires their declared old scale input.
        let mut historical_definition = zone.bosses[n(row, "boss_index") as usize];
        historical_definition.scale = f(row, "scale_bits");
        let definition = &historical_definition;
        let input = BossScalingInput {
            clock_seconds: f(row, "clock_bits"),
            difficulty: f(row, "difficulty_bits"),
            zone_scale: zone.scalar_e0,
            hp_percent: n(row, "hp_percent") as u16,
            damage_percent: n(row, "damage_percent") as u16,
            speed_percent: n(row, "speed_percent") as u16,
            phase: n(row, "phase") as u32,
            endless: row["endless"].as_bool().unwrap(),
            endless_start_seconds: f(row, "endless_start_bits"),
        };
        let native = row["pow_calls"].as_array().unwrap();
        let mut index = 0;
        let stats = initial_stats_with_powf(input, definition, |base, exponent| {
            // Historical callers requested factors in a different order and
            // outside Endless. Reuse their factor by base, while the current
            // function preserves the0.109.0 gate and damage/HP order.
            let call = native.iter().find(|call| n(call, "base_bits") as u32 == base.to_bits()).unwrap();
            index += 1;
            assert_eq!(base.to_bits(), n(call, "base_bits") as u32);
            assert_eq!(exponent.to_bits(), n(call, "exponent_bits") as u32);
            f(call, "result_bits")
        });
        assert_eq!(index, if input.phase == 1 && input.endless { 2 } else { 0 });
        for (value, key) in [
            (stats.health, "health_bits"),
            (stats.max_health, "max_health_bits"),
            (stats.damage, "damage_bits"),
            (stats.movement_speed, "movement_speed_bits"),
            (stats.scale, "scale_bits"),
            (stats.melee_reach, "melee_reach_bits"),
            (stats.attack_interval, "attack_interval_bits"),
            (stats.initial_attack_delay, "initial_attack_delay_bits"),
            (stats.next_movement_at, "next_movement_at_bits"),
            (stats.stun_until, "stun_until_bits"),
            (stats.raw_148_clock, "raw_148_clock_bits"),
            (stats.movement_angle, "movement_angle_bits"),
        ] {
            assert_eq!(value.to_bits(), n(row, key) as u32, "{key}: {row}");
        }
        let timers: Vec<u32> = initial_ability_timers(definition)
            .into_iter()
            .map(f32::to_bits)
            .collect();
        let expected: Vec<u32> = row["ability_timers_bits"]
            .as_array()
            .unwrap()
            .iter()
            .map(|v| v.as_u64().unwrap() as u32)
            .collect();
        let original = &catalog["zones"][n(row, "zone_index") as usize]
            ["bosses"][n(row, "boss_index") as usize]["abilities"];
        let current: Vec<_> = timers.iter().zip(definition.abilities)
            .filter(|(_, ability)| !matches!(ability.words[0], 1 | 2))
            .map(|(timer, _)| *timer).collect();
        let historical: Vec<_> = expected.iter().zip(original.as_array().unwrap())
            .filter(|(_, ability)| !matches!(ability["words"][0].as_u64().unwrap(), 1 | 2))
            .map(|(timer, _)| *timer).collect();
        assert_eq!(current, historical);
        let mut counter = n(row, "counter_before") as u32;
        assert_eq!(creature_guid(definition.id, &mut counter), n(row, "guid"));
        assert_eq!(counter, n(row, "counter_after") as u32);
        let entity = &row["created"][0];
        assert_eq!(n(entity, "entry"), u64::from(definition.id));
        assert_eq!(n(entity, "model_id"), u64::from(definition.model_id));
        assert_eq!(n(entity, "flag"), 1);
        assert_eq!(n(row, "flag_158"), 1);
        assert_eq!(n(entity, "health_bits"), u64::from(stats.health.to_bits()));
    }
}
