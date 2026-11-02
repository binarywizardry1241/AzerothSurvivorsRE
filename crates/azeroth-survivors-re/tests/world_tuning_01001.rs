//! Historical 0.100.1 HP-factor evidence; selected boss data lives in boss_catalog.
use azeroth_survivors_re::enemies::scaling;
use serde_json::Value;

#[test]
fn current_zone_health_factor_matches_native_instructions() {
    let fixture: Value = serde_json::from_str(include_str!(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/../../docs/analysis/evidence/0.100.1/world-tuning.json"
    )))
    .unwrap();
    assert_eq!(
        fixture["target_sha256"],
        "17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b"
    );
    for zone in fixture["zones"].as_array().unwrap() {
        assert_eq!(
            scaling::late_run_health_bonus(zone["key"].as_str().unwrap()).to_bits(),
            zone["bonus_bits"].as_u64().unwrap() as u32
        );
    }
    let cases = fixture["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 108);
    for row in cases {
        let clock = f32::from_bits(row["clock_bits"].as_u64().unwrap() as u32);
        let actual = scaling::late_run_health_multiplier(clock, row["zone"].as_str().unwrap());
        assert_eq!(
            actual.to_bits(),
            row["result_bits"].as_u64().unwrap() as u32,
            "{row}"
        );
    }
}

// Primary-boss dimensions now use the selected 0.105.0 evidence in boss_catalog.rs.
