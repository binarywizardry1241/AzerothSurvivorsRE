//! Current native condition1454cb900 and selector1454d02b0.
//! The event's first-hit and first-critical flags are cast tokens consumed by
//! the hit owner; ordinary critical status is a separate byte.

use super::EffectRow;
use crate::player_abilities::AbilityDefinition;

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct Event {
    pub spell_id: u32,
    pub school: u8,
    pub kind: u8,
    pub source_kind: u8,
    pub critical: bool,
    pub first_hit: bool,
    pub first_critical: bool,
    pub first_periodic: bool,
}

impl EffectRow {
    /// Selectors retain their native key/list ownership. Definition lookup is
    /// the caller's current class/learned catalog lookup by primary OR alternate
    /// spell ID. School/melee/source selectors do not require a definition.
    pub fn matches_event(
        &self,
        selector_offset: usize,
        event: &Event,
        definition: Option<&AbilityDefinition>,
    ) -> bool {
        match self.bytes[selector_offset] {
            0 => true,
            3 => event.source_kind != 2 && event.school == self.bytes[selector_offset + 1],
            5 => event.spell_id == 0 && event.source_kind == 0,
            6 => event.source_kind == 2,
            tag => {
                if event.source_kind == 2 || event.spell_id == 0 {
                    return false;
                }
                let Some(definition) = definition else {
                    return false;
                };
                match tag {
                    1 => self.key(selector_offset + 8) == Some(definition.key),
                    2 => self
                        .lists
                        .iter()
                        .find(|list| list.offset == selector_offset + 8)
                        .is_some_and(|list| list.values.iter().any(|key| key == definition.key)),
                    4 => definition.kind == self.bytes[selector_offset + 1],
                    _ => false,
                }
            }
        }
    }

    /// Native conditions8..11 return directly, without reading the embedded
    /// selector. The low-health threshold is strictly greater than current HP.
    pub fn condition_matches(
        &self,
        condition_offset: usize,
        event: &Event,
        definition: Option<&AbilityDefinition>,
        health: f32,
        maximum_health: f32,
    ) -> bool {
        let admitted = match self.word(condition_offset) {
            0 => event.kind == 0 || event.first_periodic,
            1 => (event.kind == 0 || event.first_periodic) && event.first_hit,
            2 => event.kind == 0 && event.critical,
            3 => event.kind == 0 && event.first_critical,
            4 => event.kind == 1,
            5 => event.kind < 2,
            6 => event.kind == 2,
            7 => event.kind == 3,
            8 => return event.kind == 4,
            9 => {
                return event.kind == 5
                    && self.float(condition_offset + 4) * maximum_health > health;
            }
            10 => return event.kind == 6,
            11 => return event.kind == 7,
            _ => return false,
        };
        admitted && self.matches_event(condition_offset + 8, event, definition)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    fn fixture() -> Value {
        serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.100.1/treasure-interface/effect-condition-native.json"
        )).unwrap()
    }

    fn condition_row(condition: u32) -> EffectRow {
        let mut row = EffectRow {
            bytes: [0; 64],
            strings: &[],
            lists: &[],
        };
        row.bytes[16..20].copy_from_slice(&condition.to_le_bytes());
        row.bytes[20..24].copy_from_slice(&0.5_f32.to_le_bytes());
        row
    }

    #[test]
    fn all_native_condition_and_flag_vectors_match() {
        let fixture = fixture();
        assert_eq!(fixture["target_sha256"], super::super::TARGET_SHA256);
        assert_eq!(fixture["instruction_cases"], 1539);
        for case in fixture["cases"].as_array().unwrap() {
            let row = condition_row(case["condition"].as_u64().unwrap() as u32);
            let expected = case["true_flag_patterns"].as_u64().unwrap();
            for flags in 0..16 {
                let event = Event {
                    kind: case["event_kind"].as_u64().unwrap() as u8,
                    critical: flags & 1 != 0,
                    first_hit: flags & 2 != 0,
                    first_critical: flags & 4 != 0,
                    first_periodic: flags & 8 != 0,
                    ..Default::default()
                };
                assert_eq!(
                    row.condition_matches(16, &event, None, 40.0, 100.0),
                    expected & (1 << flags) != 0,
                    "condition/event/flags {case}/{flags}"
                );
            }
        }
        let row = condition_row(9);
        for case in fixture["strict_health_thresholds"].as_array().unwrap() {
            assert_eq!(
                row.condition_matches(
                    16,
                    &Event {
                        kind: 5,
                        ..Default::default()
                    },
                    None,
                    case["health"].as_f64().unwrap() as f32,
                    100.0
                ),
                case["result"].as_bool().unwrap()
            );
        }
    }

    #[test]
    fn event_selector_special_cases_do_not_require_spell_lookup() {
        let mut row = condition_row(0);
        row.bytes[24] = 3;
        row.bytes[25] = 1;
        let mut event = Event {
            school: 1,
            ..Default::default()
        };
        assert!(row.matches_event(24, &event, None));
        event.source_kind = 2;
        assert!(!row.matches_event(24, &event, None));
        row.bytes[24] = 6;
        assert!(row.matches_event(24, &event, None));
        row.bytes[24] = 5;
        event.source_kind = 0;
        assert!(row.matches_event(24, &event, None));
        event.spell_id = 585;
        assert!(!row.matches_event(24, &event, None));
        // Direct event conditions ignore even an invalid selector payload.
        row.bytes[16..20].copy_from_slice(&8_u32.to_le_bytes());
        row.bytes[24] = 255;
        event.kind = 4;
        assert!(row.condition_matches(16, &event, None, 100.0, 100.0));
    }

    #[test]
    fn critical_cast_condition_requires_first_critical_token_not_first_hit() {
        let class = super::super::catalog()
            .classes
            .iter()
            .find(|class| class.id == 5)
            .unwrap();
        let talent = class
            .talents
            .iter()
            .find(|talent| talent.key == "chastise")
            .unwrap();
        let row = EffectRow::talent(&talent.effects[1], 1);
        let smite = AbilityDefinition::by_key("smite").unwrap();
        let nova = AbilityDefinition::by_key("holy_nova").unwrap();
        let mut event = Event {
            spell_id: smite.spell_id,
            school: smite.school,
            critical: true,
            first_hit: false,
            first_critical: true,
            ..Default::default()
        };
        assert!(row.condition_matches(32, &event, Some(smite), 100.0, 100.0));
        assert!(!row.condition_matches(32, &event, Some(nova), 100.0, 100.0));
        event.first_critical = false;
        event.first_hit = true;
        assert!(!row.condition_matches(32, &event, Some(smite), 100.0, 100.0));
    }
}
