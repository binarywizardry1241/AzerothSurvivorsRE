//! Exact 0.105.0 character-pane extension over the real FrameXML widgets.
use crate::localization::Localization;

const SOURCE: &str = include_str!("../../../../../docs/analysis/evidence/0.105.0/run-stats/character-pane.lua");
const MANIFEST: &str = include_str!("../../../../../docs/analysis/evidence/0.105.0/run-stats/manifest.json");

pub(super) fn source(locale: Option<&Localization>) -> String {
    let mut source = SOURCE.to_owned();
    if let Some(locale) = locale {
        let metadata: serde_json::Value = serde_json::from_str(MANIFEST).expect("native Run Stats manifest");
        for label in metadata["labels"].as_array().expect("native localized literals") {
            let english = label.as_str().expect("native literal");
            source = source.replace(
                &serde_json::to_string(english).unwrap(),
                &serde_json::to_string(locale.label(english)).unwrap(),
            );
        }
    }
    // The embedding's postlude runs after the stock frame's OnLoad. The native
    // wrapper registers this event during OnLoad; register its existing frame
    // here too, so the first AZS payload and every ReloadUI reach the panel.
    source.push_str("\nif PaperDollFrame then PaperDollFrame:RegisterEvent('CHAT_MSG_ADDON'); end\n");
    source
}
