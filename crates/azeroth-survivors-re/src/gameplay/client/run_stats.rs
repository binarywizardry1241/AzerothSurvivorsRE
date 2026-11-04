//! Recovered character-pane extension installed with the stock FrameXML chunk.
use benilla_app::local_client::LocalClientExtension;

use crate::localization::Localization;

const PATH: &str = r"Interface\FrameXML\PaperDollFrame.lua";
const SOURCE: &str =
    include_str!("../../../../../docs/analysis/evidence/0.139.1/paperdoll-run-stats.lua");
const MANIFEST: &str =
    include_str!("../../../../../docs/analysis/evidence/0.105.0/run-stats/manifest.json");
const EXTRA_LABELS: [&str; 3] = [
    "Worn gear: ",
    "Stormguard: +%.0f%% Damage Reduction (Active)",
    "Stormguard: +%.0f%% Damage Reduction (Inactive)",
];

pub(super) fn configure(extension: &mut LocalClientExtension, locale: &Localization) {
    let payload = source(locale);
    if let Some((_, current)) = extension
        .framexml_appends
        .iter_mut()
        .find(|row| row.0 == PATH)
    {
        *current = payload;
    } else {
        extension.framexml_appends.push((PATH.into(), payload));
    }
}

fn source(locale: &Localization) -> String {
    let metadata: serde_json::Value =
        serde_json::from_str(MANIFEST).expect("native Run Stats manifest");
    let labels = metadata["labels"]
        .as_array()
        .expect("native localized literals")
        .iter()
        .map(|label| label.as_str().expect("native literal"))
        .chain(EXTRA_LABELS);
    let mut source = SOURCE.to_owned();
    for label in labels {
        source = source.replace(
            &serde_json::to_string(label).unwrap(),
            &serde_json::to_string(locale.label(label)).unwrap(),
        );
    }
    source
}
