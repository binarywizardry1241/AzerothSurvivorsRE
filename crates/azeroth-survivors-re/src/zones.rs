//! Current 0.113.2 zone-key/definition lookup: native145808880/1458089b0.
//! The native resolver returns row0 for unknown text. This applies to runtime
//! lookup; callers do not rewrite the original saved key.
use crate::guardians::catalog::{ZONES, ZoneDefinition};

pub fn resolve(key: &str) -> &'static ZoneDefinition {
    ZoneDefinition::by_key(key).unwrap_or(&ZONES[0])
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_keys_and_unknown_text_select_the_recovered_definition() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.113.2/zone-key-guardian-damage.json"
        ))
        .unwrap();
        for case in proof["source_key_cases"].as_array().unwrap() {
            let expected = case["index"].as_u64().unwrap() as usize;
            assert_eq!(
                resolve(case["text"].as_str().unwrap()).key,
                ZONES[expected].key
            );
        }
    }
}
