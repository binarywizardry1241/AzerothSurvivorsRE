//! Portable catalog checks against retained selected-EXE bytes; no EXE is needed.
use azeroth_survivors_re::enemies::catalog::{ZoneDefinition, ZONES};
use serde_json::Value;
use std::collections::BTreeSet;

fn evidence() -> Value {
    serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.97.2/enemies/catalog.json"
    ))
    .unwrap()
}

fn bytes(record: &Value) -> Vec<u8> {
    let text = record["hex"].as_str().unwrap();
    (0..text.len())
        .step_by(2)
        .map(|at| u8::from_str_radix(&text[at..at + 2], 16).unwrap())
        .collect()
}

fn word(record: &[u8], offset: usize) -> u32 {
    u32::from_le_bytes(record[offset..offset + 4].try_into().unwrap())
}

#[test]
fn every_definition_preserves_selected_native_bytes() {
    let source = evidence();
    let sizes: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.127.0/creature-sizes/contract.json"
    )).unwrap();
    assert_eq!(source["target_version"], "0.97.2");
    assert_eq!(
        source["target_sha256"],
        "a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589"
    );
    assert_eq!(ZONES.len(), 13);
    assert_eq!(ZONES.iter().map(|zone| zone.enemies.len()).sum::<usize>(), 158);
    let mut ids = BTreeSet::new();
    for native_zone in source["zones"].as_array().unwrap() {
        let zone = ZoneDefinition::by_key(native_zone["key"]["text"].as_str().unwrap()).unwrap();
        assert_eq!(zone.key, native_zone["key"]["text"].as_str().unwrap());
        assert_eq!(zone.name, native_zone["name"]["text"].as_str().unwrap());
        let record = bytes(&native_zone["record"]);
        for (index, coordinate) in zone.center.iter().enumerate() {
            assert_eq!(coordinate.to_bits(), word(&record, 0xc8 + index * 4));
        }
        assert_eq!(zone.radius.to_bits(), word(&record, 0xd8));
        assert_eq!(zone.scalar_e0.to_bits(), word(&record, 0xe0));
        let enemies = native_zone["enemies"].as_array().unwrap();
        assert_eq!(zone.enemies.len(), enemies.len());
        for (enemy, native) in zone.enemies.iter().zip(enemies) {
            let record = bytes(&native["record"]);
            assert_eq!(record.len(), 80);
            assert!(ids.insert(enemy.id));
            assert_eq!(enemy.id, word(&record, 0x20));
            assert_eq!(enemy.model_id, word(&record, 0x24));
            assert_eq!(enemy.name, native["name"]["text"].as_str().unwrap());
            for (index, value) in enemy.raw_cast.iter().enumerate() {
                assert_eq!(*value, word(&record, index * 4));
            }
            assert_eq!(enemy.raw_2c, word(&record, 0x2c));
            assert_eq!(enemy.raw_40, word(&record, 0x40));
            assert_eq!(enemy.flag_4c, record[0x4c]);
            for (offset, value) in [
                (0x28, enemy.scale),
                (0x30, enemy.base_hp),
                (0x34, enemy.base_damage),
                (0x38, enemy.raw_38),
                (0x3c, enemy.raw_3c),
                (0x44, enemy.raw_44),
                (0x48, enemy.raw_48),
            ] {
                let current_scale = sizes["entries"].as_array().unwrap().iter()
                    .find(|row| row["kind"] == "enemies" && row["id"].as_u64() == Some(u64::from(enemy.id)));
                let expected = if offset == 0x28 {
                    current_scale.map(|row| row["scale_bits"].as_u64().unwrap() as u32)
                        .unwrap_or_else(|| word(&record, offset))
                } else { word(&record, offset) };
                assert_eq!(value.to_bits(), expected, "enemy {} +{offset:x}", enemy.id);
            }
        }
    }
}

#[test]
fn naxxramas_four_horsemen_retain_infinite_ordinary_spawn_times() {
    let naxxramas = ZoneDefinition::by_key("naxx").unwrap();
    for id in 1412..=1415 {
        let enemy = naxxramas.enemy_by_id(id).unwrap();
        assert_eq!(enemy.spawn_minute().to_bits(), 0x7f80_0000);
        assert_eq!(enemy.flag_4c, 1);
    }
    assert_eq!(naxxramas.enemies.len(), 16);
    assert_eq!(naxxramas.enemy_by_id(1406).unwrap().spawn_minute(), 4.0);
    assert_eq!(naxxramas.enemy_by_id(1405).unwrap().spawn_minute(), 5.5);
    assert!(naxxramas.enemy_by_id(600).is_none());
    assert!(ZoneDefinition::by_key("Elwynn").is_none());
    assert!(ZoneDefinition::by_key("unknown").is_none());
}

#[test]
fn catalog_exposes_recovered_melee_and_spell_inputs() {
    let elwynn = ZoneDefinition::by_key("elwynn").unwrap();
    let vermin = elwynn.enemy_by_id(600).unwrap();
    assert!(vermin.spell_attack().is_none());
    assert_eq!(vermin.attack_interval().to_bits(), 0x3fcc_cccd);
    assert_eq!(vermin.movement_speed(), 5.0);
    assert_eq!(vermin.spawn_minute(), 0.0);
    assert_eq!(vermin.spawn_cost(), 1.0);
    let geomancer = elwynn.enemy_by_id(603).unwrap();
    let attack = geomancer.spell_attack().unwrap();
    assert_eq!(attack.spell_id, 133);
    assert_eq!(attack.range, 18.0);
    assert_eq!(attack.cast_seconds.to_bits(), 0x3fe6_6666);
    assert_eq!(geomancer.spawn_minute(), 2.0);
    assert_eq!(geomancer.spawn_cost(), 2.0);
}
