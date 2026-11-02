//! Project the existing game/terminal owners into the current presence inputs.
//! Game JSON owner145928330 supplies first live boss, grouped damage rows and
//! the total damage scalar separately; activity formatting remains discord.rs.
use super::{
    terminal::{Outcome, TerminalState},
    RunSession,
};
use crate::{
    catalog::MenuCatalog, discord::RunSnapshot, localization::Localization, menu_state::MenuState,
};
use bevy::prelude::*;
use serde_json::{json, Value};

// Native1458e6790/1458edff0 serializes finite floating scalars to three
// decimals before the custom UI parses JSON. Discord consumes those parsed values.
fn serialized(value: f64) -> f64 {
    if !value.is_finite() || value == 0.0 {
        return 0.0;
    }
    format!("{value:.3}").parse().unwrap_or(0.0)
}

pub(super) fn snapshot(
    menu: Res<MenuState>,
    session: Res<RunSession>,
    terminal: Res<TerminalState>,
    catalog: Res<MenuCatalog>,
    locale: Res<Localization>,
    mut snapshot: ResMut<RunSnapshot>,
) {
    let Some(game) = session.mechanics.as_ref().filter(|_| menu.in_run) else {
        // Ready/restart and Logout own the frontend snapshot lifetime. An
        // absent replacement Game does not withdraw the old Discord activity.
        return;
    };
    snapshot.in_run = true;
    let class = catalog.classes.iter().find(|row| row.key == game.class.key);
    let race = catalog
        .races
        .get(usize::from(game.stats.native_race.saturating_sub(1)));
    let zone = catalog.zones.iter().find(|row| row.key == game.zone.key);
    if snapshot.entry.is_none() {
        snapshot.entry = Some(json!({
            "class":class.map_or("",|row|row.name.as_str()),
            "race":race.map_or("",|row|row.name.as_str()),
            "hero":session.name,
            "bg":zone.map_or("",|row|row.name.as_str()),
            "subtitle":zone.map_or("",|row|row.subtitle.as_str()),
        }));
    }
    let boss = game.bosses.iter().find(|boss| !boss.actor.dead).map(|boss| {
        let key = format!("boss.{}.name",boss.definition.id);
        let name = locale.label(&key);
        json!({"name":if name == key {boss.definition.name} else {name},"hp":serialized(f64::from(boss.health.max(0.0))),"hpMax":serialized(f64::from(boss.maximum_health))})
    });
    let dealt = game
        .damage_meter()
        .iter()
        .fold(-0.0_f64, |sum, row| sum + row.total)
        .round();
    let mut meters: Vec<(String, bool, f64)> = Vec::new();
    for row in game.damage_meter() {
        let name = super::addon_meters::source_name(row.source, &locale);
        if let Some(previous) = meters
            .iter_mut()
            .find(|previous| previous.0 == name && previous.1 == row.source.talent)
        {
            previous.2 += row.total;
        } else {
            meters.push((name, row.source.talent, row.total));
        }
    }
    // The shared custom definition serializes the ordered accounting rows;
    // native activity scans these values itself (including its last-equal tie).
    meters.sort_by(|left, right| right.2.total_cmp(&left.2));
    snapshot.live = Some(json!({
        "phase":super::client::presence_phase(&session), "level":game.level,"kills":game.kills,
        "time":serialized(f64::from(game.clock)),"dealt":dealt,"endless":game.rules.endless,
        "boss":boss,"meter":meters.into_iter().map(|(name,_,dmg)|json!({"name":name,"dmg":dmg.round()})).collect::<Vec<Value>>(),
    }));
    snapshot.terminal = terminal.summary.as_ref().map(|summary| {
        json!({
            "type":if summary.outcome == Outcome::Victory {"victory"} else {"defeat"},
            "level":summary.level,"kills":summary.kills,
        })
    });
}
