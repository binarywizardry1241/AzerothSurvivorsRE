//! 0.112.0 combat-summon projection, consumed by the exact embedded Lua API.
//! Native metadata includes the first matching talent's icon fallback; it is
//! independent of the historical gameplay descriptor representation.

use std::{borrow::Cow, sync::LazyLock};

use azeroth_survivors_re::run_effects::pets::{DREAD_LORD, MATRIARCH};
use serde::Deserialize;

use crate::{gameplay::mechanics::Mechanics, localization::Localization};

#[derive(Deserialize)]
struct Metadata {
    entry: u32,
    name: String,
    key: String,
    kind: String,
    icon: String,
}

static METADATA: LazyLock<Vec<Metadata>> = LazyLock::new(|| {
    serde_json::from_str(include_str!("../../../assets/addon-summons-0.112.0.json"))
        .expect("recovered 0.112.0 summon metadata")
});

pub(super) fn snapshot(game: &Mechanics, locale: &Localization) -> String {
    game.addon_summons()
        .into_iter()
        .map(|row| {
            let (key, name, kind, icon) = if row.entry == MATRIARCH.entry {
                // The 0.140.0 formatter prefixes the explicit icon.
                // Special 0 selects the "pet" kind.
                let icon = MATRIARCH.icon.expect("Matriarch descriptor icon");
                (MATRIARCH.key, MATRIARCH.name, "pet", Cow::Owned(format!("Interface\\Icons\\{icon}")))
            } else {
                let metadata = METADATA.iter().find(|metadata| metadata.entry == row.entry)
                    .expect("native combat-summon descriptor");
                let (key, name) = if row.entry == DREAD_LORD.entry {
                    (DREAD_LORD.key, DREAD_LORD.name)
                } else {
                    (metadata.key.as_str(), metadata.name.as_str())
                };
                (key, name, metadata.kind.as_str(), Cow::Borrowed(metadata.icon.as_str()))
            };
            // This producer cleans only list delimiters in the translated name.
            let name = locale.label(name).replace([',', ';'], " ");
            format!(
                "{},{},{},{},{:.1},{:.1},{},{}",
                row.id, row.entry, key, kind,
                row.ends, row.duration, icon, name,
            )
        })
        .collect::<Vec<_>>()
        .join(";")
}

/// AZSTOTEMS is independent of AZSPETS and reads the actual selected hero.
/// Formatting/grouping contract: addon-affixes-totems-0.125.0.md; the current
/// population cap is shared with its creation/eviction owner under #13.
pub(super) fn totems(game: &Mechanics, locale: &Localization) -> String {
    game.addon_totems().into_iter().map(|row| {
        let definition = row.captured.definition;
        let name = locale.lookup(&format!("ability.{}.name", definition.key))
            .unwrap_or(definition.name).replace([',', ';'], " ");
        format!("{},{},{},{},{:.1},{:.1},Interface\\Icons\\{},{}",
            definition.key, definition.spell_id, row.count,
            azeroth_survivors_re::player_abilities::behavior::totems::KIND_LIMIT,
            row.ends, azeroth_survivors_re::player_abilities::damage::scaled_duration(&row.captured),
            definition.icon, name)
    }).collect::<Vec<_>>().join(";")
}
