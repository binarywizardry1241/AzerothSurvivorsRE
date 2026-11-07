//! Selected 0.120.0 player descriptor: 145b7ba7d..145b7bbde, 145b7befb..145b7bf14.
//! Only the first permanent Cat/Dire Bear effect overrides the current display.
//! Shadowform remains an aura; the native body display stays unchanged.

use super::EffectRow;

pub fn display_override(effects: &[EffectRow], race: u8) -> Option<u32> {
    let horde = matches!(race, 2 | 5 | 6 | 8);
    effects.iter().find_map(|row| {
        if row.tag() != 25 {
            return None;
        }
        match row.word(4) {
            9634 => Some(if horde { 2289 } else { 2281 }),
            768 => Some(if horde { 8571 } else { 892 }),
            _ => None,
        }
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn selected_native_form_vectors_preserve_first_match_and_race() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/faction-forms/vectors.json"
        ))
        .unwrap();
        let template = super::super::catalog().classes.iter()
            .flat_map(|class| &class.talents)
            .flat_map(|talent| &talent.effects)
            .map(|payload| EffectRow::talent(payload, 1))
            .find(|row| row.tag() == 25).unwrap();
        for case in fixture["cases"].as_array().unwrap() {
            let rows = case["rows"].as_array().unwrap().iter().map(|entry| {
                let mut row = template.clone();
                row.bytes[0] = entry[0].as_u64().unwrap() as u8;
                row.bytes[4..8].copy_from_slice(&(entry[1].as_u64().unwrap() as u32).to_le_bytes());
                row
            }).collect::<Vec<_>>();
            for race in u8::MIN..=u8::MAX {
                let family = if fixture["horde_races"].as_array().unwrap().iter()
                    .any(|value| value.as_u64() == Some(u64::from(race))) {
                    "horde_display"
                } else {
                    "other_display"
                };
                assert_eq!(display_override(&rows, race),
                    case[family].as_u64().map(|value| value as u32),
                    "race={race}, {case}");
            }
        }
    }
}
