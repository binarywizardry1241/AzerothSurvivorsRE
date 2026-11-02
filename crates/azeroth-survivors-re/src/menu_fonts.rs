//! Runtime font supply and script fallback for the selected Azeroth Survivors text paths.
//! Font bytes are user-supplied data; source builds do not read the reference executable.
//! Native Friz/Morpheus are Cyrillic variants with the recovered Czech/Polish/Romanian/Ukrainian augmentation.
//! See docs/analysis/menu-localization-0.97.2.md for the supply contract and evidence limits.

#[path = "font_patch.rs"]
mod font_patch;

use bevy::{prelude::*, text::CosmicFontSystem};
use std::path::PathBuf;

pub fn directory() -> Option<PathBuf> {
    std::env::var_os("AZS_FONT_DIR").map(PathBuf::from)
}

/// Load the native font path from the explicit font directory, otherwise the user's MPQ chain.
/// As in the native provider, patch failure retains the original bytes and reports the error.
pub fn read_font(chain: &mut benilla_formats::Chain, name: &str) -> Result<Vec<u8>, String> {
    let filename = name
        .rsplit(['\\', '/'])
        .next()
        .unwrap_or(name)
        .to_ascii_uppercase();
    let bytes = if let Some(path) = directory()
        .map(|directory| directory.join(&filename))
        .filter(|path| path.is_file())
    {
        std::fs::read(&path).map_err(|error| format!("{}: {error}", path.display()))?
    } else {
        chain.read_file(name).map_err(|error| error.to_string())?
    };
    if matches!(filename.as_str(), "FRIZQT__.TTF" | "MORPHEUS.TTF") {
        match font_patch::augment(bytes.clone()) {
            Ok(patched) => Ok(patched),
            Err(error) => {
                warn!("Native accent augmentation of {filename} failed: {error}");
                Ok(bytes)
            }
        }
    } else {
        Ok(bytes)
    }
}

// 0.127.0 14027c320 classifies text in this order. Kana's half-width
// range overlaps the full-width Chinese range, so precedence is significant.
const CJK_FONTS: [(&str, &str, &[(u32, u32)]); 3] = [
    ("ko", "AZS_KR.TTF", &[(0x1100, 0x11ff), (0x3130, 0x318f), (0xac00, 0xd7a3)]),
    ("ja", "AZS_JP.TTF", &[(0x3040, 0x30ff), (0x31f0, 0x31ff), (0xff66, 0xff9f)]),
    ("zh", "AZS_SC.TTF", &[(0x3000, 0x303f), (0x3400, 0x4dbf), (0x4e00, 0x9fff),
        (0xf900, 0xfaff), (0xff00, 0xffef)]),
];
fn cjk_locale(ch: char) -> Option<&'static str> {
    CJK_FONTS.iter().find(|(_, _, ranges)| ranges.iter()
        .any(|&(first, last)| (first..=last).contains(&(ch as u32))))
        .map(|&(code, _, _)| code)
}

#[derive(Resource, Default)]
struct Registration {
    full_cjk_attempted: Vec<&'static str>,
}

pub struct MenuFontsPlugin;
impl Plugin for MenuFontsPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<Registration>()
            .add_systems(Startup, register_autonyms)
            .add_systems(Startup, register_framexml
                .in_set(benilla_app::font_overrides::FontOverridesSet))
            .add_systems(PostUpdate, register_cjk.before(bevy::ui::UiSystems::Content));
    }
}
fn register(system: &mut CosmicFontSystem, filenames: &[&str]) {
    let Some(directory) = directory() else {
        return;
    };
    for filename in filenames {
        let path = directory.join(filename);
        match std::fs::read(&path) {
            Ok(bytes) => match Font::try_from_bytes(bytes) {
                Ok(font) => {
                    system.0.db_mut().load_font_data((*font.data).clone());
                }
                Err(error) => warn!("Native font {} is invalid: {error}", path.display()),
            },
            Err(error) => warn!("Native font {} is unavailable: {error}", path.display()),
        }
    }
}
fn register_autonyms(mut system: ResMut<CosmicFontSystem>) {
    // Current14029bc00 inserts these exact three autonym payloads before
    // the active locale's full font, through14028a590.
    register(
        &mut system,
        &["AZS_NAMES_SC.TTF", "AZS_NAMES_JP.TTF", "AZS_NAMES_KR.TTF"],
    );
}
fn register_cjk(
    locale: Res<crate::localization::Localization>,
    mut state: ResMut<Registration>,
    mut system: ResMut<CosmicFontSystem>,
    text: Query<&Text>,
    spans: Query<&TextSpan>,
) {
    let mut requested = Vec::new();
    if CJK_FONTS.iter().any(|&(code, _, _)| code == locale.code()) {
        requested.push(locale.code());
    }
    // Current14029b2b0 also requests full faces from the text being displayed,
    // independently of the UI language. Keep each successful registration alive.
    for value in text.iter().map(|text| text.0.as_str())
        .chain(spans.iter().map(|span| span.0.as_str())) {
        for code in value.chars().filter_map(cjk_locale) {
            if !requested.contains(&code) { requested.push(code); }
        }
    }
    for code in requested {
        if state.full_cjk_attempted.contains(&code) { continue; }
        state.full_cjk_attempted.push(code);
        let &(_, filename, _) = CJK_FONTS.iter().find(|&&(value, _, _)| value == code).unwrap();
        register(&mut system, &[filename]);
    }
}

/// Supply the same augmented user fonts to the real FrameXML renderer before its first frame.
/// It retains its client font metrics/layout and only replaces matching file bytes.
fn register_framexml(mut commands: Commands) {
    let Some(directory) = crate::assets::data_directory() else {
        return;
    };
    let Ok(mut chain) = benilla_formats::open_chain(&directory) else {
        return;
    };
    let mut overrides = benilla_app::font_overrides::FontOverrides::default();
    for path in [
        "Fonts\\FRIZQT__.TTF",
        "Fonts\\MORPHEUS.TTF",
        "Fonts\\SKURRI.TTF",
    ] {
        if let Ok(bytes) = read_font(&mut chain, path) {
            overrides.insert(path, bytes);
        }
    }
    // The real FrameXML engine owns a separate font database. Supply these
    // faces there as explicit script fallbacks; it opens one on its first miss.
    for &(_, filename, ranges) in &CJK_FONTS {
        let path = format!("Fonts\\{filename}");
        if let Ok(bytes) = read_font(&mut chain, &path) {
            overrides.insert_fallback(&path, bytes, ranges);
        }
    }
    commands.insert_resource(overrides);
}

#[cfg(test)]
mod tests {
    use super::cjk_locale;
    #[test]
    fn mixed_text_requests_each_native_script_independently_of_ui_locale() {
        let requested: Vec<_> = "Empty slot 拉m佐 한국 カナ ｶﾅ".chars().filter_map(cjk_locale).collect();
        assert!(requested.contains(&"zh"));
        assert!(requested.contains(&"ko"));
        assert!(requested.contains(&"ja"));
        assert_eq!(cjk_locale('m'), None);
        assert_eq!(cjk_locale('ｶ'), Some("ja"));
        assert_eq!(cjk_locale('Ａ'), Some("zh"));
        assert_eq!(cjk_locale('𠀀'), None, "the selected classifier has no supplementary Han range");
    }
}
