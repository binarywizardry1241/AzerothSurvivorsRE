//! Current 0.113.2 zone-key/definition lookup: native145808880/1458089b0.
//! The native resolver returns row0 for unknown text. This applies to runtime
//! lookup; callers do not rewrite the original saved key.
use crate::guardians::catalog::{ZONES, ZoneDefinition};

pub mod scholomance;

pub const COUNT: usize = ZONES.len();

pub fn index(key: &str) -> Option<usize> {
    ZONES.iter().position(|zone| zone.key == key)
}

pub fn resolve(key: &str) -> &'static ZoneDefinition {
    &ZONES[index(key).unwrap_or(0)]
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
            let previous = case["index"].as_u64().unwrap() as usize;
            let expected = previous + usize::from(previous >= scholomance::INDEX);
            assert_eq!(
                resolve(case["text"].as_str().unwrap()).key,
                ZONES[expected].key
            );
        }
    }
}
