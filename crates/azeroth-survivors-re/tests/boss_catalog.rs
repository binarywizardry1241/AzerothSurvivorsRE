//! Selected 0.105.0 record proof for the single canonical boss catalog.
use azeroth_survivors_re::bosses::catalog::{spawn_points, ZoneDefinition, ZONES};
use serde_json::Value;

fn fixture() -> Value {
    serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.105.0/boss-catalog/catalog.json"
    ))
    .unwrap()
}
fn raw(record: &Value) -> Vec<u8> {
    let text = record["hex"].as_str().unwrap();
    (0..text.len())
        .step_by(2)
        .map(|i| u8::from_str_radix(&text[i..i + 2], 16).unwrap())
        .collect()
}
fn word(raw: &[u8], offset: usize) -> u32 {
    u32::from_le_bytes(raw[offset..offset + 4].try_into().unwrap())
}

#[test]
fn selected_boss_records_match_native_bytes() {
    let fixture = fixture();
    let sizes: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.127.0/creature-sizes/contract.json"
    )).unwrap();
    let zones = fixture["zones"].as_array().unwrap();
    assert_eq!(
        fixture["target_sha256"],
        "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
    );
    assert_eq!(zones.len(), 12);
    let mut count = 0;
    let mut abilities = 0;
    for native in zones {
        let zone = ZoneDefinition::by_key(native["key"].as_str().unwrap()).unwrap();
        assert_eq!(zone.bosses.len(), 5);
        for (boss, row) in zone.bosses.iter().zip(native["bosses"].as_array().unwrap()) {
            count += 1;
            let bytes = raw(&row["record"]);
            assert_eq!(bytes.len(), 88);
            assert_eq!(boss.name, row["name"]["text"].as_str().unwrap());
            assert_eq!(boss.yell, row["yell"]["text"].as_str().unwrap());
            for (v, offset) in [
                (boss.id, 0x30),
                (boss.model_id, 0x34),
                (boss.raw_3c, 0x3c),
                (boss.raw_50, 0x50),
            ] {
                assert_eq!(v, word(&bytes, offset));
            }
            for (v, offset) in [
                (boss.scale, 0x38),
                (boss.time_minutes, 0x40),
                (boss.base_hp, 0x44),
                (boss.base_damage, 0x48),
                (boss.raw_4c, 0x4c),
            ] {
                let current_scale = sizes["entries"].as_array().unwrap().iter()
                    .find(|row| row["kind"] == "bosses" && row["id"].as_u64() == Some(u64::from(boss.id)));
                let expected = if offset == 0x38 {
                    current_scale.map(|row| row["scale_bits"].as_u64().unwrap() as u32)
                        .unwrap_or_else(|| word(&bytes, offset))
                } else { word(&bytes, offset) };
                assert_eq!(v.to_bits(), expected);
            }
            assert_eq!(boss.flag_54, bytes[0x54]);
            let native_abilities = row["abilities"].as_array().unwrap();
            // Current volleys and summons have independent 0.108.0 oracles.
            // Match the retained historical subset after filtering both sides;
            // removing Gordok's obsolete volley must not shift other records.
            abilities += boss.abilities.len();
            let current: Vec<_> = boss.abilities.iter()
                .filter(|ability| !matches!(ability.words[0], 1 | 2)).collect();
            let historical: Vec<_> = native_abilities.iter()
                .filter(|ability| !matches!(word(&raw(&ability["record"]), 0), 1 | 2)).collect();
            assert_eq!(current.len(), historical.len());
            for (ability, native) in current.into_iter().zip(historical) {
                let bytes = raw(&native["record"]);
                for (index, value) in ability.words.iter().enumerate() {
                    assert_eq!(*value, word(&bytes, index * 4));
                }
            }
        }
        let points = spawn_points(zone.key);
        let originals = native["spawn_points"].as_array().unwrap();
        assert_eq!(points.len(), originals.len());
        for (point, native) in points.iter().zip(originals) {
            let bytes = raw(&native["record"]);
            for i in 0..2 {
                assert_eq!(point[i].to_bits(), word(&bytes, i * 4));
            }
        }
    }
    assert_eq!(count, 60);
    assert_eq!(abilities, 190); // Removed obsolete King Gordok volley.
}

#[test]
fn current_native_reach_cases_match_the_source_constructor() {
    use azeroth_survivors_re::bosses::scaling::{initial_stats_with_powf, BossScalingInput};
    let fixture: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.105.0/boss-catalog/reach-native.json"
    ))
    .unwrap();
    assert_eq!(
        fixture["target_sha256"],
        "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7"
    );
    let cases = fixture["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 69);
    let input = BossScalingInput {
        clock_seconds: 0.0,
        difficulty: 1.0,
        zone_scale: 1.0,
        hp_percent: 100,
        damage_percent: 100,
        speed_percent: 100,
        phase: 1,
        endless: false,
        endless_start_seconds: 0.0,
    };
    for row in cases {
        let mut definition = if let Some(id) = row["boss_id"].as_u64() {
            *ZONES
                .iter()
                .flat_map(|zone| zone.bosses)
                .find(|boss| u64::from(boss.id) == id)
                .unwrap()
        } else {
            ZONES[0].bosses[0]
        };
        definition.scale = f32::from_bits(row["scale_bits"].as_u64().unwrap() as u32);
        let stats = initial_stats_with_powf(input, &definition, |_, _| 1.0);
        assert_eq!(
            stats.melee_reach.to_bits(),
            row["melee_reach_bits"].as_u64().unwrap() as u32,
            "{row}"
        );
    }
}

#[test]
fn current_named_dimensions_feed_boss_and_enemy_reach() {
    use azeroth_survivors_re::{bosses::scaling as boss, enemies::{catalog as enemy, scaling}};
    let current: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.127.0/creature-sizes/reach-native.json"
    )).unwrap();
    assert_eq!(current["target_sha256"],
        "3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb");
    let boss_input = boss::BossScalingInput {
        clock_seconds: 0., difficulty: 1., zone_scale: 1., hp_percent: 100,
        damage_percent: 100, speed_percent: 100, phase: 1, endless: false,
        endless_start_seconds: 0.,
    };
    let enemy_input = scaling::ScalingInput {
        clock_seconds: 0., difficulty: 1., zone_scale: 1., hp_percent: 100,
        damage_percent: 100, speed_percent: 100, phase: 1, endless: false,
        endless_start_seconds: 0.,
    };
    let mut checked = 0;
    for row in current["cases"].as_array().unwrap() {
        let scale = row["scale_bits"].as_u64().unwrap() as u32;
        let id = row["id"].as_u64();
        let actual = match row["kind"].as_str().unwrap() {
            "bosses" => {
                let mut definition = *ZONES.iter().flat_map(|zone| zone.bosses)
                    .find(|value| Some(u64::from(value.id)) == id).unwrap_or(&ZONES[0].bosses[0]);
                if id.is_some() { assert_eq!(definition.scale.to_bits(), scale); }
                definition.scale = f32::from_bits(scale);
                boss::initial_stats_with_powf(boss_input, &definition, |_, _| 1.).melee_reach
            }
            "enemies" => {
                let mut definition = *enemy::ZONES.iter().flat_map(|zone| zone.enemies)
                    .find(|value| Some(u64::from(value.id)) == id).unwrap_or(&enemy::ZONES[0].enemies[0]);
                if id.is_some() { assert_eq!(definition.scale.to_bits(), scale); }
                definition.scale = f32::from_bits(scale);
                scaling::initial_stats_with_powf(enemy_input, &definition, |_, _| 1.).melee_reach
            }
            "guardians" => continue,
            _ => panic!("unknown native constructor kind"),
        };
        assert_eq!(actual.to_bits(), row["melee_reach_bits"].as_u64().unwrap() as u32, "{row}");
        checked += 1;
    }
    assert_eq!(checked, 35);
}
