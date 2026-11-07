//! Current unmodified native packet fixtures; compiled/runtime checks remain separate.
use azeroth_survivors_re::bosses::{catalog::ZONES, spawning::arrival_sounds};
use serde_json::Value;

#[test]
fn current_boss_arrivals_keep_the_native_alert_voice_order_and_zero_gate() {
    let fixture: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/boss-voices/native-vectors.json"
    ))
    .unwrap();
    let mut bosses = 0;
    let mut voiced = 0;
    for case in fixture["native_cases"].as_array().unwrap() {
        if case["vector_initial_count"].as_u64() != Some(0) {
            continue;
        }
        let key = case["zone"].as_str().unwrap();
        let definition = if key == "boundary" {
            let mut definition = ZONES[0].bosses[0];
            definition.raw_50 = case["voice_id"].as_u64().unwrap() as u32;
            definition
        } else {
            let zone = ZONES.iter().find(|zone| zone.key == key).unwrap();
            let definition = zone.bosses[case["index"].as_u64().unwrap() as usize];
            assert_eq!(u64::from(definition.id), case["boss_id"].as_u64().unwrap());
            assert_eq!(definition.name, case["name"].as_str().unwrap());
            assert_eq!(
                u64::from(definition.raw_50),
                case["voice_id"].as_u64().unwrap()
            );
            bosses += 1;
            voiced += usize::from(definition.raw_50 != 0);
            definition
        };
        let expected: Vec<_> = case["packets"]
            .as_array()
            .unwrap()
            .iter()
            .map(|packet| packet["sound_id"].as_u64().unwrap() as u32)
            .collect();
        assert_eq!(arrival_sounds(&definition).collect::<Vec<_>>(), expected);
    }
    assert_eq!((bosses, voiced), (60, 22));
}
