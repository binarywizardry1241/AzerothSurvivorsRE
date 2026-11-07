//! Meter persistence: retained0.105.0 fields, current0.121.0 fourth mode.

use azeroth_survivors_re::run_meter::MeterMode;
use bevy::prelude::Vec2;

#[derive(Clone, Debug, PartialEq)]
pub(super) struct Settings {
    pub open: bool,
    pub position: Option<Vec2>,
    pub size: Vec2,
    pub mode: MeterMode,
}

impl Default for Settings {
    fn default() -> Self {
        Self {
            open: false,
            position: None,
            size: Vec2::new(250., 170.),
            mode: MeterMode::Damage,
        }
    }
}

pub(super) fn bounded_size(size: Vec2) -> Vec2 {
    // Native MAXPS/MINPS choose the second operand for NaN.
    Vec2::new(size.x.max(170.).min(640.), size.y.max(64.).min(640.))
}

impl Settings {
    pub fn parse(text: &str) -> Self {
        let values = text
            .split_whitespace()
            .filter_map(|word| word.parse::<f32>().ok())
            .collect::<Vec<_>>();
        if values.len() < 5 {
            return Self::default();
        }
        let position = Vec2::new(values[1], values[2]);
        let mode = match values.get(5).copied().unwrap_or(0.) as usize {
            1 => MeterMode::Healing,
            2 => MeterMode::Boss,
            3 => MeterMode::Party,
            _ => MeterMode::Damage,
        };
        // Native MINSS uses the second operand for unordered comparisons.
        let min = if position.x < position.y {
            position.x
        } else {
            position.y
        };
        Self {
            open: values[0] != 0.,
            position: (min >= 0.).then_some(position),
            size: bounded_size(Vec2::new(values[3], values[4])),
            mode,
        }
    }

    pub fn text(&self) -> String {
        let position = self.position.unwrap_or(Vec2::splat(-1.));
        let mode = match self.mode {
            MeterMode::Damage => 0,
            MeterMode::Healing => 1,
            MeterMode::Boss => 2,
            MeterMode::Party => 3,
        };
        format!(
            "{} {} {} {} {} {}",
            u8::from(self.open),
            position.x,
            position.y,
            self.size.x,
            self.size.y,
            mode
        )
    }

    pub fn load() -> Self {
        crate::save::native_base_directory()
            .and_then(|base| std::fs::read_to_string(base.join("meter.txt")).ok())
            .map_or_else(Self::default, |text| Self::parse(&text))
    }

    pub fn save(&self) {
        let Some(base) = crate::save::native_base_directory() else {
            return;
        };
        // The native auxiliary-file writer creates parents and writes directly.
        let _ = std::fs::create_dir_all(&base);
        let _ = std::fs::write(base.join("meter.txt"), self.text());
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_legacy_and_mode_records() {
        assert_eq!(Settings::parse(""), Settings::default());
        assert_eq!(Settings::parse("1 2 3 4"), Settings::default());
        let old = Settings::parse("1 -1 -1 250 170");
        assert!(old.open);
        assert_eq!(old.position, None);
        assert_eq!(old.mode, MeterMode::Damage);
        let loaded = Settings::parse("1 8 12 1 900 2");
        assert_eq!(loaded.position, Some(Vec2::new(8., 12.)));
        assert_eq!(loaded.size, Vec2::new(170., 640.));
        assert_eq!(loaded.mode, MeterMode::Boss);
        assert_eq!(Settings::parse(&loaded.text()), loaded);
        assert_eq!(
            Settings::parse("0 8 12 250 170 1.9").mode,
            MeterMode::Healing
        );
        assert_eq!(Settings::parse("0 8 12 250 170 3").mode, MeterMode::Party);
        assert_eq!(Settings::parse("0 8 12 250 170 3.9").mode, MeterMode::Party);
        assert_eq!(Settings::parse("0 8 12 250 170 4").mode, MeterMode::Damage);
        let party = Settings::parse("1 8 12 250 170 3");
        assert_eq!(Settings::parse(&party.text()), party);
    }

    #[test]
    fn selected_target_settings_vectors() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/run-meters/screen/settings-native-vectors.json"
        )).unwrap();
        for case in fixture["settings_cases"].as_array().unwrap() {
            let input = case["input_bits"]
                .as_array()
                .unwrap()
                .iter()
                .map(|bits| {
                    let bits =
                        u32::from_str_radix(bits.as_str().unwrap().trim_start_matches("0x"), 16)
                            .unwrap();
                    f32::from_bits(bits).to_string()
                })
                .collect::<Vec<_>>()
                .join(" ");
            // Keep0.105.0's common field assertions. Only mode3's expected
            // result changes under the0.121.0 four-mode admission.
            let current_party = case["input_bits"].get(5).and_then(|bits| bits.as_str())
                .and_then(|bits| u32::from_str_radix(bits.trim_start_matches("0x"), 16).ok())
                .is_some_and(|bits| f32::from_bits(bits) as usize == 3);
            let settings = Settings::parse(&input);
            assert_eq!(settings.open, case["open"].as_bool().unwrap(), "{input}");
            assert_eq!(
                settings.position.is_some(),
                case["position_present"].as_bool().unwrap(),
                "{input}"
            );
            let expected = case["size_bits"]
                .as_array()
                .unwrap()
                .iter()
                .map(|value| {
                    u32::from_str_radix(value.as_str().unwrap().trim_start_matches("0x"), 16)
                        .unwrap()
                })
                .collect::<Vec<_>>();
            assert_eq!(
                vec![settings.size.x.to_bits(), settings.size.y.to_bits()],
                expected,
                "{input}"
            );
            assert_eq!(
                settings.mode,
                if current_party { MeterMode::Party } else {
                    match case["mode"].as_u64().unwrap() {
                        1 => MeterMode::Healing,
                        2 => MeterMode::Boss,
                        _ => MeterMode::Damage,
                    }
                },
                "{input}"
            );
        }
        for case in fixture["resize_cases"].as_array().unwrap() {
            let point = |key: &str| {
                Vec2::new(
                    case[key][0].as_f64().unwrap() as f32,
                    case[key][1].as_f64().unwrap() as f32,
                )
            };
            assert_eq!(
                bounded_size(
                    point("size") + point("delta") / case["scale"].as_f64().unwrap() as f32
                ),
                point("native_size")
            );
        }
    }

    #[test]
    fn current_four_mode_native_vectors() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/party-meter-ui.json"
        )).unwrap();
        for case in fixture["fixture"]["settings_cases"].as_array().unwrap() {
            let bits = u32::from_str_radix(case[0].as_str().unwrap().trim_start_matches("0x"), 16).unwrap();
            let input = format!("1 8 12 250 170 {}", f32::from_bits(bits));
            let mode = match case[1].as_u64().unwrap() {
                1 => MeterMode::Healing,
                2 => MeterMode::Boss,
                3 => MeterMode::Party,
                _ => MeterMode::Damage,
            };
            assert_eq!(Settings::parse(&input).mode, mode, "{input}");
        }
    }
}
