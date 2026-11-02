//! 0.105.0 native-derived regressions. Compilation/execution remain unverified.
#[allow(dead_code)]
#[path = "../src/hero_name.rs"]
mod hero_name;
#[allow(dead_code)]
#[path = "../src/save.rs"]
mod save;

use std::collections::BTreeMap;

#[test]
fn beaten_zone_repair_matches_selected_native_vectors_and_survives_reparse() {
    let vectors: serde_json::Value = serde_json::from_str(include_str!(
        "../../../docs/analysis/evidence/0.105.0/save-unlocks/native-vectors.json"
    ))
    .unwrap();
    for case in vectors["save_cases"].as_array().unwrap() {
        let loaded = save::Save::parse(case["plaintext"].as_str().unwrap()).unwrap();
        let reopened = save::Save::parse(&loaded.plaintext()).unwrap();
        let expected = case["unlocks"]
            .as_array()
            .unwrap()
            .iter()
            .map(|row| (row[0].as_u64().unwrap() as u8, row[1].as_u64().unwrap()))
            .collect::<BTreeMap<_, _>>();
        for class in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 255] {
            assert_eq!(
                loaded.unlock_value(class),
                expected.get(&class).copied(),
                "{case}"
            );
            assert_eq!(
                reopened.unlock_value(class),
                expected.get(&class).copied(),
                "{case}"
            );
        }
        assert_eq!(reopened.plaintext(), loaded.plaintext(), "{case}");
    }
}

#[test]
fn repair_preserves_beaten_unknown_and_malformed_rows_without_granting_from_them() {
    let text = "beat|1|unknown,,aq,aq\nbeat|256|naxx\nbeat|8|AQ\nunknown|keep\n";
    let loaded = save::Save::parse(text).unwrap();
    assert_eq!(loaded.unlock_value(1), Some(12));
    assert_eq!(loaded.unlock_value(8), None);
    assert_eq!(loaded.plaintext(), format!("{text}open|1|naxx\n"));
}

#[test]
fn sealed_import_restores_each_class_and_keeps_a_higher_explicit_unlock() {
    let text = "open|1|naxx\nbeat|1|elwynn\nbeat|8|aq\nunknown|keep\n";
    let sealed = save::seal_with_nonce(text, [15; 16]);
    let imported = save::Save::import(&sealed).unwrap();
    assert_eq!(imported.unlock_value(1), Some(12));
    assert_eq!(imported.unlock_value(8), Some(12));
    assert!(imported.plaintext().contains("unknown|keep"));
    let exported = save::seal_with_nonce(&imported.plaintext(), [16; 16]);
    let reopened = save::Save::import(&exported).unwrap();
    assert_eq!(reopened.plaintext(), imported.plaintext());
}
