//! Current native Save/spec fixtures; source assertions remain unrun without compilation.
#[allow(dead_code)]
#[path = "../src/hero_name.rs"]
mod hero_name;
#[allow(dead_code)]
#[path = "../src/save.rs"]
mod save;

use save::Save;
use serde_json::Value;

fn allocation(value: &Value) -> Vec<(String, u8)> {
    value
        .as_array()
        .unwrap()
        .iter()
        .map(|row| {
            (
                row[0].as_str().unwrap().to_owned(),
                row[1].as_u64().unwrap() as u8,
            )
        })
        .collect()
}

#[test]
fn current_native_allocations_reach_load_import_every_spec_and_switch() {
    let fixtures: Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.112.0/talent-allocations/native-save-cases.json"
    ))
    .unwrap();
    for case in fixtures["cases"].as_array().unwrap() {
        let label = case["label"].as_str().unwrap();
        let class = case["class_id"].as_u64().unwrap() as u8;
        let input = case["input"].as_str().unwrap();
        let mut loaded = Save::parse(input).unwrap();
        let imported = Save::import(&save::seal_with_nonce(input, [112; 16])).unwrap();
        assert_eq!(
            loaded.plaintext(),
            case["output"].as_str().unwrap(),
            "{label}"
        );
        assert_eq!(loaded.plaintext(), imported.plaintext(), "{label}");
        assert_eq!(
            loaded.talent_allocation(class),
            allocation(&case["live"]),
            "{label}"
        );
        for slot in 0..3 {
            assert_eq!(
                loaded.talent_spec_allocation(class, slot),
                allocation(&case["specs"][usize::from(slot)]),
                "{label}, slot {slot}"
            );
        }
        assert!(
            loaded
                .select_talent_spec(class, case["switched_slot"].as_u64().unwrap() as u8)
                .unwrap()
        );
        assert_eq!(
            loaded.plaintext(),
            case["switched_output"].as_str().unwrap(),
            "{label}"
        );
        let reopened = Save::parse(&loaded.plaintext()).unwrap();
        assert_eq!(reopened.plaintext(), loaded.plaintext(), "{label}");
    }
}
