//! Publish the seated hero's addon snapshot through the host's recipient feed.

use azeroth_survivors_re::enemies::Position;

use crate::{gameplay::mechanics::Mechanics, localization::Localization};

use super::{
    BridgeCatalog, addon_feed::AddonMessage, addon_messages, addon_scalars,
};

pub(in crate::gameplay) fn recipient_addon_snapshot(
    game: &Mechanics,
    name: &str,
    started: bool,
    paused: bool,
    (position, facing, target): (Position, f32, Option<u64>),
    locale: &Localization,
    catalog: &BridgeCatalog,
) -> Vec<AddonMessage> {
    let Some(scalars) = addon_scalars::snapshot_for(
        game,
        name,
        addon_scalars::phase_for(game, started, paused),
        addon_scalars::Inputs { position, facing, target },
        locale,
    ) else {
        return Vec::new();
    };
    let party = game.localized_party_snapshot(locale);
    let slot = game.party_slot(game.player_guid).unwrap_or(0);
    addon_messages(game, scalars, locale, catalog, [
        party.meter_payload(game.clock),
        party.revive_payload(usize::from(slot), started && game.party_shared_running()),
    ])
}
