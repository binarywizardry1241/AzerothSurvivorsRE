//! Exact 0.105.0 character-pane extension over the real FrameXML widgets.
use crate::localization::Localization;

const SOURCE: &str = include_str!("../../../../../docs/analysis/evidence/0.105.0/run-stats/character-pane.lua");
const MANIFEST: &str = include_str!("../../../../../docs/analysis/evidence/0.105.0/run-stats/manifest.json");
const ENHANCEMENT_SOURCE: &str =
    include_str!("../../../../../docs/analysis/evidence/0.139.1/paperdoll-run-stats.lua");
const STORMGUARD_LABELS: [&str; 2] = [
    "Stormguard: +%.0f%% Damage Reduction (Active)",
    "Stormguard: +%.0f%% Damage Reduction (Inactive)",
];

pub(super) fn source(locale: Option<&Localization>) -> String {
    let mut source = SOURCE.to_owned();
    let helper = "function AZS_Stormguard(s)";
    let update = "function AZS_Update()";
    let (_, enhancement) = ENHANCEMENT_SOURCE.split_once(helper)
        .expect("retained Stormguard character-pane helper");
    let (body, _) = enhancement.split_once(update)
        .expect("retained Stormguard helper boundary");
    let at = source.find(update).expect("retained character-pane update owner");
    source.insert_str(at, &format!("{helper}{body}"));
    source = source.replacen("..AZS_Gear(s.garm,", "..AZS_Stormguard(s)\n\t\t..AZS_Gear(s.garm,", 1);
    if let Some(locale) = locale {
        let metadata: serde_json::Value = serde_json::from_str(MANIFEST).expect("native Run Stats manifest");
        for label in metadata["labels"].as_array().expect("native localized literals") {
            let english = label.as_str().expect("native literal");
            source = source.replace(
                &serde_json::to_string(english).unwrap(),
                &serde_json::to_string(locale.label(english)).unwrap(),
            );
        }
        for label in STORMGUARD_LABELS {
            source = source.replace(
                &serde_json::to_string(label).unwrap(),
                &serde_json::to_string(locale.label(label)).unwrap(),
            );
        }
    }
    // The embedding's postlude runs after the stock frame's OnLoad. The native
    // wrapper registers this event during OnLoad; register its existing frame
    // here too, so the first AZS payload and every ReloadUI reach the panel.
    source.push_str("\nif PaperDollFrame then PaperDollFrame:RegisterEvent('CHAT_MSG_ADDON'); end\n");
    source
}
