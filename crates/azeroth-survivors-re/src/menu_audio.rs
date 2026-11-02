//! Menu audio parameter policy. EXE observations and limits are retained in
//! docs/analysis/menu-audio-0.109.0.md; the device/backend lives in `sound`.

#[path = "../../benilla-app/src/sound/gain.rs"]
pub(crate) mod gain;

pub const THEME: &str = "Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3";
pub const THEME_VOLUME: f32 = 0.8;

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Settings {
    pub enabled: bool,
    pub master: f32,
    pub music_enabled: bool,
    pub music: f32,
    pub background: bool,
    pub limiter: bool,
}

impl Settings {
    pub fn read<'a>(mut get: impl FnMut(&str) -> Option<&'a str>) -> Self {
        let mut num = |name, default| {
            get(name)
                // Native on_cvar parses an accepted event as f32, or zero.
                // Startup rejects invalid registered numerics before this read.
                .map(|value| value.trim().parse::<f32>().unwrap_or(0.0))
                .unwrap_or(default)
        };
        Self {
            enabled: num("MasterSoundEffects", 1.0) != 0.0,
            master: num("MasterVolume", 1.0).clamp(0.0, 1.0),
            music_enabled: num("EnableMusic", 1.0) != 0.0,
            music: num("MusicVolume", 0.4).clamp(0.0, 1.0),
            background: num("Sound_EnableSoundWhenGameIsInBG", 0.0) != 0.0,
            limiter: num("SoundOutputLimiter", 1.0) != 0.0,
        }
    }

    pub fn theme_amp(self) -> f32 {
        if self.enabled && self.music_enabled {
            self.music * THEME_VOLUME
        } else {
            0.0
        }
    }

    pub fn master_amp(self) -> f32 {
        if self.enabled {
            self.master
        } else {
            0.0
        }
    }

    pub fn output_open(self, focused: Option<bool>) -> bool {
        self.background || focused.unwrap_or(true)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn shared_mixer_gain_matches_closed_native_controller_outputs() {
        let evidence: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.109.0/menu-audio/native-vectors.json"
        ))
        .unwrap();
        assert_eq!(THEME, evidence["theme"].as_str().unwrap());
        for case in evidence["native_fragment"]["cases"].as_array().unwrap() {
            let from_bits = |key: &str| {
                f32::from_bits(u32::from_str_radix(case[key].as_str().unwrap(), 16).unwrap())
            };
            let settings = Settings {
                enabled: case["enabled"].as_bool().unwrap(),
                music_enabled: case["music_enabled"].as_bool().unwrap(),
                music: from_bits("music_bits"),
                ..Settings::read(|_| None)
            };
            let got = gain::amp_to_db(settings.theme_amp()).0;
            let expected = from_bits("native_db_bits");
            assert!(
                (got.is_nan() && expected.is_nan()) || (got - expected).abs() <= 0.00001,
                "{}: {got} != {expected}",
                case["name"]
            );
        }
    }

    #[test]
    fn consumed_cvars_match_native_callback_field_bytes() {
        let evidence: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.109.0/menu-audio/native-vectors.json"
        ))
        .unwrap();
        let mut checked = 0;
        for case in evidence["cases"].as_array().unwrap() {
            let field = case["field"].as_str().unwrap();
            if !matches!(
                field,
                "enabled" | "master" | "music_enabled" | "music" | "background_sound" | "limiter"
            ) {
                continue;
            }
            let key = case["key"].as_str().unwrap();
            let input = case["input"].as_str().unwrap();
            let settings = Settings::read(|name| name.eq_ignore_ascii_case(key).then_some(input));
            let expected_bytes = case["native_bits_le"].as_str().unwrap();
            if matches!(field, "master" | "music") {
                let bytes: Vec<u8> = expected_bytes
                    .as_bytes()
                    .chunks(2)
                    .map(|pair| u8::from_str_radix(std::str::from_utf8(pair).unwrap(), 16).unwrap())
                    .collect();
                let expected = f32::from_le_bytes(bytes.try_into().unwrap());
                let actual = if field == "master" {
                    settings.master
                } else {
                    settings.music
                };
                assert!(
                    (actual.is_nan() && expected.is_nan())
                        || actual.to_bits() == expected.to_bits(),
                    "{case}"
                );
            } else {
                let actual = match field {
                    "enabled" => settings.enabled,
                    "music_enabled" => settings.music_enabled,
                    "background_sound" => settings.background,
                    "limiter" => settings.limiter,
                    _ => unreachable!(),
                };
                assert_eq!(
                    u8::from(actual),
                    u8::from_str_radix(expected_bytes, 16).unwrap(),
                    "{case}"
                );
            }
            checked += 1;
        }
        assert_eq!(checked, 36);
    }
}
